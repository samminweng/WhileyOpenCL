; ModuleID = 'While_Valid_1.fast.c'
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

; Function Attrs: nounwind uwtable
define void @toString(i64* %arr, i64 %size, i8** %res) #0 {
entry:
  %arr.addr = alloca i64*, align 8
  %size.addr = alloca i64, align 8
  %res.addr = alloca i8**, align 8
  %i = alloca i64, align 8
  %buffer = alloca [1024 x i8], align 16
  %buffer_size = alloca i64, align 8
  store i64* %arr, i64** %arr.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  store i8** %res, i8*** %res.addr, align 8
  store i64 0, i64* %i, align 8
  store i64 0, i64* %buffer_size, align 8
  %0 = load i8**, i8*** %res.addr, align 8
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8
  %3 = load i64, i64* %size.addr, align 8
  %cmp1 = icmp slt i64 %2, %3
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [1024 x i8], [1024 x i8]* %buffer, i32 0, i32 0
  %4 = load i64, i64* %i, align 8
  %5 = load i64*, i64** %arr.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %4
  %6 = load i64, i64* %arrayidx, align 8
  %call2 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i64 %6) #4
  %conv = sext i32 %call2 to i64
  store i64 %conv, i64* %buffer_size, align 8
  %7 = load i64, i64* %buffer_size, align 8
  %add = add i64 %7, 1
  %mul = mul i64 %add, 1
  %call3 = call noalias i8* @malloc(i64 %mul) #4
  %8 = load i64, i64* %i, align 8
  %9 = load i8**, i8*** %res.addr, align 8
  %arrayidx4 = getelementptr inbounds i8*, i8** %9, i64 %8
  store i8* %call3, i8** %arrayidx4, align 8
  %10 = load i64, i64* %i, align 8
  %11 = load i8**, i8*** %res.addr, align 8
  %arrayidx5 = getelementptr inbounds i8*, i8** %11, i64 %10
  %12 = load i8*, i8** %arrayidx5, align 8
  %cmp6 = icmp eq i8* %12, null
  br i1 %cmp6, label %if.then.8, label %if.end.10

if.then.8:                                        ; preds = %for.body
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = load i64, i64* %i, align 8
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i32 0, i32 0), i64 %14)
  call void @exit(i32 0) #5
  unreachable

if.end.10:                                        ; preds = %for.body
  %15 = load i64, i64* %i, align 8
  %16 = load i8**, i8*** %res.addr, align 8
  %arrayidx11 = getelementptr inbounds i8*, i8** %16, i64 %15
  %17 = load i8*, i8** %arrayidx11, align 8
  %arraydecay12 = getelementptr inbounds [1024 x i8], [1024 x i8]* %buffer, i32 0, i32 0
  %call13 = call i8* @strcpy(i8* %17, i8* %arraydecay12) #4
  br label %for.inc

for.inc:                                          ; preds = %if.end.10
  %18 = load i64, i64* %i, align 8
  %inc = add nsw i64 %18, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
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
  %arr.addr = alloca i64*, align 8
  %size.addr = alloca i64, align 8
  %ptr = alloca i64*, align 8
  %i = alloca i64, align 8
  store i64* %arr, i64** %arr.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  store i64* null, i64** %ptr, align 8
  store i64 0, i64* %i, align 8
  %0 = load i64, i64* %size.addr, align 8
  %mul = mul i64 %0, 8
  %call = call noalias i8* @malloc(i64 %mul) #4
  %1 = bitcast i8* %call to i64*
  store i64* %1, i64** %ptr, align 8
  %2 = load i64*, i64** %ptr, align 8
  %cmp = icmp eq i64* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8
  %5 = load i64, i64* %size.addr, align 8
  %cmp2 = icmp slt i64 %4, %5
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8
  %7 = load i64*, i64** %arr.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 %6
  %8 = load i64, i64* %arrayidx, align 8
  %9 = load i64, i64* %i, align 8
  %10 = load i64*, i64** %ptr, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %10, i64 %9
  store i64 %8, i64* %arrayidx3, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8
  %inc = add nsw i64 %11, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %ptr, align 8
  ret i64* %12
}

