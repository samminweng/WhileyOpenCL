; ModuleID = 'llvm/MatrixMult.preopt.ll.tmp'
source_filename = "MatrixMult.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Matrix = type { i64*, i64, i64, i64 }

@.str = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c" data:\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c" width:\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c" height:\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [5 x i8] c"fail\00", align 1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @copy_Matrix(%struct.Matrix* %_Matrix) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 32) #4
  %0 = bitcast i8* %call to %struct.Matrix*
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 1
  %1 = load i64, i64* %data_size, align 8
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8
  %2 = bitcast i8* %data_size1 to i64*
  store i64 %1, i64* %2, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 0
  %3 = load i64*, i64** %data, align 8
  %data_size2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 1
  %4 = load i64, i64* %data_size2, align 8
  %call3 = tail call i64* @copy(i64* %3, i64 %4) #4
  %data4 = bitcast i8* %call to i64**
  store i64* %call3, i64** %data4, align 8
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 2
  %5 = load i64, i64* %width, align 8
  %width5 = getelementptr inbounds i8, i8* %call, i64 16
  %6 = bitcast i8* %width5 to i64*
  store i64 %5, i64* %6, align 8
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 3
  %7 = load i64, i64* %height, align 8
  %height6 = getelementptr inbounds i8, i8* %call, i64 24
  %8 = bitcast i8* %height6 to i64*
  store i64 %7, i64* %8, align 8
  ret %struct.Matrix* %0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i64* @copy(i64*, i64) #2

; Function Attrs: nounwind uwtable
define %struct.Matrix** @copy_array_Matrix(%struct.Matrix** %_Matrix, i64 %_Matrix_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %mul = shl i64 %_Matrix_size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #4
  %0 = bitcast i8* %call to %struct.Matrix**
  %cmp1 = icmp sgt i64 %_Matrix_size, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry.split
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds %struct.Matrix*, %struct.Matrix** %_Matrix, i64 %indvars.iv
  %1 = load %struct.Matrix*, %struct.Matrix** %arrayidx, align 8
  %call2 = tail call %struct.Matrix* @copy_Matrix(%struct.Matrix* %1)
  %arrayidx4 = getelementptr inbounds %struct.Matrix*, %struct.Matrix** %0, i64 %indvars.iv
  store %struct.Matrix* %call2, %struct.Matrix** %arrayidx4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %_Matrix_size
  br i1 %exitcond, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry.split
  ret %struct.Matrix** %0
}

; Function Attrs: nounwind uwtable
define void @free_Matrix(%struct.Matrix* %matrix) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = bitcast %struct.Matrix* %matrix to i8**
  %1 = load i8*, i8** %0, align 8
  tail call void @free(i8* %1) #4
  %2 = bitcast %struct.Matrix* %matrix to i8*
  tail call void @free(i8* %2) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @printf_Matrix(%struct.Matrix* %matrix) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %putchar = tail call i32 @putchar(i32 123) #4
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #4
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 0
  %0 = load i64*, i64** %data, align 8
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 1
  %1 = load i64, i64* %data_size, align 8
  tail call void @printf1DArray(i64* %0, i64 %1) #4
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0)) #4
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 2
  %2 = load i64, i64* %width, align 8
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %2) #4
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0)) #4
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 3
  %3 = load i64, i64* %height, align 8
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %3) #4
  %putchar1 = tail call i32 @putchar(i32 125) #4
  ret void
}

declare i32 @printf(i8*, ...) #2

declare void @printf1DArray(i64*, i64) #2

; Function Attrs: nounwind uwtable
define %struct.Matrix* @matrix(i64 %width, i64 %height, i64* %data, i64 %data_size, i1 zeroext %data_has_ownership) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 32) #4
  %0 = bitcast i8* %call to %struct.Matrix*
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8
  %1 = bitcast i8* %data_size1 to i64*
  store i64 %data_size, i64* %1, align 8
  %call2 = tail call i64* @copy(i64* %data, i64 %data_size) #4
  %data3 = bitcast i8* %call to i64**
  store i64* %call2, i64** %data3, align 8
  %height4 = getelementptr inbounds i8, i8* %call, i64 24
  %2 = bitcast i8* %height4 to i64*
  store i64 %height, i64* %2, align 8
  %width5 = getelementptr inbounds i8, i8* %call, i64 16
  %3 = bitcast i8* %width5 to i64*
  store i64 %width, i64* %3, align 8
  br i1 %data_has_ownership, label %if.then7, label %if.end11

if.then7:                                         ; preds = %entry.split
  %4 = bitcast i64* %data to i8*
  tail call void @free(i8* %4) #4
  br label %if.end11

if.end11:                                         ; preds = %entry.split, %if.then7
  ret %struct.Matrix* %0
}

; Function Attrs: nounwind uwtable
define %struct.Matrix* @init(i64 %width, i64 %height) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %mul = mul nsw i64 %height, %width
  %conv1 = trunc i64 %mul to i32
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #4
  %cmp3 = icmp sgt i64 %height, 0
  br i1 %cmp3, label %while.body9.preheader.lr.ph, label %if.end23

while.body9.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body9.preheader

while.body9.preheader:                            ; preds = %while.body9.preheader.lr.ph, %blklab3
  %i.04 = phi i64 [ 0, %while.body9.preheader.lr.ph ], [ %add20, %blklab3 ]
  %cmp101 = icmp sgt i64 %width, 0
  br i1 %cmp101, label %if.end13.lr.ph, label %blklab3

