; ModuleID = 'MatrixMult_original.c'
source_filename = "MatrixMult_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i64*, i64, i64, i64 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str.1 = private unnamed_addr constant [7 x i8] c" data:\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c" width:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c" height:\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @copy_Matrix(%struct.Matrix* nocapture readonly %_Matrix) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 32) #8
  %0 = bitcast i8* %call to %struct.Matrix*
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 1
  %1 = load i64, i64* %data_size, align 8, !tbaa !1
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8
  %2 = bitcast i8* %data_size1 to i64*
  store i64 %1, i64* %2, align 8, !tbaa !1
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 0
  %3 = load i64*, i64** %data, align 8, !tbaa !7
  %call3 = tail call i64* @copy1DArray_int64_t(i64* %3, i64 %1) #8
  %data4 = bitcast i8* %call to i64**
  store i64* %call3, i64** %data4, align 8, !tbaa !7
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 2
  %width5 = getelementptr inbounds i8, i8* %call, i64 16
  %4 = bitcast i64* %width to <2 x i64>*
  %5 = load <2 x i64>, <2 x i64>* %4, align 8, !tbaa !8
  %6 = bitcast i8* %width5 to <2 x i64>*
  store <2 x i64> %5, <2 x i64>* %6, align 8, !tbaa !8
  ret %struct.Matrix* %0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #2

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix** @copy_array_Matrix(%struct.Matrix** nocapture readonly %_Matrix, i64 %_Matrix_size) local_unnamed_addr #0 {
entry:
  %mul = shl i64 %_Matrix_size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #8
  %0 = bitcast i8* %call to %struct.Matrix**
  %cmp12 = icmp eq i64 %_Matrix_size, 0
  br i1 %cmp12, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret %struct.Matrix** %0

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.Matrix*, %struct.Matrix** %_Matrix, i64 %indvars.iv
  %1 = load %struct.Matrix*, %struct.Matrix** %arrayidx, align 8, !tbaa !9
  %call.i = tail call noalias i8* @malloc(i64 32) #8
  %data_size.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 1
  %2 = load i64, i64* %data_size.i, align 8, !tbaa !1
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %3 = bitcast i8* %data_size1.i to i64*
  store i64 %2, i64* %3, align 8, !tbaa !1
  %data.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 0
  %4 = load i64*, i64** %data.i, align 8, !tbaa !7
  %call3.i = tail call i64* @copy1DArray_int64_t(i64* %4, i64 %2) #8
  %data4.i = bitcast i8* %call.i to i64**
  store i64* %call3.i, i64** %data4.i, align 8, !tbaa !7
  %width.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 2
  %width5.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %5 = bitcast i64* %width.i to <2 x i64>*
  %6 = load <2 x i64>, <2 x i64>* %5, align 8, !tbaa !8
  %7 = bitcast i8* %width5.i to <2 x i64>*
  store <2 x i64> %6, <2 x i64>* %7, align 8, !tbaa !8
  %arrayidx4 = getelementptr inbounds %struct.Matrix*, %struct.Matrix** %0, i64 %indvars.iv
  %8 = bitcast %struct.Matrix** %arrayidx4 to i8**
  store i8* %call.i, i8** %8, align 8, !tbaa !9
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %_Matrix_size
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body
}

; Function Attrs: nounwind uwtable
define void @free_Matrix(%struct.Matrix* nocapture %matrix) local_unnamed_addr #0 {
entry:
  %0 = bitcast %struct.Matrix* %matrix to i8**
  %1 = load i8*, i8** %0, align 8, !tbaa !7
  tail call void @free(i8* %1) #8
  %2 = bitcast %struct.Matrix* %matrix to i8*
  tail call void @free(i8* %2) #8
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define void @printf_Matrix(%struct.Matrix* nocapture readonly %matrix) local_unnamed_addr #0 {
entry:
  %putchar = tail call i32 @putchar(i32 123) #8
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0))
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 0
  %0 = load i64*, i64** %data, align 8, !tbaa !7
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 1
  %1 = load i64, i64* %data_size, align 8, !tbaa !1
  tail call void @printf1DArray_int64_t(i64* %0, i64 %1) #8
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0))
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 2
  %2 = load i64, i64* %width, align 8, !tbaa !10
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i64 %2)
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0))
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 3
  %3 = load i64, i64* %height, align 8, !tbaa !11
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i64 %3)
  %putchar10 = tail call i32 @putchar(i32 125) #8
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @printf1DArray_int64_t(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @_matrix_(i64 %width, i64 %height, i64* %data, i64 %data_size) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 32) #8
  %0 = bitcast i8* %call to %struct.Matrix*
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8
  %1 = bitcast i8* %data_size1 to i64*
  store i64 %data_size, i64* %1, align 8, !tbaa !1
  %data2 = bitcast i8* %call to i64**
  store i64* %data, i64** %data2, align 8, !tbaa !7
  %height3 = getelementptr inbounds i8, i8* %call, i64 24
  %2 = bitcast i8* %height3 to i64*
  store i64 %height, i64* %2, align 8, !tbaa !11
  %width4 = getelementptr inbounds i8, i8* %call, i64 16
  %3 = bitcast i8* %width4 to i64*
  store i64 %width, i64* %3, align 8, !tbaa !10
  ret %struct.Matrix* %0
}

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @_init_(i64 %width, i64 %height) local_unnamed_addr #4 {
entry:
  %mul = mul nsw i64 %height, %width
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %mul) #8
  %cmp54 = icmp sgt i64 %height, 0
  br i1 %cmp54, label %polly.start, label %blklab2

blklab2.loopexit:                                 ; preds = %polly.loop_exit62
  br label %blklab2

blklab2:                                          ; preds = %blklab2.loopexit, %polly.start, %entry
  %call.i = tail call noalias i8* @malloc(i64 32) #8
  %0 = bitcast i8* %call.i to %struct.Matrix*
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %1 = bitcast i8* %data_size1.i to i64*
  store i64 %mul, i64* %1, align 8, !tbaa !1
  %data2.i = bitcast i8* %call.i to i64**
  store i64* %call, i64** %data2.i, align 8, !tbaa !7
  %height3.i = getelementptr inbounds i8, i8* %call.i, i64 24
  %2 = bitcast i8* %height3.i to i64*
  store i64 %height, i64* %2, align 8, !tbaa !11
  %width4.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %3 = bitcast i8* %width4.i to i64*
  store i64 %width, i64* %3, align 8, !tbaa !10
  ret %struct.Matrix* %0

polly.start:                                      ; preds = %entry
  %4 = add nsw i64 %height, -1
  %polly.fdiv_q.shr = ashr i64 %4, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %blklab2

polly.loop_header.preheader:                      ; preds = %polly.start
  %5 = add nsw i64 %width, -1
  %polly.fdiv_q.shr58 = ashr i64 %5, 5
  %polly.loop_guard63 = icmp sgt i64 %polly.fdiv_q.shr58, -1
  %pexp.p_div_q = lshr i64 %width, 2
  %6 = add nsw i64 %pexp.p_div_q, -1
  %pexp.pdiv_r = and i64 %width, 3
  %polly.loop_guard96 = icmp eq i64 %pexp.pdiv_r, 0
  %7 = and i64 %width, -4
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit62, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit62 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard63, label %polly.loop_header60.preheader, label %polly.loop_exit62

polly.loop_header60.preheader:                    ; preds = %polly.loop_header
  %8 = shl nsw i64 %polly.indvar, 5
  %9 = sub nsw i64 %height, %8
  %10 = add nsw i64 %9, -1
  %11 = icmp slt i64 %10, 31
  %12 = select i1 %11, i64 %10, i64 31
  %polly.loop_guard72 = icmp sgt i64 %12, -1
  %polly.adjust_ub75 = add i64 %12, -1
  br label %polly.loop_header60

