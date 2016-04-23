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
  %cmp13 = icmp sgt i64 %1, 0
  br i1 %cmp13, label %while.body4.preheader.lr.ph, label %blklab6

while.body4.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body4.preheader

while.body4.preheader:                            ; preds = %while.body4.preheader.lr.ph, %if.end21
  %_25_has_ownership.019 = phi i1 [ false, %while.body4.preheader.lr.ph ], [ true, %if.end21 ]
  %i.017 = phi i64 [ 0, %while.body4.preheader.lr.ph ], [ %add18, %if.end21 ]
  %2 = phi i8* [ undef, %while.body4.preheader.lr.ph ], [ %call22, %if.end21 ]
  %_12.016 = phi i64* [ null, %while.body4.preheader.lr.ph ], [ %_12.1.lcssa, %if.end21 ]
  %_12_has_ownership.015 = phi i8 [ 0, %while.body4.preheader.lr.ph ], [ %_12_has_ownership.1.lcssa, %if.end21 ]
  %3 = phi i8* [ null, %while.body4.preheader.lr.ph ], [ %.lcssa1, %if.end21 ]
  %4 = phi i8* [ null, %while.body4.preheader.lr.ph ], [ %.lcssa, %if.end21 ]
  %_18_has_ownership.014 = phi i8 [ 0, %while.body4.preheader.lr.ph ], [ %_18_has_ownership.1.lcssa, %if.end21 ]
  %cmp54 = icmp sgt i64 %0, 0
  br i1 %cmp54, label %if.end7.lr.ph, label %blklab8

if.end7.lr.ph:                                    ; preds = %while.body4.preheader
  br label %if.end7

if.end7:                                          ; preds = %if.end7.lr.ph, %if.end14
  %j.08 = phi i64 [ 0, %if.end7.lr.ph ], [ %add17, %if.end14 ]
  %_12.17 = phi i64* [ %_12.016, %if.end7.lr.ph ], [ %call, %if.end14 ]
  %_12_has_ownership.16 = phi i8 [ %_12_has_ownership.015, %if.end7.lr.ph ], [ 1, %if.end14 ]
  %5 = phi i8* [ %4, %if.end7.lr.ph ], [ %call15, %if.end14 ]
  %_18_has_ownership.15 = phi i8 [ %_18_has_ownership.014, %if.end7.lr.ph ], [ 1, %if.end14 ]
  %6 = and i8 %_12_has_ownership.16, 1
  %tobool = icmp eq i8 %6, 0
  br i1 %tobool, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end7
  %7 = bitcast i64* %_12.17 to i8*
  tail call void @free(i8* %7) #4
  br label %if.end9

if.end9:                                          ; preds = %if.end7, %if.then8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %8 = load i64*, i64** %data, align 8
  %data_size10 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1
  %9 = load i64, i64* %data_size10, align 8
  %call = tail call i64* @copy(i64* %8, i64 %9) #4
  %mul = mul nsw i64 %i.017, %0
  %add = add nsw i64 %j.08, %mul
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %add
  %10 = load i64, i64* %arrayidx, align 8
  %call11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %10) #4
  %11 = and i8 %_18_has_ownership.15, 1
  %tobool12 = icmp eq i8 %11, 0
  br i1 %tobool12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.end9
  tail call void @free(i8* %5) #4
  br label %if.end14

if.end14:                                         ; preds = %if.end9, %if.then13
  %call15 = tail call noalias i8* @malloc(i64 8) #4
  %12 = bitcast i8* %call15 to i64*
  store i64 32, i64* %12, align 8
  tail call void @printf_s(i64* %12, i64 1) #4
  %add17 = add nuw nsw i64 %j.08, 1
  %exitcond = icmp ne i64 %add17, %0
  br i1 %exitcond, label %if.end7, label %while.body4.blklab8_crit_edge

while.body4.blklab8_crit_edge:                    ; preds = %if.end14
  %call15.lcssa = phi i8* [ %call15, %if.end14 ]
  %call.lcssa = phi i64* [ %call, %if.end14 ]
  br label %blklab8

