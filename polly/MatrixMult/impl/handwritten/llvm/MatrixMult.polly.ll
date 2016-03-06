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

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !23, metadata !24), !dbg !25
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit3
  ret void, !dbg !26

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
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %19, align 16, !alias.scope !27, !noalias !29
  %20 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %1
  %21 = bitcast i64* %20 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %21, align 16, !alias.scope !30, !noalias !31
  %22 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %2
  %23 = bitcast i64* %22 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %23, align 16, !alias.scope !27, !noalias !29
  %24 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %2
  %25 = bitcast i64* %24 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %25, align 16, !alias.scope !30, !noalias !31
  %26 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %3
  %27 = bitcast i64* %26 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %27, align 16, !alias.scope !27, !noalias !29
  %28 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %3
  %29 = bitcast i64* %28 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %29, align 16, !alias.scope !30, !noalias !31
  %30 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %4
  %31 = bitcast i64* %30 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %31, align 16, !alias.scope !27, !noalias !29
  %32 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %4
  %33 = bitcast i64* %32 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %33, align 16, !alias.scope !30, !noalias !31
  %34 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %5
  %35 = bitcast i64* %34 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %35, align 16, !alias.scope !27, !noalias !29
  %36 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %5
  %37 = bitcast i64* %36 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %37, align 16, !alias.scope !30, !noalias !31
  %38 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %6
  %39 = bitcast i64* %38 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %39, align 16, !alias.scope !27, !noalias !29
  %40 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %6
  %41 = bitcast i64* %40 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %41, align 16, !alias.scope !30, !noalias !31
  %42 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %7
  %43 = bitcast i64* %42 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %43, align 16, !alias.scope !27, !noalias !29
  %44 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %7
  %45 = bitcast i64* %44 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %45, align 16, !alias.scope !30, !noalias !31
  %46 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %8
  %47 = bitcast i64* %46 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %47, align 16, !alias.scope !27, !noalias !29
  %48 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %8
  %49 = bitcast i64* %48 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %49, align 16, !alias.scope !30, !noalias !31
  %50 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %9
  %51 = bitcast i64* %50 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %51, align 16, !alias.scope !27, !noalias !29
  %52 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %9
  %53 = bitcast i64* %52 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %53, align 16, !alias.scope !30, !noalias !31
  %54 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %10
  %55 = bitcast i64* %54 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %55, align 16, !alias.scope !27, !noalias !29
  %56 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %10
  %57 = bitcast i64* %56 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %57, align 16, !alias.scope !30, !noalias !31
  %58 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %11
  %59 = bitcast i64* %58 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %59, align 16, !alias.scope !27, !noalias !29
  %60 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %11
  %61 = bitcast i64* %60 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %61, align 16, !alias.scope !30, !noalias !31
  %62 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %12
  %63 = bitcast i64* %62 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %63, align 16, !alias.scope !27, !noalias !29
  %64 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %12
  %65 = bitcast i64* %64 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %65, align 16, !alias.scope !30, !noalias !31
  %66 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %13
  %67 = bitcast i64* %66 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %67, align 16, !alias.scope !27, !noalias !29
  %68 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %13
  %69 = bitcast i64* %68 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %69, align 16, !alias.scope !30, !noalias !31
  %70 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %14
  %71 = bitcast i64* %70 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %71, align 16, !alias.scope !27, !noalias !29
  %72 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %14
  %73 = bitcast i64* %72 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %73, align 16, !alias.scope !30, !noalias !31
  %74 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %15
  %75 = bitcast i64* %74 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %75, align 16, !alias.scope !27, !noalias !29
  %76 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %15
  %77 = bitcast i64* %76 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %77, align 16, !alias.scope !30, !noalias !31
  %78 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %16
  %79 = bitcast i64* %78 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %79, align 16, !alias.scope !27, !noalias !29
  %80 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %16
  %81 = bitcast i64* %80 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %81, align 16, !alias.scope !30, !noalias !31
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond20 = icmp eq i64 %polly.indvar_next11, 32
  br i1 %exitcond20, label %polly.loop_exit9, label %polly.loop_preheader14
}

