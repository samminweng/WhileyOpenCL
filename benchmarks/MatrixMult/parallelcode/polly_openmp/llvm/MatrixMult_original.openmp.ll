; ModuleID = 'polly_openmp/MatrixMult_original.c'
source_filename = "polly_openmp/MatrixMult_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_init_(i64* noalias returned %data, i64 %data_size, i64 %width, i64 %height, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %polly.par.userContext = alloca { i64, i64, i64* }, align 8
  %0 = add nsw i64 %height, -1
  %polly.fdiv_q.shr = ashr i64 %0, 5
  %polly.subfn.storeaddr.height = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %height, i64* %polly.subfn.storeaddr.height, align 8
  %polly.subfn.storeaddr.width = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64 %width, i64* %polly.subfn.storeaddr.width, align 8
  %polly.subfn.storeaddr.data = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %data, i64** %polly.subfn.storeaddr.data, align 8
  %polly.par.userContext33 = bitcast { i64, i64, i64* }* %polly.par.userContext to i8*
  %1 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_init__polly_subfn, i8* nonnull %polly.par.userContext33, i32 0, i64 0, i64 %1, i64 1) #8
  call void @_init__polly_subfn(i8* nonnull %polly.par.userContext33) #8
  call void @GOMP_parallel_end() #8
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
  %_p_scalar_.us = load i64, i64* %scevgep89.us, align 8, !alias.scope !6, !noalias !8
  %3 = mul i64 %polly.indvar86.us, %width
  %scevgep91.us = getelementptr i64, i64* %scevgep90.us, i64 %3
  %_p_scalar_92.us = load i64, i64* %scevgep91.us, align 8, !alias.scope !11, !noalias !14
  %p_mul14.us = mul nsw i64 %_p_scalar_92.us, %_p_scalar_.us
  %p_add15.us = add nsw i64 %p_mul14.us, %sub_total.063.phiops.0.us
  %polly.indvar_next87.us = or i64 %polly.indvar86.us, 1
  %scevgep89.us.1 = getelementptr i64, i64* %scevgep.us, i64 %polly.indvar_next87.us
  %_p_scalar_.us.1 = load i64, i64* %scevgep89.us.1, align 8, !alias.scope !6, !noalias !8
  %4 = mul i64 %polly.indvar_next87.us, %width
  %scevgep91.us.1 = getelementptr i64, i64* %scevgep90.us, i64 %4
  %_p_scalar_92.us.1 = load i64, i64* %scevgep91.us.1, align 8, !alias.scope !11, !noalias !14
  %p_mul14.us.1 = mul nsw i64 %_p_scalar_92.us.1, %_p_scalar_.us.1
  %p_add15.us.1 = add nsw i64 %p_mul14.us.1, %p_add15.us
  %polly.indvar_next87.us.1 = or i64 %polly.indvar86.us, 2
  %scevgep89.us.2 = getelementptr i64, i64* %scevgep.us, i64 %polly.indvar_next87.us.1
  %_p_scalar_.us.2 = load i64, i64* %scevgep89.us.2, align 8, !alias.scope !6, !noalias !8
  %5 = mul i64 %polly.indvar_next87.us.1, %width
  %scevgep91.us.2 = getelementptr i64, i64* %scevgep90.us, i64 %5
  %_p_scalar_92.us.2 = load i64, i64* %scevgep91.us.2, align 8, !alias.scope !11, !noalias !14
  %p_mul14.us.2 = mul nsw i64 %_p_scalar_92.us.2, %_p_scalar_.us.2
  %p_add15.us.2 = add nsw i64 %p_mul14.us.2, %p_add15.us.1
  %polly.indvar_next87.us.2 = or i64 %polly.indvar86.us, 3
  %scevgep89.us.3 = getelementptr i64, i64* %scevgep.us, i64 %polly.indvar_next87.us.2
  %_p_scalar_.us.3 = load i64, i64* %scevgep89.us.3, align 8, !alias.scope !6, !noalias !8
  %6 = mul i64 %polly.indvar_next87.us.2, %width
  %scevgep91.us.3 = getelementptr i64, i64* %scevgep90.us, i64 %6
  %_p_scalar_92.us.3 = load i64, i64* %scevgep91.us.3, align 8, !alias.scope !11, !noalias !14
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
  %_p_scalar_.us.epil = load i64, i64* %scevgep89.us.epil, align 8, !alias.scope !6, !noalias !8
  %7 = mul i64 %polly.indvar86.us.epil, %width
  %scevgep91.us.epil = getelementptr i64, i64* %scevgep90.us, i64 %7
  %_p_scalar_92.us.epil = load i64, i64* %scevgep91.us.epil, align 8, !alias.scope !11, !noalias !14
  %p_mul14.us.epil = mul nsw i64 %_p_scalar_92.us.epil, %_p_scalar_.us.epil
  %p_add15.us.epil = add nsw i64 %p_mul14.us.epil, %sub_total.063.phiops.0.us.epil
  %polly.indvar_next87.us.epil = add nuw nsw i64 %polly.indvar86.us.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %polly.stmt.blklab8.us, label %polly.loop_header82.us.epil, !llvm.loop !15

