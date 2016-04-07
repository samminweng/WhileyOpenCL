; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@V = global [6 x i32] [i32 6, i32 5, i32 2, i32 7, i32 3, i32 5], align 16
@sum_alice = global i32 0, align 4
@sum_bob = global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"Number of coins = %d\0A\00", align 1
@M = common global [6 x [6 x i32]] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [17 x i8] c"Alice take coin \00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"Bob take coin \00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"(%d, $%d)\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c", \00", align 1
@Y = common global [6 x [6 x i32]] zeroinitializer, align 16
@X = common global [6 x [6 x i32]] zeroinitializer, align 16
@Z = common global [6 x [6 x i32]] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [24 x i8] c"Alice's sum is Wrong!!!\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"Alice's sum <= Bob's sum!!!\00", align 1
@.str.8 = private unnamed_addr constant [54 x i8] c"\0AThe total amount of money (maximum) Alice get is %d.\00", align 1
@.str.9 = private unnamed_addr constant [52 x i8] c"\0AThe total amount of money (maximum) Bob get is %d.\00", align 1
@str = private unnamed_addr constant [2 x i8] c".\00"

; Function Attrs: nounwind uwtable
define void @init() #0 !dbg !4 {
entry:
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i32 6), !dbg !52
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !8, metadata !53), !dbg !54
  store <4 x i32> <i32 0, i32 1, i32 2, i32 3>, <4 x i32>* bitcast ([6 x i32]* @V to <4 x i32>*), align 16, !dbg !55, !tbaa !59
  store i32 4, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 4), align 16, !dbg !55, !tbaa !59
  store i32 5, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 5), align 4, !dbg !55, !tbaa !59
  ret void, !dbg !63
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @sumMoves() #0 !dbg !10 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !12, metadata !53), !dbg !64
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !13, metadata !53), !dbg !65
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !66
  br label %while.body, !dbg !67

while.body:                                       ; preds = %entry, %while.cond.backedge
  %i.033 = phi i32 [ 0, %entry ], [ %i.1, %while.cond.backedge ]
  %j.032 = phi i32 [ 5, %entry ], [ %j.1, %while.cond.backedge ]
  %alice.031 = phi i32 [ 1, %entry ], [ %alice.0.be, %while.cond.backedge ]
  %idxprom = sext i32 %j.032 to i64, !dbg !69
  %add = add nsw i32 %i.033, 1, !dbg !70
  %idxprom1 = sext i32 %add to i64, !dbg !69
  %arrayidx2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, i64 %idxprom, !dbg !69
  %0 = load i32, i32* %arrayidx2, align 4, !dbg !69, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !15, metadata !53), !dbg !71
  %sub = add nsw i32 %j.032, -1, !dbg !72
  %idxprom3 = sext i32 %sub to i64, !dbg !73
  %idxprom4 = sext i32 %i.033 to i64, !dbg !73
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, i64 %idxprom3, !dbg !73
  %1 = load i32, i32* %arrayidx6, align 4, !dbg !73, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !17, metadata !53), !dbg !74
  %cmp7 = icmp sgt i32 %0, %1, !dbg !75
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !13, metadata !53), !dbg !65
  %j.1 = select i1 %cmp7, i32 %sub, i32 %j.032, !dbg !77
  %i.1 = select i1 %cmp7, i32 %i.033, i32 %add, !dbg !77
  %idxprom4.pn = select i1 %cmp7, i64 %idxprom, i64 %idxprom4, !dbg !77
  %coin.0.in = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4.pn, !dbg !78
  %coin.0 = load i32, i32* %coin.0.in, align 4, !dbg !78, !tbaa !59
  %tobool = icmp eq i32 %alice.031, 0, !dbg !80
  br i1 %tobool, label %if.else14, label %if.then12, !dbg !82

if.then12:                                        ; preds = %while.body
  %2 = load i32, i32* @sum_alice, align 4, !dbg !83, !tbaa !59
  %add13 = add nsw i32 %2, %coin.0, !dbg !83
  store i32 %add13, i32* @sum_alice, align 4, !dbg !83, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !14, metadata !53), !dbg !66
  br label %while.cond.backedge, !dbg !85

if.else14:                                        ; preds = %while.body
  %3 = load i32, i32* @sum_bob, align 4, !dbg !86, !tbaa !59
  %add15 = add nsw i32 %3, %coin.0, !dbg !86
  store i32 %add15, i32* @sum_bob, align 4, !dbg !86, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !66
  br label %while.cond.backedge

while.cond.backedge:                              ; preds = %if.else14, %if.then12
  %alice.0.be = phi i32 [ 0, %if.then12 ], [ 1, %if.else14 ]
  %cmp = icmp sgt i32 %i.1, %j.1, !dbg !88
  br i1 %cmp, label %while.end, label %while.body, !dbg !67

while.end:                                        ; preds = %while.cond.backedge
  ret void, !dbg !89
}

; Function Attrs: nounwind uwtable
define void @printMoves() #0 !dbg !19 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !21, metadata !53), !dbg !90
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !22, metadata !53), !dbg !91
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !23, metadata !53), !dbg !92
  br label %while.body, !dbg !93

while.body:                                       ; preds = %entry, %if.end25
  %i.045 = phi i32 [ 0, %entry ], [ %i.1, %if.end25 ]
  %j.044 = phi i32 [ 5, %entry ], [ %j.1, %if.end25 ]
  %alice.043 = phi i8 [ 1, %entry ], [ %frombool, %if.end25 ]
  %idxprom = sext i32 %j.044 to i64, !dbg !95
  %add = add nsw i32 %i.045, 1, !dbg !96
  %idxprom1 = sext i32 %add to i64, !dbg !95
  %arrayidx2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, i64 %idxprom, !dbg !95
  %0 = load i32, i32* %arrayidx2, align 4, !dbg !95, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !25, metadata !53), !dbg !97
  %sub = add nsw i32 %j.044, -1, !dbg !98
  %idxprom3 = sext i32 %sub to i64, !dbg !99
  %idxprom4 = sext i32 %i.045 to i64, !dbg !99
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, i64 %idxprom3, !dbg !99
  %1 = load i32, i32* %arrayidx6, align 4, !dbg !99, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !27, metadata !53), !dbg !100
  %tobool = icmp ne i8 %alice.043, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.else, !dbg !103

if.then:                                          ; preds = %while.body
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  br label %if.end, !dbg !106

if.else:                                          ; preds = %while.body
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %cmp8 = icmp sgt i32 %0, %1, !dbg !109
  br i1 %cmp8, label %if.else14, label %if.then9, !dbg !111

if.then9:                                         ; preds = %if.end
  %arrayidx12 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4, !dbg !112
  %2 = load i32, i32* %arrayidx12, align 4, !dbg !112, !tbaa !59
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %add, i32 %2), !dbg !114
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !21, metadata !53), !dbg !90
  br label %if.end19, !dbg !115

if.else14:                                        ; preds = %if.end
  %add15 = add nsw i32 %j.044, 1, !dbg !116
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom, !dbg !118
  %3 = load i32, i32* %arrayidx17, align 4, !dbg !118, !tbaa !59
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %add15, i32 %3), !dbg !119
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !22, metadata !53), !dbg !91
  br label %if.end19

