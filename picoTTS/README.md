# PicoTTS (Hass.io Addon)

The [naggety/picotts](https://github.com/naggety/picotts) as Hass.io addon. (Useable on Raspberry Pi 3-)

This addon executes the seach engine behind a webservice. It provides support for all default languages.

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
