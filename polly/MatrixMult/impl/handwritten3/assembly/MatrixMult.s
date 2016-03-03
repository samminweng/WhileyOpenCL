; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@X = common global [1024 x [1024 x i32]] zeroinitializer, align 16
@Y = common global [1024 x [1024 x i32]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@Z = common global [1024 x [1024 x i32]] zeroinitializer, align 16
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
  %cmp = icmp slt i32 %0, 1024
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 1024
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %j, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arrayidx, i64 0, i64 %idxprom
  store i32 1, i32* %arrayidx5, align 4
  %4 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %4 to i64
  %5 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %5 to i64
  %arrayidx8 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %idxprom7
  %arrayidx9 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arrayidx8, i64 0, i64 %idxprom6
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
  store i32** %y, i32*** %y.addr, align 8
  store i32 %index, i32* %index.addr, align 4
  %call = call noalias i8* @malloc(i64 4096) #3
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %y_t, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 1024
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %index.addr, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %idxprom1
  %arrayidx2 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arrayidx, i64 0, i64 %idxprom
  %4 = load i32, i32* %arrayidx2, align 4
  %5 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %5 to i64
  %6 = load i32*, i32** %y_t, align 8
  %arrayidx4 = getelementptr inbounds i32, i32* %6, i64 %idxprom3
  store i32 %4, i32* %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %y_t, align 8
  ret i32* %8
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i32 @dot(i32* noalias %a, i32* noalias %b) #0 {
entry:
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  %splits = alloca i32, align 4
  %s = alloca i32, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32* %b, i32** %b.addr, align 8
  store i32 0, i32* %sum, align 4
  store i32 16, i32* %splits, align 4
  store i32 0, i32* %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %s, align 4
  %1 = load i32, i32* %splits, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %2, 64
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, i32* %sum, align 4
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
  store i32 %add9, i32* %sum, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %13 = load i32, i32* %s, align 4
  %inc11 = add nsw i32 %13, 1
  store i32 %inc11, i32* %s, align 4
  br label %for.cond

for.end12:                                        ; preds = %for.cond
  %14 = load i32, i32* %sum, align 4
  ret i32 %14
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
  %cmp = icmp slt i32 %0, 1024
  br i1 %cmp, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 1024
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %3 = load i32, i32* %j, align 4
  %idxprom = sext i32 %3 to i64
  %4 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Z, i64 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arrayidx, i64 0, i64 %idxprom
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
  %y_t = alloca [1024 x i32], align 16
  %x = alloca i32*, align 8
  %z = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @init()
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc22, %entry
  %0 = load i32, i32* %j, align 4
  %cmp = icmp slt i32 %0, 1024
  br i1 %cmp, label %for.body, label %for.end24

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %1, 1024
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %j, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arrayidx, i64 0, i64 %idxprom
  %4 = load i32, i32* %arrayidx5, align 4
  %5 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %5 to i64
  %arrayidx7 = getelementptr inbounds [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %idxprom6
  store i32 %4, i32* %arrayidx7, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  store i32 0, i32* %i, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc19, %for.end
  %7 = load i32, i32* %i, align 4
  %cmp9 = icmp slt i32 %7, 1024
  br i1 %cmp9, label %for.body10, label %for.end21

for.body10:                                       ; preds = %for.cond8
  %8 = load i32, i32* %i, align 4
  %idxprom11 = sext i32 %8 to i64
  %arrayidx12 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %idxprom11
  %arraydecay = getelementptr inbounds [1024 x i32], [1024 x i32]* %arrayidx12, i32 0, i32 0
  store i32* %arraydecay, i32** %x, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom13 = sext i32 %9 to i64
  %arrayidx14 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Z, i64 0, i64 %idxprom13
  %arraydecay15 = getelementptr inbounds [1024 x i32], [1024 x i32]* %arrayidx14, i32 0, i32 0
  store i32* %arraydecay15, i32** %z, align 8
  %10 = load i32*, i32** %x, align 8
  %arraydecay16 = getelementptr inbounds [1024 x i32], [1024 x i32]* %y_t, i32 0, i32 0
  %call = call i32 @dot(i32* %10, i32* %arraydecay16)
  %11 = load i32, i32* %j, align 4
  %idxprom17 = sext i32 %11 to i64
  %12 = load i32*, i32** %z, align 8
  %arrayidx18 = getelementptr inbounds i32, i32* %12, i64 %idxprom17
  store i32 %call, i32* %arrayidx18, align 4
  br label %for.inc19

for.inc19:                                        ; preds = %for.body10
  %13 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %13, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond8

for.end21:                                        ; preds = %for.cond8
  br label %for.inc22

for.inc22:                                        ; preds = %for.end21
  %14 = load i32, i32* %j, align 4
  %inc23 = add nsw i32 %14, 1
  store i32 %inc23, i32* %j, align 4
  br label %for.cond

for.end24:                                        ; preds = %for.cond
  %15 = load i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Z, i64 0, i64 1023, i64 1023), align 4
  %call25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i32 0, i32 0), i32 1024, i32 1024, i32 1023, i32 1023, i32 %15)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
