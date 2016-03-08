; ModuleID = 'MatrixMult.before.pollyvector.ll'
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
  %index.next.1 = add nuw nsw i64 %index, 8, !dbg !31
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
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !45, metadata !25), !dbg !46
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit3
  ret void, !dbg !47

polly.loop_exit3:                                 ; preds = %polly.stmt.for.inc25
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond3 = icmp eq i64 %polly.indvar_next, 512
  br i1 %exitcond3, label %polly.exiting, label %polly.loop_preheader2

polly.stmt.for.body3:                             ; preds = %polly.stmt.for.inc25, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.stmt.for.inc25 ]
  %scevgep7 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %polly.indvar, i64 %polly.indvar4
  store i64 0, i64* %scevgep7, align 8, !alias.scope !48, !noalias !50
  %scevgep16 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 0, i64 %polly.indvar4
  %scevgep22 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 1, i64 %polly.indvar4
  br label %polly.stmt.for.body8

polly.stmt.for.inc25:                             ; preds = %polly.stmt.for.body8
  %p_add.1.1.lcssa = phi i64 [ %p_add.1.1, %polly.stmt.for.body8 ]
  store i64 %p_add.1.1.lcssa, i64* %scevgep7, align 8, !alias.scope !48, !noalias !50
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond1 = icmp eq i64 %polly.indvar_next5, 512
  br i1 %exitcond1, label %polly.loop_exit3, label %polly.stmt.for.body3

polly.loop_preheader2:                            ; preds = %polly.loop_exit3, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit3 ]
  %0 = shl i64 %polly.indvar, 9
  %scevgep19 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 0, i64 1), i64 %0
  br label %polly.stmt.for.body3

polly.stmt.for.body8:                             ; preds = %polly.stmt.for.body8, %polly.stmt.for.body3
  %add1.phiops.0 = phi i64 [ 0, %polly.stmt.for.body3 ], [ %p_add.1.1, %polly.stmt.for.body8 ]
  %polly.indvar11 = phi i64 [ 0, %polly.stmt.for.body3 ], [ %polly.indvar_next12.1, %polly.stmt.for.body8 ]
  %1 = shl i64 %polly.indvar11, 1
  %scevgep15 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %polly.indvar, i64 %1
  %_p_scalar_ = load i64, i64* %scevgep15, align 16, !alias.scope !51, !noalias !55
  %2 = shl i64 %polly.indvar11, 10
  %scevgep17 = getelementptr i64, i64* %scevgep16, i64 %2
  %_p_scalar_18 = load i64, i64* %scevgep17, align 8, !alias.scope !52, !noalias !56
  %p_mul = mul nsw i64 %_p_scalar_18, %_p_scalar_, !dbg !57
  %p_add = add nsw i64 %p_mul, %add1.phiops.0, !dbg !66
  %scevgep20 = getelementptr i64, i64* %scevgep19, i64 %1
  %_p_scalar_21 = load i64, i64* %scevgep20, align 8, !alias.scope !51, !noalias !55
  %scevgep23 = getelementptr i64, i64* %scevgep22, i64 %2
  %_p_scalar_24 = load i64, i64* %scevgep23, align 8, !alias.scope !52, !noalias !56
  %p_mul.1 = mul nsw i64 %_p_scalar_24, %_p_scalar_21, !dbg !57
  %p_add.1 = add nsw i64 %p_add, %p_mul.1, !dbg !66
  %polly.indvar_next12 = or i64 %polly.indvar11, 1
  %3 = shl i64 %polly.indvar_next12, 1
  %scevgep15.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %polly.indvar, i64 %3
  %_p_scalar_.1 = load i64, i64* %scevgep15.1, align 16, !alias.scope !51, !noalias !55
  %4 = shl i64 %polly.indvar_next12, 10
  %scevgep17.1 = getelementptr i64, i64* %scevgep16, i64 %4
  %_p_scalar_18.1 = load i64, i64* %scevgep17.1, align 8, !alias.scope !52, !noalias !56
  %p_mul.14 = mul nsw i64 %_p_scalar_18.1, %_p_scalar_.1, !dbg !57
  %p_add.15 = add nsw i64 %p_mul.14, %p_add.1, !dbg !66
  %scevgep20.1 = getelementptr i64, i64* %scevgep19, i64 %3
  %_p_scalar_21.1 = load i64, i64* %scevgep20.1, align 8, !alias.scope !51, !noalias !55
  %scevgep23.1 = getelementptr i64, i64* %scevgep22, i64 %4
  %_p_scalar_24.1 = load i64, i64* %scevgep23.1, align 8, !alias.scope !52, !noalias !56
  %p_mul.1.1 = mul nsw i64 %_p_scalar_24.1, %_p_scalar_21.1, !dbg !57
  %p_add.1.1 = add nsw i64 %p_add.15, %p_mul.1.1, !dbg !66
  %polly.indvar_next12.1 = add nsw i64 %polly.indvar11, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next12.1, 256
  br i1 %exitcond.1, label %polly.stmt.for.inc25, label %polly.stmt.for.body8
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !67, metadata !25), !dbg !68
  br label %for.cond1.preheader, !dbg !69

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !73
  br label %for.body3, !dbg !78

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !80
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !80
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4, !dbg !81
  %3 = trunc i64 %indvars.iv to i32, !dbg !82
  %rem = srem i32 %3, 80, !dbg !82
  %cmp6 = icmp eq i32 %rem, 79, !dbg !84
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !85

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !86
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !88
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !78
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !73
  %exitcond = icmp eq i64 %indvars.iv.next, 512, !dbg !78
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !78

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !89
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !69
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 512, !dbg !69
  br i1 %exitcond8, label %for.end11, label %for.cond1.preheader, !dbg !69

