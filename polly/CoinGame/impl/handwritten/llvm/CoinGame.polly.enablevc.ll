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
  br label %polly.loop_header

polly.exiting:                                    ; preds = %polly.loop_exit461
  %0 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !131, !tbaa !59
  ret i32 %0, !dbg !132

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
  br i1 %polly.loop_cond, label %polly.loop_header.backedge, label %polly.loop_header278.preheader, !llvm.loop !133

polly.loop_header278.preheader:                   ; preds = %polly.merge240
  br label %polly.loop_header278

polly.loop_preheader233:                          ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  store i32 0, i32* %scevgep, align 4, !alias.scope !134, !noalias !136, !llvm.mem.parallel_loop_access !142
  %scevgep238.1 = getelementptr i32, i32* %scevgep, i64 7
  store i32 0, i32* %scevgep238.1, align 4, !alias.scope !134, !noalias !136, !llvm.mem.parallel_loop_access !142
  %scevgep238.2 = getelementptr i32, i32* %scevgep, i64 14
  store i32 0, i32* %scevgep238.2, align 4, !alias.scope !134, !noalias !136, !llvm.mem.parallel_loop_access !142
  %scevgep238.3 = getelementptr i32, i32* %scevgep, i64 21
  store i32 0, i32* %scevgep238.3, align 4, !alias.scope !134, !noalias !136, !llvm.mem.parallel_loop_access !142
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
  store i32 0, i32* %scevgep276.us.us, align 4, !alias.scope !134, !noalias !136, !llvm.mem.parallel_loop_access !144
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
  store i32 0, i32* %scevgep276.us, align 4, !alias.scope !134, !noalias !136, !llvm.mem.parallel_loop_access !144
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
  br i1 %polly.loop_cond283, label %polly.loop_header278.backedge, label %polly.loop_header342.preheader, !llvm.loop !146

polly.loop_header342.preheader:                   ; preds = %polly.merge297
  br label %polly.loop_header342

polly.loop_preheader289:                          ; preds = %polly.loop_header278
  %scevgep294 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar281
  store i32 0, i32* %scevgep294, align 4, !alias.scope !138, !noalias !147, !llvm.mem.parallel_loop_access !148
  %scevgep295.1 = getelementptr i32, i32* %scevgep294, i64 7
  store i32 0, i32* %scevgep295.1, align 4, !alias.scope !138, !noalias !147, !llvm.mem.parallel_loop_access !148
  %scevgep295.2 = getelementptr i32, i32* %scevgep294, i64 14
  store i32 0, i32* %scevgep295.2, align 4, !alias.scope !138, !noalias !147, !llvm.mem.parallel_loop_access !148
  %scevgep295.3 = getelementptr i32, i32* %scevgep294, i64 21
  store i32 0, i32* %scevgep295.3, align 4, !alias.scope !138, !noalias !147, !llvm.mem.parallel_loop_access !148
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
  store i32 0, i32* %scevgep338.us.us, align 4, !alias.scope !138, !noalias !147, !llvm.mem.parallel_loop_access !150
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
  store i32 0, i32* %scevgep338.us, align 4, !alias.scope !138, !noalias !147, !llvm.mem.parallel_loop_access !150
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
  br i1 %polly.loop_cond347, label %polly.loop_header342.backedge, label %polly.loop_header402.preheader, !llvm.loop !152

polly.loop_header402.preheader:                   ; preds = %polly.merge361
  %_p_scalar_.prol = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @V, i64 0, i64 0), align 16
  br label %polly.loop_header402

