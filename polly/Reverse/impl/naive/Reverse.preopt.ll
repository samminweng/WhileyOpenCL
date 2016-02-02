; ModuleID = 'Reverse.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [57 x i8] c"fail to allocate the memory at slice function in Util.c\0A\00", align 1
@.str.1 = private unnamed_addr constant [62 x i8] c"fail to allocate the memory at gen1DArray function in Util.c\0A\00", align 1
@.str.2 = private unnamed_addr constant [62 x i8] c"fail to allocate the memory at gen2DArray function in Util.c\0A\00", align 1
@.str.3 = private unnamed_addr constant [36 x i8] c"Missing the command line arguments\0A\00", align 1
@.str.4 = private unnamed_addr constant [68 x i8] c"fail to allocate the memory at convertCharToInt function in Util.c\0A\00", align 1
@.str.5 = private unnamed_addr constant [51 x i8] c"None numbers is passed via command line arguments\0A\00", align 1
@.str.6 = private unnamed_addr constant [44 x i8] c"fail to malloc at clone function in Util.c\0A\00", align 1
@.str.7 = private unnamed_addr constant [61 x i8] c"fail to malloc newMatrix at clone2DArray function in Util.c\0A\00", align 1
@.str.8 = private unnamed_addr constant [64 x i8] c"fail to malloc newMatrix[i] at clone2DArray function in Util.c\0A\00", align 1
@.str.9 = private unnamed_addr constant [58 x i8] c"fail to allocate the memory at append function in Util.c\0A\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"[\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c",%lld\00", align 1
@.str.14 = private unnamed_addr constant [10 x i8] c" ... %lld\00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"]\00", align 1
@.str.16 = private unnamed_addr constant [6 x i8] c" ...\0A\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.18 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.19 = private unnamed_addr constant [55 x i8] c"fail to realloc at optimized_append functon in Util.c\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.20 = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.21 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@str = private unnamed_addr constant [56 x i8] c"fail to allocate the memory at slice function in Util.c\00"
@str.1 = private unnamed_addr constant [61 x i8] c"fail to allocate the memory at gen1DArray function in Util.c\00"
@str.2 = private unnamed_addr constant [61 x i8] c"fail to allocate the memory at gen2DArray function in Util.c\00"
@str.3 = private unnamed_addr constant [61 x i8] c"fail to allocate the memory at gen2DArray function in Util.c\00"
@str.4 = private unnamed_addr constant [50 x i8] c"None numbers is passed via command line arguments\00"
@str.5 = private unnamed_addr constant [67 x i8] c"fail to allocate the memory at convertCharToInt function in Util.c\00"
@str.6 = private unnamed_addr constant [35 x i8] c"Missing the command line arguments\00"
@str.7 = private unnamed_addr constant [43 x i8] c"fail to malloc at clone function in Util.c\00"
@str.8 = private unnamed_addr constant [63 x i8] c"fail to malloc newMatrix[i] at clone2DArray function in Util.c\00"
@str.9 = private unnamed_addr constant [60 x i8] c"fail to malloc newMatrix at clone2DArray function in Util.c\00"
@str.10 = private unnamed_addr constant [57 x i8] c"fail to allocate the memory at append function in Util.c\00"
@str.11 = private unnamed_addr constant [5 x i8] c" ...\00"
@str.12 = private unnamed_addr constant [54 x i8] c"fail to realloc at optimized_append functon in Util.c\00"

; Function Attrs: nounwind uwtable
define void @free2DArray(i64** %ptr, i64 %size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp1 = icmp sgt i64 %size, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry.split
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.02 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds i64*, i64** %ptr, i64 %i.02
  %0 = bitcast i64** %arrayidx to i8**
  %1 = load i8*, i8** %0, align 8
  tail call void @free(i8* %1) #6
  %inc = add nuw nsw i64 %i.02, 1
  %exitcond = icmp ne i64 %inc, %size
  br i1 %exitcond, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry.split
  %2 = bitcast i64** %ptr to i8*
  tail call void @free(i8* %2) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i64* @slice(i64* %arr, i64 %arr_size, i64 %start, i64 %end) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %sub = sub nsw i64 %end, %start
  %mul = shl i64 %sub, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry.split
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @str, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry.split
  %0 = bitcast i8* %call to i64*
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %start
  %1 = bitcast i64* %arrayidx to i8*
  %sub2 = sub nsw i64 %end, %start
  %mul3 = shl i64 %sub2, 3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %call, i8* %1, i64 %mul3, i32 8, i1 false)
  ret i64* %0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define i64* @gen1DArray(i32 %value, i32 %arr_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %conv = sext i32 %arr_size to i64
  %mul = shl nsw i64 %conv, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry.split
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @str.1, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry.split
  %0 = bitcast i8* %call to i64*
  %1 = trunc i32 %value to i8
  %conv3 = sext i32 %arr_size to i64
  %mul4 = shl nsw i64 %conv3, 3
  tail call void @llvm.memset.p0i8.i64(i8* nonnull %call, i8 %1, i64 %mul4, i32 8, i1 false)
  ret i64* %0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define i64** @gen2DArray(i64* %arr, i64 %x, i64 %y) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %mul = shl i64 %y, 3
  %mul1 = shl i64 %x, 3
  %call = tail call noalias i8* @malloc(i64 %mul1) #6
  %0 = bitcast i8* %call to i64**
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry.split
  %cmp32 = icmp sgt i64 %x, 0
  br i1 %cmp32, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  br label %for.body

if.then:                                          ; preds = %entry.split
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @str.3, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

for.body:                                         ; preds = %for.body.lr.ph, %if.end9
  %i.03 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %if.end9 ]
  %call4 = tail call noalias i8* @malloc(i64 %mul) #6
  %arrayidx = getelementptr inbounds i64*, i64** %0, i64 %i.03
  %1 = bitcast i64** %arrayidx to i8**
  store i8* %call4, i8** %1, align 8
  %cmp6 = icmp eq i8* %call4, null
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %for.body
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @str.2, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

