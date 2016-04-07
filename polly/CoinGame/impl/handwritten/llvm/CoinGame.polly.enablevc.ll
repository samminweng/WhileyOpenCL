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

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

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
define i32 @findMoves() #2 !dbg !15 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !19, metadata !41), !dbg !97
  br label %polly.loop_header

polly.exiting:                                    ; preds = %polly.loop_exit461
  %0 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !98, !tbaa !47
  ret i32 %0, !dbg !99

polly.loop_header:                                ; preds = %polly.loop_header.backedge, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar.be, %polly.loop_header.backedge ]
  %1 = icmp slt i64 %polly.indvar, 3
  br i1 %1, label %polly.loop_preheader233, label %polly.loop_preheader244.split.us

polly.merge240.loopexit:                          ; preds = %polly.loop_header253.us542.1
  br label %polly.merge240

polly.merge240.loopexit617:                       ; preds = %polly.loop_header253.us.us.1
  br label %polly.merge240

polly.merge240.loopexit618:                       ; preds = %polly.loop_header267.us
  br label %polly.merge240

polly.merge240:                                   ; preds = %polly.merge240.loopexit618, %polly.merge240.loopexit617, %polly.merge240.loopexit
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp slt i64 %polly.indvar, 5
  br i1 %polly.loop_cond, label %polly.loop_header.backedge, label %polly.loop_header278.preheader, !llvm.loop !100

polly.loop_header278.preheader:                   ; preds = %polly.merge240
  br label %polly.loop_header278

polly.loop_preheader233:                          ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  store i32 0, i32* %scevgep, align 4, !alias.scope !101, !noalias !103, !llvm.mem.parallel_loop_access !109
  %scevgep238.1 = getelementptr i32, i32* %scevgep, i64 7
  store i32 0, i32* %scevgep238.1, align 4, !alias.scope !101, !noalias !103, !llvm.mem.parallel_loop_access !109
  %scevgep238.2 = getelementptr i32, i32* %scevgep, i64 14
  store i32 0, i32* %scevgep238.2, align 4, !alias.scope !101, !noalias !103, !llvm.mem.parallel_loop_access !109
  %scevgep238.3 = getelementptr i32, i32* %scevgep, i64 21
  store i32 0, i32* %scevgep238.3, align 4, !alias.scope !101, !noalias !103, !llvm.mem.parallel_loop_access !109
  %2 = icmp eq i64 %polly.indvar, 2
  br i1 %2, label %polly.loop_header.backedge, label %polly.loop_preheader244.split

polly.loop_preheader244.split.us:                 ; preds = %polly.loop_header
  %3 = sub nsw i64 1, %polly.indvar
  %polly.loop_guard579 = icmp sgt i64 %3, -1
  %polly.adjust_ub580 = add i64 %3, -1
  %polly.adjust_ub272581 = sub i64 4, %polly.indvar
  %4 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  br i1 %polly.loop_guard579, label %polly.loop_header267.us.us.preheader, label %polly.loop_header267.us.preheader

polly.loop_header267.us.preheader:                ; preds = %polly.loop_preheader244.split.us
  br label %polly.loop_header267.us

polly.loop_header267.us.us.preheader:             ; preds = %polly.loop_preheader244.split.us
  br label %polly.loop_header267.us.us

polly.loop_header267.us.us:                       ; preds = %polly.loop_header267.us.us.preheader, %polly.loop_header267.us.us
  %polly.indvar270.us.us = phi i64 [ %polly.indvar_next271.us.us, %polly.loop_header267.us.us ], [ 0, %polly.loop_header267.us.us.preheader ]
  %5 = mul i64 %polly.indvar270.us.us, 7
  %scevgep276.us.us = getelementptr i32, i32* %4, i64 %5
  store i32 0, i32* %scevgep276.us.us, align 4, !alias.scope !101, !noalias !103, !llvm.mem.parallel_loop_access !111
  %polly.indvar_next271.us.us = add nuw nsw i64 %polly.indvar270.us.us, 1
  %polly.loop_cond273.us.us = icmp sgt i64 %polly.indvar270.us.us, %polly.adjust_ub272581
  br i1 %polly.loop_cond273.us.us, label %polly.loop_header253.us.us.1.preheader, label %polly.loop_header267.us.us

polly.loop_header253.us.us.1.preheader:           ; preds = %polly.loop_header267.us.us
  %6 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  br label %polly.loop_header253.us.us.1

polly.loop_header267.us:                          ; preds = %polly.loop_header267.us.preheader, %polly.loop_header267.us
  %polly.indvar270.us = phi i64 [ %polly.indvar_next271.us, %polly.loop_header267.us ], [ 0, %polly.loop_header267.us.preheader ]
  %7 = mul i64 %polly.indvar270.us, 7
  %scevgep276.us = getelementptr i32, i32* %4, i64 %7
  store i32 0, i32* %scevgep276.us, align 4, !alias.scope !101, !noalias !103, !llvm.mem.parallel_loop_access !111
  %polly.indvar_next271.us = add nuw nsw i64 %polly.indvar270.us, 1
  %polly.loop_cond273.us = icmp sgt i64 %polly.indvar270.us, %polly.adjust_ub272581
  br i1 %polly.loop_cond273.us, label %polly.merge240.loopexit618, label %polly.loop_header267.us

polly.loop_preheader244.split:                    ; preds = %polly.loop_preheader233
  %8 = sub nsw i64 1, %polly.indvar
  %polly.loop_guard = icmp sgt i64 %8, -1
  %polly.adjust_ub = add i64 %8, -1
  br i1 %polly.loop_guard, label %polly.loop_header253.us542.1.preheader, label %polly.merge240.thread

