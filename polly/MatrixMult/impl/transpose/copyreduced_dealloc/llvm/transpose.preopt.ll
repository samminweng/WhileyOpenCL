; ModuleID = 'llvm/transpose.preopt.ll.tmp'
source_filename = "MatrixMult_transpose.c"
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
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 32) #6
  %0 = bitcast i8* %call to %struct.Matrix*
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 1
  %1 = load i64, i64* %data_size, align 8, !tbaa !1
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8
  %2 = bitcast i8* %data_size1 to i64*
  store i64 %1, i64* %2, align 8, !tbaa !1
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 0
  %3 = load i64*, i64** %data, align 8, !tbaa !7
  %call3 = tail call i64* @copy(i64* %3, i64 %1) #6
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
  br label %entry.split

entry.split:                                      ; preds = %entry
  %mul = shl i64 %_Matrix_size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %0 = bitcast i8* %call to %struct.Matrix**
  %cmp12 = icmp sgt i64 %_Matrix_size, 0
  br i1 %cmp12, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry.split
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry.split
  ret %struct.Matrix** %0

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.Matrix*, %struct.Matrix** %_Matrix, i64 %indvars.iv
  %1 = load %struct.Matrix*, %struct.Matrix** %arrayidx, align 8, !tbaa !9
  %call.i = tail call noalias i8* @malloc(i64 32) #6
  %data_size.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 1
  %2 = load i64, i64* %data_size.i, align 8, !tbaa !1
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %3 = bitcast i8* %data_size1.i to i64*
  store i64 %2, i64* %3, align 8, !tbaa !1
  %data.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 0
  %4 = load i64*, i64** %data.i, align 8, !tbaa !7
  %call3.i = tail call i64* @copy(i64* %4, i64 %2) #6
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
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = bitcast %struct.Matrix* %matrix to i8**
  %1 = load i8*, i8** %0, align 8, !tbaa !7
  tail call void @free(i8* %1) #6
  %2 = bitcast %struct.Matrix* %matrix to i8*
  tail call void @free(i8* %2) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define void @printf_Matrix(%struct.Matrix* nocapture readonly %matrix) local_unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %putchar = tail call i32 @putchar(i32 123) #6
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0))
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 0
  %0 = load i64*, i64** %data, align 8, !tbaa !7
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 1
  %1 = load i64, i64* %data_size, align 8, !tbaa !1
  tail call void @printf1DArray(i64* %0, i64 %1) #6
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0))
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 2
  %2 = load i64, i64* %width, align 8, !tbaa !10
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %2)
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0))
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 3
  %3 = load i64, i64* %height, align 8, !tbaa !11
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %3)
  %putchar10 = tail call i32 @putchar(i32 125) #6
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

declare void @printf1DArray(i64*, i64) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @matrix(i64 %width, i64 %height, i64* %data, i64 %data_size, i1 zeroext %data_dealloc) local_unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 32) #6
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
  br label %entry.split

entry.split:                                      ; preds = %entry
  %mul = mul nsw i64 %height, %width
  %conv1 = trunc i64 %mul to i32
  %call = tail call i64* @create1DArray(i32 0, i32 %conv1) #6
  %cmp85 = icmp sgt i64 %height, 0
  br i1 %cmp85, label %polly.start, label %if.end24

if.end24.loopexit:                                ; preds = %polly.loop_exit93
  br label %if.end24

if.end24:                                         ; preds = %if.end24.loopexit, %polly.start, %entry.split
  %call.i = tail call noalias i8* @malloc(i64 32) #6
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

polly.start:                                      ; preds = %entry.split
  %4 = add nsw i64 %height, -1
  %polly.fdiv_q.shr = ashr i64 %4, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %if.end24

polly.loop_header.preheader:                      ; preds = %polly.start
  %5 = add nsw i64 %width, -1
  %polly.fdiv_q.shr89 = ashr i64 %5, 5
  %polly.loop_guard94 = icmp sgt i64 %polly.fdiv_q.shr89, -1
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit93, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit93 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard94, label %polly.loop_header91.preheader, label %polly.loop_exit93

polly.loop_header91.preheader:                    ; preds = %polly.loop_header
  %6 = shl nsw i64 %polly.indvar, 5
  %7 = sub nsw i64 %height, %6
  %8 = add nsw i64 %7, -1
  %9 = icmp sgt i64 %8, 31
  %10 = select i1 %9, i64 31, i64 %8
  %polly.loop_guard103 = icmp sgt i64 %10, -1
  %polly.adjust_ub106 = add i64 %10, -1
  br i1 %polly.loop_guard103, label %polly.loop_header91.us.preheader, label %polly.loop_exit93

polly.loop_header91.us.preheader:                 ; preds = %polly.loop_header91.preheader
  br label %polly.loop_header91.us

polly.loop_header91.us:                           ; preds = %polly.loop_header91.us.preheader, %polly.loop_exit102.loopexit.us
  %polly.indvar95.us = phi i64 [ %polly.indvar_next96.us, %polly.loop_exit102.loopexit.us ], [ 0, %polly.loop_header91.us.preheader ]
  %11 = shl i64 %polly.indvar95.us, 5
  %12 = sub i64 %11, %width
  %13 = icmp sgt i64 %12, -32
  %smax144 = select i1 %13, i64 %12, i64 -32
  %14 = sub i64 -2, %smax144
  %15 = icmp sgt i64 %14, -1
  %smax145 = select i1 %15, i64 %14, i64 -1
  %16 = add i64 %smax145, -2
  %17 = lshr i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %19 = add i64 %smax145, 2
  %20 = sub nsw i64 %width, %11
  %21 = add nsw i64 %20, -1
  %22 = icmp sgt i64 %21, 31
  %23 = select i1 %22, i64 31, i64 %21
  %polly.loop_guard112.us = icmp sgt i64 %23, -1
  %polly.adjust_ub115.us = add i64 %23, -1
  br i1 %polly.loop_guard112.us, label %polly.loop_header100.us.us.preheader, label %polly.loop_exit102.loopexit.us

polly.loop_header100.us.us.preheader:             ; preds = %polly.loop_header91.us
  %min.iters.check = icmp ult i64 %19, 4
  %n.vec = and i64 %19, -4
  %xtraiter = and i64 %18, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %cmp.n = icmp eq i64 %19, %n.vec
  %unroll_iter = sub nsw i64 %18, %xtraiter
  br i1 %min.iters.check, label %polly.loop_header100.us.us.us.preheader, label %polly.loop_header100.us.us.preheader.split

polly.loop_header100.us.us.us.preheader:          ; preds = %polly.loop_header100.us.us.preheader
  br label %polly.loop_header100.us.us.us

polly.loop_header100.us.us.us:                    ; preds = %polly.loop_header100.us.us.us.preheader, %polly.loop_exit111.loopexit.us.us.loopexit.us
  %polly.indvar104.us.us.us = phi i64 [ %polly.indvar_next105.us.us.us, %polly.loop_exit111.loopexit.us.us.loopexit.us ], [ 0, %polly.loop_header100.us.us.us.preheader ]
  %24 = add nuw nsw i64 %polly.indvar104.us.us.us, %6
  %25 = mul i64 %24, %width
  %26 = add i64 %25, %11
  br label %polly.loop_header109.us.us.us

polly.loop_header109.us.us.us:                    ; preds = %polly.loop_header100.us.us.us, %polly.loop_header109.us.us.us
  %polly.indvar113.us.us.us = phi i64 [ %polly.indvar_next114.us.us.us, %polly.loop_header109.us.us.us ], [ 0, %polly.loop_header100.us.us.us ]
  %27 = add i64 %26, %polly.indvar113.us.us.us
  %scevgep.us.us.us = getelementptr i64, i64* %call, i64 %27
  %_p_scalar_.us.us.us = load i64, i64* %scevgep.us.us.us, align 8, !alias.scope !12, !noalias !14
  %p_add16.us.us.us = add nsw i64 %_p_scalar_.us.us.us, %24
  store i64 %p_add16.us.us.us, i64* %scevgep.us.us.us, align 8, !alias.scope !12, !noalias !14
  %polly.indvar_next114.us.us.us = add nuw nsw i64 %polly.indvar113.us.us.us, 1
  %polly.loop_cond116.us.us.us = icmp sgt i64 %polly.indvar113.us.us.us, %polly.adjust_ub115.us
  br i1 %polly.loop_cond116.us.us.us, label %polly.loop_exit111.loopexit.us.us.loopexit.us, label %polly.loop_header109.us.us.us, !llvm.loop !15

polly.loop_exit111.loopexit.us.us.loopexit.us:    ; preds = %polly.loop_header109.us.us.us
  %polly.indvar_next105.us.us.us = add nuw nsw i64 %polly.indvar104.us.us.us, 1
  %polly.loop_cond107.us.us.us = icmp sgt i64 %polly.indvar104.us.us.us, %polly.adjust_ub106
  br i1 %polly.loop_cond107.us.us.us, label %polly.loop_exit102.loopexit.us.loopexit, label %polly.loop_header100.us.us.us

polly.loop_header100.us.us.preheader.split:       ; preds = %polly.loop_header100.us.us.preheader
  %28 = icmp eq i64 %17, 0
  br i1 %28, label %polly.loop_header100.us.us.us1.preheader, label %polly.loop_header100.us.us.preheader49

polly.loop_header100.us.us.preheader49:           ; preds = %polly.loop_header100.us.us.preheader.split
  br label %polly.loop_header100.us.us

polly.loop_header100.us.us.us1.preheader:         ; preds = %polly.loop_header100.us.us.preheader.split
  br label %polly.loop_header100.us.us.us1

polly.loop_header100.us.us.us1:                   ; preds = %polly.loop_header100.us.us.us1.preheader, %polly.loop_exit111.loopexit.us.us.us27
  %polly.indvar104.us.us.us2 = phi i64 [ %polly.indvar_next105.us.us.us28, %polly.loop_exit111.loopexit.us.us.us27 ], [ 0, %polly.loop_header100.us.us.us1.preheader ]
  %29 = add nuw nsw i64 %polly.indvar104.us.us.us2, %6
  %30 = mul i64 %29, %width
  %31 = add i64 %30, %11
  %broadcast.splatinsert140.us4 = insertelement <2 x i64> undef, i64 %29, i32 0
  %broadcast.splat141.us5 = shufflevector <2 x i64> %broadcast.splatinsert140.us4, <2 x i64> undef, <2 x i32> zeroinitializer
  br i1 %lcmp.mod, label %middle.block.us19, label %vector.body.epil.us16

vector.body.epil.us16:                            ; preds = %polly.loop_header100.us.us.us1
  %32 = getelementptr i64, i64* %call, i64 %31
  %33 = bitcast i64* %32 to <2 x i64>*
  %wide.load.epil.us17 = load <2 x i64>, <2 x i64>* %33, align 8, !alias.scope !12, !noalias !14
  %34 = getelementptr i64, i64* %32, i64 2
  %35 = bitcast i64* %34 to <2 x i64>*
  %wide.load139.epil.us18 = load <2 x i64>, <2 x i64>* %35, align 8, !alias.scope !12, !noalias !14
  %36 = add nsw <2 x i64> %wide.load.epil.us17, %broadcast.splat141.us5
  %37 = add nsw <2 x i64> %wide.load139.epil.us18, %broadcast.splat141.us5
  store <2 x i64> %36, <2 x i64>* %33, align 8, !alias.scope !12, !noalias !14
  store <2 x i64> %37, <2 x i64>* %35, align 8, !alias.scope !12, !noalias !14
  br label %middle.block.us19

middle.block.us19:                                ; preds = %vector.body.epil.us16, %polly.loop_header100.us.us.us1
  br i1 %cmp.n, label %polly.loop_exit111.loopexit.us.us.us27, label %polly.loop_header109.us.us.us20.preheader

polly.loop_header109.us.us.us20.preheader:        ; preds = %middle.block.us19
  br label %polly.loop_header109.us.us.us20

polly.loop_header109.us.us.us20:                  ; preds = %polly.loop_header109.us.us.us20.preheader, %polly.loop_header109.us.us.us20
  %polly.indvar113.us.us.us21 = phi i64 [ %polly.indvar_next114.us.us.us25, %polly.loop_header109.us.us.us20 ], [ %n.vec, %polly.loop_header109.us.us.us20.preheader ]
  %38 = add i64 %polly.indvar113.us.us.us21, %31
  %scevgep.us.us.us22 = getelementptr i64, i64* %call, i64 %38
  %_p_scalar_.us.us.us23 = load i64, i64* %scevgep.us.us.us22, align 8, !alias.scope !12, !noalias !14
  %p_add16.us.us.us24 = add nsw i64 %_p_scalar_.us.us.us23, %29
  store i64 %p_add16.us.us.us24, i64* %scevgep.us.us.us22, align 8, !alias.scope !12, !noalias !14
  %polly.indvar_next114.us.us.us25 = add nuw nsw i64 %polly.indvar113.us.us.us21, 1
  %polly.loop_cond116.us.us.us26 = icmp sgt i64 %polly.indvar113.us.us.us21, %polly.adjust_ub115.us
  br i1 %polly.loop_cond116.us.us.us26, label %polly.loop_exit111.loopexit.us.us.us27.loopexit, label %polly.loop_header109.us.us.us20, !llvm.loop !15