if.end9:                                          ; preds = %for.body
  %arrayidx10 = getelementptr inbounds i64*, i64** %0, i64 %i.03
  %2 = bitcast i64** %arrayidx10 to i8**
  %3 = load i8*, i8** %2, align 8
  %4 = bitcast i64* %arr to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 %mul, i32 8, i1 false)
  %inc = add nuw nsw i64 %i.03, 1
  %cmp3 = icmp slt i64 %inc, %x
  br i1 %cmp3, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %if.end9
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %for.cond.preheader
  ret i64** %0
}

; Function Attrs: nounwind uwtable
define i64 @parseStringToInt(i64* %arr) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = load i64, i64* %arr, align 8
  %cmp1 = icmp sgt i64 %0, -1
  br i1 %cmp1, label %land.rhs.lr.ph, label %while.end

land.rhs.lr.ph:                                   ; preds = %entry.split
  br label %land.rhs

land.rhs:                                         ; preds = %land.rhs.lr.ph, %while.body
  %i.03 = phi i64 [ 0, %land.rhs.lr.ph ], [ %inc, %while.body ]
  %value.02 = phi i64 [ 0, %land.rhs.lr.ph ], [ %add, %while.body ]
  %arrayidx1 = getelementptr inbounds i64, i64* %arr, i64 %i.03
  %1 = load i64, i64* %arrayidx1, align 8
  %cmp2 = icmp slt i64 %1, 10
  br i1 %cmp2, label %while.body, label %land.rhs.while.end_crit_edge

while.body:                                       ; preds = %land.rhs
  %mul = mul nsw i64 %value.02, 10
  %arrayidx3 = getelementptr inbounds i64, i64* %arr, i64 %i.03
  %2 = load i64, i64* %arrayidx3, align 8
  %add = add nsw i64 %2, %mul
  %inc = add nuw nsw i64 %i.03, 1
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %inc
  %3 = load i64, i64* %arrayidx, align 8
  %cmp = icmp sgt i64 %3, -1
  br i1 %cmp, label %land.rhs, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %add.lcssa = phi i64 [ %add, %while.body ]
  br label %while.end

land.rhs.while.end_crit_edge:                     ; preds = %land.rhs
  %value.02.lcssa = phi i64 [ %value.02, %land.rhs ]
  br label %while.end

while.end:                                        ; preds = %land.rhs.while.end_crit_edge, %while.cond.while.end_crit_edge, %entry.split
  %value.0.lcssa = phi i64 [ %add.lcssa, %while.cond.while.end_crit_edge ], [ %value.02.lcssa, %land.rhs.while.end_crit_edge ], [ 0, %entry.split ]
  ret i64 %value.0.lcssa
}

