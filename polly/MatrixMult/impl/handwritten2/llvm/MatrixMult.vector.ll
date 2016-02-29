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
  %call = tail call noalias i8* @malloc(i64 %mul1) #5
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
  %call11 = tail call noalias i8* @malloc(i64 16) #5
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
define noalias %struct.Matrix* @matrix_multiply(%struct.Matrix* noalias nocapture readonly %A, %struct.Matrix* noalias nocapture readonly %B) #2 {
entry:
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
  %call = tail call noalias i8* @malloc(i64 %mul4) #5
  %4 = bitcast i8* %call to i32*
  %cmp6 = icmp sgt i32 %3, 0
  br i1 %cmp6, label %for.cond7.preheader.lr.ph, label %for.end41

for.cond7.preheader.lr.ph:                        ; preds = %entry
  %5 = sext i32 %2 to i64
  %6 = icmp sgt i32 %2, 0
  br i1 %6, label %polly.preload.exec, label %polly.preload.merge

polly.preload.merge:                              ; preds = %polly.preload.exec, %for.cond7.preheader.lr.ph
  %7 = phi i32 [ %53, %polly.preload.exec ], [ %3, %for.cond7.preheader.lr.ph ]
  %polly.preload..merge = phi i32 [ %51, %polly.preload.exec ], [ 0, %for.cond7.preheader.lr.ph ]
  %8 = icmp sge i32 %2, %polly.preload..merge
  %9 = sext i32 %polly.preload..merge to i64
  %10 = add nsw i64 %9, -1
  %polly.access.add. = mul nsw i64 %9, %5
  %polly.access. = getelementptr i32, i32* %1, i64 %polly.access.add.
  %11 = icmp ule i32* %polly.access., %4
  %12 = sext i32 %3 to i64
  %13 = add nsw i64 %12, -1
  %polly.access.mul.call6 = mul i64 %13, %5
  %polly.access.add.call7 = mul nsw i64 %12, %5
  %polly.access.call8 = getelementptr i32, i32* %4, i64 %polly.access.add.call7
  %14 = icmp ule i32* %polly.access.call8, %1
  %15 = or i1 %14, %11
  %16 = and i1 %8, %15
  %polly.access.add.13 = add i64 %9, %polly.access.mul.call6
  %polly.access.14 = getelementptr i32, i32* %0, i64 %polly.access.add.13
  %17 = icmp ule i32* %polly.access.14, %4
  %18 = icmp ule i32* %polly.access.call8, %0
  %19 = or i1 %18, %17
  %20 = and i1 %19, %16
  br i1 %20, label %polly.start, label %for.cond7.preheader.preheader

for.cond7.preheader.preheader:                    ; preds = %polly.preload.merge
  %21 = sext i32 %7 to i64
  br i1 %6, label %for.body11.preheader.us.preheader, label %for.end41

for.body11.preheader.us.preheader:                ; preds = %for.cond7.preheader.preheader
  %width14 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 1
  %22 = shl nsw i64 %5, 2
  %.pre = load i32, i32* %width14, align 8
  %cmp151.us = icmp sgt i32 %.pre, 0
  %23 = icmp sgt i64 %5, 1
  %smax522 = select i1 %23, i64 %5, i64 1
  %24 = shl nsw i64 %smax522, 2
  %25 = sext i32 %.pre to i64
  %xtraiter550 = and i64 %25, 1
  %lcmp.mod551 = icmp eq i64 %xtraiter550, 0
  %26 = icmp eq i32 %.pre, 1
  br label %for.body11.preheader.us

for.body11.preheader.us:                          ; preds = %for.body11.preheader.us.preheader, %for.inc39.loopexit.us
  %indvars.iv17.us = phi i64 [ %indvars.iv.next18.us, %for.inc39.loopexit.us ], [ 0, %for.body11.preheader.us.preheader ]
  %27 = mul nsw i64 %indvars.iv17.us, %5
  br i1 %cmp151.us, label %for.body11.us.us.preheader, label %for.body11.us462.preheader

for.body11.us.us.preheader:                       ; preds = %for.body11.preheader.us
  %arrayidx25.us.us.prol = getelementptr inbounds i32, i32* %0, i64 %27
  br label %for.body11.us.us

for.body11.us462.preheader:                       ; preds = %for.body11.preheader.us
  %28 = mul i64 %22, %indvars.iv17.us
  %scevgep521 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep521, i8 0, i64 %24, i32 4, i1 false)
  br label %for.inc39.loopexit.us

for.inc39.loopexit.us.loopexit:                   ; preds = %for.inc36.loopexit.us.us
  br label %for.inc39.loopexit.us

for.inc39.loopexit.us:                            ; preds = %for.inc39.loopexit.us.loopexit, %for.body11.us462.preheader
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv17.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next18.us, %21
  br i1 %cmp.us, label %for.body11.preheader.us, label %for.end41.loopexit541

for.body11.us.us:                                 ; preds = %for.body11.us.us.preheader, %for.inc36.loopexit.us.us
  %indvars.iv12.us.us = phi i64 [ %indvars.iv.next13.us.us, %for.inc36.loopexit.us.us ], [ 0, %for.body11.us.us.preheader ]
  %29 = add nsw i64 %indvars.iv12.us.us, %27
  %arrayidx.us.us = getelementptr inbounds i32, i32* %4, i64 %29
  store i32 0, i32* %arrayidx.us.us, align 4
  br i1 %lcmp.mod551, label %for.body11.us.us.split, label %for.body17.us.us.prol

for.body17.us.us.prol:                            ; preds = %for.body11.us.us
  %30 = load i32, i32* %arrayidx25.us.us.prol, align 4
  %arrayidx29.us.us.prol = getelementptr inbounds i32, i32* %1, i64 %indvars.iv12.us.us
  %31 = load i32, i32* %arrayidx29.us.us.prol, align 4
  %mul30.us.us.prol = mul nsw i32 %31, %30
  store i32 %mul30.us.us.prol, i32* %arrayidx.us.us, align 4
  br label %for.body11.us.us.split

for.body11.us.us.split:                           ; preds = %for.body11.us.us, %for.body17.us.us.prol
  %.unr = phi i32 [ 0, %for.body11.us.us ], [ %mul30.us.us.prol, %for.body17.us.us.prol ]
  %indvars.iv.us.us.unr = phi i64 [ 0, %for.body11.us.us ], [ 1, %for.body17.us.us.prol ]
  br i1 %26, label %for.inc36.loopexit.us.us, label %for.body11.us.us.split.split

for.body11.us.us.split.split:                     ; preds = %for.body11.us.us.split
  br label %for.body17.us.us

for.inc36.loopexit.us.us.unr-lcssa:               ; preds = %for.body17.us.us
  br label %for.inc36.loopexit.us.us

for.inc36.loopexit.us.us:                         ; preds = %for.body11.us.us.split, %for.inc36.loopexit.us.us.unr-lcssa
  %indvars.iv.next13.us.us = add nuw nsw i64 %indvars.iv12.us.us, 1
  %cmp9.us.us = icmp slt i64 %indvars.iv.next13.us.us, %5
  br i1 %cmp9.us.us, label %for.body11.us.us, label %for.inc39.loopexit.us.loopexit

for.body17.us.us:                                 ; preds = %for.body17.us.us, %for.body11.us.us.split.split
  %32 = phi i32 [ %.unr, %for.body11.us.us.split.split ], [ %add31.us.us.1, %for.body17.us.us ]
  %indvars.iv.us.us = phi i64 [ %indvars.iv.us.us.unr, %for.body11.us.us.split.split ], [ %indvars.iv.next.us.us.1, %for.body17.us.us ]
  %33 = add nsw i64 %indvars.iv.us.us, %27
  %arrayidx25.us.us = getelementptr inbounds i32, i32* %0, i64 %33
  %34 = load i32, i32* %arrayidx25.us.us, align 4
  %35 = mul nsw i64 %indvars.iv.us.us, %5
  %36 = add nsw i64 %35, %indvars.iv12.us.us
  %arrayidx29.us.us = getelementptr inbounds i32, i32* %1, i64 %36
  %37 = load i32, i32* %arrayidx29.us.us, align 4
  %mul30.us.us = mul nsw i32 %37, %34
  %add31.us.us = add nsw i32 %mul30.us.us, %32
  store i32 %add31.us.us, i32* %arrayidx.us.us, align 4
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %38 = add nsw i64 %indvars.iv.next.us.us, %27
  %arrayidx25.us.us.1 = getelementptr inbounds i32, i32* %0, i64 %38
  %39 = load i32, i32* %arrayidx25.us.us.1, align 4
  %40 = mul nsw i64 %indvars.iv.next.us.us, %5
  %41 = add nsw i64 %40, %indvars.iv12.us.us
  %arrayidx29.us.us.1 = getelementptr inbounds i32, i32* %1, i64 %41
  %42 = load i32, i32* %arrayidx29.us.us.1, align 4
  %mul30.us.us.1 = mul nsw i32 %42, %39
  %add31.us.us.1 = add nsw i32 %mul30.us.us.1, %add31.us.us
  store i32 %add31.us.us.1, i32* %arrayidx.us.us, align 4
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv.us.us, 2
  %cmp15.us.us.1 = icmp slt i64 %indvars.iv.next.us.us.1, %25
  br i1 %cmp15.us.us.1, label %for.body17.us.us, label %for.inc36.loopexit.us.us.unr-lcssa