blklab8:                                          ; preds = %while.body4.blklab8_crit_edge, %while.body4.preheader
  %_12.1.lcssa = phi i64* [ %call.lcssa, %while.body4.blklab8_crit_edge ], [ %_12.016, %while.body4.preheader ]
  %_12_has_ownership.1.lcssa = phi i8 [ 1, %while.body4.blklab8_crit_edge ], [ %_12_has_ownership.015, %while.body4.preheader ]
  %.lcssa1 = phi i8* [ %call15.lcssa, %while.body4.blklab8_crit_edge ], [ %3, %while.body4.preheader ]
  %.lcssa = phi i8* [ %call15.lcssa, %while.body4.blklab8_crit_edge ], [ %4, %while.body4.preheader ]
  %_18_has_ownership.1.lcssa = phi i8 [ 1, %while.body4.blklab8_crit_edge ], [ %_18_has_ownership.014, %while.body4.preheader ]
  %add18 = add nuw nsw i64 %i.017, 1
  br i1 %_25_has_ownership.019, label %if.then20, label %if.end21

if.then20:                                        ; preds = %blklab8
  tail call void @free(i8* %2) #4
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %blklab8
  %call22 = tail call noalias i8* @malloc(i64 0) #4
  %13 = bitcast i8* %call22 to i64*
  tail call void @println_s(i64* %13, i64 0) #4
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
  %.lcssa3 = phi i8* [ %call22.lcssa, %while.body.blklab6_crit_edge ], [ undef, %entry.split ]
  %_12.0.lcssa = phi i64* [ %_12.1.lcssa.lcssa, %while.body.blklab6_crit_edge ], [ null, %entry.split ]
  %_12_has_ownership.0.lcssa = phi i8 [ %_12_has_ownership.1.lcssa.lcssa, %while.body.blklab6_crit_edge ], [ 0, %entry.split ]
  %.lcssa2 = phi i8* [ %.lcssa1.lcssa, %while.body.blklab6_crit_edge ], [ null, %entry.split ]
  %_18_has_ownership.0.lcssa = phi i8 [ %_18_has_ownership.1.lcssa.lcssa, %while.body.blklab6_crit_edge ], [ 0, %entry.split ]
  br i1 %a_has_ownership, label %if.then24, label %if.end25

if.then24:                                        ; preds = %blklab6
  tail call void @free_Matrix(%struct.Matrix* %a)
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %blklab6
  %14 = and i8 %_12_has_ownership.0.lcssa, 1
  %tobool26 = icmp eq i8 %14, 0
  br i1 %tobool26, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end25
  %15 = bitcast i64* %_12.0.lcssa to i8*
  tail call void @free(i8* %15) #4
  br label %if.end28

if.end28:                                         ; preds = %if.end25, %if.then27
  %16 = and i8 %_18_has_ownership.0.lcssa, 1
  %tobool29 = icmp eq i8 %16, 0
  br i1 %tobool29, label %if.end31, label %if.then30

if.then30:                                        ; preds = %if.end28
  tail call void @free(i8* %.lcssa2) #4
  br label %if.end31

if.end31:                                         ; preds = %if.end28, %if.then30
  br i1 %_25_has_ownership.0.lcssa, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end31
  tail call void @free(i8* %.lcssa3) #4
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
  %cmp6 = icmp sgt i64 %1, 0
  br i1 %cmp6, label %while.body32.preheader.lr.ph, label %if.end60

while.body32.preheader.lr.ph:                     ; preds = %entry.split
  br label %while.body32.preheader

while.body32.preheader:                           ; preds = %while.body32.preheader.lr.ph, %blklab14
  %i.07 = phi i64 [ 0, %while.body32.preheader.lr.ph ], [ %add57, %blklab14 ]
  %cmp333 = icmp sgt i64 %0, 0
  br i1 %cmp333, label %while.body38.preheader.lr.ph, label %blklab14

while.body38.preheader.lr.ph:                     ; preds = %while.body32.preheader
  br label %while.body38.preheader

while.body38.preheader:                           ; preds = %while.body38.preheader.lr.ph, %blklab16
  %j.04 = phi i64 [ 0, %while.body38.preheader.lr.ph ], [ %add56, %blklab16 ]
  %cmp391 = icmp sgt i64 %0, 0
  br i1 %cmp391, label %if.end42.lr.ph, label %blklab16

if.end42.lr.ph:                                   ; preds = %while.body38.preheader
  br label %if.end42

