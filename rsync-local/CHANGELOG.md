## 1.7.0 - 2023-10-13

* 🔨 Correct --archive argument (thanks @reedy | #418)
* 🔼 Updated to alpine `3.18`
* 🔼 Updated rsync to `3.2.7-r4`
* 🔼 Update coreutils to `9.3-r1`
* ✨ Add more device mappings (`/dev/sd[a-e][1-5]`)

## 1.6.0 - 2023-01-08

* 🔼 Updated rsync to `3.2.7-r0`
* 🐛 Fix broken options (#344)

## 1.5.1 - 2022-08-28

* 🐛 Fix Copy-Paste code for local rsync execution
* 📝 Updated docs to new addon config

## 1.5.0 - 2022-08-15

* 🔼 Updated to alpine `3.16`
* 🔼 Updated rsync to `3.2.4-r2`
* 🔼 Update coreutils to `9.1-r0`
* 🔨 Change the config to seperate options and destination per folder (#276)
* 📝 Updated to new repository structure + Yaml config

### ⚠️ Breaking Change ⚠️

Your addon config needs to be changed to the new per-folder options and destinations.

## 1.4.0 - 2022-04-05

* 🔼 Update rsync to `3.2.3-r4`
* 📝 Updated config.json and Readme


## 1.3.0 - 2021-04-02

* 🔨 Use ghcr.io/home-assistant for base images


## 1.2.0 - 2021-02-27

* 🔼 Update rsync to `3.2.3-r1`
* 🔼 Update alpine to `3.13`
* 🔼 Update coreutils to `8.32-r2`


## 1.0.1 - 2021-02-09

* 🔨 Migrate to new `devices` option format. Thanks @LiJu09


## 1.0.0 - 2019-10-28

* ➕ Introduced local rsync addon
