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
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit105, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit105 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard106, label %polly.loop_header103.preheader, label %polly.loop_exit105

polly.loop_header103.preheader:                   ; preds = %polly.loop_header
  %9 = shl nsw i64 %polly.indvar, 5
  %10 = sub nsw i64 %height, %9
  %11 = add nsw i64 %10, -1
  %12 = icmp slt i64 %11, 31
  %13 = select i1 %12, i64 %11, i64 31
  %polly.loop_guard115 = icmp sgt i64 %13, -1
  %polly.adjust_ub118 = add i64 %13, -1
  br i1 %polly.loop_guard115, label %polly.loop_header103.us.preheader, label %polly.loop_exit105

polly.loop_header103.us.preheader:                ; preds = %polly.loop_header103.preheader
  br label %polly.loop_header103.us

polly.loop_header103.us:                          ; preds = %polly.loop_header103.us.preheader, %polly.loop_exit114.loopexit.us
  %polly.indvar107.us = phi i64 [ %polly.indvar_next108.us, %polly.loop_exit114.loopexit.us ], [ 0, %polly.loop_header103.us.preheader ]
  %14 = shl i64 %polly.indvar107.us, 5
  %15 = sub i64 %14, %width
  %16 = icmp sgt i64 %15, -32
  %smax154 = select i1 %16, i64 %15, i64 -32
  %17 = sub i64 -2, %smax154
  %18 = icmp sgt i64 %17, -1
  %smax155 = select i1 %18, i64 %17, i64 -1
  %19 = add i64 %smax155, -2
  %20 = lshr i64 %19, 2
  %21 = shl i64 %polly.indvar107.us, 5
  %22 = sub i64 %21, %width
  %23 = icmp sgt i64 %22, -32
  %smax = select i1 %23, i64 %22, i64 -32
  %24 = sub i64 -2, %smax
  %25 = icmp sgt i64 %24, -1
  %smax149 = select i1 %25, i64 %24, i64 -1
  %26 = add i64 %smax149, 2
  %27 = shl nsw i64 %polly.indvar107.us, 5
  %28 = sub nsw i64 %width, %27
  %29 = add nsw i64 %28, -1
  %30 = icmp slt i64 %29, 31
  %31 = select i1 %30, i64 %29, i64 31
  %polly.loop_guard124.us = icmp sgt i64 %31, -1
  %polly.adjust_ub127.us = add i64 %31, -1
  br i1 %polly.loop_guard124.us, label %polly.loop_header112.us.us.preheader, label %polly.loop_exit114.loopexit.us

polly.loop_header112.us.us.preheader:             ; preds = %polly.loop_header103.us
  %min.iters.check = icmp ult i64 %26, 4
  %n.vec = and i64 %26, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %32 = and i64 %20, 1
  %lcmp.mod = icmp eq i64 %32, 0
  %33 = icmp eq i64 %20, 0
  %cmp.n = icmp eq i64 %26, %n.vec
  br label %polly.loop_header112.us.us

polly.loop_exit114.loopexit.us.loopexit:          ; preds = %polly.loop_exit123.loopexit.us.us
  br label %polly.loop_exit114.loopexit.us

polly.loop_exit114.loopexit.us:                   ; preds = %polly.loop_exit114.loopexit.us.loopexit, %polly.loop_header103.us
  %polly.indvar_next108.us = add nuw nsw i64 %polly.indvar107.us, 1
  %exitcond = icmp eq i64 %polly.indvar107.us, %polly.fdiv_q.shr101
  br i1 %exitcond, label %polly.loop_exit105.loopexit, label %polly.loop_header103.us

polly.loop_header112.us.us:                       ; preds = %polly.loop_header112.us.us.preheader, %polly.loop_exit123.loopexit.us.us
  %polly.indvar116.us.us = phi i64 [ %polly.indvar_next117.us.us, %polly.loop_exit123.loopexit.us.us ], [ 0, %polly.loop_header112.us.us.preheader ]
  %34 = add nuw nsw i64 %polly.indvar116.us.us, %9
  %35 = mul i64 %34, %width
  %36 = add i64 %35, %27
  br i1 %min.iters.check, label %polly.loop_header121.us.us.preheader, label %min.iters.checked

