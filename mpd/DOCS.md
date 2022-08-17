# Configuration

```yaml
media_folder: /media/mpd/media
playlist_folder: /media/mpd/playlists
volume_normalization: false
httpd_output: false
```

### `volume_normalization`

Enables the built-in volume normalization feature.

### `httpd_output`

Enables the httpd audio output.

### `media_folder`

This option let you specify an custom media folder.

### `playlist_folder`

This option let you specify an custom playlist folder.

### `verbose` (optional)

Make `mpd` verbose.

```yaml
verbose: true
```

### `custom_config` (optional)

**If this is specified, all other options are ignored.**

This option let you specify an custom configuration file for MPD.
To keep all MPD files in one place I restricted the path prefix to `/share/mpd`
Please use the default [mpd.conf of the addon](https://github.com/Poeschl/Hassio-Addons/blob/main/mpd/root/etc/mpd.conf) as starting point.
In case you have issues with your configuration, the [MPD docs](https://www.musicpd.org/doc/html/user.html#configuration) might help you out.

Working example:

```yaml
...
custom_config: /share/mpd/mpd.conf
```

# Troubleshooting

### `RTIOThread could not get realtime scheduling, continuing anyway: sched_setscheduler`

This error is shown on any none-glibc system like alpine linux is. MPD should work without it.
More see here: [MPD Issue](https://github.com/MusicPlayerDaemon/MPD/issues/218)

### `Failed to open '/data/database/mpd.db': No such file or directory`

This error is shown on the first start, when no database exists. It will be there on the second run.

# MPD

To connect from Home Assistant use the following configuration:

```yaml
media_player:
  - platform: mpd
    host: 243ffc37-mpd
    port: 6600
```
