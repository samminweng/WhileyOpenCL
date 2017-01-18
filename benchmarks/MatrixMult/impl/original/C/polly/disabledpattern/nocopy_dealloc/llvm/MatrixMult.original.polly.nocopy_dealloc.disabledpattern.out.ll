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
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit98, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit98 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard99, label %polly.loop_header96.preheader, label %polly.loop_exit98

polly.loop_header96.preheader:                    ; preds = %polly.loop_header
  %6 = shl nsw i64 %polly.indvar, 5
  %7 = sub nsw i64 %height, %6
  %8 = add nsw i64 %7, -1
  %9 = icmp slt i64 %8, 31
  %10 = select i1 %9, i64 %8, i64 31
  %polly.loop_guard108 = icmp sgt i64 %10, -1
  %polly.adjust_ub111 = add i64 %10, -1
  br i1 %polly.loop_guard108, label %polly.loop_header96.us.preheader, label %polly.loop_exit98

polly.loop_header96.us.preheader:                 ; preds = %polly.loop_header96.preheader
  br label %polly.loop_header96.us

polly.loop_header96.us:                           ; preds = %polly.loop_header96.us.preheader, %polly.loop_exit107.loopexit.us
  %polly.indvar100.us = phi i64 [ %polly.indvar_next101.us, %polly.loop_exit107.loopexit.us ], [ 0, %polly.loop_header96.us.preheader ]
  %11 = shl i64 %polly.indvar100.us, 5
  %12 = sub i64 %11, %width
  %13 = icmp sgt i64 %12, -32
  %smax147 = select i1 %13, i64 %12, i64 -32
  %14 = sub i64 -2, %smax147
  %15 = icmp sgt i64 %14, -1
  %smax148 = select i1 %15, i64 %14, i64 -1
  %16 = add i64 %smax148, -2
  %17 = lshr i64 %16, 2
  %18 = shl i64 %polly.indvar100.us, 5
  %19 = sub i64 %18, %width
  %20 = icmp sgt i64 %19, -32
  %smax = select i1 %20, i64 %19, i64 -32
  %21 = sub i64 -2, %smax
  %22 = icmp sgt i64 %21, -1
  %smax142 = select i1 %22, i64 %21, i64 -1
  %23 = add i64 %smax142, 2
  %24 = shl nsw i64 %polly.indvar100.us, 5
  %25 = sub nsw i64 %width, %24
  %26 = add nsw i64 %25, -1
  %27 = icmp slt i64 %26, 31
  %28 = select i1 %27, i64 %26, i64 31
  %polly.loop_guard117.us = icmp sgt i64 %28, -1
  %polly.adjust_ub120.us = add i64 %28, -1
  br i1 %polly.loop_guard117.us, label %polly.loop_header105.us.us.preheader, label %polly.loop_exit107.loopexit.us

polly.loop_header105.us.us.preheader:             ; preds = %polly.loop_header96.us
  %min.iters.check = icmp ult i64 %23, 4
  %n.vec = and i64 %23, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %29 = and i64 %17, 1
  %lcmp.mod = icmp eq i64 %29, 0
  %30 = icmp eq i64 %17, 0
  %cmp.n = icmp eq i64 %23, %n.vec
  br label %polly.loop_header105.us.us

polly.loop_exit107.loopexit.us.loopexit:          ; preds = %polly.loop_exit116.loopexit.us.us
  br label %polly.loop_exit107.loopexit.us

polly.loop_exit107.loopexit.us:                   ; preds = %polly.loop_exit107.loopexit.us.loopexit, %polly.loop_header96.us
  %polly.indvar_next101.us = add nuw nsw i64 %polly.indvar100.us, 1
  %exitcond = icmp eq i64 %polly.indvar100.us, %polly.fdiv_q.shr94
  br i1 %exitcond, label %polly.loop_exit98.loopexit, label %polly.loop_header96.us

