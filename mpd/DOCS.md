# Configuration

```yaml
volume_normalization: false
```

### `volume_normalization`

Enabled the build-in volume normalization feature.

### `custom_config` (Optional)

This option let you specify an custom configuration file for MPD.
To keep all MPD files in one place I restricted the path prefix to `/share/mpd`.
In case you have issues with your configuration, the [MPD docs](https://www.musicpd.org/doc/html/user.html#configuration) might help you out.

Working example:
```yaml
...
custom_config: /share/mpd/mpd.conf
```