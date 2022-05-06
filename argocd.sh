!#/bin/bash

# Create cluster
minikube start

# Clone argocd repo
git clone https://github.com/estevaofay/argocd-poc.git

# Change directory
cd argocd-poc/argocd-core-components

# Install argocd
kubectl apply --kustomize argocd-install

# Install bootstrap
kubectl apply --kustomize argocd-bootstrap

