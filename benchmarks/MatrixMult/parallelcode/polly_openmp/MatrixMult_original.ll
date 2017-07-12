; ModuleID = 'MatrixMult_original.c'
source_filename = "MatrixMult_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define i64* @_init_(i64* noalias returned %data, i64 %data_size, i64 %width, i64 %height, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %cmp29 = icmp sgt i64 %height, 0
  %cmp327 = icmp sgt i64 %width, 0
  %or.cond = and i1 %cmp29, %cmp327
  br i1 %or.cond, label %while.cond1.preheader.us.preheader, label %blklab0

while.cond1.preheader.us.preheader:               ; preds = %entry
  %0 = add i64 %width, -4
  %1 = lshr i64 %0, 2
  %2 = add nuw nsw i64 %1, 1
  %min.iters.check = icmp ult i64 %width, 4
  %n.vec = and i64 %width, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter = and i64 %2, 3
  %3 = icmp ult i64 %0, 12
  %unroll_iter = sub nsw i64 %2, %xtraiter
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %cmp.n = icmp eq i64 %n.vec, %width
  br label %while.cond1.preheader.us

while.cond1.preheader.us:                         ; preds = %while.cond1.preheader.us.preheader, %blklab2.loopexit.us
  %i.030.us = phi i64 [ %add7.us, %blklab2.loopexit.us ], [ 0, %while.cond1.preheader.us.preheader ]
  %mul.us = mul nsw i64 %i.030.us, %width
  %brmerge = or i1 %min.iters.check, %cmp.zero
  br i1 %brmerge, label %if.end5.us, label %vector.ph

vector.ph:                                        ; preds = %while.cond1.preheader.us
  %broadcast.splatinsert36 = insertelement <2 x i64> undef, i64 %i.030.us, i32 0
  %broadcast.splat37 = shufflevector <2 x i64> %broadcast.splatinsert36, <2 x i64> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert38 = insertelement <2 x i64> undef, i64 %i.030.us, i32 0
  %broadcast.splat39 = shufflevector <2 x i64> %broadcast.splatinsert38, <2 x i64> undef, <2 x i32> zeroinitializer
  br i1 %3, label %middle.block.unr-lcssa, label %vector.body

vector.body:                                      ; preds = %vector.ph, %vector.body
  %index = phi i64 [ %index.next.3, %vector.body ], [ 0, %vector.ph ]
  %niter = phi i64 [ %niter.nsub.3, %vector.body ], [ %unroll_iter, %vector.ph ]
  %4 = add nsw i64 %index, %mul.us
  %5 = getelementptr inbounds i64, i64* %data, i64 %4
  %6 = bitcast i64* %5 to <2 x i64>*
  store <2 x i64> %broadcast.splat37, <2 x i64>* %6, align 8, !tbaa !2
  %7 = getelementptr i64, i64* %5, i64 2
  %8 = bitcast i64* %7 to <2 x i64>*
  store <2 x i64> %broadcast.splat39, <2 x i64>* %8, align 8, !tbaa !2
  %index.next = or i64 %index, 4
  %9 = add nsw i64 %index.next, %mul.us
  %10 = getelementptr inbounds i64, i64* %data, i64 %9
  %11 = bitcast i64* %10 to <2 x i64>*
  store <2 x i64> %broadcast.splat37, <2 x i64>* %11, align 8, !tbaa !2
  %12 = getelementptr i64, i64* %10, i64 2
  %13 = bitcast i64* %12 to <2 x i64>*
  store <2 x i64> %broadcast.splat39, <2 x i64>* %13, align 8, !tbaa !2
  %index.next.1 = or i64 %index, 8
  %14 = add nsw i64 %index.next.1, %mul.us
  %15 = getelementptr inbounds i64, i64* %data, i64 %14
  %16 = bitcast i64* %15 to <2 x i64>*
  store <2 x i64> %broadcast.splat37, <2 x i64>* %16, align 8, !tbaa !2
  %17 = getelementptr i64, i64* %15, i64 2
  %18 = bitcast i64* %17 to <2 x i64>*
  store <2 x i64> %broadcast.splat39, <2 x i64>* %18, align 8, !tbaa !2
  %index.next.2 = or i64 %index, 12
  %19 = add nsw i64 %index.next.2, %mul.us
  %20 = getelementptr inbounds i64, i64* %data, i64 %19
  %21 = bitcast i64* %20 to <2 x i64>*
  store <2 x i64> %broadcast.splat37, <2 x i64>* %21, align 8, !tbaa !2
  %22 = getelementptr i64, i64* %20, i64 2
  %23 = bitcast i64* %22 to <2 x i64>*
  store <2 x i64> %broadcast.splat39, <2 x i64>* %23, align 8, !tbaa !2
  %index.next.3 = add i64 %index, 16
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !6

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  br i1 %lcmp.mod, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %index.epil = phi i64 [ %index.next.epil, %vector.body.epil ], [ %index.unr, %middle.block.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %vector.body.epil ], [ %xtraiter, %middle.block.unr-lcssa ]
  %24 = add nsw i64 %index.epil, %mul.us
  %25 = getelementptr inbounds i64, i64* %data, i64 %24
  %26 = bitcast i64* %25 to <2 x i64>*
  store <2 x i64> %broadcast.splat37, <2 x i64>* %26, align 8, !tbaa !2
  %27 = getelementptr i64, i64* %25, i64 2
  %28 = bitcast i64* %27 to <2 x i64>*
  store <2 x i64> %broadcast.splat39, <2 x i64>* %28, align 8, !tbaa !2
  %index.next.epil = add i64 %index.epil, 4
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %middle.block, label %vector.body.epil, !llvm.loop !9

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  br i1 %cmp.n, label %blklab2.loopexit.us, label %if.end5.us

if.end5.us:                                       ; preds = %middle.block, %while.cond1.preheader.us, %if.end5.us
  %j.028.us = phi i64 [ %add6.us, %if.end5.us ], [ 0, %while.cond1.preheader.us ], [ %n.vec, %middle.block ]
  %add.us = add nsw i64 %j.028.us, %mul.us
  %arrayidx.us = getelementptr inbounds i64, i64* %data, i64 %add.us
  store i64 %i.030.us, i64* %arrayidx.us, align 8, !tbaa !2
  %add6.us = add nuw nsw i64 %j.028.us, 1
  %exitcond.us = icmp eq i64 %add6.us, %width
  br i1 %exitcond.us, label %blklab2.loopexit.us, label %if.end5.us, !llvm.loop !11

blklab2.loopexit.us:                              ; preds = %if.end5.us, %middle.block
  %add7.us = add nuw nsw i64 %i.030.us, 1
  %exitcond32.us = icmp eq i64 %add7.us, %height
  br i1 %exitcond32.us, label %blklab0, label %while.cond1.preheader.us

