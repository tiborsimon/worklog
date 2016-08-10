#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

# config
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"
echo "Git configured"

mkdir publish
cd publish
git init
git pull https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git gh-pages:master
ls -la

# build
cd ..
make publish

# deploy
cd publish
ls -la
git status
git commit -am "Deploy worklog."
git push "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git" master:gh-pages
