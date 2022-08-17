# Configuration

```yaml
media_folder: /media/mopidy/media
playlist_folder: /media/mopidy/playlists
locale: en_US
country: en
radio_net:
  language: net
  favorite_radiostations: []
```

### `media_folder`

This option let you specify an custom media folder.

### `playlist_folder`

This option let you specify an custom playlist folder.

### `locale`

Your locale as 2x2 format. This used for the ui and also some extensions.
Default is `en_US` A list of locale's is [here](https://github.com/umpirsky/locale-list/blob/main/data/en_US/locales.yaml).

### `country`

Your country as two letter country code. This used for the ui and also some extensions.
Default here is is the code `en`.

### `radio_net/language`

The language text information is shown for radio stations. Possible options are: `net`, `at`, `de` , `dk`, `es`, `fr`, `it`, `pl`, `pt`, `se`.

### `radio_net/favorite_radiostations`

Your favorite radio station slugs for the radio.net Extension. [More about that setting](https://github.com/plintx/mopidy-radionet#configuration).

### `custom_config` (optional)

**If this is specified, all other options are ignored.**

This option let you specify an custom configuration file for mopidy.
To keep all MPD files in one place I restricted the path prefix to `/share/mopidy`
Please use the default [mopidy.conf of the addon](https://github.com/Poeschl/Hassio-Addons/blob/main/mopidy/root/etc/mopidy-template.conf) as starting point.

Working example:

```yaml
...
custom_config: /share/mopidy/mopidy.conf
```


# Local Media

Local media can be stored on any folder on `/media` or `/share` (which can be accessed through the samba addon).
By default the directory for media is `/media/mopidy/media` and the default for playlists `/media/mopidy/playlists`.

# Panel integration

Since Mopidy-Iris don't play well (at least out-of-the-box) with the ingress feature Mopidy can be added to the side-panel in the configuration with those lines:

```yaml
panel_iframe:
  morpidy:
    title: 'Morpidy'
    icon: 'mdi:music-circle'
    url: 'http://<homeassistant-address>:6680/iris'
```


# MPD

To connect from Home Assistant use the following configuration:

```yaml
media_player:
  - platform: mpd
    host: 243ffc37-mopidy
    port: 6600
```
