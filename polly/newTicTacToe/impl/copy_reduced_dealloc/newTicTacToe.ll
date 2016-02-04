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
  %r_has_ownership = alloca i8, align 1
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
  %_11_has_ownership = alloca i8, align 1
  %_12 = alloca %struct.Board*, align 8
  %_12_has_ownership = alloca i8, align 1
  store i8 0, i8* %r_has_ownership, align 1
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
  store i8 0, i8* %_11_has_ownership, align 1
  store i8 0, i8* %_12_has_ownership, align 1
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
  %0 = load i8, i8* %_11_has_ownership, align 1
  %tobool = trunc i8 %0 to i1
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64*, i64** %_11, align 8
  %2 = bitcast i64* %1 to i8*
  call void @free(i8* %2) #4
  store i8 0, i8* %_11_has_ownership, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i64 9, i64* %_11_size, align 8
  %call = call noalias i8* @malloc(i64 72) #4
  %3 = bitcast i8* %call to i64*
  store i64* %3, i64** %_11, align 8
  %4 = load i64, i64* %_2, align 8
  %5 = load i64*, i64** %_11, align 8
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0
  store i64 %4, i64* %arrayidx, align 8
  %6 = load i64, i64* %_3, align 8
  %7 = load i64*, i64** %_11, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %7, i64 1
  store i64 %6, i64* %arrayidx1, align 8
  %8 = load i64, i64* %_4, align 8
  %9 = load i64*, i64** %_11, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %9, i64 2
  store i64 %8, i64* %arrayidx2, align 8
  %10 = load i64, i64* %_5, align 8
  %11 = load i64*, i64** %_11, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %11, i64 3
  store i64 %10, i64* %arrayidx3, align 8
  %12 = load i64, i64* %_6, align 8
  %13 = load i64*, i64** %_11, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %13, i64 4
  store i64 %12, i64* %arrayidx4, align 8
  %14 = load i64, i64* %_7, align 8
  %15 = load i64*, i64** %_11, align 8
  %arrayidx5 = getelementptr inbounds i64, i64* %15, i64 5
  store i64 %14, i64* %arrayidx5, align 8
  %16 = load i64, i64* %_8, align 8
  %17 = load i64*, i64** %_11, align 8
  %arrayidx6 = getelementptr inbounds i64, i64* %17, i64 6
  store i64 %16, i64* %arrayidx6, align 8
  %18 = load i64, i64* %_9, align 8
  %19 = load i64*, i64** %_11, align 8
  %arrayidx7 = getelementptr inbounds i64, i64* %19, i64 7
  store i64 %18, i64* %arrayidx7, align 8
  %20 = load i64, i64* %_10, align 8
  %21 = load i64*, i64** %_11, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %21, i64 8
  store i64 %20, i64* %arrayidx8, align 8
  store i8 1, i8* %_11_has_ownership, align 1
  %22 = load i8, i8* %_12_has_ownership, align 1
  %tobool9 = trunc i8 %22 to i1
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  %23 = load %struct.Board*, %struct.Board** %_12, align 8
  call void @free_Board(%struct.Board* %23)
  store i8 0, i8* %_12_has_ownership, align 1
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end
  %call12 = call noalias i8* @malloc(i64 24) #4
  %24 = bitcast i8* %call12 to %struct.Board*
  store %struct.Board* %24, %struct.Board** %_12, align 8
  %25 = load i64, i64* %_1, align 8
  %26 = load %struct.Board*, %struct.Board** %_12, align 8
  %move = getelementptr inbounds %struct.Board, %struct.Board* %26, i32 0, i32 2
  store i64 %25, i64* %move, align 8
  %27 = load i64, i64* %_11_size, align 8
  %28 = load %struct.Board*, %struct.Board** %_12, align 8
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %28, i32 0, i32 1
  store i64 %27, i64* %pieces_size, align 8
  %29 = load i64*, i64** %_11, align 8
  %30 = load i64, i64* %_11_size, align 8
  %call13 = call i64* @copy(i64* %29, i64 %30)
  %31 = load %struct.Board*, %struct.Board** %_12, align 8
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %31, i32 0, i32 0
  store i64* %call13, i64** %pieces, align 8
  store i8 1, i8* %_12_has_ownership, align 1
  %32 = load i8, i8* %r_has_ownership, align 1
  %tobool14 = trunc i8 %32 to i1
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end11
  %33 = load %struct.Board*, %struct.Board** %r, align 8
  call void @free_Board(%struct.Board* %33)
  store i8 0, i8* %r_has_ownership, align 1
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end11
  %34 = load i8, i8* %_11_has_ownership, align 1
  %tobool17 = trunc i8 %34 to i1
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end16
  %35 = load i64*, i64** %_11, align 8
  %36 = bitcast i64* %35 to i8*
  call void @free(i8* %36) #4
  store i8 0, i8* %_11_has_ownership, align 1
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end16
  %37 = load %struct.Board*, %struct.Board** %_12, align 8
  ret %struct.Board* %37
}

; Function Attrs: nounwind uwtable
define i64 @countOf(i64* %pieces, i64 %pieces_size, i1 zeroext %pieces_has_ownership, i64 %s) #0 {
entry:
  %pieces.addr = alloca i64*, align 8
  %pieces_size.addr = alloca i64, align 8
  %pieces_has_ownership.addr = alloca i8, align 1
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
  %frombool = zext i1 %pieces_has_ownership to i8
  store i8 %frombool, i8* %pieces_has_ownership.addr, align 1
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
  %16 = load i8, i8* %pieces_has_ownership.addr, align 1
  %tobool = trunc i8 %16 to i1
  br i1 %tobool, label %if.then5, label %if.end6

