; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@B = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@C = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

; Function Attrs: norecurse nounwind uwtable
define void @init_array() #0 {
entry:
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit3
  ret void

polly.loop_exit3:                                 ; preds = %polly.loop_exit9
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond22 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond22, label %polly.exiting, label %polly.loop_preheader2

polly.loop_exit9:                                 ; preds = %vector.body
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond21 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond21, label %polly.loop_exit3, label %polly.loop_preheader8

polly.loop_preheader2:                            ; preds = %polly.loop_exit3, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit3 ]
  %0 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader8

polly.loop_preheader8:                            ; preds = %polly.loop_exit9, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_exit9 ]
  %1 = shl nsw i64 %polly.indvar4, 5
  %2 = or i64 %1, 2
  %3 = or i64 %1, 4
  %4 = or i64 %1, 6
  %5 = or i64 %1, 8
  %6 = or i64 %1, 10
  %7 = or i64 %1, 12
  %8 = or i64 %1, 14
  %9 = or i64 %1, 16
  %10 = or i64 %1, 18
  %11 = or i64 %1, 20
  %12 = or i64 %1, 22
  %13 = or i64 %1, 24
  %14 = or i64 %1, 26
  %15 = or i64 %1, 28
  %16 = or i64 %1, 30
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %vector.body, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %vector.body ]
  %17 = add nuw nsw i64 %polly.indvar10, %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader14
  %18 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %1
  %19 = bitcast i64* %18 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %19, align 16, !alias.scope !1, !noalias !3
  %20 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %1
  %21 = bitcast i64* %20 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %21, align 16, !alias.scope !4, !noalias !5
  %22 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %2
  %23 = bitcast i64* %22 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %23, align 16, !alias.scope !1, !noalias !3
  %24 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %2
  %25 = bitcast i64* %24 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %25, align 16, !alias.scope !4, !noalias !5
  %26 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %3
  %27 = bitcast i64* %26 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %27, align 16, !alias.scope !1, !noalias !3
  %28 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %3
  %29 = bitcast i64* %28 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %29, align 16, !alias.scope !4, !noalias !5
  %30 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %4
  %31 = bitcast i64* %30 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %31, align 16, !alias.scope !1, !noalias !3
  %32 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %4
  %33 = bitcast i64* %32 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %33, align 16, !alias.scope !4, !noalias !5
  %34 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %5
  %35 = bitcast i64* %34 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %35, align 16, !alias.scope !1, !noalias !3
  %36 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %5
  %37 = bitcast i64* %36 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %37, align 16, !alias.scope !4, !noalias !5
  %38 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %6
  %39 = bitcast i64* %38 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %39, align 16, !alias.scope !1, !noalias !3
  %40 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %6
  %41 = bitcast i64* %40 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %41, align 16, !alias.scope !4, !noalias !5
  %42 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %7
  %43 = bitcast i64* %42 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %43, align 16, !alias.scope !1, !noalias !3
  %44 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %7
  %45 = bitcast i64* %44 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %45, align 16, !alias.scope !4, !noalias !5
  %46 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %8
  %47 = bitcast i64* %46 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %47, align 16, !alias.scope !1, !noalias !3
  %48 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %8
  %49 = bitcast i64* %48 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %49, align 16, !alias.scope !4, !noalias !5
  %50 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %9
  %51 = bitcast i64* %50 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %51, align 16, !alias.scope !1, !noalias !3
  %52 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %9
  %53 = bitcast i64* %52 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %53, align 16, !alias.scope !4, !noalias !5
  %54 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %10
  %55 = bitcast i64* %54 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %55, align 16, !alias.scope !1, !noalias !3
  %56 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %10
  %57 = bitcast i64* %56 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %57, align 16, !alias.scope !4, !noalias !5
  %58 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %11
  %59 = bitcast i64* %58 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %59, align 16, !alias.scope !1, !noalias !3
  %60 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %11
  %61 = bitcast i64* %60 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %61, align 16, !alias.scope !4, !noalias !5
  %62 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %12
  %63 = bitcast i64* %62 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %63, align 16, !alias.scope !1, !noalias !3
  %64 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %12
  %65 = bitcast i64* %64 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %65, align 16, !alias.scope !4, !noalias !5
  %66 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %13
  %67 = bitcast i64* %66 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %67, align 16, !alias.scope !1, !noalias !3
  %68 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %13
  %69 = bitcast i64* %68 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %69, align 16, !alias.scope !4, !noalias !5
  %70 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %14
  %71 = bitcast i64* %70 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %71, align 16, !alias.scope !1, !noalias !3
  %72 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %14
  %73 = bitcast i64* %72 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %73, align 16, !alias.scope !4, !noalias !5
  %74 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %15
  %75 = bitcast i64* %74 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %75, align 16, !alias.scope !1, !noalias !3
  %76 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %15
  %77 = bitcast i64* %76 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %77, align 16, !alias.scope !4, !noalias !5
  %78 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %16
  %79 = bitcast i64* %78 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %79, align 16, !alias.scope !1, !noalias !3
  %80 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %16
  %81 = bitcast i64* %80 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %81, align 16, !alias.scope !4, !noalias !5
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond20 = icmp eq i64 %polly.indvar_next11, 32
  br i1 %exitcond20, label %polly.loop_exit9, label %polly.loop_preheader14
}

