-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Remove old tournament database if it exists
DROP DATABASE IF EXISTS tournament;

-- Create database and connect to it
CREATE DATABASE tournament;
\c tournament;

-- Create table for player information
CREATE TABLE players (
    player_id serial PRIMARY KEY,
    name text);
 
-- Create table for match information 
CREATE TABLE matches (
    match_id serial PRIMARY KEY,
    player1 integer REFERENCES players(player_id),
    player2 integer REFERENCES players(player_id),
    winner  integer REFERENCES players(player_id),
    loser   integer REFERENCES players(player_id) );
   
-- Create view to easily access win/loss record of players   
CREATE VIEW playerStandings AS 
    SELECT player_id, 
    (SELECT count(*) FROM matches WHERE winner = player_id) as wins,
    (SELECT count(*) FROM matches WHERE loser = player_id) as losses
    FROM players;


