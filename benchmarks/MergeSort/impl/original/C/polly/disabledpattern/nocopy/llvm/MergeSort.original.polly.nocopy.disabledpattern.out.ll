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
  %call3 = call i64* @_sortV1_(i64* %call, i64 %sub, i64 0, i64 %div, i64* nonnull %_16_size)
  %conv5 = trunc i64 %end to i32
  %call6 = tail call i64* @slice(i64* %items, i64 %items_size, i32 %conv2, i32 %conv5) #6
  %sub7 = sub nsw i64 %end, %div
  %call9 = call i64* @_sortV1_(i64* %call6, i64 %sub7, i64 0, i64 %sub7, i64* nonnull %_19_size)
  %sub10 = sub nsw i64 %end, %start
  %cmp11173 = icmp sgt i64 %sub10, 0
  %cmp16174 = icmp sgt i64 %sub, 0
  %or.cond175 = and i1 %cmp11173, %cmp16174
  %cmp21176 = icmp sgt i64 %sub7, 0
  %or.cond166177 = and i1 %cmp21176, %or.cond175
  br i1 %or.cond166177, label %if.end24.preheader, label %while.cond37.preheader

if.end24.preheader:                               ; preds = %if.end
  br label %if.end24

while.cond37.preheader.loopexit:                  ; preds = %blklab4
  br label %while.cond37.preheader

while.cond37.preheader:                           ; preds = %while.cond37.preheader.loopexit, %if.end
  %l.0.lcssa = phi i64 [ 0, %if.end ], [ %l.1, %while.cond37.preheader.loopexit ]
  %r.0.lcssa = phi i64 [ 0, %if.end ], [ %r.1, %while.cond37.preheader.loopexit ]
  %i.0.lcssa = phi i64 [ 0, %if.end ], [ %add36, %while.cond37.preheader.loopexit ]
  %cmp40170 = icmp sgt i64 %sub, %l.0.lcssa
  br i1 %cmp40170, label %if.end43.lr.ph, label %while.cond48.preheader

if.end43.lr.ph:                                   ; preds = %while.cond37.preheader
  %2 = sub i64 %sub, %l.0.lcssa
  %3 = add i64 %2, %i.0.lcssa
  %4 = sub i64 %div, %l.0.lcssa
  %5 = sub i64 %4, %start
  %min.iters.check = icmp ult i64 %5, 4
  br i1 %min.iters.check, label %if.end43.preheader, label %min.iters.checked

if.end43.preheader:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %if.end43.lr.ph
  %i.1172.ph = phi i64 [ %i.0.lcssa, %vector.memcheck ], [ %i.0.lcssa, %min.iters.checked ], [ %i.0.lcssa, %if.end43.lr.ph ], [ %ind.end, %middle.block ]
  %l.2171.ph = phi i64 [ %l.0.lcssa, %vector.memcheck ], [ %l.0.lcssa, %min.iters.checked ], [ %l.0.lcssa, %if.end43.lr.ph ], [ %ind.end199, %middle.block ]
  %6 = add i64 %i.0.lcssa, %div
  %7 = sub i64 %6, %i.1172.ph
  %8 = sub i64 %7, %l.0.lcssa
  %9 = sub i64 %8, %start
  %10 = add i64 %6, -1
  %11 = sub i64 %10, %i.1172.ph
  %12 = sub i64 %11, %l.0.lcssa
  %13 = sub i64 %12, %start
  %xtraiter252 = and i64 %9, 3
  %lcmp.mod253 = icmp eq i64 %xtraiter252, 0
  br i1 %lcmp.mod253, label %if.end43.prol.loopexit, label %if.end43.prol.preheader

if.end43.prol.preheader:                          ; preds = %if.end43.preheader
  br label %if.end43.prol

