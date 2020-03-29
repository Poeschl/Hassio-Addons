# MaryTTS Addon
![armhf image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-marytts-armhf?label=docker%20pulls%20%28armhf%29)
![armv7 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-marytts-armv7?label=docker%20pulls%20%28armv7%29)
![aarch64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-marytts-aarch64?label=docker%20pulls%20%28aarch64%29)
![amd64 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-marytts-amd64?label=docker%20pulls%20%28amd64%29)
![i386 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-marytts-i386?label=docker%20pulls%20%28i386%29)

The MaryTTS system as Home Assistant Supervisor Addon, to integrate a local TTS nicely. 

## Configuration

Full configuration:

```yaml
language: de
```

`language`: One of the languages `de`, `en`, `fr`, `it`, `in`, `tu` and `lu` above. This should be the same as you configured in Home Assistant.
The voices are downloaded on demand.

`voice` (optional): This specifies an url for a custom voice pack. Make sure it is a zip and it contains the voice.jar inside a lib folder.


## UI

The Demo-UI of MaryTTS can be accessed via `http://<hassio-address>:59125`.

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white)](https://www.buymeacoffee.com/Poeschl)