; Function Attrs: nounwind uwtable
define i64* @append(i64* %op_1, i64* %op_1_size, i64* %op_2, i64* %op_2_size, i64* %ret_size) #0 {
entry:
  %op_1.addr = alloca i64*, align 8
  %op_1_size.addr = alloca i64*, align 8
  %op_2.addr = alloca i64*, align 8
  %op_2_size.addr = alloca i64*, align 8
  %ret_size.addr = alloca i64*, align 8
  %i = alloca i64, align 8
  %ret = alloca i64*, align 8
  %allocated_size = alloca i64, align 8
  store i64* %op_1, i64** %op_1.addr, align 8
  store i64* %op_1_size, i64** %op_1_size.addr, align 8
  store i64* %op_2, i64** %op_2.addr, align 8
  store i64* %op_2_size, i64** %op_2_size.addr, align 8
  store i64* %ret_size, i64** %ret_size.addr, align 8
  store i64 0, i64* %i, align 8
  store i64* null, i64** %ret, align 8
  store i64 0, i64* %allocated_size, align 8
  %0 = load i64*, i64** %op_1.addr, align 8
  store i64* %0, i64** %ret, align 8
  %1 = load i64*, i64** %op_1_size.addr, align 8
  %2 = load i64, i64* %1, align 8
  %3 = load i64*, i64** %op_2_size.addr, align 8
  %4 = load i64, i64* %3, align 8
  %add = add nsw i64 %2, %4
  store i64 %add, i64* %allocated_size, align 8
  %5 = load i64*, i64** %ret, align 8
  %6 = bitcast i64* %5 to i8*
  %7 = load i64, i64* %allocated_size, align 8
  %mul = mul i64 %7, 8
  %call = call i8* @realloc(i8* %6, i64 %mul) #4
  %8 = bitcast i8* %call to i64*
  store i64* %8, i64** %ret, align 8
  %9 = load i64*, i64** %ret, align 8
  %cmp = icmp eq i64* %9, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %entry
  %11 = load i64*, i64** %op_1_size.addr, align 8
  %12 = load i64, i64* %11, align 8
  %13 = load i64*, i64** %ret, align 8
  %arrayidx = getelementptr inbounds i64, i64* %13, i64 %12
  %14 = bitcast i64* %arrayidx to i8*
  %15 = load i64*, i64** %op_2.addr, align 8
  %16 = bitcast i64* %15 to i8*
  %17 = load i64*, i64** %op_2_size.addr, align 8
  %18 = load i64, i64* %17, align 8
  %mul2 = mul i64 %18, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %16, i64 %mul2, i32 8, i1 false)
  %19 = load i64*, i64** %op_1_size.addr, align 8
  %20 = load i64, i64* %19, align 8
  %21 = load i64*, i64** %op_2_size.addr, align 8
  %22 = load i64, i64* %21, align 8
  %add3 = add nsw i64 %20, %22
  %23 = load i64*, i64** %ret_size.addr, align 8
  store i64 %add3, i64* %23, align 8
  %24 = load i64*, i64** %ret, align 8
  ret i64* %24
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #3

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define void @indirect_printf(i64 %input) #0 {
entry:
  %input.addr = alloca i64, align 8
  store i64 %input, i64* %input.addr, align 8
  %0 = load i64, i64* %input.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0), i64 %0)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @indirect_printf_array(i64* %input, i64 %input_size) #0 {
entry:
  %input.addr = alloca i64*, align 8
  %input_size.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %isFirst = alloca i32, align 4
  %max_i = alloca i32, align 4
  store i64* %input, i64** %input.addr, align 8
  store i64 %input_size, i64* %input_size.addr, align 8
  store i64 0, i64* %i, align 8
  store i32 1, i32* %isFirst, align 4
  store i32 10, i32* %max_i, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0))
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8
  %1 = load i64, i64* %input_size.addr, align 8
  %cmp = icmp slt i64 %0, %1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8
  %3 = load i32, i32* %max_i, align 4
  %conv = sext i32 %3 to i64
  %cmp1 = icmp slt i64 %2, %conv
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %cmp1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i32, i32* %isFirst, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8
  %7 = load i64*, i64** %input.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 %6
  %8 = load i64, i64* %arrayidx, align 8
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i64 %8)
  store i32 0, i32* %isFirst, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8
  %10 = load i64*, i64** %input.addr, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %10, i64 %9
  %11 = load i64, i64* %arrayidx4, align 8
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), i64 %11)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i64, i64* %i, align 8
  %inc = add nsw i64 %12, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %land.end
  %13 = load i64, i64* %input_size.addr, align 8
  %14 = load i64, i64* %i, align 8
  %cmp6 = icmp sgt i64 %13, %14
  br i1 %cmp6, label %if.then.8, label %if.end.11

