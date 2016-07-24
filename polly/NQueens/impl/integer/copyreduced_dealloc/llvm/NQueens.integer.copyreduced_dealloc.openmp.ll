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
  br i1 %cmp, label %if.end, label %blklab6

if.end:                                           ; preds = %entry
  br i1 %queens_dealloc, label %for.cond.preheader, label %cleanup

for.cond.preheader:                               ; preds = %if.end
  %cmp3238 = icmp sgt i64 %queens_size, 0
  br i1 %cmp3238, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %for.cond.preheader
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %for.cond.preheader
  %0 = bitcast %struct.POS** %queens to i8*
  tail call void @free(i8* %0) #6
  br label %cleanup

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %indvars.iv
  %1 = bitcast %struct.POS** %arrayidx to i8**
  %2 = load i8*, i8** %1, align 8, !tbaa !5
  tail call void @free(i8* %2) #6
  store %struct.POS* null, %struct.POS** %arrayidx, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %queens_size
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body

blklab6:                                          ; preds = %entry
  %cmp17 = icmp slt i64 %n, %queens_size
  %cmp21 = icmp eq i64 %dim, %queens_size
  %or.cond = and i1 %cmp17, %cmp21
  br i1 %or.cond, label %blklab10.lr.ph, label %blklab11

blklab10.lr.ph:                                   ; preds = %blklab6
  %frombool = zext i1 %queens_dealloc to i8
  %cmp25258 = icmp sgt i64 %dim, 0
  br i1 %cmp25258, label %blklab14.preheader.lr.ph, label %blklab8

blklab14.preheader.lr.ph:                         ; preds = %blklab10.lr.ph
  %cmp44256 = icmp sgt i64 %n, 0
  %arrayidx71 = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %n
  %3 = bitcast %struct.POS** %arrayidx71 to i8**
  %add74 = add nsw i64 %n, 1
  %mul.i = shl i64 %dim, 3
  br i1 %cmp44256, label %blklab14.preheader.us.preheader, label %for.body.i.preheader.preheader

for.body.i.preheader.preheader:                   ; preds = %blklab14.preheader.lr.ph
  br label %for.body.i.preheader

blklab14.preheader.us.preheader:                  ; preds = %blklab14.preheader.lr.ph
  br label %blklab14.preheader.us

