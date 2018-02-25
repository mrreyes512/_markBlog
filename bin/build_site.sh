#!/usr/bin/env bash
# Instructions on https://jekyllrb.com/docs/continuous-integration/travis-ci/

ARG=$@
set -e # halt script on error

function header() {
  echo "---------------"
}

function build_site() {
    echo "bundle exec jekyll build $ARG"
    bundle exec jekyll build $ARG
}


#Main
echo "Executing Jekyll build script"

header
echo -e "Building site\n"
build_site
