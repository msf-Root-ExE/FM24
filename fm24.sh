#!/bin/bash

# Define an array of Premier League teams
teams=("Arsenal" "Aston Villa" "Bournemouth" "Brentford" "Brighton" "Chelsea" "Crystal Palace" "Everton" "Fulham" "Leeds United" "Leicester City" "Liverpool" "Manchester City" "Manchester United" "Newcastle United" "Nottingham Forest" "Southampton" "Tottenham Hotspur" "West Ham United" "Wolverhampton Wanderers")

# Define an array of names
names=("Ross" "Joey" "James")

# Shuffle the names
shuffled_names=($(shuf -e "${names[@]}"))

# Function to assign a team to a person
assign_team() {
    local name=$1
    local pick
    while true; do
        pick=${teams[$((RANDOM % ${#teams[@]}))]}
        if [[ ! " ${assigned_teams[@]} " =~ " ${pick} " ]]; then
            echo "$name has been assigned: $pick"
            assigned_teams+=("$pick")
            break
        fi
    done
}

# Function to offer a repick
repick_team() {
    local name=$1
    local current_team=$2
    local pick
    echo "$name, do you want to repick your team? (yes/no)"
    read answer
    if [[ $answer == "yes" ]]; then
        while true; do
            pick=${teams[$((RANDOM % ${#teams[@]}))]}
            if [[ ! " ${assigned_teams[@]} " =~ " ${pick} " && "$pick" != "$current_team" ]]; then
                echo "$name repicked and got: $pick"
                assigned_teams+=("$pick")
                break
            fi
        done
    else
        echo "$name chose to stick with $current_team."
    fi
}

# Assign teams initially
declare -a assigned_teams
for name in "${shuffled_names[@]}"; do
    assign_team "$name"
done

# Offer a repick
for name in "${shuffled_names[@]}"; do
    repick_team "$name" "${assigned_teams[$((RANDOM % ${#assigned_teams[@]}))]}"
done