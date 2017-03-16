-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Remove old tournament database if it exists


-- Create database and connect to it
CREATE DATABASE tournament;
/c tournament;

-- Create table for player information
CREATE TABLE players
    id as serial integer
    name as string;
 
-- Create table for match information 
CREATE TABLE matches
    match_id as serial integer
    player1 as integer from players.id
    player2 as integer from players.id
    winner as integer from players.id
    loser as integer from players.id
   
-- Create view to easily access win/loss record of players   
CREATE VIEW 


