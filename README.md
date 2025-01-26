

# NGINX Ingress Controller Deployment

This repository provides a script to automate the deployment of the NGINX Ingress Controller in a Kubernetes cluster. It sets up namespaces, service accounts, RBAC configurations, and applies necessary CRDs to get the Ingress Controller running.

## Prerequisites

Before running the script, ensure the following:

- You have a running Kubernetes cluster (e.g., using kubeadm, Minikube, EKS, GKE, or AKS).
- `kubectl` CLI is installed and configured to communicate with your cluster.
- You have sufficient permissions to create resources in the Kubernetes cluster.

## Steps to Run the Script

### Step 1: Clone the Required Repository

Before executing the script, clone the NGINX Kubernetes Ingress repository:

```bash
git clone https://github.com/nginx/kubernetes-ingress.git --branch v3.2.0
cd kubernetes-ingress


# Step 2: Make the Script Executable
Set the script’s execution permission:


chmod +x script.sh
# Step 3: Run the Script
Run the script to deploy the NGINX Ingress Controller:


./script.sh
# Step 4: Verify the Deployment
Once the script has completed, check the status of the deployment:


kubectl get pods -n nginx-ingress
# What This Script Does
The script automates the following tasks:

Clones the Repository: Downloads the NGINX Kubernetes Ingress repository at the specified version (v3.2.0).
Changes the Directory: Switches to the kubernetes-ingress directory.
Creates Namespaces and Service Accounts: Sets up the required namespace and service accounts for the Ingress Controller.
Configures RBAC Permissions: Applies RBAC roles and bindings for the NGINX Ingress Controller.
Applies ConfigMaps and CRDs: Configures NGINX settings and applies Custom Resource Definitions (CRDs).
Deploys the NGINX Ingress Controller: Installs the controller using Deployment or DaemonSet options.
