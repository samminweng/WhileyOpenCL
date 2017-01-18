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
  br i1 %cmp, label %if.end26, label %if.end155

if.end26:                                         ; preds = %entry
  %add1 = add nsw i64 %end, %start
  %div = sdiv i64 %add1, 2
  %conv = trunc i64 %start to i32
  %conv4 = trunc i64 %div to i32
  %call = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv, i32 %conv4) #6
  %sub = sub i64 %div, %start
  %not.cmp5 = icmp eq i64* %call, null
  %call12 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 %sub) #6
  %not.cmp13 = icmp eq i64* %call12, null
  %call21 = tail call i64* @copy1DArray_int64_t(i64* %call12, i64 %sub) #6
  %call22 = call i64* @_sortV1_(i64* %call21, i64 %sub, i1 zeroext undef, i64 0, i64 %div, i64* nonnull %_16_size)
  %not.cmp27 = icmp eq i64* %call22, null
  br i1 %not.cmp13, label %if.end71, label %if.then33

if.then33:                                        ; preds = %if.end26
  %2 = bitcast i64* %call12 to i8*
  tail call void @free(i8* %2) #6
  br label %if.end71

if.end71:                                         ; preds = %if.then33, %if.end26
  %3 = load i64, i64* %_16_size, align 8, !tbaa !1
  %call35 = tail call i64* @copy1DArray_int64_t(i64* %call22, i64 %3) #6
  %cmp36 = icmp eq i64* %call35, null
  %conv45 = trunc i64 %end to i32
  %call46 = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv4, i32 %conv45) #6
  %sub47 = sub nsw i64 %end, %div
  %not.cmp48 = icmp eq i64* %call46, null
  %call56 = tail call i64* @copy1DArray_int64_t(i64* %call46, i64 %sub47) #6
  %not.cmp57 = icmp eq i64* %call56, null
  %call66 = tail call i64* @copy1DArray_int64_t(i64* %call56, i64 %sub47) #6
  %call67 = call i64* @_sortV1_(i64* %call66, i64 %sub47, i1 zeroext undef, i64 0, i64 %sub47, i64* nonnull %_19_size)
  %not.cmp72 = icmp eq i64* %call67, null
  br i1 %not.cmp57, label %if.end79, label %if.then78

if.then78:                                        ; preds = %if.end71
  %4 = bitcast i64* %call56 to i8*
  tail call void @free(i8* %4) #6
  br label %if.end79

if.end79:                                         ; preds = %if.end71, %if.then78
  %5 = load i64, i64* %_19_size, align 8, !tbaa !1
  %call80 = tail call i64* @copy1DArray_int64_t(i64* %call67, i64 %5) #6
  %not.cmp81 = icmp eq i64* %call80, null
  %sub86 = sub nsw i64 %end, %start
  %cmp87315 = icmp sgt i64 %sub86, 0
  %cmp92316 = icmp sgt i64 %sub, 0
  %or.cond317 = and i1 %cmp87315, %cmp92316
  %cmp97318 = icmp sgt i64 %sub47, 0
  %or.cond308319 = and i1 %cmp97318, %or.cond317
  br i1 %or.cond308319, label %if.end100.preheader, label %while.cond113.preheader

if.end100.preheader:                              ; preds = %if.end79
  br label %if.end100

while.cond113.preheader.loopexit:                 ; preds = %blklab4
  br label %while.cond113.preheader

while.cond113.preheader:                          ; preds = %while.cond113.preheader.loopexit, %if.end79
  %l.0.lcssa = phi i64 [ 0, %if.end79 ], [ %l.1, %while.cond113.preheader.loopexit ]
  %r.0.lcssa = phi i64 [ 0, %if.end79 ], [ %r.1, %while.cond113.preheader.loopexit ]
  %i.0.lcssa = phi i64 [ 0, %if.end79 ], [ %add112, %while.cond113.preheader.loopexit ]
  %cmp116312 = icmp sgt i64 %sub, %l.0.lcssa
  br i1 %cmp116312, label %if.end119.lr.ph, label %while.cond124.preheader

if.end119.lr.ph:                                  ; preds = %while.cond113.preheader
  %6 = sub i64 %sub, %l.0.lcssa
  %7 = add i64 %6, %i.0.lcssa
  %8 = sub i64 %div, %l.0.lcssa
  %9 = sub i64 %8, %start
  %min.iters.check = icmp ult i64 %9, 4
  br i1 %min.iters.check, label %if.end119.preheader, label %min.iters.checked

