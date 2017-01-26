; ModuleID = 'SobelEdge_original.c'
source_filename = "SobelEdge_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define i64 @_wrap_(i64 %pos, i64 %size) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i64 %size, %pos
  br i1 %cmp, label %blklab0, label %if.end

if.end:                                           ; preds = %entry
  %factor = shl i64 %size, 1
  %sub = xor i64 %pos, -1
  %sub2 = add i64 %factor, %sub
  ret i64 %sub2

blklab0:                                          ; preds = %entry
  %pos.lobit = ashr i64 %pos, 63
  %pos.sub7 = xor i64 %pos.lobit, %pos
  ret i64 %pos.sub7
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind readonly uwtable
define i64 @_convolution_(i8* nocapture readonly %pixels, i64 %pixels_size, i64 %width, i64 %height, i64 %xCenter, i64 %yCenter, i64* nocapture readonly %filter, i64 %filter_size) local_unnamed_addr #2 {
entry:
  %add = add i64 %yCenter, -1
  %add6 = add i64 %xCenter, -1
  %rem = srem i64 %add, %height
  %ispos = icmp sgt i64 %rem, -1
  %neg = sub i64 0, %rem
  %0 = select i1 %ispos, i64 %rem, i64 %neg
  %mul = mul nsw i64 %0, %width
  %rem8 = srem i64 %add6, %width
  %ispos65 = icmp sgt i64 %rem8, -1
  %neg66 = sub i64 0, %rem8
  %1 = select i1 %ispos65, i64 %rem8, i64 %neg66
  %add10 = add nsw i64 %1, %mul
  %arrayidx = getelementptr inbounds i8, i8* %pixels, i64 %add10
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %conv11 = zext i8 %2 to i64
  %3 = load i64, i64* %filter, align 8, !tbaa !4
  %mul15 = mul nsw i64 %conv11, %3
  %rem8.1 = srem i64 %xCenter, %width
  %ispos65.1 = icmp sgt i64 %rem8.1, -1
  %neg66.1 = sub i64 0, %rem8.1
  %4 = select i1 %ispos65.1, i64 %rem8.1, i64 %neg66.1
  %add10.1 = add nsw i64 %4, %mul
  %arrayidx.1 = getelementptr inbounds i8, i8* %pixels, i64 %add10.1
  %5 = load i8, i8* %arrayidx.1, align 1, !tbaa !1
  %conv11.1 = zext i8 %5 to i64
  %arrayidx14.1 = getelementptr inbounds i64, i64* %filter, i64 1
  %6 = load i64, i64* %arrayidx14.1, align 8, !tbaa !4
  %mul15.1 = mul nsw i64 %conv11.1, %6
  %add16.1 = add nsw i64 %mul15.1, %mul15
  %sub7.2 = add i64 %xCenter, 1
  %rem8.2 = srem i64 %sub7.2, %width
  %ispos65.2 = icmp sgt i64 %rem8.2, -1
  %neg66.2 = sub i64 0, %rem8.2
  %7 = select i1 %ispos65.2, i64 %rem8.2, i64 %neg66.2
  %add10.2 = add nsw i64 %7, %mul
  %arrayidx.2 = getelementptr inbounds i8, i8* %pixels, i64 %add10.2
  %8 = load i8, i8* %arrayidx.2, align 1, !tbaa !1
  %conv11.2 = zext i8 %8 to i64
  %arrayidx14.2 = getelementptr inbounds i64, i64* %filter, i64 2
  %9 = load i64, i64* %arrayidx14.2, align 8, !tbaa !4
  %mul15.2 = mul nsw i64 %conv11.2, %9
  %add16.2 = add nsw i64 %mul15.2, %add16.1
  %rem.1 = srem i64 %yCenter, %height
  %ispos.1 = icmp sgt i64 %rem.1, -1
  %neg.1 = sub i64 0, %rem.1
  %10 = select i1 %ispos.1, i64 %rem.1, i64 %neg.1
  %mul.1 = mul nsw i64 %10, %width
  %add10.175 = add nsw i64 %1, %mul.1
  %arrayidx.176 = getelementptr inbounds i8, i8* %pixels, i64 %add10.175
  %11 = load i8, i8* %arrayidx.176, align 1, !tbaa !1
  %conv11.177 = zext i8 %11 to i64
  %arrayidx14.178 = getelementptr inbounds i64, i64* %filter, i64 3
  %12 = load i64, i64* %arrayidx14.178, align 8, !tbaa !4
  %mul15.179 = mul nsw i64 %conv11.177, %12
  %add16.180 = add nsw i64 %mul15.179, %add16.2
  %add10.1.1 = add nsw i64 %4, %mul.1
  %arrayidx.1.1 = getelementptr inbounds i8, i8* %pixels, i64 %add10.1.1
  %13 = load i8, i8* %arrayidx.1.1, align 1, !tbaa !1
  %conv11.1.1 = zext i8 %13 to i64
  %arrayidx14.1.1 = getelementptr inbounds i64, i64* %filter, i64 4
  %14 = load i64, i64* %arrayidx14.1.1, align 8, !tbaa !4
  %mul15.1.1 = mul nsw i64 %conv11.1.1, %14
  %add16.1.1 = add nsw i64 %mul15.1.1, %add16.180
  %add10.2.1 = add nsw i64 %7, %mul.1
  %arrayidx.2.1 = getelementptr inbounds i8, i8* %pixels, i64 %add10.2.1
  %15 = load i8, i8* %arrayidx.2.1, align 1, !tbaa !1
  %conv11.2.1 = zext i8 %15 to i64
  %arrayidx14.2.1 = getelementptr inbounds i64, i64* %filter, i64 5
  %16 = load i64, i64* %arrayidx14.2.1, align 8, !tbaa !4
  %mul15.2.1 = mul nsw i64 %conv11.2.1, %16
  %add16.2.1 = add nsw i64 %mul15.2.1, %add16.1.1
  %sub.2 = add i64 %yCenter, 1
  %rem.2 = srem i64 %sub.2, %height
  %ispos.2 = icmp sgt i64 %rem.2, -1
  %neg.2 = sub i64 0, %rem.2
  %17 = select i1 %ispos.2, i64 %rem.2, i64 %neg.2
  %mul.2 = mul nsw i64 %17, %width
  %add10.284 = add nsw i64 %1, %mul.2
  %arrayidx.285 = getelementptr inbounds i8, i8* %pixels, i64 %add10.284
  %18 = load i8, i8* %arrayidx.285, align 1, !tbaa !1
  %conv11.286 = zext i8 %18 to i64
  %arrayidx14.287 = getelementptr inbounds i64, i64* %filter, i64 6
  %19 = load i64, i64* %arrayidx14.287, align 8, !tbaa !4
  %mul15.288 = mul nsw i64 %conv11.286, %19
  %add16.289 = add nsw i64 %mul15.288, %add16.2.1
  %add10.1.2 = add nsw i64 %4, %mul.2
  %arrayidx.1.2 = getelementptr inbounds i8, i8* %pixels, i64 %add10.1.2
  %20 = load i8, i8* %arrayidx.1.2, align 1, !tbaa !1
  %conv11.1.2 = zext i8 %20 to i64
  %arrayidx14.1.2 = getelementptr inbounds i64, i64* %filter, i64 7
  %21 = load i64, i64* %arrayidx14.1.2, align 8, !tbaa !4
  %mul15.1.2 = mul nsw i64 %conv11.1.2, %21
  %add16.1.2 = add nsw i64 %mul15.1.2, %add16.289
  %add10.2.2 = add nsw i64 %7, %mul.2
  %arrayidx.2.2 = getelementptr inbounds i8, i8* %pixels, i64 %add10.2.2
  %22 = load i8, i8* %arrayidx.2.2, align 1, !tbaa !1
  %conv11.2.2 = zext i8 %22 to i64
  %arrayidx14.2.2 = getelementptr inbounds i64, i64* %filter, i64 8
  %23 = load i64, i64* %arrayidx14.2.2, align 8, !tbaa !4
  %mul15.2.2 = mul nsw i64 %conv11.2.2, %23
  %add16.2.2 = add nsw i64 %mul15.2.2, %add16.1.2
  ret i64 %add16.2.2
}