if.then5:                                         ; preds = %blklab11
  %17 = load i64*, i64** %pieces.addr, align 8
  %18 = bitcast i64* %17 to i8*
  call void @free(i8* %18) #4
  store i8 0, i8* %pieces_has_ownership.addr, align 1
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %blklab11
  %19 = load i64, i64* %count, align 8
  ret i64 %19
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
  %b1_has_ownership = alloca i8, align 1
  %b2 = alloca %struct.Board*, align 8
  %b2_has_ownership = alloca i8, align 1
  %i = alloca i64, align 8
  %p = alloca i64, align 8
  %_7 = alloca i64, align 8
  %_8 = alloca i64**, align 8
  %_8_size = alloca i64, align 8
  %_8_size_size = alloca i64, align 8
  %_8_has_ownership = alloca i8, align 1
  %_9 = alloca i64, align 8
  %_10 = alloca i64*, align 8
  %_10_size = alloca i64, align 8
  %_10_has_ownership = alloca i8, align 1
  %_11 = alloca i64, align 8
  %_12 = alloca %struct.Board*, align 8
  %_12_has_ownership = alloca i8, align 1
  %_13 = alloca %struct.Board*, align 8
  %_13_has_ownership = alloca i8, align 1
  %_14 = alloca i64, align 8
  %_15 = alloca i64*, align 8
  %_15_size = alloca i64, align 8
  %_15_has_ownership = alloca i8, align 1
  %_16 = alloca i64, align 8
  %_17 = alloca i64*, align 8
  %_17_size = alloca i64, align 8
  %_17_has_ownership = alloca i8, align 1
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
  %_35_has_ownership = alloca i8, align 1
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
  %_45_has_ownership = alloca i8, align 1
  %_46 = alloca i64, align 8
  %_47 = alloca i64, align 8
  %_48 = alloca i8*, align 8
  %_50 = alloca i64*, align 8
  %_50_size = alloca i64, align 8
  %_50_has_ownership = alloca i8, align 1
  %_51 = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  store i64 0, i64* %repeat, align 8
  store i8 0, i8* %b1_has_ownership, align 1
  store i8 0, i8* %b2_has_ownership, align 1
  store i64 0, i64* %i, align 8
  store i64 0, i64* %p, align 8
  store i64** null, i64*** %_8, align 8
  store i64 0, i64* %_8_size, align 8
  store i64 0, i64* %_8_size_size, align 8
  store i8 0, i8* %_8_has_ownership, align 1
  store i64 0, i64* %_9, align 8
  store i64* null, i64** %_10, align 8
  store i64 0, i64* %_10_size, align 8
  store i8 0, i8* %_10_has_ownership, align 1
  store i64 0, i64* %_11, align 8
  store i8 0, i8* %_12_has_ownership, align 1
  store i8 0, i8* %_13_has_ownership, align 1
  store i64 0, i64* %_14, align 8
  store i64* null, i64** %_15, align 8
  store i64 0, i64* %_15_size, align 8
  store i8 0, i8* %_15_has_ownership, align 1
  store i64 0, i64* %_16, align 8
  store i64* null, i64** %_17, align 8
  store i64 0, i64* %_17_size, align 8
  store i8 0, i8* %_17_has_ownership, align 1
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
  store i8 0, i8* %_35_has_ownership, align 1
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
  store i8 0, i8* %_45_has_ownership, align 1
  store i64 0, i64* %_46, align 8
  store i64 0, i64* %_47, align 8
  store i64* null, i64** %_50, align 8
  store i64 0, i64* %_50_size, align 8
  store i8 0, i8* %_50_has_ownership, align 1
  %0 = load i32, i32* %argc.addr, align 4
  %1 = load i8**, i8*** %args.addr, align 8
  %call = call i64** @convertArgsToIntArray(i32 %0, i8** %1)
  store i64** %call, i64*** %_8, align 8
  %2 = load i32, i32* %argc.addr, align 4
  %sub = sub nsw i32 %2, 1
  %conv = sext i32 %sub to i64
  store i64 %conv, i64* %_8_size, align 8
  store i8 1, i8* %_8_has_ownership, align 1
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
  %13 = load i8, i8* %_12_has_ownership, align 1
  %tobool = trunc i8 %13 to i1
  br i1 %tobool, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end6
  %14 = load %struct.Board*, %struct.Board** %_12, align 8
  call void @free_Board(%struct.Board* %14)
  store i8 0, i8* %_12_has_ownership, align 1
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end6
  %call9 = call %struct.Board* @EmptyBoard()
  store %struct.Board* %call9, %struct.Board** %_12, align 8
  store i8 1, i8* %_12_has_ownership, align 1
  %15 = load i8, i8* %b1_has_ownership, align 1
  %tobool10 = trunc i8 %15 to i1
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  %16 = load %struct.Board*, %struct.Board** %b1, align 8
  call void @free_Board(%struct.Board* %16)
  store i8 0, i8* %b1_has_ownership, align 1
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end8
  %17 = load %struct.Board*, %struct.Board** %_12, align 8
  store %struct.Board* %17, %struct.Board** %b1, align 8
  store i8 1, i8* %b1_has_ownership, align 1
  store i8 0, i8* %_12_has_ownership, align 1
  %18 = load i8, i8* %_13_has_ownership, align 1
  %tobool13 = trunc i8 %18 to i1
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  %19 = load %struct.Board*, %struct.Board** %_13, align 8
  call void @free_Board(%struct.Board* %19)
  store i8 0, i8* %_13_has_ownership, align 1
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end12
  %call16 = call %struct.Board* @EmptyBoard()
  store %struct.Board* %call16, %struct.Board** %_13, align 8
  store i8 1, i8* %_13_has_ownership, align 1
  %20 = load i8, i8* %b2_has_ownership, align 1
  %tobool17 = trunc i8 %20 to i1
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end15
  %21 = load %struct.Board*, %struct.Board** %b2, align 8
  call void @free_Board(%struct.Board* %21)
  store i8 0, i8* %b2_has_ownership, align 1
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end15
  %22 = load %struct.Board*, %struct.Board** %_13, align 8
  store %struct.Board* %22, %struct.Board** %b2, align 8
  store i8 1, i8* %b2_has_ownership, align 1
  store i8 0, i8* %_13_has_ownership, align 1
  store i64 0, i64* %_14, align 8
  %23 = load i64, i64* %_14, align 8
  store i64 %23, i64* %i, align 8
  br label %while.body21

