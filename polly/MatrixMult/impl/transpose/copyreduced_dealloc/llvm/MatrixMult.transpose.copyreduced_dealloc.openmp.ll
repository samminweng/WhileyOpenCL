; ModuleID = 'MatrixMult_transpose.c'
source_filename = "MatrixMult_transpose.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i64*, i64, i64, i64 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str.1 = private unnamed_addr constant [7 x i8] c" data:\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c" width:\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c" height:\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

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
  %call3 = tail call i64* @copy(i64* %3, i64 %1) #9
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

declare i64* @copy(i64*, i64) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix** @copy_array_Matrix(%struct.Matrix** nocapture readonly %_Matrix, i64 %_Matrix_size) local_unnamed_addr #0 {
entry:
  %mul = shl i64 %_Matrix_size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #9
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
  %call.i = tail call noalias i8* @malloc(i64 32) #9
  %data_size.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 1
  %2 = load i64, i64* %data_size.i, align 8, !tbaa !1
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %3 = bitcast i8* %data_size1.i to i64*
  store i64 %2, i64* %3, align 8, !tbaa !1
  %data.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 0
  %4 = load i64*, i64** %data.i, align 8, !tbaa !7
  %call3.i = tail call i64* @copy(i64* %4, i64 %2) #9
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
  tail call void @printf1DArray(i64* %0, i64 %1) #9
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0))
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 2
  %2 = load i64, i64* %width, align 8, !tbaa !10
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %2)
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0))
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 3
  %3 = load i64, i64* %height, align 8, !tbaa !11
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %3)
  %putchar10 = tail call i32 @putchar(i32 125) #9
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @printf1DArray(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @matrix(i64 %width, i64 %height, i64* %data, i64 %data_size, i1 zeroext %data_dealloc) local_unnamed_addr #0 {
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
define noalias %struct.Matrix* @init(i64 %width, i64 %height) local_unnamed_addr #4 {
entry:
  %polly.par.userContext = alloca { i64, i64, i64* }, align 8
  %mul = mul nsw i64 %height, %width
  %conv1 = trunc i64 %mul to i32
  %call = tail call i64* @create1DArray(i32 0, i32 %conv1) #9
  %cmp88 = icmp sgt i64 %height, 0
  br i1 %cmp88, label %polly.parallel.for, label %if.end24

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
  call void @llvm.lifetime.start(i64 24, i8* %5)
  %polly.subfn.storeaddr.width = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %width, i64* %polly.subfn.storeaddr.width, align 8
  %polly.subfn.storeaddr.height = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64 %height, i64* %polly.subfn.storeaddr.height, align 8
  %polly.subfn.storeaddr.call = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %call, i64** %polly.subfn.storeaddr.call, align 8
  %6 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %5, i32 0, i64 0, i64 %6, i64 1) #9
  call void @init_polly_subfn(i8* %5) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %5)
  br label %if.end24
}

declare i64* @create1DArray(i32, i32) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define void @print_mat(%struct._IO_FILE* nocapture readnone %sys, %struct.Matrix* nocapture %a, i1 zeroext %a_dealloc) local_unnamed_addr #0 {
entry:
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2
  %0 = load i64, i64* %width1, align 8, !tbaa !10
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height2, align 8, !tbaa !11
  %cmp84 = icmp sgt i64 %1, 0
  br i1 %cmp84, label %while.cond3.preheader.preheader, label %blklab6

while.cond3.preheader.preheader:                  ; preds = %entry
  %cmp579 = icmp sgt i64 %0, 0
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  br i1 %cmp579, label %while.cond3.preheader.us.preheader, label %while.cond3.preheader.preheader105

while.cond3.preheader.preheader105:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader

while.cond3.preheader.us.preheader:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader.us

while.cond3.preheader.us:                         ; preds = %while.cond3.preheader.us.preheader, %if.end19.us
  %_25_dealloc.090.us = phi i1 [ true, %if.end19.us ], [ false, %while.cond3.preheader.us.preheader ]
  %_25.089.us = phi i8* [ %6, %if.end19.us ], [ undef, %while.cond3.preheader.us.preheader ]
  %_18_dealloc.088.us = phi i8 [ 1, %if.end19.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %_18.087.us = phi i64* [ %call13.us, %if.end19.us ], [ null, %while.cond3.preheader.us.preheader ]
  %i.085.us = phi i64 [ %add16.us, %if.end19.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %mul.us = mul nsw i64 %i.085.us, %0
  br label %if.end9.us

if.end9.us:                                       ; preds = %while.cond3.preheader.us, %if.end12.us
  %_18_dealloc.182.us = phi i8 [ 1, %if.end12.us ], [ %_18_dealloc.088.us, %while.cond3.preheader.us ]
  %_18.181.us = phi i64* [ %call13.us, %if.end12.us ], [ %_18.087.us, %while.cond3.preheader.us ]
  %j.080.us = phi i64 [ %add15.us, %if.end12.us ], [ 0, %while.cond3.preheader.us ]
  %2 = load i64*, i64** %data, align 8, !tbaa !7
  %add.us = add nsw i64 %j.080.us, %mul.us
  %arrayidx.us = getelementptr inbounds i64, i64* %2, i64 %add.us
  %3 = load i64, i64* %arrayidx.us, align 8, !tbaa !8
  %call.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %3)
  %4 = and i8 %_18_dealloc.182.us, 1
  %tobool10.us = icmp eq i8 %4, 0
  br i1 %tobool10.us, label %if.end12.us, label %if.then11.us

if.then11.us:                                     ; preds = %if.end9.us
  %5 = bitcast i64* %_18.181.us to i8*
  tail call void @free(i8* %5) #9
  br label %if.end12.us

if.end12.us:                                      ; preds = %if.then11.us, %if.end9.us
  %call13.us = tail call i64* @create1DArray(i32 0, i32 1) #9
  store i64 32, i64* %call13.us, align 8, !tbaa !8
  tail call void @printf_s(i64* %call13.us, i64 1) #9
  %add15.us = add nuw nsw i64 %j.080.us, 1
  %exitcond.us = icmp eq i64 %add15.us, %0
  br i1 %exitcond.us, label %blklab8.loopexit.us, label %if.end9.us

if.then18.us:                                     ; preds = %blklab8.loopexit.us
  tail call void @free(i8* %_25.089.us) #9
  br label %if.end19.us

if.end19.us:                                      ; preds = %if.then18.us, %blklab8.loopexit.us
  %call21.us = tail call i64* @create1DArray(i32 0, i32 0) #9
  %6 = bitcast i64* %call21.us to i8*
  tail call void @println_s(i64* %call21.us, i64 0) #9
  %exitcond95.us = icmp eq i64 %add16.us, %1
  br i1 %exitcond95.us, label %blklab6.loopexit, label %while.cond3.preheader.us

blklab8.loopexit.us:                              ; preds = %if.end12.us
  %add16.us = add nuw nsw i64 %i.085.us, 1
  br i1 %_25_dealloc.090.us, label %if.then18.us, label %if.end19.us

while.cond3.preheader:                            ; preds = %while.cond3.preheader.preheader105, %if.end19
  %_25_dealloc.090 = phi i1 [ true, %if.end19 ], [ false, %while.cond3.preheader.preheader105 ]
  %_25.089 = phi i8* [ %7, %if.end19 ], [ undef, %while.cond3.preheader.preheader105 ]
  %i.085 = phi i64 [ %add16, %if.end19 ], [ 0, %while.cond3.preheader.preheader105 ]
  %add16 = add nuw nsw i64 %i.085, 1
  br i1 %_25_dealloc.090, label %if.then18, label %if.end19

if.then18:                                        ; preds = %while.cond3.preheader
  tail call void @free(i8* %_25.089) #9
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %while.cond3.preheader
  %call21 = tail call i64* @create1DArray(i32 0, i32 0) #9
  %7 = bitcast i64* %call21 to i8*
  tail call void @println_s(i64* %call21, i64 0) #9
  %exitcond95 = icmp eq i64 %add16, %1
  br i1 %exitcond95, label %blklab6.loopexit106, label %while.cond3.preheader

blklab6.loopexit:                                 ; preds = %if.end19.us
  %phitmp = bitcast i64* %call13.us to i8*
  br label %blklab6

blklab6.loopexit106:                              ; preds = %if.end19
  br label %blklab6

blklab6:                                          ; preds = %blklab6.loopexit106, %blklab6.loopexit, %entry
  %_25_dealloc.0.lcssa = phi i1 [ false, %entry ], [ true, %blklab6.loopexit ], [ true, %blklab6.loopexit106 ]
  %_25.0.lcssa = phi i8* [ undef, %entry ], [ %6, %blklab6.loopexit ], [ %7, %blklab6.loopexit106 ]
  %_18_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ 1, %blklab6.loopexit ], [ 0, %blklab6.loopexit106 ]
  %_18.0.lcssa = phi i8* [ null, %entry ], [ %phitmp, %blklab6.loopexit ], [ null, %blklab6.loopexit106 ]
  br i1 %a_dealloc, label %if.then23, label %if.end27

if.then23:                                        ; preds = %blklab6
  %8 = bitcast %struct.Matrix* %a to i8**
  %9 = load i8*, i8** %8, align 8, !tbaa !7
  tail call void @free(i8* %9) #9
  %10 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %10) #9
  br label %if.end27

if.end27:                                         ; preds = %blklab6, %if.then23
  %tobool28 = icmp eq i8 %_18_dealloc.0.lcssa, 0
  br i1 %tobool28, label %if.end30, label %if.then29

if.then29:                                        ; preds = %if.end27
  tail call void @free(i8* %_18.0.lcssa) #9
  br label %if.end30

if.end30:                                         ; preds = %if.end27, %if.then29
  br i1 %_25_dealloc.0.lcssa, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end30
  tail call void @free(i8* %_25.0.lcssa) #9
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %if.end30
  ret void
}

declare void @printf_s(i64*, i64) local_unnamed_addr #3

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @mat_mult(%struct.Matrix* nocapture %a, i1 zeroext %a_dealloc, %struct.Matrix* nocapture %b, i1 zeroext %b_dealloc) local_unnamed_addr #4 {
entry:
  %polly.par.userContext403 = alloca { i64, i64, i64*, i64* }, align 8
  %polly.par.userContext = alloca { i64, i64, i64*, i64*, i64* }, align 8
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 2
  %0 = load i64, i64* %width2, align 8, !tbaa !10
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height3, align 8, !tbaa !11
  %mul = mul nsw i64 %1, %0
  %conv4 = trunc i64 %mul to i32
  %call = tail call i64* @create1DArray(i32 0, i32 %conv4) #9
  %data14 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %2 = load i64*, i64** %data14, align 8, !tbaa !7
  %data24 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0
  %3 = load i64*, i64** %data24, align 8, !tbaa !7
  %call36 = tail call i64* @create1DArray(i32 0, i32 %conv4) #9
  %cmp283 = icmp sgt i64 %1, 0
  br i1 %cmp283, label %polly.split_new_and_old353, label %entry.polly.split_new_and_old_crit_edge

entry.polly.split_new_and_old_crit_edge:          ; preds = %entry
  %.pre433 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.pre434 = extractvalue { i64, i1 } %.pre433, 1
  %.pre435 = extractvalue { i64, i1 } %.pre433, 0
  %.pre436 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.pre435, i64 %0)
  %.pre437 = extractvalue { i64, i1 } %.pre436, 1
  %.pre438 = or i1 %.pre434, %.pre437
  %.pre439 = extractvalue { i64, i1 } %.pre436, 0
  %.pre440 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.pre439, i64 %0)
  %.pre441 = extractvalue { i64, i1 } %.pre440, 1
  %.pre442 = extractvalue { i64, i1 } %.pre440, 0
  %.pre443 = or i1 %.pre438, %.pre441
  br label %polly.split_new_and_old

