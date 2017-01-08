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
define noalias %struct.Matrix* @_matrix_(i64 %width, i64 %height, i64* %data, i64 %data_size, i1 zeroext %data_dealloc) local_unnamed_addr #0 {
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
  %cmp790 = icmp sgt i64 %height, 0
  br i1 %cmp790, label %polly.start, label %if.end24

if.end24.loopexit:                                ; preds = %polly.loop_exit98
  br label %if.end24

if.end24:                                         ; preds = %if.end24.loopexit, %polly.start, %entry
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
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %if.end24

polly.loop_header.preheader:                      ; preds = %polly.start
  %5 = add nsw i64 %width, -1
  %polly.fdiv_q.shr94 = ashr i64 %5, 5
  %polly.loop_guard99 = icmp sgt i64 %polly.fdiv_q.shr94, -1
  %pexp.p_div_q = lshr i64 %width, 2
  %6 = add nsw i64 %pexp.p_div_q, -1
  %pexp.pdiv_r = and i64 %width, 3
  %polly.loop_guard132 = icmp eq i64 %pexp.pdiv_r, 0
  %7 = and i64 %width, -4
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit98, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit98 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard99, label %polly.loop_header96.preheader, label %polly.loop_exit98

polly.loop_header96.preheader:                    ; preds = %polly.loop_header
  %8 = shl nsw i64 %polly.indvar, 5
  %9 = sub nsw i64 %height, %8
  %10 = add nsw i64 %9, -1
  %11 = icmp slt i64 %10, 31
  %12 = select i1 %11, i64 %10, i64 31
  %polly.loop_guard108 = icmp sgt i64 %12, -1
  %polly.adjust_ub111 = add i64 %12, -1
  br label %polly.loop_header96

polly.loop_exit98.loopexit:                       ; preds = %polly.loop_exit107
  br label %polly.loop_exit98

polly.loop_exit98:                                ; preds = %polly.loop_exit98.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond178 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond178, label %if.end24.loopexit, label %polly.loop_header, !llvm.loop !12

polly.loop_header96:                              ; preds = %polly.loop_exit107, %polly.loop_header96.preheader
  %polly.indvar100 = phi i64 [ %polly.indvar_next101, %polly.loop_exit107 ], [ 0, %polly.loop_header96.preheader ]
  br i1 %polly.loop_guard108, label %polly.loop_header105.preheader, label %polly.loop_exit107

polly.loop_header105.preheader:                   ; preds = %polly.loop_header96
  %13 = mul nsw i64 %polly.indvar100, -8
  %14 = add nsw i64 %6, %13
  %15 = icmp slt i64 %14, 7
  %16 = select i1 %15, i64 %14, i64 7
  %polly.loop_guard117 = icmp sgt i64 %16, -1
  %17 = shl i64 %polly.indvar100, 5
  %18 = or i64 %17, 31
  %19 = icmp slt i64 %18, %width
  %polly.adjust_ub120 = add i64 %16, -1
  br i1 %polly.loop_guard117, label %polly.loop_header105.us.preheader, label %polly.loop_header105.preheader.split

polly.loop_header105.us.preheader:                ; preds = %polly.loop_header105.preheader
  %brmerge = or i1 %19, %polly.loop_guard132
  br label %polly.loop_header105.us

polly.loop_header105.us:                          ; preds = %polly.loop_header105.us.preheader, %polly.merge.us
  %polly.indvar109.us = phi i64 [ %polly.indvar_next110.us, %polly.merge.us ], [ 0, %polly.loop_header105.us.preheader ]
  %20 = add nuw nsw i64 %polly.indvar109.us, %8
  %21 = mul i64 %20, %width
  %22 = add i64 %21, %17
  %23 = insertelement <2 x i64> undef, i64 %20, i32 0
  %24 = shufflevector <2 x i64> %23, <2 x i64> undef, <2 x i32> zeroinitializer
  %25 = insertelement <2 x i64> undef, i64 %20, i32 0
  %26 = shufflevector <2 x i64> %25, <2 x i64> undef, <2 x i32> zeroinitializer
  br label %polly.loop_header114.us

polly.loop_header114.us:                          ; preds = %polly.loop_header105.us, %polly.loop_header114.us
  %polly.indvar118.us = phi i64 [ %polly.indvar_next119.us, %polly.loop_header114.us ], [ 0, %polly.loop_header105.us ]
  %27 = shl i64 %polly.indvar118.us, 2
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
  %polly.indvar_next119.us = add nuw nsw i64 %polly.indvar118.us, 1
  %polly.loop_cond121.us = icmp sgt i64 %polly.indvar118.us, %polly.adjust_ub120
  br i1 %polly.loop_cond121.us, label %polly.cond.loopexit.us, label %polly.loop_header114.us

polly.loop_header129.us:                          ; preds = %polly.loop_header129.us, %polly.loop_header129.preheader.us
  %polly.indvar133.us = phi i64 [ %polly.indvar_next134.us, %polly.loop_header129.us ], [ 0, %polly.loop_header129.preheader.us ]
  %38 = add i64 %39, %polly.indvar133.us
  %scevgep139.us = getelementptr i64, i64* %call, i64 %38
  %_p_scalar_140.us = load i64, i64* %scevgep139.us, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %p_add16141.us = add nsw i64 %_p_scalar_140.us, %20
  store i64 %p_add16141.us, i64* %scevgep139.us, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next134.us = add nuw nsw i64 %polly.indvar133.us, 1
  %exitcond176 = icmp eq i64 %polly.indvar_next134.us, %pexp.pdiv_r
  br i1 %exitcond176, label %polly.merge.us.loopexit, label %polly.loop_header129.us, !llvm.loop !18

polly.merge.us.loopexit:                          ; preds = %polly.loop_header129.us
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next110.us = add nuw nsw i64 %polly.indvar109.us, 1
  %polly.loop_cond112.us = icmp sgt i64 %polly.indvar109.us, %polly.adjust_ub111
  br i1 %polly.loop_cond112.us, label %polly.loop_exit107.loopexit, label %polly.loop_header105.us

polly.loop_header129.preheader.us:                ; preds = %polly.cond.loopexit.us
  %39 = add i64 %21, %7
  br label %polly.loop_header129.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header114.us
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header129.preheader.us

polly.loop_header105.preheader.split:             ; preds = %polly.loop_header105.preheader
  br i1 %19, label %polly.loop_exit107, label %polly.loop_header105.preheader208

polly.loop_header105.preheader208:                ; preds = %polly.loop_header105.preheader.split
  br label %polly.loop_header105

polly.loop_exit107.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit107

polly.loop_exit107.loopexit209:                   ; preds = %polly.merge
  br label %polly.loop_exit107

polly.loop_exit107:                               ; preds = %polly.loop_exit107.loopexit209, %polly.loop_exit107.loopexit, %polly.loop_header105.preheader.split, %polly.loop_header96
  %polly.indvar_next101 = add nuw nsw i64 %polly.indvar100, 1
  %exitcond177 = icmp eq i64 %polly.indvar100, %polly.fdiv_q.shr94
  br i1 %exitcond177, label %polly.loop_exit98.loopexit, label %polly.loop_header96

polly.loop_header105:                             ; preds = %polly.loop_header105.preheader208, %polly.merge
  %polly.indvar109 = phi i64 [ %polly.indvar_next110, %polly.merge ], [ 0, %polly.loop_header105.preheader208 ]
  br i1 %polly.loop_guard132, label %polly.merge, label %polly.loop_header129.preheader

polly.merge.loopexit:                             ; preds = %polly.loop_header129
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header105
  %polly.indvar_next110 = add nuw nsw i64 %polly.indvar109, 1
  %polly.loop_cond112 = icmp sgt i64 %polly.indvar109, %polly.adjust_ub111
  br i1 %polly.loop_cond112, label %polly.loop_exit107.loopexit209, label %polly.loop_header105

