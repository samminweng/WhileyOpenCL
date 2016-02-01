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
  store i64* %22, i64** %lhs, align 8
  store i8 1, i8* %lhs_has_ownership, align 1
  store i8 0, i8* %_15_has_ownership, align 1
  store i64 0, i64* %_17, align 8
  %23 = load i8, i8* %_16_has_ownership, align 1
  %tobool7 = trunc i8 %23 to i1
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  %24 = load i64*, i64** %_16, align 8
  %25 = bitcast i64* %24 to i8*
  call void @free(i8* %25) #4
  store i8 0, i8* %_16_has_ownership, align 1
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6
  store i8 0, i8* %lhs_has_ownership, align 1
  %26 = load i64, i64* %lhs_size, align 8
  store i64 %26, i64* %_16_size, align 8
  %27 = load i64*, i64** %lhs, align 8
  %28 = load i64, i64* %lhs_size, align 8
  %29 = load i64, i64* %_17, align 8
  %30 = load i64, i64* %pivot, align 8
  %call10 = call i64* @sortV1(i64* %27, i64 %28, i1 zeroext true, i64 %29, i64 %30)
  store i64* %call10, i64** %_16, align 8
  store i8 1, i8* %_16_has_ownership, align 1
  %31 = load i8, i8* %lhs_has_ownership, align 1
  %tobool11 = trunc i8 %31 to i1
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end9
  %32 = load i64*, i64** %lhs, align 8
  %33 = bitcast i64* %32 to i8*
  call void @free(i8* %33) #4
  store i8 0, i8* %lhs_has_ownership, align 1
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end9
  %34 = load i64, i64* %_16_size, align 8
  store i64 %34, i64* %lhs_size, align 8
  %35 = load i64*, i64** %_16, align 8
  store i64* %35, i64** %lhs, align 8
  store i8 1, i8* %lhs_has_ownership, align 1
  store i8 0, i8* %_16_has_ownership, align 1
  %36 = load i8, i8* %_18_has_ownership, align 1
  %tobool14 = trunc i8 %36 to i1
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  %37 = load i64*, i64** %_18, align 8
  %38 = bitcast i64* %37 to i8*
  call void @free(i8* %38) #4
  store i8 0, i8* %_18_has_ownership, align 1
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end13
  %39 = load i64*, i64** %items.addr, align 8
  %40 = load i64, i64* %items_size.addr, align 8
  %41 = load i64, i64* %pivot, align 8
  %42 = load i64, i64* %end.addr, align 8
  %call17 = call i64* @slice(i64* %39, i64 %40, i64 %41, i64 %42)
  store i64* %call17, i64** %_18, align 8
  %43 = load i64, i64* %end.addr, align 8
  %44 = load i64, i64* %pivot, align 8
  %sub18 = sub nsw i64 %43, %44
  store i64 %sub18, i64* %_18_size, align 8
  store i8 1, i8* %_18_has_ownership, align 1
  %45 = load i8, i8* %rhs_has_ownership, align 1
  %tobool19 = trunc i8 %45 to i1
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end16
  %46 = load i64*, i64** %rhs, align 8
  %47 = bitcast i64* %46 to i8*
  call void @free(i8* %47) #4
  store i8 0, i8* %rhs_has_ownership, align 1
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end16
  %48 = load i64, i64* %_18_size, align 8
  store i64 %48, i64* %rhs_size, align 8
  %49 = load i64*, i64** %_18, align 8
  store i64* %49, i64** %rhs, align 8
  store i8 1, i8* %rhs_has_ownership, align 1
  store i8 0, i8* %_18_has_ownership, align 1
  store i64 0, i64* %_20, align 8
  %50 = load i64, i64* %end.addr, align 8
  %51 = load i64, i64* %pivot, align 8
  %sub22 = sub nsw i64 %50, %51
  store i64 %sub22, i64* %_21, align 8
  %52 = load i8, i8* %_19_has_ownership, align 1
  %tobool23 = trunc i8 %52 to i1
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end21
  %53 = load i64*, i64** %_19, align 8
  %54 = bitcast i64* %53 to i8*
  call void @free(i8* %54) #4
  store i8 0, i8* %_19_has_ownership, align 1
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end21
  store i8 0, i8* %rhs_has_ownership, align 1
  %55 = load i64, i64* %rhs_size, align 8
  store i64 %55, i64* %_19_size, align 8
  %56 = load i64*, i64** %rhs, align 8
  %57 = load i64, i64* %rhs_size, align 8
  %58 = load i64, i64* %_20, align 8
  %59 = load i64, i64* %_21, align 8
  %call26 = call i64* @sortV1(i64* %56, i64 %57, i1 zeroext true, i64 %58, i64 %59)
  store i64* %call26, i64** %_19, align 8
  store i8 1, i8* %_19_has_ownership, align 1
  %60 = load i8, i8* %rhs_has_ownership, align 1
  %tobool27 = trunc i8 %60 to i1
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end25
  %61 = load i64*, i64** %rhs, align 8
  %62 = bitcast i64* %61 to i8*
  call void @free(i8* %62) #4
  store i8 0, i8* %rhs_has_ownership, align 1
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %if.end25
  %63 = load i64, i64* %_19_size, align 8
  store i64 %63, i64* %rhs_size, align 8
  %64 = load i64*, i64** %_19, align 8
  store i64* %64, i64** %rhs, align 8
  store i8 1, i8* %rhs_has_ownership, align 1
  store i8 0, i8* %_19_has_ownership, align 1
  store i64 0, i64* %_22, align 8
  %65 = load i64, i64* %_22, align 8
  store i64 %65, i64* %l, align 8
  store i64 0, i64* %_23, align 8
  %66 = load i64, i64* %_23, align 8
  store i64 %66, i64* %r, align 8
  store i64 0, i64* %_24, align 8
  %67 = load i64, i64* %_24, align 8
  store i64 %67, i64* %i, align 8
  br label %while.body