polly.stmt.blklab8.us:                            ; preds = %polly.loop_header82.us.epil, %polly.stmt.blklab8.us.unr-lcssa
  %p_add15.us.lcssa = phi i64 [ %p_add15.us.lcssa.ph, %polly.stmt.blklab8.us.unr-lcssa ], [ %p_add15.us.epil, %polly.loop_header82.us.epil ]
  %scevgep94.us = getelementptr i64, i64* %scevgep93.us, i64 %polly.indvar78.us
  store i64 %p_add15.us.lcssa, i64* %scevgep94.us, align 8, !alias.scope !13, !noalias !17
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
  %polly.par.userContext.i163 = alloca { i64, i64, i64* }, align 8
  %polly.par.userContext.i = alloca { i64, i64, i64* }, align 8
  %_9_size = alloca i64, align 8
  %_9_size_size = alloca i64, align 8
  %0 = bitcast i64* %_9_size to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #8
  store i64 0, i64* %_9_size, align 8, !tbaa !2
  %1 = bitcast i64* %_9_size_size to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #8
  store i64 0, i64* %_9_size_size, align 8, !tbaa !2
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_9_size, i64* nonnull %_9_size_size) #8
  %2 = load i64*, i64** %call, align 8, !tbaa !18
  %call1 = call i64* @parseStringToInt(i64* %2) #8
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab10, label %if.end

if.end:                                           ; preds = %entry
  %3 = load i64, i64* %call1, align 8, !tbaa !2
  %call2 = call i64* @create1DArray_int64_t(i64 0, i64 7) #8
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
  call void @printf_s(i64* %call2, i64 7) #8
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %3)
  %mul = mul i64 %3, %3
  %call11 = call i64* @create1DArray_int64_t(i64 0, i64 %mul) #8
  %7 = bitcast { i64, i64, i64* }* %polly.par.userContext.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7)
  %8 = add nsw i64 %3, -1
  %polly.fdiv_q.shr.i = ashr i64 %8, 5
  %polly.subfn.storeaddr.height.i = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i, i64 0, i32 0
  store i64 %3, i64* %polly.subfn.storeaddr.height.i, align 8, !noalias !20
  %polly.subfn.storeaddr.width.i = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i, i64 0, i32 1
  store i64 %3, i64* %polly.subfn.storeaddr.width.i, align 8, !noalias !20
  %polly.subfn.storeaddr.data.i = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i, i64 0, i32 2
  store i64* %call11, i64** %polly.subfn.storeaddr.data.i, align 8, !noalias !20
  %9 = add nsw i64 %polly.fdiv_q.shr.i, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_init__polly_subfn, i8* nonnull %7, i32 0, i64 0, i64 %9, i64 1) #8
  call void @_init__polly_subfn(i8* nonnull %7) #8
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7)
  %call14 = call i64* @create1DArray_int64_t(i64 0, i64 %mul) #8
  %10 = bitcast { i64, i64, i64* }* %polly.par.userContext.i163 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %10)
  %polly.subfn.storeaddr.height.i165 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i163, i64 0, i32 0
  store i64 %3, i64* %polly.subfn.storeaddr.height.i165, align 8, !noalias !23
  %polly.subfn.storeaddr.width.i166 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i163, i64 0, i32 1
  store i64 %3, i64* %polly.subfn.storeaddr.width.i166, align 8, !noalias !23
  %polly.subfn.storeaddr.data.i167 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i163, i64 0, i32 2
  store i64* %call14, i64** %polly.subfn.storeaddr.data.i167, align 8, !noalias !23
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_init__polly_subfn, i8* nonnull %10, i32 0, i64 0, i64 %9, i64 1) #8
  call void @_init__polly_subfn(i8* nonnull %10) #8
  call void @GOMP_parallel_end() #8
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %10)
  %call17 = call i64* @create1DArray_int64_t(i64 0, i64 %mul) #8
  %polly.loop_guard.i = icmp sgt i64 %3, 0
  br i1 %polly.loop_guard.i, label %polly.loop_header.us.i.preheader, label %_mat_mult_.exit

