#!/bin/bash 
# https://googlecoursera.qwiklabs.com/focuses/8264?locale=en


. prepare_environment.sh

gcloud container clusters get-credentials quiz-cluster --zone us-central1-a --project qwiklabs-gcp-1006c33ebb02e59d

kubectl get pods

gcloud container builds submit -t gcr.io/$DEVSHELL_PROJECT_ID/quiz-frontend ./frontend/

gcloud container builds submit -t gcr.io/$DEVSHELL_PROJECT_ID/quiz-backend ./backend/

kubectl create -f ./frontend-deployment.yaml

kubectl create -f ./backend-deployment.yaml

kubectl create -f ./frontend-service.yaml