if.end119.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end119.lr.ph
  %i.1314.ph = phi i64 [ %i.0.lcssa, %vector.memcheck ], [ %i.0.lcssa, %min.iters.checked ], [ %i.0.lcssa, %if.end119.lr.ph ], [ %ind.end, %middle.block ]
  %l.2313.ph = phi i64 [ %l.0.lcssa, %vector.memcheck ], [ %l.0.lcssa, %min.iters.checked ], [ %l.0.lcssa, %if.end119.lr.ph ], [ %ind.end377, %middle.block ]
  %10 = add i64 %i.0.lcssa, %div
  %11 = sub i64 %10, %i.1314.ph
  %12 = sub i64 %11, %l.0.lcssa
  %13 = sub i64 %12, %start
  %14 = add i64 %10, -1
  %15 = sub i64 %14, %i.1314.ph
  %16 = sub i64 %15, %l.0.lcssa
  %17 = sub i64 %16, %start
  %xtraiter430 = and i64 %13, 3
  %lcmp.mod431 = icmp eq i64 %xtraiter430, 0
  br i1 %lcmp.mod431, label %if.end119.prol.loopexit, label %if.end119.prol.preheader

if.end119.prol.preheader:                         ; preds = %if.end119.preheader
  br label %if.end119.prol

if.end119.prol:                                   ; preds = %if.end119.prol, %if.end119.prol.preheader
  %i.1314.prol = phi i64 [ %add122.prol, %if.end119.prol ], [ %i.1314.ph, %if.end119.prol.preheader ]
  %l.2313.prol = phi i64 [ %add123.prol, %if.end119.prol ], [ %l.2313.ph, %if.end119.prol.preheader ]
  %prol.iter432 = phi i64 [ %prol.iter432.sub, %if.end119.prol ], [ %xtraiter430, %if.end119.prol.preheader ]
  %arrayidx120.prol = getelementptr inbounds i64, i64* %call35, i64 %l.2313.prol
  %18 = load i64, i64* %arrayidx120.prol, align 8, !tbaa !1
  %arrayidx121.prol = getelementptr inbounds i64, i64* %items, i64 %i.1314.prol
  store i64 %18, i64* %arrayidx121.prol, align 8, !tbaa !1
  %add122.prol = add nsw i64 %i.1314.prol, 1
  %add123.prol = add nsw i64 %l.2313.prol, 1
  %prol.iter432.sub = add i64 %prol.iter432, -1
  %prol.iter432.cmp = icmp eq i64 %prol.iter432.sub, 0
  br i1 %prol.iter432.cmp, label %if.end119.prol.loopexit.unr-lcssa, label %if.end119.prol, !llvm.loop !5

if.end119.prol.loopexit.unr-lcssa:                ; preds = %if.end119.prol
  br label %if.end119.prol.loopexit

if.end119.prol.loopexit:                          ; preds = %if.end119.preheader, %if.end119.prol.loopexit.unr-lcssa
  %i.1314.unr = phi i64 [ %i.1314.ph, %if.end119.preheader ], [ %add122.prol, %if.end119.prol.loopexit.unr-lcssa ]
  %l.2313.unr = phi i64 [ %l.2313.ph, %if.end119.preheader ], [ %add123.prol, %if.end119.prol.loopexit.unr-lcssa ]
  %19 = icmp ult i64 %17, 3
  br i1 %19, label %while.cond124.preheader.loopexit, label %if.end119.preheader.new

if.end119.preheader.new:                          ; preds = %if.end119.prol.loopexit
  br label %if.end119