while.body:                                       ; preds = %if.end29, %blklab2
  %68 = load i64, i64* %end.addr, align 8
  %69 = load i64, i64* %start.addr, align 8
  %sub30 = sub nsw i64 %68, %69
  store i64 %sub30, i64* %_25, align 8
  %70 = load i64, i64* %i, align 8
  %71 = load i64, i64* %_25, align 8
  %cmp31 = icmp sge i64 %70, %71
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %while.body
  br label %blklab1

if.end33:                                         ; preds = %while.body
  %72 = load i64, i64* %pivot, align 8
  %73 = load i64, i64* %start.addr, align 8
  %sub34 = sub nsw i64 %72, %73
  store i64 %sub34, i64* %_26, align 8
  %74 = load i64, i64* %l, align 8
  %75 = load i64, i64* %_26, align 8
  %cmp35 = icmp sge i64 %74, %75
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end33
  br label %blklab1

if.end37:                                         ; preds = %if.end33
  %76 = load i64, i64* %end.addr, align 8
  %77 = load i64, i64* %pivot, align 8
  %sub38 = sub nsw i64 %76, %77
  store i64 %sub38, i64* %_27, align 8
  %78 = load i64, i64* %r, align 8
  %79 = load i64, i64* %_27, align 8
  %cmp39 = icmp sge i64 %78, %79
  br i1 %cmp39, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end37
  br label %blklab1

if.end41:                                         ; preds = %if.end37
  %80 = load i64, i64* %l, align 8
  %81 = load i64*, i64** %lhs, align 8
  %arrayidx = getelementptr inbounds i64, i64* %81, i64 %80
  %82 = load i64, i64* %arrayidx, align 8
  store i64 %82, i64* %_28, align 8
  %83 = load i64, i64* %r, align 8
  %84 = load i64*, i64** %rhs, align 8
  %arrayidx42 = getelementptr inbounds i64, i64* %84, i64 %83
  %85 = load i64, i64* %arrayidx42, align 8
  store i64 %85, i64* %_29, align 8
  %86 = load i64, i64* %_28, align 8
  %87 = load i64, i64* %_29, align 8
  %cmp43 = icmp sgt i64 %86, %87
  br i1 %cmp43, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.end41
  br label %blklab3