blklab0:                                          ; preds = %blklab2.loopexit.us, %entry
  store i64 %data_size, i64* %_size_call_by_ref, align 8, !tbaa !2
  ret i64* %data
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind uwtable
define i64* @_mat_mult_(i64* noalias nocapture readonly %a, i64 %a_size, i64* noalias nocapture readonly %b, i64 %b_size, i64* noalias returned %data, i64 %data_size, i64 %width, i64 %height, i64* nocapture %_size_call_by_ref) local_unnamed_addr #2 {
entry:
  %polly.loop_guard = icmp sgt i64 %height, 0
  %polly.loop_guard77 = icmp sgt i64 %width, 0
  %or.cond = and i1 %polly.loop_guard, %polly.loop_guard77
  br i1 %or.cond, label %polly.loop_header.us.preheader, label %polly.exiting

polly.loop_header.us.preheader:                   ; preds = %entry
  %0 = add i64 %width, -1
  %xtraiter = and i64 %width, 3
  %1 = icmp ult i64 %0, 3
  %unroll_iter = sub i64 %width, %xtraiter
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br label %polly.loop_header.us

polly.loop_header.us:                             ; preds = %polly.loop_header.us.preheader, %polly.loop_exit76.loopexit.us
  %polly.indvar.us = phi i64 [ %polly.indvar_next.us, %polly.loop_exit76.loopexit.us ], [ 0, %polly.loop_header.us.preheader ]
  %2 = mul i64 %polly.indvar.us, %width
  %scevgep.us = getelementptr i64, i64* %a, i64 %2
  %scevgep93.us = getelementptr i64, i64* %data, i64 %2
  br label %polly.loop_preheader83.us

polly.loop_preheader83.us:                        ; preds = %polly.stmt.blklab8.us, %polly.loop_header.us
  %polly.indvar78.us = phi i64 [ 0, %polly.loop_header.us ], [ %polly.indvar_next79.us, %polly.stmt.blklab8.us ]
  %scevgep90.us = getelementptr i64, i64* %b, i64 %polly.indvar78.us
  br i1 %1, label %polly.stmt.blklab8.us.unr-lcssa, label %polly.loop_header82.us

polly.loop_header82.us:                           ; preds = %polly.loop_preheader83.us, %polly.loop_header82.us
  %sub_total.063.phiops.0.us = phi i64 [ %p_add15.us.3, %polly.loop_header82.us ], [ 0, %polly.loop_preheader83.us ]
  %polly.indvar86.us = phi i64 [ %polly.indvar_next87.us.3, %polly.loop_header82.us ], [ 0, %polly.loop_preheader83.us ]
  %niter = phi i64 [ %niter.nsub.3, %polly.loop_header82.us ], [ %unroll_iter, %polly.loop_preheader83.us ]
  %scevgep89.us = getelementptr i64, i64* %scevgep.us, i64 %polly.indvar86.us
  %_p_scalar_.us = load i64, i64* %scevgep89.us, align 8, !alias.scope !13, !noalias !15
  %3 = mul i64 %polly.indvar86.us, %width
  %scevgep91.us = getelementptr i64, i64* %scevgep90.us, i64 %3
  %_p_scalar_92.us = load i64, i64* %scevgep91.us, align 8, !alias.scope !18, !noalias !21
  %p_mul14.us = mul nsw i64 %_p_scalar_92.us, %_p_scalar_.us
  %p_add15.us = add nsw i64 %p_mul14.us, %sub_total.063.phiops.0.us
  %polly.indvar_next87.us = or i64 %polly.indvar86.us, 1
  %scevgep89.us.1 = getelementptr i64, i64* %scevgep.us, i64 %polly.indvar_next87.us
  %_p_scalar_.us.1 = load i64, i64* %scevgep89.us.1, align 8, !alias.scope !13, !noalias !15
  %4 = mul i64 %polly.indvar_next87.us, %width
  %scevgep91.us.1 = getelementptr i64, i64* %scevgep90.us, i64 %4
  %_p_scalar_92.us.1 = load i64, i64* %scevgep91.us.1, align 8, !alias.scope !18, !noalias !21
  %p_mul14.us.1 = mul nsw i64 %_p_scalar_92.us.1, %_p_scalar_.us.1
  %p_add15.us.1 = add nsw i64 %p_mul14.us.1, %p_add15.us
  %polly.indvar_next87.us.1 = or i64 %polly.indvar86.us, 2
  %scevgep89.us.2 = getelementptr i64, i64* %scevgep.us, i64 %polly.indvar_next87.us.1
  %_p_scalar_.us.2 = load i64, i64* %scevgep89.us.2, align 8, !alias.scope !13, !noalias !15
  %5 = mul i64 %polly.indvar_next87.us.1, %width
  %scevgep91.us.2 = getelementptr i64, i64* %scevgep90.us, i64 %5
  %_p_scalar_92.us.2 = load i64, i64* %scevgep91.us.2, align 8, !alias.scope !18, !noalias !21
  %p_mul14.us.2 = mul nsw i64 %_p_scalar_92.us.2, %_p_scalar_.us.2
  %p_add15.us.2 = add nsw i64 %p_mul14.us.2, %p_add15.us.1
  %polly.indvar_next87.us.2 = or i64 %polly.indvar86.us, 3
  %scevgep89.us.3 = getelementptr i64, i64* %scevgep.us, i64 %polly.indvar_next87.us.2
  %_p_scalar_.us.3 = load i64, i64* %scevgep89.us.3, align 8, !alias.scope !13, !noalias !15
  %6 = mul i64 %polly.indvar_next87.us.2, %width
  %scevgep91.us.3 = getelementptr i64, i64* %scevgep90.us, i64 %6
  %_p_scalar_92.us.3 = load i64, i64* %scevgep91.us.3, align 8, !alias.scope !18, !noalias !21
  %p_mul14.us.3 = mul nsw i64 %_p_scalar_92.us.3, %_p_scalar_.us.3
  %p_add15.us.3 = add nsw i64 %p_mul14.us.3, %p_add15.us.2
  %polly.indvar_next87.us.3 = add nsw i64 %polly.indvar86.us, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %polly.stmt.blklab8.us.unr-lcssa, label %polly.loop_header82.us

