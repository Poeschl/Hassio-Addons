# Changelog

## 1.0.4 - 2019-10-15

### Changed
* Update g++ to `9.2.0-r4`


## 1.0.4 - 2019-10-15

### Changed
* Use alpine `3.11`
* Update dependencies
  * git `2.24.1-r0`
  * g++ `9.2.0-r3`
  * libtool `2.4.6-r7`
  * python3 `1.16-r7`


## 1.0-3 - 2019-10-15

### Changed
* Use alpine 3.9 as base image

### Fixed
* Fixed wrong log command in startup script, which was confusing HASS.io [#20](https://github.com/Poeschl/Hassio-Addons/issues/20).


## 1.0-2 - 2019-10-06

### Changed
* Integration into new build setup


## 1.0-1 - 2019-09-11

### Fixed
* Fixed wrong voice name decoding


## 1.0 - 2019-08-07

### Added
* Put latest picoTTS inside HASS.io addon
* Added python wrapper around local picoTTS to use it from outside.