; Function Attrs: nounwind uwtable
define void @print_array() #1 !dbg !7 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !24), !dbg !33
  br label %for.cond1.preheader, !dbg !34

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !38
  br label %for.body3, !dbg !43

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !45
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !45
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4, !dbg !46
  %3 = trunc i64 %indvars.iv to i32, !dbg !47
  %rem = srem i32 %3, 80, !dbg !47
  %cmp6 = icmp eq i32 %rem, 79, !dbg !49
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !50

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !51
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !53
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !43
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !38
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !43
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !43

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !54
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !34
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1024, !dbg !34
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !34

for.end11:                                        ; preds = %for.end
  ret void, !dbg !55
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !23, metadata !24), !dbg !56
  br label %polly.loop_preheader2.i, !dbg !58

polly.loop_exit3.i:                               ; preds = %polly.loop_exit9.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1, !dbg !58
  %exitcond22.i = icmp eq i64 %polly.indvar_next.i, 32, !dbg !58
  br i1 %exitcond22.i, label %polly.loop_preheader2.preheader, label %polly.loop_preheader2.i, !dbg !58

polly.loop_preheader2.preheader:                  ; preds = %polly.loop_exit3.i
  br label %polly.loop_preheader2

polly.loop_exit9.i:                               ; preds = %vector.body
  %polly.indvar_next5.i = add nuw nsw i64 %polly.indvar4.i, 1, !dbg !58
  %exitcond21.i = icmp eq i64 %polly.indvar_next5.i, 32, !dbg !58
  br i1 %exitcond21.i, label %polly.loop_exit3.i, label %polly.loop_preheader8.i, !dbg !58

polly.loop_preheader2.i:                          ; preds = %polly.loop_exit3.i, %entry
  %polly.indvar.i = phi i64 [ 0, %entry ], [ %polly.indvar_next.i, %polly.loop_exit3.i ], !dbg !58
  %0 = shl nsw i64 %polly.indvar.i, 5, !dbg !58
  br label %polly.loop_preheader8.i, !dbg !58

polly.loop_preheader8.i:                          ; preds = %polly.loop_preheader2.i, %polly.loop_exit9.i
  %polly.indvar4.i = phi i64 [ 0, %polly.loop_preheader2.i ], [ %polly.indvar_next5.i, %polly.loop_exit9.i ], !dbg !58
  %1 = shl nsw i64 %polly.indvar4.i, 5, !dbg !58
  %2 = or i64 %1, 2, !dbg !58
  %3 = or i64 %1, 4, !dbg !58
  %4 = or i64 %1, 6, !dbg !58
  %5 = or i64 %1, 8, !dbg !58
  %6 = or i64 %1, 10, !dbg !58
  %7 = or i64 %1, 12, !dbg !58
  %8 = or i64 %1, 14, !dbg !58
  %9 = or i64 %1, 16, !dbg !58
  %10 = or i64 %1, 18, !dbg !58
  %11 = or i64 %1, 20, !dbg !58
  %12 = or i64 %1, 22, !dbg !58
  %13 = or i64 %1, 24, !dbg !58
  %14 = or i64 %1, 26, !dbg !58
  %15 = or i64 %1, 28, !dbg !58
  %16 = or i64 %1, 30, !dbg !58
  br label %polly.loop_preheader14.i, !dbg !58

polly.loop_preheader14.i:                         ; preds = %polly.loop_preheader8.i, %vector.body
  %polly.indvar10.i = phi i64 [ 0, %polly.loop_preheader8.i ], [ %polly.indvar_next11.i, %vector.body ], !dbg !58
  %17 = add nuw nsw i64 %polly.indvar10.i, %0, !dbg !58
  br label %vector.body, !dbg !58

