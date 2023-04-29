
We've also created an against_type table to store the effectiveness of each type against other types,
and a pokemon_against_type table to link each Pokemon to its against-types and their corresponding effectiveness.

This eliminates the repeating groups in the original schema and allows us to avoid data duplication. 
Each table depends only on its primary key and there are no transitive dependencies between non-key attributes, 
so this schema satisfies the requirements of 3NF.

-- Create a linking table 'pokemon_type' to link each Pokemon and its type(s)
CREATE TABLE pokemon_type (
  pokedex_number INTEGER,
  type_id INTEGER,
  PRIMARY KEY (pokedex_number, type_id),
  FOREIGN KEY (pokedex_number) REFERENCES pokemon (pokedex_number),
  FOREIGN KEY (type_id) REFERENCES type (type_id)
);




-- Create a linking table 'pokemon_ability' to link each Pokemon and its ability/abilities 
CREATE TABLE pokemon_ability(
pokedex_number INTEGER, abilityid INTEGER,
FOREIGN KEY (pokedex_number) REFERENCES pokemon (pokedex_number),
FOREIGN KEY (abilityid) REFERENCES ability(abilityid)
);


