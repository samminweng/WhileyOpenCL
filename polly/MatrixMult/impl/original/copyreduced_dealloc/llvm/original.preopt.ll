; ModuleID = 'llvm/original.preopt.ll.tmp'
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
  %cmp184 = icmp sgt i64 %1, 0
  br i1 %cmp184, label %polly.split_new_and_old, label %if.end56

polly.split_new_and_old:                          ; preds = %entry.split
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
  %xtraiter = and i64 %0, 1
  %13 = icmp eq i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %unroll_iter = sub i64 %0, %xtraiter
  br label %while.cond27.preheader.us

while.cond27.preheader.us:                        ; preds = %blklab15.loopexit.us-lcssa.us.us, %while.cond27.preheader.us.preheader
  %i.0185.us = phi i64 [ %add53.us, %blklab15.loopexit.us-lcssa.us.us ], [ 0, %while.cond27.preheader.us.preheader ]
  %mul39.us = mul nsw i64 %i.0185.us, %0
  br i1 %13, label %while.cond33.preheader.us.us.us, label %while.cond27.preheader.us.split

while.cond33.preheader.us.us.us:                  ; preds = %while.cond27.preheader.us
  %arrayidx.us.us.us = getelementptr inbounds i64, i64* %call, i64 %mul39.us
  br i1 %lcmp.mod, label %blklab15.loopexit.us-lcssa.us.us, label %if.end38.us.us.epil.us

if.end38.us.us.epil.us:                           ; preds = %while.cond33.preheader.us.us.us
  %.pre.us = load i64, i64* %arrayidx.us.us.us, align 8, !tbaa !8
  %arrayidx42.us.us.epil.us = getelementptr inbounds i64, i64* %2, i64 %mul39.us
  %14 = load i64, i64* %arrayidx42.us.us.epil.us, align 8, !tbaa !8
  %15 = load i64, i64* %3, align 8, !tbaa !8
  %mul46.us.us.epil.us = mul nsw i64 %15, %14
  %add47.us.us.epil.us = add nsw i64 %mul46.us.us.epil.us, %.pre.us
  store i64 %add47.us.us.epil.us, i64* %arrayidx.us.us.us, align 8, !tbaa !8
  br label %blklab15.loopexit.us-lcssa.us.us

while.cond27.preheader.us.split:                  ; preds = %while.cond27.preheader.us
  br i1 %lcmp.mod, label %while.cond33.preheader.us.us.us50.preheader, label %while.cond33.preheader.us.us.preheader

while.cond33.preheader.us.us.preheader:           ; preds = %while.cond27.preheader.us.split
  br label %while.cond33.preheader.us.us

while.cond33.preheader.us.us.us50.preheader:      ; preds = %while.cond27.preheader.us.split
  br label %while.cond33.preheader.us.us.us50

while.cond33.preheader.us.us.us50:                ; preds = %while.cond33.preheader.us.us.us50.preheader, %blklab17.loopexit.us.us.unr-lcssa.loopexit.us91
  %j.0182.us.us.us51 = phi i64 [ %add52.us.us.us88, %blklab17.loopexit.us.us.unr-lcssa.loopexit.us91 ], [ 0, %while.cond33.preheader.us.us.us50.preheader ]
  %add.us.us.us52 = add nsw i64 %j.0182.us.us.us51, %mul39.us
  %arrayidx.us.us.us53 = getelementptr inbounds i64, i64* %call, i64 %add.us.us.us52
  %.pre.us54 = load i64, i64* %arrayidx.us.us.us53, align 8, !tbaa !8
  br label %if.end38.us.us.us55

if.end38.us.us.us55:                              ; preds = %while.cond33.preheader.us.us.us50, %if.end38.us.us.us55
  %16 = phi i64 [ %add47.us.us.1.us72, %if.end38.us.us.us55 ], [ %.pre.us54, %while.cond33.preheader.us.us.us50 ]
  %k.0180.us.us.us56 = phi i64 [ %add51.us.us.1.us73, %if.end38.us.us.us55 ], [ 0, %while.cond33.preheader.us.us.us50 ]
  %niter.us57 = phi i64 [ %niter.nsub.1.us74, %if.end38.us.us.us55 ], [ %unroll_iter, %while.cond33.preheader.us.us.us50 ]
  %add41.us.us.us58 = add nsw i64 %k.0180.us.us.us56, %mul39.us
  %arrayidx42.us.us.us59 = getelementptr inbounds i64, i64* %2, i64 %add41.us.us.us58
  %17 = load i64, i64* %arrayidx42.us.us.us59, align 8, !tbaa !8
  %mul43.us.us.us60 = mul nsw i64 %k.0180.us.us.us56, %0
  %add44.us.us.us61 = add nsw i64 %mul43.us.us.us60, %j.0182.us.us.us51
  %arrayidx45.us.us.us62 = getelementptr inbounds i64, i64* %3, i64 %add44.us.us.us61
  %18 = load i64, i64* %arrayidx45.us.us.us62, align 8, !tbaa !8
  %mul46.us.us.us63 = mul nsw i64 %18, %17
  %add47.us.us.us64 = add nsw i64 %mul46.us.us.us63, %16
  store i64 %add47.us.us.us64, i64* %arrayidx.us.us.us53, align 8, !tbaa !8
  %add51.us.us.us65 = or i64 %k.0180.us.us.us56, 1
  %add41.us.us.1.us66 = add nsw i64 %add51.us.us.us65, %mul39.us
  %arrayidx42.us.us.1.us67 = getelementptr inbounds i64, i64* %2, i64 %add41.us.us.1.us66
  %19 = load i64, i64* %arrayidx42.us.us.1.us67, align 8, !tbaa !8
  %mul43.us.us.1.us68 = mul nsw i64 %add51.us.us.us65, %0
  %add44.us.us.1.us69 = add nsw i64 %mul43.us.us.1.us68, %j.0182.us.us.us51
  %arrayidx45.us.us.1.us70 = getelementptr inbounds i64, i64* %3, i64 %add44.us.us.1.us69
  %20 = load i64, i64* %arrayidx45.us.us.1.us70, align 8, !tbaa !8
  %mul46.us.us.1.us71 = mul nsw i64 %20, %19
  %add47.us.us.1.us72 = add nsw i64 %mul46.us.us.1.us71, %add47.us.us.us64
  store i64 %add47.us.us.1.us72, i64* %arrayidx.us.us.us53, align 8, !tbaa !8
  %add51.us.us.1.us73 = add nuw nsw i64 %k.0180.us.us.us56, 2
  %niter.nsub.1.us74 = add i64 %niter.us57, -2
  %niter.ncmp.1.us75 = icmp eq i64 %niter.nsub.1.us74, 0
  br i1 %niter.ncmp.1.us75, label %blklab17.loopexit.us.us.unr-lcssa.loopexit.us91, label %if.end38.us.us.us55

