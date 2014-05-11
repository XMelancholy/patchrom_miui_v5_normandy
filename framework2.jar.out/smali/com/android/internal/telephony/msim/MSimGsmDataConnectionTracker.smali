.class public final Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;
.super Lcom/android/internal/telephony/gsm/GsmDataConnectionTracker;
.source "MSimGsmDataConnectionTracker.java"


# instance fields
.field private mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

.field private mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/os/Message;",
            ">;"
        }
    .end annotation
.end field

.field protected mSubscription:Ljava/lang/Integer;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/PhoneBase;)V
    .locals 2
    .parameter "p"

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/gsm/GsmDataConnectionTracker;-><init>(Lcom/android/internal/telephony/PhoneBase;)V

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    .line 62
    new-instance v0, Landroid/os/RegistrantList;

    invoke-direct {v0}, Landroid/os/RegistrantList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    .line 66
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getSubscription()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    .line 67
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mInternalDataEnabled:Z

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mInternalDataEnabled (is data sub?) = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mInternalDataEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 69
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->broadcastMessenger()V

    .line 70
    return-void
.end method


# virtual methods
.method protected broadcastMessenger()V
    .locals 1

    .prologue
    .line 167
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v0

    if-nez v0, :cond_0

    .line 171
    :goto_0
    return-void

    .line 170
    :cond_0
    invoke-super {p0}, Lcom/android/internal/telephony/gsm/GsmDataConnectionTracker;->broadcastMessenger()V

    goto :goto_0
.end method

.method public cleanUpAllConnections(Ljava/lang/String;)V
    .locals 1
    .parameter "cause"

    .prologue
    .line 261
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->cleanUpAllConnections(Ljava/lang/String;Landroid/os/Message;)V

    .line 262
    return-void
.end method

.method public cleanUpAllConnections(Ljava/lang/String;Landroid/os/Message;)V
    .locals 2
    .parameter "cause"
    .parameter "disconnectAllCompleteMsg"

    .prologue
    .line 271
    const-string v1, "cleanUpAllConnections"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 272
    if-eqz p2, :cond_0

    .line 273
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 276
    :cond_0
    const v1, 0x4201e

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 277
    .local v0, msg:Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 278
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->sendMessage(Landroid/os/Message;)Z

    .line 279
    return-void
.end method

.method protected cleanUpAllConnections(ZLjava/lang/String;)V
    .locals 1
    .parameter "tearDown"
    .parameter "reason"

    .prologue
    .line 142
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/gsm/GsmDataConnectionTracker;->cleanUpAllConnections(ZLjava/lang/String;)V

    .line 144
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->isDisconnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->notifyDataDisconnectComplete()V

    .line 146
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->notifyAllDataDisconnected()V

    .line 148
    :cond_0
    return-void
.end method

