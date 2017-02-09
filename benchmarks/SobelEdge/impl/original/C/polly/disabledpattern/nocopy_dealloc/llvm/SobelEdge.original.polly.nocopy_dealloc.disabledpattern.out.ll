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

; Function Attrs: nounwind uwtable
define i64 @_convolution_(i8* nocapture %pixels, i64 %pixels_size, i1 zeroext %pixels_dealloc, i64 %width, i64 %height, i64 %xCenter, i64 %yCenter, i64* nocapture %filter, i64 %filter_size, i1 zeroext %filter_dealloc) local_unnamed_addr #2 {
entry:
  %add = add i64 %yCenter, -1
  %add7 = add i64 %xCenter, -1
  %rem = srem i64 %add, %height
  %ispos = icmp sgt i64 %rem, -1
  %neg = sub i64 0, %rem
  %0 = select i1 %ispos, i64 %rem, i64 %neg
  %mul = mul nsw i64 %0, %width
  %rem9 = srem i64 %add7, %width
  %ispos73 = icmp sgt i64 %rem9, -1
  %neg74 = sub i64 0, %rem9
  %1 = select i1 %ispos73, i64 %rem9, i64 %neg74
  %add11 = add nsw i64 %1, %mul
  %arrayidx = getelementptr inbounds i8, i8* %pixels, i64 %add11
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %conv12 = zext i8 %2 to i64
  %3 = load i64, i64* %filter, align 8, !tbaa !4
  %mul16 = mul nsw i64 %conv12, %3
  %rem9.1 = srem i64 %xCenter, %width
  %ispos73.1 = icmp sgt i64 %rem9.1, -1
  %neg74.1 = sub i64 0, %rem9.1
  %4 = select i1 %ispos73.1, i64 %rem9.1, i64 %neg74.1
  %add11.1 = add nsw i64 %4, %mul
  %arrayidx.1 = getelementptr inbounds i8, i8* %pixels, i64 %add11.1
  %5 = load i8, i8* %arrayidx.1, align 1, !tbaa !1
  %conv12.1 = zext i8 %5 to i64
  %arrayidx15.1 = getelementptr inbounds i64, i64* %filter, i64 1
  %6 = load i64, i64* %arrayidx15.1, align 8, !tbaa !4
  %mul16.1 = mul nsw i64 %conv12.1, %6
  %add17.1 = add nsw i64 %mul16.1, %mul16
  %sub8.2 = add i64 %xCenter, 1
  %rem9.2 = srem i64 %sub8.2, %width
  %ispos73.2 = icmp sgt i64 %rem9.2, -1
  %neg74.2 = sub i64 0, %rem9.2
  %7 = select i1 %ispos73.2, i64 %rem9.2, i64 %neg74.2
  %add11.2 = add nsw i64 %7, %mul
  %arrayidx.2 = getelementptr inbounds i8, i8* %pixels, i64 %add11.2
  %8 = load i8, i8* %arrayidx.2, align 1, !tbaa !1
  %conv12.2 = zext i8 %8 to i64
  %arrayidx15.2 = getelementptr inbounds i64, i64* %filter, i64 2
  %9 = load i64, i64* %arrayidx15.2, align 8, !tbaa !4
  %mul16.2 = mul nsw i64 %conv12.2, %9
  %add17.2 = add nsw i64 %mul16.2, %add17.1
  %rem.1 = srem i64 %yCenter, %height
  %ispos.1 = icmp sgt i64 %rem.1, -1
  %neg.1 = sub i64 0, %rem.1
  %10 = select i1 %ispos.1, i64 %rem.1, i64 %neg.1
  %mul.1 = mul nsw i64 %10, %width
  %add11.183 = add nsw i64 %1, %mul.1
  %arrayidx.184 = getelementptr inbounds i8, i8* %pixels, i64 %add11.183
  %11 = load i8, i8* %arrayidx.184, align 1, !tbaa !1
  %conv12.185 = zext i8 %11 to i64
  %arrayidx15.186 = getelementptr inbounds i64, i64* %filter, i64 3
  %12 = load i64, i64* %arrayidx15.186, align 8, !tbaa !4
  %mul16.187 = mul nsw i64 %conv12.185, %12
  %add17.188 = add nsw i64 %mul16.187, %add17.2
  %add11.1.1 = add nsw i64 %4, %mul.1
  %arrayidx.1.1 = getelementptr inbounds i8, i8* %pixels, i64 %add11.1.1
  %13 = load i8, i8* %arrayidx.1.1, align 1, !tbaa !1
  %conv12.1.1 = zext i8 %13 to i64
  %arrayidx15.1.1 = getelementptr inbounds i64, i64* %filter, i64 4
  %14 = load i64, i64* %arrayidx15.1.1, align 8, !tbaa !4
  %mul16.1.1 = mul nsw i64 %conv12.1.1, %14
  %add17.1.1 = add nsw i64 %mul16.1.1, %add17.188
  %add11.2.1 = add nsw i64 %7, %mul.1
  %arrayidx.2.1 = getelementptr inbounds i8, i8* %pixels, i64 %add11.2.1
  %15 = load i8, i8* %arrayidx.2.1, align 1, !tbaa !1
  %conv12.2.1 = zext i8 %15 to i64
  %arrayidx15.2.1 = getelementptr inbounds i64, i64* %filter, i64 5
  %16 = load i64, i64* %arrayidx15.2.1, align 8, !tbaa !4
  %mul16.2.1 = mul nsw i64 %conv12.2.1, %16
  %add17.2.1 = add nsw i64 %mul16.2.1, %add17.1.1
  %sub.2 = add i64 %yCenter, 1
  %rem.2 = srem i64 %sub.2, %height
  %ispos.2 = icmp sgt i64 %rem.2, -1
  %neg.2 = sub i64 0, %rem.2
  %17 = select i1 %ispos.2, i64 %rem.2, i64 %neg.2
  %mul.2 = mul nsw i64 %17, %width
  %add11.292 = add nsw i64 %1, %mul.2
  %arrayidx.293 = getelementptr inbounds i8, i8* %pixels, i64 %add11.292
  %18 = load i8, i8* %arrayidx.293, align 1, !tbaa !1
  %conv12.294 = zext i8 %18 to i64
  %arrayidx15.295 = getelementptr inbounds i64, i64* %filter, i64 6
  %19 = load i64, i64* %arrayidx15.295, align 8, !tbaa !4
  %mul16.296 = mul nsw i64 %conv12.294, %19
  %add17.297 = add nsw i64 %mul16.296, %add17.2.1
  %add11.1.2 = add nsw i64 %4, %mul.2
  %arrayidx.1.2 = getelementptr inbounds i8, i8* %pixels, i64 %add11.1.2
  %20 = load i8, i8* %arrayidx.1.2, align 1, !tbaa !1
  %conv12.1.2 = zext i8 %20 to i64
  %arrayidx15.1.2 = getelementptr inbounds i64, i64* %filter, i64 7
  %21 = load i64, i64* %arrayidx15.1.2, align 8, !tbaa !4
  %mul16.1.2 = mul nsw i64 %conv12.1.2, %21
  %add17.1.2 = add nsw i64 %mul16.1.2, %add17.297
  %add11.2.2 = add nsw i64 %7, %mul.2
  %arrayidx.2.2 = getelementptr inbounds i8, i8* %pixels, i64 %add11.2.2
  %22 = load i8, i8* %arrayidx.2.2, align 1, !tbaa !1
  %conv12.2.2 = zext i8 %22 to i64
  %arrayidx15.2.2 = getelementptr inbounds i64, i64* %filter, i64 8
  %23 = load i64, i64* %arrayidx15.2.2, align 8, !tbaa !4
  %mul16.2.2 = mul nsw i64 %conv12.2.2, %23
  %add17.2.2 = add nsw i64 %mul16.2.2, %add17.1.2
  br i1 %pixels_dealloc, label %if.then20, label %if.end21

