#!/bin/sh
set -e

. ./atlantis.var #前面的点是source的简写

./atlantis server \
--atlantis-url="$URL" \
--gh-user="$USERNAME" \
--gh-token="$TOKEN" \
--gh-webhook-secret="$SECRET" \
--repo-allowlist="$REPO_ALLOWLIST" \
--repo-config="$REPO_CONFIG"