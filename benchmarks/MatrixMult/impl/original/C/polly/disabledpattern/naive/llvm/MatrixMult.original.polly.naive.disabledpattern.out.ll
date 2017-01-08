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
  %call2 = tail call i64* @copy1DArray_int64_t(i64* %data, i64 %data_size) #8
  %data3 = bitcast i8* %call to i64**
  store i64* %call2, i64** %data3, align 8, !tbaa !7
  %height4 = getelementptr inbounds i8, i8* %call, i64 24
  %2 = bitcast i8* %height4 to i64*
  store i64 %height, i64* %2, align 8, !tbaa !11
  %width5 = getelementptr inbounds i8, i8* %call, i64 16
  %3 = bitcast i8* %width5 to i64*
  store i64 %width, i64* %3, align 8, !tbaa !10
  ret %struct.Matrix* %0
}

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @_init_(i64 %width, i64 %height) local_unnamed_addr #4 {
entry:
  %mul = mul nsw i64 %height, %width
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %mul) #8
  %call1 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 %mul) #8
  %cmp59 = icmp sgt i64 %height, 0
  br i1 %cmp59, label %polly.start, label %blklab2

blklab2.loopexit:                                 ; preds = %polly.loop_exit67
  br label %blklab2

blklab2:                                          ; preds = %blklab2.loopexit, %polly.start, %entry
  %call14 = tail call i64* @copy1DArray_int64_t(i64* %call1, i64 %mul) #8
  %call.i = tail call noalias i8* @malloc(i64 32) #8
  %0 = bitcast i8* %call.i to %struct.Matrix*
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %1 = bitcast i8* %data_size1.i to i64*
  store i64 %mul, i64* %1, align 8, !tbaa !1
  %call2.i = tail call i64* @copy1DArray_int64_t(i64* %call14, i64 %mul) #8
  %data3.i = bitcast i8* %call.i to i64**
  store i64* %call2.i, i64** %data3.i, align 8, !tbaa !7
  %height4.i = getelementptr inbounds i8, i8* %call.i, i64 24
  %2 = bitcast i8* %height4.i to i64*
  store i64 %height, i64* %2, align 8, !tbaa !11
  %width5.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %3 = bitcast i8* %width5.i to i64*
  store i64 %width, i64* %3, align 8, !tbaa !10
  ret %struct.Matrix* %0

polly.start:                                      ; preds = %entry
  %4 = add nsw i64 %height, -1
  %polly.fdiv_q.shr = ashr i64 %4, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %blklab2

polly.loop_header.preheader:                      ; preds = %polly.start
  %5 = add nsw i64 %width, -1
  %polly.fdiv_q.shr63 = ashr i64 %5, 5
  %polly.loop_guard68 = icmp sgt i64 %polly.fdiv_q.shr63, -1
  %pexp.p_div_q = lshr i64 %width, 2
  %6 = add nsw i64 %pexp.p_div_q, -1
  %pexp.pdiv_r = and i64 %width, 3
  %polly.loop_guard101 = icmp eq i64 %pexp.pdiv_r, 0
  %7 = and i64 %width, -4
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit67, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit67 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard68, label %polly.loop_header65.preheader, label %polly.loop_exit67

polly.loop_header65.preheader:                    ; preds = %polly.loop_header
  %8 = shl nsw i64 %polly.indvar, 5
  %9 = sub nsw i64 %height, %8
  %10 = add nsw i64 %9, -1
  %11 = icmp slt i64 %10, 31
  %12 = select i1 %11, i64 %10, i64 31
  %polly.loop_guard77 = icmp sgt i64 %12, -1
  %polly.adjust_ub80 = add i64 %12, -1
  br label %polly.loop_header65

polly.loop_exit67.loopexit:                       ; preds = %polly.loop_exit76
  br label %polly.loop_exit67

polly.loop_exit67:                                ; preds = %polly.loop_exit67.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond147 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond147, label %blklab2.loopexit, label %polly.loop_header, !llvm.loop !12

polly.loop_header65:                              ; preds = %polly.loop_exit76, %polly.loop_header65.preheader
  %polly.indvar69 = phi i64 [ %polly.indvar_next70, %polly.loop_exit76 ], [ 0, %polly.loop_header65.preheader ]
  br i1 %polly.loop_guard77, label %polly.loop_header74.preheader, label %polly.loop_exit76

polly.loop_header74.preheader:                    ; preds = %polly.loop_header65
  %13 = mul nsw i64 %polly.indvar69, -8
  %14 = add nsw i64 %6, %13
  %15 = icmp slt i64 %14, 7
  %16 = select i1 %15, i64 %14, i64 7
  %polly.loop_guard86 = icmp sgt i64 %16, -1
  %17 = shl i64 %polly.indvar69, 5
  %18 = or i64 %17, 31
  %19 = icmp slt i64 %18, %width
  %polly.adjust_ub89 = add i64 %16, -1
  br i1 %polly.loop_guard86, label %polly.loop_header74.us.preheader, label %polly.loop_header74.preheader.split

polly.loop_header74.us.preheader:                 ; preds = %polly.loop_header74.preheader
  %brmerge = or i1 %19, %polly.loop_guard101
  br label %polly.loop_header74.us

polly.loop_header74.us:                           ; preds = %polly.loop_header74.us.preheader, %polly.merge.us
  %polly.indvar78.us = phi i64 [ %polly.indvar_next79.us, %polly.merge.us ], [ 0, %polly.loop_header74.us.preheader ]
  %20 = add nuw nsw i64 %polly.indvar78.us, %8
  %21 = mul i64 %20, %width
  %22 = add i64 %21, %17
  %23 = insertelement <2 x i64> undef, i64 %20, i32 0
  %24 = shufflevector <2 x i64> %23, <2 x i64> undef, <2 x i32> zeroinitializer
  %25 = insertelement <2 x i64> undef, i64 %20, i32 0
  %26 = shufflevector <2 x i64> %25, <2 x i64> undef, <2 x i32> zeroinitializer
  br label %polly.loop_header83.us

