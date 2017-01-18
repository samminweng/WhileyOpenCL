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
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit67, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit67 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard68, label %polly.loop_header65.preheader, label %polly.loop_exit67

polly.loop_header65.preheader:                    ; preds = %polly.loop_header
  %6 = shl nsw i64 %polly.indvar, 5
  %7 = sub nsw i64 %height, %6
  %8 = add nsw i64 %7, -1
  %9 = icmp slt i64 %8, 31
  %10 = select i1 %9, i64 %8, i64 31
  %polly.loop_guard77 = icmp sgt i64 %10, -1
  %polly.adjust_ub80 = add i64 %10, -1
  br i1 %polly.loop_guard77, label %polly.loop_header65.us.preheader, label %polly.loop_exit67

polly.loop_header65.us.preheader:                 ; preds = %polly.loop_header65.preheader
  br label %polly.loop_header65.us

polly.loop_header65.us:                           ; preds = %polly.loop_header65.us.preheader, %polly.loop_exit76.loopexit.us
  %polly.indvar69.us = phi i64 [ %polly.indvar_next70.us, %polly.loop_exit76.loopexit.us ], [ 0, %polly.loop_header65.us.preheader ]
  %11 = shl i64 %polly.indvar69.us, 5
  %12 = sub i64 %11, %width
  %13 = icmp sgt i64 %12, -32
  %smax116 = select i1 %13, i64 %12, i64 -32
  %14 = sub i64 -2, %smax116
  %15 = icmp sgt i64 %14, -1
  %smax117 = select i1 %15, i64 %14, i64 -1
  %16 = add i64 %smax117, -2
  %17 = lshr i64 %16, 2
  %18 = shl i64 %polly.indvar69.us, 5
  %19 = sub i64 %18, %width
  %20 = icmp sgt i64 %19, -32
  %smax = select i1 %20, i64 %19, i64 -32
  %21 = sub i64 -2, %smax
  %22 = icmp sgt i64 %21, -1
  %smax111 = select i1 %22, i64 %21, i64 -1
  %23 = add i64 %smax111, 2
  %24 = shl nsw i64 %polly.indvar69.us, 5
  %25 = sub nsw i64 %width, %24
  %26 = add nsw i64 %25, -1
  %27 = icmp slt i64 %26, 31
  %28 = select i1 %27, i64 %26, i64 31
  %polly.loop_guard86.us = icmp sgt i64 %28, -1
  %polly.adjust_ub89.us = add i64 %28, -1
  br i1 %polly.loop_guard86.us, label %polly.loop_header74.us.us.preheader, label %polly.loop_exit76.loopexit.us

polly.loop_header74.us.us.preheader:              ; preds = %polly.loop_header65.us
  %min.iters.check = icmp ult i64 %23, 4
  %n.vec = and i64 %23, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %29 = and i64 %17, 1
  %lcmp.mod = icmp eq i64 %29, 0
  %30 = icmp eq i64 %17, 0
  %cmp.n = icmp eq i64 %23, %n.vec
  br label %polly.loop_header74.us.us

polly.loop_exit76.loopexit.us.loopexit:           ; preds = %polly.loop_exit85.loopexit.us.us
  br label %polly.loop_exit76.loopexit.us

polly.loop_exit76.loopexit.us:                    ; preds = %polly.loop_exit76.loopexit.us.loopexit, %polly.loop_header65.us
  %polly.indvar_next70.us = add nuw nsw i64 %polly.indvar69.us, 1
  %exitcond = icmp eq i64 %polly.indvar69.us, %polly.fdiv_q.shr63
  br i1 %exitcond, label %polly.loop_exit67.loopexit, label %polly.loop_header65.us

polly.loop_header74.us.us:                        ; preds = %polly.loop_header74.us.us.preheader, %polly.loop_exit85.loopexit.us.us
  %polly.indvar78.us.us = phi i64 [ %polly.indvar_next79.us.us, %polly.loop_exit85.loopexit.us.us ], [ 0, %polly.loop_header74.us.us.preheader ]
  %31 = add nuw nsw i64 %polly.indvar78.us.us, %6
  %32 = mul i64 %31, %width
  %33 = add i64 %32, %24
  br i1 %min.iters.check, label %polly.loop_header83.us.us.preheader, label %min.iters.checked

