; ModuleID = 'MergeSort_original.c'
source_filename = "MergeSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_sortV1_(i64* returned %items, i64 %items_size, i1 zeroext %items_dealloc, i64 %start, i64 %end, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %_16_size = alloca i64, align 8
  %_19_size = alloca i64, align 8
  %0 = bitcast i64* %_16_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #6
  store i64 0, i64* %_16_size, align 8, !tbaa !1
  %1 = bitcast i64* %_19_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #6
  store i64 0, i64* %_19_size, align 8, !tbaa !1
  %add = add nsw i64 %start, 1
  %cmp = icmp slt i64 %add, %end
  br i1 %cmp, label %if.end, label %if.end132

if.end:                                           ; preds = %entry
  %add1 = add nsw i64 %end, %start
  %div = sdiv i64 %add1, 2
  %conv = trunc i64 %start to i32
  %conv4 = trunc i64 %div to i32
  %call = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv, i32 %conv4) #6
  %sub = sub i64 %div, %start
  %call17 = call i64* @_sortV1_(i64* %call, i64 %sub, i1 zeroext undef, i64 0, i64 %div, i64* nonnull %_16_size)
  %cmp19 = icmp eq i64* %call17, null
  %conv33 = trunc i64 %end to i32
  %call34 = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv4, i32 %conv33) #6
  %sub35 = sub nsw i64 %end, %div
  %call50 = call i64* @_sortV1_(i64* %call34, i64 %sub35, i1 zeroext undef, i64 0, i64 %sub35, i64* nonnull %_19_size)
  %not.cmp53 = icmp eq i64* %call50, null
  %sub63 = sub nsw i64 %end, %start
  %cmp64277 = icmp sgt i64 %sub63, 0
  %cmp69278 = icmp sgt i64 %sub, 0
  %or.cond279 = and i1 %cmp64277, %cmp69278
  %cmp74280 = icmp sgt i64 %sub35, 0
  %or.cond270281 = and i1 %cmp74280, %or.cond279
  br i1 %or.cond270281, label %if.end77.preheader, label %while.cond90.preheader

if.end77.preheader:                               ; preds = %if.end
  br label %if.end77

while.cond90.preheader.loopexit:                  ; preds = %blklab4
  br label %while.cond90.preheader

while.cond90.preheader:                           ; preds = %while.cond90.preheader.loopexit, %if.end
  %l.0.lcssa = phi i64 [ 0, %if.end ], [ %l.1, %while.cond90.preheader.loopexit ]
  %r.0.lcssa = phi i64 [ 0, %if.end ], [ %r.1, %while.cond90.preheader.loopexit ]
  %i.0.lcssa = phi i64 [ 0, %if.end ], [ %add89, %while.cond90.preheader.loopexit ]
  %cmp93274 = icmp sgt i64 %sub, %l.0.lcssa
  br i1 %cmp93274, label %if.end96.lr.ph, label %while.cond101.preheader

if.end96.lr.ph:                                   ; preds = %while.cond90.preheader
  %2 = sub i64 %sub, %l.0.lcssa
  %3 = add i64 %2, %i.0.lcssa
  %4 = sub i64 %div, %l.0.lcssa
  %5 = sub i64 %4, %start
  %min.iters.check = icmp ult i64 %5, 4
  br i1 %min.iters.check, label %if.end96.preheader, label %min.iters.checked

if.end96.preheader:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end96.lr.ph
  %i.1276.ph = phi i64 [ %i.0.lcssa, %vector.memcheck ], [ %i.0.lcssa, %min.iters.checked ], [ %i.0.lcssa, %if.end96.lr.ph ], [ %ind.end, %middle.block ]
  %l.2275.ph = phi i64 [ %l.0.lcssa, %vector.memcheck ], [ %l.0.lcssa, %min.iters.checked ], [ %l.0.lcssa, %if.end96.lr.ph ], [ %ind.end307, %middle.block ]
  %6 = add i64 %i.0.lcssa, %div
  %7 = sub i64 %6, %i.1276.ph
  %8 = sub i64 %7, %l.0.lcssa
  %9 = sub i64 %8, %start
  %10 = add i64 %6, -1
  %11 = sub i64 %10, %i.1276.ph
  %12 = sub i64 %11, %l.0.lcssa
  %13 = sub i64 %12, %start
  %xtraiter360 = and i64 %9, 3
  %lcmp.mod361 = icmp eq i64 %xtraiter360, 0
  br i1 %lcmp.mod361, label %if.end96.prol.loopexit, label %if.end96.prol.preheader