if.then20:                                        ; preds = %entry
  tail call void @free(i8* nonnull %pixels) #7
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %entry
  br i1 %filter_dealloc, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end21
  %24 = bitcast i64* %filter to i8*
  tail call void @free(i8* %24) #7
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end21
  ret i64 %add17.2.2
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define i8* @_sobelEdgeDetection_(i8* nocapture %pixels, i64 %pixels_size, i1 zeroext %pixels_dealloc, i64 %width, i64 %height, i64* nocapture %_size_call_by_ref) local_unnamed_addr #2 {
entry:
  %mul = mul nsw i64 %height, %width
  %call = tail call i8* @create1DArray_BYTE(i8 zeroext 32, i64 %mul) #7
  %call13 = tail call i64* @create1DArray_int64_t(i64 0, i64 9) #7
  %arrayidx14 = getelementptr inbounds i64, i64* %call13, i64 1
  %0 = bitcast i64* %call13 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 0>, <2 x i64>* %0, align 8, !tbaa !4
  %arrayidx15 = getelementptr inbounds i64, i64* %call13, i64 2
  %arrayidx16 = getelementptr inbounds i64, i64* %call13, i64 3
  %1 = bitcast i64* %arrayidx15 to <2 x i64>*
  store <2 x i64> <i64 1, i64 -2>, <2 x i64>* %1, align 8, !tbaa !4
  %arrayidx17 = getelementptr inbounds i64, i64* %call13, i64 4
  %arrayidx18 = getelementptr inbounds i64, i64* %call13, i64 5
  %2 = bitcast i64* %arrayidx17 to <2 x i64>*
  store <2 x i64> <i64 0, i64 2>, <2 x i64>* %2, align 8, !tbaa !4
  %arrayidx19 = getelementptr inbounds i64, i64* %call13, i64 6
  %arrayidx20 = getelementptr inbounds i64, i64* %call13, i64 7
  %3 = bitcast i64* %arrayidx19 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 0>, <2 x i64>* %3, align 8, !tbaa !4
  %arrayidx21 = getelementptr inbounds i64, i64* %call13, i64 8
  store i64 1, i64* %arrayidx21, align 8, !tbaa !4
  %not.cmp22 = icmp eq i64* %call13, null
  %call37 = tail call i64* @create1DArray_int64_t(i64 0, i64 9) #7
  %arrayidx39 = getelementptr inbounds i64, i64* %call37, i64 1
  %4 = bitcast i64* %call37 to <2 x i64>*
  store <2 x i64> <i64 1, i64 2>, <2 x i64>* %4, align 8, !tbaa !4
  %arrayidx40 = getelementptr inbounds i64, i64* %call37, i64 2
  store i64 1, i64* %arrayidx40, align 8, !tbaa !4
  %arrayidx41 = getelementptr inbounds i64, i64* %call37, i64 3
  %arrayidx42 = getelementptr inbounds i64, i64* %call37, i64 4
  %arrayidx43 = getelementptr inbounds i64, i64* %call37, i64 5
  %arrayidx44 = getelementptr inbounds i64, i64* %call37, i64 6
  %5 = bitcast i64* %arrayidx41 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 24, i32 8, i1 false)
  %arrayidx45 = getelementptr inbounds i64, i64* %call37, i64 7
  %6 = bitcast i64* %arrayidx44 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 -2>, <2 x i64>* %6, align 8, !tbaa !4
  %arrayidx46 = getelementptr inbounds i64, i64* %call37, i64 8
  store i64 -1, i64* %arrayidx46, align 8, !tbaa !4
  %not.cmp47 = icmp eq i64* %call37, null
  %cmp56223 = icmp sgt i64 %width, 0
  br i1 %cmp56223, label %while.cond59.preheader.preheader, label %blklab8

