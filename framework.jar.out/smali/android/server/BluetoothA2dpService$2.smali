.class Landroid/server/BluetoothA2dpService$2;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothA2dpService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/server/BluetoothA2dpService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/server/BluetoothA2dpService;


# direct methods
.method constructor <init>(Landroid/server/BluetoothA2dpService;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 39
    .parameter "context"
    .parameter "intent"

    .prologue
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    .local v8, action:Ljava/lang/String;
    const-string v2, "android.bluetooth.device.extra.DEVICE"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v13

    check-cast v13, Landroid/bluetooth/BluetoothDevice;

    .local v13, device:Landroid/bluetooth/BluetoothDevice;
    const-string v2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "android.bluetooth.adapter.extra.STATE"

    const/high16 v3, -0x8000

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v29

    .local v29, state:I
    packed-switch v29, :pswitch_data_0

    .end local v29           #state:I
    :cond_0
    :goto_0
    return-void

    .restart local v29       #state:I
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #calls: Landroid/server/BluetoothA2dpService;->onBluetoothEnable()V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$1300(Landroid/server/BluetoothA2dpService;)V

    goto :goto_0

    :pswitch_1
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #calls: Landroid/server/BluetoothA2dpService;->onBluetoothDisable()V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$1400(Landroid/server/BluetoothA2dpService;)V

    goto :goto_0

    .end local v29           #state:I
    :cond_1
    const-string v2, "android.bluetooth.device.action.ACL_DISCONNECTED"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    monitor-enter p0

    if-nez v13, :cond_2

    :try_start_0
    const-string v2, "BluetoothA2dpService"

    const-string v3, "Error! device is null"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    :cond_2
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mAudioDevices:Ljava/util/HashMap;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$1500(Landroid/server/BluetoothA2dpService;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mAudioDevices:Ljava/util/HashMap;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$1500(Landroid/server/BluetoothA2dpService;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v29

    .restart local v29       #state:I
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const/4 v3, 0x0

    move/from16 v0, v29

    #calls: Landroid/server/BluetoothA2dpService;->handleSinkStateChange(Landroid/bluetooth/BluetoothDevice;II)V
    invoke-static {v2, v13, v0, v3}, Landroid/server/BluetoothA2dpService;->access$1600(Landroid/server/BluetoothA2dpService;Landroid/bluetooth/BluetoothDevice;II)V

    .end local v29           #state:I
    :cond_3
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_4
    const-string v2, "android.media.VOLUME_CHANGED_ACTION"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "android.media.EXTRA_VOLUME_STREAM_TYPE"

    const/4 v3, -0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v30

    .local v30, streamType:I
    const/4 v2, 0x3

    move/from16 v0, v30

    if-ne v0, v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-virtual {v2}, Landroid/server/BluetoothA2dpService;->getConnectedDevices()Ljava/util/List;

    move-result-object v28

    .local v28, sinks:Ljava/util/List;,"Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface/range {v28 .. v28}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_0

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const/4 v2, 0x0

    move-object/from16 v0, v28

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    #calls: Landroid/server/BluetoothA2dpService;->isPhoneDocked(Landroid/bluetooth/BluetoothDevice;)Z
    invoke-static {v3, v2}, Landroid/server/BluetoothA2dpService;->access$1700(Landroid/server/BluetoothA2dpService;Landroid/bluetooth/BluetoothDevice;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    move-object/from16 v0, v28

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v9

    .local v9, address:Ljava/lang/String;
    const-string v2, "android.media.EXTRA_VOLUME_STREAM_VALUE"

    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v24

    .local v24, newVolLevel:I
    const-string v2, "android.media.EXTRA_PREV_VOLUME_STREAM_VALUE"

    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v25

    .local v25, oldVolLevel:I
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mBluetoothService:Landroid/server/BluetoothService;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$1800(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothService;

    move-result-object v2

    invoke-virtual {v2, v9}, Landroid/server/BluetoothService;->getObjectPathFromAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .local v26, path:Ljava/lang/String;
    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_5

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v26

    #calls: Landroid/server/BluetoothA2dpService;->avrcpVolumeUpNative(Ljava/lang/String;)Z
    invoke-static {v2, v0}, Landroid/server/BluetoothA2dpService;->access$1900(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Z

    goto/16 :goto_0

    :cond_5
    move/from16 v0, v24

    move/from16 v1, v25

    if-ge v0, v1, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v26

    #calls: Landroid/server/BluetoothA2dpService;->avrcpVolumeDownNative(Ljava/lang/String;)Z
    invoke-static {v2, v0}, Landroid/server/BluetoothA2dpService;->access$2000(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Z

    goto/16 :goto_0

    .end local v9           #address:Ljava/lang/String;
    .end local v24           #newVolLevel:I
    .end local v25           #oldVolLevel:I
    .end local v26           #path:Ljava/lang/String;
    .end local v28           #sinks:Ljava/util/List;,"Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    .end local v30           #streamType:I
    :cond_6
    const-string v2, "com.android.music.metachanged"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "track"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2102(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "artist"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mArtistName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2202(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "album"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mAlbumName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2302(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$2100(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_7

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "Unknown"

    #setter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2102(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mArtistName:Ljava/lang/String;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$2200(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_8

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "Unknown"

    #setter for: Landroid/server/BluetoothA2dpService;->mArtistName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2202(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    :cond_8
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mAlbumName:Ljava/lang/String;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$2300(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_9

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "Unknown"

    #setter for: Landroid/server/BluetoothA2dpService;->mAlbumName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2302(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    :cond_9
    const-string v2, "id"

    const-wide/16 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v15

    .local v15, extra:J
    const-wide/16 v2, 0x0

    cmp-long v2, v15, v2

    if-gez v2, :cond_a

    const-wide/16 v15, 0x0

    :cond_a
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mMediaNumber:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2402(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "ListSize"

    const-wide/16 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v15

    const-wide/16 v2, 0x0

    cmp-long v2, v15, v2

    if-gez v2, :cond_b

    const-wide/16 v15, 0x0

    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mMediaCount:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2502(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "duration"

    const-wide/16 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v15

    const-wide/16 v2, 0x0

    cmp-long v2, v15, v2

    if-gez v2, :cond_c

    const-wide/16 v15, 0x0

    :cond_c
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mDuration:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2602(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "position"

    const-wide/16 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v15

    const-wide/16 v2, 0x0

    cmp-long v2, v15, v2

    if-gez v2, :cond_d

    const-wide/16 v15, 0x0

    :cond_d
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-wide v0, v15

    #setter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v2, v0, v1}, Landroid/server/BluetoothA2dpService;->access$2702(Landroid/server/BluetoothA2dpService;J)J

    const-string v2, "BluetoothA2dpService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Meta data info is trackname: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$2100(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " artist: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mArtistName:Ljava/lang/String;
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$2200(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "BluetoothA2dpService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mMediaNumber: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mMediaNumber:Ljava/lang/String;
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$2400(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " mediaCount "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mMediaCount:Ljava/lang/String;
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$2500(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "BluetoothA2dpService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mPostion "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$2700(Landroid/server/BluetoothA2dpService;)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " album: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mAlbumName:Ljava/lang/String;
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$2300(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "duration "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mDuration:Ljava/lang/String;
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$2600(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-virtual {v2}, Landroid/server/BluetoothA2dpService;->getConnectedSinksPaths()[Ljava/lang/String;

    move-result-object v10

    .local v10, arr$:[Ljava/lang/String;
    array-length v0, v10

    move/from16 v19, v0

    .local v19, len$:I
    const/16 v18, 0x0

    .local v18, i$:I
    :goto_1
    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_0

    aget-object v26, v10, v18

    .restart local v26       #path:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v26

    #calls: Landroid/server/BluetoothA2dpService;->sendMetaData(Ljava/lang/String;)V
    invoke-static {v2, v0}, Landroid/server/BluetoothA2dpService;->access$2800(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const/4 v3, 0x2

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mMediaNumber:Ljava/lang/String;
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$2400(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    move-object/from16 v0, v26

    #calls: Landroid/server/BluetoothA2dpService;->sendEvent(Ljava/lang/String;IJ)V
    invoke-static {v2, v0, v3, v4, v5}, Landroid/server/BluetoothA2dpService;->access$2900(Landroid/server/BluetoothA2dpService;Ljava/lang/String;IJ)V

    add-int/lit8 v18, v18, 0x1

    goto :goto_1

    .end local v10           #arr$:[Ljava/lang/String;
    .end local v15           #extra:J
    .end local v18           #i$:I
    .end local v19           #len$:I
    .end local v26           #path:Ljava/lang/String;
    :cond_e
    const-string v2, "com.android.music.playstatechanged"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    const-string v2, "track"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .local v11, currentTrackName:Ljava/lang/String;
    if-eqz v11, :cond_16

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$2100(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_16

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #setter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v2, v11}, Landroid/server/BluetoothA2dpService;->access$2102(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "artist"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mArtistName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2202(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "album"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mAlbumName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2302(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$2100(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_f

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "Unknown"

    #setter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2102(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    :cond_f
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mArtistName:Ljava/lang/String;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$2200(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_10

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "Unknown"

    #setter for: Landroid/server/BluetoothA2dpService;->mArtistName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2202(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    :cond_10
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mAlbumName:Ljava/lang/String;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$2300(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_11

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "Unknown"

    #setter for: Landroid/server/BluetoothA2dpService;->mAlbumName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2302(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    :cond_11
    const-string v2, "id"

    const-wide/16 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v15

    .restart local v15       #extra:J
    const-wide/16 v2, 0x0

    cmp-long v2, v15, v2

    if-gez v2, :cond_12

    const-wide/16 v15, 0x0

    :cond_12
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mMediaNumber:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2402(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "ListSize"

    const-wide/16 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v15

    const-wide/16 v2, 0x0

    cmp-long v2, v15, v2

    if-gez v2, :cond_13

    const-wide/16 v15, 0x0

    :cond_13
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mMediaCount:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2502(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "duration"

    const-wide/16 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v15

    const-wide/16 v2, 0x0

    cmp-long v2, v15, v2

    if-gez v2, :cond_14

    const-wide/16 v15, 0x0

    :cond_14
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mDuration:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2602(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "position"

    const-wide/16 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v15

    const-wide/16 v2, 0x0

    cmp-long v2, v15, v2

    if-gez v2, :cond_15

    const-wide/16 v15, 0x0

    :cond_15
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-wide v0, v15

    #setter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v2, v0, v1}, Landroid/server/BluetoothA2dpService;->access$2702(Landroid/server/BluetoothA2dpService;J)J

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-virtual {v2}, Landroid/server/BluetoothA2dpService;->getConnectedSinksPaths()[Ljava/lang/String;

    move-result-object v10

    .restart local v10       #arr$:[Ljava/lang/String;
    array-length v0, v10

    move/from16 v19, v0

    .restart local v19       #len$:I
    const/16 v18, 0x0

    .restart local v18       #i$:I
    :goto_2
    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_16

    aget-object v26, v10, v18

    .restart local v26       #path:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v26

    #calls: Landroid/server/BluetoothA2dpService;->sendMetaData(Ljava/lang/String;)V
    invoke-static {v2, v0}, Landroid/server/BluetoothA2dpService;->access$2800(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)V

    add-int/lit8 v18, v18, 0x1

    goto :goto_2

    .end local v10           #arr$:[Ljava/lang/String;
    .end local v15           #extra:J
    .end local v18           #i$:I
    .end local v19           #len$:I
    .end local v26           #path:Ljava/lang/String;
    :cond_16
    const-string v2, "playing"

    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v27

    .local v27, playStatus:Z
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "position"

    const-wide/16 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    #setter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v2, v3, v4}, Landroid/server/BluetoothA2dpService;->access$2702(Landroid/server/BluetoothA2dpService;J)J

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$2700(Landroid/server/BluetoothA2dpService;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_17

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-wide/16 v3, 0x0

    #setter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v2, v3, v4}, Landroid/server/BluetoothA2dpService;->access$2702(Landroid/server/BluetoothA2dpService;J)J

    :cond_17
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$2700(Landroid/server/BluetoothA2dpService;)J

    move-result-wide v4

    move/from16 v0, v27

    #calls: Landroid/server/BluetoothA2dpService;->convertedPlayStatus(ZJ)I
    invoke-static {v3, v0, v4, v5}, Landroid/server/BluetoothA2dpService;->access$3100(Landroid/server/BluetoothA2dpService;ZJ)I

    move-result v3

    #setter for: Landroid/server/BluetoothA2dpService;->mPlayStatus:I
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$3002(Landroid/server/BluetoothA2dpService;I)I

    const-string v2, "BluetoothA2dpService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "PlayState changed "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayStatus:I
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$3000(Landroid/server/BluetoothA2dpService;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-virtual {v2}, Landroid/server/BluetoothA2dpService;->getConnectedSinksPaths()[Ljava/lang/String;

    move-result-object v10

    .restart local v10       #arr$:[Ljava/lang/String;
    array-length v0, v10

    move/from16 v19, v0

    .restart local v19       #len$:I
    const/16 v18, 0x0

    .restart local v18       #i$:I
    :goto_3
    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_0

    aget-object v26, v10, v18

    .restart local v26       #path:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayStatus:I
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$3000(Landroid/server/BluetoothA2dpService;)I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v0, v26

    #calls: Landroid/server/BluetoothA2dpService;->sendEvent(Ljava/lang/String;IJ)V
    invoke-static {v2, v0, v3, v4, v5}, Landroid/server/BluetoothA2dpService;->access$2900(Landroid/server/BluetoothA2dpService;Ljava/lang/String;IJ)V

    add-int/lit8 v18, v18, 0x1

    goto :goto_3

    .end local v10           #arr$:[Ljava/lang/String;
    .end local v11           #currentTrackName:Ljava/lang/String;
    .end local v18           #i$:I
    .end local v19           #len$:I
    .end local v26           #path:Ljava/lang/String;
    .end local v27           #playStatus:Z
    :cond_18
    const-string v2, "com.android.music.playstatusresponse"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    const-string v2, "BluetoothA2dpService"

    const-string v3, "Received PLAYSTATUS_RESPONSE"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "duration"

    const-wide/16 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v15

    .restart local v15       #extra:J
    const-wide/16 v2, 0x0

    cmp-long v2, v15, v2

    if-gez v2, :cond_19

    const-wide/16 v15, 0x0

    :cond_19
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-static/range {v15 .. v16}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mDuration:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2602(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "position"

    const-wide/16 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    #setter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v2, v3, v4}, Landroid/server/BluetoothA2dpService;->access$2702(Landroid/server/BluetoothA2dpService;J)J

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$2700(Landroid/server/BluetoothA2dpService;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_1a

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-wide/16 v3, 0x0

    #setter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v2, v3, v4}, Landroid/server/BluetoothA2dpService;->access$2702(Landroid/server/BluetoothA2dpService;J)J

    :cond_1a
    const-string v2, "playing"

    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v27

    .restart local v27       #playStatus:Z
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$2700(Landroid/server/BluetoothA2dpService;)J

    move-result-wide v4

    move/from16 v0, v27

    #calls: Landroid/server/BluetoothA2dpService;->convertedPlayStatus(ZJ)I
    invoke-static {v3, v0, v4, v5}, Landroid/server/BluetoothA2dpService;->access$3100(Landroid/server/BluetoothA2dpService;ZJ)I

    move-result v3

    #setter for: Landroid/server/BluetoothA2dpService;->mPlayStatus:I
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$3002(Landroid/server/BluetoothA2dpService;I)I

    const-string v2, "BluetoothA2dpService"

    const-string v3, "Sending Playstatus"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayStatusRequestPath:Ljava/lang/String;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$200(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v3

    #calls: Landroid/server/BluetoothA2dpService;->sendPlayStatus(Ljava/lang/String;)V
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$300(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)V

    goto/16 :goto_0

    .end local v15           #extra:J
    .end local v27           #playStatus:Z
    :cond_1b
    const-string v2, "android.media.MediaPlayer.action.METADATA_CHANGED"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_23

    const-string v2, "uripath"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v34

    check-cast v34, Landroid/net/Uri;

    .local v34, uri:Landroid/net/Uri;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "uri is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v34

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "mUri is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mUri:Landroid/net/Uri;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$3200(Landroid/server/BluetoothA2dpService;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    if-eqz v34, :cond_0

    invoke-virtual/range {v34 .. v34}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v35

    .local v35, uriPath:Ljava/lang/String;
    const-string v2, "//"

    move-object/from16 v0, v35

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v37

    .local v37, value:[Ljava/lang/String;
    if-eqz v37, :cond_1e

    move-object/from16 v0, v37

    array-length v2, v0

    const/4 v3, 0x1

    if-le v2, v3, :cond_1e

    const/4 v2, 0x1

    aget-object v2, v37, v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v38

    .local v38, value1:[Ljava/lang/String;
    if-eqz v38, :cond_1e

    move-object/from16 v0, v38

    array-length v2, v0

    const/4 v3, 0x1

    if-le v2, v3, :cond_1e

    const/4 v2, 0x0

    aget-object v2, v38, v2

    const-string v3, "media"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    const/4 v2, 0x1

    aget-object v2, v38, v2

    const-string v3, "external"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    :cond_1c
    const/4 v2, 0x0

    aget-object v2, v38, v2

    const-string v3, "settings"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    :cond_1d
    const-string v2, "Internal audio file data, ignoring"

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    goto/16 :goto_0

    .end local v38           #value1:[Ljava/lang/String;
    :cond_1e
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mMediaNumber:Ljava/lang/String;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$2400(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v32

    .local v32, tempMediaNumber:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "time"

    const-wide/16 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mReportTime:Ljava/lang/Long;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$3402(Landroid/server/BluetoothA2dpService;Ljava/lang/Long;)Ljava/lang/Long;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "duration"

    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mDuration:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2602(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "position"

    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    int-to-long v3, v3

    #setter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v2, v3, v4}, Landroid/server/BluetoothA2dpService;->access$2702(Landroid/server/BluetoothA2dpService;J)J

    const-string v2, "playstate"

    const/4 v3, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v27

    .local v27, playStatus:I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PlaySatus is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, v27

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayStatus:I
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3000(Landroid/server/BluetoothA2dpService;)I

    move-result v2

    move/from16 v0, v27

    if-eq v0, v2, :cond_1f

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move/from16 v0, v27

    #setter for: Landroid/server/BluetoothA2dpService;->mPlayStatus:I
    invoke-static {v2, v0}, Landroid/server/BluetoothA2dpService;->access$3002(Landroid/server/BluetoothA2dpService;I)I

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-virtual {v2}, Landroid/server/BluetoothA2dpService;->getConnectedSinksPaths()[Ljava/lang/String;

    move-result-object v10

    .restart local v10       #arr$:[Ljava/lang/String;
    array-length v0, v10

    move/from16 v19, v0

    .restart local v19       #len$:I
    const/16 v18, 0x0

    .restart local v18       #i$:I
    :goto_4
    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_1f

    aget-object v26, v10, v18

    .restart local v26       #path:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const/4 v3, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayStatus:I
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$3000(Landroid/server/BluetoothA2dpService;)I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v0, v26

    #calls: Landroid/server/BluetoothA2dpService;->sendEvent(Ljava/lang/String;IJ)V
    invoke-static {v2, v0, v3, v4, v5}, Landroid/server/BluetoothA2dpService;->access$2900(Landroid/server/BluetoothA2dpService;Ljava/lang/String;IJ)V

    add-int/lit8 v18, v18, 0x1

    goto :goto_4

    .end local v10           #arr$:[Ljava/lang/String;
    .end local v18           #i$:I
    .end local v19           #len$:I
    .end local v26           #path:Ljava/lang/String;
    :cond_1f
    const-string v2, "Metadata received"

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Duration "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mDuration:Ljava/lang/String;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$2600(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "position "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPosition:J
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$2700(Landroid/server/BluetoothA2dpService;)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "playstate is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayStatus:I
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$3000(Landroid/server/BluetoothA2dpService;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mUri:Landroid/net/Uri;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3200(Landroid/server/BluetoothA2dpService;)Landroid/net/Uri;

    move-result-object v2

    move-object/from16 v0, v34

    invoke-virtual {v0, v2}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    const-string v2, "Update for same Uri, ignoring"

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_20
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v34

    #setter for: Landroid/server/BluetoothA2dpService;->mUri:Landroid/net/Uri;
    invoke-static {v2, v0}, Landroid/server/BluetoothA2dpService;->access$3202(Landroid/server/BluetoothA2dpService;Landroid/net/Uri;)Landroid/net/Uri;

    const/16 v20, 0x0

    .local v20, mCursor:Landroid/database/Cursor;
    :try_start_2
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mContext:Landroid/content/Context;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3600(Landroid/server/BluetoothA2dpService;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mUri:Landroid/net/Uri;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$3200(Landroid/server/BluetoothA2dpService;)Landroid/net/Uri;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mCursorCols:[Ljava/lang/String;
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$3500(Landroid/server/BluetoothA2dpService;)[Ljava/lang/String;

    move-result-object v4

    const-string v5, "is_music=1"

    const/4 v6, 0x0

    const-string v7, "title_key"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->moveToFirst()Z

    const-string v2, "title"

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v31

    .local v31, temp:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v31

    #calls: Landroid/server/BluetoothA2dpService;->getValidUtf8String(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v0}, Landroid/server/BluetoothA2dpService;->access$3700(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2102(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "artist"

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v31

    #calls: Landroid/server/BluetoothA2dpService;->getValidUtf8String(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v0}, Landroid/server/BluetoothA2dpService;->access$3700(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mArtistName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2202(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "album"

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v31

    #calls: Landroid/server/BluetoothA2dpService;->getValidUtf8String(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v0}, Landroid/server/BluetoothA2dpService;->access$3700(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mAlbumName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2302(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    const-string v2, "_id"

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    move-object/from16 v0, v20

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v21

    .local v21, mediaNumber:J
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mMediaNumber:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2402(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Title is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$2100(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Artist is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mArtistName:Ljava/lang/String;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$2200(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Album is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mAlbumName:Ljava/lang/String;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$2300(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ID is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mMediaNumber:Ljava/lang/String;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$2400(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->close()V

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$2100(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v3

    #calls: Landroid/server/BluetoothA2dpService;->getTrackId(Ljava/lang/String;)J
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$3800(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v33

    .local v33, tmpId:Ljava/lang/Long;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "tmpId is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v33

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-static/range {v33 .. v33}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mMediaNumber:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2402(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ID is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mMediaNumber:Ljava/lang/String;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$2400(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mMediaNumber:Ljava/lang/String;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$2400(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v32

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_21

    new-instance v23, Landroid/media/MediaMetadataRetriever;

    invoke-direct/range {v23 .. v23}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .local v23, mmr:Landroid/media/MediaMetadataRetriever;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mContext:Landroid/content/Context;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3600(Landroid/server/BluetoothA2dpService;)Landroid/content/Context;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mUri:Landroid/net/Uri;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$3200(Landroid/server/BluetoothA2dpService;)Landroid/net/Uri;

    move-result-object v3

    move-object/from16 v0, v23

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaMetadataRetriever;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    const/4 v2, 0x6

    move-object/from16 v0, v23

    invoke-virtual {v0, v2}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v31

    #calls: Landroid/server/BluetoothA2dpService;->getValidUtf8String(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v3, v0}, Landroid/server/BluetoothA2dpService;->access$3700(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mGenre:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$3902(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Genre is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mGenre:Ljava/lang/String;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$3900(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    .end local v23           #mmr:Landroid/media/MediaMetadataRetriever;
    :cond_21
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mContext:Landroid/content/Context;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3600(Landroid/server/BluetoothA2dpService;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "_id"

    aput-object v6, v4, v5

    const-string v5, "is_music=1"

    const/4 v6, 0x0

    const-string v7, "title_key"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    #setter for: Landroid/server/BluetoothA2dpService;->mMediaCount:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2502(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->close()V

    const/16 v20, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Track count is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mMediaCount:Ljava/lang/String;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$2500(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .end local v21           #mediaNumber:J
    .end local v31           #temp:Ljava/lang/String;
    .end local v33           #tmpId:Ljava/lang/Long;
    :goto_5
    const-string v2, "end of parsing mData"

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-virtual {v2}, Landroid/server/BluetoothA2dpService;->getConnectedSinksPaths()[Ljava/lang/String;

    move-result-object v10

    .restart local v10       #arr$:[Ljava/lang/String;
    array-length v0, v10

    move/from16 v19, v0

    .restart local v19       #len$:I
    const/16 v18, 0x0

    .restart local v18       #i$:I
    :goto_6
    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_0

    aget-object v26, v10, v18

    .restart local v26       #path:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v26

    #calls: Landroid/server/BluetoothA2dpService;->sendMetaData(Ljava/lang/String;)V
    invoke-static {v2, v0}, Landroid/server/BluetoothA2dpService;->access$2800(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const/4 v3, 0x2

    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mMediaNumber:Ljava/lang/String;
    invoke-static {v4}, Landroid/server/BluetoothA2dpService;->access$2400(Landroid/server/BluetoothA2dpService;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    move-object/from16 v0, v26

    #calls: Landroid/server/BluetoothA2dpService;->sendEvent(Ljava/lang/String;IJ)V
    invoke-static {v2, v0, v3, v4, v5}, Landroid/server/BluetoothA2dpService;->access$2900(Landroid/server/BluetoothA2dpService;Ljava/lang/String;IJ)V

    add-int/lit8 v18, v18, 0x1

    goto :goto_6

    .end local v10           #arr$:[Ljava/lang/String;
    .end local v18           #i$:I
    .end local v19           #len$:I
    .end local v26           #path:Ljava/lang/String;
    :catch_0
    move-exception v14

    .local v14, e:Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exc is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Landroid/server/BluetoothA2dpService;->log(Ljava/lang/String;)V
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$3300(Ljava/lang/String;)V

    if-eqz v20, :cond_22

    invoke-interface/range {v20 .. v20}, Landroid/database/Cursor;->close()V

    :cond_22
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const/4 v3, 0x0

    #setter for: Landroid/server/BluetoothA2dpService;->mTrackName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2102(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const/4 v3, 0x0

    #setter for: Landroid/server/BluetoothA2dpService;->mArtistName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2202(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const/4 v3, 0x0

    #setter for: Landroid/server/BluetoothA2dpService;->mAlbumName:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$2302(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const/4 v3, 0x0

    #setter for: Landroid/server/BluetoothA2dpService;->mGenre:Ljava/lang/String;
    invoke-static {v2, v3}, Landroid/server/BluetoothA2dpService;->access$3902(Landroid/server/BluetoothA2dpService;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_5

    .end local v14           #e:Ljava/lang/Exception;
    .end local v20           #mCursor:Landroid/database/Cursor;
    .end local v27           #playStatus:I
    .end local v32           #tempMediaNumber:Ljava/lang/String;
    .end local v34           #uri:Landroid/net/Uri;
    .end local v35           #uriPath:Ljava/lang/String;
    .end local v37           #value:[Ljava/lang/String;
    :cond_23
    const-string v2, "com.android.music.playersettingsresponse"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "Response"

    const/16 v3, 0xff

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v17

    .local v17, getResponse:I
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPendingCmds:Ljava/util/ArrayList;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$400(Landroid/server/BluetoothA2dpService;)Ljava/util/ArrayList;

    move-result-object v3

    monitor-enter v3

    :try_start_3
    new-instance v36, Ljava/lang/Integer;

    move-object/from16 v0, v36

    move/from16 v1, v17

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    .local v36, val:Ljava/lang/Integer;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPendingCmds:Ljava/util/ArrayList;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$400(Landroid/server/BluetoothA2dpService;)Ljava/util/ArrayList;

    move-result-object v2

    move-object/from16 v0, v36

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mHandler:Landroid/os/Handler;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$4000(Landroid/server/BluetoothA2dpService;)Landroid/os/Handler;

    move-result-object v2

    const/4 v4, 0x2

    invoke-virtual {v2, v4}, Landroid/os/Handler;->removeMessages(I)V

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPendingCmds:Ljava/util/ArrayList;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$400(Landroid/server/BluetoothA2dpService;)Ljava/util/ArrayList;

    move-result-object v2

    move-object/from16 v0, v36

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_24
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    packed-switch v17, :pswitch_data_1

    goto/16 :goto_0

    :pswitch_2
    const-string v2, "Attributes"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v12

    .local v12, data:[B
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v2

    iget-object v2, v2, Landroid/server/BluetoothA2dpService$PlayerSettings;->path:Ljava/lang/String;

    if-eqz v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v3

    iget-object v3, v3, Landroid/server/BluetoothA2dpService$PlayerSettings;->path:Ljava/lang/String;

    const-string v4, "UpdateSupportedAttributes"

    array-length v5, v12

    #calls: Landroid/server/BluetoothA2dpService;->sendPlayerSettingsNative(Ljava/lang/String;Ljava/lang/String;I[B)Z
    invoke-static {v2, v3, v4, v5, v12}, Landroid/server/BluetoothA2dpService;->access$700(Landroid/server/BluetoothA2dpService;Ljava/lang/String;Ljava/lang/String;I[B)Z

    goto/16 :goto_0

    .end local v12           #data:[B
    .end local v36           #val:Ljava/lang/Integer;
    :catchall_1
    move-exception v2

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v2

    .restart local v36       #val:Ljava/lang/Integer;
    :pswitch_3
    const-string v2, "Values"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v12

    .restart local v12       #data:[B
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v2

    iget-object v2, v2, Landroid/server/BluetoothA2dpService$PlayerSettings;->path:Ljava/lang/String;

    if-eqz v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v3

    iget-object v3, v3, Landroid/server/BluetoothA2dpService$PlayerSettings;->path:Ljava/lang/String;

    const-string v4, "UpdateSupportedValues"

    array-length v5, v12

    #calls: Landroid/server/BluetoothA2dpService;->sendPlayerSettingsNative(Ljava/lang/String;Ljava/lang/String;I[B)Z
    invoke-static {v2, v3, v4, v5, v12}, Landroid/server/BluetoothA2dpService;->access$700(Landroid/server/BluetoothA2dpService;Ljava/lang/String;Ljava/lang/String;I[B)Z

    goto/16 :goto_0

    .end local v12           #data:[B
    :pswitch_4
    const-string v2, "AttribValuePairs"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v12

    .restart local v12       #data:[B
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #calls: Landroid/server/BluetoothA2dpService;->updateLocalPlayerSettings([B)V
    invoke-static {v2, v12}, Landroid/server/BluetoothA2dpService;->access$4100(Landroid/server/BluetoothA2dpService;[B)V

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v2

    iget-object v2, v2, Landroid/server/BluetoothA2dpService$PlayerSettings;->path:Ljava/lang/String;

    if-eqz v2, :cond_25

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v3

    iget-object v3, v3, Landroid/server/BluetoothA2dpService$PlayerSettings;->path:Ljava/lang/String;

    const-string v4, "UpdateCurrentValues"

    array-length v5, v12

    #calls: Landroid/server/BluetoothA2dpService;->sendPlayerSettingsNative(Ljava/lang/String;Ljava/lang/String;I[B)Z
    invoke-static {v2, v3, v4, v5, v12}, Landroid/server/BluetoothA2dpService;->access$700(Landroid/server/BluetoothA2dpService;Ljava/lang/String;Ljava/lang/String;I[B)Z

    goto/16 :goto_0

    :cond_25
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    invoke-virtual {v2}, Landroid/server/BluetoothA2dpService;->getConnectedSinksPaths()[Ljava/lang/String;

    move-result-object v10

    .restart local v10       #arr$:[Ljava/lang/String;
    array-length v0, v10

    move/from16 v19, v0

    .restart local v19       #len$:I
    const/16 v18, 0x0

    .restart local v18       #i$:I
    :goto_7
    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_0

    aget-object v26, v10, v18

    .restart local v26       #path:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    const-string v3, "UpdateCurrentValues"

    array-length v4, v12

    move-object/from16 v0, v26

    #calls: Landroid/server/BluetoothA2dpService;->sendPlayerSettingsNative(Ljava/lang/String;Ljava/lang/String;I[B)Z
    invoke-static {v2, v0, v3, v4, v12}, Landroid/server/BluetoothA2dpService;->access$700(Landroid/server/BluetoothA2dpService;Ljava/lang/String;Ljava/lang/String;I[B)Z

    add-int/lit8 v18, v18, 0x1

    goto :goto_7

    .end local v10           #arr$:[Ljava/lang/String;
    .end local v12           #data:[B
    .end local v18           #i$:I
    .end local v19           #len$:I
    .end local v26           #path:Ljava/lang/String;
    :pswitch_5
    const-string v2, "AttributeStrings"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .local v7, text:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v2

    iget-object v2, v2, Landroid/server/BluetoothA2dpService$PlayerSettings;->path:Ljava/lang/String;

    if-eqz v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v3

    iget-object v3, v3, Landroid/server/BluetoothA2dpService$PlayerSettings;->path:Ljava/lang/String;

    const-string v4, "UpdateAttributesText"

    array-length v5, v7

    move-object/from16 v0, p0

    iget-object v6, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v6}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v6

    iget-object v6, v6, Landroid/server/BluetoothA2dpService$PlayerSettings;->attrIds:[B

    #calls: Landroid/server/BluetoothA2dpService;->sendSettingsTextNative(Ljava/lang/String;Ljava/lang/String;I[B[Ljava/lang/String;)Z
    invoke-static/range {v2 .. v7}, Landroid/server/BluetoothA2dpService;->access$1200(Landroid/server/BluetoothA2dpService;Ljava/lang/String;Ljava/lang/String;I[B[Ljava/lang/String;)Z

    goto/16 :goto_0

    .end local v7           #text:[Ljava/lang/String;
    :pswitch_6
    const-string v2, "ValueStrings"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .restart local v7       #text:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v2}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v2

    iget-object v2, v2, Landroid/server/BluetoothA2dpService$PlayerSettings;->path:Ljava/lang/String;

    if-eqz v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, p0

    iget-object v3, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v3}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v3

    iget-object v3, v3, Landroid/server/BluetoothA2dpService$PlayerSettings;->path:Ljava/lang/String;

    const-string v4, "UpdateValuesText"

    array-length v5, v7

    move-object/from16 v0, p0

    iget-object v6, v0, Landroid/server/BluetoothA2dpService$2;->this$0:Landroid/server/BluetoothA2dpService;

    #getter for: Landroid/server/BluetoothA2dpService;->mPlayerSettings:Landroid/server/BluetoothA2dpService$PlayerSettings;
    invoke-static {v6}, Landroid/server/BluetoothA2dpService;->access$500(Landroid/server/BluetoothA2dpService;)Landroid/server/BluetoothA2dpService$PlayerSettings;

    move-result-object v6

    iget-object v6, v6, Landroid/server/BluetoothA2dpService$PlayerSettings;->attrIds:[B

    #calls: Landroid/server/BluetoothA2dpService;->sendSettingsTextNative(Ljava/lang/String;Ljava/lang/String;I[B[Ljava/lang/String;)Z
    invoke-static/range {v2 .. v7}, Landroid/server/BluetoothA2dpService;->access$1200(Landroid/server/BluetoothA2dpService;Ljava/lang/String;Ljava/lang/String;I[B[Ljava/lang/String;)Z

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_0
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_5
        :pswitch_6
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method