vector.body:                                      ; preds = %polly.loop_preheader14.i
  %18 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %1, !dbg !58
  %19 = bitcast i64* %18 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %19, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %20 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %1, !dbg !58
  %21 = bitcast i64* %20 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %21, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %22 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %2, !dbg !58
  %23 = bitcast i64* %22 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %23, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %24 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %2, !dbg !58
  %25 = bitcast i64* %24 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %25, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %26 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %3, !dbg !58
  %27 = bitcast i64* %26 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %27, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %28 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %3, !dbg !58
  %29 = bitcast i64* %28 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %29, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %30 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %4, !dbg !58
  %31 = bitcast i64* %30 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %31, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %32 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %4, !dbg !58
  %33 = bitcast i64* %32 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %33, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %34 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %5, !dbg !58
  %35 = bitcast i64* %34 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %35, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %36 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %5, !dbg !58
  %37 = bitcast i64* %36 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %37, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %38 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %6, !dbg !58
  %39 = bitcast i64* %38 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %39, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %40 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %6, !dbg !58
  %41 = bitcast i64* %40 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %41, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %42 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %7, !dbg !58
  %43 = bitcast i64* %42 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %43, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %44 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %7, !dbg !58
  %45 = bitcast i64* %44 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %45, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %46 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %8, !dbg !58
  %47 = bitcast i64* %46 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %47, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %48 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %8, !dbg !58
  %49 = bitcast i64* %48 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %49, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %50 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %9, !dbg !58
  %51 = bitcast i64* %50 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %51, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %52 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %9, !dbg !58
  %53 = bitcast i64* %52 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %53, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %54 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %10, !dbg !58
  %55 = bitcast i64* %54 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %55, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %56 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %10, !dbg !58
  %57 = bitcast i64* %56 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %57, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %58 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %11, !dbg !58
  %59 = bitcast i64* %58 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %59, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %60 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %11, !dbg !58
  %61 = bitcast i64* %60 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %61, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %62 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %12, !dbg !58
  %63 = bitcast i64* %62 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %63, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %64 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %12, !dbg !58
  %65 = bitcast i64* %64 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %65, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %66 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %13, !dbg !58
  %67 = bitcast i64* %66 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %67, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %68 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %13, !dbg !58
  %69 = bitcast i64* %68 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %69, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %70 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %14, !dbg !58
  %71 = bitcast i64* %70 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %71, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %72 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %14, !dbg !58
  %73 = bitcast i64* %72 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %73, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %74 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %15, !dbg !58
  %75 = bitcast i64* %74 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %75, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %76 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %15, !dbg !58
  %77 = bitcast i64* %76 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %77, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %78 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %16, !dbg !58
  %79 = bitcast i64* %78 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %79, align 16, !dbg !58, !alias.scope !59, !noalias !61
  %80 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %16, !dbg !58
  %81 = bitcast i64* %80 to <2 x i64>*, !dbg !58
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %81, align 16, !dbg !58, !alias.scope !62, !noalias !63
  %polly.indvar_next11.i = add nuw nsw i64 %polly.indvar10.i, 1, !dbg !58
  %exitcond20.i = icmp eq i64 %polly.indvar_next11.i, 32, !dbg !58
  br i1 %exitcond20.i, label %polly.loop_exit9.i, label %polly.loop_preheader14.i, !dbg !58

polly.exiting:                                    ; preds = %polly.loop_exit27
  %82 = load i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 1023, i64 1023), align 8, !dbg !64
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 1024, i32 1024, i64 %82) #4, !dbg !65
  ret i32 0, !dbg !66