polly.loop_header253.us542.1.preheader:           ; preds = %polly.loop_preheader244.split
  %9 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  br label %polly.loop_header253.us542.1

polly.merge240.thread:                            ; preds = %polly.loop_preheader244.split
  %polly.indvar_next577 = add nsw i64 %polly.indvar, 1
  br label %polly.loop_header.backedge

polly.loop_header.backedge:                       ; preds = %polly.merge240.thread, %polly.merge240, %polly.loop_preheader233
  %polly.indvar.be = phi i64 [ %polly.indvar_next, %polly.merge240 ], [ 3, %polly.loop_preheader233 ], [ %polly.indvar_next577, %polly.merge240.thread ]
  br label %polly.loop_header

polly.loop_header278:                             ; preds = %polly.loop_header278.backedge, %polly.loop_header278.preheader
  %polly.indvar281 = phi i64 [ 0, %polly.loop_header278.preheader ], [ %polly.indvar281.be, %polly.loop_header278.backedge ]
  %10 = icmp slt i64 %polly.indvar281, 3
  br i1 %10, label %polly.loop_preheader289, label %polly.loop_preheader301.split.us

polly.merge297.loopexit:                          ; preds = %polly.loop_header311.us521.1
  br label %polly.merge297

polly.merge297.loopexit615:                       ; preds = %polly.loop_header311.us.us.1
  br label %polly.merge297

polly.merge297.loopexit616:                       ; preds = %polly.loop_header329.us
  br label %polly.merge297

polly.merge297:                                   ; preds = %polly.merge297.loopexit616, %polly.merge297.loopexit615, %polly.merge297.loopexit
  %polly.indvar_next282 = add nsw i64 %polly.indvar281, 1
  %polly.loop_cond283 = icmp slt i64 %polly.indvar281, 5
  br i1 %polly.loop_cond283, label %polly.loop_header278.backedge, label %polly.loop_header342.preheader, !llvm.loop !113

polly.loop_header342.preheader:                   ; preds = %polly.merge297
  br label %polly.loop_header342

polly.loop_preheader289:                          ; preds = %polly.loop_header278
  %scevgep294 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar281
  store i32 0, i32* %scevgep294, align 4, !alias.scope !108, !noalias !114, !llvm.mem.parallel_loop_access !115
  %scevgep295.1 = getelementptr i32, i32* %scevgep294, i64 7
  store i32 0, i32* %scevgep295.1, align 4, !alias.scope !108, !noalias !114, !llvm.mem.parallel_loop_access !115
  %scevgep295.2 = getelementptr i32, i32* %scevgep294, i64 14
  store i32 0, i32* %scevgep295.2, align 4, !alias.scope !108, !noalias !114, !llvm.mem.parallel_loop_access !115
  %scevgep295.3 = getelementptr i32, i32* %scevgep294, i64 21
  store i32 0, i32* %scevgep295.3, align 4, !alias.scope !108, !noalias !114, !llvm.mem.parallel_loop_access !115
  %11 = icmp eq i64 %polly.indvar281, 2
  br i1 %11, label %polly.loop_header278.backedge, label %polly.loop_preheader301.split

polly.loop_preheader301.split.us:                 ; preds = %polly.loop_header278
  %12 = sub nsw i64 1, %polly.indvar281
  %polly.loop_guard314587 = icmp sgt i64 %12, -1
  %polly.adjust_ub317588 = add i64 %12, -1
  %polly.adjust_ub334589 = sub i64 4, %polly.indvar281
  %13 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar281
  br i1 %polly.loop_guard314587, label %polly.loop_header329.us.us.preheader, label %polly.loop_header329.us.preheader

polly.loop_header329.us.preheader:                ; preds = %polly.loop_preheader301.split.us
  br label %polly.loop_header329.us

polly.loop_header329.us.us.preheader:             ; preds = %polly.loop_preheader301.split.us
  br label %polly.loop_header329.us.us

polly.loop_header329.us.us:                       ; preds = %polly.loop_header329.us.us.preheader, %polly.loop_header329.us.us
  %polly.indvar332.us.us = phi i64 [ %polly.indvar_next333.us.us, %polly.loop_header329.us.us ], [ 0, %polly.loop_header329.us.us.preheader ]
  %14 = mul i64 %polly.indvar332.us.us, 7
  %scevgep338.us.us = getelementptr i32, i32* %13, i64 %14
  store i32 0, i32* %scevgep338.us.us, align 4, !alias.scope !108, !noalias !114, !llvm.mem.parallel_loop_access !117
  %polly.indvar_next333.us.us = add nuw nsw i64 %polly.indvar332.us.us, 1
  %polly.loop_cond335.us.us = icmp sgt i64 %polly.indvar332.us.us, %polly.adjust_ub334589
  br i1 %polly.loop_cond335.us.us, label %polly.loop_header311.us.us.1.preheader, label %polly.loop_header329.us.us

polly.loop_header311.us.us.1.preheader:           ; preds = %polly.loop_header329.us.us
  %15 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar281
  br label %polly.loop_header311.us.us.1

polly.loop_header329.us:                          ; preds = %polly.loop_header329.us.preheader, %polly.loop_header329.us
  %polly.indvar332.us = phi i64 [ %polly.indvar_next333.us, %polly.loop_header329.us ], [ 0, %polly.loop_header329.us.preheader ]
  %16 = mul i64 %polly.indvar332.us, 7
  %scevgep338.us = getelementptr i32, i32* %13, i64 %16
  store i32 0, i32* %scevgep338.us, align 4, !alias.scope !108, !noalias !114, !llvm.mem.parallel_loop_access !117
  %polly.indvar_next333.us = add nuw nsw i64 %polly.indvar332.us, 1
  %polly.loop_cond335.us = icmp sgt i64 %polly.indvar332.us, %polly.adjust_ub334589
  br i1 %polly.loop_cond335.us, label %polly.merge297.loopexit616, label %polly.loop_header329.us

