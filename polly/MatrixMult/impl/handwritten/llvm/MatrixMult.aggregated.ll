; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [32 x [32 x i64]] zeroinitializer, align 16
@B = common global [32 x [32 x i64]] zeroinitializer, align 16
@C = common global [32 x [32 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  br label %entry.split, !dbg !24

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !24
  br label %vector.ph, !dbg !27

vector.ph:                                        ; preds = %vector.body, %entry.split
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %vector.body ]
  br label %vector.body, !dbg !31

vector.body:                                      ; preds = %vector.ph
  %0 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 0, !dbg !36
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !38
  %2 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 0, !dbg !39
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !40
  %4 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 2, !dbg !36
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !38
  %6 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 2, !dbg !39
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !40
  %8 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 4, !dbg !36
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !38
  %10 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 4, !dbg !39
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !40
  %12 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 6, !dbg !36
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !38
  %14 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 6, !dbg !39
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !40
  %16 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 8, !dbg !36
  %17 = bitcast i64* %16 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %17, align 16, !dbg !38
  %18 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 8, !dbg !39
  %19 = bitcast i64* %18 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %19, align 16, !dbg !40
  %20 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 10, !dbg !36
  %21 = bitcast i64* %20 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %21, align 16, !dbg !38
  %22 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 10, !dbg !39
  %23 = bitcast i64* %22 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %23, align 16, !dbg !40
  %24 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 12, !dbg !36
  %25 = bitcast i64* %24 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %25, align 16, !dbg !38
  %26 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 12, !dbg !39
  %27 = bitcast i64* %26 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %27, align 16, !dbg !40
  %28 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 14, !dbg !36
  %29 = bitcast i64* %28 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %29, align 16, !dbg !38
  %30 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 14, !dbg !39
  %31 = bitcast i64* %30 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %31, align 16, !dbg !40
  %32 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 16, !dbg !36
  %33 = bitcast i64* %32 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %33, align 16, !dbg !38
  %34 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 16, !dbg !39
  %35 = bitcast i64* %34 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %35, align 16, !dbg !40
  %36 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 18, !dbg !36
  %37 = bitcast i64* %36 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %37, align 16, !dbg !38
  %38 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 18, !dbg !39
  %39 = bitcast i64* %38 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %39, align 16, !dbg !40
  %40 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 20, !dbg !36
  %41 = bitcast i64* %40 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %41, align 16, !dbg !38
  %42 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 20, !dbg !39
  %43 = bitcast i64* %42 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %43, align 16, !dbg !40
  %44 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 22, !dbg !36
  %45 = bitcast i64* %44 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %45, align 16, !dbg !38
  %46 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 22, !dbg !39
  %47 = bitcast i64* %46 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %47, align 16, !dbg !40
  %48 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 24, !dbg !36
  %49 = bitcast i64* %48 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %49, align 16, !dbg !38
  %50 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 24, !dbg !39
  %51 = bitcast i64* %50 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %51, align 16, !dbg !40
  %52 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 26, !dbg !36
  %53 = bitcast i64* %52 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %53, align 16, !dbg !38
  %54 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 26, !dbg !39
  %55 = bitcast i64* %54 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %55, align 16, !dbg !40
  %56 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 28, !dbg !36
  %57 = bitcast i64* %56 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %57, align 16, !dbg !38
  %58 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 28, !dbg !39
  %59 = bitcast i64* %58 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %59, align 16, !dbg !40
  %60 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 30, !dbg !36
  %61 = bitcast i64* %60 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %61, align 16, !dbg !38
  %62 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 30, !dbg !39
  %63 = bitcast i64* %62 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %63, align 16, !dbg !40
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !27
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 32, !dbg !27
  br i1 %exitcond5, label %for.end12, label %vector.ph, !dbg !27

for.end12:                                        ; preds = %vector.body
  ret void, !dbg !41
}

; Function Attrs: nounwind uwtable
define void @mat_mult() #1 !dbg !7 {
entry:
  %add.1.lcssa.phiops = alloca i64
  %add1.phiops = alloca i64
  br label %entry.split, !dbg !42

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !43, metadata !26), !dbg !42
  br label %polly.split_new_and_old, !dbg !44

polly.split_new_and_old:                          ; preds = %entry.split
  br i1 true, label %polly.start, label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %polly.split_new_and_old, %for.inc28
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc28 ], [ 0, %polly.split_new_and_old ]
  br label %for.body3, !dbg !48

for.body3:                                        ; preds = %for.inc25, %for.cond1.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next5, %for.inc25 ]
  %arrayidx5 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !53
  store i64 0, i64* %arrayidx5, align 8, !dbg !55
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !56, metadata !26), !dbg !57
  br label %for.body8, !dbg !58

