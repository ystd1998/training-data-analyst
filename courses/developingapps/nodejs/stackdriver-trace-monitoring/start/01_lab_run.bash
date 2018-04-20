#!/bin/bash
# https://googlecoursera.qwiklabs.com/focuses/8267

. prepare_environment.sh

gcloud iam service-accounts create quiz-account --display-name "Quiz Account"

gcloud iam service-accounts keys create key.json --iam-account=quiz-account@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com


export GOOGLE_APPLICATION_CREDENTIALS=key.json

gcloud projects get-iam-policy $DEVSHELL_PROJECT_ID --format json > iam.json

node setup/add_iam_policy_to_service_account.js

gcloud projects set-iam-policy $DEVSHELL_PROJECT_ID iam_modified.json


# install the Node.js agent for Stackdriver Trace
npm install --save @google-cloud/trace-agent
npm start
