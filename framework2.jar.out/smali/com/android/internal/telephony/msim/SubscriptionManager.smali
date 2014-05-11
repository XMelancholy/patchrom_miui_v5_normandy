.class public Lcom/android/internal/telephony/msim/SubscriptionManager;
.super Landroid/os/Handler;
.source "SubscriptionManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;,
        Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;,
        Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    }
.end annotation


# static fields
.field private static final EVENT_ALL_CARD_INFO_AVAILABLE:I = 0x2

.field private static final EVENT_ALL_DATA_DISCONNECTED:I = 0x8

.field private static final EVENT_CARD_INFO_AVAILABLE:I = 0x0

.field private static final EVENT_CARD_INFO_NOT_AVAILABLE:I = 0x1

.field private static final EVENT_CLEANUP_DATA_CONNECTION_DONE:I = 0x7

.field private static final EVENT_PROCESS_AVAILABLE_CARDS:I = 0xb

.field private static final EVENT_RADIO_OFF_OR_NOT_AVAILABLE:I = 0xa

.field private static final EVENT_RADIO_ON:I = 0x9

.field private static final EVENT_SET_DATA_SUBSCRIPTION_DONE:I = 0x6

.field private static final EVENT_SET_SUBSCRIPTION_MODE_DONE:I = 0x3

.field private static final EVENT_SET_UICC_SUBSCRIPTION_DONE:I = 0x4

.field private static final EVENT_SUBSCRIPTION_STATUS_CHANGED:I = 0x5

.field static final LOG_TAG:Ljava/lang/String; = "SubscriptionManager"

.field public static NUM_SUBSCRIPTIONS:I = 0x0

.field public static final SUB_ACTIVATE_FAILED:Ljava/lang/String; = "ACTIVATE FAILED"

.field public static final SUB_ACTIVATE_NOT_SUPPORTED:Ljava/lang/String; = "ACTIVATE NOT SUPPORTED"

.field public static final SUB_ACTIVATE_SUCCESS:Ljava/lang/String; = "ACTIVATE SUCCESS"

.field public static final SUB_DEACTIVATE_FAILED:Ljava/lang/String; = "DEACTIVATE FAILED"

.field public static final SUB_DEACTIVATE_NOT_SUPPORTED:Ljava/lang/String; = "DEACTIVATE NOT SUPPORTED"

.field public static final SUB_DEACTIVATE_SUCCESS:Ljava/lang/String; = "DEACTIVATE SUCCESS"

.field public static final SUB_NOT_CHANGED:Ljava/lang/String; = "NO CHANGE IN SUBSCRIPTION"

.field private static final SUB_STATUS_ACTIVATED:I = 0x1

.field private static final SUB_STATUS_DEACTIVATED:I

.field private static USER_PREF_SUB_FIELDS:I

.field private static sSubscriptionManager:Lcom/android/internal/telephony/msim/SubscriptionManager;


# instance fields
.field private mActivatePending:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;",
            "Lcom/android/internal/telephony/msim/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field private mAllCardsStatusAvailable:Z

