; ModuleID = 'MergeSort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @sortV1(i64* %items, i64 %items_size, i1 zeroext %items_has_ownership, i64 %start, i64 %end) #0 {
entry:
  %items.addr = alloca i64*, align 8
  %items_size.addr = alloca i64, align 8
  %items_has_ownership.addr = alloca i8, align 1
  %start.addr = alloca i64, align 8
  %end.addr = alloca i64, align 8
  %_3 = alloca i64*, align 8
  %_3_size = alloca i64, align 8
  %_3_has_ownership = alloca i8, align 1
  %pivot = alloca i64, align 8
  %lhs = alloca i64*, align 8
  %lhs_size = alloca i64, align 8
  %lhs_has_ownership = alloca i8, align 1
  %rhs = alloca i64*, align 8
  %rhs_size = alloca i64, align 8
  %rhs_has_ownership = alloca i8, align 1
  %l = alloca i64, align 8
  %r = alloca i64, align 8
  %i = alloca i64, align 8
  %_10 = alloca i64, align 8
  %_11 = alloca i64, align 8
  %_12 = alloca i64, align 8
  %_13 = alloca i64, align 8
  %_14 = alloca i64, align 8
  %_15 = alloca i64*, align 8
  %_15_size = alloca i64, align 8
  %_15_has_ownership = alloca i8, align 1
  %_16 = alloca i64*, align 8
  %_16_size = alloca i64, align 8
  %_16_has_ownership = alloca i8, align 1
  %_17 = alloca i64, align 8
  %_18 = alloca i64*, align 8
  %_18_size = alloca i64, align 8
  %_18_has_ownership = alloca i8, align 1
  %_19 = alloca i64*, align 8
  %_19_size = alloca i64, align 8
  %_19_has_ownership = alloca i8, align 1
  %_20 = alloca i64, align 8
  %_21 = alloca i64, align 8
  %_22 = alloca i64, align 8
  %_23 = alloca i64, align 8
  %_24 = alloca i64, align 8
  %_25 = alloca i64, align 8
  %_26 = alloca i64, align 8
  %_27 = alloca i64, align 8
  %_28 = alloca i64, align 8
  %_29 = alloca i64, align 8
  %_30 = alloca i64, align 8
  %_31 = alloca i64, align 8
  %_32 = alloca i64, align 8
  %_33 = alloca i64, align 8
  %_34 = alloca i64, align 8
  %_35 = alloca i64, align 8
  %_36 = alloca i64, align 8
  %_37 = alloca i64, align 8
  %_38 = alloca i64, align 8
  %_39 = alloca i64, align 8
  %_40 = alloca i64, align 8
  %_41 = alloca i64, align 8
  %_42 = alloca i64, align 8
  %_43 = alloca i64, align 8
  %_44 = alloca i64, align 8
  %_45 = alloca i64, align 8
  %_46 = alloca i64, align 8
  %_47 = alloca i64, align 8
  %_48 = alloca i64, align 8
  %_49 = alloca i64, align 8
  store i64* %items, i64** %items.addr, align 8
  store i64 %items_size, i64* %items_size.addr, align 8
  %frombool = zext i1 %items_has_ownership to i8
  store i8 %frombool, i8* %items_has_ownership.addr, align 1
  store i64 %start, i64* %start.addr, align 8
  store i64 %end, i64* %end.addr, align 8
  store i64* null, i64** %_3, align 8
  store i64 0, i64* %_3_size, align 8
  store i8 0, i8* %_3_has_ownership, align 1
  store i64 0, i64* %pivot, align 8
  store i64* null, i64** %lhs, align 8
  store i64 0, i64* %lhs_size, align 8
  store i8 0, i8* %lhs_has_ownership, align 1
  store i64* null, i64** %rhs, align 8
  store i64 0, i64* %rhs_size, align 8
  store i8 0, i8* %rhs_has_ownership, align 1
  store i64 0, i64* %l, align 8
  store i64 0, i64* %r, align 8
  store i64 0, i64* %i, align 8
  store i64 0, i64* %_10, align 8
  store i64 0, i64* %_11, align 8
  store i64 0, i64* %_12, align 8
  store i64 0, i64* %_13, align 8
  store i64 0, i64* %_14, align 8
  store i64* null, i64** %_15, align 8
  store i64 0, i64* %_15_size, align 8
  store i8 0, i8* %_15_has_ownership, align 1
  store i64* null, i64** %_16, align 8
  store i64 0, i64* %_16_size, align 8
  store i8 0, i8* %_16_has_ownership, align 1
  store i64 0, i64* %_17, align 8
  store i64* null, i64** %_18, align 8
  store i64 0, i64* %_18_size, align 8
  store i8 0, i8* %_18_has_ownership, align 1
  store i64* null, i64** %_19, align 8
  store i64 0, i64* %_19_size, align 8
  store i8 0, i8* %_19_has_ownership, align 1
  store i64 0, i64* %_20, align 8
  store i64 0, i64* %_21, align 8
  store i64 0, i64* %_22, align 8
  store i64 0, i64* %_23, align 8
  store i64 0, i64* %_24, align 8
  store i64 0, i64* %_25, align 8
  store i64 0, i64* %_26, align 8
  store i64 0, i64* %_27, align 8
  store i64 0, i64* %_28, align 8
  store i64 0, i64* %_29, align 8
  store i64 0, i64* %_30, align 8
  store i64 0, i64* %_31, align 8
  store i64 0, i64* %_32, align 8
  store i64 0, i64* %_33, align 8
  store i64 0, i64* %_34, align 8
  store i64 0, i64* %_35, align 8
  store i64 0, i64* %_36, align 8
  store i64 0, i64* %_37, align 8
  store i64 0, i64* %_38, align 8
  store i64 0, i64* %_39, align 8
  store i64 0, i64* %_40, align 8
  store i64 0, i64* %_41, align 8
  store i64 0, i64* %_42, align 8
  store i64 0, i64* %_43, align 8
  store i64 0, i64* %_44, align 8
  store i64 0, i64* %_45, align 8
  store i64 0, i64* %_46, align 8
  store i64 0, i64* %_47, align 8
  store i64 0, i64* %_48, align 8
  store i64 0, i64* %_49, align 8
  store i64 1, i64* %_10, align 8
  %0 = load i64, i64* %start.addr, align 8
  %1 = load i64, i64* %_10, align 8
  %add = add nsw i64 %0, %1
  store i64 %add, i64* %_11, align 8
  %2 = load i64, i64* %_11, align 8
  %3 = load i64, i64* %end.addr, align 8
  %cmp = icmp sge i64 %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %blklab0

