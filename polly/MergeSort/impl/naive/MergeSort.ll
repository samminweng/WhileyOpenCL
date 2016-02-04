; ModuleID = 'MergeSort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @sortV1(i64* %items, i64 %items_size, i64 %start, i64 %end) #0 {
entry:
  %items.addr = alloca i64*, align 8
  %items_size.addr = alloca i64, align 8
  %start.addr = alloca i64, align 8
  %end.addr = alloca i64, align 8
  %_3 = alloca i64*, align 8
  %_3_size = alloca i64, align 8
  %pivot = alloca i64, align 8
  %lhs = alloca i64*, align 8
  %lhs_size = alloca i64, align 8
  %rhs = alloca i64*, align 8
  %rhs_size = alloca i64, align 8
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
  %_16 = alloca i64*, align 8
  %_16_size = alloca i64, align 8
  %_17 = alloca i64, align 8
  %_18 = alloca i64*, align 8
  %_18_size = alloca i64, align 8
  %_19 = alloca i64*, align 8
  %_19_size = alloca i64, align 8
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
  store i64 %start, i64* %start.addr, align 8
  store i64 %end, i64* %end.addr, align 8
  store i64* null, i64** %_3, align 8
  store i64 0, i64* %_3_size, align 8
  store i64 0, i64* %pivot, align 8
  store i64* null, i64** %lhs, align 8
  store i64 0, i64* %lhs_size, align 8
  store i64* null, i64** %rhs, align 8
  store i64 0, i64* %rhs_size, align 8
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
  store i64* null, i64** %_16, align 8
  store i64 0, i64* %_16_size, align 8
  store i64 0, i64* %_17, align 8
  store i64* null, i64** %_18, align 8
  store i64 0, i64* %_18_size, align 8
  store i64* null, i64** %_19, align 8
  store i64 0, i64* %_19_size, align 8
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
  %9 = load i64*, i64** %items.addr, align 8
  %10 = load i64, i64* %items_size.addr, align 8
  %11 = load i64, i64* %start.addr, align 8
  %12 = load i64, i64* %pivot, align 8
  %call = call i64* @slice(i64* %9, i64 %10, i64 %11, i64 %12)
  store i64* %call, i64** %_15, align 8
  %13 = load i64, i64* %pivot, align 8
  %14 = load i64, i64* %start.addr, align 8
  %sub = sub nsw i64 %13, %14
  store i64 %sub, i64* %_15_size, align 8
  %15 = load i64, i64* %_15_size, align 8
  store i64 %15, i64* %lhs_size, align 8
  %16 = load i64*, i64** %_15, align 8
  %17 = load i64, i64* %_15_size, align 8
  %call2 = call i64* @copy(i64* %16, i64 %17)
  store i64* %call2, i64** %lhs, align 8
  store i64 0, i64* %_17, align 8
  %18 = load i64, i64* %lhs_size, align 8
  store i64 %18, i64* %_16_size, align 8
  %19 = load i64*, i64** %lhs, align 8
  %20 = load i64, i64* %lhs_size, align 8
  %call3 = call i64* @copy(i64* %19, i64 %20)
  %21 = load i64, i64* %lhs_size, align 8
  %22 = load i64, i64* %_17, align 8
  %23 = load i64, i64* %pivot, align 8
  %call4 = call i64* @sortV1(i64* %call3, i64 %21, i64 %22, i64 %23)
  store i64* %call4, i64** %_16, align 8
  %24 = load i64, i64* %_16_size, align 8
  store i64 %24, i64* %lhs_size, align 8
  %25 = load i64*, i64** %_16, align 8
  %26 = load i64, i64* %_16_size, align 8
  %call5 = call i64* @copy(i64* %25, i64 %26)
  store i64* %call5, i64** %lhs, align 8
  %27 = load i64*, i64** %items.addr, align 8
  %28 = load i64, i64* %items_size.addr, align 8
  %29 = load i64, i64* %pivot, align 8
  %30 = load i64, i64* %end.addr, align 8
  %call6 = call i64* @slice(i64* %27, i64 %28, i64 %29, i64 %30)
  store i64* %call6, i64** %_18, align 8
  %31 = load i64, i64* %end.addr, align 8
  %32 = load i64, i64* %pivot, align 8
  %sub7 = sub nsw i64 %31, %32
  store i64 %sub7, i64* %_18_size, align 8
  %33 = load i64, i64* %_18_size, align 8
  store i64 %33, i64* %rhs_size, align 8
  %34 = load i64*, i64** %_18, align 8
  %35 = load i64, i64* %_18_size, align 8
  %call8 = call i64* @copy(i64* %34, i64 %35)
  store i64* %call8, i64** %rhs, align 8
  store i64 0, i64* %_20, align 8
  %36 = load i64, i64* %end.addr, align 8
  %37 = load i64, i64* %pivot, align 8
  %sub9 = sub nsw i64 %36, %37
  store i64 %sub9, i64* %_21, align 8
  %38 = load i64, i64* %rhs_size, align 8
  store i64 %38, i64* %_19_size, align 8
  %39 = load i64*, i64** %rhs, align 8
  %40 = load i64, i64* %rhs_size, align 8
  %call10 = call i64* @copy(i64* %39, i64 %40)
  %41 = load i64, i64* %rhs_size, align 8
  %42 = load i64, i64* %_20, align 8
  %43 = load i64, i64* %_21, align 8
  %call11 = call i64* @sortV1(i64* %call10, i64 %41, i64 %42, i64 %43)
  store i64* %call11, i64** %_19, align 8
  %44 = load i64, i64* %_19_size, align 8
  store i64 %44, i64* %rhs_size, align 8
  %45 = load i64*, i64** %_19, align 8
  %46 = load i64, i64* %_19_size, align 8
  %call12 = call i64* @copy(i64* %45, i64 %46)
  store i64* %call12, i64** %rhs, align 8
  store i64 0, i64* %_22, align 8
  %47 = load i64, i64* %_22, align 8
  store i64 %47, i64* %l, align 8
  store i64 0, i64* %_23, align 8
  %48 = load i64, i64* %_23, align 8
  store i64 %48, i64* %r, align 8
  store i64 0, i64* %_24, align 8
  %49 = load i64, i64* %_24, align 8
  store i64 %49, i64* %i, align 8
  br label %while.body

