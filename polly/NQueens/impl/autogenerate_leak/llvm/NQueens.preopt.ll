; ModuleID = 'llvm/NQueens.preopt.ll.tmp'
source_filename = "NQueens.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.POS = type { i64, i64 }

@.str = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c" r:\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" c:\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.POS* @copy_POS(%struct.POS* %_POS) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 16) #5
  %0 = bitcast i8* %call to %struct.POS*
  %r = getelementptr inbounds %struct.POS, %struct.POS* %_POS, i64 0, i32 0
  %1 = load i64, i64* %r, align 8
  %r1 = bitcast i8* %call to i64*
  store i64 %1, i64* %r1, align 8
  %c = getelementptr inbounds %struct.POS, %struct.POS* %_POS, i64 0, i32 1
  %2 = load i64, i64* %c, align 8
  %c2 = getelementptr inbounds i8, i8* %call, i64 8
  %3 = bitcast i8* %c2 to i64*
  store i64 %2, i64* %3, align 8
  ret %struct.POS* %0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define %struct.POS** @copy_array_POS(%struct.POS** %_POS, i64 %_POS_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %mul = shl i64 %_POS_size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #5
  %0 = bitcast i8* %call to %struct.POS**
  %cmp1 = icmp sgt i64 %_POS_size, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry.split
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %_POS, i64 %indvars.iv
  %1 = load %struct.POS*, %struct.POS** %arrayidx, align 8
  %call2 = tail call %struct.POS* @copy_POS(%struct.POS* %1)
  %arrayidx4 = getelementptr inbounds %struct.POS*, %struct.POS** %0, i64 %indvars.iv
  store %struct.POS* %call2, %struct.POS** %arrayidx4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %_POS_size
  br i1 %exitcond, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry.split
  ret %struct.POS** %0
}

; Function Attrs: nounwind uwtable
define void @free_POS(%struct.POS* %pos) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %0 = bitcast %struct.POS* %pos to i8*
  tail call void @free(i8* %0) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @printf_POS(%struct.POS* %pos) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %putchar = tail call i32 @putchar(i32 123) #5
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #5
  %r = getelementptr inbounds %struct.POS, %struct.POS* %pos, i64 0, i32 0
  %0 = load i64, i64* %r, align 8
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %0) #5
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %c = getelementptr inbounds %struct.POS, %struct.POS* %pos, i64 0, i32 1
  %1 = load i64, i64* %c, align 8
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %1) #5
  %putchar1 = tail call i32 @putchar(i32 125) #5
  ret void
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i64 @conflict(%struct.POS* %p, i64 %row, i64 %col) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %r1 = getelementptr inbounds %struct.POS, %struct.POS* %p, i64 0, i32 0
  %0 = load i64, i64* %r1, align 8
  %c2 = getelementptr inbounds %struct.POS, %struct.POS* %p, i64 0, i32 1
  %1 = load i64, i64* %c2, align 8
  %cmp = icmp eq i64 %0, %row
  %cmp3 = icmp eq i64 %1, %col
  %or.cond = or i1 %cmp, %cmp3
  br i1 %or.cond, label %return, label %blklab0

blklab0:                                          ; preds = %entry.split
  %sub = sub nsw i64 %1, %col
  %ispos = icmp sgt i64 %sub, -1
  %neg = sub i64 0, %sub
  %2 = select i1 %ispos, i64 %sub, i64 %neg
  %sub6 = sub nsw i64 %0, %row
  %ispos1 = icmp sgt i64 %sub6, -1
  %neg2 = sub i64 0, %sub6
  %3 = select i1 %ispos1, i64 %sub6, i64 %neg2
  %cmp8 = icmp eq i64 %2, %3
  %_15.0 = zext i1 %cmp8 to i64
  br label %return

return:                                           ; preds = %blklab0, %entry.split
  %retval.0 = phi i64 [ 1, %entry.split ], [ %_15.0, %blklab0 ]
  ret i64 %retval.0
}

; Function Attrs: nounwind readnone
declare i64 @llabs(i64) #3

; Function Attrs: nounwind uwtable
define i64 @run(%struct.POS** %queens, i64 %queens_size, i64 %n, i64 %dim) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp = icmp eq i64 %dim, %n
  br i1 %cmp, label %blklab7, label %while.body.preheader