polly.loop_header.us.i.preheader:                 ; preds = %if.end
  %11 = add i64 %3, -1
  %xtraiter = and i64 %3, 3
  %12 = icmp ult i64 %11, 3
  %unroll_iter = sub i64 %3, %xtraiter
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br label %polly.loop_header.us.i

polly.loop_header.us.i:                           ; preds = %polly.loop_header.us.i.preheader, %polly.loop_exit76.loopexit.us.i
  %polly.indvar.us.i = phi i64 [ %polly.indvar_next.us.i, %polly.loop_exit76.loopexit.us.i ], [ 0, %polly.loop_header.us.i.preheader ]
  %13 = mul i64 %polly.indvar.us.i, %3
  %scevgep.us.i = getelementptr i64, i64* %call11, i64 %13
  %scevgep93.us.i = getelementptr i64, i64* %call17, i64 %13
  br label %polly.loop_preheader83.us.i

polly.loop_preheader83.us.i:                      ; preds = %polly.stmt.blklab8.us.i, %polly.loop_header.us.i
  %polly.indvar78.us.i = phi i64 [ 0, %polly.loop_header.us.i ], [ %polly.indvar_next79.us.i, %polly.stmt.blklab8.us.i ]
  %scevgep90.us.i = getelementptr i64, i64* %call14, i64 %polly.indvar78.us.i
  br i1 %12, label %polly.stmt.blklab8.us.i.unr-lcssa, label %polly.loop_header82.us.i

polly.loop_header82.us.i:                         ; preds = %polly.loop_preheader83.us.i, %polly.loop_header82.us.i
  %sub_total.063.phiops.0.us.i = phi i64 [ %p_add15.us.i.3, %polly.loop_header82.us.i ], [ 0, %polly.loop_preheader83.us.i ]
  %polly.indvar86.us.i = phi i64 [ %polly.indvar_next87.us.i.3, %polly.loop_header82.us.i ], [ 0, %polly.loop_preheader83.us.i ]
  %niter = phi i64 [ %niter.nsub.3, %polly.loop_header82.us.i ], [ %unroll_iter, %polly.loop_preheader83.us.i ]
  %scevgep89.us.i = getelementptr i64, i64* %scevgep.us.i, i64 %polly.indvar86.us.i
  %_p_scalar_.us.i = load i64, i64* %scevgep89.us.i, align 8, !alias.scope !26, !noalias !31
  %14 = mul i64 %polly.indvar86.us.i, %3
  %scevgep91.us.i = getelementptr i64, i64* %scevgep90.us.i, i64 %14
  %_p_scalar_92.us.i = load i64, i64* %scevgep91.us.i, align 8, !alias.scope !39, !noalias !40
  %p_mul14.us.i = mul nsw i64 %_p_scalar_92.us.i, %_p_scalar_.us.i
  %p_add15.us.i = add nsw i64 %p_mul14.us.i, %sub_total.063.phiops.0.us.i
  %polly.indvar_next87.us.i = or i64 %polly.indvar86.us.i, 1
  %scevgep89.us.i.1 = getelementptr i64, i64* %scevgep.us.i, i64 %polly.indvar_next87.us.i
  %_p_scalar_.us.i.1 = load i64, i64* %scevgep89.us.i.1, align 8, !alias.scope !26, !noalias !31
  %15 = mul i64 %polly.indvar_next87.us.i, %3
  %scevgep91.us.i.1 = getelementptr i64, i64* %scevgep90.us.i, i64 %15
  %_p_scalar_92.us.i.1 = load i64, i64* %scevgep91.us.i.1, align 8, !alias.scope !39, !noalias !40
  %p_mul14.us.i.1 = mul nsw i64 %_p_scalar_92.us.i.1, %_p_scalar_.us.i.1
  %p_add15.us.i.1 = add nsw i64 %p_mul14.us.i.1, %p_add15.us.i
  %polly.indvar_next87.us.i.1 = or i64 %polly.indvar86.us.i, 2
  %scevgep89.us.i.2 = getelementptr i64, i64* %scevgep.us.i, i64 %polly.indvar_next87.us.i.1
  %_p_scalar_.us.i.2 = load i64, i64* %scevgep89.us.i.2, align 8, !alias.scope !26, !noalias !31
  %16 = mul i64 %polly.indvar_next87.us.i.1, %3
  %scevgep91.us.i.2 = getelementptr i64, i64* %scevgep90.us.i, i64 %16
  %_p_scalar_92.us.i.2 = load i64, i64* %scevgep91.us.i.2, align 8, !alias.scope !39, !noalias !40
  %p_mul14.us.i.2 = mul nsw i64 %_p_scalar_92.us.i.2, %_p_scalar_.us.i.2
  %p_add15.us.i.2 = add nsw i64 %p_mul14.us.i.2, %p_add15.us.i.1
  %polly.indvar_next87.us.i.2 = or i64 %polly.indvar86.us.i, 3
  %scevgep89.us.i.3 = getelementptr i64, i64* %scevgep.us.i, i64 %polly.indvar_next87.us.i.2
  %_p_scalar_.us.i.3 = load i64, i64* %scevgep89.us.i.3, align 8, !alias.scope !26, !noalias !31
  %17 = mul i64 %polly.indvar_next87.us.i.2, %3
  %scevgep91.us.i.3 = getelementptr i64, i64* %scevgep90.us.i, i64 %17
  %_p_scalar_92.us.i.3 = load i64, i64* %scevgep91.us.i.3, align 8, !alias.scope !39, !noalias !40
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
  %_p_scalar_.us.i.epil = load i64, i64* %scevgep89.us.i.epil, align 8, !alias.scope !26, !noalias !31
  %18 = mul i64 %polly.indvar86.us.i.epil, %3
  %scevgep91.us.i.epil = getelementptr i64, i64* %scevgep90.us.i, i64 %18
  %_p_scalar_92.us.i.epil = load i64, i64* %scevgep91.us.i.epil, align 8, !alias.scope !39, !noalias !40
  %p_mul14.us.i.epil = mul nsw i64 %_p_scalar_92.us.i.epil, %_p_scalar_.us.i.epil
  %p_add15.us.i.epil = add nsw i64 %p_mul14.us.i.epil, %sub_total.063.phiops.0.us.i.epil
  %polly.indvar_next87.us.i.epil = add nuw nsw i64 %polly.indvar86.us.i.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %polly.stmt.blklab8.us.i, label %polly.loop_header82.us.i.epil, !llvm.loop !41

