FROM n8nio/n8n:latest

USER root

# Install required packages
RUN apk update && apk add --no-cache bash curl openssh iproute2 python3

# Ensure /bin/sh points to /bin/bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Create the .profile.d directory
RUN mkdir -p /app/.profile.d/

# Add the heroku-exec.sh script
COPY .profile.d/heroku-exec.sh /app/.profile.d/heroku-exec.sh

# Make the script executable
RUN chmod +x /app/.profile.d/heroku-exec.sh

# Expose the SSH port
EXPOSE 2222

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/bin/bash", "-c", "/usr/sbin/sshd && /entrypoint.sh"]