if.end43.prol:                                    ; preds = %if.end43.prol, %if.end43.prol.preheader
  %i.1172.prol = phi i64 [ %add46.prol, %if.end43.prol ], [ %i.1172.ph, %if.end43.prol.preheader ]
  %l.2171.prol = phi i64 [ %add47.prol, %if.end43.prol ], [ %l.2171.ph, %if.end43.prol.preheader ]
  %prol.iter254 = phi i64 [ %prol.iter254.sub, %if.end43.prol ], [ %xtraiter252, %if.end43.prol.preheader ]
  %arrayidx44186.prol = getelementptr inbounds i64, i64* %call, i64 %l.2171.prol
  %14 = load i64, i64* %arrayidx44186.prol, align 8, !tbaa !1
  %arrayidx45.prol = getelementptr inbounds i64, i64* %items, i64 %i.1172.prol
  store i64 %14, i64* %arrayidx45.prol, align 8, !tbaa !1
  %add46.prol = add nsw i64 %i.1172.prol, 1
  %add47.prol = add nsw i64 %l.2171.prol, 1
  %prol.iter254.sub = add i64 %prol.iter254, -1
  %prol.iter254.cmp = icmp eq i64 %prol.iter254.sub, 0
  br i1 %prol.iter254.cmp, label %if.end43.prol.loopexit.unr-lcssa, label %if.end43.prol, !llvm.loop !5

if.end43.prol.loopexit.unr-lcssa:                 ; preds = %if.end43.prol
  br label %if.end43.prol.loopexit

if.end43.prol.loopexit:                           ; preds = %if.end43.preheader, %if.end43.prol.loopexit.unr-lcssa
  %i.1172.unr = phi i64 [ %i.1172.ph, %if.end43.preheader ], [ %add46.prol, %if.end43.prol.loopexit.unr-lcssa ]
  %l.2171.unr = phi i64 [ %l.2171.ph, %if.end43.preheader ], [ %add47.prol, %if.end43.prol.loopexit.unr-lcssa ]
  %15 = icmp ult i64 %13, 3
  br i1 %15, label %while.cond48.preheader.loopexit, label %if.end43.preheader.new

if.end43.preheader.new:                           ; preds = %if.end43.prol.loopexit
  br label %if.end43

min.iters.checked:                                ; preds = %if.end43.lr.ph
  %n.vec = and i64 %5, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end43.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr i64, i64* %items, i64 %i.0.lcssa
  %16 = add i64 %i.0.lcssa, %div
  %17 = add i64 %l.0.lcssa, %start
  %18 = sub i64 %16, %17
  %scevgep192 = getelementptr i64, i64* %items, i64 %18
  %scevgep194 = getelementptr i64, i64* %call, i64 %l.0.lcssa
  %scevgep196 = getelementptr i64, i64* %call, i64 %sub
  %bound0 = icmp ult i64* %scevgep, %scevgep196
  %bound1 = icmp ult i64* %scevgep194, %scevgep192
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add i64 %i.0.lcssa, %n.vec
  %ind.end199 = add i64 %l.0.lcssa, %n.vec
  br i1 %memcheck.conflict, label %if.end43.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %19 = add i64 %n.vec, -4
  %20 = lshr exact i64 %19, 2
  %21 = and i64 %20, 1
  %lcmp.mod256 = icmp eq i64 %21, 0
  br i1 %lcmp.mod256, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %22 = getelementptr inbounds i64, i64* %call, i64 %l.0.lcssa
  %23 = bitcast i64* %22 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %23, align 8, !tbaa !1, !alias.scope !7
  %24 = getelementptr i64, i64* %22, i64 2
  %25 = bitcast i64* %24 to <2 x i64>*
  %wide.load206.prol = load <2 x i64>, <2 x i64>* %25, align 8, !tbaa !1, !alias.scope !7
  %26 = getelementptr inbounds i64, i64* %items, i64 %i.0.lcssa
  %27 = bitcast i64* %26 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %27, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %28 = getelementptr i64, i64* %26, i64 2
  %29 = bitcast i64* %28 to <2 x i64>*
  store <2 x i64> %wide.load206.prol, <2 x i64>* %29, align 8, !tbaa !1, !alias.scope !10, !noalias !7
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
  %wide.load206 = load <2 x i64>, <2 x i64>* %36, align 8, !tbaa !1, !alias.scope !7
  %37 = getelementptr inbounds i64, i64* %items, i64 %31
  %38 = bitcast i64* %37 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %38, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %39 = getelementptr i64, i64* %37, i64 2
  %40 = bitcast i64* %39 to <2 x i64>*
  store <2 x i64> %wide.load206, <2 x i64>* %40, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %41 = add i64 %i.0.lcssa, %index.next
  %42 = add i64 %l.0.lcssa, %index.next
  %43 = getelementptr inbounds i64, i64* %call, i64 %42
  %44 = bitcast i64* %43 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %44, align 8, !tbaa !1, !alias.scope !7
  %45 = getelementptr i64, i64* %43, i64 2
  %46 = bitcast i64* %45 to <2 x i64>*
  %wide.load206.1 = load <2 x i64>, <2 x i64>* %46, align 8, !tbaa !1, !alias.scope !7
  %47 = getelementptr inbounds i64, i64* %items, i64 %41
  %48 = bitcast i64* %47 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %48, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %49 = getelementptr i64, i64* %47, i64 2
  %50 = bitcast i64* %49 to <2 x i64>*
  store <2 x i64> %wide.load206.1, <2 x i64>* %50, align 8, !tbaa !1, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %51 = icmp eq i64 %index.next.1, %n.vec
  br i1 %51, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %5, %n.vec
  br i1 %cmp.n, label %while.cond48.preheader, label %if.end43.preheader

