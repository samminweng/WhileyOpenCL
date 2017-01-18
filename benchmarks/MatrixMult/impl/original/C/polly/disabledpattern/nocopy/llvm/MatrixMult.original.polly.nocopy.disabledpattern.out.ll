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
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit62, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit62 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard63, label %polly.loop_header60.preheader, label %polly.loop_exit62

polly.loop_header60.preheader:                    ; preds = %polly.loop_header
  %6 = shl nsw i64 %polly.indvar, 5
  %7 = sub nsw i64 %height, %6
  %8 = add nsw i64 %7, -1
  %9 = icmp slt i64 %8, 31
  %10 = select i1 %9, i64 %8, i64 31
  %polly.loop_guard72 = icmp sgt i64 %10, -1
  %polly.adjust_ub75 = add i64 %10, -1
  br i1 %polly.loop_guard72, label %polly.loop_header60.us.preheader, label %polly.loop_exit62

polly.loop_header60.us.preheader:                 ; preds = %polly.loop_header60.preheader
  br label %polly.loop_header60.us

polly.loop_header60.us:                           ; preds = %polly.loop_header60.us.preheader, %polly.loop_exit71.loopexit.us
  %polly.indvar64.us = phi i64 [ %polly.indvar_next65.us, %polly.loop_exit71.loopexit.us ], [ 0, %polly.loop_header60.us.preheader ]
  %11 = shl i64 %polly.indvar64.us, 5
  %12 = sub i64 %11, %width
  %13 = icmp sgt i64 %12, -32
  %smax111 = select i1 %13, i64 %12, i64 -32
  %14 = sub i64 -2, %smax111
  %15 = icmp sgt i64 %14, -1
  %smax112 = select i1 %15, i64 %14, i64 -1
  %16 = add i64 %smax112, -2
  %17 = lshr i64 %16, 2
  %18 = shl i64 %polly.indvar64.us, 5
  %19 = sub i64 %18, %width
  %20 = icmp sgt i64 %19, -32
  %smax = select i1 %20, i64 %19, i64 -32
  %21 = sub i64 -2, %smax
  %22 = icmp sgt i64 %21, -1
  %smax106 = select i1 %22, i64 %21, i64 -1
  %23 = add i64 %smax106, 2
  %24 = shl nsw i64 %polly.indvar64.us, 5
  %25 = sub nsw i64 %width, %24
  %26 = add nsw i64 %25, -1
  %27 = icmp slt i64 %26, 31
  %28 = select i1 %27, i64 %26, i64 31
  %polly.loop_guard81.us = icmp sgt i64 %28, -1
  %polly.adjust_ub84.us = add i64 %28, -1
  br i1 %polly.loop_guard81.us, label %polly.loop_header69.us.us.preheader, label %polly.loop_exit71.loopexit.us

polly.loop_header69.us.us.preheader:              ; preds = %polly.loop_header60.us
  %min.iters.check = icmp ult i64 %23, 4
  %n.vec = and i64 %23, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %29 = and i64 %17, 1
  %lcmp.mod = icmp eq i64 %29, 0
  %30 = icmp eq i64 %17, 0
  %cmp.n = icmp eq i64 %23, %n.vec
  br label %polly.loop_header69.us.us

polly.loop_exit71.loopexit.us.loopexit:           ; preds = %polly.loop_exit80.loopexit.us.us
  br label %polly.loop_exit71.loopexit.us

polly.loop_exit71.loopexit.us:                    ; preds = %polly.loop_exit71.loopexit.us.loopexit, %polly.loop_header60.us
  %polly.indvar_next65.us = add nuw nsw i64 %polly.indvar64.us, 1
  %exitcond = icmp eq i64 %polly.indvar64.us, %polly.fdiv_q.shr58
  br i1 %exitcond, label %polly.loop_exit62.loopexit, label %polly.loop_header60.us

polly.loop_header69.us.us:                        ; preds = %polly.loop_header69.us.us.preheader, %polly.loop_exit80.loopexit.us.us
  %polly.indvar73.us.us = phi i64 [ %polly.indvar_next74.us.us, %polly.loop_exit80.loopexit.us.us ], [ 0, %polly.loop_header69.us.us.preheader ]
  %31 = add nuw nsw i64 %polly.indvar73.us.us, %6
  %32 = mul i64 %31, %width
  %33 = add i64 %32, %24
  br i1 %min.iters.check, label %polly.loop_header78.us.us.preheader, label %min.iters.checked

