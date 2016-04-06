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

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i32 @maxMoney() #2 !dbg !16 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !20, metadata !38), !dbg !85
  br label %polly.loop_header

for.cond186.preheader:                            ; preds = %for.cond186.preheader.preheader, %for.cond186.preheader
  %indvars.iv287 = phi i64 [ %indvars.iv.next288, %for.cond186.preheader ], [ 0, %for.cond186.preheader.preheader ]
  %arrayidx192 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 0, !dbg !86
  %0 = load i32, i32* %arrayidx192, align 8, !dbg !86, !tbaa !46
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %0), !dbg !93
  %arrayidx192.1 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 1, !dbg !86
  %1 = load i32, i32* %arrayidx192.1, align 4, !dbg !86, !tbaa !46
  %call.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %1), !dbg !93
  %arrayidx192.2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 2, !dbg !86
  %2 = load i32, i32* %arrayidx192.2, align 8, !dbg !86, !tbaa !46
  %call.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %2), !dbg !93
  %arrayidx192.3 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 3, !dbg !86
  %3 = load i32, i32* %arrayidx192.3, align 4, !dbg !86, !tbaa !46
  %call.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %3), !dbg !93
  %arrayidx192.4 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 4, !dbg !86
  %4 = load i32, i32* %arrayidx192.4, align 8, !dbg !86, !tbaa !46
  %call.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %4), !dbg !93
  %arrayidx192.5 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 5, !dbg !86
  %5 = load i32, i32* %arrayidx192.5, align 4, !dbg !86, !tbaa !46
  %call.5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %5), !dbg !93
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !94
  %indvars.iv.next288 = add nuw nsw i64 %indvars.iv287, 1, !dbg !95
  %exitcond289 = icmp eq i64 %indvars.iv.next288, 6, !dbg !95
  br i1 %exitcond289, label %for.end199, label %for.cond186.preheader, !dbg !95

for.end199:                                       ; preds = %for.cond186.preheader
  %6 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !97, !tbaa !46
  ret i32 %6, !dbg !98

polly.loop_header:                                ; preds = %polly.loop_header.backedge, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar.be, %polly.loop_header.backedge ]
  %7 = icmp slt i64 %polly.indvar, 3
  br i1 %7, label %polly.loop_preheader314, label %polly.loop_preheader325.split.us

polly.merge321.loopexit:                          ; preds = %polly.loop_header334.us625.1
  br label %polly.merge321

polly.merge321.loopexit700:                       ; preds = %polly.loop_header334.us.us.1
  br label %polly.merge321

polly.merge321.loopexit701:                       ; preds = %polly.loop_header350.us
  br label %polly.merge321

polly.merge321:                                   ; preds = %polly.merge321.loopexit701, %polly.merge321.loopexit700, %polly.merge321.loopexit
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp slt i64 %polly.indvar, 5
  br i1 %polly.loop_cond, label %polly.loop_header.backedge, label %polly.loop_header363.preheader, !llvm.loop !99

polly.loop_header363.preheader:                   ; preds = %polly.merge321
  br label %polly.loop_header363

polly.loop_preheader314:                          ; preds = %polly.loop_header
  %scevgep = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  store i32 0, i32* %scevgep, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !108
  %scevgep319.1 = getelementptr i32, i32* %scevgep, i64 7
  store i32 0, i32* %scevgep319.1, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !108
  %scevgep319.2 = getelementptr i32, i32* %scevgep, i64 14
  store i32 0, i32* %scevgep319.2, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !108
  %scevgep319.3 = getelementptr i32, i32* %scevgep, i64 21
  store i32 0, i32* %scevgep319.3, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !108
  %8 = icmp eq i64 %polly.indvar, 2
  br i1 %8, label %polly.loop_header.backedge, label %polly.loop_preheader325.split

polly.loop_preheader325.split.us:                 ; preds = %polly.loop_header
  %9 = sub nsw i64 1, %polly.indvar
  %polly.loop_guard662 = icmp sgt i64 %9, -1
  %polly.adjust_ub663 = add i64 %9, -1
  %polly.adjust_ub355664 = sub i64 4, %polly.indvar
  %10 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  br i1 %polly.loop_guard662, label %polly.loop_header350.us.us.preheader, label %polly.loop_header350.us.preheader

polly.loop_header350.us.preheader:                ; preds = %polly.loop_preheader325.split.us
  br label %polly.loop_header350.us

polly.loop_header350.us.us.preheader:             ; preds = %polly.loop_preheader325.split.us
  br label %polly.loop_header350.us.us