polly.loop_header129.preheader:                   ; preds = %polly.loop_header105
  %40 = add nuw nsw i64 %polly.indvar109, %8
  %41 = mul i64 %40, %width
  %42 = add i64 %41, %7
  br label %polly.loop_header129

polly.loop_header129:                             ; preds = %polly.loop_header129, %polly.loop_header129.preheader
  %polly.indvar133 = phi i64 [ %polly.indvar_next134, %polly.loop_header129 ], [ 0, %polly.loop_header129.preheader ]
  %43 = add i64 %42, %polly.indvar133
  %scevgep139 = getelementptr i64, i64* %call, i64 %43
  %_p_scalar_140 = load i64, i64* %scevgep139, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %p_add16141 = add nsw i64 %_p_scalar_140, %40
  store i64 %p_add16141, i64* %scevgep139, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next134 = add nuw nsw i64 %polly.indvar133, 1
  %exitcond = icmp eq i64 %polly.indvar_next134, %pexp.pdiv_r
  br i1 %exitcond, label %polly.merge.loopexit, label %polly.loop_header129, !llvm.loop !22
}

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define void @_print_mat_(%struct._IO_FILE* nocapture readnone %sys, %struct.Matrix* nocapture %a, i1 zeroext %a_dealloc) local_unnamed_addr #4 {
entry:
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2
  %0 = load i64, i64* %width1, align 8, !tbaa !10
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height2, align 8, !tbaa !11
  %cmp93 = icmp sgt i64 %1, 0
  br i1 %cmp93, label %while.cond3.preheader.preheader, label %blklab6

while.cond3.preheader.preheader:                  ; preds = %entry
  %cmp588 = icmp sgt i64 %0, 0
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  br i1 %cmp588, label %while.cond3.preheader.us.preheader, label %while.cond3.preheader.preheader114

while.cond3.preheader.preheader114:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader

while.cond3.preheader.us.preheader:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader.us

while.cond3.preheader.us:                         ; preds = %while.cond3.preheader.us.preheader, %polly.merge_new_and_old.us
  %_25_dealloc.099.us = phi i8 [ %.87.us, %polly.merge_new_and_old.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %_25.098.us = phi i8* [ %6, %polly.merge_new_and_old.us ], [ undef, %while.cond3.preheader.us.preheader ]
  %_18_dealloc.097.us = phi i8 [ %..us, %polly.merge_new_and_old.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %_18.096.us = phi i64* [ %call13.us, %polly.merge_new_and_old.us ], [ null, %while.cond3.preheader.us.preheader ]
  %i.094.us = phi i64 [ %add19.merge.us, %polly.merge_new_and_old.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %mul.us = mul nsw i64 %i.094.us, %0
  br label %if.end9.us

if.end9.us:                                       ; preds = %while.cond3.preheader.us, %if.end12.us
  %_18_dealloc.191.us = phi i8 [ %..us, %if.end12.us ], [ %_18_dealloc.097.us, %while.cond3.preheader.us ]
  %_18.190.us = phi i64* [ %call13.us, %if.end12.us ], [ %_18.096.us, %while.cond3.preheader.us ]
  %j.089.us = phi i64 [ %add18.us, %if.end12.us ], [ 0, %while.cond3.preheader.us ]
  %2 = load i64*, i64** %data, align 8, !tbaa !7
  %add.us = add nsw i64 %j.089.us, %mul.us
  %arrayidx.us = getelementptr inbounds i64, i64* %2, i64 %add.us
  %3 = load i64, i64* %arrayidx.us, align 8, !tbaa !8
  %call.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i64 %3)
  %4 = and i8 %_18_dealloc.191.us, 1
  %tobool10.us = icmp eq i8 %4, 0
  br i1 %tobool10.us, label %if.end12.us, label %if.then11.us

if.then11.us:                                     ; preds = %if.end9.us
  %5 = bitcast i64* %_18.190.us to i8*
  tail call void @free(i8* %5) #8
  br label %if.end12.us

if.end12.us:                                      ; preds = %if.then11.us, %if.end9.us
  %call13.us = tail call i64* @create1DArray_int64_t(i64 0, i64 1) #8
  store i64 32, i64* %call13.us, align 8, !tbaa !8
  %not.cmp15.us = icmp ne i64* %call13.us, null
  %..us = zext i1 %not.cmp15.us to i8
  tail call void @printf_s(i64* %call13.us, i64 1) #8
  %add18.us = add nuw nsw i64 %j.089.us, 1
  %exitcond.us = icmp eq i64 %add18.us, %0
  br i1 %exitcond.us, label %polly.split_new_and_old.loopexit.us, label %if.end9.us

if.then21.us:                                     ; preds = %polly.split_new_and_old.loopexit.us
  tail call void @free(i8* %_25.098.us) #8
  br label %polly.merge_new_and_old.us

polly.merge_new_and_old.us:                       ; preds = %if.then21.us, %polly.split_new_and_old.loopexit.us
  %add19.merge.us = add i64 %i.094.us, 1
  %call23.us = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #8
  %6 = bitcast i64* %call23.us to i8*
  %not.cmp24.us = icmp ne i64* %call23.us, null
  %.87.us = zext i1 %not.cmp24.us to i8
  tail call void @println_s(i64* %call23.us, i64 0) #8
  %exitcond104.us = icmp eq i64 %add19.merge.us, %1
  br i1 %exitcond104.us, label %blklab6.loopexit, label %while.cond3.preheader.us

polly.split_new_and_old.loopexit.us:              ; preds = %if.end12.us
  %7 = icmp eq i8 %_25_dealloc.099.us, 0
  br i1 %7, label %polly.merge_new_and_old.us, label %if.then21.us

while.cond3.preheader:                            ; preds = %while.cond3.preheader.preheader114, %polly.merge_new_and_old
  %_25_dealloc.099 = phi i8 [ %.87, %polly.merge_new_and_old ], [ 0, %while.cond3.preheader.preheader114 ]
  %_25.098 = phi i8* [ %9, %polly.merge_new_and_old ], [ undef, %while.cond3.preheader.preheader114 ]
  %i.094 = phi i64 [ %add19.merge, %polly.merge_new_and_old ], [ 0, %while.cond3.preheader.preheader114 ]
  %8 = icmp eq i8 %_25_dealloc.099, 0
  br i1 %8, label %polly.merge_new_and_old, label %if.then21

if.then21:                                        ; preds = %while.cond3.preheader
  tail call void @free(i8* %_25.098) #8
  br label %polly.merge_new_and_old

polly.merge_new_and_old:                          ; preds = %while.cond3.preheader, %if.then21
  %add19.merge = add i64 %i.094, 1
  %call23 = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #8
  %9 = bitcast i64* %call23 to i8*
  %not.cmp24 = icmp ne i64* %call23, null
  %.87 = zext i1 %not.cmp24 to i8
  tail call void @println_s(i64* %call23, i64 0) #8
  %exitcond104 = icmp eq i64 %add19.merge, %1
  br i1 %exitcond104, label %blklab6.loopexit115, label %while.cond3.preheader

blklab6.loopexit:                                 ; preds = %polly.merge_new_and_old.us
  %phitmp = bitcast i64* %call13.us to i8*
  br label %blklab6

blklab6.loopexit115:                              ; preds = %polly.merge_new_and_old
  br label %blklab6

blklab6:                                          ; preds = %blklab6.loopexit115, %blklab6.loopexit, %entry
  %_18.0.lcssa = phi i8* [ null, %entry ], [ %phitmp, %blklab6.loopexit ], [ null, %blklab6.loopexit115 ]
  %_18_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %..us, %blklab6.loopexit ], [ 0, %blklab6.loopexit115 ]
  %_25.0.lcssa = phi i8* [ undef, %entry ], [ %6, %blklab6.loopexit ], [ %9, %blklab6.loopexit115 ]
  %_25_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %.87.us, %blklab6.loopexit ], [ %.87, %blklab6.loopexit115 ]
  br i1 %a_dealloc, label %if.then29, label %if.end33

