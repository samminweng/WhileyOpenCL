; ModuleID = 'Reverse_original.c'
source_filename = "Reverse_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_reverse_(i64* nocapture readonly %arr, i64 %arr_size, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %arr_size) #6
  %cmp30 = icmp slt i64 %arr_size, 1
  br i1 %cmp30, label %blklab0, label %if.end.preheader

if.end.preheader:                                 ; preds = %entry
  %0 = xor i64 %arr_size, -1
  %1 = icmp sgt i64 %0, -2
  %smax = select i1 %1, i64 %0, i64 -2
  %2 = add i64 %smax, %arr_size
  %3 = add i64 %2, 2
  %min.iters.check = icmp ult i64 %3, 4
  br i1 %min.iters.check, label %if.end.preheader42, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end.preheader
  %n.vec = and i64 %3, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end.preheader42, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %4 = xor i64 %arr_size, -1
  %5 = icmp sgt i64 %4, -2
  %smax32 = select i1 %5, i64 %4, i64 -2
  %6 = sub i64 -2, %smax32
  %scevgep = getelementptr i64, i64* %call, i64 %6
  %scevgep34 = getelementptr i64, i64* %call, i64 %arr_size
  %7 = add i64 %smax32, %arr_size
  %8 = add i64 %7, 2
  %scevgep37 = getelementptr i64, i64* %arr, i64 %8
  %bound0 = icmp ult i64* %scevgep, %scevgep37
  %bound1 = icmp ugt i64* %scevgep34, %arr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = sub i64 %arr_size, %n.vec
  br i1 %memcheck.conflict, label %if.end.preheader42, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %9 = add i64 %n.vec, -4
  %10 = lshr exact i64 %9, 2
  %11 = and i64 %10, 1
  %lcmp.mod = icmp eq i64 %11, 0
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %12 = bitcast i64* %arr to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %12, align 8, !tbaa !1, !alias.scope !5
  %13 = getelementptr i64, i64* %arr, i64 2
  %14 = bitcast i64* %13 to <2 x i64>*
  %wide.load40.prol = load <2 x i64>, <2 x i64>* %14, align 8, !tbaa !1, !alias.scope !5
  %15 = add nsw i64 %arr_size, -1
  %16 = getelementptr inbounds i64, i64* %call, i64 %15
  %reverse.prol = shufflevector <2 x i64> %wide.load.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %17 = getelementptr i64, i64* %16, i64 -1
  %18 = bitcast i64* %17 to <2 x i64>*
  store <2 x i64> %reverse.prol, <2 x i64>* %18, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse41.prol = shufflevector <2 x i64> %wide.load40.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %19 = getelementptr i64, i64* %16, i64 -2
  %20 = getelementptr i64, i64* %19, i64 -1
  %21 = bitcast i64* %20 to <2 x i64>*
  store <2 x i64> %reverse41.prol, <2 x i64>* %21, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %22 = icmp eq i64 %10, 0
  br i1 %22, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %offset.idx = sub i64 %arr_size, %index
  %23 = getelementptr inbounds i64, i64* %arr, i64 %index
  %24 = bitcast i64* %23 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %24, align 8, !tbaa !1, !alias.scope !5
  %25 = getelementptr i64, i64* %23, i64 2
  %26 = bitcast i64* %25 to <2 x i64>*
  %wide.load40 = load <2 x i64>, <2 x i64>* %26, align 8, !tbaa !1, !alias.scope !5
  %27 = add nsw i64 %offset.idx, -1
  %28 = getelementptr inbounds i64, i64* %call, i64 %27
  %reverse = shufflevector <2 x i64> %wide.load, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %29 = getelementptr i64, i64* %28, i64 -1
  %30 = bitcast i64* %29 to <2 x i64>*
  store <2 x i64> %reverse, <2 x i64>* %30, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse41 = shufflevector <2 x i64> %wide.load40, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %31 = getelementptr i64, i64* %28, i64 -2
  %32 = getelementptr i64, i64* %31, i64 -1
  %33 = bitcast i64* %32 to <2 x i64>*
  store <2 x i64> %reverse41, <2 x i64>* %33, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next = add i64 %index, 4
  %offset.idx.1 = sub i64 %arr_size, %index.next
  %34 = getelementptr inbounds i64, i64* %arr, i64 %index.next
  %35 = bitcast i64* %34 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %35, align 8, !tbaa !1, !alias.scope !5
  %36 = getelementptr i64, i64* %34, i64 2
  %37 = bitcast i64* %36 to <2 x i64>*
  %wide.load40.1 = load <2 x i64>, <2 x i64>* %37, align 8, !tbaa !1, !alias.scope !5
  %38 = add nsw i64 %offset.idx.1, -1
  %39 = getelementptr inbounds i64, i64* %call, i64 %38
  %reverse.1 = shufflevector <2 x i64> %wide.load.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %40 = getelementptr i64, i64* %39, i64 -1
  %41 = bitcast i64* %40 to <2 x i64>*
  store <2 x i64> %reverse.1, <2 x i64>* %41, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse41.1 = shufflevector <2 x i64> %wide.load40.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %42 = getelementptr i64, i64* %39, i64 -2
  %43 = getelementptr i64, i64* %42, i64 -1
  %44 = bitcast i64* %43 to <2 x i64>*
  store <2 x i64> %reverse41.1, <2 x i64>* %44, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next.1 = add i64 %index, 8
  %45 = icmp eq i64 %index.next.1, %n.vec
  br i1 %45, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !10

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %blklab0, label %if.end.preheader42

