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
  br label %polly.split_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting31, %polly.loop_exit3
  br label %polly.exiting, !dbg !26

polly.exiting:                                    ; preds = %polly.merge_new_and_old
  ret void, !dbg !26

polly.loop_exit3:                                 ; preds = %polly.loop_exit9
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond28 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond28, label %polly.merge_new_and_old, label %polly.loop_preheader2, !llvm.loop !27

polly.loop_exit9:                                 ; preds = %polly.loop_preheader20
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond27 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond27, label %polly.loop_exit3, label %polly.loop_preheader8

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %polly.loop_preheader2

polly.loop_preheader2:                            ; preds = %polly.split_new_and_old, %polly.loop_exit3
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit3 ], [ 0, %polly.split_new_and_old ]
  %0 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader8

polly.loop_preheader8:                            ; preds = %polly.loop_exit9, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_exit9 ]
  %1 = shl i64 %polly.indvar4, 5
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

polly.loop_preheader14:                           ; preds = %polly.loop_preheader20, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %polly.loop_preheader20 ]
  %17 = add nuw nsw i64 %polly.indvar10, %0
  br label %polly.loop_preheader20

polly.loop_preheader20:                           ; preds = %polly.loop_preheader14
  %scevgep = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %1
  %scevgep25 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %1
  %18 = bitcast i64* %scevgep to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %18, align 16, !alias.scope !28, !noalias !30
  %19 = bitcast i64* %scevgep25 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %19, align 16, !alias.scope !31, !noalias !32
  %scevgep.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %2
  %scevgep25.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %2
  %20 = bitcast i64* %scevgep.2 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %20, align 16, !alias.scope !28, !noalias !30
  %21 = bitcast i64* %scevgep25.2 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %21, align 16, !alias.scope !31, !noalias !32
  %scevgep.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %3
  %scevgep25.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %3
  %22 = bitcast i64* %scevgep.1 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %22, align 16, !alias.scope !28, !noalias !30
  %23 = bitcast i64* %scevgep25.1 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %23, align 16, !alias.scope !31, !noalias !32
  %scevgep.2.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %4
  %scevgep25.2.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %4
  %24 = bitcast i64* %scevgep.2.1 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %24, align 16, !alias.scope !28, !noalias !30
  %25 = bitcast i64* %scevgep25.2.1 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %25, align 16, !alias.scope !31, !noalias !32
  %scevgep.229 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %5
  %scevgep25.230 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %5
  %26 = bitcast i64* %scevgep.229 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %26, align 16, !alias.scope !28, !noalias !30
  %27 = bitcast i64* %scevgep25.230 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %27, align 16, !alias.scope !31, !noalias !32
  %scevgep.2.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %6
  %scevgep25.2.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %6
  %28 = bitcast i64* %scevgep.2.2 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %28, align 16, !alias.scope !28, !noalias !30
  %29 = bitcast i64* %scevgep25.2.2 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %29, align 16, !alias.scope !31, !noalias !32
  %scevgep.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %7
  %scevgep25.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %7
  %30 = bitcast i64* %scevgep.3 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %30, align 16, !alias.scope !28, !noalias !30
  %31 = bitcast i64* %scevgep25.3 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %31, align 16, !alias.scope !31, !noalias !32
  %scevgep.2.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %8
  %scevgep25.2.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %8
  %32 = bitcast i64* %scevgep.2.3 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %32, align 16, !alias.scope !28, !noalias !30
  %33 = bitcast i64* %scevgep25.2.3 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %33, align 16, !alias.scope !31, !noalias !32
  %scevgep.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %9
  %scevgep25.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %9
  %34 = bitcast i64* %scevgep.4 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %34, align 16, !alias.scope !28, !noalias !30
  %35 = bitcast i64* %scevgep25.4 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %35, align 16, !alias.scope !31, !noalias !32
  %scevgep.2.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %10
  %scevgep25.2.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %10
  %36 = bitcast i64* %scevgep.2.4 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %36, align 16, !alias.scope !28, !noalias !30
  %37 = bitcast i64* %scevgep25.2.4 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %37, align 16, !alias.scope !31, !noalias !32
  %scevgep.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %11
  %scevgep25.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %11
  %38 = bitcast i64* %scevgep.5 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %38, align 16, !alias.scope !28, !noalias !30
  %39 = bitcast i64* %scevgep25.5 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %39, align 16, !alias.scope !31, !noalias !32
  %scevgep.2.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %12
  %scevgep25.2.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %12
  %40 = bitcast i64* %scevgep.2.5 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %40, align 16, !alias.scope !28, !noalias !30
  %41 = bitcast i64* %scevgep25.2.5 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %41, align 16, !alias.scope !31, !noalias !32
  %scevgep.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %13
  %scevgep25.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %13
  %42 = bitcast i64* %scevgep.6 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %42, align 16, !alias.scope !28, !noalias !30
  %43 = bitcast i64* %scevgep25.6 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %43, align 16, !alias.scope !31, !noalias !32
  %scevgep.2.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %14
  %scevgep25.2.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %14
  %44 = bitcast i64* %scevgep.2.6 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %44, align 16, !alias.scope !28, !noalias !30
  %45 = bitcast i64* %scevgep25.2.6 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %45, align 16, !alias.scope !31, !noalias !32
  %scevgep.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %15
  %scevgep25.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %15
  %46 = bitcast i64* %scevgep.7 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %46, align 16, !alias.scope !28, !noalias !30
  %47 = bitcast i64* %scevgep25.7 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %47, align 16, !alias.scope !31, !noalias !32
  %scevgep.2.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %16
  %scevgep25.2.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %16
  %48 = bitcast i64* %scevgep.2.7 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %48, align 16, !alias.scope !28, !noalias !30
  %49 = bitcast i64* %scevgep25.2.7 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %49, align 16, !alias.scope !31, !noalias !32
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond26 = icmp eq i64 %polly.indvar_next11, 32
  br i1 %exitcond26, label %polly.loop_exit9, label %polly.loop_preheader14

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit36
  br label %polly.exiting31

