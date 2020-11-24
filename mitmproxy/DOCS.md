# Web UI

To access the web ui of mitmproxy, visit `http://<host-ip>:8081` (or the port you configured).
Currently there is no other method. Will change when [#3234](https://github.com/mitmproxy/mitmproxy/issues/3234) is fixed completly.


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


## Certificates

To access also the certificates of Home Assistant the `/ssl` folder is mapped in read-only.
Notice that mitmproxy requests the certificates as pem files.


### Own ca certificate

If you want your own ca signing the traffic the `custom_ca` option can be used.
For more about the ca certificate requirements see [here](https://docs.mitmproxy.org/stable/concepts-certificates/#ca-and-cert-files)

Example:

```yaml
options:
  - name: "anticache"
    value: "true"
custom_ca: /ssl/ca-cert.pem
```


## Fixed Settings

There are also a few settings which are fixed to their values. Those are:

* `web_host`
* `web_port`
* `listen_port`
* `confdir`
* `onboarding_host`
* `onboarding_port`


# Onboarding

To install the mitmproxy ca as an trusted certificate authority the onboarding page can be accessed on `http://<host>:8082`.
Notice that your trafic must be routed over mitmproxy to access the page.
