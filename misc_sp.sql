use recipedb;

drop procedure if exists ingredientsNotInPantry;
delimiter //
create procedure ingredientsNotInPantry
(
	in user_id_param INT
)
begin

	SELECT ingredient_id, ingredient_name
	FROM Ingredient
	WHERE ingredient_id NOT IN (
		SELECT ingredient_id
		FROM Pantry
		WHERE user_id = user_id_param
	)
    ORDER BY ingredient_name;
    
end //
delimiter ;