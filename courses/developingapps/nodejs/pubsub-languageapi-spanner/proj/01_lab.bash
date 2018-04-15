#!/bin/bash

# https://googlecoursera.qwiklabs.com/focuses/8261

server$ . prepare_web_environment.sh
server$ npm start

worker$ . prepare_worker_environment.sh
worker$ npm run worker


# create pub/sub topic from console


worker$ gcloud beta pubsub subscriptions create cloud-shell-subscription --topic feedback
gcloud beta pubsub topics publish feedback "Hello World"

gcloud beta pubsub subscriptions pull cloud-shell-subscription --auto-ack




