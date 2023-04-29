
-- split apart the 'abilities' column values from the original table 'pokemon' and store in new column called 'ability' in a new table called pokemon1nf
CREATE TABLE pokemon1nf AS
SELECT pokedex_number, name, trim(value) AS ability, 
against_bug, against_dark, against_dragon, against_electric, 
against_fairy, against_fire, against_flying, against_ghost, 
against_grass, against_ground, against_ice, against_normal,
against_poison, against_psychic, against_rock, against_steel, 
against_water, attack, base_egg_steps, base_happiness, base_total,
capture_rate, classfication, defense, experience_growth, height_m,
hp, percentage_male, sp_attack, sp_defense, speed, type1, type2, weight_kg,
generation, is_legendary
FROM pokemon,
json_each('["'||replace(abilities,',','","')||'"]')
WHERE ability <> '';

-- remove the square brackets and single quotes for each entry in the ability column 
UPDATE pokemon1nf SET ability = REPLACE(REPLACE(REPLACE(ability, '[', ''), ']', ''), "'", "");