; Function Attrs: nounwind uwtable
define i8* @_sobelEdgeDetection_(i8* %pixels, i64 %pixels_size, i64 %width, i64 %height, i64* nocapture %_size_call_by_ref) local_unnamed_addr #3 {
entry:
  %mul = mul nsw i64 %height, %width
  %call = tail call i8* @create1DArray_BYTE(i8 zeroext 32, i64 %mul) #8
  %call1 = tail call i8* @copy1DArray_BYTE(i8* %call, i64 %mul) #8
  %call4 = tail call i64* @create1DArray_int64_t(i64 0, i64 9) #8
  %0 = bitcast i64* %call4 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 0>, <2 x i64>* %0, align 8, !tbaa !4
  %arrayidx6 = getelementptr inbounds i64, i64* %call4, i64 2
  %1 = bitcast i64* %arrayidx6 to <2 x i64>*
  store <2 x i64> <i64 1, i64 -2>, <2 x i64>* %1, align 8, !tbaa !4
  %arrayidx8 = getelementptr inbounds i64, i64* %call4, i64 4
  %2 = bitcast i64* %arrayidx8 to <2 x i64>*
  store <2 x i64> <i64 0, i64 2>, <2 x i64>* %2, align 8, !tbaa !4
  %arrayidx10 = getelementptr inbounds i64, i64* %call4, i64 6
  %3 = bitcast i64* %arrayidx10 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 0>, <2 x i64>* %3, align 8, !tbaa !4
  %arrayidx12 = getelementptr inbounds i64, i64* %call4, i64 8
  store i64 1, i64* %arrayidx12, align 8, !tbaa !4
  %call13 = tail call i64* @copy1DArray_int64_t(i64* %call4, i64 9) #8
  %call17 = tail call i64* @create1DArray_int64_t(i64 0, i64 9) #8
  %4 = bitcast i64* %call17 to <2 x i64>*
  store <2 x i64> <i64 1, i64 2>, <2 x i64>* %4, align 8, !tbaa !4
  %arrayidx20 = getelementptr inbounds i64, i64* %call17, i64 2
  store i64 1, i64* %arrayidx20, align 8, !tbaa !4
  %arrayidx21 = getelementptr inbounds i64, i64* %call17, i64 3
  %arrayidx24 = getelementptr inbounds i64, i64* %call17, i64 6
  %5 = bitcast i64* %arrayidx21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 24, i32 8, i1 false)
  %6 = bitcast i64* %arrayidx24 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 -2>, <2 x i64>* %6, align 8, !tbaa !4
  %arrayidx26 = getelementptr inbounds i64, i64* %call17, i64 8
  store i64 -1, i64* %arrayidx26, align 8, !tbaa !4
  %call27 = tail call i64* @copy1DArray_int64_t(i64* %call17, i64 9) #8
  %cmp164 = icmp sgt i64 %width, 0
  br i1 %cmp164, label %while.cond28.preheader.preheader, label %blklab8

