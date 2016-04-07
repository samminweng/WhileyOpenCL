; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@V = global [6 x i32] [i32 6, i32 5, i32 2, i32 7, i32 3, i32 5], align 16
@sum_alice = global i32 0, align 4
@sum_bob = global i32 0, align 4
@.str = private unnamed_addr constant [22 x i8] c"Number of coins = %d\0A\00", align 1
@M = common global [6 x [6 x i32]] zeroinitializer, align 16
@coins = common global [6 x i32] zeroinitializer, align 16
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
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i32 6), !dbg !40
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !8, metadata !41), !dbg !42
  store <4 x i32> <i32 0, i32 1, i32 2, i32 3>, <4 x i32>* bitcast ([6 x i32]* @V to <4 x i32>*), align 16, !dbg !43, !tbaa !47
  store i32 4, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 4), align 16, !dbg !43, !tbaa !47
  store i32 5, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 5), align 4, !dbg !43, !tbaa !47
  ret void, !dbg !51
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @play() #0 !dbg !10 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !12, metadata !41), !dbg !52
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !13, metadata !41), !dbg !53
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !14, metadata !41), !dbg !54
  %0 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 1, i64 5), align 4, !dbg !55, !tbaa !47
  %1 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 4), align 16, !dbg !60, !tbaa !47
  %cmp7 = icmp sgt i32 %0, %1, !dbg !61
  tail call void @llvm.dbg.value(metadata i32 4, i64 0, metadata !13, metadata !41), !dbg !53
  %2 = zext i1 %cmp7 to i32, !dbg !62
  %.81 = xor i32 %2, 1, !dbg !62
  %.82 = select i1 %cmp7, i32 4, i32 5, !dbg !62
  %.val = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 5), align 4, !dbg !63
  %.val83 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 0), align 16, !dbg !63
  %storemerge80 = select i1 %cmp7, i32 %.val, i32 %.val83, !dbg !63
  store i32 %storemerge80, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @coins, i64 0, i64 0), align 16, !dbg !65, !tbaa !47
  %idxprom.172 = zext i32 %.82 to i64, !dbg !55
  %add.1 = add nuw nsw i32 %.81, 1, !dbg !67
  %idxprom1.173 = zext i32 %add.1 to i64, !dbg !55
  %arrayidx2.1 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1.173, i64 %idxprom.172, !dbg !55
  %3 = load i32, i32* %arrayidx2.1, align 4, !dbg !55, !tbaa !47
  %sub.1 = add nsw i32 %.82, -1, !dbg !68
  %idxprom3.174 = zext i32 %sub.1 to i64, !dbg !60
  %idxprom4.175 = zext i32 %.81 to i64, !dbg !60
  %arrayidx6.1 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4.175, i64 %idxprom3.174, !dbg !60
  %4 = load i32, i32* %arrayidx6.1, align 4, !dbg !60, !tbaa !47
  %cmp7.1 = icmp sgt i32 %3, %4, !dbg !61
  tail call void @llvm.dbg.value(metadata i32 4, i64 0, metadata !13, metadata !41), !dbg !53
  %idxprom4.175.pn = select i1 %cmp7.1, i64 %idxprom.172, i64 %idxprom4.175, !dbg !62
  %i.1.1 = select i1 %cmp7.1, i32 %.81, i32 %add.1, !dbg !62
  %j.1.1 = select i1 %cmp7.1, i32 %sub.1, i32 %.82, !dbg !62
  %storemerge.in = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4.175.pn, !dbg !69
  %storemerge = load i32, i32* %storemerge.in, align 4, !dbg !69, !tbaa !47
  store i32 %storemerge, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @coins, i64 0, i64 1), align 4, !dbg !70, !tbaa !47
  %idxprom.284 = zext i32 %j.1.1 to i64, !dbg !55
  %add.2 = add nuw nsw i32 %i.1.1, 1, !dbg !67
  %idxprom1.285 = zext i32 %add.2 to i64, !dbg !55
  %arrayidx2.2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1.285, i64 %idxprom.284, !dbg !55
  %5 = load i32, i32* %arrayidx2.2, align 4, !dbg !55, !tbaa !47
  %sub.2 = add nsw i32 %j.1.1, -1, !dbg !68
  %idxprom3.2 = sext i32 %sub.2 to i64, !dbg !60
  %idxprom4.286 = zext i32 %i.1.1 to i64, !dbg !60
  %arrayidx6.2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4.286, i64 %idxprom3.2, !dbg !60
  %6 = load i32, i32* %arrayidx6.2, align 4, !dbg !60, !tbaa !47
  %cmp7.2 = icmp sgt i32 %5, %6, !dbg !61
  tail call void @llvm.dbg.value(metadata i32 4, i64 0, metadata !13, metadata !41), !dbg !53
  %idxprom.2.idxprom4.2 = select i1 %cmp7.2, i64 %idxprom.284, i64 %idxprom4.286, !dbg !62
  %i.1.1.add.2 = select i1 %cmp7.2, i32 %i.1.1, i32 %add.2, !dbg !62
  %sub.2.j.1.1 = select i1 %cmp7.2, i32 %sub.2, i32 %j.1.1, !dbg !62
  %storemerge79.in = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom.2.idxprom4.2, !dbg !63
  %storemerge79 = load i32, i32* %storemerge79.in, align 4, !dbg !63, !tbaa !47
  store i32 %storemerge79, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @coins, i64 0, i64 2), align 8, !dbg !65, !tbaa !47
  %idxprom.3 = sext i32 %sub.2.j.1.1 to i64, !dbg !55
  %add.3 = add nuw nsw i32 %i.1.1.add.2, 1, !dbg !67
  %idxprom1.3 = sext i32 %add.3 to i64, !dbg !55
  %arrayidx2.3 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1.3, i64 %idxprom.3, !dbg !55
  %7 = load i32, i32* %arrayidx2.3, align 4, !dbg !55, !tbaa !47
  %sub.3 = add nsw i32 %sub.2.j.1.1, -1, !dbg !68
  %idxprom3.3 = sext i32 %sub.3 to i64, !dbg !60
  %8 = zext i32 %i.1.1.add.2 to i64, !dbg !60
  %arrayidx6.3 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %8, i64 %idxprom3.3, !dbg !60
  %9 = load i32, i32* %arrayidx6.3, align 4, !dbg !60, !tbaa !47
  %cmp7.3 = icmp sgt i32 %7, %9, !dbg !61
  tail call void @llvm.dbg.value(metadata i32 4, i64 0, metadata !13, metadata !41), !dbg !53
  %idxprom4.3.pn = select i1 %cmp7.3, i64 %idxprom.3, i64 %8, !dbg !62
  %i.1.3 = select i1 %cmp7.3, i32 %i.1.1.add.2, i32 %add.3, !dbg !62
  %j.1.3 = select i1 %cmp7.3, i32 %sub.3, i32 %sub.2.j.1.1, !dbg !62
  %storemerge76.in = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4.3.pn, !dbg !69
  %storemerge76 = load i32, i32* %storemerge76.in, align 4, !dbg !69, !tbaa !47
  store i32 %storemerge76, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @coins, i64 0, i64 3), align 4, !dbg !70, !tbaa !47
  %idxprom.4 = sext i32 %j.1.3 to i64, !dbg !55
  %add.4 = add nsw i32 %i.1.3, 1, !dbg !67
  %idxprom1.4 = sext i32 %add.4 to i64, !dbg !55
  %arrayidx2.4 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1.4, i64 %idxprom.4, !dbg !55
  %10 = load i32, i32* %arrayidx2.4, align 4, !dbg !55, !tbaa !47
  %sub.4 = add nsw i32 %j.1.3, -1, !dbg !68
  %idxprom3.4 = sext i32 %sub.4 to i64, !dbg !60
  %idxprom4.4 = sext i32 %i.1.3 to i64, !dbg !60
  %arrayidx6.4 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4.4, i64 %idxprom3.4, !dbg !60
  %11 = load i32, i32* %arrayidx6.4, align 4, !dbg !60, !tbaa !47
  %cmp7.4 = icmp sgt i32 %10, %11, !dbg !61
  tail call void @llvm.dbg.value(metadata i32 4, i64 0, metadata !13, metadata !41), !dbg !53
  %idxprom.4.idxprom4.4 = select i1 %cmp7.4, i64 %idxprom.4, i64 %idxprom4.4, !dbg !62
  %i.1.3.add.4 = select i1 %cmp7.4, i32 %i.1.3, i32 %add.4, !dbg !62
  %sub.4.j.1.3 = select i1 %cmp7.4, i32 %sub.4, i32 %j.1.3, !dbg !62
  %storemerge78.in = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom.4.idxprom4.4, !dbg !63
  %storemerge78 = load i32, i32* %storemerge78.in, align 4, !dbg !63, !tbaa !47
  store i32 %storemerge78, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @coins, i64 0, i64 4), align 16, !dbg !65, !tbaa !47
  %idxprom.5 = sext i32 %sub.4.j.1.3 to i64, !dbg !55
  %add.5 = add nsw i32 %i.1.3.add.4, 1, !dbg !67
  %idxprom1.5 = sext i32 %add.5 to i64, !dbg !55
  %arrayidx2.5 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1.5, i64 %idxprom.5, !dbg !55
  %12 = load i32, i32* %arrayidx2.5, align 4, !dbg !55, !tbaa !47
  %sub.5 = add nsw i32 %sub.4.j.1.3, -1, !dbg !68
  %idxprom3.5 = sext i32 %sub.5 to i64, !dbg !60
  %idxprom4.5 = sext i32 %i.1.3.add.4 to i64, !dbg !60
  %arrayidx6.5 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4.5, i64 %idxprom3.5, !dbg !60
  %13 = load i32, i32* %arrayidx6.5, align 4, !dbg !60, !tbaa !47
  %cmp7.5 = icmp sgt i32 %12, %13, !dbg !61
  tail call void @llvm.dbg.value(metadata i32 4, i64 0, metadata !13, metadata !41), !dbg !53
  %idxprom4.5.pn = select i1 %cmp7.5, i64 %idxprom.5, i64 %idxprom4.5, !dbg !62
  %storemerge77.in = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4.5.pn, !dbg !69
  %storemerge77 = load i32, i32* %storemerge77.in, align 4, !dbg !69, !tbaa !47
  store i32 %storemerge77, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @coins, i64 0, i64 5), align 4, !dbg !70, !tbaa !47
  br label %for.body19, !dbg !71

