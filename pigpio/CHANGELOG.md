## 1.4.0 - 2021-06-27

* 🏗️ Added `aarch64` architecture
* 🔼 Update pigpio to `V79`


## 1.3.0 - 2021-04-02

* 🔨 Use ghcr.io/home-assistant for base images


## 1.2.1 - 2021-03-17

* 🐛 Specifiy own S6 entrypoint, don't rely on the base image.


## 1.2.0 - 2021-02-13

* 🐛 Relocate pigpio's pipe files in `/dev` to make it work inside the addon environment ([#178](https://github.com/Poeschl/Hassio-Addons/issues/178)).
* ➖ Disabled local fifo interface, since its not used


## 1.1.1 - 2021-02-09

* 🔨 Migrate to new `devices` option format. Thanks @LiJu09


## 1.1.0 - 2020-12-31

* 🔼 Update pigpio to `V78`


## 1.0.0 - 2020-10-22

* 🔨 Own versioning scheme
* 🔨 Use S6-Overlay for execution
* 🔨 Start as `service` startup type


## V71-2 - 2020-05-22

* 🔨 Updated Changelog to new format
* 🔼 Update git to `1:2.20.1-2+deb10u3`


## V71-1 - 2019-10-15

* 🔼 Updated the OS to debian buster (thanks to @Nickerchen)


## V71 - 2019-10-15

* ➕ Put pigpio V71 inside the addon.
