# Home Assistant Git Exporter

Export all of your Home Assistant configuration to a git repository of your choice.
Can be used to show your Home Assistant setup in public repositories.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

# Functionality

* Export Home Assistant configuration
* Export Supervisor Addon configuration
* Export Lovelace configuration
* Export ESPHome configurations
* Export Node-RED flows
* Check for plaintext secrets based on your `secrets.yaml` file and common patterns.
* Check for plaintext ip and addresses in your config.

# Example

For an example take a look at my own [Home Assistant configuration](https://github.com/Poeschl/home-assistant-config).
The folders there are gettings synced with this addon.


# Badge

If you export your config with this addon and want to help me to spread it further. Here is a badge you can embedd in your readme.

[![Home Assistant Git Exporter](https://img.shields.io/badge/Powered%20by-Home%20Assistant%20Git%20Exporter-%23d32f2f)](https://github.com/Poeschl/Hassio-Addons/tree/master/git-exporter)

```markdown
[![Home Assistant Git Exporter](https://img.shields.io/badge/Powered%20by-Home%20Assistant%20Git%20Exporter-%23d32f2f)](https://github.com/Poeschl/Hassio-Addons/tree/master/git-exporter)
```

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white)](https://www.buymeacoffee.com/Poeschl)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