while.cond28.preheader.preheader:                 ; preds = %entry
  %cmp30162 = icmp sgt i64 %height, 0
  br label %while.cond28.preheader

while.cond28.preheader:                           ; preds = %while.cond28.preheader.preheader, %blklab10
  %x.0165 = phi i64 [ %add49.pre-phi, %blklab10 ], [ 0, %while.cond28.preheader.preheader ]
  br i1 %cmp30162, label %if.end32.preheader, label %while.cond28.preheader.blklab10_crit_edge

while.cond28.preheader.blklab10_crit_edge:        ; preds = %while.cond28.preheader
  %.pre = add nuw nsw i64 %x.0165, 1
  br label %blklab10

if.end32.preheader:                               ; preds = %while.cond28.preheader
  %add6.i = add nsw i64 %x.0165, -1
  %sub7.2.i = add nuw i64 %x.0165, 1
  br label %if.end32

if.end32:                                         ; preds = %if.end32.preheader, %blklab12
  %y.0163 = phi i64 [ %sub.2.i, %blklab12 ], [ 0, %if.end32.preheader ]
  %call34 = tail call i8* @copy1DArray_BYTE(i8* %pixels, i64 %pixels_size) #8
  %call35 = tail call i64* @copy1DArray_int64_t(i64* %call13, i64 9) #8
  %add.i = add i64 %y.0163, -1
  %rem.i = srem i64 %add.i, %height
  %ispos.i = icmp sgt i64 %rem.i, -1
  %neg.i = sub i64 0, %rem.i
  %7 = select i1 %ispos.i, i64 %rem.i, i64 %neg.i
  %mul.i = mul nsw i64 %7, %width
  %rem8.i = srem i64 %add6.i, %width
  %ispos65.i = icmp sgt i64 %rem8.i, -1
  %neg66.i = sub i64 0, %rem8.i
  %8 = select i1 %ispos65.i, i64 %rem8.i, i64 %neg66.i
  %add10.i = add nsw i64 %8, %mul.i
  %arrayidx.i = getelementptr inbounds i8, i8* %call34, i64 %add10.i
  %9 = load i8, i8* %arrayidx.i, align 1, !tbaa !1
  %conv11.i = zext i8 %9 to i64
  %10 = load i64, i64* %call35, align 8, !tbaa !4
  %mul15.i = mul nsw i64 %conv11.i, %10
  %rem8.1.i = srem i64 %x.0165, %width
  %ispos65.1.i = icmp sgt i64 %rem8.1.i, -1
  %neg66.1.i = sub i64 0, %rem8.1.i
  %11 = select i1 %ispos65.1.i, i64 %rem8.1.i, i64 %neg66.1.i
  %add10.1.i = add nsw i64 %11, %mul.i
  %arrayidx.1.i = getelementptr inbounds i8, i8* %call34, i64 %add10.1.i
  %12 = load i8, i8* %arrayidx.1.i, align 1, !tbaa !1
  %conv11.1.i = zext i8 %12 to i64
  %arrayidx14.1.i = getelementptr inbounds i64, i64* %call35, i64 1
  %13 = load i64, i64* %arrayidx14.1.i, align 8, !tbaa !4
  %mul15.1.i = mul nsw i64 %conv11.1.i, %13
  %add16.1.i = add nsw i64 %mul15.1.i, %mul15.i
  %rem8.2.i = srem i64 %sub7.2.i, %width
  %ispos65.2.i = icmp sgt i64 %rem8.2.i, -1
  %neg66.2.i = sub i64 0, %rem8.2.i
  %14 = select i1 %ispos65.2.i, i64 %rem8.2.i, i64 %neg66.2.i
  %add10.2.i = add nsw i64 %14, %mul.i
  %arrayidx.2.i = getelementptr inbounds i8, i8* %call34, i64 %add10.2.i
  %15 = load i8, i8* %arrayidx.2.i, align 1, !tbaa !1
  %conv11.2.i = zext i8 %15 to i64
  %arrayidx14.2.i = getelementptr inbounds i64, i64* %call35, i64 2
  %16 = load i64, i64* %arrayidx14.2.i, align 8, !tbaa !4
  %mul15.2.i = mul nsw i64 %conv11.2.i, %16
  %add16.2.i = add nsw i64 %add16.1.i, %mul15.2.i
  %rem.1.i = srem i64 %y.0163, %height
  %ispos.1.i = icmp sgt i64 %rem.1.i, -1
  %neg.1.i = sub i64 0, %rem.1.i
  %17 = select i1 %ispos.1.i, i64 %rem.1.i, i64 %neg.1.i
  %mul.1.i = mul nsw i64 %17, %width
  %add10.175.i = add nsw i64 %mul.1.i, %8
  %arrayidx.176.i = getelementptr inbounds i8, i8* %call34, i64 %add10.175.i
  %18 = load i8, i8* %arrayidx.176.i, align 1, !tbaa !1
  %conv11.177.i = zext i8 %18 to i64
  %arrayidx14.178.i = getelementptr inbounds i64, i64* %call35, i64 3
  %19 = load i64, i64* %arrayidx14.178.i, align 8, !tbaa !4
  %mul15.179.i = mul nsw i64 %conv11.177.i, %19
  %add16.180.i = add nsw i64 %add16.2.i, %mul15.179.i
  %add10.1.1.i = add nsw i64 %mul.1.i, %11
  %arrayidx.1.1.i = getelementptr inbounds i8, i8* %call34, i64 %add10.1.1.i
  %20 = load i8, i8* %arrayidx.1.1.i, align 1, !tbaa !1
  %conv11.1.1.i = zext i8 %20 to i64
  %arrayidx14.1.1.i = getelementptr inbounds i64, i64* %call35, i64 4
  %21 = load i64, i64* %arrayidx14.1.1.i, align 8, !tbaa !4
  %mul15.1.1.i = mul nsw i64 %conv11.1.1.i, %21
  %add16.1.1.i = add nsw i64 %add16.180.i, %mul15.1.1.i
  %add10.2.1.i = add nsw i64 %mul.1.i, %14
  %arrayidx.2.1.i = getelementptr inbounds i8, i8* %call34, i64 %add10.2.1.i
  %22 = load i8, i8* %arrayidx.2.1.i, align 1, !tbaa !1
  %conv11.2.1.i = zext i8 %22 to i64
  %arrayidx14.2.1.i = getelementptr inbounds i64, i64* %call35, i64 5
  %23 = load i64, i64* %arrayidx14.2.1.i, align 8, !tbaa !4
  %mul15.2.1.i = mul nsw i64 %conv11.2.1.i, %23
  %add16.2.1.i = add nsw i64 %add16.1.1.i, %mul15.2.1.i
  %sub.2.i = add nuw i64 %y.0163, 1
  %rem.2.i = srem i64 %sub.2.i, %height
  %ispos.2.i = icmp sgt i64 %rem.2.i, -1
  %neg.2.i = sub i64 0, %rem.2.i
  %24 = select i1 %ispos.2.i, i64 %rem.2.i, i64 %neg.2.i
  %mul.2.i = mul nsw i64 %24, %width
  %add10.284.i = add nsw i64 %mul.2.i, %8
  %arrayidx.285.i = getelementptr inbounds i8, i8* %call34, i64 %add10.284.i
  %25 = load i8, i8* %arrayidx.285.i, align 1, !tbaa !1
  %conv11.286.i = zext i8 %25 to i64
  %arrayidx14.287.i = getelementptr inbounds i64, i64* %call35, i64 6
  %26 = load i64, i64* %arrayidx14.287.i, align 8, !tbaa !4
  %mul15.288.i = mul nsw i64 %conv11.286.i, %26
  %add16.289.i = add nsw i64 %add16.2.1.i, %mul15.288.i
  %add10.1.2.i = add nsw i64 %mul.2.i, %11
  %arrayidx.1.2.i = getelementptr inbounds i8, i8* %call34, i64 %add10.1.2.i
  %27 = load i8, i8* %arrayidx.1.2.i, align 1, !tbaa !1
  %conv11.1.2.i = zext i8 %27 to i64
  %arrayidx14.1.2.i = getelementptr inbounds i64, i64* %call35, i64 7
  %28 = load i64, i64* %arrayidx14.1.2.i, align 8, !tbaa !4
  %mul15.1.2.i = mul nsw i64 %conv11.1.2.i, %28
  %add16.1.2.i = add nsw i64 %add16.289.i, %mul15.1.2.i
  %add10.2.2.i = add nsw i64 %mul.2.i, %14
  %arrayidx.2.2.i = getelementptr inbounds i8, i8* %call34, i64 %add10.2.2.i
  %29 = load i8, i8* %arrayidx.2.2.i, align 1, !tbaa !1
  %conv11.2.2.i = zext i8 %29 to i64
  %arrayidx14.2.2.i = getelementptr inbounds i64, i64* %call35, i64 8
  %30 = load i64, i64* %arrayidx14.2.2.i, align 8, !tbaa !4
  %mul15.2.2.i = mul nsw i64 %conv11.2.2.i, %30
  %add16.2.2.i = add nsw i64 %add16.1.2.i, %mul15.2.2.i
  %call38 = tail call i8* @copy1DArray_BYTE(i8* %pixels, i64 %pixels_size) #8
  %call39 = tail call i64* @copy1DArray_int64_t(i64* %call27, i64 9) #8
  %arrayidx.i178 = getelementptr inbounds i8, i8* %call38, i64 %add10.i
  %31 = load i8, i8* %arrayidx.i178, align 1, !tbaa !1
  %conv11.i179 = zext i8 %31 to i64
  %32 = load i64, i64* %call39, align 8, !tbaa !4
  %mul15.i180 = mul nsw i64 %conv11.i179, %32
  %arrayidx.1.i185 = getelementptr inbounds i8, i8* %call38, i64 %add10.1.i
  %33 = load i8, i8* %arrayidx.1.i185, align 1, !tbaa !1
  %conv11.1.i186 = zext i8 %33 to i64
  %arrayidx14.1.i187 = getelementptr inbounds i64, i64* %call39, i64 1
  %34 = load i64, i64* %arrayidx14.1.i187, align 8, !tbaa !4
  %mul15.1.i188 = mul nsw i64 %conv11.1.i186, %34
  %add16.1.i189 = add nsw i64 %mul15.1.i188, %mul15.i180
  %arrayidx.2.i195 = getelementptr inbounds i8, i8* %call38, i64 %add10.2.i
  %35 = load i8, i8* %arrayidx.2.i195, align 1, !tbaa !1
  %conv11.2.i196 = zext i8 %35 to i64
  %arrayidx14.2.i197 = getelementptr inbounds i64, i64* %call39, i64 2
  %36 = load i64, i64* %arrayidx14.2.i197, align 8, !tbaa !4
  %mul15.2.i198 = mul nsw i64 %conv11.2.i196, %36
  %add16.2.i199 = add nsw i64 %add16.1.i189, %mul15.2.i198
  %arrayidx.176.i205 = getelementptr inbounds i8, i8* %call38, i64 %add10.175.i
  %37 = load i8, i8* %arrayidx.176.i205, align 1, !tbaa !1
  %conv11.177.i206 = zext i8 %37 to i64
  %arrayidx14.178.i207 = getelementptr inbounds i64, i64* %call39, i64 3
  %38 = load i64, i64* %arrayidx14.178.i207, align 8, !tbaa !4
  %mul15.179.i208 = mul nsw i64 %conv11.177.i206, %38
  %add16.180.i209 = add nsw i64 %add16.2.i199, %mul15.179.i208
  %arrayidx.1.1.i211 = getelementptr inbounds i8, i8* %call38, i64 %add10.1.1.i
  %39 = load i8, i8* %arrayidx.1.1.i211, align 1, !tbaa !1
  %conv11.1.1.i212 = zext i8 %39 to i64
  %arrayidx14.1.1.i213 = getelementptr inbounds i64, i64* %call39, i64 4
  %40 = load i64, i64* %arrayidx14.1.1.i213, align 8, !tbaa !4
  %mul15.1.1.i214 = mul nsw i64 %conv11.1.1.i212, %40
  %add16.1.1.i215 = add nsw i64 %add16.180.i209, %mul15.1.1.i214
  %arrayidx.2.1.i217 = getelementptr inbounds i8, i8* %call38, i64 %add10.2.1.i
  %41 = load i8, i8* %arrayidx.2.1.i217, align 1, !tbaa !1
  %conv11.2.1.i218 = zext i8 %41 to i64
  %arrayidx14.2.1.i219 = getelementptr inbounds i64, i64* %call39, i64 5
  %42 = load i64, i64* %arrayidx14.2.1.i219, align 8, !tbaa !4
  %mul15.2.1.i220 = mul nsw i64 %conv11.2.1.i218, %42
  %add16.2.1.i221 = add nsw i64 %add16.1.1.i215, %mul15.2.1.i220
  %arrayidx.285.i228 = getelementptr inbounds i8, i8* %call38, i64 %add10.284.i
  %43 = load i8, i8* %arrayidx.285.i228, align 1, !tbaa !1
  %conv11.286.i229 = zext i8 %43 to i64
  %arrayidx14.287.i230 = getelementptr inbounds i64, i64* %call39, i64 6
  %44 = load i64, i64* %arrayidx14.287.i230, align 8, !tbaa !4
  %mul15.288.i231 = mul nsw i64 %conv11.286.i229, %44
  %add16.289.i232 = add nsw i64 %add16.2.1.i221, %mul15.288.i231
  %arrayidx.1.2.i234 = getelementptr inbounds i8, i8* %call38, i64 %add10.1.2.i
  %45 = load i8, i8* %arrayidx.1.2.i234, align 1, !tbaa !1
  %conv11.1.2.i235 = zext i8 %45 to i64
  %arrayidx14.1.2.i236 = getelementptr inbounds i64, i64* %call39, i64 7
  %46 = load i64, i64* %arrayidx14.1.2.i236, align 8, !tbaa !4
  %mul15.1.2.i237 = mul nsw i64 %conv11.1.2.i235, %46
  %add16.1.2.i238 = add nsw i64 %add16.289.i232, %mul15.1.2.i237
  %arrayidx.2.2.i240 = getelementptr inbounds i8, i8* %call38, i64 %add10.2.2.i
  %47 = load i8, i8* %arrayidx.2.2.i240, align 1, !tbaa !1
  %conv11.2.2.i241 = zext i8 %47 to i64
  %arrayidx14.2.2.i242 = getelementptr inbounds i64, i64* %call39, i64 8
  %48 = load i64, i64* %arrayidx14.2.2.i242, align 8, !tbaa !4
  %mul15.2.2.i243 = mul nsw i64 %conv11.2.2.i241, %48
  %add16.2.2.i244 = add nsw i64 %add16.1.2.i238, %mul15.2.2.i243
  %ispos = icmp sgt i64 %add16.2.2.i, -1
  %neg = sub i64 0, %add16.2.2.i
  %49 = select i1 %ispos, i64 %add16.2.2.i, i64 %neg
  %ispos160 = icmp sgt i64 %add16.2.2.i244, -1
  %neg161 = sub i64 0, %add16.2.2.i244
  %50 = select i1 %ispos160, i64 %add16.2.2.i244, i64 %neg161
  %add43 = add nsw i64 %50, %49
  %cmp44 = icmp sgt i64 %add43, 64
  br i1 %cmp44, label %blklab12, label %if.end46

