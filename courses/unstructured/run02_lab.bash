#!/bin/bash
# https://codelabs.developers.google.com/codelabs/cpb102-creating-dataproc-clusters/#5

# step one:
gcloud dataproc clusters create my-second-cluster --zone us-central1-a \
        --master-machine-type n1-standard-1 --master-boot-disk-size 10 \
        --num-workers 2 --worker-machine-type n1-standard-1 \
        --worker-boot-disk-size 10


#  step two:
# gsutil mb -c regional -l us-central1 gs://${GBUCKET}

# step three:
#./replace_and_upload.sh ${GBUCKET}

# step four
# gcloud compute ssh  my-second-cluster-m


# step
#gcloud dataproc clusters delete my-second-cluster
