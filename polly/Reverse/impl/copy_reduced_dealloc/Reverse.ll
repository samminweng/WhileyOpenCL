; ModuleID = 'Reverse.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @reverse(i64* %ls, i64 %ls_size, i1 zeroext %ls_has_ownership) #0 {
entry:
  %ls.addr = alloca i64*, align 8
  %ls_size.addr = alloca i64, align 8
  %ls_has_ownership.addr = alloca i8, align 1
  %_1 = alloca i64*, align 8
  %_1_size = alloca i64, align 8
  %_1_has_ownership = alloca i8, align 1
  %i = alloca i64, align 8
  %r = alloca i64*, align 8
  %r_size = alloca i64, align 8
  %r_has_ownership = alloca i8, align 1
  %item = alloca i64, align 8
  %_5 = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64*, align 8
  %_8_size = alloca i64, align 8
  %_8_has_ownership = alloca i8, align 1
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
  %frombool = zext i1 %ls_has_ownership to i8
  store i8 %frombool, i8* %ls_has_ownership.addr, align 1
  store i64* null, i64** %_1, align 8
  store i64 0, i64* %_1_size, align 8
  store i8 0, i8* %_1_has_ownership, align 1
  store i64 0, i64* %i, align 8
  store i64* null, i64** %r, align 8
  store i64 0, i64* %r_size, align 8
  store i8 0, i8* %r_has_ownership, align 1
  store i64 0, i64* %item, align 8
  store i64 0, i64* %_5, align 8
  store i64 0, i64* %_6, align 8
  store i64 0, i64* %_7, align 8
  store i64* null, i64** %_8, align 8
  store i64 0, i64* %_8_size, align 8
  store i8 0, i8* %_8_has_ownership, align 1
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
  %3 = load i8, i8* %_8_has_ownership, align 1
  %tobool = trunc i8 %3 to i1
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %_8, align 8
  %5 = bitcast i64* %4 to i8*
  call void @free(i8* %5) #4
  store i8 0, i8* %_8_has_ownership, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i64, i64* %_7, align 8
  store i64 %6, i64* %_8_size, align 8
  %7 = load i64, i64* %_6, align 8
  %conv = trunc i64 %7 to i32
  %8 = load i64, i64* %_8_size, align 8
  %conv1 = trunc i64 %8 to i32
  %call = call i64* @gen1DArray(i32 %conv, i32 %conv1)
  store i64* %call, i64** %_8, align 8
  store i8 1, i8* %_8_has_ownership, align 1
  %9 = load i8, i8* %r_has_ownership, align 1
  %tobool2 = trunc i8 %9 to i1
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %10 = load i64*, i64** %r, align 8
  %11 = bitcast i64* %10 to i8*
  call void @free(i8* %11) #4
  store i8 0, i8* %r_has_ownership, align 1
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %12 = load i64, i64* %_8_size, align 8
  store i64 %12, i64* %r_size, align 8
  %13 = load i64*, i64** %_8, align 8
  store i64* %13, i64** %r, align 8
  store i8 1, i8* %r_has_ownership, align 1
  store i8 0, i8* %_8_has_ownership, align 1
  br label %while.body

while.body:                                       ; preds = %if.end4, %blklab1
  %14 = load i64, i64* %ls_size.addr, align 8
  store i64 %14, i64* %_9, align 8
  %15 = load i64, i64* %i, align 8
  %16 = load i64, i64* %_9, align 8
  %cmp = icmp sgt i64 %15, %16
  br i1 %cmp, label %if.then6, label %if.end7

if.then6:                                         ; preds = %while.body
  br label %blklab3

if.end7:                                          ; preds = %while.body
  %17 = load i64, i64* %r_size, align 8
  store i64 %17, i64* %_10, align 8
  %18 = load i64, i64* %ls_size.addr, align 8
  store i64 %18, i64* %_11, align 8
  %19 = load i64, i64* %_10, align 8
  %20 = load i64, i64* %_11, align 8
  %cmp8 = icmp eq i64 %19, %20
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end7
  br label %blklab2