polly.loop_header350.us.us:                       ; preds = %polly.loop_header350.us.us.preheader, %polly.loop_header350.us.us
  %polly.indvar353.us.us = phi i64 [ %polly.indvar_next354.us.us, %polly.loop_header350.us.us ], [ 0, %polly.loop_header350.us.us.preheader ]
  %11 = mul i64 %polly.indvar353.us.us, 7
  %scevgep359.us.us = getelementptr i32, i32* %10, i64 %11
  store i32 0, i32* %scevgep359.us.us, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next354.us.us = add nuw nsw i64 %polly.indvar353.us.us, 1
  %polly.loop_cond356.us.us = icmp sgt i64 %polly.indvar353.us.us, %polly.adjust_ub355664
  br i1 %polly.loop_cond356.us.us, label %polly.loop_header334.us.us.1.preheader, label %polly.loop_header350.us.us

polly.loop_header334.us.us.1.preheader:           ; preds = %polly.loop_header350.us.us
  %12 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  br label %polly.loop_header334.us.us.1

polly.loop_header350.us:                          ; preds = %polly.loop_header350.us.preheader, %polly.loop_header350.us
  %polly.indvar353.us = phi i64 [ %polly.indvar_next354.us, %polly.loop_header350.us ], [ 0, %polly.loop_header350.us.preheader ]
  %13 = mul i64 %polly.indvar353.us, 7
  %scevgep359.us = getelementptr i32, i32* %10, i64 %13
  store i32 0, i32* %scevgep359.us, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next354.us = add nuw nsw i64 %polly.indvar353.us, 1
  %polly.loop_cond356.us = icmp sgt i64 %polly.indvar353.us, %polly.adjust_ub355664
  br i1 %polly.loop_cond356.us, label %polly.merge321.loopexit701, label %polly.loop_header350.us

polly.loop_preheader325.split:                    ; preds = %polly.loop_preheader314
  %14 = sub nsw i64 1, %polly.indvar
  %polly.loop_guard = icmp sgt i64 %14, -1
  %polly.adjust_ub = add i64 %14, -1
  br i1 %polly.loop_guard, label %polly.loop_header334.us625.1.preheader, label %polly.merge321.thread

polly.loop_header334.us625.1.preheader:           ; preds = %polly.loop_preheader325.split
  %15 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  br label %polly.loop_header334.us625.1

polly.merge321.thread:                            ; preds = %polly.loop_preheader325.split
  %polly.indvar_next660 = add nsw i64 %polly.indvar, 1
  br label %polly.loop_header.backedge

polly.loop_header.backedge:                       ; preds = %polly.merge321.thread, %polly.merge321, %polly.loop_preheader314
  %polly.indvar.be = phi i64 [ %polly.indvar_next, %polly.merge321 ], [ 3, %polly.loop_preheader314 ], [ %polly.indvar_next660, %polly.merge321.thread ]
  br label %polly.loop_header

polly.loop_header363:                             ; preds = %polly.loop_header363.backedge, %polly.loop_header363.preheader
  %polly.indvar366 = phi i64 [ 0, %polly.loop_header363.preheader ], [ %polly.indvar366.be, %polly.loop_header363.backedge ]
  %16 = icmp slt i64 %polly.indvar366, 3
  br i1 %16, label %polly.loop_preheader374, label %polly.loop_preheader386.split.us

polly.merge382.loopexit:                          ; preds = %polly.loop_header396.us604.1
  br label %polly.merge382

polly.merge382.loopexit698:                       ; preds = %polly.loop_header396.us.us.1
  br label %polly.merge382

polly.merge382.loopexit699:                       ; preds = %polly.loop_header412.us
  br label %polly.merge382

polly.merge382:                                   ; preds = %polly.merge382.loopexit699, %polly.merge382.loopexit698, %polly.merge382.loopexit
  %polly.indvar_next367 = add nsw i64 %polly.indvar366, 1
  %polly.loop_cond368 = icmp slt i64 %polly.indvar366, 5
  br i1 %polly.loop_cond368, label %polly.loop_header363.backedge, label %polly.loop_header423.preheader, !llvm.loop !112

polly.loop_header423.preheader:                   ; preds = %polly.merge382
  br label %polly.loop_header423

polly.loop_preheader374:                          ; preds = %polly.loop_header363
  %scevgep379 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar366
  store i32 0, i32* %scevgep379, align 4, !alias.scope !106, !noalias !113, !llvm.mem.parallel_loop_access !114
  %scevgep380.1 = getelementptr i32, i32* %scevgep379, i64 7
  store i32 0, i32* %scevgep380.1, align 4, !alias.scope !106, !noalias !113, !llvm.mem.parallel_loop_access !114
  %scevgep380.2 = getelementptr i32, i32* %scevgep379, i64 14
  store i32 0, i32* %scevgep380.2, align 4, !alias.scope !106, !noalias !113, !llvm.mem.parallel_loop_access !114
  %scevgep380.3 = getelementptr i32, i32* %scevgep379, i64 21
  store i32 0, i32* %scevgep380.3, align 4, !alias.scope !106, !noalias !113, !llvm.mem.parallel_loop_access !114
  %17 = icmp eq i64 %polly.indvar366, 2
  br i1 %17, label %polly.loop_header363.backedge, label %polly.loop_preheader386.split

