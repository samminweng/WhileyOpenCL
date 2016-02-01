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
define %struct.Matrix* @matrix(i64 %width, i64 %height, i64** %data, i64 %data_size, i64 %data_size_size, i1 zeroext %data_has_ownership) #0 {
entry:
  %width.addr = alloca i64, align 8
  %height.addr = alloca i64, align 8
  %data.addr = alloca i64**, align 8
  %data_size.addr = alloca i64, align 8
  %data_size_size.addr = alloca i64, align 8
  %data_has_ownership.addr = alloca i8, align 1
  %r = alloca %struct.Matrix*, align 8
  %r_has_ownership = alloca i8, align 1
  %_4 = alloca %struct.Matrix*, align 8
  %_4_has_ownership = alloca i8, align 1
  store i64 %width, i64* %width.addr, align 8
  store i64 %height, i64* %height.addr, align 8
  store i64** %data, i64*** %data.addr, align 8
  store i64 %data_size, i64* %data_size.addr, align 8
  store i64 %data_size_size, i64* %data_size_size.addr, align 8
  %frombool = zext i1 %data_has_ownership to i8
  store i8 %frombool, i8* %data_has_ownership.addr, align 1
  store i8 0, i8* %r_has_ownership, align 1
  store i8 0, i8* %_4_has_ownership, align 1
  %0 = load i8, i8* %_4_has_ownership, align 1
  %tobool = trunc i8 %0 to i1
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  call void @free_Matrix(%struct.Matrix* %1)
  store i8 0, i8* %_4_has_ownership, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call noalias i8* @malloc(i64 40) #4
  %2 = bitcast i8* %call to %struct.Matrix*
  store %struct.Matrix* %2, %struct.Matrix** %_4, align 8
  %3 = load i64, i64* %data_size.addr, align 8
  %4 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  %data_size1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %4, i32 0, i32 1
  store i64 %3, i64* %data_size1, align 8
  %5 = load i64, i64* %data_size_size.addr, align 8
  %6 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  %data_size_size2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %6, i32 0, i32 2
  store i64 %5, i64* %data_size_size2, align 8
  %7 = load i64**, i64*** %data.addr, align 8
  %8 = load i64, i64* %data_size.addr, align 8
  %9 = load i64, i64* %data_size_size.addr, align 8
  %call3 = call i64** @copy2DArray(i64** %7, i64 %8, i64 %9)
  %10 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  %data4 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %10, i32 0, i32 0
  store i64** %call3, i64*** %data4, align 8
  %11 = load i64, i64* %height.addr, align 8
  %12 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  %height5 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %12, i32 0, i32 4
  store i64 %11, i64* %height5, align 8
  %13 = load i64, i64* %width.addr, align 8
  %14 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  %width6 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %14, i32 0, i32 3
  store i64 %13, i64* %width6, align 8
  store i8 1, i8* %_4_has_ownership, align 1
  %15 = load i8, i8* %data_has_ownership.addr, align 1
  %tobool7 = trunc i8 %15 to i1
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  %16 = load i64**, i64*** %data.addr, align 8
  %17 = load i64, i64* %data_size.addr, align 8
  call void @free2DArray(i64** %16, i64 %17)
  store i8 0, i8* %data_has_ownership.addr, align 1
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end
  %18 = load i8, i8* %r_has_ownership, align 1
  %tobool10 = trunc i8 %18 to i1
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end9
  %19 = load %struct.Matrix*, %struct.Matrix** %r, align 8
  call void @free_Matrix(%struct.Matrix* %19)
  store i8 0, i8* %r_has_ownership, align 1
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end9
  %20 = load %struct.Matrix*, %struct.Matrix** %_4, align 8
  ret %struct.Matrix* %20
}

; Function Attrs: nounwind uwtable
define %struct.Matrix* @multiply(%struct.Matrix* %A, i1 zeroext %A_has_ownership, %struct.Matrix* %B, i1 zeroext %B_has_ownership) #0 {
entry:
  %A.addr = alloca %struct.Matrix*, align 8
  %A_has_ownership.addr = alloca i8, align 1
  %B.addr = alloca %struct.Matrix*, align 8
  %B_has_ownership.addr = alloca i8, align 1
  %C = alloca %struct.Matrix*, align 8
  %C_has_ownership = alloca i8, align 1
  %C_data = alloca i64**, align 8
  %C_data_size = alloca i64, align 8
  %C_data_size_size = alloca i64, align 8
  %C_data_has_ownership = alloca i8, align 1
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %r = alloca i64, align 8
  %k = alloca i64, align 8
  %_8 = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64*, align 8
  %_10_size = alloca i64, align 8
  %_10_has_ownership = alloca i8, align 1
  %_11 = alloca i64, align 8
  %_12 = alloca i64**, align 8
  %_12_size = alloca i64, align 8
  %_12_size_size = alloca i64, align 8
  %_12_has_ownership = alloca i8, align 1
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
  %_20_has_ownership = alloca i8, align 1
  %_21 = alloca i64*, align 8
  %_21_size = alloca i64, align 8
  %_21_has_ownership = alloca i8, align 1
  %_22 = alloca i64, align 8
  %_23 = alloca i64**, align 8
  %_23_size = alloca i64, align 8
  %_23_size_size = alloca i64, align 8
  %_23_has_ownership = alloca i8, align 1
  %_24 = alloca i64*, align 8
  %_24_size = alloca i64, align 8
  %_24_has_ownership = alloca i8, align 1
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
  %_34_has_ownership = alloca i8, align 1
  %_35 = alloca i64, align 8
  %_36 = alloca i64, align 8
  store %struct.Matrix* %A, %struct.Matrix** %A.addr, align 8
  %frombool = zext i1 %A_has_ownership to i8
  store i8 %frombool, i8* %A_has_ownership.addr, align 1
  store %struct.Matrix* %B, %struct.Matrix** %B.addr, align 8
  %frombool1 = zext i1 %B_has_ownership to i8
  store i8 %frombool1, i8* %B_has_ownership.addr, align 1
  store i8 0, i8* %C_has_ownership, align 1
  store i64** null, i64*** %C_data, align 8
  store i64 0, i64* %C_data_size, align 8
  store i64 0, i64* %C_data_size_size, align 8
  store i8 0, i8* %C_data_has_ownership, align 1
  store i64 0, i64* %i, align 8
  store i64 0, i64* %j, align 8
  store i64 0, i64* %r, align 8
  store i64 0, i64* %k, align 8
  store i64 0, i64* %_8, align 8
  store i64 0, i64* %_9, align 8
  store i64* null, i64** %_10, align 8
  store i64 0, i64* %_10_size, align 8
  store i8 0, i8* %_10_has_ownership, align 1
  store i64 0, i64* %_11, align 8
  store i64** null, i64*** %_12, align 8
  store i64 0, i64* %_12_size, align 8
  store i64 0, i64* %_12_size_size, align 8
  store i8 0, i8* %_12_has_ownership, align 1
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
  store i8 0, i8* %_20_has_ownership, align 1
  store i64* null, i64** %_21, align 8
  store i64 0, i64* %_21_size, align 8
  store i8 0, i8* %_21_has_ownership, align 1
  store i64 0, i64* %_22, align 8
  store i64** null, i64*** %_23, align 8
  store i64 0, i64* %_23_size, align 8
  store i64 0, i64* %_23_size_size, align 8
  store i8 0, i8* %_23_has_ownership, align 1
  store i64* null, i64** %_24, align 8
  store i64 0, i64* %_24_size, align 8
  store i8 0, i8* %_24_has_ownership, align 1
  store i64 0, i64* %_25, align 8
  store i64 0, i64* %_26, align 8
  store i64 0, i64* %_27, align 8
  store i64 0, i64* %_28, align 8
  store i64 0, i64* %_29, align 8
  store i64 0, i64* %_30, align 8
  store i64 0, i64* %_31, align 8
  store i64 0, i64* %_32, align 8
  store i64 0, i64* %_33, align 8
  store i8 0, i8* %_34_has_ownership, align 1
  store i64 0, i64* %_35, align 8
  store i64 0, i64* %_36, align 8
  store i64 0, i64* %_8, align 8
  %0 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %0, i32 0, i32 3
  %1 = load i64, i64* %width, align 8
  store i64 %1, i64* %_9, align 8
  %2 = load i8, i8* %_10_has_ownership, align 1
  %tobool = trunc i8 %2 to i1
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i64*, i64** %_10, align 8
  %4 = bitcast i64* %3 to i8*
  call void @free(i8* %4) #4
  store i8 0, i8* %_10_has_ownership, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i64, i64* %_9, align 8
  store i64 %5, i64* %_10_size, align 8
  %6 = load i64, i64* %_8, align 8
  %conv = trunc i64 %6 to i32
  %7 = load i64, i64* %_10_size, align 8
  %conv2 = trunc i64 %7 to i32
  %call = call i64* @gen1DArray(i32 %conv, i32 %conv2)
  store i64* %call, i64** %_10, align 8
  store i8 1, i8* %_10_has_ownership, align 1
  %8 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %8, i32 0, i32 4
  %9 = load i64, i64* %height, align 8
  store i64 %9, i64* %_11, align 8
  %10 = load i8, i8* %_12_has_ownership, align 1
  %tobool3 = trunc i8 %10 to i1
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %11 = load i64**, i64*** %_12, align 8
  %12 = load i64, i64* %_12_size, align 8
  call void @free2DArray(i64** %11, i64 %12)
  store i8 0, i8* %_12_has_ownership, align 1
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %13 = load i64, i64* %_11, align 8
  store i64 %13, i64* %_12_size, align 8
  %14 = load i64, i64* %_10_size, align 8
  store i64 %14, i64* %_12_size_size, align 8
  %15 = load i64*, i64** %_10, align 8
  %16 = load i64, i64* %_12_size, align 8
  %17 = load i64, i64* %_12_size_size, align 8
  %call6 = call i64** @gen2DArray(i64* %15, i64 %16, i64 %17)
  store i64** %call6, i64*** %_12, align 8
  store i8 1, i8* %_12_has_ownership, align 1
  %18 = load i8, i8* %C_data_has_ownership, align 1
  %tobool7 = trunc i8 %18 to i1
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end5
  %19 = load i64**, i64*** %C_data, align 8
  %20 = load i64, i64* %C_data_size, align 8
  call void @free2DArray(i64** %19, i64 %20)
  store i8 0, i8* %C_data_has_ownership, align 1
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end5
  %21 = load i64, i64* %_12_size, align 8
  store i64 %21, i64* %C_data_size, align 8
  %22 = load i64, i64* %_12_size_size, align 8
  store i64 %22, i64* %C_data_size_size, align 8
  %23 = load i64**, i64*** %_12, align 8
  %24 = load i64, i64* %_12_size, align 8
  %25 = load i64, i64* %_12_size_size, align 8
  %call10 = call i64** @copy2DArray(i64** %23, i64 %24, i64 %25)
  store i64** %call10, i64*** %C_data, align 8
  store i8 1, i8* %C_data_has_ownership, align 1
  store i8 1, i8* %_12_has_ownership, align 1
  store i64 0, i64* %_13, align 8
  %26 = load i64, i64* %_13, align 8
  store i64 %26, i64* %i, align 8
  br label %while.body