if.end.preheader42:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end.preheader
  %i.031.ph = phi i64 [ %arr_size, %vector.memcheck ], [ %arr_size, %min.iters.checked ], [ %arr_size, %if.end.preheader ], [ %ind.end, %middle.block ]
  br label %if.end

if.end:                                           ; preds = %if.end.preheader42, %if.end
  %i.031 = phi i64 [ %sub1, %if.end ], [ %i.031.ph, %if.end.preheader42 ]
  %sub = sub nuw nsw i64 %arr_size, %i.031
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %sub
  %46 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %sub1 = add nsw i64 %i.031, -1
  %arrayidx2 = getelementptr inbounds i64, i64* %call, i64 %sub1
  store i64 %46, i64* %arrayidx2, align 8, !tbaa !1
  %cmp = icmp slt i64 %i.031, 2
  br i1 %cmp, label %blklab0.loopexit, label %if.end, !llvm.loop !13

blklab0.loopexit:                                 ; preds = %if.end
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %middle.block, %entry
  store i64 %arr_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  ret i64* %call
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
entry:
  %_6_size = alloca i64, align 8
  %_6_size_size = alloca i64, align 8
  %0 = bitcast i64* %_6_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #6
  store i64 0, i64* %_6_size, align 8, !tbaa !1
  %1 = bitcast i64* %_6_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #6
  store i64 0, i64* %_6_size_size, align 8, !tbaa !1
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_6_size, i64* nonnull %_6_size_size) #6
  %2 = load i64*, i64** %call, align 8, !tbaa !14
  %call1 = call i64* @parseStringToInt(i64* %2) #6
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab4, label %if.end

if.end:                                           ; preds = %entry
  %3 = load i64, i64* %call1, align 8, !tbaa !1
  %call2 = call i64* @create1DArray_int64_t(i64 0, i64 %3) #6
  %cmp370 = icmp sgt i64 %3, 0
  br i1 %cmp370, label %if.end5.preheader, label %blklab5.thread

if.end5.preheader:                                ; preds = %if.end
  %min.iters.check = icmp ult i64 %3, 4
  br i1 %min.iters.check, label %if.end5.preheader103, label %min.iters.checked

if.end5.preheader103:                             ; preds = %middle.block, %min.iters.checked, %if.end5.preheader
  %index.071.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end5.preheader ], [ %n.vec, %middle.block ]
  br label %if.end5

