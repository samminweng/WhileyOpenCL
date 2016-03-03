; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@X = common global [2048 x [2048 x i32]] zeroinitializer, align 16
@Y = common global [2048 x [2048 x i32]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@Z = common global [2048 x [2048 x i32]] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @init() #0 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 2048
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 2048
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %j, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [2048 x i32], [2048 x i32]* %arrayidx, i64 0, i64 %idxprom
  store i32 1, i32* %arrayidx5, align 4
  %4 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %4 to i64
  %5 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %5 to i64
  %arrayidx8 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %idxprom7
  %arrayidx9 = getelementptr inbounds [2048 x i32], [2048 x i32]* %arrayidx8, i64 0, i64 %idxprom6
  store i32 1, i32* %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %6 = load i32, i32* %j, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %7 = load i32, i32* %i, align 4
  %inc11 = add nsw i32 %7, 1
  store i32 %inc11, i32* %i, align 4
  br label %for.cond

for.end12:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define i32* @transpose(i32** noalias %y, i32 %index) #0 {
entry:
  %y.addr = alloca i32**, align 8
  %index.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %y_t = alloca i32*, align 8
  %splits = alloca i32, align 4
  %s = alloca i32, align 4
  store i32** %y, i32*** %y.addr, align 8
  store i32 %index, i32* %index.addr, align 4
  %call = call noalias i8* @malloc(i64 8192) #3
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %y_t, align 8
  store i32 32, i32* %splits, align 4
  store i32 0, i32* %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %1 = load i32, i32* %s, align 4
  %2 = load i32, i32* %splits, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %3, 64
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %index.addr, align 4
  %idxprom = sext i32 %4 to i64
  %5 = load i32, i32* %s, align 4
  %mul = mul nsw i32 %5, 64
  %6 = load i32, i32* %i, align 4
  %add = add nsw i32 %mul, %6
  %idxprom4 = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [2048 x i32], [2048 x i32]* %arrayidx, i64 0, i64 %idxprom
  %7 = load i32, i32* %arrayidx5, align 4
  %8 = load i32, i32* %s, align 4
  %mul6 = mul nsw i32 %8, 64
  %9 = load i32, i32* %i, align 4
  %add7 = add nsw i32 %mul6, %9
  %idxprom8 = sext i32 %add7 to i64
  %10 = load i32*, i32** %y_t, align 8
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 %idxprom8
  store i32 %7, i32* %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %12 = load i32, i32* %s, align 4
  %inc11 = add nsw i32 %12, 1
  store i32 %inc11, i32* %s, align 4
  br label %for.cond

for.end12:                                        ; preds = %for.cond
  %13 = load i32*, i32** %y_t, align 8
  ret i32* %13
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i32 @dot(i32* noalias %a, i32* noalias %b) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %sum = alloca [64 x i32], align 16
  %splits = alloca i32, align 4
  %s = alloca i32, align 4
  %tmp = alloca i32, align 4
  %total = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32* %b, i32** %b.addr, align 8
  store i32 32, i32* %splits, align 4
  store i32 0, i32* %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %0 = load i32, i32* %s, align 4
  %1 = load i32, i32* %splits, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %tmp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %2, 64
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %tmp, align 4
  %4 = load i32, i32* %s, align 4
  %mul = mul nsw i32 %4, 64
  %5 = load i32, i32* %i, align 4
  %add = add nsw i32 %mul, %5
  %idxprom = sext i32 %add to i64
  %6 = load i32*, i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom
  %7 = load i32, i32* %arrayidx, align 4
  %8 = load i32, i32* %s, align 4
  %mul4 = mul nsw i32 %8, 64
  %9 = load i32, i32* %i, align 4
  %add5 = add nsw i32 %mul4, %9
  %idxprom6 = sext i32 %add5 to i64
  %10 = load i32*, i32** %b.addr, align 8
  %arrayidx7 = getelementptr inbounds i32, i32* %10, i64 %idxprom6
  %11 = load i32, i32* %arrayidx7, align 4
  %mul8 = mul nsw i32 %7, %11
  %add9 = add nsw i32 %3, %mul8
  store i32 %add9, i32* %tmp, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %13 = load i32, i32* %tmp, align 4
  %14 = load i32, i32* %s, align 4
  %idxprom10 = sext i32 %14 to i64
  %arrayidx11 = getelementptr inbounds [64 x i32], [64 x i32]* %sum, i64 0, i64 %idxprom10
  store i32 %13, i32* %arrayidx11, align 4
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %15 = load i32, i32* %s, align 4
  %inc13 = add nsw i32 %15, 1
  store i32 %inc13, i32* %s, align 4
  br label %for.cond

for.end14:                                        ; preds = %for.cond
  store i32 0, i32* %total, align 4
  store i32 0, i32* %s, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc22, %for.end14
  %16 = load i32, i32* %s, align 4
  %17 = load i32, i32* %splits, align 4
  %cmp17 = icmp slt i32 %16, %17
  br i1 %cmp17, label %for.body18, label %for.end24

for.body18:                                       ; preds = %for.cond16
  %18 = load i32, i32* %s, align 4
  %idxprom19 = sext i32 %18 to i64
  %arrayidx20 = getelementptr inbounds [64 x i32], [64 x i32]* %sum, i64 0, i64 %idxprom19
  %19 = load i32, i32* %arrayidx20, align 4
  %20 = load i32, i32* %total, align 4
  %add21 = add nsw i32 %20, %19
  store i32 %add21, i32* %total, align 4
  br label %for.inc22

for.inc22:                                        ; preds = %for.body18
  %21 = load i32, i32* %s, align 4
  %inc23 = add nsw i32 %21, 1
  store i32 %inc23, i32* %s, align 4
  br label %for.cond16

for.end24:                                        ; preds = %for.cond16
  %22 = load i32, i32* %total, align 4
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 2048
  br i1 %cmp, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 2048
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %3 = load i32, i32* %j, align 4
  %idxprom = sext i32 %3 to i64
  %4 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [2048 x i32], [2048 x i32]* %arrayidx, i64 0, i64 %idxprom
  %5 = load i32, i32* %arrayidx5, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %5)
  %6 = load i32, i32* %j, align 4
  %rem = srem i32 %6, 80
  %cmp6 = icmp eq i32 %rem, 79
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i32, i32* %j, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %10, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond

for.end11:                                        ; preds = %for.cond
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %y_t = alloca i32*, align 8
  %x = alloca i32*, align 8
  %z = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @init()
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %j, align 4
  %cmp = icmp slt i32 %0, 2048
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %j, align 4
  %call = call i32* @transpose(i32** bitcast ([2048 x [2048 x i32]]* @Y to i32**), i32 %1)
  store i32* %call, i32** %y_t, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %2, 2048
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [2048 x i32], [2048 x i32]* %arrayidx, i32 0, i32 0
  store i32* %arraydecay, i32** %x, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx5 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 %idxprom4
  %arraydecay6 = getelementptr inbounds [2048 x i32], [2048 x i32]* %arrayidx5, i32 0, i32 0
  store i32* %arraydecay6, i32** %z, align 8
  %5 = load i32*, i32** %x, align 8
  %6 = load i32*, i32** %y_t, align 8
  %call7 = call i32 @dot(i32* %5, i32* %6)
  %7 = load i32, i32* %j, align 4
  %idxprom8 = sext i32 %7 to i64
  %8 = load i32*, i32** %z, align 8
  %arrayidx9 = getelementptr inbounds i32, i32* %8, i64 %idxprom8
  store i32 %call7, i32* %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %10 = load i32, i32* %j, align 4
  %inc11 = add nsw i32 %10, 1
  store i32 %inc11, i32* %j, align 4
  br label %for.cond

for.end12:                                        ; preds = %for.cond
  %11 = load i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 2047, i64 2047), align 4
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i32 0, i32 0), i32 2048, i32 2048, i32 2047, i32 2047, i32 %11)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