polly.loop_exit111.loopexit.us.us.us27.loopexit:  ; preds = %polly.loop_header109.us.us.us20
  br label %polly.loop_exit111.loopexit.us.us.us27

polly.loop_exit111.loopexit.us.us.us27:           ; preds = %polly.loop_exit111.loopexit.us.us.us27.loopexit, %middle.block.us19
  %polly.indvar_next105.us.us.us28 = add nuw nsw i64 %polly.indvar104.us.us.us2, 1
  %polly.loop_cond107.us.us.us29 = icmp sgt i64 %polly.indvar104.us.us.us2, %polly.adjust_ub106
  br i1 %polly.loop_cond107.us.us.us29, label %polly.loop_exit102.loopexit.us.loopexit48, label %polly.loop_header100.us.us.us1

polly.loop_exit102.loopexit.us.loopexit:          ; preds = %polly.loop_exit111.loopexit.us.us.loopexit.us
  br label %polly.loop_exit102.loopexit.us

polly.loop_exit102.loopexit.us.loopexit48:        ; preds = %polly.loop_exit111.loopexit.us.us.us27
  br label %polly.loop_exit102.loopexit.us

polly.loop_exit102.loopexit.us.loopexit50:        ; preds = %polly.loop_exit111.loopexit.us.us
  br label %polly.loop_exit102.loopexit.us

polly.loop_exit102.loopexit.us:                   ; preds = %polly.loop_exit102.loopexit.us.loopexit50, %polly.loop_exit102.loopexit.us.loopexit48, %polly.loop_exit102.loopexit.us.loopexit, %polly.loop_header91.us
  %polly.indvar_next96.us = add nuw nsw i64 %polly.indvar95.us, 1
  %exitcond = icmp eq i64 %polly.indvar95.us, %polly.fdiv_q.shr89
  br i1 %exitcond, label %polly.loop_exit93.loopexit, label %polly.loop_header91.us

polly.loop_header100.us.us:                       ; preds = %polly.loop_header100.us.us.preheader49, %polly.loop_exit111.loopexit.us.us
  %polly.indvar104.us.us = phi i64 [ %polly.indvar_next105.us.us, %polly.loop_exit111.loopexit.us.us ], [ 0, %polly.loop_header100.us.us.preheader49 ]
  %39 = add nuw nsw i64 %polly.indvar104.us.us, %6
  %40 = mul i64 %39, %width
  %41 = add i64 %40, %11
  %broadcast.splatinsert140 = insertelement <2 x i64> undef, i64 %39, i32 0
  %broadcast.splat141 = shufflevector <2 x i64> %broadcast.splatinsert140, <2 x i64> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_header100.us.us, %vector.body
  %42 = phi i64 [ %51, %vector.body ], [ 0, %polly.loop_header100.us.us ]
  %niter = phi i64 [ %niter.nsub.1, %vector.body ], [ %unroll_iter, %polly.loop_header100.us.us ]
  %43 = or i64 %42, 4
  %44 = add i64 %42, %41
  %45 = getelementptr i64, i64* %call, i64 %44
  %46 = bitcast i64* %45 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !12, !noalias !14
  %47 = getelementptr i64, i64* %45, i64 2
  %48 = bitcast i64* %47 to <2 x i64>*
  %wide.load139 = load <2 x i64>, <2 x i64>* %48, align 8, !alias.scope !12, !noalias !14
  %49 = add nsw <2 x i64> %wide.load, %broadcast.splat141
  %50 = add nsw <2 x i64> %wide.load139, %broadcast.splat141
  store <2 x i64> %49, <2 x i64>* %46, align 8, !alias.scope !12, !noalias !14
  store <2 x i64> %50, <2 x i64>* %48, align 8, !alias.scope !12, !noalias !14
  %51 = add i64 %42, 8
  %52 = add i64 %43, %41
  %53 = getelementptr i64, i64* %call, i64 %52
  %54 = bitcast i64* %53 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !12, !noalias !14
  %55 = getelementptr i64, i64* %53, i64 2
  %56 = bitcast i64* %55 to <2 x i64>*
  %wide.load139.1 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !12, !noalias !14
  %57 = add nsw <2 x i64> %wide.load.1, %broadcast.splat141
  %58 = add nsw <2 x i64> %wide.load139.1, %broadcast.splat141
  store <2 x i64> %57, <2 x i64>* %54, align 8, !alias.scope !12, !noalias !14
  store <2 x i64> %58, <2 x i64>* %56, align 8, !alias.scope !12, !noalias !14
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !19

middle.block.unr-lcssa:                           ; preds = %vector.body
  %.lcssa = phi i64 [ %51, %vector.body ]
  br i1 %lcmp.mod, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa
  %59 = add i64 %.lcssa, %41
  %60 = getelementptr i64, i64* %call, i64 %59
  %61 = bitcast i64* %60 to <2 x i64>*
  %wide.load.epil = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !12, !noalias !14
  %62 = getelementptr i64, i64* %60, i64 2
  %63 = bitcast i64* %62 to <2 x i64>*
  %wide.load139.epil = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !12, !noalias !14
  %64 = add nsw <2 x i64> %wide.load.epil, %broadcast.splat141
  %65 = add nsw <2 x i64> %wide.load139.epil, %broadcast.splat141
  store <2 x i64> %64, <2 x i64>* %61, align 8, !alias.scope !12, !noalias !14
  store <2 x i64> %65, <2 x i64>* %63, align 8, !alias.scope !12, !noalias !14
  br label %middle.block

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  br i1 %cmp.n, label %polly.loop_exit111.loopexit.us.us, label %polly.loop_header109.us.us.preheader

polly.loop_header109.us.us.preheader:             ; preds = %middle.block
  br label %polly.loop_header109.us.us

polly.loop_exit111.loopexit.us.us.loopexit:       ; preds = %polly.loop_header109.us.us
  br label %polly.loop_exit111.loopexit.us.us

polly.loop_exit111.loopexit.us.us:                ; preds = %polly.loop_exit111.loopexit.us.us.loopexit, %middle.block
  %polly.indvar_next105.us.us = add nuw nsw i64 %polly.indvar104.us.us, 1
  %polly.loop_cond107.us.us = icmp sgt i64 %polly.indvar104.us.us, %polly.adjust_ub106
  br i1 %polly.loop_cond107.us.us, label %polly.loop_exit102.loopexit.us.loopexit50, label %polly.loop_header100.us.us

polly.loop_header109.us.us:                       ; preds = %polly.loop_header109.us.us.preheader, %polly.loop_header109.us.us
  %polly.indvar113.us.us = phi i64 [ %polly.indvar_next114.us.us, %polly.loop_header109.us.us ], [ %n.vec, %polly.loop_header109.us.us.preheader ]
  %66 = add i64 %polly.indvar113.us.us, %41
  %scevgep.us.us = getelementptr i64, i64* %call, i64 %66
  %_p_scalar_.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !12, !noalias !14
  %p_add16.us.us = add nsw i64 %_p_scalar_.us.us, %39
  store i64 %p_add16.us.us, i64* %scevgep.us.us, align 8, !alias.scope !12, !noalias !14
  %polly.indvar_next114.us.us = add nuw nsw i64 %polly.indvar113.us.us, 1
  %polly.loop_cond116.us.us = icmp sgt i64 %polly.indvar113.us.us, %polly.adjust_ub115.us
  br i1 %polly.loop_cond116.us.us, label %polly.loop_exit111.loopexit.us.us.loopexit, label %polly.loop_header109.us.us, !llvm.loop !15

polly.loop_exit93.loopexit:                       ; preds = %polly.loop_exit102.loopexit.us
  br label %polly.loop_exit93

polly.loop_exit93:                                ; preds = %polly.loop_exit93.loopexit, %polly.loop_header91.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond136 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond136, label %if.end24.loopexit, label %polly.loop_header
}

declare i64* @create1DArray(i32, i32) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define void @print_mat(%struct._IO_FILE* nocapture readnone %sys, %struct.Matrix* nocapture %a, i1 zeroext %a_dealloc) local_unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2
  %0 = load i64, i64* %width1, align 8, !tbaa !10
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height2, align 8, !tbaa !11
  %cmp79 = icmp sgt i64 %1, 0
  br i1 %cmp79, label %while.cond3.preheader.preheader, label %blklab6

while.cond3.preheader.preheader:                  ; preds = %entry.split
  %cmp574 = icmp sgt i64 %0, 0
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  br i1 %cmp574, label %while.cond3.preheader.us.preheader, label %while.cond3.preheader.preheader21

while.cond3.preheader.preheader21:                ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader

while.cond3.preheader.us.preheader:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader.us

while.cond3.preheader.us:                         ; preds = %while.cond3.preheader.us.preheader, %if.end16.us
  %_25_dealloc.085.us = phi i1 [ true, %if.end16.us ], [ false, %while.cond3.preheader.us.preheader ]
  %_25.084.us = phi i8* [ %6, %if.end16.us ], [ undef, %while.cond3.preheader.us.preheader ]
  %_18_dealloc.083.us = phi i8 [ 1, %if.end16.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %_18.082.us = phi i64* [ %call10.us.lcssa, %if.end16.us ], [ null, %while.cond3.preheader.us.preheader ]
  %i.080.us = phi i64 [ %add13.us, %if.end16.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %mul.us = mul nsw i64 %i.080.us, %0
  br label %if.end7.us

if.end7.us:                                       ; preds = %if.end9.us, %while.cond3.preheader.us
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
  tail call void @free(i8* %5) #6
  br label %if.end9.us

if.end9.us:                                       ; preds = %if.then8.us, %if.end7.us
  %call10.us = tail call i64* @create1DArray(i32 0, i32 1) #6
  store i64 32, i64* %call10.us, align 8, !tbaa !8
  tail call void @printf_s(i64* %call10.us, i64 1) #6
  %add12.us = add nuw nsw i64 %j.075.us, 1
  %exitcond.us = icmp eq i64 %add12.us, %0
  br i1 %exitcond.us, label %blklab8.loopexit.us, label %if.end7.us

if.then15.us:                                     ; preds = %blklab8.loopexit.us
  tail call void @free(i8* %_25.084.us) #6
  br label %if.end16.us

if.end16.us:                                      ; preds = %blklab8.loopexit.us, %if.then15.us
  %call18.us = tail call i64* @create1DArray(i32 0, i32 0) #6
  %6 = bitcast i64* %call18.us to i8*
  tail call void @println_s(i64* %call18.us, i64 0) #6
  %exitcond90.us = icmp eq i64 %add13.us, %1
  br i1 %exitcond90.us, label %blklab6.loopexit, label %while.cond3.preheader.us

blklab8.loopexit.us:                              ; preds = %if.end9.us
  %call10.us.lcssa = phi i64* [ %call10.us, %if.end9.us ]
  %add13.us = add nuw nsw i64 %i.080.us, 1
  br i1 %_25_dealloc.085.us, label %if.then15.us, label %if.end16.us

while.cond3.preheader:                            ; preds = %while.cond3.preheader.preheader21, %if.end16
  %_25_dealloc.085 = phi i1 [ true, %if.end16 ], [ false, %while.cond3.preheader.preheader21 ]
  %_25.084 = phi i8* [ %7, %if.end16 ], [ undef, %while.cond3.preheader.preheader21 ]
  %i.080 = phi i64 [ %add13, %if.end16 ], [ 0, %while.cond3.preheader.preheader21 ]
  %add13 = add nuw nsw i64 %i.080, 1
  br i1 %_25_dealloc.085, label %if.then15, label %if.end16

if.then15:                                        ; preds = %while.cond3.preheader
  tail call void @free(i8* %_25.084) #6
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %while.cond3.preheader
  %call18 = tail call i64* @create1DArray(i32 0, i32 0) #6
  %7 = bitcast i64* %call18 to i8*
  tail call void @println_s(i64* %call18, i64 0) #6
  %exitcond90 = icmp eq i64 %add13, %1
  br i1 %exitcond90, label %blklab6.loopexit22, label %while.cond3.preheader

blklab6.loopexit:                                 ; preds = %if.end16.us
  %.lcssa = phi i8* [ %6, %if.end16.us ]
  %call10.us.lcssa.lcssa = phi i64* [ %call10.us.lcssa, %if.end16.us ]
  %phitmp = bitcast i64* %call10.us.lcssa.lcssa to i8*
  br label %blklab6

blklab6.loopexit22:                               ; preds = %if.end16
  %.lcssa24 = phi i8* [ %7, %if.end16 ]
  br label %blklab6

blklab6:                                          ; preds = %blklab6.loopexit22, %blklab6.loopexit, %entry.split
  %_25_dealloc.0.lcssa = phi i1 [ false, %entry.split ], [ true, %blklab6.loopexit ], [ true, %blklab6.loopexit22 ]
  %_25.0.lcssa = phi i8* [ undef, %entry.split ], [ %.lcssa, %blklab6.loopexit ], [ %.lcssa24, %blklab6.loopexit22 ]
  %_18_dealloc.0.lcssa = phi i8 [ 0, %entry.split ], [ 1, %blklab6.loopexit ], [ 0, %blklab6.loopexit22 ]
  %_18.0.lcssa = phi i8* [ null, %entry.split ], [ %phitmp, %blklab6.loopexit ], [ null, %blklab6.loopexit22 ]
  br i1 %a_dealloc, label %if.then20, label %if.end24

if.then20:                                        ; preds = %blklab6
  %8 = bitcast %struct.Matrix* %a to i8**
  %9 = load i8*, i8** %8, align 8, !tbaa !7
  tail call void @free(i8* %9) #6
  %10 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %10) #6
  br label %if.end24

if.end24:                                         ; preds = %if.then20, %blklab6
  %tobool25 = icmp eq i8 %_18_dealloc.0.lcssa, 0
  br i1 %tobool25, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.end24
  tail call void @free(i8* %_18.0.lcssa) #6
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end24
  br i1 %_25_dealloc.0.lcssa, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end27
  tail call void @free(i8* %_25.0.lcssa) #6
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.end27
  ret void
}