for.end41.loopexit:                               ; preds = %polly.loop_exit249
  br label %for.end41

for.end41.loopexit541:                            ; preds = %for.inc39.loopexit.us
  br label %for.end41

for.end41:                                        ; preds = %for.end41.loopexit541, %for.end41.loopexit, %polly.start, %for.cond7.preheader.preheader, %polly.cond231, %polly.then233, %entry
  %call42 = tail call noalias i8* @malloc(i64 16) #5
  %43 = bitcast i8* %call42 to %struct.Matrix*
  %44 = bitcast i8* %call42 to i8**
  store i8* %call, i8** %44, align 8
  %width44 = getelementptr inbounds i8, i8* %call42, i64 8
  %45 = bitcast i8* %width44 to i32*
  store i32 %2, i32* %45, align 8
  %height45 = getelementptr inbounds i8, i8* %call42, i64 12
  %46 = bitcast i8* %height45 to i32*
  store i32 %3, i32* %46, align 4
  ret %struct.Matrix* %43

polly.start:                                      ; preds = %polly.preload.merge
  %polly.fdiv_q.shr = ashr i64 %13, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %for.end41

polly.cond75:                                     ; preds = %polly.loop_exit30
  %47 = icmp slt i32 %3, 1
  br i1 %47, label %polly.then77, label %polly.merge76

polly.merge76.loopexit.unr-lcssa:                 ; preds = %polly.cond110.us.1
  br label %polly.merge76.loopexit

polly.merge76.loopexit:                           ; preds = %polly.loop_header81.us.preheader.split, %polly.merge76.loopexit.unr-lcssa
  br label %polly.merge76

polly.merge76.loopexit539:                        ; preds = %polly.merge111
  br label %polly.merge76

polly.merge76:                                    ; preds = %polly.merge76.loopexit539, %polly.merge76.loopexit, %polly.cond75, %polly.then77
  %48 = phi i1 [ false, %polly.cond75 ], [ true, %polly.then77 ], [ %47, %polly.merge76.loopexit ], [ %47, %polly.merge76.loopexit539 ]
  br i1 %polly.loop_guard, label %polly.loop_preheader133, label %polly.cond231

polly.cond231.loopexit:                           ; preds = %polly.loop_exit144
  br label %polly.cond231

polly.cond231:                                    ; preds = %polly.cond231.loopexit, %polly.merge76
  br i1 %48, label %polly.then233, label %for.end41

polly.preload.exec:                               ; preds = %for.cond7.preheader.lr.ph
  %49 = getelementptr %struct.Matrix, %struct.Matrix* %A, i64 0, i32 1
  %50 = bitcast i32* %49 to i64*
  %polly.access.A3.load = load i64, i64* %50, align 8
  %51 = trunc i64 %polly.access.A3.load to i32
  %52 = lshr i64 %polly.access.A3.load, 32
  %53 = trunc i64 %52 to i32
  br label %polly.preload.merge

polly.loop_header:                                ; preds = %polly.loop_exit30, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit30 ]
  %54 = mul i64 %65, %polly.indvar
  %55 = add i64 %67, %54
  br i1 %polly.loop_guard31, label %polly.loop_header28.preheader, label %polly.loop_exit30

polly.loop_header28.preheader:                    ; preds = %polly.loop_header
  %56 = shl nsw i64 %polly.indvar, 5
  %57 = sub nsw i64 %12, %56
  %58 = add nsw i64 %57, -1
  %59 = icmp sgt i64 %58, 31
  %60 = select i1 %59, i64 31, i64 %58
  %polly.loop_guard40 = icmp sgt i64 %60, -1
  %polly.adjust_ub43 = add i64 %60, -1
  br label %polly.loop_header28

polly.loop_exit30.loopexit:                       ; preds = %polly.loop_exit39
  br label %polly.loop_exit30

polly.loop_exit30:                                ; preds = %polly.loop_exit30.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond520 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond520, label %polly.cond75, label %polly.loop_header, !llvm.loop !8

polly.loop_preheader:                             ; preds = %polly.start
  %61 = add nsw i64 %5, -1
  %polly.fdiv_q.shr26 = ashr i64 %61, 5
  %polly.loop_guard31 = icmp sgt i64 %polly.fdiv_q.shr26, -1
  %pexp.p_div_q = lshr i64 %5, 2
  %62 = add nsw i64 %pexp.p_div_q, -1
  %63 = zext i32 %2 to i64
  %pexp.pdiv_r = and i64 %63, 3
  %polly.loop_guard65 = icmp eq i64 %pexp.pdiv_r, 0
  %64 = shl nsw i64 %5, 2
  %65 = shl nsw i64 %5, 7
  %66 = shl nuw nsw i64 %pexp.pdiv_r, 2
  %67 = sub nsw i64 %64, %66
  br label %polly.loop_header

polly.loop_header28:                              ; preds = %polly.loop_exit39, %polly.loop_header28.preheader
  %polly.indvar32 = phi i64 [ %polly.indvar_next33, %polly.loop_exit39 ], [ 0, %polly.loop_header28.preheader ]
  %68 = shl i64 %polly.indvar32, 7
  %69 = add i64 %54, %68
  %70 = shl i64 %polly.indvar32, 3
  %71 = sub i64 %70, %pexp.p_div_q
  %72 = icmp sgt i64 %71, -8
  %smax516 = select i1 %72, i64 %71, i64 -8
  %73 = mul i64 %smax516, -16
  br i1 %polly.loop_guard40, label %polly.loop_header37.preheader, label %polly.loop_exit39

polly.loop_header37.preheader:                    ; preds = %polly.loop_header28
  %74 = mul nsw i64 %polly.indvar32, -8
  %75 = add nsw i64 %62, %74
  %polly.loop_guard49526 = icmp sgt i64 %75, -1
  %76 = shl nsw i64 %polly.indvar32, 5
  %77 = or i64 %76, 31
  %78 = icmp slt i64 %77, %5
  br i1 %polly.loop_guard49526, label %polly.loop_preheader55.preheader.us.preheader, label %polly.loop_header37.preheader.split

polly.loop_preheader55.preheader.us.preheader:    ; preds = %polly.loop_header37.preheader
  %brmerge = or i1 %78, %polly.loop_guard65
  br label %polly.loop_preheader55.preheader.us

polly.merge.us:                                   ; preds = %polly.stmt.for.body1171.preheader.us, %polly.loop_preheader55.preheader.us
  %polly.indvar_next42.us = add nuw nsw i64 %polly.indvar41.us, 1
  %polly.loop_cond44.us = icmp sgt i64 %polly.indvar41.us, %polly.adjust_ub43
  br i1 %polly.loop_cond44.us, label %polly.loop_exit39.loopexit, label %polly.loop_preheader55.preheader.us

polly.stmt.for.body1171.preheader.us:             ; preds = %polly.loop_preheader55.preheader.us
  %79 = add i64 %55, %80
  %scevgep518 = getelementptr i8, i8* %call, i64 %79
  call void @llvm.memset.p0i8.i64(i8* %scevgep518, i8 0, i64 %66, i32 4, i1 false)
  br label %polly.merge.us

polly.loop_preheader55.preheader.us:              ; preds = %polly.loop_preheader55.preheader.us.preheader, %polly.merge.us
  %polly.indvar41.us = phi i64 [ %polly.indvar_next42.us, %polly.merge.us ], [ 0, %polly.loop_preheader55.preheader.us.preheader ]
  %80 = mul i64 %64, %polly.indvar41.us
  %81 = add i64 %69, %80
  %scevgep515 = getelementptr i8, i8* %call, i64 %81
  call void @llvm.memset.p0i8.i64(i8* %scevgep515, i8 0, i64 %73, i32 4, i1 false)
  br i1 %brmerge, label %polly.merge.us, label %polly.stmt.for.body1171.preheader.us

polly.loop_header37.preheader.split:              ; preds = %polly.loop_header37.preheader
  br i1 %78, label %polly.loop_exit39, label %polly.then.preheader

polly.then.preheader:                             ; preds = %polly.loop_header37.preheader.split
  br label %polly.then

polly.loop_exit39.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit39

polly.loop_exit39.loopexit540:                    ; preds = %polly.merge
  br label %polly.loop_exit39

polly.loop_exit39:                                ; preds = %polly.loop_exit39.loopexit540, %polly.loop_exit39.loopexit, %polly.loop_header37.preheader.split, %polly.loop_header28
  %polly.indvar_next33 = add nuw nsw i64 %polly.indvar32, 1
  %exitcond519 = icmp eq i64 %polly.indvar32, %polly.fdiv_q.shr26
  br i1 %exitcond519, label %polly.loop_exit30.loopexit, label %polly.loop_header28

polly.merge:                                      ; preds = %polly.stmt.for.body1171.preheader, %polly.then
  %polly.indvar_next42 = add nuw nsw i64 %polly.indvar41, 1
  %polly.loop_cond44 = icmp sgt i64 %polly.indvar41, %polly.adjust_ub43
  br i1 %polly.loop_cond44, label %polly.loop_exit39.loopexit540, label %polly.then

polly.then:                                       ; preds = %polly.then.preheader, %polly.merge
  %polly.indvar41 = phi i64 [ %polly.indvar_next42, %polly.merge ], [ 0, %polly.then.preheader ]
  br i1 %polly.loop_guard65, label %polly.merge, label %polly.stmt.for.body1171.preheader

