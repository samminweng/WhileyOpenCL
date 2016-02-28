; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i32*, i32, i32 }

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @init(i32 %value, i32 %width, i32 %height) #0 {
entry:
  %mul = mul nsw i32 %height, %width
  %conv = sext i32 %mul to i64
  %mul1 = shl nsw i64 %conv, 2
  %call = tail call noalias i8* @malloc(i64 %mul1) #6
  %0 = bitcast i8* %call to i32*
  %cmp3 = icmp sgt i32 %height, 0
  br i1 %cmp3, label %for.cond3.preheader.lr.ph, label %for.end10

for.cond3.preheader.lr.ph:                        ; preds = %entry
  %1 = sext i32 %width to i64
  %cmp41 = icmp sgt i32 %width, 0
  br i1 %cmp41, label %for.body6.preheader.us.preheader, label %for.end10

for.body6.preheader.us.preheader:                 ; preds = %for.cond3.preheader.lr.ph
  %2 = add i32 %width, -1
  %3 = zext i32 %2 to i64
  %4 = add nuw nsw i64 %3, 1
  %5 = and i64 %4, 8589934584
  %6 = add nsw i64 %5, -8
  %7 = lshr exact i64 %6, 3
  %8 = add nuw nsw i64 %7, 1
  %min.iters.check = icmp ult i64 %4, 8
  %n.vec = and i64 %4, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert13 = insertelement <4 x i32> undef, i32 %value, i32 0
  %broadcast.splat14 = shufflevector <4 x i32> %broadcast.splatinsert13, <4 x i32> undef, <4 x i32> zeroinitializer
  %xtraiter = and i64 %8, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %9 = icmp ult i64 %6, 24
  %cmp.n = icmp eq i64 %4, %n.vec
  br label %for.body6.preheader.us

for.body6.us:                                     ; preds = %for.body6.us.preheader, %for.body6.us
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us, %for.body6.us ], [ %indvars.iv.us.ph, %for.body6.us.preheader ]
  %10 = add nsw i64 %indvars.iv.us, %11
  %arrayidx.us = getelementptr inbounds i32, i32* %0, i64 %10
  store i32 %value, i32* %arrayidx.us, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %lftr.wideiv4 = trunc i64 %indvars.iv.next.us to i32
  %exitcond5 = icmp eq i32 %lftr.wideiv4, %width
  br i1 %exitcond5, label %for.inc8.loopexit.us.loopexit, label %for.body6.us, !llvm.loop !1

for.body6.preheader.us:                           ; preds = %for.body6.preheader.us.preheader, %for.inc8.loopexit.us
  %indvars.iv7.us = phi i64 [ %indvars.iv.next8.us, %for.inc8.loopexit.us ], [ 0, %for.body6.preheader.us.preheader ]
  %11 = mul nsw i64 %indvars.iv7.us, %1
  br i1 %min.iters.check, label %for.body6.us.preheader, label %min.iters.checked

for.body6.us.preheader:                           ; preds = %middle.block, %min.iters.checked, %for.body6.preheader.us
  %indvars.iv.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body6.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body6.us

min.iters.checked:                                ; preds = %for.body6.preheader.us
  br i1 %cmp.zero, label %for.body6.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br i1 %lcmp.mod, label %vector.ph.split, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %12 = add i64 %index.prol, %11
  %13 = getelementptr inbounds i32, i32* %0, i64 %12
  %14 = bitcast i32* %13 to <4 x i32>*
  store <4 x i32> %broadcast.splat14, <4 x i32>* %14, align 4
  %15 = getelementptr i32, i32* %13, i64 4
  %16 = bitcast i32* %15 to <4 x i32>*
  store <4 x i32> %broadcast.splat14, <4 x i32>* %16, align 4
  %index.next.prol = add i64 %index.prol, 8
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.ph.split.loopexit, label %vector.body.prol, !llvm.loop !5

vector.ph.split.loopexit:                         ; preds = %vector.body.prol
  %index.next.prol.lcssa = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.ph.split

vector.ph.split:                                  ; preds = %vector.ph, %vector.ph.split.loopexit
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.prol.lcssa, %vector.ph.split.loopexit ]
  br i1 %9, label %middle.block, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i64 [ %index.unr, %vector.ph.split.split ], [ %index.next.3, %vector.body ]
  %17 = add i64 %index, %11
  %18 = getelementptr inbounds i32, i32* %0, i64 %17
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> %broadcast.splat14, <4 x i32>* %19, align 4
  %20 = getelementptr i32, i32* %18, i64 4
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> %broadcast.splat14, <4 x i32>* %21, align 4
  %index.next = add i64 %index, 8
  %22 = add i64 %index.next, %11
  %23 = getelementptr inbounds i32, i32* %0, i64 %22
  %24 = bitcast i32* %23 to <4 x i32>*
  store <4 x i32> %broadcast.splat14, <4 x i32>* %24, align 4
  %25 = getelementptr i32, i32* %23, i64 4
  %26 = bitcast i32* %25 to <4 x i32>*
  store <4 x i32> %broadcast.splat14, <4 x i32>* %26, align 4
  %index.next.1 = add i64 %index, 16
  %27 = add i64 %index.next.1, %11
  %28 = getelementptr inbounds i32, i32* %0, i64 %27
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> %broadcast.splat14, <4 x i32>* %29, align 4
  %30 = getelementptr i32, i32* %28, i64 4
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> %broadcast.splat14, <4 x i32>* %31, align 4
  %index.next.2 = add i64 %index, 24
  %32 = add i64 %index.next.2, %11
  %33 = getelementptr inbounds i32, i32* %0, i64 %32
  %34 = bitcast i32* %33 to <4 x i32>*
  store <4 x i32> %broadcast.splat14, <4 x i32>* %34, align 4
  %35 = getelementptr i32, i32* %33, i64 4
  %36 = bitcast i32* %35 to <4 x i32>*
  store <4 x i32> %broadcast.splat14, <4 x i32>* %36, align 4
  %index.next.3 = add i64 %index, 32
  %37 = icmp eq i64 %index.next.3, %n.vec
  br i1 %37, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !7

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.ph.split, %middle.block.unr-lcssa
  br i1 %cmp.n, label %for.inc8.loopexit.us, label %for.body6.us.preheader

for.inc8.loopexit.us.loopexit:                    ; preds = %for.body6.us
  br label %for.inc8.loopexit.us

for.inc8.loopexit.us:                             ; preds = %for.inc8.loopexit.us.loopexit, %middle.block
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv7.us, 1
  %lftr.wideiv6 = trunc i64 %indvars.iv.next8.us to i32
  %exitcond7 = icmp eq i32 %lftr.wideiv6, %height
  br i1 %exitcond7, label %for.end10.loopexit, label %for.body6.preheader.us