declare void @printf_s(i64*, i64) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @mat_mult(%struct.Matrix* nocapture %a, i1 zeroext %a_dealloc, %struct.Matrix* nocapture %b, i1 zeroext %b_dealloc) local_unnamed_addr #3 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 2
  %0 = load i64, i64* %width2, align 8, !tbaa !10
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height3, align 8, !tbaa !11
  %mul = mul nsw i64 %1, %0
  %conv4 = trunc i64 %mul to i32
  %call = tail call i64* @create1DArray(i32 0, i32 %conv4) #6
  %data11 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %2 = load i64*, i64** %data11, align 8, !tbaa !7
  %data18 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0
  %3 = load i64*, i64** %data18, align 8, !tbaa !7
  %call30 = tail call i64* @create1DArray(i32 0, i32 %conv4) #6
  %cmp270 = icmp sgt i64 %1, 0
  br i1 %cmp270, label %polly.split_new_and_old385, label %entry.polly.split_new_and_old_crit_edge

entry.polly.split_new_and_old_crit_edge:          ; preds = %entry.split
  %.pre608 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.pre609 = extractvalue { i64, i1 } %.pre608, 1
  %.pre610 = extractvalue { i64, i1 } %.pre608, 0
  %.pre611 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.pre610, i64 %0)
  %.pre612 = extractvalue { i64, i1 } %.pre611, 1
  %.pre613 = or i1 %.pre609, %.pre612
  %.pre614 = extractvalue { i64, i1 } %.pre611, 0
  %.pre615 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.pre614, i64 %0)
  %.pre616 = extractvalue { i64, i1 } %.pre615, 1
  %.pre617 = extractvalue { i64, i1 } %.pre615, 0
  %.pre618 = or i1 %.pre613, %.pre616
  br label %polly.split_new_and_old

polly.split_new_and_old385:                       ; preds = %entry.split
  %4 = icmp sge i64 %0, %1
  %5 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.obit389 = extractvalue { i64, i1 } %5, 1
  %.res391 = extractvalue { i64, i1 } %5, 0
  %polly.access.mul.392 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res391, i64 %0)
  %polly.access.mul..obit393 = extractvalue { i64, i1 } %polly.access.mul.392, 1
  %polly.overflow.state394 = or i1 %.obit389, %polly.access.mul..obit393
  %polly.access.mul..res395 = extractvalue { i64, i1 } %polly.access.mul.392, 0
  %polly.access.add.396 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res395, i64 %0)
  %polly.access.add..obit397 = extractvalue { i64, i1 } %polly.access.add.396, 1
  %polly.access.add..res399 = extractvalue { i64, i1 } %polly.access.add.396, 0
  %polly.access.400 = getelementptr i64, i64* %3, i64 %polly.access.add..res399
  %polly.overflow.state407 = or i1 %polly.overflow.state394, %polly.access.add..obit397
  %6 = icmp ule i64* %polly.access.400, %call30
  %7 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 1)
  %.obit410 = extractvalue { i64, i1 } %7, 1
  %polly.overflow.state411 = or i1 %.obit410, %polly.overflow.state407
  %.res412 = extractvalue { i64, i1 } %7, 0
  %polly.access.mul.call30413 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res412, i64 %0)
  %polly.access.mul.call30.obit414 = extractvalue { i64, i1 } %polly.access.mul.call30413, 1
  %polly.overflow.state415 = or i1 %polly.access.mul.call30.obit414, %polly.overflow.state411
  %polly.access.mul.call30.res416 = extractvalue { i64, i1 } %polly.access.mul.call30413, 0
  %polly.access.add.call30417 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call30.res416, i64 %1)
  %polly.access.add.call30.obit418 = extractvalue { i64, i1 } %polly.access.add.call30417, 1
  %polly.access.add.call30.res420 = extractvalue { i64, i1 } %polly.access.add.call30417, 0
  %polly.access.call30421 = getelementptr i64, i64* %call30, i64 %polly.access.add.call30.res420
  %polly.overflow.state428 = or i1 %polly.access.add.call30.obit418, %polly.overflow.state415
  %8 = icmp ule i64* %polly.access.call30421, %3
  %9 = or i1 %8, %6
  %10 = and i1 %4, %9
  %polly.rtc.overflown431 = xor i1 %polly.overflow.state428, true
  %polly.rtc.result432 = and i1 %10, %polly.rtc.overflown431
  br i1 %polly.rtc.result432, label %polly.start387, label %while.cond39.preheader.preheader

while.cond39.preheader.preheader:                 ; preds = %polly.split_new_and_old385
  %cmp41268 = icmp sgt i64 %0, 0
  br i1 %cmp41268, label %while.cond39.preheader.us.preheader, label %polly.split_new_and_old

while.cond39.preheader.us.preheader:              ; preds = %while.cond39.preheader.preheader
  %11 = add i64 %0, -1
  %xtraiter677 = and i64 %0, 3
  %12 = icmp ult i64 %11, 3
  %lcmp.mod678 = icmp eq i64 %xtraiter677, 0
  %unroll_iter679 = sub i64 %0, %xtraiter677
  br i1 %12, label %while.cond39.preheader.us.us.preheader, label %while.cond39.preheader.us.preheader.split

while.cond39.preheader.us.us.preheader:           ; preds = %while.cond39.preheader.us.preheader
  br label %while.cond39.preheader.us.us

while.cond39.preheader.us.us:                     ; preds = %while.cond39.preheader.us.us.preheader, %blklab15.loopexit.us.us
  %i.0271.us.us = phi i64 [ %add50.us.us, %blklab15.loopexit.us.us ], [ 0, %while.cond39.preheader.us.us.preheader ]
  %mul45.us.us = mul nsw i64 %i.0271.us.us, %0
  br i1 %lcmp.mod678, label %blklab15.loopexit.us.us, label %if.end44.us.epil.us.preheader

if.end44.us.epil.us.preheader:                    ; preds = %while.cond39.preheader.us.us
  br label %if.end44.us.epil.us

if.end44.us.epil.us:                              ; preds = %if.end44.us.epil.us.preheader, %if.end44.us.epil.us
  %j.0269.us.epil.us = phi i64 [ %add49.us.epil.us, %if.end44.us.epil.us ], [ 0, %if.end44.us.epil.us.preheader ]
  %epil.iter.us = phi i64 [ %epil.iter.sub.us, %if.end44.us.epil.us ], [ %xtraiter677, %if.end44.us.epil.us.preheader ]
  %add.us.epil.us = add nsw i64 %j.0269.us.epil.us, %mul45.us.us
  %arrayidx.us.epil.us = getelementptr inbounds i64, i64* %3, i64 %add.us.epil.us
  %13 = load i64, i64* %arrayidx.us.epil.us, align 8, !tbaa !8
  %mul46.us.epil.us = mul nsw i64 %j.0269.us.epil.us, %0
  %add47.us.epil.us = add nsw i64 %mul46.us.epil.us, %i.0271.us.us
  %arrayidx48.us.epil.us = getelementptr inbounds i64, i64* %call30, i64 %add47.us.epil.us
  store i64 %13, i64* %arrayidx48.us.epil.us, align 8, !tbaa !8
  %add49.us.epil.us = add nuw nsw i64 %j.0269.us.epil.us, 1
  %epil.iter.sub.us = add i64 %epil.iter.us, -1
  %epil.iter.cmp.us = icmp eq i64 %epil.iter.sub.us, 0
  br i1 %epil.iter.cmp.us, label %blklab15.loopexit.us.us.loopexit, label %if.end44.us.epil.us, !llvm.loop !20

blklab15.loopexit.us.us.loopexit:                 ; preds = %if.end44.us.epil.us
  br label %blklab15.loopexit.us.us

blklab15.loopexit.us.us:                          ; preds = %blklab15.loopexit.us.us.loopexit, %while.cond39.preheader.us.us
  %add50.us.us = add nuw nsw i64 %i.0271.us.us, 1
  %exitcond276.us.us = icmp eq i64 %add50.us.us, %1
  br i1 %exitcond276.us.us, label %polly.split_new_and_old.loopexit238, label %while.cond39.preheader.us.us

while.cond39.preheader.us.preheader.split:        ; preds = %while.cond39.preheader.us.preheader
  br i1 %lcmp.mod678, label %while.cond39.preheader.us.us71.preheader, label %while.cond39.preheader.us.preheader240

while.cond39.preheader.us.preheader240:           ; preds = %while.cond39.preheader.us.preheader.split
  br label %while.cond39.preheader.us

while.cond39.preheader.us.us71.preheader:         ; preds = %while.cond39.preheader.us.preheader.split
  br label %while.cond39.preheader.us.us71

while.cond39.preheader.us.us71:                   ; preds = %while.cond39.preheader.us.us71.preheader, %blklab15.loopexit.us.loopexit.unr-lcssa.loopexit.us122
  %i.0271.us.us72 = phi i64 [ %add50.us.us118, %blklab15.loopexit.us.loopexit.unr-lcssa.loopexit.us122 ], [ 0, %while.cond39.preheader.us.us71.preheader ]
  %mul45.us.us73 = mul nsw i64 %i.0271.us.us72, %0
  br label %if.end44.us.us75

