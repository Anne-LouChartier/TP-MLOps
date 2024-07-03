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

# Pull and run the API Docker container (replace with your Docker image)
sudo docker run -d -p 3000:3000 your-docker-image......