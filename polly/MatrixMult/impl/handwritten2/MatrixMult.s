; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i32*, i32, i32 }

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @init(i32 %value) #0 {
entry:
  %value.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32*, align 8
  %matrix = alloca %struct.Matrix*, align 8
  store i32 %value, i32* %value.addr, align 4
  %call = call noalias i8* @malloc(i64 4194304) #3
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %data, align 8
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
  %6 = load i32*, i32** %data, align 8
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
  %call7 = call noalias i8* @malloc(i64 16) #3
  %9 = bitcast i8* %call7 to %struct.Matrix*
  store %struct.Matrix* %9, %struct.Matrix** %matrix, align 8
  %10 = load i32*, i32** %data, align 8
  %11 = load %struct.Matrix*, %struct.Matrix** %matrix, align 8
  %data8 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %11, i32 0, i32 0
  store i32* %10, i32** %data8, align 8
  %12 = load %struct.Matrix*, %struct.Matrix** %matrix, align 8
  ret %struct.Matrix* %12
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @matrix_multiply(%struct.Matrix* noalias %A, %struct.Matrix* noalias %B) #0 {
entry:
  %A.addr = alloca %struct.Matrix*, align 8
  %B.addr = alloca %struct.Matrix*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %C_data = alloca i32*, align 8
  %A_data = alloca i32*, align 8
  %B_data = alloca i32*, align 8
  %C = alloca %struct.Matrix*, align 8
  store %struct.Matrix* %A, %struct.Matrix** %A.addr, align 8
  store %struct.Matrix* %B, %struct.Matrix** %B.addr, align 8
  %call = call noalias i8* @malloc(i64 4194304) #3
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %C_data, align 8
  %1 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i32 0, i32 0
  %2 = load i32*, i32** %data, align 8
  store i32* %2, i32** %A_data, align 8
  %3 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %3, i32 0, i32 0
  %4 = load i32*, i32** %data1, align 8
  store i32* %4, i32** %B_data, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc29, %entry
  %5 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %5, 1024
  br i1 %cmp, label %for.body, label %for.end31

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc26, %for.body
  %6 = load i32, i32* %j, align 4
  %cmp3 = icmp slt i32 %6, 1024
  br i1 %cmp3, label %for.body4, label %for.end28

for.body4:                                        ; preds = %for.cond2
  %7 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %7, 1024
  %8 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %8
  %idxprom = sext i32 %add to i64
  %9 = load i32*, i32** %C_data, align 8
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %10 = load i32, i32* %k, align 4
  %cmp6 = icmp slt i32 %10, 1024
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %11 = load i32, i32* %i, align 4
  %mul8 = mul nsw i32 %11, 1024
  %12 = load i32, i32* %j, align 4
  %add9 = add nsw i32 %mul8, %12
  %idxprom10 = sext i32 %add9 to i64
  %13 = load i32*, i32** %C_data, align 8
  %arrayidx11 = getelementptr inbounds i32, i32* %13, i64 %idxprom10
  %14 = load i32, i32* %arrayidx11, align 4
  %15 = load i32, i32* %i, align 4
  %mul12 = mul nsw i32 %15, 1024
  %16 = load i32, i32* %k, align 4
  %add13 = add nsw i32 %mul12, %16
  %idxprom14 = sext i32 %add13 to i64
  %17 = load i32*, i32** %A_data, align 8
  %arrayidx15 = getelementptr inbounds i32, i32* %17, i64 %idxprom14
  %18 = load i32, i32* %arrayidx15, align 4
  %19 = load i32, i32* %k, align 4
  %mul16 = mul nsw i32 %19, 1024
  %20 = load i32, i32* %j, align 4
  %add17 = add nsw i32 %mul16, %20
  %idxprom18 = sext i32 %add17 to i64
  %21 = load i32*, i32** %B_data, align 8
  %arrayidx19 = getelementptr inbounds i32, i32* %21, i64 %idxprom18
  %22 = load i32, i32* %arrayidx19, align 4
  %mul20 = mul nsw i32 %18, %22
  %add21 = add nsw i32 %14, %mul20
  %23 = load i32, i32* %i, align 4
  %mul22 = mul nsw i32 %23, 1024
  %24 = load i32, i32* %j, align 4
  %add23 = add nsw i32 %mul22, %24
  %idxprom24 = sext i32 %add23 to i64
  %25 = load i32*, i32** %C_data, align 8
  %arrayidx25 = getelementptr inbounds i32, i32* %25, i64 %idxprom24
  store i32 %add21, i32* %arrayidx25, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body7
  %26 = load i32, i32* %k, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc26

for.inc26:                                        ; preds = %for.end
  %27 = load i32, i32* %j, align 4
  %inc27 = add nsw i32 %27, 1
  store i32 %inc27, i32* %j, align 4
  br label %for.cond2

for.end28:                                        ; preds = %for.cond2
  br label %for.inc29

for.inc29:                                        ; preds = %for.end28
  %28 = load i32, i32* %i, align 4
  %inc30 = add nsw i32 %28, 1
  store i32 %inc30, i32* %i, align 4
  br label %for.cond

for.end31:                                        ; preds = %for.cond
  %call32 = call noalias i8* @malloc(i64 16) #3
  %29 = bitcast i8* %call32 to %struct.Matrix*
  store %struct.Matrix* %29, %struct.Matrix** %C, align 8
  %30 = load i32*, i32** %C_data, align 8
  %31 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data33 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %31, i32 0, i32 0
  store i32* %30, i32** %data33, align 8
  %32 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  ret %struct.Matrix* %32
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %A = alloca %struct.Matrix*, align 8
  %B = alloca %struct.Matrix*, align 8
  %C = alloca %struct.Matrix*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  store %struct.Matrix* null, %struct.Matrix** %A, align 8
  store %struct.Matrix* null, %struct.Matrix** %B, align 8
  store %struct.Matrix* null, %struct.Matrix** %C, align 8
  %call = call %struct.Matrix* @init(i32 1)
  store %struct.Matrix* %call, %struct.Matrix** %A, align 8
  %call1 = call %struct.Matrix* @init(i32 1)
  store %struct.Matrix* %call1, %struct.Matrix** %B, align 8
  %0 = load %struct.Matrix*, %struct.Matrix** %A, align 8
  %1 = load %struct.Matrix*, %struct.Matrix** %B, align 8
  %call2 = call %struct.Matrix* @matrix_multiply(%struct.Matrix* %0, %struct.Matrix* %1)
  store %struct.Matrix* %call2, %struct.Matrix** %C, align 8
  %2 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %2, i32 0, i32 0
  %3 = load i32*, i32** %data, align 8
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 1048575
  %4 = load i32, i32* %arrayidx, align 4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i32 0, i32 0), i32 1024, i32 1024, i32 1023, i32 1023, i32 %4)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