for.end11:                                        ; preds = %for.end
  ret void, !dbg !90
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #1 !dbg !9 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !25), !dbg !91
  br label %vector.ph, !dbg !93

vector.ph:                                        ; preds = %for.inc10.i, %entry
  %indvars.iv3.i = phi i64 [ 0, %entry ], [ %indvars.iv.next4.i, %for.inc10.i ], !dbg !94
  br label %vector.body, !dbg !95

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ], !dbg !94
  %0 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !96
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !97
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %1, align 16, !dbg !97
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !97
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !97
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %3, align 16, !dbg !97
  %4 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index, !dbg !98
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !99
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %5, align 16, !dbg !99
  %6 = getelementptr i64, i64* %4, i64 2, !dbg !99
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !99
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %7, align 16, !dbg !99
  %index.next = or i64 %index, 4, !dbg !95
  %8 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !96
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !97
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %9, align 16, !dbg !97
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !97
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !97
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %11, align 16, !dbg !97
  %12 = getelementptr inbounds [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 %indvars.iv3.i, i64 %index.next, !dbg !98
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !99
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %13, align 16, !dbg !99
  %14 = getelementptr i64, i64* %12, i64 2, !dbg !99
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !99
  store <2 x i64> <i64 1, i64 1>, <2 x i64>* %15, align 16, !dbg !99
  %index.next.1 = add nuw nsw i64 %index, 8, !dbg !95
  %16 = icmp eq i64 %index.next.1, 512, !dbg !95
  br i1 %16, label %for.inc10.i, label %vector.body, !dbg !95, !llvm.loop !100

for.inc10.i:                                      ; preds = %vector.body
  %indvars.iv.next4.i = add nuw nsw i64 %indvars.iv3.i, 1, !dbg !93
  %exitcond5.i = icmp eq i64 %indvars.iv.next4.i, 512, !dbg !93
  br i1 %exitcond5.i, label %polly.loop_preheader2.preheader, label %vector.ph, !dbg !93

polly.loop_preheader2.preheader:                  ; preds = %for.inc10.i
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit3
  %17 = load i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 511, i64 511), align 8, !dbg !101
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 512, i32 512, i64 %17) #4, !dbg !102
  ret i32 0, !dbg !103

polly.loop_exit3:                                 ; preds = %polly.stmt.for.inc25.i
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond3 = icmp eq i64 %polly.indvar_next, 512
  br i1 %exitcond3, label %polly.exiting, label %polly.loop_preheader2

polly.stmt.for.body3.i3:                          ; preds = %polly.stmt.for.inc25.i, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.stmt.for.inc25.i ]
  %scevgep7 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @C, i64 0, i64 %polly.indvar, i64 %polly.indvar4
  store i64 0, i64* %scevgep7, align 8, !alias.scope !104, !noalias !106
  %scevgep16 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 0, i64 %polly.indvar4
  %scevgep22 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @B, i64 0, i64 1, i64 %polly.indvar4
  br label %polly.stmt.for.body8.i

