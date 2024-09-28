# Urlify
This project is a URL shortening service that allows users to convert long URLs into short, shareable links. It includes features for bulk URL shortening via Excel file uploads, user authentication, and analytics.

## Features

- Shorten individual URLs
- Bulk URL shortening from Excel files
- User authentication and session management
- View and manage shortened URLs
- QR code generation for shortened URLs
- Analytics for tracking URL usage

## Screenshots
**Dashboard**
![Screenshot 2024-09-28 120854](https://github.com/user-attachments/assets/7b3032fc-60a8-43f0-9ebf-5c1ee5dc27cf)

**Url Shortener Page**
![Screenshot 2024-09-28 121109](https://github.com/user-attachments/assets/806dbf65-5780-464c-a87b-5d2a3edecdb7)

**Analytics**
![Screenshot 2024-09-28 121525](https://github.com/user-attachments/assets/07713b23-3889-4c59-939c-1aae1a861718)

**UTM Builder**
![Screenshot 2024-09-28 121629](https://github.com/user-attachments/assets/8966b58c-df46-4914-8edf-aaf42c61cc3c)

**QR Code - Create Page**
![Screenshot 2024-09-28 121657](https://github.com/user-attachments/assets/4d331d6f-de02-4aba-87af-39f6a012bce5)
![Screenshot 2024-09-28 121711](https://github.com/user-attachments/assets/428186e7-3528-4a1e-9855-db8794ff0da3)

**QR Code - Management Page**
![Screenshot 2024-09-28 121725](https://github.com/user-attachments/assets/b573d751-b895-4080-a654-e190b37a5aaa)


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
