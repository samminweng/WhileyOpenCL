; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@X = common global [512 x [512 x i32]] zeroinitializer, align 16
@Y = common global [512 x [512 x i32]] zeroinitializer, align 16
@Z = common global [512 x [512 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !8, metadata !38), !dbg !39
  br label %for.cond1.preheader, !dbg !40

for.cond1.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv23 = phi i64 [ 0, %entry ], [ %indvars.iv.next24, %for.inc10 ]
  br label %for.body3, !dbg !44

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.3, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv23, i64 %indvars.iv, !dbg !49
  store i32 1, i32* %arrayidx5, align 16, !dbg !51, !tbaa !52
  %arrayidx9 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv23, i64 %indvars.iv, !dbg !56
  store i32 1, i32* %arrayidx9, align 16, !dbg !57, !tbaa !52
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !44
  %arrayidx5.1 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next, !dbg !49
  store i32 1, i32* %arrayidx5.1, align 4, !dbg !51, !tbaa !52
  %arrayidx9.1 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next, !dbg !56
  store i32 1, i32* %arrayidx9.1, align 4, !dbg !57, !tbaa !52
  %indvars.iv.next.1 = or i64 %indvars.iv, 2, !dbg !44
  %arrayidx5.2 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.1, !dbg !49
  store i32 1, i32* %arrayidx5.2, align 8, !dbg !51, !tbaa !52
  %arrayidx9.2 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.1, !dbg !56
  store i32 1, i32* %arrayidx9.2, align 8, !dbg !57, !tbaa !52
  %indvars.iv.next.2 = or i64 %indvars.iv, 3, !dbg !44
  %arrayidx5.3 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.2, !dbg !49
  store i32 1, i32* %arrayidx5.3, align 4, !dbg !51, !tbaa !52
  %arrayidx9.3 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.2, !dbg !56
  store i32 1, i32* %arrayidx9.3, align 4, !dbg !57, !tbaa !52
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4, !dbg !44
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 512, !dbg !44
  br i1 %exitcond.3, label %for.inc10, label %for.body3, !dbg !44

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !40
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 512, !dbg !40
  br i1 %exitcond25, label %for.end12, label %for.cond1.preheader, !dbg !40

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !58
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @main() #3 !dbg !11 {
entry:
  %y_t = alloca [512 x i32], align 16
  tail call void @init(), !dbg !59
  %0 = bitcast [512 x i32]* %y_t to i8*, !dbg !60
  call void @llvm.lifetime.start(i64 2048, i8* %0) #5, !dbg !60
  tail call void @llvm.dbg.declare(metadata [512 x i32]* %y_t, metadata !18, metadata !38), !dbg !61
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !16, metadata !38), !dbg !62
  br label %polly.loop_preheader65

polly.exiting:                                    ; preds = %polly.loop_exit74
  %1 = load i32, i32* getelementptr inbounds ([512 x [512 x i32]], [512 x [512 x i32]]* @Z, i64 0, i64 511, i64 511), align 4, !dbg !63, !tbaa !52
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 512, i32 512, i32 511, i32 511, i32 %1), !dbg !64
  call void @llvm.lifetime.end(i64 2048, i8* nonnull %0) #5, !dbg !65
  ret i32 0, !dbg !66

polly.loop_exit74:                                ; preds = %polly.stmt.for.end22
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond93 = icmp eq i64 %polly.indvar_next, 512
  br i1 %exitcond93, label %polly.exiting, label %polly.loop_preheader65