if.end13.lr.ph:                                   ; preds = %while.body9.preheader
  br label %if.end13

if.end13:                                         ; preds = %if.end13.lr.ph, %if.end13
  %j.02 = phi i64 [ 0, %if.end13.lr.ph ], [ %add19, %if.end13 ]
  %mul14 = mul nsw i64 %i.04, %width
  %add = add nsw i64 %j.02, %mul14
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %add
  %0 = load i64, i64* %arrayidx, align 8
  %add15 = add nsw i64 %0, %i.04
  %mul16 = mul nsw i64 %i.04, %width
  %add17 = add nsw i64 %j.02, %mul16
  %arrayidx18 = getelementptr inbounds i64, i64* %call, i64 %add17
  store i64 %add15, i64* %arrayidx18, align 8
  %add19 = add nuw nsw i64 %j.02, 1
  %exitcond = icmp ne i64 %add19, %width
  br i1 %exitcond, label %if.end13, label %while.body9.blklab3_crit_edge

while.body9.blklab3_crit_edge:                    ; preds = %if.end13
  br label %blklab3

blklab3:                                          ; preds = %while.body9.blklab3_crit_edge, %while.body9.preheader
  %add20 = add nuw nsw i64 %i.04, 1
  %exitcond6 = icmp ne i64 %add20, %height
  br i1 %exitcond6, label %while.body9.preheader, label %while.body.if.end23_crit_edge

while.body.if.end23_crit_edge:                    ; preds = %blklab3
  br label %if.end23

if.end23:                                         ; preds = %while.body.if.end23_crit_edge, %entry.split
  %call24 = tail call %struct.Matrix* @matrix(i64 %width, i64 %height, i64* %call, i64 %mul, i1 zeroext false)
  %1 = bitcast i64* %call to i8*
  tail call void @free(i8* %1) #4
  ret %struct.Matrix* %call24
}

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind uwtable
define void @print_mat(%struct._IO_FILE* %sys, %struct.Matrix* %a, i1 zeroext %a_has_ownership) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2
  %0 = load i64, i64* %width1, align 8
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height2, align 8
  %cmp12 = icmp sgt i64 %1, 0
  br i1 %cmp12, label %while.body4.preheader.lr.ph, label %blklab6

while.body4.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body4.preheader

while.body4.preheader:                            ; preds = %while.body4.preheader.lr.ph, %if.end21
  %_25_has_ownership.019 = phi i1 [ false, %while.body4.preheader.lr.ph ], [ true, %if.end21 ]
  %i.017 = phi i64 [ 0, %while.body4.preheader.lr.ph ], [ %add18, %if.end21 ]
  %_25.016 = phi i8* [ undef, %while.body4.preheader.lr.ph ], [ %call22, %if.end21 ]
  %_12.015 = phi i64* [ null, %while.body4.preheader.lr.ph ], [ %_12.1.lcssa, %if.end21 ]
  %_12_has_ownership.014 = phi i8 [ 0, %while.body4.preheader.lr.ph ], [ %_12_has_ownership.1.lcssa, %if.end21 ]
  %2 = phi i8* [ null, %while.body4.preheader.lr.ph ], [ %.lcssa1, %if.end21 ]
  %3 = phi i8* [ null, %while.body4.preheader.lr.ph ], [ %.lcssa, %if.end21 ]
  %_18_has_ownership.013 = phi i8 [ 0, %while.body4.preheader.lr.ph ], [ %_18_has_ownership.1.lcssa, %if.end21 ]
  %cmp53 = icmp sgt i64 %0, 0
  br i1 %cmp53, label %if.end7.lr.ph, label %blklab8

if.end7.lr.ph:                                    ; preds = %while.body4.preheader
  br label %if.end7

if.end7:                                          ; preds = %if.end7.lr.ph, %if.end14
  %j.07 = phi i64 [ 0, %if.end7.lr.ph ], [ %add17, %if.end14 ]
  %_12.16 = phi i64* [ %_12.015, %if.end7.lr.ph ], [ %call, %if.end14 ]
  %_12_has_ownership.15 = phi i8 [ %_12_has_ownership.014, %if.end7.lr.ph ], [ 1, %if.end14 ]
  %4 = phi i8* [ %3, %if.end7.lr.ph ], [ %call15, %if.end14 ]
  %_18_has_ownership.14 = phi i8 [ %_18_has_ownership.013, %if.end7.lr.ph ], [ 1, %if.end14 ]
  %5 = and i8 %_12_has_ownership.15, 1
  %tobool = icmp eq i8 %5, 0
  br i1 %tobool, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end7
  %6 = bitcast i64* %_12.16 to i8*
  tail call void @free(i8* %6) #4
  br label %if.end9

if.end9:                                          ; preds = %if.end7, %if.then8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %7 = load i64*, i64** %data, align 8
  %data_size10 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1
  %8 = load i64, i64* %data_size10, align 8
  %call = tail call i64* @copy(i64* %7, i64 %8) #4
  %mul = mul nsw i64 %i.017, %0
  %add = add nsw i64 %j.07, %mul
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %add
  %9 = load i64, i64* %arrayidx, align 8
  %call11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %9) #4
  %10 = and i8 %_18_has_ownership.14, 1
  %tobool12 = icmp eq i8 %10, 0
  br i1 %tobool12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.end9
  tail call void @free(i8* %4) #4
  br label %if.end14

