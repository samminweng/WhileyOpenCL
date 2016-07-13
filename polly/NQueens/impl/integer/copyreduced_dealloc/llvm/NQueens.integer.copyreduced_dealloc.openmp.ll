; ModuleID = 'NQueens_integer.c'
source_filename = "NQueens_integer.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.POS = type { i64, i64 }

@.str.1 = private unnamed_addr constant [4 x i8] c" r:\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" c:\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

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
define i64 @run(%struct.POS** nocapture %queens, i64 %queens_size, i1 zeroext %queens_dealloc, i64 %n, i64 %dim) local_unnamed_addr #2 {
entry:
  %cmp = icmp eq i64 %dim, %n
  br i1 %cmp, label %if.end, label %while.cond.preheader

while.cond.preheader:                             ; preds = %entry
  %cmp17 = icmp slt i64 %n, %queens_size
  %cmp21 = icmp eq i64 %dim, %queens_size
  %or.cond = and i1 %cmp17, %cmp21
  br i1 %or.cond, label %blklab10.preheader, label %blklab11

blklab10.preheader:                               ; preds = %while.cond.preheader
  %cmp44257 = icmp sgt i64 %n, 0
  %arrayidx74 = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %n
  %0 = bitcast %struct.POS** %arrayidx74 to i8**
  %add78 = add nsw i64 %n, 1
  %mul.i = shl i64 %dim, 3
  %cmp12.i = icmp sgt i64 %dim, 0
  %cmp25.us277 = icmp sgt i64 %dim, 0
  br i1 %queens_dealloc, label %blklab10.us.preheader, label %blklab10.preheader273

blklab10.preheader273:                            ; preds = %blklab10.preheader
  br i1 %cmp25.us277, label %blklab14.preheader.preheader, label %blklab8

blklab14.preheader.preheader:                     ; preds = %blklab10.preheader273
  br label %blklab14.preheader

blklab10.us.preheader:                            ; preds = %blklab10.preheader
  br i1 %cmp25.us277, label %blklab14.preheader.us.preheader, label %blklab8

blklab14.preheader.us.preheader:                  ; preds = %blklab10.us.preheader
  br label %blklab14.preheader.us

if.end70.us:                                      ; preds = %blklab14.preheader.us, %blklab14.blklab12_crit_edge.us
  %call71.us = tail call noalias i8* @malloc(i64 16) #6
  %c.us = getelementptr inbounds i8, i8* %call71.us, i64 8
  %1 = bitcast i8* %c.us to i64*
  store i64 %col.0249.us280, i64* %1, align 8, !tbaa !9
  %r.us = bitcast i8* %call71.us to i64*
  store i64 %n, i64* %r.us, align 8, !tbaa !7
  %2 = load i8*, i8** %0, align 8, !tbaa !5
  tail call void @free(i8* %2) #6
  store i8* %call71.us, i8** %0, align 8, !tbaa !5
  %call.i.us = tail call noalias i8* @malloc(i64 %mul.i) #6
  %3 = bitcast i8* %call.i.us to %struct.POS**
  br i1 %cmp12.i, label %for.body.i.us.preheader, label %copy_array_POS.exit.us

for.body.i.us.preheader:                          ; preds = %if.end70.us
  br label %for.body.i.us

for.body.i.us:                                    ; preds = %for.body.i.us.preheader, %for.body.i.us
  %indvars.iv.i.us = phi i64 [ %indvars.iv.next.i.us, %for.body.i.us ], [ 0, %for.body.i.us.preheader ]
  %arrayidx.i.us = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %indvars.iv.i.us
  %4 = bitcast %struct.POS** %arrayidx.i.us to <2 x i64>**
  %5 = load <2 x i64>*, <2 x i64>** %4, align 8, !tbaa !5
  %call.i.i.us = tail call noalias i8* @malloc(i64 16) #6
  %6 = load <2 x i64>, <2 x i64>* %5, align 8, !tbaa !1
  %7 = bitcast i8* %call.i.i.us to <2 x i64>*
  store <2 x i64> %6, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx4.i.us = getelementptr inbounds %struct.POS*, %struct.POS** %3, i64 %indvars.iv.i.us
  %8 = bitcast %struct.POS** %arrayidx4.i.us to i8**
  store i8* %call.i.i.us, i8** %8, align 8, !tbaa !5
  %indvars.iv.next.i.us = add nuw nsw i64 %indvars.iv.i.us, 1
  %exitcond.i.us = icmp eq i64 %indvars.iv.next.i.us, %dim
  br i1 %exitcond.i.us, label %copy_array_POS.exit.us.loopexit, label %for.body.i.us

