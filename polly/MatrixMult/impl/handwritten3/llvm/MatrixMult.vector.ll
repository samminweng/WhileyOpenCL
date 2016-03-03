; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@X = common global [1024 x [1024 x i32]] zeroinitializer, align 16
@Y = common global [1024 x [1024 x i32]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@Z = common global [1024 x [1024 x i32]] zeroinitializer, align 16
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
  %exitcond28 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond28, label %polly.merge_new_and_old, label %polly.loop_preheader2, !llvm.loop !1

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
  %scevgep = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %1
  %scevgep25 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %1
  %10 = bitcast i32* %scevgep to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 16, !alias.scope !2, !noalias !4
  %11 = bitcast i32* %scevgep25 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %11, align 16, !alias.scope !5, !noalias !6
  %scevgep.1 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %2
  %scevgep25.1 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %2
  %12 = bitcast i32* %scevgep.1 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %12, align 16, !alias.scope !2, !noalias !4
  %13 = bitcast i32* %scevgep25.1 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16, !alias.scope !5, !noalias !6
  %scevgep.2 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %3
  %scevgep25.2 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %3
  %14 = bitcast i32* %scevgep.2 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %14, align 16, !alias.scope !2, !noalias !4
  %15 = bitcast i32* %scevgep25.2 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !5, !noalias !6
  %scevgep.3 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %4
  %scevgep25.3 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %4
  %16 = bitcast i32* %scevgep.3 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %16, align 16, !alias.scope !2, !noalias !4
  %17 = bitcast i32* %scevgep25.3 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !5, !noalias !6
  %scevgep.4 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %5
  %scevgep25.4 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %5
  %18 = bitcast i32* %scevgep.4 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %18, align 16, !alias.scope !2, !noalias !4
  %19 = bitcast i32* %scevgep25.4 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !5, !noalias !6
  %scevgep.5 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %6
  %scevgep25.5 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %6
  %20 = bitcast i32* %scevgep.5 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %20, align 16, !alias.scope !2, !noalias !4
  %21 = bitcast i32* %scevgep25.5 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !5, !noalias !6
  %scevgep.6 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %7
  %scevgep25.6 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %7
  %22 = bitcast i32* %scevgep.6 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %22, align 16, !alias.scope !2, !noalias !4
  %23 = bitcast i32* %scevgep25.6 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !5, !noalias !6
  %scevgep.7 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %8
  %scevgep25.7 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %8
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
  %polly.loop_cond = icmp sle i64 %polly.indvar30, 30
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !7

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header32:                              ; preds = %polly.loop_exit40, %polly.loop_preheader33
  %polly.indvar35 = phi i64 [ 0, %polly.loop_preheader33 ], [ %polly.indvar_next36, %polly.loop_exit40 ]
  br label %polly.loop_preheader39

polly.loop_exit40:                                ; preds = %polly.stmt.polly.loop_preheader20
  %polly.indvar_next36 = add nsw i64 %polly.indvar35, 1
  %polly.loop_cond37 = icmp sle i64 %polly.indvar35, 30
  br i1 %polly.loop_cond37, label %polly.loop_header32, label %polly.loop_exit34

polly.loop_preheader33:                           ; preds = %polly.loop_header
  %26 = shl i64 %polly.indvar30, 5
  %scevgep44 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %26, i64 0
  %scevgep48 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %26, i64 0
  %27 = shl i64 %polly.indvar30, 15
  %scevgep52 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 0, i64 4), i64 %27
  %scevgep56 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 4), i64 %27
  %scevgep60 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 0, i64 8), i64 %27
  %scevgep64 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 8), i64 %27
  %scevgep68 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 0, i64 12), i64 %27
  %scevgep72 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 12), i64 %27
  %28 = shl i64 %polly.indvar30, 15
  %scevgep76 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 0, i64 16), i64 %28
  %scevgep80 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 16), i64 %28
  %scevgep84 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 0, i64 20), i64 %28
  %scevgep88 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 20), i64 %28
  %scevgep92 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 0, i64 24), i64 %28
  %scevgep96 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 24), i64 %28
  %29 = shl i64 %polly.indvar30, 15
  %scevgep100 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 0, i64 28), i64 %29
  %scevgep104 = getelementptr i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 28), i64 %29
  br label %polly.loop_header32

polly.loop_header38:                              ; preds = %polly.stmt.polly.loop_preheader20, %polly.loop_preheader39
  %polly.indvar41 = phi i64 [ 0, %polly.loop_preheader39 ], [ %polly.indvar_next42, %polly.stmt.polly.loop_preheader20 ]
  br label %polly.stmt.polly.loop_preheader20

polly.stmt.polly.loop_preheader20:                ; preds = %polly.loop_header38
  %30 = shl i64 %polly.indvar41, 10
  %scevgep46 = getelementptr i32, i32* %scevgep45, i64 %30
  %scevgep4647 = bitcast i32* %scevgep46 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep4647, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep50 = getelementptr i32, i32* %scevgep49, i64 %30
  %scevgep5051 = bitcast i32* %scevgep50 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5051, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %31 = shl i64 %polly.indvar41, 10
  %scevgep54 = getelementptr i32, i32* %scevgep53, i64 %31
  %scevgep5455 = bitcast i32* %scevgep54 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5455, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep58 = getelementptr i32, i32* %scevgep57, i64 %31
  %scevgep5859 = bitcast i32* %scevgep58 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5859, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %32 = shl i64 %polly.indvar41, 10
  %scevgep62 = getelementptr i32, i32* %scevgep61, i64 %32
  %scevgep6263 = bitcast i32* %scevgep62 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep6263, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep66 = getelementptr i32, i32* %scevgep65, i64 %32
  %scevgep6667 = bitcast i32* %scevgep66 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep6667, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %33 = shl i64 %polly.indvar41, 10
  %scevgep70 = getelementptr i32, i32* %scevgep69, i64 %33
  %scevgep7071 = bitcast i32* %scevgep70 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep7071, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep74 = getelementptr i32, i32* %scevgep73, i64 %33
  %scevgep7475 = bitcast i32* %scevgep74 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep7475, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %34 = shl i64 %polly.indvar41, 10
  %scevgep78 = getelementptr i32, i32* %scevgep77, i64 %34
  %scevgep7879 = bitcast i32* %scevgep78 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep7879, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep82 = getelementptr i32, i32* %scevgep81, i64 %34
  %scevgep8283 = bitcast i32* %scevgep82 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep8283, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %35 = shl i64 %polly.indvar41, 10
  %scevgep86 = getelementptr i32, i32* %scevgep85, i64 %35
  %scevgep8687 = bitcast i32* %scevgep86 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep8687, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep90 = getelementptr i32, i32* %scevgep89, i64 %35
  %scevgep9091 = bitcast i32* %scevgep90 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep9091, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %36 = shl i64 %polly.indvar41, 10
  %scevgep94 = getelementptr i32, i32* %scevgep93, i64 %36
  %scevgep9495 = bitcast i32* %scevgep94 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep9495, align 16, !alias.scope !8, !noalias !10, !llvm.mem.parallel_loop_access !7
  %scevgep98 = getelementptr i32, i32* %scevgep97, i64 %36
  %scevgep9899 = bitcast i32* %scevgep98 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep9899, align 16, !alias.scope !11, !noalias !12, !llvm.mem.parallel_loop_access !7
  %37 = shl i64 %polly.indvar41, 10
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
  %call = tail call noalias i8* @malloc(i64 4096) #5
  %0 = bitcast i8* %call to i32*
  %1 = icmp ult i32 %index, 1024
  %2 = sext i32 %index to i64
  br i1 %1, label %polly.loop_preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %for.body.preheader
  %3 = sext i32 %index to i64
  %4 = icmp sge i64 %3, 0
  %5 = sext i32 %index to i64
  %6 = icmp sle i64 %5, 1023
  %7 = and i1 %4, %6
  br i1 %7, label %polly.start, label %for.body

for.body:                                         ; preds = %polly.split_new_and_old, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body ], [ 0, %polly.split_new_and_old ]
  %arrayidx2 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %2
  %8 = load i32, i32* %arrayidx2, align 4
  %arrayidx4 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  store i32 %8, i32* %arrayidx4, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx2.1 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv.next, i64 %2
  %9 = load i32, i32* %arrayidx2.1, align 4
  %arrayidx4.1 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next
  store i32 %9, i32* %arrayidx4.1, align 4
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx2.2 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv.next.1, i64 %2
  %10 = load i32, i32* %arrayidx2.2, align 4
  %arrayidx4.2 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.1
  store i32 %10, i32* %arrayidx4.2, align 4
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx2.3 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %indvars.iv.next.2, i64 %2
  %11 = load i32, i32* %arrayidx2.3, align 4
  %arrayidx4.3 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.2
  store i32 %11, i32* %arrayidx4.3, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1024
  br i1 %exitcond.3, label %for.end.loopexit9, label %for.body