if.then.8:                                        ; preds = %for.end
  %15 = load i64, i64* %input_size.addr, align 8
  %sub = sub nsw i64 %15, 1
  %16 = load i64*, i64** %input.addr, align 8
  %arrayidx9 = getelementptr inbounds i64, i64* %16, i64 %sub
  %17 = load i64, i64* %arrayidx9, align 8
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0), i64 %17)
  br label %if.end.11

if.end.11:                                        ; preds = %if.then.8, %for.end
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @isPowerof2(i64 %value) #0 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  %0 = load i64, i64* %value.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %value.addr, align 8
  %cmp1 = icmp ne i64 %1, 0
  br i1 %cmp1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end
  %2 = load i64, i64* %value.addr, align 8
  %3 = load i64, i64* %value.addr, align 8
  %sub = sub nsw i64 %3, 1
  %and = and i64 %2, %sub
  %tobool = icmp ne i64 %and, 0
  %lnot = xor i1 %tobool, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %4 = phi i1 [ false, %if.end ], [ %lnot, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  store i32 %land.ext, i32* %retval
  br label %return

return:                                           ; preds = %land.end, %if.then
  %5 = load i32, i32* %retval
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i64* @optimized_append(i64* %op_1, i64* %op_1_size, i64* %op_2, i64* %op_2_size, i64* %ret_size) #0 {
entry:
  %op_1.addr = alloca i64*, align 8
  %op_1_size.addr = alloca i64*, align 8
  %op_2.addr = alloca i64*, align 8
  %op_2_size.addr = alloca i64*, align 8
  %ret_size.addr = alloca i64*, align 8
  %i = alloca i64, align 8
  %ret = alloca i64*, align 8
  %allocated_size = alloca i64, align 8
  store i64* %op_1, i64** %op_1.addr, align 8
  store i64* %op_1_size, i64** %op_1_size.addr, align 8
  store i64* %op_2, i64** %op_2.addr, align 8
  store i64* %op_2_size, i64** %op_2_size.addr, align 8
  store i64* %ret_size, i64** %ret_size.addr, align 8
  %0 = load i64*, i64** %op_1.addr, align 8
  store i64* %0, i64** %ret, align 8
  %1 = load i64*, i64** %op_1_size.addr, align 8
  %2 = load i64, i64* %1, align 8
  %call = call i32 @isPowerof2(i64 %2)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end.6

if.then:                                          ; preds = %entry
  store i64 2, i64* %allocated_size, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %3 = load i64, i64* %allocated_size, align 8
  %4 = load i64*, i64** %op_1_size.addr, align 8
  %5 = load i64, i64* %4, align 8
  %6 = load i64*, i64** %op_2_size.addr, align 8
  %7 = load i64, i64* %6, align 8
  %add = add nsw i64 %5, %7
  %cmp = icmp slt i64 %3, %add
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i64, i64* %allocated_size, align 8
  %mul = mul nsw i64 %8, 2
  store i64 %mul, i64* %allocated_size, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %9 = load i64*, i64** %ret, align 8
  %10 = bitcast i64* %9 to i8*
  %11 = load i64, i64* %allocated_size, align 8
  %mul1 = mul i64 %11, 8
  %call2 = call i8* @realloc(i8* %10, i64 %mul1) #4
  %12 = bitcast i8* %call2 to i64*
  store i64* %12, i64** %ret, align 8
  %13 = load i64*, i64** %ret, align 8
  %cmp3 = icmp eq i64* %13, null
  br i1 %cmp3, label %if.then.4, label %if.end

if.then.4:                                        ; preds = %while.end
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

if.end:                                           ; preds = %while.end
  br label %if.end.6

if.end.6:                                         ; preds = %if.end, %entry
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end.6
  %15 = load i64, i64* %i, align 8
  %16 = load i64*, i64** %op_2_size.addr, align 8
  %17 = load i64, i64* %16, align 8
  %cmp7 = icmp slt i64 %15, %17
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %18 = load i64, i64* %i, align 8
  %19 = load i64*, i64** %op_2.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %19, i64 %18
  %20 = load i64, i64* %arrayidx, align 8
  %21 = load i64*, i64** %op_1_size.addr, align 8
  %22 = load i64, i64* %21, align 8
  %23 = load i64, i64* %i, align 8
  %add8 = add nsw i64 %22, %23
  %24 = load i64*, i64** %ret, align 8
  %arrayidx9 = getelementptr inbounds i64, i64* %24, i64 %add8
  store i64 %20, i64* %arrayidx9, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %25 = load i64, i64* %i, align 8
  %inc = add nsw i64 %25, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %26 = load i64*, i64** %op_1_size.addr, align 8
  %27 = load i64, i64* %26, align 8
  %28 = load i64*, i64** %op_2_size.addr, align 8
  %29 = load i64, i64* %28, align 8
  %add10 = add nsw i64 %27, %29
  %30 = load i64*, i64** %ret_size.addr, align 8
  store i64 %add10, i64* %30, align 8
  %31 = load i64*, i64** %ret, align 8
  ret i64* %31
}

