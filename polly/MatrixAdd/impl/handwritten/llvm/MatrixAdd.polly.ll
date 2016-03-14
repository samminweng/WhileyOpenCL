; ModuleID = 'MatrixAdd.c'
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
  %call = tail call i64 @time(i64* null) #5, !dbg !36
  %conv = trunc i64 %call to i32, !dbg !37
  tail call void @srand(i32 %conv) #5, !dbg !38
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !40), !dbg !41
  br label %for.cond2.preheader, !dbg !42

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !46

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = tail call i32 @rand() #5, !dbg !51
  %rem = srem i32 %call6, 100, !dbg !53
  %arrayidx8 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !54
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !55, !tbaa !56
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !46
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 2000, !dbg !46
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !46

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !42
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 2000, !dbg !42
  br i1 %exitcond72, label %polly.loop_preheader74.preheader, label %for.cond2.preheader, !dbg !42

polly.loop_preheader74.preheader:                 ; preds = %for.inc9
  br label %polly.loop_preheader74

polly.exiting:                                    ; preds = %polly.loop_exit75
  ret void, !dbg !60

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
define void @mat_add() #0 !dbg !13 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !40), !dbg !61
  br label %polly.loop_preheader34

polly.exiting:                                    ; preds = %polly.loop_exit35
  ret void, !dbg !62

polly.loop_exit35:                                ; preds = %polly.loop_exit41
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond55 = icmp eq i64 %polly.indvar_next, 63
  br i1 %exitcond55, label %polly.exiting, label %polly.loop_preheader34

polly.loop_header33:                              ; preds = %polly.loop_exit41, %polly.loop_preheader34
  %polly.indvar36 = phi i64 [ 0, %polly.loop_preheader34 ], [ %polly.indvar_next37, %polly.loop_exit41 ]
  %0 = mul nsw i64 %polly.indvar36, -32
  %1 = add nsw i64 %0, 1999
  %2 = icmp sgt i64 %1, 31
  %3 = select i1 %2, i64 31, i64 %1
  %4 = shl nsw i64 %polly.indvar36, 5
  %polly.adjust_ub50 = add i64 %3, -1
  br label %polly.loop_header39

polly.loop_exit41:                                ; preds = %polly.loop_exit47
  %polly.indvar_next37 = add nuw nsw i64 %polly.indvar36, 1
  %exitcond = icmp eq i64 %polly.indvar_next37, 63
  br i1 %exitcond, label %polly.loop_exit35, label %polly.loop_header33

polly.loop_preheader34:                           ; preds = %polly.loop_exit35, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit35 ]
  %5 = mul nsw i64 %polly.indvar, -32
  %6 = add nsw i64 %5, 1999
  %7 = icmp sgt i64 %6, 31
  %8 = select i1 %7, i64 31, i64 %6
  %9 = shl nsw i64 %polly.indvar, 5
  %polly.adjust_ub = add i64 %8, -1
  br label %polly.loop_header33

polly.loop_header39:                              ; preds = %polly.loop_exit47, %polly.loop_header33
  %polly.indvar42 = phi i64 [ 0, %polly.loop_header33 ], [ %polly.indvar_next43, %polly.loop_exit47 ]
  %10 = add nuw nsw i64 %polly.indvar42, %9
  br label %polly.loop_header45

polly.loop_exit47:                                ; preds = %polly.loop_header45
  %polly.indvar_next43 = add nuw nsw i64 %polly.indvar42, 1
  %polly.loop_cond44 = icmp sgt i64 %polly.indvar42, %polly.adjust_ub
  br i1 %polly.loop_cond44, label %polly.loop_exit41, label %polly.loop_header39

