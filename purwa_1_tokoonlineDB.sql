CREATE DATABASE tokoonline;

CREATE TABLE users(
ID INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL UNIQUE,
Sex SET('Male', 'Female'),
PRIMARY KEY(ID)
);

INSERT INTO users (Name, Email, Sex) VALUES
('Andi', 'andi@andi.com', 'Male');

-- Kalo masukin email yang sama, ID numbernya bakal ngambil '2' jadi iterasi selanjutnya bakal '3'
-- tapi kalo insert lagi terus masukin ID numbernya '2' bisa 

INSERT INTO users (Name, Email, Sex) VALUES
('Caca', 'caca@caca.com', 'Female'),
('Budi', 'budi@budi.com', 'Male'),
('Deni', 'deni@deni.com', 'Female'),
('Enno', 'enno@enno.com', 'Male');

INSERT INTO users (Name, Email, Sex) VALUES
('Fikri', 'fikri@fikri.com', 'Male'),
('Galih', 'galih@galih.com', 'Male'),
('Honne', 'honne@honne.com', 'Female'),
('Iman', 'iman@iman.com', 'Male'),
('Januar', 'januar@januar.com', 'Male'),
('Kimi', 'kimi@kimi.com', 'Female'),
('Loui', 'loui@loui.com', 'Female'),
('Mimi', 'mimi@mimi.com', 'Female'),
('Nona', 'nona@nona.com', 'Female'),
('Olive', 'olive@olive.com', 'Female');


CREATE TABLE cities(
ID INT NOT NULL AUTO_INCREMENT,
City VARCHAR(100) NOT NULL,
PRIMARY KEY(ID)
);

INSERT INTO cities (City) VALUES
('Jakarta'),
('Bandung'),
('Surabaya');

ALTER TABLE users
ADD COLUMN
ID_Kota INT NOT NULL DEFAULT 1
AFTER Email;

UPDATE users SET ID_Kota = 2 WHERE ID = 2;
UPDATE users SET ID_Kota = 3 WHERE ID = 4;

SELECT users.id, Name, Sex, City
FROM users LEFT JOIN cities
ON users.ID_Kota = cities.id;

SELECT users.ID, users.name, cities.city
FROM users
INNER JOIN cities
ON users.ID_Kota = cities.ID;

CREATE TABLE products(
ID INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(100) NOT NULL,
Harga BIGINT DEFAULT 1000000,
ID_Kota INT,
PRIMARY KEY(ID)
);

INSERT INTO products (Name, Harga, ID_Kota) VALUES
('Drone', '20000000', 1),
('Batik','3000000', 2),
('Kemoceng', 10000, 3),
('Tamiya', 1000000, 1),
('Beyblade', 1500000, 3);

SELECT p.ID, p.Name, p.Harga, c.City
FROM products p
JOIN cities c
ON p.ID_Kota = c.ID;

ALTER TABLE products
ADD COLUMN
Stok INT DEFAULT 10
AFTER Harga;

UPDATE products
SET Stok = 5
WHERE Harga < 1100000;

create table transactions(
id_user int not null,
id_product int not null);

insert into transactions values
(1,1),(1,3),(1,5),
(2,2),(2,4),
(5,5),(5,3);

SELECT * from TRANSACTIONS
ORDER BY id_user, id_product;

SELECT Name, id_product
FROM users u
JOIN transactions t
ON u.id = t.id_user;

describe products;
describe transactions;

SELECT u.Name AS 'Customer Name', c.city AS 'Customer City', p.Name AS 'Barang', c1.city AS 'Asal Barang', p.Harga
FROM users u
JOIN cities c
ON u.ID_Kota = c.ID
JOIN transactions t
ON u.ID = t.id_user
JOIN products p
ON p.id = t.id_product
JOIN cities c1
ON p.ID_Kota = c1.ID;

CREATE VIEW data_transaksi_toko AS
SELECT u.Name AS 'Customer Name', c.city AS 'Customer City', p.Name AS 'Barang', c1.city AS 'Asal Barang', p.Harga
FROM users u
JOIN cities c
ON u.ID_Kota = c.ID
JOIN transactions t
ON u.ID = t.id_user
JOIN products p
ON p.id = t.id_product
JOIN cities c1
ON p.ID_Kota = c1.ID;

SHOW FULL TABLES;

SELECT u.Name AS Name, p.Name AS Produk, p.Harga FROM
users u, products p, transactions t
WHERE u.id = t.id_user
and p.id = t.id_product;

SELECT u.Name, c.city, p.name as Produk, p.harga, c2.city as Kota 
FROM users u, products p, transactions t, cities c, cities c2
WHERE u.id = t.id_user
AND p.id = t.id_product
AND u.ID_Kota = c.ID
AND p.ID_Kota = c2.id;

select count(*) as 'Total User' from users;