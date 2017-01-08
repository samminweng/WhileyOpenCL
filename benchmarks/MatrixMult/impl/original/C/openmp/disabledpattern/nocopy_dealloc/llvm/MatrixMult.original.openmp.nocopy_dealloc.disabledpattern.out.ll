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
  %call = tail call noalias i8* @malloc(i64 32) #9
  %0 = bitcast i8* %call to %struct.Matrix*
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 1
  %1 = load i64, i64* %data_size, align 8, !tbaa !1
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8
  %2 = bitcast i8* %data_size1 to i64*
  store i64 %1, i64* %2, align 8, !tbaa !1
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 0
  %3 = load i64*, i64** %data, align 8, !tbaa !7
  %call3 = tail call i64* @copy1DArray_int64_t(i64* %3, i64 %1) #9
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

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix** @copy_array_Matrix(%struct.Matrix** nocapture readonly %_Matrix, i64 %_Matrix_size) local_unnamed_addr #0 {
entry:
  %mul = shl i64 %_Matrix_size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #9
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
  %call.i = tail call noalias i8* @malloc(i64 32) #9
  %data_size.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 1
  %2 = load i64, i64* %data_size.i, align 8, !tbaa !1
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %3 = bitcast i8* %data_size1.i to i64*
  store i64 %2, i64* %3, align 8, !tbaa !1
  %data.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 0
  %4 = load i64*, i64** %data.i, align 8, !tbaa !7
  %call3.i = tail call i64* @copy1DArray_int64_t(i64* %4, i64 %2) #9
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
  tail call void @free(i8* %1) #9
  %2 = bitcast %struct.Matrix* %matrix to i8*
  tail call void @free(i8* %2) #9
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define void @printf_Matrix(%struct.Matrix* nocapture readonly %matrix) local_unnamed_addr #0 {
entry:
  %putchar = tail call i32 @putchar(i32 123) #9
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0))
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 0
  %0 = load i64*, i64** %data, align 8, !tbaa !7
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 1
  %1 = load i64, i64* %data_size, align 8, !tbaa !1
  tail call void @printf1DArray_int64_t(i64* %0, i64 %1) #9
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0))
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 2
  %2 = load i64, i64* %width, align 8, !tbaa !10
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i64 %2)
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0))
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 3
  %3 = load i64, i64* %height, align 8, !tbaa !11
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i64 %3)
  %putchar10 = tail call i32 @putchar(i32 125) #9
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @printf1DArray_int64_t(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @_matrix_(i64 %width, i64 %height, i64* %data, i64 %data_size, i1 zeroext %data_dealloc) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 32) #9
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
  %polly.par.userContext = alloca { i64, i64, i64* }, align 8
  %mul = mul nsw i64 %height, %width
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %mul) #9
  %cmp790 = icmp sgt i64 %height, 0
  br i1 %cmp790, label %polly.parallel.for, label %if.end24

if.end24:                                         ; preds = %polly.parallel.for, %entry
  %call.i = tail call noalias i8* @malloc(i64 32) #9
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

polly.parallel.for:                               ; preds = %entry
  %4 = add nsw i64 %height, -1
  %polly.fdiv_q.shr = ashr i64 %4, 5
  %5 = bitcast { i64, i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %5)
  %polly.subfn.storeaddr.width = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %width, i64* %polly.subfn.storeaddr.width, align 8
  %polly.subfn.storeaddr.height = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64 %height, i64* %polly.subfn.storeaddr.height, align 8
  %polly.subfn.storeaddr.call = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %call, i64** %polly.subfn.storeaddr.call, align 8
  %6 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_init__polly_subfn, i8* nonnull %5, i32 0, i64 0, i64 %6, i64 1) #9
  call void @_init__polly_subfn(i8* nonnull %5) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* nonnull %5)
  br label %if.end24
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
  tail call void @free(i8* %5) #9
  br label %if.end12.us

if.end12.us:                                      ; preds = %if.then11.us, %if.end9.us
  %call13.us = tail call i64* @create1DArray_int64_t(i64 0, i64 1) #9
  store i64 32, i64* %call13.us, align 8, !tbaa !8
  %not.cmp15.us = icmp ne i64* %call13.us, null
  %..us = zext i1 %not.cmp15.us to i8
  tail call void @printf_s(i64* %call13.us, i64 1) #9
  %add18.us = add nuw nsw i64 %j.089.us, 1
  %exitcond.us = icmp eq i64 %add18.us, %0
  br i1 %exitcond.us, label %polly.split_new_and_old.loopexit.us, label %if.end9.us

if.then21.us:                                     ; preds = %polly.split_new_and_old.loopexit.us
  tail call void @free(i8* %_25.098.us) #9
  br label %polly.merge_new_and_old.us

polly.merge_new_and_old.us:                       ; preds = %if.then21.us, %polly.split_new_and_old.loopexit.us
  %add19.merge.us = add i64 %i.094.us, 1
  %call23.us = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #9
  %6 = bitcast i64* %call23.us to i8*
  %not.cmp24.us = icmp ne i64* %call23.us, null
  %.87.us = zext i1 %not.cmp24.us to i8
  tail call void @println_s(i64* %call23.us, i64 0) #9
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
  tail call void @free(i8* %_25.098) #9
  br label %polly.merge_new_and_old

polly.merge_new_and_old:                          ; preds = %while.cond3.preheader, %if.then21
  %add19.merge = add i64 %i.094, 1
  %call23 = tail call i64* @create1DArray_int64_t(i64 0, i64 0) #9
  %9 = bitcast i64* %call23 to i8*
  %not.cmp24 = icmp ne i64* %call23, null
  %.87 = zext i1 %not.cmp24 to i8
  tail call void @println_s(i64* %call23, i64 0) #9
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
  tail call void @free(i8* %11) #9
  %12 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %12) #9
  br label %if.end33

if.end33:                                         ; preds = %blklab6, %if.then29
  %tobool34 = icmp eq i8 %_18_dealloc.0.lcssa, 0
  br i1 %tobool34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end33
  tail call void @free(i8* %_18.0.lcssa) #9
  br label %if.end36

if.end36:                                         ; preds = %if.end33, %if.then35
  %tobool37 = icmp eq i8 %_25_dealloc.0.lcssa, 0
  br i1 %tobool37, label %if.end39, label %if.then38

if.then38:                                        ; preds = %if.end36
  tail call void @free(i8* %_25.0.lcssa) #9
  br label %if.end39

if.end39:                                         ; preds = %if.end36, %if.then38
  ret void
}

declare void @printf_s(i64*, i64) local_unnamed_addr #3

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @_mat_mult_(%struct.Matrix* nocapture %a, i1 zeroext %a_dealloc, %struct.Matrix* nocapture %b, i1 zeroext %b_dealloc) local_unnamed_addr #4 {
entry:
  %polly.par.userContext = alloca { i64, i64, i64*, i64*, i64* }, align 8
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 2
  %0 = load i64, i64* %width2, align 8, !tbaa !10
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height3, align 8, !tbaa !11
  %mul = mul nsw i64 %1, %0
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 %mul) #9
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
  br i1 %polly.rtc.result, label %polly.parallel.for, label %while.cond34.preheader.preheader

