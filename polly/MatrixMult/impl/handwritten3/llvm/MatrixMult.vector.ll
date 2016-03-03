; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@X = common global [2048 x [2048 x i32]] zeroinitializer, align 16
@Y = common global [2048 x [2048 x i32]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@Z = common global [2048 x [2048 x i32]] zeroinitializer, align 16
@.str.2 = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define void @init() #0 {
entry:
  br label %polly.split_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting29, %polly.loop_exit3
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.merge_new_and_old
  ret void

polly.loop_exit3:                                 ; preds = %polly.loop_exit9
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond28 = icmp eq i64 %polly.indvar_next, 64
  br i1 %exitcond28, label %polly.merge_new_and_old, label %polly.loop_preheader2, !llvm.loop !1

polly.loop_exit9:                                 ; preds = %polly.loop_preheader20
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond27 = icmp eq i64 %polly.indvar_next5, 64
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
  %2 = or i64 %1, 4
  %3 = or i64 %1, 8
  %4 = or i64 %1, 12
  %5 = or i64 %1, 16
  %6 = or i64 %1, 20
  %7 = or i64 %1, 24
  %8 = or i64 %1, 28
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %polly.loop_preheader20, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %polly.loop_preheader20 ]
  %9 = add nuw nsw i64 %polly.indvar10, %0
  br label %polly.loop_preheader20

polly.loop_preheader20:                           ; preds = %polly.loop_preheader14
  %scevgep = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %1
  %scevgep25 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %1
  %10 = bitcast i32* %scevgep to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 16, !alias.scope !2, !noalias !4
  %11 = bitcast i32* %scevgep25 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %11, align 16, !alias.scope !5, !noalias !6
  %scevgep.1 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %2
  %scevgep25.1 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %2
  %12 = bitcast i32* %scevgep.1 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %12, align 16, !alias.scope !2, !noalias !4
  %13 = bitcast i32* %scevgep25.1 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16, !alias.scope !5, !noalias !6
  %scevgep.2 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %3
  %scevgep25.2 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %3
  %14 = bitcast i32* %scevgep.2 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %14, align 16, !alias.scope !2, !noalias !4
  %15 = bitcast i32* %scevgep25.2 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !5, !noalias !6
  %scevgep.3 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %4
  %scevgep25.3 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %4
  %16 = bitcast i32* %scevgep.3 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %16, align 16, !alias.scope !2, !noalias !4
  %17 = bitcast i32* %scevgep25.3 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !5, !noalias !6
  %scevgep.4 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %5
  %scevgep25.4 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %5
  %18 = bitcast i32* %scevgep.4 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %18, align 16, !alias.scope !2, !noalias !4
  %19 = bitcast i32* %scevgep25.4 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !5, !noalias !6
  %scevgep.5 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %6
  %scevgep25.5 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %6
  %20 = bitcast i32* %scevgep.5 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %20, align 16, !alias.scope !2, !noalias !4
  %21 = bitcast i32* %scevgep25.5 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !5, !noalias !6
  %scevgep.6 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %7
  %scevgep25.6 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %7
  %22 = bitcast i32* %scevgep.6 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %22, align 16, !alias.scope !2, !noalias !4
  %23 = bitcast i32* %scevgep25.6 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !5, !noalias !6
  %scevgep.7 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %8
  %scevgep25.7 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %8
  %24 = bitcast i32* %scevgep.7 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %24, align 16, !alias.scope !2, !noalias !4
  %25 = bitcast i32* %scevgep25.7 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 16, !alias.scope !5, !noalias !6
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond26 = icmp eq i64 %polly.indvar_next11, 32
  br i1 %exitcond26, label %polly.loop_exit9, label %polly.loop_preheader14

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit34
  br label %polly.exiting29

polly.exiting29:                                  ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit34, %polly.loop_preheader
  %polly.indvar30 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next31, %polly.loop_exit34 ]
  br label %polly.loop_preheader33

polly.loop_exit34:                                ; preds = %polly.loop_exit40
  %polly.indvar_next31 = add nsw i64 %polly.indvar30, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar30, 62
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !7

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header32:                              ; preds = %polly.loop_exit40, %polly.loop_preheader33
  %polly.indvar35 = phi i64 [ 0, %polly.loop_preheader33 ], [ %polly.indvar_next36, %polly.loop_exit40 ]
  br label %polly.loop_preheader39

polly.loop_exit40:                                ; preds = %polly.stmt.polly.loop_preheader20
  %polly.indvar_next36 = add nsw i64 %polly.indvar35, 1
  %polly.loop_cond37 = icmp sle i64 %polly.indvar35, 62
  br i1 %polly.loop_cond37, label %polly.loop_header32, label %polly.loop_exit34

polly.loop_preheader33:                           ; preds = %polly.loop_header
  %26 = shl i64 %polly.indvar30, 5
  %scevgep44 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %26, i64 0
  %scevgep48 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %26, i64 0
  %27 = shl i64 %polly.indvar30, 16
  %scevgep52 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 4), i64 %27
  %scevgep56 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 4), i64 %27
  %scevgep60 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 8), i64 %27
  %scevgep64 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 8), i64 %27
  %scevgep68 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 12), i64 %27
  %scevgep72 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 12), i64 %27
  %28 = shl i64 %polly.indvar30, 16
  %scevgep76 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 16), i64 %28
  %scevgep80 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 16), i64 %28
  %scevgep84 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 20), i64 %28
  %scevgep88 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 20), i64 %28
  %scevgep92 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 24), i64 %28
  %scevgep96 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 24), i64 %28
  %29 = shl i64 %polly.indvar30, 16
  %scevgep100 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 28), i64 %29
  %scevgep104 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 28), i64 %29
  br label %polly.loop_header32

polly.loop_header38:                              ; preds = %polly.stmt.polly.loop_preheader20, %polly.loop_preheader39
  %polly.indvar41 = phi i64 [ 0, %polly.loop_preheader39 ], [ %polly.indvar_next42, %polly.stmt.polly.loop_preheader20 ]
  br label %polly.stmt.polly.loop_preheader20

polly.stmt.polly.loop_preheader20:                ; preds = %polly.loop_header38
  %30 = shl i64 %polly.indvar41, 11
  %scevgep46 = getelementptr i32, i32* %scevgep45, i64 %30
  %scevgep4647 = bitcast i32* %scevgep46 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep4647, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep50 = getelementptr i32, i32* %scevgep49, i64 %30
  %scevgep5051 = bitcast i32* %scevgep50 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5051, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %31 = shl i64 %polly.indvar41, 11
  %scevgep54 = getelementptr i32, i32* %scevgep53, i64 %31
  %scevgep5455 = bitcast i32* %scevgep54 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5455, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep58 = getelementptr i32, i32* %scevgep57, i64 %31
  %scevgep5859 = bitcast i32* %scevgep58 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5859, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %32 = shl i64 %polly.indvar41, 11
  %scevgep62 = getelementptr i32, i32* %scevgep61, i64 %32
  %scevgep6263 = bitcast i32* %scevgep62 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep6263, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep66 = getelementptr i32, i32* %scevgep65, i64 %32
  %scevgep6667 = bitcast i32* %scevgep66 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep6667, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %33 = shl i64 %polly.indvar41, 11
  %scevgep70 = getelementptr i32, i32* %scevgep69, i64 %33
  %scevgep7071 = bitcast i32* %scevgep70 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep7071, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep74 = getelementptr i32, i32* %scevgep73, i64 %33
  %scevgep7475 = bitcast i32* %scevgep74 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep7475, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %34 = shl i64 %polly.indvar41, 11
  %scevgep78 = getelementptr i32, i32* %scevgep77, i64 %34
  %scevgep7879 = bitcast i32* %scevgep78 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep7879, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep82 = getelementptr i32, i32* %scevgep81, i64 %34
  %scevgep8283 = bitcast i32* %scevgep82 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep8283, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %35 = shl i64 %polly.indvar41, 11
  %scevgep86 = getelementptr i32, i32* %scevgep85, i64 %35
  %scevgep8687 = bitcast i32* %scevgep86 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep8687, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep90 = getelementptr i32, i32* %scevgep89, i64 %35
  %scevgep9091 = bitcast i32* %scevgep90 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep9091, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %36 = shl i64 %polly.indvar41, 11
  %scevgep94 = getelementptr i32, i32* %scevgep93, i64 %36
  %scevgep9495 = bitcast i32* %scevgep94 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep9495, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep98 = getelementptr i32, i32* %scevgep97, i64 %36
  %scevgep9899 = bitcast i32* %scevgep98 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep9899, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %37 = shl i64 %polly.indvar41, 11
  %scevgep102 = getelementptr i32, i32* %scevgep101, i64 %37
  %scevgep102103 = bitcast i32* %scevgep102 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep102103, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep106 = getelementptr i32, i32* %scevgep105, i64 %37
  %scevgep106107 = bitcast i32* %scevgep106 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep106107, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %38 = add i64 %polly.indvar41, 1
  %p_exitcond26 = icmp eq i64 %38, 32
  %polly.indvar_next42 = add nsw i64 %polly.indvar41, 1
  %polly.loop_cond43 = icmp sle i64 %polly.indvar41, 30
  br i1 %polly.loop_cond43, label %polly.loop_header38, label %polly.loop_exit40

polly.loop_preheader39:                           ; preds = %polly.loop_header32
  %39 = shl i64 %polly.indvar35, 5
  %scevgep45 = getelementptr i32, i32* %scevgep44, i64 %39
  %scevgep49 = getelementptr i32, i32* %scevgep48, i64 %39
  %scevgep53 = getelementptr i32, i32* %scevgep52, i64 %39
  %scevgep57 = getelementptr i32, i32* %scevgep56, i64 %39
  %scevgep61 = getelementptr i32, i32* %scevgep60, i64 %39
  %scevgep65 = getelementptr i32, i32* %scevgep64, i64 %39
  %40 = shl i64 %polly.indvar35, 5
  %scevgep69 = getelementptr i32, i32* %scevgep68, i64 %40
  %scevgep73 = getelementptr i32, i32* %scevgep72, i64 %40
  %scevgep77 = getelementptr i32, i32* %scevgep76, i64 %40
  %scevgep81 = getelementptr i32, i32* %scevgep80, i64 %40
  %scevgep85 = getelementptr i32, i32* %scevgep84, i64 %40
  %scevgep89 = getelementptr i32, i32* %scevgep88, i64 %40
  %41 = shl i64 %polly.indvar35, 5
  %scevgep93 = getelementptr i32, i32* %scevgep92, i64 %41
  %scevgep97 = getelementptr i32, i32* %scevgep96, i64 %41
  %scevgep101 = getelementptr i32, i32* %scevgep100, i64 %41
  %scevgep105 = getelementptr i32, i32* %scevgep104, i64 %41
  br label %polly.loop_header38
}

