#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $YEAR == "year" ]] 
  then
    continue
  fi

  NAME_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
  if [[ -z $NAME_ID ]] 
  then
    INSERT_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
  fi

  NAME_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  if [[ -z $NAME_ID ]] 
  then
    INSERT_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
  fi

done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $YEAR == "year" ]] 
  then
    continue
  fi
  
  WINNER_ID=$($PSQL"SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, opponent_goals, winner_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $OPPONENT_GOALS, $WINNER_GOALS)")

done