while.cond34.preheader.preheader:                 ; preds = %polly.split_new_and_old
  %cmp36195 = icmp sgt i64 %0, 0
  br i1 %cmp36195, label %while.cond34.preheader.us.preheader, label %if.end61

while.cond34.preheader.us.preheader:              ; preds = %while.cond34.preheader.preheader
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
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
  br i1 %lcmp.mod, label %if.end43.us.us.prol.loopexit.unr-lcssa, label %if.end43.us.us.prol.preheader

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
  br i1 %exitcond202.us, label %if.end61.loopexit, label %while.cond34.preheader.us

if.end61.loopexit:                                ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %if.end61

if.end61:                                         ; preds = %if.end61.loopexit, %while.cond34.preheader.preheader, %polly.parallel.for, %entry
  %call.i = tail call noalias i8* @malloc(i64 32) #9
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
  tail call void @free(i8* %26) #9
  %27 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %27) #9
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %if.end61
  br i1 %b_dealloc, label %if.then72, label %if.end94

if.then72:                                        ; preds = %if.end70
  %28 = bitcast %struct.Matrix* %b to i8**
  %29 = load i8*, i8** %28, align 8, !tbaa !7
  tail call void @free(i8* %29) #9
  %30 = bitcast %struct.Matrix* %b to i8*
  tail call void @free(i8* %30) #9
  br label %if.end94

if.end94:                                         ; preds = %if.end70, %if.then72
  ret %struct.Matrix* %21

polly.parallel.for:                               ; preds = %polly.split_new_and_old
  %31 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %31, 5
  %32 = bitcast { i64, i64, i64*, i64*, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 40, i8* nonnull %32)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %0, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.270 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64 %1, i64* %polly.subfn.storeaddr.270, align 8
  %polly.subfn.storeaddr.call = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %call, i64** %polly.subfn.storeaddr.call, align 8
  %polly.subfn.storeaddr.271 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 3
  store i64* %2, i64** %polly.subfn.storeaddr.271, align 8
  %polly.subfn.storeaddr.272 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 4
  store i64* %3, i64** %polly.subfn.storeaddr.272, align 8
  %33 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_mat_mult__polly_subfn, i8* nonnull %32, i32 0, i64 0, i64 %33, i64 1) #9
  call void @_mat_mult__polly_subfn(i8* nonnull %32) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* nonnull %32)
  br label %if.end61
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #5 {
entry:
  %polly.par.userContext.i311 = alloca { i64, i64, i64* }, align 8
  %polly.par.userContext.i = alloca { i64, i64, i64* }, align 8
  %_7_size = alloca i64, align 8
  %_7_size_size = alloca i64, align 8
  %0 = bitcast i64* %_7_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #9
  store i64 0, i64* %_7_size, align 8, !tbaa !8
  %1 = bitcast i64* %_7_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #9
  store i64 0, i64* %_7_size_size, align 8, !tbaa !8
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_7_size, i64* nonnull %_7_size_size) #9
  %not.cmp = icmp eq i64** %call, null
  %2 = load i64*, i64** %call, align 8, !tbaa !9
  %call3 = call i64* @parseStringToInt(i64* %2) #9
  %not.cmp4 = icmp eq i64* %call3, null
  br i1 %not.cmp4, label %if.end158, label %if.end14

if.end14:                                         ; preds = %entry
  %3 = load i64, i64* %call3, align 8, !tbaa !8
  %call18 = call i64* @create1DArray_int64_t(i64 0, i64 7) #9
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
  call void @printf_s(i64* %call18, i64 7) #9
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 %3)
  %mul.i = mul i64 %3, %3
  %call.i = call i64* @create1DArray_int64_t(i64 0, i64 %mul.i) #9
  %cmp790.i = icmp sgt i64 %3, 0
  br i1 %cmp790.i, label %polly.parallel.for.i, label %_init_.exit

polly.parallel.for.i:                             ; preds = %if.end14
  %7 = add nsw i64 %3, -1
  %polly.fdiv_q.shr.i = ashr i64 %7, 5
  %8 = bitcast { i64, i64, i64* }* %polly.par.userContext.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %8) #9
  %polly.subfn.storeaddr.width.i = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i, i64 0, i32 0
  store i64 %3, i64* %polly.subfn.storeaddr.width.i, align 8
  %polly.subfn.storeaddr.height.i = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i, i64 0, i32 1
  store i64 %3, i64* %polly.subfn.storeaddr.height.i, align 8
  %polly.subfn.storeaddr.call.i = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i, i64 0, i32 2
  store i64* %call.i, i64** %polly.subfn.storeaddr.call.i, align 8
  %9 = add nsw i64 %polly.fdiv_q.shr.i, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_init__polly_subfn, i8* nonnull %8, i32 0, i64 0, i64 %9, i64 1) #9
  call void @_init__polly_subfn(i8* nonnull %8) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* nonnull %8) #9
  br label %_init_.exit

_init_.exit:                                      ; preds = %if.end14, %polly.parallel.for.i
  %call.i.i = call noalias i8* @malloc(i64 32) #9
  %10 = bitcast i8* %call.i.i to %struct.Matrix*
  %data_size1.i.i = getelementptr inbounds i8, i8* %call.i.i, i64 8
  %11 = bitcast i8* %data_size1.i.i to i64*
  store i64 %mul.i, i64* %11, align 8, !tbaa !1
  %data2.i.i = bitcast i8* %call.i.i to i64**
  store i64* %call.i, i64** %data2.i.i, align 8, !tbaa !7
  %height3.i.i = getelementptr inbounds i8, i8* %call.i.i, i64 24
  %12 = bitcast i8* %height3.i.i to i64*
  store i64 %3, i64* %12, align 8, !tbaa !11
  %width4.i.i = getelementptr inbounds i8, i8* %call.i.i, i64 16
  %13 = bitcast i8* %width4.i.i to i64*
  store i64 %3, i64* %13, align 8, !tbaa !10
  %not.cmp35 = icmp eq i8* %call.i.i, null
  %call.i313 = call i64* @create1DArray_int64_t(i64 0, i64 %mul.i) #9
  br i1 %cmp790.i, label %polly.parallel.for.i324, label %if.end146

polly.parallel.for.i324:                          ; preds = %_init_.exit
  %14 = add nsw i64 %3, -1
  %polly.fdiv_q.shr.i320 = ashr i64 %14, 5
  %15 = bitcast { i64, i64, i64* }* %polly.par.userContext.i311 to i8*
  call void @llvm.lifetime.start(i64 24, i8* nonnull %15) #9
  %polly.subfn.storeaddr.width.i321 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i311, i64 0, i32 0
  store i64 %3, i64* %polly.subfn.storeaddr.width.i321, align 8
  %polly.subfn.storeaddr.height.i322 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i311, i64 0, i32 1
  store i64 %3, i64* %polly.subfn.storeaddr.height.i322, align 8
  %polly.subfn.storeaddr.call.i323 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i311, i64 0, i32 2
  store i64* %call.i313, i64** %polly.subfn.storeaddr.call.i323, align 8
  %16 = add nsw i64 %polly.fdiv_q.shr.i320, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_init__polly_subfn, i8* nonnull %15, i32 0, i64 0, i64 %16, i64 1) #9
  call void @_init__polly_subfn(i8* nonnull %15) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* nonnull %15) #9
  br label %if.end146

