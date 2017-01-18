; ModuleID = 'Reverse_original.c'
source_filename = "Reverse_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_reverse_(i64* nocapture %arr, i64 %arr_size, i1 zeroext %arr_dealloc, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %0 = bitcast i64* %arr to i8*
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %arr_size) #6
  %cmp856 = icmp slt i64 %arr_size, 1
  br i1 %cmp856, label %blklab0, label %if.end10.preheader

if.end10.preheader:                               ; preds = %entry
  %1 = xor i64 %arr_size, -1
  %2 = icmp sgt i64 %1, -2
  %smax = select i1 %2, i64 %1, i64 -2
  %3 = add i64 %smax, %arr_size
  %4 = add i64 %3, 2
  %min.iters.check = icmp ult i64 %4, 4
  br i1 %min.iters.check, label %if.end10.preheader67, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end10.preheader
  %n.vec = and i64 %4, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end10.preheader67, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %5 = xor i64 %arr_size, -1
  %6 = icmp sgt i64 %5, -2
  %smax58 = select i1 %6, i64 %5, i64 -2
  %7 = sub i64 -2, %smax58
  %scevgep = getelementptr i64, i64* %call, i64 %7
  %scevgep60 = getelementptr i64, i64* %call, i64 %arr_size
  %8 = add i64 %smax58, %arr_size
  %9 = add i64 %8, 2
  %scevgep62 = getelementptr i64, i64* %arr, i64 %9
  %bound0 = icmp ult i64* %scevgep, %scevgep62
  %bound1 = icmp ugt i64* %scevgep60, %arr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = sub i64 %arr_size, %n.vec
  br i1 %memcheck.conflict, label %if.end10.preheader67, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %10 = add i64 %n.vec, -4
  %11 = lshr exact i64 %10, 2
  %12 = and i64 %11, 1
  %lcmp.mod = icmp eq i64 %12, 0
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %13 = bitcast i64* %arr to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %13, align 8, !tbaa !1, !alias.scope !5
  %14 = getelementptr i64, i64* %arr, i64 2
  %15 = bitcast i64* %14 to <2 x i64>*
  %wide.load65.prol = load <2 x i64>, <2 x i64>* %15, align 8, !tbaa !1, !alias.scope !5
  %16 = add nsw i64 %arr_size, -1
  %17 = getelementptr inbounds i64, i64* %call, i64 %16
  %reverse.prol = shufflevector <2 x i64> %wide.load.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %18 = getelementptr i64, i64* %17, i64 -1
  %19 = bitcast i64* %18 to <2 x i64>*
  store <2 x i64> %reverse.prol, <2 x i64>* %19, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse66.prol = shufflevector <2 x i64> %wide.load65.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %20 = getelementptr i64, i64* %17, i64 -2
  %21 = getelementptr i64, i64* %20, i64 -1
  %22 = bitcast i64* %21 to <2 x i64>*
  store <2 x i64> %reverse66.prol, <2 x i64>* %22, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %23 = icmp eq i64 %11, 0
  br i1 %23, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %offset.idx = sub i64 %arr_size, %index
  %24 = getelementptr inbounds i64, i64* %arr, i64 %index
  %25 = bitcast i64* %24 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %25, align 8, !tbaa !1, !alias.scope !5
  %26 = getelementptr i64, i64* %24, i64 2
  %27 = bitcast i64* %26 to <2 x i64>*
  %wide.load65 = load <2 x i64>, <2 x i64>* %27, align 8, !tbaa !1, !alias.scope !5
  %28 = add nsw i64 %offset.idx, -1
  %29 = getelementptr inbounds i64, i64* %call, i64 %28
  %reverse = shufflevector <2 x i64> %wide.load, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %30 = getelementptr i64, i64* %29, i64 -1
  %31 = bitcast i64* %30 to <2 x i64>*
  store <2 x i64> %reverse, <2 x i64>* %31, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse66 = shufflevector <2 x i64> %wide.load65, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %32 = getelementptr i64, i64* %29, i64 -2
  %33 = getelementptr i64, i64* %32, i64 -1
  %34 = bitcast i64* %33 to <2 x i64>*
  store <2 x i64> %reverse66, <2 x i64>* %34, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next = add i64 %index, 4
  %offset.idx.1 = sub i64 %arr_size, %index.next
  %35 = getelementptr inbounds i64, i64* %arr, i64 %index.next
  %36 = bitcast i64* %35 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %36, align 8, !tbaa !1, !alias.scope !5
  %37 = getelementptr i64, i64* %35, i64 2
  %38 = bitcast i64* %37 to <2 x i64>*
  %wide.load65.1 = load <2 x i64>, <2 x i64>* %38, align 8, !tbaa !1, !alias.scope !5
  %39 = add nsw i64 %offset.idx.1, -1
  %40 = getelementptr inbounds i64, i64* %call, i64 %39
  %reverse.1 = shufflevector <2 x i64> %wide.load.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %41 = getelementptr i64, i64* %40, i64 -1
  %42 = bitcast i64* %41 to <2 x i64>*
  store <2 x i64> %reverse.1, <2 x i64>* %42, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse66.1 = shufflevector <2 x i64> %wide.load65.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %43 = getelementptr i64, i64* %40, i64 -2
  %44 = getelementptr i64, i64* %43, i64 -1
  %45 = bitcast i64* %44 to <2 x i64>*
  store <2 x i64> %reverse66.1, <2 x i64>* %45, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next.1 = add i64 %index, 8
  %46 = icmp eq i64 %index.next.1, %n.vec
  br i1 %46, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !10

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %4, %n.vec
  br i1 %cmp.n, label %blklab0, label %if.end10.preheader67

