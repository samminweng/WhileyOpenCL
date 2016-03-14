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
  %call = tail call i64 @time(i64* null) #6, !dbg !35
  %conv = trunc i64 %call to i32, !dbg !36
  tail call void @srand(i32 %conv) #6, !dbg !37
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !39), !dbg !40
  br label %for.cond2.preheader, !dbg !41

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !45

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = tail call i32 @rand() #6, !dbg !50
  %rem = srem i32 %call6, 10, !dbg !52
  %arrayidx8 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !53
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !54, !tbaa !55
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !45
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 2000, !dbg !45
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !45

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !41
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 2000, !dbg !41
  br i1 %exitcond72, label %polly.parallel.for, label %for.cond2.preheader, !dbg !41

polly.parallel.for:                               ; preds = %for.inc9
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 63, i64 1) #6
  call void @init_polly_subfn(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !59
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @srand(i32) #2

; Function Attrs: nounwind
declare i64 @time(i64*) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @mat_mult() #0 !dbg !13 {
entry:
  %polly.par.userContext57 = alloca {}, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !39), !dbg !60
  %0 = bitcast {}* %polly.par.userContext57 to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn, i8* %0, i32 0, i64 0, i64 63, i64 1) #6
  call void @mat_mult_polly_subfn(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn_2, i8* %0, i32 0, i64 0, i64 63, i64 1) #6
  call void @mat_mult_polly_subfn_2(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !61
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 !dbg !18 {
entry:
  tail call void @init(), !dbg !62
  tail call void @mat_mult(), !dbg !63
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 2000, i32 2000), !dbg !64
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !65, !tbaa !55
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !66, !tbaa !55
  %2 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 1999, i64 1999), align 4, !dbg !67, !tbaa !55
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i32 %2), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

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
  %scevgep = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %10, i64 %11
  %scevgep23 = bitcast i32* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep23, i8 0, i64 %14, i32 16, i1 false)
  %polly.indvar_next12.us = add nuw nsw i64 %polly.indvar11.us, 1
  %polly.loop_cond14.us = icmp sgt i64 %polly.indvar11.us, %polly.adjust_ub13
  br i1 %polly.loop_cond14.us, label %polly.loop_exit10.loopexit.us, label %polly.loop_header8.us

polly.loop_header8.preheader.us:                  ; preds = %polly.loop_header8.preheader.us.preheader, %polly.loop_exit10.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit10.loopexit.us ], [ 0, %polly.loop_header8.preheader.us.preheader ]
  %11 = shl i64 %polly.indvar5.us, 5
  %12 = add nuw nsw i64 %11, -2000
  %13 = icmp sgt i64 %12, -32
  %smax = select i1 %13, i64 %12, i64 -32
  %14 = mul i64 %smax, -4
  br label %polly.loop_header8.us

polly.loop_exit10.loopexit.us:                    ; preds = %polly.loop_header8.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar_next6.us, 63
  br i1 %exitcond.us, label %polly.loop_exit4.loopexit, label %polly.loop_header8.preheader.us
}

define internal void @mat_mult_polly_subfn_2(i8* nocapture readnone %polly.par.userContext) #5 {
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
  %14 = mul nsw i64 %polly.indvar11.us.us, -32
  %15 = add nsw i64 %14, 1999
  %16 = icmp sgt i64 %15, 31
  %17 = select i1 %16, i64 31, i64 %15
  %18 = shl nsw i64 %polly.indvar11.us.us, 5
  %polly.adjust_ub33.us.us = add i64 %17, -1
  br label %polly.loop_header14.us.us

polly.loop_exit16.loopexit.us.us:                 ; preds = %polly.loop_exit23.us.us
  %polly.indvar_next12.us.us = add nuw nsw i64 %polly.indvar11.us.us, 1
  %exitcond.us.us = icmp eq i64 %polly.indvar_next12.us.us, 63
  br i1 %exitcond.us.us, label %polly.loop_exit10.us-lcssa.us.us, label %polly.loop_header14.preheader.us.us

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
  %scevgep.us.us = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %19, i64 %20
  %scevgep.promoted.us.us = load i32, i32* %scevgep.us.us, align 4, !alias.scope !70, !noalias !72
  br label %polly.loop_header28.us.us

polly.loop_exit30.us.us:                          ; preds = %polly.loop_header28.us.us
  %p_add.us.us.lcssa = phi i32 [ %p_add.us.us, %polly.loop_header28.us.us ]
  store i32 %p_add.us.us.lcssa, i32* %scevgep.us.us, align 4, !alias.scope !70, !noalias !72
  %polly.indvar_next25.us.us = add nuw nsw i64 %polly.indvar24.us.us, 1
  %polly.loop_cond27.us.us = icmp sgt i64 %polly.indvar24.us.us, %polly.adjust_ub26.us
  br i1 %polly.loop_cond27.us.us, label %polly.loop_exit23.us.us, label %polly.loop_header21.us.us