if.end146:                                        ; preds = %polly.parallel.for.i324, %_init_.exit
  %call.i.i315 = call noalias i8* @malloc(i64 32) #9
  %17 = bitcast i8* %call.i.i315 to %struct.Matrix*
  %data_size1.i.i316 = getelementptr inbounds i8, i8* %call.i.i315, i64 8
  %18 = bitcast i8* %data_size1.i.i316 to i64*
  store i64 %mul.i, i64* %18, align 8, !tbaa !1
  %data2.i.i317 = bitcast i8* %call.i.i315 to i64**
  store i64* %call.i313, i64** %data2.i.i317, align 8, !tbaa !7
  %height3.i.i318 = getelementptr inbounds i8, i8* %call.i.i315, i64 24
  %19 = bitcast i8* %height3.i.i318 to i64*
  store i64 %3, i64* %19, align 8, !tbaa !11
  %width4.i.i319 = getelementptr inbounds i8, i8* %call.i.i315, i64 16
  %20 = bitcast i8* %width4.i.i319 to i64*
  store i64 %3, i64* %20, align 8, !tbaa !10
  %not.cmp48 = icmp eq i8* %call.i.i315, null
  %call60 = call %struct.Matrix* @_mat_mult_(%struct.Matrix* %10, i1 zeroext false, %struct.Matrix* %17, i1 zeroext false)
  %not.cmp61 = icmp eq %struct.Matrix* %call60, null
  %call73 = call i64* @create1DArray_int64_t(i64 0, i64 27) #9
  %21 = bitcast i64* %call73 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %21, align 8, !tbaa !8
  %arrayidx76 = getelementptr inbounds i64, i64* %call73, i64 2
  %22 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %22, align 8, !tbaa !8
  %arrayidx78 = getelementptr inbounds i64, i64* %call73, i64 4
  %23 = bitcast i64* %arrayidx78 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %23, align 8, !tbaa !8
  %arrayidx80 = getelementptr inbounds i64, i64* %call73, i64 6
  %24 = bitcast i64* %arrayidx80 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %24, align 8, !tbaa !8
  %arrayidx82 = getelementptr inbounds i64, i64* %call73, i64 8
  %25 = bitcast i64* %arrayidx82 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %25, align 8, !tbaa !8
  %arrayidx84 = getelementptr inbounds i64, i64* %call73, i64 10
  %26 = bitcast i64* %arrayidx84 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %26, align 8, !tbaa !8
  %arrayidx86 = getelementptr inbounds i64, i64* %call73, i64 12
  %27 = bitcast i64* %arrayidx86 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %27, align 8, !tbaa !8
  %arrayidx88 = getelementptr inbounds i64, i64* %call73, i64 14
  %28 = bitcast i64* %arrayidx88 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %28, align 8, !tbaa !8
  %arrayidx90 = getelementptr inbounds i64, i64* %call73, i64 16
  %29 = bitcast i64* %arrayidx90 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %29, align 8, !tbaa !8
  %arrayidx92 = getelementptr inbounds i64, i64* %call73, i64 18
  %30 = bitcast i64* %arrayidx92 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %30, align 8, !tbaa !8
  %arrayidx94 = getelementptr inbounds i64, i64* %call73, i64 20
  %31 = bitcast i64* %arrayidx94 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %31, align 8, !tbaa !8
  %arrayidx96 = getelementptr inbounds i64, i64* %call73, i64 22
  %32 = bitcast i64* %arrayidx96 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %32, align 8, !tbaa !8
  %arrayidx98 = getelementptr inbounds i64, i64* %call73, i64 24
  %33 = bitcast i64* %arrayidx98 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %33, align 8, !tbaa !8
  %arrayidx100 = getelementptr inbounds i64, i64* %call73, i64 26
  store i64 32, i64* %arrayidx100, align 8, !tbaa !8
  %not.cmp101 = icmp ne i64* %call73, null
  %.310 = zext i1 %not.cmp101 to i8
  call void @printf_s(i64* %call73, i64 27) #9
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call60, i64 0, i32 0
  %34 = load i64*, i64** %data, align 8, !tbaa !7
  %sub108 = add nsw i64 %mul.i, -1
  %arrayidx109 = getelementptr inbounds i64, i64* %34, i64 %sub108
  %35 = load i64, i64* %arrayidx109, align 8, !tbaa !8
  %call110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i64 0, i64 0), i64 %35)
  %call114 = call i64* @create1DArray_int64_t(i64 0, i64 25) #9
  %36 = bitcast i64* %call114 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %36, align 8, !tbaa !8
  %arrayidx117 = getelementptr inbounds i64, i64* %call114, i64 2
  %37 = bitcast i64* %arrayidx117 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %37, align 8, !tbaa !8
  %arrayidx119 = getelementptr inbounds i64, i64* %call114, i64 4
  %38 = bitcast i64* %arrayidx119 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %38, align 8, !tbaa !8
  %arrayidx121 = getelementptr inbounds i64, i64* %call114, i64 6
  %39 = bitcast i64* %arrayidx121 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %39, align 8, !tbaa !8
  %arrayidx123 = getelementptr inbounds i64, i64* %call114, i64 8
  %40 = bitcast i64* %arrayidx123 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %40, align 8, !tbaa !8
  %arrayidx125 = getelementptr inbounds i64, i64* %call114, i64 10
  %41 = bitcast i64* %arrayidx125 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %41, align 8, !tbaa !8
  %arrayidx127 = getelementptr inbounds i64, i64* %call114, i64 12
  %42 = bitcast i64* %arrayidx127 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %42, align 8, !tbaa !8
  %arrayidx129 = getelementptr inbounds i64, i64* %call114, i64 14
  %43 = bitcast i64* %arrayidx129 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %43, align 8, !tbaa !8
  %arrayidx131 = getelementptr inbounds i64, i64* %call114, i64 16
  %44 = bitcast i64* %arrayidx131 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %44, align 8, !tbaa !8
  %arrayidx133 = getelementptr inbounds i64, i64* %call114, i64 18
  %45 = bitcast i64* %arrayidx133 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %45, align 8, !tbaa !8
  %arrayidx135 = getelementptr inbounds i64, i64* %call114, i64 20
  %46 = bitcast i64* %arrayidx135 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %46, align 8, !tbaa !8
  %arrayidx137 = getelementptr inbounds i64, i64* %call114, i64 22
  %47 = bitcast i64* %arrayidx137 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %47, align 8, !tbaa !8
  %arrayidx139 = getelementptr inbounds i64, i64* %call114, i64 24
  store i64 101, i64* %arrayidx139, align 8, !tbaa !8
  %not.cmp140 = icmp ne i64* %call114, null
  %_33_dealloc.0 = zext i1 %not.cmp140 to i8
  call void @println_s(i64* %call114, i64 25) #9
  %phitmp = bitcast i64* %call114 to i8*
  %phitmp307 = bitcast i64* %call73 to i8*
  %phitmp308 = bitcast i64* %call18 to i8*
  %48 = bitcast i64* %34 to i8*
  %49 = bitcast i64* %call3 to i8*
  call void @free(i8* %49) #9
  br i1 %not.cmp35, label %if.end149, label %if.then148