; Function Attrs: nounwind uwtable
define void @print_array() #1 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  br label %for.body3

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv
  %2 = load i64, i64* %arrayidx5, align 8
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 80
  %cmp6 = icmp eq i32 %rem, 79
  br i1 %cmp6, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4)
  br label %for.inc

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1024
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa)
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1024
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader

for.end11:                                        ; preds = %for.end
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #3 {
entry:
  br label %polly.loop_preheader2.i

polly.loop_exit3.i:                               ; preds = %polly.loop_exit9.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1
  %exitcond22.i = icmp eq i64 %polly.indvar_next.i, 32
  br i1 %exitcond22.i, label %polly.loop_preheader2.preheader, label %polly.loop_preheader2.i

polly.loop_preheader2.preheader:                  ; preds = %polly.loop_exit3.i
  br label %polly.loop_preheader2

polly.loop_exit9.i:                               ; preds = %vector.body
  %polly.indvar_next5.i = add nuw nsw i64 %polly.indvar4.i, 1
  %exitcond21.i = icmp eq i64 %polly.indvar_next5.i, 32
  br i1 %exitcond21.i, label %polly.loop_exit3.i, label %polly.loop_preheader8.i

polly.loop_preheader2.i:                          ; preds = %polly.loop_exit3.i, %entry
  %polly.indvar.i = phi i64 [ 0, %entry ], [ %polly.indvar_next.i, %polly.loop_exit3.i ]
  %0 = shl nsw i64 %polly.indvar.i, 5
  br label %polly.loop_preheader8.i

polly.loop_preheader8.i:                          ; preds = %polly.loop_preheader2.i, %polly.loop_exit9.i
  %polly.indvar4.i = phi i64 [ 0, %polly.loop_preheader2.i ], [ %polly.indvar_next5.i, %polly.loop_exit9.i ]
  %1 = shl nsw i64 %polly.indvar4.i, 5
  %2 = or i64 %1, 2
  %3 = or i64 %1, 4
  %4 = or i64 %1, 6
  %5 = or i64 %1, 8
  %6 = or i64 %1, 10
  %7 = or i64 %1, 12
  %8 = or i64 %1, 14
  %9 = or i64 %1, 16
  %10 = or i64 %1, 18
  %11 = or i64 %1, 20
  %12 = or i64 %1, 22
  %13 = or i64 %1, 24
  %14 = or i64 %1, 26
  %15 = or i64 %1, 28
  %16 = or i64 %1, 30
  br label %polly.loop_preheader14.i

