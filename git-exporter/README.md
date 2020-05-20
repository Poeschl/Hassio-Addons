# Home Assistant Git Exporter
![armhf image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-git-exporter-armhf?label=docker%20pulls%20%28armhf%29)
![armv7 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-git-exporter-armv7?label=docker%20pulls%20%28armv7%29)
![aarch64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-git-exporter-aarch64?label=docker%20pulls%20%28aarch64%29)
![amd64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-git-exporter-amd64?label=docker%20pulls%20%28amd64%29)
![i386 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-git-exporter-i386?label=docker%20pulls%20%28i386%29)

Export all of your Home Assistant configuration to a git repository of your choice.
Can be used to show your Home Assistant setup in public repositories.


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

# Configuration

The configuration is located under the Docs tab or [DOCS.md](https://github.com/Poeschl/Hassio-Addons/blob/master/git-exporter/DOCS.md).


# Badge

If you export your config with this addon and want to help me to spread it further. Here is a badge you can embedd in your readme.

[![Home Assistant Git Exporter](https://img.shields.io/badge/Powered%20by-Home%20Assistant%20Git%20Exporter-%23d32f2f)](https://github.com/Poeschl/Hassio-Addons/tree/master/git-exporter)

```markdown
[![Home Assistant Git Exporter](https://img.shields.io/badge/Powered%20by-Home%20Assistant%20Git%20Exporter-%23d32f2f)](https://github.com/Poeschl/Hassio-Addons/tree/master/git-exporter)
```

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white)](https://www.buymeacoffee.com/Poeschl)