polly.stmt.blklab8.us.i:                          ; preds = %polly.loop_header82.us.i.epil, %polly.stmt.blklab8.us.i.unr-lcssa
  %p_add15.us.i.lcssa = phi i64 [ %p_add15.us.i.lcssa.ph, %polly.stmt.blklab8.us.i.unr-lcssa ], [ %p_add15.us.i.epil, %polly.loop_header82.us.i.epil ]
  %scevgep94.us.i = getelementptr i64, i64* %scevgep93.us.i, i64 %polly.indvar78.us.i
  store i64 %p_add15.us.i.lcssa, i64* %scevgep94.us.i, align 8, !alias.scope !42, !noalias !43
  %polly.indvar_next79.us.i = add nuw nsw i64 %polly.indvar78.us.i, 1
  %exitcond97.i = icmp eq i64 %polly.indvar_next79.us.i, %3
  br i1 %exitcond97.i, label %polly.loop_exit76.loopexit.us.i, label %polly.loop_preheader83.us.i

polly.loop_exit76.loopexit.us.i:                  ; preds = %polly.stmt.blklab8.us.i
  %polly.indvar_next.us.i = add nuw nsw i64 %polly.indvar.us.i, 1
  %exitcond98.i = icmp eq i64 %polly.indvar_next.us.i, %3
  br i1 %exitcond98.i, label %_mat_mult_.exit, label %polly.loop_header.us.i

_mat_mult_.exit:                                  ; preds = %polly.loop_exit76.loopexit.us.i, %if.end
  %call19 = call i64* @create1DArray_int64_t(i64 0, i64 27) #8
  %19 = bitcast i64* %call19 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %19, align 8, !tbaa !2
  %arrayidx22 = getelementptr inbounds i64, i64* %call19, i64 2
  %20 = bitcast i64* %arrayidx22 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %20, align 8, !tbaa !2
  %arrayidx24 = getelementptr inbounds i64, i64* %call19, i64 4
  %21 = bitcast i64* %arrayidx24 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %21, align 8, !tbaa !2
  %arrayidx26 = getelementptr inbounds i64, i64* %call19, i64 6
  %22 = bitcast i64* %arrayidx26 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %22, align 8, !tbaa !2
  %arrayidx28 = getelementptr inbounds i64, i64* %call19, i64 8
  %23 = bitcast i64* %arrayidx28 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %23, align 8, !tbaa !2
  %arrayidx30 = getelementptr inbounds i64, i64* %call19, i64 10
  %24 = bitcast i64* %arrayidx30 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %24, align 8, !tbaa !2
  %arrayidx32 = getelementptr inbounds i64, i64* %call19, i64 12
  %25 = bitcast i64* %arrayidx32 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %25, align 8, !tbaa !2
  %arrayidx34 = getelementptr inbounds i64, i64* %call19, i64 14
  %26 = bitcast i64* %arrayidx34 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %26, align 8, !tbaa !2
  %arrayidx36 = getelementptr inbounds i64, i64* %call19, i64 16
  %27 = bitcast i64* %arrayidx36 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %27, align 8, !tbaa !2
  %arrayidx38 = getelementptr inbounds i64, i64* %call19, i64 18
  %28 = bitcast i64* %arrayidx38 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %28, align 8, !tbaa !2
  %arrayidx40 = getelementptr inbounds i64, i64* %call19, i64 20
  %29 = bitcast i64* %arrayidx40 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %29, align 8, !tbaa !2
  %arrayidx42 = getelementptr inbounds i64, i64* %call19, i64 22
  %30 = bitcast i64* %arrayidx42 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %30, align 8, !tbaa !2
  %arrayidx44 = getelementptr inbounds i64, i64* %call19, i64 24
  %31 = bitcast i64* %arrayidx44 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %31, align 8, !tbaa !2
  %arrayidx46 = getelementptr inbounds i64, i64* %call19, i64 26
  store i64 32, i64* %arrayidx46, align 8, !tbaa !2
  call void @printf_s(i64* %call19, i64 27) #8
  %sub48 = add nsw i64 %mul, -1
  %arrayidx49 = getelementptr inbounds i64, i64* %call17, i64 %sub48
  %32 = load i64, i64* %arrayidx49, align 8, !tbaa !2
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %32)
  %call51 = call i64* @create1DArray_int64_t(i64 0, i64 25) #8
  %33 = bitcast i64* %call51 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %33, align 8, !tbaa !2
  %arrayidx54 = getelementptr inbounds i64, i64* %call51, i64 2
  %34 = bitcast i64* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %34, align 8, !tbaa !2
  %arrayidx56 = getelementptr inbounds i64, i64* %call51, i64 4
  %35 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %35, align 8, !tbaa !2
  %arrayidx58 = getelementptr inbounds i64, i64* %call51, i64 6
  %36 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %36, align 8, !tbaa !2
  %arrayidx60 = getelementptr inbounds i64, i64* %call51, i64 8
  %37 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %37, align 8, !tbaa !2
  %arrayidx62 = getelementptr inbounds i64, i64* %call51, i64 10
  %38 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %38, align 8, !tbaa !2
  %arrayidx64 = getelementptr inbounds i64, i64* %call51, i64 12
  %39 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %39, align 8, !tbaa !2
  %arrayidx66 = getelementptr inbounds i64, i64* %call51, i64 14
  %40 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %40, align 8, !tbaa !2
  %arrayidx68 = getelementptr inbounds i64, i64* %call51, i64 16
  %41 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %41, align 8, !tbaa !2
  %arrayidx70 = getelementptr inbounds i64, i64* %call51, i64 18
  %42 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %42, align 8, !tbaa !2
  %arrayidx72 = getelementptr inbounds i64, i64* %call51, i64 20
  %43 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %43, align 8, !tbaa !2
  %arrayidx74 = getelementptr inbounds i64, i64* %call51, i64 22
  %44 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %44, align 8, !tbaa !2
  %arrayidx76 = getelementptr inbounds i64, i64* %call51, i64 24
  store i64 101, i64* %arrayidx76, align 8, !tbaa !2
  call void @println_s(i64* %call51, i64 25) #8
  br label %blklab10

blklab10:                                         ; preds = %entry, %_mat_mult_.exit
  call void @exit(i32 0) #9
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

define internal void @_init__polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.height = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64*
  %polly.subfunc.arg.width = load i64, i64* %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.data = load i64*, i64** %4, align 8
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %7 = add nsw i64 %polly.subfunc.arg.width, -1
  %polly.fdiv_q.shr = ashr i64 %7, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br label %polly.par.loadIVBounds

