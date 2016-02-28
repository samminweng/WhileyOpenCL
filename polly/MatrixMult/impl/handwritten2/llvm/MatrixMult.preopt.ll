; ModuleID = 'MatrixMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i32*, i32, i32 }

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @init(i32 %value, i32 %width, i32 %height) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %mul = mul nsw i32 %height, %width
  %conv = sext i32 %mul to i64
  %mul1 = shl nsw i64 %conv, 2
  %call = tail call noalias i8* @malloc(i64 %mul1) #3
  %0 = bitcast i8* %call to i32*
  %cmp3 = icmp sgt i32 %height, 0
  br i1 %cmp3, label %for.cond3.preheader.lr.ph, label %for.end10

for.cond3.preheader.lr.ph:                        ; preds = %entry.split
  %1 = sext i32 %width to i64
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond3.preheader.lr.ph, %for.inc8
  %indvars.iv7 = phi i64 [ 0, %for.cond3.preheader.lr.ph ], [ %indvars.iv.next8, %for.inc8 ]
  %cmp41 = icmp sgt i32 %width, 0
  br i1 %cmp41, label %for.body6.lr.ph, label %for.inc8

for.body6.lr.ph:                                  ; preds = %for.cond3.preheader
  br label %for.body6

for.body6:                                        ; preds = %for.body6.lr.ph, %for.body6
  %indvars.iv = phi i64 [ 0, %for.body6.lr.ph ], [ %indvars.iv.next, %for.body6 ]
  %2 = mul nsw i64 %indvars.iv7, %1
  %3 = add nsw i64 %indvars.iv, %2
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %3
  store i32 %value, i32* %arrayidx, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp ne i32 %lftr.wideiv, %width
  br i1 %exitcond, label %for.body6, label %for.cond3.for.inc8_crit_edge

for.cond3.for.inc8_crit_edge:                     ; preds = %for.body6
  br label %for.inc8

for.inc8:                                         ; preds = %for.cond3.for.inc8_crit_edge, %for.cond3.preheader
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %lftr.wideiv10 = trunc i64 %indvars.iv.next8 to i32
  %exitcond11 = icmp ne i32 %lftr.wideiv10, %height
  br i1 %exitcond11, label %for.cond3.preheader, label %for.cond.for.end10_crit_edge

for.cond.for.end10_crit_edge:                     ; preds = %for.inc8
  br label %for.end10

for.end10:                                        ; preds = %for.cond.for.end10_crit_edge, %entry.split
  %call11 = tail call noalias i8* @malloc(i64 16) #3
  %4 = bitcast i8* %call11 to %struct.Matrix*
  %5 = bitcast i8* %call11 to i8**
  store i8* %call, i8** %5, align 8
  %width13 = getelementptr inbounds i8, i8* %call11, i64 8
  %6 = bitcast i8* %width13 to i32*
  store i32 %width, i32* %6, align 8
  %height14 = getelementptr inbounds i8, i8* %call11, i64 12
  %7 = bitcast i8* %height14 to i32*
  store i32 %height, i32* %7, align 4
  ret %struct.Matrix* %4
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @matrix_multiply(%struct.Matrix* noalias %A, %struct.Matrix* noalias %B) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 0
  %0 = load i32*, i32** %data, align 8
  %data1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 0
  %1 = load i32*, i32** %data1, align 8
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 1
  %2 = load i32, i32* %width2, align 8
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 2
  %3 = load i32, i32* %height3, align 4
  %mul = mul nsw i32 %3, %2
  %conv = sext i32 %mul to i64
  %mul4 = shl nsw i64 %conv, 2
  %call = tail call noalias i8* @malloc(i64 %mul4) #3
  %4 = bitcast i8* %call to i32*
  %height5 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 2
  %5 = load i32, i32* %height5, align 4
  %cmp6 = icmp sgt i32 %5, 0
  br i1 %cmp6, label %for.cond7.preheader.lr.ph, label %for.end41

for.cond7.preheader.lr.ph:                        ; preds = %entry.split
  %6 = sext i32 %2 to i64
  %7 = sext i32 %2 to i64
  %8 = sext i32 %2 to i64
  %9 = sext i32 %2 to i64
  %10 = sext i32 %2 to i64
  br label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.cond7.preheader.lr.ph, %for.inc39
  %indvars.iv17 = phi i64 [ 0, %for.cond7.preheader.lr.ph ], [ %indvars.iv.next18, %for.inc39 ]
  %width8 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 1
  %11 = load i32, i32* %width8, align 8
  %cmp93 = icmp sgt i32 %11, 0
  br i1 %cmp93, label %for.body11.lr.ph, label %for.inc39

for.body11.lr.ph:                                 ; preds = %for.cond7.preheader
  br label %for.body11