polly.loop_exit62.loopexit:                       ; preds = %polly.loop_exit71
  br label %polly.loop_exit62

polly.loop_exit62:                                ; preds = %polly.loop_exit62.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond142 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond142, label %blklab2.loopexit, label %polly.loop_header, !llvm.loop !12

polly.loop_header60:                              ; preds = %polly.loop_exit71, %polly.loop_header60.preheader
  %polly.indvar64 = phi i64 [ %polly.indvar_next65, %polly.loop_exit71 ], [ 0, %polly.loop_header60.preheader ]
  br i1 %polly.loop_guard72, label %polly.loop_header69.preheader, label %polly.loop_exit71

polly.loop_header69.preheader:                    ; preds = %polly.loop_header60
  %13 = mul nsw i64 %polly.indvar64, -8
  %14 = add nsw i64 %6, %13
  %15 = icmp slt i64 %14, 7
  %16 = select i1 %15, i64 %14, i64 7
  %polly.loop_guard81 = icmp sgt i64 %16, -1
  %17 = shl i64 %polly.indvar64, 5
  %18 = or i64 %17, 31
  %19 = icmp slt i64 %18, %width
  %polly.adjust_ub84 = add i64 %16, -1
  br i1 %polly.loop_guard81, label %polly.loop_header69.us.preheader, label %polly.loop_header69.preheader.split

polly.loop_header69.us.preheader:                 ; preds = %polly.loop_header69.preheader
  %brmerge = or i1 %19, %polly.loop_guard96
  br label %polly.loop_header69.us

polly.loop_header69.us:                           ; preds = %polly.loop_header69.us.preheader, %polly.merge.us
  %polly.indvar73.us = phi i64 [ %polly.indvar_next74.us, %polly.merge.us ], [ 0, %polly.loop_header69.us.preheader ]
  %20 = add nuw nsw i64 %polly.indvar73.us, %8
  %21 = mul i64 %20, %width
  %22 = add i64 %21, %17
  %23 = insertelement <2 x i64> undef, i64 %20, i32 0
  %24 = shufflevector <2 x i64> %23, <2 x i64> undef, <2 x i32> zeroinitializer
  %25 = insertelement <2 x i64> undef, i64 %20, i32 0
  %26 = shufflevector <2 x i64> %25, <2 x i64> undef, <2 x i32> zeroinitializer
  br label %polly.loop_header78.us

polly.loop_header78.us:                           ; preds = %polly.loop_header69.us, %polly.loop_header78.us
  %polly.indvar82.us = phi i64 [ %polly.indvar_next83.us, %polly.loop_header78.us ], [ 0, %polly.loop_header69.us ]
  %27 = shl i64 %polly.indvar82.us, 2
  %28 = add i64 %22, %27
  %scevgep.us = getelementptr i64, i64* %call, i64 %28
  %29 = bitcast i64* %scevgep.us to <2 x i64>*
  %30 = load <2 x i64>, <2 x i64>* %29, align 8, !alias.scope !13, !noalias !15
  %31 = add nsw <2 x i64> %30, %24
  %32 = bitcast i64* %scevgep.us to <2 x i64>*
  store <2 x i64> %31, <2 x i64>* %32, align 8, !alias.scope !13, !noalias !15
  %33 = add i64 %28, 2
  %scevgep.us.2 = getelementptr i64, i64* %call, i64 %33
  %34 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  %35 = load <2 x i64>, <2 x i64>* %34, align 8, !alias.scope !13, !noalias !15
  %36 = add nsw <2 x i64> %35, %26
  %37 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  store <2 x i64> %36, <2 x i64>* %37, align 8, !alias.scope !13, !noalias !15
  %polly.indvar_next83.us = add nuw nsw i64 %polly.indvar82.us, 1
  %polly.loop_cond85.us = icmp sgt i64 %polly.indvar82.us, %polly.adjust_ub84
  br i1 %polly.loop_cond85.us, label %polly.cond.loopexit.us, label %polly.loop_header78.us

polly.loop_header93.us:                           ; preds = %polly.loop_header93.us, %polly.loop_header93.preheader.us
  %polly.indvar97.us = phi i64 [ %polly.indvar_next98.us, %polly.loop_header93.us ], [ 0, %polly.loop_header93.preheader.us ]
  %38 = add i64 %39, %polly.indvar97.us
  %scevgep103.us = getelementptr i64, i64* %call, i64 %38
  %_p_scalar_104.us = load i64, i64* %scevgep103.us, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %p_add7105.us = add nsw i64 %_p_scalar_104.us, %20
  store i64 %p_add7105.us, i64* %scevgep103.us, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next98.us = add nuw nsw i64 %polly.indvar97.us, 1
  %exitcond140 = icmp eq i64 %polly.indvar_next98.us, %pexp.pdiv_r
  br i1 %exitcond140, label %polly.merge.us.loopexit, label %polly.loop_header93.us, !llvm.loop !18

polly.merge.us.loopexit:                          ; preds = %polly.loop_header93.us
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next74.us = add nuw nsw i64 %polly.indvar73.us, 1
  %polly.loop_cond76.us = icmp sgt i64 %polly.indvar73.us, %polly.adjust_ub75
  br i1 %polly.loop_cond76.us, label %polly.loop_exit71.loopexit, label %polly.loop_header69.us

polly.loop_header93.preheader.us:                 ; preds = %polly.cond.loopexit.us
  %39 = add i64 %21, %7
  br label %polly.loop_header93.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header78.us
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header93.preheader.us

polly.loop_header69.preheader.split:              ; preds = %polly.loop_header69.preheader
  br i1 %19, label %polly.loop_exit71, label %polly.loop_header69.preheader172

polly.loop_header69.preheader172:                 ; preds = %polly.loop_header69.preheader.split
  br label %polly.loop_header69

polly.loop_exit71.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit71

polly.loop_exit71.loopexit173:                    ; preds = %polly.merge
  br label %polly.loop_exit71

polly.loop_exit71:                                ; preds = %polly.loop_exit71.loopexit173, %polly.loop_exit71.loopexit, %polly.loop_header69.preheader.split, %polly.loop_header60
  %polly.indvar_next65 = add nuw nsw i64 %polly.indvar64, 1
  %exitcond141 = icmp eq i64 %polly.indvar64, %polly.fdiv_q.shr58
  br i1 %exitcond141, label %polly.loop_exit62.loopexit, label %polly.loop_header60

polly.loop_header69:                              ; preds = %polly.loop_header69.preheader172, %polly.merge
  %polly.indvar73 = phi i64 [ %polly.indvar_next74, %polly.merge ], [ 0, %polly.loop_header69.preheader172 ]
  br i1 %polly.loop_guard96, label %polly.merge, label %polly.loop_header93.preheader

polly.merge.loopexit:                             ; preds = %polly.loop_header93
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header69
  %polly.indvar_next74 = add nuw nsw i64 %polly.indvar73, 1
  %polly.loop_cond76 = icmp sgt i64 %polly.indvar73, %polly.adjust_ub75
  br i1 %polly.loop_cond76, label %polly.loop_exit71.loopexit173, label %polly.loop_header69

polly.loop_header93.preheader:                    ; preds = %polly.loop_header69
  %40 = add nuw nsw i64 %polly.indvar73, %8
  %41 = mul i64 %40, %width
  %42 = add i64 %41, %7
  br label %polly.loop_header93

