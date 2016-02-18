; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [47 x i8] c"Pass %d X %d matrix test case (C[N][N] =%d) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array(i32* %array, i32 %value) #0 {
entry:
  %array.addr = alloca i32*, align 8
  %value.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %array, i32** %array.addr, align 8
  store i32 %value, i32* %value.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc4, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 1024
  br i1 %cmp, label %for.body, label %for.end6

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 1024
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %value.addr, align 4
  %3 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %3, 1024
  %4 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %4
  %idxprom = sext i32 %add to i64
  %5 = load i32*, i32** %array.addr, align 8
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom
  store i32 %2, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %6 = load i32, i32* %j, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc4

for.inc4:                                         ; preds = %for.end
  %7 = load i32, i32* %i, align 4
  %inc5 = add nsw i32 %7, 1
  store i32 %inc5, i32* %i, align 4
  br label %for.cond

for.end6:                                         ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %jj = alloca i32, align 4
  %k = alloca i32, align 4
  %kk = alloca i32, align 4
  %t_start = alloca double, align 8
  %t_end = alloca double, align 8
  %A = alloca i32*, align 8
  %B = alloca i32*, align 8
  %C = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  %call = call noalias i8* @malloc(i64 4194304) #3
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %A, align 8
  %call1 = call noalias i8* @malloc(i64 4194304) #3
  %1 = bitcast i8* %call1 to i32*
  store i32* %1, i32** %B, align 8
  %call2 = call noalias i8* @malloc(i64 4194304) #3
  %2 = bitcast i8* %call2 to i32*
  store i32* %2, i32** %C, align 8
  %3 = load i32*, i32** %A, align 8
  call void @init_array(i32* %3, i32 1)
  %4 = load i32*, i32** %B, align 8
  call void @init_array(i32* %4, i32 1)
  %5 = load i32*, i32** %C, align 8
  call void @init_array(i32* %5, i32 0)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc30, %entry
  %6 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %6, 1024
  br i1 %cmp, label %for.body, label %for.end32

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc27, %for.body
  %7 = load i32, i32* %j, align 4
  %cmp4 = icmp slt i32 %7, 1024
  br i1 %cmp4, label %for.body5, label %for.end29

for.body5:                                        ; preds = %for.cond3
  %8 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %8, 1024
  %9 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %9
  %idxprom = sext i32 %add to i64
  %10 = load i32*, i32** %C, align 8
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body5
  %11 = load i32, i32* %k, align 4
  %cmp7 = icmp slt i32 %11, 1024
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %12 = load i32, i32* %i, align 4
  %mul9 = mul nsw i32 %12, 1024
  %13 = load i32, i32* %j, align 4
  %add10 = add nsw i32 %mul9, %13
  %idxprom11 = sext i32 %add10 to i64
  %14 = load i32*, i32** %C, align 8
  %arrayidx12 = getelementptr inbounds i32, i32* %14, i64 %idxprom11
  %15 = load i32, i32* %arrayidx12, align 4
  %16 = load i32, i32* %i, align 4
  %mul13 = mul nsw i32 %16, 1024
  %17 = load i32, i32* %k, align 4
  %add14 = add nsw i32 %mul13, %17
  %idxprom15 = sext i32 %add14 to i64
  %18 = load i32*, i32** %A, align 8
  %arrayidx16 = getelementptr inbounds i32, i32* %18, i64 %idxprom15
  %19 = load i32, i32* %arrayidx16, align 4
  %20 = load i32, i32* %k, align 4
  %mul17 = mul nsw i32 %20, 1024
  %21 = load i32, i32* %j, align 4
  %add18 = add nsw i32 %mul17, %21
  %idxprom19 = sext i32 %add18 to i64
  %22 = load i32*, i32** %B, align 8
  %arrayidx20 = getelementptr inbounds i32, i32* %22, i64 %idxprom19
  %23 = load i32, i32* %arrayidx20, align 4
  %mul21 = mul nsw i32 %19, %23
  %add22 = add nsw i32 %15, %mul21
  %24 = load i32, i32* %i, align 4
  %mul23 = mul nsw i32 %24, 1024
  %25 = load i32, i32* %j, align 4
  %add24 = add nsw i32 %mul23, %25
  %idxprom25 = sext i32 %add24 to i64
  %26 = load i32*, i32** %C, align 8
  %arrayidx26 = getelementptr inbounds i32, i32* %26, i64 %idxprom25
  store i32 %add22, i32* %arrayidx26, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %27 = load i32, i32* %k, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc27

for.inc27:                                        ; preds = %for.end
  %28 = load i32, i32* %j, align 4
  %inc28 = add nsw i32 %28, 1
  store i32 %inc28, i32* %j, align 4
  br label %for.cond3

for.end29:                                        ; preds = %for.cond3
  br label %for.inc30

for.inc30:                                        ; preds = %for.end29
  %29 = load i32, i32* %i, align 4
  %inc31 = add nsw i32 %29, 1
  store i32 %inc31, i32* %i, align 4
  br label %for.cond

for.end32:                                        ; preds = %for.cond
  %30 = load i32*, i32** %C, align 8
  %arrayidx33 = getelementptr inbounds i32, i32* %30, i64 1048575
  %31 = load i32, i32* %arrayidx33, align 4
  %call34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str, i32 0, i32 0), i32 1024, i32 1024, i32 %31)
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