while.cond59.preheader.preheader:                 ; preds = %entry
  %cmp61221 = icmp sgt i64 %height, 0
  br label %while.cond59.preheader

while.cond59.preheader:                           ; preds = %while.cond59.preheader.preheader, %blklab10
  %x.0224 = phi i64 [ %add75.pre-phi, %blklab10 ], [ 0, %while.cond59.preheader.preheader ]
  br i1 %cmp61221, label %if.end63.preheader, label %while.cond59.preheader.blklab10_crit_edge

while.cond59.preheader.blklab10_crit_edge:        ; preds = %while.cond59.preheader
  %.pre = add nuw nsw i64 %x.0224, 1
  br label %blklab10

if.end63.preheader:                               ; preds = %while.cond59.preheader
  %add7.i = add nsw i64 %x.0224, -1
  %rem9.i = srem i64 %add7.i, %width
  %ispos73.i = icmp sgt i64 %rem9.i, -1
  %neg74.i = sub i64 0, %rem9.i
  %7 = select i1 %ispos73.i, i64 %rem9.i, i64 %neg74.i
  %rem9.1.i = srem i64 %x.0224, %width
  %ispos73.1.i = icmp sgt i64 %rem9.1.i, -1
  %neg74.1.i = sub i64 0, %rem9.1.i
  %8 = select i1 %ispos73.1.i, i64 %rem9.1.i, i64 %neg74.1.i
  %sub8.2.i = add nuw nsw i64 %x.0224, 1
  %rem9.2.i = srem i64 %sub8.2.i, %width
  %ispos73.2.i = icmp sgt i64 %rem9.2.i, -1
  %neg74.2.i = sub i64 0, %rem9.2.i
  %9 = select i1 %ispos73.2.i, i64 %rem9.2.i, i64 %neg74.2.i
  br label %if.end63

