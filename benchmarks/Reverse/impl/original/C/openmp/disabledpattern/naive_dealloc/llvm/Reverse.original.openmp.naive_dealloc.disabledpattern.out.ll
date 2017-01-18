; ModuleID = 'Reverse_original.c'
source_filename = "Reverse_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_reverse_(i64* %arr, i64 %arr_size, i1 zeroext %arr_dealloc, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %0 = bitcast i64* %arr to i8*
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext = alloca { i64, i64*, i64* }, align 8
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %arr_size) #8
  %not.cmp = icmp eq i64* %call, null
  %call6 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 %arr_size) #8
  %cmp1160 = icmp slt i64 %arr_size, 1
  br i1 %cmp1160, label %blklab0, label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %entry
  %arr_size.off = add nuw i64 %arr_size, 1152921504606846975
  %1 = icmp ult i64 %arr_size.off, 2305843009213693952
  %polly.access.arr = getelementptr i64, i64* %arr, i64 %arr_size
  %2 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %arr_size, i64 1)
  %.obit = extractvalue { i64, i1 } %2, 1
  %.res = extractvalue { i64, i1 } %2, 0
  %3 = icmp slt i64 %.res, 0
  %4 = select i1 %3, i64 %.res, i64 0
  %polly.access.call6 = getelementptr i64, i64* %call6, i64 %4
  %5 = icmp ule i64* %polly.access.arr, %polly.access.call6
  %polly.access.call662 = getelementptr i64, i64* %call6, i64 %arr_size
  %6 = icmp ule i64* %polly.access.call662, %arr
  %7 = or i1 %5, %6
  %8 = and i1 %1, %7
  %polly.rtc.overflown = xor i1 %.obit, true
  %polly.rtc.result = and i1 %8, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.parallel.for, label %if.end13.preheader