polly.exiting31:                                  ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit36, %polly.loop_preheader
  %polly.indvar32 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next33, %polly.loop_exit36 ]
  br label %polly.loop_preheader35

polly.loop_exit36:                                ; preds = %polly.loop_exit42
  %polly.indvar_next33 = add nsw i64 %polly.indvar32, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar32, 30
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !33

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header34:                              ; preds = %polly.loop_exit42, %polly.loop_preheader35
  %polly.indvar37 = phi i64 [ 0, %polly.loop_preheader35 ], [ %polly.indvar_next38, %polly.loop_exit42 ]
  br label %polly.loop_preheader41

polly.loop_exit42:                                ; preds = %polly.stmt.polly.loop_preheader20
  %polly.indvar_next38 = add nsw i64 %polly.indvar37, 1
  %polly.loop_cond39 = icmp sle i64 %polly.indvar37, 30
  br i1 %polly.loop_cond39, label %polly.loop_header34, label %polly.loop_exit36

polly.loop_preheader35:                           ; preds = %polly.loop_header
  %50 = shl i64 %polly.indvar32, 5
  %scevgep46 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %50, i64 0
  %scevgep50 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %50, i64 0
  %51 = shl i64 %polly.indvar32, 15
  %scevgep54 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 2), i64 %51
  %scevgep58 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 2), i64 %51
  %scevgep62 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 4), i64 %51
  %scevgep66 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 4), i64 %51
  %scevgep70 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 6), i64 %51
  %scevgep74 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 6), i64 %51
  %52 = shl i64 %polly.indvar32, 15
  %scevgep78 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 8), i64 %52
  %scevgep82 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 8), i64 %52
  %scevgep86 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 10), i64 %52
  %scevgep90 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 10), i64 %52
  %scevgep94 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 12), i64 %52
  %scevgep98 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 12), i64 %52
  %53 = shl i64 %polly.indvar32, 15
  %scevgep102 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 14), i64 %53
  %scevgep106 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 14), i64 %53
  %scevgep110 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 16), i64 %53
  %scevgep114 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 16), i64 %53
  %scevgep118 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 18), i64 %53
  %scevgep122 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 18), i64 %53
  %54 = shl i64 %polly.indvar32, 15
  %scevgep126 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 20), i64 %54
  %scevgep130 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 20), i64 %54
  %scevgep134 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 22), i64 %54
  %scevgep138 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 22), i64 %54
  %scevgep142 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 24), i64 %54
  %scevgep146 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 24), i64 %54
  %55 = shl i64 %polly.indvar32, 15
  %scevgep150 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 26), i64 %55
  %scevgep154 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 26), i64 %55
  %scevgep158 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 28), i64 %55
  %scevgep162 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 28), i64 %55
  %scevgep166 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 0, i64 30), i64 %55
  %scevgep170 = getelementptr i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 0, i64 30), i64 %55
  br label %polly.loop_header34

polly.loop_header40:                              ; preds = %polly.stmt.polly.loop_preheader20, %polly.loop_preheader41
  %polly.indvar43 = phi i64 [ 0, %polly.loop_preheader41 ], [ %polly.indvar_next44, %polly.stmt.polly.loop_preheader20 ]
  br label %polly.stmt.polly.loop_preheader20