for.end.loopexit:                                 ; preds = %polly.stmt.for.body
  br label %polly.merge_new_and_old39

for.end.loopexit9:                                ; preds = %for.body
  br label %polly.merge_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.end.loopexit9
  br label %for.end

polly.merge_new_and_old39:                        ; preds = %polly.exiting41, %for.end.loopexit
  br label %for.end

for.end:                                          ; preds = %polly.merge_new_and_old39, %polly.merge_new_and_old
  ret i32* %0

polly.split_new_and_old38:                        ; preds = %polly.loop_preheader
  br i1 true, label %polly.start40, label %polly.stmt.for.body

polly.stmt.for.body:                              ; preds = %polly.split_new_and_old38, %polly.stmt.for.body
  %polly.indvar = phi i64 [ %polly.indvar_next.3, %polly.stmt.for.body ], [ 0, %polly.split_new_and_old38 ]
  %12 = shl i64 %polly.indvar, 10
  %scevgep1 = getelementptr i32, i32* %scevgep, i64 %12
  %_p_scalar_ = load i32, i32* %scevgep1, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %13 = shl i64 %polly.indvar, 2
  %scevgep2 = getelementptr i8, i8* %call, i64 %13
  %scevgep23 = bitcast i8* %scevgep2 to i32*
  store i32 %_p_scalar_, i32* %scevgep23, align 4, !alias.scope !16, !noalias !18, !llvm.mem.parallel_loop_access !17
  %polly.indvar_next = or i64 %polly.indvar, 1
  %14 = shl i64 %polly.indvar_next, 10
  %scevgep1.1 = getelementptr i32, i32* %scevgep, i64 %14
  %_p_scalar_.1 = load i32, i32* %scevgep1.1, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %15 = shl i64 %polly.indvar_next, 2
  %scevgep2.1 = getelementptr i8, i8* %call, i64 %15
  %scevgep23.1 = bitcast i8* %scevgep2.1 to i32*
  store i32 %_p_scalar_.1, i32* %scevgep23.1, align 4, !alias.scope !16, !noalias !18, !llvm.mem.parallel_loop_access !17
  %polly.indvar_next.1 = or i64 %polly.indvar, 2
  %16 = shl i64 %polly.indvar_next.1, 10
  %scevgep1.2 = getelementptr i32, i32* %scevgep, i64 %16
  %_p_scalar_.2 = load i32, i32* %scevgep1.2, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %17 = shl i64 %polly.indvar_next.1, 2
  %scevgep2.2 = getelementptr i8, i8* %call, i64 %17
  %scevgep23.2 = bitcast i8* %scevgep2.2 to i32*
  store i32 %_p_scalar_.2, i32* %scevgep23.2, align 4, !alias.scope !16, !noalias !18, !llvm.mem.parallel_loop_access !17
  %polly.indvar_next.2 = or i64 %polly.indvar, 3
  %18 = shl i64 %polly.indvar_next.2, 10
  %scevgep1.3 = getelementptr i32, i32* %scevgep, i64 %18
  %_p_scalar_.3 = load i32, i32* %scevgep1.3, align 4, !alias.scope !13, !noalias !15, !llvm.mem.parallel_loop_access !17
  %19 = shl i64 %polly.indvar_next.2, 2
  %scevgep2.3 = getelementptr i8, i8* %call, i64 %19
  %scevgep23.3 = bitcast i8* %scevgep2.3 to i32*
  store i32 %_p_scalar_.3, i32* %scevgep23.3, align 4, !alias.scope !16, !noalias !18, !llvm.mem.parallel_loop_access !17
  %polly.indvar_next.3 = add nsw i64 %polly.indvar, 4
  %exitcond6.3 = icmp eq i64 %polly.indvar_next.3, 1024
  br i1 %exitcond6.3, label %for.end.loopexit, label %polly.stmt.for.body, !llvm.loop !17

polly.loop_preheader:                             ; preds = %entry
  %scevgep = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 %2
  br label %polly.split_new_and_old38

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader10

polly.loop_exit:                                  ; preds = %polly.stmt.for.body13
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.for.body13, %polly.loop_preheader10
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader10 ], [ %polly.indvar_next12, %polly.stmt.for.body13 ]
  br label %polly.stmt.for.body13

polly.stmt.for.body13:                            ; preds = %polly.loop_header
  %20 = shl i64 %polly.indvar11, 12
  %scevgep15 = getelementptr i32, i32* %scevgep14, i64 %20
  %_p_scalar_16 = load i32, i32* %scevgep15, align 4, !alias.scope !19, !noalias !21, !llvm.mem.parallel_loop_access !23
  %21 = shl i64 %polly.indvar11, 4
  %scevgep17 = getelementptr i8, i8* %call, i64 %21
  %scevgep1718 = bitcast i8* %scevgep17 to i32*
  store i32 %_p_scalar_16, i32* %scevgep1718, align 4, !alias.scope !22, !noalias !24, !llvm.mem.parallel_loop_access !23
  %22 = shl i64 %polly.indvar11, 12
  %scevgep20 = getelementptr i32, i32* %scevgep19, i64 %22
  %_p_scalar_21 = load i32, i32* %scevgep20, align 4, !alias.scope !19, !noalias !21, !llvm.mem.parallel_loop_access !23
  %23 = shl i64 %polly.indvar11, 4
  %scevgep24 = getelementptr i8, i8* %scevgep22, i64 %23
  %scevgep2425 = bitcast i8* %scevgep24 to i32*
  store i32 %_p_scalar_21, i32* %scevgep2425, align 4, !alias.scope !22, !noalias !24, !llvm.mem.parallel_loop_access !23
  %24 = shl i64 %polly.indvar11, 12
  %scevgep27 = getelementptr i32, i32* %scevgep26, i64 %24
  %_p_scalar_28 = load i32, i32* %scevgep27, align 4, !alias.scope !19, !noalias !21, !llvm.mem.parallel_loop_access !23
  %25 = shl i64 %polly.indvar11, 4
  %scevgep30 = getelementptr i8, i8* %scevgep29, i64 %25
  %scevgep3031 = bitcast i8* %scevgep30 to i32*
  store i32 %_p_scalar_28, i32* %scevgep3031, align 4, !alias.scope !22, !noalias !24, !llvm.mem.parallel_loop_access !23
  %26 = shl i64 %polly.indvar11, 12
  %scevgep33 = getelementptr i32, i32* %scevgep32, i64 %26
  %_p_scalar_34 = load i32, i32* %scevgep33, align 4, !alias.scope !19, !noalias !21, !llvm.mem.parallel_loop_access !23
  %27 = shl i64 %polly.indvar11, 4
  %scevgep36 = getelementptr i8, i8* %scevgep35, i64 %27
  %scevgep3637 = bitcast i8* %scevgep36 to i32*
  store i32 %_p_scalar_34, i32* %scevgep3637, align 4, !alias.scope !22, !noalias !24, !llvm.mem.parallel_loop_access !23
  %28 = shl i64 %polly.indvar11, 2
  %29 = add i64 %28, 4
  %p_exitcond.3 = icmp eq i64 %29, 1024
  %polly.indvar_next12 = add nsw i64 %polly.indvar11, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar11, 254
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !23

polly.loop_preheader10:                           ; preds = %polly.start
  %scevgep14 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 %2
  %scevgep19 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 1, i64 %2
  %scevgep22 = getelementptr i8, i8* %call, i64 4
  %scevgep26 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 2, i64 %2
  %scevgep29 = getelementptr i8, i8* %call, i64 8
  %scevgep32 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 3, i64 %2
  %scevgep35 = getelementptr i8, i8* %call, i64 12
  br label %polly.loop_header

polly.start40:                                    ; preds = %polly.split_new_and_old38
  br label %polly.loop_preheader43

polly.loop_exit44:                                ; preds = %polly.stmt.polly.stmt.for.body
  br label %polly.exiting41

polly.exiting41:                                  ; preds = %polly.loop_exit44
  br label %polly.merge_new_and_old39

polly.loop_header42:                              ; preds = %polly.stmt.polly.stmt.for.body, %polly.loop_preheader43
  %polly.indvar45 = phi i64 [ 0, %polly.loop_preheader43 ], [ %polly.indvar_next46, %polly.stmt.polly.stmt.for.body ]
  br label %polly.stmt.polly.stmt.for.body

