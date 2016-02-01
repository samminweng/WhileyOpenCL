; ModuleID = 'newTicTacToe.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Board = type { i64*, i64, i64 }

@.str = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c" pieces:\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c" move:\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.Board* @copy_Board(%struct.Board* %_Board) #0 {
entry:
  %_Board.addr = alloca %struct.Board*, align 8
  %new_Board = alloca %struct.Board*, align 8
  store %struct.Board* %_Board, %struct.Board** %_Board.addr, align 8
  %call = call noalias i8* @malloc(i64 24) #4
  %0 = bitcast i8* %call to %struct.Board*
  store %struct.Board* %0, %struct.Board** %new_Board, align 8
  %1 = load %struct.Board*, %struct.Board** %_Board.addr, align 8
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %1, i32 0, i32 1
  %2 = load i64, i64* %pieces_size, align 8
  %3 = load %struct.Board*, %struct.Board** %new_Board, align 8
  %pieces_size1 = getelementptr inbounds %struct.Board, %struct.Board* %3, i32 0, i32 1
  store i64 %2, i64* %pieces_size1, align 8
  %4 = load %struct.Board*, %struct.Board** %_Board.addr, align 8
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %4, i32 0, i32 0
  %5 = load i64*, i64** %pieces, align 8
  %6 = load %struct.Board*, %struct.Board** %_Board.addr, align 8
  %pieces_size2 = getelementptr inbounds %struct.Board, %struct.Board* %6, i32 0, i32 1
  %7 = load i64, i64* %pieces_size2, align 8
  %call3 = call i64* @copy(i64* %5, i64 %7)
  %8 = load %struct.Board*, %struct.Board** %new_Board, align 8
  %pieces4 = getelementptr inbounds %struct.Board, %struct.Board* %8, i32 0, i32 0
  store i64* %call3, i64** %pieces4, align 8
  %9 = load %struct.Board*, %struct.Board** %_Board.addr, align 8
  %move = getelementptr inbounds %struct.Board, %struct.Board* %9, i32 0, i32 2
  %10 = load i64, i64* %move, align 8
  %11 = load %struct.Board*, %struct.Board** %new_Board, align 8
  %move5 = getelementptr inbounds %struct.Board, %struct.Board* %11, i32 0, i32 2
  store i64 %10, i64* %move5, align 8
  %12 = load %struct.Board*, %struct.Board** %new_Board, align 8
  ret %struct.Board* %12
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i64* @copy(i64*, i64) #2

; Function Attrs: nounwind uwtable
define void @free_Board(%struct.Board* %board) #0 {
entry:
  %board.addr = alloca %struct.Board*, align 8
  store %struct.Board* %board, %struct.Board** %board.addr, align 8
  %0 = load %struct.Board*, %struct.Board** %board.addr, align 8
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %0, i32 0, i32 0
  %1 = load i64*, i64** %pieces, align 8
  %2 = bitcast i64* %1 to i8*
  call void @free(i8* %2) #4
  %3 = load %struct.Board*, %struct.Board** %board.addr, align 8
  %4 = bitcast %struct.Board* %3 to i8*
  call void @free(i8* %4) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @printf_Board(%struct.Board* %board) #0 {
entry:
  %board.addr = alloca %struct.Board*, align 8
  store %struct.Board* %board, %struct.Board** %board.addr, align 8
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0))
  %0 = load %struct.Board*, %struct.Board** %board.addr, align 8
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %0, i32 0, i32 0
  %1 = load i64*, i64** %pieces, align 8
  %2 = load %struct.Board*, %struct.Board** %board.addr, align 8
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %2, i32 0, i32 1
  %3 = load i64, i64* %pieces_size, align 8
  %call2 = call i32 (i64*, i64, ...) bitcast (i32 (...)* @printf1DArray to i32 (i64*, i64, ...)*)(i64* %1, i64 %3)
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0))
  %4 = load %struct.Board*, %struct.Board** %board.addr, align 8
  %move = getelementptr inbounds %struct.Board, %struct.Board* %4, i32 0, i32 2
  %5 = load i64, i64* %move, align 8
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i64 %5)
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #2

declare i32 @printf1DArray(...) #2

