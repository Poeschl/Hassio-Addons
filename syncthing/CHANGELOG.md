## 1.19.0 - 2024-03-24

* 🔨 Mount all available directories into add-on container and improve documentation. Home Assistant's config folder is now available under `/homeassistant` and the configuration of all Home Assistant add-ons under `/addon_configs` (fixes #460, @salim-b | #467).
* 🔨 Hide authentication warnings inside addon. For further discussion see #340 (thanks @salim-b | #457)
* 🔼 Updated syncthing to `1.27.4-r2` (thanks @salim-b | #462)

## 1.18.2 - 2024-01-13

* 🐛 Fix migration issue (again)

## 1.18.1 - 2024-01-13

* 🐛 Fix migration issue

## 1.18.0 - 2024-01-13

* 🔨 Configure Syncthing via environment variables instead of CLI arguments where possible and properly separate config and database/state directories (thanks @salim-b | #450)
* 🔨 Set `/share` as default folder path fallback (fixes #447, @salim-b).
* 🔼 Updated syncthing to `1.27.2-r0`

## 1.17.0 - 2023-10-13

* 🔨 Set gui-address to first IP in container (thanks @reedy | #426)
* 🔨 DOCS.md: Add information about HA Syncthing Integration (thanks @reedy & @salim-b | #420)
* 🔨 DOCS.md: Improve Configuration section (thanks @reedy | #419)
* 🔼 Updated syncthing to `1.25.0-r1` (thanks @salim-b | #412)

## 1.16.3 - 2023-07-20

* 🔼 Updated syncthing to `1.23.6-r1`  (thanks @salim-b | #394)

## 1.16.2 - 2023-04-11

* 🔼 Updated syncthing to `1.23.4-r0`
* 🔨 Use HTTP**S** for repository URL

 (thanks @salim-b | #375)

## 1.16.1 - 2023-01-08

* 🔼 Updated syncthing to `1.23.0-r0`
* 🔨 Make syncthing recognize the cli parameter

## 1.16.0 - 2022-11-05

* 🔼 Updated syncthing to `1.22.1-r0`


## 1.15.1 - 2022-08-17

* 📝 Updated Docs with more information about external storage (thanks @salim-b | #332)


## 1.15.0 - 2022-08-03

* 🔼 Updated syncthing to `1.20.1-r3`
* 🔼 Update alpine to `3.16`
* 🔨 Migrated to S6-Overlay `V3`
* 📝 Updated to new repository structure + Yaml config
* 📝 Updated Readme (thanks @salim-b | #330)


## 1.14.0 - 2022-04-10

* 🔼 Updated syncthing to `1.19.2-r0`
* 📝 Updated Readme


## 1.13.0 - 2021-10-31

* 🔼 Update alpine to `3.14`
* 🔼 Update syncthing to `1.18.3-r0`
* 🔨 Remove Jemalloc memory handling


## 1.12.0 - 2021-07-12

* 🔼 Update syncthing to `1.18.0-r0`
* 📝 Add notice about storage usage (thanks @kappuchino)


## 1.11.0 - 2021-06-03

* 🔼 Update syncthing to `1.17.0-r0`


## 1.10.0 - 2021-04-02

* 🔼 Update alpine to `3.13`
* 🔼 Update syncthing to `1.16.0-r0`


## 1.9.0 - 2021-04-02

* 🔨 Use ghcr.io/home-assistant for base images


## 1.8.1 - 2021-03-17

* 🐛 Specifiy own S6 entrypoint, don't rely on the base image.


## 1.8.0 - 2021-01-30

* 🔼 Update alpine to `3.12`
* 🔼 Update syncthing to `1.12.1-r0`
* 🔨 Use Jemalloc for better memory handling


## 1.7.0 - 2020-12-11

* 🔼 Update syncthing to `1.12.0-r0` (also for aarch64)


## 1.6.2 - 2020-10-22

* 🔨 Use S6-Overlay for execution
* 🔨 Start as `application` startup type


## 1.6.1 - 2020-10-08

* 🔼 Update syncthing to `1.10.0-r1` (aarch64 still`1.5.0-r0`)


## 1.6.0 - 2020-10-07

* ➕ Map also `/media` folder inside


## 1.5.0 - 2020-10-06

* 🔼 Update syncthing to `1.10.0-r0` (except for aarch64, there its downgraded to `1.5.0-r0`)


## 1.4.0 - 2020-08-16

* 🔼 Update syncthing to `1.8.0-r0` (except for aarch64, there its `1.7.1-r1`)
* ➕ Map also `/ssl` folder inside

## 1.3.0 - 2020-06-15

* 🔼 Update syncthing to `1.6.1-r0`
* 🔼 Update alpine to `3.12`

## 1.2.0 - 2020-05-22

* 🔨 Updated Changelog to new format
* 🔼 Update syncthing to `1.5.0-r0`


## 1.1.0 - 2020-04-16

* 🔼 Update syncthing to `1.4.2-r0`


## 1.0.0 - 2020-03-19

* ➕ Started with syncthing version `1.4`
