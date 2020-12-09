# recommendation algorithm based on people who liked a certain recipe also like 
use recipedb;

drop procedure if exists people_who_like_this_recipe_also_like;
delimiter //
create procedure people_who_like_this_recipe_also_like
 ( in username_param varchar(50),
   in recipe_id_param int)

begin
 
 declare user_id_var int;
 
 select user_id
 into user_id_var
 from user
 where username = username_param;
 
select 
recipe_id_param;

select recipe_id
from Save
where user_id in 
(select user_id
from Save join user using (user_id)
where user_id != user_id_var
and recipe_id = recipe_id_param)
and recipe_id != recipe_id_param
group by recipe_id
order by count(recipe_id);

end//

call people_who_like_this_recipe_also_like(5, 2);