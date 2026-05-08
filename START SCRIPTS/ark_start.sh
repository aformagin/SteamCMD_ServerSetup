#!/bin/bash

# --- ARK: Survival Evolved server configuration ---
MAP="TheIsland"               # TheIsland, TheCenter, Ragnarok, Extinction, Genesis, Genesis2, CrystalIsles
SESSION_NAME="ARK Server"
SERVER_PASSWORD=""            # Leave empty for no join password
ADMIN_PASSWORD="changeme"
PORT=7777
QUERY_PORT=27015
MAX_PLAYERS=70

# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVER_DIR="$SCRIPT_DIR/../Servers/Ark"
EXECUTABLE="$SERVER_DIR/ShooterGame/Binaries/Linux/ShooterGameServer"

cd "$SERVER_DIR" || { echo "ERROR: Server directory not found: $SERVER_DIR"; exit 1; }

echo "Starting ARK: Survival Evolved server..."
"$EXECUTABLE" \
    "$MAP?listen?SessionName=$SESSION_NAME?ServerPassword=$SERVER_PASSWORD?ServerAdminPassword=$ADMIN_PASSWORD?Port=$PORT?QueryPort=$QUERY_PORT?MaxPlayers=$MAX_PLAYERS" \
    -server -log
