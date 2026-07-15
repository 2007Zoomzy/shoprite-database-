CREATE DATABASE Shoprite;

USE Shoprite;

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    description TEXT
);

INSERT INTO Categories (category_name, description) VALUES
('Electronics', 'Devices and gadgets'),
('Books', 'Physical and digital books'),
('Clothing', 'Apparel for all ages'),
('Home & Kitchen', 'Household items and appliances'),
('Toys & Games', 'Children’s toys and games'),
('Sports', 'Sporting goods and equipment'),
('Beauty', 'Cosmetics and personal care'),
('Furniture', 'Home and office furniture'),
('Jewelry', 'Accessories and ornaments'),
('Automotive', 'Car parts and accessories');


CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(15, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES
('Samsung S25', 1, 1119984.00, 50),
('HP pavilion', 1, 2079984.00, 30),
('Chike in the river', 2, 31984.00, 100),
('Knives Set', 3, 23984.00, 200),
('Blender ', 4, 79984.00, 75),
('Playstation 5', 5, 47984.00, 60),
('Nike trainers', 6, 127984.00, 40),
('Lipstick Set', 7, 39984.00, 150),
('Office Chair', 8, 239984.00, 25),
('Necklace', 9, 143984.00, 20);


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);

INSERT INTO Customers (first_name, last_name, email, phone, address) VALUES
('Chukwuemeka', 'Okonkwo', 'chukwuemeka.okonkwo@email.com', '+2348031234567', ' Ahmadu Bello Street'),
('Ngozi', 'Adebayo', 'ngozi.adebayo@email.com', '+2348052345678', 'Yakubu Gowon Road'),
('Aisha', 'Ibrahim', 'aisha.ibrahim@email.com', '+2348093456789', ' Zaria Crescent'),
('Olumide', 'Okafor', 'olumide.okafor@email.com', '+2348074567890', 'Tafawa Balewa Avenue, Barkin Ladi'),
('Chinelo', 'Eze', 'chinelo.eze@email.com', '+2348025678901', 'Jos Road'),
('Tunde', 'Afolabi', 'tunde.afolabi@email.com', '+2348086789012', ' Murtala Mohammed Way'),
('Fatima', 'Yusuf', 'fatima.yusuf@email.com', '+2348047890123', ' Bauchi Street'),
('Emeka', 'Nwachukwu', 'emeka.nwachukwu@email.com', '+2348068901234', ' Lamingo Road'),
('Amaka', 'Ogunleye', 'amaka.ogunleye@email.com', '+2348090123456', ' Rayfield Avenue'),
('Sani', 'Bello', 'sani.bello@email.com', '+2348034567890', ' Shendam Road');


CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME NOT NULL,
    total_amount DECIMAL(15, 2) NOT NULL,
    status ENUM('Pending', 'Processing', 'Shipped', 'Delivered') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


INSERT INTO Orders (customer_id, order_date, total_amount, status) VALUES
(1, '2025-08-01 10:00:00', 1151968.00, 'Delivered'),
(2, '2025-08-02 12:30:00', 2159968.00, 'Shipped'),
(3, '2025-08-03 09:15:00', 55968.00, 'Processing'),
(4, '2025-08-04 14:20:00', 103968.00, 'Pending'),
(5, '2025-08-05 11:45:00', 255968.00, 'Delivered'),
(6, '2025-08-06 16:00:00', 175968.00, 'Shipped'),
(7, '2025-08-07 08:30:00', 383952.00, 'Processing'),
(8, '2025-08-08 13:10:00', 47984.00, 'Pending'),
(9, '2025-08-09 15:25:00', 287968.00, 'Delivered'),
(10, '2025-08-10 10:50:00', 79984.00, 'Shipped');


CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1119984.00),
(1, 3, 1, 31984.00),
(2, 2, 1, 2079984.00),
(2, 4, 3, 23984.00),
(3, 3, 2, 31984.00),
(4, 5, 1, 79984.00),
(4, 7, 1, 23984.00),
(5, 6, 2, 47984.00),
(5, 8, 4, 39984.00),
(6, 9, 1, 239984.00);


select * from CUSTOMERS;