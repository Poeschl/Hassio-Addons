# 🚨 Addons are moved 🚚

__I moved my addons to a own organisation for easier maintaining and maybe allowing contributers to maintain one addon as well. Please switch to the new repository to get future updates.__

This repository will be archived and won't get any updates after this.

To the new repository: https://github.com/Poeschl-HomeAssistant-Addons/repository

---

# Poeschl Home Assistant Supervisor Add-ons

[![Main build][build-badge]][build-url]
![Licence][licence-badge]

![GitHub commit activity][commit-badge]
[![Installation Statistics][installations-badge]][installations-url]

[![Donate][donation-badge]][donation-url]

My repository with Add-ons for the [Home Assistant (former Hass.io) system](https://www.home-assistant.io/hassio/).

## Addons

* ICantBelieveItsNotValetudo - Valetudo Companion for map generation.
* MaryTTS - A local Text-To-Speech system.
* PicoTTS - Text to speech voice sinthesizer from SVox, included in Android AOSP.
* pigpio - The pigpio led control for the Raspberry as addon.
* MPD - A small media player with minimalistic web ui.
* valetudo-mapper - Valetudo RE Companion for map generation
* ympd - A very lightweight Web interface for controlling MPD music servers.
* Git Exporter - Exports your Home Assistant config to any git repository (secrets check included)
* Syncthing - A de-centralized file synchronisation program. Focused on privacy.
* rsync - Synces folders from Home Assistant to a other machine via rsync and ssh.
* rsync-local - Synces folders to local devices like usb-sticks.
* VNC Viewer - A VNC viewer addon, to integrate VNC displays into HA.
* Mopidy - A media player with web interface.
* Asterisk - An open source framework for building communications applications.
* OWASP Juice Shop - The most trustworthy online shop out there. A totally unsecure plattform.

Further informatione about the add-ons can be found in their folders.


### 🧪 Experimental

Those addons might not be stable at all. Use at your own risk!

🏜️

### 🕸️ Deprecated

These addons will not be updated anymore. Feel free to fork them.

* Docker Container Stats - Lightwight monitoring of all the running docker containers.
* OWASP ZAP - A security testing tool with MITM funtionality.
* mitmproxy - A simple MITM proxy to trace network requests.

## Installation

To install any of the add-ons offered in this repository, you must first add its repository URL to your Home Assistant instance. To do so, click the following button

[![Add repository to your Home Assistant instance.][repository-badge]][repository-url]

or manually add the the following repository URL in the Home Assistant add-on store:

`https://github.com/Poeschl/Hassio-Addons`

Then search for any of the add-ons in our addon store (button below) to install them.

[![Open your Home Assistant instance and show the Supervisor add-on store.][addon-store-badge]][addon-store-url]

You can also install them over the buttons in the Readmes of the addon folders.

### Licence

The licence of the repository is inherited by the plugins, if not stated differently.

[addon-store-url]: https://my.home-assistant.io/redirect/supervisor_store/
[addon-store-badge]: https://img.shields.io/badge/Open_Addon_store_on_my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[build-badge]: https://img.shields.io/github/actions/workflow/status/Poeschl/Hassio-Addons/main-addon-deploy.yaml?branch=main&style=for-the-badge
[build-url]: https://github.com/Poeschl/Hassio-Addons/actions?query=workflow%3A%22Deploy+addons%22
[commit-badge]: https://img.shields.io/github/commit-activity/m/Poeschl/Hassio-Addons?style=for-the-badge
[licence-badge]: https://img.shields.io/github/license/Poeschl/Hassio-Addons?style=for-the-badge
[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white
[donation-url]: https://www.buymeacoffee.com/Poeschl
[repository-badge]: https://img.shields.io/badge/Add_addon_repository_to_my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPoeschl%2FHassio-Addons
[installations-badge]: https://img.shields.io/badge/statisitics-addon_installations-41BDF5.svg?style=for-the-badge
[installations-url]: https://addonstats.poeschl.xyz?filter=243ffc37
