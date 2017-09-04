#!/bin/bash

export SERVER_COUNTER="2"

# CREATING FOLDER STRUCTURE
mkdir my_app haproxy client monitor

# DOWLOADING FILES
# MY_APP
cd my_app
wget http://www.mybrazilianrecipes.com/docker/my_app/Dockerfile
# HAPROXY
cd /root/haproxy
wget http://www.mybrazilianrecipes.com/docker/haproxy/Dockerfile
# CLIENT
cd /root/client
wget http://www.mybrazilianrecipes.com/docker/client/Dockerfile
# MONITOR
cd /root/monitor
wget http://www.mybrazilianrecipes.com/docker/monitor/monitor.py
wget http://www.mybrazilianrecipes.com/docker/monitor/addServer.sh
wget http://www.mybrazilianrecipes.com/docker/monitor/removeServer.sh
wget http://www.mybrazilianrecipes.com/docker/monitor/servers.number
chmod +x addServer.sh && chmod +x removeServer.sh
pip install BeautifulSoup4
# COMPOSER
cd
wget http://www.mybrazilianrecipes.com/docker/docker-compose.yml