while.body:                                       ; preds = %if.end9, %blklab14
  %27 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %height11 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %27, i32 0, i32 4
  %28 = load i64, i64* %height11, align 8
  store i64 %28, i64* %_14, align 8
  %29 = load i64, i64* %i, align 8
  %30 = load i64, i64* %_14, align 8
  %cmp = icmp sge i64 %29, %30
  br i1 %cmp, label %if.then13, label %if.end14

if.then13:                                        ; preds = %while.body
  br label %blklab13

if.end14:                                         ; preds = %while.body
  store i64 0, i64* %_15, align 8
  %31 = load i64, i64* %_15, align 8
  store i64 %31, i64* %j, align 8
  br label %while.body16

while.body16:                                     ; preds = %if.end14, %blklab16
  %32 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %width17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %32, i32 0, i32 3
  %33 = load i64, i64* %width17, align 8
  store i64 %33, i64* %_16, align 8
  %34 = load i64, i64* %j, align 8
  %35 = load i64, i64* %_16, align 8
  %cmp18 = icmp sge i64 %34, %35
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %while.body16
  br label %blklab15

if.end21:                                         ; preds = %while.body16
  store i64 0, i64* %_17, align 8
  %36 = load i64, i64* %_17, align 8
  store i64 %36, i64* %r, align 8
  store i64 0, i64* %_18, align 8
  %37 = load i64, i64* %_18, align 8
  store i64 %37, i64* %k, align 8
  br label %while.body23

while.body23:                                     ; preds = %if.end21, %blklab18
  %38 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %width24 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %38, i32 0, i32 3
  %39 = load i64, i64* %width24, align 8
  store i64 %39, i64* %_19, align 8
  %40 = load i64, i64* %k, align 8
  %41 = load i64, i64* %_19, align 8
  %cmp25 = icmp sge i64 %40, %41
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %while.body23
  br label %blklab17

if.end28:                                         ; preds = %while.body23
  %42 = load i8, i8* %_20_has_ownership, align 1
  %tobool29 = trunc i8 %42 to i1
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end28
  %43 = load i64**, i64*** %_20, align 8
  %44 = load i64, i64* %_20_size, align 8
  call void @free2DArray(i64** %43, i64 %44)
  store i8 0, i8* %_20_has_ownership, align 1
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.end28
  %45 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %45, i32 0, i32 1
  %46 = load i64, i64* %data_size, align 8
  store i64 %46, i64* %_20_size, align 8
  %47 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %47, i32 0, i32 2
  %48 = load i64, i64* %data_size_size, align 8
  store i64 %48, i64* %_20_size_size, align 8
  %49 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %49, i32 0, i32 0
  %50 = load i64**, i64*** %data, align 8
  %51 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size32 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %51, i32 0, i32 1
  %52 = load i64, i64* %data_size32, align 8
  %53 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size_size33 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %53, i32 0, i32 2
  %54 = load i64, i64* %data_size_size33, align 8
  %call34 = call i64** @copy2DArray(i64** %50, i64 %52, i64 %54)
  store i64** %call34, i64*** %_20, align 8
  store i8 1, i8* %_20_has_ownership, align 1
  %55 = load i64, i64* %i, align 8
  %56 = load i64**, i64*** %_20, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %56, i64 %55
  %57 = load i64*, i64** %arrayidx, align 8
  store i64* %57, i64** %_21, align 8
  %58 = load i64, i64* %k, align 8
  %59 = load i64*, i64** %_21, align 8
  %arrayidx35 = getelementptr inbounds i64, i64* %59, i64 %58
  %60 = load i64, i64* %arrayidx35, align 8
  store i64 %60, i64* %_22, align 8
  %61 = load i8, i8* %_23_has_ownership, align 1
  %tobool36 = trunc i8 %61 to i1
  br i1 %tobool36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end31
  %62 = load i64**, i64*** %_23, align 8
  %63 = load i64, i64* %_23_size, align 8
  call void @free2DArray(i64** %62, i64 %63)
  store i8 0, i8* %_23_has_ownership, align 1
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %if.end31
  %64 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data_size39 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %64, i32 0, i32 1
  %65 = load i64, i64* %data_size39, align 8
  store i64 %65, i64* %_23_size, align 8
  %66 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data_size_size40 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %66, i32 0, i32 2
  %67 = load i64, i64* %data_size_size40, align 8
  store i64 %67, i64* %_23_size_size, align 8
  %68 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data41 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %68, i32 0, i32 0
  %69 = load i64**, i64*** %data41, align 8
  %70 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data_size42 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %70, i32 0, i32 1
  %71 = load i64, i64* %data_size42, align 8
  %72 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data_size_size43 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %72, i32 0, i32 2
  %73 = load i64, i64* %data_size_size43, align 8
  %call44 = call i64** @copy2DArray(i64** %69, i64 %71, i64 %73)
  store i64** %call44, i64*** %_23, align 8
  store i8 1, i8* %_23_has_ownership, align 1
  %74 = load i64, i64* %k, align 8
  %75 = load i64**, i64*** %_23, align 8
  %arrayidx45 = getelementptr inbounds i64*, i64** %75, i64 %74
  %76 = load i64*, i64** %arrayidx45, align 8
  store i64* %76, i64** %_24, align 8
  %77 = load i64, i64* %j, align 8
  %78 = load i64*, i64** %_24, align 8
  %arrayidx46 = getelementptr inbounds i64, i64* %78, i64 %77
  %79 = load i64, i64* %arrayidx46, align 8
  store i64 %79, i64* %_25, align 8
  %80 = load i64, i64* %_22, align 8
  %81 = load i64, i64* %_25, align 8
  %mul = mul nsw i64 %80, %81
  store i64 %mul, i64* %_26, align 8
  %82 = load i64, i64* %r, align 8
  %83 = load i64, i64* %_26, align 8
  %add = add nsw i64 %82, %83
  store i64 %add, i64* %_27, align 8
  %84 = load i64, i64* %_27, align 8
  store i64 %84, i64* %r, align 8
  store i64 1, i64* %_28, align 8
  %85 = load i64, i64* %k, align 8
  %86 = load i64, i64* %_28, align 8
  %add47 = add nsw i64 %85, %86
  store i64 %add47, i64* %_29, align 8
  %87 = load i64, i64* %_29, align 8
  store i64 %87, i64* %k, align 8
  br label %blklab18