blklab17.loopexit.us.us.unr-lcssa.loopexit.us91:  ; preds = %if.end38.us.us.us55
  %add52.us.us.us88 = add nuw nsw i64 %j.0182.us.us.us51, 1
  %exitcond187.us.us.us89 = icmp eq i64 %add52.us.us.us88, %0
  br i1 %exitcond187.us.us.us89, label %blklab15.loopexit.us-lcssa.us.us.loopexit, label %while.cond33.preheader.us.us.us50

while.cond33.preheader.us.us:                     ; preds = %while.cond33.preheader.us.us.preheader, %if.end38.us.us.epil
  %j.0182.us.us = phi i64 [ %add52.us.us, %if.end38.us.us.epil ], [ 0, %while.cond33.preheader.us.us.preheader ]
  %add.us.us = add nsw i64 %j.0182.us.us, %mul39.us
  %arrayidx.us.us = getelementptr inbounds i64, i64* %call, i64 %add.us.us
  %.pre = load i64, i64* %arrayidx.us.us, align 8, !tbaa !8
  br label %if.end38.us.us

if.end38.us.us.epil:                              ; preds = %if.end38.us.us
  %add51.us.us.1.lcssa = phi i64 [ %add51.us.us.1, %if.end38.us.us ]
  %add47.us.us.1.lcssa = phi i64 [ %add47.us.us.1, %if.end38.us.us ]
  %add41.us.us.epil = add nsw i64 %add51.us.us.1.lcssa, %mul39.us
  %arrayidx42.us.us.epil = getelementptr inbounds i64, i64* %2, i64 %add41.us.us.epil
  %21 = load i64, i64* %arrayidx42.us.us.epil, align 8, !tbaa !8
  %mul43.us.us.epil = mul nsw i64 %add51.us.us.1.lcssa, %0
  %add44.us.us.epil = add nsw i64 %mul43.us.us.epil, %j.0182.us.us
  %arrayidx45.us.us.epil = getelementptr inbounds i64, i64* %3, i64 %add44.us.us.epil
  %22 = load i64, i64* %arrayidx45.us.us.epil, align 8, !tbaa !8
  %mul46.us.us.epil = mul nsw i64 %22, %21
  %add47.us.us.epil = add nsw i64 %mul46.us.us.epil, %add47.us.us.1.lcssa
  store i64 %add47.us.us.epil, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add52.us.us = add nuw nsw i64 %j.0182.us.us, 1
  %exitcond187.us.us = icmp eq i64 %add52.us.us, %0
  br i1 %exitcond187.us.us, label %blklab15.loopexit.us-lcssa.us.us.loopexit146, label %while.cond33.preheader.us.us

if.end38.us.us:                                   ; preds = %while.cond33.preheader.us.us, %if.end38.us.us
  %23 = phi i64 [ %add47.us.us.1, %if.end38.us.us ], [ %.pre, %while.cond33.preheader.us.us ]
  %k.0180.us.us = phi i64 [ %add51.us.us.1, %if.end38.us.us ], [ 0, %while.cond33.preheader.us.us ]
  %niter = phi i64 [ %niter.nsub.1, %if.end38.us.us ], [ %unroll_iter, %while.cond33.preheader.us.us ]
  %add41.us.us = add nsw i64 %k.0180.us.us, %mul39.us
  %arrayidx42.us.us = getelementptr inbounds i64, i64* %2, i64 %add41.us.us
  %24 = load i64, i64* %arrayidx42.us.us, align 8, !tbaa !8
  %mul43.us.us = mul nsw i64 %k.0180.us.us, %0
  %add44.us.us = add nsw i64 %mul43.us.us, %j.0182.us.us
  %arrayidx45.us.us = getelementptr inbounds i64, i64* %3, i64 %add44.us.us
  %25 = load i64, i64* %arrayidx45.us.us, align 8, !tbaa !8
  %mul46.us.us = mul nsw i64 %25, %24
  %add47.us.us = add nsw i64 %mul46.us.us, %23
  store i64 %add47.us.us, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add51.us.us = or i64 %k.0180.us.us, 1
  %add41.us.us.1 = add nsw i64 %add51.us.us, %mul39.us
  %arrayidx42.us.us.1 = getelementptr inbounds i64, i64* %2, i64 %add41.us.us.1
  %26 = load i64, i64* %arrayidx42.us.us.1, align 8, !tbaa !8
  %mul43.us.us.1 = mul nsw i64 %add51.us.us, %0
  %add44.us.us.1 = add nsw i64 %mul43.us.us.1, %j.0182.us.us
  %arrayidx45.us.us.1 = getelementptr inbounds i64, i64* %3, i64 %add44.us.us.1
  %27 = load i64, i64* %arrayidx45.us.us.1, align 8, !tbaa !8
  %mul46.us.us.1 = mul nsw i64 %27, %26
  %add47.us.us.1 = add nsw i64 %mul46.us.us.1, %add47.us.us
  store i64 %add47.us.us.1, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add51.us.us.1 = add nuw nsw i64 %k.0180.us.us, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %if.end38.us.us.epil, label %if.end38.us.us