if.end45:                                         ; preds = %if.end41
  %88 = load i64, i64* %l, align 8
  %89 = load i64*, i64** %lhs, align 8
  %arrayidx46 = getelementptr inbounds i64, i64* %89, i64 %88
  %90 = load i64, i64* %arrayidx46, align 8
  store i64 %90, i64* %_30, align 8
  %91 = load i64, i64* %_30, align 8
  %92 = load i64, i64* %i, align 8
  %93 = load i64*, i64** %items.addr, align 8
  %arrayidx47 = getelementptr inbounds i64, i64* %93, i64 %92
  store i64 %91, i64* %arrayidx47, align 8
  store i64 1, i64* %_31, align 8
  %94 = load i64, i64* %l, align 8
  %95 = load i64, i64* %_31, align 8
  %add48 = add nsw i64 %94, %95
  store i64 %add48, i64* %_32, align 8
  %96 = load i64, i64* %_32, align 8
  store i64 %96, i64* %l, align 8
  br label %blklab4

blklab3:                                          ; preds = %if.then44
  %97 = load i64, i64* %r, align 8
  %98 = load i64*, i64** %rhs, align 8
  %arrayidx49 = getelementptr inbounds i64, i64* %98, i64 %97
  %99 = load i64, i64* %arrayidx49, align 8
  store i64 %99, i64* %_33, align 8
  %100 = load i64, i64* %_33, align 8
  %101 = load i64, i64* %i, align 8
  %102 = load i64*, i64** %items.addr, align 8
  %arrayidx50 = getelementptr inbounds i64, i64* %102, i64 %101
  store i64 %100, i64* %arrayidx50, align 8
  store i64 1, i64* %_34, align 8
  %103 = load i64, i64* %r, align 8
  %104 = load i64, i64* %_34, align 8
  %add51 = add nsw i64 %103, %104
  store i64 %add51, i64* %_35, align 8
  %105 = load i64, i64* %_35, align 8
  store i64 %105, i64* %r, align 8
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end45
  store i64 1, i64* %_36, align 8
  %106 = load i64, i64* %i, align 8
  %107 = load i64, i64* %_36, align 8
  %add52 = add nsw i64 %106, %107
  store i64 %add52, i64* %_37, align 8
  %108 = load i64, i64* %_37, align 8
  store i64 %108, i64* %i, align 8
  br label %blklab2

blklab2:                                          ; preds = %blklab4
  br label %while.body

blklab1:                                          ; preds = %if.then40, %if.then36, %if.then32
  br label %while.body53

while.body53:                                     ; preds = %blklab1, %blklab6
  %109 = load i64, i64* %pivot, align 8
  %110 = load i64, i64* %start.addr, align 8
  %sub54 = sub nsw i64 %109, %110
  store i64 %sub54, i64* %_38, align 8
  %111 = load i64, i64* %l, align 8
  %112 = load i64, i64* %_38, align 8
  %cmp55 = icmp sge i64 %111, %112
  br i1 %cmp55, label %if.then56, label %if.end57

if.then56:                                        ; preds = %while.body53
  br label %blklab5

if.end57:                                         ; preds = %while.body53
  %113 = load i64, i64* %l, align 8
  %114 = load i64*, i64** %lhs, align 8
  %arrayidx58 = getelementptr inbounds i64, i64* %114, i64 %113
  %115 = load i64, i64* %arrayidx58, align 8
  store i64 %115, i64* %_39, align 8
  %116 = load i64, i64* %_39, align 8
  %117 = load i64, i64* %i, align 8
  %118 = load i64*, i64** %items.addr, align 8
  %arrayidx59 = getelementptr inbounds i64, i64* %118, i64 %117
  store i64 %116, i64* %arrayidx59, align 8
  store i64 1, i64* %_40, align 8
  %119 = load i64, i64* %i, align 8
  %120 = load i64, i64* %_40, align 8
  %add60 = add nsw i64 %119, %120
  store i64 %add60, i64* %_41, align 8
  %121 = load i64, i64* %_41, align 8
  store i64 %121, i64* %i, align 8
  store i64 1, i64* %_42, align 8
  %122 = load i64, i64* %l, align 8
  %123 = load i64, i64* %_42, align 8
  %add61 = add nsw i64 %122, %123
  store i64 %add61, i64* %_43, align 8
  %124 = load i64, i64* %_43, align 8
  store i64 %124, i64* %l, align 8
  br label %blklab6