if.end11:                                         ; preds = %if.end7
  br label %blklab3

blklab3:                                          ; preds = %if.end11, %if.then6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab2:                                          ; preds = %if.then10
  store i64 0, i64* %_12, align 8
  %22 = load i64, i64* %i, align 8
  %23 = load i64, i64* %_12, align 8
  %cmp13 = icmp sle i64 %22, %23
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %blklab2
  br label %blklab0

if.end16:                                         ; preds = %blklab2
  %24 = load i64, i64* %ls_size.addr, align 8
  store i64 %24, i64* %_13, align 8
  %25 = load i64, i64* %_13, align 8
  %26 = load i64, i64* %i, align 8
  %sub = sub nsw i64 %25, %26
  store i64 %sub, i64* %_14, align 8
  %27 = load i64, i64* %_14, align 8
  %28 = load i64*, i64** %ls.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %28, i64 %27
  %29 = load i64, i64* %arrayidx, align 8
  store i64 %29, i64* %_15, align 8
  %30 = load i64, i64* %_15, align 8
  store i64 %30, i64* %item, align 8
  store i64 1, i64* %_16, align 8
  %31 = load i64, i64* %i, align 8
  %32 = load i64, i64* %_16, align 8
  %sub17 = sub nsw i64 %31, %32
  store i64 %sub17, i64* %_17, align 8
  %33 = load i64, i64* %_17, align 8
  store i64 %33, i64* %i, align 8
  %34 = load i64, i64* %item, align 8
  %35 = load i64, i64* %i, align 8
  %36 = load i64*, i64** %r, align 8
  %arrayidx18 = getelementptr inbounds i64, i64* %36, i64 %35
  store i64 %34, i64* %arrayidx18, align 8
  br label %blklab1

blklab1:                                          ; preds = %if.end16
  br label %while.body

blklab0:                                          ; preds = %if.then15
  %37 = load i8, i8* %ls_has_ownership.addr, align 1
  %tobool19 = trunc i8 %37 to i1
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %blklab0
  %38 = load i64*, i64** %ls.addr, align 8
  %39 = bitcast i64* %38 to i8*
  call void @free(i8* %39) #4
  store i8 0, i8* %ls_has_ownership.addr, align 1
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %blklab0
  %40 = load i8, i8* %_1_has_ownership, align 1
  %tobool22 = trunc i8 %40 to i1
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end21
  %41 = load i64*, i64** %_1, align 8
  %42 = bitcast i64* %41 to i8*
  call void @free(i8* %42) #4
  store i8 0, i8* %_1_has_ownership, align 1
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end21
  %43 = load i8, i8* %_8_has_ownership, align 1
  %tobool25 = trunc i8 %43 to i1
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end24
  %44 = load i64*, i64** %_8, align 8
  %45 = bitcast i64* %44 to i8*
  call void @free(i8* %45) #4
  store i8 0, i8* %_8_has_ownership, align 1
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end24
  %46 = load i64*, i64** %r, align 8
  ret i64* %46
}

; Function Attrs: nounwind
declare void @free(i8*) #1

