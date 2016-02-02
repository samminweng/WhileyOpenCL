; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Matrix = type { i64**, i64, i64, i64, i64 }

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
@.str.20 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.21 = private unnamed_addr constant [7 x i8] c" data:\00", align 1
@.str.22 = private unnamed_addr constant [8 x i8] c" width:\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.24 = private unnamed_addr constant [9 x i8] c" height:\00", align 1
@.str.25 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@.str.26 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.27 = private unnamed_addr constant [5 x i8] c"fail\00", align 1

; Function Attrs: nounwind uwtable
define void @free2DArray(i64** %ptr, i64 %size) #0 {
entry:
  %ptr.addr = alloca i64**, align 8
  %size.addr = alloca i64, align 8
  %i = alloca i64, align 8
  store i64** %ptr, i64*** %ptr.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8
  %1 = load i64, i64* %size.addr, align 8
  %cmp = icmp slt i64 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8
  %3 = load i64**, i64*** %ptr.addr, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %3, i64 %2
  %4 = load i64*, i64** %arrayidx, align 8
  %5 = bitcast i64* %4 to i8*
  call void @free(i8* %5) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8
  %inc = add nsw i64 %6, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i64**, i64*** %ptr.addr, align 8
  %8 = bitcast i64** %7 to i8*
  call void @free(i8* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i64* @slice(i64* %arr, i64 %arr_size, i64 %start, i64 %end) #0 {
entry:
  %arr.addr = alloca i64*, align 8
  %arr_size.addr = alloca i64, align 8
  %start.addr = alloca i64, align 8
  %end.addr = alloca i64, align 8
  %sub_arr = alloca i64*, align 8
  store i64* %arr, i64** %arr.addr, align 8
  store i64 %arr_size, i64* %arr_size.addr, align 8
  store i64 %start, i64* %start.addr, align 8
  store i64 %end, i64* %end.addr, align 8
  store i64* null, i64** %sub_arr, align 8
  %0 = load i64, i64* %end.addr, align 8
  %1 = load i64, i64* %start.addr, align 8
  %sub = sub nsw i64 %0, %1
  %mul = mul i64 %sub, 8
  %call = call noalias i8* @malloc(i64 %mul) #6
  %2 = bitcast i8* %call to i64*
  store i64* %2, i64** %sub_arr, align 8
  %3 = load i64*, i64** %sub_arr, align 8
  %cmp = icmp eq i64* %3, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry
  %4 = load i64*, i64** %sub_arr, align 8
  %5 = bitcast i64* %4 to i8*
  %6 = load i64, i64* %start.addr, align 8
  %7 = load i64*, i64** %arr.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 %6
  %8 = bitcast i64* %arrayidx to i8*
  %9 = load i64, i64* %end.addr, align 8
  %10 = load i64, i64* %start.addr, align 8
  %sub2 = sub nsw i64 %9, %10
  %mul3 = mul i64 %sub2, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %8, i64 %mul3, i32 8, i1 false)
  %11 = load i64*, i64** %sub_arr, align 8
  ret i64* %11
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
  %value.addr = alloca i32, align 4
  %arr_size.addr = alloca i32, align 4
  %arr = alloca i64*, align 8
  %i = alloca i64, align 8
  store i32 %value, i32* %value.addr, align 4
  store i32 %arr_size, i32* %arr_size.addr, align 4
  store i64* null, i64** %arr, align 8
  store i64 0, i64* %i, align 8
  %0 = load i32, i32* %arr_size.addr, align 4
  %conv = sext i32 %0 to i64
  %mul = mul i64 %conv, 8
  %call = call noalias i8* @malloc(i64 %mul) #6
  %1 = bitcast i8* %call to i64*
  store i64* %1, i64** %arr, align 8
  %2 = load i64*, i64** %arr, align 8
  %cmp = icmp eq i64* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry
  %3 = load i64*, i64** %arr, align 8
  %4 = bitcast i64* %3 to i8*
  %5 = load i32, i32* %value.addr, align 4
  %6 = trunc i32 %5 to i8
  %7 = load i32, i32* %arr_size.addr, align 4
  %conv3 = sext i32 %7 to i64
  %mul4 = mul i64 %conv3, 8
  call void @llvm.memset.p0i8.i64(i8* %4, i8 %6, i64 %mul4, i32 8, i1 false)
  %8 = load i64*, i64** %arr, align 8
  ret i64* %8
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

; Function Attrs: nounwind uwtable
define i64** @gen2DArray(i64* %arr, i64 %x, i64 %y) #0 {
entry:
  %arr.addr = alloca i64*, align 8
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %_2DArray = alloca i64**, align 8
  %i = alloca i64, align 8
  %size = alloca i64, align 8
  store i64* %arr, i64** %arr.addr, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  store i64** null, i64*** %_2DArray, align 8
  store i64 0, i64* %i, align 8
  %0 = load i64, i64* %y.addr, align 8
  %mul = mul i64 %0, 8
  store i64 %mul, i64* %size, align 8
  %1 = load i64, i64* %x.addr, align 8
  %mul1 = mul i64 %1, 8
  %call = call noalias i8* @malloc(i64 %mul1) #6
  %2 = bitcast i8* %call to i64**
  store i64** %2, i64*** %_2DArray, align 8
  %3 = load i64**, i64*** %_2DArray, align 8
  %cmp = icmp eq i64** %3, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8
  %5 = load i64, i64* %x.addr, align 8
  %cmp3 = icmp slt i64 %4, %5
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %size, align 8
  %call4 = call noalias i8* @malloc(i64 %6) #6
  %7 = bitcast i8* %call4 to i64*
  %8 = load i64, i64* %i, align 8
  %9 = load i64**, i64*** %_2DArray, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %9, i64 %8
  store i64* %7, i64** %arrayidx, align 8
  %10 = load i64, i64* %i, align 8
  %11 = load i64**, i64*** %_2DArray, align 8
  %arrayidx5 = getelementptr inbounds i64*, i64** %11, i64 %10
  %12 = load i64*, i64** %arrayidx5, align 8
  %cmp6 = icmp eq i64* %12, null
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %for.body
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end9:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8
  %14 = load i64**, i64*** %_2DArray, align 8
  %arrayidx10 = getelementptr inbounds i64*, i64** %14, i64 %13
  %15 = load i64*, i64** %arrayidx10, align 8
  %16 = bitcast i64* %15 to i8*
  %17 = load i64*, i64** %arr.addr, align 8
  %18 = bitcast i64* %17 to i8*
  %19 = load i64, i64* %size, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %18, i64 %19, i32 8, i1 false)
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %20 = load i64, i64* %i, align 8
  %inc = add nsw i64 %20, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %21 = load i64**, i64*** %_2DArray, align 8
  ret i64** %21
}

; Function Attrs: nounwind uwtable
define i64 @parseStringToInt(i64* %arr) #0 {
entry:
  %arr.addr = alloca i64*, align 8
  %value = alloca i64, align 8
  %i = alloca i64, align 8
  store i64* %arr, i64** %arr.addr, align 8
  store i64 0, i64* %value, align 8
  store i64 0, i64* %i, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i64, i64* %i, align 8
  %1 = load i64*, i64** %arr.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 %0
  %2 = load i64, i64* %arrayidx, align 8
  %cmp = icmp sge i64 %2, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %3 = load i64, i64* %i, align 8
  %4 = load i64*, i64** %arr.addr, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %3
  %5 = load i64, i64* %arrayidx1, align 8
  %cmp2 = icmp sle i64 %5, 9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %6 = phi i1 [ false, %while.cond ], [ %cmp2, %land.rhs ]
  br i1 %6, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %7 = load i64, i64* %value, align 8
  %mul = mul nsw i64 %7, 10
  %8 = load i64, i64* %i, align 8
  %9 = load i64*, i64** %arr.addr, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 %8
  %10 = load i64, i64* %arrayidx3, align 8
  %add = add nsw i64 %mul, %10
  store i64 %add, i64* %value, align 8
  %11 = load i64, i64* %i, align 8
  %inc = add nsw i64 %11, 1
  store i64 %inc, i64* %i, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %12 = load i64, i64* %value, align 8
  ret i64 %12
}

; Function Attrs: nounwind uwtable
define i64** @convertArgsToIntArray(i32 %argc, i8** %args) #0 {
entry:
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %arr = alloca i64**, align 8
  %arr_size = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %max_j = alloca i64, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %argc.addr, align 4
  %sub = sub nsw i32 %1, 1
  %conv = sext i32 %sub to i64
  %mul = mul i64 %conv, 8
  %call1 = call noalias i8* @malloc(i64 %mul) #6
  %2 = bitcast i8* %call1 to i64**
  store i64** %2, i64*** %arr, align 8
  %3 = load i64**, i64*** %arr, align 8
  %cmp2 = icmp eq i64** %3, null
  br i1 %cmp2, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end6:                                          ; preds = %if.end
  store i64 0, i64* %arr_size, align 8
  store i64 1, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc52, %if.end6
  %4 = load i64, i64* %i, align 8
  %5 = load i32, i32* %argc.addr, align 4
  %conv7 = sext i32 %5 to i64
  %cmp8 = icmp slt i64 %4, %conv7
  br i1 %cmp8, label %for.body, label %for.end54

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8
  %7 = load i8**, i8*** %args.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %7, i64 %6
  %8 = load i8*, i8** %arrayidx, align 8
  %arrayidx10 = getelementptr inbounds i8, i8* %8, i64 0
  %9 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %9 to i32
  %idxprom = sext i32 %conv11 to i64
  %call12 = call i16** @__ctype_b_loc() #8
  %10 = load i16*, i16** %call12, align 8
  %arrayidx13 = getelementptr inbounds i16, i16* %10, i64 %idxprom
  %11 = load i16, i16* %arrayidx13, align 2
  %conv14 = zext i16 %11 to i32
  %and = and i32 %conv14, 2048
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then15, label %if.end51

