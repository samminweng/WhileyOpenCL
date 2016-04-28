; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: norecurse nounwind readnone uwtable
define i64 @max(i64 %a, i64 %b) #0 {
entry:
  %cmp = icmp slt i64 %a, %b
  %b.a = select i1 %cmp, i64 %b, i64 %a
  ret i64 %b.a
}

; Function Attrs: norecurse nounwind readnone uwtable
define i64 @min(i64 %a, i64 %b) #0 {
entry:
  %cmp = icmp slt i64 %a, %b
  %a.b = select i1 %cmp, i64 %a, i64 %b
  ret i64 %a.b
}

; Function Attrs: norecurse nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_has_ownership, i64 %n) #1 {
entry:
  %cmp128 = icmp sgt i64 %n, 0
  br i1 %cmp128, label %while.cond1.preheader.lr.ph, label %if.end42

while.cond1.preheader.lr.ph:                      ; preds = %entry
  %0 = shl i64 %n, 3
  %1 = add i64 %0, 8
  %2 = shl nsw i64 %n, 1
  br label %while.cond1.preheader

while.cond1.preheader:                            ; preds = %blklab6, %while.cond1.preheader.lr.ph
  %indvars.iv = phi i64 [ %n, %while.cond1.preheader.lr.ph ], [ %indvars.iv.next, %blklab6 ]
  %s.0129 = phi i64 [ 0, %while.cond1.preheader.lr.ph ], [ %add40, %blklab6 ]
  %3 = add nsw i64 %s.0129, %2
  %4 = icmp slt i64 %3, 1152921504606846976
  %5 = shl nsw i64 %s.0129, 3
  %6 = icmp sgt i64 %s.0129, 1152921504606846975
  br i1 %4, label %if.end5.us.preheader, label %if.end5.preheader

if.end5.preheader:                                ; preds = %while.cond1.preheader
  br label %if.end5

if.end5.us.preheader:                             ; preds = %while.cond1.preheader
  br label %if.end5.us

if.end5.us:                                       ; preds = %if.end5.us.preheader, %blklab10.us
  %i.0127.us = phi i64 [ %add.us, %blklab10.us ], [ 0, %if.end5.us.preheader ]
  %j.0126.us = phi i64 [ %add38.us, %blklab10.us ], [ %s.0129, %if.end5.us.preheader ]
  %7 = mul i64 %i.0127.us, %1
  %add.us = add nuw nsw i64 %i.0127.us, 1
  %cmp6.us = icmp sge i64 %add.us, %n
  %cmp9.us = icmp slt i64 %j.0126.us, 1
  %or.cond.us = or i1 %cmp9.us, %cmp6.us
  br i1 %or.cond.us, label %polly.preload.cond.us, label %if.end11.us

if.end11.us:                                      ; preds = %if.end5.us
  %mul.us = mul nsw i64 %add.us, %n
  %add13.us = add nsw i64 %j.0126.us, -1
  %sub14.us = add i64 %add13.us, %mul.us
  %arrayidx.us = getelementptr inbounds i64, i64* %moves, i64 %sub14.us
  %8 = load i64, i64* %arrayidx.us, align 8, !tbaa !1
  br label %polly.preload.cond.us

polly.preload.cond.us:                            ; preds = %if.end11.us, %if.end5.us
  %y.0.ph.us = phi i64 [ %8, %if.end11.us ], [ 0, %if.end5.us ]
  %9 = add nuw nsw i64 %i.0127.us, 3
  %10 = icmp sle i64 %9, %n
  %11 = add nuw nsw i64 %i.0127.us, %s.0129
  %12 = icmp sgt i64 %11, 1
  %13 = add nsw i64 %7, %5
  %14 = icmp sgt i64 %13, -9223372036854775793
  %15 = icmp slt i64 %13, -9223372036854775792
  %16 = icmp sgt i64 %i.0127.us, 9223372036854775805
  %17 = or i1 %16, %14
  %18 = or i1 %6, %17
  %19 = or i1 %10, %18
  %20 = and i1 %12, %15
  %21 = or i1 %20, %19
  br i1 %21, label %blklab8.us, label %blklab10.us