polly.loop_header93:                              ; preds = %polly.loop_header93, %polly.loop_header93.preheader
  %polly.indvar97 = phi i64 [ %polly.indvar_next98, %polly.loop_header93 ], [ 0, %polly.loop_header93.preheader ]
  %43 = add i64 %42, %polly.indvar97
  %scevgep103 = getelementptr i64, i64* %call, i64 %43
  %_p_scalar_104 = load i64, i64* %scevgep103, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %p_add7105 = add nsw i64 %_p_scalar_104, %40
  store i64 %p_add7105, i64* %scevgep103, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next98 = add nuw nsw i64 %polly.indvar97, 1
  %exitcond = icmp eq i64 %polly.indvar_next98, %pexp.pdiv_r
  br i1 %exitcond, label %polly.merge.loopexit, label %polly.loop_header93, !llvm.loop !22
}

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define void @_print_mat_(%struct._IO_FILE* nocapture readnone %sys, %struct.Matrix* nocapture readonly %a) local_unnamed_addr #0 {
entry:
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2
  %0 = load i64, i64* %width1, align 8, !tbaa !10
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height2, align 8, !tbaa !11
  %cmp50 = icmp sgt i64 %1, 0
  br i1 %cmp50, label %while.cond3.preheader.preheader, label %blklab6

while.cond3.preheader.preheader:                  ; preds = %entry
  %cmp548 = icmp sgt i64 %0, 0
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  br i1 %cmp548, label %while.cond3.preheader.us.preheader, label %while.cond3.preheader.preheader60

while.cond3.preheader.preheader60:                ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader

while.cond3.preheader.us.preheader:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader.us

while.cond3.preheader.us:                         ; preds = %while.cond3.preheader.us.preheader, %blklab8.loopexit.us
  %i.051.us = phi i64 [ %add11.us, %blklab8.loopexit.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %mul.us = mul nsw i64 %i.051.us, %0
  br label %if.end7.us

if.end7.us:                                       ; preds = %while.cond3.preheader.us, %if.end7.us
  %j.049.us = phi i64 [ %add10.us, %if.end7.us ], [ 0, %while.cond3.preheader.us ]
  %2 = load i64*, i64** %data, align 8, !tbaa !7
  %add.us = add nsw i64 %j.049.us, %mul.us
  %arrayidx.us = getelementptr inbounds i64, i64* %2, i64 %add.us
  %3 = load i64, i64* %arrayidx.us, align 8, !tbaa !8
  %call.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i64 %3)
  %call8.us = tail call i64* @create1DArray_int64_t(i64 0, i64 1) #8
  store i64 32, i64* %call8.us, align 8, !tbaa !8
  tail call void @printf_s(i64* %call8.us, i64 1) #8
  %add10.us = add nuw nsw i64 %j.049.us, 1
  %exitcond.us = icmp eq i64 %add10.us, %0
  br i1 %exitcond.us, label %blklab8.loopexit.us, label %if.end7.us

blklab8.loopexit.us:                              ; preds = %if.end7.us
  %add11.us = add nuw nsw i64 %i.051.us, 1
  %call12.us = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #8
  tail call void @println_s(i64* %call12.us, i64 0) #8
  %exitcond53.us = icmp eq i64 %add11.us, %1
  br i1 %exitcond53.us, label %blklab6.loopexit, label %while.cond3.preheader.us

while.cond3.preheader:                            ; preds = %while.cond3.preheader.preheader60, %while.cond3.preheader
  %i.051 = phi i64 [ %add11, %while.cond3.preheader ], [ 0, %while.cond3.preheader.preheader60 ]
  %add11 = add nuw nsw i64 %i.051, 1
  %call12 = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #8
  tail call void @println_s(i64* %call12, i64 0) #8
  %exitcond53 = icmp eq i64 %add11, %1
  br i1 %exitcond53, label %blklab6.loopexit61, label %while.cond3.preheader

blklab6.loopexit:                                 ; preds = %blklab8.loopexit.us
  br label %blklab6

blklab6.loopexit61:                               ; preds = %while.cond3.preheader
  br label %blklab6

blklab6:                                          ; preds = %blklab6.loopexit61, %blklab6.loopexit, %entry
  ret void
}

declare void @printf_s(i64*, i64) local_unnamed_addr #3

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @_mat_mult_(%struct.Matrix* nocapture readonly %a, %struct.Matrix* nocapture readonly %b) local_unnamed_addr #4 {
entry:
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 2
  %0 = load i64, i64* %width1, align 8, !tbaa !10
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height2, align 8, !tbaa !11
  %mul = mul nsw i64 %1, %0
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %mul) #8
  %data4 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %2 = load i64*, i64** %data4, align 8, !tbaa !7
  %data6 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0
  %3 = load i64*, i64** %data6, align 8, !tbaa !7
  %cmp110 = icmp sgt i64 %1, 0
  br i1 %cmp110, label %polly.split_new_and_old, label %blklab13

polly.split_new_and_old:                          ; preds = %entry
  %4 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 1)
  %.obit = extractvalue { i64, i1 } %4, 1
  %.res = extractvalue { i64, i1 } %4, 0
  %polly.access.mul. = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %0)
  %polly.access.mul..obit = extractvalue { i64, i1 } %polly.access.mul., 1
  %polly.overflow.state115 = or i1 %.obit, %polly.access.mul..obit
  %polly.access.mul..res = extractvalue { i64, i1 } %polly.access.mul., 0
  %polly.access.add. = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res, i64 %0)
  %polly.access.add..obit = extractvalue { i64, i1 } %polly.access.add., 1
  %polly.access.add..res = extractvalue { i64, i1 } %polly.access.add., 0
  %polly.access. = getelementptr i64, i64* %3, i64 %polly.access.add..res
  %polly.overflow.state118 = or i1 %polly.overflow.state115, %polly.access.add..obit
  %5 = icmp ule i64* %polly.access., %call
  %6 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.obit119 = extractvalue { i64, i1 } %6, 1
  %polly.overflow.state120 = or i1 %.obit119, %polly.overflow.state118
  %.res121 = extractvalue { i64, i1 } %6, 0
  %polly.access.mul.call122 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res121, i64 %0)
  %polly.access.mul.call.obit123 = extractvalue { i64, i1 } %polly.access.mul.call122, 1
  %polly.overflow.state124 = or i1 %polly.access.mul.call.obit123, %polly.overflow.state120
  %polly.access.mul.call.res125 = extractvalue { i64, i1 } %polly.access.mul.call122, 0
  %polly.access.add.call126 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call.res125, i64 %0)
  %polly.access.add.call.obit127 = extractvalue { i64, i1 } %polly.access.add.call126, 1
  %polly.access.add.call.res129 = extractvalue { i64, i1 } %polly.access.add.call126, 0
  %polly.access.call130 = getelementptr i64, i64* %call, i64 %polly.access.add.call.res129
  %polly.overflow.state137 = or i1 %polly.access.add.call.obit127, %polly.overflow.state124
  %7 = icmp ule i64* %polly.access.call130, %3
  %8 = or i1 %5, %7
  %polly.access.151 = getelementptr i64, i64* %2, i64 %polly.access.add.call.res129
  %9 = icmp ule i64* %polly.access.151, %call
  %10 = icmp ule i64* %polly.access.call130, %2
  %11 = or i1 %9, %10
  %12 = and i1 %8, %11
  %polly.rtc.overflown = xor i1 %polly.overflow.state137, true
  %polly.rtc.result = and i1 %12, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.start, label %while.cond7.preheader.preheader

while.cond7.preheader.preheader:                  ; preds = %polly.split_new_and_old
  %cmp9107 = icmp sgt i64 %0, 0
  br i1 %cmp9107, label %while.cond7.preheader.us.preheader, label %blklab13

