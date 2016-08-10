#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

mkdir publish
cd publish
git init
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"
git pull https://${GITHUB_TOKEN}@${GITHUB_REPO} gh-pages:master

# build
cd ..
make publish

# deploy
cd publish
git add worklog.json
git commit -m "Deploy worklog."
git branch
echo "tiborsimon\n${GITHUB_TOKEN}" | git push https://github.com/tiborsimon/worklog.git gh-pages
