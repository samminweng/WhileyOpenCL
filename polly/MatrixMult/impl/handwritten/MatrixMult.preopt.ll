; ModuleID = 'MatrixMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [2000 x [2000 x i64]] zeroinitializer, align 16
@B = common global [2000 x [2000 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@C = common global [2000 x [2000 x i64]] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc10 ], [ 0, %entry ]
  %exitcond3 = icmp ne i64 %indvars.iv1, 2000
  br i1 %exitcond3, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body ]
  %exitcond = icmp ne i64 %indvars.iv, 2000
  br i1 %exitcond, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @A, i64 0, i64 %indvars.iv1
  %arrayidx5 = getelementptr inbounds [2000 x i64], [2000 x i64]* %arrayidx, i64 0, i64 %indvars.iv
  store i64 1, i64* %arrayidx5, align 8
  %arrayidx8 = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @B, i64 0, i64 %indvars.iv1
  %arrayidx9 = getelementptr inbounds [2000 x i64], [2000 x i64]* %arrayidx8, i64 0, i64 %indvars.iv
  store i64 1, i64* %arrayidx9, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  br label %for.cond

for.end12:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %entry
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc9 ], [ 0, %entry ]
  %exitcond3 = icmp ne i64 %indvars.iv1, 2000
  br i1 %exitcond3, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body ]
  %exitcond = icmp ne i64 %indvars.iv, 2000
  br i1 %exitcond, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %arrayidx = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %indvars.iv1
  %arrayidx5 = getelementptr inbounds [2000 x i64], [2000 x i64]* %arrayidx, i64 0, i64 %indvars.iv
  %1 = load i64, i64* %arrayidx5, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %1)
  %2 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %2, 80
  %cmp6 = icmp eq i32 %rem, 79
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  br label %for.cond

for.end11:                                        ; preds = %for.cond
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  call void @init_array()
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %entry
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.inc28 ], [ 0, %entry ]
  %exitcond6 = icmp ne i64 %indvars.iv4, 2000
  br i1 %exitcond6, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc25, %for.body
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc25 ], [ 0, %for.body ]
  %exitcond3 = icmp ne i64 %indvars.iv1, 2000
  br i1 %exitcond3, label %for.body3, label %for.end27

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %indvars.iv4
  %arrayidx5 = getelementptr inbounds [2000 x i64], [2000 x i64]* %arrayidx, i64 0, i64 %indvars.iv1
  store i64 0, i64* %arrayidx5, align 8
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body3 ]
  %exitcond = icmp ne i64 %indvars.iv, 2000
  br i1 %exitcond, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %arrayidx11 = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %indvars.iv4
  %arrayidx12 = getelementptr inbounds [2000 x i64], [2000 x i64]* %arrayidx11, i64 0, i64 %indvars.iv1
  %0 = load i64, i64* %arrayidx12, align 8
  %arrayidx15 = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @A, i64 0, i64 %indvars.iv4
  %arrayidx16 = getelementptr inbounds [2000 x i64], [2000 x i64]* %arrayidx15, i64 0, i64 %indvars.iv
  %1 = load i64, i64* %arrayidx16, align 8
  %arrayidx19 = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @B, i64 0, i64 %indvars.iv
  %arrayidx20 = getelementptr inbounds [2000 x i64], [2000 x i64]* %arrayidx19, i64 0, i64 %indvars.iv1
  %2 = load i64, i64* %arrayidx20, align 8
  %mul = mul nsw i64 %1, %2
  %add = add nsw i64 %0, %mul
  %arrayidx23 = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %indvars.iv4
  %arrayidx24 = getelementptr inbounds [2000 x i64], [2000 x i64]* %arrayidx23, i64 0, i64 %indvars.iv1
  store i64 %add, i64* %arrayidx24, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc25

for.inc25:                                        ; preds = %for.end
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  br label %for.cond1

for.end27:                                        ; preds = %for.cond1
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