declare i64* @gen1DArray(i32, i32) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

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
  %arr_has_ownership = alloca i8, align 1
  %_4 = alloca i64, align 8
  %_5 = alloca i64**, align 8
  %_5_size = alloca i64, align 8
  %_5_size_size = alloca i64, align 8
  %_5_has_ownership = alloca i8, align 1
  %_6 = alloca i64, align 8
  %_7 = alloca i64*, align 8
  %_7_size = alloca i64, align 8
  %_7_has_ownership = alloca i8, align 1
  %_8 = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64*, align 8
  %_12_size = alloca i64, align 8
  %_12_has_ownership = alloca i8, align 1
  %_13 = alloca i64, align 8
  %_14 = alloca i64, align 8
  %_15 = alloca i64, align 8
  %_16 = alloca i64*, align 8
  %_16_size = alloca i64, align 8
  %_16_has_ownership = alloca i8, align 1
  %_17 = alloca i64, align 8
  %_18 = alloca i64, align 8
  %_19 = alloca i64, align 8
  %_20 = alloca i64, align 8
  %_21 = alloca i8*, align 8
  %_23 = alloca i64*, align 8
  %_23_size = alloca i64, align 8
  %_23_has_ownership = alloca i8, align 1
  %_24 = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  store i64 0, i64* %index, align 8
  store i64* null, i64** %arr, align 8
  store i64 0, i64* %arr_size, align 8
  store i8 0, i8* %arr_has_ownership, align 1
  store i64** null, i64*** %_5, align 8
  store i64 0, i64* %_5_size, align 8
  store i64 0, i64* %_5_size_size, align 8
  store i8 0, i8* %_5_has_ownership, align 1
  store i64 0, i64* %_6, align 8
  store i64* null, i64** %_7, align 8
  store i64 0, i64* %_7_size, align 8
  store i8 0, i8* %_7_has_ownership, align 1
  store i64 0, i64* %_8, align 8
  store i64 0, i64* %_9, align 8
  store i64 0, i64* %_10, align 8
  store i64 0, i64* %_11, align 8
  store i64* null, i64** %_12, align 8
  store i64 0, i64* %_12_size, align 8
  store i8 0, i8* %_12_has_ownership, align 1
  store i64 0, i64* %_13, align 8
  store i64 0, i64* %_14, align 8
  store i64 0, i64* %_15, align 8
  store i64* null, i64** %_16, align 8
  store i64 0, i64* %_16_size, align 8
  store i8 0, i8* %_16_has_ownership, align 1
  store i64 0, i64* %_17, align 8
  store i64 0, i64* %_18, align 8
  store i64 0, i64* %_19, align 8
  store i64 0, i64* %_20, align 8
  store i64* null, i64** %_23, align 8
  store i64 0, i64* %_23_size, align 8
  store i8 0, i8* %_23_has_ownership, align 1
  %0 = load i32, i32* %argc.addr, align 4
  %1 = load i8**, i8*** %args.addr, align 8
  %call = call i64** @convertArgsToIntArray(i32 %0, i8** %1)
  store i64** %call, i64*** %_5, align 8
  %2 = load i32, i32* %argc.addr, align 4
  %sub = sub nsw i32 %2, 1
  %conv = sext i32 %sub to i64
  store i64 %conv, i64* %_5_size, align 8
  store i8 1, i8* %_5_has_ownership, align 1
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
  %13 = load i8, i8* %_12_has_ownership, align 1
  %tobool = trunc i8 %13 to i1
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %14 = load i64*, i64** %_12, align 8
  %15 = bitcast i64* %14 to i8*
  call void @free(i8* %15) #4
  store i8 0, i8* %_12_has_ownership, align 1
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %16 = load i64, i64* %_11, align 8
  store i64 %16, i64* %_12_size, align 8
  %17 = load i64, i64* %_9, align 8
  %conv5 = trunc i64 %17 to i32
  %18 = load i64, i64* %_12_size, align 8
  %conv6 = trunc i64 %18 to i32
  %call7 = call i64* @gen1DArray(i32 %conv5, i32 %conv6)
  store i64* %call7, i64** %_12, align 8
  store i8 1, i8* %_12_has_ownership, align 1
  %19 = load i8, i8* %arr_has_ownership, align 1
  %tobool8 = trunc i8 %19 to i1
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end4
  %20 = load i64*, i64** %arr, align 8
  %21 = bitcast i64* %20 to i8*
  call void @free(i8* %21) #4
  store i8 0, i8* %arr_has_ownership, align 1
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end4
  %22 = load i64, i64* %_12_size, align 8
  store i64 %22, i64* %arr_size, align 8
  %23 = load i64*, i64** %_12, align 8
  store i64* %23, i64** %arr, align 8
  store i8 1, i8* %arr_has_ownership, align 1
  store i8 0, i8* %_12_has_ownership, align 1
  br label %while.body