if.end19:                                         ; preds = %if.else14, %if.then9
  %j.1 = phi i32 [ %j.044, %if.then9 ], [ %sub, %if.else14 ]
  %i.1 = phi i32 [ %add, %if.then9 ], [ %i.045, %if.else14 ]
  br i1 %tobool, label %if.then21, label %if.else23, !dbg !120

if.then21:                                        ; preds = %if.end19
  %call22 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  br label %if.end25, !dbg !124

if.else23:                                        ; preds = %if.end19
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i64 0, i64 0)), !dbg !125
  br label %if.end25

if.end25:                                         ; preds = %if.else23, %if.then21
  %4 = zext i1 %tobool to i8, !dbg !127
  %frombool = xor i8 %4, 1, !dbg !127
  tail call void @llvm.dbg.value(metadata i8 %frombool, i64 0, metadata !23, metadata !53), !dbg !92
  %cmp = icmp sgt i32 %i.1, %j.1, !dbg !128
  br i1 %cmp, label %while.end, label %while.body, !dbg !93

while.end:                                        ; preds = %if.end25
  ret void, !dbg !129
}

; Function Attrs: nounwind uwtable
define i32 @maxMoney() #3 !dbg !28 {
entry:
  %polly.par.userContext237 = alloca {}, align 8
  %polly.par.LBPtr.i319 = alloca i64, align 8
  %polly.par.UBPtr.i320 = alloca i64, align 8
  %polly.par.LBPtr.i298 = alloca i64, align 8
  %polly.par.UBPtr.i299 = alloca i64, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !53), !dbg !130
  %0 = bitcast {}* %polly.par.userContext237 to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn, i8* %0, i32 0, i64 0, i64 6, i64 1) #6
  %1 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %1)
  %2 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2)
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #6
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %maxMoney_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %entry
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_exit4.i
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #6
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %maxMoney_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_exit4.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_exit4.i ]
  %7 = sub nsw i64 5, %polly.indvar.i
  %polly.loop_guard.i = icmp sgt i64 %7, -1
  br i1 %polly.loop_guard.i, label %polly.loop_preheader3.i, label %polly.loop_exit4.i

polly.loop_exit4.i.loopexit:                      ; preds = %polly.loop_header2.i
  br label %polly.loop_exit4.i

polly.loop_exit4.i:                               ; preds = %polly.loop_exit4.i.loopexit, %polly.loop_header.i
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

polly.loop_header2.i:                             ; preds = %polly.loop_preheader3.i, %polly.loop_header2.i
  %polly.indvar5.i = phi i64 [ 0, %polly.loop_preheader3.i ], [ %polly.indvar_next6.i, %polly.loop_header2.i ]
  %8 = mul i64 %polly.indvar5.i, 7
  %scevgep9.i = getelementptr i32, i32* %scevgep.i, i64 %8
  store i32 0, i32* %scevgep9.i, align 4, !alias.scope !131, !noalias !133, !llvm.mem.parallel_loop_access !139
  %polly.indvar_next6.i = add nuw nsw i64 %polly.indvar5.i, 1
  %polly.loop_cond8.i = icmp sgt i64 %polly.indvar5.i, %polly.adjust_ub7.i
  br i1 %polly.loop_cond8.i, label %polly.loop_exit4.i.loopexit, label %polly.loop_header2.i, !llvm.loop !139

polly.loop_preheader3.i:                          ; preds = %polly.loop_header.i
  %scevgep.i = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar.i
  %polly.adjust_ub7.i = add i64 %7, -1
  br label %polly.loop_header2.i

maxMoney_polly_subfn.exit.loopexit:               ; preds = %polly.par.checkNext.loopexit.i
  br label %maxMoney_polly_subfn.exit

maxMoney_polly_subfn.exit:                        ; preds = %maxMoney_polly_subfn.exit.loopexit, %entry
  call void @GOMP_loop_end_nowait() #6
  call void @llvm.lifetime.end(i64 8, i8* %1)
  call void @llvm.lifetime.end(i64 8, i8* %2)
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn_10, i8* %0, i32 0, i64 0, i64 6, i64 1) #6
  %9 = bitcast i64* %polly.par.LBPtr.i298 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %9)
  %10 = bitcast i64* %polly.par.UBPtr.i299 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %10)
  %11 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i298, i64* nonnull %polly.par.UBPtr.i299) #6
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %maxMoney_polly_subfn_10.exit, label %polly.par.loadIVBounds.i304.preheader

polly.par.loadIVBounds.i304.preheader:            ; preds = %maxMoney_polly_subfn.exit
  br label %polly.par.loadIVBounds.i304

polly.par.checkNext.loopexit.i300:                ; preds = %polly.loop_exit4.i310
  %13 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i298, i64* nonnull %polly.par.UBPtr.i299) #6
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %maxMoney_polly_subfn_10.exit.loopexit, label %polly.par.loadIVBounds.i304

polly.par.loadIVBounds.i304:                      ; preds = %polly.par.loadIVBounds.i304.preheader, %polly.par.checkNext.loopexit.i300
  %polly.par.UB.i301 = load i64, i64* %polly.par.UBPtr.i299, align 8
  %polly.par.LB.i302 = load i64, i64* %polly.par.LBPtr.i298, align 8
  %polly.adjust_ub.i303 = add i64 %polly.par.UB.i301, -2
  br label %polly.loop_header.i307

polly.loop_header.i307:                           ; preds = %polly.loop_exit4.i310, %polly.par.loadIVBounds.i304
  %polly.indvar.i305 = phi i64 [ %polly.par.LB.i302, %polly.par.loadIVBounds.i304 ], [ %polly.indvar_next.i308, %polly.loop_exit4.i310 ]
  %15 = sub nsw i64 5, %polly.indvar.i305
  %polly.loop_guard.i306 = icmp sgt i64 %15, -1
  br i1 %polly.loop_guard.i306, label %polly.loop_preheader3.i318, label %polly.loop_exit4.i310

polly.loop_exit4.i310.loopexit:                   ; preds = %polly.loop_header2.i315
  br label %polly.loop_exit4.i310

polly.loop_exit4.i310:                            ; preds = %polly.loop_exit4.i310.loopexit, %polly.loop_header.i307
  %polly.indvar_next.i308 = add nsw i64 %polly.indvar.i305, 1
  %polly.loop_cond.i309 = icmp sgt i64 %polly.indvar.i305, %polly.adjust_ub.i303
  br i1 %polly.loop_cond.i309, label %polly.par.checkNext.loopexit.i300, label %polly.loop_header.i307

polly.loop_header2.i315:                          ; preds = %polly.loop_preheader3.i318, %polly.loop_header2.i315
  %polly.indvar5.i311 = phi i64 [ 0, %polly.loop_preheader3.i318 ], [ %polly.indvar_next6.i313, %polly.loop_header2.i315 ]
  %16 = mul i64 %polly.indvar5.i311, 7
  %scevgep9.i312 = getelementptr i32, i32* %scevgep.i316, i64 %16
  store i32 0, i32* %scevgep9.i312, align 4, !alias.scope !140, !noalias !142, !llvm.mem.parallel_loop_access !148
  %polly.indvar_next6.i313 = add nuw nsw i64 %polly.indvar5.i311, 1
  %polly.loop_cond8.i314 = icmp sgt i64 %polly.indvar5.i311, %polly.adjust_ub7.i317
  br i1 %polly.loop_cond8.i314, label %polly.loop_exit4.i310.loopexit, label %polly.loop_header2.i315, !llvm.loop !148

