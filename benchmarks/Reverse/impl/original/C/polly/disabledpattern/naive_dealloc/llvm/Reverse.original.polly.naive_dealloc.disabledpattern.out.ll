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
  %not.cmp = icmp eq i64* %call, null
  %call6 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 %arr_size) #6
  %cmp1160 = icmp slt i64 %arr_size, 1
  br i1 %cmp1160, label %blklab0, label %if.end13.preheader

if.end13.preheader:                               ; preds = %entry
  %1 = xor i64 %arr_size, -1
  %2 = icmp sgt i64 %1, -2
  %smax = select i1 %2, i64 %1, i64 -2
  %3 = add i64 %smax, %arr_size
  %4 = add i64 %3, 2
  %min.iters.check = icmp ult i64 %4, 4
  br i1 %min.iters.check, label %if.end13.preheader71, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end13.preheader
  %n.vec = and i64 %4, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end13.preheader71, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %5 = xor i64 %arr_size, -1
  %6 = icmp sgt i64 %5, -2
  %smax62 = select i1 %6, i64 %5, i64 -2
  %7 = sub i64 -2, %smax62
  %scevgep = getelementptr i64, i64* %call6, i64 %7
  %scevgep64 = getelementptr i64, i64* %call6, i64 %arr_size
  %8 = add i64 %smax62, %arr_size
  %9 = add i64 %8, 2
  %scevgep66 = getelementptr i64, i64* %arr, i64 %9
  %bound0 = icmp ult i64* %scevgep, %scevgep66
  %bound1 = icmp ugt i64* %scevgep64, %arr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = sub i64 %arr_size, %n.vec
  br i1 %memcheck.conflict, label %if.end13.preheader71, label %vector.body.preheader

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
  %wide.load69.prol = load <2 x i64>, <2 x i64>* %15, align 8, !tbaa !1, !alias.scope !5
  %16 = add nsw i64 %arr_size, -1
  %17 = getelementptr inbounds i64, i64* %call6, i64 %16
  %reverse.prol = shufflevector <2 x i64> %wide.load.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %18 = getelementptr i64, i64* %17, i64 -1
  %19 = bitcast i64* %18 to <2 x i64>*
  store <2 x i64> %reverse.prol, <2 x i64>* %19, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse70.prol = shufflevector <2 x i64> %wide.load69.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %20 = getelementptr i64, i64* %17, i64 -2
  %21 = getelementptr i64, i64* %20, i64 -1
  %22 = bitcast i64* %21 to <2 x i64>*
  store <2 x i64> %reverse70.prol, <2 x i64>* %22, align 8, !tbaa !1, !alias.scope !8, !noalias !5
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
  %wide.load69 = load <2 x i64>, <2 x i64>* %27, align 8, !tbaa !1, !alias.scope !5
  %28 = add nsw i64 %offset.idx, -1
  %29 = getelementptr inbounds i64, i64* %call6, i64 %28
  %reverse = shufflevector <2 x i64> %wide.load, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %30 = getelementptr i64, i64* %29, i64 -1
  %31 = bitcast i64* %30 to <2 x i64>*
  store <2 x i64> %reverse, <2 x i64>* %31, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse70 = shufflevector <2 x i64> %wide.load69, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %32 = getelementptr i64, i64* %29, i64 -2
  %33 = getelementptr i64, i64* %32, i64 -1
  %34 = bitcast i64* %33 to <2 x i64>*
  store <2 x i64> %reverse70, <2 x i64>* %34, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next = add i64 %index, 4
  %offset.idx.1 = sub i64 %arr_size, %index.next
  %35 = getelementptr inbounds i64, i64* %arr, i64 %index.next
  %36 = bitcast i64* %35 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %36, align 8, !tbaa !1, !alias.scope !5
  %37 = getelementptr i64, i64* %35, i64 2
  %38 = bitcast i64* %37 to <2 x i64>*
  %wide.load69.1 = load <2 x i64>, <2 x i64>* %38, align 8, !tbaa !1, !alias.scope !5
  %39 = add nsw i64 %offset.idx.1, -1
  %40 = getelementptr inbounds i64, i64* %call6, i64 %39
  %reverse.1 = shufflevector <2 x i64> %wide.load.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %41 = getelementptr i64, i64* %40, i64 -1
  %42 = bitcast i64* %41 to <2 x i64>*
  store <2 x i64> %reverse.1, <2 x i64>* %42, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse70.1 = shufflevector <2 x i64> %wide.load69.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %43 = getelementptr i64, i64* %40, i64 -2
  %44 = getelementptr i64, i64* %43, i64 -1
  %45 = bitcast i64* %44 to <2 x i64>*
  store <2 x i64> %reverse70.1, <2 x i64>* %45, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next.1 = add i64 %index, 8
  %46 = icmp eq i64 %index.next.1, %n.vec
  br i1 %46, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !10

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %4, %n.vec
  br i1 %cmp.n, label %blklab0, label %if.end13.preheader71