if.end14:                                         ; preds = %if.end9, %if.then13
  %call15 = tail call noalias i8* @malloc(i64 8) #4
  %11 = bitcast i8* %call15 to i64*
  store i64 32, i64* %11, align 8
  tail call void @printf_s(i64* %11, i64 1) #4
  %add17 = add nuw nsw i64 %j.07, 1
  %exitcond = icmp ne i64 %add17, %0
  br i1 %exitcond, label %if.end7, label %while.body4.blklab8_crit_edge

while.body4.blklab8_crit_edge:                    ; preds = %if.end14
  %call15.lcssa = phi i8* [ %call15, %if.end14 ]
  %call.lcssa = phi i64* [ %call, %if.end14 ]
  br label %blklab8

blklab8:                                          ; preds = %while.body4.blklab8_crit_edge, %while.body4.preheader
  %_12.1.lcssa = phi i64* [ %call.lcssa, %while.body4.blklab8_crit_edge ], [ %_12.015, %while.body4.preheader ]
  %_12_has_ownership.1.lcssa = phi i8 [ 1, %while.body4.blklab8_crit_edge ], [ %_12_has_ownership.014, %while.body4.preheader ]
  %.lcssa1 = phi i8* [ %call15.lcssa, %while.body4.blklab8_crit_edge ], [ %2, %while.body4.preheader ]
  %.lcssa = phi i8* [ %call15.lcssa, %while.body4.blklab8_crit_edge ], [ %3, %while.body4.preheader ]
  %_18_has_ownership.1.lcssa = phi i8 [ 1, %while.body4.blklab8_crit_edge ], [ %_18_has_ownership.013, %while.body4.preheader ]
  %add18 = add nuw nsw i64 %i.017, 1
  br i1 %_25_has_ownership.019, label %if.then20, label %if.end21

if.then20:                                        ; preds = %blklab8
  tail call void @free(i8* %_25.016) #4
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %blklab8
  %call22 = tail call noalias i8* @malloc(i64 0) #4
  %12 = bitcast i8* %call22 to i64*
  tail call void @println_s(i64* %12, i64 0) #4
  %exitcond26 = icmp ne i64 %add18, %1
  br i1 %exitcond26, label %while.body4.preheader, label %while.body.blklab6_crit_edge

while.body.blklab6_crit_edge:                     ; preds = %if.end21
  %call22.lcssa = phi i8* [ %call22, %if.end21 ]
  %_18_has_ownership.1.lcssa.lcssa = phi i8 [ %_18_has_ownership.1.lcssa, %if.end21 ]
  %.lcssa1.lcssa = phi i8* [ %.lcssa1, %if.end21 ]
  %_12_has_ownership.1.lcssa.lcssa = phi i8 [ %_12_has_ownership.1.lcssa, %if.end21 ]
  %_12.1.lcssa.lcssa = phi i64* [ %_12.1.lcssa, %if.end21 ]
  br label %blklab6

blklab6:                                          ; preds = %while.body.blklab6_crit_edge, %entry.split
  %_25_has_ownership.0.lcssa = phi i1 [ true, %while.body.blklab6_crit_edge ], [ false, %entry.split ]
  %_25.0.lcssa = phi i8* [ %call22.lcssa, %while.body.blklab6_crit_edge ], [ undef, %entry.split ]
  %_12.0.lcssa = phi i64* [ %_12.1.lcssa.lcssa, %while.body.blklab6_crit_edge ], [ null, %entry.split ]
  %_12_has_ownership.0.lcssa = phi i8 [ %_12_has_ownership.1.lcssa.lcssa, %while.body.blklab6_crit_edge ], [ 0, %entry.split ]
  %.lcssa2 = phi i8* [ %.lcssa1.lcssa, %while.body.blklab6_crit_edge ], [ null, %entry.split ]
  %_18_has_ownership.0.lcssa = phi i8 [ %_18_has_ownership.1.lcssa.lcssa, %while.body.blklab6_crit_edge ], [ 0, %entry.split ]
  br i1 %a_has_ownership, label %if.then24, label %if.end25

if.then24:                                        ; preds = %blklab6
  tail call void @free_Matrix(%struct.Matrix* %a)
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %blklab6
  %13 = and i8 %_12_has_ownership.0.lcssa, 1
  %tobool26 = icmp eq i8 %13, 0
  br i1 %tobool26, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end25
  %14 = bitcast i64* %_12.0.lcssa to i8*
  tail call void @free(i8* %14) #4
  br label %if.end28

if.end28:                                         ; preds = %if.end25, %if.then27
  %15 = and i8 %_18_has_ownership.0.lcssa, 1
  %tobool29 = icmp eq i8 %15, 0
  br i1 %tobool29, label %if.end31, label %if.then30

if.then30:                                        ; preds = %if.end28
  tail call void @free(i8* %.lcssa2) #4
  br label %if.end31

if.end31:                                         ; preds = %if.end28, %if.then30
  br i1 %_25_has_ownership.0.lcssa, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end31
  tail call void @free(i8* %_25.0.lcssa) #4
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.end31
  ret void
}

declare void @printf_s(i64*, i64) #2