blklab8.us:                                       ; preds = %polly.preload.cond.us
  %add15.us = add nuw nsw i64 %i.0127.us, 2
  %cmp16.us = icmp slt i64 %add15.us, %n
  br i1 %cmp16.us, label %if.end18.us, label %blklab9.us

if.end18.us:                                      ; preds = %blklab8.us
  %mul20.us = mul nsw i64 %add15.us, %n
  %add21.us = add nsw i64 %mul20.us, %j.0126.us
  %arrayidx22.us = getelementptr inbounds i64, i64* %moves, i64 %add21.us
  %22 = load i64, i64* %arrayidx22.us, align 8, !tbaa !1
  br label %blklab9.us

blklab9.us:                                       ; preds = %if.end18.us, %blklab8.us
  %x.0.us = phi i64 [ 0, %blklab8.us ], [ %22, %if.end18.us ]
  %cmp24.us = icmp slt i64 %j.0126.us, 2
  br i1 %cmp24.us, label %blklab10.us, label %if.end26.us

if.end26.us:                                      ; preds = %blklab9.us
  %mul27.us = mul nsw i64 %i.0127.us, %n
  %add28.us = add nsw i64 %j.0126.us, -2
  %sub29.us = add i64 %add28.us, %mul27.us
  %arrayidx30.us = getelementptr inbounds i64, i64* %moves, i64 %sub29.us
  %23 = load i64, i64* %arrayidx30.us, align 8, !tbaa !1
  br label %blklab10.us

blklab10.us:                                      ; preds = %polly.preload.cond.us, %if.end26.us, %blklab9.us
  %z.0.ph.merge.us = phi i64 [ %23, %if.end26.us ], [ 0, %blklab9.us ], [ 0, %polly.preload.cond.us ]
  %x.0.merge.us = phi i64 [ %x.0.us, %if.end26.us ], [ %x.0.us, %blklab9.us ], [ 0, %polly.preload.cond.us ]
  %cmp.i.us = icmp slt i64 %x.0.merge.us, %y.0.ph.us
  %a.b.i.us = select i1 %cmp.i.us, i64 %x.0.merge.us, i64 %y.0.ph.us
  %add31.us = add nsw i64 %a.b.i.us, %i.0127.us
  %cmp.i143.us = icmp slt i64 %y.0.ph.us, %z.0.ph.merge.us
  %a.b.i144.us = select i1 %cmp.i143.us, i64 %y.0.ph.us, i64 %z.0.ph.merge.us
  %add33.us = add nsw i64 %a.b.i144.us, %j.0126.us
  %cmp.i142.us = icmp slt i64 %add31.us, %add33.us
  %b.a.i.us = select i1 %cmp.i142.us, i64 %add33.us, i64 %add31.us
  %mul35.us = mul nsw i64 %i.0127.us, %n
  %add36.us = add nsw i64 %mul35.us, %j.0126.us
  %arrayidx37.us = getelementptr inbounds i64, i64* %moves, i64 %add36.us
  store i64 %b.a.i.us, i64* %arrayidx37.us, align 8, !tbaa !1
  %add38.us = add nuw nsw i64 %j.0126.us, 1
  %exitcond.us = icmp eq i64 %add.us, %indvars.iv
  br i1 %exitcond.us, label %blklab6.loopexit, label %if.end5.us

if.end5:                                          ; preds = %if.end5.preheader, %blklab10
  %i.0127 = phi i64 [ %add, %blklab10 ], [ 0, %if.end5.preheader ]
  %j.0126 = phi i64 [ %add38, %blklab10 ], [ %s.0129, %if.end5.preheader ]
  %24 = mul i64 %i.0127, %1
  %add = add nuw nsw i64 %i.0127, 1
  %cmp6 = icmp sge i64 %add, %n
  %cmp9 = icmp slt i64 %j.0126, 1
  %or.cond = or i1 %cmp9, %cmp6
  br i1 %or.cond, label %polly.preload.cond, label %if.end11

