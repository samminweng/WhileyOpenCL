; ModuleID = 'NQueens.c'
source_filename = "NQueens.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.POS = type { i64, i64 }

@.str.1 = private unnamed_addr constant [4 x i8] c" r:\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" c:\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.POS* @copy_POS(%struct.POS* nocapture readonly %_POS) #0 {
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
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias %struct.POS** @copy_array_POS(%struct.POS** nocapture readonly %_POS, i64 %_POS_size) #0 {
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
define void @free_POS(%struct.POS* %pos) #0 {
entry:
  %0 = bitcast %struct.POS* %pos to i8*
  tail call void @free(i8* %0) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @printf_POS(%struct.POS* nocapture readonly %pos) #0 {
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
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind uwtable
define i64 @conflict(%struct.POS* %p, i1 zeroext %p_has_ownership, i64 %row, i64 %col) #0 {
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
  br i1 %p_has_ownership, label %if.then6, label %cleanup

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
  br i1 %p_has_ownership, label %if.then14, label %cleanup

if.then14:                                        ; preds = %blklab0
  %5 = bitcast %struct.POS* %p to i8*
  tail call void @free(i8* %5) #6
  br label %cleanup

cleanup:                                          ; preds = %blklab0, %if.then14, %blklab1, %if.then6
  %retval.0 = phi i64 [ 1, %if.then6 ], [ 1, %blklab1 ], [ %., %if.then14 ], [ %., %blklab0 ]
  ret i64 %retval.0
}

; Function Attrs: nounwind uwtable
define i64 @run(%struct.POS** %queens, i64 %queens_size, i1 zeroext %queens_has_ownership, i64 %n, i64 %dim) #2 {
entry:
  %cmp = icmp eq i64 %dim, %n
  br i1 %cmp, label %if.end, label %while.cond.preheader

while.cond.preheader:                             ; preds = %entry
  %cmp12 = icmp slt i64 %n, %queens_size
  %cmp15 = icmp eq i64 %dim, %queens_size
  %or.cond = and i1 %cmp12, %cmp15
  br i1 %or.cond, label %blklab10.preheader, label %blklab11

blklab10.preheader:                               ; preds = %while.cond.preheader
  %cmp33230 = icmp sgt i64 %n, 0
  %arrayidx57 = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %n
  %0 = bitcast %struct.POS** %arrayidx57 to i8**
  %add58 = add nsw i64 %n, 1
  %cmp18.us247 = icmp sgt i64 %dim, 0
  br i1 %cmp18.us247, label %blklab14.preheader.us.preheader, label %blklab8

blklab14.preheader.us.preheader:                  ; preds = %blklab10.preheader
  br label %blklab14.preheader.us

blklab12.us:                                      ; preds = %blklab18.us
  %_23.0.ph.merge.us.lcssa = phi i64 [ %_23.0.ph.merge.us, %blklab18.us ]
  %call.i.us.lcssa = phi i8* [ %call.i.us, %blklab18.us ]
  %cmp50.us = icmp eq i64 %_23.0.ph.merge.us.lcssa, 1
  br i1 %cmp50.us, label %if.end52.us, label %blklab22.us

if.end52.us:                                      ; preds = %blklab14.preheader.us, %blklab12.us
  %p_has_ownership.1198.lcssa.us244 = phi i8 [ 1, %blklab12.us ], [ %p_has_ownership.0201.us255, %blklab14.preheader.us ]
  %.lcssa.us242 = phi i8* [ %call.i.us.lcssa, %blklab12.us ], [ %19, %blklab14.preheader.us ]
  %.lcssa222.us240 = phi i8* [ %call.i.us.lcssa, %blklab12.us ], [ %18, %blklab14.preheader.us ]
  %1 = and i8 %_27_has_ownership.0206.us248, 1
  %tobool53.us = icmp eq i8 %1, 0
  br i1 %tobool53.us, label %if.end55.us, label %if.then54.us

