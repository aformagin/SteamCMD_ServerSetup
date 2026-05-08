#!/bin/bash

# --- Valheim server configuration ---
SERVER_NAME="Valheim Server"
PORT=2456                     # Uses three consecutive ports: PORT, PORT+1, PORT+2 (UDP)
PASSWORD="changeme"           # Minimum 5 characters; cannot match SERVER_NAME
WORLD_NAME="Dedicated"        # Save file name; created automatically on first run
PUBLIC=1                      # 1 = visible in server browser, 0 = private

# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVER_DIR="$SCRIPT_DIR/../Servers/Valheim"

cd "$SERVER_DIR" || { echo "ERROR: Server directory not found: $SERVER_DIR"; exit 1; }

export LD_LIBRARY_PATH="./linux64:$LD_LIBRARY_PATH"
export SteamAppId=892970

echo "Starting Valheim server..."
./valheim_server.x86_64 \
    -name "$SERVER_NAME" \
    -port "$PORT" \
    -password "$PASSWORD" \
    -world "$WORLD_NAME" \
    -public "$PUBLIC" \
    -nographics \
    -batchmode
