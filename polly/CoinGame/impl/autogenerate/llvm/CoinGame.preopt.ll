; ModuleID = 'llvm/CoinGame.preopt.ll.tmp'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @play(%struct._IO_FILE* %sys, i64* %moves, i64 %moves_size, i1 zeroext %moves_has_ownership, i64 %n) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp8 = icmp sgt i64 %n, 0
  br i1 %cmp8, label %if.end.lr.ph, label %blklab0

if.end.lr.ph:                                     ; preds = %entry.split
  %sub = add nsw i64 %n, -1
  br label %if.end

if.end:                                           ; preds = %if.end.lr.ph, %blklab1
  %left.018 = phi i64 [ 0, %if.end.lr.ph ], [ %left.1, %blklab1 ]
  %right.017 = phi i64 [ %sub, %if.end.lr.ph ], [ %right.1, %blklab1 ]
  %i.016 = phi i64 [ 0, %if.end.lr.ph ], [ %add86, %blklab1 ]
  %sum_alice.015 = phi i64 [ 0, %if.end.lr.ph ], [ %sum_alice.1, %blklab1 ]
  %sum_bob.014 = phi i64 [ 0, %if.end.lr.ph ], [ %sum_bob.1, %blklab1 ]
  %_59_has_ownership.013 = phi i8 [ 0, %if.end.lr.ph ], [ %_59_has_ownership.1, %blklab1 ]
  %0 = phi i8* [ null, %if.end.lr.ph ], [ %66, %blklab1 ]
  %1 = phi i8* [ null, %if.end.lr.ph ], [ %65, %blklab1 ]
  %_55_has_ownership.012 = phi i8 [ 0, %if.end.lr.ph ], [ %_55_has_ownership.1, %blklab1 ]
  %2 = phi i8* [ null, %if.end.lr.ph ], [ %52, %blklab1 ]
  %3 = phi i8* [ null, %if.end.lr.ph ], [ %51, %blklab1 ]
  %_35_has_ownership.011 = phi i8 [ 0, %if.end.lr.ph ], [ %_35_has_ownership.1, %blklab1 ]
  %4 = phi i8* [ null, %if.end.lr.ph ], [ %64, %blklab1 ]
  %5 = phi i8* [ null, %if.end.lr.ph ], [ %63, %blklab1 ]
  %6 = phi i8* [ null, %if.end.lr.ph ], [ %50, %blklab1 ]
  %7 = phi i8* [ null, %if.end.lr.ph ], [ %49, %blklab1 ]
  %_38_has_ownership.010 = phi i8 [ 0, %if.end.lr.ph ], [ %_38_has_ownership.1, %blklab1 ]
  %8 = phi i8* [ null, %if.end.lr.ph ], [ %call58, %blklab1 ]
  %9 = phi i8* [ null, %if.end.lr.ph ], [ %call66, %blklab1 ]
  %_48_has_ownership.09 = phi i1 [ false, %if.end.lr.ph ], [ true, %blklab1 ]
  %add = add nsw i64 %left.018, 1
  %mul = mul nsw i64 %add, %n
  %add1 = add nsw i64 %mul, %right.017
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %add1
  %10 = load i64, i64* %arrayidx, align 8
  %mul2 = mul nsw i64 %left.018, %n
  %add3 = add i64 %right.017, -1
  %sub4 = add i64 %add3, %mul2
  %arrayidx5 = getelementptr inbounds i64, i64* %moves, i64 %sub4
  %11 = load i64, i64* %arrayidx5, align 8
  %cmp6 = icmp sgt i64 %10, %11
  %coin.0 = select i1 %cmp6, i64 %right.017, i64 %left.018
  %sub10 = sext i1 %cmp6 to i64
  %right.1 = add nsw i64 %right.017, %sub10
  %12 = zext i1 %cmp6 to i64
  %add9 = xor i64 %12, 1
  %left.1 = add nsw i64 %left.018, %add9
  %rem1 = and i64 %i.016, 1
  %cmp11 = icmp eq i64 %rem1, 0
  br i1 %cmp11, label %if.end13, label %blklab4

if.end13:                                         ; preds = %if.end
  %13 = and i8 %_35_has_ownership.011, 1
  %tobool = icmp eq i8 %13, 0
  br i1 %tobool, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end13
  tail call void @free(i8* %3) #4
  br label %if.end15

if.end15:                                         ; preds = %if.end13, %if.then14
  %call = tail call noalias i8* @malloc(i64 144) #4
  %14 = bitcast i8* %call to i64*
  store i64 65, i64* %14, align 8
  %arrayidx17 = getelementptr inbounds i8, i8* %call, i64 8
  %15 = bitcast i8* %arrayidx17 to i64*
  store i64 108, i64* %15, align 8
  %arrayidx18 = getelementptr inbounds i8, i8* %call, i64 16
  %16 = bitcast i8* %arrayidx18 to i64*
  store i64 105, i64* %16, align 8
  %arrayidx19 = getelementptr inbounds i8, i8* %call, i64 24
  %17 = bitcast i8* %arrayidx19 to i64*
  store i64 99, i64* %17, align 8
  %arrayidx20 = getelementptr inbounds i8, i8* %call, i64 32
  %18 = bitcast i8* %arrayidx20 to i64*
  store i64 101, i64* %18, align 8
  %arrayidx21 = getelementptr inbounds i8, i8* %call, i64 40
  %19 = bitcast i8* %arrayidx21 to i64*
  store i64 32, i64* %19, align 8
  %arrayidx22 = getelementptr inbounds i8, i8* %call, i64 48
  %20 = bitcast i8* %arrayidx22 to i64*
  store i64 116, i64* %20, align 8
  %arrayidx23 = getelementptr inbounds i8, i8* %call, i64 56
  %21 = bitcast i8* %arrayidx23 to i64*
  store i64 97, i64* %21, align 8
  %arrayidx24 = getelementptr inbounds i8, i8* %call, i64 64
  %22 = bitcast i8* %arrayidx24 to i64*
  store i64 107, i64* %22, align 8
  %arrayidx25 = getelementptr inbounds i8, i8* %call, i64 72
  %23 = bitcast i8* %arrayidx25 to i64*
  store i64 101, i64* %23, align 8
  %arrayidx26 = getelementptr inbounds i8, i8* %call, i64 80
  %24 = bitcast i8* %arrayidx26 to i64*
  store i64 32, i64* %24, align 8
  %arrayidx27 = getelementptr inbounds i8, i8* %call, i64 88
  %25 = bitcast i8* %arrayidx27 to i64*
  store i64 99, i64* %25, align 8
  %arrayidx28 = getelementptr inbounds i8, i8* %call, i64 96
  %26 = bitcast i8* %arrayidx28 to i64*
  store i64 111, i64* %26, align 8
  %arrayidx29 = getelementptr inbounds i8, i8* %call, i64 104
  %27 = bitcast i8* %arrayidx29 to i64*
  store i64 105, i64* %27, align 8
  %arrayidx30 = getelementptr inbounds i8, i8* %call, i64 112
  %28 = bitcast i8* %arrayidx30 to i64*
  store i64 110, i64* %28, align 8
  %arrayidx31 = getelementptr inbounds i8, i8* %call, i64 120
  %29 = bitcast i8* %arrayidx31 to i64*
  store i64 32, i64* %29, align 8
  %arrayidx32 = getelementptr inbounds i8, i8* %call, i64 128
  %30 = bitcast i8* %arrayidx32 to i64*
  store i64 40, i64* %30, align 8
  %arrayidx33 = getelementptr inbounds i8, i8* %call, i64 136
  %31 = bitcast i8* %arrayidx33 to i64*
  store i64 32, i64* %31, align 8
  tail call void @printf_s(i64* %14, i64 18) #4
  br label %blklab5

