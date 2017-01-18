; ModuleID = 'BubbleSort_original.c'
source_filename = "BubbleSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define i64* @_bubbleSort_(i64* returned %items, i64 %items_size, i1 zeroext %items_dealloc, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %cmp77 = icmp slt i64 %items_size, 1
  br i1 %cmp77, label %if.end34, label %while.cond18.preheader.preheader

while.cond18.preheader.preheader:                 ; preds = %entry
  %arrayidx23.prol = getelementptr inbounds i64, i64* %items, i64 1
  br label %while.cond18.preheader

while.cond.loopexit.unr-lcssa:                    ; preds = %blklab4.1
  br label %while.cond.loopexit

while.cond.loopexit:                              ; preds = %if.end22.prol.loopexit, %while.cond.loopexit.unr-lcssa
  %last_swapped.1.lcssa = phi i64 [ %last_swapped.1.lcssa.unr.ph, %if.end22.prol.loopexit ], [ %last_swapped.1.1, %while.cond.loopexit.unr-lcssa ]
  %cmp = icmp slt i64 %last_swapped.1.lcssa, 1
  br i1 %cmp, label %if.end34.loopexit, label %while.cond18.preheader

while.cond18.preheader:                           ; preds = %while.cond18.preheader.preheader, %while.cond.loopexit
  %length.078 = phi i64 [ %last_swapped.1.lcssa, %while.cond.loopexit ], [ %items_size, %while.cond18.preheader.preheader ]
  %cmp2074 = icmp sgt i64 %length.078, 1
  br i1 %cmp2074, label %if.end22.preheader, label %if.end34.loopexit

if.end22.preheader:                               ; preds = %while.cond18.preheader
  %.pre = load i64, i64* %items, align 8, !tbaa !1
  %0 = and i64 %length.078, 1
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
  %index.076.unr.ph = phi i64 [ 2, %blklab4.prol ], [ 1, %if.end22.preheader ]
  %last_swapped.075.unr.ph = phi i64 [ %last_swapped.1.prol, %blklab4.prol ], [ 0, %if.end22.preheader ]
  br label %if.end22.prol.loopexit

if.end22.prol.loopexit:                           ; preds = %if.end22.prol.loopexit.unr-lcssa
  %3 = icmp eq i64 %length.078, 2
  br i1 %3, label %while.cond.loopexit, label %if.end22.preheader.new

if.end22.preheader.new:                           ; preds = %if.end22.prol.loopexit
  br label %if.end22

if.end22:                                         ; preds = %blklab4.1, %if.end22.preheader.new
  %4 = phi i64 [ %.unr.ph, %if.end22.preheader.new ], [ %8, %blklab4.1 ]
  %index.076 = phi i64 [ %index.076.unr.ph, %if.end22.preheader.new ], [ %add.1, %blklab4.1 ]
  %last_swapped.075 = phi i64 [ %last_swapped.075.unr.ph, %if.end22.preheader.new ], [ %last_swapped.1.1, %blklab4.1 ]
  %arrayidx23 = getelementptr inbounds i64, i64* %items, i64 %index.076
  %5 = load i64, i64* %arrayidx23, align 8, !tbaa !1
  %cmp24 = icmp sgt i64 %4, %5
  br i1 %cmp24, label %if.end26, label %blklab4

if.end26:                                         ; preds = %if.end22
  %sub = add nsw i64 %index.076, -1
  %arrayidx = getelementptr inbounds i64, i64* %items, i64 %sub
  store i64 %5, i64* %arrayidx, align 8, !tbaa !1
  store i64 %4, i64* %arrayidx23, align 8, !tbaa !1
  br label %blklab4

blklab4:                                          ; preds = %if.end22, %if.end26
  %6 = phi i64 [ %5, %if.end22 ], [ %4, %if.end26 ]
  %last_swapped.1 = phi i64 [ %last_swapped.075, %if.end22 ], [ %index.076, %if.end26 ]
  %add = add nuw nsw i64 %index.076, 1
  %arrayidx23.1 = getelementptr inbounds i64, i64* %items, i64 %add
  %7 = load i64, i64* %arrayidx23.1, align 8, !tbaa !1
  %cmp24.1 = icmp sgt i64 %6, %7
  br i1 %cmp24.1, label %if.end26.1, label %blklab4.1

