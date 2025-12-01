set -e

NAME="kubernetes-demo-api"
USERNAME="abhilashreddy15519"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE

echo "Deployment script completed."

echo "Applying Kubernetes configurations..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Kubernetes configurations applied."

echo "Getting the status of pods..."
kubectl get pods

echo "Getting the status of services..."
kubectl get services

echo "fetching the main service details..."
kubectl get service $NAME-service