; Function Attrs: nounwind uwtable
define i64** @convertArgsToIntArray(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp = icmp slt i32 %argc, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry.split
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @str.6, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry.split
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %mul = shl nsw i64 %conv, 3
  %call1 = tail call noalias i8* @malloc(i64 %mul) #6
  %0 = bitcast i8* %call1 to i64**
  %cmp2 = icmp eq i8* %call1, null
  br i1 %cmp2, label %if.then4, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end
  %conv7 = sext i32 %argc to i64
  %cmp810 = icmp sgt i32 %argc, 1
  br i1 %cmp810, label %for.body.lr.ph, label %for.end54

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  br label %for.body

if.then4:                                         ; preds = %if.end
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @str.5, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

for.body:                                         ; preds = %for.body.lr.ph, %for.inc52
  %i.012 = phi i64 [ 1, %for.body.lr.ph ], [ %inc53, %for.inc52 ]
  %arr_size.011 = phi i64 [ 0, %for.body.lr.ph ], [ %arr_size.1, %for.inc52 ]
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 %i.012
  %1 = load i8*, i8** %arrayidx, align 8
  %2 = load i8, i8* %1, align 1
  %idxprom = sext i8 %2 to i64
  %call12 = tail call i16** @__ctype_b_loc() #8
  %3 = load i16*, i16** %call12, align 8
  %arrayidx13 = getelementptr inbounds i16, i16* %3, i64 %idxprom
  %4 = load i16, i16* %arrayidx13, align 2
  %and = and i16 %4, 2048
  %tobool = icmp eq i16 %and, 0
  br i1 %tobool, label %for.inc52, label %while.cond.preheader

while.cond.preheader:                             ; preds = %for.body
  %arrayidx16 = getelementptr inbounds i8*, i8** %args, i64 %i.012
  %5 = load i8*, i8** %arrayidx16, align 8
  %6 = load i8, i8* %5, align 1
  %cmp195 = icmp eq i8 %6, 0
  br i1 %cmp195, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %while.cond.preheader
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %if.end32
  %max_j.06 = phi i64 [ 0, %while.body.lr.ph ], [ %inc, %if.end32 ]
  %arrayidx21 = getelementptr inbounds i8*, i8** %args, i64 %i.012
  %7 = load i8*, i8** %arrayidx21, align 8
  %arrayidx22 = getelementptr inbounds i8, i8* %7, i64 %max_j.06
  %8 = load i8, i8* %arrayidx22, align 1
  %idxprom24 = sext i8 %8 to i64
  %call25 = tail call i16** @__ctype_b_loc() #8
  %9 = load i16*, i16** %call25, align 8
  %arrayidx26 = getelementptr inbounds i16, i16* %9, i64 %idxprom24
  %10 = load i16, i16* %arrayidx26, align 2
  %and28 = and i16 %10, 2048
  %tobool29 = icmp eq i16 %and28, 0
  br i1 %tobool29, label %if.then30, label %if.end32

if.then30:                                        ; preds = %while.body
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @str.4, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

if.end32:                                         ; preds = %while.body
  %inc = add nuw nsw i64 %max_j.06, 1
  %11 = load i8*, i8** %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds i8, i8* %11, i64 %inc
  %12 = load i8, i8* %arrayidx17, align 1
  %cmp19 = icmp eq i8 %12, 0
  br i1 %cmp19, label %while.cond.while.end_crit_edge, label %while.body

while.cond.while.end_crit_edge:                   ; preds = %if.end32
  %inc.lcssa = phi i64 [ %inc, %if.end32 ]
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %while.cond.preheader
  %max_j.0.lcssa = phi i64 [ %inc.lcssa, %while.cond.while.end_crit_edge ], [ 0, %while.cond.preheader ]
  %add = shl i64 %max_j.0.lcssa, 3
  %mul33 = add i64 %add, 8
  %call34 = tail call noalias i8* @malloc(i64 %mul33) #6
  %arrayidx35 = getelementptr inbounds i64*, i64** %0, i64 %arr_size.011
  %13 = bitcast i64** %arrayidx35 to i8**
  store i8* %call34, i8** %13, align 8
  %cmp377 = icmp sgt i64 %max_j.0.lcssa, 0
  br i1 %cmp377, label %for.body39.lr.ph, label %for.end

for.body39.lr.ph:                                 ; preds = %while.end
  br label %for.body39

for.body39:                                       ; preds = %for.body39.lr.ph, %for.body39
  %j.08 = phi i64 [ 0, %for.body39.lr.ph ], [ %inc47, %for.body39 ]
  %arrayidx40 = getelementptr inbounds i8*, i8** %args, i64 %i.012
  %14 = load i8*, i8** %arrayidx40, align 8
  %arrayidx41 = getelementptr inbounds i8, i8* %14, i64 %j.08
  %15 = load i8, i8* %arrayidx41, align 1
  %conv42 = sext i8 %15 to i64
  %sub43 = add nsw i64 %conv42, -48
  %arrayidx45 = getelementptr inbounds i64*, i64** %0, i64 %arr_size.011
  %16 = load i64*, i64** %arrayidx45, align 8
  %arrayidx46 = getelementptr inbounds i64, i64* %16, i64 %j.08
  store i64 %sub43, i64* %arrayidx46, align 8
  %inc47 = add nuw nsw i64 %j.08, 1
  %exitcond = icmp ne i64 %inc47, %max_j.0.lcssa
  br i1 %exitcond, label %for.body39, label %for.cond36.for.end_crit_edge

for.cond36.for.end_crit_edge:                     ; preds = %for.body39
  br label %for.end

for.end:                                          ; preds = %for.cond36.for.end_crit_edge, %while.end
  %j.0.lcssa = phi i64 [ %max_j.0.lcssa, %for.cond36.for.end_crit_edge ], [ 0, %while.end ]
  %arrayidx48 = getelementptr inbounds i64*, i64** %0, i64 %arr_size.011
  %17 = load i64*, i64** %arrayidx48, align 8
  %arrayidx49 = getelementptr inbounds i64, i64* %17, i64 %j.0.lcssa
  store i64 -1, i64* %arrayidx49, align 8
  %inc50 = add nsw i64 %arr_size.011, 1
  br label %for.inc52

for.inc52:                                        ; preds = %for.end, %for.body
  %arr_size.1 = phi i64 [ %inc50, %for.end ], [ %arr_size.011, %for.body ]
  %inc53 = add nuw nsw i64 %i.012, 1
  %cmp8 = icmp slt i64 %inc53, %conv7
  br i1 %cmp8, label %for.body, label %for.cond.for.end54_crit_edge

for.cond.for.end54_crit_edge:                     ; preds = %for.inc52
  br label %for.end54

for.end54:                                        ; preds = %for.cond.for.end54_crit_edge, %for.cond.preheader
  ret i64** %0
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #5

; Function Attrs: nounwind uwtable
define i32 @isArrayEqual(i64* %arr1, i64 %arr1_size, i64* %arr2, i64 %arr2_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp = icmp eq i64 %arr1_size, %arr2_size
  br i1 %cmp, label %for.cond.preheader, label %return

for.cond.preheader:                               ; preds = %entry.split
  %cmp11 = icmp sgt i64 %arr1_size, 0
  br i1 %cmp11, label %for.body.lr.ph, label %return.loopexit

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  br label %for.body

for.cond:                                         ; preds = %for.body
  %cmp1 = icmp slt i64 %inc, %arr1_size
  br i1 %cmp1, label %for.body, label %for.cond.return.loopexit_crit_edge

for.body:                                         ; preds = %for.body.lr.ph, %for.cond
  %i.02 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.cond ]
  %arrayidx = getelementptr inbounds i64, i64* %arr1, i64 %i.02
  %0 = load i64, i64* %arrayidx, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %arr2, i64 %i.02
  %1 = load i64, i64* %arrayidx2, align 8
  %cmp3 = icmp eq i64 %0, %1
  %inc = add nuw nsw i64 %i.02, 1
  br i1 %cmp3, label %for.cond, label %for.body.return.loopexit_crit_edge

for.body.return.loopexit_crit_edge:               ; preds = %for.body
  br label %return.loopexit

for.cond.return.loopexit_crit_edge:               ; preds = %for.cond
  br label %return.loopexit

return.loopexit:                                  ; preds = %for.cond.return.loopexit_crit_edge, %for.body.return.loopexit_crit_edge, %for.cond.preheader
  %retval.0.ph = phi i32 [ 1, %for.cond.return.loopexit_crit_edge ], [ 0, %for.body.return.loopexit_crit_edge ], [ 1, %for.cond.preheader ]
  br label %return

return:                                           ; preds = %return.loopexit, %entry.split
  %retval.0 = phi i32 [ 0, %entry.split ], [ %retval.0.ph, %return.loopexit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind uwtable
define i64* @copy(i64* %arr, i64 %size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %mul = shl i64 %size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry.split
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @str.7, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry.split
  %0 = bitcast i8* %call to i64*
  %1 = bitcast i64* %arr to i8*
  %mul2 = shl i64 %size, 3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %call, i8* %1, i64 %mul2, i32 8, i1 false)
  ret i64* %0
}

; Function Attrs: nounwind uwtable
define i64** @copy2DArray(i64** %arr, i64 %x, i64 %y) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %mul = shl i64 %x, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %0 = bitcast i8* %call to i64**
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry.split
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @str.9, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry.split
  %mul2 = shl i64 %y, 3
  %cmp32 = icmp sgt i64 %x, 0
  br i1 %cmp32, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %if.end
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %if.end9
  %i.03 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %if.end9 ]
  %call4 = tail call noalias i8* @malloc(i64 %mul2) #6
  %arrayidx = getelementptr inbounds i64*, i64** %0, i64 %i.03
  %1 = bitcast i64** %arrayidx to i8**
  store i8* %call4, i8** %1, align 8
  %cmp6 = icmp eq i8* %call4, null
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %for.body
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @str.8, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

