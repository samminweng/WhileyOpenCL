; ModuleID = 'BubbleSort_original.c'
source_filename = "BubbleSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define i64* @bubbleSort(i64* %items, i64 %items_size, i1 zeroext %items_dealloc) local_unnamed_addr #0 {
entry:
  %cmp76 = icmp slt i64 %items_size, 1
  br i1 %cmp76, label %if.end34, label %while.cond18.preheader.lr.ph

while.cond18.preheader.lr.ph:                     ; preds = %entry
  %scevgep79 = getelementptr i64, i64* %items, i64 1
  br label %while.cond18.preheader

while.cond.loopexit:                              ; preds = %polly.stmt.blklab4
  %cmp = icmp slt i64 %polly.last_swapped.1, 1
  br i1 %cmp, label %if.end34.loopexit, label %while.cond18.preheader

while.cond18.preheader:                           ; preds = %while.cond18.preheader.lr.ph, %while.cond.loopexit
  %length.077 = phi i64 [ %items_size, %while.cond18.preheader.lr.ph ], [ %polly.last_swapped.1, %while.cond.loopexit ]
  %cmp2073 = icmp sgt i64 %length.077, 1
  br i1 %cmp2073, label %polly.loop_header.preheader, label %if.end34.loopexit

polly.loop_header.preheader:                      ; preds = %while.cond18.preheader
  %0 = add i64 %length.077, -1
  br label %polly.loop_header

if.end34.loopexit:                                ; preds = %while.cond.loopexit, %while.cond18.preheader
  br label %if.end34

if.end34:                                         ; preds = %if.end34.loopexit, %entry
  ret i64* %items

polly.loop_header:                                ; preds = %polly.stmt.blklab4, %polly.loop_header.preheader
  %last_swapped.074.phiops.0 = phi i64 [ %polly.last_swapped.1, %polly.stmt.blklab4 ], [ 0, %polly.loop_header.preheader ]
  %polly.indvar = phi i64 [ %polly.indvar_next.pre-phi, %polly.stmt.blklab4 ], [ 0, %polly.loop_header.preheader ]
  %scevgep = getelementptr i64, i64* %items, i64 %polly.indvar
  %_p_scalar_ = load i64, i64* %scevgep, align 8, !alias.scope !1, !noalias !3
  %scevgep80 = getelementptr i64, i64* %scevgep79, i64 %polly.indvar
  %_p_scalar_81 = load i64, i64* %scevgep80, align 8, !alias.scope !1, !noalias !3
  %p_cmp24 = icmp sgt i64 %_p_scalar_, %_p_scalar_81
  br i1 %p_cmp24, label %polly.stmt.if.end26, label %polly.loop_header.polly.stmt.blklab4_crit_edge

polly.loop_header.polly.stmt.blklab4_crit_edge:   ; preds = %polly.loop_header
  %.pre = add nuw nsw i64 %polly.indvar, 1
  br label %polly.stmt.blklab4

polly.stmt.if.end26:                              ; preds = %polly.loop_header
  store i64 %_p_scalar_81, i64* %scevgep, align 8, !alias.scope !1, !noalias !3
  store i64 %_p_scalar_, i64* %scevgep80, align 8, !alias.scope !1, !noalias !3
  %1 = add nuw i64 %polly.indvar, 1
  br label %polly.stmt.blklab4

polly.stmt.blklab4:                               ; preds = %polly.loop_header.polly.stmt.blklab4_crit_edge, %polly.stmt.if.end26
  %polly.indvar_next.pre-phi = phi i64 [ %.pre, %polly.loop_header.polly.stmt.blklab4_crit_edge ], [ %1, %polly.stmt.if.end26 ]
  %polly.last_swapped.1 = phi i64 [ %last_swapped.074.phiops.0, %polly.loop_header.polly.stmt.blklab4_crit_edge ], [ %1, %polly.stmt.if.end26 ]
  %exitcond = icmp eq i64 %polly.indvar_next.pre-phi, %0
  br i1 %exitcond, label %while.cond.loopexit, label %polly.loop_header
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
entry:
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext = alloca { i64, i64* }, align 8
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !7
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end96.critedge, label %if.end8

if.end8:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !11
  %conv13 = trunc i64 %1 to i32
  %call14 = tail call i64* @create1DArray(i32 0, i32 %conv13) #7
  %cmp20165 = icmp slt i64 %1, 0
  br i1 %cmp20165, label %if.then77, label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %if.end8
  %2 = icmp eq i64 %1, 9223372036854775807
  br i1 %2, label %vector.body.preheader, label %polly.parallel.for

