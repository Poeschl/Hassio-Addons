# Configuration

```yaml
media_folder: /media/mopidy/media
playlist_folder: /media/mopidy/playlists
locale: en_US
country: en
radio_net:
  language: net
  favorite_radiostations: []
spotify:
  enabled: false
  username: ''
  password: ''
  client_id: ''
  client_secret: ''
```

### `media_folder`

This option let you specify an custom media folder.

### `playlist_folder`

This option let you specify an custom playlist folder.

### `locale`

Your locale as 2x2 format. This used for the ui and also some extensions.
Default is `en_US` A list of locale's is [here](https://github.com/umpirsky/locale-list/blob/master/data/en_US/locales.yaml).

### `country`

Your country as two letter country code. This used for the ui and also some extensions.
Default here is is the code `en`.

### `custom_config` (optional)

**If this is specified, all other options are ignored.**

This option let you specify an custom configuration file for mopidy.
To keep all MPD files in one place I restricted the path prefix to `/share/mopidy`
Please use the default [mopidy.conf of the addon](https://github.com/Poeschl/Hassio-Addons/blob/master/mopidy/root/etc/mopidy-template.conf) as starting point.

Working example:

```yaml
...
custom_config: /share/mopidy/mopidy.conf
```

### `radio_net/language`

The language text information is shown for radio stations. Possible options are: `net`, `at`, `de` , `dk`, `es`, `fr`, `it`, `pl`, `pt`, `se`.

### `radio_net/favorite_radiostations`

Your favorite radio station slugs for the radio.net Extension. [More about that setting](https://github.com/plintx/mopidy-radionet#configuration).


### `spotify/enabled`

Enable the spotify extension for Mopidy. Default is `false`.

### `spotify/username`

Your Spotify Premium username. _Free accounts are not supported._

### `spotify/password`

Your Spotify Premium password.

### `spotify/client_id`

Your Spotify application client id. For how to get it look at the next setting.

### `spotify/client_secret`

Your Spotify application secret key. To get it use the button below.
It will show you the login of spotify and shows your `client_id` and `client_secret` after login.
Your data is never shared with this site.

[![Authenticate Spotify][auth-badge]][auth-url]


# Local Media

Local media can be stored on any folder on `/media` or `/share` (which can be accessed through the samba addon).
By default the directory for media is `/media/mopidy/media` and the default for playlists `/media/mopidy/playlists`.

# Panel integration

Since Mopidy-Iris don't play well (at least out-of-the-box) with the ingress feature Mopidy can be added to the side-panel in the configuration with those lines:

```yaml
panel_iframe:
  mopidy:
    title: 'Mopidy'
    icon: 'mdi:music-circle'
    url: 'http://<homeassistant-address>:6680/iris'
```


# MPD

To connect from Home Assistant use the following configuration:

```yaml
media_player:
  - platform: mpd
    host: localhost
    port: 6600
```

[auth-badge]: https://img.shields.io/badge/Authenticate%20with-Spotify-%231ED760?logo=spotify
[auth-url]: https://auth.mopidy.com/spotify/