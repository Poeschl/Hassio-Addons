# Valetudo RE Mapper (Hass.io Addon)
![armhf image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-valetudo-mapper-armhf?label=docker%20pulls%20%28armhf%29)
![armv7 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-valetudo-mapper-armv7?label=docker%20pulls%20%28armv7%29)
![aarch64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-valetudo-mapper-aarch64?label=docker%20pulls%20%28aarch64%29)
![amd64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-valetudo-mapper-amd64?label=docker%20pulls%20%28amd64%29)
![i386 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-valetudo-mapper-i386?label=docker%20pulls%20%28i386%29)

This is the adaption of [valetudo-mapper](https://github.com/rand256/valetudo-mapper) as a Hass.io addon.

## Config

The config of the addon is identical to the `mqtt` section described in the README of Valetudo Mapper.
The `webserver` section is fixed to `{ "enabled": true, "port": 3000 }`

Is the mqtt broker also on your hass.io instance (like the Mosquitto Addon), you might enter the ip or hostname of the hass.io machine as broker address.

## PNG image

The generated image will be served over the Hass.io Ingress feature. So the floor plan can be accessed via the build-in side panel or the auto-configured mqtt camera.