if.then15:                                        ; preds = %for.body
  store i64 0, i64* %max_j, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end32, %if.then15
  %12 = load i64, i64* %max_j, align 8
  %13 = load i64, i64* %i, align 8
  %14 = load i8**, i8*** %args.addr, align 8
  %arrayidx16 = getelementptr inbounds i8*, i8** %14, i64 %13
  %15 = load i8*, i8** %arrayidx16, align 8
  %arrayidx17 = getelementptr inbounds i8, i8* %15, i64 %12
  %16 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %16 to i32
  %cmp19 = icmp ne i32 %conv18, 0
  br i1 %cmp19, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %17 = load i64, i64* %max_j, align 8
  %18 = load i64, i64* %i, align 8
  %19 = load i8**, i8*** %args.addr, align 8
  %arrayidx21 = getelementptr inbounds i8*, i8** %19, i64 %18
  %20 = load i8*, i8** %arrayidx21, align 8
  %arrayidx22 = getelementptr inbounds i8, i8* %20, i64 %17
  %21 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %21 to i32
  %idxprom24 = sext i32 %conv23 to i64
  %call25 = call i16** @__ctype_b_loc() #8
  %22 = load i16*, i16** %call25, align 8
  %arrayidx26 = getelementptr inbounds i16, i16* %22, i64 %idxprom24
  %23 = load i16, i16* %arrayidx26, align 2
  %conv27 = zext i16 %23 to i32
  %and28 = and i32 %conv27, 2048
  %tobool29 = icmp ne i32 %and28, 0
  br i1 %tobool29, label %if.end32, label %if.then30

if.then30:                                        ; preds = %while.body
  %call31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end32:                                         ; preds = %while.body
  %24 = load i64, i64* %max_j, align 8
  %inc = add nsw i64 %24, 1
  store i64 %inc, i64* %max_j, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %25 = load i64, i64* %max_j, align 8
  %add = add nsw i64 %25, 1
  %mul33 = mul i64 %add, 8
  %call34 = call noalias i8* @malloc(i64 %mul33) #6
  %26 = bitcast i8* %call34 to i64*
  %27 = load i64, i64* %arr_size, align 8
  %28 = load i64**, i64*** %arr, align 8
  %arrayidx35 = getelementptr inbounds i64*, i64** %28, i64 %27
  store i64* %26, i64** %arrayidx35, align 8
  store i64 0, i64* %j, align 8
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc, %while.end
  %29 = load i64, i64* %j, align 8
  %30 = load i64, i64* %max_j, align 8
  %cmp37 = icmp slt i64 %29, %30
  br i1 %cmp37, label %for.body39, label %for.end

for.body39:                                       ; preds = %for.cond36
  %31 = load i64, i64* %j, align 8
  %32 = load i64, i64* %i, align 8
  %33 = load i8**, i8*** %args.addr, align 8
  %arrayidx40 = getelementptr inbounds i8*, i8** %33, i64 %32
  %34 = load i8*, i8** %arrayidx40, align 8
  %arrayidx41 = getelementptr inbounds i8, i8* %34, i64 %31
  %35 = load i8, i8* %arrayidx41, align 1
  %conv42 = sext i8 %35 to i32
  %sub43 = sub nsw i32 %conv42, 48
  %conv44 = sext i32 %sub43 to i64
  %36 = load i64, i64* %j, align 8
  %37 = load i64, i64* %arr_size, align 8
  %38 = load i64**, i64*** %arr, align 8
  %arrayidx45 = getelementptr inbounds i64*, i64** %38, i64 %37
  %39 = load i64*, i64** %arrayidx45, align 8
  %arrayidx46 = getelementptr inbounds i64, i64* %39, i64 %36
  store i64 %conv44, i64* %arrayidx46, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body39
  %40 = load i64, i64* %j, align 8
  %inc47 = add nsw i64 %40, 1
  store i64 %inc47, i64* %j, align 8
  br label %for.cond36

for.end:                                          ; preds = %for.cond36
  %41 = load i64, i64* %j, align 8
  %42 = load i64, i64* %arr_size, align 8
  %43 = load i64**, i64*** %arr, align 8
  %arrayidx48 = getelementptr inbounds i64*, i64** %43, i64 %42
  %44 = load i64*, i64** %arrayidx48, align 8
  %arrayidx49 = getelementptr inbounds i64, i64* %44, i64 %41
  store i64 -1, i64* %arrayidx49, align 8
  %45 = load i64, i64* %arr_size, align 8
  %inc50 = add nsw i64 %45, 1
  store i64 %inc50, i64* %arr_size, align 8
  br label %if.end51

if.end51:                                         ; preds = %for.end, %for.body
  br label %for.inc52

for.inc52:                                        ; preds = %if.end51
  %46 = load i64, i64* %i, align 8
  %inc53 = add nsw i64 %46, 1
  store i64 %inc53, i64* %i, align 8
  br label %for.cond

for.end54:                                        ; preds = %for.cond
  %47 = load i64**, i64*** %arr, align 8
  ret i64** %47
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #5

; Function Attrs: nounwind uwtable
define i32 @isArrayEqual(i64* %arr1, i64 %arr1_size, i64* %arr2, i64 %arr2_size) #0 {
entry:
  %retval = alloca i32, align 4
  %arr1.addr = alloca i64*, align 8
  %arr1_size.addr = alloca i64, align 8
  %arr2.addr = alloca i64*, align 8
  %arr2_size.addr = alloca i64, align 8
  %i = alloca i64, align 8
  store i64* %arr1, i64** %arr1.addr, align 8
  store i64 %arr1_size, i64* %arr1_size.addr, align 8
  store i64* %arr2, i64** %arr2.addr, align 8
  store i64 %arr2_size, i64* %arr2_size.addr, align 8
  store i64 0, i64* %i, align 8
  %0 = load i64, i64* %arr1_size.addr, align 8
  %1 = load i64, i64* %arr2_size.addr, align 8
  %cmp = icmp ne i64 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8
  %3 = load i64, i64* %arr1_size.addr, align 8
  %cmp1 = icmp slt i64 %2, %3
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8
  %5 = load i64*, i64** %arr1.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %4
  %6 = load i64, i64* %arrayidx, align 8
  %7 = load i64, i64* %i, align 8
  %8 = load i64*, i64** %arr2.addr, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 %7
  %9 = load i64, i64* %arrayidx2, align 8
  %cmp3 = icmp ne i64 %6, %9
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %for.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end5
  %10 = load i64, i64* %i, align 8
  %inc = add nsw i64 %10, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then4, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i64* @copy(i64* %arr, i64 %size) #0 {
entry:
  %arr.addr = alloca i64*, align 8
  %size.addr = alloca i64, align 8
  %ptr = alloca i64*, align 8
  store i64* %arr, i64** %arr.addr, align 8
  store i64 %size, i64* %size.addr, align 8
  store i64* null, i64** %ptr, align 8
  %0 = load i64, i64* %size.addr, align 8
  %mul = mul i64 %0, 8
  %call = call noalias i8* @malloc(i64 %mul) #6
  %1 = bitcast i8* %call to i64*
  store i64* %1, i64** %ptr, align 8
  %2 = load i64*, i64** %ptr, align 8
  %cmp = icmp eq i64* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.6, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry
  %3 = load i64*, i64** %ptr, align 8
  %4 = bitcast i64* %3 to i8*
  %5 = load i64*, i64** %arr.addr, align 8
  %6 = bitcast i64* %5 to i8*
  %7 = load i64, i64* %size.addr, align 8
  %mul2 = mul i64 %7, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %6, i64 %mul2, i32 8, i1 false)
  %8 = load i64*, i64** %ptr, align 8
  ret i64* %8
}

; Function Attrs: nounwind uwtable
define i64** @copy2DArray(i64** %arr, i64 %x, i64 %y) #0 {
entry:
  %arr.addr = alloca i64**, align 8
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  %newMatrix = alloca i64**, align 8
  %i = alloca i64, align 8
  %size = alloca i64, align 8
  store i64** %arr, i64*** %arr.addr, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  store i64** null, i64*** %newMatrix, align 8
  store i64 0, i64* %i, align 8
  %0 = load i64, i64* %x.addr, align 8
  %mul = mul i64 %0, 8
  %call = call noalias i8* @malloc(i64 %mul) #6
  %1 = bitcast i8* %call to i64**
  store i64** %1, i64*** %newMatrix, align 8
  %2 = load i64**, i64*** %newMatrix, align 8
  %cmp = icmp eq i64** %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry
  %3 = load i64, i64* %y.addr, align 8
  %mul2 = mul i64 %3, 8
  store i64 %mul2, i64* %size, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8
  %5 = load i64, i64* %x.addr, align 8
  %cmp3 = icmp slt i64 %4, %5
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %size, align 8
  %call4 = call noalias i8* @malloc(i64 %6) #6
  %7 = bitcast i8* %call4 to i64*
  %8 = load i64, i64* %i, align 8
  %9 = load i64**, i64*** %newMatrix, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %9, i64 %8
  store i64* %7, i64** %arrayidx, align 8
  %10 = load i64, i64* %i, align 8
  %11 = load i64**, i64*** %newMatrix, align 8
  %arrayidx5 = getelementptr inbounds i64*, i64** %11, i64 %10
  %12 = load i64*, i64** %arrayidx5, align 8
  %cmp6 = icmp eq i64* %12, null
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %for.body
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.8, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end9:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8
  %14 = load i64**, i64*** %newMatrix, align 8
  %arrayidx10 = getelementptr inbounds i64*, i64** %14, i64 %13
  %15 = load i64*, i64** %arrayidx10, align 8
  %16 = bitcast i64* %15 to i8*
  %17 = load i64, i64* %i, align 8
  %18 = load i64**, i64*** %arr.addr, align 8
  %arrayidx11 = getelementptr inbounds i64*, i64** %18, i64 %17
  %19 = load i64*, i64** %arrayidx11, align 8
  %20 = bitcast i64* %19 to i8*
  %21 = load i64, i64* %size, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %20, i64 %21, i32 8, i1 false)
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %22 = load i64, i64* %i, align 8
  %inc = add nsw i64 %22, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %23 = load i64**, i64*** %newMatrix, align 8
  ret i64** %23
}

