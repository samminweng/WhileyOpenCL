; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32* @init_array(i32 %value) #0 {
entry:
  %value.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %array = alloca i32*, align 8
  store i32 %value, i32* %value.addr, align 4
  %call = call noalias i8* @malloc(i64 4194304) #3
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %array, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc4, %entry
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 1024
  br i1 %cmp, label %for.body, label %for.end6

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %2, 1024
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %value.addr, align 4
  %4 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %4, 1024
  %5 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %5
  %idxprom = sext i32 %add to i64
  %6 = load i32*, i32** %array, align 8
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom
  store i32 %3, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %7 = load i32, i32* %j, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc4

for.inc4:                                         ; preds = %for.end
  %8 = load i32, i32* %i, align 4
  %inc5 = add nsw i32 %8, 1
  store i32 %inc5, i32* %i, align 4
  br label %for.cond

for.end6:                                         ; preds = %for.cond
  %9 = load i32*, i32** %array, align 8
  ret i32* %9
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i32* @matrix_multiply(i32* noalias %A, i32* noalias %B) #0 {
entry:
  %A.addr = alloca i32*, align 8
  %B.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %C = alloca i32*, align 8
  store i32* %A, i32** %A.addr, align 8
  store i32* %B, i32** %B.addr, align 8
  %call = call noalias i8* @malloc(i64 4194304) #3
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %C, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %entry
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 1024
  br i1 %cmp, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc25, %for.body
  %2 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %2, 1024
  br i1 %cmp2, label %for.body3, label %for.end27

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %3, 1024
  %4 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %4
  %idxprom = sext i32 %add to i64
  %5 = load i32*, i32** %C, align 8
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %6 = load i32, i32* %k, align 4
  %cmp5 = icmp slt i32 %6, 1024
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %7 = load i32, i32* %i, align 4
  %mul7 = mul nsw i32 %7, 1024
  %8 = load i32, i32* %j, align 4
  %add8 = add nsw i32 %mul7, %8
  %idxprom9 = sext i32 %add8 to i64
  %9 = load i32*, i32** %C, align 8
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9
  %10 = load i32, i32* %arrayidx10, align 4
  %11 = load i32, i32* %i, align 4
  %mul11 = mul nsw i32 %11, 1024
  %12 = load i32, i32* %k, align 4
  %add12 = add nsw i32 %mul11, %12
  %idxprom13 = sext i32 %add12 to i64
  %13 = load i32*, i32** %A.addr, align 8
  %arrayidx14 = getelementptr inbounds i32, i32* %13, i64 %idxprom13
  %14 = load i32, i32* %arrayidx14, align 4
  %15 = load i32, i32* %k, align 4
  %mul15 = mul nsw i32 %15, 1024
  %16 = load i32, i32* %j, align 4
  %add16 = add nsw i32 %mul15, %16
  %idxprom17 = sext i32 %add16 to i64
  %17 = load i32*, i32** %B.addr, align 8
  %arrayidx18 = getelementptr inbounds i32, i32* %17, i64 %idxprom17
  %18 = load i32, i32* %arrayidx18, align 4
  %mul19 = mul nsw i32 %14, %18
  %add20 = add nsw i32 %10, %mul19
  %19 = load i32, i32* %i, align 4
  %mul21 = mul nsw i32 %19, 1024
  %20 = load i32, i32* %j, align 4
  %add22 = add nsw i32 %mul21, %20
  %idxprom23 = sext i32 %add22 to i64
  %21 = load i32*, i32** %C, align 8
  %arrayidx24 = getelementptr inbounds i32, i32* %21, i64 %idxprom23
  store i32 %add20, i32* %arrayidx24, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %22 = load i32, i32* %k, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc25

for.inc25:                                        ; preds = %for.end
  %23 = load i32, i32* %j, align 4
  %inc26 = add nsw i32 %23, 1
  store i32 %inc26, i32* %j, align 4
  br label %for.cond1

for.end27:                                        ; preds = %for.cond1
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %24 = load i32, i32* %i, align 4
  %inc29 = add nsw i32 %24, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  %25 = load i32*, i32** %C, align 8
  ret i32* %25
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
  store i32* null, i32** %A, align 8
  store i32* null, i32** %B, align 8
  store i32* null, i32** %C, align 8
  %call = call i32* @init_array(i32 1)
  store i32* %call, i32** %A, align 8
  %call1 = call i32* @init_array(i32 1)
  store i32* %call1, i32** %B, align 8
  %0 = load i32*, i32** %A, align 8
  %1 = load i32*, i32** %B, align 8
  %call2 = call i32* @matrix_multiply(i32* %0, i32* %1)
  store i32* %call2, i32** %C, align 8
  %2 = load i32*, i32** %C, align 8
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 1048575
  %3 = load i32, i32* %arrayidx, align 4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i32 0, i32 0), i32 1024, i32 1024, i32 1023, i32 1023, i32 %3)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
