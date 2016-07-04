; ModuleID = 'NQueens_original.c'
source_filename = "NQueens_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.POS = type { i64, i64 }
%struct.NQueen = type { %struct.POS**, i64, i64 }

@.str.1 = private unnamed_addr constant [4 x i8] c" r:\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" c:\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c" queens:\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c" num_solutions:\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.POS* @copy_POS(%struct.POS* nocapture readonly %_POS) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 16) #6
  %0 = bitcast i8* %call to %struct.POS*
  %1 = bitcast %struct.POS* %_POS to <2 x i64>*
  %2 = load <2 x i64>, <2 x i64>* %1, align 8, !tbaa !1
  %3 = bitcast i8* %call to <2 x i64>*
  store <2 x i64> %2, <2 x i64>* %3, align 8, !tbaa !1
  ret %struct.POS* %0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define noalias %struct.POS** @copy_array_POS(%struct.POS** nocapture readonly %_POS, i64 %_POS_size) local_unnamed_addr #0 {
entry:
  %mul = shl i64 %_POS_size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %0 = bitcast i8* %call to %struct.POS**
  %cmp12 = icmp sgt i64 %_POS_size, 0
  br i1 %cmp12, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret %struct.POS** %0

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %_POS, i64 %indvars.iv
  %1 = bitcast %struct.POS** %arrayidx to <2 x i64>**
  %2 = load <2 x i64>*, <2 x i64>** %1, align 8, !tbaa !5
  %call.i = tail call noalias i8* @malloc(i64 16) #6
  %3 = load <2 x i64>, <2 x i64>* %2, align 8, !tbaa !1
  %4 = bitcast i8* %call.i to <2 x i64>*
  store <2 x i64> %3, <2 x i64>* %4, align 8, !tbaa !1
  %arrayidx4 = getelementptr inbounds %struct.POS*, %struct.POS** %0, i64 %indvars.iv
  %5 = bitcast %struct.POS** %arrayidx4 to i8**
  store i8* %call.i, i8** %5, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %_POS_size
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body
}

; Function Attrs: nounwind uwtable
define void @free_POS(%struct.POS* nocapture %pos) local_unnamed_addr #0 {
entry:
  %0 = bitcast %struct.POS* %pos to i8*
  tail call void @free(i8* %0) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define void @printf_POS(%struct.POS* nocapture readonly %pos) local_unnamed_addr #0 {
entry:
  %putchar = tail call i32 @putchar(i32 123) #6
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0))
  %r = getelementptr inbounds %struct.POS, %struct.POS* %pos, i64 0, i32 0
  %0 = load i64, i64* %r, align 8, !tbaa !7
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %0)
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0))
  %c = getelementptr inbounds %struct.POS, %struct.POS* %pos, i64 0, i32 1
  %1 = load i64, i64* %c, align 8, !tbaa !9
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %1)
  %putchar7 = tail call i32 @putchar(i32 125) #6
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define noalias %struct.NQueen* @copy_NQueen(%struct.NQueen* nocapture readonly %_NQueen) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 24) #6
  %0 = bitcast i8* %call to %struct.NQueen*
  %queens_size = getelementptr inbounds %struct.NQueen, %struct.NQueen* %_NQueen, i64 0, i32 1
  %1 = load i64, i64* %queens_size, align 8, !tbaa !10
  %mul = shl i64 %1, 3
  %call1 = tail call noalias i8* @malloc(i64 %mul) #6
  %2 = bitcast i8* %call to i8**
  store i8* %call1, i8** %2, align 8, !tbaa !12
  %cmp25 = icmp sgt i64 %1, 0
  %3 = bitcast i8* %call1 to %struct.POS**
  br i1 %cmp25, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %queens4 = getelementptr inbounds %struct.NQueen, %struct.NQueen* %_NQueen, i64 0, i32 0
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %queens_size10 = getelementptr inbounds i8, i8* %call, i64 8
  %4 = bitcast i8* %queens_size10 to i64*
  store i64 %1, i64* %4, align 8, !tbaa !10
  %num_solutions = getelementptr inbounds %struct.NQueen, %struct.NQueen* %_NQueen, i64 0, i32 2
  %5 = load i64, i64* %num_solutions, align 8, !tbaa !13
  %num_solutions11 = getelementptr inbounds i8, i8* %call, i64 16
  %6 = bitcast i8* %num_solutions11 to i64*
  store i64 %5, i64* %6, align 8, !tbaa !13
  ret %struct.NQueen* %0

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %7 = load %struct.POS**, %struct.POS*** %queens4, align 8, !tbaa !12
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %7, i64 %indvars.iv
  %8 = bitcast %struct.POS** %arrayidx to <2 x i64>**
  %9 = load <2 x i64>*, <2 x i64>** %8, align 8, !tbaa !5
  %call.i = tail call noalias i8* @malloc(i64 16) #6
  %10 = load <2 x i64>, <2 x i64>* %9, align 8, !tbaa !1
  %11 = bitcast i8* %call.i to <2 x i64>*
  store <2 x i64> %10, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx8 = getelementptr inbounds %struct.POS*, %struct.POS** %3, i64 %indvars.iv
  %12 = bitcast %struct.POS** %arrayidx8 to i8**
  store i8* %call.i, i8** %12, align 8, !tbaa !5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %1
  br i1 %cmp, label %for.body, label %for.cond.cleanup.loopexit
}