while.cond7.preheader.us.preheader:               ; preds = %while.cond7.preheader.preheader
  %xtraiter387 = and i64 %0, 1
  %lcmp.mod388 = icmp eq i64 %xtraiter387, 0
  %13 = icmp eq i64 %0, 1
  br label %while.cond7.preheader.us

while.cond7.preheader.us:                         ; preds = %while.cond7.preheader.us.preheader, %blklab15.loopexit.us-lcssa.us.us
  %i.0111.us = phi i64 [ %add31.us, %blklab15.loopexit.us-lcssa.us.us ], [ 0, %while.cond7.preheader.us.preheader ]
  %mul17.us = mul nsw i64 %i.0111.us, %0
  %arrayidx20.us.us.prol = getelementptr inbounds i64, i64* %2, i64 %mul17.us
  br label %while.cond12.preheader.us.us

while.cond12.preheader.us.us:                     ; preds = %while.cond7.preheader.us, %blklab17.loopexit.us.us
  %j.0108.us.us = phi i64 [ %add30.us.us, %blklab17.loopexit.us.us ], [ 0, %while.cond7.preheader.us ]
  %add.us.us = add nsw i64 %j.0108.us.us, %mul17.us
  %arrayidx.us.us = getelementptr inbounds i64, i64* %call, i64 %add.us.us
  %.pre = load i64, i64* %arrayidx.us.us, align 8, !tbaa !8
  br i1 %lcmp.mod388, label %if.end16.us.us.prol.loopexit.unr-lcssa, label %if.end16.us.us.prol.preheader

if.end16.us.us.prol.preheader:                    ; preds = %while.cond12.preheader.us.us
  br label %if.end16.us.us.prol

if.end16.us.us.prol:                              ; preds = %if.end16.us.us.prol.preheader
  %14 = load i64, i64* %arrayidx20.us.us.prol, align 8, !tbaa !8
  %arrayidx23.us.us.prol = getelementptr inbounds i64, i64* %3, i64 %j.0108.us.us
  %15 = load i64, i64* %arrayidx23.us.us.prol, align 8, !tbaa !8
  %mul24.us.us.prol = mul nsw i64 %15, %14
  %add25.us.us.prol = add nsw i64 %mul24.us.us.prol, %.pre
  store i64 %add25.us.us.prol, i64* %arrayidx.us.us, align 8, !tbaa !8
  br label %if.end16.us.us.prol.loopexit.unr-lcssa

if.end16.us.us.prol.loopexit.unr-lcssa:           ; preds = %while.cond12.preheader.us.us, %if.end16.us.us.prol
  %.unr.ph = phi i64 [ %add25.us.us.prol, %if.end16.us.us.prol ], [ %.pre, %while.cond12.preheader.us.us ]
  %k.0106.us.us.unr.ph = phi i64 [ 1, %if.end16.us.us.prol ], [ 0, %while.cond12.preheader.us.us ]
  br label %if.end16.us.us.prol.loopexit

if.end16.us.us.prol.loopexit:                     ; preds = %if.end16.us.us.prol.loopexit.unr-lcssa
  br i1 %13, label %blklab17.loopexit.us.us, label %while.cond12.preheader.us.us.new

while.cond12.preheader.us.us.new:                 ; preds = %if.end16.us.us.prol.loopexit
  br label %if.end16.us.us

blklab17.loopexit.us.us.unr-lcssa:                ; preds = %if.end16.us.us
  br label %blklab17.loopexit.us.us

blklab17.loopexit.us.us:                          ; preds = %if.end16.us.us.prol.loopexit, %blklab17.loopexit.us.us.unr-lcssa
  %add30.us.us = add nuw nsw i64 %j.0108.us.us, 1
  %exitcond113.us.us = icmp eq i64 %add30.us.us, %0
  br i1 %exitcond113.us.us, label %blklab15.loopexit.us-lcssa.us.us, label %while.cond12.preheader.us.us

if.end16.us.us:                                   ; preds = %if.end16.us.us, %while.cond12.preheader.us.us.new
  %16 = phi i64 [ %.unr.ph, %while.cond12.preheader.us.us.new ], [ %add25.us.us.1, %if.end16.us.us ]
  %k.0106.us.us = phi i64 [ %k.0106.us.us.unr.ph, %while.cond12.preheader.us.us.new ], [ %add29.us.us.1, %if.end16.us.us ]
  %add19.us.us = add nsw i64 %k.0106.us.us, %mul17.us
  %arrayidx20.us.us = getelementptr inbounds i64, i64* %2, i64 %add19.us.us
  %17 = load i64, i64* %arrayidx20.us.us, align 8, !tbaa !8
  %mul21.us.us = mul nsw i64 %k.0106.us.us, %0
  %add22.us.us = add nsw i64 %mul21.us.us, %j.0108.us.us
  %arrayidx23.us.us = getelementptr inbounds i64, i64* %3, i64 %add22.us.us
  %18 = load i64, i64* %arrayidx23.us.us, align 8, !tbaa !8
  %mul24.us.us = mul nsw i64 %18, %17
  %add25.us.us = add nsw i64 %mul24.us.us, %16
  store i64 %add25.us.us, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add29.us.us = add nuw nsw i64 %k.0106.us.us, 1
  %add19.us.us.1 = add nsw i64 %add29.us.us, %mul17.us
  %arrayidx20.us.us.1 = getelementptr inbounds i64, i64* %2, i64 %add19.us.us.1
  %19 = load i64, i64* %arrayidx20.us.us.1, align 8, !tbaa !8
  %mul21.us.us.1 = mul nsw i64 %add29.us.us, %0
  %add22.us.us.1 = add nsw i64 %mul21.us.us.1, %j.0108.us.us
  %arrayidx23.us.us.1 = getelementptr inbounds i64, i64* %3, i64 %add22.us.us.1
  %20 = load i64, i64* %arrayidx23.us.us.1, align 8, !tbaa !8
  %mul24.us.us.1 = mul nsw i64 %20, %19
  %add25.us.us.1 = add nsw i64 %mul24.us.us.1, %add25.us.us
  store i64 %add25.us.us.1, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add29.us.us.1 = add nsw i64 %k.0106.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %add29.us.us.1, %0
  br i1 %exitcond.us.us.1, label %blklab17.loopexit.us.us.unr-lcssa, label %if.end16.us.us

blklab15.loopexit.us-lcssa.us.us:                 ; preds = %blklab17.loopexit.us.us
  %add31.us = add nuw nsw i64 %i.0111.us, 1
  %exitcond114.us = icmp eq i64 %add31.us, %1
  br i1 %exitcond114.us, label %blklab13.loopexit384, label %while.cond7.preheader.us

blklab13.loopexit:                                ; preds = %polly.loop_exit186
  br label %blklab13

blklab13.loopexit384:                             ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %blklab13

blklab13:                                         ; preds = %blklab13.loopexit384, %blklab13.loopexit, %while.cond7.preheader.preheader, %polly.start, %entry
  %call.i = tail call noalias i8* @malloc(i64 32) #8
  %21 = bitcast i8* %call.i to %struct.Matrix*
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %22 = bitcast i8* %data_size1.i to i64*
  store i64 %mul, i64* %22, align 8, !tbaa !1
  %data2.i = bitcast i8* %call.i to i64**
  store i64* %call, i64** %data2.i, align 8, !tbaa !7
  %height3.i = getelementptr inbounds i8, i8* %call.i, i64 24
  %23 = bitcast i8* %height3.i to i64*
  store i64 %1, i64* %23, align 8, !tbaa !11
  %width4.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %24 = bitcast i8* %width4.i to i64*
  store i64 %0, i64* %24, align 8, !tbaa !10
  ret %struct.Matrix* %21