polly.loop_header78.us.us.preheader:              ; preds = %middle.block, %min.iters.checked, %polly.loop_header69.us.us
  %polly.indvar82.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %polly.loop_header69.us.us ], [ %n.vec, %middle.block ]
  br label %polly.loop_header78.us.us

min.iters.checked:                                ; preds = %polly.loop_header69.us.us
  br i1 %cmp.zero, label %polly.loop_header78.us.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert109 = insertelement <2 x i64> undef, i64 %31, i32 0
  %broadcast.splat110 = shufflevector <2 x i64> %broadcast.splatinsert109, <2 x i64> undef, <2 x i32> zeroinitializer
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %34 = add i64 %32, %24
  %35 = getelementptr i64, i64* %call, i64 %34
  %36 = bitcast i64* %35 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %36, align 8, !alias.scope !12, !noalias !14
  %37 = getelementptr i64, i64* %35, i64 2
  %38 = bitcast i64* %37 to <2 x i64>*
  %wide.load108.prol = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !12, !noalias !14
  %39 = add nsw <2 x i64> %wide.load.prol, %broadcast.splat110
  %40 = add nsw <2 x i64> %wide.load108.prol, %broadcast.splat110
  %41 = bitcast i64* %35 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %41, align 8, !alias.scope !12, !noalias !14
  %42 = bitcast i64* %37 to <2 x i64>*
  store <2 x i64> %40, <2 x i64>* %42, align 8, !alias.scope !12, !noalias !14
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  br i1 %30, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %43 = add i64 %33, %index
  %44 = getelementptr i64, i64* %call, i64 %43
  %45 = bitcast i64* %44 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !12, !noalias !14
  %46 = getelementptr i64, i64* %44, i64 2
  %47 = bitcast i64* %46 to <2 x i64>*
  %wide.load108 = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !12, !noalias !14
  %48 = add nsw <2 x i64> %wide.load, %broadcast.splat110
  %49 = add nsw <2 x i64> %wide.load108, %broadcast.splat110
  %50 = bitcast i64* %44 to <2 x i64>*
  store <2 x i64> %48, <2 x i64>* %50, align 8, !alias.scope !12, !noalias !14
  %51 = bitcast i64* %46 to <2 x i64>*
  store <2 x i64> %49, <2 x i64>* %51, align 8, !alias.scope !12, !noalias !14
  %index.next = add i64 %index, 4
  %52 = add i64 %33, %index.next
  %53 = getelementptr i64, i64* %call, i64 %52
  %54 = bitcast i64* %53 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !12, !noalias !14
  %55 = getelementptr i64, i64* %53, i64 2
  %56 = bitcast i64* %55 to <2 x i64>*
  %wide.load108.1 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !12, !noalias !14
  %57 = add nsw <2 x i64> %wide.load.1, %broadcast.splat110
  %58 = add nsw <2 x i64> %wide.load108.1, %broadcast.splat110
  %59 = bitcast i64* %53 to <2 x i64>*
  store <2 x i64> %57, <2 x i64>* %59, align 8, !alias.scope !12, !noalias !14
  %60 = bitcast i64* %55 to <2 x i64>*
  store <2 x i64> %58, <2 x i64>* %60, align 8, !alias.scope !12, !noalias !14
  %index.next.1 = add i64 %index, 8
  %61 = icmp eq i64 %index.next.1, %n.vec
  br i1 %61, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !15

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %polly.loop_exit80.loopexit.us.us, label %polly.loop_header78.us.us.preheader

polly.loop_exit80.loopexit.us.us.loopexit:        ; preds = %polly.loop_header78.us.us
  br label %polly.loop_exit80.loopexit.us.us

polly.loop_exit80.loopexit.us.us:                 ; preds = %polly.loop_exit80.loopexit.us.us.loopexit, %middle.block
  %polly.indvar_next74.us.us = add nuw nsw i64 %polly.indvar73.us.us, 1
  %polly.loop_cond76.us.us = icmp sgt i64 %polly.indvar73.us.us, %polly.adjust_ub75
  br i1 %polly.loop_cond76.us.us, label %polly.loop_exit71.loopexit.us.loopexit, label %polly.loop_header69.us.us