polly.loop_preheader14.i:                         ; preds = %polly.loop_preheader8.i, %vector.body
  %polly.indvar10.i = phi i64 [ 0, %polly.loop_preheader8.i ], [ %polly.indvar_next11.i, %vector.body ]
  %17 = add nuw nsw i64 %polly.indvar10.i, %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader14.i
  %18 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %1
  %19 = bitcast i64* %18 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %19, align 16, !alias.scope !6, !noalias !8
  %20 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %1
  %21 = bitcast i64* %20 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %21, align 16, !alias.scope !9, !noalias !10
  %22 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %2
  %23 = bitcast i64* %22 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %23, align 16, !alias.scope !6, !noalias !8
  %24 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %2
  %25 = bitcast i64* %24 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %25, align 16, !alias.scope !9, !noalias !10
  %26 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %3
  %27 = bitcast i64* %26 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %27, align 16, !alias.scope !6, !noalias !8
  %28 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %3
  %29 = bitcast i64* %28 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %29, align 16, !alias.scope !9, !noalias !10
  %30 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %4
  %31 = bitcast i64* %30 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %31, align 16, !alias.scope !6, !noalias !8
  %32 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %4
  %33 = bitcast i64* %32 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %33, align 16, !alias.scope !9, !noalias !10
  %34 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %5
  %35 = bitcast i64* %34 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %35, align 16, !alias.scope !6, !noalias !8
  %36 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %5
  %37 = bitcast i64* %36 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %37, align 16, !alias.scope !9, !noalias !10
  %38 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %6
  %39 = bitcast i64* %38 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %39, align 16, !alias.scope !6, !noalias !8
  %40 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %6
  %41 = bitcast i64* %40 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %41, align 16, !alias.scope !9, !noalias !10
  %42 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %7
  %43 = bitcast i64* %42 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %43, align 16, !alias.scope !6, !noalias !8
  %44 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %7
  %45 = bitcast i64* %44 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %45, align 16, !alias.scope !9, !noalias !10
  %46 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %8
  %47 = bitcast i64* %46 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %47, align 16, !alias.scope !6, !noalias !8
  %48 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %8
  %49 = bitcast i64* %48 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %49, align 16, !alias.scope !9, !noalias !10
  %50 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %9
  %51 = bitcast i64* %50 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %51, align 16, !alias.scope !6, !noalias !8
  %52 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %9
  %53 = bitcast i64* %52 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %53, align 16, !alias.scope !9, !noalias !10
  %54 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %10
  %55 = bitcast i64* %54 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %55, align 16, !alias.scope !6, !noalias !8
  %56 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %10
  %57 = bitcast i64* %56 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %57, align 16, !alias.scope !9, !noalias !10
  %58 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %11
  %59 = bitcast i64* %58 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %59, align 16, !alias.scope !6, !noalias !8
  %60 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %11
  %61 = bitcast i64* %60 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %61, align 16, !alias.scope !9, !noalias !10
  %62 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %12
  %63 = bitcast i64* %62 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %63, align 16, !alias.scope !6, !noalias !8
  %64 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %12
  %65 = bitcast i64* %64 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %65, align 16, !alias.scope !9, !noalias !10
  %66 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %13
  %67 = bitcast i64* %66 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %67, align 16, !alias.scope !6, !noalias !8
  %68 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %13
  %69 = bitcast i64* %68 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %69, align 16, !alias.scope !9, !noalias !10
  %70 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %14
  %71 = bitcast i64* %70 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %71, align 16, !alias.scope !6, !noalias !8
  %72 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %14
  %73 = bitcast i64* %72 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %73, align 16, !alias.scope !9, !noalias !10
  %74 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %15
  %75 = bitcast i64* %74 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %75, align 16, !alias.scope !6, !noalias !8
  %76 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %15
  %77 = bitcast i64* %76 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %77, align 16, !alias.scope !9, !noalias !10
  %78 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %16
  %79 = bitcast i64* %78 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %79, align 16, !alias.scope !6, !noalias !8
  %80 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %16
  %81 = bitcast i64* %80 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %81, align 16, !alias.scope !9, !noalias !10
  %polly.indvar_next11.i = add nuw nsw i64 %polly.indvar10.i, 1
  %exitcond20.i = icmp eq i64 %polly.indvar_next11.i, 32
  br i1 %exitcond20.i, label %polly.loop_exit9.i, label %polly.loop_preheader14.i

