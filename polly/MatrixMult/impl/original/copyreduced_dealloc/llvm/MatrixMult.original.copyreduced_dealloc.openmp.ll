; ModuleID = 'MatrixMult_original.c'
source_filename = "MatrixMult_original.c"
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
  %cmp83 = icmp sgt i64 %height, 0
  br i1 %cmp83, label %polly.parallel.for, label %if.end24

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
  %cmp192 = icmp sgt i64 %1, 0
  br i1 %cmp192, label %polly.split_new_and_old, label %if.end62

polly.split_new_and_old:                          ; preds = %entry
  %4 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %1, i64 1)
  %.obit = extractvalue { i64, i1 } %4, 1
  %.res = extractvalue { i64, i1 } %4, 0
  %polly.access.mul. = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %0)
  %polly.access.mul..obit = extractvalue { i64, i1 } %polly.access.mul., 1
  %polly.overflow.state197 = or i1 %.obit, %polly.access.mul..obit
  %polly.access.mul..res = extractvalue { i64, i1 } %polly.access.mul., 0
  %polly.access.add. = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res, i64 %0)
  %polly.access.add..obit = extractvalue { i64, i1 } %polly.access.add., 1
  %polly.access.add..res = extractvalue { i64, i1 } %polly.access.add., 0
  %polly.access. = getelementptr i64, i64* %2, i64 %polly.access.add..res
  %polly.overflow.state200 = or i1 %polly.overflow.state197, %polly.access.add..obit
  %5 = icmp ule i64* %polly.access., %call
  %polly.access.call212 = getelementptr i64, i64* %call, i64 %polly.access.add..res
  %6 = icmp ule i64* %polly.access.call212, %2
  %7 = or i1 %5, %6
  %8 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %0, i64 1)
  %.obit222 = extractvalue { i64, i1 } %8, 1
  %polly.overflow.state223 = or i1 %.obit222, %polly.overflow.state200
  %.res224 = extractvalue { i64, i1 } %8, 0
  %polly.access.mul.225 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res224, i64 %0)
  %polly.access.mul..obit226 = extractvalue { i64, i1 } %polly.access.mul.225, 1
  %polly.overflow.state227 = or i1 %polly.access.mul..obit226, %polly.overflow.state223
  %polly.access.mul..res228 = extractvalue { i64, i1 } %polly.access.mul.225, 0
  %polly.access.add.229 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul..res228, i64 %0)
  %polly.access.add..obit230 = extractvalue { i64, i1 } %polly.access.add.229, 1
  %polly.access.add..res232 = extractvalue { i64, i1 } %polly.access.add.229, 0
  %polly.access.233 = getelementptr i64, i64* %3, i64 %polly.access.add..res232
  %polly.overflow.state240 = or i1 %polly.access.add..obit230, %polly.overflow.state227
  %9 = icmp ule i64* %polly.access.233, %call
  %polly.overflow.state244 = or i1 %.obit, %polly.overflow.state240
  %polly.overflow.state248 = or i1 %polly.access.mul..obit, %polly.overflow.state244
  %polly.overflow.state261 = or i1 %polly.access.add..obit, %polly.overflow.state248
  %10 = icmp ule i64* %polly.access.call212, %3
  %11 = or i1 %9, %10
  %12 = and i1 %7, %11
  %polly.rtc.overflown = xor i1 %polly.overflow.state261, true
  %polly.rtc.result = and i1 %12, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.parallel.for, label %while.cond33.preheader.preheader

while.cond33.preheader.preheader:                 ; preds = %polly.split_new_and_old
  %cmp35189 = icmp sgt i64 %0, 0
  br i1 %cmp35189, label %while.cond33.preheader.us.preheader, label %if.end62

while.cond33.preheader.us.preheader:              ; preds = %while.cond33.preheader.preheader
  %xtraiter = and i64 %0, 1
  %13 = icmp eq i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %unroll_iter = sub i64 %0, %xtraiter
  br label %while.cond33.preheader.us

while.cond33.preheader.us:                        ; preds = %while.cond33.preheader.us.preheader, %blklab15.loopexit.us-lcssa.us.us
  %i.0193.us = phi i64 [ %add59.us, %blklab15.loopexit.us-lcssa.us.us ], [ 0, %while.cond33.preheader.us.preheader ]
  %mul45.us = mul nsw i64 %i.0193.us, %0
  br label %while.cond39.preheader.us.us

while.cond39.preheader.us.us:                     ; preds = %while.cond33.preheader.us, %blklab17.loopexit.us.us
  %j.0190.us.us = phi i64 [ %add58.us.us, %blklab17.loopexit.us.us ], [ 0, %while.cond33.preheader.us ]
  %add.us.us = add nsw i64 %j.0190.us.us, %mul45.us
  %arrayidx.us.us = getelementptr inbounds i64, i64* %call, i64 %add.us.us
  %.pre = load i64, i64* %arrayidx.us.us, align 8, !tbaa !8
  br i1 %13, label %blklab17.loopexit.us.us.unr-lcssa, label %while.cond39.preheader.us.us.new

while.cond39.preheader.us.us.new:                 ; preds = %while.cond39.preheader.us.us
  br label %if.end44.us.us

blklab17.loopexit.us.us.unr-lcssa.loopexit:       ; preds = %if.end44.us.us
  br label %blklab17.loopexit.us.us.unr-lcssa

