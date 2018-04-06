#!/bin/bash

./download_data.sh

gcloud auth application-default login

./send_sensor_data.py --speedFactor=60 --project ${GPROJECT}
