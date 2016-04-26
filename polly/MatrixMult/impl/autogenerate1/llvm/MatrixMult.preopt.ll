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
define %struct.Matrix* @matrix(i64 %width, i64 %height, i64* %data, i64 %data_size) #0 {
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
  br i1 %cmp3, label %while.body4.preheader.lr.ph, label %blklab2

while.body4.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body4.preheader

while.body4.preheader:                            ; preds = %while.body4.preheader.lr.ph, %blklab3
  %i.04 = phi i64 [ 0, %while.body4.preheader.lr.ph ], [ %add15, %blklab3 ]
  %cmp51 = icmp sgt i64 %width, 0
  br i1 %cmp51, label %if.end8.lr.ph, label %blklab3

if.end8.lr.ph:                                    ; preds = %while.body4.preheader
  br label %if.end8

if.end8:                                          ; preds = %if.end8.lr.ph, %if.end8
  %j.02 = phi i64 [ 0, %if.end8.lr.ph ], [ %add14, %if.end8 ]
  %mul9 = mul nsw i64 %i.04, %width
  %add = add nsw i64 %j.02, %mul9
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %add
  %0 = load i64, i64* %arrayidx, align 8
  %add10 = add nsw i64 %0, %i.04
  %mul11 = mul nsw i64 %i.04, %width
  %add12 = add nsw i64 %j.02, %mul11
  %arrayidx13 = getelementptr inbounds i64, i64* %call, i64 %add12
  store i64 %add10, i64* %arrayidx13, align 8
  %add14 = add nuw nsw i64 %j.02, 1
  %exitcond = icmp ne i64 %add14, %width
  br i1 %exitcond, label %if.end8, label %while.body4.blklab3_crit_edge

while.body4.blklab3_crit_edge:                    ; preds = %if.end8
  br label %blklab3

blklab3:                                          ; preds = %while.body4.blklab3_crit_edge, %while.body4.preheader
  %add15 = add nuw nsw i64 %i.04, 1
  %exitcond6 = icmp ne i64 %add15, %height
  br i1 %exitcond6, label %while.body4.preheader, label %while.body.blklab2_crit_edge

while.body.blklab2_crit_edge:                     ; preds = %blklab3
  br label %blklab2

blklab2:                                          ; preds = %while.body.blklab2_crit_edge, %entry.split
  %call16 = tail call %struct.Matrix* @matrix(i64 %width, i64 %height, i64* %call, i64 %mul)
  ret %struct.Matrix* %call16
}

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind uwtable
define void @print_mat(%struct._IO_FILE* %sys, %struct.Matrix* %a) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2
  %0 = load i64, i64* %width1, align 8
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height2, align 8
  %cmp3 = icmp sgt i64 %1, 0
  br i1 %cmp3, label %while.body4.preheader.lr.ph, label %blklab6

while.body4.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body4.preheader

while.body4.preheader:                            ; preds = %while.body4.preheader.lr.ph, %blklab8
  %i.04 = phi i64 [ 0, %while.body4.preheader.lr.ph ], [ %add13, %blklab8 ]
  %cmp51 = icmp sgt i64 %0, 0
  br i1 %cmp51, label %if.end7.lr.ph, label %blklab8

if.end7.lr.ph:                                    ; preds = %while.body4.preheader
  br label %if.end7

if.end7:                                          ; preds = %if.end7.lr.ph, %if.end7
  %j.02 = phi i64 [ 0, %if.end7.lr.ph ], [ %add12, %if.end7 ]
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %2 = load i64*, i64** %data, align 8
  %data_size8 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1
  %3 = load i64, i64* %data_size8, align 8
  %call = tail call i64* @copy(i64* %2, i64 %3) #4
  %mul = mul nsw i64 %i.04, %0
  %add = add nsw i64 %j.02, %mul
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %add
  %4 = load i64, i64* %arrayidx, align 8
  %call9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %4) #4
  %call10 = tail call noalias i8* @malloc(i64 8) #4
  %5 = bitcast i8* %call10 to i64*
  store i64 32, i64* %5, align 8
  tail call void @printf_s(i64* %5, i64 1) #4
  %add12 = add nuw nsw i64 %j.02, 1
  %exitcond = icmp ne i64 %add12, %0
  br i1 %exitcond, label %if.end7, label %while.body4.blklab8_crit_edge

