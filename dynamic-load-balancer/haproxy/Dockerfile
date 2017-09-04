FROM ubuntu

RUN apt-get update && apt-get -y install \
    vim \
    iputils-ping \
    wget \
    haproxy \
    supervisor

RUN  mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.original

RUN  wget -O /etc/haproxy/haproxy.cfg "http://mybrazilianrecipes.com/docker/haproxy/haproxy.cfg"

RUN  wget -O /etc/supervisor/conf.d/supervisord.conf "http://mybrazilianrecipes.com/docker/haproxy/supervisord.conf"

EXPOSE 80

CMD ["/usr/bin/supervisord"]