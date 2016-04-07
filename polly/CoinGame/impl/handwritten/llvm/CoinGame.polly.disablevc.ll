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

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

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
define i32 @maxMoney() #2 !dbg !28 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !53), !dbg !130
  br label %polly.loop_header232

polly.exiting:                                    ; preds = %polly.loop_exit322
  %0 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !131, !tbaa !59
  ret i32 %0, !dbg !132

polly.loop_header232:                             ; preds = %entry
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 0), align 16, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 1), align 4, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 2), align 8, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 3, i64 3), align 4, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 4, i64 4), align 16, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 5, i64 5), align 4, !alias.scope !133, !noalias !135
  br label %polly.loop_header232.1

polly.loop_header245:                             ; preds = %polly.loop_header232.4
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 0), align 16, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 1), align 4, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 2), align 8, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 3, i64 3), align 4, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 4, i64 4), align 16, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 5, i64 5), align 4, !alias.scope !136, !noalias !141
  br label %polly.loop_header245.1

polly.loop_header260:                             ; preds = %polly.loop_header245.4
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 0), align 16, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 1), align 4, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 2), align 8, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 3, i64 3), align 4, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 4, i64 4), align 16, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 5, i64 5), align 4, !alias.scope !138, !noalias !142
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
  %_p_scalar_284.prol = load i32, i32* %scevgep283.prol, align 4, !alias.scope !133, !noalias !135
  %p_add100.prol = add nsw i32 %_p_scalar_284.prol, %_p_scalar_.prol, !dbg !143
  %16 = add nsw i64 %polly.indvar272, -1
  %scevgep285.prol = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %16
  %_p_scalar_286.prol = load i32, i32* %scevgep285.prol, align 4, !alias.scope !140, !noalias !151
  %scevgep287.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %15
  %_p_scalar_288.prol = load i32, i32* %scevgep287.prol, align 4, !alias.scope !138, !noalias !142
  %p_add107.prol = add nsw i32 %_p_scalar_288.prol, %_p_scalar_286.prol, !dbg !152
  %p_cmp108.prol = icmp sgt i32 %p_add100.prol, %p_add107.prol, !dbg !153
  %polly.storemerge.prol = select i1 %p_cmp108.prol, i32 %p_add100.prol, i32 %p_add107.prol, !dbg !154
  %scevgep289.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %15
  store i32 %polly.storemerge.prol, i32* %scevgep289.prol, align 4, !alias.scope !139, !noalias !155
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
  %_p_scalar_ = load i32, i32* %scevgep282, align 4, !alias.scope !140, !noalias !151
  %18 = mul nuw nsw i64 %polly.indvar278, 7
  %19 = add nsw i64 %18, %14
  %scevgep283 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %19
  %_p_scalar_284 = load i32, i32* %scevgep283, align 4, !alias.scope !133, !noalias !135
  %p_add100 = add nsw i32 %_p_scalar_284, %_p_scalar_, !dbg !143
  %20 = add nsw i64 %polly.indvar278, %14
  %scevgep285 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %20
  %_p_scalar_286 = load i32, i32* %scevgep285, align 4, !alias.scope !140, !noalias !151
  %scevgep287 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %19
  %_p_scalar_288 = load i32, i32* %scevgep287, align 4, !alias.scope !138, !noalias !142
  %p_add107 = add nsw i32 %_p_scalar_288, %_p_scalar_286, !dbg !152
  %p_cmp108 = icmp sgt i32 %p_add100, %p_add107, !dbg !153
  %polly.storemerge = select i1 %p_cmp108, i32 %p_add100, i32 %p_add107, !dbg !154
  %scevgep289 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %19
  store i32 %polly.storemerge, i32* %scevgep289, align 4, !alias.scope !139, !noalias !155
  %polly.indvar_next279 = add nuw nsw i64 %polly.indvar278, 1
  %scevgep282.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar_next279
  %_p_scalar_.1 = load i32, i32* %scevgep282.1, align 4, !alias.scope !140, !noalias !151
  %21 = mul nuw nsw i64 %polly.indvar_next279, 7
  %22 = add nsw i64 %21, %14
  %scevgep283.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %22
  %_p_scalar_284.1 = load i32, i32* %scevgep283.1, align 4, !alias.scope !133, !noalias !135
  %p_add100.1 = add nsw i32 %_p_scalar_284.1, %_p_scalar_.1, !dbg !143
  %23 = add i64 %polly.indvar278, %polly.indvar272
  %scevgep285.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %23
  %_p_scalar_286.1 = load i32, i32* %scevgep285.1, align 4, !alias.scope !140, !noalias !151
  %scevgep287.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %22
  %_p_scalar_288.1 = load i32, i32* %scevgep287.1, align 4, !alias.scope !138, !noalias !142
  %p_add107.1 = add nsw i32 %_p_scalar_288.1, %_p_scalar_286.1, !dbg !152
  %p_cmp108.1 = icmp sgt i32 %p_add100.1, %p_add107.1, !dbg !153
  %polly.storemerge.1 = select i1 %p_cmp108.1, i32 %p_add100.1, i32 %p_add107.1, !dbg !154
  %scevgep289.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %22
  store i32 %polly.storemerge.1, i32* %scevgep289.1, align 4, !alias.scope !139, !noalias !155
  %polly.indvar_next279.1 = add nsw i64 %polly.indvar278, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next279.1, %indvars.iv
  br i1 %exitcond.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header275