; Function Attrs: nounwind uwtable
define %struct.Board* @EmptyBoard() #0 {
entry:
  %r = alloca %struct.Board*, align 8
  %_1 = alloca i64, align 8
  %_2 = alloca i64, align 8
  %_3 = alloca i64, align 8
  %_4 = alloca i64, align 8
  %_5 = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64*, align 8
  %_11_size = alloca i64, align 8
  %_12 = alloca %struct.Board*, align 8
  store i64 0, i64* %_1, align 8
  store i64 0, i64* %_2, align 8
  store i64 0, i64* %_3, align 8
  store i64 0, i64* %_4, align 8
  store i64 0, i64* %_5, align 8
  store i64 0, i64* %_6, align 8
  store i64 0, i64* %_7, align 8
  store i64 0, i64* %_8, align 8
  store i64 0, i64* %_9, align 8
  store i64 0, i64* %_10, align 8
  store i64* null, i64** %_11, align 8
  store i64 0, i64* %_11_size, align 8
  store i64 0, i64* %_1, align 8
  store i64 0, i64* %_2, align 8
  store i64 0, i64* %_3, align 8
  store i64 0, i64* %_4, align 8
  store i64 0, i64* %_5, align 8
  store i64 0, i64* %_6, align 8
  store i64 0, i64* %_7, align 8
  store i64 0, i64* %_8, align 8
  store i64 0, i64* %_9, align 8
  store i64 0, i64* %_10, align 8
  store i64 9, i64* %_11_size, align 8
  %call = call noalias i8* @malloc(i64 72) #4
  %0 = bitcast i8* %call to i64*
  store i64* %0, i64** %_11, align 8
  %1 = load i64, i64* %_2, align 8
  %2 = load i64*, i64** %_11, align 8
  %arrayidx = getelementptr inbounds i64, i64* %2, i64 0
  store i64 %1, i64* %arrayidx, align 8
  %3 = load i64, i64* %_3, align 8
  %4 = load i64*, i64** %_11, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 1
  store i64 %3, i64* %arrayidx1, align 8
  %5 = load i64, i64* %_4, align 8
  %6 = load i64*, i64** %_11, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 2
  store i64 %5, i64* %arrayidx2, align 8
  %7 = load i64, i64* %_5, align 8
  %8 = load i64*, i64** %_11, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 3
  store i64 %7, i64* %arrayidx3, align 8
  %9 = load i64, i64* %_6, align 8
  %10 = load i64*, i64** %_11, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %10, i64 4
  store i64 %9, i64* %arrayidx4, align 8
  %11 = load i64, i64* %_7, align 8
  %12 = load i64*, i64** %_11, align 8
  %arrayidx5 = getelementptr inbounds i64, i64* %12, i64 5
  store i64 %11, i64* %arrayidx5, align 8
  %13 = load i64, i64* %_8, align 8
  %14 = load i64*, i64** %_11, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %14, i64 6
  store i64 %13, i64* %arrayidx6, align 8
  %15 = load i64, i64* %_9, align 8
  %16 = load i64*, i64** %_11, align 8
  %arrayidx7 = getelementptr inbounds i64, i64* %16, i64 7
  store i64 %15, i64* %arrayidx7, align 8
  %17 = load i64, i64* %_10, align 8
  %18 = load i64*, i64** %_11, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %18, i64 8
  store i64 %17, i64* %arrayidx8, align 8
  %call9 = call noalias i8* @malloc(i64 24) #4
  %19 = bitcast i8* %call9 to %struct.Board*
  store %struct.Board* %19, %struct.Board** %_12, align 8
  %20 = load i64, i64* %_1, align 8
  %21 = load %struct.Board*, %struct.Board** %_12, align 8
  %move = getelementptr inbounds %struct.Board, %struct.Board* %21, i32 0, i32 2
  store i64 %20, i64* %move, align 8
  %22 = load i64, i64* %_11_size, align 8
  %23 = load %struct.Board*, %struct.Board** %_12, align 8
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %23, i32 0, i32 1
  store i64 %22, i64* %pieces_size, align 8
  %24 = load i64*, i64** %_11, align 8
  %25 = load i64, i64* %_11_size, align 8
  %call10 = call i64* @copy(i64* %24, i64 %25)
  %26 = load %struct.Board*, %struct.Board** %_12, align 8
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %26, i32 0, i32 0
  store i64* %call10, i64** %pieces, align 8
  %27 = load %struct.Board*, %struct.Board** %_12, align 8
  ret %struct.Board* %27
}

; Function Attrs: nounwind uwtable
define i64 @countOf(i64* %pieces, i64 %pieces_size, i64 %s) #0 {
entry:
  %pieces.addr = alloca i64*, align 8
  %pieces_size.addr = alloca i64, align 8
  %s.addr = alloca i64, align 8
  %r = alloca i64, align 8
  %count = alloca i64, align 8
  %i = alloca i64, align 8
  %_5 = alloca i64, align 8
  %_6 = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64, align 8
  store i64* %pieces, i64** %pieces.addr, align 8
  store i64 %pieces_size, i64* %pieces_size.addr, align 8
  store i64 %s, i64* %s.addr, align 8
  store i64 0, i64* %r, align 8
  store i64 0, i64* %count, align 8
  store i64 0, i64* %i, align 8
  store i64 0, i64* %_5, align 8
  store i64 0, i64* %_6, align 8
  store i64 0, i64* %_7, align 8
  store i64 0, i64* %_8, align 8
  store i64 0, i64* %_9, align 8
  store i64 0, i64* %_10, align 8
  store i64 0, i64* %_11, align 8
  store i64 0, i64* %_12, align 8
  store i64 0, i64* %_5, align 8
  %0 = load i64, i64* %_5, align 8
  store i64 %0, i64* %count, align 8
  store i64 0, i64* %_6, align 8
  %1 = load i64, i64* %_6, align 8
  store i64 %1, i64* %i, align 8
  br label %while.body

while.body:                                       ; preds = %entry, %blklab12
  %2 = load i64, i64* %pieces_size.addr, align 8
  store i64 %2, i64* %_7, align 8
  %3 = load i64, i64* %i, align 8
  %4 = load i64, i64* %_7, align 8
  %cmp = icmp sge i64 %3, %4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %blklab11

if.end:                                           ; preds = %while.body
  %5 = load i64, i64* %i, align 8
  %6 = load i64*, i64** %pieces.addr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 %5
  %7 = load i64, i64* %arrayidx, align 8
  store i64 %7, i64* %_8, align 8
  %8 = load i64, i64* %_8, align 8
  %9 = load i64, i64* %s.addr, align 8
  %cmp1 = icmp ne i64 %8, %9
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  br label %blklab13

