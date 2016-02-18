; ModuleID = 'MatrixMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define i64* @init_array(i64 %value) #0 {
entry:
  %call = call noalias i8* @malloc(i64 8388608) #3
  %0 = bitcast i8* %call to i64*
  br label %for.cond

for.cond:                                         ; preds = %for.inc20, %entry
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc20 ], [ 0, %entry ]
  %exitcond = icmp ne i64 %indvars.iv8, 1024
  br i1 %exitcond, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body ]
  %cmp2 = icmp slt i64 %indvars.iv, 1024
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %1 = mul nuw nsw i64 %indvars.iv8, 1024
  %2 = add nuw nsw i64 %1, %indvars.iv
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 %2
  store i64 %value, i64* %arrayidx, align 8
  %3 = mul nuw nsw i64 %indvars.iv8, 1024
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = add nuw nsw i64 %4, 1
  %arrayidx8 = getelementptr inbounds i64, i64* %0, i64 %5
  store i64 %value, i64* %arrayidx8, align 8
  %6 = mul nuw nsw i64 %indvars.iv8, 1024
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = add nuw nsw i64 %7, 2
  %arrayidx13 = getelementptr inbounds i64, i64* %0, i64 %8
  store i64 %value, i64* %arrayidx13, align 8
  %9 = mul nuw nsw i64 %indvars.iv8, 1024
  %10 = add nuw nsw i64 %9, %indvars.iv
  %11 = add nuw nsw i64 %10, 3
  %arrayidx18 = getelementptr inbounds i64, i64* %0, i64 %11
  store i64 %value, i64* %arrayidx18, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc20

for.inc20:                                        ; preds = %for.end
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  br label %for.cond

for.end21:                                        ; preds = %for.cond
  ret i64* %0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  %call = call i64* @init_array(i64 1)
  %call1 = call i64* @init_array(i64 1)
  %call2 = call i64* @init_array(i64 0)
  br label %for.cond

for.cond:                                         ; preds = %for.inc22, %entry
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc22 ], [ 0, %entry ]
  %exitcond12 = icmp ne i64 %indvars.iv8, 1024
  br i1 %exitcond12, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc19, %for.body
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.inc19 ], [ 0, %for.body ]
  %exitcond7 = icmp ne i64 %indvars.iv4, 1024
  br i1 %exitcond7, label %for.body5, label %for.end21

for.body5:                                        ; preds = %for.cond3
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body5
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body5 ]
  %tmp.0 = phi i64 [ 0, %for.body5 ], [ %add14, %for.inc ]
  %exitcond = icmp ne i64 %indvars.iv, 1024
  br i1 %exitcond, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %0 = mul nuw nsw i64 %indvars.iv8, 1024
  %1 = add nuw nsw i64 %0, %indvars.iv
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %1
  %2 = load i64, i64* %arrayidx, align 8
  %3 = mul nuw nsw i64 %indvars.iv, 1024
  %4 = add nuw nsw i64 %3, %indvars.iv4
  %arrayidx12 = getelementptr inbounds i64, i64* %call1, i64 %4
  %5 = load i64, i64* %arrayidx12, align 8
  %mul13 = mul nsw i64 %2, %5
  %add14 = add nsw i64 %tmp.0, %mul13
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  %tmp.0.lcssa = phi i64 [ %tmp.0, %for.cond6 ]
  %6 = mul nuw nsw i64 %indvars.iv8, 1024
  %7 = add nuw nsw i64 %6, %indvars.iv4
  %arrayidx18 = getelementptr inbounds i64, i64* %call2, i64 %7
  store i64 %tmp.0.lcssa, i64* %arrayidx18, align 8
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  br label %for.cond3

for.end21:                                        ; preds = %for.cond3
  br label %for.inc22

for.inc22:                                        ; preds = %for.end21
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  br label %for.cond

for.end24:                                        ; preds = %for.cond
  %arrayidx25 = getelementptr inbounds i64, i64* %call2, i64 1048575
  %8 = load i64, i64* %arrayidx25, align 8
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i32 0, i32 0), i32 1024, i32 1024, i64 %8)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
