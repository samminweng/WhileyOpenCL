; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i32*, i32, i32 }

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @init(i32 %value, i32 %width, i32 %height) #0 {
entry:
  %value.addr = alloca i32, align 4
  %width.addr = alloca i32, align 4
  %height.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32*, align 8
  %matrix = alloca %struct.Matrix*, align 8
  store i32 %value, i32* %value.addr, align 4
  store i32 %width, i32* %width.addr, align 4
  store i32 %height, i32* %height.addr, align 4
  %0 = load i32, i32* %height.addr, align 4
  %1 = load i32, i32* %width.addr, align 4
  %mul = mul nsw i32 %0, %1
  %conv = sext i32 %mul to i64
  %mul1 = mul i64 %conv, 4
  %call = call noalias i8* @malloc(i64 %mul1) #3
  %2 = bitcast i8* %call to i32*
  store i32* %2, i32** %data, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* %height.addr, align 4
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4
  %6 = load i32, i32* %width.addr, align 4
  %cmp4 = icmp slt i32 %5, %6
  br i1 %cmp4, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond3
  %7 = load i32, i32* %value.addr, align 4
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %width.addr, align 4
  %mul7 = mul nsw i32 %8, %9
  %10 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul7, %10
  %idxprom = sext i32 %add to i64
  %11 = load i32*, i32** %data, align 8
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 %idxprom
  store i32 %7, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %12 = load i32, i32* %j, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond3

for.end:                                          ; preds = %for.cond3
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %13 = load i32, i32* %i, align 4
  %inc9 = add nsw i32 %13, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  %call11 = call noalias i8* @malloc(i64 16) #3
  %14 = bitcast i8* %call11 to %struct.Matrix*
  store %struct.Matrix* %14, %struct.Matrix** %matrix, align 8
  %15 = load i32*, i32** %data, align 8
  %16 = load %struct.Matrix*, %struct.Matrix** %matrix, align 8
  %data12 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %16, i32 0, i32 0
  store i32* %15, i32** %data12, align 8
  %17 = load i32, i32* %width.addr, align 4
  %18 = load %struct.Matrix*, %struct.Matrix** %matrix, align 8
  %width13 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %18, i32 0, i32 1
  store i32 %17, i32* %width13, align 8
  %19 = load i32, i32* %height.addr, align 4
  %20 = load %struct.Matrix*, %struct.Matrix** %matrix, align 8
  %height14 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %20, i32 0, i32 2
  store i32 %19, i32* %height14, align 4
  %21 = load %struct.Matrix*, %struct.Matrix** %matrix, align 8
  ret %struct.Matrix* %21
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
  %A_data = alloca i32*, align 8
  %B_data = alloca i32*, align 8
  %width = alloca i32, align 4
  %height = alloca i32, align 4
  %C_data = alloca i32*, align 8
  %C = alloca %struct.Matrix*, align 8
  store %struct.Matrix* %A, %struct.Matrix** %A.addr, align 8
  store %struct.Matrix* %B, %struct.Matrix** %B.addr, align 8
  %0 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %0, i32 0, i32 0
  %1 = load i32*, i32** %data, align 8
  store i32* %1, i32** %A_data, align 8
  %2 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %data1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %2, i32 0, i32 0
  %3 = load i32*, i32** %data1, align 8
  store i32* %3, i32** %B_data, align 8
  %4 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %4, i32 0, i32 1
  %5 = load i32, i32* %width2, align 8
  store i32 %5, i32* %width, align 4
  %6 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %6, i32 0, i32 2
  %7 = load i32, i32* %height3, align 4
  store i32 %7, i32* %height, align 4
  %8 = load i32, i32* %width, align 4
  %9 = load i32, i32* %height, align 4
  %mul = mul nsw i32 %8, %9
  %conv = sext i32 %mul to i64
  %mul4 = mul i64 %conv, 4
  %call = call noalias i8* @malloc(i64 %mul4) #3
  %10 = bitcast i8* %call to i32*
  store i32* %10, i32** %C_data, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc39, %entry
  %11 = load i32, i32* %i, align 4
  %12 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %height5 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %12, i32 0, i32 2
  %13 = load i32, i32* %height5, align 4
  %cmp = icmp slt i32 %11, %13
  br i1 %cmp, label %for.body, label %for.end41

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc36, %for.body
  %14 = load i32, i32* %j, align 4
  %15 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8
  %width8 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %15, i32 0, i32 1
  %16 = load i32, i32* %width8, align 8
  %cmp9 = icmp slt i32 %14, %16
  br i1 %cmp9, label %for.body11, label %for.end38

for.body11:                                       ; preds = %for.cond7
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* %width, align 4
  %mul12 = mul nsw i32 %17, %18
  %19 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul12, %19
  %idxprom = sext i32 %add to i64
  %20 = load i32*, i32** %C_data, align 8
  %arrayidx = getelementptr inbounds i32, i32* %20, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc, %for.body11
  %21 = load i32, i32* %k, align 4
  %22 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8
  %width14 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %22, i32 0, i32 1
  %23 = load i32, i32* %width14, align 8
  %cmp15 = icmp slt i32 %21, %23
  br i1 %cmp15, label %for.body17, label %for.end