if.then29:                                        ; preds = %blklab6
  %10 = bitcast %struct.Matrix* %a to i8**
  %11 = load i8*, i8** %10, align 8, !tbaa !7
  tail call void @free(i8* %11) #8
  %12 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %12) #8
  br label %if.end33

if.end33:                                         ; preds = %blklab6, %if.then29
  %tobool34 = icmp eq i8 %_18_dealloc.0.lcssa, 0
  br i1 %tobool34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end33
  tail call void @free(i8* %_18.0.lcssa) #8
  br label %if.end36

if.end36:                                         ; preds = %if.end33, %if.then35
  %tobool37 = icmp eq i8 %_25_dealloc.0.lcssa, 0
  br i1 %tobool37, label %if.end39, label %if.then38

if.then38:                                        ; preds = %if.end36
  tail call void @free(i8* %_25.0.lcssa) #8
  br label %if.end39

if.end39:                                         ; preds = %if.end36, %if.then38
  ret void
}

declare void @printf_s(i64*, i64) local_unnamed_addr #3

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @_mat_mult_(%struct.Matrix* nocapture %a, i1 zeroext %a_dealloc, %struct.Matrix* nocapture %b, i1 zeroext %b_dealloc) local_unnamed_addr #4 {
entry:
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 2
  %0 = load i64, i64* %width2, align 8, !tbaa !10
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height3, align 8, !tbaa !11
  %mul = mul nsw i64 %1, %0
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %mul) #8
  %data15 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %2 = load i64*, i64** %data15, align 8, !tbaa !7
  %data25 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0
  %3 = load i64*, i64** %data25, align 8, !tbaa !7
  %cmp31198 = icmp sgt i64 %1, 0
  br i1 %cmp31198, label %polly.split_new_and_old, label %if.end61

polly.split_new_and_old:                          ; preds = %entry
  %4 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.obit = extractvalue { i64, i1 } %4, 1
  %.res = extractvalue { i64, i1 } %4, 0
  %polly.access.mul. = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %0)
  %polly.access.mul..obit = extractvalue { i64, i1 } %polly.access.mul., 1
  %polly.overflow.state203 = or i1 %.obit, %polly.access.mul..obit
  %polly.access.mul..res = extractvalue { i64, i1 } %polly.access.mul., 0
  %polly.access.add. = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res, i64 %0)
  %polly.access.add..obit = extractvalue { i64, i1 } %polly.access.add., 1
  %polly.access.add..res = extractvalue { i64, i1 } %polly.access.add., 0
  %polly.access. = getelementptr i64, i64* %2, i64 %polly.access.add..res
  %polly.overflow.state206 = or i1 %polly.overflow.state203, %polly.access.add..obit
  %5 = icmp ule i64* %polly.access., %call
  %polly.access.call218 = getelementptr i64, i64* %call, i64 %polly.access.add..res
  %6 = icmp ule i64* %polly.access.call218, %2
  %7 = or i1 %5, %6
  %8 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 1)
  %.obit228 = extractvalue { i64, i1 } %8, 1
  %polly.overflow.state229 = or i1 %.obit228, %polly.overflow.state206
  %.res230 = extractvalue { i64, i1 } %8, 0
  %polly.access.mul.231 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res230, i64 %0)
  %polly.access.mul..obit232 = extractvalue { i64, i1 } %polly.access.mul.231, 1
  %polly.overflow.state233 = or i1 %polly.access.mul..obit232, %polly.overflow.state229
  %polly.access.mul..res234 = extractvalue { i64, i1 } %polly.access.mul.231, 0
  %polly.access.add.235 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res234, i64 %0)
  %polly.access.add..obit236 = extractvalue { i64, i1 } %polly.access.add.235, 1
  %polly.access.add..res238 = extractvalue { i64, i1 } %polly.access.add.235, 0
  %polly.access.239 = getelementptr i64, i64* %3, i64 %polly.access.add..res238
  %polly.overflow.state246 = or i1 %polly.access.add..obit236, %polly.overflow.state233
  %9 = icmp ule i64* %polly.access.239, %call
  %polly.overflow.state250 = or i1 %.obit, %polly.overflow.state246
  %polly.overflow.state254 = or i1 %polly.access.mul..obit, %polly.overflow.state250
  %polly.overflow.state267 = or i1 %polly.access.add..obit, %polly.overflow.state254
  %10 = icmp ule i64* %polly.access.call218, %3
  %11 = or i1 %9, %10
  %12 = and i1 %7, %11
  %polly.rtc.overflown = xor i1 %polly.overflow.state267, true
  %polly.rtc.result = and i1 %12, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.start, label %while.cond34.preheader.preheader

while.cond34.preheader.preheader:                 ; preds = %polly.split_new_and_old
  %cmp36195 = icmp sgt i64 %0, 0
  br i1 %cmp36195, label %while.cond34.preheader.us.preheader, label %if.end61

while.cond34.preheader.us.preheader:              ; preds = %while.cond34.preheader.preheader
  %xtraiter475 = and i64 %0, 1
  %lcmp.mod476 = icmp eq i64 %xtraiter475, 0
  %13 = icmp eq i64 %0, 1
  br label %while.cond34.preheader.us

while.cond34.preheader.us:                        ; preds = %while.cond34.preheader.us.preheader, %blklab15.loopexit.us-lcssa.us.us
  %i.0199.us = phi i64 [ %add58.us, %blklab15.loopexit.us-lcssa.us.us ], [ 0, %while.cond34.preheader.us.preheader ]
  %mul44.us = mul nsw i64 %i.0199.us, %0
  %arrayidx47.us.us.prol = getelementptr inbounds i64, i64* %2, i64 %mul44.us
  br label %while.cond39.preheader.us.us

while.cond39.preheader.us.us:                     ; preds = %while.cond34.preheader.us, %blklab17.loopexit.us.us
  %j.0196.us.us = phi i64 [ %add57.us.us, %blklab17.loopexit.us.us ], [ 0, %while.cond34.preheader.us ]
  %add.us.us = add nsw i64 %j.0196.us.us, %mul44.us
  %arrayidx.us.us = getelementptr inbounds i64, i64* %call, i64 %add.us.us
  %.pre = load i64, i64* %arrayidx.us.us, align 8, !tbaa !8
  br i1 %lcmp.mod476, label %if.end43.us.us.prol.loopexit.unr-lcssa, label %if.end43.us.us.prol.preheader

if.end43.us.us.prol.preheader:                    ; preds = %while.cond39.preheader.us.us
  br label %if.end43.us.us.prol

if.end43.us.us.prol:                              ; preds = %if.end43.us.us.prol.preheader
  %14 = load i64, i64* %arrayidx47.us.us.prol, align 8, !tbaa !8
  %arrayidx50.us.us.prol = getelementptr inbounds i64, i64* %3, i64 %j.0196.us.us
  %15 = load i64, i64* %arrayidx50.us.us.prol, align 8, !tbaa !8
  %mul51.us.us.prol = mul nsw i64 %15, %14
  %add52.us.us.prol = add nsw i64 %mul51.us.us.prol, %.pre
  store i64 %add52.us.us.prol, i64* %arrayidx.us.us, align 8, !tbaa !8
  br label %if.end43.us.us.prol.loopexit.unr-lcssa

