#!/bin/bash
folderPath="../projects/backend"

# Check if .csproj or .sln files exist
if ls $folderPath/*.csproj $folderPath/*.sln 1> /dev/null 2>&1; then
    echo "|||||||||||||||||||||||||||||"
    echo "Backend Project folder contains a .NET project."
    echo "|||||||||||||||||||||||||||||"
elif ls $folderPath/requirements.txt $folderPath/*.py $folderPath/pyproject.toml 1> /dev/null 2>&1; then
    echo "|||||||||||||||||||||||||||||"
    echo "Backend Project folder contains a python project."
    echo "|||||||||||||||||||||||||||||"
else
    echo "|||||||||||||||||||||||||||||"
    echo "No .NET or python project found."
    echo "|||||||||||||||||||||||||||||"
fi