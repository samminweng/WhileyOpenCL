; ModuleID = 'MatrixMult_original.c'
source_filename = "MatrixMult_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Matrix = type { i64*, i64, i64, i64 }

@.str.1 = private unnamed_addr constant [7 x i8] c" data:\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c" width:\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c" height:\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [5 x i8] c"fail\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @copy_Matrix(%struct.Matrix* nocapture readonly %_Matrix) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 32) #7
  %0 = bitcast i8* %call to %struct.Matrix*
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 1
  %1 = load i64, i64* %data_size, align 8, !tbaa !1
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8
  %2 = bitcast i8* %data_size1 to i64*
  store i64 %1, i64* %2, align 8, !tbaa !1
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 0
  %3 = load i64*, i64** %data, align 8, !tbaa !7
  %call3 = tail call i64* @copy(i64* %3, i64 %1) #7
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

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

declare i64* @copy(i64*, i64) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix** @copy_array_Matrix(%struct.Matrix** nocapture readonly %_Matrix, i64 %_Matrix_size) local_unnamed_addr #0 {
entry:
  %mul = shl i64 %_Matrix_size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #7
  %0 = bitcast i8* %call to %struct.Matrix**
  %cmp12 = icmp sgt i64 %_Matrix_size, 0
  br i1 %cmp12, label %for.body.preheader, label %for.cond.cleanup

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
  %call.i = tail call noalias i8* @malloc(i64 32) #7
  %data_size.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 1
  %2 = load i64, i64* %data_size.i, align 8, !tbaa !1
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %3 = bitcast i8* %data_size1.i to i64*
  store i64 %2, i64* %3, align 8, !tbaa !1
  %data.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 0
  %4 = load i64*, i64** %data.i, align 8, !tbaa !7
  %call3.i = tail call i64* @copy(i64* %4, i64 %2) #7
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
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %_Matrix_size
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body
}

; Function Attrs: nounwind uwtable
define void @free_Matrix(%struct.Matrix* nocapture %matrix) local_unnamed_addr #0 {
entry:
  %0 = bitcast %struct.Matrix* %matrix to i8**
  %1 = load i8*, i8** %0, align 8, !tbaa !7
  tail call void @free(i8* %1) #7
  %2 = bitcast %struct.Matrix* %matrix to i8*
  tail call void @free(i8* %2) #7
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define void @printf_Matrix(%struct.Matrix* nocapture readonly %matrix) local_unnamed_addr #0 {
entry:
  %putchar = tail call i32 @putchar(i32 123) #7
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0))
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 0
  %0 = load i64*, i64** %data, align 8, !tbaa !7
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 1
  %1 = load i64, i64* %data_size, align 8, !tbaa !1
  tail call void @printf1DArray(i64* %0, i64 %1) #7
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0))
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 2
  %2 = load i64, i64* %width, align 8, !tbaa !10
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %2)
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0))
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 3
  %3 = load i64, i64* %height, align 8, !tbaa !11
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %3)
  %putchar10 = tail call i32 @putchar(i32 125) #7
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

declare void @printf1DArray(i64*, i64) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @matrix(i64 %width, i64 %height, i64* %data, i64 %data_size, i1 zeroext %data_dealloc) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 32) #7
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
define noalias %struct.Matrix* @init(i64 %width, i64 %height) local_unnamed_addr #3 {
entry:
  %mul = mul nsw i64 %height, %width
  %conv1 = trunc i64 %mul to i32
  %call = tail call i64* @create1DArray(i32 0, i32 %conv1) #7
  %cmp85 = icmp sgt i64 %height, 0
  br i1 %cmp85, label %polly.start, label %if.end24

if.end24.loopexit:                                ; preds = %polly.loop_exit93
  br label %if.end24

if.end24:                                         ; preds = %if.end24.loopexit, %polly.start, %entry
  %call.i = tail call noalias i8* @malloc(i64 32) #7
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
  %polly.fdiv_q.shr89 = ashr i64 %5, 5
  %polly.loop_guard94 = icmp sgt i64 %polly.fdiv_q.shr89, -1
  %pexp.p_div_q = lshr i64 %width, 2
  %6 = add nsw i64 %pexp.p_div_q, -1
  %pexp.pdiv_r = and i64 %width, 3
  %polly.loop_guard127 = icmp eq i64 %pexp.pdiv_r, 0
  %7 = and i64 %width, -4
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit93, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit93 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard94, label %polly.loop_header91.preheader, label %polly.loop_exit93

polly.loop_header91.preheader:                    ; preds = %polly.loop_header
  %8 = shl nsw i64 %polly.indvar, 5
  %9 = sub nsw i64 %height, %8
  %10 = add nsw i64 %9, -1
  %11 = icmp sgt i64 %10, 31
  %12 = select i1 %11, i64 31, i64 %10
  %polly.loop_guard103 = icmp sgt i64 %12, -1
  %polly.adjust_ub106 = add i64 %12, -1
  br label %polly.loop_header91

polly.loop_exit93.loopexit:                       ; preds = %polly.loop_exit102
  br label %polly.loop_exit93

polly.loop_exit93:                                ; preds = %polly.loop_exit93.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond174 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond174, label %if.end24.loopexit, label %polly.loop_header, !llvm.loop !12

polly.loop_header91:                              ; preds = %polly.loop_exit102, %polly.loop_header91.preheader
  %polly.indvar95 = phi i64 [ %polly.indvar_next96, %polly.loop_exit102 ], [ 0, %polly.loop_header91.preheader ]
  br i1 %polly.loop_guard103, label %polly.loop_header100.preheader, label %polly.loop_exit102

polly.loop_header100.preheader:                   ; preds = %polly.loop_header91
  %13 = mul nsw i64 %polly.indvar95, -8
  %14 = add nsw i64 %6, %13
  %15 = icmp sgt i64 %14, 7
  %16 = select i1 %15, i64 7, i64 %14
  %polly.loop_guard112 = icmp sgt i64 %16, -1
  %17 = shl i64 %polly.indvar95, 5
  %18 = or i64 %17, 31
  %19 = icmp slt i64 %18, %width
  %polly.adjust_ub115 = add i64 %16, -1
  br i1 %polly.loop_guard112, label %polly.loop_header100.us.preheader, label %polly.loop_header100.preheader.split

polly.loop_header100.us.preheader:                ; preds = %polly.loop_header100.preheader
  %brmerge = or i1 %19, %polly.loop_guard127
  br label %polly.loop_header100.us

polly.loop_header100.us:                          ; preds = %polly.loop_header100.us.preheader, %polly.merge.us
  %polly.indvar104.us = phi i64 [ %polly.indvar_next105.us, %polly.merge.us ], [ 0, %polly.loop_header100.us.preheader ]
  %20 = add nuw nsw i64 %polly.indvar104.us, %8
  %21 = mul i64 %20, %width
  %22 = add i64 %21, %17
  %23 = insertelement <2 x i64> undef, i64 %20, i32 0
  %24 = insertelement <2 x i64> %23, i64 %20, i32 1
  %25 = insertelement <2 x i64> undef, i64 %20, i32 0
  %26 = insertelement <2 x i64> %25, i64 %20, i32 1
  br label %polly.loop_header109.us

polly.loop_header109.us:                          ; preds = %polly.loop_header100.us, %polly.loop_header109.us
  %polly.indvar113.us = phi i64 [ %polly.indvar_next114.us, %polly.loop_header109.us ], [ 0, %polly.loop_header100.us ]
  %27 = shl i64 %polly.indvar113.us, 2
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
  %polly.indvar_next114.us = add nuw nsw i64 %polly.indvar113.us, 1
  %polly.loop_cond116.us = icmp sgt i64 %polly.indvar113.us, %polly.adjust_ub115
  br i1 %polly.loop_cond116.us, label %polly.cond.loopexit.us, label %polly.loop_header109.us