polly.split_new_and_old353:                       ; preds = %entry
  %4 = icmp sge i64 %0, %1
  %5 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.obit357 = extractvalue { i64, i1 } %5, 1
  %.res359 = extractvalue { i64, i1 } %5, 0
  %polly.access.mul.360 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res359, i64 %0)
  %polly.access.mul..obit361 = extractvalue { i64, i1 } %polly.access.mul.360, 1
  %polly.overflow.state362 = or i1 %.obit357, %polly.access.mul..obit361
  %polly.access.mul..res363 = extractvalue { i64, i1 } %polly.access.mul.360, 0
  %polly.access.add.364 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res363, i64 %0)
  %polly.access.add..obit365 = extractvalue { i64, i1 } %polly.access.add.364, 1
  %polly.access.add..res367 = extractvalue { i64, i1 } %polly.access.add.364, 0
  %polly.access.368 = getelementptr i64, i64* %3, i64 %polly.access.add..res367
  %polly.overflow.state375 = or i1 %polly.overflow.state362, %polly.access.add..obit365
  %6 = icmp ule i64* %polly.access.368, %call36
  %7 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 1)
  %.obit378 = extractvalue { i64, i1 } %7, 1
  %polly.overflow.state379 = or i1 %.obit378, %polly.overflow.state375
  %.res380 = extractvalue { i64, i1 } %7, 0
  %polly.access.mul.call36381 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res380, i64 %0)
  %polly.access.mul.call36.obit382 = extractvalue { i64, i1 } %polly.access.mul.call36381, 1
  %polly.overflow.state383 = or i1 %polly.access.mul.call36.obit382, %polly.overflow.state379
  %polly.access.mul.call36.res384 = extractvalue { i64, i1 } %polly.access.mul.call36381, 0
  %polly.access.add.call36385 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call36.res384, i64 %1)
  %polly.access.add.call36.obit386 = extractvalue { i64, i1 } %polly.access.add.call36385, 1
  %polly.access.add.call36.res388 = extractvalue { i64, i1 } %polly.access.add.call36385, 0
  %polly.access.call36389 = getelementptr i64, i64* %call36, i64 %polly.access.add.call36.res388
  %polly.overflow.state396 = or i1 %polly.access.add.call36.obit386, %polly.overflow.state383
  %8 = icmp ule i64* %polly.access.call36389, %3
  %9 = or i1 %8, %6
  %10 = and i1 %4, %9
  %polly.rtc.overflown399 = xor i1 %polly.overflow.state396, true
  %polly.rtc.result400 = and i1 %10, %polly.rtc.overflown399
  br i1 %polly.rtc.result400, label %polly.parallel.for401, label %while.cond45.preheader.preheader

while.cond45.preheader.preheader:                 ; preds = %polly.split_new_and_old353
  %cmp47281 = icmp sgt i64 %0, 0
  br i1 %cmp47281, label %while.cond45.preheader.us.preheader, label %polly.split_new_and_old

while.cond45.preheader.us.preheader:              ; preds = %while.cond45.preheader.preheader
  %11 = add i64 %0, -1
  %min.iters.check = icmp ult i64 %0, 4
  %n.vec = and i64 %0, -4
  br label %while.cond45.preheader.us

while.cond45.preheader.us:                        ; preds = %while.cond45.preheader.us.preheader, %blklab15.loopexit.us
  %i.0284.us = phi i64 [ %add56.us, %blklab15.loopexit.us ], [ 0, %while.cond45.preheader.us.preheader ]
  %mul51.us = mul nsw i64 %i.0284.us, %0
  br i1 %min.iters.check, label %if.end50.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %while.cond45.preheader.us
  br i1 false, label %vector.memcheck, label %if.end50.us.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 undef, label %if.end50.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader
  br i1 undef, label %blklab15.loopexit.us, label %if.end50.us.preheader

if.end50.us.preheader:                            ; preds = %min.iters.checked, %vector.body, %vector.memcheck, %while.cond45.preheader.us
  %j.0282.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %while.cond45.preheader.us ], [ %n.vec, %vector.body ]
  %12 = sub i64 %0, %j.0282.us.ph
  %13 = sub i64 %11, %j.0282.us.ph
  %xtraiter457 = and i64 %12, 3
  %14 = icmp ult i64 %13, 3
  br i1 %14, label %blklab15.loopexit.us.loopexit.unr-lcssa, label %if.end50.us.preheader.new

if.end50.us.preheader.new:                        ; preds = %if.end50.us.preheader
  %unroll_iter459 = sub i64 %12, %xtraiter457
  br label %if.end50.us

if.end50.us:                                      ; preds = %if.end50.us, %if.end50.us.preheader.new
  %j.0282.us = phi i64 [ %j.0282.us.ph, %if.end50.us.preheader.new ], [ %add55.us.3, %if.end50.us ]
  %niter460 = phi i64 [ %unroll_iter459, %if.end50.us.preheader.new ], [ %niter460.nsub.3, %if.end50.us ]
  %add.us = add nsw i64 %j.0282.us, %mul51.us
  %arrayidx.us = getelementptr inbounds i64, i64* %3, i64 %add.us
  %15 = load i64, i64* %arrayidx.us, align 8, !tbaa !8
  %mul52.us = mul nsw i64 %j.0282.us, %0
  %add53.us = add nsw i64 %mul52.us, %i.0284.us
  %arrayidx54.us = getelementptr inbounds i64, i64* %call36, i64 %add53.us
  store i64 %15, i64* %arrayidx54.us, align 8, !tbaa !8
  %add55.us = or i64 %j.0282.us, 1
  %add.us.1 = add nsw i64 %add55.us, %mul51.us
  %arrayidx.us.1 = getelementptr inbounds i64, i64* %3, i64 %add.us.1
  %16 = load i64, i64* %arrayidx.us.1, align 8, !tbaa !8
  %mul52.us.1 = mul nsw i64 %add55.us, %0
  %add53.us.1 = add nsw i64 %mul52.us.1, %i.0284.us
  %arrayidx54.us.1 = getelementptr inbounds i64, i64* %call36, i64 %add53.us.1
  store i64 %16, i64* %arrayidx54.us.1, align 8, !tbaa !8
  %add55.us.1 = or i64 %j.0282.us, 2
  %add.us.2 = add nsw i64 %add55.us.1, %mul51.us
  %arrayidx.us.2 = getelementptr inbounds i64, i64* %3, i64 %add.us.2
  %17 = load i64, i64* %arrayidx.us.2, align 8, !tbaa !8
  %mul52.us.2 = mul nsw i64 %add55.us.1, %0
  %add53.us.2 = add nsw i64 %mul52.us.2, %i.0284.us
  %arrayidx54.us.2 = getelementptr inbounds i64, i64* %call36, i64 %add53.us.2
  store i64 %17, i64* %arrayidx54.us.2, align 8, !tbaa !8
  %add55.us.2 = or i64 %j.0282.us, 3
  %add.us.3 = add nsw i64 %add55.us.2, %mul51.us
  %arrayidx.us.3 = getelementptr inbounds i64, i64* %3, i64 %add.us.3
  %18 = load i64, i64* %arrayidx.us.3, align 8, !tbaa !8
  %mul52.us.3 = mul nsw i64 %add55.us.2, %0
  %add53.us.3 = add nsw i64 %mul52.us.3, %i.0284.us
  %arrayidx54.us.3 = getelementptr inbounds i64, i64* %call36, i64 %add53.us.3
  store i64 %18, i64* %arrayidx54.us.3, align 8, !tbaa !8
  %add55.us.3 = add nsw i64 %j.0282.us, 4
  %niter460.nsub.3 = add i64 %niter460, -4
  %niter460.ncmp.3 = icmp eq i64 %niter460.nsub.3, 0
  br i1 %niter460.ncmp.3, label %blklab15.loopexit.us.loopexit.unr-lcssa.loopexit, label %if.end50.us, !llvm.loop !12

blklab15.loopexit.us.loopexit.unr-lcssa.loopexit: ; preds = %if.end50.us
  br label %blklab15.loopexit.us.loopexit.unr-lcssa

blklab15.loopexit.us.loopexit.unr-lcssa:          ; preds = %blklab15.loopexit.us.loopexit.unr-lcssa.loopexit, %if.end50.us.preheader
  %j.0282.us.unr = phi i64 [ %j.0282.us.ph, %if.end50.us.preheader ], [ %add55.us.3, %blklab15.loopexit.us.loopexit.unr-lcssa.loopexit ]
  %lcmp.mod458 = icmp eq i64 %xtraiter457, 0
  br i1 %lcmp.mod458, label %blklab15.loopexit.us.loopexit, label %if.end50.us.epil.preheader

if.end50.us.epil.preheader:                       ; preds = %blklab15.loopexit.us.loopexit.unr-lcssa
  br label %if.end50.us.epil

if.end50.us.epil:                                 ; preds = %if.end50.us.epil, %if.end50.us.epil.preheader
  %j.0282.us.epil = phi i64 [ %add55.us.epil, %if.end50.us.epil ], [ %j.0282.us.unr, %if.end50.us.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.sub, %if.end50.us.epil ], [ %xtraiter457, %if.end50.us.epil.preheader ]
  %add.us.epil = add nsw i64 %j.0282.us.epil, %mul51.us
  %arrayidx.us.epil = getelementptr inbounds i64, i64* %3, i64 %add.us.epil
  %19 = load i64, i64* %arrayidx.us.epil, align 8, !tbaa !8
  %mul52.us.epil = mul nsw i64 %j.0282.us.epil, %0
  %add53.us.epil = add nsw i64 %mul52.us.epil, %i.0284.us
  %arrayidx54.us.epil = getelementptr inbounds i64, i64* %call36, i64 %add53.us.epil
  store i64 %19, i64* %arrayidx54.us.epil, align 8, !tbaa !8
  %add55.us.epil = add nuw nsw i64 %j.0282.us.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %blklab15.loopexit.us.loopexit.epilog-lcssa, label %if.end50.us.epil, !llvm.loop !15

blklab15.loopexit.us.loopexit.epilog-lcssa:       ; preds = %if.end50.us.epil
  br label %blklab15.loopexit.us.loopexit

blklab15.loopexit.us.loopexit:                    ; preds = %blklab15.loopexit.us.loopexit.unr-lcssa, %blklab15.loopexit.us.loopexit.epilog-lcssa
  br label %blklab15.loopexit.us

blklab15.loopexit.us:                             ; preds = %blklab15.loopexit.us.loopexit, %vector.body
  %add56.us = add nuw nsw i64 %i.0284.us, 1
  %exitcond289.us = icmp eq i64 %add56.us, %1
  br i1 %exitcond289.us, label %polly.split_new_and_old.loopexit, label %while.cond45.preheader.us