if.then54.us:                                     ; preds = %if.end52.us
  tail call void @free(i8* %20) #6
  br label %if.end55.us

if.end55.us:                                      ; preds = %if.then54.us, %if.end52.us
  %call56.us = tail call noalias i8* @malloc(i64 16) #6
  %c.us = getelementptr inbounds i8, i8* %call56.us, i64 8
  %2 = bitcast i8* %c.us to i64*
  store i64 %col.0202.us252, i64* %2, align 8, !tbaa !9
  %r.us = bitcast i8* %call56.us to i64*
  store i64 %n, i64* %r.us, align 8, !tbaa !7
  store i8* %call56.us, i8** %0, align 8, !tbaa !5
  %call59.us = tail call i64 @run(%struct.POS** %queens, i64 %dim, i1 zeroext false, i64 %add58, i64 %dim)
  %add60.us = add nsw i64 %call59.us, %num_solutions.0204.us250
  br label %blklab22.us

blklab22.us:                                      ; preds = %if.end55.us, %blklab12.us
  %p_has_ownership.1198.lcssa.us243 = phi i8 [ 1, %blklab12.us ], [ %p_has_ownership.1198.lcssa.us244, %if.end55.us ]
  %.lcssa.us241 = phi i8* [ %call.i.us.lcssa, %blklab12.us ], [ %.lcssa.us242, %if.end55.us ]
  %.lcssa222.us239 = phi i8* [ %call.i.us.lcssa, %blklab12.us ], [ %.lcssa222.us240, %if.end55.us ]
  %num_solutions.1.us = phi i64 [ %num_solutions.0204.us250, %blklab12.us ], [ %add60.us, %if.end55.us ]
  %3 = phi i8* [ %21, %blklab12.us ], [ %call56.us, %if.end55.us ]
  %4 = phi i8* [ %20, %blklab12.us ], [ %call56.us, %if.end55.us ]
  %_27_has_ownership.1.us = phi i8 [ %_27_has_ownership.0206.us248, %blklab12.us ], [ 1, %if.end55.us ]
  %add61.us = add nuw nsw i64 %col.0202.us252, 1
  %cmp18.us = icmp slt i64 %add61.us, %dim
  br i1 %cmp18.us, label %blklab14.preheader.us, label %blklab8.loopexit

if.end38.us:                                      ; preds = %if.end38.us.preheader, %blklab18.us
  %i.0196233.us = phi i64 [ %add.us, %blklab18.us ], [ 0, %if.end38.us.preheader ]
  %5 = phi i8* [ %call.i.us, %blklab18.us ], [ %18, %if.end38.us.preheader ]
  %p_has_ownership.1198232.us = phi i8 [ 1, %blklab18.us ], [ %p_has_ownership.0201.us255, %if.end38.us.preheader ]
  %isSolution.0199231.us = phi i64 [ %_23.0.ph.merge.us, %blklab18.us ], [ 1, %if.end38.us.preheader ]
  %arrayidx.us = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %i.0196233.us
  %6 = bitcast %struct.POS** %arrayidx.us to <2 x i64>**
  %7 = load <2 x i64>*, <2 x i64>** %6, align 8, !tbaa !5
  %call.i.us = tail call noalias i8* @malloc(i64 16) #6
  %r1.i.us = bitcast i8* %call.i.us to i64*
  %8 = load <2 x i64>, <2 x i64>* %7, align 8, !tbaa !1
  %c2.i.us = getelementptr inbounds i8, i8* %call.i.us, i64 8
  %9 = bitcast i8* %c2.i.us to i64*
  %10 = bitcast i8* %call.i.us to <2 x i64>*
  store <2 x i64> %8, <2 x i64>* %10, align 8, !tbaa !1
  %11 = and i8 %p_has_ownership.1198232.us, 1
  %tobool40.us = icmp eq i8 %11, 0
  br i1 %tobool40.us, label %polly.split_new_and_old.us, label %if.then41.us