polly.loop_header121.us.us.preheader:             ; preds = %middle.block, %min.iters.checked, %polly.loop_header112.us.us
  %polly.indvar125.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %polly.loop_header112.us.us ], [ %n.vec, %middle.block ]
  br label %polly.loop_header121.us.us

min.iters.checked:                                ; preds = %polly.loop_header112.us.us
  br i1 %cmp.zero, label %polly.loop_header121.us.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert152 = insertelement <2 x i64> undef, i64 %34, i32 0
  %broadcast.splat153 = shufflevector <2 x i64> %broadcast.splatinsert152, <2 x i64> undef, <2 x i32> zeroinitializer
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %37 = add i64 %35, %27
  %38 = getelementptr i64, i64* %call6, i64 %37
  %39 = bitcast i64* %38 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !12, !noalias !14
  %40 = getelementptr i64, i64* %38, i64 2
  %41 = bitcast i64* %40 to <2 x i64>*
  %wide.load151.prol = load <2 x i64>, <2 x i64>* %41, align 8, !alias.scope !12, !noalias !14
  %42 = add nsw <2 x i64> %wide.load.prol, %broadcast.splat153
  %43 = add nsw <2 x i64> %wide.load151.prol, %broadcast.splat153
  %44 = bitcast i64* %38 to <2 x i64>*
  store <2 x i64> %42, <2 x i64>* %44, align 8, !alias.scope !12, !noalias !14
  %45 = bitcast i64* %40 to <2 x i64>*
  store <2 x i64> %43, <2 x i64>* %45, align 8, !alias.scope !12, !noalias !14
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  br i1 %33, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %46 = add i64 %36, %index
  %47 = getelementptr i64, i64* %call6, i64 %46
  %48 = bitcast i64* %47 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %48, align 8, !alias.scope !12, !noalias !14
  %49 = getelementptr i64, i64* %47, i64 2
  %50 = bitcast i64* %49 to <2 x i64>*
  %wide.load151 = load <2 x i64>, <2 x i64>* %50, align 8, !alias.scope !12, !noalias !14
  %51 = add nsw <2 x i64> %wide.load, %broadcast.splat153
  %52 = add nsw <2 x i64> %wide.load151, %broadcast.splat153
  %53 = bitcast i64* %47 to <2 x i64>*
  store <2 x i64> %51, <2 x i64>* %53, align 8, !alias.scope !12, !noalias !14
  %54 = bitcast i64* %49 to <2 x i64>*
  store <2 x i64> %52, <2 x i64>* %54, align 8, !alias.scope !12, !noalias !14
  %index.next = add i64 %index, 4
  %55 = add i64 %36, %index.next
  %56 = getelementptr i64, i64* %call6, i64 %55
  %57 = bitcast i64* %56 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %57, align 8, !alias.scope !12, !noalias !14
  %58 = getelementptr i64, i64* %56, i64 2
  %59 = bitcast i64* %58 to <2 x i64>*
  %wide.load151.1 = load <2 x i64>, <2 x i64>* %59, align 8, !alias.scope !12, !noalias !14
  %60 = add nsw <2 x i64> %wide.load.1, %broadcast.splat153
  %61 = add nsw <2 x i64> %wide.load151.1, %broadcast.splat153
  %62 = bitcast i64* %56 to <2 x i64>*
  store <2 x i64> %60, <2 x i64>* %62, align 8, !alias.scope !12, !noalias !14
  %63 = bitcast i64* %58 to <2 x i64>*
  store <2 x i64> %61, <2 x i64>* %63, align 8, !alias.scope !12, !noalias !14
  %index.next.1 = add i64 %index, 8
  %64 = icmp eq i64 %index.next.1, %n.vec
  br i1 %64, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !15

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %polly.loop_exit123.loopexit.us.us, label %polly.loop_header121.us.us.preheader