if.then148:                                       ; preds = %if.end146
  %50 = bitcast i8* %call.i.i to i8**
  %51 = load i8*, i8** %50, align 8, !tbaa !7
  call void @free(i8* %51) #9
  call void @free(i8* nonnull %call.i.i) #9
  br label %if.end149

if.end149:                                        ; preds = %if.end146, %if.then148
  br i1 %not.cmp48, label %if.end152, label %if.then151

if.then151:                                       ; preds = %if.end149
  %52 = bitcast i8* %call.i.i315 to i8**
  %53 = load i8*, i8** %52, align 8, !tbaa !7
  call void @free(i8* %53) #9
  call void @free(i8* nonnull %call.i.i315) #9
  br label %if.end152

if.end152:                                        ; preds = %if.end149, %if.then151
  br i1 %not.cmp61, label %if.end158, label %if.then154

if.then154:                                       ; preds = %if.end152
  call void @free(i8* %48) #9
  %54 = bitcast %struct.Matrix* %call60 to i8*
  call void @free(i8* %54) #9
  br label %if.end158

if.end158:                                        ; preds = %if.end152, %entry, %if.then154
  %_12.0331344352364 = phi i8* [ %phitmp308, %if.then154 ], [ %phitmp308, %if.end152 ], [ null, %entry ]
  %_12_dealloc.1332343353363 = phi i8 [ %_12_dealloc.0, %if.then154 ], [ %_12_dealloc.0, %if.end152 ], [ 0, %entry ]
  %_20.0334342354362 = phi i8* [ %phitmp307, %if.then154 ], [ %phitmp307, %if.end152 ], [ null, %entry ]
  %_20_dealloc.1335341355361 = phi i8 [ %.310, %if.then154 ], [ %.310, %if.end152 ], [ 0, %entry ]
  %_33.0336340356360 = phi i8* [ %phitmp, %if.then154 ], [ %phitmp, %if.end152 ], [ null, %entry ]
  %_33_dealloc.1337339357359 = phi i8 [ %_33_dealloc.0, %if.then154 ], [ %_33_dealloc.0, %if.end152 ], [ 0, %entry ]
  br i1 %not.cmp, label %if.end164, label %if.then160

if.then160:                                       ; preds = %if.end158
  %55 = load i64, i64* %_7_size, align 8, !tbaa !8
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %55) #9
  br label %if.end164

if.end164:                                        ; preds = %if.end158, %if.then160
  %tobool165 = icmp eq i8 %_12_dealloc.1332343353363, 0
  br i1 %tobool165, label %if.end176, label %if.then166

if.then166:                                       ; preds = %if.end164
  call void @free(i8* %_12.0331344352364) #9
  br label %if.end176

if.end176:                                        ; preds = %if.then166, %if.end164
  %tobool177 = icmp eq i8 %_20_dealloc.1335341355361, 0
  br i1 %tobool177, label %if.end182, label %if.then178

if.then178:                                       ; preds = %if.end176
  call void @free(i8* %_20.0334342354362) #9
  br label %if.end182

if.end182:                                        ; preds = %if.then178, %if.end176
  %tobool183 = icmp eq i8 %_33_dealloc.1337339357359, 0
  br i1 %tobool183, label %if.end185, label %if.then184

if.then184:                                       ; preds = %if.end182
  call void @free(i8* %_33.0336340356360) #9
  br label %if.end185

if.end185:                                        ; preds = %if.end182, %if.then184
  call void @exit(i32 0) #10
  unreachable
}

declare void @free2DArray_int64_t(i64**, i64) local_unnamed_addr #3

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #6

declare i32 @putchar(i32) local_unnamed_addr

define internal void @_init__polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.width = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64*
  %polly.subfunc.arg.height = load i64, i64* %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.call = load i64*, i64** %4, align 8
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit, label %polly.par.loadIVBounds.lr.ph

polly.par.loadIVBounds.lr.ph:                     ; preds = %polly.par.setup
  %7 = and i64 %polly.subfunc.arg.width, 3
  %8 = add nsw i64 %polly.subfunc.arg.width, -1
  %polly.fdiv_q.shr = ashr i64 %8, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %pexp.p_div_q = lshr i64 %polly.subfunc.arg.width, 2
  %9 = add nsw i64 %pexp.p_div_q, -1
  %polly.loop_guard37 = icmp eq i64 %7, 0
  %10 = and i64 %polly.subfunc.arg.width, -4
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %11 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.lr.ph, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  br i1 %polly.loop_guard, label %polly.loop_header2.preheader, label %polly.loop_exit4

polly.loop_header2.preheader:                     ; preds = %polly.loop_header
  %13 = shl nsw i64 %polly.indvar, 5
  %14 = sub nsw i64 %polly.subfunc.arg.height, %13
  %15 = add nsw i64 %14, -1
  %16 = icmp slt i64 %15, 31
  %17 = select i1 %16, i64 %15, i64 31
  %polly.loop_guard13 = icmp sgt i64 %17, -1
  %polly.adjust_ub16 = add i64 %17, -1
  br label %polly.loop_header2

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit12
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header2:                               ; preds = %polly.loop_header2.preheader, %polly.loop_exit12
  %polly.indvar5 = phi i64 [ %polly.indvar_next6, %polly.loop_exit12 ], [ 0, %polly.loop_header2.preheader ]
  br i1 %polly.loop_guard13, label %polly.loop_header10.preheader, label %polly.loop_exit12

polly.loop_header10.preheader:                    ; preds = %polly.loop_header2
  %18 = mul nsw i64 %polly.indvar5, -8
  %19 = add nsw i64 %9, %18
  %20 = icmp slt i64 %19, 7
  %21 = select i1 %20, i64 %19, i64 7
  %polly.loop_guard22 = icmp sgt i64 %21, -1
  %22 = shl i64 %polly.indvar5, 5
  %23 = or i64 %22, 31
  %24 = icmp slt i64 %23, %polly.subfunc.arg.width
  %or.cond = or i1 %polly.loop_guard37, %24
  %polly.adjust_ub25 = add i64 %21, -1
  br i1 %polly.loop_guard22, label %polly.loop_header10.us.preheader, label %polly.loop_header10.preheader.split

polly.loop_header10.us.preheader:                 ; preds = %polly.loop_header10.preheader
  br label %polly.loop_header10.us

polly.loop_header10.us:                           ; preds = %polly.loop_header10.us.preheader, %polly.merge.us
  %polly.indvar14.us = phi i64 [ %polly.indvar_next15.us, %polly.merge.us ], [ 0, %polly.loop_header10.us.preheader ]
  %25 = add nsw i64 %polly.indvar14.us, %13
  %26 = mul i64 %25, %polly.subfunc.arg.width
  %27 = add i64 %26, %22
  %28 = insertelement <2 x i64> undef, i64 %25, i32 0
  %29 = shufflevector <2 x i64> %28, <2 x i64> undef, <2 x i32> zeroinitializer
  %30 = insertelement <2 x i64> undef, i64 %25, i32 0
  %31 = shufflevector <2 x i64> %30, <2 x i64> undef, <2 x i32> zeroinitializer
  br label %polly.loop_header19.us