while.body21:                                     ; preds = %if.end19, %blklab18
  %24 = load i8, i8* %_15_has_ownership, align 1
  %tobool22 = trunc i8 %24 to i1
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %while.body21
  %25 = load i64*, i64** %_15, align 8
  %26 = bitcast i64* %25 to i8*
  call void @free(i8* %26) #4
  store i8 0, i8* %_15_has_ownership, align 1
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %while.body21
  store i64 9, i64* %_15_size, align 8
  %call25 = call noalias i8* @malloc(i64 72) #4
  %27 = bitcast i8* %call25 to i64*
  store i64* %27, i64** %_15, align 8
  %28 = load i64*, i64** %_15, align 8
  %arrayidx26 = getelementptr inbounds i64, i64* %28, i64 0
  store i64 0, i64* %arrayidx26, align 8
  %29 = load i64*, i64** %_15, align 8
  %arrayidx27 = getelementptr inbounds i64, i64* %29, i64 1
  store i64 1, i64* %arrayidx27, align 8
  %30 = load i64*, i64** %_15, align 8
  %arrayidx28 = getelementptr inbounds i64, i64* %30, i64 2
  store i64 2, i64* %arrayidx28, align 8
  %31 = load i64*, i64** %_15, align 8
  %arrayidx29 = getelementptr inbounds i64, i64* %31, i64 3
  store i64 3, i64* %arrayidx29, align 8
  %32 = load i64*, i64** %_15, align 8
  %arrayidx30 = getelementptr inbounds i64, i64* %32, i64 4
  store i64 4, i64* %arrayidx30, align 8
  %33 = load i64*, i64** %_15, align 8
  %arrayidx31 = getelementptr inbounds i64, i64* %33, i64 5
  store i64 5, i64* %arrayidx31, align 8
  %34 = load i64*, i64** %_15, align 8
  %arrayidx32 = getelementptr inbounds i64, i64* %34, i64 6
  store i64 6, i64* %arrayidx32, align 8
  %35 = load i64*, i64** %_15, align 8
  %arrayidx33 = getelementptr inbounds i64, i64* %35, i64 7
  store i64 7, i64* %arrayidx33, align 8
  %36 = load i64*, i64** %_15, align 8
  %arrayidx34 = getelementptr inbounds i64, i64* %36, i64 8
  store i64 8, i64* %arrayidx34, align 8
  store i8 1, i8* %_15_has_ownership, align 1
  %37 = load i64, i64* %_15_size, align 8
  store i64 %37, i64* %_16, align 8
  %38 = load i64, i64* %i, align 8
  %39 = load i64, i64* %_16, align 8
  %cmp35 = icmp sge i64 %38, %39
  br i1 %cmp35, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end24
  br label %blklab17

if.end38:                                         ; preds = %if.end24
  %40 = load i8, i8* %_17_has_ownership, align 1
  %tobool39 = trunc i8 %40 to i1
  br i1 %tobool39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end38
  %41 = load i64*, i64** %_17, align 8
  %42 = bitcast i64* %41 to i8*
  call void @free(i8* %42) #4
  store i8 0, i8* %_17_has_ownership, align 1
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %if.end38
  store i64 9, i64* %_17_size, align 8
  %call42 = call noalias i8* @malloc(i64 72) #4
  %43 = bitcast i8* %call42 to i64*
  store i64* %43, i64** %_17, align 8
  %44 = load i64*, i64** %_17, align 8
  %arrayidx43 = getelementptr inbounds i64, i64* %44, i64 0
  store i64 0, i64* %arrayidx43, align 8
  %45 = load i64*, i64** %_17, align 8
  %arrayidx44 = getelementptr inbounds i64, i64* %45, i64 1
  store i64 1, i64* %arrayidx44, align 8
  %46 = load i64*, i64** %_17, align 8
  %arrayidx45 = getelementptr inbounds i64, i64* %46, i64 2
  store i64 2, i64* %arrayidx45, align 8
  %47 = load i64*, i64** %_17, align 8
  %arrayidx46 = getelementptr inbounds i64, i64* %47, i64 3
  store i64 3, i64* %arrayidx46, align 8
  %48 = load i64*, i64** %_17, align 8
  %arrayidx47 = getelementptr inbounds i64, i64* %48, i64 4
  store i64 4, i64* %arrayidx47, align 8
  %49 = load i64*, i64** %_17, align 8
  %arrayidx48 = getelementptr inbounds i64, i64* %49, i64 5
  store i64 5, i64* %arrayidx48, align 8
  %50 = load i64*, i64** %_17, align 8
  %arrayidx49 = getelementptr inbounds i64, i64* %50, i64 6
  store i64 6, i64* %arrayidx49, align 8
  %51 = load i64*, i64** %_17, align 8
  %arrayidx50 = getelementptr inbounds i64, i64* %51, i64 7
  store i64 7, i64* %arrayidx50, align 8
  %52 = load i64*, i64** %_17, align 8
  %arrayidx51 = getelementptr inbounds i64, i64* %52, i64 8
  store i64 8, i64* %arrayidx51, align 8
  store i8 1, i8* %_17_has_ownership, align 1
  %53 = load i64, i64* %i, align 8
  %54 = load i64*, i64** %_17, align 8
  %arrayidx52 = getelementptr inbounds i64, i64* %54, i64 %53
  %55 = load i64, i64* %arrayidx52, align 8
  store i64 %55, i64* %_18, align 8
  %56 = load i64, i64* %_18, align 8
  store i64 %56, i64* %p, align 8
  store i64 0, i64* %_19, align 8
  %57 = load i64, i64* %p, align 8
  %58 = load i64, i64* %_19, align 8
  %cmp53 = icmp slt i64 %57, %58
  br i1 %cmp53, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end41
  br label %blklab21

