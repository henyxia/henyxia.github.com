#!/bin/bash

set -e

echo $GITHUB_AUTH_SECRET > ~/.git-credentials && chmod 0600 ~/.git-credentials
git config --global credential.helper store
git config --global user.email "henyxia-bot@users.noreply.github.com"
git config --global user.name "Henyxia bot"
git config --global push.default simple

rm -rf deployment
git clone -b master https://github.com/henyxia/henyxia.github.com deployment
cd deployment
hugo
mv public ..
rm * -r
mv ../public .
git add -A
git commit -m "rebuilding site on `date`, commit ${TRAVIS_COMMIT} and job ${TRAVIS_JOB_NUMBER}" || true
git push

cd ..
rm -rf source
