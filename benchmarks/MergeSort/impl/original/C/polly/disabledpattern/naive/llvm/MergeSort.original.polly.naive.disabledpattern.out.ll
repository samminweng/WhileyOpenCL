; ModuleID = 'MergeSort_original.c'
source_filename = "MergeSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_sortV1_(i64* returned %items, i64 %items_size, i64 %start, i64 %end, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
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
  br i1 %cmp, label %if.end, label %blklab0

if.end:                                           ; preds = %entry
  %add1 = add nsw i64 %end, %start
  %div = sdiv i64 %add1, 2
  %conv = trunc i64 %start to i32
  %conv2 = trunc i64 %div to i32
  %call = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv, i32 %conv2) #6
  %sub = sub i64 %div, %start
  %call3 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 %sub) #6
  %call4 = tail call i64* @copy1DArray_int64_t(i64* %call3, i64 %sub) #6
  %call5 = call i64* @_sortV1_(i64* %call4, i64 %sub, i64 0, i64 %div, i64* nonnull %_16_size)
  %2 = load i64, i64* %_16_size, align 8, !tbaa !1
  %call6 = tail call i64* @copy1DArray_int64_t(i64* %call5, i64 %2) #6
  %conv8 = trunc i64 %end to i32
  %call9 = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv2, i32 %conv8) #6
  %sub10 = sub nsw i64 %end, %div
  %call11 = tail call i64* @copy1DArray_int64_t(i64* %call9, i64 %sub10) #6
  %call13 = tail call i64* @copy1DArray_int64_t(i64* %call11, i64 %sub10) #6
  %call14 = call i64* @_sortV1_(i64* %call13, i64 %sub10, i64 0, i64 %sub10, i64* nonnull %_19_size)
  %3 = load i64, i64* %_19_size, align 8, !tbaa !1
  %call15 = tail call i64* @copy1DArray_int64_t(i64* %call14, i64 %3) #6
  %sub16 = sub nsw i64 %end, %start
  %cmp17185 = icmp sgt i64 %sub16, 0
  %cmp22186 = icmp sgt i64 %sub, 0
  %or.cond187 = and i1 %cmp17185, %cmp22186
  %cmp27188 = icmp sgt i64 %sub10, 0
  %or.cond178189 = and i1 %cmp27188, %or.cond187
  br i1 %or.cond178189, label %if.end30.preheader, label %while.cond43.preheader

if.end30.preheader:                               ; preds = %if.end
  br label %if.end30

while.cond43.preheader.loopexit:                  ; preds = %blklab4
  br label %while.cond43.preheader

while.cond43.preheader:                           ; preds = %while.cond43.preheader.loopexit, %if.end
  %l.0.lcssa = phi i64 [ 0, %if.end ], [ %l.1, %while.cond43.preheader.loopexit ]
  %r.0.lcssa = phi i64 [ 0, %if.end ], [ %r.1, %while.cond43.preheader.loopexit ]
  %i.0.lcssa = phi i64 [ 0, %if.end ], [ %add42, %while.cond43.preheader.loopexit ]
  %cmp46182 = icmp sgt i64 %sub, %l.0.lcssa
  br i1 %cmp46182, label %if.end49.lr.ph, label %while.cond54.preheader

if.end49.lr.ph:                                   ; preds = %while.cond43.preheader
  %4 = sub i64 %sub, %l.0.lcssa
  %5 = add i64 %4, %i.0.lcssa
  %6 = sub i64 %div, %l.0.lcssa
  %7 = sub i64 %6, %start
  %min.iters.check = icmp ult i64 %7, 4
  br i1 %min.iters.check, label %if.end49.preheader, label %min.iters.checked