if.end13.preheader:                               ; preds = %polly.split_new_and_old
  %9 = xor i64 %arr_size, -1
  %10 = icmp sgt i64 %9, -2
  %smax = select i1 %10, i64 %9, i64 -2
  %11 = add i64 %smax, %arr_size
  %12 = add i64 %11, 2
  %min.iters.check = icmp ult i64 %12, 4
  br i1 %min.iters.check, label %if.end13.preheader75, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end13.preheader
  %n.vec = and i64 %12, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end13.preheader75, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %13 = xor i64 %arr_size, -1
  %14 = icmp sgt i64 %13, -2
  %smax66 = select i1 %14, i64 %13, i64 -2
  %15 = sub i64 -2, %smax66
  %scevgep = getelementptr i64, i64* %call6, i64 %15
  %scevgep68 = getelementptr i64, i64* %call6, i64 %arr_size
  %16 = add i64 %smax66, %arr_size
  %17 = add i64 %16, 2
  %scevgep70 = getelementptr i64, i64* %arr, i64 %17
  %bound0 = icmp ult i64* %scevgep, %scevgep70
  %bound1 = icmp ugt i64* %scevgep68, %arr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = sub i64 %arr_size, %n.vec
  br i1 %memcheck.conflict, label %if.end13.preheader75, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %18 = add i64 %n.vec, -4
  %19 = lshr exact i64 %18, 2
  %20 = and i64 %19, 1
  %lcmp.mod = icmp eq i64 %20, 0
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %21 = bitcast i64* %arr to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %21, align 8, !tbaa !1, !alias.scope !5
  %22 = getelementptr i64, i64* %arr, i64 2
  %23 = bitcast i64* %22 to <2 x i64>*
  %wide.load73.prol = load <2 x i64>, <2 x i64>* %23, align 8, !tbaa !1, !alias.scope !5
  %24 = add nsw i64 %arr_size, -1
  %25 = getelementptr inbounds i64, i64* %call6, i64 %24
  %reverse.prol = shufflevector <2 x i64> %wide.load.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %26 = getelementptr i64, i64* %25, i64 -1
  %27 = bitcast i64* %26 to <2 x i64>*
  store <2 x i64> %reverse.prol, <2 x i64>* %27, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse74.prol = shufflevector <2 x i64> %wide.load73.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %28 = getelementptr i64, i64* %25, i64 -2
  %29 = getelementptr i64, i64* %28, i64 -1
  %30 = bitcast i64* %29 to <2 x i64>*
  store <2 x i64> %reverse74.prol, <2 x i64>* %30, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %31 = icmp eq i64 %19, 0
  br i1 %31, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %offset.idx = sub i64 %arr_size, %index
  %32 = getelementptr inbounds i64, i64* %arr, i64 %index
  %33 = bitcast i64* %32 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %33, align 8, !tbaa !1, !alias.scope !5
  %34 = getelementptr i64, i64* %32, i64 2
  %35 = bitcast i64* %34 to <2 x i64>*
  %wide.load73 = load <2 x i64>, <2 x i64>* %35, align 8, !tbaa !1, !alias.scope !5
  %36 = add nsw i64 %offset.idx, -1
  %37 = getelementptr inbounds i64, i64* %call6, i64 %36
  %reverse = shufflevector <2 x i64> %wide.load, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %38 = getelementptr i64, i64* %37, i64 -1
  %39 = bitcast i64* %38 to <2 x i64>*
  store <2 x i64> %reverse, <2 x i64>* %39, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse74 = shufflevector <2 x i64> %wide.load73, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %40 = getelementptr i64, i64* %37, i64 -2
  %41 = getelementptr i64, i64* %40, i64 -1
  %42 = bitcast i64* %41 to <2 x i64>*
  store <2 x i64> %reverse74, <2 x i64>* %42, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next = add i64 %index, 4
  %offset.idx.1 = sub i64 %arr_size, %index.next
  %43 = getelementptr inbounds i64, i64* %arr, i64 %index.next
  %44 = bitcast i64* %43 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %44, align 8, !tbaa !1, !alias.scope !5
  %45 = getelementptr i64, i64* %43, i64 2
  %46 = bitcast i64* %45 to <2 x i64>*
  %wide.load73.1 = load <2 x i64>, <2 x i64>* %46, align 8, !tbaa !1, !alias.scope !5
  %47 = add nsw i64 %offset.idx.1, -1
  %48 = getelementptr inbounds i64, i64* %call6, i64 %47
  %reverse.1 = shufflevector <2 x i64> %wide.load.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %49 = getelementptr i64, i64* %48, i64 -1
  %50 = bitcast i64* %49 to <2 x i64>*
  store <2 x i64> %reverse.1, <2 x i64>* %50, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse74.1 = shufflevector <2 x i64> %wide.load73.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %51 = getelementptr i64, i64* %48, i64 -2
  %52 = getelementptr i64, i64* %51, i64 -1
  %53 = bitcast i64* %52 to <2 x i64>*
  store <2 x i64> %reverse74.1, <2 x i64>* %53, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next.1 = add i64 %index, 8
  %54 = icmp eq i64 %index.next.1, %n.vec
  br i1 %54, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !10

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %12, %n.vec
  br i1 %cmp.n, label %blklab0, label %if.end13.preheader75

if.end13.preheader75:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end13.preheader
  %i.061.ph = phi i64 [ %arr_size, %vector.memcheck ], [ %arr_size, %min.iters.checked ], [ %arr_size, %if.end13.preheader ], [ %ind.end, %middle.block ]
  br label %if.end13

if.end13:                                         ; preds = %if.end13.preheader75, %if.end13
  %i.061 = phi i64 [ %sub14, %if.end13 ], [ %i.061.ph, %if.end13.preheader75 ]
  %sub = sub nuw nsw i64 %arr_size, %i.061
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %sub
  %55 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %sub14 = add nsw i64 %i.061, -1
  %arrayidx15 = getelementptr inbounds i64, i64* %call6, i64 %sub14
  store i64 %55, i64* %arrayidx15, align 8, !tbaa !1
  %cmp11 = icmp slt i64 %i.061, 2
  br i1 %cmp11, label %blklab0.loopexit, label %if.end13, !llvm.loop !13

blklab0.loopexit:                                 ; preds = %if.end13
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %middle.block, %_reverse__polly_subfn.exit, %entry
  br i1 %arr_dealloc, label %if.then17, label %if.end21