min.iters.checked:                                ; preds = %if.end119.lr.ph
  %n.vec = and i64 %9, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end119.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %20 = add i64 %i.0.lcssa, %div
  %21 = add i64 %l.0.lcssa, %start
  %22 = sub i64 %20, %21
  %scevgep370 = getelementptr i64, i64* %items, i64 %22
  %scevgep372 = getelementptr i64, i64* %call35, i64 %l.0.lcssa
  %scevgep374 = getelementptr i64, i64* %call35, i64 %sub
  %bound0 = icmp ult i64* %scevgep, %scevgep374
  %bound1 = icmp ult i64* %scevgep372, %scevgep370
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add i64 %i.0.lcssa, %n.vec
  %ind.end377 = add i64 %l.0.lcssa, %n.vec
  br i1 %memcheck.conflict, label %if.end119.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %23 = add i64 %n.vec, -4
  %24 = lshr exact i64 %23, 2
  %25 = and i64 %24, 1
  %lcmp.mod434 = icmp eq i64 %25, 0
  br i1 %lcmp.mod434, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %26 = getelementptr inbounds i64, i64* %call35, i64 %l.0.lcssa
  %27 = bitcast i64* %26 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %27, align 8, !tbaa !1, !alias.scope !7
  %28 = getelementptr i64, i64* %26, i64 2
  %29 = bitcast i64* %28 to <2 x i64>*
  %wide.load384.prol = load <2 x i64>, <2 x i64>* %29, align 8, !tbaa !1, !alias.scope !7
  %30 = getelementptr inbounds i64, i64* %items, i64 %i.0.lcssa
  %31 = bitcast i64* %30 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %31, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %32 = getelementptr i64, i64* %30, i64 2
  %33 = bitcast i64* %32 to <2 x i64>*
  store <2 x i64> %wide.load384.prol, <2 x i64>* %33, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %34 = icmp eq i64 %24, 0
  br i1 %34, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %35 = add i64 %i.0.lcssa, %index
  %36 = add i64 %l.0.lcssa, %index
  %37 = getelementptr inbounds i64, i64* %call35, i64 %36
  %38 = bitcast i64* %37 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %38, align 8, !tbaa !1, !alias.scope !7
  %39 = getelementptr i64, i64* %37, i64 2
  %40 = bitcast i64* %39 to <2 x i64>*
  %wide.load384 = load <2 x i64>, <2 x i64>* %40, align 8, !tbaa !1, !alias.scope !7
  %41 = getelementptr inbounds i64, i64* %items, i64 %35
  %42 = bitcast i64* %41 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %42, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %43 = getelementptr i64, i64* %41, i64 2
  %44 = bitcast i64* %43 to <2 x i64>*
  store <2 x i64> %wide.load384, <2 x i64>* %44, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %45 = add i64 %i.0.lcssa, %index.next
  %46 = add i64 %l.0.lcssa, %index.next
  %47 = getelementptr inbounds i64, i64* %call35, i64 %46
  %48 = bitcast i64* %47 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %48, align 8, !tbaa !1, !alias.scope !7
  %49 = getelementptr i64, i64* %47, i64 2
  %50 = bitcast i64* %49 to <2 x i64>*
  %wide.load384.1 = load <2 x i64>, <2 x i64>* %50, align 8, !tbaa !1, !alias.scope !7
  %51 = getelementptr inbounds i64, i64* %items, i64 %45
  %52 = bitcast i64* %51 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %52, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %53 = getelementptr i64, i64* %51, i64 2
  %54 = bitcast i64* %53 to <2 x i64>*
  store <2 x i64> %wide.load384.1, <2 x i64>* %54, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %55 = icmp eq i64 %index.next.1, %n.vec
  br i1 %55, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %9, %n.vec
  br i1 %cmp.n, label %while.cond124.preheader, label %if.end119.preheader

if.end100:                                        ; preds = %if.end100.preheader, %blklab4
  %i.0322 = phi i64 [ %add112, %blklab4 ], [ 0, %if.end100.preheader ]
  %r.0321 = phi i64 [ %r.1, %blklab4 ], [ 0, %if.end100.preheader ]
  %l.0320 = phi i64 [ %l.1, %blklab4 ], [ 0, %if.end100.preheader ]
  %arrayidx = getelementptr inbounds i64, i64* %call35, i64 %l.0320
  %56 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %arrayidx101 = getelementptr inbounds i64, i64* %call80, i64 %r.0321
  %57 = load i64, i64* %arrayidx101, align 8, !tbaa !1
  %cmp102 = icmp sgt i64 %56, %57
  %arrayidx110 = getelementptr inbounds i64, i64* %items, i64 %i.0322
  br i1 %cmp102, label %blklab3, label %if.end105

if.end105:                                        ; preds = %if.end100
  store i64 %56, i64* %arrayidx110, align 8, !tbaa !1
  %add108 = add nsw i64 %l.0320, 1
  br label %blklab4

blklab3:                                          ; preds = %if.end100
  store i64 %57, i64* %arrayidx110, align 8, !tbaa !1
  %add111 = add nsw i64 %r.0321, 1
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end105
  %l.1 = phi i64 [ %l.0320, %blklab3 ], [ %add108, %if.end105 ]
  %r.1 = phi i64 [ %add111, %blklab3 ], [ %r.0321, %if.end105 ]
  %add112 = add nuw nsw i64 %i.0322, 1
  %cmp87 = icmp slt i64 %add112, %sub86
  %cmp92 = icmp slt i64 %l.1, %sub
  %or.cond = and i1 %cmp87, %cmp92
  %cmp97 = icmp slt i64 %r.1, %sub47
  %or.cond308 = and i1 %cmp97, %or.cond
  br i1 %or.cond308, label %if.end100, label %while.cond113.preheader.loopexit

while.cond124.preheader.loopexit.unr-lcssa:       ; preds = %if.end119
  br label %while.cond124.preheader.loopexit

while.cond124.preheader.loopexit:                 ; preds = %if.end119.prol.loopexit, %while.cond124.preheader.loopexit.unr-lcssa
  br label %while.cond124.preheader

while.cond124.preheader:                          ; preds = %while.cond124.preheader.loopexit, %middle.block, %while.cond113.preheader
  %i.1.lcssa = phi i64 [ %i.0.lcssa, %while.cond113.preheader ], [ %7, %middle.block ], [ %7, %while.cond124.preheader.loopexit ]
  %cmp127309 = icmp slt i64 %r.0.lcssa, %sub47
  br i1 %cmp127309, label %if.end130.preheader, label %if.end137

