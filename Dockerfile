FROM n8nio/n8n:latest

USER root

RUN apt-get update && apt-get install -y openssh-server

RUN curl --fail --retry 3 -sSL https://github.com/heroku/heroku-exec-util/raw/master/heroku-exec.sh -o /app/.profile.d/heroku-exec.sh

EXPOSE 5000 2222

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