; Function Attrs: nounwind uwtable
define noalias %struct.NQueen** @copy_array_NQueen(%struct.NQueen** nocapture readonly %_NQueen, i64 %_NQueen_size) local_unnamed_addr #0 {
entry:
  %mul = shl i64 %_NQueen_size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %0 = bitcast i8* %call to %struct.NQueen**
  %cmp12 = icmp sgt i64 %_NQueen_size, 0
  br i1 %cmp12, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %copy_NQueen.exit
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret %struct.NQueen** %0

for.body:                                         ; preds = %for.body.preheader, %copy_NQueen.exit
  %indvars.iv = phi i64 [ %indvars.iv.next, %copy_NQueen.exit ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.NQueen*, %struct.NQueen** %_NQueen, i64 %indvars.iv
  %1 = load %struct.NQueen*, %struct.NQueen** %arrayidx, align 8, !tbaa !5
  %call.i = tail call noalias i8* @malloc(i64 24) #6
  %queens_size.i = getelementptr inbounds %struct.NQueen, %struct.NQueen* %1, i64 0, i32 1
  %2 = load i64, i64* %queens_size.i, align 8, !tbaa !10
  %mul.i = shl i64 %2, 3
  %call1.i = tail call noalias i8* @malloc(i64 %mul.i) #6
  %3 = bitcast i8* %call.i to i8**
  store i8* %call1.i, i8** %3, align 8, !tbaa !12
  %cmp25.i = icmp sgt i64 %2, 0
  %4 = bitcast i8* %call1.i to %struct.POS**
  br i1 %cmp25.i, label %for.body.preheader.i, label %copy_NQueen.exit

for.body.preheader.i:                             ; preds = %for.body
  %queens4.i = getelementptr inbounds %struct.NQueen, %struct.NQueen* %1, i64 0, i32 0
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %for.body.preheader.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body.preheader.i ]
  %5 = load %struct.POS**, %struct.POS*** %queens4.i, align 8, !tbaa !12
  %arrayidx.i = getelementptr inbounds %struct.POS*, %struct.POS** %5, i64 %indvars.iv.i
  %6 = bitcast %struct.POS** %arrayidx.i to <2 x i64>**
  %7 = load <2 x i64>*, <2 x i64>** %6, align 8, !tbaa !5
  %call.i.i = tail call noalias i8* @malloc(i64 16) #6
  %8 = load <2 x i64>, <2 x i64>* %7, align 8, !tbaa !1
  %9 = bitcast i8* %call.i.i to <2 x i64>*
  store <2 x i64> %8, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx8.i = getelementptr inbounds %struct.POS*, %struct.POS** %4, i64 %indvars.iv.i
  %10 = bitcast %struct.POS** %arrayidx8.i to i8**
  store i8* %call.i.i, i8** %10, align 8, !tbaa !5
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond = icmp eq i64 %indvars.iv.next.i, %2
  br i1 %exitcond, label %copy_NQueen.exit.loopexit, label %for.body.i

copy_NQueen.exit.loopexit:                        ; preds = %for.body.i
  br label %copy_NQueen.exit

copy_NQueen.exit:                                 ; preds = %copy_NQueen.exit.loopexit, %for.body
  %queens_size10.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %11 = bitcast i8* %queens_size10.i to i64*
  store i64 %2, i64* %11, align 8, !tbaa !10
  %num_solutions.i = getelementptr inbounds %struct.NQueen, %struct.NQueen* %1, i64 0, i32 2
  %12 = load i64, i64* %num_solutions.i, align 8, !tbaa !13
  %num_solutions11.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %13 = bitcast i8* %num_solutions11.i to i64*
  store i64 %12, i64* %13, align 8, !tbaa !13
  %arrayidx4 = getelementptr inbounds %struct.NQueen*, %struct.NQueen** %0, i64 %indvars.iv
  %14 = bitcast %struct.NQueen** %arrayidx4 to i8**
  store i8* %call.i, i8** %14, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, %_NQueen_size
  br i1 %exitcond15, label %for.cond.cleanup.loopexit, label %for.body
}

