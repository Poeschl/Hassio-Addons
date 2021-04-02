## 1.3.0 - 2021-04-02

* 🔨 Use ghcr.io/home-assistant for base images


## 1.2.3 - 2021-03-17

* 🐛 Specifiy own S6 entrypoint, don't rely on the base image.


## 1.2.2 - 2021-03-10

* 🐛 Recover missing environment variable to fix voice download (see #200)


## 1.2.1 - 2021-03-04

* 🔼 Updated openjdk8 to `8.275.01-r0`


## 1.2.0 - 2021-01-30

* 🔼 Updated alpine image to `3.13`
* 🔼 Updated wget to `1.21.1-r1`
* 🔼 Updated openjdk8 to `8.272.10-r4`
* 🔨 Use Jemalloc for better memory handling


## 1.1.1 - 2020-10-22

* 🔨 Start as `application` startup type


## 1.1.0 - 2020-10-15

* 🔼 Update alpine to `3.12`
* 🔼 Update wget to `1.20.3-r1`
* 🔼 Update unzip to `6.0-r8`
* 🔨 Use S6-Overlay for execution


## 1.0.1 - 2020-10-06

* 🔼 Updated openjdk to `8.252.09-r0`


## 1.0.0 - 2020-05-22

* ➕ own versioning for changes
* ➕ Added configuration docs
* 🔨 Updated Changelog to new format

## 5.2-4 - 2020-03-29

* 🔼 Update unzip to `6.0-r6`


## 5.2-3 - 2020-02-24

### Added

* ➕ Download voice packs according to language on demand


## 5.2-2 - 2020-02-07

* 🔼 Updated Dependencies:
  * alpine `3.11`
  * openjdk8 `8.242.08-r0`


## 5.2-1 - 2019-10-06

* 🔨 Integration into new build setup


## 5.2 - 2019-07-19

* ➕ Put MaryTTS 5.2 inside HASS.io addon
* 🔨 Added plugin to pre-built ones