for.body8:                                        ; preds = %for.body8, %for.body3
  %add1 = phi i64 [ 0, %for.body3 ], [ %add.1, %for.body8 ], !dbg !62
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next.1, %for.body8 ]
  %arrayidx16 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv7, i64 %indvars.iv, !dbg !63
  %0 = load i64, i64* %arrayidx16, align 16, !dbg !63
  %arrayidx20 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv4, !dbg !64
  %1 = load i64, i64* %arrayidx20, align 8, !dbg !64
  %mul = mul nsw i64 %1, %0, !dbg !65
  %add = add nsw i64 %mul, %add1, !dbg !66
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !58
  %arrayidx16.1 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv7, i64 %indvars.iv.next, !dbg !63
  %2 = load i64, i64* %arrayidx16.1, align 8, !dbg !63
  %arrayidx20.1 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv.next, i64 %indvars.iv4, !dbg !64
  %3 = load i64, i64* %arrayidx20.1, align 8, !dbg !64
  %mul.1 = mul nsw i64 %3, %2, !dbg !65
  %add.1 = add nsw i64 %mul.1, %add, !dbg !66
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !58
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 32, !dbg !58
  br i1 %exitcond.1, label %for.inc25, label %for.body8, !dbg !58

for.inc25:                                        ; preds = %for.body8
  %add.1.lcssa = phi i64 [ %add.1, %for.body8 ]
  store i64 %add.1.lcssa, i64* %arrayidx5, align 8, !dbg !67
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !48
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 32, !dbg !48
  br i1 %exitcond6, label %for.inc28, label %for.body3, !dbg !48

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !44
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 32, !dbg !44
  br i1 %exitcond9, label %polly.merge_new_and_old, label %for.cond1.preheader, !dbg !44

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.inc28
  br label %for.end30, !dbg !68

for.end30:                                        ; preds = %polly.merge_new_and_old
  ret void, !dbg !68

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit5
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit5, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit5 ]
  br label %polly.loop_preheader4

polly.loop_exit5:                                 ; preds = %polly.stmt.for.inc25
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, 30
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header3:                               ; preds = %polly.stmt.for.inc25, %polly.loop_preheader4
  %polly.indvar6 = phi i64 [ 0, %polly.loop_preheader4 ], [ %polly.indvar_next7, %polly.stmt.for.inc25 ]
  br label %polly.stmt.for.body3

polly.stmt.for.body3:                             ; preds = %polly.loop_header3
  %scevgep9 = getelementptr i64, i64* %scevgep, i64 %polly.indvar6
  store i64 0, i64* %scevgep9, align 8, !alias.scope !69, !noalias !71
  store i64 0, i64* %add1.phiops
  br label %polly.loop_preheader11

polly.loop_exit12:                                ; preds = %polly.stmt.for.body8
  br label %polly.stmt.for.inc25

polly.stmt.for.inc25:                             ; preds = %polly.loop_exit12
  %add.1.lcssa.phiops.reload = load i64, i64* %add.1.lcssa.phiops
  %scevgep28 = getelementptr i64, i64* %scevgep27, i64 %polly.indvar6
  store i64 %add.1.lcssa.phiops.reload, i64* %scevgep28, align 8, !alias.scope !69, !noalias !71
  %4 = add i64 %polly.indvar6, 1
  %p_exitcond6 = icmp eq i64 %4, 32, !dbg !48
  %polly.indvar_next7 = add nsw i64 %polly.indvar6, 1
  %polly.loop_cond8 = icmp sle i64 %polly.indvar6, 30
  br i1 %polly.loop_cond8, label %polly.loop_header3, label %polly.loop_exit5

polly.loop_preheader4:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %polly.indvar, i64 0
  %scevgep16 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %polly.indvar, i64 0
  %5 = shl i64 %polly.indvar, 5
  %scevgep21 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 1), i64 %5
  %scevgep27 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %polly.indvar, i64 0
  br label %polly.loop_header3

polly.loop_header10:                              ; preds = %polly.stmt.for.body8, %polly.loop_preheader11
  %polly.indvar13 = phi i64 [ 0, %polly.loop_preheader11 ], [ %polly.indvar_next14, %polly.stmt.for.body8 ]
  br label %polly.stmt.for.body8