polly.par.exit:                                   ; preds = %polly.par.checkNext.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %8 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %polly.par.exit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.UBAdjusted = add i64 %polly.par.UB, -1
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  br i1 %polly.loop_guard, label %polly.loop_header2.preheader, label %polly.loop_exit4

polly.loop_header2.preheader:                     ; preds = %polly.loop_header
  %10 = shl nsw i64 %polly.indvar, 5
  %11 = sub nsw i64 %polly.subfunc.arg.height, %10
  %12 = add nsw i64 %11, -1
  %13 = icmp slt i64 %12, 31
  %14 = select i1 %13, i64 %12, i64 31
  %polly.loop_guard12 = icmp sgt i64 %14, -1
  br i1 %polly.loop_guard12, label %polly.loop_header2.us, label %polly.loop_exit4

polly.loop_header2.us:                            ; preds = %polly.loop_header2.preheader, %polly.loop_exit11.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit11.loopexit.us ], [ 0, %polly.loop_header2.preheader ]
  %15 = shl i64 %polly.indvar5.us, 5
  %16 = sub i64 %15, %polly.subfunc.arg.width
  %17 = icmp sgt i64 %16, -32
  %smax46 = select i1 %17, i64 %16, i64 -32
  %18 = sub i64 -4, %smax46
  %19 = lshr i64 %18, 2
  %20 = add nuw nsw i64 %19, 1
  %21 = shl i64 %polly.indvar5.us, 5
  %22 = sub i64 %21, %polly.subfunc.arg.width
  %23 = icmp sgt i64 %22, -32
  %smax = select i1 %23, i64 %22, i64 -32
  %24 = sub i64 0, %smax
  %25 = shl i64 %polly.indvar5.us, 5
  %26 = sub nsw i64 %polly.subfunc.arg.width, %25
  %27 = add nsw i64 %26, -1
  %28 = icmp slt i64 %27, 31
  %29 = select i1 %28, i64 %27, i64 31
  %polly.loop_guard20.us = icmp sgt i64 %29, -1
  br i1 %polly.loop_guard20.us, label %polly.loop_header9.us.us.preheader, label %polly.loop_exit11.loopexit.us

polly.loop_header9.us.us.preheader:               ; preds = %polly.loop_header2.us
  %min.iters.check = icmp ult i64 %24, 4
  %n.vec = and i64 %24, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter = and i64 %20, 3
  %30 = icmp ult i64 %18, 12
  %unroll_iter = sub nsw i64 %20, %xtraiter
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %cmp.n = icmp eq i64 %n.vec, %24
  br label %polly.loop_header9.us.us

polly.loop_exit11.loopexit.us:                    ; preds = %polly.loop_exit19.loopexit.us.us, %polly.loop_header2.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar5.us, %polly.fdiv_q.shr
  br i1 %exitcond.us, label %polly.loop_exit4, label %polly.loop_header2.us

polly.loop_header9.us.us:                         ; preds = %polly.loop_header9.us.us.preheader, %polly.loop_exit19.loopexit.us.us
  %polly.indvar13.us.us = phi i64 [ %polly.indvar_next14.us.us, %polly.loop_exit19.loopexit.us.us ], [ 0, %polly.loop_header9.us.us.preheader ]
  %31 = add nsw i64 %polly.indvar13.us.us, %10
  %32 = mul i64 %31, %polly.subfunc.arg.width
  %33 = add i64 %32, %25
  %brmerge = or i1 %min.iters.check, %cmp.zero
  br i1 %brmerge, label %polly.loop_header17.us.us, label %vector.ph

vector.ph:                                        ; preds = %polly.loop_header9.us.us
  %broadcast.splatinsert42 = insertelement <2 x i64> undef, i64 %31, i32 0
  %broadcast.splat43 = shufflevector <2 x i64> %broadcast.splatinsert42, <2 x i64> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert44 = insertelement <2 x i64> undef, i64 %31, i32 0
  %broadcast.splat45 = shufflevector <2 x i64> %broadcast.splatinsert44, <2 x i64> undef, <2 x i32> zeroinitializer
  br i1 %30, label %middle.block.unr-lcssa, label %vector.body

