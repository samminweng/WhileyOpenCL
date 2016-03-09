; ModuleID = 'MatrixMult.none.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [512 x [512 x i64]] zeroinitializer, align 16
@B = common global [512 x [512 x i64]] zeroinitializer, align 16
@C = common global [512 x [512 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !25), !dbg !26
  br label %vector.ph, !dbg !27

vector.ph:                                        ; preds = %for.inc10, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc10 ]
  br label %vector.body, !dbg !31

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !31
  %0 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index, !dbg !36
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !38
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !38
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !38
  %4 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index, !dbg !39
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !40
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !40
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !40
  %index.next = or i64 %index, 4, !dbg !31
  %8 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !36
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !38
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !38
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !38
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !38
  %12 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %index.next, !dbg !39
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !40
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !40
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !40
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !40
  %index.next.1 = add nsw i64 %index, 8, !dbg !31
  %16 = icmp eq i64 %index.next.1, 512, !dbg !31
  br i1 %16, label %for.inc10, label %vector.body, !dbg !31, !llvm.loop !41

for.inc10:                                        ; preds = %vector.body
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !27
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 512, !dbg !27
  br i1 %exitcond5, label %for.end12, label %vector.ph, !dbg !27

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !44
}

; Function Attrs: nounwind uwtable
define void @mat_mult() #1 !dbg !7 {
entry:
  %add.1.lcssa.phiops = alloca i64
  %add1.phiops = alloca i64
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !45, metadata !25), !dbg !46
  br label %polly.split_new_and_old, !dbg !47

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %polly.split_new_and_old, %for.inc28
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc28 ], [ 0, %polly.split_new_and_old ]
  br label %for.body3, !dbg !51

for.body3:                                        ; preds = %for.inc25, %for.cond1.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next5, %for.inc25 ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !56
  store i64 0, i64* %arrayidx5, align 8, !dbg !58
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !59, metadata !25), !dbg !60
  br label %for.body8, !dbg !61

for.body8:                                        ; preds = %for.body8, %for.body3
  %add1 = phi i64 [ 0, %for.body3 ], [ %add.1, %for.body8 ], !dbg !65
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next.1, %for.body8 ]
  %arrayidx16 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv7, i64 %indvars.iv, !dbg !66
  %0 = load i64, i64* %arrayidx16, align 16, !dbg !66
  %arrayidx20 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv4, !dbg !67
  %1 = load i64, i64* %arrayidx20, align 8, !dbg !67
  %mul = mul nsw i64 %1, %0, !dbg !68
  %add = add nsw i64 %mul, %add1, !dbg !69
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !61
  %arrayidx16.1 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv7, i64 %indvars.iv.next, !dbg !66
  %2 = load i64, i64* %arrayidx16.1, align 8, !dbg !66
  %arrayidx20.1 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv.next, i64 %indvars.iv4, !dbg !67
  %3 = load i64, i64* %arrayidx20.1, align 8, !dbg !67
  %mul.1 = mul nsw i64 %3, %2, !dbg !68
  %add.1 = add nsw i64 %mul.1, %add, !dbg !69
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !61
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 512, !dbg !61
  br i1 %exitcond.1, label %for.inc25, label %for.body8, !dbg !61

for.inc25:                                        ; preds = %for.body8
  %add.1.lcssa = phi i64 [ %add.1, %for.body8 ]
  store i64 %add.1.lcssa, i64* %arrayidx5, align 8, !dbg !70
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !51
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 512, !dbg !51
  br i1 %exitcond6, label %for.inc28, label %for.body3, !dbg !51

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !47
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 512, !dbg !47
  br i1 %exitcond9, label %polly.merge_new_and_old, label %for.cond1.preheader, !dbg !47

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.inc28
  br label %for.end30, !dbg !71

for.end30:                                        ; preds = %polly.merge_new_and_old
  ret void, !dbg !71

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit3
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit3, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit3 ]
  br label %polly.loop_preheader2

polly.loop_exit3:                                 ; preds = %polly.stmt.for.inc25
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, 510
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header1:                               ; preds = %polly.stmt.for.inc25, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.stmt.for.inc25 ]
  br label %polly.stmt.for.body3

polly.stmt.for.body3:                             ; preds = %polly.loop_header1
  %scevgep7 = getelementptr i64, i64* %scevgep, i64 %polly.indvar4
  store i64 0, i64* %scevgep7, align 8, !alias.scope !72, !noalias !74
  store i64 0, i64* %add1.phiops
  br label %polly.loop_preheader9