if.end3:                                          ; preds = %if.end
  store i64 1, i64* %_9, align 8
  %10 = load i64, i64* %count, align 8
  %11 = load i64, i64* %_9, align 8
  %add = add nsw i64 %10, %11
  store i64 %add, i64* %_10, align 8
  %12 = load i64, i64* %_10, align 8
  store i64 %12, i64* %count, align 8
  br label %blklab13

blklab13:                                         ; preds = %if.end3, %if.then2
  store i64 1, i64* %_11, align 8
  %13 = load i64, i64* %i, align 8
  %14 = load i64, i64* %_11, align 8
  %add4 = add nsw i64 %13, %14
  store i64 %add4, i64* %_12, align 8
  %15 = load i64, i64* %_12, align 8
  store i64 %15, i64* %i, align 8
  br label %blklab12

blklab12:                                         ; preds = %blklab13
  br label %while.body

blklab11:                                         ; preds = %if.then
  %16 = load i64, i64* %count, align 8
  ret i64 %16
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %max = alloca i64, align 8
  %repeat = alloca i64, align 8
  %b1 = alloca %struct.Board*, align 8
  %b2 = alloca %struct.Board*, align 8
  %i = alloca i64, align 8
  %p = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64**, align 8
  %_8_size = alloca i64, align 8
  %_8_size_size = alloca i64, align 8
  %_9 = alloca i64, align 8
  %_10 = alloca i64*, align 8
  %_10_size = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca %struct.Board*, align 8
  %_13 = alloca %struct.Board*, align 8
  %_14 = alloca i64, align 8
  %_15 = alloca i64*, align 8
  %_15_size = alloca i64, align 8
  %_16 = alloca i64, align 8
  %_17 = alloca i64*, align 8
  %_17_size = alloca i64, align 8
  %_18 = alloca i64, align 8
  %_19 = alloca i64, align 8
  %_20 = alloca i64, align 8
  %_21 = alloca i64, align 8
  %_22 = alloca i64, align 8
  %_23 = alloca i64, align 8
  %_24 = alloca i64, align 8
  %_26 = alloca i64, align 8
  %_27 = alloca i64, align 8
  %_28 = alloca i64, align 8
  %_29 = alloca i64, align 8
  %_31 = alloca i64, align 8
  %_32 = alloca i64, align 8
  %_33 = alloca i64, align 8
  %_34 = alloca i64, align 8
  %_35 = alloca i64*, align 8
  %_35_size = alloca i64, align 8
  %_36 = alloca i64, align 8
  %_37 = alloca i64, align 8
  %_38 = alloca i64, align 8
  %_39 = alloca i64, align 8
  %_40 = alloca i64, align 8
  %_41 = alloca i64, align 8
  %_42 = alloca i64, align 8
  %_43 = alloca i64, align 8
  %_44 = alloca i64, align 8
  %_45 = alloca i64*, align 8
  %_45_size = alloca i64, align 8
  %_46 = alloca i64, align 8
  %_47 = alloca i64, align 8
  %_48 = alloca i8*, align 8
  %_50 = alloca i64*, align 8
  %_50_size = alloca i64, align 8
  %_51 = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  store i64 0, i64* %repeat, align 8
  store i64 0, i64* %i, align 8
  store i64 0, i64* %p, align 8
  store i64** null, i64*** %_8, align 8
  store i64 0, i64* %_8_size, align 8
  store i64 0, i64* %_8_size_size, align 8
  store i64 0, i64* %_9, align 8
  store i64* null, i64** %_10, align 8
  store i64 0, i64* %_10_size, align 8
  store i64 0, i64* %_11, align 8
  store i64 0, i64* %_14, align 8
  store i64* null, i64** %_15, align 8
  store i64 0, i64* %_15_size, align 8
  store i64 0, i64* %_16, align 8
  store i64* null, i64** %_17, align 8
  store i64 0, i64* %_17_size, align 8
  store i64 0, i64* %_18, align 8
  store i64 0, i64* %_19, align 8
  store i64 0, i64* %_20, align 8
  store i64 0, i64* %_21, align 8
  store i64 0, i64* %_22, align 8
  store i64 0, i64* %_23, align 8
  store i64 0, i64* %_24, align 8
  store i64 0, i64* %_26, align 8
  store i64 0, i64* %_27, align 8
  store i64 0, i64* %_28, align 8
  store i64 0, i64* %_29, align 8
  store i64 0, i64* %_31, align 8
  store i64 0, i64* %_32, align 8
  store i64 0, i64* %_33, align 8
  store i64 0, i64* %_34, align 8
  store i64* null, i64** %_35, align 8
  store i64 0, i64* %_35_size, align 8
  store i64 0, i64* %_36, align 8
  store i64 0, i64* %_37, align 8
  store i64 0, i64* %_38, align 8
  store i64 0, i64* %_39, align 8
  store i64 0, i64* %_40, align 8
  store i64 0, i64* %_41, align 8
  store i64 0, i64* %_42, align 8
  store i64 0, i64* %_43, align 8
  store i64 0, i64* %_44, align 8
  store i64* null, i64** %_45, align 8
  store i64 0, i64* %_45_size, align 8
  store i64 0, i64* %_46, align 8
  store i64 0, i64* %_47, align 8
  store i64* null, i64** %_50, align 8
  store i64 0, i64* %_50_size, align 8
  %0 = load i32, i32* %argc.addr, align 4
  %1 = load i8**, i8*** %args.addr, align 8
  %call = call i64** @convertArgsToIntArray(i32 %0, i8** %1)
  store i64** %call, i64*** %_8, align 8
  %2 = load i32, i32* %argc.addr, align 4
  %sub = sub nsw i32 %2, 1
  %conv = sext i32 %sub to i64
  store i64 %conv, i64* %_8_size, align 8
  store i64 0, i64* %_9, align 8
  %3 = load i64, i64* %_9, align 8
  %4 = load i64**, i64*** %_8, align 8
  %arrayidx = getelementptr inbounds i64*, i64** %4, i64 %3
  %5 = load i64*, i64** %arrayidx, align 8
  store i64* %5, i64** %_10, align 8
  %6 = load i64*, i64** %_10, align 8
  %call1 = call i64 @parseStringToInt(i64* %6)
  store i64 %call1, i64* %_7, align 8
  %7 = load i64, i64* %_7, align 8
  store i64 %7, i64* %max, align 8
  %8 = load i64, i64* %max, align 8
  %9 = inttoptr i64 %8 to i8*
  %cmp = icmp eq i8* %9, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %blklab14

