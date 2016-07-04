; ModuleID = 'MatrixMult_transpose.c'
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
  %cmp85 = icmp sgt i64 %height, 0
  br i1 %cmp85, label %polly.parallel.for, label %if.end24

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
  %cmp79 = icmp sgt i64 %1, 0
  br i1 %cmp79, label %while.cond3.preheader.preheader, label %blklab6

while.cond3.preheader.preheader:                  ; preds = %entry
  %cmp574 = icmp sgt i64 %0, 0
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  br i1 %cmp574, label %while.cond3.preheader.us.preheader, label %while.cond3.preheader.preheader100

while.cond3.preheader.preheader100:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader

while.cond3.preheader.us.preheader:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader.us

while.cond3.preheader.us:                         ; preds = %while.cond3.preheader.us.preheader, %if.end16.us
  %_25_dealloc.085.us = phi i1 [ true, %if.end16.us ], [ false, %while.cond3.preheader.us.preheader ]
  %_25.084.us = phi i8* [ %6, %if.end16.us ], [ undef, %while.cond3.preheader.us.preheader ]
  %_18_dealloc.083.us = phi i8 [ 1, %if.end16.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %_18.082.us = phi i64* [ %call10.us, %if.end16.us ], [ null, %while.cond3.preheader.us.preheader ]
  %i.080.us = phi i64 [ %add13.us, %if.end16.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %mul.us = mul nsw i64 %i.080.us, %0
  br label %if.end7.us

if.end7.us:                                       ; preds = %while.cond3.preheader.us, %if.end9.us
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
  tail call void @free(i8* %5) #9
  br label %if.end9.us

if.end9.us:                                       ; preds = %if.then8.us, %if.end7.us
  %call10.us = tail call i64* @create1DArray(i32 0, i32 1) #9
  store i64 32, i64* %call10.us, align 8, !tbaa !8
  tail call void @printf_s(i64* %call10.us, i64 1) #9
  %add12.us = add nuw nsw i64 %j.075.us, 1
  %exitcond.us = icmp eq i64 %add12.us, %0
  br i1 %exitcond.us, label %blklab8.loopexit.us, label %if.end7.us

if.then15.us:                                     ; preds = %blklab8.loopexit.us
  tail call void @free(i8* %_25.084.us) #9
  br label %if.end16.us

if.end16.us:                                      ; preds = %if.then15.us, %blklab8.loopexit.us
  %call18.us = tail call i64* @create1DArray(i32 0, i32 0) #9
  %6 = bitcast i64* %call18.us to i8*
  tail call void @println_s(i64* %call18.us, i64 0) #9
  %exitcond90.us = icmp eq i64 %add13.us, %1
  br i1 %exitcond90.us, label %blklab6.loopexit, label %while.cond3.preheader.us

blklab8.loopexit.us:                              ; preds = %if.end9.us
  %add13.us = add nuw nsw i64 %i.080.us, 1
  br i1 %_25_dealloc.085.us, label %if.then15.us, label %if.end16.us

while.cond3.preheader:                            ; preds = %while.cond3.preheader.preheader100, %if.end16
  %_25_dealloc.085 = phi i1 [ true, %if.end16 ], [ false, %while.cond3.preheader.preheader100 ]
  %_25.084 = phi i8* [ %7, %if.end16 ], [ undef, %while.cond3.preheader.preheader100 ]
  %i.080 = phi i64 [ %add13, %if.end16 ], [ 0, %while.cond3.preheader.preheader100 ]
  %add13 = add nuw nsw i64 %i.080, 1
  br i1 %_25_dealloc.085, label %if.then15, label %if.end16

if.then15:                                        ; preds = %while.cond3.preheader
  tail call void @free(i8* %_25.084) #9
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %while.cond3.preheader
  %call18 = tail call i64* @create1DArray(i32 0, i32 0) #9
  %7 = bitcast i64* %call18 to i8*
  tail call void @println_s(i64* %call18, i64 0) #9
  %exitcond90 = icmp eq i64 %add13, %1
  br i1 %exitcond90, label %blklab6.loopexit101, label %while.cond3.preheader

blklab6.loopexit:                                 ; preds = %if.end16.us
  %phitmp = bitcast i64* %call10.us to i8*
  br label %blklab6

blklab6.loopexit101:                              ; preds = %if.end16
  br label %blklab6

blklab6:                                          ; preds = %blklab6.loopexit101, %blklab6.loopexit, %entry
  %_25_dealloc.0.lcssa = phi i1 [ false, %entry ], [ true, %blklab6.loopexit ], [ true, %blklab6.loopexit101 ]
  %_25.0.lcssa = phi i8* [ undef, %entry ], [ %6, %blklab6.loopexit ], [ %7, %blklab6.loopexit101 ]
  %_18_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ 1, %blklab6.loopexit ], [ 0, %blklab6.loopexit101 ]
  %_18.0.lcssa = phi i8* [ null, %entry ], [ %phitmp, %blklab6.loopexit ], [ null, %blklab6.loopexit101 ]
  br i1 %a_dealloc, label %if.then20, label %if.end24

if.then20:                                        ; preds = %blklab6
  %8 = bitcast %struct.Matrix* %a to i8**
  %9 = load i8*, i8** %8, align 8, !tbaa !7
  tail call void @free(i8* %9) #9
  %10 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %10) #9
  br label %if.end24

if.end24:                                         ; preds = %blklab6, %if.then20
  %tobool25 = icmp eq i8 %_18_dealloc.0.lcssa, 0
  br i1 %tobool25, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.end24
  tail call void @free(i8* %_18.0.lcssa) #9
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %if.then26
  br i1 %_25_dealloc.0.lcssa, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end27
  tail call void @free(i8* %_25.0.lcssa) #9
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.end27
  ret void
}

declare void @printf_s(i64*, i64) local_unnamed_addr #3

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @mat_mult(%struct.Matrix* nocapture %a, i1 zeroext %a_dealloc, %struct.Matrix* nocapture %b, i1 zeroext %b_dealloc) local_unnamed_addr #4 {
entry:
  %polly.par.userContext390 = alloca { i64, i64, i64*, i64* }, align 8
  %polly.par.userContext = alloca { i64, i64, i64*, i64*, i64* }, align 8
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 2
  %0 = load i64, i64* %width2, align 8, !tbaa !10
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height3, align 8, !tbaa !11
  %mul = mul nsw i64 %1, %0
  %conv4 = trunc i64 %mul to i32
  %call = tail call i64* @create1DArray(i32 0, i32 %conv4) #9
  %data11 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %2 = load i64*, i64** %data11, align 8, !tbaa !7
  %data18 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0
  %3 = load i64*, i64** %data18, align 8, !tbaa !7
  %call30 = tail call i64* @create1DArray(i32 0, i32 %conv4) #9
  %cmp270 = icmp sgt i64 %1, 0
  br i1 %cmp270, label %polly.split_new_and_old340, label %entry.polly.split_new_and_old_crit_edge

entry.polly.split_new_and_old_crit_edge:          ; preds = %entry
  %.pre420 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.pre421 = extractvalue { i64, i1 } %.pre420, 1
  %.pre422 = extractvalue { i64, i1 } %.pre420, 0
  %.pre423 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.pre422, i64 %0)
  %.pre424 = extractvalue { i64, i1 } %.pre423, 1
  %.pre425 = or i1 %.pre421, %.pre424
  %.pre426 = extractvalue { i64, i1 } %.pre423, 0
  %.pre427 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.pre426, i64 %0)
  %.pre428 = extractvalue { i64, i1 } %.pre427, 1
  %.pre429 = extractvalue { i64, i1 } %.pre427, 0
  %.pre430 = or i1 %.pre425, %.pre428
  br label %polly.split_new_and_old