polly.loop_header83.us:                           ; preds = %polly.loop_header74.us, %polly.loop_header83.us
  %polly.indvar87.us = phi i64 [ %polly.indvar_next88.us, %polly.loop_header83.us ], [ 0, %polly.loop_header74.us ]
  %27 = shl i64 %polly.indvar87.us, 2
  %28 = add i64 %22, %27
  %scevgep.us = getelementptr i64, i64* %call1, i64 %28
  %29 = bitcast i64* %scevgep.us to <2 x i64>*
  %30 = load <2 x i64>, <2 x i64>* %29, align 8, !alias.scope !13, !noalias !15
  %31 = add nsw <2 x i64> %30, %24
  %32 = bitcast i64* %scevgep.us to <2 x i64>*
  store <2 x i64> %31, <2 x i64>* %32, align 8, !alias.scope !13, !noalias !15
  %33 = add i64 %28, 2
  %scevgep.us.2 = getelementptr i64, i64* %call1, i64 %33
  %34 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  %35 = load <2 x i64>, <2 x i64>* %34, align 8, !alias.scope !13, !noalias !15
  %36 = add nsw <2 x i64> %35, %26
  %37 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  store <2 x i64> %36, <2 x i64>* %37, align 8, !alias.scope !13, !noalias !15
  %polly.indvar_next88.us = add nuw nsw i64 %polly.indvar87.us, 1
  %polly.loop_cond90.us = icmp sgt i64 %polly.indvar87.us, %polly.adjust_ub89
  br i1 %polly.loop_cond90.us, label %polly.cond.loopexit.us, label %polly.loop_header83.us

polly.loop_header98.us:                           ; preds = %polly.loop_header98.us, %polly.loop_header98.preheader.us
  %polly.indvar102.us = phi i64 [ %polly.indvar_next103.us, %polly.loop_header98.us ], [ 0, %polly.loop_header98.preheader.us ]
  %38 = add i64 %39, %polly.indvar102.us
  %scevgep108.us = getelementptr i64, i64* %call1, i64 %38
  %_p_scalar_109.us = load i64, i64* %scevgep108.us, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %p_add8110.us = add nsw i64 %_p_scalar_109.us, %20
  store i64 %p_add8110.us, i64* %scevgep108.us, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next103.us = add nuw nsw i64 %polly.indvar102.us, 1
  %exitcond145 = icmp eq i64 %polly.indvar_next103.us, %pexp.pdiv_r
  br i1 %exitcond145, label %polly.merge.us.loopexit, label %polly.loop_header98.us, !llvm.loop !18

polly.merge.us.loopexit:                          ; preds = %polly.loop_header98.us
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next79.us = add nuw nsw i64 %polly.indvar78.us, 1
  %polly.loop_cond81.us = icmp sgt i64 %polly.indvar78.us, %polly.adjust_ub80
  br i1 %polly.loop_cond81.us, label %polly.loop_exit76.loopexit, label %polly.loop_header74.us

polly.loop_header98.preheader.us:                 ; preds = %polly.cond.loopexit.us
  %39 = add i64 %21, %7
  br label %polly.loop_header98.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header83.us
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header98.preheader.us

polly.loop_header74.preheader.split:              ; preds = %polly.loop_header74.preheader
  br i1 %19, label %polly.loop_exit76, label %polly.loop_header74.preheader177

polly.loop_header74.preheader177:                 ; preds = %polly.loop_header74.preheader.split
  br label %polly.loop_header74

polly.loop_exit76.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit76

polly.loop_exit76.loopexit178:                    ; preds = %polly.merge
  br label %polly.loop_exit76

polly.loop_exit76:                                ; preds = %polly.loop_exit76.loopexit178, %polly.loop_exit76.loopexit, %polly.loop_header74.preheader.split, %polly.loop_header65
  %polly.indvar_next70 = add nuw nsw i64 %polly.indvar69, 1
  %exitcond146 = icmp eq i64 %polly.indvar69, %polly.fdiv_q.shr63
  br i1 %exitcond146, label %polly.loop_exit67.loopexit, label %polly.loop_header65

polly.loop_header74:                              ; preds = %polly.loop_header74.preheader177, %polly.merge
  %polly.indvar78 = phi i64 [ %polly.indvar_next79, %polly.merge ], [ 0, %polly.loop_header74.preheader177 ]
  br i1 %polly.loop_guard101, label %polly.merge, label %polly.loop_header98.preheader

polly.merge.loopexit:                             ; preds = %polly.loop_header98
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header74
  %polly.indvar_next79 = add nuw nsw i64 %polly.indvar78, 1
  %polly.loop_cond81 = icmp sgt i64 %polly.indvar78, %polly.adjust_ub80
  br i1 %polly.loop_cond81, label %polly.loop_exit76.loopexit178, label %polly.loop_header74

polly.loop_header98.preheader:                    ; preds = %polly.loop_header74
  %40 = add nuw nsw i64 %polly.indvar78, %8
  %41 = mul i64 %40, %width
  %42 = add i64 %41, %7
  br label %polly.loop_header98

polly.loop_header98:                              ; preds = %polly.loop_header98, %polly.loop_header98.preheader
  %polly.indvar102 = phi i64 [ %polly.indvar_next103, %polly.loop_header98 ], [ 0, %polly.loop_header98.preheader ]
  %43 = add i64 %42, %polly.indvar102
  %scevgep108 = getelementptr i64, i64* %call1, i64 %43
  %_p_scalar_109 = load i64, i64* %scevgep108, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %p_add8110 = add nsw i64 %_p_scalar_109, %40
  store i64 %p_add8110, i64* %scevgep108, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next103 = add nuw nsw i64 %polly.indvar102, 1
  %exitcond = icmp eq i64 %polly.indvar_next103, %pexp.pdiv_r
  br i1 %exitcond, label %polly.merge.loopexit, label %polly.loop_header98, !llvm.loop !22
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
  %call3 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 %mul) #8
  %data_size4 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1
  %2 = load i64, i64* %data_size4, align 8, !tbaa !1
  %data5 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %3 = load i64*, i64** %data5, align 8, !tbaa !7
  %call6 = tail call i64* @copy1DArray_int64_t(i64* %3, i64 %2) #8
  %data_size7 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1
  %4 = load i64, i64* %data_size7, align 8, !tbaa !1
  %data8 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0
  %5 = load i64*, i64** %data8, align 8, !tbaa !7
  %call9 = tail call i64* @copy1DArray_int64_t(i64* %5, i64 %4) #8
  %cmp119 = icmp sgt i64 %1, 0
  br i1 %cmp119, label %polly.split_new_and_old, label %blklab13