declare void @println_s(i64*, i64) #2

; Function Attrs: nounwind uwtable
define %struct.Matrix* @mat_mult(%struct.Matrix* %a, i1 zeroext %a_has_ownership, %struct.Matrix* %b, i1 zeroext %b_has_ownership) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 2
  %0 = load i64, i64* %width2, align 8
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height3, align 8
  %mul = mul nsw i64 %1, %0
  %conv4 = trunc i64 %mul to i32
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv4) #4
  %data12 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %2 = load i64*, i64** %data12, align 8
  %data_size13 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1
  %3 = load i64, i64* %data_size13, align 8
  %call14 = tail call i64* @copy(i64* %2, i64 %3) #4
  %data22 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0
  %4 = load i64*, i64** %data22, align 8
  %data_size23 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1
  %5 = load i64, i64* %data_size23, align 8
  %call24 = tail call i64* @copy(i64* %4, i64 %5) #4
  %mul28 = mul nsw i64 %1, %0
  %conv33 = trunc i64 %mul28 to i32
  %call34 = tail call i64* @gen1DArray(i32 0, i32 %conv33) #4
  %cmp11 = icmp sgt i64 %1, 0
  br i1 %cmp11, label %while.body42.preheader.lr.ph, label %while.body53.preheader

while.body42.preheader.lr.ph:                     ; preds = %entry.split
  br label %while.body42.preheader

while.body42.preheader:                           ; preds = %while.body42.preheader.lr.ph, %blklab14
  %i.012 = phi i64 [ 0, %while.body42.preheader.lr.ph ], [ %add52, %blklab14 ]
  %cmp439 = icmp sgt i64 %0, 0
  br i1 %cmp439, label %if.end46.lr.ph, label %blklab14

if.end46.lr.ph:                                   ; preds = %while.body42.preheader
  br label %if.end46

while.body.while.body53.preheader_crit_edge:      ; preds = %blklab14
  br label %while.body53.preheader

while.body53.preheader:                           ; preds = %while.body.while.body53.preheader_crit_edge, %entry.split
  %cmp546 = icmp sgt i64 %1, 0
  br i1 %cmp546, label %while.body59.preheader.lr.ph, label %if.end89

while.body59.preheader.lr.ph:                     ; preds = %while.body53.preheader
  br label %while.body59.preheader

if.end46:                                         ; preds = %if.end46.lr.ph, %if.end46
  %j.010 = phi i64 [ 0, %if.end46.lr.ph ], [ %add51, %if.end46 ]
  %mul47 = mul nsw i64 %i.012, %0
  %add = add nsw i64 %j.010, %mul47
  %arrayidx = getelementptr inbounds i64, i64* %call24, i64 %add
  %6 = load i64, i64* %arrayidx, align 8
  %mul48 = mul nsw i64 %j.010, %0
  %add49 = add nsw i64 %mul48, %i.012
  %arrayidx50 = getelementptr inbounds i64, i64* %call34, i64 %add49
  store i64 %6, i64* %arrayidx50, align 8
  %add51 = add nuw nsw i64 %j.010, 1
  %exitcond16 = icmp ne i64 %add51, %0
  br i1 %exitcond16, label %if.end46, label %while.body42.blklab14_crit_edge

while.body42.blklab14_crit_edge:                  ; preds = %if.end46
  br label %blklab14

blklab14:                                         ; preds = %while.body42.blklab14_crit_edge, %while.body42.preheader
  %add52 = add nuw nsw i64 %i.012, 1
  %exitcond17 = icmp ne i64 %add52, %1
  br i1 %exitcond17, label %while.body42.preheader, label %while.body.while.body53.preheader_crit_edge

while.body59.preheader:                           ; preds = %while.body59.preheader.lr.ph, %blklab18
  %i.17 = phi i64 [ 0, %while.body59.preheader.lr.ph ], [ %add86, %blklab18 ]
  %cmp603 = icmp sgt i64 %0, 0
  br i1 %cmp603, label %while.body65.preheader.lr.ph, label %blklab18

while.body65.preheader.lr.ph:                     ; preds = %while.body59.preheader
  br label %while.body65.preheader

while.body65.preheader:                           ; preds = %while.body65.preheader.lr.ph, %blklab20
  %j.14 = phi i64 [ 0, %while.body65.preheader.lr.ph ], [ %add85, %blklab20 ]
  %cmp661 = icmp sgt i64 %0, 0
  br i1 %cmp661, label %if.end69.lr.ph, label %blklab20

if.end69.lr.ph:                                   ; preds = %while.body65.preheader
  br label %if.end69

if.end69:                                         ; preds = %if.end69.lr.ph, %if.end69
  %k.02 = phi i64 [ 0, %if.end69.lr.ph ], [ %add84, %if.end69 ]
  %mul70 = mul nsw i64 %i.17, %0
  %add71 = add nsw i64 %j.14, %mul70
  %arrayidx72 = getelementptr inbounds i64, i64* %call, i64 %add71
  %7 = load i64, i64* %arrayidx72, align 8
  %mul73 = mul nsw i64 %i.17, %0
  %add74 = add nsw i64 %k.02, %mul73
  %arrayidx75 = getelementptr inbounds i64, i64* %call14, i64 %add74
  %8 = load i64, i64* %arrayidx75, align 8
  %mul76 = mul nsw i64 %i.17, %0
  %add77 = add nsw i64 %k.02, %mul76
  %arrayidx78 = getelementptr inbounds i64, i64* %call34, i64 %add77
  %9 = load i64, i64* %arrayidx78, align 8
  %mul79 = mul nsw i64 %9, %8
  %add80 = add nsw i64 %mul79, %7
  %mul81 = mul nsw i64 %i.17, %0
  %add82 = add nsw i64 %j.14, %mul81
  %arrayidx83 = getelementptr inbounds i64, i64* %call, i64 %add82
  store i64 %add80, i64* %arrayidx83, align 8
  %add84 = add nuw nsw i64 %k.02, 1
  %exitcond = icmp ne i64 %add84, %0
  br i1 %exitcond, label %if.end69, label %while.body65.blklab20_crit_edge