if.end46:                                         ; preds = %if.end32
  %mul33 = mul nsw i64 %y.0163, %width
  %add = add nsw i64 %mul33, %x.0165
  %arrayidx47 = getelementptr inbounds i8, i8* %call1, i64 %add
  store i8 98, i8* %arrayidx47, align 1, !tbaa !1
  br label %blklab12

blklab12:                                         ; preds = %if.end32, %if.end46
  %exitcond = icmp eq i64 %sub.2.i, %height
  br i1 %exitcond, label %blklab10.loopexit, label %if.end32

blklab10.loopexit:                                ; preds = %blklab12
  br label %blklab10

blklab10:                                         ; preds = %blklab10.loopexit, %while.cond28.preheader.blklab10_crit_edge
  %add49.pre-phi = phi i64 [ %.pre, %while.cond28.preheader.blklab10_crit_edge ], [ %sub7.2.i, %blklab10.loopexit ]
  %exitcond167 = icmp eq i64 %add49.pre-phi, %width
  br i1 %exitcond167, label %blklab8.loopexit, label %while.cond28.preheader

blklab8.loopexit:                                 ; preds = %blklab10
  br label %blklab8

blklab8:                                          ; preds = %blklab8.loopexit, %entry
  store i64 %mul, i64* %_size_call_by_ref, align 8, !tbaa !4
  ret i8* %call1
}