polly.loop_exit123.loopexit.us.us.loopexit:       ; preds = %polly.loop_header121.us.us
  br label %polly.loop_exit123.loopexit.us.us

polly.loop_exit123.loopexit.us.us:                ; preds = %polly.loop_exit123.loopexit.us.us.loopexit, %middle.block
  %polly.indvar_next117.us.us = add nuw nsw i64 %polly.indvar116.us.us, 1
  %polly.loop_cond119.us.us = icmp sgt i64 %polly.indvar116.us.us, %polly.adjust_ub118
  br i1 %polly.loop_cond119.us.us, label %polly.loop_exit114.loopexit.us.loopexit, label %polly.loop_header112.us.us

polly.loop_header121.us.us:                       ; preds = %polly.loop_header121.us.us.preheader, %polly.loop_header121.us.us
  %polly.indvar125.us.us = phi i64 [ %polly.indvar_next126.us.us, %polly.loop_header121.us.us ], [ %polly.indvar125.us.us.ph, %polly.loop_header121.us.us.preheader ]
  %65 = add i64 %36, %polly.indvar125.us.us
  %scevgep.us.us = getelementptr i64, i64* %call6, i64 %65
  %_p_scalar_.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !12, !noalias !14
  %p_add20.us.us = add nsw i64 %_p_scalar_.us.us, %34
  store i64 %p_add20.us.us, i64* %scevgep.us.us, align 8, !alias.scope !12, !noalias !14
  %polly.indvar_next126.us.us = add nuw nsw i64 %polly.indvar125.us.us, 1
  %polly.loop_cond128.us.us = icmp sgt i64 %polly.indvar125.us.us, %polly.adjust_ub127.us
  br i1 %polly.loop_cond128.us.us, label %polly.loop_exit123.loopexit.us.us.loopexit, label %polly.loop_header121.us.us, !llvm.loop !18

polly.loop_exit105.loopexit:                      ; preds = %polly.loop_exit114.loopexit.us
  br label %polly.loop_exit105

polly.loop_exit105:                               ; preds = %polly.loop_exit105.loopexit, %polly.loop_header103.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond148 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond148, label %if.end28.loopexit, label %polly.loop_header
}

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define void @_print_mat_(%struct._IO_FILE* nocapture readnone %sys, %struct.Matrix* nocapture %a, i1 zeroext %a_dealloc) local_unnamed_addr #0 {
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

