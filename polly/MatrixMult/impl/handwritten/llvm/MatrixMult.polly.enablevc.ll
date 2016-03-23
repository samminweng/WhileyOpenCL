; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@B = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@C = common global [2000 x [2000 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.3 = private unnamed_addr constant [49 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%lld \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !8, metadata !39), !dbg !40
  br label %polly.loop_preheader43

polly.exiting:                                    ; preds = %polly.loop_exit44
  ret void, !dbg !41

polly.loop_exit44:                                ; preds = %polly.loop_exit50
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond69 = icmp eq i64 %polly.indvar_next, 63
  br i1 %exitcond69, label %polly.exiting, label %polly.loop_preheader43, !llvm.loop !42

polly.loop_header42:                              ; preds = %polly.loop_exit50, %polly.loop_preheader43
  %polly.indvar45 = phi i64 [ 0, %polly.loop_preheader43 ], [ %polly.indvar_next46, %polly.loop_exit50 ]
  %0 = mul nsw i64 %polly.indvar45, -8
  %1 = add nsw i64 %0, 499
  %2 = icmp sgt i64 %1, 7
  %3 = select i1 %2, i64 7, i64 %1
  %4 = shl i64 %polly.indvar45, 5
  %polly.adjust_ub59 = add i64 %3, -1
  br label %polly.loop_header48

polly.loop_exit50:                                ; preds = %polly.loop_exit56
  %polly.indvar_next46 = add nuw nsw i64 %polly.indvar45, 1
  %exitcond = icmp eq i64 %polly.indvar_next46, 63
  br i1 %exitcond, label %polly.loop_exit44, label %polly.loop_header42

polly.loop_preheader43:                           ; preds = %polly.loop_exit44, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit44 ]
  %5 = mul nsw i64 %polly.indvar, -32
  %6 = add nsw i64 %5, 1999
  %7 = icmp sgt i64 %6, 31
  %8 = select i1 %7, i64 31, i64 %6
  %9 = shl nsw i64 %polly.indvar, 5
  %polly.adjust_ub = add i64 %8, -1
  br label %polly.loop_header42

polly.loop_header48:                              ; preds = %polly.loop_exit56, %polly.loop_header42
  %polly.indvar51 = phi i64 [ 0, %polly.loop_header42 ], [ %polly.indvar_next52, %polly.loop_exit56 ]
  %10 = add nuw nsw i64 %polly.indvar51, %9
  %11 = trunc i64 %10 to i32
  %12 = insertelement <4 x i32> undef, i32 %11, i32 0, !dbg !43
  %13 = insertelement <4 x i32> %12, i32 %11, i32 1, !dbg !43
  %14 = insertelement <4 x i32> %13, i32 %11, i32 2, !dbg !43
  %15 = insertelement <4 x i32> %14, i32 %11, i32 3, !dbg !43
  %16 = insertelement <4 x i32> undef, i32 %11, i32 0, !dbg !46
  %17 = insertelement <4 x i32> %16, i32 %11, i32 1, !dbg !46
  %18 = insertelement <4 x i32> %17, i32 %11, i32 2, !dbg !46
  %19 = insertelement <4 x i32> %18, i32 %11, i32 3, !dbg !46
  br label %polly.loop_preheader62

polly.loop_exit56:                                ; preds = %polly.loop_preheader62
  %polly.indvar_next52 = add nuw nsw i64 %polly.indvar51, 1
  %polly.loop_cond53 = icmp sgt i64 %polly.indvar51, %polly.adjust_ub
  br i1 %polly.loop_cond53, label %polly.loop_exit50, label %polly.loop_header48

polly.loop_preheader62:                           ; preds = %polly.loop_header48, %polly.loop_preheader62
  %polly.indvar57 = phi i64 [ 0, %polly.loop_header48 ], [ %polly.indvar_next58, %polly.loop_preheader62 ]
  %20 = shl i64 %polly.indvar57, 2
  %21 = add nuw nsw i64 %20, %4
  %scevgep = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %10, i64 %21
  %scevgep67 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %10, i64 %21
  %22 = bitcast i32* %scevgep to <4 x i32>*
  %23 = load <4 x i32>, <4 x i32>* %22, align 16, !alias.scope !47, !noalias !49
  %24 = add nsw <4 x i32> %23, %15, !dbg !43
  %25 = bitcast i32* %scevgep to <4 x i32>*
  store <4 x i32> %24, <4 x i32>* %25, align 16, !alias.scope !47, !noalias !49
  %26 = bitcast i32* %scevgep67 to <4 x i32>*
  %27 = load <4 x i32>, <4 x i32>* %26, align 16, !alias.scope !50, !noalias !51
  %28 = add nsw <4 x i32> %27, %19, !dbg !46
  %29 = bitcast i32* %scevgep67 to <4 x i32>*
  store <4 x i32> %28, <4 x i32>* %29, align 16, !alias.scope !50, !noalias !51
  %polly.indvar_next58 = add nuw nsw i64 %polly.indvar57, 1
  %polly.loop_cond60 = icmp sgt i64 %polly.indvar57, %polly.adjust_ub59
  br i1 %polly.loop_cond60, label %polly.loop_exit56, label %polly.loop_preheader62
}

