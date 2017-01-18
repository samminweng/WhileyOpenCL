; ModuleID = 'Reverse_original.c'
source_filename = "Reverse_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_reverse_(i64* %arr, i64 %arr_size, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext = alloca { i64, i64*, i64* }, align 8
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %arr_size) #8
  %cmp30 = icmp slt i64 %arr_size, 1
  br i1 %cmp30, label %blklab0, label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %entry
  %arr_size.off = add nuw i64 %arr_size, 1152921504606846975
  %0 = icmp ult i64 %arr_size.off, 2305843009213693952
  %polly.access.arr = getelementptr i64, i64* %arr, i64 %arr_size
  %1 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %arr_size, i64 1)
  %.obit = extractvalue { i64, i1 } %1, 1
  %.res = extractvalue { i64, i1 } %1, 0
  %2 = icmp slt i64 %.res, 0
  %3 = select i1 %2, i64 %.res, i64 0
  %polly.access.call = getelementptr i64, i64* %call, i64 %3
  %4 = icmp ule i64* %polly.access.arr, %polly.access.call
  %polly.access.call32 = getelementptr i64, i64* %call, i64 %arr_size
  %5 = icmp ule i64* %polly.access.call32, %arr
  %6 = or i1 %4, %5
  %7 = and i1 %0, %6
  %polly.rtc.overflown = xor i1 %.obit, true
  %polly.rtc.result = and i1 %7, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.parallel.for, label %if.end.preheader

if.end.preheader:                                 ; preds = %polly.split_new_and_old
  %8 = xor i64 %arr_size, -1
  %9 = icmp sgt i64 %8, -2
  %smax = select i1 %9, i64 %8, i64 -2
  %10 = add i64 %smax, %arr_size
  %11 = add i64 %10, 2
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %if.end.preheader46, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end.preheader46, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %12 = xor i64 %arr_size, -1
  %13 = icmp sgt i64 %12, -2
  %smax36 = select i1 %13, i64 %12, i64 -2
  %14 = sub i64 -2, %smax36
  %scevgep = getelementptr i64, i64* %call, i64 %14
  %scevgep38 = getelementptr i64, i64* %call, i64 %arr_size
  %15 = add i64 %smax36, %arr_size
  %16 = add i64 %15, 2
  %scevgep41 = getelementptr i64, i64* %arr, i64 %16
  %bound0 = icmp ult i64* %scevgep, %scevgep41
  %bound1 = icmp ugt i64* %scevgep38, %arr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = sub i64 %arr_size, %n.vec
  br i1 %memcheck.conflict, label %if.end.preheader46, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %17 = add i64 %n.vec, -4
  %18 = lshr exact i64 %17, 2
  %19 = and i64 %18, 1
  %lcmp.mod = icmp eq i64 %19, 0
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %20 = bitcast i64* %arr to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %20, align 8, !tbaa !1, !alias.scope !5
  %21 = getelementptr i64, i64* %arr, i64 2
  %22 = bitcast i64* %21 to <2 x i64>*
  %wide.load44.prol = load <2 x i64>, <2 x i64>* %22, align 8, !tbaa !1, !alias.scope !5
  %23 = add nsw i64 %arr_size, -1
  %24 = getelementptr inbounds i64, i64* %call, i64 %23
  %reverse.prol = shufflevector <2 x i64> %wide.load.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %25 = getelementptr i64, i64* %24, i64 -1
  %26 = bitcast i64* %25 to <2 x i64>*
  store <2 x i64> %reverse.prol, <2 x i64>* %26, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse45.prol = shufflevector <2 x i64> %wide.load44.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %27 = getelementptr i64, i64* %24, i64 -2
  %28 = getelementptr i64, i64* %27, i64 -1
  %29 = bitcast i64* %28 to <2 x i64>*
  store <2 x i64> %reverse45.prol, <2 x i64>* %29, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %30 = icmp eq i64 %18, 0
  br i1 %30, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %offset.idx = sub i64 %arr_size, %index
  %31 = getelementptr inbounds i64, i64* %arr, i64 %index
  %32 = bitcast i64* %31 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %32, align 8, !tbaa !1, !alias.scope !5
  %33 = getelementptr i64, i64* %31, i64 2
  %34 = bitcast i64* %33 to <2 x i64>*
  %wide.load44 = load <2 x i64>, <2 x i64>* %34, align 8, !tbaa !1, !alias.scope !5
  %35 = add nsw i64 %offset.idx, -1
  %36 = getelementptr inbounds i64, i64* %call, i64 %35
  %reverse = shufflevector <2 x i64> %wide.load, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %37 = getelementptr i64, i64* %36, i64 -1
  %38 = bitcast i64* %37 to <2 x i64>*
  store <2 x i64> %reverse, <2 x i64>* %38, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse45 = shufflevector <2 x i64> %wide.load44, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %39 = getelementptr i64, i64* %36, i64 -2
  %40 = getelementptr i64, i64* %39, i64 -1
  %41 = bitcast i64* %40 to <2 x i64>*
  store <2 x i64> %reverse45, <2 x i64>* %41, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next = add i64 %index, 4
  %offset.idx.1 = sub i64 %arr_size, %index.next
  %42 = getelementptr inbounds i64, i64* %arr, i64 %index.next
  %43 = bitcast i64* %42 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %43, align 8, !tbaa !1, !alias.scope !5
  %44 = getelementptr i64, i64* %42, i64 2
  %45 = bitcast i64* %44 to <2 x i64>*
  %wide.load44.1 = load <2 x i64>, <2 x i64>* %45, align 8, !tbaa !1, !alias.scope !5
  %46 = add nsw i64 %offset.idx.1, -1
  %47 = getelementptr inbounds i64, i64* %call, i64 %46
  %reverse.1 = shufflevector <2 x i64> %wide.load.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %48 = getelementptr i64, i64* %47, i64 -1
  %49 = bitcast i64* %48 to <2 x i64>*
  store <2 x i64> %reverse.1, <2 x i64>* %49, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse45.1 = shufflevector <2 x i64> %wide.load44.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %50 = getelementptr i64, i64* %47, i64 -2
  %51 = getelementptr i64, i64* %50, i64 -1
  %52 = bitcast i64* %51 to <2 x i64>*
  store <2 x i64> %reverse45.1, <2 x i64>* %52, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next.1 = add i64 %index, 8
  %53 = icmp eq i64 %index.next.1, %n.vec
  br i1 %53, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !10

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %blklab0, label %if.end.preheader46