if.end:                                           ; preds = %entry
  %4 = load i64, i64* %start.addr, align 8
  %5 = load i64, i64* %end.addr, align 8
  %add1 = add nsw i64 %4, %5
  store i64 %add1, i64* %_12, align 8
  store i64 2, i64* %_13, align 8
  %6 = load i64, i64* %_12, align 8
  %7 = load i64, i64* %_13, align 8
  %div = sdiv i64 %6, %7
  store i64 %div, i64* %_14, align 8
  %8 = load i64, i64* %_14, align 8
  store i64 %8, i64* %pivot, align 8
  %9 = load i8, i8* %_15_has_ownership, align 1
  %tobool = trunc i8 %9 to i1
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %10 = load i64*, i64** %_15, align 8
  %11 = bitcast i64* %10 to i8*
  call void @free(i8* %11) #4
  store i8 0, i8* %_15_has_ownership, align 1
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %12 = load i64*, i64** %items.addr, align 8
  %13 = load i64, i64* %items_size.addr, align 8
  %14 = load i64, i64* %start.addr, align 8
  %15 = load i64, i64* %pivot, align 8
  %call = call i64* @slice(i64* %12, i64 %13, i64 %14, i64 %15)
  store i64* %call, i64** %_15, align 8
  %16 = load i64, i64* %pivot, align 8
  %17 = load i64, i64* %start.addr, align 8
  %sub = sub nsw i64 %16, %17
  store i64 %sub, i64* %_15_size, align 8
  store i8 1, i8* %_15_has_ownership, align 1
  %18 = load i8, i8* %lhs_has_ownership, align 1
  %tobool4 = trunc i8 %18 to i1
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end3
  %19 = load i64*, i64** %lhs, align 8
  %20 = bitcast i64* %19 to i8*
  call void @free(i8* %20) #4
  store i8 0, i8* %lhs_has_ownership, align 1
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end3
  %21 = load i64, i64* %_15_size, align 8
  store i64 %21, i64* %lhs_size, align 8
  %22 = load i64*, i64** %_15, align 8
  %23 = load i64, i64* %_15_size, align 8
  %call7 = call i64* @copy(i64* %22, i64 %23)
  store i64* %call7, i64** %lhs, align 8
  store i8 1, i8* %lhs_has_ownership, align 1
  store i8 1, i8* %_15_has_ownership, align 1
  store i64 0, i64* %_17, align 8
  %24 = load i8, i8* %_16_has_ownership, align 1
  %tobool8 = trunc i8 %24 to i1
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  %25 = load i64*, i64** %_16, align 8
  %26 = bitcast i64* %25 to i8*
  call void @free(i8* %26) #4
  store i8 0, i8* %_16_has_ownership, align 1
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end6
  store i8 0, i8* %lhs_has_ownership, align 1
  %27 = load i64, i64* %lhs_size, align 8
  store i64 %27, i64* %_16_size, align 8
  %28 = load i64*, i64** %lhs, align 8
  %29 = load i64, i64* %lhs_size, align 8
  %call11 = call i64* @copy(i64* %28, i64 %29)
  %30 = load i64, i64* %lhs_size, align 8
  %31 = load i64, i64* %_17, align 8
  %32 = load i64, i64* %pivot, align 8
  %call12 = call i64* @sortV1(i64* %call11, i64 %30, i1 zeroext true, i64 %31, i64 %32)
  store i64* %call12, i64** %_16, align 8
  store i8 1, i8* %_16_has_ownership, align 1
  %33 = load i8, i8* %lhs_has_ownership, align 1
  %tobool13 = trunc i8 %33 to i1
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end10
  %34 = load i64*, i64** %lhs, align 8
  %35 = bitcast i64* %34 to i8*
  call void @free(i8* %35) #4
  store i8 0, i8* %lhs_has_ownership, align 1
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end10
  %36 = load i64, i64* %_16_size, align 8
  store i64 %36, i64* %lhs_size, align 8
  %37 = load i64*, i64** %_16, align 8
  %38 = load i64, i64* %_16_size, align 8
  %call16 = call i64* @copy(i64* %37, i64 %38)
  store i64* %call16, i64** %lhs, align 8
  store i8 1, i8* %lhs_has_ownership, align 1
  store i8 1, i8* %_16_has_ownership, align 1
  %39 = load i8, i8* %_18_has_ownership, align 1
  %tobool17 = trunc i8 %39 to i1
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end15
  %40 = load i64*, i64** %_18, align 8
  %41 = bitcast i64* %40 to i8*
  call void @free(i8* %41) #4
  store i8 0, i8* %_18_has_ownership, align 1
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.end15
  %42 = load i64*, i64** %items.addr, align 8
  %43 = load i64, i64* %items_size.addr, align 8
  %44 = load i64, i64* %pivot, align 8
  %45 = load i64, i64* %end.addr, align 8
  %call20 = call i64* @slice(i64* %42, i64 %43, i64 %44, i64 %45)
  store i64* %call20, i64** %_18, align 8
  %46 = load i64, i64* %end.addr, align 8
  %47 = load i64, i64* %pivot, align 8
  %sub21 = sub nsw i64 %46, %47
  store i64 %sub21, i64* %_18_size, align 8
  store i8 1, i8* %_18_has_ownership, align 1
  %48 = load i8, i8* %rhs_has_ownership, align 1
  %tobool22 = trunc i8 %48 to i1
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end19
  %49 = load i64*, i64** %rhs, align 8
  %50 = bitcast i64* %49 to i8*
  call void @free(i8* %50) #4
  store i8 0, i8* %rhs_has_ownership, align 1
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end19
  %51 = load i64, i64* %_18_size, align 8
  store i64 %51, i64* %rhs_size, align 8
  %52 = load i64*, i64** %_18, align 8
  %53 = load i64, i64* %_18_size, align 8
  %call25 = call i64* @copy(i64* %52, i64 %53)
  store i64* %call25, i64** %rhs, align 8
  store i8 1, i8* %rhs_has_ownership, align 1
  store i8 1, i8* %_18_has_ownership, align 1
  store i64 0, i64* %_20, align 8
  %54 = load i64, i64* %end.addr, align 8
  %55 = load i64, i64* %pivot, align 8
  %sub26 = sub nsw i64 %54, %55
  store i64 %sub26, i64* %_21, align 8
  %56 = load i8, i8* %_19_has_ownership, align 1
  %tobool27 = trunc i8 %56 to i1
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end24
  %57 = load i64*, i64** %_19, align 8
  %58 = bitcast i64* %57 to i8*
  call void @free(i8* %58) #4
  store i8 0, i8* %_19_has_ownership, align 1
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %if.end24
  store i8 0, i8* %rhs_has_ownership, align 1
  %59 = load i64, i64* %rhs_size, align 8
  store i64 %59, i64* %_19_size, align 8
  %60 = load i64*, i64** %rhs, align 8
  %61 = load i64, i64* %rhs_size, align 8
  %call30 = call i64* @copy(i64* %60, i64 %61)
  %62 = load i64, i64* %rhs_size, align 8
  %63 = load i64, i64* %_20, align 8
  %64 = load i64, i64* %_21, align 8
  %call31 = call i64* @sortV1(i64* %call30, i64 %62, i1 zeroext true, i64 %63, i64 %64)
  store i64* %call31, i64** %_19, align 8
  store i8 1, i8* %_19_has_ownership, align 1
  %65 = load i8, i8* %rhs_has_ownership, align 1
  %tobool32 = trunc i8 %65 to i1
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end29
  %66 = load i64*, i64** %rhs, align 8
  %67 = bitcast i64* %66 to i8*
  call void @free(i8* %67) #4
  store i8 0, i8* %rhs_has_ownership, align 1
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.end29
  %68 = load i64, i64* %_19_size, align 8
  store i64 %68, i64* %rhs_size, align 8
  %69 = load i64*, i64** %_19, align 8
  %70 = load i64, i64* %_19_size, align 8
  %call35 = call i64* @copy(i64* %69, i64 %70)
  store i64* %call35, i64** %rhs, align 8
  store i8 1, i8* %rhs_has_ownership, align 1
  store i8 1, i8* %_19_has_ownership, align 1
  store i64 0, i64* %_22, align 8
  %71 = load i64, i64* %_22, align 8
  store i64 %71, i64* %l, align 8
  store i64 0, i64* %_23, align 8
  %72 = load i64, i64* %_23, align 8
  store i64 %72, i64* %r, align 8
  store i64 0, i64* %_24, align 8
  %73 = load i64, i64* %_24, align 8
  store i64 %73, i64* %i, align 8
  br label %while.body

