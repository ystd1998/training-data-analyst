#!/bin/sh

$ cd courses/machine_learning/deepdive/01_googleml/earthquakes

bash ingest.sh
head earthquakes.csv

# https://github.com/GoogleCloudPlatform/datalab-samples/blob/master/basemap/earthquakes.ipynb
bash install_missing.sh

./transform.py

ls -l 

# create bucket < qwiklabs-gcp-2183545cdc1b7634 >
gsutil cp earthquakes.* gs://<bucket>/earthquakes/

gsutil acl ch -u AllUsers:R gs://<bucket>/earthquakes/*
# https://storage.googleapis.com/qwiklabs-gcp-2183545cdc1b7634/earthquakes/earthquakes.htm