polly.loop_header19.us:                           ; preds = %polly.loop_header10.us, %polly.loop_header19.us
  %polly.indvar23.us = phi i64 [ %polly.indvar_next24.us, %polly.loop_header19.us ], [ 0, %polly.loop_header10.us ]
  %32 = shl i64 %polly.indvar23.us, 2
  %33 = add i64 %27, %32
  %scevgep.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %33
  %34 = bitcast i64* %scevgep.us to <2 x i64>*
  %35 = load <2 x i64>, <2 x i64>* %34, align 8, !alias.scope !12, !noalias !14
  %36 = add nsw <2 x i64> %35, %29
  %37 = bitcast i64* %scevgep.us to <2 x i64>*
  store <2 x i64> %36, <2 x i64>* %37, align 8, !alias.scope !12, !noalias !14
  %38 = add i64 %33, 2
  %scevgep.us.2 = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %38
  %39 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  %40 = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !12, !noalias !14
  %41 = add nsw <2 x i64> %40, %31
  %42 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %42, align 8, !alias.scope !12, !noalias !14
  %polly.indvar_next24.us = add nuw nsw i64 %polly.indvar23.us, 1
  %polly.loop_cond26.us = icmp sgt i64 %polly.indvar23.us, %polly.adjust_ub25
  br i1 %polly.loop_cond26.us, label %polly.cond.loopexit.us, label %polly.loop_header19.us

polly.loop_header34.us:                           ; preds = %polly.loop_header34.preheader.us, %polly.loop_header34.us
  %polly.indvar38.us = phi i64 [ %polly.indvar_next39.us, %polly.loop_header34.us ], [ 0, %polly.loop_header34.preheader.us ]
  %43 = add i64 %44, %polly.indvar38.us
  %scevgep44.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %43
  %_p_scalar_45.us = load i64, i64* %scevgep44.us, align 8, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !15
  %p_add1646.us = add nsw i64 %_p_scalar_45.us, %25
  store i64 %p_add1646.us, i64* %scevgep44.us, align 8, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !15
  %polly.indvar_next39.us = add nuw nsw i64 %polly.indvar38.us, 1
  %exitcond47.us = icmp eq i64 %polly.indvar_next39.us, %7
  br i1 %exitcond47.us, label %polly.merge.us.loopexit, label %polly.loop_header34.us, !llvm.loop !16

polly.merge.us.loopexit:                          ; preds = %polly.loop_header34.us
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next15.us = add nuw nsw i64 %polly.indvar14.us, 1
  %polly.loop_cond17.us = icmp sgt i64 %polly.indvar14.us, %polly.adjust_ub16
  br i1 %polly.loop_cond17.us, label %polly.loop_exit12.loopexit, label %polly.loop_header10.us

polly.loop_header34.preheader.us:                 ; preds = %polly.cond.loopexit.us
  %44 = add i64 %26, %10
  br label %polly.loop_header34.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header19.us
  br i1 %or.cond, label %polly.merge.us, label %polly.loop_header34.preheader.us

polly.loop_header10.preheader.split:              ; preds = %polly.loop_header10.preheader
  br i1 %or.cond, label %polly.loop_exit12, label %polly.loop_header10.preheader110

polly.loop_header10.preheader110:                 ; preds = %polly.loop_header10.preheader.split
  br label %polly.loop_header10

polly.loop_exit12.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit12

polly.loop_exit12.loopexit111:                    ; preds = %polly.merge
  br label %polly.loop_exit12

polly.loop_exit12:                                ; preds = %polly.loop_exit12.loopexit111, %polly.loop_exit12.loopexit, %polly.loop_header10.preheader.split, %polly.loop_header2
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond48 = icmp eq i64 %polly.indvar5, %polly.fdiv_q.shr
  br i1 %exitcond48, label %polly.loop_exit4.loopexit, label %polly.loop_header2

polly.loop_header10:                              ; preds = %polly.loop_header10.preheader110, %polly.merge
  %polly.indvar14 = phi i64 [ %polly.indvar_next15, %polly.merge ], [ 0, %polly.loop_header10.preheader110 ]
  %45 = add nsw i64 %polly.indvar14, %13
  %46 = mul i64 %45, %polly.subfunc.arg.width
  %47 = add i64 %46, %10
  br label %polly.loop_header34

polly.merge:                                      ; preds = %polly.loop_header34
  %polly.indvar_next15 = add nuw nsw i64 %polly.indvar14, 1
  %polly.loop_cond17 = icmp sgt i64 %polly.indvar14, %polly.adjust_ub16
  br i1 %polly.loop_cond17, label %polly.loop_exit12.loopexit111, label %polly.loop_header10

polly.loop_header34:                              ; preds = %polly.loop_header10, %polly.loop_header34
  %polly.indvar38 = phi i64 [ %polly.indvar_next39, %polly.loop_header34 ], [ 0, %polly.loop_header10 ]
  %48 = add i64 %47, %polly.indvar38
  %scevgep44 = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %48
  %_p_scalar_45 = load i64, i64* %scevgep44, align 8, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !15
  %p_add1646 = add nsw i64 %_p_scalar_45, %45
  store i64 %p_add1646, i64* %scevgep44, align 8, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !15
  %polly.indvar_next39 = add nuw nsw i64 %polly.indvar38, 1
  %exitcond47 = icmp eq i64 %polly.indvar_next39, %7
  br i1 %exitcond47, label %polly.merge, label %polly.loop_header34, !llvm.loop !20
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*) local_unnamed_addr

declare void @GOMP_loop_end_nowait() local_unnamed_addr

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64) local_unnamed_addr

declare void @GOMP_parallel_end() local_unnamed_addr

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #8

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #8

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #8

define internal void @_mat_mult__polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg. = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64*
  %polly.subfunc.arg.2 = load i64, i64* %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.call = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 24
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.3 = load i64*, i64** %6, align 8
  %7 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 32
  %8 = bitcast i8* %7 to i64**
  %polly.subfunc.arg.4 = load i64*, i64** %8, align 8
  %9 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %polly.par.exit, label %polly.par.loadIVBounds.lr.ph

polly.par.loadIVBounds.lr.ph:                     ; preds = %polly.par.setup
  %11 = and i64 %polly.subfunc.arg., 3
  %12 = add i64 %polly.subfunc.arg., -1
  %13 = lshr i64 %12, 5
  %polly.fdiv_q.shr = ashr i64 %12, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %pexp.p_div_q37 = lshr i64 %polly.subfunc.arg., 2
  %14 = add nsw i64 %pexp.p_div_q37, -1
  %polly.loop_guard61 = icmp eq i64 %11, 0
  %15 = and i64 %polly.subfunc.arg., -4
  %16 = add nsw i64 %11, -1
  %xtraiter173 = and i64 %polly.subfunc.arg., 1
  %lcmp.mod174 = icmp eq i64 %xtraiter173, 0
  %17 = mul i64 %15, %polly.subfunc.arg.
  %18 = icmp eq i64 %16, 0
  %xtraiter = and i64 %polly.subfunc.arg., 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %19 = mul i64 %15, %polly.subfunc.arg.
  %20 = icmp eq i64 %16, 0
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit7
  %21 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.lr.ph, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit7, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit7 ]
  br i1 %polly.loop_guard, label %polly.loop_header5.preheader, label %polly.loop_exit7