if.end49.preheader:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end49.lr.ph
  %i.1184.ph = phi i64 [ %i.0.lcssa, %vector.memcheck ], [ %i.0.lcssa, %min.iters.checked ], [ %i.0.lcssa, %if.end49.lr.ph ], [ %ind.end, %middle.block ]
  %l.2183.ph = phi i64 [ %l.0.lcssa, %vector.memcheck ], [ %l.0.lcssa, %min.iters.checked ], [ %l.0.lcssa, %if.end49.lr.ph ], [ %ind.end207, %middle.block ]
  %8 = add i64 %i.0.lcssa, %div
  %9 = sub i64 %8, %i.1184.ph
  %10 = sub i64 %9, %l.0.lcssa
  %11 = sub i64 %10, %start
  %12 = add i64 %8, -1
  %13 = sub i64 %12, %i.1184.ph
  %14 = sub i64 %13, %l.0.lcssa
  %15 = sub i64 %14, %start
  %xtraiter260 = and i64 %11, 3
  %lcmp.mod261 = icmp eq i64 %xtraiter260, 0
  br i1 %lcmp.mod261, label %if.end49.prol.loopexit, label %if.end49.prol.preheader

if.end49.prol.preheader:                          ; preds = %if.end49.preheader
  br label %if.end49.prol

if.end49.prol:                                    ; preds = %if.end49.prol, %if.end49.prol.preheader
  %i.1184.prol = phi i64 [ %add52.prol, %if.end49.prol ], [ %i.1184.ph, %if.end49.prol.preheader ]
  %l.2183.prol = phi i64 [ %add53.prol, %if.end49.prol ], [ %l.2183.ph, %if.end49.prol.preheader ]
  %prol.iter262 = phi i64 [ %prol.iter262.sub, %if.end49.prol ], [ %xtraiter260, %if.end49.prol.preheader ]
  %arrayidx50.prol = getelementptr inbounds i64, i64* %call6, i64 %l.2183.prol
  %16 = load i64, i64* %arrayidx50.prol, align 8, !tbaa !1
  %arrayidx51.prol = getelementptr inbounds i64, i64* %items, i64 %i.1184.prol
  store i64 %16, i64* %arrayidx51.prol, align 8, !tbaa !1
  %add52.prol = add nsw i64 %i.1184.prol, 1
  %add53.prol = add nsw i64 %l.2183.prol, 1
  %prol.iter262.sub = add i64 %prol.iter262, -1
  %prol.iter262.cmp = icmp eq i64 %prol.iter262.sub, 0
  br i1 %prol.iter262.cmp, label %if.end49.prol.loopexit.unr-lcssa, label %if.end49.prol, !llvm.loop !5

if.end49.prol.loopexit.unr-lcssa:                 ; preds = %if.end49.prol
  br label %if.end49.prol.loopexit

if.end49.prol.loopexit:                           ; preds = %if.end49.preheader, %if.end49.prol.loopexit.unr-lcssa
  %i.1184.unr = phi i64 [ %i.1184.ph, %if.end49.preheader ], [ %add52.prol, %if.end49.prol.loopexit.unr-lcssa ]
  %l.2183.unr = phi i64 [ %l.2183.ph, %if.end49.preheader ], [ %add53.prol, %if.end49.prol.loopexit.unr-lcssa ]
  %17 = icmp ult i64 %15, 3
  br i1 %17, label %while.cond54.preheader.loopexit, label %if.end49.preheader.new

if.end49.preheader.new:                           ; preds = %if.end49.prol.loopexit
  br label %if.end49