blklab6:                                          ; preds = %if.end57
  br label %while.body53

blklab5:                                          ; preds = %if.then56
  br label %while.body62

while.body62:                                     ; preds = %blklab5, %blklab8
  %125 = load i64, i64* %end.addr, align 8
  %126 = load i64, i64* %pivot, align 8
  %sub63 = sub nsw i64 %125, %126
  store i64 %sub63, i64* %_44, align 8
  %127 = load i64, i64* %r, align 8
  %128 = load i64, i64* %_44, align 8
  %cmp64 = icmp sge i64 %127, %128
  br i1 %cmp64, label %if.then65, label %if.end66

if.then65:                                        ; preds = %while.body62
  br label %blklab7

if.end66:                                         ; preds = %while.body62
  %129 = load i64, i64* %r, align 8
  %130 = load i64*, i64** %rhs, align 8
  %arrayidx67 = getelementptr inbounds i64, i64* %130, i64 %129
  %131 = load i64, i64* %arrayidx67, align 8
  store i64 %131, i64* %_45, align 8
  %132 = load i64, i64* %_45, align 8
  %133 = load i64, i64* %i, align 8
  %134 = load i64*, i64** %items.addr, align 8
  %arrayidx68 = getelementptr inbounds i64, i64* %134, i64 %133
  store i64 %132, i64* %arrayidx68, align 8
  store i64 1, i64* %_46, align 8
  %135 = load i64, i64* %i, align 8
  %136 = load i64, i64* %_46, align 8
  %add69 = add nsw i64 %135, %136
  store i64 %add69, i64* %_47, align 8
  %137 = load i64, i64* %_47, align 8
  store i64 %137, i64* %i, align 8
  store i64 1, i64* %_48, align 8
  %138 = load i64, i64* %r, align 8
  %139 = load i64, i64* %_48, align 8
  %add70 = add nsw i64 %138, %139
  store i64 %add70, i64* %_49, align 8
  %140 = load i64, i64* %_49, align 8
  store i64 %140, i64* %r, align 8
  br label %blklab8

blklab8:                                          ; preds = %if.end66
  br label %while.body62

blklab7:                                          ; preds = %if.then65
  br label %blklab0

blklab0:                                          ; preds = %blklab7, %if.then
  %141 = load i8, i8* %_3_has_ownership, align 1
  %tobool71 = trunc i8 %141 to i1
  br i1 %tobool71, label %if.then72, label %if.end73

if.then72:                                        ; preds = %blklab0
  %142 = load i64*, i64** %_3, align 8
  %143 = bitcast i64* %142 to i8*
  call void @free(i8* %143) #4
  store i8 0, i8* %_3_has_ownership, align 1
  br label %if.end73

if.end73:                                         ; preds = %if.then72, %blklab0
  %144 = load i8, i8* %lhs_has_ownership, align 1
  %tobool74 = trunc i8 %144 to i1
  br i1 %tobool74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end73
  %145 = load i64*, i64** %lhs, align 8
  %146 = bitcast i64* %145 to i8*
  call void @free(i8* %146) #4
  store i8 0, i8* %lhs_has_ownership, align 1
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %if.end73
  %147 = load i8, i8* %rhs_has_ownership, align 1
  %tobool77 = trunc i8 %147 to i1
  br i1 %tobool77, label %if.then78, label %if.end79

if.then78:                                        ; preds = %if.end76
  %148 = load i64*, i64** %rhs, align 8
  %149 = bitcast i64* %148 to i8*
  call void @free(i8* %149) #4
  store i8 0, i8* %rhs_has_ownership, align 1
  br label %if.end79

if.end79:                                         ; preds = %if.then78, %if.end76
  %150 = load i8, i8* %_15_has_ownership, align 1
  %tobool80 = trunc i8 %150 to i1
  br i1 %tobool80, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.end79
  %151 = load i64*, i64** %_15, align 8
  %152 = bitcast i64* %151 to i8*
  call void @free(i8* %152) #4
  store i8 0, i8* %_15_has_ownership, align 1
  br label %if.end82

if.end82:                                         ; preds = %if.then81, %if.end79
  %153 = load i8, i8* %_16_has_ownership, align 1
  %tobool83 = trunc i8 %153 to i1
  br i1 %tobool83, label %if.then84, label %if.end85