polly.loop_preheader301.split:                    ; preds = %polly.loop_preheader289
  %17 = sub nsw i64 1, %polly.indvar281
  %polly.loop_guard314 = icmp sgt i64 %17, -1
  %polly.adjust_ub317 = add i64 %17, -1
  br i1 %polly.loop_guard314, label %polly.loop_header311.us521.1.preheader, label %polly.merge297.thread

polly.loop_header311.us521.1.preheader:           ; preds = %polly.loop_preheader301.split
  %18 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar281
  br label %polly.loop_header311.us521.1

polly.merge297.thread:                            ; preds = %polly.loop_preheader301.split
  %polly.indvar_next282585 = add nsw i64 %polly.indvar281, 1
  br label %polly.loop_header278.backedge

polly.loop_header278.backedge:                    ; preds = %polly.merge297.thread, %polly.merge297, %polly.loop_preheader289
  %polly.indvar281.be = phi i64 [ %polly.indvar_next282, %polly.merge297 ], [ 3, %polly.loop_preheader289 ], [ %polly.indvar_next282585, %polly.merge297.thread ]
  br label %polly.loop_header278

polly.loop_header342:                             ; preds = %polly.loop_header342.backedge, %polly.loop_header342.preheader
  %polly.indvar345 = phi i64 [ 0, %polly.loop_header342.preheader ], [ %polly.indvar345.be, %polly.loop_header342.backedge ]
  %19 = icmp slt i64 %polly.indvar345, 3
  br i1 %19, label %polly.loop_preheader353, label %polly.loop_preheader365.split.us

polly.merge361.loopexit:                          ; preds = %polly.loop_header375.us500.1
  br label %polly.merge361

polly.merge361.loopexit613:                       ; preds = %polly.loop_header375.us.us.1
  br label %polly.merge361

polly.merge361.loopexit614:                       ; preds = %polly.loop_header391.us
  br label %polly.merge361

polly.merge361:                                   ; preds = %polly.merge361.loopexit614, %polly.merge361.loopexit613, %polly.merge361.loopexit
  %polly.indvar_next346 = add nsw i64 %polly.indvar345, 1
  %polly.loop_cond347 = icmp slt i64 %polly.indvar345, 5
  br i1 %polly.loop_cond347, label %polly.loop_header342.backedge, label %polly.loop_header402.preheader, !llvm.loop !119

polly.loop_header402.preheader:                   ; preds = %polly.merge361
  %_p_scalar_.prol = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 0), align 16
  br label %polly.loop_header402

polly.loop_preheader353:                          ; preds = %polly.loop_header342
  %scevgep358 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar345
  store i32 0, i32* %scevgep358, align 4, !alias.scope !105, !noalias !120, !llvm.mem.parallel_loop_access !121
  %scevgep359.1 = getelementptr i32, i32* %scevgep358, i64 7
  store i32 0, i32* %scevgep359.1, align 4, !alias.scope !105, !noalias !120, !llvm.mem.parallel_loop_access !121
  %scevgep359.2 = getelementptr i32, i32* %scevgep358, i64 14
  store i32 0, i32* %scevgep359.2, align 4, !alias.scope !105, !noalias !120, !llvm.mem.parallel_loop_access !121
  %scevgep359.3 = getelementptr i32, i32* %scevgep358, i64 21
  store i32 0, i32* %scevgep359.3, align 4, !alias.scope !105, !noalias !120, !llvm.mem.parallel_loop_access !121
  %20 = icmp eq i64 %polly.indvar345, 2
  br i1 %20, label %polly.loop_header342.backedge, label %polly.loop_preheader365.split

polly.loop_preheader365.split.us:                 ; preds = %polly.loop_header342
  %21 = sub nsw i64 1, %polly.indvar345
  %polly.loop_guard378595 = icmp sgt i64 %21, -1
  %polly.adjust_ub381596 = add i64 %21, -1
  %polly.adjust_ub396597 = sub i64 4, %polly.indvar345
  %22 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar345
  br i1 %polly.loop_guard378595, label %polly.loop_header391.us.us.preheader, label %polly.loop_header391.us.preheader

polly.loop_header391.us.preheader:                ; preds = %polly.loop_preheader365.split.us
  br label %polly.loop_header391.us

polly.loop_header391.us.us.preheader:             ; preds = %polly.loop_preheader365.split.us
  br label %polly.loop_header391.us.us

polly.loop_header391.us.us:                       ; preds = %polly.loop_header391.us.us.preheader, %polly.loop_header391.us.us
  %polly.indvar394.us.us = phi i64 [ %polly.indvar_next395.us.us, %polly.loop_header391.us.us ], [ 0, %polly.loop_header391.us.us.preheader ]
  %23 = mul i64 %polly.indvar394.us.us, 7
  %scevgep400.us.us = getelementptr i32, i32* %22, i64 %23
  store i32 0, i32* %scevgep400.us.us, align 4, !alias.scope !105, !noalias !120, !llvm.mem.parallel_loop_access !123
  %polly.indvar_next395.us.us = add nuw nsw i64 %polly.indvar394.us.us, 1
  %polly.loop_cond397.us.us = icmp sgt i64 %polly.indvar394.us.us, %polly.adjust_ub396597
  br i1 %polly.loop_cond397.us.us, label %polly.loop_header375.us.us.1.preheader, label %polly.loop_header391.us.us