if.end:                                           ; preds = %entry
  store i64 0, i64* %_11, align 8
  %10 = load i64, i64* %_11, align 8
  store i64 %10, i64* %repeat, align 8
  br label %while.body

while.body:                                       ; preds = %if.end, %blklab16
  %11 = load i64, i64* %repeat, align 8
  %12 = load i64, i64* %max, align 8
  %cmp3 = icmp sge i64 %11, %12
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %while.body
  br label %blklab15

if.end6:                                          ; preds = %while.body
  %call7 = call %struct.Board* @EmptyBoard()
  store %struct.Board* %call7, %struct.Board** %_12, align 8
  %13 = load %struct.Board*, %struct.Board** %_12, align 8
  %call8 = call %struct.Board* @copy_Board(%struct.Board* %13)
  store %struct.Board* %call8, %struct.Board** %b1, align 8
  %call9 = call %struct.Board* @EmptyBoard()
  store %struct.Board* %call9, %struct.Board** %_13, align 8
  %14 = load %struct.Board*, %struct.Board** %_13, align 8
  %call10 = call %struct.Board* @copy_Board(%struct.Board* %14)
  store %struct.Board* %call10, %struct.Board** %b2, align 8
  store i64 0, i64* %_14, align 8
  %15 = load i64, i64* %_14, align 8
  store i64 %15, i64* %i, align 8
  br label %while.body12

while.body12:                                     ; preds = %if.end6, %blklab18
  store i64 9, i64* %_15_size, align 8
  %call13 = call noalias i8* @malloc(i64 72) #4
  %16 = bitcast i8* %call13 to i64*
  store i64* %16, i64** %_15, align 8
  %17 = load i64*, i64** %_15, align 8
  %arrayidx14 = getelementptr inbounds i64, i64* %17, i64 0
  store i64 0, i64* %arrayidx14, align 8
  %18 = load i64*, i64** %_15, align 8
  %arrayidx15 = getelementptr inbounds i64, i64* %18, i64 1
  store i64 1, i64* %arrayidx15, align 8
  %19 = load i64*, i64** %_15, align 8
  %arrayidx16 = getelementptr inbounds i64, i64* %19, i64 2
  store i64 2, i64* %arrayidx16, align 8
  %20 = load i64*, i64** %_15, align 8
  %arrayidx17 = getelementptr inbounds i64, i64* %20, i64 3
  store i64 3, i64* %arrayidx17, align 8
  %21 = load i64*, i64** %_15, align 8
  %arrayidx18 = getelementptr inbounds i64, i64* %21, i64 4
  store i64 4, i64* %arrayidx18, align 8
  %22 = load i64*, i64** %_15, align 8
  %arrayidx19 = getelementptr inbounds i64, i64* %22, i64 5
  store i64 5, i64* %arrayidx19, align 8
  %23 = load i64*, i64** %_15, align 8
  %arrayidx20 = getelementptr inbounds i64, i64* %23, i64 6
  store i64 6, i64* %arrayidx20, align 8
  %24 = load i64*, i64** %_15, align 8
  %arrayidx21 = getelementptr inbounds i64, i64* %24, i64 7
  store i64 7, i64* %arrayidx21, align 8
  %25 = load i64*, i64** %_15, align 8
  %arrayidx22 = getelementptr inbounds i64, i64* %25, i64 8
  store i64 8, i64* %arrayidx22, align 8
  %26 = load i64, i64* %_15_size, align 8
  store i64 %26, i64* %_16, align 8
  %27 = load i64, i64* %i, align 8
  %28 = load i64, i64* %_16, align 8
  %cmp23 = icmp sge i64 %27, %28
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %while.body12
  br label %blklab17

