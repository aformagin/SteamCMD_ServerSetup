#!/bin/bash

echo "SteamCMD Server Management"
echo "=========================="
echo "1) Run SteamCMD setup/install"
echo "2) Install a game server"
echo ""
read -p "Enter your choice (1-2): " CHOICE

case $CHOICE in
    1)
        echo "This is not an automated install! Please stick around to enter your Admin password :)"
        echo "Starting SteamCMD install and setup..."
        sleep 5

        echo "Adding the 'steam' user."
        useradd -m steam
        echo "Setting the password for the 'steam' user."
        passwd steam

        sudo -u steam -s
        cd /home/steam

        # TODO Put a check for system architecture here and then do the right install accordingly

        # for 32-bit systems:
        # apt install steamcmd

        echo "Adding multiverse repository because system is 64-bit"
        add-apt-repository multiverse
        echo "Adding i386 arch"
        dpkg --add-architecture i386

        echo "apt update about to execute..."
        sleep 1
        apt update

        echo "Installing steamcmd, screen and dependencies"
        sleep 1
        apt install lib32gcc-s1 steamcmd screen

        echo "Linking SteamCMD executable..."
        sudo ln -s /usr/games/steamcmd /home/steam/steamcmd
        echo "Script finished running... Review for errors."
        ;;

    2)
        echo ""
        echo "Select a game server to install:"
        echo "1) ARK: Survival Evolved  (ID: 376030)"
        echo "2) Arma 3                 (ID: 233780)"
        echo "3) Valheim                (ID: 896660)"
        echo "4) DayZ                   (ID: 223350)"
        echo "5) DayZ Experimental      (ID: 1042420)"
        echo ""
        read -p "Enter your choice (1-5): " GAME_CHOICE

        case $GAME_CHOICE in
            1) GAME_NAME="Ark";               APP_ID="376030";  INSTALL_DIR="Servers/Ark" ;;
            2) GAME_NAME="Arma3";             APP_ID="233780";  INSTALL_DIR="Servers/Arma3" ;;
            3) GAME_NAME="Valheim";           APP_ID="896660";  INSTALL_DIR="Servers/Valheim" ;;
            4) GAME_NAME="DayZ";              APP_ID="223350";  INSTALL_DIR="Servers/DayZ" ;;
            5) GAME_NAME="DayZ_Experimental"; APP_ID="1042420"; INSTALL_DIR="Servers/DayZ_Experimental" ;;
            *)
                echo "Invalid choice. Exiting."
                exit 1
                ;;
        esac

        echo "Creating directory for $GAME_NAME ($INSTALL_DIR/)"
        mkdir -p "$INSTALL_DIR"
        echo "Starting $GAME_NAME server download..."
        WORKING_DIR=$(pwd)
        steamcmd +force_install_dir "$WORKING_DIR/$INSTALL_DIR" +login anonymous +app_update "$APP_ID" validate +quit
        echo "$GAME_NAME server installation complete. Review for errors."
        ;;

    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac
