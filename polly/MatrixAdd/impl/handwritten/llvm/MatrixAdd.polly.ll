; ModuleID = 'MatrixAdd.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@R = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@A = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@B = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@C = common global [8000 x [8000 x i32]] zeroinitializer, align 16
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
  %arrayidx8 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !54
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !55, !tbaa !56
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !46
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 8000, !dbg !46
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !46

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !42
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 8000, !dbg !42
  br i1 %exitcond72, label %polly.loop_preheader74.preheader, label %for.cond2.preheader, !dbg !42

polly.loop_preheader74.preheader:                 ; preds = %for.inc9
  br label %polly.loop_preheader74

polly.exiting:                                    ; preds = %polly.loop_exit75
  ret void, !dbg !60

polly.loop_exit75:                                ; preds = %polly.loop_exit81
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond99 = icmp eq i64 %polly.indvar_next, 250
  br i1 %exitcond99, label %polly.exiting, label %polly.loop_preheader74

polly.loop_exit81:                                ; preds = %polly.loop_exit87
  %polly.indvar_next77 = add nuw nsw i64 %polly.indvar76, 1
  %exitcond98 = icmp eq i64 %polly.indvar_next77, 250
  br i1 %exitcond98, label %polly.loop_exit75, label %polly.loop_preheader80

polly.loop_preheader74:                           ; preds = %polly.loop_preheader74.preheader, %polly.loop_exit75
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit75 ], [ 0, %polly.loop_preheader74.preheader ]
  %0 = shl i64 %polly.indvar, 5
  br label %polly.loop_preheader80

polly.loop_exit87:                                ; preds = %polly.loop_header85
  %polly.indvar_next83 = add nuw nsw i64 %polly.indvar82, 1
  %exitcond97 = icmp eq i64 %polly.indvar_next83, 32
  br i1 %exitcond97, label %polly.loop_exit81, label %polly.loop_preheader86

polly.loop_preheader80:                           ; preds = %polly.loop_exit81, %polly.loop_preheader74
  %polly.indvar76 = phi i64 [ 0, %polly.loop_preheader74 ], [ %polly.indvar_next77, %polly.loop_exit81 ]
  %1 = shl i64 %polly.indvar76, 5
  br label %polly.loop_preheader86

polly.loop_header85:                              ; preds = %polly.loop_header85, %polly.loop_preheader86
  %polly.indvar88 = phi i64 [ 0, %polly.loop_preheader86 ], [ %polly.indvar_next89.1, %polly.loop_header85 ]
  %2 = add nuw nsw i64 %polly.indvar88, %1
  %scevgep = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %4, i64 %2
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !61, !noalias !63
  %p_sub = sub nsw i32 100, %_p_scalar_, !dbg !66
  %scevgep92 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %4, i64 %2
  store i32 %p_sub, i32* %scevgep92, align 8, !alias.scope !64, !noalias !73
  %polly.indvar_next89 = or i64 %polly.indvar88, 1
  %3 = add nuw nsw i64 %polly.indvar_next89, %1
  %scevgep.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %4, i64 %3
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !61, !noalias !63
  %p_sub.1 = sub nsw i32 100, %_p_scalar_.1, !dbg !66
  %scevgep92.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %4, i64 %3
  store i32 %p_sub.1, i32* %scevgep92.1, align 4, !alias.scope !64, !noalias !73
  %polly.indvar_next89.1 = add nsw i64 %polly.indvar88, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next89.1, 32
  br i1 %exitcond.1, label %polly.loop_exit87, label %polly.loop_header85

polly.loop_preheader86:                           ; preds = %polly.loop_exit87, %polly.loop_preheader80
  %polly.indvar82 = phi i64 [ 0, %polly.loop_preheader80 ], [ %polly.indvar_next83, %polly.loop_exit87 ]
  %4 = add nuw nsw i64 %0, %polly.indvar82
  %scevgep93 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %4, i64 %1
  %scevgep9394 = bitcast i32* %scevgep93 to i8*
  %scevgep95 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %4, i64 %1
  %scevgep9596 = bitcast i32* %scevgep95 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep9394, i8* %scevgep9596, i64 128, i32 16, i1 false)
  br label %polly.loop_header85
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
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !40), !dbg !74
  br label %polly.loop_preheader34

polly.exiting:                                    ; preds = %polly.loop_exit35
  ret void, !dbg !75

polly.loop_exit35:                                ; preds = %polly.loop_exit41
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond56 = icmp eq i64 %polly.indvar_next, 250
  br i1 %exitcond56, label %polly.exiting, label %polly.loop_preheader34

polly.loop_exit41:                                ; preds = %polly.loop_exit47
  %polly.indvar_next37 = add nuw nsw i64 %polly.indvar36, 1
  %exitcond55 = icmp eq i64 %polly.indvar_next37, 250
  br i1 %exitcond55, label %polly.loop_exit35, label %polly.loop_preheader40

polly.loop_preheader34:                           ; preds = %polly.loop_exit35, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit35 ]
  %0 = shl nsw i64 %polly.indvar, 5
  br label %polly.loop_preheader40

polly.loop_exit47:                                ; preds = %polly.loop_header45
  %polly.indvar_next43 = add nuw nsw i64 %polly.indvar42, 1
  %exitcond54 = icmp eq i64 %polly.indvar_next43, 32
  br i1 %exitcond54, label %polly.loop_exit41, label %polly.loop_preheader46