polly.stmt.for.inc25.i:                           ; preds = %polly.stmt.for.body8.i
  %p_add.i.1.1.lcssa = phi i64 [ %p_add.i.1.1, %polly.stmt.for.body8.i ]
  store i64 %p_add.i.1.1.lcssa, i64* %scevgep7, align 8, !alias.scope !104, !noalias !106
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond1 = icmp eq i64 %polly.indvar_next5, 512
  br i1 %exitcond1, label %polly.loop_exit3, label %polly.stmt.for.body3.i3

polly.loop_preheader2:                            ; preds = %polly.loop_preheader2.preheader, %polly.loop_exit3
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit3 ], [ 0, %polly.loop_preheader2.preheader ]
  %18 = shl i64 %polly.indvar, 9
  %scevgep19 = getelementptr i64, i64* getelementptr inbounds ([512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 0, i64 1), i64 %18
  br label %polly.stmt.for.body3.i3

polly.stmt.for.body8.i:                           ; preds = %polly.stmt.for.body8.i, %polly.stmt.for.body3.i3
  %add1.i.phiops.0 = phi i64 [ 0, %polly.stmt.for.body3.i3 ], [ %p_add.i.1.1, %polly.stmt.for.body8.i ]
  %polly.indvar11 = phi i64 [ 0, %polly.stmt.for.body3.i3 ], [ %polly.indvar_next12.1, %polly.stmt.for.body8.i ]
  %19 = shl i64 %polly.indvar11, 1
  %scevgep15 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %polly.indvar, i64 %19
  %_p_scalar_ = load i64, i64* %scevgep15, align 16, !alias.scope !107, !noalias !111
  %20 = shl i64 %polly.indvar11, 10
  %scevgep17 = getelementptr i64, i64* %scevgep16, i64 %20
  %_p_scalar_18 = load i64, i64* %scevgep17, align 8, !alias.scope !109, !noalias !112
  %p_mul.i = mul nsw i64 %_p_scalar_18, %_p_scalar_, !dbg !113
  %p_add.i = add nsw i64 %p_mul.i, %add1.i.phiops.0, !dbg !115
  %scevgep20 = getelementptr i64, i64* %scevgep19, i64 %19
  %_p_scalar_21 = load i64, i64* %scevgep20, align 8, !alias.scope !107, !noalias !111
  %scevgep23 = getelementptr i64, i64* %scevgep22, i64 %20
  %_p_scalar_24 = load i64, i64* %scevgep23, align 8, !alias.scope !109, !noalias !112
  %p_mul.i.1 = mul nsw i64 %_p_scalar_24, %_p_scalar_21, !dbg !113
  %p_add.i.1 = add nsw i64 %p_add.i, %p_mul.i.1, !dbg !115
  %polly.indvar_next12 = or i64 %polly.indvar11, 1
  %21 = shl i64 %polly.indvar_next12, 1
  %scevgep15.1 = getelementptr [512 x [512 x i64]], [512 x [512 x i64]]* @A, i64 0, i64 %polly.indvar, i64 %21
  %_p_scalar_.1 = load i64, i64* %scevgep15.1, align 16, !alias.scope !107, !noalias !111
  %22 = shl i64 %polly.indvar_next12, 10
  %scevgep17.1 = getelementptr i64, i64* %scevgep16, i64 %22
  %_p_scalar_18.1 = load i64, i64* %scevgep17.1, align 8, !alias.scope !109, !noalias !112
  %p_mul.i.14 = mul nsw i64 %_p_scalar_18.1, %_p_scalar_.1, !dbg !113
  %p_add.i.15 = add nsw i64 %p_mul.i.14, %p_add.i.1, !dbg !115
  %scevgep20.1 = getelementptr i64, i64* %scevgep19, i64 %21
  %_p_scalar_21.1 = load i64, i64* %scevgep20.1, align 8, !alias.scope !107, !noalias !111
  %scevgep23.1 = getelementptr i64, i64* %scevgep22, i64 %22
  %_p_scalar_24.1 = load i64, i64* %scevgep23.1, align 8, !alias.scope !109, !noalias !112
  %p_mul.i.1.1 = mul nsw i64 %_p_scalar_24.1, %_p_scalar_21.1, !dbg !113
  %p_add.i.1.1 = add nsw i64 %p_add.i.15, %p_mul.i.1.1, !dbg !115
  %polly.indvar_next12.1 = add nsw i64 %polly.indvar11, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next12.1, 256
  br i1 %exitcond.1, label %polly.stmt.for.inc25.i, label %polly.stmt.for.body8.i
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
!47 = !DILocation(line: 29, column: 1, scope: !7)
!48 = distinct !{!48, !49, !"polly.alias.scope.C"}
!49 = distinct !{!49, !"polly.alias.scope.domain"}
!50 = !{!51, !52, !53, !54}
!51 = distinct !{!51, !49, !"polly.alias.scope.A"}
!52 = distinct !{!52, !49, !"polly.alias.scope.B"}
!53 = distinct !{!53, !49, !"polly.alias.scope.add.1.lcssa"}
!54 = distinct !{!54, !49, !"polly.alias.scope.add1"}
!55 = !{!48, !52, !53, !54}
!56 = !{!51, !48, !53, !54}
!57 = !DILocation(line: 25, column: 45, scope: !58)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 24, column: 13)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 24, column: 13)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 22, column: 29)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 22, column: 9)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 22, column: 9)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 21, column: 25)
!64 = distinct !DILexicalBlock(scope: !65, file: !1, line: 21, column: 5)
!65 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!66 = !DILocation(line: 25, column: 35, scope: !58)
!67 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 33, type: !12)
!68 = !DILocation(line: 33, column: 9, scope: !8)
!69 = !DILocation(line: 35, column: 5, scope: !70)
!70 = !DILexicalBlockFile(scope: !71, file: !1, discriminator: 1)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 35, column: 5)
!72 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 5)
!73 = !DILocation(line: 37, column: 21, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 36, column: 29)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 36, column: 9)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 36, column: 9)
!77 = distinct !DILexicalBlock(scope: !71, file: !1, line: 35, column: 25)
!78 = !DILocation(line: 36, column: 9, scope: !79)
!79 = !DILexicalBlockFile(scope: !75, file: !1, discriminator: 1)
!80 = !DILocation(line: 37, column: 38, scope: !74)
!81 = !DILocation(line: 37, column: 13, scope: !74)
!82 = !DILocation(line: 38, column: 18, scope: !83)
!83 = distinct !DILexicalBlock(scope: !74, file: !1, line: 38, column: 17)
!84 = !DILocation(line: 38, column: 22, scope: !83)
!85 = !DILocation(line: 38, column: 17, scope: !74)
!86 = !DILocation(line: 38, column: 37, scope: !87)
!87 = !DILexicalBlockFile(scope: !83, file: !1, discriminator: 1)
!88 = !DILocation(line: 38, column: 29, scope: !87)
!89 = !DILocation(line: 40, column: 9, scope: !77)
!90 = !DILocation(line: 42, column: 1, scope: !8)
!91 = !DILocation(line: 9, column: 9, scope: !4, inlinedAt: !92)
!92 = distinct !DILocation(line: 51, column: 5, scope: !9)
!93 = !DILocation(line: 11, column: 5, scope: !28, inlinedAt: !92)
!94 = !DILocation(line: 51, column: 5, scope: !9)
!95 = !DILocation(line: 12, column: 9, scope: !32, inlinedAt: !92)
!96 = !DILocation(line: 13, column: 13, scope: !37, inlinedAt: !92)
!97 = !DILocation(line: 13, column: 21, scope: !37, inlinedAt: !92)
!98 = !DILocation(line: 14, column: 13, scope: !37, inlinedAt: !92)
!99 = !DILocation(line: 14, column: 21, scope: !37, inlinedAt: !92)
!100 = distinct !{!100, !42, !43}
!101 = !DILocation(line: 55, column: 71, scope: !9)
!102 = !DILocation(line: 55, column: 5, scope: !9)
!103 = !DILocation(line: 56, column: 5, scope: !9)
!104 = distinct !{!104, !105, !"polly.alias.scope.C"}
!105 = distinct !{!105, !"polly.alias.scope.domain"}
!106 = !{!107, !108, !109, !110}
!107 = distinct !{!107, !105, !"polly.alias.scope.A"}
!108 = distinct !{!108, !105, !"polly.alias.scope.add.i.1.lcssa"}
!109 = distinct !{!109, !105, !"polly.alias.scope.B"}
!110 = distinct !{!110, !105, !"polly.alias.scope.add1.i"}
!111 = !{!104, !108, !109, !110}
!112 = !{!107, !104, !108, !110}
!113 = !DILocation(line: 25, column: 45, scope: !58, inlinedAt: !114)
!114 = distinct !DILocation(line: 52, column: 5, scope: !9)
!115 = !DILocation(line: 25, column: 35, scope: !58, inlinedAt: !114)
