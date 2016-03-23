; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@B = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@C = common global [2000 x [2000 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.3 = private unnamed_addr constant [49 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%lld \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !4 {
entry:
  %polly.par.userContext = alloca {}, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !8, metadata !39), !dbg !40
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 63, i64 1) #6
  call void @init_polly_subfn(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !41
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @mat_mult() #0 !dbg !15 {
entry:
  %polly.par.userContext57 = alloca {}, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !17, metadata !39), !dbg !42
  %0 = bitcast {}* %polly.par.userContext57 to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn, i8* %0, i32 0, i64 0, i64 63, i64 1) #6
  call void @mat_mult_polly_subfn(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn_4, i8* %0, i32 0, i64 0, i64 63, i64 1) #6
  call void @mat_mult_polly_subfn_4(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !43
}

; Function Attrs: nounwind uwtable
define void @print_array() #2 !dbg !20 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !22, metadata !39), !dbg !44
  br label %for.cond1.preheader, !dbg !45

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !49, !tbaa !54
  br label %for.body3, !dbg !58

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %indvars.iv24, i64 %indvars.iv, !dbg !60
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !60, !tbaa !61
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2), !dbg !63
  %3 = trunc i64 %indvars.iv to i32, !dbg !64
  %rem = srem i32 %3, 80, !dbg !64
  %cmp6 = icmp eq i32 %rem, 79, !dbg !66
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !67

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !68, !tbaa !54
  %fputc21 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !70
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !58
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !49, !tbaa !54
  %exitcond = icmp eq i64 %indvars.iv.next, 2000, !dbg !58
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !58

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !71
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !45
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 2000, !dbg !45
  br i1 %exitcond26, label %for.end11, label %for.cond1.preheader, !dbg !45

for.end11:                                        ; preds = %for.end
  ret void, !dbg !72
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind uwtable
define i32 @main() #2 !dbg !24 {
entry:
  tail call void @init(), !dbg !73
  tail call void @mat_mult(), !dbg !74
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 2000, i32 2000), !dbg !75
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !76, !tbaa !77
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !79, !tbaa !77
  %2 = load i64, i64* getelementptr inbounds ([2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 1999, i64 1999), align 8, !dbg !80, !tbaa !61
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.3, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i64 %2), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

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
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = mul nsw i64 %polly.indvar, -32
  %5 = add nsw i64 %4, 1999
  %6 = icmp sgt i64 %5, 31
  %7 = select i1 %6, i64 31, i64 %5
  %polly.loop_guard = icmp sgt i64 %7, -1
  %8 = shl nsw i64 %polly.indvar, 5
  %polly.adjust_ub13 = add i64 %7, -1
  br i1 %polly.loop_guard, label %polly.loop_header8.preheader.us.preheader, label %polly.loop_exit4

polly.loop_header8.preheader.us.preheader:        ; preds = %polly.loop_preheader3
  br label %polly.loop_header8.preheader.us

polly.loop_header8.us:                            ; preds = %polly.loop_header8.preheader.us, %polly.loop_exit17.us
  %polly.indvar11.us = phi i64 [ %polly.indvar_next12.us, %polly.loop_exit17.us ], [ 0, %polly.loop_header8.preheader.us ]
  %9 = add nsw i64 %polly.indvar11.us, %8
  %10 = trunc i64 %9 to i32
  %11 = insertelement <4 x i32> undef, i32 %10, i32 0, !dbg !83
  %12 = insertelement <4 x i32> %11, i32 %10, i32 1, !dbg !83
  %13 = insertelement <4 x i32> %12, i32 %10, i32 2, !dbg !83
  %14 = insertelement <4 x i32> %13, i32 %10, i32 3, !dbg !83
  %15 = insertelement <4 x i32> undef, i32 %10, i32 0, !dbg !86
  %16 = insertelement <4 x i32> %15, i32 %10, i32 1, !dbg !86
  %17 = insertelement <4 x i32> %16, i32 %10, i32 2, !dbg !86
  %18 = insertelement <4 x i32> %17, i32 %10, i32 3, !dbg !86
  br label %polly.loop_preheader23.us