if.end.preheader46:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end.preheader
  %i.031.ph = phi i64 [ %arr_size, %vector.memcheck ], [ %arr_size, %min.iters.checked ], [ %arr_size, %if.end.preheader ], [ %ind.end, %middle.block ]
  br label %if.end

if.end:                                           ; preds = %if.end.preheader46, %if.end
  %i.031 = phi i64 [ %sub1, %if.end ], [ %i.031.ph, %if.end.preheader46 ]
  %sub = sub nuw nsw i64 %arr_size, %i.031
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %sub
  %54 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %sub1 = add nsw i64 %i.031, -1
  %arrayidx2 = getelementptr inbounds i64, i64* %call, i64 %sub1
  store i64 %54, i64* %arrayidx2, align 8, !tbaa !1
  %cmp = icmp slt i64 %i.031, 2
  br i1 %cmp, label %blklab0.loopexit, label %if.end, !llvm.loop !13

blklab0.loopexit:                                 ; preds = %if.end
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %middle.block, %_reverse__polly_subfn.exit, %entry
  store i64 %arr_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  ret i64* %call

polly.parallel.for:                               ; preds = %polly.split_new_and_old
  %55 = bitcast { i64, i64*, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %55)
  %polly.subfn.storeaddr.arr_size = getelementptr inbounds { i64, i64*, i64* }, { i64, i64*, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %arr_size, i64* %polly.subfn.storeaddr.arr_size, align 8
  %polly.subfn.storeaddr.arr = getelementptr inbounds { i64, i64*, i64* }, { i64, i64*, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %arr, i64** %polly.subfn.storeaddr.arr, align 8
  %polly.subfn.storeaddr.call = getelementptr inbounds { i64, i64*, i64* }, { i64, i64*, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %call, i64** %polly.subfn.storeaddr.call, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_reverse__polly_subfn, i8* nonnull %55, i32 0, i64 0, i64 %arr_size, i64 1) #8
  %56 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %56)
  %57 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %57)
  %polly.subfunc.arg.arr_size.i = load i64, i64* %polly.subfn.storeaddr.arr_size, align 8
  %polly.subfunc.arg.arr.i = load i64*, i64** %polly.subfn.storeaddr.arr, align 8
  %polly.subfunc.arg.call.i = load i64*, i64** %polly.subfn.storeaddr.call, align 8
  %58 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %59 = icmp eq i8 %58, 0
  br i1 %59, label %_reverse__polly_subfn.exit, label %polly.par.loadIVBounds.preheader.i

polly.par.loadIVBounds.preheader.i:               ; preds = %polly.parallel.for
  %60 = add i64 %polly.subfunc.arg.arr_size.i, -1
  %scevgep2.i = getelementptr i64, i64* %polly.subfunc.arg.call.i, i64 %60
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %61 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %62 = icmp eq i8 %61, 0
  br i1 %62, label %_reverse__polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.checkNext.loopexit.i, %polly.par.loadIVBounds.preheader.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.arr.i, i64 %polly.indvar.i
  %_p_scalar_.i = load i64, i64* %scevgep.i, align 8, !alias.scope !14, !noalias !16
  %63 = sub i64 0, %polly.indvar.i
  %scevgep3.i = getelementptr i64, i64* %scevgep2.i, i64 %63
  store i64 %_p_scalar_.i, i64* %scevgep3.i, align 8, !alias.scope !17, !noalias !18
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

_reverse__polly_subfn.exit.loopexit:              ; preds = %polly.par.checkNext.loopexit.i
  br label %_reverse__polly_subfn.exit

_reverse__polly_subfn.exit:                       ; preds = %_reverse__polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %56)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %57)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %55)
  br label %blklab0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
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
  %3 = load i64*, i64** %call, align 8, !tbaa !19
  %call1 = call i64* @parseStringToInt(i64* %3) #8
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab4, label %if.end

