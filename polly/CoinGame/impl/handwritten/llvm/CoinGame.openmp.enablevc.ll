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
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !20, metadata !38), !dbg !85
  %0 = bitcast {}* %polly.par.userContext318 to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn, i8* %0, i32 0, i64 0, i64 6, i64 1) #5
  call void @maxMoney_polly_subfn(i8* %0) #5
  call void @GOMP_parallel_end() #5
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn_8, i8* %0, i32 0, i64 0, i64 6, i64 1) #5
  call void @maxMoney_polly_subfn_8(i8* %0) #5
  call void @GOMP_parallel_end() #5
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn_9, i8* %0, i32 0, i64 0, i64 6, i64 1) #5
  call void @maxMoney_polly_subfn_9(i8* %0) #5
  call void @GOMP_parallel_end() #5
  call void @llvm.lifetime.end(i64 8, i8* %0)
  br label %polly.loop_header

for.cond186.preheader:                            ; preds = %for.cond186.preheader.preheader, %for.cond186.preheader
  %indvars.iv287 = phi i64 [ %indvars.iv.next288, %for.cond186.preheader ], [ 0, %for.cond186.preheader.preheader ]
  %arrayidx192 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 0, !dbg !86
  %1 = load i32, i32* %arrayidx192, align 8, !dbg !86, !tbaa !46
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %1), !dbg !93
  %arrayidx192.1 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 1, !dbg !86
  %2 = load i32, i32* %arrayidx192.1, align 4, !dbg !86, !tbaa !46
  %call.1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %2), !dbg !93
  %arrayidx192.2 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 2, !dbg !86
  %3 = load i32, i32* %arrayidx192.2, align 8, !dbg !86, !tbaa !46
  %call.2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %3), !dbg !93
  %arrayidx192.3 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 3, !dbg !86
  %4 = load i32, i32* %arrayidx192.3, align 4, !dbg !86, !tbaa !46
  %call.3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %4), !dbg !93
  %arrayidx192.4 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 4, !dbg !86
  %5 = load i32, i32* %arrayidx192.4, align 8, !dbg !86, !tbaa !46
  %call.4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %5), !dbg !93
  %arrayidx192.5 = getelementptr inbounds [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 %indvars.iv287, i64 5, !dbg !86
  %6 = load i32, i32* %arrayidx192.5, align 4, !dbg !86, !tbaa !46
  %call.5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i32 %6), !dbg !93
  %putchar = tail call i32 @putchar(i32 10) #5, !dbg !94
  %indvars.iv.next288 = add nuw nsw i64 %indvars.iv287, 1, !dbg !95
  %exitcond289 = icmp eq i64 %indvars.iv.next288, 6, !dbg !95
  br i1 %exitcond289, label %for.end199, label %for.cond186.preheader, !dbg !95

for.end199:                                       ; preds = %for.cond186.preheader
  %7 = load i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), align 4, !dbg !97, !tbaa !46
  ret i32 %7, !dbg !98

polly.loop_header:                                ; preds = %polly.loop_exit370, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %polly.loop_exit370 ], [ 7, %entry ]
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit370 ], [ 0, %entry ]
  %8 = sub nsw i64 1, %polly.indvar
  %9 = icmp slt i64 %8, 0
  %10 = select i1 %9, i64 0, i64 %8
  %11 = sub nsw i64 5, %polly.indvar
  %12 = icmp sgt i64 %11, 4
  %13 = select i1 %12, i64 4, i64 %11
  %polly.loop_guard = icmp sgt i64 %10, %13
  br i1 %polly.loop_guard, label %polly.loop_exit322, label %polly.loop_preheader321

polly.loop_exit322.loopexit:                      ; preds = %polly.loop_header320
  br label %polly.loop_exit322

polly.loop_exit322:                               ; preds = %polly.loop_exit322.loopexit, %polly.loop_header
  %14 = icmp sgt i64 %11, 3
  %15 = select i1 %14, i64 3, i64 %11
  %polly.loop_guard333 = icmp sgt i64 %15, -1
  br i1 %polly.loop_guard333, label %polly.loop_preheader331, label %polly.cond