polly.loop_preheader23.us:                        ; preds = %polly.loop_preheader23.us, %polly.loop_header8.us
  %polly.indvar18.us = phi i64 [ 0, %polly.loop_header8.us ], [ %polly.indvar_next19.us, %polly.loop_preheader23.us ]
  %19 = shl i64 %polly.indvar18.us, 2
  %20 = add nuw nsw i64 %19, %33
  %scevgep.us = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %9, i64 %20
  %scevgep28.us = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %9, i64 %20
  %21 = bitcast i32* %scevgep.us to <4 x i32>*
  %22 = load <4 x i32>, <4 x i32>* %21, align 16, !alias.scope !87, !noalias !89
  %23 = add nsw <4 x i32> %22, %14, !dbg !83
  %24 = bitcast i32* %scevgep.us to <4 x i32>*
  store <4 x i32> %23, <4 x i32>* %24, align 16, !alias.scope !87, !noalias !89
  %25 = bitcast i32* %scevgep28.us to <4 x i32>*
  %26 = load <4 x i32>, <4 x i32>* %25, align 16, !alias.scope !90, !noalias !91
  %27 = add nsw <4 x i32> %26, %18, !dbg !86
  %28 = bitcast i32* %scevgep28.us to <4 x i32>*
  store <4 x i32> %27, <4 x i32>* %28, align 16, !alias.scope !90, !noalias !91
  %polly.indvar_next19.us = add nuw nsw i64 %polly.indvar18.us, 1
  %polly.loop_cond21.us = icmp sgt i64 %polly.indvar18.us, %polly.adjust_ub20.us
  br i1 %polly.loop_cond21.us, label %polly.loop_exit17.us, label %polly.loop_preheader23.us

polly.loop_exit17.us:                             ; preds = %polly.loop_preheader23.us
  %polly.indvar_next12.us = add nuw nsw i64 %polly.indvar11.us, 1
  %polly.loop_cond14.us = icmp sgt i64 %polly.indvar11.us, %polly.adjust_ub13
  br i1 %polly.loop_cond14.us, label %polly.loop_exit10.loopexit.us, label %polly.loop_header8.us

polly.loop_header8.preheader.us:                  ; preds = %polly.loop_header8.preheader.us.preheader, %polly.loop_exit10.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit10.loopexit.us ], [ 0, %polly.loop_header8.preheader.us.preheader ]
  %29 = mul nsw i64 %polly.indvar5.us, -8
  %30 = add nsw i64 %29, 499
  %31 = icmp sgt i64 %30, 7
  %32 = select i1 %31, i64 7, i64 %30
  %33 = shl i64 %polly.indvar5.us, 5
  %polly.adjust_ub20.us = add i64 %32, -1
  br label %polly.loop_header8.us

polly.loop_exit10.loopexit.us:                    ; preds = %polly.loop_exit17.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond30.us = icmp eq i64 %polly.indvar_next6.us, 63
  br i1 %exitcond30.us, label %polly.loop_exit4.loopexit, label %polly.loop_header8.preheader.us
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @mat_mult_polly_subfn(i8* nocapture readnone %polly.par.userContext) #5 {
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
  %scevgep31 = getelementptr [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %10, i64 %11
  %scevgep3132 = bitcast i64* %scevgep31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep3132, i8 0, i64 %15, i32 16, i1 false)
  %polly.indvar_next12.us = add nuw nsw i64 %polly.indvar11.us, 1
  %polly.loop_cond14.us = icmp sgt i64 %polly.indvar11.us, %polly.adjust_ub13
  br i1 %polly.loop_cond14.us, label %polly.loop_exit10.loopexit.us, label %polly.loop_header8.us

polly.loop_header8.preheader.us:                  ; preds = %polly.loop_header8.preheader.us.preheader, %polly.loop_exit10.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit10.loopexit.us ], [ 0, %polly.loop_header8.preheader.us.preheader ]
  %11 = shl i64 %polly.indvar5.us, 5
  %12 = shl i64 %polly.indvar5.us, 3
  %13 = add nuw nsw i64 %12, -500
  %14 = icmp sgt i64 %13, -8
  %smax = select i1 %14, i64 %13, i64 -8
  %15 = mul i64 %smax, -32
  br label %polly.loop_header8.us