blklab4:                                          ; preds = %if.end
  %32 = and i8 %_38_has_ownership.010, 1
  %tobool34 = icmp eq i8 %32, 0
  br i1 %tobool34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %blklab4
  tail call void @free(i8* %7) #4
  br label %if.end36

if.end36:                                         ; preds = %blklab4, %if.then35
  %call37 = tail call noalias i8* @malloc(i64 128) #4
  %33 = bitcast i8* %call37 to i64*
  store i64 66, i64* %33, align 8
  %arrayidx39 = getelementptr inbounds i8, i8* %call37, i64 8
  %34 = bitcast i8* %arrayidx39 to i64*
  store i64 111, i64* %34, align 8
  %arrayidx40 = getelementptr inbounds i8, i8* %call37, i64 16
  %35 = bitcast i8* %arrayidx40 to i64*
  store i64 98, i64* %35, align 8
  %arrayidx41 = getelementptr inbounds i8, i8* %call37, i64 24
  %36 = bitcast i8* %arrayidx41 to i64*
  store i64 32, i64* %36, align 8
  %arrayidx42 = getelementptr inbounds i8, i8* %call37, i64 32
  %37 = bitcast i8* %arrayidx42 to i64*
  store i64 116, i64* %37, align 8
  %arrayidx43 = getelementptr inbounds i8, i8* %call37, i64 40
  %38 = bitcast i8* %arrayidx43 to i64*
  store i64 97, i64* %38, align 8
  %arrayidx44 = getelementptr inbounds i8, i8* %call37, i64 48
  %39 = bitcast i8* %arrayidx44 to i64*
  store i64 107, i64* %39, align 8
  %arrayidx45 = getelementptr inbounds i8, i8* %call37, i64 56
  %40 = bitcast i8* %arrayidx45 to i64*
  store i64 101, i64* %40, align 8
  %arrayidx46 = getelementptr inbounds i8, i8* %call37, i64 64
  %41 = bitcast i8* %arrayidx46 to i64*
  store i64 32, i64* %41, align 8
  %arrayidx47 = getelementptr inbounds i8, i8* %call37, i64 72
  %42 = bitcast i8* %arrayidx47 to i64*
  store i64 99, i64* %42, align 8
  %arrayidx48 = getelementptr inbounds i8, i8* %call37, i64 80
  %43 = bitcast i8* %arrayidx48 to i64*
  store i64 111, i64* %43, align 8
  %arrayidx49 = getelementptr inbounds i8, i8* %call37, i64 88
  %44 = bitcast i8* %arrayidx49 to i64*
  store i64 105, i64* %44, align 8
  %arrayidx50 = getelementptr inbounds i8, i8* %call37, i64 96
  %45 = bitcast i8* %arrayidx50 to i64*
  store i64 110, i64* %45, align 8
  %arrayidx51 = getelementptr inbounds i8, i8* %call37, i64 104
  %46 = bitcast i8* %arrayidx51 to i64*
  store i64 32, i64* %46, align 8
  %arrayidx52 = getelementptr inbounds i8, i8* %call37, i64 112
  %47 = bitcast i8* %arrayidx52 to i64*
  store i64 40, i64* %47, align 8
  %arrayidx53 = getelementptr inbounds i8, i8* %call37, i64 120
  %48 = bitcast i8* %arrayidx53 to i64*
  store i64 32, i64* %48, align 8
  tail call void @printf_s(i64* %33, i64 16) #4
  br label %blklab5

blklab5:                                          ; preds = %if.end36, %if.end15
  %_38_has_ownership.1 = phi i8 [ 1, %if.end36 ], [ %_38_has_ownership.010, %if.end15 ]
  %49 = phi i8* [ %call37, %if.end36 ], [ %7, %if.end15 ]
  %50 = phi i8* [ %call37, %if.end36 ], [ %6, %if.end15 ]
  %_35_has_ownership.1 = phi i8 [ %_35_has_ownership.011, %if.end36 ], [ 1, %if.end15 ]
  %51 = phi i8* [ %3, %if.end36 ], [ %call, %if.end15 ]
  %52 = phi i8* [ %2, %if.end36 ], [ %call, %if.end15 ]
  %call54 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %i.016) #4
  br i1 %_48_has_ownership.09, label %if.then56, label %if.end57

if.then56:                                        ; preds = %blklab5
  tail call void @free(i8* %8) #4
  br label %if.end57

if.end57:                                         ; preds = %if.then56, %blklab5
  %call58 = tail call noalias i8* @malloc(i64 24) #4
  %53 = bitcast i8* %call58 to i64*
  store i64 32, i64* %53, align 8
  %arrayidx60 = getelementptr inbounds i8, i8* %call58, i64 8
  %54 = bitcast i8* %arrayidx60 to i64*
  store i64 44, i64* %54, align 8
  %arrayidx61 = getelementptr inbounds i8, i8* %call58, i64 16
  %55 = bitcast i8* %arrayidx61 to i64*
  store i64 32, i64* %55, align 8
  tail call void @printf_s(i64* %53, i64 3) #4
  %call62 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %coin.0) #4
  br i1 %_48_has_ownership.09, label %if.then64, label %if.end65

if.then64:                                        ; preds = %if.end57
  tail call void @free(i8* %9) #4
  br label %if.end65