polly.loop_exit10:                                ; preds = %polly.stmt.for.body8
  br label %polly.stmt.for.inc25

polly.stmt.for.inc25:                             ; preds = %polly.loop_exit10
  %add.1.lcssa.phiops.reload = load i64, i64* %add.1.lcssa.phiops
  %scevgep26 = getelementptr i64, i64* %scevgep25, i64 %polly.indvar4
  store i64 %add.1.lcssa.phiops.reload, i64* %scevgep26, align 8, !alias.scope !72, !noalias !74
  %4 = add i64 %polly.indvar4, 1
  %p_exitcond6 = icmp eq i64 %4, 512, !dbg !51
  %polly.indvar_next5 = add nsw i64 %polly.indvar4, 1
  %polly.loop_cond6 = icmp sle i64 %polly.indvar4, 510
  br i1 %polly.loop_cond6, label %polly.loop_header1, label %polly.loop_exit3

polly.loop_preheader2:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %polly.indvar, i64 0
  %scevgep14 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %polly.indvar, i64 0
  %5 = shl i64 %polly.indvar, 9
  %scevgep19 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 0, i64 1), i64 %5
  %scevgep25 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %polly.indvar, i64 0
  br label %polly.loop_header1

polly.loop_header8:                               ; preds = %polly.stmt.for.body8, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.stmt.for.body8 ]
  br label %polly.stmt.for.body8

polly.stmt.for.body8:                             ; preds = %polly.loop_header8
  %add1.phiops.reload = load i64, i64* %add1.phiops
  %6 = shl i64 %polly.indvar11, 1
  %scevgep15 = getelementptr i64, i64* %scevgep14, i64 %6
  %_p_scalar_ = load i64, i64* %scevgep15, align 16, !alias.scope !77, !noalias !79
  %7 = shl i64 %polly.indvar11, 10
  %scevgep17 = getelementptr i64, i64* %scevgep16, i64 %7
  %_p_scalar_18 = load i64, i64* %scevgep17, align 8, !alias.scope !78, !noalias !80
  %p_mul = mul nsw i64 %_p_scalar_18, %_p_scalar_, !dbg !68
  %p_add = add nsw i64 %p_mul, %add1.phiops.reload, !dbg !69
  %8 = shl i64 %polly.indvar11, 1
  %scevgep20 = getelementptr i64, i64* %scevgep19, i64 %8
  %_p_scalar_21 = load i64, i64* %scevgep20, align 8, !alias.scope !77, !noalias !79
  %9 = shl i64 %polly.indvar11, 10
  %scevgep23 = getelementptr i64, i64* %scevgep22, i64 %9
  %_p_scalar_24 = load i64, i64* %scevgep23, align 8, !alias.scope !78, !noalias !80
  %p_mul.1 = mul nsw i64 %_p_scalar_24, %_p_scalar_21, !dbg !68
  %p_add.1 = add nsw i64 %p_mul.1, %p_add, !dbg !69
  %10 = shl i64 %polly.indvar11, 1
  %11 = add i64 %10, 2
  %p_exitcond.1 = icmp eq i64 %11, 512, !dbg !61
  store i64 %p_add.1, i64* %add1.phiops
  store i64 %p_add.1, i64* %add.1.lcssa.phiops
  %polly.indvar_next12 = add nsw i64 %polly.indvar11, 1
  %polly.loop_cond13 = icmp sle i64 %polly.indvar11, 254
  br i1 %polly.loop_cond13, label %polly.loop_header8, label %polly.loop_exit10

polly.loop_preheader9:                            ; preds = %polly.stmt.for.body3
  %scevgep16 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 0, i64 %polly.indvar4
  %scevgep22 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 1, i64 0), i64 %polly.indvar4
  br label %polly.loop_header8
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !81, metadata !25), !dbg !82
  br label %for.cond1.preheader, !dbg !83

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !87
  br label %for.body3, !dbg !92

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !94
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !94
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4, !dbg !95
  %3 = trunc i64 %indvars.iv to i32, !dbg !96
  %rem = srem i32 %3, 80, !dbg !96
  %cmp6 = icmp eq i32 %rem, 79, !dbg !98
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !99

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !100
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !102
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !92
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !87
  %exitcond = icmp eq i64 %indvars.iv.next, 512, !dbg !92
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !92

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !103
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !83
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 512, !dbg !83
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !83