polly.loop_preheader386.split.us:                 ; preds = %polly.loop_header363
  %18 = sub nsw i64 1, %polly.indvar366
  %polly.loop_guard399670 = icmp sgt i64 %18, -1
  %polly.adjust_ub402671 = add i64 %18, -1
  %polly.adjust_ub417672 = sub i64 4, %polly.indvar366
  %19 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar366
  br i1 %polly.loop_guard399670, label %polly.loop_header412.us.us.preheader, label %polly.loop_header412.us.preheader

polly.loop_header412.us.preheader:                ; preds = %polly.loop_preheader386.split.us
  br label %polly.loop_header412.us

polly.loop_header412.us.us.preheader:             ; preds = %polly.loop_preheader386.split.us
  br label %polly.loop_header412.us.us

polly.loop_header412.us.us:                       ; preds = %polly.loop_header412.us.us.preheader, %polly.loop_header412.us.us
  %polly.indvar415.us.us = phi i64 [ %polly.indvar_next416.us.us, %polly.loop_header412.us.us ], [ 0, %polly.loop_header412.us.us.preheader ]
  %20 = mul i64 %polly.indvar415.us.us, 7
  %scevgep421.us.us = getelementptr i32, i32* %19, i64 %20
  store i32 0, i32* %scevgep421.us.us, align 4, !alias.scope !106, !noalias !113, !llvm.mem.parallel_loop_access !116
  %polly.indvar_next416.us.us = add nuw nsw i64 %polly.indvar415.us.us, 1
  %polly.loop_cond418.us.us = icmp sgt i64 %polly.indvar415.us.us, %polly.adjust_ub417672
  br i1 %polly.loop_cond418.us.us, label %polly.loop_header396.us.us.1.preheader, label %polly.loop_header412.us.us

polly.loop_header396.us.us.1.preheader:           ; preds = %polly.loop_header412.us.us
  %21 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar366
  br label %polly.loop_header396.us.us.1

polly.loop_header412.us:                          ; preds = %polly.loop_header412.us.preheader, %polly.loop_header412.us
  %polly.indvar415.us = phi i64 [ %polly.indvar_next416.us, %polly.loop_header412.us ], [ 0, %polly.loop_header412.us.preheader ]
  %22 = mul i64 %polly.indvar415.us, 7
  %scevgep421.us = getelementptr i32, i32* %19, i64 %22
  store i32 0, i32* %scevgep421.us, align 4, !alias.scope !106, !noalias !113, !llvm.mem.parallel_loop_access !116
  %polly.indvar_next416.us = add nuw nsw i64 %polly.indvar415.us, 1
  %polly.loop_cond418.us = icmp sgt i64 %polly.indvar415.us, %polly.adjust_ub417672
  br i1 %polly.loop_cond418.us, label %polly.merge382.loopexit699, label %polly.loop_header412.us

polly.loop_preheader386.split:                    ; preds = %polly.loop_preheader374
  %23 = sub nsw i64 1, %polly.indvar366
  %polly.loop_guard399 = icmp sgt i64 %23, -1
  %polly.adjust_ub402 = add i64 %23, -1
  br i1 %polly.loop_guard399, label %polly.loop_header396.us604.1.preheader, label %polly.merge382.thread

polly.loop_header396.us604.1.preheader:           ; preds = %polly.loop_preheader386.split
  %24 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar366
  br label %polly.loop_header396.us604.1

polly.merge382.thread:                            ; preds = %polly.loop_preheader386.split
  %polly.indvar_next367668 = add nsw i64 %polly.indvar366, 1
  br label %polly.loop_header363.backedge

polly.loop_header363.backedge:                    ; preds = %polly.merge382.thread, %polly.merge382, %polly.loop_preheader374
  %polly.indvar366.be = phi i64 [ %polly.indvar_next367, %polly.merge382 ], [ 3, %polly.loop_preheader374 ], [ %polly.indvar_next367668, %polly.merge382.thread ]
  br label %polly.loop_header363

polly.loop_header423:                             ; preds = %polly.loop_header423.backedge, %polly.loop_header423.preheader
  %polly.indvar426 = phi i64 [ 0, %polly.loop_header423.preheader ], [ %polly.indvar426.be, %polly.loop_header423.backedge ]
  %25 = icmp slt i64 %polly.indvar426, 3
  br i1 %25, label %polly.loop_preheader434, label %polly.loop_preheader446.split.us

polly.merge442.loopexit:                          ; preds = %polly.loop_header456.us583.1
  br label %polly.merge442

polly.merge442.loopexit696:                       ; preds = %polly.loop_header456.us.us.1
  br label %polly.merge442

polly.merge442.loopexit697:                       ; preds = %polly.loop_header472.us
  br label %polly.merge442

polly.merge442:                                   ; preds = %polly.merge442.loopexit697, %polly.merge442.loopexit696, %polly.merge442.loopexit
  %polly.indvar_next427 = add nsw i64 %polly.indvar426, 1
  %polly.loop_cond428 = icmp slt i64 %polly.indvar426, 5
  br i1 %polly.loop_cond428, label %polly.loop_header423.backedge, label %polly.loop_header483.preheader, !llvm.loop !118

