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
  %call2 = tail call i64* @copy1DArray_int64_t(i64* %data, i64 %data_size) #8
  %data3 = bitcast i8* %call to i64**
  store i64* %call2, i64** %data3, align 8, !tbaa !7
  %height4 = getelementptr inbounds i8, i8* %call, i64 24
  %2 = bitcast i8* %height4 to i64*
  store i64 %height, i64* %2, align 8, !tbaa !11
  %width5 = getelementptr inbounds i8, i8* %call, i64 16
  %3 = bitcast i8* %width5 to i64*
  store i64 %width, i64* %3, align 8, !tbaa !10
  br i1 %data_dealloc, label %if.then9, label %if.end13

if.then9:                                         ; preds = %entry
  %4 = bitcast i64* %data to i8*
  tail call void @free(i8* %4) #8
  br label %if.end13

if.end13:                                         ; preds = %entry, %if.then9
  ret %struct.Matrix* %0
}

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @_init_(i64 %width, i64 %height) local_unnamed_addr #4 {
entry:
  %mul = mul nsw i64 %height, %width
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %mul) #8
  %not.cmp = icmp eq i64* %call, null
  %call6 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 %mul) #8
  %not.cmp7 = icmp eq i64* %call6, null
  %cmp1197 = icmp sgt i64 %height, 0
  br i1 %cmp1197, label %polly.start, label %if.end28

if.end28.loopexit:                                ; preds = %polly.loop_exit105
  br label %if.end28

if.end28:                                         ; preds = %if.end28.loopexit, %polly.start, %entry
  %call29 = tail call i64* @copy1DArray_int64_t(i64* %call6, i64 %mul) #8
  %call.i = tail call noalias i8* @malloc(i64 32) #8
  %0 = bitcast i8* %call.i to %struct.Matrix*
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %1 = bitcast i8* %data_size1.i to i64*
  store i64 %mul, i64* %1, align 8, !tbaa !1
  %call2.i = tail call i64* @copy1DArray_int64_t(i64* %call29, i64 %mul) #8
  %data3.i = bitcast i8* %call.i to i64**
  store i64* %call2.i, i64** %data3.i, align 8, !tbaa !7
  %height4.i = getelementptr inbounds i8, i8* %call.i, i64 24
  %2 = bitcast i8* %height4.i to i64*
  store i64 %height, i64* %2, align 8, !tbaa !11
  %width5.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %3 = bitcast i8* %width5.i to i64*
  store i64 %width, i64* %3, align 8, !tbaa !10
  %4 = bitcast i64* %call29 to i8*
  tail call void @free(i8* %4) #8
  br i1 %not.cmp7, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end28
  %5 = bitcast i64* %call6 to i8*
  tail call void @free(i8* %5) #8
  br label %if.end40

if.end40:                                         ; preds = %if.end28, %if.then39
  br i1 %not.cmp, label %if.end43, label %if.then42

if.then42:                                        ; preds = %if.end40
  %6 = bitcast i64* %call to i8*
  tail call void @free(i8* %6) #8
  br label %if.end43

if.end43:                                         ; preds = %if.end40, %if.then42
  ret %struct.Matrix* %0

polly.start:                                      ; preds = %entry
  %7 = add nsw i64 %height, -1
  %polly.fdiv_q.shr = ashr i64 %7, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %if.end28

polly.loop_header.preheader:                      ; preds = %polly.start
  %8 = add nsw i64 %width, -1
  %polly.fdiv_q.shr101 = ashr i64 %8, 5
  %polly.loop_guard106 = icmp sgt i64 %polly.fdiv_q.shr101, -1
  %pexp.p_div_q = lshr i64 %width, 2
  %9 = add nsw i64 %pexp.p_div_q, -1
  %pexp.pdiv_r = and i64 %width, 3
  %polly.loop_guard139 = icmp eq i64 %pexp.pdiv_r, 0
  %10 = and i64 %width, -4
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit105, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit105 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard106, label %polly.loop_header103.preheader, label %polly.loop_exit105

polly.loop_header103.preheader:                   ; preds = %polly.loop_header
  %11 = shl nsw i64 %polly.indvar, 5
  %12 = sub nsw i64 %height, %11
  %13 = add nsw i64 %12, -1
  %14 = icmp slt i64 %13, 31
  %15 = select i1 %14, i64 %13, i64 31
  %polly.loop_guard115 = icmp sgt i64 %15, -1
  %polly.adjust_ub118 = add i64 %15, -1
  br label %polly.loop_header103

polly.loop_exit105.loopexit:                      ; preds = %polly.loop_exit114
  br label %polly.loop_exit105

polly.loop_exit105:                               ; preds = %polly.loop_exit105.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond185 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond185, label %if.end28.loopexit, label %polly.loop_header, !llvm.loop !12

polly.loop_header103:                             ; preds = %polly.loop_exit114, %polly.loop_header103.preheader
  %polly.indvar107 = phi i64 [ %polly.indvar_next108, %polly.loop_exit114 ], [ 0, %polly.loop_header103.preheader ]
  br i1 %polly.loop_guard115, label %polly.loop_header112.preheader, label %polly.loop_exit114

polly.loop_header112.preheader:                   ; preds = %polly.loop_header103
  %16 = mul nsw i64 %polly.indvar107, -8
  %17 = add nsw i64 %9, %16
  %18 = icmp slt i64 %17, 7
  %19 = select i1 %18, i64 %17, i64 7
  %polly.loop_guard124 = icmp sgt i64 %19, -1
  %20 = shl i64 %polly.indvar107, 5
  %21 = or i64 %20, 31
  %22 = icmp slt i64 %21, %width
  %polly.adjust_ub127 = add i64 %19, -1
  br i1 %polly.loop_guard124, label %polly.loop_header112.us.preheader, label %polly.loop_header112.preheader.split

polly.loop_header112.us.preheader:                ; preds = %polly.loop_header112.preheader
  %brmerge = or i1 %22, %polly.loop_guard139
  br label %polly.loop_header112.us

polly.loop_header112.us:                          ; preds = %polly.loop_header112.us.preheader, %polly.merge.us
  %polly.indvar116.us = phi i64 [ %polly.indvar_next117.us, %polly.merge.us ], [ 0, %polly.loop_header112.us.preheader ]
  %23 = add nuw nsw i64 %polly.indvar116.us, %11
  %24 = mul i64 %23, %width
  %25 = add i64 %24, %20
  %26 = insertelement <2 x i64> undef, i64 %23, i32 0
  %27 = shufflevector <2 x i64> %26, <2 x i64> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x i64> undef, i64 %23, i32 0
  %29 = shufflevector <2 x i64> %28, <2 x i64> undef, <2 x i32> zeroinitializer
  br label %polly.loop_header121.us

polly.loop_header121.us:                          ; preds = %polly.loop_header112.us, %polly.loop_header121.us
  %polly.indvar125.us = phi i64 [ %polly.indvar_next126.us, %polly.loop_header121.us ], [ 0, %polly.loop_header112.us ]
  %30 = shl i64 %polly.indvar125.us, 2
  %31 = add i64 %25, %30
  %scevgep.us = getelementptr i64, i64* %call6, i64 %31
  %32 = bitcast i64* %scevgep.us to <2 x i64>*
  %33 = load <2 x i64>, <2 x i64>* %32, align 8, !alias.scope !13, !noalias !15
  %34 = add nsw <2 x i64> %33, %27
  %35 = bitcast i64* %scevgep.us to <2 x i64>*
  store <2 x i64> %34, <2 x i64>* %35, align 8, !alias.scope !13, !noalias !15
  %36 = add i64 %31, 2
  %scevgep.us.2 = getelementptr i64, i64* %call6, i64 %36
  %37 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  %38 = load <2 x i64>, <2 x i64>* %37, align 8, !alias.scope !13, !noalias !15
  %39 = add nsw <2 x i64> %38, %29
  %40 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %40, align 8, !alias.scope !13, !noalias !15
  %polly.indvar_next126.us = add nuw nsw i64 %polly.indvar125.us, 1
  %polly.loop_cond128.us = icmp sgt i64 %polly.indvar125.us, %polly.adjust_ub127
  br i1 %polly.loop_cond128.us, label %polly.cond.loopexit.us, label %polly.loop_header121.us