polly.start:                                      ; preds = %polly.split_new_and_old
  %25 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %25, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %blklab13

polly.loop_header.preheader:                      ; preds = %polly.start
  %26 = add nsw i64 %0, -1
  %polly.fdiv_q.shr182 = ashr i64 %26, 5
  %polly.loop_guard187 = icmp sgt i64 %polly.fdiv_q.shr182, -1
  %pexp.p_div_q = lshr i64 %26, 5
  %pexp.p_div_q217 = lshr i64 %0, 2
  %27 = add nsw i64 %pexp.p_div_q217, -1
  %pexp.pdiv_r = and i64 %0, 3
  %polly.loop_guard241 = icmp eq i64 %pexp.pdiv_r, 0
  %28 = and i64 %0, -4
  %29 = add nsw i64 %pexp.pdiv_r, -1
  %xtraiter385 = and i64 %0, 1
  %lcmp.mod386 = icmp eq i64 %xtraiter385, 0
  %30 = mul i64 %28, %0
  %31 = icmp eq i64 %29, 0
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %32 = mul i64 %28, %0
  %33 = icmp eq i64 %29, 0
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit186, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit186 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard187, label %polly.loop_header184.preheader, label %polly.loop_exit186

polly.loop_header184.preheader:                   ; preds = %polly.loop_header
  %34 = shl nsw i64 %polly.indvar, 5
  %35 = sub nsw i64 %1, %34
  %36 = add nsw i64 %35, -1
  %37 = icmp slt i64 %36, 31
  %38 = select i1 %37, i64 %36, i64 31
  %polly.loop_guard203 = icmp sgt i64 %38, -1
  %polly.adjust_ub206 = add i64 %38, -1
  br label %polly.loop_header184

polly.loop_exit186.loopexit:                      ; preds = %polly.loop_exit194
  br label %polly.loop_exit186

polly.loop_exit186:                               ; preds = %polly.loop_exit186.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond339 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond339, label %blklab13.loopexit, label %polly.loop_header, !llvm.loop !23

polly.loop_header184:                             ; preds = %polly.loop_exit194, %polly.loop_header184.preheader
  %polly.indvar188 = phi i64 [ %polly.indvar_next189, %polly.loop_exit194 ], [ 0, %polly.loop_header184.preheader ]
  %39 = shl nsw i64 %polly.indvar188, 5
  %40 = sub nsw i64 %0, %39
  %41 = add nsw i64 %40, -1
  %42 = icmp slt i64 %41, 31
  %43 = select i1 %42, i64 %41, i64 31
  %polly.loop_guard212 = icmp sgt i64 %43, -1
  %polly.adjust_ub215 = add i64 %43, -1
  br label %polly.loop_header192

polly.loop_exit194:                               ; preds = %polly.loop_exit202
  %polly.indvar_next189 = add nuw nsw i64 %polly.indvar188, 1
  %exitcond338 = icmp eq i64 %polly.indvar188, %polly.fdiv_q.shr182
  br i1 %exitcond338, label %polly.loop_exit186.loopexit, label %polly.loop_header184

polly.loop_header192:                             ; preds = %polly.loop_exit202, %polly.loop_header184
  %polly.indvar195 = phi i64 [ 0, %polly.loop_header184 ], [ %polly.indvar_next196, %polly.loop_exit202 ]
  br i1 %polly.loop_guard203, label %polly.loop_header200.preheader, label %polly.loop_exit202

polly.loop_header200.preheader:                   ; preds = %polly.loop_header192
  %44 = mul nsw i64 %polly.indvar195, -8
  %45 = add nsw i64 %27, %44
  %46 = icmp slt i64 %45, 7
  %47 = select i1 %46, i64 %45, i64 7
  %polly.loop_guard222 = icmp sgt i64 %47, -1
  %48 = shl i64 %polly.indvar195, 5
  %49 = or i64 %48, 31
  %50 = icmp slt i64 %49, %0
  %polly.adjust_ub225 = add i64 %47, -1
  %brmerge = or i1 %50, %polly.loop_guard241
  br label %polly.loop_header200

polly.loop_exit202.loopexit:                      ; preds = %polly.loop_exit211
  br label %polly.loop_exit202

polly.loop_exit202:                               ; preds = %polly.loop_exit202.loopexit, %polly.loop_header192
  %polly.indvar_next196 = add nuw nsw i64 %polly.indvar195, 1
  %exitcond337 = icmp eq i64 %polly.indvar195, %pexp.p_div_q
  br i1 %exitcond337, label %polly.loop_exit194, label %polly.loop_header192

polly.loop_header200:                             ; preds = %polly.loop_header200.preheader, %polly.loop_exit211
  %polly.indvar204 = phi i64 [ %polly.indvar_next205, %polly.loop_exit211 ], [ 0, %polly.loop_header200.preheader ]
  br i1 %polly.loop_guard212, label %polly.loop_header209.preheader, label %polly.loop_exit211

polly.loop_header209.preheader:                   ; preds = %polly.loop_header200
  %51 = add nuw nsw i64 %polly.indvar204, %34
  %52 = mul i64 %51, %0
  br i1 %polly.loop_guard222, label %polly.loop_header209.us.preheader, label %polly.loop_header209.preheader.split

polly.loop_header209.us.preheader:                ; preds = %polly.loop_header209.preheader
  %53 = add i64 %28, %52
  %scevgep250.us.prol = getelementptr i64, i64* %2, i64 %53
  br label %polly.loop_header209.us

polly.loop_header209.us:                          ; preds = %polly.loop_header209.us.preheader, %polly.merge.us
  %polly.indvar213.us = phi i64 [ %polly.indvar_next214.us, %polly.merge.us ], [ 0, %polly.loop_header209.us.preheader ]
  %54 = add nuw nsw i64 %polly.indvar213.us, %39
  %55 = add i64 %54, %52
  %scevgep.us = getelementptr i64, i64* %call, i64 %55
  %scevgep.promoted258.us = load i64, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.loop_header219.us