for.end10.loopexit:                               ; preds = %for.inc8.loopexit.us
  br label %for.end10

for.end10:                                        ; preds = %for.end10.loopexit, %for.cond3.preheader.lr.ph, %entry
  %call11 = tail call noalias i8* @malloc(i64 16) #6
  %38 = bitcast i8* %call11 to %struct.Matrix*
  %39 = bitcast i8* %call11 to i8**
  store i8* %call, i8** %39, align 8
  %width13 = getelementptr inbounds i8, i8* %call11, i64 8
  %40 = bitcast i8* %width13 to i32*
  store i32 %width, i32* %40, align 8
  %height14 = getelementptr inbounds i8, i8* %call11, i64 12
  %41 = bitcast i8* %height14 to i32*
  store i32 %height, i32* %41, align 4
  ret %struct.Matrix* %38
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @matrix_multiply(%struct.Matrix* noalias %A, %struct.Matrix* noalias nocapture readonly %B) #2 {
entry:
  %polly.par.userContext39 = alloca { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, align 8
  %polly.par.userContext = alloca { i32, i32, i32, i32, i8*, %struct.Matrix* }, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 0
  %0 = load i32*, i32** %data, align 8
  %data1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 0
  %1 = load i32*, i32** %data1, align 8
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 1
  %2 = load i32, i32* %width2, align 8
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 2
  %3 = load i32, i32* %height3, align 4
  %mul = mul nsw i32 %3, %2
  %conv = sext i32 %mul to i64
  %mul4 = shl nsw i64 %conv, 2
  %call = tail call noalias i8* @malloc(i64 %mul4) #6
  %4 = bitcast i8* %call to i32*
  %cmp6 = icmp sgt i32 %3, 0
  br i1 %cmp6, label %for.cond7.preheader.lr.ph, label %for.end41

for.cond7.preheader.lr.ph:                        ; preds = %entry
  %5 = sext i32 %2 to i64
  %6 = icmp sgt i32 %2, 0
  br i1 %6, label %polly.preload.exec, label %polly.preload.merge

polly.preload.merge:                              ; preds = %polly.preload.exec, %for.cond7.preheader.lr.ph
  %7 = phi i32 [ %57, %polly.preload.exec ], [ %3, %for.cond7.preheader.lr.ph ]
  %polly.preload..merge = phi i32 [ %55, %polly.preload.exec ], [ 0, %for.cond7.preheader.lr.ph ]
  %8 = icmp sge i32 %2, %polly.preload..merge
  %9 = sext i32 %polly.preload..merge to i64
  %polly.access.add. = mul nsw i64 %9, %5
  %polly.access. = getelementptr i32, i32* %1, i64 %polly.access.add.
  %10 = icmp ule i32* %polly.access., %4
  %11 = sext i32 %3 to i64
  %12 = add nsw i64 %11, -1
  %polly.access.mul.call6 = mul i64 %12, %5
  %polly.access.add.call7 = mul nsw i64 %11, %5
  %polly.access.call8 = getelementptr i32, i32* %4, i64 %polly.access.add.call7
  %13 = icmp ule i32* %polly.access.call8, %1
  %14 = or i1 %13, %10
  %15 = and i1 %8, %14
  %polly.access.add.13 = add i64 %9, %polly.access.mul.call6
  %polly.access.14 = getelementptr i32, i32* %0, i64 %polly.access.add.13
  %16 = icmp ule i32* %polly.access.14, %4
  %17 = icmp ule i32* %polly.access.call8, %0
  %18 = or i1 %17, %16
  %19 = and i1 %18, %15
  br i1 %19, label %polly.parallel.for37, label %for.cond7.preheader.preheader

for.cond7.preheader.preheader:                    ; preds = %polly.preload.merge
  br i1 %6, label %for.body11.preheader.us.preheader, label %for.inc39.preheader

for.inc39.preheader:                              ; preds = %for.cond7.preheader.preheader
  %20 = sext i32 %7 to i64
  %21 = icmp sgt i64 %20, 1
  %smax = select i1 %21, i64 %20, i64 1
  %min.iters.check = icmp ult i64 %smax, 16
  br i1 %min.iters.check, label %for.inc39.preheader71, label %min.iters.checked

for.inc39.preheader71:                            ; preds = %middle.block, %min.iters.checked, %for.inc39.preheader
  %indvars.iv17.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.inc39.preheader ], [ %n.vec, %middle.block ]
  br label %for.inc39

min.iters.checked:                                ; preds = %for.inc39.preheader
  %n.vec = and i64 %smax, -16
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.inc39.preheader71, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %22 = add nsw i64 %n.vec, -16
  %23 = lshr exact i64 %22, 4
  %24 = add nuw nsw i64 %23, 1
  %xtraiter73 = and i64 %24, 7
  %lcmp.mod74 = icmp eq i64 %xtraiter73, 0
  br i1 %lcmp.mod74, label %vector.body.preheader.split, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter73, %vector.body.prol.preheader ]
  %index.next.prol = add i64 %index.prol, 16
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.preheader.split.loopexit, label %vector.body.prol, !llvm.loop !8

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.next.prol.lcssa = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol.lcssa, %vector.body.preheader.split.loopexit ]
  %25 = icmp ult i64 %22, 112
  br i1 %25, label %middle.block, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.7, %vector.body ]
  %index.next.7 = add i64 %index, 128
  %26 = icmp eq i64 %index.next.7, %n.vec
  br i1 %26, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !9

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax, %n.vec
  br i1 %cmp.n, label %for.end41, label %for.inc39.preheader71

for.body11.preheader.us.preheader:                ; preds = %for.cond7.preheader.preheader
  %width14 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 1
  %.phi.trans.insert = bitcast i32* %width14 to i64*
  %.pre.pre = load i64, i64* %.phi.trans.insert, align 8
  %27 = trunc i64 %.pre.pre to i32
  %cmp151.us = icmp sgt i32 %27, 0
  %sext = shl i64 %.pre.pre, 32
  %28 = ashr exact i64 %sext, 32
  %29 = ashr i64 %.pre.pre, 32
  %xtraiter = and i64 %28, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %30 = icmp eq i64 %28, 1
  br label %for.body11.preheader.us

for.body11.us:                                    ; preds = %for.body11.preheader.us, %for.inc36.us
  %indvars.iv12.us = phi i64 [ %indvars.iv.next13.us, %for.inc36.us ], [ 0, %for.body11.preheader.us ]
  %31 = add nsw i64 %indvars.iv12.us, %45
  %arrayidx.us = getelementptr inbounds i32, i32* %4, i64 %31
  store i32 0, i32* %arrayidx.us, align 4
  br i1 %cmp151.us, label %for.body17.us.preheader, label %for.inc36.us