; Function Attrs: nounwind uwtable
define void @readStringAsInteger(i8* %str, i64* %input) #0 {
entry:
  %str.addr = alloca i8*, align 8
  %input.addr = alloca i64*, align 8
  store i8* %str, i8** %str.addr, align 8
  store i64* %input, i64** %input.addr, align 8
  %0 = load i8*, i8** %str.addr, align 8
  %1 = load i64*, i64** %input.addr, align 8
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i64* %1) #4
  ret void
}

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @getStartingTime() #0 {
entry:
  %call = call i64 @clock() #4
  store i64 %call, i64* @start, align 8
  ret void
}

; Function Attrs: nounwind
declare i64 @clock() #3

; Function Attrs: nounwind uwtable
define void @getEndingTime() #0 {
entry:
  %fp = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** %fp, align 8
  %call = call i64 @clock() #4
  store i64 %call, i64* @end, align 8
  %call1 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0))
  store %struct._IO_FILE* %call1, %struct._IO_FILE** %fp, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %1 = load i64, i64* @end, align 8
  %2 = load i64, i64* @start, align 8
  %sub = sub nsw i64 %1, %2
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.12, i32 0, i32 0), double %div)
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call3 = call i32 @fclose(%struct._IO_FILE* %3)
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i64* @reverse(i64* %_ls, i64 %_ls_size) #0 {
entry:
  %_ls.addr = alloca i64*, align 8
  %_ls_size.addr = alloca i64, align 8
  %_i = alloca i64, align 8
  %_r = alloca i64*, align 8
  %_r_size = alloca i64, align 8
  %_3 = alloca i64, align 8
  %_4 = alloca i64, align 8
  %_5 = alloca i64*, align 8
  %_5_size = alloca i64, align 8
  %_6 = alloca i8*, align 8
  %_6_size = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64*, align 8
  %_12_size = alloca i64, align 8
  %_13 = alloca i64*, align 8
  %_13_size = alloca i64, align 8
  %_15 = alloca i64*, align 8
  %_15_size = alloca i64, align 8
  %_16 = alloca i64, align 8
  %_17 = alloca i64, align 8
  %_18 = alloca i64, align 8
  %_19 = alloca i64, align 8
  %_20 = alloca i64, align 8
  store i64* %_ls, i64** %_ls.addr, align 8
  store i64 %_ls_size, i64* %_ls_size.addr, align 8
  store i64 0, i64* %_i, align 8
  store i64* null, i64** %_r, align 8
  store i64 0, i64* %_r_size, align 8
  store i64 0, i64* %_3, align 8
  store i64 0, i64* %_4, align 8
  store i64* null, i64** %_5, align 8
  store i64 0, i64* %_5_size, align 8
  store i8* null, i8** %_6, align 8
  store i64 0, i64* %_6_size, align 8
  store i64 0, i64* %_7, align 8
  store i64 0, i64* %_8, align 8
  store i64 0, i64* %_9, align 8
  store i64 0, i64* %_10, align 8
  store i64 0, i64* %_11, align 8
  store i64* null, i64** %_12, align 8
  store i64 0, i64* %_12_size, align 8
  store i64* null, i64** %_13, align 8
  store i64 0, i64* %_13_size, align 8
  store i64* null, i64** %_15, align 8
  store i64 0, i64* %_15_size, align 8
  store i64 0, i64* %_16, align 8
  store i64 0, i64* %_17, align 8
  store i64 0, i64* %_18, align 8
  store i64 0, i64* %_19, align 8
  store i64 0, i64* %_20, align 8
  %0 = load i64, i64* %_ls_size.addr, align 8
  store i64 %0, i64* %_4, align 8
  %1 = load i64, i64* %_4, align 8
  store i64 %1, i64* %_3, align 8
  %2 = load i64, i64* %_3, align 8
  store i64 %2, i64* %_i, align 8
  %3 = load i64, i64* %_ls_size.addr, align 8
  store i64 %3, i64* %_16, align 8
  %4 = load i64, i64* %_16, align 8
  store i64 %4, i64* %_17, align 8
  %5 = load i64*, i64** %_ls.addr, align 8
  %6 = load i64, i64* %_ls_size.addr, align 8
  %call = call i64* @clone(i64* %5, i64 %6)
  store i64* %call, i64** %_r, align 8
  %7 = load i64, i64* %_ls_size.addr, align 8
  store i64 %7, i64* %_r_size, align 8
  store i64 0, i64* %_18, align 8
  %8 = load i64, i64* %_18, align 8
  store i64 %8, i64* %_19, align 8
  br label %while.cond

