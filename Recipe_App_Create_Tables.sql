
drop database if exists recipeapp;
create database recipeapp;

use recipeapp;

drop table if exists University;
create table University (
	university_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    university_name VARCHAR(50) NOT NULL
);

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
    university_id INT,
	CONSTRAINT user_fk_university FOREIGN KEY (university_id) REFERENCES University (university_id)
);

drop table if exists Follow;
create table Follow (
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
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
	appliance_id INT NOT NULL,
    recipe_id INT NOT NULL,
    CONSTRAINT recipe_appliance_fk_appliance FOREIGN KEY (appliance_id) REFERENCES Appliance (appliance_id),
    CONSTRAINT recipe_appliance_fk_recipe FOREIGN KEY (recipe_id) REFERENCES Recipe (recipe_id)
);

drop table if exists Ingredient;
create table Ingredient (
	ingredient_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ingredient_name VARCHAR(50) NOT NULL UNIQUE,
    unit_price DOUBLE PRECISION(5,2) NOT NULL DEFAULT 0.00
);

drop table if exists Recipe_ingredient;
create table Recipe_ingredient (
	ingredient_id INT NOT NULL,
    recipe_id INT NOT NULL,
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
	tag_id INT NOT NULL,
    recipe_id INT NOT NULL,
    CONSTRAINT recipe_tag_fk_tag FOREIGN KEY (tag_id) REFERENCES Tag (tag_id),
    CONSTRAINT recipe_tag_fk_recipe FOREIGN KEY (recipe_id) REFERENCES Recipe (recipe_id)
);


drop table if exists Rating;
create table Rating (
	user_id INT NOT NULL,
    recipe_id INT NOT NULL,
    rating INT NOT NULL,
    rating_date DATETIME NOT NULL,
    CONSTRAINT rating_fk_user FOREIGN KEY (user_id) REFERENCES User (user_id),
    CONSTRAINT rating_fk_recipe FOREIGN KEY (recipe_id) REFERENCES Recipe (recipe_id)
);

drop table if exists Save;
create table Save (
	user_id INT NOT NULL,
    recipe_id INT NOT NULL,
    date_liked DATETIME NOT NULL,
    CONSTRAINT save_fk_user FOREIGN KEY (user_id) REFERENCES User (user_id),
    CONSTRAINT save_fk_recipe FOREIGN KEY (recipe_id) REFERENCES Recipe (recipe_id)
);

drop table if exists Pantry;
create table Pantry (
	user_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    CONSTRAINT pantry_fk_user FOREIGN KEY (user_id) REFERENCES User (user_id),
    CONSTRAINT pantry_fk_ingredient FOREIGN KEY (ingredient_id) REFERENCES Ingredient (ingredient_id)
);
