if.end56:                                         ; preds = %if.end41
  store i64 9, i64* %_20, align 8
  %59 = load i64, i64* %p, align 8
  %60 = load i64, i64* %_20, align 8
  %cmp57 = icmp sle i64 %59, %60
  br i1 %cmp57, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end56
  br label %blklab19

if.end60:                                         ; preds = %if.end56
  br label %blklab21

blklab21:                                         ; preds = %if.end60, %if.then55
  br label %blklab17

blklab19:                                         ; preds = %if.then59
  %61 = load %struct.Board*, %struct.Board** %b1, align 8
  %cmp61 = icmp eq %struct.Board* %61, null
  br i1 %cmp61, label %if.then63, label %if.end64

if.then63:                                        ; preds = %blklab19
  br label %blklab22

if.end64:                                         ; preds = %blklab19
  store i64 1, i64* %_21, align 8
  %62 = load i64, i64* %_21, align 8
  %63 = load i64, i64* %p, align 8
  %64 = load %struct.Board*, %struct.Board** %b1, align 8
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %64, i32 0, i32 0
  %65 = load i64*, i64** %pieces, align 8
  %arrayidx65 = getelementptr inbounds i64, i64* %65, i64 %63
  store i64 %62, i64* %arrayidx65, align 8
  %66 = load %struct.Board*, %struct.Board** %b1, align 8
  %move = getelementptr inbounds %struct.Board, %struct.Board* %66, i32 0, i32 2
  %67 = load i64, i64* %move, align 8
  store i64 %67, i64* %_22, align 8
  store i64 1, i64* %_23, align 8
  %68 = load i64, i64* %_22, align 8
  %69 = load i64, i64* %_23, align 8
  %add = add nsw i64 %68, %69
  store i64 %add, i64* %_24, align 8
  %70 = load i64, i64* %_24, align 8
  %71 = load %struct.Board*, %struct.Board** %b1, align 8
  %move66 = getelementptr inbounds %struct.Board, %struct.Board* %71, i32 0, i32 2
  store i64 %70, i64* %move66, align 8
  %72 = load i8, i8* %b2_has_ownership, align 1
  %tobool67 = trunc i8 %72 to i1
  br i1 %tobool67, label %if.then68, label %if.end69

if.then68:                                        ; preds = %if.end64
  %73 = load %struct.Board*, %struct.Board** %b2, align 8
  call void @free_Board(%struct.Board* %73)
  store i8 0, i8* %b2_has_ownership, align 1
  br label %if.end69

if.end69:                                         ; preds = %if.then68, %if.end64
  %74 = load %struct.Board*, %struct.Board** %b1, align 8
  store %struct.Board* %74, %struct.Board** %b2, align 8
  store i8 1, i8* %b2_has_ownership, align 1
  store i8 0, i8* %b1_has_ownership, align 1
  %75 = load i8, i8* %b1_has_ownership, align 1
  %tobool70 = trunc i8 %75 to i1
  br i1 %tobool70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end69
  %76 = load %struct.Board*, %struct.Board** %b1, align 8
  call void @free_Board(%struct.Board* %76)
  store i8 0, i8* %b1_has_ownership, align 1
  br label %if.end72

if.end72:                                         ; preds = %if.then71, %if.end69
  store %struct.Board* null, %struct.Board** %b1, align 8
  store i8 0, i8* %b1_has_ownership, align 1
  br label %blklab23

blklab22:                                         ; preds = %if.then63
  %77 = load %struct.Board*, %struct.Board** %b2, align 8
  %cmp73 = icmp eq %struct.Board* %77, null
  br i1 %cmp73, label %if.then75, label %if.end76

if.then75:                                        ; preds = %blklab22
  br label %blklab24

if.end76:                                         ; preds = %blklab22
  store i64 2, i64* %_26, align 8
  %78 = load i64, i64* %_26, align 8
  %79 = load i64, i64* %p, align 8
  %80 = load %struct.Board*, %struct.Board** %b2, align 8
  %pieces77 = getelementptr inbounds %struct.Board, %struct.Board* %80, i32 0, i32 0
  %81 = load i64*, i64** %pieces77, align 8
  %arrayidx78 = getelementptr inbounds i64, i64* %81, i64 %79
  store i64 %78, i64* %arrayidx78, align 8
  %82 = load %struct.Board*, %struct.Board** %b2, align 8
  %move79 = getelementptr inbounds %struct.Board, %struct.Board* %82, i32 0, i32 2
  %83 = load i64, i64* %move79, align 8
  store i64 %83, i64* %_27, align 8
  store i64 1, i64* %_28, align 8
  %84 = load i64, i64* %_27, align 8
  %85 = load i64, i64* %_28, align 8
  %add80 = add nsw i64 %84, %85
  store i64 %add80, i64* %_29, align 8
  %86 = load i64, i64* %_29, align 8
  %87 = load %struct.Board*, %struct.Board** %b2, align 8
  %move81 = getelementptr inbounds %struct.Board, %struct.Board* %87, i32 0, i32 2
  store i64 %86, i64* %move81, align 8
  %88 = load i8, i8* %b1_has_ownership, align 1
  %tobool82 = trunc i8 %88 to i1
  br i1 %tobool82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end76
  %89 = load %struct.Board*, %struct.Board** %b1, align 8
  call void @free_Board(%struct.Board* %89)
  store i8 0, i8* %b1_has_ownership, align 1
  br label %if.end84

if.end84:                                         ; preds = %if.then83, %if.end76
  %90 = load %struct.Board*, %struct.Board** %b2, align 8
  store %struct.Board* %90, %struct.Board** %b1, align 8
  store i8 1, i8* %b1_has_ownership, align 1
  store i8 0, i8* %b2_has_ownership, align 1
  %91 = load i8, i8* %b2_has_ownership, align 1
  %tobool85 = trunc i8 %91 to i1
  br i1 %tobool85, label %if.then86, label %if.end87