blklab17.loopexit.us.us.unr-lcssa:                ; preds = %blklab17.loopexit.us.us.unr-lcssa.loopexit, %while.cond39.preheader.us.us
  %.unr = phi i64 [ %.pre, %while.cond39.preheader.us.us ], [ %add53.us.us.1, %blklab17.loopexit.us.us.unr-lcssa.loopexit ]
  %k.0188.us.us.unr = phi i64 [ 0, %while.cond39.preheader.us.us ], [ %add57.us.us.1, %blklab17.loopexit.us.us.unr-lcssa.loopexit ]
  br i1 %lcmp.mod, label %blklab17.loopexit.us.us, label %if.end44.us.us.epil.preheader

if.end44.us.us.epil.preheader:                    ; preds = %blklab17.loopexit.us.us.unr-lcssa
  br label %if.end44.us.us.epil

if.end44.us.us.epil:                              ; preds = %if.end44.us.us.epil.preheader
  %add47.us.us.epil = add nsw i64 %k.0188.us.us.unr, %mul45.us
  %arrayidx48.us.us.epil = getelementptr inbounds i64, i64* %2, i64 %add47.us.us.epil
  %14 = load i64, i64* %arrayidx48.us.us.epil, align 8, !tbaa !8
  %mul49.us.us.epil = mul nsw i64 %k.0188.us.us.unr, %0
  %add50.us.us.epil = add nsw i64 %mul49.us.us.epil, %j.0190.us.us
  %arrayidx51.us.us.epil = getelementptr inbounds i64, i64* %3, i64 %add50.us.us.epil
  %15 = load i64, i64* %arrayidx51.us.us.epil, align 8, !tbaa !8
  %mul52.us.us.epil = mul nsw i64 %15, %14
  %add53.us.us.epil = add nsw i64 %mul52.us.us.epil, %.unr
  store i64 %add53.us.us.epil, i64* %arrayidx.us.us, align 8, !tbaa !8
  br label %blklab17.loopexit.us.us.epilog-lcssa

blklab17.loopexit.us.us.epilog-lcssa:             ; preds = %if.end44.us.us.epil
  br label %blklab17.loopexit.us.us

blklab17.loopexit.us.us:                          ; preds = %blklab17.loopexit.us.us.unr-lcssa, %blklab17.loopexit.us.us.epilog-lcssa
  %add58.us.us = add nuw nsw i64 %j.0190.us.us, 1
  %exitcond195.us.us = icmp eq i64 %add58.us.us, %0
  br i1 %exitcond195.us.us, label %blklab15.loopexit.us-lcssa.us.us, label %while.cond39.preheader.us.us

if.end44.us.us:                                   ; preds = %if.end44.us.us, %while.cond39.preheader.us.us.new
  %16 = phi i64 [ %.pre, %while.cond39.preheader.us.us.new ], [ %add53.us.us.1, %if.end44.us.us ]
  %k.0188.us.us = phi i64 [ 0, %while.cond39.preheader.us.us.new ], [ %add57.us.us.1, %if.end44.us.us ]
  %niter = phi i64 [ %unroll_iter, %while.cond39.preheader.us.us.new ], [ %niter.nsub.1, %if.end44.us.us ]
  %add47.us.us = add nsw i64 %k.0188.us.us, %mul45.us
  %arrayidx48.us.us = getelementptr inbounds i64, i64* %2, i64 %add47.us.us
  %17 = load i64, i64* %arrayidx48.us.us, align 8, !tbaa !8
  %mul49.us.us = mul nsw i64 %k.0188.us.us, %0
  %add50.us.us = add nsw i64 %mul49.us.us, %j.0190.us.us
  %arrayidx51.us.us = getelementptr inbounds i64, i64* %3, i64 %add50.us.us
  %18 = load i64, i64* %arrayidx51.us.us, align 8, !tbaa !8
  %mul52.us.us = mul nsw i64 %18, %17
  %add53.us.us = add nsw i64 %mul52.us.us, %16
  store i64 %add53.us.us, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add57.us.us = or i64 %k.0188.us.us, 1
  %add47.us.us.1 = add nsw i64 %add57.us.us, %mul45.us
  %arrayidx48.us.us.1 = getelementptr inbounds i64, i64* %2, i64 %add47.us.us.1
  %19 = load i64, i64* %arrayidx48.us.us.1, align 8, !tbaa !8
  %mul49.us.us.1 = mul nsw i64 %add57.us.us, %0
  %add50.us.us.1 = add nsw i64 %mul49.us.us.1, %j.0190.us.us
  %arrayidx51.us.us.1 = getelementptr inbounds i64, i64* %3, i64 %add50.us.us.1
  %20 = load i64, i64* %arrayidx51.us.us.1, align 8, !tbaa !8
  %mul52.us.us.1 = mul nsw i64 %20, %19
  %add53.us.us.1 = add nsw i64 %mul52.us.us.1, %add53.us.us
  store i64 %add53.us.us.1, i64* %arrayidx.us.us, align 8, !tbaa !8
  %add57.us.us.1 = add nsw i64 %k.0188.us.us, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %blklab17.loopexit.us.us.unr-lcssa.loopexit, label %if.end44.us.us

blklab15.loopexit.us-lcssa.us.us:                 ; preds = %blklab17.loopexit.us.us
  %add59.us = add nuw nsw i64 %i.0193.us, 1
  %exitcond196.us = icmp eq i64 %add59.us, %1
  br i1 %exitcond196.us, label %if.end62.loopexit, label %while.cond33.preheader.us

if.end62.loopexit:                                ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %if.end62

if.end62:                                         ; preds = %if.end62.loopexit, %while.cond33.preheader.preheader, %polly.parallel.for, %entry
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
  br i1 %a_dealloc, label %if.then65, label %if.end66