polly.loop_header290:                             ; preds = %polly.loop_header290, %polly.loop_preheader291
  %polly.indvar293 = phi i64 [ %4, %polly.loop_preheader291 ], [ %polly.indvar_next294, %polly.loop_header290 ]
  %24 = mul i64 %polly.indvar293, 7
  %scevgep298 = getelementptr i32, i32* %scevgep297, i64 %24
  %_p_scalar_299 = load i32, i32* %scevgep298, align 4, !alias.scope !139, !noalias !155
  %scevgep301 = getelementptr i32, i32* %scevgep300, i64 %24
  store i32 %_p_scalar_299, i32* %scevgep301, align 4, !alias.scope !136, !noalias !141
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
  %_p_scalar_313 = load i32, i32* %scevgep312, align 4, !alias.scope !139, !noalias !155
  %scevgep315 = getelementptr i32, i32* %scevgep314, i64 %25
  %scevgep317 = getelementptr i32, i32* %scevgep316, i64 %25
  %_p_scalar_318 = load i32, i32* %scevgep317, align 4, !alias.scope !136, !noalias !141
  %p_cmp42 = icmp sgt i32 %_p_scalar_313, %_p_scalar_318, !dbg !156
  %p_. = select i1 %p_cmp42, i32 %_p_scalar_318, i32 %_p_scalar_313, !dbg !163
  store i32 %p_., i32* %scevgep315, align 4, !alias.scope !133, !noalias !135
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
  %_p_scalar_330 = load i32, i32* %scevgep329, align 4, !alias.scope !139, !noalias !155
  %scevgep332 = getelementptr i32, i32* %scevgep331, i64 %26
  %scevgep334 = getelementptr i32, i32* %scevgep333, i64 %26
  %_p_scalar_335 = load i32, i32* %scevgep334, align 4, !alias.scope !136, !noalias !141
  %p_cmp78 = icmp sgt i32 %_p_scalar_330, %_p_scalar_335, !dbg !164
  %p_.204 = select i1 %p_cmp78, i32 %_p_scalar_335, i32 %_p_scalar_330, !dbg !168
  store i32 %p_.204, i32* %scevgep332, align 4, !alias.scope !138, !noalias !142
  %polly.indvar_next325 = add nuw nsw i64 %polly.indvar324, 1
  %polly.loop_cond327 = icmp slt i64 %polly.indvar324, %5
  br i1 %polly.loop_cond327, label %polly.loop_header320, label %polly.loop_exit322.loopexit

polly.loop_preheader321:                          ; preds = %polly.loop_exit305
  %scevgep328 = getelementptr i32, i32* getelementptr ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 128102389400760775, i64 0, i64 2), i64 %polly.indvar272
  %scevgep331 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar272
  %scevgep333 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar272
  br label %polly.loop_header320

polly.loop_header260.1:                           ; preds = %polly.loop_header260
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 1), align 4, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 2), align 8, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 3), align 4, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 3, i64 4), align 8, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 4, i64 5), align 4, !alias.scope !138, !noalias !142
  br label %polly.loop_header260.2

polly.loop_header260.2:                           ; preds = %polly.loop_header260.1
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 2), align 8, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 3), align 4, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 4), align 16, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 3, i64 5), align 4, !alias.scope !138, !noalias !142
  br label %polly.loop_header260.3

