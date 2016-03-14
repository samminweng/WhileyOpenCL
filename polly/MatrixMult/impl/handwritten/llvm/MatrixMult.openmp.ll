; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@R = common global [512 x [512 x i32]] zeroinitializer, align 16
@A = common global [512 x [512 x i32]] zeroinitializer, align 16
@B = common global [512 x [512 x i32]] zeroinitializer, align 16
@C = common global [512 x [512 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.1 = private unnamed_addr constant [47 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !6 {
entry:
  %polly.par.userContext = alloca {}, align 8
  %call = tail call i64 @time(i64* null) #7, !dbg !32
  %conv = trunc i64 %call to i32, !dbg !33
  tail call void @srand(i32 %conv) #7, !dbg !34
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !36), !dbg !37
  br label %for.cond2.preheader, !dbg !38

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !42

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = tail call i32 @rand() #7, !dbg !47
  %rem = srem i32 %call6, 100, !dbg !49
  %arrayidx8 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !50
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !51, !tbaa !52
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !42
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 512, !dbg !42
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !42

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !38
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 512, !dbg !38
  br i1 %exitcond72, label %polly.parallel.for, label %for.cond2.preheader, !dbg !38

polly.parallel.for:                               ; preds = %for.inc9
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 16, i64 1) #7
  call void @init_polly_subfn(i8* %0) #7
  call void @GOMP_parallel_end() #7
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !56
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

; Function Attrs: nounwind uwtable
define void @mat_mult() #3 !dbg !13 {
entry:
  %polly.par.userContext57 = alloca {}, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !36), !dbg !57
  %0 = bitcast {}* %polly.par.userContext57 to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn, i8* %0, i32 0, i64 0, i64 16, i64 1) #7
  %1 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %1)
  %2 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2)
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #7
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %mat_mult_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %entry
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_exit4.i
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #7
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %mat_mult_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_preheader3.i

polly.loop_exit4.i:                               ; preds = %polly.loop_preheader9.i
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  %indvar.next.i = add i64 %indvar.i, 1
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_preheader3.i

polly.loop_preheader3.i:                          ; preds = %polly.loop_exit4.i, %polly.par.loadIVBounds.i
  %indvar.i = phi i64 [ 0, %polly.par.loadIVBounds.i ], [ %indvar.next.i, %polly.loop_exit4.i ]
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_exit4.i ]
  %7 = add i64 %indvar.i, %polly.par.LB.i
  %8 = shl i64 %7, 5
  %9 = or i64 %8, 1
  %10 = or i64 %8, 2
  %11 = or i64 %8, 3
  %12 = or i64 %8, 4
  %13 = or i64 %8, 5
  %14 = or i64 %8, 6
  %15 = or i64 %8, 7
  %16 = or i64 %8, 8
  %17 = or i64 %8, 9
  %18 = or i64 %8, 10
  %19 = or i64 %8, 11
  %20 = or i64 %8, 12
  %21 = or i64 %8, 13
  %22 = or i64 %8, 14
  %23 = or i64 %8, 15
  %24 = or i64 %8, 16
  %25 = or i64 %8, 17
  %26 = or i64 %8, 18
  %27 = or i64 %8, 19
  %28 = or i64 %8, 20
  %29 = or i64 %8, 21
  %30 = or i64 %8, 22
  %31 = or i64 %8, 23
  %32 = or i64 %8, 24
  %33 = or i64 %8, 25
  %34 = or i64 %8, 26
  %35 = or i64 %8, 27
  %36 = or i64 %8, 28
  %37 = or i64 %8, 29
  %38 = or i64 %8, 30
  %39 = or i64 %8, 31
  br label %polly.loop_preheader9.i

