; ModuleID = 'VectorMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [1024 x i32] zeroinitializer, align 16
@v = common global [1024 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry.split, %for.inc10
  %total.04 = phi i64 [ 0, %entry.split ], [ %add.lcssa, %for.inc10 ]
  %r.03 = phi i64 [ 0, %entry.split ], [ %inc11, %for.inc10 ]
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %total.12 = phi i64 [ %total.04, %for.cond1.preheader ], [ %add, %for.body3 ]
  %arrayidx = getelementptr inbounds [1024 x i32], [1024 x i32]* @u, i64 0, i64 %indvars.iv
  store i32 1, i32* %arrayidx, align 4
  %arrayidx5 = getelementptr inbounds [1024 x i32], [1024 x i32]* @v, i64 0, i64 %indvars.iv
  store i32 1, i32* %arrayidx5, align 4
  %arrayidx7 = getelementptr inbounds [1024 x i32], [1024 x i32]* @u, i64 0, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx7, align 4
  %arrayidx9 = getelementptr inbounds [1024 x i32], [1024 x i32]* @v, i64 0, i64 %indvars.iv
  %1 = load i32, i32* %arrayidx9, align 4
  %mul = mul nsw i32 %1, %0
  %conv = sext i32 %mul to i64
  %add = add nsw i64 %conv, %total.12
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 1024
  br i1 %exitcond, label %for.body3, label %for.inc10

for.inc10:                                        ; preds = %for.body3
  %add.lcssa = phi i64 [ %add, %for.body3 ]
  %inc11 = add nuw nsw i64 %r.03, 1
  %exitcond5 = icmp ne i64 %inc11, 67108864
  br i1 %exitcond5, label %for.cond1.preheader, label %for.end12

for.end12:                                        ; preds = %for.inc10
  %add.lcssa.lcssa = phi i64 [ %add.lcssa, %for.inc10 ]
  %cmp13 = icmp eq i64 %add.lcssa.lcssa, 68719476736
  br i1 %cmp13, label %if.end, label %if.then

if.then:                                          ; preds = %for.end12
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4
  tail call void @exit(i32 -2) #5
  unreachable

if.end:                                           ; preds = %for.end12
  %call15 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 68719476736, i32 1024, i64 %add.lcssa.lcssa) #4
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
