## Precondition

Make sure to have `rsync` installed on the remote machine. In case the addon gives you an `bash: rsync: command not found` in the logs `rsync` is missing there.

## Key files

The addon generates its own key files when no file is found at the specified location. If you use your own key make sure it is passwordless.

## Config

Example config:

```yaml
private_key_file: /ssl/rsync/id_rsa
username: user
folders:
  - /config
remote_host: ''
remote_folder: /home/user

```

### `private_key_file`

The private key for the authentification on the remote machine. It specifies also the location of the generated key-pair if no key file is found.
The location of the file is fixed to the `/ssl` volume.

### `username`

The username for the user on the remote machine the key is accepted.

### `folders`

The list of folders you want to sync with the remote machine. Those locations are getting synced recursively.

When a folder is specified with a slash at the end the content are directly copied inside the remote_folder.
Without it a folder with the content is created.

For example:

* `- /config` would result into `/home/user/config`
* `- /config/` would put the content of config into `/home/user`

### `remote_host`

The ip or host of the remote machine you want to connect to.

### `remote_port` (optional)

The ssh port on the remote machine. If not set the default `22` is assumed.

### `remote_folder`

The base folder on the remote machine for syncing the folders. Sub-folders with the folders from above will be created there

### `options` (optional)

Use your own options for rsync. This string is replacing the default one and get directly to rsync. The default is `-archive --recursive --compress --delete --prune-empty-dirs`.
