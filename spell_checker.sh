#!/bin/bash

#This is a script that asks a user for a folder and spell checks every file in that folder.
#The command below checks if aspell is already installed and then installs it only if it is not installed.

if ! command -v aspell &> /dev/null
then
   echo "aspell not yet installed. Installing aspell ..."
   sudo apt-get install aspell
else
   echo "aspell is installed....lets go!"
fi

#script to spell-check

echo "Enter the path to the folder that contains files to be checked:"
read folder_path

for file in "$folder_path"/*.txt; do
    echo "Checking spelling in $file ..."
    aspell -c "$file"
done 