blklab18:                                         ; preds = %if.end38
  br label %while.body23

blklab17:                                         ; preds = %if.then27
  %88 = load i64, i64* %r, align 8
  %89 = load i64, i64* %j, align 8
  %90 = load i64, i64* %i, align 8
  %91 = load i64**, i64*** %C_data, align 8
  %arrayidx48 = getelementptr inbounds i64*, i64** %91, i64 %90
  %92 = load i64*, i64** %arrayidx48, align 8
  %arrayidx49 = getelementptr inbounds i64, i64* %92, i64 %89
  store i64 %88, i64* %arrayidx49, align 8
  store i64 1, i64* %_30, align 8
  %93 = load i64, i64* %j, align 8
  %94 = load i64, i64* %_30, align 8
  %add50 = add nsw i64 %93, %94
  store i64 %add50, i64* %_31, align 8
  %95 = load i64, i64* %_31, align 8
  store i64 %95, i64* %j, align 8
  br label %blklab16

blklab16:                                         ; preds = %blklab17
  br label %while.body16

blklab15:                                         ; preds = %if.then20
  store i64 1, i64* %_32, align 8
  %96 = load i64, i64* %i, align 8
  %97 = load i64, i64* %_32, align 8
  %add51 = add nsw i64 %96, %97
  store i64 %add51, i64* %_33, align 8
  %98 = load i64, i64* %_33, align 8
  store i64 %98, i64* %i, align 8
  br label %blklab14

blklab14:                                         ; preds = %blklab15
  br label %while.body

blklab13:                                         ; preds = %if.then13
  %99 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %width52 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %99, i32 0, i32 3
  %100 = load i64, i64* %width52, align 8
  store i64 %100, i64* %_35, align 8
  %101 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %height53 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %101, i32 0, i32 4
  %102 = load i64, i64* %height53, align 8
  store i64 %102, i64* %_36, align 8
  %103 = load i8, i8* %_34_has_ownership, align 1
  %tobool54 = trunc i8 %103 to i1
  br i1 %tobool54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %blklab13
  %104 = load %struct.Matrix*, %struct.Matrix** %_34, align 8
  call void @free_Matrix(%struct.Matrix* %104)
  store i8 0, i8* %_34_has_ownership, align 1
  br label %if.end56

if.end56:                                         ; preds = %if.then55, %blklab13
  store i8 1, i8* %C_data_has_ownership, align 1
  %105 = load i64, i64* %_35, align 8
  %106 = load i64, i64* %_36, align 8
  %107 = load i64**, i64*** %C_data, align 8
  %108 = load i64, i64* %C_data_size, align 8
  %109 = load i64, i64* %C_data_size_size, align 8
  %call57 = call i64** @copy2DArray(i64** %107, i64 %108, i64 %109)
  %110 = load i64, i64* %C_data_size, align 8
  %111 = load i64, i64* %C_data_size_size, align 8
  %call58 = call %struct.Matrix* @matrix(i64 %105, i64 %106, i64** %call57, i64 %110, i64 %111, i1 zeroext false)
  store %struct.Matrix* %call58, %struct.Matrix** %_34, align 8
  store i8 1, i8* %_34_has_ownership, align 1
  %112 = load i8, i8* %A_has_ownership.addr, align 1
  %tobool59 = trunc i8 %112 to i1
  br i1 %tobool59, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end56
  %113 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  call void @free_Matrix(%struct.Matrix* %113)
  store i8 0, i8* %A_has_ownership.addr, align 1
  br label %if.end61

if.end61:                                         ; preds = %if.then60, %if.end56
  %114 = load i8, i8* %B_has_ownership.addr, align 1
  %tobool62 = trunc i8 %114 to i1
  br i1 %tobool62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end61
  %115 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  call void @free_Matrix(%struct.Matrix* %115)
  store i8 0, i8* %B_has_ownership.addr, align 1
  br label %if.end64

if.end64:                                         ; preds = %if.then63, %if.end61
  %116 = load i8, i8* %C_has_ownership, align 1
  %tobool65 = trunc i8 %116 to i1
  br i1 %tobool65, label %if.then66, label %if.end67

if.then66:                                        ; preds = %if.end64
  %117 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  call void @free_Matrix(%struct.Matrix* %117)
  store i8 0, i8* %C_has_ownership, align 1
  br label %if.end67

if.end67:                                         ; preds = %if.then66, %if.end64
  %118 = load i8, i8* %C_data_has_ownership, align 1
  %tobool68 = trunc i8 %118 to i1
  br i1 %tobool68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.end67
  %119 = load i64**, i64*** %C_data, align 8
  %120 = load i64, i64* %C_data_size, align 8
  call void @free2DArray(i64** %119, i64 %120)
  store i8 0, i8* %C_data_has_ownership, align 1
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %if.end67
  %121 = load i8, i8* %_10_has_ownership, align 1
  %tobool71 = trunc i8 %121 to i1
  br i1 %tobool71, label %if.then72, label %if.end73

if.then72:                                        ; preds = %if.end70
  %122 = load i64*, i64** %_10, align 8
  %123 = bitcast i64* %122 to i8*
  call void @free(i8* %123) #4
  store i8 0, i8* %_10_has_ownership, align 1
  br label %if.end73

if.end73:                                         ; preds = %if.then72, %if.end70
  %124 = load i8, i8* %_12_has_ownership, align 1
  %tobool74 = trunc i8 %124 to i1
  br i1 %tobool74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end73
  %125 = load i64**, i64*** %_12, align 8
  %126 = load i64, i64* %_12_size, align 8
  call void @free2DArray(i64** %125, i64 %126)
  store i8 0, i8* %_12_has_ownership, align 1
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %if.end73
  %127 = load i8, i8* %_20_has_ownership, align 1
  %tobool77 = trunc i8 %127 to i1
  br i1 %tobool77, label %if.then78, label %if.end79

if.then78:                                        ; preds = %if.end76
  %128 = load i64**, i64*** %_20, align 8
  %129 = load i64, i64* %_20_size, align 8
  call void @free2DArray(i64** %128, i64 %129)
  store i8 0, i8* %_20_has_ownership, align 1
  br label %if.end79

if.end79:                                         ; preds = %if.then78, %if.end76
  %130 = load i8, i8* %_21_has_ownership, align 1
  %tobool80 = trunc i8 %130 to i1
  br i1 %tobool80, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.end79
  %131 = load i64*, i64** %_21, align 8
  %132 = bitcast i64* %131 to i8*
  call void @free(i8* %132) #4
  store i8 0, i8* %_21_has_ownership, align 1
  br label %if.end82

if.end82:                                         ; preds = %if.then81, %if.end79
  %133 = load i8, i8* %_23_has_ownership, align 1
  %tobool83 = trunc i8 %133 to i1
  br i1 %tobool83, label %if.then84, label %if.end85

if.then84:                                        ; preds = %if.end82
  %134 = load i64**, i64*** %_23, align 8
  %135 = load i64, i64* %_23_size, align 8
  call void @free2DArray(i64** %134, i64 %135)
  store i8 0, i8* %_23_has_ownership, align 1
  br label %if.end85

if.end85:                                         ; preds = %if.then84, %if.end82
  %136 = load i8, i8* %_24_has_ownership, align 1
  %tobool86 = trunc i8 %136 to i1
  br i1 %tobool86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end85
  %137 = load i64*, i64** %_24, align 8
  %138 = bitcast i64* %137 to i8*
  call void @free(i8* %138) #4
  store i8 0, i8* %_24_has_ownership, align 1
  br label %if.end88

if.end88:                                         ; preds = %if.then87, %if.end85
  %139 = load %struct.Matrix*, %struct.Matrix** %_34, align 8
  ret %struct.Matrix* %139
}

declare i64* @gen1DArray(i32, i32) #2

declare i64** @gen2DArray(i64*, i64, i64) #2