polly.stmt.blklab8.us.unr-lcssa:                  ; preds = %polly.loop_header82.us, %polly.loop_preheader83.us
  %p_add15.us.lcssa.ph = phi i64 [ undef, %polly.loop_preheader83.us ], [ %p_add15.us.3, %polly.loop_header82.us ]
  %sub_total.063.phiops.0.us.unr = phi i64 [ 0, %polly.loop_preheader83.us ], [ %p_add15.us.3, %polly.loop_header82.us ]
  %polly.indvar86.us.unr = phi i64 [ 0, %polly.loop_preheader83.us ], [ %polly.indvar_next87.us.3, %polly.loop_header82.us ]
  br i1 %lcmp.mod, label %polly.stmt.blklab8.us, label %polly.loop_header82.us.epil

polly.loop_header82.us.epil:                      ; preds = %polly.stmt.blklab8.us.unr-lcssa, %polly.loop_header82.us.epil
  %sub_total.063.phiops.0.us.epil = phi i64 [ %p_add15.us.epil, %polly.loop_header82.us.epil ], [ %sub_total.063.phiops.0.us.unr, %polly.stmt.blklab8.us.unr-lcssa ]
  %polly.indvar86.us.epil = phi i64 [ %polly.indvar_next87.us.epil, %polly.loop_header82.us.epil ], [ %polly.indvar86.us.unr, %polly.stmt.blklab8.us.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %polly.loop_header82.us.epil ], [ %xtraiter, %polly.stmt.blklab8.us.unr-lcssa ]
  %scevgep89.us.epil = getelementptr i64, i64* %scevgep.us, i64 %polly.indvar86.us.epil
  %_p_scalar_.us.epil = load i64, i64* %scevgep89.us.epil, align 8, !alias.scope !13, !noalias !15
  %7 = mul i64 %polly.indvar86.us.epil, %width
  %scevgep91.us.epil = getelementptr i64, i64* %scevgep90.us, i64 %7
  %_p_scalar_92.us.epil = load i64, i64* %scevgep91.us.epil, align 8, !alias.scope !18, !noalias !21
  %p_mul14.us.epil = mul nsw i64 %_p_scalar_92.us.epil, %_p_scalar_.us.epil
  %p_add15.us.epil = add nsw i64 %p_mul14.us.epil, %sub_total.063.phiops.0.us.epil
  %polly.indvar_next87.us.epil = add nuw nsw i64 %polly.indvar86.us.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %polly.stmt.blklab8.us, label %polly.loop_header82.us.epil, !llvm.loop !22

polly.stmt.blklab8.us:                            ; preds = %polly.loop_header82.us.epil, %polly.stmt.blklab8.us.unr-lcssa
  %p_add15.us.lcssa = phi i64 [ %p_add15.us.lcssa.ph, %polly.stmt.blklab8.us.unr-lcssa ], [ %p_add15.us.epil, %polly.loop_header82.us.epil ]
  %scevgep94.us = getelementptr i64, i64* %scevgep93.us, i64 %polly.indvar78.us
  store i64 %p_add15.us.lcssa, i64* %scevgep94.us, align 8, !alias.scope !20, !noalias !23
  %polly.indvar_next79.us = add nuw nsw i64 %polly.indvar78.us, 1
  %exitcond97 = icmp eq i64 %polly.indvar_next79.us, %width
  br i1 %exitcond97, label %polly.loop_exit76.loopexit.us, label %polly.loop_preheader83.us

polly.loop_exit76.loopexit.us:                    ; preds = %polly.stmt.blklab8.us
  %polly.indvar_next.us = add nuw nsw i64 %polly.indvar.us, 1
  %exitcond98 = icmp eq i64 %polly.indvar_next.us, %height
  br i1 %exitcond98, label %polly.exiting, label %polly.loop_header.us

polly.exiting:                                    ; preds = %polly.loop_exit76.loopexit.us, %entry
  store i64 %data_size, i64* %_size_call_by_ref, align 8, !tbaa !2
  ret i64* %data
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
entry:
  %_9_size = alloca i64, align 8
  %_9_size_size = alloca i64, align 8
  %0 = bitcast i64* %_9_size to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #7
  store i64 0, i64* %_9_size, align 8, !tbaa !2
  %1 = bitcast i64* %_9_size_size to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #7
  store i64 0, i64* %_9_size_size, align 8, !tbaa !2
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_9_size, i64* nonnull %_9_size_size) #7
  %2 = load i64*, i64** %call, align 8, !tbaa !24
  %call1 = call i64* @parseStringToInt(i64* %2) #7
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab10, label %if.end

if.end:                                           ; preds = %entry
  %3 = load i64, i64* %call1, align 8, !tbaa !2
  %call2 = call i64* @create1DArray_int64_t(i64 0, i64 7) #7
  %4 = bitcast i64* %call2 to <2 x i64>*
  store <2 x i64> <i64 115, i64 105>, <2 x i64>* %4, align 8, !tbaa !2
  %arrayidx5 = getelementptr inbounds i64, i64* %call2, i64 2
  %5 = bitcast i64* %arrayidx5 to <2 x i64>*
  store <2 x i64> <i64 122, i64 101>, <2 x i64>* %5, align 8, !tbaa !2
  %arrayidx7 = getelementptr inbounds i64, i64* %call2, i64 4
  %6 = bitcast i64* %arrayidx7 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %6, align 8, !tbaa !2
  %arrayidx9 = getelementptr inbounds i64, i64* %call2, i64 6
  store i64 32, i64* %arrayidx9, align 8, !tbaa !2
  call void @printf_s(i64* %call2, i64 7) #7
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %3)
  %mul = mul i64 %3, %3
  %call11 = call i64* @create1DArray_int64_t(i64 0, i64 %mul) #7
  %cmp29.i = icmp sgt i64 %3, 0
  br i1 %cmp29.i, label %while.cond1.preheader.us.i.preheader, label %_init_.exit177.thread

while.cond1.preheader.us.i.preheader:             ; preds = %if.end
  %7 = add i64 %3, -4
  %8 = lshr i64 %7, 2
  %9 = add nuw nsw i64 %8, 1
  %min.iters.check = icmp ult i64 %3, 4
  %n.vec = and i64 %3, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter214 = and i64 %9, 3
  %10 = icmp ult i64 %7, 12
  %unroll_iter217 = sub nsw i64 %9, %xtraiter214
  %lcmp.mod216 = icmp eq i64 %xtraiter214, 0
  %cmp.n = icmp eq i64 %3, %n.vec
  br label %while.cond1.preheader.us.i

while.cond1.preheader.us.i:                       ; preds = %while.cond1.preheader.us.i.preheader, %blklab2.loopexit.us.i
  %i.030.us.i = phi i64 [ %add7.us.i, %blklab2.loopexit.us.i ], [ 0, %while.cond1.preheader.us.i.preheader ]
  %mul.us.i = mul nsw i64 %i.030.us.i, %3
  %brmerge = or i1 %min.iters.check, %cmp.zero
  br i1 %brmerge, label %if.end5.us.i, label %vector.ph