if.end11:                                         ; preds = %if.end5
  %mul = mul nsw i64 %add, %n
  %add13 = add nsw i64 %j.0126, -1
  %sub14 = add i64 %add13, %mul
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %sub14
  %25 = load i64, i64* %arrayidx, align 8, !tbaa !1
  br label %polly.preload.cond

polly.preload.cond:                               ; preds = %if.end5, %if.end11
  %y.0.ph = phi i64 [ %25, %if.end11 ], [ 0, %if.end5 ]
  %26 = add nuw nsw i64 %i.0127, 3
  %27 = icmp sle i64 %26, %n
  %28 = add nuw nsw i64 %i.0127, %s.0129
  %29 = icmp sgt i64 %28, 1
  %30 = add nsw i64 %24, %5
  %31 = icmp sgt i64 %30, -9223372036854775793
  %32 = icmp slt i64 %30, -9223372036854775792
  %33 = icmp sgt i64 %i.0127, 9223372036854775805
  %34 = or i1 %33, %31
  %35 = or i1 %6, %34
  %36 = or i1 %27, %35
  %37 = and i1 %29, %32
  %38 = or i1 %37, %36
  br i1 %38, label %blklab8, label %blklab10

blklab8:                                          ; preds = %polly.preload.cond
  %add15 = add nuw nsw i64 %i.0127, 2
  %cmp16 = icmp slt i64 %add15, %n
  br i1 %cmp16, label %if.end18, label %blklab9

if.end18:                                         ; preds = %blklab8
  %mul20 = mul nsw i64 %add15, %n
  %add21 = add nsw i64 %mul20, %j.0126
  %arrayidx22 = getelementptr inbounds i64, i64* %moves, i64 %add21
  %39 = load i64, i64* %arrayidx22, align 8, !tbaa !1
  br label %blklab9

blklab9:                                          ; preds = %blklab8, %if.end18
  %x.0 = phi i64 [ 0, %blklab8 ], [ %39, %if.end18 ]
  %cmp24 = icmp slt i64 %j.0126, 2
  br i1 %cmp24, label %blklab10, label %if.end26

if.end26:                                         ; preds = %blklab9
  %mul27 = mul nsw i64 %i.0127, %n
  %add28 = add nsw i64 %j.0126, -2
  %sub29 = add i64 %add28, %mul27
  %arrayidx30 = getelementptr inbounds i64, i64* %moves, i64 %sub29
  %40 = load i64, i64* %arrayidx30, align 8, !tbaa !1
  br label %blklab10

blklab10:                                         ; preds = %polly.preload.cond, %if.end26, %blklab9
  %z.0.ph.merge = phi i64 [ %40, %if.end26 ], [ 0, %blklab9 ], [ 0, %polly.preload.cond ]
  %x.0.merge = phi i64 [ %x.0, %if.end26 ], [ %x.0, %blklab9 ], [ 0, %polly.preload.cond ]
  %cmp.i = icmp slt i64 %x.0.merge, %y.0.ph
  %a.b.i = select i1 %cmp.i, i64 %x.0.merge, i64 %y.0.ph
  %add31 = add nsw i64 %a.b.i, %i.0127
  %cmp.i143 = icmp slt i64 %y.0.ph, %z.0.ph.merge
  %a.b.i144 = select i1 %cmp.i143, i64 %y.0.ph, i64 %z.0.ph.merge
  %add33 = add nsw i64 %a.b.i144, %j.0126
  %cmp.i142 = icmp slt i64 %add31, %add33
  %b.a.i = select i1 %cmp.i142, i64 %add33, i64 %add31
  %mul35 = mul nsw i64 %i.0127, %n
  %add36 = add nsw i64 %mul35, %j.0126
  %arrayidx37 = getelementptr inbounds i64, i64* %moves, i64 %add36
  store i64 %b.a.i, i64* %arrayidx37, align 8, !tbaa !1
  %add38 = add nuw nsw i64 %j.0126, 1
  %exitcond = icmp eq i64 %add, %indvars.iv
  br i1 %exitcond, label %blklab6.loopexit148, label %if.end5

