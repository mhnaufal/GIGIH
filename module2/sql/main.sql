CREATE TABLE categories (id INTEGER, name VARCHAR(50));
INSERT INTO categories (id, name) VALUES (1, 'food');

DROP TABLE categories;
CREATE TABLE categories (id INTEGER NOT NULL PRIMARY KEY, name VARCHAR(50));

CREATE TABLE items (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50) DEFAULT NULL,
  price REAL DEFAULT 0
);

CREATE TABLE item_categories (
item_id INT,
category_id INT
);

INSERT INTO items (id, name, price) VALUES 
(1, 'Nasi Goreng', 25000);

INSERT INTO items (id, name) VALUES 
(2, 'Air Putih');

INSERT INTO items VALUES 
(3, 'Spaghetti', 40000),
(4, 'Green Tea Latte', 18000);

INSERT INTO items (name, price) VALUES 
('Orange Juice', 15000),
('Vanilla Ice Cream', 13000),
('Cordon Bleu', 36000),
('French Fries', 20000),
('Mango Juice', 15000);

UPDATE items SET name = 'Nasi Goreng Gila' where id = 1;
UPDATE items SET name = 'Ice Water', price = 2000 where id = 2;

DELETE FROM items WHERE name = 'Mango Juice';

INSERT INTO categories (name) VALUES 
('main dish'), 
('beverage'), 
('dessert');

INSERT INTO item_categories (item_id, category_id) VALUES 
(1, 1), 
(2, 2), 
(3, 1),
(3, 1), 
(4, 2), 
(5, 2), 
(6, 3), 
(7, 1);

-- ~###################################################################~
-- .mode markdown
-- pragma table_info('items');
-- .mode markdown
-- pragma table_info('categories');
-- .mode markdown
-- pragma table_info('item_categories');
-- SELECT * FROM items;
-- SELECT * FROM categories;
-- ~###################################################################~

-- EXERCISE
SELECT "                        -EXERCISE-                      ";

-- [1]
SELECT "~11111111111111111111111111111111111111111111111111111111~";
SELECT * FROM items LEFT JOIN item_categories ON items.id = item_categories.item_id JOIN categories ON item_categories.category_id = categories.id;
SELECT "";

-- [2]
SELECT "~2222222222222222222222222222222222222222222222222222222~";
SELECT items.id, items.name FROM items LEFT JOIN item_categories ON items.id = item_categories.item_id LEFT JOIN categories ON item_categories.category_id = categories.id WHERE categories.name LIKE 'main dish';
SELECT "";

-- [3]
SELECT "~3333333333333333333333333333333333333333333333333333333~";
SELECT items.id, items.name, items.price FROM items LEFT JOIN item_categories ON items.id = item_categories.item_id LEFT JOIN categories ON item_categories.category_id = categories.id WHERE categories.name LIKE 'main dish' AND items.price > 30000;
SELECT "";

-- [4]
SELECT "~4444444444444444444444444444444444444444444444444444444~";
SELECT * FROM items LEFT JOIN item_categories ON items.id = item_categories.item_id LEFT JOIN categories ON item_categories.category_id = categories.id WHERE item_categories.category_id IS NULL;
SELECT "";

-- [5]
SELECT "~555555555555555555555555555555555555555555555555555555~";

SELECT "";
SELECT "";

-- ~###################################################################~
-- HOMEWORK
-- how to set the relationship in Sqlite

-- [1]
SELECT "                        -HOMEWORK-                      ";
SELECT "[1] DONE";
-- Customer
CREATE TABLE customers (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  phone VARCHAR(15) UNIQUE,
  address TEXT
);
-- User
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username VARCHAR(50) UNIQUE,
  password VARCHAR(50)
);
-- Order
CREATE TABLE orders (
  id INTEGER PRIMARY KEY,
  customer_id INT,
  total REAL DEFAULT 0,
  order_date DATE DEFAULT (datetime('now','localtime')),
  created_by INT
);
-- Order Detail
CREATE TABLE order_details (
  order_id INT,
  item_id INT,
  quantity INT DEFAULT 0,
  item_price REAL DEFAULT 0
);

SELECT "";

-- [2]
SELECT "[2] DONE";
-- Customer
INSERT INTO customers (name, phone, address) VALUES 
('Orang 1', '081234567890', 'Jl. Jalan 1'),
('Orang 2', '081234567891', 'Jl. Jalan 2'),
('Orang 3', '081234567892', 'Jl. Jalan 3'),
('Orang 4', '081234567893', 'Jl. Jalan 4'),
('Orang 5', '081234567894', 'Jl. Jalan 5');
-- User
INSERT INTO users (username, password) VALUES 
('user 1', '123321'),
('user 2', '456654'),
('user 3', '789987'),
('user 4', '321123'),
('user 5', '654456');
-- Order
INSERT INTO orders (customer_id, total, created_by) VALUES 
(1, 6000, 2),
(2, 160000, 1),
(3, 18000, 2),
(4, 41000, 3),  -- orange juice + vanilla ice cream
(5, 25000, 1);
-- Order Detail
INSERT INTO order_details (order_id, item_id, quantity, item_price) VALUES 
(1, 2, 3, 2000),
(2, 3, 4, 40000),
(3, 4, 2, 18000),
(4, 5, 1, 15000), -- orange juice
(4, 6, 2, 13000), -- vanilla ice cream
(5, 1, 1, 25000);

SELECT "";

-- [3]
SELECT "[3] DONE";
SELECT orders.id, orders.order_date, customers.name, customers.phone, orders.total, GROUP_CONCAT(items.name, ', ')
FROM orders 
JOIN customers ON orders.customer_id = customers.id 
JOIN order_details ON orders.id = order_details.order_id 
JOIN items ON order_details.item_id = items.id
GROUP BY (order_details.order_id);

SELECT "";