; Function Attrs: nounwind uwtable
define noalias i32* @transpose(i32** noalias nocapture readnone %y, i32 %index) #1 {
entry:
  %call = tail call noalias i8* @malloc(i64 8192) #5
  %0 = bitcast i8* %call to i32*
  %1 = icmp ult i32 %index, 2048
  %2 = sext i32 %index to i64
  br i1 %1, label %polly.loop_preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %entry
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %for.cond1.preheader.preheader
  %3 = sext i32 %index to i64
  %4 = icmp sge i64 %3, 0
  %5 = sext i32 %index to i64
  %6 = icmp sle i64 %5, 2047
  %7 = and i1 %4, %6
  br i1 %7, label %polly.start, label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %polly.split_new_and_old, %for.inc10
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.inc10 ], [ 0, %polly.split_new_and_old ]
  %8 = shl i64 %indvars.iv5, 6
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.3, %for.body3 ]
  %9 = add nuw nsw i64 %indvars.iv, %8
  %arrayidx5 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %2
  %10 = load i32, i32* %arrayidx5, align 4
  %arrayidx9 = getelementptr inbounds i32, i32* %0, i64 %9
  store i32 %10, i32* %arrayidx9, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = add nuw nsw i64 %indvars.iv.next, %8
  %arrayidx5.1 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %11, i64 %2
  %12 = load i32, i32* %arrayidx5.1, align 4
  %arrayidx9.1 = getelementptr inbounds i32, i32* %0, i64 %11
  store i32 %12, i32* %arrayidx9.1, align 4
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %13 = add nuw nsw i64 %indvars.iv.next.1, %8
  %arrayidx5.2 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %13, i64 %2
  %14 = load i32, i32* %arrayidx5.2, align 4
  %arrayidx9.2 = getelementptr inbounds i32, i32* %0, i64 %13
  store i32 %14, i32* %arrayidx9.2, align 4
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %15 = add nuw nsw i64 %indvars.iv.next.2, %8
  %arrayidx5.3 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %15, i64 %2
  %16 = load i32, i32* %arrayidx5.3, align 4
  %arrayidx9.3 = getelementptr inbounds i32, i32* %0, i64 %15
  store i32 %16, i32* %arrayidx9.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 64
  br i1 %exitcond.3, label %for.inc10, label %for.body3

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next6, 32
  br i1 %exitcond9, label %for.end12.loopexit36, label %for.cond1.preheader

for.end12.loopexit:                               ; preds = %polly.loop_exit9.1
  br label %polly.merge_new_and_old76

for.end12.loopexit36:                             ; preds = %for.inc10
  br label %polly.merge_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.end12.loopexit36
  br label %for.end12

polly.merge_new_and_old76:                        ; preds = %polly.exiting78, %for.end12.loopexit
  br label %for.end12

for.end12:                                        ; preds = %polly.merge_new_and_old76, %polly.merge_new_and_old
  ret i32* %0

polly.loop_preheader:                             ; preds = %entry
  %scevgep = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 %2
  br label %polly.split_new_and_old75

polly.loop_exit9:                                 ; preds = %polly.loop_preheader14
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond28 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond28, label %polly.loop_preheader8.1.preheader, label %polly.loop_preheader8

polly.loop_preheader8.1.preheader:                ; preds = %polly.loop_exit9
  br label %polly.loop_preheader8.1

polly.split_new_and_old75:                        ; preds = %polly.loop_preheader
  br i1 true, label %polly.start77, label %polly.loop_preheader8

polly.loop_preheader8:                            ; preds = %polly.split_new_and_old75, %polly.loop_exit9
  %polly.indvar4 = phi i64 [ %polly.indvar_next5, %polly.loop_exit9 ], [ 0, %polly.split_new_and_old75 ]
  %17 = shl i64 %polly.indvar4, 17
  %scevgep19 = getelementptr i32, i32* %scevgep, i64 %17
  %18 = shl i64 %polly.indvar4, 8
  %scevgep21 = getelementptr i8, i8* %call, i64 %18
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %polly.loop_preheader14, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %polly.loop_preheader14 ]
  %19 = shl i64 %polly.indvar10, 2
  %20 = shl i64 %polly.indvar10, 13
  %scevgep20 = getelementptr i32, i32* %scevgep19, i64 %20
  %_p_scalar_ = load i32, i32* %scevgep20, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %21 = shl i64 %polly.indvar10, 4
  %scevgep22 = getelementptr i8, i8* %scevgep21, i64 %21
  %scevgep2223 = bitcast i8* %scevgep22 to i32*
  store i32 %_p_scalar_, i32* %scevgep2223, align 4, !alias.scope !16, !noalias !20, !llvm.mem.parallel_loop_access !17
  %22 = or i64 %19, 1
  %23 = shl i64 %22, 11
  %scevgep20.1 = getelementptr i32, i32* %scevgep19, i64 %23
  %_p_scalar_.1 = load i32, i32* %scevgep20.1, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %24 = shl i64 %22, 2
  %scevgep22.1 = getelementptr i8, i8* %scevgep21, i64 %24
  %scevgep2223.1 = bitcast i8* %scevgep22.1 to i32*
  store i32 %_p_scalar_.1, i32* %scevgep2223.1, align 4, !alias.scope !16, !noalias !20, !llvm.mem.parallel_loop_access !17
  %25 = or i64 %19, 2
  %26 = shl i64 %25, 11
  %scevgep20.2 = getelementptr i32, i32* %scevgep19, i64 %26
  %_p_scalar_.2 = load i32, i32* %scevgep20.2, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %27 = shl i64 %25, 2
  %scevgep22.2 = getelementptr i8, i8* %scevgep21, i64 %27
  %scevgep2223.2 = bitcast i8* %scevgep22.2 to i32*
  store i32 %_p_scalar_.2, i32* %scevgep2223.2, align 4, !alias.scope !16, !noalias !20, !llvm.mem.parallel_loop_access !17
  %28 = or i64 %19, 3
  %29 = shl i64 %28, 11
  %scevgep20.3 = getelementptr i32, i32* %scevgep19, i64 %29
  %_p_scalar_.3 = load i32, i32* %scevgep20.3, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %30 = shl i64 %28, 2
  %scevgep22.3 = getelementptr i8, i8* %scevgep21, i64 %30
  %scevgep2223.3 = bitcast i8* %scevgep22.3 to i32*
  store i32 %_p_scalar_.3, i32* %scevgep2223.3, align 4, !alias.scope !16, !noalias !20, !llvm.mem.parallel_loop_access !17
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond27 = icmp eq i64 %polly.indvar_next11, 8
  br i1 %exitcond27, label %polly.loop_exit9, label %polly.loop_preheader14

polly.loop_preheader8.1:                          ; preds = %polly.loop_preheader8.1.preheader, %polly.loop_exit9.1
  %polly.indvar4.1 = phi i64 [ %polly.indvar_next5.1, %polly.loop_exit9.1 ], [ 0, %polly.loop_preheader8.1.preheader ]
  %31 = shl i64 %polly.indvar4.1, 17
  %scevgep19.1 = getelementptr i32, i32* %scevgep, i64 %31
  %32 = shl i64 %polly.indvar4.1, 8
  %scevgep21.1 = getelementptr i8, i8* %call, i64 %32
  br label %polly.loop_preheader14.1

polly.loop_preheader14.1:                         ; preds = %polly.loop_preheader14.1, %polly.loop_preheader8.1
  %polly.indvar10.1 = phi i64 [ 0, %polly.loop_preheader8.1 ], [ %polly.indvar_next11.1, %polly.loop_preheader14.1 ]
  %33 = shl i64 %polly.indvar10.1, 2
  %34 = add nuw nsw i64 %33, 32
  %35 = shl i64 %34, 11
  %scevgep20.130 = getelementptr i32, i32* %scevgep19.1, i64 %35
  %_p_scalar_.131 = load i32, i32* %scevgep20.130, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %36 = shl i64 %34, 2
  %scevgep22.132 = getelementptr i8, i8* %scevgep21.1, i64 %36
  %scevgep2223.133 = bitcast i8* %scevgep22.132 to i32*
  store i32 %_p_scalar_.131, i32* %scevgep2223.133, align 4, !alias.scope !16, !noalias !20, !llvm.mem.parallel_loop_access !17
  %37 = add nsw i64 %33, 33
  %38 = shl i64 %37, 11
  %scevgep20.1.1 = getelementptr i32, i32* %scevgep19.1, i64 %38
  %_p_scalar_.1.1 = load i32, i32* %scevgep20.1.1, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %39 = shl i64 %37, 2
  %scevgep22.1.1 = getelementptr i8, i8* %scevgep21.1, i64 %39
  %scevgep2223.1.1 = bitcast i8* %scevgep22.1.1 to i32*
  store i32 %_p_scalar_.1.1, i32* %scevgep2223.1.1, align 4, !alias.scope !16, !noalias !20, !llvm.mem.parallel_loop_access !17
  %40 = add nsw i64 %33, 34
  %41 = shl i64 %40, 11
  %scevgep20.2.1 = getelementptr i32, i32* %scevgep19.1, i64 %41
  %_p_scalar_.2.1 = load i32, i32* %scevgep20.2.1, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %42 = shl i64 %40, 2
  %scevgep22.2.1 = getelementptr i8, i8* %scevgep21.1, i64 %42
  %scevgep2223.2.1 = bitcast i8* %scevgep22.2.1 to i32*
  store i32 %_p_scalar_.2.1, i32* %scevgep2223.2.1, align 4, !alias.scope !16, !noalias !20, !llvm.mem.parallel_loop_access !17
  %43 = add nsw i64 %33, 35
  %44 = shl i64 %43, 11
  %scevgep20.3.1 = getelementptr i32, i32* %scevgep19.1, i64 %44
  %_p_scalar_.3.1 = load i32, i32* %scevgep20.3.1, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %45 = shl i64 %43, 2
  %scevgep22.3.1 = getelementptr i8, i8* %scevgep21.1, i64 %45
  %scevgep2223.3.1 = bitcast i8* %scevgep22.3.1 to i32*
  store i32 %_p_scalar_.3.1, i32* %scevgep2223.3.1, align 4, !alias.scope !16, !noalias !20, !llvm.mem.parallel_loop_access !17
  %polly.indvar_next11.1 = add nuw nsw i64 %polly.indvar10.1, 1
  %exitcond27.1 = icmp eq i64 %polly.indvar_next11.1, 8
  br i1 %exitcond27.1, label %polly.loop_exit9.1, label %polly.loop_preheader14.1

polly.loop_exit9.1:                               ; preds = %polly.loop_preheader14.1
  %polly.indvar_next5.1 = add nuw nsw i64 %polly.indvar4.1, 1
  %exitcond28.1 = icmp eq i64 %polly.indvar_next5.1, 32
  br i1 %exitcond28.1, label %for.end12.loopexit, label %polly.loop_preheader8.1

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader37

polly.loop_exit:                                  ; preds = %polly.loop_exit40
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit40, %polly.loop_preheader37
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader37 ], [ %polly.indvar_next, %polly.loop_exit40 ]
  br label %polly.loop_preheader39

polly.loop_exit40:                                ; preds = %polly.stmt.for.body3
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, 30
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !21

