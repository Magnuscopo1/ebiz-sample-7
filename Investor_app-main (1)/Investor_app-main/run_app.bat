@echo off
echo --- Fixing Path and Cleaning Gradle ---
cd android
call gradlew.bat clean
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Gradle clean failed. Try closing any programs using the folder.
    pause
    exit /b %ERRORLEVEL%
)
cd ..

echo --- Setting up ADB Reverse ---
adb reverse tcp:3000 tcp:3000
adb reverse tcp:8081 tcp:8081

echo --- Starting the App ---
npm run android
pause