if.then17:                                        ; preds = %blklab0
  tail call void @free(i8* %0) #8
  br label %if.end21

if.end21:                                         ; preds = %blklab0, %if.then17
  br i1 %not.cmp, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end21
  %56 = bitcast i64* %call to i8*
  tail call void @free(i8* %56) #8
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %if.then23
  store i64 %arr_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  ret i64* %call6

polly.parallel.for:                               ; preds = %polly.split_new_and_old
  %57 = bitcast { i64, i64*, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %57)
  %polly.subfn.storeaddr.arr_size = getelementptr inbounds { i64, i64*, i64* }, { i64, i64*, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %arr_size, i64* %polly.subfn.storeaddr.arr_size, align 8
  %polly.subfn.storeaddr.arr = getelementptr inbounds { i64, i64*, i64* }, { i64, i64*, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %arr, i64** %polly.subfn.storeaddr.arr, align 8
  %polly.subfn.storeaddr.call6 = getelementptr inbounds { i64, i64*, i64* }, { i64, i64*, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %call6, i64** %polly.subfn.storeaddr.call6, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_reverse__polly_subfn, i8* nonnull %57, i32 0, i64 0, i64 %arr_size, i64 1) #8
  %58 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %58)
  %59 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %59)
  %polly.subfunc.arg.arr_size.i = load i64, i64* %polly.subfn.storeaddr.arr_size, align 8
  %polly.subfunc.arg.arr.i = load i64*, i64** %polly.subfn.storeaddr.arr, align 8
  %polly.subfunc.arg.call6.i = load i64*, i64** %polly.subfn.storeaddr.call6, align 8
  %60 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %_reverse__polly_subfn.exit, label %polly.par.loadIVBounds.preheader.i

polly.par.loadIVBounds.preheader.i:               ; preds = %polly.parallel.for
  %62 = add i64 %polly.subfunc.arg.arr_size.i, -1
  %scevgep2.i = getelementptr i64, i64* %polly.subfunc.arg.call6.i, i64 %62
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %63 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %64 = icmp eq i8 %63, 0
  br i1 %64, label %_reverse__polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.checkNext.loopexit.i, %polly.par.loadIVBounds.preheader.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.arr.i, i64 %polly.indvar.i
  %_p_scalar_.i = load i64, i64* %scevgep.i, align 8, !alias.scope !14, !noalias !16
  %65 = sub i64 0, %polly.indvar.i
  %scevgep3.i = getelementptr i64, i64* %scevgep2.i, i64 %65
  store i64 %_p_scalar_.i, i64* %scevgep3.i, align 8, !alias.scope !17, !noalias !18
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

_reverse__polly_subfn.exit.loopexit:              ; preds = %polly.par.checkNext.loopexit.i
  br label %_reverse__polly_subfn.exit

_reverse__polly_subfn.exit:                       ; preds = %_reverse__polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %58)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %59)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %57)
  br label %blklab0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #4 {
entry:
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext = alloca { i64, i64* }, align 8
  %_6_size = alloca i64, align 8
  %_6_size_size = alloca i64, align 8
  %_15_size = alloca i64, align 8
  %0 = bitcast i64* %_6_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #8
  store i64 0, i64* %_6_size, align 8, !tbaa !1
  %1 = bitcast i64* %_6_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #8
  store i64 0, i64* %_6_size_size, align 8, !tbaa !1
  %2 = bitcast i64* %_15_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #8
  store i64 0, i64* %_15_size, align 8, !tbaa !1
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_6_size, i64* nonnull %_6_size_size) #8
  %not.cmp = icmp eq i64** %call, null
  %3 = load i64*, i64** %call, align 8, !tbaa !19
  %call3 = call i64* @parseStringToInt(i64* %3) #8
  %not.cmp4 = icmp eq i64* %call3, null
  %4 = load i64, i64* %call3, align 8, !tbaa !1
  %call22 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #8
  %not.cmp23 = icmp eq i64* %call22, null
  %call30 = call i64* @copy1DArray_int64_t(i64* %call22, i64 %4) #8
  %not.cmp31 = icmp eq i64* %call30, null
  %cmp35190 = icmp sgt i64 %4, 0
  br i1 %cmp35190, label %polly.parallel.for, label %if.end42

