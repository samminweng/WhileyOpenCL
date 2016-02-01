; ModuleID = 'While_Valid_1.slow.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [77 x i8] c"fail to malloc res in toString(long long arr[], long long size, char** res)\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"fail to malloc %lld\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"fail to malloc\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"fail to realloc\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"\0A[\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c",%lld\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c" ... %lld\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"]\0A\00", align 1
@start = common global i64 0, align 8
@end = common global i64 0, align 8
@.str.10 = private unnamed_addr constant [11 x i8] c"result.txt\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.12 = private unnamed_addr constant [52 x i8] c"Execution time of reverse function(seconds):%.10lf\0A\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@diff = common global double 0.000000e+00, align 8
@str = private unnamed_addr constant [2 x i8] c"]\00"

; Function Attrs: nounwind uwtable
define void @toString(i64* %arr, i64 %size, i8** %res) #0 {
entry:
  %buffer = alloca [1024 x i8], align 16
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp = icmp eq i8** %res, null
  br i1 %cmp, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry.split
  %cmp1.2 = icmp sgt i64 %size, 0
  br i1 %cmp1.2, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  br label %for.body

if.then:                                          ; preds = %entry.split
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str, i64 0, i64 0), i64 76, i64 1, %struct._IO_FILE* %0) #5
  tail call void @exit(i32 0) #6
  unreachable

for.body:                                         ; preds = %for.body.lr.ph, %if.end.10
  %i.03 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %if.end.10 ]
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %buffer, i64 0, i64 0
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %i.03
  %2 = load i64, i64* %arrayidx, align 8
  %call2 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 %2) #4
  %conv = sext i32 %call2 to i64
  %add = add nsw i64 %conv, 1
  %call3 = call noalias i8* @malloc(i64 %add) #4
  %arrayidx4 = getelementptr inbounds i8*, i8** %res, i64 %i.03
  store i8* %call3, i8** %arrayidx4, align 8
  %cmp6 = icmp eq i8* %call3, null
  br i1 %cmp6, label %if.then.8, label %if.end.10

if.then.8:                                        ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0), i64 %i.03) #7
  call void @exit(i32 0) #6
  unreachable

if.end.10:                                        ; preds = %for.body
  %arrayidx11 = getelementptr inbounds i8*, i8** %res, i64 %i.03
  %4 = load i8*, i8** %arrayidx11, align 8
  %arraydecay12 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buffer, i64 0, i64 0
  %call13 = call i8* @strcpy(i8* %4, i8* %arraydecay12) #4
  %inc = add nsw i64 %i.03, 1
  %cmp1 = icmp slt i64 %inc, %size
  br i1 %cmp1, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %if.end.10
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %for.cond.preheader
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #3

; Function Attrs: nounwind uwtable
define i64* @clone(i64* %arr, i64 %size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %mul = shl i64 %size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #4
  %0 = bitcast i8* %call to i64*
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry.split
  %cmp2.1 = icmp sgt i64 %size, 0
  br i1 %cmp2.1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  br label %for.body

if.then:                                          ; preds = %entry.split
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i64 14, i64 1, %struct._IO_FILE* %1) #5
  tail call void @exit(i32 0) #6
  unreachable

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.02 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %i.02
  %3 = load i64, i64* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %0, i64 %i.02
  store i64 %3, i64* %arrayidx3, align 8
  %inc = add nsw i64 %i.02, 1
  %cmp2 = icmp slt i64 %inc, %size
  br i1 %cmp2, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %for.cond.preheader
  ret i64* %0
}

; Function Attrs: nounwind uwtable
define i64* @append(i64* %op_1, i64* %op_1_size, i64* %op_2, i64* %op_2_size, i64* %ret_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = load i64, i64* %op_1_size, align 8
  %1 = load i64, i64* %op_2_size, align 8
  %add = add nsw i64 %1, %0
  %2 = bitcast i64* %op_1 to i8*
  %mul = shl i64 %add, 3
  %call = tail call i8* @realloc(i8* %2, i64 %mul) #4
  %3 = bitcast i8* %call to i64*
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry.split
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %4) #5
  tail call void @exit(i32 0) #6
  unreachable

if.end:                                           ; preds = %entry.split
  %6 = load i64, i64* %op_1_size, align 8
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %6
  %7 = bitcast i64* %arrayidx to i8*
  %8 = bitcast i64* %op_2 to i8*
  %9 = load i64, i64* %op_2_size, align 8
  %mul2 = shl i64 %9, 3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 %mul2, i32 8, i1 false)
  %10 = load i64, i64* %op_1_size, align 8
  %11 = load i64, i64* %op_2_size, align 8
  %add3 = add nsw i64 %11, %10
  store i64 %add3, i64* %ret_size, align 8
  ret i64* %3
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define void @indirect_printf(i64 %input) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i64 %input) #4
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @indirect_printf_array(i64* %input, i64 %input_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0)) #4
  %cmp.1 = icmp sgt i64 %input_size, 0
  br i1 %cmp.1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry.split
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %isFirst.04 = phi i32 [ 1, %for.body.lr.ph ], [ %isFirst.1, %for.inc ]
  %i.03 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.inc ]
  %tobool = icmp eq i32 %isFirst.04, 0
  %arrayidx4 = getelementptr inbounds i64, i64* %input, i64 %i.03
  %0 = load i64, i64* %arrayidx4, align 8
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %for.body
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 %0) #4
  br label %for.inc

