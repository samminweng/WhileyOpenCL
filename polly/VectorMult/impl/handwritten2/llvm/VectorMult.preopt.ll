; ModuleID = 'VectorMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [256 x i32] zeroinitializer, align 16
@v = common global [256 x i32] zeroinitializer, align 16
@p = common global [256 x i32] zeroinitializer, align 16
@sum = common global [268435456 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry.split, %for.end
  %r.05 = phi i64 [ 0, %entry.split ], [ %inc16, %for.end ]
  br label %for.body3

for.cond19.preheader:                             ; preds = %for.end
  br label %for.inc24

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %tmp.04 = phi i32 [ 0, %for.cond1.preheader ], [ %add, %for.body3 ]
  %arrayidx = getelementptr inbounds [256 x i32], [256 x i32]* @u, i64 0, i64 %indvars.iv
  store i32 1, i32* %arrayidx, align 4
  %arrayidx5 = getelementptr inbounds [256 x i32], [256 x i32]* @v, i64 0, i64 %indvars.iv
  store i32 1, i32* %arrayidx5, align 4
  %arrayidx7 = getelementptr inbounds [256 x i32], [256 x i32]* @u, i64 0, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx7, align 4
  %arrayidx9 = getelementptr inbounds [256 x i32], [256 x i32]* @v, i64 0, i64 %indvars.iv
  %1 = load i32, i32* %arrayidx9, align 4
  %mul = mul nsw i32 %1, %0
  %arrayidx11 = getelementptr inbounds [256 x i32], [256 x i32]* @p, i64 0, i64 %indvars.iv
  store i32 %mul, i32* %arrayidx11, align 4
  %arrayidx13 = getelementptr inbounds [256 x i32], [256 x i32]* @p, i64 0, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx13, align 4
  %add = add nsw i32 %2, %tmp.04
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond6 = icmp ne i64 %indvars.iv.next, 256
  br i1 %exitcond6, label %for.body3, label %for.end

for.end:                                          ; preds = %for.body3
  %add.lcssa = phi i32 [ %add, %for.body3 ]
  %arrayidx14 = getelementptr inbounds [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %r.05
  store i32 %add.lcssa, i32* %arrayidx14, align 4
  %inc16 = add nuw nsw i64 %r.05, 1
  %exitcond7 = icmp ne i64 %inc16, 268435456
  br i1 %exitcond7, label %for.cond1.preheader, label %for.cond19.preheader

for.inc24:                                        ; preds = %for.cond19.preheader, %for.inc24
  %total.02 = phi i64 [ 0, %for.cond19.preheader ], [ %add23, %for.inc24 ]
  %r.11 = phi i64 [ 0, %for.cond19.preheader ], [ %inc25, %for.inc24 ]
  %arrayidx22 = getelementptr inbounds [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %r.11
  %3 = load i32, i32* %arrayidx22, align 4
  %conv = sext i32 %3 to i64
  %add23 = add nsw i64 %conv, %total.02
  %inc25 = add nuw nsw i64 %r.11, 1
  %exitcond = icmp ne i64 %inc25, 268435456
  br i1 %exitcond, label %for.inc24, label %for.end26

for.end26:                                        ; preds = %for.inc24
  %add23.lcssa = phi i64 [ %add23, %for.inc24 ]
  %cmp27 = icmp eq i64 %add23.lcssa, 68719476736
  br i1 %cmp27, label %if.end, label %if.then

if.then:                                          ; preds = %for.end26
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4
  tail call void @exit(i32 -2) #5
  unreachable

if.end:                                           ; preds = %for.end26
  %call29 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4
  %call30 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 68719476736, i32 256, i64 %add23.lcssa) #4
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