if.then65:                                        ; preds = %if.end62
  %25 = bitcast %struct.Matrix* %a to i8**
  %26 = load i8*, i8** %25, align 8, !tbaa !7
  tail call void @free(i8* %26) #9
  %27 = bitcast %struct.Matrix* %a to i8*
  tail call void @free(i8* %27) #9
  br label %if.end66

if.end66:                                         ; preds = %if.then65, %if.end62
  br i1 %b_dealloc, label %if.then68, label %if.end90

if.then68:                                        ; preds = %if.end66
  %28 = bitcast %struct.Matrix* %b to i8**
  %29 = load i8*, i8** %28, align 8, !tbaa !7
  tail call void @free(i8* %29) #9
  %30 = bitcast %struct.Matrix* %b to i8*
  tail call void @free(i8* %30) #9
  br label %if.end90

if.end90:                                         ; preds = %if.end66, %if.then68
  ret %struct.Matrix* %21

polly.parallel.for:                               ; preds = %polly.split_new_and_old
  %31 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %31, 5
  %32 = bitcast { i64, i64, i64*, i64*, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 40, i8* %32)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %0, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.264 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64 %1, i64* %polly.subfn.storeaddr.264, align 8
  %polly.subfn.storeaddr.call = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %call, i64** %polly.subfn.storeaddr.call, align 8
  %polly.subfn.storeaddr.265 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 3
  store i64* %2, i64** %polly.subfn.storeaddr.265, align 8
  %polly.subfn.storeaddr.266 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 4
  store i64* %3, i64** %polly.subfn.storeaddr.266, align 8
  %33 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn, i8* %32, i32 0, i64 0, i64 %33, i64 1) #9
  call void @mat_mult_polly_subfn(i8* %32) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %32)
  br label %if.end62
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #5 {
entry:
  %polly.par.userContext.i285 = alloca { i64, i64, i64* }, align 8
  %polly.par.userContext.i = alloca { i64, i64, i64* }, align 8
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #9
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !9
  %call1 = tail call i64* @parseStringToInt(i64* %0) #9
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end162.critedge, label %if.end8

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
  %cmp83.i = icmp sgt i64 %1, 0
  br i1 %cmp83.i, label %polly.parallel.for.i, label %init.exit

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
  %call.i288 = tail call i64* @create1DArray(i32 0, i32 %conv1.i) #9
  br i1 %cmp83.i, label %polly.parallel.for.i299, label %if.then125

polly.parallel.for.i299:                          ; preds = %init.exit
  %12 = add nsw i64 %1, -1
  %polly.fdiv_q.shr.i295 = ashr i64 %12, 5
  %13 = bitcast { i64, i64, i64* }* %polly.par.userContext.i285 to i8*
  call void @llvm.lifetime.start(i64 24, i8* %13) #9
  %polly.subfn.storeaddr.width.i296 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i285, i64 0, i32 0
  store i64 %1, i64* %polly.subfn.storeaddr.width.i296, align 8
  %polly.subfn.storeaddr.height.i297 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i285, i64 0, i32 1
  store i64 %1, i64* %polly.subfn.storeaddr.height.i297, align 8
  %polly.subfn.storeaddr.call.i298 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext.i285, i64 0, i32 2
  store i64* %call.i288, i64** %polly.subfn.storeaddr.call.i298, align 8
  %14 = add nsw i64 %polly.fdiv_q.shr.i295, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %13, i32 0, i64 0, i64 %14, i64 1) #9
  call void @init_polly_subfn(i8* %13) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %13) #9
  br label %if.then125

