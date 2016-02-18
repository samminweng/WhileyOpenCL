; ModuleID = 'MatrixMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [47 x i8] c"Pass %d X %d matrix test case (C[N][N] =%d) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array(i32* %array, i32 %value) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry.split, %for.inc4
  %indvars.iv4 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next5, %for.inc4 ]
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %0 = shl i64 %indvars.iv4, 10
  %1 = add nuw nsw i64 %indvars.iv, %0
  %arrayidx = getelementptr inbounds i32, i32* %array, i64 %1
  store i32 %value, i32* %arrayidx, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 1024
  br i1 %exitcond, label %for.body3, label %for.inc4

for.inc4:                                         ; preds = %for.body3
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond7 = icmp ne i64 %indvars.iv.next5, 1024
  br i1 %exitcond7, label %for.cond1.preheader, label %for.end6

for.end6:                                         ; preds = %for.inc4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 4194304) #3
  %0 = bitcast i8* %call to i32*
  %call1 = tail call noalias i8* @malloc(i64 4194304) #3
  %1 = bitcast i8* %call1 to i32*
  %call2 = tail call noalias i8* @malloc(i64 4194304) #3
  %2 = bitcast i8* %call2 to i32*
  tail call void @init_array(i32* %0, i32 1)
  tail call void @init_array(i32* %1, i32 1)
  tail call void @init_array(i32* %2, i32 0)
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %entry.split, %for.inc30
  %indvars.iv13 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next14, %for.inc30 ]
  br label %for.body5

for.body5:                                        ; preds = %for.cond3.preheader, %for.inc27
  %indvars.iv7 = phi i64 [ 0, %for.cond3.preheader ], [ %indvars.iv.next8, %for.inc27 ]
  %3 = shl i64 %indvars.iv13, 10
  %4 = add nuw nsw i64 %indvars.iv7, %3
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %4
  store i32 0, i32* %arrayidx, align 4
  br label %for.body8

for.body8:                                        ; preds = %for.body5, %for.body8
  %indvars.iv = phi i64 [ 0, %for.body5 ], [ %indvars.iv.next, %for.body8 ]
  %5 = shl i64 %indvars.iv13, 10
  %6 = add nuw nsw i64 %indvars.iv7, %5
  %arrayidx12 = getelementptr inbounds i32, i32* %2, i64 %6
  %7 = load i32, i32* %arrayidx12, align 4
  %8 = shl i64 %indvars.iv13, 10
  %9 = add nuw nsw i64 %indvars.iv, %8
  %arrayidx16 = getelementptr inbounds i32, i32* %0, i64 %9
  %10 = load i32, i32* %arrayidx16, align 4
  %11 = shl i64 %indvars.iv, 10
  %12 = add nuw nsw i64 %11, %indvars.iv7
  %arrayidx20 = getelementptr inbounds i32, i32* %1, i64 %12
  %13 = load i32, i32* %arrayidx20, align 4
  %mul21 = mul nsw i32 %13, %10
  %add22 = add nsw i32 %mul21, %7
  %14 = shl i64 %indvars.iv13, 10
  %15 = add nuw nsw i64 %indvars.iv7, %14
  %arrayidx26 = getelementptr inbounds i32, i32* %2, i64 %15
  store i32 %add22, i32* %arrayidx26, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 1024
  br i1 %exitcond, label %for.body8, label %for.inc27

for.inc27:                                        ; preds = %for.body8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond12 = icmp ne i64 %indvars.iv.next8, 1024
  br i1 %exitcond12, label %for.body5, label %for.inc30

for.inc30:                                        ; preds = %for.inc27
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond19 = icmp ne i64 %indvars.iv.next14, 1024
  br i1 %exitcond19, label %for.cond3.preheader, label %for.end32

for.end32:                                        ; preds = %for.inc30
  %arrayidx33 = getelementptr inbounds i8, i8* %call2, i64 4194300
  %16 = bitcast i8* %arrayidx33 to i32*
  %17 = load i32, i32* %16, align 4
  %call34 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str, i64 0, i64 0), i32 1024, i32 1024, i32 %17) #3
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
