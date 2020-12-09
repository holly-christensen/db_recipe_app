drop procedure if exists people_you_follow_also_like;

delimiter //

create procedure people_you_follow_also_like
(
in user_id_param int
)
begin
	select distinct r.recipe_id, r.title, r.description, r.photo
    from follow join User on (follow.followee_id = User.user_id)
		join save using (user_id)
        join Recipe r using (recipe_id)
    where follower_id = user_id_param
		and recipe_id not in 
			(select recipe_id
            from save
            where user_id = user_id_param) -- Shouldn't see recipes they've already saved
    group by r.recipe_id
    order by count(recipe_id) desc -- Order by most liked among their friends descending
    limit 10;

end //

delimiter ;

call people_you_follow_also_like(1);