polly.loop_header78.us.us:                        ; preds = %polly.loop_header78.us.us.preheader, %polly.loop_header78.us.us
  %polly.indvar82.us.us = phi i64 [ %polly.indvar_next83.us.us, %polly.loop_header78.us.us ], [ %polly.indvar82.us.us.ph, %polly.loop_header78.us.us.preheader ]
  %62 = add i64 %33, %polly.indvar82.us.us
  %scevgep.us.us = getelementptr i64, i64* %call, i64 %62
  %_p_scalar_.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !12, !noalias !14
  %p_add7.us.us = add nsw i64 %_p_scalar_.us.us, %31
  store i64 %p_add7.us.us, i64* %scevgep.us.us, align 8, !alias.scope !12, !noalias !14
  %polly.indvar_next83.us.us = add nuw nsw i64 %polly.indvar82.us.us, 1
  %polly.loop_cond85.us.us = icmp sgt i64 %polly.indvar82.us.us, %polly.adjust_ub84.us
  br i1 %polly.loop_cond85.us.us, label %polly.loop_exit80.loopexit.us.us.loopexit, label %polly.loop_header78.us.us, !llvm.loop !18

polly.loop_exit62.loopexit:                       ; preds = %polly.loop_exit71.loopexit.us
  br label %polly.loop_exit62

polly.loop_exit62:                                ; preds = %polly.loop_exit62.loopexit, %polly.loop_header60.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond105 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond105, label %blklab2.loopexit, label %polly.loop_header
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
  %xtraiter299 = and i64 %0, 1
  %lcmp.mod300 = icmp eq i64 %xtraiter299, 0
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
  br i1 %lcmp.mod300, label %if.end16.us.us.prol.loopexit.unr-lcssa, label %if.end16.us.us.prol.preheader

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
  br i1 %exitcond114.us, label %blklab13.loopexit294, label %while.cond7.preheader.us

blklab13.loopexit:                                ; preds = %polly.loop_exit186
  br label %blklab13

blklab13.loopexit294:                             ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %blklab13

blklab13:                                         ; preds = %blklab13.loopexit294, %blklab13.loopexit, %while.cond7.preheader.preheader, %polly.start, %entry
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
  %ident.check = icmp eq i64 %0, 1
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit186, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit186 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard187, label %polly.loop_header184.preheader, label %polly.loop_exit186

polly.loop_header184.preheader:                   ; preds = %polly.loop_header
  %27 = shl nsw i64 %polly.indvar, 5
  %28 = sub nsw i64 %1, %27
  %29 = add nsw i64 %28, -1
  %30 = icmp slt i64 %29, 31
  %31 = select i1 %30, i64 %29, i64 31
  %polly.loop_guard203 = icmp sgt i64 %31, -1
  %polly.adjust_ub206 = add i64 %31, -1
  br label %polly.loop_header184

polly.loop_exit186.loopexit:                      ; preds = %polly.loop_exit194
  br label %polly.loop_exit186

polly.loop_exit186:                               ; preds = %polly.loop_exit186.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond284 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond284, label %blklab13.loopexit, label %polly.loop_header

polly.loop_header184:                             ; preds = %polly.loop_exit194, %polly.loop_header184.preheader
  %polly.indvar188 = phi i64 [ %polly.indvar_next189, %polly.loop_exit194 ], [ 0, %polly.loop_header184.preheader ]
  %32 = shl nsw i64 %polly.indvar188, 5
  %33 = sub nsw i64 %0, %32
  %34 = add nsw i64 %33, -1
  %35 = icmp slt i64 %34, 31
  %36 = select i1 %35, i64 %34, i64 31
  %polly.loop_guard212 = icmp sgt i64 %36, -1
  %polly.adjust_ub215 = add i64 %36, -1
  br label %polly.loop_header192

polly.loop_exit194:                               ; preds = %polly.loop_exit202
  %polly.indvar_next189 = add nuw nsw i64 %polly.indvar188, 1
  %exitcond283 = icmp eq i64 %polly.indvar188, %polly.fdiv_q.shr182
  br i1 %exitcond283, label %polly.loop_exit186.loopexit, label %polly.loop_header184

polly.loop_header192:                             ; preds = %polly.loop_exit202, %polly.loop_header184
  %polly.indvar195 = phi i64 [ 0, %polly.loop_header184 ], [ %polly.indvar_next196, %polly.loop_exit202 ]
  %37 = shl i64 %polly.indvar195, 5
  %38 = sub i64 %37, %0
  %39 = icmp sgt i64 %38, -32
  %smax297 = select i1 %39, i64 %38, i64 -32
  %40 = sub i64 -2, %smax297
  %41 = icmp sgt i64 %40, -1
  %smax298 = select i1 %41, i64 %40, i64 -1
  %42 = add i64 %smax298, -2
  %43 = lshr i64 %42, 2
  %44 = shl i64 %polly.indvar195, 5
  %45 = sub i64 %44, %0
  %46 = icmp sgt i64 %45, -32
  %smax = select i1 %46, i64 %45, i64 -32
  %47 = sub i64 -2, %smax
  %48 = icmp sgt i64 %47, -1
  %smax287 = select i1 %48, i64 %47, i64 -1
  %49 = add i64 %smax287, 2
  br i1 %polly.loop_guard203, label %polly.loop_header200.preheader, label %polly.loop_exit202