if.end34.loopexit:                                ; preds = %while.cond.loopexit, %while.cond18.preheader
  br label %if.end34

if.end34:                                         ; preds = %if.end34.loopexit, %entry
  store i64 %items_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  ret i64* %items

if.end26.1:                                       ; preds = %blklab4
  %arrayidx.1 = getelementptr inbounds i64, i64* %items, i64 %index.076
  store i64 %7, i64* %arrayidx.1, align 8, !tbaa !1
  store i64 %6, i64* %arrayidx23.1, align 8, !tbaa !1
  br label %blklab4.1

blklab4.1:                                        ; preds = %if.end26.1, %blklab4
  %8 = phi i64 [ %7, %blklab4 ], [ %6, %if.end26.1 ]
  %last_swapped.1.1 = phi i64 [ %last_swapped.1, %blklab4 ], [ %add, %if.end26.1 ]
  %add.1 = add nsw i64 %index.076, 2
  %exitcond.1 = icmp eq i64 %add.1, %length.078
  br i1 %exitcond.1, label %while.cond.loopexit.unr-lcssa, label %if.end22
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

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
  %not.cmp = icmp eq i64** %call, null
  %2 = load i64*, i64** %call, align 8, !tbaa !5
  %call3 = call i64* @parseStringToInt(i64* %2) #6
  %not.cmp4 = icmp eq i64* %call3, null
  br i1 %not.cmp4, label %if.end92, label %if.end14

if.end14:                                         ; preds = %entry
  %3 = load i64, i64* %call3, align 8, !tbaa !1
  %call18 = call i64* @create1DArray_int64_t(i64 0, i64 %3) #6
  %cmp28177 = icmp slt i64 %3, 0
  br i1 %cmp28177, label %if.end86, label %if.end30.preheader

if.end30.preheader:                               ; preds = %if.end14
  %4 = add i64 %3, 1
  %min.iters.check = icmp ult i64 %4, 4
  br i1 %min.iters.check, label %if.end30.preheader188, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end30.preheader
  %n.vec = and i64 %4, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end30.preheader188, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %3, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %5 = add i64 %n.vec, -4
  %6 = lshr exact i64 %5, 2
  %7 = and i64 %6, 1
  %lcmp.mod190 = icmp eq i64 %7, 0
  br i1 %lcmp.mod190, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

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
  br i1 %26, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !7

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %4, %n.vec
  br i1 %cmp.n, label %if.end34, label %if.end30.preheader188

if.end30.preheader188:                            ; preds = %middle.block, %min.iters.checked, %if.end30.preheader
  %index.0178.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end30.preheader ], [ %n.vec, %middle.block ]
  br label %if.end30

if.end30:                                         ; preds = %if.end30.preheader188, %if.end30
  %index.0178 = phi i64 [ %add, %if.end30 ], [ %index.0178.ph, %if.end30.preheader188 ]
  %sub = sub nsw i64 %3, %index.0178
  %arrayidx31 = getelementptr inbounds i64, i64* %call18, i64 %index.0178
  store i64 %sub, i64* %arrayidx31, align 8, !tbaa !1
  %add = add nuw nsw i64 %index.0178, 1
  %exitcond = icmp eq i64 %3, %index.0178
  br i1 %exitcond, label %if.end34.loopexit, label %if.end30, !llvm.loop !10

if.end34.loopexit:                                ; preds = %if.end30
  br label %if.end34

if.end34:                                         ; preds = %if.end34.loopexit, %middle.block
  %cmp77.i = icmp slt i64 %3, 1
  br i1 %cmp77.i, label %if.end86, label %while.cond18.preheader.i.preheader

while.cond18.preheader.i.preheader:               ; preds = %if.end34
  %arrayidx23.i.prol = getelementptr inbounds i64, i64* %call18, i64 1
  br label %while.cond18.preheader.i