blklab15.loopexit.us-lcssa.us.us.loopexit:        ; preds = %blklab17.loopexit.us.us.unr-lcssa.loopexit.us91
  br label %blklab15.loopexit.us-lcssa.us.us

blklab15.loopexit.us-lcssa.us.us.loopexit146:     ; preds = %if.end38.us.us.epil
  br label %blklab15.loopexit.us-lcssa.us.us

blklab15.loopexit.us-lcssa.us.us:                 ; preds = %blklab15.loopexit.us-lcssa.us.us.loopexit146, %blklab15.loopexit.us-lcssa.us.us.loopexit, %if.end38.us.us.epil.us, %while.cond33.preheader.us.us.us
  %add53.us = add nuw nsw i64 %i.0185.us, 1
  %exitcond188.us = icmp eq i64 %add53.us, %1
  br i1 %exitcond188.us, label %if.end56.loopexit147, label %while.cond27.preheader.us

if.end56.loopexit:                                ; preds = %polly.loop_exit260
  br label %if.end56

if.end56.loopexit147:                             ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %if.end56

if.end56:                                         ; preds = %if.end56.loopexit147, %if.end56.loopexit, %polly.start, %while.cond27.preheader.preheader, %entry.split
  %call.i = tail call noalias i8* @malloc(i64 32) #6
  %28 = bitcast i8* %call.i to %struct.Matrix*
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %29 = bitcast i8* %data_size1.i to i64*
  store i64 %mul, i64* %29, align 8, !tbaa !1
  %data2.i = bitcast i8* %call.i to i64**
  store i64* %call, i64** %data2.i, align 8, !tbaa !7
  %height3.i = getelementptr inbounds i8, i8* %call.i, i64 24
  %30 = bitcast i8* %height3.i to i64*
  store i64 %1, i64* %30, align 8, !tbaa !11
  %width4.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %31 = bitcast i8* %width4.i to i64*
  store i64 %0, i64* %31, align 8, !tbaa !10
  br i1 %a_dealloc, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end56
  %32 = bitcast %struct.Matrix* %a to i8**
  %33 = load i8*, i8** %32, align 8, !tbaa !7
  tail call void @free(i8* %33) #6
  %34 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %34) #6
  br label %if.end61

if.end61:                                         ; preds = %if.then60, %if.end56
  br i1 %b_dealloc, label %if.then63, label %if.end85

if.then63:                                        ; preds = %if.end61
  %35 = bitcast %struct.Matrix* %b to i8**
  %36 = load i8*, i8** %35, align 8, !tbaa !7
  tail call void @free(i8* %36) #6
  %37 = bitcast %struct.Matrix* %b to i8*
  tail call void @free(i8* %37) #6
  br label %if.end85

if.end85:                                         ; preds = %if.then63, %if.end61
  ret %struct.Matrix* %28

polly.start:                                      ; preds = %polly.split_new_and_old
  %38 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %38, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %if.end56

polly.loop_header.preheader:                      ; preds = %polly.start
  %39 = add nsw i64 %0, -1
  %polly.fdiv_q.shr256 = ashr i64 %39, 5
  %polly.loop_guard261 = icmp sgt i64 %polly.fdiv_q.shr256, -1
  %pexp.p_div_q = lshr i64 %39, 5
  %notrhs = icmp ne i64 %0, 1
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit260, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit260 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard261, label %polly.loop_header258.preheader, label %polly.loop_exit260

polly.loop_header258.preheader:                   ; preds = %polly.loop_header
  %40 = shl nsw i64 %polly.indvar, 5
  %41 = sub nsw i64 %1, %40
  %42 = add nsw i64 %41, -1
  %43 = icmp sgt i64 %42, 31
  %44 = select i1 %43, i64 31, i64 %42
  %polly.loop_guard277 = icmp sgt i64 %44, -1
  %polly.adjust_ub280 = add i64 %44, -1
  br label %polly.loop_header258

polly.loop_exit260.loopexit:                      ; preds = %polly.loop_exit268
  br label %polly.loop_exit260

polly.loop_exit260:                               ; preds = %polly.loop_exit260.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond358 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond358, label %if.end56.loopexit, label %polly.loop_header

polly.loop_header258:                             ; preds = %polly.loop_exit268, %polly.loop_header258.preheader
  %polly.indvar262 = phi i64 [ %polly.indvar_next263, %polly.loop_exit268 ], [ 0, %polly.loop_header258.preheader ]
  %45 = shl nsw i64 %polly.indvar262, 5
  %46 = sub nsw i64 %0, %45
  %47 = add nsw i64 %46, -1
  %48 = icmp sgt i64 %47, 31
  %49 = select i1 %48, i64 31, i64 %47
  %polly.loop_guard286 = icmp sgt i64 %49, -1
  %polly.adjust_ub289 = add i64 %49, -1
  br label %polly.loop_header266

polly.loop_exit268:                               ; preds = %polly.loop_exit276
  %polly.indvar_next263 = add nuw nsw i64 %polly.indvar262, 1
  %exitcond357 = icmp eq i64 %polly.indvar262, %polly.fdiv_q.shr256
  br i1 %exitcond357, label %polly.loop_exit260.loopexit, label %polly.loop_header258