copy_array_POS.exit.us.loopexit:                  ; preds = %for.body.i.us
  br label %copy_array_POS.exit.us

copy_array_POS.exit.us:                           ; preds = %copy_array_POS.exit.us.loopexit, %if.end70.us
  %call80.us = tail call i64 @run(%struct.POS** %3, i64 %dim, i1 zeroext true, i64 %add78, i64 %dim)
  %add81.us = add nsw i64 %call80.us, %num_solutions.0250.us278
  br label %blklab22.us

blklab22.us:                                      ; preds = %copy_array_POS.exit.us, %blklab14.blklab12_crit_edge.us
  %num_solutions.1.us = phi i64 [ %num_solutions.0250.us278, %blklab14.blklab12_crit_edge.us ], [ %add81.us, %copy_array_POS.exit.us ]
  %add82.us = add nuw nsw i64 %col.0249.us280, 1
  %cmp25.us = icmp slt i64 %add82.us, %dim
  br i1 %cmp25.us, label %blklab14.preheader.us, label %blklab8.loopexit

polly.split_new_and_old.us:                       ; preds = %polly.split_new_and_old.us.preheader, %blklab18.us
  %9 = phi i1 [ %16, %blklab18.us ], [ true, %polly.split_new_and_old.us.preheader ]
  %i.0248258.us = phi i64 [ %add.us, %blklab18.us ], [ 0, %polly.split_new_and_old.us.preheader ]
  br i1 %9, label %blklab20.us, label %blklab18.us

blklab20.us:                                      ; preds = %polly.split_new_and_old.us
  %arrayidx48.us = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %i.0248258.us
  %10 = load %struct.POS*, %struct.POS** %arrayidx48.us, align 8, !tbaa !5
  %r1.i.us = getelementptr inbounds %struct.POS, %struct.POS* %10, i64 0, i32 0
  %11 = load i64, i64* %r1.i.us, align 8, !tbaa !7
  %c2.i.us = getelementptr inbounds %struct.POS, %struct.POS* %10, i64 0, i32 1
  %12 = load i64, i64* %c2.i.us, align 8, !tbaa !9
  %cmp.i.us = icmp eq i64 %11, %n
  %cmp3.i.us = icmp eq i64 %12, %col.0249.us280
  %or.cond.i.us = or i1 %cmp.i.us, %cmp3.i.us
  br i1 %or.cond.i.us, label %conflict.exit.us, label %blklab0.i.us

blklab0.i.us:                                     ; preds = %blklab20.us
  %sub.i.us = sub nsw i64 %12, %col.0249.us280
  %ispos.i.us = icmp sgt i64 %sub.i.us, -1
  %neg.i.us = sub i64 0, %sub.i.us
  %13 = select i1 %ispos.i.us, i64 %sub.i.us, i64 %neg.i.us
  %sub8.i.us = sub nsw i64 %11, %n
  %ispos49.i.us = icmp sgt i64 %sub8.i.us, -1
  %neg50.i.us = sub i64 0, %sub8.i.us
  %14 = select i1 %ispos49.i.us, i64 %sub8.i.us, i64 %neg50.i.us
  %cmp10.i.us = icmp eq i64 %13, %14
  %..i.us = zext i1 %cmp10.i.us to i64
  br label %conflict.exit.us

conflict.exit.us:                                 ; preds = %blklab0.i.us, %blklab20.us
  %retval.0.i.us = phi i64 [ %..i.us, %blklab0.i.us ], [ 1, %blklab20.us ]
  %15 = xor i64 %retval.0.i.us, 1
  br label %blklab18.us

