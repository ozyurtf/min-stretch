#!/bin/bash

# The root directory to search from
rootDir="$1"

# The file to store the results
outputFile="r3d_files.json"

# Start the JSON array
echo "[" > "$outputFile"

# Initialize a variable to handle comma separation in JSON
first=1

# Find all directories exactly at the 3rd level of depth and process them
find "$rootDir" -mindepth 4 -maxdepth 4 -type d | while read dir; do
  # For the first entry, don't prepend a comma
  if [ $first -ne 1 ]; then
    echo "," >> "$outputFile"
  else
    first=0
  fi
  # Append the directory name with .zip and wrap in quotes for JSON
  echo -n "    \"$dir.zip\"" >> "$outputFile"
done

# Close the JSON array
echo -e "\n]" >> "$outputFile"

# Rename the JSON file to .txt and move it to the root directory
mv r3d_files.json r3d_files.txt
mv r3d_files.txt "$rootDir"

echo "Directories at the 3rd level have been written to $rootDir/r3d_files.txt in JSON format"