polly.loop_preheader3.i318:                       ; preds = %polly.loop_header.i307
  %scevgep.i316 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar.i305
  %polly.adjust_ub7.i317 = add i64 %15, -1
  br label %polly.loop_header2.i315

maxMoney_polly_subfn_10.exit.loopexit:            ; preds = %polly.par.checkNext.loopexit.i300
  br label %maxMoney_polly_subfn_10.exit

maxMoney_polly_subfn_10.exit:                     ; preds = %maxMoney_polly_subfn_10.exit.loopexit, %maxMoney_polly_subfn.exit
  call void @GOMP_loop_end_nowait() #6
  call void @llvm.lifetime.end(i64 8, i8* %9)
  call void @llvm.lifetime.end(i64 8, i8* %10)
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn_11, i8* %0, i32 0, i64 0, i64 6, i64 1) #6
  %17 = bitcast i64* %polly.par.LBPtr.i319 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %17)
  %18 = bitcast i64* %polly.par.UBPtr.i320 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %18)
  %19 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i319, i64* nonnull %polly.par.UBPtr.i320) #6
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %maxMoney_polly_subfn_11.exit, label %polly.par.loadIVBounds.i325.preheader

polly.par.loadIVBounds.i325.preheader:            ; preds = %maxMoney_polly_subfn_10.exit
  br label %polly.par.loadIVBounds.i325

polly.par.checkNext.loopexit.i321:                ; preds = %polly.loop_exit4.i331
  %21 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i319, i64* nonnull %polly.par.UBPtr.i320) #6
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %maxMoney_polly_subfn_11.exit.loopexit, label %polly.par.loadIVBounds.i325

polly.par.loadIVBounds.i325:                      ; preds = %polly.par.loadIVBounds.i325.preheader, %polly.par.checkNext.loopexit.i321
  %polly.par.UB.i322 = load i64, i64* %polly.par.UBPtr.i320, align 8
  %polly.par.LB.i323 = load i64, i64* %polly.par.LBPtr.i319, align 8
  %polly.adjust_ub.i324 = add i64 %polly.par.UB.i322, -2
  br label %polly.loop_header.i328

polly.loop_header.i328:                           ; preds = %polly.loop_exit4.i331, %polly.par.loadIVBounds.i325
  %polly.indvar.i326 = phi i64 [ %polly.par.LB.i323, %polly.par.loadIVBounds.i325 ], [ %polly.indvar_next.i329, %polly.loop_exit4.i331 ]
  %23 = sub nsw i64 5, %polly.indvar.i326
  %polly.loop_guard.i327 = icmp sgt i64 %23, -1
  br i1 %polly.loop_guard.i327, label %polly.loop_preheader3.i339, label %polly.loop_exit4.i331

polly.loop_exit4.i331.loopexit:                   ; preds = %polly.loop_header2.i336
  br label %polly.loop_exit4.i331

polly.loop_exit4.i331:                            ; preds = %polly.loop_exit4.i331.loopexit, %polly.loop_header.i328
  %polly.indvar_next.i329 = add nsw i64 %polly.indvar.i326, 1
  %polly.loop_cond.i330 = icmp sgt i64 %polly.indvar.i326, %polly.adjust_ub.i324
  br i1 %polly.loop_cond.i330, label %polly.par.checkNext.loopexit.i321, label %polly.loop_header.i328

polly.loop_header2.i336:                          ; preds = %polly.loop_preheader3.i339, %polly.loop_header2.i336
  %polly.indvar5.i332 = phi i64 [ 0, %polly.loop_preheader3.i339 ], [ %polly.indvar_next6.i334, %polly.loop_header2.i336 ]
  %24 = mul i64 %polly.indvar5.i332, 7
  %scevgep9.i333 = getelementptr i32, i32* %scevgep.i337, i64 %24
  store i32 0, i32* %scevgep9.i333, align 4, !alias.scope !149, !noalias !151, !llvm.mem.parallel_loop_access !157
  %polly.indvar_next6.i334 = add nuw nsw i64 %polly.indvar5.i332, 1
  %polly.loop_cond8.i335 = icmp sgt i64 %polly.indvar5.i332, %polly.adjust_ub7.i338
  br i1 %polly.loop_cond8.i335, label %polly.loop_exit4.i331.loopexit, label %polly.loop_header2.i336, !llvm.loop !157

polly.loop_preheader3.i339:                       ; preds = %polly.loop_header.i328
  %scevgep.i337 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar.i326
  %polly.adjust_ub7.i338 = add i64 %23, -1
  br label %polly.loop_header2.i336

maxMoney_polly_subfn_11.exit.loopexit:            ; preds = %polly.par.checkNext.loopexit.i321
  br label %maxMoney_polly_subfn_11.exit

maxMoney_polly_subfn_11.exit:                     ; preds = %maxMoney_polly_subfn_11.exit.loopexit, %maxMoney_polly_subfn_10.exit
  call void @GOMP_loop_end_nowait() #6
  call void @llvm.lifetime.end(i64 8, i8* %17)
  call void @llvm.lifetime.end(i64 8, i8* %18)
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  %_p_scalar_.prol = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 0), align 16
  br label %polly.loop_header

polly.exiting:                                    ; preds = %polly.loop_exit284
  %25 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !158, !tbaa !59
  ret i32 %25, !dbg !159

polly.loop_header:                                ; preds = %polly.loop_exit284, %maxMoney_polly_subfn_11.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %polly.loop_exit284 ], [ 7, %maxMoney_polly_subfn_11.exit ]
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit284 ], [ 0, %maxMoney_polly_subfn_11.exit ]
  %26 = icmp sgt i64 %polly.indvar, 0
  br i1 %26, label %polly.then, label %polly.merge

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header239
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.then.split, %polly.merge.loopexit.unr-lcssa
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header
  %27 = sub nsw i64 1, %polly.indvar
  %28 = icmp slt i64 %27, 0
  %29 = select i1 %28, i64 0, i64 %27
  %30 = sub nsw i64 5, %polly.indvar
  %31 = icmp sgt i64 %30, 4
  %32 = select i1 %31, i64 4, i64 %30
  %polly.loop_guard = icmp sgt i64 %29, %32
  br i1 %polly.loop_guard, label %polly.loop_exit254, label %polly.loop_preheader253

polly.loop_exit254.loopexit:                      ; preds = %polly.loop_header252
  br label %polly.loop_exit254

polly.loop_exit254:                               ; preds = %polly.loop_exit254.loopexit, %polly.merge
  %33 = icmp sgt i64 %30, 3
  %34 = select i1 %33, i64 3, i64 %30
  %polly.loop_guard268 = icmp sgt i64 %34, -1
  br i1 %polly.loop_guard268, label %polly.loop_preheader266, label %polly.loop_exit267

