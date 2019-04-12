set Path=%PATH%;C:\Android\android-sdk\platform-tools;C:\Android\android-sdk\build-tools\26.0.2
set GRADLE_HOME=C:\Android\gradle-4.4.1
set PATH=%PATH%;%GRADLE_HOME%\bin
zipalign -v -p 4 C:\Android\workspace\Residency4Rent\build\outputs\apk\release\Residency4Rent-release-unsigned.apk C:\Android\workspace\Residency4Rent\build\outputs\apk\release\Residency4Rent-release-unsigned-aligned.apk
apksigner sign --ks residency4rent-release.keystore --out C:\Android\workspace\Residency4Rent\build\outputs\apk\release\Residency4Rent-release.apk C:\Android\workspace\Residency4Rent\build\outputs\apk\release\Residency4Rent-release-unsigned-aligned.apk
