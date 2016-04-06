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
  br label %polly.loop_header313

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

polly.loop_header313:                             ; preds = %entry
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 0), align 16, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 1), align 4, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 2), align 8, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 3, i64 3), align 4, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 4, i64 4), align 16, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 5, i64 5), align 4, !alias.scope !99, !noalias !101
  br label %polly.loop_header313.1

polly.loop_header326:                             ; preds = %polly.loop_header313.4
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 0), align 16, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 1), align 4, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 2), align 8, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 3, i64 3), align 4, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 4, i64 4), align 16, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 5, i64 5), align 4, !alias.scope !102, !noalias !107
  br label %polly.loop_header326.1

polly.loop_header341:                             ; preds = %polly.loop_header326.4
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 0), align 16, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 1), align 4, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 2), align 8, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 3, i64 3), align 4, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 4, i64 4), align 16, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 5, i64 5), align 4, !alias.scope !106, !noalias !108
  br label %polly.loop_header341.1

polly.loop_header350:                             ; preds = %polly.loop_exit408, %polly.loop_header341.4
  %indvars.iv = phi i64 [ 7, %polly.loop_header341.4 ], [ %indvars.iv.next, %polly.loop_exit408 ]
  %polly.indvar353 = phi i64 [ 0, %polly.loop_header341.4 ], [ %polly.indvar_next354, %polly.loop_exit408 ]
  %7 = sub nsw i64 1, %polly.indvar353
  %8 = icmp slt i64 %7, 0
  %9 = select i1 %8, i64 0, i64 %7
  %10 = sub nsw i64 5, %polly.indvar353
  %11 = icmp sgt i64 %10, 4
  %12 = select i1 %11, i64 4, i64 %10
  %polly.loop_guard = icmp sgt i64 %9, %12
  br i1 %polly.loop_guard, label %polly.loop_exit358, label %polly.loop_preheader357

polly.loop_exit358.loopexit:                      ; preds = %polly.loop_header356
  br label %polly.loop_exit358

polly.loop_exit358:                               ; preds = %polly.loop_exit358.loopexit, %polly.loop_header350
  %13 = icmp sgt i64 %10, 3
  %14 = select i1 %13, i64 3, i64 %10
  %polly.loop_guard371 = icmp sgt i64 %14, -1
  br i1 %polly.loop_guard371, label %polly.loop_preheader369, label %polly.cond

polly.cond.loopexit:                              ; preds = %polly.loop_header368
  br label %polly.cond

polly.cond:                                       ; preds = %polly.cond.loopexit, %polly.loop_exit358
  %15 = icmp sgt i64 %polly.indvar353, 0
  br i1 %15, label %polly.then, label %polly.merge

polly.merge.loopexit:                             ; preds = %polly.loop_header381
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.cond
  %16 = sub nsw i64 2, %polly.indvar353
  %17 = icmp slt i64 %16, 0
  %18 = select i1 %17, i64 0, i64 %16
  %polly.loop_guard409 = icmp sgt i64 %18, %10
  br i1 %polly.loop_guard409, label %polly.loop_exit408, label %polly.loop_preheader407

polly.loop_exit408.loopexit:                      ; preds = %polly.loop_header406
  br label %polly.loop_exit408

polly.loop_exit408:                               ; preds = %polly.loop_exit408.loopexit, %polly.merge
  %polly.indvar_next354 = add nuw nsw i64 %polly.indvar353, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %exitcond419 = icmp eq i64 %polly.indvar_next354, 7
  br i1 %exitcond419, label %for.cond186.preheader.preheader, label %polly.loop_header350

for.cond186.preheader.preheader:                  ; preds = %polly.loop_exit408
  br label %for.cond186.preheader, !dbg !86

polly.loop_header356:                             ; preds = %polly.loop_header356, %polly.loop_preheader357
  %polly.indvar359 = phi i64 [ %9, %polly.loop_preheader357 ], [ %polly.indvar_next360, %polly.loop_header356 ]
  %19 = mul i64 %polly.indvar359, 7
  %scevgep364 = getelementptr i32, i32* %scevgep363, i64 %19
  %_p_scalar_ = load i32, i32* %scevgep364, align 4, !alias.scope !104, !noalias !109
  %scevgep366 = getelementptr i32, i32* %scevgep365, i64 %19
  store i32 %_p_scalar_, i32* %scevgep366, align 4, !alias.scope !99, !noalias !101
  %polly.indvar_next360 = add nuw nsw i64 %polly.indvar359, 1
  %polly.loop_cond362 = icmp sgt i64 %polly.indvar359, %polly.adjust_ub361
  br i1 %polly.loop_cond362, label %polly.loop_exit358.loopexit, label %polly.loop_header356

polly.loop_preheader357:                          ; preds = %polly.loop_header350
  %scevgep363 = getelementptr i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), i64 %polly.indvar353
  %scevgep365 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar353
  %polly.adjust_ub361 = add i64 %12, -1
  br label %polly.loop_header356