for.body17.us.preheader:                          ; preds = %for.body11.us
  br i1 %lcmp.mod, label %for.body17.us.preheader.split, label %for.body17.us.prol

for.body17.us.prol:                               ; preds = %for.body17.us.preheader
  %32 = load i32, i32* %arrayidx25.us.prol, align 4
  %arrayidx29.us.prol = getelementptr inbounds i32, i32* %1, i64 %indvars.iv12.us
  %33 = load i32, i32* %arrayidx29.us.prol, align 4
  %mul30.us.prol = mul nsw i32 %33, %32
  store i32 %mul30.us.prol, i32* %arrayidx.us, align 4
  br label %for.body17.us.preheader.split

for.body17.us.preheader.split:                    ; preds = %for.body17.us.preheader, %for.body17.us.prol
  %.unr = phi i32 [ 0, %for.body17.us.preheader ], [ %mul30.us.prol, %for.body17.us.prol ]
  %indvars.iv.us.unr = phi i64 [ 0, %for.body17.us.preheader ], [ 1, %for.body17.us.prol ]
  br i1 %30, label %for.inc36.us.loopexit, label %for.body17.us.preheader.split.split

for.body17.us.preheader.split.split:              ; preds = %for.body17.us.preheader.split
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us, %for.body17.us.preheader.split.split
  %34 = phi i32 [ %.unr, %for.body17.us.preheader.split.split ], [ %add31.us.1, %for.body17.us ]
  %indvars.iv.us = phi i64 [ %indvars.iv.us.unr, %for.body17.us.preheader.split.split ], [ %indvars.iv.next.us.1, %for.body17.us ]
  %35 = add nsw i64 %indvars.iv.us, %45
  %arrayidx25.us = getelementptr inbounds i32, i32* %0, i64 %35
  %36 = load i32, i32* %arrayidx25.us, align 4
  %37 = mul nsw i64 %indvars.iv.us, %5
  %38 = add nsw i64 %37, %indvars.iv12.us
  %arrayidx29.us = getelementptr inbounds i32, i32* %1, i64 %38
  %39 = load i32, i32* %arrayidx29.us, align 4
  %mul30.us = mul nsw i32 %39, %36
  %add31.us = add nsw i32 %mul30.us, %34
  store i32 %add31.us, i32* %arrayidx.us, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %40 = add nsw i64 %indvars.iv.next.us, %45
  %arrayidx25.us.1 = getelementptr inbounds i32, i32* %0, i64 %40
  %41 = load i32, i32* %arrayidx25.us.1, align 4
  %42 = mul nsw i64 %indvars.iv.next.us, %5
  %43 = add nsw i64 %42, %indvars.iv12.us
  %arrayidx29.us.1 = getelementptr inbounds i32, i32* %1, i64 %43
  %44 = load i32, i32* %arrayidx29.us.1, align 4
  %mul30.us.1 = mul nsw i32 %44, %41
  %add31.us.1 = add nsw i32 %mul30.us.1, %add31.us
  store i32 %add31.us.1, i32* %arrayidx.us, align 4
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2
  %cmp15.us.1 = icmp slt i64 %indvars.iv.next.us.1, %28
  br i1 %cmp15.us.1, label %for.body17.us, label %for.inc36.us.loopexit.unr-lcssa

for.inc36.us.loopexit.unr-lcssa:                  ; preds = %for.body17.us
  br label %for.inc36.us.loopexit

for.inc36.us.loopexit:                            ; preds = %for.body17.us.preheader.split, %for.inc36.us.loopexit.unr-lcssa
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.inc36.us.loopexit, %for.body11.us
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv12.us, 1
  %cmp9.us = icmp slt i64 %indvars.iv.next13.us, %5
  br i1 %cmp9.us, label %for.body11.us, label %for.inc39.loopexit.us

for.body11.preheader.us:                          ; preds = %for.body11.preheader.us.preheader, %for.inc39.loopexit.us
  %indvars.iv17.us = phi i64 [ %indvars.iv.next18.us, %for.inc39.loopexit.us ], [ 0, %for.body11.preheader.us.preheader ]
  %45 = mul nsw i64 %indvars.iv17.us, %5
  %arrayidx25.us.prol = getelementptr inbounds i32, i32* %0, i64 %45
  br label %for.body11.us

for.inc39.loopexit.us:                            ; preds = %for.inc36.us
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv17.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next18.us, %29
  br i1 %cmp.us, label %for.body11.preheader.us, label %for.end41.loopexit

for.inc39:                                        ; preds = %for.inc39.preheader71, %for.inc39
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.inc39 ], [ %indvars.iv17.ph, %for.inc39.preheader71 ]
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %cmp = icmp slt i64 %indvars.iv.next18, %20
  br i1 %cmp, label %for.inc39, label %for.end41.loopexit72, !llvm.loop !10

for.end41.loopexit:                               ; preds = %for.inc39.loopexit.us
  br label %for.end41

for.end41.loopexit72:                             ; preds = %for.inc39
  br label %for.end41

for.end41:                                        ; preds = %for.end41.loopexit72, %for.end41.loopexit, %middle.block, %polly.parallel.for37, %entry
  %call42 = tail call noalias i8* @malloc(i64 16) #6
  %46 = bitcast i8* %call42 to %struct.Matrix*
  %47 = bitcast i8* %call42 to i8**
  store i8* %call, i8** %47, align 8
  %width44 = getelementptr inbounds i8, i8* %call42, i64 8
  %48 = bitcast i8* %width44 to i32*
  store i32 %2, i32* %48, align 8
  %height45 = getelementptr inbounds i8, i8* %call42, i64 12
  %49 = bitcast i8* %height45 to i32*
  store i32 %3, i32* %49, align 4
  ret %struct.Matrix* %46

