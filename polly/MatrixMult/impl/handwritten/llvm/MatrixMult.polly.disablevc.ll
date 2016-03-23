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
  %exitcond63 = icmp eq i64 %polly.indvar_next, 63
  br i1 %exitcond63, label %polly.exiting, label %polly.loop_preheader43

polly.loop_header42:                              ; preds = %polly.loop_exit50, %polly.loop_preheader43
  %polly.indvar45 = phi i64 [ 0, %polly.loop_preheader43 ], [ %polly.indvar_next46, %polly.loop_exit50 ]
  %0 = mul nsw i64 %polly.indvar45, -32
  %1 = add nsw i64 %0, 1999
  %2 = icmp sgt i64 %1, 31
  %3 = select i1 %2, i64 31, i64 %1
  %4 = shl nsw i64 %polly.indvar45, 5
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
  br label %polly.loop_header54

polly.loop_exit56:                                ; preds = %polly.loop_header54
  %polly.indvar_next52 = add nuw nsw i64 %polly.indvar51, 1
  %polly.loop_cond53 = icmp sgt i64 %polly.indvar51, %polly.adjust_ub
  br i1 %polly.loop_cond53, label %polly.loop_exit50, label %polly.loop_header48

polly.loop_header54:                              ; preds = %polly.loop_header54, %polly.loop_header48
  %polly.indvar57 = phi i64 [ 0, %polly.loop_header48 ], [ %polly.indvar_next58, %polly.loop_header54 ]
  %12 = add nuw nsw i64 %polly.indvar57, %4
  %scevgep = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %10, i64 %12
  %_p_scalar_ = load i32, i32* %scevgep, align 4, !alias.scope !42, !noalias !44
  %p_add = add nsw i32 %_p_scalar_, %11, !dbg !46
  store i32 %p_add, i32* %scevgep, align 4, !alias.scope !42, !noalias !44
  %scevgep61 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %10, i64 %12
  %_p_scalar_62 = load i32, i32* %scevgep61, align 4, !alias.scope !45, !noalias !49
  %p_add15 = add nsw i32 %_p_scalar_62, %11, !dbg !50
  store i32 %p_add15, i32* %scevgep61, align 4, !alias.scope !45, !noalias !49
  %polly.indvar_next58 = add nuw nsw i64 %polly.indvar57, 1
  %polly.loop_cond60 = icmp sgt i64 %polly.indvar57, %polly.adjust_ub59
  br i1 %polly.loop_cond60, label %polly.loop_exit56, label %polly.loop_header54
}

; Function Attrs: noinline nounwind uwtable
define void @mat_mult() #0 !dbg !15 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !17, metadata !39), !dbg !51
  br label %polly.loop_preheader56

polly.exiting:                                    ; preds = %polly.loop_exit82
  ret void, !dbg !52

polly.loop_exit57:                                ; preds = %polly.loop_exit63
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond124 = icmp eq i64 %polly.indvar_next, 63
  br i1 %exitcond124, label %polly.loop_preheader81.preheader, label %polly.loop_preheader56

polly.loop_preheader81.preheader:                 ; preds = %polly.loop_exit57
  br label %polly.loop_preheader81

polly.loop_header55:                              ; preds = %polly.loop_exit63, %polly.loop_preheader56
  %polly.indvar58 = phi i64 [ 0, %polly.loop_preheader56 ], [ %polly.indvar_next59, %polly.loop_exit63 ]
  %0 = shl i64 %polly.indvar58, 5
  %1 = add nuw nsw i64 %0, -2000
  %2 = icmp sgt i64 %1, -32
  %smax = select i1 %2, i64 %1, i64 -32
  %3 = mul i64 %smax, -8
  br label %polly.loop_header61

polly.loop_exit63:                                ; preds = %polly.loop_header61
  %polly.indvar_next59 = add nuw nsw i64 %polly.indvar58, 1
  %exitcond123 = icmp eq i64 %polly.indvar_next59, 63
  br i1 %exitcond123, label %polly.loop_exit57, label %polly.loop_header55

polly.loop_preheader56:                           ; preds = %polly.loop_exit57, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit57 ]
  %4 = shl i64 %polly.indvar, 5
  %5 = mul nsw i64 %polly.indvar, -32
  %6 = add nsw i64 %5, 1999
  %7 = icmp sgt i64 %6, 31
  %8 = select i1 %7, i64 31, i64 %6
  %polly.adjust_ub = add i64 %8, -1
  br label %polly.loop_header55

