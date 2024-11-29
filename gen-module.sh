#!/bin/bash

# Prompt the user for the directory name
read -p "Enter the directory name (e.g., 'user'): " DIRECTORY

# Define the file names to create inside the directory
FILES=(
  "$DIRECTORY.model.ts"
  "$DIRECTORY.service.ts"
  "$DIRECTORY.controller.ts"
  "$DIRECTORY.route.ts"
)

# Check if the directory already exists
if [ -d "$DIRECTORY" ]; then
  echo "Directory '$DIRECTORY' already exists."
else
  # Create the directory
  mkdir "$DIRECTORY"
  echo "Created directory '$DIRECTORY'."

  # Create files inside the specified directory
  for FILE in "${FILES[@]}"; do
    touch "$DIRECTORY/$FILE"
    echo "Created file '$DIRECTORY/$FILE'."
  done
fi