; Function Attrs: nounwind uwtable
define void @free_NQueen(%struct.NQueen* nocapture %nqueen) local_unnamed_addr #0 {
entry:
  %queens_size = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nqueen, i64 0, i32 1
  %0 = load i64, i64* %queens_size, align 8, !tbaa !10
  %cmp16 = icmp sgt i64 %0, 0
  %queens = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nqueen, i64 0, i32 0
  br i1 %cmp16, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %1 = bitcast %struct.NQueen* %nqueen to i8**
  %2 = load i8*, i8** %1, align 8, !tbaa !12
  tail call void @free(i8* %2) #6
  %3 = bitcast %struct.NQueen* %nqueen to i8*
  tail call void @free(i8* %3) #6
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %4 = load %struct.POS**, %struct.POS*** %queens, align 8, !tbaa !12
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %4, i64 %indvars.iv
  %5 = bitcast %struct.POS** %arrayidx to i8**
  %6 = load i8*, i8** %5, align 8, !tbaa !5
  tail call void @free(i8* %6) #6
  %7 = load %struct.POS**, %struct.POS*** %queens, align 8, !tbaa !12
  %arrayidx4 = getelementptr inbounds %struct.POS*, %struct.POS** %7, i64 %indvars.iv
  store %struct.POS* null, %struct.POS** %arrayidx4, align 8, !tbaa !5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %8 = load i64, i64* %queens_size, align 8, !tbaa !10
  %cmp = icmp slt i64 %indvars.iv.next, %8
  br i1 %cmp, label %for.body, label %for.cond.cleanup.loopexit
}

; Function Attrs: nounwind uwtable
define void @printf_NQueen(%struct.NQueen* nocapture readonly %nqueen) local_unnamed_addr #0 {
entry:
  %putchar = tail call i32 @putchar(i32 123) #6
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0))
  %queens_size = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nqueen, i64 0, i32 1
  %0 = load i64, i64* %queens_size, align 8, !tbaa !10
  %cmp12 = icmp sgt i64 %0, 0
  br i1 %cmp12, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %entry
  %queens = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nqueen, i64 0, i32 0
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i64 0, i64 0))
  %num_solutions = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nqueen, i64 0, i32 2
  %1 = load i64, i64* %num_solutions, align 8, !tbaa !13
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %1)
  %putchar11 = tail call i32 @putchar(i32 125) #6
  ret void

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %2 = load %struct.POS**, %struct.POS*** %queens, align 8, !tbaa !12
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv
  %3 = load %struct.POS*, %struct.POS** %arrayidx, align 8, !tbaa !5
  %putchar.i = tail call i32 @putchar(i32 123) #6
  %call1.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #6
  %r.i = getelementptr inbounds %struct.POS, %struct.POS* %3, i64 0, i32 0
  %4 = load i64, i64* %r.i, align 8, !tbaa !7
  %call2.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %4) #6
  %call3.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %c.i = getelementptr inbounds %struct.POS, %struct.POS* %3, i64 0, i32 1
  %5 = load i64, i64* %c.i, align 8, !tbaa !9
  %call4.i = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %5) #6
  %putchar7.i = tail call i32 @putchar(i32 125) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %6 = load i64, i64* %queens_size, align 8, !tbaa !10
  %cmp = icmp slt i64 %indvars.iv.next, %6
  br i1 %cmp, label %for.body, label %for.cond.cleanup.loopexit
}

; Function Attrs: nounwind uwtable
define noalias %struct.NQueen* @nqueen(i64 %num_solutions, %struct.POS** %queens, i64 %queens_size, i1 zeroext %queens_dealloc) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 24) #6
  %0 = bitcast i8* %call to %struct.NQueen*
  %num_solutions1 = getelementptr inbounds i8, i8* %call, i64 16
  %1 = bitcast i8* %num_solutions1 to i64*
  store i64 %num_solutions, i64* %1, align 8, !tbaa !13
  %queens_size2 = getelementptr inbounds i8, i8* %call, i64 8
  %2 = bitcast i8* %queens_size2 to i64*
  store i64 %queens_size, i64* %2, align 8, !tbaa !10
  %queens3 = bitcast i8* %call to %struct.POS***
  store %struct.POS** %queens, %struct.POS*** %queens3, align 8, !tbaa !12
  ret %struct.NQueen* %0
}

; Function Attrs: nounwind uwtable
define i64 @conflict(%struct.POS* nocapture %p, i1 zeroext %p_dealloc, i64 %row, i64 %col) local_unnamed_addr #0 {
entry:
  %r1 = getelementptr inbounds %struct.POS, %struct.POS* %p, i64 0, i32 0
  %0 = load i64, i64* %r1, align 8, !tbaa !7
  %c2 = getelementptr inbounds %struct.POS, %struct.POS* %p, i64 0, i32 1
  %1 = load i64, i64* %c2, align 8, !tbaa !9
  %cmp = icmp eq i64 %0, %row
  %cmp3 = icmp eq i64 %1, %col
  %or.cond = or i1 %cmp, %cmp3
  br i1 %or.cond, label %blklab1, label %blklab0

blklab1:                                          ; preds = %entry
  br i1 %p_dealloc, label %if.then6, label %cleanup

