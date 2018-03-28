#!/bin/bash
# https://codelabs.developers.google.com/codelabs/cpb101-bigquery-dataflow-sideinputs/

cd ../javahelp
./run_oncloud3.sh ${GBUCKET} ${GBUCKET} JavaProjectsThatNeedHelp
gsutil cp gs://${GBUCKET}/javahelp/output.csv .
