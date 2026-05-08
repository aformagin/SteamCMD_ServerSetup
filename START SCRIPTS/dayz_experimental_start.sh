#!/bin/bash

# --- DayZ Experimental server configuration ---
# This branch (App ID 1042420) provides full Linux support and is the
# recommended choice for Linux deployments over stable DayZ (223350).
# Server name, admin password, and max players are set in serverDZ.cfg.
PORT=2302
CONFIG="serverDZ.cfg"
BE_PATH="./battleye"
PROFILES_PATH="./profiles"

# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVER_DIR="$SCRIPT_DIR/../Servers/DayZ_Experimental"

cd "$SERVER_DIR" || { echo "ERROR: Server directory not found: $SERVER_DIR"; exit 1; }

echo "Starting DayZ Experimental server..."
./DayZServer_x64 \
    -config="$CONFIG" \
    -port="$PORT" \
    -BEpath="$BE_PATH" \
    -profiles="$PROFILES_PATH" \
    -dologs \
    -adminlog \
    -netlog \
    -freezecheck