polly.split_new_and_old340:                       ; preds = %entry
  %4 = icmp sge i64 %0, %1
  %5 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.obit344 = extractvalue { i64, i1 } %5, 1
  %.res346 = extractvalue { i64, i1 } %5, 0
  %polly.access.mul.347 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res346, i64 %0)
  %polly.access.mul..obit348 = extractvalue { i64, i1 } %polly.access.mul.347, 1
  %polly.overflow.state349 = or i1 %.obit344, %polly.access.mul..obit348
  %polly.access.mul..res350 = extractvalue { i64, i1 } %polly.access.mul.347, 0
  %polly.access.add.351 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res350, i64 %0)
  %polly.access.add..obit352 = extractvalue { i64, i1 } %polly.access.add.351, 1
  %polly.access.add..res354 = extractvalue { i64, i1 } %polly.access.add.351, 0
  %polly.access.355 = getelementptr i64, i64* %3, i64 %polly.access.add..res354
  %polly.overflow.state362 = or i1 %polly.overflow.state349, %polly.access.add..obit352
  %6 = icmp ule i64* %polly.access.355, %call30
  %7 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 1)
  %.obit365 = extractvalue { i64, i1 } %7, 1
  %polly.overflow.state366 = or i1 %.obit365, %polly.overflow.state362
  %.res367 = extractvalue { i64, i1 } %7, 0
  %polly.access.mul.call30368 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res367, i64 %0)
  %polly.access.mul.call30.obit369 = extractvalue { i64, i1 } %polly.access.mul.call30368, 1
  %polly.overflow.state370 = or i1 %polly.access.mul.call30.obit369, %polly.overflow.state366
  %polly.access.mul.call30.res371 = extractvalue { i64, i1 } %polly.access.mul.call30368, 0
  %polly.access.add.call30372 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.call30.res371, i64 %1)
  %polly.access.add.call30.obit373 = extractvalue { i64, i1 } %polly.access.add.call30372, 1
  %polly.access.add.call30.res375 = extractvalue { i64, i1 } %polly.access.add.call30372, 0
  %polly.access.call30376 = getelementptr i64, i64* %call30, i64 %polly.access.add.call30.res375
  %polly.overflow.state383 = or i1 %polly.access.add.call30.obit373, %polly.overflow.state370
  %8 = icmp ule i64* %polly.access.call30376, %3
  %9 = or i1 %8, %6
  %10 = and i1 %4, %9
  %polly.rtc.overflown386 = xor i1 %polly.overflow.state383, true
  %polly.rtc.result387 = and i1 %10, %polly.rtc.overflown386
  br i1 %polly.rtc.result387, label %polly.parallel.for388, label %while.cond39.preheader.preheader

while.cond39.preheader.preheader:                 ; preds = %polly.split_new_and_old340
  %cmp41268 = icmp sgt i64 %0, 0
  br i1 %cmp41268, label %while.cond39.preheader.us.preheader, label %polly.split_new_and_old

while.cond39.preheader.us.preheader:              ; preds = %while.cond39.preheader.preheader
  %11 = add i64 %0, -1
  %min.iters.check = icmp ult i64 %0, 4
  %n.vec = and i64 %0, -4
  br label %while.cond39.preheader.us

while.cond39.preheader.us:                        ; preds = %while.cond39.preheader.us.preheader, %blklab15.loopexit.us
  %i.0271.us = phi i64 [ %add50.us, %blklab15.loopexit.us ], [ 0, %while.cond39.preheader.us.preheader ]
  %mul45.us = mul nsw i64 %i.0271.us, %0
  br i1 %min.iters.check, label %if.end44.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %while.cond39.preheader.us
  br i1 false, label %vector.memcheck, label %if.end44.us.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 undef, label %if.end44.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader
  br i1 undef, label %blklab15.loopexit.us, label %if.end44.us.preheader

if.end44.us.preheader:                            ; preds = %min.iters.checked, %vector.body, %vector.memcheck, %while.cond39.preheader.us
  %j.0269.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %while.cond39.preheader.us ], [ %n.vec, %vector.body ]
  %12 = sub i64 %0, %j.0269.us.ph
  %13 = sub i64 %11, %j.0269.us.ph
  %xtraiter444 = and i64 %12, 3
  %14 = icmp ult i64 %13, 3
  br i1 %14, label %blklab15.loopexit.us.loopexit.unr-lcssa, label %if.end44.us.preheader.new

if.end44.us.preheader.new:                        ; preds = %if.end44.us.preheader
  %unroll_iter446 = sub i64 %12, %xtraiter444
  br label %if.end44.us

if.end44.us:                                      ; preds = %if.end44.us, %if.end44.us.preheader.new
  %j.0269.us = phi i64 [ %j.0269.us.ph, %if.end44.us.preheader.new ], [ %add49.us.3, %if.end44.us ]
  %niter447 = phi i64 [ %unroll_iter446, %if.end44.us.preheader.new ], [ %niter447.nsub.3, %if.end44.us ]
  %add.us = add nsw i64 %j.0269.us, %mul45.us
  %arrayidx.us = getelementptr inbounds i64, i64* %3, i64 %add.us
  %15 = load i64, i64* %arrayidx.us, align 8, !tbaa !8
  %mul46.us = mul nsw i64 %j.0269.us, %0
  %add47.us = add nsw i64 %mul46.us, %i.0271.us
  %arrayidx48.us = getelementptr inbounds i64, i64* %call30, i64 %add47.us
  store i64 %15, i64* %arrayidx48.us, align 8, !tbaa !8
  %add49.us = or i64 %j.0269.us, 1
  %add.us.1 = add nsw i64 %add49.us, %mul45.us
  %arrayidx.us.1 = getelementptr inbounds i64, i64* %3, i64 %add.us.1
  %16 = load i64, i64* %arrayidx.us.1, align 8, !tbaa !8
  %mul46.us.1 = mul nsw i64 %add49.us, %0
  %add47.us.1 = add nsw i64 %mul46.us.1, %i.0271.us
  %arrayidx48.us.1 = getelementptr inbounds i64, i64* %call30, i64 %add47.us.1
  store i64 %16, i64* %arrayidx48.us.1, align 8, !tbaa !8
  %add49.us.1 = or i64 %j.0269.us, 2
  %add.us.2 = add nsw i64 %add49.us.1, %mul45.us
  %arrayidx.us.2 = getelementptr inbounds i64, i64* %3, i64 %add.us.2
  %17 = load i64, i64* %arrayidx.us.2, align 8, !tbaa !8
  %mul46.us.2 = mul nsw i64 %add49.us.1, %0
  %add47.us.2 = add nsw i64 %mul46.us.2, %i.0271.us
  %arrayidx48.us.2 = getelementptr inbounds i64, i64* %call30, i64 %add47.us.2
  store i64 %17, i64* %arrayidx48.us.2, align 8, !tbaa !8
  %add49.us.2 = or i64 %j.0269.us, 3
  %add.us.3 = add nsw i64 %add49.us.2, %mul45.us
  %arrayidx.us.3 = getelementptr inbounds i64, i64* %3, i64 %add.us.3
  %18 = load i64, i64* %arrayidx.us.3, align 8, !tbaa !8
  %mul46.us.3 = mul nsw i64 %add49.us.2, %0
  %add47.us.3 = add nsw i64 %mul46.us.3, %i.0271.us
  %arrayidx48.us.3 = getelementptr inbounds i64, i64* %call30, i64 %add47.us.3
  store i64 %18, i64* %arrayidx48.us.3, align 8, !tbaa !8
  %add49.us.3 = add nsw i64 %j.0269.us, 4
  %niter447.nsub.3 = add i64 %niter447, -4
  %niter447.ncmp.3 = icmp eq i64 %niter447.nsub.3, 0
  br i1 %niter447.ncmp.3, label %blklab15.loopexit.us.loopexit.unr-lcssa.loopexit, label %if.end44.us, !llvm.loop !12