polly.split_new_and_old:                          ; preds = %entry
  %6 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.obit = extractvalue { i64, i1 } %6, 1
  %.res = extractvalue { i64, i1 } %6, 0
  %polly.access.mul.call6 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %0)
  %polly.access.mul.call6.obit = extractvalue { i64, i1 } %polly.access.mul.call6, 1
  %polly.overflow.state124 = or i1 %.obit, %polly.access.mul.call6.obit
  %polly.access.mul.call6.res = extractvalue { i64, i1 } %polly.access.mul.call6, 0
  %polly.access.add.call6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call6.res, i64 %0)
  %polly.access.add.call6.obit = extractvalue { i64, i1 } %polly.access.add.call6, 1
  %polly.access.add.call6.res = extractvalue { i64, i1 } %polly.access.add.call6, 0
  %polly.access.call6 = getelementptr i64, i64* %call6, i64 %polly.access.add.call6.res
  %polly.overflow.state127 = or i1 %polly.overflow.state124, %polly.access.add.call6.obit
  %7 = icmp ule i64* %polly.access.call6, %call3
  %polly.access.call3139 = getelementptr i64, i64* %call3, i64 %polly.access.add.call6.res
  %8 = icmp ule i64* %polly.access.call3139, %call6
  %9 = or i1 %7, %8
  %10 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 1)
  %.obit149 = extractvalue { i64, i1 } %10, 1
  %polly.overflow.state150 = or i1 %.obit149, %polly.overflow.state127
  %.res151 = extractvalue { i64, i1 } %10, 0
  %polly.access.mul.call9 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res151, i64 %0)
  %polly.access.mul.call9.obit = extractvalue { i64, i1 } %polly.access.mul.call9, 1
  %polly.overflow.state152 = or i1 %polly.access.mul.call9.obit, %polly.overflow.state150
  %polly.access.mul.call9.res = extractvalue { i64, i1 } %polly.access.mul.call9, 0
  %polly.access.add.call9 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call9.res, i64 %0)
  %polly.access.add.call9.obit = extractvalue { i64, i1 } %polly.access.add.call9, 1
  %polly.access.add.call9.res = extractvalue { i64, i1 } %polly.access.add.call9, 0
  %polly.access.call9 = getelementptr i64, i64* %call9, i64 %polly.access.add.call9.res
  %polly.overflow.state160 = or i1 %polly.access.add.call9.obit, %polly.overflow.state152
  %11 = icmp ule i64* %polly.access.call9, %call3
  %polly.overflow.state164 = or i1 %.obit, %polly.overflow.state160
  %polly.overflow.state168 = or i1 %polly.access.mul.call6.obit, %polly.overflow.state164
  %polly.overflow.state181 = or i1 %polly.access.add.call6.obit, %polly.overflow.state168
  %12 = icmp ule i64* %polly.access.call3139, %call9
  %13 = or i1 %12, %11
  %14 = and i1 %9, %13
  %polly.rtc.overflown = xor i1 %polly.overflow.state181, true
  %polly.rtc.result = and i1 %14, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.start, label %while.cond10.preheader.preheader

while.cond10.preheader.preheader:                 ; preds = %polly.split_new_and_old
  %cmp12116 = icmp sgt i64 %0, 0
  br i1 %cmp12116, label %while.cond10.preheader.us.preheader, label %blklab13

while.cond10.preheader.us.preheader:              ; preds = %while.cond10.preheader.preheader
  %xtraiter389 = and i64 %0, 1
  %lcmp.mod390 = icmp eq i64 %xtraiter389, 0
  %15 = icmp eq i64 %0, 1
  br label %while.cond10.preheader.us

while.cond10.preheader.us:                        ; preds = %while.cond10.preheader.us.preheader, %blklab15.loopexit.us-lcssa.us.us
  %i.0120.us = phi i64 [ %add34.us, %blklab15.loopexit.us-lcssa.us.us ], [ 0, %while.cond10.preheader.us.preheader ]
  %mul20.us = mul nsw i64 %i.0120.us, %0
  %arrayidx23.us.us.prol = getelementptr inbounds i64, i64* %call6, i64 %mul20.us
  br label %while.cond15.preheader.us.us

while.cond15.preheader.us.us:                     ; preds = %while.cond10.preheader.us, %blklab17.loopexit.us.us
  %j.0117.us.us = phi i64 [ %add33.us.us, %blklab17.loopexit.us.us ], [ 0, %while.cond10.preheader.us ]
  %add.us.us = add nsw i64 %j.0117.us.us, %mul20.us
  %arrayidx.us.us = getelementptr inbounds i64, i64* %call3, i64 %add.us.us
  %.pre = load i64, i64* %arrayidx.us.us, align 8, !tbaa !8
  br i1 %lcmp.mod390, label %if.end19.us.us.prol.loopexit.unr-lcssa, label %if.end19.us.us.prol.preheader

if.end19.us.us.prol.preheader:                    ; preds = %while.cond15.preheader.us.us
  br label %if.end19.us.us.prol

if.end19.us.us.prol:                              ; preds = %if.end19.us.us.prol.preheader
  %16 = load i64, i64* %arrayidx23.us.us.prol, align 8, !tbaa !8
  %arrayidx26.us.us.prol = getelementptr inbounds i64, i64* %call9, i64 %j.0117.us.us
  %17 = load i64, i64* %arrayidx26.us.us.prol, align 8, !tbaa !8
  %mul27.us.us.prol = mul nsw i64 %17, %16
  %add28.us.us.prol = add nsw i64 %mul27.us.us.prol, %.pre
  store i64 %add28.us.us.prol, i64* %arrayidx.us.us, align 8, !tbaa !8
  br label %if.end19.us.us.prol.loopexit.unr-lcssa

if.end19.us.us.prol.loopexit.unr-lcssa:           ; preds = %while.cond15.preheader.us.us, %if.end19.us.us.prol
  %.unr.ph = phi i64 [ %add28.us.us.prol, %if.end19.us.us.prol ], [ %.pre, %while.cond15.preheader.us.us ]
  %k.0115.us.us.unr.ph = phi i64 [ 1, %if.end19.us.us.prol ], [ 0, %while.cond15.preheader.us.us ]
  br label %if.end19.us.us.prol.loopexit

if.end19.us.us.prol.loopexit:                     ; preds = %if.end19.us.us.prol.loopexit.unr-lcssa
  br i1 %15, label %blklab17.loopexit.us.us, label %while.cond15.preheader.us.us.new

while.cond15.preheader.us.us.new:                 ; preds = %if.end19.us.us.prol.loopexit
  br label %if.end19.us.us

blklab17.loopexit.us.us.unr-lcssa:                ; preds = %if.end19.us.us
  br label %blklab17.loopexit.us.us

blklab17.loopexit.us.us:                          ; preds = %if.end19.us.us.prol.loopexit, %blklab17.loopexit.us.us.unr-lcssa
  %add33.us.us = add nuw nsw i64 %j.0117.us.us, 1
  %exitcond122.us.us = icmp eq i64 %add33.us.us, %0
  br i1 %exitcond122.us.us, label %blklab15.loopexit.us-lcssa.us.us, label %while.cond15.preheader.us.us

