# Urlify
This project is a URL shortening service that allows users to convert long URLs into short, shareable links. It includes features for bulk URL shortening via Excel file uploads, user authentication, and analytics.

## Features

- Shorten individual URLs
- Bulk URL shortening from Excel files
- User authentication and session management
- View and manage shortened URLs
- QR code generation for shortened URLs
- Analytics for tracking URL usage

## Technologies Used

- **Backend**: Flask
- **Database**: MySQL
- **Frontend**: HTML, CSS, JavaScript (jQuery)
- **Libraries**:
  - Flask-MySQLdb for MySQL integration
  - Pandas for handling Excel files
  - Pillow for image processing
  - QRCode for generating QR codes
  - Requests for making HTTP requests

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/imvks786/Urlify.git
   cd Urlify
   ```

2. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

3. Install the required packages:
   ```bash
   pip install -r requirements.txt
   ```

4. Set up your MySQL database and update the database configuration in `app.py`.

5. Run the application:
   ```bash
   python app.py
   ```

6. Open your browser and go to `http://localhost:5000`.

## Usage

- Navigate to the home page to start shortening URLs.
- Use the bulk URL shortening feature to upload an Excel file containing links.
- Manage your shortened URLs and view analytics.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or features.
