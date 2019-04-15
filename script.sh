#!/bin/sh
set -e

PATHS=$(echo $PLUGIN_PATHS | sed -e "s/,/ /g")

mkdir -p /root/.aws

echo "[default]
aws_access_key_id=${PLUGIN_AWS_ACCESS_KEY_ID}
aws_secret_access_key=${PLUGIN_AWS_SECRET_ACCESS_KEY}
" | cat > /root/.aws/credentials

echo "[default]
region=eu-west-3
output=json
" | cat > /root/.aws/config


aws cloudfront create-invalidation \
	--distribution-id $PLUGIN_DISTRIBUTION_ID \
	--paths $PATHS