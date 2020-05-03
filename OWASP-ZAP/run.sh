#!/usr/bin/env bashio
set -e

JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
export JAVA_HOME

bashio::log.info 'Start OWASP ZAP web interface'
/zap/zap-webswing.sh