polly.stmt.for.body3:                             ; preds = %polly.stmt.for.body3, %polly.loop_preheader65
  %polly.indvar67 = phi i64 [ 0, %polly.loop_preheader65 ], [ %polly.indvar_next68.3, %polly.stmt.for.body3 ]
  %2 = shl i64 %polly.indvar67, 9
  %scevgep70 = getelementptr i32, i32* %scevgep, i64 %2
  %_p_scalar_ = load i32, i32* %scevgep70, align 4, !alias.scope !67, !noalias !69, !llvm.mem.parallel_loop_access !75
  %scevgep71 = getelementptr [512 x i32], [512 x i32]* %y_t, i64 0, i64 %polly.indvar67
  store i32 %_p_scalar_, i32* %scevgep71, align 16, !alias.scope !72, !noalias !76, !llvm.mem.parallel_loop_access !75
  %polly.indvar_next68 = or i64 %polly.indvar67, 1
  %3 = shl i64 %polly.indvar_next68, 9
  %scevgep70.1 = getelementptr i32, i32* %scevgep, i64 %3
  %_p_scalar_.1 = load i32, i32* %scevgep70.1, align 4, !alias.scope !67, !noalias !69, !llvm.mem.parallel_loop_access !75
  %scevgep71.1 = getelementptr [512 x i32], [512 x i32]* %y_t, i64 0, i64 %polly.indvar_next68
  store i32 %_p_scalar_.1, i32* %scevgep71.1, align 4, !alias.scope !72, !noalias !76, !llvm.mem.parallel_loop_access !75
  %polly.indvar_next68.1 = or i64 %polly.indvar67, 2
  %4 = shl i64 %polly.indvar_next68.1, 9
  %scevgep70.2 = getelementptr i32, i32* %scevgep, i64 %4
  %_p_scalar_.2 = load i32, i32* %scevgep70.2, align 4, !alias.scope !67, !noalias !69, !llvm.mem.parallel_loop_access !75
  %scevgep71.2 = getelementptr [512 x i32], [512 x i32]* %y_t, i64 0, i64 %polly.indvar_next68.1
  store i32 %_p_scalar_.2, i32* %scevgep71.2, align 8, !alias.scope !72, !noalias !76, !llvm.mem.parallel_loop_access !75
  %polly.indvar_next68.2 = or i64 %polly.indvar67, 3
  %5 = shl i64 %polly.indvar_next68.2, 9
  %scevgep70.3 = getelementptr i32, i32* %scevgep, i64 %5
  %_p_scalar_.3 = load i32, i32* %scevgep70.3, align 4, !alias.scope !67, !noalias !69, !llvm.mem.parallel_loop_access !75
  %scevgep71.3 = getelementptr [512 x i32], [512 x i32]* %y_t, i64 0, i64 %polly.indvar_next68.2
  store i32 %_p_scalar_.3, i32* %scevgep71.3, align 4, !alias.scope !72, !noalias !76, !llvm.mem.parallel_loop_access !75
  %polly.indvar_next68.3 = add nsw i64 %polly.indvar67, 4
  %exitcond.3 = icmp eq i64 %polly.indvar_next68.3, 512
  br i1 %exitcond.3, label %polly.loop_preheader73, label %polly.stmt.for.body3, !llvm.loop !75

polly.loop_preheader65:                           ; preds = %polly.loop_exit74, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit74 ]
  %scevgep = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 0, i64 %polly.indvar
  br label %polly.stmt.for.body3

polly.stmt.for.end22:                             ; preds = %polly.stmt.for.body13
  %p_add.3.lcssa = phi i32 [ %p_add.3, %polly.stmt.for.body13 ]
  %6 = shl i64 %polly.indvar75, 9
  %scevgep90 = getelementptr i32, i32* %scevgep89, i64 %6
  store i32 %p_add.3.lcssa, i32* %scevgep90, align 4, !alias.scope !70, !noalias !77
  %polly.indvar_next76 = add nuw nsw i64 %polly.indvar75, 1
  %exitcond92 = icmp eq i64 %polly.indvar_next76, 512
  br i1 %exitcond92, label %polly.loop_exit74, label %polly.loop_preheader79

polly.loop_preheader73:                           ; preds = %polly.stmt.for.body3
  %scevgep89 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @Z, i64 0, i64 0, i64 %polly.indvar
  br label %polly.loop_preheader79