vector.body.preheader:                            ; preds = %polly.split_new_and_old
  br i1 false, label %if.end28.loopexit.unr-lcssa, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %vec.ind = phi <2 x i64> [ <i64 0, i64 1>, %vector.body.preheader.new ], [ %step.add174.1, %vector.body ]
  %niter = phi i64 [ 2305843009213693952, %vector.body.preheader.new ], [ %niter.nsub.1, %vector.body ]
  %3 = sub nsw <2 x i64> <i64 9223372036854775807, i64 9223372036854775807>, %vec.ind
  %4 = sub <2 x i64> <i64 9223372036854775805, i64 9223372036854775805>, %vec.ind
  %5 = extractelement <2 x i64> %vec.ind, i32 0
  %6 = getelementptr inbounds i64, i64* %call14, i64 %5
  %7 = bitcast i64* %6 to <2 x i64>*
  store <2 x i64> %3, <2 x i64>* %7, align 8, !tbaa !11
  %8 = getelementptr i64, i64* %6, i64 2
  %9 = bitcast i64* %8 to <2 x i64>*
  store <2 x i64> %4, <2 x i64>* %9, align 8, !tbaa !11
  %step.add174.1 = add <2 x i64> %vec.ind, <i64 8, i64 8>
  %10 = sub <2 x i64> <i64 9223372036854775803, i64 9223372036854775803>, %vec.ind
  %11 = sub <2 x i64> <i64 9223372036854775801, i64 9223372036854775801>, %vec.ind
  %.lhs = extractelement <2 x i64> %vec.ind, i32 0
  %12 = add i64 %.lhs, 4
  %13 = getelementptr inbounds i64, i64* %call14, i64 %12
  %14 = bitcast i64* %13 to <2 x i64>*
  store <2 x i64> %10, <2 x i64>* %14, align 8, !tbaa !11
  %15 = getelementptr i64, i64* %13, i64 2
  %16 = bitcast i64* %15 to <2 x i64>*
  store <2 x i64> %11, <2 x i64>* %16, align 8, !tbaa !11
  %niter.nsub.1 = add nsw i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %if.end28.loopexit.unr-lcssa.loopexit, label %vector.body, !llvm.loop !13

if.end28.loopexit.unr-lcssa.loopexit:             ; preds = %vector.body
  br label %if.end28.loopexit.unr-lcssa

if.end28.loopexit.unr-lcssa:                      ; preds = %if.end28.loopexit.unr-lcssa.loopexit, %vector.body.preheader
  br i1 false, label %vector.body.epil.preheader, label %if.end28.loopexit

vector.body.epil.preheader:                       ; preds = %if.end28.loopexit.unr-lcssa
  br label %vector.body.epil

vector.body.epil:                                 ; preds = %vector.body.epil.preheader
  br label %if.end28.loopexit.epilog-lcssa

if.end28.loopexit.epilog-lcssa:                   ; preds = %vector.body.epil
  br label %if.end28.loopexit

if.end28.loopexit:                                ; preds = %if.end28.loopexit.unr-lcssa, %if.end28.loopexit.epilog-lcssa
  br label %if.end28

if.end28:                                         ; preds = %if.end28.loopexit, %main_polly_subfn.exit
  %cmp76.i = icmp slt i64 %1, 1
  br i1 %cmp76.i, label %if.then77, label %while.cond18.preheader.lr.ph.i

while.cond18.preheader.lr.ph.i:                   ; preds = %if.end28
  %scevgep79.i = getelementptr i64, i64* %call14, i64 1
  br label %while.cond18.preheader.i

while.cond.loopexit.i:                            ; preds = %polly.stmt.blklab4.i
  %cmp.i = icmp slt i64 %polly.last_swapped.1.i, 1
  br i1 %cmp.i, label %if.then77.loopexit, label %while.cond18.preheader.i

while.cond18.preheader.i:                         ; preds = %while.cond.loopexit.i, %while.cond18.preheader.lr.ph.i
  %length.077.i = phi i64 [ %1, %while.cond18.preheader.lr.ph.i ], [ %polly.last_swapped.1.i, %while.cond.loopexit.i ]
  %cmp2073.i = icmp sgt i64 %length.077.i, 1
  br i1 %cmp2073.i, label %polly.loop_header.preheader.i, label %if.then77.loopexit