polly.loop_header124.us:                          ; preds = %polly.loop_header124.us, %polly.loop_header124.preheader.us
  %polly.indvar128.us = phi i64 [ %polly.indvar_next129.us, %polly.loop_header124.us ], [ 0, %polly.loop_header124.preheader.us ]
  %38 = add i64 %39, %polly.indvar128.us
  %scevgep134.us = getelementptr i64, i64* %call, i64 %38
  %_p_scalar_135.us = load i64, i64* %scevgep134.us, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %p_add16136.us = add nsw i64 %_p_scalar_135.us, %20
  store i64 %p_add16136.us, i64* %scevgep134.us, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next129.us = add nuw nsw i64 %polly.indvar128.us, 1
  %exitcond172 = icmp eq i64 %polly.indvar_next129.us, %pexp.pdiv_r
  br i1 %exitcond172, label %polly.merge.us.loopexit, label %polly.loop_header124.us, !llvm.loop !18

polly.merge.us.loopexit:                          ; preds = %polly.loop_header124.us
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next105.us = add nuw nsw i64 %polly.indvar104.us, 1
  %polly.loop_cond107.us = icmp sgt i64 %polly.indvar104.us, %polly.adjust_ub106
  br i1 %polly.loop_cond107.us, label %polly.loop_exit102.loopexit, label %polly.loop_header100.us

polly.loop_header124.preheader.us:                ; preds = %polly.cond.loopexit.us
  %39 = add i64 %21, %7
  br label %polly.loop_header124.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header109.us
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header124.preheader.us

polly.loop_header100.preheader.split:             ; preds = %polly.loop_header100.preheader
  br i1 %19, label %polly.loop_exit102, label %polly.loop_header100.preheader209

polly.loop_header100.preheader209:                ; preds = %polly.loop_header100.preheader.split
  br label %polly.loop_header100

polly.loop_exit102.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit102

polly.loop_exit102.loopexit210:                   ; preds = %polly.merge
  br label %polly.loop_exit102

polly.loop_exit102:                               ; preds = %polly.loop_exit102.loopexit210, %polly.loop_exit102.loopexit, %polly.loop_header100.preheader.split, %polly.loop_header91
  %polly.indvar_next96 = add nuw nsw i64 %polly.indvar95, 1
  %exitcond173 = icmp eq i64 %polly.indvar95, %polly.fdiv_q.shr89
  br i1 %exitcond173, label %polly.loop_exit93.loopexit, label %polly.loop_header91

polly.loop_header100:                             ; preds = %polly.loop_header100.preheader209, %polly.merge
  %polly.indvar104 = phi i64 [ %polly.indvar_next105, %polly.merge ], [ 0, %polly.loop_header100.preheader209 ]
  br i1 %polly.loop_guard127, label %polly.merge, label %polly.loop_header124.preheader

polly.merge.loopexit:                             ; preds = %polly.loop_header124
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header100
  %polly.indvar_next105 = add nuw nsw i64 %polly.indvar104, 1
  %polly.loop_cond107 = icmp sgt i64 %polly.indvar104, %polly.adjust_ub106
  br i1 %polly.loop_cond107, label %polly.loop_exit102.loopexit210, label %polly.loop_header100

polly.loop_header124.preheader:                   ; preds = %polly.loop_header100
  %40 = add nuw nsw i64 %polly.indvar104, %8
  %41 = mul i64 %40, %width
  %42 = add i64 %41, %7
  br label %polly.loop_header124

polly.loop_header124:                             ; preds = %polly.loop_header124, %polly.loop_header124.preheader
  %polly.indvar128 = phi i64 [ %polly.indvar_next129, %polly.loop_header124 ], [ 0, %polly.loop_header124.preheader ]
  %43 = add i64 %42, %polly.indvar128
  %scevgep134 = getelementptr i64, i64* %call, i64 %43
  %_p_scalar_135 = load i64, i64* %scevgep134, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %p_add16136 = add nsw i64 %_p_scalar_135, %40
  store i64 %p_add16136, i64* %scevgep134, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next129 = add nuw nsw i64 %polly.indvar128, 1
  %exitcond = icmp eq i64 %polly.indvar_next129, %pexp.pdiv_r
  br i1 %exitcond, label %polly.merge.loopexit, label %polly.loop_header124, !llvm.loop !22
}

declare i64* @create1DArray(i32, i32) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define void @print_mat(%struct._IO_FILE* nocapture readnone %sys, %struct.Matrix* nocapture %a, i1 zeroext %a_dealloc) local_unnamed_addr #0 {
entry:
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2
  %0 = load i64, i64* %width1, align 8, !tbaa !10
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height2, align 8, !tbaa !11
  %cmp79 = icmp sgt i64 %1, 0
  br i1 %cmp79, label %while.cond3.preheader.preheader, label %blklab6

while.cond3.preheader.preheader:                  ; preds = %entry
  %cmp574 = icmp sgt i64 %0, 0
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  br i1 %cmp574, label %while.cond3.preheader.us.preheader, label %while.cond3.preheader.preheader100

while.cond3.preheader.preheader100:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader

while.cond3.preheader.us.preheader:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader.us

while.cond3.preheader.us:                         ; preds = %while.cond3.preheader.us.preheader, %if.end16.us
  %_25_dealloc.085.us = phi i1 [ true, %if.end16.us ], [ false, %while.cond3.preheader.us.preheader ]
  %_25.084.us = phi i8* [ %6, %if.end16.us ], [ undef, %while.cond3.preheader.us.preheader ]
  %_18_dealloc.083.us = phi i8 [ 1, %if.end16.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %_18.082.us = phi i64* [ %call10.us, %if.end16.us ], [ null, %while.cond3.preheader.us.preheader ]
  %i.080.us = phi i64 [ %add13.us, %if.end16.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %mul.us = mul nsw i64 %i.080.us, %0
  br label %if.end7.us

if.end7.us:                                       ; preds = %while.cond3.preheader.us, %if.end9.us
  %_18_dealloc.177.us = phi i8 [ 1, %if.end9.us ], [ %_18_dealloc.083.us, %while.cond3.preheader.us ]
  %_18.176.us = phi i64* [ %call10.us, %if.end9.us ], [ %_18.082.us, %while.cond3.preheader.us ]
  %j.075.us = phi i64 [ %add12.us, %if.end9.us ], [ 0, %while.cond3.preheader.us ]
  %2 = load i64*, i64** %data, align 8, !tbaa !7
  %add.us = add nsw i64 %j.075.us, %mul.us
  %arrayidx.us = getelementptr inbounds i64, i64* %2, i64 %add.us
  %3 = load i64, i64* %arrayidx.us, align 8, !tbaa !8
  %call.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %3)
  %4 = and i8 %_18_dealloc.177.us, 1
  %tobool.us = icmp eq i8 %4, 0
  br i1 %tobool.us, label %if.end9.us, label %if.then8.us

if.then8.us:                                      ; preds = %if.end7.us
  %5 = bitcast i64* %_18.176.us to i8*
  tail call void @free(i8* %5) #7
  br label %if.end9.us

if.end9.us:                                       ; preds = %if.then8.us, %if.end7.us
  %call10.us = tail call i64* @create1DArray(i32 0, i32 1) #7
  store i64 32, i64* %call10.us, align 8, !tbaa !8
  tail call void @printf_s(i64* %call10.us, i64 1) #7
  %add12.us = add nuw nsw i64 %j.075.us, 1
  %exitcond.us = icmp eq i64 %add12.us, %0
  br i1 %exitcond.us, label %blklab8.loopexit.us, label %if.end7.us

if.then15.us:                                     ; preds = %blklab8.loopexit.us
  tail call void @free(i8* %_25.084.us) #7
  br label %if.end16.us

if.end16.us:                                      ; preds = %if.then15.us, %blklab8.loopexit.us
  %call18.us = tail call i64* @create1DArray(i32 0, i32 0) #7
  %6 = bitcast i64* %call18.us to i8*
  tail call void @println_s(i64* %call18.us, i64 0) #7
  %exitcond90.us = icmp eq i64 %add13.us, %1
  br i1 %exitcond90.us, label %blklab6.loopexit, label %while.cond3.preheader.us

blklab8.loopexit.us:                              ; preds = %if.end9.us
  %add13.us = add nuw nsw i64 %i.080.us, 1
  br i1 %_25_dealloc.085.us, label %if.then15.us, label %if.end16.us

while.cond3.preheader:                            ; preds = %while.cond3.preheader.preheader100, %if.end16
  %_25_dealloc.085 = phi i1 [ true, %if.end16 ], [ false, %while.cond3.preheader.preheader100 ]
  %_25.084 = phi i8* [ %7, %if.end16 ], [ undef, %while.cond3.preheader.preheader100 ]
  %i.080 = phi i64 [ %add13, %if.end16 ], [ 0, %while.cond3.preheader.preheader100 ]
  %add13 = add nuw nsw i64 %i.080, 1
  br i1 %_25_dealloc.085, label %if.then15, label %if.end16

if.then15:                                        ; preds = %while.cond3.preheader
  tail call void @free(i8* %_25.084) #7
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %while.cond3.preheader
  %call18 = tail call i64* @create1DArray(i32 0, i32 0) #7
  %7 = bitcast i64* %call18 to i8*
  tail call void @println_s(i64* %call18, i64 0) #7
  %exitcond90 = icmp eq i64 %add13, %1
  br i1 %exitcond90, label %blklab6.loopexit101, label %while.cond3.preheader

blklab6.loopexit:                                 ; preds = %if.end16.us
  %phitmp = bitcast i64* %call10.us to i8*
  br label %blklab6

blklab6.loopexit101:                              ; preds = %if.end16
  br label %blklab6

blklab6:                                          ; preds = %blklab6.loopexit101, %blklab6.loopexit, %entry
  %_25_dealloc.0.lcssa = phi i1 [ false, %entry ], [ true, %blklab6.loopexit ], [ true, %blklab6.loopexit101 ]
  %_25.0.lcssa = phi i8* [ undef, %entry ], [ %6, %blklab6.loopexit ], [ %7, %blklab6.loopexit101 ]
  %_18_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ 1, %blklab6.loopexit ], [ 0, %blklab6.loopexit101 ]
  %_18.0.lcssa = phi i8* [ null, %entry ], [ %phitmp, %blklab6.loopexit ], [ null, %blklab6.loopexit101 ]
  br i1 %a_dealloc, label %if.then20, label %if.end24