polly.loop_preheader37:                           ; preds = %polly.start
  %scevgep44 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 %2
  %scevgep51 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 1, i64 %2
  %scevgep55 = getelementptr i8, i8* %call, i64 4
  %scevgep59 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 2, i64 %2
  %scevgep63 = getelementptr i8, i8* %call, i64 8
  %scevgep67 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 3, i64 %2
  %scevgep71 = getelementptr i8, i8* %call, i64 12
  br label %polly.loop_header

polly.loop_header38:                              ; preds = %polly.stmt.for.body3, %polly.loop_preheader39
  %polly.indvar41 = phi i64 [ 0, %polly.loop_preheader39 ], [ %polly.indvar_next42, %polly.stmt.for.body3 ]
  br label %polly.stmt.for.body3

polly.stmt.for.body3:                             ; preds = %polly.loop_header38
  %46 = shl i64 %polly.indvar41, 13
  %scevgep46 = getelementptr i32, i32* %scevgep45, i64 %46
  %_p_scalar_47 = load i32, i32* %scevgep46, align 4, !alias.scope !22, !noalias !24, !llvm.mem.parallel_loop_access !21
  %47 = shl i64 %polly.indvar41, 4
  %scevgep49 = getelementptr i8, i8* %scevgep48, i64 %47
  %scevgep4950 = bitcast i8* %scevgep49 to i32*
  store i32 %_p_scalar_47, i32* %scevgep4950, align 4, !alias.scope !25, !noalias !26, !llvm.mem.parallel_loop_access !21
  %48 = shl i64 %polly.indvar41, 13
  %scevgep53 = getelementptr i32, i32* %scevgep52, i64 %48
  %_p_scalar_54 = load i32, i32* %scevgep53, align 4, !alias.scope !22, !noalias !24, !llvm.mem.parallel_loop_access !21
  %49 = shl i64 %polly.indvar41, 4
  %scevgep57 = getelementptr i8, i8* %scevgep56, i64 %49
  %scevgep5758 = bitcast i8* %scevgep57 to i32*
  store i32 %_p_scalar_54, i32* %scevgep5758, align 4, !alias.scope !25, !noalias !26, !llvm.mem.parallel_loop_access !21
  %50 = shl i64 %polly.indvar41, 13
  %scevgep61 = getelementptr i32, i32* %scevgep60, i64 %50
  %_p_scalar_62 = load i32, i32* %scevgep61, align 4, !alias.scope !22, !noalias !24, !llvm.mem.parallel_loop_access !21
  %51 = shl i64 %polly.indvar41, 4
  %scevgep65 = getelementptr i8, i8* %scevgep64, i64 %51
  %scevgep6566 = bitcast i8* %scevgep65 to i32*
  store i32 %_p_scalar_62, i32* %scevgep6566, align 4, !alias.scope !25, !noalias !26, !llvm.mem.parallel_loop_access !21
  %52 = shl i64 %polly.indvar41, 13
  %scevgep69 = getelementptr i32, i32* %scevgep68, i64 %52
  %_p_scalar_70 = load i32, i32* %scevgep69, align 4, !alias.scope !22, !noalias !24, !llvm.mem.parallel_loop_access !21
  %53 = shl i64 %polly.indvar41, 4
  %scevgep73 = getelementptr i8, i8* %scevgep72, i64 %53
  %scevgep7374 = bitcast i8* %scevgep73 to i32*
  store i32 %_p_scalar_70, i32* %scevgep7374, align 4, !alias.scope !25, !noalias !26, !llvm.mem.parallel_loop_access !21
  %54 = shl i64 %polly.indvar41, 2
  %55 = add i64 %54, 4
  %p_exitcond.3 = icmp eq i64 %55, 64
  %polly.indvar_next42 = add nsw i64 %polly.indvar41, 1
  %polly.loop_cond43 = icmp sle i64 %polly.indvar41, 14
  br i1 %polly.loop_cond43, label %polly.loop_header38, label %polly.loop_exit40

polly.loop_preheader39:                           ; preds = %polly.loop_header
  %56 = shl i64 %polly.indvar, 17
  %scevgep45 = getelementptr i32, i32* %scevgep44, i64 %56
  %57 = shl i64 %polly.indvar, 8
  %scevgep48 = getelementptr i8, i8* %call, i64 %57
  %scevgep52 = getelementptr i32, i32* %scevgep51, i64 %56
  %scevgep56 = getelementptr i8, i8* %scevgep55, i64 %57
  %scevgep60 = getelementptr i32, i32* %scevgep59, i64 %56
  %scevgep64 = getelementptr i8, i8* %scevgep63, i64 %57
  %58 = shl i64 %polly.indvar, 17
  %scevgep68 = getelementptr i32, i32* %scevgep67, i64 %58
  %59 = shl i64 %polly.indvar, 8
  %scevgep72 = getelementptr i8, i8* %scevgep71, i64 %59
  br label %polly.loop_header38

polly.start77:                                    ; preds = %polly.split_new_and_old75
  br label %polly.loop_preheader80

polly.loop_exit81:                                ; preds = %polly.loop_exit87
  br label %polly.loop_preheader119

polly.loop_exit120:                               ; preds = %polly.loop_exit126
  br label %polly.exiting78

polly.exiting78:                                  ; preds = %polly.loop_exit120
  br label %polly.merge_new_and_old76

polly.loop_header79:                              ; preds = %polly.loop_exit87, %polly.loop_preheader80
  %polly.indvar82 = phi i64 [ 0, %polly.loop_preheader80 ], [ %polly.indvar_next83, %polly.loop_exit87 ]
  br label %polly.loop_preheader86

polly.loop_exit87:                                ; preds = %polly.stmt.polly.loop_preheader14
  %polly.indvar_next83 = add nsw i64 %polly.indvar82, 1
  %polly.loop_cond84 = icmp sle i64 %polly.indvar82, 30
  br i1 %polly.loop_cond84, label %polly.loop_header79, label %polly.loop_exit81, !llvm.loop !27

polly.loop_preheader80:                           ; preds = %polly.start77
  %scevgep91 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 %2
  %scevgep97 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 1, i64 %2
  %scevgep100 = getelementptr i8, i8* %call, i64 4
  %scevgep104 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 2, i64 %2
  %scevgep107 = getelementptr i8, i8* %call, i64 8
  %scevgep111 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 3, i64 %2
  %scevgep114 = getelementptr i8, i8* %call, i64 12
  br label %polly.loop_header79

polly.loop_header85:                              ; preds = %polly.stmt.polly.loop_preheader14, %polly.loop_preheader86
  %polly.indvar88 = phi i64 [ 0, %polly.loop_preheader86 ], [ %polly.indvar_next89, %polly.stmt.polly.loop_preheader14 ]
  br label %polly.stmt.polly.loop_preheader14

polly.stmt.polly.loop_preheader14:                ; preds = %polly.loop_header85
  %60 = shl i64 %polly.indvar88, 13
  %scevgep93 = getelementptr i32, i32* %scevgep92, i64 %60
  %_p_scalar__p_scalar_ = load i32, i32* %scevgep93, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !27
  %61 = shl i64 %polly.indvar88, 4
  %scevgep95 = getelementptr i8, i8* %scevgep94, i64 %61
  %scevgep9596 = bitcast i8* %scevgep95 to i32*
  store i32 %_p_scalar__p_scalar_, i32* %scevgep9596, align 4, !alias.scope !31, !noalias !32, !llvm.mem.parallel_loop_access !27
  %62 = shl i64 %polly.indvar88, 13
  %scevgep99 = getelementptr i32, i32* %scevgep98, i64 %62
  %_p_scalar_.1_p_scalar_ = load i32, i32* %scevgep99, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !27
  %63 = shl i64 %polly.indvar88, 4
  %scevgep102 = getelementptr i8, i8* %scevgep101, i64 %63
  %scevgep102103 = bitcast i8* %scevgep102 to i32*
  store i32 %_p_scalar_.1_p_scalar_, i32* %scevgep102103, align 4, !alias.scope !31, !noalias !32, !llvm.mem.parallel_loop_access !27
  %64 = shl i64 %polly.indvar88, 13
  %scevgep106 = getelementptr i32, i32* %scevgep105, i64 %64
  %_p_scalar_.2_p_scalar_ = load i32, i32* %scevgep106, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !27
  %65 = shl i64 %polly.indvar88, 4
  %scevgep109 = getelementptr i8, i8* %scevgep108, i64 %65
  %scevgep109110 = bitcast i8* %scevgep109 to i32*
  store i32 %_p_scalar_.2_p_scalar_, i32* %scevgep109110, align 4, !alias.scope !31, !noalias !32, !llvm.mem.parallel_loop_access !27
  %66 = shl i64 %polly.indvar88, 13
  %scevgep113 = getelementptr i32, i32* %scevgep112, i64 %66
  %_p_scalar_.3_p_scalar_ = load i32, i32* %scevgep113, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !27
  %67 = shl i64 %polly.indvar88, 4
  %scevgep116 = getelementptr i8, i8* %scevgep115, i64 %67
  %scevgep116117 = bitcast i8* %scevgep116 to i32*
  store i32 %_p_scalar_.3_p_scalar_, i32* %scevgep116117, align 4, !alias.scope !31, !noalias !32, !llvm.mem.parallel_loop_access !27
  %68 = add i64 %polly.indvar88, 1
  %p_exitcond27 = icmp eq i64 %68, 8
  %polly.indvar_next89 = add nsw i64 %polly.indvar88, 1
  %polly.loop_cond90 = icmp sle i64 %polly.indvar88, 6
  br i1 %polly.loop_cond90, label %polly.loop_header85, label %polly.loop_exit87

polly.loop_preheader86:                           ; preds = %polly.loop_header79
  %69 = shl i64 %polly.indvar82, 17
  %scevgep92 = getelementptr i32, i32* %scevgep91, i64 %69
  %70 = shl i64 %polly.indvar82, 8
  %scevgep94 = getelementptr i8, i8* %call, i64 %70
  %scevgep98 = getelementptr i32, i32* %scevgep97, i64 %69
  %scevgep101 = getelementptr i8, i8* %scevgep100, i64 %70
  %scevgep105 = getelementptr i32, i32* %scevgep104, i64 %69
  %scevgep108 = getelementptr i8, i8* %scevgep107, i64 %70
  %71 = shl i64 %polly.indvar82, 17
  %scevgep112 = getelementptr i32, i32* %scevgep111, i64 %71
  %72 = shl i64 %polly.indvar82, 8
  %scevgep115 = getelementptr i8, i8* %scevgep114, i64 %72
  br label %polly.loop_header85

polly.loop_header118:                             ; preds = %polly.loop_exit126, %polly.loop_preheader119
  %polly.indvar121 = phi i64 [ 0, %polly.loop_preheader119 ], [ %polly.indvar_next122, %polly.loop_exit126 ]
  br label %polly.loop_preheader125

