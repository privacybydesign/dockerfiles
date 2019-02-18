#!/usr/bin/env bash
set -euxo pipefail

apt-get update
apt-get install -y --no-install-recommends \
  default-jdk-headless
rm -rf /var/lib/apt/lists/*

# SDK
wget -q -O sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
echo "92ffee5a1d98d856634e8b71132e8a95d96c83a63fde1099be3d86df3106def9 sdk.zip" | sha256sum -c

unzip -q sdk.zip -d "$ANDROID_HOME"
rm sdk.zip

# # NDK
wget -q -O ndk.zip https://dl.google.com/android/repository/android-ndk-r19b-linux-x86_64.zip
echo "0fbb1645d0f1de4dde90a4ff79ca5ec4899c835e729d692f433fda501623257a ndk.zip" | sha256sum -c

unzip -q ndk.zip -d /tmp
mv /tmp/android-ndk-r19b "$ANDROID_NDK_HOME"
rm ndk.zip

# Packages
set +o pipefail
yes | sdkmanager --licenses
set -o pipefail

sdkmanager \
  "platforms;android-28" \
  "build-tools;28.0.3"