#!/bin/bash
PROJECTID="true-server-269807"
IMAGENAME="apigcp"
IMAGETAG="apigcp"
echo "CONSTRUYENDO y TAGEANDO IMAGEN"
echo "-------------------------------------------------"
docker build -t $IMAGENAME .
docker tag $IMAGETAG gcr.io/$PROJECTID/$IMAGENAME
echo "SUBIENDO IMAGEN A GOOGLE REGISTRY"
echo "-------------------------------------------------"
docker push gcr.io/$PROJECTID/$IMAGENAME
echo "INICIANDO CLUSTER EN GKE CON TERRAFORM"
echo "-------------------------------------------------"
cd terraform
terraform init
terraform plan
terraform apply
echo "SELECCIONANDO CLUSTER"
gcloud container clusters get-credentials apigcp-cluster --region southamerica-east1-a
echo "-------------------------------------------------"
echo "CREANDO DEPLOYMENT"
cd ..
#kubectl apply -f deployment.yml PARA USO EN MINIKUBE
kubectl create deployment apigcp --image=gcr.io/$PROJECTID/$IMAGENAME:latest
echo "BALANCER PARA EXPONER IP PUBLICA"
kubectl expose deployment apigcp --type=LoadBalancer --port 80 --target-port 4000
echo "PROCESO CULMINADO, VERIFIQUE EXTERNARL IP CON kubectl get services -w"