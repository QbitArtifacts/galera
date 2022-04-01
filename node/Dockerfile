FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  mariadb-server \
  galera-4 \
  netcat

COPY my.cnf /etc/mysql/my.cnf

RUN mkdir /run/mysqld
ENTRYPOINT ["docker-entrypoint.sh"]