polly.loop_header83.us.us.preheader:              ; preds = %middle.block, %min.iters.checked, %polly.loop_header74.us.us
  %polly.indvar87.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %polly.loop_header74.us.us ], [ %n.vec, %middle.block ]
  br label %polly.loop_header83.us.us

min.iters.checked:                                ; preds = %polly.loop_header74.us.us
  br i1 %cmp.zero, label %polly.loop_header83.us.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert114 = insertelement <2 x i64> undef, i64 %31, i32 0
  %broadcast.splat115 = shufflevector <2 x i64> %broadcast.splatinsert114, <2 x i64> undef, <2 x i32> zeroinitializer
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %34 = add i64 %32, %24
  %35 = getelementptr i64, i64* %call1, i64 %34
  %36 = bitcast i64* %35 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %36, align 8, !alias.scope !12, !noalias !14
  %37 = getelementptr i64, i64* %35, i64 2
  %38 = bitcast i64* %37 to <2 x i64>*
  %wide.load113.prol = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !12, !noalias !14
  %39 = add nsw <2 x i64> %wide.load.prol, %broadcast.splat115
  %40 = add nsw <2 x i64> %wide.load113.prol, %broadcast.splat115
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
  %44 = getelementptr i64, i64* %call1, i64 %43
  %45 = bitcast i64* %44 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !12, !noalias !14
  %46 = getelementptr i64, i64* %44, i64 2
  %47 = bitcast i64* %46 to <2 x i64>*
  %wide.load113 = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !12, !noalias !14
  %48 = add nsw <2 x i64> %wide.load, %broadcast.splat115
  %49 = add nsw <2 x i64> %wide.load113, %broadcast.splat115
  %50 = bitcast i64* %44 to <2 x i64>*
  store <2 x i64> %48, <2 x i64>* %50, align 8, !alias.scope !12, !noalias !14
  %51 = bitcast i64* %46 to <2 x i64>*
  store <2 x i64> %49, <2 x i64>* %51, align 8, !alias.scope !12, !noalias !14
  %index.next = add i64 %index, 4
  %52 = add i64 %33, %index.next
  %53 = getelementptr i64, i64* %call1, i64 %52
  %54 = bitcast i64* %53 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !12, !noalias !14
  %55 = getelementptr i64, i64* %53, i64 2
  %56 = bitcast i64* %55 to <2 x i64>*
  %wide.load113.1 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !12, !noalias !14
  %57 = add nsw <2 x i64> %wide.load.1, %broadcast.splat115
  %58 = add nsw <2 x i64> %wide.load113.1, %broadcast.splat115
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
  br i1 %cmp.n, label %polly.loop_exit85.loopexit.us.us, label %polly.loop_header83.us.us.preheader

polly.loop_exit85.loopexit.us.us.loopexit:        ; preds = %polly.loop_header83.us.us
  br label %polly.loop_exit85.loopexit.us.us

polly.loop_exit85.loopexit.us.us:                 ; preds = %polly.loop_exit85.loopexit.us.us.loopexit, %middle.block
  %polly.indvar_next79.us.us = add nuw nsw i64 %polly.indvar78.us.us, 1
  %polly.loop_cond81.us.us = icmp sgt i64 %polly.indvar78.us.us, %polly.adjust_ub80
  br i1 %polly.loop_cond81.us.us, label %polly.loop_exit76.loopexit.us.loopexit, label %polly.loop_header74.us.us

polly.loop_header83.us.us:                        ; preds = %polly.loop_header83.us.us.preheader, %polly.loop_header83.us.us
  %polly.indvar87.us.us = phi i64 [ %polly.indvar_next88.us.us, %polly.loop_header83.us.us ], [ %polly.indvar87.us.us.ph, %polly.loop_header83.us.us.preheader ]
  %62 = add i64 %33, %polly.indvar87.us.us
  %scevgep.us.us = getelementptr i64, i64* %call1, i64 %62
  %_p_scalar_.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !12, !noalias !14
  %p_add8.us.us = add nsw i64 %_p_scalar_.us.us, %31
  store i64 %p_add8.us.us, i64* %scevgep.us.us, align 8, !alias.scope !12, !noalias !14
  %polly.indvar_next88.us.us = add nuw nsw i64 %polly.indvar87.us.us, 1
  %polly.loop_cond90.us.us = icmp sgt i64 %polly.indvar87.us.us, %polly.adjust_ub89.us
  br i1 %polly.loop_cond90.us.us, label %polly.loop_exit85.loopexit.us.us.loopexit, label %polly.loop_header83.us.us, !llvm.loop !18

