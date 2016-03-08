; ModuleID = 'MatrixAdd.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@B = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@C = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.2 = private unnamed_addr constant [51 x i8] c"Pass %d X %d matrix test case (C[%d][%d] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  br label %entry.split, !dbg !24

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !24
  br label %vector.ph, !dbg !27

vector.ph:                                        ; preds = %for.inc10, %entry.split
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc10 ]
  br label %vector.body, !dbg !31

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !31
  %0 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index, !dbg !36
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !38
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !38
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !38
  %4 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index, !dbg !39
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !40
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !40
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !40
  %index.next = or i64 %index, 4, !dbg !31
  %8 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !36
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !38
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !38
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !38
  %12 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !39
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !40
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !40
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !40
  %index.next.1 = add nsw i64 %index, 8, !dbg !31
  %16 = icmp eq i64 %index.next.1, 1024, !dbg !31
  br i1 %16, label %for.inc10, label %vector.body, !dbg !31, !llvm.loop !41

for.inc10:                                        ; preds = %vector.body
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !27
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1024, !dbg !27
  br i1 %exitcond5, label %for.end12, label %vector.ph, !dbg !27

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @mat_add() #1 !dbg !7 {
entry:
  br label %entry.split, !dbg !45

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !26), !dbg !45
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit3
  ret void, !dbg !47

polly.loop_exit3:                                 ; preds = %polly.loop_exit9
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond24 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond24, label %polly.exiting, label %polly.loop_preheader2

polly.loop_exit9:                                 ; preds = %vector.body
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond23 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond23, label %polly.loop_exit3, label %polly.loop_preheader8