polly.loop_header.preheader.i:                    ; preds = %while.cond18.preheader.i
  %17 = add i64 %length.077.i, -1
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.stmt.blklab4.i, %polly.loop_header.preheader.i
  %last_swapped.074.phiops.0.i = phi i64 [ %polly.last_swapped.1.i, %polly.stmt.blklab4.i ], [ 0, %polly.loop_header.preheader.i ]
  %polly.indvar.i = phi i64 [ %polly.indvar_next.pre-phi.i, %polly.stmt.blklab4.i ], [ 0, %polly.loop_header.preheader.i ]
  %scevgep.i = getelementptr i64, i64* %call14, i64 %polly.indvar.i
  %_p_scalar_.i = load i64, i64* %scevgep.i, align 8, !alias.scope !16, !noalias !18
  %scevgep80.i = getelementptr i64, i64* %scevgep79.i, i64 %polly.indvar.i
  %_p_scalar_81.i = load i64, i64* %scevgep80.i, align 8, !alias.scope !16, !noalias !18
  %p_cmp24.i = icmp sgt i64 %_p_scalar_.i, %_p_scalar_81.i
  br i1 %p_cmp24.i, label %polly.stmt.if.end26.i, label %polly.loop_header.polly.stmt.blklab4_crit_edge.i

polly.loop_header.polly.stmt.blklab4_crit_edge.i: ; preds = %polly.loop_header.i
  %.pre.i = add nuw nsw i64 %polly.indvar.i, 1
  br label %polly.stmt.blklab4.i

polly.stmt.if.end26.i:                            ; preds = %polly.loop_header.i
  store i64 %_p_scalar_81.i, i64* %scevgep.i, align 8, !alias.scope !16, !noalias !18
  store i64 %_p_scalar_.i, i64* %scevgep80.i, align 8, !alias.scope !16, !noalias !18
  %18 = add nuw i64 %polly.indvar.i, 1
  br label %polly.stmt.blklab4.i

polly.stmt.blklab4.i:                             ; preds = %polly.stmt.if.end26.i, %polly.loop_header.polly.stmt.blklab4_crit_edge.i
  %polly.indvar_next.pre-phi.i = phi i64 [ %.pre.i, %polly.loop_header.polly.stmt.blklab4_crit_edge.i ], [ %18, %polly.stmt.if.end26.i ]
  %polly.last_swapped.1.i = phi i64 [ %last_swapped.074.phiops.0.i, %polly.loop_header.polly.stmt.blklab4_crit_edge.i ], [ %18, %polly.stmt.if.end26.i ]
  %exitcond.i = icmp eq i64 %polly.indvar_next.pre-phi.i, %17
  br i1 %exitcond.i, label %while.cond.loopexit.i, label %polly.loop_header.i

if.then77.loopexit:                               ; preds = %while.cond.loopexit.i, %while.cond18.preheader.i
  br label %if.then77

if.then77:                                        ; preds = %if.then77.loopexit, %if.end8, %if.end28
  %19 = load i64, i64* %call14, align 8, !tbaa !11
  %call39 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %19)
  %sub40 = add nsw i64 %1, -1
  %arrayidx41 = getelementptr inbounds i64, i64* %call14, i64 %sub40
  %20 = load i64, i64* %arrayidx41, align 8, !tbaa !11
  %call42 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %20)
  %call47 = tail call i64* @create1DArray(i32 0, i32 25) #7
  %21 = bitcast i64* %call47 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %21, align 8, !tbaa !11
  %arrayidx50 = getelementptr inbounds i64, i64* %call47, i64 2
  %22 = bitcast i64* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %22, align 8, !tbaa !11
  %arrayidx52 = getelementptr inbounds i64, i64* %call47, i64 4
  %23 = bitcast i64* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %23, align 8, !tbaa !11
  %arrayidx54 = getelementptr inbounds i64, i64* %call47, i64 6
  %24 = bitcast i64* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 117, i64 98>, <2 x i64>* %24, align 8, !tbaa !11
  %arrayidx56 = getelementptr inbounds i64, i64* %call47, i64 8
  %25 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 98, i64 108>, <2 x i64>* %25, align 8, !tbaa !11
  %arrayidx58 = getelementptr inbounds i64, i64* %call47, i64 10
  %26 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 101, i64 83>, <2 x i64>* %26, align 8, !tbaa !11
  %arrayidx60 = getelementptr inbounds i64, i64* %call47, i64 12
  %27 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 111, i64 114>, <2 x i64>* %27, align 8, !tbaa !11
  %arrayidx62 = getelementptr inbounds i64, i64* %call47, i64 14
  %28 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %28, align 8, !tbaa !11
  %arrayidx64 = getelementptr inbounds i64, i64* %call47, i64 16
  %29 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %29, align 8, !tbaa !11
  %arrayidx66 = getelementptr inbounds i64, i64* %call47, i64 18
  %30 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %30, align 8, !tbaa !11
  %arrayidx68 = getelementptr inbounds i64, i64* %call47, i64 20
  %31 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %31, align 8, !tbaa !11
  %arrayidx70 = getelementptr inbounds i64, i64* %call47, i64 22
  %32 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %32, align 8, !tbaa !11
  %arrayidx72 = getelementptr inbounds i64, i64* %call47, i64 24
  store i64 101, i64* %arrayidx72, align 8, !tbaa !11
  tail call void @println_s(i64* %call47, i64 25) #7
  %phitmp = bitcast i64* %call47 to i8*
  %phitmp164 = bitcast i64* %call14 to i8*
  %33 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %33) #7
  tail call void @free(i8* %phitmp164) #7
  tail call void @free2DArray(i64** %call, i64 %conv) #7
  tail call void @free(i8* %phitmp) #7
  br label %if.end96

