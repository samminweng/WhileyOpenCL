; ModuleID = 'VectorMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [1048576 x i32] zeroinitializer, align 16
@v = common global [1048576 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [102 x i8] c"Pass the %'lld vector multiplication test case with local vectors = %d size.\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 65536) #4
  %0 = bitcast i8* %call to i32*
  br label %for.body

for.cond17.preheader:                             ; preds = %for.inc14
  br label %for.inc22

for.body:                                         ; preds = %entry.split, %for.inc14
  %r.04 = phi i64 [ 0, %entry.split ], [ %inc15, %for.inc14 ]
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %r.04
  store i32 0, i32* %arrayidx, align 4
  br label %for.body3

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx4 = getelementptr inbounds [1048576 x i32], [1048576 x i32]* @u, i64 0, i64 %indvars.iv
  store i32 1, i32* %arrayidx4, align 4
  %arrayidx6 = getelementptr inbounds [1048576 x i32], [1048576 x i32]* @v, i64 0, i64 %indvars.iv
  store i32 1, i32* %arrayidx6, align 4
  %arrayidx7 = getelementptr inbounds i32, i32* %0, i64 %r.04
  %1 = load i32, i32* %arrayidx7, align 4
  %arrayidx9 = getelementptr inbounds [1048576 x i32], [1048576 x i32]* @u, i64 0, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx9, align 4
  %arrayidx11 = getelementptr inbounds [1048576 x i32], [1048576 x i32]* @v, i64 0, i64 %indvars.iv
  %3 = load i32, i32* %arrayidx11, align 4
  %mul12 = mul nsw i32 %3, %2
  %add = add nsw i32 %mul12, %1
  %arrayidx13 = getelementptr inbounds i32, i32* %0, i64 %r.04
  store i32 %add, i32* %arrayidx13, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond5 = icmp ne i64 %indvars.iv.next, 1048576
  br i1 %exitcond5, label %for.body3, label %for.inc14

for.inc14:                                        ; preds = %for.body3
  %inc15 = add nuw nsw i64 %r.04, 1
  %exitcond6 = icmp ne i64 %inc15, 16384
  br i1 %exitcond6, label %for.body, label %for.cond17.preheader

for.inc22:                                        ; preds = %for.cond17.preheader, %for.inc22
  %sum.02 = phi i64 [ 0, %for.cond17.preheader ], [ %add21, %for.inc22 ]
  %r.11 = phi i64 [ 0, %for.cond17.preheader ], [ %inc23, %for.inc22 ]
  %arrayidx20 = getelementptr inbounds i32, i32* %0, i64 %r.11
  %4 = load i32, i32* %arrayidx20, align 4
  %conv = sext i32 %4 to i64
  %add21 = add nsw i64 %conv, %sum.02
  %inc23 = add nuw nsw i64 %r.11, 1
  %exitcond = icmp ne i64 %inc23, 16384
  br i1 %exitcond, label %for.inc22, label %for.end24

for.end24:                                        ; preds = %for.inc22
  %add21.lcssa = phi i64 [ %add21, %for.inc22 ]
  %cmp25 = icmp eq i64 %add21.lcssa, 17179869184
  br i1 %cmp25, label %if.end, label %if.then

if.then:                                          ; preds = %for.end24
  %call27 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4
  tail call void @exit(i32 -2) #5
  unreachable

if.end:                                           ; preds = %for.end24
  %call28 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4
  %call29 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([102 x i8], [102 x i8]* @.str.2, i64 0, i64 0), i64 17179869184, i32 1048576, i64 %add21.lcssa) #4
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 3f10def1e46ea783186be08e2138d0f76a707712) (http://llvm.org/git/llvm.git 626ceb277f4fd20c1899e04490b0ea6c2b1a0da8)"}
