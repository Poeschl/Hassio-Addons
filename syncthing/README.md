# Syncthing Add-on

[**Syncthing**](https://syncthing.net/) wrapped inside a [Home Assistant Supervisor add-on](https://www.home-assistant.io/addons/).

> Syncthing is a continuous file synchronization program. It synchronizes files between two or more computers in real time, safely protected from prying eyes. Your data is your data alone and you deserve to choose where it is stored, whether it is shared with some third party, and how it's transmitted over the internet.

![Addon Stage][stage-badge]
![Supports aarch64 Architecture][aarch64-badge]
![Supports amd64 Architecture][amd64-badge]
![Supports armhf Architecture][armhf-badge]
![Supports armv7 Architecture][armv7-badge]
![Supports i386 Architecture][i386-badge]

[![Add repository on my Home Assistant][repository-badge]][repository-url]
[![Install on my Home Assistant][install-badge]][install-url]
[![Donate][donation-badge]][donation-url]

## Available directories

When using this add-on to permanently hold your data, put the synced folders inside one of the following directories:

- `/data`
- `/media`
- `/share`
- `/config`
- `/ssl`
- `/addons`

Only the above directories are mapped into the add-on container. If you put synced folders in any other directory (like `/root` or `/mnt`), the synced data will be deleted on container restart.

Furthermore, note that

- a backup of the syncthing add-on will include the `/data` directory and its contents.
- a [*full* Home Assistant backup](https://www.home-assistant.io/common-tasks/os/#backups) will include the `/media`, `/share`, `/config`, `/ssl` and `/addons` directories and their contents. Create a *partial* backup to specifically exclude any of them.
- syncing the `/backup` directory (preferably in [send only mode](https://docs.syncthing.net/users/foldertypes.html#send-only-folder)) is a simple way to automatically backup the Home Assistant backups to any of your other Syncthing devices. 😉

## Configuration

The configuration is done via the web UI. Start the add-on and configure it there.


[aarch64-badge]: https://img.shields.io/badge/aarch64-yes-green.svg?style=for-the-badge
[amd64-badge]: https://img.shields.io/badge/amd64-yes-green.svg?style=for-the-badge
[armhf-badge]: https://img.shields.io/badge/armhf-yes-green.svg?style=for-the-badge
[armv7-badge]: https://img.shields.io/badge/armv7-yes-green.svg?style=for-the-badge
[i386-badge]: https://img.shields.io/badge/i386-yes-green.svg?style=for-the-badge
[stage-badge]: https://img.shields.io/badge/Addon%20stage-stable-green.svg?style=for-the-badge
[install-badge]: https://img.shields.io/badge/Install%20on%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white
[donation-url]: https://www.buymeacoffee.com/Poeschl
[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge

[install-url]: https://my.home-assistant.io/redirect/supervisor_addon?addon=243ffc37_syncthing
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPoeschl%2FHassio-Addons