if.end43.us.us.prol.loopexit.unr-lcssa:           ; preds = %while.cond39.preheader.us.us, %if.end43.us.us.prol
  %.unr.ph = phi i64 [ %add52.us.us.prol, %if.end43.us.us.prol ], [ %.pre, %while.cond39.preheader.us.us ]
  %k.0194.us.us.unr.ph = phi i64 [ 1, %if.end43.us.us.prol ], [ 0, %while.cond39.preheader.us.us ]
  br label %if.end43.us.us.prol.loopexit

if.end43.us.us.prol.loopexit:                     ; preds = %if.end43.us.us.prol.loopexit.unr-lcssa
  br i1 %13, label %blklab17.loopexit.us.us, label %while.cond39.preheader.us.us.new

while.cond39.preheader.us.us.new:                 ; preds = %if.end43.us.us.prol.loopexit
  br label %if.end43.us.us

blklab17.loopexit.us.us.unr-lcssa:                ; preds = %if.end43.us.us
  br label %blklab17.loopexit.us.us

blklab17.loopexit.us.us:                          ; preds = %if.end43.us.us.prol.loopexit, %blklab17.loopexit.us.us.unr-lcssa
  %add57.us.us = add nuw nsw i64 %j.0196.us.us, 1
  %exitcond201.us.us = icmp eq i64 %add57.us.us, %0
  br i1 %exitcond201.us.us, label %blklab15.loopexit.us-lcssa.us.us, label %while.cond39.preheader.us.us

if.end43.us.us:                                   ; preds = %if.end43.us.us, %while.cond39.preheader.us.us.new
  %16 = phi i64 [ %.unr.ph, %while.cond39.preheader.us.us.new ], [ %add52.us.us.1, %if.end43.us.us ]
  %k.0194.us.us = phi i64 [ %k.0194.us.us.unr.ph, %while.cond39.preheader.us.us.new ], [ %add56.us.us.1, %if.end43.us.us ]
  %add46.us.us = add nsw i64 %k.0194.us.us, %mul44.us
  %arrayidx47.us.us = getelementptr inbounds i64, i64* %2, i64 %add46.us.us
  %17 = load i64, i64* %arrayidx47.us.us, align 8, !tbaa !8
  %mul48.us.us = mul nsw i64 %k.0194.us.us, %0
  %add49.us.us = add nsw i64 %mul48.us.us, %j.0196.us.us
  %arrayidx50.us.us = getelementptr inbounds i64, i64* %3, i64 %add49.us.us
  %18 = load i64, i64* %arrayidx50.us.us, align 8, !tbaa !8
  %mul51.us.us = mul nsw i64 %18, %17
  %add52.us.us = add nsw i64 %mul51.us.us, %16
  store i64 %add52.us.us, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add56.us.us = add nuw nsw i64 %k.0194.us.us, 1
  %add46.us.us.1 = add nsw i64 %add56.us.us, %mul44.us
  %arrayidx47.us.us.1 = getelementptr inbounds i64, i64* %2, i64 %add46.us.us.1
  %19 = load i64, i64* %arrayidx47.us.us.1, align 8, !tbaa !8
  %mul48.us.us.1 = mul nsw i64 %add56.us.us, %0
  %add49.us.us.1 = add nsw i64 %mul48.us.us.1, %j.0196.us.us
  %arrayidx50.us.us.1 = getelementptr inbounds i64, i64* %3, i64 %add49.us.us.1
  %20 = load i64, i64* %arrayidx50.us.us.1, align 8, !tbaa !8
  %mul51.us.us.1 = mul nsw i64 %20, %19
  %add52.us.us.1 = add nsw i64 %mul51.us.us.1, %add52.us.us
  store i64 %add52.us.us.1, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add56.us.us.1 = add nsw i64 %k.0194.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %add56.us.us.1, %0
  br i1 %exitcond.us.us.1, label %blklab17.loopexit.us.us.unr-lcssa, label %if.end43.us.us

blklab15.loopexit.us-lcssa.us.us:                 ; preds = %blklab17.loopexit.us.us
  %add58.us = add nuw nsw i64 %i.0199.us, 1
  %exitcond202.us = icmp eq i64 %add58.us, %1
  br i1 %exitcond202.us, label %if.end61.loopexit472, label %while.cond34.preheader.us

if.end61.loopexit:                                ; preds = %polly.loop_exit274
  br label %if.end61

if.end61.loopexit472:                             ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %if.end61

if.end61:                                         ; preds = %if.end61.loopexit472, %if.end61.loopexit, %while.cond34.preheader.preheader, %polly.start, %entry
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
  br i1 %a_dealloc, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.end61
  %25 = bitcast %struct.Matrix* %a to i8**
  %26 = load i8*, i8** %25, align 8, !tbaa !7
  tail call void @free(i8* %26) #8
  %27 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %27) #8
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %if.end61
  br i1 %b_dealloc, label %if.then72, label %if.end94

if.then72:                                        ; preds = %if.end70
  %28 = bitcast %struct.Matrix* %b to i8**
  %29 = load i8*, i8** %28, align 8, !tbaa !7
  tail call void @free(i8* %29) #8
  %30 = bitcast %struct.Matrix* %b to i8*
  tail call void @free(i8* %30) #8
  br label %if.end94

if.end94:                                         ; preds = %if.end70, %if.then72
  ret %struct.Matrix* %21

polly.start:                                      ; preds = %polly.split_new_and_old
  %31 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %31, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %if.end61

polly.loop_header.preheader:                      ; preds = %polly.start
  %32 = add nsw i64 %0, -1
  %polly.fdiv_q.shr270 = ashr i64 %32, 5
  %polly.loop_guard275 = icmp sgt i64 %polly.fdiv_q.shr270, -1
  %pexp.p_div_q = lshr i64 %32, 5
  %pexp.p_div_q305 = lshr i64 %0, 2
  %33 = add nsw i64 %pexp.p_div_q305, -1
  %pexp.pdiv_r = and i64 %0, 3
  %polly.loop_guard329 = icmp eq i64 %pexp.pdiv_r, 0
  %34 = and i64 %0, -4
  %35 = add nsw i64 %pexp.pdiv_r, -1
  %xtraiter473 = and i64 %0, 1
  %lcmp.mod474 = icmp eq i64 %xtraiter473, 0
  %36 = mul i64 %34, %0
  %37 = icmp eq i64 %35, 0
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %38 = mul i64 %34, %0
  %39 = icmp eq i64 %35, 0
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit274, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit274 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard275, label %polly.loop_header272.preheader, label %polly.loop_exit274

polly.loop_header272.preheader:                   ; preds = %polly.loop_header
  %40 = shl nsw i64 %polly.indvar, 5
  %41 = sub nsw i64 %1, %40
  %42 = add nsw i64 %41, -1
  %43 = icmp slt i64 %42, 31
  %44 = select i1 %43, i64 %42, i64 31
  %polly.loop_guard291 = icmp sgt i64 %44, -1
  %polly.adjust_ub294 = add i64 %44, -1
  br label %polly.loop_header272

polly.loop_exit274.loopexit:                      ; preds = %polly.loop_exit282
  br label %polly.loop_exit274

polly.loop_exit274:                               ; preds = %polly.loop_exit274.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond427 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond427, label %if.end61.loopexit, label %polly.loop_header, !llvm.loop !23

polly.loop_header272:                             ; preds = %polly.loop_exit282, %polly.loop_header272.preheader
  %polly.indvar276 = phi i64 [ %polly.indvar_next277, %polly.loop_exit282 ], [ 0, %polly.loop_header272.preheader ]
  %45 = shl nsw i64 %polly.indvar276, 5
  %46 = sub nsw i64 %0, %45
  %47 = add nsw i64 %46, -1
  %48 = icmp slt i64 %47, 31
  %49 = select i1 %48, i64 %47, i64 31
  %polly.loop_guard300 = icmp sgt i64 %49, -1
  %polly.adjust_ub303 = add i64 %49, -1
  br label %polly.loop_header280