if.end96.prol.preheader:                          ; preds = %if.end96.preheader
  br label %if.end96.prol

if.end96.prol:                                    ; preds = %if.end96.prol, %if.end96.prol.preheader
  %i.1276.prol = phi i64 [ %add99.prol, %if.end96.prol ], [ %i.1276.ph, %if.end96.prol.preheader ]
  %l.2275.prol = phi i64 [ %add100.prol, %if.end96.prol ], [ %l.2275.ph, %if.end96.prol.preheader ]
  %prol.iter362 = phi i64 [ %prol.iter362.sub, %if.end96.prol ], [ %xtraiter360, %if.end96.prol.preheader ]
  %arrayidx97294.prol = getelementptr inbounds i64, i64* %call, i64 %l.2275.prol
  %14 = load i64, i64* %arrayidx97294.prol, align 8, !tbaa !1
  %arrayidx98.prol = getelementptr inbounds i64, i64* %items, i64 %i.1276.prol
  store i64 %14, i64* %arrayidx98.prol, align 8, !tbaa !1
  %add99.prol = add nsw i64 %i.1276.prol, 1
  %add100.prol = add nsw i64 %l.2275.prol, 1
  %prol.iter362.sub = add i64 %prol.iter362, -1
  %prol.iter362.cmp = icmp eq i64 %prol.iter362.sub, 0
  br i1 %prol.iter362.cmp, label %if.end96.prol.loopexit.unr-lcssa, label %if.end96.prol, !llvm.loop !5

if.end96.prol.loopexit.unr-lcssa:                 ; preds = %if.end96.prol
  br label %if.end96.prol.loopexit

if.end96.prol.loopexit:                           ; preds = %if.end96.preheader, %if.end96.prol.loopexit.unr-lcssa
  %i.1276.unr = phi i64 [ %i.1276.ph, %if.end96.preheader ], [ %add99.prol, %if.end96.prol.loopexit.unr-lcssa ]
  %l.2275.unr = phi i64 [ %l.2275.ph, %if.end96.preheader ], [ %add100.prol, %if.end96.prol.loopexit.unr-lcssa ]
  %15 = icmp ult i64 %13, 3
  br i1 %15, label %while.cond101.preheader.loopexit, label %if.end96.preheader.new

if.end96.preheader.new:                           ; preds = %if.end96.prol.loopexit
  br label %if.end96

min.iters.checked:                                ; preds = %if.end96.lr.ph
  %n.vec = and i64 %5, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end96.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %16 = add i64 %i.0.lcssa, %div
  %17 = add i64 %l.0.lcssa, %start
  %18 = sub i64 %16, %17
  %scevgep300 = getelementptr i64, i64* %items, i64 %18
  %scevgep302 = getelementptr i64, i64* %call, i64 %l.0.lcssa
  %scevgep304 = getelementptr i64, i64* %call, i64 %sub
  %bound0 = icmp ult i64* %scevgep, %scevgep304
  %bound1 = icmp ult i64* %scevgep302, %scevgep300
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add i64 %i.0.lcssa, %n.vec
  %ind.end307 = add i64 %l.0.lcssa, %n.vec
  br i1 %memcheck.conflict, label %if.end96.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %19 = add i64 %n.vec, -4
  %20 = lshr exact i64 %19, 2
  %21 = and i64 %20, 1
  %lcmp.mod364 = icmp eq i64 %21, 0
  br i1 %lcmp.mod364, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %22 = getelementptr inbounds i64, i64* %call, i64 %l.0.lcssa
  %23 = bitcast i64* %22 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %23, align 8, !tbaa !1, !alias.scope !7
  %24 = getelementptr i64, i64* %22, i64 2
  %25 = bitcast i64* %24 to <2 x i64>*
  %wide.load314.prol = load <2 x i64>, <2 x i64>* %25, align 8, !tbaa !1, !alias.scope !7
  %26 = getelementptr inbounds i64, i64* %items, i64 %i.0.lcssa
  %27 = bitcast i64* %26 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %27, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %28 = getelementptr i64, i64* %26, i64 2
  %29 = bitcast i64* %28 to <2 x i64>*
  store <2 x i64> %wide.load314.prol, <2 x i64>* %29, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %30 = icmp eq i64 %20, 0
  br i1 %30, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %31 = add i64 %i.0.lcssa, %index
  %32 = add i64 %l.0.lcssa, %index
  %33 = getelementptr inbounds i64, i64* %call, i64 %32
  %34 = bitcast i64* %33 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %34, align 8, !tbaa !1, !alias.scope !7
  %35 = getelementptr i64, i64* %33, i64 2
  %36 = bitcast i64* %35 to <2 x i64>*
  %wide.load314 = load <2 x i64>, <2 x i64>* %36, align 8, !tbaa !1, !alias.scope !7
  %37 = getelementptr inbounds i64, i64* %items, i64 %31
  %38 = bitcast i64* %37 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %38, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %39 = getelementptr i64, i64* %37, i64 2
  %40 = bitcast i64* %39 to <2 x i64>*
  store <2 x i64> %wide.load314, <2 x i64>* %40, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %41 = add i64 %i.0.lcssa, %index.next
  %42 = add i64 %l.0.lcssa, %index.next
  %43 = getelementptr inbounds i64, i64* %call, i64 %42
  %44 = bitcast i64* %43 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %44, align 8, !tbaa !1, !alias.scope !7
  %45 = getelementptr i64, i64* %43, i64 2
  %46 = bitcast i64* %45 to <2 x i64>*
  %wide.load314.1 = load <2 x i64>, <2 x i64>* %46, align 8, !tbaa !1, !alias.scope !7
  %47 = getelementptr inbounds i64, i64* %items, i64 %41
  %48 = bitcast i64* %47 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %48, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %49 = getelementptr i64, i64* %47, i64 2
  %50 = bitcast i64* %49 to <2 x i64>*
  store <2 x i64> %wide.load314.1, <2 x i64>* %50, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %51 = icmp eq i64 %index.next.1, %n.vec
  br i1 %51, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %5, %n.vec
  br i1 %cmp.n, label %while.cond101.preheader, label %if.end96.preheader