polly.cond.loopexit:                              ; preds = %polly.loop_header330
  br label %polly.cond

polly.cond:                                       ; preds = %polly.cond.loopexit, %polly.loop_exit322
  %16 = icmp sgt i64 %polly.indvar, 0
  br i1 %16, label %polly.then, label %polly.merge

polly.merge.loopexit:                             ; preds = %polly.loop_header343
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.cond
  %17 = sub nsw i64 2, %polly.indvar
  %18 = icmp slt i64 %17, 0
  %19 = select i1 %18, i64 0, i64 %17
  %polly.loop_guard371 = icmp sgt i64 %19, %11
  br i1 %polly.loop_guard371, label %polly.loop_exit370, label %polly.loop_preheader369

polly.loop_exit370.loopexit:                      ; preds = %polly.loop_header368
  br label %polly.loop_exit370

polly.loop_exit370:                               ; preds = %polly.loop_exit370.loopexit, %polly.merge
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %exitcond381 = icmp eq i64 %polly.indvar_next, 7
  br i1 %exitcond381, label %for.cond186.preheader.preheader, label %polly.loop_header

for.cond186.preheader.preheader:                  ; preds = %polly.loop_exit370
  br label %for.cond186.preheader, !dbg !86

polly.loop_header320:                             ; preds = %polly.loop_header320, %polly.loop_preheader321
  %polly.indvar323 = phi i64 [ %10, %polly.loop_preheader321 ], [ %polly.indvar_next324, %polly.loop_header320 ]
  %20 = mul i64 %polly.indvar323, 7
  %scevgep326 = getelementptr i32, i32* %scevgep, i64 %20
  %_p_scalar_ = load i32, i32* %scevgep326, align 4, !alias.scope !99, !noalias !101, !llvm.mem.parallel_loop_access !107
  %scevgep328 = getelementptr i32, i32* %scevgep327, i64 %20
  store i32 %_p_scalar_, i32* %scevgep328, align 4, !alias.scope !105, !noalias !108, !llvm.mem.parallel_loop_access !107
  %polly.indvar_next324 = add nuw nsw i64 %polly.indvar323, 1
  %polly.loop_cond325 = icmp sgt i64 %polly.indvar323, %polly.adjust_ub
  br i1 %polly.loop_cond325, label %polly.loop_exit322.loopexit, label %polly.loop_header320, !llvm.loop !107

polly.loop_preheader321:                          ; preds = %polly.loop_header
  %scevgep = getelementptr i32, i32* getelementptr inbounds ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 5), i64 %polly.indvar
  %scevgep327 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub = add i64 %13, -1
  br label %polly.loop_header320

polly.loop_header330:                             ; preds = %polly.loop_header330, %polly.loop_preheader331
  %polly.indvar334 = phi i64 [ 0, %polly.loop_preheader331 ], [ %polly.indvar_next335, %polly.loop_header330 ]
  %21 = mul nuw nsw i64 %polly.indvar334, 7
  %scevgep339 = getelementptr i32, i32* %scevgep338, i64 %21
  %_p_scalar_340 = load i32, i32* %scevgep339, align 4, !alias.scope !99, !noalias !101, !llvm.mem.parallel_loop_access !109
  %scevgep342 = getelementptr i32, i32* %scevgep341, i64 %21
  store i32 %_p_scalar_340, i32* %scevgep342, align 4, !alias.scope !103, !noalias !110, !llvm.mem.parallel_loop_access !109
  %polly.indvar_next335 = add nuw nsw i64 %polly.indvar334, 1
  %polly.loop_cond337 = icmp sgt i64 %polly.indvar334, %polly.adjust_ub336
  br i1 %polly.loop_cond337, label %polly.cond.loopexit, label %polly.loop_header330, !llvm.loop !109

polly.loop_preheader331:                          ; preds = %polly.loop_exit322
  %scevgep338 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 2, i64 %polly.indvar
  %scevgep341 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %polly.indvar
  %polly.adjust_ub336 = add i64 %15, -1
  br label %polly.loop_header330