min.iters.checked:                                ; preds = %if.end49.lr.ph
  %n.vec = and i64 %7, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end49.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %18 = add i64 %i.0.lcssa, %div
  %19 = add i64 %l.0.lcssa, %start
  %20 = sub i64 %18, %19
  %scevgep200 = getelementptr i64, i64* %items, i64 %20
  %scevgep202 = getelementptr i64, i64* %call6, i64 %l.0.lcssa
  %scevgep204 = getelementptr i64, i64* %call6, i64 %sub
  %bound0 = icmp ult i64* %scevgep, %scevgep204
  %bound1 = icmp ult i64* %scevgep202, %scevgep200
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add i64 %i.0.lcssa, %n.vec
  %ind.end207 = add i64 %l.0.lcssa, %n.vec
  br i1 %memcheck.conflict, label %if.end49.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %21 = add i64 %n.vec, -4
  %22 = lshr exact i64 %21, 2
  %23 = and i64 %22, 1
  %lcmp.mod264 = icmp eq i64 %23, 0
  br i1 %lcmp.mod264, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %24 = getelementptr inbounds i64, i64* %call6, i64 %l.0.lcssa
  %25 = bitcast i64* %24 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %25, align 8, !tbaa !1, !alias.scope !7
  %26 = getelementptr i64, i64* %24, i64 2
  %27 = bitcast i64* %26 to <2 x i64>*
  %wide.load214.prol = load <2 x i64>, <2 x i64>* %27, align 8, !tbaa !1, !alias.scope !7
  %28 = getelementptr inbounds i64, i64* %items, i64 %i.0.lcssa
  %29 = bitcast i64* %28 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %29, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %30 = getelementptr i64, i64* %28, i64 2
  %31 = bitcast i64* %30 to <2 x i64>*
  store <2 x i64> %wide.load214.prol, <2 x i64>* %31, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %32 = icmp eq i64 %22, 0
  br i1 %32, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %33 = add i64 %i.0.lcssa, %index
  %34 = add i64 %l.0.lcssa, %index
  %35 = getelementptr inbounds i64, i64* %call6, i64 %34
  %36 = bitcast i64* %35 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %36, align 8, !tbaa !1, !alias.scope !7
  %37 = getelementptr i64, i64* %35, i64 2
  %38 = bitcast i64* %37 to <2 x i64>*
  %wide.load214 = load <2 x i64>, <2 x i64>* %38, align 8, !tbaa !1, !alias.scope !7
  %39 = getelementptr inbounds i64, i64* %items, i64 %33
  %40 = bitcast i64* %39 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %40, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %41 = getelementptr i64, i64* %39, i64 2
  %42 = bitcast i64* %41 to <2 x i64>*
  store <2 x i64> %wide.load214, <2 x i64>* %42, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %43 = add i64 %i.0.lcssa, %index.next
  %44 = add i64 %l.0.lcssa, %index.next
  %45 = getelementptr inbounds i64, i64* %call6, i64 %44
  %46 = bitcast i64* %45 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %46, align 8, !tbaa !1, !alias.scope !7
  %47 = getelementptr i64, i64* %45, i64 2
  %48 = bitcast i64* %47 to <2 x i64>*
  %wide.load214.1 = load <2 x i64>, <2 x i64>* %48, align 8, !tbaa !1, !alias.scope !7
  %49 = getelementptr inbounds i64, i64* %items, i64 %43
  %50 = bitcast i64* %49 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %50, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %51 = getelementptr i64, i64* %49, i64 2
  %52 = bitcast i64* %51 to <2 x i64>*
  store <2 x i64> %wide.load214.1, <2 x i64>* %52, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %53 = icmp eq i64 %index.next.1, %n.vec
  br i1 %53, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %7, %n.vec
  br i1 %cmp.n, label %while.cond54.preheader, label %if.end49.preheader

if.end30:                                         ; preds = %if.end30.preheader, %blklab4
  %i.0192 = phi i64 [ %add42, %blklab4 ], [ 0, %if.end30.preheader ]
  %r.0191 = phi i64 [ %r.1, %blklab4 ], [ 0, %if.end30.preheader ]
  %l.0190 = phi i64 [ %l.1, %blklab4 ], [ 0, %if.end30.preheader ]
  %arrayidx = getelementptr inbounds i64, i64* %call6, i64 %l.0190
  %54 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %arrayidx31 = getelementptr inbounds i64, i64* %call15, i64 %r.0191
  %55 = load i64, i64* %arrayidx31, align 8, !tbaa !1
  %cmp32 = icmp sgt i64 %54, %55
  %arrayidx40 = getelementptr inbounds i64, i64* %items, i64 %i.0192
  br i1 %cmp32, label %blklab3, label %if.end35

if.end35:                                         ; preds = %if.end30
  store i64 %54, i64* %arrayidx40, align 8, !tbaa !1
  %add38 = add nsw i64 %l.0190, 1
  br label %blklab4

blklab3:                                          ; preds = %if.end30
  store i64 %55, i64* %arrayidx40, align 8, !tbaa !1
  %add41 = add nsw i64 %r.0191, 1
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end35
  %l.1 = phi i64 [ %l.0190, %blklab3 ], [ %add38, %if.end35 ]
  %r.1 = phi i64 [ %add41, %blklab3 ], [ %r.0191, %if.end35 ]
  %add42 = add nuw nsw i64 %i.0192, 1
  %cmp17 = icmp slt i64 %add42, %sub16
  %cmp22 = icmp slt i64 %l.1, %sub
  %or.cond = and i1 %cmp17, %cmp22
  %cmp27 = icmp slt i64 %r.1, %sub10
  %or.cond178 = and i1 %cmp27, %or.cond
  br i1 %or.cond178, label %if.end30, label %while.cond43.preheader.loopexit