while.cond3.preheader.us:                         ; preds = %while.cond3.preheader.us.preheader, %if.end22.us
  %_25_dealloc.099.us = phi i8 [ %.87.us, %if.end22.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %_25.098.us = phi i8* [ %6, %if.end22.us ], [ undef, %while.cond3.preheader.us.preheader ]
  %_18_dealloc.097.us = phi i8 [ %..us, %if.end22.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %_18.096.us = phi i64* [ %call13.us, %if.end22.us ], [ null, %while.cond3.preheader.us.preheader ]
  %i.094.us = phi i64 [ %add19.us, %if.end22.us ], [ 0, %while.cond3.preheader.us.preheader ]
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
  br i1 %exitcond.us, label %blklab8.loopexit.us, label %if.end9.us

if.then21.us:                                     ; preds = %blklab8.loopexit.us
  tail call void @free(i8* %_25.098.us) #8
  br label %if.end22.us

if.end22.us:                                      ; preds = %if.then21.us, %blklab8.loopexit.us
  %call23.us = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #8
  %6 = bitcast i64* %call23.us to i8*
  %not.cmp24.us = icmp ne i64* %call23.us, null
  %.87.us = zext i1 %not.cmp24.us to i8
  tail call void @println_s(i64* %call23.us, i64 0) #8
  %exitcond104.us = icmp eq i64 %add19.us, %1
  br i1 %exitcond104.us, label %blklab6.loopexit, label %while.cond3.preheader.us

blklab8.loopexit.us:                              ; preds = %if.end12.us
  %add19.us = add nuw nsw i64 %i.094.us, 1
  %tobool20.us = icmp eq i8 %_25_dealloc.099.us, 0
  br i1 %tobool20.us, label %if.end22.us, label %if.then21.us

while.cond3.preheader:                            ; preds = %while.cond3.preheader.preheader114, %if.end22
  %_25_dealloc.099 = phi i8 [ %.87, %if.end22 ], [ 0, %while.cond3.preheader.preheader114 ]
  %_25.098 = phi i8* [ %7, %if.end22 ], [ undef, %while.cond3.preheader.preheader114 ]
  %i.094 = phi i64 [ %add19, %if.end22 ], [ 0, %while.cond3.preheader.preheader114 ]
  %add19 = add nuw nsw i64 %i.094, 1
  %tobool20 = icmp eq i8 %_25_dealloc.099, 0
  br i1 %tobool20, label %if.end22, label %if.then21

if.then21:                                        ; preds = %while.cond3.preheader
  tail call void @free(i8* %_25.098) #8
  br label %if.end22

if.end22:                                         ; preds = %while.cond3.preheader, %if.then21
  %call23 = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #8
  %7 = bitcast i64* %call23 to i8*
  %not.cmp24 = icmp ne i64* %call23, null
  %.87 = zext i1 %not.cmp24 to i8
  tail call void @println_s(i64* %call23, i64 0) #8
  %exitcond104 = icmp eq i64 %add19, %1
  br i1 %exitcond104, label %blklab6.loopexit115, label %while.cond3.preheader

blklab6.loopexit:                                 ; preds = %if.end22.us
  %phitmp = bitcast i64* %call13.us to i8*
  br label %blklab6

blklab6.loopexit115:                              ; preds = %if.end22
  br label %blklab6

blklab6:                                          ; preds = %blklab6.loopexit115, %blklab6.loopexit, %entry
  %_18.0.lcssa = phi i8* [ null, %entry ], [ %phitmp, %blklab6.loopexit ], [ null, %blklab6.loopexit115 ]
  %_18_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %..us, %blklab6.loopexit ], [ 0, %blklab6.loopexit115 ]
  %_25.0.lcssa = phi i8* [ undef, %entry ], [ %6, %blklab6.loopexit ], [ %7, %blklab6.loopexit115 ]
  %_25_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %.87.us, %blklab6.loopexit ], [ %.87, %blklab6.loopexit115 ]
  br i1 %a_dealloc, label %if.then29, label %if.end33

if.then29:                                        ; preds = %blklab6
  %8 = bitcast %struct.Matrix* %a to i8**
  %9 = load i8*, i8** %8, align 8, !tbaa !7
  tail call void @free(i8* %9) #8
  %10 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %10) #8
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
  %xtraiter394 = and i64 %0, 1
  %lcmp.mod395 = icmp eq i64 %xtraiter394, 0
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
  br i1 %lcmp.mod395, label %if.end52.us.us.prol.loopexit.unr-lcssa, label %if.end52.us.us.prol.preheader

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
  br i1 %exitcond216.us, label %if.end70.loopexit389, label %while.cond43.preheader.us

if.end70.loopexit:                                ; preds = %polly.loop_exit281
  br label %if.end70

if.end70.loopexit389:                             ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %if.end70

if.end70:                                         ; preds = %if.end70.loopexit389, %if.end70.loopexit, %while.cond43.preheader.preheader, %polly.start, %entry
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
  %ident.check = icmp eq i64 %0, 1
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit281, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit281 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard282, label %polly.loop_header279.preheader, label %polly.loop_exit281

polly.loop_header279.preheader:                   ; preds = %polly.loop_header
  %40 = shl nsw i64 %polly.indvar, 5
  %41 = sub nsw i64 %1, %40
  %42 = add nsw i64 %41, -1
  %43 = icmp slt i64 %42, 31
  %44 = select i1 %43, i64 %42, i64 31
  %polly.loop_guard298 = icmp sgt i64 %44, -1
  %polly.adjust_ub301 = add i64 %44, -1
  br label %polly.loop_header279

