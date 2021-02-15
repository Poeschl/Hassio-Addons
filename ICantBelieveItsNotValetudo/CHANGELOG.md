## 2.7.0 - 2021-02-15

* 🔨 Allow also anonymous access in mqtt broker url
* 🔼 Updated pango to `1.48.2-r0`


## 2.6.1 - 2021-02-10

* 🔼 Updated git to `2.30.1-r0`


## 2.6.0 - 2021-01-30

* 🔼 Updated alpine image to `3.13`
* 🔼 Updated git to `2.30.0-r0`
* 🔼 Updated npm to `14.15.4-r0`
* 🔼 Updated python3 to `3.8.7-r0`
* 🔼 Updated pkgconf to `1.7.3-r0`
* 🔼 Updated pango/pango-dev to `1.48.1-r0`
* 🔼 Updated libjpeg-turbo/libjpeg-turbo-dev to `2.0.6-r0`
* 🔨 Use Jemalloc for better memory handling


## 2.5.0 - 2020-12-14

* 🔨 Include small webserver to center the floorplan and apply the HA theme.
* 🔼 Updated ICantBelieveItsNotValetudo to latest commit `bd687c1`

## 2.4.0 - 2020-11-28

* 🔼 Updated ICantBelieveItsNotValetudo to latest commit `4b4a62c`

## 2.3.0 - 2020-10-23

* 🔼 Updated ICantBelieveItsNotValetudo to latest commit `67f86e2`

### ⚠️ Breaking Change ⚠️

* Colors are only supported as hex values. See [Colors](https://github.com/Hypfer/ICantBelieveItsNotValetudo#new-map-colors)
* Colors are not optional anymore, they will be set to the defaults if not existing.

## 2.2.2 - 2020-10-22

* 🔨 Start as `application` startup type

## 2.2.1 - 2020-10-06

* 🔼 Updated npm to `12.18.4-r0`

## 2.2.0 - 2020-07-29

* 🔼 Updated ICantBelieveItsNotValetudo to latest commit `30945f9` to use the new map data format
* 🔼 Updated alpine image to `3.12`
* 🔼 Updated git to `2.26.2-r0`
* 🔼 Updated npm to `12.17.0-r0`
* 🔨 Change build system to two-staged system for compiling needed npm packages outside of the running image
* 🔨 Use S6 system

## 2.1.0 - 2020-05-29

* 🔼 🐛 Updated ICantBelieveItsNotValetudo to latest commit `9bcfc25`

## 2.0.3 - 2020-05-22

* 🔨 Updated Changelog to new format

## 2.0.2 - 2020-04-29

* 🔼 Updated git to `2.24.3-r0`

## 2.0.1 - 2020-04-16

* 🔼 Updated git to `2.24.2-r0`

## 2.0.0 - 2020-02-27

* 🔼 Updated ICantBelieveItsNotValetudo to latest commit `3cf4f8a`
* ➕ Adjusted to new config structure (__Make sure to migrate your existing config!__)

## 1.0.0 - 2020-02-07

* ➕ Own versioning for changes. Start with `1.0.0`
* 🔼 Updated Dependencies:
  * alpine `3.11`
  * git `2.24.1-r0`
  * npm `12.15.0-r1`

## 0.2.0-5 - 2019-11-06

* ➕ Added schema for optional cropping parameters

## 0.2.0-4 - 2019-10-19

* 🔨 Switch to current master instead of latest version (thanks @Nickerchen)

## 0.2.0-3 - 2019-10-15

* 🔼 Use alpine 3.9 as base image

## 0.2.0-2 - 2019-10-06

* 🔨 Integration into new build setup

## 0.2.0-1 - 2019-09-02

* ➕ Added HASS.io Ingress feature (#6)
* 🔨 Ingress is now the default access method

## 0.2.0 - 2019-08-14

* ➕ SSL Mapping on HASS.io
* ➕ Add ICantBelieveItsNotValetudo Version 0.2.0 in its basic form
* ➕ Added plugin to pre-built ones
* 🐛 Fixed MQTT config setting
