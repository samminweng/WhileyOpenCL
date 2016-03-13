; ModuleID = 'MatrixAdd.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@B = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@C = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[%d][%d] =%d) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init() #0 !dbg !6 {
entry:
  %t = alloca i64, align 8
  %0 = bitcast i64* %t to i8*, !dbg !52
  call void @llvm.lifetime.start(i64 8, i8* %0) #6, !dbg !52
  tail call void @llvm.dbg.value(metadata i64* %t, i64 0, metadata !13, metadata !53), !dbg !54
  %call = call i64 @time(i64* nonnull %t) #6, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #6, !dbg !57
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !59), !dbg !60
  br label %for.cond2.preheader, !dbg !61

for.cond2.preheader:                              ; preds = %for.inc22, %entry
  %indvars.iv41 = phi i64 [ 0, %entry ], [ %indvars.iv.next42, %for.inc22 ]
  br label %for.body5, !dbg !63

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.body5 ]
  %call6 = call i32 @rand() #6, !dbg !65
  %rem = srem i32 %call6, 100, !dbg !67
  call void @llvm.dbg.value(metadata i32 %rem, i64 0, metadata !19, metadata !59), !dbg !68
  %arrayidx8 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %indvars.iv41, i64 %indvars.iv, !dbg !69
  %1 = load i32, i32* %arrayidx8, align 4, !dbg !69, !tbaa !70
  %add = add nsw i32 %1, %rem, !dbg !74
  store i32 %add, i32* %arrayidx8, align 4, !dbg !75, !tbaa !70
  %arrayidx16 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %indvars.iv41, i64 %indvars.iv, !dbg !76
  %2 = load i32, i32* %arrayidx16, align 4, !dbg !76, !tbaa !70
  %add17 = sub nsw i32 100, %rem, !dbg !77
  %sub = add i32 %add17, %2, !dbg !78
  store i32 %sub, i32* %arrayidx16, align 4, !dbg !79, !tbaa !70
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !63
  %exitcond = icmp eq i64 %indvars.iv.next, 10240, !dbg !63
  br i1 %exitcond, label %for.inc22, label %for.body5, !dbg !63

for.inc22:                                        ; preds = %for.body5
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1, !dbg !61
  %exitcond43 = icmp eq i64 %indvars.iv.next42, 10240, !dbg !61
  br i1 %exitcond43, label %for.end24, label %for.cond2.preheader, !dbg !61

for.end24:                                        ; preds = %for.inc22
  call void @llvm.lifetime.end(i64 8, i8* %0) #6, !dbg !80
  ret void, !dbg !80
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
define void @mat_add() #3 !dbg !26 {
entry:
  %polly.par.userContext = alloca {}, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !28, metadata !59), !dbg !81
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_add_polly_subfn, i8* %0, i32 0, i64 0, i64 320, i64 1) #6
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
  %exitcond24.i = icmp eq i64 %polly.indvar_next6.i, 320
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
  %scevgep.i = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %11, i64 %9
  %_p_scalar_.i = load i32, i32* %scevgep.i, align 8, !alias.scope !82, !noalias !84, !llvm.mem.parallel_loop_access !87
  %scevgep20.i = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %11, i64 %9
  %_p_scalar_21.i = load i32, i32* %scevgep20.i, align 8, !alias.scope !85, !noalias !88, !llvm.mem.parallel_loop_access !87
  %p_add.i = add nsw i32 %_p_scalar_21.i, %_p_scalar_.i, !dbg !89
  %scevgep22.i = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %11, i64 %9
  store i32 %p_add.i, i32* %scevgep22.i, align 8, !alias.scope !86, !noalias !96, !llvm.mem.parallel_loop_access !87
  %polly.indvar_next18.i = or i64 %polly.indvar17.i, 1
  %10 = add nuw nsw i64 %polly.indvar_next18.i, %8
  %scevgep.i.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %11, i64 %10
  %_p_scalar_.i.1 = load i32, i32* %scevgep.i.1, align 4, !alias.scope !82, !noalias !84, !llvm.mem.parallel_loop_access !87
  %scevgep20.i.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %11, i64 %10
  %_p_scalar_21.i.1 = load i32, i32* %scevgep20.i.1, align 4, !alias.scope !85, !noalias !88, !llvm.mem.parallel_loop_access !87
  %p_add.i.1 = add nsw i32 %_p_scalar_21.i.1, %_p_scalar_.i.1, !dbg !89
  %scevgep22.i.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %11, i64 %10
  store i32 %p_add.i.1, i32* %scevgep22.i.1, align 4, !alias.scope !86, !noalias !96, !llvm.mem.parallel_loop_access !87
  %polly.indvar_next18.i.1 = add nsw i64 %polly.indvar17.i, 2
  %exitcond.i.1 = icmp eq i64 %polly.indvar_next18.i.1, 32
  br i1 %exitcond.i.1, label %polly.loop_exit16.i, label %polly.loop_header14.i, !llvm.loop !87

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
  ret void, !dbg !97
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !31 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !59), !dbg !98
  br label %for.cond1.preheader, !dbg !99

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv22 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.end ]
  br label %for.body3, !dbg !103

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %arrayidx5 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %indvars.iv22, i64 %indvars.iv, !dbg !108
  %0 = load i32, i32* %arrayidx5, align 4, !dbg !108, !tbaa !70
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !110
  %1 = trunc i64 %indvars.iv to i32, !dbg !111
  %rem = srem i32 %1, 80, !dbg !111
  %cmp6 = icmp eq i32 %rem, 79, !dbg !113
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !114

