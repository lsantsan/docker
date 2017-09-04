#!/bin/bash
# . ./<name>.sh

if [ "$#" -eq 0 ]
  then
    LV_COUNTER=1
else
    LV_COUNTER="$1"
fi

HAPROXY_CMD_LINE="sed -i '$ d' /etc/haproxy/haproxy.cfg"
while [ $LV_COUNTER -gt 0 ]
do
    CURRENT_NUMBER=`cat servers.number`
    APP_CONTAINER_NAME='server'"$CURRENT_NUMBER"'_container'
    docker rm -f "$APP_CONTAINER_NAME"
    docker exec -i haproxy_container /bin/bash -c "$HAPROXY_CMD_LINE"

    echo "$(($CURRENT_NUMBER - 1))" > 'servers.number'
    LV_COUNTER=$(( $LV_COUNTER - 1 ))
done
docker exec -i haproxy_container /bin/bash -c 'haproxy -f /etc/haproxy/haproxy.cfg -D -p /var/run/haproxy.pid -sf $(cat /var/run/haproxy.pid)'