polly.stmt.for.body8:                             ; preds = %polly.loop_header10
  %add1.phiops.reload = load i64, i64* %add1.phiops
  %6 = shl i64 %polly.indvar13, 1
  %scevgep17 = getelementptr i64, i64* %scevgep16, i64 %6
  %_p_scalar_ = load i64, i64* %scevgep17, align 16, !alias.scope !72, !noalias !76
  %7 = shl i64 %polly.indvar13, 6
  %scevgep19 = getelementptr i64, i64* %scevgep18, i64 %7
  %_p_scalar_20 = load i64, i64* %scevgep19, align 8, !alias.scope !73, !noalias !77
  %p_mul = mul nsw i64 %_p_scalar_20, %_p_scalar_, !dbg !65
  %p_add = add nsw i64 %p_mul, %add1.phiops.reload, !dbg !66
  %8 = shl i64 %polly.indvar13, 1
  %scevgep22 = getelementptr i64, i64* %scevgep21, i64 %8
  %_p_scalar_23 = load i64, i64* %scevgep22, align 8, !alias.scope !72, !noalias !76
  %9 = shl i64 %polly.indvar13, 6
  %scevgep25 = getelementptr i64, i64* %scevgep24, i64 %9
  %_p_scalar_26 = load i64, i64* %scevgep25, align 8, !alias.scope !73, !noalias !77
  %p_mul.1 = mul nsw i64 %_p_scalar_26, %_p_scalar_23, !dbg !65
  %p_add.1 = add nsw i64 %p_mul.1, %p_add, !dbg !66
  %10 = shl i64 %polly.indvar13, 1
  %11 = add i64 %10, 2
  %p_exitcond.1 = icmp eq i64 %11, 32, !dbg !58
  store i64 %p_add.1, i64* %add1.phiops
  store i64 %p_add.1, i64* %add.1.lcssa.phiops
  %polly.indvar_next14 = add nsw i64 %polly.indvar13, 1
  %polly.loop_cond15 = icmp sle i64 %polly.indvar13, 14
  br i1 %polly.loop_cond15, label %polly.loop_header10, label %polly.loop_exit12

polly.loop_preheader11:                           ; preds = %polly.stmt.for.body3
  %scevgep18 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 %polly.indvar6
  %scevgep24 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 1, i64 0), i64 %polly.indvar6
  br label %polly.loop_header10
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !78

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !79, metadata !26), !dbg !78
  br label %for.cond1.preheader, !dbg !80

for.cond1.preheader:                              ; preds = %for.end, %entry.split
  %indvars.iv6 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !84
  br label %for.body3, !dbg !89

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %3, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !91
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !91
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4, !dbg !92
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !89
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !84
  %exitcond = icmp eq i64 %indvars.iv.next, 32, !dbg !89
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !89

for.end:                                          ; preds = %for.body3
  %.lcssa = phi %struct._IO_FILE* [ %3, %for.body3 ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !93
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !80
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 32, !dbg !80
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !80

for.end11:                                        ; preds = %for.end
  ret void, !dbg !94
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #1 !dbg !9 {
entry:
  %add.i.1.lcssa.phiops = alloca i64
  %add1.i.phiops = alloca i64
  br label %entry.split, !dbg !95

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !96, metadata !26), !dbg !95
  br label %polly.split_new_and_old, !dbg !97

polly.split_new_and_old:                          ; preds = %entry.split
  br i1 true, label %polly.start, label %for.body

for.body:                                         ; preds = %polly.split_new_and_old, %mat_mult.exit
  %r.01 = phi i32 [ %inc, %mat_mult.exit ], [ 0, %polly.split_new_and_old ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !101
  br label %vector.ph, !dbg !104

vector.ph:                                        ; preds = %vector.body, %for.body
  %indvars.iv3.i = phi i64 [ 0, %for.body ], [ %indvars.iv.next4.i, %vector.body ], !dbg !105
  br label %vector.body, !dbg !106

vector.body:                                      ; preds = %vector.ph
  %0 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 0, !dbg !107
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !108
  %2 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 0, !dbg !109
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !110
  %4 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 2, !dbg !107
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !108
  %6 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 2, !dbg !109
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !110
  %8 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 4, !dbg !107
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !108
  %10 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 4, !dbg !109
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !110
  %12 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 6, !dbg !107
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !108
  %14 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 6, !dbg !109
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !110
  %16 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 8, !dbg !107
  %17 = bitcast i64* %16 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %17, align 16, !dbg !108
  %18 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 8, !dbg !109
  %19 = bitcast i64* %18 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %19, align 16, !dbg !110
  %20 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 10, !dbg !107
  %21 = bitcast i64* %20 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %21, align 16, !dbg !108
  %22 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 10, !dbg !109
  %23 = bitcast i64* %22 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %23, align 16, !dbg !110
  %24 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 12, !dbg !107
  %25 = bitcast i64* %24 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %25, align 16, !dbg !108
  %26 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 12, !dbg !109
  %27 = bitcast i64* %26 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %27, align 16, !dbg !110
  %28 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 14, !dbg !107
  %29 = bitcast i64* %28 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %29, align 16, !dbg !108
  %30 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 14, !dbg !109
  %31 = bitcast i64* %30 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %31, align 16, !dbg !110
  %32 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 16, !dbg !107
  %33 = bitcast i64* %32 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %33, align 16, !dbg !108
  %34 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 16, !dbg !109
  %35 = bitcast i64* %34 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %35, align 16, !dbg !110
  %36 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 18, !dbg !107
  %37 = bitcast i64* %36 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %37, align 16, !dbg !108
  %38 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 18, !dbg !109
  %39 = bitcast i64* %38 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %39, align 16, !dbg !110
  %40 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 20, !dbg !107
  %41 = bitcast i64* %40 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %41, align 16, !dbg !108
  %42 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 20, !dbg !109
  %43 = bitcast i64* %42 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %43, align 16, !dbg !110
  %44 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 22, !dbg !107
  %45 = bitcast i64* %44 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %45, align 16, !dbg !108
  %46 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 22, !dbg !109
  %47 = bitcast i64* %46 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %47, align 16, !dbg !110
  %48 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 24, !dbg !107
  %49 = bitcast i64* %48 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %49, align 16, !dbg !108
  %50 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 24, !dbg !109
  %51 = bitcast i64* %50 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %51, align 16, !dbg !110
  %52 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 26, !dbg !107
  %53 = bitcast i64* %52 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %53, align 16, !dbg !108
  %54 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 26, !dbg !109
  %55 = bitcast i64* %54 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %55, align 16, !dbg !110
  %56 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 28, !dbg !107
  %57 = bitcast i64* %56 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %57, align 16, !dbg !108
  %58 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 28, !dbg !109
  %59 = bitcast i64* %58 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %59, align 16, !dbg !110
  %60 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 30, !dbg !107
  %61 = bitcast i64* %60 to <2 x i64>*, !dbg !108
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %61, align 16, !dbg !108
  %62 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 30, !dbg !109
  %63 = bitcast i64* %62 to <2 x i64>*, !dbg !110
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %63, align 16, !dbg !110
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !104
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 32, !dbg !104
  br i1 %exitcond5.i, label %for.cond1.preheader.i1.preheader, label %vector.ph, !dbg !104

for.cond1.preheader.i1.preheader:                 ; preds = %vector.body
  br label %for.cond1.preheader.i1, !dbg !111

for.cond1.preheader.i1:                           ; preds = %for.cond1.preheader.i1.preheader, %for.inc28.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc28.i ], [ 0, %for.cond1.preheader.i1.preheader ], !dbg !113
  br label %for.body3.i3, !dbg !111

