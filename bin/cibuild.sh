#!/usr/bin/env bash
# Instructions on https://jekyllrb.com/docs/continuous-integration/travis-ci/

set -e # halt script on error

bundle exec jekyll build
bundle exec htmlproofer ./_site --only-4xx --check-favicon --check-html --disable-external
