-- stored procedure to create recommendations based on cost of additional ingredients the user would need to buy 

use recipeapp;

DROP FUNCTION IF EXISTS estimatedRecipeCost;
DELIMITER //
CREATE FUNCTION estimatedRecipeCost
(
	user_id_param INT,
    recipe_id_param INT
)
RETURNS DOUBLE PRECISION(5,2)
DETERMINISTIC
BEGIN
    DECLARE total_cost_var DOUBLE PRECISION(5,2);
    -- calculate the price for the given recipe, including ingredients the user already has
    select sum(unit_price)
    from Recipe_Ingredient 
    left join Ingredient using (ingredient_id) 
    where recipe_id = recipe_id_param
    and optional =  0
    and ingredient_id not in (
		select ingredient_id 
        from Pantry 
        where user_id = user_id_param)
	into total_cost_var;
    
	RETURN total_cost_var;
END //
DELIMITER ;


DROP PROCEDURE IF EXISTS recommendLowCost;
DELIMITER //
CREATE PROCEDURE recommendLowCost
(
	in user_id_param INT
)
begin
    select 
		recipe_id, 
        title, 
        photo,  
        estimatedRecipeCost(user_id_param, recipe_id) as 'estimated_cost'
    from Recipe 
    order by estimatedRecipeCost(user_id_param, recipe_id)
    limit 15;

end //
DELIMITER ;

