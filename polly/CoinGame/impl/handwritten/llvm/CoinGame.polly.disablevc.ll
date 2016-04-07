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
  br label %polly.loop_header232

polly.exiting:                                    ; preds = %polly.loop_exit322
  %0 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !98, !tbaa !47
  ret i32 %0, !dbg !99

polly.loop_header232:                             ; preds = %entry
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 0), align 16, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 1), align 4, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 2), align 8, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 3, i64 3), align 4, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 4, i64 4), align 16, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 5, i64 5), align 4, !alias.scope !100, !noalias !102
  br label %polly.loop_header232.1

polly.loop_header245:                             ; preds = %polly.loop_header232.4
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 0), align 16, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 1), align 4, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 2), align 8, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 3, i64 3), align 4, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 4, i64 4), align 16, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 5, i64 5), align 4, !alias.scope !105, !noalias !108
  br label %polly.loop_header245.1

polly.loop_header260:                             ; preds = %polly.loop_header245.4
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 0), align 16, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 1), align 4, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 2), align 8, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 3, i64 3), align 4, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 4, i64 4), align 16, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 5, i64 5), align 4, !alias.scope !103, !noalias !109
  br label %polly.loop_header260.1

polly.loop_header269:                             ; preds = %polly.loop_exit322, %polly.loop_header260.4
  %indvars.iv = phi i64 [ 7, %polly.loop_header260.4 ], [ %indvars.iv.next, %polly.loop_exit322 ]
  %polly.indvar272 = phi i64 [ 0, %polly.loop_header260.4 ], [ %polly.indvar_next273, %polly.loop_exit322 ]
  %1 = icmp sgt i64 %polly.indvar272, 0
  br i1 %1, label %polly.then, label %polly.merge

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header275
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.then.split, %polly.merge.loopexit.unr-lcssa
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header269
  %2 = sub nsw i64 1, %polly.indvar272
  %3 = icmp slt i64 %2, 0
  %4 = select i1 %3, i64 0, i64 %2
  %5 = sub nsw i64 5, %polly.indvar272
  %6 = icmp sgt i64 %5, 4
  %7 = select i1 %6, i64 4, i64 %5
  %polly.loop_guard = icmp sgt i64 %4, %7
  br i1 %polly.loop_guard, label %polly.loop_exit292, label %polly.loop_preheader291

polly.loop_exit292.loopexit:                      ; preds = %polly.loop_header290
  br label %polly.loop_exit292

polly.loop_exit292:                               ; preds = %polly.loop_exit292.loopexit, %polly.merge
  %8 = icmp sgt i64 %5, 3
  %9 = select i1 %8, i64 3, i64 %5
  %polly.loop_guard306 = icmp sgt i64 %9, -1
  br i1 %polly.loop_guard306, label %polly.loop_preheader304, label %polly.loop_exit305

polly.loop_exit305.loopexit:                      ; preds = %polly.loop_header303
  br label %polly.loop_exit305

polly.loop_exit305:                               ; preds = %polly.loop_exit305.loopexit, %polly.loop_exit292
  %10 = sub nsw i64 2, %polly.indvar272
  %11 = icmp slt i64 %10, 0
  %12 = select i1 %11, i64 0, i64 %10
  %polly.loop_guard323 = icmp sgt i64 %12, %5
  br i1 %polly.loop_guard323, label %polly.loop_exit322, label %polly.loop_preheader321

polly.loop_exit322.loopexit:                      ; preds = %polly.loop_header320
  br label %polly.loop_exit322

polly.loop_exit322:                               ; preds = %polly.loop_exit322.loopexit, %polly.loop_exit305
  %polly.indvar_next273 = add nuw nsw i64 %polly.indvar272, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %exitcond336 = icmp eq i64 %polly.indvar_next273, 7
  br i1 %exitcond336, label %polly.exiting, label %polly.loop_header269

polly.then:                                       ; preds = %polly.loop_header269
  %13 = sub i64 7, %polly.indvar272
  %14 = add nsw i64 %polly.indvar272, -1
  %xtraiter = and i64 %13, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %polly.then.split, label %polly.loop_header275.prol