polly.stmt.for.body1171.preheader:                ; preds = %polly.then
  %82 = mul i64 %64, %polly.indvar41
  %83 = add i64 %55, %82
  %scevgep512 = getelementptr i8, i8* %call, i64 %83
  call void @llvm.memset.p0i8.i64(i8* %scevgep512, i8 0, i64 %66, i32 4, i1 false)
  br label %polly.merge

polly.then77:                                     ; preds = %polly.cond75
  %84 = add nsw i64 %5, -1
  %polly.fdiv_q.shr79 = ashr i64 %84, 5
  %polly.loop_guard84 = icmp sgt i64 %polly.fdiv_q.shr79, -1
  br i1 %polly.loop_guard84, label %polly.loop_header81.preheader, label %polly.merge76

polly.loop_header81.preheader:                    ; preds = %polly.then77
  %pexp.p_div_q89 = lshr i64 %5, 2
  %85 = add nsw i64 %pexp.p_div_q89, -1
  %86 = zext i32 %2 to i64
  %pexp.pdiv_r114 = and i64 %86, 3
  %polly.loop_guard119 = icmp eq i64 %pexp.pdiv_r114, 0
  br i1 %polly.loop_guard119, label %polly.loop_header81.us.preheader, label %polly.loop_header81.preheader486

polly.loop_header81.us.preheader:                 ; preds = %polly.loop_header81.preheader
  %87 = and i64 %polly.fdiv_q.shr79, 1
  %lcmp.mod549 = icmp eq i64 %87, 0
  br i1 %lcmp.mod549, label %polly.loop_header81.us.prol, label %polly.loop_header81.us.preheader.split

polly.loop_header81.us.prol:                      ; preds = %polly.loop_header81.us.preheader
  %88 = sub nsw i64 0, %pexp.p_div_q89
  %polly.loop_guard94.us525.prol = icmp eq i64 %pexp.p_div_q89, 0
  br i1 %polly.loop_guard94.us525.prol, label %polly.cond110.us.prol, label %polly.loop_preheader100.preheader.us.prol

polly.loop_preheader100.preheader.us.prol:        ; preds = %polly.loop_header81.us.prol
  %89 = icmp sgt i64 %88, -8
  %smax.prol = select i1 %89, i64 %88, i64 -8
  %90 = mul i64 %smax.prol, -16
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 %90, i32 4, i1 false)
  br label %polly.cond110.us.prol

polly.cond110.us.prol:                            ; preds = %polly.loop_header81.us.prol, %polly.loop_preheader100.preheader.us.prol
  br label %polly.loop_header81.us.preheader.split

polly.loop_header81.us.preheader.split:           ; preds = %polly.cond110.us.prol, %polly.loop_header81.us.preheader
  %polly.indvar85.us.unr = phi i64 [ 0, %polly.loop_header81.us.preheader ], [ 1, %polly.cond110.us.prol ]
  %91 = icmp eq i64 %polly.fdiv_q.shr79, 0
  br i1 %91, label %polly.merge76.loopexit, label %polly.loop_header81.us.preheader.split.split

polly.loop_header81.us.preheader.split.split:     ; preds = %polly.loop_header81.us.preheader.split
  br label %polly.loop_header81.us

polly.loop_header81.preheader486:                 ; preds = %polly.loop_header81.preheader
  %92 = shl nsw i64 %5, 2
  %93 = shl nuw nsw i64 %pexp.pdiv_r114, 2
  %94 = sub nsw i64 %92, %93
  %scevgep = getelementptr i8, i8* %call, i64 %94
  br label %polly.loop_header81

polly.loop_header81.us:                           ; preds = %polly.cond110.us.1, %polly.loop_header81.us.preheader.split.split
  %polly.indvar85.us = phi i64 [ %polly.indvar85.us.unr, %polly.loop_header81.us.preheader.split.split ], [ %polly.indvar_next86.us.1, %polly.cond110.us.1 ]
  %95 = shl i64 %polly.indvar85.us, 3
  %96 = sub i64 %95, %pexp.p_div_q89
  %97 = mul nsw i64 %polly.indvar85.us, -8
  %98 = add nsw i64 %85, %97
  %polly.loop_guard94.us525 = icmp sgt i64 %98, -1
  br i1 %polly.loop_guard94.us525, label %polly.loop_preheader100.preheader.us, label %polly.cond110.us

polly.cond110.us:                                 ; preds = %polly.loop_preheader100.preheader.us, %polly.loop_header81.us
  %polly.indvar_next86.us = add nuw nsw i64 %polly.indvar85.us, 1
  %99 = shl i64 %polly.indvar_next86.us, 3
  %100 = sub i64 %99, %pexp.p_div_q89
  %101 = mul nsw i64 %polly.indvar_next86.us, -8
  %102 = add nsw i64 %85, %101
  %polly.loop_guard94.us525.1 = icmp sgt i64 %102, -1
  br i1 %polly.loop_guard94.us525.1, label %polly.loop_preheader100.preheader.us.1, label %polly.cond110.us.1

polly.loop_preheader100.preheader.us:             ; preds = %polly.loop_header81.us
  %103 = icmp sgt i64 %96, -8
  %smax = select i1 %103, i64 %96, i64 -8
  %104 = mul i64 %smax, -16
  %105 = shl i64 %polly.indvar85.us, 7
  %scevgep504 = getelementptr i8, i8* %call, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep504, i8 0, i64 %104, i32 4, i1 false)
  br label %polly.cond110.us

polly.loop_header81:                              ; preds = %polly.merge111, %polly.loop_header81.preheader486
  %polly.indvar85 = phi i64 [ %polly.indvar_next86, %polly.merge111 ], [ 0, %polly.loop_header81.preheader486 ]
  %106 = shl i64 %polly.indvar85, 3
  %107 = sub i64 %106, %pexp.p_div_q89
  %108 = mul nsw i64 %polly.indvar85, -8
  %109 = add nsw i64 %85, %108
  %polly.loop_guard94524 = icmp sgt i64 %109, -1
  br i1 %polly.loop_guard94524, label %polly.loop_preheader100.preheader, label %polly.cond110

polly.loop_preheader100.preheader:                ; preds = %polly.loop_header81
  %110 = icmp sgt i64 %107, -8
  %smax508 = select i1 %110, i64 %107, i64 -8
  %111 = mul i64 %smax508, -16
  %112 = shl i64 %polly.indvar85, 7
  %scevgep507 = getelementptr i8, i8* %call, i64 %112
  call void @llvm.memset.p0i8.i64(i8* %scevgep507, i8 0, i64 %111, i32 4, i1 false)
  br label %polly.cond110

polly.cond110:                                    ; preds = %polly.loop_preheader100.preheader, %polly.loop_header81
  %113 = shl nsw i64 %polly.indvar85, 5
  %114 = or i64 %113, 31
  %115 = icmp slt i64 %114, %5
  br i1 %115, label %polly.merge111, label %polly.stmt.for.body11125.preheader

polly.stmt.for.body11125.preheader:               ; preds = %polly.cond110
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %93, i32 4, i1 false)
  br label %polly.merge111

polly.merge111:                                   ; preds = %polly.stmt.for.body11125.preheader, %polly.cond110
  %polly.indvar_next86 = add nuw nsw i64 %polly.indvar85, 1
  %exitcond510 = icmp eq i64 %polly.indvar85, %polly.fdiv_q.shr79
  br i1 %exitcond510, label %polly.merge76.loopexit539, label %polly.loop_header81, !llvm.loop !9

polly.loop_header132:                             ; preds = %polly.loop_exit144, %polly.loop_preheader133
  %polly.indvar136 = phi i64 [ 0, %polly.loop_preheader133 ], [ %polly.indvar_next137, %polly.loop_exit144 ]
  br i1 %polly.loop_guard145, label %polly.loop_header142.preheader, label %polly.loop_exit144

polly.loop_header142.preheader:                   ; preds = %polly.loop_header132
  %116 = shl nsw i64 %polly.indvar136, 5
  %117 = sub nsw i64 %12, %116
  %118 = add nsw i64 %117, -1
  %119 = icmp sgt i64 %118, 31
  %120 = select i1 %119, i64 31, i64 %118
  %polly.loop_guard164 = icmp sgt i64 %120, -1
  %polly.adjust_ub167 = add i64 %120, -1
  br label %polly.loop_header142

polly.loop_exit144.loopexit:                      ; preds = %polly.loop_exit154
  br label %polly.loop_exit144

polly.loop_exit144:                               ; preds = %polly.loop_exit144.loopexit, %polly.loop_header132
  %polly.indvar_next137 = add nuw nsw i64 %polly.indvar136, 1
  %exitcond502 = icmp eq i64 %polly.indvar136, %polly.fdiv_q.shr
  br i1 %exitcond502, label %polly.cond231.loopexit, label %polly.loop_header132, !llvm.loop !10