polly.loop_preheader2:                            ; preds = %polly.loop_exit3, %entry.split
  %polly.indvar = phi i64 [ 0, %entry.split ], [ %polly.indvar_next, %polly.loop_exit3 ]
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
  %wide.load = load <2 x i64>, <2 x i64>* %19, align 16, !alias.scope !48, !noalias !50
  %20 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %1
  %21 = bitcast i64* %20 to <2 x i64>*
  %wide.load27 = load <2 x i64>, <2 x i64>* %21, align 16, !alias.scope !52, !noalias !53
  %22 = add nsw <2 x i64> %wide.load27, %wide.load, !dbg !54
  %23 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %1
  %24 = bitcast i64* %23 to <2 x i64>*
  store <2 x i64> %22, <2 x i64>* %24, align 16, !alias.scope !51, !noalias !61
  %25 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %2
  %26 = bitcast i64* %25 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %26, align 16, !alias.scope !48, !noalias !50
  %27 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %2
  %28 = bitcast i64* %27 to <2 x i64>*
  %wide.load27.1 = load <2 x i64>, <2 x i64>* %28, align 16, !alias.scope !52, !noalias !53
  %29 = add nsw <2 x i64> %wide.load27.1, %wide.load.1, !dbg !54
  %30 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %2
  %31 = bitcast i64* %30 to <2 x i64>*
  store <2 x i64> %29, <2 x i64>* %31, align 16, !alias.scope !51, !noalias !61
  %32 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %3
  %33 = bitcast i64* %32 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %33, align 16, !alias.scope !48, !noalias !50
  %34 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %3
  %35 = bitcast i64* %34 to <2 x i64>*
  %wide.load27.2 = load <2 x i64>, <2 x i64>* %35, align 16, !alias.scope !52, !noalias !53
  %36 = add nsw <2 x i64> %wide.load27.2, %wide.load.2, !dbg !54
  %37 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %3
  %38 = bitcast i64* %37 to <2 x i64>*
  store <2 x i64> %36, <2 x i64>* %38, align 16, !alias.scope !51, !noalias !61
  %39 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %4
  %40 = bitcast i64* %39 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %40, align 16, !alias.scope !48, !noalias !50
  %41 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %4
  %42 = bitcast i64* %41 to <2 x i64>*
  %wide.load27.3 = load <2 x i64>, <2 x i64>* %42, align 16, !alias.scope !52, !noalias !53
  %43 = add nsw <2 x i64> %wide.load27.3, %wide.load.3, !dbg !54
  %44 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %4
  %45 = bitcast i64* %44 to <2 x i64>*
  store <2 x i64> %43, <2 x i64>* %45, align 16, !alias.scope !51, !noalias !61
  %46 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %5
  %47 = bitcast i64* %46 to <2 x i64>*
  %wide.load.4 = load <2 x i64>, <2 x i64>* %47, align 16, !alias.scope !48, !noalias !50
  %48 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %5
  %49 = bitcast i64* %48 to <2 x i64>*
  %wide.load27.4 = load <2 x i64>, <2 x i64>* %49, align 16, !alias.scope !52, !noalias !53
  %50 = add nsw <2 x i64> %wide.load27.4, %wide.load.4, !dbg !54
  %51 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %5
  %52 = bitcast i64* %51 to <2 x i64>*
  store <2 x i64> %50, <2 x i64>* %52, align 16, !alias.scope !51, !noalias !61
  %53 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %6
  %54 = bitcast i64* %53 to <2 x i64>*
  %wide.load.5 = load <2 x i64>, <2 x i64>* %54, align 16, !alias.scope !48, !noalias !50
  %55 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %6
  %56 = bitcast i64* %55 to <2 x i64>*
  %wide.load27.5 = load <2 x i64>, <2 x i64>* %56, align 16, !alias.scope !52, !noalias !53
  %57 = add nsw <2 x i64> %wide.load27.5, %wide.load.5, !dbg !54
  %58 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %6
  %59 = bitcast i64* %58 to <2 x i64>*
  store <2 x i64> %57, <2 x i64>* %59, align 16, !alias.scope !51, !noalias !61
  %60 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %7
  %61 = bitcast i64* %60 to <2 x i64>*
  %wide.load.6 = load <2 x i64>, <2 x i64>* %61, align 16, !alias.scope !48, !noalias !50
  %62 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %7
  %63 = bitcast i64* %62 to <2 x i64>*
  %wide.load27.6 = load <2 x i64>, <2 x i64>* %63, align 16, !alias.scope !52, !noalias !53
  %64 = add nsw <2 x i64> %wide.load27.6, %wide.load.6, !dbg !54
  %65 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %7
  %66 = bitcast i64* %65 to <2 x i64>*
  store <2 x i64> %64, <2 x i64>* %66, align 16, !alias.scope !51, !noalias !61
  %67 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %8
  %68 = bitcast i64* %67 to <2 x i64>*
  %wide.load.7 = load <2 x i64>, <2 x i64>* %68, align 16, !alias.scope !48, !noalias !50
  %69 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %8
  %70 = bitcast i64* %69 to <2 x i64>*
  %wide.load27.7 = load <2 x i64>, <2 x i64>* %70, align 16, !alias.scope !52, !noalias !53
  %71 = add nsw <2 x i64> %wide.load27.7, %wide.load.7, !dbg !54
  %72 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %8
  %73 = bitcast i64* %72 to <2 x i64>*
  store <2 x i64> %71, <2 x i64>* %73, align 16, !alias.scope !51, !noalias !61
  %74 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %9
  %75 = bitcast i64* %74 to <2 x i64>*
  %wide.load.8 = load <2 x i64>, <2 x i64>* %75, align 16, !alias.scope !48, !noalias !50
  %76 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %9
  %77 = bitcast i64* %76 to <2 x i64>*
  %wide.load27.8 = load <2 x i64>, <2 x i64>* %77, align 16, !alias.scope !52, !noalias !53
  %78 = add nsw <2 x i64> %wide.load27.8, %wide.load.8, !dbg !54
  %79 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %9
  %80 = bitcast i64* %79 to <2 x i64>*
  store <2 x i64> %78, <2 x i64>* %80, align 16, !alias.scope !51, !noalias !61
  %81 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %10
  %82 = bitcast i64* %81 to <2 x i64>*
  %wide.load.9 = load <2 x i64>, <2 x i64>* %82, align 16, !alias.scope !48, !noalias !50
  %83 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %10
  %84 = bitcast i64* %83 to <2 x i64>*
  %wide.load27.9 = load <2 x i64>, <2 x i64>* %84, align 16, !alias.scope !52, !noalias !53
  %85 = add nsw <2 x i64> %wide.load27.9, %wide.load.9, !dbg !54
  %86 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %10
  %87 = bitcast i64* %86 to <2 x i64>*
  store <2 x i64> %85, <2 x i64>* %87, align 16, !alias.scope !51, !noalias !61
  %88 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %11
  %89 = bitcast i64* %88 to <2 x i64>*
  %wide.load.10 = load <2 x i64>, <2 x i64>* %89, align 16, !alias.scope !48, !noalias !50
  %90 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %11
  %91 = bitcast i64* %90 to <2 x i64>*
  %wide.load27.10 = load <2 x i64>, <2 x i64>* %91, align 16, !alias.scope !52, !noalias !53
  %92 = add nsw <2 x i64> %wide.load27.10, %wide.load.10, !dbg !54
  %93 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %11
  %94 = bitcast i64* %93 to <2 x i64>*
  store <2 x i64> %92, <2 x i64>* %94, align 16, !alias.scope !51, !noalias !61
  %95 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %12
  %96 = bitcast i64* %95 to <2 x i64>*
  %wide.load.11 = load <2 x i64>, <2 x i64>* %96, align 16, !alias.scope !48, !noalias !50
  %97 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %12
  %98 = bitcast i64* %97 to <2 x i64>*
  %wide.load27.11 = load <2 x i64>, <2 x i64>* %98, align 16, !alias.scope !52, !noalias !53
  %99 = add nsw <2 x i64> %wide.load27.11, %wide.load.11, !dbg !54
  %100 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %12
  %101 = bitcast i64* %100 to <2 x i64>*
  store <2 x i64> %99, <2 x i64>* %101, align 16, !alias.scope !51, !noalias !61
  %102 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %13
  %103 = bitcast i64* %102 to <2 x i64>*
  %wide.load.12 = load <2 x i64>, <2 x i64>* %103, align 16, !alias.scope !48, !noalias !50
  %104 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %13
  %105 = bitcast i64* %104 to <2 x i64>*
  %wide.load27.12 = load <2 x i64>, <2 x i64>* %105, align 16, !alias.scope !52, !noalias !53
  %106 = add nsw <2 x i64> %wide.load27.12, %wide.load.12, !dbg !54
  %107 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %13
  %108 = bitcast i64* %107 to <2 x i64>*
  store <2 x i64> %106, <2 x i64>* %108, align 16, !alias.scope !51, !noalias !61
  %109 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %14
  %110 = bitcast i64* %109 to <2 x i64>*
  %wide.load.13 = load <2 x i64>, <2 x i64>* %110, align 16, !alias.scope !48, !noalias !50
  %111 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %14
  %112 = bitcast i64* %111 to <2 x i64>*
  %wide.load27.13 = load <2 x i64>, <2 x i64>* %112, align 16, !alias.scope !52, !noalias !53
  %113 = add nsw <2 x i64> %wide.load27.13, %wide.load.13, !dbg !54
  %114 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %14
  %115 = bitcast i64* %114 to <2 x i64>*
  store <2 x i64> %113, <2 x i64>* %115, align 16, !alias.scope !51, !noalias !61
  %116 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %15
  %117 = bitcast i64* %116 to <2 x i64>*
  %wide.load.14 = load <2 x i64>, <2 x i64>* %117, align 16, !alias.scope !48, !noalias !50
  %118 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %15
  %119 = bitcast i64* %118 to <2 x i64>*
  %wide.load27.14 = load <2 x i64>, <2 x i64>* %119, align 16, !alias.scope !52, !noalias !53
  %120 = add nsw <2 x i64> %wide.load27.14, %wide.load.14, !dbg !54
  %121 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %15
  %122 = bitcast i64* %121 to <2 x i64>*
  store <2 x i64> %120, <2 x i64>* %122, align 16, !alias.scope !51, !noalias !61
  %123 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %16
  %124 = bitcast i64* %123 to <2 x i64>*
  %wide.load.15 = load <2 x i64>, <2 x i64>* %124, align 16, !alias.scope !48, !noalias !50
  %125 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %16
  %126 = bitcast i64* %125 to <2 x i64>*
  %wide.load27.15 = load <2 x i64>, <2 x i64>* %126, align 16, !alias.scope !52, !noalias !53
  %127 = add nsw <2 x i64> %wide.load27.15, %wide.load.15, !dbg !54
  %128 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %17, i64 %16
  %129 = bitcast i64* %128 to <2 x i64>*
  store <2 x i64> %127, <2 x i64>* %129, align 16, !alias.scope !51, !noalias !61
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond22 = icmp eq i64 %polly.indvar_next11, 32
  br i1 %exitcond22, label %polly.loop_exit9, label %polly.loop_preheader14
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !62

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !63, metadata !26), !dbg !62
  br label %for.cond1.preheader, !dbg !64