polly.loop_header136.us:                          ; preds = %polly.loop_header136.us, %polly.loop_header136.preheader.us
  %polly.indvar140.us = phi i64 [ %polly.indvar_next141.us, %polly.loop_header136.us ], [ 0, %polly.loop_header136.preheader.us ]
  %41 = add i64 %42, %polly.indvar140.us
  %scevgep146.us = getelementptr i64, i64* %call6, i64 %41
  %_p_scalar_147.us = load i64, i64* %scevgep146.us, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %p_add20148.us = add nsw i64 %_p_scalar_147.us, %23
  store i64 %p_add20148.us, i64* %scevgep146.us, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next141.us = add nuw nsw i64 %polly.indvar140.us, 1
  %exitcond183 = icmp eq i64 %polly.indvar_next141.us, %pexp.pdiv_r
  br i1 %exitcond183, label %polly.merge.us.loopexit, label %polly.loop_header136.us, !llvm.loop !18

polly.merge.us.loopexit:                          ; preds = %polly.loop_header136.us
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next117.us = add nuw nsw i64 %polly.indvar116.us, 1
  %polly.loop_cond119.us = icmp sgt i64 %polly.indvar116.us, %polly.adjust_ub118
  br i1 %polly.loop_cond119.us, label %polly.loop_exit114.loopexit, label %polly.loop_header112.us

polly.loop_header136.preheader.us:                ; preds = %polly.cond.loopexit.us
  %42 = add i64 %24, %10
  br label %polly.loop_header136.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header121.us
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header136.preheader.us

polly.loop_header112.preheader.split:             ; preds = %polly.loop_header112.preheader
  br i1 %22, label %polly.loop_exit114, label %polly.loop_header112.preheader215

polly.loop_header112.preheader215:                ; preds = %polly.loop_header112.preheader.split
  br label %polly.loop_header112

polly.loop_exit114.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit114

polly.loop_exit114.loopexit216:                   ; preds = %polly.merge
  br label %polly.loop_exit114

polly.loop_exit114:                               ; preds = %polly.loop_exit114.loopexit216, %polly.loop_exit114.loopexit, %polly.loop_header112.preheader.split, %polly.loop_header103
  %polly.indvar_next108 = add nuw nsw i64 %polly.indvar107, 1
  %exitcond184 = icmp eq i64 %polly.indvar107, %polly.fdiv_q.shr101
  br i1 %exitcond184, label %polly.loop_exit105.loopexit, label %polly.loop_header103

polly.loop_header112:                             ; preds = %polly.loop_header112.preheader215, %polly.merge
  %polly.indvar116 = phi i64 [ %polly.indvar_next117, %polly.merge ], [ 0, %polly.loop_header112.preheader215 ]
  br i1 %polly.loop_guard139, label %polly.merge, label %polly.loop_header136.preheader

polly.merge.loopexit:                             ; preds = %polly.loop_header136
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header112
  %polly.indvar_next117 = add nuw nsw i64 %polly.indvar116, 1
  %polly.loop_cond119 = icmp sgt i64 %polly.indvar116, %polly.adjust_ub118
  br i1 %polly.loop_cond119, label %polly.loop_exit114.loopexit216, label %polly.loop_header112

polly.loop_header136.preheader:                   ; preds = %polly.loop_header112
  %43 = add nuw nsw i64 %polly.indvar116, %11
  %44 = mul i64 %43, %width
  %45 = add i64 %44, %10
  br label %polly.loop_header136

polly.loop_header136:                             ; preds = %polly.loop_header136, %polly.loop_header136.preheader
  %polly.indvar140 = phi i64 [ %polly.indvar_next141, %polly.loop_header136 ], [ 0, %polly.loop_header136.preheader ]
  %46 = add i64 %45, %polly.indvar140
  %scevgep146 = getelementptr i64, i64* %call6, i64 %46
  %_p_scalar_147 = load i64, i64* %scevgep146, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %p_add20148 = add nsw i64 %_p_scalar_147, %43
  store i64 %p_add20148, i64* %scevgep146, align 8, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next141 = add nuw nsw i64 %polly.indvar140, 1
  %exitcond = icmp eq i64 %polly.indvar_next141, %pexp.pdiv_r
  br i1 %exitcond, label %polly.merge.loopexit, label %polly.loop_header136, !llvm.loop !22
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
  %not.cmp = icmp eq i64* %call, null
  %call9 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 %mul) #8
  %not.cmp10 = icmp eq i64* %call9, null
  %data_size17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1
  %2 = load i64, i64* %data_size17, align 8, !tbaa !1
  %data18 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %3 = load i64*, i64** %data18, align 8, !tbaa !7
  %call22 = tail call i64* @copy1DArray_int64_t(i64* %3, i64 %2) #8
  %not.cmp23 = icmp eq i64* %call22, null
  %data_size30 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1
  %4 = load i64, i64* %data_size30, align 8, !tbaa !1
  %data31 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0
  %5 = load i64*, i64** %data31, align 8, !tbaa !7
  %call35 = tail call i64* @copy1DArray_int64_t(i64* %5, i64 %4) #8
  %not.cmp36 = icmp eq i64* %call35, null
  %cmp40212 = icmp sgt i64 %1, 0
  br i1 %cmp40212, label %polly.split_new_and_old, label %if.end70

polly.split_new_and_old:                          ; preds = %entry
  %6 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.obit = extractvalue { i64, i1 } %6, 1
  %.res = extractvalue { i64, i1 } %6, 0
  %polly.access.mul.call22 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %0)
  %polly.access.mul.call22.obit = extractvalue { i64, i1 } %polly.access.mul.call22, 1
  %polly.overflow.state217 = or i1 %.obit, %polly.access.mul.call22.obit
  %polly.access.mul.call22.res = extractvalue { i64, i1 } %polly.access.mul.call22, 0
  %polly.access.add.call22 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call22.res, i64 %0)
  %polly.access.add.call22.obit = extractvalue { i64, i1 } %polly.access.add.call22, 1
  %polly.access.add.call22.res = extractvalue { i64, i1 } %polly.access.add.call22, 0
  %polly.access.call22 = getelementptr i64, i64* %call22, i64 %polly.access.add.call22.res
  %polly.overflow.state220 = or i1 %polly.overflow.state217, %polly.access.add.call22.obit
  %7 = icmp ule i64* %polly.access.call22, %call9
  %polly.access.call9232 = getelementptr i64, i64* %call9, i64 %polly.access.add.call22.res
  %8 = icmp ule i64* %polly.access.call9232, %call22
  %9 = or i1 %7, %8
  %10 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 1)
  %.obit242 = extractvalue { i64, i1 } %10, 1
  %polly.overflow.state243 = or i1 %.obit242, %polly.overflow.state220
  %.res244 = extractvalue { i64, i1 } %10, 0
  %polly.access.mul.call35 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res244, i64 %0)
  %polly.access.mul.call35.obit = extractvalue { i64, i1 } %polly.access.mul.call35, 1
  %polly.overflow.state245 = or i1 %polly.access.mul.call35.obit, %polly.overflow.state243
  %polly.access.mul.call35.res = extractvalue { i64, i1 } %polly.access.mul.call35, 0
  %polly.access.add.call35 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call35.res, i64 %0)
  %polly.access.add.call35.obit = extractvalue { i64, i1 } %polly.access.add.call35, 1
  %polly.access.add.call35.res = extractvalue { i64, i1 } %polly.access.add.call35, 0
  %polly.access.call35 = getelementptr i64, i64* %call35, i64 %polly.access.add.call35.res
  %polly.overflow.state253 = or i1 %polly.access.add.call35.obit, %polly.overflow.state245
  %11 = icmp ule i64* %polly.access.call35, %call9
  %polly.overflow.state257 = or i1 %.obit, %polly.overflow.state253
  %polly.overflow.state261 = or i1 %polly.access.mul.call22.obit, %polly.overflow.state257
  %polly.overflow.state274 = or i1 %polly.access.add.call22.obit, %polly.overflow.state261
  %12 = icmp ule i64* %polly.access.call9232, %call35
  %13 = or i1 %12, %11
  %14 = and i1 %9, %13
  %polly.rtc.overflown = xor i1 %polly.overflow.state274, true
  %polly.rtc.result = and i1 %14, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.start, label %while.cond43.preheader.preheader

