#!bin/sh/

echo "Please enter your repo URL:"
read repoUrl

# Extract the repository name from the URL
repo_name=$(basename "$repoUrl" | sed 's/.git$//')

# Print the repository name
echo "Repository name: $repo_name"

cd $repo_name

pwd