if.end96.critedge:                                ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #7
  br label %if.end96

if.end96:                                         ; preds = %if.end96.critedge, %if.then77
  tail call void @exit(i32 0) #8
  unreachable

polly.parallel.for:                               ; preds = %polly.split_new_and_old
  %34 = bitcast { i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* %34)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %1, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.call14 = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call14, i64** %polly.subfn.storeaddr.call14, align 8
  %35 = add i64 %1, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* %34, i32 0, i64 0, i64 %35, i64 1) #7
  %36 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %36)
  %37 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* %37)
  %polly.subfunc.arg..i = load i64, i64* %polly.subfn.storeaddr., align 8
  %polly.subfunc.arg.call14.i = load i64*, i64** %polly.subfn.storeaddr.call14, align 8
  %38 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #7
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %main_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.parallel.for
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i170
  %40 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #7
  %41 = icmp eq i8 %40, 0
  br i1 %41, label %main_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i170

polly.loop_header.i170:                           ; preds = %polly.loop_header.i170, %polly.par.loadIVBounds.i
  %polly.indvar.i168 = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i170 ]
  %scevgep.i169 = getelementptr i64, i64* %polly.subfunc.arg.call14.i, i64 %polly.indvar.i168
  %42 = sub i64 %polly.subfunc.arg..i, %polly.indvar.i168
  store i64 %42, i64* %scevgep.i169, align 8, !alias.scope !22, !noalias !24
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i168, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i168, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i170

main_polly_subfn.exit.loopexit:                   ; preds = %polly.par.checkNext.loopexit.i
  br label %main_polly_subfn.exit

main_polly_subfn.exit:                            ; preds = %main_polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #7
  call void @llvm.lifetime.end(i64 8, i8* %36)
  call void @llvm.lifetime.end(i64 8, i8* %37)
  call void @GOMP_parallel_end() #7
  call void @llvm.lifetime.end(i64 8, i8* %34)
  br label %if.end28
}

declare void @free2DArray(i64**, i64) local_unnamed_addr #4

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #4

declare i64* @parseStringToInt(i64*) local_unnamed_addr #4

declare i64* @create1DArray(i32, i32) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

define internal void @main_polly_subfn(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg. = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64**
  %polly.subfunc.arg.call14 = load i64*, i64** %2, align 8
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %polly.indvar
  %7 = sub i64 %polly.subfunc.arg., %polly.indvar
  store i64 %7, i64* %scevgep, align 8, !alias.scope !25, !noalias !24
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*) local_unnamed_addr

declare void @GOMP_loop_end_nowait() local_unnamed_addr

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64) local_unnamed_addr

declare void @GOMP_parallel_end() local_unnamed_addr

attributes #0 = { norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "polly.skip.fn" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.items"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4, !5, !6}
!4 = distinct !{!4, !2, !"polly.alias.scope.last_swapped.074"}
!5 = distinct !{!5, !2, !"polly.alias.scope.last_swapped.1"}
!6 = distinct !{!6, !2, !"polly.alias.scope.last_swapped.1.lcssa"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long long", !9, i64 0}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !17, !"polly.alias.scope.items"}
!17 = distinct !{!17, !"polly.alias.scope.domain"}
!18 = !{!19, !20, !21}
!19 = distinct !{!19, !17, !"polly.alias.scope.last_swapped.074"}
!20 = distinct !{!20, !17, !"polly.alias.scope.last_swapped.1"}
!21 = distinct !{!21, !17, !"polly.alias.scope.last_swapped.1.lcssa"}
!22 = distinct !{!22, !23, !"polly.alias.scope.call14"}
!23 = distinct !{!23, !"polly.alias.scope.domain"}
!24 = !{}
!25 = distinct !{!25, !26, !"polly.alias.scope.call14"}
!26 = distinct !{!26, !"polly.alias.scope.domain"}