if.then6:                                         ; preds = %blklab1
  %2 = bitcast %struct.POS* %p to i8*
  tail call void @free(i8* %2) #6
  br label %cleanup

blklab0:                                          ; preds = %entry
  %sub = sub nsw i64 %1, %col
  %ispos = icmp sgt i64 %sub, -1
  %neg = sub i64 0, %sub
  %3 = select i1 %ispos, i64 %sub, i64 %neg
  %sub8 = sub nsw i64 %0, %row
  %ispos49 = icmp sgt i64 %sub8, -1
  %neg50 = sub i64 0, %sub8
  %4 = select i1 %ispos49, i64 %sub8, i64 %neg50
  %cmp10 = icmp eq i64 %3, %4
  %. = zext i1 %cmp10 to i64
  br i1 %p_dealloc, label %if.then14, label %cleanup

if.then14:                                        ; preds = %blklab0
  %5 = bitcast %struct.POS* %p to i8*
  tail call void @free(i8* %5) #6
  br label %cleanup

cleanup:                                          ; preds = %blklab0, %if.then14, %blklab1, %if.then6
  %retval.0 = phi i64 [ 1, %if.then6 ], [ 1, %blklab1 ], [ %., %if.then14 ], [ %., %blklab0 ]
  ret i64 %retval.0
}

; Function Attrs: nounwind uwtable
define %struct.NQueen* @run(%struct.NQueen* %nq, i1 zeroext %nq_dealloc, i64 %n, i64 %dim) local_unnamed_addr #2 {
entry:
  %cmp = icmp eq i64 %dim, %n
  br i1 %cmp, label %if.end, label %blklab6

if.end:                                           ; preds = %entry
  %num_solutions = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nq, i64 0, i32 2
  %0 = load i64, i64* %num_solutions, align 8, !tbaa !13
  %add = add nsw i64 %0, 1
  store i64 %add, i64* %num_solutions, align 8, !tbaa !13
  br label %cleanup

blklab6:                                          ; preds = %entry
  %queens_size521 = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nq, i64 0, i32 1
  %1 = load i64, i64* %queens_size521, align 8, !tbaa !10
  %cmp92523 = icmp sgt i64 %1, %n
  %cmp98524 = icmp eq i64 %1, %dim
  %or.cond525 = and i1 %cmp92523, %cmp98524
  br i1 %or.cond525, label %blklab10.lr.ph, label %blklab11

blklab10.lr.ph:                                   ; preds = %blklab6
  %frombool = zext i1 %nq_dealloc to i8
  %add164 = add nsw i64 %n, 1
  %or.cond509.not516 = icmp sgt i64 %dim, %n
  %cmp125549 = icmp sgt i64 %n, 0
  br label %blklab10

blklab11.loopexit:                                ; preds = %blklab22
  br label %blklab11

blklab11:                                         ; preds = %blklab11.loopexit, %blklab6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %2) #8
  tail call void @exit(i32 -1) #9
  unreachable

blklab10:                                         ; preds = %blklab10.lr.ph, %blklab22
  %nq.pn = phi %struct.NQueen* [ %nq, %blklab10.lr.ph ], [ %nq.addr.1, %blklab22 ]
  %nq_dealloc.addr.0527 = phi i8 [ %frombool, %blklab10.lr.ph ], [ %nq_dealloc.addr.1, %blklab22 ]
  %col.0526 = phi i64 [ 0, %blklab10.lr.ph ], [ %add175, %blklab22 ]
  %queens530 = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nq.pn, i64 0, i32 0
  %cmp102 = icmp slt i64 %col.0526, %dim
  br i1 %cmp102, label %while.cond106.preheader, label %cleanup.loopexit

while.cond106.preheader:                          ; preds = %blklab10
  br i1 %or.cond509.not516, label %blklab14.preheader, label %blklab15

blklab14.preheader:                               ; preds = %while.cond106.preheader
  br i1 %cmp125549, label %polly.split_new_and_old.preheader, label %if.end153

polly.split_new_and_old.preheader:                ; preds = %blklab14.preheader
  br label %polly.split_new_and_old

blklab15:                                         ; preds = %while.cond106.preheader
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %4) #8
  tail call void @exit(i32 -1) #9
  unreachable

polly.split_new_and_old:                          ; preds = %polly.split_new_and_old.preheader, %blklab18
  %6 = phi i1 [ %14, %blklab18 ], [ true, %polly.split_new_and_old.preheader ]
  %i.0520550 = phi i64 [ %add146, %blklab18 ], [ 0, %polly.split_new_and_old.preheader ]
  br i1 %6, label %blklab20, label %blklab18