blklab15.loopexit.us.loopexit.unr-lcssa.loopexit: ; preds = %if.end44.us
  br label %blklab15.loopexit.us.loopexit.unr-lcssa

blklab15.loopexit.us.loopexit.unr-lcssa:          ; preds = %blklab15.loopexit.us.loopexit.unr-lcssa.loopexit, %if.end44.us.preheader
  %j.0269.us.unr = phi i64 [ %j.0269.us.ph, %if.end44.us.preheader ], [ %add49.us.3, %blklab15.loopexit.us.loopexit.unr-lcssa.loopexit ]
  %lcmp.mod445 = icmp eq i64 %xtraiter444, 0
  br i1 %lcmp.mod445, label %blklab15.loopexit.us.loopexit, label %if.end44.us.epil.preheader

if.end44.us.epil.preheader:                       ; preds = %blklab15.loopexit.us.loopexit.unr-lcssa
  br label %if.end44.us.epil

if.end44.us.epil:                                 ; preds = %if.end44.us.epil, %if.end44.us.epil.preheader
  %j.0269.us.epil = phi i64 [ %add49.us.epil, %if.end44.us.epil ], [ %j.0269.us.unr, %if.end44.us.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.sub, %if.end44.us.epil ], [ %xtraiter444, %if.end44.us.epil.preheader ]
  %add.us.epil = add nsw i64 %j.0269.us.epil, %mul45.us
  %arrayidx.us.epil = getelementptr inbounds i64, i64* %3, i64 %add.us.epil
  %19 = load i64, i64* %arrayidx.us.epil, align 8, !tbaa !8
  %mul46.us.epil = mul nsw i64 %j.0269.us.epil, %0
  %add47.us.epil = add nsw i64 %mul46.us.epil, %i.0271.us
  %arrayidx48.us.epil = getelementptr inbounds i64, i64* %call30, i64 %add47.us.epil
  store i64 %19, i64* %arrayidx48.us.epil, align 8, !tbaa !8
  %add49.us.epil = add nuw nsw i64 %j.0269.us.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %blklab15.loopexit.us.loopexit.epilog-lcssa, label %if.end44.us.epil, !llvm.loop !15

blklab15.loopexit.us.loopexit.epilog-lcssa:       ; preds = %if.end44.us.epil
  br label %blklab15.loopexit.us.loopexit

blklab15.loopexit.us.loopexit:                    ; preds = %blklab15.loopexit.us.loopexit.unr-lcssa, %blklab15.loopexit.us.loopexit.epilog-lcssa
  br label %blklab15.loopexit.us

blklab15.loopexit.us:                             ; preds = %blklab15.loopexit.us.loopexit, %vector.body
  %add50.us = add nuw nsw i64 %i.0271.us, 1
  %exitcond276.us = icmp eq i64 %add50.us, %1
  br i1 %exitcond276.us, label %polly.split_new_and_old.loopexit, label %while.cond39.preheader.us

polly.split_new_and_old.loopexit:                 ; preds = %blklab15.loopexit.us
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %polly.split_new_and_old.loopexit, %while.cond39.preheader.preheader, %entry.polly.split_new_and_old_crit_edge, %polly.parallel.for388
  %polly.overflow.state280.pre-phi = phi i1 [ %.pre430, %entry.polly.split_new_and_old_crit_edge ], [ %polly.overflow.state362, %polly.parallel.for388 ], [ %polly.overflow.state362, %while.cond39.preheader.preheader ], [ %polly.overflow.state362, %polly.split_new_and_old.loopexit ]
  %polly.access.add.call30.res.pre-phi = phi i64 [ %.pre429, %entry.polly.split_new_and_old_crit_edge ], [ %polly.access.add..res354, %polly.parallel.for388 ], [ %polly.access.add..res354, %while.cond39.preheader.preheader ], [ %polly.access.add..res354, %polly.split_new_and_old.loopexit ]
  %polly.access.call30 = getelementptr i64, i64* %call30, i64 %polly.access.add.call30.res.pre-phi
  %20 = icmp ule i64* %polly.access.call30, %call
  %polly.access.call292 = getelementptr i64, i64* %call, i64 %polly.access.add.call30.res.pre-phi
  %21 = icmp ule i64* %polly.access.call292, %call30
  %22 = or i1 %20, %21
  %polly.access. = getelementptr i64, i64* %2, i64 %polly.access.add.call30.res.pre-phi
  %23 = icmp ule i64* %polly.access., %call
  %24 = icmp ule i64* %polly.access.call292, %2
  %25 = or i1 %23, %24
  %26 = and i1 %22, %25
  %polly.rtc.overflown = xor i1 %polly.overflow.state280.pre-phi, true
  %polly.rtc.result = and i1 %26, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.parallel.for, label %while.cond51.preheader

while.cond51.preheader:                           ; preds = %polly.split_new_and_old
  %cmp59262 = icmp sgt i64 %0, 0
  %or.cond = and i1 %cmp270, %cmp59262
  br i1 %or.cond, label %while.cond57.preheader.us.preheader, label %if.end88

while.cond57.preheader.us.preheader:              ; preds = %while.cond51.preheader
  %xtraiter = and i64 %0, 1
  %27 = icmp eq i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %unroll_iter = sub i64 %0, %xtraiter
  br label %while.cond57.preheader.us

while.cond57.preheader.us:                        ; preds = %while.cond57.preheader.us.preheader, %blklab19.loopexit.us-lcssa.us.us
  %i.1266.us = phi i64 [ %add85.us, %blklab19.loopexit.us-lcssa.us.us ], [ 0, %while.cond57.preheader.us.preheader ]
  %mul69.us = mul nsw i64 %i.1266.us, %0
  br label %while.cond63.preheader.us.us

while.cond63.preheader.us.us:                     ; preds = %while.cond57.preheader.us, %blklab21.loopexit.us.us
  %j.1263.us.us = phi i64 [ %add84.us.us, %blklab21.loopexit.us.us ], [ 0, %while.cond57.preheader.us ]
  %add70.us.us = add nsw i64 %j.1263.us.us, %mul69.us
  %arrayidx71.us.us = getelementptr inbounds i64, i64* %call, i64 %add70.us.us
  %.pre = load i64, i64* %arrayidx71.us.us, align 8, !tbaa !8
  br i1 %27, label %blklab21.loopexit.us.us.unr-lcssa, label %while.cond63.preheader.us.us.new

while.cond63.preheader.us.us.new:                 ; preds = %while.cond63.preheader.us.us
  br label %if.end68.us.us

blklab21.loopexit.us.us.unr-lcssa.loopexit:       ; preds = %if.end68.us.us
  br label %blklab21.loopexit.us.us.unr-lcssa

blklab21.loopexit.us.us.unr-lcssa:                ; preds = %blklab21.loopexit.us.us.unr-lcssa.loopexit, %while.cond63.preheader.us.us
  %.unr = phi i64 [ %.pre, %while.cond63.preheader.us.us ], [ %add79.us.us.1, %blklab21.loopexit.us.us.unr-lcssa.loopexit ]
  %k.0261.us.us.unr = phi i64 [ 0, %while.cond63.preheader.us.us ], [ %add83.us.us.1, %blklab21.loopexit.us.us.unr-lcssa.loopexit ]
  br i1 %lcmp.mod, label %blklab21.loopexit.us.us, label %if.end68.us.us.epil.preheader