blklab18.us:                                      ; preds = %conflict.exit.us, %polly.split_new_and_old.us
  %_23.0.ph.merge.us = phi i64 [ %15, %conflict.exit.us ], [ 0, %polly.split_new_and_old.us ]
  %add.us = add nuw nsw i64 %i.0248258.us, 1
  %16 = icmp eq i64 %_23.0.ph.merge.us, 1
  %exitcond267 = icmp eq i64 %add.us, %n
  br i1 %exitcond267, label %blklab14.blklab12_crit_edge.us, label %polly.split_new_and_old.us

blklab14.preheader.us:                            ; preds = %blklab14.preheader.us.preheader, %blklab22.us
  %col.0249.us280 = phi i64 [ %add82.us, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  %num_solutions.0250.us278 = phi i64 [ %num_solutions.1.us, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  br i1 %cmp44257, label %polly.split_new_and_old.us.preheader, label %if.end70.us

polly.split_new_and_old.us.preheader:             ; preds = %blklab14.preheader.us
  br label %polly.split_new_and_old.us

blklab14.blklab12_crit_edge.us:                   ; preds = %blklab18.us
  br i1 %16, label %if.end70.us, label %blklab22.us

if.end:                                           ; preds = %entry
  br i1 %queens_dealloc, label %for.cond.preheader, label %cleanup

for.cond.preheader:                               ; preds = %if.end
  %cmp3241 = icmp sgt i64 %queens_size, 0
  br i1 %cmp3241, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %for.cond.preheader
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %for.cond.preheader
  %17 = bitcast %struct.POS** %queens to i8*
  tail call void @free(i8* %17) #6
  br label %cleanup

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %indvars.iv
  %18 = bitcast %struct.POS** %arrayidx to i8**
  %19 = load i8*, i8** %18, align 8, !tbaa !5
  tail call void @free(i8* %19) #6
  store %struct.POS* null, %struct.POS** %arrayidx, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %queens_size
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body

blklab11:                                         ; preds = %while.cond.preheader
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %20) #8
  tail call void @exit(i32 -1) #9
  unreachable

blklab14.preheader:                               ; preds = %blklab14.preheader.preheader, %blklab22
  %col.0249285 = phi i64 [ %add82, %blklab22 ], [ 0, %blklab14.preheader.preheader ]
  %num_solutions.0250284 = phi i64 [ %num_solutions.1, %blklab22 ], [ 0, %blklab14.preheader.preheader ]
  br i1 %cmp44257, label %polly.split_new_and_old.preheader, label %if.end70

polly.split_new_and_old.preheader:                ; preds = %blklab14.preheader
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %polly.split_new_and_old.preheader, %blklab18
  %22 = phi i1 [ %29, %blklab18 ], [ true, %polly.split_new_and_old.preheader ]
  %i.0248258 = phi i64 [ %add, %blklab18 ], [ 0, %polly.split_new_and_old.preheader ]
  br i1 %22, label %blklab20, label %blklab18

blklab20:                                         ; preds = %polly.split_new_and_old
  %arrayidx48 = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %i.0248258
  %23 = load %struct.POS*, %struct.POS** %arrayidx48, align 8, !tbaa !5
  %r1.i = getelementptr inbounds %struct.POS, %struct.POS* %23, i64 0, i32 0
  %24 = load i64, i64* %r1.i, align 8, !tbaa !7
  %c2.i = getelementptr inbounds %struct.POS, %struct.POS* %23, i64 0, i32 1
  %25 = load i64, i64* %c2.i, align 8, !tbaa !9
  %cmp.i = icmp eq i64 %24, %n
  %cmp3.i = icmp eq i64 %25, %col.0249285
  %or.cond.i = or i1 %cmp.i, %cmp3.i
  br i1 %or.cond.i, label %conflict.exit, label %blklab0.i

blklab0.i:                                        ; preds = %blklab20
  %sub.i = sub nsw i64 %25, %col.0249285
  %ispos.i = icmp sgt i64 %sub.i, -1
  %neg.i = sub i64 0, %sub.i
  %26 = select i1 %ispos.i, i64 %sub.i, i64 %neg.i
  %sub8.i = sub nsw i64 %24, %n
  %ispos49.i = icmp sgt i64 %sub8.i, -1
  %neg50.i = sub i64 0, %sub8.i
  %27 = select i1 %ispos49.i, i64 %sub8.i, i64 %neg50.i
  %cmp10.i = icmp eq i64 %26, %27
  %..i = zext i1 %cmp10.i to i64
  br label %conflict.exit

conflict.exit:                                    ; preds = %blklab20, %blklab0.i
  %retval.0.i = phi i64 [ %..i, %blklab0.i ], [ 1, %blklab20 ]
  %28 = xor i64 %retval.0.i, 1
  br label %blklab18

blklab18:                                         ; preds = %polly.split_new_and_old, %conflict.exit
  %_23.0.ph.merge = phi i64 [ %28, %conflict.exit ], [ 0, %polly.split_new_and_old ]
  %add = add nuw nsw i64 %i.0248258, 1
  %29 = icmp eq i64 %_23.0.ph.merge, 1
  %exitcond268 = icmp eq i64 %add, %n
  br i1 %exitcond268, label %blklab12, label %polly.split_new_and_old

blklab12:                                         ; preds = %blklab18
  br i1 %29, label %if.end70, label %blklab22

if.end70:                                         ; preds = %blklab14.preheader, %blklab12
  %call71 = tail call noalias i8* @malloc(i64 16) #6
  %c = getelementptr inbounds i8, i8* %call71, i64 8
  %30 = bitcast i8* %c to i64*
  store i64 %col.0249285, i64* %30, align 8, !tbaa !9
  %r = bitcast i8* %call71 to i64*
  store i64 %n, i64* %r, align 8, !tbaa !7
  store i8* %call71, i8** %0, align 8, !tbaa !5
  %call.i = tail call noalias i8* @malloc(i64 %mul.i) #6
  %31 = bitcast i8* %call.i to %struct.POS**
  br i1 %cmp12.i, label %for.body.i.preheader, label %copy_array_POS.exit

for.body.i.preheader:                             ; preds = %if.end70
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.preheader, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body.i.preheader ]
  %arrayidx.i = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %indvars.iv.i
  %32 = bitcast %struct.POS** %arrayidx.i to <2 x i64>**
  %33 = load <2 x i64>*, <2 x i64>** %32, align 8, !tbaa !5
  %call.i.i = tail call noalias i8* @malloc(i64 16) #6
  %34 = load <2 x i64>, <2 x i64>* %33, align 8, !tbaa !1
  %35 = bitcast i8* %call.i.i to <2 x i64>*
  store <2 x i64> %34, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx4.i = getelementptr inbounds %struct.POS*, %struct.POS** %31, i64 %indvars.iv.i
  %36 = bitcast %struct.POS** %arrayidx4.i to i8**
  store i8* %call.i.i, i8** %36, align 8, !tbaa !5
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %dim
  br i1 %exitcond.i, label %copy_array_POS.exit.loopexit, label %for.body.i

