#!/bin/bash
# https://codelabs.developers.google.com/codelabs/cpb100-datalab/index.html#0

gcloud compute zones list

datalab create mydatalabvm --zone ${GZONE}

# webpreview:port -> 8081
# datalab connect mydatalabvm