polly.loop_preheader353:                          ; preds = %polly.loop_header342
  %scevgep358 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar345
  store i32 0, i32* %scevgep358, align 4, !alias.scope !141, !noalias !153, !llvm.mem.parallel_loop_access !154
  %scevgep359.1 = getelementptr i32, i32* %scevgep358, i64 7
  store i32 0, i32* %scevgep359.1, align 4, !alias.scope !141, !noalias !153, !llvm.mem.parallel_loop_access !154
  %scevgep359.2 = getelementptr i32, i32* %scevgep358, i64 14
  store i32 0, i32* %scevgep359.2, align 4, !alias.scope !141, !noalias !153, !llvm.mem.parallel_loop_access !154
  %scevgep359.3 = getelementptr i32, i32* %scevgep358, i64 21
  store i32 0, i32* %scevgep359.3, align 4, !alias.scope !141, !noalias !153, !llvm.mem.parallel_loop_access !154
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
  store i32 0, i32* %scevgep400.us.us, align 4, !alias.scope !141, !noalias !153, !llvm.mem.parallel_loop_access !156
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
  store i32 0, i32* %scevgep400.us, align 4, !alias.scope !141, !noalias !153, !llvm.mem.parallel_loop_access !156
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
  %_p_scalar_421.prol = load i32, i32* %scevgep420.prol, align 4, !alias.scope !134, !noalias !136
  %p_add100.prol = add nsw i32 %_p_scalar_421.prol, %_p_scalar_.prol, !dbg !158
  %43 = add nsw i64 %polly.indvar405, -1
  %scevgep422.prol = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %43
  %_p_scalar_423.prol = load i32, i32* %scevgep422.prol, align 4, !alias.scope !137, !noalias !166
  %scevgep424.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %42
  %_p_scalar_425.prol = load i32, i32* %scevgep424.prol, align 4, !alias.scope !141, !noalias !153
  %p_add107.prol = add nsw i32 %_p_scalar_425.prol, %_p_scalar_423.prol, !dbg !167
  %p_cmp108.prol = icmp sgt i32 %p_add100.prol, %p_add107.prol, !dbg !168
  %polly.storemerge.prol = select i1 %p_cmp108.prol, i32 %p_add100.prol, i32 %p_add107.prol, !dbg !169
  %scevgep426.prol = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %42
  store i32 %polly.storemerge.prol, i32* %scevgep426.prol, align 4, !alias.scope !139, !noalias !170
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
  %_p_scalar_ = load i32, i32* %scevgep419, align 4, !alias.scope !137, !noalias !166
  %45 = mul nuw nsw i64 %polly.indvar415, 7
  %46 = add nsw i64 %45, %41
  %scevgep420 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %46
  %_p_scalar_421 = load i32, i32* %scevgep420, align 4, !alias.scope !134, !noalias !136
  %p_add100 = add nsw i32 %_p_scalar_421, %_p_scalar_, !dbg !158
  %47 = add nsw i64 %polly.indvar415, %41
  %scevgep422 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %47
  %_p_scalar_423 = load i32, i32* %scevgep422, align 4, !alias.scope !137, !noalias !166
  %scevgep424 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %46
  %_p_scalar_425 = load i32, i32* %scevgep424, align 4, !alias.scope !141, !noalias !153
  %p_add107 = add nsw i32 %_p_scalar_425, %_p_scalar_423, !dbg !167
  %p_cmp108 = icmp sgt i32 %p_add100, %p_add107, !dbg !168
  %polly.storemerge = select i1 %p_cmp108, i32 %p_add100, i32 %p_add107, !dbg !169
  %scevgep426 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %46
  store i32 %polly.storemerge, i32* %scevgep426, align 4, !alias.scope !139, !noalias !170
  %polly.indvar_next416 = add nuw nsw i64 %polly.indvar415, 1
  %scevgep419.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar_next416
  %_p_scalar_.1 = load i32, i32* %scevgep419.1, align 4, !alias.scope !137, !noalias !166
  %48 = mul nuw nsw i64 %polly.indvar_next416, 7
  %49 = add nsw i64 %48, %41
  %scevgep420.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %49
  %_p_scalar_421.1 = load i32, i32* %scevgep420.1, align 4, !alias.scope !134, !noalias !136
  %p_add100.1 = add nsw i32 %_p_scalar_421.1, %_p_scalar_.1, !dbg !158
  %50 = add i64 %polly.indvar415, %polly.indvar405
  %scevgep422.1 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %50
  %_p_scalar_423.1 = load i32, i32* %scevgep422.1, align 4, !alias.scope !137, !noalias !166
  %scevgep424.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %49
  %_p_scalar_425.1 = load i32, i32* %scevgep424.1, align 4, !alias.scope !141, !noalias !153
  %p_add107.1 = add nsw i32 %_p_scalar_425.1, %_p_scalar_423.1, !dbg !167
  %p_cmp108.1 = icmp sgt i32 %p_add100.1, %p_add107.1, !dbg !168
  %polly.storemerge.1 = select i1 %p_cmp108.1, i32 %p_add100.1, i32 %p_add107.1, !dbg !169
  %scevgep426.1 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %49
  store i32 %polly.storemerge.1, i32* %scevgep426.1, align 4, !alias.scope !139, !noalias !170
  %polly.indvar_next416.1 = add nsw i64 %polly.indvar415, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next416.1, %indvars.iv
  br i1 %exitcond.1, label %polly.merge409.loopexit.unr-lcssa, label %polly.loop_header412

