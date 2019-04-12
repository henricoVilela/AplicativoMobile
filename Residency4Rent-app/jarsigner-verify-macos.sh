export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /Android/workspace/Residency4Rent
jarsigner -verify -verbose -certs /Android/workspace/Residency4Rent/bin/Residency4Rent-release.apk
