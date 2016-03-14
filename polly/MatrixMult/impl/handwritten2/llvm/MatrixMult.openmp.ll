; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@R = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@A = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@B = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@C = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.1 = private unnamed_addr constant [47 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !6 {
entry:
  %polly.par.userContext = alloca {}, align 8
  %call = tail call i64 @time(i64* null) #6, !dbg !42
  %conv = trunc i64 %call to i32, !dbg !43
  tail call void @srand(i32 %conv) #6, !dbg !44
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !46), !dbg !47
  br label %for.cond2.preheader, !dbg !48

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !52

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = tail call i32 @rand() #6, !dbg !57
  %rem = srem i32 %call6, 10, !dbg !59
  %arrayidx8 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !60
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !61, !tbaa !62
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !52
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 2000, !dbg !52
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !52

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !48
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 2000, !dbg !48
  br i1 %exitcond72, label %polly.parallel.for, label %for.cond2.preheader, !dbg !48

polly.parallel.for:                               ; preds = %for.inc9
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 63, i64 1) #6
  call void @init_polly_subfn(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !66
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare void @srand(i32) #3

; Function Attrs: nounwind
declare i64 @time(i64*) #3

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @mat_mult() #0 !dbg !13 {
entry:
  %b_t = alloca [2000 x i32], align 16
  %0 = bitcast [2000 x i32]* %b_t to i8*, !dbg !67
  call void @llvm.lifetime.start(i64 8000, i8* %0) #6, !dbg !67
  tail call void @llvm.dbg.declare(metadata [2000 x i32]* %b_t, metadata !18, metadata !46), !dbg !68
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !16, metadata !46), !dbg !69
  br label %polly.loop_preheader65

polly.exiting:                                    ; preds = %polly.loop_exit74
  call void @llvm.lifetime.end(i64 8000, i8* nonnull %0) #6, !dbg !70
  ret void, !dbg !70

polly.loop_exit74:                                ; preds = %polly.stmt.for.end22
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond93 = icmp eq i64 %polly.indvar_next, 2000
  br i1 %exitcond93, label %polly.exiting, label %polly.loop_preheader65