if.then125:                                       ; preds = %polly.parallel.for.i299, %init.exit
  %call.i.i290 = tail call noalias i8* @malloc(i64 32) #9
  %15 = bitcast i8* %call.i.i290 to %struct.Matrix*
  %data_size1.i.i291 = getelementptr inbounds i8, i8* %call.i.i290, i64 8
  %16 = bitcast i8* %data_size1.i.i291 to i64*
  store i64 %mul.i, i64* %16, align 8, !tbaa !1
  %data2.i.i292 = bitcast i8* %call.i.i290 to i64**
  store i64* %call.i288, i64** %data2.i.i292, align 8, !tbaa !7
  %height3.i.i293 = getelementptr inbounds i8, i8* %call.i.i290, i64 24
  %17 = bitcast i8* %height3.i.i293 to i64*
  store i64 %1, i64* %17, align 8, !tbaa !11
  %width4.i.i294 = getelementptr inbounds i8, i8* %call.i.i290, i64 16
  %18 = bitcast i8* %width4.i.i294 to i64*
  store i64 %1, i64* %18, align 8, !tbaa !10
  %call46 = tail call %struct.Matrix* @mat_mult(%struct.Matrix* %8, i1 zeroext false, %struct.Matrix* %15, i1 zeroext false)
  %call56 = tail call i64* @create1DArray(i32 0, i32 27) #9
  %19 = bitcast i64* %call56 to <2 x i64>*
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %19, align 8, !tbaa !8
  %arrayidx59 = getelementptr inbounds i64, i64* %call56, i64 2
  %20 = bitcast i64* %arrayidx59 to <2 x i64>*
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %20, align 8, !tbaa !8
  %arrayidx61 = getelementptr inbounds i64, i64* %call56, i64 4
  %21 = bitcast i64* %arrayidx61 to <2 x i64>*
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %21, align 8, !tbaa !8
  %arrayidx63 = getelementptr inbounds i64, i64* %call56, i64 6
  %22 = bitcast i64* %arrayidx63 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %22, align 8, !tbaa !8
  %arrayidx65 = getelementptr inbounds i64, i64* %call56, i64 8
  %23 = bitcast i64* %arrayidx65 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %23, align 8, !tbaa !8
  %arrayidx67 = getelementptr inbounds i64, i64* %call56, i64 10
  %24 = bitcast i64* %arrayidx67 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %24, align 8, !tbaa !8
  %arrayidx69 = getelementptr inbounds i64, i64* %call56, i64 12
  %25 = bitcast i64* %arrayidx69 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %25, align 8, !tbaa !8
  %arrayidx71 = getelementptr inbounds i64, i64* %call56, i64 14
  %26 = bitcast i64* %arrayidx71 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %26, align 8, !tbaa !8
  %arrayidx73 = getelementptr inbounds i64, i64* %call56, i64 16
  %27 = bitcast i64* %arrayidx73 to <2 x i64>*
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %27, align 8, !tbaa !8
  %arrayidx75 = getelementptr inbounds i64, i64* %call56, i64 18
  %28 = bitcast i64* %arrayidx75 to <2 x i64>*
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %28, align 8, !tbaa !8
  %arrayidx77 = getelementptr inbounds i64, i64* %call56, i64 20
  %29 = bitcast i64* %arrayidx77 to <2 x i64>*
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %29, align 8, !tbaa !8
  %arrayidx79 = getelementptr inbounds i64, i64* %call56, i64 22
  %30 = bitcast i64* %arrayidx79 to <2 x i64>*
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %30, align 8, !tbaa !8
  %arrayidx81 = getelementptr inbounds i64, i64* %call56, i64 24
  %31 = bitcast i64* %arrayidx81 to <2 x i64>*
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %31, align 8, !tbaa !8
  %arrayidx83 = getelementptr inbounds i64, i64* %call56, i64 26
  store i64 32, i64* %arrayidx83, align 8, !tbaa !8
  tail call void @printf_s(i64* %call56, i64 27) #9
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call46, i64 0, i32 0
  %32 = load i64*, i64** %data, align 8, !tbaa !7
  %sub88 = add nsw i64 %mul.i, -1
  %arrayidx89 = getelementptr inbounds i64, i64* %32, i64 %sub88
  %33 = load i64, i64* %arrayidx89, align 8, !tbaa !8
  %call90 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %33)
  %call95 = tail call i64* @create1DArray(i32 0, i32 25) #9
  %34 = bitcast i64* %call95 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %34, align 8, !tbaa !8
  %arrayidx98 = getelementptr inbounds i64, i64* %call95, i64 2
  %35 = bitcast i64* %arrayidx98 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %35, align 8, !tbaa !8
  %arrayidx100 = getelementptr inbounds i64, i64* %call95, i64 4
  %36 = bitcast i64* %arrayidx100 to <2 x i64>*
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %36, align 8, !tbaa !8
  %arrayidx102 = getelementptr inbounds i64, i64* %call95, i64 6
  %37 = bitcast i64* %arrayidx102 to <2 x i64>*
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %37, align 8, !tbaa !8
  %arrayidx104 = getelementptr inbounds i64, i64* %call95, i64 8
  %38 = bitcast i64* %arrayidx104 to <2 x i64>*
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %38, align 8, !tbaa !8
  %arrayidx106 = getelementptr inbounds i64, i64* %call95, i64 10
  %39 = bitcast i64* %arrayidx106 to <2 x i64>*
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %39, align 8, !tbaa !8
  %arrayidx108 = getelementptr inbounds i64, i64* %call95, i64 12
  %40 = bitcast i64* %arrayidx108 to <2 x i64>*
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %40, align 8, !tbaa !8
  %arrayidx110 = getelementptr inbounds i64, i64* %call95, i64 14
  %41 = bitcast i64* %arrayidx110 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %41, align 8, !tbaa !8
  %arrayidx112 = getelementptr inbounds i64, i64* %call95, i64 16
  %42 = bitcast i64* %arrayidx112 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %42, align 8, !tbaa !8
  %arrayidx114 = getelementptr inbounds i64, i64* %call95, i64 18
  %43 = bitcast i64* %arrayidx114 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %43, align 8, !tbaa !8
  %arrayidx116 = getelementptr inbounds i64, i64* %call95, i64 20
  %44 = bitcast i64* %arrayidx116 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %44, align 8, !tbaa !8
  %arrayidx118 = getelementptr inbounds i64, i64* %call95, i64 22
  %45 = bitcast i64* %arrayidx118 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %45, align 8, !tbaa !8
  %arrayidx120 = getelementptr inbounds i64, i64* %call95, i64 24
  store i64 101, i64* %arrayidx120, align 8, !tbaa !8
  tail call void @println_s(i64* %call95, i64 25) #9
  %phitmp = bitcast i64* %call95 to i8*
  %phitmp280 = bitcast i64* %call56 to i8*
  %phitmp281 = bitcast i64* %call13 to i8*
  %46 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %46) #9
  %47 = bitcast i8* %call.i.i to i8**
  %48 = load i8*, i8** %47, align 8, !tbaa !7
  tail call void @free(i8* %48) #9
  tail call void @free(i8* %call.i.i) #9
  %49 = bitcast i8* %call.i.i290 to i8**
  %50 = load i8*, i8** %49, align 8, !tbaa !7
  tail call void @free(i8* %50) #9
  tail call void @free(i8* %call.i.i290) #9
  %51 = bitcast i64* %32 to i8*
  tail call void @free(i8* %51) #9
  %52 = bitcast %struct.Matrix* %call46 to i8*
  tail call void @free(i8* %52) #9
  tail call void @free2DArray(i64** %call, i64 %conv) #9
  tail call void @free(i8* %phitmp281) #9
  tail call void @free(i8* %phitmp280) #9
  tail call void @free(i8* %phitmp) #9
  br label %if.end162

if.end162.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #9
  br label %if.end162