if.end9:                                          ; preds = %for.body
  %arrayidx10 = getelementptr inbounds i64*, i64** %0, i64 %i.03
  %2 = bitcast i64** %arrayidx10 to i8**
  %3 = load i8*, i8** %2, align 8
  %arrayidx11 = getelementptr inbounds i64*, i64** %arr, i64 %i.03
  %4 = bitcast i64** %arrayidx11 to i8**
  %5 = load i8*, i8** %4, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %5, i64 %mul2, i32 8, i1 false)
  %inc = add nuw nsw i64 %i.03, 1
  %cmp3 = icmp slt i64 %inc, %x
  br i1 %cmp3, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %if.end9
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %if.end
  ret i64** %0
}

; Function Attrs: nounwind uwtable
define i64* @append(i64* %arr1, i64 %arr1_size, i64* %arr2, i64 %arr2_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %add = add nsw i64 %arr2_size, %arr1_size
  %0 = bitcast i64* %arr1 to i8*
  %mul = shl i64 %add, 3
  %call = tail call i8* @realloc(i8* %0, i64 %mul) #6
  %1 = bitcast i8* %call to i64*
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry.split
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @str.10, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry.split
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 %arr1_size
  %2 = bitcast i64* %arrayidx to i8*
  %3 = bitcast i64* %arr2 to i8*
  %mul2 = shl i64 %arr2_size, 3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 %mul2, i32 8, i1 false)
  ret i64* %1
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