polly.loop_header61:                              ; preds = %polly.loop_header61, %polly.loop_header55
  %polly.indvar64 = phi i64 [ 0, %polly.loop_header55 ], [ %polly.indvar_next65, %polly.loop_header61 ]
  %9 = add nuw nsw i64 %4, %polly.indvar64
  %scevgep121 = getelementptr [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %9, i64 %0
  %scevgep121122 = bitcast i64* %scevgep121 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep121122, i8 0, i64 %3, i32 16, i1 false)
  %polly.indvar_next65 = add nuw nsw i64 %polly.indvar64, 1
  %polly.loop_cond66 = icmp sgt i64 %polly.indvar64, %polly.adjust_ub
  br i1 %polly.loop_cond66, label %polly.loop_exit63, label %polly.loop_header61

polly.loop_exit82:                                ; preds = %polly.loop_exit88
  %polly.indvar_next78 = add nuw nsw i64 %polly.indvar77, 1
  %exitcond120 = icmp eq i64 %polly.indvar_next78, 63
  br i1 %exitcond120, label %polly.exiting, label %polly.loop_preheader81

polly.loop_exit88:                                ; preds = %polly.loop_exit94
  %polly.indvar_next84 = add nuw nsw i64 %polly.indvar83, 1
  %exitcond119 = icmp eq i64 %polly.indvar_next84, 63
  br i1 %exitcond119, label %polly.loop_exit82, label %polly.loop_preheader87

polly.loop_preheader81:                           ; preds = %polly.loop_preheader81.preheader, %polly.loop_exit82
  %polly.indvar77 = phi i64 [ %polly.indvar_next78, %polly.loop_exit82 ], [ 0, %polly.loop_preheader81.preheader ]
  %10 = mul nsw i64 %polly.indvar77, -32
  %11 = add nsw i64 %10, 1999
  %12 = icmp sgt i64 %11, 31
  %13 = select i1 %12, i64 31, i64 %11
  %14 = shl nsw i64 %polly.indvar77, 5
  %polly.adjust_ub97 = add i64 %13, -1
  br label %polly.loop_preheader87

polly.loop_header86:                              ; preds = %polly.loop_exit94, %polly.loop_preheader87
  %polly.indvar89 = phi i64 [ 0, %polly.loop_preheader87 ], [ %polly.indvar_next90, %polly.loop_exit94 ]
  %15 = mul nsw i64 %polly.indvar89, -32
  %16 = add nsw i64 %15, 1999
  %17 = icmp sgt i64 %16, 31
  %18 = select i1 %17, i64 31, i64 %16
  %19 = shl nsw i64 %polly.indvar89, 5
  %polly.adjust_ub111 = add i64 %18, -1
  br label %polly.loop_header92

polly.loop_exit94:                                ; preds = %polly.loop_exit101
  %polly.indvar_next90 = add nuw nsw i64 %polly.indvar89, 1
  %exitcond = icmp eq i64 %polly.indvar_next90, 63
  br i1 %exitcond, label %polly.loop_exit88, label %polly.loop_header86

polly.loop_preheader87:                           ; preds = %polly.loop_exit88, %polly.loop_preheader81
  %polly.indvar83 = phi i64 [ 0, %polly.loop_preheader81 ], [ %polly.indvar_next84, %polly.loop_exit88 ]
  %20 = mul nsw i64 %polly.indvar83, -32
  %21 = add nsw i64 %20, 1999
  %22 = icmp sgt i64 %21, 31
  %23 = select i1 %22, i64 31, i64 %21
  %24 = shl nsw i64 %polly.indvar83, 5
  %polly.adjust_ub104 = add i64 %23, -1
  br label %polly.loop_header86

polly.loop_header92:                              ; preds = %polly.loop_exit101, %polly.loop_header86
  %polly.indvar95 = phi i64 [ 0, %polly.loop_header86 ], [ %polly.indvar_next96, %polly.loop_exit101 ]
  %25 = add nuw nsw i64 %polly.indvar95, %14
  br label %polly.loop_header99

