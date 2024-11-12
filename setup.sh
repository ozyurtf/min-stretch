#!/bin/bash

# Usage: ./update_project_root.sh

# Define the relative path to the config file
CONFIG_FILE="imitation-in-homes/configs/env_vars/env_vars.yaml"

# Check if the config file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Configuration file $CONFIG_FILE not found!"
    exit 1
fi

# Get the current directory and define the path to imitation-in-homes folder
IMI_HOME_DIR="$(pwd)/imitation-in-homes"

# Check if the imitation-in-homes folder exists
if [[ ! -d "$IMI_HOME_DIR" ]]; then
    echo "imitation-in-homes folder not found in the current directory!"
    exit 1
fi

# Update project_root path to the imitation-in-homes folder
sed -i "s|^\(project_root: \).*|\1$IMI_HOME_DIR|" "$CONFIG_FILE"

echo "project_root updated to $IMI_HOME_DIR in $CONFIG_FILE"