while.cond54.preheader.loopexit.unr-lcssa:        ; preds = %if.end49
  br label %while.cond54.preheader.loopexit

while.cond54.preheader.loopexit:                  ; preds = %if.end49.prol.loopexit, %while.cond54.preheader.loopexit.unr-lcssa
  br label %while.cond54.preheader

while.cond54.preheader:                           ; preds = %while.cond54.preheader.loopexit, %middle.block, %while.cond43.preheader
  %i.1.lcssa = phi i64 [ %i.0.lcssa, %while.cond43.preheader ], [ %5, %middle.block ], [ %5, %while.cond54.preheader.loopexit ]
  %cmp57179 = icmp slt i64 %r.0.lcssa, %sub10
  br i1 %cmp57179, label %if.end60.preheader, label %blklab0

if.end60.preheader:                               ; preds = %while.cond54.preheader
  %56 = sub i64 %end, %r.0.lcssa
  %57 = sub i64 %56, %div
  %min.iters.check218 = icmp ult i64 %57, 4
  br i1 %min.iters.check218, label %if.end60.preheader257, label %min.iters.checked219

if.end60.preheader257:                            ; preds = %middle.block216, %vector.memcheck236, %min.iters.checked219, %if.end60.preheader
  %i.2181.ph = phi i64 [ %i.1.lcssa, %vector.memcheck236 ], [ %i.1.lcssa, %min.iters.checked219 ], [ %i.1.lcssa, %if.end60.preheader ], [ %ind.end241, %middle.block216 ]
  %r.2180.ph = phi i64 [ %r.0.lcssa, %vector.memcheck236 ], [ %r.0.lcssa, %min.iters.checked219 ], [ %r.0.lcssa, %if.end60.preheader ], [ %ind.end243, %middle.block216 ]
  %58 = sub i64 %end, %r.2180.ph
  %59 = sub i64 %58, %div
  %60 = add i64 %end, -1
  %61 = sub i64 %60, %r.2180.ph
  %62 = sub i64 %61, %div
  %xtraiter = and i64 %59, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %if.end60.prol.loopexit, label %if.end60.prol.preheader

if.end60.prol.preheader:                          ; preds = %if.end60.preheader257
  br label %if.end60.prol

if.end60.prol:                                    ; preds = %if.end60.prol, %if.end60.prol.preheader
  %i.2181.prol = phi i64 [ %add63.prol, %if.end60.prol ], [ %i.2181.ph, %if.end60.prol.preheader ]
  %r.2180.prol = phi i64 [ %add64.prol, %if.end60.prol ], [ %r.2180.ph, %if.end60.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end60.prol ], [ %xtraiter, %if.end60.prol.preheader ]
  %arrayidx61.prol = getelementptr inbounds i64, i64* %call15, i64 %r.2180.prol
  %63 = load i64, i64* %arrayidx61.prol, align 8, !tbaa !1
  %arrayidx62.prol = getelementptr inbounds i64, i64* %items, i64 %i.2181.prol
  store i64 %63, i64* %arrayidx62.prol, align 8, !tbaa !1
  %add63.prol = add nsw i64 %i.2181.prol, 1
  %add64.prol = add nsw i64 %r.2180.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %if.end60.prol.loopexit.unr-lcssa, label %if.end60.prol, !llvm.loop !15

if.end60.prol.loopexit.unr-lcssa:                 ; preds = %if.end60.prol
  br label %if.end60.prol.loopexit

if.end60.prol.loopexit:                           ; preds = %if.end60.preheader257, %if.end60.prol.loopexit.unr-lcssa
  %i.2181.unr = phi i64 [ %i.2181.ph, %if.end60.preheader257 ], [ %add63.prol, %if.end60.prol.loopexit.unr-lcssa ]
  %r.2180.unr = phi i64 [ %r.2180.ph, %if.end60.preheader257 ], [ %add64.prol, %if.end60.prol.loopexit.unr-lcssa ]
  %64 = icmp ult i64 %62, 3
  br i1 %64, label %blklab0.loopexit, label %if.end60.preheader257.new