for.body3.i3:                                     ; preds = %for.inc25.i, %for.cond1.preheader.i1
  %indvars.iv4.i = phi i64 [ 0, %for.cond1.preheader.i1 ], [ %indvars.iv.next5.i, %for.inc25.i ], !dbg !113
  %arrayidx5.i2 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %indvars.iv7.i, i64 %indvars.iv4.i, !dbg !114
  store i64 0, i64* %arrayidx5.i2, align 8, !dbg !115
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !56, metadata !26), !dbg !116
  br label %for.body8.i, !dbg !117

for.body8.i:                                      ; preds = %for.body8.i, %for.body3.i3
  %add1.i = phi i64 [ 0, %for.body3.i3 ], [ %add.i.1, %for.body8.i ], !dbg !118
  %indvars.iv.i4 = phi i64 [ 0, %for.body3.i3 ], [ %indvars.iv.next.i5.1, %for.body8.i ], !dbg !113
  %arrayidx16.i = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv7.i, i64 %indvars.iv.i4, !dbg !119
  %64 = load i64, i64* %arrayidx16.i, align 16, !dbg !119
  %arrayidx20.i = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv.i4, i64 %indvars.iv4.i, !dbg !120
  %65 = load i64, i64* %arrayidx20.i, align 8, !dbg !120
  %mul.i = mul nsw i64 %65, %64, !dbg !121
  %add.i = add nsw i64 %mul.i, %add1.i, !dbg !122
  %indvars.iv.next.i5 = or i64 %indvars.iv.i4, 1, !dbg !117
  %arrayidx16.i.1 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv7.i, i64 %indvars.iv.next.i5, !dbg !119
  %66 = load i64, i64* %arrayidx16.i.1, align 8, !dbg !119
  %arrayidx20.i.1 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv.next.i5, i64 %indvars.iv4.i, !dbg !120
  %67 = load i64, i64* %arrayidx20.i.1, align 8, !dbg !120
  %mul.i.1 = mul nsw i64 %67, %66, !dbg !121
  %add.i.1 = add nsw i64 %mul.i.1, %add.i, !dbg !122
  %indvars.iv.next.i5.1 = add nsw i64 %indvars.iv.i4, 2, !dbg !117
  %exitcond.i6.1 = icmp eq i64 %indvars.iv.next.i5.1, 32, !dbg !117
  br i1 %exitcond.i6.1, label %for.inc25.i, label %for.body8.i, !dbg !117

for.inc25.i:                                      ; preds = %for.body8.i
  %add.i.1.lcssa = phi i64 [ %add.i.1, %for.body8.i ]
  store i64 %add.i.1.lcssa, i64* %arrayidx5.i2, align 8, !dbg !123
  %indvars.iv.next5.i = add nuw nsw i64 %indvars.iv4.i, 1, !dbg !111
  %exitcond6.i = icmp eq i64 %indvars.iv.next5.i, 32, !dbg !111
  br i1 %exitcond6.i, label %for.inc28.i, label %for.body3.i3, !dbg !111

for.inc28.i:                                      ; preds = %for.inc25.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !124
  %exitcond9.i = icmp eq i64 %indvars.iv.next8.i, 32, !dbg !124
  br i1 %exitcond9.i, label %mat_mult.exit, label %for.cond1.preheader.i1, !dbg !124