if.end10.preheader67:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end10.preheader
  %i.057.ph = phi i64 [ %arr_size, %vector.memcheck ], [ %arr_size, %min.iters.checked ], [ %arr_size, %if.end10.preheader ], [ %ind.end, %middle.block ]
  br label %if.end10

if.end10:                                         ; preds = %if.end10.preheader67, %if.end10
  %i.057 = phi i64 [ %sub11, %if.end10 ], [ %i.057.ph, %if.end10.preheader67 ]
  %sub = sub nuw nsw i64 %arr_size, %i.057
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %sub
  %47 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %sub11 = add nsw i64 %i.057, -1
  %arrayidx12 = getelementptr inbounds i64, i64* %call, i64 %sub11
  store i64 %47, i64* %arrayidx12, align 8, !tbaa !1
  %cmp8 = icmp slt i64 %i.057, 2
  br i1 %cmp8, label %blklab0.loopexit, label %if.end10, !llvm.loop !13

blklab0.loopexit:                                 ; preds = %if.end10
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %middle.block, %entry
  br i1 %arr_dealloc, label %if.then14, label %if.end21

if.then14:                                        ; preds = %blklab0
  tail call void @free(i8* %0) #6
  br label %if.end21

if.end21:                                         ; preds = %if.then14, %blklab0
  store i64 %arr_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  ret i64* %call
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #4 {
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
  %not.cmp = icmp eq i64** %call, null
  %2 = load i64*, i64** %call, align 8, !tbaa !14
  %call3 = call i64* @parseStringToInt(i64* %2) #6
  %not.cmp4 = icmp eq i64* %call3, null
  br i1 %not.cmp4, label %if.end88, label %if.end14

if.end14:                                         ; preds = %entry
  %3 = load i64, i64* %call3, align 8, !tbaa !1
  %call18 = call i64* @create1DArray_int64_t(i64 0, i64 %3) #6
  %4 = bitcast i64* %call18 to i8*
  %not.cmp19 = icmp eq i64* %call18, null
  %cmp28170 = icmp sgt i64 %3, 0
  br i1 %cmp28170, label %if.end30.preheader, label %if.end34.thread

if.end30.preheader:                               ; preds = %if.end14
  %min.iters.check = icmp ult i64 %3, 4
  br i1 %min.iters.check, label %if.end30.preheader209, label %min.iters.checked

if.end30.preheader209:                            ; preds = %middle.block, %min.iters.checked, %if.end30.preheader
  %index.0171.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end30.preheader ], [ %n.vec, %middle.block ]
  br label %if.end30