polly.loop_header260.3:                           ; preds = %polly.loop_header260.2
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 3), align 4, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 4), align 8, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 5), align 4, !alias.scope !138, !noalias !142
  br label %polly.loop_header260.4

polly.loop_header260.4:                           ; preds = %polly.loop_header260.3
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 4), align 16, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 5), align 4, !alias.scope !138, !noalias !142
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 5), align 4, !alias.scope !138, !noalias !142
  %_p_scalar_.prol = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 0), align 16
  br label %polly.loop_header269

polly.loop_header245.1:                           ; preds = %polly.loop_header245
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 1), align 4, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 2), align 8, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 3), align 4, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 3, i64 4), align 8, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 4, i64 5), align 4, !alias.scope !136, !noalias !141
  br label %polly.loop_header245.2

polly.loop_header245.2:                           ; preds = %polly.loop_header245.1
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 2), align 8, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 3), align 4, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 4), align 16, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 3, i64 5), align 4, !alias.scope !136, !noalias !141
  br label %polly.loop_header245.3

polly.loop_header245.3:                           ; preds = %polly.loop_header245.2
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 3), align 4, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 4), align 8, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 5), align 4, !alias.scope !136, !noalias !141
  br label %polly.loop_header245.4

polly.loop_header245.4:                           ; preds = %polly.loop_header245.3
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 4), align 16, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 5), align 4, !alias.scope !136, !noalias !141
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 5), align 4, !alias.scope !136, !noalias !141
  br label %polly.loop_header260

polly.loop_header232.1:                           ; preds = %polly.loop_header232
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 1), align 4, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 2), align 8, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 3), align 4, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 3, i64 4), align 8, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 4, i64 5), align 4, !alias.scope !133, !noalias !135
  br label %polly.loop_header232.2

polly.loop_header232.2:                           ; preds = %polly.loop_header232.1
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 2), align 8, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 3), align 4, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 4), align 16, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 3, i64 5), align 4, !alias.scope !133, !noalias !135
  br label %polly.loop_header232.3

polly.loop_header232.3:                           ; preds = %polly.loop_header232.2
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 3), align 4, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 4), align 8, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 5), align 4, !alias.scope !133, !noalias !135
  br label %polly.loop_header232.4

polly.loop_header232.4:                           ; preds = %polly.loop_header232.3
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 4), align 16, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 5), align 4, !alias.scope !133, !noalias !135
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 5), align 4, !alias.scope !133, !noalias !135
  br label %polly.loop_header245
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %call = tail call i32 @maxMoney(), !dbg !169
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !12, metadata !53), !dbg !170
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !13, metadata !53), !dbg !172
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !173
  br label %while.body.i, !dbg !174

while.body.i:                                     ; preds = %while.cond.backedge.i, %entry
  %i.033.i = phi i32 [ 0, %entry ], [ %i.1.i, %while.cond.backedge.i ], !dbg !175
  %j.032.i = phi i32 [ 5, %entry ], [ %j.1.i, %while.cond.backedge.i ], !dbg !175
  %alice.031.i = phi i32 [ 1, %entry ], [ %alice.0.be.i, %while.cond.backedge.i ], !dbg !175
  %idxprom.i = sext i32 %j.032.i to i64, !dbg !176
  %add.i = add nsw i32 %i.033.i, 1, !dbg !177
  %idxprom1.i = sext i32 %add.i to i64, !dbg !176
  %arrayidx2.i = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1.i, i64 %idxprom.i, !dbg !176
  %0 = load i32, i32* %arrayidx2.i, align 4, !dbg !176, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !15, metadata !53), !dbg !178
  %sub.i = add nsw i32 %j.032.i, -1, !dbg !179
  %idxprom3.i = sext i32 %sub.i to i64, !dbg !180
  %idxprom4.i = sext i32 %i.033.i to i64, !dbg !180
  %arrayidx6.i = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4.i, i64 %idxprom3.i, !dbg !180
  %1 = load i32, i32* %arrayidx6.i, align 4, !dbg !180, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !17, metadata !53), !dbg !181
  %cmp7.i = icmp sgt i32 %0, %1, !dbg !182
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !13, metadata !53), !dbg !172
  %j.1.i = select i1 %cmp7.i, i32 %sub.i, i32 %j.032.i, !dbg !183
  %i.1.i = select i1 %cmp7.i, i32 %i.033.i, i32 %add.i, !dbg !183
  %idxprom4.pn.i = select i1 %cmp7.i, i64 %idxprom.i, i64 %idxprom4.i, !dbg !183
  %coin.0.in.i = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4.pn.i, !dbg !184
  %coin.0.i = load i32, i32* %coin.0.in.i, align 4, !dbg !184, !tbaa !59
  %tobool.i = icmp eq i32 %alice.031.i, 0, !dbg !185
  br i1 %tobool.i, label %if.else14.i, label %if.then12.i, !dbg !186

