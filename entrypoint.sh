#!/bin/sh

set -eu

ARGS="${ARGS:--e -c -r --delete}"
SSHPATH="$HOME/.ssh"
SERVER_PORT="${SERVER_PORT:-22}"
SSH_ARGS="${SSH_ARGS:-}"
FOLDER="${FOLDER:-./}"
SERVER_DEPLOY_STRING="$USERNAME@$SERVER_IP:$SERVER_DESTINATION"

if [ ! -d "$SSHPATH" ]; then
  mkdir -p "$SSHPATH"
fi
echo "$DEPLOY_KEY" >"$SSHPATH/key"
chmod 600 "$SSHPATH/key"

# sync it up"
sh -c "rsync $ARGS -e 'ssh -i $SSHPATH/key -o StrictHostKeyChecking=no -p $SERVER_PORT $SSH_ARGS' $GITHUB_WORKSPACE/$FOLDER $SERVER_DEPLOY_STRING"
