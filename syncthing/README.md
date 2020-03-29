# Syncthing Addon
![armhf image pulls](https://img.shields.io/docker/pulls/poeschl/ha-syncthing-armhf?label=docker%20pulls%20%28armhf%29)
![armv7 image pulls](https://img.shields.io/docker/pulls/poeschl/ha-syncthing-armv7?label=docker%20pulls%20%28armv7%29)
![aarch64 image pulls](https://img.shields.io/docker/pulls/poeschl/ha-syncthing-aarch64?label=docker%20pulls%20%28amd64%29)
![amd64 image pulls](https://img.shields.io/docker/pulls/poeschl/ha-syncthing-amd64?label=docker%20pulls%20%28amd64%29)
![i386 image pulls](https://img.shields.io/docker/pulls/poeschl/ha-syncthing-i386?label=docker%20pulls%20%28i386%29)

[Syncthing](https://syncthing.net/) wrapped inside a Homeassistant supervisor addon.

Syncthing is a continuous file synchronization program. It synchronizes files between two or more computers in real time, safely protected from prying eyes. Your data is your data alone and you deserve to choose where it is stored, whether it is shared with some third party, and how it's transmitted over the internet.

# Folders available

When using this addon to permanently hold your data, put the synced folder inside `/data`. Otherwise it will be deleted on container restart.

Also the `/share`, `/confg`, `/backup` and `/addons` folders is mapped inside. Your can use them as persistant storage, too.
They can also be used to backup the Home Assistant backups. 😉

# Configuration

The configuration is done via the web ui. Start the addon and configure it there.

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white)](https://www.buymeacoffee.com/Poeschl)
