#!/bin/bash
# https://googlecoursera.qwiklabs.com/focuses/8257

sudo apt-get update
sudo apt-get install git
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt install nodejs -y
node -v
git clone https://github.com/ystd1998/training-data-analyst
cd training-data-analyst/
cd courses/developingapps/nodejs/devenv

# sudo node server/app.js

npm install
node list-gce-instances.js
