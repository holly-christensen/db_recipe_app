# db_recipe_app
Recipe sharing app for college students. 

#### ER Diagram
![ER_Final_Labeled](https://user-images.githubusercontent.com/42592575/192298481-4123e5b1-94f2-4dbb-91fe-6234cbc74ce3.png)

#### Purpose
College students have unique recipe needs
Finding recipes in college can be difficult
Our priorities:
Affordability of ingredients
Limited appliances
Short prep time
Recipe exchange within a college network
Recommend recipes based on cost, ratings, and tags (vegan, GF, Mediterranean, etc)

#### Recommendation Algorithms & Triggers
If you save a recipe, you’re recommended recipes saved by other people who saved the same recipe
Recipes based on common tags of recipes you’ve saved
Trending recipes 
Recipes that people you follow have saved
Lowest additional cost, based on ingredients already in your Pantry
Triggers for inserts & updates
Basic search algorithms

#### Recipe Scraping
Recipes were scraped from Food Networking using Beautiful Soup — a Python web scraping library. 

#### Importing The Data to the Database 
A Jupyter notebook file reads through the CSVs and converts them into MySQL insert statements.

#### React App Implementation
A user interface with basic functionality was implemented in React to support the following functions:
* add ingredients to a user's pantry
* view customized recommendations based on the user's saved recipes, ingredients in their pantry, and users they follow
* post a recipe publicly
* add tags to a recipe
The app was built with React, Node.js, Express.js, and a MySQL database and it allows college students to learn from each other and explore inexpensive and simple cooking during their first years away from home. 