while.body:                                       ; preds = %if.end10, %blklab6
  %24 = load i64, i64* %index, align 8
  %25 = load i64, i64* %max, align 8
  %cmp11 = icmp sgt i64 %24, %25
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %while.body
  br label %blklab5

if.end14:                                         ; preds = %while.body
  %26 = load i64, i64* %max, align 8
  %27 = load i64, i64* %index, align 8
  %sub15 = sub nsw i64 %26, %27
  store i64 %sub15, i64* %_13, align 8
  %28 = load i64, i64* %_13, align 8
  %29 = load i64, i64* %index, align 8
  %30 = load i64*, i64** %arr, align 8
  %arrayidx16 = getelementptr inbounds i64, i64* %30, i64 %29
  store i64 %28, i64* %arrayidx16, align 8
  store i64 1, i64* %_14, align 8
  %31 = load i64, i64* %index, align 8
  %32 = load i64, i64* %_14, align 8
  %add17 = add nsw i64 %31, %32
  store i64 %add17, i64* %_15, align 8
  %33 = load i64, i64* %_15, align 8
  store i64 %33, i64* %index, align 8
  br label %blklab6

blklab6:                                          ; preds = %if.end14
  br label %while.body

blklab5:                                          ; preds = %if.then13
  %34 = load i8, i8* %_16_has_ownership, align 1
  %tobool18 = trunc i8 %34 to i1
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %blklab5
  %35 = load i64*, i64** %_16, align 8
  %36 = bitcast i64* %35 to i8*
  call void @free(i8* %36) #4
  store i8 0, i8* %_16_has_ownership, align 1
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %blklab5
  store i8 1, i8* %arr_has_ownership, align 1
  %37 = load i64, i64* %arr_size, align 8
  store i64 %37, i64* %_16_size, align 8
  %38 = load i64*, i64** %arr, align 8
  %39 = load i64, i64* %arr_size, align 8
  %call21 = call i64* @reverse(i64* %38, i64 %39, i1 zeroext false)
  store i64* %call21, i64** %_16, align 8
  store i8 1, i8* %_16_has_ownership, align 1
  %40 = load i8, i8* %arr_has_ownership, align 1
  %tobool22 = trunc i8 %40 to i1
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  %41 = load i64*, i64** %arr, align 8
  %42 = bitcast i64* %41 to i8*
  call void @free(i8* %42) #4
  store i8 0, i8* %arr_has_ownership, align 1
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end20
  %43 = load i64, i64* %_16_size, align 8
  store i64 %43, i64* %arr_size, align 8
  %44 = load i64*, i64** %_16, align 8
  store i64* %44, i64** %arr, align 8
  store i8 1, i8* %arr_has_ownership, align 1
  store i8 0, i8* %_16_has_ownership, align 1
  store i64 0, i64* %_17, align 8
  %45 = load i64, i64* %_17, align 8
  %46 = load i64*, i64** %arr, align 8
  %arrayidx25 = getelementptr inbounds i64, i64* %46, i64 %45
  %47 = load i64, i64* %arrayidx25, align 8
  store i64 %47, i64* %_18, align 8
  store i64 0, i64* %_19, align 8
  %48 = load i64, i64* %_18, align 8
  %49 = load i64, i64* %_19, align 8
  %cmp26 = icmp eq i64 %48, %49
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end24
  br label %blklab7

if.end29:                                         ; preds = %if.end24
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab7:                                          ; preds = %if.then28
  %51 = load i64, i64* %max, align 8
  %52 = load i64*, i64** %arr, align 8
  %arrayidx31 = getelementptr inbounds i64, i64* %52, i64 %51
  %53 = load i64, i64* %arrayidx31, align 8
  store i64 %53, i64* %_20, align 8
  %54 = load i64, i64* %_20, align 8
  %55 = load i64, i64* %max, align 8
  %cmp32 = icmp eq i64 %54, %55
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %blklab7
  br label %blklab8

