## Config

Example config:

```yaml
folders:
  - /config
external_folder: backup

```

### `folders`

The list of folders you want to sync with the remote machine. Those locations are getting synced recursively.

When a folder is specified with a slash at the end the content are directly copied inside the remote_folder.
Without it a folder with the content is created.

For example:

* `- /config` would result into `/home/user/config`
* `- /config/` would put the content of config into `/home/user`

### `external_folder`

The base folder on the external usb drive or usb stick for syncing the folders. Sub-folders with the folders from above will be created there

### `options` (optional)

Use your own options for rsync. This string is replacing the default one and get directly to rsync. The default is `-archive --recursive --compress --delete --prune-empty-dirs`.