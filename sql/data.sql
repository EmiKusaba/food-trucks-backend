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

	
	



