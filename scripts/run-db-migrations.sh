#!/bin/bash

MODE=$1

if [ "$MODE" != "plan" ] && [ "$MODE" != "apply" ]; then
  echo "Invalid mode: $MODE"
  echo "Usage: run-db-migrations.sh <plan|apply>"
  exit 1
fi

if [ "$MODE" = "plan" ]; then
  echo "SELECT * FROM seon_idv.sessions sx WHERE sx.id = '123';" > liquibase/liquibase-output
  COMMAND=update-sql
elif [ "$MODE" = "apply" ]; then
  echo "Update successful!" > liquibase/liquibase-output
  echo "Executed: 1" >> liquibase/liquibase-output
  echo "Failed: 0" >> liquibase/liquibase-output
  echo "" >> liquibase/liquibase-output
  echo "Started at: 2025-07-15 14:57:49" >> liquibase/liquibase-output
  echo "Completed at: 2025-07-15 14:57:57" >> liquibase/liquibase-output
  COMMAND=update
fi

cat .liquibase.env
echo "docker compose -f docker-compose-lb.yml run --rm id-verification-liquibase liquibase $COMMAND --output-file=liquibase-output"