if.end68.us.us.epil.preheader:                    ; preds = %blklab21.loopexit.us.us.unr-lcssa
  br label %if.end68.us.us.epil

if.end68.us.us.epil:                              ; preds = %if.end68.us.us.epil.preheader
  %add73.us.us.epil = add nsw i64 %k.0261.us.us.unr, %mul69.us
  %arrayidx74.us.us.epil = getelementptr inbounds i64, i64* %2, i64 %add73.us.us.epil
  %28 = load i64, i64* %arrayidx74.us.us.epil, align 8, !tbaa !8
  %arrayidx77.us.us.epil = getelementptr inbounds i64, i64* %call30, i64 %add73.us.us.epil
  %29 = load i64, i64* %arrayidx77.us.us.epil, align 8, !tbaa !8
  %mul78.us.us.epil = mul nsw i64 %29, %28
  %add79.us.us.epil = add nsw i64 %mul78.us.us.epil, %.unr
  store i64 %add79.us.us.epil, i64* %arrayidx71.us.us, align 8, !tbaa !8
  br label %blklab21.loopexit.us.us.epilog-lcssa

blklab21.loopexit.us.us.epilog-lcssa:             ; preds = %if.end68.us.us.epil
  br label %blklab21.loopexit.us.us

blklab21.loopexit.us.us:                          ; preds = %blklab21.loopexit.us.us.unr-lcssa, %blklab21.loopexit.us.us.epilog-lcssa
  %add84.us.us = add nuw nsw i64 %j.1263.us.us, 1
  %exitcond273.us.us = icmp eq i64 %add84.us.us, %0
  br i1 %exitcond273.us.us, label %blklab19.loopexit.us-lcssa.us.us, label %while.cond63.preheader.us.us

if.end68.us.us:                                   ; preds = %if.end68.us.us, %while.cond63.preheader.us.us.new
  %30 = phi i64 [ %.pre, %while.cond63.preheader.us.us.new ], [ %add79.us.us.1, %if.end68.us.us ]
  %k.0261.us.us = phi i64 [ 0, %while.cond63.preheader.us.us.new ], [ %add83.us.us.1, %if.end68.us.us ]
  %niter = phi i64 [ %unroll_iter, %while.cond63.preheader.us.us.new ], [ %niter.nsub.1, %if.end68.us.us ]
  %add73.us.us = add nsw i64 %k.0261.us.us, %mul69.us
  %arrayidx74.us.us = getelementptr inbounds i64, i64* %2, i64 %add73.us.us
  %31 = load i64, i64* %arrayidx74.us.us, align 8, !tbaa !8
  %arrayidx77.us.us = getelementptr inbounds i64, i64* %call30, i64 %add73.us.us
  %32 = load i64, i64* %arrayidx77.us.us, align 8, !tbaa !8
  %mul78.us.us = mul nsw i64 %32, %31
  %add79.us.us = add nsw i64 %mul78.us.us, %30
  store i64 %add79.us.us, i64* %arrayidx71.us.us, align 8, !tbaa !8
  %add83.us.us = or i64 %k.0261.us.us, 1
  %add73.us.us.1 = add nsw i64 %add83.us.us, %mul69.us
  %arrayidx74.us.us.1 = getelementptr inbounds i64, i64* %2, i64 %add73.us.us.1
  %33 = load i64, i64* %arrayidx74.us.us.1, align 8, !tbaa !8
  %arrayidx77.us.us.1 = getelementptr inbounds i64, i64* %call30, i64 %add73.us.us.1
  %34 = load i64, i64* %arrayidx77.us.us.1, align 8, !tbaa !8
  %mul78.us.us.1 = mul nsw i64 %34, %33
  %add79.us.us.1 = add nsw i64 %mul78.us.us.1, %add79.us.us
  store i64 %add79.us.us.1, i64* %arrayidx71.us.us, align 8, !tbaa !8
  %add83.us.us.1 = add nsw i64 %k.0261.us.us, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %blklab21.loopexit.us.us.unr-lcssa.loopexit, label %if.end68.us.us

blklab19.loopexit.us-lcssa.us.us:                 ; preds = %blklab21.loopexit.us.us
  %add85.us = add nuw nsw i64 %i.1266.us, 1
  %exitcond274.us = icmp eq i64 %add85.us, %1
  br i1 %exitcond274.us, label %if.end88.loopexit, label %while.cond57.preheader.us

if.end88.loopexit:                                ; preds = %blklab19.loopexit.us-lcssa.us.us
  br label %if.end88

if.end88:                                         ; preds = %if.end88.loopexit, %polly.parallel.for, %while.cond51.preheader
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
  br i1 %a_dealloc, label %if.then92, label %if.end93

if.then92:                                        ; preds = %if.end88
  %39 = bitcast %struct.Matrix* %a to i8**
  %40 = load i8*, i8** %39, align 8, !tbaa !7
  tail call void @free(i8* %40) #9
  %41 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %41) #9
  br label %if.end93

if.end93:                                         ; preds = %if.then92, %if.end88
  br i1 %b_dealloc, label %if.then95, label %if.then110

if.then95:                                        ; preds = %if.end93
  %42 = bitcast %struct.Matrix* %b to i8**
  %43 = load i8*, i8** %42, align 8, !tbaa !7
  tail call void @free(i8* %43) #9
  %44 = bitcast %struct.Matrix* %b to i8*
  tail call void @free(i8* %44) #9
  br label %if.then110

if.then110:                                       ; preds = %if.end93, %if.then95
  %45 = bitcast i64* %call30 to i8*
  tail call void @free(i8* %45) #9
  ret %struct.Matrix* %35

polly.parallel.for:                               ; preds = %polly.split_new_and_old
  %46 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %46, 5
  %47 = bitcast { i64, i64, i64*, i64*, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 40, i8* %47)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %1, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.337 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64 %0, i64* %polly.subfn.storeaddr.337, align 8
  %polly.subfn.storeaddr.call = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %call, i64** %polly.subfn.storeaddr.call, align 8
  %polly.subfn.storeaddr.338 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 3
  store i64* %2, i64** %polly.subfn.storeaddr.338, align 8
  %polly.subfn.storeaddr.call30 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 4
  store i64* %call30, i64** %polly.subfn.storeaddr.call30, align 8
  %48 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn, i8* %47, i32 0, i64 0, i64 %48, i64 1) #9
  call void @mat_mult_polly_subfn(i8* %47) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %47)
  br label %if.end88

polly.parallel.for388:                            ; preds = %polly.split_new_and_old340
  %49 = add nsw i64 %1, -1
  %polly.fdiv_q.shr389 = ashr i64 %49, 5
  %50 = bitcast { i64, i64, i64*, i64* }* %polly.par.userContext390 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %50)
  %polly.subfn.storeaddr.391 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext390, i64 0, i32 0
  store i64 %0, i64* %polly.subfn.storeaddr.391, align 8
  %polly.subfn.storeaddr.392 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext390, i64 0, i32 1
  store i64 %1, i64* %polly.subfn.storeaddr.392, align 8
  %polly.subfn.storeaddr.393 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext390, i64 0, i32 2
  store i64* %3, i64** %polly.subfn.storeaddr.393, align 8
  %polly.subfn.storeaddr.call30394 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext390, i64 0, i32 3
  store i64* %call30, i64** %polly.subfn.storeaddr.call30394, align 8
  %51 = add nsw i64 %polly.fdiv_q.shr389, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn_8, i8* %50, i32 0, i64 0, i64 %51, i64 1) #9
  call void @mat_mult_polly_subfn_8(i8* %50) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %50)
  br label %polly.split_new_and_old
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #5 {
entry:
  %polly.par.userContext.i348 = alloca { i64, i64, i64* }, align 8
  %polly.par.userContext.i = alloca { i64, i64, i64* }, align 8
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #9
  %0 = load i64*, i64** %call, align 8, !tbaa !9
  %call1 = tail call i64* @parseStringToInt(i64* %0) #9
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end204, label %if.end5