while.body:                                       ; preds = %if.end34, %blklab2
  %74 = load i64, i64* %end.addr, align 8
  %75 = load i64, i64* %start.addr, align 8
  %sub36 = sub nsw i64 %74, %75
  store i64 %sub36, i64* %_25, align 8
  %76 = load i64, i64* %i, align 8
  %77 = load i64, i64* %_25, align 8
  %cmp37 = icmp sge i64 %76, %77
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %while.body
  br label %blklab1

if.end39:                                         ; preds = %while.body
  %78 = load i64, i64* %pivot, align 8
  %79 = load i64, i64* %start.addr, align 8
  %sub40 = sub nsw i64 %78, %79
  store i64 %sub40, i64* %_26, align 8
  %80 = load i64, i64* %l, align 8
  %81 = load i64, i64* %_26, align 8
  %cmp41 = icmp sge i64 %80, %81
  br i1 %cmp41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end39
  br label %blklab1

if.end43:                                         ; preds = %if.end39
  %82 = load i64, i64* %end.addr, align 8
  %83 = load i64, i64* %pivot, align 8
  %sub44 = sub nsw i64 %82, %83
  store i64 %sub44, i64* %_27, align 8
  %84 = load i64, i64* %r, align 8
  %85 = load i64, i64* %_27, align 8
  %cmp45 = icmp sge i64 %84, %85
  br i1 %cmp45, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end43
  br label %blklab1