if.end77:                                         ; preds = %if.end77.preheader, %blklab4
  %i.0284 = phi i64 [ %add89, %blklab4 ], [ 0, %if.end77.preheader ]
  %r.0283 = phi i64 [ %r.1, %blklab4 ], [ 0, %if.end77.preheader ]
  %l.0282 = phi i64 [ %l.1, %blklab4 ], [ 0, %if.end77.preheader ]
  %arrayidx295 = getelementptr inbounds i64, i64* %call, i64 %l.0282
  %52 = load i64, i64* %arrayidx295, align 8, !tbaa !1
  %arrayidx78296 = getelementptr inbounds i64, i64* %call34, i64 %r.0283
  %53 = load i64, i64* %arrayidx78296, align 8, !tbaa !1
  %cmp79 = icmp sgt i64 %52, %53
  %arrayidx87 = getelementptr inbounds i64, i64* %items, i64 %i.0284
  br i1 %cmp79, label %blklab3, label %if.end82

if.end82:                                         ; preds = %if.end77
  store i64 %52, i64* %arrayidx87, align 8, !tbaa !1
  %add85 = add nsw i64 %l.0282, 1
  br label %blklab4

blklab3:                                          ; preds = %if.end77
  store i64 %53, i64* %arrayidx87, align 8, !tbaa !1
  %add88 = add nsw i64 %r.0283, 1
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end82
  %l.1 = phi i64 [ %l.0282, %blklab3 ], [ %add85, %if.end82 ]
  %r.1 = phi i64 [ %add88, %blklab3 ], [ %r.0283, %if.end82 ]
  %add89 = add nuw nsw i64 %i.0284, 1
  %cmp64 = icmp slt i64 %add89, %sub63
  %cmp69 = icmp slt i64 %l.1, %sub
  %or.cond = and i1 %cmp64, %cmp69
  %cmp74 = icmp slt i64 %r.1, %sub35
  %or.cond270 = and i1 %cmp74, %or.cond
  br i1 %or.cond270, label %if.end77, label %while.cond90.preheader.loopexit

while.cond101.preheader.loopexit.unr-lcssa:       ; preds = %if.end96
  br label %while.cond101.preheader.loopexit

while.cond101.preheader.loopexit:                 ; preds = %if.end96.prol.loopexit, %while.cond101.preheader.loopexit.unr-lcssa
  br label %while.cond101.preheader

while.cond101.preheader:                          ; preds = %while.cond101.preheader.loopexit, %middle.block, %while.cond90.preheader
  %i.1.lcssa = phi i64 [ %i.0.lcssa, %while.cond90.preheader ], [ %3, %middle.block ], [ %3, %while.cond101.preheader.loopexit ]
  %cmp104271 = icmp slt i64 %r.0.lcssa, %sub35
  br i1 %cmp104271, label %if.end107.preheader, label %if.end114