polly.stmt.polly.loop_preheader20:                ; preds = %polly.loop_header40
  %56 = shl i64 %polly.indvar43, 10
  %scevgep48 = getelementptr i64, i64* %scevgep47, i64 %56
  %scevgep4849 = bitcast i64* %scevgep48 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep4849, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep52 = getelementptr i64, i64* %scevgep51, i64 %56
  %scevgep5253 = bitcast i64* %scevgep52 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep5253, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %57 = shl i64 %polly.indvar43, 10
  %scevgep56 = getelementptr i64, i64* %scevgep55, i64 %57
  %scevgep5657 = bitcast i64* %scevgep56 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep5657, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep60 = getelementptr i64, i64* %scevgep59, i64 %57
  %scevgep6061 = bitcast i64* %scevgep60 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep6061, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %58 = shl i64 %polly.indvar43, 10
  %scevgep64 = getelementptr i64, i64* %scevgep63, i64 %58
  %scevgep6465 = bitcast i64* %scevgep64 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep6465, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep68 = getelementptr i64, i64* %scevgep67, i64 %58
  %scevgep6869 = bitcast i64* %scevgep68 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep6869, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %59 = shl i64 %polly.indvar43, 10
  %scevgep72 = getelementptr i64, i64* %scevgep71, i64 %59
  %scevgep7273 = bitcast i64* %scevgep72 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep7273, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep76 = getelementptr i64, i64* %scevgep75, i64 %59
  %scevgep7677 = bitcast i64* %scevgep76 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep7677, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %60 = shl i64 %polly.indvar43, 10
  %scevgep80 = getelementptr i64, i64* %scevgep79, i64 %60
  %scevgep8081 = bitcast i64* %scevgep80 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep8081, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep84 = getelementptr i64, i64* %scevgep83, i64 %60
  %scevgep8485 = bitcast i64* %scevgep84 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep8485, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %61 = shl i64 %polly.indvar43, 10
  %scevgep88 = getelementptr i64, i64* %scevgep87, i64 %61
  %scevgep8889 = bitcast i64* %scevgep88 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep8889, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep92 = getelementptr i64, i64* %scevgep91, i64 %61
  %scevgep9293 = bitcast i64* %scevgep92 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep9293, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %62 = shl i64 %polly.indvar43, 10
  %scevgep96 = getelementptr i64, i64* %scevgep95, i64 %62
  %scevgep9697 = bitcast i64* %scevgep96 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep9697, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep100 = getelementptr i64, i64* %scevgep99, i64 %62
  %scevgep100101 = bitcast i64* %scevgep100 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep100101, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %63 = shl i64 %polly.indvar43, 10
  %scevgep104 = getelementptr i64, i64* %scevgep103, i64 %63
  %scevgep104105 = bitcast i64* %scevgep104 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep104105, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep108 = getelementptr i64, i64* %scevgep107, i64 %63
  %scevgep108109 = bitcast i64* %scevgep108 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep108109, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %64 = shl i64 %polly.indvar43, 10
  %scevgep112 = getelementptr i64, i64* %scevgep111, i64 %64
  %scevgep112113 = bitcast i64* %scevgep112 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep112113, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep116 = getelementptr i64, i64* %scevgep115, i64 %64
  %scevgep116117 = bitcast i64* %scevgep116 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep116117, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %65 = shl i64 %polly.indvar43, 10
  %scevgep120 = getelementptr i64, i64* %scevgep119, i64 %65
  %scevgep120121 = bitcast i64* %scevgep120 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep120121, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep124 = getelementptr i64, i64* %scevgep123, i64 %65
  %scevgep124125 = bitcast i64* %scevgep124 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep124125, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %66 = shl i64 %polly.indvar43, 10
  %scevgep128 = getelementptr i64, i64* %scevgep127, i64 %66
  %scevgep128129 = bitcast i64* %scevgep128 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep128129, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep132 = getelementptr i64, i64* %scevgep131, i64 %66
  %scevgep132133 = bitcast i64* %scevgep132 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep132133, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %67 = shl i64 %polly.indvar43, 10
  %scevgep136 = getelementptr i64, i64* %scevgep135, i64 %67
  %scevgep136137 = bitcast i64* %scevgep136 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep136137, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep140 = getelementptr i64, i64* %scevgep139, i64 %67
  %scevgep140141 = bitcast i64* %scevgep140 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep140141, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %68 = shl i64 %polly.indvar43, 10
  %scevgep144 = getelementptr i64, i64* %scevgep143, i64 %68
  %scevgep144145 = bitcast i64* %scevgep144 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep144145, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep148 = getelementptr i64, i64* %scevgep147, i64 %68
  %scevgep148149 = bitcast i64* %scevgep148 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep148149, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %69 = shl i64 %polly.indvar43, 10
  %scevgep152 = getelementptr i64, i64* %scevgep151, i64 %69
  %scevgep152153 = bitcast i64* %scevgep152 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep152153, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep156 = getelementptr i64, i64* %scevgep155, i64 %69
  %scevgep156157 = bitcast i64* %scevgep156 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep156157, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %70 = shl i64 %polly.indvar43, 10
  %scevgep160 = getelementptr i64, i64* %scevgep159, i64 %70
  %scevgep160161 = bitcast i64* %scevgep160 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep160161, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep164 = getelementptr i64, i64* %scevgep163, i64 %70
  %scevgep164165 = bitcast i64* %scevgep164 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep164165, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %71 = shl i64 %polly.indvar43, 10
  %scevgep168 = getelementptr i64, i64* %scevgep167, i64 %71
  %scevgep168169 = bitcast i64* %scevgep168 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep168169, align 16, !alias.scope !34, !noalias !36, !llvm.mem.parallel_loop_access !33
  %scevgep172 = getelementptr i64, i64* %scevgep171, i64 %71
  %scevgep172173 = bitcast i64* %scevgep172 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep172173, align 16, !alias.scope !37, !noalias !38, !llvm.mem.parallel_loop_access !33
  %72 = add i64 %polly.indvar43, 1
  %p_exitcond26 = icmp eq i64 %72, 32
  %polly.indvar_next44 = add nsw i64 %polly.indvar43, 1
  %polly.loop_cond45 = icmp sle i64 %polly.indvar43, 30
  br i1 %polly.loop_cond45, label %polly.loop_header40, label %polly.loop_exit42