if.then41.us:                                     ; preds = %if.end38.us
  tail call void @free(i8* %5) #6
  br label %polly.split_new_and_old.us

polly.split_new_and_old.us:                       ; preds = %if.then41.us, %if.end38.us
  %12 = icmp eq i64 %isSolution.0199231.us, 1
  br i1 %12, label %blklab20.us, label %blklab18.us

blklab20.us:                                      ; preds = %polly.split_new_and_old.us
  %13 = load i64, i64* %r1.i.us, align 8, !tbaa !7
  %14 = load i64, i64* %9, align 8, !tbaa !9
  %cmp.i.us = icmp eq i64 %13, %n
  %cmp3.i.us = icmp eq i64 %14, %col.0202.us252
  %or.cond.i.us = or i1 %cmp.i.us, %cmp3.i.us
  br i1 %or.cond.i.us, label %conflict.exit.us, label %blklab0.i.us

blklab0.i.us:                                     ; preds = %blklab20.us
  %sub.i.us = sub nsw i64 %14, %col.0202.us252
  %ispos.i.us = icmp sgt i64 %sub.i.us, -1
  %neg.i.us = sub i64 0, %sub.i.us
  %15 = select i1 %ispos.i.us, i64 %sub.i.us, i64 %neg.i.us
  %sub8.i.us = sub nsw i64 %13, %n
  %ispos49.i.us = icmp sgt i64 %sub8.i.us, -1
  %neg50.i.us = sub i64 0, %sub8.i.us
  %16 = select i1 %ispos49.i.us, i64 %sub8.i.us, i64 %neg50.i.us
  %cmp10.i.us = icmp eq i64 %15, %16
  %..i.us = zext i1 %cmp10.i.us to i64
  br label %conflict.exit.us

conflict.exit.us:                                 ; preds = %blklab0.i.us, %blklab20.us
  %retval.0.i.us = phi i64 [ %..i.us, %blklab0.i.us ], [ 1, %blklab20.us ]
  %17 = xor i64 %retval.0.i.us, 1
  br label %blklab18.us

blklab18.us:                                      ; preds = %conflict.exit.us, %polly.split_new_and_old.us
  %_23.0.ph.merge.us = phi i64 [ %17, %conflict.exit.us ], [ 0, %polly.split_new_and_old.us ]
  %add.us = add nuw nsw i64 %i.0196233.us, 1
  %exitcond = icmp eq i64 %add.us, %n
  br i1 %exitcond, label %blklab12.us, label %if.end38.us

