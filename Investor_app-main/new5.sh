#!/bin/bash
# Fixed path run script

APP_DIR=$(pwd)
echo "Current directory: $APP_DIR"

# 1. Kill any existing Gradle processes that might be locking files
echo "Stopping Gradle Daemons..."
cd android
./gradlew --stop || true

# 2. Manually remove the local .gradle cache (This solves the "Could not move" error)
echo "Removing Gradle cache..."
rm -rf .gradle

# 3. Clean and Build
echo "Cleaning and building..."
./gradlew clean
cd ..

# ADB Setup
adb reverse tcp:3000 tcp:3000
adb reverse tcp:8081 tcp:8081

# Run the app
npm run android