; Function Attrs: nounwind uwtable
define void @printMat(%struct._IO_FILE* %sys, %struct.Matrix* %A, i1 zeroext %A_has_ownership) #0 {
entry:
  %sys.addr = alloca %struct._IO_FILE*, align 8
  %A.addr = alloca %struct.Matrix*, align 8
  %A_has_ownership.addr = alloca i8, align 1
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
  %_10_has_ownership = alloca i8, align 1
  %_11 = alloca i64*, align 8
  %_11_size = alloca i64, align 8
  %_11_has_ownership = alloca i8, align 1
  %_12 = alloca i64, align 8
  %_13 = alloca i8*, align 8
  %_15 = alloca i64*, align 8
  %_15_size = alloca i64, align 8
  %_15_has_ownership = alloca i8, align 1
  %_16 = alloca i64, align 8
  %_17 = alloca i64, align 8
  %_18 = alloca i64, align 8
  %_19 = alloca i64, align 8
  %_20 = alloca i8*, align 8
  %_22 = alloca i64*, align 8
  %_22_size = alloca i64, align 8
  %_22_has_ownership = alloca i8, align 1
  store %struct._IO_FILE* %sys, %struct._IO_FILE** %sys.addr, align 8
  store %struct.Matrix* %A, %struct.Matrix** %A.addr, align 8
  %frombool = zext i1 %A_has_ownership to i8
  store i8 %frombool, i8* %A_has_ownership.addr, align 1
  store i64 0, i64* %i, align 8
  store i64 0, i64* %j, align 8
  store i64 0, i64* %_4, align 8
  store i64 0, i64* %_5, align 8
  store i64 0, i64* %_6, align 8
  store i64 0, i64* %_7, align 8
  store i64** null, i64*** %_10, align 8
  store i64 0, i64* %_10_size, align 8
  store i64 0, i64* %_10_size_size, align 8
  store i8 0, i8* %_10_has_ownership, align 1
  store i64* null, i64** %_11, align 8
  store i64 0, i64* %_11_size, align 8
  store i8 0, i8* %_11_has_ownership, align 1
  store i64 0, i64* %_12, align 8
  store i64* null, i64** %_15, align 8
  store i64 0, i64* %_15_size, align 8
  store i8 0, i8* %_15_has_ownership, align 1
  store i64 0, i64* %_16, align 8
  store i64 0, i64* %_17, align 8
  store i64 0, i64* %_18, align 8
  store i64 0, i64* %_19, align 8
  store i64* null, i64** %_22, align 8
  store i64 0, i64* %_22_size, align 8
  store i8 0, i8* %_22_has_ownership, align 1
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
  %10 = load i8, i8* %_10_has_ownership, align 1
  %tobool = trunc i8 %10 to i1
  br i1 %tobool, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end5
  %11 = load i64**, i64*** %_10, align 8
  %12 = load i64, i64* %_10_size, align 8
  call void @free2DArray(i64** %11, i64 %12)
  store i8 0, i8* %_10_has_ownership, align 1
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end5
  %13 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %13, i32 0, i32 1
  %14 = load i64, i64* %data_size, align 8
  store i64 %14, i64* %_10_size, align 8
  %15 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %15, i32 0, i32 2
  %16 = load i64, i64* %data_size_size, align 8
  store i64 %16, i64* %_10_size_size, align 8
  %17 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %17, i32 0, i32 0
  %18 = load i64**, i64*** %data, align 8
  %19 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size8 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %19, i32 0, i32 1
  %20 = load i64, i64* %data_size8, align 8
  %21 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data_size_size9 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %21, i32 0, i32 2
  %22 = load i64, i64* %data_size_size9, align 8
  %call = call i64** @copy2DArray(i64** %18, i64 %20, i64 %22)
  store i64** %call, i64*** %_10, align 8
  store i8 1, i8* %_10_has_ownership, align 1
  %23 = load i64, i64* %i, align 8
  %24 = load i64**, i64*** %_10, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %24, i64 %23
  %25 = load i64*, i64** %arrayidx, align 8
  store i64* %25, i64** %_11, align 8
  %26 = load i64, i64* %j, align 8
  %27 = load i64*, i64** %_11, align 8
  %arrayidx10 = getelementptr inbounds i64, i64* %27, i64 %26
  %28 = load i64, i64* %arrayidx10, align 8
  store i64 %28, i64* %_12, align 8
  %29 = load i64, i64* %_12, align 8
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i64 %29)
  %30 = load i8, i8* %_15_has_ownership, align 1
  %tobool12 = trunc i8 %30 to i1
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end7
  %31 = load i64*, i64** %_15, align 8
  %32 = bitcast i64* %31 to i8*
  call void @free(i8* %32) #4
  store i8 0, i8* %_15_has_ownership, align 1
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.end7
  store i64 1, i64* %_15_size, align 8
  %call15 = call noalias i8* @malloc(i64 8) #4
  %33 = bitcast i8* %call15 to i64*
  store i64* %33, i64** %_15, align 8
  %34 = load i64*, i64** %_15, align 8
  %arrayidx16 = getelementptr inbounds i64, i64* %34, i64 0
  store i64 32, i64* %arrayidx16, align 8
  store i8 1, i8* %_15_has_ownership, align 1
  %35 = load i64*, i64** %_15, align 8
  %36 = load i64, i64* %_15_size, align 8
  call void @printf_s(i64* %35, i64 %36)
  store i64 1, i64* %_16, align 8
  %37 = load i64, i64* %j, align 8
  %38 = load i64, i64* %_16, align 8
  %add = add nsw i64 %37, %38
  store i64 %add, i64* %_17, align 8
  %39 = load i64, i64* %_17, align 8
  store i64 %39, i64* %j, align 8
  br label %blklab22

blklab22:                                         ; preds = %if.end14
  br label %while.body2

blklab21:                                         ; preds = %if.then4
  store i64 1, i64* %_18, align 8
  %40 = load i64, i64* %i, align 8
  %41 = load i64, i64* %_18, align 8
  %add17 = add nsw i64 %40, %41
  store i64 %add17, i64* %_19, align 8
  %42 = load i64, i64* %_19, align 8
  store i64 %42, i64* %i, align 8
  %43 = load i8, i8* %_22_has_ownership, align 1
  %tobool18 = trunc i8 %43 to i1
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %blklab21
  %44 = load i64*, i64** %_22, align 8
  %45 = bitcast i64* %44 to i8*
  call void @free(i8* %45) #4
  store i8 0, i8* %_22_has_ownership, align 1
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %blklab21
  store i64 0, i64* %_22_size, align 8
  %call21 = call noalias i8* @malloc(i64 0) #4
  %46 = bitcast i8* %call21 to i64*
  store i64* %46, i64** %_22, align 8
  store i8 1, i8* %_22_has_ownership, align 1
  %47 = load i64*, i64** %_22, align 8
  %48 = load i64, i64* %_22_size, align 8
  call void @println_s(i64* %47, i64 %48)
  br label %blklab20