polly.parallel.for37:                             ; preds = %polly.preload.merge
  %polly.fdiv_q.shr = ashr i64 %12, 5
  %50 = bitcast { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 32, i8* %50)
  %polly.subfn.storeaddr.polly.access.A.load = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 0
  store i32 %3, i32* %polly.subfn.storeaddr.polly.access.A.load, align 8
  %polly.subfn.storeaddr.polly.access.B.load = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 1
  store i32 %2, i32* %polly.subfn.storeaddr.polly.access.B.load, align 4
  %polly.subfn.storeaddr.polly.preload..merge = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 2
  store i32 %polly.preload..merge, i32* %polly.subfn.storeaddr.polly.preload..merge, align 8
  %polly.subfn.storeaddr. = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 3
  store i32 %2, i32* %polly.subfn.storeaddr., align 4
  %polly.subfn.storeaddr.call = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 4
  store i8* %call, i8** %polly.subfn.storeaddr.call, align 8
  %polly.subfn.storeaddr.A = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 5
  store %struct.Matrix* %A, %struct.Matrix** %polly.subfn.storeaddr.A, align 8
  %51 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @matrix_multiply_polly_subfn, i8* %50, i32 0, i64 0, i64 %51, i64 1) #6
  call void @matrix_multiply_polly_subfn(i8* %50) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %50)
  %52 = bitcast { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39 to i8*
  call void @llvm.lifetime.start(i64 48, i8* %52)
  %polly.subfn.storeaddr.polly.access.A.load40 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 0
  store i32 %3, i32* %polly.subfn.storeaddr.polly.access.A.load40, align 8
  %polly.subfn.storeaddr.polly.access.B.load41 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 1
  store i32 %2, i32* %polly.subfn.storeaddr.polly.access.B.load41, align 4
  %polly.subfn.storeaddr.polly.preload..merge42 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 2
  store i32 %polly.preload..merge, i32* %polly.subfn.storeaddr.polly.preload..merge42, align 8
  %polly.subfn.storeaddr.43 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 3
  store i32 %2, i32* %polly.subfn.storeaddr.43, align 4
  %polly.subfn.storeaddr.call44 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 4
  store i8* %call, i8** %polly.subfn.storeaddr.call44, align 8
  %polly.subfn.storeaddr.45 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 5
  store i32* %0, i32** %polly.subfn.storeaddr.45, align 8
  %polly.subfn.storeaddr.46 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 6
  store i32* %1, i32** %polly.subfn.storeaddr.46, align 8
  %polly.subfn.storeaddr.A47 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 7
  store %struct.Matrix* %A, %struct.Matrix** %polly.subfn.storeaddr.A47, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @matrix_multiply_polly_subfn_2, i8* %52, i32 0, i64 0, i64 %51, i64 1) #6
  call void @matrix_multiply_polly_subfn_2(i8* %52) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %52)
  br label %for.end41

polly.preload.exec:                               ; preds = %for.cond7.preheader.lr.ph
  %53 = getelementptr %struct.Matrix, %struct.Matrix* %A, i64 0, i32 1
  %54 = bitcast i32* %53 to i64*
  %polly.access.A3.load = load i64, i64* %54, align 8
  %55 = trunc i64 %polly.access.A3.load to i32
  %56 = lshr i64 %polly.access.A3.load, 32
  %57 = trunc i64 %56 to i32
  br label %polly.preload.merge
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6
  %0 = load i64*, i64** %call, align 8
  %call1 = tail call i64 @parseStringToInt(i64* %0) #6
  %conv = trunc i64 %call1 to i32
  %mul.i = shl i64 %call1, 2
  %conv.i24 = mul i64 %mul.i, %call1
  %mul1.i = and i64 %conv.i24, 17179869180
  %call.i = tail call noalias i8* @malloc(i64 %mul1.i) #6
  %1 = bitcast i8* %call.i to i32*
  %cmp3.i = icmp sgt i32 %conv, 0
  br i1 %cmp3.i, label %for.cond3.preheader.lr.ph.i, label %init.exit

for.cond3.preheader.lr.ph.i:                      ; preds = %entry
  %sext26 = shl i64 %call1, 32
  %2 = ashr exact i64 %sext26, 32
  %3 = add i64 %call1, 4294967295
  %4 = and i64 %3, 4294967295
  %5 = add nuw nsw i64 %4, 1
  %min.iters.check = icmp ult i64 %5, 8
  %n.mod.vf = and i64 %call1, 7
  %n.vec = sub nsw i64 %5, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br label %for.body6.preheader.us.i

for.body6.us.i:                                   ; preds = %for.body6.us.i.preheader, %for.body6.us.i
  %indvars.iv.us.i = phi i64 [ %indvars.iv.next.us.i, %for.body6.us.i ], [ %indvars.iv.us.i.ph, %for.body6.us.i.preheader ]
  %6 = add nsw i64 %indvars.iv.us.i, %7
  %arrayidx.us.i = getelementptr inbounds i32, i32* %1, i64 %6
  store i32 1, i32* %arrayidx.us.i, align 4
  %indvars.iv.next.us.i = add nuw nsw i64 %indvars.iv.us.i, 1
  %lftr.wideiv29 = trunc i64 %indvars.iv.next.us.i to i32
  %exitcond30 = icmp eq i32 %lftr.wideiv29, %conv
  br i1 %exitcond30, label %for.inc8.loopexit.us.i.loopexit, label %for.body6.us.i, !llvm.loop !11

for.body6.preheader.us.i:                         ; preds = %for.cond3.preheader.lr.ph.i, %for.inc8.loopexit.us.i
  %indvars.iv7.us.i = phi i64 [ %indvars.iv.next8.us.i, %for.inc8.loopexit.us.i ], [ 0, %for.cond3.preheader.lr.ph.i ]
  %7 = mul nsw i64 %indvars.iv7.us.i, %2
  br i1 %min.iters.check, label %for.body6.us.i.preheader, label %min.iters.checked

for.body6.us.i.preheader:                         ; preds = %middle.block, %min.iters.checked, %for.body6.preheader.us.i
  %indvars.iv.us.i.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body6.preheader.us.i ], [ %n.vec, %middle.block ]
  br label %for.body6.us.i

min.iters.checked:                                ; preds = %for.body6.preheader.us.i
  br i1 %cmp.zero, label %for.body6.us.i.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %8 = add i64 %index, %7
  %9 = getelementptr inbounds i32, i32* %1, i64 %8
  %10 = bitcast i32* %9 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 4
  %11 = getelementptr i32, i32* %9, i64 4
  %12 = bitcast i32* %11 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %12, align 4
  %index.next = add i64 %index, 8
  %13 = icmp eq i64 %index.next, %n.vec
  br i1 %13, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc8.loopexit.us.i, label %for.body6.us.i.preheader

for.inc8.loopexit.us.i.loopexit:                  ; preds = %for.body6.us.i
  br label %for.inc8.loopexit.us.i

for.inc8.loopexit.us.i:                           ; preds = %for.inc8.loopexit.us.i.loopexit, %middle.block
  %indvars.iv.next8.us.i = add nuw nsw i64 %indvars.iv7.us.i, 1
  %lftr.wideiv31 = trunc i64 %indvars.iv.next8.us.i to i32
  %exitcond32 = icmp eq i32 %lftr.wideiv31, %conv
  br i1 %exitcond32, label %init.exit.loopexit, label %for.body6.preheader.us.i

init.exit.loopexit:                               ; preds = %for.inc8.loopexit.us.i
  br label %init.exit