polly.loop_header368:                             ; preds = %polly.loop_header368, %polly.loop_preheader369
  %polly.indvar372 = phi i64 [ 0, %polly.loop_preheader369 ], [ %polly.indvar_next373, %polly.loop_header368 ]
  %20 = mul nuw nsw i64 %polly.indvar372, 7
  %scevgep377 = getelementptr i32, i32* %scevgep376, i64 %20
  %_p_scalar_378 = load i32, i32* %scevgep377, align 4, !alias.scope !104, !noalias !109
  %scevgep380 = getelementptr i32, i32* %scevgep379, i64 %20
  store i32 %_p_scalar_378, i32* %scevgep380, align 4, !alias.scope !102, !noalias !107
  %polly.indvar_next373 = add nuw nsw i64 %polly.indvar372, 1
  %polly.loop_cond375 = icmp sgt i64 %polly.indvar372, %polly.adjust_ub374
  br i1 %polly.loop_cond375, label %polly.cond.loopexit, label %polly.loop_header368

polly.loop_preheader369:                          ; preds = %polly.loop_exit358
  %scevgep376 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 2, i64 %polly.indvar353
  %scevgep379 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar353
  %polly.adjust_ub374 = add i64 %14, -1
  br label %polly.loop_header368

polly.then:                                       ; preds = %polly.cond
  %21 = add nsw i64 %polly.indvar353, -1
  br label %polly.loop_header381

polly.loop_header381:                             ; preds = %polly.loop_header381, %polly.then
  %polly.indvar384 = phi i64 [ 0, %polly.then ], [ %polly.indvar_next385, %polly.loop_header381 ]
  %scevgep388 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar384
  %_p_scalar_389 = load i32, i32* %scevgep388, align 4, !alias.scope !103, !noalias !110
  %22 = mul nuw nsw i64 %polly.indvar384, 7
  %23 = add nsw i64 %22, %21
  %scevgep390 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %23
  %_p_scalar_391 = load i32, i32* %scevgep390, align 4, !alias.scope !102, !noalias !107
  %scevgep392 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %23
  %_p_scalar_393 = load i32, i32* %scevgep392, align 4, !alias.scope !99, !noalias !101
  %p_cmp85 = icmp slt i32 %_p_scalar_391, %_p_scalar_393, !dbg !111
  %p_. = select i1 %p_cmp85, i32 %_p_scalar_391, i32 %_p_scalar_393, !dbg !118
  %p_add94 = add nsw i32 %p_., %_p_scalar_389, !dbg !120
  %24 = add nsw i64 %polly.indvar384, %21
  %scevgep394 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %24
  %_p_scalar_395 = load i32, i32* %scevgep394, align 4, !alias.scope !103, !noalias !110
  %scevgep396 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %23
  %_p_scalar_397 = load i32, i32* %scevgep396, align 4, !alias.scope !106, !noalias !108
  %p_cmp105 = icmp slt i32 %_p_scalar_393, %_p_scalar_397, !dbg !120
  %p_cond117 = select i1 %p_cmp105, i32 %_p_scalar_393, i32 %_p_scalar_397, !dbg !120
  %p_add118 = add nsw i32 %p_cond117, %_p_scalar_395, !dbg !122
  %p_cmp119 = icmp sgt i32 %p_add94, %p_add118, !dbg !122
  %p_add94.p_add118 = select i1 %p_cmp119, i32 %p_add94, i32 %p_add118, !dbg !122
  %scevgep404 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %23
  store i32 %p_add94.p_add118, i32* %scevgep404, align 4, !alias.scope !104, !noalias !109
  %polly.indvar_next385 = add nuw nsw i64 %polly.indvar384, 1
  %exitcond = icmp eq i64 %polly.indvar_next385, %indvars.iv
  br i1 %exitcond, label %polly.merge.loopexit, label %polly.loop_header381

polly.loop_header406:                             ; preds = %polly.loop_header406, %polly.loop_preheader407
  %polly.indvar410 = phi i64 [ %18, %polly.loop_preheader407 ], [ %polly.indvar_next411, %polly.loop_header406 ]
  %25 = mul i64 %polly.indvar410, 7
  %scevgep415 = getelementptr i32, i32* %scevgep414, i64 %25
  %_p_scalar_416 = load i32, i32* %scevgep415, align 4, !alias.scope !104, !noalias !109
  %scevgep418 = getelementptr i32, i32* %scevgep417, i64 %25
  store i32 %_p_scalar_416, i32* %scevgep418, align 4, !alias.scope !106, !noalias !108
  %polly.indvar_next411 = add nuw nsw i64 %polly.indvar410, 1
  %polly.loop_cond413 = icmp slt i64 %polly.indvar410, %10
  br i1 %polly.loop_cond413, label %polly.loop_header406, label %polly.loop_exit408.loopexit

polly.loop_preheader407:                          ; preds = %polly.merge
  %scevgep414 = getelementptr i32, i32* getelementptr ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 128102389400760775, i64 0, i64 2), i64 %polly.indvar353
  %scevgep417 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar353
  br label %polly.loop_header406

polly.loop_header341.1:                           ; preds = %polly.loop_header341
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 1), align 4, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 2), align 8, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 3), align 4, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 3, i64 4), align 8, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 4, i64 5), align 4, !alias.scope !106, !noalias !108
  br label %polly.loop_header341.2