polly.loop_preheader40:                           ; preds = %polly.loop_exit41, %polly.loop_preheader34
  %polly.indvar36 = phi i64 [ 0, %polly.loop_preheader34 ], [ %polly.indvar_next37, %polly.loop_exit41 ]
  %1 = shl nsw i64 %polly.indvar36, 5
  br label %polly.loop_preheader46

polly.loop_header45:                              ; preds = %polly.loop_header45, %polly.loop_preheader46
  %polly.indvar48 = phi i64 [ 0, %polly.loop_preheader46 ], [ %polly.indvar_next49.1, %polly.loop_header45 ]
  %2 = add nuw nsw i64 %polly.indvar48, %1
  %scevgep = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %4, i64 %2
  %_p_scalar_ = load i32, i32* %scevgep, align 8, !alias.scope !76, !noalias !78
  %scevgep51 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %4, i64 %2
  %_p_scalar_52 = load i32, i32* %scevgep51, align 8, !alias.scope !80, !noalias !81
  %p_add = add nsw i32 %_p_scalar_52, %_p_scalar_, !dbg !82
  %scevgep53 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %4, i64 %2
  store i32 %p_add, i32* %scevgep53, align 8, !alias.scope !79, !noalias !89
  %polly.indvar_next49 = or i64 %polly.indvar48, 1
  %3 = add nuw nsw i64 %polly.indvar_next49, %1
  %scevgep.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %4, i64 %3
  %_p_scalar_.1 = load i32, i32* %scevgep.1, align 4, !alias.scope !76, !noalias !78
  %scevgep51.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %4, i64 %3
  %_p_scalar_52.1 = load i32, i32* %scevgep51.1, align 4, !alias.scope !80, !noalias !81
  %p_add.1 = add nsw i32 %_p_scalar_52.1, %_p_scalar_.1, !dbg !82
  %scevgep53.1 = getelementptr [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %4, i64 %3
  store i32 %p_add.1, i32* %scevgep53.1, align 4, !alias.scope !79, !noalias !89
  %polly.indvar_next49.1 = add nsw i64 %polly.indvar48, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next49.1, 32
  br i1 %exitcond.1, label %polly.loop_exit47, label %polly.loop_header45

polly.loop_preheader46:                           ; preds = %polly.loop_exit47, %polly.loop_preheader40
  %polly.indvar42 = phi i64 [ 0, %polly.loop_preheader40 ], [ %polly.indvar_next43, %polly.loop_exit47 ]
  %4 = add nuw nsw i64 %polly.indvar42, %0
  br label %polly.loop_header45
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 !dbg !18 {
entry:
  tail call void @init(), !dbg !90
  tail call void @mat_add(), !dbg !91
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 8000, i32 8000), !dbg !92
  %0 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 7999, i64 7999), align 4, !dbg !93, !tbaa !56
  %1 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 7999, i64 7999), align 4, !dbg !94, !tbaa !56
  %2 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 7999, i64 7999), align 4, !dbg !95, !tbaa !56
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 7999, i32 7999, i32 %0, i32 7999, i32 7999, i32 %1, i32 7999, i32 7999, i32 %2), !dbg !96
  ret i32 0, !dbg !97
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
!26 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !27, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @A)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 2048000000, align: 32, elements: !28)
!28 = !{!29, !29}
!29 = !DISubrange(count: 8000)
!30 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !27, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @B)
!31 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !27, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @C)
!32 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 6, type: !27, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @R)
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
!61 = distinct !{!61, !62, !"polly.alias.scope.R"}
!62 = distinct !{!62, !"polly.alias.scope.domain"}
!63 = !{!64, !65}
!64 = distinct !{!64, !62, !"polly.alias.scope.B"}
!65 = distinct !{!65, !62, !"polly.alias.scope.A"}
!66 = !DILocation(line: 27, column: 27, scope: !67)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 25, column: 29)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 25, column: 9)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 25, column: 9)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 24, column: 25)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 24, column: 5)
!72 = distinct !DILexicalBlock(scope: !6, file: !1, line: 24, column: 5)
!73 = !{!61, !65}
!74 = !DILocation(line: 34, column: 9, scope: !13)
!75 = !DILocation(line: 40, column: 1, scope: !13)
!76 = distinct !{!76, !77, !"polly.alias.scope.A"}
!77 = distinct !{!77, !"polly.alias.scope.domain"}
!78 = !{!79, !80}
!79 = distinct !{!79, !77, !"polly.alias.scope.C"}
!80 = distinct !{!80, !77, !"polly.alias.scope.B"}
!81 = !{!79, !76}
!82 = !DILocation(line: 37, column: 31, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 36, column: 29)
!84 = distinct !DILexicalBlock(scope: !85, file: !1, line: 36, column: 9)
!85 = distinct !DILexicalBlock(scope: !86, file: !1, line: 36, column: 9)
!86 = distinct !DILexicalBlock(scope: !87, file: !1, line: 35, column: 25)
!87 = distinct !DILexicalBlock(scope: !88, file: !1, line: 35, column: 5)
!88 = distinct !DILexicalBlock(scope: !13, file: !1, line: 35, column: 5)
!89 = !{!80, !76}
!90 = !DILocation(line: 59, column: 5, scope: !18)
!91 = !DILocation(line: 60, column: 5, scope: !18)
!92 = !DILocation(line: 62, column: 5, scope: !18)
!93 = !DILocation(line: 64, column: 19, scope: !18)
!94 = !DILocation(line: 65, column: 19, scope: !18)
!95 = !DILocation(line: 66, column: 19, scope: !18)
!96 = !DILocation(line: 63, column: 5, scope: !18)
!97 = !DILocation(line: 67, column: 5, scope: !18)