polly.loop_exit267.loopexit:                      ; preds = %polly.loop_header265
  br label %polly.loop_exit267

polly.loop_exit267:                               ; preds = %polly.loop_exit267.loopexit, %polly.loop_exit254
  %35 = sub nsw i64 2, %polly.indvar
  %36 = icmp slt i64 %35, 0
  %37 = select i1 %36, i64 0, i64 %35
  %polly.loop_guard285 = icmp sgt i64 %37, %30
  br i1 %polly.loop_guard285, label %polly.loop_exit284, label %polly.loop_preheader283

polly.loop_exit284.loopexit:                      ; preds = %polly.loop_header282
  br label %polly.loop_exit284

polly.loop_exit284:                               ; preds = %polly.loop_exit284.loopexit, %polly.loop_exit267
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %exitcond340 = icmp eq i64 %polly.indvar_next, 7
  br i1 %exitcond340, label %polly.exiting, label %polly.loop_header

polly.then:                                       ; preds = %polly.loop_header
  %38 = sub i64 7, %polly.indvar
  %39 = add nsw i64 %polly.indvar, -1
  %xtraiter = and i64 %38, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %polly.then.split, label %polly.loop_header239.prol

polly.loop_header239.prol:                        ; preds = %polly.then
  %40 = add nsw i64 %polly.indvar, -1
  %scevgep245.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %40
  %_p_scalar_246.prol = load i32, i32* %scevgep245.prol, align 4, !alias.scope !160, !noalias !162
  %p_add100.prol = add nsw i32 %_p_scalar_246.prol, %_p_scalar_.prol, !dbg !168
  %41 = add nsw i64 %polly.indvar, -1
  %scevgep247.prol = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %41
  %_p_scalar_248.prol = load i32, i32* %scevgep247.prol, align 4, !alias.scope !164, !noalias !176
  %scevgep249.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %40
  %_p_scalar_250.prol = load i32, i32* %scevgep249.prol, align 4, !alias.scope !163, !noalias !177
  %p_add107.prol = add nsw i32 %_p_scalar_250.prol, %_p_scalar_248.prol, !dbg !178
  %p_cmp108.prol = icmp sgt i32 %p_add100.prol, %p_add107.prol, !dbg !179
  %polly.storemerge.prol = select i1 %p_cmp108.prol, i32 %p_add100.prol, i32 %p_add107.prol, !dbg !180
  %scevgep251.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %40
  store i32 %polly.storemerge.prol, i32* %scevgep251.prol, align 4, !alias.scope !166, !noalias !181
  br label %polly.then.split

polly.then.split:                                 ; preds = %polly.then, %polly.loop_header239.prol
  %polly.indvar242.unr = phi i64 [ 0, %polly.then ], [ 1, %polly.loop_header239.prol ]
  %42 = icmp eq i64 %polly.indvar, 6
  br i1 %42, label %polly.merge.loopexit, label %polly.then.split.split

polly.then.split.split:                           ; preds = %polly.then.split
  br label %polly.loop_header239

polly.loop_header239:                             ; preds = %polly.loop_header239, %polly.then.split.split
  %polly.indvar242 = phi i64 [ %polly.indvar242.unr, %polly.then.split.split ], [ %polly.indvar_next243.1, %polly.loop_header239 ]
  %scevgep = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar242
  %_p_scalar_ = load i32, i32* %scevgep, align 4, !alias.scope !164, !noalias !176
  %43 = mul nuw nsw i64 %polly.indvar242, 7
  %44 = add nsw i64 %43, %39
  %scevgep245 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %44
  %_p_scalar_246 = load i32, i32* %scevgep245, align 4, !alias.scope !160, !noalias !162
  %p_add100 = add nsw i32 %_p_scalar_246, %_p_scalar_, !dbg !168
  %45 = add nsw i64 %polly.indvar242, %39
  %scevgep247 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %45
  %_p_scalar_248 = load i32, i32* %scevgep247, align 4, !alias.scope !164, !noalias !176
  %scevgep249 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %44
  %_p_scalar_250 = load i32, i32* %scevgep249, align 4, !alias.scope !163, !noalias !177
  %p_add107 = add nsw i32 %_p_scalar_250, %_p_scalar_248, !dbg !178
  %p_cmp108 = icmp sgt i32 %p_add100, %p_add107, !dbg !179
  %polly.storemerge = select i1 %p_cmp108, i32 %p_add100, i32 %p_add107, !dbg !180
  %scevgep251 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %44
  store i32 %polly.storemerge, i32* %scevgep251, align 4, !alias.scope !166, !noalias !181
  %polly.indvar_next243 = add nuw nsw i64 %polly.indvar242, 1
  %scevgep.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar_next243
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !164, !noalias !176
  %46 = mul nuw nsw i64 %polly.indvar_next243, 7
  %47 = add nsw i64 %46, %39
  %scevgep245.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %47
  %_p_scalar_246.1 = load i32, i32* %scevgep245.1, align 4, !alias.scope !160, !noalias !162
  %p_add100.1 = add nsw i32 %_p_scalar_246.1, %_p_scalar_.1, !dbg !168
  %48 = add i64 %polly.indvar242, %polly.indvar
  %scevgep247.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %48
  %_p_scalar_248.1 = load i32, i32* %scevgep247.1, align 4, !alias.scope !164, !noalias !176
  %scevgep249.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %47
  %_p_scalar_250.1 = load i32, i32* %scevgep249.1, align 4, !alias.scope !163, !noalias !177
  %p_add107.1 = add nsw i32 %_p_scalar_250.1, %_p_scalar_248.1, !dbg !178
  %p_cmp108.1 = icmp sgt i32 %p_add100.1, %p_add107.1, !dbg !179
  %polly.storemerge.1 = select i1 %p_cmp108.1, i32 %p_add100.1, i32 %p_add107.1, !dbg !180
  %scevgep251.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %47
  store i32 %polly.storemerge.1, i32* %scevgep251.1, align 4, !alias.scope !166, !noalias !181
  %polly.indvar_next243.1 = add nsw i64 %polly.indvar242, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next243.1, %indvars.iv
  br i1 %exitcond.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header239

polly.loop_header252:                             ; preds = %polly.loop_header252, %polly.loop_preheader253
  %polly.indvar255 = phi i64 [ %29, %polly.loop_preheader253 ], [ %polly.indvar_next256, %polly.loop_header252 ]
  %49 = mul i64 %polly.indvar255, 7
  %scevgep260 = getelementptr i32, i32* %scevgep259, i64 %49
  %_p_scalar_261 = load i32, i32* %scevgep260, align 4, !alias.scope !166, !noalias !181, !llvm.mem.parallel_loop_access !182
  %scevgep263 = getelementptr i32, i32* %scevgep262, i64 %49
  store i32 %_p_scalar_261, i32* %scevgep263, align 4, !alias.scope !165, !noalias !183, !llvm.mem.parallel_loop_access !182
  %polly.indvar_next256 = add nuw nsw i64 %polly.indvar255, 1
  %polly.loop_cond258 = icmp sgt i64 %polly.indvar255, %polly.adjust_ub257
  br i1 %polly.loop_cond258, label %polly.loop_exit254.loopexit, label %polly.loop_header252, !llvm.loop !182