polly.loop_header5.preheader:                     ; preds = %polly.loop_header
  %23 = shl i64 %polly.indvar, 5
  %24 = sub nsw i64 %polly.subfunc.arg.2, %23
  %25 = add nsw i64 %24, -1
  %26 = icmp slt i64 %25, 31
  %27 = select i1 %26, i64 %25, i64 31
  %polly.loop_guard23 = icmp sgt i64 %27, -1
  %polly.adjust_ub26 = add i64 %27, -1
  br label %polly.loop_header5

polly.loop_exit7.loopexit:                        ; preds = %polly.loop_exit14
  br label %polly.loop_exit7

polly.loop_exit7:                                 ; preds = %polly.loop_exit7.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header5:                               ; preds = %polly.loop_header5.preheader, %polly.loop_exit14
  %polly.indvar8 = phi i64 [ %polly.indvar_next9, %polly.loop_exit14 ], [ 0, %polly.loop_header5.preheader ]
  %28 = shl nsw i64 %polly.indvar8, 5
  %29 = sub nsw i64 %polly.subfunc.arg., %28
  %30 = add nsw i64 %29, -1
  %31 = icmp slt i64 %30, 31
  %32 = select i1 %31, i64 %30, i64 31
  %polly.loop_guard32 = icmp sgt i64 %32, -1
  %polly.adjust_ub35 = add i64 %32, -1
  br label %polly.loop_header12

polly.loop_exit14:                                ; preds = %polly.loop_exit22
  %polly.indvar_next9 = add nuw nsw i64 %polly.indvar8, 1
  %exitcond78 = icmp eq i64 %polly.indvar8, %polly.fdiv_q.shr
  br i1 %exitcond78, label %polly.loop_exit7.loopexit, label %polly.loop_header5

polly.loop_header12:                              ; preds = %polly.loop_exit22, %polly.loop_header5
  %polly.indvar15 = phi i64 [ 0, %polly.loop_header5 ], [ %polly.indvar_next16, %polly.loop_exit22 ]
  br i1 %polly.loop_guard23, label %polly.loop_header20.preheader, label %polly.loop_exit22

polly.loop_header20.preheader:                    ; preds = %polly.loop_header12
  %33 = mul nsw i64 %polly.indvar15, -8
  %34 = add nsw i64 %14, %33
  %35 = icmp slt i64 %34, 7
  %36 = select i1 %35, i64 %34, i64 7
  %polly.loop_guard42 = icmp sgt i64 %36, -1
  %37 = shl i64 %polly.indvar15, 5
  %38 = or i64 %37, 31
  %39 = icmp slt i64 %38, %polly.subfunc.arg.
  %or.cond = or i1 %polly.loop_guard61, %39
  %polly.adjust_ub45 = add i64 %36, -1
  br label %polly.loop_header20

polly.loop_exit22.loopexit:                       ; preds = %polly.loop_exit31
  br label %polly.loop_exit22

polly.loop_exit22:                                ; preds = %polly.loop_exit22.loopexit, %polly.loop_header12
  %polly.indvar_next16 = add nuw nsw i64 %polly.indvar15, 1
  %exitcond77 = icmp eq i64 %polly.indvar15, %13
  br i1 %exitcond77, label %polly.loop_exit14, label %polly.loop_header12

polly.loop_header20:                              ; preds = %polly.loop_header20.preheader, %polly.loop_exit31
  %polly.indvar24 = phi i64 [ %polly.indvar_next25, %polly.loop_exit31 ], [ 0, %polly.loop_header20.preheader ]
  br i1 %polly.loop_guard32, label %polly.loop_header29.preheader, label %polly.loop_exit31

polly.loop_header29.preheader:                    ; preds = %polly.loop_header20
  %40 = add nsw i64 %polly.indvar24, %23
  %41 = mul i64 %40, %polly.subfunc.arg.
  br i1 %polly.loop_guard42, label %polly.loop_header29.us.preheader, label %polly.loop_header29.preheader.split

polly.loop_header29.us.preheader:                 ; preds = %polly.loop_header29.preheader
  %42 = add i64 %15, %41
  %scevgep70.us.prol = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %42
  br label %polly.loop_header29.us

polly.loop_header29.us:                           ; preds = %polly.loop_header29.us.preheader, %polly.merge.us
  %polly.indvar33.us = phi i64 [ %polly.indvar_next34.us, %polly.merge.us ], [ 0, %polly.loop_header29.us.preheader ]
  %43 = add nuw nsw i64 %polly.indvar33.us, %28
  %44 = add i64 %43, %41
  %scevgep.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %44
  %scevgep.promoted80.us = load i64, i64* %scevgep.us, align 8, !alias.scope !21, !noalias !23
  br label %polly.loop_header39.us

polly.loop_header39.us:                           ; preds = %polly.loop_header29.us, %polly.loop_header39.us
  %p_add52.lcssa81.us = phi i64 [ %p_add52.us.3, %polly.loop_header39.us ], [ %scevgep.promoted80.us, %polly.loop_header29.us ]
  %polly.indvar43.us = phi i64 [ %polly.indvar_next44.us, %polly.loop_header39.us ], [ 0, %polly.loop_header29.us ]
  %45 = shl i64 %polly.indvar43.us, 2
  %46 = add nuw nsw i64 %45, %37
  %47 = add i64 %46, %41
  %scevgep53.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %47
  %_p_scalar_54.us = load i64, i64* %scevgep53.us, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !27
  %48 = mul i64 %46, %polly.subfunc.arg.
  %49 = add i64 %48, %43
  %scevgep55.us = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %49
  %_p_scalar_56.us = load i64, i64* %scevgep55.us, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !27
  %p_mul51.us = mul nsw i64 %_p_scalar_56.us, %_p_scalar_54.us
  %p_add52.us = add nsw i64 %p_mul51.us, %p_add52.lcssa81.us
  %50 = or i64 %46, 1
  %51 = add i64 %50, %41
  %scevgep53.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %51
  %_p_scalar_54.us.1 = load i64, i64* %scevgep53.us.1, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !27
  %52 = mul i64 %50, %polly.subfunc.arg.
  %53 = add i64 %52, %43
  %scevgep55.us.1 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %53
  %_p_scalar_56.us.1 = load i64, i64* %scevgep55.us.1, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !27
  %p_mul51.us.1 = mul nsw i64 %_p_scalar_56.us.1, %_p_scalar_54.us.1
  %p_add52.us.1 = add nsw i64 %p_mul51.us.1, %p_add52.us
  %54 = or i64 %46, 2
  %55 = add i64 %54, %41
  %scevgep53.us.2 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %55
  %_p_scalar_54.us.2 = load i64, i64* %scevgep53.us.2, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !27
  %56 = mul i64 %54, %polly.subfunc.arg.
  %57 = add i64 %56, %43
  %scevgep55.us.2 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %57
  %_p_scalar_56.us.2 = load i64, i64* %scevgep55.us.2, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !27
  %p_mul51.us.2 = mul nsw i64 %_p_scalar_56.us.2, %_p_scalar_54.us.2
  %p_add52.us.2 = add nsw i64 %p_mul51.us.2, %p_add52.us.1
  %58 = or i64 %46, 3
  %59 = add i64 %58, %41
  %scevgep53.us.3 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %59
  %_p_scalar_54.us.3 = load i64, i64* %scevgep53.us.3, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !27
  %60 = mul i64 %58, %polly.subfunc.arg.
  %61 = add i64 %60, %43
  %scevgep55.us.3 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %61
  %_p_scalar_56.us.3 = load i64, i64* %scevgep55.us.3, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !27
  %p_mul51.us.3 = mul nsw i64 %_p_scalar_56.us.3, %_p_scalar_54.us.3
  %p_add52.us.3 = add nsw i64 %p_mul51.us.3, %p_add52.us.2
  %polly.indvar_next44.us = add nuw nsw i64 %polly.indvar43.us, 1
  %polly.loop_cond46.us = icmp sgt i64 %polly.indvar43.us, %polly.adjust_ub45
  br i1 %polly.loop_cond46.us, label %polly.cond.loopexit.us, label %polly.loop_header39.us