while.body65.blklab20_crit_edge:                  ; preds = %if.end69
  br label %blklab20

blklab20:                                         ; preds = %while.body65.blklab20_crit_edge, %while.body65.preheader
  %add85 = add nuw nsw i64 %j.14, 1
  %exitcond14 = icmp ne i64 %add85, %0
  br i1 %exitcond14, label %while.body65.preheader, label %while.body59.blklab18_crit_edge

while.body59.blklab18_crit_edge:                  ; preds = %blklab20
  br label %blklab18

blklab18:                                         ; preds = %while.body59.blklab18_crit_edge, %while.body59.preheader
  %add86 = add nuw nsw i64 %i.17, 1
  %exitcond15 = icmp ne i64 %add86, %1
  br i1 %exitcond15, label %while.body59.preheader, label %while.body53.if.end89_crit_edge

while.body53.if.end89_crit_edge:                  ; preds = %blklab18
  br label %if.end89

if.end89:                                         ; preds = %while.body53.if.end89_crit_edge, %while.body53.preheader
  %call90 = tail call %struct.Matrix* @matrix(i64 %0, i64 %1, i64* %call, i64 %mul, i1 zeroext false)
  br i1 %a_has_ownership, label %if.then92, label %if.end93

if.then92:                                        ; preds = %if.end89
  tail call void @free_Matrix(%struct.Matrix* %a)
  br label %if.end93

if.end93:                                         ; preds = %if.then92, %if.end89
  br i1 %b_has_ownership, label %if.then95, label %if.then101

if.then95:                                        ; preds = %if.end93
  tail call void @free_Matrix(%struct.Matrix* %b)
  br label %if.then101

if.then101:                                       ; preds = %if.then95, %if.end93
  %10 = bitcast i64* %call to i8*
  tail call void @free(i8* %10) #4
  %11 = bitcast i64* %call14 to i8*
  tail call void @free(i8* %11) #4
  %12 = bitcast i64* %call24 to i8*
  tail call void @free(i8* %12) #4
  %13 = bitcast i64* %call34 to i8*
  tail call void @free(i8* %13) #4
  ret %struct.Matrix* %call90
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
  br i1 %cmp, label %blklab23, label %if.end

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8
  %call5 = tail call noalias i8* @malloc(i64 56) #4
  %2 = bitcast i8* %call5 to i64*
  store i64 115, i64* %2, align 8
  %arrayidx7 = getelementptr inbounds i8, i8* %call5, i64 8
  %3 = bitcast i8* %arrayidx7 to i64*
  store i64 105, i64* %3, align 8
  %arrayidx8 = getelementptr inbounds i8, i8* %call5, i64 16
  %4 = bitcast i8* %arrayidx8 to i64*
  store i64 122, i64* %4, align 8
  %arrayidx9 = getelementptr inbounds i8, i8* %call5, i64 24
  %5 = bitcast i8* %arrayidx9 to i64*
  store i64 101, i64* %5, align 8
  %arrayidx10 = getelementptr inbounds i8, i8* %call5, i64 32
  %6 = bitcast i8* %arrayidx10 to i64*
  store i64 32, i64* %6, align 8
  %arrayidx11 = getelementptr inbounds i8, i8* %call5, i64 40
  %7 = bitcast i8* %arrayidx11 to i64*
  store i64 61, i64* %7, align 8
  %arrayidx12 = getelementptr inbounds i8, i8* %call5, i64 48
  %8 = bitcast i8* %arrayidx12 to i64*
  store i64 32, i64* %8, align 8
  tail call void @printf_s(i64* %2, i64 7) #4
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1) #4
  %call17 = tail call %struct.Matrix* @init(i64 %1, i64 %1)
  %call24 = tail call %struct.Matrix* @init(i64 %1, i64 %1)
  %call31 = tail call %struct.Matrix* @mat_mult(%struct.Matrix* %call17, i1 zeroext false, %struct.Matrix* %call24, i1 zeroext false)
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call17, i64 0, i32 0
  %9 = load i64*, i64** %data, align 8
  %data_size38 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call17, i64 0, i32 1
  %10 = load i64, i64* %data_size38, align 8
  %call39 = tail call i64* @copy(i64* %9, i64 %10) #4
  %add = mul i64 %1, %1
  %sub41 = add nsw i64 %add, -1
  %arrayidx42 = getelementptr inbounds i64, i64* %call39, i64 %sub41
  %11 = load i64, i64* %arrayidx42, align 8
  %sub43 = add nsw i64 %1, -1
  %cmp44 = icmp eq i64 %11, %sub43
  br i1 %cmp44, label %if.end51, label %if.end47