for.body19:                                       ; preds = %entry, %for.cond17.backedge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond17.backedge ], [ 0, %entry ]
  %rem64 = and i64 %indvars.iv, 1, !dbg !71
  %cmp20 = icmp eq i64 %rem64, 0, !dbg !71
  br i1 %cmp20, label %if.then21, label %if.else22, !dbg !76

if.then21:                                        ; preds = %for.body19
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  br label %if.end24, !dbg !79

if.else22:                                        ; preds = %for.body19
  %call23 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  br label %if.end24

if.end24:                                         ; preds = %if.else22, %if.then21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !82
  %arrayidx27 = getelementptr inbounds [6 x i32], [6 x i32]* @coins, i64 0, i64 %indvars.iv, !dbg !84
  %14 = load i32, i32* %arrayidx27, align 4, !dbg !84, !tbaa !47
  %15 = trunc i64 %indvars.iv.next to i32, !dbg !85
  %call28 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0), i32 %15, i32 %14), !dbg !85
  %16 = load i32, i32* %arrayidx27, align 4, !dbg !86, !tbaa !47
  br i1 %cmp20, label %if.then31, label %if.else36, !dbg !89

if.then31:                                        ; preds = %if.end24
  %17 = load i32, i32* @sum_alice, align 4, !dbg !90, !tbaa !47
  %add34 = add nsw i32 %17, %16, !dbg !90
  store i32 %add34, i32* @sum_alice, align 4, !dbg !90, !tbaa !47
  %call35 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %for.cond17.backedge, !dbg !92

for.cond17.backedge:                              ; preds = %if.then31, %if.else36
  %exitcond = icmp eq i64 %indvars.iv.next, 6, !dbg !82
  br i1 %exitcond, label %for.end44, label %for.body19, !dbg !82

if.else36:                                        ; preds = %if.end24
  %18 = load i32, i32* @sum_bob, align 4, !dbg !93, !tbaa !47
  %add39 = add nsw i32 %18, %16, !dbg !93
  store i32 %add39, i32* @sum_bob, align 4, !dbg !93, !tbaa !47
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i64 0, i64 0)), !dbg !95
  br label %for.cond17.backedge

for.end44:                                        ; preds = %for.cond17.backedge
  ret void, !dbg !96
}

; Function Attrs: nounwind uwtable
define i32 @findMoves() #3 !dbg !15 {
entry:
  %polly.par.userContext237 = alloca {}, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !41), !dbg !97
  %0 = bitcast {}* %polly.par.userContext237 to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @findMoves_polly_subfn, i8* %0, i32 0, i64 0, i64 6, i64 1) #6
  call void @findMoves_polly_subfn(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @findMoves_polly_subfn_10, i8* %0, i32 0, i64 0, i64 6, i64 1) #6
  call void @findMoves_polly_subfn_10(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @findMoves_polly_subfn_11, i8* %0, i32 0, i64 0, i64 6, i64 1) #6
  call void @findMoves_polly_subfn_11(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  %_p_scalar_.prol = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 0), align 16
  br label %polly.loop_header

polly.exiting:                                    ; preds = %polly.loop_exit284
  %1 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !98, !tbaa !47
  ret i32 %1, !dbg !99

polly.loop_header:                                ; preds = %polly.loop_exit284, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %polly.loop_exit284 ], [ 7, %entry ]
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit284 ], [ 0, %entry ]
  %2 = icmp sgt i64 %polly.indvar, 0
  br i1 %2, label %polly.then, label %polly.merge

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header239
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.then.split, %polly.merge.loopexit.unr-lcssa
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header
  %3 = sub nsw i64 1, %polly.indvar
  %4 = icmp slt i64 %3, 0
  %5 = select i1 %4, i64 0, i64 %3
  %6 = sub nsw i64 5, %polly.indvar
  %7 = icmp sgt i64 %6, 4
  %8 = select i1 %7, i64 4, i64 %6
  %polly.loop_guard = icmp sgt i64 %5, %8
  br i1 %polly.loop_guard, label %polly.loop_exit254, label %polly.loop_preheader253

polly.loop_exit254.loopexit:                      ; preds = %polly.loop_header252
  br label %polly.loop_exit254

polly.loop_exit254:                               ; preds = %polly.loop_exit254.loopexit, %polly.merge
  %9 = icmp sgt i64 %6, 3
  %10 = select i1 %9, i64 3, i64 %6
  %polly.loop_guard268 = icmp sgt i64 %10, -1
  br i1 %polly.loop_guard268, label %polly.loop_preheader266, label %polly.loop_exit267

polly.loop_exit267.loopexit:                      ; preds = %polly.loop_header265
  br label %polly.loop_exit267

polly.loop_exit267:                               ; preds = %polly.loop_exit267.loopexit, %polly.loop_exit254
  %11 = sub nsw i64 2, %polly.indvar
  %12 = icmp slt i64 %11, 0
  %13 = select i1 %12, i64 0, i64 %11
  %polly.loop_guard285 = icmp sgt i64 %13, %6
  br i1 %polly.loop_guard285, label %polly.loop_exit284, label %polly.loop_preheader283

polly.loop_exit284.loopexit:                      ; preds = %polly.loop_header282
  br label %polly.loop_exit284

polly.loop_exit284:                               ; preds = %polly.loop_exit284.loopexit, %polly.loop_exit267
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %exitcond298 = icmp eq i64 %polly.indvar_next, 7
  br i1 %exitcond298, label %polly.exiting, label %polly.loop_header

polly.then:                                       ; preds = %polly.loop_header
  %14 = sub i64 7, %polly.indvar
  %15 = add nsw i64 %polly.indvar, -1
  %xtraiter = and i64 %14, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %polly.then.split, label %polly.loop_header239.prol

polly.loop_header239.prol:                        ; preds = %polly.then
  %16 = add nsw i64 %polly.indvar, -1
  %scevgep245.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %16
  %_p_scalar_246.prol = load i32, i32* %scevgep245.prol, align 4, !alias.scope !100, !noalias !102
  %p_add100.prol = add nsw i32 %_p_scalar_246.prol, %_p_scalar_.prol, !dbg !108
  %17 = add nsw i64 %polly.indvar, -1
  %scevgep247.prol = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %17
  %_p_scalar_248.prol = load i32, i32* %scevgep247.prol, align 4, !alias.scope !104, !noalias !116
  %scevgep249.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %16
  %_p_scalar_250.prol = load i32, i32* %scevgep249.prol, align 4, !alias.scope !105, !noalias !117
  %p_add107.prol = add nsw i32 %_p_scalar_250.prol, %_p_scalar_248.prol, !dbg !118
  %p_cmp108.prol = icmp sgt i32 %p_add100.prol, %p_add107.prol, !dbg !119
  %polly.storemerge.prol = select i1 %p_cmp108.prol, i32 %p_add100.prol, i32 %p_add107.prol, !dbg !120
  %scevgep251.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %16
  store i32 %polly.storemerge.prol, i32* %scevgep251.prol, align 4, !alias.scope !107, !noalias !121
  br label %polly.then.split

polly.then.split:                                 ; preds = %polly.then, %polly.loop_header239.prol
  %polly.indvar242.unr = phi i64 [ 0, %polly.then ], [ 1, %polly.loop_header239.prol ]
  %18 = icmp eq i64 %polly.indvar, 6
  br i1 %18, label %polly.merge.loopexit, label %polly.then.split.split

polly.then.split.split:                           ; preds = %polly.then.split
  br label %polly.loop_header239

polly.loop_header239:                             ; preds = %polly.loop_header239, %polly.then.split.split
  %polly.indvar242 = phi i64 [ %polly.indvar242.unr, %polly.then.split.split ], [ %polly.indvar_next243.1, %polly.loop_header239 ]
  %scevgep = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar242
  %_p_scalar_ = load i32, i32* %scevgep, align 4, !alias.scope !104, !noalias !116
  %19 = mul nuw nsw i64 %polly.indvar242, 7
  %20 = add nsw i64 %19, %15
  %scevgep245 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %20
  %_p_scalar_246 = load i32, i32* %scevgep245, align 4, !alias.scope !100, !noalias !102
  %p_add100 = add nsw i32 %_p_scalar_246, %_p_scalar_, !dbg !108
  %21 = add nsw i64 %polly.indvar242, %15
  %scevgep247 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %21
  %_p_scalar_248 = load i32, i32* %scevgep247, align 4, !alias.scope !104, !noalias !116
  %scevgep249 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %20
  %_p_scalar_250 = load i32, i32* %scevgep249, align 4, !alias.scope !105, !noalias !117
  %p_add107 = add nsw i32 %_p_scalar_250, %_p_scalar_248, !dbg !118
  %p_cmp108 = icmp sgt i32 %p_add100, %p_add107, !dbg !119
  %polly.storemerge = select i1 %p_cmp108, i32 %p_add100, i32 %p_add107, !dbg !120
  %scevgep251 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %20
  store i32 %polly.storemerge, i32* %scevgep251, align 4, !alias.scope !107, !noalias !121
  %polly.indvar_next243 = add nuw nsw i64 %polly.indvar242, 1
  %scevgep.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar_next243
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !104, !noalias !116
  %22 = mul nuw nsw i64 %polly.indvar_next243, 7
  %23 = add nsw i64 %22, %15
  %scevgep245.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %23
  %_p_scalar_246.1 = load i32, i32* %scevgep245.1, align 4, !alias.scope !100, !noalias !102
  %p_add100.1 = add nsw i32 %_p_scalar_246.1, %_p_scalar_.1, !dbg !108
  %24 = add i64 %polly.indvar242, %polly.indvar
  %scevgep247.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %24
  %_p_scalar_248.1 = load i32, i32* %scevgep247.1, align 4, !alias.scope !104, !noalias !116
  %scevgep249.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %23
  %_p_scalar_250.1 = load i32, i32* %scevgep249.1, align 4, !alias.scope !105, !noalias !117
  %p_add107.1 = add nsw i32 %_p_scalar_250.1, %_p_scalar_248.1, !dbg !118
  %p_cmp108.1 = icmp sgt i32 %p_add100.1, %p_add107.1, !dbg !119
  %polly.storemerge.1 = select i1 %p_cmp108.1, i32 %p_add100.1, i32 %p_add107.1, !dbg !120
  %scevgep251.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %23
  store i32 %polly.storemerge.1, i32* %scevgep251.1, align 4, !alias.scope !107, !noalias !121
  %polly.indvar_next243.1 = add nsw i64 %polly.indvar242, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next243.1, %indvars.iv
  br i1 %exitcond.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header239