polly.loop_header483.preheader:                   ; preds = %polly.merge442
  br label %polly.loop_header483

polly.loop_preheader434:                          ; preds = %polly.loop_header423
  %scevgep439 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar426
  store i32 0, i32* %scevgep439, align 4, !alias.scope !105, !noalias !119, !llvm.mem.parallel_loop_access !120
  %scevgep440.1 = getelementptr i32, i32* %scevgep439, i64 7
  store i32 0, i32* %scevgep440.1, align 4, !alias.scope !105, !noalias !119, !llvm.mem.parallel_loop_access !120
  %scevgep440.2 = getelementptr i32, i32* %scevgep439, i64 14
  store i32 0, i32* %scevgep440.2, align 4, !alias.scope !105, !noalias !119, !llvm.mem.parallel_loop_access !120
  %scevgep440.3 = getelementptr i32, i32* %scevgep439, i64 21
  store i32 0, i32* %scevgep440.3, align 4, !alias.scope !105, !noalias !119, !llvm.mem.parallel_loop_access !120
  %26 = icmp eq i64 %polly.indvar426, 2
  br i1 %26, label %polly.loop_header423.backedge, label %polly.loop_preheader446.split

polly.loop_preheader446.split.us:                 ; preds = %polly.loop_header423
  %27 = sub nsw i64 1, %polly.indvar426
  %polly.loop_guard459678 = icmp sgt i64 %27, -1
  %polly.adjust_ub462679 = add i64 %27, -1
  %polly.adjust_ub477680 = sub i64 4, %polly.indvar426
  %28 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar426
  br i1 %polly.loop_guard459678, label %polly.loop_header472.us.us.preheader, label %polly.loop_header472.us.preheader

polly.loop_header472.us.preheader:                ; preds = %polly.loop_preheader446.split.us
  br label %polly.loop_header472.us

polly.loop_header472.us.us.preheader:             ; preds = %polly.loop_preheader446.split.us
  br label %polly.loop_header472.us.us

polly.loop_header472.us.us:                       ; preds = %polly.loop_header472.us.us.preheader, %polly.loop_header472.us.us
  %polly.indvar475.us.us = phi i64 [ %polly.indvar_next476.us.us, %polly.loop_header472.us.us ], [ 0, %polly.loop_header472.us.us.preheader ]
  %29 = mul i64 %polly.indvar475.us.us, 7
  %scevgep481.us.us = getelementptr i32, i32* %28, i64 %29
  store i32 0, i32* %scevgep481.us.us, align 4, !alias.scope !105, !noalias !119, !llvm.mem.parallel_loop_access !122
  %polly.indvar_next476.us.us = add nuw nsw i64 %polly.indvar475.us.us, 1
  %polly.loop_cond478.us.us = icmp sgt i64 %polly.indvar475.us.us, %polly.adjust_ub477680
  br i1 %polly.loop_cond478.us.us, label %polly.loop_header456.us.us.1.preheader, label %polly.loop_header472.us.us

polly.loop_header456.us.us.1.preheader:           ; preds = %polly.loop_header472.us.us
  %30 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar426
  br label %polly.loop_header456.us.us.1

polly.loop_header472.us:                          ; preds = %polly.loop_header472.us.preheader, %polly.loop_header472.us
  %polly.indvar475.us = phi i64 [ %polly.indvar_next476.us, %polly.loop_header472.us ], [ 0, %polly.loop_header472.us.preheader ]
  %31 = mul i64 %polly.indvar475.us, 7
  %scevgep481.us = getelementptr i32, i32* %28, i64 %31
  store i32 0, i32* %scevgep481.us, align 4, !alias.scope !105, !noalias !119, !llvm.mem.parallel_loop_access !122
  %polly.indvar_next476.us = add nuw nsw i64 %polly.indvar475.us, 1
  %polly.loop_cond478.us = icmp sgt i64 %polly.indvar475.us, %polly.adjust_ub477680
  br i1 %polly.loop_cond478.us, label %polly.merge442.loopexit697, label %polly.loop_header472.us

polly.loop_preheader446.split:                    ; preds = %polly.loop_preheader434
  %32 = sub nsw i64 1, %polly.indvar426
  %polly.loop_guard459 = icmp sgt i64 %32, -1
  %polly.adjust_ub462 = add i64 %32, -1
  br i1 %polly.loop_guard459, label %polly.loop_header456.us583.1.preheader, label %polly.merge442.thread

polly.loop_header456.us583.1.preheader:           ; preds = %polly.loop_preheader446.split
  %33 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar426
  br label %polly.loop_header456.us583.1

polly.merge442.thread:                            ; preds = %polly.loop_preheader446.split
  %polly.indvar_next427676 = add nsw i64 %polly.indvar426, 1
  br label %polly.loop_header423.backedge