mat_mult.exit:                                    ; preds = %for.inc28.i
  %inc = add nuw nsw i32 %r.01, 1, !dbg !125
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !96, metadata !26), !dbg !95
  %exitcond = icmp eq i32 %inc, 10000, !dbg !97
  br i1 %exitcond, label %polly.merge_new_and_old, label %for.body, !dbg !97

polly.merge_new_and_old:                          ; preds = %polly.exiting, %mat_mult.exit
  br label %for.end, !dbg !127

for.end:                                          ; preds = %polly.merge_new_and_old
  %68 = load i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 31, i64 31), align 8, !dbg !127
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 32, i32 32, i64 %68) #4, !dbg !128
  ret i32 0, !dbg !129

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit79
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit79, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit79 ]
  br label %polly.loop_preheader9

polly.loop_exit10:                                ; preds = %polly.stmt.vector.body
  br label %polly.loop_preheader78

polly.loop_exit79:                                ; preds = %polly.loop_exit85
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, 9998
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header8:                               ; preds = %polly.stmt.vector.body, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.stmt.vector.body ]
  br label %polly.stmt.vector.body

polly.stmt.vector.body:                           ; preds = %polly.loop_header8
  %scevgep = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %polly.indvar11, i64 0
  %scevgep14 = bitcast i64* %scevgep to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep14, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep15 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %polly.indvar11, i64 0
  %scevgep1516 = bitcast i64* %scevgep15 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep1516, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %69 = shl i64 %polly.indvar11, 5
  %scevgep17 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 2), i64 %69
  %scevgep1718 = bitcast i64* %scevgep17 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep1718, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep19 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 2), i64 %69
  %scevgep1920 = bitcast i64* %scevgep19 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep1920, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %70 = shl i64 %polly.indvar11, 5
  %scevgep21 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 4), i64 %70
  %scevgep2122 = bitcast i64* %scevgep21 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep2122, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep23 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 4), i64 %70
  %scevgep2324 = bitcast i64* %scevgep23 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep2324, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %71 = shl i64 %polly.indvar11, 5
  %scevgep25 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 6), i64 %71
  %scevgep2526 = bitcast i64* %scevgep25 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep2526, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep27 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 6), i64 %71
  %scevgep2728 = bitcast i64* %scevgep27 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep2728, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %72 = shl i64 %polly.indvar11, 5
  %scevgep29 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 8), i64 %72
  %scevgep2930 = bitcast i64* %scevgep29 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep2930, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep31 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 8), i64 %72
  %scevgep3132 = bitcast i64* %scevgep31 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep3132, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %73 = shl i64 %polly.indvar11, 5
  %scevgep33 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 10), i64 %73
  %scevgep3334 = bitcast i64* %scevgep33 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep3334, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep35 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 10), i64 %73
  %scevgep3536 = bitcast i64* %scevgep35 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep3536, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %74 = shl i64 %polly.indvar11, 5
  %scevgep37 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 12), i64 %74
  %scevgep3738 = bitcast i64* %scevgep37 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep3738, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep39 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 12), i64 %74
  %scevgep3940 = bitcast i64* %scevgep39 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep3940, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %75 = shl i64 %polly.indvar11, 5
  %scevgep41 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 14), i64 %75
  %scevgep4142 = bitcast i64* %scevgep41 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep4142, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep43 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 14), i64 %75
  %scevgep4344 = bitcast i64* %scevgep43 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep4344, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %76 = shl i64 %polly.indvar11, 5
  %scevgep45 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 16), i64 %76
  %scevgep4546 = bitcast i64* %scevgep45 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep4546, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep47 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 16), i64 %76
  %scevgep4748 = bitcast i64* %scevgep47 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep4748, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %77 = shl i64 %polly.indvar11, 5
  %scevgep49 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 18), i64 %77
  %scevgep4950 = bitcast i64* %scevgep49 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep4950, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep51 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 18), i64 %77
  %scevgep5152 = bitcast i64* %scevgep51 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep5152, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %78 = shl i64 %polly.indvar11, 5
  %scevgep53 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 20), i64 %78
  %scevgep5354 = bitcast i64* %scevgep53 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep5354, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep55 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 20), i64 %78
  %scevgep5556 = bitcast i64* %scevgep55 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep5556, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %79 = shl i64 %polly.indvar11, 5
  %scevgep57 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 22), i64 %79
  %scevgep5758 = bitcast i64* %scevgep57 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep5758, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep59 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 22), i64 %79
  %scevgep5960 = bitcast i64* %scevgep59 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep5960, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %80 = shl i64 %polly.indvar11, 5
  %scevgep61 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 24), i64 %80
  %scevgep6162 = bitcast i64* %scevgep61 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep6162, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep63 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 24), i64 %80
  %scevgep6364 = bitcast i64* %scevgep63 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep6364, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %81 = shl i64 %polly.indvar11, 5
  %scevgep65 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 26), i64 %81
  %scevgep6566 = bitcast i64* %scevgep65 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep6566, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep67 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 26), i64 %81
  %scevgep6768 = bitcast i64* %scevgep67 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep6768, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %82 = shl i64 %polly.indvar11, 5
  %scevgep69 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 28), i64 %82
  %scevgep6970 = bitcast i64* %scevgep69 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep6970, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep71 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 28), i64 %82
  %scevgep7172 = bitcast i64* %scevgep71 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep7172, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %83 = shl i64 %polly.indvar11, 5
  %scevgep73 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 30), i64 %83
  %scevgep7374 = bitcast i64* %scevgep73 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep7374, align 16, !alias.scope !130, !noalias !132, !llvm.mem.parallel_loop_access !137
  %scevgep75 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 30), i64 %83
  %scevgep7576 = bitcast i64* %scevgep75 to <2 x i64>*
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %scevgep7576, align 16, !alias.scope !133, !noalias !138, !llvm.mem.parallel_loop_access !137
  %84 = add i64 %polly.indvar11, 1
  %p_exitcond5.i = icmp eq i64 %84, 32, !dbg !104
  %polly.indvar_next12 = add nsw i64 %polly.indvar11, 1
  %polly.loop_cond13 = icmp sle i64 %polly.indvar11, 30
  br i1 %polly.loop_cond13, label %polly.loop_header8, label %polly.loop_exit10, !llvm.loop !137