blklab14.preheader.us:                            ; preds = %blklab14.preheader.us.preheader, %blklab22.us
  %col.0246261.us = phi i64 [ %add78.us, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  %num_solutions.0247260.us = phi i64 [ %num_solutions.1.us, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  %queens_dealloc.addr.0248259.us = phi i8 [ %queens_dealloc.addr.1.us, %blklab22.us ], [ %frombool, %blklab14.preheader.us.preheader ]
  br label %polly.split_new_and_old.us

for.body.i.us.preheader:                          ; preds = %blklab14.blklab12_crit_edge.us
  %call70.us = tail call noalias i8* @malloc(i64 16) #6
  %c.us = getelementptr inbounds i8, i8* %call70.us, i64 8
  %4 = bitcast i8* %c.us to i64*
  store i64 %col.0246261.us, i64* %4, align 8, !tbaa !9
  %r.us = bitcast i8* %call70.us to i64*
  store i64 %n, i64* %r.us, align 8, !tbaa !7
  %5 = load i8*, i8** %3, align 8, !tbaa !5
  tail call void @free(i8* %5) #6
  store i8* %call70.us, i8** %3, align 8, !tbaa !5
  %call.i.us = tail call noalias i8* @malloc(i64 %mul.i) #6
  %6 = bitcast i8* %call.i.us to %struct.POS**
  br label %for.body.i.us

for.body.i.us:                                    ; preds = %for.body.i.us.preheader, %for.body.i.us
  %indvars.iv.i.us = phi i64 [ %indvars.iv.next.i.us, %for.body.i.us ], [ 0, %for.body.i.us.preheader ]
  %arrayidx.i.us = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %indvars.iv.i.us
  %7 = bitcast %struct.POS** %arrayidx.i.us to <2 x i64>**
  %8 = load <2 x i64>*, <2 x i64>** %7, align 8, !tbaa !5
  %call.i.i.us = tail call noalias i8* @malloc(i64 16) #6
  %9 = load <2 x i64>, <2 x i64>* %8, align 8, !tbaa !1
  %10 = bitcast i8* %call.i.i.us to <2 x i64>*
  store <2 x i64> %9, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx4.i.us = getelementptr inbounds %struct.POS*, %struct.POS** %6, i64 %indvars.iv.i.us
  %11 = bitcast %struct.POS** %arrayidx4.i.us to i8**
  store i8* %call.i.i.us, i8** %11, align 8, !tbaa !5
  %indvars.iv.next.i.us = add nuw nsw i64 %indvars.iv.i.us, 1
  %exitcond.i.us = icmp eq i64 %indvars.iv.next.i.us, %dim
  br i1 %exitcond.i.us, label %copy_array_POS.exit.us, label %for.body.i.us

copy_array_POS.exit.us:                           ; preds = %for.body.i.us
  %call76.us = tail call i64 @run(%struct.POS** nonnull %6, i64 %dim, i1 zeroext true, i64 %add74, i64 %dim)
  %add77.us = add nsw i64 %call76.us, %num_solutions.0247260.us
  br label %blklab22.us

blklab22.us:                                      ; preds = %copy_array_POS.exit.us, %blklab14.blklab12_crit_edge.us
  %num_solutions.1.us = phi i64 [ %num_solutions.0247260.us, %blklab14.blklab12_crit_edge.us ], [ %add77.us, %copy_array_POS.exit.us ]
  %queens_dealloc.addr.1.us = phi i8 [ %queens_dealloc.addr.0248259.us, %blklab14.blklab12_crit_edge.us ], [ 1, %copy_array_POS.exit.us ]
  %add78.us = add nuw nsw i64 %col.0246261.us, 1
  %exitcond268 = icmp eq i64 %add78.us, %dim
  br i1 %exitcond268, label %blklab8.loopexit, label %blklab14.preheader.us

polly.split_new_and_old.us:                       ; preds = %blklab18.us, %blklab14.preheader.us
  %12 = phi i1 [ true, %blklab14.preheader.us ], [ %19, %blklab18.us ]
  %i.0244257.us = phi i64 [ 0, %blklab14.preheader.us ], [ %add.us, %blklab18.us ]
  br i1 %12, label %blklab20.us, label %blklab18.us

blklab20.us:                                      ; preds = %polly.split_new_and_old.us
  %arrayidx48.us = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %i.0244257.us
  %13 = load %struct.POS*, %struct.POS** %arrayidx48.us, align 8, !tbaa !5
  %r1.i.us = getelementptr inbounds %struct.POS, %struct.POS* %13, i64 0, i32 0
  %14 = load i64, i64* %r1.i.us, align 8, !tbaa !7
  %c2.i.us = getelementptr inbounds %struct.POS, %struct.POS* %13, i64 0, i32 1
  %15 = load i64, i64* %c2.i.us, align 8, !tbaa !9
  %cmp.i.us = icmp eq i64 %14, %n
  %cmp3.i.us = icmp eq i64 %15, %col.0246261.us
  %or.cond.i.us = or i1 %cmp.i.us, %cmp3.i.us
  br i1 %or.cond.i.us, label %conflict.exit.us, label %blklab0.i.us

blklab0.i.us:                                     ; preds = %blklab20.us
  %sub.i.us = sub nsw i64 %15, %col.0246261.us
  %ispos.i.us = icmp sgt i64 %sub.i.us, -1
  %neg.i.us = sub i64 0, %sub.i.us
  %16 = select i1 %ispos.i.us, i64 %sub.i.us, i64 %neg.i.us
  %sub8.i.us = sub nsw i64 %14, %n
  %ispos49.i.us = icmp sgt i64 %sub8.i.us, -1
  %neg50.i.us = sub i64 0, %sub8.i.us
  %17 = select i1 %ispos49.i.us, i64 %sub8.i.us, i64 %neg50.i.us
  %cmp10.i.us = icmp eq i64 %16, %17
  %..i.us = zext i1 %cmp10.i.us to i64
  br label %conflict.exit.us

conflict.exit.us:                                 ; preds = %blklab0.i.us, %blklab20.us
  %retval.0.i.us = phi i64 [ %..i.us, %blklab0.i.us ], [ 1, %blklab20.us ]
  %18 = xor i64 %retval.0.i.us, 1
  br label %blklab18.us

blklab18.us:                                      ; preds = %conflict.exit.us, %polly.split_new_and_old.us
  %_23.0.ph.merge.us = phi i64 [ %18, %conflict.exit.us ], [ 0, %polly.split_new_and_old.us ]
  %add.us = add nuw nsw i64 %i.0244257.us, 1
  %19 = icmp eq i64 %_23.0.ph.merge.us, 1
  %exitcond267 = icmp eq i64 %add.us, %n
  br i1 %exitcond267, label %blklab14.blklab12_crit_edge.us, label %polly.split_new_and_old.us

blklab14.blklab12_crit_edge.us:                   ; preds = %blklab18.us
  br i1 %19, label %for.body.i.us.preheader, label %blklab22.us

blklab11:                                         ; preds = %blklab6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %20) #8
  tail call void @exit(i32 -1) #9
  unreachable

for.body.i.preheader:                             ; preds = %for.body.i.preheader.preheader, %copy_array_POS.exit
  %col.0246261 = phi i64 [ %add78, %copy_array_POS.exit ], [ 0, %for.body.i.preheader.preheader ]
  %num_solutions.0247260 = phi i64 [ %add77, %copy_array_POS.exit ], [ 0, %for.body.i.preheader.preheader ]
  %call70 = tail call noalias i8* @malloc(i64 16) #6
  %c = getelementptr inbounds i8, i8* %call70, i64 8
  %22 = bitcast i8* %c to i64*
  store i64 %col.0246261, i64* %22, align 8, !tbaa !9
  %r = bitcast i8* %call70 to i64*
  store i64 %n, i64* %r, align 8, !tbaa !7
  %23 = load i8*, i8** %3, align 8, !tbaa !5
  tail call void @free(i8* %23) #6
  store i8* %call70, i8** %3, align 8, !tbaa !5
  %call.i = tail call noalias i8* @malloc(i64 %mul.i) #6
  %24 = bitcast i8* %call.i to %struct.POS**
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.preheader, %for.body.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %for.body.i.preheader ]
  %arrayidx.i = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %indvars.iv.i
  %25 = bitcast %struct.POS** %arrayidx.i to <2 x i64>**
  %26 = load <2 x i64>*, <2 x i64>** %25, align 8, !tbaa !5
  %call.i.i = tail call noalias i8* @malloc(i64 16) #6
  %27 = load <2 x i64>, <2 x i64>* %26, align 8, !tbaa !1
  %28 = bitcast i8* %call.i.i to <2 x i64>*
  store <2 x i64> %27, <2 x i64>* %28, align 8, !tbaa !1
  %arrayidx4.i = getelementptr inbounds %struct.POS*, %struct.POS** %24, i64 %indvars.iv.i
  %29 = bitcast %struct.POS** %arrayidx4.i to i8**
  store i8* %call.i.i, i8** %29, align 8, !tbaa !5
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %dim
  br i1 %exitcond.i, label %copy_array_POS.exit, label %for.body.i

