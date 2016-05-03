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

; Function Attrs: norecurse nounwind readonly uwtable
define i64 @conflict(%struct.POS* nocapture readonly %p, i64 %row, i64 %col) #2 {
entry:
  %polly.access.cast.p = getelementptr inbounds %struct.POS, %struct.POS* %p, i64 0, i32 0
  %polly.access.p.load = load i64, i64* %polly.access.cast.p, align 8
  %polly.access.p44 = getelementptr i64, i64* %polly.access.cast.p, i64 1
  %polly.access.p44.load = load i64, i64* %polly.access.p44, align 8
  %0 = icmp slt i64 %polly.access.p.load, %row
  %1 = icmp slt i64 %polly.access.p44.load, %col
  %2 = icmp sgt i64 %polly.access.p44.load, %col
  %3 = icmp ne i64 %polly.access.p44.load, %col
  %4 = and i1 %0, %3
  %5 = icmp sgt i64 %polly.access.p.load, %row
  %6 = and i1 %5, %1
  %7 = or i1 %4, %6
  %8 = and i1 %5, %2
  %9 = or i1 %8, %7
  br i1 %9, label %polly.stmt.blklab0, label %polly.exiting

polly.exiting:                                    ; preds = %entry, %polly.stmt.blklab0
  %retval.0.s2a.0 = phi i64 [ %p_., %polly.stmt.blklab0 ], [ 1, %entry ]
  ret i64 %retval.0.s2a.0

polly.stmt.blklab0:                               ; preds = %entry
  %p_sub = sub nsw i64 %polly.access.p44.load, %col
  %p_ispos = icmp sgt i64 %p_sub, -1
  %p_neg = sub i64 0, %p_sub
  %p_ = select i1 %p_ispos, i64 %p_sub, i64 %p_neg
  %p_sub6 = sub nsw i64 %polly.access.p.load, %row
  %p_ispos41 = icmp sgt i64 %p_sub6, -1
  %p_neg42 = sub i64 0, %p_sub6
  %p_46 = select i1 %p_ispos41, i64 %p_sub6, i64 %p_neg42
  %p_cmp8 = icmp eq i64 %p_, %p_46
  %p_. = zext i1 %p_cmp8 to i64
  br label %polly.exiting
}

; Function Attrs: nounwind uwtable
define i64 @run(%struct.POS** nocapture %queens, i64 %queens_size, i64 %n, i64 %dim) #0 {
entry:
  %cmp = icmp eq i64 %dim, %n
  br i1 %cmp, label %cleanup, label %while.cond.preheader

while.cond.preheader:                             ; preds = %entry
  %cmp1 = icmp slt i64 %n, %queens_size
  %cmp4 = icmp eq i64 %dim, %queens_size
  %or.cond = and i1 %cmp1, %cmp4
  br i1 %or.cond, label %blklab10.preheader, label %blklab11

blklab10.preheader:                               ; preds = %while.cond.preheader
  %cmp22141 = icmp sgt i64 %n, 0
  %arrayidx37 = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %n
  %0 = bitcast %struct.POS** %arrayidx37 to i8**
  %add38 = add nsw i64 %n, 1
  %cmp7.us145 = icmp sgt i64 %dim, 0
  br i1 %cmp7.us145, label %blklab14.preheader.us.preheader, label %cleanup

blklab14.preheader.us.preheader:                  ; preds = %blklab10.preheader
  br label %blklab14.preheader.us

blklab12.us:                                      ; preds = %blklab18.us
  %_23.0.us.lcssa = phi i64 [ %_23.0.us, %blklab18.us ]
  %cmp33.us = icmp eq i64 %_23.0.us.lcssa, 1
  br i1 %cmp33.us, label %if.end35.us, label %blklab22.us

if.end35.us:                                      ; preds = %blklab14.preheader.us, %blklab12.us
  %call36.us = tail call noalias i8* @malloc(i64 16) #6
  %c.us = getelementptr inbounds i8, i8* %call36.us, i64 8
  %1 = bitcast i8* %c.us to i64*
  store i64 %col.0135.us148, i64* %1, align 8, !tbaa !9
  %r.us = bitcast i8* %call36.us to i64*
  store i64 %n, i64* %r.us, align 8, !tbaa !7
  store i8* %call36.us, i8** %0, align 8, !tbaa !5
  %call39.us = tail call i64 @run(%struct.POS** %queens, i64 %dim, i64 %add38, i64 %dim)
  %add40.us = add nsw i64 %call39.us, %num_solutions.0136.us146
  br label %blklab22.us

