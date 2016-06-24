DROP TABLE leagues;
DROP TABLE matches;
DROP TABLE players;
DROP TABLE teams;

CREATE TABLE teams (
  id SERIAL4 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE matches (
  id SERIAL4 primary key,
  home_team_id INT4 references teams(id),
  away_team_id INT4 references teams(id),
  home_team_score INT2,
  away_team_score INT2
);

CREATE TABLE players (
  id SERIAL4 primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null,
  team_id INT4 references teams(id)
);

CREATE TABLE leagues (
  id SERIAL4 primary key,
  name VARCHAR(255) not null,
  match_id INT4 reference matches(id),
);




