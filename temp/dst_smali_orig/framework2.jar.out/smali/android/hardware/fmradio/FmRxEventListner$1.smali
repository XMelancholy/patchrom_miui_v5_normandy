.class Landroid/hardware/fmradio/FmRxEventListner$1;
.super Ljava/lang/Thread;
.source "FmRxEventListner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/hardware/fmradio/FmRxEventListner;->startListner(ILandroid/hardware/fmradio/FmRxEvCallbacks;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/hardware/fmradio/FmRxEventListner;

.field final synthetic val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

.field final synthetic val$fd:I


# direct methods
.method constructor <init>(Landroid/hardware/fmradio/FmRxEventListner;ILandroid/hardware/fmradio/FmRxEvCallbacks;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    iput-object p1, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->this$0:Landroid/hardware/fmradio/FmRxEventListner;

    iput p2, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$fd:I

    iput-object p3, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x6

    const/16 v6, 0x80

    new-array v0, v6, [B

    .local v0, buff:[B
    const-string v6, "FMRadio"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Starting listener "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$fd:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v6

    if-nez v6, :cond_6

    const/4 v4, 0x0

    .local v4, index:I
    const/4 v5, 0x0

    .local v5, state:I
    const/4 v6, 0x0

    :try_start_0
    invoke-static {v0, v6}, Ljava/util/Arrays;->fill([BB)V

    const/4 v3, 0x0

    .local v3, freq:I
    iget v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$fd:I

    const/4 v7, 0x1

    invoke-static {v6, v0, v7}, Landroid/hardware/fmradio/FmReceiverJNI;->getBufferNative(I[BI)I

    move-result v1

    .local v1, eventCount:I
    if-ltz v1, :cond_1

    const-string v6, "FMRadio"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Received event. Count: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    const/4 v4, 0x0

    :goto_1
    if-ge v4, v1, :cond_0

    const-string v6, "FMRadio"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Received <"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-byte v8, v0, v4

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ">"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    aget-byte v6, v0, v4

    packed-switch v6, :pswitch_data_0

    :pswitch_0
    const-string v6, "FMRadio"

    const-string v7, "Unknown event"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :pswitch_1
    const-string v6, "FMRadio"

    const-string v7, "Got READY_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Landroid/hardware/fmradio/FmTransceiver;->getFMPowerState()I

    move-result v6

    const/4 v7, 0x4

    if-ne v6, v7, :cond_3

    const/4 v6, 0x1

    invoke-static {v6}, Landroid/hardware/fmradio/FmTransceiver;->setFMPowerState(I)V

    const-string v6, "FMRadio"

    const-string v7, "RxEvtList: CURRENT-STATE : FMRxStarting ---> NEW-STATE : FMRxOn"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvEnableReceiver()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .end local v1           #eventCount:I
    .end local v3           #freq:I
    :catch_0
    move-exception v2

    .local v2, ex:Ljava/lang/Exception;
    const-string v6, "FMRadio"

    const-string v7, "RunningThread InterruptedException"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->interrupt()V

    goto/16 :goto_0

    .end local v2           #ex:Ljava/lang/Exception;
    .restart local v1       #eventCount:I
    .restart local v3       #freq:I
    :cond_3
    :try_start_1
    invoke-static {}, Landroid/hardware/fmradio/FmTransceiver;->getFMPowerState()I

    move-result v6

    if-ne v6, v9, :cond_2

    const/4 v6, 0x0

    invoke-static {v6}, Landroid/hardware/fmradio/FmTransceiver;->setFMPowerState(I)V

    const-string v6, "FMRadio"

    const-string v7, "RxEvtList: CURRENT-STATE : FMTurningOff ---> NEW-STATE : FMOff"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const-string v6, "/dev/radio0"

    invoke-static {v6}, Landroid/hardware/fmradio/FmTransceiver;->release(Ljava/lang/String;)Z

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvDisableReceiver()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->interrupt()V

    goto :goto_2

    :pswitch_2
    const-string v6, "FMRadio"

    const-string v7, "Got TUNE_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$fd:I

    invoke-static {v6}, Landroid/hardware/fmradio/FmReceiverJNI;->getFreqNative(I)I

    move-result v3

    if-lez v3, :cond_4

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6, v3}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRadioTuneStatus(I)V

    goto :goto_2

    :cond_4
    const-string v6, "FMRadio"

    const-string v7, "get frequency command failed"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :pswitch_3
    const-string v6, "FMRadio"

    const-string v7, "Got SEEK_COMPLETE_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Landroid/hardware/fmradio/FmReceiver;->getSearchState()I

    move-result v5

    packed-switch v5, :pswitch_data_1

    :pswitch_4
    goto/16 :goto_2

    :pswitch_5
    const-string v6, "FMRadio"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Current state is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v6, 0x3

    invoke-static {v6}, Landroid/hardware/fmradio/FmReceiver;->setSearchState(I)V

    const-string v6, "FMRadio"

    const-string v7, "RxEvtList: CURRENT-STATE : Search ---> NEW-STATE : FMRxOn"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    iget v7, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$fd:I

    invoke-static {v7}, Landroid/hardware/fmradio/FmReceiverJNI;->getFreqNative(I)I

    move-result v7

    invoke-interface {v6, v7}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvSearchComplete(I)V

    goto/16 :goto_2

    :pswitch_6
    const-string v6, "FMRadio"

    const-string v7, "Current state is SRCH_ABORTED"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const-string v6, "FMRadio"

    const-string v7, "Aborting on-going search command..."

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v6, 0x3

    invoke-static {v6}, Landroid/hardware/fmradio/FmReceiver;->setSearchState(I)V

    const-string v6, "FMRadio"

    const-string v7, "RxEvtList: CURRENT-STATE : Search ---> NEW-STATE : FMRxOn"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvSearchCancelled()V

    goto/16 :goto_2

    :pswitch_7
    const-string v6, "FMRadio"

    const-string v7, "Got SCAN_NEXT_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvSearchInProgress()V

    goto/16 :goto_2

    :pswitch_8
    const-string v6, "FMRadio"

    const-string v7, "Got RAW_RDS_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsGroupData()V

    goto/16 :goto_2

    :pswitch_9
    const-string v6, "FMRadio"

    const-string v7, "Got RT_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsRtInfo()V

    goto/16 :goto_2

    :pswitch_a
    const-string v6, "FMRadio"

    const-string v7, "Got PS_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsPsInfo()V

    goto/16 :goto_2

    :pswitch_b
    const-string v6, "FMRadio"

    const-string v7, "Got ERROR_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :pswitch_c
    const-string v6, "FMRadio"

    const-string v7, "Got BELOW_TH_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvServiceAvailable(Z)V

    goto/16 :goto_2

    :pswitch_d
    const-string v6, "FMRadio"

    const-string v7, "Got ABOVE_TH_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v7, 0x1

    invoke-interface {v6, v7}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvServiceAvailable(Z)V

    goto/16 :goto_2

    :pswitch_e
    const-string v6, "FMRadio"

    const-string v7, "Got STEREO_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v7, 0x1

    invoke-interface {v6, v7}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvStereoStatus(Z)V

    goto/16 :goto_2

    :pswitch_f
    const-string v6, "FMRadio"

    const-string v7, "Got MONO_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvStereoStatus(Z)V

    goto/16 :goto_2

    :pswitch_10
    const-string v6, "FMRadio"

    const-string v7, "Got RDS_AVAL_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v7, 0x1

    invoke-interface {v6, v7}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsLockStatus(Z)V

    goto/16 :goto_2

    :pswitch_11
    const-string v6, "FMRadio"

    const-string v7, "Got RDS_NOT_AVAL_EVENT"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsLockStatus(Z)V

    goto/16 :goto_2

    :pswitch_12
    const-string v6, "FMRadio"

    const-string v7, "Got NEW_SRCH_LIST"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Landroid/hardware/fmradio/FmReceiver;->getSearchState()I

    move-result v5

    packed-switch v5, :pswitch_data_2

    :pswitch_13
    goto/16 :goto_2

    :pswitch_14
    const-string v6, "FMRadio"

    const-string v7, "FmRxEventListener: Current state is AUTO_PRESET_INPROGRESS"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v6, 0x3

    invoke-static {v6}, Landroid/hardware/fmradio/FmReceiver;->setSearchState(I)V

    const-string v6, "FMRadio"

    const-string v7, "RxEvtList: CURRENT-STATE : Search ---> NEW-STATE : FMRxOn"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvSearchListComplete()V

    goto/16 :goto_2

    :pswitch_15
    const-string v6, "FMRadio"

    const-string v7, "Current state is SRCH_ABORTED"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const-string v6, "FMRadio"

    const-string v7, "Aborting on-going SearchList command..."

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v6, 0x3

    invoke-static {v6}, Landroid/hardware/fmradio/FmReceiver;->setSearchState(I)V

    const-string v6, "FMRadio"

    const-string v7, "RxEvtList: CURRENT-STATE : Search ---> NEW-STATE : FMRxOn"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvSearchCancelled()V

    goto/16 :goto_2

    :pswitch_16
    const-string v6, "FMRadio"

    const-string v7, "Got NEW_AF_LIST"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRdsAfInfo()V

    goto/16 :goto_2

    :pswitch_17
    const-string v6, "FMRadio"

    const-string v7, "Got RADIO_DISABLED"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Landroid/hardware/fmradio/FmTransceiver;->getFMPowerState()I

    move-result v6

    if-ne v6, v9, :cond_5

    const/4 v6, 0x0

    invoke-static {v6}, Landroid/hardware/fmradio/FmTransceiver;->setFMPowerState(I)V

    const-string v6, "FMRadio"

    const-string v7, "RxEvtList: CURRENT-STATE : FMTurningOff ---> NEW-STATE : FMOff"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const-string v6, "/dev/radio0"

    invoke-static {v6}, Landroid/hardware/fmradio/FmTransceiver;->release(Ljava/lang/String;)Z

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvDisableReceiver()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->interrupt()V

    goto/16 :goto_2

    :cond_5
    const-string v6, "FMRadio"

    const-string v7, "Unexpected RADIO_DISABLED recvd"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Landroid/hardware/fmradio/FmRxEventListner$1;->val$cb:Landroid/hardware/fmradio/FmRxEvCallbacks;

    invoke-interface {v6}, Landroid/hardware/fmradio/FmRxEvCallbacks;->FmRxEvRadioReset()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .end local v1           #eventCount:I
    .end local v3           #freq:I
    .end local v4           #index:I
    .end local v5           #state:I
    :cond_6
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_16
        :pswitch_0
        :pswitch_0
        :pswitch_17
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_6
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x2
        :pswitch_14
        :pswitch_13
        :pswitch_15
    .end packed-switch
.end method