while.cond.loopexit.i.unr-lcssa:                  ; preds = %blklab4.i.1
  br label %while.cond.loopexit.i

while.cond.loopexit.i:                            ; preds = %if.end22.i.prol.loopexit, %while.cond.loopexit.i.unr-lcssa
  %last_swapped.1.i.lcssa = phi i64 [ %last_swapped.1.i.lcssa.unr.ph, %if.end22.i.prol.loopexit ], [ %last_swapped.1.i.1, %while.cond.loopexit.i.unr-lcssa ]
  %cmp.i = icmp slt i64 %last_swapped.1.i.lcssa, 1
  br i1 %cmp.i, label %if.end86.loopexit, label %while.cond18.preheader.i

while.cond18.preheader.i:                         ; preds = %while.cond18.preheader.i.preheader, %while.cond.loopexit.i
  %length.078.i = phi i64 [ %last_swapped.1.i.lcssa, %while.cond.loopexit.i ], [ %3, %while.cond18.preheader.i.preheader ]
  %cmp2074.i = icmp sgt i64 %length.078.i, 1
  br i1 %cmp2074.i, label %if.end22.preheader.i, label %if.end86.loopexit

if.end22.preheader.i:                             ; preds = %while.cond18.preheader.i
  %.pre.i = load i64, i64* %call18, align 8, !tbaa !1
  %27 = and i64 %length.078.i, 1
  %lcmp.mod = icmp eq i64 %27, 0
  br i1 %lcmp.mod, label %if.end22.i.prol.preheader, label %if.end22.i.prol.loopexit.unr-lcssa

if.end22.i.prol.preheader:                        ; preds = %if.end22.preheader.i
  br label %if.end22.i.prol

if.end22.i.prol:                                  ; preds = %if.end22.i.prol.preheader
  %28 = load i64, i64* %arrayidx23.i.prol, align 8, !tbaa !1
  %cmp24.i.prol = icmp sgt i64 %.pre.i, %28
  br i1 %cmp24.i.prol, label %if.end26.i.prol, label %blklab4.i.prol

if.end26.i.prol:                                  ; preds = %if.end22.i.prol
  store i64 %28, i64* %call18, align 8, !tbaa !1
  store i64 %.pre.i, i64* %arrayidx23.i.prol, align 8, !tbaa !1
  br label %blklab4.i.prol

blklab4.i.prol:                                   ; preds = %if.end26.i.prol, %if.end22.i.prol
  %29 = phi i64 [ %28, %if.end22.i.prol ], [ %.pre.i, %if.end26.i.prol ]
  %last_swapped.1.i.prol = phi i64 [ 0, %if.end22.i.prol ], [ 1, %if.end26.i.prol ]
  br label %if.end22.i.prol.loopexit.unr-lcssa

if.end22.i.prol.loopexit.unr-lcssa:               ; preds = %if.end22.preheader.i, %blklab4.i.prol
  %last_swapped.1.i.lcssa.unr.ph = phi i64 [ %last_swapped.1.i.prol, %blklab4.i.prol ], [ undef, %if.end22.preheader.i ]
  %.unr.ph = phi i64 [ %29, %blklab4.i.prol ], [ %.pre.i, %if.end22.preheader.i ]
  %index.076.i.unr.ph = phi i64 [ 2, %blklab4.i.prol ], [ 1, %if.end22.preheader.i ]
  %last_swapped.075.i.unr.ph = phi i64 [ %last_swapped.1.i.prol, %blklab4.i.prol ], [ 0, %if.end22.preheader.i ]
  br label %if.end22.i.prol.loopexit

if.end22.i.prol.loopexit:                         ; preds = %if.end22.i.prol.loopexit.unr-lcssa
  %30 = icmp eq i64 %length.078.i, 2
  br i1 %30, label %while.cond.loopexit.i, label %if.end22.preheader.i.new

if.end22.preheader.i.new:                         ; preds = %if.end22.i.prol.loopexit
  br label %if.end22.i