while.cond43.preheader.preheader:                 ; preds = %polly.split_new_and_old
  %cmp45209 = icmp sgt i64 %0, 0
  br i1 %cmp45209, label %while.cond43.preheader.us.preheader, label %if.end70

while.cond43.preheader.us.preheader:              ; preds = %while.cond43.preheader.preheader
  %xtraiter482 = and i64 %0, 1
  %lcmp.mod483 = icmp eq i64 %xtraiter482, 0
  %15 = icmp eq i64 %0, 1
  br label %while.cond43.preheader.us

while.cond43.preheader.us:                        ; preds = %while.cond43.preheader.us.preheader, %blklab15.loopexit.us-lcssa.us.us
  %i.0213.us = phi i64 [ %add67.us, %blklab15.loopexit.us-lcssa.us.us ], [ 0, %while.cond43.preheader.us.preheader ]
  %mul53.us = mul nsw i64 %i.0213.us, %0
  %arrayidx56.us.us.prol = getelementptr inbounds i64, i64* %call22, i64 %mul53.us
  br label %while.cond48.preheader.us.us

while.cond48.preheader.us.us:                     ; preds = %while.cond43.preheader.us, %blklab17.loopexit.us.us
  %j.0210.us.us = phi i64 [ %add66.us.us, %blklab17.loopexit.us.us ], [ 0, %while.cond43.preheader.us ]
  %add.us.us = add nsw i64 %j.0210.us.us, %mul53.us
  %arrayidx.us.us = getelementptr inbounds i64, i64* %call9, i64 %add.us.us
  %.pre = load i64, i64* %arrayidx.us.us, align 8, !tbaa !8
  br i1 %lcmp.mod483, label %if.end52.us.us.prol.loopexit.unr-lcssa, label %if.end52.us.us.prol.preheader

if.end52.us.us.prol.preheader:                    ; preds = %while.cond48.preheader.us.us
  br label %if.end52.us.us.prol

if.end52.us.us.prol:                              ; preds = %if.end52.us.us.prol.preheader
  %16 = load i64, i64* %arrayidx56.us.us.prol, align 8, !tbaa !8
  %arrayidx59.us.us.prol = getelementptr inbounds i64, i64* %call35, i64 %j.0210.us.us
  %17 = load i64, i64* %arrayidx59.us.us.prol, align 8, !tbaa !8
  %mul60.us.us.prol = mul nsw i64 %17, %16
  %add61.us.us.prol = add nsw i64 %mul60.us.us.prol, %.pre
  store i64 %add61.us.us.prol, i64* %arrayidx.us.us, align 8, !tbaa !8
  br label %if.end52.us.us.prol.loopexit.unr-lcssa

if.end52.us.us.prol.loopexit.unr-lcssa:           ; preds = %while.cond48.preheader.us.us, %if.end52.us.us.prol
  %.unr.ph = phi i64 [ %add61.us.us.prol, %if.end52.us.us.prol ], [ %.pre, %while.cond48.preheader.us.us ]
  %k.0208.us.us.unr.ph = phi i64 [ 1, %if.end52.us.us.prol ], [ 0, %while.cond48.preheader.us.us ]
  br label %if.end52.us.us.prol.loopexit

if.end52.us.us.prol.loopexit:                     ; preds = %if.end52.us.us.prol.loopexit.unr-lcssa
  br i1 %15, label %blklab17.loopexit.us.us, label %while.cond48.preheader.us.us.new

while.cond48.preheader.us.us.new:                 ; preds = %if.end52.us.us.prol.loopexit
  br label %if.end52.us.us

blklab17.loopexit.us.us.unr-lcssa:                ; preds = %if.end52.us.us
  br label %blklab17.loopexit.us.us

blklab17.loopexit.us.us:                          ; preds = %if.end52.us.us.prol.loopexit, %blklab17.loopexit.us.us.unr-lcssa
  %add66.us.us = add nuw nsw i64 %j.0210.us.us, 1
  %exitcond215.us.us = icmp eq i64 %add66.us.us, %0
  br i1 %exitcond215.us.us, label %blklab15.loopexit.us-lcssa.us.us, label %while.cond48.preheader.us.us

if.end52.us.us:                                   ; preds = %if.end52.us.us, %while.cond48.preheader.us.us.new
  %18 = phi i64 [ %.unr.ph, %while.cond48.preheader.us.us.new ], [ %add61.us.us.1, %if.end52.us.us ]
  %k.0208.us.us = phi i64 [ %k.0208.us.us.unr.ph, %while.cond48.preheader.us.us.new ], [ %add65.us.us.1, %if.end52.us.us ]
  %add55.us.us = add nsw i64 %k.0208.us.us, %mul53.us
  %arrayidx56.us.us = getelementptr inbounds i64, i64* %call22, i64 %add55.us.us
  %19 = load i64, i64* %arrayidx56.us.us, align 8, !tbaa !8
  %mul57.us.us = mul nsw i64 %k.0208.us.us, %0
  %add58.us.us = add nsw i64 %mul57.us.us, %j.0210.us.us
  %arrayidx59.us.us = getelementptr inbounds i64, i64* %call35, i64 %add58.us.us
  %20 = load i64, i64* %arrayidx59.us.us, align 8, !tbaa !8
  %mul60.us.us = mul nsw i64 %20, %19
  %add61.us.us = add nsw i64 %mul60.us.us, %18
  store i64 %add61.us.us, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add65.us.us = add nuw nsw i64 %k.0208.us.us, 1
  %add55.us.us.1 = add nsw i64 %add65.us.us, %mul53.us
  %arrayidx56.us.us.1 = getelementptr inbounds i64, i64* %call22, i64 %add55.us.us.1
  %21 = load i64, i64* %arrayidx56.us.us.1, align 8, !tbaa !8
  %mul57.us.us.1 = mul nsw i64 %add65.us.us, %0
  %add58.us.us.1 = add nsw i64 %mul57.us.us.1, %j.0210.us.us
  %arrayidx59.us.us.1 = getelementptr inbounds i64, i64* %call35, i64 %add58.us.us.1
  %22 = load i64, i64* %arrayidx59.us.us.1, align 8, !tbaa !8
  %mul60.us.us.1 = mul nsw i64 %22, %21
  %add61.us.us.1 = add nsw i64 %mul60.us.us.1, %add61.us.us
  store i64 %add61.us.us.1, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add65.us.us.1 = add nsw i64 %k.0208.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %add65.us.us.1, %0
  br i1 %exitcond.us.us.1, label %blklab17.loopexit.us.us.unr-lcssa, label %if.end52.us.us

blklab15.loopexit.us-lcssa.us.us:                 ; preds = %blklab17.loopexit.us.us
  %add67.us = add nuw nsw i64 %i.0213.us, 1
  %exitcond216.us = icmp eq i64 %add67.us, %1
  br i1 %exitcond216.us, label %if.end70.loopexit479, label %while.cond43.preheader.us

if.end70.loopexit:                                ; preds = %polly.loop_exit281
  br label %if.end70

if.end70.loopexit479:                             ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %if.end70

if.end70:                                         ; preds = %if.end70.loopexit479, %if.end70.loopexit, %while.cond43.preheader.preheader, %polly.start, %entry
  %call71 = tail call i64* @copy1DArray_int64_t(i64* %call9, i64 %mul) #8
  %call.i = tail call noalias i8* @malloc(i64 32) #8
  %23 = bitcast i8* %call.i to %struct.Matrix*
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %24 = bitcast i8* %data_size1.i to i64*
  store i64 %mul, i64* %24, align 8, !tbaa !1
  %call2.i = tail call i64* @copy1DArray_int64_t(i64* %call71, i64 %mul) #8
  %data3.i = bitcast i8* %call.i to i64**
  store i64* %call2.i, i64** %data3.i, align 8, !tbaa !7
  %height4.i = getelementptr inbounds i8, i8* %call.i, i64 24
  %25 = bitcast i8* %height4.i to i64*
  store i64 %1, i64* %25, align 8, !tbaa !11
  %width5.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %26 = bitcast i8* %width5.i to i64*
  store i64 %0, i64* %26, align 8, !tbaa !10
  %27 = bitcast i64* %call71 to i8*
  tail call void @free(i8* %27) #8
  br i1 %a_dealloc, label %if.then78, label %if.end79

