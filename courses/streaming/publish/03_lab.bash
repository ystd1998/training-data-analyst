#!/bin/bash


gcloud beta pubsub subscriptions create --topic sandiego mySub2
gcloud beta pubsub subscriptions pull --auto-ack mySub2


gcloud beta pubsub subscriptions delete mySub2