; Function Attrs: nounwind uwtable
define void @indirect_printf(i64 %input) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i64 0, i64 0), i64 %input) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @printf1DArray(i64* %input, i64 %input_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %putchar = tail call i32 @putchar(i32 91) #6
  %cmp2 = icmp sgt i64 %input_size, 0
  br i1 %cmp2, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry.split
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %isFirst.05 = phi i32 [ 1, %for.body.lr.ph ], [ %isFirst.1, %for.inc ]
  %i.04 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.inc ]
  %tobool = icmp eq i32 %isFirst.05, 0
  %arrayidx4 = getelementptr inbounds i64, i64* %input, i64 %i.04
  %0 = load i64, i64* %arrayidx4, align 8
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %for.body
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i64 0, i64 0), i64 %0) #6
  br label %for.inc

if.else:                                          ; preds = %for.body
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i64 0, i64 0), i64 %0) #6
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %isFirst.1 = phi i32 [ 0, %if.then ], [ %isFirst.05, %if.else ]
  %inc = add nuw nsw i64 %i.04, 1
  %cmp = icmp slt i64 %inc, %input_size
  %cmp1 = icmp slt i64 %inc, 10
  %cmp1. = and i1 %cmp, %cmp1
  br i1 %cmp1., label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  %inc.lcssa = phi i64 [ %inc, %for.inc ]
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry.split
  %i.0.lcssa = phi i64 [ %inc.lcssa, %for.cond.for.end_crit_edge ], [ 0, %entry.split ]
  %cmp6 = icmp slt i64 %i.0.lcssa, %input_size
  br i1 %cmp6, label %if.then8, label %if.end11

if.then8:                                         ; preds = %for.end
  %sub = add nsw i64 %input_size, -1
  %arrayidx9 = getelementptr inbounds i64, i64* %input, i64 %sub
  %1 = load i64, i64* %arrayidx9, align 8
  %call10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.14, i64 0, i64 0), i64 %1) #6
  br label %if.end11

if.end11:                                         ; preds = %if.then8, %for.end
  %putchar1 = tail call i32 @putchar(i32 93) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @printf2DArray(i64** %input, i64 %input_size, i64 %input_size_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %putchar = tail call i32 @putchar(i32 91) #6
  %cmp2 = icmp sgt i64 %input_size, 0
  br i1 %cmp2, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry.split
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.04 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds i64*, i64** %input, i64 %i.04
  %0 = load i64*, i64** %arrayidx, align 8
  tail call void @printf1DArray(i64* %0, i64 %input_size_size)
  %inc = add nuw nsw i64 %i.04, 1
  %cmp = icmp slt i64 %inc, %input_size
  %cmp1 = icmp slt i64 %inc, 10
  %cmp1. = and i1 %cmp, %cmp1
  br i1 %cmp1., label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %inc.lcssa = phi i64 [ %inc, %for.body ]
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry.split
  %i.0.lcssa = phi i64 [ %inc.lcssa, %for.cond.for.end_crit_edge ], [ 0, %entry.split ]
  %cmp3 = icmp slt i64 %i.0.lcssa, %input_size
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @str.11, i64 0, i64 0))
  %sub = add nsw i64 %input_size, -1
  %arrayidx6 = getelementptr inbounds i64*, i64** %input, i64 %sub
  %1 = load i64*, i64** %arrayidx6, align 8
  tail call void @printf1DArray(i64* %1, i64 %input_size_size)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %putchar1 = tail call i32 @putchar(i32 93) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @printf_s(i64* %input, i64 %input_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp1 = icmp sgt i64 %input_size, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry.split
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.02 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds i64, i64* %input, i64 %i.02
  %0 = load i64, i64* %arrayidx, align 8
  %conv = trunc i64 %0 to i32
  %sext = shl i32 %conv, 24
  %conv1 = ashr exact i32 %sext, 24
  %putchar = tail call i32 @putchar(i32 %conv1) #6
  %inc = add nuw nsw i64 %i.02, 1
  %exitcond = icmp ne i64 %inc, %input_size
  br i1 %exitcond, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry.split
  ret void
}

