#!/bin/bash

# The root directory to search from
rootDir="/home/robot_lab/data/all-drawer-opening-data-clean/drawer_opening"

# The file to store the results
outputFile="r3d_files.json"

# Start the JSON array
echo "[" > "$outputFile"

# Initialize a variable to handle comma separation in JSON
first=1

# Find all directories, then check each one to see if it is a leaf directory
find "$rootDir" -type d | while read dir; do
  if [ $(find "$dir" -mindepth 1 -type d | wc -l) -eq 0 ]; then
    # For the first entry, don't prepend a comma
    if [ $first -ne 1 ]; then
      echo "," >> "$outputFile"
    else
      first=0
    fi
    # Append the directory name with .zip and wrap in quotes for JSON
    echo -n "    \"$dir.zip\"" >> "$outputFile"
  fi
done

# Close the JSON array
echo -e "\n]" >> "$outputFile"

mv r3d_files.json r3d_files.txt
mv r3d_files.txt $rootDir

echo "Leaf directories have been written to $rootDir/r3d_files.txt in JSON format"
