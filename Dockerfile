FROM debian:buster-slim

LABEL maintainer="admin@abc.info"

RUN apt-get update
RUN apt-get install -yq squid curl apache2-utils

# Backup default conf
RUN mv /etc/squid/squid.conf /etc/squid/squid.conf.origin && chmod a-w /etc/squid/squid.conf.origin

# Make config
RUN egrep -v "^\s*(#|$)" /etc/squid/squid.conf.origin | uniq | sort > /etc/squid/squid.conf

ADD entrypoint.sh /sbin/entrypoint.sh
RUN chmod +x /sbin/entrypoint.sh

EXPOSE 3128/tcp

ENTRYPOINT ["/sbin/entrypoint.sh"]