polly.loop_exit126:                               ; preds = %polly.stmt.polly.loop_preheader14.1
  %polly.indvar_next122 = add nsw i64 %polly.indvar121, 1
  %polly.loop_cond123 = icmp sle i64 %polly.indvar121, 30
  br i1 %polly.loop_cond123, label %polly.loop_header118, label %polly.loop_exit120, !llvm.loop !33

polly.loop_preheader119:                          ; preds = %polly.loop_exit81
  %scevgep130 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 32, i64 %2
  %scevgep133 = getelementptr i8, i8* %call, i64 128
  %scevgep137 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 33, i64 %2
  %scevgep140 = getelementptr i8, i8* %call, i64 132
  %scevgep144 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 34, i64 %2
  %scevgep147 = getelementptr i8, i8* %call, i64 136
  %scevgep151 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 35, i64 %2
  %scevgep154 = getelementptr i8, i8* %call, i64 140
  br label %polly.loop_header118

polly.loop_header124:                             ; preds = %polly.stmt.polly.loop_preheader14.1, %polly.loop_preheader125
  %polly.indvar127 = phi i64 [ 0, %polly.loop_preheader125 ], [ %polly.indvar_next128, %polly.stmt.polly.loop_preheader14.1 ]
  br label %polly.stmt.polly.loop_preheader14.1

polly.stmt.polly.loop_preheader14.1:              ; preds = %polly.loop_header124
  %73 = shl i64 %polly.indvar127, 13
  %scevgep132 = getelementptr i32, i32* %scevgep131, i64 %73
  %_p_scalar_.131_p_scalar_ = load i32, i32* %scevgep132, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !33
  %74 = shl i64 %polly.indvar127, 4
  %scevgep135 = getelementptr i8, i8* %scevgep134, i64 %74
  %scevgep135136 = bitcast i8* %scevgep135 to i32*
  store i32 %_p_scalar_.131_p_scalar_, i32* %scevgep135136, align 4, !alias.scope !31, !noalias !32, !llvm.mem.parallel_loop_access !33
  %75 = shl i64 %polly.indvar127, 13
  %scevgep139 = getelementptr i32, i32* %scevgep138, i64 %75
  %_p_scalar_.1.1_p_scalar_ = load i32, i32* %scevgep139, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !33
  %76 = shl i64 %polly.indvar127, 4
  %scevgep142 = getelementptr i8, i8* %scevgep141, i64 %76
  %scevgep142143 = bitcast i8* %scevgep142 to i32*
  store i32 %_p_scalar_.1.1_p_scalar_, i32* %scevgep142143, align 4, !alias.scope !31, !noalias !32, !llvm.mem.parallel_loop_access !33
  %77 = shl i64 %polly.indvar127, 13
  %scevgep146 = getelementptr i32, i32* %scevgep145, i64 %77
  %_p_scalar_.2.1_p_scalar_ = load i32, i32* %scevgep146, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !33
  %78 = shl i64 %polly.indvar127, 4
  %scevgep149 = getelementptr i8, i8* %scevgep148, i64 %78
  %scevgep149150 = bitcast i8* %scevgep149 to i32*
  store i32 %_p_scalar_.2.1_p_scalar_, i32* %scevgep149150, align 4, !alias.scope !31, !noalias !32, !llvm.mem.parallel_loop_access !33
  %79 = shl i64 %polly.indvar127, 13
  %scevgep153 = getelementptr i32, i32* %scevgep152, i64 %79
  %_p_scalar_.3.1_p_scalar_ = load i32, i32* %scevgep153, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !33
  %80 = shl i64 %polly.indvar127, 4
  %scevgep156 = getelementptr i8, i8* %scevgep155, i64 %80
  %scevgep156157 = bitcast i8* %scevgep156 to i32*
  store i32 %_p_scalar_.3.1_p_scalar_, i32* %scevgep156157, align 4, !alias.scope !31, !noalias !32, !llvm.mem.parallel_loop_access !33
  %81 = add i64 %polly.indvar127, 1
  %p_exitcond27.1 = icmp eq i64 %81, 8
  %polly.indvar_next128 = add nsw i64 %polly.indvar127, 1
  %polly.loop_cond129 = icmp sle i64 %polly.indvar127, 6
  br i1 %polly.loop_cond129, label %polly.loop_header124, label %polly.loop_exit126

polly.loop_preheader125:                          ; preds = %polly.loop_header118
  %82 = shl i64 %polly.indvar121, 17
  %scevgep131 = getelementptr i32, i32* %scevgep130, i64 %82
  %83 = shl i64 %polly.indvar121, 8
  %scevgep134 = getelementptr i8, i8* %scevgep133, i64 %83
  %scevgep138 = getelementptr i32, i32* %scevgep137, i64 %82
  %scevgep141 = getelementptr i8, i8* %scevgep140, i64 %83
  %scevgep145 = getelementptr i32, i32* %scevgep144, i64 %82
  %scevgep148 = getelementptr i8, i8* %scevgep147, i64 %83
  %84 = shl i64 %polly.indvar121, 17
  %scevgep152 = getelementptr i32, i32* %scevgep151, i64 %84
  %85 = shl i64 %polly.indvar121, 8
  %scevgep155 = getelementptr i8, i8* %scevgep154, i64 %85
  br label %polly.loop_header124
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: norecurse nounwind readonly uwtable
define i32 @dot(i32* noalias nocapture readonly %a, i32* noalias nocapture readonly %b) #3 {
entry:
  %sum = alloca [64 x i32], align 16
  br label %polly.split_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting, %vector.body
  br label %polly.stmt.for.inc22.preheader

polly.stmt.for.inc22.preheader:                   ; preds = %polly.merge_new_and_old
  %scevgep18 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 0
  %_p_scalar_19 = load i32, i32* %scevgep18, align 16, !alias.scope !34, !noalias !36
  %scevgep18.1 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 1
  %_p_scalar_19.1 = load i32, i32* %scevgep18.1, align 4, !alias.scope !34, !noalias !36
  %p_add21.1 = add nsw i32 %_p_scalar_19.1, %_p_scalar_19
  %scevgep18.2 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 2
  %_p_scalar_19.2 = load i32, i32* %scevgep18.2, align 8, !alias.scope !34, !noalias !36
  %p_add21.2 = add nsw i32 %_p_scalar_19.2, %p_add21.1
  %scevgep18.3 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 3
  %_p_scalar_19.3 = load i32, i32* %scevgep18.3, align 4, !alias.scope !34, !noalias !36
  %p_add21.3 = add nsw i32 %_p_scalar_19.3, %p_add21.2
  %scevgep18.4 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 4
  %_p_scalar_19.4 = load i32, i32* %scevgep18.4, align 16, !alias.scope !34, !noalias !36
  %p_add21.4 = add nsw i32 %_p_scalar_19.4, %p_add21.3
  %scevgep18.5 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 5
  %_p_scalar_19.5 = load i32, i32* %scevgep18.5, align 4, !alias.scope !34, !noalias !36
  %p_add21.5 = add nsw i32 %_p_scalar_19.5, %p_add21.4
  %scevgep18.6 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 6
  %_p_scalar_19.6 = load i32, i32* %scevgep18.6, align 8, !alias.scope !34, !noalias !36
  %p_add21.6 = add nsw i32 %_p_scalar_19.6, %p_add21.5
  %scevgep18.7 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 7
  %_p_scalar_19.7 = load i32, i32* %scevgep18.7, align 4, !alias.scope !34, !noalias !36
  %p_add21.7 = add nsw i32 %_p_scalar_19.7, %p_add21.6
  %scevgep18.8 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 8
  %_p_scalar_19.8 = load i32, i32* %scevgep18.8, align 16, !alias.scope !34, !noalias !36
  %p_add21.8 = add nsw i32 %_p_scalar_19.8, %p_add21.7
  %scevgep18.9 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 9
  %_p_scalar_19.9 = load i32, i32* %scevgep18.9, align 4, !alias.scope !34, !noalias !36
  %p_add21.9 = add nsw i32 %_p_scalar_19.9, %p_add21.8
  %scevgep18.10 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 10
  %_p_scalar_19.10 = load i32, i32* %scevgep18.10, align 8, !alias.scope !34, !noalias !36
  %p_add21.10 = add nsw i32 %_p_scalar_19.10, %p_add21.9
  %scevgep18.11 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 11
  %_p_scalar_19.11 = load i32, i32* %scevgep18.11, align 4, !alias.scope !34, !noalias !36
  %p_add21.11 = add nsw i32 %_p_scalar_19.11, %p_add21.10
  %scevgep18.12 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 12
  %_p_scalar_19.12 = load i32, i32* %scevgep18.12, align 16, !alias.scope !34, !noalias !36
  %p_add21.12 = add nsw i32 %_p_scalar_19.12, %p_add21.11
  %scevgep18.13 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 13
  %_p_scalar_19.13 = load i32, i32* %scevgep18.13, align 4, !alias.scope !34, !noalias !36
  %p_add21.13 = add nsw i32 %_p_scalar_19.13, %p_add21.12
  %scevgep18.14 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 14
  %_p_scalar_19.14 = load i32, i32* %scevgep18.14, align 8, !alias.scope !34, !noalias !36
  %p_add21.14 = add nsw i32 %_p_scalar_19.14, %p_add21.13
  %scevgep18.15 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 15
  %_p_scalar_19.15 = load i32, i32* %scevgep18.15, align 4, !alias.scope !34, !noalias !36
  %p_add21.15 = add nsw i32 %_p_scalar_19.15, %p_add21.14
  %scevgep18.16 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 16
  %_p_scalar_19.16 = load i32, i32* %scevgep18.16, align 16, !alias.scope !34, !noalias !36
  %p_add21.16 = add nsw i32 %_p_scalar_19.16, %p_add21.15
  %scevgep18.17 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 17
  %_p_scalar_19.17 = load i32, i32* %scevgep18.17, align 4, !alias.scope !34, !noalias !36
  %p_add21.17 = add nsw i32 %_p_scalar_19.17, %p_add21.16
  %scevgep18.18 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 18
  %_p_scalar_19.18 = load i32, i32* %scevgep18.18, align 8, !alias.scope !34, !noalias !36
  %p_add21.18 = add nsw i32 %_p_scalar_19.18, %p_add21.17
  %scevgep18.19 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 19
  %_p_scalar_19.19 = load i32, i32* %scevgep18.19, align 4, !alias.scope !34, !noalias !36
  %p_add21.19 = add nsw i32 %_p_scalar_19.19, %p_add21.18
  %scevgep18.20 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 20
  %_p_scalar_19.20 = load i32, i32* %scevgep18.20, align 16, !alias.scope !34, !noalias !36
  %p_add21.20 = add nsw i32 %_p_scalar_19.20, %p_add21.19
  %scevgep18.21 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 21
  %_p_scalar_19.21 = load i32, i32* %scevgep18.21, align 4, !alias.scope !34, !noalias !36
  %p_add21.21 = add nsw i32 %_p_scalar_19.21, %p_add21.20
  %scevgep18.22 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 22
  %_p_scalar_19.22 = load i32, i32* %scevgep18.22, align 8, !alias.scope !34, !noalias !36
  %p_add21.22 = add nsw i32 %_p_scalar_19.22, %p_add21.21
  %scevgep18.23 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 23
  %_p_scalar_19.23 = load i32, i32* %scevgep18.23, align 4, !alias.scope !34, !noalias !36
  %p_add21.23 = add nsw i32 %_p_scalar_19.23, %p_add21.22
  %scevgep18.24 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 24
  %_p_scalar_19.24 = load i32, i32* %scevgep18.24, align 16, !alias.scope !34, !noalias !36
  %p_add21.24 = add nsw i32 %_p_scalar_19.24, %p_add21.23
  %scevgep18.25 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 25
  %_p_scalar_19.25 = load i32, i32* %scevgep18.25, align 4, !alias.scope !34, !noalias !36
  %p_add21.25 = add nsw i32 %_p_scalar_19.25, %p_add21.24
  %scevgep18.26 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 26
  %_p_scalar_19.26 = load i32, i32* %scevgep18.26, align 8, !alias.scope !34, !noalias !36
  %p_add21.26 = add nsw i32 %_p_scalar_19.26, %p_add21.25
  %scevgep18.27 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 27
  %_p_scalar_19.27 = load i32, i32* %scevgep18.27, align 4, !alias.scope !34, !noalias !36
  %p_add21.27 = add nsw i32 %_p_scalar_19.27, %p_add21.26
  %scevgep18.28 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 28
  %_p_scalar_19.28 = load i32, i32* %scevgep18.28, align 16, !alias.scope !34, !noalias !36
  %p_add21.28 = add nsw i32 %_p_scalar_19.28, %p_add21.27
  %scevgep18.29 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 29
  %_p_scalar_19.29 = load i32, i32* %scevgep18.29, align 4, !alias.scope !34, !noalias !36
  %p_add21.29 = add nsw i32 %_p_scalar_19.29, %p_add21.28
  %scevgep18.30 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 30
  %_p_scalar_19.30 = load i32, i32* %scevgep18.30, align 8, !alias.scope !34, !noalias !36
  %p_add21.30 = add nsw i32 %_p_scalar_19.30, %p_add21.29
  %scevgep18.31 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 31
  %_p_scalar_19.31 = load i32, i32* %scevgep18.31, align 4, !alias.scope !34, !noalias !36
  %p_add21.31 = add nsw i32 %_p_scalar_19.31, %p_add21.30
  ret i32 %p_add21.31

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %polly.loop_preheader2