polly.loop_exit281.loopexit:                      ; preds = %polly.loop_exit289
  br label %polly.loop_exit281

polly.loop_exit281:                               ; preds = %polly.loop_exit281.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond379 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond379, label %if.end70.loopexit, label %polly.loop_header

polly.loop_header279:                             ; preds = %polly.loop_exit289, %polly.loop_header279.preheader
  %polly.indvar283 = phi i64 [ %polly.indvar_next284, %polly.loop_exit289 ], [ 0, %polly.loop_header279.preheader ]
  %45 = shl nsw i64 %polly.indvar283, 5
  %46 = sub nsw i64 %0, %45
  %47 = add nsw i64 %46, -1
  %48 = icmp slt i64 %47, 31
  %49 = select i1 %48, i64 %47, i64 31
  %polly.loop_guard307 = icmp sgt i64 %49, -1
  %polly.adjust_ub310 = add i64 %49, -1
  br label %polly.loop_header287

polly.loop_exit289:                               ; preds = %polly.loop_exit297
  %polly.indvar_next284 = add nuw nsw i64 %polly.indvar283, 1
  %exitcond378 = icmp eq i64 %polly.indvar283, %polly.fdiv_q.shr277
  br i1 %exitcond378, label %polly.loop_exit281.loopexit, label %polly.loop_header279

polly.loop_header287:                             ; preds = %polly.loop_exit297, %polly.loop_header279
  %polly.indvar290 = phi i64 [ 0, %polly.loop_header279 ], [ %polly.indvar_next291, %polly.loop_exit297 ]
  %50 = shl i64 %polly.indvar290, 5
  %51 = sub i64 %50, %0
  %52 = icmp sgt i64 %51, -32
  %smax392 = select i1 %52, i64 %51, i64 -32
  %53 = sub i64 -2, %smax392
  %54 = icmp sgt i64 %53, -1
  %smax393 = select i1 %54, i64 %53, i64 -1
  %55 = add i64 %smax393, -2
  %56 = lshr i64 %55, 2
  %57 = shl i64 %polly.indvar290, 5
  %58 = sub i64 %57, %0
  %59 = icmp sgt i64 %58, -32
  %smax = select i1 %59, i64 %58, i64 -32
  %60 = sub i64 -2, %smax
  %61 = icmp sgt i64 %60, -1
  %smax382 = select i1 %61, i64 %60, i64 -1
  %62 = add i64 %smax382, 2
  br i1 %polly.loop_guard298, label %polly.loop_header295.preheader, label %polly.loop_exit297

polly.loop_header295.preheader:                   ; preds = %polly.loop_header287
  %63 = shl nsw i64 %polly.indvar290, 5
  %64 = sub nsw i64 %0, %63
  %65 = add nsw i64 %64, -1
  %66 = icmp slt i64 %65, 31
  %67 = select i1 %66, i64 %65, i64 31
  %polly.loop_guard316 = icmp sgt i64 %67, -1
  %polly.adjust_ub319 = add i64 %67, -1
  br i1 %polly.loop_guard307, label %polly.loop_header295.us.preheader, label %polly.loop_exit297

polly.loop_header295.us.preheader:                ; preds = %polly.loop_header295.preheader
  %min.iters.check = icmp ult i64 %62, 4
  %n.vec = and i64 %62, -4
  %cmp.zero = icmp ne i64 %n.vec, 0
  %or.cond = and i1 %cmp.zero, %ident.check
  %68 = and i64 %56, 1
  %lcmp.mod = icmp eq i64 %68, 0
  %69 = mul i64 %63, %0
  %70 = icmp eq i64 %56, 0
  %cmp.n = icmp eq i64 %62, %n.vec
  br label %polly.loop_header295.us

