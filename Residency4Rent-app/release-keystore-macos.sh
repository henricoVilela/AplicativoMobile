export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /Android/workspace/Residency4Rent
keytool -genkey -v -keystore residency4rent-release.keystore -alias residency4rent.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /Android/workspace/Residency4Rent/keytool_input.txt