if.end107.preheader:                              ; preds = %while.cond101.preheader
  %54 = sub i64 %end, %r.0.lcssa
  %55 = sub i64 %54, %div
  %min.iters.check318 = icmp ult i64 %55, 4
  br i1 %min.iters.check318, label %if.end107.preheader357, label %min.iters.checked319

if.end107.preheader357:                           ; preds = %middle.block316, %vector.memcheck336, %min.iters.checked319, %if.end107.preheader
  %i.2273.ph = phi i64 [ %i.1.lcssa, %vector.memcheck336 ], [ %i.1.lcssa, %min.iters.checked319 ], [ %i.1.lcssa, %if.end107.preheader ], [ %ind.end341, %middle.block316 ]
  %r.2272.ph = phi i64 [ %r.0.lcssa, %vector.memcheck336 ], [ %r.0.lcssa, %min.iters.checked319 ], [ %r.0.lcssa, %if.end107.preheader ], [ %ind.end343, %middle.block316 ]
  %56 = sub i64 %end, %r.2272.ph
  %57 = sub i64 %56, %div
  %58 = add i64 %end, -1
  %59 = sub i64 %58, %r.2272.ph
  %60 = sub i64 %59, %div
  %xtraiter = and i64 %57, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %if.end107.prol.loopexit, label %if.end107.prol.preheader

if.end107.prol.preheader:                         ; preds = %if.end107.preheader357
  br label %if.end107.prol

if.end107.prol:                                   ; preds = %if.end107.prol, %if.end107.prol.preheader
  %i.2273.prol = phi i64 [ %add110.prol, %if.end107.prol ], [ %i.2273.ph, %if.end107.prol.preheader ]
  %r.2272.prol = phi i64 [ %add111.prol, %if.end107.prol ], [ %r.2272.ph, %if.end107.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end107.prol ], [ %xtraiter, %if.end107.prol.preheader ]
  %arrayidx108293.prol = getelementptr inbounds i64, i64* %call34, i64 %r.2272.prol
  %61 = load i64, i64* %arrayidx108293.prol, align 8, !tbaa !1
  %arrayidx109.prol = getelementptr inbounds i64, i64* %items, i64 %i.2273.prol
  store i64 %61, i64* %arrayidx109.prol, align 8, !tbaa !1
  %add110.prol = add nsw i64 %i.2273.prol, 1
  %add111.prol = add nsw i64 %r.2272.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %if.end107.prol.loopexit.unr-lcssa, label %if.end107.prol, !llvm.loop !15

if.end107.prol.loopexit.unr-lcssa:                ; preds = %if.end107.prol
  br label %if.end107.prol.loopexit

if.end107.prol.loopexit:                          ; preds = %if.end107.preheader357, %if.end107.prol.loopexit.unr-lcssa
  %i.2273.unr = phi i64 [ %i.2273.ph, %if.end107.preheader357 ], [ %add110.prol, %if.end107.prol.loopexit.unr-lcssa ]
  %r.2272.unr = phi i64 [ %r.2272.ph, %if.end107.preheader357 ], [ %add111.prol, %if.end107.prol.loopexit.unr-lcssa ]
  %62 = icmp ult i64 %60, 3
  br i1 %62, label %if.end114.loopexit, label %if.end107.preheader357.new

if.end107.preheader357.new:                       ; preds = %if.end107.prol.loopexit
  br label %if.end107

min.iters.checked319:                             ; preds = %if.end107.preheader
  %n.vec321 = and i64 %55, -4
  %cmp.zero322 = icmp eq i64 %n.vec321, 0
  br i1 %cmp.zero322, label %if.end107.preheader357, label %vector.memcheck336

vector.memcheck336:                               ; preds = %min.iters.checked319
  %scevgep324 = getelementptr i64, i64* %items, i64 %i.1.lcssa
  %63 = add i64 %i.0.lcssa, %end
  %64 = icmp slt i64 %sub, %l.0.lcssa
  %smax = select i1 %64, i64 %l.0.lcssa, i64 %sub
  %65 = add i64 %63, %smax
  %66 = add i64 %l.0.lcssa, %r.0.lcssa
  %67 = add i64 %66, %div
  %68 = sub i64 %65, %67
  %scevgep326 = getelementptr i64, i64* %items, i64 %68
  %scevgep328 = getelementptr i64, i64* %call34, i64 %r.0.lcssa
  %scevgep330 = getelementptr i64, i64* %call34, i64 %sub35
  %bound0332 = icmp ult i64* %scevgep324, %scevgep330
  %bound1333 = icmp ult i64* %scevgep328, %scevgep326
  %memcheck.conflict335 = and i1 %bound0332, %bound1333
  %ind.end341 = add i64 %i.1.lcssa, %n.vec321
  %ind.end343 = add i64 %r.0.lcssa, %n.vec321
  br i1 %memcheck.conflict335, label %if.end107.preheader357, label %vector.body315.preheader