blklab14.preheader.us:                            ; preds = %blklab14.preheader.us.preheader, %blklab22.us
  %18 = phi i8* [ %.lcssa222.us239, %blklab22.us ], [ undef, %blklab14.preheader.us.preheader ]
  %19 = phi i8* [ %.lcssa.us241, %blklab22.us ], [ undef, %blklab14.preheader.us.preheader ]
  %p_has_ownership.0201.us255 = phi i8 [ %p_has_ownership.1198.lcssa.us243, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  %col.0202.us252 = phi i64 [ %add61.us, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  %num_solutions.0204.us250 = phi i64 [ %num_solutions.1.us, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  %20 = phi i8* [ %4, %blklab22.us ], [ undef, %blklab14.preheader.us.preheader ]
  %21 = phi i8* [ %3, %blklab22.us ], [ undef, %blklab14.preheader.us.preheader ]
  %_27_has_ownership.0206.us248 = phi i8 [ %_27_has_ownership.1.us, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  br i1 %cmp33230, label %if.end38.us.preheader, label %if.end52.us

if.end38.us.preheader:                            ; preds = %blklab14.preheader.us
  br label %if.end38.us

if.end:                                           ; preds = %entry
  br i1 %queens_has_ownership, label %if.then1, label %cleanup

if.then1:                                         ; preds = %if.end
  %22 = bitcast %struct.POS** %queens to i8*
  tail call void @free(i8* %22) #6
  br label %cleanup

blklab11:                                         ; preds = %while.cond.preheader
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %23) #8
  tail call void @exit(i32 -1) #9
  unreachable

blklab8.loopexit:                                 ; preds = %blklab22.us
  %_27_has_ownership.1.us.lcssa = phi i8 [ %_27_has_ownership.1.us, %blklab22.us ]
  %.lcssa261 = phi i8* [ %3, %blklab22.us ]
  %num_solutions.1.us.lcssa = phi i64 [ %num_solutions.1.us, %blklab22.us ]
  %.lcssa.us241.lcssa = phi i8* [ %.lcssa.us241, %blklab22.us ]
  %p_has_ownership.1198.lcssa.us243.lcssa = phi i8 [ %p_has_ownership.1198.lcssa.us243, %blklab22.us ]
  br label %blklab8

blklab8:                                          ; preds = %blklab8.loopexit, %blklab10.preheader
  %.lcssa246 = phi i8* [ undef, %blklab10.preheader ], [ %.lcssa.us241.lcssa, %blklab8.loopexit ]
  %p_has_ownership.0201.us.lcssa = phi i8 [ 0, %blklab10.preheader ], [ %p_has_ownership.1198.lcssa.us243.lcssa, %blklab8.loopexit ]
  %num_solutions.0204.us.lcssa = phi i64 [ 0, %blklab10.preheader ], [ %num_solutions.1.us.lcssa, %blklab8.loopexit ]
  %.lcssa = phi i8* [ undef, %blklab10.preheader ], [ %.lcssa261, %blklab8.loopexit ]
  %_27_has_ownership.0206.us.lcssa = phi i8 [ 0, %blklab10.preheader ], [ %_27_has_ownership.1.us.lcssa, %blklab8.loopexit ]
  br i1 %queens_has_ownership, label %if.then63, label %if.end64

if.then63:                                        ; preds = %blklab8
  %25 = bitcast %struct.POS** %queens to i8*
  tail call void @free(i8* %25) #6
  br label %if.end64

if.end64:                                         ; preds = %if.then63, %blklab8
  %26 = and i8 %p_has_ownership.0201.us.lcssa, 1
  %tobool65 = icmp eq i8 %26, 0
  br i1 %tobool65, label %if.end70, label %if.then66

if.then66:                                        ; preds = %if.end64
  tail call void @free(i8* %.lcssa246) #6
  br label %if.end70

if.end70:                                         ; preds = %if.then66, %if.end64
  %27 = and i8 %_27_has_ownership.0206.us.lcssa, 1
  %tobool71 = icmp eq i8 %27, 0
  br i1 %tobool71, label %cleanup, label %if.then72

if.then72:                                        ; preds = %if.end70
  tail call void @free(i8* %.lcssa) #6
  br label %cleanup

cleanup:                                          ; preds = %if.then72, %if.end70, %if.then1, %if.end
  %retval.0 = phi i64 [ 1, %if.end ], [ 1, %if.then1 ], [ %num_solutions.0204.us.lcssa, %if.end70 ], [ %num_solutions.0204.us.lcssa, %if.then72 ]
  ret i64 %retval.0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #4 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !5
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end117.critedge, label %if.end

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %mul = shl i64 %1, 3
  %call9 = tail call noalias i8* @malloc(i64 %mul) #6
  %2 = bitcast i8* %call9 to %struct.POS**
  %cmp11213 = icmp sgt i64 %1, 0
  br i1 %cmp11213, label %for.body.preheader, label %if.then92

for.body.preheader:                               ; preds = %if.end
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %call.i = tail call noalias i8* @malloc(i64 16) #6
  %arrayidx14 = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv
  %3 = bitcast %struct.POS** %arrayidx14 to i8**
  call void @llvm.memset.p0i8.i64(i8* %call.i, i8 0, i64 16, i32 8, i1 false)
  store i8* %call.i, i8** %3, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %1
  br i1 %exitcond, label %if.then92.loopexit, label %for.body

if.then92.loopexit:                               ; preds = %for.body
  br label %if.then92

if.then92:                                        ; preds = %if.then92.loopexit, %if.end
  %call18 = tail call i64 @run(%struct.POS** %2, i64 %1, i1 zeroext false, i64 0, i64 %1)
  %call22 = tail call noalias i8* @malloc(i64 264) #6
  %4 = bitcast i8* %call22 to i64*
  %5 = bitcast i8* %call22 to <2 x i64>*
  store <2 x i64> <i64 78, i64 45>, <2 x i64>* %5, align 8, !tbaa !1
  %arrayidx25 = getelementptr inbounds i8, i8* %call22, i64 16
  %6 = bitcast i8* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 81, i64 117>, <2 x i64>* %6, align 8, !tbaa !1
  %arrayidx27 = getelementptr inbounds i8, i8* %call22, i64 32
  %7 = bitcast i8* %arrayidx27 to <2 x i64>*
  store <2 x i64> <i64 101, i64 101>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx29 = getelementptr inbounds i8, i8* %call22, i64 48
  %8 = bitcast i8* %arrayidx29 to <2 x i64>*
  store <2 x i64> <i64 110, i64 32>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx31 = getelementptr inbounds i8, i8* %call22, i64 64
  %9 = bitcast i8* %arrayidx31 to <2 x i64>*
  store <2 x i64> <i64 80, i64 114>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx33 = getelementptr inbounds i8, i8* %call22, i64 80
  %10 = bitcast i8* %arrayidx33 to <2 x i64>*
  store <2 x i64> <i64 111, i64 98>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx35 = getelementptr inbounds i8, i8* %call22, i64 96
  %11 = bitcast i8* %arrayidx35 to <2 x i64>*
  store <2 x i64> <i64 108, i64 101>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx37 = getelementptr inbounds i8, i8* %call22, i64 112
  %12 = bitcast i8* %arrayidx37 to <2 x i64>*
  store <2 x i64> <i64 109, i64 32>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx39 = getelementptr inbounds i8, i8* %call22, i64 128
  %13 = bitcast i8* %arrayidx39 to <2 x i64>*
  store <2 x i64> <i64 111, i64 110>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx41 = getelementptr inbounds i8, i8* %call22, i64 144
  %14 = bitcast i8* %arrayidx41 to <2 x i64>*
  store <2 x i64> <i64 32, i64 97>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx43 = getelementptr inbounds i8, i8* %call22, i64 160
  %15 = bitcast i8* %arrayidx43 to <2 x i64>*
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx45 = getelementptr inbounds i8, i8* %call22, i64 176
  %16 = bitcast i8* %arrayidx45 to <2 x i64>*
  store <2 x i64> <i64 32, i64 88>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx47 = getelementptr inbounds i8, i8* %call22, i64 192
  %17 = bitcast i8* %arrayidx47 to <2 x i64>*
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx49 = getelementptr inbounds i8, i8* %call22, i64 208
  %18 = bitcast i8* %arrayidx49 to <2 x i64>*
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx51 = getelementptr inbounds i8, i8* %call22, i64 224
  %19 = bitcast i8* %arrayidx51 to <2 x i64>*
  store <2 x i64> <i64 111, i64 97>, <2 x i64>* %19, align 8, !tbaa !1
  %arrayidx53 = getelementptr inbounds i8, i8* %call22, i64 240
  %20 = bitcast i8* %arrayidx53 to <2 x i64>*
  store <2 x i64> <i64 114, i64 100>, <2 x i64>* %20, align 8, !tbaa !1
  %arrayidx55 = getelementptr inbounds i8, i8* %call22, i64 256
  %21 = bitcast i8* %arrayidx55 to i64*
  store i64 46, i64* %21, align 8, !tbaa !1
  tail call void @println_s(i64* %4, i64 33) #6
  %call59 = tail call noalias i8* @malloc(i64 32) #6
  %22 = bitcast i8* %call59 to i64*
  %23 = bitcast i8* %call59 to <2 x i64>*
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %23, align 8, !tbaa !1
  %arrayidx62 = getelementptr inbounds i8, i8* %call59, i64 16
  %24 = bitcast i8* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %24, align 8, !tbaa !1
  tail call void @printf_s(i64* %22, i64 4) #6
  %call64 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1)
  %call68 = tail call noalias i8* @malloc(i64 48) #6
  %25 = bitcast i8* %call68 to i64*
  %26 = bitcast i8* %call68 to <2 x i64>*
  store <2 x i64> <i64 70, i64 111>, <2 x i64>* %26, align 8, !tbaa !1
  %arrayidx71 = getelementptr inbounds i8, i8* %call68, i64 16
  %27 = bitcast i8* %arrayidx71 to <2 x i64>*
  store <2 x i64> <i64 117, i64 110>, <2 x i64>* %27, align 8, !tbaa !1
  %arrayidx73 = getelementptr inbounds i8, i8* %call68, i64 32
  %28 = bitcast i8* %arrayidx73 to <2 x i64>*
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %28, align 8, !tbaa !1
  tail call void @printf_s(i64* %25, i64 6) #6
  %call75 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %call18)
  %call79 = tail call noalias i8* @malloc(i64 88) #6
  %29 = bitcast i8* %call79 to i64*
  %30 = bitcast i8* %call79 to <2 x i64>*
  store <2 x i64> <i64 32, i64 115>, <2 x i64>* %30, align 8, !tbaa !1
  %arrayidx82 = getelementptr inbounds i8, i8* %call79, i64 16
  %31 = bitcast i8* %arrayidx82 to <2 x i64>*
  store <2 x i64> <i64 111, i64 108>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx84 = getelementptr inbounds i8, i8* %call79, i64 32
  %32 = bitcast i8* %arrayidx84 to <2 x i64>*
  store <2 x i64> <i64 117, i64 116>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx86 = getelementptr inbounds i8, i8* %call79, i64 48
  %33 = bitcast i8* %arrayidx86 to <2 x i64>*
  store <2 x i64> <i64 105, i64 111>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx88 = getelementptr inbounds i8, i8* %call79, i64 64
  %34 = bitcast i8* %arrayidx88 to <2 x i64>*
  store <2 x i64> <i64 110, i64 115>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx90 = getelementptr inbounds i8, i8* %call79, i64 80
  %35 = bitcast i8* %arrayidx90 to i64*
  store i64 46, i64* %35, align 8, !tbaa !1
  tail call void @println_s(i64* %29, i64 11) #6
  tail call void @free(i8* %call9) #6
  tail call void @free2DArray(i64** %call, i64 %conv) #6
  tail call void @free(i8* %call22) #6
  tail call void @free(i8* %call59) #6
  tail call void @free(i8* %call68) #6
  tail call void @free(i8* %call79) #6
  br label %if.end117

if.end117.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #6
  br label %if.end117

if.end117:                                        ; preds = %if.end117.critedge, %if.then92
  tail call void @exit(i32 0) #9
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #5

declare i64* @parseStringToInt(i64*) #5

declare void @println_s(i64*, i64) #5

declare void @printf_s(i64*, i64) #5

declare void @free2DArray(i64**, i64) #5

declare i32 @putchar(i32)

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

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

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git f0413f80c8330e9495069bc2d1358908bba19914) (http://llvm.org/git/llvm.git 84bc70bd9cdc366afa53717cb14d6abb7f201138)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!8, !2, i64 0}
!8 = !{!"", !2, i64 0, !2, i64 8}
!9 = !{!8, !2, i64 8}
