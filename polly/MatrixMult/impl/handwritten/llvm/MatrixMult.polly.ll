; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@R = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@A = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@B = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@C = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.1 = private unnamed_addr constant [47 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !6 {
entry:
  %call = tail call i64 @time(i64* null) #5, !dbg !35
  %conv = trunc i64 %call to i32, !dbg !36
  tail call void @srand(i32 %conv) #5, !dbg !37
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !39), !dbg !40
  br label %for.cond2.preheader, !dbg !41

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !45

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = tail call i32 @rand() #5, !dbg !50
  %rem = srem i32 %call6, 10, !dbg !52
  %arrayidx8 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !53
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !54, !tbaa !55
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !45
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 2000, !dbg !45
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !45

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !41
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 2000, !dbg !41
  br i1 %exitcond72, label %polly.loop_preheader74.preheader, label %for.cond2.preheader, !dbg !41

polly.loop_preheader74.preheader:                 ; preds = %for.inc9
  br label %polly.loop_preheader74

polly.exiting:                                    ; preds = %polly.loop_exit75
  ret void, !dbg !59

polly.loop_exit75:                                ; preds = %polly.loop_exit81
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond103 = icmp eq i64 %polly.indvar_next, 63
  br i1 %exitcond103, label %polly.exiting, label %polly.loop_preheader74

polly.loop_header73:                              ; preds = %polly.loop_exit81, %polly.loop_preheader74
  %polly.indvar76 = phi i64 [ 0, %polly.loop_preheader74 ], [ %polly.indvar_next77, %polly.loop_exit81 ]
  %0 = shl i64 %polly.indvar76, 5
  %1 = add nuw nsw i64 %0, -2000
  %2 = icmp sgt i64 %1, -32
  %smax102 = select i1 %2, i64 %1, i64 -32
  %3 = mul i64 %smax102, -4
  br label %polly.loop_header79

polly.loop_exit81:                                ; preds = %polly.loop_header79
  %polly.indvar_next77 = add nuw nsw i64 %polly.indvar76, 1
  %exitcond = icmp eq i64 %polly.indvar_next77, 63
  br i1 %exitcond, label %polly.loop_exit75, label %polly.loop_header73

polly.loop_preheader74:                           ; preds = %polly.loop_preheader74.preheader, %polly.loop_exit75
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit75 ], [ 0, %polly.loop_preheader74.preheader ]
  %4 = shl i64 %polly.indvar, 5
  %5 = mul nsw i64 %polly.indvar, -32
  %6 = add nsw i64 %5, 1999
  %7 = icmp sgt i64 %6, 31
  %8 = select i1 %7, i64 31, i64 %6
  %polly.adjust_ub = add i64 %8, -1
  br label %polly.loop_header73

polly.loop_header79:                              ; preds = %polly.loop_header79, %polly.loop_header73
  %polly.indvar82 = phi i64 [ 0, %polly.loop_header73 ], [ %polly.indvar_next83, %polly.loop_header79 ]
  %9 = add nuw nsw i64 %4, %polly.indvar82
  %scevgep98 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %9, i64 %0
  %scevgep9899 = bitcast i32* %scevgep98 to i8*
  %scevgep100 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %9, i64 %0
  %scevgep100101 = bitcast i32* %scevgep100 to i8*
  %scevgep94 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %9, i64 %0
  %scevgep9495 = bitcast i32* %scevgep94 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep9495, i8* %scevgep100101, i64 %3, i32 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep9899, i8* %scevgep100101, i64 %3, i32 16, i1 false)
  %polly.indvar_next83 = add nuw nsw i64 %polly.indvar82, 1
  %polly.loop_cond84 = icmp sgt i64 %polly.indvar82, %polly.adjust_ub
  br i1 %polly.loop_cond84, label %polly.loop_exit81, label %polly.loop_header79
}

; Function Attrs: nounwind
declare void @srand(i32) #1

; Function Attrs: nounwind
declare i64 @time(i64*) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind uwtable
define void @mat_mult() #0 !dbg !13 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !39), !dbg !60
  br label %polly.loop_preheader56

polly.exiting:                                    ; preds = %polly.loop_exit82
  ret void, !dbg !61

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
  %3 = mul i64 %smax, -4
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
  %scevgep121 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %9, i64 %0
  %scevgep121122 = bitcast i32* %scevgep121 to i8*
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
  %scevgep113 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %25, i64 %26
  %scevgep113.promoted = load i32, i32* %scevgep113, align 4, !alias.scope !62, !noalias !64
  br label %polly.loop_header106

polly.loop_exit108:                               ; preds = %polly.loop_header106
  %p_add.lcssa = phi i32 [ %p_add, %polly.loop_header106 ]
  store i32 %p_add.lcssa, i32* %scevgep113, align 4, !alias.scope !62, !noalias !64
  %polly.indvar_next103 = add nuw nsw i64 %polly.indvar102, 1
  %polly.loop_cond105 = icmp sgt i64 %polly.indvar102, %polly.adjust_ub104
  br i1 %polly.loop_cond105, label %polly.loop_exit101, label %polly.loop_header99