init.exit:                                        ; preds = %init.exit.loopexit, %entry
  %call11.i = tail call noalias i8* @malloc(i64 16) #6
  %14 = bitcast i8* %call11.i to %struct.Matrix*
  %15 = bitcast i8* %call11.i to i8**
  store i8* %call.i, i8** %15, align 8
  %width13.i = getelementptr inbounds i8, i8* %call11.i, i64 8
  %16 = bitcast i8* %width13.i to i32*
  store i32 %conv, i32* %16, align 8
  %height14.i = getelementptr inbounds i8, i8* %call11.i, i64 12
  %17 = bitcast i8* %height14.i to i32*
  store i32 %conv, i32* %17, align 4
  %call.i4 = tail call noalias i8* @malloc(i64 %mul1.i) #6
  %18 = bitcast i8* %call.i4 to i32*
  %sext25 = shl i64 %call1, 32
  br i1 %cmp3.i, label %for.cond3.preheader.lr.ph.i7, label %init.exit23

for.cond3.preheader.lr.ph.i7:                     ; preds = %init.exit
  %19 = ashr exact i64 %sext25, 32
  %20 = add i64 %call1, 4294967295
  %21 = and i64 %20, 4294967295
  %22 = add nuw nsw i64 %21, 1
  %min.iters.check41 = icmp ult i64 %22, 8
  %n.mod.vf43 = and i64 %call1, 7
  %n.vec44 = sub nsw i64 %22, %n.mod.vf43
  %cmp.zero45 = icmp eq i64 %n.vec44, 0
  %cmp.n50 = icmp eq i64 %n.mod.vf43, 0
  br label %for.body6.preheader.us.i15

for.body6.us.i13:                                 ; preds = %for.body6.us.i13.preheader, %for.body6.us.i13
  %indvars.iv.us.i8 = phi i64 [ %indvars.iv.next.us.i10, %for.body6.us.i13 ], [ %indvars.iv.us.i8.ph, %for.body6.us.i13.preheader ]
  %23 = add nsw i64 %indvars.iv.us.i8, %24
  %arrayidx.us.i9 = getelementptr inbounds i32, i32* %18, i64 %23
  store i32 1, i32* %arrayidx.us.i9, align 4
  %indvars.iv.next.us.i10 = add nuw nsw i64 %indvars.iv.us.i8, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.us.i10 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %conv
  br i1 %exitcond, label %for.inc8.loopexit.us.i19.loopexit, label %for.body6.us.i13, !llvm.loop !13

for.body6.preheader.us.i15:                       ; preds = %for.cond3.preheader.lr.ph.i7, %for.inc8.loopexit.us.i19
  %indvars.iv7.us.i14 = phi i64 [ %indvars.iv.next8.us.i16, %for.inc8.loopexit.us.i19 ], [ 0, %for.cond3.preheader.lr.ph.i7 ]
  %24 = mul nsw i64 %indvars.iv7.us.i14, %19
  br i1 %min.iters.check41, label %for.body6.us.i13.preheader, label %min.iters.checked42

for.body6.us.i13.preheader:                       ; preds = %middle.block39, %min.iters.checked42, %for.body6.preheader.us.i15
  %indvars.iv.us.i8.ph = phi i64 [ 0, %min.iters.checked42 ], [ 0, %for.body6.preheader.us.i15 ], [ %n.vec44, %middle.block39 ]
  br label %for.body6.us.i13

min.iters.checked42:                              ; preds = %for.body6.preheader.us.i15
  br i1 %cmp.zero45, label %for.body6.us.i13.preheader, label %vector.body38.preheader

vector.body38.preheader:                          ; preds = %min.iters.checked42
  br label %vector.body38

vector.body38:                                    ; preds = %vector.body38.preheader, %vector.body38
  %index47 = phi i64 [ %index.next48, %vector.body38 ], [ 0, %vector.body38.preheader ]
  %25 = add i64 %index47, %24
  %26 = getelementptr inbounds i32, i32* %18, i64 %25
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %27, align 4
  %28 = getelementptr i32, i32* %26, i64 4
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %29, align 4
  %index.next48 = add i64 %index47, 8
  %30 = icmp eq i64 %index.next48, %n.vec44
  br i1 %30, label %middle.block39, label %vector.body38, !llvm.loop !14

middle.block39:                                   ; preds = %vector.body38
  br i1 %cmp.n50, label %for.inc8.loopexit.us.i19, label %for.body6.us.i13.preheader

for.inc8.loopexit.us.i19.loopexit:                ; preds = %for.body6.us.i13
  br label %for.inc8.loopexit.us.i19

for.inc8.loopexit.us.i19:                         ; preds = %for.inc8.loopexit.us.i19.loopexit, %middle.block39
  %indvars.iv.next8.us.i16 = add nuw nsw i64 %indvars.iv7.us.i14, 1
  %lftr.wideiv27 = trunc i64 %indvars.iv.next8.us.i16 to i32
  %exitcond28 = icmp eq i32 %lftr.wideiv27, %conv
  br i1 %exitcond28, label %init.exit23.loopexit, label %for.body6.preheader.us.i15

init.exit23.loopexit:                             ; preds = %for.inc8.loopexit.us.i19
  br label %init.exit23

init.exit23:                                      ; preds = %init.exit23.loopexit, %init.exit
  %call11.i20 = tail call noalias i8* @malloc(i64 16) #6
  %31 = bitcast i8* %call11.i20 to %struct.Matrix*
  %32 = bitcast i8* %call11.i20 to i8**
  store i8* %call.i4, i8** %32, align 8
  %width13.i21 = getelementptr inbounds i8, i8* %call11.i20, i64 8
  %33 = bitcast i8* %width13.i21 to i32*
  store i32 %conv, i32* %33, align 8
  %height14.i22 = getelementptr inbounds i8, i8* %call11.i20, i64 12
  %34 = bitcast i8* %height14.i22 to i32*
  store i32 %conv, i32* %34, align 4
  %call4 = tail call %struct.Matrix* @matrix_multiply(%struct.Matrix* %14, %struct.Matrix* %31)
  %sub = add nsw i32 %conv, -1
  %sub7 = mul i64 %sext25, %call1
  %sext = add i64 %sub7, -4294967296
  %idxprom = ashr exact i64 %sext, 32
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0
  %35 = load i32*, i32** %data, align 8
  %arrayidx8 = getelementptr inbounds i32, i32* %35, i64 %idxprom
  %36 = load i32, i32* %arrayidx8, align 4
  %call9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv, i32 %sub, i32 %sub, i32 %36) #6
  ret i32 0
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64 @parseStringToInt(i64*) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #4