for.body17:                                       ; preds = %for.cond13
  %24 = load i32, i32* %i, align 4
  %25 = load i32, i32* %width, align 4
  %mul18 = mul nsw i32 %24, %25
  %26 = load i32, i32* %j, align 4
  %add19 = add nsw i32 %mul18, %26
  %idxprom20 = sext i32 %add19 to i64
  %27 = load i32*, i32** %C_data, align 8
  %arrayidx21 = getelementptr inbounds i32, i32* %27, i64 %idxprom20
  %28 = load i32, i32* %arrayidx21, align 4
  %29 = load i32, i32* %i, align 4
  %30 = load i32, i32* %width, align 4
  %mul22 = mul nsw i32 %29, %30
  %31 = load i32, i32* %k, align 4
  %add23 = add nsw i32 %mul22, %31
  %idxprom24 = sext i32 %add23 to i64
  %32 = load i32*, i32** %A_data, align 8
  %arrayidx25 = getelementptr inbounds i32, i32* %32, i64 %idxprom24
  %33 = load i32, i32* %arrayidx25, align 4
  %34 = load i32, i32* %k, align 4
  %35 = load i32, i32* %width, align 4
  %mul26 = mul nsw i32 %34, %35
  %36 = load i32, i32* %j, align 4
  %add27 = add nsw i32 %mul26, %36
  %idxprom28 = sext i32 %add27 to i64
  %37 = load i32*, i32** %B_data, align 8
  %arrayidx29 = getelementptr inbounds i32, i32* %37, i64 %idxprom28
  %38 = load i32, i32* %arrayidx29, align 4
  %mul30 = mul nsw i32 %33, %38
  %add31 = add nsw i32 %28, %mul30
  %39 = load i32, i32* %i, align 4
  %40 = load i32, i32* %width, align 4
  %mul32 = mul nsw i32 %39, %40
  %41 = load i32, i32* %j, align 4
  %add33 = add nsw i32 %mul32, %41
  %idxprom34 = sext i32 %add33 to i64
  %42 = load i32*, i32** %C_data, align 8
  %arrayidx35 = getelementptr inbounds i32, i32* %42, i64 %idxprom34
  store i32 %add31, i32* %arrayidx35, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body17
  %43 = load i32, i32* %k, align 4
  %inc = add nsw i32 %43, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond13

for.end:                                          ; preds = %for.cond13
  br label %for.inc36

for.inc36:                                        ; preds = %for.end
  %44 = load i32, i32* %j, align 4
  %inc37 = add nsw i32 %44, 1
  store i32 %inc37, i32* %j, align 4
  br label %for.cond7

for.end38:                                        ; preds = %for.cond7
  br label %for.inc39

for.inc39:                                        ; preds = %for.end38
  %45 = load i32, i32* %i, align 4
  %inc40 = add nsw i32 %45, 1
  store i32 %inc40, i32* %i, align 4
  br label %for.cond

for.end41:                                        ; preds = %for.cond
  %call42 = call noalias i8* @malloc(i64 16) #3
  %46 = bitcast i8* %call42 to %struct.Matrix*
  store %struct.Matrix* %46, %struct.Matrix** %C, align 8
  %47 = load i32*, i32** %C_data, align 8
  %48 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data43 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %48, i32 0, i32 0
  store i32* %47, i32** %data43, align 8
  %49 = load i32, i32* %width, align 4
  %50 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %width44 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %50, i32 0, i32 1
  store i32 %49, i32* %width44, align 8
  %51 = load i32, i32* %height, align 4
  %52 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %height45 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %52, i32 0, i32 2
  store i32 %51, i32* %height45, align 4
  %53 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  ret %struct.Matrix* %53
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
  %width = alloca i32, align 4
  %height = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %args, i8*** %args.addr, align 8
  store %struct.Matrix* null, %struct.Matrix** %A, align 8
  store %struct.Matrix* null, %struct.Matrix** %B, align 8
  store %struct.Matrix* null, %struct.Matrix** %C, align 8
  store i32 2048, i32* %width, align 4
  store i32 2048, i32* %height, align 4
  %0 = load i32, i32* %width, align 4
  %1 = load i32, i32* %height, align 4
  %call = call %struct.Matrix* @init(i32 1, i32 %0, i32 %1)
  store %struct.Matrix* %call, %struct.Matrix** %A, align 8
  %2 = load i32, i32* %width, align 4
  %3 = load i32, i32* %height, align 4
  %call1 = call %struct.Matrix* @init(i32 1, i32 %2, i32 %3)
  store %struct.Matrix* %call1, %struct.Matrix** %B, align 8
  %4 = load %struct.Matrix*, %struct.Matrix** %A, align 8
  %5 = load %struct.Matrix*, %struct.Matrix** %B, align 8
  %call2 = call %struct.Matrix* @matrix_multiply(%struct.Matrix* %4, %struct.Matrix* %5)
  store %struct.Matrix* %call2, %struct.Matrix** %C, align 8
  %6 = load %struct.Matrix*, %struct.Matrix** %C, align 8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %6, i32 0, i32 0
  %7 = load i32*, i32** %data, align 8
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 4194303
  %8 = load i32, i32* %arrayidx, align 4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i32 0, i32 0), i32 2048, i32 2048, i32 2047, i32 2047, i32 %8)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