polly.loop_header266:                             ; preds = %polly.loop_exit276, %polly.loop_header258
  %polly.indvar269 = phi i64 [ 0, %polly.loop_header258 ], [ %polly.indvar_next270, %polly.loop_exit276 ]
  %50 = shl i64 %polly.indvar269, 5
  %51 = sub i64 %50, %0
  %52 = icmp sgt i64 %51, -32
  %smax133 = select i1 %52, i64 %51, i64 -32
  %53 = sub i64 -2, %smax133
  %54 = icmp sgt i64 %53, -1
  %smax134 = select i1 %54, i64 %53, i64 -1
  %55 = add i64 %smax134, 2
  %56 = shl i64 %polly.indvar269, 5
  %57 = sub i64 %56, %0
  %58 = icmp sgt i64 %57, -32
  %smax127 = select i1 %58, i64 %57, i64 -32
  %59 = sub i64 -2, %smax127
  %60 = icmp sgt i64 %59, -1
  %smax128 = select i1 %60, i64 %59, i64 -1
  %61 = add i64 %smax128, -2
  %62 = lshr i64 %61, 2
  %63 = add nuw nsw i64 %62, 1
  %64 = shl i64 %polly.indvar269, 5
  %65 = sub i64 %64, %0
  %66 = icmp sgt i64 %65, -32
  %smax = select i1 %66, i64 %65, i64 -32
  %67 = sub i64 -2, %smax
  %68 = icmp sgt i64 %67, -1
  %smax361 = select i1 %68, i64 %67, i64 -1
  %69 = add i64 %smax361, 2
  br i1 %polly.loop_guard277, label %polly.loop_header274.preheader, label %polly.loop_exit276

polly.loop_header274.preheader:                   ; preds = %polly.loop_header266
  %70 = sub nsw i64 %0, %64
  %71 = add nsw i64 %70, -1
  %72 = icmp sgt i64 %71, 31
  %73 = select i1 %72, i64 31, i64 %71
  %polly.loop_guard295 = icmp sgt i64 %73, -1
  %polly.adjust_ub298 = add i64 %73, -1
  br i1 %polly.loop_guard286, label %polly.loop_header274.us.preheader, label %polly.loop_exit276

polly.loop_header274.us.preheader:                ; preds = %polly.loop_header274.preheader
  %min.iters.check = icmp ult i64 %69, 4
  %n.vec = and i64 %69, -4
  %cmp.n = icmp eq i64 %69, %n.vec
  %74 = or i1 %notrhs, %min.iters.check
  %xtraiter135 = and i64 %55, 1
  %75 = icmp eq i64 %smax134, -1
  %lcmp.mod136 = icmp eq i64 %xtraiter135, 0
  %unroll_iter137 = sub i64 %55, %xtraiter135
  %xtraiter129 = and i64 %63, 1
  %76 = icmp eq i64 %62, 0
  %lcmp.mod130 = icmp eq i64 %xtraiter129, 0
  %unroll_iter131 = sub nsw i64 %63, %xtraiter129
  br label %polly.loop_header274.us

polly.loop_header274.us:                          ; preds = %polly.loop_exit285.loopexit.us, %polly.loop_header274.us.preheader
  %polly.indvar278.us = phi i64 [ %polly.indvar_next279.us, %polly.loop_exit285.loopexit.us ], [ 0, %polly.loop_header274.us.preheader ]
  %77 = add nuw nsw i64 %polly.indvar278.us, %40
  %78 = mul i64 %77, %0
  br i1 %polly.loop_guard295, label %polly.loop_header283.us.us.preheader, label %polly.loop_exit285.loopexit.us

polly.loop_header283.us.us.preheader:             ; preds = %polly.loop_header274.us
  br i1 %74, label %polly.loop_header283.us.us.us.preheader, label %polly.loop_header283.us.us.preheader.split

polly.loop_header283.us.us.us.preheader:          ; preds = %polly.loop_header283.us.us.preheader
  br label %polly.loop_header283.us.us.us

polly.loop_header283.us.us.us:                    ; preds = %polly.loop_header283.us.us.us.preheader, %polly.loop_exit294.loopexit.us.us.loopexit.us
  %polly.indvar287.us.us.us = phi i64 [ %polly.indvar_next288.us.us.us, %polly.loop_exit294.loopexit.us.us.loopexit.us ], [ 0, %polly.loop_header283.us.us.us.preheader ]
  %79 = add nuw nsw i64 %polly.indvar287.us.us.us, %45
  %80 = add i64 %79, %78
  %scevgep.us.us.us = getelementptr i64, i64* %call, i64 %80
  %scevgep.promoted.us.us.us = load i64, i64* %scevgep.us.us.us, align 8, !alias.scope !20, !noalias !22
  br i1 %75, label %polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa, label %polly.loop_header292.us.us.us.preheader

polly.loop_header292.us.us.us.preheader:          ; preds = %polly.loop_header283.us.us.us
  br label %polly.loop_header292.us.us.us

