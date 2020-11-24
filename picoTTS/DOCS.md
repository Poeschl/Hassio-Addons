## Homeassistant Integration

For easy integration I also published a [custom component](https://github.com/Poeschl/Remote-PicoTTS).
Its available on the HACS for easy integration.

## Requests

### Ping

`http://ip:59126/ping`

### TTS

`http://ip:59126/speak?lang=<language>&text=<text>`

`language` can be one of those `de-DE, en-GB, en-US, es-ES, fr-FR, it-IT`. If not set it defaults to `en-US`.
`text` is the text you want to have sinthesized (url-encoded).