polly.loop_header423.backedge:                    ; preds = %polly.merge442.thread, %polly.merge442, %polly.loop_preheader434
  %polly.indvar426.be = phi i64 [ %polly.indvar_next427, %polly.merge442 ], [ 3, %polly.loop_preheader434 ], [ %polly.indvar_next427676, %polly.merge442.thread ]
  br label %polly.loop_header423

polly.loop_header483:                             ; preds = %polly.loop_header483.preheader, %polly.loop_exit547
  %indvars.iv = phi i64 [ %indvars.iv.next, %polly.loop_exit547 ], [ 7, %polly.loop_header483.preheader ]
  %polly.indvar486 = phi i64 [ %polly.indvar_next487, %polly.loop_exit547 ], [ 0, %polly.loop_header483.preheader ]
  %34 = sub nsw i64 1, %polly.indvar486
  %35 = icmp slt i64 %34, 0
  %36 = select i1 %35, i64 0, i64 %34
  %37 = sub nsw i64 5, %polly.indvar486
  %38 = icmp sgt i64 %37, 4
  %39 = select i1 %38, i64 4, i64 %37
  %polly.loop_guard493 = icmp sgt i64 %36, %39
  br i1 %polly.loop_guard493, label %polly.loop_exit492, label %polly.loop_preheader491

polly.loop_exit492.loopexit:                      ; preds = %polly.loop_header490
  br label %polly.loop_exit492

polly.loop_exit492:                               ; preds = %polly.loop_exit492.loopexit, %polly.loop_header483
  %40 = icmp sgt i64 %37, 3
  %41 = select i1 %40, i64 3, i64 %37
  %polly.loop_guard506 = icmp sgt i64 %41, -1
  br i1 %polly.loop_guard506, label %polly.loop_preheader504, label %polly.cond516

polly.cond516.loopexit:                           ; preds = %polly.loop_header503
  br label %polly.cond516

polly.cond516:                                    ; preds = %polly.cond516.loopexit, %polly.loop_exit492
  %42 = icmp sgt i64 %polly.indvar486, 0
  br i1 %42, label %polly.then518, label %polly.merge517

polly.merge517.loopexit:                          ; preds = %polly.loop_header520
  br label %polly.merge517

polly.merge517:                                   ; preds = %polly.merge517.loopexit, %polly.cond516
  %43 = sub nsw i64 2, %polly.indvar486
  %44 = icmp slt i64 %43, 0
  %45 = select i1 %44, i64 0, i64 %43
  %polly.loop_guard548 = icmp sgt i64 %45, %37
  br i1 %polly.loop_guard548, label %polly.loop_exit547, label %polly.loop_preheader546

polly.loop_exit547.loopexit:                      ; preds = %polly.loop_header545
  br label %polly.loop_exit547

polly.loop_exit547:                               ; preds = %polly.loop_exit547.loopexit, %polly.merge517
  %polly.indvar_next487 = add nuw nsw i64 %polly.indvar486, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %exitcond648 = icmp eq i64 %polly.indvar_next487, 7
  br i1 %exitcond648, label %for.cond186.preheader.preheader, label %polly.loop_header483

for.cond186.preheader.preheader:                  ; preds = %polly.loop_exit547
  br label %for.cond186.preheader, !dbg !86

polly.loop_header490:                             ; preds = %polly.loop_header490, %polly.loop_preheader491
  %polly.indvar494 = phi i64 [ %36, %polly.loop_preheader491 ], [ %polly.indvar_next495, %polly.loop_header490 ]
  %46 = mul i64 %polly.indvar494, 7
  %scevgep499 = getelementptr i32, i32* %scevgep498, i64 %46
  %_p_scalar_ = load i32, i32* %scevgep499, align 4, !alias.scope !103, !noalias !124, !llvm.mem.parallel_loop_access !125
  %scevgep501 = getelementptr i32, i32* %scevgep500, i64 %46
  store i32 %_p_scalar_, i32* %scevgep501, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !125
  %polly.indvar_next495 = add nuw nsw i64 %polly.indvar494, 1
  %polly.loop_cond497 = icmp sgt i64 %polly.indvar494, %polly.adjust_ub496
  br i1 %polly.loop_cond497, label %polly.loop_exit492.loopexit, label %polly.loop_header490, !llvm.loop !125

polly.loop_preheader491:                          ; preds = %polly.loop_header483
  %scevgep498 = getelementptr i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), i64 %polly.indvar486
  %scevgep500 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar486
  %polly.adjust_ub496 = add i64 %39, -1
  br label %polly.loop_header490

