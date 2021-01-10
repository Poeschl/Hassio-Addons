## Config

Example config:

```yaml
vnc_server_host: 192.168.0.23
```

### `vnc_server_host`

The hostname or ip address of the VNC server the addon should connect to.

### `vnc_server_port` (Optional)

The remote port of the VNC server. (Default: `5900`)

### `vnc_server_password` (Optional)

The password of the the VNC server. When not set and the connection requires a password, it is asked at connection time.