polly.loop_header252:                             ; preds = %polly.loop_header252, %polly.loop_preheader253
  %polly.indvar255 = phi i64 [ %5, %polly.loop_preheader253 ], [ %polly.indvar_next256, %polly.loop_header252 ]
  %25 = mul i64 %polly.indvar255, 7
  %scevgep260 = getelementptr i32, i32* %scevgep259, i64 %25
  %_p_scalar_261 = load i32, i32* %scevgep260, align 4, !alias.scope !107, !noalias !121, !llvm.mem.parallel_loop_access !122
  %scevgep263 = getelementptr i32, i32* %scevgep262, i64 %25
  store i32 %_p_scalar_261, i32* %scevgep263, align 4, !alias.scope !106, !noalias !123, !llvm.mem.parallel_loop_access !122
  %polly.indvar_next256 = add nuw nsw i64 %polly.indvar255, 1
  %polly.loop_cond258 = icmp sgt i64 %polly.indvar255, %polly.adjust_ub257
  br i1 %polly.loop_cond258, label %polly.loop_exit254.loopexit, label %polly.loop_header252, !llvm.loop !122

polly.loop_preheader253:                          ; preds = %polly.merge
  %scevgep259 = getelementptr i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), i64 %polly.indvar
  %scevgep262 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub257 = add i64 %8, -1
  br label %polly.loop_header252

polly.loop_header265:                             ; preds = %polly.loop_header265, %polly.loop_preheader266
  %polly.indvar269 = phi i64 [ 0, %polly.loop_preheader266 ], [ %polly.indvar_next270, %polly.loop_header265 ]
  %26 = mul nuw nsw i64 %polly.indvar269, 7
  %scevgep274 = getelementptr i32, i32* %scevgep273, i64 %26
  %_p_scalar_275 = load i32, i32* %scevgep274, align 4, !alias.scope !107, !noalias !121, !llvm.mem.parallel_loop_access !124
  %scevgep277 = getelementptr i32, i32* %scevgep276, i64 %26
  %scevgep279 = getelementptr i32, i32* %scevgep278, i64 %26
  %_p_scalar_280 = load i32, i32* %scevgep279, align 4, !alias.scope !106, !noalias !123, !llvm.mem.parallel_loop_access !124
  %p_cmp42 = icmp sgt i32 %_p_scalar_275, %_p_scalar_280, !dbg !125
  %p_. = select i1 %p_cmp42, i32 %_p_scalar_280, i32 %_p_scalar_275, !dbg !132
  store i32 %p_., i32* %scevgep277, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !124
  %polly.indvar_next270 = add nuw nsw i64 %polly.indvar269, 1
  %polly.loop_cond272 = icmp sgt i64 %polly.indvar269, %polly.adjust_ub271
  br i1 %polly.loop_cond272, label %polly.loop_exit267.loopexit, label %polly.loop_header265, !llvm.loop !124

polly.loop_preheader266:                          ; preds = %polly.loop_exit254
  %scevgep273 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 2, i64 %polly.indvar
  %scevgep276 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  %scevgep278 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub271 = add i64 %10, -1
  br label %polly.loop_header265

polly.loop_header282:                             ; preds = %polly.loop_header282, %polly.loop_preheader283
  %polly.indvar286 = phi i64 [ %13, %polly.loop_preheader283 ], [ %polly.indvar_next287, %polly.loop_header282 ]
  %27 = mul i64 %polly.indvar286, 7
  %scevgep291 = getelementptr i32, i32* %scevgep290, i64 %27
  %_p_scalar_292 = load i32, i32* %scevgep291, align 4, !alias.scope !107, !noalias !121, !llvm.mem.parallel_loop_access !133
  %scevgep294 = getelementptr i32, i32* %scevgep293, i64 %27
  %scevgep296 = getelementptr i32, i32* %scevgep295, i64 %27
  %_p_scalar_297 = load i32, i32* %scevgep296, align 4, !alias.scope !106, !noalias !123, !llvm.mem.parallel_loop_access !133
  %p_cmp78 = icmp sgt i32 %_p_scalar_292, %_p_scalar_297, !dbg !134
  %p_.204 = select i1 %p_cmp78, i32 %_p_scalar_297, i32 %_p_scalar_292, !dbg !138
  store i32 %p_.204, i32* %scevgep294, align 4, !alias.scope !105, !noalias !117, !llvm.mem.parallel_loop_access !133
  %polly.indvar_next287 = add nuw nsw i64 %polly.indvar286, 1
  %polly.loop_cond289 = icmp slt i64 %polly.indvar286, %6
  br i1 %polly.loop_cond289, label %polly.loop_header282, label %polly.loop_exit284.loopexit, !llvm.loop !133

polly.loop_preheader283:                          ; preds = %polly.loop_exit267
  %scevgep290 = getelementptr i32, i32* getelementptr ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 128102389400760775, i64 0, i64 2), i64 %polly.indvar
  %scevgep293 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar
  %scevgep295 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  br label %polly.loop_header282
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !22 {
entry:
  %call = tail call i32 @findMoves(), !dbg !139
  tail call void @play(), !dbg !140
  %0 = load i32, i32* @sum_alice, align 4, !dbg !141, !tbaa !47
  %1 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !143, !tbaa !47
  %cmp = icmp eq i32 %0, %1, !dbg !144
  br i1 %cmp, label %if.end, label %if.then, !dbg !145

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0)), !dbg !146
  tail call void @exit(i32 -1) #8, !dbg !148
  unreachable, !dbg !148

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @sum_bob, align 4, !dbg !149, !tbaa !47
  %cmp2 = icmp slt i32 %0, %2, !dbg !151
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !152

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0)), !dbg !153
  tail call void @exit(i32 -1) #8, !dbg !155
  unreachable, !dbg !155

if.end5:                                          ; preds = %if.end
  %call6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i64 0, i64 0), i32 %0), !dbg !156
  %3 = load i32, i32* @sum_bob, align 4, !dbg !157, !tbaa !47
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0), i32 %3), !dbg !158
  ret i32 0, !dbg !159
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #6

define internal void @findMoves_polly_subfn(i8* nocapture readnone %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.userContext13 = alloca { i64 }, align 8
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %2 = bitcast { i64 }* %polly.par.userContext13 to i8*
  %polly.subfn.storeaddr.polly.indvar = getelementptr inbounds { i64 }, { i64 }* %polly.par.userContext13, i64 0, i32 0
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.merge10
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.merge10, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.merge10 ]
  %5 = icmp slt i64 %polly.indvar, 3
  br i1 %5, label %polly.loop_preheader3, label %polly.parallel.for

polly.merge10:                                    ; preds = %polly.loop_preheader3, %polly.parallel.for
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_preheader3:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  store i32 0, i32* %scevgep, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !160
  %scevgep8.1 = getelementptr i32, i32* %scevgep, i64 7
  store i32 0, i32* %scevgep8.1, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !160
  %scevgep8.2 = getelementptr i32, i32* %scevgep, i64 14
  store i32 0, i32* %scevgep8.2, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !160
  %scevgep8.3 = getelementptr i32, i32* %scevgep, i64 21
  store i32 0, i32* %scevgep8.3, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !160
  %6 = icmp eq i64 %polly.indvar, 2
  br i1 %6, label %polly.merge10, label %polly.parallel.for

polly.parallel.for:                               ; preds = %polly.loop_header, %polly.loop_preheader3
  call void @llvm.lifetime.start(i64 8, i8* %2)
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @findMoves_polly_subfn_polly_subfn, i8* %2, i32 0, i64 0, i64 2, i64 1)
  call void @findMoves_polly_subfn_polly_subfn(i8* %2)
  call void @GOMP_parallel_end()
  call void @llvm.lifetime.end(i64 8, i8* %2)
  br label %polly.merge10
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @findMoves_polly_subfn_polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.polly.indvar = load i64, i64* %0, align 8
  %1 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.subfunc.arg.polly.indvar
  %3 = sub nsw i64 1, %polly.subfunc.arg.polly.indvar
  %polly.loop_guard = icmp sgt i64 %3, -1
  %polly.adjust_ub7 = add i64 %3, -1
  %4 = icmp sgt i64 %polly.subfunc.arg.polly.indvar, 2
  %5 = sub nsw i64 5, %polly.subfunc.arg.polly.indvar
  %polly.loop_guard18 = icmp sgt i64 %5, -1
  %polly.adjust_ub21 = add i64 %5, -1
  %polly.loop_guard.not = xor i1 %polly.loop_guard, true
  %polly.loop_guard.not74 = xor i1 %polly.loop_guard, true
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit.loopexit:            ; preds = %polly.merge.us.us
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit92:          ; preds = %polly.merge.us
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit93:          ; preds = %polly.merge.us44
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit94:          ; preds = %polly.merge.us66
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit95:          ; preds = %polly.loop_header
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit:                     ; preds = %polly.par.checkNext.loopexit.loopexit95, %polly.par.checkNext.loopexit.loopexit94, %polly.par.checkNext.loopexit.loopexit93, %polly.par.checkNext.loopexit.loopexit92, %polly.par.checkNext.loopexit.loopexit
  %6 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br i1 %4, label %polly.par.loadIVBounds.split.us, label %polly.par.loadIVBounds.split