if.end19.us.us:                                   ; preds = %if.end19.us.us, %while.cond15.preheader.us.us.new
  %18 = phi i64 [ %.unr.ph, %while.cond15.preheader.us.us.new ], [ %add28.us.us.1, %if.end19.us.us ]
  %k.0115.us.us = phi i64 [ %k.0115.us.us.unr.ph, %while.cond15.preheader.us.us.new ], [ %add32.us.us.1, %if.end19.us.us ]
  %add22.us.us = add nsw i64 %k.0115.us.us, %mul20.us
  %arrayidx23.us.us = getelementptr inbounds i64, i64* %call6, i64 %add22.us.us
  %19 = load i64, i64* %arrayidx23.us.us, align 8, !tbaa !8
  %mul24.us.us = mul nsw i64 %k.0115.us.us, %0
  %add25.us.us = add nsw i64 %mul24.us.us, %j.0117.us.us
  %arrayidx26.us.us = getelementptr inbounds i64, i64* %call9, i64 %add25.us.us
  %20 = load i64, i64* %arrayidx26.us.us, align 8, !tbaa !8
  %mul27.us.us = mul nsw i64 %20, %19
  %add28.us.us = add nsw i64 %mul27.us.us, %18
  store i64 %add28.us.us, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add32.us.us = add nuw nsw i64 %k.0115.us.us, 1
  %add22.us.us.1 = add nsw i64 %add32.us.us, %mul20.us
  %arrayidx23.us.us.1 = getelementptr inbounds i64, i64* %call6, i64 %add22.us.us.1
  %21 = load i64, i64* %arrayidx23.us.us.1, align 8, !tbaa !8
  %mul24.us.us.1 = mul nsw i64 %add32.us.us, %0
  %add25.us.us.1 = add nsw i64 %mul24.us.us.1, %j.0117.us.us
  %arrayidx26.us.us.1 = getelementptr inbounds i64, i64* %call9, i64 %add25.us.us.1
  %22 = load i64, i64* %arrayidx26.us.us.1, align 8, !tbaa !8
  %mul27.us.us.1 = mul nsw i64 %22, %21
  %add28.us.us.1 = add nsw i64 %mul27.us.us.1, %add28.us.us
  store i64 %add28.us.us.1, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add32.us.us.1 = add nsw i64 %k.0115.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %add32.us.us.1, %0
  br i1 %exitcond.us.us.1, label %blklab17.loopexit.us.us.unr-lcssa, label %if.end19.us.us

blklab15.loopexit.us-lcssa.us.us:                 ; preds = %blklab17.loopexit.us.us
  %add34.us = add nuw nsw i64 %i.0120.us, 1
  %exitcond123.us = icmp eq i64 %add34.us, %1
  br i1 %exitcond123.us, label %blklab13.loopexit386, label %while.cond10.preheader.us

blklab13.loopexit:                                ; preds = %polly.loop_exit188
  br label %blklab13

blklab13.loopexit386:                             ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %blklab13

blklab13:                                         ; preds = %blklab13.loopexit386, %blklab13.loopexit, %while.cond10.preheader.preheader, %polly.start, %entry
  %call35 = tail call i64* @copy1DArray_int64_t(i64* %call3, i64 %mul) #8
  %call.i = tail call noalias i8* @malloc(i64 32) #8
  %23 = bitcast i8* %call.i to %struct.Matrix*
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %24 = bitcast i8* %data_size1.i to i64*
  store i64 %mul, i64* %24, align 8, !tbaa !1
  %call2.i = tail call i64* @copy1DArray_int64_t(i64* %call35, i64 %mul) #8
  %data3.i = bitcast i8* %call.i to i64**
  store i64* %call2.i, i64** %data3.i, align 8, !tbaa !7
  %height4.i = getelementptr inbounds i8, i8* %call.i, i64 24
  %25 = bitcast i8* %height4.i to i64*
  store i64 %1, i64* %25, align 8, !tbaa !11
  %width5.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %26 = bitcast i8* %width5.i to i64*
  store i64 %0, i64* %26, align 8, !tbaa !10
  ret %struct.Matrix* %23

polly.start:                                      ; preds = %polly.split_new_and_old
  %27 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %27, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %blklab13

polly.loop_header.preheader:                      ; preds = %polly.start
  %28 = add nsw i64 %0, -1
  %polly.fdiv_q.shr184 = ashr i64 %28, 5
  %polly.loop_guard189 = icmp sgt i64 %polly.fdiv_q.shr184, -1
  %pexp.p_div_q = lshr i64 %28, 5
  %pexp.p_div_q219 = lshr i64 %0, 2
  %29 = add nsw i64 %pexp.p_div_q219, -1
  %pexp.pdiv_r = and i64 %0, 3
  %polly.loop_guard243 = icmp eq i64 %pexp.pdiv_r, 0
  %30 = and i64 %0, -4
  %31 = add nsw i64 %pexp.pdiv_r, -1
  %xtraiter387 = and i64 %0, 1
  %lcmp.mod388 = icmp eq i64 %xtraiter387, 0
  %32 = mul i64 %30, %0
  %33 = icmp eq i64 %31, 0
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %34 = mul i64 %30, %0
  %35 = icmp eq i64 %31, 0
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit188, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit188 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard189, label %polly.loop_header186.preheader, label %polly.loop_exit188

polly.loop_header186.preheader:                   ; preds = %polly.loop_header
  %36 = shl nsw i64 %polly.indvar, 5
  %37 = sub nsw i64 %1, %36
  %38 = add nsw i64 %37, -1
  %39 = icmp slt i64 %38, 31
  %40 = select i1 %39, i64 %38, i64 31
  %polly.loop_guard205 = icmp sgt i64 %40, -1
  %polly.adjust_ub208 = add i64 %40, -1
  br label %polly.loop_header186

polly.loop_exit188.loopexit:                      ; preds = %polly.loop_exit196
  br label %polly.loop_exit188

polly.loop_exit188:                               ; preds = %polly.loop_exit188.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond341 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond341, label %blklab13.loopexit, label %polly.loop_header, !llvm.loop !23

polly.loop_header186:                             ; preds = %polly.loop_exit196, %polly.loop_header186.preheader
  %polly.indvar190 = phi i64 [ %polly.indvar_next191, %polly.loop_exit196 ], [ 0, %polly.loop_header186.preheader ]
  %41 = shl nsw i64 %polly.indvar190, 5
  %42 = sub nsw i64 %0, %41
  %43 = add nsw i64 %42, -1
  %44 = icmp slt i64 %43, 31
  %45 = select i1 %44, i64 %43, i64 31
  %polly.loop_guard214 = icmp sgt i64 %45, -1
  %polly.adjust_ub217 = add i64 %45, -1
  br label %polly.loop_header194