copy_array_POS.exit:                              ; preds = %for.body.i
  %call76 = tail call i64 @run(%struct.POS** nonnull %24, i64 %dim, i1 zeroext true, i64 %add74, i64 %dim)
  %add77 = add nsw i64 %call76, %num_solutions.0247260
  %add78 = add nuw nsw i64 %col.0246261, 1
  %exitcond269 = icmp eq i64 %add78, %dim
  br i1 %exitcond269, label %for.cond83.preheader.loopexit, label %for.body.i.preheader

blklab8.loopexit:                                 ; preds = %blklab22.us
  br label %blklab8

blklab8:                                          ; preds = %blklab8.loopexit, %blklab10.lr.ph
  %num_solutions.0247.lcssa = phi i64 [ 0, %blklab10.lr.ph ], [ %num_solutions.1.us, %blklab8.loopexit ]
  %queens_dealloc.addr.0248.lcssa = phi i8 [ %frombool, %blklab10.lr.ph ], [ %queens_dealloc.addr.1.us, %blklab8.loopexit ]
  %30 = and i8 %queens_dealloc.addr.0248.lcssa, 1
  %tobool79 = icmp eq i8 %30, 0
  br i1 %tobool79, label %cleanup, label %for.cond83.preheader

for.cond83.preheader.loopexit:                    ; preds = %copy_array_POS.exit
  br label %for.cond83.preheader

for.cond83.preheader:                             ; preds = %for.cond83.preheader.loopexit, %blklab8
  %num_solutions.0247.lcssa271 = phi i64 [ %num_solutions.0247.lcssa, %blklab8 ], [ %add77, %for.cond83.preheader.loopexit ]
  br i1 %cmp25258, label %for.body88.preheader, label %for.cond.cleanup87

for.body88.preheader:                             ; preds = %for.cond83.preheader
  br label %for.body88