if.end24:                                         ; preds = %if.end24.preheader, %blklab4
  %i.0180 = phi i64 [ %add36, %blklab4 ], [ 0, %if.end24.preheader ]
  %r.0179 = phi i64 [ %r.1, %blklab4 ], [ 0, %if.end24.preheader ]
  %l.0178 = phi i64 [ %l.1, %blklab4 ], [ 0, %if.end24.preheader ]
  %arrayidx187 = getelementptr inbounds i64, i64* %call, i64 %l.0178
  %52 = load i64, i64* %arrayidx187, align 8, !tbaa !1
  %arrayidx25188 = getelementptr inbounds i64, i64* %call6, i64 %r.0179
  %53 = load i64, i64* %arrayidx25188, align 8, !tbaa !1
  %cmp26 = icmp sgt i64 %52, %53
  %arrayidx34 = getelementptr inbounds i64, i64* %items, i64 %i.0180
  br i1 %cmp26, label %blklab3, label %if.end29

if.end29:                                         ; preds = %if.end24
  store i64 %52, i64* %arrayidx34, align 8, !tbaa !1
  %add32 = add nsw i64 %l.0178, 1
  br label %blklab4

blklab3:                                          ; preds = %if.end24
  store i64 %53, i64* %arrayidx34, align 8, !tbaa !1
  %add35 = add nsw i64 %r.0179, 1
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end29
  %l.1 = phi i64 [ %l.0178, %blklab3 ], [ %add32, %if.end29 ]
  %r.1 = phi i64 [ %add35, %blklab3 ], [ %r.0179, %if.end29 ]
  %add36 = add nuw nsw i64 %i.0180, 1
  %cmp11 = icmp slt i64 %add36, %sub10
  %cmp16 = icmp slt i64 %l.1, %sub
  %or.cond = and i1 %cmp11, %cmp16
  %cmp21 = icmp slt i64 %r.1, %sub7
  %or.cond166 = and i1 %cmp21, %or.cond
  br i1 %or.cond166, label %if.end24, label %while.cond37.preheader.loopexit

while.cond48.preheader.loopexit.unr-lcssa:        ; preds = %if.end43
  br label %while.cond48.preheader.loopexit

while.cond48.preheader.loopexit:                  ; preds = %if.end43.prol.loopexit, %while.cond48.preheader.loopexit.unr-lcssa
  br label %while.cond48.preheader

while.cond48.preheader:                           ; preds = %while.cond48.preheader.loopexit, %middle.block, %while.cond37.preheader
  %i.1.lcssa = phi i64 [ %i.0.lcssa, %while.cond37.preheader ], [ %3, %middle.block ], [ %3, %while.cond48.preheader.loopexit ]
  %cmp51167 = icmp slt i64 %r.0.lcssa, %sub7
  br i1 %cmp51167, label %if.end54.preheader, label %blklab0

