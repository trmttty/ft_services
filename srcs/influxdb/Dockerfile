FROM 	alpine

RUN		apk update && apk add openrc --no-cache && \
		apk add influxdb && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/start.sh				/
COPY	/srcs/healthcheck.sh		/

EXPOSE	8086

ENTRYPOINT sh start.sh
