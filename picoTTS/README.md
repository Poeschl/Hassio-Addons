# PicoTTS (Hass.io Addon)

The [naggety/picotts](https://github.com/naggety/picotts) as Hass.io addon. (Useable on Raspberry Pi 3-)

This addon executes the seach engine behind a webservice. It provides support for all default languages.

## Homeassistant Integration

For easy integration I also published a [custom component for Home Assistant](https://github.com/Poeschl/ha-picoTTS_remote). This allow a easy integration on Hassio-based installations.

## Requests

### Ping

```
http://ip:59126/ping
```

### TTS

```
http://ip:59126/speak?voice=<language>&text=<text>
```

`language` can be one of those `de-DE, en-GB, en-US, es-ES, fr-FR, it-IT`. If not set it defaults to `en-US`.
`text` is the text you want to have sinthesized (url-encoded).

[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png)](https://www.buymeacoffee.com/Poeschl)