if.end44.us.us75:                                 ; preds = %if.end44.us.us75, %while.cond39.preheader.us.us71
  %j.0269.us.us76 = phi i64 [ 0, %while.cond39.preheader.us.us71 ], [ %add49.us.3.us101, %if.end44.us.us75 ]
  %niter680.us77 = phi i64 [ %unroll_iter679, %while.cond39.preheader.us.us71 ], [ %niter680.nsub.3.us102, %if.end44.us.us75 ]
  %add.us.us78 = add nsw i64 %j.0269.us.us76, %mul45.us.us73
  %arrayidx.us.us79 = getelementptr inbounds i64, i64* %3, i64 %add.us.us78
  %14 = load i64, i64* %arrayidx.us.us79, align 8, !tbaa !8
  %mul46.us.us80 = mul nsw i64 %j.0269.us.us76, %0
  %add47.us.us81 = add nsw i64 %mul46.us.us80, %i.0271.us.us72
  %arrayidx48.us.us82 = getelementptr inbounds i64, i64* %call30, i64 %add47.us.us81
  store i64 %14, i64* %arrayidx48.us.us82, align 8, !tbaa !8
  %add49.us.us83 = or i64 %j.0269.us.us76, 1
  %add.us.1.us84 = add nsw i64 %add49.us.us83, %mul45.us.us73
  %arrayidx.us.1.us85 = getelementptr inbounds i64, i64* %3, i64 %add.us.1.us84
  %15 = load i64, i64* %arrayidx.us.1.us85, align 8, !tbaa !8
  %mul46.us.1.us86 = mul nsw i64 %add49.us.us83, %0
  %add47.us.1.us87 = add nsw i64 %mul46.us.1.us86, %i.0271.us.us72
  %arrayidx48.us.1.us88 = getelementptr inbounds i64, i64* %call30, i64 %add47.us.1.us87
  store i64 %15, i64* %arrayidx48.us.1.us88, align 8, !tbaa !8
  %add49.us.1.us89 = or i64 %j.0269.us.us76, 2
  %add.us.2.us90 = add nsw i64 %add49.us.1.us89, %mul45.us.us73
  %arrayidx.us.2.us91 = getelementptr inbounds i64, i64* %3, i64 %add.us.2.us90
  %16 = load i64, i64* %arrayidx.us.2.us91, align 8, !tbaa !8
  %mul46.us.2.us92 = mul nsw i64 %add49.us.1.us89, %0
  %add47.us.2.us93 = add nsw i64 %mul46.us.2.us92, %i.0271.us.us72
  %arrayidx48.us.2.us94 = getelementptr inbounds i64, i64* %call30, i64 %add47.us.2.us93
  store i64 %16, i64* %arrayidx48.us.2.us94, align 8, !tbaa !8
  %add49.us.2.us95 = or i64 %j.0269.us.us76, 3
  %add.us.3.us96 = add nsw i64 %add49.us.2.us95, %mul45.us.us73
  %arrayidx.us.3.us97 = getelementptr inbounds i64, i64* %3, i64 %add.us.3.us96
  %17 = load i64, i64* %arrayidx.us.3.us97, align 8, !tbaa !8
  %mul46.us.3.us98 = mul nsw i64 %add49.us.2.us95, %0
  %add47.us.3.us99 = add nsw i64 %mul46.us.3.us98, %i.0271.us.us72
  %arrayidx48.us.3.us100 = getelementptr inbounds i64, i64* %call30, i64 %add47.us.3.us99
  store i64 %17, i64* %arrayidx48.us.3.us100, align 8, !tbaa !8
  %add49.us.3.us101 = add nuw nsw i64 %j.0269.us.us76, 4
  %niter680.nsub.3.us102 = add i64 %niter680.us77, -4
  %niter680.ncmp.3.us103 = icmp eq i64 %niter680.nsub.3.us102, 0
  br i1 %niter680.ncmp.3.us103, label %blklab15.loopexit.us.loopexit.unr-lcssa.loopexit.us122, label %if.end44.us.us75, !llvm.loop !22

blklab15.loopexit.us.loopexit.unr-lcssa.loopexit.us122: ; preds = %if.end44.us.us75
  %add50.us.us118 = add nuw nsw i64 %i.0271.us.us72, 1
  %exitcond276.us.us119 = icmp eq i64 %add50.us.us118, %1
  br i1 %exitcond276.us.us119, label %polly.split_new_and_old.loopexit239, label %while.cond39.preheader.us.us71

while.cond39.preheader.us:                        ; preds = %while.cond39.preheader.us.preheader240, %blklab15.loopexit.us
  %i.0271.us = phi i64 [ %add50.us, %blklab15.loopexit.us ], [ 0, %while.cond39.preheader.us.preheader240 ]
  %mul45.us = mul nsw i64 %i.0271.us, %0
  br label %if.end44.us

if.end44.us:                                      ; preds = %if.end44.us, %while.cond39.preheader.us
  %j.0269.us = phi i64 [ 0, %while.cond39.preheader.us ], [ %add49.us.3, %if.end44.us ]
  %niter680 = phi i64 [ %unroll_iter679, %while.cond39.preheader.us ], [ %niter680.nsub.3, %if.end44.us ]
  %add.us = add nsw i64 %j.0269.us, %mul45.us
  %arrayidx.us = getelementptr inbounds i64, i64* %3, i64 %add.us
  %18 = load i64, i64* %arrayidx.us, align 8, !tbaa !8
  %mul46.us = mul nsw i64 %j.0269.us, %0
  %add47.us = add nsw i64 %mul46.us, %i.0271.us
  %arrayidx48.us = getelementptr inbounds i64, i64* %call30, i64 %add47.us
  store i64 %18, i64* %arrayidx48.us, align 8, !tbaa !8
  %add49.us = or i64 %j.0269.us, 1
  %add.us.1 = add nsw i64 %add49.us, %mul45.us
  %arrayidx.us.1 = getelementptr inbounds i64, i64* %3, i64 %add.us.1
  %19 = load i64, i64* %arrayidx.us.1, align 8, !tbaa !8
  %mul46.us.1 = mul nsw i64 %add49.us, %0
  %add47.us.1 = add nsw i64 %mul46.us.1, %i.0271.us
  %arrayidx48.us.1 = getelementptr inbounds i64, i64* %call30, i64 %add47.us.1
  store i64 %19, i64* %arrayidx48.us.1, align 8, !tbaa !8
  %add49.us.1 = or i64 %j.0269.us, 2
  %add.us.2 = add nsw i64 %add49.us.1, %mul45.us
  %arrayidx.us.2 = getelementptr inbounds i64, i64* %3, i64 %add.us.2
  %20 = load i64, i64* %arrayidx.us.2, align 8, !tbaa !8
  %mul46.us.2 = mul nsw i64 %add49.us.1, %0
  %add47.us.2 = add nsw i64 %mul46.us.2, %i.0271.us
  %arrayidx48.us.2 = getelementptr inbounds i64, i64* %call30, i64 %add47.us.2
  store i64 %20, i64* %arrayidx48.us.2, align 8, !tbaa !8
  %add49.us.2 = or i64 %j.0269.us, 3
  %add.us.3 = add nsw i64 %add49.us.2, %mul45.us
  %arrayidx.us.3 = getelementptr inbounds i64, i64* %3, i64 %add.us.3
  %21 = load i64, i64* %arrayidx.us.3, align 8, !tbaa !8
  %mul46.us.3 = mul nsw i64 %add49.us.2, %0
  %add47.us.3 = add nsw i64 %mul46.us.3, %i.0271.us
  %arrayidx48.us.3 = getelementptr inbounds i64, i64* %call30, i64 %add47.us.3
  store i64 %21, i64* %arrayidx48.us.3, align 8, !tbaa !8
  %add49.us.3 = add nuw nsw i64 %j.0269.us, 4
  %niter680.nsub.3 = add i64 %niter680, -4
  %niter680.ncmp.3 = icmp eq i64 %niter680.nsub.3, 0
  br i1 %niter680.ncmp.3, label %if.end44.us.epil.preheader, label %if.end44.us, !llvm.loop !22

if.end44.us.epil.preheader:                       ; preds = %if.end44.us
  %add49.us.3.lcssa = phi i64 [ %add49.us.3, %if.end44.us ]
  br label %if.end44.us.epil

if.end44.us.epil:                                 ; preds = %if.end44.us.epil.preheader, %if.end44.us.epil
  %j.0269.us.epil = phi i64 [ %add49.us.epil, %if.end44.us.epil ], [ %add49.us.3.lcssa, %if.end44.us.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.sub, %if.end44.us.epil ], [ %xtraiter677, %if.end44.us.epil.preheader ]
  %add.us.epil = add nsw i64 %j.0269.us.epil, %mul45.us
  %arrayidx.us.epil = getelementptr inbounds i64, i64* %3, i64 %add.us.epil
  %22 = load i64, i64* %arrayidx.us.epil, align 8, !tbaa !8
  %mul46.us.epil = mul nsw i64 %j.0269.us.epil, %0
  %add47.us.epil = add nsw i64 %mul46.us.epil, %i.0271.us
  %arrayidx48.us.epil = getelementptr inbounds i64, i64* %call30, i64 %add47.us.epil
  store i64 %22, i64* %arrayidx48.us.epil, align 8, !tbaa !8
  %add49.us.epil = add nuw nsw i64 %j.0269.us.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %blklab15.loopexit.us, label %if.end44.us.epil, !llvm.loop !23

blklab15.loopexit.us:                             ; preds = %if.end44.us.epil
  %add50.us = add nuw nsw i64 %i.0271.us, 1
  %exitcond276.us = icmp eq i64 %add50.us, %1
  br i1 %exitcond276.us, label %polly.split_new_and_old.loopexit241, label %while.cond39.preheader.us

polly.split_new_and_old.loopexit:                 ; preds = %polly.loop_exit447
  br label %polly.split_new_and_old

polly.split_new_and_old.loopexit238:              ; preds = %blklab15.loopexit.us.us
  br label %polly.split_new_and_old

polly.split_new_and_old.loopexit239:              ; preds = %blklab15.loopexit.us.loopexit.unr-lcssa.loopexit.us122
  br label %polly.split_new_and_old

polly.split_new_and_old.loopexit241:              ; preds = %blklab15.loopexit.us
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %polly.split_new_and_old.loopexit241, %polly.split_new_and_old.loopexit239, %polly.split_new_and_old.loopexit238, %polly.split_new_and_old.loopexit, %polly.start387, %while.cond39.preheader.preheader, %entry.polly.split_new_and_old_crit_edge
  %polly.overflow.state280.pre-phi = phi i1 [ %.pre618, %entry.polly.split_new_and_old_crit_edge ], [ %polly.overflow.state407, %polly.start387 ], [ %polly.overflow.state407, %while.cond39.preheader.preheader ], [ %polly.overflow.state407, %polly.split_new_and_old.loopexit ], [ %polly.overflow.state407, %polly.split_new_and_old.loopexit238 ], [ %polly.overflow.state407, %polly.split_new_and_old.loopexit239 ], [ %polly.overflow.state407, %polly.split_new_and_old.loopexit241 ]
  %polly.access.add.call30.res.pre-phi = phi i64 [ %.pre617, %entry.polly.split_new_and_old_crit_edge ], [ %polly.access.add..res399, %polly.start387 ], [ %polly.access.add..res399, %while.cond39.preheader.preheader ], [ %polly.access.add..res399, %polly.split_new_and_old.loopexit ], [ %polly.access.add..res399, %polly.split_new_and_old.loopexit238 ], [ %polly.access.add..res399, %polly.split_new_and_old.loopexit239 ], [ %polly.access.add..res399, %polly.split_new_and_old.loopexit241 ]
  %polly.access.call30 = getelementptr i64, i64* %call30, i64 %polly.access.add.call30.res.pre-phi
  %23 = icmp ule i64* %polly.access.call30, %call
  %polly.access.call292 = getelementptr i64, i64* %call, i64 %polly.access.add.call30.res.pre-phi
  %24 = icmp ule i64* %polly.access.call292, %call30
  %25 = or i1 %23, %24
  %polly.access. = getelementptr i64, i64* %2, i64 %polly.access.add.call30.res.pre-phi
  %26 = icmp ule i64* %polly.access., %call
  %27 = icmp ule i64* %polly.access.call292, %2
  %28 = or i1 %26, %27
  %29 = and i1 %25, %28
  %polly.rtc.overflown = xor i1 %polly.overflow.state280.pre-phi, true
  %polly.rtc.result = and i1 %29, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.start, label %while.cond51.preheader

while.cond51.preheader:                           ; preds = %polly.split_new_and_old
  %cmp59262 = icmp sgt i64 %0, 0
  %or.cond = and i1 %cmp59262, %cmp270
  br i1 %or.cond, label %while.cond57.preheader.us.preheader, label %if.end88

while.cond57.preheader.us.preheader:              ; preds = %while.cond51.preheader
  %xtraiter = and i64 %0, 1
  %30 = icmp eq i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %unroll_iter = sub i64 %0, %xtraiter
  br label %while.cond57.preheader.us

while.cond57.preheader.us:                        ; preds = %blklab19.loopexit.us-lcssa.us.us, %while.cond57.preheader.us.preheader
  %i.1266.us = phi i64 [ %add85.us, %blklab19.loopexit.us-lcssa.us.us ], [ 0, %while.cond57.preheader.us.preheader ]
  %mul69.us = mul nsw i64 %i.1266.us, %0
  br i1 %30, label %while.cond57.preheader.us.split.us, label %while.cond57.preheader.us.split

while.cond57.preheader.us.split.us:               ; preds = %while.cond57.preheader.us
  br i1 %lcmp.mod, label %blklab19.loopexit.us-lcssa.us.us, label %blklab19.loopexit.us-lcssa.us.us.loopexit126

while.cond57.preheader.us.split:                  ; preds = %while.cond57.preheader.us
  br i1 %lcmp.mod, label %while.cond63.preheader.us.us.us33.preheader, label %while.cond63.preheader.us.us.preheader

while.cond63.preheader.us.us.preheader:           ; preds = %while.cond57.preheader.us.split
  br label %while.cond63.preheader.us.us

while.cond63.preheader.us.us.us33.preheader:      ; preds = %while.cond57.preheader.us.split
  br label %while.cond63.preheader.us.us.us33

