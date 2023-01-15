## Homeassistant Integration

For easy integration I also published a [custom component](https://github.com/Poeschl/Remote-PicoTTS).
Its available on the HACS for easy integration.

## Requests

### Ping

`http://ip:59126/ping`

### TTS

`http://ip:59126/speak?lang=<language>&text=<text>`

For supported `language` look [here](https://espeak.sourceforge.net/languages.html).
`text` is the text you want to have sinthesized (url-encoded).
