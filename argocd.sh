!#/bin/bash

# Create cluster
minikube start

# Clone argocd repo
git clone https://github.com/estevaofay/argocd-poc.git

# Change directory
cd argocd-poc/argocd-core-components/argocd-install

# Install argocd
kubectl apply --kustomize .

# Change directory
cd ../argocd-bootstrap

# Install bootstrap
kubectl apply --kustomize .

# Change directory
cd ..

# Port-forward
kubectl port-forward service/argocd-server -n argocd 8080:443

# Login
https://localhost:8080/argocd

# Get password
ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

############
## EKSCTL ##
############

eksctl create cluster --region us-east-2 --version 1.22 --profile playground

# Clone argocd repo
git clone https://github.com/estevaofay/argocd-poc.git

# Change directory
cd argocd-poc/argocd-core-components/argocd-install

# Install argocd
kubectl apply --kustomize .

# Change directory
cd ../argocd-bootstrap

# Install bootstrap
kubectl apply --kustomize .

# Change directory
cd ..

# Port-forward
kubectl port-forward service/argocd-server -n argocd 8080:443

# Get Password
ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)

# Create NGINX Ingress Controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/aws/1.22/deploy.yaml