polly.stmt.polly.stmt.for.body:                   ; preds = %polly.loop_header42
  %30 = shl i64 %polly.indvar45, 12
  %scevgep49 = getelementptr i32, i32* %scevgep48, i64 %30
  %_p_scalar__p_scalar_ = load i32, i32* %scevgep49, align 4, !alias.scope !25, !noalias !27, !llvm.mem.parallel_loop_access !29
  %31 = shl i64 %polly.indvar45, 4
  %scevgep50 = getelementptr i8, i8* %call, i64 %31
  %scevgep5051 = bitcast i8* %scevgep50 to i32*
  store i32 %_p_scalar__p_scalar_, i32* %scevgep5051, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !29
  %32 = shl i64 %polly.indvar45, 12
  %scevgep53 = getelementptr i32, i32* %scevgep52, i64 %32
  %_p_scalar_.1_p_scalar_ = load i32, i32* %scevgep53, align 4, !alias.scope !25, !noalias !27, !llvm.mem.parallel_loop_access !29
  %33 = shl i64 %polly.indvar45, 4
  %scevgep55 = getelementptr i8, i8* %scevgep54, i64 %33
  %scevgep5556 = bitcast i8* %scevgep55 to i32*
  store i32 %_p_scalar_.1_p_scalar_, i32* %scevgep5556, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !29
  %34 = shl i64 %polly.indvar45, 12
  %scevgep58 = getelementptr i32, i32* %scevgep57, i64 %34
  %_p_scalar_.2_p_scalar_ = load i32, i32* %scevgep58, align 4, !alias.scope !25, !noalias !27, !llvm.mem.parallel_loop_access !29
  %35 = shl i64 %polly.indvar45, 4
  %scevgep60 = getelementptr i8, i8* %scevgep59, i64 %35
  %scevgep6061 = bitcast i8* %scevgep60 to i32*
  store i32 %_p_scalar_.2_p_scalar_, i32* %scevgep6061, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !29
  %36 = shl i64 %polly.indvar45, 12
  %scevgep63 = getelementptr i32, i32* %scevgep62, i64 %36
  %_p_scalar_.3_p_scalar_ = load i32, i32* %scevgep63, align 4, !alias.scope !25, !noalias !27, !llvm.mem.parallel_loop_access !29
  %37 = shl i64 %polly.indvar45, 4
  %scevgep65 = getelementptr i8, i8* %scevgep64, i64 %37
  %scevgep6566 = bitcast i8* %scevgep65 to i32*
  store i32 %_p_scalar_.3_p_scalar_, i32* %scevgep6566, align 4, !alias.scope !28, !noalias !30, !llvm.mem.parallel_loop_access !29
  %38 = shl i64 %polly.indvar45, 2
  %39 = add i64 %38, 4
  %p_exitcond6.3 = icmp eq i64 %39, 1024
  %polly.indvar_next46 = add nsw i64 %polly.indvar45, 1
  %polly.loop_cond47 = icmp sle i64 %polly.indvar45, 254
  br i1 %polly.loop_cond47, label %polly.loop_header42, label %polly.loop_exit44, !llvm.loop !29

polly.loop_preheader43:                           ; preds = %polly.start40
  %scevgep48 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 %2
  %scevgep52 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 1, i64 %2
  %scevgep54 = getelementptr i8, i8* %call, i64 4
  %scevgep57 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 2, i64 %2
  %scevgep59 = getelementptr i8, i8* %call, i64 8
  %scevgep62 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 3, i64 %2
  %scevgep64 = getelementptr i8, i8* %call, i64 12
  br label %polly.loop_header42
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: norecurse nounwind readonly uwtable
define i32 @dot(i32* noalias nocapture readonly %a, i32* noalias nocapture readonly %b) #3 {
entry:
  %.s2a = alloca i32
  %sum.03.phiops.0.s2a = alloca i32
  %sum.03.phiops.0.phiops = alloca i32
  br label %polly.split_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting16, %vector.body
  %.merge = phi i32 [ %.final_reload, %polly.exiting16 ], [ %96, %vector.body ]
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.merge_new_and_old
  %.lcssa = phi i32 [ %.merge, %polly.merge_new_and_old ]
  ret i32 %.lcssa

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %polly.loop_preheader2