blklab20:                                         ; preds = %if.end20
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
  %r_has_ownership = alloca i8, align 1
  %rows = alloca i64**, align 8
  %rows_size = alloca i64, align 8
  %rows_size_size = alloca i64, align 8
  %rows_has_ownership = alloca i8, align 1
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64*, align 8
  %_7_size = alloca i64, align 8
  %_7_has_ownership = alloca i8, align 1
  %_8 = alloca i64**, align 8
  %_8_size = alloca i64, align 8
  %_8_size_size = alloca i64, align 8
  %_8_has_ownership = alloca i8, align 1
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64, align 8
  %_13 = alloca i64, align 8
  %_14 = alloca i64, align 8
  %_15 = alloca i64, align 8
  %_16 = alloca %struct.Matrix*, align 8
  %_16_has_ownership = alloca i8, align 1
  store i64 %height, i64* %height.addr, align 8
  store i64 %width, i64* %width.addr, align 8
  store i8 0, i8* %r_has_ownership, align 1
  store i64** null, i64*** %rows, align 8
  store i64 0, i64* %rows_size, align 8
  store i64 0, i64* %rows_size_size, align 8
  store i8 0, i8* %rows_has_ownership, align 1
  store i64 0, i64* %i, align 8
  store i64 0, i64* %j, align 8
  store i64 0, i64* %_6, align 8
  store i64* null, i64** %_7, align 8
  store i64 0, i64* %_7_size, align 8
  store i8 0, i8* %_7_has_ownership, align 1
  store i64** null, i64*** %_8, align 8
  store i64 0, i64* %_8_size, align 8
  store i64 0, i64* %_8_size_size, align 8
  store i8 0, i8* %_8_has_ownership, align 1
  store i64 0, i64* %_9, align 8
  store i64 0, i64* %_10, align 8
  store i64 0, i64* %_11, align 8
  store i64 0, i64* %_12, align 8
  store i64 0, i64* %_13, align 8
  store i64 0, i64* %_14, align 8
  store i64 0, i64* %_15, align 8
  store i8 0, i8* %_16_has_ownership, align 1
  store i64 0, i64* %_6, align 8
  %0 = load i8, i8* %_7_has_ownership, align 1
  %tobool = trunc i8 %0 to i1
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64*, i64** %_7, align 8
  %2 = bitcast i64* %1 to i8*
  call void @free(i8* %2) #4
  store i8 0, i8* %_7_has_ownership, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i64, i64* %width.addr, align 8
  store i64 %3, i64* %_7_size, align 8
  %4 = load i64, i64* %_6, align 8
  %conv = trunc i64 %4 to i32
  %5 = load i64, i64* %_7_size, align 8
  %conv1 = trunc i64 %5 to i32
  %call = call i64* @gen1DArray(i32 %conv, i32 %conv1)
  store i64* %call, i64** %_7, align 8
  store i8 1, i8* %_7_has_ownership, align 1
  %6 = load i8, i8* %_8_has_ownership, align 1
  %tobool2 = trunc i8 %6 to i1
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %7 = load i64**, i64*** %_8, align 8
  %8 = load i64, i64* %_8_size, align 8
  call void @free2DArray(i64** %7, i64 %8)
  store i8 0, i8* %_8_has_ownership, align 1
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %9 = load i64, i64* %height.addr, align 8
  store i64 %9, i64* %_8_size, align 8
  %10 = load i64, i64* %_7_size, align 8
  store i64 %10, i64* %_8_size_size, align 8
  %11 = load i64*, i64** %_7, align 8
  %12 = load i64, i64* %_8_size, align 8
  %13 = load i64, i64* %_8_size_size, align 8
  %call5 = call i64** @gen2DArray(i64* %11, i64 %12, i64 %13)
  store i64** %call5, i64*** %_8, align 8
  store i8 1, i8* %_8_has_ownership, align 1
  %14 = load i8, i8* %rows_has_ownership, align 1
  %tobool6 = trunc i8 %14 to i1
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  %15 = load i64**, i64*** %rows, align 8
  %16 = load i64, i64* %rows_size, align 8
  call void @free2DArray(i64** %15, i64 %16)
  store i8 0, i8* %rows_has_ownership, align 1
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end4
  %17 = load i64, i64* %_8_size, align 8
  store i64 %17, i64* %rows_size, align 8
  %18 = load i64, i64* %_8_size_size, align 8
  store i64 %18, i64* %rows_size_size, align 8
  %19 = load i64**, i64*** %_8, align 8
  %20 = load i64, i64* %_8_size, align 8
  %21 = load i64, i64* %_8_size_size, align 8
  %call9 = call i64** @copy2DArray(i64** %19, i64 %20, i64 %21)
  store i64** %call9, i64*** %rows, align 8
  store i8 1, i8* %rows_has_ownership, align 1
  store i8 1, i8* %_8_has_ownership, align 1
  store i64 0, i64* %_9, align 8
  %22 = load i64, i64* %_9, align 8
  store i64 %22, i64* %i, align 8
  br label %while.body

while.body:                                       ; preds = %if.end8, %blklab24
  %23 = load i64, i64* %i, align 8
  %24 = load i64, i64* %height.addr, align 8
  %cmp = icmp sge i64 %23, %24
  br i1 %cmp, label %if.then11, label %if.end12

if.then11:                                        ; preds = %while.body
  br label %blklab23

if.end12:                                         ; preds = %while.body
  store i64 0, i64* %_10, align 8
  %25 = load i64, i64* %_10, align 8
  store i64 %25, i64* %j, align 8
  br label %while.body14

while.body14:                                     ; preds = %if.end12, %blklab26
  %26 = load i64, i64* %j, align 8
  %27 = load i64, i64* %width.addr, align 8
  %cmp15 = icmp sge i64 %26, %27
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %while.body14
  br label %blklab25

if.end18:                                         ; preds = %while.body14
  store i64 1, i64* %_11, align 8
  %28 = load i64, i64* %_11, align 8
  %29 = load i64, i64* %j, align 8
  %30 = load i64, i64* %i, align 8
  %31 = load i64**, i64*** %rows, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %31, i64 %30
  %32 = load i64*, i64** %arrayidx, align 8
  %arrayidx19 = getelementptr inbounds i64, i64* %32, i64 %29
  store i64 %28, i64* %arrayidx19, align 8
  store i64 1, i64* %_12, align 8
  %33 = load i64, i64* %j, align 8
  %34 = load i64, i64* %_12, align 8
  %add = add nsw i64 %33, %34
  store i64 %add, i64* %_13, align 8
  %35 = load i64, i64* %_13, align 8
  store i64 %35, i64* %j, align 8
  br label %blklab26

blklab26:                                         ; preds = %if.end18
  br label %while.body14

blklab25:                                         ; preds = %if.then17
  store i64 1, i64* %_14, align 8
  %36 = load i64, i64* %i, align 8
  %37 = load i64, i64* %_14, align 8
  %add20 = add nsw i64 %36, %37
  store i64 %add20, i64* %_15, align 8
  %38 = load i64, i64* %_15, align 8
  store i64 %38, i64* %i, align 8
  br label %blklab24

blklab24:                                         ; preds = %blklab25
  br label %while.body

blklab23:                                         ; preds = %if.then11
  %39 = load i8, i8* %_16_has_ownership, align 1
  %tobool21 = trunc i8 %39 to i1
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %blklab23
  %40 = load %struct.Matrix*, %struct.Matrix** %_16, align 8
  call void @free_Matrix(%struct.Matrix* %40)
  store i8 0, i8* %_16_has_ownership, align 1
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %blklab23
  store i8 1, i8* %rows_has_ownership, align 1
  %41 = load i64, i64* %width.addr, align 8
  %42 = load i64, i64* %height.addr, align 8
  %43 = load i64**, i64*** %rows, align 8
  %44 = load i64, i64* %rows_size, align 8
  %45 = load i64, i64* %rows_size_size, align 8
  %call24 = call i64** @copy2DArray(i64** %43, i64 %44, i64 %45)
  %46 = load i64, i64* %rows_size, align 8
  %47 = load i64, i64* %rows_size_size, align 8
  %call25 = call %struct.Matrix* @matrix(i64 %41, i64 %42, i64** %call24, i64 %46, i64 %47, i1 zeroext false)
  store %struct.Matrix* %call25, %struct.Matrix** %_16, align 8
  store i8 1, i8* %_16_has_ownership, align 1
  %48 = load i8, i8* %r_has_ownership, align 1
  %tobool26 = trunc i8 %48 to i1
  br i1 %tobool26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end23
  %49 = load %struct.Matrix*, %struct.Matrix** %r, align 8
  call void @free_Matrix(%struct.Matrix* %49)
  store i8 0, i8* %r_has_ownership, align 1
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %if.end23
  %50 = load i8, i8* %rows_has_ownership, align 1
  %tobool29 = trunc i8 %50 to i1
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end28
  %51 = load i64**, i64*** %rows, align 8
  %52 = load i64, i64* %rows_size, align 8
  call void @free2DArray(i64** %51, i64 %52)
  store i8 0, i8* %rows_has_ownership, align 1
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.end28
  %53 = load i8, i8* %_7_has_ownership, align 1
  %tobool32 = trunc i8 %53 to i1
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end31
  %54 = load i64*, i64** %_7, align 8
  %55 = bitcast i64* %54 to i8*
  call void @free(i8* %55) #4
  store i8 0, i8* %_7_has_ownership, align 1
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.end31
  %56 = load i8, i8* %_8_has_ownership, align 1
  %tobool35 = trunc i8 %56 to i1
  br i1 %tobool35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end34
  %57 = load i64**, i64*** %_8, align 8
  %58 = load i64, i64* %_8_size, align 8
  call void @free2DArray(i64** %57, i64 %58)
  store i8 0, i8* %_8_has_ownership, align 1
  br label %if.end37