vector.body:                                      ; preds = %vector.ph, %vector.body
  %index = phi i64 [ %index.next.3, %vector.body ], [ 0, %vector.ph ]
  %niter = phi i64 [ %niter.nsub.3, %vector.body ], [ %unroll_iter, %vector.ph ]
  %34 = add i64 %33, %index
  %35 = getelementptr i64, i64* %polly.subfunc.arg.data, i64 %34
  %36 = bitcast i64* %35 to <2 x i64>*
  store <2 x i64> %broadcast.splat43, <2 x i64>* %36, align 8, !alias.scope !44, !noalias !46
  %37 = getelementptr i64, i64* %35, i64 2
  %38 = bitcast i64* %37 to <2 x i64>*
  store <2 x i64> %broadcast.splat45, <2 x i64>* %38, align 8, !alias.scope !44, !noalias !46
  %index.next = or i64 %index, 4
  %39 = add i64 %33, %index.next
  %40 = getelementptr i64, i64* %polly.subfunc.arg.data, i64 %39
  %41 = bitcast i64* %40 to <2 x i64>*
  store <2 x i64> %broadcast.splat43, <2 x i64>* %41, align 8, !alias.scope !44, !noalias !46
  %42 = getelementptr i64, i64* %40, i64 2
  %43 = bitcast i64* %42 to <2 x i64>*
  store <2 x i64> %broadcast.splat45, <2 x i64>* %43, align 8, !alias.scope !44, !noalias !46
  %index.next.1 = or i64 %index, 8
  %44 = add i64 %33, %index.next.1
  %45 = getelementptr i64, i64* %polly.subfunc.arg.data, i64 %44
  %46 = bitcast i64* %45 to <2 x i64>*
  store <2 x i64> %broadcast.splat43, <2 x i64>* %46, align 8, !alias.scope !44, !noalias !46
  %47 = getelementptr i64, i64* %45, i64 2
  %48 = bitcast i64* %47 to <2 x i64>*
  store <2 x i64> %broadcast.splat45, <2 x i64>* %48, align 8, !alias.scope !44, !noalias !46
  %index.next.2 = or i64 %index, 12
  %49 = add i64 %33, %index.next.2
  %50 = getelementptr i64, i64* %polly.subfunc.arg.data, i64 %49
  %51 = bitcast i64* %50 to <2 x i64>*
  store <2 x i64> %broadcast.splat43, <2 x i64>* %51, align 8, !alias.scope !44, !noalias !46
  %52 = getelementptr i64, i64* %50, i64 2
  %53 = bitcast i64* %52 to <2 x i64>*
  store <2 x i64> %broadcast.splat45, <2 x i64>* %53, align 8, !alias.scope !44, !noalias !46
  %index.next.3 = add i64 %index, 16
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !47

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  br i1 %lcmp.mod, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %index.epil = phi i64 [ %index.next.epil, %vector.body.epil ], [ %index.unr, %middle.block.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %vector.body.epil ], [ %xtraiter, %middle.block.unr-lcssa ]
  %54 = add i64 %33, %index.epil
  %55 = getelementptr i64, i64* %polly.subfunc.arg.data, i64 %54
  %56 = bitcast i64* %55 to <2 x i64>*
  store <2 x i64> %broadcast.splat43, <2 x i64>* %56, align 8, !alias.scope !44, !noalias !46
  %57 = getelementptr i64, i64* %55, i64 2
  %58 = bitcast i64* %57 to <2 x i64>*
  store <2 x i64> %broadcast.splat45, <2 x i64>* %58, align 8, !alias.scope !44, !noalias !46
  %index.next.epil = add i64 %index.epil, 4
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %middle.block, label %vector.body.epil, !llvm.loop !50

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  br i1 %cmp.n, label %polly.loop_exit19.loopexit.us.us, label %polly.loop_header17.us.us

polly.loop_exit19.loopexit.us.us:                 ; preds = %polly.loop_header17.us.us, %middle.block
  %polly.indvar_next14.us.us = add nuw nsw i64 %polly.indvar13.us.us, 1
  %polly.loop_cond15.us.us = icmp slt i64 %polly.indvar13.us.us, %14
  br i1 %polly.loop_cond15.us.us, label %polly.loop_header9.us.us, label %polly.loop_exit11.loopexit.us