polly.loop_header375.us.us.1.preheader:           ; preds = %polly.loop_header391.us.us
  %24 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar345
  br label %polly.loop_header375.us.us.1

polly.loop_header391.us:                          ; preds = %polly.loop_header391.us.preheader, %polly.loop_header391.us
  %polly.indvar394.us = phi i64 [ %polly.indvar_next395.us, %polly.loop_header391.us ], [ 0, %polly.loop_header391.us.preheader ]
  %25 = mul i64 %polly.indvar394.us, 7
  %scevgep400.us = getelementptr i32, i32* %22, i64 %25
  store i32 0, i32* %scevgep400.us, align 4, !alias.scope !105, !noalias !120, !llvm.mem.parallel_loop_access !123
  %polly.indvar_next395.us = add nuw nsw i64 %polly.indvar394.us, 1
  %polly.loop_cond397.us = icmp sgt i64 %polly.indvar394.us, %polly.adjust_ub396597
  br i1 %polly.loop_cond397.us, label %polly.merge361.loopexit614, label %polly.loop_header391.us

polly.loop_preheader365.split:                    ; preds = %polly.loop_preheader353
  %26 = sub nsw i64 1, %polly.indvar345
  %polly.loop_guard378 = icmp sgt i64 %26, -1
  %polly.adjust_ub381 = add i64 %26, -1
  br i1 %polly.loop_guard378, label %polly.loop_header375.us500.1.preheader, label %polly.merge361.thread

polly.loop_header375.us500.1.preheader:           ; preds = %polly.loop_preheader365.split
  %27 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar345
  br label %polly.loop_header375.us500.1

polly.merge361.thread:                            ; preds = %polly.loop_preheader365.split
  %polly.indvar_next346593 = add nsw i64 %polly.indvar345, 1
  br label %polly.loop_header342.backedge

polly.loop_header342.backedge:                    ; preds = %polly.merge361.thread, %polly.merge361, %polly.loop_preheader353
  %polly.indvar345.be = phi i64 [ %polly.indvar_next346, %polly.merge361 ], [ 3, %polly.loop_preheader353 ], [ %polly.indvar_next346593, %polly.merge361.thread ]
  br label %polly.loop_header342

polly.loop_header402:                             ; preds = %polly.loop_header402.preheader, %polly.loop_exit461
  %indvars.iv = phi i64 [ %indvars.iv.next, %polly.loop_exit461 ], [ 7, %polly.loop_header402.preheader ]
  %polly.indvar405 = phi i64 [ %polly.indvar_next406, %polly.loop_exit461 ], [ 0, %polly.loop_header402.preheader ]
  %28 = icmp sgt i64 %polly.indvar405, 0
  br i1 %28, label %polly.then410, label %polly.merge409

polly.merge409.loopexit.unr-lcssa:                ; preds = %polly.loop_header412
  br label %polly.merge409.loopexit

polly.merge409.loopexit:                          ; preds = %polly.then410.split, %polly.merge409.loopexit.unr-lcssa
  br label %polly.merge409

polly.merge409:                                   ; preds = %polly.merge409.loopexit, %polly.loop_header402
  %29 = sub nsw i64 1, %polly.indvar405
  %30 = icmp slt i64 %29, 0
  %31 = select i1 %30, i64 0, i64 %29
  %32 = sub nsw i64 5, %polly.indvar405
  %33 = icmp sgt i64 %32, 4
  %34 = select i1 %33, i64 4, i64 %32
  %polly.loop_guard431 = icmp sgt i64 %31, %34
  br i1 %polly.loop_guard431, label %polly.loop_exit430, label %polly.loop_preheader429

polly.loop_exit430.loopexit:                      ; preds = %polly.loop_header428
  br label %polly.loop_exit430

polly.loop_exit430:                               ; preds = %polly.loop_exit430.loopexit, %polly.merge409
  %35 = icmp sgt i64 %32, 3
  %36 = select i1 %35, i64 3, i64 %32
  %polly.loop_guard445 = icmp sgt i64 %36, -1
  br i1 %polly.loop_guard445, label %polly.loop_preheader443, label %polly.loop_exit444

polly.loop_exit444.loopexit:                      ; preds = %polly.loop_header442
  br label %polly.loop_exit444

polly.loop_exit444:                               ; preds = %polly.loop_exit444.loopexit, %polly.loop_exit430
  %37 = sub nsw i64 2, %polly.indvar405
  %38 = icmp slt i64 %37, 0
  %39 = select i1 %38, i64 0, i64 %37
  %polly.loop_guard462 = icmp sgt i64 %39, %32
  br i1 %polly.loop_guard462, label %polly.loop_exit461, label %polly.loop_preheader460

polly.loop_exit461.loopexit:                      ; preds = %polly.loop_header459
  br label %polly.loop_exit461

polly.loop_exit461:                               ; preds = %polly.loop_exit461.loopexit, %polly.loop_exit444
  %polly.indvar_next406 = add nuw nsw i64 %polly.indvar405, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %exitcond565 = icmp eq i64 %polly.indvar_next406, 7
  br i1 %exitcond565, label %polly.exiting, label %polly.loop_header402

polly.then410:                                    ; preds = %polly.loop_header402
  %40 = sub i64 7, %polly.indvar405
  %41 = add nsw i64 %polly.indvar405, -1
  %xtraiter = and i64 %40, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %polly.then410.split, label %polly.loop_header412.prol