for.body11:                                       ; preds = %for.body11.lr.ph, %for.inc36
  %indvars.iv12 = phi i64 [ 0, %for.body11.lr.ph ], [ %indvars.iv.next13, %for.inc36 ]
  %12 = mul nsw i64 %indvars.iv17, %10
  %13 = add nsw i64 %indvars.iv12, %12
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %13
  store i32 0, i32* %arrayidx, align 4
  %width14 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 1
  %14 = load i32, i32* %width14, align 8
  %cmp151 = icmp sgt i32 %14, 0
  br i1 %cmp151, label %for.body17.lr.ph, label %for.inc36

for.body17.lr.ph:                                 ; preds = %for.body11
  br label %for.body17

for.body17:                                       ; preds = %for.body17.lr.ph, %for.body17
  %indvars.iv = phi i64 [ 0, %for.body17.lr.ph ], [ %indvars.iv.next, %for.body17 ]
  %15 = mul nsw i64 %indvars.iv17, %9
  %16 = add nsw i64 %indvars.iv12, %15
  %arrayidx21 = getelementptr inbounds i32, i32* %4, i64 %16
  %17 = load i32, i32* %arrayidx21, align 4
  %18 = mul nsw i64 %indvars.iv17, %8
  %19 = add nsw i64 %indvars.iv, %18
  %arrayidx25 = getelementptr inbounds i32, i32* %0, i64 %19
  %20 = load i32, i32* %arrayidx25, align 4
  %21 = mul nsw i64 %indvars.iv, %6
  %22 = add nsw i64 %21, %indvars.iv12
  %arrayidx29 = getelementptr inbounds i32, i32* %1, i64 %22
  %23 = load i32, i32* %arrayidx29, align 4
  %mul30 = mul nsw i32 %23, %20
  %add31 = add nsw i32 %mul30, %17
  %24 = mul nsw i64 %indvars.iv17, %7
  %25 = add nsw i64 %indvars.iv12, %24
  %arrayidx35 = getelementptr inbounds i32, i32* %4, i64 %25
  store i32 %add31, i32* %arrayidx35, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = load i32, i32* %width14, align 8
  %27 = sext i32 %26 to i64
  %cmp15 = icmp slt i64 %indvars.iv.next, %27
  br i1 %cmp15, label %for.body17, label %for.cond13.for.inc36_crit_edge

for.cond13.for.inc36_crit_edge:                   ; preds = %for.body17
  br label %for.inc36

for.inc36:                                        ; preds = %for.cond13.for.inc36_crit_edge, %for.body11
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %28 = load i32, i32* %width8, align 8
  %29 = sext i32 %28 to i64
  %cmp9 = icmp slt i64 %indvars.iv.next13, %29
  br i1 %cmp9, label %for.body11, label %for.cond7.for.inc39_crit_edge

for.cond7.for.inc39_crit_edge:                    ; preds = %for.inc36
  br label %for.inc39

for.inc39:                                        ; preds = %for.cond7.for.inc39_crit_edge, %for.cond7.preheader
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %30 = load i32, i32* %height5, align 4
  %31 = sext i32 %30 to i64
  %cmp = icmp slt i64 %indvars.iv.next18, %31
  br i1 %cmp, label %for.cond7.preheader, label %for.cond.for.end41_crit_edge

for.cond.for.end41_crit_edge:                     ; preds = %for.inc39
  br label %for.end41

for.end41:                                        ; preds = %for.cond.for.end41_crit_edge, %entry.split
  %call42 = tail call noalias i8* @malloc(i64 16) #3
  %32 = bitcast i8* %call42 to %struct.Matrix*
  %33 = bitcast i8* %call42 to i8**
  store i8* %call, i8** %33, align 8
  %width44 = getelementptr inbounds i8, i8* %call42, i64 8
  %34 = bitcast i8* %width44 to i32*
  store i32 %2, i32* %34, align 8
  %height45 = getelementptr inbounds i8, i8* %call42, i64 12
  %35 = bitcast i8* %height45 to i32*
  store i32 %3, i32* %35, align 4
  ret %struct.Matrix* %32
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #3
  %0 = load i64*, i64** %call, align 8
  %call1 = tail call i64 @parseStringToInt(i64* %0) #3
  %conv = trunc i64 %call1 to i32
  %call2 = tail call %struct.Matrix* @init(i32 1, i32 %conv, i32 %conv)
  %call3 = tail call %struct.Matrix* @init(i32 1, i32 %conv, i32 %conv)
  %call4 = tail call %struct.Matrix* @matrix_multiply(%struct.Matrix* %call2, %struct.Matrix* %call3)
  %sub = add nsw i32 %conv, -1
  %sub5 = add nsw i32 %conv, -1
  %add = shl i64 %call1, 32
  %sub7 = mul i64 %add, %call1
  %sext = add i64 %sub7, -4294967296
  %idxprom = ashr exact i64 %sext, 32
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0
  %1 = load i32*, i32** %data, align 8
  %arrayidx8 = getelementptr inbounds i32, i32* %1, i64 %idxprom
  %2 = load i32, i32* %arrayidx8, align 4
  %call9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv, i32 %sub, i32 %sub5, i32 %2) #3
  ret i32 0
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64 @parseStringToInt(i64*) #2

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
