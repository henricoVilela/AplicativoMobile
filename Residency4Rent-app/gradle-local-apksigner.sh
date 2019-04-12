export PATH=/Android/android-sdk/platform-tools:$PATH
export PATH=/Android/android-sdk/build-tools/26.0.2:$PATH
export GRADLE_HOME=/Android/gradle-4.4.1
export PATH=$PATH:$GRADLE_HOME/bin
zipalign -v -p 4 /Android/workspace/Residency4Rent/build/outputs/apk/release/Residency4Rent-release-unsigned.apk C:\Android\workspace\Residency4Rent/build/outputs/apk/release/Residency4Rent-release-unsigned-aligned.apk
apksigner sign --ks residency4rent-release.keystore --out /Android/workspace/Residency4Rent/build/outputs/apk/release/Residency4Rent-release.apk C:\Android\workspace\Residency4Rent/build/outputs/apk/release/Residency4Rent-release-unsigned-aligned.apk