if.then20:                                        ; preds = %blklab6
  %8 = bitcast %struct.Matrix* %a to i8**
  %9 = load i8*, i8** %8, align 8, !tbaa !7
  tail call void @free(i8* %9) #7
  %10 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %10) #7
  br label %if.end24

if.end24:                                         ; preds = %blklab6, %if.then20
  %tobool25 = icmp eq i8 %_18_dealloc.0.lcssa, 0
  br i1 %tobool25, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.end24
  tail call void @free(i8* %_18.0.lcssa) #7
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %if.then26
  br i1 %_25_dealloc.0.lcssa, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end27
  tail call void @free(i8* %_25.0.lcssa) #7
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.end27
  ret void
}

declare void @printf_s(i64*, i64) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @mat_mult(%struct.Matrix* nocapture %a, i1 zeroext %a_dealloc, %struct.Matrix* nocapture %b, i1 zeroext %b_dealloc) local_unnamed_addr #3 {
entry:
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 2
  %0 = load i64, i64* %width2, align 8, !tbaa !10
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height3, align 8, !tbaa !11
  %mul = mul nsw i64 %1, %0
  %conv4 = trunc i64 %mul to i32
  %call = tail call i64* @create1DArray(i32 0, i32 %conv4) #7
  %data11 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %2 = load i64*, i64** %data11, align 8, !tbaa !7
  %data18 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0
  %3 = load i64*, i64** %data18, align 8, !tbaa !7
  %cmp184 = icmp sgt i64 %1, 0
  br i1 %cmp184, label %polly.split_new_and_old, label %if.end56

polly.split_new_and_old:                          ; preds = %entry
  %4 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 1)
  %.obit = extractvalue { i64, i1 } %4, 1
  %.res = extractvalue { i64, i1 } %4, 0
  %polly.access.mul. = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %0)
  %polly.access.mul..obit = extractvalue { i64, i1 } %polly.access.mul., 1
  %polly.overflow.state189 = or i1 %.obit, %polly.access.mul..obit
  %polly.access.mul..res = extractvalue { i64, i1 } %polly.access.mul., 0
  %polly.access.add. = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res, i64 %0)
  %polly.access.add..obit = extractvalue { i64, i1 } %polly.access.add., 1
  %polly.access.add..res = extractvalue { i64, i1 } %polly.access.add., 0
  %polly.access. = getelementptr i64, i64* %3, i64 %polly.access.add..res
  %polly.overflow.state192 = or i1 %polly.overflow.state189, %polly.access.add..obit
  %5 = icmp ule i64* %polly.access., %call
  %6 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.obit193 = extractvalue { i64, i1 } %6, 1
  %polly.overflow.state194 = or i1 %.obit193, %polly.overflow.state192
  %.res195 = extractvalue { i64, i1 } %6, 0
  %polly.access.mul.call196 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res195, i64 %0)
  %polly.access.mul.call.obit197 = extractvalue { i64, i1 } %polly.access.mul.call196, 1
  %polly.overflow.state198 = or i1 %polly.access.mul.call.obit197, %polly.overflow.state194
  %polly.access.mul.call.res199 = extractvalue { i64, i1 } %polly.access.mul.call196, 0
  %polly.access.add.call200 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call.res199, i64 %0)
  %polly.access.add.call.obit201 = extractvalue { i64, i1 } %polly.access.add.call200, 1
  %polly.access.add.call.res203 = extractvalue { i64, i1 } %polly.access.add.call200, 0
  %polly.access.call204 = getelementptr i64, i64* %call, i64 %polly.access.add.call.res203
  %polly.overflow.state211 = or i1 %polly.access.add.call.obit201, %polly.overflow.state198
  %7 = icmp ule i64* %polly.access.call204, %3
  %8 = or i1 %5, %7
  %polly.access.225 = getelementptr i64, i64* %2, i64 %polly.access.add.call.res203
  %9 = icmp ule i64* %polly.access.225, %call
  %10 = icmp ule i64* %polly.access.call204, %2
  %11 = or i1 %9, %10
  %12 = and i1 %8, %11
  %polly.rtc.overflown = xor i1 %polly.overflow.state211, true
  %polly.rtc.result = and i1 %12, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.start, label %while.cond27.preheader.preheader

while.cond27.preheader.preheader:                 ; preds = %polly.split_new_and_old
  %cmp29181 = icmp sgt i64 %0, 0
  br i1 %cmp29181, label %while.cond27.preheader.us.preheader, label %if.end56

while.cond27.preheader.us.preheader:              ; preds = %while.cond27.preheader.preheader
  %xtraiter477 = and i64 %0, 1
  %13 = icmp eq i64 %0, 1
  %lcmp.mod478 = icmp eq i64 %xtraiter477, 0
  %unroll_iter479 = sub i64 %0, %xtraiter477
  br label %while.cond27.preheader.us

while.cond27.preheader.us:                        ; preds = %while.cond27.preheader.us.preheader, %blklab15.loopexit.us-lcssa.us.us
  %i.0185.us = phi i64 [ %add53.us, %blklab15.loopexit.us-lcssa.us.us ], [ 0, %while.cond27.preheader.us.preheader ]
  %mul39.us = mul nsw i64 %i.0185.us, %0
  br label %while.cond33.preheader.us.us

while.cond33.preheader.us.us:                     ; preds = %while.cond27.preheader.us, %blklab17.loopexit.us.us
  %j.0182.us.us = phi i64 [ %add52.us.us, %blklab17.loopexit.us.us ], [ 0, %while.cond27.preheader.us ]
  %add.us.us = add nsw i64 %j.0182.us.us, %mul39.us
  %arrayidx.us.us = getelementptr inbounds i64, i64* %call, i64 %add.us.us
  %.pre = load i64, i64* %arrayidx.us.us, align 8, !tbaa !8
  br i1 %13, label %blklab17.loopexit.us.us.unr-lcssa, label %while.cond33.preheader.us.us.new

