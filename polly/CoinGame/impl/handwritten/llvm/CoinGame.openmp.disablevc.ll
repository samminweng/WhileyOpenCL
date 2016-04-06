; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@V = global [6 x i32] [i32 6, i32 5, i32 2, i32 7, i32 3, i32 5], align 16
@M = common global [6 x [6 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [21 x i8] c"Alice take coin no. \00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Bob take coin no. \00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"(%d, $%d)\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.5 = private unnamed_addr constant [55 x i8] c"\0AThe total amount of money (maximum) Alice get is %d.\0A\00", align 1
@X = common global [6 x [6 x i32]] zeroinitializer, align 16
@Y = common global [6 x [6 x i32]] zeroinitializer, align 16
@Z = common global [6 x [6 x i32]] zeroinitializer, align 16
@.str.6 = private unnamed_addr constant [5 x i8] c" %d \00", align 1
@str = private unnamed_addr constant [2 x i8] c".\00"

; Function Attrs: nounwind uwtable
define void @printMoves() #0 !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !8, metadata !38), !dbg !39
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !10, metadata !38), !dbg !40
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !11, metadata !38), !dbg !41
  br label %while.body, !dbg !42

while.body:                                       ; preds = %entry, %if.end25
  %m.046 = phi i32 [ 0, %entry ], [ %m.1, %if.end25 ]
  %n.045 = phi i32 [ 5, %entry ], [ %n.1, %if.end25 ]
  %alice.044 = phi i8 [ 1, %entry ], [ %frombool, %if.end25 ]
  %idxprom = sext i32 %n.045 to i64, !dbg !44
  %add = add nsw i32 %m.046, 1, !dbg !45
  %idxprom1 = sext i32 %add to i64, !dbg !44
  %arrayidx2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1, i64 %idxprom, !dbg !44
  %0 = load i32, i32* %arrayidx2, align 4, !dbg !44, !tbaa !46
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !13, metadata !38), !dbg !50
  %sub = add nsw i32 %n.045, -1, !dbg !51
  %idxprom3 = sext i32 %sub to i64, !dbg !52
  %idxprom4 = sext i32 %m.046 to i64, !dbg !52
  %arrayidx6 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4, i64 %idxprom3, !dbg !52
  %1 = load i32, i32* %arrayidx6, align 4, !dbg !52, !tbaa !46
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !15, metadata !38), !dbg !53
  %tobool = icmp ne i8 %alice.044, 0, !dbg !54
  br i1 %tobool, label %if.then, label %if.else, !dbg !56

if.then:                                          ; preds = %while.body
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)), !dbg !57
  br label %if.end, !dbg !59

if.else:                                          ; preds = %while.body
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %cmp8 = icmp sgt i32 %0, %1, !dbg !62
  br i1 %cmp8, label %if.else14, label %if.then9, !dbg !64

if.then9:                                         ; preds = %if.end
  %arrayidx12 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4, !dbg !65
  %2 = load i32, i32* %arrayidx12, align 4, !dbg !65, !tbaa !46
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i32 %add, i32 %2), !dbg !67
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !8, metadata !38), !dbg !39
  br label %if.end19, !dbg !68

if.else14:                                        ; preds = %if.end
  %add15 = add nsw i32 %n.045, 1, !dbg !69
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom, !dbg !71
  %3 = load i32, i32* %arrayidx17, align 4, !dbg !71, !tbaa !46
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), i32 %add15, i32 %3), !dbg !72
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !10, metadata !38), !dbg !40
  br label %if.end19

if.end19:                                         ; preds = %if.else14, %if.then9
  %n.1 = phi i32 [ %n.045, %if.then9 ], [ %sub, %if.else14 ]
  %m.1 = phi i32 [ %add, %if.then9 ], [ %m.046, %if.else14 ]
  br i1 %tobool, label %if.then21, label %if.else23, !dbg !73

if.then21:                                        ; preds = %if.end19
  %call22 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  br label %if.end25, !dbg !77

if.else23:                                        ; preds = %if.end19
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i64 0, i64 0)), !dbg !78
  br label %if.end25

if.end25:                                         ; preds = %if.else23, %if.then21
  %4 = zext i1 %tobool to i8, !dbg !80
  %frombool = xor i8 %4, 1, !dbg !80
  tail call void @llvm.dbg.value(metadata i8 %frombool, i64 0, metadata !11, metadata !38), !dbg !41
  %cmp = icmp sgt i32 %m.1, %n.1, !dbg !81
  br i1 %cmp, label %while.end, label %while.body, !dbg !42

while.end:                                        ; preds = %if.end25
  %5 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !82, !tbaa !46
  %call27 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.5, i64 0, i64 0), i32 %5), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @maxMoney() #3 !dbg !16 {
