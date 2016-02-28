; ModuleID = 'VectorMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@p = common global [0 x i32] zeroinitializer, align 4
@u = common global [0 x i32] zeroinitializer, align 4
@v = common global [0 x i32] zeroinitializer, align 4
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [76 x i8] c"Pass the %'d X %'d vector multiplication test case with dot Product = %'lld\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %for.body

for.cond27.preheader:                             ; preds = %for.inc24
  br label %for.inc33

for.body:                                         ; preds = %entry.split, %for.inc24
  %indvars.iv12 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next13, %for.inc24 ]
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @p, i64 0, i64 %indvars.iv12
  store i32 0, i32* %arrayidx, align 4
  br label %for.body3

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv5 = phi i64 [ 0, %for.body ], [ %indvars.iv.next6, %for.body3 ]
  %0 = trunc i64 %indvars.iv12 to i32
  %mul = shl i32 %0, 16
  %1 = sext i32 %mul to i64
  %2 = add nuw nsw i64 %indvars.iv5, %1
  %arrayidx5 = getelementptr inbounds [0 x i32], [0 x i32]* @u, i64 0, i64 %2
  store i32 1, i32* %arrayidx5, align 4
  %3 = trunc i64 %indvars.iv12 to i32
  %mul6 = shl i32 %3, 16
  %4 = sext i32 %mul6 to i64
  %5 = add nuw nsw i64 %indvars.iv5, %4
  %arrayidx9 = getelementptr inbounds [0 x i32], [0 x i32]* @v, i64 0, i64 %5
  store i32 1, i32* %arrayidx9, align 4
  %arrayidx11 = getelementptr inbounds [0 x i32], [0 x i32]* @p, i64 0, i64 %indvars.iv12
  %6 = load i32, i32* %arrayidx11, align 4
  %7 = trunc i64 %indvars.iv12 to i32
  %mul12 = shl i32 %7, 16
  %8 = sext i32 %mul12 to i64
  %9 = add nuw nsw i64 %indvars.iv5, %8
  %arrayidx15 = getelementptr inbounds [0 x i32], [0 x i32]* @u, i64 0, i64 %9
  %10 = load i32, i32* %arrayidx15, align 4
  %11 = trunc i64 %indvars.iv12 to i32
  %mul16 = shl i32 %11, 16
  %12 = sext i32 %mul16 to i64
  %13 = add nuw nsw i64 %indvars.iv5, %12
  %arrayidx19 = getelementptr inbounds [0 x i32], [0 x i32]* @v, i64 0, i64 %13
  %14 = load i32, i32* %arrayidx19, align 4
  %mul20 = mul nsw i32 %14, %10
  %add21 = add nsw i32 %mul20, %6
  %arrayidx23 = getelementptr inbounds [0 x i32], [0 x i32]* @p, i64 0, i64 %indvars.iv12
  store i32 %add21, i32* %arrayidx23, align 4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond11 = icmp ne i64 %indvars.iv.next6, 65536
  br i1 %exitcond11, label %for.body3, label %for.inc24

for.inc24:                                        ; preds = %for.body3
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp ne i64 %indvars.iv.next13, 65536
  br i1 %exitcond14, label %for.body, label %for.cond27.preheader

for.inc33:                                        ; preds = %for.cond27.preheader, %for.inc33
  %indvars.iv = phi i64 [ 0, %for.cond27.preheader ], [ %indvars.iv.next, %for.inc33 ]
  %sum.02 = phi i64 [ 0, %for.cond27.preheader ], [ %add32, %for.inc33 ]
  %arrayidx31 = getelementptr inbounds [0 x i32], [0 x i32]* @p, i64 0, i64 %indvars.iv
  %15 = load i32, i32* %arrayidx31, align 4
  %conv = sext i32 %15 to i64
  %add32 = add nsw i64 %conv, %sum.02
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 65536
  br i1 %exitcond, label %for.inc33, label %for.end35

for.end35:                                        ; preds = %for.inc33
  %add32.lcssa = phi i64 [ %add32, %for.inc33 ]
  %cmp36 = icmp eq i64 %add32.lcssa, 4294967296
  br i1 %cmp36, label %if.end, label %if.then

if.then:                                          ; preds = %for.end35
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4
  tail call void @exit(i32 -2) #5
  unreachable

if.end:                                           ; preds = %for.end35
  %call38 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4
  %call39 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.2, i64 0, i64 0), i32 65536, i32 65536, i64 %add32.lcssa) #4
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