while.cond63.preheader.us.us.us33:                ; preds = %while.cond63.preheader.us.us.us33.preheader, %blklab21.loopexit.us.us.unr-lcssa.loopexit.us68
  %j.1263.us.us.us34 = phi i64 [ %add84.us.us.us65, %blklab21.loopexit.us.us.unr-lcssa.loopexit.us68 ], [ 0, %while.cond63.preheader.us.us.us33.preheader ]
  %add70.us.us.us35 = add nsw i64 %j.1263.us.us.us34, %mul69.us
  %arrayidx71.us.us.us36 = getelementptr inbounds i64, i64* %call, i64 %add70.us.us.us35
  %.pre.us37 = load i64, i64* %arrayidx71.us.us.us36, align 8, !tbaa !8
  br label %if.end68.us.us.us38

if.end68.us.us.us38:                              ; preds = %while.cond63.preheader.us.us.us33, %if.end68.us.us.us38
  %31 = phi i64 [ %add79.us.us.1.us51, %if.end68.us.us.us38 ], [ %.pre.us37, %while.cond63.preheader.us.us.us33 ]
  %k.0261.us.us.us39 = phi i64 [ %add83.us.us.1.us52, %if.end68.us.us.us38 ], [ 0, %while.cond63.preheader.us.us.us33 ]
  %niter.us40 = phi i64 [ %niter.nsub.1.us53, %if.end68.us.us.us38 ], [ %unroll_iter, %while.cond63.preheader.us.us.us33 ]
  %add73.us.us.us41 = add nsw i64 %k.0261.us.us.us39, %mul69.us
  %arrayidx74.us.us.us42 = getelementptr inbounds i64, i64* %2, i64 %add73.us.us.us41
  %32 = load i64, i64* %arrayidx74.us.us.us42, align 8, !tbaa !8
  %arrayidx77.us.us.us43 = getelementptr inbounds i64, i64* %call30, i64 %add73.us.us.us41
  %33 = load i64, i64* %arrayidx77.us.us.us43, align 8, !tbaa !8
  %mul78.us.us.us44 = mul nsw i64 %33, %32
  %add79.us.us.us45 = add nsw i64 %mul78.us.us.us44, %31
  store i64 %add79.us.us.us45, i64* %arrayidx71.us.us.us36, align 8, !tbaa !8
  %add83.us.us.us46 = or i64 %k.0261.us.us.us39, 1
  %add73.us.us.1.us47 = add nsw i64 %add83.us.us.us46, %mul69.us
  %arrayidx74.us.us.1.us48 = getelementptr inbounds i64, i64* %2, i64 %add73.us.us.1.us47
  %34 = load i64, i64* %arrayidx74.us.us.1.us48, align 8, !tbaa !8
  %arrayidx77.us.us.1.us49 = getelementptr inbounds i64, i64* %call30, i64 %add73.us.us.1.us47
  %35 = load i64, i64* %arrayidx77.us.us.1.us49, align 8, !tbaa !8
  %mul78.us.us.1.us50 = mul nsw i64 %35, %34
  %add79.us.us.1.us51 = add nsw i64 %mul78.us.us.1.us50, %add79.us.us.us45
  store i64 %add79.us.us.1.us51, i64* %arrayidx71.us.us.us36, align 8, !tbaa !8
  %add83.us.us.1.us52 = add nuw nsw i64 %k.0261.us.us.us39, 2
  %niter.nsub.1.us53 = add i64 %niter.us40, -2
  %niter.ncmp.1.us54 = icmp eq i64 %niter.nsub.1.us53, 0
  br i1 %niter.ncmp.1.us54, label %blklab21.loopexit.us.us.unr-lcssa.loopexit.us68, label %if.end68.us.us.us38

blklab21.loopexit.us.us.unr-lcssa.loopexit.us68:  ; preds = %if.end68.us.us.us38
  %add84.us.us.us65 = add nuw nsw i64 %j.1263.us.us.us34, 1
  %exitcond273.us.us.us66 = icmp eq i64 %add84.us.us.us65, %0
  br i1 %exitcond273.us.us.us66, label %blklab19.loopexit.us-lcssa.us.us.loopexit, label %while.cond63.preheader.us.us.us33

while.cond63.preheader.us.us:                     ; preds = %while.cond63.preheader.us.us.preheader, %if.end68.us.us.epil
  %j.1263.us.us = phi i64 [ %add84.us.us, %if.end68.us.us.epil ], [ 0, %while.cond63.preheader.us.us.preheader ]
  %add70.us.us = add nsw i64 %j.1263.us.us, %mul69.us
  %arrayidx71.us.us = getelementptr inbounds i64, i64* %call, i64 %add70.us.us
  %.pre = load i64, i64* %arrayidx71.us.us, align 8, !tbaa !8
  br label %if.end68.us.us

if.end68.us.us.epil:                              ; preds = %if.end68.us.us
  %add83.us.us.1.lcssa = phi i64 [ %add83.us.us.1, %if.end68.us.us ]
  %add79.us.us.1.lcssa = phi i64 [ %add79.us.us.1, %if.end68.us.us ]
  %add73.us.us.epil = add nsw i64 %add83.us.us.1.lcssa, %mul69.us
  %arrayidx74.us.us.epil = getelementptr inbounds i64, i64* %2, i64 %add73.us.us.epil
  %36 = load i64, i64* %arrayidx74.us.us.epil, align 8, !tbaa !8
  %arrayidx77.us.us.epil = getelementptr inbounds i64, i64* %call30, i64 %add73.us.us.epil
  %37 = load i64, i64* %arrayidx77.us.us.epil, align 8, !tbaa !8
  %mul78.us.us.epil = mul nsw i64 %37, %36
  %add79.us.us.epil = add nsw i64 %mul78.us.us.epil, %add79.us.us.1.lcssa
  store i64 %add79.us.us.epil, i64* %arrayidx71.us.us, align 8, !tbaa !8
  %add84.us.us = add nuw nsw i64 %j.1263.us.us, 1
  %exitcond273.us.us = icmp eq i64 %add84.us.us, %0
  br i1 %exitcond273.us.us, label %blklab19.loopexit.us-lcssa.us.us.loopexit234, label %while.cond63.preheader.us.us

if.end68.us.us:                                   ; preds = %while.cond63.preheader.us.us, %if.end68.us.us
  %38 = phi i64 [ %add79.us.us.1, %if.end68.us.us ], [ %.pre, %while.cond63.preheader.us.us ]
  %k.0261.us.us = phi i64 [ %add83.us.us.1, %if.end68.us.us ], [ 0, %while.cond63.preheader.us.us ]
  %niter = phi i64 [ %niter.nsub.1, %if.end68.us.us ], [ %unroll_iter, %while.cond63.preheader.us.us ]
  %add73.us.us = add nsw i64 %k.0261.us.us, %mul69.us
  %arrayidx74.us.us = getelementptr inbounds i64, i64* %2, i64 %add73.us.us
  %39 = load i64, i64* %arrayidx74.us.us, align 8, !tbaa !8
  %arrayidx77.us.us = getelementptr inbounds i64, i64* %call30, i64 %add73.us.us
  %40 = load i64, i64* %arrayidx77.us.us, align 8, !tbaa !8
  %mul78.us.us = mul nsw i64 %40, %39
  %add79.us.us = add nsw i64 %mul78.us.us, %38
  store i64 %add79.us.us, i64* %arrayidx71.us.us, align 8, !tbaa !8
  %add83.us.us = or i64 %k.0261.us.us, 1
  %add73.us.us.1 = add nsw i64 %add83.us.us, %mul69.us
  %arrayidx74.us.us.1 = getelementptr inbounds i64, i64* %2, i64 %add73.us.us.1
  %41 = load i64, i64* %arrayidx74.us.us.1, align 8, !tbaa !8
  %arrayidx77.us.us.1 = getelementptr inbounds i64, i64* %call30, i64 %add73.us.us.1
  %42 = load i64, i64* %arrayidx77.us.us.1, align 8, !tbaa !8
  %mul78.us.us.1 = mul nsw i64 %42, %41
  %add79.us.us.1 = add nsw i64 %mul78.us.us.1, %add79.us.us
  store i64 %add79.us.us.1, i64* %arrayidx71.us.us, align 8, !tbaa !8
  %add83.us.us.1 = add nuw nsw i64 %k.0261.us.us, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %if.end68.us.us.epil, label %if.end68.us.us

blklab19.loopexit.us-lcssa.us.us.loopexit126:     ; preds = %while.cond57.preheader.us.split.us
  %arrayidx71.us.us.us = getelementptr inbounds i64, i64* %call, i64 %mul69.us
  %.pre.us = load i64, i64* %arrayidx71.us.us.us, align 8, !tbaa !8
  %arrayidx74.us.us.epil.us = getelementptr inbounds i64, i64* %2, i64 %mul69.us
  %43 = load i64, i64* %arrayidx74.us.us.epil.us, align 8, !tbaa !8
  %arrayidx77.us.us.epil.us = getelementptr inbounds i64, i64* %call30, i64 %mul69.us
  %44 = load i64, i64* %arrayidx77.us.us.epil.us, align 8, !tbaa !8
  %mul78.us.us.epil.us = mul nsw i64 %44, %43
  %add79.us.us.epil.us = add nsw i64 %mul78.us.us.epil.us, %.pre.us
  store i64 %add79.us.us.epil.us, i64* %arrayidx71.us.us.us, align 8, !tbaa !8
  br label %blklab19.loopexit.us-lcssa.us.us

blklab19.loopexit.us-lcssa.us.us.loopexit:        ; preds = %blklab21.loopexit.us.us.unr-lcssa.loopexit.us68
  br label %blklab19.loopexit.us-lcssa.us.us

blklab19.loopexit.us-lcssa.us.us.loopexit234:     ; preds = %if.end68.us.us.epil
  br label %blklab19.loopexit.us-lcssa.us.us

blklab19.loopexit.us-lcssa.us.us:                 ; preds = %blklab19.loopexit.us-lcssa.us.us.loopexit234, %blklab19.loopexit.us-lcssa.us.us.loopexit, %while.cond57.preheader.us.split.us, %blklab19.loopexit.us-lcssa.us.us.loopexit126
  %add85.us = add nuw nsw i64 %i.1266.us, 1
  %exitcond274.us = icmp eq i64 %add85.us, %1
  br i1 %exitcond274.us, label %if.end88.loopexit235, label %while.cond57.preheader.us

if.end88.loopexit:                                ; preds = %polly.loop_exit341
  br label %if.end88

if.end88.loopexit235:                             ; preds = %blklab19.loopexit.us-lcssa.us.us
  br label %if.end88

if.end88:                                         ; preds = %if.end88.loopexit235, %if.end88.loopexit, %polly.start, %while.cond51.preheader
  %call.i = tail call noalias i8* @malloc(i64 32) #6
  %45 = bitcast i8* %call.i to %struct.Matrix*
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %46 = bitcast i8* %data_size1.i to i64*
  store i64 %mul, i64* %46, align 8, !tbaa !1
  %data2.i = bitcast i8* %call.i to i64**
  store i64* %call, i64** %data2.i, align 8, !tbaa !7
  %height3.i = getelementptr inbounds i8, i8* %call.i, i64 24
  %47 = bitcast i8* %height3.i to i64*
  store i64 %1, i64* %47, align 8, !tbaa !11
  %width4.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %48 = bitcast i8* %width4.i to i64*
  store i64 %0, i64* %48, align 8, !tbaa !10
  br i1 %a_dealloc, label %if.then92, label %if.end93

if.then92:                                        ; preds = %if.end88
  %49 = bitcast %struct.Matrix* %a to i8**
  %50 = load i8*, i8** %49, align 8, !tbaa !7
  tail call void @free(i8* %50) #6
  %51 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %51) #6
  br label %if.end93

if.end93:                                         ; preds = %if.then92, %if.end88
  br i1 %b_dealloc, label %if.then95, label %if.then110

if.then95:                                        ; preds = %if.end93
  %52 = bitcast %struct.Matrix* %b to i8**
  %53 = load i8*, i8** %52, align 8, !tbaa !7
  tail call void @free(i8* %53) #6
  %54 = bitcast %struct.Matrix* %b to i8*
  tail call void @free(i8* %54) #6
  br label %if.then110

if.then110:                                       ; preds = %if.then95, %if.end93
  %55 = bitcast i64* %call30 to i8*
  tail call void @free(i8* %55) #6
  ret %struct.Matrix* %45

polly.start:                                      ; preds = %polly.split_new_and_old
  %56 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %56, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %if.end88