polly.loop_exit3:                                 ; preds = %polly.loop_preheader14
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond71 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond71, label %polly.loop_preheader26.preheader, label %polly.loop_preheader2

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
  %scevgep67 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %83, i64 %115
  %scevgep6768 = bitcast i64* %scevgep67 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %84, i64 %115
  %scevgep6768.1 = bitcast i64* %scevgep67.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.1, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %85, i64 %115
  %scevgep6768.2 = bitcast i64* %scevgep67.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.2, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %86, i64 %115
  %scevgep6768.3 = bitcast i64* %scevgep67.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.3, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %87, i64 %115
  %scevgep6768.4 = bitcast i64* %scevgep67.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.4, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %88, i64 %115
  %scevgep6768.5 = bitcast i64* %scevgep67.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.5, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %89, i64 %115
  %scevgep6768.6 = bitcast i64* %scevgep67.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.6, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %90, i64 %115
  %scevgep6768.7 = bitcast i64* %scevgep67.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.7, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.8 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %91, i64 %115
  %scevgep6768.8 = bitcast i64* %scevgep67.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.8, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.9 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %92, i64 %115
  %scevgep6768.9 = bitcast i64* %scevgep67.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.9, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.10 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %93, i64 %115
  %scevgep6768.10 = bitcast i64* %scevgep67.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.10, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.11 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %94, i64 %115
  %scevgep6768.11 = bitcast i64* %scevgep67.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.11, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.12 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %95, i64 %115
  %scevgep6768.12 = bitcast i64* %scevgep67.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.12, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.13 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %96, i64 %115
  %scevgep6768.13 = bitcast i64* %scevgep67.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.13, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.14 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %97, i64 %115
  %scevgep6768.14 = bitcast i64* %scevgep67.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.14, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.15 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %98, i64 %115
  %scevgep6768.15 = bitcast i64* %scevgep67.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.15, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.16 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %99, i64 %115
  %scevgep6768.16 = bitcast i64* %scevgep67.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.16, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.17 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %100, i64 %115
  %scevgep6768.17 = bitcast i64* %scevgep67.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.17, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.18 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %101, i64 %115
  %scevgep6768.18 = bitcast i64* %scevgep67.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.18, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.19 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %102, i64 %115
  %scevgep6768.19 = bitcast i64* %scevgep67.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.19, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.20 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %103, i64 %115
  %scevgep6768.20 = bitcast i64* %scevgep67.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.20, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.21 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %104, i64 %115
  %scevgep6768.21 = bitcast i64* %scevgep67.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.21, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.22 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %105, i64 %115
  %scevgep6768.22 = bitcast i64* %scevgep67.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.22, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.23 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %106, i64 %115
  %scevgep6768.23 = bitcast i64* %scevgep67.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.23, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.24 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %107, i64 %115
  %scevgep6768.24 = bitcast i64* %scevgep67.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.24, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.25 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %108, i64 %115
  %scevgep6768.25 = bitcast i64* %scevgep67.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.25, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.26 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %109, i64 %115
  %scevgep6768.26 = bitcast i64* %scevgep67.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.26, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.27 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %110, i64 %115
  %scevgep6768.27 = bitcast i64* %scevgep67.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.27, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.28 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %111, i64 %115
  %scevgep6768.28 = bitcast i64* %scevgep67.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.28, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.29 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %112, i64 %115
  %scevgep6768.29 = bitcast i64* %scevgep67.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.29, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.30 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %113, i64 %115
  %scevgep6768.30 = bitcast i64* %scevgep67.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.30, i8 0, i64 256, i32 16, i1 false)
  %scevgep67.31 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %114, i64 %115
  %scevgep6768.31 = bitcast i64* %scevgep67.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6768.31, i8 0, i64 256, i32 16, i1 false)
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond70 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond70, label %polly.loop_exit3, label %polly.loop_preheader8

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
  store i64 %p_add.1.lcssa, i64* %scevgep55, align 8, !alias.scope !67, !noalias !69
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
  %_p_scalar_57 = load i64, i64* %scevgep56, align 16, !alias.scope !71, !noalias !72
  %scevgep58 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %120, i64 %122
  %_p_scalar_59 = load i64, i64* %scevgep58, align 8, !alias.scope !70, !noalias !73
  %p_mul = mul nsw i64 %_p_scalar_59, %_p_scalar_57, !dbg !74
  %p_add = add nsw i64 %p_mul, %p_add60, !dbg !83
  %polly.indvar_next53 = or i64 %polly.indvar52, 1
  %121 = add nuw nsw i64 %polly.indvar_next53, %118
  %scevgep56.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %119, i64 %121
  %_p_scalar_57.1 = load i64, i64* %scevgep56.1, align 8, !alias.scope !71, !noalias !72
  %scevgep58.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %121, i64 %122
  %_p_scalar_59.1 = load i64, i64* %scevgep58.1, align 8, !alias.scope !70, !noalias !73
  %p_mul.1 = mul nsw i64 %_p_scalar_59.1, %_p_scalar_57.1, !dbg !74
  %p_add.1 = add nsw i64 %p_mul.1, %p_add, !dbg !83
  %polly.indvar_next53.1 = add nsw i64 %polly.indvar52, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next53.1, 32
  br i1 %exitcond.1, label %polly.loop_exit51, label %polly.loop_header49