polly.loop_exit196:                               ; preds = %polly.loop_exit204
  %polly.indvar_next191 = add nuw nsw i64 %polly.indvar190, 1
  %exitcond340 = icmp eq i64 %polly.indvar190, %polly.fdiv_q.shr184
  br i1 %exitcond340, label %polly.loop_exit188.loopexit, label %polly.loop_header186

polly.loop_header194:                             ; preds = %polly.loop_exit204, %polly.loop_header186
  %polly.indvar197 = phi i64 [ 0, %polly.loop_header186 ], [ %polly.indvar_next198, %polly.loop_exit204 ]
  br i1 %polly.loop_guard205, label %polly.loop_header202.preheader, label %polly.loop_exit204

polly.loop_header202.preheader:                   ; preds = %polly.loop_header194
  %46 = mul nsw i64 %polly.indvar197, -8
  %47 = add nsw i64 %29, %46
  %48 = icmp slt i64 %47, 7
  %49 = select i1 %48, i64 %47, i64 7
  %polly.loop_guard224 = icmp sgt i64 %49, -1
  %50 = shl i64 %polly.indvar197, 5
  %51 = or i64 %50, 31
  %52 = icmp slt i64 %51, %0
  %polly.adjust_ub227 = add i64 %49, -1
  %brmerge = or i1 %52, %polly.loop_guard243
  br label %polly.loop_header202

polly.loop_exit204.loopexit:                      ; preds = %polly.loop_exit213
  br label %polly.loop_exit204

polly.loop_exit204:                               ; preds = %polly.loop_exit204.loopexit, %polly.loop_header194
  %polly.indvar_next198 = add nuw nsw i64 %polly.indvar197, 1
  %exitcond339 = icmp eq i64 %polly.indvar197, %pexp.p_div_q
  br i1 %exitcond339, label %polly.loop_exit196, label %polly.loop_header194

polly.loop_header202:                             ; preds = %polly.loop_header202.preheader, %polly.loop_exit213
  %polly.indvar206 = phi i64 [ %polly.indvar_next207, %polly.loop_exit213 ], [ 0, %polly.loop_header202.preheader ]
  br i1 %polly.loop_guard214, label %polly.loop_header211.preheader, label %polly.loop_exit213

polly.loop_header211.preheader:                   ; preds = %polly.loop_header202
  %53 = add nuw nsw i64 %polly.indvar206, %36
  %54 = mul i64 %53, %0
  br i1 %polly.loop_guard224, label %polly.loop_header211.us.preheader, label %polly.loop_header211.preheader.split

polly.loop_header211.us.preheader:                ; preds = %polly.loop_header211.preheader
  %55 = add i64 %30, %54
  %scevgep252.us.prol = getelementptr i64, i64* %call6, i64 %55
  br label %polly.loop_header211.us

polly.loop_header211.us:                          ; preds = %polly.loop_header211.us.preheader, %polly.merge.us
  %polly.indvar215.us = phi i64 [ %polly.indvar_next216.us, %polly.merge.us ], [ 0, %polly.loop_header211.us.preheader ]
  %56 = add nuw nsw i64 %polly.indvar215.us, %41
  %57 = add i64 %56, %54
  %scevgep.us = getelementptr i64, i64* %call3, i64 %57
  %scevgep.promoted260.us = load i64, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.loop_header221.us

polly.loop_header221.us:                          ; preds = %polly.loop_header211.us, %polly.loop_header221.us
  %p_add28.lcssa261.us = phi i64 [ %p_add28.us.3, %polly.loop_header221.us ], [ %scevgep.promoted260.us, %polly.loop_header211.us ]
  %polly.indvar225.us = phi i64 [ %polly.indvar_next226.us, %polly.loop_header221.us ], [ 0, %polly.loop_header211.us ]
  %58 = shl i64 %polly.indvar225.us, 2
  %59 = add nuw nsw i64 %58, %50
  %60 = add i64 %59, %54
  %scevgep235.us = getelementptr i64, i64* %call6, i64 %60
  %_p_scalar_236.us = load i64, i64* %scevgep235.us, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %61 = mul i64 %59, %0
  %62 = add i64 %61, %56
  %scevgep237.us = getelementptr i64, i64* %call9, i64 %62
  %_p_scalar_238.us = load i64, i64* %scevgep237.us, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul27.us = mul nsw i64 %_p_scalar_238.us, %_p_scalar_236.us
  %p_add28.us = add nsw i64 %p_mul27.us, %p_add28.lcssa261.us
  %63 = or i64 %59, 1
  %64 = add i64 %63, %54
  %scevgep235.us.1 = getelementptr i64, i64* %call6, i64 %64
  %_p_scalar_236.us.1 = load i64, i64* %scevgep235.us.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %65 = mul i64 %63, %0
  %66 = add i64 %65, %56
  %scevgep237.us.1 = getelementptr i64, i64* %call9, i64 %66
  %_p_scalar_238.us.1 = load i64, i64* %scevgep237.us.1, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul27.us.1 = mul nsw i64 %_p_scalar_238.us.1, %_p_scalar_236.us.1
  %p_add28.us.1 = add nsw i64 %p_mul27.us.1, %p_add28.us
  %67 = or i64 %59, 2
  %68 = add i64 %67, %54
  %scevgep235.us.2 = getelementptr i64, i64* %call6, i64 %68
  %_p_scalar_236.us.2 = load i64, i64* %scevgep235.us.2, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %69 = mul i64 %67, %0
  %70 = add i64 %69, %56
  %scevgep237.us.2 = getelementptr i64, i64* %call9, i64 %70
  %_p_scalar_238.us.2 = load i64, i64* %scevgep237.us.2, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul27.us.2 = mul nsw i64 %_p_scalar_238.us.2, %_p_scalar_236.us.2
  %p_add28.us.2 = add nsw i64 %p_mul27.us.2, %p_add28.us.1
  %71 = or i64 %59, 3
  %72 = add i64 %71, %54
  %scevgep235.us.3 = getelementptr i64, i64* %call6, i64 %72
  %_p_scalar_236.us.3 = load i64, i64* %scevgep235.us.3, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %73 = mul i64 %71, %0
  %74 = add i64 %73, %56
  %scevgep237.us.3 = getelementptr i64, i64* %call9, i64 %74
  %_p_scalar_238.us.3 = load i64, i64* %scevgep237.us.3, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul27.us.3 = mul nsw i64 %_p_scalar_238.us.3, %_p_scalar_236.us.3
  %p_add28.us.3 = add nsw i64 %p_mul27.us.3, %p_add28.us.2
  %polly.indvar_next226.us = add nuw nsw i64 %polly.indvar225.us, 1
  %polly.loop_cond228.us = icmp sgt i64 %polly.indvar225.us, %polly.adjust_ub227
  br i1 %polly.loop_cond228.us, label %polly.cond.loopexit.us, label %polly.loop_header221.us

