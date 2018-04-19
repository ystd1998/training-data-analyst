#!/bin/bash
# https://googlecoursera.qwiklabs.com/focuses/8266

gcloud source repos clone default

cp -r ~/training-data-analyst/courses/developingapps/nodejs/stackdriver-debug-errorreporting/start/quiz-app/* ~/default
cd ~/default
echo node_modules > .gitignore

git add .
git config --global user.email "student@example.com"
git config --global user.name "A Student"

git commit -m "Quiz application initial check-in"
git push


cd ~/default
npm install --save @google-cloud/debug-agent

cd ~/default
git add .
git commit -m "Added Stackdriver Debug Agent"
git push

# produce source context files,
gcloud debug source gen-repo-info-file --output-directory .

npm install
npm start


# install the Node.js library for Stackdriver Error Reporting
cd ~/default
npm install --save @google-cloud/error-reporting