polly.loop_header341.2:                           ; preds = %polly.loop_header341.1
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 2), align 8, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 3), align 4, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 4), align 16, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 3, i64 5), align 4, !alias.scope !106, !noalias !108
  br label %polly.loop_header341.3

polly.loop_header341.3:                           ; preds = %polly.loop_header341.2
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 3), align 4, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 4), align 8, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 2, i64 5), align 4, !alias.scope !106, !noalias !108
  br label %polly.loop_header341.4

polly.loop_header341.4:                           ; preds = %polly.loop_header341.3
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 4), align 16, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 1, i64 5), align 4, !alias.scope !106, !noalias !108
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 5), align 4, !alias.scope !106, !noalias !108
  br label %polly.loop_header350

polly.loop_header326.1:                           ; preds = %polly.loop_header326
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 1), align 4, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 2), align 8, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 3), align 4, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 3, i64 4), align 8, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 4, i64 5), align 4, !alias.scope !102, !noalias !107
  br label %polly.loop_header326.2

polly.loop_header326.2:                           ; preds = %polly.loop_header326.1
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 2), align 8, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 3), align 4, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 4), align 16, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 3, i64 5), align 4, !alias.scope !102, !noalias !107
  br label %polly.loop_header326.3

polly.loop_header326.3:                           ; preds = %polly.loop_header326.2
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 3), align 4, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 4), align 8, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 2, i64 5), align 4, !alias.scope !102, !noalias !107
  br label %polly.loop_header326.4

polly.loop_header326.4:                           ; preds = %polly.loop_header326.3
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 4), align 16, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 1, i64 5), align 4, !alias.scope !102, !noalias !107
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 5), align 4, !alias.scope !102, !noalias !107
  br label %polly.loop_header341

polly.loop_header313.1:                           ; preds = %polly.loop_header313
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 1), align 4, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 2), align 8, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 3), align 4, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 3, i64 4), align 8, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 4, i64 5), align 4, !alias.scope !99, !noalias !101
  br label %polly.loop_header313.2

polly.loop_header313.2:                           ; preds = %polly.loop_header313.1
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 2), align 8, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 3), align 4, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 4), align 16, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 3, i64 5), align 4, !alias.scope !99, !noalias !101
  br label %polly.loop_header313.3

polly.loop_header313.3:                           ; preds = %polly.loop_header313.2
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 3), align 4, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 4), align 8, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 2, i64 5), align 4, !alias.scope !99, !noalias !101
  br label %polly.loop_header313.4

polly.loop_header313.4:                           ; preds = %polly.loop_header313.3
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 4), align 16, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 1, i64 5), align 4, !alias.scope !99, !noalias !101
  store i32 0, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 5), align 4, !alias.scope !99, !noalias !101
  br label %polly.loop_header326
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !23 {
entry:
  %call = tail call i32 @maxMoney(), !dbg !124
  tail call void @printMoves(), !dbg !125
  ret i32 0, !dbg !126
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
!99 = distinct !{!99, !100, !"polly.alias.scope.Y"}
!100 = distinct !{!100, !"polly.alias.scope.domain"}
!101 = !{!102, !103, !104, !105, !106}
!102 = distinct !{!102, !100, !"polly.alias.scope.X"}
!103 = distinct !{!103, !100, !"polly.alias.scope.V"}
!104 = distinct !{!104, !100, !"polly.alias.scope.M"}
!105 = distinct !{!105, !100, !"polly.alias.scope.cond171"}
!106 = distinct !{!106, !100, !"polly.alias.scope.Z"}
!107 = !{!103, !99, !104, !105, !106}
!108 = !{!102, !103, !99, !104, !105}
!109 = !{!102, !103, !99, !105, !106}
!110 = !{!102, !99, !104, !105, !106}
!111 = !DILocation(line: 76, column: 14, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !1, line: 74, column: 48)
!113 = distinct !DILexicalBlock(scope: !114, file: !1, line: 74, column: 3)
!114 = distinct !DILexicalBlock(scope: !115, file: !1, line: 74, column: 3)
!115 = distinct !DILexicalBlock(scope: !116, file: !1, line: 58, column: 26)
!116 = distinct !DILexicalBlock(scope: !117, file: !1, line: 58, column: 2)
!117 = distinct !DILexicalBlock(scope: !16, file: !1, line: 58, column: 2)
!118 = !DILocation(line: 76, column: 14, scope: !119)
!119 = !DILexicalBlockFile(scope: !112, file: !1, discriminator: 1)
!120 = !DILocation(line: 76, column: 14, scope: !121)
!121 = !DILexicalBlockFile(scope: !112, file: !1, discriminator: 3)
!122 = !DILocation(line: 76, column: 14, scope: !123)
!123 = !DILexicalBlockFile(scope: !112, file: !1, discriminator: 6)
!124 = !DILocation(line: 97, column: 2, scope: !23)
!125 = !DILocation(line: 98, column: 2, scope: !23)
!126 = !DILocation(line: 99, column: 1, scope: !23)