polly.loop_header240.us:                          ; preds = %polly.loop_header240.us, %polly.loop_header240.us.preheader.new
  %p_add28257262.us = phi i64 [ %p_add28257262.us.unr.ph, %polly.loop_header240.us.preheader.new ], [ %p_add28257.us.1, %polly.loop_header240.us ]
  %polly.indvar244.us = phi i64 [ %polly.indvar244.us.unr.ph, %polly.loop_header240.us.preheader.new ], [ %polly.indvar_next245.us.1, %polly.loop_header240.us ]
  %75 = add nuw nsw i64 %polly.indvar244.us, %30
  %76 = add i64 %75, %54
  %scevgep252.us = getelementptr i64, i64* %call6, i64 %76
  %_p_scalar_253.us = load i64, i64* %scevgep252.us, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %77 = mul i64 %75, %0
  %78 = add i64 %77, %56
  %scevgep254.us = getelementptr i64, i64* %call9, i64 %78
  %_p_scalar_255.us = load i64, i64* %scevgep254.us, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul27256.us = mul nsw i64 %_p_scalar_255.us, %_p_scalar_253.us
  %p_add28257.us = add nsw i64 %p_mul27256.us, %p_add28257262.us
  %polly.indvar_next245.us = add nuw nsw i64 %polly.indvar244.us, 1
  %79 = add nuw nsw i64 %polly.indvar_next245.us, %30
  %80 = add i64 %79, %54
  %scevgep252.us.1 = getelementptr i64, i64* %call6, i64 %80
  %_p_scalar_253.us.1 = load i64, i64* %scevgep252.us.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %81 = mul i64 %79, %0
  %82 = add i64 %81, %56
  %scevgep254.us.1 = getelementptr i64, i64* %call9, i64 %82
  %_p_scalar_255.us.1 = load i64, i64* %scevgep254.us.1, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul27256.us.1 = mul nsw i64 %_p_scalar_255.us.1, %_p_scalar_253.us.1
  %p_add28257.us.1 = add nsw i64 %p_mul27256.us.1, %p_add28257.us
  %polly.indvar_next245.us.1 = add nsw i64 %polly.indvar244.us, 2
  %exitcond338.1 = icmp eq i64 %polly.indvar_next245.us.1, %pexp.pdiv_r
  br i1 %exitcond338.1, label %polly.merge.loopexit.us.unr-lcssa, label %polly.loop_header240.us, !llvm.loop !35

polly.merge.us:                                   ; preds = %polly.cond.loopexit.us, %polly.merge.loopexit.us
  %polly.indvar_next216.us = add nuw nsw i64 %polly.indvar215.us, 1
  %polly.loop_cond218.us = icmp sgt i64 %polly.indvar215.us, %polly.adjust_ub217
  br i1 %polly.loop_cond218.us, label %polly.loop_exit213.loopexit, label %polly.loop_header211.us

polly.merge.loopexit.us.unr-lcssa:                ; preds = %polly.loop_header240.us
  br label %polly.merge.loopexit.us

polly.merge.loopexit.us:                          ; preds = %polly.loop_header240.us.prol.loopexit, %polly.merge.loopexit.us.unr-lcssa
  %p_add28257.us.lcssa = phi i64 [ %p_add28257.us.lcssa.unr.ph, %polly.loop_header240.us.prol.loopexit ], [ %p_add28257.us.1, %polly.merge.loopexit.us.unr-lcssa ]
  store i64 %p_add28257.us.lcssa, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header221.us
  store i64 %p_add28.us.3, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header240.us.preheader

polly.loop_header240.us.preheader:                ; preds = %polly.cond.loopexit.us
  br i1 %lcmp.mod388, label %polly.loop_header240.us.prol.loopexit.unr-lcssa, label %polly.loop_header240.us.prol.preheader

polly.loop_header240.us.prol.preheader:           ; preds = %polly.loop_header240.us.preheader
  br label %polly.loop_header240.us.prol

polly.loop_header240.us.prol:                     ; preds = %polly.loop_header240.us.prol.preheader
  %_p_scalar_253.us.prol = load i64, i64* %scevgep252.us.prol, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %83 = add i64 %32, %56
  %scevgep254.us.prol = getelementptr i64, i64* %call9, i64 %83
  %_p_scalar_255.us.prol = load i64, i64* %scevgep254.us.prol, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul27256.us.prol = mul nsw i64 %_p_scalar_255.us.prol, %_p_scalar_253.us.prol
  %p_add28257.us.prol = add nsw i64 %p_mul27256.us.prol, %p_add28.us.3
  br label %polly.loop_header240.us.prol.loopexit.unr-lcssa

polly.loop_header240.us.prol.loopexit.unr-lcssa:  ; preds = %polly.loop_header240.us.preheader, %polly.loop_header240.us.prol
  %p_add28257.us.lcssa.unr.ph = phi i64 [ %p_add28257.us.prol, %polly.loop_header240.us.prol ], [ undef, %polly.loop_header240.us.preheader ]
  %p_add28257262.us.unr.ph = phi i64 [ %p_add28257.us.prol, %polly.loop_header240.us.prol ], [ %p_add28.us.3, %polly.loop_header240.us.preheader ]
  %polly.indvar244.us.unr.ph = phi i64 [ 1, %polly.loop_header240.us.prol ], [ 0, %polly.loop_header240.us.preheader ]
  br label %polly.loop_header240.us.prol.loopexit

polly.loop_header240.us.prol.loopexit:            ; preds = %polly.loop_header240.us.prol.loopexit.unr-lcssa
  br i1 %33, label %polly.merge.loopexit.us, label %polly.loop_header240.us.preheader.new

polly.loop_header240.us.preheader.new:            ; preds = %polly.loop_header240.us.prol.loopexit
  br label %polly.loop_header240.us

polly.loop_header211.preheader.split:             ; preds = %polly.loop_header211.preheader
  br i1 %52, label %polly.loop_exit213, label %polly.loop_header211.preheader384