polly.loop_preheader41:                           ; preds = %polly.loop_header34
  %73 = shl i64 %polly.indvar37, 5
  %scevgep47 = getelementptr i64, i64* %scevgep46, i64 %73
  %scevgep51 = getelementptr i64, i64* %scevgep50, i64 %73
  %scevgep55 = getelementptr i64, i64* %scevgep54, i64 %73
  %scevgep59 = getelementptr i64, i64* %scevgep58, i64 %73
  %scevgep63 = getelementptr i64, i64* %scevgep62, i64 %73
  %scevgep67 = getelementptr i64, i64* %scevgep66, i64 %73
  %74 = shl i64 %polly.indvar37, 5
  %scevgep71 = getelementptr i64, i64* %scevgep70, i64 %74
  %scevgep75 = getelementptr i64, i64* %scevgep74, i64 %74
  %scevgep79 = getelementptr i64, i64* %scevgep78, i64 %74
  %scevgep83 = getelementptr i64, i64* %scevgep82, i64 %74
  %scevgep87 = getelementptr i64, i64* %scevgep86, i64 %74
  %scevgep91 = getelementptr i64, i64* %scevgep90, i64 %74
  %75 = shl i64 %polly.indvar37, 5
  %scevgep95 = getelementptr i64, i64* %scevgep94, i64 %75
  %scevgep99 = getelementptr i64, i64* %scevgep98, i64 %75
  %scevgep103 = getelementptr i64, i64* %scevgep102, i64 %75
  %scevgep107 = getelementptr i64, i64* %scevgep106, i64 %75
  %scevgep111 = getelementptr i64, i64* %scevgep110, i64 %75
  %scevgep115 = getelementptr i64, i64* %scevgep114, i64 %75
  %76 = shl i64 %polly.indvar37, 5
  %scevgep119 = getelementptr i64, i64* %scevgep118, i64 %76
  %scevgep123 = getelementptr i64, i64* %scevgep122, i64 %76
  %scevgep127 = getelementptr i64, i64* %scevgep126, i64 %76
  %scevgep131 = getelementptr i64, i64* %scevgep130, i64 %76
  %scevgep135 = getelementptr i64, i64* %scevgep134, i64 %76
  %scevgep139 = getelementptr i64, i64* %scevgep138, i64 %76
  %77 = shl i64 %polly.indvar37, 5
  %scevgep143 = getelementptr i64, i64* %scevgep142, i64 %77
  %scevgep147 = getelementptr i64, i64* %scevgep146, i64 %77
  %scevgep151 = getelementptr i64, i64* %scevgep150, i64 %77
  %scevgep155 = getelementptr i64, i64* %scevgep154, i64 %77
  %scevgep159 = getelementptr i64, i64* %scevgep158, i64 %77
  %scevgep163 = getelementptr i64, i64* %scevgep162, i64 %77
  %78 = shl i64 %polly.indvar37, 5
  %scevgep167 = getelementptr i64, i64* %scevgep166, i64 %78
  %scevgep171 = getelementptr i64, i64* %scevgep170, i64 %78
  br label %polly.loop_header40
}

; Function Attrs: nounwind uwtable
define void @print_array() #1 !dbg !7 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !39, metadata !24), !dbg !40
  br label %for.cond1.preheader, !dbg !41

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !45
  br label %for.body3, !dbg !50

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !52
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !52
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4, !dbg !53
  %3 = trunc i64 %indvars.iv to i32, !dbg !54
  %rem = srem i32 %3, 80, !dbg !54
  %cmp6 = icmp eq i32 %rem, 79, !dbg !56
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !57

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !58
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !60
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !50
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !45
  %exitcond = icmp eq i64 %indvars.iv.next, 1024, !dbg !50
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !50

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !61
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !41
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1024, !dbg !41
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !41

for.end11:                                        ; preds = %for.end
  ret void, !dbg !62
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !23, metadata !24), !dbg !63
  br label %polly.loop_preheader2.i, !dbg !65

polly.loop_exit3.i:                               ; preds = %polly.loop_exit9.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1, !dbg !65
  %exitcond28.i = icmp eq i64 %polly.indvar_next.i, 32, !dbg !65
  br i1 %exitcond28.i, label %polly.loop_preheader2.preheader, label %polly.loop_preheader2.i, !dbg !65, !llvm.loop !27

polly.loop_preheader2.preheader:                  ; preds = %polly.loop_exit3.i
  br label %polly.loop_preheader2

polly.loop_exit9.i:                               ; preds = %polly.loop_preheader20.i
  %polly.indvar_next5.i = add nuw nsw i64 %polly.indvar4.i, 1, !dbg !65
  %exitcond27.i = icmp eq i64 %polly.indvar_next5.i, 32, !dbg !65
  br i1 %exitcond27.i, label %polly.loop_exit3.i, label %polly.loop_preheader8.i, !dbg !65

polly.loop_preheader2.i:                          ; preds = %polly.loop_exit3.i, %entry
  %polly.indvar.i = phi i64 [ 0, %entry ], [ %polly.indvar_next.i, %polly.loop_exit3.i ], !dbg !65
  %0 = shl nsw i64 %polly.indvar.i, 5, !dbg !65
  br label %polly.loop_preheader8.i, !dbg !65

polly.loop_preheader8.i:                          ; preds = %polly.loop_preheader2.i, %polly.loop_exit9.i
  %polly.indvar4.i = phi i64 [ 0, %polly.loop_preheader2.i ], [ %polly.indvar_next5.i, %polly.loop_exit9.i ], !dbg !65
  %1 = shl i64 %polly.indvar4.i, 5, !dbg !65
  %2 = or i64 %1, 2, !dbg !65
  %3 = or i64 %1, 4, !dbg !65
  %4 = or i64 %1, 6, !dbg !65
  %5 = or i64 %1, 8, !dbg !65
  %6 = or i64 %1, 10, !dbg !65
  %7 = or i64 %1, 12, !dbg !65
  %8 = or i64 %1, 14, !dbg !65
  %9 = or i64 %1, 16, !dbg !65
  %10 = or i64 %1, 18, !dbg !65
  %11 = or i64 %1, 20, !dbg !65
  %12 = or i64 %1, 22, !dbg !65
  %13 = or i64 %1, 24, !dbg !65
  %14 = or i64 %1, 26, !dbg !65
  %15 = or i64 %1, 28, !dbg !65
  %16 = or i64 %1, 30, !dbg !65
  br label %polly.loop_preheader14.i, !dbg !65

polly.loop_preheader14.i:                         ; preds = %polly.loop_preheader8.i, %polly.loop_preheader20.i
  %polly.indvar10.i = phi i64 [ 0, %polly.loop_preheader8.i ], [ %polly.indvar_next11.i, %polly.loop_preheader20.i ], !dbg !65
  %17 = add nuw nsw i64 %polly.indvar10.i, %0, !dbg !65
  br label %polly.loop_preheader20.i, !dbg !65