polly.loop_header428:                             ; preds = %polly.loop_header428, %polly.loop_preheader429
  %polly.indvar432 = phi i64 [ %31, %polly.loop_preheader429 ], [ %polly.indvar_next433, %polly.loop_header428 ]
  %51 = mul i64 %polly.indvar432, 7
  %scevgep437 = getelementptr i32, i32* %scevgep436, i64 %51
  %_p_scalar_438 = load i32, i32* %scevgep437, align 4, !alias.scope !139, !noalias !170, !llvm.mem.parallel_loop_access !171
  %scevgep440 = getelementptr i32, i32* %scevgep439, i64 %51
  store i32 %_p_scalar_438, i32* %scevgep440, align 4, !alias.scope !138, !noalias !147, !llvm.mem.parallel_loop_access !171
  %polly.indvar_next433 = add nuw nsw i64 %polly.indvar432, 1
  %polly.loop_cond435 = icmp sgt i64 %polly.indvar432, %polly.adjust_ub434
  br i1 %polly.loop_cond435, label %polly.loop_exit430.loopexit, label %polly.loop_header428, !llvm.loop !171

polly.loop_preheader429:                          ; preds = %polly.merge409
  %scevgep436 = getelementptr i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), i64 %polly.indvar405
  %scevgep439 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar405
  %polly.adjust_ub434 = add i64 %34, -1
  br label %polly.loop_header428