if.then:                                          ; preds = %for.body3
  %putchar19 = tail call i32 @putchar(i32 10) #6, !dbg !115
  br label %for.inc, !dbg !115

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !103
  %exitcond = icmp eq i64 %indvars.iv.next, 10240, !dbg !103
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !103

for.end:                                          ; preds = %for.inc
  %putchar = tail call i32 @putchar(i32 10) #6, !dbg !117
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1, !dbg !99
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 10240, !dbg !99
  br i1 %exitcond24, label %for.end11, label %for.cond1.preheader, !dbg !99

for.end11:                                        ; preds = %for.end
  ret void, !dbg !118
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %t.i = alloca i64, align 8
  %0 = bitcast i64* %t.i to i8*, !dbg !119
  call void @llvm.lifetime.start(i64 8, i8* %0) #6, !dbg !119
  tail call void @llvm.dbg.value(metadata i64* %t.i, i64 0, metadata !13, metadata !53) #6, !dbg !121
  %call.i = call i64 @time(i64* nonnull %t.i) #6, !dbg !122
  %conv.i = trunc i64 %call.i to i32, !dbg !123
  call void @srand(i32 %conv.i) #6, !dbg !124
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !59) #6, !dbg !125
  br label %for.cond2.preheader.i, !dbg !126

for.cond2.preheader.i:                            ; preds = %for.inc22.i, %entry
  %indvars.iv41.i = phi i64 [ 0, %entry ], [ %indvars.iv.next42.i, %for.inc22.i ], !dbg !127
  br label %for.body5.i, !dbg !128

for.body5.i:                                      ; preds = %for.body5.i, %for.cond2.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond2.preheader.i ], [ %indvars.iv.next.i, %for.body5.i ], !dbg !127
  %call6.i = call i32 @rand() #6, !dbg !129
  %rem.i = srem i32 %call6.i, 100, !dbg !130
  call void @llvm.dbg.value(metadata i32 %rem.i, i64 0, metadata !19, metadata !59) #6, !dbg !131
  %arrayidx8.i = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %indvars.iv41.i, i64 %indvars.iv.i, !dbg !132
  %1 = load i32, i32* %arrayidx8.i, align 4, !dbg !132, !tbaa !70
  %add.i = add nsw i32 %1, %rem.i, !dbg !133
  store i32 %add.i, i32* %arrayidx8.i, align 4, !dbg !134, !tbaa !70
  %arrayidx16.i = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %indvars.iv41.i, i64 %indvars.iv.i, !dbg !135
  %2 = load i32, i32* %arrayidx16.i, align 4, !dbg !135, !tbaa !70
  %add17.i = sub nsw i32 100, %rem.i, !dbg !136
  %sub.i = add i32 %add17.i, %2, !dbg !137
  store i32 %sub.i, i32* %arrayidx16.i, align 4, !dbg !138, !tbaa !70
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !128
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, 10240, !dbg !128
  br i1 %exitcond.i, label %for.inc22.i, label %for.body5.i, !dbg !128

