#!/bin/sh
set -e

PROFILE_ID=$(/usr/libexec/PlistBuddy -c 'Print UUID' /dev/stdin <<< $(security cms -D -i "./Scripts/profile/$XCODE_SCHEME.mobileprovision"))

agvtool new-version -all $TRAVIS_BUILD_NUMBER

xctool -workspace "$XCODE_WORKSPACE" -scheme "$XCODE_SCHEME" -sdk iphonesimulator test

#!/usr/bin/env bash

if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  echo "This is a pull request. No deployment will be done."
  exit 0
fi
if [[ "$TRAVIS_BRANCH" != "master" ]]; then
  echo "Testing on a branch other than master. No deployment will be done."
  exit 0
fi

xctool -workspace "$XCODE_WORKSPACE" -scheme "$XCODE_SCHEME" archive -archivePath "./build/$XCODE_SCHEME" PROVISIONING_PROFILE=$PROFILE_ID
xcodebuild -exportArchive -exportFormat ipa -archivePath "./build/$XCODE_SCHEME.xcarchive" -exportPath "./build/$XCODE_SCHEME.ipa" -exportWithOriginalSigningIdentity