; Function Attrs: noinline nounwind uwtable
define void @mat_mult() #0 !dbg !15 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !17, metadata !39), !dbg !52
  br label %polly.loop_preheader56

polly.exiting:                                    ; preds = %polly.loop_exit88
  ret void, !dbg !53

polly.loop_exit57:                                ; preds = %polly.loop_exit63
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond140 = icmp eq i64 %polly.indvar_next, 63
  br i1 %exitcond140, label %polly.loop_preheader87.preheader, label %polly.loop_preheader56, !llvm.loop !54

polly.loop_preheader87.preheader:                 ; preds = %polly.loop_exit57
  br label %polly.loop_preheader87

polly.loop_header55:                              ; preds = %polly.loop_exit63, %polly.loop_preheader56
  %polly.indvar58 = phi i64 [ 0, %polly.loop_preheader56 ], [ %polly.indvar_next59, %polly.loop_exit63 ]
  %0 = shl i64 %polly.indvar58, 5
  %1 = shl i64 %polly.indvar58, 3
  %2 = add nuw nsw i64 %1, -500
  %3 = icmp sgt i64 %2, -8
  %smax = select i1 %3, i64 %2, i64 -8
  %4 = mul i64 %smax, -32
  br label %polly.loop_header61

polly.loop_exit63:                                ; preds = %polly.loop_header61
  %polly.indvar_next59 = add nuw nsw i64 %polly.indvar58, 1
  %exitcond139 = icmp eq i64 %polly.indvar_next59, 63
  br i1 %exitcond139, label %polly.loop_exit57, label %polly.loop_header55

polly.loop_preheader56:                           ; preds = %polly.loop_exit57, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit57 ]
  %5 = shl i64 %polly.indvar, 5
  %6 = mul nsw i64 %polly.indvar, -32
  %7 = add nsw i64 %6, 1999
  %8 = icmp sgt i64 %7, 31
  %9 = select i1 %8, i64 31, i64 %7
  %polly.adjust_ub = add i64 %9, -1
  br label %polly.loop_header55

polly.loop_header61:                              ; preds = %polly.loop_header61, %polly.loop_header55
  %polly.indvar64 = phi i64 [ 0, %polly.loop_header55 ], [ %polly.indvar_next65, %polly.loop_header61 ]
  %10 = add nuw nsw i64 %5, %polly.indvar64
  %scevgep = getelementptr [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %10, i64 %0
  %scevgep138 = bitcast i64* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep138, i8 0, i64 %4, i32 16, i1 false)
  %polly.indvar_next65 = add nuw nsw i64 %polly.indvar64, 1
  %polly.loop_cond66 = icmp sgt i64 %polly.indvar64, %polly.adjust_ub
  br i1 %polly.loop_cond66, label %polly.loop_exit63, label %polly.loop_header61

