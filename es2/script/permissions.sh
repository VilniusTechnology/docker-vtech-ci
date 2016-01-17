#!/bin/bash

OLD_ES_UID=$(id -u elasticsearch)
echo "OLD elasticsearch UID: ${OLD_ES_UID}"

TARGET_UID=$(stat -c "%u" /usr/share/elasticsearch/data)
echo '-- Setting ES user to use uid '$TARGET_UID
usermod -u ${TARGET_UID} elasticsearch
echo "NEW elasticsearch UID: $(id -u elasticsearch)"

echo "CH-MODDING"

chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

exec gosu elasticsearch "$@"


#chmod -R 0777 /usr/share/elasticsearch/data

echo "CH-MODDDED"

#elasticsearch



#exec /docker-entrypoint.sh $@