polly.loop_exit67.loopexit:                       ; preds = %polly.loop_exit76.loopexit.us
  br label %polly.loop_exit67

polly.loop_exit67:                                ; preds = %polly.loop_exit67.loopexit, %polly.loop_header65.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond110 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond110, label %blklab2.loopexit, label %polly.loop_header
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
  %xtraiter301 = and i64 %0, 1
  %lcmp.mod302 = icmp eq i64 %xtraiter301, 0
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
  br i1 %lcmp.mod302, label %if.end19.us.us.prol.loopexit.unr-lcssa, label %if.end19.us.us.prol.preheader

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
  br i1 %exitcond123.us, label %blklab13.loopexit296, label %while.cond10.preheader.us

blklab13.loopexit:                                ; preds = %polly.loop_exit188
  br label %blklab13

blklab13.loopexit296:                             ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %blklab13

blklab13:                                         ; preds = %blklab13.loopexit296, %blklab13.loopexit, %while.cond10.preheader.preheader, %polly.start, %entry
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
  %ident.check = icmp eq i64 %0, 1
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit188, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit188 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard189, label %polly.loop_header186.preheader, label %polly.loop_exit188

polly.loop_header186.preheader:                   ; preds = %polly.loop_header
  %29 = shl nsw i64 %polly.indvar, 5
  %30 = sub nsw i64 %1, %29
  %31 = add nsw i64 %30, -1
  %32 = icmp slt i64 %31, 31
  %33 = select i1 %32, i64 %31, i64 31
  %polly.loop_guard205 = icmp sgt i64 %33, -1
  %polly.adjust_ub208 = add i64 %33, -1
  br label %polly.loop_header186

polly.loop_exit188.loopexit:                      ; preds = %polly.loop_exit196
  br label %polly.loop_exit188

polly.loop_exit188:                               ; preds = %polly.loop_exit188.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond286 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond286, label %blklab13.loopexit, label %polly.loop_header

polly.loop_header186:                             ; preds = %polly.loop_exit196, %polly.loop_header186.preheader
  %polly.indvar190 = phi i64 [ %polly.indvar_next191, %polly.loop_exit196 ], [ 0, %polly.loop_header186.preheader ]
  %34 = shl nsw i64 %polly.indvar190, 5
  %35 = sub nsw i64 %0, %34
  %36 = add nsw i64 %35, -1
  %37 = icmp slt i64 %36, 31
  %38 = select i1 %37, i64 %36, i64 31
  %polly.loop_guard214 = icmp sgt i64 %38, -1
  %polly.adjust_ub217 = add i64 %38, -1
  br label %polly.loop_header194

polly.loop_exit196:                               ; preds = %polly.loop_exit204
  %polly.indvar_next191 = add nuw nsw i64 %polly.indvar190, 1
  %exitcond285 = icmp eq i64 %polly.indvar190, %polly.fdiv_q.shr184
  br i1 %exitcond285, label %polly.loop_exit188.loopexit, label %polly.loop_header186

polly.loop_header194:                             ; preds = %polly.loop_exit204, %polly.loop_header186
  %polly.indvar197 = phi i64 [ 0, %polly.loop_header186 ], [ %polly.indvar_next198, %polly.loop_exit204 ]
  %39 = shl i64 %polly.indvar197, 5
  %40 = sub i64 %39, %0
  %41 = icmp sgt i64 %40, -32
  %smax299 = select i1 %41, i64 %40, i64 -32
  %42 = sub i64 -2, %smax299
  %43 = icmp sgt i64 %42, -1
  %smax300 = select i1 %43, i64 %42, i64 -1
  %44 = add i64 %smax300, -2
  %45 = lshr i64 %44, 2
  %46 = shl i64 %polly.indvar197, 5
  %47 = sub i64 %46, %0
  %48 = icmp sgt i64 %47, -32
  %smax = select i1 %48, i64 %47, i64 -32
  %49 = sub i64 -2, %smax
  %50 = icmp sgt i64 %49, -1
  %smax289 = select i1 %50, i64 %49, i64 -1
  %51 = add i64 %smax289, 2
  br i1 %polly.loop_guard205, label %polly.loop_header202.preheader, label %polly.loop_exit204

