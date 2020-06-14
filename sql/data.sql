CREATE DATABASE IF NOT EXISTS food_trucks_tracker;

USE DATABASE food_trucks_tracker;

CREATE TABLE IF NOT EXISTS users (
       id           serial,
       name         varchar(64) NOT NULL CHECK (name <> ''),
       password     varchar(256) NOT NULL,
       PRIMARY KEY  (id)
);

CREATE TABLE IF NOT EXISTS categories (
       id           serial,
       name         varchar(64) NOT NULL CHECK (name <> ''),
       PRIMARY KEY  (id)
);

CREATE TABLE IF NOT EXISTS trucks (
       id           serial,
       name         varchar(64) NOT NULL CHECK (name <> ''),
       email        varchar(64) NOT NULL,
       phone        varchar(64) NOT NULL,
       website      varchar(64) NOT NULL,
       hours        varchar(128) NOT NULL,
       address      varchar(256) NOT NULL,
       description  varchar(512) NOT NULL,
       PRIMARY KEY  (id)
);

CREATE TABLE IF NOT EXISTS truck_categories (
       id           serial,
       truck_id     integer,
       category_id  integer,
       PRIMARY KEY  (truck_id, category_id),
       FOREIGN KEY  (truck_id) REFERENCES trucks (id),
       FOREIGN KEY  (category_id) REFERENCES categories (id)
);

CREATE TABLE IF NOT EXISTS entrees (
       id           serial,
       truck_id     integer,
       name         varchar(64),
       description  varchar(512),
       price	    decimal(10, 2),
       PRIMARY KEY  (id, truck_id),
       FOREIGN KEY  (truck_id) REFERENCES trucks (id)
);

CREATE TABLE IF NOT EXISTS drinks (
       id           serial,
       truck_id     integer,
       name         varchar(64),
       description  varchar(512),
       price	    decimal(10, 2),
       PRIMARY KEY  (id, truck_id),
       FOREIGN KEY  (truck_id) REFERENCES trucks (id)
);

CREATE TABLE IF NOT EXISTS reviews (
       id           serial,
       truck_id     integer,
       user_id      integer,
       ts           timestamp NOT NULL,
       rating	    integer NOT NULL,
       comment      varchar(2048) NOT NULL,
       PRIMARY KEY  (id),
       FOREIGN KEY  (truck_id) REFERENCES trucks (id),
       FOREIGN KEY  (user_id) REFERENCES users (id)
);

INSERT INTO users (name, password)
VALUES
	('admin', 'haho0814'),
	('emi', 'emi0615')
;

INSERT INTO categories (name)
VALUES
	('American'),
	('Asian'),
	('BBQ'),
	('Dessert'),
	('Italian'),
	('Mexican'),
	('Others')
;

INSERT INTO trucks (name, email, phone, website, hours, address, description)
VALUES
	('The Bamboo Skewer', 
	 'bambooskewer@gmail.com', 
	 '512-345-1006', 
	 'www.thebambooskewer.com', 
	 'Mon-Sun,11:30am-10:00pm', 
	 '10000 Research Blvd., Ste. 140 Austin, TX 78759', 
	 'TBD'),
	('Veracruz All-Natural Tacos', 
	 'veracruzallnatural@gmail.com', 
	 '512-507-9459', 
	 'www.veracruzallnatural.com', 
	 'Mon-Thu,8:00am-3:00pm;Fri-Sun,8:00am-8:00pm', 
	 '2505 Webberville Rd, Austin, TX 78702',
	 'TBD')
;

UPDATE trucks
SET
	description = 'The bamboo skewer is a family owned and fully licensed mobile food cart specializing in Japanese inspired grilled skewers known as yakitori.'
WHERE id = 1
;

INSERT INTO entrees (truck_id, name, description, price)
VALUES
	(1, 'Chicken Rice Bowl', 'Famous dish of Singapore', 13.00),
	(1, 'Crispy Coconut Shrimp Rice Bowl', '', 13.00)
;

INSERT INTO drinks (truck_id, name, description, price)
VALUES
    (1, 'Diet Coke 12oz', '', 2.00),
    (1, 'Sprite 12oz', '', 2.00),
    (1, 'Bottle of Mineral Water', '', 2.00)
;

INSERT INTO truck_categories (truck_id, category_id)
VALUES
	(1, 2),
	(2, 6)
;

INSERT INTO entrees (truck_id, name, description, price)
VALUES 
       (1, 'Vegetarian Side Sampler', '', 13.00),
       (1, 'Chicken Teriyaki Meatball', '', 13.00),
       (1, 'The Special', '', 15.00)
;

INSERT INTO drinks (truck_id, name, description, price)
VALUES
	(1, 'Coffee (Hot / Iced)', '', 2.00)