polly.loop_preheader9.i:                          ; preds = %polly.loop_preheader3.i, %polly.loop_preheader9.i
  %polly.indvar5.i = phi i64 [ 0, %polly.loop_preheader3.i ], [ %polly.indvar_next6.i, %polly.loop_preheader9.i ]
  %40 = shl i64 %polly.indvar5.i, 5
  %scevgep22.i = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %8, i64 %40
  %scevgep2223.i = bitcast i32* %scevgep22.i to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %9, i64 %40
  %scevgep2223.i.1 = bitcast i32* %scevgep22.i.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.1, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.2 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %10, i64 %40
  %scevgep2223.i.2 = bitcast i32* %scevgep22.i.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.2, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.3 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %11, i64 %40
  %scevgep2223.i.3 = bitcast i32* %scevgep22.i.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.3, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.4 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %12, i64 %40
  %scevgep2223.i.4 = bitcast i32* %scevgep22.i.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.4, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.5 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %13, i64 %40
  %scevgep2223.i.5 = bitcast i32* %scevgep22.i.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.5, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.6 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %14, i64 %40
  %scevgep2223.i.6 = bitcast i32* %scevgep22.i.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.6, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.7 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %15, i64 %40
  %scevgep2223.i.7 = bitcast i32* %scevgep22.i.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.7, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.8 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %16, i64 %40
  %scevgep2223.i.8 = bitcast i32* %scevgep22.i.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.8, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.9 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %17, i64 %40
  %scevgep2223.i.9 = bitcast i32* %scevgep22.i.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.9, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.10 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %18, i64 %40
  %scevgep2223.i.10 = bitcast i32* %scevgep22.i.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.10, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.11 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %19, i64 %40
  %scevgep2223.i.11 = bitcast i32* %scevgep22.i.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.11, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.12 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %20, i64 %40
  %scevgep2223.i.12 = bitcast i32* %scevgep22.i.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.12, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.13 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %21, i64 %40
  %scevgep2223.i.13 = bitcast i32* %scevgep22.i.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.13, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.14 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %22, i64 %40
  %scevgep2223.i.14 = bitcast i32* %scevgep22.i.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.14, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.15 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %23, i64 %40
  %scevgep2223.i.15 = bitcast i32* %scevgep22.i.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.15, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.16 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %24, i64 %40
  %scevgep2223.i.16 = bitcast i32* %scevgep22.i.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.16, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.17 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %25, i64 %40
  %scevgep2223.i.17 = bitcast i32* %scevgep22.i.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.17, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.18 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %26, i64 %40
  %scevgep2223.i.18 = bitcast i32* %scevgep22.i.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.18, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.19 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %27, i64 %40
  %scevgep2223.i.19 = bitcast i32* %scevgep22.i.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.19, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.20 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %28, i64 %40
  %scevgep2223.i.20 = bitcast i32* %scevgep22.i.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.20, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.21 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %29, i64 %40
  %scevgep2223.i.21 = bitcast i32* %scevgep22.i.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.21, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.22 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %30, i64 %40
  %scevgep2223.i.22 = bitcast i32* %scevgep22.i.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.22, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.23 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %31, i64 %40
  %scevgep2223.i.23 = bitcast i32* %scevgep22.i.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.23, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.24 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %32, i64 %40
  %scevgep2223.i.24 = bitcast i32* %scevgep22.i.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.24, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.25 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %33, i64 %40
  %scevgep2223.i.25 = bitcast i32* %scevgep22.i.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.25, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.26 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %34, i64 %40
  %scevgep2223.i.26 = bitcast i32* %scevgep22.i.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.26, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.27 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %35, i64 %40
  %scevgep2223.i.27 = bitcast i32* %scevgep22.i.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.27, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.28 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %36, i64 %40
  %scevgep2223.i.28 = bitcast i32* %scevgep22.i.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.28, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.29 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %37, i64 %40
  %scevgep2223.i.29 = bitcast i32* %scevgep22.i.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.29, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.30 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %38, i64 %40
  %scevgep2223.i.30 = bitcast i32* %scevgep22.i.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.30, i8 0, i64 128, i32 16, i1 false) #7
  %scevgep22.i.31 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %39, i64 %40
  %scevgep2223.i.31 = bitcast i32* %scevgep22.i.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.i.31, i8 0, i64 128, i32 16, i1 false) #7
  %polly.indvar_next6.i = add nuw nsw i64 %polly.indvar5.i, 1
  %exitcond21.i = icmp eq i64 %polly.indvar_next6.i, 16
  br i1 %exitcond21.i, label %polly.loop_exit4.i, label %polly.loop_preheader9.i