if.end13.preheader71:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end13.preheader
  %i.061.ph = phi i64 [ %arr_size, %vector.memcheck ], [ %arr_size, %min.iters.checked ], [ %arr_size, %if.end13.preheader ], [ %ind.end, %middle.block ]
  br label %if.end13

if.end13:                                         ; preds = %if.end13.preheader71, %if.end13
  %i.061 = phi i64 [ %sub14, %if.end13 ], [ %i.061.ph, %if.end13.preheader71 ]
  %sub = sub nuw nsw i64 %arr_size, %i.061
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %sub
  %47 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %sub14 = add nsw i64 %i.061, -1
  %arrayidx15 = getelementptr inbounds i64, i64* %call6, i64 %sub14
  store i64 %47, i64* %arrayidx15, align 8, !tbaa !1
  %cmp11 = icmp slt i64 %i.061, 2
  br i1 %cmp11, label %blklab0.loopexit, label %if.end13, !llvm.loop !13

blklab0.loopexit:                                 ; preds = %if.end13
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %middle.block, %entry
  br i1 %arr_dealloc, label %if.then17, label %if.end21

if.then17:                                        ; preds = %blklab0
  tail call void @free(i8* %0) #6
  br label %if.end21

if.end21:                                         ; preds = %blklab0, %if.then17
  br i1 %not.cmp, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end21
  %48 = bitcast i64* %call to i8*
  tail call void @free(i8* %48) #6
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %if.then23
  store i64 %arr_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  ret i64* %call6
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #3

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
  %3 = load i64, i64* %call3, align 8, !tbaa !1
  %call22 = call i64* @create1DArray_int64_t(i64 0, i64 %3) #6
  %not.cmp23 = icmp eq i64* %call22, null
  %call30 = call i64* @copy1DArray_int64_t(i64* %call22, i64 %3) #6
  %not.cmp31 = icmp eq i64* %call30, null
  %cmp35190 = icmp sgt i64 %3, 0
  br i1 %cmp35190, label %if.end37.preheader, label %if.end42

if.end37.preheader:                               ; preds = %entry
  %min.iters.check = icmp ult i64 %3, 4
  br i1 %min.iters.check, label %if.end37.preheader234, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end37.preheader
  %n.vec = and i64 %3, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end37.preheader234, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %3, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %4 = add i64 %n.vec, -4
  %5 = lshr exact i64 %4, 2
  %6 = and i64 %5, 1
  %lcmp.mod236 = icmp eq i64 %6, 0
  br i1 %lcmp.mod236, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %7 = add <2 x i64> %broadcast.splat, <i64 0, i64 -1>
  %8 = add <2 x i64> %broadcast.splat, <i64 -2, i64 -3>
  %9 = bitcast i64* %call30 to <2 x i64>*
  store <2 x i64> %7, <2 x i64>* %9, align 8, !tbaa !1
  %10 = getelementptr i64, i64* %call30, i64 2
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
  %15 = getelementptr inbounds i64, i64* %call30, i64 %index
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
  %21 = getelementptr inbounds i64, i64* %call30, i64 %index.next
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
  br i1 %cmp.n, label %if.end42, label %if.end37.preheader234