if.end5:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !8
  %call10 = tail call i64* @create1DArray(i32 0, i32 7) #9
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
  tail call void @printf_s(i64* %call10, i64 7) #9
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1)
  %mul.i = mul i64 %1, %1
  %conv1.i = trunc i64 %mul.i to i32
  %call.i = tail call i64* @create1DArray(i32 0, i32 %conv1.i) #9
  %cmp85.i = icmp sgt i64 %1, 0
  br i1 %cmp85.i, label %polly.parallel.for.i, label %init.exit

polly.parallel.for.i:                             ; preds = %if.end5
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

init.exit:                                        ; preds = %if.end5, %polly.parallel.for.i
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
  %call.i351 = tail call i64* @create1DArray(i32 0, i32 %conv1.i) #9
  %12 = add nsw i64 %1, -1
  br i1 %cmp85.i, label %polly.parallel.for.i362, label %init.exit363

polly.parallel.for.i362:                          ; preds = %init.exit
  %polly.fdiv_q.shr.i358 = ashr i64 %12, 5
  %13 = bitcast { i64, i64, i64* }* %polly.par.userContext.i348 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %13) #9
  %polly.subfn.storeaddr.width.i359 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i348, i64 0, i32 0
  store i64 %1, i64* %polly.subfn.storeaddr.width.i359, align 8
  %polly.subfn.storeaddr.height.i360 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i348, i64 0, i32 1
  store i64 %1, i64* %polly.subfn.storeaddr.height.i360, align 8
  %polly.subfn.storeaddr.call.i361 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i348, i64 0, i32 2
  store i64* %call.i351, i64** %polly.subfn.storeaddr.call.i361, align 8
  %14 = add nsw i64 %polly.fdiv_q.shr.i358, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %13, i32 0, i64 0, i64 %14, i64 1) #9
  call void @init_polly_subfn(i8* %13) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %13) #9
  br label %init.exit363

init.exit363:                                     ; preds = %init.exit, %polly.parallel.for.i362
  %call.i.i353 = tail call noalias i8* @malloc(i64 32) #9
  %15 = bitcast i8* %call.i.i353 to %struct.Matrix*
  %data_size1.i.i354 = getelementptr inbounds i8, i8* %call.i.i353, i64 8
  %16 = bitcast i8* %data_size1.i.i354 to i64*
  store i64 %mul.i, i64* %16, align 8, !tbaa !1
  %data2.i.i355 = bitcast i8* %call.i.i353 to i64**
  store i64* %call.i351, i64** %data2.i.i355, align 8, !tbaa !7
  %height3.i.i356 = getelementptr inbounds i8, i8* %call.i.i353, i64 24
  %17 = bitcast i8* %height3.i.i356 to i64*
  store i64 %1, i64* %17, align 8, !tbaa !11
  %width4.i.i357 = getelementptr inbounds i8, i8* %call.i.i353, i64 16
  %18 = bitcast i8* %width4.i.i357 to i64*
  store i64 %1, i64* %18, align 8, !tbaa !10
  %call40 = tail call %struct.Matrix* @mat_mult(%struct.Matrix* %8, i1 zeroext false, %struct.Matrix* %15, i1 zeroext false)
  %19 = load i64*, i64** %data2.i.i, align 8, !tbaa !7
  %sub47 = add nsw i64 %mul.i, -1
  %arrayidx48 = getelementptr inbounds i64, i64* %19, i64 %sub47
  %20 = load i64, i64* %arrayidx48, align 8, !tbaa !8
  %cmp50 = icmp eq i64 %20, %12
  br i1 %cmp50, label %blklab24, label %if.end53

if.end53:                                         ; preds = %init.exit363
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %21) #10
  tail call void @exit(i32 -1) #11
  unreachable

blklab24:                                         ; preds = %init.exit363
  %23 = load i64*, i64** %data2.i.i355, align 8, !tbaa !7
  %arrayidx61 = getelementptr inbounds i64, i64* %23, i64 %sub47
  %24 = load i64, i64* %arrayidx61, align 8, !tbaa !8
  %cmp63 = icmp eq i64 %24, %12
  br i1 %cmp63, label %blklab25, label %if.end66

if.end66:                                         ; preds = %blklab24
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %25) #10
  tail call void @exit(i32 -1) #11
  unreachable

blklab25:                                         ; preds = %blklab24
  %cmp68 = icmp eq i64 %1, 2000
  %data73 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call40, i64 0, i32 0
  %27 = load i64*, i64** %data73, align 8, !tbaa !7
  br i1 %cmp68, label %if.end71, label %if.then158

if.end71:                                         ; preds = %blklab25
  %arrayidx78 = getelementptr inbounds i64, i64* %27, i64 %sub47
  %28 = load i64, i64* %arrayidx78, align 8, !tbaa !8
  %cmp79 = icmp eq i64 %28, 3996001000
  br i1 %cmp79, label %if.then158, label %if.end82

if.end82:                                         ; preds = %if.end71
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !9
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %29) #10
  tail call void @exit(i32 -1) #11
  unreachable