vector.body315.preheader:                         ; preds = %vector.memcheck336
  %69 = add i64 %n.vec321, -4
  %70 = lshr exact i64 %69, 2
  %71 = and i64 %70, 1
  %lcmp.mod359 = icmp eq i64 %71, 0
  br i1 %lcmp.mod359, label %vector.body315.prol.preheader, label %vector.body315.prol.loopexit

vector.body315.prol.preheader:                    ; preds = %vector.body315.preheader
  br label %vector.body315.prol

vector.body315.prol:                              ; preds = %vector.body315.prol.preheader
  %72 = getelementptr inbounds i64, i64* %call34, i64 %r.0.lcssa
  %73 = bitcast i64* %72 to <2 x i64>*
  %wide.load355.prol = load <2 x i64>, <2 x i64>* %73, align 8, !tbaa !1, !alias.scope !16
  %74 = getelementptr i64, i64* %72, i64 2
  %75 = bitcast i64* %74 to <2 x i64>*
  %wide.load356.prol = load <2 x i64>, <2 x i64>* %75, align 8, !tbaa !1, !alias.scope !16
  %76 = getelementptr inbounds i64, i64* %items, i64 %i.1.lcssa
  %77 = bitcast i64* %76 to <2 x i64>*
  store <2 x i64> %wide.load355.prol, <2 x i64>* %77, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %78 = getelementptr i64, i64* %76, i64 2
  %79 = bitcast i64* %78 to <2 x i64>*
  store <2 x i64> %wide.load356.prol, <2 x i64>* %79, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  br label %vector.body315.prol.loopexit

vector.body315.prol.loopexit:                     ; preds = %vector.body315.prol, %vector.body315.preheader
  %index338.unr = phi i64 [ 0, %vector.body315.preheader ], [ 4, %vector.body315.prol ]
  %80 = icmp eq i64 %70, 0
  br i1 %80, label %middle.block316, label %vector.body315.preheader.new

vector.body315.preheader.new:                     ; preds = %vector.body315.prol.loopexit
  br label %vector.body315

vector.body315:                                   ; preds = %vector.body315, %vector.body315.preheader.new
  %index338 = phi i64 [ %index338.unr, %vector.body315.preheader.new ], [ %index.next339.1, %vector.body315 ]
  %81 = add i64 %i.1.lcssa, %index338
  %82 = add i64 %r.0.lcssa, %index338
  %83 = getelementptr inbounds i64, i64* %call34, i64 %82
  %84 = bitcast i64* %83 to <2 x i64>*
  %wide.load355 = load <2 x i64>, <2 x i64>* %84, align 8, !tbaa !1, !alias.scope !16
  %85 = getelementptr i64, i64* %83, i64 2
  %86 = bitcast i64* %85 to <2 x i64>*
  %wide.load356 = load <2 x i64>, <2 x i64>* %86, align 8, !tbaa !1, !alias.scope !16
  %87 = getelementptr inbounds i64, i64* %items, i64 %81
  %88 = bitcast i64* %87 to <2 x i64>*
  store <2 x i64> %wide.load355, <2 x i64>* %88, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %89 = getelementptr i64, i64* %87, i64 2
  %90 = bitcast i64* %89 to <2 x i64>*
  store <2 x i64> %wide.load356, <2 x i64>* %90, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next339 = add i64 %index338, 4
  %91 = add i64 %i.1.lcssa, %index.next339
  %92 = add i64 %r.0.lcssa, %index.next339
  %93 = getelementptr inbounds i64, i64* %call34, i64 %92
  %94 = bitcast i64* %93 to <2 x i64>*
  %wide.load355.1 = load <2 x i64>, <2 x i64>* %94, align 8, !tbaa !1, !alias.scope !16
  %95 = getelementptr i64, i64* %93, i64 2
  %96 = bitcast i64* %95 to <2 x i64>*
  %wide.load356.1 = load <2 x i64>, <2 x i64>* %96, align 8, !tbaa !1, !alias.scope !16
  %97 = getelementptr inbounds i64, i64* %items, i64 %91
  %98 = bitcast i64* %97 to <2 x i64>*
  store <2 x i64> %wide.load355.1, <2 x i64>* %98, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %99 = getelementptr i64, i64* %97, i64 2
  %100 = bitcast i64* %99 to <2 x i64>*
  store <2 x i64> %wide.load356.1, <2 x i64>* %100, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next339.1 = add i64 %index338, 8
  %101 = icmp eq i64 %index.next339.1, %n.vec321
  br i1 %101, label %middle.block316.unr-lcssa, label %vector.body315, !llvm.loop !21