polly.par.loadIVBounds.split.us:                  ; preds = %polly.par.loadIVBounds
  br i1 %polly.loop_guard18, label %polly.loop_header.us.us.preheader, label %polly.loop_header.us.preheader

polly.loop_header.us.preheader:                   ; preds = %polly.par.loadIVBounds.split.us
  br label %polly.loop_header.us

polly.loop_header.us.us.preheader:                ; preds = %polly.par.loadIVBounds.split.us
  br label %polly.loop_header.us.us

polly.loop_header.us.us:                          ; preds = %polly.loop_header.us.us.preheader, %polly.merge.us.us
  %polly.indvar.us.us = phi i64 [ %polly.indvar_next.us.us, %polly.merge.us.us ], [ %polly.par.LB, %polly.loop_header.us.us.preheader ]
  %8 = icmp eq i64 %polly.indvar.us.us, 1
  br i1 %8, label %polly.then.us.us, label %polly.loop_header15.us.us.preheader

polly.loop_header15.us.us.preheader:              ; preds = %polly.loop_header.us.us
  br label %polly.loop_header15.us.us

polly.then.us.us:                                 ; preds = %polly.loop_header.us.us
  br i1 %polly.loop_guard, label %polly.loop_header2.us.us.preheader, label %polly.merge.us.us

polly.loop_header2.us.us.preheader:               ; preds = %polly.then.us.us
  br label %polly.loop_header2.us.us

polly.merge.us.us.loopexit:                       ; preds = %polly.loop_header2.us.us
  br label %polly.merge.us.us

polly.merge.us.us.loopexit91:                     ; preds = %polly.loop_header15.us.us
  br label %polly.merge.us.us

polly.merge.us.us:                                ; preds = %polly.merge.us.us.loopexit91, %polly.merge.us.us.loopexit, %polly.then.us.us
  %polly.indvar_next.us.us = add nsw i64 %polly.indvar.us.us, 1
  %polly.loop_cond.us.us = icmp sgt i64 %polly.indvar.us.us, %polly.adjust_ub
  br i1 %polly.loop_cond.us.us, label %polly.par.checkNext.loopexit.loopexit, label %polly.loop_header.us.us

polly.loop_header15.us.us:                        ; preds = %polly.loop_header15.us.us.preheader, %polly.loop_header15.us.us
  %polly.indvar19.us.us = phi i64 [ %polly.indvar_next20.us.us, %polly.loop_header15.us.us ], [ 0, %polly.loop_header15.us.us.preheader ]
  %9 = mul i64 %polly.indvar19.us.us, 7
  %scevgep25.us.us = getelementptr i32, i32* %scevgep, i64 %9
  store i32 0, i32* %scevgep25.us.us, align 4, !alias.scope !100, !noalias !102
  %polly.indvar_next20.us.us = add nuw nsw i64 %polly.indvar19.us.us, 1
  %polly.loop_cond22.us.us = icmp sgt i64 %polly.indvar19.us.us, %polly.adjust_ub21
  br i1 %polly.loop_cond22.us.us, label %polly.merge.us.us.loopexit91, label %polly.loop_header15.us.us

polly.loop_header2.us.us:                         ; preds = %polly.loop_header2.us.us.preheader, %polly.loop_header2.us.us
  %polly.indvar5.us.us = phi i64 [ %polly.indvar_next6.us.us, %polly.loop_header2.us.us ], [ 0, %polly.loop_header2.us.us.preheader ]
  %10 = mul i64 %polly.indvar5.us.us, 7
  %11 = add i64 %10, 28
  %scevgep9.us.us = getelementptr i32, i32* %scevgep, i64 %11
  store i32 0, i32* %scevgep9.us.us, align 4, !alias.scope !100, !noalias !102
  %polly.indvar_next6.us.us = add nuw nsw i64 %polly.indvar5.us.us, 1
  %polly.loop_cond8.us.us = icmp sgt i64 %polly.indvar5.us.us, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us.us, label %polly.merge.us.us.loopexit, label %polly.loop_header2.us.us

polly.loop_header.us:                             ; preds = %polly.loop_header.us.preheader, %polly.merge.us
  %polly.indvar.us = phi i64 [ %polly.indvar_next.us, %polly.merge.us ], [ %polly.par.LB, %polly.loop_header.us.preheader ]
  %.not = icmp ne i64 %polly.indvar.us, 1
  %brmerge = or i1 %.not, %polly.loop_guard.not
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header2.us.preheader

polly.loop_header2.us.preheader:                  ; preds = %polly.loop_header.us
  br label %polly.loop_header2.us

polly.loop_header2.us:                            ; preds = %polly.loop_header2.us.preheader, %polly.loop_header2.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_header2.us ], [ 0, %polly.loop_header2.us.preheader ]
  %12 = mul i64 %polly.indvar5.us, 7
  %13 = add i64 %12, 28
  %scevgep9.us = getelementptr i32, i32* %scevgep, i64 %13
  store i32 0, i32* %scevgep9.us, align 4, !alias.scope !100, !noalias !102
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %polly.loop_cond8.us = icmp sgt i64 %polly.indvar5.us, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us, label %polly.merge.us.loopexit, label %polly.loop_header2.us

polly.merge.us.loopexit:                          ; preds = %polly.loop_header2.us
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.loop_header.us
  %polly.indvar_next.us = add nsw i64 %polly.indvar.us, 1
  %polly.loop_cond.us = icmp sgt i64 %polly.indvar.us, %polly.adjust_ub
  br i1 %polly.loop_cond.us, label %polly.par.checkNext.loopexit.loopexit92, label %polly.loop_header.us

polly.par.loadIVBounds.split:                     ; preds = %polly.par.loadIVBounds
  br i1 %polly.loop_guard18, label %polly.loop_header.us29.preheader, label %polly.par.loadIVBounds.split.split

polly.loop_header.us29.preheader:                 ; preds = %polly.par.loadIVBounds.split
  br label %polly.loop_header.us29

polly.loop_header.us29:                           ; preds = %polly.loop_header.us29.preheader, %polly.merge.us44
  %polly.indvar.us30 = phi i64 [ %polly.indvar_next.us45, %polly.merge.us44 ], [ %polly.par.LB, %polly.loop_header.us29.preheader ]
  %.not73 = icmp ne i64 %polly.indvar.us30, 1
  %brmerge75 = or i1 %.not73, %polly.loop_guard.not74
  br i1 %brmerge75, label %polly.merge.us44, label %polly.loop_header2.us39.preheader

polly.loop_header2.us39.preheader:                ; preds = %polly.loop_header.us29
  br label %polly.loop_header2.us39

polly.loop_header2.us39:                          ; preds = %polly.loop_header2.us39.preheader, %polly.loop_header2.us39
  %polly.indvar5.us40 = phi i64 [ %polly.indvar_next6.us42, %polly.loop_header2.us39 ], [ 0, %polly.loop_header2.us39.preheader ]
  %14 = mul i64 %polly.indvar5.us40, 7
  %15 = add i64 %14, 28
  %scevgep9.us41 = getelementptr i32, i32* %scevgep, i64 %15
  store i32 0, i32* %scevgep9.us41, align 4, !alias.scope !100, !noalias !102
  %polly.indvar_next6.us42 = add nuw nsw i64 %polly.indvar5.us40, 1
  %polly.loop_cond8.us43 = icmp sgt i64 %polly.indvar5.us40, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us43, label %polly.merge.us44.loopexit, label %polly.loop_header2.us39

polly.merge.us44.loopexit:                        ; preds = %polly.loop_header2.us39
  br label %polly.merge.us44

polly.merge.us44:                                 ; preds = %polly.merge.us44.loopexit, %polly.loop_header.us29
  %polly.indvar_next.us45 = add nsw i64 %polly.indvar.us30, 1
  %polly.loop_cond.us46 = icmp sgt i64 %polly.indvar.us30, %polly.adjust_ub
  br i1 %polly.loop_cond.us46, label %polly.par.checkNext.loopexit.loopexit93, label %polly.loop_header.us29

polly.par.loadIVBounds.split.split:               ; preds = %polly.par.loadIVBounds.split
  br i1 %polly.loop_guard, label %polly.loop_header.us51.preheader, label %polly.loop_header.preheader

polly.loop_header.preheader:                      ; preds = %polly.par.loadIVBounds.split.split
  br label %polly.loop_header

polly.loop_header.us51.preheader:                 ; preds = %polly.par.loadIVBounds.split.split
  br label %polly.loop_header.us51

polly.loop_header.us51:                           ; preds = %polly.loop_header.us51.preheader, %polly.merge.us66
  %polly.indvar.us52 = phi i64 [ %polly.indvar_next.us67, %polly.merge.us66 ], [ %polly.par.LB, %polly.loop_header.us51.preheader ]
  %16 = icmp eq i64 %polly.indvar.us52, 1
  br i1 %16, label %polly.loop_header2.us61.preheader, label %polly.merge.us66

polly.loop_header2.us61.preheader:                ; preds = %polly.loop_header.us51
  br label %polly.loop_header2.us61

polly.loop_header2.us61:                          ; preds = %polly.loop_header2.us61.preheader, %polly.loop_header2.us61
  %polly.indvar5.us62 = phi i64 [ %polly.indvar_next6.us64, %polly.loop_header2.us61 ], [ 0, %polly.loop_header2.us61.preheader ]
  %17 = mul i64 %polly.indvar5.us62, 7
  %18 = add i64 %17, 28
  %scevgep9.us63 = getelementptr i32, i32* %scevgep, i64 %18
  store i32 0, i32* %scevgep9.us63, align 4, !alias.scope !100, !noalias !102
  %polly.indvar_next6.us64 = add nuw nsw i64 %polly.indvar5.us62, 1
  %polly.loop_cond8.us65 = icmp sgt i64 %polly.indvar5.us62, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us65, label %polly.merge.us66.loopexit, label %polly.loop_header2.us61

