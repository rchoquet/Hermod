#!/bin/sh

setfacl -R -m u:www-data:rwX -m u:`whoami`:rwX var/cache var/logs var/sessions
setfacl -dR -m u:www-data:rwX -m u:`whoami`:rwX var/cache var/logs var/sessions

./bin/console cache:clear --env prod
./bin/console cache:warmup --env prod

php-fpm --nodaemonize