polly.loop_preheader133:                          ; preds = %polly.merge76
  %121 = shl nsw i64 %5, 2
  %122 = add nsw i64 %5, -1
  %polly.fdiv_q.shr140 = ashr i64 %122, 5
  %polly.loop_guard145 = icmp sgt i64 %polly.fdiv_q.shr140, -1
  %polly.fdiv_q.shr150 = ashr i64 %10, 5
  %polly.loop_guard155 = icmp sgt i64 %polly.fdiv_q.shr150, -1
  %pexp.p_div_q178 = lshr i64 %9, 2
  %123 = add nsw i64 %pexp.p_div_q178, -1
  %124 = zext i32 %polly.preload..merge to i64
  %pexp.pdiv_r206 = and i64 %124, 3
  %polly.loop_guard211 = icmp eq i64 %pexp.pdiv_r206, 0
  %125 = sub nsw i64 %9, %pexp.pdiv_r206
  %126 = add nsw i64 %pexp.pdiv_r206, -1
  %xtraiter546 = and i64 %124, 1
  %lcmp.mod547 = icmp eq i64 %xtraiter546, 0
  %127 = mul i64 %125, %5
  %128 = icmp eq i64 %126, 0
  %xtraiter544 = and i64 %124, 1
  %lcmp.mod545 = icmp eq i64 %xtraiter544, 0
  %129 = mul i64 %125, %5
  %130 = icmp eq i64 %126, 0
  br label %polly.loop_header132

polly.loop_header142:                             ; preds = %polly.loop_exit154, %polly.loop_header142.preheader
  %polly.indvar146 = phi i64 [ %polly.indvar_next147, %polly.loop_exit154 ], [ 0, %polly.loop_header142.preheader ]
  br i1 %polly.loop_guard155, label %polly.loop_header152.preheader, label %polly.loop_exit154

polly.loop_header152.preheader:                   ; preds = %polly.loop_header142
  %131 = shl nsw i64 %polly.indvar146, 5
  %132 = sub nsw i64 %5, %131
  %133 = add nsw i64 %132, -1
  %134 = icmp sgt i64 %133, 31
  %135 = select i1 %134, i64 31, i64 %133
  %polly.loop_guard173 = icmp sgt i64 %135, -1
  %polly.adjust_ub176 = add i64 %135, -1
  br label %polly.loop_header152

polly.loop_exit154.loopexit:                      ; preds = %polly.loop_exit163
  br label %polly.loop_exit154

polly.loop_exit154:                               ; preds = %polly.loop_exit154.loopexit, %polly.loop_header142
  %polly.indvar_next147 = add nuw nsw i64 %polly.indvar146, 1
  %exitcond501 = icmp eq i64 %polly.indvar146, %polly.fdiv_q.shr140
  br i1 %exitcond501, label %polly.loop_exit144.loopexit, label %polly.loop_header142

polly.loop_header152:                             ; preds = %polly.loop_exit163, %polly.loop_header152.preheader
  %polly.indvar156 = phi i64 [ %polly.indvar_next157, %polly.loop_exit163 ], [ 0, %polly.loop_header152.preheader ]
  br i1 %polly.loop_guard164, label %polly.loop_header161.preheader, label %polly.loop_exit163

polly.loop_header161.preheader:                   ; preds = %polly.loop_header152
  %136 = mul nsw i64 %polly.indvar156, -8
  %137 = add nsw i64 %123, %136
  %138 = icmp sgt i64 %137, 7
  %139 = select i1 %138, i64 7, i64 %137
  %polly.loop_guard183 = icmp sgt i64 %139, -1
  %140 = shl i64 %polly.indvar156, 5
  %polly.adjust_ub186 = add i64 %139, -1
  %141 = or i64 %140, 31
  %142 = icmp slt i64 %141, %9
  %brmerge480 = or i1 %142, %polly.loop_guard211
  br label %polly.loop_header161

polly.loop_exit163.loopexit:                      ; preds = %polly.loop_exit172
  br label %polly.loop_exit163

polly.loop_exit163:                               ; preds = %polly.loop_exit163.loopexit, %polly.loop_header152
  %polly.indvar_next157 = add nuw nsw i64 %polly.indvar156, 1
  %exitcond500 = icmp eq i64 %polly.indvar156, %polly.fdiv_q.shr150
  br i1 %exitcond500, label %polly.loop_exit154.loopexit, label %polly.loop_header152

polly.loop_header161:                             ; preds = %polly.loop_header161.preheader, %polly.loop_exit172
  %polly.indvar165 = phi i64 [ %polly.indvar_next166, %polly.loop_exit172 ], [ 0, %polly.loop_header161.preheader ]
  br i1 %polly.loop_guard173, label %polly.loop_header170.preheader, label %polly.loop_exit172

polly.loop_header170.preheader:                   ; preds = %polly.loop_header161
  %143 = add nuw nsw i64 %polly.indvar165, %116
  %144 = mul i64 %143, %121
  %145 = mul i64 %143, %5
  br i1 %polly.loop_guard183, label %polly.loop_preheader189.preheader.us.preheader, label %polly.loop_header170.preheader.split

polly.loop_preheader189.preheader.us.preheader:   ; preds = %polly.loop_header170.preheader
  %146 = add i64 %125, %145
  %scevgep221.us.prol = getelementptr i32, i32* %0, i64 %146
  br label %polly.loop_preheader189.preheader.us

polly.loop_preheader189.us:                       ; preds = %polly.loop_preheader189.preheader.us, %polly.loop_preheader189.us
  %p_add31.lcssa384.us = phi i32 [ %p_add31.us.3, %polly.loop_preheader189.us ], [ %scevgep194195.promoted383.us, %polly.loop_preheader189.preheader.us ]
  %polly.indvar184.us = phi i64 [ %polly.indvar_next185.us, %polly.loop_preheader189.us ], [ 0, %polly.loop_preheader189.preheader.us ]
  %147 = shl i64 %polly.indvar184.us, 2
  %148 = add nuw nsw i64 %147, %140
  %149 = add i64 %148, %145
  %scevgep196.us = getelementptr i32, i32* %0, i64 %149
  %_p_scalar_197.us = load i32, i32* %scevgep196.us, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !16
  %150 = mul i64 %148, %5
  %151 = add i64 %150, %172
  %scevgep198.us = getelementptr i32, i32* %1, i64 %151
  %_p_scalar_199.us = load i32, i32* %scevgep198.us, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !16
  %p_mul30.us = mul nsw i32 %_p_scalar_199.us, %_p_scalar_197.us
  %p_add31.us = add nsw i32 %p_mul30.us, %p_add31.lcssa384.us
  %152 = or i64 %148, 1
  %153 = add i64 %152, %145
  %scevgep196.us.1 = getelementptr i32, i32* %0, i64 %153
  %_p_scalar_197.us.1 = load i32, i32* %scevgep196.us.1, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !16
  %154 = mul i64 %152, %5
  %155 = add i64 %154, %172
  %scevgep198.us.1 = getelementptr i32, i32* %1, i64 %155
  %_p_scalar_199.us.1 = load i32, i32* %scevgep198.us.1, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !16
  %p_mul30.us.1 = mul nsw i32 %_p_scalar_199.us.1, %_p_scalar_197.us.1
  %p_add31.us.1 = add nsw i32 %p_mul30.us.1, %p_add31.us
  %156 = or i64 %148, 2
  %157 = add i64 %156, %145
  %scevgep196.us.2 = getelementptr i32, i32* %0, i64 %157
  %_p_scalar_197.us.2 = load i32, i32* %scevgep196.us.2, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !16
  %158 = mul i64 %156, %5
  %159 = add i64 %158, %172
  %scevgep198.us.2 = getelementptr i32, i32* %1, i64 %159
  %_p_scalar_199.us.2 = load i32, i32* %scevgep198.us.2, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !16
  %p_mul30.us.2 = mul nsw i32 %_p_scalar_199.us.2, %_p_scalar_197.us.2
  %p_add31.us.2 = add nsw i32 %p_mul30.us.2, %p_add31.us.1
  %160 = or i64 %148, 3
  %161 = add i64 %160, %145
  %scevgep196.us.3 = getelementptr i32, i32* %0, i64 %161
  %_p_scalar_197.us.3 = load i32, i32* %scevgep196.us.3, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !16
  %162 = mul i64 %160, %5
  %163 = add i64 %162, %172
  %scevgep198.us.3 = getelementptr i32, i32* %1, i64 %163
  %_p_scalar_199.us.3 = load i32, i32* %scevgep198.us.3, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !16
  %p_mul30.us.3 = mul nsw i32 %_p_scalar_199.us.3, %_p_scalar_197.us.3
  %p_add31.us.3 = add nsw i32 %p_mul30.us.3, %p_add31.us.2
  %polly.indvar_next185.us = add nuw nsw i64 %polly.indvar184.us, 1
  %polly.loop_cond187.us = icmp sgt i64 %polly.indvar184.us, %polly.adjust_ub186
  br i1 %polly.loop_cond187.us, label %polly.cond202.loopexit.us, label %polly.loop_preheader189.us