polly.merge.us66.loopexit:                        ; preds = %polly.loop_header2.us61
  br label %polly.merge.us66

polly.merge.us66:                                 ; preds = %polly.merge.us66.loopexit, %polly.loop_header.us51
  %polly.indvar_next.us67 = add nsw i64 %polly.indvar.us52, 1
  %polly.loop_cond.us68 = icmp sgt i64 %polly.indvar.us52, %polly.adjust_ub
  br i1 %polly.loop_cond.us68, label %polly.par.checkNext.loopexit.loopexit94, label %polly.loop_header.us51

polly.loop_header:                                ; preds = %polly.loop_header.preheader, %polly.loop_header
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_header ], [ %polly.par.LB, %polly.loop_header.preheader ]
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit.loopexit95, label %polly.loop_header
}

define internal void @findMoves_polly_subfn_10(i8* nocapture readnone %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.userContext13 = alloca { i64 }, align 8
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %2 = bitcast { i64 }* %polly.par.userContext13 to i8*
  %polly.subfn.storeaddr.polly.indvar = getelementptr inbounds { i64 }, { i64 }* %polly.par.userContext13, i64 0, i32 0
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.merge10
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.merge10, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.merge10 ]
  %5 = icmp slt i64 %polly.indvar, 3
  br i1 %5, label %polly.loop_preheader3, label %polly.parallel.for

polly.merge10:                                    ; preds = %polly.loop_preheader3, %polly.parallel.for
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_preheader3:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  store i32 0, i32* %scevgep, align 4, !alias.scope !106, !noalias !123, !llvm.mem.parallel_loop_access !161
  %scevgep8.1 = getelementptr i32, i32* %scevgep, i64 7
  store i32 0, i32* %scevgep8.1, align 4, !alias.scope !106, !noalias !123, !llvm.mem.parallel_loop_access !161
  %scevgep8.2 = getelementptr i32, i32* %scevgep, i64 14
  store i32 0, i32* %scevgep8.2, align 4, !alias.scope !106, !noalias !123, !llvm.mem.parallel_loop_access !161
  %scevgep8.3 = getelementptr i32, i32* %scevgep, i64 21
  store i32 0, i32* %scevgep8.3, align 4, !alias.scope !106, !noalias !123, !llvm.mem.parallel_loop_access !161
  %6 = icmp eq i64 %polly.indvar, 2
  br i1 %6, label %polly.merge10, label %polly.parallel.for

polly.parallel.for:                               ; preds = %polly.loop_header, %polly.loop_preheader3
  call void @llvm.lifetime.start(i64 8, i8* %2)
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @findMoves_polly_subfn_10_polly_subfn, i8* %2, i32 0, i64 0, i64 2, i64 1)
  call void @findMoves_polly_subfn_10_polly_subfn(i8* %2)
  call void @GOMP_parallel_end()
  call void @llvm.lifetime.end(i64 8, i8* %2)
  br label %polly.merge10
}

define internal void @findMoves_polly_subfn_10_polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.polly.indvar = load i64, i64* %0, align 8
  %1 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.subfunc.arg.polly.indvar
  %3 = sub nsw i64 1, %polly.subfunc.arg.polly.indvar
  %polly.loop_guard = icmp sgt i64 %3, -1
  %polly.adjust_ub7 = add i64 %3, -1
  %4 = icmp sgt i64 %polly.subfunc.arg.polly.indvar, 2
  %5 = sub nsw i64 5, %polly.subfunc.arg.polly.indvar
  %polly.loop_guard18 = icmp sgt i64 %5, -1
  %polly.adjust_ub21 = add i64 %5, -1
  %polly.loop_guard.not = xor i1 %polly.loop_guard, true
  %polly.loop_guard.not76 = xor i1 %polly.loop_guard, true
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit.loopexit:            ; preds = %polly.merge.us.us
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit94:          ; preds = %polly.merge.us
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit95:          ; preds = %polly.merge.us46
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit96:          ; preds = %polly.merge.us68
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit97:          ; preds = %polly.loop_header
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit:                     ; preds = %polly.par.checkNext.loopexit.loopexit97, %polly.par.checkNext.loopexit.loopexit96, %polly.par.checkNext.loopexit.loopexit95, %polly.par.checkNext.loopexit.loopexit94, %polly.par.checkNext.loopexit.loopexit
  %6 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br i1 %4, label %polly.par.loadIVBounds.split.us, label %polly.par.loadIVBounds.split

polly.par.loadIVBounds.split.us:                  ; preds = %polly.par.loadIVBounds
  br i1 %polly.loop_guard18, label %polly.loop_header.us.us.preheader, label %polly.loop_header.us.preheader

polly.loop_header.us.preheader:                   ; preds = %polly.par.loadIVBounds.split.us
  br label %polly.loop_header.us

polly.loop_header.us.us.preheader:                ; preds = %polly.par.loadIVBounds.split.us
  br label %polly.loop_header.us.us

polly.loop_header.us.us:                          ; preds = %polly.loop_header.us.us.preheader, %polly.merge.us.us
  %polly.indvar.us.us = phi i64 [ %polly.indvar_next.us.us, %polly.merge.us.us ], [ %polly.par.LB, %polly.loop_header.us.us.preheader ]
  %8 = icmp eq i64 %polly.indvar.us.us, 1
  br i1 %8, label %polly.then.us.us, label %polly.loop_header15.us.us.preheader

polly.loop_header15.us.us.preheader:              ; preds = %polly.loop_header.us.us
  br label %polly.loop_header15.us.us

polly.then.us.us:                                 ; preds = %polly.loop_header.us.us
  br i1 %polly.loop_guard, label %polly.loop_header2.us.us.preheader, label %polly.merge.us.us

polly.loop_header2.us.us.preheader:               ; preds = %polly.then.us.us
  br label %polly.loop_header2.us.us

polly.merge.us.us.loopexit:                       ; preds = %polly.loop_header2.us.us
  br label %polly.merge.us.us

polly.merge.us.us.loopexit93:                     ; preds = %polly.loop_header15.us.us
  br label %polly.merge.us.us

polly.merge.us.us:                                ; preds = %polly.merge.us.us.loopexit93, %polly.merge.us.us.loopexit, %polly.then.us.us
  %polly.indvar_next.us.us = add nsw i64 %polly.indvar.us.us, 1
  %polly.loop_cond.us.us = icmp sgt i64 %polly.indvar.us.us, %polly.adjust_ub
  br i1 %polly.loop_cond.us.us, label %polly.par.checkNext.loopexit.loopexit, label %polly.loop_header.us.us

polly.loop_header15.us.us:                        ; preds = %polly.loop_header15.us.us.preheader, %polly.loop_header15.us.us
  %polly.indvar19.us.us = phi i64 [ %polly.indvar_next20.us.us, %polly.loop_header15.us.us ], [ 0, %polly.loop_header15.us.us.preheader ]
  %9 = mul i64 %polly.indvar19.us.us, 7
  %scevgep25.us.us = getelementptr i32, i32* %scevgep, i64 %9
  store i32 0, i32* %scevgep25.us.us, align 4, !alias.scope !106, !noalias !123
  %polly.indvar_next20.us.us = add nuw nsw i64 %polly.indvar19.us.us, 1
  %polly.loop_cond22.us.us = icmp sgt i64 %polly.indvar19.us.us, %polly.adjust_ub21
  br i1 %polly.loop_cond22.us.us, label %polly.merge.us.us.loopexit93, label %polly.loop_header15.us.us

polly.loop_header2.us.us:                         ; preds = %polly.loop_header2.us.us.preheader, %polly.loop_header2.us.us
  %polly.indvar5.us.us = phi i64 [ %polly.indvar_next6.us.us, %polly.loop_header2.us.us ], [ 0, %polly.loop_header2.us.us.preheader ]
  %10 = mul i64 %polly.indvar5.us.us, 7
  %11 = add i64 %10, 28
  %scevgep9.us.us = getelementptr i32, i32* %scevgep, i64 %11
  store i32 0, i32* %scevgep9.us.us, align 4, !alias.scope !106, !noalias !123
  %polly.indvar_next6.us.us = add nuw nsw i64 %polly.indvar5.us.us, 1
  %polly.loop_cond8.us.us = icmp sgt i64 %polly.indvar5.us.us, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us.us, label %polly.merge.us.us.loopexit, label %polly.loop_header2.us.us

polly.loop_header.us:                             ; preds = %polly.loop_header.us.preheader, %polly.merge.us
  %polly.indvar.us = phi i64 [ %polly.indvar_next.us, %polly.merge.us ], [ %polly.par.LB, %polly.loop_header.us.preheader ]
  %.not = icmp ne i64 %polly.indvar.us, 1
  %brmerge = or i1 %.not, %polly.loop_guard.not
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header2.us.preheader

polly.loop_header2.us.preheader:                  ; preds = %polly.loop_header.us
  br label %polly.loop_header2.us

polly.loop_header2.us:                            ; preds = %polly.loop_header2.us.preheader, %polly.loop_header2.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_header2.us ], [ 0, %polly.loop_header2.us.preheader ]
  %12 = mul i64 %polly.indvar5.us, 7
  %13 = add i64 %12, 28
  %scevgep9.us = getelementptr i32, i32* %scevgep, i64 %13
  store i32 0, i32* %scevgep9.us, align 4, !alias.scope !106, !noalias !123
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %polly.loop_cond8.us = icmp sgt i64 %polly.indvar5.us, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us, label %polly.merge.us.loopexit, label %polly.loop_header2.us

polly.merge.us.loopexit:                          ; preds = %polly.loop_header2.us
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.loop_header.us
  %polly.indvar_next.us = add nsw i64 %polly.indvar.us, 1
  %polly.loop_cond.us = icmp sgt i64 %polly.indvar.us, %polly.adjust_ub
  br i1 %polly.loop_cond.us, label %polly.par.checkNext.loopexit.loopexit94, label %polly.loop_header.us