polly.split_new_and_old.loopexit:                 ; preds = %blklab15.loopexit.us
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %polly.split_new_and_old.loopexit, %while.cond45.preheader.preheader, %entry.polly.split_new_and_old_crit_edge, %polly.parallel.for401
  %polly.overflow.state293.pre-phi = phi i1 [ %.pre443, %entry.polly.split_new_and_old_crit_edge ], [ %polly.overflow.state375, %polly.parallel.for401 ], [ %polly.overflow.state375, %while.cond45.preheader.preheader ], [ %polly.overflow.state375, %polly.split_new_and_old.loopexit ]
  %polly.access.add.call36.res.pre-phi = phi i64 [ %.pre442, %entry.polly.split_new_and_old_crit_edge ], [ %polly.access.add..res367, %polly.parallel.for401 ], [ %polly.access.add..res367, %while.cond45.preheader.preheader ], [ %polly.access.add..res367, %polly.split_new_and_old.loopexit ]
  %polly.access.call36 = getelementptr i64, i64* %call36, i64 %polly.access.add.call36.res.pre-phi
  %20 = icmp ule i64* %polly.access.call36, %call
  %polly.access.call305 = getelementptr i64, i64* %call, i64 %polly.access.add.call36.res.pre-phi
  %21 = icmp ule i64* %polly.access.call305, %call36
  %22 = or i1 %20, %21
  %polly.access. = getelementptr i64, i64* %2, i64 %polly.access.add.call36.res.pre-phi
  %23 = icmp ule i64* %polly.access., %call
  %24 = icmp ule i64* %polly.access.call305, %2
  %25 = or i1 %23, %24
  %26 = and i1 %22, %25
  %polly.rtc.overflown = xor i1 %polly.overflow.state293.pre-phi, true
  %polly.rtc.result = and i1 %26, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.parallel.for, label %while.cond57.preheader

while.cond57.preheader:                           ; preds = %polly.split_new_and_old
  %cmp65275 = icmp sgt i64 %0, 0
  %or.cond = and i1 %cmp283, %cmp65275
  br i1 %or.cond, label %while.cond63.preheader.us.preheader, label %if.end94

while.cond63.preheader.us.preheader:              ; preds = %while.cond57.preheader
  %xtraiter = and i64 %0, 1
  %27 = icmp eq i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %unroll_iter = sub i64 %0, %xtraiter
  br label %while.cond63.preheader.us

while.cond63.preheader.us:                        ; preds = %while.cond63.preheader.us.preheader, %blklab19.loopexit.us-lcssa.us.us
  %i.1279.us = phi i64 [ %add91.us, %blklab19.loopexit.us-lcssa.us.us ], [ 0, %while.cond63.preheader.us.preheader ]
  %mul75.us = mul nsw i64 %i.1279.us, %0
  br label %while.cond69.preheader.us.us

while.cond69.preheader.us.us:                     ; preds = %while.cond63.preheader.us, %blklab21.loopexit.us.us
  %j.1276.us.us = phi i64 [ %add90.us.us, %blklab21.loopexit.us.us ], [ 0, %while.cond63.preheader.us ]
  %add76.us.us = add nsw i64 %j.1276.us.us, %mul75.us
  %arrayidx77.us.us = getelementptr inbounds i64, i64* %call, i64 %add76.us.us
  %.pre = load i64, i64* %arrayidx77.us.us, align 8, !tbaa !8
  br i1 %27, label %blklab21.loopexit.us.us.unr-lcssa, label %while.cond69.preheader.us.us.new

while.cond69.preheader.us.us.new:                 ; preds = %while.cond69.preheader.us.us
  br label %if.end74.us.us

blklab21.loopexit.us.us.unr-lcssa.loopexit:       ; preds = %if.end74.us.us
  br label %blklab21.loopexit.us.us.unr-lcssa

blklab21.loopexit.us.us.unr-lcssa:                ; preds = %blklab21.loopexit.us.us.unr-lcssa.loopexit, %while.cond69.preheader.us.us
  %.unr = phi i64 [ %.pre, %while.cond69.preheader.us.us ], [ %add85.us.us.1, %blklab21.loopexit.us.us.unr-lcssa.loopexit ]
  %k.0274.us.us.unr = phi i64 [ 0, %while.cond69.preheader.us.us ], [ %add89.us.us.1, %blklab21.loopexit.us.us.unr-lcssa.loopexit ]
  br i1 %lcmp.mod, label %blklab21.loopexit.us.us, label %if.end74.us.us.epil.preheader

if.end74.us.us.epil.preheader:                    ; preds = %blklab21.loopexit.us.us.unr-lcssa
  br label %if.end74.us.us.epil

if.end74.us.us.epil:                              ; preds = %if.end74.us.us.epil.preheader
  %add79.us.us.epil = add nsw i64 %k.0274.us.us.unr, %mul75.us
  %arrayidx80.us.us.epil = getelementptr inbounds i64, i64* %2, i64 %add79.us.us.epil
  %28 = load i64, i64* %arrayidx80.us.us.epil, align 8, !tbaa !8
  %arrayidx83.us.us.epil = getelementptr inbounds i64, i64* %call36, i64 %add79.us.us.epil
  %29 = load i64, i64* %arrayidx83.us.us.epil, align 8, !tbaa !8
  %mul84.us.us.epil = mul nsw i64 %29, %28
  %add85.us.us.epil = add nsw i64 %mul84.us.us.epil, %.unr
  store i64 %add85.us.us.epil, i64* %arrayidx77.us.us, align 8, !tbaa !8
  br label %blklab21.loopexit.us.us.epilog-lcssa

blklab21.loopexit.us.us.epilog-lcssa:             ; preds = %if.end74.us.us.epil
  br label %blklab21.loopexit.us.us

blklab21.loopexit.us.us:                          ; preds = %blklab21.loopexit.us.us.unr-lcssa, %blklab21.loopexit.us.us.epilog-lcssa
  %add90.us.us = add nuw nsw i64 %j.1276.us.us, 1
  %exitcond286.us.us = icmp eq i64 %add90.us.us, %0
  br i1 %exitcond286.us.us, label %blklab19.loopexit.us-lcssa.us.us, label %while.cond69.preheader.us.us

if.end74.us.us:                                   ; preds = %if.end74.us.us, %while.cond69.preheader.us.us.new
  %30 = phi i64 [ %.pre, %while.cond69.preheader.us.us.new ], [ %add85.us.us.1, %if.end74.us.us ]
  %k.0274.us.us = phi i64 [ 0, %while.cond69.preheader.us.us.new ], [ %add89.us.us.1, %if.end74.us.us ]
  %niter = phi i64 [ %unroll_iter, %while.cond69.preheader.us.us.new ], [ %niter.nsub.1, %if.end74.us.us ]
  %add79.us.us = add nsw i64 %k.0274.us.us, %mul75.us
  %arrayidx80.us.us = getelementptr inbounds i64, i64* %2, i64 %add79.us.us
  %31 = load i64, i64* %arrayidx80.us.us, align 8, !tbaa !8
  %arrayidx83.us.us = getelementptr inbounds i64, i64* %call36, i64 %add79.us.us
  %32 = load i64, i64* %arrayidx83.us.us, align 8, !tbaa !8
  %mul84.us.us = mul nsw i64 %32, %31
  %add85.us.us = add nsw i64 %mul84.us.us, %30
  store i64 %add85.us.us, i64* %arrayidx77.us.us, align 8, !tbaa !8
  %add89.us.us = or i64 %k.0274.us.us, 1
  %add79.us.us.1 = add nsw i64 %add89.us.us, %mul75.us
  %arrayidx80.us.us.1 = getelementptr inbounds i64, i64* %2, i64 %add79.us.us.1
  %33 = load i64, i64* %arrayidx80.us.us.1, align 8, !tbaa !8
  %arrayidx83.us.us.1 = getelementptr inbounds i64, i64* %call36, i64 %add79.us.us.1
  %34 = load i64, i64* %arrayidx83.us.us.1, align 8, !tbaa !8
  %mul84.us.us.1 = mul nsw i64 %34, %33
  %add85.us.us.1 = add nsw i64 %mul84.us.us.1, %add85.us.us
  store i64 %add85.us.us.1, i64* %arrayidx77.us.us, align 8, !tbaa !8
  %add89.us.us.1 = add nsw i64 %k.0274.us.us, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %blklab21.loopexit.us.us.unr-lcssa.loopexit, label %if.end74.us.us

blklab19.loopexit.us-lcssa.us.us:                 ; preds = %blklab21.loopexit.us.us
  %add91.us = add nuw nsw i64 %i.1279.us, 1
  %exitcond287.us = icmp eq i64 %add91.us, %1
  br i1 %exitcond287.us, label %if.end94.loopexit, label %while.cond63.preheader.us

if.end94.loopexit:                                ; preds = %blklab19.loopexit.us-lcssa.us.us
  br label %if.end94

if.end94:                                         ; preds = %if.end94.loopexit, %polly.parallel.for, %while.cond57.preheader
  %call.i = tail call noalias i8* @malloc(i64 32) #9
  %35 = bitcast i8* %call.i to %struct.Matrix*
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %36 = bitcast i8* %data_size1.i to i64*
  store i64 %mul, i64* %36, align 8, !tbaa !1
  %data2.i = bitcast i8* %call.i to i64**
  store i64* %call, i64** %data2.i, align 8, !tbaa !7
  %height3.i = getelementptr inbounds i8, i8* %call.i, i64 24
  %37 = bitcast i8* %height3.i to i64*
  store i64 %1, i64* %37, align 8, !tbaa !11
  %width4.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %38 = bitcast i8* %width4.i to i64*
  store i64 %0, i64* %38, align 8, !tbaa !10
  br i1 %a_dealloc, label %if.then100, label %if.end101

if.then100:                                       ; preds = %if.end94
  %39 = bitcast %struct.Matrix* %a to i8**
  %40 = load i8*, i8** %39, align 8, !tbaa !7
  tail call void @free(i8* %40) #9
  %41 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %41) #9
  br label %if.end101

if.end101:                                        ; preds = %if.then100, %if.end94
  br i1 %b_dealloc, label %if.then103, label %if.then118

if.then103:                                       ; preds = %if.end101
  %42 = bitcast %struct.Matrix* %b to i8**
  %43 = load i8*, i8** %42, align 8, !tbaa !7
  tail call void @free(i8* %43) #9
  %44 = bitcast %struct.Matrix* %b to i8*
  tail call void @free(i8* %44) #9
  br label %if.then118

if.then118:                                       ; preds = %if.end101, %if.then103
  %45 = bitcast i64* %call36 to i8*
  tail call void @free(i8* %45) #9
  ret %struct.Matrix* %35

polly.parallel.for:                               ; preds = %polly.split_new_and_old
  %46 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %46, 5
  %47 = bitcast { i64, i64, i64*, i64*, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 40, i8* %47)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %1, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.350 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64 %0, i64* %polly.subfn.storeaddr.350, align 8
  %polly.subfn.storeaddr.call = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %call, i64** %polly.subfn.storeaddr.call, align 8
  %polly.subfn.storeaddr.351 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 3
  store i64* %2, i64** %polly.subfn.storeaddr.351, align 8
  %polly.subfn.storeaddr.call36 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 4
  store i64* %call36, i64** %polly.subfn.storeaddr.call36, align 8
  %48 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn, i8* %47, i32 0, i64 0, i64 %48, i64 1) #9
  call void @mat_mult_polly_subfn(i8* %47) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %47)
  br label %if.end94

polly.parallel.for401:                            ; preds = %polly.split_new_and_old353
  %49 = add nsw i64 %1, -1
  %polly.fdiv_q.shr402 = ashr i64 %49, 5
  %50 = bitcast { i64, i64, i64*, i64* }* %polly.par.userContext403 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %50)
  %polly.subfn.storeaddr.404 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext403, i64 0, i32 0
  store i64 %0, i64* %polly.subfn.storeaddr.404, align 8
  %polly.subfn.storeaddr.405 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext403, i64 0, i32 1
  store i64 %1, i64* %polly.subfn.storeaddr.405, align 8
  %polly.subfn.storeaddr.406 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext403, i64 0, i32 2
  store i64* %3, i64** %polly.subfn.storeaddr.406, align 8
  %polly.subfn.storeaddr.call36407 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext403, i64 0, i32 3
  store i64* %call36, i64** %polly.subfn.storeaddr.call36407, align 8
  %51 = add nsw i64 %polly.fdiv_q.shr402, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn_7, i8* %50, i32 0, i64 0, i64 %51, i64 1) #9
  call void @mat_mult_polly_subfn_7(i8* %50) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %50)
  br label %polly.split_new_and_old
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #5 {
entry:
  %polly.par.userContext.i288 = alloca { i64, i64, i64* }, align 8
  %polly.par.userContext.i = alloca { i64, i64, i64* }, align 8
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #9
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !9
  %call1 = tail call i64* @parseStringToInt(i64* %0) #9
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end165.critedge, label %if.end8

