export JAVA_HOME=/Program Files/Java/jdk1.8.0_111
cd /Android/workspace/Residency4Rent
keytool -genkey -v -keystore residency4rent-release.keystore -alias residency4rent.keyalias -keyalg RSA -keysize 2048 -validity 10000 < /Android/workspace/Residency4Rent/keytool_input.txt