polly.loop_header292.us.us.us:                    ; preds = %polly.loop_header292.us.us.us.preheader, %polly.loop_header292.us.us.us
  %p_add47305.us.us.us = phi i64 [ %p_add47.us.us.us.1, %polly.loop_header292.us.us.us ], [ %scevgep.promoted.us.us.us, %polly.loop_header292.us.us.us.preheader ]
  %polly.indvar296.us.us.us = phi i64 [ %polly.indvar_next297.us.us.us.1, %polly.loop_header292.us.us.us ], [ 0, %polly.loop_header292.us.us.us.preheader ]
  %niter138 = phi i64 [ %niter138.nsub.1, %polly.loop_header292.us.us.us ], [ %unroll_iter137, %polly.loop_header292.us.us.us.preheader ]
  %81 = add nsw i64 %polly.indvar296.us.us.us, %64
  %82 = add i64 %81, %78
  %scevgep300.us.us.us = getelementptr i64, i64* %2, i64 %82
  %_p_scalar_301.us.us.us = load i64, i64* %scevgep300.us.us.us, align 8, !alias.scope !23, !noalias !25
  %83 = mul i64 %81, %0
  %84 = add i64 %83, %79
  %scevgep302.us.us.us = getelementptr i64, i64* %3, i64 %84
  %_p_scalar_303.us.us.us = load i64, i64* %scevgep302.us.us.us, align 8, !alias.scope !24, !noalias !26
  %p_mul46.us.us.us = mul nsw i64 %_p_scalar_303.us.us.us, %_p_scalar_301.us.us.us
  %p_add47.us.us.us = add nsw i64 %p_mul46.us.us.us, %p_add47305.us.us.us
  %polly.indvar_next297.us.us.us = or i64 %polly.indvar296.us.us.us, 1
  %85 = add nsw i64 %polly.indvar_next297.us.us.us, %64
  %86 = add i64 %85, %78
  %scevgep300.us.us.us.1 = getelementptr i64, i64* %2, i64 %86
  %_p_scalar_301.us.us.us.1 = load i64, i64* %scevgep300.us.us.us.1, align 8, !alias.scope !23, !noalias !25
  %87 = mul i64 %85, %0
  %88 = add i64 %87, %79
  %scevgep302.us.us.us.1 = getelementptr i64, i64* %3, i64 %88
  %_p_scalar_303.us.us.us.1 = load i64, i64* %scevgep302.us.us.us.1, align 8, !alias.scope !24, !noalias !26
  %p_mul46.us.us.us.1 = mul nsw i64 %_p_scalar_303.us.us.us.1, %_p_scalar_301.us.us.us.1
  %p_add47.us.us.us.1 = add nsw i64 %p_add47.us.us.us, %p_mul46.us.us.us.1
  %polly.indvar_next297.us.us.us.1 = add nuw nsw i64 %polly.indvar296.us.us.us, 2
  %niter138.nsub.1 = add i64 %niter138, -2
  %niter138.ncmp.1 = icmp eq i64 %niter138.nsub.1, 0
  br i1 %niter138.ncmp.1, label %polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa.loopexit, label %polly.loop_header292.us.us.us, !llvm.loop !27

polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa.loopexit: ; preds = %polly.loop_header292.us.us.us
  %polly.indvar_next297.us.us.us.1.lcssa = phi i64 [ %polly.indvar_next297.us.us.us.1, %polly.loop_header292.us.us.us ]
  %p_add47.us.us.us.1.lcssa = phi i64 [ %p_add47.us.us.us.1, %polly.loop_header292.us.us.us ]
  br label %polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa

polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa: ; preds = %polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa.loopexit, %polly.loop_header283.us.us.us
  %p_add47.us.us.us.lcssa.ph = phi i64 [ undef, %polly.loop_header283.us.us.us ], [ %p_add47.us.us.us.1.lcssa, %polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa.loopexit ]
  %p_add47305.us.us.us.unr = phi i64 [ %scevgep.promoted.us.us.us, %polly.loop_header283.us.us.us ], [ %p_add47.us.us.us.1.lcssa, %polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa.loopexit ]
  %polly.indvar296.us.us.us.unr = phi i64 [ 0, %polly.loop_header283.us.us.us ], [ %polly.indvar_next297.us.us.us.1.lcssa, %polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa.loopexit ]
  br i1 %lcmp.mod136, label %polly.loop_exit294.loopexit.us.us.loopexit.us, label %polly.loop_header292.us.us.us.epil

polly.loop_header292.us.us.us.epil:               ; preds = %polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa
  %89 = add nsw i64 %polly.indvar296.us.us.us.unr, %64
  %90 = mul i64 %89, %0
  %91 = add i64 %90, %79
  %scevgep302.us.us.us.epil = getelementptr i64, i64* %3, i64 %91
  %_p_scalar_303.us.us.us.epil = load i64, i64* %scevgep302.us.us.us.epil, align 8, !alias.scope !24, !noalias !26
  %92 = add i64 %89, %78
  %scevgep300.us.us.us.epil = getelementptr i64, i64* %2, i64 %92
  %_p_scalar_301.us.us.us.epil = load i64, i64* %scevgep300.us.us.us.epil, align 8, !alias.scope !23, !noalias !25
  %p_mul46.us.us.us.epil = mul nsw i64 %_p_scalar_301.us.us.us.epil, %_p_scalar_303.us.us.us.epil
  %p_add47.us.us.us.epil = add nsw i64 %p_mul46.us.us.us.epil, %p_add47305.us.us.us.unr
  br label %polly.loop_exit294.loopexit.us.us.loopexit.us

polly.loop_exit294.loopexit.us.us.loopexit.us:    ; preds = %polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa, %polly.loop_header292.us.us.us.epil
  %p_add47.us.us.us.lcssa = phi i64 [ %p_add47.us.us.us.lcssa.ph, %polly.loop_exit294.loopexit.us.us.loopexit.us.unr-lcssa ], [ %p_add47.us.us.us.epil, %polly.loop_header292.us.us.us.epil ]
  store i64 %p_add47.us.us.us.lcssa, i64* %scevgep.us.us.us, align 8, !alias.scope !20, !noalias !22
  %polly.indvar_next288.us.us.us = add nuw nsw i64 %polly.indvar287.us.us.us, 1
  %polly.loop_cond290.us.us.us = icmp sgt i64 %polly.indvar287.us.us.us, %polly.adjust_ub289
  br i1 %polly.loop_cond290.us.us.us, label %polly.loop_exit285.loopexit.us.loopexit, label %polly.loop_header283.us.us.us

polly.loop_header283.us.us.preheader.split:       ; preds = %polly.loop_header283.us.us.preheader
  br i1 %cmp.n, label %polly.loop_header283.us.us.us9.preheader, label %polly.loop_header283.us.us.preheader144

polly.loop_header283.us.us.preheader144:          ; preds = %polly.loop_header283.us.us.preheader.split
  br label %polly.loop_header283.us.us

polly.loop_header283.us.us.us9.preheader:         ; preds = %polly.loop_header283.us.us.preheader.split
  br label %polly.loop_header283.us.us.us9