polly.loop_header105.us.us:                       ; preds = %polly.loop_header105.us.us.preheader, %polly.loop_exit116.loopexit.us.us
  %polly.indvar109.us.us = phi i64 [ %polly.indvar_next110.us.us, %polly.loop_exit116.loopexit.us.us ], [ 0, %polly.loop_header105.us.us.preheader ]
  %31 = add nuw nsw i64 %polly.indvar109.us.us, %6
  %32 = mul i64 %31, %width
  %33 = add i64 %32, %24
  br i1 %min.iters.check, label %polly.loop_header114.us.us.preheader, label %min.iters.checked

polly.loop_header114.us.us.preheader:             ; preds = %middle.block, %min.iters.checked, %polly.loop_header105.us.us
  %polly.indvar118.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %polly.loop_header105.us.us ], [ %n.vec, %middle.block ]
  br label %polly.loop_header114.us.us

min.iters.checked:                                ; preds = %polly.loop_header105.us.us
  br i1 %cmp.zero, label %polly.loop_header114.us.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert145 = insertelement <2 x i64> undef, i64 %31, i32 0
  %broadcast.splat146 = shufflevector <2 x i64> %broadcast.splatinsert145, <2 x i64> undef, <2 x i32> zeroinitializer
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
  %wide.load144.prol = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !12, !noalias !14
  %39 = add nsw <2 x i64> %wide.load.prol, %broadcast.splat146
  %40 = add nsw <2 x i64> %wide.load144.prol, %broadcast.splat146
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
  %wide.load144 = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !12, !noalias !14
  %48 = add nsw <2 x i64> %wide.load, %broadcast.splat146
  %49 = add nsw <2 x i64> %wide.load144, %broadcast.splat146
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
  %wide.load144.1 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !12, !noalias !14
  %57 = add nsw <2 x i64> %wide.load.1, %broadcast.splat146
  %58 = add nsw <2 x i64> %wide.load144.1, %broadcast.splat146
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
  br i1 %cmp.n, label %polly.loop_exit116.loopexit.us.us, label %polly.loop_header114.us.us.preheader

polly.loop_exit116.loopexit.us.us.loopexit:       ; preds = %polly.loop_header114.us.us
  br label %polly.loop_exit116.loopexit.us.us

polly.loop_exit116.loopexit.us.us:                ; preds = %polly.loop_exit116.loopexit.us.us.loopexit, %middle.block
  %polly.indvar_next110.us.us = add nuw nsw i64 %polly.indvar109.us.us, 1
  %polly.loop_cond112.us.us = icmp sgt i64 %polly.indvar109.us.us, %polly.adjust_ub111
  br i1 %polly.loop_cond112.us.us, label %polly.loop_exit107.loopexit.us.loopexit, label %polly.loop_header105.us.us

polly.loop_header114.us.us:                       ; preds = %polly.loop_header114.us.us.preheader, %polly.loop_header114.us.us
  %polly.indvar118.us.us = phi i64 [ %polly.indvar_next119.us.us, %polly.loop_header114.us.us ], [ %polly.indvar118.us.us.ph, %polly.loop_header114.us.us.preheader ]
  %62 = add i64 %33, %polly.indvar118.us.us
  %scevgep.us.us = getelementptr i64, i64* %call, i64 %62
  %_p_scalar_.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !12, !noalias !14
  %p_add16.us.us = add nsw i64 %_p_scalar_.us.us, %31
  store i64 %p_add16.us.us, i64* %scevgep.us.us, align 8, !alias.scope !12, !noalias !14
  %polly.indvar_next119.us.us = add nuw nsw i64 %polly.indvar118.us.us, 1
  %polly.loop_cond121.us.us = icmp sgt i64 %polly.indvar118.us.us, %polly.adjust_ub120.us
  br i1 %polly.loop_cond121.us.us, label %polly.loop_exit116.loopexit.us.us.loopexit, label %polly.loop_header114.us.us, !llvm.loop !18

polly.loop_exit98.loopexit:                       ; preds = %polly.loop_exit107.loopexit.us
  br label %polly.loop_exit98