polly.loop_exit282:                               ; preds = %polly.loop_exit290
  %polly.indvar_next277 = add nuw nsw i64 %polly.indvar276, 1
  %exitcond426 = icmp eq i64 %polly.indvar276, %polly.fdiv_q.shr270
  br i1 %exitcond426, label %polly.loop_exit274.loopexit, label %polly.loop_header272

polly.loop_header280:                             ; preds = %polly.loop_exit290, %polly.loop_header272
  %polly.indvar283 = phi i64 [ 0, %polly.loop_header272 ], [ %polly.indvar_next284, %polly.loop_exit290 ]
  br i1 %polly.loop_guard291, label %polly.loop_header288.preheader, label %polly.loop_exit290

polly.loop_header288.preheader:                   ; preds = %polly.loop_header280
  %50 = mul nsw i64 %polly.indvar283, -8
  %51 = add nsw i64 %33, %50
  %52 = icmp slt i64 %51, 7
  %53 = select i1 %52, i64 %51, i64 7
  %polly.loop_guard310 = icmp sgt i64 %53, -1
  %54 = shl i64 %polly.indvar283, 5
  %55 = or i64 %54, 31
  %56 = icmp slt i64 %55, %0
  %polly.adjust_ub313 = add i64 %53, -1
  %brmerge = or i1 %56, %polly.loop_guard329
  br label %polly.loop_header288

polly.loop_exit290.loopexit:                      ; preds = %polly.loop_exit299
  br label %polly.loop_exit290

polly.loop_exit290:                               ; preds = %polly.loop_exit290.loopexit, %polly.loop_header280
  %polly.indvar_next284 = add nuw nsw i64 %polly.indvar283, 1
  %exitcond425 = icmp eq i64 %polly.indvar283, %pexp.p_div_q
  br i1 %exitcond425, label %polly.loop_exit282, label %polly.loop_header280

polly.loop_header288:                             ; preds = %polly.loop_header288.preheader, %polly.loop_exit299
  %polly.indvar292 = phi i64 [ %polly.indvar_next293, %polly.loop_exit299 ], [ 0, %polly.loop_header288.preheader ]
  br i1 %polly.loop_guard300, label %polly.loop_header297.preheader, label %polly.loop_exit299

polly.loop_header297.preheader:                   ; preds = %polly.loop_header288
  %57 = add nuw nsw i64 %polly.indvar292, %40
  %58 = mul i64 %57, %0
  br i1 %polly.loop_guard310, label %polly.loop_header297.us.preheader, label %polly.loop_header297.preheader.split

polly.loop_header297.us.preheader:                ; preds = %polly.loop_header297.preheader
  %59 = add i64 %34, %58
  %scevgep338.us.prol = getelementptr i64, i64* %2, i64 %59
  br label %polly.loop_header297.us

polly.loop_header297.us:                          ; preds = %polly.loop_header297.us.preheader, %polly.merge.us
  %polly.indvar301.us = phi i64 [ %polly.indvar_next302.us, %polly.merge.us ], [ 0, %polly.loop_header297.us.preheader ]
  %60 = add nuw nsw i64 %polly.indvar301.us, %45
  %61 = add i64 %60, %58
  %scevgep.us = getelementptr i64, i64* %call, i64 %61
  %scevgep.promoted346.us = load i64, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.loop_header307.us

polly.loop_header307.us:                          ; preds = %polly.loop_header297.us, %polly.loop_header307.us
  %p_add52.lcssa347.us = phi i64 [ %p_add52.us.3, %polly.loop_header307.us ], [ %scevgep.promoted346.us, %polly.loop_header297.us ]
  %polly.indvar311.us = phi i64 [ %polly.indvar_next312.us, %polly.loop_header307.us ], [ 0, %polly.loop_header297.us ]
  %62 = shl i64 %polly.indvar311.us, 2
  %63 = add nuw nsw i64 %62, %54
  %64 = add i64 %63, %58
  %scevgep321.us = getelementptr i64, i64* %2, i64 %64
  %_p_scalar_322.us = load i64, i64* %scevgep321.us, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %65 = mul i64 %63, %0
  %66 = add i64 %65, %60
  %scevgep323.us = getelementptr i64, i64* %3, i64 %66
  %_p_scalar_324.us = load i64, i64* %scevgep323.us, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul51.us = mul nsw i64 %_p_scalar_324.us, %_p_scalar_322.us
  %p_add52.us = add nsw i64 %p_mul51.us, %p_add52.lcssa347.us
  %67 = or i64 %63, 1
  %68 = add i64 %67, %58
  %scevgep321.us.1 = getelementptr i64, i64* %2, i64 %68
  %_p_scalar_322.us.1 = load i64, i64* %scevgep321.us.1, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %69 = mul i64 %67, %0
  %70 = add i64 %69, %60
  %scevgep323.us.1 = getelementptr i64, i64* %3, i64 %70
  %_p_scalar_324.us.1 = load i64, i64* %scevgep323.us.1, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul51.us.1 = mul nsw i64 %_p_scalar_324.us.1, %_p_scalar_322.us.1
  %p_add52.us.1 = add nsw i64 %p_mul51.us.1, %p_add52.us
  %71 = or i64 %63, 2
  %72 = add i64 %71, %58
  %scevgep321.us.2 = getelementptr i64, i64* %2, i64 %72
  %_p_scalar_322.us.2 = load i64, i64* %scevgep321.us.2, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %73 = mul i64 %71, %0
  %74 = add i64 %73, %60
  %scevgep323.us.2 = getelementptr i64, i64* %3, i64 %74
  %_p_scalar_324.us.2 = load i64, i64* %scevgep323.us.2, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul51.us.2 = mul nsw i64 %_p_scalar_324.us.2, %_p_scalar_322.us.2
  %p_add52.us.2 = add nsw i64 %p_mul51.us.2, %p_add52.us.1
  %75 = or i64 %63, 3
  %76 = add i64 %75, %58
  %scevgep321.us.3 = getelementptr i64, i64* %2, i64 %76
  %_p_scalar_322.us.3 = load i64, i64* %scevgep321.us.3, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %77 = mul i64 %75, %0
  %78 = add i64 %77, %60
  %scevgep323.us.3 = getelementptr i64, i64* %3, i64 %78
  %_p_scalar_324.us.3 = load i64, i64* %scevgep323.us.3, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul51.us.3 = mul nsw i64 %_p_scalar_324.us.3, %_p_scalar_322.us.3
  %p_add52.us.3 = add nsw i64 %p_mul51.us.3, %p_add52.us.2
  %polly.indvar_next312.us = add nuw nsw i64 %polly.indvar311.us, 1
  %polly.loop_cond314.us = icmp sgt i64 %polly.indvar311.us, %polly.adjust_ub313
  br i1 %polly.loop_cond314.us, label %polly.cond.loopexit.us, label %polly.loop_header307.us

