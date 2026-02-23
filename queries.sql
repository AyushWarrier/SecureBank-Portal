-- ==========================================
-- SecureBank Portal Database Script
-- Domain: Banking
-- ==========================================

CREATE DATABASE IF NOT EXISTS securebank;
USE securebank;

-- ==============================
-- USERS TABLE
-- ==============================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

-- ==============================
-- ACCOUNTS TABLE
-- ==============================
CREATE TABLE accounts (
    acc_no INT PRIMARY KEY,
    user_id INT,
    balance DOUBLE DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

-- ==============================
-- TRANSACTIONS TABLE
-- ==============================
CREATE TABLE transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    from_acc INT,
    to_acc INT,
    amount DOUBLE NOT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (from_acc) REFERENCES accounts(acc_no),
    FOREIGN KEY (to_acc) REFERENCES accounts(acc_no)
);

-- ==============================
-- SAMPLE DATA
-- ==============================
INSERT INTO users(username, password)
VALUES ('rajat', '1234'),
       ('ayush', '1234');

INSERT INTO accounts(acc_no, user_id, balance)
VALUES (1001, 1, 5000),
       (1002, 2, 3000);