define internal void @matrix_multiply_polly_subfn(i8* nocapture readonly %polly.par.userContext) #5 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i32*
  %polly.subfunc.arg.polly.access.A.load = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 4
  %2 = bitcast i8* %1 to i32*
  %polly.subfunc.arg.polly.access.B.load = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 12
  %4 = bitcast i8* %3 to i32*
  %polly.subfunc.arg. = load i32, i32* %4, align 4
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %6 = bitcast i8* %5 to i8**
  %polly.subfunc.arg.call = load i8*, i8** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %9 = sext i32 %polly.subfunc.arg. to i64
  %10 = sext i32 %polly.subfunc.arg.polly.access.B.load to i64
  %11 = add nsw i64 %10, -1
  %polly.fdiv_q.shr = ashr i64 %11, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %12 = sext i32 %polly.subfunc.arg.polly.access.A.load to i64
  %13 = shl nsw i64 %9, 2
  %14 = shl nsw i64 %9, 7
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %15 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.par.loadIVBounds
  %indvar = phi i64 [ %indvar.next, %polly.loop_exit4 ], [ 0, %polly.par.loadIVBounds ]
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit4 ], [ %polly.par.LB, %polly.par.loadIVBounds ]
  %17 = add i64 %polly.par.LB, %indvar
  %18 = mul i64 %14, %17
  br i1 %polly.loop_guard, label %polly.loop_header2.preheader, label %polly.loop_exit4

polly.loop_header2.preheader:                     ; preds = %polly.loop_header
  %19 = shl nsw i64 %polly.indvar, 5
  %20 = sub nsw i64 %12, %19
  %21 = add nsw i64 %20, -1
  %22 = icmp sgt i64 %21, 31
  %23 = select i1 %22, i64 31, i64 %21
  %polly.loop_guard13 = icmp sgt i64 %23, -1
  %polly.adjust_ub16 = add i64 %23, -1
  br i1 %polly.loop_guard13, label %polly.loop_header10.preheader.us.preheader, label %polly.loop_exit4

polly.loop_header10.preheader.us.preheader:       ; preds = %polly.loop_header2.preheader
  br label %polly.loop_header10.preheader.us

polly.loop_header10.preheader.us:                 ; preds = %polly.loop_header10.preheader.us.preheader, %polly.loop_exit12.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit12.loopexit.us ], [ 0, %polly.loop_header10.preheader.us.preheader ]
  %24 = shl i64 %polly.indvar5.us, 7
  %25 = add i64 %18, %24
  %26 = shl i64 %polly.indvar5.us, 5
  %27 = sub i64 %26, %10
  %28 = icmp sgt i64 %27, -32
  %smax = select i1 %28, i64 %27, i64 -32
  %29 = sub i64 -2, %smax
  %30 = icmp sgt i64 %29, -1
  %smax48 = select i1 %30, i64 %29, i64 -1
  %31 = shl i64 %smax48, 2
  %32 = add i64 %31, 8
  %polly.loop_guard22.us49 = icmp slt i64 %26, %10
  br i1 %polly.loop_guard22.us49, label %polly.stmt.for.body11.preheader.us.us.preheader, label %polly.loop_exit12.loopexit.us

polly.stmt.for.body11.preheader.us.us.preheader:  ; preds = %polly.loop_header10.preheader.us
  br label %polly.stmt.for.body11.preheader.us.us

polly.loop_exit12.loopexit.us.loopexit:           ; preds = %polly.stmt.for.body11.preheader.us.us
  br label %polly.loop_exit12.loopexit.us

polly.loop_exit12.loopexit.us:                    ; preds = %polly.loop_exit12.loopexit.us.loopexit, %polly.loop_header10.preheader.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar5.us, %polly.fdiv_q.shr
  br i1 %exitcond.us, label %polly.loop_exit4.loopexit, label %polly.loop_header10.preheader.us

polly.stmt.for.body11.preheader.us.us:            ; preds = %polly.stmt.for.body11.preheader.us.us.preheader, %polly.stmt.for.body11.preheader.us.us
  %polly.indvar14.us.us = phi i64 [ %polly.indvar_next15.us.us, %polly.stmt.for.body11.preheader.us.us ], [ 0, %polly.stmt.for.body11.preheader.us.us.preheader ]
  %33 = mul i64 %13, %polly.indvar14.us.us
  %34 = add i64 %25, %33
  %scevgep = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %32, i32 4, i1 false)
  %polly.indvar_next15.us.us = add nuw nsw i64 %polly.indvar14.us.us, 1
  %polly.loop_cond17.us.us = icmp sgt i64 %polly.indvar14.us.us, %polly.adjust_ub16
  br i1 %polly.loop_cond17.us.us, label %polly.loop_exit12.loopexit.us.loopexit, label %polly.stmt.for.body11.preheader.us.us

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit12.loopexit.us
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_header2.preheader, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  %indvar.next = add i64 %indvar, 1
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #4

define internal void @matrix_multiply_polly_subfn_2(i8* nocapture readonly %polly.par.userContext) #5 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i32*
  %polly.subfunc.arg.polly.access.A.load = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 4
  %2 = bitcast i8* %1 to i32*
  %polly.subfunc.arg.polly.access.B.load = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %4 = bitcast i8* %3 to i32*
  %polly.subfunc.arg.polly.preload..merge = load i32, i32* %4, align 4
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 12
  %6 = bitcast i8* %5 to i32*
  %polly.subfunc.arg. = load i32, i32* %6, align 4
  %7 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %8 = bitcast i8* %7 to i8**
  %polly.subfunc.arg.call = load i8*, i8** %8, align 8
  %9 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 24
  %10 = bitcast i8* %9 to i32**
  %polly.subfunc.arg.2 = load i32*, i32** %10, align 8
  %11 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 32
  %12 = bitcast i8* %11 to i32**
  %polly.subfunc.arg.3 = load i32*, i32** %12, align 8
  %13 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %15 = sext i32 %polly.subfunc.arg. to i64
  %16 = sext i32 %polly.subfunc.arg.polly.access.B.load to i64
  %17 = add nsw i64 %16, -1
  %polly.fdiv_q.shr = ashr i64 %17, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %18 = sext i32 %polly.subfunc.arg.polly.preload..merge to i64
  %19 = add nsw i64 %18, -1
  %polly.fdiv_q.shr11 = ashr i64 %19, 5
  %polly.loop_guard16 = icmp sgt i64 %polly.fdiv_q.shr11, -1
  %20 = sext i32 %polly.subfunc.arg.polly.access.A.load to i64
  %ident.check = icmp eq i32 %polly.subfunc.arg., 1
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit6
  %21 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit6, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit6 ]
  br i1 %polly.loop_guard, label %polly.loop_header4.preheader, label %polly.loop_exit6