polly.loop_header295.us:                          ; preds = %polly.loop_header295.us.preheader, %polly.loop_exit306.loopexit.us
  %polly.indvar299.us = phi i64 [ %polly.indvar_next300.us, %polly.loop_exit306.loopexit.us ], [ 0, %polly.loop_header295.us.preheader ]
  %71 = add nuw nsw i64 %polly.indvar299.us, %40
  %72 = mul i64 %71, %0
  br i1 %polly.loop_guard316, label %polly.loop_header304.us.us.preheader, label %polly.loop_exit306.loopexit.us

polly.loop_header304.us.us.preheader:             ; preds = %polly.loop_header295.us
  %73 = add i64 %63, %72
  %74 = getelementptr i64, i64* %call22, i64 %73
  %75 = bitcast i64* %74 to <2 x i64>*
  %76 = getelementptr i64, i64* %74, i64 2
  %77 = bitcast i64* %76 to <2 x i64>*
  br label %polly.loop_header304.us.us

polly.loop_exit306.loopexit.us.loopexit:          ; preds = %polly.loop_exit315.loopexit.us.us
  br label %polly.loop_exit306.loopexit.us

polly.loop_exit306.loopexit.us:                   ; preds = %polly.loop_exit306.loopexit.us.loopexit, %polly.loop_header295.us
  %polly.indvar_next300.us = add nuw nsw i64 %polly.indvar299.us, 1
  %polly.loop_cond302.us = icmp sgt i64 %polly.indvar299.us, %polly.adjust_ub301
  br i1 %polly.loop_cond302.us, label %polly.loop_exit297.loopexit, label %polly.loop_header295.us

polly.loop_header304.us.us:                       ; preds = %polly.loop_header304.us.us.preheader, %polly.loop_exit315.loopexit.us.us
  %polly.indvar308.us.us = phi i64 [ %polly.indvar_next309.us.us, %polly.loop_exit315.loopexit.us.us ], [ 0, %polly.loop_header304.us.us.preheader ]
  %78 = add nuw nsw i64 %polly.indvar308.us.us, %45
  %79 = add i64 %78, %72
  %scevgep.us.us = getelementptr i64, i64* %call9, i64 %79
  %scevgep.promoted.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !20, !noalias !22
  br i1 %min.iters.check, label %polly.loop_header313.us.us.preheader, label %min.iters.checked

polly.loop_header313.us.us.preheader:             ; preds = %min.iters.checked, %middle.block, %polly.loop_header304.us.us
  %p_add61326.us.us.ph = phi i64 [ %scevgep.promoted.us.us, %min.iters.checked ], [ %scevgep.promoted.us.us, %polly.loop_header304.us.us ], [ %122, %middle.block ]
  %polly.indvar317.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %polly.loop_header304.us.us ], [ %n.vec, %middle.block ]
  br label %polly.loop_header313.us.us