polly.loop_header412.prol:                        ; preds = %polly.then410
  %42 = add nsw i64 %polly.indvar405, -1
  %scevgep420.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %42
  %_p_scalar_421.prol = load i32, i32* %scevgep420.prol, align 4, !alias.scope !101, !noalias !103
  %p_add100.prol = add nsw i32 %_p_scalar_421.prol, %_p_scalar_.prol, !dbg !125
  %43 = add nsw i64 %polly.indvar405, -1
  %scevgep422.prol = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %43
  %_p_scalar_423.prol = load i32, i32* %scevgep422.prol, align 4, !alias.scope !106, !noalias !133
  %scevgep424.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %42
  %_p_scalar_425.prol = load i32, i32* %scevgep424.prol, align 4, !alias.scope !105, !noalias !120
  %p_add107.prol = add nsw i32 %_p_scalar_425.prol, %_p_scalar_423.prol, !dbg !134
  %p_cmp108.prol = icmp sgt i32 %p_add100.prol, %p_add107.prol, !dbg !135
  %polly.storemerge.prol = select i1 %p_cmp108.prol, i32 %p_add100.prol, i32 %p_add107.prol, !dbg !136
  %scevgep426.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %42
  store i32 %polly.storemerge.prol, i32* %scevgep426.prol, align 4, !alias.scope !107, !noalias !137
  br label %polly.then410.split

polly.then410.split:                              ; preds = %polly.then410, %polly.loop_header412.prol
  %polly.indvar415.unr = phi i64 [ 0, %polly.then410 ], [ 1, %polly.loop_header412.prol ]
  %44 = icmp eq i64 %polly.indvar405, 6
  br i1 %44, label %polly.merge409.loopexit, label %polly.then410.split.split

polly.then410.split.split:                        ; preds = %polly.then410.split
  br label %polly.loop_header412

polly.loop_header412:                             ; preds = %polly.loop_header412, %polly.then410.split.split
  %polly.indvar415 = phi i64 [ %polly.indvar415.unr, %polly.then410.split.split ], [ %polly.indvar_next416.1, %polly.loop_header412 ]
  %scevgep419 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar415
  %_p_scalar_ = load i32, i32* %scevgep419, align 4, !alias.scope !106, !noalias !133
  %45 = mul nuw nsw i64 %polly.indvar415, 7
  %46 = add nsw i64 %45, %41
  %scevgep420 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %46
  %_p_scalar_421 = load i32, i32* %scevgep420, align 4, !alias.scope !101, !noalias !103
  %p_add100 = add nsw i32 %_p_scalar_421, %_p_scalar_, !dbg !125
  %47 = add nsw i64 %polly.indvar415, %41
  %scevgep422 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %47
  %_p_scalar_423 = load i32, i32* %scevgep422, align 4, !alias.scope !106, !noalias !133
  %scevgep424 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %46
  %_p_scalar_425 = load i32, i32* %scevgep424, align 4, !alias.scope !105, !noalias !120
  %p_add107 = add nsw i32 %_p_scalar_425, %_p_scalar_423, !dbg !134
  %p_cmp108 = icmp sgt i32 %p_add100, %p_add107, !dbg !135
  %polly.storemerge = select i1 %p_cmp108, i32 %p_add100, i32 %p_add107, !dbg !136
  %scevgep426 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %46
  store i32 %polly.storemerge, i32* %scevgep426, align 4, !alias.scope !107, !noalias !137
  %polly.indvar_next416 = add nuw nsw i64 %polly.indvar415, 1
  %scevgep419.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar_next416
  %_p_scalar_.1 = load i32, i32* %scevgep419.1, align 4, !alias.scope !106, !noalias !133
  %48 = mul nuw nsw i64 %polly.indvar_next416, 7
  %49 = add nsw i64 %48, %41
  %scevgep420.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %49
  %_p_scalar_421.1 = load i32, i32* %scevgep420.1, align 4, !alias.scope !101, !noalias !103
  %p_add100.1 = add nsw i32 %_p_scalar_421.1, %_p_scalar_.1, !dbg !125
  %50 = add i64 %polly.indvar415, %polly.indvar405
  %scevgep422.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %50
  %_p_scalar_423.1 = load i32, i32* %scevgep422.1, align 4, !alias.scope !106, !noalias !133
  %scevgep424.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %49
  %_p_scalar_425.1 = load i32, i32* %scevgep424.1, align 4, !alias.scope !105, !noalias !120
  %p_add107.1 = add nsw i32 %_p_scalar_425.1, %_p_scalar_423.1, !dbg !134
  %p_cmp108.1 = icmp sgt i32 %p_add100.1, %p_add107.1, !dbg !135
  %polly.storemerge.1 = select i1 %p_cmp108.1, i32 %p_add100.1, i32 %p_add107.1, !dbg !136
  %scevgep426.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %49
  store i32 %polly.storemerge.1, i32* %scevgep426.1, align 4, !alias.scope !107, !noalias !137
  %polly.indvar_next416.1 = add nsw i64 %polly.indvar415, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next416.1, %indvars.iv
  br i1 %exitcond.1, label %polly.merge409.loopexit.unr-lcssa, label %polly.loop_header412