polly.loop_preheader2:                            ; preds = %polly.split_new_and_old, %vector.body
  %sum.03.phiops.0 = phi i32 [ %96, %vector.body ], [ 0, %polly.split_new_and_old ]
  %polly.indvar = phi i64 [ %polly.indvar_next, %vector.body ], [ 0, %polly.split_new_and_old ]
  %0 = shl i64 %polly.indvar, 6
  %scevgep = getelementptr i32, i32* %a, i64 %0
  %scevgep8 = getelementptr i32, i32* %b, i64 %0
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader2
  %1 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %sum.03.phiops.0, i32 0
  %2 = bitcast i32* %scevgep to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %2, align 4, !alias.scope !31, !noalias !33
  %3 = bitcast i32* %scevgep8 to <4 x i32>*
  %wide.load12 = load <4 x i32>, <4 x i32>* %3, align 4, !alias.scope !35, !noalias !38
  %4 = mul nsw <4 x i32> %wide.load12, %wide.load
  %5 = add nsw <4 x i32> %4, %1
  %6 = getelementptr i32, i32* %scevgep, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !31, !noalias !33
  %8 = getelementptr i32, i32* %scevgep8, i64 4
  %9 = bitcast i32* %8 to <4 x i32>*
  %wide.load12.1 = load <4 x i32>, <4 x i32>* %9, align 4, !alias.scope !35, !noalias !38
  %10 = mul nsw <4 x i32> %wide.load12.1, %wide.load.1
  %11 = add nsw <4 x i32> %10, %5
  %12 = getelementptr i32, i32* %scevgep, i64 8
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %13, align 4, !alias.scope !31, !noalias !33
  %14 = getelementptr i32, i32* %scevgep8, i64 8
  %15 = bitcast i32* %14 to <4 x i32>*
  %wide.load12.2 = load <4 x i32>, <4 x i32>* %15, align 4, !alias.scope !35, !noalias !38
  %16 = mul nsw <4 x i32> %wide.load12.2, %wide.load.2
  %17 = add nsw <4 x i32> %16, %11
  %18 = getelementptr i32, i32* %scevgep, i64 12
  %19 = bitcast i32* %18 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %19, align 4, !alias.scope !31, !noalias !33
  %20 = getelementptr i32, i32* %scevgep8, i64 12
  %21 = bitcast i32* %20 to <4 x i32>*
  %wide.load12.3 = load <4 x i32>, <4 x i32>* %21, align 4, !alias.scope !35, !noalias !38
  %22 = mul nsw <4 x i32> %wide.load12.3, %wide.load.3
  %23 = add nsw <4 x i32> %22, %17
  %24 = getelementptr i32, i32* %scevgep, i64 16
  %25 = bitcast i32* %24 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %25, align 4, !alias.scope !31, !noalias !33
  %26 = getelementptr i32, i32* %scevgep8, i64 16
  %27 = bitcast i32* %26 to <4 x i32>*
  %wide.load12.4 = load <4 x i32>, <4 x i32>* %27, align 4, !alias.scope !35, !noalias !38
  %28 = mul nsw <4 x i32> %wide.load12.4, %wide.load.4
  %29 = add nsw <4 x i32> %28, %23
  %30 = getelementptr i32, i32* %scevgep, i64 20
  %31 = bitcast i32* %30 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %31, align 4, !alias.scope !31, !noalias !33
  %32 = getelementptr i32, i32* %scevgep8, i64 20
  %33 = bitcast i32* %32 to <4 x i32>*
  %wide.load12.5 = load <4 x i32>, <4 x i32>* %33, align 4, !alias.scope !35, !noalias !38
  %34 = mul nsw <4 x i32> %wide.load12.5, %wide.load.5
  %35 = add nsw <4 x i32> %34, %29
  %36 = getelementptr i32, i32* %scevgep, i64 24
  %37 = bitcast i32* %36 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %37, align 4, !alias.scope !31, !noalias !33
  %38 = getelementptr i32, i32* %scevgep8, i64 24
  %39 = bitcast i32* %38 to <4 x i32>*
  %wide.load12.6 = load <4 x i32>, <4 x i32>* %39, align 4, !alias.scope !35, !noalias !38
  %40 = mul nsw <4 x i32> %wide.load12.6, %wide.load.6
  %41 = add nsw <4 x i32> %40, %35
  %42 = getelementptr i32, i32* %scevgep, i64 28
  %43 = bitcast i32* %42 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %43, align 4, !alias.scope !31, !noalias !33
  %44 = getelementptr i32, i32* %scevgep8, i64 28
  %45 = bitcast i32* %44 to <4 x i32>*
  %wide.load12.7 = load <4 x i32>, <4 x i32>* %45, align 4, !alias.scope !35, !noalias !38
  %46 = mul nsw <4 x i32> %wide.load12.7, %wide.load.7
  %47 = add nsw <4 x i32> %46, %41
  %48 = getelementptr i32, i32* %scevgep, i64 32
  %49 = bitcast i32* %48 to <4 x i32>*
  %wide.load.8 = load <4 x i32>, <4 x i32>* %49, align 4, !alias.scope !31, !noalias !33
  %50 = getelementptr i32, i32* %scevgep8, i64 32
  %51 = bitcast i32* %50 to <4 x i32>*
  %wide.load12.8 = load <4 x i32>, <4 x i32>* %51, align 4, !alias.scope !35, !noalias !38
  %52 = mul nsw <4 x i32> %wide.load12.8, %wide.load.8
  %53 = add nsw <4 x i32> %52, %47
  %54 = getelementptr i32, i32* %scevgep, i64 36
  %55 = bitcast i32* %54 to <4 x i32>*
  %wide.load.9 = load <4 x i32>, <4 x i32>* %55, align 4, !alias.scope !31, !noalias !33
  %56 = getelementptr i32, i32* %scevgep8, i64 36
  %57 = bitcast i32* %56 to <4 x i32>*
  %wide.load12.9 = load <4 x i32>, <4 x i32>* %57, align 4, !alias.scope !35, !noalias !38
  %58 = mul nsw <4 x i32> %wide.load12.9, %wide.load.9
  %59 = add nsw <4 x i32> %58, %53
  %60 = getelementptr i32, i32* %scevgep, i64 40
  %61 = bitcast i32* %60 to <4 x i32>*
  %wide.load.10 = load <4 x i32>, <4 x i32>* %61, align 4, !alias.scope !31, !noalias !33
  %62 = getelementptr i32, i32* %scevgep8, i64 40
  %63 = bitcast i32* %62 to <4 x i32>*
  %wide.load12.10 = load <4 x i32>, <4 x i32>* %63, align 4, !alias.scope !35, !noalias !38
  %64 = mul nsw <4 x i32> %wide.load12.10, %wide.load.10
  %65 = add nsw <4 x i32> %64, %59
  %66 = getelementptr i32, i32* %scevgep, i64 44
  %67 = bitcast i32* %66 to <4 x i32>*
  %wide.load.11 = load <4 x i32>, <4 x i32>* %67, align 4, !alias.scope !31, !noalias !33
  %68 = getelementptr i32, i32* %scevgep8, i64 44
  %69 = bitcast i32* %68 to <4 x i32>*
  %wide.load12.11 = load <4 x i32>, <4 x i32>* %69, align 4, !alias.scope !35, !noalias !38
  %70 = mul nsw <4 x i32> %wide.load12.11, %wide.load.11
  %71 = add nsw <4 x i32> %70, %65
  %72 = getelementptr i32, i32* %scevgep, i64 48
  %73 = bitcast i32* %72 to <4 x i32>*
  %wide.load.12 = load <4 x i32>, <4 x i32>* %73, align 4, !alias.scope !31, !noalias !33
  %74 = getelementptr i32, i32* %scevgep8, i64 48
  %75 = bitcast i32* %74 to <4 x i32>*
  %wide.load12.12 = load <4 x i32>, <4 x i32>* %75, align 4, !alias.scope !35, !noalias !38
  %76 = mul nsw <4 x i32> %wide.load12.12, %wide.load.12
  %77 = add nsw <4 x i32> %76, %71
  %78 = getelementptr i32, i32* %scevgep, i64 52
  %79 = bitcast i32* %78 to <4 x i32>*
  %wide.load.13 = load <4 x i32>, <4 x i32>* %79, align 4, !alias.scope !31, !noalias !33
  %80 = getelementptr i32, i32* %scevgep8, i64 52
  %81 = bitcast i32* %80 to <4 x i32>*
  %wide.load12.13 = load <4 x i32>, <4 x i32>* %81, align 4, !alias.scope !35, !noalias !38
  %82 = mul nsw <4 x i32> %wide.load12.13, %wide.load.13
  %83 = add nsw <4 x i32> %82, %77
  %84 = getelementptr i32, i32* %scevgep, i64 56
  %85 = bitcast i32* %84 to <4 x i32>*
  %wide.load.14 = load <4 x i32>, <4 x i32>* %85, align 4, !alias.scope !31, !noalias !33
  %86 = getelementptr i32, i32* %scevgep8, i64 56
  %87 = bitcast i32* %86 to <4 x i32>*
  %wide.load12.14 = load <4 x i32>, <4 x i32>* %87, align 4, !alias.scope !35, !noalias !38
  %88 = mul nsw <4 x i32> %wide.load12.14, %wide.load.14
  %89 = add nsw <4 x i32> %88, %83
  %90 = getelementptr i32, i32* %scevgep, i64 60
  %91 = bitcast i32* %90 to <4 x i32>*
  %wide.load.15 = load <4 x i32>, <4 x i32>* %91, align 4, !alias.scope !31, !noalias !33
  %92 = getelementptr i32, i32* %scevgep8, i64 60
  %93 = bitcast i32* %92 to <4 x i32>*
  %wide.load12.15 = load <4 x i32>, <4 x i32>* %93, align 4, !alias.scope !35, !noalias !38
  %94 = mul nsw <4 x i32> %wide.load12.15, %wide.load.15
  %95 = add nsw <4 x i32> %94, %89
  %rdx.shuf = shufflevector <4 x i32> %95, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %95, %rdx.shuf
  %rdx.shuf13 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx14 = add <4 x i32> %bin.rdx, %rdx.shuf13
  %96 = extractelement <4 x i32> %bin.rdx14, i32 0
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond11 = icmp eq i64 %polly.indvar_next, 16
  br i1 %exitcond11, label %polly.merge_new_and_old, label %polly.loop_preheader2

polly.start:                                      ; preds = %polly.split_new_and_old
  store i32 0, i32* %sum.03.phiops.0.phiops
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.stmt.vector.body
  br label %polly.exiting16

polly.exiting16:                                  ; preds = %polly.loop_exit
  %.final_reload = load i32, i32* %.s2a
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.vector.body, %polly.loop_preheader
  %polly.indvar17 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next18, %polly.stmt.vector.body ]
  br label %polly.stmt.polly.loop_preheader2

polly.stmt.polly.loop_preheader2:                 ; preds = %polly.loop_header
  %sum.03.phiops.0.phiops.reload = load i32, i32* %sum.03.phiops.0.phiops
  store i32 %sum.03.phiops.0.phiops.reload, i32* %sum.03.phiops.0.s2a
  br label %polly.stmt.vector.body

