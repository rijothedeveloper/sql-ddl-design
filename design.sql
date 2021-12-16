DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE deceases (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE doctor_patient_rel (
     id SERIAL PRIMARY KEY,
     doctor_id INTEGER REFERENCES doctors,
     patient_id INTEGER
);

CREATE TABLE decease_patient_rel (
     id SERIAL PRIMARY KEY,
     decease_id INTEGER REFERENCES deceases,
     patient_id INTEGER
);

DROP DATABASE IF EXISTS craig_list;
CREATE DATABASE craig_list;

\c craig_list

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    pref_region INTEGER REFERENCES region
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    title TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    content TEXT,
    user_id INTEGER REFERENCES users,
    loc TEXT,
    region_id INTEGER REFERENCES region,
    category_id INTEGER REFERENCES category
);


DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league

CREATE TABLE league (
    id SERIAL PRIMARY KEY,
    name TEXT,
    start_date DATE,
    end_date DATE
);

CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    name TEXT,
    league_id INTEGER REFERENCES league,
    rank INTEGER
);

CREATE TABLE player (
    id SERIAL PRIMARY KEY,
    name TEXT,
    team_id INTEGER REFERENCES team
);


CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    name TEXT,
    venue TEXT,
    team1_id INTEGER REFERENCES team,
    team2_id INTEGER REFERENCES team
);

CREATE TABLE goal (
    id SERIAL PRIMARY KEY,
    name TEXT,
    match_id INTEGER REFERENCES game
);

CREATE TABLE referee (
    id SERIAL PRIMARY KEY,
    name TEXT,
    game_id INTEGER REFERENCES game
);