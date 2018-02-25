#!/usr/bin/env bash
# Instructions on https://jekyllrb.com/docs/continuous-integration/travis-ci/

set -e # halt script on error

bundle exec jekyll build
bundle exec htmlproofer ./_site