for.cond1.preheader:                              ; preds = %for.end, %entry.split
  %indvars.iv6 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !68
  br label %for.body3, !dbg !73

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !75
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !75
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4, !dbg !76
  %3 = trunc i64 %indvars.iv to i32, !dbg !77
  %rem = srem i32 %3, 80, !dbg !77
  %cmp6 = icmp eq i32 %rem, 79, !dbg !79
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !80

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !81
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !83
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !73
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !68
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !73
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !73

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !84
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !64
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1024, !dbg !64
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !64

for.end11:                                        ; preds = %for.end
  ret void, !dbg !85
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !9 {
entry:
  br label %entry.split, !dbg !86

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !87, metadata !26), !dbg !86
  br label %for.body, !dbg !88

for.body:                                         ; preds = %mat_add.exit, %entry.split
  %r.01 = phi i32 [ 0, %entry.split ], [ %inc, %mat_add.exit ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !92
  br label %vector.ph9, !dbg !95

vector.ph9:                                       ; preds = %for.inc10.i, %for.body
  %indvars.iv3.i = phi i64 [ 0, %for.body ], [ %indvars.iv.next4.i, %for.inc10.i ], !dbg !96
  br label %vector.body5, !dbg !97

vector.body5:                                     ; preds = %vector.body5, %vector.ph9
  %index10 = phi i64 [ 0, %vector.ph9 ], [ %index.next11.1, %vector.body5 ], !dbg !96
  %0 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index10, !dbg !98
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !99
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !99
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !99
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !99
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !99
  %4 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index10, !dbg !100
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !101
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !101
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !101
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !101
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !101
  %index.next11 = or i64 %index10, 4, !dbg !97
  %8 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index.next11, !dbg !98
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !99
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !99
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !99
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !99
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !99
  %12 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index.next11, !dbg !100
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !101
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !101
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !101
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !101
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !101
  %index.next11.1 = add nsw i64 %index10, 8, !dbg !97
  %16 = icmp eq i64 %index.next11.1, 1024, !dbg !97
  br i1 %16, label %for.inc10.i, label %vector.body5, !dbg !97, !llvm.loop !102

for.inc10.i:                                      ; preds = %vector.body5
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !95
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 1024, !dbg !95
  br i1 %exitcond5.i, label %polly.loop_preheader2.i.preheader, label %vector.ph9, !dbg !95

polly.loop_preheader2.i.preheader:                ; preds = %for.inc10.i
  br label %polly.loop_preheader2.i, !dbg !103

polly.loop_exit3.i:                               ; preds = %polly.loop_exit9.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1, !dbg !103
  %exitcond24.i = icmp eq i64 %polly.indvar_next.i, 32, !dbg !103
  br i1 %exitcond24.i, label %mat_add.exit, label %polly.loop_preheader2.i, !dbg !103

polly.loop_exit9.i:                               ; preds = %vector.body
  %polly.indvar_next5.i = add nuw nsw i64 %polly.indvar4.i, 1, !dbg !103
  %exitcond23.i = icmp eq i64 %polly.indvar_next5.i, 32, !dbg !103
  br i1 %exitcond23.i, label %polly.loop_exit3.i, label %polly.loop_preheader8.i, !dbg !103

polly.loop_preheader2.i:                          ; preds = %polly.loop_preheader2.i.preheader, %polly.loop_exit3.i
  %polly.indvar.i = phi i64 [ %polly.indvar_next.i, %polly.loop_exit3.i ], [ 0, %polly.loop_preheader2.i.preheader ], !dbg !103
  %17 = shl nsw i64 %polly.indvar.i, 5, !dbg !103
  br label %polly.loop_preheader8.i, !dbg !103

polly.loop_preheader8.i:                          ; preds = %polly.loop_preheader2.i, %polly.loop_exit9.i
  %polly.indvar4.i = phi i64 [ 0, %polly.loop_preheader2.i ], [ %polly.indvar_next5.i, %polly.loop_exit9.i ], !dbg !103
  %18 = shl nsw i64 %polly.indvar4.i, 5, !dbg !103
  %19 = or i64 %18, 2, !dbg !103
  %20 = or i64 %18, 4, !dbg !103
  %21 = or i64 %18, 6, !dbg !103
  %22 = or i64 %18, 8, !dbg !103
  %23 = or i64 %18, 10, !dbg !103
  %24 = or i64 %18, 12, !dbg !103
  %25 = or i64 %18, 14, !dbg !103
  %26 = or i64 %18, 16, !dbg !103
  %27 = or i64 %18, 18, !dbg !103
  %28 = or i64 %18, 20, !dbg !103
  %29 = or i64 %18, 22, !dbg !103
  %30 = or i64 %18, 24, !dbg !103
  %31 = or i64 %18, 26, !dbg !103
  %32 = or i64 %18, 28, !dbg !103
  %33 = or i64 %18, 30, !dbg !103
  br label %polly.loop_preheader14.i, !dbg !103

polly.loop_preheader14.i:                         ; preds = %polly.loop_preheader8.i, %vector.body
  %polly.indvar10.i = phi i64 [ 0, %polly.loop_preheader8.i ], [ %polly.indvar_next11.i, %vector.body ], !dbg !103
  %34 = add nuw nsw i64 %polly.indvar10.i, %17, !dbg !103
  br label %vector.body, !dbg !103

vector.body:                                      ; preds = %polly.loop_preheader14.i
  %35 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %18, !dbg !103
  %36 = bitcast i64* %35 to <2 x i64>*, !dbg !103
  %wide.load = load <2 x i64>, <2 x i64>* %36, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %37 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %18, !dbg !103
  %38 = bitcast i64* %37 to <2 x i64>*, !dbg !103
  %wide.load4 = load <2 x i64>, <2 x i64>* %38, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %39 = add nsw <2 x i64> %wide.load4, %wide.load, !dbg !110
  %40 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %18, !dbg !103
  %41 = bitcast i64* %40 to <2 x i64>*, !dbg !103
  store <2 x i64> %39, <2 x i64>* %41, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %42 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %19, !dbg !103
  %43 = bitcast i64* %42 to <2 x i64>*, !dbg !103
  %wide.load.1 = load <2 x i64>, <2 x i64>* %43, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %44 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %19, !dbg !103
  %45 = bitcast i64* %44 to <2 x i64>*, !dbg !103
  %wide.load4.1 = load <2 x i64>, <2 x i64>* %45, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %46 = add nsw <2 x i64> %wide.load4.1, %wide.load.1, !dbg !110
  %47 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %19, !dbg !103
  %48 = bitcast i64* %47 to <2 x i64>*, !dbg !103
  store <2 x i64> %46, <2 x i64>* %48, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %49 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %20, !dbg !103
  %50 = bitcast i64* %49 to <2 x i64>*, !dbg !103
  %wide.load.2 = load <2 x i64>, <2 x i64>* %50, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %51 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %20, !dbg !103
  %52 = bitcast i64* %51 to <2 x i64>*, !dbg !103
  %wide.load4.2 = load <2 x i64>, <2 x i64>* %52, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %53 = add nsw <2 x i64> %wide.load4.2, %wide.load.2, !dbg !110
  %54 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %20, !dbg !103
  %55 = bitcast i64* %54 to <2 x i64>*, !dbg !103
  store <2 x i64> %53, <2 x i64>* %55, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %56 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %21, !dbg !103
  %57 = bitcast i64* %56 to <2 x i64>*, !dbg !103
  %wide.load.3 = load <2 x i64>, <2 x i64>* %57, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %58 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %21, !dbg !103
  %59 = bitcast i64* %58 to <2 x i64>*, !dbg !103
  %wide.load4.3 = load <2 x i64>, <2 x i64>* %59, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %60 = add nsw <2 x i64> %wide.load4.3, %wide.load.3, !dbg !110
  %61 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %21, !dbg !103
  %62 = bitcast i64* %61 to <2 x i64>*, !dbg !103
  store <2 x i64> %60, <2 x i64>* %62, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %63 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %22, !dbg !103
  %64 = bitcast i64* %63 to <2 x i64>*, !dbg !103
  %wide.load.4 = load <2 x i64>, <2 x i64>* %64, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %65 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %22, !dbg !103
  %66 = bitcast i64* %65 to <2 x i64>*, !dbg !103
  %wide.load4.4 = load <2 x i64>, <2 x i64>* %66, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %67 = add nsw <2 x i64> %wide.load4.4, %wide.load.4, !dbg !110
  %68 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %22, !dbg !103
  %69 = bitcast i64* %68 to <2 x i64>*, !dbg !103
  store <2 x i64> %67, <2 x i64>* %69, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %70 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %23, !dbg !103
  %71 = bitcast i64* %70 to <2 x i64>*, !dbg !103
  %wide.load.5 = load <2 x i64>, <2 x i64>* %71, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %72 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %23, !dbg !103
  %73 = bitcast i64* %72 to <2 x i64>*, !dbg !103
  %wide.load4.5 = load <2 x i64>, <2 x i64>* %73, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %74 = add nsw <2 x i64> %wide.load4.5, %wide.load.5, !dbg !110
  %75 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %23, !dbg !103
  %76 = bitcast i64* %75 to <2 x i64>*, !dbg !103
  store <2 x i64> %74, <2 x i64>* %76, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %77 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %24, !dbg !103
  %78 = bitcast i64* %77 to <2 x i64>*, !dbg !103
  %wide.load.6 = load <2 x i64>, <2 x i64>* %78, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %79 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %24, !dbg !103
  %80 = bitcast i64* %79 to <2 x i64>*, !dbg !103
  %wide.load4.6 = load <2 x i64>, <2 x i64>* %80, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %81 = add nsw <2 x i64> %wide.load4.6, %wide.load.6, !dbg !110
  %82 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %24, !dbg !103
  %83 = bitcast i64* %82 to <2 x i64>*, !dbg !103
  store <2 x i64> %81, <2 x i64>* %83, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %84 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %25, !dbg !103
  %85 = bitcast i64* %84 to <2 x i64>*, !dbg !103
  %wide.load.7 = load <2 x i64>, <2 x i64>* %85, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %86 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %25, !dbg !103
  %87 = bitcast i64* %86 to <2 x i64>*, !dbg !103
  %wide.load4.7 = load <2 x i64>, <2 x i64>* %87, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %88 = add nsw <2 x i64> %wide.load4.7, %wide.load.7, !dbg !110
  %89 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %25, !dbg !103
  %90 = bitcast i64* %89 to <2 x i64>*, !dbg !103
  store <2 x i64> %88, <2 x i64>* %90, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %91 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %26, !dbg !103
  %92 = bitcast i64* %91 to <2 x i64>*, !dbg !103
  %wide.load.8 = load <2 x i64>, <2 x i64>* %92, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %93 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %26, !dbg !103
  %94 = bitcast i64* %93 to <2 x i64>*, !dbg !103
  %wide.load4.8 = load <2 x i64>, <2 x i64>* %94, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %95 = add nsw <2 x i64> %wide.load4.8, %wide.load.8, !dbg !110
  %96 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %26, !dbg !103
  %97 = bitcast i64* %96 to <2 x i64>*, !dbg !103
  store <2 x i64> %95, <2 x i64>* %97, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %98 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %27, !dbg !103
  %99 = bitcast i64* %98 to <2 x i64>*, !dbg !103
  %wide.load.9 = load <2 x i64>, <2 x i64>* %99, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %100 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %27, !dbg !103
  %101 = bitcast i64* %100 to <2 x i64>*, !dbg !103
  %wide.load4.9 = load <2 x i64>, <2 x i64>* %101, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %102 = add nsw <2 x i64> %wide.load4.9, %wide.load.9, !dbg !110
  %103 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %27, !dbg !103
  %104 = bitcast i64* %103 to <2 x i64>*, !dbg !103
  store <2 x i64> %102, <2 x i64>* %104, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %105 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %28, !dbg !103
  %106 = bitcast i64* %105 to <2 x i64>*, !dbg !103
  %wide.load.10 = load <2 x i64>, <2 x i64>* %106, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %107 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %28, !dbg !103
  %108 = bitcast i64* %107 to <2 x i64>*, !dbg !103
  %wide.load4.10 = load <2 x i64>, <2 x i64>* %108, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %109 = add nsw <2 x i64> %wide.load4.10, %wide.load.10, !dbg !110
  %110 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %28, !dbg !103
  %111 = bitcast i64* %110 to <2 x i64>*, !dbg !103
  store <2 x i64> %109, <2 x i64>* %111, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %112 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %29, !dbg !103
  %113 = bitcast i64* %112 to <2 x i64>*, !dbg !103
  %wide.load.11 = load <2 x i64>, <2 x i64>* %113, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %114 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %29, !dbg !103
  %115 = bitcast i64* %114 to <2 x i64>*, !dbg !103
  %wide.load4.11 = load <2 x i64>, <2 x i64>* %115, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %116 = add nsw <2 x i64> %wide.load4.11, %wide.load.11, !dbg !110
  %117 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %29, !dbg !103
  %118 = bitcast i64* %117 to <2 x i64>*, !dbg !103
  store <2 x i64> %116, <2 x i64>* %118, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %119 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %30, !dbg !103
  %120 = bitcast i64* %119 to <2 x i64>*, !dbg !103
  %wide.load.12 = load <2 x i64>, <2 x i64>* %120, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %121 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %30, !dbg !103
  %122 = bitcast i64* %121 to <2 x i64>*, !dbg !103
  %wide.load4.12 = load <2 x i64>, <2 x i64>* %122, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %123 = add nsw <2 x i64> %wide.load4.12, %wide.load.12, !dbg !110
  %124 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %30, !dbg !103
  %125 = bitcast i64* %124 to <2 x i64>*, !dbg !103
  store <2 x i64> %123, <2 x i64>* %125, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %126 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %31, !dbg !103
  %127 = bitcast i64* %126 to <2 x i64>*, !dbg !103
  %wide.load.13 = load <2 x i64>, <2 x i64>* %127, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %128 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %31, !dbg !103
  %129 = bitcast i64* %128 to <2 x i64>*, !dbg !103
  %wide.load4.13 = load <2 x i64>, <2 x i64>* %129, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %130 = add nsw <2 x i64> %wide.load4.13, %wide.load.13, !dbg !110
  %131 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %31, !dbg !103
  %132 = bitcast i64* %131 to <2 x i64>*, !dbg !103
  store <2 x i64> %130, <2 x i64>* %132, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %133 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %32, !dbg !103
  %134 = bitcast i64* %133 to <2 x i64>*, !dbg !103
  %wide.load.14 = load <2 x i64>, <2 x i64>* %134, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %135 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %32, !dbg !103
  %136 = bitcast i64* %135 to <2 x i64>*, !dbg !103
  %wide.load4.14 = load <2 x i64>, <2 x i64>* %136, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %137 = add nsw <2 x i64> %wide.load4.14, %wide.load.14, !dbg !110
  %138 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %32, !dbg !103
  %139 = bitcast i64* %138 to <2 x i64>*, !dbg !103
  store <2 x i64> %137, <2 x i64>* %139, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %140 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %34, i64 %33, !dbg !103
  %141 = bitcast i64* %140 to <2 x i64>*, !dbg !103
  %wide.load.15 = load <2 x i64>, <2 x i64>* %141, align 16, !dbg !103, !alias.scope !104, !noalias !106
  %142 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %34, i64 %33, !dbg !103
  %143 = bitcast i64* %142 to <2 x i64>*, !dbg !103
  %wide.load4.15 = load <2 x i64>, <2 x i64>* %143, align 16, !dbg !103, !alias.scope !108, !noalias !109
  %144 = add nsw <2 x i64> %wide.load4.15, %wide.load.15, !dbg !110
  %145 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %34, i64 %33, !dbg !103
  %146 = bitcast i64* %145 to <2 x i64>*, !dbg !103
  store <2 x i64> %144, <2 x i64>* %146, align 16, !dbg !103, !alias.scope !107, !noalias !112
  %polly.indvar_next11.i = add nuw nsw i64 %polly.indvar10.i, 1, !dbg !103
  %exitcond22.i = icmp eq i64 %polly.indvar_next11.i, 32, !dbg !103
  br i1 %exitcond22.i, label %polly.loop_exit9.i, label %polly.loop_preheader14.i, !dbg !103

mat_add.exit:                                     ; preds = %polly.loop_exit3.i
  %inc = add nuw nsw i32 %r.01, 1, !dbg !113
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !87, metadata !26), !dbg !86
  %exitcond = icmp eq i32 %inc, 100, !dbg !88
  br i1 %exitcond, label %for.end, label %for.body, !dbg !88