polly.loop_header208.us:                          ; preds = %polly.loop_header208.us, %polly.loop_header208.us.preheader.split.split
  %p_add31226385.us = phi i32 [ %p_add31226385.us.unr, %polly.loop_header208.us.preheader.split.split ], [ %p_add31226.us.1, %polly.loop_header208.us ]
  %polly.indvar212.us = phi i64 [ %polly.indvar212.us.unr, %polly.loop_header208.us.preheader.split.split ], [ %polly.indvar_next213.us.1, %polly.loop_header208.us ]
  %164 = add nsw i64 %polly.indvar212.us, %125
  %165 = add i64 %164, %145
  %scevgep221.us = getelementptr i32, i32* %0, i64 %165
  %_p_scalar_222.us = load i32, i32* %scevgep221.us, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !19
  %166 = mul i64 %164, %5
  %167 = add i64 %166, %172
  %scevgep223.us = getelementptr i32, i32* %1, i64 %167
  %_p_scalar_224.us = load i32, i32* %scevgep223.us, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !19
  %p_mul30225.us = mul nsw i32 %_p_scalar_224.us, %_p_scalar_222.us
  %p_add31226.us = add nsw i32 %p_mul30225.us, %p_add31226385.us
  %polly.indvar_next213.us = add nuw nsw i64 %polly.indvar212.us, 1
  %168 = add nsw i64 %polly.indvar_next213.us, %125
  %169 = add i64 %168, %145
  %scevgep221.us.1 = getelementptr i32, i32* %0, i64 %169
  %_p_scalar_222.us.1 = load i32, i32* %scevgep221.us.1, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !19
  %170 = mul i64 %168, %5
  %171 = add i64 %170, %172
  %scevgep223.us.1 = getelementptr i32, i32* %1, i64 %171
  %_p_scalar_224.us.1 = load i32, i32* %scevgep223.us.1, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !19
  %p_mul30225.us.1 = mul nsw i32 %_p_scalar_224.us.1, %_p_scalar_222.us.1
  %p_add31226.us.1 = add nsw i32 %p_mul30225.us.1, %p_add31226.us
  %polly.indvar_next213.us.1 = add nsw i64 %polly.indvar212.us, 2
  %exitcond499.1 = icmp eq i64 %polly.indvar_next213.us.1, %pexp.pdiv_r206
  br i1 %exitcond499.1, label %polly.merge203.loopexit.us.unr-lcssa, label %polly.loop_header208.us, !llvm.loop !20

polly.merge203.us:                                ; preds = %polly.cond202.loopexit.us, %polly.merge203.loopexit.us
  %polly.indvar_next175.us = add nuw nsw i64 %polly.indvar174.us, 1
  %polly.loop_cond177.us = icmp sgt i64 %polly.indvar174.us, %polly.adjust_ub176
  br i1 %polly.loop_cond177.us, label %polly.loop_exit172.loopexit, label %polly.loop_preheader189.preheader.us

polly.merge203.loopexit.us.unr-lcssa:             ; preds = %polly.loop_header208.us
  %p_add31226.us.1.lcssa = phi i32 [ %p_add31226.us.1, %polly.loop_header208.us ]
  br label %polly.merge203.loopexit.us

polly.merge203.loopexit.us:                       ; preds = %polly.loop_header208.us.preheader.split, %polly.merge203.loopexit.us.unr-lcssa
  %p_add31226.us.lcssa = phi i32 [ %p_add31226.us.lcssa.unr, %polly.loop_header208.us.preheader.split ], [ %p_add31226.us.1.lcssa, %polly.merge203.loopexit.us.unr-lcssa ]
  store i32 %p_add31226.us.lcssa, i32* %scevgep194195.us, align 4, !alias.scope !15, !noalias !21
  br label %polly.merge203.us

polly.loop_preheader189.preheader.us:             ; preds = %polly.loop_preheader189.preheader.us.preheader, %polly.merge203.us
  %polly.indvar174.us = phi i64 [ %polly.indvar_next175.us, %polly.merge203.us ], [ 0, %polly.loop_preheader189.preheader.us.preheader ]
  %172 = add nuw nsw i64 %polly.indvar174.us, %131
  %173 = shl i64 %172, 2
  %174 = add i64 %173, %144
  %scevgep194.us = getelementptr i8, i8* %call, i64 %174
  %scevgep194195.us = bitcast i8* %scevgep194.us to i32*
  %scevgep194195.promoted383.us = load i32, i32* %scevgep194195.us, align 4, !alias.scope !15, !noalias !21
  br label %polly.loop_preheader189.us

polly.cond202.loopexit.us:                        ; preds = %polly.loop_preheader189.us
  %p_add31.us.3.lcssa = phi i32 [ %p_add31.us.3, %polly.loop_preheader189.us ]
  store i32 %p_add31.us.3.lcssa, i32* %scevgep194195.us, align 4, !alias.scope !15, !noalias !21
  br i1 %brmerge480, label %polly.merge203.us, label %polly.loop_header208.us.preheader

polly.loop_header208.us.preheader:                ; preds = %polly.cond202.loopexit.us
  br i1 %lcmp.mod547, label %polly.loop_header208.us.preheader.split, label %polly.loop_header208.us.prol

polly.loop_header208.us.prol:                     ; preds = %polly.loop_header208.us.preheader
  %_p_scalar_222.us.prol = load i32, i32* %scevgep221.us.prol, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !19
  %175 = add i64 %127, %172
  %scevgep223.us.prol = getelementptr i32, i32* %1, i64 %175
  %_p_scalar_224.us.prol = load i32, i32* %scevgep223.us.prol, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !19
  %p_mul30225.us.prol = mul nsw i32 %_p_scalar_224.us.prol, %_p_scalar_222.us.prol
  %p_add31226.us.prol = add nsw i32 %p_mul30225.us.prol, %p_add31.us.3.lcssa
  br label %polly.loop_header208.us.preheader.split

polly.loop_header208.us.preheader.split:          ; preds = %polly.loop_header208.us.preheader, %polly.loop_header208.us.prol
  %p_add31226.us.lcssa.unr = phi i32 [ undef, %polly.loop_header208.us.preheader ], [ %p_add31226.us.prol, %polly.loop_header208.us.prol ]
  %p_add31226385.us.unr = phi i32 [ %p_add31.us.3.lcssa, %polly.loop_header208.us.preheader ], [ %p_add31226.us.prol, %polly.loop_header208.us.prol ]
  %polly.indvar212.us.unr = phi i64 [ 0, %polly.loop_header208.us.preheader ], [ 1, %polly.loop_header208.us.prol ]
  br i1 %128, label %polly.merge203.loopexit.us, label %polly.loop_header208.us.preheader.split.split

polly.loop_header208.us.preheader.split.split:    ; preds = %polly.loop_header208.us.preheader.split
  br label %polly.loop_header208.us

polly.loop_header170.preheader.split:             ; preds = %polly.loop_header170.preheader
  br i1 %142, label %polly.loop_exit172, label %polly.then204.preheader

polly.then204.preheader:                          ; preds = %polly.loop_header170.preheader.split
  %176 = add i64 %125, %145
  %scevgep221.prol = getelementptr i32, i32* %0, i64 %176
  br label %polly.then204

polly.loop_exit172.loopexit:                      ; preds = %polly.merge203.us
  br label %polly.loop_exit172

polly.loop_exit172.loopexit538:                   ; preds = %polly.merge203
  br label %polly.loop_exit172

polly.loop_exit172:                               ; preds = %polly.loop_exit172.loopexit538, %polly.loop_exit172.loopexit, %polly.loop_header170.preheader.split, %polly.loop_header161
  %polly.indvar_next166 = add nuw nsw i64 %polly.indvar165, 1
  %polly.loop_cond168 = icmp sgt i64 %polly.indvar165, %polly.adjust_ub167
  br i1 %polly.loop_cond168, label %polly.loop_exit163.loopexit, label %polly.loop_header161

polly.merge203.loopexit.unr-lcssa:                ; preds = %polly.loop_header208
  %p_add31226.1.lcssa = phi i32 [ %p_add31226.1, %polly.loop_header208 ]
  br label %polly.merge203.loopexit

polly.merge203.loopexit:                          ; preds = %polly.loop_header208.preheader.split, %polly.merge203.loopexit.unr-lcssa
  %p_add31226.lcssa = phi i32 [ %p_add31226.lcssa.unr, %polly.loop_header208.preheader.split ], [ %p_add31226.1.lcssa, %polly.merge203.loopexit.unr-lcssa ]
  store i32 %p_add31226.lcssa, i32* %scevgep218219, align 4, !alias.scope !15, !noalias !21
  br label %polly.merge203

polly.merge203:                                   ; preds = %polly.merge203.loopexit, %polly.then204
  %polly.indvar_next175 = add nuw nsw i64 %polly.indvar174, 1
  %polly.loop_cond177 = icmp sgt i64 %polly.indvar174, %polly.adjust_ub176
  br i1 %polly.loop_cond177, label %polly.loop_exit172.loopexit538, label %polly.then204

polly.then204:                                    ; preds = %polly.then204.preheader, %polly.merge203
  %polly.indvar174 = phi i64 [ %polly.indvar_next175, %polly.merge203 ], [ 0, %polly.then204.preheader ]
  br i1 %polly.loop_guard211, label %polly.merge203, label %polly.loop_header208.preheader

polly.loop_header208.preheader:                   ; preds = %polly.then204
  %177 = add nuw nsw i64 %polly.indvar174, %131
  %178 = shl i64 %177, 2
  %179 = add i64 %178, %144
  %scevgep218 = getelementptr i8, i8* %call, i64 %179
  %scevgep218219 = bitcast i8* %scevgep218 to i32*
  %scevgep218219.promoted = load i32, i32* %scevgep218219, align 4, !alias.scope !15, !noalias !21
  br i1 %lcmp.mod545, label %polly.loop_header208.preheader.split, label %polly.loop_header208.prol

polly.loop_header208.prol:                        ; preds = %polly.loop_header208.preheader
  %_p_scalar_222.prol = load i32, i32* %scevgep221.prol, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !19
  %180 = add i64 %129, %177
  %scevgep223.prol = getelementptr i32, i32* %1, i64 %180
  %_p_scalar_224.prol = load i32, i32* %scevgep223.prol, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !19
  %p_mul30225.prol = mul nsw i32 %_p_scalar_224.prol, %_p_scalar_222.prol
  %p_add31226.prol = add nsw i32 %p_mul30225.prol, %scevgep218219.promoted
  br label %polly.loop_header208.preheader.split