blklab22.us:                                      ; preds = %if.end35.us, %blklab12.us
  %num_solutions.1.us = phi i64 [ %num_solutions.0136.us146, %blklab12.us ], [ %add40.us, %if.end35.us ]
  %add41.us = add nuw nsw i64 %col.0135.us148, 1
  %cmp7.us = icmp slt i64 %add41.us, %dim
  br i1 %cmp7.us, label %blklab14.preheader.us, label %cleanup.loopexit

if.end24.us:                                      ; preds = %if.end24.us.preheader, %blklab18.us
  %i.0133143.us = phi i64 [ %add.us, %blklab18.us ], [ 0, %if.end24.us.preheader ]
  %isSolution.0134142.us = phi i64 [ %_23.0.us, %blklab18.us ], [ 1, %if.end24.us.preheader ]
  %arrayidx.us = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %i.0133143.us
  %2 = load %struct.POS*, %struct.POS** %arrayidx.us, align 8, !tbaa !5
  %r.i.us = getelementptr inbounds %struct.POS, %struct.POS* %2, i64 0, i32 0
  %3 = load i64, i64* %r.i.us, align 8, !tbaa !7
  %c.i.us = getelementptr inbounds %struct.POS, %struct.POS* %2, i64 0, i32 1
  %4 = load i64, i64* %c.i.us, align 8, !tbaa !9
  %cmp26.us = icmp eq i64 %isSolution.0134142.us, 1
  br i1 %cmp26.us, label %blklab20.us, label %blklab18.us

blklab20.us:                                      ; preds = %if.end24.us
  %5 = icmp slt i64 %3, %n
  %6 = icmp slt i64 %4, %col.0135.us148
  %7 = icmp sgt i64 %4, %col.0135.us148
  %8 = icmp ne i64 %4, %col.0135.us148
  %9 = and i1 %5, %8
  %10 = icmp sgt i64 %3, %n
  %11 = and i1 %10, %6
  %12 = or i1 %9, %11
  %13 = and i1 %10, %7
  %14 = or i1 %13, %12
  br i1 %14, label %polly.stmt.blklab0.i.us, label %conflict.exit.us

polly.stmt.blklab0.i.us:                          ; preds = %blklab20.us
  %p_sub.i.us = sub nsw i64 %4, %col.0135.us148
  %p_ispos.i.us = icmp sgt i64 %p_sub.i.us, -1
  %p_neg.i.us = sub i64 0, %p_sub.i.us
  %p_.i.us = select i1 %p_ispos.i.us, i64 %p_sub.i.us, i64 %p_neg.i.us
  %p_sub6.i.us = sub nsw i64 %3, %n
  %p_ispos41.i.us = icmp sgt i64 %p_sub6.i.us, -1
  %p_neg42.i.us = sub i64 0, %p_sub6.i.us
  %p_46.i.us = select i1 %p_ispos41.i.us, i64 %p_sub6.i.us, i64 %p_neg42.i.us
  %p_cmp8.i.us = icmp eq i64 %p_.i.us, %p_46.i.us
  %p_..i.us = zext i1 %p_cmp8.i.us to i64
  br label %conflict.exit.us

conflict.exit.us:                                 ; preds = %polly.stmt.blklab0.i.us, %blklab20.us
  %retval.0.s2a.0.i.us = phi i64 [ %p_..i.us, %polly.stmt.blklab0.i.us ], [ 1, %blklab20.us ]
  %15 = xor i64 %retval.0.s2a.0.i.us, 1
  br label %blklab18.us

blklab18.us:                                      ; preds = %conflict.exit.us, %if.end24.us
  %_23.0.us = phi i64 [ 0, %if.end24.us ], [ %15, %conflict.exit.us ]
  %add.us = add nuw nsw i64 %i.0133143.us, 1
  %exitcond = icmp eq i64 %add.us, %n
  br i1 %exitcond, label %blklab12.us, label %if.end24.us

