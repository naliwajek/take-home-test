#!/usr/bin/env bash

set -e

docker-compose run --rm --service-ports app bin/guard.sh