while.cond33.preheader.us.us.new:                 ; preds = %while.cond33.preheader.us.us
  br label %if.end38.us.us

blklab17.loopexit.us.us.unr-lcssa.loopexit:       ; preds = %if.end38.us.us
  br label %blklab17.loopexit.us.us.unr-lcssa

blklab17.loopexit.us.us.unr-lcssa:                ; preds = %blklab17.loopexit.us.us.unr-lcssa.loopexit, %while.cond33.preheader.us.us
  %.unr = phi i64 [ %.pre, %while.cond33.preheader.us.us ], [ %add47.us.us.1, %blklab17.loopexit.us.us.unr-lcssa.loopexit ]
  %k.0180.us.us.unr = phi i64 [ 0, %while.cond33.preheader.us.us ], [ %add51.us.us.1, %blklab17.loopexit.us.us.unr-lcssa.loopexit ]
  br i1 %lcmp.mod478, label %blklab17.loopexit.us.us, label %if.end38.us.us.epil.preheader

if.end38.us.us.epil.preheader:                    ; preds = %blklab17.loopexit.us.us.unr-lcssa
  br label %if.end38.us.us.epil

if.end38.us.us.epil:                              ; preds = %if.end38.us.us.epil.preheader
  %add41.us.us.epil = add nsw i64 %k.0180.us.us.unr, %mul39.us
  %arrayidx42.us.us.epil = getelementptr inbounds i64, i64* %2, i64 %add41.us.us.epil
  %14 = load i64, i64* %arrayidx42.us.us.epil, align 8, !tbaa !8
  %mul43.us.us.epil = mul nsw i64 %k.0180.us.us.unr, %0
  %add44.us.us.epil = add nsw i64 %mul43.us.us.epil, %j.0182.us.us
  %arrayidx45.us.us.epil = getelementptr inbounds i64, i64* %3, i64 %add44.us.us.epil
  %15 = load i64, i64* %arrayidx45.us.us.epil, align 8, !tbaa !8
  %mul46.us.us.epil = mul nsw i64 %15, %14
  %add47.us.us.epil = add nsw i64 %mul46.us.us.epil, %.unr
  store i64 %add47.us.us.epil, i64* %arrayidx.us.us, align 8, !tbaa !8
  br label %blklab17.loopexit.us.us.epilog-lcssa

blklab17.loopexit.us.us.epilog-lcssa:             ; preds = %if.end38.us.us.epil
  br label %blklab17.loopexit.us.us

blklab17.loopexit.us.us:                          ; preds = %blklab17.loopexit.us.us.unr-lcssa, %blklab17.loopexit.us.us.epilog-lcssa
  %add52.us.us = add nuw nsw i64 %j.0182.us.us, 1
  %exitcond187.us.us = icmp eq i64 %add52.us.us, %0
  br i1 %exitcond187.us.us, label %blklab15.loopexit.us-lcssa.us.us, label %while.cond33.preheader.us.us

if.end38.us.us:                                   ; preds = %if.end38.us.us, %while.cond33.preheader.us.us.new
  %16 = phi i64 [ %.pre, %while.cond33.preheader.us.us.new ], [ %add47.us.us.1, %if.end38.us.us ]
  %k.0180.us.us = phi i64 [ 0, %while.cond33.preheader.us.us.new ], [ %add51.us.us.1, %if.end38.us.us ]
  %niter480 = phi i64 [ %unroll_iter479, %while.cond33.preheader.us.us.new ], [ %niter480.nsub.1, %if.end38.us.us ]
  %add41.us.us = add nsw i64 %k.0180.us.us, %mul39.us
  %arrayidx42.us.us = getelementptr inbounds i64, i64* %2, i64 %add41.us.us
  %17 = load i64, i64* %arrayidx42.us.us, align 8, !tbaa !8
  %mul43.us.us = mul nsw i64 %k.0180.us.us, %0
  %add44.us.us = add nsw i64 %mul43.us.us, %j.0182.us.us
  %arrayidx45.us.us = getelementptr inbounds i64, i64* %3, i64 %add44.us.us
  %18 = load i64, i64* %arrayidx45.us.us, align 8, !tbaa !8
  %mul46.us.us = mul nsw i64 %18, %17
  %add47.us.us = add nsw i64 %mul46.us.us, %16
  store i64 %add47.us.us, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add51.us.us = or i64 %k.0180.us.us, 1
  %add41.us.us.1 = add nsw i64 %add51.us.us, %mul39.us
  %arrayidx42.us.us.1 = getelementptr inbounds i64, i64* %2, i64 %add41.us.us.1
  %19 = load i64, i64* %arrayidx42.us.us.1, align 8, !tbaa !8
  %mul43.us.us.1 = mul nsw i64 %add51.us.us, %0
  %add44.us.us.1 = add nsw i64 %mul43.us.us.1, %j.0182.us.us
  %arrayidx45.us.us.1 = getelementptr inbounds i64, i64* %3, i64 %add44.us.us.1
  %20 = load i64, i64* %arrayidx45.us.us.1, align 8, !tbaa !8
  %mul46.us.us.1 = mul nsw i64 %20, %19
  %add47.us.us.1 = add nsw i64 %mul46.us.us.1, %add47.us.us
  store i64 %add47.us.us.1, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add51.us.us.1 = add nsw i64 %k.0180.us.us, 2
  %niter480.nsub.1 = add i64 %niter480, -2
  %niter480.ncmp.1 = icmp eq i64 %niter480.nsub.1, 0
  br i1 %niter480.ncmp.1, label %blklab17.loopexit.us.us.unr-lcssa.loopexit, label %if.end38.us.us

blklab15.loopexit.us-lcssa.us.us:                 ; preds = %blklab17.loopexit.us.us
  %add53.us = add nuw nsw i64 %i.0185.us, 1
  %exitcond188.us = icmp eq i64 %add53.us, %1
  br i1 %exitcond188.us, label %if.end56.loopexit472, label %while.cond27.preheader.us

if.end56.loopexit:                                ; preds = %polly.loop_exit260
  br label %if.end56

if.end56.loopexit472:                             ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %if.end56

if.end56:                                         ; preds = %if.end56.loopexit472, %if.end56.loopexit, %while.cond27.preheader.preheader, %polly.start, %entry
  %call.i = tail call noalias i8* @malloc(i64 32) #7
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
  br i1 %a_dealloc, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end56
  %25 = bitcast %struct.Matrix* %a to i8**
  %26 = load i8*, i8** %25, align 8, !tbaa !7
  tail call void @free(i8* %26) #7
  %27 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %27) #7
  br label %if.end61

if.end61:                                         ; preds = %if.then60, %if.end56
  br i1 %b_dealloc, label %if.then63, label %if.end85

if.then63:                                        ; preds = %if.end61
  %28 = bitcast %struct.Matrix* %b to i8**
  %29 = load i8*, i8** %28, align 8, !tbaa !7
  tail call void @free(i8* %29) #7
  %30 = bitcast %struct.Matrix* %b to i8*
  tail call void @free(i8* %30) #7
  br label %if.end85

if.end85:                                         ; preds = %if.end61, %if.then63
  ret %struct.Matrix* %21

polly.start:                                      ; preds = %polly.split_new_and_old
  %31 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %31, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %if.end56