if.end:                                           ; preds = %entry
  %4 = load i64, i64* %call1, align 8, !tbaa !1
  %call2 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #8
  %cmp370 = icmp sgt i64 %4, 0
  br i1 %cmp370, label %polly.parallel.for, label %blklab5

blklab5:                                          ; preds = %main_polly_subfn.exit, %if.end
  %call7 = call i64* @_reverse_(i64* %call2, i64 %4, i64* nonnull %_15_size)
  %5 = load i64, i64* %call7, align 8, !tbaa !1
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %5)
  %sub10 = add nsw i64 %4, -1
  %arrayidx11 = getelementptr inbounds i64, i64* %call7, i64 %sub10
  %6 = load i64, i64* %arrayidx11, align 8, !tbaa !1
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %6)
  %call13 = call i64* @create1DArray_int64_t(i64 0, i64 22) #8
  %7 = bitcast i64* %call13 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx16 = getelementptr inbounds i64, i64* %call13, i64 2
  %8 = bitcast i64* %arrayidx16 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx18 = getelementptr inbounds i64, i64* %call13, i64 4
  %9 = bitcast i64* %arrayidx18 to <2 x i64>*
  store <2 x i64> <i64 32, i64 82>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx20 = getelementptr inbounds i64, i64* %call13, i64 6
  %10 = bitcast i64* %arrayidx20 to <2 x i64>*
  store <2 x i64> <i64 101, i64 118>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx22 = getelementptr inbounds i64, i64* %call13, i64 8
  %11 = bitcast i64* %arrayidx22 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx24 = getelementptr inbounds i64, i64* %call13, i64 10
  %12 = bitcast i64* %arrayidx24 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx26 = getelementptr inbounds i64, i64* %call13, i64 12
  %13 = bitcast i64* %arrayidx26 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx28 = getelementptr inbounds i64, i64* %call13, i64 14
  %14 = bitcast i64* %arrayidx28 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx30 = getelementptr inbounds i64, i64* %call13, i64 16
  %15 = bitcast i64* %arrayidx30 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx32 = getelementptr inbounds i64, i64* %call13, i64 18
  %16 = bitcast i64* %arrayidx32 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx34 = getelementptr inbounds i64, i64* %call13, i64 20
  %17 = bitcast i64* %arrayidx34 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %17, align 8, !tbaa !1
  call void @println_s(i64* %call13, i64 22) #8
  br label %blklab4

blklab4:                                          ; preds = %entry, %blklab5
  call void @exit(i32 0) #9
  unreachable

polly.parallel.for:                               ; preds = %if.end
  %18 = bitcast { i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %18)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %4, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.call2 = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call2, i64** %polly.subfn.storeaddr.call2, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* nonnull %18, i32 0, i64 0, i64 %4, i64 1) #8
  %19 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %19)
  %20 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %20)
  %polly.subfunc.arg..i = load i64, i64* %polly.subfn.storeaddr., align 8
  %polly.subfunc.arg.call2.i = load i64*, i64** %polly.subfn.storeaddr.call2, align 8
  %21 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %main_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.parallel.for
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %23 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #8
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %main_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.call2.i, i64 %polly.indvar.i
  %25 = sub i64 %polly.subfunc.arg..i, %polly.indvar.i
  store i64 %25, i64* %scevgep.i, align 8, !alias.scope !21, !noalias !23
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

main_polly_subfn.exit.loopexit:                   ; preds = %polly.par.checkNext.loopexit.i
  br label %main_polly_subfn.exit

main_polly_subfn.exit:                            ; preds = %main_polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %19)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %20)
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end(i64 8, i8* nonnull %18)
  br label %blklab5
}

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #2

declare i64* @parseStringToInt(i64*) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #4

declare void @println_s(i64*, i64) local_unnamed_addr #2

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
  %polly.subfunc.arg.call = load i64*, i64** %4, align 8
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %7 = add i64 %polly.subfunc.arg.arr_size, -1
  %scevgep2 = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %7
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
  %polly.subfunc.arg.call2 = load i64*, i64** %2, align 8
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
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call2, i64 %polly.indvar
  %7 = sub i64 %polly.subfunc.arg., %polly.indvar
  store i64 %7, i64* %scevgep, align 8, !alias.scope !29, !noalias !23
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!17 = distinct !{!17, !15, !"polly.alias.scope.call"}
!18 = !{!14}
!19 = !{!20, !20, i64 0}
!20 = !{!"any pointer", !3, i64 0}
!21 = distinct !{!21, !22, !"polly.alias.scope.call2"}
!22 = distinct !{!22, !"polly.alias.scope.domain"}
!23 = !{}
!24 = distinct !{!24, !25, !"polly.alias.scope.arr"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27}
!27 = distinct !{!27, !25, !"polly.alias.scope.call"}
!28 = !{!24}
!29 = distinct !{!29, !30, !"polly.alias.scope.call2"}
!30 = distinct !{!30, !"polly.alias.scope.domain"}