; Function Attrs: nounwind uwtable
define void @println_s(i64* %input, i64 %input_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  tail call void @printf_s(i64* %input, i64 %input_size)
  %putchar = tail call i32 @putchar(i32 10) #6
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @isPowerof2(i64 %value) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp = icmp eq i64 %value, 0
  br i1 %cmp, label %return, label %land.rhs

land.rhs:                                         ; preds = %entry.split
  %sub = add nsw i64 %value, -1
  %and = and i64 %sub, %value
  %lnot = icmp eq i64 %and, 0
  %land.ext = zext i1 %lnot to i32
  br label %return

return:                                           ; preds = %entry.split, %land.rhs
  %retval.0 = phi i32 [ %land.ext, %land.rhs ], [ 1, %entry.split ]
  ret i32 %retval.0
}

; Function Attrs: nounwind uwtable
define i64* @optimized_append(i64* %op_1, i64* %op_1_size, i64* %op_2, i64* %op_2_size, i64* %ret_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = load i64, i64* %op_1_size, align 8
  %call = tail call i32 @isPowerof2(i64 %0)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.end6, label %while.cond.preheader

while.cond.preheader:                             ; preds = %entry.split
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %while.cond.preheader
  %allocated_size.0 = phi i64 [ %mul, %while.cond ], [ 2, %while.cond.preheader ]
  %1 = load i64, i64* %op_1_size, align 8
  %2 = load i64, i64* %op_2_size, align 8
  %add = add nsw i64 %2, %1
  %cmp = icmp slt i64 %allocated_size.0, %add
  %mul = shl nsw i64 %allocated_size.0, 1
  br i1 %cmp, label %while.cond, label %while.end

while.end:                                        ; preds = %while.cond
  %allocated_size.0.lcssa = phi i64 [ %allocated_size.0, %while.cond ]
  %3 = bitcast i64* %op_1 to i8*
  %mul1 = shl i64 %allocated_size.0.lcssa, 3
  %call2 = tail call i8* @realloc(i8* %3, i64 %mul1) #6
  %cmp3 = icmp eq i8* %call2, null
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %while.end
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @str.12, i64 0, i64 0))
  tail call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %while.end
  %4 = bitcast i8* %call2 to i64*
  br label %if.end6

if.end6:                                          ; preds = %entry.split, %if.end
  %ret.0 = phi i64* [ %4, %if.end ], [ %op_1, %entry.split ]
  %5 = load i64, i64* %op_2_size, align 8
  %cmp71 = icmp sgt i64 %5, 0
  br i1 %cmp71, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %if.end6
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.02 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds i64, i64* %op_2, i64 %i.02
  %6 = load i64, i64* %arrayidx, align 8
  %7 = load i64, i64* %op_1_size, align 8
  %add8 = add nsw i64 %7, %i.02
  %arrayidx9 = getelementptr inbounds i64, i64* %ret.0, i64 %add8
  store i64 %6, i64* %arrayidx9, align 8
  %inc = add nuw nsw i64 %i.02, 1
  %8 = load i64, i64* %op_2_size, align 8
  %cmp7 = icmp slt i64 %inc, %8
  br i1 %cmp7, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %if.end6
  %9 = load i64, i64* %op_1_size, align 8
  %10 = load i64, i64* %op_2_size, align 8
  %add10 = add nsw i64 %10, %9
  store i64 %add10, i64* %ret_size, align 8
  ret i64* %ret.0
}

; Function Attrs: nounwind uwtable
define i64* @reverse(i64* %ls, i64 %ls_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %conv1 = trunc i64 %ls_size to i32
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1)
  %call2 = tail call i64* @copy(i64* %call, i64 %ls_size)
  br label %blklab2

blklab3:                                          ; preds = %if.end12
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #9
  tail call void @exit(i32 -1) #7
  unreachable

blklab2:                                          ; preds = %entry.split, %if.end12
  %i.01 = phi i64 [ %ls_size, %entry.split ], [ %sub13, %if.end12 ]
  %cmp9 = icmp slt i64 %i.01, 1
  br i1 %cmp9, label %blklab0, label %if.end12

if.end12:                                         ; preds = %blklab2
  %sub = sub nuw nsw i64 %ls_size, %i.01
  %arrayidx = getelementptr inbounds i64, i64* %ls, i64 %sub
  %2 = load i64, i64* %arrayidx, align 8
  %sub13 = add nsw i64 %i.01, -1
  %arrayidx14 = getelementptr inbounds i64, i64* %call2, i64 %sub13
  store i64 %2, i64* %arrayidx14, align 8
  %cmp = icmp sgt i64 %sub13, %ls_size
  br i1 %cmp, label %blklab3, label %blklab2

blklab0:                                          ; preds = %blklab2
  ret i64* %call2
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args)
  %0 = load i64*, i64** %call, align 8
  %call1 = tail call i64 @parseStringToInt(i64* %0)
  %cmp = icmp eq i64 %call1, 0
  br i1 %cmp, label %blklab4, label %if.end