if.end37:                                         ; preds = %if.then36, %if.end34
  %59 = load %struct.Matrix*, %struct.Matrix** %_16, align 8
  ret %struct.Matrix* %59
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %max = alloca i64, align 8
  %A = alloca %struct.Matrix*, align 8
  %A_has_ownership = alloca i8, align 1
  %B = alloca %struct.Matrix*, align 8
  %B_has_ownership = alloca i8, align 1
  %C = alloca %struct.Matrix*, align 8
  %C_has_ownership = alloca i8, align 1
  %_5 = alloca i64, align 8
  %_6 = alloca i64**, align 8
  %_6_size = alloca i64, align 8
  %_6_size_size = alloca i64, align 8
  %_6_has_ownership = alloca i8, align 1
  %_7 = alloca i64, align 8
  %_8 = alloca i64*, align 8
  %_8_size = alloca i64, align 8
  %_8_has_ownership = alloca i8, align 1
  %_9 = alloca %struct.Matrix*, align 8
  %_9_has_ownership = alloca i8, align 1
  %_10 = alloca %struct.Matrix*, align 8
  %_10_has_ownership = alloca i8, align 1
  %_11 = alloca %struct.Matrix*, align 8
  %_11_has_ownership = alloca i8, align 1
  %_12 = alloca i64**, align 8
  %_12_size = alloca i64, align 8
  %_12_size_size = alloca i64, align 8
  %_12_has_ownership = alloca i8, align 1
  %_13 = alloca i64, align 8
  %_14 = alloca i64*, align 8
  %_14_size = alloca i64, align 8
  %_14_has_ownership = alloca i8, align 1
  %_15 = alloca i64, align 8
  %_16 = alloca i64, align 8
  %_17 = alloca i64, align 8
  %_18 = alloca i64, align 8
  %_19 = alloca i8*, align 8
  %_21 = alloca i64*, align 8
  %_21_size = alloca i64, align 8
  %_21_has_ownership = alloca i8, align 1
  %_22 = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  store i8 0, i8* %A_has_ownership, align 1
  store i8 0, i8* %B_has_ownership, align 1
  store i8 0, i8* %C_has_ownership, align 1
  store i64** null, i64*** %_6, align 8
  store i64 0, i64* %_6_size, align 8
  store i64 0, i64* %_6_size_size, align 8
  store i8 0, i8* %_6_has_ownership, align 1
  store i64 0, i64* %_7, align 8
  store i64* null, i64** %_8, align 8
  store i64 0, i64* %_8_size, align 8
  store i8 0, i8* %_8_has_ownership, align 1
  store i8 0, i8* %_9_has_ownership, align 1
  store i8 0, i8* %_10_has_ownership, align 1
  store i8 0, i8* %_11_has_ownership, align 1
  store i64** null, i64*** %_12, align 8
  store i64 0, i64* %_12_size, align 8
  store i64 0, i64* %_12_size_size, align 8
  store i8 0, i8* %_12_has_ownership, align 1
  store i64 0, i64* %_13, align 8
  store i64* null, i64** %_14, align 8
  store i64 0, i64* %_14_size, align 8
  store i8 0, i8* %_14_has_ownership, align 1
  store i64 0, i64* %_15, align 8
  store i64 0, i64* %_16, align 8
  store i64 0, i64* %_17, align 8
  store i64 0, i64* %_18, align 8
  store i64* null, i64** %_21, align 8
  store i64 0, i64* %_21_size, align 8
  store i8 0, i8* %_21_has_ownership, align 1
  %0 = load i32, i32* %argc.addr, align 4
  %1 = load i8**, i8*** %args.addr, align 8
  %call = call i64** @convertArgsToIntArray(i32 %0, i8** %1)
  store i64** %call, i64*** %_6, align 8
  %2 = load i32, i32* %argc.addr, align 4
  %sub = sub nsw i32 %2, 1
  %conv = sext i32 %sub to i64
  store i64 %conv, i64* %_6_size, align 8
  store i8 1, i8* %_6_has_ownership, align 1
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
  %10 = load i8, i8* %_9_has_ownership, align 1
  %tobool = trunc i8 %10 to i1
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %11 = load %struct.Matrix*, %struct.Matrix** %_9, align 8
  call void @free_Matrix(%struct.Matrix* %11)
  store i8 0, i8* %_9_has_ownership, align 1
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %12 = load i64, i64* %max, align 8
  %13 = load i64, i64* %max, align 8
  %call5 = call %struct.Matrix* @genMatrix(i64 %12, i64 %13)
  store %struct.Matrix* %call5, %struct.Matrix** %_9, align 8
  store i8 1, i8* %_9_has_ownership, align 1
  %14 = load i8, i8* %A_has_ownership, align 1
  %tobool6 = trunc i8 %14 to i1
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  %15 = load %struct.Matrix*, %struct.Matrix** %A, align 8
  call void @free_Matrix(%struct.Matrix* %15)
  store i8 0, i8* %A_has_ownership, align 1
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end4
  %16 = load %struct.Matrix*, %struct.Matrix** %_9, align 8
  %call9 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %16)
  store %struct.Matrix* %call9, %struct.Matrix** %A, align 8
  store i8 1, i8* %A_has_ownership, align 1
  store i8 1, i8* %_9_has_ownership, align 1
  %17 = load i8, i8* %_10_has_ownership, align 1
  %tobool10 = trunc i8 %17 to i1
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  %18 = load %struct.Matrix*, %struct.Matrix** %_10, align 8
  call void @free_Matrix(%struct.Matrix* %18)
  store i8 0, i8* %_10_has_ownership, align 1
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end8
  %19 = load i64, i64* %max, align 8
  %20 = load i64, i64* %max, align 8
  %call13 = call %struct.Matrix* @genMatrix(i64 %19, i64 %20)
  store %struct.Matrix* %call13, %struct.Matrix** %_10, align 8
  store i8 1, i8* %_10_has_ownership, align 1
  %21 = load i8, i8* %B_has_ownership, align 1
  %tobool14 = trunc i8 %21 to i1
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  %22 = load %struct.Matrix*, %struct.Matrix** %B, align 8
  call void @free_Matrix(%struct.Matrix* %22)
  store i8 0, i8* %B_has_ownership, align 1
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end12
  %23 = load %struct.Matrix*, %struct.Matrix** %_10, align 8
  %call17 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %23)
  store %struct.Matrix* %call17, %struct.Matrix** %B, align 8
  store i8 1, i8* %B_has_ownership, align 1
  store i8 1, i8* %_10_has_ownership, align 1
  %24 = load i8, i8* %_11_has_ownership, align 1
  %tobool18 = trunc i8 %24 to i1
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  %25 = load %struct.Matrix*, %struct.Matrix** %_11, align 8
  call void @free_Matrix(%struct.Matrix* %25)
  store i8 0, i8* %_11_has_ownership, align 1
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.end16
  store i8 1, i8* %A_has_ownership, align 1
  store i8 1, i8* %B_has_ownership, align 1
  %26 = load %struct.Matrix*, %struct.Matrix** %A, align 8
  %call21 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %26)
  %27 = load %struct.Matrix*, %struct.Matrix** %B, align 8
  %call22 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %27)
  %call23 = call %struct.Matrix* @multiply(%struct.Matrix* %call21, i1 zeroext false, %struct.Matrix* %call22, i1 zeroext false)
  store %struct.Matrix* %call23, %struct.Matrix** %_11, align 8
  store i8 1, i8* %_11_has_ownership, align 1
  %28 = load i8, i8* %C_has_ownership, align 1
  %tobool24 = trunc i8 %28 to i1
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end20
  %29 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  call void @free_Matrix(%struct.Matrix* %29)
  store i8 0, i8* %C_has_ownership, align 1
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end20
  %30 = load %struct.Matrix*, %struct.Matrix** %_11, align 8
  %call27 = call %struct.Matrix* @copy_Matrix(%struct.Matrix* %30)
  store %struct.Matrix* %call27, %struct.Matrix** %C, align 8
  store i8 1, i8* %C_has_ownership, align 1
  store i8 1, i8* %_11_has_ownership, align 1
  %31 = load i8, i8* %_12_has_ownership, align 1
  %tobool28 = trunc i8 %31 to i1
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end26
  %32 = load i64**, i64*** %_12, align 8
  %33 = load i64, i64* %_12_size, align 8
  call void @free2DArray(i64** %32, i64 %33)
  store i8 0, i8* %_12_has_ownership, align 1
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.end26
  %34 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %34, i32 0, i32 1
  %35 = load i64, i64* %data_size, align 8
  store i64 %35, i64* %_12_size, align 8
  %36 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data_size_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %36, i32 0, i32 2
  %37 = load i64, i64* %data_size_size, align 8
  store i64 %37, i64* %_12_size_size, align 8
  %38 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %38, i32 0, i32 0
  %39 = load i64**, i64*** %data, align 8
  %40 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data_size31 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %40, i32 0, i32 1
  %41 = load i64, i64* %data_size31, align 8
  %42 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data_size_size32 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %42, i32 0, i32 2
  %43 = load i64, i64* %data_size_size32, align 8
  %call33 = call i64** @copy2DArray(i64** %39, i64 %41, i64 %43)
  store i64** %call33, i64*** %_12, align 8
  store i8 1, i8* %_12_has_ownership, align 1
  store i64 0, i64* %_13, align 8
  %44 = load i64, i64* %_13, align 8
  %45 = load i64**, i64*** %_12, align 8
  %arrayidx34 = getelementptr inbounds i64*, i64** %45, i64 %44
  %46 = load i64*, i64** %arrayidx34, align 8
  store i64* %46, i64** %_14, align 8
  store i64 0, i64* %_15, align 8
  %47 = load i64, i64* %_15, align 8
  %48 = load i64*, i64** %_14, align 8
  %arrayidx35 = getelementptr inbounds i64, i64* %48, i64 %47
  %49 = load i64, i64* %arrayidx35, align 8
  store i64 %49, i64* %_16, align 8
  %50 = load i64, i64* %_16, align 8
  %51 = load i64, i64* %max, align 8
  %cmp36 = icmp eq i64 %50, %51
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end30
  br label %blklab28

