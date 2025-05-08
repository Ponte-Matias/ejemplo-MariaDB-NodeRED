-- init.sql
CREATE DATABASE IF NOT EXISTS iotdb;
USE iotdb;

CREATE TABLE IF NOT EXISTS sensors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50),
    location VARCHAR(100)
);

INSERT INTO sensors (type, location) VALUES
('sensor de temperatura', 'oficina'),
('sensor de humedad', 'salon principal'),
('sensor de temperatura', 'laboratorio'),
('sensor de humedad', 'deposito');
