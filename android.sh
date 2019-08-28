#!/usr/bin/env bash
set -euxo pipefail

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  default-jdk-headless
rm -rf /var/lib/apt/lists/*

# SDK
wget -q -O sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
echo "92ffee5a1d98d856634e8b71132e8a95d96c83a63fde1099be3d86df3106def9 sdk.zip" | sha256sum -c

unzip -q sdk.zip -d "$ANDROID_HOME"
rm sdk.zip

# Packages
set +o pipefail
yes | sdkmanager --licenses
set -o pipefail

sdkmanager \
  "platform-tools" \
  "ndk-bundle" \
  "cmake;3.10.2.4988404" \
  "lldb;3.1" \
  "platforms;android-28" \
  "build-tools;28.0.3"