while.cond:                                       ; preds = %blklab1, %entry
  %9 = load i64, i64* %_i, align 8
  %10 = load i64, i64* %_8, align 8
  %cmp = icmp sgt i64 %9, %10
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %11 = load i64, i64* %_ls_size.addr, align 8
  store i64 %11, i64* %_7, align 8
  %12 = load i64, i64* %_i, align 8
  %13 = load i64, i64* %_7, align 8
  %cmp1 = icmp sle i64 %12, %13
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %blklab1

if.end:                                           ; preds = %while.body
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

blklab1:                                          ; preds = %if.then
  store i64 0, i64* %_8, align 8
  store i64 1, i64* %_9, align 8
  %15 = load i64, i64* %_i, align 8
  %16 = load i64, i64* %_9, align 8
  %sub = sub nsw i64 %15, %16
  store i64 %sub, i64* %_10, align 8
  %17 = load i64, i64* %_10, align 8
  store i64 %17, i64* %_i, align 8
  %18 = load i64, i64* %_i, align 8
  %19 = load i64*, i64** %_ls.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %19, i64 %18
  %20 = load i64, i64* %arrayidx, align 8
  store i64 %20, i64* %_11, align 8
  %21 = load i64, i64* %_11, align 8
  %22 = load i64, i64* %_19, align 8
  %23 = load i64*, i64** %_r, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %23, i64 %22
  store i64 %21, i64* %arrayidx3, align 8
  store i64 1, i64* %_20, align 8
  %24 = load i64, i64* %_19, align 8
  %25 = load i64, i64* %_20, align 8
  %add = add nsw i64 %24, %25
  store i64 %add, i64* %_20, align 8
  %26 = load i64, i64* %_20, align 8
  store i64 %26, i64* %_19, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %blklab0

blklab0:                                          ; preds = %while.end
  %27 = load i64, i64* %_19, align 8
  %28 = load i64, i64* %_17, align 8
  %cmp4 = icmp eq i64 %27, %28
  br i1 %cmp4, label %if.then.5, label %if.end.6

if.then.5:                                        ; preds = %blklab0
  br label %blklab3

if.end.6:                                         ; preds = %blklab0
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

