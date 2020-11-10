
drop database if exists recipeapp;
create database recipeapp;

use recipeapp;
show tables;

select * from user;

drop table if exists User;
create table User (
	user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    description VARCHAR(250),
    photo BLOB,
    university VARCHAR(100)
);

drop table if exists Follow;
create table Follow (
	follower_id INT,
    followee_id INT,
    CONSTRAINT follower_fk FOREIGN KEY (follower_id) REFERENCES User (user_id),
    CONSTRAINT followee_fk FOREIGN KEY (followee_id) REFERENCES User (user_id)
);

drop table if exists Recipe;
create table Recipe (
	recipe_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    description VARCHAR(250),
    photo BLOB,
    minutes INT NOT NULL,
    servings INT NOT NULL,
    user_id INT NOT NULL,
    instructions VARCHAR(1000) NOT NULL,
    CONSTRAINT recipe_fk_user FOREIGN KEY (user_id) references User (user_id)
);


drop table if exists Appliance;
create table Appliance (
	appliance_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    appliance_name VARCHAR(50) NOT NULL UNIQUE
);

drop table if exists Recipe_appliance;
create table Recipe_appliance (
	appliance_id INT,
    recipe_id INT,
    CONSTRAINT recipe_appliance_fk_appliance FOREIGN KEY (appliance_id) REFERENCES Appliance (appliance_id),
    CONSTRAINT recipe_appliance_fk_recipe FOREIGN KEY (recipe_id) REFERENCES Recipe (recipe_id)
);

drop table if exists Ingredient;
create table Ingredient (
	ingredient_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ingredient_name VARCHAR(50) NOT NULL UNIQUE
);

drop table if exists Recipe_ingredient;
create table Recipe_ingredient (
	ingredient_id INT,
    recipe_id INT,
    amount INT NOT NULL,
    unit VARCHAR(20) NOT NULL,
    optional TINYINT NOT NULL DEFAULT FALSE,
    CONSTRAINT recipe_ingredient_fk_ingredient FOREIGN KEY (ingredient_id) REFERENCES Ingredient (ingredient_id),
    CONSTRAINT recipe_ingredient_fk_recipe FOREIGN KEY (recipe_id) REFERENCES Recipe (recipe_id)
);

drop table if exists Tag;
create table Tag (
	tag_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(50) NOT NULL UNIQUE
);

drop table if exists Recipe_tag;
create table Recipe_tag (
	tag_id INT,
    recipe_id INT,
    CONSTRAINT recipe_tag_fk_tag FOREIGN KEY (tag_id) REFERENCES Tag (tag_id),
    CONSTRAINT recipe_tag_fk_recipe FOREIGN KEY (recipe_id) REFERENCES Recipe (recipe_id)
);


drop table if exists Rating;
create table Rating (
	user_id INT,
    recipe_id INT,
    rating INT NOT NULL,
    CONSTRAINT rating_fk_user FOREIGN KEY (user_id) REFERENCES User (user_id),
    CONSTRAINT rating_fk_recipe FOREIGN KEY (recipe_id) REFERENCES Recipe (recipe_id)
);

drop table if exists Save;
create table Save (
	user_id INT,
    recipe_id INT,
    CONSTRAINT save_fk_user FOREIGN KEY (user_id) REFERENCES User (user_id),
    CONSTRAINT save_fk_recipe FOREIGN KEY (recipe_id) REFERENCES Recipe (recipe_id)
);


INSERT INTO User (first_name, last_name, username, email, password, description, university) VALUES 
('Amanda', 'Bell', 'amandabell', 'bell.ama@northeastern.edu', 'reallysecurepassword', 
'The first user in the database! Lover of database design and cooking :)', 'Northeastern'),
('Noah', 'Fleischmann', 'noahfleischmann', 'noah@northeastern.edu', 'supersecure', 
'NOT ENOUGH BUTTER.', 'Northeastern'),
('Jaqueline', 'Daniel', 'jaquelinedaniel', 'daniel.jac@northeastern.edu', 'passwordpassword', 
NULL, 'Northeastern'),
('Holly', 'Christensen', 'hollyc', 'christensen.h@northeastern.edu', 'nicepassword', 
'Databases are cool?', 'Northeastern');

select * from user;

INSERT INTO Appliance (appliance_name) VALUES
("blender"),
("toaster"),
("oven"),
("stove"),
("microwave"),
("cutting board"),
("knife"),
("spatula"),
("whisk"),
("stand mixer"),
("saucepan"),
("cast iron skillet");


INSERT INTO Tag (tag_name) VALUES
("vegan"),
("vegetarian"),
("thai"),
("paleo"),
("asian"),
("gluten-free"),
("dairy-free"),
("indian"),
("mexican"),
("mediterranean"),
("breakfast"),
("lunch"),
("dinner"),
("snack"),
("dessert"),
("mediterranean");


INSERT INTO Ingredient (ingredient_name) VALUES
("coconut oil"),
("onion"),
("butternut squash"),
("ginger"),
("red curry paste"),
("yellow curry powder"),
("coconut milk"),
("vegetable broth"),
("maple syrup"),
("baby spinach"),
("lime juice"),
("cilantro"),
("onion"),
("spaghetti squash"),
("zucchini"),
("carrot"),
("bell pepper"),
("cashews"),
("coconut aminos"),
("garlic cloves"),
("medjool dates"),
("ground flaxseed"),
("blanched almond flour"),
("arrowroot powder"),
("ground flaxseed"),
("baking soda"),
("salt"),
("nut butter"),
("applesauce"),
("lemon juice"),
("vanilla extract"),
("blueberries");


