if.end47:                                         ; preds = %if.end
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %12) #5
  tail call void @exit(i32 -1) #6
  unreachable

if.end51:                                         ; preds = %if.end
  %data53 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call24, i64 0, i32 0
  %14 = load i64*, i64** %data53, align 8
  %data_size54 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call24, i64 0, i32 1
  %15 = load i64, i64* %data_size54, align 8
  %call55 = tail call i64* @copy(i64* %14, i64 %15) #4
  %add58 = mul i64 %1, %1
  %sub59 = add nsw i64 %add58, -1
  %arrayidx60 = getelementptr inbounds i64, i64* %call55, i64 %sub59
  %16 = load i64, i64* %arrayidx60, align 8
  %sub61 = add nsw i64 %1, -1
  %cmp62 = icmp eq i64 %16, %sub61
  br i1 %cmp62, label %blklab25, label %if.end65

if.end65:                                         ; preds = %if.end51
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %17) #5
  tail call void @exit(i32 -1) #6
  unreachable

blklab25:                                         ; preds = %if.end51
  %cmp67 = icmp eq i64 %1, 2000
  br i1 %cmp67, label %if.end73, label %if.end90

if.end73:                                         ; preds = %blklab25
  %data75 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 0
  %19 = load i64*, i64** %data75, align 8
  %data_size76 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 1
  %20 = load i64, i64* %data_size76, align 8
  %call77 = tail call i64* @copy(i64* %19, i64 %20) #4
  %add80 = mul i64 %1, %1
  %sub81 = add nsw i64 %add80, -1
  %arrayidx82 = getelementptr inbounds i64, i64* %call77, i64 %sub81
  %21 = load i64, i64* %arrayidx82, align 8
  %cmp83 = icmp eq i64 %21, 3996001000
  br i1 %cmp83, label %if.end90, label %if.end86

if.end86:                                         ; preds = %if.end73
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %22) #5
  tail call void @exit(i32 -1) #6
  unreachable