declare i8* @create1DArray_BYTE(i8 zeroext, i64) local_unnamed_addr #4

declare i8* @copy1DArray_BYTE(i8*, i64) local_unnamed_addr #4

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #4

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define void @_print_pbm_(%struct._IO_FILE* nocapture readnone %sys, i64 %width, i64 %height, i8* nocapture readonly %pixels, i64 %pixels_size) local_unnamed_addr #3 {
entry:
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 2) #8
  %0 = bitcast i64* %call to <2 x i64>*
  store <2 x i64> <i64 80, i64 49>, <2 x i64>* %0, align 8, !tbaa !4
  tail call void @println_s(i64* %call, i64 2) #8
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i64 %width)
  %call3 = tail call i64* @create1DArray_int64_t(i64 0, i64 1) #8
  store i64 32, i64* %call3, align 8, !tbaa !4
  tail call void @printf_s(i64* %call3, i64 1) #8
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 %height)
  %cmp70 = icmp sgt i64 %height, 0
  br i1 %cmp70, label %while.cond6.preheader.preheader, label %blklab13

while.cond6.preheader.preheader:                  ; preds = %entry
  %cmp868 = icmp sgt i64 %width, 0
  br i1 %cmp868, label %while.cond6.preheader.us.preheader, label %while.cond6.preheader.preheader80

