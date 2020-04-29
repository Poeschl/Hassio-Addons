#!/usr/bin/env bashio
set -e

export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

bashio::log.info 'Start OWASP ZAP web interface'
/zap/zap-webswing.sh
