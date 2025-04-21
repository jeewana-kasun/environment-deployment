#!/bin/sh/

echo "============================="
echo "Remove existing Angular packages..."
echo "============================="
echo "                "

# Uninstall Angular CLI (Globally)
sudo npm uninstall -g @angular/cli

# Clean up npm cache
sudo npm cache clean --force

#====================================================

echo "============================="
echo "Installing Angular..."
echo "============================="
echo "                "

# Update the package list
sudo apt update

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

#===================================================================================================

if [ $ochestration = "docker" ]; then

    echo "============================="
    echo "Starting Docker compose..."
    echo "============================="
    echo "                "

    cd scripts/orchestration/
    docker compose up --build -d

    docker image ls
    docker ps

elif [ $ochestration = "k8s" ]; then

    echo "K8s deployment not yet implemented..."

else
    echo "It's not a valid backend option... Bye Bye !!!"
fi