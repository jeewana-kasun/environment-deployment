echo "============================="
echo "[START] Remove existing docker..."
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

echo "============================="
echo "[FINISH] Remove existing docker..."
echo "============================="
echo "                "

echo "============================="
echo "[START] Install docker..."
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
sleep 60

# Start and Enable Docker Service
sudo systemctl start docker
sudo systemctl enable docker

# Check Docker service status
sudo systemctl status docker

# Run Docker as a Non-root User (Optional)
sudo usermod -aG docker $USER

echo "============================="
echo "[FINISH] Install docker..."
echo "============================="
echo "                "

echo "============================="
echo "[START] Remove existing .Net packages..."
echo "============================="
echo "                "

# Remove any .NET packages
sudo apt-get remove --purge dotnet* -y -qq

# Clean up unnecessary dependencies
sudo apt-get autoremove -y -qq

echo "============================="
echo "[FINISH] Remove existing .Net packages..."
echo "============================="
echo "                "

echo "============================="
echo "[START] Installing .Net..."
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

echo "============================="
echo "[FINISH] Installing .Net..."
echo "============================="
echo "                "

echo "============================="
echo "[START] Run Docker Compose..."
echo "============================="

# Go into new repository script folder
cd src-scripts

# Run docker compose
sudo docker compose up -d

# List docker images
sudo docker image ls

# List docker containers
sudo docker ps

echo "============================="
echo "[FINISH] Run Docker Compose..."
echo "============================="
echo "                "

# Store the end time
end_time=$(date +%s)

# Calculate the duration
duration=$(( end_time - start_time ))

# Print the duration
echo "Total Execution Time: $duration seconds"