entry:
  %polly.par.userContext318 = alloca {}, align 8
  %polly.par.LBPtr.i402 = alloca i64, align 8
  %polly.par.UBPtr.i403 = alloca i64, align 8
  %polly.par.LBPtr.i381 = alloca i64, align 8
  %polly.par.UBPtr.i382 = alloca i64, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !20, metadata !38), !dbg !85
  %0 = bitcast {}* %polly.par.userContext318 to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn, i8* %0, i32 0, i64 0, i64 6, i64 1) #5
  %1 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %1)
  %2 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2)
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #5
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %maxMoney_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %entry
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_exit4.i
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #5
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
  store i32 0, i32* %scevgep9.i, align 4, !alias.scope !86, !noalias !88, !llvm.mem.parallel_loop_access !94
  %polly.indvar_next6.i = add nuw nsw i64 %polly.indvar5.i, 1
  %polly.loop_cond8.i = icmp sgt i64 %polly.indvar5.i, %polly.adjust_ub7.i
  br i1 %polly.loop_cond8.i, label %polly.loop_exit4.i.loopexit, label %polly.loop_header2.i, !llvm.loop !94

polly.loop_preheader3.i:                          ; preds = %polly.loop_header.i
  %scevgep.i = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar.i
  %polly.adjust_ub7.i = add i64 %7, -1
  br label %polly.loop_header2.i

maxMoney_polly_subfn.exit.loopexit:               ; preds = %polly.par.checkNext.loopexit.i
  br label %maxMoney_polly_subfn.exit

maxMoney_polly_subfn.exit:                        ; preds = %maxMoney_polly_subfn.exit.loopexit, %entry
  call void @GOMP_loop_end_nowait() #5
  call void @llvm.lifetime.end(i64 8, i8* %1)
  call void @llvm.lifetime.end(i64 8, i8* %2)
  call void @GOMP_parallel_end() #5
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn_8, i8* %0, i32 0, i64 0, i64 6, i64 1) #5
  %9 = bitcast i64* %polly.par.LBPtr.i381 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %9)
  %10 = bitcast i64* %polly.par.UBPtr.i382 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %10)
  %11 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i381, i64* nonnull %polly.par.UBPtr.i382) #5
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %maxMoney_polly_subfn_8.exit, label %polly.par.loadIVBounds.i387.preheader

polly.par.loadIVBounds.i387.preheader:            ; preds = %maxMoney_polly_subfn.exit
  br label %polly.par.loadIVBounds.i387

polly.par.checkNext.loopexit.i383:                ; preds = %polly.loop_exit4.i393
  %13 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i381, i64* nonnull %polly.par.UBPtr.i382) #5
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %maxMoney_polly_subfn_8.exit.loopexit, label %polly.par.loadIVBounds.i387

polly.par.loadIVBounds.i387:                      ; preds = %polly.par.loadIVBounds.i387.preheader, %polly.par.checkNext.loopexit.i383
  %polly.par.UB.i384 = load i64, i64* %polly.par.UBPtr.i382, align 8
  %polly.par.LB.i385 = load i64, i64* %polly.par.LBPtr.i381, align 8
  %polly.adjust_ub.i386 = add i64 %polly.par.UB.i384, -2
  br label %polly.loop_header.i390

polly.loop_header.i390:                           ; preds = %polly.loop_exit4.i393, %polly.par.loadIVBounds.i387
  %polly.indvar.i388 = phi i64 [ %polly.par.LB.i385, %polly.par.loadIVBounds.i387 ], [ %polly.indvar_next.i391, %polly.loop_exit4.i393 ]
  %15 = sub nsw i64 5, %polly.indvar.i388
  %polly.loop_guard.i389 = icmp sgt i64 %15, -1
  br i1 %polly.loop_guard.i389, label %polly.loop_preheader3.i401, label %polly.loop_exit4.i393

polly.loop_exit4.i393.loopexit:                   ; preds = %polly.loop_header2.i398
  br label %polly.loop_exit4.i393

polly.loop_exit4.i393:                            ; preds = %polly.loop_exit4.i393.loopexit, %polly.loop_header.i390
  %polly.indvar_next.i391 = add nsw i64 %polly.indvar.i388, 1
  %polly.loop_cond.i392 = icmp sgt i64 %polly.indvar.i388, %polly.adjust_ub.i386
  br i1 %polly.loop_cond.i392, label %polly.par.checkNext.loopexit.i383, label %polly.loop_header.i390

polly.loop_header2.i398:                          ; preds = %polly.loop_preheader3.i401, %polly.loop_header2.i398
  %polly.indvar5.i394 = phi i64 [ 0, %polly.loop_preheader3.i401 ], [ %polly.indvar_next6.i396, %polly.loop_header2.i398 ]
  %16 = mul i64 %polly.indvar5.i394, 7
  %scevgep9.i395 = getelementptr i32, i32* %scevgep.i399, i64 %16
  store i32 0, i32* %scevgep9.i395, align 4, !alias.scope !95, !noalias !97, !llvm.mem.parallel_loop_access !103
  %polly.indvar_next6.i396 = add nuw nsw i64 %polly.indvar5.i394, 1
  %polly.loop_cond8.i397 = icmp sgt i64 %polly.indvar5.i394, %polly.adjust_ub7.i400
  br i1 %polly.loop_cond8.i397, label %polly.loop_exit4.i393.loopexit, label %polly.loop_header2.i398, !llvm.loop !103