if.then86:                                        ; preds = %if.end84
  %92 = load %struct.Board*, %struct.Board** %b2, align 8
  call void @free_Board(%struct.Board* %92)
  store i8 0, i8* %b2_has_ownership, align 1
  br label %if.end87

if.end87:                                         ; preds = %if.then86, %if.end84
  store %struct.Board* null, %struct.Board** %b2, align 8
  store i8 0, i8* %b2_has_ownership, align 1
  br label %blklab24

blklab24:                                         ; preds = %if.end87, %if.then75
  br label %blklab23

blklab23:                                         ; preds = %blklab24, %if.end72
  br label %blklab20

blklab20:                                         ; preds = %blklab23
  store i64 1, i64* %_31, align 8
  %93 = load i64, i64* %i, align 8
  %94 = load i64, i64* %_31, align 8
  %add88 = add nsw i64 %93, %94
  store i64 %add88, i64* %_32, align 8
  %95 = load i64, i64* %_32, align 8
  store i64 %95, i64* %i, align 8
  br label %blklab18

blklab18:                                         ; preds = %blklab20
  br label %while.body21

blklab17:                                         ; preds = %blklab21, %if.then37
  %96 = load %struct.Board*, %struct.Board** %b1, align 8
  %cmp89 = icmp eq %struct.Board* %96, null
  br i1 %cmp89, label %if.then91, label %if.end92

if.then91:                                        ; preds = %blklab17
  br label %blklab25

if.end92:                                         ; preds = %blklab17
  %97 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call93 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %97, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab25:                                         ; preds = %if.then91
  %98 = load %struct.Board*, %struct.Board** %b2, align 8
  %cmp94 = icmp eq %struct.Board* %98, null
  br i1 %cmp94, label %if.then96, label %if.end97

if.then96:                                        ; preds = %blklab25
  br label %blklab27

if.end97:                                         ; preds = %blklab25
  %99 = load %struct.Board*, %struct.Board** %b2, align 8
  %move98 = getelementptr inbounds %struct.Board, %struct.Board* %99, i32 0, i32 2
  %100 = load i64, i64* %move98, align 8
  store i64 %100, i64* %_33, align 8
  store i64 9, i64* %_34, align 8
  %101 = load i64, i64* %_33, align 8
  %102 = load i64, i64* %_34, align 8
  %cmp99 = icmp eq i64 %101, %102
  br i1 %cmp99, label %if.then101, label %if.end102

if.then101:                                       ; preds = %if.end97
  br label %blklab26

if.end102:                                        ; preds = %if.end97
  br label %blklab27

blklab27:                                         ; preds = %if.end102, %if.then96
  %103 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call103 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %103, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab26:                                         ; preds = %if.then101
  %104 = load %struct.Board*, %struct.Board** %b2, align 8
  %cmp104 = icmp eq %struct.Board* %104, null
  br i1 %cmp104, label %if.then106, label %if.end107

if.then106:                                       ; preds = %blklab26
  br label %blklab29

if.end107:                                        ; preds = %blklab26
  %105 = load i8, i8* %_35_has_ownership, align 1
  %tobool108 = trunc i8 %105 to i1
  br i1 %tobool108, label %if.then109, label %if.end110

if.then109:                                       ; preds = %if.end107
  %106 = load i64*, i64** %_35, align 8
  %107 = bitcast i64* %106 to i8*
  call void @free(i8* %107) #4
  store i8 0, i8* %_35_has_ownership, align 1
  br label %if.end110

if.end110:                                        ; preds = %if.then109, %if.end107
  %108 = load %struct.Board*, %struct.Board** %b2, align 8
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %108, i32 0, i32 1
  %109 = load i64, i64* %pieces_size, align 8
  store i64 %109, i64* %_35_size, align 8
  %110 = load %struct.Board*, %struct.Board** %b2, align 8
  %pieces111 = getelementptr inbounds %struct.Board, %struct.Board* %110, i32 0, i32 0
  %111 = load i64*, i64** %pieces111, align 8
  store i64* %111, i64** %_35, align 8
  store i64 1, i64* %_36, align 8
  store i64 2, i64* %_37, align 8
  store i64 1, i64* %_38, align 8
  store i64 2, i64* %_39, align 8
  store i64 1, i64* %_40, align 8
  store i64 2, i64* %_41, align 8
  store i64 1, i64* %_42, align 8
  store i64 2, i64* %_43, align 8
  store i64 1, i64* %_44, align 8
  %112 = load i8, i8* %_45_has_ownership, align 1
  %tobool112 = trunc i8 %112 to i1
  br i1 %tobool112, label %if.then113, label %if.end114

if.then113:                                       ; preds = %if.end110
  %113 = load i64*, i64** %_45, align 8
  %114 = bitcast i64* %113 to i8*
  call void @free(i8* %114) #4
  store i8 0, i8* %_45_has_ownership, align 1
  br label %if.end114

