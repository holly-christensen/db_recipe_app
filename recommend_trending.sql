-- stored procedure to create recommendaitons based on trending recipes this week 

use recipedb;

DROP FUNCTION IF EXISTS avgRating;
DELIMITER //
CREATE FUNCTION avgRating
(
	recipe_id_param INT
)
RETURNS DOUBLE PRECISION(5,2)
DETERMINISTIC
BEGIN
    DECLARE avg_rating_var DOUBLE PRECISION(5,2);
    
    select avg(rating)
    from Rating
    where recipe_id = recipe_id_param
	into avg_rating_var;
    
	RETURN avg_rating_var;
END //
DELIMITER ;

select avgRating(3);

drop procedure if exists recommendTrending;
delimiter //
create procedure recommendTrending()
begin
	declare start_date_var datetime;
	select DATE_SUB(NOW(), interval 2 week) 
    into start_date_var;
	
	select distinct recipe_id, title, photo, avgRating(recipe_id) 
	from Recipe left join Rating using(recipe_id)
	where rating_date > start_date_var
	order by avgRating(recipe_id) desc
	limit 9;
    
end //
delimiter ;

call recommendTrending();