blklab20:                                         ; preds = %polly.split_new_and_old
  %7 = load %struct.POS**, %struct.POS*** %queens530, align 8, !tbaa !12
  %arrayidx131 = getelementptr inbounds %struct.POS*, %struct.POS** %7, i64 %i.0520550
  %8 = load %struct.POS*, %struct.POS** %arrayidx131, align 8, !tbaa !5
  %r1.i = getelementptr inbounds %struct.POS, %struct.POS* %8, i64 0, i32 0
  %9 = load i64, i64* %r1.i, align 8, !tbaa !7
  %c2.i = getelementptr inbounds %struct.POS, %struct.POS* %8, i64 0, i32 1
  %10 = load i64, i64* %c2.i, align 8, !tbaa !9
  %cmp.i = icmp eq i64 %9, %n
  %cmp3.i = icmp eq i64 %10, %col.0526
  %or.cond.i = or i1 %cmp.i, %cmp3.i
  br i1 %or.cond.i, label %conflict.exit, label %blklab0.i

blklab0.i:                                        ; preds = %blklab20
  %sub.i = sub nsw i64 %10, %col.0526
  %ispos.i = icmp sgt i64 %sub.i, -1
  %neg.i = sub i64 0, %sub.i
  %11 = select i1 %ispos.i, i64 %sub.i, i64 %neg.i
  %sub8.i = sub nsw i64 %9, %n
  %ispos49.i = icmp sgt i64 %sub8.i, -1
  %neg50.i = sub i64 0, %sub8.i
  %12 = select i1 %ispos49.i, i64 %sub8.i, i64 %neg50.i
  %cmp10.i = icmp eq i64 %11, %12
  %..i = zext i1 %cmp10.i to i64
  br label %conflict.exit

conflict.exit:                                    ; preds = %blklab20, %blklab0.i
  %retval.0.i = phi i64 [ %..i, %blklab0.i ], [ 1, %blklab20 ]
  %13 = xor i64 %retval.0.i, 1
  br label %blklab18

blklab18:                                         ; preds = %polly.split_new_and_old, %conflict.exit
  %_28.0.ph.merge = phi i64 [ %13, %conflict.exit ], [ 0, %polly.split_new_and_old ]
  %add146 = add nuw nsw i64 %i.0520550, 1
  %cmp125 = icmp slt i64 %add146, %n
  %14 = icmp eq i64 %_28.0.ph.merge, 1
  br i1 %cmp125, label %polly.split_new_and_old, label %blklab12

blklab12:                                         ; preds = %blklab18
  br i1 %14, label %if.end153, label %blklab22

if.end153:                                        ; preds = %blklab14.preheader, %blklab12
  %call154 = tail call noalias i8* @malloc(i64 16) #6
  %c = getelementptr inbounds i8, i8* %call154, i64 8
  %15 = bitcast i8* %c to i64*
  store i64 %col.0526, i64* %15, align 8, !tbaa !9
  %r = bitcast i8* %call154 to i64*
  store i64 %n, i64* %r, align 8, !tbaa !7
  %16 = and i8 %nq_dealloc.addr.0527, 1
  %tobool155 = icmp ne i8 %16, 0
  br i1 %tobool155, label %if.then156, label %if.end161

if.then156:                                       ; preds = %if.end153
  %17 = load %struct.POS**, %struct.POS*** %queens530, align 8, !tbaa !12
  %arrayidx158 = getelementptr inbounds %struct.POS*, %struct.POS** %17, i64 %n
  %18 = bitcast %struct.POS** %arrayidx158 to i8**
  %19 = load i8*, i8** %18, align 8, !tbaa !5
  tail call void @free(i8* %19) #6
  %20 = load %struct.POS**, %struct.POS*** %queens530, align 8, !tbaa !12
  %arrayidx160 = getelementptr inbounds %struct.POS*, %struct.POS** %20, i64 %n
  store %struct.POS* null, %struct.POS** %arrayidx160, align 8, !tbaa !5
  br label %if.end161

if.end161:                                        ; preds = %if.then156, %if.end153
  %21 = load %struct.POS**, %struct.POS*** %queens530, align 8, !tbaa !12
  %arrayidx163 = getelementptr inbounds %struct.POS*, %struct.POS** %21, i64 %n
  %22 = bitcast %struct.POS** %arrayidx163 to i8**
  store i8* %call154, i8** %22, align 8, !tbaa !5
  %call169 = tail call %struct.NQueen* @run(%struct.NQueen* %nq.pn, i1 zeroext %tobool155, i64 %add164, i64 %dim)
  br label %blklab22

blklab22:                                         ; preds = %blklab12, %if.end161
  %nq_dealloc.addr.1 = phi i8 [ %nq_dealloc.addr.0527, %blklab12 ], [ 1, %if.end161 ]
  %nq.addr.1 = phi %struct.NQueen* [ %nq.pn, %blklab12 ], [ %call169, %if.end161 ]
  %add175 = add nuw nsw i64 %col.0526, 1
  %queens_size = getelementptr inbounds %struct.NQueen, %struct.NQueen* %nq.addr.1, i64 0, i32 1
  %23 = load i64, i64* %queens_size, align 8, !tbaa !10
  %cmp92 = icmp sgt i64 %23, %n
  %cmp98 = icmp eq i64 %23, %dim
  %or.cond = and i1 %cmp92, %cmp98
  br i1 %or.cond, label %blklab10, label %blklab11.loopexit