if.end8:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !8
  %call13 = tail call i64* @create1DArray(i32 0, i32 7) #9
  %2 = bitcast i64* %call13 to <2 x i64>*
  store <2 x i64> <i64 115, i64 105>, <2 x i64>* %2, align 8, !tbaa !8
  %arrayidx16 = getelementptr inbounds i64, i64* %call13, i64 2
  %3 = bitcast i64* %arrayidx16 to <2 x i64>*
  store <2 x i64> <i64 122, i64 101>, <2 x i64>* %3, align 8, !tbaa !8
  %arrayidx18 = getelementptr inbounds i64, i64* %call13, i64 4
  %4 = bitcast i64* %arrayidx18 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %4, align 8, !tbaa !8
  %arrayidx20 = getelementptr inbounds i64, i64* %call13, i64 6
  store i64 32, i64* %arrayidx20, align 8, !tbaa !8
  tail call void @printf_s(i64* %call13, i64 7) #9
  %call21 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1)
  %mul.i = mul i64 %1, %1
  %conv1.i = trunc i64 %mul.i to i32
  %call.i = tail call i64* @create1DArray(i32 0, i32 %conv1.i) #9
  %cmp88.i = icmp sgt i64 %1, 0
  br i1 %cmp88.i, label %polly.parallel.for.i, label %init.exit

polly.parallel.for.i:                             ; preds = %if.end8
  %5 = add nsw i64 %1, -1
  %polly.fdiv_q.shr.i = ashr i64 %5, 5
  %6 = bitcast { i64, i64, i64* }* %polly.par.userContext.i to i8*
  call void @llvm.lifetime.start(i64 24, i8* %6) #9
  %polly.subfn.storeaddr.width.i = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i, i64 0, i32 0
  store i64 %1, i64* %polly.subfn.storeaddr.width.i, align 8
  %polly.subfn.storeaddr.height.i = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i, i64 0, i32 1
  store i64 %1, i64* %polly.subfn.storeaddr.height.i, align 8
  %polly.subfn.storeaddr.call.i = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i, i64 0, i32 2
  store i64* %call.i, i64** %polly.subfn.storeaddr.call.i, align 8
  %7 = add nsw i64 %polly.fdiv_q.shr.i, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %6, i32 0, i64 0, i64 %7, i64 1) #9
  call void @init_polly_subfn(i8* %6) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %6) #9
  br label %init.exit

init.exit:                                        ; preds = %if.end8, %polly.parallel.for.i
  %call.i.i = tail call noalias i8* @malloc(i64 32) #9
  %8 = bitcast i8* %call.i.i to %struct.Matrix*
  %data_size1.i.i = getelementptr inbounds i8, i8* %call.i.i, i64 8
  %9 = bitcast i8* %data_size1.i.i to i64*
  store i64 %mul.i, i64* %9, align 8, !tbaa !1
  %data2.i.i = bitcast i8* %call.i.i to i64**
  store i64* %call.i, i64** %data2.i.i, align 8, !tbaa !7
  %height3.i.i = getelementptr inbounds i8, i8* %call.i.i, i64 24
  %10 = bitcast i8* %height3.i.i to i64*
  store i64 %1, i64* %10, align 8, !tbaa !11
  %width4.i.i = getelementptr inbounds i8, i8* %call.i.i, i64 16
  %11 = bitcast i8* %width4.i.i to i64*
  store i64 %1, i64* %11, align 8, !tbaa !10
  %call.i291 = tail call i64* @create1DArray(i32 0, i32 %conv1.i) #9
  br i1 %cmp88.i, label %polly.parallel.for.i302, label %if.then134

polly.parallel.for.i302:                          ; preds = %init.exit
  %12 = add nsw i64 %1, -1
  %polly.fdiv_q.shr.i298 = ashr i64 %12, 5
  %13 = bitcast { i64, i64, i64* }* %polly.par.userContext.i288 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %13) #9
  %polly.subfn.storeaddr.width.i299 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i288, i64 0, i32 0
  store i64 %1, i64* %polly.subfn.storeaddr.width.i299, align 8
  %polly.subfn.storeaddr.height.i300 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i288, i64 0, i32 1
  store i64 %1, i64* %polly.subfn.storeaddr.height.i300, align 8
  %polly.subfn.storeaddr.call.i301 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i288, i64 0, i32 2
  store i64* %call.i291, i64** %polly.subfn.storeaddr.call.i301, align 8
  %14 = add nsw i64 %polly.fdiv_q.shr.i298, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %13, i32 0, i64 0, i64 %14, i64 1) #9
  call void @init_polly_subfn(i8* %13) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %13) #9
  br label %if.then134

if.then134:                                       ; preds = %polly.parallel.for.i302, %init.exit
  %call.i.i293 = tail call noalias i8* @malloc(i64 32) #9
  %15 = bitcast i8* %call.i.i293 to %struct.Matrix*
  %data_size1.i.i294 = getelementptr inbounds i8, i8* %call.i.i293, i64 8
  %16 = bitcast i8* %data_size1.i.i294 to i64*
  store i64 %mul.i, i64* %16, align 8, !tbaa !1
  %data2.i.i295 = bitcast i8* %call.i.i293 to i64**
  store i64* %call.i291, i64** %data2.i.i295, align 8, !tbaa !7
  %height3.i.i296 = getelementptr inbounds i8, i8* %call.i.i293, i64 24
  %17 = bitcast i8* %height3.i.i296 to i64*
  store i64 %1, i64* %17, align 8, !tbaa !11
  %width4.i.i297 = getelementptr inbounds i8, i8* %call.i.i293, i64 16
  %18 = bitcast i8* %width4.i.i297 to i64*
  store i64 %1, i64* %18, align 8, !tbaa !10
  %call45 = tail call %struct.Matrix* @mat_mult(%struct.Matrix* %8, i1 zeroext true, %struct.Matrix* %15, i1 zeroext true)
  %call59 = tail call i64* @create1DArray(i32 0, i32 27) #9
  %19 = bitcast i64* %call59 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %19, align 8, !tbaa !8
  %arrayidx62 = getelementptr inbounds i64, i64* %call59, i64 2
  %20 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %20, align 8, !tbaa !8
  %arrayidx64 = getelementptr inbounds i64, i64* %call59, i64 4
  %21 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %21, align 8, !tbaa !8
  %arrayidx66 = getelementptr inbounds i64, i64* %call59, i64 6
  %22 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %22, align 8, !tbaa !8
  %arrayidx68 = getelementptr inbounds i64, i64* %call59, i64 8
  %23 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %23, align 8, !tbaa !8
  %arrayidx70 = getelementptr inbounds i64, i64* %call59, i64 10
  %24 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %24, align 8, !tbaa !8
  %arrayidx72 = getelementptr inbounds i64, i64* %call59, i64 12
  %25 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %25, align 8, !tbaa !8
  %arrayidx74 = getelementptr inbounds i64, i64* %call59, i64 14
  %26 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %26, align 8, !tbaa !8
  %arrayidx76 = getelementptr inbounds i64, i64* %call59, i64 16
  %27 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %27, align 8, !tbaa !8
  %arrayidx78 = getelementptr inbounds i64, i64* %call59, i64 18
  %28 = bitcast i64* %arrayidx78 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %28, align 8, !tbaa !8
  %arrayidx80 = getelementptr inbounds i64, i64* %call59, i64 20
  %29 = bitcast i64* %arrayidx80 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %29, align 8, !tbaa !8
  %arrayidx82 = getelementptr inbounds i64, i64* %call59, i64 22
  %30 = bitcast i64* %arrayidx82 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %30, align 8, !tbaa !8
  %arrayidx84 = getelementptr inbounds i64, i64* %call59, i64 24
  %31 = bitcast i64* %arrayidx84 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %31, align 8, !tbaa !8
  %arrayidx86 = getelementptr inbounds i64, i64* %call59, i64 26
  store i64 32, i64* %arrayidx86, align 8, !tbaa !8
  tail call void @printf_s(i64* %call59, i64 27) #9
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call45, i64 0, i32 0
  %32 = load i64*, i64** %data, align 8, !tbaa !7
  %sub91 = add nsw i64 %mul.i, -1
  %arrayidx92 = getelementptr inbounds i64, i64* %32, i64 %sub91
  %33 = load i64, i64* %arrayidx92, align 8, !tbaa !8
  %call93 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %33)
  %call98 = tail call i64* @create1DArray(i32 0, i32 25) #9
  %34 = bitcast i64* %call98 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %34, align 8, !tbaa !8
  %arrayidx101 = getelementptr inbounds i64, i64* %call98, i64 2
  %35 = bitcast i64* %arrayidx101 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %35, align 8, !tbaa !8
  %arrayidx103 = getelementptr inbounds i64, i64* %call98, i64 4
  %36 = bitcast i64* %arrayidx103 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %36, align 8, !tbaa !8
  %arrayidx105 = getelementptr inbounds i64, i64* %call98, i64 6
  %37 = bitcast i64* %arrayidx105 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %37, align 8, !tbaa !8
  %arrayidx107 = getelementptr inbounds i64, i64* %call98, i64 8
  %38 = bitcast i64* %arrayidx107 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %38, align 8, !tbaa !8
  %arrayidx109 = getelementptr inbounds i64, i64* %call98, i64 10
  %39 = bitcast i64* %arrayidx109 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %39, align 8, !tbaa !8
  %arrayidx111 = getelementptr inbounds i64, i64* %call98, i64 12
  %40 = bitcast i64* %arrayidx111 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %40, align 8, !tbaa !8
  %arrayidx113 = getelementptr inbounds i64, i64* %call98, i64 14
  %41 = bitcast i64* %arrayidx113 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %41, align 8, !tbaa !8
  %arrayidx115 = getelementptr inbounds i64, i64* %call98, i64 16
  %42 = bitcast i64* %arrayidx115 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %42, align 8, !tbaa !8
  %arrayidx117 = getelementptr inbounds i64, i64* %call98, i64 18
  %43 = bitcast i64* %arrayidx117 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %43, align 8, !tbaa !8
  %arrayidx119 = getelementptr inbounds i64, i64* %call98, i64 20
  %44 = bitcast i64* %arrayidx119 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %44, align 8, !tbaa !8
  %arrayidx121 = getelementptr inbounds i64, i64* %call98, i64 22
  %45 = bitcast i64* %arrayidx121 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %45, align 8, !tbaa !8
  %arrayidx123 = getelementptr inbounds i64, i64* %call98, i64 24
  store i64 101, i64* %arrayidx123, align 8, !tbaa !8
  tail call void @println_s(i64* %call98, i64 25) #9
  %phitmp = bitcast i64* %call98 to i8*
  %phitmp285 = bitcast i64* %call59 to i8*
  %phitmp286 = bitcast i64* %call13 to i8*
  %46 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %46) #9
  %47 = bitcast i64* %32 to i8*
  tail call void @free(i8* %47) #9
  %48 = bitcast %struct.Matrix* %call45 to i8*
  tail call void @free(i8* %48) #9
  tail call void @free2DArray(i64** %call, i64 %conv) #9
  tail call void @free(i8* %phitmp286) #9
  tail call void @free(i8* %phitmp285) #9
  tail call void @free(i8* %phitmp) #9
  br label %if.end165