polly.stmt.for.body3:                             ; preds = %polly.stmt.for.body3, %polly.loop_preheader65
  %polly.indvar67 = phi i64 [ 0, %polly.loop_preheader65 ], [ %polly.indvar_next68.4, %polly.stmt.for.body3 ]
  %1 = mul nuw nsw i64 %polly.indvar67, 2000
  %scevgep70 = getelementptr i32, i32* %scevgep, i64 %1
  %_p_scalar_ = load i32, i32* %scevgep70, align 4, !alias.scope !71, !noalias !73, !llvm.mem.parallel_loop_access !79
  %scevgep71 = getelementptr [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %polly.indvar67
  store i32 %_p_scalar_, i32* %scevgep71, align 4, !alias.scope !76, !noalias !80, !llvm.mem.parallel_loop_access !79
  %polly.indvar_next68 = add nuw nsw i64 %polly.indvar67, 1
  %2 = mul nuw nsw i64 %polly.indvar_next68, 2000
  %scevgep70.1 = getelementptr i32, i32* %scevgep, i64 %2
  %_p_scalar_.1 = load i32, i32* %scevgep70.1, align 4, !alias.scope !71, !noalias !73, !llvm.mem.parallel_loop_access !79
  %scevgep71.1 = getelementptr [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %polly.indvar_next68
  store i32 %_p_scalar_.1, i32* %scevgep71.1, align 4, !alias.scope !76, !noalias !80, !llvm.mem.parallel_loop_access !79
  %polly.indvar_next68.1 = add nsw i64 %polly.indvar67, 2
  %3 = mul nuw nsw i64 %polly.indvar_next68.1, 2000
  %scevgep70.2 = getelementptr i32, i32* %scevgep, i64 %3
  %_p_scalar_.2 = load i32, i32* %scevgep70.2, align 4, !alias.scope !71, !noalias !73, !llvm.mem.parallel_loop_access !79
  %scevgep71.2 = getelementptr [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %polly.indvar_next68.1
  store i32 %_p_scalar_.2, i32* %scevgep71.2, align 4, !alias.scope !76, !noalias !80, !llvm.mem.parallel_loop_access !79
  %polly.indvar_next68.2 = add nsw i64 %polly.indvar67, 3
  %4 = mul nuw nsw i64 %polly.indvar_next68.2, 2000
  %scevgep70.3 = getelementptr i32, i32* %scevgep, i64 %4
  %_p_scalar_.3 = load i32, i32* %scevgep70.3, align 4, !alias.scope !71, !noalias !73, !llvm.mem.parallel_loop_access !79
  %scevgep71.3 = getelementptr [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %polly.indvar_next68.2
  store i32 %_p_scalar_.3, i32* %scevgep71.3, align 4, !alias.scope !76, !noalias !80, !llvm.mem.parallel_loop_access !79
  %polly.indvar_next68.3 = add nsw i64 %polly.indvar67, 4
  %5 = mul nuw nsw i64 %polly.indvar_next68.3, 2000
  %scevgep70.4 = getelementptr i32, i32* %scevgep, i64 %5
  %_p_scalar_.4 = load i32, i32* %scevgep70.4, align 4, !alias.scope !71, !noalias !73, !llvm.mem.parallel_loop_access !79
  %scevgep71.4 = getelementptr [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %polly.indvar_next68.3
  store i32 %_p_scalar_.4, i32* %scevgep71.4, align 4, !alias.scope !76, !noalias !80, !llvm.mem.parallel_loop_access !79
  %polly.indvar_next68.4 = add nsw i64 %polly.indvar67, 5
  %exitcond.4 = icmp eq i64 %polly.indvar_next68.4, 2000
  br i1 %exitcond.4, label %polly.loop_preheader73, label %polly.stmt.for.body3, !llvm.loop !79

polly.loop_preheader65:                           ; preds = %polly.loop_exit74, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit74 ]
  %scevgep = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 0, i64 %polly.indvar
  br label %polly.stmt.for.body3

polly.stmt.for.end22:                             ; preds = %polly.stmt.for.body13
  %p_add.3.lcssa = phi i32 [ %p_add.3, %polly.stmt.for.body13 ]
  %6 = mul nuw nsw i64 %polly.indvar75, 2000
  %scevgep90 = getelementptr i32, i32* %scevgep89, i64 %6
  store i32 %p_add.3.lcssa, i32* %scevgep90, align 4, !alias.scope !74, !noalias !81
  %polly.indvar_next76 = add nuw nsw i64 %polly.indvar75, 1
  %exitcond92 = icmp eq i64 %polly.indvar_next76, 2000
  br i1 %exitcond92, label %polly.loop_exit74, label %polly.loop_preheader79

polly.loop_preheader73:                           ; preds = %polly.stmt.for.body3
  %scevgep89 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 0, i64 %polly.indvar
  br label %polly.loop_preheader79

polly.stmt.for.body13:                            ; preds = %polly.stmt.for.body13, %polly.loop_preheader79
  %sum.052.phiops.0 = phi i32 [ 0, %polly.loop_preheader79 ], [ %p_add.3, %polly.stmt.for.body13 ]
  %polly.indvar81 = phi i64 [ 0, %polly.loop_preheader79 ], [ %polly.indvar_next82.3, %polly.stmt.for.body13 ]
  %scevgep85 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %polly.indvar75, i64 %polly.indvar81
  %_p_scalar_86 = load i32, i32* %scevgep85, align 16, !alias.scope !75, !noalias !82
  %scevgep87 = getelementptr [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %polly.indvar81
  %_p_scalar_88 = load i32, i32* %scevgep87, align 16, !alias.scope !76, !noalias !80
  %p_mul = mul nsw i32 %_p_scalar_88, %_p_scalar_86, !dbg !83
  %p_add = add nsw i32 %p_mul, %sum.052.phiops.0, !dbg !87
  %polly.indvar_next82 = or i64 %polly.indvar81, 1
  %scevgep85.1 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %polly.indvar75, i64 %polly.indvar_next82
  %_p_scalar_86.1 = load i32, i32* %scevgep85.1, align 4, !alias.scope !75, !noalias !82
  %scevgep87.1 = getelementptr [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %polly.indvar_next82
  %_p_scalar_88.1 = load i32, i32* %scevgep87.1, align 4, !alias.scope !76, !noalias !80
  %p_mul.1 = mul nsw i32 %_p_scalar_88.1, %_p_scalar_86.1, !dbg !83
  %p_add.1 = add nsw i32 %p_mul.1, %p_add, !dbg !87
  %polly.indvar_next82.1 = or i64 %polly.indvar81, 2
  %scevgep85.2 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %polly.indvar75, i64 %polly.indvar_next82.1
  %_p_scalar_86.2 = load i32, i32* %scevgep85.2, align 8, !alias.scope !75, !noalias !82
  %scevgep87.2 = getelementptr [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %polly.indvar_next82.1
  %_p_scalar_88.2 = load i32, i32* %scevgep87.2, align 8, !alias.scope !76, !noalias !80
  %p_mul.2 = mul nsw i32 %_p_scalar_88.2, %_p_scalar_86.2, !dbg !83
  %p_add.2 = add nsw i32 %p_mul.2, %p_add.1, !dbg !87
  %polly.indvar_next82.2 = or i64 %polly.indvar81, 3
  %scevgep85.3 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %polly.indvar75, i64 %polly.indvar_next82.2
  %_p_scalar_86.3 = load i32, i32* %scevgep85.3, align 4, !alias.scope !75, !noalias !82
  %scevgep87.3 = getelementptr [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %polly.indvar_next82.2
  %_p_scalar_88.3 = load i32, i32* %scevgep87.3, align 4, !alias.scope !76, !noalias !80
  %p_mul.3 = mul nsw i32 %_p_scalar_88.3, %_p_scalar_86.3, !dbg !83
  %p_add.3 = add nsw i32 %p_mul.3, %p_add.2, !dbg !87
  %polly.indvar_next82.3 = add nsw i64 %polly.indvar81, 4
  %exitcond91.3 = icmp eq i64 %polly.indvar_next82.3, 2000
  br i1 %exitcond91.3, label %polly.stmt.for.end22, label %polly.stmt.for.body13

polly.loop_preheader79:                           ; preds = %polly.stmt.for.end22, %polly.loop_preheader73
  %polly.indvar75 = phi i64 [ 0, %polly.loop_preheader73 ], [ %polly.indvar_next76, %polly.stmt.for.end22 ]
  br label %polly.stmt.for.body13
}

; Function Attrs: nounwind uwtable
define i32 @main() #4 !dbg !29 {
entry:
  tail call void @init(), !dbg !88
  tail call void @mat_mult(), !dbg !89
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 2000, i32 2000), !dbg !90
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !91, !tbaa !62
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !92, !tbaa !62
  %2 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 1999, i64 1999), align 4, !dbg !93, !tbaa !62
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i32 %2), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

define internal void @init_polly_subfn(i8* nocapture readnone %polly.par.userContext) #5 {
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
  br label %polly.loop_preheader3

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit10.loopexit.us
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_preheader3
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  %indvar.next = add i64 %indvar, 1
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %indvar = phi i64 [ 0, %polly.par.loadIVBounds ], [ %indvar.next, %polly.loop_exit4 ]
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = add i64 %polly.par.LB, %indvar
  %5 = shl i64 %4, 5
  %6 = mul nsw i64 %polly.indvar, -32
  %7 = add nsw i64 %6, 1999
  %8 = icmp sgt i64 %7, 31
  %9 = select i1 %8, i64 31, i64 %7
  %polly.loop_guard = icmp sgt i64 %9, -1
  %polly.adjust_ub13 = add i64 %9, -1
  br i1 %polly.loop_guard, label %polly.loop_header8.preheader.us.preheader, label %polly.loop_exit4

polly.loop_header8.preheader.us.preheader:        ; preds = %polly.loop_preheader3
  br label %polly.loop_header8.preheader.us

polly.loop_header8.us:                            ; preds = %polly.loop_header8.preheader.us, %polly.loop_header8.us
  %polly.indvar11.us = phi i64 [ %polly.indvar_next12.us, %polly.loop_header8.us ], [ 0, %polly.loop_header8.preheader.us ]
  %10 = add i64 %5, %polly.indvar11.us
  %scevgep28 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %10, i64 %11
  %scevgep2829 = bitcast i32* %scevgep28 to i8*
  %scevgep30 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %10, i64 %11
  %scevgep3031 = bitcast i32* %scevgep30 to i8*
  %scevgep = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %10, i64 %11
  %scevgep25 = bitcast i32* %scevgep to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep25, i8* %scevgep3031, i64 %14, i32 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep2829, i8* %scevgep3031, i64 %14, i32 16, i1 false)
  %polly.indvar_next12.us = add nuw nsw i64 %polly.indvar11.us, 1
  %polly.loop_cond14.us = icmp sgt i64 %polly.indvar11.us, %polly.adjust_ub13
  br i1 %polly.loop_cond14.us, label %polly.loop_exit10.loopexit.us, label %polly.loop_header8.us

polly.loop_header8.preheader.us:                  ; preds = %polly.loop_header8.preheader.us.preheader, %polly.loop_exit10.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit10.loopexit.us ], [ 0, %polly.loop_header8.preheader.us.preheader ]
  %11 = shl i64 %polly.indvar5.us, 5
  %12 = add nuw nsw i64 %11, -2000
  %13 = icmp sgt i64 %12, -32
  %smax32 = select i1 %13, i64 %12, i64 -32
  %14 = mul i64 %smax32, -4
  br label %polly.loop_header8.us

polly.loop_exit10.loopexit.us:                    ; preds = %polly.loop_header8.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar_next6.us, 63
  br i1 %exitcond.us, label %polly.loop_exit4.loopexit, label %polly.loop_header8.preheader.us
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "polly.skip.fn" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !32)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !13, !29}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !7, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 13, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 14, type: !11)
!13 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 35, type: !7, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: true, variables: !14)
!14 = !{!15, !16, !17, !18, !22}
!15 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 36, type: !11)
!16 = !DILocalVariable(name: "j", scope: !13, file: !1, line: 36, type: !11)
!17 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 36, type: !11)
!18 = !DILocalVariable(name: "b_t", scope: !13, file: !1, line: 37, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 64000, align: 32, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 2000)
!22 = !DILocalVariable(name: "sum", scope: !23, file: !1, line: 46, type: !11)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 45, column: 27)
!24 = distinct !DILexicalBlock(scope: !25, file: !1, line: 45, column: 3)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 45, column: 3)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 39, column: 26)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 39, column: 2)
!28 = distinct !DILexicalBlock(scope: !13, file: !1, line: 39, column: 2)
!29 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 98, type: !30, isLocal: false, isDefinition: true, scopeLine: 98, isOptimized: true, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!11}
!32 = !{!33, !36, !37, !38}
!33 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 7, type: !34, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @A)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128000000, align: 32, elements: !35)
!35 = !{!21, !21}
!36 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 8, type: !34, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!37 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 9, type: !34, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @C)
!38 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 10, type: !34, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @R)
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!42 = !DILocation(line: 17, column: 22, scope: !6)
!43 = !DILocation(line: 17, column: 11, scope: !6)
!44 = !DILocation(line: 17, column: 5, scope: !45)
!45 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!46 = !DIExpression()
!47 = !DILocation(line: 13, column: 9, scope: !6)
!48 = !DILocation(line: 18, column: 5, scope: !49)
!49 = !DILexicalBlockFile(scope: !50, file: !1, discriminator: 1)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 18, column: 5)
!51 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 5)
!52 = !DILocation(line: 19, column: 9, scope: !53)
!53 = !DILexicalBlockFile(scope: !54, file: !1, discriminator: 1)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 19, column: 9)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 19, column: 9)
!56 = distinct !DILexicalBlock(scope: !50, file: !1, line: 18, column: 25)
!57 = !DILocation(line: 21, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 19, column: 29)
!59 = !DILocation(line: 21, column: 29, scope: !58)
!60 = !DILocation(line: 21, column: 13, scope: !58)
!61 = !DILocation(line: 21, column: 21, scope: !58)
!62 = !{!63, !63, i64 0}
!63 = !{!"int", !64, i64 0}
!64 = !{!"omnipotent char", !65, i64 0}
!65 = !{!"Simple C/C++ TBAA"}
!66 = !DILocation(line: 33, column: 1, scope: !6)
!67 = !DILocation(line: 37, column: 2, scope: !13)
!68 = !DILocation(line: 37, column: 6, scope: !13)
!69 = !DILocation(line: 36, column: 8, scope: !13)
!70 = !DILocation(line: 53, column: 1, scope: !13)
!71 = distinct !{!71, !72, !"polly.alias.scope.B"}
!72 = distinct !{!72, !"polly.alias.scope.domain"}
!73 = !{!74, !75, !76, !77, !78}
!74 = distinct !{!74, !72, !"polly.alias.scope.C"}
!75 = distinct !{!75, !72, !"polly.alias.scope.A"}
!76 = distinct !{!76, !72, !"polly.alias.scope.b_t"}
!77 = distinct !{!77, !72, !"polly.alias.scope.add.lcssa"}
!78 = distinct !{!78, !72, !"polly.alias.scope.sum.052"}
!79 = distinct !{!79}
!80 = !{!71, !74, !75, !77, !78}
!81 = !{!71, !75, !76, !77, !78}
!82 = !{!71, !74, !76, !77, !78}
!83 = !DILocation(line: 48, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !85, file: !1, line: 47, column: 20)
!85 = distinct !DILexicalBlock(scope: !86, file: !1, line: 47, column: 4)
!86 = distinct !DILexicalBlock(scope: !23, file: !1, line: 47, column: 4)
!87 = !DILocation(line: 48, column: 15, scope: !84)
!88 = !DILocation(line: 99, column: 2, scope: !29)
!89 = !DILocation(line: 100, column: 2, scope: !29)
!90 = !DILocation(line: 102, column: 2, scope: !29)
!91 = !DILocation(line: 104, column: 19, scope: !29)
!92 = !DILocation(line: 105, column: 19, scope: !29)
!93 = !DILocation(line: 106, column: 19, scope: !29)
!94 = !DILocation(line: 103, column: 5, scope: !29)
!95 = !DILocation(line: 108, column: 5, scope: !29)
