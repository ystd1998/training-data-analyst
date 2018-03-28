#!/bin/bash 

gsutil cp ../javahelp/src/main/java/com/google/cloud/training/dataanalyst/javahelp/*.java gs://${GBUCKET}/javahelp

# cat grepc.py
python grepc.py