polly.loop_header.preheader:                      ; preds = %polly.start
  %57 = add nsw i64 %0, -1
  %polly.fdiv_q.shr337 = ashr i64 %57, 5
  %polly.loop_guard342 = icmp sgt i64 %polly.fdiv_q.shr337, -1
  %pexp.p_div_q = lshr i64 %57, 5
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit341, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit341 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard342, label %polly.loop_header339.preheader, label %polly.loop_exit341

polly.loop_header339.preheader:                   ; preds = %polly.loop_header
  %58 = shl nsw i64 %polly.indvar, 5
  %59 = sub nsw i64 %1, %58
  %60 = add nsw i64 %59, -1
  %61 = icmp sgt i64 %60, 31
  %62 = select i1 %61, i64 31, i64 %60
  %polly.loop_guard358 = icmp sgt i64 %62, -1
  %polly.adjust_ub361 = add i64 %62, -1
  br label %polly.loop_header339

polly.loop_exit341.loopexit:                      ; preds = %polly.loop_exit349
  br label %polly.loop_exit341

polly.loop_exit341:                               ; preds = %polly.loop_exit341.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond604 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond604, label %if.end88.loopexit, label %polly.loop_header

polly.loop_header339:                             ; preds = %polly.loop_exit349, %polly.loop_header339.preheader
  %polly.indvar343 = phi i64 [ %polly.indvar_next344, %polly.loop_exit349 ], [ 0, %polly.loop_header339.preheader ]
  %63 = shl nsw i64 %polly.indvar343, 5
  %64 = sub nsw i64 %0, %63
  %65 = add nsw i64 %64, -1
  %66 = icmp sgt i64 %65, 31
  %67 = select i1 %66, i64 31, i64 %65
  %polly.adjust_ub370 = add i64 %67, -1
  br i1 %polly.loop_guard358, label %polly.loop_header347.us.preheader, label %polly.loop_exit349

polly.loop_header347.us.preheader:                ; preds = %polly.loop_header339
  br label %polly.loop_header347.us

polly.loop_header347.us:                          ; preds = %polly.loop_header347.us.preheader, %polly.loop_exit357.us
  %polly.indvar350.us = phi i64 [ %polly.indvar_next351.us, %polly.loop_exit357.us ], [ 0, %polly.loop_header347.us.preheader ]
  %68 = shl nsw i64 %polly.indvar350.us, 5
  %69 = sub nsw i64 %0, %68
  %70 = add nsw i64 %69, -1
  %71 = icmp sgt i64 %70, 31
  %72 = select i1 %71, i64 31, i64 %70
  %polly.adjust_ub379.us = add i64 %72, -1
  %73 = or i64 %72, %67
  %74 = icmp sgt i64 %73, -1
  br i1 %74, label %polly.loop_header355.us.us.us.preheader, label %polly.loop_exit357.us

polly.loop_header355.us.us.us.preheader:          ; preds = %polly.loop_header347.us
  br label %polly.loop_header355.us.us.us

polly.loop_exit357.us.loopexit:                   ; preds = %polly.loop_exit366.loopexit.us.loopexit.us.us
  br label %polly.loop_exit357.us

polly.loop_exit357.us:                            ; preds = %polly.loop_exit357.us.loopexit, %polly.loop_header347.us
  %polly.indvar_next351.us = add nuw nsw i64 %polly.indvar350.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar350.us, %pexp.p_div_q
  br i1 %exitcond.us, label %polly.loop_exit349.loopexit, label %polly.loop_header347.us

polly.loop_header355.us.us.us:                    ; preds = %polly.loop_header355.us.us.us.preheader, %polly.loop_exit366.loopexit.us.loopexit.us.us
  %polly.indvar359.us.us.us = phi i64 [ %polly.indvar_next360.us.us.us, %polly.loop_exit366.loopexit.us.loopexit.us.us ], [ 0, %polly.loop_header355.us.us.us.preheader ]
  %75 = add nuw nsw i64 %polly.indvar359.us.us.us, %58
  %76 = mul i64 %75, %0
  %77 = add i64 %76, %63
  %78 = add i64 %76, %68
  br label %polly.loop_header364.us.us.us.us

polly.loop_exit366.loopexit.us.loopexit.us.us:    ; preds = %polly.loop_exit375.loopexit.us.us.us.us
  %polly.indvar_next360.us.us.us = add nuw nsw i64 %polly.indvar359.us.us.us, 1
  %polly.loop_cond362.us.us.us = icmp sgt i64 %polly.indvar359.us.us.us, %polly.adjust_ub361
  br i1 %polly.loop_cond362.us.us.us, label %polly.loop_exit357.us.loopexit, label %polly.loop_header355.us.us.us

polly.loop_header364.us.us.us.us:                 ; preds = %polly.loop_exit375.loopexit.us.us.us.us, %polly.loop_header355.us.us.us
  %polly.indvar368.us.us.us.us = phi i64 [ %polly.indvar_next369.us.us.us.us, %polly.loop_exit375.loopexit.us.us.us.us ], [ 0, %polly.loop_header355.us.us.us ]
  %79 = add i64 %77, %polly.indvar368.us.us.us.us
  %scevgep.us.us.us.us = getelementptr i64, i64* %call, i64 %79
  %scevgep.promoted.us.us.us.us = load i64, i64* %scevgep.us.us.us.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.loop_header373.us.us.us.us

polly.loop_exit375.loopexit.us.us.us.us:          ; preds = %polly.loop_header373.us.us.us.us
  %p_add79.us.us.us.us.lcssa = phi i64 [ %p_add79.us.us.us.us, %polly.loop_header373.us.us.us.us ]
  store i64 %p_add79.us.us.us.us.lcssa, i64* %scevgep.us.us.us.us, align 8, !alias.scope !24, !noalias !26
  %polly.indvar_next369.us.us.us.us = add nuw nsw i64 %polly.indvar368.us.us.us.us, 1
  %polly.loop_cond371.us.us.us.us = icmp sgt i64 %polly.indvar368.us.us.us.us, %polly.adjust_ub370
  br i1 %polly.loop_cond371.us.us.us.us, label %polly.loop_exit366.loopexit.us.loopexit.us.us, label %polly.loop_header364.us.us.us.us

polly.loop_header373.us.us.us.us:                 ; preds = %polly.loop_header373.us.us.us.us, %polly.loop_header364.us.us.us.us
  %p_add79476.us.us.us.us = phi i64 [ %p_add79.us.us.us.us, %polly.loop_header373.us.us.us.us ], [ %scevgep.promoted.us.us.us.us, %polly.loop_header364.us.us.us.us ]
  %polly.indvar377.us.us.us.us = phi i64 [ %polly.indvar_next378.us.us.us.us, %polly.loop_header373.us.us.us.us ], [ 0, %polly.loop_header364.us.us.us.us ]
  %80 = add i64 %78, %polly.indvar377.us.us.us.us
  %scevgep381.us.us.us.us = getelementptr i64, i64* %2, i64 %80
  %_p_scalar_382.us.us.us.us = load i64, i64* %scevgep381.us.us.us.us, align 8, !alias.scope !27, !noalias !29
  %scevgep383.us.us.us.us = getelementptr i64, i64* %call30, i64 %80
  %_p_scalar_384.us.us.us.us = load i64, i64* %scevgep383.us.us.us.us, align 8, !alias.scope !28, !noalias !30
  %p_mul78.us.us.us.us = mul nsw i64 %_p_scalar_384.us.us.us.us, %_p_scalar_382.us.us.us.us
  %p_add79.us.us.us.us = add nsw i64 %p_mul78.us.us.us.us, %p_add79476.us.us.us.us
  %polly.indvar_next378.us.us.us.us = add nuw nsw i64 %polly.indvar377.us.us.us.us, 1
  %polly.loop_cond380.us.us.us.us = icmp sgt i64 %polly.indvar377.us.us.us.us, %polly.adjust_ub379.us
  br i1 %polly.loop_cond380.us.us.us.us, label %polly.loop_exit375.loopexit.us.us.us.us, label %polly.loop_header373.us.us.us.us

polly.loop_exit349.loopexit:                      ; preds = %polly.loop_exit357.us
  br label %polly.loop_exit349

polly.loop_exit349:                               ; preds = %polly.loop_exit349.loopexit, %polly.loop_header339
  %polly.indvar_next344 = add nuw nsw i64 %polly.indvar343, 1
  %exitcond603 = icmp eq i64 %polly.indvar343, %polly.fdiv_q.shr337
  br i1 %exitcond603, label %polly.loop_exit341.loopexit, label %polly.loop_header339

polly.start387:                                   ; preds = %polly.split_new_and_old385
  %81 = add nsw i64 %1, -1
  %polly.fdiv_q.shr433 = ashr i64 %81, 5
  %polly.loop_guard438 = icmp sgt i64 %polly.fdiv_q.shr433, -1
  br i1 %polly.loop_guard438, label %polly.loop_header435.preheader, label %polly.split_new_and_old

polly.loop_header435.preheader:                   ; preds = %polly.start387
  %82 = add nsw i64 %0, -1
  %polly.fdiv_q.shr443 = ashr i64 %82, 5
  %polly.loop_guard448 = icmp sgt i64 %polly.fdiv_q.shr443, -1
  %notrhs = icmp ne i64 %0, 1
  br label %polly.loop_header435

polly.loop_header435:                             ; preds = %polly.loop_exit447, %polly.loop_header435.preheader
  %polly.indvar439 = phi i64 [ %polly.indvar_next440, %polly.loop_exit447 ], [ 0, %polly.loop_header435.preheader ]
  br i1 %polly.loop_guard448, label %polly.loop_header445.preheader, label %polly.loop_exit447

polly.loop_header445.preheader:                   ; preds = %polly.loop_header435
  %83 = shl nsw i64 %polly.indvar439, 5
  %84 = sub nsw i64 %1, %83
  %85 = add nsw i64 %84, -1
  %86 = icmp sgt i64 %85, 31
  %87 = select i1 %86, i64 31, i64 %85
  %polly.loop_guard457 = icmp sgt i64 %87, -1
  %polly.adjust_ub460 = add i64 %87, -1
  br i1 %polly.loop_guard457, label %polly.loop_header445.us.preheader, label %polly.loop_exit447

polly.loop_header445.us.preheader:                ; preds = %polly.loop_header445.preheader
  br label %polly.loop_header445.us

polly.loop_header445.us:                          ; preds = %polly.loop_header445.us.preheader, %polly.loop_exit456.loopexit.us
  %polly.indvar449.us = phi i64 [ %polly.indvar_next450.us, %polly.loop_exit456.loopexit.us ], [ 0, %polly.loop_header445.us.preheader ]
  %88 = shl i64 %polly.indvar449.us, 5
  %89 = sub i64 %88, %0
  %90 = icmp sgt i64 %89, -32
  %smax = select i1 %90, i64 %89, i64 -32
  %91 = sub i64 -2, %smax
  %92 = icmp sgt i64 %91, -1
  %smax229 = select i1 %92, i64 %91, i64 -1
  %93 = add i64 %smax229, 2
  %94 = shl i64 %polly.indvar449.us, 5
  %95 = sub i64 %94, %0
  %96 = icmp sgt i64 %95, -32
  %smax671 = select i1 %96, i64 %95, i64 -32
  %97 = sub i64 -2, %smax671
  %98 = icmp sgt i64 %97, -1
  %smax672 = select i1 %98, i64 %97, i64 -1
  %99 = add i64 %smax672, -2
  %100 = lshr i64 %99, 2
  %101 = add nuw nsw i64 %100, 1
  %102 = add i64 %smax672, 2
  %103 = sub nsw i64 %0, %94
  %104 = add nsw i64 %103, -1
  %105 = icmp sgt i64 %104, 31
  %106 = select i1 %105, i64 31, i64 %104
  %polly.loop_guard466.us = icmp sgt i64 %106, -1
  %polly.adjust_ub469.us = add i64 %106, -1
  br i1 %polly.loop_guard466.us, label %polly.loop_header454.us.us.preheader, label %polly.loop_exit456.loopexit.us

polly.loop_header454.us.us.preheader:             ; preds = %polly.loop_header445.us
  %min.iters.check638 = icmp ult i64 %102, 4
  %n.vec641 = and i64 %102, -4
  %broadcast.splatinsert654 = insertelement <2 x i64> undef, i64 %94, i32 0
  %broadcast.splat655 = shufflevector <2 x i64> %broadcast.splatinsert654, <2 x i64> undef, <2 x i32> zeroinitializer
  %xtraiter673 = and i64 %101, 1
  %107 = icmp eq i64 %100, 0
  %lcmp.mod674 = icmp eq i64 %xtraiter673, 0
  %cmp.n650 = icmp eq i64 %102, %n.vec641
  %unroll_iter675 = sub nsw i64 %101, %xtraiter673
  %108 = or i1 %notrhs, %min.iters.check638
  %.lhs665.1.lhs = or i64 %94, 4
  br i1 %108, label %polly.loop_header454.us.us.us.preheader, label %polly.loop_header454.us.us.preheader236