polly.loop_preheader2:                            ; preds = %polly.split_new_and_old, %vector.body
  %polly.indvar = phi i64 [ %polly.indvar_next, %vector.body ], [ 0, %polly.split_new_and_old ]
  %0 = shl i64 %polly.indvar, 6
  %scevgep = getelementptr i32, i32* %a, i64 %0
  %scevgep8 = getelementptr i32, i32* %b, i64 %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader2
  %1 = bitcast i32* %scevgep to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %1, align 4, !alias.scope !42, !noalias !43
  %2 = bitcast i32* %scevgep8 to <4 x i32>*
  %wide.load21 = load <4 x i32>, <4 x i32>* %2, align 4, !alias.scope !38, !noalias !44
  %3 = mul nsw <4 x i32> %wide.load21, %wide.load
  %4 = getelementptr i32, i32* %scevgep, i64 4
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !42, !noalias !43
  %6 = getelementptr i32, i32* %scevgep8, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load21.1 = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !38, !noalias !44
  %8 = mul nsw <4 x i32> %wide.load21.1, %wide.load.1
  %9 = add nsw <4 x i32> %8, %3
  %10 = getelementptr i32, i32* %scevgep, i64 8
  %11 = bitcast i32* %10 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %11, align 4, !alias.scope !42, !noalias !43
  %12 = getelementptr i32, i32* %scevgep8, i64 8
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load21.2 = load <4 x i32>, <4 x i32>* %13, align 4, !alias.scope !38, !noalias !44
  %14 = mul nsw <4 x i32> %wide.load21.2, %wide.load.2
  %15 = add nsw <4 x i32> %14, %9
  %16 = getelementptr i32, i32* %scevgep, i64 12
  %17 = bitcast i32* %16 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %17, align 4, !alias.scope !42, !noalias !43
  %18 = getelementptr i32, i32* %scevgep8, i64 12
  %19 = bitcast i32* %18 to <4 x i32>*
  %wide.load21.3 = load <4 x i32>, <4 x i32>* %19, align 4, !alias.scope !38, !noalias !44
  %20 = mul nsw <4 x i32> %wide.load21.3, %wide.load.3
  %21 = add nsw <4 x i32> %20, %15
  %22 = getelementptr i32, i32* %scevgep, i64 16
  %23 = bitcast i32* %22 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %23, align 4, !alias.scope !42, !noalias !43
  %24 = getelementptr i32, i32* %scevgep8, i64 16
  %25 = bitcast i32* %24 to <4 x i32>*
  %wide.load21.4 = load <4 x i32>, <4 x i32>* %25, align 4, !alias.scope !38, !noalias !44
  %26 = mul nsw <4 x i32> %wide.load21.4, %wide.load.4
  %27 = add nsw <4 x i32> %26, %21
  %28 = getelementptr i32, i32* %scevgep, i64 20
  %29 = bitcast i32* %28 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %29, align 4, !alias.scope !42, !noalias !43
  %30 = getelementptr i32, i32* %scevgep8, i64 20
  %31 = bitcast i32* %30 to <4 x i32>*
  %wide.load21.5 = load <4 x i32>, <4 x i32>* %31, align 4, !alias.scope !38, !noalias !44
  %32 = mul nsw <4 x i32> %wide.load21.5, %wide.load.5
  %33 = add nsw <4 x i32> %32, %27
  %34 = getelementptr i32, i32* %scevgep, i64 24
  %35 = bitcast i32* %34 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %35, align 4, !alias.scope !42, !noalias !43
  %36 = getelementptr i32, i32* %scevgep8, i64 24
  %37 = bitcast i32* %36 to <4 x i32>*
  %wide.load21.6 = load <4 x i32>, <4 x i32>* %37, align 4, !alias.scope !38, !noalias !44
  %38 = mul nsw <4 x i32> %wide.load21.6, %wide.load.6
  %39 = add nsw <4 x i32> %38, %33
  %40 = getelementptr i32, i32* %scevgep, i64 28
  %41 = bitcast i32* %40 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %41, align 4, !alias.scope !42, !noalias !43
  %42 = getelementptr i32, i32* %scevgep8, i64 28
  %43 = bitcast i32* %42 to <4 x i32>*
  %wide.load21.7 = load <4 x i32>, <4 x i32>* %43, align 4, !alias.scope !38, !noalias !44
  %44 = mul nsw <4 x i32> %wide.load21.7, %wide.load.7
  %45 = add nsw <4 x i32> %44, %39
  %46 = getelementptr i32, i32* %scevgep, i64 32
  %47 = bitcast i32* %46 to <4 x i32>*
  %wide.load.8 = load <4 x i32>, <4 x i32>* %47, align 4, !alias.scope !42, !noalias !43
  %48 = getelementptr i32, i32* %scevgep8, i64 32
  %49 = bitcast i32* %48 to <4 x i32>*
  %wide.load21.8 = load <4 x i32>, <4 x i32>* %49, align 4, !alias.scope !38, !noalias !44
  %50 = mul nsw <4 x i32> %wide.load21.8, %wide.load.8
  %51 = add nsw <4 x i32> %50, %45
  %52 = getelementptr i32, i32* %scevgep, i64 36
  %53 = bitcast i32* %52 to <4 x i32>*
  %wide.load.9 = load <4 x i32>, <4 x i32>* %53, align 4, !alias.scope !42, !noalias !43
  %54 = getelementptr i32, i32* %scevgep8, i64 36
  %55 = bitcast i32* %54 to <4 x i32>*
  %wide.load21.9 = load <4 x i32>, <4 x i32>* %55, align 4, !alias.scope !38, !noalias !44
  %56 = mul nsw <4 x i32> %wide.load21.9, %wide.load.9
  %57 = add nsw <4 x i32> %56, %51
  %58 = getelementptr i32, i32* %scevgep, i64 40
  %59 = bitcast i32* %58 to <4 x i32>*
  %wide.load.10 = load <4 x i32>, <4 x i32>* %59, align 4, !alias.scope !42, !noalias !43
  %60 = getelementptr i32, i32* %scevgep8, i64 40
  %61 = bitcast i32* %60 to <4 x i32>*
  %wide.load21.10 = load <4 x i32>, <4 x i32>* %61, align 4, !alias.scope !38, !noalias !44
  %62 = mul nsw <4 x i32> %wide.load21.10, %wide.load.10
  %63 = add nsw <4 x i32> %62, %57
  %64 = getelementptr i32, i32* %scevgep, i64 44
  %65 = bitcast i32* %64 to <4 x i32>*
  %wide.load.11 = load <4 x i32>, <4 x i32>* %65, align 4, !alias.scope !42, !noalias !43
  %66 = getelementptr i32, i32* %scevgep8, i64 44
  %67 = bitcast i32* %66 to <4 x i32>*
  %wide.load21.11 = load <4 x i32>, <4 x i32>* %67, align 4, !alias.scope !38, !noalias !44
  %68 = mul nsw <4 x i32> %wide.load21.11, %wide.load.11
  %69 = add nsw <4 x i32> %68, %63
  %70 = getelementptr i32, i32* %scevgep, i64 48
  %71 = bitcast i32* %70 to <4 x i32>*
  %wide.load.12 = load <4 x i32>, <4 x i32>* %71, align 4, !alias.scope !42, !noalias !43
  %72 = getelementptr i32, i32* %scevgep8, i64 48
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load21.12 = load <4 x i32>, <4 x i32>* %73, align 4, !alias.scope !38, !noalias !44
  %74 = mul nsw <4 x i32> %wide.load21.12, %wide.load.12
  %75 = add nsw <4 x i32> %74, %69
  %76 = getelementptr i32, i32* %scevgep, i64 52
  %77 = bitcast i32* %76 to <4 x i32>*
  %wide.load.13 = load <4 x i32>, <4 x i32>* %77, align 4, !alias.scope !42, !noalias !43
  %78 = getelementptr i32, i32* %scevgep8, i64 52
  %79 = bitcast i32* %78 to <4 x i32>*
  %wide.load21.13 = load <4 x i32>, <4 x i32>* %79, align 4, !alias.scope !38, !noalias !44
  %80 = mul nsw <4 x i32> %wide.load21.13, %wide.load.13
  %81 = add nsw <4 x i32> %80, %75
  %82 = getelementptr i32, i32* %scevgep, i64 56
  %83 = bitcast i32* %82 to <4 x i32>*
  %wide.load.14 = load <4 x i32>, <4 x i32>* %83, align 4, !alias.scope !42, !noalias !43
  %84 = getelementptr i32, i32* %scevgep8, i64 56
  %85 = bitcast i32* %84 to <4 x i32>*
  %wide.load21.14 = load <4 x i32>, <4 x i32>* %85, align 4, !alias.scope !38, !noalias !44
  %86 = mul nsw <4 x i32> %wide.load21.14, %wide.load.14
  %87 = add nsw <4 x i32> %86, %81
  %88 = getelementptr i32, i32* %scevgep, i64 60
  %89 = bitcast i32* %88 to <4 x i32>*
  %wide.load.15 = load <4 x i32>, <4 x i32>* %89, align 4, !alias.scope !42, !noalias !43
  %90 = getelementptr i32, i32* %scevgep8, i64 60
  %91 = bitcast i32* %90 to <4 x i32>*
  %wide.load21.15 = load <4 x i32>, <4 x i32>* %91, align 4, !alias.scope !38, !noalias !44
  %92 = mul nsw <4 x i32> %wide.load21.15, %wide.load.15
  %93 = add nsw <4 x i32> %92, %87
  %rdx.shuf = shufflevector <4 x i32> %93, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %93, %rdx.shuf
  %rdx.shuf22 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx23 = add <4 x i32> %bin.rdx, %rdx.shuf22
  %94 = extractelement <4 x i32> %bin.rdx23, i32 0
  %scevgep11 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 %polly.indvar
  store i32 %94, i32* %scevgep11, align 4, !alias.scope !34, !noalias !36
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond20 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond20, label %polly.merge_new_and_old, label %polly.loop_preheader2

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.stmt.vector.body
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.vector.body, %polly.loop_preheader
  %polly.indvar24 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next25, %polly.stmt.vector.body ]
  br label %polly.stmt.vector.body

