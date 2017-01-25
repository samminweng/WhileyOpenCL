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
define i8* @_sobelEdgeDetection_(i8* %pixels, i64 %pixels_size, i1 zeroext %pixels_dealloc, i64 %width, i64 %height, i64* nocapture %_size_call_by_ref) local_unnamed_addr #2 {
entry:
  %mul = mul nsw i64 %height, %width
  %call = tail call i8* @create1DArray_BYTE(i8 zeroext 32, i64 %mul) #7
  %not.cmp = icmp eq i8* %call, null
  %call6 = tail call i8* @copy1DArray_BYTE(i8* %call, i64 %mul) #7
  %call16 = tail call i64* @create1DArray_int64_t(i64 0, i64 9) #7
  %0 = bitcast i64* %call16 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 0>, <2 x i64>* %0, align 8, !tbaa !4
  %arrayidx18 = getelementptr inbounds i64, i64* %call16, i64 2
  %1 = bitcast i64* %arrayidx18 to <2 x i64>*
  store <2 x i64> <i64 1, i64 -2>, <2 x i64>* %1, align 8, !tbaa !4
  %arrayidx20 = getelementptr inbounds i64, i64* %call16, i64 4
  %2 = bitcast i64* %arrayidx20 to <2 x i64>*
  store <2 x i64> <i64 0, i64 2>, <2 x i64>* %2, align 8, !tbaa !4
  %arrayidx22 = getelementptr inbounds i64, i64* %call16, i64 6
  %3 = bitcast i64* %arrayidx22 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 0>, <2 x i64>* %3, align 8, !tbaa !4
  %arrayidx24 = getelementptr inbounds i64, i64* %call16, i64 8
  store i64 1, i64* %arrayidx24, align 8, !tbaa !4
  %not.cmp25 = icmp eq i64* %call16, null
  %call32 = tail call i64* @copy1DArray_int64_t(i64* %call16, i64 9) #7
  %not.cmp33 = icmp eq i64* %call32, null
  %call43 = tail call i64* @create1DArray_int64_t(i64 0, i64 9) #7
  %4 = bitcast i64* %call43 to <2 x i64>*
  store <2 x i64> <i64 1, i64 2>, <2 x i64>* %4, align 8, !tbaa !4
  %arrayidx46 = getelementptr inbounds i64, i64* %call43, i64 2
  store i64 1, i64* %arrayidx46, align 8, !tbaa !4
  %arrayidx47 = getelementptr inbounds i64, i64* %call43, i64 3
  %arrayidx50 = getelementptr inbounds i64, i64* %call43, i64 6
  %5 = bitcast i64* %arrayidx47 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 24, i32 8, i1 false)
  %6 = bitcast i64* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 -1, i64 -2>, <2 x i64>* %6, align 8, !tbaa !4
  %arrayidx52 = getelementptr inbounds i64, i64* %call43, i64 8
  store i64 -1, i64* %arrayidx52, align 8, !tbaa !4
  %not.cmp53 = icmp eq i64* %call43, null
  %call60 = tail call i64* @copy1DArray_int64_t(i64* %call43, i64 9) #7
  %not.cmp61 = icmp eq i64* %call60, null
  %cmp65249 = icmp sgt i64 %width, 0
  %cmp70247 = icmp sgt i64 %height, 0
  %or.cond = and i1 %cmp65249, %cmp70247
  br i1 %or.cond, label %while.cond68.preheader.us.preheader, label %blklab8

while.cond68.preheader.us.preheader:              ; preds = %entry
  br label %while.cond68.preheader.us

while.cond68.preheader.us:                        ; preds = %while.cond68.preheader.us.preheader, %blklab10.loopexit.us
  %x.0250.us = phi i64 [ %add89.us, %blklab10.loopexit.us ], [ 0, %while.cond68.preheader.us.preheader ]
  br label %if.end72.us