polly.loop_header219.us:                          ; preds = %polly.loop_header209.us, %polly.loop_header219.us
  %p_add25.lcssa259.us = phi i64 [ %p_add25.us.3, %polly.loop_header219.us ], [ %scevgep.promoted258.us, %polly.loop_header209.us ]
  %polly.indvar223.us = phi i64 [ %polly.indvar_next224.us, %polly.loop_header219.us ], [ 0, %polly.loop_header209.us ]
  %56 = shl i64 %polly.indvar223.us, 2
  %57 = add nuw nsw i64 %56, %48
  %58 = add i64 %57, %52
  %scevgep233.us = getelementptr i64, i64* %2, i64 %58
  %_p_scalar_234.us = load i64, i64* %scevgep233.us, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %59 = mul i64 %57, %0
  %60 = add i64 %59, %54
  %scevgep235.us = getelementptr i64, i64* %3, i64 %60
  %_p_scalar_236.us = load i64, i64* %scevgep235.us, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul24.us = mul nsw i64 %_p_scalar_236.us, %_p_scalar_234.us
  %p_add25.us = add nsw i64 %p_mul24.us, %p_add25.lcssa259.us
  %61 = or i64 %57, 1
  %62 = add i64 %61, %52
  %scevgep233.us.1 = getelementptr i64, i64* %2, i64 %62
  %_p_scalar_234.us.1 = load i64, i64* %scevgep233.us.1, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %63 = mul i64 %61, %0
  %64 = add i64 %63, %54
  %scevgep235.us.1 = getelementptr i64, i64* %3, i64 %64
  %_p_scalar_236.us.1 = load i64, i64* %scevgep235.us.1, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul24.us.1 = mul nsw i64 %_p_scalar_236.us.1, %_p_scalar_234.us.1
  %p_add25.us.1 = add nsw i64 %p_mul24.us.1, %p_add25.us
  %65 = or i64 %57, 2
  %66 = add i64 %65, %52
  %scevgep233.us.2 = getelementptr i64, i64* %2, i64 %66
  %_p_scalar_234.us.2 = load i64, i64* %scevgep233.us.2, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %67 = mul i64 %65, %0
  %68 = add i64 %67, %54
  %scevgep235.us.2 = getelementptr i64, i64* %3, i64 %68
  %_p_scalar_236.us.2 = load i64, i64* %scevgep235.us.2, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul24.us.2 = mul nsw i64 %_p_scalar_236.us.2, %_p_scalar_234.us.2
  %p_add25.us.2 = add nsw i64 %p_mul24.us.2, %p_add25.us.1
  %69 = or i64 %57, 3
  %70 = add i64 %69, %52
  %scevgep233.us.3 = getelementptr i64, i64* %2, i64 %70
  %_p_scalar_234.us.3 = load i64, i64* %scevgep233.us.3, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %71 = mul i64 %69, %0
  %72 = add i64 %71, %54
  %scevgep235.us.3 = getelementptr i64, i64* %3, i64 %72
  %_p_scalar_236.us.3 = load i64, i64* %scevgep235.us.3, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul24.us.3 = mul nsw i64 %_p_scalar_236.us.3, %_p_scalar_234.us.3
  %p_add25.us.3 = add nsw i64 %p_mul24.us.3, %p_add25.us.2
  %polly.indvar_next224.us = add nuw nsw i64 %polly.indvar223.us, 1
  %polly.loop_cond226.us = icmp sgt i64 %polly.indvar223.us, %polly.adjust_ub225
  br i1 %polly.loop_cond226.us, label %polly.cond.loopexit.us, label %polly.loop_header219.us

polly.loop_header238.us:                          ; preds = %polly.loop_header238.us, %polly.loop_header238.us.preheader.new
  %p_add25255260.us = phi i64 [ %p_add25255260.us.unr.ph, %polly.loop_header238.us.preheader.new ], [ %p_add25255.us.1, %polly.loop_header238.us ]
  %polly.indvar242.us = phi i64 [ %polly.indvar242.us.unr.ph, %polly.loop_header238.us.preheader.new ], [ %polly.indvar_next243.us.1, %polly.loop_header238.us ]
  %73 = add nuw nsw i64 %polly.indvar242.us, %28
  %74 = add i64 %73, %52
  %scevgep250.us = getelementptr i64, i64* %2, i64 %74
  %_p_scalar_251.us = load i64, i64* %scevgep250.us, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %75 = mul i64 %73, %0
  %76 = add i64 %75, %54
  %scevgep252.us = getelementptr i64, i64* %3, i64 %76
  %_p_scalar_253.us = load i64, i64* %scevgep252.us, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul24254.us = mul nsw i64 %_p_scalar_253.us, %_p_scalar_251.us
  %p_add25255.us = add nsw i64 %p_mul24254.us, %p_add25255260.us
  %polly.indvar_next243.us = add nuw nsw i64 %polly.indvar242.us, 1
  %77 = add nuw nsw i64 %polly.indvar_next243.us, %28
  %78 = add i64 %77, %52
  %scevgep250.us.1 = getelementptr i64, i64* %2, i64 %78
  %_p_scalar_251.us.1 = load i64, i64* %scevgep250.us.1, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %79 = mul i64 %77, %0
  %80 = add i64 %79, %54
  %scevgep252.us.1 = getelementptr i64, i64* %3, i64 %80
  %_p_scalar_253.us.1 = load i64, i64* %scevgep252.us.1, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul24254.us.1 = mul nsw i64 %_p_scalar_253.us.1, %_p_scalar_251.us.1
  %p_add25255.us.1 = add nsw i64 %p_mul24254.us.1, %p_add25255.us
  %polly.indvar_next243.us.1 = add nsw i64 %polly.indvar242.us, 2
  %exitcond336.1 = icmp eq i64 %polly.indvar_next243.us.1, %pexp.pdiv_r
  br i1 %exitcond336.1, label %polly.merge.loopexit.us.unr-lcssa, label %polly.loop_header238.us, !llvm.loop !35

polly.merge.us:                                   ; preds = %polly.cond.loopexit.us, %polly.merge.loopexit.us
  %polly.indvar_next214.us = add nuw nsw i64 %polly.indvar213.us, 1
  %polly.loop_cond216.us = icmp sgt i64 %polly.indvar213.us, %polly.adjust_ub215
  br i1 %polly.loop_cond216.us, label %polly.loop_exit211.loopexit, label %polly.loop_header209.us

polly.merge.loopexit.us.unr-lcssa:                ; preds = %polly.loop_header238.us
  br label %polly.merge.loopexit.us

polly.merge.loopexit.us:                          ; preds = %polly.loop_header238.us.prol.loopexit, %polly.merge.loopexit.us.unr-lcssa
  %p_add25255.us.lcssa = phi i64 [ %p_add25255.us.lcssa.unr.ph, %polly.loop_header238.us.prol.loopexit ], [ %p_add25255.us.1, %polly.merge.loopexit.us.unr-lcssa ]
  store i64 %p_add25255.us.lcssa, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header219.us
  store i64 %p_add25.us.3, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header238.us.preheader

polly.loop_header238.us.preheader:                ; preds = %polly.cond.loopexit.us
  br i1 %lcmp.mod386, label %polly.loop_header238.us.prol.loopexit.unr-lcssa, label %polly.loop_header238.us.prol.preheader

polly.loop_header238.us.prol.preheader:           ; preds = %polly.loop_header238.us.preheader
  br label %polly.loop_header238.us.prol

polly.loop_header238.us.prol:                     ; preds = %polly.loop_header238.us.prol.preheader
  %_p_scalar_251.us.prol = load i64, i64* %scevgep250.us.prol, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %81 = add i64 %30, %54
  %scevgep252.us.prol = getelementptr i64, i64* %3, i64 %81
  %_p_scalar_253.us.prol = load i64, i64* %scevgep252.us.prol, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul24254.us.prol = mul nsw i64 %_p_scalar_253.us.prol, %_p_scalar_251.us.prol
  %p_add25255.us.prol = add nsw i64 %p_mul24254.us.prol, %p_add25.us.3
  br label %polly.loop_header238.us.prol.loopexit.unr-lcssa

polly.loop_header238.us.prol.loopexit.unr-lcssa:  ; preds = %polly.loop_header238.us.preheader, %polly.loop_header238.us.prol
  %p_add25255.us.lcssa.unr.ph = phi i64 [ %p_add25255.us.prol, %polly.loop_header238.us.prol ], [ undef, %polly.loop_header238.us.preheader ]
  %p_add25255260.us.unr.ph = phi i64 [ %p_add25255.us.prol, %polly.loop_header238.us.prol ], [ %p_add25.us.3, %polly.loop_header238.us.preheader ]
  %polly.indvar242.us.unr.ph = phi i64 [ 1, %polly.loop_header238.us.prol ], [ 0, %polly.loop_header238.us.preheader ]
  br label %polly.loop_header238.us.prol.loopexit