if.end63:                                         ; preds = %if.end63.preheader, %blklab12
  %y.0222 = phi i64 [ %sub.2.i, %blklab12 ], [ 0, %if.end63.preheader ]
  %add.i = add i64 %y.0222, -1
  %rem.i = srem i64 %add.i, %height
  %ispos.i = icmp sgt i64 %rem.i, -1
  %neg.i = sub i64 0, %rem.i
  %10 = select i1 %ispos.i, i64 %rem.i, i64 %neg.i
  %mul.i = mul nsw i64 %10, %width
  %add11.i = add nsw i64 %7, %mul.i
  %arrayidx.i = getelementptr inbounds i8, i8* %pixels, i64 %add11.i
  %11 = load i8, i8* %arrayidx.i, align 1, !tbaa !1
  %conv12.i = zext i8 %11 to i64
  %12 = load i64, i64* %call13, align 8, !tbaa !4
  %mul16.i = mul nsw i64 %conv12.i, %12
  %add11.1.i = add nsw i64 %8, %mul.i
  %arrayidx.1.i = getelementptr inbounds i8, i8* %pixels, i64 %add11.1.i
  %13 = load i8, i8* %arrayidx.1.i, align 1, !tbaa !1
  %conv12.1.i = zext i8 %13 to i64
  %14 = load i64, i64* %arrayidx14, align 8, !tbaa !4
  %mul16.1.i = mul nsw i64 %conv12.1.i, %14
  %add17.1.i = add nsw i64 %mul16.1.i, %mul16.i
  %add11.2.i = add nsw i64 %9, %mul.i
  %arrayidx.2.i = getelementptr inbounds i8, i8* %pixels, i64 %add11.2.i
  %15 = load i8, i8* %arrayidx.2.i, align 1, !tbaa !1
  %conv12.2.i = zext i8 %15 to i64
  %16 = load i64, i64* %arrayidx15, align 8, !tbaa !4
  %mul16.2.i = mul nsw i64 %conv12.2.i, %16
  %add17.2.i = add nsw i64 %add17.1.i, %mul16.2.i
  %rem.1.i = srem i64 %y.0222, %height
  %ispos.1.i = icmp sgt i64 %rem.1.i, -1
  %neg.1.i = sub i64 0, %rem.1.i
  %17 = select i1 %ispos.1.i, i64 %rem.1.i, i64 %neg.1.i
  %mul.1.i = mul nsw i64 %17, %width
  %add11.183.i = add nsw i64 %mul.1.i, %7
  %arrayidx.184.i = getelementptr inbounds i8, i8* %pixels, i64 %add11.183.i
  %18 = load i8, i8* %arrayidx.184.i, align 1, !tbaa !1
  %conv12.185.i = zext i8 %18 to i64
  %19 = load i64, i64* %arrayidx16, align 8, !tbaa !4
  %mul16.187.i = mul nsw i64 %conv12.185.i, %19
  %add17.188.i = add nsw i64 %add17.2.i, %mul16.187.i
  %add11.1.1.i = add nsw i64 %mul.1.i, %8
  %arrayidx.1.1.i = getelementptr inbounds i8, i8* %pixels, i64 %add11.1.1.i
  %20 = load i8, i8* %arrayidx.1.1.i, align 1, !tbaa !1
  %conv12.1.1.i = zext i8 %20 to i64
  %21 = load i64, i64* %arrayidx17, align 8, !tbaa !4
  %mul16.1.1.i = mul nsw i64 %conv12.1.1.i, %21
  %add17.1.1.i = add nsw i64 %add17.188.i, %mul16.1.1.i
  %add11.2.1.i = add nsw i64 %mul.1.i, %9
  %arrayidx.2.1.i = getelementptr inbounds i8, i8* %pixels, i64 %add11.2.1.i
  %22 = load i8, i8* %arrayidx.2.1.i, align 1, !tbaa !1
  %conv12.2.1.i = zext i8 %22 to i64
  %23 = load i64, i64* %arrayidx18, align 8, !tbaa !4
  %mul16.2.1.i = mul nsw i64 %conv12.2.1.i, %23
  %add17.2.1.i = add nsw i64 %add17.1.1.i, %mul16.2.1.i
  %sub.2.i = add nuw i64 %y.0222, 1
  %rem.2.i = srem i64 %sub.2.i, %height
  %ispos.2.i = icmp sgt i64 %rem.2.i, -1
  %neg.2.i = sub i64 0, %rem.2.i
  %24 = select i1 %ispos.2.i, i64 %rem.2.i, i64 %neg.2.i
  %mul.2.i = mul nsw i64 %24, %width
  %add11.292.i = add nsw i64 %mul.2.i, %7
  %arrayidx.293.i = getelementptr inbounds i8, i8* %pixels, i64 %add11.292.i
  %25 = load i8, i8* %arrayidx.293.i, align 1, !tbaa !1
  %conv12.294.i = zext i8 %25 to i64
  %26 = load i64, i64* %arrayidx19, align 8, !tbaa !4
  %mul16.296.i = mul nsw i64 %conv12.294.i, %26
  %add17.297.i = add nsw i64 %add17.2.1.i, %mul16.296.i
  %add11.1.2.i = add nsw i64 %mul.2.i, %8
  %arrayidx.1.2.i = getelementptr inbounds i8, i8* %pixels, i64 %add11.1.2.i
  %27 = load i8, i8* %arrayidx.1.2.i, align 1, !tbaa !1
  %conv12.1.2.i = zext i8 %27 to i64
  %28 = load i64, i64* %arrayidx20, align 8, !tbaa !4
  %mul16.1.2.i = mul nsw i64 %conv12.1.2.i, %28
  %add17.1.2.i = add nsw i64 %add17.297.i, %mul16.1.2.i
  %add11.2.2.i = add nsw i64 %mul.2.i, %9
  %arrayidx.2.2.i = getelementptr inbounds i8, i8* %pixels, i64 %add11.2.2.i
  %29 = load i8, i8* %arrayidx.2.2.i, align 1, !tbaa !1
  %conv12.2.2.i = zext i8 %29 to i64
  %30 = load i64, i64* %arrayidx21, align 8, !tbaa !4
  %mul16.2.2.i = mul nsw i64 %conv12.2.2.i, %30
  %add17.2.2.i = add nsw i64 %add17.1.2.i, %mul16.2.2.i
  %31 = load i64, i64* %call37, align 8, !tbaa !4
  %mul16.i239 = mul nsw i64 %31, %conv12.i
  %32 = load i64, i64* %arrayidx39, align 8, !tbaa !4
  %mul16.1.i247 = mul nsw i64 %32, %conv12.1.i
  %add17.1.i248 = add nsw i64 %mul16.1.i247, %mul16.i239
  %33 = load i64, i64* %arrayidx40, align 8, !tbaa !4
  %mul16.2.i257 = mul nsw i64 %33, %conv12.2.i
  %add17.2.i258 = add nsw i64 %add17.1.i248, %mul16.2.i257
  %34 = load i64, i64* %arrayidx41, align 8, !tbaa !4
  %mul16.187.i267 = mul nsw i64 %34, %conv12.185.i
  %add17.188.i268 = add nsw i64 %add17.2.i258, %mul16.187.i267
  %35 = load i64, i64* %arrayidx42, align 8, !tbaa !4
  %mul16.1.1.i273 = mul nsw i64 %35, %conv12.1.1.i
  %add17.1.1.i274 = add nsw i64 %add17.188.i268, %mul16.1.1.i273
  %36 = load i64, i64* %arrayidx43, align 8, !tbaa !4
  %mul16.2.1.i279 = mul nsw i64 %36, %conv12.2.1.i
  %add17.2.1.i280 = add nsw i64 %add17.1.1.i274, %mul16.2.1.i279
  %37 = load i64, i64* %arrayidx44, align 8, !tbaa !4
  %mul16.296.i290 = mul nsw i64 %37, %conv12.294.i
  %add17.297.i291 = add nsw i64 %add17.2.1.i280, %mul16.296.i290
  %38 = load i64, i64* %arrayidx45, align 8, !tbaa !4
  %mul16.1.2.i296 = mul nsw i64 %38, %conv12.1.2.i
  %add17.1.2.i297 = add nsw i64 %add17.297.i291, %mul16.1.2.i296
  %39 = load i64, i64* %arrayidx46, align 8, !tbaa !4
  %mul16.2.2.i302 = mul nsw i64 %39, %conv12.2.2.i
  %add17.2.2.i303 = add nsw i64 %add17.1.2.i297, %mul16.2.2.i302
  %ispos = icmp sgt i64 %add17.2.2.i, -1
  %neg = sub i64 0, %add17.2.2.i
  %40 = select i1 %ispos, i64 %add17.2.2.i, i64 %neg
  %ispos219 = icmp sgt i64 %add17.2.2.i303, -1
  %neg220 = sub i64 0, %add17.2.2.i303
  %41 = select i1 %ispos219, i64 %add17.2.2.i303, i64 %neg220
  %add69 = add nsw i64 %41, %40
  %cmp70 = icmp sgt i64 %add69, 64
  br i1 %cmp70, label %blklab12, label %if.end72