polly.loop_header.preheader:                      ; preds = %polly.start
  %32 = add nsw i64 %0, -1
  %polly.fdiv_q.shr256 = ashr i64 %32, 5
  %polly.loop_guard261 = icmp sgt i64 %polly.fdiv_q.shr256, -1
  %pexp.p_div_q = lshr i64 %32, 5
  %pexp.p_div_q291 = lshr i64 %0, 2
  %33 = add nsw i64 %pexp.p_div_q291, -1
  %pexp.pdiv_r = and i64 %0, 3
  %polly.loop_guard315 = icmp eq i64 %pexp.pdiv_r, 0
  %34 = and i64 %0, -4
  %35 = add nsw i64 %pexp.pdiv_r, -1
  %xtraiter473 = and i64 %0, 1
  %36 = icmp eq i64 %35, 0
  %lcmp.mod474 = icmp eq i64 %xtraiter473, 0
  %unroll_iter475 = sub nsw i64 %pexp.pdiv_r, %xtraiter473
  %xtraiter = and i64 %0, 1
  %37 = icmp eq i64 %35, 0
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %unroll_iter = sub nsw i64 %pexp.pdiv_r, %xtraiter
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit260, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit260 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard261, label %polly.loop_header258.preheader, label %polly.loop_exit260

polly.loop_header258.preheader:                   ; preds = %polly.loop_header
  %38 = shl nsw i64 %polly.indvar, 5
  %39 = sub nsw i64 %1, %38
  %40 = add nsw i64 %39, -1
  %41 = icmp sgt i64 %40, 31
  %42 = select i1 %41, i64 31, i64 %40
  %polly.loop_guard277 = icmp sgt i64 %42, -1
  %polly.adjust_ub280 = add i64 %42, -1
  br label %polly.loop_header258

polly.loop_exit260.loopexit:                      ; preds = %polly.loop_exit268
  br label %polly.loop_exit260

polly.loop_exit260:                               ; preds = %polly.loop_exit260.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond414 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond414, label %if.end56.loopexit, label %polly.loop_header, !llvm.loop !23

polly.loop_header258:                             ; preds = %polly.loop_exit268, %polly.loop_header258.preheader
  %polly.indvar262 = phi i64 [ %polly.indvar_next263, %polly.loop_exit268 ], [ 0, %polly.loop_header258.preheader ]
  %43 = shl nsw i64 %polly.indvar262, 5
  %44 = sub nsw i64 %0, %43
  %45 = add nsw i64 %44, -1
  %46 = icmp sgt i64 %45, 31
  %47 = select i1 %46, i64 31, i64 %45
  %polly.loop_guard286 = icmp sgt i64 %47, -1
  %polly.adjust_ub289 = add i64 %47, -1
  br label %polly.loop_header266

polly.loop_exit268:                               ; preds = %polly.loop_exit276
  %polly.indvar_next263 = add nuw nsw i64 %polly.indvar262, 1
  %exitcond413 = icmp eq i64 %polly.indvar262, %polly.fdiv_q.shr256
  br i1 %exitcond413, label %polly.loop_exit260.loopexit, label %polly.loop_header258

polly.loop_header266:                             ; preds = %polly.loop_exit276, %polly.loop_header258
  %polly.indvar269 = phi i64 [ 0, %polly.loop_header258 ], [ %polly.indvar_next270, %polly.loop_exit276 ]
  br i1 %polly.loop_guard277, label %polly.loop_header274.preheader, label %polly.loop_exit276

polly.loop_header274.preheader:                   ; preds = %polly.loop_header266
  %48 = mul nsw i64 %polly.indvar269, -8
  %49 = add nsw i64 %33, %48
  %50 = icmp sgt i64 %49, 7
  %51 = select i1 %50, i64 7, i64 %49
  %polly.loop_guard296 = icmp sgt i64 %51, -1
  %52 = shl i64 %polly.indvar269, 5
  %53 = or i64 %52, 31
  %54 = icmp slt i64 %53, %0
  %polly.adjust_ub299 = add i64 %51, -1
  %brmerge = or i1 %54, %polly.loop_guard315
  br label %polly.loop_header274

polly.loop_exit276.loopexit:                      ; preds = %polly.loop_exit285
  br label %polly.loop_exit276

polly.loop_exit276:                               ; preds = %polly.loop_exit276.loopexit, %polly.loop_header266
  %polly.indvar_next270 = add nuw nsw i64 %polly.indvar269, 1
  %exitcond412 = icmp eq i64 %polly.indvar269, %pexp.p_div_q
  br i1 %exitcond412, label %polly.loop_exit268, label %polly.loop_header266

polly.loop_header274:                             ; preds = %polly.loop_header274.preheader, %polly.loop_exit285
  %polly.indvar278 = phi i64 [ %polly.indvar_next279, %polly.loop_exit285 ], [ 0, %polly.loop_header274.preheader ]
  br i1 %polly.loop_guard286, label %polly.loop_header283.preheader, label %polly.loop_exit285

polly.loop_header283.preheader:                   ; preds = %polly.loop_header274
  %55 = add nuw nsw i64 %polly.indvar278, %38
  %56 = mul i64 %55, %0
  br i1 %polly.loop_guard296, label %polly.loop_header283.us.preheader, label %polly.loop_header283.preheader.split

polly.loop_header283.us.preheader:                ; preds = %polly.loop_header283.preheader
  br label %polly.loop_header283.us

polly.loop_header283.us:                          ; preds = %polly.loop_header283.us.preheader, %polly.merge.us
  %polly.indvar287.us = phi i64 [ %polly.indvar_next288.us, %polly.merge.us ], [ 0, %polly.loop_header283.us.preheader ]
  %57 = add nuw nsw i64 %polly.indvar287.us, %43
  %58 = add i64 %57, %56
  %scevgep.us = getelementptr i64, i64* %call, i64 %58
  %scevgep.promoted333.us = load i64, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.loop_header293.us

polly.loop_header293.us:                          ; preds = %polly.loop_header283.us, %polly.loop_header293.us
  %p_add47.lcssa334.us = phi i64 [ %p_add47.us.3, %polly.loop_header293.us ], [ %scevgep.promoted333.us, %polly.loop_header283.us ]
  %polly.indvar297.us = phi i64 [ %polly.indvar_next298.us, %polly.loop_header293.us ], [ 0, %polly.loop_header283.us ]
  %59 = shl i64 %polly.indvar297.us, 2
  %60 = add nuw nsw i64 %59, %52
  %61 = add i64 %60, %56
  %scevgep307.us = getelementptr i64, i64* %2, i64 %61
  %_p_scalar_308.us = load i64, i64* %scevgep307.us, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %62 = mul i64 %60, %0
  %63 = add i64 %62, %57
  %scevgep309.us = getelementptr i64, i64* %3, i64 %63
  %_p_scalar_310.us = load i64, i64* %scevgep309.us, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul46.us = mul nsw i64 %_p_scalar_310.us, %_p_scalar_308.us
  %p_add47.us = add nsw i64 %p_mul46.us, %p_add47.lcssa334.us
  %64 = or i64 %60, 1
  %65 = add i64 %64, %56
  %scevgep307.us.1 = getelementptr i64, i64* %2, i64 %65
  %_p_scalar_308.us.1 = load i64, i64* %scevgep307.us.1, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %66 = mul i64 %64, %0
  %67 = add i64 %66, %57
  %scevgep309.us.1 = getelementptr i64, i64* %3, i64 %67
  %_p_scalar_310.us.1 = load i64, i64* %scevgep309.us.1, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul46.us.1 = mul nsw i64 %_p_scalar_310.us.1, %_p_scalar_308.us.1
  %p_add47.us.1 = add nsw i64 %p_mul46.us.1, %p_add47.us
  %68 = or i64 %60, 2
  %69 = add i64 %68, %56
  %scevgep307.us.2 = getelementptr i64, i64* %2, i64 %69
  %_p_scalar_308.us.2 = load i64, i64* %scevgep307.us.2, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %70 = mul i64 %68, %0
  %71 = add i64 %70, %57
  %scevgep309.us.2 = getelementptr i64, i64* %3, i64 %71
  %_p_scalar_310.us.2 = load i64, i64* %scevgep309.us.2, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul46.us.2 = mul nsw i64 %_p_scalar_310.us.2, %_p_scalar_308.us.2
  %p_add47.us.2 = add nsw i64 %p_mul46.us.2, %p_add47.us.1
  %72 = or i64 %60, 3
  %73 = add i64 %72, %56
  %scevgep307.us.3 = getelementptr i64, i64* %2, i64 %73
  %_p_scalar_308.us.3 = load i64, i64* %scevgep307.us.3, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !30
  %74 = mul i64 %72, %0
  %75 = add i64 %74, %57
  %scevgep309.us.3 = getelementptr i64, i64* %3, i64 %75
  %_p_scalar_310.us.3 = load i64, i64* %scevgep309.us.3, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul46.us.3 = mul nsw i64 %_p_scalar_310.us.3, %_p_scalar_308.us.3
  %p_add47.us.3 = add nsw i64 %p_mul46.us.3, %p_add47.us.2
  %polly.indvar_next298.us = add nuw nsw i64 %polly.indvar297.us, 1
  %polly.loop_cond300.us = icmp sgt i64 %polly.indvar297.us, %polly.adjust_ub299
  br i1 %polly.loop_cond300.us, label %polly.cond.loopexit.us, label %polly.loop_header293.us

