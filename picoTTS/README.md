# PicoTTS (Hass.io Addon)
![armhf image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-picotts-armhf?label=docker%20pulls%20%28armhf%29)
![armv7 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-picotts-armv7?label=docker%20pulls%20%28armv7%29)
![aarch64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-picotts-aarch64?label=docker%20pulls%20%28aarch64%29)
![amd64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-picotts-amd64?label=docker%20pulls%20%28amd64%29)
![i386 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-picotts-i386?label=docker%20pulls%20%28i386%29)

The [naggety/picotts](https://github.com/naggety/picotts) as Home Assistant Supervisor addon. (Useable on Raspberry Pi 3-)

This addon executes the tts engine behind a webservice. It provides support for all default languages.

## Homeassistant Integration

For easy integration I also published a [custom component](https://github.com/Poeschl/Remote-PicoTTS).
Its available on the HACS for easy integration.

## Requests

### Ping

```
http://ip:59126/ping
```

### TTS

```
http://ip:59126/speak?lang=<language>&text=<text>
```

`language` can be one of those `de-DE, en-GB, en-US, es-ES, fr-FR, it-IT`. If not set it defaults to `en-US`.
`text` is the text you want to have sinthesized (url-encoded).

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white)](https://www.buymeacoffee.com/Poeschl)
