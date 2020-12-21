FROM	alpine

RUN		apk update && \
		apk add --no-cache mysql mysql-client && \
		mkdir -p /run/mysqld && \
		mkdir -p /var/lib/mysql

# COPY	/srcs/telegraf.conf		/etc/telegraf/
COPY	/srcs/my.cnf			/etc/mysql
COPY	/srcs/start.sh			/

EXPOSE 3306

ENTRYPOINT	sh start.sh
