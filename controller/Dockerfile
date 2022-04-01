FROM debian:bullseye
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  mariadb-client \
  ucspi-tcp \
  netcat \
  curl \
  gnupg \
  lsb-release

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt update && apt install -y docker-ce-cli

RUN apt purge -y curl gnupg lsb-release && apt autoremove -y && apt clean

COPY *.sh /galera-controller/

WORKDIR /galera-controller

ENTRYPOINT ["./docker-entrypoint.sh"]

