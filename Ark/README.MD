**Ark Server Setup**
____

Ports that are required to be open by default(can be changed in settings):  
| Port      | TCP/UDP | Name      |
|-----------|---------|-----------|
| 7777:7778 | BOTH    | Game Port |
| 27015     | UDP     | RCON      |
| 27020     | TCP     | ???       |

This script is meant for Debian based systems - Due to this, the location to move the GameUserSettings.ini will be "<INSTALL_LOCATION>/ShooterGame/Saved/Config/GameUserSettings.ini"
as well as the start script being moved to "<INSTALL_LOCATION>/ShooterGame/Binaries/Linux/start_server.sh"