if.end114:                                        ; preds = %if.then113, %if.end110
  store i64 9, i64* %_45_size, align 8
  %call115 = call noalias i8* @malloc(i64 72) #4
  %115 = bitcast i8* %call115 to i64*
  store i64* %115, i64** %_45, align 8
  %116 = load i64, i64* %_36, align 8
  %117 = load i64*, i64** %_45, align 8
  %arrayidx116 = getelementptr inbounds i64, i64* %117, i64 0
  store i64 %116, i64* %arrayidx116, align 8
  %118 = load i64, i64* %_37, align 8
  %119 = load i64*, i64** %_45, align 8
  %arrayidx117 = getelementptr inbounds i64, i64* %119, i64 1
  store i64 %118, i64* %arrayidx117, align 8
  %120 = load i64, i64* %_38, align 8
  %121 = load i64*, i64** %_45, align 8
  %arrayidx118 = getelementptr inbounds i64, i64* %121, i64 2
  store i64 %120, i64* %arrayidx118, align 8
  %122 = load i64, i64* %_39, align 8
  %123 = load i64*, i64** %_45, align 8
  %arrayidx119 = getelementptr inbounds i64, i64* %123, i64 3
  store i64 %122, i64* %arrayidx119, align 8
  %124 = load i64, i64* %_40, align 8
  %125 = load i64*, i64** %_45, align 8
  %arrayidx120 = getelementptr inbounds i64, i64* %125, i64 4
  store i64 %124, i64* %arrayidx120, align 8
  %126 = load i64, i64* %_41, align 8
  %127 = load i64*, i64** %_45, align 8
  %arrayidx121 = getelementptr inbounds i64, i64* %127, i64 5
  store i64 %126, i64* %arrayidx121, align 8
  %128 = load i64, i64* %_42, align 8
  %129 = load i64*, i64** %_45, align 8
  %arrayidx122 = getelementptr inbounds i64, i64* %129, i64 6
  store i64 %128, i64* %arrayidx122, align 8
  %130 = load i64, i64* %_43, align 8
  %131 = load i64*, i64** %_45, align 8
  %arrayidx123 = getelementptr inbounds i64, i64* %131, i64 7
  store i64 %130, i64* %arrayidx123, align 8
  %132 = load i64, i64* %_44, align 8
  %133 = load i64*, i64** %_45, align 8
  %arrayidx124 = getelementptr inbounds i64, i64* %133, i64 8
  store i64 %132, i64* %arrayidx124, align 8
  store i8 1, i8* %_45_has_ownership, align 1
  %134 = load i64*, i64** %_35, align 8
  %135 = load i64, i64* %_35_size, align 8
  %136 = load i64*, i64** %_45, align 8
  %137 = load i64, i64* %_45_size, align 8
  %call125 = call i32 @isArrayEqual(i64* %134, i64 %135, i64* %136, i64 %137)
  %cmp126 = icmp eq i32 %call125, 1
  br i1 %cmp126, label %if.then128, label %if.end129

if.then128:                                       ; preds = %if.end114
  br label %blklab28

if.end129:                                        ; preds = %if.end114
  br label %blklab29

blklab29:                                         ; preds = %if.end129, %if.then106
  %138 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call130 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %138, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab28:                                         ; preds = %if.then128
  store i64 1, i64* %_46, align 8
  %139 = load i64, i64* %repeat, align 8
  %140 = load i64, i64* %_46, align 8
  %add131 = add nsw i64 %139, %140
  store i64 %add131, i64* %_47, align 8
  %141 = load i64, i64* %_47, align 8
  store i64 %141, i64* %repeat, align 8
  br label %blklab16

blklab16:                                         ; preds = %blklab28
  br label %while.body

blklab15:                                         ; preds = %if.then5
  %142 = load i8, i8* %_50_has_ownership, align 1
  %tobool132 = trunc i8 %142 to i1
  br i1 %tobool132, label %if.then133, label %if.end134

if.then133:                                       ; preds = %blklab15
  %143 = load i64*, i64** %_50, align 8
  %144 = bitcast i64* %143 to i8*
  call void @free(i8* %144) #4
  store i8 0, i8* %_50_has_ownership, align 1
  br label %if.end134