polly.par.loadIVBounds.split:                     ; preds = %polly.par.loadIVBounds
  br i1 %polly.loop_guard18, label %polly.loop_header.us31.preheader, label %polly.par.loadIVBounds.split.split

polly.loop_header.us31.preheader:                 ; preds = %polly.par.loadIVBounds.split
  br label %polly.loop_header.us31

polly.loop_header.us31:                           ; preds = %polly.loop_header.us31.preheader, %polly.merge.us46
  %polly.indvar.us32 = phi i64 [ %polly.indvar_next.us47, %polly.merge.us46 ], [ %polly.par.LB, %polly.loop_header.us31.preheader ]
  %.not75 = icmp ne i64 %polly.indvar.us32, 1
  %brmerge77 = or i1 %.not75, %polly.loop_guard.not76
  br i1 %brmerge77, label %polly.merge.us46, label %polly.loop_header2.us41.preheader

polly.loop_header2.us41.preheader:                ; preds = %polly.loop_header.us31
  br label %polly.loop_header2.us41

polly.loop_header2.us41:                          ; preds = %polly.loop_header2.us41.preheader, %polly.loop_header2.us41
  %polly.indvar5.us42 = phi i64 [ %polly.indvar_next6.us44, %polly.loop_header2.us41 ], [ 0, %polly.loop_header2.us41.preheader ]
  %14 = mul i64 %polly.indvar5.us42, 7
  %15 = add i64 %14, 28
  %scevgep9.us43 = getelementptr i32, i32* %scevgep, i64 %15
  store i32 0, i32* %scevgep9.us43, align 4, !alias.scope !106, !noalias !123
  %polly.indvar_next6.us44 = add nuw nsw i64 %polly.indvar5.us42, 1
  %polly.loop_cond8.us45 = icmp sgt i64 %polly.indvar5.us42, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us45, label %polly.merge.us46.loopexit, label %polly.loop_header2.us41

polly.merge.us46.loopexit:                        ; preds = %polly.loop_header2.us41
  br label %polly.merge.us46

polly.merge.us46:                                 ; preds = %polly.merge.us46.loopexit, %polly.loop_header.us31
  %polly.indvar_next.us47 = add nsw i64 %polly.indvar.us32, 1
  %polly.loop_cond.us48 = icmp sgt i64 %polly.indvar.us32, %polly.adjust_ub
  br i1 %polly.loop_cond.us48, label %polly.par.checkNext.loopexit.loopexit95, label %polly.loop_header.us31

polly.par.loadIVBounds.split.split:               ; preds = %polly.par.loadIVBounds.split
  br i1 %polly.loop_guard, label %polly.loop_header.us53.preheader, label %polly.loop_header.preheader

polly.loop_header.preheader:                      ; preds = %polly.par.loadIVBounds.split.split
  br label %polly.loop_header

polly.loop_header.us53.preheader:                 ; preds = %polly.par.loadIVBounds.split.split
  br label %polly.loop_header.us53

polly.loop_header.us53:                           ; preds = %polly.loop_header.us53.preheader, %polly.merge.us68
  %polly.indvar.us54 = phi i64 [ %polly.indvar_next.us69, %polly.merge.us68 ], [ %polly.par.LB, %polly.loop_header.us53.preheader ]
  %16 = icmp eq i64 %polly.indvar.us54, 1
  br i1 %16, label %polly.loop_header2.us63.preheader, label %polly.merge.us68

polly.loop_header2.us63.preheader:                ; preds = %polly.loop_header.us53
  br label %polly.loop_header2.us63

polly.loop_header2.us63:                          ; preds = %polly.loop_header2.us63.preheader, %polly.loop_header2.us63
  %polly.indvar5.us64 = phi i64 [ %polly.indvar_next6.us66, %polly.loop_header2.us63 ], [ 0, %polly.loop_header2.us63.preheader ]
  %17 = mul i64 %polly.indvar5.us64, 7
  %18 = add i64 %17, 28
  %scevgep9.us65 = getelementptr i32, i32* %scevgep, i64 %18
  store i32 0, i32* %scevgep9.us65, align 4, !alias.scope !106, !noalias !123
  %polly.indvar_next6.us66 = add nuw nsw i64 %polly.indvar5.us64, 1
  %polly.loop_cond8.us67 = icmp sgt i64 %polly.indvar5.us64, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us67, label %polly.merge.us68.loopexit, label %polly.loop_header2.us63

polly.merge.us68.loopexit:                        ; preds = %polly.loop_header2.us63
  br label %polly.merge.us68

polly.merge.us68:                                 ; preds = %polly.merge.us68.loopexit, %polly.loop_header.us53
  %polly.indvar_next.us69 = add nsw i64 %polly.indvar.us54, 1
  %polly.loop_cond.us70 = icmp sgt i64 %polly.indvar.us54, %polly.adjust_ub
  br i1 %polly.loop_cond.us70, label %polly.par.checkNext.loopexit.loopexit96, label %polly.loop_header.us53

polly.loop_header:                                ; preds = %polly.loop_header.preheader, %polly.loop_header
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_header ], [ %polly.par.LB, %polly.loop_header.preheader ]
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit.loopexit97, label %polly.loop_header
}

define internal void @findMoves_polly_subfn_11(i8* nocapture readnone %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.userContext13 = alloca { i64 }, align 8
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %2 = bitcast { i64 }* %polly.par.userContext13 to i8*
  %polly.subfn.storeaddr.polly.indvar = getelementptr inbounds { i64 }, { i64 }* %polly.par.userContext13, i64 0, i32 0
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.merge10
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.merge10, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.merge10 ]
  %5 = icmp slt i64 %polly.indvar, 3
  br i1 %5, label %polly.loop_preheader3, label %polly.parallel.for

polly.merge10:                                    ; preds = %polly.loop_preheader3, %polly.parallel.for
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_preheader3:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar
  store i32 0, i32* %scevgep, align 4, !alias.scope !105, !noalias !117, !llvm.mem.parallel_loop_access !162
  %scevgep8.1 = getelementptr i32, i32* %scevgep, i64 7
  store i32 0, i32* %scevgep8.1, align 4, !alias.scope !105, !noalias !117, !llvm.mem.parallel_loop_access !162
  %scevgep8.2 = getelementptr i32, i32* %scevgep, i64 14
  store i32 0, i32* %scevgep8.2, align 4, !alias.scope !105, !noalias !117, !llvm.mem.parallel_loop_access !162
  %scevgep8.3 = getelementptr i32, i32* %scevgep, i64 21
  store i32 0, i32* %scevgep8.3, align 4, !alias.scope !105, !noalias !117, !llvm.mem.parallel_loop_access !162
  %6 = icmp eq i64 %polly.indvar, 2
  br i1 %6, label %polly.merge10, label %polly.parallel.for

polly.parallel.for:                               ; preds = %polly.loop_header, %polly.loop_preheader3
  call void @llvm.lifetime.start(i64 8, i8* %2)
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @findMoves_polly_subfn_11_polly_subfn, i8* %2, i32 0, i64 0, i64 2, i64 1)
  call void @findMoves_polly_subfn_11_polly_subfn(i8* %2)
  call void @GOMP_parallel_end()
  call void @llvm.lifetime.end(i64 8, i8* %2)
  br label %polly.merge10
}

define internal void @findMoves_polly_subfn_11_polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.polly.indvar = load i64, i64* %0, align 8
  %1 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.subfunc.arg.polly.indvar
  %3 = sub nsw i64 1, %polly.subfunc.arg.polly.indvar
  %polly.loop_guard = icmp sgt i64 %3, -1
  %polly.adjust_ub7 = add i64 %3, -1
  %4 = icmp sgt i64 %polly.subfunc.arg.polly.indvar, 2
  %5 = sub nsw i64 5, %polly.subfunc.arg.polly.indvar
  %polly.loop_guard18 = icmp sgt i64 %5, -1
  %polly.adjust_ub21 = add i64 %5, -1
  %polly.loop_guard.not = xor i1 %polly.loop_guard, true
  %polly.loop_guard.not74 = xor i1 %polly.loop_guard, true
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit.loopexit:            ; preds = %polly.merge.us.us
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit92:          ; preds = %polly.merge.us
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit93:          ; preds = %polly.merge.us44
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit94:          ; preds = %polly.merge.us66
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit.loopexit95:          ; preds = %polly.loop_header
  br label %polly.par.checkNext.loopexit

polly.par.checkNext.loopexit:                     ; preds = %polly.par.checkNext.loopexit.loopexit95, %polly.par.checkNext.loopexit.loopexit94, %polly.par.checkNext.loopexit.loopexit93, %polly.par.checkNext.loopexit.loopexit92, %polly.par.checkNext.loopexit.loopexit
  %6 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br i1 %4, label %polly.par.loadIVBounds.split.us, label %polly.par.loadIVBounds.split

polly.par.loadIVBounds.split.us:                  ; preds = %polly.par.loadIVBounds
  br i1 %polly.loop_guard18, label %polly.loop_header.us.us.preheader, label %polly.loop_header.us.preheader

polly.loop_header.us.preheader:                   ; preds = %polly.par.loadIVBounds.split.us
  br label %polly.loop_header.us

polly.loop_header.us.us.preheader:                ; preds = %polly.par.loadIVBounds.split.us
  br label %polly.loop_header.us.us

polly.loop_header.us.us:                          ; preds = %polly.loop_header.us.us.preheader, %polly.merge.us.us
  %polly.indvar.us.us = phi i64 [ %polly.indvar_next.us.us, %polly.merge.us.us ], [ %polly.par.LB, %polly.loop_header.us.us.preheader ]
  %8 = icmp eq i64 %polly.indvar.us.us, 1
  br i1 %8, label %polly.then.us.us, label %polly.loop_header15.us.us.preheader

polly.loop_header15.us.us.preheader:              ; preds = %polly.loop_header.us.us
  br label %polly.loop_header15.us.us

polly.then.us.us:                                 ; preds = %polly.loop_header.us.us
  br i1 %polly.loop_guard, label %polly.loop_header2.us.us.preheader, label %polly.merge.us.us

