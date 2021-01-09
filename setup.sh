minikube delete

minikube start --driver=docker --cpus=2
# minikube start --driver=virtualbox --cpus=2

eval $(minikube docker-env)
# eval $(minikube -p minikube docker-env)

# Build docker images.
docker build -t my_nginx srcs/nginx 1> /dev/null
docker build -t my_wordpress srcs/wordpress 1> /dev/null
docker build -t my_mysql srcs/mysql 1> /dev/null
docker build -t my_phpmyadmin srcs/phpmyadmin 1> /dev/null
docker build -t my_ftps srcs/ftps 1> /dev/null
docker build -t my_influxdb srcs/influxdb 1> /dev/null
docker build -t my_grafana srcs/grafana 1> /dev/null

# Set up metalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metalLB.yaml

# Deploy
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/influxdb.yaml
kubectl apply -f srcs/grafana.yaml

minikube dashboard