polly.loop_preheader3.i401:                       ; preds = %polly.loop_header.i390
  %scevgep.i399 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar.i388
  %polly.adjust_ub7.i400 = add i64 %15, -1
  br label %polly.loop_header2.i398

maxMoney_polly_subfn_8.exit.loopexit:             ; preds = %polly.par.checkNext.loopexit.i383
  br label %maxMoney_polly_subfn_8.exit

maxMoney_polly_subfn_8.exit:                      ; preds = %maxMoney_polly_subfn_8.exit.loopexit, %maxMoney_polly_subfn.exit
  call void @GOMP_loop_end_nowait() #5
  call void @llvm.lifetime.end(i64 8, i8* %9)
  call void @llvm.lifetime.end(i64 8, i8* %10)
  call void @GOMP_parallel_end() #5
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn_9, i8* %0, i32 0, i64 0, i64 6, i64 1) #5
  %17 = bitcast i64* %polly.par.LBPtr.i402 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %17)
  %18 = bitcast i64* %polly.par.UBPtr.i403 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %18)
  %19 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i402, i64* nonnull %polly.par.UBPtr.i403) #5
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %maxMoney_polly_subfn_9.exit, label %polly.par.loadIVBounds.i408.preheader

polly.par.loadIVBounds.i408.preheader:            ; preds = %maxMoney_polly_subfn_8.exit
  br label %polly.par.loadIVBounds.i408

polly.par.checkNext.loopexit.i404:                ; preds = %polly.loop_exit4.i414
  %21 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i402, i64* nonnull %polly.par.UBPtr.i403) #5
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %maxMoney_polly_subfn_9.exit.loopexit, label %polly.par.loadIVBounds.i408

polly.par.loadIVBounds.i408:                      ; preds = %polly.par.loadIVBounds.i408.preheader, %polly.par.checkNext.loopexit.i404
  %polly.par.UB.i405 = load i64, i64* %polly.par.UBPtr.i403, align 8
  %polly.par.LB.i406 = load i64, i64* %polly.par.LBPtr.i402, align 8
  %polly.adjust_ub.i407 = add i64 %polly.par.UB.i405, -2
  br label %polly.loop_header.i411

polly.loop_header.i411:                           ; preds = %polly.loop_exit4.i414, %polly.par.loadIVBounds.i408
  %polly.indvar.i409 = phi i64 [ %polly.par.LB.i406, %polly.par.loadIVBounds.i408 ], [ %polly.indvar_next.i412, %polly.loop_exit4.i414 ]
  %23 = sub nsw i64 5, %polly.indvar.i409
  %polly.loop_guard.i410 = icmp sgt i64 %23, -1
  br i1 %polly.loop_guard.i410, label %polly.loop_preheader3.i422, label %polly.loop_exit4.i414

polly.loop_exit4.i414.loopexit:                   ; preds = %polly.loop_header2.i419
  br label %polly.loop_exit4.i414

polly.loop_exit4.i414:                            ; preds = %polly.loop_exit4.i414.loopexit, %polly.loop_header.i411
  %polly.indvar_next.i412 = add nsw i64 %polly.indvar.i409, 1
  %polly.loop_cond.i413 = icmp sgt i64 %polly.indvar.i409, %polly.adjust_ub.i407
  br i1 %polly.loop_cond.i413, label %polly.par.checkNext.loopexit.i404, label %polly.loop_header.i411

polly.loop_header2.i419:                          ; preds = %polly.loop_preheader3.i422, %polly.loop_header2.i419
  %polly.indvar5.i415 = phi i64 [ 0, %polly.loop_preheader3.i422 ], [ %polly.indvar_next6.i417, %polly.loop_header2.i419 ]
  %24 = mul i64 %polly.indvar5.i415, 7
  %scevgep9.i416 = getelementptr i32, i32* %scevgep.i420, i64 %24
  store i32 0, i32* %scevgep9.i416, align 4, !alias.scope !104, !noalias !106, !llvm.mem.parallel_loop_access !112
  %polly.indvar_next6.i417 = add nuw nsw i64 %polly.indvar5.i415, 1
  %polly.loop_cond8.i418 = icmp sgt i64 %polly.indvar5.i415, %polly.adjust_ub7.i421
  br i1 %polly.loop_cond8.i418, label %polly.loop_exit4.i414.loopexit, label %polly.loop_header2.i419, !llvm.loop !112

polly.loop_preheader3.i422:                       ; preds = %polly.loop_header.i411
  %scevgep.i420 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar.i409
  %polly.adjust_ub7.i421 = add i64 %23, -1
  br label %polly.loop_header2.i419

