# Home Assistant Git Exporter

Export all of your Home Assistant configuration to a git repository of your choice.
Can be used to show your Home Assistant setup in public repositories.

![Addon Stage][stage-badge]
![Supports aarch64 Architecture][aarch64-badge]
![Supports amd64 Architecture][amd64-badge]
![Supports armhf Architecture][armhf-badge]
![Supports armv7 Architecture][armv7-badge]
![Supports i386 Architecture][i386-badge]

[![Install on my Home Assistant][install-badge]][install-url]
[![Donate][donation-badge]][donation-url]

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


[aarch64-badge]: https://img.shields.io/badge/aarch64-yes-green.svg?style=for-the-badge
[amd64-badge]: https://img.shields.io/badge/amd64-yes-green.svg?style=for-the-badge
[armhf-badge]: https://img.shields.io/badge/armhf-yes-green.svg?style=for-the-badge
[armv7-badge]: https://img.shields.io/badge/armv7-yes-green.svg?style=for-the-badge
[i386-badge]: https://img.shields.io/badge/i386-yes-green.svg?style=for-the-badge
[install-url]: https://my.home-assistant.io/redirect/supervisor_addon?addon=243ffc37_git-exporter
[stage-badge]: https://img.shields.io/badge/Addon%20stage-stable-green.svg?style=for-the-badge

[install-badge]: https://img.shields.io/badge/Install%20on%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white
[donation-url]: https://www.buymeacoffee.com/Poeschl