mat_mult_polly_subfn.exit.loopexit:               ; preds = %polly.par.checkNext.loopexit.i
  br label %mat_mult_polly_subfn.exit

mat_mult_polly_subfn.exit:                        ; preds = %mat_mult_polly_subfn.exit.loopexit, %entry
  call void @GOMP_loop_end_nowait() #7
  call void @llvm.lifetime.end(i64 8, i8* %1)
  call void @llvm.lifetime.end(i64 8, i8* %2)
  call void @GOMP_parallel_end() #7
  call void @llvm.lifetime.end(i64 8, i8* %0)
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn_2, i8* %0, i32 0, i64 0, i64 16, i64 1) #7
  call void @mat_mult_polly_subfn_2(i8* %0) #7
  call void @GOMP_parallel_end() #7
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !58
}

; Function Attrs: nounwind uwtable
define i32 @main() #4 !dbg !18 {
entry:
  tail call void @init(), !dbg !59
  tail call void @mat_mult(), !dbg !60
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 512, i32 512), !dbg !61
  %0 = load i32, i32* getelementptr inbounds ([512 x [512 x i32]], [512 x [512 x i32]]* @A, i64 0, i64 511, i64 511), align 4, !dbg !62, !tbaa !52
  %1 = load i32, i32* getelementptr inbounds ([512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 511, i64 511), align 4, !dbg !63, !tbaa !52
  %2 = load i32, i32* getelementptr inbounds ([512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 511, i64 511), align 4, !dbg !64, !tbaa !52
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 511, i32 511, i32 %0, i32 511, i32 511, i32 %1, i32 511, i32 511, i32 %2), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

define internal void @init_polly_subfn(i8* nocapture readnone %polly.par.userContext) #6 {
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

polly.loop_exit4:                                 ; preds = %polly.loop_exit10
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  %indvar.next = add i64 %indvar, 1
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_exit10:                                ; preds = %polly.loop_exit16
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond23 = icmp eq i64 %polly.indvar_next6, 16
  br i1 %exitcond23, label %polly.loop_exit4, label %polly.loop_preheader9

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %indvar = phi i64 [ 0, %polly.par.loadIVBounds ], [ %indvar.next, %polly.loop_exit4 ]
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = add i64 %polly.par.LB, %indvar
  %5 = shl i64 %4, 5
  %6 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader9

polly.loop_exit16:                                ; preds = %polly.loop_header14
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond22 = icmp eq i64 %polly.indvar_next12, 32
  br i1 %exitcond22, label %polly.loop_exit10, label %polly.loop_preheader15

polly.loop_preheader9:                            ; preds = %polly.loop_exit10, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_exit10 ]
  %7 = shl i64 %polly.indvar5, 5
  br label %polly.loop_preheader15

polly.loop_header14:                              ; preds = %polly.loop_header14, %polly.loop_preheader15
  %polly.indvar17 = phi i64 [ 0, %polly.loop_preheader15 ], [ %polly.indvar_next18.1, %polly.loop_header14 ]
  %8 = add nuw nsw i64 %polly.indvar17, %7
  %scevgep = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @R, i64 0, i64 %11, i64 %8
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !67, !noalias !69, !llvm.mem.parallel_loop_access !72
  %p_sub = sub nsw i32 100, %_p_scalar_, !dbg !73
  %scevgep21 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 %11, i64 %8
  store i32 %p_sub, i32* %scevgep21, align 8, !alias.scope !70, !noalias !80, !llvm.mem.parallel_loop_access !72
  %polly.indvar_next18 = or i64 %polly.indvar17, 1
  %9 = add nuw nsw i64 %polly.indvar_next18, %7
  %scevgep.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @R, i64 0, i64 %11, i64 %9
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !67, !noalias !69, !llvm.mem.parallel_loop_access !72
  %p_sub.1 = sub nsw i32 100, %_p_scalar_.1, !dbg !73
  %scevgep21.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 %11, i64 %9
  store i32 %p_sub.1, i32* %scevgep21.1, align 4, !alias.scope !70, !noalias !80, !llvm.mem.parallel_loop_access !72
  %polly.indvar_next18.1 = add nsw i64 %polly.indvar17, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next18.1, 32
  br i1 %exitcond.1, label %polly.loop_exit16, label %polly.loop_header14, !llvm.loop !72

