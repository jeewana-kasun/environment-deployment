#!/bin/bash

echo "                "
date
echo "New Environment Deployment Starting..."
echo "                "

sudo apt-get install jq -y

# Seeting up parameters
ochestration=$(jq -r '.automationConfig.ochestration' config.json)
backendType=$(jq -r '.automationConfig.backendType' config.json)

# Store the start time
start_time=$(date +%s)

echo "============================="
echo "Updating packages..."
echo "============================="
# Update the Package Index
sudo apt-get update -y -qq
echo "                "

echo "============================="
echo "Remove existing git packages..."
echo "============================="
# Remove existing git packages
sudo apt remove git -y -qq
echo "                "

echo "============================="
echo "Installing Git..."
echo "============================="
# Installing Git
sudo apt install git -y -qq
echo "                "

echo "============================="
echo "Cloning SourceCode Repository..."
echo "============================="

# Create new folders
rm -rf SourceCode
sudo mkdir SourceCode

# Go into new folder
cd SourceCode

# Clone the source code repository 
echo "Please enter your repo URL:"
read repoUrl
sudo git clone $repoUrl
echo "                "

# Extract the repository name from the URL
repo_name=$(basename "$repoUrl" | sed 's/.git$//')

# Print the repository name
echo "Repository name: $repo_name"
cd $repo_name

if [ "$ochestration" = "docker" ]; then

    sh main-docker.sh $backendType

elif [ "$ochestration" = "k8s" ]; then

    echo "|||||||||||||||||||||||||||||"
    echo "Kubernetes execution is not yet implemented"
    echo "|||||||||||||||||||||||||||||"
    
else
    echo "It's not a valid option... Bye Bye !!!"
fi