if.end72:                                         ; preds = %if.end63
  %mul64 = mul nsw i64 %y.0222, %width
  %add = add nsw i64 %mul64, %x.0224
  %arrayidx73 = getelementptr inbounds i8, i8* %call, i64 %add
  store i8 98, i8* %arrayidx73, align 1, !tbaa !1
  br label %blklab12

blklab12:                                         ; preds = %if.end63, %if.end72
  %exitcond = icmp eq i64 %sub.2.i, %height
  br i1 %exitcond, label %blklab10.loopexit, label %if.end63

blklab10.loopexit:                                ; preds = %blklab12
  br label %blklab10

blklab10:                                         ; preds = %blklab10.loopexit, %while.cond59.preheader.blklab10_crit_edge
  %add75.pre-phi = phi i64 [ %.pre, %while.cond59.preheader.blklab10_crit_edge ], [ %sub8.2.i, %blklab10.loopexit ]
  %exitcond226 = icmp eq i64 %add75.pre-phi, %width
  br i1 %exitcond226, label %blklab8.loopexit, label %while.cond59.preheader

blklab8.loopexit:                                 ; preds = %blklab10
  br label %blklab8

blklab8:                                          ; preds = %blklab8.loopexit, %entry
  br i1 %pixels_dealloc, label %if.then77, label %if.end81

if.then77:                                        ; preds = %blklab8
  tail call void @free(i8* %pixels) #7
  br label %if.end81

if.end81:                                         ; preds = %blklab8, %if.then77
  br i1 %not.cmp22, label %if.end84, label %if.then83

if.then83:                                        ; preds = %if.end81
  %42 = bitcast i64* %call13 to i8*
  tail call void @free(i8* %42) #7
  br label %if.end84

if.end84:                                         ; preds = %if.end81, %if.then83
  br i1 %not.cmp47, label %if.end96, label %if.then86

if.then86:                                        ; preds = %if.end84
  %43 = bitcast i64* %call37 to i8*
  tail call void @free(i8* %43) #7
  br label %if.end96

if.end96:                                         ; preds = %if.end84, %if.then86
  store i64 %mul, i64* %_size_call_by_ref, align 8, !tbaa !4
  ret i8* %call
}