polly.loop_header442:                             ; preds = %polly.loop_header442, %polly.loop_preheader443
  %polly.indvar446 = phi i64 [ 0, %polly.loop_preheader443 ], [ %polly.indvar_next447, %polly.loop_header442 ]
  %52 = mul nuw nsw i64 %polly.indvar446, 7
  %scevgep451 = getelementptr i32, i32* %scevgep450, i64 %52
  %_p_scalar_452 = load i32, i32* %scevgep451, align 4, !alias.scope !139, !noalias !170, !llvm.mem.parallel_loop_access !172
  %scevgep454 = getelementptr i32, i32* %scevgep453, i64 %52
  %scevgep456 = getelementptr i32, i32* %scevgep455, i64 %52
  %_p_scalar_457 = load i32, i32* %scevgep456, align 4, !alias.scope !138, !noalias !147, !llvm.mem.parallel_loop_access !172
  %p_cmp42 = icmp sgt i32 %_p_scalar_452, %_p_scalar_457, !dbg !173
  %p_. = select i1 %p_cmp42, i32 %_p_scalar_457, i32 %_p_scalar_452, !dbg !180
  store i32 %p_., i32* %scevgep454, align 4, !alias.scope !134, !noalias !136, !llvm.mem.parallel_loop_access !172
  %polly.indvar_next447 = add nuw nsw i64 %polly.indvar446, 1
  %polly.loop_cond449 = icmp sgt i64 %polly.indvar446, %polly.adjust_ub448
  br i1 %polly.loop_cond449, label %polly.loop_exit444.loopexit, label %polly.loop_header442, !llvm.loop !172

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
  %_p_scalar_469 = load i32, i32* %scevgep468, align 4, !alias.scope !139, !noalias !170, !llvm.mem.parallel_loop_access !181
  %scevgep471 = getelementptr i32, i32* %scevgep470, i64 %53
  %scevgep473 = getelementptr i32, i32* %scevgep472, i64 %53
  %_p_scalar_474 = load i32, i32* %scevgep473, align 4, !alias.scope !138, !noalias !147, !llvm.mem.parallel_loop_access !181
  %p_cmp78 = icmp sgt i32 %_p_scalar_469, %_p_scalar_474, !dbg !182
  %p_.204 = select i1 %p_cmp78, i32 %_p_scalar_474, i32 %_p_scalar_469, !dbg !186
  store i32 %p_.204, i32* %scevgep471, align 4, !alias.scope !141, !noalias !153, !llvm.mem.parallel_loop_access !181
  %polly.indvar_next464 = add nuw nsw i64 %polly.indvar463, 1
  %polly.loop_cond466 = icmp slt i64 %polly.indvar463, %32
  br i1 %polly.loop_cond466, label %polly.loop_header459, label %polly.loop_exit461.loopexit, !llvm.loop !181

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
  store i32 0, i32* %scevgep385.us502.1, align 4, !alias.scope !141, !noalias !153, !llvm.mem.parallel_loop_access !156
  %polly.indvar_next380.us503.1 = add nuw nsw i64 %polly.indvar379.us501.1, 1
  %polly.loop_cond382.us504.1 = icmp sgt i64 %polly.indvar379.us501.1, %polly.adjust_ub381
  br i1 %polly.loop_cond382.us504.1, label %polly.merge361.loopexit, label %polly.loop_header375.us500.1

polly.loop_header375.us.us.1:                     ; preds = %polly.loop_header375.us.us.1.preheader, %polly.loop_header375.us.us.1
  %polly.indvar379.us.us.1 = phi i64 [ %polly.indvar_next380.us.us.1, %polly.loop_header375.us.us.1 ], [ 0, %polly.loop_header375.us.us.1.preheader ]
  %56 = mul i64 %polly.indvar379.us.us.1, 7
  %57 = add i64 %56, 28
  %scevgep385.us.us.1 = getelementptr i32, i32* %24, i64 %57
  store i32 0, i32* %scevgep385.us.us.1, align 4, !alias.scope !141, !noalias !153, !llvm.mem.parallel_loop_access !156
  %polly.indvar_next380.us.us.1 = add nuw nsw i64 %polly.indvar379.us.us.1, 1
  %polly.loop_cond382.us.us.1 = icmp sgt i64 %polly.indvar379.us.us.1, %polly.adjust_ub381596
  br i1 %polly.loop_cond382.us.us.1, label %polly.merge361.loopexit613, label %polly.loop_header375.us.us.1

polly.loop_header311.us521.1:                     ; preds = %polly.loop_header311.us521.1.preheader, %polly.loop_header311.us521.1
  %polly.indvar315.us522.1 = phi i64 [ %polly.indvar_next316.us524.1, %polly.loop_header311.us521.1 ], [ 0, %polly.loop_header311.us521.1.preheader ]
  %58 = mul i64 %polly.indvar315.us522.1, 7
  %59 = add i64 %58, 28
  %scevgep321.us523.1 = getelementptr i32, i32* %18, i64 %59
  store i32 0, i32* %scevgep321.us523.1, align 4, !alias.scope !138, !noalias !147, !llvm.mem.parallel_loop_access !150
  %polly.indvar_next316.us524.1 = add nuw nsw i64 %polly.indvar315.us522.1, 1
  %polly.loop_cond318.us525.1 = icmp sgt i64 %polly.indvar315.us522.1, %polly.adjust_ub317
  br i1 %polly.loop_cond318.us525.1, label %polly.merge297.loopexit, label %polly.loop_header311.us521.1