if.end60.preheader257.new:                        ; preds = %if.end60.prol.loopexit
  br label %if.end60

min.iters.checked219:                             ; preds = %if.end60.preheader
  %n.vec221 = and i64 %57, -4
  %cmp.zero222 = icmp eq i64 %n.vec221, 0
  br i1 %cmp.zero222, label %if.end60.preheader257, label %vector.memcheck236

vector.memcheck236:                               ; preds = %min.iters.checked219
  %scevgep224 = getelementptr i64, i64* %items, i64 %i.1.lcssa
  %65 = add i64 %i.0.lcssa, %end
  %66 = icmp slt i64 %sub, %l.0.lcssa
  %smax = select i1 %66, i64 %l.0.lcssa, i64 %sub
  %67 = add i64 %65, %smax
  %68 = add i64 %l.0.lcssa, %r.0.lcssa
  %69 = add i64 %68, %div
  %70 = sub i64 %67, %69
  %scevgep226 = getelementptr i64, i64* %items, i64 %70
  %scevgep228 = getelementptr i64, i64* %call15, i64 %r.0.lcssa
  %scevgep230 = getelementptr i64, i64* %call15, i64 %sub10
  %bound0232 = icmp ult i64* %scevgep224, %scevgep230
  %bound1233 = icmp ult i64* %scevgep228, %scevgep226
  %memcheck.conflict235 = and i1 %bound0232, %bound1233
  %ind.end241 = add i64 %i.1.lcssa, %n.vec221
  %ind.end243 = add i64 %r.0.lcssa, %n.vec221
  br i1 %memcheck.conflict235, label %if.end60.preheader257, label %vector.body215.preheader

vector.body215.preheader:                         ; preds = %vector.memcheck236
  %71 = add i64 %n.vec221, -4
  %72 = lshr exact i64 %71, 2
  %73 = and i64 %72, 1
  %lcmp.mod259 = icmp eq i64 %73, 0
  br i1 %lcmp.mod259, label %vector.body215.prol.preheader, label %vector.body215.prol.loopexit

vector.body215.prol.preheader:                    ; preds = %vector.body215.preheader
  br label %vector.body215.prol

vector.body215.prol:                              ; preds = %vector.body215.prol.preheader
  %74 = getelementptr inbounds i64, i64* %call15, i64 %r.0.lcssa
  %75 = bitcast i64* %74 to <2 x i64>*
  %wide.load255.prol = load <2 x i64>, <2 x i64>* %75, align 8, !tbaa !1, !alias.scope !16
  %76 = getelementptr i64, i64* %74, i64 2
  %77 = bitcast i64* %76 to <2 x i64>*
  %wide.load256.prol = load <2 x i64>, <2 x i64>* %77, align 8, !tbaa !1, !alias.scope !16
  %78 = getelementptr inbounds i64, i64* %items, i64 %i.1.lcssa
  %79 = bitcast i64* %78 to <2 x i64>*
  store <2 x i64> %wide.load255.prol, <2 x i64>* %79, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %80 = getelementptr i64, i64* %78, i64 2
  %81 = bitcast i64* %80 to <2 x i64>*
  store <2 x i64> %wide.load256.prol, <2 x i64>* %81, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  br label %vector.body215.prol.loopexit

vector.body215.prol.loopexit:                     ; preds = %vector.body215.prol, %vector.body215.preheader
  %index238.unr = phi i64 [ 0, %vector.body215.preheader ], [ 4, %vector.body215.prol ]
  %82 = icmp eq i64 %72, 0
  br i1 %82, label %middle.block216, label %vector.body215.preheader.new

vector.body215.preheader.new:                     ; preds = %vector.body215.prol.loopexit
  br label %vector.body215