if.end22.i:                                       ; preds = %blklab4.i.1, %if.end22.preheader.i.new
  %31 = phi i64 [ %.unr.ph, %if.end22.preheader.i.new ], [ %51, %blklab4.i.1 ]
  %index.076.i = phi i64 [ %index.076.i.unr.ph, %if.end22.preheader.i.new ], [ %add.i.1, %blklab4.i.1 ]
  %last_swapped.075.i = phi i64 [ %last_swapped.075.i.unr.ph, %if.end22.preheader.i.new ], [ %last_swapped.1.i.1, %blklab4.i.1 ]
  %arrayidx23.i = getelementptr inbounds i64, i64* %call18, i64 %index.076.i
  %32 = load i64, i64* %arrayidx23.i, align 8, !tbaa !1
  %cmp24.i = icmp sgt i64 %31, %32
  br i1 %cmp24.i, label %if.end26.i, label %blklab4.i

if.end26.i:                                       ; preds = %if.end22.i
  %sub.i = add nsw i64 %index.076.i, -1
  %arrayidx.i = getelementptr inbounds i64, i64* %call18, i64 %sub.i
  store i64 %32, i64* %arrayidx.i, align 8, !tbaa !1
  store i64 %31, i64* %arrayidx23.i, align 8, !tbaa !1
  br label %blklab4.i

blklab4.i:                                        ; preds = %if.end26.i, %if.end22.i
  %33 = phi i64 [ %32, %if.end22.i ], [ %31, %if.end26.i ]
  %last_swapped.1.i = phi i64 [ %last_swapped.075.i, %if.end22.i ], [ %index.076.i, %if.end26.i ]
  %add.i = add nuw nsw i64 %index.076.i, 1
  %arrayidx23.i.1 = getelementptr inbounds i64, i64* %call18, i64 %add.i
  %34 = load i64, i64* %arrayidx23.i.1, align 8, !tbaa !1
  %cmp24.i.1 = icmp sgt i64 %33, %34
  br i1 %cmp24.i.1, label %if.end26.i.1, label %blklab4.i.1

if.end86.loopexit:                                ; preds = %while.cond.loopexit.i, %while.cond18.preheader.i
  br label %if.end86

if.end86:                                         ; preds = %if.end86.loopexit, %if.end14, %if.end34
  %not.cmp37 = icmp eq i64* %call18, null
  %35 = load i64, i64* %call18, align 8, !tbaa !1
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %35)
  %sub48 = add nsw i64 %3, -1
  %arrayidx49 = getelementptr inbounds i64, i64* %call18, i64 %sub48
  %36 = load i64, i64* %arrayidx49, align 8, !tbaa !1
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %36)
  %call54 = call i64* @create1DArray_int64_t(i64 0, i64 25) #6
  %37 = bitcast i64* %call54 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx57 = getelementptr inbounds i64, i64* %call54, i64 2
  %38 = bitcast i64* %arrayidx57 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx59 = getelementptr inbounds i64, i64* %call54, i64 4
  %39 = bitcast i64* %arrayidx59 to <2 x i64>*
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx61 = getelementptr inbounds i64, i64* %call54, i64 6
  %40 = bitcast i64* %arrayidx61 to <2 x i64>*
  store <2 x i64> <i64 117, i64 98>, <2 x i64>* %40, align 8, !tbaa !1
  %arrayidx63 = getelementptr inbounds i64, i64* %call54, i64 8
  %41 = bitcast i64* %arrayidx63 to <2 x i64>*
  store <2 x i64> <i64 98, i64 108>, <2 x i64>* %41, align 8, !tbaa !1
  %arrayidx65 = getelementptr inbounds i64, i64* %call54, i64 10
  %42 = bitcast i64* %arrayidx65 to <2 x i64>*
  store <2 x i64> <i64 101, i64 83>, <2 x i64>* %42, align 8, !tbaa !1
  %arrayidx67 = getelementptr inbounds i64, i64* %call54, i64 12
  %43 = bitcast i64* %arrayidx67 to <2 x i64>*
  store <2 x i64> <i64 111, i64 114>, <2 x i64>* %43, align 8, !tbaa !1
  %arrayidx69 = getelementptr inbounds i64, i64* %call54, i64 14
  %44 = bitcast i64* %arrayidx69 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %44, align 8, !tbaa !1
  %arrayidx71 = getelementptr inbounds i64, i64* %call54, i64 16
  %45 = bitcast i64* %arrayidx71 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %45, align 8, !tbaa !1
  %arrayidx73 = getelementptr inbounds i64, i64* %call54, i64 18
  %46 = bitcast i64* %arrayidx73 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %46, align 8, !tbaa !1
  %arrayidx75 = getelementptr inbounds i64, i64* %call54, i64 20
  %47 = bitcast i64* %arrayidx75 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %47, align 8, !tbaa !1
  %arrayidx77 = getelementptr inbounds i64, i64* %call54, i64 22
  %48 = bitcast i64* %arrayidx77 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %48, align 8, !tbaa !1
  %arrayidx79 = getelementptr inbounds i64, i64* %call54, i64 24
  store i64 101, i64* %arrayidx79, align 8, !tbaa !1
  %not.cmp80 = icmp ne i64* %call54, null
  %_27_dealloc.0 = zext i1 %not.cmp80 to i8
  call void @println_s(i64* %call54, i64 25) #6
  %phitmp = bitcast i64* %call54 to i8*
  %49 = bitcast i64* %call3 to i8*
  call void @free(i8* %49) #6
  br i1 %not.cmp37, label %if.end92, label %if.then88

