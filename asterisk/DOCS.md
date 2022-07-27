# Configuration

```yaml
config_files:
  - /config/asterisk/sip.conf
```

### `config_files`

A list of paths to your configuration files of asterisk.
Every listed file will overwrite the template config file at `/etc/asterisk` on each addon start.
The config files can be located on `/config` or`/share`.

For the sample files take a look at the [official asterisk repository](https://github.com/asterisk/asterisk/blob/main/configs/samples).

## Testing

As default there is a test sip phone setup. With user `1001` and password `1234` the number `100` can be called.
A sound should confirm the working state.