if.end65:                                         ; preds = %if.then64, %if.end57
  %call66 = tail call noalias i8* @malloc(i64 16) #4
  %56 = bitcast i8* %call66 to i64*
  store i64 32, i64* %56, align 8
  %arrayidx68 = getelementptr inbounds i8, i8* %call66, i64 8
  %57 = bitcast i8* %arrayidx68 to i64*
  store i64 41, i64* %57, align 8
  tail call void @printf_s(i64* %56, i64 2) #4
  %rem692 = and i64 %i.016, 1
  %cmp70 = icmp eq i64 %rem692, 0
  br i1 %cmp70, label %if.end72, label %blklab6

if.end72:                                         ; preds = %if.end65
  %add73 = add nsw i64 %coin.0, %sum_alice.015
  %58 = and i8 %_55_has_ownership.012, 1
  %tobool74 = icmp eq i8 %58, 0
  br i1 %tobool74, label %if.end76, label %if.then75

if.then75:                                        ; preds = %if.end72
  tail call void @free(i8* %5) #4
  br label %if.end76

if.end76:                                         ; preds = %if.end72, %if.then75
  %call77 = tail call noalias i8* @malloc(i64 16) #4
  %59 = bitcast i8* %call77 to i64*
  store i64 44, i64* %59, align 8
  %arrayidx79 = getelementptr inbounds i8, i8* %call77, i64 8
  %60 = bitcast i8* %arrayidx79 to i64*
  store i64 32, i64* %60, align 8
  tail call void @printf_s(i64* %59, i64 2) #4
  br label %blklab1

blklab6:                                          ; preds = %if.end65
  %add80 = add nsw i64 %coin.0, %sum_bob.014
  %61 = and i8 %_59_has_ownership.013, 1
  %tobool81 = icmp eq i8 %61, 0
  br i1 %tobool81, label %if.end83, label %if.then82

if.then82:                                        ; preds = %blklab6
  tail call void @free(i8* %1) #4
  br label %if.end83

if.end83:                                         ; preds = %blklab6, %if.then82
  %call84 = tail call noalias i8* @malloc(i64 8) #4
  %62 = bitcast i8* %call84 to i64*
  store i64 32, i64* %62, align 8
  tail call void @println_s(i64* %62, i64 1) #4
  br label %blklab1

blklab1:                                          ; preds = %if.end76, %if.end83
  %63 = phi i8* [ %5, %if.end83 ], [ %call77, %if.end76 ]
  %64 = phi i8* [ %4, %if.end83 ], [ %call77, %if.end76 ]
  %_55_has_ownership.1 = phi i8 [ %_55_has_ownership.012, %if.end83 ], [ 1, %if.end76 ]
  %65 = phi i8* [ %call84, %if.end83 ], [ %1, %if.end76 ]
  %66 = phi i8* [ %call84, %if.end83 ], [ %0, %if.end76 ]
  %_59_has_ownership.1 = phi i8 [ 1, %if.end83 ], [ %_59_has_ownership.013, %if.end76 ]
  %sum_bob.1 = phi i64 [ %add80, %if.end83 ], [ %sum_bob.014, %if.end76 ]
  %sum_alice.1 = phi i64 [ %sum_alice.015, %if.end83 ], [ %add73, %if.end76 ]
  %add86 = add nuw nsw i64 %i.016, 1
  %exitcond = icmp ne i64 %add86, %n
  br i1 %exitcond, label %if.end, label %while.body.blklab0_crit_edge

while.body.blklab0_crit_edge:                     ; preds = %blklab1
  %sum_alice.1.lcssa = phi i64 [ %sum_alice.1, %blklab1 ]
  %sum_bob.1.lcssa = phi i64 [ %sum_bob.1, %blklab1 ]
  %_59_has_ownership.1.lcssa = phi i8 [ %_59_has_ownership.1, %blklab1 ]
  %.lcssa34 = phi i8* [ %66, %blklab1 ]
  %_55_has_ownership.1.lcssa = phi i8 [ %_55_has_ownership.1, %blklab1 ]
  %.lcssa33 = phi i8* [ %64, %blklab1 ]
  %call66.lcssa = phi i8* [ %call66, %blklab1 ]
  %call58.lcssa = phi i8* [ %call58, %blklab1 ]
  %.lcssa32 = phi i8* [ %52, %blklab1 ]
  %_35_has_ownership.1.lcssa = phi i8 [ %_35_has_ownership.1, %blklab1 ]
  %.lcssa31 = phi i8* [ %50, %blklab1 ]
  %_38_has_ownership.1.lcssa = phi i8 [ %_38_has_ownership.1, %blklab1 ]
  br label %blklab0

blklab0:                                          ; preds = %while.body.blklab0_crit_edge, %entry.split
  %sum_alice.0.lcssa = phi i64 [ %sum_alice.1.lcssa, %while.body.blklab0_crit_edge ], [ 0, %entry.split ]
  %sum_bob.0.lcssa = phi i64 [ %sum_bob.1.lcssa, %while.body.blklab0_crit_edge ], [ 0, %entry.split ]
  %_59_has_ownership.0.lcssa = phi i8 [ %_59_has_ownership.1.lcssa, %while.body.blklab0_crit_edge ], [ 0, %entry.split ]
  %.lcssa7 = phi i8* [ %.lcssa34, %while.body.blklab0_crit_edge ], [ null, %entry.split ]
  %_55_has_ownership.0.lcssa = phi i8 [ %_55_has_ownership.1.lcssa, %while.body.blklab0_crit_edge ], [ 0, %entry.split ]
  %.lcssa6 = phi i8* [ %.lcssa32, %while.body.blklab0_crit_edge ], [ null, %entry.split ]
  %_35_has_ownership.0.lcssa = phi i8 [ %_35_has_ownership.1.lcssa, %while.body.blklab0_crit_edge ], [ 0, %entry.split ]
  %.lcssa5 = phi i8* [ %.lcssa33, %while.body.blklab0_crit_edge ], [ null, %entry.split ]
  %.lcssa4 = phi i8* [ %.lcssa31, %while.body.blklab0_crit_edge ], [ null, %entry.split ]
  %_38_has_ownership.0.lcssa = phi i8 [ %_38_has_ownership.1.lcssa, %while.body.blklab0_crit_edge ], [ 0, %entry.split ]
  %.lcssa3 = phi i8* [ %call58.lcssa, %while.body.blklab0_crit_edge ], [ null, %entry.split ]
  %.lcssa = phi i8* [ %call66.lcssa, %while.body.blklab0_crit_edge ], [ null, %entry.split ]
  %_48_has_ownership.0.lcssa = phi i1 [ true, %while.body.blklab0_crit_edge ], [ false, %entry.split ]
  %cmp87 = icmp slt i64 %sum_alice.0.lcssa, %sum_bob.0.lcssa
  br i1 %cmp87, label %if.end89, label %if.end93