polly.loop_header275.prol:                        ; preds = %polly.then
  %15 = add nsw i64 %polly.indvar272, -1
  %scevgep283.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %15
  %_p_scalar_284.prol = load i32, i32* %scevgep283.prol, align 4, !alias.scope !100, !noalias !102
  %p_add100.prol = add nsw i32 %_p_scalar_284.prol, %_p_scalar_.prol, !dbg !110
  %16 = add nsw i64 %polly.indvar272, -1
  %scevgep285.prol = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %16
  %_p_scalar_286.prol = load i32, i32* %scevgep285.prol, align 4, !alias.scope !104, !noalias !118
  %scevgep287.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %15
  %_p_scalar_288.prol = load i32, i32* %scevgep287.prol, align 4, !alias.scope !103, !noalias !109
  %p_add107.prol = add nsw i32 %_p_scalar_288.prol, %_p_scalar_286.prol, !dbg !119
  %p_cmp108.prol = icmp sgt i32 %p_add100.prol, %p_add107.prol, !dbg !120
  %polly.storemerge.prol = select i1 %p_cmp108.prol, i32 %p_add100.prol, i32 %p_add107.prol, !dbg !121
  %scevgep289.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %15
  store i32 %polly.storemerge.prol, i32* %scevgep289.prol, align 4, !alias.scope !106, !noalias !122
  br label %polly.then.split

polly.then.split:                                 ; preds = %polly.then, %polly.loop_header275.prol
  %polly.indvar278.unr = phi i64 [ 0, %polly.then ], [ 1, %polly.loop_header275.prol ]
  %17 = icmp eq i64 %polly.indvar272, 6
  br i1 %17, label %polly.merge.loopexit, label %polly.then.split.split

polly.then.split.split:                           ; preds = %polly.then.split
  br label %polly.loop_header275

polly.loop_header275:                             ; preds = %polly.loop_header275, %polly.then.split.split
  %polly.indvar278 = phi i64 [ %polly.indvar278.unr, %polly.then.split.split ], [ %polly.indvar_next279.1, %polly.loop_header275 ]
  %scevgep282 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar278
  %_p_scalar_ = load i32, i32* %scevgep282, align 4, !alias.scope !104, !noalias !118
  %18 = mul nuw nsw i64 %polly.indvar278, 7
  %19 = add nsw i64 %18, %14
  %scevgep283 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %19
  %_p_scalar_284 = load i32, i32* %scevgep283, align 4, !alias.scope !100, !noalias !102
  %p_add100 = add nsw i32 %_p_scalar_284, %_p_scalar_, !dbg !110
  %20 = add nsw i64 %polly.indvar278, %14
  %scevgep285 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %20
  %_p_scalar_286 = load i32, i32* %scevgep285, align 4, !alias.scope !104, !noalias !118
  %scevgep287 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %19
  %_p_scalar_288 = load i32, i32* %scevgep287, align 4, !alias.scope !103, !noalias !109
  %p_add107 = add nsw i32 %_p_scalar_288, %_p_scalar_286, !dbg !119
  %p_cmp108 = icmp sgt i32 %p_add100, %p_add107, !dbg !120
  %polly.storemerge = select i1 %p_cmp108, i32 %p_add100, i32 %p_add107, !dbg !121
  %scevgep289 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %19
  store i32 %polly.storemerge, i32* %scevgep289, align 4, !alias.scope !106, !noalias !122
  %polly.indvar_next279 = add nuw nsw i64 %polly.indvar278, 1
  %scevgep282.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar_next279
  %_p_scalar_.1 = load i32, i32* %scevgep282.1, align 4, !alias.scope !104, !noalias !118
  %21 = mul nuw nsw i64 %polly.indvar_next279, 7
  %22 = add nsw i64 %21, %14
  %scevgep283.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %22
  %_p_scalar_284.1 = load i32, i32* %scevgep283.1, align 4, !alias.scope !100, !noalias !102
  %p_add100.1 = add nsw i32 %_p_scalar_284.1, %_p_scalar_.1, !dbg !110
  %23 = add i64 %polly.indvar278, %polly.indvar272
  %scevgep285.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %23
  %_p_scalar_286.1 = load i32, i32* %scevgep285.1, align 4, !alias.scope !104, !noalias !118
  %scevgep287.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %22
  %_p_scalar_288.1 = load i32, i32* %scevgep287.1, align 4, !alias.scope !103, !noalias !109
  %p_add107.1 = add nsw i32 %_p_scalar_288.1, %_p_scalar_286.1, !dbg !119
  %p_cmp108.1 = icmp sgt i32 %p_add100.1, %p_add107.1, !dbg !120
  %polly.storemerge.1 = select i1 %p_cmp108.1, i32 %p_add100.1, i32 %p_add107.1, !dbg !121
  %scevgep289.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %22
  store i32 %polly.storemerge.1, i32* %scevgep289.1, align 4, !alias.scope !106, !noalias !122
  %polly.indvar_next279.1 = add nsw i64 %polly.indvar278, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next279.1, %indvars.iv
  br i1 %exitcond.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header275

