-- stored procedure to create recommendaitons based on trending recipes this week 

use recipeapp;

drop procedure if exists recommendTrending;
delimiter //
create procedure recommendTrending
(
	-- in patient_name_param varchar(255)
    -- params here
)
begin
	declare start_date_var datetime;
	select DATE_SUB(NOW(), interval 2 week) 
    into start_date_var;
	
	select recipe_id, title, photo, rating 
	from Recipe left join Rating using(recipe_id)
	where rating_date > start_date_var
	order by rating desc
	limit 15;
    
end //
delimiter ;

call recommendTrending();


