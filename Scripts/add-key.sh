#!/bin/sh

KEY_CHAIN=ios-build.keychain
security create-keychain -p travis $KEY_CHAIN
# Make the keychain the default so identities are found
security default-keychain -s $KEY_CHAIN
# Unlock the keychain
security unlock-keychain -p travis $KEY_CHAIN
# Set keychain locking timeout to 3600 seconds
security set-keychain-settings -t 3600 -u $KEY_CHAIN

# Add certificates to keychain and allow codesign to access them
security import ./Scripts/certs/dist.cer -k $KEY_CHAIN -T /usr/bin/codesign
security import ./Scripts/certs/dist.p12 -k $KEY_CHAIN -P $KEY_PASSWORD  -T /usr/bin/codesign

echo "List keychains: "
security list-keychains
echo " ****** "

echo "Find indentities keychains: "
security find-identity -p codesigning  ~/Library/Keychains/ios-build.keychain
echo " ****** "

# Put the provisioning profile in place
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp "./Scripts/profile/$XCODE_SCHEME.mobileprovision" ~/Library/MobileDevice/Provisioning\ Profiles/