if.end42:                                         ; preds = %main_polly_subfn.exit, %entry
  %call43 = call i64* @copy1DArray_int64_t(i64* %call30, i64 %4) #8
  %call44 = call i64* @_reverse_(i64* %call43, i64 %4, i1 zeroext true, i64* nonnull %_15_size)
  %not.cmp45 = icmp eq i64* %call44, null
  br i1 %not.cmp31, label %blklab4, label %if.then50

if.then50:                                        ; preds = %if.end42
  %5 = bitcast i64* %call30 to i8*
  call void @free(i8* %5) #8
  br label %blklab4

blklab4:                                          ; preds = %if.then50, %if.end42
  %6 = load i64, i64* %_15_size, align 8, !tbaa !1
  %call52 = call i64* @copy1DArray_int64_t(i64* %call44, i64 %6) #8
  %not.cmp53 = icmp eq i64* %call52, null
  %7 = load i64, i64* %call52, align 8, !tbaa !1
  %call58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %7)
  %sub59 = add nsw i64 %4, -1
  %arrayidx60 = getelementptr inbounds i64, i64* %call52, i64 %sub59
  %8 = load i64, i64* %arrayidx60, align 8, !tbaa !1
  %call61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %8)
  %call65 = call i64* @create1DArray_int64_t(i64 0, i64 22) #8
  %9 = bitcast i64* %call65 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx68 = getelementptr inbounds i64, i64* %call65, i64 2
  %10 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx70 = getelementptr inbounds i64, i64* %call65, i64 4
  %11 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 32, i64 82>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx72 = getelementptr inbounds i64, i64* %call65, i64 6
  %12 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 101, i64 118>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx74 = getelementptr inbounds i64, i64* %call65, i64 8
  %13 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx76 = getelementptr inbounds i64, i64* %call65, i64 10
  %14 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx78 = getelementptr inbounds i64, i64* %call65, i64 12
  %15 = bitcast i64* %arrayidx78 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx80 = getelementptr inbounds i64, i64* %call65, i64 14
  %16 = bitcast i64* %arrayidx80 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx82 = getelementptr inbounds i64, i64* %call65, i64 16
  %17 = bitcast i64* %arrayidx82 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx84 = getelementptr inbounds i64, i64* %call65, i64 18
  %18 = bitcast i64* %arrayidx84 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx86 = getelementptr inbounds i64, i64* %call65, i64 20
  %19 = bitcast i64* %arrayidx86 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %19, align 8, !tbaa !1
  %not.cmp88 = icmp eq i64* %call65, null
  call void @println_s(i64* %call65, i64 22) #8
  %phitmp = bitcast i64* %call65 to i8*
  %phitmp184 = bitcast i64* %call44 to i8*
  %phitmp185 = bitcast i64* %call22 to i8*
  br i1 %not.cmp53, label %if.end97, label %if.then96

if.then96:                                        ; preds = %blklab4
  %phitmp186 = bitcast i64* %call52 to i8*
  call void @free(i8* %phitmp186) #8
  br label %if.end97

if.end97:                                         ; preds = %blklab4, %if.then96
  br i1 %not.cmp4, label %if.end100, label %if.then99

if.then99:                                        ; preds = %if.end97
  %20 = bitcast i64* %call3 to i8*
  call void @free(i8* %20) #8
  br label %if.end100

if.end100:                                        ; preds = %if.end97, %if.then99
  br i1 %not.cmp, label %if.end106, label %if.then102

if.then102:                                       ; preds = %if.end100
  %21 = load i64, i64* %_6_size, align 8, !tbaa !1
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %21) #8
  br label %if.end106

if.end106:                                        ; preds = %if.end100, %if.then102
  br i1 %not.cmp23, label %if.end109, label %if.then108

if.then108:                                       ; preds = %if.end106
  call void @free(i8* %phitmp185) #8
  br label %if.end109