copy_array_POS.exit.loopexit:                     ; preds = %for.body.i
  br label %copy_array_POS.exit

copy_array_POS.exit:                              ; preds = %copy_array_POS.exit.loopexit, %if.end70
  %call80 = tail call i64 @run(%struct.POS** %31, i64 %dim, i1 zeroext true, i64 %add78, i64 %dim)
  %add81 = add nsw i64 %call80, %num_solutions.0250284
  br label %blklab22

blklab22:                                         ; preds = %blklab12, %copy_array_POS.exit
  %num_solutions.1 = phi i64 [ %num_solutions.0250284, %blklab12 ], [ %add81, %copy_array_POS.exit ]
  %add82 = add nuw nsw i64 %col.0249285, 1
  %cmp25 = icmp slt i64 %add82, %dim
  br i1 %cmp25, label %blklab14.preheader, label %blklab8.loopexit289

blklab8.loopexit:                                 ; preds = %blklab22.us
  br label %blklab8

blklab8.loopexit289:                              ; preds = %blklab22
  br label %blklab8

blklab8:                                          ; preds = %blklab8.loopexit289, %blklab8.loopexit, %blklab10.preheader273, %blklab10.us.preheader
  %num_solutions.0250.lcssa = phi i64 [ 0, %blklab10.us.preheader ], [ 0, %blklab10.preheader273 ], [ %num_solutions.1.us, %blklab8.loopexit ], [ %num_solutions.1, %blklab8.loopexit289 ]
  br i1 %queens_dealloc, label %for.cond86.preheader, label %cleanup