min.iters.checked:                                ; preds = %if.end30.preheader
  %n.vec = and i64 %3, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end30.preheader209, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %3, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %5 = add i64 %n.vec, -4
  %6 = lshr exact i64 %5, 2
  %7 = and i64 %6, 1
  %lcmp.mod211 = icmp eq i64 %7, 0
  br i1 %lcmp.mod211, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %8 = add <2 x i64> %broadcast.splat, <i64 0, i64 -1>
  %9 = add <2 x i64> %broadcast.splat, <i64 -2, i64 -3>
  %10 = bitcast i64* %call18 to <2 x i64>*
  store <2 x i64> %8, <2 x i64>* %10, align 8, !tbaa !1
  %11 = getelementptr i64, i64* %call18, i64 2
  %12 = bitcast i64* %11 to <2 x i64>*
  store <2 x i64> %9, <2 x i64>* %12, align 8, !tbaa !1
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ 4, %vector.body.prol ]
  %vec.ind.unr = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph ], [ <i64 4, i64 5>, %vector.body.prol ]
  %13 = icmp eq i64 %6, 0
  br i1 %13, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <2 x i64> [ %vec.ind.unr, %vector.ph.new ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <2 x i64> %vec.ind, <i64 2, i64 2>
  %14 = sub nsw <2 x i64> %broadcast.splat, %vec.ind
  %15 = sub nsw <2 x i64> %broadcast.splat, %step.add
  %16 = getelementptr inbounds i64, i64* %call18, i64 %index
  %17 = bitcast i64* %16 to <2 x i64>*
  store <2 x i64> %14, <2 x i64>* %17, align 8, !tbaa !1
  %18 = getelementptr i64, i64* %16, i64 2
  %19 = bitcast i64* %18 to <2 x i64>*
  store <2 x i64> %15, <2 x i64>* %19, align 8, !tbaa !1
  %index.next = add i64 %index, 4
  %vec.ind.next = add <2 x i64> %vec.ind, <i64 4, i64 4>
  %step.add.1 = add <2 x i64> %vec.ind, <i64 6, i64 6>
  %20 = sub nsw <2 x i64> %broadcast.splat, %vec.ind.next
  %21 = sub nsw <2 x i64> %broadcast.splat, %step.add.1
  %22 = getelementptr inbounds i64, i64* %call18, i64 %index.next
  %23 = bitcast i64* %22 to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %23, align 8, !tbaa !1
  %24 = getelementptr i64, i64* %22, i64 2
  %25 = bitcast i64* %24 to <2 x i64>*
  store <2 x i64> %21, <2 x i64>* %25, align 8, !tbaa !1
  %index.next.1 = add i64 %index, 8
  %vec.ind.next.1 = add <2 x i64> %vec.ind, <i64 8, i64 8>
  %26 = icmp eq i64 %index.next.1, %n.vec
  br i1 %26, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !16

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %if.end34, label %if.end30.preheader209

if.end34.thread:                                  ; preds = %if.end14
  %call.i172 = call i64* @create1DArray_int64_t(i64 0, i64 %3) #6
  br label %_reverse_.exit

if.end30:                                         ; preds = %if.end30.preheader209, %if.end30
  %index.0171 = phi i64 [ %add, %if.end30 ], [ %index.0171.ph, %if.end30.preheader209 ]
  %sub = sub nsw i64 %3, %index.0171
  %arrayidx31 = getelementptr inbounds i64, i64* %call18, i64 %index.0171
  store i64 %sub, i64* %arrayidx31, align 8, !tbaa !1
  %add = add nuw nsw i64 %index.0171, 1
  %exitcond = icmp eq i64 %add, %3
  br i1 %exitcond, label %if.end34.loopexit, label %if.end30, !llvm.loop !17

if.end34.loopexit:                                ; preds = %if.end30
  br label %if.end34

if.end34:                                         ; preds = %if.end34.loopexit, %middle.block
  %call.i = call i64* @create1DArray_int64_t(i64 0, i64 %3) #6
  %cmp856.i = icmp slt i64 %3, 1
  br i1 %cmp856.i, label %_reverse_.exit, label %if.end10.i.preheader

if.end10.i.preheader:                             ; preds = %if.end34
  %27 = xor i64 %3, -1
  %28 = icmp sgt i64 %27, -2
  %smax = select i1 %28, i64 %27, i64 -2
  %29 = add i64 %3, %smax
  %30 = add i64 %29, 2
  %min.iters.check186 = icmp ult i64 %30, 4
  br i1 %min.iters.check186, label %if.end10.i.preheader208, label %min.iters.checked187

min.iters.checked187:                             ; preds = %if.end10.i.preheader
  %n.vec189 = and i64 %30, -4
  %cmp.zero190 = icmp eq i64 %n.vec189, 0
  br i1 %cmp.zero190, label %if.end10.i.preheader208, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked187
  %31 = xor i64 %3, -1
  %32 = icmp sgt i64 %31, -2
  %smax192 = select i1 %32, i64 %31, i64 -2
  %33 = sub i64 -2, %smax192
  %scevgep = getelementptr i64, i64* %call.i, i64 %33
  %scevgep194 = getelementptr i64, i64* %call.i, i64 %3
  %34 = add i64 %3, %smax192
  %35 = add i64 %34, 2
  %scevgep196 = getelementptr i64, i64* %call18, i64 %35
  %bound0 = icmp ult i64* %scevgep, %scevgep196
  %bound1 = icmp ult i64* %call18, %scevgep194
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = sub i64 %3, %n.vec189
  br i1 %memcheck.conflict, label %if.end10.i.preheader208, label %vector.body183.preheader

vector.body183.preheader:                         ; preds = %vector.memcheck
  %36 = add i64 %n.vec189, -4
  %37 = lshr exact i64 %36, 2
  %38 = and i64 %37, 1
  %lcmp.mod = icmp eq i64 %38, 0
  br i1 %lcmp.mod, label %vector.body183.prol.preheader, label %vector.body183.prol.loopexit

vector.body183.prol.preheader:                    ; preds = %vector.body183.preheader
  br label %vector.body183.prol

vector.body183.prol:                              ; preds = %vector.body183.prol.preheader
  %39 = bitcast i64* %call18 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %39, align 8, !tbaa !1, !alias.scope !19
  %40 = getelementptr i64, i64* %call18, i64 2
  %41 = bitcast i64* %40 to <2 x i64>*
  %wide.load206.prol = load <2 x i64>, <2 x i64>* %41, align 8, !tbaa !1, !alias.scope !19
  %42 = add nsw i64 %3, -1
  %43 = getelementptr inbounds i64, i64* %call.i, i64 %42
  %reverse.prol = shufflevector <2 x i64> %wide.load.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %44 = getelementptr i64, i64* %43, i64 -1
  %45 = bitcast i64* %44 to <2 x i64>*
  store <2 x i64> %reverse.prol, <2 x i64>* %45, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %reverse207.prol = shufflevector <2 x i64> %wide.load206.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %46 = getelementptr i64, i64* %43, i64 -2
  %47 = getelementptr i64, i64* %46, i64 -1
  %48 = bitcast i64* %47 to <2 x i64>*
  store <2 x i64> %reverse207.prol, <2 x i64>* %48, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  br label %vector.body183.prol.loopexit

vector.body183.prol.loopexit:                     ; preds = %vector.body183.prol, %vector.body183.preheader
  %index199.unr = phi i64 [ 0, %vector.body183.preheader ], [ 4, %vector.body183.prol ]
  %49 = icmp eq i64 %37, 0
  br i1 %49, label %middle.block184, label %vector.body183.preheader.new

vector.body183.preheader.new:                     ; preds = %vector.body183.prol.loopexit
  br label %vector.body183

vector.body183:                                   ; preds = %vector.body183, %vector.body183.preheader.new
  %index199 = phi i64 [ %index199.unr, %vector.body183.preheader.new ], [ %index.next200.1, %vector.body183 ]
  %offset.idx = sub i64 %3, %index199
  %50 = getelementptr inbounds i64, i64* %call18, i64 %index199
  %51 = bitcast i64* %50 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %51, align 8, !tbaa !1, !alias.scope !19
  %52 = getelementptr i64, i64* %50, i64 2
  %53 = bitcast i64* %52 to <2 x i64>*
  %wide.load206 = load <2 x i64>, <2 x i64>* %53, align 8, !tbaa !1, !alias.scope !19
  %54 = add nsw i64 %offset.idx, -1
  %55 = getelementptr inbounds i64, i64* %call.i, i64 %54
  %reverse = shufflevector <2 x i64> %wide.load, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %56 = getelementptr i64, i64* %55, i64 -1
  %57 = bitcast i64* %56 to <2 x i64>*
  store <2 x i64> %reverse, <2 x i64>* %57, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %reverse207 = shufflevector <2 x i64> %wide.load206, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %58 = getelementptr i64, i64* %55, i64 -2
  %59 = getelementptr i64, i64* %58, i64 -1
  %60 = bitcast i64* %59 to <2 x i64>*
  store <2 x i64> %reverse207, <2 x i64>* %60, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %index.next200 = add i64 %index199, 4
  %offset.idx.1 = sub i64 %3, %index.next200
  %61 = getelementptr inbounds i64, i64* %call18, i64 %index.next200
  %62 = bitcast i64* %61 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %62, align 8, !tbaa !1, !alias.scope !19
  %63 = getelementptr i64, i64* %61, i64 2
  %64 = bitcast i64* %63 to <2 x i64>*
  %wide.load206.1 = load <2 x i64>, <2 x i64>* %64, align 8, !tbaa !1, !alias.scope !19
  %65 = add nsw i64 %offset.idx.1, -1
  %66 = getelementptr inbounds i64, i64* %call.i, i64 %65
  %reverse.1 = shufflevector <2 x i64> %wide.load.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %67 = getelementptr i64, i64* %66, i64 -1
  %68 = bitcast i64* %67 to <2 x i64>*
  store <2 x i64> %reverse.1, <2 x i64>* %68, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %reverse207.1 = shufflevector <2 x i64> %wide.load206.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %69 = getelementptr i64, i64* %66, i64 -2
  %70 = getelementptr i64, i64* %69, i64 -1
  %71 = bitcast i64* %70 to <2 x i64>*
  store <2 x i64> %reverse207.1, <2 x i64>* %71, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %index.next200.1 = add i64 %index199, 8
  %72 = icmp eq i64 %index.next200.1, %n.vec189
  br i1 %72, label %middle.block184.unr-lcssa, label %vector.body183, !llvm.loop !24

middle.block184.unr-lcssa:                        ; preds = %vector.body183
  br label %middle.block184

middle.block184:                                  ; preds = %vector.body183.prol.loopexit, %middle.block184.unr-lcssa
  %cmp.n202 = icmp eq i64 %30, %n.vec189
  br i1 %cmp.n202, label %_reverse_.exit, label %if.end10.i.preheader208

if.end10.i.preheader208:                          ; preds = %middle.block184, %vector.memcheck, %min.iters.checked187, %if.end10.i.preheader
  %i.057.i.ph = phi i64 [ %3, %vector.memcheck ], [ %3, %min.iters.checked187 ], [ %3, %if.end10.i.preheader ], [ %ind.end, %middle.block184 ]
  br label %if.end10.i

if.end10.i:                                       ; preds = %if.end10.i.preheader208, %if.end10.i
  %i.057.i = phi i64 [ %sub11.i, %if.end10.i ], [ %i.057.i.ph, %if.end10.i.preheader208 ]
  %sub.i = sub nuw nsw i64 %3, %i.057.i
  %arrayidx.i = getelementptr inbounds i64, i64* %call18, i64 %sub.i
  %73 = load i64, i64* %arrayidx.i, align 8, !tbaa !1
  %sub11.i = add nsw i64 %i.057.i, -1
  %arrayidx12.i = getelementptr inbounds i64, i64* %call.i, i64 %sub11.i
  store i64 %73, i64* %arrayidx12.i, align 8, !tbaa !1
  %cmp8.i = icmp slt i64 %i.057.i, 2
  br i1 %cmp8.i, label %_reverse_.exit.loopexit, label %if.end10.i, !llvm.loop !25

_reverse_.exit.loopexit:                          ; preds = %if.end10.i
  br label %_reverse_.exit

_reverse_.exit:                                   ; preds = %_reverse_.exit.loopexit, %middle.block184, %if.end34.thread, %if.end34
  %call.i174 = phi i64* [ %call.i172, %if.end34.thread ], [ %call.i, %if.end34 ], [ %call.i, %middle.block184 ], [ %call.i, %_reverse_.exit.loopexit ]
  %not.cmp36 = icmp eq i64* %call.i174, null
  br i1 %not.cmp19, label %if.end82, label %if.then41

if.then41:                                        ; preds = %_reverse_.exit
  call void @free(i8* %4) #6
  br label %if.end82

if.end82:                                         ; preds = %if.then41, %_reverse_.exit
  %74 = load i64, i64* %call.i174, align 8, !tbaa !1
  %call46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %74)
  %sub47 = add nsw i64 %3, -1
  %arrayidx48 = getelementptr inbounds i64, i64* %call.i174, i64 %sub47
  %75 = load i64, i64* %arrayidx48, align 8, !tbaa !1
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %75)
  %call53 = call i64* @create1DArray_int64_t(i64 0, i64 22) #6
  %76 = bitcast i64* %call53 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %76, align 8, !tbaa !1
  %arrayidx56 = getelementptr inbounds i64, i64* %call53, i64 2
  %77 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %77, align 8, !tbaa !1
  %arrayidx58 = getelementptr inbounds i64, i64* %call53, i64 4
  %78 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 32, i64 82>, <2 x i64>* %78, align 8, !tbaa !1
  %arrayidx60 = getelementptr inbounds i64, i64* %call53, i64 6
  %79 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 101, i64 118>, <2 x i64>* %79, align 8, !tbaa !1
  %arrayidx62 = getelementptr inbounds i64, i64* %call53, i64 8
  %80 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %80, align 8, !tbaa !1
  %arrayidx64 = getelementptr inbounds i64, i64* %call53, i64 10
  %81 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %81, align 8, !tbaa !1
  %arrayidx66 = getelementptr inbounds i64, i64* %call53, i64 12
  %82 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %82, align 8, !tbaa !1
  %arrayidx68 = getelementptr inbounds i64, i64* %call53, i64 14
  %83 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %83, align 8, !tbaa !1
  %arrayidx70 = getelementptr inbounds i64, i64* %call53, i64 16
  %84 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %84, align 8, !tbaa !1
  %arrayidx72 = getelementptr inbounds i64, i64* %call53, i64 18
  %85 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %85, align 8, !tbaa !1
  %arrayidx74 = getelementptr inbounds i64, i64* %call53, i64 20
  %86 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %86, align 8, !tbaa !1
  %not.cmp76 = icmp ne i64* %call53, null
  %_27_dealloc.0 = zext i1 %not.cmp76 to i8
  call void @println_s(i64* %call53, i64 22) #6
  %phitmp = bitcast i64* %call53 to i8*
  %87 = bitcast i64* %call3 to i8*
  call void @free(i8* %87) #6
  br i1 %not.cmp36, label %if.end88, label %if.then84