polly.loop_header326.us:                          ; preds = %polly.loop_header326.us, %polly.loop_header326.us.preheader.new
  %p_add52343348.us = phi i64 [ %p_add52343348.us.unr.ph, %polly.loop_header326.us.preheader.new ], [ %p_add52343.us.1, %polly.loop_header326.us ]
  %polly.indvar330.us = phi i64 [ %polly.indvar330.us.unr.ph, %polly.loop_header326.us.preheader.new ], [ %polly.indvar_next331.us.1, %polly.loop_header326.us ]
  %79 = add nuw nsw i64 %polly.indvar330.us, %34
  %80 = add i64 %79, %58
  %scevgep338.us = getelementptr i64, i64* %2, i64 %80
  %_p_scalar_339.us = load i64, i64* %scevgep338.us, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %81 = mul i64 %79, %0
  %82 = add i64 %81, %60
  %scevgep340.us = getelementptr i64, i64* %3, i64 %82
  %_p_scalar_341.us = load i64, i64* %scevgep340.us, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul51342.us = mul nsw i64 %_p_scalar_341.us, %_p_scalar_339.us
  %p_add52343.us = add nsw i64 %p_mul51342.us, %p_add52343348.us
  %polly.indvar_next331.us = add nuw nsw i64 %polly.indvar330.us, 1
  %83 = add nuw nsw i64 %polly.indvar_next331.us, %34
  %84 = add i64 %83, %58
  %scevgep338.us.1 = getelementptr i64, i64* %2, i64 %84
  %_p_scalar_339.us.1 = load i64, i64* %scevgep338.us.1, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %85 = mul i64 %83, %0
  %86 = add i64 %85, %60
  %scevgep340.us.1 = getelementptr i64, i64* %3, i64 %86
  %_p_scalar_341.us.1 = load i64, i64* %scevgep340.us.1, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul51342.us.1 = mul nsw i64 %_p_scalar_341.us.1, %_p_scalar_339.us.1
  %p_add52343.us.1 = add nsw i64 %p_mul51342.us.1, %p_add52343.us
  %polly.indvar_next331.us.1 = add nsw i64 %polly.indvar330.us, 2
  %exitcond424.1 = icmp eq i64 %polly.indvar_next331.us.1, %pexp.pdiv_r
  br i1 %exitcond424.1, label %polly.merge.loopexit.us.unr-lcssa, label %polly.loop_header326.us, !llvm.loop !35

polly.merge.us:                                   ; preds = %polly.cond.loopexit.us, %polly.merge.loopexit.us
  %polly.indvar_next302.us = add nuw nsw i64 %polly.indvar301.us, 1
  %polly.loop_cond304.us = icmp sgt i64 %polly.indvar301.us, %polly.adjust_ub303
  br i1 %polly.loop_cond304.us, label %polly.loop_exit299.loopexit, label %polly.loop_header297.us

polly.merge.loopexit.us.unr-lcssa:                ; preds = %polly.loop_header326.us
  br label %polly.merge.loopexit.us

polly.merge.loopexit.us:                          ; preds = %polly.loop_header326.us.prol.loopexit, %polly.merge.loopexit.us.unr-lcssa
  %p_add52343.us.lcssa = phi i64 [ %p_add52343.us.lcssa.unr.ph, %polly.loop_header326.us.prol.loopexit ], [ %p_add52343.us.1, %polly.merge.loopexit.us.unr-lcssa ]
  store i64 %p_add52343.us.lcssa, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header307.us
  store i64 %p_add52.us.3, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header326.us.preheader

polly.loop_header326.us.preheader:                ; preds = %polly.cond.loopexit.us
  br i1 %lcmp.mod474, label %polly.loop_header326.us.prol.loopexit.unr-lcssa, label %polly.loop_header326.us.prol.preheader

polly.loop_header326.us.prol.preheader:           ; preds = %polly.loop_header326.us.preheader
  br label %polly.loop_header326.us.prol

polly.loop_header326.us.prol:                     ; preds = %polly.loop_header326.us.prol.preheader
  %_p_scalar_339.us.prol = load i64, i64* %scevgep338.us.prol, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %87 = add i64 %36, %60
  %scevgep340.us.prol = getelementptr i64, i64* %3, i64 %87
  %_p_scalar_341.us.prol = load i64, i64* %scevgep340.us.prol, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul51342.us.prol = mul nsw i64 %_p_scalar_341.us.prol, %_p_scalar_339.us.prol
  %p_add52343.us.prol = add nsw i64 %p_mul51342.us.prol, %p_add52.us.3
  br label %polly.loop_header326.us.prol.loopexit.unr-lcssa

polly.loop_header326.us.prol.loopexit.unr-lcssa:  ; preds = %polly.loop_header326.us.preheader, %polly.loop_header326.us.prol
  %p_add52343.us.lcssa.unr.ph = phi i64 [ %p_add52343.us.prol, %polly.loop_header326.us.prol ], [ undef, %polly.loop_header326.us.preheader ]
  %p_add52343348.us.unr.ph = phi i64 [ %p_add52343.us.prol, %polly.loop_header326.us.prol ], [ %p_add52.us.3, %polly.loop_header326.us.preheader ]
  %polly.indvar330.us.unr.ph = phi i64 [ 1, %polly.loop_header326.us.prol ], [ 0, %polly.loop_header326.us.preheader ]
  br label %polly.loop_header326.us.prol.loopexit

polly.loop_header326.us.prol.loopexit:            ; preds = %polly.loop_header326.us.prol.loopexit.unr-lcssa
  br i1 %37, label %polly.merge.loopexit.us, label %polly.loop_header326.us.preheader.new

polly.loop_header326.us.preheader.new:            ; preds = %polly.loop_header326.us.prol.loopexit
  br label %polly.loop_header326.us

polly.loop_header297.preheader.split:             ; preds = %polly.loop_header297.preheader
  br i1 %56, label %polly.loop_exit299, label %polly.loop_header297.preheader470

polly.loop_header297.preheader470:                ; preds = %polly.loop_header297.preheader.split
  %88 = add i64 %34, %58
  %scevgep338.prol = getelementptr i64, i64* %2, i64 %88
  br label %polly.loop_header297

polly.loop_exit299.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit299

polly.loop_exit299.loopexit471:                   ; preds = %polly.merge
  br label %polly.loop_exit299

polly.loop_exit299:                               ; preds = %polly.loop_exit299.loopexit471, %polly.loop_exit299.loopexit, %polly.loop_header297.preheader.split, %polly.loop_header288
  %polly.indvar_next293 = add nuw nsw i64 %polly.indvar292, 1
  %polly.loop_cond295 = icmp sgt i64 %polly.indvar292, %polly.adjust_ub294
  br i1 %polly.loop_cond295, label %polly.loop_exit290.loopexit, label %polly.loop_header288

polly.loop_header297:                             ; preds = %polly.loop_header297.preheader470, %polly.merge
  %polly.indvar301 = phi i64 [ %polly.indvar_next302, %polly.merge ], [ 0, %polly.loop_header297.preheader470 ]
  br i1 %polly.loop_guard329, label %polly.merge, label %polly.loop_header326.preheader

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header326
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.loop_header326.prol.loopexit, %polly.merge.loopexit.unr-lcssa
  %p_add52343.lcssa = phi i64 [ %p_add52343.lcssa.unr.ph, %polly.loop_header326.prol.loopexit ], [ %p_add52343.1, %polly.merge.loopexit.unr-lcssa ]
  store i64 %p_add52343.lcssa, i64* %scevgep336, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header297
  %polly.indvar_next302 = add nuw nsw i64 %polly.indvar301, 1
  %polly.loop_cond304 = icmp sgt i64 %polly.indvar301, %polly.adjust_ub303
  br i1 %polly.loop_cond304, label %polly.loop_exit299.loopexit471, label %polly.loop_header297

polly.loop_header326.preheader:                   ; preds = %polly.loop_header297
  %89 = add nuw nsw i64 %polly.indvar301, %45
  %90 = add i64 %89, %58
  %scevgep336 = getelementptr i64, i64* %call, i64 %90
  %scevgep336.promoted = load i64, i64* %scevgep336, align 8, !alias.scope !24, !noalias !26
  br i1 %lcmp.mod, label %polly.loop_header326.prol.loopexit.unr-lcssa, label %polly.loop_header326.prol.preheader

polly.loop_header326.prol.preheader:              ; preds = %polly.loop_header326.preheader
  br label %polly.loop_header326.prol