if.then84:                                        ; preds = %if.end82
  %154 = load i64*, i64** %_16, align 8
  %155 = bitcast i64* %154 to i8*
  call void @free(i8* %155) #4
  store i8 0, i8* %_16_has_ownership, align 1
  br label %if.end85

if.end85:                                         ; preds = %if.then84, %if.end82
  %156 = load i8, i8* %_18_has_ownership, align 1
  %tobool86 = trunc i8 %156 to i1
  br i1 %tobool86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end85
  %157 = load i64*, i64** %_18, align 8
  %158 = bitcast i64* %157 to i8*
  call void @free(i8* %158) #4
  store i8 0, i8* %_18_has_ownership, align 1
  br label %if.end88

if.end88:                                         ; preds = %if.then87, %if.end85
  %159 = load i8, i8* %_19_has_ownership, align 1
  %tobool89 = trunc i8 %159 to i1
  br i1 %tobool89, label %if.then90, label %if.end91

if.then90:                                        ; preds = %if.end88
  %160 = load i64*, i64** %_19, align 8
  %161 = bitcast i64* %160 to i8*
  call void @free(i8* %161) #4
  store i8 0, i8* %_19_has_ownership, align 1
  br label %if.end91

if.end91:                                         ; preds = %if.then90, %if.end88
  %162 = load i64*, i64** %items.addr, align 8
  ret i64* %162
}

; Function Attrs: nounwind
declare void @free(i8*) #1

declare i64* @slice(i64*, i64, i64, i64) #2

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
  store i64* %23, i64** %arr, align 8
  store i8 1, i8* %arr_has_ownership, align 1
  store i8 0, i8* %_12_has_ownership, align 1
  br label %while.body

while.body:                                       ; preds = %if.end10, %blklab11
  %24 = load i64, i64* %index, align 8
  %25 = load i64, i64* %max, align 8
  %cmp11 = icmp sgt i64 %24, %25
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %while.body
  br label %blklab10

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
  br label %blklab11

blklab11:                                         ; preds = %if.end14
  br label %while.body

blklab10:                                         ; preds = %if.then13
  store i64 0, i64* %_17, align 8
  store i64 1, i64* %_18, align 8
  %34 = load i64, i64* %max, align 8
  %35 = load i64, i64* %_18, align 8
  %add18 = add nsw i64 %34, %35
  store i64 %add18, i64* %_19, align 8
  %36 = load i8, i8* %_16_has_ownership, align 1
  %tobool19 = trunc i8 %36 to i1
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %blklab10
  %37 = load i64*, i64** %_16, align 8
  %38 = bitcast i64* %37 to i8*
  call void @free(i8* %38) #4
  store i8 0, i8* %_16_has_ownership, align 1
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %blklab10
  store i8 0, i8* %arr_has_ownership, align 1
  %39 = load i64, i64* %arr_size, align 8
  store i64 %39, i64* %_16_size, align 8
  %40 = load i64*, i64** %arr, align 8
  %41 = load i64, i64* %arr_size, align 8
  %42 = load i64, i64* %_17, align 8
  %43 = load i64, i64* %_19, align 8
  %call22 = call i64* @sortV1(i64* %40, i64 %41, i1 zeroext true, i64 %42, i64 %43)
  store i64* %call22, i64** %_16, align 8
  store i8 1, i8* %_16_has_ownership, align 1
  %44 = load i8, i8* %arr_has_ownership, align 1
  %tobool23 = trunc i8 %44 to i1
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end21
  %45 = load i64*, i64** %arr, align 8
  %46 = bitcast i64* %45 to i8*
  call void @free(i8* %46) #4
  store i8 0, i8* %arr_has_ownership, align 1
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.end21
  %47 = load i64, i64* %_16_size, align 8
  store i64 %47, i64* %arr_size, align 8
  %48 = load i64*, i64** %_16, align 8
  store i64* %48, i64** %arr, align 8
  store i8 1, i8* %arr_has_ownership, align 1
  store i8 0, i8* %_16_has_ownership, align 1
  store i64 0, i64* %_20, align 8
  %49 = load i64, i64* %_20, align 8
  %50 = load i64*, i64** %arr, align 8
  %arrayidx26 = getelementptr inbounds i64, i64* %50, i64 %49
  %51 = load i64, i64* %arrayidx26, align 8
  store i64 %51, i64* %_21, align 8
  store i64 0, i64* %_22, align 8
  %52 = load i64, i64* %_21, align 8
  %53 = load i64, i64* %_22, align 8
  %cmp27 = icmp eq i64 %52, %53
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end25
  br label %blklab12

