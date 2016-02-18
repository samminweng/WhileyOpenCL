; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array(i64* %array, i64 %value) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc4, %entry.split
  %indvars.iv4 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next5, %for.inc4 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %0 = shl i64 %indvars.iv4, 10
  %1 = add nuw nsw i64 %indvars.iv, %0
  %arrayidx = getelementptr inbounds i64, i64* %array, i64 %1
  store i64 %value, i64* %arrayidx, align 8
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
  %call = tail call noalias i8* @malloc(i64 8388608) #3
  %0 = bitcast i8* %call to i64*
  %call1 = tail call noalias i8* @malloc(i64 8388608) #3
  %1 = bitcast i8* %call1 to i64*
  %call2 = tail call noalias i8* @malloc(i64 8388608) #3
  %2 = bitcast i8* %call2 to i64*
  tail call void @init_array(i64* %0, i64 1)
  tail call void @init_array(i64* %1, i64 1)
  tail call void @init_array(i64* %2, i64 0)
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.inc22, %entry.split
  %indvars.iv12 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next13, %for.inc22 ]
  br label %for.cond6.preheader

for.cond6.preheader:                              ; preds = %for.end, %for.cond3.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond3.preheader ], [ %indvars.iv.next9, %for.end ]
  %3 = shl nsw i64 %indvars.iv12, 10
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond6.preheader
  %indvars.iv = phi i64 [ 0, %for.cond6.preheader ], [ %indvars.iv.next, %for.inc ]
  %tmp.02 = phi i64 [ 0, %for.cond6.preheader ], [ %add14, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 %4
  %5 = load i64, i64* %arrayidx, align 8
  %6 = shl i64 %indvars.iv, 10
  %7 = add nuw nsw i64 %6, %indvars.iv8
  %arrayidx12 = getelementptr inbounds i64, i64* %1, i64 %7
  %8 = load i64, i64* %arrayidx12, align 8
  %mul13 = mul nsw i64 %8, %5
  %add14 = add nsw i64 %mul13, %tmp.02
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 1024
  br i1 %exitcond, label %for.inc, label %for.end

for.end:                                          ; preds = %for.inc
  %add14.lcssa = phi i64 [ %add14, %for.inc ]
  %9 = add nuw nsw i64 %indvars.iv8, %3
  %arrayidx18 = getelementptr inbounds i64, i64* %2, i64 %9
  store i64 %add14.lcssa, i64* %arrayidx18, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp ne i64 %indvars.iv.next9, 1024
  br i1 %exitcond11, label %for.cond6.preheader, label %for.inc22

for.inc22:                                        ; preds = %for.end
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp ne i64 %indvars.iv.next13, 1024
  br i1 %exitcond15, label %for.cond3.preheader, label %for.end24

for.end24:                                        ; preds = %for.inc22
  %arrayidx25 = getelementptr inbounds i8, i8* %call2, i64 8388600
  %10 = bitcast i8* %arrayidx25 to i64*
  %11 = load i64, i64* %10, align 8
  %call26 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i64 0, i64 0), i32 1024, i32 1024, i64 %11) #3
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
