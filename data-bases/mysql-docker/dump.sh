#!/bin/bash

echo 'Esperando 60 segundos para que MySQL este listo...'
sleep 60
echo 'Ejecutando el dump en la base de datos...'
mysql -h localhost -u root -prootpassword dbmysql < /tmp/dump.sql
echo 'Dump completado.'