echo Setup language packs

# Get specified language packs
packs=$(cat '/data/options.json' | jq '.languagePacks')


echo Start MaryTTS
cd '/app' && bin/marytts-server