polly.loop_header238.us.prol.loopexit:            ; preds = %polly.loop_header238.us.prol.loopexit.unr-lcssa
  br i1 %31, label %polly.merge.loopexit.us, label %polly.loop_header238.us.preheader.new

polly.loop_header238.us.preheader.new:            ; preds = %polly.loop_header238.us.prol.loopexit
  br label %polly.loop_header238.us

polly.loop_header209.preheader.split:             ; preds = %polly.loop_header209.preheader
  br i1 %50, label %polly.loop_exit211, label %polly.loop_header209.preheader382

polly.loop_header209.preheader382:                ; preds = %polly.loop_header209.preheader.split
  %82 = add i64 %28, %52
  %scevgep250.prol = getelementptr i64, i64* %2, i64 %82
  br label %polly.loop_header209

polly.loop_exit211.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit211

polly.loop_exit211.loopexit383:                   ; preds = %polly.merge
  br label %polly.loop_exit211

polly.loop_exit211:                               ; preds = %polly.loop_exit211.loopexit383, %polly.loop_exit211.loopexit, %polly.loop_header209.preheader.split, %polly.loop_header200
  %polly.indvar_next205 = add nuw nsw i64 %polly.indvar204, 1
  %polly.loop_cond207 = icmp sgt i64 %polly.indvar204, %polly.adjust_ub206
  br i1 %polly.loop_cond207, label %polly.loop_exit202.loopexit, label %polly.loop_header200

polly.loop_header209:                             ; preds = %polly.loop_header209.preheader382, %polly.merge
  %polly.indvar213 = phi i64 [ %polly.indvar_next214, %polly.merge ], [ 0, %polly.loop_header209.preheader382 ]
  br i1 %polly.loop_guard241, label %polly.merge, label %polly.loop_header238.preheader

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header238
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.loop_header238.prol.loopexit, %polly.merge.loopexit.unr-lcssa
  %p_add25255.lcssa = phi i64 [ %p_add25255.lcssa.unr.ph, %polly.loop_header238.prol.loopexit ], [ %p_add25255.1, %polly.merge.loopexit.unr-lcssa ]
  store i64 %p_add25255.lcssa, i64* %scevgep248, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header209
  %polly.indvar_next214 = add nuw nsw i64 %polly.indvar213, 1
  %polly.loop_cond216 = icmp sgt i64 %polly.indvar213, %polly.adjust_ub215
  br i1 %polly.loop_cond216, label %polly.loop_exit211.loopexit383, label %polly.loop_header209

polly.loop_header238.preheader:                   ; preds = %polly.loop_header209
  %83 = add nuw nsw i64 %polly.indvar213, %39
  %84 = add i64 %83, %52
  %scevgep248 = getelementptr i64, i64* %call, i64 %84
  %scevgep248.promoted = load i64, i64* %scevgep248, align 8, !alias.scope !24, !noalias !26
  br i1 %lcmp.mod, label %polly.loop_header238.prol.loopexit.unr-lcssa, label %polly.loop_header238.prol.preheader

polly.loop_header238.prol.preheader:              ; preds = %polly.loop_header238.preheader
  br label %polly.loop_header238.prol

polly.loop_header238.prol:                        ; preds = %polly.loop_header238.prol.preheader
  %_p_scalar_251.prol = load i64, i64* %scevgep250.prol, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %85 = add i64 %32, %83
  %scevgep252.prol = getelementptr i64, i64* %3, i64 %85
  %_p_scalar_253.prol = load i64, i64* %scevgep252.prol, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul24254.prol = mul nsw i64 %_p_scalar_253.prol, %_p_scalar_251.prol
  %p_add25255.prol = add nsw i64 %p_mul24254.prol, %scevgep248.promoted
  br label %polly.loop_header238.prol.loopexit.unr-lcssa

polly.loop_header238.prol.loopexit.unr-lcssa:     ; preds = %polly.loop_header238.preheader, %polly.loop_header238.prol
  %p_add25255.lcssa.unr.ph = phi i64 [ %p_add25255.prol, %polly.loop_header238.prol ], [ undef, %polly.loop_header238.preheader ]
  %p_add25255260.unr.ph = phi i64 [ %p_add25255.prol, %polly.loop_header238.prol ], [ %scevgep248.promoted, %polly.loop_header238.preheader ]
  %polly.indvar242.unr.ph = phi i64 [ 1, %polly.loop_header238.prol ], [ 0, %polly.loop_header238.preheader ]
  br label %polly.loop_header238.prol.loopexit

polly.loop_header238.prol.loopexit:               ; preds = %polly.loop_header238.prol.loopexit.unr-lcssa
  br i1 %33, label %polly.merge.loopexit, label %polly.loop_header238.preheader.new

polly.loop_header238.preheader.new:               ; preds = %polly.loop_header238.prol.loopexit
  br label %polly.loop_header238

polly.loop_header238:                             ; preds = %polly.loop_header238, %polly.loop_header238.preheader.new
  %p_add25255260 = phi i64 [ %p_add25255260.unr.ph, %polly.loop_header238.preheader.new ], [ %p_add25255.1, %polly.loop_header238 ]
  %polly.indvar242 = phi i64 [ %polly.indvar242.unr.ph, %polly.loop_header238.preheader.new ], [ %polly.indvar_next243.1, %polly.loop_header238 ]
  %86 = add nuw nsw i64 %polly.indvar242, %28
  %87 = add i64 %86, %52
  %scevgep250 = getelementptr i64, i64* %2, i64 %87
  %_p_scalar_251 = load i64, i64* %scevgep250, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %88 = mul i64 %86, %0
  %89 = add i64 %88, %83
  %scevgep252 = getelementptr i64, i64* %3, i64 %89
  %_p_scalar_253 = load i64, i64* %scevgep252, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul24254 = mul nsw i64 %_p_scalar_253, %_p_scalar_251
  %p_add25255 = add nsw i64 %p_mul24254, %p_add25255260
  %polly.indvar_next243 = add nuw nsw i64 %polly.indvar242, 1
  %90 = add nuw nsw i64 %polly.indvar_next243, %28
  %91 = add i64 %90, %52
  %scevgep250.1 = getelementptr i64, i64* %2, i64 %91
  %_p_scalar_251.1 = load i64, i64* %scevgep250.1, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %92 = mul i64 %90, %0
  %93 = add i64 %92, %83
  %scevgep252.1 = getelementptr i64, i64* %3, i64 %93
  %_p_scalar_253.1 = load i64, i64* %scevgep252.1, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul24254.1 = mul nsw i64 %_p_scalar_253.1, %_p_scalar_251.1
  %p_add25255.1 = add nsw i64 %p_mul24254.1, %p_add25255
  %polly.indvar_next243.1 = add nsw i64 %polly.indvar242, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next243.1, %pexp.pdiv_r
  br i1 %exitcond.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header238, !llvm.loop !36
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #5 {
entry:
  %_7_size = alloca i64, align 8
  %_7_size_size = alloca i64, align 8
  %0 = bitcast i64* %_7_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #8
  store i64 0, i64* %_7_size, align 8, !tbaa !8
  %1 = bitcast i64* %_7_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #8
  store i64 0, i64* %_7_size_size, align 8, !tbaa !8
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_7_size, i64* nonnull %_7_size_size) #8
  %2 = load i64*, i64** %call, align 8, !tbaa !9
  %call1 = call i64* @parseStringToInt(i64* %2) #8
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab19, label %if.end

