
# Trigger to prevents user from rating their own recipe
Drop Trigger if exists user_rates_recipe;
DELIMITER //
CREATE TRIGGER user_rates_recipe
	BEFORE INSERT ON Rating
	FOR EACH ROW
BEGIN
	if NEW.recipe_id in (
		select recipe_id
		from Recipe
		where user_id = NEW.user_id) then
    
    SIGNAL SQLSTATE "HYOOO"
			SET MESSAGE_TEXT = "Users cannot rate their own recipes";
    END if;
    
END; //
DELIMITER ;

-- user 42 created recipe 3, and is trying to add a rating to their own recipe
-- returns following error: Error Code: 1644. Users cannot rate their own recipes	0.038 sec
-- insert into rating (user_id, recipe_id, rating) values
-- (42,3, 5);	


# Trigger to prevent user from following themselves or the same user twice
Drop Trigger if exists user_follows_user;
DELIMITER //
CREATE TRIGGER user_follows_user
	BEFORE INSERT ON Follow
	FOR EACH ROW
BEGIN
	if NEW.followee_id = NEW.follower_id then 
		SIGNAL SQLSTATE "HYOOO"
			SET MESSAGE_TEXT = "Users cannot follow themselves";
    END if;
    
    if NEW.followee_id in 
    (select followee_id
    from Follow
    where followee_id = NEW.followee_id
    or follower_id = NEW.follower_id)
    then 
		SIGNAL SQLSTATE "HYOOO"
			SET MESSAGE_TEXT = "Users cannot follow the same user twice";
    END if;

END; //
DELIMITER ;

-- user 34 tries to follow themselves
-- returns the error: Error Code: 1644. Users cannot follow themselves
-- insert into Follow (follower_id, followee_id) values
-- (68, 68);

-- user 34 is already following user 34 and tries to follow them again
-- returns the error Error Code: 1644. Users cannot follow the same user twice
-- insert into Follow (follower_id, followee_id) values
-- (68, 36);


# prevents users from adding the same ingredient to their pantry twice 
Drop Trigger if exists user_updates_pantry;
DELIMITER //
CREATE TRIGGER user_updates_pantry
	BEFORE INSERT ON Pantry
	FOR EACH ROW
BEGIN
	if (New.ingredient_id in 
    (select ingredient_id 
    from Pantry
    where user_id = New.user_id))
    then
		SIGNAL SQLSTATE "HYOOO"
			SET MESSAGE_TEXT = "Can't add an item that is already in your pantry";
	end if;
END //
DELIMITER ;

-- user 50 has ingredient 116 in their pantry, and they are trying to add it again
-- returns the error: Error Code: 1644. Can't add an item that is already in your pantry
-- insert into Pantry (user_id, ingredient_id) values
-- (50, 116);


# custom error messages for posting a recipe without required attributes 
Drop Trigger if exists user_posts_recipe;
DELIMITER //
CREATE TRIGGER user_posts_recipe
	BEFORE INSERT ON Recipe
	FOR EACH ROW
BEGIN
if NEW.title is null then 
		SIGNAL SQLSTATE "HYOOO"
			SET MESSAGE_TEXT = "The recipe needs a title.";
    END if;
    
if NEW.minutes is null then 
		SIGNAL SQLSTATE "HYOOO"
			SET MESSAGE_TEXT = "The recipe needs a prep time.";
    END if;
    
if NEW.servings is null then 
		SIGNAL SQLSTATE "HYOOO"
			SET MESSAGE_TEXT = "The recipe needs an amount of servings.";
    END if;
    
    if NEW.instructions is null then 
		SIGNAL SQLSTATE "HYOOO"
			SET MESSAGE_TEXT = "The recipe needs instructions.";
    END if;

END; //
DELIMITER ;

-- user is inserting a recipe without one of the necessary values
-- returns the error: Error Code: 1644. The recipe needs a prep time.
-- insert into Recipe (user_id, title, minutes, servings, instructions) values
-- (45, "title", null, 2, "instructions");