polly.loop_exit98:                                ; preds = %polly.loop_exit98.loopexit, %polly.loop_header96.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond141 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond141, label %if.end24.loopexit, label %polly.loop_header
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
  %xtraiter387 = and i64 %0, 1
  %lcmp.mod388 = icmp eq i64 %xtraiter387, 0
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
  br i1 %lcmp.mod388, label %if.end43.us.us.prol.loopexit.unr-lcssa, label %if.end43.us.us.prol.preheader

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
  br i1 %exitcond202.us, label %if.end61.loopexit382, label %while.cond34.preheader.us

if.end61.loopexit:                                ; preds = %polly.loop_exit274
  br label %if.end61

if.end61.loopexit382:                             ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %if.end61

if.end61:                                         ; preds = %if.end61.loopexit382, %if.end61.loopexit, %while.cond34.preheader.preheader, %polly.start, %entry
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
  %ident.check = icmp eq i64 %0, 1
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit274, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit274 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard275, label %polly.loop_header272.preheader, label %polly.loop_exit274

polly.loop_header272.preheader:                   ; preds = %polly.loop_header
  %33 = shl nsw i64 %polly.indvar, 5
  %34 = sub nsw i64 %1, %33
  %35 = add nsw i64 %34, -1
  %36 = icmp slt i64 %35, 31
  %37 = select i1 %36, i64 %35, i64 31
  %polly.loop_guard291 = icmp sgt i64 %37, -1
  %polly.adjust_ub294 = add i64 %37, -1
  br label %polly.loop_header272

polly.loop_exit274.loopexit:                      ; preds = %polly.loop_exit282
  br label %polly.loop_exit274

polly.loop_exit274:                               ; preds = %polly.loop_exit274.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond372 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond372, label %if.end61.loopexit, label %polly.loop_header

polly.loop_header272:                             ; preds = %polly.loop_exit282, %polly.loop_header272.preheader
  %polly.indvar276 = phi i64 [ %polly.indvar_next277, %polly.loop_exit282 ], [ 0, %polly.loop_header272.preheader ]
  %38 = shl nsw i64 %polly.indvar276, 5
  %39 = sub nsw i64 %0, %38
  %40 = add nsw i64 %39, -1
  %41 = icmp slt i64 %40, 31
  %42 = select i1 %41, i64 %40, i64 31
  %polly.loop_guard300 = icmp sgt i64 %42, -1
  %polly.adjust_ub303 = add i64 %42, -1
  br label %polly.loop_header280

polly.loop_exit282:                               ; preds = %polly.loop_exit290
  %polly.indvar_next277 = add nuw nsw i64 %polly.indvar276, 1
  %exitcond371 = icmp eq i64 %polly.indvar276, %polly.fdiv_q.shr270
  br i1 %exitcond371, label %polly.loop_exit274.loopexit, label %polly.loop_header272

polly.loop_header280:                             ; preds = %polly.loop_exit290, %polly.loop_header272
  %polly.indvar283 = phi i64 [ 0, %polly.loop_header272 ], [ %polly.indvar_next284, %polly.loop_exit290 ]
  %43 = shl i64 %polly.indvar283, 5
  %44 = sub i64 %43, %0
  %45 = icmp sgt i64 %44, -32
  %smax385 = select i1 %45, i64 %44, i64 -32
  %46 = sub i64 -2, %smax385
  %47 = icmp sgt i64 %46, -1
  %smax386 = select i1 %47, i64 %46, i64 -1
  %48 = add i64 %smax386, -2
  %49 = lshr i64 %48, 2
  %50 = shl i64 %polly.indvar283, 5
  %51 = sub i64 %50, %0
  %52 = icmp sgt i64 %51, -32
  %smax = select i1 %52, i64 %51, i64 -32
  %53 = sub i64 -2, %smax
  %54 = icmp sgt i64 %53, -1
  %smax375 = select i1 %54, i64 %53, i64 -1
  %55 = add i64 %smax375, 2
  br i1 %polly.loop_guard291, label %polly.loop_header288.preheader, label %polly.loop_exit290

polly.loop_header288.preheader:                   ; preds = %polly.loop_header280
  %56 = shl nsw i64 %polly.indvar283, 5
  %57 = sub nsw i64 %0, %56
  %58 = add nsw i64 %57, -1
  %59 = icmp slt i64 %58, 31
  %60 = select i1 %59, i64 %58, i64 31
  %polly.loop_guard309 = icmp sgt i64 %60, -1
  %polly.adjust_ub312 = add i64 %60, -1
  br i1 %polly.loop_guard300, label %polly.loop_header288.us.preheader, label %polly.loop_exit290

