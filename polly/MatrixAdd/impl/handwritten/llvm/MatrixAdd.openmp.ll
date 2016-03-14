; ModuleID = 'MatrixAdd.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@R = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@A = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@B = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@C = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.1 = private unnamed_addr constant [47 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !6 {
entry:
  %polly.par.userContext = alloca {}, align 8
  %call = tail call i64 @time(i64* null) #6, !dbg !36
  %conv = trunc i64 %call to i32, !dbg !37
  tail call void @srand(i32 %conv) #6, !dbg !38
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !40), !dbg !41
  br label %for.cond2.preheader, !dbg !42

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !46

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = tail call i32 @rand() #6, !dbg !51
  %rem = srem i32 %call6, 100, !dbg !53
  %arrayidx8 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !54
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !55, !tbaa !56
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !46
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 8000, !dbg !46
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !46

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !42
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 8000, !dbg !42
  br i1 %exitcond72, label %polly.parallel.for, label %for.cond2.preheader, !dbg !42

polly.parallel.for:                               ; preds = %for.inc9
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 250, i64 1) #6
  call void @init_polly_subfn(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !60
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
define void @mat_add() #0 !dbg !13 {
entry:
  %polly.par.userContext = alloca {}, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !40), !dbg !61
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_add_polly_subfn, i8* %0, i32 0, i64 0, i64 250, i64 1) #6
  %1 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %1)
  %2 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %2)
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #6
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %mat_add_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %entry
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_exit4.i
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #6
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %mat_add_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_preheader3.i

polly.loop_exit4.i:                               ; preds = %polly.loop_exit10.i
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_preheader3.i

polly.loop_exit10.i:                              ; preds = %polly.loop_exit16.i
  %polly.indvar_next6.i = add nuw nsw i64 %polly.indvar5.i, 1
  %exitcond24.i = icmp eq i64 %polly.indvar_next6.i, 250
  br i1 %exitcond24.i, label %polly.loop_exit4.i, label %polly.loop_preheader9.i

polly.loop_preheader3.i:                          ; preds = %polly.loop_exit4.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_exit4.i ]
  %7 = shl nsw i64 %polly.indvar.i, 5
  br label %polly.loop_preheader9.i

polly.loop_exit16.i:                              ; preds = %polly.loop_header14.i
  %polly.indvar_next12.i = add nuw nsw i64 %polly.indvar11.i, 1
  %exitcond23.i = icmp eq i64 %polly.indvar_next12.i, 32
  br i1 %exitcond23.i, label %polly.loop_exit10.i, label %polly.loop_preheader15.i

polly.loop_preheader9.i:                          ; preds = %polly.loop_preheader3.i, %polly.loop_exit10.i
  %polly.indvar5.i = phi i64 [ 0, %polly.loop_preheader3.i ], [ %polly.indvar_next6.i, %polly.loop_exit10.i ]
  %8 = shl nsw i64 %polly.indvar5.i, 5
  br label %polly.loop_preheader15.i

polly.loop_header14.i:                            ; preds = %polly.loop_header14.i, %polly.loop_preheader15.i
  %polly.indvar17.i = phi i64 [ 0, %polly.loop_preheader15.i ], [ %polly.indvar_next18.i.1, %polly.loop_header14.i ]
  %9 = add nuw nsw i64 %polly.indvar17.i, %8
  %scevgep.i = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %11, i64 %9
  %_p_scalar_.i = load i32, i32* %scevgep.i, align 8, !alias.scope !62, !noalias !64, !llvm.mem.parallel_loop_access !67
  %scevgep20.i = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %11, i64 %9
  %_p_scalar_21.i = load i32, i32* %scevgep20.i, align 8, !alias.scope !65, !noalias !68, !llvm.mem.parallel_loop_access !67
  %p_add.i = add nsw i32 %_p_scalar_21.i, %_p_scalar_.i, !dbg !69
  %scevgep22.i = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %11, i64 %9
  store i32 %p_add.i, i32* %scevgep22.i, align 8, !alias.scope !66, !noalias !76, !llvm.mem.parallel_loop_access !67
  %polly.indvar_next18.i = or i64 %polly.indvar17.i, 1
  %10 = add nuw nsw i64 %polly.indvar_next18.i, %8
  %scevgep.i.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %11, i64 %10
  %_p_scalar_.i.1 = load i32, i32* %scevgep.i.1, align 4, !alias.scope !62, !noalias !64, !llvm.mem.parallel_loop_access !67
  %scevgep20.i.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %11, i64 %10
  %_p_scalar_21.i.1 = load i32, i32* %scevgep20.i.1, align 4, !alias.scope !65, !noalias !68, !llvm.mem.parallel_loop_access !67
  %p_add.i.1 = add nsw i32 %_p_scalar_21.i.1, %_p_scalar_.i.1, !dbg !69
  %scevgep22.i.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %11, i64 %10
  store i32 %p_add.i.1, i32* %scevgep22.i.1, align 4, !alias.scope !66, !noalias !76, !llvm.mem.parallel_loop_access !67
  %polly.indvar_next18.i.1 = add nsw i64 %polly.indvar17.i, 2
  %exitcond.i.1 = icmp eq i64 %polly.indvar_next18.i.1, 32
  br i1 %exitcond.i.1, label %polly.loop_exit16.i, label %polly.loop_header14.i, !llvm.loop !67

