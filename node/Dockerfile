FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  mariadb-server \
  galera-4 \
  netcat

RUN apt clean

COPY my.cnf /etc/mysql/my.cnf
COPY docker-entrypoint.sh /galera-node/

WORKDIR /galera-node

RUN mkdir /run/mysqld
ENTRYPOINT ["docker-entrypoint.sh"]