while.body.preheader:                             ; preds = %entry.split
  %cmp1 = icmp slt i64 %n, %queens_size
  %cmp4 = icmp eq i64 %dim, %queens_size
  %or.cond = and i1 %cmp1, %cmp4
  br i1 %or.cond, label %blklab10.lr.ph, label %blklab11

blklab10.lr.ph:                                   ; preds = %while.body.preheader
  br label %blklab10

while.body.blklab11_crit_edge:                    ; preds = %blklab9
  br label %blklab11

blklab11:                                         ; preds = %while.body.blklab11_crit_edge, %while.body.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #6
  tail call void @exit(i32 -1) #7
  unreachable

blklab10:                                         ; preds = %blklab10.lr.ph, %blklab9
  %num_solutions.012 = phi i64 [ 0, %blklab10.lr.ph ], [ %num_solutions.1, %blklab9 ]
  %col.011 = phi i64 [ 0, %blklab10.lr.ph ], [ %add41, %blklab9 ]
  %cmp7 = icmp slt i64 %col.011, %dim
  br i1 %cmp7, label %while.body11.preheader, label %blklab7.loopexit

while.body11.preheader:                           ; preds = %blklab10
  %cmp12 = icmp sge i64 %n, %queens_size
  %or.cond1.not7 = xor i1 %cmp12, true
  %cmp18 = icmp eq i64 %dim, %queens_size
  %or.cond28 = and i1 %cmp18, %or.cond1.not7
  br i1 %or.cond28, label %blklab14.lr.ph, label %while.body11.preheader.blklab15_crit_edge

blklab14.lr.ph:                                   ; preds = %while.body11.preheader
  br label %blklab14

while.body11.preheader.blklab15_crit_edge:        ; preds = %while.body11.preheader
  br label %blklab15

while.body11.blklab15_crit_edge:                  ; preds = %blklab13
  br label %blklab15

blklab15:                                         ; preds = %while.body11.blklab15_crit_edge, %while.body11.preheader.blklab15_crit_edge
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %2) #6
  tail call void @exit(i32 -1) #7
  unreachable

blklab14:                                         ; preds = %blklab14.lr.ph, %blklab13
  %isSolution.010 = phi i64 [ 1, %blklab14.lr.ph ], [ %_23.0, %blklab13 ]
  %i.09 = phi i64 [ 0, %blklab14.lr.ph ], [ %add, %blklab13 ]
  %cmp22 = icmp slt i64 %i.09, %n
  br i1 %cmp22, label %if.end24, label %blklab12

if.end24:                                         ; preds = %blklab14
  %arrayidx = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %i.09
  %4 = load %struct.POS*, %struct.POS** %arrayidx, align 8
  %call25 = tail call %struct.POS* @copy_POS(%struct.POS* %4)
  %cmp26 = icmp eq i64 %isSolution.010, 1
  br i1 %cmp26, label %blklab20, label %blklab13

blklab20:                                         ; preds = %if.end24
  %call29 = tail call i64 @conflict(%struct.POS* %call25, i64 %n, i64 %col.011)
  %not.cmp30 = icmp ne i64 %call29, 1
  %. = zext i1 %not.cmp30 to i64
  br label %blklab13

blklab13:                                         ; preds = %blklab20, %if.end24
  %_23.0 = phi i64 [ 0, %if.end24 ], [ %., %blklab20 ]
  %add = add nuw nsw i64 %i.09, 1
  %or.cond1 = or i1 %cmp12, false
  %or.cond1.not = xor i1 %or.cond1, true
  %or.cond2 = and i1 %cmp18, %or.cond1.not
  br i1 %or.cond2, label %blklab14, label %while.body11.blklab15_crit_edge

blklab12:                                         ; preds = %blklab14
  %isSolution.010.lcssa = phi i64 [ %isSolution.010, %blklab14 ]
  %cmp33 = icmp eq i64 %isSolution.010.lcssa, 1
  br i1 %cmp33, label %if.end35, label %blklab9

if.end35:                                         ; preds = %blklab12
  %call36 = tail call noalias i8* @malloc(i64 16) #5
  %c = getelementptr inbounds i8, i8* %call36, i64 8
  %5 = bitcast i8* %c to i64*
  store i64 %col.011, i64* %5, align 8
  %r = bitcast i8* %call36 to i64*
  store i64 %n, i64* %r, align 8
  %arrayidx37 = getelementptr inbounds %struct.POS*, %struct.POS** %queens, i64 %n
  %6 = bitcast %struct.POS** %arrayidx37 to i8**
  store i8* %call36, i8** %6, align 8
  %add38 = add nsw i64 %n, 1
  %call39 = tail call i64 @run(%struct.POS** %queens, i64 %queens_size, i64 %add38, i64 %dim)
  %add40 = add nsw i64 %call39, %num_solutions.012
  br label %blklab9

