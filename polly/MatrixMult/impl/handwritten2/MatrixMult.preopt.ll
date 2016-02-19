; ModuleID = 'MatrixMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32* @init_array(i32 %value) #0 {
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
  ret i32* %0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i32* @matrix_multiply(i32* noalias %A, i32* noalias %B) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 4194304) #3
  %0 = bitcast i8* %call to i32*
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry.split, %for.inc28
  %indvars.iv13 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next14, %for.inc28 ]
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.inc25
  %indvars.iv7 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next8, %for.inc25 ]
  %1 = shl i64 %indvars.iv13, 10
  %2 = add nuw nsw i64 %indvars.iv7, %1
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %2
  store i32 0, i32* %arrayidx, align 4
  br label %for.body6

for.body6:                                        ; preds = %for.body3, %for.body6
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next, %for.body6 ]
  %3 = shl i64 %indvars.iv13, 10
  %4 = add nuw nsw i64 %indvars.iv7, %3
  %arrayidx10 = getelementptr inbounds i32, i32* %0, i64 %4
  %5 = load i32, i32* %arrayidx10, align 4
  %6 = shl i64 %indvars.iv13, 10
  %7 = add nuw nsw i64 %indvars.iv, %6
  %arrayidx14 = getelementptr inbounds i32, i32* %A, i64 %7
  %8 = load i32, i32* %arrayidx14, align 4
  %9 = shl i64 %indvars.iv, 10
  %10 = add nuw nsw i64 %9, %indvars.iv7
  %arrayidx18 = getelementptr inbounds i32, i32* %B, i64 %10
  %11 = load i32, i32* %arrayidx18, align 4
  %mul19 = mul nsw i32 %11, %8
  %add20 = add nsw i32 %mul19, %5
  %12 = shl i64 %indvars.iv13, 10
  %13 = add nuw nsw i64 %indvars.iv7, %12
  %arrayidx24 = getelementptr inbounds i32, i32* %0, i64 %13
  store i32 %add20, i32* %arrayidx24, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 1024
  br i1 %exitcond, label %for.body6, label %for.inc25

for.inc25:                                        ; preds = %for.body6
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond12 = icmp ne i64 %indvars.iv.next8, 1024
  br i1 %exitcond12, label %for.body3, label %for.inc28

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond19 = icmp ne i64 %indvars.iv.next14, 1024
  br i1 %exitcond19, label %for.cond1.preheader, label %for.end30

for.end30:                                        ; preds = %for.inc28
  ret i32* %0
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i32* @init_array(i32 1)
  %call1 = tail call i32* @init_array(i32 1)
  %call2 = tail call i32* @matrix_multiply(i32* %call, i32* %call1)
  %arrayidx = getelementptr inbounds i32, i32* %call2, i64 1048575
  %0 = load i32, i32* %arrayidx, align 4
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 1024, i32 1024, i32 1023, i32 1023, i32 %0) #3
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