vector.ph:                                        ; preds = %while.cond1.preheader.us.i
  %broadcast.splatinsert183 = insertelement <2 x i64> undef, i64 %i.030.us.i, i32 0
  %broadcast.splat184 = shufflevector <2 x i64> %broadcast.splatinsert183, <2 x i64> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert185 = insertelement <2 x i64> undef, i64 %i.030.us.i, i32 0
  %broadcast.splat186 = shufflevector <2 x i64> %broadcast.splatinsert185, <2 x i64> undef, <2 x i32> zeroinitializer
  br i1 %10, label %middle.block.unr-lcssa, label %vector.body

vector.body:                                      ; preds = %vector.ph, %vector.body
  %index = phi i64 [ %index.next.3, %vector.body ], [ 0, %vector.ph ]
  %niter218 = phi i64 [ %niter218.nsub.3, %vector.body ], [ %unroll_iter217, %vector.ph ]
  %11 = add nsw i64 %index, %mul.us.i
  %12 = getelementptr inbounds i64, i64* %call11, i64 %11
  %13 = bitcast i64* %12 to <2 x i64>*
  store <2 x i64> %broadcast.splat184, <2 x i64>* %13, align 8, !tbaa !2, !alias.scope !26
  %14 = getelementptr i64, i64* %12, i64 2
  %15 = bitcast i64* %14 to <2 x i64>*
  store <2 x i64> %broadcast.splat186, <2 x i64>* %15, align 8, !tbaa !2, !alias.scope !26
  %index.next = or i64 %index, 4
  %16 = add nsw i64 %index.next, %mul.us.i
  %17 = getelementptr inbounds i64, i64* %call11, i64 %16
  %18 = bitcast i64* %17 to <2 x i64>*
  store <2 x i64> %broadcast.splat184, <2 x i64>* %18, align 8, !tbaa !2, !alias.scope !26
  %19 = getelementptr i64, i64* %17, i64 2
  %20 = bitcast i64* %19 to <2 x i64>*
  store <2 x i64> %broadcast.splat186, <2 x i64>* %20, align 8, !tbaa !2, !alias.scope !26
  %index.next.1 = or i64 %index, 8
  %21 = add nsw i64 %index.next.1, %mul.us.i
  %22 = getelementptr inbounds i64, i64* %call11, i64 %21
  %23 = bitcast i64* %22 to <2 x i64>*
  store <2 x i64> %broadcast.splat184, <2 x i64>* %23, align 8, !tbaa !2, !alias.scope !26
  %24 = getelementptr i64, i64* %22, i64 2
  %25 = bitcast i64* %24 to <2 x i64>*
  store <2 x i64> %broadcast.splat186, <2 x i64>* %25, align 8, !tbaa !2, !alias.scope !26
  %index.next.2 = or i64 %index, 12
  %26 = add nsw i64 %index.next.2, %mul.us.i
  %27 = getelementptr inbounds i64, i64* %call11, i64 %26
  %28 = bitcast i64* %27 to <2 x i64>*
  store <2 x i64> %broadcast.splat184, <2 x i64>* %28, align 8, !tbaa !2, !alias.scope !26
  %29 = getelementptr i64, i64* %27, i64 2
  %30 = bitcast i64* %29 to <2 x i64>*
  store <2 x i64> %broadcast.splat186, <2 x i64>* %30, align 8, !tbaa !2, !alias.scope !26
  %index.next.3 = add i64 %index, 16
  %niter218.nsub.3 = add i64 %niter218, -4
  %niter218.ncmp.3 = icmp eq i64 %niter218.nsub.3, 0
  br i1 %niter218.ncmp.3, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !29

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  br i1 %lcmp.mod216, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %index.epil = phi i64 [ %index.next.epil, %vector.body.epil ], [ %index.unr, %middle.block.unr-lcssa ]
  %epil.iter215 = phi i64 [ %epil.iter215.sub, %vector.body.epil ], [ %xtraiter214, %middle.block.unr-lcssa ]
  %31 = add nsw i64 %index.epil, %mul.us.i
  %32 = getelementptr inbounds i64, i64* %call11, i64 %31
  %33 = bitcast i64* %32 to <2 x i64>*
  store <2 x i64> %broadcast.splat184, <2 x i64>* %33, align 8, !tbaa !2, !alias.scope !26
  %34 = getelementptr i64, i64* %32, i64 2
  %35 = bitcast i64* %34 to <2 x i64>*
  store <2 x i64> %broadcast.splat186, <2 x i64>* %35, align 8, !tbaa !2, !alias.scope !26
  %index.next.epil = add i64 %index.epil, 4
  %epil.iter215.sub = add i64 %epil.iter215, -1
  %epil.iter215.cmp = icmp eq i64 %epil.iter215.sub, 0
  br i1 %epil.iter215.cmp, label %middle.block, label %vector.body.epil, !llvm.loop !30

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  br i1 %cmp.n, label %blklab2.loopexit.us.i, label %if.end5.us.i

if.end5.us.i:                                     ; preds = %middle.block, %while.cond1.preheader.us.i, %if.end5.us.i
  %j.028.us.i = phi i64 [ %add6.us.i, %if.end5.us.i ], [ 0, %while.cond1.preheader.us.i ], [ %n.vec, %middle.block ]
  %add.us.i = add nsw i64 %j.028.us.i, %mul.us.i
  %arrayidx.us.i = getelementptr inbounds i64, i64* %call11, i64 %add.us.i
  store i64 %i.030.us.i, i64* %arrayidx.us.i, align 8, !tbaa !2, !alias.scope !26
  %add6.us.i = add nuw nsw i64 %j.028.us.i, 1
  %exitcond.us.i = icmp eq i64 %add6.us.i, %3
  br i1 %exitcond.us.i, label %blklab2.loopexit.us.i, label %if.end5.us.i, !llvm.loop !31

blklab2.loopexit.us.i:                            ; preds = %if.end5.us.i, %middle.block
  %add7.us.i = add nuw nsw i64 %i.030.us.i, 1
  %exitcond32.us.i = icmp eq i64 %add7.us.i, %3
  br i1 %exitcond32.us.i, label %while.cond1.preheader.us.i167.preheader, label %while.cond1.preheader.us.i

