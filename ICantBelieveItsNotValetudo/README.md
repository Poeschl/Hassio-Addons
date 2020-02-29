# ICantBelieveItsNotValetudo (Home Assistant Supervisor Addon)
![armhf image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-icantbelieveitsnotvaletudo-armhf?label=docker%20pulls%20%28armhf%29)
![armv7 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-icantbelieveitsnotvaletudo-armv7?label=docker%20pulls%20%28armv7%29)
![aarch64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-icantbelieveitsnotvaletudo-aarch64?label=docker%20pulls%20%28aarch64%29)
![amd64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-icantbelieveitsnotvaletudo-amd64?label=docker%20pulls%20%28amd64%29)
![i386 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-icantbelieveitsnotvaletudo-i386?label=docker%20pulls%20%28i386%29)

This is the adaption of [ICantBelieveItsNotValetudo](https://github.com/Hypfer/ICantBelieveItsNotValetudo) as a Supervisor addon.

## Config

The config of the addon is identical to the `mqtt` section described in the [README of ICantBelieveItsNotValetudo](https://github.com/Hypfer/ICantBelieveItsNotValetudo/blob/master/README.md).
The `webserver` section is fixed to `{ "enabled": true, "port": 3000 }`.

Is the mqtt broker also on your Home Assistant instance (like the Mosquitto Addon), you might enter the ip or hostname of the Homeassistant machine as broker address.
To use images as underlay, the `share` folder is mounted in the addon. Just start your path with `/stare` to access it (example `/share/valetudo/underlay.png`)

## PNG image

The generated image will be served over the Supervisor Ingress feature. So the floor plan can be accessed via the build-in side panel or the auto-configured mqtt camera.

[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png)](https://www.buymeacoffee.com/Poeschl)
