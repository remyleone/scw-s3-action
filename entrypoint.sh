#!/bin/sh

set -euo pipefail

: "${SCW_ACCESS_KEY?SCW_ACCESS_KEY environment variable must be set}"
: "${SCW_SECRET_KEY?SCW_SECRET_KEY environment variable must be set}"
: "${SCW_REGION?SCW_REGION environment variable must be set}"


mkdir -p ~/.aws

touch ~/.aws/config

echo "
[plugins]
endpoint = awscli_plugin_endpoint

[default]
region = ${SCW_REGION}
s3 =
  endpoint_url = https://s3.${SCW_REGION}.scw.cloud
  signature_version = s3v4
s3api =
  endpoint_url = https://s3.${SCW_REGION}.scw.cloud 
" > ~/.aws/config

touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${SCW_ACCESS_KEY}
aws_secret_access_key = ${SCW_SECRET_KEY}" > ~/.aws/credentials

# Run and preserve output for consumption by downstream actions
/aws "$@" >"${GITHUB_WORKSPACE}/aws.output"

# Write output to STDOUT
cat "${GITHUB_WORKSPACE}/aws.output"