polly.loop_header58.us:                           ; preds = %polly.loop_header58.us, %polly.loop_header58.us.preheader.new
  %p_add527582.us = phi i64 [ %p_add527582.us.unr.ph, %polly.loop_header58.us.preheader.new ], [ %p_add5275.us.1, %polly.loop_header58.us ]
  %polly.indvar62.us = phi i64 [ %polly.indvar62.us.unr.ph, %polly.loop_header58.us.preheader.new ], [ %polly.indvar_next63.us.1, %polly.loop_header58.us ]
  %62 = add nuw nsw i64 %polly.indvar62.us, %15
  %63 = add i64 %62, %41
  %scevgep70.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %63
  %_p_scalar_71.us = load i64, i64* %scevgep70.us, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %64 = mul i64 %62, %polly.subfunc.arg.
  %65 = add i64 %64, %43
  %scevgep72.us = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %65
  %_p_scalar_73.us = load i64, i64* %scevgep72.us, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %p_mul5174.us = mul nsw i64 %_p_scalar_73.us, %_p_scalar_71.us
  %p_add5275.us = add nsw i64 %p_mul5174.us, %p_add527582.us
  %polly.indvar_next63.us = add nuw nsw i64 %polly.indvar62.us, 1
  %66 = add nuw nsw i64 %polly.indvar_next63.us, %15
  %67 = add i64 %66, %41
  %scevgep70.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %67
  %_p_scalar_71.us.1 = load i64, i64* %scevgep70.us.1, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %68 = mul i64 %66, %polly.subfunc.arg.
  %69 = add i64 %68, %43
  %scevgep72.us.1 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %69
  %_p_scalar_73.us.1 = load i64, i64* %scevgep72.us.1, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %p_mul5174.us.1 = mul nsw i64 %_p_scalar_73.us.1, %_p_scalar_71.us.1
  %p_add5275.us.1 = add nsw i64 %p_mul5174.us.1, %p_add5275.us
  %polly.indvar_next63.us.1 = add nsw i64 %polly.indvar62.us, 2
  %exitcond76.us.1 = icmp eq i64 %polly.indvar_next63.us.1, %11
  br i1 %exitcond76.us.1, label %polly.merge.loopexit.us.unr-lcssa, label %polly.loop_header58.us, !llvm.loop !30

polly.merge.us:                                   ; preds = %polly.merge.loopexit.us, %polly.cond.loopexit.us
  %polly.indvar_next34.us = add nuw nsw i64 %polly.indvar33.us, 1
  %polly.loop_cond36.us = icmp sgt i64 %polly.indvar33.us, %polly.adjust_ub35
  br i1 %polly.loop_cond36.us, label %polly.loop_exit31.loopexit, label %polly.loop_header29.us

polly.merge.loopexit.us.unr-lcssa:                ; preds = %polly.loop_header58.us
  br label %polly.merge.loopexit.us

polly.merge.loopexit.us:                          ; preds = %polly.loop_header58.us.prol.loopexit, %polly.merge.loopexit.us.unr-lcssa
  %p_add5275.us.lcssa = phi i64 [ %p_add5275.us.lcssa.unr.ph, %polly.loop_header58.us.prol.loopexit ], [ %p_add5275.us.1, %polly.merge.loopexit.us.unr-lcssa ]
  store i64 %p_add5275.us.lcssa, i64* %scevgep.us, align 8, !alias.scope !21, !noalias !23
  br label %polly.merge.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header39.us
  store i64 %p_add52.us.3, i64* %scevgep.us, align 8, !alias.scope !21, !noalias !23
  br i1 %or.cond, label %polly.merge.us, label %polly.loop_header58.us.preheader

polly.loop_header58.us.preheader:                 ; preds = %polly.cond.loopexit.us
  br i1 %lcmp.mod174, label %polly.loop_header58.us.prol.loopexit.unr-lcssa, label %polly.loop_header58.us.prol.preheader

polly.loop_header58.us.prol.preheader:            ; preds = %polly.loop_header58.us.preheader
  br label %polly.loop_header58.us.prol

polly.loop_header58.us.prol:                      ; preds = %polly.loop_header58.us.prol.preheader
  %_p_scalar_71.us.prol = load i64, i64* %scevgep70.us.prol, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %70 = add i64 %17, %43
  %scevgep72.us.prol = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %70
  %_p_scalar_73.us.prol = load i64, i64* %scevgep72.us.prol, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %p_mul5174.us.prol = mul nsw i64 %_p_scalar_73.us.prol, %_p_scalar_71.us.prol
  %p_add5275.us.prol = add nsw i64 %p_mul5174.us.prol, %p_add52.us.3
  br label %polly.loop_header58.us.prol.loopexit.unr-lcssa

polly.loop_header58.us.prol.loopexit.unr-lcssa:   ; preds = %polly.loop_header58.us.preheader, %polly.loop_header58.us.prol
  %p_add5275.us.lcssa.unr.ph = phi i64 [ %p_add5275.us.prol, %polly.loop_header58.us.prol ], [ undef, %polly.loop_header58.us.preheader ]
  %p_add527582.us.unr.ph = phi i64 [ %p_add5275.us.prol, %polly.loop_header58.us.prol ], [ %p_add52.us.3, %polly.loop_header58.us.preheader ]
  %polly.indvar62.us.unr.ph = phi i64 [ 1, %polly.loop_header58.us.prol ], [ 0, %polly.loop_header58.us.preheader ]
  br label %polly.loop_header58.us.prol.loopexit

polly.loop_header58.us.prol.loopexit:             ; preds = %polly.loop_header58.us.prol.loopexit.unr-lcssa
  br i1 %18, label %polly.merge.loopexit.us, label %polly.loop_header58.us.preheader.new

polly.loop_header58.us.preheader.new:             ; preds = %polly.loop_header58.us.prol.loopexit
  br label %polly.loop_header58.us