for.end11:                                        ; preds = %for.end
  ret void, !dbg !104
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #1 !dbg !9 {
entry:
  %add.i.1.lcssa.phiops = alloca i64
  %add1.i.phiops = alloca i64
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !25), !dbg !105
  br label %vector.ph, !dbg !107

vector.ph:                                        ; preds = %for.inc10.i, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %for.inc10.i ], !dbg !108
  br label %vector.body, !dbg !109

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !108
  %0 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !110
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !111
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !111
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !111
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !111
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !111
  %4 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !112
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !113
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !113
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !113
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !113
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !113
  %index.next = or i64 %index, 4, !dbg !109
  %8 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !110
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !111
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !111
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !111
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !111
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !111
  %12 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !112
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !113
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !113
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !113
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !113
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !113
  %index.next.1 = add nsw i64 %index, 8, !dbg !109
  %16 = icmp eq i64 %index.next.1, 512, !dbg !109
  br i1 %16, label %for.inc10.i, label %vector.body, !dbg !109, !llvm.loop !114

for.inc10.i:                                      ; preds = %vector.body
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !107
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 512, !dbg !107
  br i1 %exitcond5.i, label %for.cond1.preheader.i1.preheader, label %vector.ph, !dbg !107

for.cond1.preheader.i1.preheader:                 ; preds = %for.inc10.i
  br label %polly.split_new_and_old, !dbg !115

polly.split_new_and_old:                          ; preds = %for.cond1.preheader.i1.preheader
  br i1 true, label %polly.start, label %for.cond1.preheader.i1

for.cond1.preheader.i1:                           ; preds = %polly.split_new_and_old, %for.inc28.i
  %indvars.iv7.i = phi i64 [ %indvars.iv.next8.i, %for.inc28.i ], [ 0, %polly.split_new_and_old ], !dbg !117
  br label %for.body3.i3, !dbg !115

for.body3.i3:                                     ; preds = %for.inc25.i, %for.cond1.preheader.i1
  %indvars.iv4.i = phi i64 [ 0, %for.cond1.preheader.i1 ], [ %indvars.iv.next5.i, %for.inc25.i ], !dbg !117
  %arrayidx5.i2 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %indvars.iv7.i, i64 %indvars.iv4.i, !dbg !118
  store i64 0, i64* %arrayidx5.i2, align 8, !dbg !119
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !59, metadata !25), !dbg !120
  br label %for.body8.i, !dbg !121

for.body8.i:                                      ; preds = %for.body8.i, %for.body3.i3
  %add1.i = phi i64 [ 0, %for.body3.i3 ], [ %add.i.1, %for.body8.i ], !dbg !122
  %indvars.iv.i4 = phi i64 [ 0, %for.body3.i3 ], [ %indvars.iv.next.i5.1, %for.body8.i ], !dbg !117
  %arrayidx16.i = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv7.i, i64 %indvars.iv.i4, !dbg !123
  %17 = load i64, i64* %arrayidx16.i, align 16, !dbg !123
  %arrayidx20.i = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv.i4, i64 %indvars.iv4.i, !dbg !124
  %18 = load i64, i64* %arrayidx20.i, align 8, !dbg !124
  %mul.i = mul nsw i64 %18, %17, !dbg !125
  %add.i = add nsw i64 %mul.i, %add1.i, !dbg !126
  %indvars.iv.next.i5 = or i64 %indvars.iv.i4, 1, !dbg !121
  %arrayidx16.i.1 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv7.i, i64 %indvars.iv.next.i5, !dbg !123
  %19 = load i64, i64* %arrayidx16.i.1, align 8, !dbg !123
  %arrayidx20.i.1 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv.next.i5, i64 %indvars.iv4.i, !dbg !124
  %20 = load i64, i64* %arrayidx20.i.1, align 8, !dbg !124
  %mul.i.1 = mul nsw i64 %20, %19, !dbg !125
  %add.i.1 = add nsw i64 %mul.i.1, %add.i, !dbg !126
  %indvars.iv.next.i5.1 = add nsw i64 %indvars.iv.i4, 2, !dbg !121
  %exitcond.i6.1 = icmp eq i64 %indvars.iv.next.i5.1, 512, !dbg !121
  br i1 %exitcond.i6.1, label %for.inc25.i, label %for.body8.i, !dbg !121