if.end54.preheader:                               ; preds = %while.cond48.preheader
  %54 = sub i64 %end, %r.0.lcssa
  %55 = sub i64 %54, %div
  %min.iters.check210 = icmp ult i64 %55, 4
  br i1 %min.iters.check210, label %if.end54.preheader249, label %min.iters.checked211

if.end54.preheader249:                            ; preds = %middle.block208, %vector.memcheck228, %min.iters.checked211, %if.end54.preheader
  %i.2169.ph = phi i64 [ %i.1.lcssa, %vector.memcheck228 ], [ %i.1.lcssa, %min.iters.checked211 ], [ %i.1.lcssa, %if.end54.preheader ], [ %ind.end233, %middle.block208 ]
  %r.2168.ph = phi i64 [ %r.0.lcssa, %vector.memcheck228 ], [ %r.0.lcssa, %min.iters.checked211 ], [ %r.0.lcssa, %if.end54.preheader ], [ %ind.end235, %middle.block208 ]
  %56 = sub i64 %end, %r.2168.ph
  %57 = sub i64 %56, %div
  %58 = add i64 %end, -1
  %59 = sub i64 %58, %r.2168.ph
  %60 = sub i64 %59, %div
  %xtraiter = and i64 %57, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %if.end54.prol.loopexit, label %if.end54.prol.preheader

if.end54.prol.preheader:                          ; preds = %if.end54.preheader249
  br label %if.end54.prol

if.end54.prol:                                    ; preds = %if.end54.prol, %if.end54.prol.preheader
  %i.2169.prol = phi i64 [ %add57.prol, %if.end54.prol ], [ %i.2169.ph, %if.end54.prol.preheader ]
  %r.2168.prol = phi i64 [ %add58.prol, %if.end54.prol ], [ %r.2168.ph, %if.end54.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end54.prol ], [ %xtraiter, %if.end54.prol.preheader ]
  %arrayidx55185.prol = getelementptr inbounds i64, i64* %call6, i64 %r.2168.prol
  %61 = load i64, i64* %arrayidx55185.prol, align 8, !tbaa !1
  %arrayidx56.prol = getelementptr inbounds i64, i64* %items, i64 %i.2169.prol
  store i64 %61, i64* %arrayidx56.prol, align 8, !tbaa !1
  %add57.prol = add nsw i64 %i.2169.prol, 1
  %add58.prol = add nsw i64 %r.2168.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %if.end54.prol.loopexit.unr-lcssa, label %if.end54.prol, !llvm.loop !15

if.end54.prol.loopexit.unr-lcssa:                 ; preds = %if.end54.prol
  br label %if.end54.prol.loopexit

if.end54.prol.loopexit:                           ; preds = %if.end54.preheader249, %if.end54.prol.loopexit.unr-lcssa
  %i.2169.unr = phi i64 [ %i.2169.ph, %if.end54.preheader249 ], [ %add57.prol, %if.end54.prol.loopexit.unr-lcssa ]
  %r.2168.unr = phi i64 [ %r.2168.ph, %if.end54.preheader249 ], [ %add58.prol, %if.end54.prol.loopexit.unr-lcssa ]
  %62 = icmp ult i64 %60, 3
  br i1 %62, label %blklab0.loopexit, label %if.end54.preheader249.new

if.end54.preheader249.new:                        ; preds = %if.end54.prol.loopexit
  br label %if.end54

min.iters.checked211:                             ; preds = %if.end54.preheader
  %n.vec213 = and i64 %55, -4
  %cmp.zero214 = icmp eq i64 %n.vec213, 0
  br i1 %cmp.zero214, label %if.end54.preheader249, label %vector.memcheck228

