#!/bin/bash
# https://codelabs.developers.google.com/codelabs/cpb102-machine-learning-to-big-data-processing/

gcloud dataproc clusters create my-cluster --zone us-central1-a \
        --master-machine-type n1-standard-1 --master-boot-disk-size 50 \
        --num-workers 2 --worker-machine-type n1-standard-1 \
        --worker-boot-disk-size 50 --network=default \
        --scopes 'https://www.googleapis.com/auth/cloud-platform' \
        --project ${GBUCKET} \
        --initialization-actions "gs://dataproc-initialization-actions/datalab/datalab.sh","gs://${GBUCKET}/unstructured/init-script.sh"