if.then12.i:                                      ; preds = %while.body.i
  %2 = load i32, i32* @sum_alice, align 4, !dbg !187, !tbaa !59
  %add13.i = add nsw i32 %2, %coin.0.i, !dbg !187
  store i32 %add13.i, i32* @sum_alice, align 4, !dbg !187, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !14, metadata !53), !dbg !173
  br label %while.cond.backedge.i, !dbg !188

if.else14.i:                                      ; preds = %while.body.i
  %3 = load i32, i32* @sum_bob, align 4, !dbg !189, !tbaa !59
  %add15.i = add nsw i32 %3, %coin.0.i, !dbg !189
  store i32 %add15.i, i32* @sum_bob, align 4, !dbg !189, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !173
  br label %while.cond.backedge.i, !dbg !175

while.cond.backedge.i:                            ; preds = %if.else14.i, %if.then12.i
  %alice.0.be.i = phi i32 [ 0, %if.then12.i ], [ 1, %if.else14.i ], !dbg !175
  %cmp.i = icmp sgt i32 %i.1.i, %j.1.i, !dbg !190
  br i1 %cmp.i, label %sumMoves.exit, label %while.body.i, !dbg !174

sumMoves.exit:                                    ; preds = %while.cond.backedge.i
  %4 = load i32, i32* @sum_alice, align 4, !dbg !191, !tbaa !59
  %5 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !193, !tbaa !59
  %cmp = icmp eq i32 %4, %5, !dbg !194
  br i1 %cmp, label %if.end, label %if.then, !dbg !195

if.then:                                          ; preds = %sumMoves.exit
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0)), !dbg !196
  tail call void @exit(i32 -1) #6, !dbg !198
  unreachable, !dbg !198

if.end:                                           ; preds = %sumMoves.exit
  %6 = load i32, i32* @sum_bob, align 4, !dbg !199, !tbaa !59
  %cmp2 = icmp slt i32 %4, %6, !dbg !201
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !202

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0)), !dbg !203
  tail call void @exit(i32 -1) #6, !dbg !205
  unreachable, !dbg !205

