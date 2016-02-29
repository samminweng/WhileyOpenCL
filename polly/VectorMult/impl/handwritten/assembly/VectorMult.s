; ModuleID = 'VectorMult.c'
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
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %splits = alloca i64, align 8
  %p = alloca i32*, align 8
  %r = alloca i64, align 8
  %i = alloca i32, align 4
  %sum = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  store i64 16384, i64* %splits, align 8
  %0 = load i64, i64* %splits, align 8
  %mul = mul i64 %0, 4
  %call = call noalias i8* @malloc(i64 %mul) #4
  %1 = bitcast i8* %call to i32*
  store i32* %1, i32** %p, align 8
  store i64 0, i64* %r, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %entry
  %2 = load i64, i64* %r, align 8
  %3 = load i64, i64* %splits, align 8
  %cmp = icmp slt i64 %2, %3
  br i1 %cmp, label %for.body, label %for.end16

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %r, align 8
  %5 = load i32*, i32** %p, align 8
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %4
  store i32 0, i32* %arrayidx, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %6 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %6, 1048576
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %7 = load i32, i32* %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx4 = getelementptr inbounds [1048576 x i32], [1048576 x i32]* @u, i64 0, i64 %idxprom
  store i32 1, i32* %arrayidx4, align 4
  %8 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %8 to i64
  %arrayidx6 = getelementptr inbounds [1048576 x i32], [1048576 x i32]* @v, i64 0, i64 %idxprom5
  store i32 1, i32* %arrayidx6, align 4
  %9 = load i64, i64* %r, align 8
  %10 = load i32*, i32** %p, align 8
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %9
  %11 = load i32, i32* %arrayidx7, align 4
  %12 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %12 to i64
  %arrayidx9 = getelementptr inbounds [1048576 x i32], [1048576 x i32]* @u, i64 0, i64 %idxprom8
  %13 = load i32, i32* %arrayidx9, align 4
  %14 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %14 to i64
  %arrayidx11 = getelementptr inbounds [1048576 x i32], [1048576 x i32]* @v, i64 0, i64 %idxprom10
  %15 = load i32, i32* %arrayidx11, align 4
  %mul12 = mul nsw i32 %13, %15
  %add = add nsw i32 %11, %mul12
  %16 = load i64, i64* %r, align 8
  %17 = load i32*, i32** %p, align 8
  %arrayidx13 = getelementptr inbounds i32, i32* %17, i64 %16
  store i32 %add, i32* %arrayidx13, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %18 = load i32, i32* %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %19 = load i64, i64* %r, align 8
  %inc15 = add nsw i64 %19, 1
  store i64 %inc15, i64* %r, align 8
  br label %for.cond

for.end16:                                        ; preds = %for.cond
  store i64 0, i64* %sum, align 8
  store i64 0, i64* %r, align 8
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc22, %for.end16
  %20 = load i64, i64* %r, align 8
  %21 = load i64, i64* %splits, align 8
  %cmp18 = icmp slt i64 %20, %21
  br i1 %cmp18, label %for.body19, label %for.end24

for.body19:                                       ; preds = %for.cond17
  %22 = load i64, i64* %sum, align 8
  %23 = load i64, i64* %r, align 8
  %24 = load i32*, i32** %p, align 8
  %arrayidx20 = getelementptr inbounds i32, i32* %24, i64 %23
  %25 = load i32, i32* %arrayidx20, align 4
  %conv = sext i32 %25 to i64
  %add21 = add nsw i64 %22, %conv
  store i64 %add21, i64* %sum, align 8
  br label %for.inc22

for.inc22:                                        ; preds = %for.body19
  %26 = load i64, i64* %r, align 8
  %inc23 = add nsw i64 %26, 1
  store i64 %inc23, i64* %r, align 8
  br label %for.cond17

for.end24:                                        ; preds = %for.cond17
  %27 = load i64, i64* %sum, align 8
  %cmp25 = icmp ne i64 %27, 17179869184
  br i1 %cmp25, label %if.then, label %if.end

if.then:                                          ; preds = %for.end24
  %call27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -2) #5
  unreachable

if.end:                                           ; preds = %for.end24
  %call28 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0)) #4
  %28 = load i64, i64* %sum, align 8
  %call29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([102 x i8], [102 x i8]* @.str.2, i32 0, i32 0), i64 17179869184, i32 1048576, i64 %28)
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