.field private mCardInfoAvailable:[Z

.field private mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

.field private mCi:[Lcom/android/internal/telephony/CommandsInterface;

.field private mContext:Landroid/content/Context;

.field private mCurrentDds:I

.field private mCurrentSubscriptions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;",
            "Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mDataActive:Z

.field private mDeactivatePending:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;",
            "Lcom/android/internal/telephony/msim/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field private mDisableDdsInProgress:Z

.field private mIsNewCard:[Z

.field private mQueuedDds:I

.field private mRadioOn:[Z

.field private mSetDdsCompleteMsg:Landroid/os/Message;

.field private mSetDdsRequired:Z

.field private mSetSubsModeRequired:Z

.field private mSetSubscriptionInProgress:Z

.field private mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

.field private mSubActivatedRegistrants:[Landroid/os/RegistrantList;

.field private mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

.field private mSubResult:[Ljava/lang/String;

.field private mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 99
    const/4 v0, 0x2

    sput v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    .line 102
    const/4 v0, 0x6

    sput v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->USER_PREF_SUB_FIELDS:I

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/android/internal/telephony/uicc/UiccController;[Lcom/android/internal/telephony/CommandsInterface;)V
    .locals 11
    .parameter "context"
    .parameter "uiccController"
    .parameter "ci"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x2

    .line 216
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 139
    iput-object v9, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    .line 142
    iput-boolean v10, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    .line 144
    new-array v5, v8, [Z

    fill-array-data v5, :array_0

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    .line 151
    iput-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mAllCardsStatusAvailable:Z

    .line 153
    iput-boolean v10, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    .line 159
    iput-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    .line 163
    iput-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDataActive:Z

    .line 165
    new-array v5, v8, [Z

    fill-array-data v5, :array_1

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    .line 169
    new-instance v5, Landroid/os/RegistrantList;

    invoke-direct {v5}, Landroid/os/RegistrantList;-><init>()V

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    .line 171
    sget v5, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    new-array v5, v5, [Ljava/lang/String;

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    .line 173
    new-array v5, v8, [Z

    fill-array-data v5, :array_2

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    .line 217
    const-string v5, "Constructor - Enter"

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 219
    iput-object p1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mContext:Landroid/content/Context;

    .line 222
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getUserPreferredSubs()V

    .line 224
    invoke-static {p1, p2, p3}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getInstance(Landroid/content/Context;Lcom/android/internal/telephony/uicc/UiccController;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    move-result-object v5

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    .line 225
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v8, :cond_0

    .line 226
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v1, p0, v7, v6}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->registerForCardInfoAvailable(ILandroid/os/Handler;ILjava/lang/Object;)V

    .line 228
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v1, p0, v10, v6}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->registerForCardInfoUnavailable(ILandroid/os/Handler;ILjava/lang/Object;)V

    .line 225
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 231
    :cond_0
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    invoke-virtual {v5, p0, v8, v9}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->registerForAllCardsInfoAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 233
    iput-object p3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    .line 234
    const/4 v1, 0x0

    :goto_1
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    array-length v5, v5

    if-ge v1, v5, :cond_1

    .line 235
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v5, v5, v1

    const/4 v6, 0x5

    new-instance v7, Ljava/lang/Integer;

    invoke-direct {v7, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v5, p0, v6, v7}, Lcom/android/internal/telephony/CommandsInterface;->registerForSubscriptionStatusChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 237
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v5, v5, v1

    const/16 v6, 0xa

    new-instance v7, Ljava/lang/Integer;

    invoke-direct {v7, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v5, p0, v6, v7}, Lcom/android/internal/telephony/CommandsInterface;->registerForOffOrNotAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 239
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v5, v5, v1

    const/16 v6, 0x9

    new-instance v7, Ljava/lang/Integer;

    invoke-direct {v7, v1}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v5, p0, v6, v7}, Lcom/android/internal/telephony/CommandsInterface;->registerForOn(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 234
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 242
    :cond_1
    new-array v5, v8, [Landroid/os/RegistrantList;

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    .line 243
    new-array v5, v8, [Landroid/os/RegistrantList;

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    .line 244
    const/4 v1, 0x0

    :goto_2
    if-ge v1, v8, :cond_2

    .line 245
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    new-instance v6, Landroid/os/RegistrantList;

    invoke-direct {v6}, Landroid/os/RegistrantList;-><init>()V

    aput-object v6, v5, v1

    .line 246
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    new-instance v6, Landroid/os/RegistrantList;

    invoke-direct {v6}, Landroid/os/RegistrantList;-><init>()V

    aput-object v6, v5, v1

    .line 244
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 248
    :cond_2
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    .line 249
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    .line 250
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_3
    if-ge v2, v3, :cond_3

    aget-object v4, v0, v2

    .line 251
    .local v4, t:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 257
    .end local v4           #t:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_3
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDataSubscription()I

    move-result v5

    iput v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    .line 258
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "In MSimProxyManager constructor current active dds is:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 260
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    .line 261
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    array-length v3, v0

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v3, :cond_4

    aget-object v4, v0, v2

    .line 262
    .restart local v4       #t:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    new-instance v6, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    invoke-direct {v6, p0}, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;-><init>(Lcom/android/internal/telephony/msim/SubscriptionManager;)V

    invoke-virtual {v5, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 264
    .end local v4           #t:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_4
    const-string v5, "Constructor - Exit"

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 265
    return-void

    .line 144
    nop

    :array_0
    .array-data 0x1
        0x0t
        0x0t
    .end array-data

    .line 165
    nop

    :array_1
    .array-data 0x1
        0x0t
        0x0t
    .end array-data

    .line 173
    nop

    :array_2
    .array-data 0x1
        0x0t
        0x0t
    .end array-data
.end method

.method private getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;
    .locals 1
    .parameter "subId"

    .prologue
    .line 1192
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    iget-object v0, v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->sub:Lcom/android/internal/telephony/msim/Subscription;

    return-object v0
.end method

.method private getCurrentSubscriptionReadiness(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Z
    .locals 1
    .parameter "subId"

    .prologue
    .line 1204
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    iget-boolean v0, v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    return v0
.end method

.method private getCurrentSubscriptionStatus(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;
    .locals 1
    .parameter "subId"

    .prologue
    .line 1200
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    iget-object v0, v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->sub:Lcom/android/internal/telephony/msim/Subscription;

    iget-object v0, v0, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    return-object v0
.end method

.method public static getInstance()Lcom/android/internal/telephony/msim/SubscriptionManager;
    .locals 1

    .prologue
    .line 206
    sget-object v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/msim/SubscriptionManager;

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;Lcom/android/internal/telephony/uicc/UiccController;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/android/internal/telephony/msim/SubscriptionManager;
    .locals 2
    .parameter "context"
    .parameter "uiccController"
    .parameter "ci"

    .prologue
    .line 194
    const-string v0, "SubscriptionManager"

    const-string v1, "getInstance"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    sget-object v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/msim/SubscriptionManager;

    if-nez v0, :cond_0

    .line 196
    new-instance v0, Lcom/android/internal/telephony/msim/SubscriptionManager;

    invoke-direct {v0, p0, p1, p2}, Lcom/android/internal/telephony/msim/SubscriptionManager;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/uicc/UiccController;[Lcom/android/internal/telephony/CommandsInterface;)V

    sput-object v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/msim/SubscriptionManager;

    .line 198
    :cond_0
    sget-object v0, Lcom/android/internal/telephony/msim/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/msim/SubscriptionManager;

    return-object v0
.end method

.method private getSetSubscriptionResults()[Ljava/lang/String;
    .locals 4

    .prologue
    .line 657
    sget v2, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    new-array v1, v2, [Ljava/lang/String;

    .line 658
    .local v1, result:[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget v2, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v0, v2, :cond_0

    .line 659
    iget-object v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v3

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    iget-object v2, v2, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->cause:Ljava/lang/String;

    aput-object v2, v1, v0

    .line 658
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 662
    :cond_0
    return-object v1
.end method

.method private getUserPreferredSubs()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    const/4 v11, -0x1

    .line 1466
    const/4 v1, 0x0

    .line 1468
    .local v1, errorOnParsing:Z
    new-instance v8, Lcom/android/internal/telephony/msim/SubscriptionData;

    sget v9, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    invoke-direct {v8, v9}, Lcom/android/internal/telephony/msim/SubscriptionData;-><init>(I)V

    iput-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    .line 1470
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    sget v8, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v3, v8, :cond_7

    .line 1471
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    sget-object v9, Landroid/provider/Settings$System;->USER_PREFERRED_SUBS:[Ljava/lang/String;

    aget-object v9, v9, v3

    invoke-static {v8, v9}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1473
    .local v6, strUserSub:Ljava/lang/String;
    if-eqz v6, :cond_3

    .line 1474
    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs: strUserSub = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1477
    :try_start_0
    const-string v8, ","

    invoke-virtual {v6, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 1480
    .local v5, splitUserSub:[Ljava/lang/String;
    array-length v8, v5

    sget v9, Lcom/android/internal/telephony/msim/SubscriptionManager;->USER_PREF_SUB_FIELDS:I

    if-ne v8, v9, :cond_6

    .line 1481
    const/4 v8, 0x0

    aget-object v8, v5, v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 1482
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, 0x0

    aget-object v9, v5, v9

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    .line 1484
    :cond_0
    const/4 v8, 0x1

    aget-object v8, v5, v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 1485
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, 0x1

    aget-object v9, v5, v9

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    .line 1487
    :cond_1
    const/4 v8, 0x2

    aget-object v8, v5, v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 1488
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, 0x2

    aget-object v9, v5, v9

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->appId:Ljava/lang/String;
    :try_end_0
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1492
    :cond_2
    const/4 v8, 0x3

    :try_start_1
    aget-object v8, v5, v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 1493
    .local v7, subStatus:I
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    invoke-static {}, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->values()[Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    move-result-object v9

    aget-object v9, v9, v7

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1502
    .end local v7           #subStatus:I
    :goto_1
    :try_start_2
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, 0x4

    aget-object v9, v5, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    iput v9, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gppIndex:I
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_2 .. :try_end_2} :catch_1

    .line 1513
    :goto_2
    :try_start_3
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, 0x5

    aget-object v9, v5, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    iput v9, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_3 .. :try_end_3} :catch_1

    .line 1538
    .end local v5           #splitUserSub:[Ljava/lang/String;
    :cond_3
    :goto_3
    if-eqz v6, :cond_4

    if-eqz v1, :cond_5

    .line 1539
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ",,,"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_INVALID:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-virtual {v9}, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->ordinal()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1546
    .local v0, defaultUserSub:Ljava/lang/String;
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    sget-object v9, Landroid/provider/Settings$System;->USER_PREFERRED_SUBS:[Ljava/lang/String;

    aget-object v9, v9, v3

    invoke-static {v8, v9, v0}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 1549
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput-object v12, v8, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    .line 1550
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput-object v12, v8, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    .line 1551
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput-object v12, v8, Lcom/android/internal/telephony/msim/Subscription;->appId:Ljava/lang/String;

    .line 1552
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    sget-object v9, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_INVALID:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    .line 1553
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput v11, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gppIndex:I

    .line 1554
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput v11, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I

    .line 1557
    .end local v0           #defaultUserSub:Ljava/lang/String;
    :cond_5
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    iput v3, v8, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    .line 1559
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "getUserPreferredSubs: mUserPrefSubs.subscription["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v9, v9, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v9, v9, v3

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1470
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 1495
    .restart local v5       #splitUserSub:[Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 1496
    .local v2, ex:Ljava/lang/NumberFormatException;
    :try_start_4
    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs: NumberFormatException: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1497
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    sget-object v9, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_INVALID:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v9, v8, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;
    :try_end_4
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_1

    .line 1529
    .end local v2           #ex:Ljava/lang/NumberFormatException;
    .end local v5           #splitUserSub:[Ljava/lang/String;
    :catch_1
    move-exception v4

    .line 1530
    .local v4, pe:Ljava/util/regex/PatternSyntaxException;
    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs: PatternSyntaxException while split : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1533
    const/4 v1, 0x1

    goto/16 :goto_3

    .line 1504
    .end local v4           #pe:Ljava/util/regex/PatternSyntaxException;
    .restart local v5       #splitUserSub:[Ljava/lang/String;
    :catch_2
    move-exception v2

    .line 1505
    .restart local v2       #ex:Ljava/lang/NumberFormatException;
    :try_start_5
    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs:m3gppIndex: NumberFormatException: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1508
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, -0x1

    iput v9, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gppIndex:I

    goto/16 :goto_2

    .line 1515
    .end local v2           #ex:Ljava/lang/NumberFormatException;
    :catch_3
    move-exception v2

    .line 1516
    .restart local v2       #ex:Ljava/lang/NumberFormatException;
    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs:m3gpp2Index: NumberFormatException: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1519
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v8, v8, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v8, v8, v3

    const/4 v9, -0x1

    iput v9, v8, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I

    goto/16 :goto_3

    .line 1524
    .end local v2           #ex:Ljava/lang/NumberFormatException;
    :cond_6
    const-string v8, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getUserPreferredSubs: splitUserSub.length != "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget v10, Lcom/android/internal/telephony/msim/SubscriptionManager;->USER_PREF_SUB_FIELDS:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_5 .. :try_end_5} :catch_1

    .line 1527
    const/4 v1, 0x1

    goto/16 :goto_3

    .line 1562
    .end local v5           #splitUserSub:[Ljava/lang/String;
    .end local v6           #strUserSub:Ljava/lang/String;
    :cond_7
    return-void
.end method

.method private isAllCardsInfoAvailable()Z
    .locals 8

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 916
    const/4 v4, 0x1

    .line 917
    .local v4, result:Z
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    .local v0, arr$:[Z
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-boolean v1, v0, v2

    .line 918
    .local v1, available:Z
    if-eqz v4, :cond_0

    if-eqz v1, :cond_0

    move v4, v5

    .line 917
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    move v4, v6

    .line 918
    goto :goto_1

    .line 920
    .end local v1           #available:Z
    :cond_1
    if-nez v4, :cond_2

    iget-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mAllCardsStatusAvailable:Z

    if-eqz v7, :cond_3

    :cond_2
    move v6, v5

    :cond_3
    return v6
.end method

.method private isAllRadioOn()Z
    .locals 5

    .prologue
    .line 908
    const/4 v4, 0x1

    .line 909
    .local v4, result:Z
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    .local v0, arr$:[Z
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-boolean v3, v0, v1

    .line 910
    .local v3, radioOn:Z
    if-eqz v4, :cond_0

    if-eqz v3, :cond_0

    const/4 v4, 0x1

    .line 909
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 910
    :cond_0
    const/4 v4, 0x0

    goto :goto_1

    .line 912
    .end local v3           #radioOn:Z
    :cond_1
    return v4
.end method

.method private isAnyPendingActivateRequest(I)Z
    .locals 3
    .parameter "subId"

    .prologue
    .line 1136
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v2

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/Subscription;

    .line 1137
    .local v0, newSub:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v2, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v1, v2, :cond_0

    .line 1139
    const/4 v1, 0x1

    .line 1141
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isNewCardAvailable()Z
    .locals 5

    .prologue
    .line 923
    const/4 v4, 0x0

    .line 924
    .local v4, result:Z
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    .local v0, arr$:[Z
    array-length v3, v0

    .local v3, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v3, :cond_2

    aget-boolean v2, v0, v1

    .line 925
    .local v2, isNew:Z
    if-nez v4, :cond_0

    if-eqz v2, :cond_1

    :cond_0
    const/4 v4, 0x1

    .line 924
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 925
    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    .line 927
    .end local v2           #isNew:Z
    :cond_2
    return v4
.end method

.method private isPresentInActivatePendingList(Lcom/android/internal/telephony/msim/Subscription;)Z
    .locals 6
    .parameter "userSub"

    .prologue
    .line 883
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v1

    .local v1, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v1, v2

    .line 884
    .local v4, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/Subscription;

    .line 885
    .local v0, actPendingSub:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz p1, :cond_0

    invoke-virtual {p1, v0}, Lcom/android/internal/telephony/msim/Subscription;->isSame(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 886
    const/4 v5, 0x1

    .line 889
    .end local v0           #actPendingSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v4           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :goto_1
    return v5

    .line 883
    .restart local v0       #actPendingSub:Lcom/android/internal/telephony/msim/Subscription;
    .restart local v4       #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 889
    .end local v0           #actPendingSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v4           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method private logd(Ljava/lang/String;)V
    .locals 1
    .parameter "string"

    .prologue
    .line 1594
    const-string v0, "SubscriptionManager"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1595
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 1
    .parameter "string"

    .prologue
    .line 1598
    const-string v0, "SubscriptionManager"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1599
    return-void
.end method

.method private notifyIfAnyNewCardsAvailable()V
    .locals 3

    .prologue
    .line 789
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isNewCardAvailable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 792
    invoke-virtual {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifyNewCardsAvailable()V

    .line 793
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 794
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    const/4 v2, 0x0

    aput-boolean v2, v1, v0

    .line 793
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 797
    .end local v0           #i:I
    :cond_0
    return-void
.end method

.method private notifySubscriptionActivated(I)V
    .locals 1
    .parameter "subId"

    .prologue
    .line 1254
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 1255
    return-void
.end method

.method private notifySubscriptionDeactivated(I)V
    .locals 1
    .parameter "subId"

    .prologue
    .line 1246
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 1247
    return-void
.end method

.method private printPendingActivateRequests()V
    .locals 7

    .prologue
    .line 979
    const-string v5, "ActivatePending Queue : "

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 980
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 981
    .local v4, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/msim/Subscription;

    .line 982
    .local v3, newSub:Lcom/android/internal/telephony/msim/Subscription;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 980
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 984
    .end local v3           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v4           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_0
    return-void
.end method

.method private printPendingDeactivateRequests()V
    .locals 7

    .prologue
    .line 990
    const-string v5, "DeactivatePending Queue : "

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 991
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 992
    .local v4, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/msim/Subscription;

    .line 993
    .local v3, newSub:Lcom/android/internal/telephony/msim/Subscription;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 991
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 995
    .end local v3           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v4           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_0
    return-void
.end method

.method private processActivateRequests()V
    .locals 2

    .prologue
    .line 1051
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "processActivateRequests: mSetSubscriptionInProgress = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " mSetSubsModeRequired = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1054
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v0, :cond_0

    .line 1055
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    if-eqz v0, :cond_1

    .line 1056
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->setSubscriptionMode()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    .line 1057
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-eqz v0, :cond_0

    .line 1058
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    .line 1064
    :cond_0
    :goto_0
    return-void

    .line 1062
    :cond_1
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingActivateRequests()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    goto :goto_0
.end method

.method private processAllCardsInfoAvailable()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    .line 737
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAllRadioOn()Z

    move-result v2

    if-nez v2, :cond_0

    .line 738
    const-string v2, "processAllCardsInfoAvailable: Radio Not Available "

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 757
    :goto_0
    return-void

    .line 742
    :cond_0
    const/4 v0, 0x0

    .line 743
    .local v0, availableCards:I
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mAllCardsStatusAvailable:Z

    .line 745
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v3, :cond_3

    .line 746
    iget-object v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v2, v2, v1

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    invoke-virtual {v2, v1}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->isCardAbsentOrError(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 747
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 745
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 751
    :cond_3
    if-ne v0, v3, :cond_4

    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v2, :cond_4

    .line 753
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processActivateRequests()V

    .line 756
    :cond_4
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifyIfAnyNewCardsAvailable()V

    goto :goto_0
.end method

.method private processAllDataDisconnected(Landroid/os/AsyncResult;)V
    .locals 4
    .parameter "ar"

    .prologue
    .line 355
    if-nez p1, :cond_1

    .line 356
    const-string v2, "processAllDataDisconnected: ar is null!! return!!"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 383
    :cond_0
    :goto_0
    return-void

    .line 360
    :cond_1
    iget-object v0, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    .line 361
    .local v0, sub:Ljava/lang/Integer;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "processAllDataDisconnected: sub = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 362
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3, p0}, Lcom/android/internal/telephony/msim/MSimProxyManager;->unregisterForAllDataDisconnected(ILandroid/os/Handler;)V

    .line 368
    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    if-eqz v2, :cond_2

    .line 369
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processDisableDataConnectionDone(Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 373
    :cond_2
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aget-object v1, v2, v3

    .line 374
    .local v1, subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "processAllDataDisconnected: subscriptionReadiness["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionReadiness(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 376
    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionReadiness(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 377
    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->resetCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)V

    .line 379
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateSubPreferences()V

    .line 380
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifySubscriptionDeactivated(I)V

    .line 381
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->triggerUpdateFromAvaialbleCards()V

    goto :goto_0
.end method

.method private processAvailableCards()V
    .locals 2

    .prologue
    .line 770
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAllRadioOn()Z

    move-result v1

    if-nez v1, :cond_0

    .line 771
    const-string v1, "processAvailableCards: Radio Not Available "

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 786
    :goto_0
    return-void

    .line 774
    :cond_0
    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-eqz v1, :cond_1

    .line 775
    const-string v1, "processAvailableCards: set subscription in progress!!"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 779
    :cond_1
    const/4 v0, 0x0

    .local v0, cardIndex:I
    :goto_1
    const/4 v1, 0x2

    if-ge v0, v1, :cond_2

    .line 780
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateActivatePendingList(I)V

    .line 779
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 783
    :cond_2
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processActivateRequests()V

    .line 785
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifyIfAnyNewCardsAvailable()V

    goto :goto_0
.end method

.method private processCardInfoAvailable(Landroid/os/AsyncResult;)V
    .locals 4
    .parameter "ar"

    .prologue
    .line 850
    iget-object v0, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    .line 852
    .local v0, cardIndex:Ljava/lang/Integer;
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-boolean v1, v1, v2

    if-nez v1, :cond_0

    .line 853
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processCardInfoAvailable: Radio Not Available on cardIndex = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 880
    :goto_0
    return-void

    .line 857
    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    aput-boolean v3, v1, v2

    .line 859
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processCardInfoAvailable: CARD:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is available"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 865
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateActivatePendingList(I)V

    .line 867
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAllCardsInfoAvailable()Z

    move-result v1

    if-nez v1, :cond_1

    .line 868
    const-string v1, "All cards info not available!! Waiting for all info before processing"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 872
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processCardInfoAvailable: mSetSubscriptionInProgress = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 875
    iget-boolean v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v1, :cond_2

    .line 876
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processActivateRequests()V

    .line 879
    :cond_2
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifyIfAnyNewCardsAvailable()V

    goto :goto_0
.end method

.method private processCardInfoNotAvailable(Landroid/os/AsyncResult;)V
    .locals 10
    .parameter "ar"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 936
    iget-object v8, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v8, :cond_0

    iget-object v8, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-nez v8, :cond_2

    .line 937
    :cond_0
    const-string v6, "processCardInfoNotAvailable - Exception"

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 972
    :cond_1
    :goto_0
    return-void

    .line 941
    :cond_2
    iget-object v1, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    .line 942
    .local v1, cardIndex:Ljava/lang/Integer;
    iget-object v4, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;

    .line 944
    .local v4, reason:Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "processCardInfoNotAvailable on cardIndex = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " reason = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 947
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v9

    aput-boolean v7, v8, v9

    .line 952
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v8, v8, v7

    if-nez v8, :cond_5

    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v8, v8, v6

    if-nez v8, :cond_5

    :goto_1
    iput-boolean v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    .line 953
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "processCardInfoNotAvailable mSetSubsModeRequired = "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubsModeRequired:Z

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 957
    sget-object v6, Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;->REASON_RADIO_UNAVAILABLE:Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;

    if-eq v4, v6, :cond_3

    sget-object v6, Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;->REASON_SIM_REFRESH_RESET:Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;

    if-ne v4, v6, :cond_6

    .line 961
    :cond_3
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_2
    if-ge v2, v3, :cond_6

    aget-object v5, v0, v2

    .line 962
    .local v5, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v6

    iget v6, v6, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-ne v6, v8, :cond_4

    .line 963
    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->resetCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)V

    .line 964
    invoke-virtual {v5}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->ordinal()I

    move-result v6

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifySubscriptionDeactivated(I)V

    .line 961
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v0           #arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    .end local v2           #i$:I
    .end local v3           #len$:I
    .end local v5           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_5
    move v6, v7

    .line 952
    goto :goto_1

    .line 969
    :cond_6
    sget-object v6, Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;->REASON_RADIO_UNAVAILABLE:Lcom/android/internal/telephony/MSimConstants$CardUnavailableReason;

    if-ne v4, v6, :cond_1

    .line 970
    iput-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mAllCardsStatusAvailable:Z

    goto/16 :goto_0
.end method

.method private processCleanupDataConnectionDone(Ljava/lang/Integer;)V
    .locals 2
    .parameter "subId"

    .prologue
    .line 455
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-boolean v0, v0, v1

    if-nez v0, :cond_0

    .line 456
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "processCleanupDataConnectionDone: Radio Not Available on subId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 464
    :goto_0
    return-void

    .line 462
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDataActive:Z

    .line 463
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingDeactivateRequests()Z

    goto :goto_0
.end method

.method private processDisableDataConnectionDone(Landroid/os/AsyncResult;)V
    .locals 4
    .parameter "ar"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 413
    if-eqz p1, :cond_2

    .line 415
    iget v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    invoke-static {v0}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->setDataSubscription(I)V

    .line 417
    iget v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    if-eq v0, v1, :cond_0

    .line 420
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimProxyManager;->updateDataConnectionTracker(I)V

    .line 423
    :cond_0
    iget v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    iput v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    .line 426
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimProxyManager;->updateDataConnectionTracker(I)V

    .line 429
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setDataSubscriptionSource is Successful  Enable Data Connectivity on Subscription "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 431
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimProxyManager;->enableDataConnectivity(I)V

    .line 432
    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDataActive:Z

    .line 439
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    .line 442
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    if-eqz v0, :cond_1

    .line 443
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1, v3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 444
    const-string v0, "Enable Data Connectivity Done!! Sending the cnf back!"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 445
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 446
    iput-object v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    .line 448
    :cond_1
    return-void

    .line 435
    :cond_2
    const-string v0, "SubscriptionManager"

    const-string v1, "Disabling Data Subscription Failed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private processSetDataSubscriptionDone(Landroid/os/AsyncResult;)V
    .locals 5
    .parameter "ar"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 390
    iget-object v0, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    .line 391
    const-string v0, "Register for the all data disconnect"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 392
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    const/16 v2, 0x8

    new-instance v3, Ljava/lang/Integer;

    iget v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v0, v1, p0, v2, v3}, Lcom/android/internal/telephony/msim/MSimProxyManager;->registerForAllDataDisconnected(ILandroid/os/Handler;ILjava/lang/Object;)V

    .line 409
    :goto_0
    return-void

    .line 395
    :cond_0
    const-string v0, "SubscriptionManager"

    const-string v1, "setDataSubscriptionSource Failed : "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 397
    iput-boolean v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    .line 400
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    if-eqz v0, :cond_1

    .line 401
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1, v3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 402
    const-string v0, "posting failure message"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 403
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 404
    iput-object v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    .line 407
    :cond_1
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/MSimProxyManager;->enableDataConnectivity(I)V

    goto :goto_0
.end method

.method private processSetSubscriptionModeDone()V
    .locals 1

    .prologue
    .line 725
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAllRadioOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 726
    const-string v0, "processSetSubscriptionModeDone: Radio Not Available"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 731
    :goto_0
    return-void

    .line 730
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingActivateRequests()Z

    goto :goto_0
.end method

.method private processSetUiccSubscriptionDone(Landroid/os/AsyncResult;)V
    .locals 10
    .parameter "ar"

    .prologue
    const/4 v6, 0x0

    const/4 v9, 0x0

    .line 523
    iget-object v3, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;

    .line 524
    .local v3, setSubParam:Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    const/4 v0, 0x0

    .line 525
    .local v0, cause:Ljava/lang/String;
    sget-object v4, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_INVALID:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    .line 526
    .local v4, subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;
    const/4 v1, 0x0

    .line 528
    .local v1, currentSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-boolean v5, v5, v7

    if-nez v5, :cond_1

    .line 529
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "processSetUiccSubscriptionDone: Radio Not Available on subId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 650
    :cond_0
    :goto_0
    return-void

    .line 534
    :cond_1
    iget-object v5, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v5, :cond_a

    .line 537
    iget-object v5, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    instance-of v5, v5, Lcom/android/internal/telephony/CommandException;

    if-eqz v5, :cond_2

    .line 538
    iget-object v5, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v5, Lcom/android/internal/telephony/CommandException;

    check-cast v5, Lcom/android/internal/telephony/CommandException;

    invoke-virtual {v5}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v2

    .line 540
    .local v2, error:Lcom/android/internal/telephony/CommandException$Error;
    if-eqz v2, :cond_2

    sget-object v5, Lcom/android/internal/telephony/CommandException$Error;->SUBSCRIPTION_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v2, v5, :cond_2

    .line 542
    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_5

    .line 543
    const-string v0, "ACTIVATE NOT SUPPORTED"

    .line 550
    .end local v2           #error:Lcom/android/internal/telephony/CommandException$Error;
    :cond_2
    :goto_1
    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_6

    .line 552
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "subscription of SUB:"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " Activate Failed"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 553
    if-nez v0, :cond_3

    .line 554
    const-string v0, "ACTIVATE FAILED"

    .line 556
    :cond_3
    sget-object v4, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    .line 557
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    check-cast v1, Lcom/android/internal/telephony/msim/Subscription;

    .line 560
    .restart local v1       #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 618
    :cond_4
    :goto_2
    const-string v5, "set uicc subscription done. update the current subscriptions"

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 620
    iget v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-direct {p0, v5, v1, v4, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateCurrentSubscription(ILcom/android/internal/telephony/msim/Subscription;Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;Ljava/lang/String;)V

    .line 625
    iget-object v5, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v5, :cond_d

    .line 626
    iget v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v7

    invoke-direct {p0, v5, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->saveUserPreferredSubscription(ILcom/android/internal/telephony/msim/Subscription;)V

    .line 634
    :goto_3
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aput-object v0, v5, v7

    .line 636
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingDeactivateRequests()Z

    move-result v5

    if-nez v5, :cond_0

    .line 638
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingActivateRequests()Z

    move-result v5

    if-nez v5, :cond_0

    .line 641
    iput-boolean v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    .line 642
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateSubPreferences()V

    .line 644
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    if-eqz v5, :cond_0

    .line 645
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    new-instance v6, Landroid/os/AsyncResult;

    iget-object v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    invoke-direct {v6, v9, v7, v9}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v5, v6}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 544
    .restart local v2       #error:Lcom/android/internal/telephony/CommandException$Error;
    :cond_5
    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_2

    .line 545
    const-string v0, "DEACTIVATE NOT SUPPORTED"

    goto/16 :goto_1

    .line 561
    .end local v2           #error:Lcom/android/internal/telephony/CommandException$Error;
    :cond_6
    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_9

    .line 563
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "subscription of SUB:"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " Deactivate Failed"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 568
    if-nez v0, :cond_7

    .line 569
    iget v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAnyPendingActivateRequest(I)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 570
    const-string v0, "ACTIVATE FAILED"

    .line 575
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 580
    :cond_7
    :goto_4
    sget-object v4, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    .line 581
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    check-cast v1, Lcom/android/internal/telephony/msim/Subscription;

    .line 583
    .restart local v1       #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 585
    iget v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    if-ne v5, v7, :cond_4

    .line 587
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v5

    iget v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v5, v7}, Lcom/android/internal/telephony/msim/MSimProxyManager;->enableDataConnectivity(I)V

    goto/16 :goto_2

    .line 577
    :cond_8
    const-string v0, "DEACTIVATE FAILED"

    goto :goto_4

    .line 590
    :cond_9
    const-string v5, "UNKOWN: SHOULD NOT HIT HERE"

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 594
    :cond_a
    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_b

    .line 596
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "subscription of SUB:"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " Activated"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 597
    sget-object v4, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    .line 598
    const-string v0, "ACTIVATE SUCCESS"

    .line 599
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    check-cast v1, Lcom/android/internal/telephony/msim/Subscription;

    .line 602
    .restart local v1       #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2

    .line 603
    :cond_b
    iget-object v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v7, :cond_c

    .line 605
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "subscription of SUB:"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " Deactivated"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 606
    sget-object v4, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    .line 607
    const-string v0, "DEACTIVATE SUCCESS"

    .line 608
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    check-cast v1, Lcom/android/internal/telephony/msim/Subscription;

    .line 610
    .restart local v1       #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    iget v8, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v7, v7, v8

    invoke-virtual {v5, v7, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 612
    iget v5, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifySubscriptionDeactivated(I)V

    goto/16 :goto_2

    .line 614
    :cond_c
    const-string v5, "UNKOWN: SHOULD NOT HIT HERE"

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 630
    :cond_d
    iget v7, v3, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;->subId:I

    sget-object v5, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v4, v5, :cond_e

    const/4 v5, 0x1

    :goto_5
    invoke-direct {p0, v7, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateSubscriptionReadiness(IZ)V

    goto/16 :goto_3

    :cond_e
    move v5, v6

    goto :goto_5
.end method

.method private processSubscriptionStatusChanged(Landroid/os/AsyncResult;)V
    .locals 8
    .parameter "ar"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 471
    iget-object v2, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    .line 472
    .local v2, subId:Ljava/lang/Integer;
    iget-object v3, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    check-cast v3, [I

    aget v0, v3, v5

    .line 473
    .local v0, actStatus:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "handleSubscriptionStatusChanged sub = "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, " actStatus = "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 476
    iget-object v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aget-boolean v3, v3, v6

    if-nez v3, :cond_0

    .line 477
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "processSubscriptionStatusChanged: Radio Not Available on subId = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 516
    :goto_0
    return-void

    .line 481
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v0, v4, :cond_2

    move v3, v4

    :goto_1
    invoke-direct {p0, v6, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateSubscriptionReadiness(IZ)V

    .line 482
    if-ne v0, v4, :cond_3

    .line 484
    iget-boolean v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    if-eqz v3, :cond_1

    .line 485
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    if-ne v3, v6, :cond_1

    .line 486
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setDataSubscription on "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 489
    iget v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    iput v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    .line 490
    iput-boolean v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    .line 491
    const/4 v3, 0x6

    new-instance v4, Ljava/lang/Integer;

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-direct {v4, v6}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 494
    .local v1, msgSetDdsDone:Landroid/os/Message;
    iget-object v3, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    aget-object v3, v3, v4

    invoke-interface {v3, v1}, Lcom/android/internal/telephony/CommandsInterface;->setDataSubscription(Landroid/os/Message;)V

    .line 495
    iput-boolean v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    .line 498
    .end local v1           #msgSetDdsDone:Landroid/os/Message;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifySubscriptionActivated(I)V

    goto :goto_0

    :cond_2
    move v3, v5

    .line 481
    goto :goto_1

    .line 499
    :cond_3
    if-nez v0, :cond_5

    .line 503
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    if-ne v3, v4, :cond_4

    .line 504
    const-string v3, "Register for the all data disconnect"

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 505
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/16 v5, 0x8

    new-instance v6, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v3, v4, p0, v5, v6}, Lcom/android/internal/telephony/msim/MSimProxyManager;->registerForAllDataDisconnected(ILandroid/os/Handler;ILjava/lang/Object;)V

    goto :goto_0

    .line 508
    :cond_4
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v3, v3, v4

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->resetCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)V

    .line 509
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->updateSubPreferences()V

    .line 510
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->notifySubscriptionDeactivated(I)V

    .line 511
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->triggerUpdateFromAvaialbleCards()V

    goto/16 :goto_0

    .line 514
    :cond_5
    const-string v3, "handleSubscriptionStatusChanged INVALID"

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private resetCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)V
    .locals 2
    .parameter "subId"

    .prologue
    .line 1184
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/msim/Subscription;->clear()V

    .line 1185
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v1, v0, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    .line 1187
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->cause:Ljava/lang/String;

    .line 1188
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    .line 1189
    return-void
.end method

.method private saveUserPreferredSubscription(ILcom/android/internal/telephony/msim/Subscription;)V
    .locals 4
    .parameter "subIndex"
    .parameter "userPrefSub"

    .prologue
    .line 1566
    sget v1, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge p1, v1, :cond_0

    if-nez p2, :cond_1

    .line 1567
    :cond_0
    const-string v1, "SubscriptionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "saveUserPreferredSubscription: INVALID PARAMETERS: subIndex = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " userPrefSub = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1591
    :goto_0
    return-void

    .line 1573
    :cond_1
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v1, v1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v1, v1, p1

    invoke-virtual {v1, p2}, Lcom/android/internal/telephony/msim/Subscription;->copyFrom(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    .line 1574
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v1, v1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v1, v1, p1

    iput p1, v1, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    .line 1576
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->iccId:Ljava/lang/String;

    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    if-eqz v1, :cond_3

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->appType:Ljava/lang/String;

    :goto_2
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->appId:Ljava/lang/String;

    if-eqz v1, :cond_4

    iget-object v1, p2, Lcom/android/internal/telephony/msim/Subscription;->appId:Ljava/lang/String;

    :goto_3
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-virtual {v2}, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->ordinal()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p2, Lcom/android/internal/telephony/msim/Subscription;->m3gppIndex:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p2, Lcom/android/internal/telephony/msim/Subscription;->m3gpp2Index:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1583
    .local v0, userSub:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveUserPreferredSubscription: userPrefSub = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1584
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveUserPreferredSubscription: userSub = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1589
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/Settings$System;->USER_PREFERRED_SUBS:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_0

    .line 1576
    .end local v0           #userSub:Ljava/lang/String;
    :cond_2
    const-string v1, ""

    goto/16 :goto_1

    :cond_3
    const-string v1, ""

    goto/16 :goto_2

    :cond_4
    const-string v1, ""

    goto/16 :goto_3
.end method

.method private setSubscriptionMode()Z
    .locals 10

    .prologue
    const/4 v7, 0x0

    .line 1219
    const/4 v3, 0x0

    .line 1220
    .local v3, numSubsciptions:I
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v6, v0, v1

    .line 1221
    .local v6, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v8, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/msim/Subscription;

    .line 1222
    .local v4, pendingSub:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz v4, :cond_0

    iget-object v8, v4, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v9, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v8, v9, :cond_0

    .line 1224
    add-int/lit8 v3, v3, 0x1

    .line 1220
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1228
    .end local v4           #pendingSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v6           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setSubscriptionMode numSubsciptions = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1230
    if-lez v3, :cond_2

    sget v8, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-gt v3, v8, :cond_2

    .line 1231
    const/4 v8, 0x3

    const/4 v9, 0x0

    invoke-static {p0, v8, v9}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    .line 1234
    .local v5, setSubsModeDone:Landroid/os/Message;
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v7, v8, v7

    invoke-interface {v7, v3, v5}, Lcom/android/internal/telephony/CommandsInterface;->setSubscriptionMode(ILandroid/os/Message;)V

    .line 1235
    const/4 v7, 0x1

    .line 1237
    .end local v5           #setSubsModeDone:Landroid/os/Message;
    :cond_2
    return v7
.end method

.method private startNextPendingActivateRequests()Z
    .locals 12

    .prologue
    .line 1102
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->printPendingActivateRequests()V

    .line 1104
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v6

    .local v6, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v8, v6

    .local v8, len$:I
    const/4 v7, 0x0

    .local v7, i$:I
    :goto_0
    if-ge v7, v8, :cond_2

    aget-object v11, v6, v7

    .line 1105
    .local v11, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v0, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/internal/telephony/msim/Subscription;

    .line 1106
    .local v9, newSub:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz v9, :cond_0

    iget-object v0, v9, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v0, v1, :cond_0

    .line 1107
    invoke-direct {p0, v9}, Lcom/android/internal/telephony/msim/SubscriptionManager;->validateActivationRequest(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1109
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-virtual {v0, v11, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1104
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1114
    :cond_1
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/android/internal/telephony/msim/MSimProxyManager;->checkAndUpdatePhoneObject(Lcom/android/internal/telephony/msim/Subscription;)V

    .line 1116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "startNextPendingActivateRequests: Activating SUB : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1117
    new-instance v10, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;

    iget v0, v9, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iget-object v1, v9, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-direct {v10, p0, v0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;-><init>(Lcom/android/internal/telephony/msim/SubscriptionManager;ILcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;)V

    .line 1119
    .local v10, setSubParam:Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    const/4 v0, 0x4

    invoke-static {p0, v0, v10}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    .line 1122
    .local v5, msgSetUiccSubDone:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v1, v9, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    aget-object v0, v0, v1

    iget v1, v9, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v9}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v2

    iget v3, v9, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iget-object v4, v9, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-virtual {v4}, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->ordinal()I

    move-result v4

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/telephony/CommandsInterface;->setUiccSubscription(IIIILandroid/os/Message;)V

    .line 1129
    const/4 v0, 0x1

    .line 1132
    .end local v5           #msgSetUiccSubDone:Landroid/os/Message;
    .end local v9           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v10           #setSubParam:Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    .end local v11           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :goto_1
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private startNextPendingDeactivateRequests()Z
    .locals 14

    .prologue
    const/4 v13, 0x1

    .line 1004
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->printPendingDeactivateRequests()V

    .line 1006
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v7

    .local v7, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v9, v7

    .local v9, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_0
    if-ge v8, v9, :cond_3

    aget-object v12, v7, v8

    .line 1007
    .local v12, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/internal/telephony/msim/Subscription;

    .line 1008
    .local v10, newSub:Lcom/android/internal/telephony/msim/Subscription;
    if-eqz v10, :cond_0

    iget-object v0, v10, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v0, v1, :cond_0

    .line 1009
    invoke-direct {p0, v10}, Lcom/android/internal/telephony/msim/SubscriptionManager;->validateDeactivationRequest(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1011
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-virtual {v0, v12, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1006
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1015
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "startNextPendingDeactivateRequests: Need to deactivating SUB : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1016
    iget v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    iget v1, v10, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    if-ne v0, v1, :cond_2

    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDataActive:Z

    if-eqz v0, :cond_2

    .line 1021
    const-string v0, "Deactivate all the data calls if there is any"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1022
    const/4 v0, 0x7

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v6

    .line 1024
    .local v6, allDataCleanedUpMsg:Landroid/os/Message;
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v0, v1, v6}, Lcom/android/internal/telephony/msim/MSimProxyManager;->disableDataConnectivity(ILandroid/os/Message;)V

    .line 1026
    iput-boolean v13, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    .end local v6           #allDataCleanedUpMsg:Landroid/os/Message;
    :goto_1
    move v0, v13

    .line 1044
    .end local v10           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v12           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :goto_2
    return v0

    .line 1028
    .restart local v10       #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .restart local v12       #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_2
    const-string v0, "startNextPendingDeactivateRequests: Deactivating now"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1029
    new-instance v11, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;

    iget v0, v10, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iget-object v1, v10, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-direct {v11, p0, v0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;-><init>(Lcom/android/internal/telephony/msim/SubscriptionManager;ILcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;)V

    .line 1031
    .local v11, setSubParam:Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    const/4 v0, 0x4

    invoke-static {p0, v0, v11}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    .line 1034
    .local v5, msgSetUiccSubDone:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v1, v10, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    aget-object v0, v0, v1

    iget v1, v10, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v10}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v2

    iget v3, v10, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iget-object v4, v10, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    invoke-virtual {v4}, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->ordinal()I

    move-result v4

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/telephony/CommandsInterface;->setUiccSubscription(IIIILandroid/os/Message;)V

    goto :goto_1

    .line 1044
    .end local v5           #msgSetUiccSubDone:Landroid/os/Message;
    .end local v10           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v11           #setSubParam:Lcom/android/internal/telephony/msim/SubscriptionManager$SetUiccSubsParams;
    .end local v12           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method

.method private triggerUpdateFromAvaialbleCards()V
    .locals 1

    .prologue
    .line 763
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->sendMessage(Landroid/os/Message;)Z

    .line 764
    return-void
.end method

.method private updateActivatePendingList(I)V
    .locals 7
    .parameter "cardIndex"

    .prologue
    .line 800
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v5, v5, p1

    if-eqz v5, :cond_1

    .line 801
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    invoke-virtual {v5, p1}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v0

    .line 803
    .local v0, cardSubInfo:Lcom/android/internal/telephony/msim/SubscriptionData;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateActivatePendingList: cardIndex = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n Card Sub Info = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 806
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mUserPrefSubs:Lcom/android/internal/telephony/msim/SubscriptionData;

    iget-object v5, v5, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    aget-object v4, v5, p1

    .line 807
    .local v4, userSub:Lcom/android/internal/telephony/msim/Subscription;
    iget v3, v4, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    .line 808
    .local v3, subId:I
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v5

    aget-object v5, v5, v3

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    .line 810
    .local v1, currentSub:Lcom/android/internal/telephony/msim/Subscription;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateActivatePendingList: subId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n user pref sub = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n current sub   = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 814
    iget-object v5, v4, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v6, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v6, :cond_0

    iget-object v5, v1, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v6, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-eq v5, v6, :cond_0

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/msim/SubscriptionData;->hasSubscription(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isPresentInActivatePendingList(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 818
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateActivatePendingList: subId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " need to activate!!!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 823
    new-instance v2, Lcom/android/internal/telephony/msim/Subscription;

    invoke-direct {v2}, Lcom/android/internal/telephony/msim/Subscription;-><init>()V

    .line 824
    .local v2, sub:Lcom/android/internal/telephony/msim/Subscription;
    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/msim/SubscriptionData;->getSubscription(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/android/internal/telephony/msim/Subscription;->copyFrom(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    .line 825
    iput p1, v2, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    .line 826
    iput v3, v2, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    .line 827
    sget-object v5, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v5, v2, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    .line 828
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v6

    aget-object v6, v6, v3

    invoke-virtual {v5, v6, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 834
    .end local v2           #sub:Lcom/android/internal/telephony/msim/Subscription;
    :cond_0
    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/msim/SubscriptionData;->hasSubscription(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 835
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    const/4 v6, 0x0

    aput-boolean v6, v5, p1

    .line 839
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateActivatePendingList: mIsNewCard ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    aget-boolean v6, v6, p1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 842
    .end local v0           #cardSubInfo:Lcom/android/internal/telephony/msim/SubscriptionData;
    .end local v1           #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    .end local v3           #subId:I
    .end local v4           #userSub:Lcom/android/internal/telephony/msim/Subscription;
    :cond_1
    return-void

    .line 837
    .restart local v0       #cardSubInfo:Lcom/android/internal/telephony/msim/SubscriptionData;
    .restart local v1       #currentSub:Lcom/android/internal/telephony/msim/Subscription;
    .restart local v3       #subId:I
    .restart local v4       #userSub:Lcom/android/internal/telephony/msim/Subscription;
    :cond_2
    iget-object v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mIsNewCard:[Z

    const/4 v6, 0x1

    aput-boolean v6, v5, p1

    goto :goto_0
.end method

.method private updateCurrentSubscription(ILcom/android/internal/telephony/msim/Subscription;Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;Ljava/lang/String;)V
    .locals 3
    .parameter "subId"
    .parameter "subscription"
    .parameter "subStatus"
    .parameter "cause"

    .prologue
    .line 1146
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v1

    aget-object v0, v1, p1

    .line 1148
    .local v0, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateCurrentSubscription: subId = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " subStatus = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n subscription = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1151
    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne p3, v1, :cond_1

    .line 1152
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/android/internal/telephony/msim/Subscription;->copyFrom(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    .line 1158
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    iput-object p3, v1, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    .line 1159
    if-nez p4, :cond_0

    .line 1160
    const-string p4, "NO CHANGE IN SUBSCRIPTION"

    .line 1162
    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    iput-object p4, v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->cause:Ljava/lang/String;

    .line 1163
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    .line 1164
    return-void

    .line 1154
    :cond_1
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/Subscription;->clear()V

    .line 1156
    sget-object p3, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    goto :goto_0
.end method

.method private updateSubPreferences()V
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 669
    const/4 v1, 0x0

    .line 670
    .local v1, activeSubCount:I
    const/4 v0, 0x0

    .line 672
    .local v0, activeSub:Lcom/android/internal/telephony/msim/Subscription;
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v2

    .local v2, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v5, v2

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v6, v2, v4

    .line 673
    .local v6, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionStatus(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v8, v9, :cond_0

    .line 674
    add-int/lit8 v1, v1, 0x1

    .line 675
    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    .line 672
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 681
    .end local v6           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_1
    if-ne v1, v10, :cond_3

    .line 682
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateSubPreferences: only SUB:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " is Active.  Update the default/voice/sms and data subscriptions"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 684
    iget v8, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-static {v8}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->setVoiceSubscription(I)V

    .line 685
    iget v8, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-static {v8}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->setSMSSubscription(I)V

    .line 686
    invoke-static {v11}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->setPromptEnabled(Z)V

    .line 688
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateSubPreferences: current defaultSub = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDefaultSubscription()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 690
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updateSubPreferences: current mCurrentDds = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 691
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->getDefaultSubscription()I

    move-result v8

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    if-eq v8, v9, :cond_2

    .line 692
    iget v8, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-static {v8}, Lcom/android/internal/telephony/msim/MSimPhoneFactory;->setDefaultSubscription(I)V

    .line 695
    :cond_2
    iget v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    if-eq v8, v9, :cond_3

    .line 701
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v8

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    aget-object v7, v8, v9

    .line 702
    .local v7, subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionReadiness(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 703
    iget v8, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iput v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    .line 704
    const/4 v8, 0x6

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {p0, v8, v9}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    .line 706
    .local v3, callback:Landroid/os/Message;
    iput-boolean v10, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    .line 707
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "update setDataSubscription to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 708
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v9, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    aget-object v8, v8, v9

    invoke-interface {v8, v3}, Lcom/android/internal/telephony/CommandsInterface;->setDataSubscription(Landroid/os/Message;)V

    .line 709
    iput-boolean v11, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    .line 719
    .end local v3           #callback:Landroid/os/Message;
    .end local v7           #subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_3
    :goto_1
    return-void

    .line 713
    .restart local v7       #subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_4
    iput-boolean v10, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    .line 714
    iget v8, v0, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    iput v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    goto :goto_1
.end method

.method private updateSubscriptionReadiness(IZ)V
    .locals 3
    .parameter "subId"
    .parameter "ready"

    .prologue
    .line 1167
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v1

    aget-object v0, v1, p1

    .line 1168
    .local v0, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updateSubscriptionReadiness("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1171
    if-eqz p2, :cond_0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v1

    iget-object v1, v1, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v2, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v1, v2, :cond_0

    .line 1172
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    .line 1177
    :goto_0
    return-void

    .line 1176
    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/android/internal/telephony/msim/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    goto :goto_0
.end method

.method private validateActivationRequest(Lcom/android/internal/telephony/msim/Subscription;)Z
    .locals 3
    .parameter "sub"

    .prologue
    .line 1085
    iget-object v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    sget v1, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v0, v1, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    sget v1, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v0

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    iget v1, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    iget v2, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/SubscriptionData;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1092
    const/4 v0, 0x1

    .line 1094
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private validateDeactivationRequest(Lcom/android/internal/telephony/msim/Subscription;)Z
    .locals 3
    .parameter "sub"

    .prologue
    .line 1070
    iget-object v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v1, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->subId:I

    sget v1, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v0, v1, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    if-ltz v0, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    sget v1, Lcom/android/internal/telephony/msim/SubscriptionManager;->NUM_SUBSCRIPTIONS:I

    if-ge v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v0

    if-ltz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    iget v1, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/telephony/msim/Subscription;->getAppIndex()I

    move-result v0

    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/msim/CardSubscriptionManager;

    iget v2, p1, Lcom/android/internal/telephony/msim/Subscription;->slotId:I

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/msim/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/msim/SubscriptionData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/msim/SubscriptionData;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1077
    const/4 v0, 0x1

    .line 1079
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getActiveSubscriptionsCount()I
    .locals 8

    .prologue
    .line 1602
    const/4 v0, 0x0

    .line 1603
    .local v0, activeSubCount:I
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v1

    .local v1, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v1, v2

    .line 1604
    .local v4, sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionStatus(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v5, v6, :cond_0

    .line 1605
    add-int/lit8 v0, v0, 0x1

    .line 1603
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1608
    .end local v4           #sub:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_1
    const-string v5, "SubscriptionManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "count of subs activated "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1609
    return v0
.end method

.method public getCurrentSubscription(I)Lcom/android/internal/telephony/msim/Subscription;
    .locals 1
    .parameter "subId"

    .prologue
    .line 1196
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    aget-object v0, v0, p1

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .parameter "msg"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 271
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 343
    :cond_0
    :goto_0
    return-void

    .line 273
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 274
    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    .line 275
    .local v1, subId:Ljava/lang/Integer;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EVENT_RADIO_OFF_OR_NOT_AVAILABLE on SUB: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 276
    iget-object v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput-boolean v4, v2, v3

    .line 277
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isAllRadioOn()Z

    move-result v2

    if-nez v2, :cond_0

    .line 278
    iput-boolean v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    .line 279
    iput-boolean v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsRequired:Z

    goto :goto_0

    .line 284
    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v1           #subId:Ljava/lang/Integer;
    :pswitch_1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 285
    .restart local v0       #ar:Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    .line 286
    .restart local v1       #subId:Ljava/lang/Integer;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EVENT_RADIO_ON on SUB: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 287
    iget-object v2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput-boolean v5, v2, v3

    goto :goto_0

    .line 291
    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v1           #subId:Ljava/lang/Integer;
    :pswitch_2
    const-string v2, "EVENT_CARD_INFO_AVAILABLE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 292
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processCardInfoAvailable(Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 296
    :pswitch_3
    const-string v2, "EVENT_CARD_INFO_NOT_AVAILABLE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 297
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processCardInfoNotAvailable(Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 301
    :pswitch_4
    const-string v2, "EVENT_ALL_CARD_INFO_AVAILABLE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 302
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processAllCardsInfoAvailable()V

    goto :goto_0

    .line 306
    :pswitch_5
    const-string v2, "EVENT_SET_SUBSCRIPTION_MODE_DONE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 307
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processSetSubscriptionModeDone()V

    goto/16 :goto_0

    .line 311
    :pswitch_6
    const-string v2, "EVENT_SET_UICC_SUBSCRIPTION_DONE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 312
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processSetUiccSubscriptionDone(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 316
    :pswitch_7
    const-string v2, "EVENT_SUBSCRIPTION_STATUS_CHANGED"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 317
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processSubscriptionStatusChanged(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 321
    :pswitch_8
    const-string v2, "EVENT_CLEANUP_DATA_CONNECTION_DONE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 322
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processCleanupDataConnectionDone(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 326
    :pswitch_9
    const-string v2, "EVENT_SET_DATA_SUBSCRIPTION_DONE"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 327
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processSetDataSubscriptionDone(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 331
    :pswitch_a
    const-string v2, "SubscriptionManager"

    const-string v3, "EVENT_ALL_DATA_DISCONNECTED"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processAllDataDisconnected(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 336
    :pswitch_b
    const-string v2, "SubscriptionManager"

    const-string v3, "EVENT_PROCESS_AVAILABLE_CARDS"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processAvailableCards()V

    goto/16 :goto_0

    .line 271
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_9
        :pswitch_8
        :pswitch_a
        :pswitch_1
        :pswitch_0
        :pswitch_b
    .end packed-switch
.end method

.method public isSetSubscriptionInProgress()Z
    .locals 1

    .prologue
    .line 1613
    iget-boolean v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    return v0
.end method

.method public isSubActive(I)Z
    .locals 3
    .parameter "subscription"

    .prologue
    .line 1208
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(I)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v0

    .line 1209
    .local v0, currentSelSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v1, v0, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v2, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method notifyNewCardsAvailable()V
    .locals 3

    .prologue
    .line 897
    const-string v1, "notifyNewCardsAvailable"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 898
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 899
    .local v0, setSubscriptionIntent:Landroid/content/Intent;
    const-string v1, "com.android.phone"

    const-string v2, "com.android.phone.SetSubscription"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 901
    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 902
    const-string v1, "NOTIFY_NEW_CARD_AVAILABLE"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 904
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 905
    return-void
.end method

.method public declared-synchronized registerForSetSubscriptionCompleted(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 2
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 1444
    monitor-enter p0

    :try_start_0
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1445
    .local v0, r:Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1446
    monitor-exit p0

    return-void

    .line 1444
    .end local v0           #r:Landroid/os/Registrant;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public registerForSubscriptionActivated(ILandroid/os/Handler;ILjava/lang/Object;)V
    .locals 4
    .parameter "subId"
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 1420
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p2, p3, p4}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1421
    .local v0, r:Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v2, v1, p1

    monitor-enter v2

    .line 1422
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v1, p1

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 1423
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/msim/SubscriptionManager;->isSubActive(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1424
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 1428
    :goto_0
    monitor-exit v2

    .line 1429
    return-void

    .line 1426
    :cond_0
    const-string v1, "SubscriptionManager"

    const-string v3, "registerForSubscriptionActivated: Subscription is not activated"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1428
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public registerForSubscriptionDeactivated(ILandroid/os/Handler;ILjava/lang/Object;)V
    .locals 3
    .parameter "subId"
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 1400
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p2, p3, p4}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1401
    .local v0, r:Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v2, v1, p1

    monitor-enter v2

    .line 1402
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v1, p1

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 1403
    monitor-exit v2

    .line 1404
    return-void

    .line 1403
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setDataSubscription(ILandroid/os/Message;)V
    .locals 7
    .parameter "subscription"
    .parameter "onCompleteMsg"

    .prologue
    .line 1347
    const/4 v3, 0x0

    .line 1350
    .local v3, result:Z
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setDataSubscription: mCurrentDds = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " new subscription = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1353
    iget-boolean v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    if-nez v4, :cond_3

    .line 1355
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v4

    aget-object v4, v4, p1

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionReadiness(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1356
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setDataSubscription: requested SUB:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is not yet activated, returning failure"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1358
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v4, "Subscription not active"

    invoke-direct {v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 1385
    .local v0, exception:Ljava/lang/RuntimeException;
    :goto_0
    if-eqz p2, :cond_0

    .line 1386
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {p2, v4, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 1387
    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .line 1389
    .end local v0           #exception:Ljava/lang/RuntimeException;
    :cond_0
    :goto_1
    return-void

    .line 1359
    :cond_1
    iget v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    if-eq v4, p1, :cond_2

    .line 1360
    invoke-static {}, Lcom/android/internal/telephony/msim/MSimProxyManager;->getInstance()Lcom/android/internal/telephony/msim/MSimProxyManager;

    move-result-object v4

    iget v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v4, v5}, Lcom/android/internal/telephony/msim/MSimProxyManager;->disableDataConnectivityFlag(I)Z

    move-result v1

    .line 1362
    .local v1, flag:Z
    iput-object p2, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    .line 1363
    iput p1, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    .line 1364
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDisableDdsInProgress:Z

    .line 1367
    const/4 v4, 0x6

    new-instance v5, Ljava/lang/Integer;

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    invoke-direct {v5, v6}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v4, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 1370
    .local v2, msgSetDataSub:Landroid/os/Message;
    const-string v4, "SubscriptionManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Set DDS to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " Calling cmd interface setDataSubscription"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1372
    iget-object v4, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v5, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mQueuedDds:I

    aget-object v4, v4, v5

    invoke-interface {v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->setDataSubscription(Landroid/os/Message;)V

    goto :goto_1

    .line 1375
    .end local v1           #flag:Z
    .end local v2           #msgSetDataSub:Landroid/os/Message;
    :cond_2
    const-string v4, "Current subscription is same as requested Subscription"

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1376
    const/4 v3, 0x1

    .line 1377
    const/4 v0, 0x0

    .restart local v0       #exception:Ljava/lang/RuntimeException;
    goto :goto_0

    .line 1380
    .end local v0           #exception:Ljava/lang/RuntimeException;
    :cond_3
    const-string v4, "DDS switch in progress. Sending false"

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1381
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v4, "DDS switch in progress"

    invoke-direct {v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .restart local v0       #exception:Ljava/lang/RuntimeException;
    goto :goto_0
.end method

.method public setSubscription(Lcom/android/internal/telephony/msim/SubscriptionData;)Z
    .locals 11
    .parameter "subData"

    .prologue
    const/4 v10, 0x1

    const/4 v7, 0x0

    .line 1283
    const/4 v5, 0x0

    .line 1289
    .local v5, ret:Z
    iget-boolean v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-eqz v8, :cond_0

    .line 1338
    :goto_0
    return v7

    .line 1293
    :cond_0
    iget-object v8, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    const-string v9, "NO CHANGE IN SUBSCRIPTION"

    aput-object v9, v8, v7

    .line 1294
    iget-object v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    const-string v8, "NO CHANGE IN SUBSCRIPTION"

    aput-object v8, v7, v10

    .line 1297
    invoke-static {}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_1
    if-ge v2, v3, :cond_4

    aget-object v6, v0, v2

    .line 1302
    .local v6, subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v7

    iget-object v8, p1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    invoke-virtual {v6}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->ordinal()I

    move-result v9

    aget-object v8, v8, v9

    invoke-virtual {v7, v8}, Lcom/android/internal/telephony/msim/Subscription;->equals(Lcom/android/internal/telephony/msim/Subscription;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 1303
    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionStatus(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    move-result-object v7

    sget-object v8, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v7, v8, :cond_3

    .line 1304
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Need to deactivate current SUB :"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1305
    new-instance v4, Lcom/android/internal/telephony/msim/Subscription;

    invoke-direct {v4}, Lcom/android/internal/telephony/msim/Subscription;-><init>()V

    .line 1306
    .local v4, newSub:Lcom/android/internal/telephony/msim/Subscription;
    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/android/internal/telephony/msim/Subscription;->copyFrom(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    .line 1307
    sget-object v7, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    iput-object v7, v4, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    .line 1308
    iget-object v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v7, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1315
    .end local v4           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    :cond_1
    :goto_2
    iget-object v7, p1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    invoke-virtual {v6}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->ordinal()I

    move-result v8

    aget-object v7, v7, v8

    iget-object v7, v7, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v8, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v7, v8, :cond_2

    .line 1317
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Need to activate new SUB : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/msim/SubscriptionManager;->logd(Ljava/lang/String;)V

    .line 1318
    new-instance v4, Lcom/android/internal/telephony/msim/Subscription;

    invoke-direct {v4}, Lcom/android/internal/telephony/msim/Subscription;-><init>()V

    .line 1319
    .restart local v4       #newSub:Lcom/android/internal/telephony/msim/Subscription;
    iget-object v7, p1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    invoke-virtual {v6}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->ordinal()I

    move-result v8

    aget-object v7, v7, v8

    invoke-virtual {v4, v7}, Lcom/android/internal/telephony/msim/Subscription;->copyFrom(Lcom/android/internal/telephony/msim/Subscription;)Lcom/android/internal/telephony/msim/Subscription;

    .line 1320
    iget-object v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v7, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1297
    .end local v4           #newSub:Lcom/android/internal/telephony/msim/Subscription;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 1309
    :cond_3
    invoke-direct {p0, v6}, Lcom/android/internal/telephony/msim/SubscriptionManager;->getCurrentSubscriptionStatus(Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    move-result-object v7

    sget-object v8, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v7, v8, :cond_1

    iget-object v7, p1, Lcom/android/internal/telephony/msim/SubscriptionData;->subscription:[Lcom/android/internal/telephony/msim/Subscription;

    invoke-virtual {v6}, Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;->ordinal()I

    move-result v8

    aget-object v7, v7, v8

    iget-object v7, v7, Lcom/android/internal/telephony/msim/Subscription;->subStatus:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    sget-object v8, Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/msim/Subscription$SubscriptionStatus;

    if-ne v7, v8, :cond_1

    goto :goto_2

    .line 1325
    .end local v6           #subId:Lcom/android/internal/telephony/msim/SubscriptionManager$SubscriptionId;
    :cond_4
    iget-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v7, :cond_5

    .line 1326
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->startNextPendingDeactivateRequests()Z

    move-result v1

    .line 1327
    .local v1, deactivateInProgress:Z
    if-eqz v1, :cond_7

    .line 1328
    iput-boolean v10, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    .line 1334
    .end local v1           #deactivateInProgress:Z
    :cond_5
    :goto_3
    iget-boolean v7, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-eqz v7, :cond_6

    .line 1336
    const/4 v5, 0x1

    :cond_6
    move v7, v5

    .line 1338
    goto/16 :goto_0

    .line 1330
    .restart local v1       #deactivateInProgress:Z
    :cond_7
    invoke-direct {p0}, Lcom/android/internal/telephony/msim/SubscriptionManager;->processActivateRequests()V

    goto :goto_3
.end method

.method public declared-synchronized unRegisterForSetSubscriptionCompleted(Landroid/os/Handler;)V
    .locals 1
    .parameter "h"

    .prologue
    .line 1453
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1454
    monitor-exit p0

    return-void

    .line 1453
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public unregisterForSubscriptionActivated(ILandroid/os/Handler;)V
    .locals 2
    .parameter "subId"
    .parameter "h"

    .prologue
    .line 1432
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v0, p1

    monitor-enter v1

    .line 1433
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 1434
    monitor-exit v1

    .line 1435
    return-void

    .line 1434
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public unregisterForSubscriptionDeactivated(ILandroid/os/Handler;)V
    .locals 2
    .parameter "subId"
    .parameter "h"

    .prologue
    .line 1407
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v0, p1

    monitor-enter v1

    .line 1408
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/msim/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 1409
    monitor-exit v1

    .line 1410
    return-void

    .line 1409
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
