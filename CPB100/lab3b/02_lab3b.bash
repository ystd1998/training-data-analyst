#!/bin/bash 

vim  sparkml/train_and_apply.py

gsutil cp sparkml/tr*.py gs://${GBUCKET}/sql