polly.loop_exit10.loopexit.us:                    ; preds = %polly.loop_header8.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond28.us = icmp eq i64 %polly.indvar_next6.us, 63
  br i1 %exitcond28.us, label %polly.loop_exit4.loopexit, label %polly.loop_header8.preheader.us
}

define internal void @mat_mult_polly_subfn_4(i8* nocapture readnone %polly.par.userContext) #5 {
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

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit10.us-lcssa.us.us
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_preheader3
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = mul nsw i64 %polly.indvar, -32
  %5 = add nsw i64 %4, 1999
  %6 = icmp sgt i64 %5, 31
  %7 = select i1 %6, i64 31, i64 %5
  %polly.loop_guard = icmp sgt i64 %7, -1
  %8 = shl nsw i64 %polly.indvar, 5
  %polly.adjust_ub19 = add i64 %7, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader9.us.preheader, label %polly.loop_exit4

polly.loop_preheader9.us.preheader:               ; preds = %polly.loop_preheader3
  br label %polly.loop_preheader9.us

polly.loop_preheader9.us:                         ; preds = %polly.loop_preheader9.us.preheader, %polly.loop_exit10.us-lcssa.us.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit10.us-lcssa.us.us ], [ 0, %polly.loop_preheader9.us.preheader ]
  %9 = mul nsw i64 %polly.indvar5.us, -32
  %10 = add nsw i64 %9, 1999
  %11 = icmp sgt i64 %10, 31
  %12 = select i1 %11, i64 31, i64 %10
  %13 = shl nsw i64 %polly.indvar5.us, 5
  %polly.adjust_ub26.us = add i64 %12, -1
  br label %polly.loop_header14.preheader.us.us

polly.loop_header14.preheader.us.us:              ; preds = %polly.loop_exit16.loopexit.us.us, %polly.loop_preheader9.us
  %polly.indvar11.us.us = phi i64 [ 0, %polly.loop_preheader9.us ], [ %polly.indvar_next12.us.us, %polly.loop_exit16.loopexit.us.us ]
  %14 = mul nsw i64 %polly.indvar11.us.us, -8
  %15 = add nsw i64 %14, 499
  %16 = icmp sgt i64 %15, 7
  %17 = select i1 %16, i64 7, i64 %15
  %18 = shl i64 %polly.indvar11.us.us, 5
  %polly.adjust_ub33.us.us = add i64 %17, -1
  br label %polly.loop_header14.us.us

polly.loop_exit16.loopexit.us.us:                 ; preds = %polly.loop_exit23.us.us
  %polly.indvar_next12.us.us = add nuw nsw i64 %polly.indvar11.us.us, 1
  %exitcond45.us.us = icmp eq i64 %polly.indvar_next12.us.us, 63
  br i1 %exitcond45.us.us, label %polly.loop_exit10.us-lcssa.us.us, label %polly.loop_header14.preheader.us.us

polly.loop_header14.us.us:                        ; preds = %polly.loop_exit23.us.us, %polly.loop_header14.preheader.us.us
  %polly.indvar17.us.us = phi i64 [ %polly.indvar_next18.us.us, %polly.loop_exit23.us.us ], [ 0, %polly.loop_header14.preheader.us.us ]
  %19 = add nsw i64 %polly.indvar17.us.us, %8
  br label %polly.loop_header21.us.us

polly.loop_exit23.us.us:                          ; preds = %polly.loop_exit30.us.us
  %polly.indvar_next18.us.us = add nuw nsw i64 %polly.indvar17.us.us, 1
  %polly.loop_cond20.us.us = icmp sgt i64 %polly.indvar17.us.us, %polly.adjust_ub19
  br i1 %polly.loop_cond20.us.us, label %polly.loop_exit16.loopexit.us.us, label %polly.loop_header14.us.us