if.end89:                                         ; preds = %blklab0
  %67 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %68 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %67) #5
  tail call void @exit(i32 -1) #6
  unreachable

if.end93:                                         ; preds = %blklab0
  %call94 = tail call noalias i8* @malloc(i64 384) #4
  %69 = bitcast i8* %call94 to i64*
  store i64 84, i64* %69, align 8
  %arrayidx96 = getelementptr inbounds i8, i8* %call94, i64 8
  %70 = bitcast i8* %arrayidx96 to i64*
  store i64 104, i64* %70, align 8
  %arrayidx97 = getelementptr inbounds i8, i8* %call94, i64 16
  %71 = bitcast i8* %arrayidx97 to i64*
  store i64 101, i64* %71, align 8
  %arrayidx98 = getelementptr inbounds i8, i8* %call94, i64 24
  %72 = bitcast i8* %arrayidx98 to i64*
  store i64 32, i64* %72, align 8
  %arrayidx99 = getelementptr inbounds i8, i8* %call94, i64 32
  %73 = bitcast i8* %arrayidx99 to i64*
  store i64 116, i64* %73, align 8
  %arrayidx100 = getelementptr inbounds i8, i8* %call94, i64 40
  %74 = bitcast i8* %arrayidx100 to i64*
  store i64 111, i64* %74, align 8
  %arrayidx101 = getelementptr inbounds i8, i8* %call94, i64 48
  %75 = bitcast i8* %arrayidx101 to i64*
  store i64 116, i64* %75, align 8
  %arrayidx102 = getelementptr inbounds i8, i8* %call94, i64 56
  %76 = bitcast i8* %arrayidx102 to i64*
  store i64 97, i64* %76, align 8
  %arrayidx103 = getelementptr inbounds i8, i8* %call94, i64 64
  %77 = bitcast i8* %arrayidx103 to i64*
  store i64 108, i64* %77, align 8
  %arrayidx104 = getelementptr inbounds i8, i8* %call94, i64 72
  %78 = bitcast i8* %arrayidx104 to i64*
  store i64 32, i64* %78, align 8
  %arrayidx105 = getelementptr inbounds i8, i8* %call94, i64 80
  %79 = bitcast i8* %arrayidx105 to i64*
  store i64 97, i64* %79, align 8
  %arrayidx106 = getelementptr inbounds i8, i8* %call94, i64 88
  %80 = bitcast i8* %arrayidx106 to i64*
  store i64 109, i64* %80, align 8
  %arrayidx107 = getelementptr inbounds i8, i8* %call94, i64 96
  %81 = bitcast i8* %arrayidx107 to i64*
  store i64 111, i64* %81, align 8
  %arrayidx108 = getelementptr inbounds i8, i8* %call94, i64 104
  %82 = bitcast i8* %arrayidx108 to i64*
  store i64 117, i64* %82, align 8
  %arrayidx109 = getelementptr inbounds i8, i8* %call94, i64 112
  %83 = bitcast i8* %arrayidx109 to i64*
  store i64 110, i64* %83, align 8
  %arrayidx110 = getelementptr inbounds i8, i8* %call94, i64 120
  %84 = bitcast i8* %arrayidx110 to i64*
  store i64 116, i64* %84, align 8
  %arrayidx111 = getelementptr inbounds i8, i8* %call94, i64 128
  %85 = bitcast i8* %arrayidx111 to i64*
  store i64 32, i64* %85, align 8
  %arrayidx112 = getelementptr inbounds i8, i8* %call94, i64 136
  %86 = bitcast i8* %arrayidx112 to i64*
  store i64 111, i64* %86, align 8
  %arrayidx113 = getelementptr inbounds i8, i8* %call94, i64 144
  %87 = bitcast i8* %arrayidx113 to i64*
  store i64 102, i64* %87, align 8
  %arrayidx114 = getelementptr inbounds i8, i8* %call94, i64 152
  %88 = bitcast i8* %arrayidx114 to i64*
  store i64 32, i64* %88, align 8
  %arrayidx115 = getelementptr inbounds i8, i8* %call94, i64 160
  %89 = bitcast i8* %arrayidx115 to i64*
  store i64 109, i64* %89, align 8
  %arrayidx116 = getelementptr inbounds i8, i8* %call94, i64 168
  %90 = bitcast i8* %arrayidx116 to i64*
  store i64 111, i64* %90, align 8
  %arrayidx117 = getelementptr inbounds i8, i8* %call94, i64 176
  %91 = bitcast i8* %arrayidx117 to i64*
  store i64 110, i64* %91, align 8
  %arrayidx118 = getelementptr inbounds i8, i8* %call94, i64 184
  %92 = bitcast i8* %arrayidx118 to i64*
  store i64 101, i64* %92, align 8
  %arrayidx119 = getelementptr inbounds i8, i8* %call94, i64 192
  %93 = bitcast i8* %arrayidx119 to i64*
  store i64 121, i64* %93, align 8
  %arrayidx120 = getelementptr inbounds i8, i8* %call94, i64 200
  %94 = bitcast i8* %arrayidx120 to i64*
  store i64 32, i64* %94, align 8
  %arrayidx121 = getelementptr inbounds i8, i8* %call94, i64 208
  %95 = bitcast i8* %arrayidx121 to i64*
  store i64 40, i64* %95, align 8
  %arrayidx122 = getelementptr inbounds i8, i8* %call94, i64 216
  %96 = bitcast i8* %arrayidx122 to i64*
  store i64 109, i64* %96, align 8
  %arrayidx123 = getelementptr inbounds i8, i8* %call94, i64 224
  %97 = bitcast i8* %arrayidx123 to i64*
  store i64 97, i64* %97, align 8
  %arrayidx124 = getelementptr inbounds i8, i8* %call94, i64 232
  %98 = bitcast i8* %arrayidx124 to i64*
  store i64 120, i64* %98, align 8
  %arrayidx125 = getelementptr inbounds i8, i8* %call94, i64 240
  %99 = bitcast i8* %arrayidx125 to i64*
  store i64 105, i64* %99, align 8
  %arrayidx126 = getelementptr inbounds i8, i8* %call94, i64 248
  %100 = bitcast i8* %arrayidx126 to i64*
  store i64 109, i64* %100, align 8
  %arrayidx127 = getelementptr inbounds i8, i8* %call94, i64 256
  %101 = bitcast i8* %arrayidx127 to i64*
  store i64 117, i64* %101, align 8
  %arrayidx128 = getelementptr inbounds i8, i8* %call94, i64 264
  %102 = bitcast i8* %arrayidx128 to i64*
  store i64 109, i64* %102, align 8
  %arrayidx129 = getelementptr inbounds i8, i8* %call94, i64 272
  %103 = bitcast i8* %arrayidx129 to i64*
  store i64 41, i64* %103, align 8
  %arrayidx130 = getelementptr inbounds i8, i8* %call94, i64 280
  %104 = bitcast i8* %arrayidx130 to i64*
  store i64 32, i64* %104, align 8
  %arrayidx131 = getelementptr inbounds i8, i8* %call94, i64 288
  %105 = bitcast i8* %arrayidx131 to i64*
  store i64 66, i64* %105, align 8
  %arrayidx132 = getelementptr inbounds i8, i8* %call94, i64 296
  %106 = bitcast i8* %arrayidx132 to i64*
  store i64 111, i64* %106, align 8
  %arrayidx133 = getelementptr inbounds i8, i8* %call94, i64 304
  %107 = bitcast i8* %arrayidx133 to i64*
  store i64 98, i64* %107, align 8
  %arrayidx134 = getelementptr inbounds i8, i8* %call94, i64 312
  %108 = bitcast i8* %arrayidx134 to i64*
  store i64 32, i64* %108, align 8
  %arrayidx135 = getelementptr inbounds i8, i8* %call94, i64 320
  %109 = bitcast i8* %arrayidx135 to i64*
  store i64 103, i64* %109, align 8
  %arrayidx136 = getelementptr inbounds i8, i8* %call94, i64 328
  %110 = bitcast i8* %arrayidx136 to i64*
  store i64 101, i64* %110, align 8
  %arrayidx137 = getelementptr inbounds i8, i8* %call94, i64 336
  %111 = bitcast i8* %arrayidx137 to i64*
  store i64 116, i64* %111, align 8
  %arrayidx138 = getelementptr inbounds i8, i8* %call94, i64 344
  %112 = bitcast i8* %arrayidx138 to i64*
  store i64 115, i64* %112, align 8
  %arrayidx139 = getelementptr inbounds i8, i8* %call94, i64 352
  %113 = bitcast i8* %arrayidx139 to i64*
  store i64 32, i64* %113, align 8
  %arrayidx140 = getelementptr inbounds i8, i8* %call94, i64 360
  %114 = bitcast i8* %arrayidx140 to i64*
  store i64 105, i64* %114, align 8
  %arrayidx141 = getelementptr inbounds i8, i8* %call94, i64 368
  %115 = bitcast i8* %arrayidx141 to i64*
  store i64 115, i64* %115, align 8
  %arrayidx142 = getelementptr inbounds i8, i8* %call94, i64 376
  %116 = bitcast i8* %arrayidx142 to i64*
  store i64 32, i64* %116, align 8
  tail call void @printf_s(i64* %69, i64 48) #4
  %call143 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i64 %sum_bob.0.lcssa) #4
  br i1 %moves_has_ownership, label %if.then145, label %if.end146

