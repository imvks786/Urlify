from flask import Flask, request, send_file, render_template, redirect, jsonify, session, flash, url_for, abort
from flask_mysqldb import MySQL
import MySQLdb.cursors
import json
import random
import string
import uuid
from datetime import datetime, timedelta
import requests
from PIL import Image
import base64
from io import BytesIO
import qrcode
import io
import pandas as pd

app = Flask(__name__)
# MySQL configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'  # default phpMyAdmin user
app.config['MYSQL_PASSWORD'] = ''  # default password is often empty
app.config['MYSQL_DB'] = 'url_shortener'  # replace with your database name

# Initialize MySQL
mysql = MySQL(app)

app.secret_key = 'your_secret_key_here'  # Add this line for session management

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/home')
def home():
    return render_template('home.html')

@app.route('/custom_landing')
def custom_landing():
    return render_template('custom_landing.html')


@app.route('/add_url')
def add_url():
    if 'user' not in session:
        return redirect(url_for('login'))
    
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute("SELECT short_code, long_url, created_at FROM urls WHERE username = %s ORDER BY created_at DESC", (session['user'],))
    user_urls = cur.fetchall()
    cur.close()
    
    return render_template('add_url.html', user_urls=user_urls)

@app.route('/analytics')
def analytics():
    return render_template('analytics.html')


@app.route('/bulks')
def bulks():
    return render_template('bulk_short.html')


@app.route('/link')
def link():
    return render_template('link.html')


@app.route('/qr_code', methods=['GET', 'POST'])
def qr_code():
    if 'user' not in session:
        return redirect(url_for('login'))

    qr_id = request.args.get('edit', None)
    qr_data = None

    if qr_id:
        # Fetch the QR code data if we're editing an existing one
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM qr_codes WHERE id = %s AND created_by = %s", (qr_id, session['user']))
        qr_data = cur.fetchone()
        cur.close()

        if not qr_data:
            flash('QR code not found or you do not have permission to edit it.', 'error')
            return redirect(url_for('my_qr_codes'))

        if qr_data and 'settings' in qr_data:
            try:
                qr_data['settings'] = json.loads(qr_data['settings'])
            except json.JSONDecodeError:
                qr_data['settings'] = {}  # Set to empty object if JSON is invalid

    return render_template('qr_code.html', qr_data=qr_data)

def generate_short_code(length=6):
    characters = string.ascii_letters + string.digits
    return ''.join(random.choice(characters) for _ in range(length))

def generate_temp_username():
    base_username = 'guest_user'
    random_part = str(uuid.uuid4())[:8]
    return f"{base_username}_{random_part}"

@app.route('/CREATE_URL', methods=['POST'])
def create_url():
    if request.method == 'POST':
        long_url = request.form['long_url']
        short_code = generate_short_code()

        cur = mysql.connection.cursor()

        if 'user' in session:
            username = session['user']
            cur.execute("INSERT INTO urls (long_url, short_code, username) VALUES (%s, %s, %s)",
                        (long_url, short_code, username))
        else:
            temp_username = generate_temp_username()
            cur.execute("INSERT INTO guest (long_url, short_code, temp_user) VALUES (%s, %s, %s)",
                        (long_url, short_code, temp_username))

        mysql.connection.commit()
        cur.close()

        short_url = f"http://localhost:5000/r?{short_code}"
        return jsonify({'short_url': short_url}), 200

    return jsonify({'error': 'Method not allowed'}), 405

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))
        user = cur.fetchone()
        cur.close()
        
        if user:
            session['user'] = username
            return redirect('/')
        else:
            flash('Invalid username or password', 'error')
            return redirect('/login')
    
    return render_template('login.html')

@app.context_processor
def inject_user():
    return dict(session=session)

@app.route('/logout')
def logout():
    session.pop('user', None)
    flash('You have been logged out successfully', 'success')
    return redirect(url_for('index'))

@app.route('/account')
def account():
    if 'user' not in session:
        return redirect(url_for('login'))
    
    # Here you would typically fetch user data from the database
    # For now, we'll just pass the username
    return render_template('account.html', username=session['user'])

@app.route('/r/<short_code>')
def redirector(short_code):
    if not short_code:
        abort(404)  # If no short code is provided, return a 404 error
    
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute("SELECT long_url FROM urls WHERE short_code = %s", (short_code,))
    result = cur.fetchone()
    cur.close()
    
    if result:
        return render_template('r.html', url=result['long_url'], short_code=short_code)
    else:
        abort(404)  # If the short code is not found in the database, return a 404 error

