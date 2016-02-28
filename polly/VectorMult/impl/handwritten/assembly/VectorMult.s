; ModuleID = 'VectorMult.c'
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
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %r = alloca i32, align 4
  %i = alloca i32, align 4
  %sum = alloca i64, align 8
  %product = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  store i32 0, i32* %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc24, %entry
  %0 = load i32, i32* %r, align 4
  %cmp = icmp slt i32 %0, 65536
  br i1 %cmp, label %for.body, label %for.end26

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %r, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @p, i64 0, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %2, 65536
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %r, align 4
  %mul = mul nsw i32 %3, 65536
  %4 = load i32, i32* %i, align 4
  %add = add nsw i32 %mul, %4
  %idxprom4 = sext i32 %add to i64
  %arrayidx5 = getelementptr inbounds [0 x i32], [0 x i32]* @u, i64 0, i64 %idxprom4
  store i32 1, i32* %arrayidx5, align 4
  %5 = load i32, i32* %r, align 4
  %mul6 = mul nsw i32 %5, 65536
  %6 = load i32, i32* %i, align 4
  %add7 = add nsw i32 %mul6, %6
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds [0 x i32], [0 x i32]* @v, i64 0, i64 %idxprom8
  store i32 1, i32* %arrayidx9, align 4
  %7 = load i32, i32* %r, align 4
  %idxprom10 = sext i32 %7 to i64
  %arrayidx11 = getelementptr inbounds [0 x i32], [0 x i32]* @p, i64 0, i64 %idxprom10
  %8 = load i32, i32* %arrayidx11, align 4
  %9 = load i32, i32* %r, align 4
  %mul12 = mul nsw i32 %9, 65536
  %10 = load i32, i32* %i, align 4
  %add13 = add nsw i32 %mul12, %10
  %idxprom14 = sext i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds [0 x i32], [0 x i32]* @u, i64 0, i64 %idxprom14
  %11 = load i32, i32* %arrayidx15, align 4
  %12 = load i32, i32* %r, align 4
  %mul16 = mul nsw i32 %12, 65536
  %13 = load i32, i32* %i, align 4
  %add17 = add nsw i32 %mul16, %13
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds [0 x i32], [0 x i32]* @v, i64 0, i64 %idxprom18
  %14 = load i32, i32* %arrayidx19, align 4
  %mul20 = mul nsw i32 %11, %14
  %add21 = add nsw i32 %8, %mul20
  %15 = load i32, i32* %r, align 4
  %idxprom22 = sext i32 %15 to i64
  %arrayidx23 = getelementptr inbounds [0 x i32], [0 x i32]* @p, i64 0, i64 %idxprom22
  store i32 %add21, i32* %arrayidx23, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %16 = load i32, i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc24

for.inc24:                                        ; preds = %for.end
  %17 = load i32, i32* %r, align 4
  %inc25 = add nsw i32 %17, 1
  store i32 %inc25, i32* %r, align 4
  br label %for.cond

for.end26:                                        ; preds = %for.cond
  store i64 0, i64* %sum, align 8
  store i32 0, i32* %r, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc33, %for.end26
  %18 = load i32, i32* %r, align 4
  %cmp28 = icmp slt i32 %18, 65536
  br i1 %cmp28, label %for.body29, label %for.end35

for.body29:                                       ; preds = %for.cond27
  %19 = load i64, i64* %sum, align 8
  %20 = load i32, i32* %r, align 4
  %idxprom30 = sext i32 %20 to i64
  %arrayidx31 = getelementptr inbounds [0 x i32], [0 x i32]* @p, i64 0, i64 %idxprom30
  %21 = load i32, i32* %arrayidx31, align 4
  %conv = sext i32 %21 to i64
  %add32 = add nsw i64 %19, %conv
  store i64 %add32, i64* %sum, align 8
  br label %for.inc33

for.inc33:                                        ; preds = %for.body29
  %22 = load i32, i32* %r, align 4
  %inc34 = add nsw i32 %22, 1
  store i32 %inc34, i32* %r, align 4
  br label %for.cond27

for.end35:                                        ; preds = %for.cond27
  store i64 4294967296, i64* %product, align 8
  %23 = load i64, i64* %sum, align 8
  %24 = load i64, i64* %product, align 8
  %cmp36 = icmp ne i64 %23, %24
  br i1 %cmp36, label %if.then, label %if.end

if.then:                                          ; preds = %for.end35
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -2) #4
  unreachable

if.end:                                           ; preds = %for.end35
  %call38 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0)) #5
  %25 = load i64, i64* %sum, align 8
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.2, i32 0, i32 0), i32 65536, i32 65536, i64 %25)
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
