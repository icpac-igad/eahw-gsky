#!/bin/bash
set -xeu
WEBHOOK_SECRET=${WEBHOOK_SECRET:-""}
WEBHOOK_ENABLED=${WEBHOOK_ENABLED:-false}

if [ "$WEBHOOK_ENABLED" = true ] && [ -n "$WEBHOOK_SECRET" ]
then
  echo "Webhooks enabled!"
else
  echo "Webhooks not enabled!"
fi