if.then78:                                        ; preds = %if.end70
  %28 = bitcast %struct.Matrix* %a to i8**
  %29 = load i8*, i8** %28, align 8, !tbaa !7
  tail call void @free(i8* %29) #8
  %30 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %30) #8
  br label %if.end79

if.end79:                                         ; preds = %if.then78, %if.end70
  br i1 %b_dealloc, label %if.then81, label %if.end85

if.then81:                                        ; preds = %if.end79
  %31 = bitcast %struct.Matrix* %b to i8**
  %32 = load i8*, i8** %31, align 8, !tbaa !7
  tail call void @free(i8* %32) #8
  %33 = bitcast %struct.Matrix* %b to i8*
  tail call void @free(i8* %33) #8
  br label %if.end85

if.end85:                                         ; preds = %if.end79, %if.then81
  br i1 %not.cmp10, label %if.end88, label %if.then87

if.then87:                                        ; preds = %if.end85
  %34 = bitcast i64* %call9 to i8*
  tail call void @free(i8* %34) #8
  br label %if.end88

if.end88:                                         ; preds = %if.end85, %if.then87
  br i1 %not.cmp23, label %if.end91, label %if.then90

if.then90:                                        ; preds = %if.end88
  %35 = bitcast i64* %call22 to i8*
  tail call void @free(i8* %35) #8
  br label %if.end91

if.end91:                                         ; preds = %if.end88, %if.then90
  br i1 %not.cmp36, label %if.end94, label %if.then93

if.then93:                                        ; preds = %if.end91
  %36 = bitcast i64* %call35 to i8*
  tail call void @free(i8* %36) #8
  br label %if.end94

if.end94:                                         ; preds = %if.end91, %if.then93
  br i1 %not.cmp, label %if.end103, label %if.then96

if.then96:                                        ; preds = %if.end94
  %37 = bitcast i64* %call to i8*
  tail call void @free(i8* %37) #8
  br label %if.end103

if.end103:                                        ; preds = %if.end94, %if.then96
  ret %struct.Matrix* %23

polly.start:                                      ; preds = %polly.split_new_and_old
  %38 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %38, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %if.end70

polly.loop_header.preheader:                      ; preds = %polly.start
  %39 = add nsw i64 %0, -1
  %polly.fdiv_q.shr277 = ashr i64 %39, 5
  %polly.loop_guard282 = icmp sgt i64 %polly.fdiv_q.shr277, -1
  %pexp.p_div_q = lshr i64 %39, 5
  %pexp.p_div_q312 = lshr i64 %0, 2
  %40 = add nsw i64 %pexp.p_div_q312, -1
  %pexp.pdiv_r = and i64 %0, 3
  %polly.loop_guard336 = icmp eq i64 %pexp.pdiv_r, 0
  %41 = and i64 %0, -4
  %42 = add nsw i64 %pexp.pdiv_r, -1
  %xtraiter480 = and i64 %0, 1
  %lcmp.mod481 = icmp eq i64 %xtraiter480, 0
  %43 = mul i64 %41, %0
  %44 = icmp eq i64 %42, 0
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %45 = mul i64 %41, %0
  %46 = icmp eq i64 %42, 0
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit281, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit281 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard282, label %polly.loop_header279.preheader, label %polly.loop_exit281

polly.loop_header279.preheader:                   ; preds = %polly.loop_header
  %47 = shl nsw i64 %polly.indvar, 5
  %48 = sub nsw i64 %1, %47
  %49 = add nsw i64 %48, -1
  %50 = icmp slt i64 %49, 31
  %51 = select i1 %50, i64 %49, i64 31
  %polly.loop_guard298 = icmp sgt i64 %51, -1
  %polly.adjust_ub301 = add i64 %51, -1
  br label %polly.loop_header279

polly.loop_exit281.loopexit:                      ; preds = %polly.loop_exit289
  br label %polly.loop_exit281

polly.loop_exit281:                               ; preds = %polly.loop_exit281.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond434 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond434, label %if.end70.loopexit, label %polly.loop_header, !llvm.loop !23

polly.loop_header279:                             ; preds = %polly.loop_exit289, %polly.loop_header279.preheader
  %polly.indvar283 = phi i64 [ %polly.indvar_next284, %polly.loop_exit289 ], [ 0, %polly.loop_header279.preheader ]
  %52 = shl nsw i64 %polly.indvar283, 5
  %53 = sub nsw i64 %0, %52
  %54 = add nsw i64 %53, -1
  %55 = icmp slt i64 %54, 31
  %56 = select i1 %55, i64 %54, i64 31
  %polly.loop_guard307 = icmp sgt i64 %56, -1
  %polly.adjust_ub310 = add i64 %56, -1
  br label %polly.loop_header287

polly.loop_exit289:                               ; preds = %polly.loop_exit297
  %polly.indvar_next284 = add nuw nsw i64 %polly.indvar283, 1
  %exitcond433 = icmp eq i64 %polly.indvar283, %polly.fdiv_q.shr277
  br i1 %exitcond433, label %polly.loop_exit281.loopexit, label %polly.loop_header279

polly.loop_header287:                             ; preds = %polly.loop_exit297, %polly.loop_header279
  %polly.indvar290 = phi i64 [ 0, %polly.loop_header279 ], [ %polly.indvar_next291, %polly.loop_exit297 ]
  br i1 %polly.loop_guard298, label %polly.loop_header295.preheader, label %polly.loop_exit297

polly.loop_header295.preheader:                   ; preds = %polly.loop_header287
  %57 = mul nsw i64 %polly.indvar290, -8
  %58 = add nsw i64 %40, %57
  %59 = icmp slt i64 %58, 7
  %60 = select i1 %59, i64 %58, i64 7
  %polly.loop_guard317 = icmp sgt i64 %60, -1
  %61 = shl i64 %polly.indvar290, 5
  %62 = or i64 %61, 31
  %63 = icmp slt i64 %62, %0
  %polly.adjust_ub320 = add i64 %60, -1
  %brmerge = or i1 %63, %polly.loop_guard336
  br label %polly.loop_header295

polly.loop_exit297.loopexit:                      ; preds = %polly.loop_exit306
  br label %polly.loop_exit297

polly.loop_exit297:                               ; preds = %polly.loop_exit297.loopexit, %polly.loop_header287
  %polly.indvar_next291 = add nuw nsw i64 %polly.indvar290, 1
  %exitcond432 = icmp eq i64 %polly.indvar290, %pexp.p_div_q
  br i1 %exitcond432, label %polly.loop_exit289, label %polly.loop_header287

polly.loop_header295:                             ; preds = %polly.loop_header295.preheader, %polly.loop_exit306
  %polly.indvar299 = phi i64 [ %polly.indvar_next300, %polly.loop_exit306 ], [ 0, %polly.loop_header295.preheader ]
  br i1 %polly.loop_guard307, label %polly.loop_header304.preheader, label %polly.loop_exit306

polly.loop_header304.preheader:                   ; preds = %polly.loop_header295
  %64 = add nuw nsw i64 %polly.indvar299, %47
  %65 = mul i64 %64, %0
  br i1 %polly.loop_guard317, label %polly.loop_header304.us.preheader, label %polly.loop_header304.preheader.split

polly.loop_header304.us.preheader:                ; preds = %polly.loop_header304.preheader
  %66 = add i64 %41, %65
  %scevgep345.us.prol = getelementptr i64, i64* %call22, i64 %66
  br label %polly.loop_header304.us

polly.loop_header304.us:                          ; preds = %polly.loop_header304.us.preheader, %polly.merge.us
  %polly.indvar308.us = phi i64 [ %polly.indvar_next309.us, %polly.merge.us ], [ 0, %polly.loop_header304.us.preheader ]
  %67 = add nuw nsw i64 %polly.indvar308.us, %52
  %68 = add i64 %67, %65
  %scevgep.us = getelementptr i64, i64* %call9, i64 %68
  %scevgep.promoted353.us = load i64, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.loop_header314.us

