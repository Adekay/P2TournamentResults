-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Commands to remove the tables from the database
--DROP TABLE matches CASCADE;
--DROP TABLE players CASCADE;


-- Create the players table
CREATE TABLE players (
	id 				SERIAL PRIMARY KEY,
	name 			TEXT NOT NULL,
	created_date 	TIMESTAMPTZ NOT NULL DEFAULT CURRENT_DATE
);

-- Create the table for the list of matches
CREATE TABLE matches (
	id 			SERIAL PRIMARY KEY,
	player1		INTEGER NOT NULL REFERENCES players(id),
	player2		INTEGER NOT NULL REFERENCES players(id),
	winner		INTEGER NULL REFERENCES players(id),
	match_time  TIMESTAMPTZ NOT NULL DEFAULT CURRENT_DATE
);


--- Create a view for listing all the players with their number of matches, wins, and their rank
CREATE OR REPLACE VIEW player_standings
	AS 
	SELECT 
		id,
		name,
		wins,
		matches,
		row_number() OVER () as rank 
	FROM (
		SELECT 
			p.id, 
			p.name, 
			SUM(CASE WHEN m.winner = p.id THEN 1 ELSE 0 END) AS wins, 
			COUNT(m.*) AS matches
		FROM players p 
		LEFT OUTER JOIN matches m ON 
			m.player1 = p.id OR m.player2 = p.id 
		GROUP BY p.id 
		ORDER BY wins DESC, p.name
	) a;
