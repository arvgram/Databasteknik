DROP TABLE IF EXISTS raw_materials_warehouse;
CREATE TABLE raw_materials(
    ingredient_name TEXT,
    amount_stored INT,
    PRIMARY KEY (ingredient_name),
    FOREIGN KEY (ingredient_name) REFERENCES ingredients(ingredient_name)
)

DROP TABLE IF EXISTS ingredients;
CREATE TABLE ingredients(
    ingredient_name TEXT,
    allergene TEXT,

    PRIMARY KEY (ingredient_name)
)

DROP TABLE IF EXISTS ingredient_list;
CREATE TABLE ingredient_list(
    cookie_name TEXT,
    ingredient_name TEXT,
    amount INT,

    PRIMARY KEY (cookie_name, ingredient_name),
    FOREIGN KEY (cookie_name) REFERENCES recipes(cookie_name),
    FOREIGN KEY (ingredient_name) REFERENCES ingredients(ingredient_name)
)

DROP TABLE IF EXISTS recipes;
CREATE TABLE recipes(
    cookie_name TEXT,
    
    PRIMARY KEY (cookie_name)
）

DROP TABLE IF EXISTS pallet;
CREATE TABLE pallet(
    pallet_id TEXT DEFAULT (lower(hex(randomblob(16)))),
    cookie_name TEXT,
    production_date DATE,
    production_time TIME,
    status TEXT,
    delivery_id TEXT,
    
    PRIMARY KEY pallet_id,
    FOREIGN KEY cookie_name REFERENCES recipes(cookie_name)
    FOREIGN KEY delivery_id REFERENCES deliveries(delivery_id)
)

DROP TABLE IF EXISTS deliveries;
CREATE TABLE deliveries(
    delivery_id TEXT,
    delivery_date DATE,
    delivery_time TIME,

    PRIMARY KEY (delivery_id)
)

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(