polly.stmt.vector.body:                           ; preds = %polly.stmt.polly.loop_preheader2
  %sum.03.phiops.0.s2a.reload = load i32, i32* %sum.03.phiops.0.s2a
  %p_ = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %sum.03.phiops.0.s2a.reload, i32 0
  %97 = shl i64 %polly.indvar17, 6
  %scevgep19 = getelementptr i32, i32* %a, i64 %97
  %scevgep1920 = bitcast i32* %scevgep19 to <4 x i32>*
  %wide.load_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep1920, align 4, !alias.scope !39, !noalias !41
  %scevgep21 = getelementptr i32, i32* %b, i64 %97
  %scevgep2122 = bitcast i32* %scevgep21 to <4 x i32>*
  %wide.load12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2122, align 4, !alias.scope !42, !noalias !45
  %p_23 = mul nsw <4 x i32> %wide.load12_p_scalar_, %wide.load_p_scalar_
  %p_24 = add nsw <4 x i32> %p_23, %p_
  %98 = shl i64 %polly.indvar17, 6
  %scevgep26 = getelementptr i32, i32* %scevgep25, i64 %98
  %scevgep2627 = bitcast i32* %scevgep26 to <4 x i32>*
  %wide.load.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2627, align 4, !alias.scope !39, !noalias !41
  %scevgep29 = getelementptr i32, i32* %scevgep28, i64 %98
  %scevgep2930 = bitcast i32* %scevgep29 to <4 x i32>*
  %wide.load12.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2930, align 4, !alias.scope !42, !noalias !45
  %p_31 = mul nsw <4 x i32> %wide.load12.1_p_scalar_, %wide.load.1_p_scalar_
  %p_32 = add nsw <4 x i32> %p_31, %p_24
  %99 = shl i64 %polly.indvar17, 6
  %scevgep34 = getelementptr i32, i32* %scevgep33, i64 %99
  %scevgep3435 = bitcast i32* %scevgep34 to <4 x i32>*
  %wide.load.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3435, align 4, !alias.scope !39, !noalias !41
  %scevgep37 = getelementptr i32, i32* %scevgep36, i64 %99
  %scevgep3738 = bitcast i32* %scevgep37 to <4 x i32>*
  %wide.load12.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3738, align 4, !alias.scope !42, !noalias !45
  %p_39 = mul nsw <4 x i32> %wide.load12.2_p_scalar_, %wide.load.2_p_scalar_
  %p_40 = add nsw <4 x i32> %p_39, %p_32
  %100 = shl i64 %polly.indvar17, 6
  %scevgep42 = getelementptr i32, i32* %scevgep41, i64 %100
  %scevgep4243 = bitcast i32* %scevgep42 to <4 x i32>*
  %wide.load.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep4243, align 4, !alias.scope !39, !noalias !41
  %scevgep45 = getelementptr i32, i32* %scevgep44, i64 %100
  %scevgep4546 = bitcast i32* %scevgep45 to <4 x i32>*
  %wide.load12.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep4546, align 4, !alias.scope !42, !noalias !45
  %p_47 = mul nsw <4 x i32> %wide.load12.3_p_scalar_, %wide.load.3_p_scalar_
  %p_48 = add nsw <4 x i32> %p_47, %p_40
  %101 = shl i64 %polly.indvar17, 6
  %scevgep50 = getelementptr i32, i32* %scevgep49, i64 %101
  %scevgep5051 = bitcast i32* %scevgep50 to <4 x i32>*
  %wide.load.4_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5051, align 4, !alias.scope !39, !noalias !41
  %scevgep53 = getelementptr i32, i32* %scevgep52, i64 %101
  %scevgep5354 = bitcast i32* %scevgep53 to <4 x i32>*
  %wide.load12.4_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5354, align 4, !alias.scope !42, !noalias !45
  %p_55 = mul nsw <4 x i32> %wide.load12.4_p_scalar_, %wide.load.4_p_scalar_
  %p_56 = add nsw <4 x i32> %p_55, %p_48
  %102 = shl i64 %polly.indvar17, 6
  %scevgep58 = getelementptr i32, i32* %scevgep57, i64 %102
  %scevgep5859 = bitcast i32* %scevgep58 to <4 x i32>*
  %wide.load.5_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep5859, align 4, !alias.scope !39, !noalias !41
  %scevgep61 = getelementptr i32, i32* %scevgep60, i64 %102
  %scevgep6162 = bitcast i32* %scevgep61 to <4 x i32>*
  %wide.load12.5_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6162, align 4, !alias.scope !42, !noalias !45
  %p_63 = mul nsw <4 x i32> %wide.load12.5_p_scalar_, %wide.load.5_p_scalar_
  %p_64 = add nsw <4 x i32> %p_63, %p_56
  %103 = shl i64 %polly.indvar17, 6
  %scevgep66 = getelementptr i32, i32* %scevgep65, i64 %103
  %scevgep6667 = bitcast i32* %scevgep66 to <4 x i32>*
  %wide.load.6_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6667, align 4, !alias.scope !39, !noalias !41
  %scevgep69 = getelementptr i32, i32* %scevgep68, i64 %103
  %scevgep6970 = bitcast i32* %scevgep69 to <4 x i32>*
  %wide.load12.6_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep6970, align 4, !alias.scope !42, !noalias !45
  %p_71 = mul nsw <4 x i32> %wide.load12.6_p_scalar_, %wide.load.6_p_scalar_
  %p_72 = add nsw <4 x i32> %p_71, %p_64
  %104 = shl i64 %polly.indvar17, 6
  %scevgep74 = getelementptr i32, i32* %scevgep73, i64 %104
  %scevgep7475 = bitcast i32* %scevgep74 to <4 x i32>*
  %wide.load.7_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7475, align 4, !alias.scope !39, !noalias !41
  %scevgep77 = getelementptr i32, i32* %scevgep76, i64 %104
  %scevgep7778 = bitcast i32* %scevgep77 to <4 x i32>*
  %wide.load12.7_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep7778, align 4, !alias.scope !42, !noalias !45
  %p_79 = mul nsw <4 x i32> %wide.load12.7_p_scalar_, %wide.load.7_p_scalar_
  %p_80 = add nsw <4 x i32> %p_79, %p_72
  %105 = shl i64 %polly.indvar17, 6
  %scevgep82 = getelementptr i32, i32* %scevgep81, i64 %105
  %scevgep8283 = bitcast i32* %scevgep82 to <4 x i32>*
  %wide.load.8_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep8283, align 4, !alias.scope !39, !noalias !41
  %scevgep85 = getelementptr i32, i32* %scevgep84, i64 %105
  %scevgep8586 = bitcast i32* %scevgep85 to <4 x i32>*
  %wide.load12.8_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep8586, align 4, !alias.scope !42, !noalias !45
  %p_87 = mul nsw <4 x i32> %wide.load12.8_p_scalar_, %wide.load.8_p_scalar_
  %p_88 = add nsw <4 x i32> %p_87, %p_80
  %106 = shl i64 %polly.indvar17, 6
  %scevgep90 = getelementptr i32, i32* %scevgep89, i64 %106
  %scevgep9091 = bitcast i32* %scevgep90 to <4 x i32>*
  %wide.load.9_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9091, align 4, !alias.scope !39, !noalias !41
  %scevgep93 = getelementptr i32, i32* %scevgep92, i64 %106
  %scevgep9394 = bitcast i32* %scevgep93 to <4 x i32>*
  %wide.load12.9_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9394, align 4, !alias.scope !42, !noalias !45
  %p_95 = mul nsw <4 x i32> %wide.load12.9_p_scalar_, %wide.load.9_p_scalar_
  %p_96 = add nsw <4 x i32> %p_95, %p_88
  %107 = shl i64 %polly.indvar17, 6
  %scevgep98 = getelementptr i32, i32* %scevgep97, i64 %107
  %scevgep9899 = bitcast i32* %scevgep98 to <4 x i32>*
  %wide.load.10_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep9899, align 4, !alias.scope !39, !noalias !41
  %scevgep101 = getelementptr i32, i32* %scevgep100, i64 %107
  %scevgep101102 = bitcast i32* %scevgep101 to <4 x i32>*
  %wide.load12.10_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep101102, align 4, !alias.scope !42, !noalias !45
  %p_103 = mul nsw <4 x i32> %wide.load12.10_p_scalar_, %wide.load.10_p_scalar_
  %p_104 = add nsw <4 x i32> %p_103, %p_96
  %108 = shl i64 %polly.indvar17, 6
  %scevgep106 = getelementptr i32, i32* %scevgep105, i64 %108
  %scevgep106107 = bitcast i32* %scevgep106 to <4 x i32>*
  %wide.load.11_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep106107, align 4, !alias.scope !39, !noalias !41
  %scevgep109 = getelementptr i32, i32* %scevgep108, i64 %108
  %scevgep109110 = bitcast i32* %scevgep109 to <4 x i32>*
  %wide.load12.11_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep109110, align 4, !alias.scope !42, !noalias !45
  %p_111 = mul nsw <4 x i32> %wide.load12.11_p_scalar_, %wide.load.11_p_scalar_
  %p_112 = add nsw <4 x i32> %p_111, %p_104
  %109 = shl i64 %polly.indvar17, 6
  %scevgep114 = getelementptr i32, i32* %scevgep113, i64 %109
  %scevgep114115 = bitcast i32* %scevgep114 to <4 x i32>*
  %wide.load.12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep114115, align 4, !alias.scope !39, !noalias !41
  %scevgep117 = getelementptr i32, i32* %scevgep116, i64 %109
  %scevgep117118 = bitcast i32* %scevgep117 to <4 x i32>*
  %wide.load12.12_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep117118, align 4, !alias.scope !42, !noalias !45
  %p_119 = mul nsw <4 x i32> %wide.load12.12_p_scalar_, %wide.load.12_p_scalar_
  %p_120 = add nsw <4 x i32> %p_119, %p_112
  %110 = shl i64 %polly.indvar17, 6
  %scevgep122 = getelementptr i32, i32* %scevgep121, i64 %110
  %scevgep122123 = bitcast i32* %scevgep122 to <4 x i32>*
  %wide.load.13_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep122123, align 4, !alias.scope !39, !noalias !41
  %scevgep125 = getelementptr i32, i32* %scevgep124, i64 %110
  %scevgep125126 = bitcast i32* %scevgep125 to <4 x i32>*
  %wide.load12.13_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep125126, align 4, !alias.scope !42, !noalias !45
  %p_127 = mul nsw <4 x i32> %wide.load12.13_p_scalar_, %wide.load.13_p_scalar_
  %p_128 = add nsw <4 x i32> %p_127, %p_120
  %111 = shl i64 %polly.indvar17, 6
  %scevgep130 = getelementptr i32, i32* %scevgep129, i64 %111
  %scevgep130131 = bitcast i32* %scevgep130 to <4 x i32>*
  %wide.load.14_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep130131, align 4, !alias.scope !39, !noalias !41
  %scevgep133 = getelementptr i32, i32* %scevgep132, i64 %111
  %scevgep133134 = bitcast i32* %scevgep133 to <4 x i32>*
  %wide.load12.14_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep133134, align 4, !alias.scope !42, !noalias !45
  %p_135 = mul nsw <4 x i32> %wide.load12.14_p_scalar_, %wide.load.14_p_scalar_
  %p_136 = add nsw <4 x i32> %p_135, %p_128
  %112 = shl i64 %polly.indvar17, 6
  %scevgep138 = getelementptr i32, i32* %scevgep137, i64 %112
  %scevgep138139 = bitcast i32* %scevgep138 to <4 x i32>*
  %wide.load.15_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep138139, align 4, !alias.scope !39, !noalias !41
  %scevgep141 = getelementptr i32, i32* %scevgep140, i64 %112
  %scevgep141142 = bitcast i32* %scevgep141 to <4 x i32>*
  %wide.load12.15_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep141142, align 4, !alias.scope !42, !noalias !45
  %p_143 = mul nsw <4 x i32> %wide.load12.15_p_scalar_, %wide.load.15_p_scalar_
  %p_144 = add nsw <4 x i32> %p_143, %p_136
  %p_rdx.shuf = shufflevector <4 x i32> %p_144, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %p_bin.rdx = add <4 x i32> %p_144, %p_rdx.shuf
  %p_rdx.shuf13 = shufflevector <4 x i32> %p_bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %p_bin.rdx14 = add <4 x i32> %p_bin.rdx, %p_rdx.shuf13
  %p_145 = extractelement <4 x i32> %p_bin.rdx14, i32 0
  %113 = add i64 %polly.indvar17, 1
  %p_exitcond11 = icmp eq i64 %113, 16
  store i32 %p_145, i32* %sum.03.phiops.0.phiops
  store i32 %p_145, i32* %.s2a
  %polly.indvar_next18 = add nsw i64 %polly.indvar17, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar17, 14
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  %scevgep25 = getelementptr i32, i32* %a, i64 4
  %scevgep28 = getelementptr i32, i32* %b, i64 4
  %scevgep33 = getelementptr i32, i32* %a, i64 8
  %scevgep36 = getelementptr i32, i32* %b, i64 8
  %scevgep41 = getelementptr i32, i32* %a, i64 12
  %scevgep44 = getelementptr i32, i32* %b, i64 12
  %scevgep49 = getelementptr i32, i32* %a, i64 16
  %scevgep52 = getelementptr i32, i32* %b, i64 16
  %scevgep57 = getelementptr i32, i32* %a, i64 20
  %scevgep60 = getelementptr i32, i32* %b, i64 20
  %scevgep65 = getelementptr i32, i32* %a, i64 24
  %scevgep68 = getelementptr i32, i32* %b, i64 24
  %scevgep73 = getelementptr i32, i32* %a, i64 28
  %scevgep76 = getelementptr i32, i32* %b, i64 28
  %scevgep81 = getelementptr i32, i32* %a, i64 32
  %scevgep84 = getelementptr i32, i32* %b, i64 32
  %scevgep89 = getelementptr i32, i32* %a, i64 36
  %scevgep92 = getelementptr i32, i32* %b, i64 36
  %scevgep97 = getelementptr i32, i32* %a, i64 40
  %scevgep100 = getelementptr i32, i32* %b, i64 40
  %scevgep105 = getelementptr i32, i32* %a, i64 44
  %scevgep108 = getelementptr i32, i32* %b, i64 44
  %scevgep113 = getelementptr i32, i32* %a, i64 48
  %scevgep116 = getelementptr i32, i32* %b, i64 48
  %scevgep121 = getelementptr i32, i32* %a, i64 52
  %scevgep124 = getelementptr i32, i32* %b, i64 52
  %scevgep129 = getelementptr i32, i32* %a, i64 56
  %scevgep132 = getelementptr i32, i32* %b, i64 56
  %scevgep137 = getelementptr i32, i32* %a, i64 60
  %scevgep140 = getelementptr i32, i32* %b, i64 60
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
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Z, i64 0, i64 %indvars.iv6, i64 %indvars.iv
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
define i32 @main() #1 {
entry:
  %y_t = alloca [1024 x i32], align 16
  br label %polly.loop_preheader2.i