polly.loop_header288.us.preheader:                ; preds = %polly.loop_header288.preheader
  %min.iters.check = icmp ult i64 %55, 4
  %n.vec = and i64 %55, -4
  %cmp.zero = icmp ne i64 %n.vec, 0
  %or.cond = and i1 %cmp.zero, %ident.check
  %61 = and i64 %49, 1
  %lcmp.mod = icmp eq i64 %61, 0
  %62 = mul i64 %56, %0
  %63 = icmp eq i64 %49, 0
  %cmp.n = icmp eq i64 %55, %n.vec
  br label %polly.loop_header288.us

polly.loop_header288.us:                          ; preds = %polly.loop_header288.us.preheader, %polly.loop_exit299.loopexit.us
  %polly.indvar292.us = phi i64 [ %polly.indvar_next293.us, %polly.loop_exit299.loopexit.us ], [ 0, %polly.loop_header288.us.preheader ]
  %64 = add nuw nsw i64 %polly.indvar292.us, %33
  %65 = mul i64 %64, %0
  br i1 %polly.loop_guard309, label %polly.loop_header297.us.us.preheader, label %polly.loop_exit299.loopexit.us

polly.loop_header297.us.us.preheader:             ; preds = %polly.loop_header288.us
  %66 = add i64 %56, %65
  %67 = getelementptr i64, i64* %2, i64 %66
  %68 = bitcast i64* %67 to <2 x i64>*
  %69 = getelementptr i64, i64* %67, i64 2
  %70 = bitcast i64* %69 to <2 x i64>*
  br label %polly.loop_header297.us.us

polly.loop_exit299.loopexit.us.loopexit:          ; preds = %polly.loop_exit308.loopexit.us.us
  br label %polly.loop_exit299.loopexit.us

polly.loop_exit299.loopexit.us:                   ; preds = %polly.loop_exit299.loopexit.us.loopexit, %polly.loop_header288.us
  %polly.indvar_next293.us = add nuw nsw i64 %polly.indvar292.us, 1
  %polly.loop_cond295.us = icmp sgt i64 %polly.indvar292.us, %polly.adjust_ub294
  br i1 %polly.loop_cond295.us, label %polly.loop_exit290.loopexit, label %polly.loop_header288.us

polly.loop_header297.us.us:                       ; preds = %polly.loop_header297.us.us.preheader, %polly.loop_exit308.loopexit.us.us
  %polly.indvar301.us.us = phi i64 [ %polly.indvar_next302.us.us, %polly.loop_exit308.loopexit.us.us ], [ 0, %polly.loop_header297.us.us.preheader ]
  %71 = add nuw nsw i64 %polly.indvar301.us.us, %38
  %72 = add i64 %71, %65
  %scevgep.us.us = getelementptr i64, i64* %call, i64 %72
  %scevgep.promoted.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !20, !noalias !22
  br i1 %min.iters.check, label %polly.loop_header306.us.us.preheader, label %min.iters.checked

polly.loop_header306.us.us.preheader:             ; preds = %min.iters.checked, %middle.block, %polly.loop_header297.us.us
  %p_add52319.us.us.ph = phi i64 [ %scevgep.promoted.us.us, %min.iters.checked ], [ %scevgep.promoted.us.us, %polly.loop_header297.us.us ], [ %115, %middle.block ]
  %polly.indvar310.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %polly.loop_header297.us.us ], [ %n.vec, %middle.block ]
  br label %polly.loop_header306.us.us