if.end26:                                         ; preds = %while.body12
  store i64 9, i64* %_17_size, align 8
  %call27 = call noalias i8* @malloc(i64 72) #4
  %29 = bitcast i8* %call27 to i64*
  store i64* %29, i64** %_17, align 8
  %30 = load i64*, i64** %_17, align 8
  %arrayidx28 = getelementptr inbounds i64, i64* %30, i64 0
  store i64 0, i64* %arrayidx28, align 8
  %31 = load i64*, i64** %_17, align 8
  %arrayidx29 = getelementptr inbounds i64, i64* %31, i64 1
  store i64 1, i64* %arrayidx29, align 8
  %32 = load i64*, i64** %_17, align 8
  %arrayidx30 = getelementptr inbounds i64, i64* %32, i64 2
  store i64 2, i64* %arrayidx30, align 8
  %33 = load i64*, i64** %_17, align 8
  %arrayidx31 = getelementptr inbounds i64, i64* %33, i64 3
  store i64 3, i64* %arrayidx31, align 8
  %34 = load i64*, i64** %_17, align 8
  %arrayidx32 = getelementptr inbounds i64, i64* %34, i64 4
  store i64 4, i64* %arrayidx32, align 8
  %35 = load i64*, i64** %_17, align 8
  %arrayidx33 = getelementptr inbounds i64, i64* %35, i64 5
  store i64 5, i64* %arrayidx33, align 8
  %36 = load i64*, i64** %_17, align 8
  %arrayidx34 = getelementptr inbounds i64, i64* %36, i64 6
  store i64 6, i64* %arrayidx34, align 8
  %37 = load i64*, i64** %_17, align 8
  %arrayidx35 = getelementptr inbounds i64, i64* %37, i64 7
  store i64 7, i64* %arrayidx35, align 8
  %38 = load i64*, i64** %_17, align 8
  %arrayidx36 = getelementptr inbounds i64, i64* %38, i64 8
  store i64 8, i64* %arrayidx36, align 8
  %39 = load i64, i64* %i, align 8
  %40 = load i64*, i64** %_17, align 8
  %arrayidx37 = getelementptr inbounds i64, i64* %40, i64 %39
  %41 = load i64, i64* %arrayidx37, align 8
  store i64 %41, i64* %_18, align 8
  %42 = load i64, i64* %_18, align 8
  store i64 %42, i64* %p, align 8
  store i64 0, i64* %_19, align 8
  %43 = load i64, i64* %p, align 8
  %44 = load i64, i64* %_19, align 8
  %cmp38 = icmp slt i64 %43, %44
  br i1 %cmp38, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end26
  br label %blklab21

if.end41:                                         ; preds = %if.end26
  store i64 9, i64* %_20, align 8
  %45 = load i64, i64* %p, align 8
  %46 = load i64, i64* %_20, align 8
  %cmp42 = icmp sle i64 %45, %46
  br i1 %cmp42, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.end41
  br label %blklab19

if.end45:                                         ; preds = %if.end41
  br label %blklab21

blklab21:                                         ; preds = %if.end45, %if.then40
  br label %blklab17

blklab19:                                         ; preds = %if.then44
  %47 = load %struct.Board*, %struct.Board** %b1, align 8
  %cmp46 = icmp eq %struct.Board* %47, null
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %blklab19
  br label %blklab22

if.end49:                                         ; preds = %blklab19
  store i64 1, i64* %_21, align 8
  %48 = load i64, i64* %_21, align 8
  %49 = load i64, i64* %p, align 8
  %50 = load %struct.Board*, %struct.Board** %b1, align 8
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %50, i32 0, i32 0
  %51 = load i64*, i64** %pieces, align 8
  %arrayidx50 = getelementptr inbounds i64, i64* %51, i64 %49
  store i64 %48, i64* %arrayidx50, align 8
  %52 = load %struct.Board*, %struct.Board** %b1, align 8
  %move = getelementptr inbounds %struct.Board, %struct.Board* %52, i32 0, i32 2
  %53 = load i64, i64* %move, align 8
  store i64 %53, i64* %_22, align 8
  store i64 1, i64* %_23, align 8
  %54 = load i64, i64* %_22, align 8
  %55 = load i64, i64* %_23, align 8
  %add = add nsw i64 %54, %55
  store i64 %add, i64* %_24, align 8
  %56 = load i64, i64* %_24, align 8
  %57 = load %struct.Board*, %struct.Board** %b1, align 8
  %move51 = getelementptr inbounds %struct.Board, %struct.Board* %57, i32 0, i32 2
  store i64 %56, i64* %move51, align 8
  %58 = load %struct.Board*, %struct.Board** %b1, align 8
  %call52 = call %struct.Board* @copy_Board(%struct.Board* %58)
  store %struct.Board* %call52, %struct.Board** %b2, align 8
  store %struct.Board* null, %struct.Board** %b1, align 8
  br label %blklab23

blklab22:                                         ; preds = %if.then48
  %59 = load %struct.Board*, %struct.Board** %b2, align 8
  %cmp53 = icmp eq %struct.Board* %59, null
  br i1 %cmp53, label %if.then55, label %if.end56

if.then55:                                        ; preds = %blklab22
  br label %blklab24

if.end56:                                         ; preds = %blklab22
  store i64 2, i64* %_26, align 8
  %60 = load i64, i64* %_26, align 8
  %61 = load i64, i64* %p, align 8
  %62 = load %struct.Board*, %struct.Board** %b2, align 8
  %pieces57 = getelementptr inbounds %struct.Board, %struct.Board* %62, i32 0, i32 0
  %63 = load i64*, i64** %pieces57, align 8
  %arrayidx58 = getelementptr inbounds i64, i64* %63, i64 %61
  store i64 %60, i64* %arrayidx58, align 8
  %64 = load %struct.Board*, %struct.Board** %b2, align 8
  %move59 = getelementptr inbounds %struct.Board, %struct.Board* %64, i32 0, i32 2
  %65 = load i64, i64* %move59, align 8
  store i64 %65, i64* %_27, align 8
  store i64 1, i64* %_28, align 8
  %66 = load i64, i64* %_27, align 8
  %67 = load i64, i64* %_28, align 8
  %add60 = add nsw i64 %66, %67
  store i64 %add60, i64* %_29, align 8
  %68 = load i64, i64* %_29, align 8
  %69 = load %struct.Board*, %struct.Board** %b2, align 8
  %move61 = getelementptr inbounds %struct.Board, %struct.Board* %69, i32 0, i32 2
  store i64 %68, i64* %move61, align 8
  %70 = load %struct.Board*, %struct.Board** %b2, align 8
  %call62 = call %struct.Board* @copy_Board(%struct.Board* %70)
  store %struct.Board* %call62, %struct.Board** %b1, align 8
  store %struct.Board* null, %struct.Board** %b2, align 8
  br label %blklab24