middle.block316.unr-lcssa:                        ; preds = %vector.body315
  br label %middle.block316

middle.block316:                                  ; preds = %vector.body315.prol.loopexit, %middle.block316.unr-lcssa
  %cmp.n344 = icmp eq i64 %55, %n.vec321
  br i1 %cmp.n344, label %if.end114, label %if.end107.preheader357

if.end96:                                         ; preds = %if.end96, %if.end96.preheader.new
  %i.1276 = phi i64 [ %i.1276.unr, %if.end96.preheader.new ], [ %add99.3, %if.end96 ]
  %l.2275 = phi i64 [ %l.2275.unr, %if.end96.preheader.new ], [ %add100.3, %if.end96 ]
  %arrayidx97294 = getelementptr inbounds i64, i64* %call, i64 %l.2275
  %102 = load i64, i64* %arrayidx97294, align 8, !tbaa !1
  %arrayidx98 = getelementptr inbounds i64, i64* %items, i64 %i.1276
  store i64 %102, i64* %arrayidx98, align 8, !tbaa !1
  %add99 = add nsw i64 %i.1276, 1
  %add100 = add nsw i64 %l.2275, 1
  %arrayidx97294.1 = getelementptr inbounds i64, i64* %call, i64 %add100
  %103 = load i64, i64* %arrayidx97294.1, align 8, !tbaa !1
  %arrayidx98.1 = getelementptr inbounds i64, i64* %items, i64 %add99
  store i64 %103, i64* %arrayidx98.1, align 8, !tbaa !1
  %add99.1 = add nsw i64 %i.1276, 2
  %add100.1 = add nsw i64 %l.2275, 2
  %arrayidx97294.2 = getelementptr inbounds i64, i64* %call, i64 %add100.1
  %104 = load i64, i64* %arrayidx97294.2, align 8, !tbaa !1
  %arrayidx98.2 = getelementptr inbounds i64, i64* %items, i64 %add99.1
  store i64 %104, i64* %arrayidx98.2, align 8, !tbaa !1
  %add99.2 = add nsw i64 %i.1276, 3
  %add100.2 = add nsw i64 %l.2275, 3
  %arrayidx97294.3 = getelementptr inbounds i64, i64* %call, i64 %add100.2
  %105 = load i64, i64* %arrayidx97294.3, align 8, !tbaa !1
  %arrayidx98.3 = getelementptr inbounds i64, i64* %items, i64 %add99.2
  store i64 %105, i64* %arrayidx98.3, align 8, !tbaa !1
  %add99.3 = add nsw i64 %i.1276, 4
  %add100.3 = add nsw i64 %l.2275, 4
  %exitcond289.3 = icmp eq i64 %add99.3, %3
  br i1 %exitcond289.3, label %while.cond101.preheader.loopexit.unr-lcssa, label %if.end96, !llvm.loop !22

