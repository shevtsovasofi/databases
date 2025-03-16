CREATE DATABASE lomography;
USE lomography;

CREATE TABLE users (
    id_user INT PRIMARY KEY,
    user_name VARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255),
    join_date DATE,
    photo_name VARCHAR(255)
);

INSERT INTO users VALUES 
(1, 'Photo_lover', 'heyphoto', 'photolover@gmail.com',  '2022-05-03', NULL),
(2, 'LomoFan', 'securepassword456', 'lomofan@example.com', '2021-11-20', NULL),
(3, 'ShutterBug', 'password789', 'shutterbug@example.com', '2023-01-10', NULL);

SELECT * FROM users;

CREATE TABLE photos (
    id_photo INT PRIMARY KEY,
    camera_id INT,
    upload_date DATE,
    TAGS VARCHAR(255),
    film_id INT,
    place VARCHAR(255),
    id_user INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user)
);

INSERT INTO photos (id_photo, camera_id, upload_date, TAGS, film_id, place, id_user) 
VALUES 
(1, 1, '2022-05-10', 'sunset, nature, travel', 101, 'Santorini, Greece', 1),
(2, 2, '2022-06-15', 'portrait, black and white, vintage', 102, 'New York, USA', 2),
(3, 3, '2022-07-20', 'street photography, cityscape', 103, 'Tokyo, Japan', 3),
(4, 1, '2022-08-25', 'landscape, nature, mountains', 101, 'Swiss Alps, Switzerland', 1),
(5, 2, '2022-09-30', 'portrait, close-up, studio', 102, 'Los Angeles, USA', 2),
(6, 3, '2022-11-05', 'abstract, art, modern', 103, 'Paris, France', 3);

SELECT * FROM photos;

CREATE TABLE shop (
    camera_id INT,
    film_id INT
);
DROP TABLE shop;

ALTER TABLE users DROP COLUMN photo_name;
SELECT * FROM users;

ALTER TABLE users RENAME COLUMN id_user TO id;
SELECT * FROM users;

CREATE TABLE cameras (
    camera_id INT,
    camera_name VARCHAR(255),
    brand VARCHAR(255),
    film_id INT,
    lens_type VARCHAR(255)
);

INSERT INTO cameras (camera_id, camera_name, brand, film_id, lens_type) VALUES
(1, 'Canon AE-1', 'Canon', 101, 'Interchangeable'),
(2, 'Nikon F3', 'Nikon', 102, 'Interchangeable'),
(3, 'Leica M6', 'Leica', 103, 'Fixed');

SELECT * FROM cameras;

ALTER TABLE cameras ADD PRIMARY KEY (camera_id);
ALTER TABLE photos ADD FOREIGN KEY (camera_id) REFERENCES cameras(camera_id);

CREATE TABLE films (
    film_id INT PRIMARY KEY,
    film_name VARCHAR(255),
    ISO INT,
    colortype VARCHAR(255)
);



INSERT INTO films (film_id, film_name, ISO, colortype) VALUES
(101, 'Kodak Portra 400', 400, 'Color'),
(102, 'Ilford HP5 Plus', 400, 'Black & White'),
(103, 'Fujifilm Velvia 50', 50, 'Color');

SELECT * FROM films;
ALTER TABLE cameras ADD FOREIGN KEY (film_id) REFERENCES films (film_id);
SELECT * FROM cameras;
ALTER TABLE photos ADD FOREIGN KEY (film_id) REFERENCES films (film_id);

CREATE TABLE articles (
    article_id INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    title VARCHAR(255),
    publish_date DATE,
    theme VARCHAR(255)
);

INSERT INTO articles (article_id, user_id, title, publish_date, theme) VALUES
(1, 1, 'The Art of Film Photography', '2024-03-10', 'Photography'),
(2, 2, 'How to Choose the Best 35mm Film', '2024-03-12', 'Film Guide'),
(3, 3, 'The Comeback of Analog Cameras', '2024-03-15', 'Trends');

SELECT * FROM articles;

CREATE TABLE likes (
    like_id INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    photo_id INT,
    FOREIGN KEY (photo_id) REFERENCES photos(id_photo),
    date_of_like DATE
);

INSERT INTO likes (like_id, user_id, photo_id, date_of_like) VALUES
(1, 1, 1, '2024-03-10'),
(2, 2, 2, '2024-03-11'),
(3, 3, 3, '2024-03-12');

SELECT * FROM likes;

CREATE TABLE comments (
    comment_id INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    photo_id INT,
    FOREIGN KEY (photo_id) REFERENCES photos(id_photo),
    date_of_comment DATE
);

INSERT INTO comments (comment_id, user_id, photo_id, date_of_comment) VALUES
(1, 1, 1, '2024-03-10'),
(2, 2, 2, '2024-03-11'),
(3, 3, 3, '2024-03-12');

SELECT * FROM comments;

SELECT place FROM photos WHERE film_id = '101';
SELECT * FROM photos WHERE id_user = '1';
SELECT * FROM cameras WHERE lens_type = 'Interchangeable' OR brand = 'Leica';