if.then145:                                       ; preds = %if.end93
  %117 = bitcast i64* %moves to i8*
  tail call void @free(i8* %117) #4
  br label %if.end146

if.end146:                                        ; preds = %if.then145, %if.end93
  %118 = and i8 %_35_has_ownership.0.lcssa, 1
  %tobool147 = icmp eq i8 %118, 0
  br i1 %tobool147, label %if.end149, label %if.then148

if.then148:                                       ; preds = %if.end146
  tail call void @free(i8* %.lcssa6) #4
  br label %if.end149

if.end149:                                        ; preds = %if.end146, %if.then148
  %119 = and i8 %_38_has_ownership.0.lcssa, 1
  %tobool150 = icmp eq i8 %119, 0
  br i1 %tobool150, label %if.end152, label %if.then151

if.then151:                                       ; preds = %if.end149
  tail call void @free(i8* %.lcssa4) #4
  br label %if.end152

if.end152:                                        ; preds = %if.end149, %if.then151
  br i1 %_48_has_ownership.0.lcssa, label %if.then154, label %if.end158

if.then154:                                       ; preds = %if.end152
  tail call void @free(i8* %.lcssa3) #4
  tail call void @free(i8* %.lcssa) #4
  br label %if.end158

if.end158:                                        ; preds = %if.end152, %if.then154
  %120 = and i8 %_55_has_ownership.0.lcssa, 1
  %tobool159 = icmp eq i8 %120, 0
  br i1 %tobool159, label %if.end161, label %if.then160

if.then160:                                       ; preds = %if.end158
  tail call void @free(i8* %.lcssa5) #4
  br label %if.end161

if.end161:                                        ; preds = %if.end158, %if.then160
  %121 = and i8 %_59_has_ownership.0.lcssa, 1
  %tobool162 = icmp eq i8 %121, 0
  br i1 %tobool162, label %if.then166, label %if.then163

if.then163:                                       ; preds = %if.end161
  tail call void @free(i8* %.lcssa7) #4
  br label %if.then166

if.then166:                                       ; preds = %if.then163, %if.end161
  tail call void @free(i8* %call94) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare void @printf_s(i64*, i64) #2

declare i32 @printf(i8*, ...) #2

declare void @println_s(i64*, i64) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_has_ownership, i64 %n) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp5 = icmp sgt i64 %n, 0
  br i1 %cmp5, label %while.body2.preheader.lr.ph, label %if.end54

while.body2.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body2.preheader

while.body2.preheader:                            ; preds = %while.body2.preheader.lr.ph, %blklab10
  %indvars.iv = phi i64 [ %n, %while.body2.preheader.lr.ph ], [ %indvars.iv.next, %blklab10 ]
  %s.06 = phi i64 [ 0, %while.body2.preheader.lr.ph ], [ %add52, %blklab10 ]
  br i1 true, label %if.end5.lr.ph, label %blklab10

if.end5.lr.ph:                                    ; preds = %while.body2.preheader
  br label %if.end5

if.end5:                                          ; preds = %if.end5.lr.ph, %blklab12
  %j.04 = phi i64 [ %s.06, %if.end5.lr.ph ], [ %add50, %blklab12 ]
  %i.03 = phi i64 [ 0, %if.end5.lr.ph ], [ %add51, %blklab12 ]
  %add = add nuw nsw i64 %i.03, 1
  %cmp6 = icmp sge i64 %add, %n
  %cmp9 = icmp slt i64 %j.04, 1
  %or.cond = or i1 %cmp6, %cmp9
  br i1 %or.cond, label %blklab13, label %if.end11