min.iters.checked:                                ; preds = %if.end5.preheader
  %n.vec = and i64 %3, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end5.preheader103, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %3, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %4 = add i64 %n.vec, -4
  %5 = lshr exact i64 %4, 2
  %6 = and i64 %5, 1
  %lcmp.mod105 = icmp eq i64 %6, 0
  br i1 %lcmp.mod105, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %7 = add <2 x i64> %broadcast.splat, <i64 0, i64 -1>
  %8 = add <2 x i64> %broadcast.splat, <i64 -2, i64 -3>
  %9 = bitcast i64* %call2 to <2 x i64>*
  store <2 x i64> %7, <2 x i64>* %9, align 8, !tbaa !1
  %10 = getelementptr i64, i64* %call2, i64 2
  %11 = bitcast i64* %10 to <2 x i64>*
  store <2 x i64> %8, <2 x i64>* %11, align 8, !tbaa !1
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ 4, %vector.body.prol ]
  %vec.ind.unr = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph ], [ <i64 4, i64 5>, %vector.body.prol ]
  %12 = icmp eq i64 %5, 0
  br i1 %12, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <2 x i64> [ %vec.ind.unr, %vector.ph.new ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <2 x i64> %vec.ind, <i64 2, i64 2>
  %13 = sub nsw <2 x i64> %broadcast.splat, %vec.ind
  %14 = sub nsw <2 x i64> %broadcast.splat, %step.add
  %15 = getelementptr inbounds i64, i64* %call2, i64 %index
  %16 = bitcast i64* %15 to <2 x i64>*
  store <2 x i64> %13, <2 x i64>* %16, align 8, !tbaa !1
  %17 = getelementptr i64, i64* %15, i64 2
  %18 = bitcast i64* %17 to <2 x i64>*
  store <2 x i64> %14, <2 x i64>* %18, align 8, !tbaa !1
  %index.next = add i64 %index, 4
  %vec.ind.next = add <2 x i64> %vec.ind, <i64 4, i64 4>
  %step.add.1 = add <2 x i64> %vec.ind, <i64 6, i64 6>
  %19 = sub nsw <2 x i64> %broadcast.splat, %vec.ind.next
  %20 = sub nsw <2 x i64> %broadcast.splat, %step.add.1
  %21 = getelementptr inbounds i64, i64* %call2, i64 %index.next
  %22 = bitcast i64* %21 to <2 x i64>*
  store <2 x i64> %19, <2 x i64>* %22, align 8, !tbaa !1
  %23 = getelementptr i64, i64* %21, i64 2
  %24 = bitcast i64* %23 to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %24, align 8, !tbaa !1
  %index.next.1 = add i64 %index, 8
  %vec.ind.next.1 = add <2 x i64> %vec.ind, <i64 8, i64 8>
  %25 = icmp eq i64 %index.next.1, %n.vec
  br i1 %25, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !16

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %blklab5, label %if.end5.preheader103

blklab5.thread:                                   ; preds = %if.end
  %call.i72 = call i64* @create1DArray_int64_t(i64 0, i64 %3) #6
  br label %_reverse_.exit

if.end5:                                          ; preds = %if.end5.preheader103, %if.end5
  %index.071 = phi i64 [ %add, %if.end5 ], [ %index.071.ph, %if.end5.preheader103 ]
  %sub = sub nsw i64 %3, %index.071
  %arrayidx6 = getelementptr inbounds i64, i64* %call2, i64 %index.071
  store i64 %sub, i64* %arrayidx6, align 8, !tbaa !1
  %add = add nuw nsw i64 %index.071, 1
  %exitcond = icmp eq i64 %add, %3
  br i1 %exitcond, label %blklab5.loopexit, label %if.end5, !llvm.loop !17

blklab5.loopexit:                                 ; preds = %if.end5
  br label %blklab5

blklab5:                                          ; preds = %blklab5.loopexit, %middle.block
  %call.i = call i64* @create1DArray_int64_t(i64 0, i64 %3) #6
  %cmp30.i = icmp slt i64 %3, 1
  br i1 %cmp30.i, label %_reverse_.exit, label %if.end.i.preheader

if.end.i.preheader:                               ; preds = %blklab5
  %26 = xor i64 %3, -1
  %27 = icmp sgt i64 %26, -2
  %smax = select i1 %27, i64 %26, i64 -2
  %28 = add i64 %3, %smax
  %29 = add i64 %28, 2
  %min.iters.check79 = icmp ult i64 %29, 4
  br i1 %min.iters.check79, label %if.end.i.preheader102, label %min.iters.checked80

min.iters.checked80:                              ; preds = %if.end.i.preheader
  %n.vec82 = and i64 %29, -4
  %cmp.zero83 = icmp eq i64 %n.vec82, 0
  br i1 %cmp.zero83, label %if.end.i.preheader102, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked80
  %30 = xor i64 %3, -1
  %31 = icmp sgt i64 %30, -2
  %smax85 = select i1 %31, i64 %30, i64 -2
  %32 = sub i64 -2, %smax85
  %scevgep = getelementptr i64, i64* %call.i, i64 %32
  %scevgep87 = getelementptr i64, i64* %call.i, i64 %3
  %33 = add i64 %3, %smax85
  %34 = add i64 %33, 2
  %scevgep90 = getelementptr i64, i64* %call2, i64 %34
  %bound0 = icmp ult i64* %scevgep, %scevgep90
  %bound1 = icmp ult i64* %call2, %scevgep87
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = sub i64 %3, %n.vec82
  br i1 %memcheck.conflict, label %if.end.i.preheader102, label %vector.body76.preheader

vector.body76.preheader:                          ; preds = %vector.memcheck
  %35 = add i64 %n.vec82, -4
  %36 = lshr exact i64 %35, 2
  %37 = and i64 %36, 1
  %lcmp.mod = icmp eq i64 %37, 0
  br i1 %lcmp.mod, label %vector.body76.prol.preheader, label %vector.body76.prol.loopexit

vector.body76.prol.preheader:                     ; preds = %vector.body76.preheader
  br label %vector.body76.prol

vector.body76.prol:                               ; preds = %vector.body76.prol.preheader
  %38 = bitcast i64* %call2 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %38, align 8, !tbaa !1, !alias.scope !19
  %39 = getelementptr i64, i64* %call2, i64 2
  %40 = bitcast i64* %39 to <2 x i64>*
  %wide.load100.prol = load <2 x i64>, <2 x i64>* %40, align 8, !tbaa !1, !alias.scope !19
  %41 = add nsw i64 %3, -1
  %42 = getelementptr inbounds i64, i64* %call.i, i64 %41
  %reverse.prol = shufflevector <2 x i64> %wide.load.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %43 = getelementptr i64, i64* %42, i64 -1
  %44 = bitcast i64* %43 to <2 x i64>*
  store <2 x i64> %reverse.prol, <2 x i64>* %44, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %reverse101.prol = shufflevector <2 x i64> %wide.load100.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %45 = getelementptr i64, i64* %42, i64 -2
  %46 = getelementptr i64, i64* %45, i64 -1
  %47 = bitcast i64* %46 to <2 x i64>*
  store <2 x i64> %reverse101.prol, <2 x i64>* %47, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  br label %vector.body76.prol.loopexit

vector.body76.prol.loopexit:                      ; preds = %vector.body76.prol, %vector.body76.preheader
  %index93.unr = phi i64 [ 0, %vector.body76.preheader ], [ 4, %vector.body76.prol ]
  %48 = icmp eq i64 %36, 0
  br i1 %48, label %middle.block77, label %vector.body76.preheader.new

vector.body76.preheader.new:                      ; preds = %vector.body76.prol.loopexit
  br label %vector.body76

vector.body76:                                    ; preds = %vector.body76, %vector.body76.preheader.new
  %index93 = phi i64 [ %index93.unr, %vector.body76.preheader.new ], [ %index.next94.1, %vector.body76 ]
  %offset.idx = sub i64 %3, %index93
  %49 = getelementptr inbounds i64, i64* %call2, i64 %index93
  %50 = bitcast i64* %49 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %50, align 8, !tbaa !1, !alias.scope !19
  %51 = getelementptr i64, i64* %49, i64 2
  %52 = bitcast i64* %51 to <2 x i64>*
  %wide.load100 = load <2 x i64>, <2 x i64>* %52, align 8, !tbaa !1, !alias.scope !19
  %53 = add nsw i64 %offset.idx, -1
  %54 = getelementptr inbounds i64, i64* %call.i, i64 %53
  %reverse = shufflevector <2 x i64> %wide.load, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %55 = getelementptr i64, i64* %54, i64 -1
  %56 = bitcast i64* %55 to <2 x i64>*
  store <2 x i64> %reverse, <2 x i64>* %56, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %reverse101 = shufflevector <2 x i64> %wide.load100, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %57 = getelementptr i64, i64* %54, i64 -2
  %58 = getelementptr i64, i64* %57, i64 -1
  %59 = bitcast i64* %58 to <2 x i64>*
  store <2 x i64> %reverse101, <2 x i64>* %59, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %index.next94 = add i64 %index93, 4
  %offset.idx.1 = sub i64 %3, %index.next94
  %60 = getelementptr inbounds i64, i64* %call2, i64 %index.next94
  %61 = bitcast i64* %60 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %61, align 8, !tbaa !1, !alias.scope !19
  %62 = getelementptr i64, i64* %60, i64 2
  %63 = bitcast i64* %62 to <2 x i64>*
  %wide.load100.1 = load <2 x i64>, <2 x i64>* %63, align 8, !tbaa !1, !alias.scope !19
  %64 = add nsw i64 %offset.idx.1, -1
  %65 = getelementptr inbounds i64, i64* %call.i, i64 %64
  %reverse.1 = shufflevector <2 x i64> %wide.load.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %66 = getelementptr i64, i64* %65, i64 -1
  %67 = bitcast i64* %66 to <2 x i64>*
  store <2 x i64> %reverse.1, <2 x i64>* %67, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %reverse101.1 = shufflevector <2 x i64> %wide.load100.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %68 = getelementptr i64, i64* %65, i64 -2
  %69 = getelementptr i64, i64* %68, i64 -1
  %70 = bitcast i64* %69 to <2 x i64>*
  store <2 x i64> %reverse101.1, <2 x i64>* %70, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %index.next94.1 = add i64 %index93, 8
  %71 = icmp eq i64 %index.next94.1, %n.vec82
  br i1 %71, label %middle.block77.unr-lcssa, label %vector.body76, !llvm.loop !24

middle.block77.unr-lcssa:                         ; preds = %vector.body76
  br label %middle.block77

middle.block77:                                   ; preds = %vector.body76.prol.loopexit, %middle.block77.unr-lcssa
  %cmp.n96 = icmp eq i64 %29, %n.vec82
  br i1 %cmp.n96, label %_reverse_.exit, label %if.end.i.preheader102

if.end.i.preheader102:                            ; preds = %middle.block77, %vector.memcheck, %min.iters.checked80, %if.end.i.preheader
  %i.031.i.ph = phi i64 [ %3, %vector.memcheck ], [ %3, %min.iters.checked80 ], [ %3, %if.end.i.preheader ], [ %ind.end, %middle.block77 ]
  br label %if.end.i

if.end.i:                                         ; preds = %if.end.i.preheader102, %if.end.i
  %i.031.i = phi i64 [ %sub1.i, %if.end.i ], [ %i.031.i.ph, %if.end.i.preheader102 ]
  %sub.i = sub nuw nsw i64 %3, %i.031.i
  %arrayidx.i = getelementptr inbounds i64, i64* %call2, i64 %sub.i
  %72 = load i64, i64* %arrayidx.i, align 8, !tbaa !1
  %sub1.i = add nsw i64 %i.031.i, -1
  %arrayidx2.i = getelementptr inbounds i64, i64* %call.i, i64 %sub1.i
  store i64 %72, i64* %arrayidx2.i, align 8, !tbaa !1
  %cmp.i = icmp slt i64 %i.031.i, 2
  br i1 %cmp.i, label %_reverse_.exit.loopexit, label %if.end.i, !llvm.loop !25

_reverse_.exit.loopexit:                          ; preds = %if.end.i
  br label %_reverse_.exit

_reverse_.exit:                                   ; preds = %_reverse_.exit.loopexit, %middle.block77, %blklab5.thread, %blklab5
  %call.i74 = phi i64* [ %call.i72, %blklab5.thread ], [ %call.i, %blklab5 ], [ %call.i, %middle.block77 ], [ %call.i, %_reverse_.exit.loopexit ]
  %73 = load i64, i64* %call.i74, align 8, !tbaa !1
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %73)
  %sub10 = add nsw i64 %3, -1
  %arrayidx11 = getelementptr inbounds i64, i64* %call.i74, i64 %sub10
  %74 = load i64, i64* %arrayidx11, align 8, !tbaa !1
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %74)
  %call13 = call i64* @create1DArray_int64_t(i64 0, i64 22) #6
  %75 = bitcast i64* %call13 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %75, align 8, !tbaa !1
  %arrayidx16 = getelementptr inbounds i64, i64* %call13, i64 2
  %76 = bitcast i64* %arrayidx16 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %76, align 8, !tbaa !1
  %arrayidx18 = getelementptr inbounds i64, i64* %call13, i64 4
  %77 = bitcast i64* %arrayidx18 to <2 x i64>*
  store <2 x i64> <i64 32, i64 82>, <2 x i64>* %77, align 8, !tbaa !1
  %arrayidx20 = getelementptr inbounds i64, i64* %call13, i64 6
  %78 = bitcast i64* %arrayidx20 to <2 x i64>*
  store <2 x i64> <i64 101, i64 118>, <2 x i64>* %78, align 8, !tbaa !1
  %arrayidx22 = getelementptr inbounds i64, i64* %call13, i64 8
  %79 = bitcast i64* %arrayidx22 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %79, align 8, !tbaa !1
  %arrayidx24 = getelementptr inbounds i64, i64* %call13, i64 10
  %80 = bitcast i64* %arrayidx24 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %80, align 8, !tbaa !1
  %arrayidx26 = getelementptr inbounds i64, i64* %call13, i64 12
  %81 = bitcast i64* %arrayidx26 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %81, align 8, !tbaa !1
  %arrayidx28 = getelementptr inbounds i64, i64* %call13, i64 14
  %82 = bitcast i64* %arrayidx28 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %82, align 8, !tbaa !1
  %arrayidx30 = getelementptr inbounds i64, i64* %call13, i64 16
  %83 = bitcast i64* %arrayidx30 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %83, align 8, !tbaa !1
  %arrayidx32 = getelementptr inbounds i64, i64* %call13, i64 18
  %84 = bitcast i64* %arrayidx32 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %84, align 8, !tbaa !1
  %arrayidx34 = getelementptr inbounds i64, i64* %call13, i64 20
  %85 = bitcast i64* %arrayidx34 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %85, align 8, !tbaa !1
  call void @println_s(i64* %call13, i64 22) #6
  br label %blklab4

blklab4:                                          ; preds = %entry, %_reverse_.exit
  call void @exit(i32 0) #7
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #2

declare i64* @parseStringToInt(i64*) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #4

declare void @println_s(i64*, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

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
!14 = !{!15, !15, i64 0}
!15 = !{!"any pointer", !3, i64 0}
!16 = distinct !{!16, !11, !12}
!17 = distinct !{!17, !18, !11, !12}
!18 = !{!"llvm.loop.unroll.runtime.disable"}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !11, !12}
!25 = distinct !{!25, !11, !12}