; Function Attrs: nounwind uwtable
define i64* @append(i64* %arr1, i64 %arr1_size, i64* %arr2, i64 %arr2_size) #0 {
entry:
  %arr1.addr = alloca i64*, align 8
  %arr1_size.addr = alloca i64, align 8
  %arr2.addr = alloca i64*, align 8
  %arr2_size.addr = alloca i64, align 8
  %ret_arr = alloca i64*, align 8
  %size = alloca i64, align 8
  store i64* %arr1, i64** %arr1.addr, align 8
  store i64 %arr1_size, i64* %arr1_size.addr, align 8
  store i64* %arr2, i64** %arr2.addr, align 8
  store i64 %arr2_size, i64* %arr2_size.addr, align 8
  store i64* null, i64** %ret_arr, align 8
  store i64 0, i64* %size, align 8
  %0 = load i64, i64* %arr1_size.addr, align 8
  %1 = load i64, i64* %arr2_size.addr, align 8
  %add = add nsw i64 %0, %1
  store i64 %add, i64* %size, align 8
  %2 = load i64*, i64** %arr1.addr, align 8
  %3 = bitcast i64* %2 to i8*
  %4 = load i64, i64* %size, align 8
  %mul = mul i64 %4, 8
  %call = call i8* @realloc(i8* %3, i64 %mul) #6
  %5 = bitcast i8* %call to i64*
  store i64* %5, i64** %ret_arr, align 8
  %6 = load i64*, i64** %ret_arr, align 8
  %cmp = icmp eq i64* %6, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.9, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %entry
  %7 = load i64, i64* %arr1_size.addr, align 8
  %8 = load i64*, i64** %ret_arr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 %7
  %9 = bitcast i64* %arrayidx to i8*
  %10 = load i64*, i64** %arr2.addr, align 8
  %11 = bitcast i64* %10 to i8*
  %12 = load i64, i64* %arr2_size.addr, align 8
  %mul2 = mul i64 %12, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %11, i64 %mul2, i32 8, i1 false)
  %13 = load i64*, i64** %ret_arr, align 8
  ret i64* %13
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

; Function Attrs: nounwind uwtable
define void @indirect_printf(i64 %input) #0 {
entry:
  %input.addr = alloca i64, align 8
  store i64 %input, i64* %input.addr, align 8
  %0 = load i64, i64* %input.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0), i64 %0)
  ret void
}

; Function Attrs: nounwind uwtable
define void @printf1DArray(i64* %input, i64 %input_size) #0 {
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
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0))
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
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), i64 %8)
  store i32 0, i32* %isFirst, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8
  %10 = load i64*, i64** %input.addr, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %10, i64 %9
  %11 = load i64, i64* %arrayidx4, align 8
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i32 0, i32 0), i64 %11)
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
  br i1 %cmp6, label %if.then8, label %if.end11

if.then8:                                         ; preds = %for.end
  %15 = load i64, i64* %input_size.addr, align 8
  %sub = sub nsw i64 %15, 1
  %16 = load i64*, i64** %input.addr, align 8
  %arrayidx9 = getelementptr inbounds i64, i64* %16, i64 %sub
  %17 = load i64, i64* %arrayidx9, align 8
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.14, i32 0, i32 0), i64 %17)
  br label %if.end11

if.end11:                                         ; preds = %if.then8, %for.end
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define void @printf2DArray(i64** %input, i64 %input_size, i64 %input_size_size) #0 {
entry:
  %input.addr = alloca i64**, align 8
  %input_size.addr = alloca i64, align 8
  %input_size_size.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %isFirst = alloca i32, align 4
  %max_i = alloca i32, align 4
  store i64** %input, i64*** %input.addr, align 8
  store i64 %input_size, i64* %input_size.addr, align 8
  store i64 %input_size_size, i64* %input_size_size.addr, align 8
  store i64 0, i64* %i, align 8
  store i32 1, i32* %isFirst, align 4
  store i32 10, i32* %max_i, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0))
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
  %5 = load i64, i64* %i, align 8
  %6 = load i64**, i64*** %input.addr, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %6, i64 %5
  %7 = load i64*, i64** %arrayidx, align 8
  %8 = load i64, i64* %input_size_size.addr, align 8
  call void @printf1DArray(i64* %7, i64 %8)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8
  %inc = add nsw i64 %9, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %land.end
  %10 = load i64, i64* %input_size.addr, align 8
  %11 = load i64, i64* %i, align 8
  %cmp3 = icmp sgt i64 %10, %11
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.16, i32 0, i32 0))
  %12 = load i64, i64* %input_size.addr, align 8
  %sub = sub nsw i64 %12, 1
  %13 = load i64**, i64*** %input.addr, align 8
  %arrayidx6 = getelementptr inbounds i64*, i64** %13, i64 %sub
  %14 = load i64*, i64** %arrayidx6, align 8
  %15 = load i64, i64* %input_size_size.addr, align 8
  call void @printf1DArray(i64* %14, i64 %15)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define void @printf_s(i64* %input, i64 %input_size) #0 {
entry:
  %input.addr = alloca i64*, align 8
  %input_size.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %c = alloca i8, align 1
  store i64* %input, i64** %input.addr, align 8
  store i64 %input_size, i64* %input_size.addr, align 8
  store i64 0, i64* %i, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8
  %1 = load i64, i64* %input_size.addr, align 8
  %cmp = icmp slt i64 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8
  %3 = load i64*, i64** %input.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %3, i64 %2
  %4 = load i64, i64* %arrayidx, align 8
  %conv = trunc i64 %4 to i8
  store i8 %conv, i8* %c, align 1
  %5 = load i8, i8* %c, align 1
  %conv1 = sext i8 %5 to i32
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0), i32 %conv1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8
  %inc = add nsw i64 %6, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @println_s(i64* %input, i64 %input_size) #0 {
entry:
  %input.addr = alloca i64*, align 8
  %input_size.addr = alloca i64, align 8
  store i64* %input, i64** %input.addr, align 8
  store i64 %input_size, i64* %input_size.addr, align 8
  %0 = load i64*, i64** %input.addr, align 8
  %1 = load i64, i64* %input_size.addr, align 8
  call void @printf_s(i64* %0, i64 %1)
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18, i32 0, i32 0))
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
  store i32 1, i32* %retval, align 4
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
  store i32 %land.ext, i32* %retval, align 4
  br label %return

return:                                           ; preds = %land.end, %if.then
  %5 = load i32, i32* %retval, align 4
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
  br i1 %tobool, label %if.then, label %if.end6

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
  %call2 = call i8* @realloc(i8* %10, i64 %mul1) #6
  %12 = bitcast i8* %call2 to i64*
  store i64* %12, i64** %ret, align 8
  %13 = load i64*, i64** %ret, align 8
  %cmp3 = icmp eq i64* %13, null
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %while.end
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.19, i32 0, i32 0))
  call void @exit(i32 -2) #7
  unreachable

if.end:                                           ; preds = %while.end
  br label %if.end6

if.end6:                                          ; preds = %if.end, %entry
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %14 = load i64, i64* %i, align 8
  %15 = load i64*, i64** %op_2_size.addr, align 8
  %16 = load i64, i64* %15, align 8
  %cmp7 = icmp slt i64 %14, %16
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %17 = load i64, i64* %i, align 8
  %18 = load i64*, i64** %op_2.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %18, i64 %17
  %19 = load i64, i64* %arrayidx, align 8
  %20 = load i64*, i64** %op_1_size.addr, align 8
  %21 = load i64, i64* %20, align 8
  %22 = load i64, i64* %i, align 8
  %add8 = add nsw i64 %21, %22
  %23 = load i64*, i64** %ret, align 8
  %arrayidx9 = getelementptr inbounds i64, i64* %23, i64 %add8
  store i64 %19, i64* %arrayidx9, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %24 = load i64, i64* %i, align 8
  %inc = add nsw i64 %24, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %25 = load i64*, i64** %op_1_size.addr, align 8
  %26 = load i64, i64* %25, align 8
  %27 = load i64*, i64** %op_2_size.addr, align 8
  %28 = load i64, i64* %27, align 8
  %add10 = add nsw i64 %26, %28
  %29 = load i64*, i64** %ret_size.addr, align 8
  store i64 %add10, i64* %29, align 8
  %30 = load i64*, i64** %ret, align 8
  ret i64* %30
}