if.end130.preheader:                              ; preds = %while.cond124.preheader
  %58 = sub i64 %end, %r.0.lcssa
  %59 = sub i64 %58, %div
  %min.iters.check388 = icmp ult i64 %59, 4
  br i1 %min.iters.check388, label %if.end130.preheader427, label %min.iters.checked389

if.end130.preheader427:                           ; preds = %middle.block386, %vector.memcheck406, %min.iters.checked389, %if.end130.preheader
  %i.2311.ph = phi i64 [ %i.1.lcssa, %vector.memcheck406 ], [ %i.1.lcssa, %min.iters.checked389 ], [ %i.1.lcssa, %if.end130.preheader ], [ %ind.end411, %middle.block386 ]
  %r.2310.ph = phi i64 [ %r.0.lcssa, %vector.memcheck406 ], [ %r.0.lcssa, %min.iters.checked389 ], [ %r.0.lcssa, %if.end130.preheader ], [ %ind.end413, %middle.block386 ]
  %60 = sub i64 %end, %r.2310.ph
  %61 = sub i64 %60, %div
  %62 = add i64 %end, -1
  %63 = sub i64 %62, %r.2310.ph
  %64 = sub i64 %63, %div
  %xtraiter = and i64 %61, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %if.end130.prol.loopexit, label %if.end130.prol.preheader

if.end130.prol.preheader:                         ; preds = %if.end130.preheader427
  br label %if.end130.prol

if.end130.prol:                                   ; preds = %if.end130.prol, %if.end130.prol.preheader
  %i.2311.prol = phi i64 [ %add133.prol, %if.end130.prol ], [ %i.2311.ph, %if.end130.prol.preheader ]
  %r.2310.prol = phi i64 [ %add134.prol, %if.end130.prol ], [ %r.2310.ph, %if.end130.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end130.prol ], [ %xtraiter, %if.end130.prol.preheader ]
  %arrayidx131.prol = getelementptr inbounds i64, i64* %call80, i64 %r.2310.prol
  %65 = load i64, i64* %arrayidx131.prol, align 8, !tbaa !1
  %arrayidx132.prol = getelementptr inbounds i64, i64* %items, i64 %i.2311.prol
  store i64 %65, i64* %arrayidx132.prol, align 8, !tbaa !1
  %add133.prol = add nsw i64 %i.2311.prol, 1
  %add134.prol = add nsw i64 %r.2310.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %if.end130.prol.loopexit.unr-lcssa, label %if.end130.prol, !llvm.loop !15

if.end130.prol.loopexit.unr-lcssa:                ; preds = %if.end130.prol
  br label %if.end130.prol.loopexit

if.end130.prol.loopexit:                          ; preds = %if.end130.preheader427, %if.end130.prol.loopexit.unr-lcssa
  %i.2311.unr = phi i64 [ %i.2311.ph, %if.end130.preheader427 ], [ %add133.prol, %if.end130.prol.loopexit.unr-lcssa ]
  %r.2310.unr = phi i64 [ %r.2310.ph, %if.end130.preheader427 ], [ %add134.prol, %if.end130.prol.loopexit.unr-lcssa ]
  %66 = icmp ult i64 %64, 3
  br i1 %66, label %if.end137.loopexit, label %if.end130.preheader427.new

if.end130.preheader427.new:                       ; preds = %if.end130.prol.loopexit
  br label %if.end130

min.iters.checked389:                             ; preds = %if.end130.preheader
  %n.vec391 = and i64 %59, -4
  %cmp.zero392 = icmp eq i64 %n.vec391, 0
  br i1 %cmp.zero392, label %if.end130.preheader427, label %vector.memcheck406

vector.memcheck406:                               ; preds = %min.iters.checked389
  %scevgep394 = getelementptr i64, i64* %items, i64 %i.1.lcssa
  %67 = add i64 %i.0.lcssa, %end
  %68 = icmp slt i64 %sub, %l.0.lcssa
  %smax = select i1 %68, i64 %l.0.lcssa, i64 %sub
  %69 = add i64 %67, %smax
  %70 = add i64 %l.0.lcssa, %r.0.lcssa
  %71 = add i64 %70, %div
  %72 = sub i64 %69, %71
  %scevgep396 = getelementptr i64, i64* %items, i64 %72
  %scevgep398 = getelementptr i64, i64* %call80, i64 %r.0.lcssa
  %scevgep400 = getelementptr i64, i64* %call80, i64 %sub47
  %bound0402 = icmp ult i64* %scevgep394, %scevgep400
  %bound1403 = icmp ult i64* %scevgep398, %scevgep396
  %memcheck.conflict405 = and i1 %bound0402, %bound1403
  %ind.end411 = add i64 %i.1.lcssa, %n.vec391
  %ind.end413 = add i64 %r.0.lcssa, %n.vec391
  br i1 %memcheck.conflict405, label %if.end130.preheader427, label %vector.body385.preheader

