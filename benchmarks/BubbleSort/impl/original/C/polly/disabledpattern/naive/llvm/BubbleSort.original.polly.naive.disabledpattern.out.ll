; ModuleID = 'BubbleSort_original.c'
source_filename = "BubbleSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define i64* @_bubbleSort_(i64* returned %items, i64 %items_size, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %cmp75 = icmp slt i64 %items_size, 1
  br i1 %cmp75, label %blklab0, label %while.cond18.preheader.preheader

while.cond18.preheader.preheader:                 ; preds = %entry
  %arrayidx23.prol = getelementptr inbounds i64, i64* %items, i64 1
  br label %while.cond18.preheader

while.cond.loopexit.unr-lcssa:                    ; preds = %blklab4.1
  br label %while.cond.loopexit

while.cond.loopexit:                              ; preds = %if.end22.prol.loopexit, %while.cond.loopexit.unr-lcssa
  %last_swapped.1.lcssa = phi i64 [ %last_swapped.1.lcssa.unr.ph, %if.end22.prol.loopexit ], [ %last_swapped.1.1, %while.cond.loopexit.unr-lcssa ]
  %cmp = icmp slt i64 %last_swapped.1.lcssa, 1
  br i1 %cmp, label %blklab0.loopexit, label %while.cond18.preheader

while.cond18.preheader:                           ; preds = %while.cond18.preheader.preheader, %while.cond.loopexit
  %length.076 = phi i64 [ %last_swapped.1.lcssa, %while.cond.loopexit ], [ %items_size, %while.cond18.preheader.preheader ]
  %cmp2072 = icmp sgt i64 %length.076, 1
  br i1 %cmp2072, label %if.end22.preheader, label %blklab0.loopexit

if.end22.preheader:                               ; preds = %while.cond18.preheader
  %.pre = load i64, i64* %items, align 8, !tbaa !1
  %0 = and i64 %length.076, 1
  %lcmp.mod = icmp eq i64 %0, 0
  br i1 %lcmp.mod, label %if.end22.prol.preheader, label %if.end22.prol.loopexit.unr-lcssa

if.end22.prol.preheader:                          ; preds = %if.end22.preheader
  br label %if.end22.prol

if.end22.prol:                                    ; preds = %if.end22.prol.preheader
  %1 = load i64, i64* %arrayidx23.prol, align 8, !tbaa !1
  %cmp24.prol = icmp sgt i64 %.pre, %1
  br i1 %cmp24.prol, label %if.end26.prol, label %blklab4.prol

if.end26.prol:                                    ; preds = %if.end22.prol
  store i64 %1, i64* %items, align 8, !tbaa !1
  store i64 %.pre, i64* %arrayidx23.prol, align 8, !tbaa !1
  br label %blklab4.prol

blklab4.prol:                                     ; preds = %if.end26.prol, %if.end22.prol
  %2 = phi i64 [ %1, %if.end22.prol ], [ %.pre, %if.end26.prol ]
  %last_swapped.1.prol = phi i64 [ 0, %if.end22.prol ], [ 1, %if.end26.prol ]
  br label %if.end22.prol.loopexit.unr-lcssa

if.end22.prol.loopexit.unr-lcssa:                 ; preds = %if.end22.preheader, %blklab4.prol
  %last_swapped.1.lcssa.unr.ph = phi i64 [ %last_swapped.1.prol, %blklab4.prol ], [ undef, %if.end22.preheader ]
  %.unr.ph = phi i64 [ %2, %blklab4.prol ], [ %.pre, %if.end22.preheader ]
  %last_swapped.074.unr.ph = phi i64 [ %last_swapped.1.prol, %blklab4.prol ], [ 0, %if.end22.preheader ]
  %index.073.unr.ph = phi i64 [ 2, %blklab4.prol ], [ 1, %if.end22.preheader ]
  br label %if.end22.prol.loopexit

if.end22.prol.loopexit:                           ; preds = %if.end22.prol.loopexit.unr-lcssa
  %3 = icmp eq i64 %length.076, 2
  br i1 %3, label %while.cond.loopexit, label %if.end22.preheader.new

if.end22.preheader.new:                           ; preds = %if.end22.prol.loopexit
  br label %if.end22

if.end22:                                         ; preds = %blklab4.1, %if.end22.preheader.new
  %4 = phi i64 [ %.unr.ph, %if.end22.preheader.new ], [ %8, %blklab4.1 ]
  %last_swapped.074 = phi i64 [ %last_swapped.074.unr.ph, %if.end22.preheader.new ], [ %last_swapped.1.1, %blklab4.1 ]
  %index.073 = phi i64 [ %index.073.unr.ph, %if.end22.preheader.new ], [ %add.1, %blklab4.1 ]
  %arrayidx23 = getelementptr inbounds i64, i64* %items, i64 %index.073
  %5 = load i64, i64* %arrayidx23, align 8, !tbaa !1
  %cmp24 = icmp sgt i64 %4, %5
  br i1 %cmp24, label %if.end26, label %blklab4