while.body:                                       ; preds = %if.end, %blklab2
  %50 = load i64, i64* %end.addr, align 8
  %51 = load i64, i64* %start.addr, align 8
  %sub13 = sub nsw i64 %50, %51
  store i64 %sub13, i64* %_25, align 8
  %52 = load i64, i64* %i, align 8
  %53 = load i64, i64* %_25, align 8
  %cmp14 = icmp sge i64 %52, %53
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %while.body
  br label %blklab1

if.end16:                                         ; preds = %while.body
  %54 = load i64, i64* %pivot, align 8
  %55 = load i64, i64* %start.addr, align 8
  %sub17 = sub nsw i64 %54, %55
  store i64 %sub17, i64* %_26, align 8
  %56 = load i64, i64* %l, align 8
  %57 = load i64, i64* %_26, align 8
  %cmp18 = icmp sge i64 %56, %57
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  br label %blklab1

if.end20:                                         ; preds = %if.end16
  %58 = load i64, i64* %end.addr, align 8
  %59 = load i64, i64* %pivot, align 8
  %sub21 = sub nsw i64 %58, %59
  store i64 %sub21, i64* %_27, align 8
  %60 = load i64, i64* %r, align 8
  %61 = load i64, i64* %_27, align 8
  %cmp22 = icmp sge i64 %60, %61
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  br label %blklab1

