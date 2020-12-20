FROM	alpine

# Install tools
RUN		apk update && \
		apk add --no-cache nginx openssl openssh

# Configure ssh connection
RUN		echo "root:password" | chpasswd && \
		sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && \
		ssh-keygen -A

# Create a ssl certification for nginx 
RUN		mkdir /etc/nginx/ssl \
		&& openssl genrsa -out /etc/nginx/ssl/private.key 2048 \
		&& openssl req -new -key /etc/nginx/ssl/private.key -out /etc/nginx/ssl/server.csr -subj "/C=JP/ST=Tokyo/L=Roppongi/O=42tokyo/OU=/CN=localhost" \
		&& openssl x509 -days 365 -req -signkey /etc/nginx/ssl/private.key -in /etc/nginx/ssl/server.csr -out /etc/nginx/ssl/server.crt

RUN		mkdir -p /run/nginx

#COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/nginx.conf			/etc/nginx/
COPY	/srcs/index.html			/var/www/
COPY	/srcs/start.sh				/

EXPOSE	80 443 22

ENTRYPOINT	sh start.sh