if.end107:                                        ; preds = %if.end107, %if.end107.preheader357.new
  %i.2273 = phi i64 [ %i.2273.unr, %if.end107.preheader357.new ], [ %add110.3, %if.end107 ]
  %r.2272 = phi i64 [ %r.2272.unr, %if.end107.preheader357.new ], [ %add111.3, %if.end107 ]
  %arrayidx108293 = getelementptr inbounds i64, i64* %call34, i64 %r.2272
  %106 = load i64, i64* %arrayidx108293, align 8, !tbaa !1
  %arrayidx109 = getelementptr inbounds i64, i64* %items, i64 %i.2273
  store i64 %106, i64* %arrayidx109, align 8, !tbaa !1
  %add110 = add nsw i64 %i.2273, 1
  %add111 = add nsw i64 %r.2272, 1
  %arrayidx108293.1 = getelementptr inbounds i64, i64* %call34, i64 %add111
  %107 = load i64, i64* %arrayidx108293.1, align 8, !tbaa !1
  %arrayidx109.1 = getelementptr inbounds i64, i64* %items, i64 %add110
  store i64 %107, i64* %arrayidx109.1, align 8, !tbaa !1
  %add110.1 = add nsw i64 %i.2273, 2
  %add111.1 = add nsw i64 %r.2272, 2
  %arrayidx108293.2 = getelementptr inbounds i64, i64* %call34, i64 %add111.1
  %108 = load i64, i64* %arrayidx108293.2, align 8, !tbaa !1
  %arrayidx109.2 = getelementptr inbounds i64, i64* %items, i64 %add110.1
  store i64 %108, i64* %arrayidx109.2, align 8, !tbaa !1
  %add110.2 = add nsw i64 %i.2273, 3
  %add111.2 = add nsw i64 %r.2272, 3
  %arrayidx108293.3 = getelementptr inbounds i64, i64* %call34, i64 %add111.2
  %109 = load i64, i64* %arrayidx108293.3, align 8, !tbaa !1
  %arrayidx109.3 = getelementptr inbounds i64, i64* %items, i64 %add110.2
  store i64 %109, i64* %arrayidx109.3, align 8, !tbaa !1
  %add110.3 = add nsw i64 %i.2273, 4
  %add111.3 = add nsw i64 %r.2272, 4
  %exitcond.3 = icmp eq i64 %add111.3, %sub35
  br i1 %exitcond.3, label %if.end114.loopexit.unr-lcssa, label %if.end107, !llvm.loop !23

if.end114.loopexit.unr-lcssa:                     ; preds = %if.end107
  br label %if.end114.loopexit

if.end114.loopexit:                               ; preds = %if.end107.prol.loopexit, %if.end114.loopexit.unr-lcssa
  br label %if.end114

if.end114:                                        ; preds = %if.end114.loopexit, %middle.block316, %while.cond101.preheader
  %phitmp288 = bitcast i64* %call50 to i8*
  br i1 %cmp19, label %if.end117, label %if.then116

if.then116:                                       ; preds = %if.end114
  %phitmp = bitcast i64* %call17 to i8*
  tail call void @free(i8* %phitmp) #6
  br label %if.end117

if.end117:                                        ; preds = %if.end114, %if.then116
  br i1 %not.cmp53, label %if.end132, label %if.then119

if.then119:                                       ; preds = %if.end117
  tail call void @free(i8* %phitmp288) #6
  br label %if.end132

if.end132:                                        ; preds = %if.end117, %entry, %if.then119
  store i64 %items_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #6
  ret i64* %items
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

declare i64* @slice(i64*, i64, i32, i32) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #4 {
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
  %not.cmp = icmp eq i64** %call, null
  %3 = load i64*, i64** %call, align 8, !tbaa !24
  %call3 = call i64* @parseStringToInt(i64* %3) #6
  %not.cmp4 = icmp eq i64* %call3, null
  br i1 %not.cmp4, label %if.end91, label %if.end14

if.end14:                                         ; preds = %entry
  %4 = load i64, i64* %call3, align 8, !tbaa !1
  %call18 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #6
  %cmp28176 = icmp sgt i64 %4, 0
  br i1 %cmp28176, label %if.end30.preheader, label %if.end85

if.end30.preheader:                               ; preds = %if.end14
  %min.iters.check = icmp ult i64 %4, 4
  br i1 %min.iters.check, label %if.end30.preheader187, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end30.preheader
  %n.vec = and i64 %4, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end30.preheader187, label %vector.ph

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
  br i1 %26, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !26

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %4, %n.vec
  br i1 %cmp.n, label %if.end85, label %if.end30.preheader187

if.end30.preheader187:                            ; preds = %middle.block, %min.iters.checked, %if.end30.preheader
  %index.0177.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end30.preheader ], [ %n.vec, %middle.block ]
  br label %if.end30

if.end30:                                         ; preds = %if.end30.preheader187, %if.end30
  %index.0177 = phi i64 [ %add, %if.end30 ], [ %index.0177.ph, %if.end30.preheader187 ]
  %sub = sub nsw i64 %4, %index.0177
  %arrayidx31 = getelementptr inbounds i64, i64* %call18, i64 %index.0177
  store i64 %sub, i64* %arrayidx31, align 8, !tbaa !1
  %add = add nuw nsw i64 %index.0177, 1
  %exitcond = icmp eq i64 %add, %4
  br i1 %exitcond, label %if.end85.loopexit, label %if.end30, !llvm.loop !27

if.end85.loopexit:                                ; preds = %if.end30
  br label %if.end85

