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

function test_site() {
    echo "bundle exec htmlproofer ./_site"
    bundle exec htmlproofer ./_site \
    --only-4xx \
    --check-html \
    --disable-external \
    --empty-alt-ignore \
    --trace
}



#Main
echo "Executing Jekyll test script"

header
echo -e "Building site\n"
build_site
echo -e "\n\n"

header
echo -e "Testing _site\n"
test_site