polly.then:                                       ; preds = %polly.cond
  %22 = add nsw i64 %polly.indvar, -1
  br label %polly.loop_header343

polly.loop_header343:                             ; preds = %polly.loop_header343, %polly.then
  %polly.indvar346 = phi i64 [ 0, %polly.then ], [ %polly.indvar_next347, %polly.loop_header343 ]
  %scevgep350 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %polly.indvar346
  %_p_scalar_351 = load i32, i32* %scevgep350, align 4, !alias.scope !106, !noalias !111
  %23 = mul nuw nsw i64 %polly.indvar346, 7
  %24 = add nsw i64 %23, %22
  %scevgep352 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @X, i64 0, i64 0, i64 %24
  %_p_scalar_353 = load i32, i32* %scevgep352, align 4, !alias.scope !103, !noalias !110
  %scevgep354 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Y, i64 0, i64 0, i64 %24
  %_p_scalar_355 = load i32, i32* %scevgep354, align 4, !alias.scope !105, !noalias !108
  %p_cmp85 = icmp slt i32 %_p_scalar_353, %_p_scalar_355, !dbg !112
  %p_. = select i1 %p_cmp85, i32 %_p_scalar_353, i32 %_p_scalar_355, !dbg !119
  %p_add94 = add nsw i32 %p_., %_p_scalar_351, !dbg !121
  %25 = add nsw i64 %polly.indvar346, %22
  %scevgep356 = getelementptr [6 x i32], [6 x i32]* @V, i64 0, i64 %25
  %_p_scalar_357 = load i32, i32* %scevgep356, align 4, !alias.scope !106, !noalias !111
  %scevgep358 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %24
  %_p_scalar_359 = load i32, i32* %scevgep358, align 4, !alias.scope !104, !noalias !123
  %p_cmp105 = icmp slt i32 %_p_scalar_355, %_p_scalar_359, !dbg !121
  %p_cond117 = select i1 %p_cmp105, i32 %_p_scalar_355, i32 %_p_scalar_359, !dbg !121
  %p_add118 = add nsw i32 %p_cond117, %_p_scalar_357, !dbg !124
  %p_cmp119 = icmp sgt i32 %p_add94, %p_add118, !dbg !124
  %p_add94.p_add118 = select i1 %p_cmp119, i32 %p_add94, i32 %p_add118, !dbg !124
  %scevgep366 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 0, i64 0, i64 %24
  store i32 %p_add94.p_add118, i32* %scevgep366, align 4, !alias.scope !99, !noalias !101
  %polly.indvar_next347 = add nuw nsw i64 %polly.indvar346, 1
  %exitcond = icmp eq i64 %polly.indvar_next347, %indvars.iv
  br i1 %exitcond, label %polly.merge.loopexit, label %polly.loop_header343

polly.loop_header368:                             ; preds = %polly.loop_header368, %polly.loop_preheader369
  %polly.indvar372 = phi i64 [ %19, %polly.loop_preheader369 ], [ %polly.indvar_next373, %polly.loop_header368 ]
  %26 = mul i64 %polly.indvar372, 7
  %scevgep377 = getelementptr i32, i32* %scevgep376, i64 %26
  %_p_scalar_378 = load i32, i32* %scevgep377, align 4, !alias.scope !99, !noalias !101, !llvm.mem.parallel_loop_access !126
  %scevgep380 = getelementptr i32, i32* %scevgep379, i64 %26
  store i32 %_p_scalar_378, i32* %scevgep380, align 4, !alias.scope !104, !noalias !123, !llvm.mem.parallel_loop_access !126
  %polly.indvar_next373 = add nuw nsw i64 %polly.indvar372, 1
  %polly.loop_cond375 = icmp slt i64 %polly.indvar372, %11
  br i1 %polly.loop_cond375, label %polly.loop_header368, label %polly.loop_exit370.loopexit, !llvm.loop !126