for.inc25.i:                                      ; preds = %for.body8.i
  %add.i.1.lcssa = phi i64 [ %add.i.1, %for.body8.i ]
  store i64 %add.i.1.lcssa, i64* %arrayidx5.i2, align 8, !dbg !127
  %indvars.iv.next5.i = add nuw nsw i64 %indvars.iv4.i, 1, !dbg !115
  %exitcond6.i = icmp eq i64 %indvars.iv.next5.i, 512, !dbg !115
  br i1 %exitcond6.i, label %for.inc28.i, label %for.body3.i3, !dbg !115

for.inc28.i:                                      ; preds = %for.inc25.i
  %indvars.iv.next8.i = add nuw nsw i64 %indvars.iv7.i, 1, !dbg !128
  %exitcond9.i = icmp eq i64 %indvars.iv.next8.i, 512, !dbg !128
  br i1 %exitcond9.i, label %polly.merge_new_and_old, label %for.cond1.preheader.i1, !dbg !128

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.inc28.i
  br label %mat_mult.exit, !dbg !129

mat_mult.exit:                                    ; preds = %polly.merge_new_and_old
  %21 = load i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 511, i64 511), align 8, !dbg !129
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 512, i32 512, i64 %21) #4, !dbg !130
  ret i32 0, !dbg !131

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit3
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit3, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit3 ]
  br label %polly.loop_preheader2

polly.loop_exit3:                                 ; preds = %polly.stmt.for.inc25.i
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, 510
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header1:                               ; preds = %polly.stmt.for.inc25.i, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.stmt.for.inc25.i ]
  br label %polly.stmt.for.body3.i3

polly.stmt.for.body3.i3:                          ; preds = %polly.loop_header1
  %scevgep7 = getelementptr i64, i64* %scevgep, i64 %polly.indvar4
  store i64 0, i64* %scevgep7, align 8, !alias.scope !132, !noalias !134
  store i64 0, i64* %add1.i.phiops
  br label %polly.loop_preheader9

polly.loop_exit10:                                ; preds = %polly.stmt.for.body8.i
  br label %polly.stmt.for.inc25.i

polly.stmt.for.inc25.i:                           ; preds = %polly.loop_exit10
  %add.i.1.lcssa.phiops.reload = load i64, i64* %add.i.1.lcssa.phiops
  %scevgep26 = getelementptr i64, i64* %scevgep25, i64 %polly.indvar4
  store i64 %add.i.1.lcssa.phiops.reload, i64* %scevgep26, align 8, !alias.scope !132, !noalias !134
  %22 = add i64 %polly.indvar4, 1
  %p_exitcond6.i = icmp eq i64 %22, 512, !dbg !115
  %polly.indvar_next5 = add nsw i64 %polly.indvar4, 1
  %polly.loop_cond6 = icmp sle i64 %polly.indvar4, 510
  br i1 %polly.loop_cond6, label %polly.loop_header1, label %polly.loop_exit3

polly.loop_preheader2:                            ; preds = %polly.loop_header
  %scevgep = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %polly.indvar, i64 0
  %scevgep14 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %polly.indvar, i64 0
  %23 = shl i64 %polly.indvar, 9
  %scevgep19 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 0, i64 1), i64 %23
  %scevgep25 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %polly.indvar, i64 0
  br label %polly.loop_header1

polly.loop_header8:                               ; preds = %polly.stmt.for.body8.i, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.stmt.for.body8.i ]
  br label %polly.stmt.for.body8.i