vector.body385.preheader:                         ; preds = %vector.memcheck406
  %73 = add i64 %n.vec391, -4
  %74 = lshr exact i64 %73, 2
  %75 = and i64 %74, 1
  %lcmp.mod429 = icmp eq i64 %75, 0
  br i1 %lcmp.mod429, label %vector.body385.prol.preheader, label %vector.body385.prol.loopexit

vector.body385.prol.preheader:                    ; preds = %vector.body385.preheader
  br label %vector.body385.prol

vector.body385.prol:                              ; preds = %vector.body385.prol.preheader
  %76 = getelementptr inbounds i64, i64* %call80, i64 %r.0.lcssa
  %77 = bitcast i64* %76 to <2 x i64>*
  %wide.load425.prol = load <2 x i64>, <2 x i64>* %77, align 8, !tbaa !1, !alias.scope !16
  %78 = getelementptr i64, i64* %76, i64 2
  %79 = bitcast i64* %78 to <2 x i64>*
  %wide.load426.prol = load <2 x i64>, <2 x i64>* %79, align 8, !tbaa !1, !alias.scope !16
  %80 = getelementptr inbounds i64, i64* %items, i64 %i.1.lcssa
  %81 = bitcast i64* %80 to <2 x i64>*
  store <2 x i64> %wide.load425.prol, <2 x i64>* %81, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %82 = getelementptr i64, i64* %80, i64 2
  %83 = bitcast i64* %82 to <2 x i64>*
  store <2 x i64> %wide.load426.prol, <2 x i64>* %83, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  br label %vector.body385.prol.loopexit

vector.body385.prol.loopexit:                     ; preds = %vector.body385.prol, %vector.body385.preheader
  %index408.unr = phi i64 [ 0, %vector.body385.preheader ], [ 4, %vector.body385.prol ]
  %84 = icmp eq i64 %74, 0
  br i1 %84, label %middle.block386, label %vector.body385.preheader.new

vector.body385.preheader.new:                     ; preds = %vector.body385.prol.loopexit
  br label %vector.body385

vector.body385:                                   ; preds = %vector.body385, %vector.body385.preheader.new
  %index408 = phi i64 [ %index408.unr, %vector.body385.preheader.new ], [ %index.next409.1, %vector.body385 ]
  %85 = add i64 %i.1.lcssa, %index408
  %86 = add i64 %r.0.lcssa, %index408
  %87 = getelementptr inbounds i64, i64* %call80, i64 %86
  %88 = bitcast i64* %87 to <2 x i64>*
  %wide.load425 = load <2 x i64>, <2 x i64>* %88, align 8, !tbaa !1, !alias.scope !16
  %89 = getelementptr i64, i64* %87, i64 2
  %90 = bitcast i64* %89 to <2 x i64>*
  %wide.load426 = load <2 x i64>, <2 x i64>* %90, align 8, !tbaa !1, !alias.scope !16
  %91 = getelementptr inbounds i64, i64* %items, i64 %85
  %92 = bitcast i64* %91 to <2 x i64>*
  store <2 x i64> %wide.load425, <2 x i64>* %92, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %93 = getelementptr i64, i64* %91, i64 2
  %94 = bitcast i64* %93 to <2 x i64>*
  store <2 x i64> %wide.load426, <2 x i64>* %94, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next409 = add i64 %index408, 4
  %95 = add i64 %i.1.lcssa, %index.next409
  %96 = add i64 %r.0.lcssa, %index.next409
  %97 = getelementptr inbounds i64, i64* %call80, i64 %96
  %98 = bitcast i64* %97 to <2 x i64>*
  %wide.load425.1 = load <2 x i64>, <2 x i64>* %98, align 8, !tbaa !1, !alias.scope !16
  %99 = getelementptr i64, i64* %97, i64 2
  %100 = bitcast i64* %99 to <2 x i64>*
  %wide.load426.1 = load <2 x i64>, <2 x i64>* %100, align 8, !tbaa !1, !alias.scope !16
  %101 = getelementptr inbounds i64, i64* %items, i64 %95
  %102 = bitcast i64* %101 to <2 x i64>*
  store <2 x i64> %wide.load425.1, <2 x i64>* %102, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %103 = getelementptr i64, i64* %101, i64 2
  %104 = bitcast i64* %103 to <2 x i64>*
  store <2 x i64> %wide.load426.1, <2 x i64>* %104, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next409.1 = add i64 %index408, 8
  %105 = icmp eq i64 %index.next409.1, %n.vec391
  br i1 %105, label %middle.block386.unr-lcssa, label %vector.body385, !llvm.loop !21

middle.block386.unr-lcssa:                        ; preds = %vector.body385
  br label %middle.block386