polly.loop_header503:                             ; preds = %polly.loop_header503, %polly.loop_preheader504
  %polly.indvar507 = phi i64 [ 0, %polly.loop_preheader504 ], [ %polly.indvar_next508, %polly.loop_header503 ]
  %47 = mul nuw nsw i64 %polly.indvar507, 7
  %scevgep512 = getelementptr i32, i32* %scevgep511, i64 %47
  %_p_scalar_513 = load i32, i32* %scevgep512, align 4, !alias.scope !103, !noalias !124, !llvm.mem.parallel_loop_access !126
  %scevgep515 = getelementptr i32, i32* %scevgep514, i64 %47
  store i32 %_p_scalar_513, i32* %scevgep515, align 4, !alias.scope !106, !noalias !113, !llvm.mem.parallel_loop_access !126
  %polly.indvar_next508 = add nuw nsw i64 %polly.indvar507, 1
  %polly.loop_cond510 = icmp sgt i64 %polly.indvar507, %polly.adjust_ub509
  br i1 %polly.loop_cond510, label %polly.cond516.loopexit, label %polly.loop_header503, !llvm.loop !126

polly.loop_preheader504:                          ; preds = %polly.loop_exit492
  %scevgep511 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 2, i64 %polly.indvar486
  %scevgep514 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar486
  %polly.adjust_ub509 = add i64 %41, -1
  br label %polly.loop_header503

polly.then518:                                    ; preds = %polly.cond516
  %48 = add nsw i64 %polly.indvar486, -1
  br label %polly.loop_header520

polly.loop_header520:                             ; preds = %polly.loop_header520, %polly.then518
  %polly.indvar523 = phi i64 [ 0, %polly.then518 ], [ %polly.indvar_next524, %polly.loop_header520 ]
  %scevgep527 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar523
  %_p_scalar_528 = load i32, i32* %scevgep527, align 4, !alias.scope !107, !noalias !127
  %49 = mul nuw nsw i64 %polly.indvar523, 7
  %50 = add nsw i64 %49, %48
  %scevgep529 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %50
  %_p_scalar_530 = load i32, i32* %scevgep529, align 4, !alias.scope !106, !noalias !113
  %scevgep531 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %50
  %_p_scalar_532 = load i32, i32* %scevgep531, align 4, !alias.scope !100, !noalias !102
  %p_cmp85 = icmp slt i32 %_p_scalar_530, %_p_scalar_532, !dbg !128
  %p_. = select i1 %p_cmp85, i32 %_p_scalar_530, i32 %_p_scalar_532, !dbg !135
  %p_add94 = add nsw i32 %p_., %_p_scalar_528, !dbg !137
  %51 = add nsw i64 %polly.indvar523, %48
  %scevgep533 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %51
  %_p_scalar_534 = load i32, i32* %scevgep533, align 4, !alias.scope !107, !noalias !127
  %scevgep535 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %50
  %_p_scalar_536 = load i32, i32* %scevgep535, align 4, !alias.scope !105, !noalias !119
  %p_cmp105 = icmp slt i32 %_p_scalar_532, %_p_scalar_536, !dbg !137
  %p_cond117 = select i1 %p_cmp105, i32 %_p_scalar_532, i32 %_p_scalar_536, !dbg !137
  %p_add118 = add nsw i32 %p_cond117, %_p_scalar_534, !dbg !139
  %p_cmp119 = icmp sgt i32 %p_add94, %p_add118, !dbg !139
  %p_add94.p_add118 = select i1 %p_cmp119, i32 %p_add94, i32 %p_add118, !dbg !139
  %scevgep543 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %50
  store i32 %p_add94.p_add118, i32* %scevgep543, align 4, !alias.scope !103, !noalias !124
  %polly.indvar_next524 = add nuw nsw i64 %polly.indvar523, 1
  %exitcond = icmp eq i64 %polly.indvar_next524, %indvars.iv
  br i1 %exitcond, label %polly.merge517.loopexit, label %polly.loop_header520

polly.loop_header545:                             ; preds = %polly.loop_header545, %polly.loop_preheader546
  %polly.indvar549 = phi i64 [ %45, %polly.loop_preheader546 ], [ %polly.indvar_next550, %polly.loop_header545 ]
  %52 = mul i64 %polly.indvar549, 7
  %scevgep554 = getelementptr i32, i32* %scevgep553, i64 %52
  %_p_scalar_555 = load i32, i32* %scevgep554, align 4, !alias.scope !103, !noalias !124, !llvm.mem.parallel_loop_access !141
  %scevgep557 = getelementptr i32, i32* %scevgep556, i64 %52
  store i32 %_p_scalar_555, i32* %scevgep557, align 4, !alias.scope !105, !noalias !119, !llvm.mem.parallel_loop_access !141
  %polly.indvar_next550 = add nuw nsw i64 %polly.indvar549, 1
  %polly.loop_cond552 = icmp slt i64 %polly.indvar549, %37
  br i1 %polly.loop_cond552, label %polly.loop_header545, label %polly.loop_exit547.loopexit, !llvm.loop !141

polly.loop_preheader546:                          ; preds = %polly.merge517
  %scevgep553 = getelementptr i32, i32* getelementptr ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 128102389400760775, i64 0, i64 2), i64 %polly.indvar486
  %scevgep556 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar486
  br label %polly.loop_header545