cleanup.loopexit:                                 ; preds = %blklab10
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %if.end
  %retval.0 = phi %struct.NQueen* [ %nq, %if.end ], [ %nq.pn, %cleanup.loopexit ]
  ret %struct.NQueen* %retval.0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #3

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #4 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6
  %0 = load i64*, i64** %call, align 8, !tbaa !5
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end240, label %if.end5

if.end5:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %mul = shl i64 %1, 3
  %call19 = tail call noalias i8* @malloc(i64 %mul) #6
  %2 = bitcast i8* %call19 to %struct.POS**
  %cmp23407 = icmp sgt i64 %1, 0
  br i1 %cmp23407, label %for.body26.preheader, label %if.end50.thread

for.body26.preheader:                             ; preds = %if.end5
  br label %for.body26

if.end50.thread:                                  ; preds = %if.end5
  %call52418 = tail call noalias i8* @malloc(i64 %mul) #6
  %3 = bitcast i8* %call52418 to %struct.POS**
  br label %if.then191

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv410 = phi i64 [ %indvars.iv.next411, %for.body26 ], [ 0, %for.body26.preheader ]
  %call.i = tail call noalias i8* @malloc(i64 16) #6
  %arrayidx29 = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv410
  %4 = bitcast %struct.POS** %arrayidx29 to i8**
  call void @llvm.memset.p0i8.i64(i8* %call.i, i8 0, i64 16, i32 8, i1 false)
  store i8* %call.i, i8** %4, align 8, !tbaa !5
  %indvars.iv.next411 = add nuw nsw i64 %indvars.iv410, 1
  %exitcond425 = icmp eq i64 %indvars.iv.next411, %1
  br i1 %exitcond425, label %for.body60.preheader, label %for.body26

for.body60.preheader:                             ; preds = %for.body26
  %call52 = tail call noalias i8* @malloc(i64 %mul) #6
  %5 = bitcast i8* %call52 to %struct.POS**
  br label %for.body60

for.body60:                                       ; preds = %for.body60, %for.body60.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body60 ], [ 0, %for.body60.preheader ]
  %arrayidx62 = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv
  %6 = bitcast %struct.POS** %arrayidx62 to <2 x i64>**
  %7 = load <2 x i64>*, <2 x i64>** %6, align 8, !tbaa !5
  %call.i412 = tail call noalias i8* @malloc(i64 16) #6
  %8 = load <2 x i64>, <2 x i64>* %7, align 8, !tbaa !1
  %9 = bitcast i8* %call.i412 to <2 x i64>*
  store <2 x i64> %8, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx65 = getelementptr inbounds %struct.POS*, %struct.POS** %5, i64 %indvars.iv
  %10 = bitcast %struct.POS** %arrayidx65 to i8**
  store i8* %call.i412, i8** %10, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %1
  br i1 %exitcond, label %if.then191.loopexit, label %for.body60

if.then191.loopexit:                              ; preds = %for.body60
  br label %if.then191