polly.loop_preheader15.i:                         ; preds = %polly.loop_preheader9.i, %polly.loop_exit16.i
  %polly.indvar11.i = phi i64 [ 0, %polly.loop_preheader9.i ], [ %polly.indvar_next12.i, %polly.loop_exit16.i ]
  %11 = add nsw i64 %polly.indvar11.i, %7
  br label %polly.loop_header14.i

mat_add_polly_subfn.exit.loopexit:                ; preds = %polly.par.checkNext.loopexit.i
  br label %mat_add_polly_subfn.exit

mat_add_polly_subfn.exit:                         ; preds = %mat_add_polly_subfn.exit.loopexit, %entry
  call void @GOMP_loop_end_nowait() #6
  call void @llvm.lifetime.end(i64 8, i8* %1)
  call void @llvm.lifetime.end(i64 8, i8* %2)
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !77
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 !dbg !18 {
entry:
  tail call void @init(), !dbg !78
  tail call void @mat_add(), !dbg !79
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 8000, i32 8000), !dbg !80
  %0 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 7999, i64 7999), align 4, !dbg !81, !tbaa !56
  %1 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 7999, i64 7999), align 4, !dbg !82, !tbaa !56
  %2 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 7999, i64 7999), align 4, !dbg !83, !tbaa !56
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 7999, i32 7999, i32 %0, i32 7999, i32 7999, i32 %1, i32 7999, i32 7999, i32 %2), !dbg !84
  ret i32 0, !dbg !85
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

polly.loop_exit4:                                 ; preds = %polly.loop_exit10
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  %indvar.next = add i64 %indvar, 1
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_exit10:                                ; preds = %polly.loop_exit16
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond23 = icmp eq i64 %polly.indvar_next6, 250
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
  %scevgep = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %11, i64 %8
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !86, !noalias !88, !llvm.mem.parallel_loop_access !91
  %p_sub = sub nsw i32 100, %_p_scalar_, !dbg !92
  %scevgep21 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %11, i64 %8
  store i32 %p_sub, i32* %scevgep21, align 8, !alias.scope !90, !noalias !99, !llvm.mem.parallel_loop_access !91
  %polly.indvar_next18 = or i64 %polly.indvar17, 1
  %9 = add nuw nsw i64 %polly.indvar_next18, %7
  %scevgep.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %11, i64 %9
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !86, !noalias !88, !llvm.mem.parallel_loop_access !91
  %p_sub.1 = sub nsw i32 100, %_p_scalar_.1, !dbg !92
  %scevgep21.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %11, i64 %9
  store i32 %p_sub.1, i32* %scevgep21.1, align 4, !alias.scope !90, !noalias !99, !llvm.mem.parallel_loop_access !91
  %polly.indvar_next18.1 = add nsw i64 %polly.indvar17, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next18.1, 32
  br i1 %exitcond.1, label %polly.loop_exit16, label %polly.loop_header14, !llvm.loop !91

