set Path=%PATH%;C:\Android\apache-ant\bin
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_111
cd C:\Android\workspace\Residency4Rent
call ant clean release
if errorlevel 1 pause