vector.memcheck228:                               ; preds = %min.iters.checked211
  %scevgep216 = getelementptr i64, i64* %items, i64 %i.1.lcssa
  %63 = add i64 %i.0.lcssa, %end
  %64 = icmp slt i64 %sub, %l.0.lcssa
  %smax = select i1 %64, i64 %l.0.lcssa, i64 %sub
  %65 = add i64 %63, %smax
  %66 = add i64 %l.0.lcssa, %r.0.lcssa
  %67 = add i64 %66, %div
  %68 = sub i64 %65, %67
  %scevgep218 = getelementptr i64, i64* %items, i64 %68
  %scevgep220 = getelementptr i64, i64* %call6, i64 %r.0.lcssa
  %scevgep222 = getelementptr i64, i64* %call6, i64 %sub7
  %bound0224 = icmp ult i64* %scevgep216, %scevgep222
  %bound1225 = icmp ult i64* %scevgep220, %scevgep218
  %memcheck.conflict227 = and i1 %bound0224, %bound1225
  %ind.end233 = add i64 %i.1.lcssa, %n.vec213
  %ind.end235 = add i64 %r.0.lcssa, %n.vec213
  br i1 %memcheck.conflict227, label %if.end54.preheader249, label %vector.body207.preheader

vector.body207.preheader:                         ; preds = %vector.memcheck228
  %69 = add i64 %n.vec213, -4
  %70 = lshr exact i64 %69, 2
  %71 = and i64 %70, 1
  %lcmp.mod251 = icmp eq i64 %71, 0
  br i1 %lcmp.mod251, label %vector.body207.prol.preheader, label %vector.body207.prol.loopexit

vector.body207.prol.preheader:                    ; preds = %vector.body207.preheader
  br label %vector.body207.prol

vector.body207.prol:                              ; preds = %vector.body207.prol.preheader
  %72 = getelementptr inbounds i64, i64* %call6, i64 %r.0.lcssa
  %73 = bitcast i64* %72 to <2 x i64>*
  %wide.load247.prol = load <2 x i64>, <2 x i64>* %73, align 8, !tbaa !1, !alias.scope !16
  %74 = getelementptr i64, i64* %72, i64 2
  %75 = bitcast i64* %74 to <2 x i64>*
  %wide.load248.prol = load <2 x i64>, <2 x i64>* %75, align 8, !tbaa !1, !alias.scope !16
  %76 = getelementptr inbounds i64, i64* %items, i64 %i.1.lcssa
  %77 = bitcast i64* %76 to <2 x i64>*
  store <2 x i64> %wide.load247.prol, <2 x i64>* %77, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %78 = getelementptr i64, i64* %76, i64 2
  %79 = bitcast i64* %78 to <2 x i64>*
  store <2 x i64> %wide.load248.prol, <2 x i64>* %79, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  br label %vector.body207.prol.loopexit

vector.body207.prol.loopexit:                     ; preds = %vector.body207.prol, %vector.body207.preheader
  %index230.unr = phi i64 [ 0, %vector.body207.preheader ], [ 4, %vector.body207.prol ]
  %80 = icmp eq i64 %70, 0
  br i1 %80, label %middle.block208, label %vector.body207.preheader.new

vector.body207.preheader.new:                     ; preds = %vector.body207.prol.loopexit
  br label %vector.body207

