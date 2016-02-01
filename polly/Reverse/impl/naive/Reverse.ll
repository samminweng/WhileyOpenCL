; ModuleID = 'Reverse.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @reverse(i64* %ls, i64 %ls_size) #0 {
entry:
  %ls.addr = alloca i64*, align 8
  %ls_size.addr = alloca i64, align 8
  %_1 = alloca i64*, align 8
  %_1_size = alloca i64, align 8
  %i = alloca i64, align 8
  %r = alloca i64*, align 8
  %r_size = alloca i64, align 8
  %item = alloca i64, align 8
  %_5 = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64*, align 8
  %_8_size = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64, align 8
  %_13 = alloca i64, align 8
  %_14 = alloca i64, align 8
  %_15 = alloca i64, align 8
  %_16 = alloca i64, align 8
  %_17 = alloca i64, align 8
  store i64* %ls, i64** %ls.addr, align 8
  store i64 %ls_size, i64* %ls_size.addr, align 8
  store i64* null, i64** %_1, align 8
  store i64 0, i64* %_1_size, align 8
  store i64 0, i64* %i, align 8
  store i64* null, i64** %r, align 8
  store i64 0, i64* %r_size, align 8
  store i64 0, i64* %item, align 8
  store i64 0, i64* %_5, align 8
  store i64 0, i64* %_6, align 8
  store i64 0, i64* %_7, align 8
  store i64* null, i64** %_8, align 8
  store i64 0, i64* %_8_size, align 8
  store i64 0, i64* %_9, align 8
  store i64 0, i64* %_10, align 8
  store i64 0, i64* %_11, align 8
  store i64 0, i64* %_12, align 8
  store i64 0, i64* %_13, align 8
  store i64 0, i64* %_14, align 8
  store i64 0, i64* %_15, align 8
  store i64 0, i64* %_16, align 8
  store i64 0, i64* %_17, align 8
  %0 = load i64, i64* %ls_size.addr, align 8
  store i64 %0, i64* %_5, align 8
  %1 = load i64, i64* %_5, align 8
  store i64 %1, i64* %i, align 8
  store i64 0, i64* %_6, align 8
  %2 = load i64, i64* %ls_size.addr, align 8
  store i64 %2, i64* %_7, align 8
  %3 = load i64, i64* %_7, align 8
  store i64 %3, i64* %_8_size, align 8
  %4 = load i64, i64* %_6, align 8
  %conv = trunc i64 %4 to i32
  %5 = load i64, i64* %_8_size, align 8
  %conv1 = trunc i64 %5 to i32
  %call = call i64* @gen1DArray(i32 %conv, i32 %conv1)
  store i64* %call, i64** %_8, align 8
  %6 = load i64, i64* %_8_size, align 8
  store i64 %6, i64* %r_size, align 8
  %7 = load i64*, i64** %_8, align 8
  %8 = load i64, i64* %_8_size, align 8
  %call2 = call i64* @copy(i64* %7, i64 %8)
  store i64* %call2, i64** %r, align 8
  br label %while.body

while.body:                                       ; preds = %entry, %blklab1
  %9 = load i64, i64* %ls_size.addr, align 8
  store i64 %9, i64* %_9, align 8
  %10 = load i64, i64* %i, align 8
  %11 = load i64, i64* %_9, align 8
  %cmp = icmp sgt i64 %10, %11
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %blklab3

if.end:                                           ; preds = %while.body
  %12 = load i64, i64* %r_size, align 8
  store i64 %12, i64* %_10, align 8
  %13 = load i64, i64* %ls_size.addr, align 8
  store i64 %13, i64* %_11, align 8
  %14 = load i64, i64* %_10, align 8
  %15 = load i64, i64* %_11, align 8
  %cmp4 = icmp eq i64 %14, %15
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  br label %blklab2

if.end7:                                          ; preds = %if.end
  br label %blklab3

blklab3:                                          ; preds = %if.end7, %if.then
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #4
  unreachable

blklab2:                                          ; preds = %if.then6
  store i64 0, i64* %_12, align 8
  %17 = load i64, i64* %i, align 8
  %18 = load i64, i64* %_12, align 8
  %cmp9 = icmp sle i64 %17, %18
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %blklab2
  br label %blklab0