if.then158:                                       ; preds = %blklab25, %if.end71
  %call88 = tail call i64* @create1DArray(i32 0, i32 27) #9
  %31 = bitcast i64* %call88 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %31, align 8, !tbaa !8
  %arrayidx91 = getelementptr inbounds i64, i64* %call88, i64 2
  %32 = bitcast i64* %arrayidx91 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %32, align 8, !tbaa !8
  %arrayidx93 = getelementptr inbounds i64, i64* %call88, i64 4
  %33 = bitcast i64* %arrayidx93 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %33, align 8, !tbaa !8
  %arrayidx95 = getelementptr inbounds i64, i64* %call88, i64 6
  %34 = bitcast i64* %arrayidx95 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %34, align 8, !tbaa !8
  %arrayidx97 = getelementptr inbounds i64, i64* %call88, i64 8
  %35 = bitcast i64* %arrayidx97 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %35, align 8, !tbaa !8
  %arrayidx99 = getelementptr inbounds i64, i64* %call88, i64 10
  %36 = bitcast i64* %arrayidx99 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %36, align 8, !tbaa !8
  %arrayidx101 = getelementptr inbounds i64, i64* %call88, i64 12
  %37 = bitcast i64* %arrayidx101 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %37, align 8, !tbaa !8
  %arrayidx103 = getelementptr inbounds i64, i64* %call88, i64 14
  %38 = bitcast i64* %arrayidx103 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %38, align 8, !tbaa !8
  %arrayidx105 = getelementptr inbounds i64, i64* %call88, i64 16
  %39 = bitcast i64* %arrayidx105 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %39, align 8, !tbaa !8
  %arrayidx107 = getelementptr inbounds i64, i64* %call88, i64 18
  %40 = bitcast i64* %arrayidx107 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %40, align 8, !tbaa !8
  %arrayidx109 = getelementptr inbounds i64, i64* %call88, i64 20
  %41 = bitcast i64* %arrayidx109 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %41, align 8, !tbaa !8
  %arrayidx111 = getelementptr inbounds i64, i64* %call88, i64 22
  %42 = bitcast i64* %arrayidx111 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %42, align 8, !tbaa !8
  %arrayidx113 = getelementptr inbounds i64, i64* %call88, i64 24
  %43 = bitcast i64* %arrayidx113 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %43, align 8, !tbaa !8
  %arrayidx115 = getelementptr inbounds i64, i64* %call88, i64 26
  store i64 32, i64* %arrayidx115, align 8, !tbaa !8
  tail call void @printf_s(i64* %call88, i64 27) #9
  %arrayidx122 = getelementptr inbounds i64, i64* %27, i64 %sub47
  %44 = load i64, i64* %arrayidx122, align 8, !tbaa !8
  %call123 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %44)
  %call128 = tail call i64* @create1DArray(i32 0, i32 25) #9
  %45 = bitcast i64* %call128 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %45, align 8, !tbaa !8
  %arrayidx131 = getelementptr inbounds i64, i64* %call128, i64 2
  %46 = bitcast i64* %arrayidx131 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %46, align 8, !tbaa !8
  %arrayidx133 = getelementptr inbounds i64, i64* %call128, i64 4
  %47 = bitcast i64* %arrayidx133 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %47, align 8, !tbaa !8
  %arrayidx135 = getelementptr inbounds i64, i64* %call128, i64 6
  %48 = bitcast i64* %arrayidx135 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %48, align 8, !tbaa !8
  %arrayidx137 = getelementptr inbounds i64, i64* %call128, i64 8
  %49 = bitcast i64* %arrayidx137 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %49, align 8, !tbaa !8
  %arrayidx139 = getelementptr inbounds i64, i64* %call128, i64 10
  %50 = bitcast i64* %arrayidx139 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %50, align 8, !tbaa !8
  %arrayidx141 = getelementptr inbounds i64, i64* %call128, i64 12
  %51 = bitcast i64* %arrayidx141 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %51, align 8, !tbaa !8
  %arrayidx143 = getelementptr inbounds i64, i64* %call128, i64 14
  %52 = bitcast i64* %arrayidx143 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %52, align 8, !tbaa !8
  %arrayidx145 = getelementptr inbounds i64, i64* %call128, i64 16
  %53 = bitcast i64* %arrayidx145 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %53, align 8, !tbaa !8
  %arrayidx147 = getelementptr inbounds i64, i64* %call128, i64 18
  %54 = bitcast i64* %arrayidx147 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %54, align 8, !tbaa !8
  %arrayidx149 = getelementptr inbounds i64, i64* %call128, i64 20
  %55 = bitcast i64* %arrayidx149 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %55, align 8, !tbaa !8
  %arrayidx151 = getelementptr inbounds i64, i64* %call128, i64 22
  %56 = bitcast i64* %arrayidx151 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %56, align 8, !tbaa !8
  %arrayidx153 = getelementptr inbounds i64, i64* %call128, i64 24
  store i64 101, i64* %arrayidx153, align 8, !tbaa !8
  tail call void @println_s(i64* %call128, i64 25) #9
  %phitmp = bitcast i64* %call128 to i8*
  %phitmp336 = bitcast i64* %call88 to i8*
  %phitmp337 = bitcast i64* %call10 to i8*
  %57 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %57) #9
  %58 = bitcast i8* %call.i.i to i8**
  %59 = load i8*, i8** %58, align 8, !tbaa !7
  tail call void @free(i8* %59) #9
  tail call void @free(i8* nonnull %call.i.i) #9
  %60 = bitcast i8* %call.i.i353 to i8**
  %61 = load i8*, i8** %60, align 8, !tbaa !7
  tail call void @free(i8* %61) #9
  tail call void @free(i8* nonnull %call.i.i353) #9
  %62 = bitcast %struct.Matrix* %call40 to i8**
  %63 = load i8*, i8** %62, align 8, !tbaa !7
  tail call void @free(i8* %63) #9
  %64 = bitcast %struct.Matrix* %call40 to i8*
  tail call void @free(i8* %64) #9
  tail call void @free(i8* %phitmp337) #9
  tail call void @free(i8* %phitmp336) #9
  tail call void @free(i8* %phitmp) #9
  br label %if.end204

if.end204:                                        ; preds = %entry, %if.then158
  tail call void @exit(i32 0) #11
  unreachable
}

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
  %polly.subfunc.arg.call30 = load i64*, i64** %8, align 8
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
  %p_add79.lcssa81.us = phi i64 [ %p_add79.us.3, %polly.loop_header38.us ], [ %scevgep.promoted80.us, %polly.loop_header28.us ]
  %polly.indvar42.us = phi i64 [ %polly.indvar_next43.us, %polly.loop_header38.us ], [ 0, %polly.loop_header28.us ]
  %44 = shl i64 %polly.indvar42.us, 2
  %45 = add i64 %42, %44
  %scevgep52.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %45
  %_p_scalar_53.us = load i64, i64* %scevgep52.us, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %scevgep54.us = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %45
  %_p_scalar_55.us = load i64, i64* %scevgep54.us, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !30
  %p_mul78.us = mul nsw i64 %_p_scalar_55.us, %_p_scalar_53.us
  %p_add79.us = add nsw i64 %p_mul78.us, %p_add79.lcssa81.us
  %46 = add i64 %45, 1
  %scevgep52.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %46
  %_p_scalar_53.us.1 = load i64, i64* %scevgep52.us.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %scevgep54.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %46
  %_p_scalar_55.us.1 = load i64, i64* %scevgep54.us.1, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !30
  %p_mul78.us.1 = mul nsw i64 %_p_scalar_55.us.1, %_p_scalar_53.us.1
  %p_add79.us.1 = add nsw i64 %p_mul78.us.1, %p_add79.us
  %47 = add i64 %45, 2
  %scevgep52.us.2 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %47
  %_p_scalar_53.us.2 = load i64, i64* %scevgep52.us.2, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %scevgep54.us.2 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %47
  %_p_scalar_55.us.2 = load i64, i64* %scevgep54.us.2, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !30
  %p_mul78.us.2 = mul nsw i64 %_p_scalar_55.us.2, %_p_scalar_53.us.2
  %p_add79.us.2 = add nsw i64 %p_mul78.us.2, %p_add79.us.1
  %48 = add i64 %45, 3
  %scevgep52.us.3 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %48
  %_p_scalar_53.us.3 = load i64, i64* %scevgep52.us.3, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !30
  %scevgep54.us.3 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %48
  %_p_scalar_55.us.3 = load i64, i64* %scevgep54.us.3, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !30
  %p_mul78.us.3 = mul nsw i64 %_p_scalar_55.us.3, %_p_scalar_53.us.3
  %p_add79.us.3 = add nsw i64 %p_mul78.us.3, %p_add79.us.2
  %polly.indvar_next43.us = add nuw nsw i64 %polly.indvar42.us, 1
  %polly.loop_cond45.us = icmp sgt i64 %polly.indvar42.us, %polly.adjust_ub44
  br i1 %polly.loop_cond45.us, label %polly.cond.loopexit.us, label %polly.loop_header38.us