polly.loop_header428:                             ; preds = %polly.loop_header428, %polly.loop_preheader429
  %polly.indvar432 = phi i64 [ %31, %polly.loop_preheader429 ], [ %polly.indvar_next433, %polly.loop_header428 ]
  %51 = mul i64 %polly.indvar432, 7
  %scevgep437 = getelementptr i32, i32* %scevgep436, i64 %51
  %_p_scalar_438 = load i32, i32* %scevgep437, align 4, !alias.scope !107, !noalias !137, !llvm.mem.parallel_loop_access !138
  %scevgep440 = getelementptr i32, i32* %scevgep439, i64 %51
  store i32 %_p_scalar_438, i32* %scevgep440, align 4, !alias.scope !108, !noalias !114, !llvm.mem.parallel_loop_access !138
  %polly.indvar_next433 = add nuw nsw i64 %polly.indvar432, 1
  %polly.loop_cond435 = icmp sgt i64 %polly.indvar432, %polly.adjust_ub434
  br i1 %polly.loop_cond435, label %polly.loop_exit430.loopexit, label %polly.loop_header428, !llvm.loop !138

polly.loop_preheader429:                          ; preds = %polly.merge409
  %scevgep436 = getelementptr i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), i64 %polly.indvar405
  %scevgep439 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar405
  %polly.adjust_ub434 = add i64 %34, -1
  br label %polly.loop_header428

polly.loop_header442:                             ; preds = %polly.loop_header442, %polly.loop_preheader443
  %polly.indvar446 = phi i64 [ 0, %polly.loop_preheader443 ], [ %polly.indvar_next447, %polly.loop_header442 ]
  %52 = mul nuw nsw i64 %polly.indvar446, 7
  %scevgep451 = getelementptr i32, i32* %scevgep450, i64 %52
  %_p_scalar_452 = load i32, i32* %scevgep451, align 4, !alias.scope !107, !noalias !137, !llvm.mem.parallel_loop_access !139
  %scevgep454 = getelementptr i32, i32* %scevgep453, i64 %52
  %scevgep456 = getelementptr i32, i32* %scevgep455, i64 %52
  %_p_scalar_457 = load i32, i32* %scevgep456, align 4, !alias.scope !108, !noalias !114, !llvm.mem.parallel_loop_access !139
  %p_cmp42 = icmp sgt i32 %_p_scalar_452, %_p_scalar_457, !dbg !140
  %p_. = select i1 %p_cmp42, i32 %_p_scalar_457, i32 %_p_scalar_452, !dbg !147
  store i32 %p_., i32* %scevgep454, align 4, !alias.scope !101, !noalias !103, !llvm.mem.parallel_loop_access !139
  %polly.indvar_next447 = add nuw nsw i64 %polly.indvar446, 1
  %polly.loop_cond449 = icmp sgt i64 %polly.indvar446, %polly.adjust_ub448
  br i1 %polly.loop_cond449, label %polly.loop_exit444.loopexit, label %polly.loop_header442, !llvm.loop !139

polly.loop_preheader443:                          ; preds = %polly.loop_exit430
  %scevgep450 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 2, i64 %polly.indvar405
  %scevgep453 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar405
  %scevgep455 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar405
  %polly.adjust_ub448 = add i64 %36, -1
  br label %polly.loop_header442

polly.loop_header459:                             ; preds = %polly.loop_header459, %polly.loop_preheader460
  %polly.indvar463 = phi i64 [ %39, %polly.loop_preheader460 ], [ %polly.indvar_next464, %polly.loop_header459 ]
  %53 = mul i64 %polly.indvar463, 7
  %scevgep468 = getelementptr i32, i32* %scevgep467, i64 %53
  %_p_scalar_469 = load i32, i32* %scevgep468, align 4, !alias.scope !107, !noalias !137, !llvm.mem.parallel_loop_access !148
  %scevgep471 = getelementptr i32, i32* %scevgep470, i64 %53
  %scevgep473 = getelementptr i32, i32* %scevgep472, i64 %53
  %_p_scalar_474 = load i32, i32* %scevgep473, align 4, !alias.scope !108, !noalias !114, !llvm.mem.parallel_loop_access !148
  %p_cmp78 = icmp sgt i32 %_p_scalar_469, %_p_scalar_474, !dbg !149
  %p_.204 = select i1 %p_cmp78, i32 %_p_scalar_474, i32 %_p_scalar_469, !dbg !153
  store i32 %p_.204, i32* %scevgep471, align 4, !alias.scope !105, !noalias !120, !llvm.mem.parallel_loop_access !148
  %polly.indvar_next464 = add nuw nsw i64 %polly.indvar463, 1
  %polly.loop_cond466 = icmp slt i64 %polly.indvar463, %32
  br i1 %polly.loop_cond466, label %polly.loop_header459, label %polly.loop_exit461.loopexit, !llvm.loop !148

polly.loop_preheader460:                          ; preds = %polly.loop_exit444
  %scevgep467 = getelementptr i32, i32* getelementptr ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 128102389400760775, i64 0, i64 2), i64 %polly.indvar405
  %scevgep470 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar405
  %scevgep472 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar405
  br label %polly.loop_header459

polly.loop_header375.us500.1:                     ; preds = %polly.loop_header375.us500.1.preheader, %polly.loop_header375.us500.1
  %polly.indvar379.us501.1 = phi i64 [ %polly.indvar_next380.us503.1, %polly.loop_header375.us500.1 ], [ 0, %polly.loop_header375.us500.1.preheader ]
  %54 = mul i64 %polly.indvar379.us501.1, 7
  %55 = add i64 %54, 28
  %scevgep385.us502.1 = getelementptr i32, i32* %27, i64 %55
  store i32 0, i32* %scevgep385.us502.1, align 4, !alias.scope !105, !noalias !120, !llvm.mem.parallel_loop_access !123
  %polly.indvar_next380.us503.1 = add nuw nsw i64 %polly.indvar379.us501.1, 1
  %polly.loop_cond382.us504.1 = icmp sgt i64 %polly.indvar379.us501.1, %polly.adjust_ub381
  br i1 %polly.loop_cond382.us504.1, label %polly.merge361.loopexit, label %polly.loop_header375.us500.1