polly.loop_exit88:                                ; preds = %polly.loop_exit94
  %polly.indvar_next84 = add nuw nsw i64 %polly.indvar83, 1
  %exitcond134 = icmp eq i64 %polly.indvar_next84, 63
  br i1 %exitcond134, label %polly.exiting, label %polly.loop_preheader87, !llvm.loop !55

polly.loop_exit94:                                ; preds = %polly.loop_exit100
  %polly.indvar_next90 = add nuw nsw i64 %polly.indvar89, 1
  %exitcond133 = icmp eq i64 %polly.indvar_next90, 63
  br i1 %exitcond133, label %polly.loop_exit88, label %polly.loop_preheader93

polly.loop_preheader87:                           ; preds = %polly.loop_preheader87.preheader, %polly.loop_exit88
  %polly.indvar83 = phi i64 [ %polly.indvar_next84, %polly.loop_exit88 ], [ 0, %polly.loop_preheader87.preheader ]
  %11 = mul nsw i64 %polly.indvar83, -32
  %12 = add nsw i64 %11, 1999
  %13 = icmp sgt i64 %12, 31
  %14 = select i1 %13, i64 31, i64 %12
  %15 = shl nsw i64 %polly.indvar83, 5
  %polly.adjust_ub103 = add i64 %14, -1
  br label %polly.loop_preheader93

polly.loop_header92:                              ; preds = %polly.loop_exit100, %polly.loop_preheader93
  %polly.indvar95 = phi i64 [ 0, %polly.loop_preheader93 ], [ %polly.indvar_next96, %polly.loop_exit100 ]
  %16 = mul nsw i64 %polly.indvar95, -8
  %17 = add nsw i64 %16, 499
  %18 = icmp sgt i64 %17, 7
  %19 = select i1 %18, i64 7, i64 %17
  %20 = shl i64 %polly.indvar95, 5
  %polly.adjust_ub117 = add i64 %19, -1
  br label %polly.loop_header98

polly.loop_exit100:                               ; preds = %polly.loop_exit107
  %polly.indvar_next96 = add nuw nsw i64 %polly.indvar95, 1
  %exitcond = icmp eq i64 %polly.indvar_next96, 63
  br i1 %exitcond, label %polly.loop_exit94, label %polly.loop_header92

polly.loop_preheader93:                           ; preds = %polly.loop_exit94, %polly.loop_preheader87
  %polly.indvar89 = phi i64 [ 0, %polly.loop_preheader87 ], [ %polly.indvar_next90, %polly.loop_exit94 ]
  %21 = mul nsw i64 %polly.indvar89, -32
  %22 = add nsw i64 %21, 1999
  %23 = icmp sgt i64 %22, 31
  %24 = select i1 %23, i64 31, i64 %22
  %25 = shl nsw i64 %polly.indvar89, 5
  %polly.adjust_ub110 = add i64 %24, -1
  br label %polly.loop_header92

polly.loop_header98:                              ; preds = %polly.loop_exit107, %polly.loop_header92
  %polly.indvar101 = phi i64 [ 0, %polly.loop_header92 ], [ %polly.indvar_next102, %polly.loop_exit107 ]
  %26 = add nuw nsw i64 %polly.indvar101, %15
  br label %polly.loop_header105

polly.loop_exit107:                               ; preds = %polly.loop_exit114
  %polly.indvar_next102 = add nuw nsw i64 %polly.indvar101, 1
  %polly.loop_cond104 = icmp sgt i64 %polly.indvar101, %polly.adjust_ub103
  br i1 %polly.loop_cond104, label %polly.loop_exit100, label %polly.loop_header98