polly.loop_header4.preheader:                     ; preds = %polly.loop_header
  %23 = shl nsw i64 %polly.indvar, 5
  %24 = sub nsw i64 %20, %23
  %25 = add nsw i64 %24, -1
  %26 = icmp sgt i64 %25, 31
  %27 = select i1 %26, i64 31, i64 %25
  %polly.loop_guard25 = icmp sgt i64 %27, -1
  %polly.adjust_ub28 = add i64 %27, -1
  br label %polly.loop_header4

polly.loop_exit6.loopexit:                        ; preds = %polly.loop_exit15
  br label %polly.loop_exit6

polly.loop_exit6:                                 ; preds = %polly.loop_exit6.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header4:                               ; preds = %polly.loop_header4.preheader, %polly.loop_exit15
  %polly.indvar7 = phi i64 [ %polly.indvar_next8, %polly.loop_exit15 ], [ 0, %polly.loop_header4.preheader ]
  br i1 %polly.loop_guard16, label %polly.loop_header13.preheader, label %polly.loop_exit15

polly.loop_header13.preheader:                    ; preds = %polly.loop_header4
  %28 = shl nsw i64 %polly.indvar7, 5
  %29 = sub nsw i64 %16, %28
  %30 = add nsw i64 %29, -1
  %31 = icmp sgt i64 %30, 31
  %32 = select i1 %31, i64 31, i64 %30
  %polly.loop_guard34 = icmp sgt i64 %32, -1
  %polly.adjust_ub37 = add i64 %32, -1
  br label %polly.loop_header13

polly.loop_exit15.loopexit:                       ; preds = %polly.loop_exit24
  br label %polly.loop_exit15

polly.loop_exit15:                                ; preds = %polly.loop_exit15.loopexit, %polly.loop_header4
  %polly.indvar_next8 = add nuw nsw i64 %polly.indvar7, 1
  %exitcond58 = icmp eq i64 %polly.indvar7, %polly.fdiv_q.shr
  br i1 %exitcond58, label %polly.loop_exit6.loopexit, label %polly.loop_header4

polly.loop_header13:                              ; preds = %polly.loop_header13.preheader, %polly.loop_exit24
  %polly.indvar17 = phi i64 [ %polly.indvar_next18, %polly.loop_exit24 ], [ 0, %polly.loop_header13.preheader ]
  %33 = shl i64 %polly.indvar17, 5
  %34 = sub i64 %33, %18
  %35 = icmp sgt i64 %34, -32
  %smax = select i1 %35, i64 %34, i64 -32
  %36 = sub i64 -2, %smax
  %37 = icmp sgt i64 %36, -1
  %smax88 = select i1 %37, i64 %36, i64 -1
  %38 = add i64 %smax88, 2
  br i1 %polly.loop_guard25, label %polly.loop_header22.preheader, label %polly.loop_exit24

polly.loop_header22.preheader:                    ; preds = %polly.loop_header13
  %39 = shl nsw i64 %polly.indvar17, 5
  %40 = sub nsw i64 %18, %39
  %41 = add nsw i64 %40, -1
  %42 = icmp sgt i64 %41, 31
  %43 = select i1 %42, i64 31, i64 %41
  %polly.loop_guard43 = icmp sgt i64 %43, -1
  %polly.adjust_ub46 = add i64 %43, -1
  br i1 %polly.loop_guard34, label %polly.loop_header31.preheader.us.preheader, label %polly.loop_exit24

polly.loop_header31.preheader.us.preheader:       ; preds = %polly.loop_header22.preheader
  %min.iters.check = icmp ult i64 %38, 4
  %n.vec = and i64 %38, -4
  %cmp.zero = icmp ne i64 %n.vec, 0
  %or.cond = and i1 %cmp.zero, %ident.check
  %broadcast.splatinsert89 = insertelement <4 x i64> undef, i64 %39, i32 0
  %broadcast.splat90 = shufflevector <4 x i64> %broadcast.splatinsert89, <4 x i64> undef, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %38, %n.vec
  br label %polly.loop_header31.preheader.us

polly.loop_header31.preheader.us:                 ; preds = %polly.loop_header31.preheader.us.preheader, %polly.loop_exit33.loopexit.us
  %polly.indvar26.us = phi i64 [ %polly.indvar_next27.us, %polly.loop_exit33.loopexit.us ], [ 0, %polly.loop_header31.preheader.us.preheader ]
  %44 = add nsw i64 %polly.indvar26.us, %23
  %45 = mul i64 %44, %15
  br i1 %polly.loop_guard43, label %polly.loop_header40.preheader.us.us.preheader, label %polly.loop_exit33.loopexit.us

polly.loop_header40.preheader.us.us.preheader:    ; preds = %polly.loop_header31.preheader.us
  br label %polly.loop_header40.preheader.us.us

polly.loop_exit33.loopexit.us.loopexit:           ; preds = %polly.loop_exit42.loopexit.us.us
  br label %polly.loop_exit33.loopexit.us

polly.loop_exit33.loopexit.us:                    ; preds = %polly.loop_exit33.loopexit.us.loopexit, %polly.loop_header31.preheader.us
  %polly.indvar_next27.us = add nuw nsw i64 %polly.indvar26.us, 1
  %polly.loop_cond29.us = icmp sgt i64 %polly.indvar26.us, %polly.adjust_ub28
  br i1 %polly.loop_cond29.us, label %polly.loop_exit24.loopexit, label %polly.loop_header31.preheader.us

polly.loop_header40.preheader.us.us:              ; preds = %polly.loop_header40.preheader.us.us.preheader, %polly.loop_exit42.loopexit.us.us
  %polly.indvar35.us.us = phi i64 [ %polly.indvar_next36.us.us, %polly.loop_exit42.loopexit.us.us ], [ 0, %polly.loop_header40.preheader.us.us.preheader ]
  %46 = add nuw nsw i64 %polly.indvar35.us.us, %28
  %tmp.us.us = add i64 %46, %45
  %tmp55.us.us = shl i64 %tmp.us.us, 2
  %scevgep.us.us = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp55.us.us
  %scevgep48.us.us = bitcast i8* %scevgep.us.us to i32*
  %scevgep48.promoted.us.us = load i32, i32* %scevgep48.us.us, align 4, !alias.scope !15, !noalias !17
  br i1 %min.iters.check, label %polly.loop_header40.us.us.preheader, label %min.iters.checked

polly.loop_header40.us.us.preheader:              ; preds = %min.iters.checked, %middle.block, %polly.loop_header40.preheader.us.us
  %p_add3159.us.us.ph = phi i32 [ %scevgep48.promoted.us.us, %min.iters.checked ], [ %scevgep48.promoted.us.us, %polly.loop_header40.preheader.us.us ], [ %58, %middle.block ]
  %polly.indvar44.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %polly.loop_header40.preheader.us.us ], [ %n.vec, %middle.block ]
  br label %polly.loop_header40.us.us

