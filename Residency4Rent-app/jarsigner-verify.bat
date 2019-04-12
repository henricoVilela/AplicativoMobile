set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_111
path %JAVA_HOME%\bin;%path%
cd C:\Android\workspace\Residency4Rent
jarsigner -verify -verbose -certs C:\Android\workspace\Residency4Rent\bin\Residency4Rent-release.apk