if.else:                                          ; preds = %for.body
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i64 0, i64 0), i64 %0) #4
  br label %for.inc

for.inc:                                          ; preds = %if.then, %if.else
  %isFirst.1 = phi i32 [ 0, %if.then ], [ %isFirst.04, %if.else ]
  %inc = add nsw i64 %i.03, 1
  %cmp = icmp slt i64 %inc, %input_size
  %cmp1 = icmp slt i64 %inc, 10
  %cmp1. = and i1 %cmp, %cmp1
  br i1 %cmp1., label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry.split
  %i.0.lcssa = phi i64 [ %inc, %for.cond.for.end_crit_edge ], [ 0, %entry.split ]
  %cmp6 = icmp slt i64 %i.0.lcssa, %input_size
  br i1 %cmp6, label %if.then.8, label %if.end.11

if.then.8:                                        ; preds = %for.end
  %sub = add nsw i64 %input_size, -1
  %arrayidx9 = getelementptr inbounds i64, i64* %input, i64 %sub
  %1 = load i64, i64* %arrayidx9, align 8
  %call10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i64 0, i64 0), i64 %1) #4
  br label %if.end.11

if.end.11:                                        ; preds = %if.then.8, %for.end
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @str, i64 0, i64 0))
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
  br i1 %tobool, label %if.end.6, label %while.cond.preheader

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
  %3 = bitcast i64* %op_1 to i8*
  %mul1 = shl i64 %allocated_size.0, 3
  %call2 = tail call i8* @realloc(i8* %3, i64 %mul1) #4
  %cmp3 = icmp eq i8* %call2, null
  br i1 %cmp3, label %if.then.4, label %if.end

if.then.4:                                        ; preds = %while.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i64 15, i64 1, %struct._IO_FILE* %4) #5
  tail call void @exit(i32 0) #6
  unreachable

if.end:                                           ; preds = %while.end
  %6 = bitcast i8* %call2 to i64*
  br label %if.end.6

if.end.6:                                         ; preds = %entry.split, %if.end
  %ret.0 = phi i64* [ %6, %if.end ], [ %op_1, %entry.split ]
  %7 = load i64, i64* %op_2_size, align 8
  %cmp7.1 = icmp sgt i64 %7, 0
  br i1 %cmp7.1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %if.end.6
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.02 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds i64, i64* %op_2, i64 %i.02
  %8 = load i64, i64* %arrayidx, align 8
  %9 = load i64, i64* %op_1_size, align 8
  %add8 = add nsw i64 %9, %i.02
  %arrayidx9 = getelementptr inbounds i64, i64* %ret.0, i64 %add8
  store i64 %8, i64* %arrayidx9, align 8
  %inc = add nsw i64 %i.02, 1
  %10 = load i64, i64* %op_2_size, align 8
  %cmp7 = icmp slt i64 %inc, %10
  br i1 %cmp7, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %if.end.6
  %11 = load i64, i64* %op_1_size, align 8
  %12 = load i64, i64* %op_2_size, align 8
  %add10 = add nsw i64 %12, %11
  store i64 %add10, i64* %ret_size, align 8
  ret i64* %ret.0
}

; Function Attrs: nounwind uwtable
define void @readStringAsInteger(i8* %str, i64* %input) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %str, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64* %input) #4
  ret void
}

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @getStartingTime() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64 @clock() #4
  store i64 %call, i64* @start, align 8
  ret void
}

; Function Attrs: nounwind
declare i64 @clock() #3

; Function Attrs: nounwind uwtable
define void @getEndingTime() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64 @clock() #4
  store i64 %call, i64* @end, align 8
  %call1 = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i64 0, i64 0)) #4
  %0 = load i64, i64* @end, align 8
  %1 = load i64, i64* @start, align 8
  %sub = sub nsw i64 %0, %1
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call1, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.12, i64 0, i64 0), double %div) #4
  %call3 = tail call i32 @fclose(%struct._IO_FILE* %call1) #4
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i64* @reverse(i64* %_ls, i64 %_ls_size) #0 {
entry:
  %_r_size = alloca i64, align 8
  %_12_size = alloca i64, align 8
  %_13_size = alloca i64, align 8
  br label %entry.split