polly.loop_exit3.i:                               ; preds = %polly.loop_exit9.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1
  %exitcond28.i = icmp eq i64 %polly.indvar_next.i, 32
  br i1 %exitcond28.i, label %polly.loop_preheader.preheader, label %polly.loop_preheader2.i, !llvm.loop !1

polly.loop_preheader.preheader:                   ; preds = %polly.loop_exit3.i
  br label %polly.loop_preheader

polly.loop_exit9.i:                               ; preds = %polly.loop_preheader20.i
  %polly.indvar_next5.i = add nuw nsw i64 %polly.indvar4.i, 1
  %exitcond27.i = icmp eq i64 %polly.indvar_next5.i, 32
  br i1 %exitcond27.i, label %polly.loop_exit3.i, label %polly.loop_preheader8.i

polly.loop_preheader2.i:                          ; preds = %polly.loop_exit3.i, %entry
  %polly.indvar.i = phi i64 [ 0, %entry ], [ %polly.indvar_next.i, %polly.loop_exit3.i ]
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
  %scevgep.i = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %1
  %scevgep25.i = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %1
  %10 = bitcast i32* %scevgep.i to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 16, !alias.scope !46, !noalias !48
  %11 = bitcast i32* %scevgep25.i to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %11, align 16, !alias.scope !49, !noalias !50
  %scevgep.i.1 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %2
  %scevgep25.i.1 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %2
  %12 = bitcast i32* %scevgep.i.1 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %12, align 16, !alias.scope !46, !noalias !48
  %13 = bitcast i32* %scevgep25.i.1 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16, !alias.scope !49, !noalias !50
  %scevgep.i.2 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %3
  %scevgep25.i.2 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %3
  %14 = bitcast i32* %scevgep.i.2 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %14, align 16, !alias.scope !46, !noalias !48
  %15 = bitcast i32* %scevgep25.i.2 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !49, !noalias !50
  %scevgep.i.3 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %4
  %scevgep25.i.3 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %4
  %16 = bitcast i32* %scevgep.i.3 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %16, align 16, !alias.scope !46, !noalias !48
  %17 = bitcast i32* %scevgep25.i.3 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16, !alias.scope !49, !noalias !50
  %scevgep.i.4 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %5
  %scevgep25.i.4 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %5
  %18 = bitcast i32* %scevgep.i.4 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %18, align 16, !alias.scope !46, !noalias !48
  %19 = bitcast i32* %scevgep25.i.4 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !49, !noalias !50
  %scevgep.i.5 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %6
  %scevgep25.i.5 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %6
  %20 = bitcast i32* %scevgep.i.5 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %20, align 16, !alias.scope !46, !noalias !48
  %21 = bitcast i32* %scevgep25.i.5 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !49, !noalias !50
  %scevgep.i.6 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %7
  %scevgep25.i.6 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %7
  %22 = bitcast i32* %scevgep.i.6 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %22, align 16, !alias.scope !46, !noalias !48
  %23 = bitcast i32* %scevgep25.i.6 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !49, !noalias !50
  %scevgep.i.7 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %9, i64 %8
  %scevgep25.i.7 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 %9, i64 %8
  %24 = bitcast i32* %scevgep.i.7 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %24, align 16, !alias.scope !46, !noalias !48
  %25 = bitcast i32* %scevgep25.i.7 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 16, !alias.scope !49, !noalias !50
  %polly.indvar_next11.i = add nuw nsw i64 %polly.indvar10.i, 1
  %exitcond26.i = icmp eq i64 %polly.indvar_next11.i, 32
  br i1 %exitcond26.i, label %polly.loop_exit9.i, label %polly.loop_preheader14.i

for.body10:                                       ; preds = %for.body10.preheader, %dot.exit
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %dot.exit ], [ 0, %for.body10.preheader ]
  br label %polly.loop_preheader2.i9