while.body4.blklab8_crit_edge:                    ; preds = %if.end7
  br label %blklab8

blklab8:                                          ; preds = %while.body4.blklab8_crit_edge, %while.body4.preheader
  %call14 = tail call noalias i8* @malloc(i64 0) #4
  %6 = bitcast i8* %call14 to i64*
  tail call void @println_s(i64* %6, i64 0) #4
  %add13 = add nuw nsw i64 %i.04, 1
  %exitcond6 = icmp ne i64 %add13, %1
  br i1 %exitcond6, label %while.body4.preheader, label %while.body.blklab6_crit_edge

while.body.blklab6_crit_edge:                     ; preds = %blklab8
  br label %blklab6

blklab6:                                          ; preds = %while.body.blklab6_crit_edge, %entry.split
  ret void
}

declare void @printf_s(i64*, i64) #2

declare void @println_s(i64*, i64) #2

; Function Attrs: nounwind uwtable
define %struct.Matrix* @mat_mult(%struct.Matrix* %a, %struct.Matrix* %b) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 2
  %0 = load i64, i64* %width1, align 8
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3
  %1 = load i64, i64* %height2, align 8
  %mul = mul nsw i64 %1, %0
  %conv3 = trunc i64 %mul to i32
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv3) #4
  %data5 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0
  %2 = load i64*, i64** %data5, align 8
  %data_size6 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1
  %3 = load i64, i64* %data_size6, align 8
  %call7 = tail call i64* @copy(i64* %2, i64 %3) #4
  %data9 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0
  %4 = load i64*, i64** %data9, align 8
  %data_size10 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1
  %5 = load i64, i64* %data_size10, align 8
  %call11 = tail call i64* @copy(i64* %4, i64 %5) #4
  %cmp6 = icmp sgt i64 %1, 0
  br i1 %cmp6, label %while.body14.preheader.lr.ph, label %blklab13

while.body14.preheader.lr.ph:                     ; preds = %entry.split
  br label %while.body14.preheader

while.body14.preheader:                           ; preds = %while.body14.preheader.lr.ph, %blklab14
  %i.07 = phi i64 [ 0, %while.body14.preheader.lr.ph ], [ %add39, %blklab14 ]
  %cmp153 = icmp sgt i64 %0, 0
  br i1 %cmp153, label %while.body20.preheader.lr.ph, label %blklab14

while.body20.preheader.lr.ph:                     ; preds = %while.body14.preheader
  br label %while.body20.preheader

while.body20.preheader:                           ; preds = %while.body20.preheader.lr.ph, %blklab16
  %j.04 = phi i64 [ 0, %while.body20.preheader.lr.ph ], [ %add38, %blklab16 ]
  %cmp211 = icmp sgt i64 %0, 0
  br i1 %cmp211, label %if.end24.lr.ph, label %blklab16

if.end24.lr.ph:                                   ; preds = %while.body20.preheader
  br label %if.end24

if.end24:                                         ; preds = %if.end24.lr.ph, %if.end24
  %k.02 = phi i64 [ 0, %if.end24.lr.ph ], [ %add37, %if.end24 ]
  %mul25 = mul nsw i64 %i.07, %0
  %add = add nsw i64 %j.04, %mul25
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %add
  %6 = load i64, i64* %arrayidx, align 8
  %mul26 = mul nsw i64 %i.07, %0
  %add27 = add nsw i64 %k.02, %mul26
  %arrayidx28 = getelementptr inbounds i64, i64* %call7, i64 %add27
  %7 = load i64, i64* %arrayidx28, align 8
  %mul29 = mul nsw i64 %k.02, %0
  %add30 = add nsw i64 %mul29, %j.04
  %arrayidx31 = getelementptr inbounds i64, i64* %call11, i64 %add30
  %8 = load i64, i64* %arrayidx31, align 8
  %mul32 = mul nsw i64 %8, %7
  %add33 = add nsw i64 %mul32, %6
  %mul34 = mul nsw i64 %i.07, %0
  %add35 = add nsw i64 %j.04, %mul34
  %arrayidx36 = getelementptr inbounds i64, i64* %call, i64 %add35
  store i64 %add33, i64* %arrayidx36, align 8
  %add37 = add nuw nsw i64 %k.02, 1
  %exitcond = icmp ne i64 %add37, %0
  br i1 %exitcond, label %if.end24, label %while.body20.blklab16_crit_edge