polly.loop_header326.prol:                        ; preds = %polly.loop_header326.prol.preheader
  %_p_scalar_339.prol = load i64, i64* %scevgep338.prol, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %91 = add i64 %38, %89
  %scevgep340.prol = getelementptr i64, i64* %3, i64 %91
  %_p_scalar_341.prol = load i64, i64* %scevgep340.prol, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul51342.prol = mul nsw i64 %_p_scalar_341.prol, %_p_scalar_339.prol
  %p_add52343.prol = add nsw i64 %p_mul51342.prol, %scevgep336.promoted
  br label %polly.loop_header326.prol.loopexit.unr-lcssa

polly.loop_header326.prol.loopexit.unr-lcssa:     ; preds = %polly.loop_header326.preheader, %polly.loop_header326.prol
  %p_add52343.lcssa.unr.ph = phi i64 [ %p_add52343.prol, %polly.loop_header326.prol ], [ undef, %polly.loop_header326.preheader ]
  %p_add52343348.unr.ph = phi i64 [ %p_add52343.prol, %polly.loop_header326.prol ], [ %scevgep336.promoted, %polly.loop_header326.preheader ]
  %polly.indvar330.unr.ph = phi i64 [ 1, %polly.loop_header326.prol ], [ 0, %polly.loop_header326.preheader ]
  br label %polly.loop_header326.prol.loopexit

polly.loop_header326.prol.loopexit:               ; preds = %polly.loop_header326.prol.loopexit.unr-lcssa
  br i1 %39, label %polly.merge.loopexit, label %polly.loop_header326.preheader.new

polly.loop_header326.preheader.new:               ; preds = %polly.loop_header326.prol.loopexit
  br label %polly.loop_header326

polly.loop_header326:                             ; preds = %polly.loop_header326, %polly.loop_header326.preheader.new
  %p_add52343348 = phi i64 [ %p_add52343348.unr.ph, %polly.loop_header326.preheader.new ], [ %p_add52343.1, %polly.loop_header326 ]
  %polly.indvar330 = phi i64 [ %polly.indvar330.unr.ph, %polly.loop_header326.preheader.new ], [ %polly.indvar_next331.1, %polly.loop_header326 ]
  %92 = add nuw nsw i64 %polly.indvar330, %34
  %93 = add i64 %92, %58
  %scevgep338 = getelementptr i64, i64* %2, i64 %93
  %_p_scalar_339 = load i64, i64* %scevgep338, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %94 = mul i64 %92, %0
  %95 = add i64 %94, %89
  %scevgep340 = getelementptr i64, i64* %3, i64 %95
  %_p_scalar_341 = load i64, i64* %scevgep340, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul51342 = mul nsw i64 %_p_scalar_341, %_p_scalar_339
  %p_add52343 = add nsw i64 %p_mul51342, %p_add52343348
  %polly.indvar_next331 = add nuw nsw i64 %polly.indvar330, 1
  %96 = add nuw nsw i64 %polly.indvar_next331, %34
  %97 = add i64 %96, %58
  %scevgep338.1 = getelementptr i64, i64* %2, i64 %97
  %_p_scalar_339.1 = load i64, i64* %scevgep338.1, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %98 = mul i64 %96, %0
  %99 = add i64 %98, %89
  %scevgep340.1 = getelementptr i64, i64* %3, i64 %99
  %_p_scalar_341.1 = load i64, i64* %scevgep340.1, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul51342.1 = mul nsw i64 %_p_scalar_341.1, %_p_scalar_339.1
  %p_add52343.1 = add nsw i64 %p_mul51342.1, %p_add52343
  %polly.indvar_next331.1 = add nsw i64 %polly.indvar330, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next331.1, %pexp.pdiv_r
  br i1 %exitcond.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header326, !llvm.loop !36
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
  %not.cmp = icmp eq i64** %call, null
  %2 = load i64*, i64** %call, align 8, !tbaa !9
  %call3 = call i64* @parseStringToInt(i64* %2) #8
  %not.cmp4 = icmp eq i64* %call3, null
  br i1 %not.cmp4, label %if.end158, label %if.end146