polly.loop_header200.preheader:                   ; preds = %polly.loop_header192
  %50 = shl nsw i64 %polly.indvar195, 5
  %51 = sub nsw i64 %0, %50
  %52 = add nsw i64 %51, -1
  %53 = icmp slt i64 %52, 31
  %54 = select i1 %53, i64 %52, i64 31
  %polly.loop_guard221 = icmp sgt i64 %54, -1
  %polly.adjust_ub224 = add i64 %54, -1
  br i1 %polly.loop_guard212, label %polly.loop_header200.us.preheader, label %polly.loop_exit202

polly.loop_header200.us.preheader:                ; preds = %polly.loop_header200.preheader
  %min.iters.check = icmp ult i64 %49, 4
  %n.vec = and i64 %49, -4
  %cmp.zero = icmp ne i64 %n.vec, 0
  %or.cond = and i1 %cmp.zero, %ident.check
  %55 = and i64 %43, 1
  %lcmp.mod = icmp eq i64 %55, 0
  %56 = mul i64 %50, %0
  %57 = icmp eq i64 %43, 0
  %cmp.n = icmp eq i64 %49, %n.vec
  br label %polly.loop_header200.us

polly.loop_header200.us:                          ; preds = %polly.loop_header200.us.preheader, %polly.loop_exit211.loopexit.us
  %polly.indvar204.us = phi i64 [ %polly.indvar_next205.us, %polly.loop_exit211.loopexit.us ], [ 0, %polly.loop_header200.us.preheader ]
  %58 = add nuw nsw i64 %polly.indvar204.us, %27
  %59 = mul i64 %58, %0
  br i1 %polly.loop_guard221, label %polly.loop_header209.us.us.preheader, label %polly.loop_exit211.loopexit.us

polly.loop_header209.us.us.preheader:             ; preds = %polly.loop_header200.us
  %60 = add i64 %50, %59
  %61 = getelementptr i64, i64* %2, i64 %60
  %62 = bitcast i64* %61 to <2 x i64>*
  %63 = getelementptr i64, i64* %61, i64 2
  %64 = bitcast i64* %63 to <2 x i64>*
  br label %polly.loop_header209.us.us

polly.loop_exit211.loopexit.us.loopexit:          ; preds = %polly.loop_exit220.loopexit.us.us
  br label %polly.loop_exit211.loopexit.us

polly.loop_exit211.loopexit.us:                   ; preds = %polly.loop_exit211.loopexit.us.loopexit, %polly.loop_header200.us
  %polly.indvar_next205.us = add nuw nsw i64 %polly.indvar204.us, 1
  %polly.loop_cond207.us = icmp sgt i64 %polly.indvar204.us, %polly.adjust_ub206
  br i1 %polly.loop_cond207.us, label %polly.loop_exit202.loopexit, label %polly.loop_header200.us

polly.loop_header209.us.us:                       ; preds = %polly.loop_header209.us.us.preheader, %polly.loop_exit220.loopexit.us.us
  %polly.indvar213.us.us = phi i64 [ %polly.indvar_next214.us.us, %polly.loop_exit220.loopexit.us.us ], [ 0, %polly.loop_header209.us.us.preheader ]
  %65 = add nuw nsw i64 %polly.indvar213.us.us, %32
  %66 = add i64 %65, %59
  %scevgep.us.us = getelementptr i64, i64* %call, i64 %66
  %scevgep.promoted.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !20, !noalias !22
  br i1 %min.iters.check, label %polly.loop_header218.us.us.preheader, label %min.iters.checked

polly.loop_header218.us.us.preheader:             ; preds = %min.iters.checked, %middle.block, %polly.loop_header209.us.us
  %p_add25231.us.us.ph = phi i64 [ %scevgep.promoted.us.us, %min.iters.checked ], [ %scevgep.promoted.us.us, %polly.loop_header209.us.us ], [ %109, %middle.block ]
  %polly.indvar222.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %polly.loop_header209.us.us ], [ %n.vec, %middle.block ]
  br label %polly.loop_header218.us.us