if.end24:                                         ; preds = %if.end20
  %62 = load i64, i64* %l, align 8
  %63 = load i64*, i64** %lhs, align 8
  %arrayidx = getelementptr inbounds i64, i64* %63, i64 %62
  %64 = load i64, i64* %arrayidx, align 8
  store i64 %64, i64* %_28, align 8
  %65 = load i64, i64* %r, align 8
  %66 = load i64*, i64** %rhs, align 8
  %arrayidx25 = getelementptr inbounds i64, i64* %66, i64 %65
  %67 = load i64, i64* %arrayidx25, align 8
  store i64 %67, i64* %_29, align 8
  %68 = load i64, i64* %_28, align 8
  %69 = load i64, i64* %_29, align 8
  %cmp26 = icmp sgt i64 %68, %69
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  br label %blklab3

if.end28:                                         ; preds = %if.end24
  %70 = load i64, i64* %l, align 8
  %71 = load i64*, i64** %lhs, align 8
  %arrayidx29 = getelementptr inbounds i64, i64* %71, i64 %70
  %72 = load i64, i64* %arrayidx29, align 8
  store i64 %72, i64* %_30, align 8
  %73 = load i64, i64* %_30, align 8
  %74 = load i64, i64* %i, align 8
  %75 = load i64*, i64** %items.addr, align 8
  %arrayidx30 = getelementptr inbounds i64, i64* %75, i64 %74
  store i64 %73, i64* %arrayidx30, align 8
  store i64 1, i64* %_31, align 8
  %76 = load i64, i64* %l, align 8
  %77 = load i64, i64* %_31, align 8
  %add31 = add nsw i64 %76, %77
  store i64 %add31, i64* %_32, align 8
  %78 = load i64, i64* %_32, align 8
  store i64 %78, i64* %l, align 8
  br label %blklab4

blklab3:                                          ; preds = %if.then27
  %79 = load i64, i64* %r, align 8
  %80 = load i64*, i64** %rhs, align 8
  %arrayidx32 = getelementptr inbounds i64, i64* %80, i64 %79
  %81 = load i64, i64* %arrayidx32, align 8
  store i64 %81, i64* %_33, align 8
  %82 = load i64, i64* %_33, align 8
  %83 = load i64, i64* %i, align 8
  %84 = load i64*, i64** %items.addr, align 8
  %arrayidx33 = getelementptr inbounds i64, i64* %84, i64 %83
  store i64 %82, i64* %arrayidx33, align 8
  store i64 1, i64* %_34, align 8
  %85 = load i64, i64* %r, align 8
  %86 = load i64, i64* %_34, align 8
  %add34 = add nsw i64 %85, %86
  store i64 %add34, i64* %_35, align 8
  %87 = load i64, i64* %_35, align 8
  store i64 %87, i64* %r, align 8
  br label %blklab4

blklab4:                                          ; preds = %blklab3, %if.end28
  store i64 1, i64* %_36, align 8
  %88 = load i64, i64* %i, align 8
  %89 = load i64, i64* %_36, align 8
  %add35 = add nsw i64 %88, %89
  store i64 %add35, i64* %_37, align 8
  %90 = load i64, i64* %_37, align 8
  store i64 %90, i64* %i, align 8
  br label %blklab2

blklab2:                                          ; preds = %blklab4
  br label %while.body

blklab1:                                          ; preds = %if.then23, %if.then19, %if.then15
  br label %while.body36

while.body36:                                     ; preds = %blklab1, %blklab6
  %91 = load i64, i64* %pivot, align 8
  %92 = load i64, i64* %start.addr, align 8
  %sub37 = sub nsw i64 %91, %92
  store i64 %sub37, i64* %_38, align 8
  %93 = load i64, i64* %l, align 8
  %94 = load i64, i64* %_38, align 8
  %cmp38 = icmp sge i64 %93, %94
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %while.body36
  br label %blklab5

