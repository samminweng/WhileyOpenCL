; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Matrix = type { i64**, i64, i64, i64, i64 }

@.str = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c" data:\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c" width:\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c" height:\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [5 x i8] c"fail\00", align 1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @copy_Matrix(%struct.Matrix* %_Matrix) #0 {
entry:
  %_Matrix.addr = alloca %struct.Matrix*, align 8
  %new_Matrix = alloca %struct.Matrix*, align 8
  store %struct.Matrix* %_Matrix, %struct.Matrix** %_Matrix.addr, align 8
  %call = call noalias i8* @malloc(i64 40) #4
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

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i64** @copy2DArray(i64**, i64, i64) #2

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
  call void @free(i8* %5) #4
  ret void
}

declare void @free2DArray(i64**, i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @printf_Matrix(%struct.Matrix* %matrix) #0 {
entry:
  %matrix.addr = alloca %struct.Matrix*, align 8
  store %struct.Matrix* %matrix, %struct.Matrix** %matrix.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0))
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
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0))
  %6 = load %struct.Matrix*, %struct.Matrix** %matrix.addr, align 8
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %6, i32 0, i32 3
  %7 = load i64, i64* %width, align 8
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i64 %7)
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0))
  %8 = load %struct.Matrix*, %struct.Matrix** %matrix.addr, align 8
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %8, i32 0, i32 4
  %9 = load i64, i64* %height, align 8
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i64 %9)
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #2

declare void @printf2DArray(i64**, i64, i64) #2

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
  %call = call noalias i8* @malloc(i64 40) #4
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

declare i64* @gen1DArray(i32, i32) #2

declare i64** @gen2DArray(i64*, i64, i64) #2

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
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i64 %26)
  store i64 1, i64* %_15_size, align 8
  %call10 = call noalias i8* @malloc(i64 8) #4
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
  %call13 = call noalias i8* @malloc(i64 0) #4
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

declare void @printf_s(i64*, i64) #2

declare void @println_s(i64*, i64) #2

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
  %call20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 -1) #5
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
  %call25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 -1) #5
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
  %call30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab30:                                         ; preds = %if.then28
  store i64 39, i64* %_21_size, align 8
  %call31 = call noalias i8* @malloc(i64 312) #4
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
  %call71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i64 %90)
  br label %blklab27

blklab27:                                         ; preds = %blklab30, %if.then
  call void @exit(i32 0) #5
  unreachable

return:                                           ; No predecessors!
  %91 = load i32, i32* %retval, align 4
  ret i32 %91
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64 @parseStringToInt(i64*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 1f64ddbc4c5d1036b68ec896765a7535537ded85) (http://llvm.org/git/llvm.git f87dc438fd28550abfe9692daa50aaa331e7cf1a)"}