polly.loop_header45:                              ; preds = %polly.loop_header45, %polly.loop_header39
  %polly.indvar48 = phi i64 [ 0, %polly.loop_header39 ], [ %polly.indvar_next49, %polly.loop_header45 ]
  %11 = add nuw nsw i64 %polly.indvar48, %4
  %scevgep = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %10, i64 %11
  %_p_scalar_ = load i32, i32* %scevgep, align 4, !alias.scope !63, !noalias !65
  %scevgep52 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %10, i64 %11
  %_p_scalar_53 = load i32, i32* %scevgep52, align 4, !alias.scope !66, !noalias !68
  %p_add = add nsw i32 %_p_scalar_53, %_p_scalar_, !dbg !69
  %scevgep54 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %10, i64 %11
  store i32 %p_add, i32* %scevgep54, align 4, !alias.scope !67, !noalias !76
  %polly.indvar_next49 = add nuw nsw i64 %polly.indvar48, 1
  %polly.loop_cond51 = icmp sgt i64 %polly.indvar48, %polly.adjust_ub50
  br i1 %polly.loop_cond51, label %polly.loop_exit47, label %polly.loop_header45
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 !dbg !18 {
entry:
  tail call void @init(), !dbg !77
  tail call void @mat_add(), !dbg !78
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 2000, i32 2000), !dbg !79
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !80, !tbaa !56
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !81, !tbaa !56
  %2 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 1999, i64 1999), align 4, !dbg !82, !tbaa !56
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i32 %2), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!33, !34}
!llvm.ident = !{!35}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !25)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !13, !18}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 11, type: !7, isLocal: false, isDefinition: true, scopeLine: 11, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 12, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 13, type: !11)
!13 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 32, type: !7, isLocal: false, isDefinition: true, scopeLine: 32, isOptimized: true, variables: !14)
!14 = !{!15, !16, !17}
!15 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 34, type: !11)
!16 = !DILocalVariable(name: "j", scope: !13, file: !1, line: 34, type: !11)
!17 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 34, type: !11)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 55, type: !19, isLocal: false, isDefinition: true, scopeLine: 56, isOptimized: true, variables: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{!11}
!21 = !{!22, !23, !24}
!22 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 57, type: !11)
!23 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 57, type: !11)
!24 = !DILocalVariable(name: "k", scope: !18, file: !1, line: 57, type: !11)
!25 = !{!26, !30, !31, !32}
!26 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !27, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @A)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128000000, align: 32, elements: !28)
!28 = !{!29, !29}
!29 = !DISubrange(count: 2000)
!30 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !27, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!31 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !27, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @C)
!32 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 6, type: !27, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @R)
!33 = !{i32 2, !"Dwarf Version", i32 4}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!36 = !DILocation(line: 16, column: 22, scope: !6)
!37 = !DILocation(line: 16, column: 11, scope: !6)
!38 = !DILocation(line: 16, column: 5, scope: !39)
!39 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!40 = !DIExpression()
!41 = !DILocation(line: 12, column: 9, scope: !6)
!42 = !DILocation(line: 17, column: 5, scope: !43)
!43 = !DILexicalBlockFile(scope: !44, file: !1, discriminator: 1)
!44 = distinct !DILexicalBlock(scope: !45, file: !1, line: 17, column: 5)
!45 = distinct !DILexicalBlock(scope: !6, file: !1, line: 17, column: 5)
!46 = !DILocation(line: 18, column: 9, scope: !47)
!47 = !DILexicalBlockFile(scope: !48, file: !1, discriminator: 1)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 18, column: 9)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 18, column: 9)
!50 = distinct !DILexicalBlock(scope: !44, file: !1, line: 17, column: 25)
!51 = !DILocation(line: 20, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 18, column: 29)
!53 = !DILocation(line: 20, column: 29, scope: !52)
!54 = !DILocation(line: 20, column: 13, scope: !52)
!55 = !DILocation(line: 20, column: 21, scope: !52)
!56 = !{!57, !57, i64 0}
!57 = !{!"int", !58, i64 0}
!58 = !{!"omnipotent char", !59, i64 0}
!59 = !{!"Simple C/C++ TBAA"}
!60 = !DILocation(line: 30, column: 1, scope: !6)
!61 = !DILocation(line: 34, column: 9, scope: !13)
!62 = !DILocation(line: 40, column: 1, scope: !13)
!63 = distinct !{!63, !64, !"polly.alias.scope.A"}
!64 = distinct !{!64, !"polly.alias.scope.domain"}
!65 = !{!66, !67}
!66 = distinct !{!66, !64, !"polly.alias.scope.B"}
!67 = distinct !{!67, !64, !"polly.alias.scope.C"}
!68 = !{!67, !63}
!69 = !DILocation(line: 37, column: 31, scope: !70)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 36, column: 29)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 36, column: 9)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 36, column: 9)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 35, column: 25)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 35, column: 5)
!75 = distinct !DILexicalBlock(scope: !13, file: !1, line: 35, column: 5)
!76 = !{!66, !63}
!77 = !DILocation(line: 59, column: 5, scope: !18)
!78 = !DILocation(line: 60, column: 5, scope: !18)
!79 = !DILocation(line: 62, column: 5, scope: !18)
!80 = !DILocation(line: 64, column: 19, scope: !18)
!81 = !DILocation(line: 65, column: 19, scope: !18)
!82 = !DILocation(line: 66, column: 19, scope: !18)
!83 = !DILocation(line: 63, column: 5, scope: !18)
!84 = !DILocation(line: 67, column: 5, scope: !18)