while.body20.blklab16_crit_edge:                  ; preds = %if.end24
  br label %blklab16

blklab16:                                         ; preds = %while.body20.blklab16_crit_edge, %while.body20.preheader
  %add38 = add nuw nsw i64 %j.04, 1
  %exitcond9 = icmp ne i64 %add38, %0
  br i1 %exitcond9, label %while.body20.preheader, label %while.body14.blklab14_crit_edge

while.body14.blklab14_crit_edge:                  ; preds = %blklab16
  br label %blklab14

blklab14:                                         ; preds = %while.body14.blklab14_crit_edge, %while.body14.preheader
  %add39 = add nuw nsw i64 %i.07, 1
  %exitcond10 = icmp ne i64 %add39, %1
  br i1 %exitcond10, label %while.body14.preheader, label %while.body.blklab13_crit_edge

while.body.blklab13_crit_edge:                    ; preds = %blklab14
  br label %blklab13

blklab13:                                         ; preds = %while.body.blklab13_crit_edge, %entry.split
  %call40 = tail call %struct.Matrix* @matrix(i64 %0, i64 %1, i64* %call, i64 %mul)
  ret %struct.Matrix* %call40
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #4
  %0 = load i64*, i64** %call, align 8
  %call1 = tail call i64* @parseStringToInt(i64* %0) #4
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab19, label %if.end

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8
  %call3 = tail call noalias i8* @malloc(i64 56) #4
  %2 = bitcast i8* %call3 to i64*
  store i64 115, i64* %2, align 8
  %arrayidx5 = getelementptr inbounds i8, i8* %call3, i64 8
  %3 = bitcast i8* %arrayidx5 to i64*
  store i64 105, i64* %3, align 8
  %arrayidx6 = getelementptr inbounds i8, i8* %call3, i64 16
  %4 = bitcast i8* %arrayidx6 to i64*
  store i64 122, i64* %4, align 8
  %arrayidx7 = getelementptr inbounds i8, i8* %call3, i64 24
  %5 = bitcast i8* %arrayidx7 to i64*
  store i64 101, i64* %5, align 8
  %arrayidx8 = getelementptr inbounds i8, i8* %call3, i64 32
  %6 = bitcast i8* %arrayidx8 to i64*
  store i64 32, i64* %6, align 8
  %arrayidx9 = getelementptr inbounds i8, i8* %call3, i64 40
  %7 = bitcast i8* %arrayidx9 to i64*
  store i64 61, i64* %7, align 8
  %arrayidx10 = getelementptr inbounds i8, i8* %call3, i64 48
  %8 = bitcast i8* %arrayidx10 to i64*
  store i64 32, i64* %8, align 8
  tail call void @printf_s(i64* %2, i64 7) #4
  %call11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1) #4
  %call12 = tail call %struct.Matrix* @init(i64 %1, i64 %1)
  %call13 = tail call %struct.Matrix* @init(i64 %1, i64 %1)
  %call14 = tail call %struct.Matrix* @mat_mult(%struct.Matrix* %call12, %struct.Matrix* %call13)
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call12, i64 0, i32 0
  %9 = load i64*, i64** %data, align 8
  %data_size15 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call12, i64 0, i32 1
  %10 = load i64, i64* %data_size15, align 8
  %call16 = tail call i64* @copy(i64* %9, i64 %10) #4
  %add = mul i64 %1, %1
  %sub18 = add nsw i64 %add, -1
  %arrayidx19 = getelementptr inbounds i64, i64* %call16, i64 %sub18
  %11 = load i64, i64* %arrayidx19, align 8
  %sub20 = add nsw i64 %1, -1
  %cmp21 = icmp eq i64 %11, %sub20
  br i1 %cmp21, label %blklab20, label %if.end24

if.end24:                                         ; preds = %if.end
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %12) #5
  tail call void @exit(i32 -1) #6
  unreachable