for.inc22.i:                                      ; preds = %for.body5.i
  %indvars.iv.next42.i = add nuw nsw i64 %indvars.iv41.i, 1, !dbg !126
  %exitcond43.i = icmp eq i64 %indvars.iv.next42.i, 10240, !dbg !126
  br i1 %exitcond43.i, label %init.exit, label %for.cond2.preheader.i, !dbg !126

init.exit:                                        ; preds = %for.inc22.i
  call void @llvm.lifetime.end(i64 8, i8* %0) #6, !dbg !139
  tail call void @mat_add(), !dbg !140
  %3 = load i32, i32* getelementptr inbounds ([10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 10239, i64 10239), align 4, !dbg !141, !tbaa !70
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 10240, i32 10240, i32 10239, i32 10239, i32 %3), !dbg !142
  ret i32 0, !dbg !143
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

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
  %exitcond24 = icmp eq i64 %polly.indvar_next6, 320
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
  %scevgep = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %8, i64 %6
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !144, !noalias !146, !llvm.mem.parallel_loop_access !87
  %scevgep20 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %8, i64 %6
  %_p_scalar_21 = load i32, i32* %scevgep20, align 8, !alias.scope !147, !noalias !149, !llvm.mem.parallel_loop_access !87
  %p_add = add nsw i32 %_p_scalar_21, %_p_scalar_, !dbg !89
  %scevgep22 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %8, i64 %6
  store i32 %p_add, i32* %scevgep22, align 8, !alias.scope !148, !noalias !150, !llvm.mem.parallel_loop_access !87
  %polly.indvar_next18 = or i64 %polly.indvar17, 1
  %7 = add nuw nsw i64 %polly.indvar_next18, %5
  %scevgep.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %8, i64 %7
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !144, !noalias !146, !llvm.mem.parallel_loop_access !87
  %scevgep20.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %8, i64 %7
  %_p_scalar_21.1 = load i32, i32* %scevgep20.1, align 4, !alias.scope !147, !noalias !149, !llvm.mem.parallel_loop_access !87
  %p_add.1 = add nsw i32 %_p_scalar_21.1, %_p_scalar_.1, !dbg !89
  %scevgep22.1 = getelementptr [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %8, i64 %7
  store i32 %p_add.1, i32* %scevgep22.1, align 4, !alias.scope !148, !noalias !150, !llvm.mem.parallel_loop_access !87
  %polly.indvar_next18.1 = add nsw i64 %polly.indvar17, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next18.1, 32
  br i1 %exitcond.1, label %polly.loop_exit16, label %polly.loop_header14, !llvm.loop !87

polly.loop_preheader15:                           ; preds = %polly.loop_exit16, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.loop_exit16 ]
  %8 = add nsw i64 %polly.indvar11, %4
  br label %polly.loop_header14
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