; Function Attrs: nounwind uwtable
define %struct.Matrix* @copy_Matrix(%struct.Matrix* %_Matrix) #0 {
entry:
  %_Matrix.addr = alloca %struct.Matrix*, align 8
  %new_Matrix = alloca %struct.Matrix*, align 8
  store %struct.Matrix* %_Matrix, %struct.Matrix** %_Matrix.addr, align 8
  %call = call noalias i8* @malloc(i64 40) #6
  %0 = bitcast i8* %call to %struct.Matrix*
  store %struct.Matrix* %0, %struct.Matrix** %new_Matrix, align 8
  %1 = load %struct.Matrix*, %struct.Matrix** %_Matrix.addr, align 8
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i32 0, i32 1
  %2 = load i64, i64* %data_size, align 8
  %3 = load %struct.Matrix*, %struct.Matrix** %new_Matrix, align 8
  %data_size1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %3, i32 0, i32 1
  store i64 %2, i64* %data_size1, align 8
  %4 = load %struct.Matrix*, %struct.Matrix** %_Matrix.addr, align 8
  %data_size_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %4, i32 0, i32 2
  %5 = load i64, i64* %data_size_size, align 8
  %6 = load %struct.Matrix*, %struct.Matrix** %new_Matrix, align 8
  %data_size_size2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %6, i32 0, i32 2
  store i64 %5, i64* %data_size_size2, align 8
  %7 = load %struct.Matrix*, %struct.Matrix** %_Matrix.addr, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %7, i32 0, i32 0
  %8 = load i64**, i64*** %data, align 8
  %9 = load %struct.Matrix*, %struct.Matrix** %_Matrix.addr, align 8
  %data_size3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %9, i32 0, i32 1
  %10 = load i64, i64* %data_size3, align 8
  %11 = load %struct.Matrix*, %struct.Matrix** %_Matrix.addr, align 8
  %data_size_size4 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %11, i32 0, i32 2
  %12 = load i64, i64* %data_size_size4, align 8
  %call5 = call i64** @copy2DArray(i64** %8, i64 %10, i64 %12)
  %13 = load %struct.Matrix*, %struct.Matrix** %new_Matrix, align 8
  %data6 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %13, i32 0, i32 0
  store i64** %call5, i64*** %data6, align 8
  %14 = load %struct.Matrix*, %struct.Matrix** %_Matrix.addr, align 8
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %14, i32 0, i32 3
  %15 = load i64, i64* %width, align 8
  %16 = load %struct.Matrix*, %struct.Matrix** %new_Matrix, align 8
  %width7 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %16, i32 0, i32 3
  store i64 %15, i64* %width7, align 8
  %17 = load %struct.Matrix*, %struct.Matrix** %_Matrix.addr, align 8
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %17, i32 0, i32 4
  %18 = load i64, i64* %height, align 8
  %19 = load %struct.Matrix*, %struct.Matrix** %new_Matrix, align 8
  %height8 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %19, i32 0, i32 4
  store i64 %18, i64* %height8, align 8
  %20 = load %struct.Matrix*, %struct.Matrix** %new_Matrix, align 8
  ret %struct.Matrix* %20
}

; Function Attrs: nounwind uwtable
define void @free_Matrix(%struct.Matrix* %matrix) #0 {
entry:
  %matrix.addr = alloca %struct.Matrix*, align 8
  store %struct.Matrix* %matrix, %struct.Matrix** %matrix.addr, align 8
  %0 = load %struct.Matrix*, %struct.Matrix** %matrix.addr, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %0, i32 0, i32 0
  %1 = load i64**, i64*** %data, align 8
  %2 = load %struct.Matrix*, %struct.Matrix** %matrix.addr, align 8
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %2, i32 0, i32 1
  %3 = load i64, i64* %data_size, align 8
  call void @free2DArray(i64** %1, i64 %3)
  %4 = load %struct.Matrix*, %struct.Matrix** %matrix.addr, align 8
  %5 = bitcast %struct.Matrix* %4 to i8*
  call void @free(i8* %5) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @printf_Matrix(%struct.Matrix* %matrix) #0 {
entry:
  %matrix.addr = alloca %struct.Matrix*, align 8
  store %struct.Matrix* %matrix, %struct.Matrix** %matrix.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20, i32 0, i32 0))
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i32 0, i32 0))
  %0 = load %struct.Matrix*, %struct.Matrix** %matrix.addr, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %0, i32 0, i32 0
  %1 = load i64**, i64*** %data, align 8
  %2 = load %struct.Matrix*, %struct.Matrix** %matrix.addr, align 8
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %2, i32 0, i32 1
  %3 = load i64, i64* %data_size, align 8
  %4 = load %struct.Matrix*, %struct.Matrix** %matrix.addr, align 8
  %data_size_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %4, i32 0, i32 2
  %5 = load i64, i64* %data_size_size, align 8
  call void @printf2DArray(i64** %1, i64 %3, i64 %5)
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.22, i32 0, i32 0))
  %6 = load %struct.Matrix*, %struct.Matrix** %matrix.addr, align 8
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %6, i32 0, i32 3
  %7 = load i64, i64* %width, align 8
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), i64 %7)
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.24, i32 0, i32 0))
  %8 = load %struct.Matrix*, %struct.Matrix** %matrix.addr, align 8
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %8, i32 0, i32 4
  %9 = load i64, i64* %height, align 8
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), i64 %9)
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.25, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.Matrix* @matrix(i64 %width, i64 %height, i64** %data, i64 %data_size, i64 %data_size_size) #0 {
entry:
  %width.addr = alloca i64, align 8
  %height.addr = alloca i64, align 8
  %data.addr = alloca i64**, align 8
  %data_size.addr = alloca i64, align 8
  %data_size_size.addr = alloca i64, align 8
  %r = alloca %struct.Matrix*, align 8
  %_4 = alloca %struct.Matrix*, align 8
  store i64 %width, i64* %width.addr, align 8
  store i64 %height, i64* %height.addr, align 8
  store i64** %data, i64*** %data.addr, align 8
  store i64 %data_size, i64* %data_size.addr, align 8
  store i64 %data_size_size, i64* %data_size_size.addr, align 8
  %call = call noalias i8* @malloc(i64 40) #6
  %0 = bitcast i8* %call to %struct.Matrix*
  store %struct.Matrix* %0, %struct.Matrix** %_4, align 8
  %1 = load i64, i64* %data_size.addr, align 8
  %2 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  %data_size1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %2, i32 0, i32 1
  store i64 %1, i64* %data_size1, align 8
  %3 = load i64, i64* %data_size_size.addr, align 8
  %4 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  %data_size_size2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %4, i32 0, i32 2
  store i64 %3, i64* %data_size_size2, align 8
  %5 = load i64**, i64*** %data.addr, align 8
  %6 = load i64, i64* %data_size.addr, align 8
  %7 = load i64, i64* %data_size_size.addr, align 8
  %call3 = call i64** @copy2DArray(i64** %5, i64 %6, i64 %7)
  %8 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  %data4 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %8, i32 0, i32 0
  store i64** %call3, i64*** %data4, align 8
  %9 = load i64, i64* %height.addr, align 8
  %10 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  %height5 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %10, i32 0, i32 4
  store i64 %9, i64* %height5, align 8
  %11 = load i64, i64* %width.addr, align 8
  %12 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  %width6 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %12, i32 0, i32 3
  store i64 %11, i64* %width6, align 8
  %13 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  ret %struct.Matrix* %13
}

; Function Attrs: nounwind uwtable
define %struct.Matrix* @multiply(%struct.Matrix* %A, %struct.Matrix* %B) #0 {
entry:
  %A.addr = alloca %struct.Matrix*, align 8
  %B.addr = alloca %struct.Matrix*, align 8
  %C = alloca %struct.Matrix*, align 8
  %C_data = alloca i64**, align 8
  %C_data_size = alloca i64, align 8
  %C_data_size_size = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %r = alloca i64, align 8
  %k = alloca i64, align 8
  %_8 = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64*, align 8
  %_10_size = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64**, align 8
  %_12_size = alloca i64, align 8
  %_12_size_size = alloca i64, align 8
  %_13 = alloca i64, align 8
  %_14 = alloca i64, align 8
  %_15 = alloca i64, align 8
  %_16 = alloca i64, align 8
  %_17 = alloca i64, align 8
  %_18 = alloca i64, align 8
  %_19 = alloca i64, align 8
  %_20 = alloca i64**, align 8
  %_20_size = alloca i64, align 8
  %_20_size_size = alloca i64, align 8
  %_21 = alloca i64*, align 8
  %_21_size = alloca i64, align 8
  %_22 = alloca i64, align 8
  %_23 = alloca i64**, align 8
  %_23_size = alloca i64, align 8
  %_23_size_size = alloca i64, align 8
  %_24 = alloca i64*, align 8
  %_24_size = alloca i64, align 8
  %_25 = alloca i64, align 8
  %_26 = alloca i64, align 8
  %_27 = alloca i64, align 8
  %_28 = alloca i64, align 8
  %_29 = alloca i64, align 8
  %_30 = alloca i64, align 8
  %_31 = alloca i64, align 8
  %_32 = alloca i64, align 8
  %_33 = alloca i64, align 8
  %_34 = alloca %struct.Matrix*, align 8
  %_35 = alloca i64, align 8
  %_36 = alloca i64, align 8
  store %struct.Matrix* %A, %struct.Matrix** %A.addr, align 8
  store %struct.Matrix* %B, %struct.Matrix** %B.addr, align 8
  store i64** null, i64*** %C_data, align 8
  store i64 0, i64* %C_data_size, align 8
  store i64 0, i64* %C_data_size_size, align 8
  store i64 0, i64* %i, align 8
  store i64 0, i64* %j, align 8
  store i64 0, i64* %r, align 8
  store i64 0, i64* %k, align 8
  store i64 0, i64* %_8, align 8
  store i64 0, i64* %_9, align 8
  store i64* null, i64** %_10, align 8
  store i64 0, i64* %_10_size, align 8
  store i64 0, i64* %_11, align 8
  store i64** null, i64*** %_12, align 8
  store i64 0, i64* %_12_size, align 8
  store i64 0, i64* %_12_size_size, align 8
  store i64 0, i64* %_13, align 8
  store i64 0, i64* %_14, align 8
  store i64 0, i64* %_15, align 8
  store i64 0, i64* %_16, align 8
  store i64 0, i64* %_17, align 8
  store i64 0, i64* %_18, align 8
  store i64 0, i64* %_19, align 8
  store i64** null, i64*** %_20, align 8
  store i64 0, i64* %_20_size, align 8
  store i64 0, i64* %_20_size_size, align 8
  store i64* null, i64** %_21, align 8
  store i64 0, i64* %_21_size, align 8
  store i64 0, i64* %_22, align 8
  store i64** null, i64*** %_23, align 8
  store i64 0, i64* %_23_size, align 8
  store i64 0, i64* %_23_size_size, align 8
  store i64* null, i64** %_24, align 8
  store i64 0, i64* %_24_size, align 8
  store i64 0, i64* %_25, align 8
  store i64 0, i64* %_26, align 8
  store i64 0, i64* %_27, align 8
  store i64 0, i64* %_28, align 8
  store i64 0, i64* %_29, align 8
  store i64 0, i64* %_30, align 8
  store i64 0, i64* %_31, align 8
  store i64 0, i64* %_32, align 8
  store i64 0, i64* %_33, align 8
  store i64 0, i64* %_35, align 8
  store i64 0, i64* %_36, align 8
  store i64 0, i64* %_8, align 8
  %0 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %0, i32 0, i32 3
  %1 = load i64, i64* %width, align 8
  store i64 %1, i64* %_9, align 8
  %2 = load i64, i64* %_9, align 8
  store i64 %2, i64* %_10_size, align 8
  %3 = load i64, i64* %_8, align 8
  %conv = trunc i64 %3 to i32
  %4 = load i64, i64* %_10_size, align 8
  %conv1 = trunc i64 %4 to i32
  %call = call i64* @gen1DArray(i32 %conv, i32 %conv1)
  store i64* %call, i64** %_10, align 8
  %5 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %5, i32 0, i32 4
  %6 = load i64, i64* %height, align 8
  store i64 %6, i64* %_11, align 8
  %7 = load i64, i64* %_11, align 8
  store i64 %7, i64* %_12_size, align 8
  %8 = load i64, i64* %_10_size, align 8
  store i64 %8, i64* %_12_size_size, align 8
  %9 = load i64*, i64** %_10, align 8
  %10 = load i64, i64* %_12_size, align 8
  %11 = load i64, i64* %_12_size_size, align 8
  %call2 = call i64** @gen2DArray(i64* %9, i64 %10, i64 %11)
  store i64** %call2, i64*** %_12, align 8
  %12 = load i64, i64* %_12_size, align 8
  store i64 %12, i64* %C_data_size, align 8
  %13 = load i64, i64* %_12_size_size, align 8
  store i64 %13, i64* %C_data_size_size, align 8
  %14 = load i64**, i64*** %_12, align 8
  %15 = load i64, i64* %_12_size, align 8
  %16 = load i64, i64* %_12_size_size, align 8
  %call3 = call i64** @copy2DArray(i64** %14, i64 %15, i64 %16)
  store i64** %call3, i64*** %C_data, align 8
  store i64 0, i64* %_13, align 8
  %17 = load i64, i64* %_13, align 8
  store i64 %17, i64* %i, align 8
  br label %while.body