blklab20:                                         ; preds = %if.end
  %data27 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call13, i64 0, i32 0
  %14 = load i64*, i64** %data27, align 8
  %data_size28 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call13, i64 0, i32 1
  %15 = load i64, i64* %data_size28, align 8
  %call29 = tail call i64* @copy(i64* %14, i64 %15) #4
  %add32 = mul i64 %1, %1
  %sub33 = add nsw i64 %add32, -1
  %arrayidx34 = getelementptr inbounds i64, i64* %call29, i64 %sub33
  %16 = load i64, i64* %arrayidx34, align 8
  %sub35 = add nsw i64 %1, -1
  %cmp36 = icmp eq i64 %16, %sub35
  br i1 %cmp36, label %blklab21, label %if.end39

if.end39:                                         ; preds = %blklab20
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %17) #5
  tail call void @exit(i32 -1) #6
  unreachable

blklab21:                                         ; preds = %blklab20
  %cmp41 = icmp eq i64 %1, 2000
  br i1 %cmp41, label %if.end44, label %blklab22

if.end44:                                         ; preds = %blklab21
  %data46 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call14, i64 0, i32 0
  %19 = load i64*, i64** %data46, align 8
  %data_size47 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call14, i64 0, i32 1
  %20 = load i64, i64* %data_size47, align 8
  %call48 = tail call i64* @copy(i64* %19, i64 %20) #4
  %add51 = mul i64 %1, %1
  %sub52 = add nsw i64 %add51, -1
  %arrayidx53 = getelementptr inbounds i64, i64* %call48, i64 %sub52
  %21 = load i64, i64* %arrayidx53, align 8
  %cmp54 = icmp eq i64 %21, 3996001000
  br i1 %cmp54, label %blklab22, label %if.end57

if.end57:                                         ; preds = %if.end44
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %22) #5
  tail call void @exit(i32 -1) #6
  unreachable