if.end47:                                         ; preds = %if.end43
  %86 = load i64, i64* %l, align 8
  %87 = load i64*, i64** %lhs, align 8
  %arrayidx = getelementptr inbounds i64, i64* %87, i64 %86
  %88 = load i64, i64* %arrayidx, align 8
  store i64 %88, i64* %_28, align 8
  %89 = load i64, i64* %r, align 8
  %90 = load i64*, i64** %rhs, align 8
  %arrayidx48 = getelementptr inbounds i64, i64* %90, i64 %89
  %91 = load i64, i64* %arrayidx48, align 8
  store i64 %91, i64* %_29, align 8
  %92 = load i64, i64* %_28, align 8
  %93 = load i64, i64* %_29, align 8
  %cmp49 = icmp sgt i64 %92, %93
  br i1 %cmp49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.end47
  br label %blklab3

if.end51:                                         ; preds = %if.end47
  %94 = load i64, i64* %l, align 8
  %95 = load i64*, i64** %lhs, align 8
  %arrayidx52 = getelementptr inbounds i64, i64* %95, i64 %94
  %96 = load i64, i64* %arrayidx52, align 8
  store i64 %96, i64* %_30, align 8
  %97 = load i64, i64* %_30, align 8
  %98 = load i64, i64* %i, align 8
  %99 = load i64*, i64** %items.addr, align 8
  %arrayidx53 = getelementptr inbounds i64, i64* %99, i64 %98
  store i64 %97, i64* %arrayidx53, align 8
  store i64 1, i64* %_31, align 8
  %100 = load i64, i64* %l, align 8
  %101 = load i64, i64* %_31, align 8
  %add54 = add nsw i64 %100, %101
  store i64 %add54, i64* %_32, align 8
  %102 = load i64, i64* %_32, align 8
  store i64 %102, i64* %l, align 8
  br label %blklab4

blklab3:                                          ; preds = %if.then50
  %103 = load i64, i64* %r, align 8
  %104 = load i64*, i64** %rhs, align 8
  %arrayidx55 = getelementptr inbounds i64, i64* %104, i64 %103
  %105 = load i64, i64* %arrayidx55, align 8
  store i64 %105, i64* %_33, align 8
  %106 = load i64, i64* %_33, align 8
  %107 = load i64, i64* %i, align 8
  %108 = load i64*, i64** %items.addr, align 8
  %arrayidx56 = getelementptr inbounds i64, i64* %108, i64 %107
  store i64 %106, i64* %arrayidx56, align 8
  store i64 1, i64* %_34, align 8
  %109 = load i64, i64* %r, align 8
  %110 = load i64, i64* %_34, align 8
  %add57 = add nsw i64 %109, %110
  store i64 %add57, i64* %_35, align 8
  %111 = load i64, i64* %_35, align 8
  store i64 %111, i64* %r, align 8
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end51
  store i64 1, i64* %_36, align 8
  %112 = load i64, i64* %i, align 8
  %113 = load i64, i64* %_36, align 8
  %add58 = add nsw i64 %112, %113
  store i64 %add58, i64* %_37, align 8
  %114 = load i64, i64* %_37, align 8
  store i64 %114, i64* %i, align 8
  br label %blklab2

blklab2:                                          ; preds = %blklab4
  br label %while.body

blklab1:                                          ; preds = %if.then46, %if.then42, %if.then38
  br label %while.body59

while.body59:                                     ; preds = %blklab1, %blklab6
  %115 = load i64, i64* %pivot, align 8
  %116 = load i64, i64* %start.addr, align 8
  %sub60 = sub nsw i64 %115, %116
  store i64 %sub60, i64* %_38, align 8
  %117 = load i64, i64* %l, align 8
  %118 = load i64, i64* %_38, align 8
  %cmp61 = icmp sge i64 %117, %118
  br i1 %cmp61, label %if.then62, label %if.end63

if.then62:                                        ; preds = %while.body59
  br label %blklab5

if.end63:                                         ; preds = %while.body59
  %119 = load i64, i64* %l, align 8
  %120 = load i64*, i64** %lhs, align 8
  %arrayidx64 = getelementptr inbounds i64, i64* %120, i64 %119
  %121 = load i64, i64* %arrayidx64, align 8
  store i64 %121, i64* %_39, align 8
  %122 = load i64, i64* %_39, align 8
  %123 = load i64, i64* %i, align 8
  %124 = load i64*, i64** %items.addr, align 8
  %arrayidx65 = getelementptr inbounds i64, i64* %124, i64 %123
  store i64 %122, i64* %arrayidx65, align 8
  store i64 1, i64* %_40, align 8
  %125 = load i64, i64* %i, align 8
  %126 = load i64, i64* %_40, align 8
  %add66 = add nsw i64 %125, %126
  store i64 %add66, i64* %_41, align 8
  %127 = load i64, i64* %_41, align 8
  store i64 %127, i64* %i, align 8
  store i64 1, i64* %_42, align 8
  %128 = load i64, i64* %l, align 8
  %129 = load i64, i64* %_42, align 8
  %add67 = add nsw i64 %128, %129
  store i64 %add67, i64* %_43, align 8
  %130 = load i64, i64* %_43, align 8
  store i64 %130, i64* %l, align 8
  br label %blklab6

blklab6:                                          ; preds = %if.end63
  br label %while.body59

blklab5:                                          ; preds = %if.then62
  br label %while.body68

while.body68:                                     ; preds = %blklab5, %blklab8
  %131 = load i64, i64* %end.addr, align 8
  %132 = load i64, i64* %pivot, align 8
  %sub69 = sub nsw i64 %131, %132
  store i64 %sub69, i64* %_44, align 8
  %133 = load i64, i64* %r, align 8
  %134 = load i64, i64* %_44, align 8
  %cmp70 = icmp sge i64 %133, %134
  br i1 %cmp70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %while.body68
  br label %blklab7