if.end72.us:                                      ; preds = %while.cond68.preheader.us, %blklab12.us
  %y.0248.us = phi i64 [ %add88.us, %blklab12.us ], [ 0, %while.cond68.preheader.us ]
  %call74.us = tail call i8* @copy1DArray_BYTE(i8* %pixels, i64 %pixels_size) #7
  %call75.us = tail call i64* @copy1DArray_int64_t(i64* %call32, i64 9) #7
  %call76.us = tail call i64 @_convolution_(i8* %call74.us, i64 undef, i1 zeroext true, i64 %width, i64 %height, i64 %x.0250.us, i64 %y.0248.us, i64* %call75.us, i64 undef, i1 zeroext true)
  %call78.us = tail call i8* @copy1DArray_BYTE(i8* %pixels, i64 %pixels_size) #7
  %call79.us = tail call i64* @copy1DArray_int64_t(i64* %call60, i64 9) #7
  %call80.us = tail call i64 @_convolution_(i8* %call78.us, i64 undef, i1 zeroext true, i64 %width, i64 %height, i64 %x.0250.us, i64 %y.0248.us, i64* %call79.us, i64 undef, i1 zeroext true)
  %ispos.us = icmp sgt i64 %call76.us, -1
  %neg.us = sub i64 0, %call76.us
  %7 = select i1 %ispos.us, i64 %call76.us, i64 %neg.us
  %ispos244.us = icmp sgt i64 %call80.us, -1
  %neg245.us = sub i64 0, %call80.us
  %8 = select i1 %ispos244.us, i64 %call80.us, i64 %neg245.us
  %add83.us = add nsw i64 %8, %7
  %cmp84.us = icmp sgt i64 %add83.us, 64
  br i1 %cmp84.us, label %blklab12.us, label %if.end86.us

if.end86.us:                                      ; preds = %if.end72.us
  %mul73.us = mul nsw i64 %y.0248.us, %width
  %add.us = add nsw i64 %mul73.us, %x.0250.us
  %arrayidx87.us = getelementptr inbounds i8, i8* %call6, i64 %add.us
  store i8 98, i8* %arrayidx87.us, align 1, !tbaa !1
  br label %blklab12.us

blklab12.us:                                      ; preds = %if.end86.us, %if.end72.us
  %add88.us = add nuw nsw i64 %y.0248.us, 1
  %exitcond.us = icmp eq i64 %add88.us, %height
  br i1 %exitcond.us, label %blklab10.loopexit.us, label %if.end72.us

blklab10.loopexit.us:                             ; preds = %blklab12.us
  %add89.us = add nuw nsw i64 %x.0250.us, 1
  %exitcond252.us = icmp eq i64 %add89.us, %width
  br i1 %exitcond252.us, label %blklab8.loopexit, label %while.cond68.preheader.us

blklab8.loopexit:                                 ; preds = %blklab10.loopexit.us
  br label %blklab8

blklab8:                                          ; preds = %blklab8.loopexit, %entry
  br i1 %pixels_dealloc, label %if.then91, label %if.end95

if.then91:                                        ; preds = %blklab8
  tail call void @free(i8* %pixels) #7
  br label %if.end95

if.end95:                                         ; preds = %blklab8, %if.then91
  br i1 %not.cmp33, label %if.end98, label %if.then97

if.then97:                                        ; preds = %if.end95
  %9 = bitcast i64* %call32 to i8*
  tail call void @free(i8* %9) #7
  br label %if.end98

if.end98:                                         ; preds = %if.end95, %if.then97
  br i1 %not.cmp61, label %if.end101, label %if.then100

if.then100:                                       ; preds = %if.end98
  %10 = bitcast i64* %call60 to i8*
  tail call void @free(i8* %10) #7
  br label %if.end101

if.end101:                                        ; preds = %if.end98, %if.then100
  br i1 %not.cmp, label %if.end104, label %if.then103

if.then103:                                       ; preds = %if.end101
  tail call void @free(i8* nonnull %call) #7
  br label %if.end104

if.end104:                                        ; preds = %if.end101, %if.then103
  br i1 %not.cmp25, label %if.end107, label %if.then106

if.then106:                                       ; preds = %if.end104
  %11 = bitcast i64* %call16 to i8*
  tail call void @free(i8* %11) #7
  br label %if.end107

if.end107:                                        ; preds = %if.end104, %if.then106
  br i1 %not.cmp53, label %if.end110, label %if.then109