polly.stmt.vector.body:                           ; preds = %polly.loop_header
  %95 = shl i64 %polly.indvar24, 6
  %scevgep26 = getelementptr i32, i32* %a, i64 %95
  %scevgep2627 = bitcast i32* %scevgep26 to <4 x i32>*
  %wide.load_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2627, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep28 = getelementptr i32, i32* %b, i64 %95
  %scevgep2829 = bitcast i32* %scevgep28 to <4 x i32>*
  %wide.load21_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2829, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_ = mul nsw <4 x i32> %wide.load21_p_scalar_, %wide.load_p_scalar_
  %96 = shl i64 %polly.indvar24, 6
  %scevgep31 = getelementptr i32, i32* %scevgep30, i64 %96
  %scevgep3132 = bitcast i32* %scevgep31 to <4 x i32>*
  %wide.load.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3132, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep34 = getelementptr i32, i32* %scevgep33, i64 %96
  %scevgep3435 = bitcast i32* %scevgep34 to <4 x i32>*
  %wide.load21.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3435, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_36 = mul nsw <4 x i32> %wide.load21.1_p_scalar_, %wide.load.1_p_scalar_
  %p_37 = add nsw <4 x i32> %p_36, %p_
  %97 = shl i64 %polly.indvar24, 6
  %scevgep39 = getelementptr i32, i32* %scevgep38, i64 %97
  %scevgep3940 = bitcast i32* %scevgep39 to <4 x i32>*
  %wide.load.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3940, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep42 = getelementptr i32, i32* %scevgep41, i64 %97
  %scevgep4243 = bitcast i32* %scevgep42 to <4 x i32>*
  %wide.load21.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep4243, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_44 = mul nsw <4 x i32> %wide.load21.2_p_scalar_, %wide.load.2_p_scalar_
  %p_45 = add nsw <4 x i32> %p_44, %p_37
  %98 = shl i64 %polly.indvar24, 6
  %scevgep47 = getelementptr i32, i32* %scevgep46, i64 %98
  %scevgep4748 = bitcast i32* %scevgep47 to <4 x i32>*
  %wide.load.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep4748, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep50 = getelementptr i32, i32* %scevgep49, i64 %98
  %scevgep5051 = bitcast i32* %scevgep50 to <4 x i32>*
  %wide.load21.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5051, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_52 = mul nsw <4 x i32> %wide.load21.3_p_scalar_, %wide.load.3_p_scalar_
  %p_53 = add nsw <4 x i32> %p_52, %p_45
  %99 = shl i64 %polly.indvar24, 6
  %scevgep55 = getelementptr i32, i32* %scevgep54, i64 %99
  %scevgep5556 = bitcast i32* %scevgep55 to <4 x i32>*
  %wide.load.4_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5556, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep58 = getelementptr i32, i32* %scevgep57, i64 %99
  %scevgep5859 = bitcast i32* %scevgep58 to <4 x i32>*
  %wide.load21.4_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5859, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_60 = mul nsw <4 x i32> %wide.load21.4_p_scalar_, %wide.load.4_p_scalar_
  %p_61 = add nsw <4 x i32> %p_60, %p_53
  %100 = shl i64 %polly.indvar24, 6
  %scevgep63 = getelementptr i32, i32* %scevgep62, i64 %100
  %scevgep6364 = bitcast i32* %scevgep63 to <4 x i32>*
  %wide.load.5_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6364, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep66 = getelementptr i32, i32* %scevgep65, i64 %100
  %scevgep6667 = bitcast i32* %scevgep66 to <4 x i32>*
  %wide.load21.5_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6667, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_68 = mul nsw <4 x i32> %wide.load21.5_p_scalar_, %wide.load.5_p_scalar_
  %p_69 = add nsw <4 x i32> %p_68, %p_61
  %101 = shl i64 %polly.indvar24, 6
  %scevgep71 = getelementptr i32, i32* %scevgep70, i64 %101
  %scevgep7172 = bitcast i32* %scevgep71 to <4 x i32>*
  %wide.load.6_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7172, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep74 = getelementptr i32, i32* %scevgep73, i64 %101
  %scevgep7475 = bitcast i32* %scevgep74 to <4 x i32>*
  %wide.load21.6_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7475, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_76 = mul nsw <4 x i32> %wide.load21.6_p_scalar_, %wide.load.6_p_scalar_
  %p_77 = add nsw <4 x i32> %p_76, %p_69
  %102 = shl i64 %polly.indvar24, 6
  %scevgep79 = getelementptr i32, i32* %scevgep78, i64 %102
  %scevgep7980 = bitcast i32* %scevgep79 to <4 x i32>*
  %wide.load.7_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7980, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep82 = getelementptr i32, i32* %scevgep81, i64 %102
  %scevgep8283 = bitcast i32* %scevgep82 to <4 x i32>*
  %wide.load21.7_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep8283, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_84 = mul nsw <4 x i32> %wide.load21.7_p_scalar_, %wide.load.7_p_scalar_
  %p_85 = add nsw <4 x i32> %p_84, %p_77
  %103 = shl i64 %polly.indvar24, 6
  %scevgep87 = getelementptr i32, i32* %scevgep86, i64 %103
  %scevgep8788 = bitcast i32* %scevgep87 to <4 x i32>*
  %wide.load.8_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep8788, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep90 = getelementptr i32, i32* %scevgep89, i64 %103
  %scevgep9091 = bitcast i32* %scevgep90 to <4 x i32>*
  %wide.load21.8_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9091, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_92 = mul nsw <4 x i32> %wide.load21.8_p_scalar_, %wide.load.8_p_scalar_
  %p_93 = add nsw <4 x i32> %p_92, %p_85
  %104 = shl i64 %polly.indvar24, 6
  %scevgep95 = getelementptr i32, i32* %scevgep94, i64 %104
  %scevgep9596 = bitcast i32* %scevgep95 to <4 x i32>*
  %wide.load.9_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9596, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep98 = getelementptr i32, i32* %scevgep97, i64 %104
  %scevgep9899 = bitcast i32* %scevgep98 to <4 x i32>*
  %wide.load21.9_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9899, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_100 = mul nsw <4 x i32> %wide.load21.9_p_scalar_, %wide.load.9_p_scalar_
  %p_101 = add nsw <4 x i32> %p_100, %p_93
  %105 = shl i64 %polly.indvar24, 6
  %scevgep103 = getelementptr i32, i32* %scevgep102, i64 %105
  %scevgep103104 = bitcast i32* %scevgep103 to <4 x i32>*
  %wide.load.10_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep103104, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep106 = getelementptr i32, i32* %scevgep105, i64 %105
  %scevgep106107 = bitcast i32* %scevgep106 to <4 x i32>*
  %wide.load21.10_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep106107, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_108 = mul nsw <4 x i32> %wide.load21.10_p_scalar_, %wide.load.10_p_scalar_
  %p_109 = add nsw <4 x i32> %p_108, %p_101
  %106 = shl i64 %polly.indvar24, 6
  %scevgep111 = getelementptr i32, i32* %scevgep110, i64 %106
  %scevgep111112 = bitcast i32* %scevgep111 to <4 x i32>*
  %wide.load.11_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep111112, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep114 = getelementptr i32, i32* %scevgep113, i64 %106
  %scevgep114115 = bitcast i32* %scevgep114 to <4 x i32>*
  %wide.load21.11_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep114115, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_116 = mul nsw <4 x i32> %wide.load21.11_p_scalar_, %wide.load.11_p_scalar_
  %p_117 = add nsw <4 x i32> %p_116, %p_109
  %107 = shl i64 %polly.indvar24, 6
  %scevgep119 = getelementptr i32, i32* %scevgep118, i64 %107
  %scevgep119120 = bitcast i32* %scevgep119 to <4 x i32>*
  %wide.load.12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep119120, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep122 = getelementptr i32, i32* %scevgep121, i64 %107
  %scevgep122123 = bitcast i32* %scevgep122 to <4 x i32>*
  %wide.load21.12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep122123, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_124 = mul nsw <4 x i32> %wide.load21.12_p_scalar_, %wide.load.12_p_scalar_
  %p_125 = add nsw <4 x i32> %p_124, %p_117
  %108 = shl i64 %polly.indvar24, 6
  %scevgep127 = getelementptr i32, i32* %scevgep126, i64 %108
  %scevgep127128 = bitcast i32* %scevgep127 to <4 x i32>*
  %wide.load.13_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep127128, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep130 = getelementptr i32, i32* %scevgep129, i64 %108
  %scevgep130131 = bitcast i32* %scevgep130 to <4 x i32>*
  %wide.load21.13_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep130131, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_132 = mul nsw <4 x i32> %wide.load21.13_p_scalar_, %wide.load.13_p_scalar_
  %p_133 = add nsw <4 x i32> %p_132, %p_125
  %109 = shl i64 %polly.indvar24, 6
  %scevgep135 = getelementptr i32, i32* %scevgep134, i64 %109
  %scevgep135136 = bitcast i32* %scevgep135 to <4 x i32>*
  %wide.load.14_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep135136, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep138 = getelementptr i32, i32* %scevgep137, i64 %109
  %scevgep138139 = bitcast i32* %scevgep138 to <4 x i32>*
  %wide.load21.14_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep138139, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_140 = mul nsw <4 x i32> %wide.load21.14_p_scalar_, %wide.load.14_p_scalar_
  %p_141 = add nsw <4 x i32> %p_140, %p_133
  %110 = shl i64 %polly.indvar24, 6
  %scevgep143 = getelementptr i32, i32* %scevgep142, i64 %110
  %scevgep143144 = bitcast i32* %scevgep143 to <4 x i32>*
  %wide.load.15_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep143144, align 4, !alias.scope !45, !noalias !47, !llvm.mem.parallel_loop_access !50
  %scevgep146 = getelementptr i32, i32* %scevgep145, i64 %110
  %scevgep146147 = bitcast i32* %scevgep146 to <4 x i32>*
  %wide.load21.15_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep146147, align 4, !alias.scope !49, !noalias !51, !llvm.mem.parallel_loop_access !50
  %p_148 = mul nsw <4 x i32> %wide.load21.15_p_scalar_, %wide.load.15_p_scalar_
  %p_149 = add nsw <4 x i32> %p_148, %p_141
  %p_rdx.shuf = shufflevector <4 x i32> %p_149, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %p_bin.rdx = add <4 x i32> %p_149, %p_rdx.shuf
  %p_rdx.shuf22 = shufflevector <4 x i32> %p_bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %p_bin.rdx23 = add <4 x i32> %p_bin.rdx, %p_rdx.shuf22
  %p_150 = extractelement <4 x i32> %p_bin.rdx23, i32 0
  %scevgep151 = getelementptr [64 x i32], [64 x i32]* %sum, i64 0, i64 %polly.indvar24
  store i32 %p_150, i32* %scevgep151, align 4, !alias.scope !48, !noalias !52, !llvm.mem.parallel_loop_access !50
  %111 = add i64 %polly.indvar24, 1
  %p_exitcond20 = icmp eq i64 %111, 32
  %polly.indvar_next25 = add nsw i64 %polly.indvar24, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar24, 30
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !50