polly.loop_header456.us583.1:                     ; preds = %polly.loop_header456.us583.1.preheader, %polly.loop_header456.us583.1
  %polly.indvar460.us584.1 = phi i64 [ %polly.indvar_next461.us586.1, %polly.loop_header456.us583.1 ], [ 0, %polly.loop_header456.us583.1.preheader ]
  %53 = mul i64 %polly.indvar460.us584.1, 7
  %54 = add i64 %53, 28
  %scevgep466.us585.1 = getelementptr i32, i32* %33, i64 %54
  store i32 0, i32* %scevgep466.us585.1, align 4, !alias.scope !105, !noalias !119, !llvm.mem.parallel_loop_access !122
  %polly.indvar_next461.us586.1 = add nuw nsw i64 %polly.indvar460.us584.1, 1
  %polly.loop_cond463.us587.1 = icmp sgt i64 %polly.indvar460.us584.1, %polly.adjust_ub462
  br i1 %polly.loop_cond463.us587.1, label %polly.merge442.loopexit, label %polly.loop_header456.us583.1

polly.loop_header456.us.us.1:                     ; preds = %polly.loop_header456.us.us.1.preheader, %polly.loop_header456.us.us.1
  %polly.indvar460.us.us.1 = phi i64 [ %polly.indvar_next461.us.us.1, %polly.loop_header456.us.us.1 ], [ 0, %polly.loop_header456.us.us.1.preheader ]
  %55 = mul i64 %polly.indvar460.us.us.1, 7
  %56 = add i64 %55, 28
  %scevgep466.us.us.1 = getelementptr i32, i32* %30, i64 %56
  store i32 0, i32* %scevgep466.us.us.1, align 4, !alias.scope !105, !noalias !119, !llvm.mem.parallel_loop_access !122
  %polly.indvar_next461.us.us.1 = add nuw nsw i64 %polly.indvar460.us.us.1, 1
  %polly.loop_cond463.us.us.1 = icmp sgt i64 %polly.indvar460.us.us.1, %polly.adjust_ub462679
  br i1 %polly.loop_cond463.us.us.1, label %polly.merge442.loopexit696, label %polly.loop_header456.us.us.1

polly.loop_header396.us604.1:                     ; preds = %polly.loop_header396.us604.1.preheader, %polly.loop_header396.us604.1
  %polly.indvar400.us605.1 = phi i64 [ %polly.indvar_next401.us607.1, %polly.loop_header396.us604.1 ], [ 0, %polly.loop_header396.us604.1.preheader ]
  %57 = mul i64 %polly.indvar400.us605.1, 7
  %58 = add i64 %57, 28
  %scevgep406.us606.1 = getelementptr i32, i32* %24, i64 %58
  store i32 0, i32* %scevgep406.us606.1, align 4, !alias.scope !106, !noalias !113, !llvm.mem.parallel_loop_access !116
  %polly.indvar_next401.us607.1 = add nuw nsw i64 %polly.indvar400.us605.1, 1
  %polly.loop_cond403.us608.1 = icmp sgt i64 %polly.indvar400.us605.1, %polly.adjust_ub402
  br i1 %polly.loop_cond403.us608.1, label %polly.merge382.loopexit, label %polly.loop_header396.us604.1

polly.loop_header396.us.us.1:                     ; preds = %polly.loop_header396.us.us.1.preheader, %polly.loop_header396.us.us.1
  %polly.indvar400.us.us.1 = phi i64 [ %polly.indvar_next401.us.us.1, %polly.loop_header396.us.us.1 ], [ 0, %polly.loop_header396.us.us.1.preheader ]
  %59 = mul i64 %polly.indvar400.us.us.1, 7
  %60 = add i64 %59, 28
  %scevgep406.us.us.1 = getelementptr i32, i32* %21, i64 %60
  store i32 0, i32* %scevgep406.us.us.1, align 4, !alias.scope !106, !noalias !113, !llvm.mem.parallel_loop_access !116
  %polly.indvar_next401.us.us.1 = add nuw nsw i64 %polly.indvar400.us.us.1, 1
  %polly.loop_cond403.us.us.1 = icmp sgt i64 %polly.indvar400.us.us.1, %polly.adjust_ub402671
  br i1 %polly.loop_cond403.us.us.1, label %polly.merge382.loopexit698, label %polly.loop_header396.us.us.1

polly.loop_header334.us625.1:                     ; preds = %polly.loop_header334.us625.1.preheader, %polly.loop_header334.us625.1
  %polly.indvar337.us626.1 = phi i64 [ %polly.indvar_next338.us628.1, %polly.loop_header334.us625.1 ], [ 0, %polly.loop_header334.us625.1.preheader ]
  %61 = mul i64 %polly.indvar337.us626.1, 7
  %62 = add i64 %61, 28
  %scevgep342.us627.1 = getelementptr i32, i32* %15, i64 %62
  store i32 0, i32* %scevgep342.us627.1, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next338.us628.1 = add nuw nsw i64 %polly.indvar337.us626.1, 1
  %polly.loop_cond339.us629.1 = icmp sgt i64 %polly.indvar337.us626.1, %polly.adjust_ub
  br i1 %polly.loop_cond339.us629.1, label %polly.merge321.loopexit, label %polly.loop_header334.us625.1