if.then191:                                       ; preds = %if.then191.loopexit, %if.end50.thread
  %11 = phi %struct.POS** [ %3, %if.end50.thread ], [ %5, %if.then191.loopexit ]
  %call.i417 = tail call noalias i8* @malloc(i64 24) #6
  %12 = bitcast i8* %call.i417 to %struct.NQueen*
  %num_solutions1.i = getelementptr inbounds i8, i8* %call.i417, i64 16
  %13 = bitcast i8* %num_solutions1.i to i64*
  store i64 0, i64* %13, align 8, !tbaa !13
  %queens_size2.i = getelementptr inbounds i8, i8* %call.i417, i64 8
  %14 = bitcast i8* %queens_size2.i to i64*
  store i64 %1, i64* %14, align 8, !tbaa !10
  %queens3.i = bitcast i8* %call.i417 to %struct.POS***
  store %struct.POS** %11, %struct.POS*** %queens3.i, align 8, !tbaa !12
  %call86 = tail call %struct.NQueen* @run(%struct.NQueen* %12, i1 zeroext true, i64 0, i64 %1)
  %call96 = tail call i64* @create1DArray(i32 0, i32 33) #6
  %15 = bitcast i64* %call96 to <2 x i64>*
  store <2 x i64> <i64 78, i64 45>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx99 = getelementptr inbounds i64, i64* %call96, i64 2
  %16 = bitcast i64* %arrayidx99 to <2 x i64>*
  store <2 x i64> <i64 81, i64 117>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx101 = getelementptr inbounds i64, i64* %call96, i64 4
  %17 = bitcast i64* %arrayidx101 to <2 x i64>*
  store <2 x i64> <i64 101, i64 101>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx103 = getelementptr inbounds i64, i64* %call96, i64 6
  %18 = bitcast i64* %arrayidx103 to <2 x i64>*
  store <2 x i64> <i64 110, i64 32>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx105 = getelementptr inbounds i64, i64* %call96, i64 8
  %19 = bitcast i64* %arrayidx105 to <2 x i64>*
  store <2 x i64> <i64 80, i64 114>, <2 x i64>* %19, align 8, !tbaa !1
  %arrayidx107 = getelementptr inbounds i64, i64* %call96, i64 10
  %20 = bitcast i64* %arrayidx107 to <2 x i64>*
  store <2 x i64> <i64 111, i64 98>, <2 x i64>* %20, align 8, !tbaa !1
  %arrayidx109 = getelementptr inbounds i64, i64* %call96, i64 12
  %21 = bitcast i64* %arrayidx109 to <2 x i64>*
  store <2 x i64> <i64 108, i64 101>, <2 x i64>* %21, align 8, !tbaa !1
  %arrayidx111 = getelementptr inbounds i64, i64* %call96, i64 14
  %22 = bitcast i64* %arrayidx111 to <2 x i64>*
  store <2 x i64> <i64 109, i64 32>, <2 x i64>* %22, align 8, !tbaa !1
  %arrayidx113 = getelementptr inbounds i64, i64* %call96, i64 16
  %23 = bitcast i64* %arrayidx113 to <2 x i64>*
  store <2 x i64> <i64 111, i64 110>, <2 x i64>* %23, align 8, !tbaa !1
  %arrayidx115 = getelementptr inbounds i64, i64* %call96, i64 18
  %24 = bitcast i64* %arrayidx115 to <2 x i64>*
  store <2 x i64> <i64 32, i64 97>, <2 x i64>* %24, align 8, !tbaa !1
  %arrayidx117 = getelementptr inbounds i64, i64* %call96, i64 20
  %25 = bitcast i64* %arrayidx117 to <2 x i64>*
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %25, align 8, !tbaa !1
  %arrayidx119 = getelementptr inbounds i64, i64* %call96, i64 22
  %26 = bitcast i64* %arrayidx119 to <2 x i64>*
  store <2 x i64> <i64 32, i64 88>, <2 x i64>* %26, align 8, !tbaa !1
  %arrayidx121 = getelementptr inbounds i64, i64* %call96, i64 24
  %27 = bitcast i64* %arrayidx121 to <2 x i64>*
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %27, align 8, !tbaa !1
  %arrayidx123 = getelementptr inbounds i64, i64* %call96, i64 26
  %28 = bitcast i64* %arrayidx123 to <2 x i64>*
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %28, align 8, !tbaa !1
  %arrayidx125 = getelementptr inbounds i64, i64* %call96, i64 28
  %29 = bitcast i64* %arrayidx125 to <2 x i64>*
  store <2 x i64> <i64 111, i64 97>, <2 x i64>* %29, align 8, !tbaa !1
  %arrayidx127 = getelementptr inbounds i64, i64* %call96, i64 30
  %30 = bitcast i64* %arrayidx127 to <2 x i64>*
  store <2 x i64> <i64 114, i64 100>, <2 x i64>* %30, align 8, !tbaa !1
  %arrayidx129 = getelementptr inbounds i64, i64* %call96, i64 32
  store i64 46, i64* %arrayidx129, align 8, !tbaa !1
  tail call void @println_s(i64* %call96, i64 33) #6
  %call134 = tail call i64* @create1DArray(i32 0, i32 4) #6
  %31 = bitcast i64* %call134 to <2 x i64>*
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx137 = getelementptr inbounds i64, i64* %call134, i64 2
  %32 = bitcast i64* %arrayidx137 to <2 x i64>*
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %32, align 8, !tbaa !1
  tail call void @printf_s(i64* %call134, i64 4) #6
  %call139 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i64 0, i64 0), i64 %1)
  %call144 = tail call i64* @create1DArray(i32 0, i32 6) #6
  %33 = bitcast i64* %call144 to <2 x i64>*
  store <2 x i64> <i64 70, i64 111>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx147 = getelementptr inbounds i64, i64* %call144, i64 2
  %34 = bitcast i64* %arrayidx147 to <2 x i64>*
  store <2 x i64> <i64 117, i64 110>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx149 = getelementptr inbounds i64, i64* %call144, i64 4
  %35 = bitcast i64* %arrayidx149 to <2 x i64>*
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %35, align 8, !tbaa !1
  tail call void @printf_s(i64* %call144, i64 6) #6
  %num_solutions151 = getelementptr inbounds %struct.NQueen, %struct.NQueen* %call86, i64 0, i32 2
  %36 = load i64, i64* %num_solutions151, align 8, !tbaa !13
  %call152 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %36)
  %call157 = tail call i64* @create1DArray(i32 0, i32 11) #6
  %37 = bitcast i64* %call157 to <2 x i64>*
  store <2 x i64> <i64 32, i64 115>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx160 = getelementptr inbounds i64, i64* %call157, i64 2
  %38 = bitcast i64* %arrayidx160 to <2 x i64>*
  store <2 x i64> <i64 111, i64 108>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx162 = getelementptr inbounds i64, i64* %call157, i64 4
  %39 = bitcast i64* %arrayidx162 to <2 x i64>*
  store <2 x i64> <i64 117, i64 116>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx164 = getelementptr inbounds i64, i64* %call157, i64 6
  %40 = bitcast i64* %arrayidx164 to <2 x i64>*
  store <2 x i64> <i64 105, i64 111>, <2 x i64>* %40, align 8, !tbaa !1
  %arrayidx166 = getelementptr inbounds i64, i64* %call157, i64 8
  %41 = bitcast i64* %arrayidx166 to <2 x i64>*
  store <2 x i64> <i64 110, i64 115>, <2 x i64>* %41, align 8, !tbaa !1
  %arrayidx168 = getelementptr inbounds i64, i64* %call157, i64 10
  store i64 46, i64* %arrayidx168, align 8, !tbaa !1
  tail call void @println_s(i64* %call157, i64 11) #6
  %phitmp = bitcast i64* %call157 to i8*
  %phitmp391 = bitcast i64* %call144 to i8*
  %phitmp392 = bitcast i64* %call134 to i8*
  %phitmp393 = bitcast i64* %call96 to i8*
  %42 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %42) #6
  %queens_size.i = getelementptr inbounds %struct.NQueen, %struct.NQueen* %call86, i64 0, i32 1
  %43 = load i64, i64* %queens_size.i, align 8, !tbaa !10
  %cmp16.i = icmp sgt i64 %43, 0
  %queens.i = getelementptr inbounds %struct.NQueen, %struct.NQueen* %call86, i64 0, i32 0
  br i1 %cmp16.i, label %for.body.i.preheader, label %free_NQueen.exit