for.cond86.preheader:                             ; preds = %blklab8
  br i1 %cmp12.i, label %for.body91.preheader, label %for.cond.cleanup90

for.body91.preheader:                             ; preds = %for.cond86.preheader
  br label %for.body91

for.cond.cleanup90.loopexit:                      ; preds = %for.body91
  br label %for.cond.cleanup90

for.cond.cleanup90:                               ; preds = %for.cond.cleanup90.loopexit, %for.cond86.preheader
  %37 = bitcast %struct.POS** %queens to i8*
  tail call void @free(i8* %37) #6
  br label %cleanup

for.body91:                                       ; preds = %for.body91.preheader, %for.body91
  %indvars.iv254 = phi i64 [ %indvars.iv.next255, %for.body91 ], [ 0, %for.body91.preheader ]
  %arrayidx93 = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %indvars.iv254
  %38 = bitcast %struct.POS** %arrayidx93 to i8**
  %39 = load i8*, i8** %38, align 8, !tbaa !5
  tail call void @free(i8* %39) #6
  store %struct.POS* null, %struct.POS** %arrayidx93, align 8, !tbaa !5
  %indvars.iv.next255 = add nuw nsw i64 %indvars.iv254, 1
  %exitcond266 = icmp eq i64 %indvars.iv.next255, %dim
  br i1 %exitcond266, label %for.cond.cleanup90.loopexit, label %for.body91

cleanup:                                          ; preds = %for.cond.cleanup90, %blklab8, %for.cond.cleanup, %if.end
  %retval.0 = phi i64 [ 1, %if.end ], [ 1, %for.cond.cleanup ], [ %num_solutions.0250.lcssa, %blklab8 ], [ %num_solutions.0250.lcssa, %for.cond.cleanup90 ]
  ret i64 %retval.0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #3

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #4 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !5
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.then135, label %if.end8

if.end8:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %call12 = tail call noalias i8* @malloc(i64 16) #6
  %mul = shl i64 %1, 3
  call void @llvm.memset.p0i8.i64(i8* %call12, i8 0, i64 16, i32 8, i1 false)
  %call22 = tail call noalias i8* @malloc(i64 %mul) #6
  %2 = bitcast i8* %call22 to %struct.POS**
  %cmp26337 = icmp sgt i64 %1, 0
  br i1 %cmp26337, label %for.body29.preheader, label %if.end53

for.body29.preheader:                             ; preds = %if.end8
  br label %for.body29

for.body29:                                       ; preds = %for.body29.preheader, %for.body29
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body29 ], [ 0, %for.body29.preheader ]
  %call.i = tail call noalias i8* @malloc(i64 16) #6
  %arrayidx32 = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv
  %3 = bitcast %struct.POS** %arrayidx32 to i8**
  call void @llvm.memset.p0i8.i64(i8* %call.i, i8 0, i64 16, i32 8, i1 false)
  store i8* %call.i, i8** %3, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %1
  br i1 %exitcond, label %if.end53.loopexit, label %for.body29

if.end53.loopexit:                                ; preds = %for.body29
  br label %if.end53