polly.loop_header290:                             ; preds = %polly.loop_header290, %polly.loop_preheader291
  %polly.indvar293 = phi i64 [ %4, %polly.loop_preheader291 ], [ %polly.indvar_next294, %polly.loop_header290 ]
  %24 = mul i64 %polly.indvar293, 7
  %scevgep298 = getelementptr i32, i32* %scevgep297, i64 %24
  %_p_scalar_299 = load i32, i32* %scevgep298, align 4, !alias.scope !106, !noalias !122
  %scevgep301 = getelementptr i32, i32* %scevgep300, i64 %24
  store i32 %_p_scalar_299, i32* %scevgep301, align 4, !alias.scope !105, !noalias !108
  %polly.indvar_next294 = add nuw nsw i64 %polly.indvar293, 1
  %polly.loop_cond296 = icmp sgt i64 %polly.indvar293, %polly.adjust_ub295
  br i1 %polly.loop_cond296, label %polly.loop_exit292.loopexit, label %polly.loop_header290

polly.loop_preheader291:                          ; preds = %polly.merge
  %scevgep297 = getelementptr i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), i64 %polly.indvar272
  %scevgep300 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar272
  %polly.adjust_ub295 = add i64 %7, -1
  br label %polly.loop_header290

polly.loop_header303:                             ; preds = %polly.loop_header303, %polly.loop_preheader304
  %polly.indvar307 = phi i64 [ 0, %polly.loop_preheader304 ], [ %polly.indvar_next308, %polly.loop_header303 ]
  %25 = mul nuw nsw i64 %polly.indvar307, 7
  %scevgep312 = getelementptr i32, i32* %scevgep311, i64 %25
  %_p_scalar_313 = load i32, i32* %scevgep312, align 4, !alias.scope !106, !noalias !122
  %scevgep315 = getelementptr i32, i32* %scevgep314, i64 %25
  %scevgep317 = getelementptr i32, i32* %scevgep316, i64 %25
  %_p_scalar_318 = load i32, i32* %scevgep317, align 4, !alias.scope !105, !noalias !108
  %p_cmp42 = icmp sgt i32 %_p_scalar_313, %_p_scalar_318, !dbg !123
  %p_. = select i1 %p_cmp42, i32 %_p_scalar_318, i32 %_p_scalar_313, !dbg !130
  store i32 %p_., i32* %scevgep315, align 4, !alias.scope !100, !noalias !102
  %polly.indvar_next308 = add nuw nsw i64 %polly.indvar307, 1
  %polly.loop_cond310 = icmp sgt i64 %polly.indvar307, %polly.adjust_ub309
  br i1 %polly.loop_cond310, label %polly.loop_exit305.loopexit, label %polly.loop_header303

polly.loop_preheader304:                          ; preds = %polly.loop_exit292
  %scevgep311 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 2, i64 %polly.indvar272
  %scevgep314 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar272
  %scevgep316 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar272
  %polly.adjust_ub309 = add i64 %9, -1
  br label %polly.loop_header303

polly.loop_header320:                             ; preds = %polly.loop_header320, %polly.loop_preheader321
  %polly.indvar324 = phi i64 [ %12, %polly.loop_preheader321 ], [ %polly.indvar_next325, %polly.loop_header320 ]
  %26 = mul i64 %polly.indvar324, 7
  %scevgep329 = getelementptr i32, i32* %scevgep328, i64 %26
  %_p_scalar_330 = load i32, i32* %scevgep329, align 4, !alias.scope !106, !noalias !122
  %scevgep332 = getelementptr i32, i32* %scevgep331, i64 %26
  %scevgep334 = getelementptr i32, i32* %scevgep333, i64 %26
  %_p_scalar_335 = load i32, i32* %scevgep334, align 4, !alias.scope !105, !noalias !108
  %p_cmp78 = icmp sgt i32 %_p_scalar_330, %_p_scalar_335, !dbg !131
  %p_.204 = select i1 %p_cmp78, i32 %_p_scalar_335, i32 %_p_scalar_330, !dbg !135
  store i32 %p_.204, i32* %scevgep332, align 4, !alias.scope !103, !noalias !109
  %polly.indvar_next325 = add nuw nsw i64 %polly.indvar324, 1
  %polly.loop_cond327 = icmp slt i64 %polly.indvar324, %5
  br i1 %polly.loop_cond327, label %polly.loop_header320, label %polly.loop_exit322.loopexit