blklab3:                                          ; preds = %if.then.5
  %30 = load i64*, i64** %_r, align 8
  ret i64* %30
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %_xs = alloca i64*, align 8
  %_xs_size = alloca i64, align 8
  %_i = alloca i64, align 8
  %_rs = alloca i64*, align 8
  %_rs_size = alloca i64, align 8
  %_4 = alloca i64*, align 8
  %_4_size = alloca i64, align 8
  %_5 = alloca i64*, align 8
  %_5_size = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64*, align 8
  %_8_size = alloca i64, align 8
  %_9 = alloca i64*, align 8
  %_9_size = alloca i64, align 8
  %_10 = alloca i64*, align 8
  %_10_size = alloca i64, align 8
  %_11 = alloca i64*, align 8
  %_11_size = alloca i64, align 8
  %_12 = alloca i64*, align 8
  %_12_size = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i64* null, i64** %_xs, align 8
  store i64 0, i64* %_xs_size, align 8
  store i64 0, i64* %_i, align 8
  store i64* null, i64** %_rs, align 8
  store i64 0, i64* %_rs_size, align 8
  store i64* null, i64** %_4, align 8
  store i64 0, i64* %_4_size, align 8
  store i64* null, i64** %_5, align 8
  store i64 0, i64* %_5_size, align 8
  store i64 0, i64* %_6, align 8
  store i64 0, i64* %_7, align 8
  store i64* null, i64** %_8, align 8
  store i64 0, i64* %_8_size, align 8
  store i64* null, i64** %_9, align 8
  store i64 0, i64* %_9_size, align 8
  store i64* null, i64** %_10, align 8
  store i64 0, i64* %_10_size, align 8
  store i64* null, i64** %_11, align 8
  store i64 0, i64* %_11_size, align 8
  store i64* null, i64** %_12, align 8
  store i64 0, i64* %_12_size, align 8
  %0 = load i64*, i64** %_5, align 8
  store i64* %0, i64** %_4, align 8
  %1 = load i64, i64* %_5_size, align 8
  store i64 %1, i64* %_4_size, align 8
  %2 = load i64*, i64** %_4, align 8
  store i64* %2, i64** %_xs, align 8
  %3 = load i64, i64* %_4_size, align 8
  store i64 %3, i64* %_xs_size, align 8
  store i64 0, i64* %_6, align 8
  %4 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %4, i64 1
  %5 = load i8*, i8** %arrayidx, align 8
  call void @readStringAsInteger(i8* %5, i64* %_7)
  %6 = load i64, i64* %_6, align 8
  store i64 %6, i64* %_i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %_i, align 8
  %8 = load i64, i64* %_7, align 8
  %cmp = icmp slt i64 %7, %8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i64 1, i64* %_9_size, align 8
  %9 = load i64, i64* %_9_size, align 8
  %mul = mul i64 %9, 8
  %call = call noalias i8* @malloc(i64 %mul) #4
  %10 = bitcast i8* %call to i64*
  store i64* %10, i64** %_9, align 8
  %11 = load i64, i64* %_i, align 8
  %12 = load i64*, i64** %_9, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %12, i64 0
  store i64 %11, i64* %arrayidx1, align 8
  %13 = load i64, i64* %_xs_size, align 8
  %14 = load i64, i64* %_9_size, align 8
  %add = add nsw i64 %13, %14
  store i64 %add, i64* %_10_size, align 8
  %15 = load i64*, i64** %_xs, align 8
  %16 = load i64*, i64** %_9, align 8
  %call2 = call i64* @append(i64* %15, i64* %_xs_size, i64* %16, i64* %_9_size, i64* %_10_size)
  store i64* %call2, i64** %_10, align 8
  %17 = load i64*, i64** %_9, align 8
  %18 = bitcast i64* %17 to i8*
  call void @free(i8* %18) #4
  %19 = load i64*, i64** %_10, align 8
  store i64* %19, i64** %_xs, align 8
  %20 = load i64, i64* %_10_size, align 8
  store i64 %20, i64* %_xs_size, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %21 = load i64, i64* %_i, align 8
  %inc = add nsw i64 %21, 1
  store i64 %inc, i64* %_i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %blklab2

blklab2:                                          ; preds = %for.end
  %22 = load i64, i64* %_xs_size, align 8
  store i64 %22, i64* %_12_size, align 8
  %23 = load i64*, i64** %_xs, align 8
  %24 = load i64, i64* %_xs_size, align 8
  %call3 = call i64* @reverse(i64* %23, i64 %24)
  store i64* %call3, i64** %_12, align 8
  %25 = load i64*, i64** %_12, align 8
  store i64* %25, i64** %_11, align 8
  %26 = load i64, i64* %_12_size, align 8
  store i64 %26, i64* %_11_size, align 8
  %27 = load i64*, i64** %_11, align 8
  store i64* %27, i64** %_rs, align 8
  %28 = load i64, i64* %_11_size, align 8
  store i64 %28, i64* %_rs_size, align 8
  %29 = load i64*, i64** %_rs, align 8
  %30 = load i64, i64* %_rs_size, align 8
  call void @indirect_printf_array(i64* %29, i64 %30)
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(i8*) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (http://llvm.org/git/clang.git 9a5a6f0e149ba035168641ca6dc4e3b3e5aa29b5) (http://llvm.org/git/llvm.git f44ed0919cbd91fe77aacdfe47701a6d664f1049)"}