if.end:                                           ; preds = %entry
  %3 = load i64, i64* %call1, align 8, !tbaa !8
  %call2 = call i64* @create1DArray_int64_t(i64 0, i64 7) #8
  %4 = bitcast i64* %call2 to <2 x i64>*
  store <2 x i64> <i64 115, i64 105>, <2 x i64>* %4, align 8, !tbaa !8
  %arrayidx5 = getelementptr inbounds i64, i64* %call2, i64 2
  %5 = bitcast i64* %arrayidx5 to <2 x i64>*
  store <2 x i64> <i64 122, i64 101>, <2 x i64>* %5, align 8, !tbaa !8
  %arrayidx7 = getelementptr inbounds i64, i64* %call2, i64 4
  %6 = bitcast i64* %arrayidx7 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %6, align 8, !tbaa !8
  %arrayidx9 = getelementptr inbounds i64, i64* %call2, i64 6
  store i64 32, i64* %arrayidx9, align 8, !tbaa !8
  call void @printf_s(i64* %call2, i64 7) #8
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 %3)
  %call11 = call %struct.Matrix* @_init_(i64 %3, i64 %3)
  %call12 = call %struct.Matrix* @_init_(i64 %3, i64 %3)
  %call13 = call %struct.Matrix* @_mat_mult_(%struct.Matrix* %call11, %struct.Matrix* %call12)
  %call14 = call i64* @create1DArray_int64_t(i64 0, i64 27) #8
  %7 = bitcast i64* %call14 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %7, align 8, !tbaa !8
  %arrayidx17 = getelementptr inbounds i64, i64* %call14, i64 2
  %8 = bitcast i64* %arrayidx17 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %8, align 8, !tbaa !8
  %arrayidx19 = getelementptr inbounds i64, i64* %call14, i64 4
  %9 = bitcast i64* %arrayidx19 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %9, align 8, !tbaa !8
  %arrayidx21 = getelementptr inbounds i64, i64* %call14, i64 6
  %10 = bitcast i64* %arrayidx21 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %10, align 8, !tbaa !8
  %arrayidx23 = getelementptr inbounds i64, i64* %call14, i64 8
  %11 = bitcast i64* %arrayidx23 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %11, align 8, !tbaa !8
  %arrayidx25 = getelementptr inbounds i64, i64* %call14, i64 10
  %12 = bitcast i64* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %12, align 8, !tbaa !8
  %arrayidx27 = getelementptr inbounds i64, i64* %call14, i64 12
  %13 = bitcast i64* %arrayidx27 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %13, align 8, !tbaa !8
  %arrayidx29 = getelementptr inbounds i64, i64* %call14, i64 14
  %14 = bitcast i64* %arrayidx29 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %14, align 8, !tbaa !8
  %arrayidx31 = getelementptr inbounds i64, i64* %call14, i64 16
  %15 = bitcast i64* %arrayidx31 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %15, align 8, !tbaa !8
  %arrayidx33 = getelementptr inbounds i64, i64* %call14, i64 18
  %16 = bitcast i64* %arrayidx33 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %16, align 8, !tbaa !8
  %arrayidx35 = getelementptr inbounds i64, i64* %call14, i64 20
  %17 = bitcast i64* %arrayidx35 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %17, align 8, !tbaa !8
  %arrayidx37 = getelementptr inbounds i64, i64* %call14, i64 22
  %18 = bitcast i64* %arrayidx37 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %18, align 8, !tbaa !8
  %arrayidx39 = getelementptr inbounds i64, i64* %call14, i64 24
  %19 = bitcast i64* %arrayidx39 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %19, align 8, !tbaa !8
  %arrayidx41 = getelementptr inbounds i64, i64* %call14, i64 26
  store i64 32, i64* %arrayidx41, align 8, !tbaa !8
  call void @printf_s(i64* %call14, i64 27) #8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call13, i64 0, i32 0
  %20 = load i64*, i64** %data, align 8, !tbaa !7
  %add = mul i64 %3, %3
  %sub42 = add nsw i64 %add, -1
  %arrayidx43 = getelementptr inbounds i64, i64* %20, i64 %sub42
  %21 = load i64, i64* %arrayidx43, align 8, !tbaa !8
  %call44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 %21)
  %call45 = call i64* @create1DArray_int64_t(i64 0, i64 25) #8
  %22 = bitcast i64* %call45 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %22, align 8, !tbaa !8
  %arrayidx48 = getelementptr inbounds i64, i64* %call45, i64 2
  %23 = bitcast i64* %arrayidx48 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %23, align 8, !tbaa !8
  %arrayidx50 = getelementptr inbounds i64, i64* %call45, i64 4
  %24 = bitcast i64* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %24, align 8, !tbaa !8
  %arrayidx52 = getelementptr inbounds i64, i64* %call45, i64 6
  %25 = bitcast i64* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %25, align 8, !tbaa !8
  %arrayidx54 = getelementptr inbounds i64, i64* %call45, i64 8
  %26 = bitcast i64* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %26, align 8, !tbaa !8
  %arrayidx56 = getelementptr inbounds i64, i64* %call45, i64 10
  %27 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %27, align 8, !tbaa !8
  %arrayidx58 = getelementptr inbounds i64, i64* %call45, i64 12
  %28 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %28, align 8, !tbaa !8
  %arrayidx60 = getelementptr inbounds i64, i64* %call45, i64 14
  %29 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %29, align 8, !tbaa !8
  %arrayidx62 = getelementptr inbounds i64, i64* %call45, i64 16
  %30 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %30, align 8, !tbaa !8
  %arrayidx64 = getelementptr inbounds i64, i64* %call45, i64 18
  %31 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %31, align 8, !tbaa !8
  %arrayidx66 = getelementptr inbounds i64, i64* %call45, i64 20
  %32 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %32, align 8, !tbaa !8
  %arrayidx68 = getelementptr inbounds i64, i64* %call45, i64 22
  %33 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %33, align 8, !tbaa !8
  %arrayidx70 = getelementptr inbounds i64, i64* %call45, i64 24
  store i64 101, i64* %arrayidx70, align 8, !tbaa !8
  call void @println_s(i64* %call45, i64 25) #8
  br label %blklab19

blklab19:                                         ; preds = %entry, %if.end
  call void @exit(i32 0) #9
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #6

declare i32 @putchar(i32) local_unnamed_addr

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #7

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #7

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #7

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"}
!1 = !{!2, !6, i64 8}
!2 = !{!"", !3, i64 0, !6, i64 8, !6, i64 16, !6, i64 24}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!"long", !4, i64 0}
!7 = !{!2, !3, i64 0}
!8 = !{!6, !6, i64 0}
!9 = !{!3, !3, i64 0}
!10 = !{!2, !6, i64 16}
!11 = !{!2, !6, i64 24}
!12 = distinct !{!12}
!13 = distinct !{!13, !14, !"polly.alias.scope.call"}
!14 = distinct !{!14, !"polly.alias.scope.domain"}
!15 = !{}
!16 = !{!12, !17}
!17 = distinct !{!17}
!18 = distinct !{!18, !19, !20, !21}
!19 = !{!"llvm.loop.unroll.runtime.disable"}
!20 = !{!"llvm.loop.vectorize.width", i32 1}
!21 = !{!"llvm.loop.interleave.count", i32 1}
!22 = distinct !{!22, !19, !20, !21}
!23 = distinct !{!23}
!24 = distinct !{!24, !25, !"polly.alias.scope.call"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27, !28}
!27 = distinct !{!27, !25, !"polly.alias.scope."}
!28 = distinct !{!28, !25, !"polly.alias.scope."}
!29 = !{!24, !27}
!30 = !{!23, !31}
!31 = distinct !{!31}
!32 = !{!24, !28}
!33 = !{!23, !34}
!34 = distinct !{!34}
!35 = distinct !{!35, !20, !21}
!36 = distinct !{!36, !20, !21}
