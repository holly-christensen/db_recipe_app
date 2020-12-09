# recommendation algorithm based on people who liked a certain recipe also like 
use recipedb;

drop procedure if exists people_who_like_this_recipe_also_like;
delimiter //
create procedure people_who_like_this_recipe_also_like
 ( in user_id_param varchar(50),
   in recipe_id_param int)

begin

select recipe_id, title, description, photo
from Save s left join Recipe r using (recipe_id)
where s.user_id in 
(select b.user_id
from Save b join user using (user_id)
where user_id != user_id_param
and recipe_id = recipe_id_param)
and recipe_id != recipe_id_param
group by recipe_id
order by count(recipe_id) desc
limit 10;

end//

call people_who_like_this_recipe_also_like(72, 10);