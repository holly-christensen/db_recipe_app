# Search algorithm using a single word 
drop procedure if exists search_recipe;
delimiter //
create procedure search_recipe
 (in search_param varchar(50))

begin
 
select recipe_id
from recipe join Recipe_tag using (recipe_id)
left join Tag using (tag_id)
where title like concat("%", search_param,"%")
or tag_name like concat("%", search_param,"%"); 

end//