polly.loop_header454.us.us.preheader236:          ; preds = %polly.loop_header454.us.us.preheader
  br label %polly.loop_header454.us.us

polly.loop_header454.us.us.us.preheader:          ; preds = %polly.loop_header454.us.us.preheader
  %xtraiter230 = and i64 %93, 1
  %109 = icmp eq i64 %smax229, -1
  %lcmp.mod231 = icmp eq i64 %xtraiter230, 0
  %unroll_iter232 = sub i64 %93, %xtraiter230
  br label %polly.loop_header454.us.us.us

polly.loop_header454.us.us.us:                    ; preds = %polly.loop_header454.us.us.us.preheader, %polly.loop_exit465.loopexit.us.us.loopexit.us
  %polly.indvar458.us.us.us = phi i64 [ %polly.indvar_next459.us.us.us, %polly.loop_exit465.loopexit.us.us.loopexit.us ], [ 0, %polly.loop_header454.us.us.us.preheader ]
  %110 = add nuw nsw i64 %polly.indvar458.us.us.us, %83
  %111 = mul i64 %110, %0
  br i1 %109, label %polly.loop_exit465.loopexit.us.us.loopexit.us.unr-lcssa, label %polly.loop_header463.us.us.us.preheader

polly.loop_header463.us.us.us.preheader:          ; preds = %polly.loop_header454.us.us.us
  br label %polly.loop_header463.us.us.us

polly.loop_header463.us.us.us:                    ; preds = %polly.loop_header463.us.us.us.preheader, %polly.loop_header463.us.us.us
  %polly.indvar467.us.us.us = phi i64 [ %polly.indvar_next468.us.us.us.1, %polly.loop_header463.us.us.us ], [ 0, %polly.loop_header463.us.us.us.preheader ]
  %niter233 = phi i64 [ %niter233.nsub.1, %polly.loop_header463.us.us.us ], [ %unroll_iter232, %polly.loop_header463.us.us.us.preheader ]
  %112 = add nuw nsw i64 %polly.indvar467.us.us.us, %94
  %113 = add i64 %112, %111
  %scevgep471.us.us.us = getelementptr i64, i64* %3, i64 %113
  %_p_scalar_472.us.us.us = load i64, i64* %scevgep471.us.us.us, align 8, !alias.scope !31, !noalias !33
  %114 = mul i64 %112, %0
  %115 = add i64 %114, %110
  %scevgep473.us.us.us = getelementptr i64, i64* %call30, i64 %115
  store i64 %_p_scalar_472.us.us.us, i64* %scevgep473.us.us.us, align 8, !alias.scope !34, !noalias !35
  %polly.indvar_next468.us.us.us = or i64 %polly.indvar467.us.us.us, 1
  %116 = add nuw nsw i64 %polly.indvar_next468.us.us.us, %94
  %117 = add i64 %116, %111
  %scevgep471.us.us.us.1 = getelementptr i64, i64* %3, i64 %117
  %_p_scalar_472.us.us.us.1 = load i64, i64* %scevgep471.us.us.us.1, align 8, !alias.scope !31, !noalias !33
  %118 = mul i64 %116, %0
  %119 = add i64 %118, %110
  %scevgep473.us.us.us.1 = getelementptr i64, i64* %call30, i64 %119
  store i64 %_p_scalar_472.us.us.us.1, i64* %scevgep473.us.us.us.1, align 8, !alias.scope !34, !noalias !35
  %polly.indvar_next468.us.us.us.1 = add nuw nsw i64 %polly.indvar467.us.us.us, 2
  %niter233.nsub.1 = add i64 %niter233, -2
  %niter233.ncmp.1 = icmp eq i64 %niter233.nsub.1, 0
  br i1 %niter233.ncmp.1, label %polly.loop_exit465.loopexit.us.us.loopexit.us.unr-lcssa.loopexit, label %polly.loop_header463.us.us.us, !llvm.loop !36

polly.loop_exit465.loopexit.us.us.loopexit.us.unr-lcssa.loopexit: ; preds = %polly.loop_header463.us.us.us
  %polly.indvar_next468.us.us.us.1.lcssa = phi i64 [ %polly.indvar_next468.us.us.us.1, %polly.loop_header463.us.us.us ]
  br label %polly.loop_exit465.loopexit.us.us.loopexit.us.unr-lcssa

polly.loop_exit465.loopexit.us.us.loopexit.us.unr-lcssa: ; preds = %polly.loop_exit465.loopexit.us.us.loopexit.us.unr-lcssa.loopexit, %polly.loop_header454.us.us.us
  %polly.indvar467.us.us.us.unr = phi i64 [ 0, %polly.loop_header454.us.us.us ], [ %polly.indvar_next468.us.us.us.1.lcssa, %polly.loop_exit465.loopexit.us.us.loopexit.us.unr-lcssa.loopexit ]
  br i1 %lcmp.mod231, label %polly.loop_exit465.loopexit.us.us.loopexit.us, label %polly.loop_header463.us.us.us.epil

polly.loop_header463.us.us.us.epil:               ; preds = %polly.loop_exit465.loopexit.us.us.loopexit.us.unr-lcssa
  %120 = add nuw nsw i64 %polly.indvar467.us.us.us.unr, %94
  %121 = add i64 %120, %111
  %scevgep471.us.us.us.epil = getelementptr i64, i64* %3, i64 %121
  %_p_scalar_472.us.us.us.epil = load i64, i64* %scevgep471.us.us.us.epil, align 8, !alias.scope !31, !noalias !33
  %122 = mul i64 %120, %0
  %123 = add i64 %122, %110
  %scevgep473.us.us.us.epil = getelementptr i64, i64* %call30, i64 %123
  store i64 %_p_scalar_472.us.us.us.epil, i64* %scevgep473.us.us.us.epil, align 8, !alias.scope !34, !noalias !35
  br label %polly.loop_exit465.loopexit.us.us.loopexit.us

polly.loop_exit465.loopexit.us.us.loopexit.us:    ; preds = %polly.loop_exit465.loopexit.us.us.loopexit.us.unr-lcssa, %polly.loop_header463.us.us.us.epil
  %polly.indvar_next459.us.us.us = add nuw nsw i64 %polly.indvar458.us.us.us, 1
  %polly.loop_cond461.us.us.us = icmp sgt i64 %polly.indvar458.us.us.us, %polly.adjust_ub460
  br i1 %polly.loop_cond461.us.us.us, label %polly.loop_exit456.loopexit.us.loopexit, label %polly.loop_header454.us.us.us

polly.loop_exit456.loopexit.us.loopexit:          ; preds = %polly.loop_exit465.loopexit.us.us.loopexit.us
  br label %polly.loop_exit456.loopexit.us

polly.loop_exit456.loopexit.us.loopexit237:       ; preds = %polly.loop_exit465.loopexit.us.us
  br label %polly.loop_exit456.loopexit.us

polly.loop_exit456.loopexit.us:                   ; preds = %polly.loop_exit456.loopexit.us.loopexit237, %polly.loop_exit456.loopexit.us.loopexit, %polly.loop_header445.us
  %polly.indvar_next450.us = add nuw nsw i64 %polly.indvar449.us, 1
  %exitcond606 = icmp eq i64 %polly.indvar449.us, %polly.fdiv_q.shr443
  br i1 %exitcond606, label %polly.loop_exit447.loopexit, label %polly.loop_header445.us

polly.loop_header454.us.us:                       ; preds = %polly.loop_header454.us.us.preheader236, %polly.loop_exit465.loopexit.us.us
  %polly.indvar458.us.us = phi i64 [ %polly.indvar_next459.us.us, %polly.loop_exit465.loopexit.us.us ], [ 0, %polly.loop_header454.us.us.preheader236 ]
  %124 = add nuw nsw i64 %polly.indvar458.us.us, %83
  br i1 %107, label %middle.block635.unr-lcssa, label %vector.body634.preheader

vector.body634.preheader:                         ; preds = %polly.loop_header454.us.us
  br label %vector.body634

vector.body634:                                   ; preds = %vector.body634.preheader, %vector.body634
  %vec.ind651 = phi <2 x i64> [ %step.add653.1, %vector.body634 ], [ <i64 0, i64 1>, %vector.body634.preheader ]
  %niter676 = phi i64 [ %niter676.nsub.1, %vector.body634 ], [ %unroll_iter675, %vector.body634.preheader ]
  %125 = add nuw nsw <2 x i64> %vec.ind651, %broadcast.splat655
  %.lhs665 = extractelement <2 x i64> %125, i32 0
  %126 = add i64 %.lhs665, %124
  %127 = getelementptr i64, i64* %3, i64 %126
  %128 = bitcast i64* %127 to <2 x i64>*
  %wide.load658 = load <2 x i64>, <2 x i64>* %128, align 8, !alias.scope !31, !noalias !33
  %129 = getelementptr i64, i64* %127, i64 2
  %130 = bitcast i64* %129 to <2 x i64>*
  %wide.load659 = load <2 x i64>, <2 x i64>* %130, align 8, !alias.scope !31, !noalias !33
  %131 = getelementptr i64, i64* %call30, i64 %126
  %132 = bitcast i64* %131 to <2 x i64>*
  store <2 x i64> %wide.load658, <2 x i64>* %132, align 8, !alias.scope !34, !noalias !35
  %133 = getelementptr i64, i64* %131, i64 2
  %134 = bitcast i64* %133 to <2 x i64>*
  store <2 x i64> %wide.load659, <2 x i64>* %134, align 8, !alias.scope !34, !noalias !35
  %step.add653.1 = add <2 x i64> %vec.ind651, <i64 8, i64 8>
  %.lhs665.1.lhs.lhs = extractelement <2 x i64> %vec.ind651, i32 0
  %.lhs665.1 = add i64 %124, %.lhs665.1.lhs
  %135 = add i64 %.lhs665.1, %.lhs665.1.lhs.lhs
  %136 = getelementptr i64, i64* %3, i64 %135
  %137 = bitcast i64* %136 to <2 x i64>*
  %wide.load658.1 = load <2 x i64>, <2 x i64>* %137, align 8, !alias.scope !31, !noalias !33
  %138 = getelementptr i64, i64* %136, i64 2
  %139 = bitcast i64* %138 to <2 x i64>*
  %wide.load659.1 = load <2 x i64>, <2 x i64>* %139, align 8, !alias.scope !31, !noalias !33
  %140 = getelementptr i64, i64* %call30, i64 %135
  %141 = bitcast i64* %140 to <2 x i64>*
  store <2 x i64> %wide.load658.1, <2 x i64>* %141, align 8, !alias.scope !34, !noalias !35
  %142 = getelementptr i64, i64* %140, i64 2
  %143 = bitcast i64* %142 to <2 x i64>*
  store <2 x i64> %wide.load659.1, <2 x i64>* %143, align 8, !alias.scope !34, !noalias !35
  %niter676.nsub.1 = add i64 %niter676, -2
  %niter676.ncmp.1 = icmp eq i64 %niter676.nsub.1, 0
  br i1 %niter676.ncmp.1, label %middle.block635.unr-lcssa.loopexit, label %vector.body634, !llvm.loop !37

middle.block635.unr-lcssa.loopexit:               ; preds = %vector.body634
  %step.add653.1.lcssa = phi <2 x i64> [ %step.add653.1, %vector.body634 ]
  br label %middle.block635.unr-lcssa

middle.block635.unr-lcssa:                        ; preds = %middle.block635.unr-lcssa.loopexit, %polly.loop_header454.us.us
  %vec.ind651.unr = phi <2 x i64> [ <i64 0, i64 1>, %polly.loop_header454.us.us ], [ %step.add653.1.lcssa, %middle.block635.unr-lcssa.loopexit ]
  br i1 %lcmp.mod674, label %middle.block635, label %vector.body634.epil

vector.body634.epil:                              ; preds = %middle.block635.unr-lcssa
  %144 = add nuw nsw <2 x i64> %vec.ind651.unr, %broadcast.splat655
  %.lhs665.epil = extractelement <2 x i64> %144, i32 0
  %145 = add i64 %.lhs665.epil, %124
  %146 = getelementptr i64, i64* %3, i64 %145
  %147 = bitcast i64* %146 to <2 x i64>*
  %wide.load658.epil = load <2 x i64>, <2 x i64>* %147, align 8, !alias.scope !31, !noalias !33
  %148 = getelementptr i64, i64* %146, i64 2
  %149 = bitcast i64* %148 to <2 x i64>*
  %wide.load659.epil = load <2 x i64>, <2 x i64>* %149, align 8, !alias.scope !31, !noalias !33
  %150 = getelementptr i64, i64* %call30, i64 %145
  %151 = bitcast i64* %150 to <2 x i64>*
  store <2 x i64> %wide.load658.epil, <2 x i64>* %151, align 8, !alias.scope !34, !noalias !35
  %152 = getelementptr i64, i64* %150, i64 2
  %153 = bitcast i64* %152 to <2 x i64>*
  store <2 x i64> %wide.load659.epil, <2 x i64>* %153, align 8, !alias.scope !34, !noalias !35
  br label %middle.block635

