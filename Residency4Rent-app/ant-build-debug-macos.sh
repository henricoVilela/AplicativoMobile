export PATH=/Android/apache-ant/bin:$PATH
export JAVA_HOME=${/usr/libexec/java_home}
export PATH=${JAVA_HOME}/bin:$PATH
cd /Android/workspace/Residency4Rent
ant -Dtouchtest.enabled=true debug