while.cond6.preheader.preheader80:                ; preds = %while.cond6.preheader.preheader
  br label %while.cond6.preheader

while.cond6.preheader.us.preheader:               ; preds = %while.cond6.preheader.preheader
  br label %while.cond6.preheader.us

while.cond6.preheader.us:                         ; preds = %while.cond6.preheader.us.preheader, %blklab15.loopexit.us
  %j.071.us = phi i64 [ %add23.us, %blklab15.loopexit.us ], [ 0, %while.cond6.preheader.us.preheader ]
  %mul.us = mul nsw i64 %j.071.us, %width
  br label %if.end10.us

if.end10.us:                                      ; preds = %while.cond6.preheader.us, %blklab18.us
  %i.069.us = phi i64 [ %add21.us, %blklab18.us ], [ 0, %while.cond6.preheader.us ]
  %add.us = add nsw i64 %i.069.us, %mul.us
  %arrayidx11.us = getelementptr inbounds i8, i8* %pixels, i64 %add.us
  %1 = load i8, i8* %arrayidx11.us, align 1, !tbaa !1
  %cmp13.us = icmp eq i8 %1, 32
  br i1 %cmp13.us, label %if.end16.us, label %blklab17.us

blklab17.us:                                      ; preds = %if.end10.us
  %call18.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i64 1)
  br label %blklab18.us