polly.loop_header28.us.us:                        ; preds = %polly.loop_header28.us.us, %polly.loop_header21.us.us
  %p_add40.us.us = phi i32 [ %scevgep.promoted.us.us, %polly.loop_header21.us.us ], [ %p_add.us.us, %polly.loop_header28.us.us ]
  %polly.indvar31.us.us = phi i64 [ 0, %polly.loop_header21.us.us ], [ %polly.indvar_next32.us.us, %polly.loop_header28.us.us ]
  %21 = add nuw nsw i64 %polly.indvar31.us.us, %18
  %scevgep35.us.us = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %19, i64 %21
  %_p_scalar_36.us.us = load i32, i32* %scevgep35.us.us, align 4, !alias.scope !73, !noalias !75
  %scevgep37.us.us = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %21, i64 %20
  %_p_scalar_38.us.us = load i32, i32* %scevgep37.us.us, align 4, !alias.scope !74, !noalias !76
  %p_mul.us.us = mul nsw i32 %_p_scalar_38.us.us, %_p_scalar_36.us.us, !dbg !77
  %p_add.us.us = add nsw i32 %p_mul.us.us, %p_add40.us.us, !dbg !86
  %polly.indvar_next32.us.us = add nuw nsw i64 %polly.indvar31.us.us, 1
  %polly.loop_cond34.us.us = icmp sgt i64 %polly.indvar31.us.us, %polly.adjust_ub33.us.us
  br i1 %polly.loop_cond34.us.us, label %polly.loop_exit30.us.us, label %polly.loop_header28.us.us

polly.loop_exit10.us-lcssa.us.us:                 ; preds = %polly.loop_exit16.loopexit.us.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond39.us = icmp eq i64 %polly.indvar_next6.us, 63
  br i1 %exitcond39.us, label %polly.loop_exit4.loopexit, label %polly.loop_preheader9.us
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { "polly.skip.fn" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!32, !33}
!llvm.ident = !{!34}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !24)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !13, !18}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !7, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 13, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 14, type: !11)
!13 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 33, type: !7, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: true, variables: !14)
!14 = !{!15, !16, !17}
!15 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 34, type: !11)
!16 = !DILocalVariable(name: "j", scope: !13, file: !1, line: 34, type: !11)
!17 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 34, type: !11)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 57, type: !19, isLocal: false, isDefinition: true, scopeLine: 58, isOptimized: true, variables: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{!11}
!21 = !{!22, !23}
!22 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 59, type: !11)
!23 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 59, type: !11)
!24 = !{!25, !29, !30, !31}
!25 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 7, type: !26, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @A)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128000000, align: 32, elements: !27)
!27 = !{!28, !28}
!28 = !DISubrange(count: 2000)
!29 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 8, type: !26, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!30 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 9, type: !26, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @C)
!31 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 10, type: !26, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @R)
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!35 = !DILocation(line: 17, column: 22, scope: !6)
!36 = !DILocation(line: 17, column: 11, scope: !6)
!37 = !DILocation(line: 17, column: 5, scope: !38)
!38 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!39 = !DIExpression()
!40 = !DILocation(line: 13, column: 9, scope: !6)
!41 = !DILocation(line: 18, column: 5, scope: !42)
!42 = !DILexicalBlockFile(scope: !43, file: !1, discriminator: 1)
!43 = distinct !DILexicalBlock(scope: !44, file: !1, line: 18, column: 5)
!44 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 5)
!45 = !DILocation(line: 19, column: 9, scope: !46)
!46 = !DILexicalBlockFile(scope: !47, file: !1, discriminator: 1)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 19, column: 9)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 19, column: 9)
!49 = distinct !DILexicalBlock(scope: !43, file: !1, line: 18, column: 25)
!50 = !DILocation(line: 21, column: 23, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 19, column: 29)
!52 = !DILocation(line: 21, column: 29, scope: !51)
!53 = !DILocation(line: 21, column: 13, scope: !51)
!54 = !DILocation(line: 21, column: 21, scope: !51)
!55 = !{!56, !56, i64 0}
!56 = !{!"int", !57, i64 0}
!57 = !{!"omnipotent char", !58, i64 0}
!58 = !{!"Simple C/C++ TBAA"}
!59 = !DILocation(line: 31, column: 1, scope: !6)
!60 = !DILocation(line: 34, column: 9, scope: !13)
!61 = !DILocation(line: 42, column: 1, scope: !13)
!62 = !DILocation(line: 60, column: 5, scope: !18)
!63 = !DILocation(line: 61, column: 5, scope: !18)
!64 = !DILocation(line: 63, column: 5, scope: !18)
!65 = !DILocation(line: 65, column: 19, scope: !18)
!66 = !DILocation(line: 66, column: 19, scope: !18)
!67 = !DILocation(line: 67, column: 19, scope: !18)
!68 = !DILocation(line: 64, column: 5, scope: !18)
!69 = !DILocation(line: 68, column: 5, scope: !18)
!70 = distinct !{!70, !71, !"polly.alias.scope.C"}
!71 = distinct !{!71, !"polly.alias.scope.domain"}
!72 = !{!73, !74}
!73 = distinct !{!73, !71, !"polly.alias.scope.A"}
!74 = distinct !{!74, !71, !"polly.alias.scope.B"}
!75 = !{!70, !74}
!76 = !{!70, !73}
!77 = !DILocation(line: 39, column: 45, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 38, column: 13)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 38, column: 13)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 36, column: 29)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 36, column: 9)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 36, column: 9)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 35, column: 25)
!84 = distinct !DILexicalBlock(scope: !85, file: !1, line: 35, column: 5)
!85 = distinct !DILexicalBlock(scope: !13, file: !1, line: 35, column: 5)
!86 = !DILocation(line: 39, column: 35, scope: !78)