entry.split:                                      ; preds = %entry
  store i64 0, i64* %_r_size, align 8
  store i64 0, i64* %_12_size, align 8
  store i64 0, i64* %_13_size, align 8
  store i64 0, i64* %_r_size, align 8
  %cmp.2 = icmp sgt i64 %_ls_size, 0
  br i1 %cmp.2, label %while.body.lr.ph, label %blklab0

while.body.lr.ph:                                 ; preds = %entry.split
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %blklab1
  %_i.04 = phi i64 [ %_ls_size, %while.body.lr.ph ], [ %sub, %blklab1 ]
  %_r.03 = phi i64* [ null, %while.body.lr.ph ], [ %call4, %blklab1 ]
  %cmp1 = icmp sgt i64 %_i.04, %_ls_size
  br i1 %cmp1, label %if.end, label %blklab1

if.end:                                           ; preds = %while.body
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #5
  call void @exit(i32 0) #6
  unreachable

blklab1:                                          ; preds = %while.body
  %sub = add nsw i64 %_i.04, -1
  %arrayidx = getelementptr inbounds i64, i64* %_ls, i64 %sub
  %2 = load i64, i64* %arrayidx, align 8
  store i64 1, i64* %_12_size, align 8
  %call2 = call noalias i8* @malloc(i64 8) #4
  %3 = bitcast i8* %call2 to i64*
  store i64 %2, i64* %3, align 8
  %4 = load i64, i64* %_r_size, align 8
  %5 = load i64, i64* %_12_size, align 8
  %add = add nsw i64 %5, %4
  store i64 %add, i64* %_13_size, align 8
  %call4 = call i64* @append(i64* %_r.03, i64* %_r_size, i64* %3, i64* %_12_size, i64* %_13_size)
  call void @free(i8* %call2) #4
  %6 = load i64, i64* %_13_size, align 8
  store i64 %6, i64* %_r_size, align 8
  %cmp = icmp sgt i64 %_i.04, 1
  br i1 %cmp, label %while.body, label %while.cond.blklab0_crit_edge

while.cond.blklab0_crit_edge:                     ; preds = %blklab1
  br label %blklab0

blklab0:                                          ; preds = %while.cond.blklab0_crit_edge, %entry.split
  %_r.0.lcssa = phi i64* [ %call4, %while.cond.blklab0_crit_edge ], [ null, %entry.split ]
  ret i64* %_r.0.lcssa
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %_xs_size = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_9_size = alloca i64, align 8
  %_10_size = alloca i64, align 8
  br label %entry.split

entry.split:                                      ; preds = %entry
  store i64 0, i64* %_xs_size, align 8
  store i64 0, i64* %_7, align 8
  store i64 0, i64* %_9_size, align 8
  store i64 0, i64* %_10_size, align 8
  store i64 0, i64* %_xs_size, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %0 = load i8*, i8** %arrayidx, align 8
  call void @readStringAsInteger(i8* %0, i64* %_7)
  %1 = load i64, i64* %_7, align 8
  %cmp.1 = icmp sgt i64 %1, 0
  br i1 %cmp.1, label %for.body.lr.ph, label %blklab2

for.body.lr.ph:                                   ; preds = %entry.split
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %_xs.03 = phi i64* [ null, %for.body.lr.ph ], [ %call2, %for.body ]
  %_i.02 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  store i64 1, i64* %_9_size, align 8
  %call = call noalias i8* @malloc(i64 8) #4
  %2 = bitcast i8* %call to i64*
  store i64 %_i.02, i64* %2, align 8
  %3 = load i64, i64* %_xs_size, align 8
  %4 = load i64, i64* %_9_size, align 8
  %add = add nsw i64 %4, %3
  store i64 %add, i64* %_10_size, align 8
  %call2 = call i64* @append(i64* %_xs.03, i64* %_xs_size, i64* %2, i64* %_9_size, i64* %_10_size)
  call void @free(i8* %call) #4
  %5 = load i64, i64* %_10_size, align 8
  store i64 %5, i64* %_xs_size, align 8
  %inc = add nsw i64 %_i.02, 1
  %6 = load i64, i64* %_7, align 8
  %cmp = icmp slt i64 %inc, %6
  br i1 %cmp, label %for.body, label %for.cond.blklab2_crit_edge

for.cond.blklab2_crit_edge:                       ; preds = %for.body
  br label %blklab2

blklab2:                                          ; preds = %for.cond.blklab2_crit_edge, %entry.split
  %_xs.0.lcssa = phi i64* [ %call2, %for.cond.blklab2_crit_edge ], [ null, %entry.split ]
  %7 = load i64, i64* %_xs_size, align 8
  %call3 = call i64* @reverse(i64* %_xs.0.lcssa, i64 %7)
  call void @indirect_printf_array(i64* %call3, i64 %7)
  ret i32 0
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (http://llvm.org/git/clang.git 9a5a6f0e149ba035168641ca6dc4e3b3e5aa29b5) (http://llvm.org/git/llvm.git f44ed0919cbd91fe77aacdfe47701a6d664f1049)"}