if.end12:                                         ; preds = %blklab2
  %19 = load i64, i64* %ls_size.addr, align 8
  store i64 %19, i64* %_13, align 8
  %20 = load i64, i64* %_13, align 8
  %21 = load i64, i64* %i, align 8
  %sub = sub nsw i64 %20, %21
  store i64 %sub, i64* %_14, align 8
  %22 = load i64, i64* %_14, align 8
  %23 = load i64*, i64** %ls.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %23, i64 %22
  %24 = load i64, i64* %arrayidx, align 8
  store i64 %24, i64* %_15, align 8
  %25 = load i64, i64* %_15, align 8
  store i64 %25, i64* %item, align 8
  store i64 1, i64* %_16, align 8
  %26 = load i64, i64* %i, align 8
  %27 = load i64, i64* %_16, align 8
  %sub13 = sub nsw i64 %26, %27
  store i64 %sub13, i64* %_17, align 8
  %28 = load i64, i64* %_17, align 8
  store i64 %28, i64* %i, align 8
  %29 = load i64, i64* %item, align 8
  %30 = load i64, i64* %i, align 8
  %31 = load i64*, i64** %r, align 8
  %arrayidx14 = getelementptr inbounds i64, i64* %31, i64 %30
  store i64 %29, i64* %arrayidx14, align 8
  br label %blklab1

blklab1:                                          ; preds = %if.end12
  br label %while.body

blklab0:                                          ; preds = %if.then11
  %32 = load i64*, i64** %r, align 8
  ret i64* %32
}

declare i64* @gen1DArray(i32, i32) #1

declare i64* @copy(i64*, i64) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %max = alloca i64, align 8
  %index = alloca i64, align 8
  %arr = alloca i64*, align 8
  %arr_size = alloca i64, align 8
  %_4 = alloca i64, align 8
  %_5 = alloca i64**, align 8
  %_5_size = alloca i64, align 8
  %_5_size_size = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64*, align 8
  %_7_size = alloca i64, align 8
  %_8 = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64*, align 8
  %_12_size = alloca i64, align 8
  %_13 = alloca i64, align 8
  %_14 = alloca i64, align 8
  %_15 = alloca i64, align 8
  %_16 = alloca i64*, align 8
  %_16_size = alloca i64, align 8
  %_17 = alloca i64, align 8
  %_18 = alloca i64, align 8
  %_19 = alloca i64, align 8
  %_20 = alloca i64, align 8
  %_21 = alloca i8*, align 8
  %_23 = alloca i64*, align 8
  %_23_size = alloca i64, align 8
  %_24 = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  store i64 0, i64* %index, align 8
  store i64* null, i64** %arr, align 8
  store i64 0, i64* %arr_size, align 8
  store i64** null, i64*** %_5, align 8
  store i64 0, i64* %_5_size, align 8
  store i64 0, i64* %_5_size_size, align 8
  store i64 0, i64* %_6, align 8
  store i64* null, i64** %_7, align 8
  store i64 0, i64* %_7_size, align 8
  store i64 0, i64* %_8, align 8
  store i64 0, i64* %_9, align 8
  store i64 0, i64* %_10, align 8
  store i64 0, i64* %_11, align 8
  store i64* null, i64** %_12, align 8
  store i64 0, i64* %_12_size, align 8
  store i64 0, i64* %_13, align 8
  store i64 0, i64* %_14, align 8
  store i64 0, i64* %_15, align 8
  store i64* null, i64** %_16, align 8
  store i64 0, i64* %_16_size, align 8
  store i64 0, i64* %_17, align 8
  store i64 0, i64* %_18, align 8
  store i64 0, i64* %_19, align 8
  store i64 0, i64* %_20, align 8
  store i64* null, i64** %_23, align 8
  store i64 0, i64* %_23_size, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %1 = load i8**, i8*** %args.addr, align 8
  %call = call i64** @convertArgsToIntArray(i32 %0, i8** %1)
  store i64** %call, i64*** %_5, align 8
  %2 = load i32, i32* %argc.addr, align 4
  %sub = sub nsw i32 %2, 1
  %conv = sext i32 %sub to i64
  store i64 %conv, i64* %_5_size, align 8
  store i64 0, i64* %_6, align 8
  %3 = load i64, i64* %_6, align 8
  %4 = load i64**, i64*** %_5, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %4, i64 %3
  %5 = load i64*, i64** %arrayidx, align 8
  store i64* %5, i64** %_7, align 8
  %6 = load i64*, i64** %_7, align 8
  %call1 = call i64 @parseStringToInt(i64* %6)
  store i64 %call1, i64* %_4, align 8
  %7 = load i64, i64* %_4, align 8
  store i64 %7, i64* %max, align 8
  %8 = load i64, i64* %max, align 8
  %9 = inttoptr i64 %8 to i8*
  %cmp = icmp eq i8* %9, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %blklab4