if.end30:                                         ; preds = %if.end25
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab12:                                         ; preds = %if.then29
  %55 = load i64, i64* %max, align 8
  %56 = load i64*, i64** %arr, align 8
  %arrayidx32 = getelementptr inbounds i64, i64* %56, i64 %55
  %57 = load i64, i64* %arrayidx32, align 8
  store i64 %57, i64* %_23, align 8
  %58 = load i64, i64* %_23, align 8
  %59 = load i64, i64* %max, align 8
  %cmp33 = icmp eq i64 %58, %59
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %blklab12
  br label %blklab13

if.end36:                                         ; preds = %blklab12
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call37 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

blklab13:                                         ; preds = %if.then35
  %61 = load i8, i8* %_26_has_ownership, align 1
  %tobool38 = trunc i8 %61 to i1
  br i1 %tobool38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %blklab13
  %62 = load i64*, i64** %_26, align 8
  %63 = bitcast i64* %62 to i8*
  call void @free(i8* %63) #4
  store i8 0, i8* %_26_has_ownership, align 1
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %blklab13
  store i64 38, i64* %_26_size, align 8
  %call41 = call noalias i8* @malloc(i64 304) #4
  %64 = bitcast i8* %call41 to i64*
  store i64* %64, i64** %_26, align 8
  %65 = load i64*, i64** %_26, align 8
  %arrayidx42 = getelementptr inbounds i64, i64* %65, i64 0
  store i64 80, i64* %arrayidx42, align 8
  %66 = load i64*, i64** %_26, align 8
  %arrayidx43 = getelementptr inbounds i64, i64* %66, i64 1
  store i64 97, i64* %arrayidx43, align 8
  %67 = load i64*, i64** %_26, align 8
  %arrayidx44 = getelementptr inbounds i64, i64* %67, i64 2
  store i64 115, i64* %arrayidx44, align 8
  %68 = load i64*, i64** %_26, align 8
  %arrayidx45 = getelementptr inbounds i64, i64* %68, i64 3
  store i64 115, i64* %arrayidx45, align 8
  %69 = load i64*, i64** %_26, align 8
  %arrayidx46 = getelementptr inbounds i64, i64* %69, i64 4
  store i64 32, i64* %arrayidx46, align 8
  %70 = load i64*, i64** %_26, align 8
  %arrayidx47 = getelementptr inbounds i64, i64* %70, i64 5
  store i64 77, i64* %arrayidx47, align 8
  %71 = load i64*, i64** %_26, align 8
  %arrayidx48 = getelementptr inbounds i64, i64* %71, i64 6
  store i64 101, i64* %arrayidx48, align 8
  %72 = load i64*, i64** %_26, align 8
  %arrayidx49 = getelementptr inbounds i64, i64* %72, i64 7
  store i64 114, i64* %arrayidx49, align 8
  %73 = load i64*, i64** %_26, align 8
  %arrayidx50 = getelementptr inbounds i64, i64* %73, i64 8
  store i64 103, i64* %arrayidx50, align 8
  %74 = load i64*, i64** %_26, align 8
  %arrayidx51 = getelementptr inbounds i64, i64* %74, i64 9
  store i64 101, i64* %arrayidx51, align 8
  %75 = load i64*, i64** %_26, align 8
  %arrayidx52 = getelementptr inbounds i64, i64* %75, i64 10
  store i64 83, i64* %arrayidx52, align 8
  %76 = load i64*, i64** %_26, align 8
  %arrayidx53 = getelementptr inbounds i64, i64* %76, i64 11
  store i64 111, i64* %arrayidx53, align 8
  %77 = load i64*, i64** %_26, align 8
  %arrayidx54 = getelementptr inbounds i64, i64* %77, i64 12
  store i64 114, i64* %arrayidx54, align 8
  %78 = load i64*, i64** %_26, align 8
  %arrayidx55 = getelementptr inbounds i64, i64* %78, i64 13
  store i64 116, i64* %arrayidx55, align 8
  %79 = load i64*, i64** %_26, align 8
  %arrayidx56 = getelementptr inbounds i64, i64* %79, i64 14
  store i64 32, i64* %arrayidx56, align 8
  %80 = load i64*, i64** %_26, align 8
  %arrayidx57 = getelementptr inbounds i64, i64* %80, i64 15
  store i64 116, i64* %arrayidx57, align 8
  %81 = load i64*, i64** %_26, align 8
  %arrayidx58 = getelementptr inbounds i64, i64* %81, i64 16
  store i64 101, i64* %arrayidx58, align 8
  %82 = load i64*, i64** %_26, align 8
  %arrayidx59 = getelementptr inbounds i64, i64* %82, i64 17
  store i64 115, i64* %arrayidx59, align 8
  %83 = load i64*, i64** %_26, align 8
  %arrayidx60 = getelementptr inbounds i64, i64* %83, i64 18
  store i64 116, i64* %arrayidx60, align 8
  %84 = load i64*, i64** %_26, align 8
  %arrayidx61 = getelementptr inbounds i64, i64* %84, i64 19
  store i64 32, i64* %arrayidx61, align 8
  %85 = load i64*, i64** %_26, align 8
  %arrayidx62 = getelementptr inbounds i64, i64* %85, i64 20
  store i64 99, i64* %arrayidx62, align 8
  %86 = load i64*, i64** %_26, align 8
  %arrayidx63 = getelementptr inbounds i64, i64* %86, i64 21
  store i64 97, i64* %arrayidx63, align 8
  %87 = load i64*, i64** %_26, align 8
  %arrayidx64 = getelementptr inbounds i64, i64* %87, i64 22
  store i64 115, i64* %arrayidx64, align 8
  %88 = load i64*, i64** %_26, align 8
  %arrayidx65 = getelementptr inbounds i64, i64* %88, i64 23
  store i64 101, i64* %arrayidx65, align 8
  %89 = load i64*, i64** %_26, align 8
  %arrayidx66 = getelementptr inbounds i64, i64* %89, i64 24
  store i64 32, i64* %arrayidx66, align 8
  %90 = load i64*, i64** %_26, align 8
  %arrayidx67 = getelementptr inbounds i64, i64* %90, i64 25
  store i64 119, i64* %arrayidx67, align 8
  %91 = load i64*, i64** %_26, align 8
  %arrayidx68 = getelementptr inbounds i64, i64* %91, i64 26
  store i64 105, i64* %arrayidx68, align 8
  %92 = load i64*, i64** %_26, align 8
  %arrayidx69 = getelementptr inbounds i64, i64* %92, i64 27
  store i64 116, i64* %arrayidx69, align 8
  %93 = load i64*, i64** %_26, align 8
  %arrayidx70 = getelementptr inbounds i64, i64* %93, i64 28
  store i64 104, i64* %arrayidx70, align 8
  %94 = load i64*, i64** %_26, align 8
  %arrayidx71 = getelementptr inbounds i64, i64* %94, i64 29
  store i64 32, i64* %arrayidx71, align 8
  %95 = load i64*, i64** %_26, align 8
  %arrayidx72 = getelementptr inbounds i64, i64* %95, i64 30
  store i64 105, i64* %arrayidx72, align 8
  %96 = load i64*, i64** %_26, align 8
  %arrayidx73 = getelementptr inbounds i64, i64* %96, i64 31
  store i64 110, i64* %arrayidx73, align 8
  %97 = load i64*, i64** %_26, align 8
  %arrayidx74 = getelementptr inbounds i64, i64* %97, i64 32
  store i64 112, i64* %arrayidx74, align 8
  %98 = load i64*, i64** %_26, align 8
  %arrayidx75 = getelementptr inbounds i64, i64* %98, i64 33
  store i64 117, i64* %arrayidx75, align 8
  %99 = load i64*, i64** %_26, align 8
  %arrayidx76 = getelementptr inbounds i64, i64* %99, i64 34
  store i64 116, i64* %arrayidx76, align 8
  %100 = load i64*, i64** %_26, align 8
  %arrayidx77 = getelementptr inbounds i64, i64* %100, i64 35
  store i64 32, i64* %arrayidx77, align 8
  %101 = load i64*, i64** %_26, align 8
  %arrayidx78 = getelementptr inbounds i64, i64* %101, i64 36
  store i64 61, i64* %arrayidx78, align 8
  %102 = load i64*, i64** %_26, align 8
  %arrayidx79 = getelementptr inbounds i64, i64* %102, i64 37
  store i64 32, i64* %arrayidx79, align 8
  store i8 1, i8* %_26_has_ownership, align 1
  %103 = load i64*, i64** %_26, align 8
  %104 = load i64, i64* %_26_size, align 8
  call void @printf_s(i64* %103, i64 %104)
  %105 = load i64, i64* %max, align 8
  %call80 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i64 %105)
  br label %blklab9

