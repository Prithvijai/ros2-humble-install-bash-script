#!/bin/bash

echo "Installing ROS2 humble into the system"

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale

sudo apt install software-properties-common
sudo add-apt-repository universe

echo "adding ROS 2 GPG key"
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt upgrade

echo "Enter"
echo " 0 --> desktop intall"
echo " 1--> Ros base"
echo " 2 --> Development tools"
read $VALUE
if [ $VALUE = 0 ]; then
		sudo apt install ros-humble-desktop
		echo "Installed"
elif [ $VALUE = 1]; then
		sudo apt install ros-humble-ros-base
		echo "Installed"
elif [$VALUE = 2]; then
		sudo apt install ros-dev-tools
		echo "Installed"
else
		echo "wrong value"
fi