polly.loop_header105:                             ; preds = %polly.loop_exit114, %polly.loop_header98
  %polly.indvar108 = phi i64 [ 0, %polly.loop_header98 ], [ %polly.indvar_next109, %polly.loop_exit114 ]
  %27 = add nuw nsw i64 %polly.indvar108, %25
  %scevgep125 = getelementptr [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %26, i64 %27
  %scevgep125.promoted131 = load i64, i64* %scevgep125, align 8, !alias.scope !56, !noalias !58
  br label %polly.loop_preheader120

polly.loop_exit114:                               ; preds = %polly.loop_preheader120
  %p_add.3.lcssa = phi i64 [ %p_add.3, %polly.loop_preheader120 ]
  store i64 %p_add.3.lcssa, i64* %scevgep125, align 8, !alias.scope !56, !noalias !58
  %polly.indvar_next109 = add nuw nsw i64 %polly.indvar108, 1
  %polly.loop_cond111 = icmp sgt i64 %polly.indvar108, %polly.adjust_ub110
  br i1 %polly.loop_cond111, label %polly.loop_exit107, label %polly.loop_header105

polly.loop_preheader120:                          ; preds = %polly.loop_header105, %polly.loop_preheader120
  %p_add.lcssa132 = phi i64 [ %scevgep125.promoted131, %polly.loop_header105 ], [ %p_add.3, %polly.loop_preheader120 ]
  %polly.indvar115 = phi i64 [ 0, %polly.loop_header105 ], [ %polly.indvar_next116, %polly.loop_preheader120 ]
  %28 = shl i64 %polly.indvar115, 2
  %29 = add nuw nsw i64 %28, %20
  %scevgep126 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %26, i64 %29
  %_p_scalar_127 = load i32, i32* %scevgep126, align 16, !alias.scope !60, !noalias !61, !llvm.mem.parallel_loop_access !62
  %scevgep128 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %29, i64 %27
  %_p_scalar_129 = load i32, i32* %scevgep128, align 4, !alias.scope !59, !noalias !64, !llvm.mem.parallel_loop_access !62
  %p_mul = mul nsw i32 %_p_scalar_129, %_p_scalar_127, !dbg !65
  %p_conv = sext i32 %p_mul to i64, !dbg !74
  %p_add = add nsw i64 %p_conv, %p_add.lcssa132, !dbg !75
  %30 = or i64 %29, 1
  %scevgep126.1 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %26, i64 %30
  %_p_scalar_127.1 = load i32, i32* %scevgep126.1, align 4, !alias.scope !60, !noalias !61, !llvm.mem.parallel_loop_access !62
  %scevgep128.1 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %30, i64 %27
  %_p_scalar_129.1 = load i32, i32* %scevgep128.1, align 4, !alias.scope !59, !noalias !64, !llvm.mem.parallel_loop_access !62
  %p_mul.1 = mul nsw i32 %_p_scalar_129.1, %_p_scalar_127.1, !dbg !65
  %p_conv.1 = sext i32 %p_mul.1 to i64, !dbg !74
  %p_add.1 = add nsw i64 %p_conv.1, %p_add, !dbg !75
  %31 = or i64 %29, 2
  %scevgep126.2 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %26, i64 %31
  %_p_scalar_127.2 = load i32, i32* %scevgep126.2, align 8, !alias.scope !60, !noalias !61, !llvm.mem.parallel_loop_access !62
  %scevgep128.2 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %31, i64 %27
  %_p_scalar_129.2 = load i32, i32* %scevgep128.2, align 4, !alias.scope !59, !noalias !64, !llvm.mem.parallel_loop_access !62
  %p_mul.2 = mul nsw i32 %_p_scalar_129.2, %_p_scalar_127.2, !dbg !65
  %p_conv.2 = sext i32 %p_mul.2 to i64, !dbg !74
  %p_add.2 = add nsw i64 %p_conv.2, %p_add.1, !dbg !75
  %32 = or i64 %29, 3
  %scevgep126.3 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %26, i64 %32
  %_p_scalar_127.3 = load i32, i32* %scevgep126.3, align 4, !alias.scope !60, !noalias !61, !llvm.mem.parallel_loop_access !62
  %scevgep128.3 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %32, i64 %27
  %_p_scalar_129.3 = load i32, i32* %scevgep128.3, align 4, !alias.scope !59, !noalias !64, !llvm.mem.parallel_loop_access !62
  %p_mul.3 = mul nsw i32 %_p_scalar_129.3, %_p_scalar_127.3, !dbg !65
  %p_conv.3 = sext i32 %p_mul.3 to i64, !dbg !74
  %p_add.3 = add nsw i64 %p_conv.3, %p_add.2, !dbg !75
  %polly.indvar_next116 = add nuw nsw i64 %polly.indvar115, 1
  %polly.loop_cond118 = icmp sgt i64 %polly.indvar115, %polly.adjust_ub117
  br i1 %polly.loop_cond118, label %polly.loop_exit114, label %polly.loop_preheader120
}