polly.loop_preheader50:                           ; preds = %polly.loop_exit51, %polly.loop_preheader44
  %polly.indvar46 = phi i64 [ 0, %polly.loop_preheader44 ], [ %polly.indvar_next47, %polly.loop_exit51 ]
  %122 = add nuw nsw i64 %polly.indvar46, %117
  %scevgep55 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %119, i64 %122
  %scevgep55.promoted = load i64, i64* %scevgep55, align 8, !alias.scope !67, !noalias !69
  br label %polly.loop_header49
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !12)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8}
!4 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 7, type: !5, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 19, type: !5, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 32, type: !9, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !{!13, !18, !19}
!13 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !14, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @A)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 67108864, align: 64, elements: !16)
!15 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!16 = !{!17, !17}
!17 = !DISubrange(count: 1024)
!18 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !14, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @B)
!19 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !14, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @C)
!20 = !{i32 2, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!23 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !11)
!24 = !DIExpression()
!25 = !DILocation(line: 9, column: 9, scope: !4)
!26 = !DILocation(line: 17, column: 1, scope: !4)
!27 = distinct !{!27, !28, !"polly.alias.scope.A"}
!28 = distinct !{!28, !"polly.alias.scope.domain"}
!29 = !{!30}
!30 = distinct !{!30, !28, !"polly.alias.scope.B"}
!31 = !{!27}
!32 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 21, type: !11)
!33 = !DILocation(line: 21, column: 9, scope: !7)
!34 = !DILocation(line: 23, column: 5, scope: !35)
!35 = !DILexicalBlockFile(scope: !36, file: !1, discriminator: 1)
!36 = distinct !DILexicalBlock(scope: !37, file: !1, line: 23, column: 5)
!37 = distinct !DILexicalBlock(scope: !7, file: !1, line: 23, column: 5)
!38 = !DILocation(line: 25, column: 21, scope: !39)
!39 = distinct !DILexicalBlock(scope: !40, file: !1, line: 24, column: 29)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 24, column: 9)
!41 = distinct !DILexicalBlock(scope: !42, file: !1, line: 24, column: 9)
!42 = distinct !DILexicalBlock(scope: !36, file: !1, line: 23, column: 25)
!43 = !DILocation(line: 24, column: 9, scope: !44)
!44 = !DILexicalBlockFile(scope: !40, file: !1, discriminator: 1)
!45 = !DILocation(line: 25, column: 38, scope: !39)
!46 = !DILocation(line: 25, column: 13, scope: !39)
!47 = !DILocation(line: 26, column: 18, scope: !48)
!48 = distinct !DILexicalBlock(scope: !39, file: !1, line: 26, column: 17)
!49 = !DILocation(line: 26, column: 22, scope: !48)
!50 = !DILocation(line: 26, column: 17, scope: !39)
!51 = !DILocation(line: 26, column: 37, scope: !52)
!52 = !DILexicalBlockFile(scope: !48, file: !1, discriminator: 1)
!53 = !DILocation(line: 26, column: 29, scope: !52)
!54 = !DILocation(line: 28, column: 9, scope: !42)
!55 = !DILocation(line: 30, column: 1, scope: !7)
!56 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !57)
!57 = distinct !DILocation(line: 37, column: 5, scope: !8)
!58 = !DILocation(line: 37, column: 5, scope: !8)
!59 = distinct !{!59, !60, !"polly.alias.scope.A"}
!60 = distinct !{!60, !"polly.alias.scope.domain"}
!61 = !{!62}
!62 = distinct !{!62, !60, !"polly.alias.scope.B"}
!63 = !{!59}
!64 = !DILocation(line: 47, column: 71, scope: !8)
!65 = !DILocation(line: 47, column: 5, scope: !8)
!66 = !DILocation(line: 48, column: 5, scope: !8)
!67 = distinct !{!67, !68, !"polly.alias.scope.C"}
!68 = distinct !{!68, !"polly.alias.scope.domain"}
!69 = !{!70, !71}
!70 = distinct !{!70, !68, !"polly.alias.scope.B"}
!71 = distinct !{!71, !68, !"polly.alias.scope.A"}
!72 = !{!67, !70}
!73 = !{!67, !71}
!74 = !DILocation(line: 43, column: 45, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 42, column: 13)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 42, column: 13)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 40, column: 29)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 40, column: 9)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 40, column: 9)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 39, column: 25)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 39, column: 5)
!82 = distinct !DILexicalBlock(scope: !8, file: !1, line: 39, column: 5)
!83 = !DILocation(line: 43, column: 35, scope: !75)