min.iters.checked:                                ; preds = %polly.loop_header297.us.us
  %73 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %scevgep.promoted.us.us, i32 0
  br i1 %or.cond, label %vector.body.preheader, label %polly.loop_header306.us.us.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %wide.load.prol = load <2 x i64>, <2 x i64>* %68, align 8, !alias.scope !23, !noalias !25
  %wide.load378.prol = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !23, !noalias !25
  %74 = add i64 %62, %71
  %75 = getelementptr i64, i64* %3, i64 %74
  %76 = bitcast i64* %75 to <2 x i64>*
  %wide.load379.prol = load <2 x i64>, <2 x i64>* %76, align 8, !alias.scope !24, !noalias !26
  %77 = getelementptr i64, i64* %75, i64 2
  %78 = bitcast i64* %77 to <2 x i64>*
  %wide.load380.prol = load <2 x i64>, <2 x i64>* %78, align 8, !alias.scope !24, !noalias !26
  %79 = mul nsw <2 x i64> %wide.load379.prol, %wide.load.prol
  %80 = mul nsw <2 x i64> %wide.load380.prol, %wide.load378.prol
  %81 = add nsw <2 x i64> %79, %73
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %.lcssa383.unr.ph = phi <2 x i64> [ %81, %vector.body.prol ], [ undef, %vector.body.preheader ]
  %.lcssa.unr.ph = phi <2 x i64> [ %80, %vector.body.prol ], [ undef, %vector.body.preheader ]
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  %vec.phi.unr.ph = phi <2 x i64> [ %81, %vector.body.prol ], [ %73, %vector.body.preheader ]
  %vec.phi376.unr.ph = phi <2 x i64> [ %80, %vector.body.prol ], [ zeroinitializer, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  br i1 %63, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %vec.phi = phi <2 x i64> [ %vec.phi.unr.ph, %vector.body.preheader.new ], [ %112, %vector.body ]
  %vec.phi376 = phi <2 x i64> [ %vec.phi376.unr.ph, %vector.body.preheader.new ], [ %113, %vector.body ]
  %82 = add nsw i64 %index, %56
  %83 = add i64 %82, %65
  %84 = getelementptr i64, i64* %2, i64 %83
  %85 = bitcast i64* %84 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !23, !noalias !25
  %86 = getelementptr i64, i64* %84, i64 2
  %87 = bitcast i64* %86 to <2 x i64>*
  %wide.load378 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !23, !noalias !25
  %88 = mul i64 %82, %0
  %89 = add i64 %88, %71
  %90 = getelementptr i64, i64* %3, i64 %89
  %91 = bitcast i64* %90 to <2 x i64>*
  %wide.load379 = load <2 x i64>, <2 x i64>* %91, align 8, !alias.scope !24, !noalias !26
  %92 = getelementptr i64, i64* %90, i64 2
  %93 = bitcast i64* %92 to <2 x i64>*
  %wide.load380 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !24, !noalias !26
  %94 = mul nsw <2 x i64> %wide.load379, %wide.load
  %95 = mul nsw <2 x i64> %wide.load380, %wide.load378
  %96 = add nsw <2 x i64> %94, %vec.phi
  %97 = add nsw <2 x i64> %95, %vec.phi376
  %index.next = add i64 %index, 4
  %98 = add nsw i64 %index.next, %56
  %99 = add i64 %98, %65
  %100 = getelementptr i64, i64* %2, i64 %99
  %101 = bitcast i64* %100 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !23, !noalias !25
  %102 = getelementptr i64, i64* %100, i64 2
  %103 = bitcast i64* %102 to <2 x i64>*
  %wide.load378.1 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !23, !noalias !25
  %104 = mul i64 %98, %0
  %105 = add i64 %104, %71
  %106 = getelementptr i64, i64* %3, i64 %105
  %107 = bitcast i64* %106 to <2 x i64>*
  %wide.load379.1 = load <2 x i64>, <2 x i64>* %107, align 8, !alias.scope !24, !noalias !26
  %108 = getelementptr i64, i64* %106, i64 2
  %109 = bitcast i64* %108 to <2 x i64>*
  %wide.load380.1 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !24, !noalias !26
  %110 = mul nsw <2 x i64> %wide.load379.1, %wide.load.1
  %111 = mul nsw <2 x i64> %wide.load380.1, %wide.load378.1
  %112 = add nsw <2 x i64> %110, %96
  %113 = add nsw <2 x i64> %111, %97
  %index.next.1 = add i64 %index, 8
  %114 = icmp eq i64 %index.next.1, %n.vec
  br i1 %114, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !27

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %.lcssa383 = phi <2 x i64> [ %.lcssa383.unr.ph, %vector.body.prol.loopexit ], [ %112, %middle.block.unr-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.unr.ph, %vector.body.prol.loopexit ], [ %113, %middle.block.unr-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa, %.lcssa383
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx381 = add <2 x i64> %bin.rdx, %rdx.shuf
  %115 = extractelement <2 x i64> %bin.rdx381, i32 0
  br i1 %cmp.n, label %polly.loop_exit308.loopexit.us.us, label %polly.loop_header306.us.us.preheader

polly.loop_exit308.loopexit.us.us.loopexit:       ; preds = %polly.loop_header306.us.us
  br label %polly.loop_exit308.loopexit.us.us

polly.loop_exit308.loopexit.us.us:                ; preds = %polly.loop_exit308.loopexit.us.us.loopexit, %middle.block
  %p_add52.us.us.lcssa = phi i64 [ %115, %middle.block ], [ %p_add52.us.us, %polly.loop_exit308.loopexit.us.us.loopexit ]
  store i64 %p_add52.us.us.lcssa, i64* %scevgep.us.us, align 8, !alias.scope !20, !noalias !22
  %polly.indvar_next302.us.us = add nuw nsw i64 %polly.indvar301.us.us, 1
  %polly.loop_cond304.us.us = icmp sgt i64 %polly.indvar301.us.us, %polly.adjust_ub303
  br i1 %polly.loop_cond304.us.us, label %polly.loop_exit299.loopexit.us.loopexit, label %polly.loop_header297.us.us

polly.loop_header306.us.us:                       ; preds = %polly.loop_header306.us.us.preheader, %polly.loop_header306.us.us
  %p_add52319.us.us = phi i64 [ %p_add52.us.us, %polly.loop_header306.us.us ], [ %p_add52319.us.us.ph, %polly.loop_header306.us.us.preheader ]
  %polly.indvar310.us.us = phi i64 [ %polly.indvar_next311.us.us, %polly.loop_header306.us.us ], [ %polly.indvar310.us.us.ph, %polly.loop_header306.us.us.preheader ]
  %116 = add nsw i64 %polly.indvar310.us.us, %56
  %117 = add i64 %116, %65
  %scevgep314.us.us = getelementptr i64, i64* %2, i64 %117
  %_p_scalar_315.us.us = load i64, i64* %scevgep314.us.us, align 8, !alias.scope !23, !noalias !25
  %118 = mul i64 %116, %0
  %119 = add i64 %118, %71
  %scevgep316.us.us = getelementptr i64, i64* %3, i64 %119
  %_p_scalar_317.us.us = load i64, i64* %scevgep316.us.us, align 8, !alias.scope !24, !noalias !26
  %p_mul51.us.us = mul nsw i64 %_p_scalar_317.us.us, %_p_scalar_315.us.us
  %p_add52.us.us = add nsw i64 %p_mul51.us.us, %p_add52319.us.us
  %polly.indvar_next311.us.us = add nuw nsw i64 %polly.indvar310.us.us, 1
  %polly.loop_cond313.us.us = icmp sgt i64 %polly.indvar310.us.us, %polly.adjust_ub312
  br i1 %polly.loop_cond313.us.us, label %polly.loop_exit308.loopexit.us.us.loopexit, label %polly.loop_header306.us.us, !llvm.loop !28

polly.loop_exit290.loopexit:                      ; preds = %polly.loop_exit299.loopexit.us
  br label %polly.loop_exit290

polly.loop_exit290:                               ; preds = %polly.loop_exit290.loopexit, %polly.loop_header288.preheader, %polly.loop_header280
  %polly.indvar_next284 = add nuw nsw i64 %polly.indvar283, 1
  %exitcond = icmp eq i64 %polly.indvar283, %pexp.p_div_q
  br i1 %exitcond, label %polly.loop_exit282, label %polly.loop_header280
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
!25 = !{!20, !24}
!26 = !{!23, !20}
!27 = distinct !{!27, !16, !17}
!28 = distinct !{!28, !16, !17}
