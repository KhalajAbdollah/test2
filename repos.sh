read -p "Enter GitHub username: " username

repos=$(curl -s "https://api.github.com/users/${username}/repos?per_page=100" | jq -r '.[].name')

if [ -z "$repos" ]; then
    echo "No repositories found for $username."
else
    echo "Repositories for $username:"
    echo "$repos"
fi