polly.loop_exit101:                               ; preds = %polly.loop_exit108
  %polly.indvar_next96 = add nuw nsw i64 %polly.indvar95, 1
  %polly.loop_cond98 = icmp sgt i64 %polly.indvar95, %polly.adjust_ub97
  br i1 %polly.loop_cond98, label %polly.loop_exit94, label %polly.loop_header92

polly.loop_header99:                              ; preds = %polly.loop_exit108, %polly.loop_header92
  %polly.indvar102 = phi i64 [ 0, %polly.loop_header92 ], [ %polly.indvar_next103, %polly.loop_exit108 ]
  %26 = add nuw nsw i64 %polly.indvar102, %24
  %scevgep113 = getelementptr [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %25, i64 %26
  %scevgep113.promoted = load i64, i64* %scevgep113, align 8, !alias.scope !53, !noalias !55
  br label %polly.loop_header106

polly.loop_exit108:                               ; preds = %polly.loop_header106
  %p_add.lcssa = phi i64 [ %p_add, %polly.loop_header106 ]
  store i64 %p_add.lcssa, i64* %scevgep113, align 8, !alias.scope !53, !noalias !55
  %polly.indvar_next103 = add nuw nsw i64 %polly.indvar102, 1
  %polly.loop_cond105 = icmp sgt i64 %polly.indvar102, %polly.adjust_ub104
  br i1 %polly.loop_cond105, label %polly.loop_exit101, label %polly.loop_header99

polly.loop_header106:                             ; preds = %polly.loop_header106, %polly.loop_header99
  %p_add118 = phi i64 [ %scevgep113.promoted, %polly.loop_header99 ], [ %p_add, %polly.loop_header106 ]
  %polly.indvar109 = phi i64 [ 0, %polly.loop_header99 ], [ %polly.indvar_next110, %polly.loop_header106 ]
  %27 = add nuw nsw i64 %polly.indvar109, %19
  %scevgep114 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %25, i64 %27
  %_p_scalar_115 = load i32, i32* %scevgep114, align 4, !alias.scope !56, !noalias !58
  %scevgep116 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %27, i64 %26
  %_p_scalar_117 = load i32, i32* %scevgep116, align 4, !alias.scope !57, !noalias !59
  %p_mul = mul nsw i32 %_p_scalar_117, %_p_scalar_115, !dbg !60
  %p_conv = sext i32 %p_mul to i64, !dbg !69
  %p_add = add nsw i64 %p_conv, %p_add118, !dbg !70
  %polly.indvar_next110 = add nuw nsw i64 %polly.indvar109, 1
  %polly.loop_cond112 = icmp sgt i64 %polly.indvar109, %polly.adjust_ub111
  br i1 %polly.loop_cond112, label %polly.loop_exit108, label %polly.loop_header106
}

; Function Attrs: nounwind uwtable
define void @print_array() #1 !dbg !20 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !22, metadata !39), !dbg !71
  br label %for.cond1.preheader, !dbg !72

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !76, !tbaa !81
  br label %for.body3, !dbg !85

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %indvars.iv24, i64 %indvars.iv, !dbg !87
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !87, !tbaa !88
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2), !dbg !90
  %3 = trunc i64 %indvars.iv to i32, !dbg !91
  %rem = srem i32 %3, 80, !dbg !91
  %cmp6 = icmp eq i32 %rem, 79, !dbg !93
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !94

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !95, !tbaa !81
  %fputc21 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !97
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !85
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !76, !tbaa !81
  %exitcond = icmp eq i64 %indvars.iv.next, 2000, !dbg !85
  br i1 %exitcond, label %for.end, label %for.body3, !dbg !85

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !98
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1, !dbg !72
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 2000, !dbg !72
  br i1 %exitcond26, label %for.end11, label %for.cond1.preheader, !dbg !72

