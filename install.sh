#!/bin/bash

# Update package list and install Docker, Git
sudo apt-get update
sudo apt-get install -y docker.io git

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Install NGINX
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Create a directory for the json-server data
mkdir -p /home/azureuser/json-server
echo '{
  "posts": [
    { "id": 1, "title": "Hello World" }
  ]
}' > /home/azureuser/json-server/db.json

# Pull and run the json-server Docker container
sudo docker run -d -p 3000:3000 -v /home/azureuser/json-server/db.json:/data/db.json clue/json-server

# Restart NGINX to ensure it picks up the new service (optional)
sudo systemctl restart nginx