if.then88:                                        ; preds = %if.end86
  %phitmp175 = bitcast i64* %call18 to i8*
  call void @free(i8* %phitmp175) #6
  br label %if.end92

if.end92:                                         ; preds = %if.end86, %entry, %if.then88
  %_27.0182186 = phi i8* [ %phitmp, %if.then88 ], [ %phitmp, %if.end86 ], [ null, %entry ]
  %_27_dealloc.1183185 = phi i8 [ %_27_dealloc.0, %if.then88 ], [ %_27_dealloc.0, %if.end86 ], [ 0, %entry ]
  br i1 %not.cmp, label %if.end104, label %if.then94

if.then94:                                        ; preds = %if.end92
  %50 = load i64, i64* %_6_size, align 8, !tbaa !1
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %50) #6
  br label %if.end104

if.end104:                                        ; preds = %if.end92, %if.then94
  %tobool105 = icmp eq i8 %_27_dealloc.1183185, 0
  br i1 %tobool105, label %if.end107, label %if.then106

if.then106:                                       ; preds = %if.end104
  call void @free(i8* %_27.0182186) #6
  br label %if.end107

if.end107:                                        ; preds = %if.end104, %if.then106
  call void @exit(i32 0) #7
  unreachable

if.end26.i.1:                                     ; preds = %blklab4.i
  %arrayidx.i.1 = getelementptr inbounds i64, i64* %call18, i64 %index.076.i
  store i64 %34, i64* %arrayidx.i.1, align 8, !tbaa !1
  store i64 %33, i64* %arrayidx23.i.1, align 8, !tbaa !1
  br label %blklab4.i.1

blklab4.i.1:                                      ; preds = %if.end26.i.1, %blklab4.i
  %51 = phi i64 [ %34, %blklab4.i ], [ %33, %if.end26.i.1 ]
  %last_swapped.1.i.1 = phi i64 [ %last_swapped.1.i, %blklab4.i ], [ %add.i, %if.end26.i.1 ]
  %add.i.1 = add nsw i64 %index.076.i, 2
  %exitcond.i.1 = icmp eq i64 %add.i.1, %length.078.i
  br i1 %exitcond.i.1, label %while.cond.loopexit.i.unr-lcssa, label %if.end22.i
}

declare void @free2DArray_int64_t(i64**, i64) local_unnamed_addr #4

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #4

declare i64* @parseStringToInt(i64*) local_unnamed_addr #4

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