polly.loop_preheader9:                            ; preds = %polly.loop_header
  br label %polly.loop_header8

polly.loop_header77:                              ; preds = %polly.loop_exit85, %polly.loop_preheader78
  %polly.indvar80 = phi i64 [ 0, %polly.loop_preheader78 ], [ %polly.indvar_next81, %polly.loop_exit85 ]
  br label %polly.loop_preheader84

polly.loop_exit85:                                ; preds = %polly.stmt.for.inc25.i
  %polly.indvar_next81 = add nsw i64 %polly.indvar80, 1
  %polly.loop_cond82 = icmp sle i64 %polly.indvar80, 30
  br i1 %polly.loop_cond82, label %polly.loop_header77, label %polly.loop_exit79

polly.loop_preheader78:                           ; preds = %polly.loop_exit10
  br label %polly.loop_header77

polly.loop_header83:                              ; preds = %polly.stmt.for.inc25.i, %polly.loop_preheader84
  %polly.indvar86 = phi i64 [ 0, %polly.loop_preheader84 ], [ %polly.indvar_next87, %polly.stmt.for.inc25.i ]
  br label %polly.stmt.for.body3.i3

polly.stmt.for.body3.i3:                          ; preds = %polly.loop_header83
  %scevgep90 = getelementptr i64, i64* %scevgep89, i64 %polly.indvar86
  store i64 0, i64* %scevgep90, align 8, !alias.scope !134, !noalias !139
  store i64 0, i64* %add1.i.phiops
  br label %polly.loop_preheader92

polly.loop_exit93:                                ; preds = %polly.stmt.for.body8.i
  br label %polly.stmt.for.inc25.i

polly.stmt.for.inc25.i:                           ; preds = %polly.loop_exit93
  %add.i.1.lcssa.phiops.reload = load i64, i64* %add.i.1.lcssa.phiops
  %scevgep109 = getelementptr i64, i64* %scevgep108, i64 %polly.indvar86
  store i64 %add.i.1.lcssa.phiops.reload, i64* %scevgep109, align 8, !alias.scope !134, !noalias !139
  %85 = add i64 %polly.indvar86, 1
  %p_exitcond6.i = icmp eq i64 %85, 32, !dbg !111
  %polly.indvar_next87 = add nsw i64 %polly.indvar86, 1
  %polly.loop_cond88 = icmp sle i64 %polly.indvar86, 30
  br i1 %polly.loop_cond88, label %polly.loop_header83, label %polly.loop_exit85

polly.loop_preheader84:                           ; preds = %polly.loop_header77
  %scevgep89 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %polly.indvar80, i64 0
  %scevgep97 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %polly.indvar80, i64 0
  %86 = shl i64 %polly.indvar80, 5
  %scevgep102 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 0, i64 1), i64 %86
  %scevgep108 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %polly.indvar80, i64 0
  br label %polly.loop_header83

polly.loop_header91:                              ; preds = %polly.stmt.for.body8.i, %polly.loop_preheader92
  %polly.indvar94 = phi i64 [ 0, %polly.loop_preheader92 ], [ %polly.indvar_next95, %polly.stmt.for.body8.i ]
  br label %polly.stmt.for.body8.i

