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
* Export ESPHome configurations
* Check for plaintext secrets based on your `secrets.yaml` file.
* Check for plaintext ip addresses in your config.

# Configuration

Full configuration:
```yaml
repository: <path to your repository>
username: user
password: pass
pull_before_push: true
check_for_secrets: true
check_for_ips: true
```

`repository`: Any https url to your git repository. (For now _no_ SSH)

`username`: Your username for https authentication.

`password`: Your password or __accesstoken__ for your repository.

`pull_before_push`: Should the repository be pulled first and commit the new state on top?

`check_for_secrets`: Check the configuration for missed secrets from your secret file.

`check_for_ips`: Check the configuration for ip values.


[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png)](https://www.buymeacoffee.com/Poeschl)
