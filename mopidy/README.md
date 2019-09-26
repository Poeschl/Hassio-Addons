# Mopidy (Hass.io Addon)

Mopidy with plugins for Hass.io. It enabled the host to play audio.
This plugin is based on the [addon from _bestlibre_](https://github.com/bestlibre/hassio-addons/tree/master/mopidy).

It is build with following extensions:

* [Mopidy-Local](https://docs.mopidy.com/en/latest/ext/local/)
* [Mopidy-Stream](https://docs.mopidy.com/en/latest/ext/stream/)
* [Mopidy-YouTube](https://github.com/mopidy/mopidy-youtube)
* [Mopidy-Iris](https://github.com/jaedb/iris)

Mopidy listen on `6680` for http connection, and `6600` for mpd ones.

## Local Media
The local media can be stored on `/share` (which allow an access through the samba addon).
By default the directory for media is `/share/mopidy/media`. 

## Configuration

### local_scan (bool)
If it is set to true, a local scan is performed on startup. A local scan can also be triggered via the web ui.

### options (list of dict)

This object accepts any configuration of the listed extenstions. It can be also used to overwrite the default values.

For example: Overwrite the media dir

```
{"name": "local/media_dir", "value": "/share/media"}
```

## Default config

```
[core]
cache_dir = /data/mopidy/cache
data_dir = /data/mopidy/data_dir

[http]
hostname = 0.0.0.0

[mpd]
hostname = 0.0.0.0

[local]
media_dir = /share/mopidy/media
library = sqlite

[m3u]
playlists_dir = /share/mopidy/playlists

[stream]
enabled = true
protocols =
    http
    https

[iris]

```