polly.loop_header375.us.us.1:                     ; preds = %polly.loop_header375.us.us.1.preheader, %polly.loop_header375.us.us.1
  %polly.indvar379.us.us.1 = phi i64 [ %polly.indvar_next380.us.us.1, %polly.loop_header375.us.us.1 ], [ 0, %polly.loop_header375.us.us.1.preheader ]
  %56 = mul i64 %polly.indvar379.us.us.1, 7
  %57 = add i64 %56, 28
  %scevgep385.us.us.1 = getelementptr i32, i32* %24, i64 %57
  store i32 0, i32* %scevgep385.us.us.1, align 4, !alias.scope !105, !noalias !120, !llvm.mem.parallel_loop_access !123
  %polly.indvar_next380.us.us.1 = add nuw nsw i64 %polly.indvar379.us.us.1, 1
  %polly.loop_cond382.us.us.1 = icmp sgt i64 %polly.indvar379.us.us.1, %polly.adjust_ub381596
  br i1 %polly.loop_cond382.us.us.1, label %polly.merge361.loopexit613, label %polly.loop_header375.us.us.1

polly.loop_header311.us521.1:                     ; preds = %polly.loop_header311.us521.1.preheader, %polly.loop_header311.us521.1
  %polly.indvar315.us522.1 = phi i64 [ %polly.indvar_next316.us524.1, %polly.loop_header311.us521.1 ], [ 0, %polly.loop_header311.us521.1.preheader ]
  %58 = mul i64 %polly.indvar315.us522.1, 7
  %59 = add i64 %58, 28
  %scevgep321.us523.1 = getelementptr i32, i32* %18, i64 %59
  store i32 0, i32* %scevgep321.us523.1, align 4, !alias.scope !108, !noalias !114, !llvm.mem.parallel_loop_access !117
  %polly.indvar_next316.us524.1 = add nuw nsw i64 %polly.indvar315.us522.1, 1
  %polly.loop_cond318.us525.1 = icmp sgt i64 %polly.indvar315.us522.1, %polly.adjust_ub317
  br i1 %polly.loop_cond318.us525.1, label %polly.merge297.loopexit, label %polly.loop_header311.us521.1

polly.loop_header311.us.us.1:                     ; preds = %polly.loop_header311.us.us.1.preheader, %polly.loop_header311.us.us.1
  %polly.indvar315.us.us.1 = phi i64 [ %polly.indvar_next316.us.us.1, %polly.loop_header311.us.us.1 ], [ 0, %polly.loop_header311.us.us.1.preheader ]
  %60 = mul i64 %polly.indvar315.us.us.1, 7
  %61 = add i64 %60, 28
  %scevgep321.us.us.1 = getelementptr i32, i32* %15, i64 %61
  store i32 0, i32* %scevgep321.us.us.1, align 4, !alias.scope !108, !noalias !114, !llvm.mem.parallel_loop_access !117
  %polly.indvar_next316.us.us.1 = add nuw nsw i64 %polly.indvar315.us.us.1, 1
  %polly.loop_cond318.us.us.1 = icmp sgt i64 %polly.indvar315.us.us.1, %polly.adjust_ub317588
  br i1 %polly.loop_cond318.us.us.1, label %polly.merge297.loopexit615, label %polly.loop_header311.us.us.1

polly.loop_header253.us542.1:                     ; preds = %polly.loop_header253.us542.1.preheader, %polly.loop_header253.us542.1
  %polly.indvar256.us543.1 = phi i64 [ %polly.indvar_next257.us545.1, %polly.loop_header253.us542.1 ], [ 0, %polly.loop_header253.us542.1.preheader ]
  %62 = mul i64 %polly.indvar256.us543.1, 7
  %63 = add i64 %62, 28
  %scevgep261.us544.1 = getelementptr i32, i32* %9, i64 %63
  store i32 0, i32* %scevgep261.us544.1, align 4, !alias.scope !101, !noalias !103, !llvm.mem.parallel_loop_access !111
  %polly.indvar_next257.us545.1 = add nuw nsw i64 %polly.indvar256.us543.1, 1
  %polly.loop_cond258.us546.1 = icmp sgt i64 %polly.indvar256.us543.1, %polly.adjust_ub
  br i1 %polly.loop_cond258.us546.1, label %polly.merge240.loopexit, label %polly.loop_header253.us542.1

polly.loop_header253.us.us.1:                     ; preds = %polly.loop_header253.us.us.1.preheader, %polly.loop_header253.us.us.1
  %polly.indvar256.us.us.1 = phi i64 [ %polly.indvar_next257.us.us.1, %polly.loop_header253.us.us.1 ], [ 0, %polly.loop_header253.us.us.1.preheader ]
  %64 = mul i64 %polly.indvar256.us.us.1, 7
  %65 = add i64 %64, 28
  %scevgep261.us.us.1 = getelementptr i32, i32* %6, i64 %65
  store i32 0, i32* %scevgep261.us.us.1, align 4, !alias.scope !101, !noalias !103, !llvm.mem.parallel_loop_access !111
  %polly.indvar_next257.us.us.1 = add nuw nsw i64 %polly.indvar256.us.us.1, 1
  %polly.loop_cond258.us.us.1 = icmp sgt i64 %polly.indvar256.us.us.1, %polly.adjust_ub580
  br i1 %polly.loop_cond258.us.us.1, label %polly.merge240.loopexit617, label %polly.loop_header253.us.us.1
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !22 {
entry:
  %call = tail call i32 @findMoves(), !dbg !154
  tail call void @play(), !dbg !155
  %0 = load i32, i32* @sum_alice, align 4, !dbg !156, !tbaa !47
  %1 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !158, !tbaa !47
  %cmp = icmp eq i32 %0, %1, !dbg !159
  br i1 %cmp, label %if.end, label %if.then, !dbg !160

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0)), !dbg !161
  tail call void @exit(i32 -1) #6, !dbg !163
  unreachable, !dbg !163

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @sum_bob, align 4, !dbg !164, !tbaa !47
  %cmp2 = icmp slt i32 %0, %2, !dbg !166
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !167

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0)), !dbg !168
  tail call void @exit(i32 -1) #6, !dbg !170
  unreachable, !dbg !170