if.end35:                                         ; preds = %blklab7
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab8:                                          ; preds = %if.then34
  %57 = load i8, i8* %_23_has_ownership, align 1
  %tobool37 = trunc i8 %57 to i1
  br i1 %tobool37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %blklab8
  %58 = load i64*, i64** %_23, align 8
  %59 = bitcast i64* %58 to i8*
  call void @free(i8* %59) #4
  store i8 0, i8* %_23_has_ownership, align 1
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %blklab8
  store i64 36, i64* %_23_size, align 8
  %call40 = call noalias i8* @malloc(i64 288) #4
  %60 = bitcast i8* %call40 to i64*
  store i64* %60, i64** %_23, align 8
  %61 = load i64*, i64** %_23, align 8
  %arrayidx41 = getelementptr inbounds i64, i64* %61, i64 0
  store i64 80, i64* %arrayidx41, align 8
  %62 = load i64*, i64** %_23, align 8
  %arrayidx42 = getelementptr inbounds i64, i64* %62, i64 1
  store i64 97, i64* %arrayidx42, align 8
  %63 = load i64*, i64** %_23, align 8
  %arrayidx43 = getelementptr inbounds i64, i64* %63, i64 2
  store i64 115, i64* %arrayidx43, align 8
  %64 = load i64*, i64** %_23, align 8
  %arrayidx44 = getelementptr inbounds i64, i64* %64, i64 3
  store i64 115, i64* %arrayidx44, align 8
  %65 = load i64*, i64** %_23, align 8
  %arrayidx45 = getelementptr inbounds i64, i64* %65, i64 4
  store i64 32, i64* %arrayidx45, align 8
  %66 = load i64*, i64** %_23, align 8
  %arrayidx46 = getelementptr inbounds i64, i64* %66, i64 5
  store i64 82, i64* %arrayidx46, align 8
  %67 = load i64*, i64** %_23, align 8
  %arrayidx47 = getelementptr inbounds i64, i64* %67, i64 6
  store i64 101, i64* %arrayidx47, align 8
  %68 = load i64*, i64** %_23, align 8
  %arrayidx48 = getelementptr inbounds i64, i64* %68, i64 7
  store i64 118, i64* %arrayidx48, align 8
  %69 = load i64*, i64** %_23, align 8
  %arrayidx49 = getelementptr inbounds i64, i64* %69, i64 8
  store i64 101, i64* %arrayidx49, align 8
  %70 = load i64*, i64** %_23, align 8
  %arrayidx50 = getelementptr inbounds i64, i64* %70, i64 9
  store i64 114, i64* %arrayidx50, align 8
  %71 = load i64*, i64** %_23, align 8
  %arrayidx51 = getelementptr inbounds i64, i64* %71, i64 10
  store i64 115, i64* %arrayidx51, align 8
  %72 = load i64*, i64** %_23, align 8
  %arrayidx52 = getelementptr inbounds i64, i64* %72, i64 11
  store i64 101, i64* %arrayidx52, align 8
  %73 = load i64*, i64** %_23, align 8
  %arrayidx53 = getelementptr inbounds i64, i64* %73, i64 12
  store i64 32, i64* %arrayidx53, align 8
  %74 = load i64*, i64** %_23, align 8
  %arrayidx54 = getelementptr inbounds i64, i64* %74, i64 13
  store i64 116, i64* %arrayidx54, align 8
  %75 = load i64*, i64** %_23, align 8
  %arrayidx55 = getelementptr inbounds i64, i64* %75, i64 14
  store i64 101, i64* %arrayidx55, align 8
  %76 = load i64*, i64** %_23, align 8
  %arrayidx56 = getelementptr inbounds i64, i64* %76, i64 15
  store i64 115, i64* %arrayidx56, align 8
  %77 = load i64*, i64** %_23, align 8
  %arrayidx57 = getelementptr inbounds i64, i64* %77, i64 16
  store i64 116, i64* %arrayidx57, align 8
  %78 = load i64*, i64** %_23, align 8
  %arrayidx58 = getelementptr inbounds i64, i64* %78, i64 17
  store i64 32, i64* %arrayidx58, align 8
  %79 = load i64*, i64** %_23, align 8
  %arrayidx59 = getelementptr inbounds i64, i64* %79, i64 18
  store i64 99, i64* %arrayidx59, align 8
  %80 = load i64*, i64** %_23, align 8
  %arrayidx60 = getelementptr inbounds i64, i64* %80, i64 19
  store i64 97, i64* %arrayidx60, align 8
  %81 = load i64*, i64** %_23, align 8
  %arrayidx61 = getelementptr inbounds i64, i64* %81, i64 20
  store i64 115, i64* %arrayidx61, align 8
  %82 = load i64*, i64** %_23, align 8
  %arrayidx62 = getelementptr inbounds i64, i64* %82, i64 21
  store i64 101, i64* %arrayidx62, align 8
  %83 = load i64*, i64** %_23, align 8
  %arrayidx63 = getelementptr inbounds i64, i64* %83, i64 22
  store i64 32, i64* %arrayidx63, align 8
  %84 = load i64*, i64** %_23, align 8
  %arrayidx64 = getelementptr inbounds i64, i64* %84, i64 23
  store i64 119, i64* %arrayidx64, align 8
  %85 = load i64*, i64** %_23, align 8
  %arrayidx65 = getelementptr inbounds i64, i64* %85, i64 24
  store i64 105, i64* %arrayidx65, align 8
  %86 = load i64*, i64** %_23, align 8
  %arrayidx66 = getelementptr inbounds i64, i64* %86, i64 25
  store i64 116, i64* %arrayidx66, align 8
  %87 = load i64*, i64** %_23, align 8
  %arrayidx67 = getelementptr inbounds i64, i64* %87, i64 26
  store i64 104, i64* %arrayidx67, align 8
  %88 = load i64*, i64** %_23, align 8
  %arrayidx68 = getelementptr inbounds i64, i64* %88, i64 27
  store i64 32, i64* %arrayidx68, align 8
  %89 = load i64*, i64** %_23, align 8
  %arrayidx69 = getelementptr inbounds i64, i64* %89, i64 28
  store i64 105, i64* %arrayidx69, align 8
  %90 = load i64*, i64** %_23, align 8
  %arrayidx70 = getelementptr inbounds i64, i64* %90, i64 29
  store i64 110, i64* %arrayidx70, align 8
  %91 = load i64*, i64** %_23, align 8
  %arrayidx71 = getelementptr inbounds i64, i64* %91, i64 30
  store i64 112, i64* %arrayidx71, align 8
  %92 = load i64*, i64** %_23, align 8
  %arrayidx72 = getelementptr inbounds i64, i64* %92, i64 31
  store i64 117, i64* %arrayidx72, align 8
  %93 = load i64*, i64** %_23, align 8
  %arrayidx73 = getelementptr inbounds i64, i64* %93, i64 32
  store i64 116, i64* %arrayidx73, align 8
  %94 = load i64*, i64** %_23, align 8
  %arrayidx74 = getelementptr inbounds i64, i64* %94, i64 33
  store i64 32, i64* %arrayidx74, align 8
  %95 = load i64*, i64** %_23, align 8
  %arrayidx75 = getelementptr inbounds i64, i64* %95, i64 34
  store i64 61, i64* %arrayidx75, align 8
  %96 = load i64*, i64** %_23, align 8
  %arrayidx76 = getelementptr inbounds i64, i64* %96, i64 35
  store i64 32, i64* %arrayidx76, align 8
  store i8 1, i8* %_23_has_ownership, align 1
  %97 = load i64*, i64** %_23, align 8
  %98 = load i64, i64* %_23_size, align 8
  call void @printf_s(i64* %97, i64 %98)
  %99 = load i64, i64* %max, align 8
  %call77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i64 %99)
  br label %blklab4