polly.loop_preheader253:                          ; preds = %polly.merge
  %scevgep259 = getelementptr i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), i64 %polly.indvar
  %scevgep262 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub257 = add i64 %32, -1
  br label %polly.loop_header252

polly.loop_header265:                             ; preds = %polly.loop_header265, %polly.loop_preheader266
  %polly.indvar269 = phi i64 [ 0, %polly.loop_preheader266 ], [ %polly.indvar_next270, %polly.loop_header265 ]
  %50 = mul nuw nsw i64 %polly.indvar269, 7
  %scevgep274 = getelementptr i32, i32* %scevgep273, i64 %50
  %_p_scalar_275 = load i32, i32* %scevgep274, align 4, !alias.scope !166, !noalias !181, !llvm.mem.parallel_loop_access !184
  %scevgep277 = getelementptr i32, i32* %scevgep276, i64 %50
  %scevgep279 = getelementptr i32, i32* %scevgep278, i64 %50
  %_p_scalar_280 = load i32, i32* %scevgep279, align 4, !alias.scope !165, !noalias !183, !llvm.mem.parallel_loop_access !184
  %p_cmp42 = icmp sgt i32 %_p_scalar_275, %_p_scalar_280, !dbg !185
  %p_. = select i1 %p_cmp42, i32 %_p_scalar_280, i32 %_p_scalar_275, !dbg !192
  store i32 %p_., i32* %scevgep277, align 4, !alias.scope !160, !noalias !162, !llvm.mem.parallel_loop_access !184
  %polly.indvar_next270 = add nuw nsw i64 %polly.indvar269, 1
  %polly.loop_cond272 = icmp sgt i64 %polly.indvar269, %polly.adjust_ub271
  br i1 %polly.loop_cond272, label %polly.loop_exit267.loopexit, label %polly.loop_header265, !llvm.loop !184

polly.loop_preheader266:                          ; preds = %polly.loop_exit254
  %scevgep273 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 2, i64 %polly.indvar
  %scevgep276 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  %scevgep278 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub271 = add i64 %34, -1
  br label %polly.loop_header265

polly.loop_header282:                             ; preds = %polly.loop_header282, %polly.loop_preheader283
  %polly.indvar286 = phi i64 [ %37, %polly.loop_preheader283 ], [ %polly.indvar_next287, %polly.loop_header282 ]
  %51 = mul i64 %polly.indvar286, 7
  %scevgep291 = getelementptr i32, i32* %scevgep290, i64 %51
  %_p_scalar_292 = load i32, i32* %scevgep291, align 4, !alias.scope !166, !noalias !181, !llvm.mem.parallel_loop_access !193
  %scevgep294 = getelementptr i32, i32* %scevgep293, i64 %51
  %scevgep296 = getelementptr i32, i32* %scevgep295, i64 %51
  %_p_scalar_297 = load i32, i32* %scevgep296, align 4, !alias.scope !165, !noalias !183, !llvm.mem.parallel_loop_access !193
  %p_cmp78 = icmp sgt i32 %_p_scalar_292, %_p_scalar_297, !dbg !194
  %p_.204 = select i1 %p_cmp78, i32 %_p_scalar_297, i32 %_p_scalar_292, !dbg !198
  store i32 %p_.204, i32* %scevgep294, align 4, !alias.scope !163, !noalias !177, !llvm.mem.parallel_loop_access !193
  %polly.indvar_next287 = add nuw nsw i64 %polly.indvar286, 1
  %polly.loop_cond289 = icmp slt i64 %polly.indvar286, %30
  br i1 %polly.loop_cond289, label %polly.loop_header282, label %polly.loop_exit284.loopexit, !llvm.loop !193

polly.loop_preheader283:                          ; preds = %polly.loop_exit267
  %scevgep290 = getelementptr i32, i32* getelementptr ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 128102389400760775, i64 0, i64 2), i64 %polly.indvar
  %scevgep293 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar
  %scevgep295 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  br label %polly.loop_header282
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %call = tail call i32 @maxMoney(), !dbg !199
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !12, metadata !53), !dbg !200
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !13, metadata !53), !dbg !202
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !203
  br label %while.body.i, !dbg !204

while.body.i:                                     ; preds = %while.cond.backedge.i, %entry
  %i.033.i = phi i32 [ 0, %entry ], [ %i.1.i, %while.cond.backedge.i ], !dbg !205
  %j.032.i = phi i32 [ 5, %entry ], [ %j.1.i, %while.cond.backedge.i ], !dbg !205
  %alice.031.i = phi i32 [ 1, %entry ], [ %alice.0.be.i, %while.cond.backedge.i ], !dbg !205
  %idxprom.i = sext i32 %j.032.i to i64, !dbg !206
  %add.i = add nsw i32 %i.033.i, 1, !dbg !207
  %idxprom1.i = sext i32 %add.i to i64, !dbg !206
  %arrayidx2.i = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1.i, i64 %idxprom.i, !dbg !206
  %0 = load i32, i32* %arrayidx2.i, align 4, !dbg !206, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !15, metadata !53), !dbg !208
  %sub.i = add nsw i32 %j.032.i, -1, !dbg !209
  %idxprom3.i = sext i32 %sub.i to i64, !dbg !210
  %idxprom4.i = sext i32 %i.033.i to i64, !dbg !210
  %arrayidx6.i = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4.i, i64 %idxprom3.i, !dbg !210
  %1 = load i32, i32* %arrayidx6.i, align 4, !dbg !210, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !17, metadata !53), !dbg !211
  %cmp7.i = icmp sgt i32 %0, %1, !dbg !212
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !13, metadata !53), !dbg !202
  %j.1.i = select i1 %cmp7.i, i32 %sub.i, i32 %j.032.i, !dbg !213
  %i.1.i = select i1 %cmp7.i, i32 %i.033.i, i32 %add.i, !dbg !213
  %idxprom4.pn.i = select i1 %cmp7.i, i64 %idxprom.i, i64 %idxprom4.i, !dbg !213
  %coin.0.in.i = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4.pn.i, !dbg !214
  %coin.0.i = load i32, i32* %coin.0.in.i, align 4, !dbg !214, !tbaa !59
  %tobool.i = icmp eq i32 %alice.031.i, 0, !dbg !215
  br i1 %tobool.i, label %if.else14.i, label %if.then12.i, !dbg !216

if.then12.i:                                      ; preds = %while.body.i
  %2 = load i32, i32* @sum_alice, align 4, !dbg !217, !tbaa !59
  %add13.i = add nsw i32 %2, %coin.0.i, !dbg !217
  store i32 %add13.i, i32* @sum_alice, align 4, !dbg !217, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !14, metadata !53), !dbg !203
  br label %while.cond.backedge.i, !dbg !218

if.else14.i:                                      ; preds = %while.body.i
  %3 = load i32, i32* @sum_bob, align 4, !dbg !219, !tbaa !59
  %add15.i = add nsw i32 %3, %coin.0.i, !dbg !219
  store i32 %add15.i, i32* @sum_bob, align 4, !dbg !219, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !203
  br label %while.cond.backedge.i, !dbg !205