polly.loop_header283.us.us.us9:                   ; preds = %polly.loop_header283.us.us.us9.preheader, %middle.block.us24
  %polly.indvar287.us.us.us10 = phi i64 [ %polly.indvar_next288.us.us.us43, %middle.block.us24 ], [ 0, %polly.loop_header283.us.us.us9.preheader ]
  %93 = add nuw nsw i64 %polly.indvar287.us.us.us10, %45
  %94 = add i64 %93, %78
  %scevgep.us.us.us11 = getelementptr i64, i64* %call, i64 %94
  %scevgep.promoted.us.us.us12 = load i64, i64* %scevgep.us.us.us11, align 8, !alias.scope !20, !noalias !22
  %95 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %scevgep.promoted.us.us.us12, i32 0
  br label %vector.body.us14

vector.body.us14:                                 ; preds = %vector.body.us14, %polly.loop_header283.us.us.us9
  %index.us15 = phi i64 [ 0, %polly.loop_header283.us.us.us9 ], [ %index.next.us18, %vector.body.us14 ]
  %vec.phi.us16 = phi <2 x i64> [ %95, %polly.loop_header283.us.us.us9 ], [ %108, %vector.body.us14 ]
  %vec.phi362.us17 = phi <2 x i64> [ zeroinitializer, %polly.loop_header283.us.us.us9 ], [ %109, %vector.body.us14 ]
  %index.next.us18 = add i64 %index.us15, 4
  %.lhs.us19 = add nsw i64 %index.us15, %64
  %96 = add i64 %.lhs.us19, %78
  %97 = getelementptr i64, i64* %2, i64 %96
  %98 = bitcast i64* %97 to <2 x i64>*
  %wide.load.us20 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !23, !noalias !25
  %99 = getelementptr i64, i64* %97, i64 2
  %100 = bitcast i64* %99 to <2 x i64>*
  %wide.load366.us21 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !23, !noalias !25
  %101 = add i64 %.lhs.us19, %93
  %102 = getelementptr i64, i64* %3, i64 %101
  %103 = bitcast i64* %102 to <2 x i64>*
  %wide.load369.us22 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !24, !noalias !26
  %104 = getelementptr i64, i64* %102, i64 2
  %105 = bitcast i64* %104 to <2 x i64>*
  %wide.load370.us23 = load <2 x i64>, <2 x i64>* %105, align 8, !alias.scope !24, !noalias !26
  %106 = mul nsw <2 x i64> %wide.load369.us22, %wide.load.us20
  %107 = mul nsw <2 x i64> %wide.load370.us23, %wide.load366.us21
  %108 = add nsw <2 x i64> %106, %vec.phi.us16
  %109 = add nsw <2 x i64> %107, %vec.phi362.us17
  %110 = icmp eq i64 %index.next.us18, %69
  br i1 %110, label %middle.block.us24, label %vector.body.us14, !llvm.loop !28

middle.block.us24:                                ; preds = %vector.body.us14
  %.lcssa155 = phi <2 x i64> [ %109, %vector.body.us14 ]
  %.lcssa154 = phi <2 x i64> [ %108, %vector.body.us14 ]
  %bin.rdx.us27 = add <2 x i64> %.lcssa155, %.lcssa154
  %rdx.shuf.us28 = shufflevector <2 x i64> %bin.rdx.us27, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx373.us29 = add <2 x i64> %rdx.shuf.us28, %bin.rdx.us27
  %111 = extractelement <2 x i64> %bin.rdx373.us29, i32 0
  store i64 %111, i64* %scevgep.us.us.us11, align 8, !alias.scope !20, !noalias !22
  %polly.indvar_next288.us.us.us43 = add nuw nsw i64 %polly.indvar287.us.us.us10, 1
  %polly.loop_cond290.us.us.us44 = icmp sgt i64 %polly.indvar287.us.us.us10, %polly.adjust_ub289
  br i1 %polly.loop_cond290.us.us.us44, label %polly.loop_exit285.loopexit.us.loopexit143, label %polly.loop_header283.us.us.us9

polly.loop_exit285.loopexit.us.loopexit:          ; preds = %polly.loop_exit294.loopexit.us.us.loopexit.us
  br label %polly.loop_exit285.loopexit.us

polly.loop_exit285.loopexit.us.loopexit143:       ; preds = %middle.block.us24
  br label %polly.loop_exit285.loopexit.us

polly.loop_exit285.loopexit.us.loopexit145:       ; preds = %polly.loop_exit294.loopexit.us.us
  br label %polly.loop_exit285.loopexit.us

polly.loop_exit285.loopexit.us:                   ; preds = %polly.loop_exit285.loopexit.us.loopexit145, %polly.loop_exit285.loopexit.us.loopexit143, %polly.loop_exit285.loopexit.us.loopexit, %polly.loop_header274.us
  %polly.indvar_next279.us = add nuw nsw i64 %polly.indvar278.us, 1
  %polly.loop_cond281.us = icmp sgt i64 %polly.indvar278.us, %polly.adjust_ub280
  br i1 %polly.loop_cond281.us, label %polly.loop_exit276.loopexit, label %polly.loop_header274.us

polly.loop_header283.us.us:                       ; preds = %polly.loop_header283.us.us.preheader144, %polly.loop_exit294.loopexit.us.us
  %polly.indvar287.us.us = phi i64 [ %polly.indvar_next288.us.us, %polly.loop_exit294.loopexit.us.us ], [ 0, %polly.loop_header283.us.us.preheader144 ]
  %112 = add nuw nsw i64 %polly.indvar287.us.us, %45
  %113 = add i64 %112, %78
  %scevgep.us.us = getelementptr i64, i64* %call, i64 %113
  %scevgep.promoted.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !20, !noalias !22
  %114 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %scevgep.promoted.us.us, i32 0
  br i1 %76, label %middle.block.unr-lcssa, label %vector.body.preheader

