# ICantBelieveItsNotValetudo (Hass.io Addon)

This is the adaption of [ICantBelieveItsNotValetudo](https://github.com/Hypfer/ICantBelieveItsNotValetudo) as a Hass.io addon.

## Config

The config of the addon is identical to the `mqtt` section described in the README of ICantBelieveItsNotValetudo.
The `webserver` section is fixed to `{ "enabled": true, "port": 3000 }`

Is the mqtt broker also on your hass.io instance (like the Mosquitto Addon), you might enter the ip or hostname of the hass.io machine as broker address.

## PNG image

The generated image will be served over the Hass.io Ingress feature. So the floor plan can be accessed via the build-in side panel or the auto-configured mqtt camera.

[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png)](https://www.buymeacoffee.com/Poeschl)
