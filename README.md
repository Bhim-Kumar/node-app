# Node Hello World
===========================================================================
Dockerhub link: https://hub.docker.com/repository/docker/bhimkumar/node-app/general
============================================================================
Documentation on how to deploy the app:

AWS Account(Ubuntu EC2)
Installed Docker
Installed Minikube
Installed kubectl
Installed Helm
Installed ArgoCD

Step #1:Install ArgoCD on Minikube
kubectl create ns argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

Step #2:Install Helm on Minikube
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
helm repo add stable https://charts.helm.sh/stable
helm repo update

Step #3: Clone the Repository Write Dockerfile and github action workflow to push your code to Dockerhub. 
 Cloned the Repo of the nodeapp in local and written Dockerfile and Pushed it to github.And in github action building the workflow our image is pushed to the dockerhub. 
 
Step #4:Create Helm Chart for NodeJS application and modify helm chart file
helm create nodeapp
This will create a new directory named nodeapp with the basic structure of a Helm chart.

Modify the Helm chart files according to our application’s requirements.

Update deployment.yaml , values.yaml , service.yaml
Helm install nodeapp nodeapp

Step #5:Access the Argo CD UI
kubectl port-forward svc/nodeapp -n argocd --address 0.0.0.0 80:3000
Write application.yaml file for argocd and push it github.

Step #6:Update the workflow and give the secrets in github accordingly.

Build your workflow and Your latest image will be deployed in server using argo cd.







