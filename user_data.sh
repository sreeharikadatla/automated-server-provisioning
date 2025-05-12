#!/bin/bash
# Update system
apt-get update -y
apt-get upgrade -y

# Install Nginx
apt-get install nginx -y
systemctl start nginx
systemctl enable nginx

# Install Docker
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-get update -y
apt-get install -y docker-ce
systemctl start docker
systemctl enable docker

# Add a user and set password
useradd -m harika
echo "harika:Welcome123" | chpasswd

# Add user to docker group
usermod -aG docker harika

# Add user to sudoers group
usermod -aG sudo harika