if.end146:                                        ; preds = %entry
  %3 = load i64, i64* %call3, align 8, !tbaa !8
  %call18 = call i64* @create1DArray_int64_t(i64 0, i64 7) #8
  %4 = bitcast i64* %call18 to <2 x i64>*
  store <2 x i64> <i64 115, i64 105>, <2 x i64>* %4, align 8, !tbaa !8
  %arrayidx21 = getelementptr inbounds i64, i64* %call18, i64 2
  %5 = bitcast i64* %arrayidx21 to <2 x i64>*
  store <2 x i64> <i64 122, i64 101>, <2 x i64>* %5, align 8, !tbaa !8
  %arrayidx23 = getelementptr inbounds i64, i64* %call18, i64 4
  %6 = bitcast i64* %arrayidx23 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %6, align 8, !tbaa !8
  %arrayidx25 = getelementptr inbounds i64, i64* %call18, i64 6
  store i64 32, i64* %arrayidx25, align 8, !tbaa !8
  %not.cmp26 = icmp ne i64* %call18, null
  %_12_dealloc.0 = zext i1 %not.cmp26 to i8
  call void @printf_s(i64* %call18, i64 7) #8
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 %3)
  %call34 = call %struct.Matrix* @_init_(i64 %3, i64 %3)
  %not.cmp35 = icmp eq %struct.Matrix* %call34, null
  %call47 = call %struct.Matrix* @_init_(i64 %3, i64 %3)
  %not.cmp48 = icmp eq %struct.Matrix* %call47, null
  %call60 = call %struct.Matrix* @_mat_mult_(%struct.Matrix* %call34, i1 zeroext false, %struct.Matrix* %call47, i1 zeroext false)
  %not.cmp61 = icmp eq %struct.Matrix* %call60, null
  %call73 = call i64* @create1DArray_int64_t(i64 0, i64 27) #8
  %7 = bitcast i64* %call73 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %7, align 8, !tbaa !8
  %arrayidx76 = getelementptr inbounds i64, i64* %call73, i64 2
  %8 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %8, align 8, !tbaa !8
  %arrayidx78 = getelementptr inbounds i64, i64* %call73, i64 4
  %9 = bitcast i64* %arrayidx78 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %9, align 8, !tbaa !8
  %arrayidx80 = getelementptr inbounds i64, i64* %call73, i64 6
  %10 = bitcast i64* %arrayidx80 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %10, align 8, !tbaa !8
  %arrayidx82 = getelementptr inbounds i64, i64* %call73, i64 8
  %11 = bitcast i64* %arrayidx82 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %11, align 8, !tbaa !8
  %arrayidx84 = getelementptr inbounds i64, i64* %call73, i64 10
  %12 = bitcast i64* %arrayidx84 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %12, align 8, !tbaa !8
  %arrayidx86 = getelementptr inbounds i64, i64* %call73, i64 12
  %13 = bitcast i64* %arrayidx86 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %13, align 8, !tbaa !8
  %arrayidx88 = getelementptr inbounds i64, i64* %call73, i64 14
  %14 = bitcast i64* %arrayidx88 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %14, align 8, !tbaa !8
  %arrayidx90 = getelementptr inbounds i64, i64* %call73, i64 16
  %15 = bitcast i64* %arrayidx90 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %15, align 8, !tbaa !8
  %arrayidx92 = getelementptr inbounds i64, i64* %call73, i64 18
  %16 = bitcast i64* %arrayidx92 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %16, align 8, !tbaa !8
  %arrayidx94 = getelementptr inbounds i64, i64* %call73, i64 20
  %17 = bitcast i64* %arrayidx94 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %17, align 8, !tbaa !8
  %arrayidx96 = getelementptr inbounds i64, i64* %call73, i64 22
  %18 = bitcast i64* %arrayidx96 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %18, align 8, !tbaa !8
  %arrayidx98 = getelementptr inbounds i64, i64* %call73, i64 24
  %19 = bitcast i64* %arrayidx98 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %19, align 8, !tbaa !8
  %arrayidx100 = getelementptr inbounds i64, i64* %call73, i64 26
  store i64 32, i64* %arrayidx100, align 8, !tbaa !8
  %not.cmp101 = icmp ne i64* %call73, null
  %.310 = zext i1 %not.cmp101 to i8
  call void @printf_s(i64* %call73, i64 27) #8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call60, i64 0, i32 0
  %20 = load i64*, i64** %data, align 8, !tbaa !7
  %add = mul i64 %3, %3
  %sub108 = add nsw i64 %add, -1
  %arrayidx109 = getelementptr inbounds i64, i64* %20, i64 %sub108
  %21 = load i64, i64* %arrayidx109, align 8, !tbaa !8
  %call110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 %21)
  %call114 = call i64* @create1DArray_int64_t(i64 0, i64 25) #8
  %22 = bitcast i64* %call114 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %22, align 8, !tbaa !8
  %arrayidx117 = getelementptr inbounds i64, i64* %call114, i64 2
  %23 = bitcast i64* %arrayidx117 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %23, align 8, !tbaa !8
  %arrayidx119 = getelementptr inbounds i64, i64* %call114, i64 4
  %24 = bitcast i64* %arrayidx119 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %24, align 8, !tbaa !8
  %arrayidx121 = getelementptr inbounds i64, i64* %call114, i64 6
  %25 = bitcast i64* %arrayidx121 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %25, align 8, !tbaa !8
  %arrayidx123 = getelementptr inbounds i64, i64* %call114, i64 8
  %26 = bitcast i64* %arrayidx123 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %26, align 8, !tbaa !8
  %arrayidx125 = getelementptr inbounds i64, i64* %call114, i64 10
  %27 = bitcast i64* %arrayidx125 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %27, align 8, !tbaa !8
  %arrayidx127 = getelementptr inbounds i64, i64* %call114, i64 12
  %28 = bitcast i64* %arrayidx127 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %28, align 8, !tbaa !8
  %arrayidx129 = getelementptr inbounds i64, i64* %call114, i64 14
  %29 = bitcast i64* %arrayidx129 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %29, align 8, !tbaa !8
  %arrayidx131 = getelementptr inbounds i64, i64* %call114, i64 16
  %30 = bitcast i64* %arrayidx131 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %30, align 8, !tbaa !8
  %arrayidx133 = getelementptr inbounds i64, i64* %call114, i64 18
  %31 = bitcast i64* %arrayidx133 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %31, align 8, !tbaa !8
  %arrayidx135 = getelementptr inbounds i64, i64* %call114, i64 20
  %32 = bitcast i64* %arrayidx135 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %32, align 8, !tbaa !8
  %arrayidx137 = getelementptr inbounds i64, i64* %call114, i64 22
  %33 = bitcast i64* %arrayidx137 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %33, align 8, !tbaa !8
  %arrayidx139 = getelementptr inbounds i64, i64* %call114, i64 24
  store i64 101, i64* %arrayidx139, align 8, !tbaa !8
  %not.cmp140 = icmp ne i64* %call114, null
  %_33_dealloc.0 = zext i1 %not.cmp140 to i8
  call void @println_s(i64* %call114, i64 25) #8
  %phitmp = bitcast i64* %call114 to i8*
  %phitmp307 = bitcast i64* %call73 to i8*
  %phitmp308 = bitcast i64* %call18 to i8*
  %34 = bitcast i64* %call3 to i8*
  call void @free(i8* %34) #8
  %35 = bitcast i64* %20 to i8*
  br i1 %not.cmp35, label %if.end149, label %if.then148

if.then148:                                       ; preds = %if.end146
  %36 = bitcast %struct.Matrix* %call34 to i8**
  %37 = load i8*, i8** %36, align 8, !tbaa !7
  call void @free(i8* %37) #8
  %38 = bitcast %struct.Matrix* %call34 to i8*
  call void @free(i8* %38) #8
  br label %if.end149

if.end149:                                        ; preds = %if.end146, %if.then148
  br i1 %not.cmp48, label %if.end152, label %if.then151

if.then151:                                       ; preds = %if.end149
  %39 = bitcast %struct.Matrix* %call47 to i8**
  %40 = load i8*, i8** %39, align 8, !tbaa !7
  call void @free(i8* %40) #8
  %41 = bitcast %struct.Matrix* %call47 to i8*
  call void @free(i8* %41) #8
  br label %if.end152

if.end152:                                        ; preds = %if.end149, %if.then151
  br i1 %not.cmp61, label %if.end158, label %if.then154

if.then154:                                       ; preds = %if.end152
  call void @free(i8* %35) #8
  %42 = bitcast %struct.Matrix* %call60 to i8*
  call void @free(i8* %42) #8
  br label %if.end158

if.end158:                                        ; preds = %if.end152, %entry, %if.then154
  %_12.0316329337349 = phi i8* [ %phitmp308, %if.then154 ], [ %phitmp308, %if.end152 ], [ null, %entry ]
  %_12_dealloc.1317328338348 = phi i8 [ %_12_dealloc.0, %if.then154 ], [ %_12_dealloc.0, %if.end152 ], [ 0, %entry ]
  %_20.0319327339347 = phi i8* [ %phitmp307, %if.then154 ], [ %phitmp307, %if.end152 ], [ null, %entry ]
  %_20_dealloc.1320326340346 = phi i8 [ %.310, %if.then154 ], [ %.310, %if.end152 ], [ 0, %entry ]
  %_33.0321325341345 = phi i8* [ %phitmp, %if.then154 ], [ %phitmp, %if.end152 ], [ null, %entry ]
  %_33_dealloc.1322324342344 = phi i8 [ %_33_dealloc.0, %if.then154 ], [ %_33_dealloc.0, %if.end152 ], [ 0, %entry ]
  br i1 %not.cmp, label %if.end164, label %if.then160

if.then160:                                       ; preds = %if.end158
  %43 = load i64, i64* %_7_size, align 8, !tbaa !8
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %43) #8
  br label %if.end164

if.end164:                                        ; preds = %if.end158, %if.then160
  %tobool165 = icmp eq i8 %_12_dealloc.1317328338348, 0
  br i1 %tobool165, label %if.end176, label %if.then166

if.then166:                                       ; preds = %if.end164
  call void @free(i8* %_12.0316329337349) #8
  br label %if.end176

if.end176:                                        ; preds = %if.then166, %if.end164
  %tobool177 = icmp eq i8 %_20_dealloc.1320326340346, 0
  br i1 %tobool177, label %if.end182, label %if.then178

if.then178:                                       ; preds = %if.end176
  call void @free(i8* %_20.0319327339347) #8
  br label %if.end182

if.end182:                                        ; preds = %if.then178, %if.end176
  %tobool183 = icmp eq i8 %_33_dealloc.1322324342344, 0
  br i1 %tobool183, label %if.end185, label %if.then184

if.then184:                                       ; preds = %if.end182
  call void @free(i8* %_33.0321325341345) #8
  br label %if.end185

if.end185:                                        ; preds = %if.end182, %if.then184
  call void @exit(i32 0) #9
  unreachable
}

declare void @free2DArray_int64_t(i64**, i64) local_unnamed_addr #3

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
!29 = !{!27, !24}
!30 = !{!23, !31}
!31 = distinct !{!31}
!32 = !{!28, !24}
!33 = !{!23, !34}
!34 = distinct !{!34}
!35 = distinct !{!35, !20, !21}
!36 = distinct !{!36, !20, !21}
