#!/bin/bash

bash ../lab3a/authorize_cloudshell.sh

gcloud sql connect rentals --user=root
# mysql > source 04_run.sql