min.iters.checked:                                ; preds = %polly.loop_header209.us.us
  %67 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %scevgep.promoted.us.us, i32 0
  br i1 %or.cond, label %vector.body.preheader, label %polly.loop_header218.us.us.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %wide.load.prol = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !23, !noalias !25
  %wide.load290.prol = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !23, !noalias !25
  %68 = add i64 %56, %65
  %69 = getelementptr i64, i64* %3, i64 %68
  %70 = bitcast i64* %69 to <2 x i64>*
  %wide.load291.prol = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !24, !noalias !26
  %71 = getelementptr i64, i64* %69, i64 2
  %72 = bitcast i64* %71 to <2 x i64>*
  %wide.load292.prol = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !24, !noalias !26
  %73 = mul nsw <2 x i64> %wide.load291.prol, %wide.load.prol
  %74 = mul nsw <2 x i64> %wide.load292.prol, %wide.load290.prol
  %75 = add nsw <2 x i64> %73, %67
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %.lcssa295.unr.ph = phi <2 x i64> [ %75, %vector.body.prol ], [ undef, %vector.body.preheader ]
  %.lcssa.unr.ph = phi <2 x i64> [ %74, %vector.body.prol ], [ undef, %vector.body.preheader ]
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  %vec.phi.unr.ph = phi <2 x i64> [ %75, %vector.body.prol ], [ %67, %vector.body.preheader ]
  %vec.phi288.unr.ph = phi <2 x i64> [ %74, %vector.body.prol ], [ zeroinitializer, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  br i1 %57, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %vec.phi = phi <2 x i64> [ %vec.phi.unr.ph, %vector.body.preheader.new ], [ %106, %vector.body ]
  %vec.phi288 = phi <2 x i64> [ %vec.phi288.unr.ph, %vector.body.preheader.new ], [ %107, %vector.body ]
  %76 = add nsw i64 %index, %50
  %77 = add i64 %76, %59
  %78 = getelementptr i64, i64* %2, i64 %77
  %79 = bitcast i64* %78 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !23, !noalias !25
  %80 = getelementptr i64, i64* %78, i64 2
  %81 = bitcast i64* %80 to <2 x i64>*
  %wide.load290 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !23, !noalias !25
  %82 = mul i64 %76, %0
  %83 = add i64 %82, %65
  %84 = getelementptr i64, i64* %3, i64 %83
  %85 = bitcast i64* %84 to <2 x i64>*
  %wide.load291 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !24, !noalias !26
  %86 = getelementptr i64, i64* %84, i64 2
  %87 = bitcast i64* %86 to <2 x i64>*
  %wide.load292 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !24, !noalias !26
  %88 = mul nsw <2 x i64> %wide.load291, %wide.load
  %89 = mul nsw <2 x i64> %wide.load292, %wide.load290
  %90 = add nsw <2 x i64> %88, %vec.phi
  %91 = add nsw <2 x i64> %89, %vec.phi288
  %index.next = add i64 %index, 4
  %92 = add nsw i64 %index.next, %50
  %93 = add i64 %92, %59
  %94 = getelementptr i64, i64* %2, i64 %93
  %95 = bitcast i64* %94 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !23, !noalias !25
  %96 = getelementptr i64, i64* %94, i64 2
  %97 = bitcast i64* %96 to <2 x i64>*
  %wide.load290.1 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !23, !noalias !25
  %98 = mul i64 %92, %0
  %99 = add i64 %98, %65
  %100 = getelementptr i64, i64* %3, i64 %99
  %101 = bitcast i64* %100 to <2 x i64>*
  %wide.load291.1 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !24, !noalias !26
  %102 = getelementptr i64, i64* %100, i64 2
  %103 = bitcast i64* %102 to <2 x i64>*
  %wide.load292.1 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !24, !noalias !26
  %104 = mul nsw <2 x i64> %wide.load291.1, %wide.load.1
  %105 = mul nsw <2 x i64> %wide.load292.1, %wide.load290.1
  %106 = add nsw <2 x i64> %104, %90
  %107 = add nsw <2 x i64> %105, %91
  %index.next.1 = add i64 %index, 8
  %108 = icmp eq i64 %index.next.1, %n.vec
  br i1 %108, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !27

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %.lcssa295 = phi <2 x i64> [ %.lcssa295.unr.ph, %vector.body.prol.loopexit ], [ %106, %middle.block.unr-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.unr.ph, %vector.body.prol.loopexit ], [ %107, %middle.block.unr-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa, %.lcssa295
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx293 = add <2 x i64> %bin.rdx, %rdx.shuf
  %109 = extractelement <2 x i64> %bin.rdx293, i32 0
  br i1 %cmp.n, label %polly.loop_exit220.loopexit.us.us, label %polly.loop_header218.us.us.preheader

polly.loop_exit220.loopexit.us.us.loopexit:       ; preds = %polly.loop_header218.us.us
  br label %polly.loop_exit220.loopexit.us.us

polly.loop_exit220.loopexit.us.us:                ; preds = %polly.loop_exit220.loopexit.us.us.loopexit, %middle.block
  %p_add25.us.us.lcssa = phi i64 [ %109, %middle.block ], [ %p_add25.us.us, %polly.loop_exit220.loopexit.us.us.loopexit ]
  store i64 %p_add25.us.us.lcssa, i64* %scevgep.us.us, align 8, !alias.scope !20, !noalias !22
  %polly.indvar_next214.us.us = add nuw nsw i64 %polly.indvar213.us.us, 1
  %polly.loop_cond216.us.us = icmp sgt i64 %polly.indvar213.us.us, %polly.adjust_ub215
  br i1 %polly.loop_cond216.us.us, label %polly.loop_exit211.loopexit.us.loopexit, label %polly.loop_header209.us.us

polly.loop_header218.us.us:                       ; preds = %polly.loop_header218.us.us.preheader, %polly.loop_header218.us.us
  %p_add25231.us.us = phi i64 [ %p_add25.us.us, %polly.loop_header218.us.us ], [ %p_add25231.us.us.ph, %polly.loop_header218.us.us.preheader ]
  %polly.indvar222.us.us = phi i64 [ %polly.indvar_next223.us.us, %polly.loop_header218.us.us ], [ %polly.indvar222.us.us.ph, %polly.loop_header218.us.us.preheader ]
  %110 = add nsw i64 %polly.indvar222.us.us, %50
  %111 = add i64 %110, %59
  %scevgep226.us.us = getelementptr i64, i64* %2, i64 %111
  %_p_scalar_227.us.us = load i64, i64* %scevgep226.us.us, align 8, !alias.scope !23, !noalias !25
  %112 = mul i64 %110, %0
  %113 = add i64 %112, %65
  %scevgep228.us.us = getelementptr i64, i64* %3, i64 %113
  %_p_scalar_229.us.us = load i64, i64* %scevgep228.us.us, align 8, !alias.scope !24, !noalias !26
  %p_mul24.us.us = mul nsw i64 %_p_scalar_229.us.us, %_p_scalar_227.us.us
  %p_add25.us.us = add nsw i64 %p_mul24.us.us, %p_add25231.us.us
  %polly.indvar_next223.us.us = add nuw nsw i64 %polly.indvar222.us.us, 1
  %polly.loop_cond225.us.us = icmp sgt i64 %polly.indvar222.us.us, %polly.adjust_ub224
  br i1 %polly.loop_cond225.us.us, label %polly.loop_exit220.loopexit.us.us.loopexit, label %polly.loop_header218.us.us, !llvm.loop !28

polly.loop_exit202.loopexit:                      ; preds = %polly.loop_exit211.loopexit.us
  br label %polly.loop_exit202

polly.loop_exit202:                               ; preds = %polly.loop_exit202.loopexit, %polly.loop_header200.preheader, %polly.loop_header192
  %polly.indvar_next196 = add nuw nsw i64 %polly.indvar195, 1
  %exitcond = icmp eq i64 %polly.indvar195, %pexp.p_div_q
  br i1 %exitcond, label %polly.loop_exit194, label %polly.loop_header192
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
!12 = distinct !{!12, !13, !"polly.alias.scope.call"}
!13 = distinct !{!13, !"polly.alias.scope.domain"}
!14 = !{}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !19, !16, !17}
!19 = !{!"llvm.loop.unroll.runtime.disable"}
!20 = distinct !{!20, !21, !"polly.alias.scope.call"}
!21 = distinct !{!21, !"polly.alias.scope.domain"}
!22 = !{!23, !24}
!23 = distinct !{!23, !21, !"polly.alias.scope."}
!24 = distinct !{!24, !21, !"polly.alias.scope."}
!25 = !{!24, !20}
!26 = !{!23, !20}
!27 = distinct !{!27, !16, !17}
!28 = distinct !{!28, !16, !17}
