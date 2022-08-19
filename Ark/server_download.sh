#!/bin/bash
echo "Creating directory for Ark (CURRENT_DIR/Servers/Ark/)"
mkdir -p Servers/Ark
echo "Starting ARK:SE Server Download"
WORKING_DIR = pwd
INSTALL = '$WORKING_DIR/Servers/Ark'
steamcmd +force_install_dir $INSTALL +login anonymous +app_update 376030 +quit