polly.loop_header2.us.us.preheader:               ; preds = %polly.then.us.us
  br label %polly.loop_header2.us.us

polly.merge.us.us.loopexit:                       ; preds = %polly.loop_header2.us.us
  br label %polly.merge.us.us

polly.merge.us.us.loopexit91:                     ; preds = %polly.loop_header15.us.us
  br label %polly.merge.us.us

polly.merge.us.us:                                ; preds = %polly.merge.us.us.loopexit91, %polly.merge.us.us.loopexit, %polly.then.us.us
  %polly.indvar_next.us.us = add nsw i64 %polly.indvar.us.us, 1
  %polly.loop_cond.us.us = icmp sgt i64 %polly.indvar.us.us, %polly.adjust_ub
  br i1 %polly.loop_cond.us.us, label %polly.par.checkNext.loopexit.loopexit, label %polly.loop_header.us.us

polly.loop_header15.us.us:                        ; preds = %polly.loop_header15.us.us.preheader, %polly.loop_header15.us.us
  %polly.indvar19.us.us = phi i64 [ %polly.indvar_next20.us.us, %polly.loop_header15.us.us ], [ 0, %polly.loop_header15.us.us.preheader ]
  %9 = mul i64 %polly.indvar19.us.us, 7
  %scevgep25.us.us = getelementptr i32, i32* %scevgep, i64 %9
  store i32 0, i32* %scevgep25.us.us, align 4, !alias.scope !105, !noalias !117
  %polly.indvar_next20.us.us = add nuw nsw i64 %polly.indvar19.us.us, 1
  %polly.loop_cond22.us.us = icmp sgt i64 %polly.indvar19.us.us, %polly.adjust_ub21
  br i1 %polly.loop_cond22.us.us, label %polly.merge.us.us.loopexit91, label %polly.loop_header15.us.us

polly.loop_header2.us.us:                         ; preds = %polly.loop_header2.us.us.preheader, %polly.loop_header2.us.us
  %polly.indvar5.us.us = phi i64 [ %polly.indvar_next6.us.us, %polly.loop_header2.us.us ], [ 0, %polly.loop_header2.us.us.preheader ]
  %10 = mul i64 %polly.indvar5.us.us, 7
  %11 = add i64 %10, 28
  %scevgep9.us.us = getelementptr i32, i32* %scevgep, i64 %11
  store i32 0, i32* %scevgep9.us.us, align 4, !alias.scope !105, !noalias !117
  %polly.indvar_next6.us.us = add nuw nsw i64 %polly.indvar5.us.us, 1
  %polly.loop_cond8.us.us = icmp sgt i64 %polly.indvar5.us.us, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us.us, label %polly.merge.us.us.loopexit, label %polly.loop_header2.us.us

polly.loop_header.us:                             ; preds = %polly.loop_header.us.preheader, %polly.merge.us
  %polly.indvar.us = phi i64 [ %polly.indvar_next.us, %polly.merge.us ], [ %polly.par.LB, %polly.loop_header.us.preheader ]
  %.not = icmp ne i64 %polly.indvar.us, 1
  %brmerge = or i1 %.not, %polly.loop_guard.not
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header2.us.preheader

polly.loop_header2.us.preheader:                  ; preds = %polly.loop_header.us
  br label %polly.loop_header2.us

polly.loop_header2.us:                            ; preds = %polly.loop_header2.us.preheader, %polly.loop_header2.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_header2.us ], [ 0, %polly.loop_header2.us.preheader ]
  %12 = mul i64 %polly.indvar5.us, 7
  %13 = add i64 %12, 28
  %scevgep9.us = getelementptr i32, i32* %scevgep, i64 %13
  store i32 0, i32* %scevgep9.us, align 4, !alias.scope !105, !noalias !117
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %polly.loop_cond8.us = icmp sgt i64 %polly.indvar5.us, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us, label %polly.merge.us.loopexit, label %polly.loop_header2.us

polly.merge.us.loopexit:                          ; preds = %polly.loop_header2.us
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.loop_header.us
  %polly.indvar_next.us = add nsw i64 %polly.indvar.us, 1
  %polly.loop_cond.us = icmp sgt i64 %polly.indvar.us, %polly.adjust_ub
  br i1 %polly.loop_cond.us, label %polly.par.checkNext.loopexit.loopexit92, label %polly.loop_header.us

polly.par.loadIVBounds.split:                     ; preds = %polly.par.loadIVBounds
  br i1 %polly.loop_guard18, label %polly.loop_header.us29.preheader, label %polly.par.loadIVBounds.split.split

polly.loop_header.us29.preheader:                 ; preds = %polly.par.loadIVBounds.split
  br label %polly.loop_header.us29

polly.loop_header.us29:                           ; preds = %polly.loop_header.us29.preheader, %polly.merge.us44
  %polly.indvar.us30 = phi i64 [ %polly.indvar_next.us45, %polly.merge.us44 ], [ %polly.par.LB, %polly.loop_header.us29.preheader ]
  %.not73 = icmp ne i64 %polly.indvar.us30, 1
  %brmerge75 = or i1 %.not73, %polly.loop_guard.not74
  br i1 %brmerge75, label %polly.merge.us44, label %polly.loop_header2.us39.preheader

polly.loop_header2.us39.preheader:                ; preds = %polly.loop_header.us29
  br label %polly.loop_header2.us39

polly.loop_header2.us39:                          ; preds = %polly.loop_header2.us39.preheader, %polly.loop_header2.us39
  %polly.indvar5.us40 = phi i64 [ %polly.indvar_next6.us42, %polly.loop_header2.us39 ], [ 0, %polly.loop_header2.us39.preheader ]
  %14 = mul i64 %polly.indvar5.us40, 7
  %15 = add i64 %14, 28
  %scevgep9.us41 = getelementptr i32, i32* %scevgep, i64 %15
  store i32 0, i32* %scevgep9.us41, align 4, !alias.scope !105, !noalias !117
  %polly.indvar_next6.us42 = add nuw nsw i64 %polly.indvar5.us40, 1
  %polly.loop_cond8.us43 = icmp sgt i64 %polly.indvar5.us40, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us43, label %polly.merge.us44.loopexit, label %polly.loop_header2.us39

polly.merge.us44.loopexit:                        ; preds = %polly.loop_header2.us39
  br label %polly.merge.us44

polly.merge.us44:                                 ; preds = %polly.merge.us44.loopexit, %polly.loop_header.us29
  %polly.indvar_next.us45 = add nsw i64 %polly.indvar.us30, 1
  %polly.loop_cond.us46 = icmp sgt i64 %polly.indvar.us30, %polly.adjust_ub
  br i1 %polly.loop_cond.us46, label %polly.par.checkNext.loopexit.loopexit93, label %polly.loop_header.us29

polly.par.loadIVBounds.split.split:               ; preds = %polly.par.loadIVBounds.split
  br i1 %polly.loop_guard, label %polly.loop_header.us51.preheader, label %polly.loop_header.preheader

polly.loop_header.preheader:                      ; preds = %polly.par.loadIVBounds.split.split
  br label %polly.loop_header

polly.loop_header.us51.preheader:                 ; preds = %polly.par.loadIVBounds.split.split
  br label %polly.loop_header.us51

polly.loop_header.us51:                           ; preds = %polly.loop_header.us51.preheader, %polly.merge.us66
  %polly.indvar.us52 = phi i64 [ %polly.indvar_next.us67, %polly.merge.us66 ], [ %polly.par.LB, %polly.loop_header.us51.preheader ]
  %16 = icmp eq i64 %polly.indvar.us52, 1
  br i1 %16, label %polly.loop_header2.us61.preheader, label %polly.merge.us66

polly.loop_header2.us61.preheader:                ; preds = %polly.loop_header.us51
  br label %polly.loop_header2.us61

polly.loop_header2.us61:                          ; preds = %polly.loop_header2.us61.preheader, %polly.loop_header2.us61
  %polly.indvar5.us62 = phi i64 [ %polly.indvar_next6.us64, %polly.loop_header2.us61 ], [ 0, %polly.loop_header2.us61.preheader ]
  %17 = mul i64 %polly.indvar5.us62, 7
  %18 = add i64 %17, 28
  %scevgep9.us63 = getelementptr i32, i32* %scevgep, i64 %18
  store i32 0, i32* %scevgep9.us63, align 4, !alias.scope !105, !noalias !117
  %polly.indvar_next6.us64 = add nuw nsw i64 %polly.indvar5.us62, 1
  %polly.loop_cond8.us65 = icmp sgt i64 %polly.indvar5.us62, %polly.adjust_ub7
  br i1 %polly.loop_cond8.us65, label %polly.merge.us66.loopexit, label %polly.loop_header2.us61

polly.merge.us66.loopexit:                        ; preds = %polly.loop_header2.us61
  br label %polly.merge.us66

polly.merge.us66:                                 ; preds = %polly.merge.us66.loopexit, %polly.loop_header.us51
  %polly.indvar_next.us67 = add nsw i64 %polly.indvar.us52, 1
  %polly.loop_cond.us68 = icmp sgt i64 %polly.indvar.us52, %polly.adjust_ub
  br i1 %polly.loop_cond.us68, label %polly.par.checkNext.loopexit.loopexit94, label %polly.loop_header.us51