polly.stmt.for.body13:                            ; preds = %polly.stmt.for.body13, %polly.loop_preheader79
  %sum.052.phiops.0 = phi i32 [ 0, %polly.loop_preheader79 ], [ %p_add.3, %polly.stmt.for.body13 ]
  %polly.indvar81 = phi i64 [ 0, %polly.loop_preheader79 ], [ %polly.indvar_next82.3, %polly.stmt.for.body13 ]
  %scevgep85 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %polly.indvar75, i64 %polly.indvar81
  %_p_scalar_86 = load i32, i32* %scevgep85, align 16, !alias.scope !73, !noalias !78
  %scevgep87 = getelementptr [512 x i32], [512 x i32]* %y_t, i64 0, i64 %polly.indvar81
  %_p_scalar_88 = load i32, i32* %scevgep87, align 16, !alias.scope !72, !noalias !76
  %p_mul = mul nsw i32 %_p_scalar_88, %_p_scalar_86, !dbg !79
  %p_add = add nsw i32 %p_mul, %sum.052.phiops.0, !dbg !83
  %polly.indvar_next82 = or i64 %polly.indvar81, 1
  %scevgep85.1 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %polly.indvar75, i64 %polly.indvar_next82
  %_p_scalar_86.1 = load i32, i32* %scevgep85.1, align 4, !alias.scope !73, !noalias !78
  %scevgep87.1 = getelementptr [512 x i32], [512 x i32]* %y_t, i64 0, i64 %polly.indvar_next82
  %_p_scalar_88.1 = load i32, i32* %scevgep87.1, align 4, !alias.scope !72, !noalias !76
  %p_mul.1 = mul nsw i32 %_p_scalar_88.1, %_p_scalar_86.1, !dbg !79
  %p_add.1 = add nsw i32 %p_mul.1, %p_add, !dbg !83
  %polly.indvar_next82.1 = or i64 %polly.indvar81, 2
  %scevgep85.2 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %polly.indvar75, i64 %polly.indvar_next82.1
  %_p_scalar_86.2 = load i32, i32* %scevgep85.2, align 8, !alias.scope !73, !noalias !78
  %scevgep87.2 = getelementptr [512 x i32], [512 x i32]* %y_t, i64 0, i64 %polly.indvar_next82.1
  %_p_scalar_88.2 = load i32, i32* %scevgep87.2, align 8, !alias.scope !72, !noalias !76
  %p_mul.2 = mul nsw i32 %_p_scalar_88.2, %_p_scalar_86.2, !dbg !79
  %p_add.2 = add nsw i32 %p_mul.2, %p_add.1, !dbg !83
  %polly.indvar_next82.2 = or i64 %polly.indvar81, 3
  %scevgep85.3 = getelementptr [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %polly.indvar75, i64 %polly.indvar_next82.2
  %_p_scalar_86.3 = load i32, i32* %scevgep85.3, align 4, !alias.scope !73, !noalias !78
  %scevgep87.3 = getelementptr [512 x i32], [512 x i32]* %y_t, i64 0, i64 %polly.indvar_next82.2
  %_p_scalar_88.3 = load i32, i32* %scevgep87.3, align 4, !alias.scope !72, !noalias !76
  %p_mul.3 = mul nsw i32 %_p_scalar_88.3, %_p_scalar_86.3, !dbg !79
  %p_add.3 = add nsw i32 %p_mul.3, %p_add.2, !dbg !83
  %polly.indvar_next82.3 = add nsw i64 %polly.indvar81, 4
  %exitcond91.3 = icmp eq i64 %polly.indvar_next82.3, 512
  br i1 %exitcond91.3, label %polly.stmt.for.end22, label %polly.stmt.for.body13

polly.loop_preheader79:                           ; preds = %polly.stmt.for.end22, %polly.loop_preheader73
  %polly.indvar75 = phi i64 [ 0, %polly.loop_preheader73 ], [ %polly.indvar_next76, %polly.stmt.for.end22 ]
  br label %polly.stmt.for.body13
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!35, !36}
!llvm.ident = !{!37}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !29)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten3")
!2 = !{}
!3 = !{!4, !11}
!4 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 9, type: !5, isLocal: false, isDefinition: true, scopeLine: 9, isOptimized: true, variables: !7)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = !{!8, !10}
!8 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 10, type: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "j", scope: !4, file: !1, line: 10, type: !9)
!11 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 61, type: !12, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: true, variables: !14)
!12 = !DISubroutineType(types: !13)
!13 = !{!9}
!14 = !{!15, !16, !17, !18, !22}
!15 = !DILocalVariable(name: "i", scope: !11, file: !1, line: 62, type: !9)
!16 = !DILocalVariable(name: "j", scope: !11, file: !1, line: 62, type: !9)
!17 = !DILocalVariable(name: "k", scope: !11, file: !1, line: 62, type: !9)
!18 = !DILocalVariable(name: "y_t", scope: !11, file: !1, line: 64, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 16384, align: 32, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 512)
!22 = !DILocalVariable(name: "sum", scope: !23, file: !1, line: 75, type: !9)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 74, column: 27)
!24 = distinct !DILexicalBlock(scope: !25, file: !1, line: 74, column: 3)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 74, column: 3)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 68, column: 26)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 68, column: 2)
!28 = distinct !DILexicalBlock(scope: !11, file: !1, line: 68, column: 2)
!29 = !{!30, !33, !34}
!30 = !DIGlobalVariable(name: "X", scope: !0, file: !1, line: 4, type: !31, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @X)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 8388608, align: 32, elements: !32)
!32 = !{!21, !21}
!33 = !DIGlobalVariable(name: "Y", scope: !0, file: !1, line: 5, type: !31, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @Y)
!34 = !DIGlobalVariable(name: "Z", scope: !0, file: !1, line: 6, type: !31, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @Z)
!35 = !{i32 2, !"Dwarf Version", i32 4}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!38 = !DIExpression()
!39 = !DILocation(line: 10, column: 6, scope: !4)
!40 = !DILocation(line: 11, column: 2, scope: !41)
!41 = !DILexicalBlockFile(scope: !42, file: !1, discriminator: 1)
!42 = distinct !DILexicalBlock(scope: !43, file: !1, line: 11, column: 2)
!43 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 2)
!44 = !DILocation(line: 12, column: 3, scope: !45)
!45 = !DILexicalBlockFile(scope: !46, file: !1, discriminator: 1)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 12, column: 3)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 12, column: 3)
!48 = distinct !DILexicalBlock(scope: !42, file: !1, line: 11, column: 22)
!49 = !DILocation(line: 13, column: 4, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 12, column: 23)
!51 = !DILocation(line: 13, column: 12, scope: !50)
!52 = !{!53, !53, i64 0}
!53 = !{!"int", !54, i64 0}
!54 = !{!"omnipotent char", !55, i64 0}
!55 = !{!"Simple C/C++ TBAA"}
!56 = !DILocation(line: 14, column: 4, scope: !50)
!57 = !DILocation(line: 14, column: 12, scope: !50)
!58 = !DILocation(line: 17, column: 1, scope: !4)
!59 = !DILocation(line: 63, column: 2, scope: !11)
!60 = !DILocation(line: 64, column: 2, scope: !11)
!61 = !DILocation(line: 64, column: 6, scope: !11)
!62 = !DILocation(line: 62, column: 8, scope: !11)
!63 = !DILocation(line: 82, column: 75, scope: !11)
!64 = !DILocation(line: 82, column: 2, scope: !11)
!65 = !DILocation(line: 86, column: 1, scope: !11)
!66 = !DILocation(line: 84, column: 5, scope: !11)
!67 = distinct !{!67, !68, !"polly.alias.scope.Y"}
!68 = distinct !{!68, !"polly.alias.scope.domain"}
!69 = !{!70, !71, !72, !73, !74}
!70 = distinct !{!70, !68, !"polly.alias.scope.Z"}
!71 = distinct !{!71, !68, !"polly.alias.scope.sum.052"}
!72 = distinct !{!72, !68, !"polly.alias.scope.y_t"}
!73 = distinct !{!73, !68, !"polly.alias.scope.X"}
!74 = distinct !{!74, !68, !"polly.alias.scope.add.lcssa"}
!75 = distinct !{!75}
!76 = !{!70, !67, !71, !73, !74}
!77 = !{!67, !71, !72, !73, !74}
!78 = !{!70, !67, !71, !72, !74}
!79 = !DILocation(line: 77, column: 24, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 76, column: 20)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 76, column: 4)
!82 = distinct !DILexicalBlock(scope: !23, file: !1, line: 76, column: 4)
!83 = !DILocation(line: 77, column: 15, scope: !80)