if.end72:                                         ; preds = %while.body68
  %135 = load i64, i64* %r, align 8
  %136 = load i64*, i64** %rhs, align 8
  %arrayidx73 = getelementptr inbounds i64, i64* %136, i64 %135
  %137 = load i64, i64* %arrayidx73, align 8
  store i64 %137, i64* %_45, align 8
  %138 = load i64, i64* %_45, align 8
  %139 = load i64, i64* %i, align 8
  %140 = load i64*, i64** %items.addr, align 8
  %arrayidx74 = getelementptr inbounds i64, i64* %140, i64 %139
  store i64 %138, i64* %arrayidx74, align 8
  store i64 1, i64* %_46, align 8
  %141 = load i64, i64* %i, align 8
  %142 = load i64, i64* %_46, align 8
  %add75 = add nsw i64 %141, %142
  store i64 %add75, i64* %_47, align 8
  %143 = load i64, i64* %_47, align 8
  store i64 %143, i64* %i, align 8
  store i64 1, i64* %_48, align 8
  %144 = load i64, i64* %r, align 8
  %145 = load i64, i64* %_48, align 8
  %add76 = add nsw i64 %144, %145
  store i64 %add76, i64* %_49, align 8
  %146 = load i64, i64* %_49, align 8
  store i64 %146, i64* %r, align 8
  br label %blklab8

blklab8:                                          ; preds = %if.end72
  br label %while.body68

blklab7:                                          ; preds = %if.then71
  br label %blklab0

blklab0:                                          ; preds = %blklab7, %if.then
  %147 = load i8, i8* %_3_has_ownership, align 1
  %tobool77 = trunc i8 %147 to i1
  br i1 %tobool77, label %if.then78, label %if.end79

if.then78:                                        ; preds = %blklab0
  %148 = load i64*, i64** %_3, align 8
  %149 = bitcast i64* %148 to i8*
  call void @free(i8* %149) #4
  store i8 0, i8* %_3_has_ownership, align 1
  br label %if.end79

if.end79:                                         ; preds = %if.then78, %blklab0
  %150 = load i8, i8* %lhs_has_ownership, align 1
  %tobool80 = trunc i8 %150 to i1
  br i1 %tobool80, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.end79
  %151 = load i64*, i64** %lhs, align 8
  %152 = bitcast i64* %151 to i8*
  call void @free(i8* %152) #4
  store i8 0, i8* %lhs_has_ownership, align 1
  br label %if.end82

if.end82:                                         ; preds = %if.then81, %if.end79
  %153 = load i8, i8* %rhs_has_ownership, align 1
  %tobool83 = trunc i8 %153 to i1
  br i1 %tobool83, label %if.then84, label %if.end85

if.then84:                                        ; preds = %if.end82
  %154 = load i64*, i64** %rhs, align 8
  %155 = bitcast i64* %154 to i8*
  call void @free(i8* %155) #4
  store i8 0, i8* %rhs_has_ownership, align 1
  br label %if.end85

if.end85:                                         ; preds = %if.then84, %if.end82
  %156 = load i8, i8* %_15_has_ownership, align 1
  %tobool86 = trunc i8 %156 to i1
  br i1 %tobool86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end85
  %157 = load i64*, i64** %_15, align 8
  %158 = bitcast i64* %157 to i8*
  call void @free(i8* %158) #4
  store i8 0, i8* %_15_has_ownership, align 1
  br label %if.end88

if.end88:                                         ; preds = %if.then87, %if.end85
  %159 = load i8, i8* %_16_has_ownership, align 1
  %tobool89 = trunc i8 %159 to i1
  br i1 %tobool89, label %if.then90, label %if.end91

if.then90:                                        ; preds = %if.end88
  %160 = load i64*, i64** %_16, align 8
  %161 = bitcast i64* %160 to i8*
  call void @free(i8* %161) #4
  store i8 0, i8* %_16_has_ownership, align 1
  br label %if.end91

if.end91:                                         ; preds = %if.then90, %if.end88
  %162 = load i8, i8* %_18_has_ownership, align 1
  %tobool92 = trunc i8 %162 to i1
  br i1 %tobool92, label %if.then93, label %if.end94

if.then93:                                        ; preds = %if.end91
  %163 = load i64*, i64** %_18, align 8
  %164 = bitcast i64* %163 to i8*
  call void @free(i8* %164) #4
  store i8 0, i8* %_18_has_ownership, align 1
  br label %if.end94

if.end94:                                         ; preds = %if.then93, %if.end91
  %165 = load i8, i8* %_19_has_ownership, align 1
  %tobool95 = trunc i8 %165 to i1
  br i1 %tobool95, label %if.then96, label %if.end97

if.then96:                                        ; preds = %if.end94
  %166 = load i64*, i64** %_19, align 8
  %167 = bitcast i64* %166 to i8*
  call void @free(i8* %167) #4
  store i8 0, i8* %_19_has_ownership, align 1
  br label %if.end97

if.end97:                                         ; preds = %if.then96, %if.end94
  %168 = load i64*, i64** %items.addr, align 8
  ret i64* %168
}

; Function Attrs: nounwind
declare void @free(i8*) #1

declare i64* @slice(i64*, i64, i64, i64) #2

