PRAGMA foreign_keys = OFF;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS product_categories;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    description TEXT,
    current_price INTEGER
);
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT
);
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT UNIQUE,
    password_hash TEXT
);
CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    sub_total INTEGER,
    tax_total INTEGER,
    shipping_total INTEGER,
    grand_total INTEGER,
    status TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id)
);
CREATE TABLE order_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER,
    product_id INTEGER,
    unit_price INTEGER,
    quantity INTEGER,
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);
CREATE TABLE product_categories (
    product_id INTEGER,
    category_id INTEGER,
    FOREIGN KEY(product_id) REFERENCES products(id),
    FOREIGN KEY(category_id) REFERENCES categories(id),
    PRIMARY KEY (product_id, category_id)
);
PRAGMA foreign_keys = ON;

INSERT INTO categories (name) 
VALUES ('Clothing'), ('Electronics');

INSERT INTO products (name, description, current_price) 
VALUES  ('Shirt', 'This is a shirt', 1299), 
        ('Speaker', 'It produces music', 4999),
        ('Denim Jeans', 'Jeans', 4999),
        ('4K Monitor', 'Ultra HD display', 34900),
        ('Wool Hoodie', 'Good for winter', 3550),
        ('Mechanical Keyboard', 'RGB backlit clicky switches', 8999),
        ('Smart Watch', 'Tracks steps and heart rate', 19900);

INSERT INTO product_categories (product_id, category_id) 
VALUES (1, 1), (2, 2), (3, 1), (4, 2), (5, 1), (6, 2), (7, 2);