while.body:                                       ; preds = %entry, %blklab14
  %18 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %height4 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %18, i32 0, i32 4
  %19 = load i64, i64* %height4, align 8
  store i64 %19, i64* %_14, align 8
  %20 = load i64, i64* %i, align 8
  %21 = load i64, i64* %_14, align 8
  %cmp = icmp sge i64 %20, %21
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %blklab13

if.end:                                           ; preds = %while.body
  store i64 0, i64* %_15, align 8
  %22 = load i64, i64* %_15, align 8
  store i64 %22, i64* %j, align 8
  br label %while.body7

while.body7:                                      ; preds = %if.end, %blklab16
  %23 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %width8 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %23, i32 0, i32 3
  %24 = load i64, i64* %width8, align 8
  store i64 %24, i64* %_16, align 8
  %25 = load i64, i64* %j, align 8
  %26 = load i64, i64* %_16, align 8
  %cmp9 = icmp sge i64 %25, %26
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %while.body7
  br label %blklab15

if.end12:                                         ; preds = %while.body7
  store i64 0, i64* %_17, align 8
  %27 = load i64, i64* %_17, align 8
  store i64 %27, i64* %r, align 8
  store i64 0, i64* %_18, align 8
  %28 = load i64, i64* %_18, align 8
  store i64 %28, i64* %k, align 8
  br label %while.body14

while.body14:                                     ; preds = %if.end12, %blklab18
  %29 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %width15 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %29, i32 0, i32 3
  %30 = load i64, i64* %width15, align 8
  store i64 %30, i64* %_19, align 8
  %31 = load i64, i64* %k, align 8
  %32 = load i64, i64* %_19, align 8
  %cmp16 = icmp sge i64 %31, %32
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %while.body14
  br label %blklab17

if.end19:                                         ; preds = %while.body14
  %33 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %33, i32 0, i32 1
  %34 = load i64, i64* %data_size, align 8
  store i64 %34, i64* %_20_size, align 8
  %35 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %35, i32 0, i32 2
  %36 = load i64, i64* %data_size_size, align 8
  store i64 %36, i64* %_20_size_size, align 8
  %37 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %37, i32 0, i32 0
  %38 = load i64**, i64*** %data, align 8
  %39 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size20 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %39, i32 0, i32 1
  %40 = load i64, i64* %data_size20, align 8
  %41 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size_size21 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %41, i32 0, i32 2
  %42 = load i64, i64* %data_size_size21, align 8
  %call22 = call i64** @copy2DArray(i64** %38, i64 %40, i64 %42)
  store i64** %call22, i64*** %_20, align 8
  %43 = load i64, i64* %i, align 8
  %44 = load i64**, i64*** %_20, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %44, i64 %43
  %45 = load i64*, i64** %arrayidx, align 8
  store i64* %45, i64** %_21, align 8
  %46 = load i64, i64* %k, align 8
  %47 = load i64*, i64** %_21, align 8
  %arrayidx23 = getelementptr inbounds i64, i64* %47, i64 %46
  %48 = load i64, i64* %arrayidx23, align 8
  store i64 %48, i64* %_22, align 8
  %49 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data_size24 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %49, i32 0, i32 1
  %50 = load i64, i64* %data_size24, align 8
  store i64 %50, i64* %_23_size, align 8
  %51 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data_size_size25 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %51, i32 0, i32 2
  %52 = load i64, i64* %data_size_size25, align 8
  store i64 %52, i64* %_23_size_size, align 8
  %53 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %53, i32 0, i32 0
  %54 = load i64**, i64*** %data26, align 8
  %55 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data_size27 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %55, i32 0, i32 1
  %56 = load i64, i64* %data_size27, align 8
  %57 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data_size_size28 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %57, i32 0, i32 2
  %58 = load i64, i64* %data_size_size28, align 8
  %call29 = call i64** @copy2DArray(i64** %54, i64 %56, i64 %58)
  store i64** %call29, i64*** %_23, align 8
  %59 = load i64, i64* %k, align 8
  %60 = load i64**, i64*** %_23, align 8
  %arrayidx30 = getelementptr inbounds i64*, i64** %60, i64 %59
  %61 = load i64*, i64** %arrayidx30, align 8
  store i64* %61, i64** %_24, align 8
  %62 = load i64, i64* %j, align 8
  %63 = load i64*, i64** %_24, align 8
  %arrayidx31 = getelementptr inbounds i64, i64* %63, i64 %62
  %64 = load i64, i64* %arrayidx31, align 8
  store i64 %64, i64* %_25, align 8
  %65 = load i64, i64* %_22, align 8
  %66 = load i64, i64* %_25, align 8
  %mul = mul nsw i64 %65, %66
  store i64 %mul, i64* %_26, align 8
  %67 = load i64, i64* %r, align 8
  %68 = load i64, i64* %_26, align 8
  %add = add nsw i64 %67, %68
  store i64 %add, i64* %_27, align 8
  %69 = load i64, i64* %_27, align 8
  store i64 %69, i64* %r, align 8
  store i64 1, i64* %_28, align 8
  %70 = load i64, i64* %k, align 8
  %71 = load i64, i64* %_28, align 8
  %add32 = add nsw i64 %70, %71
  store i64 %add32, i64* %_29, align 8
  %72 = load i64, i64* %_29, align 8
  store i64 %72, i64* %k, align 8
  br label %blklab18

blklab18:                                         ; preds = %if.end19
  br label %while.body14

blklab17:                                         ; preds = %if.then18
  %73 = load i64, i64* %r, align 8
  %74 = load i64, i64* %j, align 8
  %75 = load i64, i64* %i, align 8
  %76 = load i64**, i64*** %C_data, align 8
  %arrayidx33 = getelementptr inbounds i64*, i64** %76, i64 %75
  %77 = load i64*, i64** %arrayidx33, align 8
  %arrayidx34 = getelementptr inbounds i64, i64* %77, i64 %74
  store i64 %73, i64* %arrayidx34, align 8
  store i64 1, i64* %_30, align 8
  %78 = load i64, i64* %j, align 8
  %79 = load i64, i64* %_30, align 8
  %add35 = add nsw i64 %78, %79
  store i64 %add35, i64* %_31, align 8
  %80 = load i64, i64* %_31, align 8
  store i64 %80, i64* %j, align 8
  br label %blklab16

blklab16:                                         ; preds = %blklab17
  br label %while.body7

blklab15:                                         ; preds = %if.then11
  store i64 1, i64* %_32, align 8
  %81 = load i64, i64* %i, align 8
  %82 = load i64, i64* %_32, align 8
  %add36 = add nsw i64 %81, %82
  store i64 %add36, i64* %_33, align 8
  %83 = load i64, i64* %_33, align 8
  store i64 %83, i64* %i, align 8
  br label %blklab14

blklab14:                                         ; preds = %blklab15
  br label %while.body