@app.route('/store', methods=['POST'])
def store_event():
    data = request.json
    
    cur = mysql.connection.cursor()
    cur.execute("""
        INSERT INTO user_activity (
            short_code, datetime_utc, ip_address, timezone, user_time,
            language, browser, user_agent, platform, referring_url,
            host_name, screen_size, orientation, color_scheme, hdr,
            touch_screen, gpu
        ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """, (
        data['shortCode'], datetime.utcnow(), request.remote_addr,
        data['timezone'], data['userTime'], data['language'],
        data['browser'], data['userAgent'], data['platform'],
        data['referringUrl'], request.host, data['screenSize'],
        data['orientation'], data['colorScheme'], data['hdr'],
        data['touchScreen'], data['gpu']
    ))
    mysql.connection.commit()
    cur.close()
    
    return jsonify({"status": "success"}), 200

@app.route('/get_analytics_data')
def get_analytics_data():
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    
    # Fetch data for the last 7 days
    seven_days_ago = datetime.utcnow() - timedelta(days=7)
    cur.execute("""
        SELECT DATE(datetime_utc) as date, COUNT(*) as count
        FROM user_activity
        WHERE datetime_utc >= %s
        GROUP BY DATE(datetime_utc)
        ORDER BY date
    """, (seven_days_ago,))
    daily_activity = cur.fetchall()
    
    # Fetch browser data
    cur.execute("""
        SELECT browser, COUNT(*) as count
        FROM user_activity
        GROUP BY browser
        ORDER BY count DESC
        LIMIT 5
    """)
    browser_data = cur.fetchall()
    
    # Fetch platform data
    cur.execute("""
        SELECT platform, COUNT(*) as count
        FROM user_activity
        GROUP BY platform
        ORDER BY count DESC
        LIMIT 5
    """)
    platform_data = cur.fetchall()
    
    # Fetch top locations data
    cur.execute("""
        SELECT ip_address, COUNT(*) as count
        FROM user_activity
        GROUP BY ip_address
        ORDER BY count DESC
        LIMIT 10
    """)
    location_data = cur.fetchall()


    # Fetch total click count for each link
    cur.execute("""
        SELECT u.short_code, u.long_url, COUNT(ua.id) as click_count
        FROM urls u
        LEFT JOIN user_activity ua ON u.short_code = ua.short_code
        GROUP BY u.short_code, u.long_url
        ORDER BY click_count DESC
        LIMIT 10
    """)
    link_click_data = cur.fetchall()


    # Use ip-api.com to get location details
    for item in location_data:
        ip = item['ip_address']
        response = requests.get(f'http://ip-api.com/json/{ip}?fields=country,city')
        if response.status_code == 200:
            location_info = response.json()
            item['location'] = f"{location_info.get('city', 'Unknown')}, {location_info.get('country', 'Unknown')}"
        else:
            item['location'] = 'Unknown'

    cur.close()
    
    return jsonify({
        'daily_activity': daily_activity,
        'browser_data': browser_data,
        'platform_data': platform_data,
        'location_data': location_data,
        'link_click_data': link_click_data 
    })

@app.route('/save_qr_code', methods=['POST'])
def save_qr_code():
    if 'user' not in session:
        return jsonify({"success": False, "message": "User not logged in"})

    data = request.json
    qr_code_data_url = data['qr_code']
    url = data['url']
    settings = json.dumps(data['settings'])
    user_id = session['user']

    # Remove the data URL prefix to get the base64 string
    base64_data = qr_code_data_url.split(',')[1]

    # Decode the base64 string to bytes
    image_data = base64.b64decode(base64_data)

    # Create an image from the bytes
    image = Image.open(BytesIO(image_data))

    # Save the image to a BytesIO object
    buffered = BytesIO()
    image.save(buffered, format="PNG")

    # Get the byte data from the BytesIO object
    img_byte_arr = buffered.getvalue()

    cur = mysql.connection.cursor()
    try:
        cur.execute("""
            INSERT INTO qr_codes (url, image_data, created_by, settings)
            VALUES (%s, %s, %s, %s)
        """, (url, img_byte_arr, user_id, settings))
        mysql.connection.commit()
        cur.close()
        return jsonify({"success": True})
    except Exception as e:
        mysql.connection.rollback()
        cur.close()
        return jsonify({"success": False, "message": str(e)})