polly.loop_preheader20.i:                         ; preds = %polly.loop_preheader14.i
  %scevgep.i = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %1, !dbg !65
  %scevgep25.i = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %1, !dbg !65
  %18 = bitcast i64* %scevgep.i to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %18, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %19 = bitcast i64* %scevgep25.i to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %19, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.2.i = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %2, !dbg !65
  %scevgep25.2.i = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %2, !dbg !65
  %20 = bitcast i64* %scevgep.2.i to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %20, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %21 = bitcast i64* %scevgep25.2.i to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %21, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.i.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %3, !dbg !65
  %scevgep25.i.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %3, !dbg !65
  %22 = bitcast i64* %scevgep.i.1 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %22, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %23 = bitcast i64* %scevgep25.i.1 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %23, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.2.i.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %4, !dbg !65
  %scevgep25.2.i.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %4, !dbg !65
  %24 = bitcast i64* %scevgep.2.i.1 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %24, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %25 = bitcast i64* %scevgep25.2.i.1 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %25, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.i.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %5, !dbg !65
  %scevgep25.i.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %5, !dbg !65
  %26 = bitcast i64* %scevgep.i.2 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %26, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %27 = bitcast i64* %scevgep25.i.2 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %27, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.2.i.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %6, !dbg !65
  %scevgep25.2.i.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %6, !dbg !65
  %28 = bitcast i64* %scevgep.2.i.2 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %28, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %29 = bitcast i64* %scevgep25.2.i.2 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %29, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.i.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %7, !dbg !65
  %scevgep25.i.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %7, !dbg !65
  %30 = bitcast i64* %scevgep.i.3 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %30, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %31 = bitcast i64* %scevgep25.i.3 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %31, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.2.i.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %8, !dbg !65
  %scevgep25.2.i.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %8, !dbg !65
  %32 = bitcast i64* %scevgep.2.i.3 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %32, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %33 = bitcast i64* %scevgep25.2.i.3 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %33, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.i.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %9, !dbg !65
  %scevgep25.i.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %9, !dbg !65
  %34 = bitcast i64* %scevgep.i.4 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %34, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %35 = bitcast i64* %scevgep25.i.4 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %35, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.2.i.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %10, !dbg !65
  %scevgep25.2.i.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %10, !dbg !65
  %36 = bitcast i64* %scevgep.2.i.4 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %36, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %37 = bitcast i64* %scevgep25.2.i.4 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %37, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.i.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %11, !dbg !65
  %scevgep25.i.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %11, !dbg !65
  %38 = bitcast i64* %scevgep.i.5 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %38, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %39 = bitcast i64* %scevgep25.i.5 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %39, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.2.i.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %12, !dbg !65
  %scevgep25.2.i.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %12, !dbg !65
  %40 = bitcast i64* %scevgep.2.i.5 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %40, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %41 = bitcast i64* %scevgep25.2.i.5 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %41, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.i.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %13, !dbg !65
  %scevgep25.i.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %13, !dbg !65
  %42 = bitcast i64* %scevgep.i.6 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %42, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %43 = bitcast i64* %scevgep25.i.6 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %43, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.2.i.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %14, !dbg !65
  %scevgep25.2.i.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %14, !dbg !65
  %44 = bitcast i64* %scevgep.2.i.6 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %44, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %45 = bitcast i64* %scevgep25.2.i.6 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %45, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.i.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %15, !dbg !65
  %scevgep25.i.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %15, !dbg !65
  %46 = bitcast i64* %scevgep.i.7 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %46, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %47 = bitcast i64* %scevgep25.i.7 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %47, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %scevgep.2.i.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %17, i64 %16, !dbg !65
  %scevgep25.2.i.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %17, i64 %16, !dbg !65
  %48 = bitcast i64* %scevgep.2.i.7 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %48, align 16, !dbg !65, !alias.scope !66, !noalias !68
  %49 = bitcast i64* %scevgep25.2.i.7 to <2 x i64>*, !dbg !65
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %49, align 16, !dbg !65, !alias.scope !69, !noalias !70
  %polly.indvar_next11.i = add nuw nsw i64 %polly.indvar10.i, 1, !dbg !65
  %exitcond26.i = icmp eq i64 %polly.indvar_next11.i, 32, !dbg !65
  br i1 %exitcond26.i, label %polly.loop_exit9.i, label %polly.loop_preheader14.i, !dbg !65

polly.exiting:                                    ; preds = %polly.loop_exit33
  %50 = load i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 1023, i64 1023), align 8, !dbg !71
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 1024, i32 1024, i64 %50) #4, !dbg !72
  ret i32 0, !dbg !73

polly.loop_exit3:                                 ; preds = %polly.loop_preheader14
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond88 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond88, label %polly.loop_preheader32.preheader, label %polly.loop_preheader2, !llvm.loop !74

polly.loop_preheader32.preheader:                 ; preds = %polly.loop_exit3
  br label %polly.loop_preheader32

polly.loop_preheader2:                            ; preds = %polly.loop_preheader2.preheader, %polly.loop_exit3
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit3 ], [ 0, %polly.loop_preheader2.preheader ]
  %51 = shl i64 %polly.indvar, 5
  %52 = or i64 %51, 1
  %53 = or i64 %51, 2
  %54 = or i64 %51, 3
  %55 = or i64 %51, 4
  %56 = or i64 %51, 5
  %57 = or i64 %51, 6
  %58 = or i64 %51, 7
  %59 = or i64 %51, 8
  %60 = or i64 %51, 9
  %61 = or i64 %51, 10
  %62 = or i64 %51, 11
  %63 = or i64 %51, 12
  %64 = or i64 %51, 13
  %65 = or i64 %51, 14
  %66 = or i64 %51, 15
  %67 = or i64 %51, 16
  %68 = or i64 %51, 17
  %69 = or i64 %51, 18
  %70 = or i64 %51, 19
  %71 = or i64 %51, 20
  %72 = or i64 %51, 21
  %73 = or i64 %51, 22
  %74 = or i64 %51, 23
  %75 = or i64 %51, 24
  %76 = or i64 %51, 25
  %77 = or i64 %51, 26
  %78 = or i64 %51, 27
  %79 = or i64 %51, 28
  %80 = or i64 %51, 29
  %81 = or i64 %51, 30
  %82 = or i64 %51, 31
  br label %polly.loop_preheader8

