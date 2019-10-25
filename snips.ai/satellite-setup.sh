#!/bin/bash

sudo apt install snips-hotword-model-heysnipsv4 snips-satellite snips-tts snips-skill-server alsamixer git python3 python3-pip

#Uncomment this section if you are not using a Respeaker PiHAT2
git clone https://github.com/respeaker/seeed-voicecard seeed-voicecard
cd seeed-voicecard
sudo ./install.sh
rm seeed-voicecard

sudo usermod -a -G snips-skills-admin $USER
sudo usermod -a -G spi,gpio,audio _snips-skills
git clone https://github.com/snipsco/snips-skill-respeaker.git snips-skill-respeaker
mv -r snips-skill-respeaker /var/lib/snips/skills/
cd /var/lib/snips/skills/snips-skill-respeaker
./setup.sh

echo "TODO:"
echo "* Configure Audio [https://docs.snips.ai/articles/raspberrypi/manual-setup#configuring-audio]"
echo "* Setup snips settings (/etc/snips.toml) [https://docs.snips.ai/articles/platform/satellites#step-2-connect-your-base-and-satellite-s]"
echo "* Setup led feedback (/var/lib/snips/skills/snips-skill-respeaker/config.ini) [https://github.com/snipsco/snips-skill-respeaker#configurations]"
echo "* Reboot"