polly.loop_header314.us:                          ; preds = %polly.loop_header304.us, %polly.loop_header314.us
  %p_add61.lcssa354.us = phi i64 [ %p_add61.us.3, %polly.loop_header314.us ], [ %scevgep.promoted353.us, %polly.loop_header304.us ]
  %polly.indvar318.us = phi i64 [ %polly.indvar_next319.us, %polly.loop_header314.us ], [ 0, %polly.loop_header304.us ]
  %69 = shl i64 %polly.indvar318.us, 2
  %70 = add nuw nsw i64 %69, %61
  %71 = add i64 %70, %65
  %scevgep328.us = getelementptr i64, i64* %call22, i64 %71
  %_p_scalar_329.us = load i64, i64* %scevgep328.us, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %72 = mul i64 %70, %0
  %73 = add i64 %72, %67
  %scevgep330.us = getelementptr i64, i64* %call35, i64 %73
  %_p_scalar_331.us = load i64, i64* %scevgep330.us, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul60.us = mul nsw i64 %_p_scalar_331.us, %_p_scalar_329.us
  %p_add61.us = add nsw i64 %p_mul60.us, %p_add61.lcssa354.us
  %74 = or i64 %70, 1
  %75 = add i64 %74, %65
  %scevgep328.us.1 = getelementptr i64, i64* %call22, i64 %75
  %_p_scalar_329.us.1 = load i64, i64* %scevgep328.us.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %76 = mul i64 %74, %0
  %77 = add i64 %76, %67
  %scevgep330.us.1 = getelementptr i64, i64* %call35, i64 %77
  %_p_scalar_331.us.1 = load i64, i64* %scevgep330.us.1, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul60.us.1 = mul nsw i64 %_p_scalar_331.us.1, %_p_scalar_329.us.1
  %p_add61.us.1 = add nsw i64 %p_mul60.us.1, %p_add61.us
  %78 = or i64 %70, 2
  %79 = add i64 %78, %65
  %scevgep328.us.2 = getelementptr i64, i64* %call22, i64 %79
  %_p_scalar_329.us.2 = load i64, i64* %scevgep328.us.2, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %80 = mul i64 %78, %0
  %81 = add i64 %80, %67
  %scevgep330.us.2 = getelementptr i64, i64* %call35, i64 %81
  %_p_scalar_331.us.2 = load i64, i64* %scevgep330.us.2, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul60.us.2 = mul nsw i64 %_p_scalar_331.us.2, %_p_scalar_329.us.2
  %p_add61.us.2 = add nsw i64 %p_mul60.us.2, %p_add61.us.1
  %82 = or i64 %70, 3
  %83 = add i64 %82, %65
  %scevgep328.us.3 = getelementptr i64, i64* %call22, i64 %83
  %_p_scalar_329.us.3 = load i64, i64* %scevgep328.us.3, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %84 = mul i64 %82, %0
  %85 = add i64 %84, %67
  %scevgep330.us.3 = getelementptr i64, i64* %call35, i64 %85
  %_p_scalar_331.us.3 = load i64, i64* %scevgep330.us.3, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !30
  %p_mul60.us.3 = mul nsw i64 %_p_scalar_331.us.3, %_p_scalar_329.us.3
  %p_add61.us.3 = add nsw i64 %p_mul60.us.3, %p_add61.us.2
  %polly.indvar_next319.us = add nuw nsw i64 %polly.indvar318.us, 1
  %polly.loop_cond321.us = icmp sgt i64 %polly.indvar318.us, %polly.adjust_ub320
  br i1 %polly.loop_cond321.us, label %polly.cond.loopexit.us, label %polly.loop_header314.us

polly.loop_header333.us:                          ; preds = %polly.loop_header333.us, %polly.loop_header333.us.preheader.new
  %p_add61350355.us = phi i64 [ %p_add61350355.us.unr.ph, %polly.loop_header333.us.preheader.new ], [ %p_add61350.us.1, %polly.loop_header333.us ]
  %polly.indvar337.us = phi i64 [ %polly.indvar337.us.unr.ph, %polly.loop_header333.us.preheader.new ], [ %polly.indvar_next338.us.1, %polly.loop_header333.us ]
  %86 = add nuw nsw i64 %polly.indvar337.us, %41
  %87 = add i64 %86, %65
  %scevgep345.us = getelementptr i64, i64* %call22, i64 %87
  %_p_scalar_346.us = load i64, i64* %scevgep345.us, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %88 = mul i64 %86, %0
  %89 = add i64 %88, %67
  %scevgep347.us = getelementptr i64, i64* %call35, i64 %89
  %_p_scalar_348.us = load i64, i64* %scevgep347.us, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul60349.us = mul nsw i64 %_p_scalar_348.us, %_p_scalar_346.us
  %p_add61350.us = add nsw i64 %p_mul60349.us, %p_add61350355.us
  %polly.indvar_next338.us = add nuw nsw i64 %polly.indvar337.us, 1
  %90 = add nuw nsw i64 %polly.indvar_next338.us, %41
  %91 = add i64 %90, %65
  %scevgep345.us.1 = getelementptr i64, i64* %call22, i64 %91
  %_p_scalar_346.us.1 = load i64, i64* %scevgep345.us.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %92 = mul i64 %90, %0
  %93 = add i64 %92, %67
  %scevgep347.us.1 = getelementptr i64, i64* %call35, i64 %93
  %_p_scalar_348.us.1 = load i64, i64* %scevgep347.us.1, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul60349.us.1 = mul nsw i64 %_p_scalar_348.us.1, %_p_scalar_346.us.1
  %p_add61350.us.1 = add nsw i64 %p_mul60349.us.1, %p_add61350.us
  %polly.indvar_next338.us.1 = add nsw i64 %polly.indvar337.us, 2
  %exitcond431.1 = icmp eq i64 %polly.indvar_next338.us.1, %pexp.pdiv_r
  br i1 %exitcond431.1, label %polly.merge.loopexit.us.unr-lcssa, label %polly.loop_header333.us, !llvm.loop !35

polly.merge.us:                                   ; preds = %polly.cond.loopexit.us, %polly.merge.loopexit.us
  %polly.indvar_next309.us = add nuw nsw i64 %polly.indvar308.us, 1
  %polly.loop_cond311.us = icmp sgt i64 %polly.indvar308.us, %polly.adjust_ub310
  br i1 %polly.loop_cond311.us, label %polly.loop_exit306.loopexit, label %polly.loop_header304.us

polly.merge.loopexit.us.unr-lcssa:                ; preds = %polly.loop_header333.us
  br label %polly.merge.loopexit.us

polly.merge.loopexit.us:                          ; preds = %polly.loop_header333.us.prol.loopexit, %polly.merge.loopexit.us.unr-lcssa
  %p_add61350.us.lcssa = phi i64 [ %p_add61350.us.lcssa.unr.ph, %polly.loop_header333.us.prol.loopexit ], [ %p_add61350.us.1, %polly.merge.loopexit.us.unr-lcssa ]
  store i64 %p_add61350.us.lcssa, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header314.us
  store i64 %p_add61.us.3, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header333.us.preheader

polly.loop_header333.us.preheader:                ; preds = %polly.cond.loopexit.us
  br i1 %lcmp.mod481, label %polly.loop_header333.us.prol.loopexit.unr-lcssa, label %polly.loop_header333.us.prol.preheader

polly.loop_header333.us.prol.preheader:           ; preds = %polly.loop_header333.us.preheader
  br label %polly.loop_header333.us.prol

polly.loop_header333.us.prol:                     ; preds = %polly.loop_header333.us.prol.preheader
  %_p_scalar_346.us.prol = load i64, i64* %scevgep345.us.prol, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %94 = add i64 %43, %67
  %scevgep347.us.prol = getelementptr i64, i64* %call35, i64 %94
  %_p_scalar_348.us.prol = load i64, i64* %scevgep347.us.prol, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul60349.us.prol = mul nsw i64 %_p_scalar_348.us.prol, %_p_scalar_346.us.prol
  %p_add61350.us.prol = add nsw i64 %p_mul60349.us.prol, %p_add61.us.3
  br label %polly.loop_header333.us.prol.loopexit.unr-lcssa

polly.loop_header333.us.prol.loopexit.unr-lcssa:  ; preds = %polly.loop_header333.us.preheader, %polly.loop_header333.us.prol
  %p_add61350.us.lcssa.unr.ph = phi i64 [ %p_add61350.us.prol, %polly.loop_header333.us.prol ], [ undef, %polly.loop_header333.us.preheader ]
  %p_add61350355.us.unr.ph = phi i64 [ %p_add61350.us.prol, %polly.loop_header333.us.prol ], [ %p_add61.us.3, %polly.loop_header333.us.preheader ]
  %polly.indvar337.us.unr.ph = phi i64 [ 1, %polly.loop_header333.us.prol ], [ 0, %polly.loop_header333.us.preheader ]
  br label %polly.loop_header333.us.prol.loopexit