if.end85:                                         ; preds = %if.end85.loopexit, %middle.block, %if.end14
  %call35 = call i64* @_sortV1_(i64* %call18, i64 %4, i1 zeroext undef, i64 0, i64 %4, i64* nonnull %_15_size)
  %not.cmp37 = icmp eq i64* %call35, null
  %27 = load i64, i64* %call35, align 8, !tbaa !1
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %27)
  %sub48 = add nsw i64 %4, -1
  %arrayidx49185 = getelementptr inbounds i64, i64* %call18, i64 %sub48
  %28 = load i64, i64* %arrayidx49185, align 8, !tbaa !1
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %28)
  %call54 = call i64* @create1DArray_int64_t(i64 0, i64 24) #6
  %29 = bitcast i64* %call54 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %29, align 8, !tbaa !1
  %arrayidx57 = getelementptr inbounds i64, i64* %call54, i64 2
  %30 = bitcast i64* %arrayidx57 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %30, align 8, !tbaa !1
  %arrayidx59 = getelementptr inbounds i64, i64* %call54, i64 4
  %31 = bitcast i64* %arrayidx59 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx61 = getelementptr inbounds i64, i64* %call54, i64 6
  %32 = bitcast i64* %arrayidx61 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx63 = getelementptr inbounds i64, i64* %call54, i64 8
  %33 = bitcast i64* %arrayidx63 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx65 = getelementptr inbounds i64, i64* %call54, i64 10
  %34 = bitcast i64* %arrayidx65 to <2 x i64>*
  store <2 x i64> <i64 115, i64 111>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx67 = getelementptr inbounds i64, i64* %call54, i64 12
  %35 = bitcast i64* %arrayidx67 to <2 x i64>*
  store <2 x i64> <i64 114, i64 116>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx69 = getelementptr inbounds i64, i64* %call54, i64 14
  %36 = bitcast i64* %arrayidx69 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx71 = getelementptr inbounds i64, i64* %call54, i64 16
  %37 = bitcast i64* %arrayidx71 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx73 = getelementptr inbounds i64, i64* %call54, i64 18
  %38 = bitcast i64* %arrayidx73 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx75 = getelementptr inbounds i64, i64* %call54, i64 20
  %39 = bitcast i64* %arrayidx75 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx77 = getelementptr inbounds i64, i64* %call54, i64 22
  %40 = bitcast i64* %arrayidx77 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %40, align 8, !tbaa !1
  %not.cmp79 = icmp ne i64* %call54, null
  %_28_dealloc.0 = zext i1 %not.cmp79 to i8
  call void @println_s(i64* %call54, i64 24) #6
  %phitmp = bitcast i64* %call54 to i8*
  %41 = bitcast i64* %call3 to i8*
  call void @free(i8* %41) #6
  br i1 %not.cmp37, label %if.end91, label %if.then87

if.then87:                                        ; preds = %if.end85
  %phitmp174 = bitcast i64* %call35 to i8*
  call void @free(i8* %phitmp174) #6
  br label %if.end91

if.end91:                                         ; preds = %if.end85, %entry, %if.then87
  %_28.0180184 = phi i8* [ %phitmp, %if.then87 ], [ %phitmp, %if.end85 ], [ null, %entry ]
  %_28_dealloc.1181183 = phi i8 [ %_28_dealloc.0, %if.then87 ], [ %_28_dealloc.0, %if.end85 ], [ 0, %entry ]
  br i1 %not.cmp, label %if.end103, label %if.then93

if.then93:                                        ; preds = %if.end91
  %42 = load i64, i64* %_6_size, align 8, !tbaa !1
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %42) #6
  br label %if.end103

if.end103:                                        ; preds = %if.end91, %if.then93
  %tobool104 = icmp eq i8 %_28_dealloc.1181183, 0
  br i1 %tobool104, label %if.end106, label %if.then105

if.then105:                                       ; preds = %if.end103
  call void @free(i8* %_28.0180184) #6
  br label %if.end106

if.end106:                                        ; preds = %if.end103, %if.then105
  call void @exit(i32 0) #7
  unreachable
}

declare void @free2DArray_int64_t(i64**, i64) local_unnamed_addr #3

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.vectorize.width", i32 1}
!14 = !{!"llvm.loop.interleave.count", i32 1}
!15 = distinct !{!15, !6}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !13, !14}
!22 = distinct !{!22, !13, !14}
!23 = distinct !{!23, !13, !14}
!24 = !{!25, !25, i64 0}
!25 = !{!"any pointer", !3, i64 0}
!26 = distinct !{!26, !13, !14}
!27 = distinct !{!27, !28, !13, !14}
!28 = !{!"llvm.loop.unroll.runtime.disable"}
