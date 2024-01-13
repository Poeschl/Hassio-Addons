# Configuration

```yaml
repository:
  url: <path to your repository>
  username: user
  password: pass
  pull_before_push: true
  commit_message: 'Home Assistant Git Exporter'
  branch_name: 'main'
export:
  lovelace: true
  addons: true
  esphome: true
  node_red: true
checks:
  enabled: true
  check_for_secrets: true
  check_for_ips: true
exclude:
  - '*.db'
  - '*.log'
  - __pycache__
  - deps/
  - known_devices.yaml
  - tts/
  - '*.db-shm'
  - '*.db-wal'
  - '*.gz'
secrets: []
allowed_secrets: []
dry_run: false
```

### `repository.url`

Any https url to your git repository. (For now _no_ SSH)

### `repository.email` (Optional)

The email address the commits author is using.

### `repository.username`

Your username for https authentication.

### `repository.password`

Your password or [__access token__](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) for your repository.

### `repository.pull_before_push`

Should the repository be pulled first and commit the new state on top?

### `repository.commit_message`

The commit message for the next commit.

### `repository.branch_name`

The working branch for the repository.

### `repository.ssl_verification` (Optional, default: true)

Use this to disable the ssl verification. Can be used for self-signed certificates. __Use this only when you know what you are doing__


### `export.lovelace`

Enable / Disable the export for the lovelace config.

### `export.addons`

Enable / Disable the export for the supervisor addons config.

### `export.esphome`

Enable / Disable the export for the esphome config.

### `export.node_red`

Enable / Disable the export for the Node-RED flows.
Secure your credentials with [node-red-contrib-credentials](https://flows.nodered.org/node/node-red-contrib-credentials).


### `checks.enabled`

Enable / Disable the checks in the exported files.

### `checks.check_for_secrets`

Add your secret values to the check.

### `checks.check_for_ips`

Add pattern for ip and mac addresses to the search.


### `exclude`

The files / folders which should be excluded from the config export.

Following folders and files are excluded from the sync per default:

* `secrets.yaml` (secrets are cleared)
* `.cloud`
* `.storage`

### `secrets`

Additional secrets which will be checked for.


### `allowed_secrets`

Additional allowed secrets which will not make the secret check fail.


### `dry_run`

Only show the changes and don't commit or push.


## Known limitations

`check_for_secrets` Uses a git plugin that does pattern matching using regexes.
A limitation of this plugin is that using brackets (like `[`, `]`, `{`, `}` `(` and `)`) in secrets can result in unexpected behaviour and crashes.

If the addon fails during secrets checking with errors originating from grep (I.E. `grep: Unmatched [, [^, [:, [., or [=`),
change the passwords that contain brackets or set `check_for_secrets` to `false`.