middle.block386:                                  ; preds = %vector.body385.prol.loopexit, %middle.block386.unr-lcssa
  %cmp.n414 = icmp eq i64 %59, %n.vec391
  br i1 %cmp.n414, label %if.end137, label %if.end130.preheader427

if.end119:                                        ; preds = %if.end119, %if.end119.preheader.new
  %i.1314 = phi i64 [ %i.1314.unr, %if.end119.preheader.new ], [ %add122.3, %if.end119 ]
  %l.2313 = phi i64 [ %l.2313.unr, %if.end119.preheader.new ], [ %add123.3, %if.end119 ]
  %arrayidx120 = getelementptr inbounds i64, i64* %call35, i64 %l.2313
  %106 = load i64, i64* %arrayidx120, align 8, !tbaa !1
  %arrayidx121 = getelementptr inbounds i64, i64* %items, i64 %i.1314
  store i64 %106, i64* %arrayidx121, align 8, !tbaa !1
  %add122 = add nsw i64 %i.1314, 1
  %add123 = add nsw i64 %l.2313, 1
  %arrayidx120.1 = getelementptr inbounds i64, i64* %call35, i64 %add123
  %107 = load i64, i64* %arrayidx120.1, align 8, !tbaa !1
  %arrayidx121.1 = getelementptr inbounds i64, i64* %items, i64 %add122
  store i64 %107, i64* %arrayidx121.1, align 8, !tbaa !1
  %add122.1 = add nsw i64 %i.1314, 2
  %add123.1 = add nsw i64 %l.2313, 2
  %arrayidx120.2 = getelementptr inbounds i64, i64* %call35, i64 %add123.1
  %108 = load i64, i64* %arrayidx120.2, align 8, !tbaa !1
  %arrayidx121.2 = getelementptr inbounds i64, i64* %items, i64 %add122.1
  store i64 %108, i64* %arrayidx121.2, align 8, !tbaa !1
  %add122.2 = add nsw i64 %i.1314, 3
  %add123.2 = add nsw i64 %l.2313, 3
  %arrayidx120.3 = getelementptr inbounds i64, i64* %call35, i64 %add123.2
  %109 = load i64, i64* %arrayidx120.3, align 8, !tbaa !1
  %arrayidx121.3 = getelementptr inbounds i64, i64* %items, i64 %add122.2
  store i64 %109, i64* %arrayidx121.3, align 8, !tbaa !1
  %add122.3 = add nsw i64 %i.1314, 4
  %add123.3 = add nsw i64 %l.2313, 4
  %exitcond331.3 = icmp eq i64 %add122.3, %7
  br i1 %exitcond331.3, label %while.cond124.preheader.loopexit.unr-lcssa, label %if.end119, !llvm.loop !22

if.end130:                                        ; preds = %if.end130, %if.end130.preheader427.new
  %i.2311 = phi i64 [ %i.2311.unr, %if.end130.preheader427.new ], [ %add133.3, %if.end130 ]
  %r.2310 = phi i64 [ %r.2310.unr, %if.end130.preheader427.new ], [ %add134.3, %if.end130 ]
  %arrayidx131 = getelementptr inbounds i64, i64* %call80, i64 %r.2310
  %110 = load i64, i64* %arrayidx131, align 8, !tbaa !1
  %arrayidx132 = getelementptr inbounds i64, i64* %items, i64 %i.2311
  store i64 %110, i64* %arrayidx132, align 8, !tbaa !1
  %add133 = add nsw i64 %i.2311, 1
  %add134 = add nsw i64 %r.2310, 1
  %arrayidx131.1 = getelementptr inbounds i64, i64* %call80, i64 %add134
  %111 = load i64, i64* %arrayidx131.1, align 8, !tbaa !1
  %arrayidx132.1 = getelementptr inbounds i64, i64* %items, i64 %add133
  store i64 %111, i64* %arrayidx132.1, align 8, !tbaa !1
  %add133.1 = add nsw i64 %i.2311, 2
  %add134.1 = add nsw i64 %r.2310, 2
  %arrayidx131.2 = getelementptr inbounds i64, i64* %call80, i64 %add134.1
  %112 = load i64, i64* %arrayidx131.2, align 8, !tbaa !1
  %arrayidx132.2 = getelementptr inbounds i64, i64* %items, i64 %add133.1
  store i64 %112, i64* %arrayidx132.2, align 8, !tbaa !1
  %add133.2 = add nsw i64 %i.2311, 3
  %add134.2 = add nsw i64 %r.2310, 3
  %arrayidx131.3 = getelementptr inbounds i64, i64* %call80, i64 %add134.2
  %113 = load i64, i64* %arrayidx131.3, align 8, !tbaa !1
  %arrayidx132.3 = getelementptr inbounds i64, i64* %items, i64 %add133.2
  store i64 %113, i64* %arrayidx132.3, align 8, !tbaa !1
  %add133.3 = add nsw i64 %i.2311, 4
  %add134.3 = add nsw i64 %r.2310, 4
  %exitcond.3 = icmp eq i64 %add134.3, %sub47
  br i1 %exitcond.3, label %if.end137.loopexit.unr-lcssa, label %if.end130, !llvm.loop !23