min.iters.checked:                                ; preds = %polly.loop_header40.preheader.us.us
  br i1 %or.cond, label %vector.ph, label %polly.loop_header40.us.us.preheader

vector.ph:                                        ; preds = %min.iters.checked
  %47 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %scevgep48.promoted.us.us, i32 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %47, %vector.ph ], [ %56, %vector.body ]
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i64> %broadcast.splat, <i64 0, i64 1, i64 2, i64 3>
  %48 = add nuw nsw <4 x i64> %induction, %broadcast.splat90
  %.lhs = extractelement <4 x i64> %48, i32 0
  %49 = add i64 %.lhs, %45
  %50 = getelementptr i32, i32* %polly.subfunc.arg.2, i64 %49
  %51 = bitcast i32* %50 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %51, align 4, !alias.scope !18, !noalias !20
  %.lhs100 = extractelement <4 x i64> %48, i32 0
  %52 = add i64 %.lhs100, %46
  %53 = getelementptr i32, i32* %polly.subfunc.arg.3, i64 %52
  %54 = bitcast i32* %53 to <4 x i32>*
  %wide.load95 = load <4 x i32>, <4 x i32>* %54, align 4, !alias.scope !19, !noalias !21
  %55 = mul nsw <4 x i32> %wide.load95, %wide.load
  %56 = add nsw <4 x i32> %55, %vec.phi
  %index.next = add i64 %index, 4
  %57 = icmp eq i64 %index.next, %n.vec
  br i1 %57, label %middle.block, label %vector.body, !llvm.loop !22

middle.block:                                     ; preds = %vector.body
  %.lcssa = phi <4 x i32> [ %56, %vector.body ]
  %rdx.shuf = shufflevector <4 x i32> %.lcssa, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %.lcssa, %rdx.shuf
  %rdx.shuf98 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx99 = add <4 x i32> %bin.rdx, %rdx.shuf98
  %58 = extractelement <4 x i32> %bin.rdx99, i32 0
  br i1 %cmp.n, label %polly.loop_exit42.loopexit.us.us, label %polly.loop_header40.us.us.preheader

polly.loop_exit42.loopexit.us.us.loopexit:        ; preds = %polly.loop_header40.us.us
  %p_add31.us.us.lcssa102 = phi i32 [ %p_add31.us.us, %polly.loop_header40.us.us ]
  br label %polly.loop_exit42.loopexit.us.us

polly.loop_exit42.loopexit.us.us:                 ; preds = %polly.loop_exit42.loopexit.us.us.loopexit, %middle.block
  %p_add31.us.us.lcssa = phi i32 [ %58, %middle.block ], [ %p_add31.us.us.lcssa102, %polly.loop_exit42.loopexit.us.us.loopexit ]
  store i32 %p_add31.us.us.lcssa, i32* %scevgep48.us.us, align 4, !alias.scope !15, !noalias !17
  %polly.indvar_next36.us.us = add nuw nsw i64 %polly.indvar35.us.us, 1
  %polly.loop_cond38.us.us = icmp sgt i64 %polly.indvar35.us.us, %polly.adjust_ub37
  br i1 %polly.loop_cond38.us.us, label %polly.loop_exit33.loopexit.us.loopexit, label %polly.loop_header40.preheader.us.us

polly.loop_header40.us.us:                        ; preds = %polly.loop_header40.us.us.preheader, %polly.loop_header40.us.us
  %p_add3159.us.us = phi i32 [ %p_add31.us.us, %polly.loop_header40.us.us ], [ %p_add3159.us.us.ph, %polly.loop_header40.us.us.preheader ]
  %polly.indvar44.us.us = phi i64 [ %polly.indvar_next45.us.us, %polly.loop_header40.us.us ], [ %polly.indvar44.us.us.ph, %polly.loop_header40.us.us.preheader ]
  %59 = add nuw nsw i64 %polly.indvar44.us.us, %39
  %60 = add i64 %59, %45
  %scevgep49.us.us = getelementptr i32, i32* %polly.subfunc.arg.2, i64 %60
  %_p_scalar_50.us.us = load i32, i32* %scevgep49.us.us, align 4, !alias.scope !18, !noalias !20
  %61 = mul i64 %59, %15
  %62 = add i64 %61, %46
  %scevgep51.us.us = getelementptr i32, i32* %polly.subfunc.arg.3, i64 %62
  %_p_scalar_52.us.us = load i32, i32* %scevgep51.us.us, align 4, !alias.scope !19, !noalias !21
  %p_mul30.us.us = mul nsw i32 %_p_scalar_52.us.us, %_p_scalar_50.us.us
  %p_add31.us.us = add nsw i32 %p_mul30.us.us, %p_add3159.us.us
  %polly.indvar_next45.us.us = add nuw nsw i64 %polly.indvar44.us.us, 1
  %polly.loop_cond47.us.us = icmp sgt i64 %polly.indvar44.us.us, %polly.adjust_ub46
  br i1 %polly.loop_cond47.us.us, label %polly.loop_exit42.loopexit.us.us.loopexit, label %polly.loop_header40.us.us, !llvm.loop !23

polly.loop_exit24.loopexit:                       ; preds = %polly.loop_exit33.loopexit.us
  br label %polly.loop_exit24

polly.loop_exit24:                                ; preds = %polly.loop_exit24.loopexit, %polly.loop_header22.preheader, %polly.loop_header13
  %polly.indvar_next18 = add nuw nsw i64 %polly.indvar17, 1
  %exitcond = icmp eq i64 %polly.indvar17, %polly.fdiv_q.shr11
  br i1 %exitcond, label %polly.loop_exit15.loopexit, label %polly.loop_header13
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { "polly.skip.fn" }
attributes #6 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !3, !4}
!10 = distinct !{!10, !2, !3, !4}
!11 = distinct !{!11, !2, !3, !4}
!12 = distinct !{!12, !3, !4}
!13 = distinct !{!13, !2, !3, !4}
!14 = distinct !{!14, !3, !4}
!15 = distinct !{!15, !16, !"polly.alias.scope.call"}
!16 = distinct !{!16, !"polly.alias.scope.domain"}
!17 = !{!18, !19}
!18 = distinct !{!18, !16, !"polly.alias.scope."}
!19 = distinct !{!19, !16, !"polly.alias.scope."}
!20 = !{!19, !15}
!21 = !{!18, !15}
!22 = distinct !{!22, !3, !4}
!23 = distinct !{!23, !3, !4}
