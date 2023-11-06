#!/bin/bash

# Define an array of Premier League teams
teams=("Arsenal" "Aston Villa" "Bournemouth" "Brentford" "Brighton" "Chelsea" "Crystal Palace" "Everton" "Fulham" "Leeds United" "Leicester City" "Liverpool" "Manchester City" "Manchester United" "Newcastle United" "Nottingham Forest" "Southampton" "Tottenham Hotspur" "West Ham United" "Wolverhampton Wanderers")

# Get the length of the teams array
num_teams=${#teams[@]}

# Randomly assign a team to Ross
ross_team=${teams[$((RANDOM % num_teams))]}

# Randomly assign a team to Joey, different from Ross's team
while true; do
    joey_team=${teams[$((RANDOM % num_teams))]}
    if [[ "$joey_team" != "$ross_team" ]]; then
        break
    fi
done

# Randomly assign a team to James, different from Ross's and Joey's teams
while true; do
    james_team=${teams[$((RANDOM % num_teams))]}
    if [[ "$james_team" != "$ross_team" ]] && [[ "$james_team" != "$joey_team" ]]; then
        break
    fi
done

# Output the results
echo "Ross has been assigned: $ross_team"
echo "Joey has been assigned: $joey_team"
echo "James has been assigned: $james_team"