if.end:                                           ; preds = %entry
  store i64 0, i64* %_8, align 8
  %10 = load i64, i64* %_8, align 8
  store i64 %10, i64* %index, align 8
  store i64 0, i64* %_9, align 8
  store i64 1, i64* %_10, align 8
  %11 = load i64, i64* %max, align 8
  %12 = load i64, i64* %_10, align 8
  %add = add nsw i64 %11, %12
  store i64 %add, i64* %_11, align 8
  %13 = load i64, i64* %_11, align 8
  store i64 %13, i64* %_12_size, align 8
  %14 = load i64, i64* %_9, align 8
  %conv3 = trunc i64 %14 to i32
  %15 = load i64, i64* %_12_size, align 8
  %conv4 = trunc i64 %15 to i32
  %call5 = call i64* @gen1DArray(i32 %conv3, i32 %conv4)
  store i64* %call5, i64** %_12, align 8
  %16 = load i64, i64* %_12_size, align 8
  store i64 %16, i64* %arr_size, align 8
  %17 = load i64*, i64** %_12, align 8
  %18 = load i64, i64* %_12_size, align 8
  %call6 = call i64* @copy(i64* %17, i64 %18)
  store i64* %call6, i64** %arr, align 8
  br label %while.body

while.body:                                       ; preds = %if.end, %blklab6
  %19 = load i64, i64* %index, align 8
  %20 = load i64, i64* %max, align 8
  %cmp7 = icmp sgt i64 %19, %20
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %while.body
  br label %blklab5

if.end10:                                         ; preds = %while.body
  %21 = load i64, i64* %max, align 8
  %22 = load i64, i64* %index, align 8
  %sub11 = sub nsw i64 %21, %22
  store i64 %sub11, i64* %_13, align 8
  %23 = load i64, i64* %_13, align 8
  %24 = load i64, i64* %index, align 8
  %25 = load i64*, i64** %arr, align 8
  %arrayidx12 = getelementptr inbounds i64, i64* %25, i64 %24
  store i64 %23, i64* %arrayidx12, align 8
  store i64 1, i64* %_14, align 8
  %26 = load i64, i64* %index, align 8
  %27 = load i64, i64* %_14, align 8
  %add13 = add nsw i64 %26, %27
  store i64 %add13, i64* %_15, align 8
  %28 = load i64, i64* %_15, align 8
  store i64 %28, i64* %index, align 8
  br label %blklab6

blklab6:                                          ; preds = %if.end10
  br label %while.body

blklab5:                                          ; preds = %if.then9
  %29 = load i64, i64* %arr_size, align 8
  store i64 %29, i64* %_16_size, align 8
  %30 = load i64*, i64** %arr, align 8
  %31 = load i64, i64* %arr_size, align 8
  %call14 = call i64* @copy(i64* %30, i64 %31)
  %32 = load i64, i64* %arr_size, align 8
  %call15 = call i64* @reverse(i64* %call14, i64 %32)
  store i64* %call15, i64** %_16, align 8
  %33 = load i64, i64* %_16_size, align 8
  store i64 %33, i64* %arr_size, align 8
  %34 = load i64*, i64** %_16, align 8
  %35 = load i64, i64* %_16_size, align 8
  %call16 = call i64* @copy(i64* %34, i64 %35)
  store i64* %call16, i64** %arr, align 8
  store i64 0, i64* %_17, align 8
  %36 = load i64, i64* %_17, align 8
  %37 = load i64*, i64** %arr, align 8
  %arrayidx17 = getelementptr inbounds i64, i64* %37, i64 %36
  %38 = load i64, i64* %arrayidx17, align 8
  store i64 %38, i64* %_18, align 8
  store i64 0, i64* %_19, align 8
  %39 = load i64, i64* %_18, align 8
  %40 = load i64, i64* %_19, align 8
  %cmp18 = icmp eq i64 %39, %40
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %blklab5
  br label %blklab7

