## Security

In order to mount your external device the integrated AppArmor feature is disabled.
This addon has access to the devices with the path from the available `external_device` config option!

## Config

Example config:

```yaml
folders:
  - source: /config
  - source: /media/playlists
    options: '--archive --recursive --compress'
external_folder: backup
external_device: ''
```

### `folders`

The list of folders you want to sync with the remote machine.

### `folders` - `source`

The source folder for rsync.

### `folders` - `options` (optional)

Use your own options for rsync. This string is replacing the default one and get directly to rsync. The default is `--archive --recursive --compress --delete --prune-empty-dirs`.

### `external_folder`

The base folder on the external usb drive or usb stick for syncing the folders. Sub-folders with the folders from above will be created there.
This path should not start with `/`.

### `external_device`

If you need to pin down a specific device to make your backup too, here is the option. Per default the device is `/dev/sda1`.
Make sure to adjust it when for example running Home Assistant from a external drive. The `sda1` will be a partition of the Home Assistant drive.

If no device is specified all available devices will be displayed in the log. No sync takes place without device.

Available options: `/dev/sd[a-e][1-5]`
