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

# Configuration

Full configuration:
```yaml
repository: 
  url: <path to your repository>
  username: user
  password: pass
  pull_before_push: true
exclude:
  - '*.db'
  - '*.log
  - __pycache__
  - deps/
  - known_devices.yaml
  - tts/
checks:
  enabled: true
  check_for_secrets: true
  check_for_ips: true
```

`repository.url`: Any https url to your git repository. (For now _no_ SSH)

`repository.username`: Your username for https authentication.

`repository.password`: Your password or __accesstoken__ for your repository.

`repository.pull_before_push`: Should the repository be pulled first and commit the new state on top?

`exclude`: The files / folders which should be excluded from the export. (see also default excludes below)

`checks.enabled`: Enable / Disable the checks in the exported files.

`checks.check_for_secrets`: Add your secret values to the check.

`checks.check_for_ips`: Add pattern for ip and mac addresses to the search.

### Default excludes

Following folders and files are excluded from the sync per default:
* `secrets.yaml` (secrets are cleared)
* `.cloud`
* `.storage`

[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png)](https://www.buymeacoffee.com/Poeschl)