polly.loop_preheader369:                          ; preds = %polly.merge
  %scevgep376 = getelementptr i32, i32* getelementptr ([6 x [6 x i32]], [6 x [6 x i32]]* @M, i64 128102389400760775, i64 0, i64 2), i64 %polly.indvar
  %scevgep379 = getelementptr [6 x [6 x i32]], [6 x [6 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar
  br label %polly.loop_header368
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !23 {
entry:
  %call = tail call i32 @maxMoney(), !dbg !127
  tail call void @printMoves(), !dbg !128
  ret i32 0, !dbg !129
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #5

declare i32 @putchar(i32)

define internal void @maxMoney_polly_subfn(i8* nocapture readnone %polly.par.userContext) #6 {
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
  store i32 0, i32* %scevgep, align 4, !alias.scope !105, !noalias !108, !llvm.mem.parallel_loop_access !130
  %scevgep8.1 = getelementptr i32, i32* %scevgep, i64 7
  store i32 0, i32* %scevgep8.1, align 4, !alias.scope !105, !noalias !108, !llvm.mem.parallel_loop_access !130
  %scevgep8.2 = getelementptr i32, i32* %scevgep, i64 14
  store i32 0, i32* %scevgep8.2, align 4, !alias.scope !105, !noalias !108, !llvm.mem.parallel_loop_access !130
  %scevgep8.3 = getelementptr i32, i32* %scevgep, i64 21
  store i32 0, i32* %scevgep8.3, align 4, !alias.scope !105, !noalias !108, !llvm.mem.parallel_loop_access !130
  %6 = icmp eq i64 %polly.indvar, 2
  br i1 %6, label %polly.merge10, label %polly.parallel.for

polly.parallel.for:                               ; preds = %polly.loop_header, %polly.loop_preheader3
  call void @llvm.lifetime.start(i64 8, i8* %2)
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn_polly_subfn, i8* %2, i32 0, i64 0, i64 2, i64 1)
  call void @maxMoney_polly_subfn_polly_subfn(i8* %2)
  call void @GOMP_parallel_end()
  call void @llvm.lifetime.end(i64 8, i8* %2)
  br label %polly.merge10
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @maxMoney_polly_subfn_polly_subfn(i8* nocapture readonly %polly.par.userContext) #6 {
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
  store i32 0, i32* %scevgep25.us.us, align 4, !alias.scope !105, !noalias !108
  %polly.indvar_next20.us.us = add nuw nsw i64 %polly.indvar19.us.us, 1
  %polly.loop_cond22.us.us = icmp sgt i64 %polly.indvar19.us.us, %polly.adjust_ub21
  br i1 %polly.loop_cond22.us.us, label %polly.merge.us.us.loopexit93, label %polly.loop_header15.us.us

polly.loop_header2.us.us:                         ; preds = %polly.loop_header2.us.us.preheader, %polly.loop_header2.us.us
  %polly.indvar5.us.us = phi i64 [ %polly.indvar_next6.us.us, %polly.loop_header2.us.us ], [ 0, %polly.loop_header2.us.us.preheader ]
  %10 = mul i64 %polly.indvar5.us.us, 7
  %11 = add i64 %10, 28
  %scevgep9.us.us = getelementptr i32, i32* %scevgep, i64 %11
  store i32 0, i32* %scevgep9.us.us, align 4, !alias.scope !105, !noalias !108
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
  store i32 0, i32* %scevgep9.us, align 4, !alias.scope !105, !noalias !108
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
  store i32 0, i32* %scevgep9.us43, align 4, !alias.scope !105, !noalias !108
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
  store i32 0, i32* %scevgep9.us65, align 4, !alias.scope !105, !noalias !108
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

define internal void @maxMoney_polly_subfn_8(i8* nocapture readnone %polly.par.userContext) #6 {
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
  store i32 0, i32* %scevgep, align 4, !alias.scope !103, !noalias !110, !llvm.mem.parallel_loop_access !131
  %scevgep8.1 = getelementptr i32, i32* %scevgep, i64 7
  store i32 0, i32* %scevgep8.1, align 4, !alias.scope !103, !noalias !110, !llvm.mem.parallel_loop_access !131
  %scevgep8.2 = getelementptr i32, i32* %scevgep, i64 14
  store i32 0, i32* %scevgep8.2, align 4, !alias.scope !103, !noalias !110, !llvm.mem.parallel_loop_access !131
  %scevgep8.3 = getelementptr i32, i32* %scevgep, i64 21
  store i32 0, i32* %scevgep8.3, align 4, !alias.scope !103, !noalias !110, !llvm.mem.parallel_loop_access !131
  %6 = icmp eq i64 %polly.indvar, 2
  br i1 %6, label %polly.merge10, label %polly.parallel.for

polly.parallel.for:                               ; preds = %polly.loop_header, %polly.loop_preheader3
  call void @llvm.lifetime.start(i64 8, i8* %2)
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn_8_polly_subfn, i8* %2, i32 0, i64 0, i64 2, i64 1)
  call void @maxMoney_polly_subfn_8_polly_subfn(i8* %2)
  call void @GOMP_parallel_end()
  call void @llvm.lifetime.end(i64 8, i8* %2)
  br label %polly.merge10
}