if.end162:                                        ; preds = %if.end162.critedge, %if.then125
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
  %exitcond48.us = icmp eq i64 %polly.indvar_next39.us, %7
  br i1 %exitcond48.us, label %polly.merge.us.loopexit, label %polly.loop_header34.us, !llvm.loop !16

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
  %_p_scalar_45 = load i64, i64* %scevgep44, align 8, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !15
  %p_add1646 = add nsw i64 %_p_scalar_45, %45
  store i64 %p_add1646, i64* %scevgep44, align 8, !alias.scope !12, !noalias !14, !llvm.mem.parallel_loop_access !15
  %polly.indvar_next39 = add nuw nsw i64 %polly.indvar38, 1
  %exitcond48 = icmp eq i64 %polly.indvar_next39, %7
  br i1 %exitcond48, label %polly.merge, label %polly.loop_header34, !llvm.loop !20
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
  %xtraiter187 = and i64 %polly.subfunc.arg., 1
  %17 = icmp eq i64 %16, 0
  %lcmp.mod188 = icmp eq i64 %xtraiter187, 0
  %unroll_iter189 = sub nsw i64 %11, %xtraiter187
  %xtraiter = and i64 %polly.subfunc.arg., 1
  %18 = icmp eq i64 %16, 0
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %unroll_iter = sub nsw i64 %11, %xtraiter
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit7
  %19 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.lr.ph, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit7, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit7 ]
  br i1 %polly.loop_guard, label %polly.loop_header5.preheader, label %polly.loop_exit7

polly.loop_header5.preheader:                     ; preds = %polly.loop_header
  %21 = shl i64 %polly.indvar, 5
  %22 = sub nsw i64 %polly.subfunc.arg.2, %21
  %23 = add nsw i64 %22, -1
  %24 = icmp sgt i64 %23, 31
  %25 = select i1 %24, i64 31, i64 %23
  %polly.loop_guard23 = icmp sgt i64 %25, -1
  %polly.adjust_ub26 = add i64 %25, -1
  br label %polly.loop_header5

polly.loop_exit7.loopexit:                        ; preds = %polly.loop_exit14
  br label %polly.loop_exit7

polly.loop_exit7:                                 ; preds = %polly.loop_exit7.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header5:                               ; preds = %polly.loop_header5.preheader, %polly.loop_exit14
  %polly.indvar8 = phi i64 [ %polly.indvar_next9, %polly.loop_exit14 ], [ 0, %polly.loop_header5.preheader ]
  %26 = shl nsw i64 %polly.indvar8, 5
  %27 = sub nsw i64 %polly.subfunc.arg., %26
  %28 = add nsw i64 %27, -1
  %29 = icmp sgt i64 %28, 31
  %30 = select i1 %29, i64 31, i64 %28
  %polly.loop_guard32 = icmp sgt i64 %30, -1
  %polly.adjust_ub35 = add i64 %30, -1
  br label %polly.loop_header12

polly.loop_exit14:                                ; preds = %polly.loop_exit22
  %polly.indvar_next9 = add nuw nsw i64 %polly.indvar8, 1
  %exitcond79 = icmp eq i64 %polly.indvar8, %polly.fdiv_q.shr
  br i1 %exitcond79, label %polly.loop_exit7.loopexit, label %polly.loop_header5

polly.loop_header12:                              ; preds = %polly.loop_exit22, %polly.loop_header5
  %polly.indvar15 = phi i64 [ 0, %polly.loop_header5 ], [ %polly.indvar_next16, %polly.loop_exit22 ]
  br i1 %polly.loop_guard23, label %polly.loop_header20.preheader, label %polly.loop_exit22

polly.loop_header20.preheader:                    ; preds = %polly.loop_header12
  %31 = mul nsw i64 %polly.indvar15, -8
  %32 = add nsw i64 %14, %31
  %33 = icmp sgt i64 %32, 7
  %34 = select i1 %33, i64 7, i64 %32
  %polly.loop_guard42 = icmp sgt i64 %34, -1
  %35 = shl i64 %polly.indvar15, 5
  %36 = or i64 %35, 31
  %37 = icmp slt i64 %36, %polly.subfunc.arg.
  %or.cond = or i1 %polly.loop_guard61, %37
  %polly.adjust_ub45 = add i64 %34, -1
  br label %polly.loop_header20

polly.loop_exit22.loopexit:                       ; preds = %polly.loop_exit31
  br label %polly.loop_exit22

polly.loop_exit22:                                ; preds = %polly.loop_exit22.loopexit, %polly.loop_header12
  %polly.indvar_next16 = add nuw nsw i64 %polly.indvar15, 1
  %exitcond78 = icmp eq i64 %polly.indvar15, %13
  br i1 %exitcond78, label %polly.loop_exit14, label %polly.loop_header12

polly.loop_header20:                              ; preds = %polly.loop_header20.preheader, %polly.loop_exit31
  %polly.indvar24 = phi i64 [ %polly.indvar_next25, %polly.loop_exit31 ], [ 0, %polly.loop_header20.preheader ]
  br i1 %polly.loop_guard32, label %polly.loop_header29.preheader, label %polly.loop_exit31

polly.loop_header29.preheader:                    ; preds = %polly.loop_header20
  %38 = add nsw i64 %polly.indvar24, %21
  %39 = mul i64 %38, %polly.subfunc.arg.
  br i1 %polly.loop_guard42, label %polly.loop_header29.us.preheader, label %polly.loop_header29.preheader.split

polly.loop_header29.us.preheader:                 ; preds = %polly.loop_header29.preheader
  br label %polly.loop_header29.us

