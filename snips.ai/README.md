# Snips.ai (Hass.io Addon)
![armhf image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-snipsai-armhf?label=docker%20pulls%20%28armhf%29)
![armv7 image pulls](https://img.shields.io/docker/pulls/poeschl/hassio-snipsai-armv7?label=docker%20pulls%20%28armv7%29)

A own version of the Snips.ai Voice Control platform addon. Its intended to act only as base station without a mic and gets the input via satelites.

## Requirements

To use this Addon a MQTT Broker is required. The easy solution for that is the [Mosquitto broker addon](https://www.home-assistant.io/addons/mosquitto/).

## Configuration

```
{
    "mqtt": {
        "host": "localhost",
        "port": 1883
        "user": "user",
        "pass": "password",
    },
    "assistant": "mySnipsAssistant.zip"
}
```