if.end37.preheader234:                            ; preds = %middle.block, %min.iters.checked, %if.end37.preheader
  %index.0191.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end37.preheader ], [ %n.vec, %middle.block ]
  br label %if.end37

if.end37:                                         ; preds = %if.end37.preheader234, %if.end37
  %index.0191 = phi i64 [ %add, %if.end37 ], [ %index.0191.ph, %if.end37.preheader234 ]
  %sub = sub nsw i64 %3, %index.0191
  %arrayidx38 = getelementptr inbounds i64, i64* %call30, i64 %index.0191
  store i64 %sub, i64* %arrayidx38, align 8, !tbaa !1
  %add = add nuw nsw i64 %index.0191, 1
  %exitcond = icmp eq i64 %add, %3
  br i1 %exitcond, label %if.end42.loopexit, label %if.end37, !llvm.loop !17

if.end42.loopexit:                                ; preds = %if.end37
  br label %if.end42

if.end42:                                         ; preds = %if.end42.loopexit, %middle.block, %entry
  %call43 = call i64* @copy1DArray_int64_t(i64* %call30, i64 %3) #6
  %26 = bitcast i64* %call43 to i8*
  %call.i = call i64* @create1DArray_int64_t(i64 0, i64 %3) #6
  %not.cmp.i = icmp eq i64* %call.i, null
  %call6.i = call i64* @copy1DArray_int64_t(i64* %call.i, i64 %3) #6
  %cmp1160.i = icmp slt i64 %3, 1
  br i1 %cmp1160.i, label %blklab0.i, label %if.end13.i.preheader

if.end13.i.preheader:                             ; preds = %if.end42
  %27 = xor i64 %3, -1
  %28 = icmp sgt i64 %27, -2
  %smax = select i1 %28, i64 %27, i64 -2
  %29 = add i64 %3, %smax
  %30 = add i64 %29, 2
  %min.iters.check211 = icmp ult i64 %30, 4
  br i1 %min.iters.check211, label %if.end13.i.preheader233, label %min.iters.checked212

min.iters.checked212:                             ; preds = %if.end13.i.preheader
  %n.vec214 = and i64 %30, -4
  %cmp.zero215 = icmp eq i64 %n.vec214, 0
  br i1 %cmp.zero215, label %if.end13.i.preheader233, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked212
  %31 = xor i64 %3, -1
  %32 = icmp sgt i64 %31, -2
  %smax217 = select i1 %32, i64 %31, i64 -2
  %33 = sub i64 -2, %smax217
  %scevgep = getelementptr i64, i64* %call6.i, i64 %33
  %scevgep219 = getelementptr i64, i64* %call6.i, i64 %3
  %34 = add i64 %3, %smax217
  %35 = add i64 %34, 2
  %scevgep221 = getelementptr i64, i64* %call43, i64 %35
  %bound0 = icmp ult i64* %scevgep, %scevgep221
  %bound1 = icmp ult i64* %call43, %scevgep219
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = sub i64 %3, %n.vec214
  br i1 %memcheck.conflict, label %if.end13.i.preheader233, label %vector.body208.preheader

vector.body208.preheader:                         ; preds = %vector.memcheck
  %36 = add i64 %n.vec214, -4
  %37 = lshr exact i64 %36, 2
  %38 = and i64 %37, 1
  %lcmp.mod = icmp eq i64 %38, 0
  br i1 %lcmp.mod, label %vector.body208.prol.preheader, label %vector.body208.prol.loopexit