polly.stmt.for.body8.i:                           ; preds = %polly.loop_header91
  %add1.i.phiops.reload = load i64, i64* %add1.i.phiops
  %87 = shl i64 %polly.indvar94, 1
  %scevgep98 = getelementptr i64, i64* %scevgep97, i64 %87
  %_p_scalar_ = load i64, i64* %scevgep98, align 16, !alias.scope !130, !noalias !132
  %88 = shl i64 %polly.indvar94, 6
  %scevgep100 = getelementptr i64, i64* %scevgep99, i64 %88
  %_p_scalar_101 = load i64, i64* %scevgep100, align 8, !alias.scope !133, !noalias !138
  %p_mul.i = mul nsw i64 %_p_scalar_101, %_p_scalar_, !dbg !121
  %p_add.i = add nsw i64 %p_mul.i, %add1.i.phiops.reload, !dbg !122
  %89 = shl i64 %polly.indvar94, 1
  %scevgep103 = getelementptr i64, i64* %scevgep102, i64 %89
  %_p_scalar_104 = load i64, i64* %scevgep103, align 8, !alias.scope !130, !noalias !132
  %90 = shl i64 %polly.indvar94, 6
  %scevgep106 = getelementptr i64, i64* %scevgep105, i64 %90
  %_p_scalar_107 = load i64, i64* %scevgep106, align 8, !alias.scope !133, !noalias !138
  %p_mul.i.1 = mul nsw i64 %_p_scalar_107, %_p_scalar_104, !dbg !121
  %p_add.i.1 = add nsw i64 %p_mul.i.1, %p_add.i, !dbg !122
  %91 = shl i64 %polly.indvar94, 1
  %92 = add i64 %91, 2
  %p_exitcond.i6.1 = icmp eq i64 %92, 32, !dbg !117
  store i64 %p_add.i.1, i64* %add1.i.phiops
  store i64 %p_add.i.1, i64* %add.i.1.lcssa.phiops
  %polly.indvar_next95 = add nsw i64 %polly.indvar94, 1
  %polly.loop_cond96 = icmp sle i64 %polly.indvar94, 14
  br i1 %polly.loop_cond96, label %polly.loop_header91, label %polly.loop_exit93