polly.loop_preheader15:                           ; preds = %polly.loop_exit16, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.loop_exit16 ]
  %10 = add i64 %5, %polly.indvar11
  %scevgep24 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %10, i64 %7
  %scevgep2425 = bitcast i32* %scevgep24 to i8*
  %scevgep26 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %10, i64 %7
  %scevgep2627 = bitcast i32* %scevgep26 to i8*
  %11 = add nsw i64 %polly.indvar11, %6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep2425, i8* %scevgep2627, i64 128, i32 16, i1 false)
  br label %polly.loop_header14
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @mat_add_polly_subfn(i8* nocapture readnone %polly.par.userContext) #5 {
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
  %exitcond24 = icmp eq i64 %polly.indvar_next6, 250
  br i1 %exitcond24, label %polly.loop_exit4, label %polly.loop_preheader9

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader9

polly.loop_exit16:                                ; preds = %polly.loop_header14
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond23 = icmp eq i64 %polly.indvar_next12, 32
  br i1 %exitcond23, label %polly.loop_exit10, label %polly.loop_preheader15

polly.loop_preheader9:                            ; preds = %polly.loop_exit10, %polly.loop_preheader3
  %polly.indvar5 = phi i64 [ 0, %polly.loop_preheader3 ], [ %polly.indvar_next6, %polly.loop_exit10 ]
  %5 = shl nsw i64 %polly.indvar5, 5
  br label %polly.loop_preheader15

polly.loop_header14:                              ; preds = %polly.loop_header14, %polly.loop_preheader15
  %polly.indvar17 = phi i64 [ 0, %polly.loop_preheader15 ], [ %polly.indvar_next18.1, %polly.loop_header14 ]
  %6 = add nuw nsw i64 %polly.indvar17, %5
  %scevgep = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %8, i64 %6
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !67
  %scevgep20 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %8, i64 %6
  %_p_scalar_21 = load i32, i32* %scevgep20, align 8, !alias.scope !103, !noalias !105, !llvm.mem.parallel_loop_access !67
  %p_add = add nsw i32 %_p_scalar_21, %_p_scalar_, !dbg !69
  %scevgep22 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %8, i64 %6
  store i32 %p_add, i32* %scevgep22, align 8, !alias.scope !104, !noalias !106, !llvm.mem.parallel_loop_access !67
  %polly.indvar_next18 = or i64 %polly.indvar17, 1
  %7 = add nuw nsw i64 %polly.indvar_next18, %5
  %scevgep.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %8, i64 %7
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !100, !noalias !102, !llvm.mem.parallel_loop_access !67
  %scevgep20.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %8, i64 %7
  %_p_scalar_21.1 = load i32, i32* %scevgep20.1, align 4, !alias.scope !103, !noalias !105, !llvm.mem.parallel_loop_access !67
  %p_add.1 = add nsw i32 %_p_scalar_21.1, %_p_scalar_.1, !dbg !69
  %scevgep22.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %8, i64 %7
  store i32 %p_add.1, i32* %scevgep22.1, align 4, !alias.scope !104, !noalias !106, !llvm.mem.parallel_loop_access !67
  %polly.indvar_next18.1 = add nsw i64 %polly.indvar17, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next18.1, 32
  br i1 %exitcond.1, label %polly.loop_exit16, label %polly.loop_header14, !llvm.loop !67

