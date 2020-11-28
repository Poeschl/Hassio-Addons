# Docker Container Stats (Home Assistant Addon)

It contains [Docker Container Stats](https://github.com/virtualzone/docker-container-stats) to monitor all running containers / addons.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

## Security

Since the addon accesses the docker api, the security rating is this low.
Unfortunately there is now way to access the docker api without disabling the *Protection Mode* of the addon.
Technically with disabling it, the addon can access and control other addons and the core on a HA supervised system.
But without it we can not retrieve the statistics of the running container and this addon don't work at all.


[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white)](https://www.buymeacoffee.com/Poeschl)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