blklab24:                                         ; preds = %if.end56, %if.then55
  br label %blklab23

blklab23:                                         ; preds = %blklab24, %if.end49
  br label %blklab20

blklab20:                                         ; preds = %blklab23
  store i64 1, i64* %_31, align 8
  %71 = load i64, i64* %i, align 8
  %72 = load i64, i64* %_31, align 8
  %add63 = add nsw i64 %71, %72
  store i64 %add63, i64* %_32, align 8
  %73 = load i64, i64* %_32, align 8
  store i64 %73, i64* %i, align 8
  br label %blklab18

blklab18:                                         ; preds = %blklab20
  br label %while.body12

blklab17:                                         ; preds = %blklab21, %if.then25
  %74 = load %struct.Board*, %struct.Board** %b1, align 8
  %cmp64 = icmp eq %struct.Board* %74, null
  br i1 %cmp64, label %if.then66, label %if.end67

if.then66:                                        ; preds = %blklab17
  br label %blklab25

if.end67:                                         ; preds = %blklab17
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call68 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %75, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab25:                                         ; preds = %if.then66
  %76 = load %struct.Board*, %struct.Board** %b2, align 8
  %cmp69 = icmp eq %struct.Board* %76, null
  br i1 %cmp69, label %if.then71, label %if.end72

if.then71:                                        ; preds = %blklab25
  br label %blklab27

if.end72:                                         ; preds = %blklab25
  %77 = load %struct.Board*, %struct.Board** %b2, align 8
  %move73 = getelementptr inbounds %struct.Board, %struct.Board* %77, i32 0, i32 2
  %78 = load i64, i64* %move73, align 8
  store i64 %78, i64* %_33, align 8
  store i64 9, i64* %_34, align 8
  %79 = load i64, i64* %_33, align 8
  %80 = load i64, i64* %_34, align 8
  %cmp74 = icmp eq i64 %79, %80
  br i1 %cmp74, label %if.then76, label %if.end77

if.then76:                                        ; preds = %if.end72
  br label %blklab26

if.end77:                                         ; preds = %if.end72
  br label %blklab27

blklab27:                                         ; preds = %if.end77, %if.then71
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call78 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab26:                                         ; preds = %if.then76
  %82 = load %struct.Board*, %struct.Board** %b2, align 8
  %cmp79 = icmp eq %struct.Board* %82, null
  br i1 %cmp79, label %if.then81, label %if.end82

if.then81:                                        ; preds = %blklab26
  br label %blklab29

if.end82:                                         ; preds = %blklab26
  %83 = load %struct.Board*, %struct.Board** %b2, align 8
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %83, i32 0, i32 1
  %84 = load i64, i64* %pieces_size, align 8
  store i64 %84, i64* %_35_size, align 8
  %85 = load %struct.Board*, %struct.Board** %b2, align 8
  %pieces83 = getelementptr inbounds %struct.Board, %struct.Board* %85, i32 0, i32 0
  %86 = load i64*, i64** %pieces83, align 8
  %87 = load %struct.Board*, %struct.Board** %b2, align 8
  %pieces_size84 = getelementptr inbounds %struct.Board, %struct.Board* %87, i32 0, i32 1
  %88 = load i64, i64* %pieces_size84, align 8
  %call85 = call i64* @copy(i64* %86, i64 %88)
  store i64* %call85, i64** %_35, align 8
  store i64 1, i64* %_36, align 8
  store i64 2, i64* %_37, align 8
  store i64 1, i64* %_38, align 8
  store i64 2, i64* %_39, align 8
  store i64 1, i64* %_40, align 8
  store i64 2, i64* %_41, align 8
  store i64 1, i64* %_42, align 8
  store i64 2, i64* %_43, align 8
  store i64 1, i64* %_44, align 8
  store i64 9, i64* %_45_size, align 8
  %call86 = call noalias i8* @malloc(i64 72) #4
  %89 = bitcast i8* %call86 to i64*
  store i64* %89, i64** %_45, align 8
  %90 = load i64, i64* %_36, align 8
  %91 = load i64*, i64** %_45, align 8
  %arrayidx87 = getelementptr inbounds i64, i64* %91, i64 0
  store i64 %90, i64* %arrayidx87, align 8
  %92 = load i64, i64* %_37, align 8
  %93 = load i64*, i64** %_45, align 8
  %arrayidx88 = getelementptr inbounds i64, i64* %93, i64 1
  store i64 %92, i64* %arrayidx88, align 8
  %94 = load i64, i64* %_38, align 8
  %95 = load i64*, i64** %_45, align 8
  %arrayidx89 = getelementptr inbounds i64, i64* %95, i64 2
  store i64 %94, i64* %arrayidx89, align 8
  %96 = load i64, i64* %_39, align 8
  %97 = load i64*, i64** %_45, align 8
  %arrayidx90 = getelementptr inbounds i64, i64* %97, i64 3
  store i64 %96, i64* %arrayidx90, align 8
  %98 = load i64, i64* %_40, align 8
  %99 = load i64*, i64** %_45, align 8
  %arrayidx91 = getelementptr inbounds i64, i64* %99, i64 4
  store i64 %98, i64* %arrayidx91, align 8
  %100 = load i64, i64* %_41, align 8
  %101 = load i64*, i64** %_45, align 8
  %arrayidx92 = getelementptr inbounds i64, i64* %101, i64 5
  store i64 %100, i64* %arrayidx92, align 8
  %102 = load i64, i64* %_42, align 8
  %103 = load i64*, i64** %_45, align 8
  %arrayidx93 = getelementptr inbounds i64, i64* %103, i64 6
  store i64 %102, i64* %arrayidx93, align 8
  %104 = load i64, i64* %_43, align 8
  %105 = load i64*, i64** %_45, align 8
  %arrayidx94 = getelementptr inbounds i64, i64* %105, i64 7
  store i64 %104, i64* %arrayidx94, align 8
  %106 = load i64, i64* %_44, align 8
  %107 = load i64*, i64** %_45, align 8
  %arrayidx95 = getelementptr inbounds i64, i64* %107, i64 8
  store i64 %106, i64* %arrayidx95, align 8
  %108 = load i64*, i64** %_35, align 8
  %109 = load i64, i64* %_35_size, align 8
  %110 = load i64*, i64** %_45, align 8
  %111 = load i64, i64* %_45_size, align 8
  %call96 = call i32 @isArrayEqual(i64* %108, i64 %109, i64* %110, i64 %111)
  %cmp97 = icmp eq i32 %call96, 1
  br i1 %cmp97, label %if.then99, label %if.end100