polly.exiting:                                    ; preds = %polly.loop_exit27
  %82 = load i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 1023, i64 1023), align 8
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 1024, i32 1024, i64 %82) #4
  ret i32 0

polly.loop_exit3:                                 ; preds = %polly.loop_preheader14
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond69 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond69, label %polly.loop_preheader26.preheader, label %polly.loop_preheader2

polly.loop_preheader26.preheader:                 ; preds = %polly.loop_exit3
  br label %polly.loop_preheader26

polly.loop_preheader2:                            ; preds = %polly.loop_preheader2.preheader, %polly.loop_exit3
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit3 ], [ 0, %polly.loop_preheader2.preheader ]
  %83 = shl i64 %polly.indvar, 5
  %84 = or i64 %83, 1
  %85 = or i64 %83, 2
  %86 = or i64 %83, 3
  %87 = or i64 %83, 4
  %88 = or i64 %83, 5
  %89 = or i64 %83, 6
  %90 = or i64 %83, 7
  %91 = or i64 %83, 8
  %92 = or i64 %83, 9
  %93 = or i64 %83, 10
  %94 = or i64 %83, 11
  %95 = or i64 %83, 12
  %96 = or i64 %83, 13
  %97 = or i64 %83, 14
  %98 = or i64 %83, 15
  %99 = or i64 %83, 16
  %100 = or i64 %83, 17
  %101 = or i64 %83, 18
  %102 = or i64 %83, 19
  %103 = or i64 %83, 20
  %104 = or i64 %83, 21
  %105 = or i64 %83, 22
  %106 = or i64 %83, 23
  %107 = or i64 %83, 24
  %108 = or i64 %83, 25
  %109 = or i64 %83, 26
  %110 = or i64 %83, 27
  %111 = or i64 %83, 28
  %112 = or i64 %83, 29
  %113 = or i64 %83, 30
  %114 = or i64 %83, 31
  br label %polly.loop_preheader8

polly.loop_preheader8:                            ; preds = %polly.loop_preheader14, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_preheader14 ]
  %115 = shl i64 %polly.indvar4, 5
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %polly.loop_preheader8
  %scevgep70 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %83, i64 %115
  %scevgep7071 = bitcast i64* %scevgep70 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %84, i64 %115
  %scevgep7071.1 = bitcast i64* %scevgep70.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.1, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %85, i64 %115
  %scevgep7071.2 = bitcast i64* %scevgep70.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.2, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %86, i64 %115
  %scevgep7071.3 = bitcast i64* %scevgep70.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.3, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %87, i64 %115
  %scevgep7071.4 = bitcast i64* %scevgep70.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.4, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %88, i64 %115
  %scevgep7071.5 = bitcast i64* %scevgep70.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.5, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %89, i64 %115
  %scevgep7071.6 = bitcast i64* %scevgep70.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.6, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %90, i64 %115
  %scevgep7071.7 = bitcast i64* %scevgep70.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.7, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.8 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %91, i64 %115
  %scevgep7071.8 = bitcast i64* %scevgep70.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.8, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.9 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %92, i64 %115
  %scevgep7071.9 = bitcast i64* %scevgep70.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.9, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.10 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %93, i64 %115
  %scevgep7071.10 = bitcast i64* %scevgep70.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.10, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.11 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %94, i64 %115
  %scevgep7071.11 = bitcast i64* %scevgep70.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.11, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.12 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %95, i64 %115
  %scevgep7071.12 = bitcast i64* %scevgep70.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.12, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.13 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %96, i64 %115
  %scevgep7071.13 = bitcast i64* %scevgep70.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.13, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.14 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %97, i64 %115
  %scevgep7071.14 = bitcast i64* %scevgep70.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.14, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.15 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %98, i64 %115
  %scevgep7071.15 = bitcast i64* %scevgep70.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.15, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.16 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %99, i64 %115
  %scevgep7071.16 = bitcast i64* %scevgep70.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.16, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.17 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %100, i64 %115
  %scevgep7071.17 = bitcast i64* %scevgep70.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.17, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.18 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %101, i64 %115
  %scevgep7071.18 = bitcast i64* %scevgep70.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.18, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.19 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %102, i64 %115
  %scevgep7071.19 = bitcast i64* %scevgep70.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.19, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.20 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %103, i64 %115
  %scevgep7071.20 = bitcast i64* %scevgep70.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.20, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.21 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %104, i64 %115
  %scevgep7071.21 = bitcast i64* %scevgep70.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.21, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.22 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %105, i64 %115
  %scevgep7071.22 = bitcast i64* %scevgep70.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.22, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.23 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %106, i64 %115
  %scevgep7071.23 = bitcast i64* %scevgep70.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.23, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.24 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %107, i64 %115
  %scevgep7071.24 = bitcast i64* %scevgep70.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.24, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.25 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %108, i64 %115
  %scevgep7071.25 = bitcast i64* %scevgep70.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.25, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.26 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %109, i64 %115
  %scevgep7071.26 = bitcast i64* %scevgep70.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.26, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.27 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %110, i64 %115
  %scevgep7071.27 = bitcast i64* %scevgep70.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.27, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.28 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %111, i64 %115
  %scevgep7071.28 = bitcast i64* %scevgep70.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.28, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.29 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %112, i64 %115
  %scevgep7071.29 = bitcast i64* %scevgep70.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.29, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.30 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %113, i64 %115
  %scevgep7071.30 = bitcast i64* %scevgep70.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.30, i8 0, i64 256, i32 16, i1 false)
  %scevgep70.31 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %114, i64 %115
  %scevgep7071.31 = bitcast i64* %scevgep70.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7071.31, i8 0, i64 256, i32 16, i1 false)
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond68 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond68, label %polly.loop_exit3, label %polly.loop_preheader8

