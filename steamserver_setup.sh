#!/bin/bash

echo "This is not awn automated install! Please stick around to enter your Admin password :)"
echo "Starting SteamCMD install and setup..."

sleep(5)

# Creating Steam user and setting the password
echo "Adding the `steam` user."
useradd -m steam
echo "Setting the password for the `steam` user."
passwd steam

# Going into the Steam home folder
sudo -u steam -s # Instead of elevating to sudo, it will elevate to the Steam user
cd /home/steam

# TODO Put a check for system architecture here and then do the right install accordingly

# for 32-bit systems
# apt install steamcmd # No need for multiverse repo because steamcmd is a 32 bit binary

# Installing SteamCMD for 64-bit system
echo "Adding multiverse repository because system is 64-bit"
add-apt-repository multiverse
echo "Adding i386 arch"
dpkg --add-architecture i386

echo "apt update about to execute..."
sleep(1)
apt update

echo "Installing steamcmd, screen and dependencies"
sleep(1)
apt install lib32gcc-s1 steamcmd screen


echo "Linking SteamCMD executable..."
sudo ln -s /usr/games/steamcmd /home/steam/steamcmd
echo "Script finished running... Review for errors."