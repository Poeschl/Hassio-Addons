# Changelog

## 1.2.1 - 2020-03-31

### Added
* Add findutils at version `4.7.0-r0`

### Changed
* Fixed lovelace export
* Get the addon information from bashio instead of self-requesting

### Removed
* Removed `curl`


## 1.2.0 - 2020-03-29

### Changed
* Changed json2yaml conversion to own little script
* Updated py3-yaml ot `5.3.1-r0`
* Fixed permanent dry_run bug


## 1.1.0 - 2020-03-18

### Added
* Dry run toogle to just display the changes.

### Changed
* Adjusted to the multiple lovelace interfaces
* Updated to python `3.8.2-r0`


## 1.0 - 2020-02-21

### Added
* Started git exporter addon with basic git push functionality
* Added excludes in config
* Lovelace exports
* Addons config exports
* ESPHome exports
* Configurable Commit message
* Configurable exports