vector.body208.prol.preheader:                    ; preds = %vector.body208.preheader
  br label %vector.body208.prol

vector.body208.prol:                              ; preds = %vector.body208.prol.preheader
  %39 = bitcast i64* %call43 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %39, align 8, !tbaa !1, !alias.scope !19
  %40 = getelementptr i64, i64* %call43, i64 2
  %41 = bitcast i64* %40 to <2 x i64>*
  %wide.load231.prol = load <2 x i64>, <2 x i64>* %41, align 8, !tbaa !1, !alias.scope !19
  %42 = add nsw i64 %3, -1
  %43 = getelementptr inbounds i64, i64* %call6.i, i64 %42
  %reverse.prol = shufflevector <2 x i64> %wide.load.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %44 = getelementptr i64, i64* %43, i64 -1
  %45 = bitcast i64* %44 to <2 x i64>*
  store <2 x i64> %reverse.prol, <2 x i64>* %45, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %reverse232.prol = shufflevector <2 x i64> %wide.load231.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %46 = getelementptr i64, i64* %43, i64 -2
  %47 = getelementptr i64, i64* %46, i64 -1
  %48 = bitcast i64* %47 to <2 x i64>*
  store <2 x i64> %reverse232.prol, <2 x i64>* %48, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  br label %vector.body208.prol.loopexit

vector.body208.prol.loopexit:                     ; preds = %vector.body208.prol, %vector.body208.preheader
  %index224.unr = phi i64 [ 0, %vector.body208.preheader ], [ 4, %vector.body208.prol ]
  %49 = icmp eq i64 %37, 0
  br i1 %49, label %middle.block209, label %vector.body208.preheader.new

vector.body208.preheader.new:                     ; preds = %vector.body208.prol.loopexit
  br label %vector.body208

vector.body208:                                   ; preds = %vector.body208, %vector.body208.preheader.new
  %index224 = phi i64 [ %index224.unr, %vector.body208.preheader.new ], [ %index.next225.1, %vector.body208 ]
  %offset.idx = sub i64 %3, %index224
  %50 = getelementptr inbounds i64, i64* %call43, i64 %index224
  %51 = bitcast i64* %50 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %51, align 8, !tbaa !1, !alias.scope !19
  %52 = getelementptr i64, i64* %50, i64 2
  %53 = bitcast i64* %52 to <2 x i64>*
  %wide.load231 = load <2 x i64>, <2 x i64>* %53, align 8, !tbaa !1, !alias.scope !19
  %54 = add nsw i64 %offset.idx, -1
  %55 = getelementptr inbounds i64, i64* %call6.i, i64 %54
  %reverse = shufflevector <2 x i64> %wide.load, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %56 = getelementptr i64, i64* %55, i64 -1
  %57 = bitcast i64* %56 to <2 x i64>*
  store <2 x i64> %reverse, <2 x i64>* %57, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %reverse232 = shufflevector <2 x i64> %wide.load231, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %58 = getelementptr i64, i64* %55, i64 -2
  %59 = getelementptr i64, i64* %58, i64 -1
  %60 = bitcast i64* %59 to <2 x i64>*
  store <2 x i64> %reverse232, <2 x i64>* %60, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %index.next225 = add i64 %index224, 4
  %offset.idx.1 = sub i64 %3, %index.next225
  %61 = getelementptr inbounds i64, i64* %call43, i64 %index.next225
  %62 = bitcast i64* %61 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %62, align 8, !tbaa !1, !alias.scope !19
  %63 = getelementptr i64, i64* %61, i64 2
  %64 = bitcast i64* %63 to <2 x i64>*
  %wide.load231.1 = load <2 x i64>, <2 x i64>* %64, align 8, !tbaa !1, !alias.scope !19
  %65 = add nsw i64 %offset.idx.1, -1
  %66 = getelementptr inbounds i64, i64* %call6.i, i64 %65
  %reverse.1 = shufflevector <2 x i64> %wide.load.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %67 = getelementptr i64, i64* %66, i64 -1
  %68 = bitcast i64* %67 to <2 x i64>*
  store <2 x i64> %reverse.1, <2 x i64>* %68, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %reverse232.1 = shufflevector <2 x i64> %wide.load231.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %69 = getelementptr i64, i64* %66, i64 -2
  %70 = getelementptr i64, i64* %69, i64 -1
  %71 = bitcast i64* %70 to <2 x i64>*
  store <2 x i64> %reverse232.1, <2 x i64>* %71, align 8, !tbaa !1, !alias.scope !22, !noalias !19
  %index.next225.1 = add i64 %index224, 8
  %72 = icmp eq i64 %index.next225.1, %n.vec214
  br i1 %72, label %middle.block209.unr-lcssa, label %vector.body208, !llvm.loop !24

