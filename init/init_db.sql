CREATE DATABASE IF NOT EXISTS labdb;
USE labdb;

CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE
);

CREATE TABLE productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  fecha DATETIME NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE pedido_detalle (
  id INT AUTO_INCREMENT PRIMARY KEY,
  pedido_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
  FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Datos de prueba
INSERT INTO clientes (nombre, email) VALUES
('Ana Pérez', 'ana@example.com'),
('Juan Soto', 'juan@example.com');

INSERT INTO productos (nombre, precio) VALUES
('Teclado mecánico', 45000),
('Mouse gamer', 25000),
('Monitor 24 pulgadas', 120000);

INSERT INTO pedidos (cliente_id, fecha, total) VALUES
(1, NOW(), 70000),
(2, NOW(), 145000);

INSERT INTO pedido_detalle (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 45000),
(1, 2, 1, 25000),
(2, 2, 1, 25000),
(2, 3, 1, 120000);