polly.loop_preheader:                             ; preds = %polly.start
  %scevgep30 = getelementptr i32, i32* %a, i64 4
  %scevgep33 = getelementptr i32, i32* %b, i64 4
  %scevgep38 = getelementptr i32, i32* %a, i64 8
  %scevgep41 = getelementptr i32, i32* %b, i64 8
  %scevgep46 = getelementptr i32, i32* %a, i64 12
  %scevgep49 = getelementptr i32, i32* %b, i64 12
  %scevgep54 = getelementptr i32, i32* %a, i64 16
  %scevgep57 = getelementptr i32, i32* %b, i64 16
  %scevgep62 = getelementptr i32, i32* %a, i64 20
  %scevgep65 = getelementptr i32, i32* %b, i64 20
  %scevgep70 = getelementptr i32, i32* %a, i64 24
  %scevgep73 = getelementptr i32, i32* %b, i64 24
  %scevgep78 = getelementptr i32, i32* %a, i64 28
  %scevgep81 = getelementptr i32, i32* %b, i64 28
  %scevgep86 = getelementptr i32, i32* %a, i64 32
  %scevgep89 = getelementptr i32, i32* %b, i64 32
  %scevgep94 = getelementptr i32, i32* %a, i64 36
  %scevgep97 = getelementptr i32, i32* %b, i64 36
  %scevgep102 = getelementptr i32, i32* %a, i64 40
  %scevgep105 = getelementptr i32, i32* %b, i64 40
  %scevgep110 = getelementptr i32, i32* %a, i64 44
  %scevgep113 = getelementptr i32, i32* %b, i64 44
  %scevgep118 = getelementptr i32, i32* %a, i64 48
  %scevgep121 = getelementptr i32, i32* %b, i64 48
  %scevgep126 = getelementptr i32, i32* %a, i64 52
  %scevgep129 = getelementptr i32, i32* %b, i64 52
  %scevgep134 = getelementptr i32, i32* %a, i64 56
  %scevgep137 = getelementptr i32, i32* %b, i64 56
  %scevgep142 = getelementptr i32, i32* %a, i64 60
  %scevgep145 = getelementptr i32, i32* %b, i64 60
  br label %polly.loop_header
}

; Function Attrs: nounwind uwtable
define void @print_array() #4 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  br label %for.body3

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 %indvars.iv6, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx5, align 4
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %2) #5
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
  %exitcond = icmp eq i64 %indvars.iv.next, 2048
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa)
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2048
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader

for.end11:                                        ; preds = %for.end
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
entry:
  br label %polly.split_new_and_old

polly.loop_exit3.i:                               ; preds = %polly.loop_exit9.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1
  %exitcond28.i = icmp eq i64 %polly.indvar_next.i, 64
  br i1 %exitcond28.i, label %for.body.preheader, label %polly.loop_preheader2.i, !llvm.loop !1

for.body.preheader:                               ; preds = %polly.loop_exit3.i
  br label %polly.merge_new_and_old

polly.loop_exit9.i:                               ; preds = %polly.loop_preheader20.i
  %polly.indvar_next5.i = add nuw nsw i64 %polly.indvar4.i, 1
  %exitcond27.i = icmp eq i64 %polly.indvar_next5.i, 64
  br i1 %exitcond27.i, label %polly.loop_exit3.i, label %polly.loop_preheader8.i

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %polly.loop_preheader2.i

polly.loop_preheader2.i:                          ; preds = %polly.split_new_and_old, %polly.loop_exit3.i
  %polly.indvar.i = phi i64 [ %polly.indvar_next.i, %polly.loop_exit3.i ], [ 0, %polly.split_new_and_old ]
  %0 = shl nsw i64 %polly.indvar.i, 5
  br label %polly.loop_preheader8.i

polly.loop_preheader8.i:                          ; preds = %polly.loop_preheader2.i, %polly.loop_exit9.i
  %polly.indvar4.i = phi i64 [ 0, %polly.loop_preheader2.i ], [ %polly.indvar_next5.i, %polly.loop_exit9.i ]
  %1 = shl i64 %polly.indvar4.i, 5
  %2 = or i64 %1, 4
  %3 = or i64 %1, 8
  %4 = or i64 %1, 12
  %5 = or i64 %1, 16
  %6 = or i64 %1, 20
  %7 = or i64 %1, 24
  %8 = or i64 %1, 28
  br label %polly.loop_preheader14.i

polly.loop_preheader14.i:                         ; preds = %polly.loop_preheader8.i, %polly.loop_preheader20.i
  %polly.indvar10.i = phi i64 [ 0, %polly.loop_preheader8.i ], [ %polly.indvar_next11.i, %polly.loop_preheader20.i ]
  %9 = add nuw nsw i64 %polly.indvar10.i, %0
  br label %polly.loop_preheader20.i

polly.loop_preheader20.i:                         ; preds = %polly.loop_preheader14.i
  %scevgep.i = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %1
  %scevgep25.i = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %1
  %10 = bitcast i32* %scevgep.i to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 16, !alias.scope !53, !noalias !55
  %11 = bitcast i32* %scevgep25.i to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %11, align 16, !alias.scope !56, !noalias !57
  %scevgep.i.1 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %2
  %scevgep25.i.1 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %2
  %12 = bitcast i32* %scevgep.i.1 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %12, align 16, !alias.scope !53, !noalias !55
  %13 = bitcast i32* %scevgep25.i.1 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16, !alias.scope !56, !noalias !57
  %scevgep.i.2 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %3
  %scevgep25.i.2 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %3
  %14 = bitcast i32* %scevgep.i.2 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %14, align 16, !alias.scope !53, !noalias !55
  %15 = bitcast i32* %scevgep25.i.2 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !56, !noalias !57
  %scevgep.i.3 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %4
  %scevgep25.i.3 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %4
  %16 = bitcast i32* %scevgep.i.3 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %16, align 16, !alias.scope !53, !noalias !55
  %17 = bitcast i32* %scevgep25.i.3 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !56, !noalias !57
  %scevgep.i.4 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %5
  %scevgep25.i.4 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %5
  %18 = bitcast i32* %scevgep.i.4 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %18, align 16, !alias.scope !53, !noalias !55
  %19 = bitcast i32* %scevgep25.i.4 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !56, !noalias !57
  %scevgep.i.5 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %6
  %scevgep25.i.5 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %6
  %20 = bitcast i32* %scevgep.i.5 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %20, align 16, !alias.scope !53, !noalias !55
  %21 = bitcast i32* %scevgep25.i.5 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !56, !noalias !57
  %scevgep.i.6 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %7
  %scevgep25.i.6 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %7
  %22 = bitcast i32* %scevgep.i.6 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %22, align 16, !alias.scope !53, !noalias !55
  %23 = bitcast i32* %scevgep25.i.6 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !56, !noalias !57
  %scevgep.i.7 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %9, i64 %8
  %scevgep25.i.7 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %9, i64 %8
  %24 = bitcast i32* %scevgep.i.7 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %24, align 16, !alias.scope !53, !noalias !55
  %25 = bitcast i32* %scevgep25.i.7 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 16, !alias.scope !56, !noalias !57
  %polly.indvar_next11.i = add nuw nsw i64 %polly.indvar10.i, 1
  %exitcond26.i = icmp eq i64 %polly.indvar_next11.i, 32
  br i1 %exitcond26.i, label %polly.loop_exit9.i, label %polly.loop_preheader14.i

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.body.preheader
  br label %for.body

for.body:                                         ; preds = %polly.merge_new_and_old, %for.inc10
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.inc10 ], [ 0, %polly.merge_new_and_old ]
  %26 = trunc i64 %indvars.iv3 to i32
  %call = tail call i32* @transpose(i32** undef, i32 %26)
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body3 ]
  %arraydecay = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %indvars.iv, i64 0
  %call7 = tail call i32 @dot(i32* %arraydecay, i32* %call)
  %arrayidx9 = getelementptr inbounds [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 %indvars.iv, i64 %indvars.iv3
  store i32 %call7, i32* %arrayidx9, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2048
  br i1 %exitcond, label %for.inc10, label %for.body3

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 2048
  br i1 %exitcond5, label %for.end12, label %for.body

for.end12:                                        ; preds = %for.inc10
  %27 = load i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Z, i64 0, i64 2047, i64 2047), align 4
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i64 0, i64 0), i32 2048, i32 2048, i32 2047, i32 2047, i32 %27) #5
  ret i32 0

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit3
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit3, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit3 ]
  br label %polly.loop_preheader2

polly.loop_exit3:                                 ; preds = %polly.loop_exit9
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, 62
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !58

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header1:                               ; preds = %polly.loop_exit9, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_exit9 ]
  br label %polly.loop_preheader8

polly.loop_exit9:                                 ; preds = %polly.stmt.polly.loop_preheader20.i
  %polly.indvar_next5 = add nsw i64 %polly.indvar4, 1
  %polly.loop_cond6 = icmp sle i64 %polly.indvar4, 62
  br i1 %polly.loop_cond6, label %polly.loop_header1, label %polly.loop_exit3