if.end40:                                         ; preds = %while.body36
  %95 = load i64, i64* %l, align 8
  %96 = load i64*, i64** %lhs, align 8
  %arrayidx41 = getelementptr inbounds i64, i64* %96, i64 %95
  %97 = load i64, i64* %arrayidx41, align 8
  store i64 %97, i64* %_39, align 8
  %98 = load i64, i64* %_39, align 8
  %99 = load i64, i64* %i, align 8
  %100 = load i64*, i64** %items.addr, align 8
  %arrayidx42 = getelementptr inbounds i64, i64* %100, i64 %99
  store i64 %98, i64* %arrayidx42, align 8
  store i64 1, i64* %_40, align 8
  %101 = load i64, i64* %i, align 8
  %102 = load i64, i64* %_40, align 8
  %add43 = add nsw i64 %101, %102
  store i64 %add43, i64* %_41, align 8
  %103 = load i64, i64* %_41, align 8
  store i64 %103, i64* %i, align 8
  store i64 1, i64* %_42, align 8
  %104 = load i64, i64* %l, align 8
  %105 = load i64, i64* %_42, align 8
  %add44 = add nsw i64 %104, %105
  store i64 %add44, i64* %_43, align 8
  %106 = load i64, i64* %_43, align 8
  store i64 %106, i64* %l, align 8
  br label %blklab6

blklab6:                                          ; preds = %if.end40
  br label %while.body36

blklab5:                                          ; preds = %if.then39
  br label %while.body45

while.body45:                                     ; preds = %blklab5, %blklab8
  %107 = load i64, i64* %end.addr, align 8
  %108 = load i64, i64* %pivot, align 8
  %sub46 = sub nsw i64 %107, %108
  store i64 %sub46, i64* %_44, align 8
  %109 = load i64, i64* %r, align 8
  %110 = load i64, i64* %_44, align 8
  %cmp47 = icmp sge i64 %109, %110
  br i1 %cmp47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %while.body45
  br label %blklab7

if.end49:                                         ; preds = %while.body45
  %111 = load i64, i64* %r, align 8
  %112 = load i64*, i64** %rhs, align 8
  %arrayidx50 = getelementptr inbounds i64, i64* %112, i64 %111
  %113 = load i64, i64* %arrayidx50, align 8
  store i64 %113, i64* %_45, align 8
  %114 = load i64, i64* %_45, align 8
  %115 = load i64, i64* %i, align 8
  %116 = load i64*, i64** %items.addr, align 8
  %arrayidx51 = getelementptr inbounds i64, i64* %116, i64 %115
  store i64 %114, i64* %arrayidx51, align 8
  store i64 1, i64* %_46, align 8
  %117 = load i64, i64* %i, align 8
  %118 = load i64, i64* %_46, align 8
  %add52 = add nsw i64 %117, %118
  store i64 %add52, i64* %_47, align 8
  %119 = load i64, i64* %_47, align 8
  store i64 %119, i64* %i, align 8
  store i64 1, i64* %_48, align 8
  %120 = load i64, i64* %r, align 8
  %121 = load i64, i64* %_48, align 8
  %add53 = add nsw i64 %120, %121
  store i64 %add53, i64* %_49, align 8
  %122 = load i64, i64* %_49, align 8
  store i64 %122, i64* %r, align 8
  br label %blklab8

blklab8:                                          ; preds = %if.end49
  br label %while.body45

blklab7:                                          ; preds = %if.then48
  br label %blklab0

blklab0:                                          ; preds = %blklab7, %if.then
  %123 = load i64*, i64** %items.addr, align 8
  ret i64* %123
}

declare i64* @slice(i64*, i64, i64, i64) #1

