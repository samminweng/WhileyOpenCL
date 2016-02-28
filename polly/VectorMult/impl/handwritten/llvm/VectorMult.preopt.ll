; ModuleID = 'VectorMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@p = common global [65536 x i32] zeroinitializer, align 16
@u = common global [65536 x i32] zeroinitializer, align 16
@v = common global [65536 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [76 x i8] c"Pass the %'d X %'d vector multiplication test case with dot Product = %'lld\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %for.body

for.cond19.preheader:                             ; preds = %for.inc16
  br label %for.inc25

for.body:                                         ; preds = %entry.split, %for.inc16
  %indvars.iv8 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next9, %for.inc16 ]
  %arrayidx = getelementptr inbounds [65536 x i32], [65536 x i32]* @p, i64 0, i64 %indvars.iv8
  store i32 0, i32* %arrayidx, align 4
  br label %for.body3

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv5 = phi i64 [ 0, %for.body ], [ %indvars.iv.next6, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [65536 x i32], [65536 x i32]* @u, i64 0, i64 %indvars.iv5
  store i32 1, i32* %arrayidx5, align 4
  %arrayidx7 = getelementptr inbounds [65536 x i32], [65536 x i32]* @v, i64 0, i64 %indvars.iv5
  store i32 1, i32* %arrayidx7, align 4
  %arrayidx9 = getelementptr inbounds [65536 x i32], [65536 x i32]* @p, i64 0, i64 %indvars.iv8
  %0 = load i32, i32* %arrayidx9, align 4
  %arrayidx11 = getelementptr inbounds [65536 x i32], [65536 x i32]* @u, i64 0, i64 %indvars.iv5
  %1 = load i32, i32* %arrayidx11, align 4
  %arrayidx13 = getelementptr inbounds [65536 x i32], [65536 x i32]* @v, i64 0, i64 %indvars.iv5
  %2 = load i32, i32* %arrayidx13, align 4
  %mul = mul nsw i32 %2, %1
  %add = add nsw i32 %mul, %0
  %arrayidx15 = getelementptr inbounds [65536 x i32], [65536 x i32]* @p, i64 0, i64 %indvars.iv8
  store i32 %add, i32* %arrayidx15, align 4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp ne i64 %indvars.iv.next6, 65536
  br i1 %exitcond7, label %for.body3, label %for.inc16

for.inc16:                                        ; preds = %for.body3
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp ne i64 %indvars.iv.next9, 65536
  br i1 %exitcond10, label %for.body, label %for.cond19.preheader

for.inc25:                                        ; preds = %for.cond19.preheader, %for.inc25
  %indvars.iv = phi i64 [ 0, %for.cond19.preheader ], [ %indvars.iv.next, %for.inc25 ]
  %sum.02 = phi i64 [ 0, %for.cond19.preheader ], [ %add24, %for.inc25 ]
  %arrayidx23 = getelementptr inbounds [65536 x i32], [65536 x i32]* @p, i64 0, i64 %indvars.iv
  %3 = load i32, i32* %arrayidx23, align 4
  %conv = sext i32 %3 to i64
  %add24 = add nsw i64 %conv, %sum.02
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 65536
  br i1 %exitcond, label %for.inc25, label %for.end27

for.end27:                                        ; preds = %for.inc25
  %add24.lcssa = phi i64 [ %add24, %for.inc25 ]
  %cmp28 = icmp eq i64 %add24.lcssa, 4294967296
  br i1 %cmp28, label %if.end, label %if.then

if.then:                                          ; preds = %for.end27
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4
  tail call void @exit(i32 -2) #5
  unreachable

if.end:                                           ; preds = %for.end27
  %call30 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4
  %call31 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.2, i64 0, i64 0), i32 65536, i32 65536, i64 %add24.lcssa) #4
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