polly.loop_header202.preheader:                   ; preds = %polly.loop_header194
  %52 = shl nsw i64 %polly.indvar197, 5
  %53 = sub nsw i64 %0, %52
  %54 = add nsw i64 %53, -1
  %55 = icmp slt i64 %54, 31
  %56 = select i1 %55, i64 %54, i64 31
  %polly.loop_guard223 = icmp sgt i64 %56, -1
  %polly.adjust_ub226 = add i64 %56, -1
  br i1 %polly.loop_guard214, label %polly.loop_header202.us.preheader, label %polly.loop_exit204

polly.loop_header202.us.preheader:                ; preds = %polly.loop_header202.preheader
  %min.iters.check = icmp ult i64 %51, 4
  %n.vec = and i64 %51, -4
  %cmp.zero = icmp ne i64 %n.vec, 0
  %or.cond = and i1 %cmp.zero, %ident.check
  %57 = and i64 %45, 1
  %lcmp.mod = icmp eq i64 %57, 0
  %58 = mul i64 %52, %0
  %59 = icmp eq i64 %45, 0
  %cmp.n = icmp eq i64 %51, %n.vec
  br label %polly.loop_header202.us

polly.loop_header202.us:                          ; preds = %polly.loop_header202.us.preheader, %polly.loop_exit213.loopexit.us
  %polly.indvar206.us = phi i64 [ %polly.indvar_next207.us, %polly.loop_exit213.loopexit.us ], [ 0, %polly.loop_header202.us.preheader ]
  %60 = add nuw nsw i64 %polly.indvar206.us, %29
  %61 = mul i64 %60, %0
  br i1 %polly.loop_guard223, label %polly.loop_header211.us.us.preheader, label %polly.loop_exit213.loopexit.us

polly.loop_header211.us.us.preheader:             ; preds = %polly.loop_header202.us
  %62 = add i64 %52, %61
  %63 = getelementptr i64, i64* %call6, i64 %62
  %64 = bitcast i64* %63 to <2 x i64>*
  %65 = getelementptr i64, i64* %63, i64 2
  %66 = bitcast i64* %65 to <2 x i64>*
  br label %polly.loop_header211.us.us

polly.loop_exit213.loopexit.us.loopexit:          ; preds = %polly.loop_exit222.loopexit.us.us
  br label %polly.loop_exit213.loopexit.us

polly.loop_exit213.loopexit.us:                   ; preds = %polly.loop_exit213.loopexit.us.loopexit, %polly.loop_header202.us
  %polly.indvar_next207.us = add nuw nsw i64 %polly.indvar206.us, 1
  %polly.loop_cond209.us = icmp sgt i64 %polly.indvar206.us, %polly.adjust_ub208
  br i1 %polly.loop_cond209.us, label %polly.loop_exit204.loopexit, label %polly.loop_header202.us

polly.loop_header211.us.us:                       ; preds = %polly.loop_header211.us.us.preheader, %polly.loop_exit222.loopexit.us.us
  %polly.indvar215.us.us = phi i64 [ %polly.indvar_next216.us.us, %polly.loop_exit222.loopexit.us.us ], [ 0, %polly.loop_header211.us.us.preheader ]
  %67 = add nuw nsw i64 %polly.indvar215.us.us, %34
  %68 = add i64 %67, %61
  %scevgep.us.us = getelementptr i64, i64* %call3, i64 %68
  %scevgep.promoted.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !20, !noalias !22
  br i1 %min.iters.check, label %polly.loop_header220.us.us.preheader, label %min.iters.checked

polly.loop_header220.us.us.preheader:             ; preds = %min.iters.checked, %middle.block, %polly.loop_header211.us.us
  %p_add28233.us.us.ph = phi i64 [ %scevgep.promoted.us.us, %min.iters.checked ], [ %scevgep.promoted.us.us, %polly.loop_header211.us.us ], [ %111, %middle.block ]
  %polly.indvar224.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %polly.loop_header211.us.us ], [ %n.vec, %middle.block ]
  br label %polly.loop_header220.us.us