polly.loop_header57.us:                           ; preds = %polly.loop_header57.us, %polly.loop_header57.us.preheader.new
  %p_add797482.us = phi i64 [ %p_add79.us.3, %polly.loop_header57.us.preheader.new ], [ %p_add7974.us.3, %polly.loop_header57.us ]
  %polly.indvar61.us = phi i64 [ 0, %polly.loop_header57.us.preheader.new ], [ %polly.indvar_next62.us.3, %polly.loop_header57.us ]
  %niter143 = phi i64 [ %unroll_iter142, %polly.loop_header57.us.preheader.new ], [ %niter143.nsub.3, %polly.loop_header57.us ]
  %49 = add i64 %41, %polly.indvar61.us
  %scevgep69.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %49
  %_p_scalar_70.us = load i64, i64* %scevgep69.us, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.us = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %49
  %_p_scalar_72.us = load i64, i64* %scevgep71.us, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul7873.us = mul nsw i64 %_p_scalar_72.us, %_p_scalar_70.us
  %p_add7974.us = add nsw i64 %p_mul7873.us, %p_add797482.us
  %polly.indvar_next62.us = or i64 %polly.indvar61.us, 1
  %50 = add i64 %41, %polly.indvar_next62.us
  %scevgep69.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %50
  %_p_scalar_70.us.1 = load i64, i64* %scevgep69.us.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %50
  %_p_scalar_72.us.1 = load i64, i64* %scevgep71.us.1, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul7873.us.1 = mul nsw i64 %_p_scalar_72.us.1, %_p_scalar_70.us.1
  %p_add7974.us.1 = add nsw i64 %p_mul7873.us.1, %p_add7974.us
  %polly.indvar_next62.us.1 = or i64 %polly.indvar61.us, 2
  %51 = add i64 %41, %polly.indvar_next62.us.1
  %scevgep69.us.2 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %51
  %_p_scalar_70.us.2 = load i64, i64* %scevgep69.us.2, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.us.2 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %51
  %_p_scalar_72.us.2 = load i64, i64* %scevgep71.us.2, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul7873.us.2 = mul nsw i64 %_p_scalar_72.us.2, %_p_scalar_70.us.2
  %p_add7974.us.2 = add nsw i64 %p_mul7873.us.2, %p_add7974.us.1
  %polly.indvar_next62.us.2 = or i64 %polly.indvar61.us, 3
  %52 = add i64 %41, %polly.indvar_next62.us.2
  %scevgep69.us.3 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %52
  %_p_scalar_70.us.3 = load i64, i64* %scevgep69.us.3, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.us.3 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %52
  %_p_scalar_72.us.3 = load i64, i64* %scevgep71.us.3, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul7873.us.3 = mul nsw i64 %_p_scalar_72.us.3, %_p_scalar_70.us.3
  %p_add7974.us.3 = add nsw i64 %p_mul7873.us.3, %p_add7974.us.2
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
  %p_add7974.us.lcssa.ph = phi i64 [ undef, %polly.loop_header57.us.preheader ], [ %p_add7974.us.3, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  %p_add797482.us.unr = phi i64 [ %p_add79.us.3, %polly.loop_header57.us.preheader ], [ %p_add7974.us.3, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  %polly.indvar61.us.unr = phi i64 [ 0, %polly.loop_header57.us.preheader ], [ %polly.indvar_next62.us.3, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  br i1 %lcmp.mod140, label %polly.merge.loopexit.us, label %polly.loop_header57.us.epil.preheader

polly.loop_header57.us.epil.preheader:            ; preds = %polly.merge.loopexit.us.unr-lcssa
  br label %polly.loop_header57.us.epil

polly.loop_header57.us.epil:                      ; preds = %polly.loop_header57.us.epil, %polly.loop_header57.us.epil.preheader
  %p_add797482.us.epil = phi i64 [ %p_add7974.us.epil, %polly.loop_header57.us.epil ], [ %p_add797482.us.unr, %polly.loop_header57.us.epil.preheader ]
  %polly.indvar61.us.epil = phi i64 [ %polly.indvar_next62.us.epil, %polly.loop_header57.us.epil ], [ %polly.indvar61.us.unr, %polly.loop_header57.us.epil.preheader ]
  %epil.iter139 = phi i64 [ %epil.iter139.sub, %polly.loop_header57.us.epil ], [ %xtraiter138, %polly.loop_header57.us.epil.preheader ]
  %53 = add i64 %41, %polly.indvar61.us.epil
  %scevgep69.us.epil = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %53
  %_p_scalar_70.us.epil = load i64, i64* %scevgep69.us.epil, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.us.epil = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %53
  %_p_scalar_72.us.epil = load i64, i64* %scevgep71.us.epil, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul7873.us.epil = mul nsw i64 %_p_scalar_72.us.epil, %_p_scalar_70.us.epil
  %p_add7974.us.epil = add nsw i64 %p_mul7873.us.epil, %p_add797482.us.epil
  %polly.indvar_next62.us.epil = add nuw nsw i64 %polly.indvar61.us.epil, 1
  %epil.iter139.sub = add i64 %epil.iter139, -1
  %epil.iter139.cmp = icmp eq i64 %epil.iter139.sub, 0
  br i1 %epil.iter139.cmp, label %polly.merge.loopexit.us.epilog-lcssa, label %polly.loop_header57.us.epil, !llvm.loop !33

polly.merge.loopexit.us.epilog-lcssa:             ; preds = %polly.loop_header57.us.epil
  br label %polly.merge.loopexit.us

polly.merge.loopexit.us:                          ; preds = %polly.merge.loopexit.us.unr-lcssa, %polly.merge.loopexit.us.epilog-lcssa
  %p_add7974.us.lcssa = phi i64 [ %p_add7974.us.lcssa.ph, %polly.merge.loopexit.us.unr-lcssa ], [ %p_add7974.us.epil, %polly.merge.loopexit.us.epilog-lcssa ]
  store i64 %p_add7974.us.lcssa, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
  br label %polly.merge.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header38.us
  store i64 %p_add79.us.3, i64* %scevgep.us, align 8, !alias.scope !24, !noalias !26
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
  %p_add7974.lcssa.ph = phi i64 [ undef, %polly.loop_header28 ], [ %p_add7974.3, %polly.merge.loopexit.unr-lcssa.loopexit ]
  %p_add797482.unr = phi i64 [ %scevgep67.promoted, %polly.loop_header28 ], [ %p_add7974.3, %polly.merge.loopexit.unr-lcssa.loopexit ]
  %polly.indvar61.unr = phi i64 [ 0, %polly.loop_header28 ], [ %polly.indvar_next62.3, %polly.merge.loopexit.unr-lcssa.loopexit ]
  br i1 %lcmp.mod, label %polly.merge.loopexit, label %polly.loop_header57.epil.preheader

polly.loop_header57.epil.preheader:               ; preds = %polly.merge.loopexit.unr-lcssa
  br label %polly.loop_header57.epil

polly.loop_header57.epil:                         ; preds = %polly.loop_header57.epil, %polly.loop_header57.epil.preheader
  %p_add797482.epil = phi i64 [ %p_add7974.epil, %polly.loop_header57.epil ], [ %p_add797482.unr, %polly.loop_header57.epil.preheader ]
  %polly.indvar61.epil = phi i64 [ %polly.indvar_next62.epil, %polly.loop_header57.epil ], [ %polly.indvar61.unr, %polly.loop_header57.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.sub, %polly.loop_header57.epil ], [ %xtraiter, %polly.loop_header57.epil.preheader ]
  %55 = add i64 %41, %polly.indvar61.epil
  %scevgep69.epil = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %55
  %_p_scalar_70.epil = load i64, i64* %scevgep69.epil, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.epil = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %55
  %_p_scalar_72.epil = load i64, i64* %scevgep71.epil, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul7873.epil = mul nsw i64 %_p_scalar_72.epil, %_p_scalar_70.epil
  %p_add7974.epil = add nsw i64 %p_mul7873.epil, %p_add797482.epil
  %polly.indvar_next62.epil = add nuw nsw i64 %polly.indvar61.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %polly.merge.loopexit.epilog-lcssa, label %polly.loop_header57.epil, !llvm.loop !34

polly.merge.loopexit.epilog-lcssa:                ; preds = %polly.loop_header57.epil
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.merge.loopexit.unr-lcssa, %polly.merge.loopexit.epilog-lcssa
  %p_add7974.lcssa = phi i64 [ %p_add7974.lcssa.ph, %polly.merge.loopexit.unr-lcssa ], [ %p_add7974.epil, %polly.merge.loopexit.epilog-lcssa ]
  store i64 %p_add7974.lcssa, i64* %scevgep67, align 8, !alias.scope !24, !noalias !26
  %polly.indvar_next33 = add nuw nsw i64 %polly.indvar32, 1
  %polly.loop_cond35 = icmp sgt i64 %polly.indvar32, %polly.adjust_ub34
  br i1 %polly.loop_cond35, label %polly.loop_exit30.loopexit136, label %polly.loop_header28

polly.loop_header57:                              ; preds = %polly.loop_header57, %polly.loop_header28.new
  %p_add797482 = phi i64 [ %scevgep67.promoted, %polly.loop_header28.new ], [ %p_add7974.3, %polly.loop_header57 ]
  %polly.indvar61 = phi i64 [ 0, %polly.loop_header28.new ], [ %polly.indvar_next62.3, %polly.loop_header57 ]
  %niter = phi i64 [ %unroll_iter, %polly.loop_header28.new ], [ %niter.nsub.3, %polly.loop_header57 ]
  %56 = add i64 %41, %polly.indvar61
  %scevgep69 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %56
  %_p_scalar_70 = load i64, i64* %scevgep69, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %56
  %_p_scalar_72 = load i64, i64* %scevgep71, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul7873 = mul nsw i64 %_p_scalar_72, %_p_scalar_70
  %p_add7974 = add nsw i64 %p_mul7873, %p_add797482
  %polly.indvar_next62 = or i64 %polly.indvar61, 1
  %57 = add i64 %41, %polly.indvar_next62
  %scevgep69.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %57
  %_p_scalar_70.1 = load i64, i64* %scevgep69.1, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.1 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %57
  %_p_scalar_72.1 = load i64, i64* %scevgep71.1, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul7873.1 = mul nsw i64 %_p_scalar_72.1, %_p_scalar_70.1
  %p_add7974.1 = add nsw i64 %p_mul7873.1, %p_add7974
  %polly.indvar_next62.1 = or i64 %polly.indvar61, 2
  %58 = add i64 %41, %polly.indvar_next62.1
  %scevgep69.2 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %58
  %_p_scalar_70.2 = load i64, i64* %scevgep69.2, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.2 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %58
  %_p_scalar_72.2 = load i64, i64* %scevgep71.2, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul7873.2 = mul nsw i64 %_p_scalar_72.2, %_p_scalar_70.2
  %p_add7974.2 = add nsw i64 %p_mul7873.2, %p_add7974.1
  %polly.indvar_next62.2 = or i64 %polly.indvar61, 3
  %59 = add i64 %41, %polly.indvar_next62.2
  %scevgep69.3 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %59
  %_p_scalar_70.3 = load i64, i64* %scevgep69.3, align 8, !alias.scope !27, !noalias !29, !llvm.mem.parallel_loop_access !32
  %scevgep71.3 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %59
  %_p_scalar_72.3 = load i64, i64* %scevgep71.3, align 8, !alias.scope !28, !noalias !31, !llvm.mem.parallel_loop_access !32
  %p_mul7873.3 = mul nsw i64 %_p_scalar_72.3, %_p_scalar_70.3
  %p_add7974.3 = add nsw i64 %p_mul7873.3, %p_add7974.2
  %polly.indvar_next62.3 = add nsw i64 %polly.indvar61, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %polly.merge.loopexit.unr-lcssa.loopexit, label %polly.loop_header57, !llvm.loop !32
}

define internal void @mat_mult_polly_subfn_8(i8* nocapture readonly %polly.par.userContext) #7 {
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
  %polly.subfunc.arg.call30 = load i64*, i64** %6, align 8
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
  %scevgep35.us = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %36
  store i64 %_p_scalar_.us, i64* %scevgep35.us, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !39
  %37 = or i64 %33, 1
  %38 = add i64 %37, %31
  %scevgep.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %38
  %_p_scalar_.us.1 = load i64, i64* %scevgep.us.1, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !39
  %39 = mul i64 %37, %polly.subfunc.arg.
  %40 = add i64 %39, %30
  %scevgep35.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %40
  store i64 %_p_scalar_.us.1, i64* %scevgep35.us.1, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !39
  %41 = or i64 %33, 2
  %42 = add i64 %41, %31
  %scevgep.us.2 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %42
  %_p_scalar_.us.2 = load i64, i64* %scevgep.us.2, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !39
  %43 = mul i64 %41, %polly.subfunc.arg.
  %44 = add i64 %43, %30
  %scevgep35.us.2 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %44
  store i64 %_p_scalar_.us.2, i64* %scevgep35.us.2, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !39
  %45 = or i64 %33, 3
  %46 = add i64 %45, %31
  %scevgep.us.3 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %46
  %_p_scalar_.us.3 = load i64, i64* %scevgep.us.3, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !39
  %47 = mul i64 %45, %polly.subfunc.arg.
  %48 = add i64 %47, %30
  %scevgep35.us.3 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %48
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
  %scevgep49.us = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %52
  store i64 %_p_scalar_48.us, i64* %scevgep49.us, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !41
  %polly.indvar_next42.us = or i64 %polly.indvar41.us, 1
  %53 = add nuw nsw i64 %polly.indvar_next42.us, %12
  %54 = add i64 %53, %31
  %scevgep47.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %54
  %_p_scalar_48.us.1 = load i64, i64* %scevgep47.us.1, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !41
  %55 = mul i64 %53, %polly.subfunc.arg.
  %56 = add i64 %55, %30
  %scevgep49.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %56
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
  %scevgep49.us.epil = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %60
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
  %scevgep49.epil = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %66
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
  %scevgep49 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %70
  store i64 %_p_scalar_48, i64* %scevgep49, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !41
  %polly.indvar_next42 = or i64 %polly.indvar41, 1
  %71 = add nuw nsw i64 %polly.indvar_next42, %12
  %72 = add i64 %71, %62
  %scevgep47.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %72
  %_p_scalar_48.1 = load i64, i64* %scevgep47.1, align 8, !alias.scope !35, !noalias !37, !llvm.mem.parallel_loop_access !41
  %73 = mul i64 %71, %polly.subfunc.arg.
  %74 = add i64 %73, %61
  %scevgep49.1 = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %74
  store i64 %_p_scalar_48.1, i64* %scevgep49.1, align 8, !alias.scope !38, !noalias !40, !llvm.mem.parallel_loop_access !41
  %polly.indvar_next42.1 = add nsw i64 %polly.indvar41, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %polly.merge.unr-lcssa.loopexit, label %polly.loop_header37, !llvm.loop !43
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #9

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "polly.skip.fn" }
attributes #8 = { nounwind readnone }
attributes #9 = { nounwind }
attributes #10 = { cold }
attributes #11 = { noreturn nounwind }

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
!28 = distinct !{!28, !25, !"polly.alias.scope.call30"}
!29 = !{!28, !24}
!30 = distinct !{!30}
!31 = !{!27, !24}
!32 = distinct !{!32}
!33 = distinct !{!33, !16}
!34 = distinct !{!34, !16}
!35 = distinct !{!35, !36, !"polly.alias.scope."}
!36 = distinct !{!36, !"polly.alias.scope.domain"}
!37 = !{!38}
!38 = distinct !{!38, !36, !"polly.alias.scope.call30"}
!39 = distinct !{!39}
!40 = !{!35}
!41 = distinct !{!41}
!42 = distinct !{!42, !13, !14}
!43 = distinct !{!43, !13, !14}