while.cond1.preheader.us.i167.preheader:          ; preds = %blklab2.loopexit.us.i
  %call14 = call i64* @create1DArray_int64_t(i64 0, i64 %mul) #7
  %36 = add i64 %3, -4
  %37 = lshr i64 %36, 2
  %38 = add nuw nsw i64 %37, 1
  %min.iters.check190 = icmp ult i64 %3, 4
  %n.vec193 = and i64 %3, -4
  %cmp.zero194 = icmp eq i64 %n.vec193, 0
  %xtraiter209 = and i64 %38, 3
  %39 = icmp ult i64 %36, 12
  %unroll_iter212 = sub nsw i64 %38, %xtraiter209
  %lcmp.mod211 = icmp eq i64 %xtraiter209, 0
  %cmp.n199 = icmp eq i64 %3, %n.vec193
  br label %while.cond1.preheader.us.i167

while.cond1.preheader.us.i167:                    ; preds = %while.cond1.preheader.us.i167.preheader, %blklab2.loopexit.us.i176
  %i.030.us.i165 = phi i64 [ %add7.us.i174, %blklab2.loopexit.us.i176 ], [ 0, %while.cond1.preheader.us.i167.preheader ]
  %mul.us.i166 = mul nsw i64 %i.030.us.i165, %3
  %brmerge219 = or i1 %min.iters.check190, %cmp.zero194
  br i1 %brmerge219, label %if.end5.us.i173, label %vector.ph195

vector.ph195:                                     ; preds = %while.cond1.preheader.us.i167
  %broadcast.splatinsert204 = insertelement <2 x i64> undef, i64 %i.030.us.i165, i32 0
  %broadcast.splat205 = shufflevector <2 x i64> %broadcast.splatinsert204, <2 x i64> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert206 = insertelement <2 x i64> undef, i64 %i.030.us.i165, i32 0
  %broadcast.splat207 = shufflevector <2 x i64> %broadcast.splatinsert206, <2 x i64> undef, <2 x i32> zeroinitializer
  br i1 %39, label %middle.block188.unr-lcssa, label %vector.body187

vector.body187:                                   ; preds = %vector.ph195, %vector.body187
  %index196 = phi i64 [ %index.next197.3, %vector.body187 ], [ 0, %vector.ph195 ]
  %niter213 = phi i64 [ %niter213.nsub.3, %vector.body187 ], [ %unroll_iter212, %vector.ph195 ]
  %40 = add nsw i64 %index196, %mul.us.i166
  %41 = getelementptr inbounds i64, i64* %call14, i64 %40
  %42 = bitcast i64* %41 to <2 x i64>*
  store <2 x i64> %broadcast.splat205, <2 x i64>* %42, align 8, !tbaa !2, !alias.scope !32
  %43 = getelementptr i64, i64* %41, i64 2
  %44 = bitcast i64* %43 to <2 x i64>*
  store <2 x i64> %broadcast.splat207, <2 x i64>* %44, align 8, !tbaa !2, !alias.scope !32
  %index.next197 = or i64 %index196, 4
  %45 = add nsw i64 %index.next197, %mul.us.i166
  %46 = getelementptr inbounds i64, i64* %call14, i64 %45
  %47 = bitcast i64* %46 to <2 x i64>*
  store <2 x i64> %broadcast.splat205, <2 x i64>* %47, align 8, !tbaa !2, !alias.scope !32
  %48 = getelementptr i64, i64* %46, i64 2
  %49 = bitcast i64* %48 to <2 x i64>*
  store <2 x i64> %broadcast.splat207, <2 x i64>* %49, align 8, !tbaa !2, !alias.scope !32
  %index.next197.1 = or i64 %index196, 8
  %50 = add nsw i64 %index.next197.1, %mul.us.i166
  %51 = getelementptr inbounds i64, i64* %call14, i64 %50
  %52 = bitcast i64* %51 to <2 x i64>*
  store <2 x i64> %broadcast.splat205, <2 x i64>* %52, align 8, !tbaa !2, !alias.scope !32
  %53 = getelementptr i64, i64* %51, i64 2
  %54 = bitcast i64* %53 to <2 x i64>*
  store <2 x i64> %broadcast.splat207, <2 x i64>* %54, align 8, !tbaa !2, !alias.scope !32
  %index.next197.2 = or i64 %index196, 12
  %55 = add nsw i64 %index.next197.2, %mul.us.i166
  %56 = getelementptr inbounds i64, i64* %call14, i64 %55
  %57 = bitcast i64* %56 to <2 x i64>*
  store <2 x i64> %broadcast.splat205, <2 x i64>* %57, align 8, !tbaa !2, !alias.scope !32
  %58 = getelementptr i64, i64* %56, i64 2
  %59 = bitcast i64* %58 to <2 x i64>*
  store <2 x i64> %broadcast.splat207, <2 x i64>* %59, align 8, !tbaa !2, !alias.scope !32
  %index.next197.3 = add i64 %index196, 16
  %niter213.nsub.3 = add i64 %niter213, -4
  %niter213.ncmp.3 = icmp eq i64 %niter213.nsub.3, 0
  br i1 %niter213.ncmp.3, label %middle.block188.unr-lcssa, label %vector.body187, !llvm.loop !35

middle.block188.unr-lcssa:                        ; preds = %vector.body187, %vector.ph195
  %index196.unr = phi i64 [ 0, %vector.ph195 ], [ %index.next197.3, %vector.body187 ]
  br i1 %lcmp.mod211, label %middle.block188, label %vector.body187.epil

vector.body187.epil:                              ; preds = %middle.block188.unr-lcssa, %vector.body187.epil
  %index196.epil = phi i64 [ %index.next197.epil, %vector.body187.epil ], [ %index196.unr, %middle.block188.unr-lcssa ]
  %epil.iter210 = phi i64 [ %epil.iter210.sub, %vector.body187.epil ], [ %xtraiter209, %middle.block188.unr-lcssa ]
  %60 = add nsw i64 %index196.epil, %mul.us.i166
  %61 = getelementptr inbounds i64, i64* %call14, i64 %60
  %62 = bitcast i64* %61 to <2 x i64>*
  store <2 x i64> %broadcast.splat205, <2 x i64>* %62, align 8, !tbaa !2, !alias.scope !32
  %63 = getelementptr i64, i64* %61, i64 2
  %64 = bitcast i64* %63 to <2 x i64>*
  store <2 x i64> %broadcast.splat207, <2 x i64>* %64, align 8, !tbaa !2, !alias.scope !32
  %index.next197.epil = add i64 %index196.epil, 4
  %epil.iter210.sub = add i64 %epil.iter210, -1
  %epil.iter210.cmp = icmp eq i64 %epil.iter210.sub, 0
  br i1 %epil.iter210.cmp, label %middle.block188, label %vector.body187.epil, !llvm.loop !36

middle.block188:                                  ; preds = %vector.body187.epil, %middle.block188.unr-lcssa
  br i1 %cmp.n199, label %blklab2.loopexit.us.i176, label %if.end5.us.i173

