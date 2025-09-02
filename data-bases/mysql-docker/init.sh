#!/bin/bash

echo "Esperando a que MySQL esté listo..."
until mysqladmin ping -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASSWORD}" --silent; do
  echo "MySQL no está listo, reintentando en 5 segundos..."
  sleep 5
done

echo "MySQL está listo, ejecutando el dump..."
mysql -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASSWORD}" "${DB_NAME}" < /tmp/dump.sql
echo "Dump completado."