polly.loop_header333.us.prol.loopexit:            ; preds = %polly.loop_header333.us.prol.loopexit.unr-lcssa
  br i1 %44, label %polly.merge.loopexit.us, label %polly.loop_header333.us.preheader.new

polly.loop_header333.us.preheader.new:            ; preds = %polly.loop_header333.us.prol.loopexit
  br label %polly.loop_header333.us

polly.loop_header304.preheader.split:             ; preds = %polly.loop_header304.preheader
  br i1 %63, label %polly.loop_exit306, label %polly.loop_header304.preheader477

polly.loop_header304.preheader477:                ; preds = %polly.loop_header304.preheader.split
  %95 = add i64 %41, %65
  %scevgep345.prol = getelementptr i64, i64* %call22, i64 %95
  br label %polly.loop_header304

polly.loop_exit306.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit306

polly.loop_exit306.loopexit478:                   ; preds = %polly.merge
  br label %polly.loop_exit306

polly.loop_exit306:                               ; preds = %polly.loop_exit306.loopexit478, %polly.loop_exit306.loopexit, %polly.loop_header304.preheader.split, %polly.loop_header295
  %polly.indvar_next300 = add nuw nsw i64 %polly.indvar299, 1
  %polly.loop_cond302 = icmp sgt i64 %polly.indvar299, %polly.adjust_ub301
  br i1 %polly.loop_cond302, label %polly.loop_exit297.loopexit, label %polly.loop_header295

polly.loop_header304:                             ; preds = %polly.loop_header304.preheader477, %polly.merge
  %polly.indvar308 = phi i64 [ %polly.indvar_next309, %polly.merge ], [ 0, %polly.loop_header304.preheader477 ]
  br i1 %polly.loop_guard336, label %polly.merge, label %polly.loop_header333.preheader

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header333
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.loop_header333.prol.loopexit, %polly.merge.loopexit.unr-lcssa
  %p_add61350.lcssa = phi i64 [ %p_add61350.lcssa.unr.ph, %polly.loop_header333.prol.loopexit ], [ %p_add61350.1, %polly.merge.loopexit.unr-lcssa ]
  store i64 %p_add61350.lcssa, i64* %scevgep343, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header304
  %polly.indvar_next309 = add nuw nsw i64 %polly.indvar308, 1
  %polly.loop_cond311 = icmp sgt i64 %polly.indvar308, %polly.adjust_ub310
  br i1 %polly.loop_cond311, label %polly.loop_exit306.loopexit478, label %polly.loop_header304

polly.loop_header333.preheader:                   ; preds = %polly.loop_header304
  %96 = add nuw nsw i64 %polly.indvar308, %52
  %97 = add i64 %96, %65
  %scevgep343 = getelementptr i64, i64* %call9, i64 %97
  %scevgep343.promoted = load i64, i64* %scevgep343, align 8, !alias.scope !24, !noalias !26
  br i1 %lcmp.mod, label %polly.loop_header333.prol.loopexit.unr-lcssa, label %polly.loop_header333.prol.preheader

polly.loop_header333.prol.preheader:              ; preds = %polly.loop_header333.preheader
  br label %polly.loop_header333.prol

polly.loop_header333.prol:                        ; preds = %polly.loop_header333.prol.preheader
  %_p_scalar_346.prol = load i64, i64* %scevgep345.prol, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %98 = add i64 %45, %96
  %scevgep347.prol = getelementptr i64, i64* %call35, i64 %98
  %_p_scalar_348.prol = load i64, i64* %scevgep347.prol, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul60349.prol = mul nsw i64 %_p_scalar_348.prol, %_p_scalar_346.prol
  %p_add61350.prol = add nsw i64 %p_mul60349.prol, %scevgep343.promoted
  br label %polly.loop_header333.prol.loopexit.unr-lcssa

polly.loop_header333.prol.loopexit.unr-lcssa:     ; preds = %polly.loop_header333.preheader, %polly.loop_header333.prol
  %p_add61350.lcssa.unr.ph = phi i64 [ %p_add61350.prol, %polly.loop_header333.prol ], [ undef, %polly.loop_header333.preheader ]
  %p_add61350355.unr.ph = phi i64 [ %p_add61350.prol, %polly.loop_header333.prol ], [ %scevgep343.promoted, %polly.loop_header333.preheader ]
  %polly.indvar337.unr.ph = phi i64 [ 1, %polly.loop_header333.prol ], [ 0, %polly.loop_header333.preheader ]
  br label %polly.loop_header333.prol.loopexit

polly.loop_header333.prol.loopexit:               ; preds = %polly.loop_header333.prol.loopexit.unr-lcssa
  br i1 %46, label %polly.merge.loopexit, label %polly.loop_header333.preheader.new

polly.loop_header333.preheader.new:               ; preds = %polly.loop_header333.prol.loopexit
  br label %polly.loop_header333