polly.loop_header29.us:                           ; preds = %polly.loop_header29.us.preheader, %polly.merge.us
  %polly.indvar33.us = phi i64 [ %polly.indvar_next34.us, %polly.merge.us ], [ 0, %polly.loop_header29.us.preheader ]
  %40 = add nuw nsw i64 %polly.indvar33.us, %26
  %41 = add i64 %40, %39
  %scevgep.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %41
  %scevgep.promoted81.us = load i64, i64* %scevgep.us, align 8, !alias.scope !21, !noalias !23
  br label %polly.loop_header39.us

polly.loop_header39.us:                           ; preds = %polly.loop_header29.us, %polly.loop_header39.us
  %p_add53.lcssa82.us = phi i64 [ %p_add53.us.3, %polly.loop_header39.us ], [ %scevgep.promoted81.us, %polly.loop_header29.us ]
  %polly.indvar43.us = phi i64 [ %polly.indvar_next44.us, %polly.loop_header39.us ], [ 0, %polly.loop_header29.us ]
  %42 = shl i64 %polly.indvar43.us, 2
  %43 = add nuw nsw i64 %42, %35
  %44 = add i64 %43, %39
  %scevgep53.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %44
  %_p_scalar_54.us = load i64, i64* %scevgep53.us, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !27
  %45 = mul i64 %43, %polly.subfunc.arg.
  %46 = add i64 %45, %40
  %scevgep55.us = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %46
  %_p_scalar_56.us = load i64, i64* %scevgep55.us, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !27
  %p_mul52.us = mul nsw i64 %_p_scalar_56.us, %_p_scalar_54.us
  %p_add53.us = add nsw i64 %p_mul52.us, %p_add53.lcssa82.us
  %47 = or i64 %43, 1
  %48 = add i64 %47, %39
  %scevgep53.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %48
  %_p_scalar_54.us.1 = load i64, i64* %scevgep53.us.1, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !27
  %49 = mul i64 %47, %polly.subfunc.arg.
  %50 = add i64 %49, %40
  %scevgep55.us.1 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %50
  %_p_scalar_56.us.1 = load i64, i64* %scevgep55.us.1, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !27
  %p_mul52.us.1 = mul nsw i64 %_p_scalar_56.us.1, %_p_scalar_54.us.1
  %p_add53.us.1 = add nsw i64 %p_mul52.us.1, %p_add53.us
  %51 = or i64 %43, 2
  %52 = add i64 %51, %39
  %scevgep53.us.2 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %52
  %_p_scalar_54.us.2 = load i64, i64* %scevgep53.us.2, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !27
  %53 = mul i64 %51, %polly.subfunc.arg.
  %54 = add i64 %53, %40
  %scevgep55.us.2 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %54
  %_p_scalar_56.us.2 = load i64, i64* %scevgep55.us.2, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !27
  %p_mul52.us.2 = mul nsw i64 %_p_scalar_56.us.2, %_p_scalar_54.us.2
  %p_add53.us.2 = add nsw i64 %p_mul52.us.2, %p_add53.us.1
  %55 = or i64 %43, 3
  %56 = add i64 %55, %39
  %scevgep53.us.3 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %56
  %_p_scalar_54.us.3 = load i64, i64* %scevgep53.us.3, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !27
  %57 = mul i64 %55, %polly.subfunc.arg.
  %58 = add i64 %57, %40
  %scevgep55.us.3 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %58
  %_p_scalar_56.us.3 = load i64, i64* %scevgep55.us.3, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !27
  %p_mul52.us.3 = mul nsw i64 %_p_scalar_56.us.3, %_p_scalar_54.us.3
  %p_add53.us.3 = add nsw i64 %p_mul52.us.3, %p_add53.us.2
  %polly.indvar_next44.us = add nuw nsw i64 %polly.indvar43.us, 1
  %polly.loop_cond46.us = icmp sgt i64 %polly.indvar43.us, %polly.adjust_ub45
  br i1 %polly.loop_cond46.us, label %polly.cond.loopexit.us, label %polly.loop_header39.us

polly.loop_header58.us:                           ; preds = %polly.loop_header58.us, %polly.loop_header58.us.preheader.new
  %p_add537583.us = phi i64 [ %p_add53.us.3, %polly.loop_header58.us.preheader.new ], [ %p_add5375.us.1, %polly.loop_header58.us ]
  %polly.indvar62.us = phi i64 [ 0, %polly.loop_header58.us.preheader.new ], [ %polly.indvar_next63.us.1, %polly.loop_header58.us ]
  %niter190 = phi i64 [ %unroll_iter189, %polly.loop_header58.us.preheader.new ], [ %niter190.nsub.1, %polly.loop_header58.us ]
  %59 = add nuw nsw i64 %polly.indvar62.us, %15
  %60 = add i64 %59, %39
  %scevgep70.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %60
  %_p_scalar_71.us = load i64, i64* %scevgep70.us, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %61 = mul i64 %59, %polly.subfunc.arg.
  %62 = add i64 %61, %40
  %scevgep72.us = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %62
  %_p_scalar_73.us = load i64, i64* %scevgep72.us, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %p_mul5274.us = mul nsw i64 %_p_scalar_73.us, %_p_scalar_71.us
  %p_add5375.us = add nsw i64 %p_mul5274.us, %p_add537583.us
  %polly.indvar_next63.us = or i64 %polly.indvar62.us, 1
  %63 = add nuw nsw i64 %polly.indvar_next63.us, %15
  %64 = add i64 %63, %39
  %scevgep70.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %64
  %_p_scalar_71.us.1 = load i64, i64* %scevgep70.us.1, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %65 = mul i64 %63, %polly.subfunc.arg.
  %66 = add i64 %65, %40
  %scevgep72.us.1 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %66
  %_p_scalar_73.us.1 = load i64, i64* %scevgep72.us.1, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %p_mul5274.us.1 = mul nsw i64 %_p_scalar_73.us.1, %_p_scalar_71.us.1
  %p_add5375.us.1 = add nsw i64 %p_mul5274.us.1, %p_add5375.us
  %polly.indvar_next63.us.1 = add nsw i64 %polly.indvar62.us, 2
  %niter190.nsub.1 = add i64 %niter190, -2
  %niter190.ncmp.1 = icmp eq i64 %niter190.nsub.1, 0
  br i1 %niter190.ncmp.1, label %polly.merge.loopexit.us.unr-lcssa.loopexit, label %polly.loop_header58.us, !llvm.loop !30

