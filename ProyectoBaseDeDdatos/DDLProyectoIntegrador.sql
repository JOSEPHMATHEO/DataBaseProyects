# Exploracion del Dataset

# Numero de Registros
SELECT
    'PartidosYGoles' AS Tabla,
    'Indicador General Del Datset PartidosYGoles' AS TipoIndicador,
    'Cantidad de Registros' AS Indicador,
    COUNT(*) AS Valor
FROM
    dspartidosygoles;

# Numero de Registros
SELECT
    'PartidosYGoles' AS Tabla,
    'Indicador General Del Datset AlineacionesXTorneo' AS TipoIndicador,
    'Cantidad de Registros' AS Indicador,
    COUNT(*) AS Valor
FROM
    `dsalineacionesxtorneo-2` ;

# Exploracion de Nulls
SELECT DISTINCT
    goals_minute_regulation AS "Minute Regulation"
FROM
    dspartidosygoles
ORDER BY
    1;

SELECT DISTINCT
    goals_player_id AS 'Player ID'
FROM
    dspartidosygoles
ORDER BY
    1;

# Identifiacion de Relaciones entre Tablas

SELECT

	squads_player_id AS 'ID de los Jugador',
    squads_tournament_id AS 'ID del Torneo',
    CONCAT(players_given_name, ' ', players_family_name) AS 'Nombre deL Jugador',
    squads_position_name'Posicion deL Jugador'

FROM
	`dsalineacionesxtorneo-2`;


# Creacion de la Tabla Stadiums
DROP TABLE IF EXISTS Stadiums;
CREATE TABLE
	Stadiums
SELECT DISTINCT
	matches_stadium_id AS stadium_id,
	stadiums_stadium_name AS stadium_name,
	stadiums_city_name AS city_name,
	stadiums_country_name AS country_name,
	stadiums_stadium_capacity AS stadium_capacity
FROM
	dspartidosygoles;

ALTER TABLE Stadiums
ADD PRIMARY KEY (stadium_id);


 # Creacion de la Tabla Teams
DROP TABLE IF EXISTS Teams;
CREATE TABLE
	Teams
SELECT DISTINCT
    matches_away_team_id AS team_id,
	away_team_name AS team_name,
	away_mens_team AS mens_team,
	away_womens_team AS womens_team,
	away_region_name AS region_name

FROM
	dspartidosygoles;

ALTER TABLE Teams
ADD PRIMARY KEY (team_id);


 # Creacion de la Tabla Tournaments
DROP TABLE IF EXISTS Tournaments;
CREATE TABLE
	Tournaments
SELECT DISTINCT
	matches_tournament_id AS tournament_id,
	tournaments_tournament_name AS tournament_name,
	tournaments_year,
	tournaments_host_country AS host_country,
	tournaments_winner AS winner,
	tournaments_count_teams AS count_teams
FROM
	dspartidosygoles;

ALTER TABLE Tournaments
ADD PRIMARY KEY (tournament_id);


 # Creacion de la Tabla Players
DROP TABLE IF EXISTS Players;
CREATE TABLE
	Players
SELECT DISTINCT
	squads_player_id AS player_id,
    players_family_name AS family_name,
    players_given_name AS given_name,
    players_birth_date AS birth_date,
    players_female AS female,
    players_goal_keeper AS goal_keeper,
    players_defender AS defender,
    players_midfielder AS midfielder,
    players_forward AS forward
FROM
	`dsalineacionesxtorneo-2`;

ALTER TABLE Players
ADD PRIMARY KEY (player_id);


   # Creacion de la Tabla Goals
DROP TABLE IF EXISTS Goals;
CREATE TABLE
	Goals
SELECT DISTINCT
	goals_goal_id AS goal_id,
	goals_team_id AS team_id,
	goals_player_id AS player_id,
	goals_player_team_id AS player_team_id,
    matches_tournament_id AS tournament_id,
	goals_minute_label AS minute_label,
	goals_minute_regulation AS minute_regulation,
	goals_minute_stoppage AS minute_stoppage,
	goals_match_period AS match_period,
	goals_own_goal AS own_goal,
	goals_penalty AS penalty
FROM
	dspartidosygoles

WHERE dspartidosygoles.goals_minute_regulation IS NOT NULL;

ALTER TABLE Goals
ADD PRIMARY KEY (goal_id),
ADD CONSTRAINT team_id_1 FOREIGN KEY (team_id) REFERENCES Teams(team_id),
ADD FOREIGN  KEY (player_id) REFERENCES Players(player_id),
ADD CONSTRAINT team_id_2 FOREIGN  KEY (player_team_id) REFERENCES Teams(team_id),
ADD FOREIGN  KEY (tournament_id) REFERENCES Tournaments(tournament_id);


 # Creacion de la Tabla Matches
DROP TABLE IF EXISTS Matches;
CREATE TABLE
	Matches
SELECT DISTINCT
    matches_match_id AS match_id,
    matches_tournament_id AS tournament_id,
	matches_away_team_id AS away_team_id,
	matches_home_team_id AS home_team_id,
	matches_stadium_id AS stadium_id,
	matches_match_date AS match_date,
	matches_match_time AS match_time,
	matches_stage_name AS stage_name,
	matches_home_team_score AS home_team_score,
	matches_away_team_score AS away_team_score,
	matches_extra_time AS extra_time,
	matches_penalty_shootout AS penalty_shootout,
	matches_home_team_score_penalties AS home_team_score_penalties,
	matches_away_team_score_penalties AS away_team_score_penalties,
	matches_result AS result
FROM
	dspartidosygoles;

ALTER TABLE Matches
ADD PRIMARY KEY (match_id),
ADD FOREIGN  KEY (tournament_id) REFERENCES Tournaments(tournament_id),
ADD CONSTRAINT teamid_1 FOREIGN  KEY (away_team_id) REFERENCES Teams(team_id),
ADD CONSTRAINT teamid_2 FOREIGN  KEY (home_team_id) REFERENCES Teams(team_id),
ADD FOREIGN  KEY (stadium_id) REFERENCES Stadiums(stadium_id);


 # Creacion de la Tabla SQUADS
DROP TABLE IF EXISTS Squads;
CREATE TABLE
	Squads
SELECT DISTINCT
	squads_player_id AS player_id,
	squads_tournament_id AS tournament_id,
	squads_team_id AS team_id,
	squads_shirt_number AS shirt_number,
	squads_position_name AS position_name
FROM
	`dsalineacionesxtorneo-2`;

ALTER TABLE Squads
ADD FOREIGN  KEY (player_id) REFERENCES Players(player_id),
ADD FOREIGN  KEY (tournament_id) REFERENCES Tournaments(tournament_id),
ADD FOREIGN  KEY (team_id) REFERENCES Teams(team_id);

SELECT squads_team_id, COUNT(squads_tournament_id)
FROM `dsalineacionesxtorneo-2`
WHERE squads_team_id = 'T-59'
GROUP BY 1
ORDER BY 2;


