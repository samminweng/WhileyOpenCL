; ModuleID = 'Reverse_original.c'
source_filename = "Reverse_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_reverse_(i64* nocapture readonly %arr, i64 %arr_size, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %arr_size) #6
  %call1 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 %arr_size) #6
  %cmp32 = icmp slt i64 %arr_size, 1
  br i1 %cmp32, label %blklab0, label %if.end.preheader

if.end.preheader:                                 ; preds = %entry
  %0 = xor i64 %arr_size, -1
  %1 = icmp sgt i64 %0, -2
  %smax = select i1 %1, i64 %0, i64 -2
  %2 = add i64 %smax, %arr_size
  %3 = add i64 %2, 2
  %min.iters.check = icmp ult i64 %3, 4
  br i1 %min.iters.check, label %if.end.preheader44, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end.preheader
  %n.vec = and i64 %3, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end.preheader44, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %4 = xor i64 %arr_size, -1
  %5 = icmp sgt i64 %4, -2
  %smax34 = select i1 %5, i64 %4, i64 -2
  %6 = sub i64 -2, %smax34
  %scevgep = getelementptr i64, i64* %call1, i64 %6
  %scevgep36 = getelementptr i64, i64* %call1, i64 %arr_size
  %7 = add i64 %smax34, %arr_size
  %8 = add i64 %7, 2
  %scevgep39 = getelementptr i64, i64* %arr, i64 %8
  %bound0 = icmp ult i64* %scevgep, %scevgep39
  %bound1 = icmp ugt i64* %scevgep36, %arr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = sub i64 %arr_size, %n.vec
  br i1 %memcheck.conflict, label %if.end.preheader44, label %vector.body.preheader

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
  %wide.load42.prol = load <2 x i64>, <2 x i64>* %14, align 8, !tbaa !1, !alias.scope !5
  %15 = add nsw i64 %arr_size, -1
  %16 = getelementptr inbounds i64, i64* %call1, i64 %15
  %reverse.prol = shufflevector <2 x i64> %wide.load.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %17 = getelementptr i64, i64* %16, i64 -1
  %18 = bitcast i64* %17 to <2 x i64>*
  store <2 x i64> %reverse.prol, <2 x i64>* %18, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse43.prol = shufflevector <2 x i64> %wide.load42.prol, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %19 = getelementptr i64, i64* %16, i64 -2
  %20 = getelementptr i64, i64* %19, i64 -1
  %21 = bitcast i64* %20 to <2 x i64>*
  store <2 x i64> %reverse43.prol, <2 x i64>* %21, align 8, !tbaa !1, !alias.scope !8, !noalias !5
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
  %wide.load42 = load <2 x i64>, <2 x i64>* %26, align 8, !tbaa !1, !alias.scope !5
  %27 = add nsw i64 %offset.idx, -1
  %28 = getelementptr inbounds i64, i64* %call1, i64 %27
  %reverse = shufflevector <2 x i64> %wide.load, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %29 = getelementptr i64, i64* %28, i64 -1
  %30 = bitcast i64* %29 to <2 x i64>*
  store <2 x i64> %reverse, <2 x i64>* %30, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse43 = shufflevector <2 x i64> %wide.load42, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %31 = getelementptr i64, i64* %28, i64 -2
  %32 = getelementptr i64, i64* %31, i64 -1
  %33 = bitcast i64* %32 to <2 x i64>*
  store <2 x i64> %reverse43, <2 x i64>* %33, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next = add i64 %index, 4
  %offset.idx.1 = sub i64 %arr_size, %index.next
  %34 = getelementptr inbounds i64, i64* %arr, i64 %index.next
  %35 = bitcast i64* %34 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %35, align 8, !tbaa !1, !alias.scope !5
  %36 = getelementptr i64, i64* %34, i64 2
  %37 = bitcast i64* %36 to <2 x i64>*
  %wide.load42.1 = load <2 x i64>, <2 x i64>* %37, align 8, !tbaa !1, !alias.scope !5
  %38 = add nsw i64 %offset.idx.1, -1
  %39 = getelementptr inbounds i64, i64* %call1, i64 %38
  %reverse.1 = shufflevector <2 x i64> %wide.load.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %40 = getelementptr i64, i64* %39, i64 -1
  %41 = bitcast i64* %40 to <2 x i64>*
  store <2 x i64> %reverse.1, <2 x i64>* %41, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %reverse43.1 = shufflevector <2 x i64> %wide.load42.1, <2 x i64> undef, <2 x i32> <i32 1, i32 0>
  %42 = getelementptr i64, i64* %39, i64 -2
  %43 = getelementptr i64, i64* %42, i64 -1
  %44 = bitcast i64* %43 to <2 x i64>*
  store <2 x i64> %reverse43.1, <2 x i64>* %44, align 8, !tbaa !1, !alias.scope !8, !noalias !5
  %index.next.1 = add i64 %index, 8
  %45 = icmp eq i64 %index.next.1, %n.vec
  br i1 %45, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !10

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %blklab0, label %if.end.preheader44

if.end.preheader44:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end.preheader
  %i.033.ph = phi i64 [ %arr_size, %vector.memcheck ], [ %arr_size, %min.iters.checked ], [ %arr_size, %if.end.preheader ], [ %ind.end, %middle.block ]
  br label %if.end

if.end:                                           ; preds = %if.end.preheader44, %if.end
  %i.033 = phi i64 [ %sub2, %if.end ], [ %i.033.ph, %if.end.preheader44 ]
  %sub = sub nuw nsw i64 %arr_size, %i.033
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %sub
  %46 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %sub2 = add nsw i64 %i.033, -1
  %arrayidx3 = getelementptr inbounds i64, i64* %call1, i64 %sub2
  store i64 %46, i64* %arrayidx3, align 8, !tbaa !1
  %cmp = icmp slt i64 %i.033, 2
  br i1 %cmp, label %blklab0.loopexit, label %if.end, !llvm.loop !13