if.end:                                           ; preds = %entry.split
  %add = add nsw i64 %call1, 1
  %conv4 = trunc i64 %add to i32
  %call5 = tail call i64* @gen1DArray(i32 0, i32 %conv4)
  %call6 = tail call i64* @copy(i64* %call5, i64 %add)
  %cmp71 = icmp slt i64 %call1, 0
  br i1 %cmp71, label %blklab5, label %if.end10.lr.ph

if.end10.lr.ph:                                   ; preds = %if.end
  %1 = add i64 %call1, 1
  br label %if.end10

if.end10:                                         ; preds = %if.end10, %if.end10.lr.ph
  %index.02 = phi i64 [ 0, %if.end10.lr.ph ], [ %add13, %if.end10 ]
  %sub11 = sub nsw i64 %call1, %index.02
  %arrayidx12 = getelementptr inbounds i64, i64* %call6, i64 %index.02
  store i64 %sub11, i64* %arrayidx12, align 8
  %add13 = add nuw nsw i64 %index.02, 1
  %exitcond = icmp ne i64 %add13, %1
  br i1 %exitcond, label %if.end10, label %while.body.blklab5_crit_edge

while.body.blklab5_crit_edge:                     ; preds = %if.end10
  br label %blklab5

blklab5:                                          ; preds = %while.body.blklab5_crit_edge, %if.end
  %call14 = tail call i64* @copy(i64* %call6, i64 %add)
  %call15 = tail call i64* @reverse(i64* %call14, i64 %add)
  %call16 = tail call i64* @copy(i64* %call15, i64 %add)
  %2 = load i64, i64* %call16, align 8
  %cmp18 = icmp eq i64 %2, 0
  br i1 %cmp18, label %blklab7, label %if.end21

if.end21:                                         ; preds = %blklab5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %3) #9
  tail call void @exit(i32 -1) #7
  unreachable

blklab7:                                          ; preds = %blklab5
  %arrayidx23 = getelementptr inbounds i64, i64* %call16, i64 %call1
  %5 = load i64, i64* %arrayidx23, align 8
  %cmp24 = icmp eq i64 %5, %call1
  br i1 %cmp24, label %blklab8, label %if.end27

if.end27:                                         ; preds = %blklab7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.20, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %6) #9
  tail call void @exit(i32 -1) #7
  unreachable

