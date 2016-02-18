; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define i64* @init_array(i64 %value) #0 {
entry:
  %value.addr = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %jj = alloca i32, align 4
  %array = alloca i64*, align 8
  store i64 %value, i64* %value.addr, align 8
  %call = call noalias i8* @malloc(i64 8388608) #3
  %0 = bitcast i8* %call to i64*
  store i64* %0, i64** %array, align 8
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
  %3 = load i64, i64* %value.addr, align 8
  %4 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %4, 1024
  %5 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %5
  %idxprom = sext i32 %add to i64
  %6 = load i64*, i64** %array, align 8
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 %idxprom
  store i64 %3, i64* %arrayidx, align 8
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
  %9 = load i64*, i64** %array, align 8
  ret i64* %9
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

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
  %A = alloca i64*, align 8
  %B = alloca i64*, align 8
  %C = alloca i64*, align 8
  %tmp = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  %call = call i64* @init_array(i64 1)
  store i64* %call, i64** %A, align 8
  %call1 = call i64* @init_array(i64 1)
  store i64* %call1, i64** %B, align 8
  %call2 = call i64* @init_array(i64 0)
  store i64* %call2, i64** %C, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc22, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 1024
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc19, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp4 = icmp slt i32 %1, 1024
  br i1 %cmp4, label %for.body5, label %for.end21

for.body5:                                        ; preds = %for.cond3
  store i64 0, i64* %tmp, align 8
  store i32 0, i32* %k, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body5
  %2 = load i32, i32* %k, align 4
  %cmp7 = icmp slt i32 %2, 1024
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %3 = load i64, i64* %tmp, align 8
  %4 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %4, 1024
  %5 = load i32, i32* %k, align 4
  %add = add nsw i32 %mul, %5
  %idxprom = sext i32 %add to i64
  %6 = load i64*, i64** %A, align 8
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 %idxprom
  %7 = load i64, i64* %arrayidx, align 8
  %8 = load i32, i32* %k, align 4
  %mul9 = mul nsw i32 %8, 1024
  %9 = load i32, i32* %j, align 4
  %add10 = add nsw i32 %mul9, %9
  %idxprom11 = sext i32 %add10 to i64
  %10 = load i64*, i64** %B, align 8
  %arrayidx12 = getelementptr inbounds i64, i64* %10, i64 %idxprom11
  %11 = load i64, i64* %arrayidx12, align 8
  %mul13 = mul nsw i64 %7, %11
  %add14 = add nsw i64 %3, %mul13
  store i64 %add14, i64* %tmp, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %12 = load i32, i32* %k, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  %13 = load i64, i64* %tmp, align 8
  %14 = load i32, i32* %i, align 4
  %mul15 = mul nsw i32 %14, 1024
  %15 = load i32, i32* %j, align 4
  %add16 = add nsw i32 %mul15, %15
  %idxprom17 = sext i32 %add16 to i64
  %16 = load i64*, i64** %C, align 8
  %arrayidx18 = getelementptr inbounds i64, i64* %16, i64 %idxprom17
  store i64 %13, i64* %arrayidx18, align 8
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %17 = load i32, i32* %j, align 4
  %inc20 = add nsw i32 %17, 1
  store i32 %inc20, i32* %j, align 4
  br label %for.cond3

for.end21:                                        ; preds = %for.cond3
  br label %for.inc22

for.inc22:                                        ; preds = %for.end21
  %18 = load i32, i32* %i, align 4
  %inc23 = add nsw i32 %18, 1
  store i32 %inc23, i32* %i, align 4
  br label %for.cond

for.end24:                                        ; preds = %for.cond
  %19 = load i64*, i64** %C, align 8
  %arrayidx25 = getelementptr inbounds i64, i64* %19, i64 1048575
  %20 = load i64, i64* %arrayidx25, align 8
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i32 0, i32 0), i32 1024, i32 1024, i64 %20)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
