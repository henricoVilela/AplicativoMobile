set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_111
set PATH=%JAVA_HOME%\bin;%PATH%
set JAVA_TOOL_OPTIONS=-Duser.language=en
cd C:\Android\workspace\Residency4Rent
keytool -genkey -v -keystore residency4rent-release.keystore -alias residency4rent.keyalias -keyalg RSA -keysize 2048 -validity 10000 < C:\Android\workspace\Residency4Rent\keytool_input.txt