if.end16.us:                                      ; preds = %if.end10.us
  %call17.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i64 0)
  br label %blklab18.us

blklab18.us:                                      ; preds = %if.end16.us, %blklab17.us
  %call19.us = tail call i64* @create1DArray_int64_t(i64 0, i64 1) #8
  store i64 32, i64* %call19.us, align 8, !tbaa !4
  tail call void @printf_s(i64* %call19.us, i64 1) #8
  %add21.us = add nuw nsw i64 %i.069.us, 1
  %exitcond.us = icmp eq i64 %add21.us, %width
  br i1 %exitcond.us, label %blklab15.loopexit.us, label %if.end10.us

blklab15.loopexit.us:                             ; preds = %blklab18.us
  %call22.us = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #8
  tail call void @println_s(i64* %call22.us, i64 0) #8
  %add23.us = add nuw nsw i64 %j.071.us, 1
  %exitcond73.us = icmp eq i64 %add23.us, %height
  br i1 %exitcond73.us, label %blklab13.loopexit, label %while.cond6.preheader.us

while.cond6.preheader:                            ; preds = %while.cond6.preheader.preheader80, %while.cond6.preheader
  %j.071 = phi i64 [ %add23, %while.cond6.preheader ], [ 0, %while.cond6.preheader.preheader80 ]
  %call22 = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #8
  tail call void @println_s(i64* %call22, i64 0) #8
  %add23 = add nuw nsw i64 %j.071, 1
  %exitcond73 = icmp eq i64 %add23, %height
  br i1 %exitcond73, label %blklab13.loopexit81, label %while.cond6.preheader