for.end11:                                        ; preds = %for.end
  ret void, !dbg !99
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #1 !dbg !24 {
entry:
  tail call void @init(), !dbg !100
  tail call void @mat_mult(), !dbg !101
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 2000, i32 2000), !dbg !102
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !103, !tbaa !104
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !106, !tbaa !104
  %2 = load i64, i64* getelementptr inbounds ([2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 1999, i64 1999), align 8, !dbg !107, !tbaa !88
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.3, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i64 %2), !dbg !108
  ret i32 0, !dbg !109
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
!42 = distinct !{!42, !43, !"polly.alias.scope.A"}
!43 = distinct !{!43, !"polly.alias.scope.domain"}
!44 = !{!45}
!45 = distinct !{!45, !43, !"polly.alias.scope.B"}
!46 = !DILocation(line: 29, column: 31, scope: !47)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 26, column: 33)
!48 = distinct !DILexicalBlock(scope: !12, file: !1, line: 26, column: 9)
!49 = !{!42}
!50 = !DILocation(line: 30, column: 31, scope: !47)
!51 = !DILocation(line: 36, column: 9, scope: !15)
!52 = !DILocation(line: 44, column: 1, scope: !15)
!53 = distinct !{!53, !54, !"polly.alias.scope.C"}
!54 = distinct !{!54, !"polly.alias.scope.domain"}
!55 = !{!56, !57}
!56 = distinct !{!56, !54, !"polly.alias.scope.A"}
!57 = distinct !{!57, !54, !"polly.alias.scope.B"}
!58 = !{!53, !57}
!59 = !{!53, !56}
!60 = !DILocation(line: 41, column: 45, scope: !61)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 40, column: 13)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 40, column: 13)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 38, column: 29)
!64 = distinct !DILexicalBlock(scope: !65, file: !1, line: 38, column: 9)
!65 = distinct !DILexicalBlock(scope: !66, file: !1, line: 38, column: 9)
!66 = distinct !DILexicalBlock(scope: !67, file: !1, line: 37, column: 25)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 37, column: 5)
!68 = distinct !DILexicalBlock(scope: !15, file: !1, line: 37, column: 5)
!69 = !DILocation(line: 41, column: 37, scope: !61)
!70 = !DILocation(line: 41, column: 35, scope: !61)
!71 = !DILocation(line: 48, column: 9, scope: !20)
!72 = !DILocation(line: 50, column: 5, scope: !73)
!73 = !DILexicalBlockFile(scope: !74, file: !1, discriminator: 1)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 50, column: 5)
!75 = distinct !DILexicalBlock(scope: !20, file: !1, line: 50, column: 5)
!76 = !DILocation(line: 52, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 51, column: 29)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 51, column: 9)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 51, column: 9)
!80 = distinct !DILexicalBlock(scope: !74, file: !1, line: 50, column: 25)
!81 = !{!82, !82, i64 0}
!82 = !{!"any pointer", !83, i64 0}
!83 = !{!"omnipotent char", !84, i64 0}
!84 = !{!"Simple C/C++ TBAA"}
!85 = !DILocation(line: 51, column: 9, scope: !86)
!86 = !DILexicalBlockFile(scope: !78, file: !1, discriminator: 1)
!87 = !DILocation(line: 52, column: 38, scope: !77)
!88 = !{!89, !89, i64 0}
!89 = !{!"long long", !83, i64 0}
!90 = !DILocation(line: 52, column: 13, scope: !77)
!91 = !DILocation(line: 53, column: 18, scope: !92)
!92 = distinct !DILexicalBlock(scope: !77, file: !1, line: 53, column: 17)
!93 = !DILocation(line: 53, column: 22, scope: !92)
!94 = !DILocation(line: 53, column: 17, scope: !77)
!95 = !DILocation(line: 53, column: 37, scope: !96)
!96 = !DILexicalBlockFile(scope: !92, file: !1, discriminator: 1)
!97 = !DILocation(line: 53, column: 29, scope: !96)
!98 = !DILocation(line: 55, column: 9, scope: !80)
!99 = !DILocation(line: 57, column: 1, scope: !20)
!100 = !DILocation(line: 61, column: 5, scope: !24)
!101 = !DILocation(line: 62, column: 5, scope: !24)
!102 = !DILocation(line: 64, column: 5, scope: !24)
!103 = !DILocation(line: 66, column: 19, scope: !24)
!104 = !{!105, !105, i64 0}
!105 = !{!"int", !83, i64 0}
!106 = !DILocation(line: 67, column: 19, scope: !24)
!107 = !DILocation(line: 68, column: 19, scope: !24)
!108 = !DILocation(line: 65, column: 5, scope: !24)
!109 = !DILocation(line: 69, column: 5, scope: !24)