if.end137.loopexit.unr-lcssa:                     ; preds = %if.end130
  br label %if.end137.loopexit

if.end137.loopexit:                               ; preds = %if.end130.prol.loopexit, %if.end137.loopexit.unr-lcssa
  br label %if.end137

if.end137:                                        ; preds = %if.end137.loopexit, %middle.block386, %while.cond124.preheader
  %phitmp326 = bitcast i64* %call80 to i8*
  %phitmp327 = bitcast i64* %call to i8*
  %phitmp328 = bitcast i64* %call22 to i8*
  %phitmp329 = bitcast i64* %call46 to i8*
  %phitmp330 = bitcast i64* %call67 to i8*
  br i1 %cmp36, label %if.end140, label %if.then139

if.then139:                                       ; preds = %if.end137
  %phitmp = bitcast i64* %call35 to i8*
  tail call void @free(i8* %phitmp) #6
  br label %if.end140

if.end140:                                        ; preds = %if.end137, %if.then139
  br i1 %not.cmp81, label %if.end143, label %if.then142

if.then142:                                       ; preds = %if.end140
  tail call void @free(i8* %phitmp326) #6
  br label %if.end143

if.end143:                                        ; preds = %if.end140, %if.then142
  br i1 %not.cmp5, label %if.end146, label %if.then145

if.then145:                                       ; preds = %if.end143
  tail call void @free(i8* %phitmp327) #6
  br label %if.end146

if.end146:                                        ; preds = %if.end143, %if.then145
  br i1 %not.cmp27, label %if.end149, label %if.then148

if.then148:                                       ; preds = %if.end146
  tail call void @free(i8* %phitmp328) #6
  br label %if.end149

if.end149:                                        ; preds = %if.end146, %if.then148
  br i1 %not.cmp48, label %if.end152, label %if.then151

if.then151:                                       ; preds = %if.end149
  tail call void @free(i8* %phitmp329) #6
  br label %if.end152

if.end152:                                        ; preds = %if.end149, %if.then151
  br i1 %not.cmp72, label %if.end155, label %if.then154

if.then154:                                       ; preds = %if.end152
  tail call void @free(i8* %phitmp330) #6
  br label %if.end155

if.end155:                                        ; preds = %if.end152, %entry, %if.then154
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

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #3

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
  %4 = load i64, i64* %call3, align 8, !tbaa !1
  %call22 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #6
  %not.cmp23 = icmp eq i64* %call22, null
  %call30 = call i64* @copy1DArray_int64_t(i64* %call22, i64 %4) #6
  %not.cmp31 = icmp eq i64* %call30, null
  %cmp35200 = icmp sgt i64 %4, 0
  br i1 %cmp35200, label %if.end37.preheader, label %if.end47

if.end37.preheader:                               ; preds = %entry
  %min.iters.check = icmp ult i64 %4, 4
  br i1 %min.iters.check, label %if.end37.preheader218, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end37.preheader
  %n.vec = and i64 %4, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end37.preheader218, label %vector.ph

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
  %10 = bitcast i64* %call30 to <2 x i64>*
  store <2 x i64> %8, <2 x i64>* %10, align 8, !tbaa !1
  %11 = getelementptr i64, i64* %call30, i64 2
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
  %16 = getelementptr inbounds i64, i64* %call30, i64 %index
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
  %22 = getelementptr inbounds i64, i64* %call30, i64 %index.next
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
  br i1 %cmp.n, label %if.end47, label %if.end37.preheader218

if.end37.preheader218:                            ; preds = %middle.block, %min.iters.checked, %if.end37.preheader
  %index.0201.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end37.preheader ], [ %n.vec, %middle.block ]
  br label %if.end37

if.end37:                                         ; preds = %if.end37.preheader218, %if.end37
  %index.0201 = phi i64 [ %add, %if.end37 ], [ %index.0201.ph, %if.end37.preheader218 ]
  %sub = sub nsw i64 %4, %index.0201
  %arrayidx38 = getelementptr inbounds i64, i64* %call30, i64 %index.0201
  store i64 %sub, i64* %arrayidx38, align 8, !tbaa !1
  %add = add nuw nsw i64 %index.0201, 1
  %exitcond = icmp eq i64 %add, %4
  br i1 %exitcond, label %if.end47.loopexit, label %if.end37, !llvm.loop !27

if.end47.loopexit:                                ; preds = %if.end37
  br label %if.end47

