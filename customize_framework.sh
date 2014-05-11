#!/bin/bash
#
# $1: dir for miui
# $2: dir for original
#

APKTOOL=$PORT_ROOT/tools/apktool
 
if [ $2 = "out/framework" ];then
	echo "mv to framework2.jar"

    	#rm "framework2.jar.out/" -rf
	#mkdir -p "framework2.jar.out/smali"
	#touch "framework2.jar.out/apktool.yml"
	#echo "version: 1.4.3" >> "framework2.jar.out/apktool.yml"
	#echo "apkFileName: framework2.jar" >> "framework2.jar.out/apktool.yml"
	
	#mkdir -p "framework2.jar.out/smali/android"
	rm -fr "framework2.jar.out/smali/com/qualcomm"
	mv "out/framework/smali/com/qualcomm" "framework2.jar.out/smali/com"
	#mv "out/framework/smali/android/test" "framework2.jar.out/smali/android"

	rm -fr "framework2.jar.out/smali/com/google"
	mv "out/framework/smali/com/google" "framework2.jar.out/smali/com"
	
	rm -fr "framework2.jar.out/smali/org"
	mv "out/framework/smali/org" "framework2.jar.out/smali"

	rm -fr "framework2.jar.out/smali/android/location"
	mv "out/framework/smali/android/location" "framework2.jar.out/smali/android"

	#mkdir -p "framework2.jar.out/smali/android/media"
	#mv "out/framework/smali/android/media/audiofx" "framework2.jar.out/smali/android/media"
	#mv "out/framework/smali/android/media/effect" "framework2.jar.out/smali/android/media"
	#mv "out/framework/smali/android/media/videoeditor" "framework2.jar.out/smali/android/media"
fi