declare i64* @copy(i64*, i64) #2

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
  %_21 = alloca i64, align 8
  %_22 = alloca i64, align 8
  %_23 = alloca i64, align 8
  %_24 = alloca i8*, align 8
  %_26 = alloca i64*, align 8
  %_26_size = alloca i64, align 8
  %_26_has_ownership = alloca i8, align 1
  %_27 = alloca i8*, align 8
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
  store i64 0, i64* %_21, align 8
  store i64 0, i64* %_22, align 8
  store i64 0, i64* %_23, align 8
  store i64* null, i64** %_26, align 8
  store i64 0, i64* %_26_size, align 8
  store i8 0, i8* %_26_has_ownership, align 1
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
  br label %blklab9

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
  %24 = load i64, i64* %_12_size, align 8
  %call11 = call i64* @copy(i64* %23, i64 %24)
  store i64* %call11, i64** %arr, align 8
  store i8 1, i8* %arr_has_ownership, align 1
  store i8 1, i8* %_12_has_ownership, align 1
  br label %while.body

while.body:                                       ; preds = %if.end10, %blklab11
  %25 = load i64, i64* %index, align 8
  %26 = load i64, i64* %max, align 8
  %cmp12 = icmp sgt i64 %25, %26
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %while.body
  br label %blklab10

if.end15:                                         ; preds = %while.body
  %27 = load i64, i64* %max, align 8
  %28 = load i64, i64* %index, align 8
  %sub16 = sub nsw i64 %27, %28
  store i64 %sub16, i64* %_13, align 8
  %29 = load i64, i64* %_13, align 8
  %30 = load i64, i64* %index, align 8
  %31 = load i64*, i64** %arr, align 8
  %arrayidx17 = getelementptr inbounds i64, i64* %31, i64 %30
  store i64 %29, i64* %arrayidx17, align 8
  store i64 1, i64* %_14, align 8
  %32 = load i64, i64* %index, align 8
  %33 = load i64, i64* %_14, align 8
  %add18 = add nsw i64 %32, %33
  store i64 %add18, i64* %_15, align 8
  %34 = load i64, i64* %_15, align 8
  store i64 %34, i64* %index, align 8
  br label %blklab11

blklab11:                                         ; preds = %if.end15
  br label %while.body

blklab10:                                         ; preds = %if.then14
  store i64 0, i64* %_17, align 8
  store i64 1, i64* %_18, align 8
  %35 = load i64, i64* %max, align 8
  %36 = load i64, i64* %_18, align 8
  %add19 = add nsw i64 %35, %36
  store i64 %add19, i64* %_19, align 8
  %37 = load i8, i8* %_16_has_ownership, align 1
  %tobool20 = trunc i8 %37 to i1
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %blklab10
  %38 = load i64*, i64** %_16, align 8
  %39 = bitcast i64* %38 to i8*
  call void @free(i8* %39) #4
  store i8 0, i8* %_16_has_ownership, align 1
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %blklab10
  store i8 0, i8* %arr_has_ownership, align 1
  %40 = load i64, i64* %arr_size, align 8
  store i64 %40, i64* %_16_size, align 8
  %41 = load i64*, i64** %arr, align 8
  %42 = load i64, i64* %arr_size, align 8
  %call23 = call i64* @copy(i64* %41, i64 %42)
  %43 = load i64, i64* %arr_size, align 8
  %44 = load i64, i64* %_17, align 8
  %45 = load i64, i64* %_19, align 8
  %call24 = call i64* @sortV1(i64* %call23, i64 %43, i1 zeroext true, i64 %44, i64 %45)
  store i64* %call24, i64** %_16, align 8
  store i8 1, i8* %_16_has_ownership, align 1
  %46 = load i8, i8* %arr_has_ownership, align 1
  %tobool25 = trunc i8 %46 to i1
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end22
  %47 = load i64*, i64** %arr, align 8
  %48 = bitcast i64* %47 to i8*
  call void @free(i8* %48) #4
  store i8 0, i8* %arr_has_ownership, align 1
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end22
  %49 = load i64, i64* %_16_size, align 8
  store i64 %49, i64* %arr_size, align 8
  %50 = load i64*, i64** %_16, align 8
  %51 = load i64, i64* %_16_size, align 8
  %call28 = call i64* @copy(i64* %50, i64 %51)
  store i64* %call28, i64** %arr, align 8
  store i8 1, i8* %arr_has_ownership, align 1
  store i8 1, i8* %_16_has_ownership, align 1
  store i64 0, i64* %_20, align 8
  %52 = load i64, i64* %_20, align 8
  %53 = load i64*, i64** %arr, align 8
  %arrayidx29 = getelementptr inbounds i64, i64* %53, i64 %52
  %54 = load i64, i64* %arrayidx29, align 8
  store i64 %54, i64* %_21, align 8
  store i64 0, i64* %_22, align 8
  %55 = load i64, i64* %_21, align 8
  %56 = load i64, i64* %_22, align 8
  %cmp30 = icmp eq i64 %55, %56
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end27
  br label %blklab12

if.end33:                                         ; preds = %if.end27
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab12:                                         ; preds = %if.then32
  %58 = load i64, i64* %max, align 8
  %59 = load i64*, i64** %arr, align 8
  %arrayidx35 = getelementptr inbounds i64, i64* %59, i64 %58
  %60 = load i64, i64* %arrayidx35, align 8
  store i64 %60, i64* %_23, align 8
  %61 = load i64, i64* %_23, align 8
  %62 = load i64, i64* %max, align 8
  %cmp36 = icmp eq i64 %61, %62
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %blklab12
  br label %blklab13

if.end39:                                         ; preds = %blklab12
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %63, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab13:                                         ; preds = %if.then38
  %64 = load i8, i8* %_26_has_ownership, align 1
  %tobool41 = trunc i8 %64 to i1
  br i1 %tobool41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %blklab13
  %65 = load i64*, i64** %_26, align 8
  %66 = bitcast i64* %65 to i8*
  call void @free(i8* %66) #4
  store i8 0, i8* %_26_has_ownership, align 1
  br label %if.end43

