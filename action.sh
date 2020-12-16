#!/bin/bash

echo '🎩 Install Jekyll'
gem install bundler jekyll
bundle install
bundle exec jekyll -v || exit 1

echo '🧹 Clean site'
if [ -d "docs" ]; then
    # preserve CNAME file before deleting
    # see https://github.com/victoriadrake/jekyll-cd/issues/2
    if [ -f "docs/CNAME" ]; then cp docs/CNAME CNAME; fi
    rm -rf docs/*
fi

echo '🔨 Build site'
bundle exec jekyll build -d docs
# restore CNAME file
if [ -f "CNAME" ]; then cp CNAME docs/CNAME; fi

echo '🧪 Deploy build'
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git add .
git commit -am "🧪 Deploy with ${GITHUB_WORKFLOW}"
git push --all -f https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git