if.end47:                                         ; preds = %if.end47.loopexit, %middle.block, %entry
  %call43 = call i64* @copy1DArray_int64_t(i64* %call30, i64 %4) #6
  %call44 = call i64* @_sortV1_(i64* %call43, i64 %4, i1 zeroext undef, i64 0, i64 %4, i64* nonnull %_15_size)
  %not.cmp48 = icmp eq i64* %call44, null
  br i1 %not.cmp31, label %blklab9, label %if.then53

if.then53:                                        ; preds = %if.end47
  %27 = bitcast i64* %call30 to i8*
  call void @free(i8* %27) #6
  br label %blklab9

blklab9:                                          ; preds = %if.then53, %if.end47
  %28 = load i64, i64* %_15_size, align 8, !tbaa !1
  %call55 = call i64* @copy1DArray_int64_t(i64* %call44, i64 %28) #6
  %not.cmp56 = icmp eq i64* %call55, null
  %29 = load i64, i64* %call55, align 8, !tbaa !1
  %call61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %29)
  %sub62 = add nsw i64 %4, -1
  %arrayidx63 = getelementptr inbounds i64, i64* %call55, i64 %sub62
  %30 = load i64, i64* %arrayidx63, align 8, !tbaa !1
  %call64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %30)
  %call68 = call i64* @create1DArray_int64_t(i64 0, i64 24) #6
  %31 = bitcast i64* %call68 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx71 = getelementptr inbounds i64, i64* %call68, i64 2
  %32 = bitcast i64* %arrayidx71 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx73 = getelementptr inbounds i64, i64* %call68, i64 4
  %33 = bitcast i64* %arrayidx73 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx75 = getelementptr inbounds i64, i64* %call68, i64 6
  %34 = bitcast i64* %arrayidx75 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx77 = getelementptr inbounds i64, i64* %call68, i64 8
  %35 = bitcast i64* %arrayidx77 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx79 = getelementptr inbounds i64, i64* %call68, i64 10
  %36 = bitcast i64* %arrayidx79 to <2 x i64>*
  store <2 x i64> <i64 115, i64 111>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx81 = getelementptr inbounds i64, i64* %call68, i64 12
  %37 = bitcast i64* %arrayidx81 to <2 x i64>*
  store <2 x i64> <i64 114, i64 116>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx83 = getelementptr inbounds i64, i64* %call68, i64 14
  %38 = bitcast i64* %arrayidx83 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx85 = getelementptr inbounds i64, i64* %call68, i64 16
  %39 = bitcast i64* %arrayidx85 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx87 = getelementptr inbounds i64, i64* %call68, i64 18
  %40 = bitcast i64* %arrayidx87 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %40, align 8, !tbaa !1
  %arrayidx89 = getelementptr inbounds i64, i64* %call68, i64 20
  %41 = bitcast i64* %arrayidx89 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %41, align 8, !tbaa !1
  %arrayidx91 = getelementptr inbounds i64, i64* %call68, i64 22
  %42 = bitcast i64* %arrayidx91 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %42, align 8, !tbaa !1
  %not.cmp93 = icmp eq i64* %call68, null
  call void @println_s(i64* %call68, i64 24) #6
  %phitmp = bitcast i64* %call68 to i8*
  %phitmp194 = bitcast i64* %call44 to i8*
  %phitmp195 = bitcast i64* %call22 to i8*
  br i1 %not.cmp56, label %if.end102, label %if.then101

if.then101:                                       ; preds = %blklab9
  %phitmp196 = bitcast i64* %call55 to i8*
  call void @free(i8* %phitmp196) #6
  br label %if.end102

if.end102:                                        ; preds = %blklab9, %if.then101
  br i1 %not.cmp4, label %if.end105, label %if.then104

if.then104:                                       ; preds = %if.end102
  %43 = bitcast i64* %call3 to i8*
  call void @free(i8* %43) #6
  br label %if.end105

if.end105:                                        ; preds = %if.end102, %if.then104
  br i1 %not.cmp, label %if.end111, label %if.then107

if.then107:                                       ; preds = %if.end105
  %44 = load i64, i64* %_6_size, align 8, !tbaa !1
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %44) #6
  br label %if.end111

if.end111:                                        ; preds = %if.end105, %if.then107
  br i1 %not.cmp23, label %if.end114, label %if.then113

if.then113:                                       ; preds = %if.end111
  call void @free(i8* %phitmp195) #6
  br label %if.end114

if.end114:                                        ; preds = %if.end111, %if.then113
  br i1 %not.cmp48, label %if.end117, label %if.then116

if.then116:                                       ; preds = %if.end114
  call void @free(i8* %phitmp194) #6
  br label %if.end117

if.end117:                                        ; preds = %if.end114, %if.then116
  br i1 %not.cmp93, label %if.end120, label %if.then119

if.then119:                                       ; preds = %if.end117
  call void @free(i8* %phitmp) #6
  br label %if.end120

if.end120:                                        ; preds = %if.end117, %if.then119
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