polly.loop_preheader321:                          ; preds = %polly.loop_exit305
  %scevgep328 = getelementptr i32, i32* getelementptr ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 128102389400760775, i64 0, i64 2), i64 %polly.indvar272
  %scevgep331 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar272
  %scevgep333 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar272
  br label %polly.loop_header320

polly.loop_header260.1:                           ; preds = %polly.loop_header260
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 1), align 4, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 2), align 8, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 3), align 4, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 3, i64 4), align 8, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 4, i64 5), align 4, !alias.scope !103, !noalias !109
  br label %polly.loop_header260.2

polly.loop_header260.2:                           ; preds = %polly.loop_header260.1
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 2), align 8, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 3), align 4, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 4), align 16, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 3, i64 5), align 4, !alias.scope !103, !noalias !109
  br label %polly.loop_header260.3

polly.loop_header260.3:                           ; preds = %polly.loop_header260.2
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 3), align 4, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 4), align 8, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 5), align 4, !alias.scope !103, !noalias !109
  br label %polly.loop_header260.4

polly.loop_header260.4:                           ; preds = %polly.loop_header260.3
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 4), align 16, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 5), align 4, !alias.scope !103, !noalias !109
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 5), align 4, !alias.scope !103, !noalias !109
  %_p_scalar_.prol = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 0), align 16
  br label %polly.loop_header269

polly.loop_header245.1:                           ; preds = %polly.loop_header245
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 1), align 4, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 2), align 8, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 3), align 4, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 3, i64 4), align 8, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 4, i64 5), align 4, !alias.scope !105, !noalias !108
  br label %polly.loop_header245.2

polly.loop_header245.2:                           ; preds = %polly.loop_header245.1
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 2), align 8, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 3), align 4, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 4), align 16, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 3, i64 5), align 4, !alias.scope !105, !noalias !108
  br label %polly.loop_header245.3

polly.loop_header245.3:                           ; preds = %polly.loop_header245.2
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 3), align 4, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 4), align 8, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 5), align 4, !alias.scope !105, !noalias !108
  br label %polly.loop_header245.4

polly.loop_header245.4:                           ; preds = %polly.loop_header245.3
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 4), align 16, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 5), align 4, !alias.scope !105, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 5), align 4, !alias.scope !105, !noalias !108
  br label %polly.loop_header260

polly.loop_header232.1:                           ; preds = %polly.loop_header232
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 1), align 4, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 2), align 8, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 3), align 4, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 3, i64 4), align 8, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 4, i64 5), align 4, !alias.scope !100, !noalias !102
  br label %polly.loop_header232.2

polly.loop_header232.2:                           ; preds = %polly.loop_header232.1
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 2), align 8, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 3), align 4, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 4), align 16, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 3, i64 5), align 4, !alias.scope !100, !noalias !102
  br label %polly.loop_header232.3

polly.loop_header232.3:                           ; preds = %polly.loop_header232.2
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 3), align 4, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 4), align 8, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 5), align 4, !alias.scope !100, !noalias !102
  br label %polly.loop_header232.4

polly.loop_header232.4:                           ; preds = %polly.loop_header232.3
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 4), align 16, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 5), align 4, !alias.scope !100, !noalias !102
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 5), align 4, !alias.scope !100, !noalias !102
  br label %polly.loop_header245
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !22 {
entry:
  %call = tail call i32 @findMoves(), !dbg !136
  tail call void @play(), !dbg !137
  %0 = load i32, i32* @sum_alice, align 4, !dbg !138, !tbaa !47
  %1 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !140, !tbaa !47
  %cmp = icmp eq i32 %0, %1, !dbg !141
  br i1 %cmp, label %if.end, label %if.then, !dbg !142

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0)), !dbg !143
  tail call void @exit(i32 -1) #6, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @sum_bob, align 4, !dbg !146, !tbaa !47
  %cmp2 = icmp slt i32 %0, %2, !dbg !148
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !149

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0)), !dbg !150
  tail call void @exit(i32 -1) #6, !dbg !152
  unreachable, !dbg !152

