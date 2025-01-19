DROP TABLE IF EXISTS `recipe_ingredient`;
DROP TABLE IF EXISTS `ingredient`;
DROP TABLE IF EXISTS `recipe`;
DROP TABLE IF EXISTS `fridge`;
DROP TABLE IF EXISTS `tag`;
DROP TABLE IF EXISTS `purchase_plan`;

CREATE TABLE `ingredient` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `default_amount` float NOT NULL,
                              `name` VARCHAR(100) NOT NULL,
                              `unit` text NOT NULL,
                              PRIMARY KEY (`id`)
);

CREATE TABLE `recipe` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `instructions` text NOT NULL,
                          `portions` float NOT NULL,
                          `recipe_name` text NOT NULL,
                          PRIMARY KEY (`id`)
);

CREATE TABLE `recipe_ingredient` (
                                     `recipe_id` bigint NOT NULL,
                                     `ingredient_id` bigint NOT NULL,
                                     `amount` float NOT NULL,
                                     CONSTRAINT `FK9b3oxoskt0chwqxge0cnlkc29` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
                                     CONSTRAINT `FKgu1oxq7mbcgkx5dah6o8geirh` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`)
);

CREATE TABLE `fridge` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `ingredient_name` text NOT NULL,
                          `amount` float NOT NULL,
                          PRIMARY KEY (`id`),
                          CONSTRAINT FOREIGN KEY ('ingredient_name') REFERENCES 'ingredient' ('name')
);

CREATE TABLE `tag` (
                       `id` bigint NOT NULL AUTO_INCREMENT,
                       `name` text NOT NULL,
                       `category` text NOT NULL,
                       PRIMARY KEY (`id`)
);

CREATE TABLE `purchase_plan` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `name` text NOT NULL,
                        `amount` float NOT NULL,
                        PRIMARY KEY (`id`)
);


CREATE INDEX `FK9b3oxoskt0chwqxge0cnlkc29` ON `recipe_ingredient` (`ingredient_id`);
CREATE INDEX `FKgu1oxq7mbcgkx5dah6o8geirh` ON `recipe_ingredient` (`recipe_id`);