polly.loop_header29.preheader.split:              ; preds = %polly.loop_header29.preheader
  br i1 %or.cond, label %polly.loop_exit31, label %polly.loop_header29.preheader171

polly.loop_header29.preheader171:                 ; preds = %polly.loop_header29.preheader.split
  %71 = add i64 %15, %41
  %scevgep70.prol = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %71
  br label %polly.loop_header29

polly.loop_exit31.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit31

polly.loop_exit31.loopexit172:                    ; preds = %polly.merge.loopexit
  br label %polly.loop_exit31

polly.loop_exit31:                                ; preds = %polly.loop_exit31.loopexit172, %polly.loop_exit31.loopexit, %polly.loop_header29.preheader.split, %polly.loop_header20
  %polly.indvar_next25 = add nuw nsw i64 %polly.indvar24, 1
  %polly.loop_cond27 = icmp sgt i64 %polly.indvar24, %polly.adjust_ub26
  br i1 %polly.loop_cond27, label %polly.loop_exit22.loopexit, label %polly.loop_header20

polly.loop_header29:                              ; preds = %polly.loop_header29.preheader171, %polly.merge.loopexit
  %polly.indvar33 = phi i64 [ %polly.indvar_next34, %polly.merge.loopexit ], [ 0, %polly.loop_header29.preheader171 ]
  %72 = add nuw nsw i64 %polly.indvar33, %28
  %73 = add i64 %72, %41
  %scevgep68 = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %73
  %scevgep68.promoted = load i64, i64* %scevgep68, align 8, !alias.scope !21, !noalias !23
  br i1 %lcmp.mod, label %polly.loop_header58.prol.loopexit.unr-lcssa, label %polly.loop_header58.prol.preheader

polly.loop_header58.prol.preheader:               ; preds = %polly.loop_header29
  br label %polly.loop_header58.prol

polly.loop_header58.prol:                         ; preds = %polly.loop_header58.prol.preheader
  %_p_scalar_71.prol = load i64, i64* %scevgep70.prol, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %74 = add i64 %19, %72
  %scevgep72.prol = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %74
  %_p_scalar_73.prol = load i64, i64* %scevgep72.prol, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %p_mul5174.prol = mul nsw i64 %_p_scalar_73.prol, %_p_scalar_71.prol
  %p_add5275.prol = add nsw i64 %p_mul5174.prol, %scevgep68.promoted
  br label %polly.loop_header58.prol.loopexit.unr-lcssa

polly.loop_header58.prol.loopexit.unr-lcssa:      ; preds = %polly.loop_header29, %polly.loop_header58.prol
  %p_add5275.lcssa.unr.ph = phi i64 [ %p_add5275.prol, %polly.loop_header58.prol ], [ undef, %polly.loop_header29 ]
  %p_add527582.unr.ph = phi i64 [ %p_add5275.prol, %polly.loop_header58.prol ], [ %scevgep68.promoted, %polly.loop_header29 ]
  %polly.indvar62.unr.ph = phi i64 [ 1, %polly.loop_header58.prol ], [ 0, %polly.loop_header29 ]
  br label %polly.loop_header58.prol.loopexit

polly.loop_header58.prol.loopexit:                ; preds = %polly.loop_header58.prol.loopexit.unr-lcssa
  br i1 %20, label %polly.merge.loopexit, label %polly.loop_header29.new

polly.loop_header29.new:                          ; preds = %polly.loop_header58.prol.loopexit
  br label %polly.loop_header58

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header58
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.loop_header58.prol.loopexit, %polly.merge.loopexit.unr-lcssa
  %p_add5275.lcssa = phi i64 [ %p_add5275.lcssa.unr.ph, %polly.loop_header58.prol.loopexit ], [ %p_add5275.1, %polly.merge.loopexit.unr-lcssa ]
  store i64 %p_add5275.lcssa, i64* %scevgep68, align 8, !alias.scope !21, !noalias !23
  %polly.indvar_next34 = add nuw nsw i64 %polly.indvar33, 1
  %polly.loop_cond36 = icmp sgt i64 %polly.indvar33, %polly.adjust_ub35
  br i1 %polly.loop_cond36, label %polly.loop_exit31.loopexit172, label %polly.loop_header29

polly.loop_header58:                              ; preds = %polly.loop_header58, %polly.loop_header29.new
  %p_add527582 = phi i64 [ %p_add527582.unr.ph, %polly.loop_header29.new ], [ %p_add5275.1, %polly.loop_header58 ]
  %polly.indvar62 = phi i64 [ %polly.indvar62.unr.ph, %polly.loop_header29.new ], [ %polly.indvar_next63.1, %polly.loop_header58 ]
  %75 = add nuw nsw i64 %polly.indvar62, %15
  %76 = add i64 %75, %41
  %scevgep70 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %76
  %_p_scalar_71 = load i64, i64* %scevgep70, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %77 = mul i64 %75, %polly.subfunc.arg.
  %78 = add i64 %77, %72
  %scevgep72 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %78
  %_p_scalar_73 = load i64, i64* %scevgep72, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %p_mul5174 = mul nsw i64 %_p_scalar_73, %_p_scalar_71
  %p_add5275 = add nsw i64 %p_mul5174, %p_add527582
  %polly.indvar_next63 = add nuw nsw i64 %polly.indvar62, 1
  %79 = add nuw nsw i64 %polly.indvar_next63, %15
  %80 = add i64 %79, %41
  %scevgep70.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %80
  %_p_scalar_71.1 = load i64, i64* %scevgep70.1, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %81 = mul i64 %79, %polly.subfunc.arg.
  %82 = add i64 %81, %72
  %scevgep72.1 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %82
  %_p_scalar_73.1 = load i64, i64* %scevgep72.1, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %p_mul5174.1 = mul nsw i64 %_p_scalar_73.1, %_p_scalar_71.1
  %p_add5275.1 = add nsw i64 %p_mul5174.1, %p_add5275
  %polly.indvar_next63.1 = add nsw i64 %polly.indvar62, 2
  %exitcond76.1 = icmp eq i64 %polly.indvar_next63.1, %11
  br i1 %exitcond76.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header58, !llvm.loop !31
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "polly.skip.fn" }
attributes #8 = { nounwind readnone }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }

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
!15 = distinct !{!15}
!16 = distinct !{!16, !17, !18, !19}
!17 = !{!"llvm.loop.unroll.runtime.disable"}
!18 = !{!"llvm.loop.vectorize.width", i32 1}
!19 = !{!"llvm.loop.interleave.count", i32 1}
!20 = distinct !{!20, !17, !18, !19}
!21 = distinct !{!21, !22, !"polly.alias.scope.call"}
!22 = distinct !{!22, !"polly.alias.scope.domain"}
!23 = !{!24, !25}
!24 = distinct !{!24, !22, !"polly.alias.scope."}
!25 = distinct !{!25, !22, !"polly.alias.scope."}
!26 = !{!25, !21}
!27 = distinct !{!27}
!28 = !{!24, !21}
!29 = distinct !{!29}
!30 = distinct !{!30, !18, !19}
!31 = distinct !{!31, !18, !19}