blklab22:                                         ; preds = %if.end44, %blklab21
  %call59 = tail call noalias i8* @malloc(i64 216) #4
  %24 = bitcast i8* %call59 to i64*
  store i64 77, i64* %24, align 8
  %arrayidx61 = getelementptr inbounds i8, i8* %call59, i64 8
  %25 = bitcast i8* %arrayidx61 to i64*
  store i64 97, i64* %25, align 8
  %arrayidx62 = getelementptr inbounds i8, i8* %call59, i64 16
  %26 = bitcast i8* %arrayidx62 to i64*
  store i64 116, i64* %26, align 8
  %arrayidx63 = getelementptr inbounds i8, i8* %call59, i64 24
  %27 = bitcast i8* %arrayidx63 to i64*
  store i64 114, i64* %27, align 8
  %arrayidx64 = getelementptr inbounds i8, i8* %call59, i64 32
  %28 = bitcast i8* %arrayidx64 to i64*
  store i64 105, i64* %28, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %call59, i64 40
  %29 = bitcast i8* %arrayidx65 to i64*
  store i64 120, i64* %29, align 8
  %arrayidx66 = getelementptr inbounds i8, i8* %call59, i64 48
  %30 = bitcast i8* %arrayidx66 to i64*
  store i64 32, i64* %30, align 8
  %arrayidx67 = getelementptr inbounds i8, i8* %call59, i64 56
  %31 = bitcast i8* %arrayidx67 to i64*
  store i64 67, i64* %31, align 8
  %arrayidx68 = getelementptr inbounds i8, i8* %call59, i64 64
  %32 = bitcast i8* %arrayidx68 to i64*
  store i64 91, i64* %32, align 8
  %arrayidx69 = getelementptr inbounds i8, i8* %call59, i64 72
  %33 = bitcast i8* %arrayidx69 to i64*
  store i64 115, i64* %33, align 8
  %arrayidx70 = getelementptr inbounds i8, i8* %call59, i64 80
  %34 = bitcast i8* %arrayidx70 to i64*
  store i64 105, i64* %34, align 8
  %arrayidx71 = getelementptr inbounds i8, i8* %call59, i64 88
  %35 = bitcast i8* %arrayidx71 to i64*
  store i64 122, i64* %35, align 8
  %arrayidx72 = getelementptr inbounds i8, i8* %call59, i64 96
  %36 = bitcast i8* %arrayidx72 to i64*
  store i64 101, i64* %36, align 8
  %arrayidx73 = getelementptr inbounds i8, i8* %call59, i64 104
  %37 = bitcast i8* %arrayidx73 to i64*
  store i64 45, i64* %37, align 8
  %arrayidx74 = getelementptr inbounds i8, i8* %call59, i64 112
  %38 = bitcast i8* %arrayidx74 to i64*
  store i64 49, i64* %38, align 8
  %arrayidx75 = getelementptr inbounds i8, i8* %call59, i64 120
  %39 = bitcast i8* %arrayidx75 to i64*
  store i64 93, i64* %39, align 8
  %arrayidx76 = getelementptr inbounds i8, i8* %call59, i64 128
  %40 = bitcast i8* %arrayidx76 to i64*
  store i64 91, i64* %40, align 8
  %arrayidx77 = getelementptr inbounds i8, i8* %call59, i64 136
  %41 = bitcast i8* %arrayidx77 to i64*
  store i64 115, i64* %41, align 8
  %arrayidx78 = getelementptr inbounds i8, i8* %call59, i64 144
  %42 = bitcast i8* %arrayidx78 to i64*
  store i64 105, i64* %42, align 8
  %arrayidx79 = getelementptr inbounds i8, i8* %call59, i64 152
  %43 = bitcast i8* %arrayidx79 to i64*
  store i64 122, i64* %43, align 8
  %arrayidx80 = getelementptr inbounds i8, i8* %call59, i64 160
  %44 = bitcast i8* %arrayidx80 to i64*
  store i64 101, i64* %44, align 8
  %arrayidx81 = getelementptr inbounds i8, i8* %call59, i64 168
  %45 = bitcast i8* %arrayidx81 to i64*
  store i64 45, i64* %45, align 8
  %arrayidx82 = getelementptr inbounds i8, i8* %call59, i64 176
  %46 = bitcast i8* %arrayidx82 to i64*
  store i64 49, i64* %46, align 8
  %arrayidx83 = getelementptr inbounds i8, i8* %call59, i64 184
  %47 = bitcast i8* %arrayidx83 to i64*
  store i64 93, i64* %47, align 8
  %arrayidx84 = getelementptr inbounds i8, i8* %call59, i64 192
  %48 = bitcast i8* %arrayidx84 to i64*
  store i64 32, i64* %48, align 8
  %arrayidx85 = getelementptr inbounds i8, i8* %call59, i64 200
  %49 = bitcast i8* %arrayidx85 to i64*
  store i64 61, i64* %49, align 8
  %arrayidx86 = getelementptr inbounds i8, i8* %call59, i64 208
  %50 = bitcast i8* %arrayidx86 to i64*
  store i64 32, i64* %50, align 8
  tail call void @printf_s(i64* %24, i64 27) #4
  %data88 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call14, i64 0, i32 0
  %51 = load i64*, i64** %data88, align 8
  %data_size89 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call14, i64 0, i32 1
  %52 = load i64, i64* %data_size89, align 8
  %call90 = tail call i64* @copy(i64* %51, i64 %52) #4
  %add93 = mul i64 %1, %1
  %sub94 = add nsw i64 %add93, -1
  %arrayidx95 = getelementptr inbounds i64, i64* %call90, i64 %sub94
  %53 = load i64, i64* %arrayidx95, align 8
  %call96 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %53) #4
  %call97 = tail call noalias i8* @malloc(i64 200) #4
  %54 = bitcast i8* %call97 to i64*
  store i64 80, i64* %54, align 8
  %arrayidx99 = getelementptr inbounds i8, i8* %call97, i64 8
  %55 = bitcast i8* %arrayidx99 to i64*
  store i64 97, i64* %55, align 8
  %arrayidx100 = getelementptr inbounds i8, i8* %call97, i64 16
  %56 = bitcast i8* %arrayidx100 to i64*
  store i64 115, i64* %56, align 8
  %arrayidx101 = getelementptr inbounds i8, i8* %call97, i64 24
  %57 = bitcast i8* %arrayidx101 to i64*
  store i64 115, i64* %57, align 8
  %arrayidx102 = getelementptr inbounds i8, i8* %call97, i64 32
  %58 = bitcast i8* %arrayidx102 to i64*
  store i64 32, i64* %58, align 8
  %arrayidx103 = getelementptr inbounds i8, i8* %call97, i64 40
  %59 = bitcast i8* %arrayidx103 to i64*
  store i64 77, i64* %59, align 8
  %arrayidx104 = getelementptr inbounds i8, i8* %call97, i64 48
  %60 = bitcast i8* %arrayidx104 to i64*
  store i64 97, i64* %60, align 8
  %arrayidx105 = getelementptr inbounds i8, i8* %call97, i64 56
  %61 = bitcast i8* %arrayidx105 to i64*
  store i64 116, i64* %61, align 8
  %arrayidx106 = getelementptr inbounds i8, i8* %call97, i64 64
  %62 = bitcast i8* %arrayidx106 to i64*
  store i64 114, i64* %62, align 8
  %arrayidx107 = getelementptr inbounds i8, i8* %call97, i64 72
  %63 = bitcast i8* %arrayidx107 to i64*
  store i64 105, i64* %63, align 8
  %arrayidx108 = getelementptr inbounds i8, i8* %call97, i64 80
  %64 = bitcast i8* %arrayidx108 to i64*
  store i64 120, i64* %64, align 8
  %arrayidx109 = getelementptr inbounds i8, i8* %call97, i64 88
  %65 = bitcast i8* %arrayidx109 to i64*
  store i64 77, i64* %65, align 8
  %arrayidx110 = getelementptr inbounds i8, i8* %call97, i64 96
  %66 = bitcast i8* %arrayidx110 to i64*
  store i64 117, i64* %66, align 8
  %arrayidx111 = getelementptr inbounds i8, i8* %call97, i64 104
  %67 = bitcast i8* %arrayidx111 to i64*
  store i64 108, i64* %67, align 8
  %arrayidx112 = getelementptr inbounds i8, i8* %call97, i64 112
  %68 = bitcast i8* %arrayidx112 to i64*
  store i64 116, i64* %68, align 8
  %arrayidx113 = getelementptr inbounds i8, i8* %call97, i64 120
  %69 = bitcast i8* %arrayidx113 to i64*
  store i64 32, i64* %69, align 8
  %arrayidx114 = getelementptr inbounds i8, i8* %call97, i64 128
  %70 = bitcast i8* %arrayidx114 to i64*
  store i64 116, i64* %70, align 8
  %arrayidx115 = getelementptr inbounds i8, i8* %call97, i64 136
  %71 = bitcast i8* %arrayidx115 to i64*
  store i64 101, i64* %71, align 8
  %arrayidx116 = getelementptr inbounds i8, i8* %call97, i64 144
  %72 = bitcast i8* %arrayidx116 to i64*
  store i64 115, i64* %72, align 8
  %arrayidx117 = getelementptr inbounds i8, i8* %call97, i64 152
  %73 = bitcast i8* %arrayidx117 to i64*
  store i64 116, i64* %73, align 8
  %arrayidx118 = getelementptr inbounds i8, i8* %call97, i64 160
  %74 = bitcast i8* %arrayidx118 to i64*
  store i64 32, i64* %74, align 8
  %arrayidx119 = getelementptr inbounds i8, i8* %call97, i64 168
  %75 = bitcast i8* %arrayidx119 to i64*
  store i64 99, i64* %75, align 8
  %arrayidx120 = getelementptr inbounds i8, i8* %call97, i64 176
  %76 = bitcast i8* %arrayidx120 to i64*
  store i64 97, i64* %76, align 8
  %arrayidx121 = getelementptr inbounds i8, i8* %call97, i64 184
  %77 = bitcast i8* %arrayidx121 to i64*
  store i64 115, i64* %77, align 8
  %arrayidx122 = getelementptr inbounds i8, i8* %call97, i64 192
  %78 = bitcast i8* %arrayidx122 to i64*
  store i64 101, i64* %78, align 8
  tail call void @println_s(i64* %54, i64 25) #4
  br label %blklab19

blklab19:                                         ; preds = %entry.split, %blklab22
  tail call void @exit(i32 0) #6
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

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

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"}