while.cond.backedge.i:                            ; preds = %if.else14.i, %if.then12.i
  %alice.0.be.i = phi i32 [ 0, %if.then12.i ], [ 1, %if.else14.i ], !dbg !205
  %cmp.i = icmp sgt i32 %i.1.i, %j.1.i, !dbg !220
  br i1 %cmp.i, label %sumMoves.exit, label %while.body.i, !dbg !204

sumMoves.exit:                                    ; preds = %while.cond.backedge.i
  %4 = load i32, i32* @sum_alice, align 4, !dbg !221, !tbaa !59
  %5 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !223, !tbaa !59
  %cmp = icmp eq i32 %4, %5, !dbg !224
  br i1 %cmp, label %if.end, label %if.then, !dbg !225

if.then:                                          ; preds = %sumMoves.exit
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0)), !dbg !226
  tail call void @exit(i32 -1) #8, !dbg !228
  unreachable, !dbg !228

if.end:                                           ; preds = %sumMoves.exit
  %6 = load i32, i32* @sum_bob, align 4, !dbg !229, !tbaa !59
  %cmp2 = icmp slt i32 %4, %6, !dbg !231
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !232

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0)), !dbg !233
  tail call void @exit(i32 -1) #8, !dbg !235
  unreachable, !dbg !235

if.end5:                                          ; preds = %if.end
  %call6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i64 0, i64 0), i32 %4), !dbg !236
  %7 = load i32, i32* @sum_bob, align 4, !dbg !237, !tbaa !59
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0), i32 %7), !dbg !238
  ret i32 0, !dbg !239
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #6

define internal void @maxMoney_polly_subfn(i8* nocapture readnone %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %2 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = sub nsw i64 5, %polly.indvar
  %polly.loop_guard = icmp sgt i64 %4, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader3, label %polly.loop_exit4

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_header2
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header2:                               ; preds = %polly.loop_header2, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_header2 ]
  %5 = mul i64 %polly.indvar5, 7
  %scevgep9 = getelementptr i32, i32* %scevgep, i64 %5
  store i32 0, i32* %scevgep9, align 4, !alias.scope !160, !noalias !162, !llvm.mem.parallel_loop_access !139
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %polly.loop_cond8 = icmp sgt i64 %polly.indvar5, %polly.adjust_ub7
  br i1 %polly.loop_cond8, label %polly.loop_exit4.loopexit, label %polly.loop_header2, !llvm.loop !139

polly.loop_preheader3:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub7 = add i64 %4, -1
  br label %polly.loop_header2
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @maxMoney_polly_subfn_10(i8* nocapture readnone %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %2 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = sub nsw i64 5, %polly.indvar
  %polly.loop_guard = icmp sgt i64 %4, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader3, label %polly.loop_exit4

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_header2
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header2:                               ; preds = %polly.loop_header2, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_header2 ]
  %5 = mul i64 %polly.indvar5, 7
  %scevgep9 = getelementptr i32, i32* %scevgep, i64 %5
  store i32 0, i32* %scevgep9, align 4, !alias.scope !165, !noalias !183, !llvm.mem.parallel_loop_access !148
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %polly.loop_cond8 = icmp sgt i64 %polly.indvar5, %polly.adjust_ub7
  br i1 %polly.loop_cond8, label %polly.loop_exit4.loopexit, label %polly.loop_header2, !llvm.loop !148

polly.loop_preheader3:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub7 = add i64 %4, -1
  br label %polly.loop_header2
}

define internal void @maxMoney_polly_subfn_11(i8* nocapture readnone %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %2 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = sub nsw i64 5, %polly.indvar
  %polly.loop_guard = icmp sgt i64 %4, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader3, label %polly.loop_exit4

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_header2
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header2:                               ; preds = %polly.loop_header2, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_header2 ]
  %5 = mul i64 %polly.indvar5, 7
  %scevgep9 = getelementptr i32, i32* %scevgep, i64 %5
  store i32 0, i32* %scevgep9, align 4, !alias.scope !163, !noalias !177, !llvm.mem.parallel_loop_access !157
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %polly.loop_cond8 = icmp sgt i64 %polly.indvar5, %polly.adjust_ub7
  br i1 %polly.loop_cond8, label %polly.loop_exit4.loopexit, label %polly.loop_header2, !llvm.loop !157