if.end165.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #9
  br label %if.end165

if.end165:                                        ; preds = %if.end165.critedge, %if.then134
  tail call void @exit(i32 0) #10
  unreachable
}

declare void @free2DArray(i64**, i64) local_unnamed_addr #3

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #6

declare i32 @putchar(i32) local_unnamed_addr

define internal void @init_polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
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
  %16 = icmp sgt i64 %15, 31
  %17 = select i1 %16, i64 31, i64 %15
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
  %20 = icmp sgt i64 %19, 7
  %21 = select i1 %20, i64 7, i64 %19
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
  %29 = insertelement <2 x i64> %28, i64 %25, i32 1
  %30 = insertelement <2 x i64> undef, i64 %25, i32 0
  %31 = insertelement <2 x i64> %30, i64 %25, i32 1
  br label %polly.loop_header19.us

polly.loop_header19.us:                           ; preds = %polly.loop_header10.us, %polly.loop_header19.us
  %polly.indvar23.us = phi i64 [ %polly.indvar_next24.us, %polly.loop_header19.us ], [ 0, %polly.loop_header10.us ]
  %32 = shl i64 %polly.indvar23.us, 2
  %33 = add i64 %27, %32
  %scevgep.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %33
  %34 = bitcast i64* %scevgep.us to <2 x i64>*
  %35 = load <2 x i64>, <2 x i64>* %34, align 8, !alias.scope !17, !noalias !19
  %36 = add nsw <2 x i64> %35, %29
  %37 = bitcast i64* %scevgep.us to <2 x i64>*
  store <2 x i64> %36, <2 x i64>* %37, align 8, !alias.scope !17, !noalias !19
  %38 = add i64 %33, 2
  %scevgep.us.2 = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %38
  %39 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  %40 = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !17, !noalias !19
  %41 = add nsw <2 x i64> %40, %31
  %42 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %42, align 8, !alias.scope !17, !noalias !19
  %polly.indvar_next24.us = add nuw nsw i64 %polly.indvar23.us, 1
  %polly.loop_cond26.us = icmp sgt i64 %polly.indvar23.us, %polly.adjust_ub25
  br i1 %polly.loop_cond26.us, label %polly.cond.loopexit.us, label %polly.loop_header19.us

polly.loop_header34.us:                           ; preds = %polly.loop_header34.preheader.us, %polly.loop_header34.us
  %polly.indvar38.us = phi i64 [ %polly.indvar_next39.us, %polly.loop_header34.us ], [ 0, %polly.loop_header34.preheader.us ]
  %43 = add i64 %44, %polly.indvar38.us
  %scevgep44.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %43
  %_p_scalar_45.us = load i64, i64* %scevgep44.us, align 8, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !20
  %p_add1646.us = add nsw i64 %_p_scalar_45.us, %25
  store i64 %p_add1646.us, i64* %scevgep44.us, align 8, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !20
  %polly.indvar_next39.us = add nuw nsw i64 %polly.indvar38.us, 1
  %exitcond48.us = icmp eq i64 %polly.indvar_next39.us, %7
  br i1 %exitcond48.us, label %polly.merge.us.loopexit, label %polly.loop_header34.us, !llvm.loop !21

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
  br i1 %or.cond, label %polly.loop_exit12, label %polly.loop_header10.preheader116

polly.loop_header10.preheader116:                 ; preds = %polly.loop_header10.preheader.split
  br label %polly.loop_header10

polly.loop_exit12.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit12

polly.loop_exit12.loopexit117:                    ; preds = %polly.merge
  br label %polly.loop_exit12

polly.loop_exit12:                                ; preds = %polly.loop_exit12.loopexit117, %polly.loop_exit12.loopexit, %polly.loop_header10.preheader.split, %polly.loop_header2
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond49 = icmp eq i64 %polly.indvar5, %polly.fdiv_q.shr
  br i1 %exitcond49, label %polly.loop_exit4.loopexit, label %polly.loop_header2

polly.loop_header10:                              ; preds = %polly.loop_header10.preheader116, %polly.merge
  %polly.indvar14 = phi i64 [ %polly.indvar_next15, %polly.merge ], [ 0, %polly.loop_header10.preheader116 ]
  %45 = add nsw i64 %polly.indvar14, %13
  %46 = mul i64 %45, %polly.subfunc.arg.width
  %47 = add i64 %46, %10
  br label %polly.loop_header34

polly.merge:                                      ; preds = %polly.loop_header34
  %polly.indvar_next15 = add nuw nsw i64 %polly.indvar14, 1
  %polly.loop_cond17 = icmp sgt i64 %polly.indvar14, %polly.adjust_ub16
  br i1 %polly.loop_cond17, label %polly.loop_exit12.loopexit117, label %polly.loop_header10

polly.loop_header34:                              ; preds = %polly.loop_header10, %polly.loop_header34
  %polly.indvar38 = phi i64 [ %polly.indvar_next39, %polly.loop_header34 ], [ 0, %polly.loop_header10 ]
  %48 = add i64 %47, %polly.indvar38
  %scevgep44 = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %48
  %_p_scalar_45 = load i64, i64* %scevgep44, align 8, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !20
  %p_add1646 = add nsw i64 %_p_scalar_45, %45
  store i64 %p_add1646, i64* %scevgep44, align 8, !alias.scope !17, !noalias !19, !llvm.mem.parallel_loop_access !20
  %polly.indvar_next39 = add nuw nsw i64 %polly.indvar38, 1
  %exitcond48 = icmp eq i64 %polly.indvar_next39, %7
  br i1 %exitcond48, label %polly.merge, label %polly.loop_header34, !llvm.loop !23
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

define internal void @mat_mult_polly_subfn(i8* nocapture readonly %polly.par.userContext) #7 {
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
  %polly.subfunc.arg.call36 = load i64*, i64** %8, align 8
  %9 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %polly.par.exit, label %polly.par.loadIVBounds.lr.ph

polly.par.loadIVBounds.lr.ph:                     ; preds = %polly.par.setup
  %11 = and i64 %polly.subfunc.arg.2, 3
  %12 = add i64 %polly.subfunc.arg.2, -1
  %13 = lshr i64 %12, 5
  %polly.fdiv_q.shr = ashr i64 %12, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %pexp.p_div_q36 = lshr i64 %polly.subfunc.arg.2, 2
  %14 = add nsw i64 %pexp.p_div_q36, -1
  %polly.loop_guard60 = icmp eq i64 %11, 0
  %15 = and i64 %polly.subfunc.arg.2, -4
  %16 = add nsw i64 %11, -1
  %xtraiter138 = and i64 %polly.subfunc.arg.2, 3
  %17 = icmp ult i64 %16, 3
  %lcmp.mod140 = icmp eq i64 %xtraiter138, 0
  %unroll_iter142 = sub nsw i64 %11, %xtraiter138
  %xtraiter = and i64 %polly.subfunc.arg.2, 3
  %18 = icmp ult i64 %16, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %unroll_iter = sub nsw i64 %11, %xtraiter
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit6
  %19 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.lr.ph, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit6, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit6 ]
  br i1 %polly.loop_guard, label %polly.loop_header4.preheader, label %polly.loop_exit6

polly.loop_header4.preheader:                     ; preds = %polly.loop_header
  %21 = shl nsw i64 %polly.indvar, 5
  %22 = sub nsw i64 %polly.subfunc.arg., %21
  %23 = add nsw i64 %22, -1
  %24 = icmp sgt i64 %23, 31
  %25 = select i1 %24, i64 31, i64 %23
  %polly.loop_guard22 = icmp sgt i64 %25, -1
  %polly.adjust_ub25 = add i64 %25, -1
  br label %polly.loop_header4

polly.loop_exit6.loopexit:                        ; preds = %polly.loop_exit13
  br label %polly.loop_exit6

polly.loop_exit6:                                 ; preds = %polly.loop_exit6.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header4:                               ; preds = %polly.loop_header4.preheader, %polly.loop_exit13
  %polly.indvar7 = phi i64 [ %polly.indvar_next8, %polly.loop_exit13 ], [ 0, %polly.loop_header4.preheader ]
  %26 = shl i64 %polly.indvar7, 5
  %27 = sub nsw i64 %polly.subfunc.arg.2, %26
  %28 = add nsw i64 %27, -1
  %29 = icmp sgt i64 %28, 31
  %30 = select i1 %29, i64 31, i64 %28
  %polly.loop_guard31 = icmp sgt i64 %30, -1
  %polly.adjust_ub34 = add i64 %30, -1
  br label %polly.loop_header11

polly.loop_exit13:                                ; preds = %polly.loop_exit21
  %polly.indvar_next8 = add nuw nsw i64 %polly.indvar7, 1
  %exitcond78 = icmp eq i64 %polly.indvar7, %polly.fdiv_q.shr
  br i1 %exitcond78, label %polly.loop_exit6.loopexit, label %polly.loop_header4

polly.loop_header11:                              ; preds = %polly.loop_exit21, %polly.loop_header4
  %polly.indvar14 = phi i64 [ 0, %polly.loop_header4 ], [ %polly.indvar_next15, %polly.loop_exit21 ]
  br i1 %polly.loop_guard22, label %polly.loop_header19.preheader, label %polly.loop_exit21

polly.loop_header19.preheader:                    ; preds = %polly.loop_header11
  %31 = mul nsw i64 %polly.indvar14, -8
  %32 = add nsw i64 %14, %31
  %33 = icmp sgt i64 %32, 7
  %34 = select i1 %33, i64 7, i64 %32
  %polly.loop_guard41 = icmp sgt i64 %34, -1
  %35 = shl i64 %polly.indvar14, 5
  %36 = or i64 %35, 31
  %37 = icmp slt i64 %36, %polly.subfunc.arg.2
  %or.cond = or i1 %polly.loop_guard60, %37
  %polly.adjust_ub44 = add i64 %34, -1
  br label %polly.loop_header19

polly.loop_exit21.loopexit:                       ; preds = %polly.loop_exit30
  br label %polly.loop_exit21

polly.loop_exit21:                                ; preds = %polly.loop_exit21.loopexit, %polly.loop_header11
  %polly.indvar_next15 = add nuw nsw i64 %polly.indvar14, 1
  %exitcond77 = icmp eq i64 %polly.indvar14, %13
  br i1 %exitcond77, label %polly.loop_exit13, label %polly.loop_header11

polly.loop_header19:                              ; preds = %polly.loop_header19.preheader, %polly.loop_exit30
  %polly.indvar23 = phi i64 [ %polly.indvar_next24, %polly.loop_exit30 ], [ 0, %polly.loop_header19.preheader ]
  br i1 %polly.loop_guard31, label %polly.loop_header28.preheader, label %polly.loop_exit30

polly.loop_header28.preheader:                    ; preds = %polly.loop_header19
  %38 = add nsw i64 %polly.indvar23, %21
  %39 = mul i64 %38, %polly.subfunc.arg.2
  %40 = add i64 %39, %26
  %41 = add i64 %39, %15
  %42 = add i64 %39, %35
  br i1 %polly.loop_guard41, label %polly.loop_header28.us.preheader, label %polly.loop_header28.preheader.split

polly.loop_header28.us.preheader:                 ; preds = %polly.loop_header28.preheader
  br label %polly.loop_header28.us