; Function Attrs: nounwind uwtable
define void @print_array() #1 !dbg !20 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !22, metadata !39), !dbg !76
  br label %for.cond1.preheader, !dbg !77

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !81, !tbaa !86
  br label %for.body3, !dbg !90

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %indvars.iv24, i64 %indvars.iv, !dbg !92
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !92, !tbaa !93
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2), !dbg !95
  %3 = trunc i64 %indvars.iv to i32, !dbg !96
  %rem = srem i32 %3, 80, !dbg !96
  %cmp6 = icmp eq i32 %rem, 79, !dbg !98
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !99

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !100, !tbaa !86
  %fputc21 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !102
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !90
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !81, !tbaa !86
  %exitcond = icmp eq i64 %indvars.iv.next, 2000, !dbg !90
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !90

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !103
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !77
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 2000, !dbg !77
  br i1 %exitcond26, label %for.end11, label %for.cond1.preheader, !dbg !77

for.end11:                                        ; preds = %for.end
  ret void, !dbg !104
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #1 !dbg !24 {
entry:
  tail call void @init(), !dbg !105
  tail call void @mat_mult(), !dbg !106
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 2000, i32 2000), !dbg !107
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !108, !tbaa !109
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !111, !tbaa !109
  %2 = load i64, i64* getelementptr inbounds ([2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 1999, i64 1999), align 8, !dbg !112, !tbaa !93
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.3, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i64 %2), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!36, !37}
!llvm.ident = !{!38}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !27)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !15, !20, !24}
!4 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !5, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: true, variables: !7)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = !{!8, !11}
!8 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 25, type: !10)
!9 = distinct !DILexicalBlock(scope: !4, file: !1, line: 25, column: 5)
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "j", scope: !12, file: !1, line: 26, type: !10)
!12 = distinct !DILexicalBlock(scope: !13, file: !1, line: 26, column: 9)
!13 = distinct !DILexicalBlock(scope: !14, file: !1, line: 25, column: 29)
!14 = distinct !DILexicalBlock(scope: !9, file: !1, line: 25, column: 5)
!15 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 35, type: !5, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: true, variables: !16)
!16 = !{!17, !18, !19}
!17 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 36, type: !10)
!18 = !DILocalVariable(name: "j", scope: !15, file: !1, line: 36, type: !10)
!19 = !DILocalVariable(name: "k", scope: !15, file: !1, line: 36, type: !10)
!20 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 46, type: !5, isLocal: false, isDefinition: true, scopeLine: 47, isOptimized: true, variables: !21)
!21 = !{!22, !23}
!22 = !DILocalVariable(name: "i", scope: !20, file: !1, line: 48, type: !10)
!23 = !DILocalVariable(name: "j", scope: !20, file: !1, line: 48, type: !10)
!24 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 59, type: !25, isLocal: false, isDefinition: true, scopeLine: 60, isOptimized: true, variables: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!10}
!27 = !{!28, !32, !33}
!28 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 7, type: !29, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @A)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 128000000, align: 32, elements: !30)
!30 = !{!31, !31}
!31 = !DISubrange(count: 2000)
!32 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 8, type: !29, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!33 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 9, type: !34, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i64]]* @C)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 256000000, align: 64, elements: !30)
!35 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!36 = !{i32 2, !"Dwarf Version", i32 4}
!37 = !{i32 2, !"Debug Info Version", i32 3}
!38 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!39 = !DIExpression()
!40 = !DILocation(line: 25, column: 14, scope: !9)
!41 = !DILocation(line: 33, column: 1, scope: !4)
!42 = distinct !{!42}
!43 = !DILocation(line: 29, column: 31, scope: !44)
!44 = distinct !DILexicalBlock(scope: !45, file: !1, line: 26, column: 33)
!45 = distinct !DILexicalBlock(scope: !12, file: !1, line: 26, column: 9)
!46 = !DILocation(line: 30, column: 31, scope: !44)
!47 = distinct !{!47, !48, !"polly.alias.scope.A"}
!48 = distinct !{!48, !"polly.alias.scope.domain"}
!49 = !{!50}
!50 = distinct !{!50, !48, !"polly.alias.scope.B"}
!51 = !{!47}
!52 = !DILocation(line: 36, column: 9, scope: !15)
!53 = !DILocation(line: 44, column: 1, scope: !15)
!54 = distinct !{!54}
!55 = distinct !{!55}
!56 = distinct !{!56, !57, !"polly.alias.scope.C"}
!57 = distinct !{!57, !"polly.alias.scope.domain"}
!58 = !{!59, !60}
!59 = distinct !{!59, !57, !"polly.alias.scope.B"}
!60 = distinct !{!60, !57, !"polly.alias.scope.A"}
!61 = !{!59, !56}
!62 = !{!55, !63}
!63 = distinct !{!63}
!64 = !{!60, !56}
!65 = !DILocation(line: 41, column: 45, scope: !66)
!66 = distinct !DILexicalBlock(scope: !67, file: !1, line: 40, column: 13)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 40, column: 13)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 38, column: 29)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 38, column: 9)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 38, column: 9)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 37, column: 25)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 37, column: 5)
!73 = distinct !DILexicalBlock(scope: !15, file: !1, line: 37, column: 5)
!74 = !DILocation(line: 41, column: 37, scope: !66)
!75 = !DILocation(line: 41, column: 35, scope: !66)
!76 = !DILocation(line: 48, column: 9, scope: !20)
!77 = !DILocation(line: 50, column: 5, scope: !78)
!78 = !DILexicalBlockFile(scope: !79, file: !1, discriminator: 1)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 50, column: 5)
!80 = distinct !DILexicalBlock(scope: !20, file: !1, line: 50, column: 5)
!81 = !DILocation(line: 52, column: 21, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 51, column: 29)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 51, column: 9)
!84 = distinct !DILexicalBlock(scope: !85, file: !1, line: 51, column: 9)
!85 = distinct !DILexicalBlock(scope: !79, file: !1, line: 50, column: 25)
!86 = !{!87, !87, i64 0}
!87 = !{!"any pointer", !88, i64 0}
!88 = !{!"omnipotent char", !89, i64 0}
!89 = !{!"Simple C/C++ TBAA"}
!90 = !DILocation(line: 51, column: 9, scope: !91)
!91 = !DILexicalBlockFile(scope: !83, file: !1, discriminator: 1)
!92 = !DILocation(line: 52, column: 38, scope: !82)
!93 = !{!94, !94, i64 0}
!94 = !{!"long long", !88, i64 0}
!95 = !DILocation(line: 52, column: 13, scope: !82)
!96 = !DILocation(line: 53, column: 18, scope: !97)
!97 = distinct !DILexicalBlock(scope: !82, file: !1, line: 53, column: 17)
!98 = !DILocation(line: 53, column: 22, scope: !97)
!99 = !DILocation(line: 53, column: 17, scope: !82)
!100 = !DILocation(line: 53, column: 37, scope: !101)
!101 = !DILexicalBlockFile(scope: !97, file: !1, discriminator: 1)
!102 = !DILocation(line: 53, column: 29, scope: !101)
!103 = !DILocation(line: 55, column: 9, scope: !85)
!104 = !DILocation(line: 57, column: 1, scope: !20)
!105 = !DILocation(line: 61, column: 5, scope: !24)
!106 = !DILocation(line: 62, column: 5, scope: !24)
!107 = !DILocation(line: 64, column: 5, scope: !24)
!108 = !DILocation(line: 66, column: 19, scope: !24)
!109 = !{!110, !110, i64 0}
!110 = !{!"int", !88, i64 0}
!111 = !DILocation(line: 67, column: 19, scope: !24)
!112 = !DILocation(line: 68, column: 19, scope: !24)
!113 = !DILocation(line: 65, column: 5, scope: !24)
!114 = !DILocation(line: 69, column: 5, scope: !24)