vector.body207:                                   ; preds = %vector.body207, %vector.body207.preheader.new
  %index230 = phi i64 [ %index230.unr, %vector.body207.preheader.new ], [ %index.next231.1, %vector.body207 ]
  %81 = add i64 %i.1.lcssa, %index230
  %82 = add i64 %r.0.lcssa, %index230
  %83 = getelementptr inbounds i64, i64* %call6, i64 %82
  %84 = bitcast i64* %83 to <2 x i64>*
  %wide.load247 = load <2 x i64>, <2 x i64>* %84, align 8, !tbaa !1, !alias.scope !16
  %85 = getelementptr i64, i64* %83, i64 2
  %86 = bitcast i64* %85 to <2 x i64>*
  %wide.load248 = load <2 x i64>, <2 x i64>* %86, align 8, !tbaa !1, !alias.scope !16
  %87 = getelementptr inbounds i64, i64* %items, i64 %81
  %88 = bitcast i64* %87 to <2 x i64>*
  store <2 x i64> %wide.load247, <2 x i64>* %88, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %89 = getelementptr i64, i64* %87, i64 2
  %90 = bitcast i64* %89 to <2 x i64>*
  store <2 x i64> %wide.load248, <2 x i64>* %90, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next231 = add i64 %index230, 4
  %91 = add i64 %i.1.lcssa, %index.next231
  %92 = add i64 %r.0.lcssa, %index.next231
  %93 = getelementptr inbounds i64, i64* %call6, i64 %92
  %94 = bitcast i64* %93 to <2 x i64>*
  %wide.load247.1 = load <2 x i64>, <2 x i64>* %94, align 8, !tbaa !1, !alias.scope !16
  %95 = getelementptr i64, i64* %93, i64 2
  %96 = bitcast i64* %95 to <2 x i64>*
  %wide.load248.1 = load <2 x i64>, <2 x i64>* %96, align 8, !tbaa !1, !alias.scope !16
  %97 = getelementptr inbounds i64, i64* %items, i64 %91
  %98 = bitcast i64* %97 to <2 x i64>*
  store <2 x i64> %wide.load247.1, <2 x i64>* %98, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %99 = getelementptr i64, i64* %97, i64 2
  %100 = bitcast i64* %99 to <2 x i64>*
  store <2 x i64> %wide.load248.1, <2 x i64>* %100, align 8, !tbaa !1, !alias.scope !19, !noalias !16
  %index.next231.1 = add i64 %index230, 8
  %101 = icmp eq i64 %index.next231.1, %n.vec213
  br i1 %101, label %middle.block208.unr-lcssa, label %vector.body207, !llvm.loop !21

middle.block208.unr-lcssa:                        ; preds = %vector.body207
  br label %middle.block208

middle.block208:                                  ; preds = %vector.body207.prol.loopexit, %middle.block208.unr-lcssa
  %cmp.n236 = icmp eq i64 %55, %n.vec213
  br i1 %cmp.n236, label %blklab0, label %if.end54.preheader249

if.end43:                                         ; preds = %if.end43, %if.end43.preheader.new
  %i.1172 = phi i64 [ %i.1172.unr, %if.end43.preheader.new ], [ %add46.3, %if.end43 ]
  %l.2171 = phi i64 [ %l.2171.unr, %if.end43.preheader.new ], [ %add47.3, %if.end43 ]
  %arrayidx44186 = getelementptr inbounds i64, i64* %call, i64 %l.2171
  %102 = load i64, i64* %arrayidx44186, align 8, !tbaa !1
  %arrayidx45 = getelementptr inbounds i64, i64* %items, i64 %i.1172
  store i64 %102, i64* %arrayidx45, align 8, !tbaa !1
  %add46 = add nsw i64 %i.1172, 1
  %add47 = add nsw i64 %l.2171, 1
  %arrayidx44186.1 = getelementptr inbounds i64, i64* %call, i64 %add47
  %103 = load i64, i64* %arrayidx44186.1, align 8, !tbaa !1
  %arrayidx45.1 = getelementptr inbounds i64, i64* %items, i64 %add46
  store i64 %103, i64* %arrayidx45.1, align 8, !tbaa !1
  %add46.1 = add nsw i64 %i.1172, 2
  %add47.1 = add nsw i64 %l.2171, 2
  %arrayidx44186.2 = getelementptr inbounds i64, i64* %call, i64 %add47.1
  %104 = load i64, i64* %arrayidx44186.2, align 8, !tbaa !1
  %arrayidx45.2 = getelementptr inbounds i64, i64* %items, i64 %add46.1
  store i64 %104, i64* %arrayidx45.2, align 8, !tbaa !1
  %add46.2 = add nsw i64 %i.1172, 3
  %add47.2 = add nsw i64 %l.2171, 3
  %arrayidx44186.3 = getelementptr inbounds i64, i64* %call, i64 %add47.2
  %105 = load i64, i64* %arrayidx44186.3, align 8, !tbaa !1
  %arrayidx45.3 = getelementptr inbounds i64, i64* %items, i64 %add46.2
  store i64 %105, i64* %arrayidx45.3, align 8, !tbaa !1
  %add46.3 = add nsw i64 %i.1172, 4
  %add47.3 = add nsw i64 %l.2171, 4
  %exitcond184.3 = icmp eq i64 %add46.3, %3
  br i1 %exitcond184.3, label %while.cond48.preheader.loopexit.unr-lcssa, label %if.end43, !llvm.loop !22