polly.loop_header211.preheader384:                ; preds = %polly.loop_header211.preheader.split
  %84 = add i64 %30, %54
  %scevgep252.prol = getelementptr i64, i64* %call6, i64 %84
  br label %polly.loop_header211

polly.loop_exit213.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit213

polly.loop_exit213.loopexit385:                   ; preds = %polly.merge
  br label %polly.loop_exit213

polly.loop_exit213:                               ; preds = %polly.loop_exit213.loopexit385, %polly.loop_exit213.loopexit, %polly.loop_header211.preheader.split, %polly.loop_header202
  %polly.indvar_next207 = add nuw nsw i64 %polly.indvar206, 1
  %polly.loop_cond209 = icmp sgt i64 %polly.indvar206, %polly.adjust_ub208
  br i1 %polly.loop_cond209, label %polly.loop_exit204.loopexit, label %polly.loop_header202

polly.loop_header211:                             ; preds = %polly.loop_header211.preheader384, %polly.merge
  %polly.indvar215 = phi i64 [ %polly.indvar_next216, %polly.merge ], [ 0, %polly.loop_header211.preheader384 ]
  br i1 %polly.loop_guard243, label %polly.merge, label %polly.loop_header240.preheader

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header240
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.loop_header240.prol.loopexit, %polly.merge.loopexit.unr-lcssa
  %p_add28257.lcssa = phi i64 [ %p_add28257.lcssa.unr.ph, %polly.loop_header240.prol.loopexit ], [ %p_add28257.1, %polly.merge.loopexit.unr-lcssa ]
  store i64 %p_add28257.lcssa, i64* %scevgep250, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header211
  %polly.indvar_next216 = add nuw nsw i64 %polly.indvar215, 1
  %polly.loop_cond218 = icmp sgt i64 %polly.indvar215, %polly.adjust_ub217
  br i1 %polly.loop_cond218, label %polly.loop_exit213.loopexit385, label %polly.loop_header211

polly.loop_header240.preheader:                   ; preds = %polly.loop_header211
  %85 = add nuw nsw i64 %polly.indvar215, %41
  %86 = add i64 %85, %54
  %scevgep250 = getelementptr i64, i64* %call3, i64 %86
  %scevgep250.promoted = load i64, i64* %scevgep250, align 8, !alias.scope !24, !noalias !26
  br i1 %lcmp.mod, label %polly.loop_header240.prol.loopexit.unr-lcssa, label %polly.loop_header240.prol.preheader

polly.loop_header240.prol.preheader:              ; preds = %polly.loop_header240.preheader
  br label %polly.loop_header240.prol

polly.loop_header240.prol:                        ; preds = %polly.loop_header240.prol.preheader
  %_p_scalar_253.prol = load i64, i64* %scevgep252.prol, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %87 = add i64 %34, %85
  %scevgep254.prol = getelementptr i64, i64* %call9, i64 %87
  %_p_scalar_255.prol = load i64, i64* %scevgep254.prol, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul27256.prol = mul nsw i64 %_p_scalar_255.prol, %_p_scalar_253.prol
  %p_add28257.prol = add nsw i64 %p_mul27256.prol, %scevgep250.promoted
  br label %polly.loop_header240.prol.loopexit.unr-lcssa

polly.loop_header240.prol.loopexit.unr-lcssa:     ; preds = %polly.loop_header240.preheader, %polly.loop_header240.prol
  %p_add28257.lcssa.unr.ph = phi i64 [ %p_add28257.prol, %polly.loop_header240.prol ], [ undef, %polly.loop_header240.preheader ]
  %p_add28257262.unr.ph = phi i64 [ %p_add28257.prol, %polly.loop_header240.prol ], [ %scevgep250.promoted, %polly.loop_header240.preheader ]
  %polly.indvar244.unr.ph = phi i64 [ 1, %polly.loop_header240.prol ], [ 0, %polly.loop_header240.preheader ]
  br label %polly.loop_header240.prol.loopexit

polly.loop_header240.prol.loopexit:               ; preds = %polly.loop_header240.prol.loopexit.unr-lcssa
  br i1 %35, label %polly.merge.loopexit, label %polly.loop_header240.preheader.new

polly.loop_header240.preheader.new:               ; preds = %polly.loop_header240.prol.loopexit
  br label %polly.loop_header240

