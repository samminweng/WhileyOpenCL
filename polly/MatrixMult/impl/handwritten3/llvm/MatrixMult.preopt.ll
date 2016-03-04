; ModuleID = 'MatrixMult.s'
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
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry.split, %for.inc10
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc10 ]
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %indvars.iv3, i64 %indvars.iv
  store i32 1, i32* %arrayidx5, align 4
  %arrayidx9 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %indvars.iv3, i64 %indvars.iv
  store i32 1, i32* %arrayidx9, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 2048
  br i1 %exitcond, label %for.body3, label %for.inc10

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 2048
  br i1 %exitcond5, label %for.cond1.preheader, label %for.end12

for.end12:                                        ; preds = %for.inc10
  ret void
}

; Function Attrs: nounwind uwtable
define i32* @transpose(i32** noalias %y, i32 %index) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call noalias i8* @malloc(i64 8192) #3
  %0 = bitcast i8* %call to i32*
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry.split, %for.inc10
  %indvars.iv5 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next6, %for.inc10 ]
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %idxprom = sext i32 %index to i64
  %1 = shl i64 %indvars.iv5, 6
  %2 = add nuw nsw i64 %indvars.iv, %1
  %arrayidx5 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %2, i64 %idxprom
  %3 = load i32, i32* %arrayidx5, align 4
  %4 = shl i64 %indvars.iv5, 6
  %5 = add nuw nsw i64 %indvars.iv, %4
  %arrayidx9 = getelementptr inbounds i32, i32* %0, i64 %5
  store i32 %3, i32* %arrayidx9, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 64
  br i1 %exitcond, label %for.body3, label %for.inc10

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond9 = icmp ne i64 %indvars.iv.next6, 32
  br i1 %exitcond9, label %for.cond1.preheader, label %for.end12

for.end12:                                        ; preds = %for.inc10
  ret i32* %0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i32 @dot(i32* noalias %a, i32* noalias %b) #0 {
entry:
  %sum = alloca [64 x i32], align 16
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry.split, %for.end
  %indvars.iv7 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next8, %for.end ]
  %total.04 = phi i32 [ 0, %entry.split ], [ %add14, %for.end ]
  br label %for.inc

for.inc:                                          ; preds = %for.cond1.preheader, %for.inc
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %tmp.02 = phi i32 [ 0, %for.cond1.preheader ], [ %add9, %for.inc ]
  %0 = shl i64 %indvars.iv7, 6
  %1 = add nuw nsw i64 %indvars.iv, %0
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %1
  %2 = load i32, i32* %arrayidx, align 4
  %3 = shl i64 %indvars.iv7, 6
  %4 = add nuw nsw i64 %indvars.iv, %3
  %arrayidx7 = getelementptr inbounds i32, i32* %b, i64 %4
  %5 = load i32, i32* %arrayidx7, align 4
  %mul8 = mul nsw i32 %5, %2
  %add9 = add nsw i32 %mul8, %tmp.02
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 64
  br i1 %exitcond, label %for.inc, label %for.end

for.end:                                          ; preds = %for.inc
  %add9.lcssa = phi i32 [ %add9, %for.inc ]
  %arrayidx11 = getelementptr inbounds [64 x i32], [64 x i32]* %sum, i64 0, i64 %indvars.iv7
  store i32 %add9.lcssa, i32* %arrayidx11, align 4
  %arrayidx13 = getelementptr inbounds [64 x i32], [64 x i32]* %sum, i64 0, i64 %indvars.iv7
  %6 = load i32, i32* %arrayidx13, align 4
  %add14 = add nsw i32 %6, %total.04
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp ne i64 %indvars.iv.next8, 32
  br i1 %exitcond11, label %for.cond1.preheader, label %for.end17

for.end17:                                        ; preds = %for.end
  %add14.lcssa = phi i32 [ %add14, %for.end ]
  ret i32 %add14.lcssa
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry.split, %for.end
  %indvars.iv6 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader, %for.inc
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 %indvars.iv6, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx5, align 4
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %2) #3
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 80
  %cmp6 = icmp eq i32 %rem, 79
  br i1 %cmp6, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4)
  br label %for.inc

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %exitcond = icmp ne i64 %indvars.iv.next, 2048
  br i1 %exitcond, label %for.body3, label %for.end

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa)
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp ne i64 %indvars.iv.next7, 2048
  br i1 %exitcond8, label %for.cond1.preheader, label %for.end11

for.end11:                                        ; preds = %for.end
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  tail call void @init()
  br label %for.body

for.body:                                         ; preds = %entry.split, %for.end17
  %indvars.iv8 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next9, %for.end17 ]
  %0 = trunc i64 %indvars.iv8 to i32
  %call = tail call i32* @transpose(i32** bitcast ([2048 x [2048 x i32]]* @Y to i32**), i32 %0)
  br label %for.body3

for.body3:                                        ; preds = %for.body, %for.end
  %indvars.iv5 = phi i64 [ 0, %for.body ], [ %indvars.iv.next6, %for.end ]
  br label %for.inc

for.inc:                                          ; preds = %for.body3, %for.inc
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next, %for.inc ]
  %sum.02 = phi i32 [ 0, %for.body3 ], [ %add, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %indvars.iv5, i64 %indvars.iv
  %1 = load i32, i32* %arrayidx8, align 4
  %arrayidx10 = getelementptr inbounds i32, i32* %call, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx10, align 4
  %mul = mul nsw i32 %2, %1
  %add = add nsw i32 %mul, %sum.02
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 2048
  br i1 %exitcond, label %for.inc, label %for.end

for.end:                                          ; preds = %for.inc
  %add.lcssa = phi i32 [ %add, %for.inc ]
  %arrayidx14 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 %indvars.iv5, i64 %indvars.iv8
  store i32 %add.lcssa, i32* %arrayidx14, align 4
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp ne i64 %indvars.iv.next6, 2048
  br i1 %exitcond7, label %for.body3, label %for.end17

for.end17:                                        ; preds = %for.end
  %3 = bitcast i32* %call to i8*
  tail call void @free(i8* %3) #3
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp ne i64 %indvars.iv.next9, 2048
  br i1 %exitcond10, label %for.body, label %for.end20

for.end20:                                        ; preds = %for.end17
  %4 = load i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 2047, i64 2047), align 4
  %call21 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i64 0, i64 0), i32 2048, i32 2048, i32 2047, i32 2047, i32 %4) #3
  ret i32 0
}

; Function Attrs: nounwind
declare void @free(i8*) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