polly.loop_header334.us.us.1:                     ; preds = %polly.loop_header334.us.us.1.preheader, %polly.loop_header334.us.us.1
  %polly.indvar337.us.us.1 = phi i64 [ %polly.indvar_next338.us.us.1, %polly.loop_header334.us.us.1 ], [ 0, %polly.loop_header334.us.us.1.preheader ]
  %63 = mul i64 %polly.indvar337.us.us.1, 7
  %64 = add i64 %63, 28
  %scevgep342.us.us.1 = getelementptr i32, i32* %12, i64 %64
  store i32 0, i32* %scevgep342.us.us.1, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next338.us.us.1 = add nuw nsw i64 %polly.indvar337.us.us.1, 1
  %polly.loop_cond339.us.us.1 = icmp sgt i64 %polly.indvar337.us.us.1, %polly.adjust_ub663
  br i1 %polly.loop_cond339.us.us.1, label %polly.merge321.loopexit700, label %polly.loop_header334.us.us.1
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !23 {
entry:
  %call = tail call i32 @maxMoney(), !dbg !142
  tail call void @printMoves(), !dbg !143
  ret i32 0, !dbg !144
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #4

declare i32 @putchar(i32)

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

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
!86 = !DILocation(line: 89, column: 19, scope: !87)
!87 = distinct !DILexicalBlock(scope: !88, file: !1, line: 88, column: 27)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 88, column: 3)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 88, column: 3)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 87, column: 26)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 87, column: 2)
!92 = distinct !DILexicalBlock(scope: !16, file: !1, line: 87, column: 2)
!93 = !DILocation(line: 89, column: 4, scope: !87)
!94 = !DILocation(line: 91, column: 3, scope: !90)
!95 = !DILocation(line: 87, column: 2, scope: !96)
!96 = !DILexicalBlockFile(scope: !91, file: !1, discriminator: 1)
!97 = !DILocation(line: 94, column: 9, scope: !16)
!98 = !DILocation(line: 94, column: 2, scope: !16)
!99 = distinct !{!99}
!100 = distinct !{!100, !101, !"polly.alias.scope.Y"}
!101 = distinct !{!101, !"polly.alias.scope.domain"}
!102 = !{!103, !104, !105, !106, !107}
!103 = distinct !{!103, !101, !"polly.alias.scope.M"}
!104 = distinct !{!104, !101, !"polly.alias.scope.cond171"}
!105 = distinct !{!105, !101, !"polly.alias.scope.Z"}
!106 = distinct !{!106, !101, !"polly.alias.scope.X"}
!107 = distinct !{!107, !101, !"polly.alias.scope.V"}
!108 = !{!99, !109}
!109 = distinct !{!109}
!110 = !{!99, !111}
!111 = distinct !{!111}
!112 = distinct !{!112}
!113 = !{!103, !104, !105, !107, !100}
!114 = !{!112, !115}
!115 = distinct !{!115}
!116 = !{!112, !117}
!117 = distinct !{!117}
!118 = distinct !{!118}
!119 = !{!103, !104, !106, !107, !100}
!120 = !{!118, !121}
!121 = distinct !{!121}
!122 = !{!118, !123}
!123 = distinct !{!123}
!124 = !{!104, !105, !106, !107, !100}
!125 = distinct !{!125}
!126 = distinct !{!126}
!127 = !{!103, !104, !105, !106, !100}
!128 = !DILocation(line: 76, column: 14, scope: !129)
!129 = distinct !DILexicalBlock(scope: !130, file: !1, line: 74, column: 48)
!130 = distinct !DILexicalBlock(scope: !131, file: !1, line: 74, column: 3)
!131 = distinct !DILexicalBlock(scope: !132, file: !1, line: 74, column: 3)
!132 = distinct !DILexicalBlock(scope: !133, file: !1, line: 58, column: 26)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 58, column: 2)
!134 = distinct !DILexicalBlock(scope: !16, file: !1, line: 58, column: 2)
!135 = !DILocation(line: 76, column: 14, scope: !136)
!136 = !DILexicalBlockFile(scope: !129, file: !1, discriminator: 1)
!137 = !DILocation(line: 76, column: 14, scope: !138)
!138 = !DILexicalBlockFile(scope: !129, file: !1, discriminator: 3)
!139 = !DILocation(line: 76, column: 14, scope: !140)
!140 = !DILexicalBlockFile(scope: !129, file: !1, discriminator: 6)
!141 = distinct !{!141}
!142 = !DILocation(line: 97, column: 2, scope: !23)
!143 = !DILocation(line: 98, column: 2, scope: !23)
!144 = !DILocation(line: 99, column: 1, scope: !23)