polly.loop_preheader8:                            ; preds = %polly.loop_preheader14, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_preheader14 ]
  %83 = shl i64 %polly.indvar4, 5
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %polly.loop_preheader8
  %scevgep = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %51, i64 %83
  %scevgep85 = bitcast i64* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85, i8 0, i64 256, i32 16, i1 false)
  %scevgep.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %52, i64 %83
  %scevgep85.1 = bitcast i64* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.1, i8 0, i64 256, i32 16, i1 false)
  %scevgep.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %53, i64 %83
  %scevgep85.2 = bitcast i64* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.2, i8 0, i64 256, i32 16, i1 false)
  %scevgep.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %54, i64 %83
  %scevgep85.3 = bitcast i64* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.3, i8 0, i64 256, i32 16, i1 false)
  %scevgep.4 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %55, i64 %83
  %scevgep85.4 = bitcast i64* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.4, i8 0, i64 256, i32 16, i1 false)
  %scevgep.5 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %56, i64 %83
  %scevgep85.5 = bitcast i64* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.5, i8 0, i64 256, i32 16, i1 false)
  %scevgep.6 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %57, i64 %83
  %scevgep85.6 = bitcast i64* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.6, i8 0, i64 256, i32 16, i1 false)
  %scevgep.7 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %58, i64 %83
  %scevgep85.7 = bitcast i64* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.7, i8 0, i64 256, i32 16, i1 false)
  %scevgep.8 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %59, i64 %83
  %scevgep85.8 = bitcast i64* %scevgep.8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.8, i8 0, i64 256, i32 16, i1 false)
  %scevgep.9 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %60, i64 %83
  %scevgep85.9 = bitcast i64* %scevgep.9 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.9, i8 0, i64 256, i32 16, i1 false)
  %scevgep.10 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %61, i64 %83
  %scevgep85.10 = bitcast i64* %scevgep.10 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.10, i8 0, i64 256, i32 16, i1 false)
  %scevgep.11 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %62, i64 %83
  %scevgep85.11 = bitcast i64* %scevgep.11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.11, i8 0, i64 256, i32 16, i1 false)
  %scevgep.12 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %63, i64 %83
  %scevgep85.12 = bitcast i64* %scevgep.12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.12, i8 0, i64 256, i32 16, i1 false)
  %scevgep.13 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %64, i64 %83
  %scevgep85.13 = bitcast i64* %scevgep.13 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.13, i8 0, i64 256, i32 16, i1 false)
  %scevgep.14 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %65, i64 %83
  %scevgep85.14 = bitcast i64* %scevgep.14 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.14, i8 0, i64 256, i32 16, i1 false)
  %scevgep.15 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %66, i64 %83
  %scevgep85.15 = bitcast i64* %scevgep.15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.15, i8 0, i64 256, i32 16, i1 false)
  %scevgep.16 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %67, i64 %83
  %scevgep85.16 = bitcast i64* %scevgep.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.16, i8 0, i64 256, i32 16, i1 false)
  %scevgep.17 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %68, i64 %83
  %scevgep85.17 = bitcast i64* %scevgep.17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.17, i8 0, i64 256, i32 16, i1 false)
  %scevgep.18 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %69, i64 %83
  %scevgep85.18 = bitcast i64* %scevgep.18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.18, i8 0, i64 256, i32 16, i1 false)
  %scevgep.19 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %70, i64 %83
  %scevgep85.19 = bitcast i64* %scevgep.19 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.19, i8 0, i64 256, i32 16, i1 false)
  %scevgep.20 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %71, i64 %83
  %scevgep85.20 = bitcast i64* %scevgep.20 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.20, i8 0, i64 256, i32 16, i1 false)
  %scevgep.21 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %72, i64 %83
  %scevgep85.21 = bitcast i64* %scevgep.21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.21, i8 0, i64 256, i32 16, i1 false)
  %scevgep.22 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %73, i64 %83
  %scevgep85.22 = bitcast i64* %scevgep.22 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.22, i8 0, i64 256, i32 16, i1 false)
  %scevgep.23 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %74, i64 %83
  %scevgep85.23 = bitcast i64* %scevgep.23 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.23, i8 0, i64 256, i32 16, i1 false)
  %scevgep.24 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %75, i64 %83
  %scevgep85.24 = bitcast i64* %scevgep.24 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.24, i8 0, i64 256, i32 16, i1 false)
  %scevgep.25 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %76, i64 %83
  %scevgep85.25 = bitcast i64* %scevgep.25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.25, i8 0, i64 256, i32 16, i1 false)
  %scevgep.26 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %77, i64 %83
  %scevgep85.26 = bitcast i64* %scevgep.26 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.26, i8 0, i64 256, i32 16, i1 false)
  %scevgep.27 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %78, i64 %83
  %scevgep85.27 = bitcast i64* %scevgep.27 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.27, i8 0, i64 256, i32 16, i1 false)
  %scevgep.28 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %79, i64 %83
  %scevgep85.28 = bitcast i64* %scevgep.28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.28, i8 0, i64 256, i32 16, i1 false)
  %scevgep.29 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %80, i64 %83
  %scevgep85.29 = bitcast i64* %scevgep.29 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.29, i8 0, i64 256, i32 16, i1 false)
  %scevgep.30 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %81, i64 %83
  %scevgep85.30 = bitcast i64* %scevgep.30 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.30, i8 0, i64 256, i32 16, i1 false)
  %scevgep.31 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %82, i64 %83
  %scevgep85.31 = bitcast i64* %scevgep.31 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.31, i8 0, i64 256, i32 16, i1 false)
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond87 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond87, label %polly.loop_exit3, label %polly.loop_preheader8