polly.loop_exit27:                                ; preds = %polly.loop_exit33
  %polly.indvar_next23 = add nuw nsw i64 %polly.indvar22, 1
  %exitcond65 = icmp eq i64 %polly.indvar_next23, 32
  br i1 %exitcond65, label %polly.exiting, label %polly.loop_preheader26

polly.loop_exit33:                                ; preds = %polly.loop_exit39
  %polly.indvar_next29 = add nuw nsw i64 %polly.indvar28, 1
  %exitcond64 = icmp eq i64 %polly.indvar_next29, 32
  br i1 %exitcond64, label %polly.loop_exit27, label %polly.loop_preheader32

polly.loop_preheader26:                           ; preds = %polly.loop_preheader26.preheader, %polly.loop_exit27
  %polly.indvar22 = phi i64 [ %polly.indvar_next23, %polly.loop_exit27 ], [ 0, %polly.loop_preheader26.preheader ]
  %116 = shl nsw i64 %polly.indvar22, 5
  br label %polly.loop_preheader32

polly.loop_exit39:                                ; preds = %polly.loop_exit45
  %polly.indvar_next35 = add nuw nsw i64 %polly.indvar34, 1
  %exitcond63 = icmp eq i64 %polly.indvar_next35, 32
  br i1 %exitcond63, label %polly.loop_exit33, label %polly.loop_preheader38

polly.loop_preheader32:                           ; preds = %polly.loop_exit33, %polly.loop_preheader26
  %polly.indvar28 = phi i64 [ 0, %polly.loop_preheader26 ], [ %polly.indvar_next29, %polly.loop_exit33 ]
  %117 = shl nsw i64 %polly.indvar28, 5
  br label %polly.loop_preheader38

polly.loop_exit45:                                ; preds = %polly.loop_exit51
  %polly.indvar_next41 = add nuw nsw i64 %polly.indvar40, 1
  %exitcond62 = icmp eq i64 %polly.indvar_next41, 32
  br i1 %exitcond62, label %polly.loop_exit39, label %polly.loop_preheader44

polly.loop_preheader38:                           ; preds = %polly.loop_exit39, %polly.loop_preheader32
  %polly.indvar34 = phi i64 [ 0, %polly.loop_preheader32 ], [ %polly.indvar_next35, %polly.loop_exit39 ]
  %118 = shl nsw i64 %polly.indvar34, 5
  br label %polly.loop_preheader44

