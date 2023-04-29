
-- creating ‘against’ table 
CREATE TABLE against AS
SELECT pokedex_number, name,
against_bug, against_dark, against_dragon, against_electric, 
against_fairy, against_fire, against_flying, against_ghost, 
against_grass, against_ground, against_ice, against_normal,
against_poison, against_psychic, against_rock, against_steel, against_water
FROM pokemon;

-- creating 'type' table and insert value 
CREATE TABLE type (typeid INTEGER PRIMARY KEY AUTOINCREMENT, typename);

INSERT INTO type (typename)
SELECT DISTINCT type2 FROM pokemon1nf;

-- creating 'ability' table 
CREATE TABLE ability (abilityid INTEGER PRIMARY KEY AUTOINCREMENT, abilityname);

INSERT INTO ability (abilityname)
SELECT DISTINCT ability FROM pokemon1nf;

-- creating 'pokemon2nf' table
CREATE TABLE pokemon2nf AS
SELECT DISTINCT pokedex_number, name, attack, base_egg_steps, base_happiness, base_total, 
capture_rate, classfication, defense, experience_growth, height_m, hp, percentage_male,
sp_attack, sp_defense, speed, weight_kg, generation, is_legendary
FROM pokemon1nf;
