#!/bin/bash
folderPath="../projects/backend"

# Check if .csproj or .sln files exist
if ls $folderPath/*.csproj $folderPath/*.sln 1> /dev/null 2>&1; then
    echo "This folder contains a .NET project."
else
    echo "No .NET project found."
fi