vector.body215:                                   ; preds = %vector.body215, %vector.body215.preheader.new
  %index238 = phi i64 [ %index238.unr, %vector.body215.preheader.new ], [ %index.next239.1, %vector.body215 ]
  %83 = add i64 %i.1.lcssa, %index238
  %84 = add i64 %r.0.lcssa, %index238
  %85 = getelementptr inbounds i64, i64* %call15, i64 %84
  %86 = bitcast i64* %85 to <2 x i64>*
  %wide.load255 = load <2 x i64>, <2 x i64>* %86, align 8, !tbaa !1, !alias.scope !16
  %87 = getelementptr i64, i64* %85, i64 2
  %88 = bitcast i64* %87 to <2 x i64>*
  %wide.load256 = load <2 x i64>, <2 x i64>* %88, align 8, !tbaa !1, !alias.scope !16
  %89 = getelementptr inbounds i64, i64* %items, i64 %83
  %90 = bitcast i64* %89 to <2 x i64>*
  store <2 x i64> %wide.load255, <2 x i64>* %90, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %91 = getelementptr i64, i64* %89, i64 2
  %92 = bitcast i64* %91 to <2 x i64>*
  store <2 x i64> %wide.load256, <2 x i64>* %92, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next239 = add i64 %index238, 4
  %93 = add i64 %i.1.lcssa, %index.next239
  %94 = add i64 %r.0.lcssa, %index.next239
  %95 = getelementptr inbounds i64, i64* %call15, i64 %94
  %96 = bitcast i64* %95 to <2 x i64>*
  %wide.load255.1 = load <2 x i64>, <2 x i64>* %96, align 8, !tbaa !1, !alias.scope !16
  %97 = getelementptr i64, i64* %95, i64 2
  %98 = bitcast i64* %97 to <2 x i64>*
  %wide.load256.1 = load <2 x i64>, <2 x i64>* %98, align 8, !tbaa !1, !alias.scope !16
  %99 = getelementptr inbounds i64, i64* %items, i64 %93
  %100 = bitcast i64* %99 to <2 x i64>*
  store <2 x i64> %wide.load255.1, <2 x i64>* %100, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %101 = getelementptr i64, i64* %99, i64 2
  %102 = bitcast i64* %101 to <2 x i64>*
  store <2 x i64> %wide.load256.1, <2 x i64>* %102, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next239.1 = add i64 %index238, 8
  %103 = icmp eq i64 %index.next239.1, %n.vec221
  br i1 %103, label %middle.block216.unr-lcssa, label %vector.body215, !llvm.loop !21

middle.block216.unr-lcssa:                        ; preds = %vector.body215
  br label %middle.block216

middle.block216:                                  ; preds = %vector.body215.prol.loopexit, %middle.block216.unr-lcssa
  %cmp.n244 = icmp eq i64 %57, %n.vec221
  br i1 %cmp.n244, label %blklab0, label %if.end60.preheader257

if.end49:                                         ; preds = %if.end49, %if.end49.preheader.new
  %i.1184 = phi i64 [ %i.1184.unr, %if.end49.preheader.new ], [ %add52.3, %if.end49 ]
  %l.2183 = phi i64 [ %l.2183.unr, %if.end49.preheader.new ], [ %add53.3, %if.end49 ]
  %arrayidx50 = getelementptr inbounds i64, i64* %call6, i64 %l.2183
  %104 = load i64, i64* %arrayidx50, align 8, !tbaa !1
  %arrayidx51 = getelementptr inbounds i64, i64* %items, i64 %i.1184
  store i64 %104, i64* %arrayidx51, align 8, !tbaa !1
  %add52 = add nsw i64 %i.1184, 1
  %add53 = add nsw i64 %l.2183, 1
  %arrayidx50.1 = getelementptr inbounds i64, i64* %call6, i64 %add53
  %105 = load i64, i64* %arrayidx50.1, align 8, !tbaa !1
  %arrayidx51.1 = getelementptr inbounds i64, i64* %items, i64 %add52
  store i64 %105, i64* %arrayidx51.1, align 8, !tbaa !1
  %add52.1 = add nsw i64 %i.1184, 2
  %add53.1 = add nsw i64 %l.2183, 2
  %arrayidx50.2 = getelementptr inbounds i64, i64* %call6, i64 %add53.1
  %106 = load i64, i64* %arrayidx50.2, align 8, !tbaa !1
  %arrayidx51.2 = getelementptr inbounds i64, i64* %items, i64 %add52.1
  store i64 %106, i64* %arrayidx51.2, align 8, !tbaa !1
  %add52.2 = add nsw i64 %i.1184, 3
  %add53.2 = add nsw i64 %l.2183, 3
  %arrayidx50.3 = getelementptr inbounds i64, i64* %call6, i64 %add53.2
  %107 = load i64, i64* %arrayidx50.3, align 8, !tbaa !1
  %arrayidx51.3 = getelementptr inbounds i64, i64* %items, i64 %add52.2
  store i64 %107, i64* %arrayidx51.3, align 8, !tbaa !1
  %add52.3 = add nsw i64 %i.1184, 4
  %add53.3 = add nsw i64 %l.2183, 4
  %exitcond196.3 = icmp eq i64 %add52.3, %5
  br i1 %exitcond196.3, label %while.cond54.preheader.loopexit.unr-lcssa, label %if.end49, !llvm.loop !22

