#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

mkdir publish

# config
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"

# build
make publish

# deploy
cd public
git init
git add worklog.json
git commit -m "Deploy worklog."
git push --force --quiet "https://${GITHUB_TOKEN}@$github.com/${GITHUB_REPO}.git" master:gh-pages > /dev/null 2>&1