polly.loop_header208.preheader.split:             ; preds = %polly.loop_header208.preheader, %polly.loop_header208.prol
  %p_add31226.lcssa.unr = phi i32 [ undef, %polly.loop_header208.preheader ], [ %p_add31226.prol, %polly.loop_header208.prol ]
  %p_add31226385.unr = phi i32 [ %scevgep218219.promoted, %polly.loop_header208.preheader ], [ %p_add31226.prol, %polly.loop_header208.prol ]
  %polly.indvar212.unr = phi i64 [ 0, %polly.loop_header208.preheader ], [ 1, %polly.loop_header208.prol ]
  br i1 %130, label %polly.merge203.loopexit, label %polly.loop_header208.preheader.split.split

polly.loop_header208.preheader.split.split:       ; preds = %polly.loop_header208.preheader.split
  br label %polly.loop_header208

polly.loop_header208:                             ; preds = %polly.loop_header208, %polly.loop_header208.preheader.split.split
  %p_add31226385 = phi i32 [ %p_add31226385.unr, %polly.loop_header208.preheader.split.split ], [ %p_add31226.1, %polly.loop_header208 ]
  %polly.indvar212 = phi i64 [ %polly.indvar212.unr, %polly.loop_header208.preheader.split.split ], [ %polly.indvar_next213.1, %polly.loop_header208 ]
  %181 = add nsw i64 %polly.indvar212, %125
  %182 = add i64 %181, %145
  %scevgep221 = getelementptr i32, i32* %0, i64 %182
  %_p_scalar_222 = load i32, i32* %scevgep221, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !19
  %183 = mul i64 %181, %5
  %184 = add i64 %183, %177
  %scevgep223 = getelementptr i32, i32* %1, i64 %184
  %_p_scalar_224 = load i32, i32* %scevgep223, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !19
  %p_mul30225 = mul nsw i32 %_p_scalar_224, %_p_scalar_222
  %p_add31226 = add nsw i32 %p_mul30225, %p_add31226385
  %polly.indvar_next213 = add nuw nsw i64 %polly.indvar212, 1
  %185 = add nsw i64 %polly.indvar_next213, %125
  %186 = add i64 %185, %145
  %scevgep221.1 = getelementptr i32, i32* %0, i64 %186
  %_p_scalar_222.1 = load i32, i32* %scevgep221.1, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !19
  %187 = mul i64 %185, %5
  %188 = add i64 %187, %177
  %scevgep223.1 = getelementptr i32, i32* %1, i64 %188
  %_p_scalar_224.1 = load i32, i32* %scevgep223.1, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !19
  %p_mul30225.1 = mul nsw i32 %_p_scalar_224.1, %_p_scalar_222.1
  %p_add31226.1 = add nsw i32 %p_mul30225.1, %p_add31226
  %polly.indvar_next213.1 = add nsw i64 %polly.indvar212, 2
  %exitcond497.1 = icmp eq i64 %polly.indvar_next213.1, %pexp.pdiv_r206
  br i1 %exitcond497.1, label %polly.merge203.loopexit.unr-lcssa, label %polly.loop_header208, !llvm.loop !20

polly.then233:                                    ; preds = %polly.cond231
  %189 = add nsw i64 %5, -1
  %polly.fdiv_q.shr235 = ashr i64 %189, 5
  %polly.loop_guard240 = icmp sgt i64 %polly.fdiv_q.shr235, -1
  br i1 %polly.loop_guard240, label %polly.loop_header237.preheader, label %for.end41

polly.loop_header237.preheader:                   ; preds = %polly.then233
  %polly.fdiv_q.shr245 = ashr i64 %10, 5
  %polly.loop_guard250 = icmp sgt i64 %polly.fdiv_q.shr245, -1
  %pexp.p_div_q264 = lshr i64 %9, 2
  %190 = add nsw i64 %pexp.p_div_q264, -1
  %191 = zext i32 %polly.preload..merge to i64
  %pexp.pdiv_r301 = and i64 %191, 3
  %polly.loop_guard306 = icmp eq i64 %pexp.pdiv_r301, 0
  %192 = sub nsw i64 %9, %pexp.pdiv_r301
  %193 = add nsw i64 %pexp.pdiv_r301, -1
  %xtraiter542 = and i64 %191, 1
  %lcmp.mod543 = icmp eq i64 %xtraiter542, 0
  %scevgep318.us.prol = getelementptr i32, i32* %0, i64 %192
  %194 = mul i64 %192, %5
  %195 = icmp eq i64 %193, 0
  %xtraiter = and i64 %191, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %scevgep318.prol = getelementptr i32, i32* %0, i64 %192
  %196 = mul i64 %192, %5
  %197 = icmp eq i64 %193, 0
  br label %polly.loop_header237

polly.loop_header237:                             ; preds = %polly.loop_exit249, %polly.loop_header237.preheader
  %polly.indvar241 = phi i64 [ %polly.indvar_next242, %polly.loop_exit249 ], [ 0, %polly.loop_header237.preheader ]
  br i1 %polly.loop_guard250, label %polly.loop_header247.preheader, label %polly.loop_exit249

polly.loop_header247.preheader:                   ; preds = %polly.loop_header237
  %198 = shl nsw i64 %polly.indvar241, 5
  %199 = sub nsw i64 %5, %198
  %200 = add nsw i64 %199, -1
  %201 = icmp sgt i64 %200, 31
  %202 = select i1 %201, i64 31, i64 %200
  %polly.loop_guard259 = icmp sgt i64 %202, -1
  %polly.adjust_ub262 = add i64 %202, -1
  br label %polly.loop_header247

polly.loop_exit249.loopexit:                      ; preds = %polly.loop_exit258
  br label %polly.loop_exit249

polly.loop_exit249:                               ; preds = %polly.loop_exit249.loopexit, %polly.loop_header237
  %polly.indvar_next242 = add nuw nsw i64 %polly.indvar241, 1
  %exitcond496 = icmp eq i64 %polly.indvar241, %polly.fdiv_q.shr235
  br i1 %exitcond496, label %for.end41.loopexit, label %polly.loop_header237, !llvm.loop !22

polly.loop_header247:                             ; preds = %polly.loop_exit258, %polly.loop_header247.preheader
  %polly.indvar251 = phi i64 [ %polly.indvar_next252, %polly.loop_exit258 ], [ 0, %polly.loop_header247.preheader ]
  br i1 %polly.loop_guard259, label %polly.loop_header256.preheader, label %polly.loop_exit258

polly.loop_header256.preheader:                   ; preds = %polly.loop_header247
  %203 = mul nsw i64 %polly.indvar251, -8
  %204 = add nsw i64 %190, %203
  %205 = icmp sgt i64 %204, 7
  %206 = select i1 %205, i64 7, i64 %204
  %polly.loop_guard269 = icmp sgt i64 %206, -1
  %207 = shl i64 %polly.indvar251, 5
  %208 = or i64 %207, 31
  %209 = icmp slt i64 %208, %9
  %polly.adjust_ub272 = add i64 %206, -1
  br i1 %polly.loop_guard269, label %polly.loop_preheader275.preheader.us.preheader, label %polly.loop_header256.preheader.split

polly.loop_preheader275.preheader.us.preheader:   ; preds = %polly.loop_header256.preheader
  %brmerge481 = or i1 %209, %polly.loop_guard306
  br label %polly.loop_preheader275.preheader.us

polly.loop_preheader275.us:                       ; preds = %polly.loop_preheader275.preheader.us, %polly.loop_preheader275.us
  %p_add31291.lcssa332.us = phi i32 [ %p_add31291.us.3, %polly.loop_preheader275.us ], [ %scevgep282283.promoted331.us, %polly.loop_preheader275.preheader.us ]
  %polly.indvar270.us = phi i64 [ %polly.indvar_next271.us, %polly.loop_preheader275.us ], [ 0, %polly.loop_preheader275.preheader.us ]
  %210 = shl i64 %polly.indvar270.us, 2
  %211 = add nuw nsw i64 %210, %207
  %scevgep286.us = getelementptr i32, i32* %0, i64 %211
  %_p_scalar_287.us = load i32, i32* %scevgep286.us, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !23
  %212 = mul i64 %211, %5
  %213 = add i64 %212, %229
  %scevgep288.us = getelementptr i32, i32* %1, i64 %213
  %_p_scalar_289.us = load i32, i32* %scevgep288.us, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !23
  %p_mul30290.us = mul nsw i32 %_p_scalar_289.us, %_p_scalar_287.us
  %p_add31291.us = add nsw i32 %p_mul30290.us, %p_add31291.lcssa332.us
  %214 = or i64 %211, 1
  %scevgep286.us.1 = getelementptr i32, i32* %0, i64 %214
  %_p_scalar_287.us.1 = load i32, i32* %scevgep286.us.1, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !23
  %215 = mul i64 %214, %5
  %216 = add i64 %215, %229
  %scevgep288.us.1 = getelementptr i32, i32* %1, i64 %216
  %_p_scalar_289.us.1 = load i32, i32* %scevgep288.us.1, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !23
  %p_mul30290.us.1 = mul nsw i32 %_p_scalar_289.us.1, %_p_scalar_287.us.1
  %p_add31291.us.1 = add nsw i32 %p_mul30290.us.1, %p_add31291.us
  %217 = or i64 %211, 2
  %scevgep286.us.2 = getelementptr i32, i32* %0, i64 %217
  %_p_scalar_287.us.2 = load i32, i32* %scevgep286.us.2, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !23
  %218 = mul i64 %217, %5
  %219 = add i64 %218, %229
  %scevgep288.us.2 = getelementptr i32, i32* %1, i64 %219
  %_p_scalar_289.us.2 = load i32, i32* %scevgep288.us.2, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !23
  %p_mul30290.us.2 = mul nsw i32 %_p_scalar_289.us.2, %_p_scalar_287.us.2
  %p_add31291.us.2 = add nsw i32 %p_mul30290.us.2, %p_add31291.us.1
  %220 = or i64 %211, 3
  %scevgep286.us.3 = getelementptr i32, i32* %0, i64 %220
  %_p_scalar_287.us.3 = load i32, i32* %scevgep286.us.3, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !23
  %221 = mul i64 %220, %5
  %222 = add i64 %221, %229
  %scevgep288.us.3 = getelementptr i32, i32* %1, i64 %222
  %_p_scalar_289.us.3 = load i32, i32* %scevgep288.us.3, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !23
  %p_mul30290.us.3 = mul nsw i32 %_p_scalar_289.us.3, %_p_scalar_287.us.3
  %p_add31291.us.3 = add nsw i32 %p_mul30290.us.3, %p_add31291.us.2
  %polly.indvar_next271.us = add nuw nsw i64 %polly.indvar270.us, 1
  %polly.loop_cond273.us = icmp sgt i64 %polly.indvar270.us, %polly.adjust_ub272
  br i1 %polly.loop_cond273.us, label %polly.cond297.loopexit.us, label %polly.loop_preheader275.us