declare i8* @create1DArray_BYTE(i8 zeroext, i64) local_unnamed_addr #4

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define void @_print_pbm_(%struct._IO_FILE* nocapture readnone %sys, i64 %width, i64 %height, i8* nocapture %pixels, i64 %pixels_size, i1 zeroext %pixels_dealloc) local_unnamed_addr #2 {
entry:
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 2) #7
  %0 = bitcast i64* %call to <2 x i64>*
  store <2 x i64> <i64 80, i64 49>, <2 x i64>* %0, align 8, !tbaa !4
  %not.cmp = icmp eq i64* %call, null
  tail call void @println_s(i64* %call, i64 2) #7
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i64 %width)
  %call8 = tail call i64* @create1DArray_int64_t(i64 0, i64 1) #7
  store i64 32, i64* %call8, align 8, !tbaa !4
  %not.cmp10 = icmp eq i64* %call8, null
  tail call void @printf_s(i64* %call8, i64 1) #7
  %call14 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 %height)
  %cmp15134 = icmp sgt i64 %height, 0
  br i1 %cmp15134, label %while.cond18.preheader.preheader, label %blklab13

while.cond18.preheader.preheader:                 ; preds = %entry
  %cmp20129 = icmp sgt i64 %width, 0
  br i1 %cmp20129, label %while.cond18.preheader.us.preheader, label %while.cond18.preheader.preheader155

while.cond18.preheader.preheader155:              ; preds = %while.cond18.preheader.preheader
  br label %while.cond18.preheader

while.cond18.preheader.us.preheader:              ; preds = %while.cond18.preheader.preheader
  br label %while.cond18.preheader.us

while.cond18.preheader.us:                        ; preds = %while.cond18.preheader.us.preheader, %if.end44.us
  %_36_dealloc.0140.us = phi i8 [ %.128.us, %if.end44.us ], [ 0, %while.cond18.preheader.us.preheader ]
  %_36.0139.us = phi i8* [ %4, %if.end44.us ], [ undef, %while.cond18.preheader.us.preheader ]
  %_31_dealloc.0138.us = phi i8 [ %..us, %if.end44.us ], [ 0, %while.cond18.preheader.us.preheader ]
  %_31.0137.us = phi i64* [ %call34.us, %if.end44.us ], [ null, %while.cond18.preheader.us.preheader ]
  %j.0135.us = phi i64 [ %add51.us, %if.end44.us ], [ 0, %while.cond18.preheader.us.preheader ]
  %mul.us = mul nsw i64 %j.0135.us, %width
  br label %if.end22.us

if.end22.us:                                      ; preds = %while.cond18.preheader.us, %if.end33.us
  %_31_dealloc.1132.us = phi i8 [ %..us, %if.end33.us ], [ %_31_dealloc.0138.us, %while.cond18.preheader.us ]
  %_31.1131.us = phi i64* [ %call34.us, %if.end33.us ], [ %_31.0137.us, %while.cond18.preheader.us ]
  %i.0130.us = phi i64 [ %add41.us, %if.end33.us ], [ 0, %while.cond18.preheader.us ]
  %add.us = add nsw i64 %i.0130.us, %mul.us
  %arrayidx23.us = getelementptr inbounds i8, i8* %pixels, i64 %add.us
  %1 = load i8, i8* %arrayidx23.us, align 1, !tbaa !1
  %cmp25.us = icmp eq i8 %1, 32
  br i1 %cmp25.us, label %if.end28.us, label %blklab17.us

blklab17.us:                                      ; preds = %if.end22.us
  %call30.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i64 1)
  br label %blklab18.us

if.end28.us:                                      ; preds = %if.end22.us
  %call29.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i64 0)
  br label %blklab18.us

blklab18.us:                                      ; preds = %if.end28.us, %blklab17.us
  %2 = and i8 %_31_dealloc.1132.us, 1
  %tobool31.us = icmp eq i8 %2, 0
  br i1 %tobool31.us, label %if.end33.us, label %if.then32.us

if.then32.us:                                     ; preds = %blklab18.us
  %3 = bitcast i64* %_31.1131.us to i8*
  tail call void @free(i8* %3) #7
  br label %if.end33.us

if.end33.us:                                      ; preds = %if.then32.us, %blklab18.us
  %call34.us = tail call i64* @create1DArray_int64_t(i64 0, i64 1) #7
  store i64 32, i64* %call34.us, align 8, !tbaa !4
  %not.cmp36.us = icmp ne i64* %call34.us, null
  %..us = zext i1 %not.cmp36.us to i8
  tail call void @printf_s(i64* %call34.us, i64 1) #7
  %add41.us = add nuw nsw i64 %i.0130.us, 1
  %exitcond.us = icmp eq i64 %add41.us, %width
  br i1 %exitcond.us, label %blklab15.loopexit.us, label %if.end22.us

if.then43.us:                                     ; preds = %blklab15.loopexit.us
  tail call void @free(i8* %_36.0139.us) #7
  br label %if.end44.us

if.end44.us:                                      ; preds = %if.then43.us, %blklab15.loopexit.us
  %call45.us = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #7
  %4 = bitcast i64* %call45.us to i8*
  %not.cmp46.us = icmp ne i64* %call45.us, null
  %.128.us = zext i1 %not.cmp46.us to i8
  tail call void @println_s(i64* %call45.us, i64 0) #7
  %add51.us = add nuw nsw i64 %j.0135.us, 1
  %exitcond145.us = icmp eq i64 %add51.us, %height
  br i1 %exitcond145.us, label %blklab13.loopexit, label %while.cond18.preheader.us