blklab6.loopexit:                                 ; preds = %blklab10.us
  br label %blklab6

blklab6.loopexit148:                              ; preds = %blklab10
  br label %blklab6

blklab6:                                          ; preds = %blklab6.loopexit148, %blklab6.loopexit
  %add40 = add nuw nsw i64 %s.0129, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %exitcond130 = icmp eq i64 %add40, %n
  br i1 %exitcond130, label %if.end42.loopexit, label %while.cond1.preheader

if.end42.loopexit:                                ; preds = %blklab6
  br label %if.end42

if.end42:                                         ; preds = %if.end42.loopexit, %entry
  ret i64* %moves
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #3 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !5
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end122.critedge, label %if.then103

if.then103:                                       ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %mul = mul nsw i64 %1, %1
  %conv6 = trunc i64 %mul to i32
  %call7 = tail call i64* @gen1DArray(i32 0, i32 %conv6) #6
  %call14 = tail call i64* @findMoves(i64* %call7, i64 undef, i1 zeroext undef, i64 %1)
  %sub18 = add nsw i64 %1, -1
  %arrayidx19 = getelementptr inbounds i64, i64* %call14, i64 %sub18
  %2 = load i64, i64* %arrayidx19, align 8, !tbaa !1
  %call23 = tail call noalias i8* @malloc(i64 400) #6
  %3 = bitcast i8* %call23 to i64*
  %4 = bitcast i8* %call23 to <2 x i64>*
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %4, align 8, !tbaa !1
  %arrayidx26 = getelementptr inbounds i8, i8* %call23, i64 16
  %5 = bitcast i8* %arrayidx26 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %5, align 8, !tbaa !1
  %arrayidx28 = getelementptr inbounds i8, i8* %call23, i64 32
  %6 = bitcast i8* %arrayidx28 to <2 x i64>*
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %6, align 8, !tbaa !1
  %arrayidx30 = getelementptr inbounds i8, i8* %call23, i64 48
  %7 = bitcast i8* %arrayidx30 to <2 x i64>*
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx32 = getelementptr inbounds i8, i8* %call23, i64 64
  %8 = bitcast i8* %arrayidx32 to <2 x i64>*
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx34 = getelementptr inbounds i8, i8* %call23, i64 80
  %9 = bitcast i8* %arrayidx34 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx36 = getelementptr inbounds i8, i8* %call23, i64 96
  %10 = bitcast i8* %arrayidx36 to <2 x i64>*
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx38 = getelementptr inbounds i8, i8* %call23, i64 112
  %11 = bitcast i8* %arrayidx38 to <2 x i64>*
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx40 = getelementptr inbounds i8, i8* %call23, i64 128
  %12 = bitcast i8* %arrayidx40 to <2 x i64>*
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx42 = getelementptr inbounds i8, i8* %call23, i64 144
  %13 = bitcast i8* %arrayidx42 to <2 x i64>*
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx44 = getelementptr inbounds i8, i8* %call23, i64 160
  %14 = bitcast i8* %arrayidx44 to <2 x i64>*
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx46 = getelementptr inbounds i8, i8* %call23, i64 176
  %15 = bitcast i8* %arrayidx46 to <2 x i64>*
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx48 = getelementptr inbounds i8, i8* %call23, i64 192
  %16 = bitcast i8* %arrayidx48 to <2 x i64>*
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx50 = getelementptr inbounds i8, i8* %call23, i64 208
  %17 = bitcast i8* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx52 = getelementptr inbounds i8, i8* %call23, i64 224
  %18 = bitcast i8* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx54 = getelementptr inbounds i8, i8* %call23, i64 240
  %19 = bitcast i8* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %19, align 8, !tbaa !1
  %arrayidx56 = getelementptr inbounds i8, i8* %call23, i64 256
  %20 = bitcast i8* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %20, align 8, !tbaa !1
  %arrayidx58 = getelementptr inbounds i8, i8* %call23, i64 272
  %21 = bitcast i8* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %21, align 8, !tbaa !1
  %arrayidx60 = getelementptr inbounds i8, i8* %call23, i64 288
  %22 = bitcast i8* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %22, align 8, !tbaa !1
  %arrayidx62 = getelementptr inbounds i8, i8* %call23, i64 304
  %23 = bitcast i8* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %23, align 8, !tbaa !1
  %arrayidx64 = getelementptr inbounds i8, i8* %call23, i64 320
  %24 = bitcast i8* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %24, align 8, !tbaa !1
  %arrayidx66 = getelementptr inbounds i8, i8* %call23, i64 336
  %25 = bitcast i8* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %25, align 8, !tbaa !1
  %arrayidx68 = getelementptr inbounds i8, i8* %call23, i64 352
  %26 = bitcast i8* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %26, align 8, !tbaa !1
  %arrayidx70 = getelementptr inbounds i8, i8* %call23, i64 368
  %27 = bitcast i8* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %27, align 8, !tbaa !1
  %arrayidx72 = getelementptr inbounds i8, i8* %call23, i64 384
  %28 = bitcast i8* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %28, align 8, !tbaa !1
  tail call void @printf_s(i64* %3, i64 50) #6
  %call74 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2)
  %call78 = tail call noalias i8* @malloc(i64 184) #6
  %29 = bitcast i8* %call78 to i64*
  %30 = bitcast i8* %call78 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %30, align 8, !tbaa !1
  %arrayidx81 = getelementptr inbounds i8, i8* %call78, i64 16
  %31 = bitcast i8* %arrayidx81 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx83 = getelementptr inbounds i8, i8* %call78, i64 32
  %32 = bitcast i8* %arrayidx83 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx85 = getelementptr inbounds i8, i8* %call78, i64 48
  %33 = bitcast i8* %arrayidx85 to <2 x i64>*
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx87 = getelementptr inbounds i8, i8* %call78, i64 64
  %34 = bitcast i8* %arrayidx87 to <2 x i64>*
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx89 = getelementptr inbounds i8, i8* %call78, i64 80
  %35 = bitcast i8* %arrayidx89 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx91 = getelementptr inbounds i8, i8* %call78, i64 96
  %36 = bitcast i8* %arrayidx91 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx93 = getelementptr inbounds i8, i8* %call78, i64 112
  %37 = bitcast i8* %arrayidx93 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx95 = getelementptr inbounds i8, i8* %call78, i64 128
  %38 = bitcast i8* %arrayidx95 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx97 = getelementptr inbounds i8, i8* %call78, i64 144
  %39 = bitcast i8* %arrayidx97 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx99 = getelementptr inbounds i8, i8* %call78, i64 160
  %40 = bitcast i8* %arrayidx99 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %40, align 8, !tbaa !1
  %arrayidx101 = getelementptr inbounds i8, i8* %call78, i64 176
  %41 = bitcast i8* %arrayidx101 to i64*
  store i64 101, i64* %41, align 8, !tbaa !1
  tail call void @println_s(i64* %29, i64 23) #6
  %phitmp = bitcast i64* %call14 to i8*
  tail call void @free(i8* %phitmp) #6
  tail call void @free2DArray(i64** %call, i64 %conv) #6
  tail call void @free(i8* %call23) #6
  tail call void @free(i8* %call78) #6
  br label %if.end122

if.end122.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #6
  br label %if.end122

if.end122:                                        ; preds = %if.end122.critedge, %if.then103
  tail call void @exit(i32 0) #7
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #4

declare i64* @parseStringToInt(i64*) #4

declare i64* @gen1DArray(i32, i32) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @printf_s(i64*, i64) #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

declare void @println_s(i64*, i64) #4

declare void @free2DArray(i64**, i64) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

attributes #0 = { norecurse nounwind readnone uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