middle.block209.unr-lcssa:                        ; preds = %vector.body208
  br label %middle.block209

middle.block209:                                  ; preds = %vector.body208.prol.loopexit, %middle.block209.unr-lcssa
  %cmp.n227 = icmp eq i64 %30, %n.vec214
  br i1 %cmp.n227, label %blklab0.i, label %if.end13.i.preheader233

if.end13.i.preheader233:                          ; preds = %middle.block209, %vector.memcheck, %min.iters.checked212, %if.end13.i.preheader
  %i.061.i.ph = phi i64 [ %3, %vector.memcheck ], [ %3, %min.iters.checked212 ], [ %3, %if.end13.i.preheader ], [ %ind.end, %middle.block209 ]
  br label %if.end13.i

if.end13.i:                                       ; preds = %if.end13.i.preheader233, %if.end13.i
  %i.061.i = phi i64 [ %sub14.i, %if.end13.i ], [ %i.061.i.ph, %if.end13.i.preheader233 ]
  %sub.i = sub nuw nsw i64 %3, %i.061.i
  %arrayidx.i = getelementptr inbounds i64, i64* %call43, i64 %sub.i
  %73 = load i64, i64* %arrayidx.i, align 8, !tbaa !1
  %sub14.i = add nsw i64 %i.061.i, -1
  %arrayidx15.i = getelementptr inbounds i64, i64* %call6.i, i64 %sub14.i
  store i64 %73, i64* %arrayidx15.i, align 8, !tbaa !1
  %cmp11.i = icmp slt i64 %i.061.i, 2
  br i1 %cmp11.i, label %blklab0.i.loopexit, label %if.end13.i, !llvm.loop !25

blklab0.i.loopexit:                               ; preds = %if.end13.i
  br label %blklab0.i

blklab0.i:                                        ; preds = %blklab0.i.loopexit, %middle.block209, %if.end42
  call void @free(i8* %26) #6
  br i1 %not.cmp.i, label %_reverse_.exit, label %if.then23.i

if.then23.i:                                      ; preds = %blklab0.i
  %74 = bitcast i64* %call.i to i8*
  call void @free(i8* %74) #6
  br label %_reverse_.exit

_reverse_.exit:                                   ; preds = %blklab0.i, %if.then23.i
  %not.cmp45 = icmp eq i64* %call6.i, null
  br i1 %not.cmp31, label %blklab4, label %if.then50

if.then50:                                        ; preds = %_reverse_.exit
  %75 = bitcast i64* %call30 to i8*
  call void @free(i8* %75) #6
  br label %blklab4

