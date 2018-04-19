#!/bin/bash
# https://googlecoursera.qwiklabs.com/focuses/8265?locale=en

. prepare_environment.sh

gcloud app deploy ./frontend/app.yaml

# redeploy
gcloud app deploy ./frontend/app.yaml --no-promote \
--no-stop-previous-version
