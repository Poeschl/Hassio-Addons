echo Setup config
echo 'mqtt:' > /app/config.json
cat /data/options.json >> /app/config.json
echo ', "webserver": { "enabled": true, "port": 3000 }' >> /app/config.json
cat /app/config.json

cd /app && npm start