polly.loop_preheader2.i9:                         ; preds = %vector.body, %for.body10
  %sum.03.phiops.0.i = phi i32 [ 0, %for.body10 ], [ %122, %vector.body ]
  %polly.indvar.i7 = phi i64 [ 0, %for.body10 ], [ %polly.indvar_next.i3, %vector.body ]
  %26 = shl i64 %polly.indvar.i7, 6
  %scevgep.i8 = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @X, i64 0, i64 %indvars.iv4, i64 %26
  %scevgep8.i = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %26
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader2.i9
  %27 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %sum.03.phiops.0.i, i32 0
  %28 = bitcast i32* %scevgep.i8 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %28, align 16, !alias.scope !51, !noalias !56
  %29 = bitcast i32* %scevgep8.i to <4 x i32>*
  %wide.load10 = load <4 x i32>, <4 x i32>* %29, align 16, !alias.scope !62, !noalias !63
  %30 = mul nsw <4 x i32> %wide.load10, %wide.load
  %31 = add nsw <4 x i32> %30, %27
  %32 = getelementptr i32, i32* %scevgep.i8, i64 4
  %33 = bitcast i32* %32 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %33, align 16, !alias.scope !51, !noalias !56
  %34 = getelementptr i32, i32* %scevgep8.i, i64 4
  %35 = bitcast i32* %34 to <4 x i32>*
  %wide.load10.1 = load <4 x i32>, <4 x i32>* %35, align 16, !alias.scope !62, !noalias !63
  %36 = mul nsw <4 x i32> %wide.load10.1, %wide.load.1
  %37 = add nsw <4 x i32> %36, %31
  %38 = getelementptr i32, i32* %scevgep.i8, i64 8
  %39 = bitcast i32* %38 to <4 x i32>*
  %wide.load.2 = load <4 x i32>, <4 x i32>* %39, align 16, !alias.scope !51, !noalias !56
  %40 = getelementptr i32, i32* %scevgep8.i, i64 8
  %41 = bitcast i32* %40 to <4 x i32>*
  %wide.load10.2 = load <4 x i32>, <4 x i32>* %41, align 16, !alias.scope !62, !noalias !63
  %42 = mul nsw <4 x i32> %wide.load10.2, %wide.load.2
  %43 = add nsw <4 x i32> %42, %37
  %44 = getelementptr i32, i32* %scevgep.i8, i64 12
  %45 = bitcast i32* %44 to <4 x i32>*
  %wide.load.3 = load <4 x i32>, <4 x i32>* %45, align 16, !alias.scope !51, !noalias !56
  %46 = getelementptr i32, i32* %scevgep8.i, i64 12
  %47 = bitcast i32* %46 to <4 x i32>*
  %wide.load10.3 = load <4 x i32>, <4 x i32>* %47, align 16, !alias.scope !62, !noalias !63
  %48 = mul nsw <4 x i32> %wide.load10.3, %wide.load.3
  %49 = add nsw <4 x i32> %48, %43
  %50 = getelementptr i32, i32* %scevgep.i8, i64 16
  %51 = bitcast i32* %50 to <4 x i32>*
  %wide.load.4 = load <4 x i32>, <4 x i32>* %51, align 16, !alias.scope !51, !noalias !56
  %52 = getelementptr i32, i32* %scevgep8.i, i64 16
  %53 = bitcast i32* %52 to <4 x i32>*
  %wide.load10.4 = load <4 x i32>, <4 x i32>* %53, align 16, !alias.scope !62, !noalias !63
  %54 = mul nsw <4 x i32> %wide.load10.4, %wide.load.4
  %55 = add nsw <4 x i32> %54, %49
  %56 = getelementptr i32, i32* %scevgep.i8, i64 20
  %57 = bitcast i32* %56 to <4 x i32>*
  %wide.load.5 = load <4 x i32>, <4 x i32>* %57, align 16, !alias.scope !51, !noalias !56
  %58 = getelementptr i32, i32* %scevgep8.i, i64 20
  %59 = bitcast i32* %58 to <4 x i32>*
  %wide.load10.5 = load <4 x i32>, <4 x i32>* %59, align 16, !alias.scope !62, !noalias !63
  %60 = mul nsw <4 x i32> %wide.load10.5, %wide.load.5
  %61 = add nsw <4 x i32> %60, %55
  %62 = getelementptr i32, i32* %scevgep.i8, i64 24
  %63 = bitcast i32* %62 to <4 x i32>*
  %wide.load.6 = load <4 x i32>, <4 x i32>* %63, align 16, !alias.scope !51, !noalias !56
  %64 = getelementptr i32, i32* %scevgep8.i, i64 24
  %65 = bitcast i32* %64 to <4 x i32>*
  %wide.load10.6 = load <4 x i32>, <4 x i32>* %65, align 16, !alias.scope !62, !noalias !63
  %66 = mul nsw <4 x i32> %wide.load10.6, %wide.load.6
  %67 = add nsw <4 x i32> %66, %61
  %68 = getelementptr i32, i32* %scevgep.i8, i64 28
  %69 = bitcast i32* %68 to <4 x i32>*
  %wide.load.7 = load <4 x i32>, <4 x i32>* %69, align 16, !alias.scope !51, !noalias !56
  %70 = getelementptr i32, i32* %scevgep8.i, i64 28
  %71 = bitcast i32* %70 to <4 x i32>*
  %wide.load10.7 = load <4 x i32>, <4 x i32>* %71, align 16, !alias.scope !62, !noalias !63
  %72 = mul nsw <4 x i32> %wide.load10.7, %wide.load.7
  %73 = add nsw <4 x i32> %72, %67
  %74 = getelementptr i32, i32* %scevgep.i8, i64 32
  %75 = bitcast i32* %74 to <4 x i32>*
  %wide.load.8 = load <4 x i32>, <4 x i32>* %75, align 16, !alias.scope !51, !noalias !56
  %76 = getelementptr i32, i32* %scevgep8.i, i64 32
  %77 = bitcast i32* %76 to <4 x i32>*
  %wide.load10.8 = load <4 x i32>, <4 x i32>* %77, align 16, !alias.scope !62, !noalias !63
  %78 = mul nsw <4 x i32> %wide.load10.8, %wide.load.8
  %79 = add nsw <4 x i32> %78, %73
  %80 = getelementptr i32, i32* %scevgep.i8, i64 36
  %81 = bitcast i32* %80 to <4 x i32>*
  %wide.load.9 = load <4 x i32>, <4 x i32>* %81, align 16, !alias.scope !51, !noalias !56
  %82 = getelementptr i32, i32* %scevgep8.i, i64 36
  %83 = bitcast i32* %82 to <4 x i32>*
  %wide.load10.9 = load <4 x i32>, <4 x i32>* %83, align 16, !alias.scope !62, !noalias !63
  %84 = mul nsw <4 x i32> %wide.load10.9, %wide.load.9
  %85 = add nsw <4 x i32> %84, %79
  %86 = getelementptr i32, i32* %scevgep.i8, i64 40
  %87 = bitcast i32* %86 to <4 x i32>*
  %wide.load.10 = load <4 x i32>, <4 x i32>* %87, align 16, !alias.scope !51, !noalias !56
  %88 = getelementptr i32, i32* %scevgep8.i, i64 40
  %89 = bitcast i32* %88 to <4 x i32>*
  %wide.load10.10 = load <4 x i32>, <4 x i32>* %89, align 16, !alias.scope !62, !noalias !63
  %90 = mul nsw <4 x i32> %wide.load10.10, %wide.load.10
  %91 = add nsw <4 x i32> %90, %85
  %92 = getelementptr i32, i32* %scevgep.i8, i64 44
  %93 = bitcast i32* %92 to <4 x i32>*
  %wide.load.11 = load <4 x i32>, <4 x i32>* %93, align 16, !alias.scope !51, !noalias !56
  %94 = getelementptr i32, i32* %scevgep8.i, i64 44
  %95 = bitcast i32* %94 to <4 x i32>*
  %wide.load10.11 = load <4 x i32>, <4 x i32>* %95, align 16, !alias.scope !62, !noalias !63
  %96 = mul nsw <4 x i32> %wide.load10.11, %wide.load.11
  %97 = add nsw <4 x i32> %96, %91
  %98 = getelementptr i32, i32* %scevgep.i8, i64 48
  %99 = bitcast i32* %98 to <4 x i32>*
  %wide.load.12 = load <4 x i32>, <4 x i32>* %99, align 16, !alias.scope !51, !noalias !56
  %100 = getelementptr i32, i32* %scevgep8.i, i64 48
  %101 = bitcast i32* %100 to <4 x i32>*
  %wide.load10.12 = load <4 x i32>, <4 x i32>* %101, align 16, !alias.scope !62, !noalias !63
  %102 = mul nsw <4 x i32> %wide.load10.12, %wide.load.12
  %103 = add nsw <4 x i32> %102, %97
  %104 = getelementptr i32, i32* %scevgep.i8, i64 52
  %105 = bitcast i32* %104 to <4 x i32>*
  %wide.load.13 = load <4 x i32>, <4 x i32>* %105, align 16, !alias.scope !51, !noalias !56
  %106 = getelementptr i32, i32* %scevgep8.i, i64 52
  %107 = bitcast i32* %106 to <4 x i32>*
  %wide.load10.13 = load <4 x i32>, <4 x i32>* %107, align 16, !alias.scope !62, !noalias !63
  %108 = mul nsw <4 x i32> %wide.load10.13, %wide.load.13
  %109 = add nsw <4 x i32> %108, %103
  %110 = getelementptr i32, i32* %scevgep.i8, i64 56
  %111 = bitcast i32* %110 to <4 x i32>*
  %wide.load.14 = load <4 x i32>, <4 x i32>* %111, align 16, !alias.scope !51, !noalias !56
  %112 = getelementptr i32, i32* %scevgep8.i, i64 56
  %113 = bitcast i32* %112 to <4 x i32>*
  %wide.load10.14 = load <4 x i32>, <4 x i32>* %113, align 16, !alias.scope !62, !noalias !63
  %114 = mul nsw <4 x i32> %wide.load10.14, %wide.load.14
  %115 = add nsw <4 x i32> %114, %109
  %116 = getelementptr i32, i32* %scevgep.i8, i64 60
  %117 = bitcast i32* %116 to <4 x i32>*
  %wide.load.15 = load <4 x i32>, <4 x i32>* %117, align 16, !alias.scope !51, !noalias !56
  %118 = getelementptr i32, i32* %scevgep8.i, i64 60
  %119 = bitcast i32* %118 to <4 x i32>*
  %wide.load10.15 = load <4 x i32>, <4 x i32>* %119, align 16, !alias.scope !62, !noalias !63
  %120 = mul nsw <4 x i32> %wide.load10.15, %wide.load.15
  %121 = add nsw <4 x i32> %120, %115
  %rdx.shuf = shufflevector <4 x i32> %121, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %121, %rdx.shuf
  %rdx.shuf11 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx12 = add <4 x i32> %bin.rdx, %rdx.shuf11
  %122 = extractelement <4 x i32> %bin.rdx12, i32 0
  %polly.indvar_next.i3 = add nuw nsw i64 %polly.indvar.i7, 1
  %exitcond11.i = icmp eq i64 %polly.indvar_next.i3, 16
  br i1 %exitcond11.i, label %dot.exit, label %polly.loop_preheader2.i9

