# ICantBelieveItsNotValetudo (Home Assistant Supervisor Addon)
![armhf image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-icantbelieveitsnotvaletudo-armhf?label=docker%20pulls%20%28armhf%29)
![armv7 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-icantbelieveitsnotvaletudo-armv7?label=docker%20pulls%20%28armv7%29)
![aarch64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-icantbelieveitsnotvaletudo-aarch64?label=docker%20pulls%20%28aarch64%29)
![amd64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-icantbelieveitsnotvaletudo-amd64?label=docker%20pulls%20%28amd64%29)
![i386 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-icantbelieveitsnotvaletudo-i386?label=docker%20pulls%20%28i386%29)

This is the adaption of [ICantBelieveItsNotValetudo](https://github.com/Hypfer/ICantBelieveItsNotValetudo) as a Supervisor addon.

## Config

The configuration keys are identical to the [configuration of ICantBelieveItsNotValetudo](https://github.com/Hypfer/ICantBelieveItsNotValetudo/blob/master/README.md).
Please get the meaning for them from there.
Its normal that the structure of the addon differs from the official config file, this is nessesary because of the Supervisor Addon config structure.
For my sanity the `webserver` section is fixed to `{ "enabled": true, "port": 3000 }`.

If you use the Mosquitto Addon in Home Assistant `core_mosquitto` can be used as broker address.
To use images as underlay or overlay, the `share` folder is mounted in the addon. Just start your path with `/share` to access it (example `/share/valetudo/underlay.png`)

## PNG image

The generated image will be served over the Supervisor Ingress feature. So the floor plan can be accessed via the build-in side panel or the auto-configured mqtt camera.
(Make sure Autodiscovery is enabled!)

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white)](https://www.buymeacoffee.com/Poeschl)
