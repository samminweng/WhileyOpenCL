; ModuleID = 'VectorMult.c'
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
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %r = alloca i64, align 8
  %tmp = alloca i32, align 4
  %total = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  store i64 0, i64* %r, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %0 = load i64, i64* %r, align 8
  %cmp = icmp slt i64 %0, 268435456
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %tmp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %1, 256
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [256 x i32], [256 x i32]* @u, i64 0, i64 %idxprom
  store i32 1, i32* %arrayidx, align 4
  %3 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %3 to i64
  %arrayidx5 = getelementptr inbounds [256 x i32], [256 x i32]* @v, i64 0, i64 %idxprom4
  store i32 1, i32* %arrayidx5, align 4
  %4 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %4 to i64
  %arrayidx7 = getelementptr inbounds [256 x i32], [256 x i32]* @u, i64 0, i64 %idxprom6
  %5 = load i32, i32* %arrayidx7, align 4
  %6 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %6 to i64
  %arrayidx9 = getelementptr inbounds [256 x i32], [256 x i32]* @v, i64 0, i64 %idxprom8
  %7 = load i32, i32* %arrayidx9, align 4
  %mul = mul nsw i32 %5, %7
  %8 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %8 to i64
  %arrayidx11 = getelementptr inbounds [256 x i32], [256 x i32]* @p, i64 0, i64 %idxprom10
  store i32 %mul, i32* %arrayidx11, align 4
  %9 = load i32, i32* %tmp, align 4
  %10 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %10 to i64
  %arrayidx13 = getelementptr inbounds [256 x i32], [256 x i32]* @p, i64 0, i64 %idxprom12
  %11 = load i32, i32* %arrayidx13, align 4
  %add = add nsw i32 %9, %11
  store i32 %add, i32* %tmp, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %13 = load i32, i32* %tmp, align 4
  %14 = load i64, i64* %r, align 8
  %arrayidx14 = getelementptr inbounds [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %14
  store i32 %13, i32* %arrayidx14, align 4
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %15 = load i64, i64* %r, align 8
  %inc16 = add nsw i64 %15, 1
  store i64 %inc16, i64* %r, align 8
  br label %for.cond

for.end17:                                        ; preds = %for.cond
  store i64 0, i64* %total, align 8
  store i64 0, i64* %r, align 8
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc24, %for.end17
  %16 = load i64, i64* %r, align 8
  %cmp20 = icmp slt i64 %16, 268435456
  br i1 %cmp20, label %for.body21, label %for.end26

for.body21:                                       ; preds = %for.cond19
  %17 = load i64, i64* %total, align 8
  %18 = load i64, i64* %r, align 8
  %arrayidx22 = getelementptr inbounds [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %18
  %19 = load i32, i32* %arrayidx22, align 4
  %conv = sext i32 %19 to i64
  %add23 = add nsw i64 %17, %conv
  store i64 %add23, i64* %total, align 8
  br label %for.inc24

for.inc24:                                        ; preds = %for.body21
  %20 = load i64, i64* %r, align 8
  %inc25 = add nsw i64 %20, 1
  store i64 %inc25, i64* %r, align 8
  br label %for.cond19

for.end26:                                        ; preds = %for.cond19
  %21 = load i64, i64* %total, align 8
  %cmp27 = icmp ne i64 %21, 68719476736
  br i1 %cmp27, label %if.then, label %if.end

if.then:                                          ; preds = %for.end26
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -2) #4
  unreachable

if.end:                                           ; preds = %for.end26
  %call29 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0)) #5
  %22 = load i64, i64* %total, align 8
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i32 0, i32 0), i64 68719476736, i32 256, i64 %22)
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
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
