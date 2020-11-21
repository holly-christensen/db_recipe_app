use ade;


INSERT INTO User (first_name, last_name, username, email, password, description, university) VALUES 
('Amanda', 'Bell', 'amandabell', 'bell.ama@northeastern.edu', 'reallysecurepassword', 
'The first user in the database! Lover of database design and cooking :)', 'Northeastern'),
('Noah', 'Fleischmann', 'noahfleischmann', 'noah@northeastern.edu', 'supersecure', 
'NOT ENOUGH BUTTER.', 'Northeastern'),
('Jaqueline', 'Daniel', 'jaquelinedaniel', 'daniel.jac@northeastern.edu', 'passwordpassword', 
NULL, 'Northeastern'),
('Holly', 'Christensen', 'hollyc', 'christensen.h@northeastern.edu', 'nicepassword', 
'Databases are cool?', 'Northeastern');

select * from user;

INSERT INTO Appliance (appliance_name) VALUES
("blender"),
("toaster"),
("oven"),
("stove"),
("microwave"),
("cutting board"),
("knife"),
("spatula"),
("whisk"),
("stand mixer"),
("saucepan"),
("cast iron skillet");


INSERT INTO Tag (tag_name) VALUES
("vegan"),
("vegetarian"),
("thai"),
("paleo"),
("asian"),
("gluten-free"),
("dairy-free"),
("indian"),
("mexican"),
("mediterranean"),
("breakfast"),
("lunch"),
("dinner"),
("snack"),
("dessert"),
("mediterranean");


INSERT INTO Ingredient (ingredient_name) VALUES
("coconut oil"),
("onion"),
("butternut squash"),
("ginger"),
("red curry paste"),
("yellow curry powder"),
("coconut milk"),
("vegetable broth"),
("maple syrup"),
("baby spinach"),
("lime juice"),
("cilantro"),
("olive oil"),
("spaghetti squash"),
("zucchini"),
("carrot"),
("bell pepper"),
("cashews"),
("coconut aminos"),
("garlic cloves"),
("medjool dates"),
("ground flaxseed"),
("blanched almond flour"),
("arrowroot powder"),
("tempeh"), -- 25
("baking soda"),
("salt"),
("nut butter"),
("applesauce"),
("lemon juice"),
("vanilla extract"),
("blueberries"),
("rice, cooked"),
("tofu"),
("chicken");


insert into Recipe (title, description, minutes, servings, user_id, instructions) values
("Thai Butternut Squash Red Curry", 
"A Thai inspired butternut squash red curry served with your choice of rice and/or protein",
30, 
4,
1, 
"Heat oil in large pan over medium-high heat. Add onions and saute for 5-6 minutes until slightly golden. Add butternut squash and grated ginger and stir to coat with oil. Add the curry paste, curry powder and continue cooking until fragrant. Add broth, coconut milk, and sugar. Let the sauce simmer before covering. Once simmering, cover and lower heat until the sqush is cooked through. Stir in baby spinach and allow it to wilt. Stir in lime juice. Top with cilantro. Serve optionally with rice, crushed cashews, and your choice of protein."),
 
("Asian Garlic Spaghetti Squash Noodles",
"An Asian inspired dish of spaghetti squash, various vegetables, a red curry sauce, and your choice of protein.",
35,
4,
1,
"Cut the spaghetti squash in half lengthwise and scrape the seeds from the center using a large spoon. Lay both halves face up on a baking tray, brush lightly with olive oil, and bake for 25 minutes at 450 degrees Fahrenheit. While the squash is cooking, cut the zucchini, carrot, bell pepper, and cashews, and cook in a skillet on medium heat. Puree the coconut aminos, coconut milk, ginger, curry paste, garlic cloves, and medjool dates in a blender. When the squash is done cooking, scrape out noodles using a fork and combine with sauce and cooked veggies. Serve warm or cold with your choice of protein"),
 
("Blueberry Muffins",
"Easy, fluffy, customizable muffin recipe. Feel free to substitute blueberries with equal amount of other filling such as other berries, bananas, chocolate chips, nuts, etc.",
60,
12,
1,
"Preheat oven to 350 degrees Fahrenheit and line 12 cup muffin pan with liners. Mix flaxseed and water in a bowl and set aside for 10 minutes. Mix together almond flour, arrowroot powder, baking soda and salt in a bowl. Whisk the nut butter, maple syrup, applesauce, lemon juice, and vanilla until smooth. Stir in flax mixture. Add dry ingredients to wet and stir until no flour spots are showing. Fold in the blueberries. Spoon batter into liners and fill almost to the top. Bake in the oven for 22-24 minutes or until golden brown and a toothpick inserted into the center comes out clean. Cool the muffins in the pan on a rack for 20 minutes then remove from the muffin pan and allow muffins to continue cooling on the wire rack before storing. Store at room temperature loosely covered for 2 days or cover and refrigerator or freeze to keep them for longer.");
 


insert into Recipe_ingredient (ingredient_id, recipe_id, amount, unit, optionalValue) values
(1, 1, 1, "tbsp", 0),
(2, 1, 1, "whole", 0),
(3, 1, 2, "cup", 0),
(4, 1, 1, "tbsp", 0),
(5, 1, 3, "tbsp", 0),
(6, 1, 2, "tsp", 0),
(7, 1, 15, "ounces", 0),
(8, 1, 6, "ounces", 0),
(9, 1, 2, "tsp", 0),
(10, 1, 3, "cup", 0),
(11, 1, 2, "tbsp", 0),
(12, 1, 1, "tbsp", 0),
(18, 1, 4, "tbsp", 1),
(33, 1, 4, "cup", 1),
(34, 1, 30, "ounces", 1),
(35, 1, 16, "ounces", 1),
-- spaghetti squash
(14, 2, 1, "whole", 0),
(15, 2, 1, "whole", 0),
(16, 2, 1, "whole", 0),
(17, 2, 1, "whole", 0),
(18, 2, 4, "tbsp", 0),
(15, 2, 11, "tbsp", 0),
(16, 2, 6, "whole", 0),
(17, 2, 6, "whole", 0),
-- cilantro
(12, 2, 4, "tbsp", 0),
-- coconut milk
(7, 2, 4, "tbsp", 0),
-- ginger
(4, 2, 2, "tbsp", 0),
-- red curry paste
(5, 2, 2, "tbsp", 0),
(25, 2, 15, "ounces", 1),
(35, 2, 16, "ounces", 1),
(13, 2, 1, "tbsp", 0),
-- muffin
(22, 3, 2, "tbsp", 0),
(23, 3, 27, "tbsp", 0),
(24, 3, 5, "tbsp", 0),
(31, 3, 1, "tsp", 0),
(27, 3, .25, "tsp", 0),
(28, 3, 11, "tbsp", 0),
-- maple syrup
(9, 3, 6, "tbsp", 0),
(29, 3, 8, "tbsp", 0),
(30, 3, 1, "tbsp", 0),
(26, 3, 1, "tsp", 0),
(32, 3, 1, "cup", 0);
 
insert into Recipe_tag (tag_id, recipe_id) values
(1, 3),
(2, 3),
(4, 3),
(6, 3),
(7, 3),
(14, 3),
(1, 2),
(2, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(12, 2),
(13, 2),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(6, 1),
(7, 1),
(12, 1),
(13, 1);
 
insert into Recipe_appliance (appliance_id, recipe_id) values
(3, 3),
(4, 1),
(6, 1), 
(7, 1),
(1, 2),
(6, 2),
(7, 2);
