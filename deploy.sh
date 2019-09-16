#!/bin/bash

set -e
set -x

git config --global credential.helper store
git config --global user.email "henyxia-bot@users.noreply.github.com"
git config --global user.name "Henyxia bot"
git config --global push.default simple

rm -rf deployment public
mkdir deployment
cd deployment
git init
git remote add origin https://henyxia-bot:$GITHUB_PASS@github.com/henyxia/henyxia.github.com.git
git pull origin source
git fetch
hugo
mv public ..
git checkout master
git reset --hard origin/master
rm * -r
mv ../public/* .
mv ../public/.well-known .
git add -A
git commit -m "buildbot @`date -Iseconds` SHA1=${TRAVIS_COMMIT} JOB=${TRAVIS_JOB_NUMBER}" || true
git push -u origin master

cd ..
rm -rf deployment