if.end26:                                         ; preds = %if.end22
  %sub = add nsw i64 %index.073, -1
  %arrayidx = getelementptr inbounds i64, i64* %items, i64 %sub
  store i64 %5, i64* %arrayidx, align 8, !tbaa !1
  store i64 %4, i64* %arrayidx23, align 8, !tbaa !1
  br label %blklab4

blklab4:                                          ; preds = %if.end22, %if.end26
  %6 = phi i64 [ %5, %if.end22 ], [ %4, %if.end26 ]
  %last_swapped.1 = phi i64 [ %last_swapped.074, %if.end22 ], [ %index.073, %if.end26 ]
  %add = add nuw nsw i64 %index.073, 1
  %arrayidx23.1 = getelementptr inbounds i64, i64* %items, i64 %add
  %7 = load i64, i64* %arrayidx23.1, align 8, !tbaa !1
  %cmp24.1 = icmp sgt i64 %6, %7
  br i1 %cmp24.1, label %if.end26.1, label %blklab4.1

blklab0.loopexit:                                 ; preds = %while.cond.loopexit, %while.cond18.preheader
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %entry
  store i64 %items_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  ret i64* %items

if.end26.1:                                       ; preds = %blklab4
  %arrayidx.1 = getelementptr inbounds i64, i64* %items, i64 %index.073
  store i64 %7, i64* %arrayidx.1, align 8, !tbaa !1
  store i64 %6, i64* %arrayidx23.1, align 8, !tbaa !1
  br label %blklab4.1

blklab4.1:                                        ; preds = %if.end26.1, %blklab4
  %8 = phi i64 [ %7, %blklab4 ], [ %6, %if.end26.1 ]
  %last_swapped.1.1 = phi i64 [ %last_swapped.1, %blklab4 ], [ %add, %if.end26.1 ]
  %add.1 = add nsw i64 %index.073, 2
  %exitcond.1 = icmp eq i64 %add.1, %length.076
  br i1 %exitcond.1, label %while.cond.loopexit.unr-lcssa, label %if.end22
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #2 {
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
  %3 = load i64*, i64** %call, align 8, !tbaa !5
  %call1 = call i64* @parseStringToInt(i64* %3) #6
  %4 = load i64, i64* %call1, align 8, !tbaa !1
  %call3 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #6
  %call4 = call i64* @copy1DArray_int64_t(i64* %call3, i64 %4) #6
  %cmp585 = icmp slt i64 %4, 0
  br i1 %cmp585, label %blklab6, label %if.end7.preheader

if.end7.preheader:                                ; preds = %entry
  %5 = add i64 %4, 1
  %min.iters.check = icmp ult i64 %5, 4
  br i1 %min.iters.check, label %if.end7.preheader88, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end7.preheader
  %n.vec = and i64 %5, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end7.preheader88, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %6 = add i64 %n.vec, -4
  %7 = lshr exact i64 %6, 2
  %8 = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %8, 0
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %9 = add <2 x i64> %broadcast.splat, <i64 0, i64 -1>
  %10 = add <2 x i64> %broadcast.splat, <i64 -2, i64 -3>
  %11 = bitcast i64* %call4 to <2 x i64>*
  store <2 x i64> %9, <2 x i64>* %11, align 8, !tbaa !1
  %12 = getelementptr i64, i64* %call4, i64 2
  %13 = bitcast i64* %12 to <2 x i64>*
  store <2 x i64> %10, <2 x i64>* %13, align 8, !tbaa !1
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ 4, %vector.body.prol ]
  %vec.ind.unr = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph ], [ <i64 4, i64 5>, %vector.body.prol ]
  %14 = icmp eq i64 %7, 0
  br i1 %14, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %vec.ind = phi <2 x i64> [ %vec.ind.unr, %vector.ph.new ], [ %vec.ind.next.1, %vector.body ]
  %step.add = add <2 x i64> %vec.ind, <i64 2, i64 2>
  %15 = sub nsw <2 x i64> %broadcast.splat, %vec.ind
  %16 = sub nsw <2 x i64> %broadcast.splat, %step.add
  %17 = getelementptr inbounds i64, i64* %call4, i64 %index
  %18 = bitcast i64* %17 to <2 x i64>*
  store <2 x i64> %15, <2 x i64>* %18, align 8, !tbaa !1
  %19 = getelementptr i64, i64* %17, i64 2
  %20 = bitcast i64* %19 to <2 x i64>*
  store <2 x i64> %16, <2 x i64>* %20, align 8, !tbaa !1
  %index.next = add i64 %index, 4
  %vec.ind.next = add <2 x i64> %vec.ind, <i64 4, i64 4>
  %step.add.1 = add <2 x i64> %vec.ind, <i64 6, i64 6>
  %21 = sub nsw <2 x i64> %broadcast.splat, %vec.ind.next
  %22 = sub nsw <2 x i64> %broadcast.splat, %step.add.1
  %23 = getelementptr inbounds i64, i64* %call4, i64 %index.next
  %24 = bitcast i64* %23 to <2 x i64>*
  store <2 x i64> %21, <2 x i64>* %24, align 8, !tbaa !1
  %25 = getelementptr i64, i64* %23, i64 2
  %26 = bitcast i64* %25 to <2 x i64>*
  store <2 x i64> %22, <2 x i64>* %26, align 8, !tbaa !1
  %index.next.1 = add i64 %index, 8
  %vec.ind.next.1 = add <2 x i64> %vec.ind, <i64 8, i64 8>
  %27 = icmp eq i64 %index.next.1, %n.vec
  br i1 %27, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !7

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %5, %n.vec
  br i1 %cmp.n, label %blklab6, label %if.end7.preheader88