declare i32 @putchar(i32)

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { "polly.skip.fn" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!49, !50}
!llvm.ident = !{!51}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !42)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !26, !31, !35}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 7, type: !7, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12, !13, !19}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 9, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 10, type: !11)
!13 = !DILocalVariable(name: "t", scope: !6, file: !1, line: 11, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !15, line: 75, baseType: !16)
!15 = !DIFile(filename: "/usr/include/time.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !17, line: 139, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!18 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "r", scope: !20, file: !1, line: 16, type: !11)
!20 = distinct !DILexicalBlock(scope: !21, file: !1, line: 15, column: 29)
!21 = distinct !DILexicalBlock(scope: !22, file: !1, line: 15, column: 9)
!22 = distinct !DILexicalBlock(scope: !23, file: !1, line: 15, column: 9)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 14, column: 25)
!24 = distinct !DILexicalBlock(scope: !25, file: !1, line: 14, column: 5)
!25 = distinct !DILexicalBlock(scope: !6, file: !1, line: 14, column: 5)
!26 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 23, type: !7, isLocal: false, isDefinition: true, scopeLine: 23, isOptimized: true, variables: !27)
!27 = !{!28, !29, !30}
!28 = !DILocalVariable(name: "i", scope: !26, file: !1, line: 24, type: !11)
!29 = !DILocalVariable(name: "j", scope: !26, file: !1, line: 24, type: !11)
!30 = !DILocalVariable(name: "k", scope: !26, file: !1, line: 24, type: !11)
!31 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 32, type: !7, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: true, variables: !32)
!32 = !{!33, !34}
!33 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 34, type: !11)
!34 = !DILocalVariable(name: "j", scope: !31, file: !1, line: 34, type: !11)
!35 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 45, type: !36, isLocal: false, isDefinition: true, scopeLine: 46, isOptimized: true, variables: !38)
!36 = !DISubroutineType(types: !37)
!37 = !{!11}
!38 = !{!39, !40, !41}
!39 = !DILocalVariable(name: "i", scope: !35, file: !1, line: 47, type: !11)
!40 = !DILocalVariable(name: "j", scope: !35, file: !1, line: 47, type: !11)
!41 = !DILocalVariable(name: "k", scope: !35, file: !1, line: 47, type: !11)
!42 = !{!43, !47, !48}
!43 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !44, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @A)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3355443200, align: 32, elements: !45)
!45 = !{!46, !46}
!46 = !DISubrange(count: 10240)
!47 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !44, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @B)
!48 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !44, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @C)
!49 = !{i32 2, !"Dwarf Version", i32 4}
!50 = !{i32 2, !"Debug Info Version", i32 3}
!51 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!52 = !DILocation(line: 11, column: 5, scope: !6)
!53 = !DIExpression(DW_OP_deref)
!54 = !DILocation(line: 11, column: 12, scope: !6)
!55 = !DILocation(line: 13, column: 22, scope: !6)
!56 = !DILocation(line: 13, column: 11, scope: !6)
!57 = !DILocation(line: 13, column: 5, scope: !58)
!58 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!59 = !DIExpression()
!60 = !DILocation(line: 9, column: 9, scope: !6)
!61 = !DILocation(line: 14, column: 5, scope: !62)
!62 = !DILexicalBlockFile(scope: !24, file: !1, discriminator: 1)
!63 = !DILocation(line: 15, column: 9, scope: !64)
!64 = !DILexicalBlockFile(scope: !21, file: !1, discriminator: 1)
!65 = !DILocation(line: 16, column: 21, scope: !66)
!66 = !DILexicalBlockFile(scope: !20, file: !1, discriminator: 1)
!67 = !DILocation(line: 16, column: 28, scope: !20)
!68 = !DILocation(line: 16, column: 17, scope: !20)
!69 = !DILocation(line: 17, column: 23, scope: !20)
!70 = !{!71, !71, i64 0}
!71 = !{!"int", !72, i64 0}
!72 = !{!"omnipotent char", !73, i64 0}
!73 = !{!"Simple C/C++ TBAA"}
!74 = !DILocation(line: 17, column: 31, scope: !20)
!75 = !DILocation(line: 17, column: 21, scope: !20)
!76 = !DILocation(line: 18, column: 23, scope: !20)
!77 = !DILocation(line: 18, column: 31, scope: !20)
!78 = !DILocation(line: 18, column: 37, scope: !20)
!79 = !DILocation(line: 18, column: 21, scope: !20)
!80 = !DILocation(line: 21, column: 1, scope: !6)
!81 = !DILocation(line: 24, column: 9, scope: !26)
!82 = distinct !{!82, !83, !"polly.alias.scope.A"}
!83 = distinct !{!83, !"polly.alias.scope.domain"}
!84 = !{!85, !86}
!85 = distinct !{!85, !83, !"polly.alias.scope.B"}
!86 = distinct !{!86, !83, !"polly.alias.scope.C"}
!87 = distinct !{!87}
!88 = !{!82, !86}
!89 = !DILocation(line: 27, column: 31, scope: !90)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 26, column: 29)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 26, column: 9)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 26, column: 9)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 25, column: 25)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 25, column: 5)
!95 = distinct !DILexicalBlock(scope: !26, file: !1, line: 25, column: 5)
!96 = !{!85, !82}
!97 = !DILocation(line: 30, column: 1, scope: !26)
!98 = !DILocation(line: 34, column: 9, scope: !31)
!99 = !DILocation(line: 36, column: 5, scope: !100)
!100 = !DILexicalBlockFile(scope: !101, file: !1, discriminator: 1)
!101 = distinct !DILexicalBlock(scope: !102, file: !1, line: 36, column: 5)
!102 = distinct !DILexicalBlock(scope: !31, file: !1, line: 36, column: 5)
!103 = !DILocation(line: 37, column: 9, scope: !104)
!104 = !DILexicalBlockFile(scope: !105, file: !1, discriminator: 1)
!105 = distinct !DILexicalBlock(scope: !106, file: !1, line: 37, column: 9)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 37, column: 9)
!107 = distinct !DILexicalBlock(scope: !101, file: !1, line: 36, column: 25)
!108 = !DILocation(line: 38, column: 27, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !1, line: 37, column: 29)
!110 = !DILocation(line: 38, column: 13, scope: !109)
!111 = !DILocation(line: 39, column: 18, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !1, line: 39, column: 17)
!113 = !DILocation(line: 39, column: 22, scope: !112)
!114 = !DILocation(line: 39, column: 17, scope: !109)
!115 = !DILocation(line: 39, column: 29, scope: !116)
!116 = !DILexicalBlockFile(scope: !112, file: !1, discriminator: 1)
!117 = !DILocation(line: 41, column: 9, scope: !107)
!118 = !DILocation(line: 43, column: 1, scope: !31)
!119 = !DILocation(line: 11, column: 5, scope: !6, inlinedAt: !120)
!120 = distinct !DILocation(line: 49, column: 5, scope: !35)
!121 = !DILocation(line: 11, column: 12, scope: !6, inlinedAt: !120)
!122 = !DILocation(line: 13, column: 22, scope: !6, inlinedAt: !120)
!123 = !DILocation(line: 13, column: 11, scope: !6, inlinedAt: !120)
!124 = !DILocation(line: 13, column: 5, scope: !58, inlinedAt: !120)
!125 = !DILocation(line: 9, column: 9, scope: !6, inlinedAt: !120)
!126 = !DILocation(line: 14, column: 5, scope: !62, inlinedAt: !120)
!127 = !DILocation(line: 49, column: 5, scope: !35)
!128 = !DILocation(line: 15, column: 9, scope: !64, inlinedAt: !120)
!129 = !DILocation(line: 16, column: 21, scope: !66, inlinedAt: !120)
!130 = !DILocation(line: 16, column: 28, scope: !20, inlinedAt: !120)
!131 = !DILocation(line: 16, column: 17, scope: !20, inlinedAt: !120)
!132 = !DILocation(line: 17, column: 23, scope: !20, inlinedAt: !120)
!133 = !DILocation(line: 17, column: 31, scope: !20, inlinedAt: !120)
!134 = !DILocation(line: 17, column: 21, scope: !20, inlinedAt: !120)
!135 = !DILocation(line: 18, column: 23, scope: !20, inlinedAt: !120)
!136 = !DILocation(line: 18, column: 31, scope: !20, inlinedAt: !120)
!137 = !DILocation(line: 18, column: 37, scope: !20, inlinedAt: !120)
!138 = !DILocation(line: 18, column: 21, scope: !20, inlinedAt: !120)
!139 = !DILocation(line: 21, column: 1, scope: !6, inlinedAt: !120)
!140 = !DILocation(line: 50, column: 5, scope: !35)
!141 = !DILocation(line: 52, column: 81, scope: !35)
!142 = !DILocation(line: 52, column: 5, scope: !35)
!143 = !DILocation(line: 53, column: 5, scope: !35)
!144 = distinct !{!144, !145, !"polly.alias.scope.A"}
!145 = distinct !{!145, !"polly.alias.scope.domain"}
!146 = !{!147, !148}
!147 = distinct !{!147, !145, !"polly.alias.scope.B"}
!148 = distinct !{!148, !145, !"polly.alias.scope.C"}
!149 = !{!144, !148}
!150 = !{!147, !144}
