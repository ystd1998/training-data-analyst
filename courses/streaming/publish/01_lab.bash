#!/bin/bash
# https://codelabs.developers.google.com/codelabs/cpb104-pubsub/#1

gcloud beta pubsub topics create sandiego
gcloud beta pubsub topics publish sandiego "hello"

gcloud beta pubsub subscriptions create --topic sandiego mySub1
gcloud beta pubsub subscriptions pull --auto-ack mySub1

gcloud beta pubsub topics publish sandiego "hello again"
gcloud beta pubsub subscriptions pull --auto-ack mySub1
