#!/usr/bin/env bash
# Instructions on https://jekyllrb.com/docs/continuous-integration/travis-ci/

set -e # halt script on error

function header() {
  echo "---------------"
}

function build_site() {
    echo "bundle exec jekyll build"
    bundle exec jekyll build
}

function test_html() {
    echo "bundle exec htmlproofer ./_site"
    bundle exec htmlproofer ./_site \
    --only-4xx \
    --check-html \
    --disable-external \
    --empty-alt-ignore \
    --trace
}

function test_yml() {
  echo "bundle exec yaml-lint _posts/ *.md *.yml -n"
  bundle exec yaml-lint _posts/ *.md *.yml -n
}


#Main
echo "Executing Jekyll test script"

header
echo -e "Testing _site\n"
test_yml

echo -e "\n\n"

header
echo -e "Testing Build site\n"
build_site
