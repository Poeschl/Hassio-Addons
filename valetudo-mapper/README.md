# Valetudo RE Mapper (Hass.io Addon)

This is the adaption of [valetudo-mapper](https://github.com/rand256/valetudo-mapper) as a Hass.io addon.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

## Config

The config of the addon is identical to the `mqtt` section described in the README of Valetudo Mapper.
The `webserver` section is fixed to `{ "enabled": true, "port": 3000 }`

Is the mqtt broker also on your hass.io instance (like the Mosquitto Addon), you might enter the ip or hostname of the hass.io machine as broker address.

## PNG image

The generated image will be served over the Hass.io Ingress feature. So the floor plan can be accessed via the build-in side panel or the auto-configured mqtt camera.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