@app.route('/update_qr_code', methods=['POST'])
def update_qr_code():
    if 'user' not in session:
        return jsonify({"success": False, "message": "User not logged in"})

    data = request.json
    qr_id = data['qr_id']
    qr_code_data_url = data['qr_code']
    url = data['url']
    settings = json.dumps(data['settings'])
    user_id = session['user']

    # Remove the data URL prefix to get the base64 string
    base64_data = qr_code_data_url.split(',')[1]

    # Decode the base64 string to bytes
    image_data = base64.b64decode(base64_data)

    # Create an image from the bytes
    image = Image.open(BytesIO(image_data))

    # Save the image to a BytesIO object
    buffered = BytesIO()
    image.save(buffered, format="PNG")

    # Get the byte data from the BytesIO object
    img_byte_arr = buffered.getvalue()

    cur = mysql.connection.cursor()
    try:
        cur.execute("""
            UPDATE qr_codes
            SET url = %s, image_data = %s, settings = %s
            WHERE id = %s AND created_by = %s
        """, (url, img_byte_arr, settings, qr_id, user_id))
        mysql.connection.commit()
        cur.close()
        return jsonify({"success": True})
    except Exception as e:
        mysql.connection.rollback()
        cur.close()
        return jsonify({"success": False, "message": str(e)})

@app.route('/my_qr_codes')
def my_qr_codes():
    if 'user' not in session:
        return redirect(url_for('login'))  # Redirect to login if user is not logged in

    user_id = session['user']
    
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute("""
        SELECT id, url, image_data, created_at 
        FROM qr_codes 
        WHERE created_by = %s 
        ORDER BY created_at DESC
    """, (user_id,))
    qr_codes = cur.fetchall()
    cur.close()

    # Convert binary image data to base64 for display in HTML
    for qr in qr_codes:
        qr['image_data'] = base64.b64encode(qr['image_data']).decode('utf-8')

    return render_template('my_qr_codes.html', qr_codes=qr_codes)

@app.route('/edit_qr_code/<int:qr_id>', methods=['GET', 'POST'])
def edit_qr_code(qr_id):
    if 'user' not in session:
        return redirect(url_for('login'))

    user_id = session['user']
    
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute("SELECT * FROM qr_codes WHERE id = %s AND created_by = %s", (qr_id, user_id))
    qr_code = cur.fetchone()
    cur.close()

    if not qr_code:
        flash('QR code not found or you do not have permission to edit it.', 'error')
        return redirect(url_for('my_qr_codes'))

    if request.method == 'POST':
        new_url = request.form['url']
        
        # Generate new QR code
        qr = qrcode.QRCode(version=1, box_size=10, border=5)
        qr.add_data(new_url)
        qr.make(fit=True)
        img = qr.make_image(fill_color="black", back_color="white")
        
        # Convert image to bytes
        img_byte_arr = io.BytesIO()
        img.save(img_byte_arr, format='PNG')
        img_byte_arr = img_byte_arr.getvalue()

        # Update database
        cur = mysql.connection.cursor()
        cur.execute("UPDATE qr_codes SET url = %s, image_data = %s WHERE id = %s", (new_url, img_byte_arr, qr_id))
        mysql.connection.commit()
        cur.close()

        flash('QR code updated successfully!', 'success')
        return redirect(url_for('my_qr_codes'))

    return render_template('edit_qr_code.html', qr_code=qr_code)

@app.route('/upload_excel', methods=['POST'])
def upload_excel():
    if 'user' not in session:
        return jsonify({"success": False, "message": "User not logged in"})

    if 'file' not in request.files:
        return jsonify({"success": False, "message": "No file uploaded"})

    file = request.files['file']
    
    if file.filename == '':
        return jsonify({"success": False, "message": "No file selected"})

    # Read the Excel file
    try:
        df = pd.read_excel(file)
        # Assuming the column with links is named 'Links'
        links = df['Links'].tolist()
        return jsonify({"success": True, "links": links})
    except Exception as e:
        return jsonify({"success": False, "message": str(e)})

@app.route('/process_links', methods=['POST'])
def process_links():
    if 'user' not in session:
        return jsonify({"success": False, "message": "User not logged in"})

    links = request.json.get('links', [])
    shortened_urls = []

    for long_url in links:
        short_code = generate_short_code()
        # Save to database logic here
        # Assuming you have a function to save the URL
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO urls (long_url, short_code, username) VALUES (%s, %s, %s)",
                    (long_url, short_code, session['user']))
        mysql.connection.commit()
        cur.close()
        shortened_urls.append(f"http://localhost:5000/r/{short_code}")

    return jsonify({"success": True, "shortened_urls": shortened_urls})

if __name__ == '__main__':
    app.run(debug=True)