dot.exit:                                         ; preds = %vector.body
  %.lcssa = phi i32 [ %122, %vector.body ]
  %arrayidx18 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Z, i64 0, i64 %indvars.iv4, i64 %indvars.iv7
  store i32 %.lcssa, i32* %arrayidx18, align 4
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1024
  br i1 %exitcond6, label %for.inc22, label %for.body10

for.inc22:                                        ; preds = %dot.exit
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1024
  br i1 %exitcond9, label %for.end24, label %polly.loop_preheader

for.end24:                                        ; preds = %for.inc22
  %123 = load i32, i32* getelementptr inbounds ([1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Z, i64 0, i64 1023, i64 1023), align 4
  %call25 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i64 0, i64 0), i32 1024, i32 1024, i32 1023, i32 1023, i32 %123) #5
  ret i32 0

polly.stmt.for.body3:                             ; preds = %polly.stmt.for.body3, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next.3, %polly.stmt.for.body3 ]
  %124 = shl i64 %polly.indvar, 10
  %scevgep1 = getelementptr i32, i32* %scevgep, i64 %124
  %_p_scalar_ = load i32, i32* %scevgep1, align 4, !alias.scope !64, !noalias !66, !llvm.mem.parallel_loop_access !68
  %scevgep2 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar
  store i32 %_p_scalar_, i32* %scevgep2, align 16, !alias.scope !67, !noalias !69, !llvm.mem.parallel_loop_access !68
  %polly.indvar_next = or i64 %polly.indvar, 1
  %125 = shl i64 %polly.indvar_next, 10
  %scevgep1.1 = getelementptr i32, i32* %scevgep, i64 %125
  %_p_scalar_.1 = load i32, i32* %scevgep1.1, align 4, !alias.scope !64, !noalias !66, !llvm.mem.parallel_loop_access !68
  %scevgep2.1 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar_next
  store i32 %_p_scalar_.1, i32* %scevgep2.1, align 4, !alias.scope !67, !noalias !69, !llvm.mem.parallel_loop_access !68
  %polly.indvar_next.1 = or i64 %polly.indvar, 2
  %126 = shl i64 %polly.indvar_next.1, 10
  %scevgep1.2 = getelementptr i32, i32* %scevgep, i64 %126
  %_p_scalar_.2 = load i32, i32* %scevgep1.2, align 4, !alias.scope !64, !noalias !66, !llvm.mem.parallel_loop_access !68
  %scevgep2.2 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar_next.1
  store i32 %_p_scalar_.2, i32* %scevgep2.2, align 8, !alias.scope !67, !noalias !69, !llvm.mem.parallel_loop_access !68
  %polly.indvar_next.2 = or i64 %polly.indvar, 3
  %127 = shl i64 %polly.indvar_next.2, 10
  %scevgep1.3 = getelementptr i32, i32* %scevgep, i64 %127
  %_p_scalar_.3 = load i32, i32* %scevgep1.3, align 4, !alias.scope !64, !noalias !66, !llvm.mem.parallel_loop_access !68
  %scevgep2.3 = getelementptr [1024 x i32], [1024 x i32]* %y_t, i64 0, i64 %polly.indvar_next.2
  store i32 %_p_scalar_.3, i32* %scevgep2.3, align 4, !alias.scope !67, !noalias !69, !llvm.mem.parallel_loop_access !68
  %polly.indvar_next.3 = add nsw i64 %polly.indvar, 4
  %exitcond.3 = icmp eq i64 %polly.indvar_next.3, 1024
  br i1 %exitcond.3, label %for.body10.preheader, label %polly.stmt.for.body3, !llvm.loop !68

for.body10.preheader:                             ; preds = %polly.stmt.for.body3
  br label %for.body10

polly.loop_preheader:                             ; preds = %polly.loop_preheader.preheader, %for.inc22
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc22 ], [ 0, %polly.loop_preheader.preheader ]
  %scevgep = getelementptr [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @Y, i64 0, i64 0, i64 %indvars.iv7
  br label %polly.stmt.for.body3
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
!17 = distinct !{!17}
!18 = !{!13}
!19 = distinct !{!19, !20, !"polly.alias.scope.Y"}
!20 = distinct !{!20, !"polly.alias.scope.domain"}
!21 = !{!22}
!22 = distinct !{!22, !20, !"polly.alias.scope.call"}
!23 = distinct !{!23}
!24 = !{!19}
!25 = distinct !{!25, !26, !"polly.alias.scope.Y"}
!26 = distinct !{!26, !"polly.alias.scope.domain"}
!27 = !{!28}
!28 = distinct !{!28, !26, !"polly.alias.scope.call"}
!29 = distinct !{!29}
!30 = !{!25}
!31 = distinct !{!31, !32, !"polly.alias.scope.a"}
!32 = distinct !{!32, !"polly.alias.scope.domain"}
!33 = !{!34, !35, !36, !37}
!34 = distinct !{!34, !32, !"polly.alias.scope.sum.12"}
!35 = distinct !{!35, !32, !"polly.alias.scope.b"}
!36 = distinct !{!36, !32, !"polly.alias.scope.sum.03"}
!37 = distinct !{!37, !32, !"polly.alias.scope.add9.lcssa"}
!38 = !{!31, !34, !36, !37}
!39 = distinct !{!39, !40, !"polly.alias.scope.a"}
!40 = distinct !{!40, !"polly.alias.scope.domain"}
!41 = !{!42, !43, !44}
!42 = distinct !{!42, !40, !"polly.alias.scope.b"}
!43 = distinct !{!43, !40, !"polly.alias.scope.sum.03.phiops.0"}
!44 = distinct !{!44, !40, !"polly.alias.scope."}
!45 = !{!39, !43, !44}
!46 = distinct !{!46, !47, !"polly.alias.scope.X"}
!47 = distinct !{!47, !"polly.alias.scope.domain"}
!48 = !{!49}
!49 = distinct !{!49, !47, !"polly.alias.scope.Y"}
!50 = !{!46}
!51 = !{!52, !53, !"polly.alias.scope.a", !54}
!52 = distinct !{!52, !53, !"polly.alias.scope.a"}
!53 = distinct !{!53, !"polly.alias.scope.domain"}
!54 = distinct !{!54, !55, !"dot: %a"}
!55 = distinct !{!55, !"dot"}
!56 = !{!57, !58, !59, !60, !61}
!57 = distinct !{!57, !53, !"polly.alias.scope.sum.12"}
!58 = distinct !{!58, !53, !"polly.alias.scope.b"}
!59 = distinct !{!59, !53, !"polly.alias.scope.sum.03"}
!60 = distinct !{!60, !53, !"polly.alias.scope.add9.lcssa"}
!61 = distinct !{!61, !55, !"dot: %b"}
!62 = !{!58, !53, !"polly.alias.scope.b", !61}
!63 = !{!52, !57, !59, !60, !54}
!64 = distinct !{!64, !65, !"polly.alias.scope.Y"}
!65 = distinct !{!65, !"polly.alias.scope.domain"}
!66 = !{!67}
!67 = distinct !{!67, !65, !"polly.alias.scope.y_t"}
!68 = distinct !{!68}
!69 = !{!64}
