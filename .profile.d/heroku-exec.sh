#!/usr/bin/env bash

# Disable POSIX mode for compatibility
set +o posix

# Source the Heroku Exec script if not in an SSH session
[ -z "$SSH_CLIENT" ] && source <(curl --fail --retry 3 -sSL "$HEROKU_EXEC_URL")