blklab15.loopexit.us:                             ; preds = %if.end33.us
  %tobool42.us = icmp eq i8 %_36_dealloc.0140.us, 0
  br i1 %tobool42.us, label %if.end44.us, label %if.then43.us

while.cond18.preheader:                           ; preds = %while.cond18.preheader.preheader155, %if.end44
  %_36_dealloc.0140 = phi i8 [ %.128, %if.end44 ], [ 0, %while.cond18.preheader.preheader155 ]
  %_36.0139 = phi i8* [ %5, %if.end44 ], [ undef, %while.cond18.preheader.preheader155 ]
  %j.0135 = phi i64 [ %add51, %if.end44 ], [ 0, %while.cond18.preheader.preheader155 ]
  %tobool42 = icmp eq i8 %_36_dealloc.0140, 0
  br i1 %tobool42, label %if.end44, label %if.then43

if.then43:                                        ; preds = %while.cond18.preheader
  tail call void @free(i8* %_36.0139) #7
  br label %if.end44

if.end44:                                         ; preds = %while.cond18.preheader, %if.then43
  %call45 = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #7
  %5 = bitcast i64* %call45 to i8*
  %not.cmp46 = icmp ne i64* %call45, null
  %.128 = zext i1 %not.cmp46 to i8
  tail call void @println_s(i64* %call45, i64 0) #7
  %add51 = add nuw nsw i64 %j.0135, 1
  %exitcond145 = icmp eq i64 %add51, %height
  br i1 %exitcond145, label %blklab13.loopexit156, label %while.cond18.preheader

blklab13.loopexit:                                ; preds = %if.end44.us
  %phitmp = bitcast i64* %call34.us to i8*
  br label %blklab13

blklab13.loopexit156:                             ; preds = %if.end44
  br label %blklab13

blklab13:                                         ; preds = %blklab13.loopexit156, %blklab13.loopexit, %entry
  %_31.0.lcssa = phi i8* [ null, %entry ], [ %phitmp, %blklab13.loopexit ], [ null, %blklab13.loopexit156 ]
  %_31_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %..us, %blklab13.loopexit ], [ 0, %blklab13.loopexit156 ]
  %_36.0.lcssa = phi i8* [ undef, %entry ], [ %4, %blklab13.loopexit ], [ %5, %blklab13.loopexit156 ]
  %_36_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %.128.us, %blklab13.loopexit ], [ %.128, %blklab13.loopexit156 ]
  br i1 %pixels_dealloc, label %if.then53, label %if.end54

if.then53:                                        ; preds = %blklab13
  tail call void @free(i8* %pixels) #7
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %blklab13
  br i1 %not.cmp, label %if.end57, label %if.then56

if.then56:                                        ; preds = %if.end54
  %6 = bitcast i64* %call to i8*
  tail call void @free(i8* %6) #7
  br label %if.end57

if.end57:                                         ; preds = %if.end54, %if.then56
  br i1 %not.cmp10, label %if.end60, label %if.then59

if.then59:                                        ; preds = %if.end57
  %7 = bitcast i64* %call8 to i8*
  tail call void @free(i8* %7) #7
  br label %if.end60

if.end60:                                         ; preds = %if.end57, %if.then59
  %tobool61 = icmp eq i8 %_31_dealloc.0.lcssa, 0
  br i1 %tobool61, label %if.end63, label %if.then62

if.then62:                                        ; preds = %if.end60
  tail call void @free(i8* %_31.0.lcssa) #7
  br label %if.end63

if.end63:                                         ; preds = %if.end60, %if.then62
  %tobool64 = icmp eq i8 %_36_dealloc.0.lcssa, 0
  br i1 %tobool64, label %if.end66, label %if.then65

if.then65:                                        ; preds = %if.end63
  tail call void @free(i8* %_36.0.lcssa) #7
  br label %if.end66

if.end66:                                         ; preds = %if.end63, %if.then65
  ret void
}

declare void @println_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