polly.loop_preheader15:                           ; preds = %polly.loop_exit16, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.loop_exit16 ]
  %10 = add i64 %5, %polly.indvar11
  %scevgep24 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @A, i64 0, i64 %10, i64 %7
  %scevgep2425 = bitcast i32* %scevgep24 to i8*
  %scevgep26 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @R, i64 0, i64 %10, i64 %7
  %scevgep2627 = bitcast i32* %scevgep26 to i8*
  %11 = add nsw i64 %polly.indvar11, %6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep2425, i8* %scevgep2627, i64 128, i32 16, i1 false)
  br label %polly.loop_header14
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @mat_mult_polly_subfn(i8* nocapture readnone %polly.par.userContext) #6 {
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

polly.loop_exit4:                                 ; preds = %polly.loop_preheader15
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  %indvar.next = add i64 %indvar, 1
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %indvar = phi i64 [ 0, %polly.par.loadIVBounds ], [ %indvar.next, %polly.loop_exit4 ]
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = add i64 %polly.par.LB, %indvar
  %5 = shl i64 %4, 5
  %6 = or i64 %5, 1
  %7 = or i64 %5, 2
  %8 = or i64 %5, 3
  %9 = or i64 %5, 4
  %10 = or i64 %5, 5
  %11 = or i64 %5, 6
  %12 = or i64 %5, 7
  %13 = or i64 %5, 8
  %14 = or i64 %5, 9
  %15 = or i64 %5, 10
  %16 = or i64 %5, 11
  %17 = or i64 %5, 12
  %18 = or i64 %5, 13
  %19 = or i64 %5, 14
  %20 = or i64 %5, 15
  %21 = or i64 %5, 16
  %22 = or i64 %5, 17
  %23 = or i64 %5, 18
  %24 = or i64 %5, 19
  %25 = or i64 %5, 20
  %26 = or i64 %5, 21
  %27 = or i64 %5, 22
  %28 = or i64 %5, 23
  %29 = or i64 %5, 24
  %30 = or i64 %5, 25
  %31 = or i64 %5, 26
  %32 = or i64 %5, 27
  %33 = or i64 %5, 28
  %34 = or i64 %5, 29
  %35 = or i64 %5, 30
  %36 = or i64 %5, 31
  br label %polly.loop_preheader9

polly.loop_preheader9:                            ; preds = %polly.loop_preheader15, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_preheader15 ]
  %37 = shl i64 %polly.indvar5, 5
  br label %polly.loop_preheader15