if.end7.preheader88:                              ; preds = %middle.block, %min.iters.checked, %if.end7.preheader
  %index.086.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end7.preheader ], [ %n.vec, %middle.block ]
  br label %if.end7

if.end7:                                          ; preds = %if.end7.preheader88, %if.end7
  %index.086 = phi i64 [ %add, %if.end7 ], [ %index.086.ph, %if.end7.preheader88 ]
  %sub = sub nsw i64 %4, %index.086
  %arrayidx8 = getelementptr inbounds i64, i64* %call4, i64 %index.086
  store i64 %sub, i64* %arrayidx8, align 8, !tbaa !1
  %add = add nuw nsw i64 %index.086, 1
  %exitcond = icmp eq i64 %4, %index.086
  br i1 %exitcond, label %blklab6.loopexit, label %if.end7, !llvm.loop !10

blklab6.loopexit:                                 ; preds = %if.end7
  br label %blklab6

blklab6:                                          ; preds = %blklab6.loopexit, %middle.block, %entry
  %call10 = call i64* @copy1DArray_int64_t(i64* %call4, i64 %4) #6
  %call11 = call i64* @_bubbleSort_(i64* %call10, i64 %4, i64* nonnull %_15_size)
  %28 = load i64, i64* %_15_size, align 8, !tbaa !1
  %call12 = call i64* @copy1DArray_int64_t(i64* %call11, i64 %28) #6
  %29 = load i64, i64* %call12, align 8, !tbaa !1
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %29)
  %sub15 = add nsw i64 %4, -1
  %arrayidx16 = getelementptr inbounds i64, i64* %call12, i64 %sub15
  %30 = load i64, i64* %arrayidx16, align 8, !tbaa !1
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %30)
  %call18 = call i64* @create1DArray_int64_t(i64 0, i64 25) #6
  %31 = bitcast i64* %call18 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx21 = getelementptr inbounds i64, i64* %call18, i64 2
  %32 = bitcast i64* %arrayidx21 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx23 = getelementptr inbounds i64, i64* %call18, i64 4
  %33 = bitcast i64* %arrayidx23 to <2 x i64>*
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx25 = getelementptr inbounds i64, i64* %call18, i64 6
  %34 = bitcast i64* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 117, i64 98>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx27 = getelementptr inbounds i64, i64* %call18, i64 8
  %35 = bitcast i64* %arrayidx27 to <2 x i64>*
  store <2 x i64> <i64 98, i64 108>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx29 = getelementptr inbounds i64, i64* %call18, i64 10
  %36 = bitcast i64* %arrayidx29 to <2 x i64>*
  store <2 x i64> <i64 101, i64 83>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx31 = getelementptr inbounds i64, i64* %call18, i64 12
  %37 = bitcast i64* %arrayidx31 to <2 x i64>*
  store <2 x i64> <i64 111, i64 114>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx33 = getelementptr inbounds i64, i64* %call18, i64 14
  %38 = bitcast i64* %arrayidx33 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx35 = getelementptr inbounds i64, i64* %call18, i64 16
  %39 = bitcast i64* %arrayidx35 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx37 = getelementptr inbounds i64, i64* %call18, i64 18
  %40 = bitcast i64* %arrayidx37 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %40, align 8, !tbaa !1
  %arrayidx39 = getelementptr inbounds i64, i64* %call18, i64 20
  %41 = bitcast i64* %arrayidx39 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %41, align 8, !tbaa !1
  %arrayidx41 = getelementptr inbounds i64, i64* %call18, i64 22
  %42 = bitcast i64* %arrayidx41 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %42, align 8, !tbaa !1
  %arrayidx43 = getelementptr inbounds i64, i64* %call18, i64 24
  store i64 101, i64* %arrayidx43, align 8, !tbaa !1
  call void @println_s(i64* %call18, i64 25) #6
  call void @exit(i32 0) #7
  unreachable
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

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.vectorize.width", i32 1}
!9 = !{!"llvm.loop.interleave.count", i32 1}
!10 = distinct !{!10, !11, !8, !9}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