if.end90:                                         ; preds = %blklab25, %if.end73
  %_39_has_ownership.0 = phi i8 [ 0, %blklab25 ], [ 1, %if.end73 ]
  %_39.0 = phi i64* [ null, %blklab25 ], [ %call77, %if.end73 ]
  %call91 = tail call noalias i8* @malloc(i64 216) #4
  %24 = bitcast i8* %call91 to i64*
  store i64 77, i64* %24, align 8
  %arrayidx93 = getelementptr inbounds i8, i8* %call91, i64 8
  %25 = bitcast i8* %arrayidx93 to i64*
  store i64 97, i64* %25, align 8
  %arrayidx94 = getelementptr inbounds i8, i8* %call91, i64 16
  %26 = bitcast i8* %arrayidx94 to i64*
  store i64 116, i64* %26, align 8
  %arrayidx95 = getelementptr inbounds i8, i8* %call91, i64 24
  %27 = bitcast i8* %arrayidx95 to i64*
  store i64 114, i64* %27, align 8
  %arrayidx96 = getelementptr inbounds i8, i8* %call91, i64 32
  %28 = bitcast i8* %arrayidx96 to i64*
  store i64 105, i64* %28, align 8
  %arrayidx97 = getelementptr inbounds i8, i8* %call91, i64 40
  %29 = bitcast i8* %arrayidx97 to i64*
  store i64 120, i64* %29, align 8
  %arrayidx98 = getelementptr inbounds i8, i8* %call91, i64 48
  %30 = bitcast i8* %arrayidx98 to i64*
  store i64 32, i64* %30, align 8
  %arrayidx99 = getelementptr inbounds i8, i8* %call91, i64 56
  %31 = bitcast i8* %arrayidx99 to i64*
  store i64 67, i64* %31, align 8
  %arrayidx100 = getelementptr inbounds i8, i8* %call91, i64 64
  %32 = bitcast i8* %arrayidx100 to i64*
  store i64 91, i64* %32, align 8
  %arrayidx101 = getelementptr inbounds i8, i8* %call91, i64 72
  %33 = bitcast i8* %arrayidx101 to i64*
  store i64 115, i64* %33, align 8
  %arrayidx102 = getelementptr inbounds i8, i8* %call91, i64 80
  %34 = bitcast i8* %arrayidx102 to i64*
  store i64 105, i64* %34, align 8
  %arrayidx103 = getelementptr inbounds i8, i8* %call91, i64 88
  %35 = bitcast i8* %arrayidx103 to i64*
  store i64 122, i64* %35, align 8
  %arrayidx104 = getelementptr inbounds i8, i8* %call91, i64 96
  %36 = bitcast i8* %arrayidx104 to i64*
  store i64 101, i64* %36, align 8
  %arrayidx105 = getelementptr inbounds i8, i8* %call91, i64 104
  %37 = bitcast i8* %arrayidx105 to i64*
  store i64 45, i64* %37, align 8
  %arrayidx106 = getelementptr inbounds i8, i8* %call91, i64 112
  %38 = bitcast i8* %arrayidx106 to i64*
  store i64 49, i64* %38, align 8
  %arrayidx107 = getelementptr inbounds i8, i8* %call91, i64 120
  %39 = bitcast i8* %arrayidx107 to i64*
  store i64 93, i64* %39, align 8
  %arrayidx108 = getelementptr inbounds i8, i8* %call91, i64 128
  %40 = bitcast i8* %arrayidx108 to i64*
  store i64 91, i64* %40, align 8
  %arrayidx109 = getelementptr inbounds i8, i8* %call91, i64 136
  %41 = bitcast i8* %arrayidx109 to i64*
  store i64 115, i64* %41, align 8
  %arrayidx110 = getelementptr inbounds i8, i8* %call91, i64 144
  %42 = bitcast i8* %arrayidx110 to i64*
  store i64 105, i64* %42, align 8
  %arrayidx111 = getelementptr inbounds i8, i8* %call91, i64 152
  %43 = bitcast i8* %arrayidx111 to i64*
  store i64 122, i64* %43, align 8
  %arrayidx112 = getelementptr inbounds i8, i8* %call91, i64 160
  %44 = bitcast i8* %arrayidx112 to i64*
  store i64 101, i64* %44, align 8
  %arrayidx113 = getelementptr inbounds i8, i8* %call91, i64 168
  %45 = bitcast i8* %arrayidx113 to i64*
  store i64 45, i64* %45, align 8
  %arrayidx114 = getelementptr inbounds i8, i8* %call91, i64 176
  %46 = bitcast i8* %arrayidx114 to i64*
  store i64 49, i64* %46, align 8
  %arrayidx115 = getelementptr inbounds i8, i8* %call91, i64 184
  %47 = bitcast i8* %arrayidx115 to i64*
  store i64 93, i64* %47, align 8
  %arrayidx116 = getelementptr inbounds i8, i8* %call91, i64 192
  %48 = bitcast i8* %arrayidx116 to i64*
  store i64 32, i64* %48, align 8
  %arrayidx117 = getelementptr inbounds i8, i8* %call91, i64 200
  %49 = bitcast i8* %arrayidx117 to i64*
  store i64 61, i64* %49, align 8
  %arrayidx118 = getelementptr inbounds i8, i8* %call91, i64 208
  %50 = bitcast i8* %arrayidx118 to i64*
  store i64 32, i64* %50, align 8
  tail call void @printf_s(i64* %24, i64 27) #4
  %data123 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 0
  %51 = load i64*, i64** %data123, align 8
  %data_size124 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 1
  %52 = load i64, i64* %data_size124, align 8
  %call125 = tail call i64* @copy(i64* %51, i64 %52) #4
  %add128 = mul i64 %1, %1
  %sub129 = add nsw i64 %add128, -1
  %arrayidx130 = getelementptr inbounds i64, i64* %call125, i64 %sub129
  %53 = load i64, i64* %arrayidx130, align 8
  %call131 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %53) #4
  %call135 = tail call noalias i8* @malloc(i64 200) #4
  %54 = bitcast i8* %call135 to i64*
  store i64 80, i64* %54, align 8
  %arrayidx137 = getelementptr inbounds i8, i8* %call135, i64 8
  %55 = bitcast i8* %arrayidx137 to i64*
  store i64 97, i64* %55, align 8
  %arrayidx138 = getelementptr inbounds i8, i8* %call135, i64 16
  %56 = bitcast i8* %arrayidx138 to i64*
  store i64 115, i64* %56, align 8
  %arrayidx139 = getelementptr inbounds i8, i8* %call135, i64 24
  %57 = bitcast i8* %arrayidx139 to i64*
  store i64 115, i64* %57, align 8
  %arrayidx140 = getelementptr inbounds i8, i8* %call135, i64 32
  %58 = bitcast i8* %arrayidx140 to i64*
  store i64 32, i64* %58, align 8
  %arrayidx141 = getelementptr inbounds i8, i8* %call135, i64 40
  %59 = bitcast i8* %arrayidx141 to i64*
  store i64 77, i64* %59, align 8
  %arrayidx142 = getelementptr inbounds i8, i8* %call135, i64 48
  %60 = bitcast i8* %arrayidx142 to i64*
  store i64 97, i64* %60, align 8
  %arrayidx143 = getelementptr inbounds i8, i8* %call135, i64 56
  %61 = bitcast i8* %arrayidx143 to i64*
  store i64 116, i64* %61, align 8
  %arrayidx144 = getelementptr inbounds i8, i8* %call135, i64 64
  %62 = bitcast i8* %arrayidx144 to i64*
  store i64 114, i64* %62, align 8
  %arrayidx145 = getelementptr inbounds i8, i8* %call135, i64 72
  %63 = bitcast i8* %arrayidx145 to i64*
  store i64 105, i64* %63, align 8
  %arrayidx146 = getelementptr inbounds i8, i8* %call135, i64 80
  %64 = bitcast i8* %arrayidx146 to i64*
  store i64 120, i64* %64, align 8
  %arrayidx147 = getelementptr inbounds i8, i8* %call135, i64 88
  %65 = bitcast i8* %arrayidx147 to i64*
  store i64 77, i64* %65, align 8
  %arrayidx148 = getelementptr inbounds i8, i8* %call135, i64 96
  %66 = bitcast i8* %arrayidx148 to i64*
  store i64 117, i64* %66, align 8
  %arrayidx149 = getelementptr inbounds i8, i8* %call135, i64 104
  %67 = bitcast i8* %arrayidx149 to i64*
  store i64 108, i64* %67, align 8
  %arrayidx150 = getelementptr inbounds i8, i8* %call135, i64 112
  %68 = bitcast i8* %arrayidx150 to i64*
  store i64 116, i64* %68, align 8
  %arrayidx151 = getelementptr inbounds i8, i8* %call135, i64 120
  %69 = bitcast i8* %arrayidx151 to i64*
  store i64 32, i64* %69, align 8
  %arrayidx152 = getelementptr inbounds i8, i8* %call135, i64 128
  %70 = bitcast i8* %arrayidx152 to i64*
  store i64 116, i64* %70, align 8
  %arrayidx153 = getelementptr inbounds i8, i8* %call135, i64 136
  %71 = bitcast i8* %arrayidx153 to i64*
  store i64 101, i64* %71, align 8
  %arrayidx154 = getelementptr inbounds i8, i8* %call135, i64 144
  %72 = bitcast i8* %arrayidx154 to i64*
  store i64 115, i64* %72, align 8
  %arrayidx155 = getelementptr inbounds i8, i8* %call135, i64 152
  %73 = bitcast i8* %arrayidx155 to i64*
  store i64 116, i64* %73, align 8
  %arrayidx156 = getelementptr inbounds i8, i8* %call135, i64 160
  %74 = bitcast i8* %arrayidx156 to i64*
  store i64 32, i64* %74, align 8
  %arrayidx157 = getelementptr inbounds i8, i8* %call135, i64 168
  %75 = bitcast i8* %arrayidx157 to i64*
  store i64 99, i64* %75, align 8
  %arrayidx158 = getelementptr inbounds i8, i8* %call135, i64 176
  %76 = bitcast i8* %arrayidx158 to i64*
  store i64 97, i64* %76, align 8
  %arrayidx159 = getelementptr inbounds i8, i8* %call135, i64 184
  %77 = bitcast i8* %arrayidx159 to i64*
  store i64 115, i64* %77, align 8
  %arrayidx160 = getelementptr inbounds i8, i8* %call135, i64 192
  %78 = bitcast i8* %arrayidx160 to i64*
  store i64 101, i64* %78, align 8
  tail call void @println_s(i64* %54, i64 25) #4
  %phitmp = bitcast i64* %call125 to i8*
  %phitmp1 = bitcast i64* %call55 to i8*
  %phitmp2 = bitcast i64* %call39 to i8*
  br label %blklab23