polly.loop_preheader15:                           ; preds = %polly.loop_preheader9
  %scevgep22 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %5, i64 %37
  %scevgep2223 = bitcast i32* %scevgep22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %6, i64 %37
  %scevgep2223.1 = bitcast i32* %scevgep22.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.1, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.2 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %7, i64 %37
  %scevgep2223.2 = bitcast i32* %scevgep22.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.2, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.3 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %8, i64 %37
  %scevgep2223.3 = bitcast i32* %scevgep22.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.3, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.4 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %9, i64 %37
  %scevgep2223.4 = bitcast i32* %scevgep22.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.4, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.5 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %10, i64 %37
  %scevgep2223.5 = bitcast i32* %scevgep22.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.5, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.6 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %11, i64 %37
  %scevgep2223.6 = bitcast i32* %scevgep22.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.6, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.7 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %12, i64 %37
  %scevgep2223.7 = bitcast i32* %scevgep22.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.7, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.8 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %13, i64 %37
  %scevgep2223.8 = bitcast i32* %scevgep22.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.8, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.9 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %14, i64 %37
  %scevgep2223.9 = bitcast i32* %scevgep22.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.9, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.10 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %15, i64 %37
  %scevgep2223.10 = bitcast i32* %scevgep22.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.10, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.11 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %16, i64 %37
  %scevgep2223.11 = bitcast i32* %scevgep22.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.11, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.12 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %17, i64 %37
  %scevgep2223.12 = bitcast i32* %scevgep22.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.12, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.13 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %18, i64 %37
  %scevgep2223.13 = bitcast i32* %scevgep22.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.13, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.14 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %19, i64 %37
  %scevgep2223.14 = bitcast i32* %scevgep22.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.14, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.15 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %20, i64 %37
  %scevgep2223.15 = bitcast i32* %scevgep22.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.15, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.16 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %21, i64 %37
  %scevgep2223.16 = bitcast i32* %scevgep22.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.16, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.17 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %22, i64 %37
  %scevgep2223.17 = bitcast i32* %scevgep22.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.17, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.18 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %23, i64 %37
  %scevgep2223.18 = bitcast i32* %scevgep22.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.18, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.19 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %24, i64 %37
  %scevgep2223.19 = bitcast i32* %scevgep22.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.19, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.20 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %25, i64 %37
  %scevgep2223.20 = bitcast i32* %scevgep22.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.20, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.21 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %26, i64 %37
  %scevgep2223.21 = bitcast i32* %scevgep22.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.21, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.22 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %27, i64 %37
  %scevgep2223.22 = bitcast i32* %scevgep22.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.22, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.23 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %28, i64 %37
  %scevgep2223.23 = bitcast i32* %scevgep22.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.23, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.24 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %29, i64 %37
  %scevgep2223.24 = bitcast i32* %scevgep22.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.24, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.25 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %30, i64 %37
  %scevgep2223.25 = bitcast i32* %scevgep22.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.25, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.26 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %31, i64 %37
  %scevgep2223.26 = bitcast i32* %scevgep22.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.26, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.27 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %32, i64 %37
  %scevgep2223.27 = bitcast i32* %scevgep22.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.27, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.28 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %33, i64 %37
  %scevgep2223.28 = bitcast i32* %scevgep22.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.28, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.29 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %34, i64 %37
  %scevgep2223.29 = bitcast i32* %scevgep22.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.29, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.30 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %35, i64 %37
  %scevgep2223.30 = bitcast i32* %scevgep22.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.30, i8 0, i64 128, i32 16, i1 false)
  %scevgep22.31 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %36, i64 %37
  %scevgep2223.31 = bitcast i32* %scevgep22.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep2223.31, i8 0, i64 128, i32 16, i1 false)
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond21 = icmp eq i64 %polly.indvar_next6, 16
  br i1 %exitcond21, label %polly.loop_exit4, label %polly.loop_preheader9
}

define internal void @mat_mult_polly_subfn_2(i8* nocapture readnone %polly.par.userContext) #6 {
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

polly.loop_exit4:                                 ; preds = %polly.loop_exit10
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_exit10:                                ; preds = %polly.loop_exit16
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond39 = icmp eq i64 %polly.indvar_next6, 16
  br i1 %exitcond39, label %polly.loop_exit4, label %polly.loop_preheader9

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader9

polly.loop_exit16:                                ; preds = %polly.loop_exit22
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond38 = icmp eq i64 %polly.indvar_next12, 16
  br i1 %exitcond38, label %polly.loop_exit10, label %polly.loop_preheader15

polly.loop_preheader9:                            ; preds = %polly.loop_exit10, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_exit10 ]
  %5 = shl nsw i64 %polly.indvar5, 5
  br label %polly.loop_preheader15

polly.loop_exit22:                                ; preds = %polly.loop_exit28
  %polly.indvar_next18 = add nuw nsw i64 %polly.indvar17, 1
  %exitcond37 = icmp eq i64 %polly.indvar_next18, 32
  br i1 %exitcond37, label %polly.loop_exit16, label %polly.loop_preheader21

polly.loop_preheader15:                           ; preds = %polly.loop_exit16, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.loop_exit16 ]
  %6 = shl nsw i64 %polly.indvar11, 5
  br label %polly.loop_preheader21