blklab13.loopexit:                                ; preds = %blklab15.loopexit.us
  br label %blklab13

blklab13.loopexit81:                              ; preds = %while.cond6.preheader
  br label %blklab13

blklab13:                                         ; preds = %blklab13.loopexit81, %blklab13.loopexit, %entry
  ret void
}

declare void @println_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #5

declare void @printf_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #6 {
entry:
  %_9_size = alloca i64, align 8
  %_9_size_size = alloca i64, align 8
  %_13_size = alloca i64, align 8
  %_13_size_size = alloca i64, align 8
  %_16_size = alloca i64, align 8
  %_18_size = alloca i64, align 8
  %0 = bitcast i64* %_9_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #8
  store i64 0, i64* %_9_size, align 8, !tbaa !4
  %1 = bitcast i64* %_9_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #8
  store i64 0, i64* %_9_size_size, align 8, !tbaa !4
  %2 = bitcast i64* %_13_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #8
  store i64 0, i64* %_13_size, align 8, !tbaa !4
  %3 = bitcast i64* %_13_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %3) #8
  store i64 0, i64* %_13_size_size, align 8, !tbaa !4
  %4 = bitcast i64* %_16_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %4) #8
  store i64 0, i64* %_16_size, align 8, !tbaa !4
  %5 = bitcast i64* %_18_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %5) #8
  store i64 0, i64* %_18_size, align 8, !tbaa !4
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_9_size, i64* nonnull %_9_size_size) #8
  %6 = load i64*, i64** %call, align 8, !tbaa !6
  %7 = load i64, i64* %_9_size_size, align 8, !tbaa !4
  %call1 = call %struct._IO_FILE* @Reader(i64* %6, i64 %7) #8
  %call2 = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_13_size, i64* nonnull %_13_size_size) #8
  %arrayidx3 = getelementptr inbounds i64*, i64** %call2, i64 1
  %8 = load i64*, i64** %arrayidx3, align 8, !tbaa !6
  %call4 = call i64* @parseStringToInt(i64* %8) #8
  %9 = load i64, i64* %call4, align 8, !tbaa !4
  %call6 = call i8* @readAll(%struct._IO_FILE* %call1, i64* nonnull %_16_size) #8
  %10 = load i64, i64* %_16_size, align 8, !tbaa !4
  %call7 = call i8* @copy1DArray_BYTE(i8* %call6, i64 %10) #8
  %call9 = call i8* @copy1DArray_BYTE(i8* %call7, i64 %10) #8
  %call10 = call i8* @_sobelEdgeDetection_(i8* %call9, i64 %10, i64 %9, i64 %9, i64* nonnull %_18_size)
  %11 = load i64, i64* %_18_size, align 8, !tbaa !4
  %call11 = call i8* @copy1DArray_BYTE(i8* %call10, i64 %11) #8
  %call13 = call i8* @copy1DArray_BYTE(i8* %call11, i64 %11) #8
  call void @_print_pbm_(%struct._IO_FILE* undef, i64 %9, i64 %9, i8* %call13, i64 undef)
  call void @exit(i32 0) #9
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #4

declare %struct._IO_FILE* @Reader(i64*, i64) local_unnamed_addr #4

declare i64* @parseStringToInt(i64*) local_unnamed_addr #4

declare i8* @readAll(%struct._IO_FILE*, i64*) local_unnamed_addr #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #7

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 5.0.0 (http://llvm.org/git/clang.git eeb00e3fd54addd6787926c7804bf7eadb3384d6) (http://llvm.org/git/llvm.git e8e3365d5266760f3d7ad247f21496bb69cfef39)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !2, i64 0}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !2, i64 0}