for.body.i.preheader:                             ; preds = %if.then191
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.preheader, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body.i.preheader ]
  %44 = load %struct.POS**, %struct.POS*** %queens.i, align 8, !tbaa !12
  %arrayidx.i = getelementptr inbounds %struct.POS*, %struct.POS** %44, i64 %indvars.iv.i
  %45 = bitcast %struct.POS** %arrayidx.i to i8**
  %46 = load i8*, i8** %45, align 8, !tbaa !5
  tail call void @free(i8* %46) #6
  %47 = load %struct.POS**, %struct.POS*** %queens.i, align 8, !tbaa !12
  %arrayidx4.i = getelementptr inbounds %struct.POS*, %struct.POS** %47, i64 %indvars.iv.i
  store %struct.POS* null, %struct.POS** %arrayidx4.i, align 8, !tbaa !5
  %indvars.iv.next.i = add nuw i64 %indvars.iv.i, 1
  %48 = load i64, i64* %queens_size.i, align 8, !tbaa !10
  %cmp.i = icmp slt i64 %indvars.iv.next.i, %48
  br i1 %cmp.i, label %for.body.i, label %free_NQueen.exit.loopexit

free_NQueen.exit.loopexit:                        ; preds = %for.body.i
  br label %free_NQueen.exit

free_NQueen.exit:                                 ; preds = %free_NQueen.exit.loopexit, %if.then191
  %49 = bitcast %struct.NQueen* %call86 to i8**
  %50 = load i8*, i8** %49, align 8, !tbaa !12
  tail call void @free(i8* %50) #6
  %51 = bitcast %struct.NQueen* %call86 to i8*
  tail call void @free(i8* %51) #6
  tail call void @free(i8* %phitmp393) #6
  tail call void @free(i8* %phitmp392) #6
  tail call void @free(i8* %phitmp391) #6
  tail call void @free(i8* %phitmp) #6
  br label %if.end240

if.end240:                                        ; preds = %entry, %free_NQueen.exit
  tail call void @exit(i32 0) #9
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #5

declare i64* @parseStringToInt(i64*) local_unnamed_addr #5

declare i64* @create1DArray(i32, i32) local_unnamed_addr #5

declare void @println_s(i64*, i64) local_unnamed_addr #5

declare void @printf_s(i64*, i64) local_unnamed_addr #5

declare i32 @putchar(i32) local_unnamed_addr

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #7

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { argmemonly nounwind }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!8, !2, i64 0}
!8 = !{!"", !2, i64 0, !2, i64 8}
!9 = !{!8, !2, i64 8}
!10 = !{!11, !2, i64 8}
!11 = !{!"", !6, i64 0, !2, i64 8, !2, i64 16}
!12 = !{!11, !6, i64 0}
!13 = !{!11, !2, i64 16}