if.end54:                                         ; preds = %if.end54, %if.end54.preheader249.new
  %i.2169 = phi i64 [ %i.2169.unr, %if.end54.preheader249.new ], [ %add57.3, %if.end54 ]
  %r.2168 = phi i64 [ %r.2168.unr, %if.end54.preheader249.new ], [ %add58.3, %if.end54 ]
  %arrayidx55185 = getelementptr inbounds i64, i64* %call6, i64 %r.2168
  %106 = load i64, i64* %arrayidx55185, align 8, !tbaa !1
  %arrayidx56 = getelementptr inbounds i64, i64* %items, i64 %i.2169
  store i64 %106, i64* %arrayidx56, align 8, !tbaa !1
  %add57 = add nsw i64 %i.2169, 1
  %add58 = add nsw i64 %r.2168, 1
  %arrayidx55185.1 = getelementptr inbounds i64, i64* %call6, i64 %add58
  %107 = load i64, i64* %arrayidx55185.1, align 8, !tbaa !1
  %arrayidx56.1 = getelementptr inbounds i64, i64* %items, i64 %add57
  store i64 %107, i64* %arrayidx56.1, align 8, !tbaa !1
  %add57.1 = add nsw i64 %i.2169, 2
  %add58.1 = add nsw i64 %r.2168, 2
  %arrayidx55185.2 = getelementptr inbounds i64, i64* %call6, i64 %add58.1
  %108 = load i64, i64* %arrayidx55185.2, align 8, !tbaa !1
  %arrayidx56.2 = getelementptr inbounds i64, i64* %items, i64 %add57.1
  store i64 %108, i64* %arrayidx56.2, align 8, !tbaa !1
  %add57.2 = add nsw i64 %i.2169, 3
  %add58.2 = add nsw i64 %r.2168, 3
  %arrayidx55185.3 = getelementptr inbounds i64, i64* %call6, i64 %add58.2
  %109 = load i64, i64* %arrayidx55185.3, align 8, !tbaa !1
  %arrayidx56.3 = getelementptr inbounds i64, i64* %items, i64 %add57.2
  store i64 %109, i64* %arrayidx56.3, align 8, !tbaa !1
  %add57.3 = add nsw i64 %i.2169, 4
  %add58.3 = add nsw i64 %r.2168, 4
  %exitcond.3 = icmp eq i64 %add58.3, %sub7
  br i1 %exitcond.3, label %blklab0.loopexit.unr-lcssa, label %if.end54, !llvm.loop !23

blklab0.loopexit.unr-lcssa:                       ; preds = %if.end54
  br label %blklab0.loopexit

blklab0.loopexit:                                 ; preds = %if.end54.prol.loopexit, %blklab0.loopexit.unr-lcssa
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %middle.block208, %while.cond48.preheader, %entry
  store i64 %items_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #6
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #6
  ret i64* %items
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

declare i64* @slice(i64*, i64, i32, i32) local_unnamed_addr #2

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
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab9, label %if.end

if.end:                                           ; preds = %entry
  %4 = load i64, i64* %call1, align 8, !tbaa !1
  %call2 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #6
  %cmp375 = icmp sgt i64 %4, 0
  br i1 %cmp375, label %if.end5.preheader, label %blklab10

if.end5.preheader:                                ; preds = %if.end
  %min.iters.check = icmp ult i64 %4, 4
  br i1 %min.iters.check, label %if.end5.preheader79, label %min.iters.checked