middle.block635:                                  ; preds = %vector.body634.epil, %middle.block635.unr-lcssa
  br i1 %cmp.n650, label %polly.loop_exit465.loopexit.us.us, label %polly.loop_header463.us.us.preheader

polly.loop_header463.us.us.preheader:             ; preds = %middle.block635
  br label %polly.loop_header463.us.us

polly.loop_exit465.loopexit.us.us.loopexit:       ; preds = %polly.loop_header463.us.us
  br label %polly.loop_exit465.loopexit.us.us

polly.loop_exit465.loopexit.us.us:                ; preds = %polly.loop_exit465.loopexit.us.us.loopexit, %middle.block635
  %polly.indvar_next459.us.us = add nuw nsw i64 %polly.indvar458.us.us, 1
  %polly.loop_cond461.us.us = icmp sgt i64 %polly.indvar458.us.us, %polly.adjust_ub460
  br i1 %polly.loop_cond461.us.us, label %polly.loop_exit456.loopexit.us.loopexit237, label %polly.loop_header454.us.us

polly.loop_header463.us.us:                       ; preds = %polly.loop_header463.us.us.preheader, %polly.loop_header463.us.us
  %polly.indvar467.us.us = phi i64 [ %polly.indvar_next468.us.us, %polly.loop_header463.us.us ], [ %n.vec641, %polly.loop_header463.us.us.preheader ]
  %154 = add i64 %124, %94
  %155 = add i64 %154, %polly.indvar467.us.us
  %scevgep471.us.us = getelementptr i64, i64* %3, i64 %155
  %_p_scalar_472.us.us = load i64, i64* %scevgep471.us.us, align 8, !alias.scope !31, !noalias !33
  %scevgep473.us.us = getelementptr i64, i64* %call30, i64 %155
  store i64 %_p_scalar_472.us.us, i64* %scevgep473.us.us, align 8, !alias.scope !34, !noalias !35
  %polly.indvar_next468.us.us = add nuw nsw i64 %polly.indvar467.us.us, 1
  %polly.loop_cond470.us.us = icmp sgt i64 %polly.indvar467.us.us, %polly.adjust_ub469.us
  br i1 %polly.loop_cond470.us.us, label %polly.loop_exit465.loopexit.us.us.loopexit, label %polly.loop_header463.us.us, !llvm.loop !36

polly.loop_exit447.loopexit:                      ; preds = %polly.loop_exit456.loopexit.us
  br label %polly.loop_exit447

polly.loop_exit447:                               ; preds = %polly.loop_exit447.loopexit, %polly.loop_header445.preheader, %polly.loop_header435
  %polly.indvar_next440 = add nuw nsw i64 %polly.indvar439, 1
  %exitcond607 = icmp eq i64 %polly.indvar439, %polly.fdiv_q.shr433
  br i1 %exitcond607, label %polly.split_new_and_old.loopexit, label %polly.loop_header435
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #4 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6
  %0 = load i64*, i64** %call, align 8, !tbaa !9
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end204, label %if.end5

if.end5:                                          ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8, !tbaa !8
  %call10 = tail call i64* @create1DArray(i32 0, i32 7) #6
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
  tail call void @printf_s(i64* %call10, i64 7) #6
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
  %7 = bitcast i64* %5 to i8*
  br i1 %cmp50, label %blklab24, label %if.end53

if.end53:                                         ; preds = %if.end5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %8) #8
  tail call void @exit(i32 -1) #9
  unreachable

blklab24:                                         ; preds = %if.end5
  %data56 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 0
  %10 = load i64*, i64** %data56, align 8, !tbaa !7
  %arrayidx61 = getelementptr inbounds i64, i64* %10, i64 %sub47
  %11 = load i64, i64* %arrayidx61, align 8, !tbaa !8
  %cmp63 = icmp eq i64 %11, %sub46
  br i1 %cmp63, label %blklab25, label %if.end66

if.end66:                                         ; preds = %blklab24
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %12) #8
  tail call void @exit(i32 -1) #9
  unreachable

blklab25:                                         ; preds = %blklab24
  %cmp68 = icmp eq i64 %1, 2000
  %data73 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call40, i64 0, i32 0
  %14 = load i64*, i64** %data73, align 8, !tbaa !7
  %arrayidx78 = getelementptr inbounds i64, i64* %14, i64 %sub47
  br i1 %cmp68, label %if.end71, label %if.then158

if.end71:                                         ; preds = %blklab25
  %15 = load i64, i64* %arrayidx78, align 8, !tbaa !8
  %cmp79 = icmp eq i64 %15, 3996001000
  br i1 %cmp79, label %if.then158, label %if.end82

if.end82:                                         ; preds = %if.end71
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %16) #8
  tail call void @exit(i32 -1) #9
  unreachable

if.then158:                                       ; preds = %blklab25, %if.end71
  %call88 = tail call i64* @create1DArray(i32 0, i32 27) #6
  %18 = bitcast i64* %call88 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %18, align 8, !tbaa !8
  %arrayidx91 = getelementptr inbounds i64, i64* %call88, i64 2
  %19 = bitcast i64* %arrayidx91 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %19, align 8, !tbaa !8
  %arrayidx93 = getelementptr inbounds i64, i64* %call88, i64 4
  %20 = bitcast i64* %arrayidx93 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %20, align 8, !tbaa !8
  %arrayidx95 = getelementptr inbounds i64, i64* %call88, i64 6
  %21 = bitcast i64* %arrayidx95 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %21, align 8, !tbaa !8
  %arrayidx97 = getelementptr inbounds i64, i64* %call88, i64 8
  %22 = bitcast i64* %arrayidx97 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %22, align 8, !tbaa !8
  %arrayidx99 = getelementptr inbounds i64, i64* %call88, i64 10
  %23 = bitcast i64* %arrayidx99 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %23, align 8, !tbaa !8
  %arrayidx101 = getelementptr inbounds i64, i64* %call88, i64 12
  %24 = bitcast i64* %arrayidx101 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %24, align 8, !tbaa !8
  %arrayidx103 = getelementptr inbounds i64, i64* %call88, i64 14
  %25 = bitcast i64* %arrayidx103 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %25, align 8, !tbaa !8
  %arrayidx105 = getelementptr inbounds i64, i64* %call88, i64 16
  %26 = bitcast i64* %arrayidx105 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %26, align 8, !tbaa !8
  %arrayidx107 = getelementptr inbounds i64, i64* %call88, i64 18
  %27 = bitcast i64* %arrayidx107 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %27, align 8, !tbaa !8
  %arrayidx109 = getelementptr inbounds i64, i64* %call88, i64 20
  %28 = bitcast i64* %arrayidx109 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %28, align 8, !tbaa !8
  %arrayidx111 = getelementptr inbounds i64, i64* %call88, i64 22
  %29 = bitcast i64* %arrayidx111 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %29, align 8, !tbaa !8
  %arrayidx113 = getelementptr inbounds i64, i64* %call88, i64 24
  %30 = bitcast i64* %arrayidx113 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %30, align 8, !tbaa !8
  %arrayidx115 = getelementptr inbounds i64, i64* %call88, i64 26
  store i64 32, i64* %arrayidx115, align 8, !tbaa !8
  tail call void @printf_s(i64* %call88, i64 27) #6
  %31 = load i64, i64* %arrayidx78, align 8, !tbaa !8
  %call123 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %31)
  %call128 = tail call i64* @create1DArray(i32 0, i32 25) #6
  %32 = bitcast i64* %call128 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %32, align 8, !tbaa !8
  %arrayidx131 = getelementptr inbounds i64, i64* %call128, i64 2
  %33 = bitcast i64* %arrayidx131 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %33, align 8, !tbaa !8
  %arrayidx133 = getelementptr inbounds i64, i64* %call128, i64 4
  %34 = bitcast i64* %arrayidx133 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %34, align 8, !tbaa !8
  %arrayidx135 = getelementptr inbounds i64, i64* %call128, i64 6
  %35 = bitcast i64* %arrayidx135 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %35, align 8, !tbaa !8
  %arrayidx137 = getelementptr inbounds i64, i64* %call128, i64 8
  %36 = bitcast i64* %arrayidx137 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %36, align 8, !tbaa !8
  %arrayidx139 = getelementptr inbounds i64, i64* %call128, i64 10
  %37 = bitcast i64* %arrayidx139 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %37, align 8, !tbaa !8
  %arrayidx141 = getelementptr inbounds i64, i64* %call128, i64 12
  %38 = bitcast i64* %arrayidx141 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %38, align 8, !tbaa !8
  %arrayidx143 = getelementptr inbounds i64, i64* %call128, i64 14
  %39 = bitcast i64* %arrayidx143 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %39, align 8, !tbaa !8
  %arrayidx145 = getelementptr inbounds i64, i64* %call128, i64 16
  %40 = bitcast i64* %arrayidx145 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %40, align 8, !tbaa !8
  %arrayidx147 = getelementptr inbounds i64, i64* %call128, i64 18
  %41 = bitcast i64* %arrayidx147 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %41, align 8, !tbaa !8
  %arrayidx149 = getelementptr inbounds i64, i64* %call128, i64 20
  %42 = bitcast i64* %arrayidx149 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %42, align 8, !tbaa !8
  %arrayidx151 = getelementptr inbounds i64, i64* %call128, i64 22
  %43 = bitcast i64* %arrayidx151 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %43, align 8, !tbaa !8
  %arrayidx153 = getelementptr inbounds i64, i64* %call128, i64 24
  store i64 101, i64* %arrayidx153, align 8, !tbaa !8
  tail call void @println_s(i64* %call128, i64 25) #6
  %phitmp = bitcast i64* %call128 to i8*
  %phitmp336 = bitcast i64* %call88 to i8*
  %phitmp337 = bitcast i64* %call10 to i8*
  %44 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %44) #6
  tail call void @free(i8* %7) #6
  %45 = bitcast %struct.Matrix* %call22 to i8*
  tail call void @free(i8* %45) #6
  %46 = bitcast %struct.Matrix* %call31 to i8**
  %47 = load i8*, i8** %46, align 8, !tbaa !7
  tail call void @free(i8* %47) #6
  %48 = bitcast %struct.Matrix* %call31 to i8*
  tail call void @free(i8* %48) #6
  %49 = bitcast %struct.Matrix* %call40 to i8**
  %50 = load i8*, i8** %49, align 8, !tbaa !7
  tail call void @free(i8* %50) #6
  %51 = bitcast %struct.Matrix* %call40 to i8*
  tail call void @free(i8* %51) #6
  tail call void @free(i8* %phitmp337) #6
  tail call void @free(i8* %phitmp336) #6
  tail call void @free(i8* %phitmp) #6
  br label %if.end204

if.end204:                                        ; preds = %if.then158, %entry.split
  tail call void @exit(i32 0) #9
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #2

declare i64* @parseStringToInt(i64*) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @putchar(i32) local_unnamed_addr #6

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #7

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #7

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #7

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readnone }
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
!12 = distinct !{!12, !13, !"polly.alias.scope.call"}
!13 = distinct !{!13, !"polly.alias.scope.domain"}
!14 = !{}
!15 = distinct !{!15, !16, !17, !18}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
!17 = !{!"llvm.loop.vectorize.width", i32 1}
!18 = !{!"llvm.loop.interleave.count", i32 1}
!19 = distinct !{!19, !17, !18}
!20 = distinct !{!20, !21, !17, !18}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !17, !18}
!23 = distinct !{!23, !21, !17, !18}
!24 = distinct !{!24, !25, !"polly.alias.scope.call"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27, !28}
!27 = distinct !{!27, !25, !"polly.alias.scope."}
!28 = distinct !{!28, !25, !"polly.alias.scope.call30"}
!29 = !{!28, !24}
!30 = !{!27, !24}
!31 = distinct !{!31, !32, !"polly.alias.scope."}
!32 = distinct !{!32, !"polly.alias.scope.domain"}
!33 = !{!34}
!34 = distinct !{!34, !32, !"polly.alias.scope.call30"}
!35 = !{!31}
!36 = distinct !{!36, !17, !18}
!37 = distinct !{!37, !17, !18}