if.end11:                                         ; preds = %if.end5
  %mul = mul nsw i64 %add, %n
  %add13 = add nsw i64 %j.04, -1
  %sub14 = add i64 %add13, %mul
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %sub14
  %0 = load i64, i64* %arrayidx, align 8
  br label %blklab13

blklab13:                                         ; preds = %if.end5, %if.end11
  %y.0 = phi i64 [ %0, %if.end11 ], [ 0, %if.end5 ]
  %add15 = add nuw nsw i64 %i.03, 2
  %cmp16 = icmp slt i64 %add15, %n
  br i1 %cmp16, label %if.end18, label %blklab14

if.end18:                                         ; preds = %blklab13
  %mul20 = mul nsw i64 %add15, %n
  %add21 = add nsw i64 %mul20, %j.04
  %arrayidx22 = getelementptr inbounds i64, i64* %moves, i64 %add21
  %1 = load i64, i64* %arrayidx22, align 8
  br label %blklab14

blklab14:                                         ; preds = %blklab13, %if.end18
  %x.0 = phi i64 [ %1, %if.end18 ], [ 0, %blklab13 ]
  %cmp24 = icmp slt i64 %j.04, 2
  br i1 %cmp24, label %blklab15, label %if.end26

if.end26:                                         ; preds = %blklab14
  %mul27 = mul nsw i64 %i.03, %n
  %add28 = add nsw i64 %j.04, -2
  %sub29 = add i64 %add28, %mul27
  %arrayidx30 = getelementptr inbounds i64, i64* %moves, i64 %sub29
  %2 = load i64, i64* %arrayidx30, align 8
  br label %blklab15

blklab15:                                         ; preds = %blklab14, %if.end26
  %z.0 = phi i64 [ %2, %if.end26 ], [ 0, %blklab14 ]
  %cmp31 = icmp sgt i64 %x.0, %y.0
  %y.0.x.0 = select i1 %cmp31, i64 %y.0, i64 %x.0
  %cmp34 = icmp sgt i64 %z.0, %y.0
  %z.1 = select i1 %cmp34, i64 %y.0, i64 %z.0
  %add37 = add nsw i64 %y.0.x.0, %i.03
  %add38 = add nsw i64 %z.1, %j.04
  %cmp39 = icmp sgt i64 %add37, %add38
  br i1 %cmp39, label %if.end41, label %blklab18

if.end41:                                         ; preds = %blklab15
  %add42 = add nsw i64 %y.0.x.0, %i.03
  %mul43 = mul nsw i64 %i.03, %n
  %add44 = add nsw i64 %mul43, %j.04
  %arrayidx45 = getelementptr inbounds i64, i64* %moves, i64 %add44
  store i64 %add42, i64* %arrayidx45, align 8
  br label %blklab12

blklab18:                                         ; preds = %blklab15
  %add46 = add nsw i64 %z.1, %j.04
  %mul47 = mul nsw i64 %i.03, %n
  %add48 = add nsw i64 %mul47, %j.04
  %arrayidx49 = getelementptr inbounds i64, i64* %moves, i64 %add48
  store i64 %add46, i64* %arrayidx49, align 8
  br label %blklab12

blklab12:                                         ; preds = %if.end41, %blklab18
  %add51 = add nuw nsw i64 %i.03, 1
  %add50 = add nuw nsw i64 %j.04, 1
  %exitcond = icmp ne i64 %add51, %indvars.iv
  br i1 %exitcond, label %if.end5, label %while.body2.blklab10_crit_edge

while.body2.blklab10_crit_edge:                   ; preds = %blklab12
  br label %blklab10

blklab10:                                         ; preds = %while.body2.blklab10_crit_edge, %while.body2.preheader
  %add52 = add nuw nsw i64 %s.06, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %exitcond7 = icmp ne i64 %add52, %n
  br i1 %exitcond7, label %while.body2.preheader, label %while.body.if.end54_crit_edge

while.body.if.end54_crit_edge:                    ; preds = %blklab10
  br label %if.end54

