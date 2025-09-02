FROM mysql:8.0.22

COPY my.cnf /etc/mysql/my.cnf
COPY dump.sh /tmp/dump.sh
#COPY dump.sql /tmp/dump.sql

RUN chmod +x /tmp/dump.sh