blklab4:                                          ; preds = %if.end39, %if.then
  %100 = load i8, i8* %arr_has_ownership, align 1
  %tobool78 = trunc i8 %100 to i1
  br i1 %tobool78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %blklab4
  %101 = load i64*, i64** %arr, align 8
  %102 = bitcast i64* %101 to i8*
  call void @free(i8* %102) #4
  store i8 0, i8* %arr_has_ownership, align 1
  br label %if.end80

if.end80:                                         ; preds = %if.then79, %blklab4
  %103 = load i8, i8* %_5_has_ownership, align 1
  %tobool81 = trunc i8 %103 to i1
  br i1 %tobool81, label %if.then82, label %if.end83

if.then82:                                        ; preds = %if.end80
  %104 = load i64**, i64*** %_5, align 8
  %105 = load i64, i64* %_5_size, align 8
  call void @free2DArray(i64** %104, i64 %105)
  store i8 0, i8* %_5_has_ownership, align 1
  br label %if.end83

if.end83:                                         ; preds = %if.then82, %if.end80
  %106 = load i8, i8* %_7_has_ownership, align 1
  %tobool84 = trunc i8 %106 to i1
  br i1 %tobool84, label %if.then85, label %if.end86

if.then85:                                        ; preds = %if.end83
  %107 = load i64*, i64** %_7, align 8
  %108 = bitcast i64* %107 to i8*
  call void @free(i8* %108) #4
  store i8 0, i8* %_7_has_ownership, align 1
  br label %if.end86

