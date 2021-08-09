#!/usr/bin/env bash
set -euxo pipefail

wget -q -O sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip
echo "124f2d5115eee365df6cf3228ffbca6fc3911d16f8025bebd5b1c6e2fcfa7faf sdk.zip" | sha256sum -c

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
  "build-tools;30.0.3"
