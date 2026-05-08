#!/bin/bash

# --- DayZ server configuration ---
# NOTE: The stable DayZ server (App ID 223350) has no native Linux support.
# If this server fails to launch, use dayz_experimental_start.sh instead.
# Server name, admin password, and max players are set in serverDZ.cfg.
PORT=2302
CONFIG="serverDZ.cfg"
BE_PATH="./battleye"
PROFILES_PATH="./profiles"

# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVER_DIR="$SCRIPT_DIR/../Servers/DayZ"

cd "$SERVER_DIR" || { echo "ERROR: Server directory not found: $SERVER_DIR"; exit 1; }

echo "Starting DayZ server..."
./DayZServer_x64 \
    -config="$CONFIG" \
    -port="$PORT" \
    -BEpath="$BE_PATH" \
    -profiles="$PROFILES_PATH" \
    -dologs \
    -adminlog \
    -netlog \
    -freezecheck