if.then84:                                        ; preds = %if.end82
  %phitmp168 = bitcast i64* %call.i174 to i8*
  call void @free(i8* %phitmp168) #6
  br label %if.end88

if.end88:                                         ; preds = %if.end82, %entry, %if.then84
  %_27.0177181 = phi i8* [ %phitmp, %if.then84 ], [ %phitmp, %if.end82 ], [ null, %entry ]
  %_27_dealloc.1178180 = phi i8 [ %_27_dealloc.0, %if.then84 ], [ %_27_dealloc.0, %if.end82 ], [ 0, %entry ]
  br i1 %not.cmp, label %if.end100, label %if.then90

if.then90:                                        ; preds = %if.end88
  %88 = load i64, i64* %_6_size, align 8, !tbaa !1
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %88) #6
  br label %if.end100

if.end100:                                        ; preds = %if.end88, %if.then90
  %tobool101 = icmp eq i8 %_27_dealloc.1178180, 0
  br i1 %tobool101, label %if.end103, label %if.then102

if.then102:                                       ; preds = %if.end100
  call void @free(i8* %_27.0177181) #6
  br label %if.end103

if.end103:                                        ; preds = %if.end100, %if.then102
  call void @exit(i32 0) #7
  unreachable
}

declare void @free2DArray_int64_t(i64**, i64) local_unnamed_addr #3

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