polly.loop_header240:                             ; preds = %polly.loop_header240, %polly.loop_header240.preheader.new
  %p_add28257262 = phi i64 [ %p_add28257262.unr.ph, %polly.loop_header240.preheader.new ], [ %p_add28257.1, %polly.loop_header240 ]
  %polly.indvar244 = phi i64 [ %polly.indvar244.unr.ph, %polly.loop_header240.preheader.new ], [ %polly.indvar_next245.1, %polly.loop_header240 ]
  %88 = add nuw nsw i64 %polly.indvar244, %30
  %89 = add i64 %88, %54
  %scevgep252 = getelementptr i64, i64* %call6, i64 %89
  %_p_scalar_253 = load i64, i64* %scevgep252, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %90 = mul i64 %88, %0
  %91 = add i64 %90, %85
  %scevgep254 = getelementptr i64, i64* %call9, i64 %91
  %_p_scalar_255 = load i64, i64* %scevgep254, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul27256 = mul nsw i64 %_p_scalar_255, %_p_scalar_253
  %p_add28257 = add nsw i64 %p_mul27256, %p_add28257262
  %polly.indvar_next245 = add nuw nsw i64 %polly.indvar244, 1
  %92 = add nuw nsw i64 %polly.indvar_next245, %30
  %93 = add i64 %92, %54
  %scevgep252.1 = getelementptr i64, i64* %call6, i64 %93
  %_p_scalar_253.1 = load i64, i64* %scevgep252.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %94 = mul i64 %92, %0
  %95 = add i64 %94, %85
  %scevgep254.1 = getelementptr i64, i64* %call9, i64 %95
  %_p_scalar_255.1 = load i64, i64* %scevgep254.1, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul27256.1 = mul nsw i64 %_p_scalar_255.1, %_p_scalar_253.1
  %p_add28257.1 = add nsw i64 %p_mul27256.1, %p_add28257
  %polly.indvar_next245.1 = add nsw i64 %polly.indvar244, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next245.1, %pexp.pdiv_r
  br i1 %exitcond.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header240, !llvm.loop !36
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
  %3 = load i64, i64* %call1, align 8, !tbaa !8
  %call3 = call i64* @create1DArray_int64_t(i64 0, i64 7) #8
  %4 = bitcast i64* %call3 to <2 x i64>*
  store <2 x i64> <i64 115, i64 105>, <2 x i64>* %4, align 8, !tbaa !8
  %arrayidx6 = getelementptr inbounds i64, i64* %call3, i64 2
  %5 = bitcast i64* %arrayidx6 to <2 x i64>*
  store <2 x i64> <i64 122, i64 101>, <2 x i64>* %5, align 8, !tbaa !8
  %arrayidx8 = getelementptr inbounds i64, i64* %call3, i64 4
  %6 = bitcast i64* %arrayidx8 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %6, align 8, !tbaa !8
  %arrayidx10 = getelementptr inbounds i64, i64* %call3, i64 6
  store i64 32, i64* %arrayidx10, align 8, !tbaa !8
  call void @printf_s(i64* %call3, i64 7) #8
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 %3)
  %call12 = call %struct.Matrix* @_init_(i64 %3, i64 %3)
  %call13 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %call12)
  %call14 = call %struct.Matrix* @_init_(i64 %3, i64 %3)
  %call15 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %call14)
  %call18 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %call13)
  %call19 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %call15)
  %call20 = call %struct.Matrix* @_mat_mult_(%struct.Matrix* %call18, %struct.Matrix* %call19)
  %call21 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %call20)
  %call22 = call i64* @create1DArray_int64_t(i64 0, i64 27) #8
  %7 = bitcast i64* %call22 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %7, align 8, !tbaa !8
  %arrayidx25 = getelementptr inbounds i64, i64* %call22, i64 2
  %8 = bitcast i64* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %8, align 8, !tbaa !8
  %arrayidx27 = getelementptr inbounds i64, i64* %call22, i64 4
  %9 = bitcast i64* %arrayidx27 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %9, align 8, !tbaa !8
  %arrayidx29 = getelementptr inbounds i64, i64* %call22, i64 6
  %10 = bitcast i64* %arrayidx29 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %10, align 8, !tbaa !8
  %arrayidx31 = getelementptr inbounds i64, i64* %call22, i64 8
  %11 = bitcast i64* %arrayidx31 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %11, align 8, !tbaa !8
  %arrayidx33 = getelementptr inbounds i64, i64* %call22, i64 10
  %12 = bitcast i64* %arrayidx33 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %12, align 8, !tbaa !8
  %arrayidx35 = getelementptr inbounds i64, i64* %call22, i64 12
  %13 = bitcast i64* %arrayidx35 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %13, align 8, !tbaa !8
  %arrayidx37 = getelementptr inbounds i64, i64* %call22, i64 14
  %14 = bitcast i64* %arrayidx37 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %14, align 8, !tbaa !8
  %arrayidx39 = getelementptr inbounds i64, i64* %call22, i64 16
  %15 = bitcast i64* %arrayidx39 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %15, align 8, !tbaa !8
  %arrayidx41 = getelementptr inbounds i64, i64* %call22, i64 18
  %16 = bitcast i64* %arrayidx41 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %16, align 8, !tbaa !8
  %arrayidx43 = getelementptr inbounds i64, i64* %call22, i64 20
  %17 = bitcast i64* %arrayidx43 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %17, align 8, !tbaa !8
  %arrayidx45 = getelementptr inbounds i64, i64* %call22, i64 22
  %18 = bitcast i64* %arrayidx45 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %18, align 8, !tbaa !8
  %arrayidx47 = getelementptr inbounds i64, i64* %call22, i64 24
  %19 = bitcast i64* %arrayidx47 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %19, align 8, !tbaa !8
  %arrayidx49 = getelementptr inbounds i64, i64* %call22, i64 26
  store i64 32, i64* %arrayidx49, align 8, !tbaa !8
  call void @printf_s(i64* %call22, i64 27) #8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call21, i64 0, i32 0
  %20 = load i64*, i64** %data, align 8, !tbaa !7
  %add = mul i64 %3, %3
  %sub50 = add nsw i64 %add, -1
  %arrayidx51 = getelementptr inbounds i64, i64* %20, i64 %sub50
  %21 = load i64, i64* %arrayidx51, align 8, !tbaa !8
  %call52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 %21)
  %call53 = call i64* @create1DArray_int64_t(i64 0, i64 25) #8
  %22 = bitcast i64* %call53 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %22, align 8, !tbaa !8
  %arrayidx56 = getelementptr inbounds i64, i64* %call53, i64 2
  %23 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %23, align 8, !tbaa !8
  %arrayidx58 = getelementptr inbounds i64, i64* %call53, i64 4
  %24 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %24, align 8, !tbaa !8
  %arrayidx60 = getelementptr inbounds i64, i64* %call53, i64 6
  %25 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %25, align 8, !tbaa !8
  %arrayidx62 = getelementptr inbounds i64, i64* %call53, i64 8
  %26 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %26, align 8, !tbaa !8
  %arrayidx64 = getelementptr inbounds i64, i64* %call53, i64 10
  %27 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %27, align 8, !tbaa !8
  %arrayidx66 = getelementptr inbounds i64, i64* %call53, i64 12
  %28 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %28, align 8, !tbaa !8
  %arrayidx68 = getelementptr inbounds i64, i64* %call53, i64 14
  %29 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %29, align 8, !tbaa !8
  %arrayidx70 = getelementptr inbounds i64, i64* %call53, i64 16
  %30 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %30, align 8, !tbaa !8
  %arrayidx72 = getelementptr inbounds i64, i64* %call53, i64 18
  %31 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %31, align 8, !tbaa !8
  %arrayidx74 = getelementptr inbounds i64, i64* %call53, i64 20
  %32 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %32, align 8, !tbaa !8
  %arrayidx76 = getelementptr inbounds i64, i64* %call53, i64 22
  %33 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %33, align 8, !tbaa !8
  %arrayidx78 = getelementptr inbounds i64, i64* %call53, i64 24
  store i64 101, i64* %arrayidx78, align 8, !tbaa !8
  call void @println_s(i64* %call53, i64 25) #8
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
!13 = distinct !{!13, !14, !"polly.alias.scope.call1"}
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
!24 = distinct !{!24, !25, !"polly.alias.scope.call3"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27, !28}
!27 = distinct !{!27, !25, !"polly.alias.scope.call6"}
!28 = distinct !{!28, !25, !"polly.alias.scope.call9"}
!29 = !{!24, !28}
!30 = !{!23, !31}
!31 = distinct !{!31}
!32 = !{!24, !27}
!33 = !{!23, !34}
!34 = distinct !{!34}
!35 = distinct !{!35, !20, !21}
!36 = distinct !{!36, !20, !21}
