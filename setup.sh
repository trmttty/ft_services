# Kill all processes.
minikube delete

# Start minikube.
#minikube start --driver=docker
minikube start --driver=virtualbox

# Use the docker daemon from minikube.
#eval $(minikube docker-env)
eval $(minikube -p minikube docker-env)

# Build docker images.
docker build -t my_nginx srcs/nginx
docker build -t my_wordpress srcs/wordpress
docker build -t my_mysql srcs/mysql
docker build -t my_phpmyadmin srcs/phpmyadmin

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