polly.loop_exit33:                                ; preds = %polly.loop_exit39
  %polly.indvar_next29 = add nuw nsw i64 %polly.indvar28, 1
  %exitcond80 = icmp eq i64 %polly.indvar_next29, 32
  br i1 %exitcond80, label %polly.exiting, label %polly.loop_preheader32, !llvm.loop !75

polly.loop_exit39:                                ; preds = %polly.loop_exit45
  %polly.indvar_next35 = add nuw nsw i64 %polly.indvar34, 1
  %exitcond79 = icmp eq i64 %polly.indvar_next35, 32
  br i1 %exitcond79, label %polly.loop_exit33, label %polly.loop_preheader38

polly.loop_preheader32:                           ; preds = %polly.loop_preheader32.preheader, %polly.loop_exit33
  %polly.indvar28 = phi i64 [ %polly.indvar_next29, %polly.loop_exit33 ], [ 0, %polly.loop_preheader32.preheader ]
  %84 = shl nsw i64 %polly.indvar28, 5
  br label %polly.loop_preheader38

polly.loop_exit45:                                ; preds = %polly.loop_exit51
  %polly.indvar_next41 = add nuw nsw i64 %polly.indvar40, 1
  %exitcond78 = icmp eq i64 %polly.indvar_next41, 32
  br i1 %exitcond78, label %polly.loop_exit39, label %polly.loop_preheader44

polly.loop_preheader38:                           ; preds = %polly.loop_exit39, %polly.loop_preheader32
  %polly.indvar34 = phi i64 [ 0, %polly.loop_preheader32 ], [ %polly.indvar_next35, %polly.loop_exit39 ]
  %85 = shl nsw i64 %polly.indvar34, 5
  br label %polly.loop_preheader44

polly.loop_exit51:                                ; preds = %polly.loop_exit57
  %polly.indvar_next47 = add nuw nsw i64 %polly.indvar46, 1
  %exitcond77 = icmp eq i64 %polly.indvar_next47, 32
  br i1 %exitcond77, label %polly.loop_exit45, label %polly.loop_preheader50

polly.loop_preheader44:                           ; preds = %polly.loop_exit45, %polly.loop_preheader38
  %polly.indvar40 = phi i64 [ 0, %polly.loop_preheader38 ], [ %polly.indvar_next41, %polly.loop_exit45 ]
  %86 = shl i64 %polly.indvar40, 5
  br label %polly.loop_preheader50

polly.loop_exit57:                                ; preds = %polly.loop_preheader62
  %p_add.3.lcssa = phi i64 [ %p_add.3, %polly.loop_preheader62 ]
  store i64 %p_add.3.lcssa, i64* %scevgep67, align 8, !alias.scope !76, !noalias !78
  %polly.indvar_next53 = add nuw nsw i64 %polly.indvar52, 1
  %exitcond76 = icmp eq i64 %polly.indvar_next53, 32
  br i1 %exitcond76, label %polly.loop_exit51, label %polly.loop_preheader56

polly.loop_preheader50:                           ; preds = %polly.loop_exit51, %polly.loop_preheader44
  %polly.indvar46 = phi i64 [ 0, %polly.loop_preheader44 ], [ %polly.indvar_next47, %polly.loop_exit51 ]
  %87 = add nuw nsw i64 %polly.indvar46, %84
  br label %polly.loop_preheader56

polly.loop_preheader56:                           ; preds = %polly.loop_exit57, %polly.loop_preheader50
  %polly.indvar52 = phi i64 [ 0, %polly.loop_preheader50 ], [ %polly.indvar_next53, %polly.loop_exit57 ]
  %88 = add nuw nsw i64 %polly.indvar52, %85
  %scevgep67 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %87, i64 %88
  %scevgep67.promoted74 = load i64, i64* %scevgep67, align 8, !alias.scope !76, !noalias !78
  br label %polly.loop_preheader62