if.end5.us.i173:                                  ; preds = %middle.block188, %while.cond1.preheader.us.i167, %if.end5.us.i173
  %j.028.us.i168 = phi i64 [ %add6.us.i171, %if.end5.us.i173 ], [ 0, %while.cond1.preheader.us.i167 ], [ %n.vec193, %middle.block188 ]
  %add.us.i169 = add nsw i64 %j.028.us.i168, %mul.us.i166
  %arrayidx.us.i170 = getelementptr inbounds i64, i64* %call14, i64 %add.us.i169
  store i64 %i.030.us.i165, i64* %arrayidx.us.i170, align 8, !tbaa !2, !alias.scope !32
  %add6.us.i171 = add nuw nsw i64 %j.028.us.i168, 1
  %exitcond.us.i172 = icmp eq i64 %add6.us.i171, %3
  br i1 %exitcond.us.i172, label %blklab2.loopexit.us.i176, label %if.end5.us.i173, !llvm.loop !37

blklab2.loopexit.us.i176:                         ; preds = %if.end5.us.i173, %middle.block188
  %add7.us.i174 = add nuw nsw i64 %i.030.us.i165, 1
  %exitcond32.us.i175 = icmp eq i64 %add7.us.i174, %3
  br i1 %exitcond32.us.i175, label %polly.loop_header.us.i.preheader, label %while.cond1.preheader.us.i167

_init_.exit177.thread:                            ; preds = %if.end
  %call14178 = call i64* @create1DArray_int64_t(i64 0, i64 %mul) #7
  %call17180 = call i64* @create1DArray_int64_t(i64 0, i64 %mul) #7
  br label %_mat_mult_.exit

polly.loop_header.us.i.preheader:                 ; preds = %blklab2.loopexit.us.i176
  %call17 = call i64* @create1DArray_int64_t(i64 0, i64 %mul) #7
  %65 = add i64 %3, -1
  %xtraiter = and i64 %3, 3
  %66 = icmp ult i64 %65, 3
  %unroll_iter = sub i64 %3, %xtraiter
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br label %polly.loop_header.us.i

polly.loop_header.us.i:                           ; preds = %polly.loop_header.us.i.preheader, %polly.loop_exit76.loopexit.us.i
  %polly.indvar.us.i = phi i64 [ %polly.indvar_next.us.i, %polly.loop_exit76.loopexit.us.i ], [ 0, %polly.loop_header.us.i.preheader ]
  %67 = mul i64 %polly.indvar.us.i, %3
  %scevgep.us.i = getelementptr i64, i64* %call11, i64 %67
  %scevgep93.us.i = getelementptr i64, i64* %call17, i64 %67
  br label %polly.loop_preheader83.us.i

polly.loop_preheader83.us.i:                      ; preds = %polly.stmt.blklab8.us.i, %polly.loop_header.us.i
  %polly.indvar78.us.i = phi i64 [ 0, %polly.loop_header.us.i ], [ %polly.indvar_next79.us.i, %polly.stmt.blklab8.us.i ]
  %scevgep90.us.i = getelementptr i64, i64* %call14, i64 %polly.indvar78.us.i
  br i1 %66, label %polly.stmt.blklab8.us.i.unr-lcssa, label %polly.loop_header82.us.i

polly.loop_header82.us.i:                         ; preds = %polly.loop_preheader83.us.i, %polly.loop_header82.us.i
  %sub_total.063.phiops.0.us.i = phi i64 [ %p_add15.us.i.3, %polly.loop_header82.us.i ], [ 0, %polly.loop_preheader83.us.i ]
  %polly.indvar86.us.i = phi i64 [ %polly.indvar_next87.us.i.3, %polly.loop_header82.us.i ], [ 0, %polly.loop_preheader83.us.i ]
  %niter = phi i64 [ %niter.nsub.3, %polly.loop_header82.us.i ], [ %unroll_iter, %polly.loop_preheader83.us.i ]
  %scevgep89.us.i = getelementptr i64, i64* %scevgep.us.i, i64 %polly.indvar86.us.i
  %_p_scalar_.us.i = load i64, i64* %scevgep89.us.i, align 8, !alias.scope !38, !noalias !43
  %68 = mul i64 %polly.indvar86.us.i, %3
  %scevgep91.us.i = getelementptr i64, i64* %scevgep90.us.i, i64 %68
  %_p_scalar_92.us.i = load i64, i64* %scevgep91.us.i, align 8, !alias.scope !51, !noalias !52
  %p_mul14.us.i = mul nsw i64 %_p_scalar_92.us.i, %_p_scalar_.us.i
  %p_add15.us.i = add nsw i64 %p_mul14.us.i, %sub_total.063.phiops.0.us.i
  %polly.indvar_next87.us.i = or i64 %polly.indvar86.us.i, 1
  %scevgep89.us.i.1 = getelementptr i64, i64* %scevgep.us.i, i64 %polly.indvar_next87.us.i
  %_p_scalar_.us.i.1 = load i64, i64* %scevgep89.us.i.1, align 8, !alias.scope !38, !noalias !43
  %69 = mul i64 %polly.indvar_next87.us.i, %3
  %scevgep91.us.i.1 = getelementptr i64, i64* %scevgep90.us.i, i64 %69
  %_p_scalar_92.us.i.1 = load i64, i64* %scevgep91.us.i.1, align 8, !alias.scope !51, !noalias !52
  %p_mul14.us.i.1 = mul nsw i64 %_p_scalar_92.us.i.1, %_p_scalar_.us.i.1
  %p_add15.us.i.1 = add nsw i64 %p_mul14.us.i.1, %p_add15.us.i
  %polly.indvar_next87.us.i.1 = or i64 %polly.indvar86.us.i, 2
  %scevgep89.us.i.2 = getelementptr i64, i64* %scevgep.us.i, i64 %polly.indvar_next87.us.i.1
  %_p_scalar_.us.i.2 = load i64, i64* %scevgep89.us.i.2, align 8, !alias.scope !38, !noalias !43
  %70 = mul i64 %polly.indvar_next87.us.i.1, %3
  %scevgep91.us.i.2 = getelementptr i64, i64* %scevgep90.us.i, i64 %70
  %_p_scalar_92.us.i.2 = load i64, i64* %scevgep91.us.i.2, align 8, !alias.scope !51, !noalias !52
  %p_mul14.us.i.2 = mul nsw i64 %_p_scalar_92.us.i.2, %_p_scalar_.us.i.2
  %p_add15.us.i.2 = add nsw i64 %p_mul14.us.i.2, %p_add15.us.i.1
  %polly.indvar_next87.us.i.2 = or i64 %polly.indvar86.us.i, 3
  %scevgep89.us.i.3 = getelementptr i64, i64* %scevgep.us.i, i64 %polly.indvar_next87.us.i.2
  %_p_scalar_.us.i.3 = load i64, i64* %scevgep89.us.i.3, align 8, !alias.scope !38, !noalias !43
  %71 = mul i64 %polly.indvar_next87.us.i.2, %3
  %scevgep91.us.i.3 = getelementptr i64, i64* %scevgep90.us.i, i64 %71
  %_p_scalar_92.us.i.3 = load i64, i64* %scevgep91.us.i.3, align 8, !alias.scope !51, !noalias !52
  %p_mul14.us.i.3 = mul nsw i64 %_p_scalar_92.us.i.3, %_p_scalar_.us.i.3
  %p_add15.us.i.3 = add nsw i64 %p_mul14.us.i.3, %p_add15.us.i.2
  %polly.indvar_next87.us.i.3 = add nsw i64 %polly.indvar86.us.i, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %polly.stmt.blklab8.us.i.unr-lcssa, label %polly.loop_header82.us.i