polly.loop_header28.us:                           ; preds = %polly.loop_header28.us.preheader, %polly.merge.us
  %polly.indvar32.us = phi i64 [ %polly.indvar_next33.us, %polly.merge.us ], [ 0, %polly.loop_header28.us.preheader ]
  %43 = add i64 %40, %polly.indvar32.us
  %scevgep.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %43
  %scevgep.promoted80.us = load i64, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.loop_header38.us

polly.loop_header38.us:                           ; preds = %polly.loop_header28.us, %polly.loop_header38.us
  %p_add85.lcssa81.us = phi i64 [ %p_add85.us.3, %polly.loop_header38.us ], [ %scevgep.promoted80.us, %polly.loop_header28.us ]
  %polly.indvar42.us = phi i64 [ %polly.indvar_next43.us, %polly.loop_header38.us ], [ 0, %polly.loop_header28.us ]
  %44 = shl i64 %polly.indvar42.us, 2
  %45 = add i64 %42, %44
  %scevgep52.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %45
  %_p_scalar_53.us = load i64, i64* %scevgep52.us, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %scevgep54.us = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %45
  %_p_scalar_55.us = load i64, i64* %scevgep54.us, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !30
  %p_mul84.us = mul nsw i64 %_p_scalar_55.us, %_p_scalar_53.us
  %p_add85.us = add nsw i64 %p_mul84.us, %p_add85.lcssa81.us
  %46 = add i64 %45, 1
  %scevgep52.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %46
  %_p_scalar_53.us.1 = load i64, i64* %scevgep52.us.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %scevgep54.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %46
  %_p_scalar_55.us.1 = load i64, i64* %scevgep54.us.1, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !30
  %p_mul84.us.1 = mul nsw i64 %_p_scalar_55.us.1, %_p_scalar_53.us.1
  %p_add85.us.1 = add nsw i64 %p_mul84.us.1, %p_add85.us
  %47 = add i64 %45, 2
  %scevgep52.us.2 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %47
  %_p_scalar_53.us.2 = load i64, i64* %scevgep52.us.2, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %scevgep54.us.2 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %47
  %_p_scalar_55.us.2 = load i64, i64* %scevgep54.us.2, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !30
  %p_mul84.us.2 = mul nsw i64 %_p_scalar_55.us.2, %_p_scalar_53.us.2
  %p_add85.us.2 = add nsw i64 %p_mul84.us.2, %p_add85.us.1
  %48 = add i64 %45, 3
  %scevgep52.us.3 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %48
  %_p_scalar_53.us.3 = load i64, i64* %scevgep52.us.3, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %scevgep54.us.3 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %48
  %_p_scalar_55.us.3 = load i64, i64* %scevgep54.us.3, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !30
  %p_mul84.us.3 = mul nsw i64 %_p_scalar_55.us.3, %_p_scalar_53.us.3
  %p_add85.us.3 = add nsw i64 %p_mul84.us.3, %p_add85.us.2
  %polly.indvar_next43.us = add nuw nsw i64 %polly.indvar42.us, 1
  %polly.loop_cond45.us = icmp sgt i64 %polly.indvar42.us, %polly.adjust_ub44
  br i1 %polly.loop_cond45.us, label %polly.cond.loopexit.us, label %polly.loop_header38.us

polly.loop_header57.us:                           ; preds = %polly.loop_header57.us, %polly.loop_header57.us.preheader.new
  %p_add857482.us = phi i64 [ %p_add85.us.3, %polly.loop_header57.us.preheader.new ], [ %p_add8574.us.3, %polly.loop_header57.us ]
  %polly.indvar61.us = phi i64 [ 0, %polly.loop_header57.us.preheader.new ], [ %polly.indvar_next62.us.3, %polly.loop_header57.us ]
  %niter143 = phi i64 [ %unroll_iter142, %polly.loop_header57.us.preheader.new ], [ %niter143.nsub.3, %polly.loop_header57.us ]
  %49 = add i64 %41, %polly.indvar61.us
  %scevgep69.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %49
  %_p_scalar_70.us = load i64, i64* %scevgep69.us, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.us = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %49
  %_p_scalar_72.us = load i64, i64* %scevgep71.us, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul8473.us = mul nsw i64 %_p_scalar_72.us, %_p_scalar_70.us
  %p_add8574.us = add nsw i64 %p_mul8473.us, %p_add857482.us
  %polly.indvar_next62.us = or i64 %polly.indvar61.us, 1
  %50 = add i64 %41, %polly.indvar_next62.us
  %scevgep69.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %50
  %_p_scalar_70.us.1 = load i64, i64* %scevgep69.us.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %50
  %_p_scalar_72.us.1 = load i64, i64* %scevgep71.us.1, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul8473.us.1 = mul nsw i64 %_p_scalar_72.us.1, %_p_scalar_70.us.1
  %p_add8574.us.1 = add nsw i64 %p_mul8473.us.1, %p_add8574.us
  %polly.indvar_next62.us.1 = or i64 %polly.indvar61.us, 2
  %51 = add i64 %41, %polly.indvar_next62.us.1
  %scevgep69.us.2 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %51
  %_p_scalar_70.us.2 = load i64, i64* %scevgep69.us.2, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.us.2 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %51
  %_p_scalar_72.us.2 = load i64, i64* %scevgep71.us.2, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul8473.us.2 = mul nsw i64 %_p_scalar_72.us.2, %_p_scalar_70.us.2
  %p_add8574.us.2 = add nsw i64 %p_mul8473.us.2, %p_add8574.us.1
  %polly.indvar_next62.us.2 = or i64 %polly.indvar61.us, 3
  %52 = add i64 %41, %polly.indvar_next62.us.2
  %scevgep69.us.3 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %52
  %_p_scalar_70.us.3 = load i64, i64* %scevgep69.us.3, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.us.3 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %52
  %_p_scalar_72.us.3 = load i64, i64* %scevgep71.us.3, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul8473.us.3 = mul nsw i64 %_p_scalar_72.us.3, %_p_scalar_70.us.3
  %p_add8574.us.3 = add nsw i64 %p_mul8473.us.3, %p_add8574.us.2
  %polly.indvar_next62.us.3 = add nsw i64 %polly.indvar61.us, 4
  %niter143.nsub.3 = add i64 %niter143, -4
  %niter143.ncmp.3 = icmp eq i64 %niter143.nsub.3, 0
  br i1 %niter143.ncmp.3, label %polly.merge.loopexit.us.unr-lcssa.loopexit, label %polly.loop_header57.us, !llvm.loop !32

polly.merge.us:                                   ; preds = %polly.merge.loopexit.us, %polly.cond.loopexit.us
  %polly.indvar_next33.us = add nuw nsw i64 %polly.indvar32.us, 1
  %polly.loop_cond35.us = icmp sgt i64 %polly.indvar32.us, %polly.adjust_ub34
  br i1 %polly.loop_cond35.us, label %polly.loop_exit30.loopexit, label %polly.loop_header28.us

polly.merge.loopexit.us.unr-lcssa.loopexit:       ; preds = %polly.loop_header57.us
  br label %polly.merge.loopexit.us.unr-lcssa