blklab13:                                         ; preds = %if.then
  %84 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %width37 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %84, i32 0, i32 3
  %85 = load i64, i64* %width37, align 8
  store i64 %85, i64* %_35, align 8
  %86 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %height38 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %86, i32 0, i32 4
  %87 = load i64, i64* %height38, align 8
  store i64 %87, i64* %_36, align 8
  %88 = load i64, i64* %_35, align 8
  %89 = load i64, i64* %_36, align 8
  %90 = load i64**, i64*** %C_data, align 8
  %91 = load i64, i64* %C_data_size, align 8
  %92 = load i64, i64* %C_data_size_size, align 8
  %call39 = call i64** @copy2DArray(i64** %90, i64 %91, i64 %92)
  %93 = load i64, i64* %C_data_size, align 8
  %94 = load i64, i64* %C_data_size_size, align 8
  %call40 = call %struct.Matrix* @matrix(i64 %88, i64 %89, i64** %call39, i64 %93, i64 %94)
  store %struct.Matrix* %call40, %struct.Matrix** %_34, align 8
  %95 = load %struct.Matrix*, %struct.Matrix** %_34, align 8
  ret %struct.Matrix* %95
}

; Function Attrs: nounwind uwtable
define void @printMat(%struct._IO_FILE* %sys, %struct.Matrix* %A) #0 {
entry:
  %sys.addr = alloca %struct._IO_FILE*, align 8
  %A.addr = alloca %struct.Matrix*, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %_4 = alloca i64, align 8
  %_5 = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i8*, align 8
  %_10 = alloca i64**, align 8
  %_10_size = alloca i64, align 8
  %_10_size_size = alloca i64, align 8
  %_11 = alloca i64*, align 8
  %_11_size = alloca i64, align 8
  %_12 = alloca i64, align 8
  %_13 = alloca i8*, align 8
  %_15 = alloca i64*, align 8
  %_15_size = alloca i64, align 8
  %_16 = alloca i64, align 8
  %_17 = alloca i64, align 8
  %_18 = alloca i64, align 8
  %_19 = alloca i64, align 8
  %_20 = alloca i8*, align 8
  %_22 = alloca i64*, align 8
  %_22_size = alloca i64, align 8
  store %struct._IO_FILE* %sys, %struct._IO_FILE** %sys.addr, align 8
  store %struct.Matrix* %A, %struct.Matrix** %A.addr, align 8
  store i64 0, i64* %i, align 8
  store i64 0, i64* %j, align 8
  store i64 0, i64* %_4, align 8
  store i64 0, i64* %_5, align 8
  store i64 0, i64* %_6, align 8
  store i64 0, i64* %_7, align 8
  store i64** null, i64*** %_10, align 8
  store i64 0, i64* %_10_size, align 8
  store i64 0, i64* %_10_size_size, align 8
  store i64* null, i64** %_11, align 8
  store i64 0, i64* %_11_size, align 8
  store i64 0, i64* %_12, align 8
  store i64* null, i64** %_15, align 8
  store i64 0, i64* %_15_size, align 8
  store i64 0, i64* %_16, align 8
  store i64 0, i64* %_17, align 8
  store i64 0, i64* %_18, align 8
  store i64 0, i64* %_19, align 8
  store i64* null, i64** %_22, align 8
  store i64 0, i64* %_22_size, align 8
  store i64 0, i64* %_4, align 8
  %0 = load i64, i64* %_4, align 8
  store i64 %0, i64* %i, align 8
  br label %while.body

while.body:                                       ; preds = %entry, %blklab20
  %1 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i32 0, i32 4
  %2 = load i64, i64* %height, align 8
  store i64 %2, i64* %_5, align 8
  %3 = load i64, i64* %i, align 8
  %4 = load i64, i64* %_5, align 8
  %cmp = icmp sge i64 %3, %4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %blklab19

if.end:                                           ; preds = %while.body
  store i64 0, i64* %_6, align 8
  %5 = load i64, i64* %_6, align 8
  store i64 %5, i64* %j, align 8
  br label %while.body2

while.body2:                                      ; preds = %if.end, %blklab22
  %6 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %6, i32 0, i32 3
  %7 = load i64, i64* %width, align 8
  store i64 %7, i64* %_7, align 8
  %8 = load i64, i64* %j, align 8
  %9 = load i64, i64* %_7, align 8
  %cmp3 = icmp sge i64 %8, %9
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %while.body2
  br label %blklab21

if.end5:                                          ; preds = %while.body2
  %10 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %10, i32 0, i32 1
  %11 = load i64, i64* %data_size, align 8
  store i64 %11, i64* %_10_size, align 8
  %12 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %12, i32 0, i32 2
  %13 = load i64, i64* %data_size_size, align 8
  store i64 %13, i64* %_10_size_size, align 8
  %14 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %14, i32 0, i32 0
  %15 = load i64**, i64*** %data, align 8
  %16 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size6 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %16, i32 0, i32 1
  %17 = load i64, i64* %data_size6, align 8
  %18 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size_size7 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %18, i32 0, i32 2
  %19 = load i64, i64* %data_size_size7, align 8
  %call = call i64** @copy2DArray(i64** %15, i64 %17, i64 %19)
  store i64** %call, i64*** %_10, align 8
  %20 = load i64, i64* %i, align 8
  %21 = load i64**, i64*** %_10, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %21, i64 %20
  %22 = load i64*, i64** %arrayidx, align 8
  store i64* %22, i64** %_11, align 8
  %23 = load i64, i64* %j, align 8
  %24 = load i64*, i64** %_11, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %24, i64 %23
  %25 = load i64, i64* %arrayidx8, align 8
  store i64 %25, i64* %_12, align 8
  %26 = load i64, i64* %_12, align 8
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.26, i32 0, i32 0), i64 %26)
  store i64 1, i64* %_15_size, align 8
  %call10 = call noalias i8* @malloc(i64 8) #6
  %27 = bitcast i8* %call10 to i64*
  store i64* %27, i64** %_15, align 8
  %28 = load i64*, i64** %_15, align 8
  %arrayidx11 = getelementptr inbounds i64, i64* %28, i64 0
  store i64 32, i64* %arrayidx11, align 8
  %29 = load i64*, i64** %_15, align 8
  %30 = load i64, i64* %_15_size, align 8
  call void @printf_s(i64* %29, i64 %30)
  store i64 1, i64* %_16, align 8
  %31 = load i64, i64* %j, align 8
  %32 = load i64, i64* %_16, align 8
  %add = add nsw i64 %31, %32
  store i64 %add, i64* %_17, align 8
  %33 = load i64, i64* %_17, align 8
  store i64 %33, i64* %j, align 8
  br label %blklab22

blklab22:                                         ; preds = %if.end5
  br label %while.body2

blklab21:                                         ; preds = %if.then4
  store i64 1, i64* %_18, align 8
  %34 = load i64, i64* %i, align 8
  %35 = load i64, i64* %_18, align 8
  %add12 = add nsw i64 %34, %35
  store i64 %add12, i64* %_19, align 8
  %36 = load i64, i64* %_19, align 8
  store i64 %36, i64* %i, align 8
  store i64 0, i64* %_22_size, align 8
  %call13 = call noalias i8* @malloc(i64 0) #6
  %37 = bitcast i8* %call13 to i64*
  store i64* %37, i64** %_22, align 8
  %38 = load i64*, i64** %_22, align 8
  %39 = load i64, i64* %_22_size, align 8
  call void @println_s(i64* %38, i64 %39)
  br label %blklab20

blklab20:                                         ; preds = %blklab21
  br label %while.body

blklab19:                                         ; preds = %if.then
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.Matrix* @genMatrix(i64 %height, i64 %width) #0 {
entry:
  %height.addr = alloca i64, align 8
  %width.addr = alloca i64, align 8
  %r = alloca %struct.Matrix*, align 8
  %rows = alloca i64**, align 8
  %rows_size = alloca i64, align 8
  %rows_size_size = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64*, align 8
  %_7_size = alloca i64, align 8
  %_8 = alloca i64**, align 8
  %_8_size = alloca i64, align 8
  %_8_size_size = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64, align 8
  %_13 = alloca i64, align 8
  %_14 = alloca i64, align 8
  %_15 = alloca i64, align 8
  %_16 = alloca %struct.Matrix*, align 8
  store i64 %height, i64* %height.addr, align 8
  store i64 %width, i64* %width.addr, align 8
  store i64** null, i64*** %rows, align 8
  store i64 0, i64* %rows_size, align 8
  store i64 0, i64* %rows_size_size, align 8
  store i64 0, i64* %i, align 8
  store i64 0, i64* %j, align 8
  store i64 0, i64* %_6, align 8
  store i64* null, i64** %_7, align 8
  store i64 0, i64* %_7_size, align 8
  store i64** null, i64*** %_8, align 8
  store i64 0, i64* %_8_size, align 8
  store i64 0, i64* %_8_size_size, align 8
  store i64 0, i64* %_9, align 8
  store i64 0, i64* %_10, align 8
  store i64 0, i64* %_11, align 8
  store i64 0, i64* %_12, align 8
  store i64 0, i64* %_13, align 8
  store i64 0, i64* %_14, align 8
  store i64 0, i64* %_15, align 8
  store i64 0, i64* %_6, align 8
  %0 = load i64, i64* %width.addr, align 8
  store i64 %0, i64* %_7_size, align 8
  %1 = load i64, i64* %_6, align 8
  %conv = trunc i64 %1 to i32
  %2 = load i64, i64* %_7_size, align 8
  %conv1 = trunc i64 %2 to i32
  %call = call i64* @gen1DArray(i32 %conv, i32 %conv1)
  store i64* %call, i64** %_7, align 8
  %3 = load i64, i64* %height.addr, align 8
  store i64 %3, i64* %_8_size, align 8
  %4 = load i64, i64* %_7_size, align 8
  store i64 %4, i64* %_8_size_size, align 8
  %5 = load i64*, i64** %_7, align 8
  %6 = load i64, i64* %_8_size, align 8
  %7 = load i64, i64* %_8_size_size, align 8
  %call2 = call i64** @gen2DArray(i64* %5, i64 %6, i64 %7)
  store i64** %call2, i64*** %_8, align 8
  %8 = load i64, i64* %_8_size, align 8
  store i64 %8, i64* %rows_size, align 8
  %9 = load i64, i64* %_8_size_size, align 8
  store i64 %9, i64* %rows_size_size, align 8
  %10 = load i64**, i64*** %_8, align 8
  %11 = load i64, i64* %_8_size, align 8
  %12 = load i64, i64* %_8_size_size, align 8
  %call3 = call i64** @copy2DArray(i64** %10, i64 %11, i64 %12)
  store i64** %call3, i64*** %rows, align 8
  store i64 0, i64* %_9, align 8
  %13 = load i64, i64* %_9, align 8
  store i64 %13, i64* %i, align 8
  br label %while.body

