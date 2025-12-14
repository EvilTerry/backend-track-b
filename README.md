# E-Commerce Backend track B
This is a case assignment.

The requirements:
- Database Schema
    - Tables
        - Products
        - Categories
        - Users
        - Orders
        - Order_items
    - Reasonable normalization
- GET /products endpoint
    - Returns a list of products from a real database
    - Supports basic query params
        - Search (Name)
        - Category filter
        - pagination

## How to run

### Prerequisites
- Node.js
- npm

### Installation
Install the dependencies defined in `package.json`, so run
```
npm install
```

### Running server
You can start the server in dev mode or standard.

#### Dev
```
npm run dev
```

### Standard
```
npm start
```

The server will start at: `http://localhost:3000`

### Database config
No manual steps required, on the first run it will generate the db file and seed it with dummy data.

### Example URLs
- Get all: `http://localhost:3000/api/products`
- Search: `http://localhost:3000/api/products?search=ea`
- Filter: `http://localhost:3000/api/products?category=Electronics`
- Pagination: `http://localhost:3000/api/products?page=1&page_size=5`