blklab23:                                         ; preds = %entry.split, %if.end90
  %_53.0 = phi i8* [ %phitmp, %if.end90 ], [ null, %entry.split ]
  %_50_has_ownership.0 = phi i1 [ true, %if.end90 ], [ false, %entry.split ]
  %79 = phi i8* [ %call91, %if.end90 ], [ null, %entry.split ]
  %_39_has_ownership.1 = phi i8 [ %_39_has_ownership.0, %if.end90 ], [ 0, %entry.split ]
  %_39.1 = phi i64* [ %_39.0, %if.end90 ], [ null, %entry.split ]
  %_28.0 = phi i8* [ %phitmp1, %if.end90 ], [ null, %entry.split ]
  %_18.0 = phi i8* [ %phitmp2, %if.end90 ], [ null, %entry.split ]
  %80 = phi i8* [ %call5, %if.end90 ], [ null, %entry.split ]
  %C.0 = phi %struct.Matrix* [ %call31, %if.end90 ], [ undef, %entry.split ]
  %B.0 = phi %struct.Matrix* [ %call24, %if.end90 ], [ undef, %entry.split ]
  %A.0 = phi %struct.Matrix* [ %call17, %if.end90 ], [ undef, %entry.split ]
  %81 = phi i8* [ %call135, %if.end90 ], [ null, %entry.split ]
  br i1 %_50_has_ownership.0, label %if.then162, label %if.end193.critedge6

if.then162:                                       ; preds = %blklab23
  tail call void @free_Matrix(%struct.Matrix* %A.0)
  tail call void @free_Matrix(%struct.Matrix* %B.0)
  tail call void @free_Matrix(%struct.Matrix* %C.0)
  tail call void @free2DArray(i64** %call, i64 %conv) #4
  tail call void @free(i8* %80) #4
  tail call void @free(i8* %_18.0) #4
  tail call void @free(i8* %_28.0) #4
  br label %if.end193

if.end193.critedge6:                              ; preds = %blklab23
  tail call void @free2DArray(i64** %call, i64 %conv) #4
  br label %if.end193

if.end193:                                        ; preds = %if.end193.critedge6, %if.then162
  %82 = and i8 %_39_has_ownership.1, 1
  %tobool194 = icmp eq i8 %82, 0
  br i1 %tobool194, label %if.end196, label %if.then195

if.then195:                                       ; preds = %if.end193
  %83 = bitcast i64* %_39.1 to i8*
  tail call void @free(i8* %83) #4
  br label %if.end196

if.end196:                                        ; preds = %if.end193, %if.then195
  br i1 %_50_has_ownership.0, label %if.then198, label %if.end205

if.then198:                                       ; preds = %if.end196
  tail call void @free(i8* %79) #4
  tail call void @free(i8* %_53.0) #4
  tail call void @free(i8* %81) #4
  br label %if.end205

if.end205:                                        ; preds = %if.end196, %if.then198
  tail call void @exit(i32 0) #6
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare void @free2DArray(i64**, i64) #2

declare i32 @putchar(i32)

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"}