if.end42:                                         ; preds = %if.end42.lr.ph, %if.end42
  %k.02 = phi i64 [ 0, %if.end42.lr.ph ], [ %add55, %if.end42 ]
  %mul43 = mul nsw i64 %i.07, %0
  %add = add nsw i64 %j.04, %mul43
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %add
  %6 = load i64, i64* %arrayidx, align 8
  %mul44 = mul nsw i64 %i.07, %0
  %add45 = add nsw i64 %k.02, %mul44
  %arrayidx46 = getelementptr inbounds i64, i64* %call14, i64 %add45
  %7 = load i64, i64* %arrayidx46, align 8
  %mul47 = mul nsw i64 %k.02, %0
  %add48 = add nsw i64 %mul47, %j.04
  %arrayidx49 = getelementptr inbounds i64, i64* %call24, i64 %add48
  %8 = load i64, i64* %arrayidx49, align 8
  %mul50 = mul nsw i64 %8, %7
  %add51 = add nsw i64 %mul50, %6
  %mul52 = mul nsw i64 %i.07, %0
  %add53 = add nsw i64 %j.04, %mul52
  %arrayidx54 = getelementptr inbounds i64, i64* %call, i64 %add53
  store i64 %add51, i64* %arrayidx54, align 8
  %add55 = add nuw nsw i64 %k.02, 1
  %exitcond = icmp ne i64 %add55, %0
  br i1 %exitcond, label %if.end42, label %while.body38.blklab16_crit_edge

while.body38.blklab16_crit_edge:                  ; preds = %if.end42
  br label %blklab16

blklab16:                                         ; preds = %while.body38.blklab16_crit_edge, %while.body38.preheader
  %add56 = add nuw nsw i64 %j.04, 1
  %exitcond9 = icmp ne i64 %add56, %0
  br i1 %exitcond9, label %while.body38.preheader, label %while.body32.blklab14_crit_edge

while.body32.blklab14_crit_edge:                  ; preds = %blklab16
  br label %blklab14

blklab14:                                         ; preds = %while.body32.blklab14_crit_edge, %while.body32.preheader
  %add57 = add nuw nsw i64 %i.07, 1
  %exitcond10 = icmp ne i64 %add57, %1
  br i1 %exitcond10, label %while.body32.preheader, label %while.body.if.end60_crit_edge

while.body.if.end60_crit_edge:                    ; preds = %blklab14
  br label %if.end60

if.end60:                                         ; preds = %while.body.if.end60_crit_edge, %entry.split
  %call61 = tail call %struct.Matrix* @matrix(i64 %0, i64 %1, i64* %call, i64 %mul, i1 zeroext false)
  br i1 %a_has_ownership, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end60
  tail call void @free_Matrix(%struct.Matrix* %a)
  br label %if.end64

if.end64:                                         ; preds = %if.then63, %if.end60
  br i1 %b_has_ownership, label %if.then66, label %if.then72

if.then66:                                        ; preds = %if.end64
  tail call void @free_Matrix(%struct.Matrix* %b)
  br label %if.then72

if.then72:                                        ; preds = %if.then66, %if.end64
  %9 = bitcast i64* %call to i8*
  tail call void @free(i8* %9) #4
  %10 = bitcast i64* %call14 to i8*
  tail call void @free(i8* %10) #4
  %11 = bitcast i64* %call24 to i8*
  tail call void @free(i8* %11) #4
  ret %struct.Matrix* %call61
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
  br i1 %cmp, label %blklab19, label %if.end

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
  br i1 %cmp62, label %blklab21, label %if.end65

if.end65:                                         ; preds = %if.end51
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %17) #5
  tail call void @exit(i32 -1) #6
  unreachable

blklab21:                                         ; preds = %if.end51
  %cmp67 = icmp eq i64 %1, 2000
  br i1 %cmp67, label %if.end73, label %if.end90

if.end73:                                         ; preds = %blklab21
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

if.end90:                                         ; preds = %blklab21, %if.end73
  %_39_has_ownership.0 = phi i8 [ 0, %blklab21 ], [ 1, %if.end73 ]
  %_39.0 = phi i64* [ null, %blklab21 ], [ %call77, %if.end73 ]
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
  br label %blklab19

blklab19:                                         ; preds = %entry.split, %if.end90
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

if.then162:                                       ; preds = %blklab19
  tail call void @free_Matrix(%struct.Matrix* %A.0)
  tail call void @free_Matrix(%struct.Matrix* %B.0)
  tail call void @free_Matrix(%struct.Matrix* %C.0)
  tail call void @free2DArray(i64** %call, i64 %conv) #4
  tail call void @free(i8* %80) #4
  tail call void @free(i8* %_18.0) #4
  tail call void @free(i8* %_28.0) #4
  br label %if.end193

if.end193.critedge6:                              ; preds = %blklab19
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