min.iters.checked:                                ; preds = %if.end5.preheader
  %n.vec = and i64 %4, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %if.end5.preheader79, label %vector.ph

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
  %10 = bitcast i64* %call2 to <2 x i64>*
  store <2 x i64> %8, <2 x i64>* %10, align 8, !tbaa !1
  %11 = getelementptr i64, i64* %call2, i64 2
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
  %16 = getelementptr inbounds i64, i64* %call2, i64 %index
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
  %22 = getelementptr inbounds i64, i64* %call2, i64 %index.next
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
  br i1 %cmp.n, label %blklab10, label %if.end5.preheader79

if.end5.preheader79:                              ; preds = %middle.block, %min.iters.checked, %if.end5.preheader
  %index.076.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end5.preheader ], [ %n.vec, %middle.block ]
  br label %if.end5

if.end5:                                          ; preds = %if.end5.preheader79, %if.end5
  %index.076 = phi i64 [ %add, %if.end5 ], [ %index.076.ph, %if.end5.preheader79 ]
  %sub = sub nsw i64 %4, %index.076
  %arrayidx6 = getelementptr inbounds i64, i64* %call2, i64 %index.076
  store i64 %sub, i64* %arrayidx6, align 8, !tbaa !1
  %add = add nuw nsw i64 %index.076, 1
  %exitcond = icmp eq i64 %add, %4
  br i1 %exitcond, label %blklab10.loopexit, label %if.end5, !llvm.loop !27

blklab10.loopexit:                                ; preds = %if.end5
  br label %blklab10

blklab10:                                         ; preds = %blklab10.loopexit, %middle.block, %if.end
  %call7 = call i64* @_sortV1_(i64* %call2, i64 %4, i64 0, i64 %4, i64* nonnull %_15_size)
  %27 = load i64, i64* %call7, align 8, !tbaa !1
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %27)
  %sub10 = add nsw i64 %4, -1
  %arrayidx1177 = getelementptr inbounds i64, i64* %call2, i64 %sub10
  %28 = load i64, i64* %arrayidx1177, align 8, !tbaa !1
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %28)
  %call13 = call i64* @create1DArray_int64_t(i64 0, i64 24) #6
  %29 = bitcast i64* %call13 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %29, align 8, !tbaa !1
  %arrayidx16 = getelementptr inbounds i64, i64* %call13, i64 2
  %30 = bitcast i64* %arrayidx16 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %30, align 8, !tbaa !1
  %arrayidx18 = getelementptr inbounds i64, i64* %call13, i64 4
  %31 = bitcast i64* %arrayidx18 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx20 = getelementptr inbounds i64, i64* %call13, i64 6
  %32 = bitcast i64* %arrayidx20 to <2 x i64>*
  store <2 x i64> <i64 101, i64 114>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx22 = getelementptr inbounds i64, i64* %call13, i64 8
  %33 = bitcast i64* %arrayidx22 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx24 = getelementptr inbounds i64, i64* %call13, i64 10
  %34 = bitcast i64* %arrayidx24 to <2 x i64>*
  store <2 x i64> <i64 115, i64 111>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx26 = getelementptr inbounds i64, i64* %call13, i64 12
  %35 = bitcast i64* %arrayidx26 to <2 x i64>*
  store <2 x i64> <i64 114, i64 116>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx28 = getelementptr inbounds i64, i64* %call13, i64 14
  %36 = bitcast i64* %arrayidx28 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx30 = getelementptr inbounds i64, i64* %call13, i64 16
  %37 = bitcast i64* %arrayidx30 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx32 = getelementptr inbounds i64, i64* %call13, i64 18
  %38 = bitcast i64* %arrayidx32 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx34 = getelementptr inbounds i64, i64* %call13, i64 20
  %39 = bitcast i64* %arrayidx34 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx36 = getelementptr inbounds i64, i64* %call13, i64 22
  %40 = bitcast i64* %arrayidx36 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %40, align 8, !tbaa !1
  call void @println_s(i64* %call13, i64 24) #6
  br label %blklab9

blklab9:                                          ; preds = %entry, %blklab10
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