blklab14.preheader.us:                            ; preds = %blklab14.preheader.us.preheader, %blklab22.us
  %col.0135.us148 = phi i64 [ %add41.us, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  %num_solutions.0136.us146 = phi i64 [ %num_solutions.1.us, %blklab22.us ], [ 0, %blklab14.preheader.us.preheader ]
  br i1 %cmp22141, label %if.end24.us.preheader, label %if.end35.us

if.end24.us.preheader:                            ; preds = %blklab14.preheader.us
  br label %if.end24.us

blklab11:                                         ; preds = %while.cond.preheader
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %16) #8
  tail call void @exit(i32 -1) #9
  unreachable

cleanup.loopexit:                                 ; preds = %blklab22.us
  %num_solutions.1.us.lcssa = phi i64 [ %num_solutions.1.us, %blklab22.us ]
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %blklab10.preheader, %entry
  %retval.0 = phi i64 [ 1, %entry ], [ 0, %blklab10.preheader ], [ %num_solutions.1.us.lcssa, %cleanup.loopexit ]
  ret i64 %retval.0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #4 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6
  %0 = load i64*, i64** %call, align 8, !tbaa !5
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab23, label %if.end

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %mul = shl i64 %1, 3
  %call4 = tail call noalias i8* @malloc(i64 %mul) #6
  %2 = bitcast i8* %call4 to %struct.POS**
  %cmp6137 = icmp sgt i64 %1, 0
  br i1 %cmp6137, label %for.body.preheader, label %for.cond.cleanup

