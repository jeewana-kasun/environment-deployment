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

docker compose -f docker/docker-compose.yaml up --build