polly.loop_header333:                             ; preds = %polly.loop_header333, %polly.loop_header333.preheader.new
  %p_add61350355 = phi i64 [ %p_add61350355.unr.ph, %polly.loop_header333.preheader.new ], [ %p_add61350.1, %polly.loop_header333 ]
  %polly.indvar337 = phi i64 [ %polly.indvar337.unr.ph, %polly.loop_header333.preheader.new ], [ %polly.indvar_next338.1, %polly.loop_header333 ]
  %99 = add nuw nsw i64 %polly.indvar337, %41
  %100 = add i64 %99, %65
  %scevgep345 = getelementptr i64, i64* %call22, i64 %100
  %_p_scalar_346 = load i64, i64* %scevgep345, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %101 = mul i64 %99, %0
  %102 = add i64 %101, %96
  %scevgep347 = getelementptr i64, i64* %call35, i64 %102
  %_p_scalar_348 = load i64, i64* %scevgep347, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul60349 = mul nsw i64 %_p_scalar_348, %_p_scalar_346
  %p_add61350 = add nsw i64 %p_mul60349, %p_add61350355
  %polly.indvar_next338 = add nuw nsw i64 %polly.indvar337, 1
  %103 = add nuw nsw i64 %polly.indvar_next338, %41
  %104 = add i64 %103, %65
  %scevgep345.1 = getelementptr i64, i64* %call22, i64 %104
  %_p_scalar_346.1 = load i64, i64* %scevgep345.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !33
  %105 = mul i64 %103, %0
  %106 = add i64 %105, %96
  %scevgep347.1 = getelementptr i64, i64* %call35, i64 %106
  %_p_scalar_348.1 = load i64, i64* %scevgep347.1, align 8, !alias.scope !28, !noalias !32, !llvm.mem.parallel_loop_access !33
  %p_mul60349.1 = mul nsw i64 %_p_scalar_348.1, %_p_scalar_346.1
  %p_add61350.1 = add nsw i64 %p_mul60349.1, %p_add61350
  %polly.indvar_next338.1 = add nsw i64 %polly.indvar337, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next338.1, %pexp.pdiv_r
  br i1 %exitcond.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header333, !llvm.loop !36
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
  %3 = load i64, i64* %call3, align 8, !tbaa !8
  %call22 = call i64* @create1DArray_int64_t(i64 0, i64 7) #8
  %4 = bitcast i64* %call22 to <2 x i64>*
  store <2 x i64> <i64 115, i64 105>, <2 x i64>* %4, align 8, !tbaa !8
  %arrayidx25 = getelementptr inbounds i64, i64* %call22, i64 2
  %5 = bitcast i64* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 122, i64 101>, <2 x i64>* %5, align 8, !tbaa !8
  %arrayidx27 = getelementptr inbounds i64, i64* %call22, i64 4
  %6 = bitcast i64* %arrayidx27 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %6, align 8, !tbaa !8
  %arrayidx29 = getelementptr inbounds i64, i64* %call22, i64 6
  store i64 32, i64* %arrayidx29, align 8, !tbaa !8
  %not.cmp30 = icmp eq i64* %call22, null
  call void @printf_s(i64* %call22, i64 7) #8
  %call34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 %3)
  %call38 = call %struct.Matrix* @_init_(i64 %3, i64 %3)
  %not.cmp39 = icmp eq %struct.Matrix* %call38, null
  %call.i = call noalias i8* @malloc(i64 32) #8
  %data_size.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call38, i64 0, i32 1
  %7 = load i64, i64* %data_size.i, align 8, !tbaa !1
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %8 = bitcast i8* %data_size1.i to i64*
  store i64 %7, i64* %8, align 8, !tbaa !1
  %data.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call38, i64 0, i32 0
  %9 = load i64*, i64** %data.i, align 8, !tbaa !7
  %call3.i = call i64* @copy1DArray_int64_t(i64* %9, i64 %7) #8
  %data4.i = bitcast i8* %call.i to i64**
  store i64* %call3.i, i64** %data4.i, align 8, !tbaa !7
  %width.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call38, i64 0, i32 2
  %10 = load i64, i64* %width.i, align 8, !tbaa !10
  %width5.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %11 = bitcast i8* %width5.i to i64*
  store i64 %10, i64* %11, align 8, !tbaa !10
  %height.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call38, i64 0, i32 3
  %12 = load i64, i64* %height.i, align 8, !tbaa !11
  %height6.i = getelementptr inbounds i8, i8* %call.i, i64 24
  %13 = bitcast i8* %height6.i to i64*
  store i64 %12, i64* %13, align 8, !tbaa !11
  %not.cmp47 = icmp eq i8* %call.i, null
  %call54 = call %struct.Matrix* @_init_(i64 %3, i64 %3)
  %not.cmp55 = icmp eq %struct.Matrix* %call54, null
  %call.i332 = call noalias i8* @malloc(i64 32) #8
  %data_size.i333 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call54, i64 0, i32 1
  %14 = load i64, i64* %data_size.i333, align 8, !tbaa !1
  %data_size1.i334 = getelementptr inbounds i8, i8* %call.i332, i64 8
  %15 = bitcast i8* %data_size1.i334 to i64*
  store i64 %14, i64* %15, align 8, !tbaa !1
  %data.i335 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call54, i64 0, i32 0
  %16 = load i64*, i64** %data.i335, align 8, !tbaa !7
  %call3.i336 = call i64* @copy1DArray_int64_t(i64* %16, i64 %14) #8
  %data4.i337 = bitcast i8* %call.i332 to i64**
  store i64* %call3.i336, i64** %data4.i337, align 8, !tbaa !7
  %width.i338 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call54, i64 0, i32 2
  %17 = load i64, i64* %width.i338, align 8, !tbaa !10
  %width5.i339 = getelementptr inbounds i8, i8* %call.i332, i64 16
  %18 = bitcast i8* %width5.i339 to i64*
  store i64 %17, i64* %18, align 8, !tbaa !10
  %height.i340 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call54, i64 0, i32 3
  %19 = load i64, i64* %height.i340, align 8, !tbaa !11
  %height6.i341 = getelementptr inbounds i8, i8* %call.i332, i64 24
  %20 = bitcast i8* %height6.i341 to i64*
  store i64 %19, i64* %20, align 8, !tbaa !11
  %not.cmp63 = icmp eq i8* %call.i332, null
  %call.i342 = call noalias i8* @malloc(i64 32) #8
  %21 = bitcast i8* %call.i342 to %struct.Matrix*
  %data_size1.i344 = getelementptr inbounds i8, i8* %call.i342, i64 8
  %22 = bitcast i8* %data_size1.i344 to i64*
  store i64 %7, i64* %22, align 8, !tbaa !1
  %call3.i346 = call i64* @copy1DArray_int64_t(i64* %call3.i, i64 %7) #8
  %data4.i347 = bitcast i8* %call.i342 to i64**
  store i64* %call3.i346, i64** %data4.i347, align 8, !tbaa !7
  %width5.i349 = getelementptr inbounds i8, i8* %call.i342, i64 16
  %23 = bitcast i8* %width5.i349 to i64*
  store i64 %10, i64* %23, align 8, !tbaa !10
  %height6.i351 = getelementptr inbounds i8, i8* %call.i342, i64 24
  %24 = bitcast i8* %height6.i351 to i64*
  store i64 %12, i64* %24, align 8, !tbaa !11
  %call.i352 = call noalias i8* @malloc(i64 32) #8
  %25 = bitcast i8* %call.i352 to %struct.Matrix*
  %data_size1.i354 = getelementptr inbounds i8, i8* %call.i352, i64 8
  %26 = bitcast i8* %data_size1.i354 to i64*
  store i64 %14, i64* %26, align 8, !tbaa !1
  %call3.i356 = call i64* @copy1DArray_int64_t(i64* %call3.i336, i64 %14) #8
  %data4.i357 = bitcast i8* %call.i352 to i64**
  store i64* %call3.i356, i64** %data4.i357, align 8, !tbaa !7
  %width5.i359 = getelementptr inbounds i8, i8* %call.i352, i64 16
  %27 = bitcast i8* %width5.i359 to i64*
  store i64 %17, i64* %27, align 8, !tbaa !10
  %height6.i361 = getelementptr inbounds i8, i8* %call.i352, i64 24
  %28 = bitcast i8* %height6.i361 to i64*
  store i64 %19, i64* %28, align 8, !tbaa !11
  %call74 = call %struct.Matrix* @_mat_mult_(%struct.Matrix* %21, i1 zeroext true, %struct.Matrix* %25, i1 zeroext true)
  %not.cmp75 = icmp eq %struct.Matrix* %call74, null
  %call.i362 = call noalias i8* @malloc(i64 32) #8
  %data_size.i363 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call74, i64 0, i32 1
  %29 = load i64, i64* %data_size.i363, align 8, !tbaa !1
  %data_size1.i364 = getelementptr inbounds i8, i8* %call.i362, i64 8
  %30 = bitcast i8* %data_size1.i364 to i64*
  store i64 %29, i64* %30, align 8, !tbaa !1
  %data.i365 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call74, i64 0, i32 0
  %31 = load i64*, i64** %data.i365, align 8, !tbaa !7
  %call3.i366 = call i64* @copy1DArray_int64_t(i64* %31, i64 %29) #8
  %data4.i367 = bitcast i8* %call.i362 to i64**
  store i64* %call3.i366, i64** %data4.i367, align 8, !tbaa !7
  %width.i368 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call74, i64 0, i32 2
  %width5.i369 = getelementptr inbounds i8, i8* %call.i362, i64 16
  %32 = bitcast i64* %width.i368 to <2 x i64>*
  %33 = load <2 x i64>, <2 x i64>* %32, align 8, !tbaa !8
  %34 = bitcast i8* %width5.i369 to <2 x i64>*
  store <2 x i64> %33, <2 x i64>* %34, align 8, !tbaa !8
  %not.cmp83 = icmp eq i8* %call.i362, null
  %call90 = call i64* @create1DArray_int64_t(i64 0, i64 27) #8
  %35 = bitcast i64* %call90 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %35, align 8, !tbaa !8
  %arrayidx93 = getelementptr inbounds i64, i64* %call90, i64 2
  %36 = bitcast i64* %arrayidx93 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %36, align 8, !tbaa !8
  %arrayidx95 = getelementptr inbounds i64, i64* %call90, i64 4
  %37 = bitcast i64* %arrayidx95 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %37, align 8, !tbaa !8
  %arrayidx97 = getelementptr inbounds i64, i64* %call90, i64 6
  %38 = bitcast i64* %arrayidx97 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %38, align 8, !tbaa !8
  %arrayidx99 = getelementptr inbounds i64, i64* %call90, i64 8
  %39 = bitcast i64* %arrayidx99 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %39, align 8, !tbaa !8
  %arrayidx101 = getelementptr inbounds i64, i64* %call90, i64 10
  %40 = bitcast i64* %arrayidx101 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %40, align 8, !tbaa !8
  %arrayidx103 = getelementptr inbounds i64, i64* %call90, i64 12
  %41 = bitcast i64* %arrayidx103 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %41, align 8, !tbaa !8
  %arrayidx105 = getelementptr inbounds i64, i64* %call90, i64 14
  %42 = bitcast i64* %arrayidx105 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %42, align 8, !tbaa !8
  %arrayidx107 = getelementptr inbounds i64, i64* %call90, i64 16
  %43 = bitcast i64* %arrayidx107 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %43, align 8, !tbaa !8
  %arrayidx109 = getelementptr inbounds i64, i64* %call90, i64 18
  %44 = bitcast i64* %arrayidx109 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %44, align 8, !tbaa !8
  %arrayidx111 = getelementptr inbounds i64, i64* %call90, i64 20
  %45 = bitcast i64* %arrayidx111 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %45, align 8, !tbaa !8
  %arrayidx113 = getelementptr inbounds i64, i64* %call90, i64 22
  %46 = bitcast i64* %arrayidx113 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %46, align 8, !tbaa !8
  %arrayidx115 = getelementptr inbounds i64, i64* %call90, i64 24
  %47 = bitcast i64* %arrayidx115 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %47, align 8, !tbaa !8
  %arrayidx117 = getelementptr inbounds i64, i64* %call90, i64 26
  store i64 32, i64* %arrayidx117, align 8, !tbaa !8
  %not.cmp118 = icmp eq i64* %call90, null
  call void @printf_s(i64* %call90, i64 27) #8
  %add = mul i64 %3, %3
  %sub125 = add nsw i64 %add, -1
  %arrayidx126 = getelementptr inbounds i64, i64* %call3.i366, i64 %sub125
  %48 = load i64, i64* %arrayidx126, align 8, !tbaa !8
  %call127 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 %48)
  %call131 = call i64* @create1DArray_int64_t(i64 0, i64 25) #8
  %49 = bitcast i64* %call131 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %49, align 8, !tbaa !8
  %arrayidx134 = getelementptr inbounds i64, i64* %call131, i64 2
  %50 = bitcast i64* %arrayidx134 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %50, align 8, !tbaa !8
  %arrayidx136 = getelementptr inbounds i64, i64* %call131, i64 4
  %51 = bitcast i64* %arrayidx136 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %51, align 8, !tbaa !8
  %arrayidx138 = getelementptr inbounds i64, i64* %call131, i64 6
  %52 = bitcast i64* %arrayidx138 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %52, align 8, !tbaa !8
  %arrayidx140 = getelementptr inbounds i64, i64* %call131, i64 8
  %53 = bitcast i64* %arrayidx140 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %53, align 8, !tbaa !8
  %arrayidx142 = getelementptr inbounds i64, i64* %call131, i64 10
  %54 = bitcast i64* %arrayidx142 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %54, align 8, !tbaa !8
  %arrayidx144 = getelementptr inbounds i64, i64* %call131, i64 12
  %55 = bitcast i64* %arrayidx144 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %55, align 8, !tbaa !8
  %arrayidx146 = getelementptr inbounds i64, i64* %call131, i64 14
  %56 = bitcast i64* %arrayidx146 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %56, align 8, !tbaa !8
  %arrayidx148 = getelementptr inbounds i64, i64* %call131, i64 16
  %57 = bitcast i64* %arrayidx148 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %57, align 8, !tbaa !8
  %arrayidx150 = getelementptr inbounds i64, i64* %call131, i64 18
  %58 = bitcast i64* %arrayidx150 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %58, align 8, !tbaa !8
  %arrayidx152 = getelementptr inbounds i64, i64* %call131, i64 20
  %59 = bitcast i64* %arrayidx152 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %59, align 8, !tbaa !8
  %arrayidx154 = getelementptr inbounds i64, i64* %call131, i64 22
  %60 = bitcast i64* %arrayidx154 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %60, align 8, !tbaa !8
  %arrayidx156 = getelementptr inbounds i64, i64* %call131, i64 24
  store i64 101, i64* %arrayidx156, align 8, !tbaa !8
  %not.cmp157 = icmp eq i64* %call131, null
  call void @println_s(i64* %call131, i64 25) #8
  %phitmp = bitcast i64* %call131 to i8*
  %phitmp327 = bitcast i64* %call90 to i8*
  %phitmp328 = bitcast i64* %call22 to i8*
  br i1 %not.cmp47, label %if.end166, label %if.then165