polly.loop_exit28:                                ; preds = %polly.loop_header26
  %p_add.1.lcssa = phi i32 [ %p_add.1, %polly.loop_header26 ]
  store i32 %p_add.1.lcssa, i32* %scevgep, align 4, !alias.scope !81, !noalias !83
  %polly.indvar_next24 = add nuw nsw i64 %polly.indvar23, 1
  %exitcond36 = icmp eq i64 %polly.indvar_next24, 32
  br i1 %exitcond36, label %polly.loop_exit22, label %polly.loop_preheader27

polly.loop_preheader21:                           ; preds = %polly.loop_exit22, %polly.loop_preheader15
  %polly.indvar17 = phi i64 [ 0, %polly.loop_preheader15 ], [ %polly.indvar_next18, %polly.loop_exit22 ]
  %7 = add nsw i64 %polly.indvar17, %4
  br label %polly.loop_preheader27

polly.loop_header26:                              ; preds = %polly.loop_header26, %polly.loop_preheader27
  %p_add40 = phi i32 [ %scevgep.promoted, %polly.loop_preheader27 ], [ %p_add.1, %polly.loop_header26 ]
  %polly.indvar29 = phi i64 [ 0, %polly.loop_preheader27 ], [ %polly.indvar_next30.1, %polly.loop_header26 ]
  %8 = add nuw nsw i64 %polly.indvar29, %6
  %scevgep32 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @A, i64 0, i64 %7, i64 %8
  %_p_scalar_33 = load i32, i32* %scevgep32, align 8, !alias.scope !85, !noalias !86
  %scevgep34 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 %8, i64 %10
  %_p_scalar_35 = load i32, i32* %scevgep34, align 4, !alias.scope !84, !noalias !87
  %p_mul = mul nsw i32 %_p_scalar_35, %_p_scalar_33, !dbg !88
  %p_add = add nsw i32 %p_mul, %p_add40, !dbg !97
  %polly.indvar_next30 = or i64 %polly.indvar29, 1
  %9 = add nuw nsw i64 %polly.indvar_next30, %6
  %scevgep32.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @A, i64 0, i64 %7, i64 %9
  %_p_scalar_33.1 = load i32, i32* %scevgep32.1, align 4, !alias.scope !85, !noalias !86
  %scevgep34.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @B, i64 0, i64 %9, i64 %10
  %_p_scalar_35.1 = load i32, i32* %scevgep34.1, align 4, !alias.scope !84, !noalias !87
  %p_mul.1 = mul nsw i32 %_p_scalar_35.1, %_p_scalar_33.1, !dbg !88
  %p_add.1 = add nsw i32 %p_mul.1, %p_add, !dbg !97
  %polly.indvar_next30.1 = add nsw i64 %polly.indvar29, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next30.1, 32
  br i1 %exitcond.1, label %polly.loop_exit28, label %polly.loop_header26

