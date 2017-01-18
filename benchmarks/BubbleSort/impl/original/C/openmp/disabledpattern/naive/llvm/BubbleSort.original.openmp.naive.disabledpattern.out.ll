; ModuleID = 'BubbleSort_original.c'
source_filename = "BubbleSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define i64* @_bubbleSort_(i64* returned %items, i64 %items_size, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %cmp75 = icmp slt i64 %items_size, 1
  br i1 %cmp75, label %blklab0, label %while.cond18.preheader.lr.ph

while.cond18.preheader.lr.ph:                     ; preds = %entry
  %scevgep78 = getelementptr i64, i64* %items, i64 1
  br label %while.cond18.preheader

while.cond.loopexit:                              ; preds = %polly.stmt.blklab4
  %cmp = icmp slt i64 %polly.last_swapped.1, 1
  br i1 %cmp, label %blklab0.loopexit, label %while.cond18.preheader

while.cond18.preheader:                           ; preds = %while.cond18.preheader.lr.ph, %while.cond.loopexit
  %length.076 = phi i64 [ %items_size, %while.cond18.preheader.lr.ph ], [ %polly.last_swapped.1, %while.cond.loopexit ]
  %cmp2072 = icmp sgt i64 %length.076, 1
  br i1 %cmp2072, label %polly.loop_header.preheader, label %blklab0.loopexit

polly.loop_header.preheader:                      ; preds = %while.cond18.preheader
  %0 = add nsw i64 %length.076, -1
  br label %polly.loop_header

blklab0.loopexit:                                 ; preds = %while.cond.loopexit, %while.cond18.preheader
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %entry
  store i64 %items_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  ret i64* %items

polly.loop_header:                                ; preds = %polly.stmt.blklab4, %polly.loop_header.preheader
  %last_swapped.074.phiops.0 = phi i64 [ %polly.last_swapped.1, %polly.stmt.blklab4 ], [ 0, %polly.loop_header.preheader ]
  %polly.indvar = phi i64 [ %polly.indvar_next.pre-phi, %polly.stmt.blklab4 ], [ 0, %polly.loop_header.preheader ]
  %scevgep = getelementptr i64, i64* %items, i64 %polly.indvar
  %_p_scalar_ = load i64, i64* %scevgep, align 8, !alias.scope !5, !noalias !7
  %scevgep79 = getelementptr i64, i64* %scevgep78, i64 %polly.indvar
  %_p_scalar_80 = load i64, i64* %scevgep79, align 8, !alias.scope !5, !noalias !7
  %p_cmp24 = icmp sgt i64 %_p_scalar_, %_p_scalar_80
  br i1 %p_cmp24, label %polly.stmt.if.end26, label %polly.loop_header.polly.stmt.blklab4_crit_edge

polly.loop_header.polly.stmt.blklab4_crit_edge:   ; preds = %polly.loop_header
  %.pre = add nuw nsw i64 %polly.indvar, 1
  br label %polly.stmt.blklab4

polly.stmt.if.end26:                              ; preds = %polly.loop_header
  store i64 %_p_scalar_80, i64* %scevgep, align 8, !alias.scope !5, !noalias !7
  store i64 %_p_scalar_, i64* %scevgep79, align 8, !alias.scope !5, !noalias !7
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

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #2 {
entry:
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext = alloca { i64, i64* }, align 8
  %_6_size = alloca i64, align 8
  %_6_size_size = alloca i64, align 8
  %_15_size = alloca i64, align 8
  %0 = bitcast i64* %_6_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #7
  store i64 0, i64* %_6_size, align 8, !tbaa !1
  %1 = bitcast i64* %_6_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #7
  store i64 0, i64* %_6_size_size, align 8, !tbaa !1
  %2 = bitcast i64* %_15_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #7
  store i64 0, i64* %_15_size, align 8, !tbaa !1
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_6_size, i64* nonnull %_6_size_size) #7
  %3 = load i64*, i64** %call, align 8, !tbaa !11
  %call1 = call i64* @parseStringToInt(i64* %3) #7
  %4 = load i64, i64* %call1, align 8, !tbaa !1
  %call3 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #7
  %call4 = call i64* @copy1DArray_int64_t(i64* %call3, i64 %4) #7
  %cmp585 = icmp slt i64 %4, 0
  br i1 %cmp585, label %blklab6, label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %entry
  %5 = icmp eq i64 %4, 9223372036854775807
  br i1 %5, label %vector.body.preheader, label %polly.parallel.for

