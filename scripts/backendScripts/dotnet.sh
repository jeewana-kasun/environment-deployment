backendType=$1

echo "============================="
echo "Remove existing .Net packages..."
echo "============================="
echo "                "

# Remove any .NET packages
sudo apt-get remove --purge dotnet* -y -qq

# Clean up unnecessary dependencies
sudo apt-get autoremove -y -qq
echo "                "

#===================================================================================================

echo "============================="
echo "Installing .Net..."
echo "============================="
echo "                "

# Install the Microsoft package signing key and repository
wget https://packages.microsoft.com/keys/microsoft.asc
sudo apt-key add microsoft.asc
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list)"

# Update the package list
sudo apt-get update -y -qq

# Install .NET SDK or Runtime
sudo apt-get install dotnet-sdk-6.0 -y -qq
sudo apt-get install dotnet-runtime-6.0 -y -qq

# Verify the Installation
dotnet --version

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

    sh python-dCompose-down.sh

else
    echo "It's not a valid backend option... Bye Bye !!!"
fi