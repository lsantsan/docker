#!/bin/bash

if [ "$#" -eq 0 ]
  then
    LV_COUNTER=1
else
    LV_COUNTER="$1"
fi

while [ $LV_COUNTER -gt 0 ]
do
    CURRENT_NUMBER=`cat servers.number`
    SERVER_COUNTER=$(($CURRENT_NUMBER + 1))
    echo $SERVER_COUNTER > 'servers.number'
    HAPROXY_CMD_LINE='printf "\nserver server'"$SERVER_COUNTER"' server'"$SERVER_COUNTER"':8080 check" >> /etc/haproxy/haproxy.cfg'
    APP_SERVER_HOSTNAME='server'"$SERVER_COUNTER"
    LOCAL_PORT='808'"$SERVER_COUNTER"

    docker run -dp "$LOCAL_PORT":8080 --name="$APP_SERVER_HOSTNAME"_container --hostname="$APP_SERVER_HOSTNAME" --network root_default --network-alias "$APP_SERVER_HOSTNAME" my_app_image_composer
    docker exec -i haproxy_container /bin/bash -c "$HAPROXY_CMD_LINE"

    LV_COUNTER=$(( $LV_COUNTER - 1 ))
done
docker exec -i haproxy_container /bin/bash -c 'haproxy -f /etc/haproxy/haproxy.cfg -D -p /var/run/haproxy.pid -sf $(cat /var/run/haproxy.pid)'