vector.body.preheader:                            ; preds = %polly.split_new_and_old
  br i1 false, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  br i1 false, label %vector.body.prol, label %vector.body.prol.loopexit.unr-lcssa, !llvm.loop !13

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa, %vector.body.preheader
  br i1 false, label %blklab6.loopexit, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ 0, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %vec.ind = phi <2 x i64> [ <i64 0, i64 1>, %vector.body.preheader.new ], [ %vec.ind.next.3, %vector.body ]
  %6 = sub nsw <2 x i64> <i64 9223372036854775807, i64 9223372036854775807>, %vec.ind
  %7 = sub <2 x i64> <i64 9223372036854775805, i64 9223372036854775805>, %vec.ind
  %8 = getelementptr inbounds i64, i64* %call4, i64 %index
  %9 = bitcast i64* %8 to <2 x i64>*
  store <2 x i64> %6, <2 x i64>* %9, align 8, !tbaa !1
  %10 = getelementptr i64, i64* %8, i64 2
  %11 = bitcast i64* %10 to <2 x i64>*
  store <2 x i64> %7, <2 x i64>* %11, align 8, !tbaa !1
  %index.next = or i64 %index, 4
  %12 = sub <2 x i64> <i64 9223372036854775803, i64 9223372036854775803>, %vec.ind
  %13 = sub <2 x i64> <i64 9223372036854775801, i64 9223372036854775801>, %vec.ind
  %14 = getelementptr inbounds i64, i64* %call4, i64 %index.next
  %15 = bitcast i64* %14 to <2 x i64>*
  store <2 x i64> %12, <2 x i64>* %15, align 8, !tbaa !1
  %16 = getelementptr i64, i64* %14, i64 2
  %17 = bitcast i64* %16 to <2 x i64>*
  store <2 x i64> %13, <2 x i64>* %17, align 8, !tbaa !1
  %index.next.1 = or i64 %index, 8
  %18 = sub <2 x i64> <i64 9223372036854775799, i64 9223372036854775799>, %vec.ind
  %19 = sub <2 x i64> <i64 9223372036854775797, i64 9223372036854775797>, %vec.ind
  %20 = getelementptr inbounds i64, i64* %call4, i64 %index.next.1
  %21 = bitcast i64* %20 to <2 x i64>*
  store <2 x i64> %18, <2 x i64>* %21, align 8, !tbaa !1
  %22 = getelementptr i64, i64* %20, i64 2
  %23 = bitcast i64* %22 to <2 x i64>*
  store <2 x i64> %19, <2 x i64>* %23, align 8, !tbaa !1
  %index.next.2 = or i64 %index, 12
  %24 = sub <2 x i64> <i64 9223372036854775795, i64 9223372036854775795>, %vec.ind
  %25 = sub <2 x i64> <i64 9223372036854775793, i64 9223372036854775793>, %vec.ind
  %26 = getelementptr inbounds i64, i64* %call4, i64 %index.next.2
  %27 = bitcast i64* %26 to <2 x i64>*
  store <2 x i64> %24, <2 x i64>* %27, align 8, !tbaa !1
  %28 = getelementptr i64, i64* %26, i64 2
  %29 = bitcast i64* %28 to <2 x i64>*
  store <2 x i64> %25, <2 x i64>* %29, align 8, !tbaa !1
  %index.next.3 = add i64 %index, 16
  %vec.ind.next.3 = add <2 x i64> %vec.ind, <i64 16, i64 16>
  %30 = icmp eq i64 %index.next.3, -9223372036854775808
  br i1 %30, label %blklab6.loopexit.unr-lcssa, label %vector.body, !llvm.loop !15

blklab6.loopexit.unr-lcssa:                       ; preds = %vector.body
  br label %blklab6.loopexit

blklab6.loopexit:                                 ; preds = %vector.body.prol.loopexit, %blklab6.loopexit.unr-lcssa
  br label %blklab6

