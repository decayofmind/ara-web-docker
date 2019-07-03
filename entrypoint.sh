#!/bin/sh

cat <<EOT > /srv/ara-web/build/config.json
{
  "apiURL": "${ARA_WEB_API_URL:-'http://0.0.0.0:5000'}"
}
EOT

serve -s -n -l tcp://0.0.0.0:5000  ./build
