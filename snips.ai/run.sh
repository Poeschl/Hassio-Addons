#!/usr/bin/env bashio
set -e
set +u

bashio::log.info "Setup Settings"

broker_host='' #$(bashio::config 'mqtt.host')
broker_port='1883' #$(bashio::config 'mqtt.port')
broker_user='snips' #$(bashio::config 'mqtt.user')
broker_pass='' #$(bashio::config 'mqtt.password')

sed -i "/^# mqtt =/s/^# //" /etc/snips.toml
sed -i "/^mqtt =/s/=.*/= \"${broker_host}:${broker_port}\"/" /etc/snips.toml
sed -i "/^# mqtt_username =/s/^# //" /etc/snips.toml
sed -i "/^mqtt_username =/s/=.*/= \"${broker_user}\"/" /etc/snips.toml
sed -i "/^# mqtt_password =/s/^# //" /etc/snips.toml
sed -i "/^mqtt_password =/s/=.*/= \"${broker_pass}\"/" /etc/snips.toml

sed -i "/^# bind =/s/^# //" /etc/snips.toml
sed -i "/^bind =/s/=.*/= \"base@mqtt\"/" /etc/snips.toml
sed -i "/^# disable_capture =/s/^# //" /etc/snips.toml
sed -i "/^disable_capture =/s/=.*/= true/" /etc/snips.toml


bashio::log.info "Setup Assistant"
assistant_path='/assistant.zip' #"/share${bashio::config 'assistant'}"
bashio::fs.file_exists "$assistant_path"

unzip -q "$assistant_path" -d /usr/share/snips
snips-template render

pushd /var/lib/snips/skills

for url in $(awk '$1=="url:" {print $2}' /usr/share/snips/assistant/Snipsfile.yaml); do
  git clone "$url"
done

mkdir /share

find . -maxdepth 1 -type d -print0 | while IFS= read -r -d '' dir; do
    pushd "$dir" > /dev/null
    if [ -f setup.sh ]; then
        python3 -m venv venv
        source venv/bin/activate
        pip3 install --upgrade pip setuptools wheel
        bashio::log.info "Run setup.sh for '$dir'"
        bash ./setup.sh
    fi
    popd > /dev/null
done
chown -R _snips-skills:_snips-skills /var/lib/snips/skills

popd > /dev/null
ln -s /var/lib/snips/skills /share/snips-skills


bashio::log.info "Start snips-asr"
snips-asr &
bashio::log.info "Start snips-audio-server"
snips-audio-server &
bashio::log.info "Start snips-dialogue"
snips-dialogue &
bashio::log.info "Start snips-nlu"
snips-nlu &
bashio::log.info "Start snips-skill-server"
snips-skill-server --no-mike &

bashio::log.info "Start snips-watch"
snips-watch -vvv --no_color