if.end39:                                         ; preds = %if.end30
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab28:                                         ; preds = %if.then38
  %53 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %53, i32 0, i32 3
  %54 = load i64, i64* %width, align 8
  store i64 %54, i64* %_17, align 8
  %55 = load i64, i64* %_17, align 8
  %56 = load i64, i64* %max, align 8
  %cmp41 = icmp eq i64 %55, %56
  br i1 %cmp41, label %if.then43, label %if.end44

if.then43:                                        ; preds = %blklab28
  br label %blklab29

if.end44:                                         ; preds = %blklab28
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab29:                                         ; preds = %if.then43
  %58 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %58, i32 0, i32 4
  %59 = load i64, i64* %height, align 8
  store i64 %59, i64* %_18, align 8
  %60 = load i64, i64* %_18, align 8
  %61 = load i64, i64* %max, align 8
  %cmp46 = icmp eq i64 %60, %61
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %blklab29
  br label %blklab30

if.end49:                                         ; preds = %blklab29
  %62 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call50 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab30:                                         ; preds = %if.then48
  %63 = load i8, i8* %_21_has_ownership, align 1
  %tobool51 = trunc i8 %63 to i1
  br i1 %tobool51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %blklab30
  %64 = load i64*, i64** %_21, align 8
  %65 = bitcast i64* %64 to i8*
  call void @free(i8* %65) #4
  store i8 0, i8* %_21_has_ownership, align 1
  br label %if.end53

if.end53:                                         ; preds = %if.then52, %blklab30
  store i64 39, i64* %_21_size, align 8
  %call54 = call noalias i8* @malloc(i64 312) #4
  %66 = bitcast i8* %call54 to i64*
  store i64* %66, i64** %_21, align 8
  %67 = load i64*, i64** %_21, align 8
  %arrayidx55 = getelementptr inbounds i64, i64* %67, i64 0
  store i64 80, i64* %arrayidx55, align 8
  %68 = load i64*, i64** %_21, align 8
  %arrayidx56 = getelementptr inbounds i64, i64* %68, i64 1
  store i64 97, i64* %arrayidx56, align 8
  %69 = load i64*, i64** %_21, align 8
  %arrayidx57 = getelementptr inbounds i64, i64* %69, i64 2
  store i64 115, i64* %arrayidx57, align 8
  %70 = load i64*, i64** %_21, align 8
  %arrayidx58 = getelementptr inbounds i64, i64* %70, i64 3
  store i64 115, i64* %arrayidx58, align 8
  %71 = load i64*, i64** %_21, align 8
  %arrayidx59 = getelementptr inbounds i64, i64* %71, i64 4
  store i64 32, i64* %arrayidx59, align 8
  %72 = load i64*, i64** %_21, align 8
  %arrayidx60 = getelementptr inbounds i64, i64* %72, i64 5
  store i64 77, i64* %arrayidx60, align 8
  %73 = load i64*, i64** %_21, align 8
  %arrayidx61 = getelementptr inbounds i64, i64* %73, i64 6
  store i64 97, i64* %arrayidx61, align 8
  %74 = load i64*, i64** %_21, align 8
  %arrayidx62 = getelementptr inbounds i64, i64* %74, i64 7
  store i64 116, i64* %arrayidx62, align 8
  %75 = load i64*, i64** %_21, align 8
  %arrayidx63 = getelementptr inbounds i64, i64* %75, i64 8
  store i64 114, i64* %arrayidx63, align 8
  %76 = load i64*, i64** %_21, align 8
  %arrayidx64 = getelementptr inbounds i64, i64* %76, i64 9
  store i64 105, i64* %arrayidx64, align 8
  %77 = load i64*, i64** %_21, align 8
  %arrayidx65 = getelementptr inbounds i64, i64* %77, i64 10
  store i64 120, i64* %arrayidx65, align 8
  %78 = load i64*, i64** %_21, align 8
  %arrayidx66 = getelementptr inbounds i64, i64* %78, i64 11
  store i64 77, i64* %arrayidx66, align 8
  %79 = load i64*, i64** %_21, align 8
  %arrayidx67 = getelementptr inbounds i64, i64* %79, i64 12
  store i64 117, i64* %arrayidx67, align 8
  %80 = load i64*, i64** %_21, align 8
  %arrayidx68 = getelementptr inbounds i64, i64* %80, i64 13
  store i64 108, i64* %arrayidx68, align 8
  %81 = load i64*, i64** %_21, align 8
  %arrayidx69 = getelementptr inbounds i64, i64* %81, i64 14
  store i64 116, i64* %arrayidx69, align 8
  %82 = load i64*, i64** %_21, align 8
  %arrayidx70 = getelementptr inbounds i64, i64* %82, i64 15
  store i64 32, i64* %arrayidx70, align 8
  %83 = load i64*, i64** %_21, align 8
  %arrayidx71 = getelementptr inbounds i64, i64* %83, i64 16
  store i64 116, i64* %arrayidx71, align 8
  %84 = load i64*, i64** %_21, align 8
  %arrayidx72 = getelementptr inbounds i64, i64* %84, i64 17
  store i64 101, i64* %arrayidx72, align 8
  %85 = load i64*, i64** %_21, align 8
  %arrayidx73 = getelementptr inbounds i64, i64* %85, i64 18
  store i64 115, i64* %arrayidx73, align 8
  %86 = load i64*, i64** %_21, align 8
  %arrayidx74 = getelementptr inbounds i64, i64* %86, i64 19
  store i64 116, i64* %arrayidx74, align 8
  %87 = load i64*, i64** %_21, align 8
  %arrayidx75 = getelementptr inbounds i64, i64* %87, i64 20
  store i64 32, i64* %arrayidx75, align 8
  %88 = load i64*, i64** %_21, align 8
  %arrayidx76 = getelementptr inbounds i64, i64* %88, i64 21
  store i64 99, i64* %arrayidx76, align 8
  %89 = load i64*, i64** %_21, align 8
  %arrayidx77 = getelementptr inbounds i64, i64* %89, i64 22
  store i64 97, i64* %arrayidx77, align 8
  %90 = load i64*, i64** %_21, align 8
  %arrayidx78 = getelementptr inbounds i64, i64* %90, i64 23
  store i64 115, i64* %arrayidx78, align 8
  %91 = load i64*, i64** %_21, align 8
  %arrayidx79 = getelementptr inbounds i64, i64* %91, i64 24
  store i64 101, i64* %arrayidx79, align 8
  %92 = load i64*, i64** %_21, align 8
  %arrayidx80 = getelementptr inbounds i64, i64* %92, i64 25
  store i64 32, i64* %arrayidx80, align 8
  %93 = load i64*, i64** %_21, align 8
  %arrayidx81 = getelementptr inbounds i64, i64* %93, i64 26
  store i64 119, i64* %arrayidx81, align 8
  %94 = load i64*, i64** %_21, align 8
  %arrayidx82 = getelementptr inbounds i64, i64* %94, i64 27
  store i64 105, i64* %arrayidx82, align 8
  %95 = load i64*, i64** %_21, align 8
  %arrayidx83 = getelementptr inbounds i64, i64* %95, i64 28
  store i64 116, i64* %arrayidx83, align 8
  %96 = load i64*, i64** %_21, align 8
  %arrayidx84 = getelementptr inbounds i64, i64* %96, i64 29
  store i64 104, i64* %arrayidx84, align 8
  %97 = load i64*, i64** %_21, align 8
  %arrayidx85 = getelementptr inbounds i64, i64* %97, i64 30
  store i64 32, i64* %arrayidx85, align 8
  %98 = load i64*, i64** %_21, align 8
  %arrayidx86 = getelementptr inbounds i64, i64* %98, i64 31
  store i64 105, i64* %arrayidx86, align 8
  %99 = load i64*, i64** %_21, align 8
  %arrayidx87 = getelementptr inbounds i64, i64* %99, i64 32
  store i64 110, i64* %arrayidx87, align 8
  %100 = load i64*, i64** %_21, align 8
  %arrayidx88 = getelementptr inbounds i64, i64* %100, i64 33
  store i64 112, i64* %arrayidx88, align 8
  %101 = load i64*, i64** %_21, align 8
  %arrayidx89 = getelementptr inbounds i64, i64* %101, i64 34
  store i64 117, i64* %arrayidx89, align 8
  %102 = load i64*, i64** %_21, align 8
  %arrayidx90 = getelementptr inbounds i64, i64* %102, i64 35
  store i64 116, i64* %arrayidx90, align 8
  %103 = load i64*, i64** %_21, align 8
  %arrayidx91 = getelementptr inbounds i64, i64* %103, i64 36
  store i64 32, i64* %arrayidx91, align 8
  %104 = load i64*, i64** %_21, align 8
  %arrayidx92 = getelementptr inbounds i64, i64* %104, i64 37
  store i64 61, i64* %arrayidx92, align 8
  %105 = load i64*, i64** %_21, align 8
  %arrayidx93 = getelementptr inbounds i64, i64* %105, i64 38
  store i64 32, i64* %arrayidx93, align 8
  store i8 1, i8* %_21_has_ownership, align 1
  %106 = load i64*, i64** %_21, align 8
  %107 = load i64, i64* %_21_size, align 8
  call void @printf_s(i64* %106, i64 %107)
  %108 = load i64, i64* %max, align 8
  %call94 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i64 %108)
  br label %blklab27

