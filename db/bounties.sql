DROP TABLE bounties;

CREATE TABLE bounties (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  homeworld VARCHAR(255),
  fav_weapon VARCHAR(255),
  bounty_value INT
);