polly.loop_preheader27:                           ; preds = %polly.loop_exit28, %polly.loop_preheader21
  %polly.indvar23 = phi i64 [ 0, %polly.loop_preheader21 ], [ %polly.indvar_next24, %polly.loop_exit28 ]
  %10 = add nuw nsw i64 %polly.indvar23, %5
  %scevgep = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @C, i64 0, i64 %7, i64 %10
  %scevgep.promoted = load i32, i32* %scevgep, align 4, !alias.scope !81, !noalias !83
  br label %polly.loop_header26
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { "polly.skip.fn" }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!29, !30}
!llvm.ident = !{!31}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !21)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !13, !18}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 9, type: !7, isLocal: false, isDefinition: true, scopeLine: 9, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 10, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 11, type: !11)
!13 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 30, type: !7, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: true, variables: !14)
!14 = !{!15, !16, !17}
!15 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 31, type: !11)
!16 = !DILocalVariable(name: "j", scope: !13, file: !1, line: 31, type: !11)
!17 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 31, type: !11)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 55, type: !19, isLocal: false, isDefinition: true, scopeLine: 56, isOptimized: true, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!11}
!21 = !{!22, !26, !27, !28}
!22 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !23, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @A)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 8388608, align: 32, elements: !24)
!24 = !{!25, !25}
!25 = !DISubrange(count: 512)
!26 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !23, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @B)
!27 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !23, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @C)
!28 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 6, type: !23, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @R)
!29 = !{i32 2, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!32 = !DILocation(line: 14, column: 22, scope: !6)
!33 = !DILocation(line: 14, column: 11, scope: !6)
!34 = !DILocation(line: 14, column: 5, scope: !35)
!35 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!36 = !DIExpression()
!37 = !DILocation(line: 10, column: 9, scope: !6)
!38 = !DILocation(line: 15, column: 5, scope: !39)
!39 = !DILexicalBlockFile(scope: !40, file: !1, discriminator: 1)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 15, column: 5)
!41 = distinct !DILexicalBlock(scope: !6, file: !1, line: 15, column: 5)
!42 = !DILocation(line: 16, column: 9, scope: !43)
!43 = !DILexicalBlockFile(scope: !44, file: !1, discriminator: 1)
!44 = distinct !DILexicalBlock(scope: !45, file: !1, line: 16, column: 9)
!45 = distinct !DILexicalBlock(scope: !46, file: !1, line: 16, column: 9)
!46 = distinct !DILexicalBlock(scope: !40, file: !1, line: 15, column: 25)
!47 = !DILocation(line: 18, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 16, column: 29)
!49 = !DILocation(line: 18, column: 29, scope: !48)
!50 = !DILocation(line: 18, column: 13, scope: !48)
!51 = !DILocation(line: 18, column: 21, scope: !48)
!52 = !{!53, !53, i64 0}
!53 = !{!"int", !54, i64 0}
!54 = !{!"omnipotent char", !55, i64 0}
!55 = !{!"Simple C/C++ TBAA"}
!56 = !DILocation(line: 28, column: 1, scope: !6)
!57 = !DILocation(line: 31, column: 9, scope: !13)
!58 = !DILocation(line: 40, column: 1, scope: !13)
!59 = !DILocation(line: 57, column: 5, scope: !18)
!60 = !DILocation(line: 58, column: 5, scope: !18)
!61 = !DILocation(line: 60, column: 5, scope: !18)
!62 = !DILocation(line: 62, column: 19, scope: !18)
!63 = !DILocation(line: 63, column: 19, scope: !18)
!64 = !DILocation(line: 64, column: 19, scope: !18)
!65 = !DILocation(line: 61, column: 5, scope: !18)
!66 = !DILocation(line: 65, column: 5, scope: !18)
!67 = distinct !{!67, !68, !"polly.alias.scope.R"}
!68 = distinct !{!68, !"polly.alias.scope.domain"}
!69 = !{!70, !71}
!70 = distinct !{!70, !68, !"polly.alias.scope.B"}
!71 = distinct !{!71, !68, !"polly.alias.scope.A"}
!72 = distinct !{!72}
!73 = !DILocation(line: 25, column: 27, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 23, column: 29)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 23, column: 9)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 23, column: 9)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 22, column: 25)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 22, column: 5)
!79 = distinct !DILexicalBlock(scope: !6, file: !1, line: 22, column: 5)
!80 = !{!67, !71}
!81 = distinct !{!81, !82, !"polly.alias.scope.C"}
!82 = distinct !{!82, !"polly.alias.scope.domain"}
!83 = !{!84, !85}
!84 = distinct !{!84, !82, !"polly.alias.scope.B"}
!85 = distinct !{!85, !82, !"polly.alias.scope.A"}
!86 = !{!84, !81}
!87 = !{!81, !85}
!88 = !DILocation(line: 36, column: 45, scope: !89)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 35, column: 13)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 35, column: 13)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 33, column: 29)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 33, column: 9)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 33, column: 9)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 32, column: 25)
!95 = distinct !DILexicalBlock(scope: !96, file: !1, line: 32, column: 5)
!96 = distinct !DILexicalBlock(scope: !13, file: !1, line: 32, column: 5)
!97 = !DILocation(line: 36, column: 35, scope: !89)