if.end5:                                          ; preds = %if.end
  %call6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i64 0, i64 0), i32 %0), !dbg !153
  %3 = load i32, i32* @sum_bob, align 4, !dbg !154, !tbaa !47
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0), i32 %3), !dbg !155
  ret i32 0, !dbg !156
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
!100 = distinct !{!100, !101, !"polly.alias.scope.X"}
!101 = distinct !{!101, !"polly.alias.scope.domain"}
!102 = !{!103, !104, !105, !106, !107}
!103 = distinct !{!103, !101, !"polly.alias.scope.Z"}
!104 = distinct !{!104, !101, !"polly.alias.scope.V"}
!105 = distinct !{!105, !101, !"polly.alias.scope.Y"}
!106 = distinct !{!106, !101, !"polly.alias.scope.M"}
!107 = distinct !{!107, !101, !"polly.alias.scope.storemerge"}
!108 = !{!100, !103, !104, !106, !107}
!109 = !{!100, !104, !105, !106, !107}
!110 = !DILocation(line: 139, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !112, file: !1, line: 139, column: 8)
!112 = distinct !DILexicalBlock(scope: !113, file: !1, line: 135, column: 39)
!113 = distinct !DILexicalBlock(scope: !114, file: !1, line: 135, column: 3)
!114 = distinct !DILexicalBlock(scope: !115, file: !1, line: 135, column: 3)
!115 = distinct !DILexicalBlock(scope: !116, file: !1, line: 105, column: 26)
!116 = distinct !DILexicalBlock(scope: !117, file: !1, line: 105, column: 2)
!117 = distinct !DILexicalBlock(scope: !15, file: !1, line: 105, column: 2)
!118 = !{!100, !103, !105, !106, !107}
!119 = !DILocation(line: 139, column: 30, scope: !111)
!120 = !DILocation(line: 139, column: 23, scope: !111)
!121 = !DILocation(line: 139, column: 8, scope: !112)
!122 = !{!100, !103, !104, !105, !107}
!123 = !DILocation(line: 119, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !125, file: !1, line: 119, column: 9)
!125 = distinct !DILexicalBlock(scope: !126, file: !1, line: 117, column: 19)
!126 = distinct !DILexicalBlock(scope: !127, file: !1, line: 117, column: 8)
!127 = distinct !DILexicalBlock(scope: !128, file: !1, line: 107, column: 39)
!128 = distinct !DILexicalBlock(scope: !129, file: !1, line: 107, column: 3)
!129 = distinct !DILexicalBlock(scope: !115, file: !1, line: 107, column: 3)
!130 = !DILocation(line: 119, column: 9, scope: !125)
!131 = !DILocation(line: 127, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !133, file: !1, line: 127, column: 9)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 125, column: 19)
!134 = distinct !DILexicalBlock(scope: !127, file: !1, line: 125, column: 8)
!135 = !DILocation(line: 127, column: 9, scope: !133)
!136 = !DILocation(line: 156, column: 2, scope: !22)
!137 = !DILocation(line: 157, column: 2, scope: !22)
!138 = !DILocation(line: 160, column: 6, scope: !139)
!139 = distinct !DILexicalBlock(scope: !22, file: !1, line: 160, column: 6)
!140 = !DILocation(line: 160, column: 19, scope: !139)
!141 = !DILocation(line: 160, column: 16, scope: !139)
!142 = !DILocation(line: 160, column: 6, scope: !22)
!143 = !DILocation(line: 161, column: 3, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !1, line: 160, column: 32)
!145 = !DILocation(line: 162, column: 3, scope: !144)
!146 = !DILocation(line: 165, column: 18, scope: !147)
!147 = distinct !DILexicalBlock(scope: !22, file: !1, line: 165, column: 6)
!148 = !DILocation(line: 165, column: 16, scope: !147)
!149 = !DILocation(line: 165, column: 6, scope: !22)
!150 = !DILocation(line: 166, column: 3, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !1, line: 165, column: 27)
!152 = !DILocation(line: 167, column: 3, scope: !151)
!153 = !DILocation(line: 170, column: 2, scope: !22)
!154 = !DILocation(line: 171, column: 65, scope: !22)
!155 = !DILocation(line: 171, column: 2, scope: !22)
!156 = !DILocation(line: 172, column: 1, scope: !22)