polly.loop_header303.us:                          ; preds = %polly.loop_header303.us, %polly.loop_header303.us.preheader.split.split
  %p_add31323333.us = phi i32 [ %p_add31323333.us.unr, %polly.loop_header303.us.preheader.split.split ], [ %p_add31323.us.1, %polly.loop_header303.us ]
  %polly.indvar307.us = phi i64 [ %polly.indvar307.us.unr, %polly.loop_header303.us.preheader.split.split ], [ %polly.indvar_next308.us.1, %polly.loop_header303.us ]
  %223 = add nsw i64 %polly.indvar307.us, %192
  %scevgep318.us = getelementptr i32, i32* %0, i64 %223
  %_p_scalar_319.us = load i32, i32* %scevgep318.us, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !25
  %224 = mul i64 %223, %5
  %225 = add i64 %224, %229
  %scevgep320.us = getelementptr i32, i32* %1, i64 %225
  %_p_scalar_321.us = load i32, i32* %scevgep320.us, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !25
  %p_mul30322.us = mul nsw i32 %_p_scalar_321.us, %_p_scalar_319.us
  %p_add31323.us = add nsw i32 %p_mul30322.us, %p_add31323333.us
  %polly.indvar_next308.us = add nuw nsw i64 %polly.indvar307.us, 1
  %226 = add nsw i64 %polly.indvar_next308.us, %192
  %scevgep318.us.1 = getelementptr i32, i32* %0, i64 %226
  %_p_scalar_319.us.1 = load i32, i32* %scevgep318.us.1, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !25
  %227 = mul i64 %226, %5
  %228 = add i64 %227, %229
  %scevgep320.us.1 = getelementptr i32, i32* %1, i64 %228
  %_p_scalar_321.us.1 = load i32, i32* %scevgep320.us.1, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !25
  %p_mul30322.us.1 = mul nsw i32 %_p_scalar_321.us.1, %_p_scalar_319.us.1
  %p_add31323.us.1 = add nsw i32 %p_mul30322.us.1, %p_add31323.us
  %polly.indvar_next308.us.1 = add nsw i64 %polly.indvar307.us, 2
  %exitcond494.1 = icmp eq i64 %polly.indvar_next308.us.1, %pexp.pdiv_r301
  br i1 %exitcond494.1, label %polly.merge298.loopexit.us.unr-lcssa, label %polly.loop_header303.us, !llvm.loop !26

polly.merge298.us:                                ; preds = %polly.cond297.loopexit.us, %polly.merge298.loopexit.us
  %polly.indvar_next261.us = add nuw nsw i64 %polly.indvar260.us, 1
  %polly.loop_cond263.us = icmp sgt i64 %polly.indvar260.us, %polly.adjust_ub262
  br i1 %polly.loop_cond263.us, label %polly.loop_exit258.loopexit, label %polly.loop_preheader275.preheader.us

polly.merge298.loopexit.us.unr-lcssa:             ; preds = %polly.loop_header303.us
  %p_add31323.us.1.lcssa = phi i32 [ %p_add31323.us.1, %polly.loop_header303.us ]
  br label %polly.merge298.loopexit.us

polly.merge298.loopexit.us:                       ; preds = %polly.loop_header303.us.preheader.split, %polly.merge298.loopexit.us.unr-lcssa
  %p_add31323.us.lcssa = phi i32 [ %p_add31323.us.lcssa.unr, %polly.loop_header303.us.preheader.split ], [ %p_add31323.us.1.lcssa, %polly.merge298.loopexit.us.unr-lcssa ]
  store i32 %p_add31323.us.lcssa, i32* %scevgep282283.us, align 4, !alias.scope !15, !noalias !21
  br label %polly.merge298.us

polly.loop_preheader275.preheader.us:             ; preds = %polly.loop_preheader275.preheader.us.preheader, %polly.merge298.us
  %polly.indvar260.us = phi i64 [ %polly.indvar_next261.us, %polly.merge298.us ], [ 0, %polly.loop_preheader275.preheader.us.preheader ]
  %229 = add nuw nsw i64 %polly.indvar260.us, %198
  %230 = shl i64 %229, 2
  %scevgep282.us = getelementptr i8, i8* %call, i64 %230
  %scevgep282283.us = bitcast i8* %scevgep282.us to i32*
  %scevgep282283.promoted331.us = load i32, i32* %scevgep282283.us, align 4, !alias.scope !15, !noalias !21
  br label %polly.loop_preheader275.us

polly.cond297.loopexit.us:                        ; preds = %polly.loop_preheader275.us
  %p_add31291.us.3.lcssa = phi i32 [ %p_add31291.us.3, %polly.loop_preheader275.us ]
  store i32 %p_add31291.us.3.lcssa, i32* %scevgep282283.us, align 4, !alias.scope !15, !noalias !21
  br i1 %brmerge481, label %polly.merge298.us, label %polly.loop_header303.us.preheader

polly.loop_header303.us.preheader:                ; preds = %polly.cond297.loopexit.us
  br i1 %lcmp.mod543, label %polly.loop_header303.us.preheader.split, label %polly.loop_header303.us.prol

polly.loop_header303.us.prol:                     ; preds = %polly.loop_header303.us.preheader
  %_p_scalar_319.us.prol = load i32, i32* %scevgep318.us.prol, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !25
  %231 = add i64 %194, %229
  %scevgep320.us.prol = getelementptr i32, i32* %1, i64 %231
  %_p_scalar_321.us.prol = load i32, i32* %scevgep320.us.prol, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !25
  %p_mul30322.us.prol = mul nsw i32 %_p_scalar_321.us.prol, %_p_scalar_319.us.prol
  %p_add31323.us.prol = add nsw i32 %p_mul30322.us.prol, %p_add31291.us.3.lcssa
  br label %polly.loop_header303.us.preheader.split

polly.loop_header303.us.preheader.split:          ; preds = %polly.loop_header303.us.preheader, %polly.loop_header303.us.prol
  %p_add31323.us.lcssa.unr = phi i32 [ undef, %polly.loop_header303.us.preheader ], [ %p_add31323.us.prol, %polly.loop_header303.us.prol ]
  %p_add31323333.us.unr = phi i32 [ %p_add31291.us.3.lcssa, %polly.loop_header303.us.preheader ], [ %p_add31323.us.prol, %polly.loop_header303.us.prol ]
  %polly.indvar307.us.unr = phi i64 [ 0, %polly.loop_header303.us.preheader ], [ 1, %polly.loop_header303.us.prol ]
  br i1 %195, label %polly.merge298.loopexit.us, label %polly.loop_header303.us.preheader.split.split

polly.loop_header303.us.preheader.split.split:    ; preds = %polly.loop_header303.us.preheader.split
  br label %polly.loop_header303.us

polly.loop_header256.preheader.split:             ; preds = %polly.loop_header256.preheader
  br i1 %209, label %polly.loop_exit258, label %polly.then299.preheader

polly.then299.preheader:                          ; preds = %polly.loop_header256.preheader.split
  br label %polly.then299

polly.loop_exit258.loopexit:                      ; preds = %polly.merge298.us
  br label %polly.loop_exit258

polly.loop_exit258.loopexit537:                   ; preds = %polly.merge298
  br label %polly.loop_exit258

polly.loop_exit258:                               ; preds = %polly.loop_exit258.loopexit537, %polly.loop_exit258.loopexit, %polly.loop_header256.preheader.split, %polly.loop_header247
  %polly.indvar_next252 = add nuw nsw i64 %polly.indvar251, 1
  %exitcond495 = icmp eq i64 %polly.indvar251, %polly.fdiv_q.shr245
  br i1 %exitcond495, label %polly.loop_exit249.loopexit, label %polly.loop_header247