polly.stmt.for.body8.i:                           ; preds = %polly.loop_header8
  %add1.i.phiops.reload = load i64, i64* %add1.i.phiops
  %24 = shl i64 %polly.indvar11, 1
  %scevgep15 = getelementptr i64, i64* %scevgep14, i64 %24
  %_p_scalar_ = load i64, i64* %scevgep15, align 16, !alias.scope !136, !noalias !139
  %25 = shl i64 %polly.indvar11, 10
  %scevgep17 = getelementptr i64, i64* %scevgep16, i64 %25
  %_p_scalar_18 = load i64, i64* %scevgep17, align 8, !alias.scope !138, !noalias !140
  %p_mul.i = mul nsw i64 %_p_scalar_18, %_p_scalar_, !dbg !125
  %p_add.i = add nsw i64 %p_mul.i, %add1.i.phiops.reload, !dbg !126
  %26 = shl i64 %polly.indvar11, 1
  %scevgep20 = getelementptr i64, i64* %scevgep19, i64 %26
  %_p_scalar_21 = load i64, i64* %scevgep20, align 8, !alias.scope !136, !noalias !139
  %27 = shl i64 %polly.indvar11, 10
  %scevgep23 = getelementptr i64, i64* %scevgep22, i64 %27
  %_p_scalar_24 = load i64, i64* %scevgep23, align 8, !alias.scope !138, !noalias !140
  %p_mul.i.1 = mul nsw i64 %_p_scalar_24, %_p_scalar_21, !dbg !125
  %p_add.i.1 = add nsw i64 %p_mul.i.1, %p_add.i, !dbg !126
  %28 = shl i64 %polly.indvar11, 1
  %29 = add i64 %28, 2
  %p_exitcond.i6.1 = icmp eq i64 %29, 512, !dbg !121
  store i64 %p_add.i.1, i64* %add1.i.phiops
  store i64 %p_add.i.1, i64* %add.i.1.lcssa.phiops
  %polly.indvar_next12 = add nsw i64 %polly.indvar11, 1
  %polly.loop_cond13 = icmp sle i64 %polly.indvar11, 254
  br i1 %polly.loop_cond13, label %polly.loop_header8, label %polly.loop_exit10