blklab9:                                          ; preds = %if.end35, %blklab12
  %num_solutions.1 = phi i64 [ %add40, %if.end35 ], [ %num_solutions.012, %blklab12 ]
  %add41 = add nuw nsw i64 %col.011, 1
  br i1 %or.cond, label %blklab10, label %while.body.blklab11_crit_edge

blklab7.loopexit:                                 ; preds = %blklab10
  %num_solutions.012.lcssa = phi i64 [ %num_solutions.012, %blklab10 ]
  br label %blklab7

blklab7:                                          ; preds = %blklab7.loopexit, %entry.split
  %retval.0 = phi i64 [ 1, %entry.split ], [ %num_solutions.012.lcssa, %blklab7.loopexit ]
  ret i64 %retval.0
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5
  %0 = load i64*, i64** %call, align 8
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab23, label %if.end

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8
  %call3 = tail call noalias i8* @malloc(i64 16) #5
  %2 = bitcast i8* %call3 to %struct.POS*
  %c = getelementptr inbounds i8, i8* %call3, i64 8
  %3 = bitcast i8* %c to i64*
  store i64 0, i64* %3, align 8
  %r = bitcast i8* %call3 to i64*
  store i64 0, i64* %r, align 8
  %mul = shl i64 %1, 3
  %call4 = tail call noalias i8* @malloc(i64 %mul) #5
  %4 = bitcast i8* %call4 to %struct.POS**
  %cmp61 = icmp sgt i64 %1, 0
  br i1 %cmp61, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %if.end
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %call8 = tail call %struct.POS* @copy_POS(%struct.POS* %2)
  %arrayidx9 = getelementptr inbounds %struct.POS*, %struct.POS** %4, i64 %indvars.iv
  store %struct.POS* %call8, %struct.POS** %arrayidx9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %1
  br i1 %exitcond, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %if.end
  %call10 = tail call i64 @run(%struct.POS** %4, i64 %1, i64 0, i64 %1)
  %call11 = tail call noalias i8* @malloc(i64 264) #5
  %5 = bitcast i8* %call11 to i64*
  store i64 78, i64* %5, align 8
  %arrayidx13 = getelementptr inbounds i8, i8* %call11, i64 8
  %6 = bitcast i8* %arrayidx13 to i64*
  store i64 45, i64* %6, align 8
  %arrayidx14 = getelementptr inbounds i8, i8* %call11, i64 16
  %7 = bitcast i8* %arrayidx14 to i64*
  store i64 81, i64* %7, align 8
  %arrayidx15 = getelementptr inbounds i8, i8* %call11, i64 24
  %8 = bitcast i8* %arrayidx15 to i64*
  store i64 117, i64* %8, align 8
  %arrayidx16 = getelementptr inbounds i8, i8* %call11, i64 32
  %9 = bitcast i8* %arrayidx16 to i64*
  store i64 101, i64* %9, align 8
  %arrayidx17 = getelementptr inbounds i8, i8* %call11, i64 40
  %10 = bitcast i8* %arrayidx17 to i64*
  store i64 101, i64* %10, align 8
  %arrayidx18 = getelementptr inbounds i8, i8* %call11, i64 48
  %11 = bitcast i8* %arrayidx18 to i64*
  store i64 110, i64* %11, align 8
  %arrayidx19 = getelementptr inbounds i8, i8* %call11, i64 56
  %12 = bitcast i8* %arrayidx19 to i64*
  store i64 32, i64* %12, align 8
  %arrayidx20 = getelementptr inbounds i8, i8* %call11, i64 64
  %13 = bitcast i8* %arrayidx20 to i64*
  store i64 80, i64* %13, align 8
  %arrayidx21 = getelementptr inbounds i8, i8* %call11, i64 72
  %14 = bitcast i8* %arrayidx21 to i64*
  store i64 114, i64* %14, align 8
  %arrayidx22 = getelementptr inbounds i8, i8* %call11, i64 80
  %15 = bitcast i8* %arrayidx22 to i64*
  store i64 111, i64* %15, align 8
  %arrayidx23 = getelementptr inbounds i8, i8* %call11, i64 88
  %16 = bitcast i8* %arrayidx23 to i64*
  store i64 98, i64* %16, align 8
  %arrayidx24 = getelementptr inbounds i8, i8* %call11, i64 96
  %17 = bitcast i8* %arrayidx24 to i64*
  store i64 108, i64* %17, align 8
  %arrayidx25 = getelementptr inbounds i8, i8* %call11, i64 104
  %18 = bitcast i8* %arrayidx25 to i64*
  store i64 101, i64* %18, align 8
  %arrayidx26 = getelementptr inbounds i8, i8* %call11, i64 112
  %19 = bitcast i8* %arrayidx26 to i64*
  store i64 109, i64* %19, align 8
  %arrayidx27 = getelementptr inbounds i8, i8* %call11, i64 120
  %20 = bitcast i8* %arrayidx27 to i64*
  store i64 32, i64* %20, align 8
  %arrayidx28 = getelementptr inbounds i8, i8* %call11, i64 128
  %21 = bitcast i8* %arrayidx28 to i64*
  store i64 111, i64* %21, align 8
  %arrayidx29 = getelementptr inbounds i8, i8* %call11, i64 136
  %22 = bitcast i8* %arrayidx29 to i64*
  store i64 110, i64* %22, align 8
  %arrayidx30 = getelementptr inbounds i8, i8* %call11, i64 144
  %23 = bitcast i8* %arrayidx30 to i64*
  store i64 32, i64* %23, align 8
  %arrayidx31 = getelementptr inbounds i8, i8* %call11, i64 152
  %24 = bitcast i8* %arrayidx31 to i64*
  store i64 97, i64* %24, align 8
  %arrayidx32 = getelementptr inbounds i8, i8* %call11, i64 160
  %25 = bitcast i8* %arrayidx32 to i64*
  store i64 32, i64* %25, align 8
  %arrayidx33 = getelementptr inbounds i8, i8* %call11, i64 168
  %26 = bitcast i8* %arrayidx33 to i64*
  store i64 78, i64* %26, align 8
  %arrayidx34 = getelementptr inbounds i8, i8* %call11, i64 176
  %27 = bitcast i8* %arrayidx34 to i64*
  store i64 32, i64* %27, align 8
  %arrayidx35 = getelementptr inbounds i8, i8* %call11, i64 184
  %28 = bitcast i8* %arrayidx35 to i64*
  store i64 88, i64* %28, align 8
  %arrayidx36 = getelementptr inbounds i8, i8* %call11, i64 192
  %29 = bitcast i8* %arrayidx36 to i64*
  store i64 32, i64* %29, align 8
  %arrayidx37 = getelementptr inbounds i8, i8* %call11, i64 200
  %30 = bitcast i8* %arrayidx37 to i64*
  store i64 78, i64* %30, align 8
  %arrayidx38 = getelementptr inbounds i8, i8* %call11, i64 208
  %31 = bitcast i8* %arrayidx38 to i64*
  store i64 32, i64* %31, align 8
  %arrayidx39 = getelementptr inbounds i8, i8* %call11, i64 216
  %32 = bitcast i8* %arrayidx39 to i64*
  store i64 66, i64* %32, align 8
  %arrayidx40 = getelementptr inbounds i8, i8* %call11, i64 224
  %33 = bitcast i8* %arrayidx40 to i64*
  store i64 111, i64* %33, align 8
  %arrayidx41 = getelementptr inbounds i8, i8* %call11, i64 232
  %34 = bitcast i8* %arrayidx41 to i64*
  store i64 97, i64* %34, align 8
  %arrayidx42 = getelementptr inbounds i8, i8* %call11, i64 240
  %35 = bitcast i8* %arrayidx42 to i64*
  store i64 114, i64* %35, align 8
  %arrayidx43 = getelementptr inbounds i8, i8* %call11, i64 248
  %36 = bitcast i8* %arrayidx43 to i64*
  store i64 100, i64* %36, align 8
  %arrayidx44 = getelementptr inbounds i8, i8* %call11, i64 256
  %37 = bitcast i8* %arrayidx44 to i64*
  store i64 46, i64* %37, align 8
  tail call void @println_s(i64* %5, i64 33) #5
  %call45 = tail call noalias i8* @malloc(i64 32) #5
  %38 = bitcast i8* %call45 to i64*
  store i64 78, i64* %38, align 8
  %arrayidx47 = getelementptr inbounds i8, i8* %call45, i64 8
  %39 = bitcast i8* %arrayidx47 to i64*
  store i64 32, i64* %39, align 8
  %arrayidx48 = getelementptr inbounds i8, i8* %call45, i64 16
  %40 = bitcast i8* %arrayidx48 to i64*
  store i64 61, i64* %40, align 8
  %arrayidx49 = getelementptr inbounds i8, i8* %call45, i64 24
  %41 = bitcast i8* %arrayidx49 to i64*
  store i64 32, i64* %41, align 8
  tail call void @printf_s(i64* %38, i64 4) #5
  %call50 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1) #5
  %call51 = tail call noalias i8* @malloc(i64 48) #5
  %42 = bitcast i8* %call51 to i64*
  store i64 70, i64* %42, align 8
  %arrayidx53 = getelementptr inbounds i8, i8* %call51, i64 8
  %43 = bitcast i8* %arrayidx53 to i64*
  store i64 111, i64* %43, align 8
  %arrayidx54 = getelementptr inbounds i8, i8* %call51, i64 16
  %44 = bitcast i8* %arrayidx54 to i64*
  store i64 117, i64* %44, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %call51, i64 24
  %45 = bitcast i8* %arrayidx55 to i64*
  store i64 110, i64* %45, align 8
  %arrayidx56 = getelementptr inbounds i8, i8* %call51, i64 32
  %46 = bitcast i8* %arrayidx56 to i64*
  store i64 100, i64* %46, align 8
  %arrayidx57 = getelementptr inbounds i8, i8* %call51, i64 40
  %47 = bitcast i8* %arrayidx57 to i64*
  store i64 32, i64* %47, align 8
  tail call void @printf_s(i64* %42, i64 6) #5
  %call58 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i64 %call10) #5
  %call59 = tail call noalias i8* @malloc(i64 88) #5
  %48 = bitcast i8* %call59 to i64*
  store i64 32, i64* %48, align 8
  %arrayidx61 = getelementptr inbounds i8, i8* %call59, i64 8
  %49 = bitcast i8* %arrayidx61 to i64*
  store i64 115, i64* %49, align 8
  %arrayidx62 = getelementptr inbounds i8, i8* %call59, i64 16
  %50 = bitcast i8* %arrayidx62 to i64*
  store i64 111, i64* %50, align 8
  %arrayidx63 = getelementptr inbounds i8, i8* %call59, i64 24
  %51 = bitcast i8* %arrayidx63 to i64*
  store i64 108, i64* %51, align 8
  %arrayidx64 = getelementptr inbounds i8, i8* %call59, i64 32
  %52 = bitcast i8* %arrayidx64 to i64*
  store i64 117, i64* %52, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %call59, i64 40
  %53 = bitcast i8* %arrayidx65 to i64*
  store i64 116, i64* %53, align 8
  %arrayidx66 = getelementptr inbounds i8, i8* %call59, i64 48
  %54 = bitcast i8* %arrayidx66 to i64*
  store i64 105, i64* %54, align 8
  %arrayidx67 = getelementptr inbounds i8, i8* %call59, i64 56
  %55 = bitcast i8* %arrayidx67 to i64*
  store i64 111, i64* %55, align 8
  %arrayidx68 = getelementptr inbounds i8, i8* %call59, i64 64
  %56 = bitcast i8* %arrayidx68 to i64*
  store i64 110, i64* %56, align 8
  %arrayidx69 = getelementptr inbounds i8, i8* %call59, i64 72
  %57 = bitcast i8* %arrayidx69 to i64*
  store i64 115, i64* %57, align 8
  %arrayidx70 = getelementptr inbounds i8, i8* %call59, i64 80
  %58 = bitcast i8* %arrayidx70 to i64*
  store i64 46, i64* %58, align 8
  tail call void @println_s(i64* %48, i64 11) #5
  br label %blklab23

blklab23:                                         ; preds = %entry.split, %for.end
  tail call void @exit(i32 0) #7
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

declare void @println_s(i64*, i64) #2

declare void @printf_s(i64*, i64) #2

declare i32 @putchar(i32)

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"}