maxMoney_polly_subfn_9.exit.loopexit:             ; preds = %polly.par.checkNext.loopexit.i404
  br label %maxMoney_polly_subfn_9.exit

maxMoney_polly_subfn_9.exit:                      ; preds = %maxMoney_polly_subfn_9.exit.loopexit, %maxMoney_polly_subfn_8.exit
  call void @GOMP_loop_end_nowait() #5
  call void @llvm.lifetime.end(i64 8, i8* %17)
  call void @llvm.lifetime.end(i64 8, i8* %18)
  call void @GOMP_parallel_end() #5
  call void @llvm.lifetime.end(i64 8, i8* %0)
  br label %polly.loop_header

for.cond186.preheader:                            ; preds = %for.cond186.preheader.preheader, %for.cond186.preheader
  %indvars.iv287 = phi i64 [ %indvars.iv.next288, %for.cond186.preheader ], [ 0, %for.cond186.preheader.preheader ]
  %arrayidx192 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 0, !dbg !113
  %25 = load i32, i32* %arrayidx192, align 8, !dbg !113, !tbaa !46
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %25), !dbg !120
  %arrayidx192.1 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 1, !dbg !113
  %26 = load i32, i32* %arrayidx192.1, align 4, !dbg !113, !tbaa !46
  %call.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %26), !dbg !120
  %arrayidx192.2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 2, !dbg !113
  %27 = load i32, i32* %arrayidx192.2, align 8, !dbg !113, !tbaa !46
  %call.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %27), !dbg !120
  %arrayidx192.3 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 3, !dbg !113
  %28 = load i32, i32* %arrayidx192.3, align 4, !dbg !113, !tbaa !46
  %call.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %28), !dbg !120
  %arrayidx192.4 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 4, !dbg !113
  %29 = load i32, i32* %arrayidx192.4, align 8, !dbg !113, !tbaa !46
  %call.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %29), !dbg !120
  %arrayidx192.5 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 5, !dbg !113
  %30 = load i32, i32* %arrayidx192.5, align 4, !dbg !113, !tbaa !46
  %call.5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %30), !dbg !120
  %putchar = tail call i32 @putchar(i32 10) #5, !dbg !121
  %indvars.iv.next288 = add nuw nsw i64 %indvars.iv287, 1, !dbg !122
  %exitcond289 = icmp eq i64 %indvars.iv.next288, 6, !dbg !122
  br i1 %exitcond289, label %for.end199, label %for.cond186.preheader, !dbg !122

for.end199:                                       ; preds = %for.cond186.preheader
  %31 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !124, !tbaa !46
  ret i32 %31, !dbg !125

polly.loop_header:                                ; preds = %polly.loop_exit370, %maxMoney_polly_subfn_9.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %polly.loop_exit370 ], [ 7, %maxMoney_polly_subfn_9.exit ]
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit370 ], [ 0, %maxMoney_polly_subfn_9.exit ]
  %32 = sub nsw i64 1, %polly.indvar
  %33 = icmp slt i64 %32, 0
  %34 = select i1 %33, i64 0, i64 %32
  %35 = sub nsw i64 5, %polly.indvar
  %36 = icmp sgt i64 %35, 4
  %37 = select i1 %36, i64 4, i64 %35
  %polly.loop_guard = icmp sgt i64 %34, %37
  br i1 %polly.loop_guard, label %polly.loop_exit322, label %polly.loop_preheader321

polly.loop_exit322.loopexit:                      ; preds = %polly.loop_header320
  br label %polly.loop_exit322

polly.loop_exit322:                               ; preds = %polly.loop_exit322.loopexit, %polly.loop_header
  %38 = icmp sgt i64 %35, 3
  %39 = select i1 %38, i64 3, i64 %35
  %polly.loop_guard333 = icmp sgt i64 %39, -1
  br i1 %polly.loop_guard333, label %polly.loop_preheader331, label %polly.cond

polly.cond.loopexit:                              ; preds = %polly.loop_header330
  br label %polly.cond

polly.cond:                                       ; preds = %polly.cond.loopexit, %polly.loop_exit322
  %40 = icmp sgt i64 %polly.indvar, 0
  br i1 %40, label %polly.then, label %polly.merge

polly.merge.loopexit:                             ; preds = %polly.loop_header343
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.cond
  %41 = sub nsw i64 2, %polly.indvar
  %42 = icmp slt i64 %41, 0
  %43 = select i1 %42, i64 0, i64 %41
  %polly.loop_guard371 = icmp sgt i64 %43, %35
  br i1 %polly.loop_guard371, label %polly.loop_exit370, label %polly.loop_preheader369

polly.loop_exit370.loopexit:                      ; preds = %polly.loop_header368
  br label %polly.loop_exit370

