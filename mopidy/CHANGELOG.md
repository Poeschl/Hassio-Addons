# Changelog

## [Unreleased]


## [1.2.1] - 2020.02.07

### Changed
* Dependency updates:
  * youtube-dl `2020.1.24`


## [1.2.0] - 2019-12-06

### Added
* Use Youtube-Mopidy integration from [@natumbri](https://github.com/natumbri/mopidy-youtube)

### Changed
* Updated Mopidy to `2.3.1-1`
* Updated youtube-dl to `2019.11.28`
* Update certifi to same version as youtube-dl
* More startup logging


## [1.1.0] - 2019-10-19

### Changed
* Updated OS to debian buster (thanks @Nickerchen)

### Removed
* Removed aarch64 support


## [1.0.0] - 2019-10-16

### Changed
* Set mopidy version to `2.1.0-1`
* Own versioning starting with 1.0.0
* Added example config setting for media dir

### Fixed
* ALSA not forwarding sound correctly


## [2.2.3] - 2019-10-06 (Old versioning)

### Changed
* Added device mapping for `/dev/snd`

### Fixed
* Adjust mopidy version for aarch64 systems. It will be the version `2.1.0-1` on those systems. 


### Added
* Put mopidy 2.2.3-1 inside the addon.