blklab8:                                          ; preds = %blklab7
  %call29 = tail call noalias i8* @malloc(i64 288) #6
  %8 = bitcast i8* %call29 to i64*
  store i64 80, i64* %8, align 8
  %arrayidx31 = getelementptr inbounds i8, i8* %call29, i64 8
  %9 = bitcast i8* %arrayidx31 to i64*
  store i64 97, i64* %9, align 8
  %arrayidx32 = getelementptr inbounds i8, i8* %call29, i64 16
  %10 = bitcast i8* %arrayidx32 to i64*
  store i64 115, i64* %10, align 8
  %arrayidx33 = getelementptr inbounds i8, i8* %call29, i64 24
  %11 = bitcast i8* %arrayidx33 to i64*
  store i64 115, i64* %11, align 8
  %arrayidx34 = getelementptr inbounds i8, i8* %call29, i64 32
  %12 = bitcast i8* %arrayidx34 to i64*
  store i64 32, i64* %12, align 8
  %arrayidx35 = getelementptr inbounds i8, i8* %call29, i64 40
  %13 = bitcast i8* %arrayidx35 to i64*
  store i64 82, i64* %13, align 8
  %arrayidx36 = getelementptr inbounds i8, i8* %call29, i64 48
  %14 = bitcast i8* %arrayidx36 to i64*
  store i64 101, i64* %14, align 8
  %arrayidx37 = getelementptr inbounds i8, i8* %call29, i64 56
  %15 = bitcast i8* %arrayidx37 to i64*
  store i64 118, i64* %15, align 8
  %arrayidx38 = getelementptr inbounds i8, i8* %call29, i64 64
  %16 = bitcast i8* %arrayidx38 to i64*
  store i64 101, i64* %16, align 8
  %arrayidx39 = getelementptr inbounds i8, i8* %call29, i64 72
  %17 = bitcast i8* %arrayidx39 to i64*
  store i64 114, i64* %17, align 8
  %arrayidx40 = getelementptr inbounds i8, i8* %call29, i64 80
  %18 = bitcast i8* %arrayidx40 to i64*
  store i64 115, i64* %18, align 8
  %arrayidx41 = getelementptr inbounds i8, i8* %call29, i64 88
  %19 = bitcast i8* %arrayidx41 to i64*
  store i64 101, i64* %19, align 8
  %arrayidx42 = getelementptr inbounds i8, i8* %call29, i64 96
  %20 = bitcast i8* %arrayidx42 to i64*
  store i64 32, i64* %20, align 8
  %arrayidx43 = getelementptr inbounds i8, i8* %call29, i64 104
  %21 = bitcast i8* %arrayidx43 to i64*
  store i64 116, i64* %21, align 8
  %arrayidx44 = getelementptr inbounds i8, i8* %call29, i64 112
  %22 = bitcast i8* %arrayidx44 to i64*
  store i64 101, i64* %22, align 8
  %arrayidx45 = getelementptr inbounds i8, i8* %call29, i64 120
  %23 = bitcast i8* %arrayidx45 to i64*
  store i64 115, i64* %23, align 8
  %arrayidx46 = getelementptr inbounds i8, i8* %call29, i64 128
  %24 = bitcast i8* %arrayidx46 to i64*
  store i64 116, i64* %24, align 8
  %arrayidx47 = getelementptr inbounds i8, i8* %call29, i64 136
  %25 = bitcast i8* %arrayidx47 to i64*
  store i64 32, i64* %25, align 8
  %arrayidx48 = getelementptr inbounds i8, i8* %call29, i64 144
  %26 = bitcast i8* %arrayidx48 to i64*
  store i64 99, i64* %26, align 8
  %arrayidx49 = getelementptr inbounds i8, i8* %call29, i64 152
  %27 = bitcast i8* %arrayidx49 to i64*
  store i64 97, i64* %27, align 8
  %arrayidx50 = getelementptr inbounds i8, i8* %call29, i64 160
  %28 = bitcast i8* %arrayidx50 to i64*
  store i64 115, i64* %28, align 8
  %arrayidx51 = getelementptr inbounds i8, i8* %call29, i64 168
  %29 = bitcast i8* %arrayidx51 to i64*
  store i64 101, i64* %29, align 8
  %arrayidx52 = getelementptr inbounds i8, i8* %call29, i64 176
  %30 = bitcast i8* %arrayidx52 to i64*
  store i64 32, i64* %30, align 8
  %arrayidx53 = getelementptr inbounds i8, i8* %call29, i64 184
  %31 = bitcast i8* %arrayidx53 to i64*
  store i64 119, i64* %31, align 8
  %arrayidx54 = getelementptr inbounds i8, i8* %call29, i64 192
  %32 = bitcast i8* %arrayidx54 to i64*
  store i64 105, i64* %32, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %call29, i64 200
  %33 = bitcast i8* %arrayidx55 to i64*
  store i64 116, i64* %33, align 8
  %arrayidx56 = getelementptr inbounds i8, i8* %call29, i64 208
  %34 = bitcast i8* %arrayidx56 to i64*
  store i64 104, i64* %34, align 8
  %arrayidx57 = getelementptr inbounds i8, i8* %call29, i64 216
  %35 = bitcast i8* %arrayidx57 to i64*
  store i64 32, i64* %35, align 8
  %arrayidx58 = getelementptr inbounds i8, i8* %call29, i64 224
  %36 = bitcast i8* %arrayidx58 to i64*
  store i64 105, i64* %36, align 8
  %arrayidx59 = getelementptr inbounds i8, i8* %call29, i64 232
  %37 = bitcast i8* %arrayidx59 to i64*
  store i64 110, i64* %37, align 8
  %arrayidx60 = getelementptr inbounds i8, i8* %call29, i64 240
  %38 = bitcast i8* %arrayidx60 to i64*
  store i64 112, i64* %38, align 8
  %arrayidx61 = getelementptr inbounds i8, i8* %call29, i64 248
  %39 = bitcast i8* %arrayidx61 to i64*
  store i64 117, i64* %39, align 8
  %arrayidx62 = getelementptr inbounds i8, i8* %call29, i64 256
  %40 = bitcast i8* %arrayidx62 to i64*
  store i64 116, i64* %40, align 8
  %arrayidx63 = getelementptr inbounds i8, i8* %call29, i64 264
  %41 = bitcast i8* %arrayidx63 to i64*
  store i64 32, i64* %41, align 8
  %arrayidx64 = getelementptr inbounds i8, i8* %call29, i64 272
  %42 = bitcast i8* %arrayidx64 to i64*
  store i64 61, i64* %42, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %call29, i64 280
  %43 = bitcast i8* %arrayidx65 to i64*
  store i64 32, i64* %43, align 8
  tail call void @printf_s(i64* %8, i64 36)
  %call66 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.21, i64 0, i64 0), i64 %call1) #6
  br label %blklab4

blklab4:                                          ; preds = %entry.split, %blklab8
  tail call void @exit(i32 0) #7
  unreachable
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #6

declare i32 @putchar(i32)

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readnone }
attributes #9 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 1f64ddbc4c5d1036b68ec896765a7535537ded85) (http://llvm.org/git/llvm.git 99a07120d47e1881a14a7b36bf7cf6bbd54954af)"}