min.iters.checked:                                ; preds = %polly.loop_header211.us.us
  %69 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %scevgep.promoted.us.us, i32 0
  br i1 %or.cond, label %vector.body.preheader, label %polly.loop_header220.us.us.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %wide.load.prol = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !24, !noalias !25
  %wide.load292.prol = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !24, !noalias !25
  %70 = add i64 %58, %67
  %71 = getelementptr i64, i64* %call9, i64 %70
  %72 = bitcast i64* %71 to <2 x i64>*
  %wide.load293.prol = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !23, !noalias !26
  %73 = getelementptr i64, i64* %71, i64 2
  %74 = bitcast i64* %73 to <2 x i64>*
  %wide.load294.prol = load <2 x i64>, <2 x i64>* %74, align 8, !alias.scope !23, !noalias !26
  %75 = mul nsw <2 x i64> %wide.load293.prol, %wide.load.prol
  %76 = mul nsw <2 x i64> %wide.load294.prol, %wide.load292.prol
  %77 = add nsw <2 x i64> %75, %69
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %.lcssa297.unr.ph = phi <2 x i64> [ %77, %vector.body.prol ], [ undef, %vector.body.preheader ]
  %.lcssa.unr.ph = phi <2 x i64> [ %76, %vector.body.prol ], [ undef, %vector.body.preheader ]
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  %vec.phi.unr.ph = phi <2 x i64> [ %77, %vector.body.prol ], [ %69, %vector.body.preheader ]
  %vec.phi290.unr.ph = phi <2 x i64> [ %76, %vector.body.prol ], [ zeroinitializer, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  br i1 %59, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %vec.phi = phi <2 x i64> [ %vec.phi.unr.ph, %vector.body.preheader.new ], [ %108, %vector.body ]
  %vec.phi290 = phi <2 x i64> [ %vec.phi290.unr.ph, %vector.body.preheader.new ], [ %109, %vector.body ]
  %78 = add nsw i64 %index, %52
  %79 = add i64 %78, %61
  %80 = getelementptr i64, i64* %call6, i64 %79
  %81 = bitcast i64* %80 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !24, !noalias !25
  %82 = getelementptr i64, i64* %80, i64 2
  %83 = bitcast i64* %82 to <2 x i64>*
  %wide.load292 = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !24, !noalias !25
  %84 = mul i64 %78, %0
  %85 = add i64 %84, %67
  %86 = getelementptr i64, i64* %call9, i64 %85
  %87 = bitcast i64* %86 to <2 x i64>*
  %wide.load293 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !23, !noalias !26
  %88 = getelementptr i64, i64* %86, i64 2
  %89 = bitcast i64* %88 to <2 x i64>*
  %wide.load294 = load <2 x i64>, <2 x i64>* %89, align 8, !alias.scope !23, !noalias !26
  %90 = mul nsw <2 x i64> %wide.load293, %wide.load
  %91 = mul nsw <2 x i64> %wide.load294, %wide.load292
  %92 = add nsw <2 x i64> %90, %vec.phi
  %93 = add nsw <2 x i64> %91, %vec.phi290
  %index.next = add i64 %index, 4
  %94 = add nsw i64 %index.next, %52
  %95 = add i64 %94, %61
  %96 = getelementptr i64, i64* %call6, i64 %95
  %97 = bitcast i64* %96 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !24, !noalias !25
  %98 = getelementptr i64, i64* %96, i64 2
  %99 = bitcast i64* %98 to <2 x i64>*
  %wide.load292.1 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !24, !noalias !25
  %100 = mul i64 %94, %0
  %101 = add i64 %100, %67
  %102 = getelementptr i64, i64* %call9, i64 %101
  %103 = bitcast i64* %102 to <2 x i64>*
  %wide.load293.1 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !23, !noalias !26
  %104 = getelementptr i64, i64* %102, i64 2
  %105 = bitcast i64* %104 to <2 x i64>*
  %wide.load294.1 = load <2 x i64>, <2 x i64>* %105, align 8, !alias.scope !23, !noalias !26
  %106 = mul nsw <2 x i64> %wide.load293.1, %wide.load.1
  %107 = mul nsw <2 x i64> %wide.load294.1, %wide.load292.1
  %108 = add nsw <2 x i64> %106, %92
  %109 = add nsw <2 x i64> %107, %93
  %index.next.1 = add i64 %index, 8
  %110 = icmp eq i64 %index.next.1, %n.vec
  br i1 %110, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !27

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %.lcssa297 = phi <2 x i64> [ %.lcssa297.unr.ph, %vector.body.prol.loopexit ], [ %108, %middle.block.unr-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.unr.ph, %vector.body.prol.loopexit ], [ %109, %middle.block.unr-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa, %.lcssa297
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx295 = add <2 x i64> %bin.rdx, %rdx.shuf
  %111 = extractelement <2 x i64> %bin.rdx295, i32 0
  br i1 %cmp.n, label %polly.loop_exit222.loopexit.us.us, label %polly.loop_header220.us.us.preheader

polly.loop_exit222.loopexit.us.us.loopexit:       ; preds = %polly.loop_header220.us.us
  br label %polly.loop_exit222.loopexit.us.us

polly.loop_exit222.loopexit.us.us:                ; preds = %polly.loop_exit222.loopexit.us.us.loopexit, %middle.block
  %p_add28.us.us.lcssa = phi i64 [ %111, %middle.block ], [ %p_add28.us.us, %polly.loop_exit222.loopexit.us.us.loopexit ]
  store i64 %p_add28.us.us.lcssa, i64* %scevgep.us.us, align 8, !alias.scope !20, !noalias !22
  %polly.indvar_next216.us.us = add nuw nsw i64 %polly.indvar215.us.us, 1
  %polly.loop_cond218.us.us = icmp sgt i64 %polly.indvar215.us.us, %polly.adjust_ub217
  br i1 %polly.loop_cond218.us.us, label %polly.loop_exit213.loopexit.us.loopexit, label %polly.loop_header211.us.us

polly.loop_header220.us.us:                       ; preds = %polly.loop_header220.us.us.preheader, %polly.loop_header220.us.us
  %p_add28233.us.us = phi i64 [ %p_add28.us.us, %polly.loop_header220.us.us ], [ %p_add28233.us.us.ph, %polly.loop_header220.us.us.preheader ]
  %polly.indvar224.us.us = phi i64 [ %polly.indvar_next225.us.us, %polly.loop_header220.us.us ], [ %polly.indvar224.us.us.ph, %polly.loop_header220.us.us.preheader ]
  %112 = add nsw i64 %polly.indvar224.us.us, %52
  %113 = add i64 %112, %61
  %scevgep228.us.us = getelementptr i64, i64* %call6, i64 %113
  %_p_scalar_229.us.us = load i64, i64* %scevgep228.us.us, align 8, !alias.scope !24, !noalias !25
  %114 = mul i64 %112, %0
  %115 = add i64 %114, %67
  %scevgep230.us.us = getelementptr i64, i64* %call9, i64 %115
  %_p_scalar_231.us.us = load i64, i64* %scevgep230.us.us, align 8, !alias.scope !23, !noalias !26
  %p_mul27.us.us = mul nsw i64 %_p_scalar_231.us.us, %_p_scalar_229.us.us
  %p_add28.us.us = add nsw i64 %p_mul27.us.us, %p_add28233.us.us
  %polly.indvar_next225.us.us = add nuw nsw i64 %polly.indvar224.us.us, 1
  %polly.loop_cond227.us.us = icmp sgt i64 %polly.indvar224.us.us, %polly.adjust_ub226
  br i1 %polly.loop_cond227.us.us, label %polly.loop_exit222.loopexit.us.us.loopexit, label %polly.loop_header220.us.us, !llvm.loop !28

polly.loop_exit204.loopexit:                      ; preds = %polly.loop_exit213.loopexit.us
  br label %polly.loop_exit204

polly.loop_exit204:                               ; preds = %polly.loop_exit204.loopexit, %polly.loop_header202.preheader, %polly.loop_header194
  %polly.indvar_next198 = add nuw nsw i64 %polly.indvar197, 1
  %exitcond = icmp eq i64 %polly.indvar197, %pexp.p_div_q
  br i1 %exitcond, label %polly.loop_exit196, label %polly.loop_header194
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
!12 = distinct !{!12, !13, !"polly.alias.scope.call1"}
!13 = distinct !{!13, !"polly.alias.scope.domain"}
!14 = !{}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !19, !16, !17}
!19 = !{!"llvm.loop.unroll.runtime.disable"}
!20 = distinct !{!20, !21, !"polly.alias.scope.call3"}
!21 = distinct !{!21, !"polly.alias.scope.domain"}
!22 = !{!23, !24}
!23 = distinct !{!23, !21, !"polly.alias.scope.call9"}
!24 = distinct !{!24, !21, !"polly.alias.scope.call6"}
!25 = !{!23, !20}
!26 = !{!24, !20}
!27 = distinct !{!27, !16, !17}
!28 = distinct !{!28, !16, !17}