vector.body.preheader:                            ; preds = %polly.loop_header283.us.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next.1, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.phi = phi <2 x i64> [ %141, %vector.body ], [ %114, %vector.body.preheader ]
  %vec.phi362 = phi <2 x i64> [ %142, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %niter132 = phi i64 [ %niter132.nsub.1, %vector.body ], [ %unroll_iter131, %vector.body.preheader ]
  %index.next = or i64 %index, 4
  %.lhs = add nsw i64 %index, %64
  %115 = add i64 %.lhs, %78
  %116 = getelementptr i64, i64* %2, i64 %115
  %117 = bitcast i64* %116 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %117, align 8, !alias.scope !23, !noalias !25
  %118 = getelementptr i64, i64* %116, i64 2
  %119 = bitcast i64* %118 to <2 x i64>*
  %wide.load366 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !23, !noalias !25
  %120 = add i64 %.lhs, %112
  %121 = getelementptr i64, i64* %3, i64 %120
  %122 = bitcast i64* %121 to <2 x i64>*
  %wide.load369 = load <2 x i64>, <2 x i64>* %122, align 8, !alias.scope !24, !noalias !26
  %123 = getelementptr i64, i64* %121, i64 2
  %124 = bitcast i64* %123 to <2 x i64>*
  %wide.load370 = load <2 x i64>, <2 x i64>* %124, align 8, !alias.scope !24, !noalias !26
  %125 = mul nsw <2 x i64> %wide.load369, %wide.load
  %126 = mul nsw <2 x i64> %wide.load370, %wide.load366
  %127 = add nsw <2 x i64> %125, %vec.phi
  %128 = add nsw <2 x i64> %126, %vec.phi362
  %index.next.1 = add i64 %index, 8
  %.lhs.1 = add nsw i64 %index.next, %64
  %129 = add i64 %.lhs.1, %78
  %130 = getelementptr i64, i64* %2, i64 %129
  %131 = bitcast i64* %130 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %131, align 8, !alias.scope !23, !noalias !25
  %132 = getelementptr i64, i64* %130, i64 2
  %133 = bitcast i64* %132 to <2 x i64>*
  %wide.load366.1 = load <2 x i64>, <2 x i64>* %133, align 8, !alias.scope !23, !noalias !25
  %134 = add i64 %.lhs.1, %112
  %135 = getelementptr i64, i64* %3, i64 %134
  %136 = bitcast i64* %135 to <2 x i64>*
  %wide.load369.1 = load <2 x i64>, <2 x i64>* %136, align 8, !alias.scope !24, !noalias !26
  %137 = getelementptr i64, i64* %135, i64 2
  %138 = bitcast i64* %137 to <2 x i64>*
  %wide.load370.1 = load <2 x i64>, <2 x i64>* %138, align 8, !alias.scope !24, !noalias !26
  %139 = mul nsw <2 x i64> %wide.load369.1, %wide.load.1
  %140 = mul nsw <2 x i64> %wide.load370.1, %wide.load366.1
  %141 = add nsw <2 x i64> %127, %139
  %142 = add nsw <2 x i64> %128, %140
  %niter132.nsub.1 = add i64 %niter132, -2
  %niter132.ncmp.1 = icmp eq i64 %niter132.nsub.1, 0
  br i1 %niter132.ncmp.1, label %middle.block.unr-lcssa.loopexit, label %vector.body, !llvm.loop !28

middle.block.unr-lcssa.loopexit:                  ; preds = %vector.body
  %.lcssa153 = phi <2 x i64> [ %142, %vector.body ]
  %.lcssa152 = phi <2 x i64> [ %141, %vector.body ]
  %index.next.1.lcssa = phi i64 [ %index.next.1, %vector.body ]
  br label %middle.block.unr-lcssa

middle.block.unr-lcssa:                           ; preds = %middle.block.unr-lcssa.loopexit, %polly.loop_header283.us.us
  %.lcssa124.ph = phi <2 x i64> [ undef, %polly.loop_header283.us.us ], [ %.lcssa153, %middle.block.unr-lcssa.loopexit ]
  %.lcssa.ph = phi <2 x i64> [ undef, %polly.loop_header283.us.us ], [ %.lcssa152, %middle.block.unr-lcssa.loopexit ]
  %index.unr = phi i64 [ 0, %polly.loop_header283.us.us ], [ %index.next.1.lcssa, %middle.block.unr-lcssa.loopexit ]
  %vec.phi.unr = phi <2 x i64> [ %114, %polly.loop_header283.us.us ], [ %.lcssa152, %middle.block.unr-lcssa.loopexit ]
  %vec.phi362.unr = phi <2 x i64> [ zeroinitializer, %polly.loop_header283.us.us ], [ %.lcssa153, %middle.block.unr-lcssa.loopexit ]
  br i1 %lcmp.mod130, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa
  %.lhs.epil = add nsw i64 %index.unr, %64
  %143 = add i64 %.lhs.epil, %78
  %144 = getelementptr i64, i64* %2, i64 %143
  %145 = add i64 %.lhs.epil, %112
  %146 = getelementptr i64, i64* %3, i64 %145
  %147 = getelementptr i64, i64* %146, i64 2
  %148 = bitcast i64* %147 to <2 x i64>*
  %wide.load370.epil = load <2 x i64>, <2 x i64>* %148, align 8, !alias.scope !24, !noalias !26
  %149 = getelementptr i64, i64* %144, i64 2
  %150 = bitcast i64* %149 to <2 x i64>*
  %wide.load366.epil = load <2 x i64>, <2 x i64>* %150, align 8, !alias.scope !23, !noalias !25
  %151 = mul nsw <2 x i64> %wide.load366.epil, %wide.load370.epil
  %152 = add nsw <2 x i64> %151, %vec.phi362.unr
  %153 = bitcast i64* %146 to <2 x i64>*
  %wide.load369.epil = load <2 x i64>, <2 x i64>* %153, align 8, !alias.scope !24, !noalias !26
  %154 = bitcast i64* %144 to <2 x i64>*
  %wide.load.epil = load <2 x i64>, <2 x i64>* %154, align 8, !alias.scope !23, !noalias !25
  %155 = mul nsw <2 x i64> %wide.load.epil, %wide.load369.epil
  %156 = add nsw <2 x i64> %155, %vec.phi.unr
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %.lcssa124 = phi <2 x i64> [ %.lcssa124.ph, %middle.block.unr-lcssa ], [ %152, %vector.body.epil ]
  %.lcssa = phi <2 x i64> [ %.lcssa.ph, %middle.block.unr-lcssa ], [ %156, %vector.body.epil ]
  %bin.rdx = add <2 x i64> %.lcssa, %.lcssa124
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx373 = add <2 x i64> %rdx.shuf, %bin.rdx
  %157 = extractelement <2 x i64> %bin.rdx373, i32 0
  br label %polly.loop_header292.us.us

polly.loop_exit294.loopexit.us.us:                ; preds = %polly.loop_header292.us.us
  %p_add47.us.us.lcssa = phi i64 [ %p_add47.us.us, %polly.loop_header292.us.us ]
  store i64 %p_add47.us.us.lcssa, i64* %scevgep.us.us, align 8, !alias.scope !20, !noalias !22
  %polly.indvar_next288.us.us = add nuw nsw i64 %polly.indvar287.us.us, 1
  %polly.loop_cond290.us.us = icmp sgt i64 %polly.indvar287.us.us, %polly.adjust_ub289
  br i1 %polly.loop_cond290.us.us, label %polly.loop_exit285.loopexit.us.loopexit145, label %polly.loop_header283.us.us

polly.loop_header292.us.us:                       ; preds = %middle.block, %polly.loop_header292.us.us
  %p_add47305.us.us = phi i64 [ %p_add47.us.us, %polly.loop_header292.us.us ], [ %157, %middle.block ]
  %polly.indvar296.us.us = phi i64 [ %polly.indvar_next297.us.us, %polly.loop_header292.us.us ], [ %n.vec, %middle.block ]
  %158 = add nsw i64 %polly.indvar296.us.us, %64
  %159 = add i64 %158, %78
  %scevgep300.us.us = getelementptr i64, i64* %2, i64 %159
  %_p_scalar_301.us.us = load i64, i64* %scevgep300.us.us, align 8, !alias.scope !23, !noalias !25
  %160 = add i64 %158, %112
  %scevgep302.us.us = getelementptr i64, i64* %3, i64 %160
  %_p_scalar_303.us.us = load i64, i64* %scevgep302.us.us, align 8, !alias.scope !24, !noalias !26
  %p_mul46.us.us = mul nsw i64 %_p_scalar_303.us.us, %_p_scalar_301.us.us
  %p_add47.us.us = add nsw i64 %p_mul46.us.us, %p_add47305.us.us
  %polly.indvar_next297.us.us = add nuw nsw i64 %polly.indvar296.us.us, 1
  %polly.loop_cond299.us.us = icmp sgt i64 %polly.indvar296.us.us, %polly.adjust_ub298
  br i1 %polly.loop_cond299.us.us, label %polly.loop_exit294.loopexit.us.us, label %polly.loop_header292.us.us, !llvm.loop !27

polly.loop_exit276.loopexit:                      ; preds = %polly.loop_exit285.loopexit.us
  br label %polly.loop_exit276

polly.loop_exit276:                               ; preds = %polly.loop_exit276.loopexit, %polly.loop_header274.preheader, %polly.loop_header266
  %polly.indvar_next270 = add nuw nsw i64 %polly.indvar269, 1
  %exitcond = icmp eq i64 %polly.indvar269, %pexp.p_div_q
  br i1 %exitcond, label %polly.loop_exit268, label %polly.loop_header266
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
  br i1 %cmp50, label %blklab20, label %if.end53

if.end53:                                         ; preds = %if.end5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %8) #8
  tail call void @exit(i32 -1) #9
  unreachable