polly.loop_header312.us:                          ; preds = %polly.loop_header312.us, %polly.loop_header312.us.preheader.new
  %p_add47329335.us = phi i64 [ %p_add47.us.3, %polly.loop_header312.us.preheader.new ], [ %p_add47329.us.1, %polly.loop_header312.us ]
  %polly.indvar316.us = phi i64 [ 0, %polly.loop_header312.us.preheader.new ], [ %polly.indvar_next317.us.1, %polly.loop_header312.us ]
  %niter476 = phi i64 [ %unroll_iter475, %polly.loop_header312.us.preheader.new ], [ %niter476.nsub.1, %polly.loop_header312.us ]
  %76 = add nuw nsw i64 %polly.indvar316.us, %34
  %77 = add i64 %76, %56
  %scevgep324.us = getelementptr i64, i64* %2, i64 %77
  %_p_scalar_325.us = load i64, i64* %scevgep324.us, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %78 = mul i64 %76, %0
  %79 = add i64 %78, %57
  %scevgep326.us = getelementptr i64, i64* %3, i64 %79
  %_p_scalar_327.us = load i64, i64* %scevgep326.us, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul46328.us = mul nsw i64 %_p_scalar_327.us, %_p_scalar_325.us
  %p_add47329.us = add nsw i64 %p_mul46328.us, %p_add47329335.us
  %polly.indvar_next317.us = or i64 %polly.indvar316.us, 1
  %80 = add nuw nsw i64 %polly.indvar_next317.us, %34
  %81 = add i64 %80, %56
  %scevgep324.us.1 = getelementptr i64, i64* %2, i64 %81
  %_p_scalar_325.us.1 = load i64, i64* %scevgep324.us.1, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %82 = mul i64 %80, %0
  %83 = add i64 %82, %57
  %scevgep326.us.1 = getelementptr i64, i64* %3, i64 %83
  %_p_scalar_327.us.1 = load i64, i64* %scevgep326.us.1, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul46328.us.1 = mul nsw i64 %_p_scalar_327.us.1, %_p_scalar_325.us.1
  %p_add47329.us.1 = add nsw i64 %p_mul46328.us.1, %p_add47329.us
  %polly.indvar_next317.us.1 = add nsw i64 %polly.indvar316.us, 2
  %niter476.nsub.1 = add i64 %niter476, -2
  %niter476.ncmp.1 = icmp eq i64 %niter476.nsub.1, 0
  br i1 %niter476.ncmp.1, label %polly.merge.loopexit.us.unr-lcssa.loopexit, label %polly.loop_header312.us, !llvm.loop !35

polly.merge.us:                                   ; preds = %polly.cond.loopexit.us, %polly.merge.loopexit.us
  %polly.indvar_next288.us = add nuw nsw i64 %polly.indvar287.us, 1
  %polly.loop_cond290.us = icmp sgt i64 %polly.indvar287.us, %polly.adjust_ub289
  br i1 %polly.loop_cond290.us, label %polly.loop_exit285.loopexit, label %polly.loop_header283.us

polly.merge.loopexit.us.unr-lcssa.loopexit:       ; preds = %polly.loop_header312.us
  br label %polly.merge.loopexit.us.unr-lcssa