blklab6:                                          ; preds = %blklab6.loopexit, %main_polly_subfn.exit, %entry
  %call10 = call i64* @copy1DArray_int64_t(i64* %call4, i64 %4) #7
  %call11 = call i64* @_bubbleSort_(i64* %call10, i64 %4, i64* nonnull %_15_size)
  %31 = load i64, i64* %_15_size, align 8, !tbaa !1
  %call12 = call i64* @copy1DArray_int64_t(i64* %call11, i64 %31) #7
  %32 = load i64, i64* %call12, align 8, !tbaa !1
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %32)
  %sub15 = add nsw i64 %4, -1
  %arrayidx16 = getelementptr inbounds i64, i64* %call12, i64 %sub15
  %33 = load i64, i64* %arrayidx16, align 8, !tbaa !1
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %33)
  %call18 = call i64* @create1DArray_int64_t(i64 0, i64 25) #7
  %34 = bitcast i64* %call18 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx21 = getelementptr inbounds i64, i64* %call18, i64 2
  %35 = bitcast i64* %arrayidx21 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx23 = getelementptr inbounds i64, i64* %call18, i64 4
  %36 = bitcast i64* %arrayidx23 to <2 x i64>*
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx25 = getelementptr inbounds i64, i64* %call18, i64 6
  %37 = bitcast i64* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 117, i64 98>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx27 = getelementptr inbounds i64, i64* %call18, i64 8
  %38 = bitcast i64* %arrayidx27 to <2 x i64>*
  store <2 x i64> <i64 98, i64 108>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx29 = getelementptr inbounds i64, i64* %call18, i64 10
  %39 = bitcast i64* %arrayidx29 to <2 x i64>*
  store <2 x i64> <i64 101, i64 83>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx31 = getelementptr inbounds i64, i64* %call18, i64 12
  %40 = bitcast i64* %arrayidx31 to <2 x i64>*
  store <2 x i64> <i64 111, i64 114>, <2 x i64>* %40, align 8, !tbaa !1
  %arrayidx33 = getelementptr inbounds i64, i64* %call18, i64 14
  %41 = bitcast i64* %arrayidx33 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %41, align 8, !tbaa !1
  %arrayidx35 = getelementptr inbounds i64, i64* %call18, i64 16
  %42 = bitcast i64* %arrayidx35 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %42, align 8, !tbaa !1
  %arrayidx37 = getelementptr inbounds i64, i64* %call18, i64 18
  %43 = bitcast i64* %arrayidx37 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %43, align 8, !tbaa !1
  %arrayidx39 = getelementptr inbounds i64, i64* %call18, i64 20
  %44 = bitcast i64* %arrayidx39 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %44, align 8, !tbaa !1
  %arrayidx41 = getelementptr inbounds i64, i64* %call18, i64 22
  %45 = bitcast i64* %arrayidx41 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %45, align 8, !tbaa !1
  %arrayidx43 = getelementptr inbounds i64, i64* %call18, i64 24
  store i64 101, i64* %arrayidx43, align 8, !tbaa !1
  call void @println_s(i64* %call18, i64 25) #7
  call void @exit(i32 0) #8
  unreachable

polly.parallel.for:                               ; preds = %polly.split_new_and_old
  %46 = bitcast { i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %46)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %4, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.call4 = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call4, i64** %polly.subfn.storeaddr.call4, align 8
  %47 = add nuw nsw i64 %4, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* nonnull %46, i32 0, i64 0, i64 %47, i64 1) #7
  %48 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %48)
  %49 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %49)
  %polly.subfunc.arg..i = load i64, i64* %polly.subfn.storeaddr., align 8
  %polly.subfunc.arg.call4.i = load i64*, i64** %polly.subfn.storeaddr.call4, align 8
  %50 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #7
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %main_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.parallel.for
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %52 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #7
  %53 = icmp eq i8 %52, 0
  br i1 %53, label %main_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call4.i, i64 %polly.indvar.i
  %54 = sub i64 %polly.subfunc.arg..i, %polly.indvar.i
  store i64 %54, i64* %scevgep.i, align 8, !alias.scope !18, !noalias !20
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

main_polly_subfn.exit.loopexit:                   ; preds = %polly.par.checkNext.loopexit.i
  br label %main_polly_subfn.exit

main_polly_subfn.exit:                            ; preds = %main_polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #7
  call void @llvm.lifetime.end(i64 8, i8* nonnull %48)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %49)
  call void @GOMP_parallel_end() #7
  call void @llvm.lifetime.end(i64 8, i8* nonnull %46)
  br label %blklab6
}

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #4

declare void @println_s(i64*, i64) local_unnamed_addr #3

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
  %polly.subfunc.arg.call4 = load i64*, i64** %2, align 8
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
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call4, i64 %polly.indvar
  %7 = sub i64 %polly.subfunc.arg., %polly.indvar
  store i64 %7, i64* %scevgep, align 8, !alias.scope !21, !noalias !20
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*) local_unnamed_addr

declare void @GOMP_loop_end_nowait() local_unnamed_addr

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64) local_unnamed_addr

declare void @GOMP_parallel_end() local_unnamed_addr

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "polly.skip.fn" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6, !"polly.alias.scope.items"}
!6 = distinct !{!6, !"polly.alias.scope.domain"}
!7 = !{!8, !9, !10}
!8 = distinct !{!8, !6, !"polly.alias.scope.last_swapped.1"}
!9 = distinct !{!9, !6, !"polly.alias.scope.last_swapped.1.lcssa"}
!10 = distinct !{!10, !6, !"polly.alias.scope.last_swapped.074"}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !3, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !19, !"polly.alias.scope.call4"}
!19 = distinct !{!19, !"polly.alias.scope.domain"}
!20 = !{}
!21 = distinct !{!21, !22, !"polly.alias.scope.call4"}
!22 = distinct !{!22, !"polly.alias.scope.domain"}