polly.loop_exit370:                               ; preds = %polly.loop_exit370.loopexit, %polly.merge
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %exitcond423 = icmp eq i64 %polly.indvar_next, 7
  br i1 %exitcond423, label %for.cond186.preheader.preheader, label %polly.loop_header

for.cond186.preheader.preheader:                  ; preds = %polly.loop_exit370
  br label %for.cond186.preheader, !dbg !113

polly.loop_header320:                             ; preds = %polly.loop_header320, %polly.loop_preheader321
  %polly.indvar323 = phi i64 [ %34, %polly.loop_preheader321 ], [ %polly.indvar_next324, %polly.loop_header320 ]
  %44 = mul i64 %polly.indvar323, 7
  %scevgep326 = getelementptr i32, i32* %scevgep, i64 %44
  %_p_scalar_ = load i32, i32* %scevgep326, align 4, !alias.scope !126, !noalias !128, !llvm.mem.parallel_loop_access !134
  %scevgep328 = getelementptr i32, i32* %scevgep327, i64 %44
  store i32 %_p_scalar_, i32* %scevgep328, align 4, !alias.scope !130, !noalias !135, !llvm.mem.parallel_loop_access !134
  %polly.indvar_next324 = add nuw nsw i64 %polly.indvar323, 1
  %polly.loop_cond325 = icmp sgt i64 %polly.indvar323, %polly.adjust_ub
  br i1 %polly.loop_cond325, label %polly.loop_exit322.loopexit, label %polly.loop_header320, !llvm.loop !134

polly.loop_preheader321:                          ; preds = %polly.loop_header
  %scevgep = getelementptr i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), i64 %polly.indvar
  %scevgep327 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub = add i64 %37, -1
  br label %polly.loop_header320

polly.loop_header330:                             ; preds = %polly.loop_header330, %polly.loop_preheader331
  %polly.indvar334 = phi i64 [ 0, %polly.loop_preheader331 ], [ %polly.indvar_next335, %polly.loop_header330 ]
  %45 = mul nuw nsw i64 %polly.indvar334, 7
  %scevgep339 = getelementptr i32, i32* %scevgep338, i64 %45
  %_p_scalar_340 = load i32, i32* %scevgep339, align 4, !alias.scope !126, !noalias !128, !llvm.mem.parallel_loop_access !136
  %scevgep342 = getelementptr i32, i32* %scevgep341, i64 %45
  store i32 %_p_scalar_340, i32* %scevgep342, align 4, !alias.scope !129, !noalias !137, !llvm.mem.parallel_loop_access !136
  %polly.indvar_next335 = add nuw nsw i64 %polly.indvar334, 1
  %polly.loop_cond337 = icmp sgt i64 %polly.indvar334, %polly.adjust_ub336
  br i1 %polly.loop_cond337, label %polly.cond.loopexit, label %polly.loop_header330, !llvm.loop !136

polly.loop_preheader331:                          ; preds = %polly.loop_exit322
  %scevgep338 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 2, i64 %polly.indvar
  %scevgep341 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub336 = add i64 %39, -1
  br label %polly.loop_header330

polly.then:                                       ; preds = %polly.cond
  %46 = add nsw i64 %polly.indvar, -1
  br label %polly.loop_header343

polly.loop_header343:                             ; preds = %polly.loop_header343, %polly.then
  %polly.indvar346 = phi i64 [ 0, %polly.then ], [ %polly.indvar_next347, %polly.loop_header343 ]
  %scevgep350 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar346
  %_p_scalar_351 = load i32, i32* %scevgep350, align 4, !alias.scope !133, !noalias !138
  %47 = mul nuw nsw i64 %polly.indvar346, 7
  %48 = add nsw i64 %47, %46
  %scevgep352 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %48
  %_p_scalar_353 = load i32, i32* %scevgep352, align 4, !alias.scope !129, !noalias !137
  %scevgep354 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %48
  %_p_scalar_355 = load i32, i32* %scevgep354, align 4, !alias.scope !130, !noalias !135
  %p_cmp85 = icmp slt i32 %_p_scalar_353, %_p_scalar_355, !dbg !139
  %p_. = select i1 %p_cmp85, i32 %_p_scalar_353, i32 %_p_scalar_355, !dbg !146
  %p_add94 = add nsw i32 %p_., %_p_scalar_351, !dbg !148
  %49 = add nsw i64 %polly.indvar346, %46
  %scevgep356 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %49
  %_p_scalar_357 = load i32, i32* %scevgep356, align 4, !alias.scope !133, !noalias !138
  %scevgep358 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %48
  %_p_scalar_359 = load i32, i32* %scevgep358, align 4, !alias.scope !132, !noalias !150
  %p_cmp105 = icmp slt i32 %_p_scalar_355, %_p_scalar_359, !dbg !148
  %p_cond117 = select i1 %p_cmp105, i32 %_p_scalar_355, i32 %_p_scalar_359, !dbg !148
  %p_add118 = add nsw i32 %p_cond117, %_p_scalar_357, !dbg !151
  %p_cmp119 = icmp sgt i32 %p_add94, %p_add118, !dbg !151
  %p_add94.p_add118 = select i1 %p_cmp119, i32 %p_add94, i32 %p_add118, !dbg !151
  %scevgep366 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %48
  store i32 %p_add94.p_add118, i32* %scevgep366, align 4, !alias.scope !126, !noalias !128
  %polly.indvar_next347 = add nuw nsw i64 %polly.indvar346, 1
  %exitcond = icmp eq i64 %polly.indvar_next347, %indvars.iv
  br i1 %exitcond, label %polly.merge.loopexit, label %polly.loop_header343

