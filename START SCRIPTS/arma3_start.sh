#!/bin/bash

# --- Arma 3 server configuration ---
# Max players and server name are set in server.cfg, not on the command line.
# Place server.cfg and basic.cfg in the server install directory before starting.
PORT=2302
PROFILE_NAME="server"         # Must match a profile under ~/.local/share/Arma 3 - Other Profiles/

# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVER_DIR="$SCRIPT_DIR/../Servers/Arma3"

cd "$SERVER_DIR" || { echo "ERROR: Server directory not found: $SERVER_DIR"; exit 1; }

echo "Starting Arma 3 server..."
./arma3server_x64 \
    -ip=0.0.0.0 \
    -port="$PORT" \
    -cfg=basic.cfg \
    -config=server.cfg \
    -name="$PROFILE_NAME" \
    -bepath=./battleye