for.cond.cleanup87.loopexit:                      ; preds = %for.body88
  br label %for.cond.cleanup87

for.cond.cleanup87:                               ; preds = %for.cond.cleanup87.loopexit, %for.cond83.preheader
  %31 = bitcast %struct.POS** %queens to i8*
  tail call void @free(i8* %31) #6
  br label %cleanup

for.body88:                                       ; preds = %for.body88.preheader, %for.body88
  %indvars.iv254 = phi i64 [ %indvars.iv.next255, %for.body88 ], [ 0, %for.body88.preheader ]
  %arrayidx90 = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %indvars.iv254
  %32 = bitcast %struct.POS** %arrayidx90 to i8**
  %33 = load i8*, i8** %32, align 8, !tbaa !5
  tail call void @free(i8* %33) #6
  store %struct.POS* null, %struct.POS** %arrayidx90, align 8, !tbaa !5
  %indvars.iv.next255 = add nuw nsw i64 %indvars.iv254, 1
  %exitcond266 = icmp eq i64 %indvars.iv.next255, %dim
  br i1 %exitcond266, label %for.cond.cleanup87.loopexit, label %for.body88

cleanup:                                          ; preds = %blklab8, %for.cond.cleanup87, %for.cond.cleanup, %if.end
  %retval.0 = phi i64 [ 1, %if.end ], [ 1, %for.cond.cleanup ], [ %num_solutions.0247.lcssa271, %for.cond.cleanup87 ], [ %num_solutions.0247.lcssa, %blklab8 ]
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
  br i1 %cmp, label %if.end196.critedge, label %if.end8

if.end8:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %mul = shl i64 %1, 3
  %call22 = tail call noalias i8* @malloc(i64 %mul) #6
  %2 = bitcast i8* %call22 to %struct.POS**
  %cmp26340 = icmp sgt i64 %1, 0
  br i1 %cmp26340, label %for.body29.preheader, label %for.cond141.preheader

for.body29.preheader:                             ; preds = %if.end8
  br label %for.body29

for.body29:                                       ; preds = %for.body29.preheader, %for.body29
  %indvars.iv343 = phi i64 [ %indvars.iv.next344, %for.body29 ], [ 0, %for.body29.preheader ]
  %call.i = tail call noalias i8* @malloc(i64 16) #6
  %arrayidx32 = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv343
  %3 = bitcast %struct.POS** %arrayidx32 to i8**
  call void @llvm.memset.p0i8.i64(i8* %call.i, i8 0, i64 16, i32 8, i1 false)
  store i8* %call.i, i8** %3, align 8, !tbaa !5
  %indvars.iv.next344 = add nuw nsw i64 %indvars.iv343, 1
  %exitcond354 = icmp eq i64 %indvars.iv.next344, %1
  br i1 %exitcond354, label %for.cond141.preheader.loopexit, label %for.body29

for.cond141.preheader.loopexit:                   ; preds = %for.body29
  br label %for.cond141.preheader

for.cond141.preheader:                            ; preds = %for.cond141.preheader.loopexit, %if.end8
  %call57 = tail call i64 @run(%struct.POS** %2, i64 %1, i1 zeroext false, i64 0, i64 %1)
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
  %30 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %30) #6
  br i1 %cmp26340, label %for.body146.preheader, label %if.then165

for.body146.preheader:                            ; preds = %for.cond141.preheader
  br label %for.body146

for.body146:                                      ; preds = %for.body146.preheader, %for.body146
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body146 ], [ 0, %for.body146.preheader ]
  %arrayidx148 = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv
  %31 = bitcast %struct.POS** %arrayidx148 to i8**
  %32 = load i8*, i8** %31, align 8, !tbaa !5
  tail call void @free(i8* %32) #6
  store %struct.POS* null, %struct.POS** %arrayidx148, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %1
  br i1 %exitcond, label %if.then165.loopexit, label %for.body146

if.then165.loopexit:                              ; preds = %for.body146
  br label %if.then165

if.then165:                                       ; preds = %if.then165.loopexit, %for.cond141.preheader
  tail call void @free(i8* %call22) #6
  tail call void @free2DArray(i64** %call, i64 %conv) #6
  tail call void @free(i8* %phitmp330) #6
  tail call void @free(i8* %phitmp329) #6
  tail call void @free(i8* %phitmp328) #6
  tail call void @free(i8* %phitmp) #6
  br label %if.end196

if.end196.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #6
  br label %if.end196

if.end196:                                        ; preds = %if.end196.critedge, %if.then165
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
