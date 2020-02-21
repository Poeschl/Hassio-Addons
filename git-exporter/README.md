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
* Export Lovelace configuration
* Export ESPHome configurations
* Export Supervisor Addons config
* Check for plaintext secrets based on your `secrets.yaml` file and common patterns.
* Check for plaintext ip and addresses in your config.

# Example

For an example take a look at my own [Home Assistant configuration](https://github.com/Poeschl/home-assistant-config).
The folders there are gettings synced with this addon.

# Configuration

Full configuration:
```yaml
repository: 
  url: <path to your repository>
  username: user
  password: pass
  pull_before_push: true
  commit_message: 'Home Assistant Git Exporter'
export:
  lovelace: true
  addons: true
  esphome: true
checks:
  enabled: true
  check_for_secrets: true
  check_for_ips: true
exclude:
  - '*.db'
  - '*.log
  - __pycache__
  - deps/
  - known_devices.yaml
  - tts/
```

`repository.url`: Any https url to your git repository. (For now _no_ SSH)

`repository.username`: Your username for https authentication.

`repository.password`: Your password or __accesstoken__ for your repository.

`repository.pull_before_push`: Should the repository be pulled first and commit the new state on top?

`repository.commit_message`: The commit message for the next commit.


`export.lovelace`: Enable / Disable the export for the lovelace config.

`export.addons`: Enable / Disable the export for the supervisor addons config.

`export.esphome`: Enable / Disable the export for the esphome config.


`checks.enabled`: Enable / Disable the checks in the exported files.

`checks.check_for_secrets`: Add your secret values to the check.

`checks.check_for_ips`: Add pattern for ip and mac addresses to the search.


`exclude`: The files / folders which should be excluded from the config export. (see also default excludes below)

### Default excludes

Following folders and files are excluded from the sync per default:
* `secrets.yaml` (secrets are cleared)
* `.cloud`
* `.storage`

# Badge

If you export your config with this addon and want to help me to spread it further. Here is a badge you can embedd in your readme.

[![Home Assistant Git Exporter](https://img.shields.io/badge/Powered%20by-Home%20Assistant%20Git%20Exporter-%23d32f2f)](https://github.com/Poeschl/Hassio-Addons/tree/master/git-exporter)

```markdown
[![Home Assistant Git Exporter](https://img.shields.io/badge/Powered%20by-Home%20Assistant%20Git%20Exporter-%23d32f2f)](https://github.com/Poeschl/Hassio-Addons/tree/master/git-exporter)
```

[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png)](https://www.buymeacoffee.com/Poeschl)
