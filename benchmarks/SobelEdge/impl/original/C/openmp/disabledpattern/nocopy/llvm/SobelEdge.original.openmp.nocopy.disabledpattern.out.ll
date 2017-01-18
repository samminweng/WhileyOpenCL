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
define i8* @_sobelEdgeDetection_(i8* nocapture readonly %pixels, i64 %pixels_size, i64 %width, i64 %height, i64* nocapture %_size_call_by_ref) local_unnamed_addr #3 {
entry:
  %mul = mul nsw i64 %height, %width
  %call = tail call i8* @create1DArray_BYTE(i8 zeroext 32, i64 %mul) #8
  %call3 = tail call i64* @create1DArray_int64_t(i64 0, i64 9) #8
  %0 = bitcast i64* %call3 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 0>, <2 x i64>* %0, align 8, !tbaa !4
  %arrayidx5 = getelementptr inbounds i64, i64* %call3, i64 2
  %1 = bitcast i64* %arrayidx5 to <2 x i64>*
  store <2 x i64> <i64 1, i64 -2>, <2 x i64>* %1, align 8, !tbaa !4
  %arrayidx7 = getelementptr inbounds i64, i64* %call3, i64 4
  %2 = bitcast i64* %arrayidx7 to <2 x i64>*
  store <2 x i64> <i64 0, i64 2>, <2 x i64>* %2, align 8, !tbaa !4
  %arrayidx9 = getelementptr inbounds i64, i64* %call3, i64 6
  %3 = bitcast i64* %arrayidx9 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 0>, <2 x i64>* %3, align 8, !tbaa !4
  %arrayidx11 = getelementptr inbounds i64, i64* %call3, i64 8
  store i64 1, i64* %arrayidx11, align 8, !tbaa !4
  %call15 = tail call i64* @create1DArray_int64_t(i64 0, i64 9) #8
  %4 = bitcast i64* %call15 to <2 x i64>*
  store <2 x i64> <i64 1, i64 2>, <2 x i64>* %4, align 8, !tbaa !4
  %arrayidx18 = getelementptr inbounds i64, i64* %call15, i64 2
  store i64 1, i64* %arrayidx18, align 8, !tbaa !4
  %arrayidx19 = getelementptr inbounds i64, i64* %call15, i64 3
  %arrayidx22 = getelementptr inbounds i64, i64* %call15, i64 6
  %5 = bitcast i64* %arrayidx19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 24, i32 8, i1 false)
  %6 = bitcast i64* %arrayidx22 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 -2>, <2 x i64>* %6, align 8, !tbaa !4
  %arrayidx24 = getelementptr inbounds i64, i64* %call15, i64 8
  store i64 -1, i64* %arrayidx24, align 8, !tbaa !4
  %cmp145 = icmp sgt i64 %width, 0
  %cmp27143 = icmp sgt i64 %height, 0
  %or.cond = and i1 %cmp145, %cmp27143
  br i1 %or.cond, label %while.cond25.preheader.us.preheader, label %blklab8

while.cond25.preheader.us.preheader:              ; preds = %entry
  br label %while.cond25.preheader.us

while.cond25.preheader.us:                        ; preds = %while.cond25.preheader.us.preheader, %blklab10.loopexit.us
  %x.0146.us = phi i64 [ %add41.us, %blklab10.loopexit.us ], [ 0, %while.cond25.preheader.us.preheader ]
  br label %if.end29.us

if.end29.us:                                      ; preds = %while.cond25.preheader.us, %blklab12.us
  %y.0144.us = phi i64 [ %add40.us, %blklab12.us ], [ 0, %while.cond25.preheader.us ]
  %call31.us = tail call i64 @_convolution_(i8* %pixels, i64 undef, i64 %width, i64 %height, i64 %x.0146.us, i64 %y.0144.us, i64* %call3, i64 undef)
  %call32.us = tail call i64 @_convolution_(i8* %pixels, i64 undef, i64 %width, i64 %height, i64 %x.0146.us, i64 %y.0144.us, i64* %call15, i64 undef)
  %ispos.us = icmp sgt i64 %call31.us, -1
  %neg.us = sub i64 0, %call31.us
  %7 = select i1 %ispos.us, i64 %call31.us, i64 %neg.us
  %ispos141.us = icmp sgt i64 %call32.us, -1
  %neg142.us = sub i64 0, %call32.us
  %8 = select i1 %ispos141.us, i64 %call32.us, i64 %neg142.us
  %add35.us = add nsw i64 %8, %7
  %cmp36.us = icmp sgt i64 %add35.us, 64
  br i1 %cmp36.us, label %blklab12.us, label %if.end38.us

if.end38.us:                                      ; preds = %if.end29.us
  %mul30.us = mul nsw i64 %y.0144.us, %width
  %add.us = add nsw i64 %mul30.us, %x.0146.us
  %arrayidx39.us = getelementptr inbounds i8, i8* %call, i64 %add.us
  store i8 98, i8* %arrayidx39.us, align 1, !tbaa !1
  br label %blklab12.us

blklab12.us:                                      ; preds = %if.end38.us, %if.end29.us
  %add40.us = add nuw nsw i64 %y.0144.us, 1
  %exitcond.us = icmp eq i64 %add40.us, %height
  br i1 %exitcond.us, label %blklab10.loopexit.us, label %if.end29.us

blklab10.loopexit.us:                             ; preds = %blklab12.us
  %add41.us = add nuw nsw i64 %x.0146.us, 1
  %exitcond148.us = icmp eq i64 %add41.us, %width
  br i1 %exitcond148.us, label %blklab8.loopexit, label %while.cond25.preheader.us

blklab8.loopexit:                                 ; preds = %blklab10.loopexit.us
  br label %blklab8

blklab8:                                          ; preds = %blklab8.loopexit, %entry
  store i64 %mul, i64* %_size_call_by_ref, align 8, !tbaa !4
  ret i8* %call
}

declare i8* @create1DArray_BYTE(i8 zeroext, i64) local_unnamed_addr #4

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #4

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
  %cmp = icmp eq i64* %call4, null
  br i1 %cmp, label %blklab19, label %if.end

if.end:                                           ; preds = %entry
  %9 = load i64, i64* %call4, align 8, !tbaa !4
  %call5 = call i8* @readAll(%struct._IO_FILE* %call1, i64* nonnull %_16_size) #8
  %call6 = call i8* @_sobelEdgeDetection_(i8* %call5, i64 undef, i64 %9, i64 %9, i64* nonnull %_18_size)
  call void @_print_pbm_(%struct._IO_FILE* undef, i64 %9, i64 %9, i8* %call6, i64 undef)
  br label %blklab19

blklab19:                                         ; preds = %entry, %if.end
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

!0 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !2, i64 0}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !2, i64 0}