polly.loop_preheader92:                           ; preds = %polly.stmt.for.body3.i3
  %scevgep99 = getelementptr [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 0, i64 %polly.indvar86
  %scevgep105 = getelementptr i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 1, i64 0), i64 %polly.indvar86
  br label %polly.loop_header91
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
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8, !9}
!4 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 7, type: !5, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 19, type: !5, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 31, type: !5, isLocal: false, isDefinition: true, scopeLine: 32, isOptimized: false, variables: !2)
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 44, type: !10, isLocal: false, isDefinition: true, scopeLine: 45, isOptimized: false, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !{!14, !19, !20}
!14 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !15, isLocal: false, isDefinition: true, variable: [32 x [32 x i64]]* @A)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 65536, align: 64, elements: !17)
!16 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!17 = !{!18, !18}
!18 = !DISubrange(count: 32)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !15, isLocal: false, isDefinition: true, variable: [32 x [32 x i64]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !15, isLocal: false, isDefinition: true, variable: [32 x [32 x i64]]* @C)
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
!41 = !DILocation(line: 17, column: 1, scope: !4)
!42 = !DILocation(line: 20, column: 9, scope: !7)
!43 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 20, type: !12)
!44 = !DILocation(line: 21, column: 5, scope: !45)
!45 = !DILexicalBlockFile(scope: !46, file: !1, discriminator: 1)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 21, column: 5)
!47 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!48 = !DILocation(line: 22, column: 9, scope: !49)
!49 = !DILexicalBlockFile(scope: !50, file: !1, discriminator: 1)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 22, column: 9)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 22, column: 9)
!52 = distinct !DILexicalBlock(scope: !46, file: !1, line: 21, column: 25)
!53 = !DILocation(line: 23, column: 13, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 22, column: 29)
!55 = !DILocation(line: 23, column: 21, scope: !54)
!56 = !DILocalVariable(name: "k", scope: !7, file: !1, line: 20, type: !12)
!57 = !DILocation(line: 20, column: 15, scope: !7)
!58 = !DILocation(line: 24, column: 13, scope: !59)
!59 = !DILexicalBlockFile(scope: !60, file: !1, discriminator: 1)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 24, column: 13)
!61 = distinct !DILexicalBlock(scope: !54, file: !1, line: 24, column: 13)
!62 = !DILocation(line: 25, column: 27, scope: !60)
!63 = !DILocation(line: 25, column: 37, scope: !60)
!64 = !DILocation(line: 25, column: 47, scope: !60)
!65 = !DILocation(line: 25, column: 45, scope: !60)
!66 = !DILocation(line: 25, column: 35, scope: !60)
!67 = !DILocation(line: 25, column: 25, scope: !60)
!68 = !DILocation(line: 29, column: 1, scope: !7)
!69 = distinct !{!69, !70, !"polly.alias.scope.C"}
!70 = distinct !{!70, !"polly.alias.scope.domain"}
!71 = !{!72, !73, !74, !75}
!72 = distinct !{!72, !70, !"polly.alias.scope.A"}
!73 = distinct !{!73, !70, !"polly.alias.scope.B"}
!74 = distinct !{!74, !70, !"polly.alias.scope.add.1.lcssa"}
!75 = distinct !{!75, !70, !"polly.alias.scope.add1"}
!76 = !{!73, !69, !74, !75}
!77 = !{!72, !69, !74, !75}
!78 = !DILocation(line: 33, column: 9, scope: !8)
!79 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 33, type: !12)
!80 = !DILocation(line: 35, column: 5, scope: !81)
!81 = !DILexicalBlockFile(scope: !82, file: !1, discriminator: 1)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 35, column: 5)
!83 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 5)
!84 = !DILocation(line: 37, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !86, file: !1, line: 36, column: 29)
!86 = distinct !DILexicalBlock(scope: !87, file: !1, line: 36, column: 9)
!87 = distinct !DILexicalBlock(scope: !88, file: !1, line: 36, column: 9)
!88 = distinct !DILexicalBlock(scope: !82, file: !1, line: 35, column: 25)
!89 = !DILocation(line: 36, column: 9, scope: !90)
!90 = !DILexicalBlockFile(scope: !86, file: !1, discriminator: 1)
!91 = !DILocation(line: 37, column: 38, scope: !85)
!92 = !DILocation(line: 37, column: 13, scope: !85)
!93 = !DILocation(line: 40, column: 9, scope: !88)
!94 = !DILocation(line: 42, column: 1, scope: !8)
!95 = !DILocation(line: 49, column: 9, scope: !9)
!96 = !DILocalVariable(name: "r", scope: !9, file: !1, line: 49, type: !12)
!97 = !DILocation(line: 50, column: 5, scope: !98)
!98 = !DILexicalBlockFile(scope: !99, file: !1, discriminator: 1)
!99 = distinct !DILexicalBlock(scope: !100, file: !1, line: 50, column: 5)
!100 = distinct !DILexicalBlock(scope: !9, file: !1, line: 50, column: 5)
!101 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !102)
!102 = distinct !DILocation(line: 51, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !1, line: 50, column: 25)
!104 = !DILocation(line: 11, column: 5, scope: !28, inlinedAt: !102)
!105 = !DILocation(line: 51, column: 9, scope: !103)
!106 = !DILocation(line: 12, column: 9, scope: !32, inlinedAt: !102)
!107 = !DILocation(line: 13, column: 13, scope: !37, inlinedAt: !102)
!108 = !DILocation(line: 13, column: 21, scope: !37, inlinedAt: !102)
!109 = !DILocation(line: 14, column: 13, scope: !37, inlinedAt: !102)
!110 = !DILocation(line: 14, column: 21, scope: !37, inlinedAt: !102)
!111 = !DILocation(line: 22, column: 9, scope: !49, inlinedAt: !112)
!112 = distinct !DILocation(line: 52, column: 9, scope: !103)
!113 = !DILocation(line: 52, column: 9, scope: !103)
!114 = !DILocation(line: 23, column: 13, scope: !54, inlinedAt: !112)
!115 = !DILocation(line: 23, column: 21, scope: !54, inlinedAt: !112)
!116 = !DILocation(line: 20, column: 15, scope: !7, inlinedAt: !112)
!117 = !DILocation(line: 24, column: 13, scope: !59, inlinedAt: !112)
!118 = !DILocation(line: 25, column: 27, scope: !60, inlinedAt: !112)
!119 = !DILocation(line: 25, column: 37, scope: !60, inlinedAt: !112)
!120 = !DILocation(line: 25, column: 47, scope: !60, inlinedAt: !112)
!121 = !DILocation(line: 25, column: 45, scope: !60, inlinedAt: !112)
!122 = !DILocation(line: 25, column: 35, scope: !60, inlinedAt: !112)
!123 = !DILocation(line: 25, column: 25, scope: !60, inlinedAt: !112)
!124 = !DILocation(line: 21, column: 5, scope: !45, inlinedAt: !112)
!125 = !DILocation(line: 50, column: 22, scope: !126)
!126 = !DILexicalBlockFile(scope: !99, file: !1, discriminator: 2)
!127 = !DILocation(line: 55, column: 71, scope: !9)
!128 = !DILocation(line: 55, column: 5, scope: !9)
!129 = !DILocation(line: 56, column: 5, scope: !9)
!130 = distinct !{!130, !131, !"polly.alias.scope.A"}
!131 = distinct !{!131, !"polly.alias.scope.domain"}
!132 = !{!133, !134, !135, !136}
!133 = distinct !{!133, !131, !"polly.alias.scope.B"}
!134 = distinct !{!134, !131, !"polly.alias.scope.C"}
!135 = distinct !{!135, !131, !"polly.alias.scope.add.i.1.lcssa"}
!136 = distinct !{!136, !131, !"polly.alias.scope.add1.i"}
!137 = distinct !{!137}
!138 = !{!130, !134, !135, !136}
!139 = !{!130, !133, !135, !136}