polly.merge.loopexit.us.unr-lcssa:                ; preds = %polly.merge.loopexit.us.unr-lcssa.loopexit, %polly.loop_header312.us.preheader
  %p_add47329.us.lcssa.ph = phi i64 [ undef, %polly.loop_header312.us.preheader ], [ %p_add47329.us.1, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  %p_add47329335.us.unr = phi i64 [ %p_add47.us.3, %polly.loop_header312.us.preheader ], [ %p_add47329.us.1, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  %polly.indvar316.us.unr = phi i64 [ 0, %polly.loop_header312.us.preheader ], [ %polly.indvar_next317.us.1, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  br i1 %lcmp.mod474, label %polly.merge.loopexit.us, label %polly.loop_header312.us.epil.preheader

polly.loop_header312.us.epil.preheader:           ; preds = %polly.merge.loopexit.us.unr-lcssa
  br label %polly.loop_header312.us.epil

polly.loop_header312.us.epil:                     ; preds = %polly.loop_header312.us.epil.preheader
  %84 = add nuw nsw i64 %polly.indvar316.us.unr, %34
  br label %polly.merge.loopexit.us.epilog-lcssa

polly.merge.loopexit.us.epilog-lcssa:             ; preds = %polly.loop_header312.us.epil
  %85 = mul i64 %84, %0
  %86 = add i64 %85, %57
  %scevgep326.us.epil = getelementptr i64, i64* %3, i64 %86
  %_p_scalar_327.us.epil = load i64, i64* %scevgep326.us.epil, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %87 = add i64 %84, %56
  %scevgep324.us.epil = getelementptr i64, i64* %2, i64 %87
  %_p_scalar_325.us.epil = load i64, i64* %scevgep324.us.epil, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %p_mul46328.us.epil = mul nsw i64 %_p_scalar_327.us.epil, %_p_scalar_325.us.epil
  %p_add47329.us.epil = add nsw i64 %p_mul46328.us.epil, %p_add47329335.us.unr
  br label %polly.merge.loopexit.us

polly.merge.loopexit.us:                          ; preds = %polly.merge.loopexit.us.unr-lcssa, %polly.merge.loopexit.us.epilog-lcssa
  %p_add47329.us.lcssa = phi i64 [ %p_add47329.us.lcssa.ph, %polly.merge.loopexit.us.unr-lcssa ], [ %p_add47329.us.epil, %polly.merge.loopexit.us.epilog-lcssa ]
  store i64 %p_add47329.us.lcssa, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header293.us
  store i64 %p_add47.us.3, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header312.us.preheader

polly.loop_header312.us.preheader:                ; preds = %polly.cond.loopexit.us
  br i1 %36, label %polly.merge.loopexit.us.unr-lcssa, label %polly.loop_header312.us.preheader.new

polly.loop_header312.us.preheader.new:            ; preds = %polly.loop_header312.us.preheader
  br label %polly.loop_header312.us

polly.loop_header283.preheader.split:             ; preds = %polly.loop_header283.preheader
  br i1 %54, label %polly.loop_exit285, label %polly.loop_header283.preheader470

polly.loop_header283.preheader470:                ; preds = %polly.loop_header283.preheader.split
  br label %polly.loop_header283

polly.loop_exit285.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit285

polly.loop_exit285.loopexit471:                   ; preds = %polly.merge
  br label %polly.loop_exit285

polly.loop_exit285:                               ; preds = %polly.loop_exit285.loopexit471, %polly.loop_exit285.loopexit, %polly.loop_header283.preheader.split, %polly.loop_header274
  %polly.indvar_next279 = add nuw nsw i64 %polly.indvar278, 1
  %polly.loop_cond281 = icmp sgt i64 %polly.indvar278, %polly.adjust_ub280
  br i1 %polly.loop_cond281, label %polly.loop_exit276.loopexit, label %polly.loop_header274

polly.loop_header283:                             ; preds = %polly.loop_header283.preheader470, %polly.merge
  %polly.indvar287 = phi i64 [ %polly.indvar_next288, %polly.merge ], [ 0, %polly.loop_header283.preheader470 ]
  br i1 %polly.loop_guard315, label %polly.merge, label %polly.loop_header312.preheader

polly.merge.loopexit.unr-lcssa.loopexit:          ; preds = %polly.loop_header312
  br label %polly.merge.loopexit.unr-lcssa

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.merge.loopexit.unr-lcssa.loopexit, %polly.loop_header312.preheader
  %p_add47329.lcssa.ph = phi i64 [ undef, %polly.loop_header312.preheader ], [ %p_add47329.1, %polly.merge.loopexit.unr-lcssa.loopexit ]
  %p_add47329335.unr = phi i64 [ %scevgep322.promoted, %polly.loop_header312.preheader ], [ %p_add47329.1, %polly.merge.loopexit.unr-lcssa.loopexit ]
  %polly.indvar316.unr = phi i64 [ 0, %polly.loop_header312.preheader ], [ %polly.indvar_next317.1, %polly.merge.loopexit.unr-lcssa.loopexit ]
  br i1 %lcmp.mod, label %polly.merge.loopexit, label %polly.loop_header312.epil.preheader

polly.loop_header312.epil.preheader:              ; preds = %polly.merge.loopexit.unr-lcssa
  br label %polly.loop_header312.epil

polly.loop_header312.epil:                        ; preds = %polly.loop_header312.epil.preheader
  %88 = add nuw nsw i64 %polly.indvar316.unr, %34
  br label %polly.merge.loopexit.epilog-lcssa

polly.merge.loopexit.epilog-lcssa:                ; preds = %polly.loop_header312.epil
  %89 = mul i64 %88, %0
  %90 = add i64 %89, %92
  %scevgep326.epil = getelementptr i64, i64* %3, i64 %90
  %_p_scalar_327.epil = load i64, i64* %scevgep326.epil, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %91 = add i64 %88, %56
  %scevgep324.epil = getelementptr i64, i64* %2, i64 %91
  %_p_scalar_325.epil = load i64, i64* %scevgep324.epil, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %p_mul46328.epil = mul nsw i64 %_p_scalar_327.epil, %_p_scalar_325.epil
  %p_add47329.epil = add nsw i64 %p_mul46328.epil, %p_add47329335.unr
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.merge.loopexit.unr-lcssa, %polly.merge.loopexit.epilog-lcssa
  %p_add47329.lcssa = phi i64 [ %p_add47329.lcssa.ph, %polly.merge.loopexit.unr-lcssa ], [ %p_add47329.epil, %polly.merge.loopexit.epilog-lcssa ]
  store i64 %p_add47329.lcssa, i64* %scevgep322, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header283
  %polly.indvar_next288 = add nuw nsw i64 %polly.indvar287, 1
  %polly.loop_cond290 = icmp sgt i64 %polly.indvar287, %polly.adjust_ub289
  br i1 %polly.loop_cond290, label %polly.loop_exit285.loopexit471, label %polly.loop_header283

polly.loop_header312.preheader:                   ; preds = %polly.loop_header283
  %92 = add nuw nsw i64 %polly.indvar287, %43
  %93 = add i64 %92, %56
  %scevgep322 = getelementptr i64, i64* %call, i64 %93
  %scevgep322.promoted = load i64, i64* %scevgep322, align 8, !alias.scope !24, !noalias !26
  br i1 %37, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header312.preheader.new

polly.loop_header312.preheader.new:               ; preds = %polly.loop_header312.preheader
  br label %polly.loop_header312

polly.loop_header312:                             ; preds = %polly.loop_header312, %polly.loop_header312.preheader.new
  %p_add47329335 = phi i64 [ %scevgep322.promoted, %polly.loop_header312.preheader.new ], [ %p_add47329.1, %polly.loop_header312 ]
  %polly.indvar316 = phi i64 [ 0, %polly.loop_header312.preheader.new ], [ %polly.indvar_next317.1, %polly.loop_header312 ]
  %niter = phi i64 [ %unroll_iter, %polly.loop_header312.preheader.new ], [ %niter.nsub.1, %polly.loop_header312 ]
  %94 = add nuw nsw i64 %polly.indvar316, %34
  %95 = add i64 %94, %56
  %scevgep324 = getelementptr i64, i64* %2, i64 %95
  %_p_scalar_325 = load i64, i64* %scevgep324, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %96 = mul i64 %94, %0
  %97 = add i64 %96, %92
  %scevgep326 = getelementptr i64, i64* %3, i64 %97
  %_p_scalar_327 = load i64, i64* %scevgep326, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul46328 = mul nsw i64 %_p_scalar_327, %_p_scalar_325
  %p_add47329 = add nsw i64 %p_mul46328, %p_add47329335
  %polly.indvar_next317 = or i64 %polly.indvar316, 1
  %98 = add nuw nsw i64 %polly.indvar_next317, %34
  %99 = add i64 %98, %56
  %scevgep324.1 = getelementptr i64, i64* %2, i64 %99
  %_p_scalar_325.1 = load i64, i64* %scevgep324.1, align 8, !alias.scope !28, !noalias !29, !llvm.mem.parallel_loop_access !33
  %100 = mul i64 %98, %0
  %101 = add i64 %100, %92
  %scevgep326.1 = getelementptr i64, i64* %3, i64 %101
  %_p_scalar_327.1 = load i64, i64* %scevgep326.1, align 8, !alias.scope !27, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul46328.1 = mul nsw i64 %_p_scalar_327.1, %_p_scalar_325.1
  %p_add47329.1 = add nsw i64 %p_mul46328.1, %p_add47329
  %polly.indvar_next317.1 = add nsw i64 %polly.indvar316, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %polly.merge.loopexit.unr-lcssa.loopexit, label %polly.loop_header312, !llvm.loop !36
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #4 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7
  %0 = load i64*, i64** %call, align 8, !tbaa !9
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end204, label %if.end5

if.end5:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !8
  %call10 = tail call i64* @create1DArray(i32 0, i32 7) #7
  %2 = bitcast i64* %call10 to <2 x i64>*
  store <2 x i64> <i64 115, i64 105>, <2 x i64>* %2, align 8, !tbaa !8
  %arrayidx13 = getelementptr inbounds i64, i64* %call10, i64 2
  %3 = bitcast i64* %arrayidx13 to <2 x i64>*
  store <2 x i64> <i64 122, i64 101>, <2 x i64>* %3, align 8, !tbaa !8
  %arrayidx15 = getelementptr inbounds i64, i64* %call10, i64 4
  %4 = bitcast i64* %arrayidx15 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %4, align 8, !tbaa !8
  %arrayidx17 = getelementptr inbounds i64, i64* %call10, i64 6
  store i64 32, i64* %arrayidx17, align 8, !tbaa !8
  tail call void @printf_s(i64* %call10, i64 7) #7
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1)
  %call22 = tail call %struct.Matrix* @init(i64 %1, i64 %1)
  %call31 = tail call %struct.Matrix* @init(i64 %1, i64 %1)
  %call40 = tail call %struct.Matrix* @mat_mult(%struct.Matrix* %call22, i1 zeroext false, %struct.Matrix* %call31, i1 zeroext false)
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call22, i64 0, i32 0
  %5 = load i64*, i64** %data, align 8, !tbaa !7
  %sub46 = add nsw i64 %1, -1
  %add = mul i64 %1, %1
  %sub47 = add nsw i64 %add, -1
  %arrayidx48 = getelementptr inbounds i64, i64* %5, i64 %sub47
  %6 = load i64, i64* %arrayidx48, align 8, !tbaa !8
  %cmp50 = icmp eq i64 %6, %sub46
  br i1 %cmp50, label %blklab20, label %if.end53

if.end53:                                         ; preds = %if.end5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %8 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %7) #8
  tail call void @exit(i32 -1) #9
  unreachable

blklab20:                                         ; preds = %if.end5
  %data56 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 0
  %9 = load i64*, i64** %data56, align 8, !tbaa !7
  %arrayidx61 = getelementptr inbounds i64, i64* %9, i64 %sub47
  %10 = load i64, i64* %arrayidx61, align 8, !tbaa !8
  %cmp63 = icmp eq i64 %10, %sub46
  br i1 %cmp63, label %blklab21, label %if.end66

if.end66:                                         ; preds = %blklab20
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %11) #8
  tail call void @exit(i32 -1) #9
  unreachable