polly.loop_header:                                ; preds = %polly.loop_header.preheader, %polly.loop_header
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_header ], [ %polly.par.LB, %polly.loop_header.preheader ]
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit.loopexit95, label %polly.loop_header
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
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3, globals: !23)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/handwritten")
!2 = !{}
!3 = !{!4, !10, !15, !22}
!4 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 26, type: !5, isLocal: false, isDefinition: true, scopeLine: 26, isOptimized: true, variables: !7)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = !{!8}
!8 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 27, type: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = distinct !DISubprogram(name: "play", scope: !1, file: !1, line: 35, type: !5, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: true, variables: !11)
!11 = !{!12, !13, !14}
!12 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 36, type: !9)
!13 = !DILocalVariable(name: "j", scope: !10, file: !1, line: 36, type: !9)
!14 = !DILocalVariable(name: "index", scope: !10, file: !1, line: 38, type: !9)
!15 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 103, type: !16, isLocal: false, isDefinition: true, scopeLine: 103, isOptimized: true, variables: !18)
!16 = !DISubroutineType(types: !17)
!17 = !{!9}
!18 = !{!19, !20, !21}
!19 = !DILocalVariable(name: "s", scope: !15, file: !1, line: 104, type: !9)
!20 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 104, type: !9)
!21 = !DILocalVariable(name: "j", scope: !15, file: !1, line: 104, type: !9)
!22 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 154, type: !16, isLocal: false, isDefinition: true, scopeLine: 154, isOptimized: true, variables: !2)
!23 = !{!24, !28, !29, !30, !33, !34, !35, !36}
!24 = !DIGlobalVariable(name: "V", scope: !0, file: !1, line: 14, type: !25, isLocal: false, isDefinition: true, variable: [6 x i32]* @V)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 192, align: 32, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 6)
!28 = !DIGlobalVariable(name: "sum_alice", scope: !0, file: !1, line: 24, type: !9, isLocal: false, isDefinition: true, variable: i32* @sum_alice)
!29 = !DIGlobalVariable(name: "sum_bob", scope: !0, file: !1, line: 24, type: !9, isLocal: false, isDefinition: true, variable: i32* @sum_bob)
!30 = !DIGlobalVariable(name: "M", scope: !0, file: !1, line: 17, type: !31, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @M)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 1152, align: 32, elements: !32)
!32 = !{!27, !27}
!33 = !DIGlobalVariable(name: "X", scope: !0, file: !1, line: 20, type: !31, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @X)
!34 = !DIGlobalVariable(name: "Y", scope: !0, file: !1, line: 21, type: !31, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Y)
!35 = !DIGlobalVariable(name: "Z", scope: !0, file: !1, line: 22, type: !31, isLocal: false, isDefinition: true, variable: [6 x [6 x i32]]* @Z)
!36 = !DIGlobalVariable(name: "coins", scope: !0, file: !1, line: 23, type: !25, isLocal: false, isDefinition: true, variable: [6 x i32]* @coins)
!37 = !{i32 2, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 3}
!39 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!40 = !DILocation(line: 29, column: 2, scope: !4)
!41 = !DIExpression()
!42 = !DILocation(line: 27, column: 6, scope: !4)
!43 = !DILocation(line: 31, column: 8, scope: !44)
!44 = distinct !DILexicalBlock(scope: !45, file: !1, line: 30, column: 26)
!45 = distinct !DILexicalBlock(scope: !46, file: !1, line: 30, column: 2)
!46 = distinct !DILexicalBlock(scope: !4, file: !1, line: 30, column: 2)
!47 = !{!48, !48, i64 0}
!48 = !{!"int", !49, i64 0}
!49 = !{!"omnipotent char", !50, i64 0}
!50 = !{!"Simple C/C++ TBAA"}
!51 = !DILocation(line: 33, column: 1, scope: !4)
!52 = !DILocation(line: 36, column: 6, scope: !10)
!53 = !DILocation(line: 36, column: 13, scope: !10)
!54 = !DILocation(line: 38, column: 6, scope: !10)
!55 = !DILocation(line: 40, column: 7, scope: !56)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 40, column: 7)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 39, column: 36)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 39, column: 2)
!59 = distinct !DILexicalBlock(scope: !10, file: !1, line: 39, column: 2)
!60 = !DILocation(line: 40, column: 22, scope: !56)
!61 = !DILocation(line: 40, column: 19, scope: !56)
!62 = !DILocation(line: 40, column: 7, scope: !57)
!63 = !DILocation(line: 46, column: 19, scope: !64)
!64 = distinct !DILexicalBlock(scope: !56, file: !1, line: 44, column: 10)
!65 = !DILocation(line: 42, column: 17, scope: !66)
!66 = distinct !DILexicalBlock(scope: !56, file: !1, line: 40, column: 35)
!67 = !DILocation(line: 40, column: 11, scope: !56)
!68 = !DILocation(line: 40, column: 29, scope: !56)
!69 = !DILocation(line: 42, column: 19, scope: !66)
!70 = !DILocation(line: 46, column: 17, scope: !64)
!71 = !DILocation(line: 52, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 52, column: 6)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 51, column: 19)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 51, column: 2)
!75 = distinct !DILexicalBlock(scope: !10, file: !1, line: 51, column: 2)
!76 = !DILocation(line: 52, column: 6, scope: !73)
!77 = !DILocation(line: 53, column: 4, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !1, line: 52, column: 13)
!79 = !DILocation(line: 54, column: 3, scope: !78)
!80 = !DILocation(line: 55, column: 4, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !1, line: 54, column: 8)
!82 = !DILocation(line: 51, column: 2, scope: !83)
!83 = !DILexicalBlockFile(scope: !74, file: !1, discriminator: 1)
!84 = !DILocation(line: 57, column: 29, scope: !73)
!85 = !DILocation(line: 57, column: 3, scope: !73)
!86 = !DILocation(line: 60, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !88, file: !1, line: 59, column: 13)
!88 = distinct !DILexicalBlock(scope: !73, file: !1, line: 59, column: 6)
!89 = !DILocation(line: 59, column: 6, scope: !73)
!90 = !DILocation(line: 60, column: 14, scope: !87)
!91 = !DILocation(line: 61, column: 4, scope: !87)
!92 = !DILocation(line: 62, column: 3, scope: !87)
!93 = !DILocation(line: 63, column: 12, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !1, line: 62, column: 8)
!95 = !DILocation(line: 64, column: 4, scope: !94)
!96 = !DILocation(line: 68, column: 1, scope: !10)
!97 = !DILocation(line: 104, column: 6, scope: !15)
!98 = !DILocation(line: 152, column: 9, scope: !15)
!99 = !DILocation(line: 152, column: 2, scope: !15)
!100 = distinct !{!100, !101, !"polly.alias.scope.X"}
!101 = distinct !{!101, !"polly.alias.scope.domain"}
!102 = !{!103, !104, !105, !106, !107}
!103 = distinct !{!103, !101, !"polly.alias.scope.storemerge"}
!104 = distinct !{!104, !101, !"polly.alias.scope.V"}
!105 = distinct !{!105, !101, !"polly.alias.scope.Z"}
!106 = distinct !{!106, !101, !"polly.alias.scope.Y"}
!107 = distinct !{!107, !101, !"polly.alias.scope.M"}
!108 = !DILocation(line: 139, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !110, file: !1, line: 139, column: 8)
!110 = distinct !DILexicalBlock(scope: !111, file: !1, line: 135, column: 39)
!111 = distinct !DILexicalBlock(scope: !112, file: !1, line: 135, column: 3)
!112 = distinct !DILexicalBlock(scope: !113, file: !1, line: 135, column: 3)
!113 = distinct !DILexicalBlock(scope: !114, file: !1, line: 105, column: 26)
!114 = distinct !DILexicalBlock(scope: !115, file: !1, line: 105, column: 2)
!115 = distinct !DILexicalBlock(scope: !15, file: !1, line: 105, column: 2)
!116 = !{!103, !100, !105, !106, !107}
!117 = !{!103, !100, !104, !106, !107}
!118 = !DILocation(line: 139, column: 30, scope: !109)
!119 = !DILocation(line: 139, column: 23, scope: !109)
!120 = !DILocation(line: 139, column: 8, scope: !110)
!121 = !{!103, !100, !104, !105, !106}
!122 = distinct !{!122}
!123 = !{!103, !100, !104, !105, !107}
!124 = distinct !{!124}
!125 = !DILocation(line: 119, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !127, file: !1, line: 119, column: 9)
!127 = distinct !DILexicalBlock(scope: !128, file: !1, line: 117, column: 19)
!128 = distinct !DILexicalBlock(scope: !129, file: !1, line: 117, column: 8)
!129 = distinct !DILexicalBlock(scope: !130, file: !1, line: 107, column: 39)
!130 = distinct !DILexicalBlock(scope: !131, file: !1, line: 107, column: 3)
!131 = distinct !DILexicalBlock(scope: !113, file: !1, line: 107, column: 3)
!132 = !DILocation(line: 119, column: 9, scope: !127)
!133 = distinct !{!133}
!134 = !DILocation(line: 127, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !136, file: !1, line: 127, column: 9)
!136 = distinct !DILexicalBlock(scope: !137, file: !1, line: 125, column: 19)
!137 = distinct !DILexicalBlock(scope: !129, file: !1, line: 125, column: 8)
!138 = !DILocation(line: 127, column: 9, scope: !136)
!139 = !DILocation(line: 156, column: 2, scope: !22)
!140 = !DILocation(line: 157, column: 2, scope: !22)
!141 = !DILocation(line: 160, column: 6, scope: !142)
!142 = distinct !DILexicalBlock(scope: !22, file: !1, line: 160, column: 6)
!143 = !DILocation(line: 160, column: 19, scope: !142)
!144 = !DILocation(line: 160, column: 16, scope: !142)
!145 = !DILocation(line: 160, column: 6, scope: !22)
!146 = !DILocation(line: 161, column: 3, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !1, line: 160, column: 32)
!148 = !DILocation(line: 162, column: 3, scope: !147)
!149 = !DILocation(line: 165, column: 18, scope: !150)
!150 = distinct !DILexicalBlock(scope: !22, file: !1, line: 165, column: 6)
!151 = !DILocation(line: 165, column: 16, scope: !150)
!152 = !DILocation(line: 165, column: 6, scope: !22)
!153 = !DILocation(line: 166, column: 3, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !1, line: 165, column: 27)
!155 = !DILocation(line: 167, column: 3, scope: !154)
!156 = !DILocation(line: 170, column: 2, scope: !22)
!157 = !DILocation(line: 171, column: 65, scope: !22)
!158 = !DILocation(line: 171, column: 2, scope: !22)
!159 = !DILocation(line: 172, column: 1, scope: !22)
!160 = distinct !{!160}
!161 = distinct !{!161}
!162 = distinct !{!162}