polly.loop_header17.us.us:                        ; preds = %polly.loop_header9.us.us, %middle.block, %polly.loop_header17.us.us
  %polly.indvar21.us.us = phi i64 [ %polly.indvar_next22.us.us, %polly.loop_header17.us.us ], [ 0, %polly.loop_header9.us.us ], [ %n.vec, %middle.block ]
  %59 = add i64 %33, %polly.indvar21.us.us
  %scevgep.us.us = getelementptr i64, i64* %polly.subfunc.arg.data, i64 %59
  store i64 %31, i64* %scevgep.us.us, align 8, !alias.scope !44, !noalias !46, !llvm.mem.parallel_loop_access !51
  %polly.indvar_next22.us.us = add nuw nsw i64 %polly.indvar21.us.us, 1
  %polly.loop_cond23.us.us = icmp slt i64 %polly.indvar21.us.us, %29
  br i1 %polly.loop_cond23.us.us, label %polly.loop_header17.us.us, label %polly.loop_exit19.loopexit.us.us, !llvm.loop !52

polly.loop_exit4:                                 ; preds = %polly.loop_exit11.loopexit.us, %polly.loop_header2.preheader, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp slt i64 %polly.indvar, %polly.par.UBAdjusted
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.par.checkNext.loopexit
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*) local_unnamed_addr

declare void @GOMP_loop_end_nowait() local_unnamed_addr

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64) local_unnamed_addr

declare void @GOMP_parallel_end() local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "polly.skip.fn" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0 (http://llvm.org/git/clang.git bd8aa3a7c974c9404a21faf306aad785cf0a7549) (http://llvm.org/git/llvm.git b618c820b01fb49ce529b7cc08c354958d3e3a13)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !"polly.alias.scope.MemRef2"}
!7 = distinct !{!7, !"polly.alias.scope.domain"}
!8 = !{!9, !10, !11, !12, !13}
!9 = distinct !{!9, !7, !"polly.alias.scope.MemRef0__phi"}
!10 = distinct !{!10, !7, !"polly.alias.scope.MemRef1__phi"}
!11 = distinct !{!11, !7, !"polly.alias.scope.MemRef3"}
!12 = distinct !{!12, !7, !"polly.alias.scope.MemRef4__phi"}
!13 = distinct !{!13, !7, !"polly.alias.scope.MemRef5"}
!14 = !{!9, !10, !6, !12, !13}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = !{!9, !10, !6, !11, !12}
!18 = !{!19, !19, i64 0}
!19 = !{!"any pointer", !4, i64 0}
!20 = !{!21}
!21 = distinct !{!21, !22, !"_init_: %data"}
!22 = distinct !{!22, !"_init_"}
!23 = !{!24}
!24 = distinct !{!24, !25, !"_init_: %data"}
!25 = distinct !{!25, !"_init_"}
!26 = !{!27, !28, !"polly.alias.scope.MemRef2", !29}
!27 = distinct !{!27, !28, !"polly.alias.scope.MemRef2"}
!28 = distinct !{!28, !"polly.alias.scope.domain"}
!29 = distinct !{!29, !30, !"_mat_mult_: %a"}
!30 = distinct !{!30, !"_mat_mult_"}
!31 = !{!32, !33, !34, !35, !36, !37, !38}
!32 = distinct !{!32, !28, !"polly.alias.scope.MemRef0__phi"}
!33 = distinct !{!33, !28, !"polly.alias.scope.MemRef1__phi"}
!34 = distinct !{!34, !28, !"polly.alias.scope.MemRef3"}
!35 = distinct !{!35, !28, !"polly.alias.scope.MemRef4__phi"}
!36 = distinct !{!36, !28, !"polly.alias.scope.MemRef5"}
!37 = distinct !{!37, !30, !"_mat_mult_: %b"}
!38 = distinct !{!38, !30, !"_mat_mult_: %data"}
!39 = !{!34, !28, !"polly.alias.scope.MemRef3", !37}
!40 = !{!32, !33, !27, !35, !36, !29, !38}
!41 = distinct !{!41, !16}
!42 = !{!36, !28, !"polly.alias.scope.MemRef5", !38}
!43 = !{!32, !33, !27, !34, !35, !29, !37}
!44 = distinct !{!44, !45, !"polly.alias.scope.MemRef0"}
!45 = distinct !{!45, !"polly.alias.scope.domain"}
!46 = !{}
!47 = distinct !{!47, !48, !49}
!48 = !{!"llvm.loop.vectorize.width", i32 1}
!49 = !{!"llvm.loop.interleave.count", i32 1}
!50 = distinct !{!50, !16}
!51 = distinct !{!51}
!52 = distinct !{!52, !53, !48, !49}
!53 = !{!"llvm.loop.unroll.runtime.disable"}