blklab0.loopexit:                                 ; preds = %if.end
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %middle.block, %entry
  store i64 %arr_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  ret i64* %call1
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #2

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
entry:
  %_6_size = alloca i64, align 8
  %_6_size_size = alloca i64, align 8
  %_15_size = alloca i64, align 8
  %0 = bitcast i64* %_6_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #6
  store i64 0, i64* %_6_size, align 8, !tbaa !1
  %1 = bitcast i64* %_6_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #6
  store i64 0, i64* %_6_size_size, align 8, !tbaa !1
  %2 = bitcast i64* %_15_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #6
  store i64 0, i64* %_15_size, align 8, !tbaa !1
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_6_size, i64* nonnull %_6_size_size) #6
  %3 = load i64*, i64** %call, align 8, !tbaa !14
  %call1 = call i64* @parseStringToInt(i64* %3) #6
  %4 = load i64, i64* %call1, align 8, !tbaa !1
  %call3 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #6
  %call4 = call i64* @copy1DArray_int64_t(i64* %call3, i64 %4) #6
  %cmp579 = icmp sgt i64 %4, 0
  br i1 %cmp579, label %if.end7.preheader, label %blklab5

if.end7.preheader:                                ; preds = %entry
  %min.iters.check = icmp ult i64 %4, 4
  br i1 %min.iters.check, label %if.end7.preheader82, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end7.preheader
  %n.vec = and i64 %4, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end7.preheader82, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %5 = add i64 %n.vec, -4
  %6 = lshr exact i64 %5, 2
  %7 = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %7, 0
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %8 = add <2 x i64> %broadcast.splat, <i64 0, i64 -1>
  %9 = add <2 x i64> %broadcast.splat, <i64 -2, i64 -3>
  %10 = bitcast i64* %call4 to <2 x i64>*
  store <2 x i64> %8, <2 x i64>* %10, align 8, !tbaa !1
  %11 = getelementptr i64, i64* %call4, i64 2
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
  %16 = getelementptr inbounds i64, i64* %call4, i64 %index
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
  %22 = getelementptr inbounds i64, i64* %call4, i64 %index.next
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
  %cmp.n = icmp eq i64 %4, %n.vec
  br i1 %cmp.n, label %blklab5, label %if.end7.preheader82

if.end7.preheader82:                              ; preds = %middle.block, %min.iters.checked, %if.end7.preheader
  %index.080.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end7.preheader ], [ %n.vec, %middle.block ]
  br label %if.end7

if.end7:                                          ; preds = %if.end7.preheader82, %if.end7
  %index.080 = phi i64 [ %add, %if.end7 ], [ %index.080.ph, %if.end7.preheader82 ]
  %sub = sub nsw i64 %4, %index.080
  %arrayidx8 = getelementptr inbounds i64, i64* %call4, i64 %index.080
  store i64 %sub, i64* %arrayidx8, align 8, !tbaa !1
  %add = add nuw nsw i64 %index.080, 1
  %exitcond = icmp eq i64 %add, %4
  br i1 %exitcond, label %blklab5.loopexit, label %if.end7, !llvm.loop !17

blklab5.loopexit:                                 ; preds = %if.end7
  br label %blklab5

blklab5:                                          ; preds = %blklab5.loopexit, %middle.block, %entry
  %call10 = call i64* @copy1DArray_int64_t(i64* %call4, i64 %4) #6
  %call11 = call i64* @_reverse_(i64* %call10, i64 %4, i64* nonnull %_15_size)
  %27 = load i64, i64* %_15_size, align 8, !tbaa !1
  %call12 = call i64* @copy1DArray_int64_t(i64* %call11, i64 %27) #6
  %28 = load i64, i64* %call12, align 8, !tbaa !1
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %28)
  %sub15 = add nsw i64 %4, -1
  %arrayidx16 = getelementptr inbounds i64, i64* %call12, i64 %sub15
  %29 = load i64, i64* %arrayidx16, align 8, !tbaa !1
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %29)
  %call18 = call i64* @create1DArray_int64_t(i64 0, i64 22) #6
  %30 = bitcast i64* %call18 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %30, align 8, !tbaa !1
  %arrayidx21 = getelementptr inbounds i64, i64* %call18, i64 2
  %31 = bitcast i64* %arrayidx21 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx23 = getelementptr inbounds i64, i64* %call18, i64 4
  %32 = bitcast i64* %arrayidx23 to <2 x i64>*
  store <2 x i64> <i64 32, i64 82>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx25 = getelementptr inbounds i64, i64* %call18, i64 6
  %33 = bitcast i64* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 101, i64 118>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx27 = getelementptr inbounds i64, i64* %call18, i64 8
  %34 = bitcast i64* %arrayidx27 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx29 = getelementptr inbounds i64, i64* %call18, i64 10
  %35 = bitcast i64* %arrayidx29 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx31 = getelementptr inbounds i64, i64* %call18, i64 12
  %36 = bitcast i64* %arrayidx31 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx33 = getelementptr inbounds i64, i64* %call18, i64 14
  %37 = bitcast i64* %arrayidx33 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx35 = getelementptr inbounds i64, i64* %call18, i64 16
  %38 = bitcast i64* %arrayidx35 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx37 = getelementptr inbounds i64, i64* %call18, i64 18
  %39 = bitcast i64* %arrayidx37 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx39 = getelementptr inbounds i64, i64* %call18, i64 20
  %40 = bitcast i64* %arrayidx39 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %40, align 8, !tbaa !1
  call void @println_s(i64* %call18, i64 22) #6
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