if.end21:                                         ; preds = %blklab5
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #4
  unreachable

blklab7:                                          ; preds = %if.then20
  %42 = load i64, i64* %max, align 8
  %43 = load i64*, i64** %arr, align 8
  %arrayidx23 = getelementptr inbounds i64, i64* %43, i64 %42
  %44 = load i64, i64* %arrayidx23, align 8
  store i64 %44, i64* %_20, align 8
  %45 = load i64, i64* %_20, align 8
  %46 = load i64, i64* %max, align 8
  %cmp24 = icmp eq i64 %45, %46
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %blklab7
  br label %blklab8

if.end27:                                         ; preds = %blklab7
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #4
  unreachable

blklab8:                                          ; preds = %if.then26
  store i64 36, i64* %_23_size, align 8
  %call29 = call noalias i8* @malloc(i64 288) #5
  %48 = bitcast i8* %call29 to i64*
  store i64* %48, i64** %_23, align 8
  %49 = load i64*, i64** %_23, align 8
  %arrayidx30 = getelementptr inbounds i64, i64* %49, i64 0
  store i64 80, i64* %arrayidx30, align 8
  %50 = load i64*, i64** %_23, align 8
  %arrayidx31 = getelementptr inbounds i64, i64* %50, i64 1
  store i64 97, i64* %arrayidx31, align 8
  %51 = load i64*, i64** %_23, align 8
  %arrayidx32 = getelementptr inbounds i64, i64* %51, i64 2
  store i64 115, i64* %arrayidx32, align 8
  %52 = load i64*, i64** %_23, align 8
  %arrayidx33 = getelementptr inbounds i64, i64* %52, i64 3
  store i64 115, i64* %arrayidx33, align 8
  %53 = load i64*, i64** %_23, align 8
  %arrayidx34 = getelementptr inbounds i64, i64* %53, i64 4
  store i64 32, i64* %arrayidx34, align 8
  %54 = load i64*, i64** %_23, align 8
  %arrayidx35 = getelementptr inbounds i64, i64* %54, i64 5
  store i64 82, i64* %arrayidx35, align 8
  %55 = load i64*, i64** %_23, align 8
  %arrayidx36 = getelementptr inbounds i64, i64* %55, i64 6
  store i64 101, i64* %arrayidx36, align 8
  %56 = load i64*, i64** %_23, align 8
  %arrayidx37 = getelementptr inbounds i64, i64* %56, i64 7
  store i64 118, i64* %arrayidx37, align 8
  %57 = load i64*, i64** %_23, align 8
  %arrayidx38 = getelementptr inbounds i64, i64* %57, i64 8
  store i64 101, i64* %arrayidx38, align 8
  %58 = load i64*, i64** %_23, align 8
  %arrayidx39 = getelementptr inbounds i64, i64* %58, i64 9
  store i64 114, i64* %arrayidx39, align 8
  %59 = load i64*, i64** %_23, align 8
  %arrayidx40 = getelementptr inbounds i64, i64* %59, i64 10
  store i64 115, i64* %arrayidx40, align 8
  %60 = load i64*, i64** %_23, align 8
  %arrayidx41 = getelementptr inbounds i64, i64* %60, i64 11
  store i64 101, i64* %arrayidx41, align 8
  %61 = load i64*, i64** %_23, align 8
  %arrayidx42 = getelementptr inbounds i64, i64* %61, i64 12
  store i64 32, i64* %arrayidx42, align 8
  %62 = load i64*, i64** %_23, align 8
  %arrayidx43 = getelementptr inbounds i64, i64* %62, i64 13
  store i64 116, i64* %arrayidx43, align 8
  %63 = load i64*, i64** %_23, align 8
  %arrayidx44 = getelementptr inbounds i64, i64* %63, i64 14
  store i64 101, i64* %arrayidx44, align 8
  %64 = load i64*, i64** %_23, align 8
  %arrayidx45 = getelementptr inbounds i64, i64* %64, i64 15
  store i64 115, i64* %arrayidx45, align 8
  %65 = load i64*, i64** %_23, align 8
  %arrayidx46 = getelementptr inbounds i64, i64* %65, i64 16
  store i64 116, i64* %arrayidx46, align 8
  %66 = load i64*, i64** %_23, align 8
  %arrayidx47 = getelementptr inbounds i64, i64* %66, i64 17
  store i64 32, i64* %arrayidx47, align 8
  %67 = load i64*, i64** %_23, align 8
  %arrayidx48 = getelementptr inbounds i64, i64* %67, i64 18
  store i64 99, i64* %arrayidx48, align 8
  %68 = load i64*, i64** %_23, align 8
  %arrayidx49 = getelementptr inbounds i64, i64* %68, i64 19
  store i64 97, i64* %arrayidx49, align 8
  %69 = load i64*, i64** %_23, align 8
  %arrayidx50 = getelementptr inbounds i64, i64* %69, i64 20
  store i64 115, i64* %arrayidx50, align 8
  %70 = load i64*, i64** %_23, align 8
  %arrayidx51 = getelementptr inbounds i64, i64* %70, i64 21
  store i64 101, i64* %arrayidx51, align 8
  %71 = load i64*, i64** %_23, align 8
  %arrayidx52 = getelementptr inbounds i64, i64* %71, i64 22
  store i64 32, i64* %arrayidx52, align 8
  %72 = load i64*, i64** %_23, align 8
  %arrayidx53 = getelementptr inbounds i64, i64* %72, i64 23
  store i64 119, i64* %arrayidx53, align 8
  %73 = load i64*, i64** %_23, align 8
  %arrayidx54 = getelementptr inbounds i64, i64* %73, i64 24
  store i64 105, i64* %arrayidx54, align 8
  %74 = load i64*, i64** %_23, align 8
  %arrayidx55 = getelementptr inbounds i64, i64* %74, i64 25
  store i64 116, i64* %arrayidx55, align 8
  %75 = load i64*, i64** %_23, align 8
  %arrayidx56 = getelementptr inbounds i64, i64* %75, i64 26
  store i64 104, i64* %arrayidx56, align 8
  %76 = load i64*, i64** %_23, align 8
  %arrayidx57 = getelementptr inbounds i64, i64* %76, i64 27
  store i64 32, i64* %arrayidx57, align 8
  %77 = load i64*, i64** %_23, align 8
  %arrayidx58 = getelementptr inbounds i64, i64* %77, i64 28
  store i64 105, i64* %arrayidx58, align 8
  %78 = load i64*, i64** %_23, align 8
  %arrayidx59 = getelementptr inbounds i64, i64* %78, i64 29
  store i64 110, i64* %arrayidx59, align 8
  %79 = load i64*, i64** %_23, align 8
  %arrayidx60 = getelementptr inbounds i64, i64* %79, i64 30
  store i64 112, i64* %arrayidx60, align 8
  %80 = load i64*, i64** %_23, align 8
  %arrayidx61 = getelementptr inbounds i64, i64* %80, i64 31
  store i64 117, i64* %arrayidx61, align 8
  %81 = load i64*, i64** %_23, align 8
  %arrayidx62 = getelementptr inbounds i64, i64* %81, i64 32
  store i64 116, i64* %arrayidx62, align 8
  %82 = load i64*, i64** %_23, align 8
  %arrayidx63 = getelementptr inbounds i64, i64* %82, i64 33
  store i64 32, i64* %arrayidx63, align 8
  %83 = load i64*, i64** %_23, align 8
  %arrayidx64 = getelementptr inbounds i64, i64* %83, i64 34
  store i64 61, i64* %arrayidx64, align 8
  %84 = load i64*, i64** %_23, align 8
  %arrayidx65 = getelementptr inbounds i64, i64* %84, i64 35
  store i64 32, i64* %arrayidx65, align 8
  %85 = load i64*, i64** %_23, align 8
  %86 = load i64, i64* %_23_size, align 8
  call void @printf_s(i64* %85, i64 %86)
  %87 = load i64, i64* %max, align 8
  %call66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i64 %87)
  br label %blklab4

blklab4:                                          ; preds = %blklab8, %if.then
  call void @exit(i32 0) #4
  unreachable

return:                                           ; No predecessors!
  %88 = load i32, i32* %retval, align 4
  ret i32 %88
}

declare i64** @convertArgsToIntArray(i32, i8**) #1

declare i64 @parseStringToInt(i64*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare void @printf_s(i64*, i64) #1

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 1f64ddbc4c5d1036b68ec896765a7535537ded85) (http://llvm.org/git/llvm.git 99a07120d47e1881a14a7b36bf7cf6bbd54954af)"}