polly.merge.loopexit.us.unr-lcssa:                ; preds = %polly.merge.loopexit.us.unr-lcssa.loopexit, %polly.loop_header57.us.preheader
  %p_add8574.us.lcssa.ph = phi i64 [ undef, %polly.loop_header57.us.preheader ], [ %p_add8574.us.3, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  %p_add857482.us.unr = phi i64 [ %p_add85.us.3, %polly.loop_header57.us.preheader ], [ %p_add8574.us.3, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  %polly.indvar61.us.unr = phi i64 [ 0, %polly.loop_header57.us.preheader ], [ %polly.indvar_next62.us.3, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  br i1 %lcmp.mod140, label %polly.merge.loopexit.us, label %polly.loop_header57.us.epil.preheader

polly.loop_header57.us.epil.preheader:            ; preds = %polly.merge.loopexit.us.unr-lcssa
  br label %polly.loop_header57.us.epil

polly.loop_header57.us.epil:                      ; preds = %polly.loop_header57.us.epil, %polly.loop_header57.us.epil.preheader
  %p_add857482.us.epil = phi i64 [ %p_add8574.us.epil, %polly.loop_header57.us.epil ], [ %p_add857482.us.unr, %polly.loop_header57.us.epil.preheader ]
  %polly.indvar61.us.epil = phi i64 [ %polly.indvar_next62.us.epil, %polly.loop_header57.us.epil ], [ %polly.indvar61.us.unr, %polly.loop_header57.us.epil.preheader ]
  %epil.iter139 = phi i64 [ %epil.iter139.sub, %polly.loop_header57.us.epil ], [ %xtraiter138, %polly.loop_header57.us.epil.preheader ]
  %53 = add i64 %41, %polly.indvar61.us.epil
  %scevgep69.us.epil = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %53
  %_p_scalar_70.us.epil = load i64, i64* %scevgep69.us.epil, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.us.epil = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %53
  %_p_scalar_72.us.epil = load i64, i64* %scevgep71.us.epil, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul8473.us.epil = mul nsw i64 %_p_scalar_72.us.epil, %_p_scalar_70.us.epil
  %p_add8574.us.epil = add nsw i64 %p_mul8473.us.epil, %p_add857482.us.epil
  %polly.indvar_next62.us.epil = add nuw nsw i64 %polly.indvar61.us.epil, 1
  %epil.iter139.sub = add i64 %epil.iter139, -1
  %epil.iter139.cmp = icmp eq i64 %epil.iter139.sub, 0
  br i1 %epil.iter139.cmp, label %polly.merge.loopexit.us.epilog-lcssa, label %polly.loop_header57.us.epil, !llvm.loop !33

polly.merge.loopexit.us.epilog-lcssa:             ; preds = %polly.loop_header57.us.epil
  br label %polly.merge.loopexit.us

polly.merge.loopexit.us:                          ; preds = %polly.merge.loopexit.us.unr-lcssa, %polly.merge.loopexit.us.epilog-lcssa
  %p_add8574.us.lcssa = phi i64 [ %p_add8574.us.lcssa.ph, %polly.merge.loopexit.us.unr-lcssa ], [ %p_add8574.us.epil, %polly.merge.loopexit.us.epilog-lcssa ]
  store i64 %p_add8574.us.lcssa, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header38.us
  store i64 %p_add85.us.3, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br i1 %or.cond, label %polly.merge.us, label %polly.loop_header57.us.preheader

polly.loop_header57.us.preheader:                 ; preds = %polly.cond.loopexit.us
  br i1 %17, label %polly.merge.loopexit.us.unr-lcssa, label %polly.loop_header57.us.preheader.new

polly.loop_header57.us.preheader.new:             ; preds = %polly.loop_header57.us.preheader
  br label %polly.loop_header57.us

polly.loop_header28.preheader.split:              ; preds = %polly.loop_header28.preheader
  br i1 %or.cond, label %polly.loop_exit30, label %polly.loop_header28.preheader135

polly.loop_header28.preheader135:                 ; preds = %polly.loop_header28.preheader.split
  br label %polly.loop_header28

polly.loop_exit30.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit30

polly.loop_exit30.loopexit136:                    ; preds = %polly.merge.loopexit
  br label %polly.loop_exit30

polly.loop_exit30:                                ; preds = %polly.loop_exit30.loopexit136, %polly.loop_exit30.loopexit, %polly.loop_header28.preheader.split, %polly.loop_header19
  %polly.indvar_next24 = add nuw nsw i64 %polly.indvar23, 1
  %polly.loop_cond26 = icmp sgt i64 %polly.indvar23, %polly.adjust_ub25
  br i1 %polly.loop_cond26, label %polly.loop_exit21.loopexit, label %polly.loop_header19

polly.loop_header28:                              ; preds = %polly.loop_header28.preheader135, %polly.merge.loopexit
  %polly.indvar32 = phi i64 [ %polly.indvar_next33, %polly.merge.loopexit ], [ 0, %polly.loop_header28.preheader135 ]
  %54 = add i64 %40, %polly.indvar32
  %scevgep67 = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %54
  %scevgep67.promoted = load i64, i64* %scevgep67, align 8, !alias.scope !24, !noalias !26
  br i1 %18, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header28.new

polly.loop_header28.new:                          ; preds = %polly.loop_header28
  br label %polly.loop_header57

polly.merge.loopexit.unr-lcssa.loopexit:          ; preds = %polly.loop_header57
  br label %polly.merge.loopexit.unr-lcssa

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.merge.loopexit.unr-lcssa.loopexit, %polly.loop_header28
  %p_add8574.lcssa.ph = phi i64 [ undef, %polly.loop_header28 ], [ %p_add8574.3, %polly.merge.loopexit.unr-lcssa.loopexit ]
  %p_add857482.unr = phi i64 [ %scevgep67.promoted, %polly.loop_header28 ], [ %p_add8574.3, %polly.merge.loopexit.unr-lcssa.loopexit ]
  %polly.indvar61.unr = phi i64 [ 0, %polly.loop_header28 ], [ %polly.indvar_next62.3, %polly.merge.loopexit.unr-lcssa.loopexit ]
  br i1 %lcmp.mod, label %polly.merge.loopexit, label %polly.loop_header57.epil.preheader

polly.loop_header57.epil.preheader:               ; preds = %polly.merge.loopexit.unr-lcssa
  br label %polly.loop_header57.epil

polly.loop_header57.epil:                         ; preds = %polly.loop_header57.epil, %polly.loop_header57.epil.preheader
  %p_add857482.epil = phi i64 [ %p_add8574.epil, %polly.loop_header57.epil ], [ %p_add857482.unr, %polly.loop_header57.epil.preheader ]
  %polly.indvar61.epil = phi i64 [ %polly.indvar_next62.epil, %polly.loop_header57.epil ], [ %polly.indvar61.unr, %polly.loop_header57.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.sub, %polly.loop_header57.epil ], [ %xtraiter, %polly.loop_header57.epil.preheader ]
  %55 = add i64 %41, %polly.indvar61.epil
  %scevgep69.epil = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %55
  %_p_scalar_70.epil = load i64, i64* %scevgep69.epil, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.epil = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %55
  %_p_scalar_72.epil = load i64, i64* %scevgep71.epil, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul8473.epil = mul nsw i64 %_p_scalar_72.epil, %_p_scalar_70.epil
  %p_add8574.epil = add nsw i64 %p_mul8473.epil, %p_add857482.epil
  %polly.indvar_next62.epil = add nuw nsw i64 %polly.indvar61.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %polly.merge.loopexit.epilog-lcssa, label %polly.loop_header57.epil, !llvm.loop !34

polly.merge.loopexit.epilog-lcssa:                ; preds = %polly.loop_header57.epil
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.merge.loopexit.unr-lcssa, %polly.merge.loopexit.epilog-lcssa
  %p_add8574.lcssa = phi i64 [ %p_add8574.lcssa.ph, %polly.merge.loopexit.unr-lcssa ], [ %p_add8574.epil, %polly.merge.loopexit.epilog-lcssa ]
  store i64 %p_add8574.lcssa, i64* %scevgep67, align 8, !alias.scope !24, !noalias !26
  %polly.indvar_next33 = add nuw nsw i64 %polly.indvar32, 1
  %polly.loop_cond35 = icmp sgt i64 %polly.indvar32, %polly.adjust_ub34
  br i1 %polly.loop_cond35, label %polly.loop_exit30.loopexit136, label %polly.loop_header28

polly.loop_header57:                              ; preds = %polly.loop_header57, %polly.loop_header28.new
  %p_add857482 = phi i64 [ %scevgep67.promoted, %polly.loop_header28.new ], [ %p_add8574.3, %polly.loop_header57 ]
  %polly.indvar61 = phi i64 [ 0, %polly.loop_header28.new ], [ %polly.indvar_next62.3, %polly.loop_header57 ]
  %niter = phi i64 [ %unroll_iter, %polly.loop_header28.new ], [ %niter.nsub.3, %polly.loop_header57 ]
  %56 = add i64 %41, %polly.indvar61
  %scevgep69 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %56
  %_p_scalar_70 = load i64, i64* %scevgep69, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %56
  %_p_scalar_72 = load i64, i64* %scevgep71, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul8473 = mul nsw i64 %_p_scalar_72, %_p_scalar_70
  %p_add8574 = add nsw i64 %p_mul8473, %p_add857482
  %polly.indvar_next62 = or i64 %polly.indvar61, 1
  %57 = add i64 %41, %polly.indvar_next62
  %scevgep69.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %57
  %_p_scalar_70.1 = load i64, i64* %scevgep69.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.1 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %57
  %_p_scalar_72.1 = load i64, i64* %scevgep71.1, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul8473.1 = mul nsw i64 %_p_scalar_72.1, %_p_scalar_70.1
  %p_add8574.1 = add nsw i64 %p_mul8473.1, %p_add8574
  %polly.indvar_next62.1 = or i64 %polly.indvar61, 2
  %58 = add i64 %41, %polly.indvar_next62.1
  %scevgep69.2 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %58
  %_p_scalar_70.2 = load i64, i64* %scevgep69.2, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.2 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %58
  %_p_scalar_72.2 = load i64, i64* %scevgep71.2, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul8473.2 = mul nsw i64 %_p_scalar_72.2, %_p_scalar_70.2
  %p_add8574.2 = add nsw i64 %p_mul8473.2, %p_add8574.1
  %polly.indvar_next62.2 = or i64 %polly.indvar61, 3
  %59 = add i64 %41, %polly.indvar_next62.2
  %scevgep69.3 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %59
  %_p_scalar_70.3 = load i64, i64* %scevgep69.3, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.3 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %59
  %_p_scalar_72.3 = load i64, i64* %scevgep71.3, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul8473.3 = mul nsw i64 %_p_scalar_72.3, %_p_scalar_70.3
  %p_add8574.3 = add nsw i64 %p_mul8473.3, %p_add8574.2
  %polly.indvar_next62.3 = add nsw i64 %polly.indvar61, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %polly.merge.loopexit.unr-lcssa.loopexit, label %polly.loop_header57, !llvm.loop !32
}

define internal void @mat_mult_polly_subfn_7(i8* nocapture readonly %polly.par.userContext) #7 {
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
  %polly.subfunc.arg.3 = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 24
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.call36 = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.lr.ph

polly.par.loadIVBounds.lr.ph:                     ; preds = %polly.par.setup
  %9 = and i64 %polly.subfunc.arg., 3
  %10 = add nsw i64 %polly.subfunc.arg., -1
  %polly.fdiv_q.shr = ashr i64 %10, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %pexp.p_div_q = lshr i64 %polly.subfunc.arg., 2
  %11 = add nsw i64 %pexp.p_div_q, -1
  %polly.loop_guard40 = icmp eq i64 %9, 0
  %12 = and i64 %polly.subfunc.arg., -4
  %13 = add nsw i64 %9, -1
  %xtraiter128 = and i64 %polly.subfunc.arg., 1
  %14 = icmp eq i64 %13, 0
  %lcmp.mod129 = icmp eq i64 %xtraiter128, 0
  %unroll_iter130 = sub nsw i64 %9, %xtraiter128
  %xtraiter = and i64 %polly.subfunc.arg., 1
  %15 = icmp eq i64 %13, 0
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %unroll_iter = sub nsw i64 %9, %xtraiter
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit6
  %16 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.lr.ph, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit6, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit6 ]
  br i1 %polly.loop_guard, label %polly.loop_header4.preheader, label %polly.loop_exit6

polly.loop_header4.preheader:                     ; preds = %polly.loop_header
  %18 = shl nsw i64 %polly.indvar, 5
  %19 = sub nsw i64 %polly.subfunc.arg.2, %18
  %20 = add nsw i64 %19, -1
  %21 = icmp sgt i64 %20, 31
  %22 = select i1 %21, i64 31, i64 %20
  %polly.loop_guard15 = icmp sgt i64 %22, -1
  %polly.adjust_ub18 = add i64 %22, -1
  br label %polly.loop_header4

polly.loop_exit6.loopexit:                        ; preds = %polly.loop_exit14
  br label %polly.loop_exit6

polly.loop_exit6:                                 ; preds = %polly.loop_exit6.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header4:                               ; preds = %polly.loop_header4.preheader, %polly.loop_exit14
  %polly.indvar7 = phi i64 [ %polly.indvar_next8, %polly.loop_exit14 ], [ 0, %polly.loop_header4.preheader ]
  br i1 %polly.loop_guard15, label %polly.loop_header12.preheader, label %polly.loop_exit14

polly.loop_header12.preheader:                    ; preds = %polly.loop_header4
  %23 = mul nsw i64 %polly.indvar7, -8
  %24 = add nsw i64 %11, %23
  %25 = icmp sgt i64 %24, 7
  %26 = select i1 %25, i64 7, i64 %24
  %polly.loop_guard24 = icmp sgt i64 %26, -1
  %27 = shl i64 %polly.indvar7, 5
  %28 = or i64 %27, 31
  %29 = icmp slt i64 %28, %polly.subfunc.arg.
  %or.cond = or i1 %polly.loop_guard40, %29
  %polly.adjust_ub27 = add i64 %26, -1
  br i1 %polly.loop_guard24, label %polly.loop_header12.us.preheader, label %polly.loop_header12.preheader.split

polly.loop_header12.us.preheader:                 ; preds = %polly.loop_header12.preheader
  br label %polly.loop_header12.us

polly.loop_header12.us:                           ; preds = %polly.loop_header12.us.preheader, %polly.merge.us
  %polly.indvar16.us = phi i64 [ %polly.indvar_next17.us, %polly.merge.us ], [ 0, %polly.loop_header12.us.preheader ]
  %30 = add nsw i64 %polly.indvar16.us, %18
  %31 = mul i64 %30, %polly.subfunc.arg.
  br label %polly.loop_header21.us

polly.loop_header21.us:                           ; preds = %polly.loop_header12.us, %polly.loop_header21.us
  %polly.indvar25.us = phi i64 [ %polly.indvar_next26.us, %polly.loop_header21.us ], [ 0, %polly.loop_header12.us ]
  %32 = shl i64 %polly.indvar25.us, 2
  %33 = add nuw nsw i64 %32, %27
  %34 = add i64 %33, %31
  %scevgep.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %34
  %_p_scalar_.us = load i64, i64* %scevgep.us, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !39
  %35 = mul i64 %33, %polly.subfunc.arg.
  %36 = add i64 %35, %30
  %scevgep35.us = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %36
  store i64 %_p_scalar_.us, i64* %scevgep35.us, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !39
  %37 = or i64 %33, 1
  %38 = add i64 %37, %31
  %scevgep.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %38
  %_p_scalar_.us.1 = load i64, i64* %scevgep.us.1, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !39
  %39 = mul i64 %37, %polly.subfunc.arg.
  %40 = add i64 %39, %30
  %scevgep35.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %40
  store i64 %_p_scalar_.us.1, i64* %scevgep35.us.1, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !39
  %41 = or i64 %33, 2
  %42 = add i64 %41, %31
  %scevgep.us.2 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %42
  %_p_scalar_.us.2 = load i64, i64* %scevgep.us.2, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !39
  %43 = mul i64 %41, %polly.subfunc.arg.
  %44 = add i64 %43, %30
  %scevgep35.us.2 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %44
  store i64 %_p_scalar_.us.2, i64* %scevgep35.us.2, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !39
  %45 = or i64 %33, 3
  %46 = add i64 %45, %31
  %scevgep.us.3 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %46
  %_p_scalar_.us.3 = load i64, i64* %scevgep.us.3, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !39
  %47 = mul i64 %45, %polly.subfunc.arg.
  %48 = add i64 %47, %30
  %scevgep35.us.3 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %48
  store i64 %_p_scalar_.us.3, i64* %scevgep35.us.3, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !39
  %polly.indvar_next26.us = add nuw nsw i64 %polly.indvar25.us, 1
  %polly.loop_cond28.us = icmp sgt i64 %polly.indvar25.us, %polly.adjust_ub27
  br i1 %polly.loop_cond28.us, label %polly.cond.loopexit.us, label %polly.loop_header21.us

polly.loop_header37.us:                           ; preds = %polly.loop_header37.us, %polly.loop_header37.us.preheader.new
  %polly.indvar41.us = phi i64 [ 0, %polly.loop_header37.us.preheader.new ], [ %polly.indvar_next42.us.1, %polly.loop_header37.us ]
  %niter131 = phi i64 [ %unroll_iter130, %polly.loop_header37.us.preheader.new ], [ %niter131.nsub.1, %polly.loop_header37.us ]
  %49 = add nuw nsw i64 %polly.indvar41.us, %12
  %50 = add i64 %49, %31
  %scevgep47.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %50
  %_p_scalar_48.us = load i64, i64* %scevgep47.us, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !41
  %51 = mul i64 %49, %polly.subfunc.arg.
  %52 = add i64 %51, %30
  %scevgep49.us = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %52
  store i64 %_p_scalar_48.us, i64* %scevgep49.us, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !41
  %polly.indvar_next42.us = or i64 %polly.indvar41.us, 1
  %53 = add nuw nsw i64 %polly.indvar_next42.us, %12
  %54 = add i64 %53, %31
  %scevgep47.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %54
  %_p_scalar_48.us.1 = load i64, i64* %scevgep47.us.1, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !41
  %55 = mul i64 %53, %polly.subfunc.arg.
  %56 = add i64 %55, %30
  %scevgep49.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %56
  store i64 %_p_scalar_48.us.1, i64* %scevgep49.us.1, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !41
  %polly.indvar_next42.us.1 = add nsw i64 %polly.indvar41.us, 2
  %niter131.nsub.1 = add i64 %niter131, -2
  %niter131.ncmp.1 = icmp eq i64 %niter131.nsub.1, 0
  br i1 %niter131.ncmp.1, label %polly.merge.us.loopexit.unr-lcssa.loopexit, label %polly.loop_header37.us, !llvm.loop !42

polly.merge.us.loopexit.unr-lcssa.loopexit:       ; preds = %polly.loop_header37.us
  br label %polly.merge.us.loopexit.unr-lcssa

polly.merge.us.loopexit.unr-lcssa:                ; preds = %polly.merge.us.loopexit.unr-lcssa.loopexit, %polly.loop_header37.us.preheader
  %polly.indvar41.us.unr = phi i64 [ 0, %polly.loop_header37.us.preheader ], [ %polly.indvar_next42.us.1, %polly.merge.us.loopexit.unr-lcssa.loopexit ]
  br i1 %lcmp.mod129, label %polly.merge.us.loopexit, label %polly.loop_header37.us.epil.preheader

polly.loop_header37.us.epil.preheader:            ; preds = %polly.merge.us.loopexit.unr-lcssa
  br label %polly.loop_header37.us.epil

polly.loop_header37.us.epil:                      ; preds = %polly.loop_header37.us.epil.preheader
  %57 = add nuw nsw i64 %polly.indvar41.us.unr, %12
  %58 = add i64 %57, %31
  %scevgep47.us.epil = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %58
  %_p_scalar_48.us.epil = load i64, i64* %scevgep47.us.epil, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !41
  %59 = mul i64 %57, %polly.subfunc.arg.
  %60 = add i64 %59, %30
  %scevgep49.us.epil = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %60
  store i64 %_p_scalar_48.us.epil, i64* %scevgep49.us.epil, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !41
  br label %polly.merge.us.loopexit.epilog-lcssa

polly.merge.us.loopexit.epilog-lcssa:             ; preds = %polly.loop_header37.us.epil
  br label %polly.merge.us.loopexit

polly.merge.us.loopexit:                          ; preds = %polly.merge.us.loopexit.unr-lcssa, %polly.merge.us.loopexit.epilog-lcssa
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next17.us = add nuw nsw i64 %polly.indvar16.us, 1
  %polly.loop_cond19.us = icmp sgt i64 %polly.indvar16.us, %polly.adjust_ub18
  br i1 %polly.loop_cond19.us, label %polly.loop_exit14.loopexit, label %polly.loop_header12.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header21.us
  br i1 %or.cond, label %polly.merge.us, label %polly.loop_header37.us.preheader

polly.loop_header37.us.preheader:                 ; preds = %polly.cond.loopexit.us
  br i1 %14, label %polly.merge.us.loopexit.unr-lcssa, label %polly.loop_header37.us.preheader.new

polly.loop_header37.us.preheader.new:             ; preds = %polly.loop_header37.us.preheader
  br label %polly.loop_header37.us

polly.loop_header12.preheader.split:              ; preds = %polly.loop_header12.preheader
  br i1 %or.cond, label %polly.loop_exit14, label %polly.loop_header12.preheader126

polly.loop_header12.preheader126:                 ; preds = %polly.loop_header12.preheader.split
  br label %polly.loop_header12

polly.loop_exit14.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit14

polly.loop_exit14.loopexit127:                    ; preds = %polly.merge
  br label %polly.loop_exit14

polly.loop_exit14:                                ; preds = %polly.loop_exit14.loopexit127, %polly.loop_exit14.loopexit, %polly.loop_header12.preheader.split, %polly.loop_header4
  %polly.indvar_next8 = add nuw nsw i64 %polly.indvar7, 1
  %exitcond52 = icmp eq i64 %polly.indvar7, %polly.fdiv_q.shr
  br i1 %exitcond52, label %polly.loop_exit6.loopexit, label %polly.loop_header4

polly.loop_header12:                              ; preds = %polly.loop_header12.preheader126, %polly.merge
  %polly.indvar16 = phi i64 [ %polly.indvar_next17, %polly.merge ], [ 0, %polly.loop_header12.preheader126 ]
  %61 = add nsw i64 %polly.indvar16, %18
  %62 = mul i64 %61, %polly.subfunc.arg.
  br i1 %15, label %polly.merge.unr-lcssa, label %polly.loop_header12.new

polly.loop_header12.new:                          ; preds = %polly.loop_header12
  br label %polly.loop_header37

polly.merge.unr-lcssa.loopexit:                   ; preds = %polly.loop_header37
  br label %polly.merge.unr-lcssa

polly.merge.unr-lcssa:                            ; preds = %polly.merge.unr-lcssa.loopexit, %polly.loop_header12
  %polly.indvar41.unr = phi i64 [ 0, %polly.loop_header12 ], [ %polly.indvar_next42.1, %polly.merge.unr-lcssa.loopexit ]
  br i1 %lcmp.mod, label %polly.merge, label %polly.loop_header37.epil.preheader

polly.loop_header37.epil.preheader:               ; preds = %polly.merge.unr-lcssa
  br label %polly.loop_header37.epil

polly.loop_header37.epil:                         ; preds = %polly.loop_header37.epil.preheader
  %63 = add nuw nsw i64 %polly.indvar41.unr, %12
  %64 = add i64 %63, %62
  %scevgep47.epil = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %64
  %_p_scalar_48.epil = load i64, i64* %scevgep47.epil, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !41
  %65 = mul i64 %63, %polly.subfunc.arg.
  %66 = add i64 %65, %61
  %scevgep49.epil = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %66
  store i64 %_p_scalar_48.epil, i64* %scevgep49.epil, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !41
  br label %polly.merge.epilog-lcssa

polly.merge.epilog-lcssa:                         ; preds = %polly.loop_header37.epil
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.unr-lcssa, %polly.merge.epilog-lcssa
  %polly.indvar_next17 = add nuw nsw i64 %polly.indvar16, 1
  %polly.loop_cond19 = icmp sgt i64 %polly.indvar16, %polly.adjust_ub18
  br i1 %polly.loop_cond19, label %polly.loop_exit14.loopexit127, label %polly.loop_header12

polly.loop_header37:                              ; preds = %polly.loop_header37, %polly.loop_header12.new
  %polly.indvar41 = phi i64 [ 0, %polly.loop_header12.new ], [ %polly.indvar_next42.1, %polly.loop_header37 ]
  %niter = phi i64 [ %unroll_iter, %polly.loop_header12.new ], [ %niter.nsub.1, %polly.loop_header37 ]
  %67 = add nuw nsw i64 %polly.indvar41, %12
  %68 = add i64 %67, %62
  %scevgep47 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %68
  %_p_scalar_48 = load i64, i64* %scevgep47, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !41
  %69 = mul i64 %67, %polly.subfunc.arg.
  %70 = add i64 %69, %61
  %scevgep49 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %70
  store i64 %_p_scalar_48, i64* %scevgep49, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !41
  %polly.indvar_next42 = or i64 %polly.indvar41, 1
  %71 = add nuw nsw i64 %polly.indvar_next42, %12
  %72 = add i64 %71, %62
  %scevgep47.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %72
  %_p_scalar_48.1 = load i64, i64* %scevgep47.1, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !41
  %73 = mul i64 %71, %polly.subfunc.arg.
  %74 = add i64 %73, %61
  %scevgep49.1 = getelementptr i64, i64* %polly.subfunc.arg.call36, i64 %74
  store i64 %_p_scalar_48.1, i64* %scevgep49.1, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !41
  %polly.indvar_next42.1 = add nsw i64 %polly.indvar41, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %polly.merge.unr-lcssa.loopexit, label %polly.loop_header37, !llvm.loop !43
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "polly.skip.fn" }
attributes #8 = { nounwind readnone }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"}
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
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.vectorize.width", i32 1}
!14 = !{!"llvm.loop.interleave.count", i32 1}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !18, !"polly.alias.scope.call"}
!18 = distinct !{!18, !"polly.alias.scope.domain"}
!19 = !{}
!20 = distinct !{!20}
!21 = distinct !{!21, !22, !13, !14}
!22 = !{!"llvm.loop.unroll.runtime.disable"}
!23 = distinct !{!23, !22, !13, !14}
!24 = distinct !{!24, !25, !"polly.alias.scope.call"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27, !28}
!27 = distinct !{!27, !25, !"polly.alias.scope."}
!28 = distinct !{!28, !25, !"polly.alias.scope.call36"}
!29 = !{!24, !28}
!30 = distinct !{!30}
!31 = !{!24, !27}
!32 = distinct !{!32}
!33 = distinct !{!33, !16}
!34 = distinct !{!34, !16}
!35 = distinct !{!35, !36, !"polly.alias.scope."}
!36 = distinct !{!36, !"polly.alias.scope.domain"}
!37 = !{!38}
!38 = distinct !{!38, !36, !"polly.alias.scope.call36"}
!39 = distinct !{!39}
!40 = !{!35}
!41 = distinct !{!41}
!42 = distinct !{!42, !13, !14}
!43 = distinct !{!43, !13, !14}