polly.loop_header21.us.us:                        ; preds = %polly.loop_exit30.us.us, %polly.loop_header14.us.us
  %polly.indvar24.us.us = phi i64 [ 0, %polly.loop_header14.us.us ], [ %polly.indvar_next25.us.us, %polly.loop_exit30.us.us ]
  %20 = add nuw nsw i64 %polly.indvar24.us.us, %13
  %scevgep.us.us = getelementptr [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %19, i64 %20
  %scevgep.promoted48.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !92, !noalias !94
  br label %polly.loop_preheader36.us.us

polly.loop_exit30.us.us:                          ; preds = %polly.loop_preheader36.us.us
  %p_add.us.us.3.lcssa = phi i64 [ %p_add.us.us.3, %polly.loop_preheader36.us.us ]
  store i64 %p_add.us.us.3.lcssa, i64* %scevgep.us.us, align 8, !alias.scope !92, !noalias !94
  %polly.indvar_next25.us.us = add nuw nsw i64 %polly.indvar24.us.us, 1
  %polly.loop_cond27.us.us = icmp sgt i64 %polly.indvar24.us.us, %polly.adjust_ub26.us
  br i1 %polly.loop_cond27.us.us, label %polly.loop_exit23.us.us, label %polly.loop_header21.us.us

polly.loop_preheader36.us.us:                     ; preds = %polly.loop_preheader36.us.us, %polly.loop_header21.us.us
  %p_add.lcssa49.us.us = phi i64 [ %scevgep.promoted48.us.us, %polly.loop_header21.us.us ], [ %p_add.us.us.3, %polly.loop_preheader36.us.us ]
  %polly.indvar31.us.us = phi i64 [ 0, %polly.loop_header21.us.us ], [ %polly.indvar_next32.us.us, %polly.loop_preheader36.us.us ]
  %21 = shl i64 %polly.indvar31.us.us, 2
  %22 = add nuw nsw i64 %21, %18
  %scevgep41.us.us = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %19, i64 %22
  %_p_scalar_42.us.us = load i32, i32* %scevgep41.us.us, align 16, !alias.scope !96, !noalias !97, !llvm.mem.parallel_loop_access !98
  %scevgep43.us.us = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %22, i64 %20
  %_p_scalar_44.us.us = load i32, i32* %scevgep43.us.us, align 4, !alias.scope !95, !noalias !99, !llvm.mem.parallel_loop_access !98
  %p_mul.us.us = mul nsw i32 %_p_scalar_44.us.us, %_p_scalar_42.us.us, !dbg !100
  %p_conv.us.us = sext i32 %p_mul.us.us to i64, !dbg !109
  %p_add.us.us = add nsw i64 %p_conv.us.us, %p_add.lcssa49.us.us, !dbg !110
  %23 = or i64 %22, 1
  %scevgep41.us.us.1 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %19, i64 %23
  %_p_scalar_42.us.us.1 = load i32, i32* %scevgep41.us.us.1, align 4, !alias.scope !96, !noalias !97, !llvm.mem.parallel_loop_access !98
  %scevgep43.us.us.1 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %23, i64 %20
  %_p_scalar_44.us.us.1 = load i32, i32* %scevgep43.us.us.1, align 4, !alias.scope !95, !noalias !99, !llvm.mem.parallel_loop_access !98
  %p_mul.us.us.1 = mul nsw i32 %_p_scalar_44.us.us.1, %_p_scalar_42.us.us.1, !dbg !100
  %p_conv.us.us.1 = sext i32 %p_mul.us.us.1 to i64, !dbg !109
  %p_add.us.us.1 = add nsw i64 %p_conv.us.us.1, %p_add.us.us, !dbg !110
  %24 = or i64 %22, 2
  %scevgep41.us.us.2 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %19, i64 %24
  %_p_scalar_42.us.us.2 = load i32, i32* %scevgep41.us.us.2, align 8, !alias.scope !96, !noalias !97, !llvm.mem.parallel_loop_access !98
  %scevgep43.us.us.2 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %24, i64 %20
  %_p_scalar_44.us.us.2 = load i32, i32* %scevgep43.us.us.2, align 4, !alias.scope !95, !noalias !99, !llvm.mem.parallel_loop_access !98
  %p_mul.us.us.2 = mul nsw i32 %_p_scalar_44.us.us.2, %_p_scalar_42.us.us.2, !dbg !100
  %p_conv.us.us.2 = sext i32 %p_mul.us.us.2 to i64, !dbg !109
  %p_add.us.us.2 = add nsw i64 %p_conv.us.us.2, %p_add.us.us.1, !dbg !110
  %25 = or i64 %22, 3
  %scevgep41.us.us.3 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %19, i64 %25
  %_p_scalar_42.us.us.3 = load i32, i32* %scevgep41.us.us.3, align 4, !alias.scope !96, !noalias !97, !llvm.mem.parallel_loop_access !98
  %scevgep43.us.us.3 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %25, i64 %20
  %_p_scalar_44.us.us.3 = load i32, i32* %scevgep43.us.us.3, align 4, !alias.scope !95, !noalias !99, !llvm.mem.parallel_loop_access !98
  %p_mul.us.us.3 = mul nsw i32 %_p_scalar_44.us.us.3, %_p_scalar_42.us.us.3, !dbg !100
  %p_conv.us.us.3 = sext i32 %p_mul.us.us.3 to i64, !dbg !109
  %p_add.us.us.3 = add nsw i64 %p_conv.us.us.3, %p_add.us.us.2, !dbg !110
  %polly.indvar_next32.us.us = add nuw nsw i64 %polly.indvar31.us.us, 1
  %polly.loop_cond34.us.us = icmp sgt i64 %polly.indvar31.us.us, %polly.adjust_ub33.us.us
  br i1 %polly.loop_cond34.us.us, label %polly.loop_exit30.us.us, label %polly.loop_preheader36.us.us

polly.loop_exit10.us-lcssa.us.us:                 ; preds = %polly.loop_exit16.loopexit.us.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond46.us = icmp eq i64 %polly.indvar_next6.us, 63
  br i1 %exitcond46.us, label %polly.loop_exit4.loopexit, label %polly.loop_preheader9.us
}

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { "polly.skip.fn" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!36, !37}
!llvm.ident = !{!38}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !27)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !15, !20, !24}
!4 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !5, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: true, variables: !7)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = !{!8, !11}
!8 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 25, type: !10)
!9 = distinct !DILexicalBlock(scope: !4, file: !1, line: 25, column: 5)
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "j", scope: !12, file: !1, line: 26, type: !10)
!12 = distinct !DILexicalBlock(scope: !13, file: !1, line: 26, column: 9)
!13 = distinct !DILexicalBlock(scope: !14, file: !1, line: 25, column: 29)
!14 = distinct !DILexicalBlock(scope: !9, file: !1, line: 25, column: 5)
!15 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 35, type: !5, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: true, variables: !16)
!16 = !{!17, !18, !19}
!17 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 36, type: !10)
!18 = !DILocalVariable(name: "j", scope: !15, file: !1, line: 36, type: !10)
!19 = !DILocalVariable(name: "k", scope: !15, file: !1, line: 36, type: !10)
!20 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 46, type: !5, isLocal: false, isDefinition: true, scopeLine: 47, isOptimized: true, variables: !21)
!21 = !{!22, !23}
!22 = !DILocalVariable(name: "i", scope: !20, file: !1, line: 48, type: !10)
!23 = !DILocalVariable(name: "j", scope: !20, file: !1, line: 48, type: !10)
!24 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 59, type: !25, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: true, variables: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!10}
!27 = !{!28, !32, !33}
!28 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 7, type: !29, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @A)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 128000000, align: 32, elements: !30)
!30 = !{!31, !31}
!31 = !DISubrange(count: 2000)
!32 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 8, type: !29, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!33 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 9, type: !34, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i64]]* @C)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 256000000, align: 64, elements: !30)
!35 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!36 = !{i32 2, !"Dwarf Version", i32 4}
!37 = !{i32 2, !"Debug Info Version", i32 3}
!38 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!39 = !DIExpression()
!40 = !DILocation(line: 25, column: 14, scope: !9)
!41 = !DILocation(line: 33, column: 1, scope: !4)
!42 = !DILocation(line: 36, column: 9, scope: !15)
!43 = !DILocation(line: 44, column: 1, scope: !15)
!44 = !DILocation(line: 48, column: 9, scope: !20)
!45 = !DILocation(line: 50, column: 5, scope: !46)
!46 = !DILexicalBlockFile(scope: !47, file: !1, discriminator: 1)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 50, column: 5)
!48 = distinct !DILexicalBlock(scope: !20, file: !1, line: 50, column: 5)
!49 = !DILocation(line: 52, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 51, column: 29)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 51, column: 9)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 51, column: 9)
!53 = distinct !DILexicalBlock(scope: !47, file: !1, line: 50, column: 25)
!54 = !{!55, !55, i64 0}
!55 = !{!"any pointer", !56, i64 0}
!56 = !{!"omnipotent char", !57, i64 0}
!57 = !{!"Simple C/C++ TBAA"}
!58 = !DILocation(line: 51, column: 9, scope: !59)
!59 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 1)
!60 = !DILocation(line: 52, column: 38, scope: !50)
!61 = !{!62, !62, i64 0}
!62 = !{!"long long", !56, i64 0}
!63 = !DILocation(line: 52, column: 13, scope: !50)
!64 = !DILocation(line: 53, column: 18, scope: !65)
!65 = distinct !DILexicalBlock(scope: !50, file: !1, line: 53, column: 17)
!66 = !DILocation(line: 53, column: 22, scope: !65)
!67 = !DILocation(line: 53, column: 17, scope: !50)
!68 = !DILocation(line: 53, column: 37, scope: !69)
!69 = !DILexicalBlockFile(scope: !65, file: !1, discriminator: 1)
!70 = !DILocation(line: 53, column: 29, scope: !69)
!71 = !DILocation(line: 55, column: 9, scope: !53)
!72 = !DILocation(line: 57, column: 1, scope: !20)
!73 = !DILocation(line: 61, column: 5, scope: !24)
!74 = !DILocation(line: 62, column: 5, scope: !24)
!75 = !DILocation(line: 64, column: 5, scope: !24)
!76 = !DILocation(line: 66, column: 19, scope: !24)
!77 = !{!78, !78, i64 0}
!78 = !{!"int", !56, i64 0}
!79 = !DILocation(line: 67, column: 19, scope: !24)
!80 = !DILocation(line: 68, column: 19, scope: !24)
!81 = !DILocation(line: 65, column: 5, scope: !24)
!82 = !DILocation(line: 69, column: 5, scope: !24)
!83 = !DILocation(line: 29, column: 31, scope: !84)
!84 = distinct !DILexicalBlock(scope: !85, file: !1, line: 26, column: 33)
!85 = distinct !DILexicalBlock(scope: !12, file: !1, line: 26, column: 9)
!86 = !DILocation(line: 30, column: 31, scope: !84)
!87 = distinct !{!87, !88, !"polly.alias.scope.A"}
!88 = distinct !{!88, !"polly.alias.scope.domain"}
!89 = !{!90}
!90 = distinct !{!90, !88, !"polly.alias.scope.B"}
!91 = !{!87}
!92 = distinct !{!92, !93, !"polly.alias.scope.C"}
!93 = distinct !{!93, !"polly.alias.scope.domain"}
!94 = !{!95, !96}
!95 = distinct !{!95, !93, !"polly.alias.scope.B"}
!96 = distinct !{!96, !93, !"polly.alias.scope.A"}
!97 = !{!92, !95}
!98 = distinct !{!98}
!99 = !{!92, !96}
!100 = !DILocation(line: 41, column: 45, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !1, line: 40, column: 13)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 40, column: 13)
!103 = distinct !DILexicalBlock(scope: !104, file: !1, line: 38, column: 29)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 38, column: 9)
!105 = distinct !DILexicalBlock(scope: !106, file: !1, line: 38, column: 9)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 37, column: 25)
!107 = distinct !DILexicalBlock(scope: !108, file: !1, line: 37, column: 5)
!108 = distinct !DILexicalBlock(scope: !15, file: !1, line: 37, column: 5)
!109 = !DILocation(line: 41, column: 37, scope: !101)
!110 = !DILocation(line: 41, column: 35, scope: !101)
