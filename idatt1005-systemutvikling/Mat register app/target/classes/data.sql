DROP TABLE IF EXISTS `recipe_ingredient`;
DROP TABLE IF EXISTS `ingredient`;
DROP TABLE IF EXISTS `recipe`;
DROP TABLE IF EXISTS `fridge`;

CREATE TABLE `ingredient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `default_amount` float NOT NULL,
  `ingredient_name` VARCHAR(100) NOT NULL,
  `price` int NOT NULL,
  `unit_of_measurement` text NOT NULL,
  UNIQUE (`ingredient_name`),
  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `ingredient` WRITE;

INSERT INTO `ingredient` VALUES (1,1,'Flour',2,'cup'),(2,2,'Sugar',1,'cup'),(3,1,'Baking Powder',3,'teaspoon'),(4,1,'Salt',2,'teaspoon'),(5,1,'Eggs',3,'each'),(6,1,'Milk',2,'cup'),(7,1,'Butter',4,'cup'),(8,1,'Vanilla Extract',5,'teaspoon'),(9,4,'Ground Cinnamon',4,'teaspoon'),(10,3,'Nutmeg',6,'teaspoon'),(11,1,'Ground Beef',8,'pound'),(12,1,'Onion',1,'each'),(13,1,'Bell Pepper',2,'each'),(14,2,'Canned Diced Tomatoes',1,'can (15 oz)'),(15,1,'Kidney Beans',2,'can (15 oz)'),(16,1,'Chili Powder',3,'tablespoon'),(17,1,'Cumin',4,'teaspoon'),(18,2,'Garlic Powder',3,'teaspoon'),(19,1,'Pasta',2,'box (16 oz)'),(20,1,'Tomato Sauce',2,'can (28 oz)'),(21,4,'Italian Seasoning',4,'teaspoon'),(22,1,'Mozzarella Cheese',5,'cup (shredded)'),(23,1,'Chicken Breast',7,'pound'),(24,1,'Olive Oil',3,'tablespoon'),(25,1,'Broccoli',2,'cup (florets)'),(26,2,'Lemon Juice',2,'tablespoon'),(27,2,'Garlic Cloves',1,'each (minced)');

UNLOCK TABLES;

CREATE TABLE `recipe` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `instructions` text NOT NULL,
  `portions` float NOT NULL,
  `recipe_name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `recipe` WRITE;

INSERT INTO `recipe` VALUES (1,'1. In a large bowl, sift together the flour, sugar, baking powder, salt and nutmeg. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.\n2. Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.',4,'Pancakes'),(2,'1. In a large pot, cook beef over medium heat until brown. Stir in onion and bell pepper and cook 5 minutes. Add tomatoes, kidney beans, chili powder, cumin, garlic powder, and salt. Bring to a boil, reduce heat to low, and simmer for 30 minutes.',6,'Chili'),(3,'1. Preheat oven to 350 degrees F (175 degrees C). Bring a large pot of lightly salted water to a boil. Add ziti pasta, and cook until al dente, about 8 minutes; drain.\n2. In a large skillet, brown onion and ground beef over medium heat. Add spaghetti sauce, and simmer 15 minutes.\n3. Butter a 9x13 inch baking dish. Layer as follows: 1/2 of the ziti, Provolone cheese, sour cream, 1/2 sauce mixture, remaining ziti, mozzarella cheese and remaining sauce mixture. Top with grated Parmesan cheese.\n4. Bake for 30 minutes in the preheated oven, or until cheeses are melted.',4,'Baked Ziti'),(4,'1. Preheat oven to 400 degrees F (200 degrees C). Place chicken in a 9x13 inch baking dish. Squeeze lemon juice over chicken then sprinkle with garlic, Italian seasoning, salt and pepper.\n2. In a small bowl, combine the oil and lemon juice; pour over the chicken. Bake in the preheated oven for 30 minutes.\n3. Add the broccoli to the dish and bake for an additional 30 minutes, or until chicken is no longer pink and juices run clear.',4,'Lemon Chicken'),(5,'1. Bring a large pot of lightly salted water to a boil. Add pasta and cook for 8 to 10 minutes or until al dente; drain.\n2. In a large skillet, cook and stir ground beef until brown. Add chopped onion and garlic, and cook for 5 minutes. Stir in crushed tomatoes, tomato sauce, and Italian seasoning. Simmer on low for 30 minutes.',3,'Pasta Bolognese'),(6,'1. Bring a large pot of lightly salted water to a boil. Add pasta and cook for 8 to 10 minutes or until al dente; drain.\n2. In a large skillet, cook and stir chicken until brown. Add garlic and cook for 2 minutes. Stir in heavy cream and parmesan cheese. Season with salt and pepper. Simmer on low for 20 minutes.',4,'Chicken Alfredo');

UNLOCK TABLES;

CREATE TABLE `recipe_ingredient` (
  `recipe_id` bigint NOT NULL,
  `ingredient_id` bigint NOT NULL,
  KEY `FK9b3oxoskt0chwqxge0cnlkc29` (`ingredient_id`),
  KEY `FKgu1oxq7mbcgkx5dah6o8geirh` (`recipe_id`),
  CONSTRAINT `FK9b3oxoskt0chwqxge0cnlkc29` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `FKgu1oxq7mbcgkx5dah6o8geirh` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `recipe_ingredient` WRITE;
INSERT INTO `recipe_ingredient` VALUES (1,1),(1,2),(1,3),(1,5),(1,6),(1,7),(1,8),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(3,2),(3,18),(3,19),(3,21),(3,22),(4,22),(4,23),(4,24),(4,25),(4,26),(5,18),(5,19),(5,20),(5,21),(6,19),(6,22),(6,23),(6,24),(6,25);

UNLOCK TABLES;

CREATE TABLE `fridge` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ingredient_name` bigint NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `fridge` WRITE;
INSERT INTO `fridge` VALUES (1, 'mango', 2), (2, 'apple', 3), (3, 'banana', 4), (4, 'orange', 5), (5, 'grape', 6), (6, 'strawberry', 7), (7, 'blueberry', 8), (8, 'blackberry', 9), (9, 'raspberry', 10), (10, 'kiwi', 11);

UNLOCK TABLES;