if.end134:                                        ; preds = %if.then133, %blklab15
  store i64 41, i64* %_50_size, align 8
  %call135 = call noalias i8* @malloc(i64 328) #4
  %145 = bitcast i8* %call135 to i64*
  store i64* %145, i64** %_50, align 8
  %146 = load i64*, i64** %_50, align 8
  %arrayidx136 = getelementptr inbounds i64, i64* %146, i64 0
  store i64 80, i64* %arrayidx136, align 8
  %147 = load i64*, i64** %_50, align 8
  %arrayidx137 = getelementptr inbounds i64, i64* %147, i64 1
  store i64 97, i64* %arrayidx137, align 8
  %148 = load i64*, i64** %_50, align 8
  %arrayidx138 = getelementptr inbounds i64, i64* %148, i64 2
  store i64 115, i64* %arrayidx138, align 8
  %149 = load i64*, i64** %_50, align 8
  %arrayidx139 = getelementptr inbounds i64, i64* %149, i64 3
  store i64 115, i64* %arrayidx139, align 8
  %150 = load i64*, i64** %_50, align 8
  %arrayidx140 = getelementptr inbounds i64, i64* %150, i64 4
  store i64 32, i64* %arrayidx140, align 8
  %151 = load i64*, i64** %_50, align 8
  %arrayidx141 = getelementptr inbounds i64, i64* %151, i64 5
  store i64 110, i64* %arrayidx141, align 8
  %152 = load i64*, i64** %_50, align 8
  %arrayidx142 = getelementptr inbounds i64, i64* %152, i64 6
  store i64 101, i64* %arrayidx142, align 8
  %153 = load i64*, i64** %_50, align 8
  %arrayidx143 = getelementptr inbounds i64, i64* %153, i64 7
  store i64 119, i64* %arrayidx143, align 8
  %154 = load i64*, i64** %_50, align 8
  %arrayidx144 = getelementptr inbounds i64, i64* %154, i64 8
  store i64 84, i64* %arrayidx144, align 8
  %155 = load i64*, i64** %_50, align 8
  %arrayidx145 = getelementptr inbounds i64, i64* %155, i64 9
  store i64 105, i64* %arrayidx145, align 8
  %156 = load i64*, i64** %_50, align 8
  %arrayidx146 = getelementptr inbounds i64, i64* %156, i64 10
  store i64 99, i64* %arrayidx146, align 8
  %157 = load i64*, i64** %_50, align 8
  %arrayidx147 = getelementptr inbounds i64, i64* %157, i64 11
  store i64 84, i64* %arrayidx147, align 8
  %158 = load i64*, i64** %_50, align 8
  %arrayidx148 = getelementptr inbounds i64, i64* %158, i64 12
  store i64 97, i64* %arrayidx148, align 8
  %159 = load i64*, i64** %_50, align 8
  %arrayidx149 = getelementptr inbounds i64, i64* %159, i64 13
  store i64 99, i64* %arrayidx149, align 8
  %160 = load i64*, i64** %_50, align 8
  %arrayidx150 = getelementptr inbounds i64, i64* %160, i64 14
  store i64 84, i64* %arrayidx150, align 8
  %161 = load i64*, i64** %_50, align 8
  %arrayidx151 = getelementptr inbounds i64, i64* %161, i64 15
  store i64 111, i64* %arrayidx151, align 8
  %162 = load i64*, i64** %_50, align 8
  %arrayidx152 = getelementptr inbounds i64, i64* %162, i64 16
  store i64 101, i64* %arrayidx152, align 8
  %163 = load i64*, i64** %_50, align 8
  %arrayidx153 = getelementptr inbounds i64, i64* %163, i64 17
  store i64 32, i64* %arrayidx153, align 8
  %164 = load i64*, i64** %_50, align 8
  %arrayidx154 = getelementptr inbounds i64, i64* %164, i64 18
  store i64 116, i64* %arrayidx154, align 8
  %165 = load i64*, i64** %_50, align 8
  %arrayidx155 = getelementptr inbounds i64, i64* %165, i64 19
  store i64 101, i64* %arrayidx155, align 8
  %166 = load i64*, i64** %_50, align 8
  %arrayidx156 = getelementptr inbounds i64, i64* %166, i64 20
  store i64 115, i64* %arrayidx156, align 8
  %167 = load i64*, i64** %_50, align 8
  %arrayidx157 = getelementptr inbounds i64, i64* %167, i64 21
  store i64 116, i64* %arrayidx157, align 8
  %168 = load i64*, i64** %_50, align 8
  %arrayidx158 = getelementptr inbounds i64, i64* %168, i64 22
  store i64 32, i64* %arrayidx158, align 8
  %169 = load i64*, i64** %_50, align 8
  %arrayidx159 = getelementptr inbounds i64, i64* %169, i64 23
  store i64 99, i64* %arrayidx159, align 8
  %170 = load i64*, i64** %_50, align 8
  %arrayidx160 = getelementptr inbounds i64, i64* %170, i64 24
  store i64 97, i64* %arrayidx160, align 8
  %171 = load i64*, i64** %_50, align 8
  %arrayidx161 = getelementptr inbounds i64, i64* %171, i64 25
  store i64 115, i64* %arrayidx161, align 8
  %172 = load i64*, i64** %_50, align 8
  %arrayidx162 = getelementptr inbounds i64, i64* %172, i64 26
  store i64 101, i64* %arrayidx162, align 8
  %173 = load i64*, i64** %_50, align 8
  %arrayidx163 = getelementptr inbounds i64, i64* %173, i64 27
  store i64 32, i64* %arrayidx163, align 8
  %174 = load i64*, i64** %_50, align 8
  %arrayidx164 = getelementptr inbounds i64, i64* %174, i64 28
  store i64 119, i64* %arrayidx164, align 8
  %175 = load i64*, i64** %_50, align 8
  %arrayidx165 = getelementptr inbounds i64, i64* %175, i64 29
  store i64 105, i64* %arrayidx165, align 8
  %176 = load i64*, i64** %_50, align 8
  %arrayidx166 = getelementptr inbounds i64, i64* %176, i64 30
  store i64 116, i64* %arrayidx166, align 8
  %177 = load i64*, i64** %_50, align 8
  %arrayidx167 = getelementptr inbounds i64, i64* %177, i64 31
  store i64 104, i64* %arrayidx167, align 8
  %178 = load i64*, i64** %_50, align 8
  %arrayidx168 = getelementptr inbounds i64, i64* %178, i64 32
  store i64 32, i64* %arrayidx168, align 8
  %179 = load i64*, i64** %_50, align 8
  %arrayidx169 = getelementptr inbounds i64, i64* %179, i64 33
  store i64 105, i64* %arrayidx169, align 8
  %180 = load i64*, i64** %_50, align 8
  %arrayidx170 = getelementptr inbounds i64, i64* %180, i64 34
  store i64 110, i64* %arrayidx170, align 8
  %181 = load i64*, i64** %_50, align 8
  %arrayidx171 = getelementptr inbounds i64, i64* %181, i64 35
  store i64 112, i64* %arrayidx171, align 8
  %182 = load i64*, i64** %_50, align 8
  %arrayidx172 = getelementptr inbounds i64, i64* %182, i64 36
  store i64 117, i64* %arrayidx172, align 8
  %183 = load i64*, i64** %_50, align 8
  %arrayidx173 = getelementptr inbounds i64, i64* %183, i64 37
  store i64 116, i64* %arrayidx173, align 8
  %184 = load i64*, i64** %_50, align 8
  %arrayidx174 = getelementptr inbounds i64, i64* %184, i64 38
  store i64 32, i64* %arrayidx174, align 8
  %185 = load i64*, i64** %_50, align 8
  %arrayidx175 = getelementptr inbounds i64, i64* %185, i64 39
  store i64 61, i64* %arrayidx175, align 8
  %186 = load i64*, i64** %_50, align 8
  %arrayidx176 = getelementptr inbounds i64, i64* %186, i64 40
  store i64 32, i64* %arrayidx176, align 8
  store i8 1, i8* %_50_has_ownership, align 1
  %187 = load i64*, i64** %_50, align 8
  %188 = load i64, i64* %_50_size, align 8
  call void @printf_s(i64* %187, i64 %188)
  %189 = load i64, i64* %max, align 8
  %call177 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i64 %189)
  br label %blklab14

blklab14:                                         ; preds = %if.end134, %if.then
  %190 = load i8, i8* %b1_has_ownership, align 1
  %tobool178 = trunc i8 %190 to i1
  br i1 %tobool178, label %if.then179, label %if.end180