while.body:                                       ; preds = %entry, %blklab24
  %14 = load i64, i64* %i, align 8
  %15 = load i64, i64* %height.addr, align 8
  %cmp = icmp sge i64 %14, %15
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %blklab23

if.end:                                           ; preds = %while.body
  store i64 0, i64* %_10, align 8
  %16 = load i64, i64* %_10, align 8
  store i64 %16, i64* %j, align 8
  br label %while.body6

while.body6:                                      ; preds = %if.end, %blklab26
  %17 = load i64, i64* %j, align 8
  %18 = load i64, i64* %width.addr, align 8
  %cmp7 = icmp sge i64 %17, %18
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %while.body6
  br label %blklab25

if.end10:                                         ; preds = %while.body6
  store i64 1, i64* %_11, align 8
  %19 = load i64, i64* %_11, align 8
  %20 = load i64, i64* %j, align 8
  %21 = load i64, i64* %i, align 8
  %22 = load i64**, i64*** %rows, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %22, i64 %21
  %23 = load i64*, i64** %arrayidx, align 8
  %arrayidx11 = getelementptr inbounds i64, i64* %23, i64 %20
  store i64 %19, i64* %arrayidx11, align 8
  store i64 1, i64* %_12, align 8
  %24 = load i64, i64* %j, align 8
  %25 = load i64, i64* %_12, align 8
  %add = add nsw i64 %24, %25
  store i64 %add, i64* %_13, align 8
  %26 = load i64, i64* %_13, align 8
  store i64 %26, i64* %j, align 8
  br label %blklab26

blklab26:                                         ; preds = %if.end10
  br label %while.body6

blklab25:                                         ; preds = %if.then9
  store i64 1, i64* %_14, align 8
  %27 = load i64, i64* %i, align 8
  %28 = load i64, i64* %_14, align 8
  %add12 = add nsw i64 %27, %28
  store i64 %add12, i64* %_15, align 8
  %29 = load i64, i64* %_15, align 8
  store i64 %29, i64* %i, align 8
  br label %blklab24

blklab24:                                         ; preds = %blklab25
  br label %while.body

blklab23:                                         ; preds = %if.then
  %30 = load i64, i64* %width.addr, align 8
  %31 = load i64, i64* %height.addr, align 8
  %32 = load i64**, i64*** %rows, align 8
  %33 = load i64, i64* %rows_size, align 8
  %34 = load i64, i64* %rows_size_size, align 8
  %call13 = call i64** @copy2DArray(i64** %32, i64 %33, i64 %34)
  %35 = load i64, i64* %rows_size, align 8
  %36 = load i64, i64* %rows_size_size, align 8
  %call14 = call %struct.Matrix* @matrix(i64 %30, i64 %31, i64** %call13, i64 %35, i64 %36)
  store %struct.Matrix* %call14, %struct.Matrix** %_16, align 8
  %37 = load %struct.Matrix*, %struct.Matrix** %_16, align 8
  ret %struct.Matrix* %37
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %max = alloca i64, align 8
  %A = alloca %struct.Matrix*, align 8
  %B = alloca %struct.Matrix*, align 8
  %C = alloca %struct.Matrix*, align 8
  %_5 = alloca i64, align 8
  %_6 = alloca i64**, align 8
  %_6_size = alloca i64, align 8
  %_6_size_size = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64*, align 8
  %_8_size = alloca i64, align 8
  %_9 = alloca %struct.Matrix*, align 8
  %_10 = alloca %struct.Matrix*, align 8
  %_11 = alloca %struct.Matrix*, align 8
  %_12 = alloca i64**, align 8
  %_12_size = alloca i64, align 8
  %_12_size_size = alloca i64, align 8
  %_13 = alloca i64, align 8
  %_14 = alloca i64*, align 8
  %_14_size = alloca i64, align 8
  %_15 = alloca i64, align 8
  %_16 = alloca i64, align 8
  %_17 = alloca i64, align 8
  %_18 = alloca i64, align 8
  %_19 = alloca i8*, align 8
  %_21 = alloca i64*, align 8
  %_21_size = alloca i64, align 8
  %_22 = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  store i64** null, i64*** %_6, align 8
  store i64 0, i64* %_6_size, align 8
  store i64 0, i64* %_6_size_size, align 8
  store i64 0, i64* %_7, align 8
  store i64* null, i64** %_8, align 8
  store i64 0, i64* %_8_size, align 8
  store i64** null, i64*** %_12, align 8
  store i64 0, i64* %_12_size, align 8
  store i64 0, i64* %_12_size_size, align 8
  store i64 0, i64* %_13, align 8
  store i64* null, i64** %_14, align 8
  store i64 0, i64* %_14_size, align 8
  store i64 0, i64* %_15, align 8
  store i64 0, i64* %_16, align 8
  store i64 0, i64* %_17, align 8
  store i64 0, i64* %_18, align 8
  store i64* null, i64** %_21, align 8
  store i64 0, i64* %_21_size, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %1 = load i8**, i8*** %args.addr, align 8
  %call = call i64** @convertArgsToIntArray(i32 %0, i8** %1)
  store i64** %call, i64*** %_6, align 8
  %2 = load i32, i32* %argc.addr, align 4
  %sub = sub nsw i32 %2, 1
  %conv = sext i32 %sub to i64
  store i64 %conv, i64* %_6_size, align 8
  store i64 0, i64* %_7, align 8
  %3 = load i64, i64* %_7, align 8
  %4 = load i64**, i64*** %_6, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %4, i64 %3
  %5 = load i64*, i64** %arrayidx, align 8
  store i64* %5, i64** %_8, align 8
  %6 = load i64*, i64** %_8, align 8
  %call1 = call i64 @parseStringToInt(i64* %6)
  store i64 %call1, i64* %_5, align 8
  %7 = load i64, i64* %_5, align 8
  store i64 %7, i64* %max, align 8
  %8 = load i64, i64* %max, align 8
  %9 = inttoptr i64 %8 to i8*
  %cmp = icmp eq i8* %9, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %blklab27

if.end:                                           ; preds = %entry
  %10 = load i64, i64* %max, align 8
  %11 = load i64, i64* %max, align 8
  %call3 = call %struct.Matrix* @genMatrix(i64 %10, i64 %11)
  store %struct.Matrix* %call3, %struct.Matrix** %_9, align 8
  %12 = load %struct.Matrix*, %struct.Matrix** %_9, align 8
  %call4 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %12)
  store %struct.Matrix* %call4, %struct.Matrix** %A, align 8
  %13 = load i64, i64* %max, align 8
  %14 = load i64, i64* %max, align 8
  %call5 = call %struct.Matrix* @genMatrix(i64 %13, i64 %14)
  store %struct.Matrix* %call5, %struct.Matrix** %_10, align 8
  %15 = load %struct.Matrix*, %struct.Matrix** %_10, align 8
  %call6 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %15)
  store %struct.Matrix* %call6, %struct.Matrix** %B, align 8
  %16 = load %struct.Matrix*, %struct.Matrix** %A, align 8
  %call7 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %16)
  %17 = load %struct.Matrix*, %struct.Matrix** %B, align 8
  %call8 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %17)
  %call9 = call %struct.Matrix* @multiply(%struct.Matrix* %call7, %struct.Matrix* %call8)
  store %struct.Matrix* %call9, %struct.Matrix** %_11, align 8
  %18 = load %struct.Matrix*, %struct.Matrix** %_11, align 8
  %call10 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %18)
  store %struct.Matrix* %call10, %struct.Matrix** %C, align 8
  %19 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %19, i32 0, i32 1
  %20 = load i64, i64* %data_size, align 8
  store i64 %20, i64* %_12_size, align 8
  %21 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data_size_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %21, i32 0, i32 2
  %22 = load i64, i64* %data_size_size, align 8
  store i64 %22, i64* %_12_size_size, align 8
  %23 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %23, i32 0, i32 0
  %24 = load i64**, i64*** %data, align 8
  %25 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data_size11 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %25, i32 0, i32 1
  %26 = load i64, i64* %data_size11, align 8
  %27 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data_size_size12 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %27, i32 0, i32 2
  %28 = load i64, i64* %data_size_size12, align 8
  %call13 = call i64** @copy2DArray(i64** %24, i64 %26, i64 %28)
  store i64** %call13, i64*** %_12, align 8
  store i64 0, i64* %_13, align 8
  %29 = load i64, i64* %_13, align 8
  %30 = load i64**, i64*** %_12, align 8
  %arrayidx14 = getelementptr inbounds i64*, i64** %30, i64 %29
  %31 = load i64*, i64** %arrayidx14, align 8
  store i64* %31, i64** %_14, align 8
  store i64 0, i64* %_15, align 8
  %32 = load i64, i64* %_15, align 8
  %33 = load i64*, i64** %_14, align 8
  %arrayidx15 = getelementptr inbounds i64, i64* %33, i64 %32
  %34 = load i64, i64* %arrayidx15, align 8
  store i64 %34, i64* %_16, align 8
  %35 = load i64, i64* %_16, align 8
  %36 = load i64, i64* %max, align 8
  %cmp16 = icmp eq i64 %35, %36
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end
  br label %blklab28