if.end109:                                        ; preds = %if.end106, %if.then108
  br i1 %not.cmp45, label %if.end112, label %if.then111

if.then111:                                       ; preds = %if.end109
  call void @free(i8* %phitmp184) #8
  br label %if.end112

if.end112:                                        ; preds = %if.end109, %if.then111
  br i1 %not.cmp88, label %if.end115, label %if.then114

if.then114:                                       ; preds = %if.end112
  call void @free(i8* %phitmp) #8
  br label %if.end115

if.end115:                                        ; preds = %if.end112, %if.then114
  call void @exit(i32 0) #9
  unreachable

polly.parallel.for:                               ; preds = %entry
  %22 = bitcast { i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %22)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %4, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.call30 = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call30, i64** %polly.subfn.storeaddr.call30, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* nonnull %22, i32 0, i64 0, i64 %4, i64 1) #8
  %23 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %23)
  %24 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %24)
  %polly.subfunc.arg..i = load i64, i64* %polly.subfn.storeaddr., align 8
  %polly.subfunc.arg.call30.i = load i64*, i64** %polly.subfn.storeaddr.call30, align 8
  %25 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %main_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.parallel.for
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %27 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %main_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call30.i, i64 %polly.indvar.i
  %29 = sub i64 %polly.subfunc.arg..i, %polly.indvar.i
  store i64 %29, i64* %scevgep.i, align 8, !alias.scope !21, !noalias !23
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

main_polly_subfn.exit.loopexit:                   ; preds = %polly.par.checkNext.loopexit.i
  br label %main_polly_subfn.exit

main_polly_subfn.exit:                            ; preds = %main_polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %23)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %24)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %22)
  br label %if.end42
}

declare void @free2DArray_int64_t(i64**, i64) local_unnamed_addr #3

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #6

define internal void @_reverse__polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.arr_size = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64**
  %polly.subfunc.arg.arr = load i64*, i64** %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.call6 = load i64*, i64** %4, align 8
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %7 = add i64 %polly.subfunc.arg.arr_size, -1
  %scevgep2 = getelementptr i64, i64* %polly.subfunc.arg.call6, i64 %7
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %8 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.arr, i64 %polly.indvar
  %_p_scalar_ = load i64, i64* %scevgep, align 8, !alias.scope !24, !noalias !26
  %10 = sub i64 0, %polly.indvar
  %scevgep3 = getelementptr i64, i64* %scevgep2, i64 %10
  store i64 %_p_scalar_, i64* %scevgep3, align 8, !alias.scope !27, !noalias !28
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*) local_unnamed_addr

declare void @GOMP_loop_end_nowait() local_unnamed_addr

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64) local_unnamed_addr

declare void @GOMP_parallel_end() local_unnamed_addr

define internal void @main_polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg. = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64**
  %polly.subfunc.arg.call30 = load i64*, i64** %2, align 8
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
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %polly.indvar
  %7 = sub i64 %polly.subfunc.arg., %polly.indvar
  store i64 %7, i64* %scevgep, align 8, !alias.scope !29, !noalias !23
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { "polly.skip.fn" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !11, !12}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.interleave.count", i32 1}
!13 = distinct !{!13, !11, !12}
!14 = distinct !{!14, !15, !"polly.alias.scope.arr"}
!15 = distinct !{!15, !"polly.alias.scope.domain"}
!16 = !{!17}
!17 = distinct !{!17, !15, !"polly.alias.scope.call6"}
!18 = !{!14}
!19 = !{!20, !20, i64 0}
!20 = !{!"any pointer", !3, i64 0}
!21 = distinct !{!21, !22, !"polly.alias.scope.call30"}
!22 = distinct !{!22, !"polly.alias.scope.domain"}
!23 = !{}
!24 = distinct !{!24, !25, !"polly.alias.scope.arr"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27}
!27 = distinct !{!27, !25, !"polly.alias.scope.call6"}
!28 = !{!24}
!29 = distinct !{!29, !30, !"polly.alias.scope.call30"}
!30 = distinct !{!30, !"polly.alias.scope.domain"}