blklab4:                                          ; preds = %if.then50, %_reverse_.exit
  %call52 = call i64* @copy1DArray_int64_t(i64* %call6.i, i64 %3) #6
  %not.cmp53 = icmp eq i64* %call52, null
  %76 = load i64, i64* %call52, align 8, !tbaa !1
  %call58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %76)
  %sub59 = add nsw i64 %3, -1
  %arrayidx60 = getelementptr inbounds i64, i64* %call52, i64 %sub59
  %77 = load i64, i64* %arrayidx60, align 8, !tbaa !1
  %call61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %77)
  %call65 = call i64* @create1DArray_int64_t(i64 0, i64 22) #6
  %78 = bitcast i64* %call65 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %78, align 8, !tbaa !1
  %arrayidx68 = getelementptr inbounds i64, i64* %call65, i64 2
  %79 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %79, align 8, !tbaa !1
  %arrayidx70 = getelementptr inbounds i64, i64* %call65, i64 4
  %80 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 32, i64 82>, <2 x i64>* %80, align 8, !tbaa !1
  %arrayidx72 = getelementptr inbounds i64, i64* %call65, i64 6
  %81 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 101, i64 118>, <2 x i64>* %81, align 8, !tbaa !1
  %arrayidx74 = getelementptr inbounds i64, i64* %call65, i64 8
  %82 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %82, align 8, !tbaa !1
  %arrayidx76 = getelementptr inbounds i64, i64* %call65, i64 10
  %83 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %83, align 8, !tbaa !1
  %arrayidx78 = getelementptr inbounds i64, i64* %call65, i64 12
  %84 = bitcast i64* %arrayidx78 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %84, align 8, !tbaa !1
  %arrayidx80 = getelementptr inbounds i64, i64* %call65, i64 14
  %85 = bitcast i64* %arrayidx80 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %85, align 8, !tbaa !1
  %arrayidx82 = getelementptr inbounds i64, i64* %call65, i64 16
  %86 = bitcast i64* %arrayidx82 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %86, align 8, !tbaa !1
  %arrayidx84 = getelementptr inbounds i64, i64* %call65, i64 18
  %87 = bitcast i64* %arrayidx84 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %87, align 8, !tbaa !1
  %arrayidx86 = getelementptr inbounds i64, i64* %call65, i64 20
  %88 = bitcast i64* %arrayidx86 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %88, align 8, !tbaa !1
  %not.cmp88 = icmp eq i64* %call65, null
  call void @println_s(i64* %call65, i64 22) #6
  %phitmp = bitcast i64* %call65 to i8*
  %phitmp184 = bitcast i64* %call6.i to i8*
  %phitmp185 = bitcast i64* %call22 to i8*
  br i1 %not.cmp53, label %if.end97, label %if.then96

if.then96:                                        ; preds = %blklab4
  %phitmp186 = bitcast i64* %call52 to i8*
  call void @free(i8* %phitmp186) #6
  br label %if.end97

if.end97:                                         ; preds = %blklab4, %if.then96
  br i1 %not.cmp4, label %if.end100, label %if.then99

if.then99:                                        ; preds = %if.end97
  %89 = bitcast i64* %call3 to i8*
  call void @free(i8* %89) #6
  br label %if.end100

if.end100:                                        ; preds = %if.end97, %if.then99
  br i1 %not.cmp, label %if.end106, label %if.then102

if.then102:                                       ; preds = %if.end100
  %90 = load i64, i64* %_6_size, align 8, !tbaa !1
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %90) #6
  br label %if.end106

if.end106:                                        ; preds = %if.end100, %if.then102
  br i1 %not.cmp23, label %if.end109, label %if.then108

if.then108:                                       ; preds = %if.end106
  call void @free(i8* %phitmp185) #6
  br label %if.end109

if.end109:                                        ; preds = %if.end106, %if.then108
  br i1 %not.cmp45, label %if.end112, label %if.then111

if.then111:                                       ; preds = %if.end109
  call void @free(i8* %phitmp184) #6
  br label %if.end112

if.end112:                                        ; preds = %if.end109, %if.then111
  br i1 %not.cmp88, label %if.end115, label %if.then114

if.then114:                                       ; preds = %if.end112
  call void @free(i8* %phitmp) #6
  br label %if.end115

if.end115:                                        ; preds = %if.end112, %if.then114
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
