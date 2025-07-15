#!/bin/bash

MODE=$1

if [ "$MODE" != "plan" ] && [ "$MODE" != "apply" ]; then
  echo "Invalid mode: $MODE"
  echo "Usage: run-db-migrations.sh <plan|apply>"
  exit 1
fi

if [ "$MODE" = "plan" ]; then
  COMMAND=update-sql
  OPTIONS="--output-file=lb-diff.sql"
elif [ "$MODE" = "apply" ]; then
  COMMAND=update
  OPTIONS=""
fi

cat .liquibase.env
echo ""
echo "docker compose -f docker-compose-lb.yml run --rm id-verification-liquibase liquibase $COMMAND $OPTIONS"
ls -la
echo "SELECT * FROM seon_idv.sessions sx WHERE sx.id = '123';" > ./liquibase/lb-diff.sql
