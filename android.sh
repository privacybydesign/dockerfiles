#!/usr/bin/env bash
set -euxo pipefail

wget -q -O sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip
echo "7a00faadc0864f78edd8f4908a629a46d622375cbe2e5814e82934aebecdb622 sdk.zip" | sha256sum -c

unzip -q sdk.zip -d "$ANDROID_HOME"
rm sdk.zip

# Packages
set +o pipefail
yes | sdkmanager --sdk_root="$ANDROID_HOME" --licenses
set -o pipefail

# Flutter 2 needs Android SDK platform 28, 29 and 30 and build-tools 28 and 30. We pack them into
# the Docker image to prevent that Flutter downloads them on every app build.
sdkmanager --sdk_root="$ANDROID_HOME" \
  "platform-tools" \
  "ndk;21.4.7075529" \
  "cmake;3.10.2.4988404" \
  "platforms;android-28" \
  "platforms;android-29" \
  "platforms;android-30" \
  "build-tools;28.0.3" \
  "build-tools;30.0.3" \
  >/dev/null