polly.loop_header368:                             ; preds = %polly.loop_header368, %polly.loop_preheader369
  %polly.indvar372 = phi i64 [ %43, %polly.loop_preheader369 ], [ %polly.indvar_next373, %polly.loop_header368 ]
  %50 = mul i64 %polly.indvar372, 7
  %scevgep377 = getelementptr i32, i32* %scevgep376, i64 %50
  %_p_scalar_378 = load i32, i32* %scevgep377, align 4, !alias.scope !126, !noalias !128, !llvm.mem.parallel_loop_access !153
  %scevgep380 = getelementptr i32, i32* %scevgep379, i64 %50
  store i32 %_p_scalar_378, i32* %scevgep380, align 4, !alias.scope !132, !noalias !150, !llvm.mem.parallel_loop_access !153
  %polly.indvar_next373 = add nuw nsw i64 %polly.indvar372, 1
  %polly.loop_cond375 = icmp slt i64 %polly.indvar372, %35
  br i1 %polly.loop_cond375, label %polly.loop_header368, label %polly.loop_exit370.loopexit, !llvm.loop !153

polly.loop_preheader369:                          ; preds = %polly.merge
  %scevgep376 = getelementptr i32, i32* getelementptr ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 128102389400760775, i64 0, i64 2), i64 %polly.indvar
  %scevgep379 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar
  br label %polly.loop_header368
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !23 {
entry:
  %call = tail call i32 @maxMoney(), !dbg !154
  tail call void @printMoves(), !dbg !155
  ret i32 0, !dbg !156
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #5

declare i32 @putchar(i32)

define internal void @maxMoney_polly_subfn(i8* nocapture readnone %polly.par.userContext) #6 {
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
  store i32 0, i32* %scevgep9, align 4, !alias.scope !130, !noalias !135, !llvm.mem.parallel_loop_access !94
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %polly.loop_cond8 = icmp sgt i64 %polly.indvar5, %polly.adjust_ub7
  br i1 %polly.loop_cond8, label %polly.loop_exit4.loopexit, label %polly.loop_header2, !llvm.loop !94

polly.loop_preheader3:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub7 = add i64 %4, -1
  br label %polly.loop_header2
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @maxMoney_polly_subfn_8(i8* nocapture readnone %polly.par.userContext) #6 {
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
  store i32 0, i32* %scevgep9, align 4, !alias.scope !129, !noalias !137, !llvm.mem.parallel_loop_access !103
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %polly.loop_cond8 = icmp sgt i64 %polly.indvar5, %polly.adjust_ub7
  br i1 %polly.loop_cond8, label %polly.loop_exit4.loopexit, label %polly.loop_header2, !llvm.loop !103

polly.loop_preheader3:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub7 = add i64 %4, -1
  br label %polly.loop_header2
}

define internal void @maxMoney_polly_subfn_9(i8* nocapture readnone %polly.par.userContext) #6 {
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
  store i32 0, i32* %scevgep9, align 4, !alias.scope !132, !noalias !150, !llvm.mem.parallel_loop_access !112
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %polly.loop_cond8 = icmp sgt i64 %polly.indvar5, %polly.adjust_ub7
  br i1 %polly.loop_cond8, label %polly.loop_exit4.loopexit, label %polly.loop_header2, !llvm.loop !112