polly.loop_header311.us.us.1:                     ; preds = %polly.loop_header311.us.us.1.preheader, %polly.loop_header311.us.us.1
  %polly.indvar315.us.us.1 = phi i64 [ %polly.indvar_next316.us.us.1, %polly.loop_header311.us.us.1 ], [ 0, %polly.loop_header311.us.us.1.preheader ]
  %60 = mul i64 %polly.indvar315.us.us.1, 7
  %61 = add i64 %60, 28
  %scevgep321.us.us.1 = getelementptr i32, i32* %15, i64 %61
  store i32 0, i32* %scevgep321.us.us.1, align 4, !alias.scope !138, !noalias !147, !llvm.mem.parallel_loop_access !150
  %polly.indvar_next316.us.us.1 = add nuw nsw i64 %polly.indvar315.us.us.1, 1
  %polly.loop_cond318.us.us.1 = icmp sgt i64 %polly.indvar315.us.us.1, %polly.adjust_ub317588
  br i1 %polly.loop_cond318.us.us.1, label %polly.merge297.loopexit615, label %polly.loop_header311.us.us.1

polly.loop_header253.us542.1:                     ; preds = %polly.loop_header253.us542.1.preheader, %polly.loop_header253.us542.1
  %polly.indvar256.us543.1 = phi i64 [ %polly.indvar_next257.us545.1, %polly.loop_header253.us542.1 ], [ 0, %polly.loop_header253.us542.1.preheader ]
  %62 = mul i64 %polly.indvar256.us543.1, 7
  %63 = add i64 %62, 28
  %scevgep261.us544.1 = getelementptr i32, i32* %9, i64 %63
  store i32 0, i32* %scevgep261.us544.1, align 4, !alias.scope !134, !noalias !136, !llvm.mem.parallel_loop_access !144
  %polly.indvar_next257.us545.1 = add nuw nsw i64 %polly.indvar256.us543.1, 1
  %polly.loop_cond258.us546.1 = icmp sgt i64 %polly.indvar256.us543.1, %polly.adjust_ub
  br i1 %polly.loop_cond258.us546.1, label %polly.merge240.loopexit, label %polly.loop_header253.us542.1

polly.loop_header253.us.us.1:                     ; preds = %polly.loop_header253.us.us.1.preheader, %polly.loop_header253.us.us.1
  %polly.indvar256.us.us.1 = phi i64 [ %polly.indvar_next257.us.us.1, %polly.loop_header253.us.us.1 ], [ 0, %polly.loop_header253.us.us.1.preheader ]
  %64 = mul i64 %polly.indvar256.us.us.1, 7
  %65 = add i64 %64, 28
  %scevgep261.us.us.1 = getelementptr i32, i32* %6, i64 %65
  store i32 0, i32* %scevgep261.us.us.1, align 4, !alias.scope !134, !noalias !136, !llvm.mem.parallel_loop_access !144
  %polly.indvar_next257.us.us.1 = add nuw nsw i64 %polly.indvar256.us.us.1, 1
  %polly.loop_cond258.us.us.1 = icmp sgt i64 %polly.indvar256.us.us.1, %polly.adjust_ub580
  br i1 %polly.loop_cond258.us.us.1, label %polly.merge240.loopexit617, label %polly.loop_header253.us.us.1
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %call = tail call i32 @maxMoney(), !dbg !187
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !12, metadata !53), !dbg !188
  tail call void @llvm.dbg.value(metadata i32 5, i64 0, metadata !13, metadata !53), !dbg !190
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !191
  br label %while.body.i, !dbg !192