blklab21:                                         ; preds = %blklab20
  %cmp68 = icmp eq i64 %1, 2000
  %data73 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call40, i64 0, i32 0
  %13 = load i64*, i64** %data73, align 8, !tbaa !7
  br i1 %cmp68, label %if.end71, label %if.then158

if.end71:                                         ; preds = %blklab21
  %arrayidx78 = getelementptr inbounds i64, i64* %13, i64 %sub47
  %14 = load i64, i64* %arrayidx78, align 8, !tbaa !8
  %cmp79 = icmp eq i64 %14, 3996001000
  br i1 %cmp79, label %if.then158, label %if.end82

if.end82:                                         ; preds = %if.end71
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %15) #8
  tail call void @exit(i32 -1) #9
  unreachable

if.then158:                                       ; preds = %blklab21, %if.end71
  %call88 = tail call i64* @create1DArray(i32 0, i32 27) #7
  %17 = bitcast i64* %call88 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %17, align 8, !tbaa !8
  %arrayidx91 = getelementptr inbounds i64, i64* %call88, i64 2
  %18 = bitcast i64* %arrayidx91 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %18, align 8, !tbaa !8
  %arrayidx93 = getelementptr inbounds i64, i64* %call88, i64 4
  %19 = bitcast i64* %arrayidx93 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %19, align 8, !tbaa !8
  %arrayidx95 = getelementptr inbounds i64, i64* %call88, i64 6
  %20 = bitcast i64* %arrayidx95 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %20, align 8, !tbaa !8
  %arrayidx97 = getelementptr inbounds i64, i64* %call88, i64 8
  %21 = bitcast i64* %arrayidx97 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %21, align 8, !tbaa !8
  %arrayidx99 = getelementptr inbounds i64, i64* %call88, i64 10
  %22 = bitcast i64* %arrayidx99 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %22, align 8, !tbaa !8
  %arrayidx101 = getelementptr inbounds i64, i64* %call88, i64 12
  %23 = bitcast i64* %arrayidx101 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %23, align 8, !tbaa !8
  %arrayidx103 = getelementptr inbounds i64, i64* %call88, i64 14
  %24 = bitcast i64* %arrayidx103 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %24, align 8, !tbaa !8
  %arrayidx105 = getelementptr inbounds i64, i64* %call88, i64 16
  %25 = bitcast i64* %arrayidx105 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %25, align 8, !tbaa !8
  %arrayidx107 = getelementptr inbounds i64, i64* %call88, i64 18
  %26 = bitcast i64* %arrayidx107 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %26, align 8, !tbaa !8
  %arrayidx109 = getelementptr inbounds i64, i64* %call88, i64 20
  %27 = bitcast i64* %arrayidx109 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %27, align 8, !tbaa !8
  %arrayidx111 = getelementptr inbounds i64, i64* %call88, i64 22
  %28 = bitcast i64* %arrayidx111 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %28, align 8, !tbaa !8
  %arrayidx113 = getelementptr inbounds i64, i64* %call88, i64 24
  %29 = bitcast i64* %arrayidx113 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %29, align 8, !tbaa !8
  %arrayidx115 = getelementptr inbounds i64, i64* %call88, i64 26
  store i64 32, i64* %arrayidx115, align 8, !tbaa !8
  tail call void @printf_s(i64* %call88, i64 27) #7
  %arrayidx122 = getelementptr inbounds i64, i64* %13, i64 %sub47
  %30 = load i64, i64* %arrayidx122, align 8, !tbaa !8
  %call123 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %30)
  %call128 = tail call i64* @create1DArray(i32 0, i32 25) #7
  %31 = bitcast i64* %call128 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %31, align 8, !tbaa !8
  %arrayidx131 = getelementptr inbounds i64, i64* %call128, i64 2
  %32 = bitcast i64* %arrayidx131 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %32, align 8, !tbaa !8
  %arrayidx133 = getelementptr inbounds i64, i64* %call128, i64 4
  %33 = bitcast i64* %arrayidx133 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %33, align 8, !tbaa !8
  %arrayidx135 = getelementptr inbounds i64, i64* %call128, i64 6
  %34 = bitcast i64* %arrayidx135 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %34, align 8, !tbaa !8
  %arrayidx137 = getelementptr inbounds i64, i64* %call128, i64 8
  %35 = bitcast i64* %arrayidx137 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %35, align 8, !tbaa !8
  %arrayidx139 = getelementptr inbounds i64, i64* %call128, i64 10
  %36 = bitcast i64* %arrayidx139 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %36, align 8, !tbaa !8
  %arrayidx141 = getelementptr inbounds i64, i64* %call128, i64 12
  %37 = bitcast i64* %arrayidx141 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %37, align 8, !tbaa !8
  %arrayidx143 = getelementptr inbounds i64, i64* %call128, i64 14
  %38 = bitcast i64* %arrayidx143 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %38, align 8, !tbaa !8
  %arrayidx145 = getelementptr inbounds i64, i64* %call128, i64 16
  %39 = bitcast i64* %arrayidx145 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %39, align 8, !tbaa !8
  %arrayidx147 = getelementptr inbounds i64, i64* %call128, i64 18
  %40 = bitcast i64* %arrayidx147 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %40, align 8, !tbaa !8
  %arrayidx149 = getelementptr inbounds i64, i64* %call128, i64 20
  %41 = bitcast i64* %arrayidx149 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %41, align 8, !tbaa !8
  %arrayidx151 = getelementptr inbounds i64, i64* %call128, i64 22
  %42 = bitcast i64* %arrayidx151 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %42, align 8, !tbaa !8
  %arrayidx153 = getelementptr inbounds i64, i64* %call128, i64 24
  store i64 101, i64* %arrayidx153, align 8, !tbaa !8
  tail call void @println_s(i64* %call128, i64 25) #7
  %phitmp = bitcast i64* %call128 to i8*
  %phitmp336 = bitcast i64* %call88 to i8*
  %phitmp337 = bitcast i64* %call10 to i8*
  %43 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %43) #7
  %44 = bitcast %struct.Matrix* %call22 to i8**
  %45 = load i8*, i8** %44, align 8, !tbaa !7
  tail call void @free(i8* %45) #7
  %46 = bitcast %struct.Matrix* %call22 to i8*
  tail call void @free(i8* %46) #7
  %47 = bitcast %struct.Matrix* %call31 to i8**
  %48 = load i8*, i8** %47, align 8, !tbaa !7
  tail call void @free(i8* %48) #7
  %49 = bitcast %struct.Matrix* %call31 to i8*
  tail call void @free(i8* %49) #7
  %50 = bitcast %struct.Matrix* %call40 to i8**
  %51 = load i8*, i8** %50, align 8, !tbaa !7
  tail call void @free(i8* %51) #7
  %52 = bitcast %struct.Matrix* %call40 to i8*
  tail call void @free(i8* %52) #7
  tail call void @free(i8* %phitmp337) #7
  tail call void @free(i8* %phitmp336) #7
  tail call void @free(i8* %phitmp) #7
  br label %if.end204

if.end204:                                        ; preds = %entry, %if.then158
  tail call void @exit(i32 0) #9
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #2

declare i64* @parseStringToInt(i64*) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

declare i32 @putchar(i32) local_unnamed_addr

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #6

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #6

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #6

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #7

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"}
!1 = !{!2, !6, i64 8}
!2 = !{!"", !3, i64 0, !6, i64 8, !6, i64 16, !6, i64 24}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!"long long", !4, i64 0}
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