polly.loop_preheader3:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub7 = add i64 %4, -1
  br label %polly.loop_header2
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { "polly.skip.fn" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!35, !36}
!llvm.ident = !{!37}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3, globals: !24)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/handwritten")
!2 = !{}
!3 = !{!4, !16, !23}
!4 = distinct !DISubprogram(name: "printMoves", scope: !1, file: !1, line: 26, type: !5, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: true, variables: !7)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = !{!8, !10, !11, !13, !15}
!8 = !DILocalVariable(name: "m", scope: !4, file: !1, line: 27, type: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "n", scope: !4, file: !1, line: 27, type: !9)
!11 = !DILocalVariable(name: "alice", scope: !4, file: !1, line: 28, type: !12)
!12 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!13 = !DILocalVariable(name: "P1", scope: !14, file: !1, line: 30, type: !9)
!14 = distinct !DILexicalBlock(scope: !4, file: !1, line: 29, column: 17)
!15 = !DILocalVariable(name: "P2", scope: !14, file: !1, line: 31, type: !9)
!16 = distinct !DISubprogram(name: "maxMoney", scope: !1, file: !1, line: 55, type: !17, isLocal: false, isDefinition: true, scopeLine: 55, isOptimized: true, variables: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{!9}
!19 = !{!20, !21, !22}
!20 = !DILocalVariable(name: "i", scope: !16, file: !1, line: 57, type: !9)
!21 = !DILocalVariable(name: "m", scope: !16, file: !1, line: 57, type: !9)
!22 = !DILocalVariable(name: "n", scope: !16, file: !1, line: 57, type: !9)
!23 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 96, type: !17, isLocal: false, isDefinition: true, scopeLine: 96, isOptimized: true, variables: !2)
!24 = !{!25, !29, !32, !33, !34}
!25 = !DIGlobalVariable(name: "V", scope: !0, file: !1, line: 20, type: !26, isLocal: false, isDefinition: true, variable: [6 x i32]* @V)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, align: 32, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 6)
!29 = !DIGlobalVariable(name: "M", scope: !0, file: !1, line: 21, type: !30, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @M)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 1152, align: 32, elements: !31)
!31 = !{!28, !28}
!32 = !DIGlobalVariable(name: "X", scope: !0, file: !1, line: 22, type: !30, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @X)
!33 = !DIGlobalVariable(name: "Y", scope: !0, file: !1, line: 23, type: !30, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Y)
!34 = !DIGlobalVariable(name: "Z", scope: !0, file: !1, line: 24, type: !30, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Z)
!35 = !{i32 2, !"Dwarf Version", i32 4}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!38 = !DIExpression()
!39 = !DILocation(line: 27, column: 6, scope: !4)
!40 = !DILocation(line: 27, column: 13, scope: !4)
!41 = !DILocation(line: 28, column: 7, scope: !4)
!42 = !DILocation(line: 29, column: 2, scope: !43)
!43 = !DILexicalBlockFile(scope: !4, file: !1, discriminator: 1)
!44 = !DILocation(line: 30, column: 12, scope: !14)
!45 = !DILocation(line: 30, column: 16, scope: !14)
!46 = !{!47, !47, i64 0}
!47 = !{!"int", !48, i64 0}
!48 = !{!"omnipotent char", !49, i64 0}
!49 = !{!"Simple C/C++ TBAA"}
!50 = !DILocation(line: 30, column: 7, scope: !14)
!51 = !DILocation(line: 31, column: 19, scope: !14)
!52 = !DILocation(line: 31, column: 12, scope: !14)
!53 = !DILocation(line: 31, column: 7, scope: !14)
!54 = !DILocation(line: 32, column: 7, scope: !55)
!55 = distinct !DILexicalBlock(scope: !14, file: !1, line: 32, column: 7)
!56 = !DILocation(line: 32, column: 7, scope: !14)
!57 = !DILocation(line: 33, column: 4, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !1, line: 32, column: 14)
!59 = !DILocation(line: 34, column: 3, scope: !58)
!60 = !DILocation(line: 35, column: 4, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !1, line: 34, column: 10)
!62 = !DILocation(line: 37, column: 10, scope: !63)
!63 = distinct !DILexicalBlock(scope: !14, file: !1, line: 37, column: 7)
!64 = !DILocation(line: 37, column: 7, scope: !14)
!65 = !DILocation(line: 38, column: 31, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !1, line: 37, column: 17)
!67 = !DILocation(line: 38, column: 4, scope: !66)
!68 = !DILocation(line: 40, column: 3, scope: !66)
!69 = !DILocation(line: 41, column: 26, scope: !70)
!70 = distinct !DILexicalBlock(scope: !63, file: !1, line: 40, column: 10)
!71 = !DILocation(line: 41, column: 31, scope: !70)
!72 = !DILocation(line: 41, column: 4, scope: !70)
!73 = !DILocation(line: 44, column: 7, scope: !14)
!74 = !DILocation(line: 45, column: 4, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 44, column: 14)
!76 = distinct !DILexicalBlock(scope: !14, file: !1, line: 44, column: 7)
!77 = !DILocation(line: 46, column: 3, scope: !75)
!78 = !DILocation(line: 47, column: 4, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !1, line: 46, column: 10)
!80 = !DILocation(line: 49, column: 9, scope: !14)
!81 = !DILocation(line: 29, column: 11, scope: !43)
!82 = !DILocation(line: 52, column: 4, scope: !4)
!83 = !DILocation(line: 51, column: 2, scope: !4)
!84 = !DILocation(line: 53, column: 1, scope: !4)
!85 = !DILocation(line: 57, column: 6, scope: !16)
!86 = distinct !{!86, !87, !"polly.alias.scope.Y"}
!87 = distinct !{!87, !"polly.alias.scope.domain"}
!88 = !{!89, !90, !91, !92, !93}
!89 = distinct !{!89, !87, !"polly.alias.scope.X"}
!90 = distinct !{!90, !87, !"polly.alias.scope.M"}
!91 = distinct !{!91, !87, !"polly.alias.scope.cond171"}
!92 = distinct !{!92, !87, !"polly.alias.scope.Z"}
!93 = distinct !{!93, !87, !"polly.alias.scope.V"}
!94 = distinct !{!94}
!95 = distinct !{!95, !96, !"polly.alias.scope.X"}
!96 = distinct !{!96, !"polly.alias.scope.domain"}
!97 = !{!98, !99, !100, !101, !102}
!98 = distinct !{!98, !96, !"polly.alias.scope.Y"}
!99 = distinct !{!99, !96, !"polly.alias.scope.M"}
!100 = distinct !{!100, !96, !"polly.alias.scope.cond171"}
!101 = distinct !{!101, !96, !"polly.alias.scope.Z"}
!102 = distinct !{!102, !96, !"polly.alias.scope.V"}
!103 = distinct !{!103}
!104 = distinct !{!104, !105, !"polly.alias.scope.Z"}
!105 = distinct !{!105, !"polly.alias.scope.domain"}
!106 = !{!107, !108, !109, !110, !111}
!107 = distinct !{!107, !105, !"polly.alias.scope.X"}
!108 = distinct !{!108, !105, !"polly.alias.scope.Y"}
!109 = distinct !{!109, !105, !"polly.alias.scope.M"}
!110 = distinct !{!110, !105, !"polly.alias.scope.cond171"}
!111 = distinct !{!111, !105, !"polly.alias.scope.V"}
!112 = distinct !{!112}
!113 = !DILocation(line: 89, column: 19, scope: !114)
!114 = distinct !DILexicalBlock(scope: !115, file: !1, line: 88, column: 27)
!115 = distinct !DILexicalBlock(scope: !116, file: !1, line: 88, column: 3)
!116 = distinct !DILexicalBlock(scope: !117, file: !1, line: 88, column: 3)
!117 = distinct !DILexicalBlock(scope: !118, file: !1, line: 87, column: 26)
!118 = distinct !DILexicalBlock(scope: !119, file: !1, line: 87, column: 2)
!119 = distinct !DILexicalBlock(scope: !16, file: !1, line: 87, column: 2)
!120 = !DILocation(line: 89, column: 4, scope: !114)
!121 = !DILocation(line: 91, column: 3, scope: !117)
!122 = !DILocation(line: 87, column: 2, scope: !123)
!123 = !DILexicalBlockFile(scope: !118, file: !1, discriminator: 1)
!124 = !DILocation(line: 94, column: 9, scope: !16)
!125 = !DILocation(line: 94, column: 2, scope: !16)
!126 = distinct !{!126, !127, !"polly.alias.scope.M"}
!127 = distinct !{!127, !"polly.alias.scope.domain"}
!128 = !{!129, !130, !131, !132, !133}
!129 = distinct !{!129, !127, !"polly.alias.scope.X"}
!130 = distinct !{!130, !127, !"polly.alias.scope.Y"}
!131 = distinct !{!131, !127, !"polly.alias.scope.cond171"}
!132 = distinct !{!132, !127, !"polly.alias.scope.Z"}
!133 = distinct !{!133, !127, !"polly.alias.scope.V"}
!134 = distinct !{!134}
!135 = !{!129, !126, !131, !132, !133}
!136 = distinct !{!136}
!137 = !{!130, !126, !131, !132, !133}
!138 = !{!129, !130, !126, !131, !132}
!139 = !DILocation(line: 76, column: 14, scope: !140)
!140 = distinct !DILexicalBlock(scope: !141, file: !1, line: 74, column: 48)
!141 = distinct !DILexicalBlock(scope: !142, file: !1, line: 74, column: 3)
!142 = distinct !DILexicalBlock(scope: !143, file: !1, line: 74, column: 3)
!143 = distinct !DILexicalBlock(scope: !144, file: !1, line: 58, column: 26)
!144 = distinct !DILexicalBlock(scope: !145, file: !1, line: 58, column: 2)
!145 = distinct !DILexicalBlock(scope: !16, file: !1, line: 58, column: 2)
!146 = !DILocation(line: 76, column: 14, scope: !147)
!147 = !DILexicalBlockFile(scope: !140, file: !1, discriminator: 1)
!148 = !DILocation(line: 76, column: 14, scope: !149)
!149 = !DILexicalBlockFile(scope: !140, file: !1, discriminator: 3)
!150 = !{!129, !130, !126, !131, !133}
!151 = !DILocation(line: 76, column: 14, scope: !152)
!152 = !DILexicalBlockFile(scope: !140, file: !1, discriminator: 6)
!153 = distinct !{!153}
!154 = !DILocation(line: 97, column: 2, scope: !23)
!155 = !DILocation(line: 98, column: 2, scope: !23)
!156 = !DILocation(line: 99, column: 1, scope: !23)
