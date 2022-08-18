## Configuration

The configuration is done via the web UI. Start the add-on and configure it there.

## Available directories

When using this add-on to permanently hold your data, put the synced folders inside one of the following directories:

- `/data`
- `/media`
- `/share`
- `/config`
- `/ssl`
- `/addons`

Only the above directories are mapped into the add-on container. If you put synced folders in any other directory (like `/root` or `/mnt`), the synced data will be deleted on container restart.

Furthermore, note that

- a backup of the syncthing add-on will include the `/data` directory and its contents.
- a [*full* Home Assistant backup](https://www.home-assistant.io/common-tasks/os/#backups) will include the `/media`, `/share`, `/config`, `/ssl` and `/addons` directories and their contents. Create a *partial* backup to specifically exclude any of them.
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
