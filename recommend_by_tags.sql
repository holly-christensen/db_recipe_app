use recipedb;

drop function if exists get_n_most_saved_tag;

delimiter //

create function get_n_most_saved_tag
(
user_id_arg varchar(50),
n_most_saved int
)
returns varchar(50)
deterministic
begin
	declare n_most_saved_tag varchar(50);
    set n_most_saved = n_most_saved - 1;
    
	select tag_name into n_most_saved_tag
	from User u join Save s
	using (user_id)
	join Recipe r
	using (recipe_id)
	join Recipe_tag rt
	on (rt.recipe_id = r.recipe_id)
	join Tag t
	using(tag_id)
	where u.user_id = user_id_arg
	group by tag_name
	order by count(tag_name) desc
	limit 1
    offset n_most_saved;
    return n_most_saved_tag;
end //
delimiter ;

drop procedure if exists recommend_by_tag;

delimiter //

create procedure recommend_by_tag
(
user_id_arg INT
)
begin

select distinct r.recipe_id, r.title, r.photo, r.description
from Recipe r join Recipe_tag rt
on (r.recipe_id = rt.recipe_id)
join Tag t
using(tag_id)
where r.recipe_id not in
(select recipe_id from
	(select user_id, recipe_id, count(recipe_id)
	from Save
	group by user_id, recipe_id
	having Save.user_id = user_id_arg 
    and count(recipe_id) >= 1)tmp)
and ((t.tag_name = get_n_most_saved_tag(user_id_arg, 1)
or t.tag_name = get_n_most_saved_tag(user_id_arg, 2)
or t.tag_name = get_n_most_saved_tag(user_id_arg, 3))
and r.user_id != user_id_arg)
group by recipe_id, title, tag_name
limit 9;
end //

delimiter ;


call recommend_by_tag(4);