if.end5:                                          ; preds = %if.end
  %call6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i64 0, i64 0), i32 %0), !dbg !171
  %3 = load i32, i32* @sum_bob, align 4, !dbg !172, !tbaa !47
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0), i32 %3), !dbg !173
  ret i32 0, !dbg !174
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

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
!100 = distinct !{!100}
!101 = distinct !{!101, !102, !"polly.alias.scope.X"}
!102 = distinct !{!102, !"polly.alias.scope.domain"}
!103 = !{!104, !105, !106, !107, !108}
!104 = distinct !{!104, !102, !"polly.alias.scope.storemerge"}
!105 = distinct !{!105, !102, !"polly.alias.scope.Z"}
!106 = distinct !{!106, !102, !"polly.alias.scope.V"}
!107 = distinct !{!107, !102, !"polly.alias.scope.M"}
!108 = distinct !{!108, !102, !"polly.alias.scope.Y"}
!109 = !{!100, !110}
!110 = distinct !{!110}
!111 = !{!100, !112}
!112 = distinct !{!112}
!113 = distinct !{!113}
!114 = !{!101, !104, !105, !106, !107}
!115 = !{!113, !116}
!116 = distinct !{!116}
!117 = !{!113, !118}
!118 = distinct !{!118}
!119 = distinct !{!119}
!120 = !{!101, !104, !106, !107, !108}
!121 = !{!119, !122}
!122 = distinct !{!122}
!123 = !{!119, !124}
!124 = distinct !{!124}
!125 = !DILocation(line: 139, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !127, file: !1, line: 139, column: 8)
!127 = distinct !DILexicalBlock(scope: !128, file: !1, line: 135, column: 39)
!128 = distinct !DILexicalBlock(scope: !129, file: !1, line: 135, column: 3)
!129 = distinct !DILexicalBlock(scope: !130, file: !1, line: 135, column: 3)
!130 = distinct !DILexicalBlock(scope: !131, file: !1, line: 105, column: 26)
!131 = distinct !DILexicalBlock(scope: !132, file: !1, line: 105, column: 2)
!132 = distinct !DILexicalBlock(scope: !15, file: !1, line: 105, column: 2)
!133 = !{!101, !104, !105, !107, !108}
!134 = !DILocation(line: 139, column: 30, scope: !126)
!135 = !DILocation(line: 139, column: 23, scope: !126)
!136 = !DILocation(line: 139, column: 8, scope: !127)
!137 = !{!101, !104, !105, !106, !108}
!138 = distinct !{!138}
!139 = distinct !{!139}
!140 = !DILocation(line: 119, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !142, file: !1, line: 119, column: 9)
!142 = distinct !DILexicalBlock(scope: !143, file: !1, line: 117, column: 19)
!143 = distinct !DILexicalBlock(scope: !144, file: !1, line: 117, column: 8)
!144 = distinct !DILexicalBlock(scope: !145, file: !1, line: 107, column: 39)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 107, column: 3)
!146 = distinct !DILexicalBlock(scope: !130, file: !1, line: 107, column: 3)
!147 = !DILocation(line: 119, column: 9, scope: !142)
!148 = distinct !{!148}
!149 = !DILocation(line: 127, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !151, file: !1, line: 127, column: 9)
!151 = distinct !DILexicalBlock(scope: !152, file: !1, line: 125, column: 19)
!152 = distinct !DILexicalBlock(scope: !144, file: !1, line: 125, column: 8)
!153 = !DILocation(line: 127, column: 9, scope: !151)
!154 = !DILocation(line: 156, column: 2, scope: !22)
!155 = !DILocation(line: 157, column: 2, scope: !22)
!156 = !DILocation(line: 160, column: 6, scope: !157)
!157 = distinct !DILexicalBlock(scope: !22, file: !1, line: 160, column: 6)
!158 = !DILocation(line: 160, column: 19, scope: !157)
!159 = !DILocation(line: 160, column: 16, scope: !157)
!160 = !DILocation(line: 160, column: 6, scope: !22)
!161 = !DILocation(line: 161, column: 3, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !1, line: 160, column: 32)
!163 = !DILocation(line: 162, column: 3, scope: !162)
!164 = !DILocation(line: 165, column: 18, scope: !165)
!165 = distinct !DILexicalBlock(scope: !22, file: !1, line: 165, column: 6)
!166 = !DILocation(line: 165, column: 16, scope: !165)
!167 = !DILocation(line: 165, column: 6, scope: !22)
!168 = !DILocation(line: 166, column: 3, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !1, line: 165, column: 27)
!170 = !DILocation(line: 167, column: 3, scope: !169)
!171 = !DILocation(line: 170, column: 2, scope: !22)
!172 = !DILocation(line: 171, column: 65, scope: !22)
!173 = !DILocation(line: 171, column: 2, scope: !22)
!174 = !DILocation(line: 172, column: 1, scope: !22)