if.end86:                                         ; preds = %if.then85, %if.end83
  %109 = load i8, i8* %_12_has_ownership, align 1
  %tobool87 = trunc i8 %109 to i1
  br i1 %tobool87, label %if.then88, label %if.end89

if.then88:                                        ; preds = %if.end86
  %110 = load i64*, i64** %_12, align 8
  %111 = bitcast i64* %110 to i8*
  call void @free(i8* %111) #4
  store i8 0, i8* %_12_has_ownership, align 1
  br label %if.end89

if.end89:                                         ; preds = %if.then88, %if.end86
  %112 = load i8, i8* %_16_has_ownership, align 1
  %tobool90 = trunc i8 %112 to i1
  br i1 %tobool90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end89
  %113 = load i64*, i64** %_16, align 8
  %114 = bitcast i64* %113 to i8*
  call void @free(i8* %114) #4
  store i8 0, i8* %_16_has_ownership, align 1
  br label %if.end92

if.end92:                                         ; preds = %if.then91, %if.end89
  %115 = load i8, i8* %_23_has_ownership, align 1
  %tobool93 = trunc i8 %115 to i1
  br i1 %tobool93, label %if.then94, label %if.end95

if.then94:                                        ; preds = %if.end92
  %116 = load i64*, i64** %_23, align 8
  %117 = bitcast i64* %116 to i8*
  call void @free(i8* %117) #4
  store i8 0, i8* %_23_has_ownership, align 1
  br label %if.end95

if.end95:                                         ; preds = %if.then94, %if.end92
  call void @exit(i32 0) #5
  unreachable

return:                                           ; No predecessors!
  %118 = load i32, i32* %retval, align 4
  ret i32 %118
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64 @parseStringToInt(i64*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare void @printf_s(i64*, i64) #2

declare i32 @printf(i8*, ...) #2

declare void @free2DArray(i64**, i64) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 1f64ddbc4c5d1036b68ec896765a7535537ded85) (http://llvm.org/git/llvm.git 99a07120d47e1881a14a7b36bf7cf6bbd54954af)"}