if.then165:                                       ; preds = %entry
  %61 = bitcast i8* %call.i to i8**
  %62 = load i8*, i8** %61, align 8, !tbaa !7
  call void @free(i8* %62) #8
  call void @free(i8* nonnull %call.i) #8
  br label %if.end166

if.end166:                                        ; preds = %entry, %if.then165
  br i1 %not.cmp63, label %if.end169, label %if.then168

if.then168:                                       ; preds = %if.end166
  %63 = bitcast i8* %call.i332 to i8**
  %64 = load i8*, i8** %63, align 8, !tbaa !7
  call void @free(i8* %64) #8
  call void @free(i8* nonnull %call.i332) #8
  br label %if.end169

if.end169:                                        ; preds = %if.end166, %if.then168
  br i1 %not.cmp83, label %if.end172, label %if.then171

if.then171:                                       ; preds = %if.end169
  %65 = bitcast i8* %call.i362 to i8**
  %66 = load i8*, i8** %65, align 8, !tbaa !7
  call void @free(i8* %66) #8
  call void @free(i8* nonnull %call.i362) #8
  br label %if.end172

if.end172:                                        ; preds = %if.end169, %if.then171
  br i1 %not.cmp4, label %if.end175, label %if.then174

if.then174:                                       ; preds = %if.end172
  %67 = bitcast i64* %call3 to i8*
  call void @free(i8* %67) #8
  br label %if.end175

if.end175:                                        ; preds = %if.end172, %if.then174
  br i1 %not.cmp, label %if.end181, label %if.then177

if.then177:                                       ; preds = %if.end175
  %68 = load i64, i64* %_7_size, align 8, !tbaa !8
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %68) #8
  br label %if.end181

if.end181:                                        ; preds = %if.end175, %if.then177
  br i1 %not.cmp30, label %if.end184, label %if.then183

if.then183:                                       ; preds = %if.end181
  call void @free(i8* %phitmp328) #8
  br label %if.end184

if.end184:                                        ; preds = %if.end181, %if.then183
  br i1 %not.cmp39, label %if.end187, label %if.then186

if.then186:                                       ; preds = %if.end184
  %69 = bitcast %struct.Matrix* %call38 to i8**
  %70 = load i8*, i8** %69, align 8, !tbaa !7
  call void @free(i8* %70) #8
  %71 = bitcast %struct.Matrix* %call38 to i8*
  call void @free(i8* %71) #8
  br label %if.end187

if.end187:                                        ; preds = %if.end184, %if.then186
  br i1 %not.cmp55, label %if.end190, label %if.then189

if.then189:                                       ; preds = %if.end187
  %72 = bitcast %struct.Matrix* %call54 to i8**
  %73 = load i8*, i8** %72, align 8, !tbaa !7
  call void @free(i8* %73) #8
  %74 = bitcast %struct.Matrix* %call54 to i8*
  call void @free(i8* %74) #8
  br label %if.end190

if.end190:                                        ; preds = %if.end187, %if.then189
  br i1 %not.cmp75, label %if.end193, label %if.then192

if.then192:                                       ; preds = %if.end190
  %75 = bitcast %struct.Matrix* %call74 to i8**
  %76 = load i8*, i8** %75, align 8, !tbaa !7
  call void @free(i8* %76) #8
  %77 = bitcast %struct.Matrix* %call74 to i8*
  call void @free(i8* %77) #8
  br label %if.end193

if.end193:                                        ; preds = %if.end190, %if.then192
  br i1 %not.cmp118, label %if.end199, label %if.then195

if.then195:                                       ; preds = %if.end193
  call void @free(i8* %phitmp327) #8
  br label %if.end199

if.end199:                                        ; preds = %if.end193, %if.then195
  br i1 %not.cmp157, label %if.end202, label %if.then201

if.then201:                                       ; preds = %if.end199
  call void @free(i8* %phitmp) #8
  br label %if.end202

if.end202:                                        ; preds = %if.end199, %if.then201
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
!13 = distinct !{!13, !14, !"polly.alias.scope.call6"}
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
!24 = distinct !{!24, !25, !"polly.alias.scope.call9"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27, !28}
!27 = distinct !{!27, !25, !"polly.alias.scope.call22"}
!28 = distinct !{!28, !25, !"polly.alias.scope.call35"}
!29 = !{!24, !28}
!30 = !{!23, !31}
!31 = distinct !{!31}
!32 = !{!24, !27}
!33 = !{!23, !34}
!34 = distinct !{!34}
!35 = distinct !{!35, !20, !21}
!36 = distinct !{!36, !20, !21}