polly.loop_preheader9:                            ; preds = %polly.stmt.for.body3.i3
  %scevgep16 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 0, i64 %polly.indvar4
  %scevgep22 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 1, i64 0), i64 %polly.indvar4
  br label %polly.loop_header8
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
!14 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !15, isLocal: false, isDefinition: true, variable: [512 x [512 x i64]]* @A)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 16777216, align: 64, elements: !17)
!16 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!17 = !{!18, !18}
!18 = !DISubrange(count: 512)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !15, isLocal: false, isDefinition: true, variable: [512 x [512 x i64]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !15, isLocal: false, isDefinition: true, variable: [512 x [512 x i64]]* @C)
!21 = !{i32 2, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!24 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !12)
!25 = !DIExpression()
!26 = !DILocation(line: 9, column: 9, scope: !4)
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
!45 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 20, type: !12)
!46 = !DILocation(line: 20, column: 9, scope: !7)
!47 = !DILocation(line: 21, column: 5, scope: !48)
!48 = !DILexicalBlockFile(scope: !49, file: !1, discriminator: 1)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 21, column: 5)
!50 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!51 = !DILocation(line: 22, column: 9, scope: !52)
!52 = !DILexicalBlockFile(scope: !53, file: !1, discriminator: 1)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 22, column: 9)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 22, column: 9)
!55 = distinct !DILexicalBlock(scope: !49, file: !1, line: 21, column: 25)
!56 = !DILocation(line: 23, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !1, line: 22, column: 29)
!58 = !DILocation(line: 23, column: 21, scope: !57)
!59 = !DILocalVariable(name: "k", scope: !7, file: !1, line: 20, type: !12)
!60 = !DILocation(line: 20, column: 15, scope: !7)
!61 = !DILocation(line: 24, column: 13, scope: !62)
!62 = !DILexicalBlockFile(scope: !63, file: !1, discriminator: 1)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 24, column: 13)
!64 = distinct !DILexicalBlock(scope: !57, file: !1, line: 24, column: 13)
!65 = !DILocation(line: 25, column: 27, scope: !63)
!66 = !DILocation(line: 25, column: 37, scope: !63)
!67 = !DILocation(line: 25, column: 47, scope: !63)
!68 = !DILocation(line: 25, column: 45, scope: !63)
!69 = !DILocation(line: 25, column: 35, scope: !63)
!70 = !DILocation(line: 25, column: 25, scope: !63)
!71 = !DILocation(line: 29, column: 1, scope: !7)
!72 = distinct !{!72, !73, !"polly.alias.scope.C"}
!73 = distinct !{!73, !"polly.alias.scope.domain"}
!74 = !{!75, !76, !77, !78}
!75 = distinct !{!75, !73, !"polly.alias.scope.add1"}
!76 = distinct !{!76, !73, !"polly.alias.scope.add.1.lcssa"}
!77 = distinct !{!77, !73, !"polly.alias.scope.A"}
!78 = distinct !{!78, !73, !"polly.alias.scope.B"}
!79 = !{!72, !75, !76, !78}
!80 = !{!72, !75, !76, !77}
!81 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 33, type: !12)
!82 = !DILocation(line: 33, column: 9, scope: !8)
!83 = !DILocation(line: 35, column: 5, scope: !84)
!84 = !DILexicalBlockFile(scope: !85, file: !1, discriminator: 1)
!85 = distinct !DILexicalBlock(scope: !86, file: !1, line: 35, column: 5)
!86 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 5)
!87 = !DILocation(line: 37, column: 21, scope: !88)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 36, column: 29)
!89 = distinct !DILexicalBlock(scope: !90, file: !1, line: 36, column: 9)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 36, column: 9)
!91 = distinct !DILexicalBlock(scope: !85, file: !1, line: 35, column: 25)
!92 = !DILocation(line: 36, column: 9, scope: !93)
!93 = !DILexicalBlockFile(scope: !89, file: !1, discriminator: 1)
!94 = !DILocation(line: 37, column: 38, scope: !88)
!95 = !DILocation(line: 37, column: 13, scope: !88)
!96 = !DILocation(line: 38, column: 18, scope: !97)
!97 = distinct !DILexicalBlock(scope: !88, file: !1, line: 38, column: 17)
!98 = !DILocation(line: 38, column: 22, scope: !97)
!99 = !DILocation(line: 38, column: 17, scope: !88)
!100 = !DILocation(line: 38, column: 37, scope: !101)
!101 = !DILexicalBlockFile(scope: !97, file: !1, discriminator: 1)
!102 = !DILocation(line: 38, column: 29, scope: !101)
!103 = !DILocation(line: 40, column: 9, scope: !91)
!104 = !DILocation(line: 42, column: 1, scope: !8)
!105 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !106)
!106 = distinct !DILocation(line: 51, column: 5, scope: !9)
!107 = !DILocation(line: 11, column: 5, scope: !28, inlinedAt: !106)
!108 = !DILocation(line: 51, column: 5, scope: !9)
!109 = !DILocation(line: 12, column: 9, scope: !32, inlinedAt: !106)
!110 = !DILocation(line: 13, column: 13, scope: !37, inlinedAt: !106)
!111 = !DILocation(line: 13, column: 21, scope: !37, inlinedAt: !106)
!112 = !DILocation(line: 14, column: 13, scope: !37, inlinedAt: !106)
!113 = !DILocation(line: 14, column: 21, scope: !37, inlinedAt: !106)
!114 = distinct !{!114, !42, !43}
!115 = !DILocation(line: 22, column: 9, scope: !52, inlinedAt: !116)
!116 = distinct !DILocation(line: 52, column: 5, scope: !9)
!117 = !DILocation(line: 52, column: 5, scope: !9)
!118 = !DILocation(line: 23, column: 13, scope: !57, inlinedAt: !116)
!119 = !DILocation(line: 23, column: 21, scope: !57, inlinedAt: !116)
!120 = !DILocation(line: 20, column: 15, scope: !7, inlinedAt: !116)
!121 = !DILocation(line: 24, column: 13, scope: !62, inlinedAt: !116)
!122 = !DILocation(line: 25, column: 27, scope: !63, inlinedAt: !116)
!123 = !DILocation(line: 25, column: 37, scope: !63, inlinedAt: !116)
!124 = !DILocation(line: 25, column: 47, scope: !63, inlinedAt: !116)
!125 = !DILocation(line: 25, column: 45, scope: !63, inlinedAt: !116)
!126 = !DILocation(line: 25, column: 35, scope: !63, inlinedAt: !116)
!127 = !DILocation(line: 25, column: 25, scope: !63, inlinedAt: !116)
!128 = !DILocation(line: 21, column: 5, scope: !48, inlinedAt: !116)
!129 = !DILocation(line: 55, column: 71, scope: !9)
!130 = !DILocation(line: 55, column: 5, scope: !9)
!131 = !DILocation(line: 56, column: 5, scope: !9)
!132 = distinct !{!132, !133, !"polly.alias.scope.C"}
!133 = distinct !{!133, !"polly.alias.scope.domain"}
!134 = !{!135, !136, !137, !138}
!135 = distinct !{!135, !133, !"polly.alias.scope.add.i.1.lcssa"}
!136 = distinct !{!136, !133, !"polly.alias.scope.A"}
!137 = distinct !{!137, !133, !"polly.alias.scope.add1.i"}
!138 = distinct !{!138, !133, !"polly.alias.scope.B"}
!139 = !{!135, !132, !137, !138}
!140 = !{!135, !132, !136, !137}