polly.loop_exit51:                                ; preds = %polly.loop_header49
  %p_add.1.lcssa = phi i64 [ %p_add.1, %polly.loop_header49 ]
  store i64 %p_add.1.lcssa, i64* %scevgep55, align 8, !alias.scope !11, !noalias !13
  %polly.indvar_next47 = add nuw nsw i64 %polly.indvar46, 1
  %exitcond61 = icmp eq i64 %polly.indvar_next47, 32
  br i1 %exitcond61, label %polly.loop_exit45, label %polly.loop_preheader50

polly.loop_preheader44:                           ; preds = %polly.loop_exit45, %polly.loop_preheader38
  %polly.indvar40 = phi i64 [ 0, %polly.loop_preheader38 ], [ %polly.indvar_next41, %polly.loop_exit45 ]
  %119 = add nuw nsw i64 %polly.indvar40, %116
  br label %polly.loop_preheader50

polly.loop_header49:                              ; preds = %polly.loop_header49, %polly.loop_preheader50
  %p_add60 = phi i64 [ %scevgep55.promoted, %polly.loop_preheader50 ], [ %p_add.1, %polly.loop_header49 ]
  %polly.indvar52 = phi i64 [ 0, %polly.loop_preheader50 ], [ %polly.indvar_next53.1, %polly.loop_header49 ]
  %120 = add nuw nsw i64 %polly.indvar52, %118
  %scevgep56 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %119, i64 %120
  %_p_scalar_57 = load i64, i64* %scevgep56, align 16, !alias.scope !14, !noalias !16
  %scevgep58 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %120, i64 %122
  %_p_scalar_59 = load i64, i64* %scevgep58, align 8, !alias.scope !15, !noalias !17
  %p_mul = mul nsw i64 %_p_scalar_59, %_p_scalar_57
  %p_add = add nsw i64 %p_mul, %p_add60
  %polly.indvar_next53 = or i64 %polly.indvar52, 1
  %121 = add nuw nsw i64 %polly.indvar_next53, %118
  %scevgep56.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %119, i64 %121
  %_p_scalar_57.1 = load i64, i64* %scevgep56.1, align 8, !alias.scope !14, !noalias !16
  %scevgep58.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %121, i64 %122
  %_p_scalar_59.1 = load i64, i64* %scevgep58.1, align 8, !alias.scope !15, !noalias !17
  %p_mul.1 = mul nsw i64 %_p_scalar_59.1, %_p_scalar_57.1
  %p_add.1 = add nsw i64 %p_mul.1, %p_add
  %polly.indvar_next53.1 = add nsw i64 %polly.indvar52, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next53.1, 32
  br i1 %exitcond.1, label %polly.loop_exit51, label %polly.loop_header49

polly.loop_preheader50:                           ; preds = %polly.loop_exit51, %polly.loop_preheader44
  %polly.indvar46 = phi i64 [ 0, %polly.loop_preheader44 ], [ %polly.indvar_next47, %polly.loop_exit51 ]
  %122 = add nuw nsw i64 %polly.indvar46, %117
  %scevgep55 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %119, i64 %122
  %scevgep55.promoted = load i64, i64* %scevgep55, align 8, !alias.scope !11, !noalias !13
  br label %polly.loop_header49
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

attributes #0 = { norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 3f10def1e46ea783186be08e2138d0f76a707712) (http://llvm.org/git/llvm.git 626ceb277f4fd20c1899e04490b0ea6c2b1a0da8)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.A"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4}
!4 = distinct !{!4, !2, !"polly.alias.scope.B"}
!5 = !{!1}
!6 = distinct !{!6, !7, !"polly.alias.scope.A"}
!7 = distinct !{!7, !"polly.alias.scope.domain"}
!8 = !{!9}
!9 = distinct !{!9, !7, !"polly.alias.scope.B"}
!10 = !{!6}
!11 = distinct !{!11, !12, !"polly.alias.scope.C"}
!12 = distinct !{!12, !"polly.alias.scope.domain"}
!13 = !{!14, !15}
!14 = distinct !{!14, !12, !"polly.alias.scope.A"}
!15 = distinct !{!15, !12, !"polly.alias.scope.B"}
!16 = !{!11, !15}
!17 = !{!14, !11}