polly.merge298.loopexit.unr-lcssa:                ; preds = %polly.loop_header303
  %p_add31323.1.lcssa = phi i32 [ %p_add31323.1, %polly.loop_header303 ]
  br label %polly.merge298.loopexit

polly.merge298.loopexit:                          ; preds = %polly.loop_header303.preheader.split, %polly.merge298.loopexit.unr-lcssa
  %p_add31323.lcssa = phi i32 [ %p_add31323.lcssa.unr, %polly.loop_header303.preheader.split ], [ %p_add31323.1.lcssa, %polly.merge298.loopexit.unr-lcssa ]
  store i32 %p_add31323.lcssa, i32* %scevgep314315, align 4, !alias.scope !15, !noalias !21
  br label %polly.merge298

polly.merge298:                                   ; preds = %polly.merge298.loopexit, %polly.then299
  %polly.indvar_next261 = add nuw nsw i64 %polly.indvar260, 1
  %polly.loop_cond263 = icmp sgt i64 %polly.indvar260, %polly.adjust_ub262
  br i1 %polly.loop_cond263, label %polly.loop_exit258.loopexit537, label %polly.then299

polly.then299:                                    ; preds = %polly.then299.preheader, %polly.merge298
  %polly.indvar260 = phi i64 [ %polly.indvar_next261, %polly.merge298 ], [ 0, %polly.then299.preheader ]
  br i1 %polly.loop_guard306, label %polly.merge298, label %polly.loop_header303.preheader

polly.loop_header303.preheader:                   ; preds = %polly.then299
  %232 = add nuw nsw i64 %polly.indvar260, %198
  %233 = shl i64 %232, 2
  %scevgep314 = getelementptr i8, i8* %call, i64 %233
  %scevgep314315 = bitcast i8* %scevgep314 to i32*
  %scevgep314315.promoted = load i32, i32* %scevgep314315, align 4, !alias.scope !15, !noalias !21
  br i1 %lcmp.mod, label %polly.loop_header303.preheader.split, label %polly.loop_header303.prol

polly.loop_header303.prol:                        ; preds = %polly.loop_header303.preheader
  %_p_scalar_319.prol = load i32, i32* %scevgep318.prol, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !25
  %234 = add i64 %196, %232
  %scevgep320.prol = getelementptr i32, i32* %1, i64 %234
  %_p_scalar_321.prol = load i32, i32* %scevgep320.prol, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !25
  %p_mul30322.prol = mul nsw i32 %_p_scalar_321.prol, %_p_scalar_319.prol
  %p_add31323.prol = add nsw i32 %p_mul30322.prol, %scevgep314315.promoted
  br label %polly.loop_header303.preheader.split

polly.loop_header303.preheader.split:             ; preds = %polly.loop_header303.preheader, %polly.loop_header303.prol
  %p_add31323.lcssa.unr = phi i32 [ undef, %polly.loop_header303.preheader ], [ %p_add31323.prol, %polly.loop_header303.prol ]
  %p_add31323333.unr = phi i32 [ %scevgep314315.promoted, %polly.loop_header303.preheader ], [ %p_add31323.prol, %polly.loop_header303.prol ]
  %polly.indvar307.unr = phi i64 [ 0, %polly.loop_header303.preheader ], [ 1, %polly.loop_header303.prol ]
  br i1 %197, label %polly.merge298.loopexit, label %polly.loop_header303.preheader.split.split

polly.loop_header303.preheader.split.split:       ; preds = %polly.loop_header303.preheader.split
  br label %polly.loop_header303

polly.loop_header303:                             ; preds = %polly.loop_header303, %polly.loop_header303.preheader.split.split
  %p_add31323333 = phi i32 [ %p_add31323333.unr, %polly.loop_header303.preheader.split.split ], [ %p_add31323.1, %polly.loop_header303 ]
  %polly.indvar307 = phi i64 [ %polly.indvar307.unr, %polly.loop_header303.preheader.split.split ], [ %polly.indvar_next308.1, %polly.loop_header303 ]
  %235 = add nsw i64 %polly.indvar307, %192
  %scevgep318 = getelementptr i32, i32* %0, i64 %235
  %_p_scalar_319 = load i32, i32* %scevgep318, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !25
  %236 = mul i64 %235, %5
  %237 = add i64 %236, %232
  %scevgep320 = getelementptr i32, i32* %1, i64 %237
  %_p_scalar_321 = load i32, i32* %scevgep320, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !25
  %p_mul30322 = mul nsw i32 %_p_scalar_321, %_p_scalar_319
  %p_add31323 = add nsw i32 %p_mul30322, %p_add31323333
  %polly.indvar_next308 = add nuw nsw i64 %polly.indvar307, 1
  %238 = add nsw i64 %polly.indvar_next308, %192
  %scevgep318.1 = getelementptr i32, i32* %0, i64 %238
  %_p_scalar_319.1 = load i32, i32* %scevgep318.1, align 4, !alias.scope !11, !noalias !13, !llvm.mem.parallel_loop_access !25
  %239 = mul i64 %238, %5
  %240 = add i64 %239, %232
  %scevgep320.1 = getelementptr i32, i32* %1, i64 %240
  %_p_scalar_321.1 = load i32, i32* %scevgep320.1, align 4, !alias.scope !14, !noalias !18, !llvm.mem.parallel_loop_access !25
  %p_mul30322.1 = mul nsw i32 %_p_scalar_321.1, %_p_scalar_319.1
  %p_add31323.1 = add nsw i32 %p_mul30322.1, %p_add31323
  %polly.indvar_next308.1 = add nsw i64 %polly.indvar307, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next308.1, %pexp.pdiv_r301
  br i1 %exitcond.1, label %polly.merge298.loopexit.unr-lcssa, label %polly.loop_header303, !llvm.loop !26

polly.loop_preheader100.preheader.us.1:           ; preds = %polly.cond110.us
  %241 = icmp sgt i64 %100, -8
  %smax.1 = select i1 %241, i64 %100, i64 -8
  %242 = mul i64 %smax.1, -16
  %243 = shl i64 %polly.indvar_next86.us, 7
  %scevgep504.1 = getelementptr i8, i8* %call, i64 %243
  call void @llvm.memset.p0i8.i64(i8* %scevgep504.1, i8 0, i64 %242, i32 4, i1 false)
  br label %polly.cond110.us.1

polly.cond110.us.1:                               ; preds = %polly.loop_preheader100.preheader.us.1, %polly.cond110.us
  %polly.indvar_next86.us.1 = add nsw i64 %polly.indvar85.us, 2
  %exitcond505.1 = icmp eq i64 %polly.indvar_next86.us, %polly.fdiv_q.shr79
  br i1 %exitcond505.1, label %polly.merge76.loopexit.unr-lcssa, label %polly.loop_header81.us, !llvm.loop !9
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5
  %0 = load i64*, i64** %call, align 8
  %call1 = tail call i64 @parseStringToInt(i64* %0) #5
  %conv = trunc i64 %call1 to i32
  %mul.i = shl i64 %call1, 2
  %conv.i24 = mul i64 %mul.i, %call1
  %mul1.i = and i64 %conv.i24, 17179869180
  %call.i = tail call noalias i8* @malloc(i64 %mul1.i) #5
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
  br i1 %exitcond30, label %for.inc8.loopexit.us.i.loopexit, label %for.body6.us.i, !llvm.loop !27

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
  br i1 %13, label %middle.block, label %vector.body, !llvm.loop !28

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
  %call11.i = tail call noalias i8* @malloc(i64 16) #5
  %14 = bitcast i8* %call11.i to %struct.Matrix*
  %15 = bitcast i8* %call11.i to i8**
  store i8* %call.i, i8** %15, align 8
  %width13.i = getelementptr inbounds i8, i8* %call11.i, i64 8
  %16 = bitcast i8* %width13.i to i32*
  store i32 %conv, i32* %16, align 8
  %height14.i = getelementptr inbounds i8, i8* %call11.i, i64 12
  %17 = bitcast i8* %height14.i to i32*
  store i32 %conv, i32* %17, align 4
  %call.i4 = tail call noalias i8* @malloc(i64 %mul1.i) #5
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
  br i1 %exitcond, label %for.inc8.loopexit.us.i19.loopexit, label %for.body6.us.i13, !llvm.loop !29

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
  br i1 %30, label %middle.block39, label %vector.body38, !llvm.loop !30

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
  %call11.i20 = tail call noalias i8* @malloc(i64 16) #5
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
  %call9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv, i32 %sub, i32 %sub, i32 %36) #5
  ret i32 0
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64 @parseStringToInt(i64*) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
!8 = distinct !{!8}
!9 = distinct !{!9}
!10 = distinct !{!10}
!11 = distinct !{!11, !12, !"polly.alias.scope."}
!12 = distinct !{!12, !"polly.alias.scope.domain"}
!13 = !{!14, !15}
!14 = distinct !{!14, !12, !"polly.alias.scope."}
!15 = distinct !{!15, !12, !"polly.alias.scope.call"}
!16 = !{!10, !17}
!17 = distinct !{!17}
!18 = !{!11, !15}
!19 = !{!10, !20}
!20 = distinct !{!20}
!21 = !{!11, !14}
!22 = distinct !{!22}
!23 = !{!22, !24}
!24 = distinct !{!24}
!25 = !{!22, !26}
!26 = distinct !{!26}
!27 = distinct !{!27, !2, !3, !4}
!28 = distinct !{!28, !3, !4}
!29 = distinct !{!29, !2, !3, !4}
!30 = distinct !{!30, !3, !4}
