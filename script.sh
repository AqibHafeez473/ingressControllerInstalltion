#!/bin/bash

# Clone the NGINX Kubernetes Ingress repository and switch to the specified branch
git clone https://github.com/nginx/kubernetes-ingress.git --branch v3.2.0

# Change the active directory
cd kubernetes-ingress

# Create a namespace and a service account
kubectl apply -f deployments/common/ns-and-sa.yaml

# Create a cluster role and binding for the service account
kubectl apply -f deployments/rbac/rbac.yaml

# (Optional) Create the App Protect role and binding
kubectl apply -f deployments/rbac/ap-rbac.yaml

# (Optional) Create the App Protect DoS role and binding
kubectl apply -f deployments/rbac/apdos-rbac.yaml

# Apply the default server secret
kubectl apply -f examples/shared-examples/default-server-secret/default-server-secret.yaml

# Create a ConfigMap to customize your NGINX settings
kubectl apply -f deployments/common/nginx-config.yaml

# Create an IngressClass resource
kubectl apply -f deployments/common/ingress-class.yaml

# Apply the CRDs for NGINX Ingress Controller
kubectl apply -f https://raw.githubusercontent.com/nginx/kubernetes-ingress/v4.0.0/deploy/crds.yaml
kubectl apply -f https://raw.githubusercontent.com/nginx/kubernetes-ingress/v4.0.0/deploy/crds-nap-waf.yaml
kubectl apply -f https://raw.githubusercontent.com/nginx/kubernetes-ingress/v4.0.0/deploy/crds-nap-dos.yaml

# Deploy the NGINX Ingress Controller (various deployment options)
kubectl apply -f deployments/deployment/nginx-ingress.yaml
kubectl apply -f deployments/deployment/nginx-plus-ingress.yaml
kubectl apply -f deployments/daemon-set/nginx-ingress.yaml
kubectl apply -f deployments/daemon-set/nginx-plus-ingress.yaml
