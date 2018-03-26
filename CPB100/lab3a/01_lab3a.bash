#!/bin/bash

# https://codelabs.developers.google.com/codelabs/cpb100-cloud-sql/

less cloudsql/table_creation.sql
head cloudsql/*.csv

gsutil cp cloudsql/* gs://${GBUCKET}/sql/

bash ./find_my_ip.sh

gcloud sql connect rentals --user=root
# mysql> source 02_run.sql;
# mysql> exit