blklab9:                                          ; preds = %if.end40, %if.then
  %106 = load i8, i8* %arr_has_ownership, align 1
  %tobool81 = trunc i8 %106 to i1
  br i1 %tobool81, label %if.then82, label %if.end83

if.then82:                                        ; preds = %blklab9
  %107 = load i64*, i64** %arr, align 8
  %108 = bitcast i64* %107 to i8*
  call void @free(i8* %108) #4
  store i8 0, i8* %arr_has_ownership, align 1
  br label %if.end83

if.end83:                                         ; preds = %if.then82, %blklab9
  %109 = load i8, i8* %_5_has_ownership, align 1
  %tobool84 = trunc i8 %109 to i1
  br i1 %tobool84, label %if.then85, label %if.end86

if.then85:                                        ; preds = %if.end83
  %110 = load i64**, i64*** %_5, align 8
  %111 = load i64, i64* %_5_size, align 8
  call void @free2DArray(i64** %110, i64 %111)
  store i8 0, i8* %_5_has_ownership, align 1
  br label %if.end86

if.end86:                                         ; preds = %if.then85, %if.end83
  %112 = load i8, i8* %_7_has_ownership, align 1
  %tobool87 = trunc i8 %112 to i1
  br i1 %tobool87, label %if.then88, label %if.end89

