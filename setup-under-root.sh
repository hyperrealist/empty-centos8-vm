#!/bin/bash

# For reference: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html.
set -vxeuo pipefail

# Clean-up a leftover file (owned by root) produced before us.
sudo rm -f /home/vagrant/.wget-hsts

# Prepare mirrorlist
sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
sudo yum update -y

# install essential tools
sudo yum install -y wget git tmux

# Enable PowerTools
# sudo dnf config-manager --enable powertools
# sudo yum update
# sudo yum install -y xorg-x11-server-Xorg xorg-x11-utils xorg-x11-apps

sudo yum remove -y docker docker-engine docker.io containerd runc || true