while.body.i:                                     ; preds = %while.cond.backedge.i, %entry
  %i.033.i = phi i32 [ 0, %entry ], [ %i.1.i, %while.cond.backedge.i ], !dbg !193
  %j.032.i = phi i32 [ 5, %entry ], [ %j.1.i, %while.cond.backedge.i ], !dbg !193
  %alice.031.i = phi i32 [ 1, %entry ], [ %alice.0.be.i, %while.cond.backedge.i ], !dbg !193
  %idxprom.i = sext i32 %j.032.i to i64, !dbg !194
  %add.i = add nsw i32 %i.033.i, 1, !dbg !195
  %idxprom1.i = sext i32 %add.i to i64, !dbg !194
  %arrayidx2.i = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom1.i, i64 %idxprom.i, !dbg !194
  %0 = load i32, i32* %arrayidx2.i, align 4, !dbg !194, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !15, metadata !53), !dbg !196
  %sub.i = add nsw i32 %j.032.i, -1, !dbg !197
  %idxprom3.i = sext i32 %sub.i to i64, !dbg !198
  %idxprom4.i = sext i32 %i.033.i to i64, !dbg !198
  %arrayidx6.i = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %idxprom4.i, i64 %idxprom3.i, !dbg !198
  %1 = load i32, i32* %arrayidx6.i, align 4, !dbg !198, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !17, metadata !53), !dbg !199
  %cmp7.i = icmp sgt i32 %0, %1, !dbg !200
  tail call void @llvm.dbg.value(metadata i32 %sub.i, i64 0, metadata !13, metadata !53), !dbg !190
  %j.1.i = select i1 %cmp7.i, i32 %sub.i, i32 %j.032.i, !dbg !201
  %i.1.i = select i1 %cmp7.i, i32 %i.033.i, i32 %add.i, !dbg !201
  %idxprom4.pn.i = select i1 %cmp7.i, i64 %idxprom.i, i64 %idxprom4.i, !dbg !201
  %coin.0.in.i = getelementptr inbounds [6 x i32], [6 x i32]* @V, i64 0, i64 %idxprom4.pn.i, !dbg !202
  %coin.0.i = load i32, i32* %coin.0.in.i, align 4, !dbg !202, !tbaa !59
  %tobool.i = icmp eq i32 %alice.031.i, 0, !dbg !203
  br i1 %tobool.i, label %if.else14.i, label %if.then12.i, !dbg !204

if.then12.i:                                      ; preds = %while.body.i
  %2 = load i32, i32* @sum_alice, align 4, !dbg !205, !tbaa !59
  %add13.i = add nsw i32 %2, %coin.0.i, !dbg !205
  store i32 %add13.i, i32* @sum_alice, align 4, !dbg !205, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !14, metadata !53), !dbg !191
  br label %while.cond.backedge.i, !dbg !206

if.else14.i:                                      ; preds = %while.body.i
  %3 = load i32, i32* @sum_bob, align 4, !dbg !207, !tbaa !59
  %add15.i = add nsw i32 %3, %coin.0.i, !dbg !207
  store i32 %add15.i, i32* @sum_bob, align 4, !dbg !207, !tbaa !59
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !14, metadata !53), !dbg !191
  br label %while.cond.backedge.i, !dbg !193

while.cond.backedge.i:                            ; preds = %if.else14.i, %if.then12.i
  %alice.0.be.i = phi i32 [ 0, %if.then12.i ], [ 1, %if.else14.i ], !dbg !193
  %cmp.i = icmp sgt i32 %i.1.i, %j.1.i, !dbg !208
  br i1 %cmp.i, label %sumMoves.exit, label %while.body.i, !dbg !192

sumMoves.exit:                                    ; preds = %while.cond.backedge.i
  %4 = load i32, i32* @sum_alice, align 4, !dbg !209, !tbaa !59
  %5 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !211, !tbaa !59
  %cmp = icmp eq i32 %4, %5, !dbg !212
  br i1 %cmp, label %if.end, label %if.then, !dbg !213

