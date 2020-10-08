# Syncthing Addon

[Syncthing](https://syncthing.net/) wrapped inside a Homeassistant supervisor addon.

Syncthing is a continuous file synchronization program. It synchronizes files between two or more computers in real time, safely protected from prying eyes. Your data is your data alone and you deserve to choose where it is stored, whether it is shared with some third party, and how it's transmitted over the internet.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

# Folders available

When using this addon to permanently hold your data, put the synced folder inside `/data`. Otherwise it will be deleted on container restart.

Also the `/share`, `/confg`, `/backup`, `/addons` and `/ssl` folders is mapped inside. Your can use them as persistant storage, too.
They can also be used to backup the Home Assistant backups. 😉

# Configuration

The configuration is done via the web ui. Start the addon and configure it there.

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white)](https://www.buymeacoffee.com/Poeschl)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
