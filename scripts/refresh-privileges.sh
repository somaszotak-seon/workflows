#!/bin/bash

USER="$1"
PASSWORD="$2"
HOST="$3"
PORT="$4"

PGPASSWORD=$PASSWORD psql -h "$HOST" -p "$PORT" -U "$USER" -w -d id_verification -f "scripts/refresh-privileges.sql"