polly.merge.us:                                   ; preds = %polly.merge.loopexit.us, %polly.cond.loopexit.us
  %polly.indvar_next34.us = add nuw nsw i64 %polly.indvar33.us, 1
  %polly.loop_cond36.us = icmp sgt i64 %polly.indvar33.us, %polly.adjust_ub35
  br i1 %polly.loop_cond36.us, label %polly.loop_exit31.loopexit, label %polly.loop_header29.us

polly.merge.loopexit.us.unr-lcssa.loopexit:       ; preds = %polly.loop_header58.us
  br label %polly.merge.loopexit.us.unr-lcssa

polly.merge.loopexit.us.unr-lcssa:                ; preds = %polly.merge.loopexit.us.unr-lcssa.loopexit, %polly.loop_header58.us.preheader
  %p_add5375.us.lcssa.ph = phi i64 [ undef, %polly.loop_header58.us.preheader ], [ %p_add5375.us.1, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  %p_add537583.us.unr = phi i64 [ %p_add53.us.3, %polly.loop_header58.us.preheader ], [ %p_add5375.us.1, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  %polly.indvar62.us.unr = phi i64 [ 0, %polly.loop_header58.us.preheader ], [ %polly.indvar_next63.us.1, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  br i1 %lcmp.mod188, label %polly.merge.loopexit.us, label %polly.loop_header58.us.epil.preheader

polly.loop_header58.us.epil.preheader:            ; preds = %polly.merge.loopexit.us.unr-lcssa
  br label %polly.loop_header58.us.epil

polly.loop_header58.us.epil:                      ; preds = %polly.loop_header58.us.epil.preheader
  %67 = add nuw nsw i64 %polly.indvar62.us.unr, %15
  br label %polly.merge.loopexit.us.epilog-lcssa

polly.merge.loopexit.us.epilog-lcssa:             ; preds = %polly.loop_header58.us.epil
  %68 = mul i64 %67, %polly.subfunc.arg.
  %69 = add i64 %68, %40
  %scevgep72.us.epil = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %69
  %_p_scalar_73.us.epil = load i64, i64* %scevgep72.us.epil, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %70 = add i64 %67, %39
  %scevgep70.us.epil = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %70
  %_p_scalar_71.us.epil = load i64, i64* %scevgep70.us.epil, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %p_mul5274.us.epil = mul nsw i64 %_p_scalar_73.us.epil, %_p_scalar_71.us.epil
  %p_add5375.us.epil = add nsw i64 %p_mul5274.us.epil, %p_add537583.us.unr
  br label %polly.merge.loopexit.us

polly.merge.loopexit.us:                          ; preds = %polly.merge.loopexit.us.unr-lcssa, %polly.merge.loopexit.us.epilog-lcssa
  %p_add5375.us.lcssa = phi i64 [ %p_add5375.us.lcssa.ph, %polly.merge.loopexit.us.unr-lcssa ], [ %p_add5375.us.epil, %polly.merge.loopexit.us.epilog-lcssa ]
  store i64 %p_add5375.us.lcssa, i64* %scevgep.us, align 8, !alias.scope !21, !noalias !23
  br label %polly.merge.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header39.us
  store i64 %p_add53.us.3, i64* %scevgep.us, align 8, !alias.scope !21, !noalias !23
  br i1 %or.cond, label %polly.merge.us, label %polly.loop_header58.us.preheader

polly.loop_header58.us.preheader:                 ; preds = %polly.cond.loopexit.us
  br i1 %17, label %polly.merge.loopexit.us.unr-lcssa, label %polly.loop_header58.us.preheader.new

polly.loop_header58.us.preheader.new:             ; preds = %polly.loop_header58.us.preheader
  br label %polly.loop_header58.us

polly.loop_header29.preheader.split:              ; preds = %polly.loop_header29.preheader
  br i1 %or.cond, label %polly.loop_exit31, label %polly.loop_header29.preheader185

polly.loop_header29.preheader185:                 ; preds = %polly.loop_header29.preheader.split
  br label %polly.loop_header29

polly.loop_exit31.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit31

polly.loop_exit31.loopexit186:                    ; preds = %polly.merge.loopexit
  br label %polly.loop_exit31

polly.loop_exit31:                                ; preds = %polly.loop_exit31.loopexit186, %polly.loop_exit31.loopexit, %polly.loop_header29.preheader.split, %polly.loop_header20
  %polly.indvar_next25 = add nuw nsw i64 %polly.indvar24, 1
  %polly.loop_cond27 = icmp sgt i64 %polly.indvar24, %polly.adjust_ub26
  br i1 %polly.loop_cond27, label %polly.loop_exit22.loopexit, label %polly.loop_header20

polly.loop_header29:                              ; preds = %polly.loop_header29.preheader185, %polly.merge.loopexit
  %polly.indvar33 = phi i64 [ %polly.indvar_next34, %polly.merge.loopexit ], [ 0, %polly.loop_header29.preheader185 ]
  %71 = add nuw nsw i64 %polly.indvar33, %26
  %72 = add i64 %71, %39
  %scevgep68 = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %72
  %scevgep68.promoted = load i64, i64* %scevgep68, align 8, !alias.scope !21, !noalias !23
  br i1 %18, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header29.new

polly.loop_header29.new:                          ; preds = %polly.loop_header29
  br label %polly.loop_header58

polly.merge.loopexit.unr-lcssa.loopexit:          ; preds = %polly.loop_header58
  br label %polly.merge.loopexit.unr-lcssa

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.merge.loopexit.unr-lcssa.loopexit, %polly.loop_header29
  %p_add5375.lcssa.ph = phi i64 [ undef, %polly.loop_header29 ], [ %p_add5375.1, %polly.merge.loopexit.unr-lcssa.loopexit ]
  %p_add537583.unr = phi i64 [ %scevgep68.promoted, %polly.loop_header29 ], [ %p_add5375.1, %polly.merge.loopexit.unr-lcssa.loopexit ]
  %polly.indvar62.unr = phi i64 [ 0, %polly.loop_header29 ], [ %polly.indvar_next63.1, %polly.merge.loopexit.unr-lcssa.loopexit ]
  br i1 %lcmp.mod, label %polly.merge.loopexit, label %polly.loop_header58.epil.preheader

polly.loop_header58.epil.preheader:               ; preds = %polly.merge.loopexit.unr-lcssa
  br label %polly.loop_header58.epil

polly.loop_header58.epil:                         ; preds = %polly.loop_header58.epil.preheader
  %73 = add nuw nsw i64 %polly.indvar62.unr, %15
  br label %polly.merge.loopexit.epilog-lcssa

polly.merge.loopexit.epilog-lcssa:                ; preds = %polly.loop_header58.epil
  %74 = mul i64 %73, %polly.subfunc.arg.
  %75 = add i64 %74, %71
  %scevgep72.epil = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %75
  %_p_scalar_73.epil = load i64, i64* %scevgep72.epil, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %76 = add i64 %73, %39
  %scevgep70.epil = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %76
  %_p_scalar_71.epil = load i64, i64* %scevgep70.epil, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %p_mul5274.epil = mul nsw i64 %_p_scalar_73.epil, %_p_scalar_71.epil
  %p_add5375.epil = add nsw i64 %p_mul5274.epil, %p_add537583.unr
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.merge.loopexit.unr-lcssa, %polly.merge.loopexit.epilog-lcssa
  %p_add5375.lcssa = phi i64 [ %p_add5375.lcssa.ph, %polly.merge.loopexit.unr-lcssa ], [ %p_add5375.epil, %polly.merge.loopexit.epilog-lcssa ]
  store i64 %p_add5375.lcssa, i64* %scevgep68, align 8, !alias.scope !21, !noalias !23
  %polly.indvar_next34 = add nuw nsw i64 %polly.indvar33, 1
  %polly.loop_cond36 = icmp sgt i64 %polly.indvar33, %polly.adjust_ub35
  br i1 %polly.loop_cond36, label %polly.loop_exit31.loopexit186, label %polly.loop_header29

polly.loop_header58:                              ; preds = %polly.loop_header58, %polly.loop_header29.new
  %p_add537583 = phi i64 [ %scevgep68.promoted, %polly.loop_header29.new ], [ %p_add5375.1, %polly.loop_header58 ]
  %polly.indvar62 = phi i64 [ 0, %polly.loop_header29.new ], [ %polly.indvar_next63.1, %polly.loop_header58 ]
  %niter = phi i64 [ %unroll_iter, %polly.loop_header29.new ], [ %niter.nsub.1, %polly.loop_header58 ]
  %77 = add nuw nsw i64 %polly.indvar62, %15
  %78 = add i64 %77, %39
  %scevgep70 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %78
  %_p_scalar_71 = load i64, i64* %scevgep70, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %79 = mul i64 %77, %polly.subfunc.arg.
  %80 = add i64 %79, %71
  %scevgep72 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %80
  %_p_scalar_73 = load i64, i64* %scevgep72, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %p_mul5274 = mul nsw i64 %_p_scalar_73, %_p_scalar_71
  %p_add5375 = add nsw i64 %p_mul5274, %p_add537583
  %polly.indvar_next63 = or i64 %polly.indvar62, 1
  %81 = add nuw nsw i64 %polly.indvar_next63, %15
  %82 = add i64 %81, %39
  %scevgep70.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %82
  %_p_scalar_71.1 = load i64, i64* %scevgep70.1, align 8, !alias.scope !24, !noalias !26, !llvm.mem.parallel_loop_access !29
  %83 = mul i64 %81, %polly.subfunc.arg.
  %84 = add i64 %83, %71
  %scevgep72.1 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %84
  %_p_scalar_73.1 = load i64, i64* %scevgep72.1, align 8, !alias.scope !25, !noalias !28, !llvm.mem.parallel_loop_access !29
  %p_mul5274.1 = mul nsw i64 %_p_scalar_73.1, %_p_scalar_71.1
  %p_add5375.1 = add nsw i64 %p_mul5274.1, %p_add5375
  %polly.indvar_next63.1 = add nsw i64 %polly.indvar62, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %polly.merge.loopexit.unr-lcssa.loopexit, label %polly.loop_header58, !llvm.loop !31
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
!26 = !{!21, !25}
!27 = distinct !{!27}
!28 = !{!21, !24}
!29 = distinct !{!29}
!30 = distinct !{!30, !18, !19}
!31 = distinct !{!31, !18, !19}