blklab20:                                         ; preds = %if.end5
  %data56 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 0
  %10 = load i64*, i64** %data56, align 8, !tbaa !7
  %arrayidx61 = getelementptr inbounds i64, i64* %10, i64 %sub47
  %11 = load i64, i64* %arrayidx61, align 8, !tbaa !8
  %cmp63 = icmp eq i64 %11, %sub46
  br i1 %cmp63, label %blklab21, label %if.end66

if.end66:                                         ; preds = %blklab20
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %12) #8
  tail call void @exit(i32 -1) #9
  unreachable

blklab21:                                         ; preds = %blklab20
  %cmp68 = icmp eq i64 %1, 2000
  %data73 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call40, i64 0, i32 0
  %14 = load i64*, i64** %data73, align 8, !tbaa !7
  %arrayidx78 = getelementptr inbounds i64, i64* %14, i64 %sub47
  br i1 %cmp68, label %if.end71, label %if.then158

if.end71:                                         ; preds = %blklab21
  %15 = load i64, i64* %arrayidx78, align 8, !tbaa !8
  %cmp79 = icmp eq i64 %15, 3996001000
  br i1 %cmp79, label %if.then158, label %if.end82

if.end82:                                         ; preds = %if.end71
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %16) #8
  tail call void @exit(i32 -1) #9
  unreachable

if.then158:                                       ; preds = %blklab21, %if.end71
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
!20 = distinct !{!20, !21, !"polly.alias.scope.call"}
!21 = distinct !{!21, !"polly.alias.scope.domain"}
!22 = !{!23, !24}
!23 = distinct !{!23, !21, !"polly.alias.scope."}
!24 = distinct !{!24, !21, !"polly.alias.scope."}
!25 = !{!20, !24}
!26 = !{!23, !20}
!27 = distinct !{!27, !17, !18}
!28 = distinct !{!28, !17, !18}