blklab27:                                         ; preds = %if.end53, %if.then
  %109 = load i8, i8* %A_has_ownership, align 1
  %tobool95 = trunc i8 %109 to i1
  br i1 %tobool95, label %if.then96, label %if.end97

if.then96:                                        ; preds = %blklab27
  %110 = load %struct.Matrix*, %struct.Matrix** %A, align 8
  call void @free_Matrix(%struct.Matrix* %110)
  store i8 0, i8* %A_has_ownership, align 1
  br label %if.end97

if.end97:                                         ; preds = %if.then96, %blklab27
  %111 = load i8, i8* %B_has_ownership, align 1
  %tobool98 = trunc i8 %111 to i1
  br i1 %tobool98, label %if.then99, label %if.end100

if.then99:                                        ; preds = %if.end97
  %112 = load %struct.Matrix*, %struct.Matrix** %B, align 8
  call void @free_Matrix(%struct.Matrix* %112)
  store i8 0, i8* %B_has_ownership, align 1
  br label %if.end100

if.end100:                                        ; preds = %if.then99, %if.end97
  %113 = load i8, i8* %C_has_ownership, align 1
  %tobool101 = trunc i8 %113 to i1
  br i1 %tobool101, label %if.then102, label %if.end103

if.then102:                                       ; preds = %if.end100
  %114 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  call void @free_Matrix(%struct.Matrix* %114)
  store i8 0, i8* %C_has_ownership, align 1
  br label %if.end103

if.end103:                                        ; preds = %if.then102, %if.end100
  %115 = load i8, i8* %_6_has_ownership, align 1
  %tobool104 = trunc i8 %115 to i1
  br i1 %tobool104, label %if.then105, label %if.end106

if.then105:                                       ; preds = %if.end103
  %116 = load i64**, i64*** %_6, align 8
  %117 = load i64, i64* %_6_size, align 8
  call void @free2DArray(i64** %116, i64 %117)
  store i8 0, i8* %_6_has_ownership, align 1
  br label %if.end106

if.end106:                                        ; preds = %if.then105, %if.end103
  %118 = load i8, i8* %_8_has_ownership, align 1
  %tobool107 = trunc i8 %118 to i1
  br i1 %tobool107, label %if.then108, label %if.end109

if.then108:                                       ; preds = %if.end106
  %119 = load i64*, i64** %_8, align 8
  %120 = bitcast i64* %119 to i8*
  call void @free(i8* %120) #4
  store i8 0, i8* %_8_has_ownership, align 1
  br label %if.end109

if.end109:                                        ; preds = %if.then108, %if.end106
  %121 = load i8, i8* %_9_has_ownership, align 1
  %tobool110 = trunc i8 %121 to i1
  br i1 %tobool110, label %if.then111, label %if.end112

if.then111:                                       ; preds = %if.end109
  %122 = load %struct.Matrix*, %struct.Matrix** %_9, align 8
  call void @free_Matrix(%struct.Matrix* %122)
  store i8 0, i8* %_9_has_ownership, align 1
  br label %if.end112

if.end112:                                        ; preds = %if.then111, %if.end109
  %123 = load i8, i8* %_10_has_ownership, align 1
  %tobool113 = trunc i8 %123 to i1
  br i1 %tobool113, label %if.then114, label %if.end115

if.then114:                                       ; preds = %if.end112
  %124 = load %struct.Matrix*, %struct.Matrix** %_10, align 8
  call void @free_Matrix(%struct.Matrix* %124)
  store i8 0, i8* %_10_has_ownership, align 1
  br label %if.end115

if.end115:                                        ; preds = %if.then114, %if.end112
  %125 = load i8, i8* %_11_has_ownership, align 1
  %tobool116 = trunc i8 %125 to i1
  br i1 %tobool116, label %if.then117, label %if.end118

if.then117:                                       ; preds = %if.end115
  %126 = load %struct.Matrix*, %struct.Matrix** %_11, align 8
  call void @free_Matrix(%struct.Matrix* %126)
  store i8 0, i8* %_11_has_ownership, align 1
  br label %if.end118

if.end118:                                        ; preds = %if.then117, %if.end115
  %127 = load i8, i8* %_12_has_ownership, align 1
  %tobool119 = trunc i8 %127 to i1
  br i1 %tobool119, label %if.then120, label %if.end121

if.then120:                                       ; preds = %if.end118
  %128 = load i64**, i64*** %_12, align 8
  %129 = load i64, i64* %_12_size, align 8
  call void @free2DArray(i64** %128, i64 %129)
  store i8 0, i8* %_12_has_ownership, align 1
  br label %if.end121

if.end121:                                        ; preds = %if.then120, %if.end118
  %130 = load i8, i8* %_14_has_ownership, align 1
  %tobool122 = trunc i8 %130 to i1
  br i1 %tobool122, label %if.then123, label %if.end124

if.then123:                                       ; preds = %if.end121
  %131 = load i64*, i64** %_14, align 8
  %132 = bitcast i64* %131 to i8*
  call void @free(i8* %132) #4
  store i8 0, i8* %_14_has_ownership, align 1
  br label %if.end124

if.end124:                                        ; preds = %if.then123, %if.end121
  %133 = load i8, i8* %_21_has_ownership, align 1
  %tobool125 = trunc i8 %133 to i1
  br i1 %tobool125, label %if.then126, label %if.end127

if.then126:                                       ; preds = %if.end124
  %134 = load i64*, i64** %_21, align 8
  %135 = bitcast i64* %134 to i8*
  call void @free(i8* %135) #4
  store i8 0, i8* %_21_has_ownership, align 1
  br label %if.end127

if.end127:                                        ; preds = %if.then126, %if.end124
  call void @exit(i32 0) #5
  unreachable

return:                                           ; No predecessors!
  %136 = load i32, i32* %retval, align 4
  ret i32 %136
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

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 1f64ddbc4c5d1036b68ec896765a7535537ded85) (http://llvm.org/git/llvm.git 99a07120d47e1881a14a7b36bf7cf6bbd54954af)"}