polly.stmt.blklab8.us.i.unr-lcssa:                ; preds = %polly.loop_header82.us.i, %polly.loop_preheader83.us.i
  %p_add15.us.i.lcssa.ph = phi i64 [ undef, %polly.loop_preheader83.us.i ], [ %p_add15.us.i.3, %polly.loop_header82.us.i ]
  %sub_total.063.phiops.0.us.i.unr = phi i64 [ 0, %polly.loop_preheader83.us.i ], [ %p_add15.us.i.3, %polly.loop_header82.us.i ]
  %polly.indvar86.us.i.unr = phi i64 [ 0, %polly.loop_preheader83.us.i ], [ %polly.indvar_next87.us.i.3, %polly.loop_header82.us.i ]
  br i1 %lcmp.mod, label %polly.stmt.blklab8.us.i, label %polly.loop_header82.us.i.epil

polly.loop_header82.us.i.epil:                    ; preds = %polly.stmt.blklab8.us.i.unr-lcssa, %polly.loop_header82.us.i.epil
  %sub_total.063.phiops.0.us.i.epil = phi i64 [ %p_add15.us.i.epil, %polly.loop_header82.us.i.epil ], [ %sub_total.063.phiops.0.us.i.unr, %polly.stmt.blklab8.us.i.unr-lcssa ]
  %polly.indvar86.us.i.epil = phi i64 [ %polly.indvar_next87.us.i.epil, %polly.loop_header82.us.i.epil ], [ %polly.indvar86.us.i.unr, %polly.stmt.blklab8.us.i.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %polly.loop_header82.us.i.epil ], [ %xtraiter, %polly.stmt.blklab8.us.i.unr-lcssa ]
  %scevgep89.us.i.epil = getelementptr i64, i64* %scevgep.us.i, i64 %polly.indvar86.us.i.epil
  %_p_scalar_.us.i.epil = load i64, i64* %scevgep89.us.i.epil, align 8, !alias.scope !38, !noalias !43
  %72 = mul i64 %polly.indvar86.us.i.epil, %3
  %scevgep91.us.i.epil = getelementptr i64, i64* %scevgep90.us.i, i64 %72
  %_p_scalar_92.us.i.epil = load i64, i64* %scevgep91.us.i.epil, align 8, !alias.scope !51, !noalias !52
  %p_mul14.us.i.epil = mul nsw i64 %_p_scalar_92.us.i.epil, %_p_scalar_.us.i.epil
  %p_add15.us.i.epil = add nsw i64 %p_mul14.us.i.epil, %sub_total.063.phiops.0.us.i.epil
  %polly.indvar_next87.us.i.epil = add nuw nsw i64 %polly.indvar86.us.i.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %polly.stmt.blklab8.us.i, label %polly.loop_header82.us.i.epil, !llvm.loop !53

polly.stmt.blklab8.us.i:                          ; preds = %polly.loop_header82.us.i.epil, %polly.stmt.blklab8.us.i.unr-lcssa
  %p_add15.us.i.lcssa = phi i64 [ %p_add15.us.i.lcssa.ph, %polly.stmt.blklab8.us.i.unr-lcssa ], [ %p_add15.us.i.epil, %polly.loop_header82.us.i.epil ]
  %scevgep94.us.i = getelementptr i64, i64* %scevgep93.us.i, i64 %polly.indvar78.us.i
  store i64 %p_add15.us.i.lcssa, i64* %scevgep94.us.i, align 8, !alias.scope !54, !noalias !55
  %polly.indvar_next79.us.i = add nuw nsw i64 %polly.indvar78.us.i, 1
  %exitcond97.i = icmp eq i64 %polly.indvar_next79.us.i, %3
  br i1 %exitcond97.i, label %polly.loop_exit76.loopexit.us.i, label %polly.loop_preheader83.us.i

polly.loop_exit76.loopexit.us.i:                  ; preds = %polly.stmt.blklab8.us.i
  %polly.indvar_next.us.i = add nuw nsw i64 %polly.indvar.us.i, 1
  %exitcond98.i = icmp eq i64 %polly.indvar_next.us.i, %3
  br i1 %exitcond98.i, label %_mat_mult_.exit, label %polly.loop_header.us.i