if.end43:                                         ; preds = %if.then42, %blklab13
  store i64 38, i64* %_26_size, align 8
  %call44 = call noalias i8* @malloc(i64 304) #4
  %67 = bitcast i8* %call44 to i64*
  store i64* %67, i64** %_26, align 8
  %68 = load i64*, i64** %_26, align 8
  %arrayidx45 = getelementptr inbounds i64, i64* %68, i64 0
  store i64 80, i64* %arrayidx45, align 8
  %69 = load i64*, i64** %_26, align 8
  %arrayidx46 = getelementptr inbounds i64, i64* %69, i64 1
  store i64 97, i64* %arrayidx46, align 8
  %70 = load i64*, i64** %_26, align 8
  %arrayidx47 = getelementptr inbounds i64, i64* %70, i64 2
  store i64 115, i64* %arrayidx47, align 8
  %71 = load i64*, i64** %_26, align 8
  %arrayidx48 = getelementptr inbounds i64, i64* %71, i64 3
  store i64 115, i64* %arrayidx48, align 8
  %72 = load i64*, i64** %_26, align 8
  %arrayidx49 = getelementptr inbounds i64, i64* %72, i64 4
  store i64 32, i64* %arrayidx49, align 8
  %73 = load i64*, i64** %_26, align 8
  %arrayidx50 = getelementptr inbounds i64, i64* %73, i64 5
  store i64 77, i64* %arrayidx50, align 8
  %74 = load i64*, i64** %_26, align 8
  %arrayidx51 = getelementptr inbounds i64, i64* %74, i64 6
  store i64 101, i64* %arrayidx51, align 8
  %75 = load i64*, i64** %_26, align 8
  %arrayidx52 = getelementptr inbounds i64, i64* %75, i64 7
  store i64 114, i64* %arrayidx52, align 8
  %76 = load i64*, i64** %_26, align 8
  %arrayidx53 = getelementptr inbounds i64, i64* %76, i64 8
  store i64 103, i64* %arrayidx53, align 8
  %77 = load i64*, i64** %_26, align 8
  %arrayidx54 = getelementptr inbounds i64, i64* %77, i64 9
  store i64 101, i64* %arrayidx54, align 8
  %78 = load i64*, i64** %_26, align 8
  %arrayidx55 = getelementptr inbounds i64, i64* %78, i64 10
  store i64 83, i64* %arrayidx55, align 8
  %79 = load i64*, i64** %_26, align 8
  %arrayidx56 = getelementptr inbounds i64, i64* %79, i64 11
  store i64 111, i64* %arrayidx56, align 8
  %80 = load i64*, i64** %_26, align 8
  %arrayidx57 = getelementptr inbounds i64, i64* %80, i64 12
  store i64 114, i64* %arrayidx57, align 8
  %81 = load i64*, i64** %_26, align 8
  %arrayidx58 = getelementptr inbounds i64, i64* %81, i64 13
  store i64 116, i64* %arrayidx58, align 8
  %82 = load i64*, i64** %_26, align 8
  %arrayidx59 = getelementptr inbounds i64, i64* %82, i64 14
  store i64 32, i64* %arrayidx59, align 8
  %83 = load i64*, i64** %_26, align 8
  %arrayidx60 = getelementptr inbounds i64, i64* %83, i64 15
  store i64 116, i64* %arrayidx60, align 8
  %84 = load i64*, i64** %_26, align 8
  %arrayidx61 = getelementptr inbounds i64, i64* %84, i64 16
  store i64 101, i64* %arrayidx61, align 8
  %85 = load i64*, i64** %_26, align 8
  %arrayidx62 = getelementptr inbounds i64, i64* %85, i64 17
  store i64 115, i64* %arrayidx62, align 8
  %86 = load i64*, i64** %_26, align 8
  %arrayidx63 = getelementptr inbounds i64, i64* %86, i64 18
  store i64 116, i64* %arrayidx63, align 8
  %87 = load i64*, i64** %_26, align 8
  %arrayidx64 = getelementptr inbounds i64, i64* %87, i64 19
  store i64 32, i64* %arrayidx64, align 8
  %88 = load i64*, i64** %_26, align 8
  %arrayidx65 = getelementptr inbounds i64, i64* %88, i64 20
  store i64 99, i64* %arrayidx65, align 8
  %89 = load i64*, i64** %_26, align 8
  %arrayidx66 = getelementptr inbounds i64, i64* %89, i64 21
  store i64 97, i64* %arrayidx66, align 8
  %90 = load i64*, i64** %_26, align 8
  %arrayidx67 = getelementptr inbounds i64, i64* %90, i64 22
  store i64 115, i64* %arrayidx67, align 8
  %91 = load i64*, i64** %_26, align 8
  %arrayidx68 = getelementptr inbounds i64, i64* %91, i64 23
  store i64 101, i64* %arrayidx68, align 8
  %92 = load i64*, i64** %_26, align 8
  %arrayidx69 = getelementptr inbounds i64, i64* %92, i64 24
  store i64 32, i64* %arrayidx69, align 8
  %93 = load i64*, i64** %_26, align 8
  %arrayidx70 = getelementptr inbounds i64, i64* %93, i64 25
  store i64 119, i64* %arrayidx70, align 8
  %94 = load i64*, i64** %_26, align 8
  %arrayidx71 = getelementptr inbounds i64, i64* %94, i64 26
  store i64 105, i64* %arrayidx71, align 8
  %95 = load i64*, i64** %_26, align 8
  %arrayidx72 = getelementptr inbounds i64, i64* %95, i64 27
  store i64 116, i64* %arrayidx72, align 8
  %96 = load i64*, i64** %_26, align 8
  %arrayidx73 = getelementptr inbounds i64, i64* %96, i64 28
  store i64 104, i64* %arrayidx73, align 8
  %97 = load i64*, i64** %_26, align 8
  %arrayidx74 = getelementptr inbounds i64, i64* %97, i64 29
  store i64 32, i64* %arrayidx74, align 8
  %98 = load i64*, i64** %_26, align 8
  %arrayidx75 = getelementptr inbounds i64, i64* %98, i64 30
  store i64 105, i64* %arrayidx75, align 8
  %99 = load i64*, i64** %_26, align 8
  %arrayidx76 = getelementptr inbounds i64, i64* %99, i64 31
  store i64 110, i64* %arrayidx76, align 8
  %100 = load i64*, i64** %_26, align 8
  %arrayidx77 = getelementptr inbounds i64, i64* %100, i64 32
  store i64 112, i64* %arrayidx77, align 8
  %101 = load i64*, i64** %_26, align 8
  %arrayidx78 = getelementptr inbounds i64, i64* %101, i64 33
  store i64 117, i64* %arrayidx78, align 8
  %102 = load i64*, i64** %_26, align 8
  %arrayidx79 = getelementptr inbounds i64, i64* %102, i64 34
  store i64 116, i64* %arrayidx79, align 8
  %103 = load i64*, i64** %_26, align 8
  %arrayidx80 = getelementptr inbounds i64, i64* %103, i64 35
  store i64 32, i64* %arrayidx80, align 8
  %104 = load i64*, i64** %_26, align 8
  %arrayidx81 = getelementptr inbounds i64, i64* %104, i64 36
  store i64 61, i64* %arrayidx81, align 8
  %105 = load i64*, i64** %_26, align 8
  %arrayidx82 = getelementptr inbounds i64, i64* %105, i64 37
  store i64 32, i64* %arrayidx82, align 8
  store i8 1, i8* %_26_has_ownership, align 1
  %106 = load i64*, i64** %_26, align 8
  %107 = load i64, i64* %_26_size, align 8
  call void @printf_s(i64* %106, i64 %107)
  %108 = load i64, i64* %max, align 8
  %call83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i64 %108)
  br label %blklab9