if.end5:                                          ; preds = %if.end
  %call6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i64 0, i64 0), i32 %4), !dbg !206
  %7 = load i32, i32* @sum_bob, align 4, !dbg !207, !tbaa !59
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0), i32 %7), !dbg !208
  ret i32 0, !dbg !209
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
!131 = !DILocation(line: 140, column: 9, scope: !28)
!132 = !DILocation(line: 140, column: 2, scope: !28)
!133 = distinct !{!133, !134, !"polly.alias.scope.X"}
!134 = distinct !{!134, !"polly.alias.scope.domain"}
!135 = !{!136, !137, !138, !139, !140}
!136 = distinct !{!136, !134, !"polly.alias.scope.Y"}
!137 = distinct !{!137, !134, !"polly.alias.scope.storemerge"}
!138 = distinct !{!138, !134, !"polly.alias.scope.Z"}
!139 = distinct !{!139, !134, !"polly.alias.scope.M"}
!140 = distinct !{!140, !134, !"polly.alias.scope.V"}
!141 = !{!133, !137, !138, !139, !140}
!142 = !{!136, !133, !137, !139, !140}
!143 = !DILocation(line: 127, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !145, file: !1, line: 127, column: 8)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 123, column: 39)
!146 = distinct !DILexicalBlock(scope: !147, file: !1, line: 123, column: 3)
!147 = distinct !DILexicalBlock(scope: !148, file: !1, line: 123, column: 3)
!148 = distinct !DILexicalBlock(scope: !149, file: !1, line: 93, column: 26)
!149 = distinct !DILexicalBlock(scope: !150, file: !1, line: 93, column: 2)
!150 = distinct !DILexicalBlock(scope: !28, file: !1, line: 93, column: 2)
!151 = !{!136, !133, !137, !138, !139}
!152 = !DILocation(line: 127, column: 30, scope: !144)
!153 = !DILocation(line: 127, column: 23, scope: !144)
!154 = !DILocation(line: 127, column: 8, scope: !145)
!155 = !{!136, !133, !137, !138, !140}
!156 = !DILocation(line: 107, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !158, file: !1, line: 107, column: 9)
!158 = distinct !DILexicalBlock(scope: !159, file: !1, line: 105, column: 19)
!159 = distinct !DILexicalBlock(scope: !160, file: !1, line: 105, column: 8)
!160 = distinct !DILexicalBlock(scope: !161, file: !1, line: 95, column: 39)
!161 = distinct !DILexicalBlock(scope: !162, file: !1, line: 95, column: 3)
!162 = distinct !DILexicalBlock(scope: !148, file: !1, line: 95, column: 3)
!163 = !DILocation(line: 107, column: 9, scope: !158)
!164 = !DILocation(line: 115, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !166, file: !1, line: 115, column: 9)
!166 = distinct !DILexicalBlock(scope: !167, file: !1, line: 113, column: 19)
!167 = distinct !DILexicalBlock(scope: !160, file: !1, line: 113, column: 8)
!168 = !DILocation(line: 115, column: 9, scope: !166)
!169 = !DILocation(line: 144, column: 2, scope: !35)
!170 = !DILocation(line: 35, column: 6, scope: !10, inlinedAt: !171)
!171 = distinct !DILocation(line: 145, column: 2, scope: !35)
!172 = !DILocation(line: 35, column: 13, scope: !10, inlinedAt: !171)
!173 = !DILocation(line: 36, column: 6, scope: !10, inlinedAt: !171)
!174 = !DILocation(line: 37, column: 2, scope: !68, inlinedAt: !171)
!175 = !DILocation(line: 145, column: 2, scope: !35)
!176 = !DILocation(line: 38, column: 12, scope: !16, inlinedAt: !171)
!177 = !DILocation(line: 38, column: 16, scope: !16, inlinedAt: !171)
!178 = !DILocation(line: 38, column: 7, scope: !16, inlinedAt: !171)
!179 = !DILocation(line: 39, column: 19, scope: !16, inlinedAt: !171)
!180 = !DILocation(line: 39, column: 12, scope: !16, inlinedAt: !171)
!181 = !DILocation(line: 39, column: 7, scope: !16, inlinedAt: !171)
!182 = !DILocation(line: 41, column: 10, scope: !76, inlinedAt: !171)
!183 = !DILocation(line: 41, column: 7, scope: !16, inlinedAt: !171)
!184 = !DILocation(line: 43, column: 11, scope: !79, inlinedAt: !171)
!185 = !DILocation(line: 50, column: 7, scope: !81, inlinedAt: !171)
!186 = !DILocation(line: 50, column: 7, scope: !16, inlinedAt: !171)
!187 = !DILocation(line: 51, column: 14, scope: !84, inlinedAt: !171)
!188 = !DILocation(line: 53, column: 3, scope: !84, inlinedAt: !171)
!189 = !DILocation(line: 54, column: 12, scope: !87, inlinedAt: !171)
!190 = !DILocation(line: 37, column: 11, scope: !68, inlinedAt: !171)
!191 = !DILocation(line: 148, column: 6, scope: !192)
!192 = distinct !DILexicalBlock(scope: !35, file: !1, line: 148, column: 6)
!193 = !DILocation(line: 148, column: 19, scope: !192)
!194 = !DILocation(line: 148, column: 16, scope: !192)
!195 = !DILocation(line: 148, column: 6, scope: !35)
!196 = !DILocation(line: 149, column: 3, scope: !197)
!197 = distinct !DILexicalBlock(scope: !192, file: !1, line: 148, column: 32)
!198 = !DILocation(line: 150, column: 3, scope: !197)
!199 = !DILocation(line: 153, column: 18, scope: !200)
!200 = distinct !DILexicalBlock(scope: !35, file: !1, line: 153, column: 6)
!201 = !DILocation(line: 153, column: 16, scope: !200)
!202 = !DILocation(line: 153, column: 6, scope: !35)
!203 = !DILocation(line: 154, column: 3, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !1, line: 153, column: 27)
!205 = !DILocation(line: 155, column: 3, scope: !204)
!206 = !DILocation(line: 158, column: 2, scope: !35)
!207 = !DILocation(line: 159, column: 65, scope: !35)
!208 = !DILocation(line: 159, column: 2, scope: !35)
!209 = !DILocation(line: 160, column: 1, scope: !35)