;

INSERT INTO entrees (truck_id, name, description, price)
VALUES
       (2, 'Migas Originales', '', 3.50),
       (2, 'La Reyna', '', 4.00),
       (2, 'El Tradicional', '', 3.50),
       (2, 'Bean and Cheese', '', 2.75)
;

INSERT INTO drinks (truck_id, name, description, price)
VALUES
    (2, 'Good Morning Juice (Orange, Carrot, Ginger)', '', 4.25),
    (2, 'La Bomba Juice (Orange, Pineapple, Spinach', '', 4.25),
    (2, 'Nice One Juice (Orange, Pineapple, Grapes)', '', 4.25),
    (2, 'Mr. Verde Juice', '', 4.25),
    (2, 'La Jarocha Juice (Apple, Orange, Carrot, Beet)', '', 4.25)
;

INSERT INTO trucks (name, email, phone, website, hours, address, description)
VALUES
	('Soursop Pan-Asian Food Truck',
	 'soursoppanasianfoodtruck@gmail.com',
	 '512-480-0674',
	 'www.soursopaustin.com',
	 'Closed Monday | Open for Lunch & Dinner Tuesday - Sunday',
	 '440 East St. Elmo Road, G-2, Austin, TX 78745',
	 'It is truly the most unique food truck in Austin!'),
	('Lukes Inside Out Food Truck',
	 'lukesinsideout@gmail.com',
	 '512-689-8883',
	 'www.lukesinsideout.com',
	 'Mon-Tue,5:00PM-9:00PM;Wed-Fri,11:00AM-2:00PM,5:00PM-10:00PM;Sat,11:00AM-10:00PM;Sun,11:30AM-11:00PM',
	 '1109 S Lamar Blvd',
	 'Luke Wibby and his wife run this popular sandwich spot, which is parked beside Gibson Bar on South Lamar.'),
	('Micklethwait Craft Meats',
	 'micklethwaitcraftmeats@gmail.com',
	 '512-282-2697',
	 'www.craftmeatsaustin.com',
	 'Thu-Sat,11:00AM-6:00PM;Sun,11:00AM-4:00PM',
	 '1309 Rosewood Ave., Austin, TX',
	 'Very good barbeque!')
;


INSERT INTO truck_categories (truck_id, category_id)
VALUES
	(3, 2),
	(4, 1),
	(5, 3)
;

INSERT INTO entrees (truck_id, name, description, price)
VALUES
       (3, 'Hot Gai', '', 8.99),
       (3, 'Sambal Nugs', '', 10.00),
       (3, 'B-C-S', '', 7.99),
       (3, 'Waterburger', '', 8.99),
       (3, 'Satay Burger', '', 8.99)
;

INSERT INTO drinks (truck_id, name, description, price)
VALUES
    (3, 'Diet Coke 12oz', '', 2.00),
    (3, 'Sprite 12oz', '', 2.00),
    (3, 'Bottle of Mineral Water', '', 2.00),
    (3, 'Coffee (Hot / Iced)', '', 2.00),
    (4, 'Diet Coke 12oz', '', 2.00),
    (4, 'Sprite 12oz', '', 2.00),
    (4, 'Bottle of Mineral Water', '', 2.00),
    (4, 'Coffee (Hot / Iced)', '', 2.00),
    (5, 'Diet Coke 12oz', '', 2.00),
    (5, 'Sprite 12oz', '', 2.00),
    (5, 'Bottle of Mineral Water', '', 2.00),
    (5, 'Coffee (Hot / Iced)', '', 2.00)
;

INSERT INTO entrees (truck_id, name, description, price)
VALUES
       (4, 'The Pressed Pig', '', 12.00),
       (4, 'The Cow', '', 11.25),
       (4, 'The Burger', '', 11.25),
       (4, 'The Vegetable', '', 10.25),
       (4, 'The Shrimp', '', 11.25),
       (4, 'The Chicken', '', 10.25),
       (5, 'Brisket', '', 24.00),
       (5, 'Pork Ribs', '', 20.00),
       (5, 'Sausage', '', 18.00),
       (5, 'Smoked Turkey', '', 20.00),
       (5, 'Smoked Chicken', '', 14.00)
;

INSERT INTO users (name, password)
VALUES
	('Argo Khon', '123456'),
	('Lucy Smith', '123456'),
	('Asher Streets', '123456'),
	('Pat Scales', '123456'),
	('Erik S', '123456'),
	('Easton Dillehay', '123456'),
	('Jospeh Johnson', '123456'),
	('Jacob Robbins', '123456'),
	('Brett Rudolph', '123456'),
	('Elwin Lee', '123456')
;


	
	



