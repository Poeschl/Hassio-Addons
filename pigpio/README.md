# 🚨 Addons are moved 🚚

__I moved my addons to a own organisation for easier maintaining and maybe allowing contributers to maintain one addon as well. Please switch to the new repository to get future updates.__

The new home of my addons is: https://github.com/Poeschl-HomeAssistant-Addons/repository

A migration guide is available here: [migrate_from_Poeschl_repository.md](https://github.com/Poeschl-HomeAssistant-Addons/repository/docs/migrate_from_Poeschl_repository.md)

---

# pigpio

Wraps the C control lib [pigpio](https://github.com/joan2937/pigpio) in a Home Assistant addon to allow an easy installation.

![Addon Stage][stage-badge]
![Supports aarch64 Architecture][aarch64-badge]
![Supports amd64 Architecture][amd64-badge]
![Supports armhf Architecture][armhf-badge]
![Supports armv7 Architecture][armv7-badge]
![Supports i386 Architecture][i386-badge]

[![Add repository on my Home Assistant][repository-badge]][repository-url]
[![Install on my Home Assistant][install-badge]][install-url]
[![Donate][donation-badge]][donation-url]

## Usage

This addon runs the pigpio deamon which listens on http commands and control the GPIO on a Raspberry Pi accordingly.
Running this and using the [remote_rpi_pgio integration](https://www.home-assistant.io/integrations/remote_rpi_gpio/) in your Home Assistant configuration pointing to `localhost` will connect both worlds.

For additional options for the deamon use the optional addon setting `additional_options`.
The options`-g -f` will be always set!

## Security

It accesses `/dev/mem` on the host and also has full access to the raw io data.


[aarch64-badge]: https://img.shields.io/badge/aarch64-yes-green.svg?style=for-the-badge
[amd64-badge]: https://img.shields.io/badge/amd64-no-red.svg?style=for-the-badge
[armhf-badge]: https://img.shields.io/badge/armhf-yes-green.svg?style=for-the-badge
[armv7-badge]: https://img.shields.io/badge/armv7-yes-green.svg?style=for-the-badge
[i386-badge]: https://img.shields.io/badge/i386-no-red.svg?style=for-the-badge
[stage-badge]: https://img.shields.io/badge/Addon%20stage-stable-green.svg?style=for-the-badge
[install-badge]: https://img.shields.io/badge/Install%20on%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge
[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee-%23d32f2f?logo=buy-me-a-coffee&style=for-the-badge&logoColor=white
[donation-url]: https://www.buymeacoffee.com/Poeschl
[repository-badge]: https://img.shields.io/badge/Add%20repository%20to%20my-Home%20Assistant-41BDF5?logo=home-assistant&style=for-the-badge

[install-url]: https://my.home-assistant.io/redirect/supervisor_addon?addon=243ffc37_pigpio
[repository-url]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FPoeschl%2FHassio-Addons
