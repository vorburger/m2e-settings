#!/bin/sh

function getVersion {
        cat << EOF | xmllint --noent --shell pom.xml | grep content | cut -f2 -d=
setns pom=http://maven.apache.org/POM/4.0.0
xpath /pom:project/pom:version/text()
EOF
}

agentcount=`ps aux|grep gpg-agent|wc -l`

current_version=$(getVersion)
major_version=$(expr $current_version : '\(.*\)\..*\..*\-SNAPSHOT')
minor_version=$(expr $current_version : '.*\.\(.*\)\..*\-SNAPSHOT')
bugfix_version=$(expr $current_version : '.*\..*\.\(.*\)-SNAPSHOT')

CURRENT_VERSION=$major_version.$minor_version.$bugfix_version
NEW_VERSION="$major_version.$minor_version.$(expr $bugfix_version + 1)-SNAPSHOT"

echo "Releasing M2E Settings plugin for Eclipse version $CURRENT_VERSION
------------------------------------------------------------------
This script assumes you are running on OS X, it hasn't been tested on any other
operating systems, and you can bet it won't work on Windows...

REQUIREMENTS:

 - a pure JDK 7 environment, JDK 8 or newer won't cut it
 - Maven 3.2.1 (older releases are b0rked, just don't bother)
 - gpg, gpg-agent and pinentry for signing"
 
export JAVA_HOME=`/usr/libexec/java_home -v1.7`
echo "
Current Java version is: $(java -version 2>&1 | tail -n 2 | head -n 1)
"

echo mvn tycho-versions:set-version -DnewVersion=$CURRENT_VERSION
echo git commit -U -m "Preparing to release $CURRENT_VERSION"
echo mvn package
echo rm -rf site
echo mv nl.topicus.m2e.settings.feature/target/site .
echo git add site
echo git commit -m "Created $CURRENT_VERSION"
echo git tag $CURRENT_VERSION
echo mvn tycho-versions:set-version -DnewVersion=$NEW_VERSION
echo git commit -U -m "Preparing for new development"

echo "
Done
"