if.end53:                                         ; preds = %if.end53.loopexit, %if.end8
  %call57 = tail call i64 @run(%struct.POS** %2, i64 %1, i1 zeroext true, i64 0, i64 %1)
  %call62 = tail call i64* @create1DArray(i32 0, i32 33) #6
  %4 = bitcast i64* %call62 to <2 x i64>*
  store <2 x i64> <i64 78, i64 45>, <2 x i64>* %4, align 8, !tbaa !1
  %arrayidx65 = getelementptr inbounds i64, i64* %call62, i64 2
  %5 = bitcast i64* %arrayidx65 to <2 x i64>*
  store <2 x i64> <i64 81, i64 117>, <2 x i64>* %5, align 8, !tbaa !1
  %arrayidx67 = getelementptr inbounds i64, i64* %call62, i64 4
  %6 = bitcast i64* %arrayidx67 to <2 x i64>*
  store <2 x i64> <i64 101, i64 101>, <2 x i64>* %6, align 8, !tbaa !1
  %arrayidx69 = getelementptr inbounds i64, i64* %call62, i64 6
  %7 = bitcast i64* %arrayidx69 to <2 x i64>*
  store <2 x i64> <i64 110, i64 32>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx71 = getelementptr inbounds i64, i64* %call62, i64 8
  %8 = bitcast i64* %arrayidx71 to <2 x i64>*
  store <2 x i64> <i64 80, i64 114>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx73 = getelementptr inbounds i64, i64* %call62, i64 10
  %9 = bitcast i64* %arrayidx73 to <2 x i64>*
  store <2 x i64> <i64 111, i64 98>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx75 = getelementptr inbounds i64, i64* %call62, i64 12
  %10 = bitcast i64* %arrayidx75 to <2 x i64>*
  store <2 x i64> <i64 108, i64 101>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx77 = getelementptr inbounds i64, i64* %call62, i64 14
  %11 = bitcast i64* %arrayidx77 to <2 x i64>*
  store <2 x i64> <i64 109, i64 32>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx79 = getelementptr inbounds i64, i64* %call62, i64 16
  %12 = bitcast i64* %arrayidx79 to <2 x i64>*
  store <2 x i64> <i64 111, i64 110>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx81 = getelementptr inbounds i64, i64* %call62, i64 18
  %13 = bitcast i64* %arrayidx81 to <2 x i64>*
  store <2 x i64> <i64 32, i64 97>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx83 = getelementptr inbounds i64, i64* %call62, i64 20
  %14 = bitcast i64* %arrayidx83 to <2 x i64>*
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx85 = getelementptr inbounds i64, i64* %call62, i64 22
  %15 = bitcast i64* %arrayidx85 to <2 x i64>*
  store <2 x i64> <i64 32, i64 88>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx87 = getelementptr inbounds i64, i64* %call62, i64 24
  %16 = bitcast i64* %arrayidx87 to <2 x i64>*
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx89 = getelementptr inbounds i64, i64* %call62, i64 26
  %17 = bitcast i64* %arrayidx89 to <2 x i64>*
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx91 = getelementptr inbounds i64, i64* %call62, i64 28
  %18 = bitcast i64* %arrayidx91 to <2 x i64>*
  store <2 x i64> <i64 111, i64 97>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx93 = getelementptr inbounds i64, i64* %call62, i64 30
  %19 = bitcast i64* %arrayidx93 to <2 x i64>*
  store <2 x i64> <i64 114, i64 100>, <2 x i64>* %19, align 8, !tbaa !1
  %arrayidx95 = getelementptr inbounds i64, i64* %call62, i64 32
  store i64 46, i64* %arrayidx95, align 8, !tbaa !1
  tail call void @println_s(i64* %call62, i64 33) #6
  %call100 = tail call i64* @create1DArray(i32 0, i32 4) #6
  %20 = bitcast i64* %call100 to <2 x i64>*
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %20, align 8, !tbaa !1
  %arrayidx103 = getelementptr inbounds i64, i64* %call100, i64 2
  %21 = bitcast i64* %arrayidx103 to <2 x i64>*
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %21, align 8, !tbaa !1
  tail call void @printf_s(i64* %call100, i64 4) #6
  %call105 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1)
  %call110 = tail call i64* @create1DArray(i32 0, i32 6) #6
  %22 = bitcast i64* %call110 to <2 x i64>*
  store <2 x i64> <i64 70, i64 111>, <2 x i64>* %22, align 8, !tbaa !1
  %arrayidx113 = getelementptr inbounds i64, i64* %call110, i64 2
  %23 = bitcast i64* %arrayidx113 to <2 x i64>*
  store <2 x i64> <i64 117, i64 110>, <2 x i64>* %23, align 8, !tbaa !1
  %arrayidx115 = getelementptr inbounds i64, i64* %call110, i64 4
  %24 = bitcast i64* %arrayidx115 to <2 x i64>*
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %24, align 8, !tbaa !1
  tail call void @printf_s(i64* %call110, i64 6) #6
  %call117 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %call57)
  %call122 = tail call i64* @create1DArray(i32 0, i32 11) #6
  %25 = bitcast i64* %call122 to <2 x i64>*
  store <2 x i64> <i64 32, i64 115>, <2 x i64>* %25, align 8, !tbaa !1
  %arrayidx125 = getelementptr inbounds i64, i64* %call122, i64 2
  %26 = bitcast i64* %arrayidx125 to <2 x i64>*
  store <2 x i64> <i64 111, i64 108>, <2 x i64>* %26, align 8, !tbaa !1
  %arrayidx127 = getelementptr inbounds i64, i64* %call122, i64 4
  %27 = bitcast i64* %arrayidx127 to <2 x i64>*
  store <2 x i64> <i64 117, i64 116>, <2 x i64>* %27, align 8, !tbaa !1
  %arrayidx129 = getelementptr inbounds i64, i64* %call122, i64 6
  %28 = bitcast i64* %arrayidx129 to <2 x i64>*
  store <2 x i64> <i64 105, i64 111>, <2 x i64>* %28, align 8, !tbaa !1
  %arrayidx131 = getelementptr inbounds i64, i64* %call122, i64 8
  %29 = bitcast i64* %arrayidx131 to <2 x i64>*
  store <2 x i64> <i64 110, i64 115>, <2 x i64>* %29, align 8, !tbaa !1
  %arrayidx133 = getelementptr inbounds i64, i64* %call122, i64 10
  store i64 46, i64* %arrayidx133, align 8, !tbaa !1
  tail call void @println_s(i64* %call122, i64 11) #6
  %phitmp = bitcast i64* %call122 to i8*
  %phitmp328 = bitcast i64* %call110 to i8*
  %phitmp329 = bitcast i64* %call100 to i8*
  %phitmp330 = bitcast i64* %call62 to i8*
  br label %if.then135