polly.loop_preheader2:                            ; preds = %polly.loop_header
  %28 = shl i64 %polly.indvar, 5
  %scevgep = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 %28, i64 0
  %scevgep16 = getelementptr [2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 %28, i64 0
  %29 = shl i64 %polly.indvar, 16
  %scevgep20 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 4), i64 %29
  %scevgep24 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 4), i64 %29
  %scevgep28 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 8), i64 %29
  %scevgep32 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 8), i64 %29
  %scevgep36 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 12), i64 %29
  %scevgep40 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 12), i64 %29
  %30 = shl i64 %polly.indvar, 16
  %scevgep44 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 16), i64 %30
  %scevgep48 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 16), i64 %30
  %scevgep52 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 20), i64 %30
  %scevgep56 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 20), i64 %30
  %scevgep60 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 24), i64 %30
  %scevgep64 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 24), i64 %30
  %31 = shl i64 %polly.indvar, 16
  %scevgep68 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @X, i64 0, i64 0, i64 28), i64 %31
  %scevgep72 = getelementptr i32, i32* getelementptr inbounds ([2048 x [2048 x i32]], [2048 x [2048 x i32]]* @Y, i64 0, i64 0, i64 28), i64 %31
  br label %polly.loop_header1

polly.loop_header7:                               ; preds = %polly.stmt.polly.loop_preheader20.i, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %polly.stmt.polly.loop_preheader20.i ]
  br label %polly.stmt.polly.loop_preheader20.i

polly.stmt.polly.loop_preheader20.i:              ; preds = %polly.loop_header7
  %32 = shl i64 %polly.indvar10, 11
  %scevgep14 = getelementptr i32, i32* %scevgep13, i64 %32
  %scevgep1415 = bitcast i32* %scevgep14 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep1415, align 16, !alias.scope !59, !noalias !61, !llvm.mem.parallel_loop_access !58
  %scevgep18 = getelementptr i32, i32* %scevgep17, i64 %32
  %scevgep1819 = bitcast i32* %scevgep18 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep1819, align 16, !alias.scope !62, !noalias !63, !llvm.mem.parallel_loop_access !58
  %33 = shl i64 %polly.indvar10, 11
  %scevgep22 = getelementptr i32, i32* %scevgep21, i64 %33
  %scevgep2223 = bitcast i32* %scevgep22 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep2223, align 16, !alias.scope !59, !noalias !61, !llvm.mem.parallel_loop_access !58
  %scevgep26 = getelementptr i32, i32* %scevgep25, i64 %33
  %scevgep2627 = bitcast i32* %scevgep26 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep2627, align 16, !alias.scope !62, !noalias !63, !llvm.mem.parallel_loop_access !58
  %34 = shl i64 %polly.indvar10, 11
  %scevgep30 = getelementptr i32, i32* %scevgep29, i64 %34
  %scevgep3031 = bitcast i32* %scevgep30 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep3031, align 16, !alias.scope !59, !noalias !61, !llvm.mem.parallel_loop_access !58
  %scevgep34 = getelementptr i32, i32* %scevgep33, i64 %34
  %scevgep3435 = bitcast i32* %scevgep34 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep3435, align 16, !alias.scope !62, !noalias !63, !llvm.mem.parallel_loop_access !58
  %35 = shl i64 %polly.indvar10, 11
  %scevgep38 = getelementptr i32, i32* %scevgep37, i64 %35
  %scevgep3839 = bitcast i32* %scevgep38 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep3839, align 16, !alias.scope !59, !noalias !61, !llvm.mem.parallel_loop_access !58
  %scevgep42 = getelementptr i32, i32* %scevgep41, i64 %35
  %scevgep4243 = bitcast i32* %scevgep42 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep4243, align 16, !alias.scope !62, !noalias !63, !llvm.mem.parallel_loop_access !58
  %36 = shl i64 %polly.indvar10, 11
  %scevgep46 = getelementptr i32, i32* %scevgep45, i64 %36
  %scevgep4647 = bitcast i32* %scevgep46 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep4647, align 16, !alias.scope !59, !noalias !61, !llvm.mem.parallel_loop_access !58
  %scevgep50 = getelementptr i32, i32* %scevgep49, i64 %36
  %scevgep5051 = bitcast i32* %scevgep50 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5051, align 16, !alias.scope !62, !noalias !63, !llvm.mem.parallel_loop_access !58
  %37 = shl i64 %polly.indvar10, 11
  %scevgep54 = getelementptr i32, i32* %scevgep53, i64 %37
  %scevgep5455 = bitcast i32* %scevgep54 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5455, align 16, !alias.scope !59, !noalias !61, !llvm.mem.parallel_loop_access !58
  %scevgep58 = getelementptr i32, i32* %scevgep57, i64 %37
  %scevgep5859 = bitcast i32* %scevgep58 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5859, align 16, !alias.scope !62, !noalias !63, !llvm.mem.parallel_loop_access !58
  %38 = shl i64 %polly.indvar10, 11
  %scevgep62 = getelementptr i32, i32* %scevgep61, i64 %38
  %scevgep6263 = bitcast i32* %scevgep62 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep6263, align 16, !alias.scope !59, !noalias !61, !llvm.mem.parallel_loop_access !58
  %scevgep66 = getelementptr i32, i32* %scevgep65, i64 %38
  %scevgep6667 = bitcast i32* %scevgep66 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep6667, align 16, !alias.scope !62, !noalias !63, !llvm.mem.parallel_loop_access !58
  %39 = shl i64 %polly.indvar10, 11
  %scevgep70 = getelementptr i32, i32* %scevgep69, i64 %39
  %scevgep7071 = bitcast i32* %scevgep70 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep7071, align 16, !alias.scope !59, !noalias !61, !llvm.mem.parallel_loop_access !58
  %scevgep74 = getelementptr i32, i32* %scevgep73, i64 %39
  %scevgep7475 = bitcast i32* %scevgep74 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep7475, align 16, !alias.scope !62, !noalias !63, !llvm.mem.parallel_loop_access !58
  %40 = add i64 %polly.indvar10, 1
  %p_exitcond26.i = icmp eq i64 %40, 32
  %polly.indvar_next11 = add nsw i64 %polly.indvar10, 1
  %polly.loop_cond12 = icmp sle i64 %polly.indvar10, 30
  br i1 %polly.loop_cond12, label %polly.loop_header7, label %polly.loop_exit9

polly.loop_preheader8:                            ; preds = %polly.loop_header1
  %41 = shl i64 %polly.indvar4, 5
  %scevgep13 = getelementptr i32, i32* %scevgep, i64 %41
  %scevgep17 = getelementptr i32, i32* %scevgep16, i64 %41
  %scevgep21 = getelementptr i32, i32* %scevgep20, i64 %41
  %scevgep25 = getelementptr i32, i32* %scevgep24, i64 %41
  %scevgep29 = getelementptr i32, i32* %scevgep28, i64 %41
  %scevgep33 = getelementptr i32, i32* %scevgep32, i64 %41
  %42 = shl i64 %polly.indvar4, 5
  %scevgep37 = getelementptr i32, i32* %scevgep36, i64 %42
  %scevgep41 = getelementptr i32, i32* %scevgep40, i64 %42
  %scevgep45 = getelementptr i32, i32* %scevgep44, i64 %42
  %scevgep49 = getelementptr i32, i32* %scevgep48, i64 %42
  %scevgep53 = getelementptr i32, i32* %scevgep52, i64 %42
  %scevgep57 = getelementptr i32, i32* %scevgep56, i64 %42
  %43 = shl i64 %polly.indvar4, 5
  %scevgep61 = getelementptr i32, i32* %scevgep60, i64 %43
  %scevgep65 = getelementptr i32, i32* %scevgep64, i64 %43
  %scevgep69 = getelementptr i32, i32* %scevgep68, i64 %43
  %scevgep73 = getelementptr i32, i32* %scevgep72, i64 %43
  br label %polly.loop_header7
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1}
!2 = distinct !{!2, !3, !"polly.alias.scope.X"}
!3 = distinct !{!3, !"polly.alias.scope.domain"}
!4 = !{!5}
!5 = distinct !{!5, !3, !"polly.alias.scope.Y"}
!6 = !{!2}
!7 = distinct !{!7}
!8 = distinct !{!8, !9, !"polly.alias.scope.X"}
!9 = distinct !{!9, !"polly.alias.scope.domain"}
!10 = !{!11}
!11 = distinct !{!11, !9, !"polly.alias.scope.Y"}
!12 = !{!8}
!13 = distinct !{!13, !14, !"polly.alias.scope.Y"}
!14 = distinct !{!14, !"polly.alias.scope.domain"}
!15 = !{!16}
!16 = distinct !{!16, !14, !"polly.alias.scope.call"}
!17 = !{!18, !19}
!18 = distinct !{!18}
!19 = distinct !{!19}
!20 = !{!13}
!21 = distinct !{!21}
!22 = distinct !{!22, !23, !"polly.alias.scope.Y"}
!23 = distinct !{!23, !"polly.alias.scope.domain"}
!24 = !{!25}
!25 = distinct !{!25, !23, !"polly.alias.scope.call"}
!26 = !{!22}
!27 = distinct !{!27}
!28 = distinct !{!28, !29, !"polly.alias.scope.Y"}
!29 = distinct !{!29, !"polly.alias.scope.domain"}
!30 = !{!31}
!31 = distinct !{!31, !29, !"polly.alias.scope.call"}
!32 = !{!28}
!33 = distinct !{!33}
!34 = distinct !{!34, !35, !"polly.alias.scope.sum"}
!35 = distinct !{!35, !"polly.alias.scope.domain"}
!36 = !{!37, !38, !39, !40, !41, !42}
!37 = distinct !{!37, !35, !"polly.alias.scope.add9.lcssa"}
!38 = distinct !{!38, !35, !"polly.alias.scope.b"}
!39 = distinct !{!39, !35, !"polly.alias.scope.add21"}
!40 = distinct !{!40, !35, !"polly.alias.scope.total.02"}
!41 = distinct !{!41, !35, !"polly.alias.scope.tmp.04"}
!42 = distinct !{!42, !35, !"polly.alias.scope.a"}
!43 = !{!37, !34, !38, !39, !40, !41}
!44 = !{!37, !34, !39, !40, !41, !42}
!45 = distinct !{!45, !46, !"polly.alias.scope.a"}
!46 = distinct !{!46, !"polly.alias.scope.domain"}
!47 = !{!48, !49}
!48 = distinct !{!48, !46, !"polly.alias.scope.sum"}
!49 = distinct !{!49, !46, !"polly.alias.scope.b"}
!50 = distinct !{!50}
!51 = !{!48, !45}
!52 = !{!49, !45}
!53 = distinct !{!53, !54, !"polly.alias.scope.X"}
!54 = distinct !{!54, !"polly.alias.scope.domain"}
!55 = !{!56}
!56 = distinct !{!56, !54, !"polly.alias.scope.Y"}
!57 = !{!53}
!58 = distinct !{!58}
!59 = distinct !{!59, !60, !"polly.alias.scope.X"}
!60 = distinct !{!60, !"polly.alias.scope.domain"}
!61 = !{!62}
!62 = distinct !{!62, !60, !"polly.alias.scope.Y"}
!63 = !{!59}
