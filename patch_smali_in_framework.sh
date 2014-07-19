#!/bin/bash

APKTOOL="$PORT_ROOT/tools/apktool --quiet"
TMP_FILE=tmp.smali
GIT_APPLY=$PORT_ROOT/tools/git.apply

for f in `grep -rn "telephony\/AdnRecordCache;" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/AdnRecordCache;/telephony\/uicc\/AdnRecordCache;/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done


for f in `grep -rn "gsm\/SpnOverride" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/gsm\/SpnOverride/uicc\/SpnOverride/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/IccConstants" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/IccConstants/telephony\/uicc\/IccConstants/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/IccFileHandler" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/IccFileHandler/telephony\/uicc\/IccFileHandler/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/IccUtils" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/IccUtils/telephony\/uicc\/IccUtils/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/AdnRecord;" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/AdnRecord;/telephony\/uicc\/AdnRecord;/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/UiccCardApplication" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/UiccCardApplication/telephony\/uicc\/UiccCardApplication/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/IccCardApplicationStatus\$AppType" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/IccCardApplicationStatus\$AppType/telephony\/uicc\/IccCardApplicationStatus\$AppType/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/AdnRecord\$1;" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/AdnRecord\$1;/telephony\/uicc\/AdnRecord\$1;/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/AdnCacheManager;" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/AdnCacheManager;/telephony\/uicc\/AdnCacheManager;/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/IccRecords;" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/IccRecords;/telephony\/uicc\/IccRecords;/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/AdnRecord\$Injector;" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/AdnRecord\$Injector;/telephony\/uicc\/AdnRecord\$Injector;/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/gsm\/SIMRecords\$Injector;" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/gsm\/SIMRecords\$Injector;/telephony\/uicc\/SIMRecords\$Injector;/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/gsm\/SIMRecords;" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/gsm\/SIMRecords;/telephony\/uicc\/SIMRecords;/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done


for f in `grep -rn "telephony\/MiuiAdnRecordCache" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/MiuiAdnRecordCache/telephony\/uicc\/MiuiAdnRecordCache/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/MiuiAdnRecord" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/MiuiAdnRecord/telephony\/uicc\/MiuiAdnRecord/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/MiuiAdnRecordLoader" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/MiuiAdnRecordLoader/telephony\/uicc\/MiuiAdnRecordLoader/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep -rn "telephony\/MiuiIccFileHandler" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/telephony\/MiuiIccFileHandler/telephony\/uicc\/MiuiIccFileHandler/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done


for f in `grep -rn "class\ Lcom\/android\/internal\/telephony\/gsm\/MiuiSpnOverrideImpl;" $1 | cut -d: -f1 | sort | uniq`
do
    echo "replace file:$f"
    sed "s/class\ Lcom\/android\/internal\/telephony\/gsm\/MiuiSpnOverrideImpl;/class\ public\ Lcom\/android\/internal\/telephony\/gsm\/MiuiSpnOverrideImpl;/g" $f > $TMP_FILE
    cp $TMP_FILE $f
    rm $TMP_FILE
done

for f in `grep  -rn "CdmaDataConnectionTracker;->getActiveApn" $1 | grep "telephony\/ApnSetting;" | cut -d: -f1 | sort | uniq `
do
    echo "replace file:$f"
    cat /dev/null > $TMP_FILE
    IFS=$'\n'
    for l in `cat $f`
    do
        echo $l | grep  "CdmaDataConnectionTracker;->getActiveApn" | grep "telephony\/ApnSetting;" -q
        if [ $? -eq 0 ]
        then
           l=`echo $l | sed "s/telephony\/ApnSetting;/telephony\/DataProfile;/"`
        fi
        echo $l >> $TMP_FILE
    done
    cp $TMP_FILE $f
    rm $TMP_FILE
done
