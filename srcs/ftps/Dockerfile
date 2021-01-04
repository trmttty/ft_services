FROM	alpine

RUN		apk update && apk add vsftpd openssl --no-cache && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		echo "root:toor" | chpasswd 
		
# Create a ssl certification for vsftpd
RUN		openssl genrsa -out /etc/ssl/private/vsftpd.key 2048 \
		&& openssl req -new -key /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.csr -subj "/C=JP/ST=Tokyo/L=Roppongi/O=42tokyo/OU=/CN=localhost" \
		&& openssl x509 -days 365 -req -signkey /etc/ssl/private/vsftpd.key -in /etc/ssl/certs/vsftpd.csr -out /etc/ssl/certs/vsftpd.crt

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/vsftpd.conf			/etc/vsftpd
COPY	/srcs/start.sh				/

#Port 21 works in active and passive mode. Port 30021 only passive mode works.
EXPOSE	21 30021

ENTRYPOINT	sh start.sh
