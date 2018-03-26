#!/bin/bash

# https://github.com/GoogleCloudPlatform/datalab-samples/blob/master/basemap/earthquakes.ipynb
# using anaconda2 (python=2.7), env=dw
python transform.py

gsutil cp earthquakes.* gs://${GBUCKET}
