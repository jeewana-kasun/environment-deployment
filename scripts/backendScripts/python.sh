echo "============================="
echo "Remove existing python packages..."
echo "============================="
echo "                "

# Remove any python packages
sudo apt-get remove --purge 'python3-*' -y -qq

# Clean up unnecessary dependencies
sudo apt-get autoremove -y -qq
echo "                "

#===================================================================================================

echo "============================="
echo "Installing Python..."
echo "============================="
echo "                "

# Update the package list
sudo apt-get update -y -qq

# Install Python (Python 3)
sudo apt install python3 -y -qq

# Install pip for Python 3
sudo apt install python3-pip -y -qq

# Verify the Installation
python3 --version

#===================================================================================================

if [ $ochestration = "docker" ]; then

    echo "============================="
    echo "Starting Docker compose..."
    echo "============================="
    echo "                "

    cd scripts/orchestration/
    sh python-dCompose-up.sh

    docker image ls
    docker ps

elif [ $ochestration = "k8s" ]; then

    echo "K8s deployment not yet implemented..."

else
    echo "It's not a valid backend option... Bye Bye !!!"
fi