if.then88:                                        ; preds = %if.end86
  %113 = load i64*, i64** %_7, align 8
  %114 = bitcast i64* %113 to i8*
  call void @free(i8* %114) #4
  store i8 0, i8* %_7_has_ownership, align 1
  br label %if.end89

if.end89:                                         ; preds = %if.then88, %if.end86
  %115 = load i8, i8* %_12_has_ownership, align 1
  %tobool90 = trunc i8 %115 to i1
  br i1 %tobool90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end89
  %116 = load i64*, i64** %_12, align 8
  %117 = bitcast i64* %116 to i8*
  call void @free(i8* %117) #4
  store i8 0, i8* %_12_has_ownership, align 1
  br label %if.end92

if.end92:                                         ; preds = %if.then91, %if.end89
  %118 = load i8, i8* %_16_has_ownership, align 1
  %tobool93 = trunc i8 %118 to i1
  br i1 %tobool93, label %if.then94, label %if.end95

if.then94:                                        ; preds = %if.end92
  %119 = load i64*, i64** %_16, align 8
  %120 = bitcast i64* %119 to i8*
  call void @free(i8* %120) #4
  store i8 0, i8* %_16_has_ownership, align 1
  br label %if.end95

if.end95:                                         ; preds = %if.then94, %if.end92
  %121 = load i8, i8* %_26_has_ownership, align 1
  %tobool96 = trunc i8 %121 to i1
  br i1 %tobool96, label %if.then97, label %if.end98

if.then97:                                        ; preds = %if.end95
  %122 = load i64*, i64** %_26, align 8
  %123 = bitcast i64* %122 to i8*
  call void @free(i8* %123) #4
  store i8 0, i8* %_26_has_ownership, align 1
  br label %if.end98

if.end98:                                         ; preds = %if.then97, %if.end95
  call void @exit(i32 0) #5
  unreachable

return:                                           ; No predecessors!
  %124 = load i32, i32* %retval, align 4
  ret i32 %124
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