.method public declared-synchronized disableApnType(Ljava/lang/String;)I
    .locals 2
    .parameter "type"

    .prologue
    .line 316
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 317
    invoke-super {p0, p1}, Lcom/android/internal/telephony/gsm/GsmDataConnectionTracker;->disableApnType(Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 324
    :goto_0
    monitor-exit p0

    return v1

    .line 319
    :cond_0
    :try_start_1
    const-string v1, "default"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 320
    const-string v1, "disableApnType(): NOT active DDS, apnContext setEnabled as false for default"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 321
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/ApnContext;

    .line 322
    .local v0, apnContext:Lcom/android/internal/telephony/ApnContext;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/ApnContext;->setEnabled(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 324
    .end local v0           #apnContext:Lcom/android/internal/telephony/ApnContext;
    :cond_1
    const/4 v1, 0x3

    goto :goto_0

    .line 316
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized enableApnType(Ljava/lang/String;)I
    .locals 2
    .parameter "apnType"

    .prologue
    .line 330
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 331
    invoke-super {p0, p1}, Lcom/android/internal/telephony/gsm/GsmDataConnectionTracker;->enableApnType(Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 338
    :goto_0
    monitor-exit p0

    return v1

    .line 333
    :cond_0
    :try_start_1
    const-string v1, "default"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 334
    const-string v1, "enableApnType(): NOT active DDS, apnContext setEnabled as true for default"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 335
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/ApnContext;

    .line 336
    .local v0, apnContext:Lcom/android/internal/telephony/ApnContext;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/ApnContext;->setEnabled(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 338
    .end local v0           #apnContext:Lcom/android/internal/telephony/ApnContext;
    :cond_1
    const/4 v1, 0x3

    goto :goto_0

    .line 330
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected getUiccCardApplication()Lcom/android/internal/telephony/uicc/IccRecords;
    .locals 4

    .prologue
    .line 175
    const/4 v1, 0x0

    .line 176
    .local v1, subscriptionData:Lcom/android/internal/telephony/msim/Subscription;
    const/4 v0, 0x1

    .line 178
    .local v0, appType:I
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    instance-of v2, v2, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    if-eqz v2, :cond_1

    .line 179
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    check-cast v2, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->getSubscriptionInfo()Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    .line 180
    const/4 v0, 0x2

    .line 186
    :cond_0
    :goto_0
    if-eqz v1, :cond_2

    .line 187
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    iget v3, v1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v2, v3, v0}, Lcom/android/internal/telephony/uicc/UiccController;->getIccRecords(II)Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v2

    .line 190
    :goto_1
    return-object v2

    .line 181
    :cond_1
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    instance-of v2, v2, Lcom/android/internal/telephony/msim/MSimGSMPhone;

    if-eqz v2, :cond_0

    .line 182
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    check-cast v2, Lcom/android/internal/telephony/msim/MSimGSMPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/MSimGSMPhone;->getSubscriptionInfo()Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    .line 183
    const/4 v0, 0x1

    goto :goto_0

    .line 190
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    const/4 v0, 0x1

    .line 112
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v1

    if-nez v1, :cond_0

    .line 113
    const-string v1, "Ignore GSM msgs since GSM phone is not the current DDS"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->loge(Ljava/lang/String;)V

    .line 125
    :goto_0
    return-void

    .line 116
    :cond_0
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 123
    invoke-super {p0, p1}, Lcom/android/internal/telephony/gsm/GsmDataConnectionTracker;->handleMessage(Landroid/os/Message;)V

    goto :goto_0

    .line 118
    :pswitch_0
    iget v1, p1, Landroid/os/Message;->arg1:I

    if-ne v1, v0, :cond_1

    .line 119
    .local v0, enabled:Z
    :goto_1
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/os/Message;

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->onSetInternalDataEnabled(ZLandroid/os/Message;)V

    goto :goto_0

    .line 118
    .end local v0           #enabled:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 116
    :pswitch_data_0
    .packed-switch 0x4201b
        :pswitch_0
    .end packed-switch
.end method

.method protected isActiveDataSubscription()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 283
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDataSubscription()I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method protected log(Ljava/lang/String;)V
    .locals 3
    .parameter "s"

    .prologue
    .line 369
    const-string v0, "GSM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[MSimGsmDCT:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    return-void
.end method

.method protected loge(Ljava/lang/String;)V
    .locals 3
    .parameter "s"

    .prologue
    .line 374
    const-string v0, "GSM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[MSimGsmDCT:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mSubscription:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    return-void
.end method

.method protected notifyAllDataDisconnected()V
    .locals 1

    .prologue
    .line 351
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 352
    return-void
.end method

.method protected notifyDataDisconnectComplete()V
    .locals 3

    .prologue
    .line 343
    const-string v2, "notifyDataDisconnectComplete"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 344
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Message;

    .line 345
    .local v1, m:Landroid/os/Message;
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 347
    .end local v1           #m:Landroid/os/Message;
    :cond_0
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 348
    return-void
.end method

.method protected onDataSetupComplete(Landroid/os/AsyncResult;)V
    .locals 1
    .parameter "ar"

    .prologue
    .line 248
    invoke-super {p0, p1}, Lcom/android/internal/telephony/gsm/GsmDataConnectionTracker;->onDataSetupComplete(Landroid/os/AsyncResult;)V

    .line 253
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mInternalDataEnabled:Z

    if-nez v0, :cond_0

    .line 254
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->cleanUpAllConnections(Ljava/lang/String;)V

    .line 256
    :cond_0
    return-void
.end method

.method protected onDisconnectDone(ILandroid/os/AsyncResult;)V
    .locals 1
    .parameter "connId"
    .parameter "ar"

    .prologue
    .line 155
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/gsm/GsmDataConnectionTracker;->onDisconnectDone(ILandroid/os/AsyncResult;)V

    .line 157
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->isDisconnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->notifyDataDisconnectComplete()V

    .line 159
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->notifyAllDataDisconnected()V

    .line 161
    :cond_0
    return-void
.end method

.method protected onSetInternalDataEnabled(Z)V
    .locals 1
    .parameter "enable"

    .prologue
    .line 220
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->onSetInternalDataEnabled(ZLandroid/os/Message;)V

    .line 221
    return-void
.end method

.method protected onSetInternalDataEnabled(ZLandroid/os/Message;)V
    .locals 3
    .parameter "enabled"
    .parameter "onCompleteMsg"

    .prologue
    .line 224
    const/4 v0, 0x1

    .line 226
    .local v0, sendOnComplete:Z
    iget-object v2, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mDataEnabledLock:Ljava/lang/Object;

    monitor-enter v2

    .line 227
    :try_start_0
    iput-boolean p1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mInternalDataEnabled:Z

    .line 228
    if-eqz p1, :cond_1

    .line 229
    const-string v1, "onSetInternalDataEnabled: changed to enabled, try to setup data call"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 230
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->resetAllRetryCounts()V

    .line 231
    const-string v1, "dataEnabled"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->onTrySetupData(Ljava/lang/String;)Z

    .line 237
    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 239
    if-eqz v0, :cond_0

    .line 240
    if-eqz p2, :cond_0

    .line 241
    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .line 244
    :cond_0
    return-void

    .line 233
    :cond_1
    const/4 v0, 0x0

    .line 234
    :try_start_1
    const-string v1, "onSetInternalDataEnabled: changed to disabled, cleanUpAllConnections"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 235
    const/4 v1, 0x0

    invoke-virtual {p0, v1, p2}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->cleanUpAllConnections(Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_0

    .line 237
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public registerForAllDataDisconnected(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 1
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 355
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/RegistrantList;->addUnique(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 357
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->isDisconnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 358
    const-string v0, "notify All Data Disconnected"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 359
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 361
    :cond_0
    return-void
.end method

.method protected registerForAllEvents()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 73
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const v1, 0x42001

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 74
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const v1, 0x42006

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForOffOrNotAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 75
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v0, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    const v1, 0x42004

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForDataNetworkStateChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 76
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v0

    const v1, 0x42008

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/CallTracker;->registerForVoiceCallEnded(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 77
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v0

    const v1, 0x42007

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/CallTracker;->registerForVoiceCallStarted(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 78
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x42010

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForDataConnectionAttached(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 80
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x42009

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForDataConnectionDetached(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 82
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x4200b

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForRoamingOn(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 83
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x4200c

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForRoamingOff(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 84
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x42016

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForPsRestrictedEnabled(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 86
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x42017

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForPsRestrictedDisabled(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 88
    return-void
.end method

.method public setInternalDataEnabled(Z)Z
    .locals 1
    .parameter "enable"

    .prologue
    .line 195
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->setInternalDataEnabled(ZLandroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public setInternalDataEnabled(ZLandroid/os/Message;)Z
    .locals 4
    .parameter "enable"
    .parameter "onCompleteMsg"

    .prologue
    const/4 v2, 0x1

    .line 200
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setInternalDataEnabled("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ")"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 202
    const v1, 0x4201b

    invoke-virtual {p0, v1, p2}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 203
    .local v0, msg:Landroid/os/Message;
    if-eqz p1, :cond_0

    move v1, v2

    :goto_0
    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 204
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->sendMessage(Landroid/os/Message;)Z

    .line 205
    return v2

    .line 203
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setInternalDataEnabledFlag(Z)Z
    .locals 2
    .parameter "enable"

    .prologue
    .line 210
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setInternalDataEnabledFlag("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 212
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mInternalDataEnabled:Z

    if-eq v0, p1, :cond_0

    .line 213
    iput-boolean p1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mInternalDataEnabled:Z

    .line 215
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public unregisterForAllDataDisconnected(Landroid/os/Handler;)V
    .locals 1
    .parameter "h"

    .prologue
    .line 364
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 365
    return-void
.end method

.method protected unregisterForAllEvents()V
    .locals 3

    .prologue
    .line 92
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v1, v1, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v1, p0}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForAvailable(Landroid/os/Handler;)V

    .line 93
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v1, v1, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v1, p0}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForOffOrNotAvailable(Landroid/os/Handler;)V

    .line 94
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/uicc/IccRecords;

    .line 95
    .local v0, r:Lcom/android/internal/telephony/uicc/IccRecords;
    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {v0, p0}, Lcom/android/internal/telephony/uicc/IccRecords;->unregisterForRecordsLoaded(Landroid/os/Handler;)V

    .line 97
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 99
    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v1, v1, Lcom/android/internal/telephony/PhoneBase;->mCM:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v1, p0}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForDataNetworkStateChanged(Landroid/os/Handler;)V

    .line 100
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/CallTracker;->unregisterForVoiceCallEnded(Landroid/os/Handler;)V

    .line 101
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/CallTracker;->unregisterForVoiceCallStarted(Landroid/os/Handler;)V

    .line 102
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForDataConnectionAttached(Landroid/os/Handler;)V

    .line 103
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForDataConnectionDetached(Landroid/os/Handler;)V

    .line 104
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForRoamingOn(Landroid/os/Handler;)V

    .line 105
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForRoamingOff(Landroid/os/Handler;)V

    .line 106
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForPsRestrictedEnabled(Landroid/os/Handler;)V

    .line 107
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForPsRestrictedDisabled(Landroid/os/Handler;)V

    .line 108
    return-void
.end method

.method protected update()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 290
    const-string v1, "update"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 291
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 292
    const-string v1, "update(): Active DDS, register for all events now!"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    .line 293
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->registerForAllEvents()V

    .line 294
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->onUpdateIcc()V

    .line 296
    iget-object v1, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "mobile_data"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mUserDataEnabled:Z

    .line 299
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    instance-of v0, v0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    if-eqz v0, :cond_1

    .line 300
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    check-cast v0, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/MSimCDMALTEPhone;->updateCurrentCarrierInProvider()Z

    .line 307
    :goto_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->broadcastMessenger()V

    .line 312
    :goto_2
    return-void

    .line 296
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 301
    :cond_1
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    instance-of v0, v0, Lcom/android/internal/telephony/msim/MSimGSMPhone;

    if-eqz v0, :cond_2

    .line 302
    iget-object v0, p0, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    check-cast v0, Lcom/android/internal/telephony/msim/MSimGSMPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/MSimGSMPhone;->updateCurrentCarrierInProvider()Z

    goto :goto_1

    .line 304
    :cond_2
    const-string v0, "Phone object is not MultiSim. This should not hit!!!!"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 309
    :cond_3
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->unregisterForAllEvents()V

    .line 310
    const-string v0, "update(): NOT the active DDS, unregister for all events!"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->log(Ljava/lang/String;)V

    goto :goto_2
.end method

.method public updateRecords()V
    .locals 1

    .prologue
    .line 265
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->isActiveDataSubscription()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 266
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/MSimGsmDataConnectionTracker;->onUpdateIcc()V

    .line 268
    :cond_0
    return-void
.end method