if.then179:                                       ; preds = %blklab14
  %191 = load %struct.Board*, %struct.Board** %b1, align 8
  call void @free_Board(%struct.Board* %191)
  store i8 0, i8* %b1_has_ownership, align 1
  br label %if.end180

if.end180:                                        ; preds = %if.then179, %blklab14
  %192 = load i8, i8* %b2_has_ownership, align 1
  %tobool181 = trunc i8 %192 to i1
  br i1 %tobool181, label %if.then182, label %if.end183

if.then182:                                       ; preds = %if.end180
  %193 = load %struct.Board*, %struct.Board** %b2, align 8
  call void @free_Board(%struct.Board* %193)
  store i8 0, i8* %b2_has_ownership, align 1
  br label %if.end183

if.end183:                                        ; preds = %if.then182, %if.end180
  %194 = load i8, i8* %_8_has_ownership, align 1
  %tobool184 = trunc i8 %194 to i1
  br i1 %tobool184, label %if.then185, label %if.end186

if.then185:                                       ; preds = %if.end183
  %195 = load i64**, i64*** %_8, align 8
  %196 = load i64, i64* %_8_size, align 8
  call void @free2DArray(i64** %195, i64 %196)
  store i8 0, i8* %_8_has_ownership, align 1
  br label %if.end186

if.end186:                                        ; preds = %if.then185, %if.end183
  %197 = load i8, i8* %_10_has_ownership, align 1
  %tobool187 = trunc i8 %197 to i1
  br i1 %tobool187, label %if.then188, label %if.end189

if.then188:                                       ; preds = %if.end186
  %198 = load i64*, i64** %_10, align 8
  %199 = bitcast i64* %198 to i8*
  call void @free(i8* %199) #4
  store i8 0, i8* %_10_has_ownership, align 1
  br label %if.end189

if.end189:                                        ; preds = %if.then188, %if.end186
  %200 = load i8, i8* %_12_has_ownership, align 1
  %tobool190 = trunc i8 %200 to i1
  br i1 %tobool190, label %if.then191, label %if.end192

if.then191:                                       ; preds = %if.end189
  %201 = load %struct.Board*, %struct.Board** %_12, align 8
  call void @free_Board(%struct.Board* %201)
  store i8 0, i8* %_12_has_ownership, align 1
  br label %if.end192

if.end192:                                        ; preds = %if.then191, %if.end189
  %202 = load i8, i8* %_13_has_ownership, align 1
  %tobool193 = trunc i8 %202 to i1
  br i1 %tobool193, label %if.then194, label %if.end195

if.then194:                                       ; preds = %if.end192
  %203 = load %struct.Board*, %struct.Board** %_13, align 8
  call void @free_Board(%struct.Board* %203)
  store i8 0, i8* %_13_has_ownership, align 1
  br label %if.end195

if.end195:                                        ; preds = %if.then194, %if.end192
  %204 = load i8, i8* %_15_has_ownership, align 1
  %tobool196 = trunc i8 %204 to i1
  br i1 %tobool196, label %if.then197, label %if.end198

if.then197:                                       ; preds = %if.end195
  %205 = load i64*, i64** %_15, align 8
  %206 = bitcast i64* %205 to i8*
  call void @free(i8* %206) #4
  store i8 0, i8* %_15_has_ownership, align 1
  br label %if.end198

if.end198:                                        ; preds = %if.then197, %if.end195
  %207 = load i8, i8* %_17_has_ownership, align 1
  %tobool199 = trunc i8 %207 to i1
  br i1 %tobool199, label %if.then200, label %if.end201

if.then200:                                       ; preds = %if.end198
  %208 = load i64*, i64** %_17, align 8
  %209 = bitcast i64* %208 to i8*
  call void @free(i8* %209) #4
  store i8 0, i8* %_17_has_ownership, align 1
  br label %if.end201

if.end201:                                        ; preds = %if.then200, %if.end198
  %210 = load i8, i8* %_35_has_ownership, align 1
  %tobool202 = trunc i8 %210 to i1
  br i1 %tobool202, label %if.then203, label %if.end204

if.then203:                                       ; preds = %if.end201
  %211 = load i64*, i64** %_35, align 8
  %212 = bitcast i64* %211 to i8*
  call void @free(i8* %212) #4
  store i8 0, i8* %_35_has_ownership, align 1
  br label %if.end204

if.end204:                                        ; preds = %if.then203, %if.end201
  %213 = load i8, i8* %_45_has_ownership, align 1
  %tobool205 = trunc i8 %213 to i1
  br i1 %tobool205, label %if.then206, label %if.end207

if.then206:                                       ; preds = %if.end204
  %214 = load i64*, i64** %_45, align 8
  %215 = bitcast i64* %214 to i8*
  call void @free(i8* %215) #4
  store i8 0, i8* %_45_has_ownership, align 1
  br label %if.end207

if.end207:                                        ; preds = %if.then206, %if.end204
  %216 = load i8, i8* %_50_has_ownership, align 1
  %tobool208 = trunc i8 %216 to i1
  br i1 %tobool208, label %if.then209, label %if.end210

if.then209:                                       ; preds = %if.end207
  %217 = load i64*, i64** %_50, align 8
  %218 = bitcast i64* %217 to i8*
  call void @free(i8* %218) #4
  store i8 0, i8* %_50_has_ownership, align 1
  br label %if.end210

if.end210:                                        ; preds = %if.then209, %if.end207
  call void @exit(i32 0) #5
  unreachable

return:                                           ; No predecessors!
  %219 = load i32, i32* %retval, align 4
  ret i32 %219
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64 @parseStringToInt(i64*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare i32 @isArrayEqual(i64*, i64, i64*, i64) #2

declare void @printf_s(i64*, i64) #2

declare void @free2DArray(i64**, i64) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 1f64ddbc4c5d1036b68ec896765a7535537ded85) (http://llvm.org/git/llvm.git f87dc438fd28550abfe9692daa50aaa331e7cf1a)"}