if.end19:                                         ; preds = %if.end
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.27, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

blklab28:                                         ; preds = %if.then18
  %38 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %38, i32 0, i32 3
  %39 = load i64, i64* %width, align 8
  store i64 %39, i64* %_17, align 8
  %40 = load i64, i64* %_17, align 8
  %41 = load i64, i64* %max, align 8
  %cmp21 = icmp eq i64 %40, %41
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %blklab28
  br label %blklab29

if.end24:                                         ; preds = %blklab28
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.27, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

blklab29:                                         ; preds = %if.then23
  %43 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %43, i32 0, i32 4
  %44 = load i64, i64* %height, align 8
  store i64 %44, i64* %_18, align 8
  %45 = load i64, i64* %_18, align 8
  %46 = load i64, i64* %max, align 8
  %cmp26 = icmp eq i64 %45, %46
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %blklab29
  br label %blklab30

if.end29:                                         ; preds = %blklab29
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.27, i32 0, i32 0))
  call void @exit(i32 -1) #7
  unreachable

blklab30:                                         ; preds = %if.then28
  store i64 39, i64* %_21_size, align 8
  %call31 = call noalias i8* @malloc(i64 312) #6
  %48 = bitcast i8* %call31 to i64*
  store i64* %48, i64** %_21, align 8
  %49 = load i64*, i64** %_21, align 8
  %arrayidx32 = getelementptr inbounds i64, i64* %49, i64 0
  store i64 80, i64* %arrayidx32, align 8
  %50 = load i64*, i64** %_21, align 8
  %arrayidx33 = getelementptr inbounds i64, i64* %50, i64 1
  store i64 97, i64* %arrayidx33, align 8
  %51 = load i64*, i64** %_21, align 8
  %arrayidx34 = getelementptr inbounds i64, i64* %51, i64 2
  store i64 115, i64* %arrayidx34, align 8
  %52 = load i64*, i64** %_21, align 8
  %arrayidx35 = getelementptr inbounds i64, i64* %52, i64 3
  store i64 115, i64* %arrayidx35, align 8
  %53 = load i64*, i64** %_21, align 8
  %arrayidx36 = getelementptr inbounds i64, i64* %53, i64 4
  store i64 32, i64* %arrayidx36, align 8
  %54 = load i64*, i64** %_21, align 8
  %arrayidx37 = getelementptr inbounds i64, i64* %54, i64 5
  store i64 77, i64* %arrayidx37, align 8
  %55 = load i64*, i64** %_21, align 8
  %arrayidx38 = getelementptr inbounds i64, i64* %55, i64 6
  store i64 97, i64* %arrayidx38, align 8
  %56 = load i64*, i64** %_21, align 8
  %arrayidx39 = getelementptr inbounds i64, i64* %56, i64 7
  store i64 116, i64* %arrayidx39, align 8
  %57 = load i64*, i64** %_21, align 8
  %arrayidx40 = getelementptr inbounds i64, i64* %57, i64 8
  store i64 114, i64* %arrayidx40, align 8
  %58 = load i64*, i64** %_21, align 8
  %arrayidx41 = getelementptr inbounds i64, i64* %58, i64 9
  store i64 105, i64* %arrayidx41, align 8
  %59 = load i64*, i64** %_21, align 8
  %arrayidx42 = getelementptr inbounds i64, i64* %59, i64 10
  store i64 120, i64* %arrayidx42, align 8
  %60 = load i64*, i64** %_21, align 8
  %arrayidx43 = getelementptr inbounds i64, i64* %60, i64 11
  store i64 77, i64* %arrayidx43, align 8
  %61 = load i64*, i64** %_21, align 8
  %arrayidx44 = getelementptr inbounds i64, i64* %61, i64 12
  store i64 117, i64* %arrayidx44, align 8
  %62 = load i64*, i64** %_21, align 8
  %arrayidx45 = getelementptr inbounds i64, i64* %62, i64 13
  store i64 108, i64* %arrayidx45, align 8
  %63 = load i64*, i64** %_21, align 8
  %arrayidx46 = getelementptr inbounds i64, i64* %63, i64 14
  store i64 116, i64* %arrayidx46, align 8
  %64 = load i64*, i64** %_21, align 8
  %arrayidx47 = getelementptr inbounds i64, i64* %64, i64 15
  store i64 32, i64* %arrayidx47, align 8
  %65 = load i64*, i64** %_21, align 8
  %arrayidx48 = getelementptr inbounds i64, i64* %65, i64 16
  store i64 116, i64* %arrayidx48, align 8
  %66 = load i64*, i64** %_21, align 8
  %arrayidx49 = getelementptr inbounds i64, i64* %66, i64 17
  store i64 101, i64* %arrayidx49, align 8
  %67 = load i64*, i64** %_21, align 8
  %arrayidx50 = getelementptr inbounds i64, i64* %67, i64 18
  store i64 115, i64* %arrayidx50, align 8
  %68 = load i64*, i64** %_21, align 8
  %arrayidx51 = getelementptr inbounds i64, i64* %68, i64 19
  store i64 116, i64* %arrayidx51, align 8
  %69 = load i64*, i64** %_21, align 8
  %arrayidx52 = getelementptr inbounds i64, i64* %69, i64 20
  store i64 32, i64* %arrayidx52, align 8
  %70 = load i64*, i64** %_21, align 8
  %arrayidx53 = getelementptr inbounds i64, i64* %70, i64 21
  store i64 99, i64* %arrayidx53, align 8
  %71 = load i64*, i64** %_21, align 8
  %arrayidx54 = getelementptr inbounds i64, i64* %71, i64 22
  store i64 97, i64* %arrayidx54, align 8
  %72 = load i64*, i64** %_21, align 8
  %arrayidx55 = getelementptr inbounds i64, i64* %72, i64 23
  store i64 115, i64* %arrayidx55, align 8
  %73 = load i64*, i64** %_21, align 8
  %arrayidx56 = getelementptr inbounds i64, i64* %73, i64 24
  store i64 101, i64* %arrayidx56, align 8
  %74 = load i64*, i64** %_21, align 8
  %arrayidx57 = getelementptr inbounds i64, i64* %74, i64 25
  store i64 32, i64* %arrayidx57, align 8
  %75 = load i64*, i64** %_21, align 8
  %arrayidx58 = getelementptr inbounds i64, i64* %75, i64 26
  store i64 119, i64* %arrayidx58, align 8
  %76 = load i64*, i64** %_21, align 8
  %arrayidx59 = getelementptr inbounds i64, i64* %76, i64 27
  store i64 105, i64* %arrayidx59, align 8
  %77 = load i64*, i64** %_21, align 8
  %arrayidx60 = getelementptr inbounds i64, i64* %77, i64 28
  store i64 116, i64* %arrayidx60, align 8
  %78 = load i64*, i64** %_21, align 8
  %arrayidx61 = getelementptr inbounds i64, i64* %78, i64 29
  store i64 104, i64* %arrayidx61, align 8
  %79 = load i64*, i64** %_21, align 8
  %arrayidx62 = getelementptr inbounds i64, i64* %79, i64 30
  store i64 32, i64* %arrayidx62, align 8
  %80 = load i64*, i64** %_21, align 8
  %arrayidx63 = getelementptr inbounds i64, i64* %80, i64 31
  store i64 105, i64* %arrayidx63, align 8
  %81 = load i64*, i64** %_21, align 8
  %arrayidx64 = getelementptr inbounds i64, i64* %81, i64 32
  store i64 110, i64* %arrayidx64, align 8
  %82 = load i64*, i64** %_21, align 8
  %arrayidx65 = getelementptr inbounds i64, i64* %82, i64 33
  store i64 112, i64* %arrayidx65, align 8
  %83 = load i64*, i64** %_21, align 8
  %arrayidx66 = getelementptr inbounds i64, i64* %83, i64 34
  store i64 117, i64* %arrayidx66, align 8
  %84 = load i64*, i64** %_21, align 8
  %arrayidx67 = getelementptr inbounds i64, i64* %84, i64 35
  store i64 116, i64* %arrayidx67, align 8
  %85 = load i64*, i64** %_21, align 8
  %arrayidx68 = getelementptr inbounds i64, i64* %85, i64 36
  store i64 32, i64* %arrayidx68, align 8
  %86 = load i64*, i64** %_21, align 8
  %arrayidx69 = getelementptr inbounds i64, i64* %86, i64 37
  store i64 61, i64* %arrayidx69, align 8
  %87 = load i64*, i64** %_21, align 8
  %arrayidx70 = getelementptr inbounds i64, i64* %87, i64 38
  store i64 32, i64* %arrayidx70, align 8
  %88 = load i64*, i64** %_21, align 8
  %89 = load i64, i64* %_21_size, align 8
  call void @printf_s(i64* %88, i64 %89)
  %90 = load i64, i64* %max, align 8
  %call71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.26, i32 0, i32 0), i64 %90)
  br label %blklab27

blklab27:                                         ; preds = %blklab30, %if.then
  call void @exit(i32 0) #7
  unreachable

return:                                           ; No predecessors!
  %91 = load i32, i32* %retval, align 4
  ret i32 %91
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 1f64ddbc4c5d1036b68ec896765a7535537ded85) (http://llvm.org/git/llvm.git 99a07120d47e1881a14a7b36bf7cf6bbd54954af)"}