polly.loop_header106:                             ; preds = %polly.loop_header106, %polly.loop_header99
  %p_add118 = phi i32 [ %scevgep113.promoted, %polly.loop_header99 ], [ %p_add, %polly.loop_header106 ]
  %polly.indvar109 = phi i64 [ 0, %polly.loop_header99 ], [ %polly.indvar_next110, %polly.loop_header106 ]
  %27 = add nuw nsw i64 %polly.indvar109, %19
  %scevgep114 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %25, i64 %27
  %_p_scalar_115 = load i32, i32* %scevgep114, align 4, !alias.scope !66, !noalias !67
  %scevgep116 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %27, i64 %26
  %_p_scalar_117 = load i32, i32* %scevgep116, align 4, !alias.scope !65, !noalias !68
  %p_mul = mul nsw i32 %_p_scalar_117, %_p_scalar_115, !dbg !69
  %p_add = add nsw i32 %p_mul, %p_add118, !dbg !78
  %polly.indvar_next110 = add nuw nsw i64 %polly.indvar109, 1
  %polly.loop_cond112 = icmp sgt i64 %polly.indvar109, %polly.adjust_ub111
  br i1 %polly.loop_cond112, label %polly.loop_exit108, label %polly.loop_header106
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 !dbg !18 {
entry:
  tail call void @init(), !dbg !79
  tail call void @mat_mult(), !dbg !80
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 2000, i32 2000), !dbg !81
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !82, !tbaa !55
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !83, !tbaa !55
  %2 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 1999, i64 1999), align 4, !dbg !84, !tbaa !55
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i32 %2), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!32, !33}
!llvm.ident = !{!34}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !24)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !13, !18}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !7, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 13, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 14, type: !11)
!13 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 33, type: !7, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: true, variables: !14)
!14 = !{!15, !16, !17}
!15 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 34, type: !11)
!16 = !DILocalVariable(name: "j", scope: !13, file: !1, line: 34, type: !11)
!17 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 34, type: !11)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 57, type: !19, isLocal: false, isDefinition: true, scopeLine: 58, isOptimized: true, variables: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{!11}
!21 = !{!22, !23}
!22 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 59, type: !11)
!23 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 59, type: !11)
!24 = !{!25, !29, !30, !31}
!25 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 7, type: !26, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @A)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128000000, align: 32, elements: !27)
!27 = !{!28, !28}
!28 = !DISubrange(count: 2000)
!29 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 8, type: !26, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!30 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 9, type: !26, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @C)
!31 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 10, type: !26, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @R)
!32 = !{i32 2, !"Dwarf Version", i32 4}
!33 = !{i32 2, !"Debug Info Version", i32 3}
!34 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!35 = !DILocation(line: 17, column: 22, scope: !6)
!36 = !DILocation(line: 17, column: 11, scope: !6)
!37 = !DILocation(line: 17, column: 5, scope: !38)
!38 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!39 = !DIExpression()
!40 = !DILocation(line: 13, column: 9, scope: !6)
!41 = !DILocation(line: 18, column: 5, scope: !42)
!42 = !DILexicalBlockFile(scope: !43, file: !1, discriminator: 1)
!43 = distinct !DILexicalBlock(scope: !44, file: !1, line: 18, column: 5)
!44 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 5)
!45 = !DILocation(line: 19, column: 9, scope: !46)
!46 = !DILexicalBlockFile(scope: !47, file: !1, discriminator: 1)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 19, column: 9)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 19, column: 9)
!49 = distinct !DILexicalBlock(scope: !43, file: !1, line: 18, column: 25)
!50 = !DILocation(line: 21, column: 23, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 19, column: 29)
!52 = !DILocation(line: 21, column: 29, scope: !51)
!53 = !DILocation(line: 21, column: 13, scope: !51)
!54 = !DILocation(line: 21, column: 21, scope: !51)
!55 = !{!56, !56, i64 0}
!56 = !{!"int", !57, i64 0}
!57 = !{!"omnipotent char", !58, i64 0}
!58 = !{!"Simple C/C++ TBAA"}
!59 = !DILocation(line: 31, column: 1, scope: !6)
!60 = !DILocation(line: 34, column: 9, scope: !13)
!61 = !DILocation(line: 42, column: 1, scope: !13)
!62 = distinct !{!62, !63, !"polly.alias.scope.C"}
!63 = distinct !{!63, !"polly.alias.scope.domain"}
!64 = !{!65, !66}
!65 = distinct !{!65, !63, !"polly.alias.scope.B"}
!66 = distinct !{!66, !63, !"polly.alias.scope.A"}
!67 = !{!65, !62}
!68 = !{!66, !62}
!69 = !DILocation(line: 39, column: 45, scope: !70)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 38, column: 13)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 38, column: 13)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 36, column: 29)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 36, column: 9)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 36, column: 9)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 35, column: 25)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 35, column: 5)
!77 = distinct !DILexicalBlock(scope: !13, file: !1, line: 35, column: 5)
!78 = !DILocation(line: 39, column: 35, scope: !70)
!79 = !DILocation(line: 60, column: 5, scope: !18)
!80 = !DILocation(line: 61, column: 5, scope: !18)
!81 = !DILocation(line: 63, column: 5, scope: !18)
!82 = !DILocation(line: 65, column: 19, scope: !18)
!83 = !DILocation(line: 66, column: 19, scope: !18)
!84 = !DILocation(line: 67, column: 19, scope: !18)
!85 = !DILocation(line: 64, column: 5, scope: !18)
!86 = !DILocation(line: 68, column: 5, scope: !18)
