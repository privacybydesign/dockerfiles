#!/usr/bin/env bash
set -euxo pipefail

wget -q -O sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip
echo "f10f9d5bca53cc27e2d210be2cbc7c0f1ee906ad9b868748d74d62e10f2c8275 sdk.zip" | sha256sum -c

unzip -q sdk.zip -d "$ANDROID_HOME"
rm sdk.zip

# Packages
set +o pipefail
yes | sdkmanager --sdk_root="$ANDROID_HOME" --licenses
set -o pipefail

sdkmanager --sdk_root="$ANDROID_HOME" \
  "platform-tools" \
  "ndk-bundle" \
  "cmake;3.10.2.4988404" \
  "lldb;3.1" \
  "platforms;android-28" \
  "build-tools;28.0.3" \
  >/dev/null