if.then:                                          ; preds = %sumMoves.exit
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0)), !dbg !214
  tail call void @exit(i32 -1) #6, !dbg !216
  unreachable, !dbg !216

if.end:                                           ; preds = %sumMoves.exit
  %6 = load i32, i32* @sum_bob, align 4, !dbg !217, !tbaa !59
  %cmp2 = icmp slt i32 %4, %6, !dbg !219
  br i1 %cmp2, label %if.then3, label %if.end5, !dbg !220

if.then3:                                         ; preds = %if.end
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0)), !dbg !221
  tail call void @exit(i32 -1) #6, !dbg !223
  unreachable, !dbg !223

if.end5:                                          ; preds = %if.end
  %call6 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.8, i64 0, i64 0), i32 %4), !dbg !224
  %7 = load i32, i32* @sum_bob, align 4, !dbg !225, !tbaa !59
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.9, i64 0, i64 0), i32 %7), !dbg !226
  ret i32 0, !dbg !227
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
!133 = distinct !{!133}
!134 = distinct !{!134, !135, !"polly.alias.scope.X"}
!135 = distinct !{!135, !"polly.alias.scope.domain"}
!136 = !{!137, !138, !139, !140, !141}
!137 = distinct !{!137, !135, !"polly.alias.scope.V"}
!138 = distinct !{!138, !135, !"polly.alias.scope.Y"}
!139 = distinct !{!139, !135, !"polly.alias.scope.M"}
!140 = distinct !{!140, !135, !"polly.alias.scope.storemerge"}
!141 = distinct !{!141, !135, !"polly.alias.scope.Z"}
!142 = !{!133, !143}
!143 = distinct !{!143}
!144 = !{!133, !145}
!145 = distinct !{!145}
!146 = distinct !{!146}
!147 = !{!134, !137, !139, !140, !141}
!148 = !{!146, !149}
!149 = distinct !{!149}
!150 = !{!146, !151}
!151 = distinct !{!151}
!152 = distinct !{!152}
!153 = !{!134, !137, !138, !139, !140}
!154 = !{!152, !155}
!155 = distinct !{!155}
!156 = !{!152, !157}
!157 = distinct !{!157}
!158 = !DILocation(line: 127, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !160, file: !1, line: 127, column: 8)
!160 = distinct !DILexicalBlock(scope: !161, file: !1, line: 123, column: 39)
!161 = distinct !DILexicalBlock(scope: !162, file: !1, line: 123, column: 3)
!162 = distinct !DILexicalBlock(scope: !163, file: !1, line: 123, column: 3)
!163 = distinct !DILexicalBlock(scope: !164, file: !1, line: 93, column: 26)
!164 = distinct !DILexicalBlock(scope: !165, file: !1, line: 93, column: 2)
!165 = distinct !DILexicalBlock(scope: !28, file: !1, line: 93, column: 2)
!166 = !{!134, !138, !139, !140, !141}
!167 = !DILocation(line: 127, column: 30, scope: !159)
!168 = !DILocation(line: 127, column: 23, scope: !159)
!169 = !DILocation(line: 127, column: 8, scope: !160)
!170 = !{!134, !137, !138, !140, !141}
!171 = distinct !{!171}
!172 = distinct !{!172}
!173 = !DILocation(line: 107, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !175, file: !1, line: 107, column: 9)
!175 = distinct !DILexicalBlock(scope: !176, file: !1, line: 105, column: 19)
!176 = distinct !DILexicalBlock(scope: !177, file: !1, line: 105, column: 8)
!177 = distinct !DILexicalBlock(scope: !178, file: !1, line: 95, column: 39)
!178 = distinct !DILexicalBlock(scope: !179, file: !1, line: 95, column: 3)
!179 = distinct !DILexicalBlock(scope: !163, file: !1, line: 95, column: 3)
!180 = !DILocation(line: 107, column: 9, scope: !175)
!181 = distinct !{!181}
!182 = !DILocation(line: 115, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !184, file: !1, line: 115, column: 9)
!184 = distinct !DILexicalBlock(scope: !185, file: !1, line: 113, column: 19)
!185 = distinct !DILexicalBlock(scope: !177, file: !1, line: 113, column: 8)
!186 = !DILocation(line: 115, column: 9, scope: !184)
!187 = !DILocation(line: 144, column: 2, scope: !35)
!188 = !DILocation(line: 35, column: 6, scope: !10, inlinedAt: !189)
!189 = distinct !DILocation(line: 145, column: 2, scope: !35)
!190 = !DILocation(line: 35, column: 13, scope: !10, inlinedAt: !189)
!191 = !DILocation(line: 36, column: 6, scope: !10, inlinedAt: !189)
!192 = !DILocation(line: 37, column: 2, scope: !68, inlinedAt: !189)
!193 = !DILocation(line: 145, column: 2, scope: !35)
!194 = !DILocation(line: 38, column: 12, scope: !16, inlinedAt: !189)
!195 = !DILocation(line: 38, column: 16, scope: !16, inlinedAt: !189)
!196 = !DILocation(line: 38, column: 7, scope: !16, inlinedAt: !189)
!197 = !DILocation(line: 39, column: 19, scope: !16, inlinedAt: !189)
!198 = !DILocation(line: 39, column: 12, scope: !16, inlinedAt: !189)
!199 = !DILocation(line: 39, column: 7, scope: !16, inlinedAt: !189)
!200 = !DILocation(line: 41, column: 10, scope: !76, inlinedAt: !189)
!201 = !DILocation(line: 41, column: 7, scope: !16, inlinedAt: !189)
!202 = !DILocation(line: 43, column: 11, scope: !79, inlinedAt: !189)
!203 = !DILocation(line: 50, column: 7, scope: !81, inlinedAt: !189)
!204 = !DILocation(line: 50, column: 7, scope: !16, inlinedAt: !189)
!205 = !DILocation(line: 51, column: 14, scope: !84, inlinedAt: !189)
!206 = !DILocation(line: 53, column: 3, scope: !84, inlinedAt: !189)
!207 = !DILocation(line: 54, column: 12, scope: !87, inlinedAt: !189)
!208 = !DILocation(line: 37, column: 11, scope: !68, inlinedAt: !189)
!209 = !DILocation(line: 148, column: 6, scope: !210)
!210 = distinct !DILexicalBlock(scope: !35, file: !1, line: 148, column: 6)
!211 = !DILocation(line: 148, column: 19, scope: !210)
!212 = !DILocation(line: 148, column: 16, scope: !210)
!213 = !DILocation(line: 148, column: 6, scope: !35)
!214 = !DILocation(line: 149, column: 3, scope: !215)
!215 = distinct !DILexicalBlock(scope: !210, file: !1, line: 148, column: 32)
!216 = !DILocation(line: 150, column: 3, scope: !215)
!217 = !DILocation(line: 153, column: 18, scope: !218)
!218 = distinct !DILexicalBlock(scope: !35, file: !1, line: 153, column: 6)
!219 = !DILocation(line: 153, column: 16, scope: !218)
!220 = !DILocation(line: 153, column: 6, scope: !35)
!221 = !DILocation(line: 154, column: 3, scope: !222)
!222 = distinct !DILexicalBlock(scope: !218, file: !1, line: 153, column: 27)
!223 = !DILocation(line: 155, column: 3, scope: !222)
!224 = !DILocation(line: 158, column: 2, scope: !35)
!225 = !DILocation(line: 159, column: 65, scope: !35)
!226 = !DILocation(line: 159, column: 2, scope: !35)
!227 = !DILocation(line: 160, column: 1, scope: !35)
