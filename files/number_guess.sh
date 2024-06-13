#!/bin/bash

# Create PSQL connection variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate Random Nnumber
MIN=1
MAX=1000
SECRET_NUMBER=$(($RANDOM%($MAX-$MIN+1)+$MIN))

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'");

if [[ -z $USER_ID ]]
  then
    echo Welcome, $USERNAME! It looks like this is your first time here.
    ADD_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'");
  else
    # GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
    # BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")
    
    GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID")
    echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

echo Guess the secret number between 1 and 1000:
read GUESS
NUMBER_OF_GUESSES=1

while (( $GUESS != $SECRET_NUMBER ))
  do
    if ! [[ $GUESS =~ ^[0-9]+$ ]] 
      then
        echo "That is not an integer, guess again:"
      elif (( GUESS > SECRET_NUMBER ))
        then
          echo "It's lower than that, guess again:"
      else
          echo "It's higher than that, guess again:"
    fi
  read GUESS
  ((NUMBER_OF_GUESSES++))
done

UPDATE_RECORD=$($PSQL "INSERT INTO games(user_id, number_of_guesses) values($USER_ID, $NUMBER_OF_GUESSES)")
echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!