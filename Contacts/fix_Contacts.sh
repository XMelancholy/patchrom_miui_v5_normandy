#!/bin/bash


sed -i "s/content\:\/\/icc\/isusimphonebook/null/g" `grep -rl content\:\/\/icc\/isusimphonebook ./Contacts/`
sed -i "s/com.android.phone.MiuiCallFeaturesSetting/com.android.phone.MSimCallFeaturesSetting/g" `grep -rl com.android.phone.MiuiCallFeaturesSetting ./Contacts/res/`
sed -i "s/com.android.phone.MiuiAutoIpSetting/com.android.phone.ipcallsetting.IPCallSettings/g" `grep -rl com.android.phone.MiuiAutoIpSetting ./Contacts/res/`
