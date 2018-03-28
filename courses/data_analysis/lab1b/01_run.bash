#!/bin/bash
#  https://codelabs.developers.google.com/codelabs/cpb101-bigquery-data/#2

curl https://storage.googleapis.com/cloud-training/CPB200/BQ/lab4/schema_flight_performance.json -o schema_flight_performance.json

bq load --source_format=NEWLINE_DELIMITED_JSON $DEVSHELL_PROJECT_ID:cpb101_flight_data.flights_2014 gs://cloud-training/CPB200/BQ/lab4/domestic_2014_flights_*.json ./schema_flight_performance.json

bq ls $DEVSHELL_PROJECT_ID:cpb101_flight_data

bq extract cpb101_flight_data.AIRPORTS gs://${GBUCKET}/bq/airports2.csv
