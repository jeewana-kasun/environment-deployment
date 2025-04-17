
#!/bin/sh/

backendType=$1
projectTypeInBackendFolder=$2
deploymentRepoName=$3

echo "============================="
echo "Remove existing docker..."
echo "============================="

# Stop docker service
sudo systemctl stop docker.service

# Disable docker service
sudo systemctl disable docker

# Remove docker installation packages
sudo apt remove --purge docker-ce docker-ce-cli containerd.io -y -qq

# Auto Remove docker dependancies
sudo apt autoremove -y -qq

# Delete docker configuration files
sudo rm -rf /var/lib/docker
echo "                "

echo "============================="
echo "Install docker..."
echo "============================="

# Update the Package Index
sudo apt update -y -qq

# Install Required Dependencies
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y -qq

# Add Docker’s Official GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker Repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the Package Index
sudo apt update -y -qq

# Install Docker CE (Community Edition)
sudo apt install docker-ce -y -qq

# Wait for 60 seconds
sleep 30

# Check if docker is active and run the rest of the script
if systemctl is-active --quiet docker; then
    echo "Docker is running"
else
    # Start and Enable Docker Service
    sudo systemctl start docker
    echo "Starting Docker..."
fi

# Run Docker as a Non-root User (Optional)
sudo usermod -aG docker $USER
echo "                "

pwd

echo $backendType
echo $projectTypeInBackendFolder

if [ $backendType = "dotnet" ] && [ $projectTypeInBackendFolder = "dotnetProject" ]; then

    echo "============================="
    echo "Starting Docker execution with .Net backend project"
    echo "============================="

    cd ../$deploymentRepoName/
    sh scripts/backendScripts/dotnet.sh $backendType $ochestration

elif [ "$backendType" = "python" ] && [ $projectTypeInBackendFolder = "pythonProject" ]; then

    echo "============================="
    echo "Starting Docker execution with Python backend project"
    echo "============================="

    cd ../$deploymentRepoName/
    sh scripts/backendScripts/python.sh

else
    echo "It's not a valid option... Bye Bye !!!"
fi