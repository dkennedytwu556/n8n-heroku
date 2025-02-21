FROM n8nio/n8n:latest

USER root

ENV SFMC_AUTH_TOKEN=${SFMC_AUTH_TOKEN}

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
