#!/bin/sh

if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  echo "This is a pull request. No deployment will be done."
  exit 0
fi
if [[ "$TRAVIS_BRANCH" != "master" ]]; then
  echo "Testing on a branch other than master. No deployment will be done."
  exit 0
fi

ipa distribute:itunesconnect --verbose -f "./build/$XCODE_SCHEME.ipa" -a $ITUNESCONNECT_USER -p $ITUNESCONNECT_PASSWORD -i $APPLE_APP_ID