declare i64* @copy(i64*, i64) #1

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
  %_21 = alloca i64, align 8
  %_22 = alloca i64, align 8
  %_23 = alloca i64, align 8
  %_24 = alloca i8*, align 8
  %_26 = alloca i64*, align 8
  %_26_size = alloca i64, align 8
  %_27 = alloca i8*, align 8
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
  store i64 0, i64* %_21, align 8
  store i64 0, i64* %_22, align 8
  store i64 0, i64* %_23, align 8
  store i64* null, i64** %_26, align 8
  store i64 0, i64* %_26_size, align 8
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

while.body:                                       ; preds = %if.end, %blklab11
  %19 = load i64, i64* %index, align 8
  %20 = load i64, i64* %max, align 8
  %cmp7 = icmp sgt i64 %19, %20
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %while.body
  br label %blklab10

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
  br label %blklab11

blklab11:                                         ; preds = %if.end10
  br label %while.body

blklab10:                                         ; preds = %if.then9
  store i64 0, i64* %_17, align 8
  store i64 1, i64* %_18, align 8
  %29 = load i64, i64* %max, align 8
  %30 = load i64, i64* %_18, align 8
  %add14 = add nsw i64 %29, %30
  store i64 %add14, i64* %_19, align 8
  %31 = load i64, i64* %arr_size, align 8
  store i64 %31, i64* %_16_size, align 8
  %32 = load i64*, i64** %arr, align 8
  %33 = load i64, i64* %arr_size, align 8
  %call15 = call i64* @copy(i64* %32, i64 %33)
  %34 = load i64, i64* %arr_size, align 8
  %35 = load i64, i64* %_17, align 8
  %36 = load i64, i64* %_19, align 8
  %call16 = call i64* @sortV1(i64* %call15, i64 %34, i64 %35, i64 %36)
  store i64* %call16, i64** %_16, align 8
  %37 = load i64, i64* %_16_size, align 8
  store i64 %37, i64* %arr_size, align 8
  %38 = load i64*, i64** %_16, align 8
  %39 = load i64, i64* %_16_size, align 8
  %call17 = call i64* @copy(i64* %38, i64 %39)
  store i64* %call17, i64** %arr, align 8
  store i64 0, i64* %_20, align 8
  %40 = load i64, i64* %_20, align 8
  %41 = load i64*, i64** %arr, align 8
  %arrayidx18 = getelementptr inbounds i64, i64* %41, i64 %40
  %42 = load i64, i64* %arrayidx18, align 8
  store i64 %42, i64* %_21, align 8
  store i64 0, i64* %_22, align 8
  %43 = load i64, i64* %_21, align 8
  %44 = load i64, i64* %_22, align 8
  %cmp19 = icmp eq i64 %43, %44
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %blklab10
  br label %blklab12

if.end22:                                         ; preds = %blklab10
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #4
  unreachable

blklab12:                                         ; preds = %if.then21
  %46 = load i64, i64* %max, align 8
  %47 = load i64*, i64** %arr, align 8
  %arrayidx24 = getelementptr inbounds i64, i64* %47, i64 %46
  %48 = load i64, i64* %arrayidx24, align 8
  store i64 %48, i64* %_23, align 8
  %49 = load i64, i64* %_23, align 8
  %50 = load i64, i64* %max, align 8
  %cmp25 = icmp eq i64 %49, %50
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %blklab12
  br label %blklab13

if.end28:                                         ; preds = %blklab12
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #4
  unreachable

