#!/bin/sh

echo "::add-mask::${TER_USERNAME}"
echo "::add-mask::${TER_PASSWORD}"

EXT_KEY="${1}"
EXT_DIR="${2}"

php -d default_socket_timeout=3600 ${HOME}/.composer/vendor/bin/ter-client upload -u "${TER_USERNAME}" -p "${TER_PASSWORD}" -m "Release version ${VERSION}" "${EXT_KEY}" "${EXT_DIR}"