polly.loop_preheader62:                           ; preds = %polly.loop_preheader62, %polly.loop_preheader56
  %p_add.lcssa75 = phi i64 [ %scevgep67.promoted74, %polly.loop_preheader56 ], [ %p_add.3, %polly.loop_preheader62 ]
  %polly.indvar58 = phi i64 [ 0, %polly.loop_preheader56 ], [ %polly.indvar_next59, %polly.loop_preheader62 ]
  %89 = shl i64 %polly.indvar58, 2
  %90 = add nuw nsw i64 %89, %86
  %scevgep68 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %87, i64 %90
  %_p_scalar_69 = load i64, i64* %scevgep68, align 16, !alias.scope !79, !noalias !81, !llvm.mem.parallel_loop_access !82
  %scevgep70 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %90, i64 %88
  %_p_scalar_71 = load i64, i64* %scevgep70, align 8, !alias.scope !80, !noalias !84, !llvm.mem.parallel_loop_access !82
  %p_mul = mul nsw i64 %_p_scalar_71, %_p_scalar_69, !dbg !85
  %p_add = add nsw i64 %p_mul, %p_add.lcssa75, !dbg !94
  %91 = or i64 %90, 1
  %scevgep68.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %87, i64 %91
  %_p_scalar_69.1 = load i64, i64* %scevgep68.1, align 8, !alias.scope !79, !noalias !81, !llvm.mem.parallel_loop_access !82
  %scevgep70.1 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %91, i64 %88
  %_p_scalar_71.1 = load i64, i64* %scevgep70.1, align 8, !alias.scope !80, !noalias !84, !llvm.mem.parallel_loop_access !82
  %p_mul.1 = mul nsw i64 %_p_scalar_71.1, %_p_scalar_69.1, !dbg !85
  %p_add.1 = add nsw i64 %p_mul.1, %p_add, !dbg !94
  %92 = or i64 %90, 2
  %scevgep68.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %87, i64 %92
  %_p_scalar_69.2 = load i64, i64* %scevgep68.2, align 16, !alias.scope !79, !noalias !81, !llvm.mem.parallel_loop_access !82
  %scevgep70.2 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %92, i64 %88
  %_p_scalar_71.2 = load i64, i64* %scevgep70.2, align 8, !alias.scope !80, !noalias !84, !llvm.mem.parallel_loop_access !82
  %p_mul.2 = mul nsw i64 %_p_scalar_71.2, %_p_scalar_69.2, !dbg !85
  %p_add.2 = add nsw i64 %p_mul.2, %p_add.1, !dbg !94
  %93 = or i64 %90, 3
  %scevgep68.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %87, i64 %93
  %_p_scalar_69.3 = load i64, i64* %scevgep68.3, align 8, !alias.scope !79, !noalias !81, !llvm.mem.parallel_loop_access !82
  %scevgep70.3 = getelementptr [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %93, i64 %88
  %_p_scalar_71.3 = load i64, i64* %scevgep70.3, align 8, !alias.scope !80, !noalias !84, !llvm.mem.parallel_loop_access !82
  %p_mul.3 = mul nsw i64 %_p_scalar_71.3, %_p_scalar_69.3, !dbg !85
  %p_add.3 = add nsw i64 %p_mul.3, %p_add.2, !dbg !94
  %polly.indvar_next59 = add nuw nsw i64 %polly.indvar58, 1
  %exitcond = icmp eq i64 %polly.indvar_next59, 8
  br i1 %exitcond, label %polly.loop_exit57, label %polly.loop_preheader62
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
!27 = distinct !{!27}
!28 = distinct !{!28, !29, !"polly.alias.scope.A"}
!29 = distinct !{!29, !"polly.alias.scope.domain"}
!30 = !{!31}
!31 = distinct !{!31, !29, !"polly.alias.scope.B"}
!32 = !{!28}
!33 = distinct !{!33}
!34 = distinct !{!34, !35, !"polly.alias.scope.A"}
!35 = distinct !{!35, !"polly.alias.scope.domain"}
!36 = !{!37}
!37 = distinct !{!37, !35, !"polly.alias.scope.B"}
!38 = !{!34}
!39 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 21, type: !11)
!40 = !DILocation(line: 21, column: 9, scope: !7)
!41 = !DILocation(line: 23, column: 5, scope: !42)
!42 = !DILexicalBlockFile(scope: !43, file: !1, discriminator: 1)
!43 = distinct !DILexicalBlock(scope: !44, file: !1, line: 23, column: 5)
!44 = distinct !DILexicalBlock(scope: !7, file: !1, line: 23, column: 5)
!45 = !DILocation(line: 25, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 24, column: 29)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 24, column: 9)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 24, column: 9)
!49 = distinct !DILexicalBlock(scope: !43, file: !1, line: 23, column: 25)
!50 = !DILocation(line: 24, column: 9, scope: !51)
!51 = !DILexicalBlockFile(scope: !47, file: !1, discriminator: 1)
!52 = !DILocation(line: 25, column: 38, scope: !46)
!53 = !DILocation(line: 25, column: 13, scope: !46)
!54 = !DILocation(line: 26, column: 18, scope: !55)
!55 = distinct !DILexicalBlock(scope: !46, file: !1, line: 26, column: 17)
!56 = !DILocation(line: 26, column: 22, scope: !55)
!57 = !DILocation(line: 26, column: 17, scope: !46)
!58 = !DILocation(line: 26, column: 37, scope: !59)
!59 = !DILexicalBlockFile(scope: !55, file: !1, discriminator: 1)
!60 = !DILocation(line: 26, column: 29, scope: !59)
!61 = !DILocation(line: 28, column: 9, scope: !49)
!62 = !DILocation(line: 30, column: 1, scope: !7)
!63 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !64)
!64 = distinct !DILocation(line: 37, column: 5, scope: !8)
!65 = !DILocation(line: 37, column: 5, scope: !8)
!66 = distinct !{!66, !67, !"polly.alias.scope.A"}
!67 = distinct !{!67, !"polly.alias.scope.domain"}
!68 = !{!69}
!69 = distinct !{!69, !67, !"polly.alias.scope.B"}
!70 = !{!66}
!71 = !DILocation(line: 47, column: 71, scope: !8)
!72 = !DILocation(line: 47, column: 5, scope: !8)
!73 = !DILocation(line: 48, column: 5, scope: !8)
!74 = distinct !{!74}
!75 = distinct !{!75}
!76 = distinct !{!76, !77, !"polly.alias.scope.C"}
!77 = distinct !{!77, !"polly.alias.scope.domain"}
!78 = !{!79, !80}
!79 = distinct !{!79, !77, !"polly.alias.scope.A"}
!80 = distinct !{!80, !77, !"polly.alias.scope.B"}
!81 = !{!76, !80}
!82 = !{!75, !83}
!83 = distinct !{!83}
!84 = !{!79, !76}
!85 = !DILocation(line: 43, column: 45, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !1, line: 42, column: 13)
!87 = distinct !DILexicalBlock(scope: !88, file: !1, line: 42, column: 13)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 40, column: 29)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 40, column: 9)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 40, column: 9)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 39, column: 25)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 39, column: 5)
!93 = distinct !DILexicalBlock(scope: !8, file: !1, line: 39, column: 5)
!94 = !DILocation(line: 43, column: 35, scope: !86)