if.end60:                                         ; preds = %if.end60, %if.end60.preheader257.new
  %i.2181 = phi i64 [ %i.2181.unr, %if.end60.preheader257.new ], [ %add63.3, %if.end60 ]
  %r.2180 = phi i64 [ %r.2180.unr, %if.end60.preheader257.new ], [ %add64.3, %if.end60 ]
  %arrayidx61 = getelementptr inbounds i64, i64* %call15, i64 %r.2180
  %108 = load i64, i64* %arrayidx61, align 8, !tbaa !1
  %arrayidx62 = getelementptr inbounds i64, i64* %items, i64 %i.2181
  store i64 %108, i64* %arrayidx62, align 8, !tbaa !1
  %add63 = add nsw i64 %i.2181, 1
  %add64 = add nsw i64 %r.2180, 1
  %arrayidx61.1 = getelementptr inbounds i64, i64* %call15, i64 %add64
  %109 = load i64, i64* %arrayidx61.1, align 8, !tbaa !1
  %arrayidx62.1 = getelementptr inbounds i64, i64* %items, i64 %add63
  store i64 %109, i64* %arrayidx62.1, align 8, !tbaa !1
  %add63.1 = add nsw i64 %i.2181, 2
  %add64.1 = add nsw i64 %r.2180, 2
  %arrayidx61.2 = getelementptr inbounds i64, i64* %call15, i64 %add64.1
  %110 = load i64, i64* %arrayidx61.2, align 8, !tbaa !1
  %arrayidx62.2 = getelementptr inbounds i64, i64* %items, i64 %add63.1
  store i64 %110, i64* %arrayidx62.2, align 8, !tbaa !1
  %add63.2 = add nsw i64 %i.2181, 3
  %add64.2 = add nsw i64 %r.2180, 3
  %arrayidx61.3 = getelementptr inbounds i64, i64* %call15, i64 %add64.2
  %111 = load i64, i64* %arrayidx61.3, align 8, !tbaa !1
  %arrayidx62.3 = getelementptr inbounds i64, i64* %items, i64 %add63.2
  store i64 %111, i64* %arrayidx62.3, align 8, !tbaa !1
  %add63.3 = add nsw i64 %i.2181, 4
  %add64.3 = add nsw i64 %r.2180, 4
  %exitcond.3 = icmp eq i64 %add64.3, %sub10
  br i1 %exitcond.3, label %blklab0.loopexit.unr-lcssa, label %if.end60, !llvm.loop !23

blklab0.loopexit.unr-lcssa:                       ; preds = %if.end60
  br label %blklab0.loopexit

blklab0.loopexit:                                 ; preds = %if.end60.prol.loopexit, %blklab0.loopexit.unr-lcssa
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %middle.block216, %while.cond54.preheader, %entry
  store i64 %items_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #6
  ret i64* %items
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

declare i64* @slice(i64*, i64, i32, i32) local_unnamed_addr #2

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
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
  %3 = load i64*, i64** %call, align 8, !tbaa !24
  %call1 = call i64* @parseStringToInt(i64* %3) #6
  %4 = load i64, i64* %call1, align 8, !tbaa !1
  %call3 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #6
  %call4 = call i64* @copy1DArray_int64_t(i64* %call3, i64 %4) #6
  %cmp584 = icmp sgt i64 %4, 0
  br i1 %cmp584, label %if.end7.preheader, label %blklab10