if.then99:                                        ; preds = %if.end82
  br label %blklab28

if.end100:                                        ; preds = %if.end82
  br label %blklab29

blklab29:                                         ; preds = %if.end100, %if.then81
  %112 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call101 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %112, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab28:                                         ; preds = %if.then99
  store i64 1, i64* %_46, align 8
  %113 = load i64, i64* %repeat, align 8
  %114 = load i64, i64* %_46, align 8
  %add102 = add nsw i64 %113, %114
  store i64 %add102, i64* %_47, align 8
  %115 = load i64, i64* %_47, align 8
  store i64 %115, i64* %repeat, align 8
  br label %blklab16

blklab16:                                         ; preds = %blklab28
  br label %while.body

blklab15:                                         ; preds = %if.then5
  store i64 41, i64* %_50_size, align 8
  %call103 = call noalias i8* @malloc(i64 328) #4
  %116 = bitcast i8* %call103 to i64*
  store i64* %116, i64** %_50, align 8
  %117 = load i64*, i64** %_50, align 8
  %arrayidx104 = getelementptr inbounds i64, i64* %117, i64 0
  store i64 80, i64* %arrayidx104, align 8
  %118 = load i64*, i64** %_50, align 8
  %arrayidx105 = getelementptr inbounds i64, i64* %118, i64 1
  store i64 97, i64* %arrayidx105, align 8
  %119 = load i64*, i64** %_50, align 8
  %arrayidx106 = getelementptr inbounds i64, i64* %119, i64 2
  store i64 115, i64* %arrayidx106, align 8
  %120 = load i64*, i64** %_50, align 8
  %arrayidx107 = getelementptr inbounds i64, i64* %120, i64 3
  store i64 115, i64* %arrayidx107, align 8
  %121 = load i64*, i64** %_50, align 8
  %arrayidx108 = getelementptr inbounds i64, i64* %121, i64 4
  store i64 32, i64* %arrayidx108, align 8
  %122 = load i64*, i64** %_50, align 8
  %arrayidx109 = getelementptr inbounds i64, i64* %122, i64 5
  store i64 110, i64* %arrayidx109, align 8
  %123 = load i64*, i64** %_50, align 8
  %arrayidx110 = getelementptr inbounds i64, i64* %123, i64 6
  store i64 101, i64* %arrayidx110, align 8
  %124 = load i64*, i64** %_50, align 8
  %arrayidx111 = getelementptr inbounds i64, i64* %124, i64 7
  store i64 119, i64* %arrayidx111, align 8
  %125 = load i64*, i64** %_50, align 8
  %arrayidx112 = getelementptr inbounds i64, i64* %125, i64 8
  store i64 84, i64* %arrayidx112, align 8
  %126 = load i64*, i64** %_50, align 8
  %arrayidx113 = getelementptr inbounds i64, i64* %126, i64 9
  store i64 105, i64* %arrayidx113, align 8
  %127 = load i64*, i64** %_50, align 8
  %arrayidx114 = getelementptr inbounds i64, i64* %127, i64 10
  store i64 99, i64* %arrayidx114, align 8
  %128 = load i64*, i64** %_50, align 8
  %arrayidx115 = getelementptr inbounds i64, i64* %128, i64 11
  store i64 84, i64* %arrayidx115, align 8
  %129 = load i64*, i64** %_50, align 8
  %arrayidx116 = getelementptr inbounds i64, i64* %129, i64 12
  store i64 97, i64* %arrayidx116, align 8
  %130 = load i64*, i64** %_50, align 8
  %arrayidx117 = getelementptr inbounds i64, i64* %130, i64 13
  store i64 99, i64* %arrayidx117, align 8
  %131 = load i64*, i64** %_50, align 8
  %arrayidx118 = getelementptr inbounds i64, i64* %131, i64 14
  store i64 84, i64* %arrayidx118, align 8
  %132 = load i64*, i64** %_50, align 8
  %arrayidx119 = getelementptr inbounds i64, i64* %132, i64 15
  store i64 111, i64* %arrayidx119, align 8
  %133 = load i64*, i64** %_50, align 8
  %arrayidx120 = getelementptr inbounds i64, i64* %133, i64 16
  store i64 101, i64* %arrayidx120, align 8
  %134 = load i64*, i64** %_50, align 8
  %arrayidx121 = getelementptr inbounds i64, i64* %134, i64 17
  store i64 32, i64* %arrayidx121, align 8
  %135 = load i64*, i64** %_50, align 8
  %arrayidx122 = getelementptr inbounds i64, i64* %135, i64 18
  store i64 116, i64* %arrayidx122, align 8
  %136 = load i64*, i64** %_50, align 8
  %arrayidx123 = getelementptr inbounds i64, i64* %136, i64 19
  store i64 101, i64* %arrayidx123, align 8
  %137 = load i64*, i64** %_50, align 8
  %arrayidx124 = getelementptr inbounds i64, i64* %137, i64 20
  store i64 115, i64* %arrayidx124, align 8
  %138 = load i64*, i64** %_50, align 8
  %arrayidx125 = getelementptr inbounds i64, i64* %138, i64 21
  store i64 116, i64* %arrayidx125, align 8
  %139 = load i64*, i64** %_50, align 8
  %arrayidx126 = getelementptr inbounds i64, i64* %139, i64 22
  store i64 32, i64* %arrayidx126, align 8
  %140 = load i64*, i64** %_50, align 8
  %arrayidx127 = getelementptr inbounds i64, i64* %140, i64 23
  store i64 99, i64* %arrayidx127, align 8
  %141 = load i64*, i64** %_50, align 8
  %arrayidx128 = getelementptr inbounds i64, i64* %141, i64 24
  store i64 97, i64* %arrayidx128, align 8
  %142 = load i64*, i64** %_50, align 8
  %arrayidx129 = getelementptr inbounds i64, i64* %142, i64 25
  store i64 115, i64* %arrayidx129, align 8
  %143 = load i64*, i64** %_50, align 8
  %arrayidx130 = getelementptr inbounds i64, i64* %143, i64 26
  store i64 101, i64* %arrayidx130, align 8
  %144 = load i64*, i64** %_50, align 8
  %arrayidx131 = getelementptr inbounds i64, i64* %144, i64 27
  store i64 32, i64* %arrayidx131, align 8
  %145 = load i64*, i64** %_50, align 8
  %arrayidx132 = getelementptr inbounds i64, i64* %145, i64 28
  store i64 119, i64* %arrayidx132, align 8
  %146 = load i64*, i64** %_50, align 8
  %arrayidx133 = getelementptr inbounds i64, i64* %146, i64 29
  store i64 105, i64* %arrayidx133, align 8
  %147 = load i64*, i64** %_50, align 8
  %arrayidx134 = getelementptr inbounds i64, i64* %147, i64 30
  store i64 116, i64* %arrayidx134, align 8
  %148 = load i64*, i64** %_50, align 8
  %arrayidx135 = getelementptr inbounds i64, i64* %148, i64 31
  store i64 104, i64* %arrayidx135, align 8
  %149 = load i64*, i64** %_50, align 8
  %arrayidx136 = getelementptr inbounds i64, i64* %149, i64 32
  store i64 32, i64* %arrayidx136, align 8
  %150 = load i64*, i64** %_50, align 8
  %arrayidx137 = getelementptr inbounds i64, i64* %150, i64 33
  store i64 105, i64* %arrayidx137, align 8
  %151 = load i64*, i64** %_50, align 8
  %arrayidx138 = getelementptr inbounds i64, i64* %151, i64 34
  store i64 110, i64* %arrayidx138, align 8
  %152 = load i64*, i64** %_50, align 8
  %arrayidx139 = getelementptr inbounds i64, i64* %152, i64 35
  store i64 112, i64* %arrayidx139, align 8
  %153 = load i64*, i64** %_50, align 8
  %arrayidx140 = getelementptr inbounds i64, i64* %153, i64 36
  store i64 117, i64* %arrayidx140, align 8
  %154 = load i64*, i64** %_50, align 8
  %arrayidx141 = getelementptr inbounds i64, i64* %154, i64 37
  store i64 116, i64* %arrayidx141, align 8
  %155 = load i64*, i64** %_50, align 8
  %arrayidx142 = getelementptr inbounds i64, i64* %155, i64 38
  store i64 32, i64* %arrayidx142, align 8
  %156 = load i64*, i64** %_50, align 8
  %arrayidx143 = getelementptr inbounds i64, i64* %156, i64 39
  store i64 61, i64* %arrayidx143, align 8
  %157 = load i64*, i64** %_50, align 8
  %arrayidx144 = getelementptr inbounds i64, i64* %157, i64 40
  store i64 32, i64* %arrayidx144, align 8
  %158 = load i64*, i64** %_50, align 8
  %159 = load i64, i64* %_50_size, align 8
  call void @printf_s(i64* %158, i64 %159)
  %160 = load i64, i64* %max, align 8
  %call145 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i64 %160)
  br label %blklab14

blklab14:                                         ; preds = %blklab15, %if.then
  call void @exit(i32 0) #5
  unreachable

return:                                           ; No predecessors!
  %161 = load i32, i32* %retval, align 4
  ret i32 %161
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64 @parseStringToInt(i64*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare i32 @isArrayEqual(i64*, i64, i64*, i64) #2

declare void @printf_s(i64*, i64) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 1f64ddbc4c5d1036b68ec896765a7535537ded85) (http://llvm.org/git/llvm.git 99a07120d47e1881a14a7b36bf7cf6bbd54954af)"}