for.end:                                          ; preds = %mat_add.exit
  %147 = load i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 1023, i64 1023), align 8, !dbg !115
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.2, i64 0, i64 0), i32 1024, i32 1024, i32 1023, i32 1023, i64 %147) #4, !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22}
!llvm.ident = !{!23}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !13)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8, !9}
!4 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 7, type: !5, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 19, type: !5, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 29, type: !5, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, variables: !2)
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !10, isLocal: false, isDefinition: true, scopeLine: 43, isOptimized: false, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !{!14, !19, !20}
!14 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !15, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @A)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 67108864, align: 64, elements: !17)
!16 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!17 = !{!18, !18}
!18 = !DISubrange(count: 1024)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !15, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !15, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @C)
!21 = !{i32 2, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!24 = !DILocation(line: 9, column: 9, scope: !4)
!25 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !12)
!26 = !DIExpression()
!27 = !DILocation(line: 11, column: 5, scope: !28)
!28 = !DILexicalBlockFile(scope: !29, file: !1, discriminator: 1)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 11, column: 5)
!30 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 5)
!31 = !DILocation(line: 12, column: 9, scope: !32)
!32 = !DILexicalBlockFile(scope: !33, file: !1, discriminator: 1)
!33 = distinct !DILexicalBlock(scope: !34, file: !1, line: 12, column: 9)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 12, column: 9)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 11, column: 25)
!36 = !DILocation(line: 13, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !1, line: 12, column: 29)
!38 = !DILocation(line: 13, column: 21, scope: !37)
!39 = !DILocation(line: 14, column: 13, scope: !37)
!40 = !DILocation(line: 14, column: 21, scope: !37)
!41 = distinct !{!41, !42, !43}
!42 = !{!"llvm.loop.vectorize.width", i32 1}
!43 = !{!"llvm.loop.interleave.count", i32 1}
!44 = !DILocation(line: 17, column: 1, scope: !4)
!45 = !DILocation(line: 20, column: 9, scope: !7)
!46 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 20, type: !12)
!47 = !DILocation(line: 27, column: 1, scope: !7)
!48 = distinct !{!48, !49, !"polly.alias.scope.A"}
!49 = distinct !{!49, !"polly.alias.scope.domain"}
!50 = !{!51, !52}
!51 = distinct !{!51, !49, !"polly.alias.scope.C"}
!52 = distinct !{!52, !49, !"polly.alias.scope.B"}
!53 = !{!48, !51}
!54 = !DILocation(line: 23, column: 31, scope: !55)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 22, column: 29)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 22, column: 9)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 22, column: 9)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 21, column: 25)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 21, column: 5)
!60 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!61 = !{!48, !52}
!62 = !DILocation(line: 31, column: 9, scope: !8)
!63 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 31, type: !12)
!64 = !DILocation(line: 33, column: 5, scope: !65)
!65 = !DILexicalBlockFile(scope: !66, file: !1, discriminator: 1)
!66 = distinct !DILexicalBlock(scope: !67, file: !1, line: 33, column: 5)
!67 = distinct !DILexicalBlock(scope: !8, file: !1, line: 33, column: 5)
!68 = !DILocation(line: 35, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 34, column: 29)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 34, column: 9)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 34, column: 9)
!72 = distinct !DILexicalBlock(scope: !66, file: !1, line: 33, column: 25)
!73 = !DILocation(line: 34, column: 9, scope: !74)
!74 = !DILexicalBlockFile(scope: !70, file: !1, discriminator: 1)
!75 = !DILocation(line: 35, column: 38, scope: !69)
!76 = !DILocation(line: 35, column: 13, scope: !69)
!77 = !DILocation(line: 36, column: 18, scope: !78)
!78 = distinct !DILexicalBlock(scope: !69, file: !1, line: 36, column: 17)
!79 = !DILocation(line: 36, column: 22, scope: !78)
!80 = !DILocation(line: 36, column: 17, scope: !69)
!81 = !DILocation(line: 36, column: 37, scope: !82)
!82 = !DILexicalBlockFile(scope: !78, file: !1, discriminator: 1)
!83 = !DILocation(line: 36, column: 29, scope: !82)
!84 = !DILocation(line: 38, column: 9, scope: !72)
!85 = !DILocation(line: 40, column: 1, scope: !8)
!86 = !DILocation(line: 47, column: 9, scope: !9)
!87 = !DILocalVariable(name: "r", scope: !9, file: !1, line: 47, type: !12)
!88 = !DILocation(line: 48, column: 5, scope: !89)
!89 = !DILexicalBlockFile(scope: !90, file: !1, discriminator: 1)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 48, column: 5)
!91 = distinct !DILexicalBlock(scope: !9, file: !1, line: 48, column: 5)
!92 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !93)
!93 = distinct !DILocation(line: 49, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !1, line: 48, column: 23)
!95 = !DILocation(line: 11, column: 5, scope: !28, inlinedAt: !93)
!96 = !DILocation(line: 49, column: 9, scope: !94)
!97 = !DILocation(line: 12, column: 9, scope: !32, inlinedAt: !93)
!98 = !DILocation(line: 13, column: 13, scope: !37, inlinedAt: !93)
!99 = !DILocation(line: 13, column: 21, scope: !37, inlinedAt: !93)
!100 = !DILocation(line: 14, column: 13, scope: !37, inlinedAt: !93)
!101 = !DILocation(line: 14, column: 21, scope: !37, inlinedAt: !93)
!102 = distinct !{!102, !42, !43}
!103 = !DILocation(line: 50, column: 9, scope: !94)
!104 = distinct !{!104, !105, !"polly.alias.scope.A"}
!105 = distinct !{!105, !"polly.alias.scope.domain"}
!106 = !{!107, !108}
!107 = distinct !{!107, !105, !"polly.alias.scope.C"}
!108 = distinct !{!108, !105, !"polly.alias.scope.B"}
!109 = !{!104, !107}
!110 = !DILocation(line: 23, column: 31, scope: !55, inlinedAt: !111)
!111 = distinct !DILocation(line: 50, column: 9, scope: !94)
!112 = !{!104, !108}
!113 = !DILocation(line: 48, column: 20, scope: !114)
!114 = !DILexicalBlockFile(scope: !90, file: !1, discriminator: 2)
!115 = !DILocation(line: 53, column: 83, scope: !9)
!116 = !DILocation(line: 53, column: 5, scope: !9)
!117 = !DILocation(line: 54, column: 5, scope: !9)
