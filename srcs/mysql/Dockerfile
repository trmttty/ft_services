FROM	alpine

RUN		apk update && \
		apk add mysql mysql-client --no-cache && \
		mkdir -p /run/mysqld && \
		mkdir -p /var/lib/mysql

RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY	/srcs/telegraf.conf		/etc/telegraf/
COPY	/srcs/my.cnf			/etc/mysql/
COPY	/srcs/wordpress.sql		/
COPY	/srcs/start.sh			/

EXPOSE 3306

ENTRYPOINT	sh start.sh