if.end7.preheader:                                ; preds = %entry
  %min.iters.check = icmp ult i64 %4, 4
  br i1 %min.iters.check, label %if.end7.preheader87, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end7.preheader
  %n.vec = and i64 %4, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end7.preheader87, label %vector.ph

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
  %10 = bitcast i64* %call4 to <2 x i64>*
  store <2 x i64> %8, <2 x i64>* %10, align 8, !tbaa !1
  %11 = getelementptr i64, i64* %call4, i64 2
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
  %16 = getelementptr inbounds i64, i64* %call4, i64 %index
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
  %22 = getelementptr inbounds i64, i64* %call4, i64 %index.next
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
  br i1 %cmp.n, label %blklab10, label %if.end7.preheader87

if.end7.preheader87:                              ; preds = %middle.block, %min.iters.checked, %if.end7.preheader
  %index.085.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end7.preheader ], [ %n.vec, %middle.block ]
  br label %if.end7

if.end7:                                          ; preds = %if.end7.preheader87, %if.end7
  %index.085 = phi i64 [ %add, %if.end7 ], [ %index.085.ph, %if.end7.preheader87 ]
  %sub = sub nsw i64 %4, %index.085
  %arrayidx8 = getelementptr inbounds i64, i64* %call4, i64 %index.085
  store i64 %sub, i64* %arrayidx8, align 8, !tbaa !1
  %add = add nuw nsw i64 %index.085, 1
  %exitcond = icmp eq i64 %add, %4
  br i1 %exitcond, label %blklab10.loopexit, label %if.end7, !llvm.loop !27

blklab10.loopexit:                                ; preds = %if.end7
  br label %blklab10

blklab10:                                         ; preds = %blklab10.loopexit, %middle.block, %entry
  %call10 = call i64* @copy1DArray_int64_t(i64* %call4, i64 %4) #6
  %call11 = call i64* @_sortV1_(i64* %call10, i64 %4, i64 0, i64 %4, i64* nonnull %_15_size)
  %27 = load i64, i64* %_15_size, align 8, !tbaa !1
  %call12 = call i64* @copy1DArray_int64_t(i64* %call11, i64 %27) #6
  %28 = load i64, i64* %call12, align 8, !tbaa !1
  %call14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %28)
  %sub15 = add nsw i64 %4, -1
  %arrayidx16 = getelementptr inbounds i64, i64* %call12, i64 %sub15
  %29 = load i64, i64* %arrayidx16, align 8, !tbaa !1
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %29)
  %call18 = call i64* @create1DArray_int64_t(i64 0, i64 24) #6
  %30 = bitcast i64* %call18 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %30, align 8, !tbaa !1
  %arrayidx21 = getelementptr inbounds i64, i64* %call18, i64 2
  %31 = bitcast i64* %arrayidx21 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx23 = getelementptr inbounds i64, i64* %call18, i64 4
  %32 = bitcast i64* %arrayidx23 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx25 = getelementptr inbounds i64, i64* %call18, i64 6
  %33 = bitcast i64* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx27 = getelementptr inbounds i64, i64* %call18, i64 8
  %34 = bitcast i64* %arrayidx27 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx29 = getelementptr inbounds i64, i64* %call18, i64 10
  %35 = bitcast i64* %arrayidx29 to <2 x i64>*
  store <2 x i64> <i64 115, i64 111>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx31 = getelementptr inbounds i64, i64* %call18, i64 12
  %36 = bitcast i64* %arrayidx31 to <2 x i64>*
  store <2 x i64> <i64 114, i64 116>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx33 = getelementptr inbounds i64, i64* %call18, i64 14
  %37 = bitcast i64* %arrayidx33 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx35 = getelementptr inbounds i64, i64* %call18, i64 16
  %38 = bitcast i64* %arrayidx35 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx37 = getelementptr inbounds i64, i64* %call18, i64 18
  %39 = bitcast i64* %arrayidx37 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx39 = getelementptr inbounds i64, i64* %call18, i64 20
  %40 = bitcast i64* %arrayidx39 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %40, align 8, !tbaa !1
  %arrayidx41 = getelementptr inbounds i64, i64* %call18, i64 22
  %41 = bitcast i64* %arrayidx41 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %41, align 8, !tbaa !1
  call void @println_s(i64* %call18, i64 24) #6
  call void @exit(i32 0) #7
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #2

declare i64* @parseStringToInt(i64*) local_unnamed_addr #2

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #4

declare void @println_s(i64*, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