polly.loop_preheader3:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub7 = add i64 %4, -1
  br label %polly.loop_header2
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { "polly.skip.fn" }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!49, !50}
!llvm.ident = !{!51}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3, globals: !36)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/handwritten")
!2 = !{}
!3 = !{!4, !10, !19, !28, !35}
!4 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 25, type: !5, isLocal: false, isDefinition: true, scopeLine: 25, isOptimized: true, variables: !7)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = !{!8}
!8 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 26, type: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = distinct !DISubprogram(name: "sumMoves", scope: !1, file: !1, line: 34, type: !5, isLocal: false, isDefinition: true, scopeLine: 34, isOptimized: true, variables: !11)
!11 = !{!12, !13, !14, !15, !17, !18}
!12 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 35, type: !9)
!13 = !DILocalVariable(name: "j", scope: !10, file: !1, line: 35, type: !9)
!14 = !DILocalVariable(name: "alice", scope: !10, file: !1, line: 36, type: !9)
!15 = !DILocalVariable(name: "P1", scope: !16, file: !1, line: 38, type: !9)
!16 = distinct !DILexicalBlock(scope: !10, file: !1, line: 37, column: 17)
!17 = !DILocalVariable(name: "P2", scope: !16, file: !1, line: 39, type: !9)
!18 = !DILocalVariable(name: "coin", scope: !16, file: !1, line: 40, type: !9)
!19 = distinct !DISubprogram(name: "printMoves", scope: !1, file: !1, line: 62, type: !5, isLocal: false, isDefinition: true, scopeLine: 62, isOptimized: true, variables: !20)
!20 = !{!21, !22, !23, !25, !27}
!21 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 63, type: !9)
!22 = !DILocalVariable(name: "j", scope: !19, file: !1, line: 63, type: !9)
!23 = !DILocalVariable(name: "alice", scope: !19, file: !1, line: 64, type: !24)
!24 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!25 = !DILocalVariable(name: "P1", scope: !26, file: !1, line: 66, type: !9)
!26 = distinct !DILexicalBlock(scope: !19, file: !1, line: 65, column: 17)
!27 = !DILocalVariable(name: "P2", scope: !26, file: !1, line: 67, type: !9)
!28 = distinct !DISubprogram(name: "maxMoney", scope: !1, file: !1, line: 91, type: !29, isLocal: false, isDefinition: true, scopeLine: 91, isOptimized: true, variables: !31)
!29 = !DISubroutineType(types: !30)
!30 = !{!9}
!31 = !{!32, !33, !34}
!32 = !DILocalVariable(name: "s", scope: !28, file: !1, line: 92, type: !9)
!33 = !DILocalVariable(name: "i", scope: !28, file: !1, line: 92, type: !9)
!34 = !DILocalVariable(name: "j", scope: !28, file: !1, line: 92, type: !9)
!35 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 142, type: !29, isLocal: false, isDefinition: true, scopeLine: 142, isOptimized: true, variables: !2)
!36 = !{!37, !41, !42, !43, !46, !47, !48}
!37 = !DIGlobalVariable(name: "V", scope: !0, file: !1, line: 14, type: !38, isLocal: false, isDefinition: true, variable: [6 x i32]* @V)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, align: 32, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 6)
!41 = !DIGlobalVariable(name: "sum_alice", scope: !0, file: !1, line: 23, type: !9, isLocal: false, isDefinition: true, variable: i32* @sum_alice)
!42 = !DIGlobalVariable(name: "sum_bob", scope: !0, file: !1, line: 23, type: !9, isLocal: false, isDefinition: true, variable: i32* @sum_bob)
!43 = !DIGlobalVariable(name: "M", scope: !0, file: !1, line: 17, type: !44, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @M)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 1152, align: 32, elements: !45)
!45 = !{!40, !40}
!46 = !DIGlobalVariable(name: "X", scope: !0, file: !1, line: 20, type: !44, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @X)
!47 = !DIGlobalVariable(name: "Y", scope: !0, file: !1, line: 21, type: !44, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Y)
!48 = !DIGlobalVariable(name: "Z", scope: !0, file: !1, line: 22, type: !44, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Z)
!49 = !{i32 2, !"Dwarf Version", i32 4}
!50 = !{i32 2, !"Debug Info Version", i32 3}
!51 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!52 = !DILocation(line: 28, column: 2, scope: !4)
!53 = !DIExpression()
!54 = !DILocation(line: 26, column: 6, scope: !4)
!55 = !DILocation(line: 30, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 29, column: 26)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 29, column: 2)
!58 = distinct !DILexicalBlock(scope: !4, file: !1, line: 29, column: 2)
!59 = !{!60, !60, i64 0}
!60 = !{!"int", !61, i64 0}
!61 = !{!"omnipotent char", !62, i64 0}
!62 = !{!"Simple C/C++ TBAA"}
!63 = !DILocation(line: 32, column: 1, scope: !4)
!64 = !DILocation(line: 35, column: 6, scope: !10)
!65 = !DILocation(line: 35, column: 13, scope: !10)
!66 = !DILocation(line: 36, column: 6, scope: !10)
!67 = !DILocation(line: 37, column: 2, scope: !68)
!68 = !DILexicalBlockFile(scope: !10, file: !1, discriminator: 1)
!69 = !DILocation(line: 38, column: 12, scope: !16)
!70 = !DILocation(line: 38, column: 16, scope: !16)
!71 = !DILocation(line: 38, column: 7, scope: !16)
!72 = !DILocation(line: 39, column: 19, scope: !16)
!73 = !DILocation(line: 39, column: 12, scope: !16)
!74 = !DILocation(line: 39, column: 7, scope: !16)
!75 = !DILocation(line: 41, column: 10, scope: !76)
!76 = distinct !DILexicalBlock(scope: !16, file: !1, line: 41, column: 7)
!77 = !DILocation(line: 41, column: 7, scope: !16)
!78 = !DILocation(line: 43, column: 11, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !1, line: 41, column: 17)
!80 = !DILocation(line: 50, column: 7, scope: !81)
!81 = distinct !DILexicalBlock(scope: !16, file: !1, line: 50, column: 7)
!82 = !DILocation(line: 50, column: 7, scope: !16)
!83 = !DILocation(line: 51, column: 14, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !1, line: 50, column: 14)
!85 = !DILocation(line: 53, column: 3, scope: !84)
!86 = !DILocation(line: 54, column: 12, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !1, line: 53, column: 10)
!88 = !DILocation(line: 37, column: 11, scope: !68)
!89 = !DILocation(line: 59, column: 1, scope: !10)
!90 = !DILocation(line: 63, column: 6, scope: !19)
!91 = !DILocation(line: 63, column: 13, scope: !19)
!92 = !DILocation(line: 64, column: 7, scope: !19)
!93 = !DILocation(line: 65, column: 2, scope: !94)
!94 = !DILexicalBlockFile(scope: !19, file: !1, discriminator: 1)
!95 = !DILocation(line: 66, column: 12, scope: !26)
!96 = !DILocation(line: 66, column: 16, scope: !26)
!97 = !DILocation(line: 66, column: 7, scope: !26)
!98 = !DILocation(line: 67, column: 19, scope: !26)
!99 = !DILocation(line: 67, column: 12, scope: !26)
!100 = !DILocation(line: 67, column: 7, scope: !26)
!101 = !DILocation(line: 68, column: 7, scope: !102)
!102 = distinct !DILexicalBlock(scope: !26, file: !1, line: 68, column: 7)
!103 = !DILocation(line: 68, column: 7, scope: !26)
!104 = !DILocation(line: 69, column: 4, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !1, line: 68, column: 14)
!106 = !DILocation(line: 70, column: 3, scope: !105)
!107 = !DILocation(line: 71, column: 4, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !1, line: 70, column: 10)
!109 = !DILocation(line: 74, column: 10, scope: !110)
!110 = distinct !DILexicalBlock(scope: !26, file: !1, line: 74, column: 7)
!111 = !DILocation(line: 74, column: 7, scope: !26)
!112 = !DILocation(line: 75, column: 31, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !1, line: 74, column: 17)
!114 = !DILocation(line: 75, column: 4, scope: !113)
!115 = !DILocation(line: 77, column: 3, scope: !113)
!116 = !DILocation(line: 78, column: 26, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !1, line: 77, column: 10)
!118 = !DILocation(line: 78, column: 31, scope: !117)
!119 = !DILocation(line: 78, column: 4, scope: !117)
!120 = !DILocation(line: 81, column: 7, scope: !26)
!121 = !DILocation(line: 82, column: 4, scope: !122)
!122 = distinct !DILexicalBlock(scope: !123, file: !1, line: 81, column: 14)
!123 = distinct !DILexicalBlock(scope: !26, file: !1, line: 81, column: 7)
!124 = !DILocation(line: 83, column: 3, scope: !122)
!125 = !DILocation(line: 84, column: 4, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !1, line: 83, column: 10)
!127 = !DILocation(line: 86, column: 9, scope: !26)
!128 = !DILocation(line: 65, column: 11, scope: !94)
!129 = !DILocation(line: 89, column: 1, scope: !19)
!130 = !DILocation(line: 92, column: 6, scope: !28)
!131 = distinct !{!131, !132, !"polly.alias.scope.X"}
!132 = distinct !{!132, !"polly.alias.scope.domain"}
!133 = !{!134, !135, !136, !137, !138}
!134 = distinct !{!134, !132, !"polly.alias.scope.Z"}
!135 = distinct !{!135, !132, !"polly.alias.scope.V"}
!136 = distinct !{!136, !132, !"polly.alias.scope.Y"}
!137 = distinct !{!137, !132, !"polly.alias.scope.M"}
!138 = distinct !{!138, !132, !"polly.alias.scope.storemerge"}
!139 = distinct !{!139}
!140 = distinct !{!140, !141, !"polly.alias.scope.Y"}
!141 = distinct !{!141, !"polly.alias.scope.domain"}
!142 = !{!143, !144, !145, !146, !147}
!143 = distinct !{!143, !141, !"polly.alias.scope.Z"}
!144 = distinct !{!144, !141, !"polly.alias.scope.X"}
!145 = distinct !{!145, !141, !"polly.alias.scope.V"}
!146 = distinct !{!146, !141, !"polly.alias.scope.M"}
!147 = distinct !{!147, !141, !"polly.alias.scope.storemerge"}
!148 = distinct !{!148}
!149 = distinct !{!149, !150, !"polly.alias.scope.Z"}
!150 = distinct !{!150, !"polly.alias.scope.domain"}
!151 = !{!152, !153, !154, !155, !156}
!152 = distinct !{!152, !150, !"polly.alias.scope.X"}
!153 = distinct !{!153, !150, !"polly.alias.scope.V"}
!154 = distinct !{!154, !150, !"polly.alias.scope.Y"}
!155 = distinct !{!155, !150, !"polly.alias.scope.M"}
!156 = distinct !{!156, !150, !"polly.alias.scope.storemerge"}
!157 = distinct !{!157}
!158 = !DILocation(line: 140, column: 9, scope: !28)
!159 = !DILocation(line: 140, column: 2, scope: !28)
!160 = distinct !{!160, !161, !"polly.alias.scope.X"}
!161 = distinct !{!161, !"polly.alias.scope.domain"}
!162 = !{!163, !164, !165, !166, !167}
!163 = distinct !{!163, !161, !"polly.alias.scope.Z"}
!164 = distinct !{!164, !161, !"polly.alias.scope.V"}
!165 = distinct !{!165, !161, !"polly.alias.scope.Y"}
!166 = distinct !{!166, !161, !"polly.alias.scope.M"}
!167 = distinct !{!167, !161, !"polly.alias.scope.storemerge"}
!168 = !DILocation(line: 127, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !170, file: !1, line: 127, column: 8)
!170 = distinct !DILexicalBlock(scope: !171, file: !1, line: 123, column: 39)
!171 = distinct !DILexicalBlock(scope: !172, file: !1, line: 123, column: 3)
!172 = distinct !DILexicalBlock(scope: !173, file: !1, line: 123, column: 3)
!173 = distinct !DILexicalBlock(scope: !174, file: !1, line: 93, column: 26)
!174 = distinct !DILexicalBlock(scope: !175, file: !1, line: 93, column: 2)
!175 = distinct !DILexicalBlock(scope: !28, file: !1, line: 93, column: 2)
!176 = !{!163, !160, !165, !166, !167}
!177 = !{!160, !164, !165, !166, !167}
!178 = !DILocation(line: 127, column: 30, scope: !169)
!179 = !DILocation(line: 127, column: 23, scope: !169)
!180 = !DILocation(line: 127, column: 8, scope: !170)
!181 = !{!163, !160, !164, !165, !167}
!182 = distinct !{!182}
!183 = !{!163, !160, !164, !166, !167}
!184 = distinct !{!184}
!185 = !DILocation(line: 107, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !187, file: !1, line: 107, column: 9)
!187 = distinct !DILexicalBlock(scope: !188, file: !1, line: 105, column: 19)
!188 = distinct !DILexicalBlock(scope: !189, file: !1, line: 105, column: 8)
!189 = distinct !DILexicalBlock(scope: !190, file: !1, line: 95, column: 39)
!190 = distinct !DILexicalBlock(scope: !191, file: !1, line: 95, column: 3)
!191 = distinct !DILexicalBlock(scope: !173, file: !1, line: 95, column: 3)
!192 = !DILocation(line: 107, column: 9, scope: !187)
!193 = distinct !{!193}
!194 = !DILocation(line: 115, column: 17, scope: !195)
!195 = distinct !DILexicalBlock(scope: !196, file: !1, line: 115, column: 9)
!196 = distinct !DILexicalBlock(scope: !197, file: !1, line: 113, column: 19)
!197 = distinct !DILexicalBlock(scope: !189, file: !1, line: 113, column: 8)
!198 = !DILocation(line: 115, column: 9, scope: !196)
!199 = !DILocation(line: 144, column: 2, scope: !35)
!200 = !DILocation(line: 35, column: 6, scope: !10, inlinedAt: !201)
!201 = distinct !DILocation(line: 145, column: 2, scope: !35)
!202 = !DILocation(line: 35, column: 13, scope: !10, inlinedAt: !201)
!203 = !DILocation(line: 36, column: 6, scope: !10, inlinedAt: !201)
!204 = !DILocation(line: 37, column: 2, scope: !68, inlinedAt: !201)
!205 = !DILocation(line: 145, column: 2, scope: !35)
!206 = !DILocation(line: 38, column: 12, scope: !16, inlinedAt: !201)
!207 = !DILocation(line: 38, column: 16, scope: !16, inlinedAt: !201)
!208 = !DILocation(line: 38, column: 7, scope: !16, inlinedAt: !201)
!209 = !DILocation(line: 39, column: 19, scope: !16, inlinedAt: !201)
!210 = !DILocation(line: 39, column: 12, scope: !16, inlinedAt: !201)
!211 = !DILocation(line: 39, column: 7, scope: !16, inlinedAt: !201)
!212 = !DILocation(line: 41, column: 10, scope: !76, inlinedAt: !201)
!213 = !DILocation(line: 41, column: 7, scope: !16, inlinedAt: !201)
!214 = !DILocation(line: 43, column: 11, scope: !79, inlinedAt: !201)
!215 = !DILocation(line: 50, column: 7, scope: !81, inlinedAt: !201)
!216 = !DILocation(line: 50, column: 7, scope: !16, inlinedAt: !201)
!217 = !DILocation(line: 51, column: 14, scope: !84, inlinedAt: !201)
!218 = !DILocation(line: 53, column: 3, scope: !84, inlinedAt: !201)
!219 = !DILocation(line: 54, column: 12, scope: !87, inlinedAt: !201)
!220 = !DILocation(line: 37, column: 11, scope: !68, inlinedAt: !201)
!221 = !DILocation(line: 148, column: 6, scope: !222)
!222 = distinct !DILexicalBlock(scope: !35, file: !1, line: 148, column: 6)
!223 = !DILocation(line: 148, column: 19, scope: !222)
!224 = !DILocation(line: 148, column: 16, scope: !222)
!225 = !DILocation(line: 148, column: 6, scope: !35)
!226 = !DILocation(line: 149, column: 3, scope: !227)
!227 = distinct !DILexicalBlock(scope: !222, file: !1, line: 148, column: 32)
!228 = !DILocation(line: 150, column: 3, scope: !227)
!229 = !DILocation(line: 153, column: 18, scope: !230)
!230 = distinct !DILexicalBlock(scope: !35, file: !1, line: 153, column: 6)
!231 = !DILocation(line: 153, column: 16, scope: !230)
!232 = !DILocation(line: 153, column: 6, scope: !35)
!233 = !DILocation(line: 154, column: 3, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !1, line: 153, column: 27)
!235 = !DILocation(line: 155, column: 3, scope: !234)
!236 = !DILocation(line: 158, column: 2, scope: !35)
!237 = !DILocation(line: 159, column: 65, scope: !35)
!238 = !DILocation(line: 159, column: 2, scope: !35)
!239 = !DILocation(line: 160, column: 1, scope: !35)