blklab13:                                         ; preds = %if.then27
  store i64 38, i64* %_26_size, align 8
  %call30 = call noalias i8* @malloc(i64 304) #5
  %52 = bitcast i8* %call30 to i64*
  store i64* %52, i64** %_26, align 8
  %53 = load i64*, i64** %_26, align 8
  %arrayidx31 = getelementptr inbounds i64, i64* %53, i64 0
  store i64 80, i64* %arrayidx31, align 8
  %54 = load i64*, i64** %_26, align 8
  %arrayidx32 = getelementptr inbounds i64, i64* %54, i64 1
  store i64 97, i64* %arrayidx32, align 8
  %55 = load i64*, i64** %_26, align 8
  %arrayidx33 = getelementptr inbounds i64, i64* %55, i64 2
  store i64 115, i64* %arrayidx33, align 8
  %56 = load i64*, i64** %_26, align 8
  %arrayidx34 = getelementptr inbounds i64, i64* %56, i64 3
  store i64 115, i64* %arrayidx34, align 8
  %57 = load i64*, i64** %_26, align 8
  %arrayidx35 = getelementptr inbounds i64, i64* %57, i64 4
  store i64 32, i64* %arrayidx35, align 8
  %58 = load i64*, i64** %_26, align 8
  %arrayidx36 = getelementptr inbounds i64, i64* %58, i64 5
  store i64 77, i64* %arrayidx36, align 8
  %59 = load i64*, i64** %_26, align 8
  %arrayidx37 = getelementptr inbounds i64, i64* %59, i64 6
  store i64 101, i64* %arrayidx37, align 8
  %60 = load i64*, i64** %_26, align 8
  %arrayidx38 = getelementptr inbounds i64, i64* %60, i64 7
  store i64 114, i64* %arrayidx38, align 8
  %61 = load i64*, i64** %_26, align 8
  %arrayidx39 = getelementptr inbounds i64, i64* %61, i64 8
  store i64 103, i64* %arrayidx39, align 8
  %62 = load i64*, i64** %_26, align 8
  %arrayidx40 = getelementptr inbounds i64, i64* %62, i64 9
  store i64 101, i64* %arrayidx40, align 8
  %63 = load i64*, i64** %_26, align 8
  %arrayidx41 = getelementptr inbounds i64, i64* %63, i64 10
  store i64 83, i64* %arrayidx41, align 8
  %64 = load i64*, i64** %_26, align 8
  %arrayidx42 = getelementptr inbounds i64, i64* %64, i64 11
  store i64 111, i64* %arrayidx42, align 8
  %65 = load i64*, i64** %_26, align 8
  %arrayidx43 = getelementptr inbounds i64, i64* %65, i64 12
  store i64 114, i64* %arrayidx43, align 8
  %66 = load i64*, i64** %_26, align 8
  %arrayidx44 = getelementptr inbounds i64, i64* %66, i64 13
  store i64 116, i64* %arrayidx44, align 8
  %67 = load i64*, i64** %_26, align 8
  %arrayidx45 = getelementptr inbounds i64, i64* %67, i64 14
  store i64 32, i64* %arrayidx45, align 8
  %68 = load i64*, i64** %_26, align 8
  %arrayidx46 = getelementptr inbounds i64, i64* %68, i64 15
  store i64 116, i64* %arrayidx46, align 8
  %69 = load i64*, i64** %_26, align 8
  %arrayidx47 = getelementptr inbounds i64, i64* %69, i64 16
  store i64 101, i64* %arrayidx47, align 8
  %70 = load i64*, i64** %_26, align 8
  %arrayidx48 = getelementptr inbounds i64, i64* %70, i64 17
  store i64 115, i64* %arrayidx48, align 8
  %71 = load i64*, i64** %_26, align 8
  %arrayidx49 = getelementptr inbounds i64, i64* %71, i64 18
  store i64 116, i64* %arrayidx49, align 8
  %72 = load i64*, i64** %_26, align 8
  %arrayidx50 = getelementptr inbounds i64, i64* %72, i64 19
  store i64 32, i64* %arrayidx50, align 8
  %73 = load i64*, i64** %_26, align 8
  %arrayidx51 = getelementptr inbounds i64, i64* %73, i64 20
  store i64 99, i64* %arrayidx51, align 8
  %74 = load i64*, i64** %_26, align 8
  %arrayidx52 = getelementptr inbounds i64, i64* %74, i64 21
  store i64 97, i64* %arrayidx52, align 8
  %75 = load i64*, i64** %_26, align 8
  %arrayidx53 = getelementptr inbounds i64, i64* %75, i64 22
  store i64 115, i64* %arrayidx53, align 8
  %76 = load i64*, i64** %_26, align 8
  %arrayidx54 = getelementptr inbounds i64, i64* %76, i64 23
  store i64 101, i64* %arrayidx54, align 8
  %77 = load i64*, i64** %_26, align 8
  %arrayidx55 = getelementptr inbounds i64, i64* %77, i64 24
  store i64 32, i64* %arrayidx55, align 8
  %78 = load i64*, i64** %_26, align 8
  %arrayidx56 = getelementptr inbounds i64, i64* %78, i64 25
  store i64 119, i64* %arrayidx56, align 8
  %79 = load i64*, i64** %_26, align 8
  %arrayidx57 = getelementptr inbounds i64, i64* %79, i64 26
  store i64 105, i64* %arrayidx57, align 8
  %80 = load i64*, i64** %_26, align 8
  %arrayidx58 = getelementptr inbounds i64, i64* %80, i64 27
  store i64 116, i64* %arrayidx58, align 8
  %81 = load i64*, i64** %_26, align 8
  %arrayidx59 = getelementptr inbounds i64, i64* %81, i64 28
  store i64 104, i64* %arrayidx59, align 8
  %82 = load i64*, i64** %_26, align 8
  %arrayidx60 = getelementptr inbounds i64, i64* %82, i64 29
  store i64 32, i64* %arrayidx60, align 8
  %83 = load i64*, i64** %_26, align 8
  %arrayidx61 = getelementptr inbounds i64, i64* %83, i64 30
  store i64 105, i64* %arrayidx61, align 8
  %84 = load i64*, i64** %_26, align 8
  %arrayidx62 = getelementptr inbounds i64, i64* %84, i64 31
  store i64 110, i64* %arrayidx62, align 8
  %85 = load i64*, i64** %_26, align 8
  %arrayidx63 = getelementptr inbounds i64, i64* %85, i64 32
  store i64 112, i64* %arrayidx63, align 8
  %86 = load i64*, i64** %_26, align 8
  %arrayidx64 = getelementptr inbounds i64, i64* %86, i64 33
  store i64 117, i64* %arrayidx64, align 8
  %87 = load i64*, i64** %_26, align 8
  %arrayidx65 = getelementptr inbounds i64, i64* %87, i64 34
  store i64 116, i64* %arrayidx65, align 8
  %88 = load i64*, i64** %_26, align 8
  %arrayidx66 = getelementptr inbounds i64, i64* %88, i64 35
  store i64 32, i64* %arrayidx66, align 8
  %89 = load i64*, i64** %_26, align 8
  %arrayidx67 = getelementptr inbounds i64, i64* %89, i64 36
  store i64 61, i64* %arrayidx67, align 8
  %90 = load i64*, i64** %_26, align 8
  %arrayidx68 = getelementptr inbounds i64, i64* %90, i64 37
  store i64 32, i64* %arrayidx68, align 8
  %91 = load i64*, i64** %_26, align 8
  %92 = load i64, i64* %_26_size, align 8
  call void @printf_s(i64* %91, i64 %92)
  %93 = load i64, i64* %max, align 8
  %call69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i64 %93)
  br label %blklab9

blklab9:                                          ; preds = %blklab13, %if.then
  call void @exit(i32 0) #4
  unreachable

return:                                           ; No predecessors!
  %94 = load i32, i32* %retval, align 4
  ret i32 %94
}

declare i64** @convertArgsToIntArray(i32, i8**) #1

declare i64 @parseStringToInt(i64*) #1

declare i64* @gen1DArray(i32, i32) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

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

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 1f64ddbc4c5d1036b68ec896765a7535537ded85) (http://llvm.org/git/llvm.git f87dc438fd28550abfe9692daa50aaa331e7cf1a)"}