define internal void @maxMoney_polly_subfn_8_polly_subfn(i8* nocapture readonly %polly.par.userContext) #6 {
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
  store i32 0, i32* %scevgep25.us.us, align 4, !alias.scope !103, !noalias !110
  %polly.indvar_next20.us.us = add nuw nsw i64 %polly.indvar19.us.us, 1
  %polly.loop_cond22.us.us = icmp sgt i64 %polly.indvar19.us.us, %polly.adjust_ub21
  br i1 %polly.loop_cond22.us.us, label %polly.merge.us.us.loopexit91, label %polly.loop_header15.us.us

polly.loop_header2.us.us:                         ; preds = %polly.loop_header2.us.us.preheader, %polly.loop_header2.us.us
  %polly.indvar5.us.us = phi i64 [ %polly.indvar_next6.us.us, %polly.loop_header2.us.us ], [ 0, %polly.loop_header2.us.us.preheader ]
  %10 = mul i64 %polly.indvar5.us.us, 7
  %11 = add i64 %10, 28
  %scevgep9.us.us = getelementptr i32, i32* %scevgep, i64 %11
  store i32 0, i32* %scevgep9.us.us, align 4, !alias.scope !103, !noalias !110
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
  store i32 0, i32* %scevgep9.us, align 4, !alias.scope !103, !noalias !110
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
  store i32 0, i32* %scevgep9.us41, align 4, !alias.scope !103, !noalias !110
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
  store i32 0, i32* %scevgep9.us63, align 4, !alias.scope !103, !noalias !110
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

define internal void @maxMoney_polly_subfn_9(i8* nocapture readnone %polly.par.userContext) #6 {
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
  store i32 0, i32* %scevgep, align 4, !alias.scope !104, !noalias !123, !llvm.mem.parallel_loop_access !132
  %scevgep8.1 = getelementptr i32, i32* %scevgep, i64 7
  store i32 0, i32* %scevgep8.1, align 4, !alias.scope !104, !noalias !123, !llvm.mem.parallel_loop_access !132
  %scevgep8.2 = getelementptr i32, i32* %scevgep, i64 14
  store i32 0, i32* %scevgep8.2, align 4, !alias.scope !104, !noalias !123, !llvm.mem.parallel_loop_access !132
  %scevgep8.3 = getelementptr i32, i32* %scevgep, i64 21
  store i32 0, i32* %scevgep8.3, align 4, !alias.scope !104, !noalias !123, !llvm.mem.parallel_loop_access !132
  %6 = icmp eq i64 %polly.indvar, 2
  br i1 %6, label %polly.merge10, label %polly.parallel.for

polly.parallel.for:                               ; preds = %polly.loop_header, %polly.loop_preheader3
  call void @llvm.lifetime.start(i64 8, i8* %2)
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @maxMoney_polly_subfn_9_polly_subfn, i8* %2, i32 0, i64 0, i64 2, i64 1)
  call void @maxMoney_polly_subfn_9_polly_subfn(i8* %2)
  call void @GOMP_parallel_end()
  call void @llvm.lifetime.end(i64 8, i8* %2)
  br label %polly.merge10
}