for.body.preheader:                               ; preds = %if.end
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %if.end
  %call10 = tail call i64 @run(%struct.POS** %2, i64 %1, i64 0, i64 %1)
  %call11 = tail call noalias i8* @malloc(i64 264) #6
  %3 = bitcast i8* %call11 to i64*
  %4 = bitcast i8* %call11 to <2 x i64>*
  store <2 x i64> <i64 78, i64 45>, <2 x i64>* %4, align 8, !tbaa !1
  %arrayidx14 = getelementptr inbounds i8, i8* %call11, i64 16
  %5 = bitcast i8* %arrayidx14 to <2 x i64>*
  store <2 x i64> <i64 81, i64 117>, <2 x i64>* %5, align 8, !tbaa !1
  %arrayidx16 = getelementptr inbounds i8, i8* %call11, i64 32
  %6 = bitcast i8* %arrayidx16 to <2 x i64>*
  store <2 x i64> <i64 101, i64 101>, <2 x i64>* %6, align 8, !tbaa !1
  %arrayidx18 = getelementptr inbounds i8, i8* %call11, i64 48
  %7 = bitcast i8* %arrayidx18 to <2 x i64>*
  store <2 x i64> <i64 110, i64 32>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx20 = getelementptr inbounds i8, i8* %call11, i64 64
  %8 = bitcast i8* %arrayidx20 to <2 x i64>*
  store <2 x i64> <i64 80, i64 114>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx22 = getelementptr inbounds i8, i8* %call11, i64 80
  %9 = bitcast i8* %arrayidx22 to <2 x i64>*
  store <2 x i64> <i64 111, i64 98>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx24 = getelementptr inbounds i8, i8* %call11, i64 96
  %10 = bitcast i8* %arrayidx24 to <2 x i64>*
  store <2 x i64> <i64 108, i64 101>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx26 = getelementptr inbounds i8, i8* %call11, i64 112
  %11 = bitcast i8* %arrayidx26 to <2 x i64>*
  store <2 x i64> <i64 109, i64 32>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx28 = getelementptr inbounds i8, i8* %call11, i64 128
  %12 = bitcast i8* %arrayidx28 to <2 x i64>*
  store <2 x i64> <i64 111, i64 110>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx30 = getelementptr inbounds i8, i8* %call11, i64 144
  %13 = bitcast i8* %arrayidx30 to <2 x i64>*
  store <2 x i64> <i64 32, i64 97>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx32 = getelementptr inbounds i8, i8* %call11, i64 160
  %14 = bitcast i8* %arrayidx32 to <2 x i64>*
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx34 = getelementptr inbounds i8, i8* %call11, i64 176
  %15 = bitcast i8* %arrayidx34 to <2 x i64>*
  store <2 x i64> <i64 32, i64 88>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx36 = getelementptr inbounds i8, i8* %call11, i64 192
  %16 = bitcast i8* %arrayidx36 to <2 x i64>*
  store <2 x i64> <i64 32, i64 78>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx38 = getelementptr inbounds i8, i8* %call11, i64 208
  %17 = bitcast i8* %arrayidx38 to <2 x i64>*
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx40 = getelementptr inbounds i8, i8* %call11, i64 224
  %18 = bitcast i8* %arrayidx40 to <2 x i64>*
  store <2 x i64> <i64 111, i64 97>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx42 = getelementptr inbounds i8, i8* %call11, i64 240
  %19 = bitcast i8* %arrayidx42 to <2 x i64>*
  store <2 x i64> <i64 114, i64 100>, <2 x i64>* %19, align 8, !tbaa !1
  %arrayidx44 = getelementptr inbounds i8, i8* %call11, i64 256
  %20 = bitcast i8* %arrayidx44 to i64*
  store i64 46, i64* %20, align 8, !tbaa !1
  tail call void @println_s(i64* %3, i64 33) #6
  %call45 = tail call noalias i8* @malloc(i64 32) #6
  %21 = bitcast i8* %call45 to i64*
  %22 = bitcast i8* %call45 to <2 x i64>*
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %22, align 8, !tbaa !1
  %arrayidx48 = getelementptr inbounds i8, i8* %call45, i64 16
  %23 = bitcast i8* %arrayidx48 to <2 x i64>*
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %23, align 8, !tbaa !1
  tail call void @printf_s(i64* %21, i64 4) #6
  %call50 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1)
  %call51 = tail call noalias i8* @malloc(i64 48) #6
  %24 = bitcast i8* %call51 to i64*
  %25 = bitcast i8* %call51 to <2 x i64>*
  store <2 x i64> <i64 70, i64 111>, <2 x i64>* %25, align 8, !tbaa !1
  %arrayidx54 = getelementptr inbounds i8, i8* %call51, i64 16
  %26 = bitcast i8* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 117, i64 110>, <2 x i64>* %26, align 8, !tbaa !1
  %arrayidx56 = getelementptr inbounds i8, i8* %call51, i64 32
  %27 = bitcast i8* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %27, align 8, !tbaa !1
  tail call void @printf_s(i64* %24, i64 6) #6
  %call58 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %call10)
  %call59 = tail call noalias i8* @malloc(i64 88) #6
  %28 = bitcast i8* %call59 to i64*
  %29 = bitcast i8* %call59 to <2 x i64>*
  store <2 x i64> <i64 32, i64 115>, <2 x i64>* %29, align 8, !tbaa !1
  %arrayidx62 = getelementptr inbounds i8, i8* %call59, i64 16
  %30 = bitcast i8* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 111, i64 108>, <2 x i64>* %30, align 8, !tbaa !1
  %arrayidx64 = getelementptr inbounds i8, i8* %call59, i64 32
  %31 = bitcast i8* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 117, i64 116>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx66 = getelementptr inbounds i8, i8* %call59, i64 48
  %32 = bitcast i8* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 105, i64 111>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx68 = getelementptr inbounds i8, i8* %call59, i64 64
  %33 = bitcast i8* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 110, i64 115>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx70 = getelementptr inbounds i8, i8* %call59, i64 80
  %34 = bitcast i8* %arrayidx70 to i64*
  store i64 46, i64* %34, align 8, !tbaa !1
  tail call void @println_s(i64* %28, i64 11) #6
  br label %blklab23

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %call.i = tail call noalias i8* @malloc(i64 16) #6
  %arrayidx9 = getelementptr inbounds %struct.POS*, %struct.POS** %2, i64 %indvars.iv
  %35 = bitcast %struct.POS** %arrayidx9 to i8**
  call void @llvm.memset.p0i8.i64(i8* %call.i, i8 0, i64 16, i32 8, i1 false)
  store i8* %call.i, i8** %35, align 8, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %1
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body

blklab23:                                         ; preds = %entry, %for.cond.cleanup
  tail call void @exit(i32 0) #9
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #5

declare i64* @parseStringToInt(i64*) #5

declare void @println_s(i64*, i64) #5

declare void @printf_s(i64*, i64) #5

declare i32 @putchar(i32)

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #7

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