declare void @printf_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #5 {
entry:
  %_9_size = alloca i64, align 8
  %_9_size_size = alloca i64, align 8
  %_13_size = alloca i64, align 8
  %_13_size_size = alloca i64, align 8
  %_16_size = alloca i64, align 8
  %_18_size = alloca i64, align 8
  %0 = bitcast i64* %_9_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #7
  store i64 0, i64* %_9_size, align 8, !tbaa !4
  %1 = bitcast i64* %_9_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #7
  store i64 0, i64* %_9_size_size, align 8, !tbaa !4
  %2 = bitcast i64* %_13_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #7
  store i64 0, i64* %_13_size, align 8, !tbaa !4
  %3 = bitcast i64* %_13_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %3) #7
  store i64 0, i64* %_13_size_size, align 8, !tbaa !4
  %4 = bitcast i64* %_16_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %4) #7
  store i64 0, i64* %_16_size, align 8, !tbaa !4
  %5 = bitcast i64* %_18_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %5) #7
  store i64 0, i64* %_18_size, align 8, !tbaa !4
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_9_size, i64* nonnull %_9_size_size) #7
  %not.cmp = icmp eq i64** %call, null
  %6 = load i64*, i64** %call, align 8, !tbaa !6
  %7 = load i64, i64* %_9_size_size, align 8, !tbaa !4
  %call3 = call %struct._IO_FILE* @Reader(i64* %6, i64 %7) #7
  %call7 = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_13_size, i64* nonnull %_13_size_size) #7
  %not.cmp8 = icmp eq i64** %call7, null
  %arrayidx12 = getelementptr inbounds i64*, i64** %call7, i64 1
  %8 = load i64*, i64** %arrayidx12, align 8, !tbaa !6
  %call13 = call i64* @parseStringToInt(i64* %8) #7
  %not.cmp14 = icmp eq i64* %call13, null
  br i1 %not.cmp14, label %blklab19, label %if.end24

if.end24:                                         ; preds = %entry
  %9 = load i64, i64* %call13, align 8, !tbaa !4
  %call25 = call i8* @readAll(%struct._IO_FILE* %call3, i64* nonnull %_16_size) #7
  %not.cmp26 = icmp ne i8* %call25, null
  %.120 = zext i1 %not.cmp26 to i8
  %call38 = call i8* @_sobelEdgeDetection_(i8* %call25, i64 undef, i1 zeroext false, i64 %9, i64 %9, i64* nonnull %_18_size)
  %not.cmp39 = icmp ne i8* %call38, null
  %_18_dealloc.0 = zext i1 %not.cmp39 to i8
  call void @_print_pbm_(%struct._IO_FILE* undef, i64 %9, i64 %9, i8* %call38, i64 undef, i1 zeroext false)
  br label %blklab19

blklab19:                                         ; preds = %entry, %if.end24
  %pixels.0 = phi i8* [ null, %entry ], [ %call25, %if.end24 ]
  %pixels_dealloc.0 = phi i8 [ 0, %entry ], [ %.120, %if.end24 ]
  %newPixels.0 = phi i8* [ null, %entry ], [ %call38, %if.end24 ]
  %newPixels_dealloc.0 = phi i8 [ 0, %entry ], [ %_18_dealloc.0, %if.end24 ]
  %cmp48 = icmp eq %struct._IO_FILE* %call3, null
  br i1 %cmp48, label %if.end51, label %if.then49

if.then49:                                        ; preds = %blklab19
  %call50 = call i32 @fclose(%struct._IO_FILE* nonnull %call3)
  br label %if.end51

if.end51:                                         ; preds = %blklab19, %if.then49
  br i1 %not.cmp14, label %if.end54, label %if.then53

if.then53:                                        ; preds = %if.end51
  %10 = bitcast i64* %call13 to i8*
  call void @free(i8* %10) #7
  br label %if.end54

if.end54:                                         ; preds = %if.end51, %if.then53
  %tobool55 = icmp eq i8 %pixels_dealloc.0, 0
  br i1 %tobool55, label %if.end57, label %if.then56

if.then56:                                        ; preds = %if.end54
  call void @free(i8* %pixels.0) #7
  br label %if.end57

if.end57:                                         ; preds = %if.end54, %if.then56
  %tobool58 = icmp eq i8 %newPixels_dealloc.0, 0
  br i1 %tobool58, label %if.end60, label %if.then59

if.then59:                                        ; preds = %if.end57
  call void @free(i8* %newPixels.0) #7
  br label %if.end60

if.end60:                                         ; preds = %if.end57, %if.then59
  br i1 %not.cmp, label %if.end69, label %if.then62

if.then62:                                        ; preds = %if.end60
  %11 = load i64, i64* %_9_size, align 8, !tbaa !4
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %11) #7
  br label %if.end69

if.end69:                                         ; preds = %if.end60, %if.then62
  br i1 %not.cmp8, label %if.end81, label %if.then71

if.then71:                                        ; preds = %if.end69
  %12 = load i64, i64* %_13_size, align 8, !tbaa !4
  call void @free2DArray_int64_t(i64** nonnull %call7, i64 %12) #7
  br label %if.end81

if.end81:                                         ; preds = %if.end69, %if.then71
  call void @exit(i32 0) #8
  unreachable
}

declare void @free2DArray_int64_t(i64**, i64) local_unnamed_addr #4

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #4

declare %struct._IO_FILE* @Reader(i64*, i64) local_unnamed_addr #4

declare i64* @parseStringToInt(i64*) local_unnamed_addr #4

declare i8* @readAll(%struct._IO_FILE*, i64*) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 5.0.0 (http://llvm.org/git/clang.git eeb00e3fd54addd6787926c7804bf7eadb3384d6) (http://llvm.org/git/llvm.git e8e3365d5266760f3d7ad247f21496bb69cfef39)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !2, i64 0}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !2, i64 0}