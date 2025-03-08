CREATE DATABASE door2door_courier;

USE door2door_courier;

CREATE TABLE sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(50) NOT NULL,
    seller_address VARCHAR(100),
    phone_num VARCHAR(20)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    designation ENUM('Manager', 'Delivery Man') NOT NULL
);

CREATE TABLE serves (
    seller_id INT,
    emp_id INT,
    PRIMARY KEY (seller_id, emp_id),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

CREATE TABLE product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    delivery_address VARCHAR(100) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE gives (
    seller_id INT NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    PRIMARY KEY (seller_id, product_id),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE special_package (
    package_id INT PRIMARY KEY,
    product_id VARCHAR(10) NOT NULL,
    gift_or_not BOOLEAN NOT NULL,
    extra_charges DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE delivery_man (
    dm_name VARCHAR(50) PRIMARY KEY,
    emp_id INT NOT NULL,
    working_hours INT,
    time_shift VARCHAR(50),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    INDEX (emp_id),
    INDEX (dm_name, emp_id)
);

CREATE TABLE transport (
    transport_method VARCHAR(50),
    distance DECIMAL(10, 2),
    weight DECIMAL(10, 2),
    product_id VARCHAR(10) NOT NULL,
    dm_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (dm_name) REFERENCES delivery_man(dm_name),
    INDEX (transport_method, product_id)
);

CREATE TABLE handled_by (
    transport_method VARCHAR(50),
    product_id VARCHAR(10) NOT NULL,
    dm_name VARCHAR(50) NOT NULL,
    emp_id INT NOT NULL,
    PRIMARY KEY (transport_method, product_id, dm_name, emp_id),
    FOREIGN KEY (transport_method, product_id) REFERENCES transport(transport_method, product_id),
    FOREIGN KEY (dm_name) REFERENCES delivery_man(dm_name),
    FOREIGN KEY (dm_name, emp_id) REFERENCES delivery_man(dm_name, emp_id),
    INDEX (dm_name, emp_id)
);

CREATE TABLE address (
    full_address VARCHAR(100) PRIMARY KEY,
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(20)
);

CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    method VARCHAR(50),
    total_price DECIMAL(10, 2)
);

CREATE TABLE buyer (
    b_id INT PRIMARY KEY,
    b_name VARCHAR(50),
    b_phone VARCHAR(20),
    full_address VARCHAR(100) NOT NULL,
    payment_id INT NOT NULL,
    FOREIGN KEY (full_address) REFERENCES address(full_address),
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    placed_date DATE,
    price DECIMAL(10,2),
    emp_id INT NOT NULL,
    b_id INT NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (b_id) REFERENCES buyer(b_id)
); 

CREATE TABLE delivers_to (
    b_id INT NOT NULL,
    dm_name VARCHAR(50) NOT NULL,
    emp_id INT NOT NULL,
    PRIMARY KEY (b_id, dm_name, emp_id),
    FOREIGN KEY (b_id) REFERENCES buyer(b_id),
    FOREIGN KEY (dm_name, emp_id) REFERENCES delivery_man(dm_name, emp_id)
);

CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    branch_address VARCHAR(100),
    emp_id INT NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

CREATE TABLE exchange_data_with (
    branch_id INT NOT NULL,
    dm_name VARCHAR(50) NOT NULL,
    emp_id INT NOT NULL,
    PRIMARY KEY (branch_id, dm_name, emp_id),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (dm_name, emp_id) REFERENCES delivery_man(dm_name, emp_id)
);

CREATE TABLE delivery (
    tracking_number INT PRIMARY KEY,
    expected_deliver_date DATE
);

CREATE TABLE updates (
    branch_id INT NOT NULL,
    tracking_number INT NOT NULL,
    PRIMARY KEY (branch_id, tracking_number),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (tracking_number) REFERENCES delivery(tracking_number)
);