if.then109:                                       ; preds = %if.end107
  %12 = bitcast i64* %call43 to i8*
  tail call void @free(i8* %12) #7
  br label %if.end110

if.end110:                                        ; preds = %if.end107, %if.then109
  store i64 %mul, i64* %_size_call_by_ref, align 8, !tbaa !4
  ret i8* %call6
}

declare i8* @create1DArray_BYTE(i8 zeroext, i64) local_unnamed_addr #4

declare i8* @copy1DArray_BYTE(i8*, i64) local_unnamed_addr #4

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #4

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #4

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
  %9 = load i64, i64* %call13, align 8, !tbaa !4
  %call29 = call i8* @readAll(%struct._IO_FILE* %call3, i64* nonnull %_16_size) #7
  %not.cmp30 = icmp eq i8* %call29, null
  %10 = load i64, i64* %_16_size, align 8, !tbaa !4
  %call37 = call i8* @copy1DArray_BYTE(i8* %call29, i64 %10) #7
  %not.cmp38 = icmp eq i8* %call37, null
  %call46 = call i8* @copy1DArray_BYTE(i8* %call37, i64 %10) #7
  %call47 = call i8* @_sobelEdgeDetection_(i8* %call46, i64 %10, i1 zeroext true, i64 %9, i64 %9, i64* nonnull %_18_size)
  %not.cmp48 = icmp eq i8* %call47, null
  %11 = load i64, i64* %_18_size, align 8, !tbaa !4
  %call55 = call i8* @copy1DArray_BYTE(i8* %call47, i64 %11) #7
  %not.cmp56 = icmp eq i8* %call55, null
  %call61 = call i8* @copy1DArray_BYTE(i8* %call55, i64 %11) #7
  call void @_print_pbm_(%struct._IO_FILE* undef, i64 %9, i64 %9, i8* %call61, i64 undef, i1 zeroext true)
  %cmp62 = icmp eq %struct._IO_FILE* %call3, null
  br i1 %cmp62, label %if.end68, label %if.then63

if.then63:                                        ; preds = %entry
  %call64 = call i32 @fclose(%struct._IO_FILE* nonnull %call3)
  br label %if.end68

if.end68:                                         ; preds = %entry, %if.then63
  br i1 %not.cmp38, label %if.end71, label %if.then70

if.then70:                                        ; preds = %if.end68
  call void @free(i8* nonnull %call37) #7
  br label %if.end71

if.end71:                                         ; preds = %if.end68, %if.then70
  br i1 %not.cmp56, label %if.end74, label %if.then73

if.then73:                                        ; preds = %if.end71
  call void @free(i8* nonnull %call55) #7
  br label %if.end74

if.end74:                                         ; preds = %if.end71, %if.then73
  br i1 %not.cmp, label %if.end80, label %if.then76

if.then76:                                        ; preds = %if.end74
  %12 = load i64, i64* %_9_size, align 8, !tbaa !4
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %12) #7
  br label %if.end80

if.end80:                                         ; preds = %if.end74, %if.then76
  br i1 %not.cmp14, label %if.end83, label %if.then82

if.then82:                                        ; preds = %if.end80
  %13 = bitcast i64* %call13 to i8*
  call void @free(i8* %13) #7
  br label %if.end83

if.end83:                                         ; preds = %if.end80, %if.then82
  br i1 %not.cmp8, label %if.end89, label %if.then85

if.then85:                                        ; preds = %if.end83
  %14 = load i64, i64* %_13_size, align 8, !tbaa !4
  call void @free2DArray_int64_t(i64** nonnull %call7, i64 %14) #7
  br label %if.end89

if.end89:                                         ; preds = %if.end83, %if.then85
  br i1 %not.cmp30, label %if.end92, label %if.then91

if.then91:                                        ; preds = %if.end89
  call void @free(i8* nonnull %call29) #7
  br label %if.end92

if.end92:                                         ; preds = %if.end89, %if.then91
  br i1 %not.cmp48, label %if.end95, label %if.then94

if.then94:                                        ; preds = %if.end92
  call void @free(i8* nonnull %call47) #7
  br label %if.end95

if.end95:                                         ; preds = %if.end92, %if.then94
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

!0 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !2, i64 0}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !2, i64 0}
