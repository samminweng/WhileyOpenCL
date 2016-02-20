; ModuleID = 'MatrixMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i32*, i32, i32 }

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @init(i32 %value) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 4194304) #3
  %0 = bitcast i8* %call to i32*
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry.split, %for.inc4
  %indvars.iv4 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next5, %for.inc4 ]
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %1 = shl i64 %indvars.iv4, 10
  %2 = add nuw nsw i64 %indvars.iv, %1
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %2
  store i32 %value, i32* %arrayidx, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 1024
  br i1 %exitcond, label %for.body3, label %for.inc4

for.inc4:                                         ; preds = %for.body3
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond7 = icmp ne i64 %indvars.iv.next5, 1024
  br i1 %exitcond7, label %for.cond1.preheader, label %for.end6

for.end6:                                         ; preds = %for.inc4
  %call7 = tail call noalias i8* @malloc(i64 16) #3
  %3 = bitcast i8* %call7 to %struct.Matrix*
  %4 = bitcast i8* %call7 to i8**
  store i8* %call, i8** %4, align 8
  ret %struct.Matrix* %3
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @matrix_multiply(%struct.Matrix* noalias %A, %struct.Matrix* noalias %B) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 4194304) #3
  %0 = bitcast i8* %call to i32*
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 0
  %1 = load i32*, i32** %data, align 8
  %data1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 0
  %2 = load i32*, i32** %data1, align 8
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %entry.split, %for.inc29
  %indvars.iv13 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next14, %for.inc29 ]
  br label %for.body4

for.body4:                                        ; preds = %for.cond2.preheader, %for.inc26
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next8, %for.inc26 ]
  %3 = shl i64 %indvars.iv13, 10
  %4 = add nuw nsw i64 %indvars.iv7, %3
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %4
  store i32 0, i32* %arrayidx, align 4
  br label %for.body7

for.body7:                                        ; preds = %for.body4, %for.body7
  %indvars.iv = phi i64 [ 0, %for.body4 ], [ %indvars.iv.next, %for.body7 ]
  %5 = shl i64 %indvars.iv13, 10
  %6 = add nuw nsw i64 %indvars.iv7, %5
  %arrayidx11 = getelementptr inbounds i32, i32* %0, i64 %6
  %7 = load i32, i32* %arrayidx11, align 4
  %8 = shl i64 %indvars.iv13, 10
  %9 = add nuw nsw i64 %indvars.iv, %8
  %arrayidx15 = getelementptr inbounds i32, i32* %1, i64 %9
  %10 = load i32, i32* %arrayidx15, align 4
  %11 = shl i64 %indvars.iv, 10
  %12 = add nuw nsw i64 %11, %indvars.iv7
  %arrayidx19 = getelementptr inbounds i32, i32* %2, i64 %12
  %13 = load i32, i32* %arrayidx19, align 4
  %mul20 = mul nsw i32 %13, %10
  %add21 = add nsw i32 %mul20, %7
  %14 = shl i64 %indvars.iv13, 10
  %15 = add nuw nsw i64 %indvars.iv7, %14
  %arrayidx25 = getelementptr inbounds i32, i32* %0, i64 %15
  store i32 %add21, i32* %arrayidx25, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 1024
  br i1 %exitcond, label %for.body7, label %for.inc26

for.inc26:                                        ; preds = %for.body7
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond12 = icmp ne i64 %indvars.iv.next8, 1024
  br i1 %exitcond12, label %for.body4, label %for.inc29

for.inc29:                                        ; preds = %for.inc26
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond19 = icmp ne i64 %indvars.iv.next14, 1024
  br i1 %exitcond19, label %for.cond2.preheader, label %for.end31

for.end31:                                        ; preds = %for.inc29
  %call32 = tail call noalias i8* @malloc(i64 16) #3
  %16 = bitcast i8* %call32 to %struct.Matrix*
  %17 = bitcast i8* %call32 to i8**
  store i8* %call, i8** %17, align 8
  ret %struct.Matrix* %16
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call %struct.Matrix* @init(i32 1)
  %call1 = tail call %struct.Matrix* @init(i32 1)
  %call2 = tail call %struct.Matrix* @matrix_multiply(%struct.Matrix* %call, %struct.Matrix* %call1)
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0
  %0 = load i32*, i32** %data, align 8
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 1048575
  %1 = load i32, i32* %arrayidx, align 4
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 1024, i32 1024, i32 1023, i32 1023, i32 %1) #3
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