_mat_mult_.exit:                                  ; preds = %polly.loop_exit76.loopexit.us.i, %_init_.exit177.thread
  %call17181 = phi i64* [ %call17180, %_init_.exit177.thread ], [ %call17, %polly.loop_exit76.loopexit.us.i ]
  %call19 = call i64* @create1DArray_int64_t(i64 0, i64 27) #7
  %73 = bitcast i64* %call19 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %73, align 8, !tbaa !2
  %arrayidx22 = getelementptr inbounds i64, i64* %call19, i64 2
  %74 = bitcast i64* %arrayidx22 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %74, align 8, !tbaa !2
  %arrayidx24 = getelementptr inbounds i64, i64* %call19, i64 4
  %75 = bitcast i64* %arrayidx24 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %75, align 8, !tbaa !2
  %arrayidx26 = getelementptr inbounds i64, i64* %call19, i64 6
  %76 = bitcast i64* %arrayidx26 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %76, align 8, !tbaa !2
  %arrayidx28 = getelementptr inbounds i64, i64* %call19, i64 8
  %77 = bitcast i64* %arrayidx28 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %77, align 8, !tbaa !2
  %arrayidx30 = getelementptr inbounds i64, i64* %call19, i64 10
  %78 = bitcast i64* %arrayidx30 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %78, align 8, !tbaa !2
  %arrayidx32 = getelementptr inbounds i64, i64* %call19, i64 12
  %79 = bitcast i64* %arrayidx32 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %79, align 8, !tbaa !2
  %arrayidx34 = getelementptr inbounds i64, i64* %call19, i64 14
  %80 = bitcast i64* %arrayidx34 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %80, align 8, !tbaa !2
  %arrayidx36 = getelementptr inbounds i64, i64* %call19, i64 16
  %81 = bitcast i64* %arrayidx36 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %81, align 8, !tbaa !2
  %arrayidx38 = getelementptr inbounds i64, i64* %call19, i64 18
  %82 = bitcast i64* %arrayidx38 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %82, align 8, !tbaa !2
  %arrayidx40 = getelementptr inbounds i64, i64* %call19, i64 20
  %83 = bitcast i64* %arrayidx40 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %83, align 8, !tbaa !2
  %arrayidx42 = getelementptr inbounds i64, i64* %call19, i64 22
  %84 = bitcast i64* %arrayidx42 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %84, align 8, !tbaa !2
  %arrayidx44 = getelementptr inbounds i64, i64* %call19, i64 24
  %85 = bitcast i64* %arrayidx44 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %85, align 8, !tbaa !2
  %arrayidx46 = getelementptr inbounds i64, i64* %call19, i64 26
  store i64 32, i64* %arrayidx46, align 8, !tbaa !2
  call void @printf_s(i64* %call19, i64 27) #7
  %sub48 = add nsw i64 %mul, -1
  %arrayidx49 = getelementptr inbounds i64, i64* %call17181, i64 %sub48
  %86 = load i64, i64* %arrayidx49, align 8, !tbaa !2
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %86)
  %call51 = call i64* @create1DArray_int64_t(i64 0, i64 25) #7
  %87 = bitcast i64* %call51 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %87, align 8, !tbaa !2
  %arrayidx54 = getelementptr inbounds i64, i64* %call51, i64 2
  %88 = bitcast i64* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %88, align 8, !tbaa !2
  %arrayidx56 = getelementptr inbounds i64, i64* %call51, i64 4
  %89 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %89, align 8, !tbaa !2
  %arrayidx58 = getelementptr inbounds i64, i64* %call51, i64 6
  %90 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %90, align 8, !tbaa !2
  %arrayidx60 = getelementptr inbounds i64, i64* %call51, i64 8
  %91 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %91, align 8, !tbaa !2
  %arrayidx62 = getelementptr inbounds i64, i64* %call51, i64 10
  %92 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %92, align 8, !tbaa !2
  %arrayidx64 = getelementptr inbounds i64, i64* %call51, i64 12
  %93 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %93, align 8, !tbaa !2
  %arrayidx66 = getelementptr inbounds i64, i64* %call51, i64 14
  %94 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %94, align 8, !tbaa !2
  %arrayidx68 = getelementptr inbounds i64, i64* %call51, i64 16
  %95 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %95, align 8, !tbaa !2
  %arrayidx70 = getelementptr inbounds i64, i64* %call51, i64 18
  %96 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %96, align 8, !tbaa !2
  %arrayidx72 = getelementptr inbounds i64, i64* %call51, i64 20
  %97 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %97, align 8, !tbaa !2
  %arrayidx74 = getelementptr inbounds i64, i64* %call51, i64 22
  %98 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %98, align 8, !tbaa !2
  %arrayidx76 = getelementptr inbounds i64, i64* %call51, i64 24
  store i64 101, i64* %arrayidx76, align 8, !tbaa !2
  call void @println_s(i64* %call51, i64 25) #7
  br label %blklab10

blklab10:                                         ; preds = %entry, %_mat_mult_.exit
  call void @exit(i32 0) #8
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #4

declare i64* @parseStringToInt(i64*) local_unnamed_addr #4

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #4

declare void @printf_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #5

declare void @println_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #6

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0 (http://llvm.org/git/clang.git bd8aa3a7c974c9404a21faf306aad785cf0a7549) (http://llvm.org/git/llvm.git b618c820b01fb49ce529b7cc08c354958d3e3a13)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12, !7, !8}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !14, !"polly.alias.scope.MemRef2"}
!14 = distinct !{!14, !"polly.alias.scope.domain"}
!15 = !{!16, !17, !18, !19, !20}
!16 = distinct !{!16, !14, !"polly.alias.scope.MemRef0__phi"}
!17 = distinct !{!17, !14, !"polly.alias.scope.MemRef1__phi"}
!18 = distinct !{!18, !14, !"polly.alias.scope.MemRef3"}
!19 = distinct !{!19, !14, !"polly.alias.scope.MemRef4__phi"}
!20 = distinct !{!20, !14, !"polly.alias.scope.MemRef5"}
!21 = !{!16, !17, !13, !19, !20}
!22 = distinct !{!22, !10}
!23 = !{!16, !17, !13, !18, !19}
!24 = !{!25, !25, i64 0}
!25 = !{!"any pointer", !4, i64 0}
!26 = !{!27}
!27 = distinct !{!27, !28, !"_init_: %data"}
!28 = distinct !{!28, !"_init_"}
!29 = distinct !{!29, !7, !8}
!30 = distinct !{!30, !10}
!31 = distinct !{!31, !12, !7, !8}
!32 = !{!33}
!33 = distinct !{!33, !34, !"_init_: %data"}
!34 = distinct !{!34, !"_init_"}
!35 = distinct !{!35, !7, !8}
!36 = distinct !{!36, !10}
!37 = distinct !{!37, !12, !7, !8}
!38 = !{!39, !40, !"polly.alias.scope.MemRef2", !41}
!39 = distinct !{!39, !40, !"polly.alias.scope.MemRef2"}
!40 = distinct !{!40, !"polly.alias.scope.domain"}
!41 = distinct !{!41, !42, !"_mat_mult_: %a"}
!42 = distinct !{!42, !"_mat_mult_"}
!43 = !{!44, !45, !46, !47, !48, !49, !50}
!44 = distinct !{!44, !40, !"polly.alias.scope.MemRef0__phi"}
!45 = distinct !{!45, !40, !"polly.alias.scope.MemRef1__phi"}
!46 = distinct !{!46, !40, !"polly.alias.scope.MemRef3"}
!47 = distinct !{!47, !40, !"polly.alias.scope.MemRef4__phi"}
!48 = distinct !{!48, !40, !"polly.alias.scope.MemRef5"}
!49 = distinct !{!49, !42, !"_mat_mult_: %b"}
!50 = distinct !{!50, !42, !"_mat_mult_: %data"}
!51 = !{!46, !40, !"polly.alias.scope.MemRef3", !49}
!52 = !{!44, !45, !39, !47, !48, !41, !50}
!53 = distinct !{!53, !10}
!54 = !{!48, !40, !"polly.alias.scope.MemRef5", !50}
!55 = !{!44, !45, !39, !46, !47, !41, !49}
