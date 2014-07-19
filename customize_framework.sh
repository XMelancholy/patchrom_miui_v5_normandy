#!/bin/bash
#
# $1: dir for miui
# $2: dir for original
#

APKTOOL="$PORT_ROOT/tools/apktool --quiet"
BUILD_OUT=out
GIT_APPLY=$PORT_ROOT/tools/git.apply

SEP_FRAME="framework2.jar.out"

if [ $2 = "out/framework" ]
then

    	echo "patch smali"
	./patch_smali_in_framework.sh $2
    rm $BUILD_OUT/framework/smali/com/android/internal/telephony/cdma/RuimFileHandler.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/cdma/RuimRecords.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/gsm/SIMFileHandler.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/gsm/SIMRecords.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/gsm/SIMRecords\$1.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/gsm/SIMRecords\$Get_Spn_Fsm_State.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/gsm/SpnOverride.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/gsm/UsimServiceTable.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/gsm/UsimServiceTable\$UsimService.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/gsm/VoiceMailConstants.smali
	rm -r out/framework/smali/com/android/internal/telephony/ims
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/AdnRecord.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/AdnRecord\$1.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/AdnRecordCache.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/AdnRecordLoader.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccCardApplication.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccCardApplication\$AppState.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccCardApplication\$AppType.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccCardApplication\$PersoSubState.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccCardStatus.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccCardStatus\$CardState.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccCardStatus\$PinState.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccConstants.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccException.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccFileHandler.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccFileHandler\$LoadLinearFixedContext.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccFileNotFound.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccFileTypeMismatch.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccIoResult.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccRecords.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccRecords\$IccRecordLoaded.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccRefreshResponse.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccServiceTable.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccUtils.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccVmFixedException.smali
	rm $BUILD_OUT/framework/smali/com/android/internal/telephony/IccVmNotSupportedException.smali
    mv $BUILD_OUT/framework/smali/com/android/internal/telephony/gsm/SpnOverride\$Injector.smali $BUILD_OUT/framework/smali/com/android/internal/telephony/uicc/SpnOverride\$Injector.smali
	mv $BUILD_OUT/framework/smali/com/android/internal/telephony/AdnRecord\$Injector.smali $BUILD_OUT/framework/smali/com/android/internal/telephony/uicc/AdnRecord\$Injector.smali
	mv $BUILD_OUT/framework/smali/com/android/internal/telephony/gsm/SIMRecords\$Injector.smali $BUILD_OUT/framework/smali/com/android/internal/telephony/uicc/SIMRecords\$Injector.smali
	mv $BUILD_OUT/framework/smali/com/android/internal/telephony/AdnCacheManager.smali $BUILD_OUT/framework/smali/com/android/internal/telephony/uicc/AdnCacheManager.smali
	mv $BUILD_OUT/framework/smali/com/android/internal/telephony/MiuiAdnRecord.smali $BUILD_OUT/framework/smali/com/android/internal/telephony/uicc/
	mv $BUILD_OUT/framework/smali/com/android/internal/telephony/MiuiAdnRecord\$1.smali $BUILD_OUT/framework/smali/com/android/internal/telephony/uicc/
	mv $BUILD_OUT/framework/smali/com/android/internal/telephony/MiuiAdnRecordCache.smali $BUILD_OUT/framework/smali/com/android/internal/telephony/uicc/
	mv $BUILD_OUT/framework/smali/com/android/internal/telephony/MiuiAdnRecordLoader.smali $BUILD_OUT/framework/smali/com/android/internal/telephony/uicc/
	mv $BUILD_OUT/framework/smali/com/android/internal/telephony/MiuiIccFileHandler.smali $BUILD_OUT/framework/smali/com/android/internal/telephony/uicc/

    # move some smali to create a separate $SEP_FRAME.jar
    # including: smali/miui smali/android/widget
    rm -rf $BUILD_OUT/framework2.jar.out
	mkdir -p "$BUILD_OUT/$SEP_FRAME/smali/android"
	mv "$BUILD_OUT/framework/smali/android/widget" "$BUILD_OUT/$SEP_FRAME/smali/android"
	mv "$BUILD_OUT/framework/smali/android/bluetooth" "$BUILD_OUT/$SEP_FRAME/smali/android"

fi


if [ $2 = "$BUILD_OUT/framework2" ]
then

    	echo "patch smali"
	./patch_smali_in_framework.sh $2
	cp -r $BUILD_OUT/$SEP_FRAME/smali/android/widget/  $BUILD_OUT/framework2/smali/android/
	cp -r $BUILD_OUT/$SEP_FRAME/smali/android/bluetooth/  $BUILD_OUT/framework2/smali/android/
	rm -rf $BUILD_OUT/framework2.jar.out
fi

