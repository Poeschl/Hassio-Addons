# Configuration

The configuration for the mitmproxy can be done via the key-value pairs in the addon configuration.
Just add an new pair to the `options` array. _Please add all settings as strings!_

Example:

```yaml
options:
	- name: "anticache"
	  value: "true"
	- name: "certs"
      value: "/ssl/mycert.pem"
```

The list with all possible settings can be found [here](https://docs.mitmproxy.org/stable/concepts-options/#available-options).
If you need to write into a file, the `/share` folder is mapped into the addon.


### Certificates

To access also the certificates of Home Assistant the `/ssl` folder is mapped in read-only.
Notice that mitmproxy requests the certificates as pem files.


### Fixed Settings

There are also a few settings which are fixed to their values. Those are:

* `web_host`
* `web_port`
* `listen_port`
* `confdir`
