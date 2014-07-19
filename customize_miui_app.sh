#!/bin/bash
#
# $1: dir for original miui app 
# $2: dir for target miui app
#

XMLMERGYTOOL=$PORT_ROOT/tools/ResValuesModify/jar/ResValuesModify
GIT_APPLY=$PORT_ROOT/tools/git.apply

echo "original dir: $2"
echo "target dir:$1"

if [ $1 = "Contacts" ];then
    cp $1/fix_Contacts.sh out/
    cd out
	echo "replace functions in Contacts"
	./fix_Contacts.sh Contacts/

fi