define internal void @maxMoney_polly_subfn_9_polly_subfn(i8* nocapture readonly %polly.par.userContext) #6 {
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
  store i32 0, i32* %scevgep25.us.us, align 4, !alias.scope !104, !noalias !123
  %polly.indvar_next20.us.us = add nuw nsw i64 %polly.indvar19.us.us, 1
  %polly.loop_cond22.us.us = icmp sgt i64 %polly.indvar19.us.us, %polly.adjust_ub21
  br i1 %polly.loop_cond22.us.us, label %polly.merge.us.us.loopexit91, label %polly.loop_header15.us.us

polly.loop_header2.us.us:                         ; preds = %polly.loop_header2.us.us.preheader, %polly.loop_header2.us.us
  %polly.indvar5.us.us = phi i64 [ %polly.indvar_next6.us.us, %polly.loop_header2.us.us ], [ 0, %polly.loop_header2.us.us.preheader ]
  %10 = mul i64 %polly.indvar5.us.us, 7
  %11 = add i64 %10, 28
  %scevgep9.us.us = getelementptr i32, i32* %scevgep, i64 %11
  store i32 0, i32* %scevgep9.us.us, align 4, !alias.scope !104, !noalias !123
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
  store i32 0, i32* %scevgep9.us, align 4, !alias.scope !104, !noalias !123
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
  store i32 0, i32* %scevgep9.us41, align 4, !alias.scope !104, !noalias !123
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
  store i32 0, i32* %scevgep9.us63, align 4, !alias.scope !104, !noalias !123
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
!99 = distinct !{!99, !100, !"polly.alias.scope.M"}
!100 = distinct !{!100, !"polly.alias.scope.domain"}
!101 = !{!102, !103, !104, !105, !106}
!102 = distinct !{!102, !100, !"polly.alias.scope.cond171"}
!103 = distinct !{!103, !100, !"polly.alias.scope.X"}
!104 = distinct !{!104, !100, !"polly.alias.scope.Z"}
!105 = distinct !{!105, !100, !"polly.alias.scope.Y"}
!106 = distinct !{!106, !100, !"polly.alias.scope.V"}
!107 = distinct !{!107}
!108 = !{!102, !99, !103, !104, !106}
!109 = distinct !{!109}
!110 = !{!102, !99, !104, !105, !106}
!111 = !{!102, !99, !103, !104, !105}
!112 = !DILocation(line: 76, column: 14, scope: !113)
!113 = distinct !DILexicalBlock(scope: !114, file: !1, line: 74, column: 48)
!114 = distinct !DILexicalBlock(scope: !115, file: !1, line: 74, column: 3)
!115 = distinct !DILexicalBlock(scope: !116, file: !1, line: 74, column: 3)
!116 = distinct !DILexicalBlock(scope: !117, file: !1, line: 58, column: 26)
!117 = distinct !DILexicalBlock(scope: !118, file: !1, line: 58, column: 2)
!118 = distinct !DILexicalBlock(scope: !16, file: !1, line: 58, column: 2)
!119 = !DILocation(line: 76, column: 14, scope: !120)
!120 = !DILexicalBlockFile(scope: !113, file: !1, discriminator: 1)
!121 = !DILocation(line: 76, column: 14, scope: !122)
!122 = !DILexicalBlockFile(scope: !113, file: !1, discriminator: 3)
!123 = !{!102, !99, !103, !105, !106}
!124 = !DILocation(line: 76, column: 14, scope: !125)
!125 = !DILexicalBlockFile(scope: !113, file: !1, discriminator: 6)
!126 = distinct !{!126}
!127 = !DILocation(line: 97, column: 2, scope: !23)
!128 = !DILocation(line: 98, column: 2, scope: !23)
!129 = !DILocation(line: 99, column: 1, scope: !23)
!130 = distinct !{!130}
!131 = distinct !{!131}
!132 = distinct !{!132}