if.end54:                                         ; preds = %while.body.if.end54_crit_edge, %entry.split
  ret i64* %moves
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #4
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8
  %call1 = tail call i64* @parseStringToInt(i64* %0) #4
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab20, label %if.end

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8
  %mul = mul nsw i64 %1, %1
  %conv6 = trunc i64 %mul to i32
  %call7 = tail call i64* @gen1DArray(i32 0, i32 %conv6) #4
  %call14 = tail call i64* @findMoves(i64* %call7, i64 %mul, i1 zeroext true, i64 %1)
  %sub18 = add nsw i64 %1, -1
  %arrayidx19 = getelementptr inbounds i64, i64* %call14, i64 %sub18
  %2 = load i64, i64* %arrayidx19, align 8
  %call23 = tail call noalias i8* @malloc(i64 400) #4
  %3 = bitcast i8* %call23 to i64*
  store i64 84, i64* %3, align 8
  %arrayidx25 = getelementptr inbounds i8, i8* %call23, i64 8
  %4 = bitcast i8* %arrayidx25 to i64*
  store i64 104, i64* %4, align 8
  %arrayidx26 = getelementptr inbounds i8, i8* %call23, i64 16
  %5 = bitcast i8* %arrayidx26 to i64*
  store i64 101, i64* %5, align 8
  %arrayidx27 = getelementptr inbounds i8, i8* %call23, i64 24
  %6 = bitcast i8* %arrayidx27 to i64*
  store i64 32, i64* %6, align 8
  %arrayidx28 = getelementptr inbounds i8, i8* %call23, i64 32
  %7 = bitcast i8* %arrayidx28 to i64*
  store i64 116, i64* %7, align 8
  %arrayidx29 = getelementptr inbounds i8, i8* %call23, i64 40
  %8 = bitcast i8* %arrayidx29 to i64*
  store i64 111, i64* %8, align 8
  %arrayidx30 = getelementptr inbounds i8, i8* %call23, i64 48
  %9 = bitcast i8* %arrayidx30 to i64*
  store i64 116, i64* %9, align 8
  %arrayidx31 = getelementptr inbounds i8, i8* %call23, i64 56
  %10 = bitcast i8* %arrayidx31 to i64*
  store i64 97, i64* %10, align 8
  %arrayidx32 = getelementptr inbounds i8, i8* %call23, i64 64
  %11 = bitcast i8* %arrayidx32 to i64*
  store i64 108, i64* %11, align 8
  %arrayidx33 = getelementptr inbounds i8, i8* %call23, i64 72
  %12 = bitcast i8* %arrayidx33 to i64*
  store i64 32, i64* %12, align 8
  %arrayidx34 = getelementptr inbounds i8, i8* %call23, i64 80
  %13 = bitcast i8* %arrayidx34 to i64*
  store i64 97, i64* %13, align 8
  %arrayidx35 = getelementptr inbounds i8, i8* %call23, i64 88
  %14 = bitcast i8* %arrayidx35 to i64*
  store i64 109, i64* %14, align 8
  %arrayidx36 = getelementptr inbounds i8, i8* %call23, i64 96
  %15 = bitcast i8* %arrayidx36 to i64*
  store i64 111, i64* %15, align 8
  %arrayidx37 = getelementptr inbounds i8, i8* %call23, i64 104
  %16 = bitcast i8* %arrayidx37 to i64*
  store i64 117, i64* %16, align 8
  %arrayidx38 = getelementptr inbounds i8, i8* %call23, i64 112
  %17 = bitcast i8* %arrayidx38 to i64*
  store i64 110, i64* %17, align 8
  %arrayidx39 = getelementptr inbounds i8, i8* %call23, i64 120
  %18 = bitcast i8* %arrayidx39 to i64*
  store i64 116, i64* %18, align 8
  %arrayidx40 = getelementptr inbounds i8, i8* %call23, i64 128
  %19 = bitcast i8* %arrayidx40 to i64*
  store i64 32, i64* %19, align 8
  %arrayidx41 = getelementptr inbounds i8, i8* %call23, i64 136
  %20 = bitcast i8* %arrayidx41 to i64*
  store i64 111, i64* %20, align 8
  %arrayidx42 = getelementptr inbounds i8, i8* %call23, i64 144
  %21 = bitcast i8* %arrayidx42 to i64*
  store i64 102, i64* %21, align 8
  %arrayidx43 = getelementptr inbounds i8, i8* %call23, i64 152
  %22 = bitcast i8* %arrayidx43 to i64*
  store i64 32, i64* %22, align 8
  %arrayidx44 = getelementptr inbounds i8, i8* %call23, i64 160
  %23 = bitcast i8* %arrayidx44 to i64*
  store i64 109, i64* %23, align 8
  %arrayidx45 = getelementptr inbounds i8, i8* %call23, i64 168
  %24 = bitcast i8* %arrayidx45 to i64*
  store i64 111, i64* %24, align 8
  %arrayidx46 = getelementptr inbounds i8, i8* %call23, i64 176
  %25 = bitcast i8* %arrayidx46 to i64*
  store i64 110, i64* %25, align 8
  %arrayidx47 = getelementptr inbounds i8, i8* %call23, i64 184
  %26 = bitcast i8* %arrayidx47 to i64*
  store i64 101, i64* %26, align 8
  %arrayidx48 = getelementptr inbounds i8, i8* %call23, i64 192
  %27 = bitcast i8* %arrayidx48 to i64*
  store i64 121, i64* %27, align 8
  %arrayidx49 = getelementptr inbounds i8, i8* %call23, i64 200
  %28 = bitcast i8* %arrayidx49 to i64*
  store i64 32, i64* %28, align 8
  %arrayidx50 = getelementptr inbounds i8, i8* %call23, i64 208
  %29 = bitcast i8* %arrayidx50 to i64*
  store i64 40, i64* %29, align 8
  %arrayidx51 = getelementptr inbounds i8, i8* %call23, i64 216
  %30 = bitcast i8* %arrayidx51 to i64*
  store i64 109, i64* %30, align 8
  %arrayidx52 = getelementptr inbounds i8, i8* %call23, i64 224
  %31 = bitcast i8* %arrayidx52 to i64*
  store i64 97, i64* %31, align 8
  %arrayidx53 = getelementptr inbounds i8, i8* %call23, i64 232
  %32 = bitcast i8* %arrayidx53 to i64*
  store i64 120, i64* %32, align 8
  %arrayidx54 = getelementptr inbounds i8, i8* %call23, i64 240
  %33 = bitcast i8* %arrayidx54 to i64*
  store i64 105, i64* %33, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %call23, i64 248
  %34 = bitcast i8* %arrayidx55 to i64*
  store i64 109, i64* %34, align 8
  %arrayidx56 = getelementptr inbounds i8, i8* %call23, i64 256
  %35 = bitcast i8* %arrayidx56 to i64*
  store i64 117, i64* %35, align 8
  %arrayidx57 = getelementptr inbounds i8, i8* %call23, i64 264
  %36 = bitcast i8* %arrayidx57 to i64*
  store i64 109, i64* %36, align 8
  %arrayidx58 = getelementptr inbounds i8, i8* %call23, i64 272
  %37 = bitcast i8* %arrayidx58 to i64*
  store i64 41, i64* %37, align 8
  %arrayidx59 = getelementptr inbounds i8, i8* %call23, i64 280
  %38 = bitcast i8* %arrayidx59 to i64*
  store i64 32, i64* %38, align 8
  %arrayidx60 = getelementptr inbounds i8, i8* %call23, i64 288
  %39 = bitcast i8* %arrayidx60 to i64*
  store i64 65, i64* %39, align 8
  %arrayidx61 = getelementptr inbounds i8, i8* %call23, i64 296
  %40 = bitcast i8* %arrayidx61 to i64*
  store i64 108, i64* %40, align 8
  %arrayidx62 = getelementptr inbounds i8, i8* %call23, i64 304
  %41 = bitcast i8* %arrayidx62 to i64*
  store i64 105, i64* %41, align 8
  %arrayidx63 = getelementptr inbounds i8, i8* %call23, i64 312
  %42 = bitcast i8* %arrayidx63 to i64*
  store i64 99, i64* %42, align 8
  %arrayidx64 = getelementptr inbounds i8, i8* %call23, i64 320
  %43 = bitcast i8* %arrayidx64 to i64*
  store i64 101, i64* %43, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %call23, i64 328
  %44 = bitcast i8* %arrayidx65 to i64*
  store i64 32, i64* %44, align 8
  %arrayidx66 = getelementptr inbounds i8, i8* %call23, i64 336
  %45 = bitcast i8* %arrayidx66 to i64*
  store i64 103, i64* %45, align 8
  %arrayidx67 = getelementptr inbounds i8, i8* %call23, i64 344
  %46 = bitcast i8* %arrayidx67 to i64*
  store i64 101, i64* %46, align 8
  %arrayidx68 = getelementptr inbounds i8, i8* %call23, i64 352
  %47 = bitcast i8* %arrayidx68 to i64*
  store i64 116, i64* %47, align 8
  %arrayidx69 = getelementptr inbounds i8, i8* %call23, i64 360
  %48 = bitcast i8* %arrayidx69 to i64*
  store i64 115, i64* %48, align 8
  %arrayidx70 = getelementptr inbounds i8, i8* %call23, i64 368
  %49 = bitcast i8* %arrayidx70 to i64*
  store i64 32, i64* %49, align 8
  %arrayidx71 = getelementptr inbounds i8, i8* %call23, i64 376
  %50 = bitcast i8* %arrayidx71 to i64*
  store i64 105, i64* %50, align 8
  %arrayidx72 = getelementptr inbounds i8, i8* %call23, i64 384
  %51 = bitcast i8* %arrayidx72 to i64*
  store i64 115, i64* %51, align 8
  %arrayidx73 = getelementptr inbounds i8, i8* %call23, i64 392
  %52 = bitcast i8* %arrayidx73 to i64*
  store i64 32, i64* %52, align 8
  tail call void @printf_s(i64* %3, i64 50) #4
  %call74 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i64 %2) #4
  %call78 = tail call noalias i8* @malloc(i64 184) #4
  %53 = bitcast i8* %call78 to i64*
  store i64 80, i64* %53, align 8
  %arrayidx80 = getelementptr inbounds i8, i8* %call78, i64 8
  %54 = bitcast i8* %arrayidx80 to i64*
  store i64 97, i64* %54, align 8
  %arrayidx81 = getelementptr inbounds i8, i8* %call78, i64 16
  %55 = bitcast i8* %arrayidx81 to i64*
  store i64 115, i64* %55, align 8
  %arrayidx82 = getelementptr inbounds i8, i8* %call78, i64 24
  %56 = bitcast i8* %arrayidx82 to i64*
  store i64 115, i64* %56, align 8
  %arrayidx83 = getelementptr inbounds i8, i8* %call78, i64 32
  %57 = bitcast i8* %arrayidx83 to i64*
  store i64 32, i64* %57, align 8
  %arrayidx84 = getelementptr inbounds i8, i8* %call78, i64 40
  %58 = bitcast i8* %arrayidx84 to i64*
  store i64 67, i64* %58, align 8
  %arrayidx85 = getelementptr inbounds i8, i8* %call78, i64 48
  %59 = bitcast i8* %arrayidx85 to i64*
  store i64 111, i64* %59, align 8
  %arrayidx86 = getelementptr inbounds i8, i8* %call78, i64 56
  %60 = bitcast i8* %arrayidx86 to i64*
  store i64 105, i64* %60, align 8
  %arrayidx87 = getelementptr inbounds i8, i8* %call78, i64 64
  %61 = bitcast i8* %arrayidx87 to i64*
  store i64 110, i64* %61, align 8
  %arrayidx88 = getelementptr inbounds i8, i8* %call78, i64 72
  %62 = bitcast i8* %arrayidx88 to i64*
  store i64 71, i64* %62, align 8
  %arrayidx89 = getelementptr inbounds i8, i8* %call78, i64 80
  %63 = bitcast i8* %arrayidx89 to i64*
  store i64 97, i64* %63, align 8
  %arrayidx90 = getelementptr inbounds i8, i8* %call78, i64 88
  %64 = bitcast i8* %arrayidx90 to i64*
  store i64 109, i64* %64, align 8
  %arrayidx91 = getelementptr inbounds i8, i8* %call78, i64 96
  %65 = bitcast i8* %arrayidx91 to i64*
  store i64 101, i64* %65, align 8
  %arrayidx92 = getelementptr inbounds i8, i8* %call78, i64 104
  %66 = bitcast i8* %arrayidx92 to i64*
  store i64 32, i64* %66, align 8
  %arrayidx93 = getelementptr inbounds i8, i8* %call78, i64 112
  %67 = bitcast i8* %arrayidx93 to i64*
  store i64 116, i64* %67, align 8
  %arrayidx94 = getelementptr inbounds i8, i8* %call78, i64 120
  %68 = bitcast i8* %arrayidx94 to i64*
  store i64 101, i64* %68, align 8
  %arrayidx95 = getelementptr inbounds i8, i8* %call78, i64 128
  %69 = bitcast i8* %arrayidx95 to i64*
  store i64 115, i64* %69, align 8
  %arrayidx96 = getelementptr inbounds i8, i8* %call78, i64 136
  %70 = bitcast i8* %arrayidx96 to i64*
  store i64 116, i64* %70, align 8
  %arrayidx97 = getelementptr inbounds i8, i8* %call78, i64 144
  %71 = bitcast i8* %arrayidx97 to i64*
  store i64 32, i64* %71, align 8
  %arrayidx98 = getelementptr inbounds i8, i8* %call78, i64 152
  %72 = bitcast i8* %arrayidx98 to i64*
  store i64 99, i64* %72, align 8
  %arrayidx99 = getelementptr inbounds i8, i8* %call78, i64 160
  %73 = bitcast i8* %arrayidx99 to i64*
  store i64 97, i64* %73, align 8
  %arrayidx100 = getelementptr inbounds i8, i8* %call78, i64 168
  %74 = bitcast i8* %arrayidx100 to i64*
  store i64 115, i64* %74, align 8
  %arrayidx101 = getelementptr inbounds i8, i8* %call78, i64 176
  %75 = bitcast i8* %arrayidx101 to i64*
  store i64 101, i64* %75, align 8
  tail call void @println_s(i64* %53, i64 23) #4
  %phitmp = bitcast i64* %call14 to i8*
  br label %blklab20

blklab20:                                         ; preds = %entry.split, %if.end
  %76 = phi i8* [ %call23, %if.end ], [ null, %entry.split ]
  %moves_has_ownership.0 = phi i1 [ true, %if.end ], [ false, %entry.split ]
  %moves.0 = phi i8* [ %phitmp, %if.end ], [ null, %entry.split ]
  %77 = phi i8* [ %call78, %if.end ], [ null, %entry.split ]
  br i1 %moves_has_ownership.0, label %if.then103, label %if.end122.critedge

if.then103:                                       ; preds = %blklab20
  tail call void @free(i8* %moves.0) #4
  tail call void @free2DArray(i64** %call, i64 %conv) #4
  tail call void @free(i8* %76) #4
  tail call void @free(i8* %77) #4
  br label %if.end122

if.end122.critedge:                               ; preds = %blklab20
  tail call void @free2DArray(i64** %call, i64 %conv) #4
  br label %if.end122

if.end122:                                        ; preds = %if.end122.critedge, %if.then103
  tail call void @exit(i32 0) #6
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

declare i64* @gen1DArray(i32, i32) #2

declare void @free2DArray(i64**, i64) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