blklab9:                                          ; preds = %if.end43, %if.then
  %109 = load i8, i8* %arr_has_ownership, align 1
  %tobool84 = trunc i8 %109 to i1
  br i1 %tobool84, label %if.then85, label %if.end86

if.then85:                                        ; preds = %blklab9
  %110 = load i64*, i64** %arr, align 8
  %111 = bitcast i64* %110 to i8*
  call void @free(i8* %111) #4
  store i8 0, i8* %arr_has_ownership, align 1
  br label %if.end86

if.end86:                                         ; preds = %if.then85, %blklab9
  %112 = load i8, i8* %_5_has_ownership, align 1
  %tobool87 = trunc i8 %112 to i1
  br i1 %tobool87, label %if.then88, label %if.end89

if.then88:                                        ; preds = %if.end86
  %113 = load i64**, i64*** %_5, align 8
  %114 = load i64, i64* %_5_size, align 8
  call void @free2DArray(i64** %113, i64 %114)
  store i8 0, i8* %_5_has_ownership, align 1
  br label %if.end89

if.end89:                                         ; preds = %if.then88, %if.end86
  %115 = load i8, i8* %_7_has_ownership, align 1
  %tobool90 = trunc i8 %115 to i1
  br i1 %tobool90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end89
  %116 = load i64*, i64** %_7, align 8
  %117 = bitcast i64* %116 to i8*
  call void @free(i8* %117) #4
  store i8 0, i8* %_7_has_ownership, align 1
  br label %if.end92

if.end92:                                         ; preds = %if.then91, %if.end89
  %118 = load i8, i8* %_12_has_ownership, align 1
  %tobool93 = trunc i8 %118 to i1
  br i1 %tobool93, label %if.then94, label %if.end95

if.then94:                                        ; preds = %if.end92
  %119 = load i64*, i64** %_12, align 8
  %120 = bitcast i64* %119 to i8*
  call void @free(i8* %120) #4
  store i8 0, i8* %_12_has_ownership, align 1
  br label %if.end95

if.end95:                                         ; preds = %if.then94, %if.end92
  %121 = load i8, i8* %_16_has_ownership, align 1
  %tobool96 = trunc i8 %121 to i1
  br i1 %tobool96, label %if.then97, label %if.end98

if.then97:                                        ; preds = %if.end95
  %122 = load i64*, i64** %_16, align 8
  %123 = bitcast i64* %122 to i8*
  call void @free(i8* %123) #4
  store i8 0, i8* %_16_has_ownership, align 1
  br label %if.end98

if.end98:                                         ; preds = %if.then97, %if.end95
  %124 = load i8, i8* %_26_has_ownership, align 1
  %tobool99 = trunc i8 %124 to i1
  br i1 %tobool99, label %if.then100, label %if.end101

if.then100:                                       ; preds = %if.end98
  %125 = load i64*, i64** %_26, align 8
  %126 = bitcast i64* %125 to i8*
  call void @free(i8* %126) #4
  store i8 0, i8* %_26_has_ownership, align 1
  br label %if.end101

if.end101:                                        ; preds = %if.then100, %if.end98
  call void @exit(i32 0) #5
  unreachable

return:                                           ; No predecessors!
  %127 = load i32, i32* %retval, align 4
  ret i32 %127
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64 @parseStringToInt(i64*) #2

declare i64* @gen1DArray(i32, i32) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

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