polly.loop_preheader15:                           ; preds = %polly.loop_exit16, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.loop_exit16 ]
  %8 = add nsw i64 %polly.indvar11, %4
  br label %polly.loop_header14
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { "polly.skip.fn" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!33, !34}
!llvm.ident = !{!35}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !25)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !13, !18}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 11, type: !7, isLocal: false, isDefinition: true, scopeLine: 11, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 12, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 13, type: !11)
!13 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 32, type: !7, isLocal: false, isDefinition: true, scopeLine: 32, isOptimized: true, variables: !14)
!14 = !{!15, !16, !17}
!15 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 34, type: !11)
!16 = !DILocalVariable(name: "j", scope: !13, file: !1, line: 34, type: !11)
!17 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 34, type: !11)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 55, type: !19, isLocal: false, isDefinition: true, scopeLine: 56, isOptimized: true, variables: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{!11}
!21 = !{!22, !23, !24}
!22 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 57, type: !11)
!23 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 57, type: !11)
!24 = !DILocalVariable(name: "k", scope: !18, file: !1, line: 57, type: !11)
!25 = !{!26, !30, !31, !32}
!26 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !27, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @A)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 2048000000, align: 32, elements: !28)
!28 = !{!29, !29}
!29 = !DISubrange(count: 8000)
!30 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !27, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @B)
!31 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !27, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @C)
!32 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 6, type: !27, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @R)
!33 = !{i32 2, !"Dwarf Version", i32 4}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!36 = !DILocation(line: 16, column: 22, scope: !6)
!37 = !DILocation(line: 16, column: 11, scope: !6)
!38 = !DILocation(line: 16, column: 5, scope: !39)
!39 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!40 = !DIExpression()
!41 = !DILocation(line: 12, column: 9, scope: !6)
!42 = !DILocation(line: 17, column: 5, scope: !43)
!43 = !DILexicalBlockFile(scope: !44, file: !1, discriminator: 1)
!44 = distinct !DILexicalBlock(scope: !45, file: !1, line: 17, column: 5)
!45 = distinct !DILexicalBlock(scope: !6, file: !1, line: 17, column: 5)
!46 = !DILocation(line: 18, column: 9, scope: !47)
!47 = !DILexicalBlockFile(scope: !48, file: !1, discriminator: 1)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 18, column: 9)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 18, column: 9)
!50 = distinct !DILexicalBlock(scope: !44, file: !1, line: 17, column: 25)
!51 = !DILocation(line: 20, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 18, column: 29)
!53 = !DILocation(line: 20, column: 29, scope: !52)
!54 = !DILocation(line: 20, column: 13, scope: !52)
!55 = !DILocation(line: 20, column: 21, scope: !52)
!56 = !{!57, !57, i64 0}
!57 = !{!"int", !58, i64 0}
!58 = !{!"omnipotent char", !59, i64 0}
!59 = !{!"Simple C/C++ TBAA"}
!60 = !DILocation(line: 30, column: 1, scope: !6)
!61 = !DILocation(line: 34, column: 9, scope: !13)
!62 = distinct !{!62, !63, !"polly.alias.scope.A"}
!63 = distinct !{!63, !"polly.alias.scope.domain"}
!64 = !{!65, !66}
!65 = distinct !{!65, !63, !"polly.alias.scope.B"}
!66 = distinct !{!66, !63, !"polly.alias.scope.C"}
!67 = distinct !{!67}
!68 = !{!62, !66}
!69 = !DILocation(line: 37, column: 31, scope: !70)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 36, column: 29)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 36, column: 9)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 36, column: 9)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 35, column: 25)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 35, column: 5)
!75 = distinct !DILexicalBlock(scope: !13, file: !1, line: 35, column: 5)
!76 = !{!62, !65}
!77 = !DILocation(line: 40, column: 1, scope: !13)
!78 = !DILocation(line: 59, column: 5, scope: !18)
!79 = !DILocation(line: 60, column: 5, scope: !18)
!80 = !DILocation(line: 62, column: 5, scope: !18)
!81 = !DILocation(line: 64, column: 19, scope: !18)
!82 = !DILocation(line: 65, column: 19, scope: !18)
!83 = !DILocation(line: 66, column: 19, scope: !18)
!84 = !DILocation(line: 63, column: 5, scope: !18)
!85 = !DILocation(line: 67, column: 5, scope: !18)
!86 = distinct !{!86, !87, !"polly.alias.scope.R"}
!87 = distinct !{!87, !"polly.alias.scope.domain"}
!88 = !{!89, !90}
!89 = distinct !{!89, !87, !"polly.alias.scope.A"}
!90 = distinct !{!90, !87, !"polly.alias.scope.B"}
!91 = distinct !{!91}
!92 = !DILocation(line: 27, column: 27, scope: !93)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 25, column: 29)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 25, column: 9)
!95 = distinct !DILexicalBlock(scope: !96, file: !1, line: 25, column: 9)
!96 = distinct !DILexicalBlock(scope: !97, file: !1, line: 24, column: 25)
!97 = distinct !DILexicalBlock(scope: !98, file: !1, line: 24, column: 5)
!98 = distinct !DILexicalBlock(scope: !6, file: !1, line: 24, column: 5)
!99 = !{!89, !86}
!100 = distinct !{!100, !101, !"polly.alias.scope.A"}
!101 = distinct !{!101, !"polly.alias.scope.domain"}
!102 = !{!103, !104}
!103 = distinct !{!103, !101, !"polly.alias.scope.B"}
!104 = distinct !{!104, !101, !"polly.alias.scope.C"}
!105 = !{!100, !104}
!106 = !{!100, !103}