if.then135:                                       ; preds = %if.end53, %entry
  %_11.0 = phi i8* [ undef, %entry ], [ %call12, %if.end53 ]
  %_11_dealloc.0 = phi i1 [ false, %entry ], [ true, %if.end53 ]
  %_17.0 = phi i8* [ null, %entry ], [ %phitmp330, %if.end53 ]
  %_20.0 = phi i8* [ null, %entry ], [ %phitmp329, %if.end53 ]
  %_25.0 = phi i8* [ null, %entry ], [ %phitmp328, %if.end53 ]
  %_30.0 = phi i8* [ null, %entry ], [ %phitmp, %if.end53 ]
  %30 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %30) #6
  tail call void @free2DArray(i64** %call, i64 %conv) #6
  br i1 %_11_dealloc.0, label %if.then165, label %if.end196

if.then165:                                       ; preds = %if.then135
  tail call void @free(i8* %_11.0) #6
  tail call void @free(i8* %_17.0) #6
  tail call void @free(i8* %_20.0) #6
  tail call void @free(i8* %_25.0) #6
  tail call void @free(i8* %_30.0) #6
  br label %if.end196

if.end196:                                        ; preds = %if.then135, %if.then165
  tail call void @exit(i32 0) #9
  unreachable
}

declare void @free2DArray(i64**, i64) local_unnamed_addr #5

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #5

declare i64* @parseStringToInt(i64*) local_unnamed_addr #5

declare i64* @create1DArray(i32, i32) local_unnamed_addr #5

declare void @println_s(i64*, i64) local_unnamed_addr #5

declare void @printf_s(i64*, i64) local_unnamed_addr #5

declare i32 @putchar(i32) local_unnamed_addr

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #7

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { argmemonly nounwind }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!8, !2, i64 0}
!8 = !{!"", !2, i64 0, !2, i64 8}
!9 = !{!8, !2, i64 8}
