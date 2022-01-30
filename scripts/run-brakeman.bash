#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "Running brakeman"
bundle exec brakeman --skip-files app/graphql/mutations/,app/controllers/graphql_controller.rb