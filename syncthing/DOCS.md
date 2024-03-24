## Configuration

Configuration is done via [Syncthing's web UI](/hassio/ingress/243ffc37_syncthing) (embedded into Home Assistant). First start the add-on from the [*Info* tab](/hassio/addon/243ffc37_syncthing/info) and then click `OPEN WEB UI`.

After starting up, Syncthing displays a notice (in a yellow box at the top) saying

> Insecure admin access is enabled.

This can safely be ignored since it [does not apply to this add-on](https://github.com/Poeschl/Hassio-Addons/issues/340).

## Syncthing Home Assistant integration

If you want to monitor the Syncthing add-on via Home Assistant's [**Syncthing** integration](https://www.home-assistant.io/integrations/syncthing/), you need to expose Syncthing's web UI to the (local) network rather than only to the [Home Assistant Supervisor](https://developers.home-assistant.io/docs/supervisor).

To do so, go to the add-on's [*Configuration* tab](/hassio/addon/243ffc37_syncthing/config), toggle `Show disabled ports` and enter a port number in the field labelled *Web frontend (not needed with Ingress)* (`8384`, as per the default, is fine). Click `SAVE`, switch to the [*Info* tab](/hassio/addon/243ffc37_syncthing/info) and click `RESTART`.

To finish the setup, follow the sections [*Prerequisites*](https://www.home-assistant.io/integrations/syncthing/#prerequisites) and [*Configuration*](https://www.home-assistant.io/integrations/syncthing/#configuration) from the integration's documentation.

Note that if your Home Assistant installation is reachable from the internet (e.g. because you enabled [remote access](https://www.home-assistant.io/docs/configuration/remote/)), setting the above port has security implications. It's strongly advised to set a `GUI Authentication User` and a strong `GUI Authentication Password` via Syncthing's settings in that case. See [*Security Principles*](https://docs.syncthing.net/users/security) for further information.

## Available directories

To permanently hold your data, synced folders must be put under one of the following paths:

| Path             | Description                                                                                                                                                |
| ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `/addon_configs` | Configuration of all Home Assistant add-ons.                                                                                                               |
| `/addons`        | Local Home Assistant add-ons.                                                                                                                              |
| `/backups`       | Home Assistant backups.                                                                                                                                    |
| `/config`        | Syncthing's own configuration.                                                                                                                             |
| `/data`          | Syncthing's own internal data (state). Not recommended to store synced folders.                                                                            |
| `/homeassistant` | Home Assistant's own configuration.                                                                                                                        |
| **`/media`**     | Media files to be shared between add-ons and Home Assistant. See below for a possible way to automatically mount external storage devices under this path. |
| ***`/share`***   | Data to be shared between add-ons and Home Assistant. This is the default path for synced folders.                                                         |
| `/ssl`           | TLS/SSL certificates.                                                                                                                                      |

Only the above directories are mapped into the add-on container. If you put synced folders under any other directory (like `/root` or `/mnt`), the synced data is deleted on add-on restart. We recommend to put synced folders under either **`/share`** or **`/media`**. Both of these directories are intended to be shared between add-ons, so you can access synced folders via the [Terminal & SSH](/hassio/addon/core_ssh/info) add-on, for example.

Furthermore, note that

- a backup of the Syncthing add-on will include its `/data` directory where its internal state is stored. This folder can take up several GiB of data.
- a [*full* Home Assistant backup](https://www.home-assistant.io/common-tasks/os/#backups) will include the `/addons`, `/config`, `/media`, `/share` and`/ssl` directories and their contents. Create a *partial* backup to specifically exclude any of them.
- syncing the `/backup` directory (preferably in [send only mode](https://docs.syncthing.net/users/foldertypes.html#send-only-folder)) is a simple way to automatically backup the Home Assistant backups to any of your other Syncthing devices. 😉
- syncing data to memory cards (eMMC, SD, etc.) might be a bad idea due to rapid wearout, or even impossible to begin with if the synced data is too large. This problem can be remedied either
  - by [configuring Home Assistant to use an external data disk](https://www.home-assistant.io/common-tasks/os/#using-external-data-disk), or
  - by mounting a suitable storage device under one of the directories listed above (e.g. `/media/ext`) and then putting synced folders underneath that path.

    To automatically let Home Assistant OS mount USB storage devices under `/media` by their filesystem partition names, use the following udev rule:
    <!-- markdownlint-disable MD033 -->
    <details>
    <summary><code>80-mount-usb-to-media-by-label.rules</code></summary>
  
    ```sh
    #
    # udev rule
    #   Mount USB drive to the media directory using the partition name as mount point
    #
    # Description:
    #   Created for Home Assistant OS, this rule mounts any USB drives
    #   into the Hassio media directory (/mnt/data/supervisor/media).
    #   When a USB drive is connected to the board, the rule creates one directory
    #   per partition under the media directory. The newly created partition is named
    #   as the partition name. If the partition does not have a name, then the following
    #   name format is used: "usb-{block-name}" where the block name is sd[a-z][0-9].
    #
    # Note 1:
    #   The rule name is always prefixed with a number. In this case, the rule uses 80.
    #   This represents the order of the rule when multiple rules exists in udev.
    #   Low numbers run first, high numbers run last. However, low numbers do not have all
    #   the facilities than high numbers may have.
    #   For this rule to run properly, use numbers equal or greater than 80.
    #
    # Note 2:
    #   This rule will skip mounting the 'CONFIG' USB key.
    #   https://github.com/home-assistant/operating-system/blob/dev/Documentation/configuration.md
    #
    # Note 3:
    #   This rule will mount the OS partitions if the OS is sorted on a USB drive (i.e. USB booting).
    #   To prevent this issue from happening, update the rule to skip the booting USB drive.
    #   See the CAUTION message below.
    #
    # Source of inspiration:
    #   https://www.axllent.org/docs/auto-mounting-usb-storage/
    #
    # Useful links:
    #   https://wiki.archlinux.org/index.php/Udev
    #
    # udev commands:
    #   - Restart udev to reload new rules:
    #       udevadm control --reload-rules
    #   - List device attributes of sdb1:
    #       udevadm info --attribute-walk --name=/dev/sdb1
    #   - List environment variables of sdb1:
    #       udevadm info /dev/sdb1
    #   - Trigger add/remove event for sdb1:
    #       udevadm trigger --verbose --action=add --sysname-match=sdb1
    #       udevadm trigger --verbose --action=remove --sysname-match=sdb1
    #


    # Filter on block devices, exit otherwise
    # CAUTION: Change to 'sd[b-z][0-9]' if booting from a USB drive (e.g.: sda)
    KERNEL!="sd[a-z][0-9]", GOTO="abort_rule"

    # Skip none USB devices (e.g.: internal SATA drive)
    ENV{ID_PATH}!="*-usb-*", GOTO="abort_rule"

    # Import the partition info into the environment variables
    IMPORT{program}="/usr/sbin/blkid -o udev -p %N"

    # Exit if partition is not a filesystem
    ENV{ID_FS_USAGE}!="filesystem", GOTO="abort_rule"

    # Exit if this is the 'CONFIG' USB key
    ENV{ID_FS_LABEL}=="CONFIG", GOTO="abort_rule"

    # Get the partition name if present, otherwise create one
    ENV{ID_FS_LABEL}!="", ENV{dir_name}="%E{ID_FS_LABEL}"
    ENV{ID_FS_LABEL}=="", ENV{dir_name}="usb-%k"

    # Determine the mount point
    ENV{mount_point}="/mnt/data/supervisor/media/%E{dir_name}"

    # Mount the device on 'add' action (a.k.a. plug the USB drive)
    ACTION=="add", RUN{program}+="/usr/bin/mkdir -p %E{mount_point}", RUN{program}+="/usr/bin/systemd-mount --no-block --automount=no --collect $devnode %E{mount_point}"

    # Umount the device on 'remove' action (a.k.a unplug or eject the USB drive)
    ACTION=="remove", ENV{dir_name}!="", RUN{program}+="/usr/bin/systemd-umount %E{mount_point}", RUN{program}+="/usr/bin/rmdir %E{mount_point}"

    # Exit
    LABEL="abort_rule"
    ```

    [Source](https://gist.github.com/eklex/c5fac345de5be9d9bc420510617c86b5)

    </details>

    The above udev rule has to be placed under `/etc/udev/rules.d/` in the Home Assistant OS *host*. This requires either [SSH access to the host](https://developers.home-assistant.io/docs/operating-system/debugging/#ssh-access-to-the-host) or a [`CONFIG` USB drive](https://github.com/home-assistant/operating-system/blob/dev/Documentation/configuration.md#configuration) where you create the file `udev/80-mount-usb-to-media-by-label.rules` with the above content. Further information and discussion can be found [on the Home Assistant community forum](https://community.home-assistant.io/t/solved-mount-usb-drive-in-hassio-to-be-used-on-the-media-folder-with-udev-customization/258406).
