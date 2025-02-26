FROM n8nio/n8n:latest

USER root

# Install OpenSSH server
RUN apk update && apk add --no-cache openssh

# Generate SSH host keys
RUN ssh-keygen -A

# Create a directory for SSH to run
RUN mkdir -p /run/openrc && touch /run/openrc/softlevel

# Enable SSH service
RUN rc-update add sshd

# Expose SSH port
EXPOSE 22

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["sh", "-c", "/etc/init.d/sshd start", "/entrypoint.sh"]