min.iters.checked:                                ; preds = %polly.loop_header304.us.us
  %80 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %scevgep.promoted.us.us, i32 0
  br i1 %or.cond, label %vector.body.preheader, label %polly.loop_header313.us.us.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %wide.load.prol = load <2 x i64>, <2 x i64>* %75, align 8, !alias.scope !24, !noalias !25
  %wide.load385.prol = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !24, !noalias !25
  %81 = add i64 %69, %78
  %82 = getelementptr i64, i64* %call35, i64 %81
  %83 = bitcast i64* %82 to <2 x i64>*
  %wide.load386.prol = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !23, !noalias !26
  %84 = getelementptr i64, i64* %82, i64 2
  %85 = bitcast i64* %84 to <2 x i64>*
  %wide.load387.prol = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !23, !noalias !26
  %86 = mul nsw <2 x i64> %wide.load386.prol, %wide.load.prol
  %87 = mul nsw <2 x i64> %wide.load387.prol, %wide.load385.prol
  %88 = add nsw <2 x i64> %86, %80
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %.lcssa390.unr.ph = phi <2 x i64> [ %88, %vector.body.prol ], [ undef, %vector.body.preheader ]
  %.lcssa.unr.ph = phi <2 x i64> [ %87, %vector.body.prol ], [ undef, %vector.body.preheader ]
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  %vec.phi.unr.ph = phi <2 x i64> [ %88, %vector.body.prol ], [ %80, %vector.body.preheader ]
  %vec.phi383.unr.ph = phi <2 x i64> [ %87, %vector.body.prol ], [ zeroinitializer, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  br i1 %70, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %vec.phi = phi <2 x i64> [ %vec.phi.unr.ph, %vector.body.preheader.new ], [ %119, %vector.body ]
  %vec.phi383 = phi <2 x i64> [ %vec.phi383.unr.ph, %vector.body.preheader.new ], [ %120, %vector.body ]
  %89 = add nsw i64 %index, %63
  %90 = add i64 %89, %72
  %91 = getelementptr i64, i64* %call22, i64 %90
  %92 = bitcast i64* %91 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !24, !noalias !25
  %93 = getelementptr i64, i64* %91, i64 2
  %94 = bitcast i64* %93 to <2 x i64>*
  %wide.load385 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !24, !noalias !25
  %95 = mul i64 %89, %0
  %96 = add i64 %95, %78
  %97 = getelementptr i64, i64* %call35, i64 %96
  %98 = bitcast i64* %97 to <2 x i64>*
  %wide.load386 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !23, !noalias !26
  %99 = getelementptr i64, i64* %97, i64 2
  %100 = bitcast i64* %99 to <2 x i64>*
  %wide.load387 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !23, !noalias !26
  %101 = mul nsw <2 x i64> %wide.load386, %wide.load
  %102 = mul nsw <2 x i64> %wide.load387, %wide.load385
  %103 = add nsw <2 x i64> %101, %vec.phi
  %104 = add nsw <2 x i64> %102, %vec.phi383
  %index.next = add i64 %index, 4
  %105 = add nsw i64 %index.next, %63
  %106 = add i64 %105, %72
  %107 = getelementptr i64, i64* %call22, i64 %106
  %108 = bitcast i64* %107 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %108, align 8, !alias.scope !24, !noalias !25
  %109 = getelementptr i64, i64* %107, i64 2
  %110 = bitcast i64* %109 to <2 x i64>*
  %wide.load385.1 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !24, !noalias !25
  %111 = mul i64 %105, %0
  %112 = add i64 %111, %78
  %113 = getelementptr i64, i64* %call35, i64 %112
  %114 = bitcast i64* %113 to <2 x i64>*
  %wide.load386.1 = load <2 x i64>, <2 x i64>* %114, align 8, !alias.scope !23, !noalias !26
  %115 = getelementptr i64, i64* %113, i64 2
  %116 = bitcast i64* %115 to <2 x i64>*
  %wide.load387.1 = load <2 x i64>, <2 x i64>* %116, align 8, !alias.scope !23, !noalias !26
  %117 = mul nsw <2 x i64> %wide.load386.1, %wide.load.1
  %118 = mul nsw <2 x i64> %wide.load387.1, %wide.load385.1
  %119 = add nsw <2 x i64> %117, %103
  %120 = add nsw <2 x i64> %118, %104
  %index.next.1 = add i64 %index, 8
  %121 = icmp eq i64 %index.next.1, %n.vec
  br i1 %121, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !27

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %.lcssa390 = phi <2 x i64> [ %.lcssa390.unr.ph, %vector.body.prol.loopexit ], [ %119, %middle.block.unr-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.unr.ph, %vector.body.prol.loopexit ], [ %120, %middle.block.unr-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa, %.lcssa390
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx388 = add <2 x i64> %bin.rdx, %rdx.shuf
  %122 = extractelement <2 x i64> %bin.rdx388, i32 0
  br i1 %cmp.n, label %polly.loop_exit315.loopexit.us.us, label %polly.loop_header313.us.us.preheader

polly.loop_exit315.loopexit.us.us.loopexit:       ; preds = %polly.loop_header313.us.us
  br label %polly.loop_exit315.loopexit.us.us

polly.loop_exit315.loopexit.us.us:                ; preds = %polly.loop_exit315.loopexit.us.us.loopexit, %middle.block
  %p_add61.us.us.lcssa = phi i64 [ %122, %middle.block ], [ %p_add61.us.us, %polly.loop_exit315.loopexit.us.us.loopexit ]
  store i64 %p_add61.us.us.lcssa, i64* %scevgep.us.us, align 8, !alias.scope !20, !noalias !22
  %polly.indvar_next309.us.us = add nuw nsw i64 %polly.indvar308.us.us, 1
  %polly.loop_cond311.us.us = icmp sgt i64 %polly.indvar308.us.us, %polly.adjust_ub310
  br i1 %polly.loop_cond311.us.us, label %polly.loop_exit306.loopexit.us.loopexit, label %polly.loop_header304.us.us

polly.loop_header313.us.us:                       ; preds = %polly.loop_header313.us.us.preheader, %polly.loop_header313.us.us
  %p_add61326.us.us = phi i64 [ %p_add61.us.us, %polly.loop_header313.us.us ], [ %p_add61326.us.us.ph, %polly.loop_header313.us.us.preheader ]
  %polly.indvar317.us.us = phi i64 [ %polly.indvar_next318.us.us, %polly.loop_header313.us.us ], [ %polly.indvar317.us.us.ph, %polly.loop_header313.us.us.preheader ]
  %123 = add nsw i64 %polly.indvar317.us.us, %63
  %124 = add i64 %123, %72
  %scevgep321.us.us = getelementptr i64, i64* %call22, i64 %124
  %_p_scalar_322.us.us = load i64, i64* %scevgep321.us.us, align 8, !alias.scope !24, !noalias !25
  %125 = mul i64 %123, %0
  %126 = add i64 %125, %78
  %scevgep323.us.us = getelementptr i64, i64* %call35, i64 %126
  %_p_scalar_324.us.us = load i64, i64* %scevgep323.us.us, align 8, !alias.scope !23, !noalias !26
  %p_mul60.us.us = mul nsw i64 %_p_scalar_324.us.us, %_p_scalar_322.us.us
  %p_add61.us.us = add nsw i64 %p_mul60.us.us, %p_add61326.us.us
  %polly.indvar_next318.us.us = add nuw nsw i64 %polly.indvar317.us.us, 1
  %polly.loop_cond320.us.us = icmp sgt i64 %polly.indvar317.us.us, %polly.adjust_ub319
  br i1 %polly.loop_cond320.us.us, label %polly.loop_exit315.loopexit.us.us.loopexit, label %polly.loop_header313.us.us, !llvm.loop !28

polly.loop_exit297.loopexit:                      ; preds = %polly.loop_exit306.loopexit.us
  br label %polly.loop_exit297

polly.loop_exit297:                               ; preds = %polly.loop_exit297.loopexit, %polly.loop_header295.preheader, %polly.loop_header287
  %polly.indvar_next291 = add nuw nsw i64 %polly.indvar290, 1
  %exitcond = icmp eq i64 %polly.indvar290, %pexp.p_div_q
  br i1 %exitcond, label %polly.loop_exit289, label %polly.loop_header287
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
!12 = distinct !{!12, !13, !"polly.alias.scope.call6"}
!13 = distinct !{!13, !"polly.alias.scope.domain"}
!14 = !{}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !19, !16, !17}
!19 = !{!"llvm.loop.unroll.runtime.disable"}
!20 = distinct !{!20, !21, !"polly.alias.scope.call9"}
!21 = distinct !{!21, !"polly.alias.scope.domain"}
!22 = !{!23, !24}
!23 = distinct !{!23, !21, !"polly.alias.scope.call35"}
!24 = distinct !{!24, !21, !"polly.alias.scope.call22"}
!25 = !{!23, !20}
!26 = !{!24, !20}
!27 = distinct !{!27, !16, !17}
!28 = distinct !{!28, !16, !17}
