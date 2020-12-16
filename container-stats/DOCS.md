## Precondition

Unfortunately there is now way to access the docker api without disabling the *Protection Mode* of the addon.
Technically with disabling it, the addon can access and control other addons and the core on a HA supervised system.
But without it we can not retrieve the statistics of the running container and this addon don't work at all.

To make the addon work you have to disable the *Protection Mode* on the addon details page.
**Only do this if you know what this means to your system**

If you want to review the source of the contained application [here is your link](https://github.com/virtualzone/docker-container-stats).
At the time of writing all docker related code is in `stats.js`.

## Config

### `persistent`

Enable persistence of the collected data. If disabled the data vanish on addon stop.

### `update_interval` (Optional)

Set a custom update interval for the data in seconds. Defaults to `60` seconds.
