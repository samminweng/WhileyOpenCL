; ModuleID = 'MatrixMult.preopt.s'
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
  br label %entry.split, !dbg !25

entry.split:                                      ; preds = %entry
  %call = tail call i64 @time(i64* null) #5, !dbg !25
  %conv = trunc i64 %call to i32, !dbg !26
  tail call void @srand(i32 %conv) #5, !dbg !27
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !29, metadata !30), !dbg !31
  br label %for.cond2.preheader, !dbg !32

for.cond2.preheader:                              ; preds = %entry.split, %for.inc9
  %indvars.iv11 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next12, %for.inc9 ]
  br label %for.body5, !dbg !36

for.cond12.preheader:                             ; preds = %for.inc9
  br label %for.cond16.preheader, !dbg !41

for.body5:                                        ; preds = %for.cond2.preheader, %for.body5
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next9, %for.body5 ]
  %call6 = tail call i32 @rand() #5, !dbg !45
  %rem = srem i32 %call6, 10, !dbg !47
  %arrayidx8 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %indvars.iv11, i64 %indvars.iv8, !dbg !48
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !49
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !36
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !50, metadata !30), !dbg !51
  %exitcond10 = icmp ne i64 %indvars.iv.next9, 2000, !dbg !36
  br i1 %exitcond10, label %for.body5, label %for.inc9, !dbg !36

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !32
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !29, metadata !30), !dbg !31
  %exitcond13 = icmp ne i64 %indvars.iv.next12, 2000, !dbg !32
  br i1 %exitcond13, label %for.cond2.preheader, label %for.cond12.preheader, !dbg !32

for.cond16.preheader:                             ; preds = %for.cond12.preheader, %for.inc39
  %indvars.iv5 = phi i64 [ 0, %for.cond12.preheader ], [ %indvars.iv.next6, %for.inc39 ]
  br label %for.body19, !dbg !52

for.body19:                                       ; preds = %for.cond16.preheader, %for.body19
  %indvars.iv = phi i64 [ 0, %for.cond16.preheader ], [ %indvars.iv.next, %for.body19 ]
  %arrayidx23 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !57
  %0 = load i32, i32* %arrayidx23, align 4, !dbg !57
  %arrayidx27 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !59
  store i32 %0, i32* %arrayidx27, align 4, !dbg !60
  %arrayidx31 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !61
  %1 = load i32, i32* %arrayidx31, align 4, !dbg !61
  %arrayidx35 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !62
  store i32 %1, i32* %arrayidx35, align 4, !dbg !63
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !52
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !50, metadata !30), !dbg !51
  %exitcond = icmp ne i64 %indvars.iv.next, 2000, !dbg !52
  br i1 %exitcond, label %for.body19, label %for.inc39, !dbg !52

for.inc39:                                        ; preds = %for.body19
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !41
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !29, metadata !30), !dbg !31
  %exitcond7 = icmp ne i64 %indvars.iv.next6, 2000, !dbg !41
  br i1 %exitcond7, label %for.cond16.preheader, label %for.end41, !dbg !41

for.end41:                                        ; preds = %for.inc39
  ret void, !dbg !64
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare void @srand(i32) #2

; Function Attrs: nounwind
declare i64 @time(i64*) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: noinline nounwind uwtable
define void @mat_mult() #0 !dbg !9 {
entry:
  %b_t = alloca [2000 x i32], align 16
  br label %entry.split, !dbg !65

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.declare(metadata [2000 x i32]* %b_t, metadata !66, metadata !30), !dbg !65
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !69, metadata !30), !dbg !70
  br label %for.cond1.preheader, !dbg !71

for.cond1.preheader:                              ; preds = %entry.split, %for.inc30
  %indvars.iv12 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next13, %for.inc30 ]
  br label %for.body3, !dbg !75

for.cond8.preheader:                              ; preds = %for.body3
  br label %for.cond11.preheader, !dbg !80

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv12, !dbg !84
  %0 = load i32, i32* %arrayidx5, align 4, !dbg !84
  %arrayidx7 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %indvars.iv, !dbg !86
  store i32 %0, i32* %arrayidx7, align 4, !dbg !87
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !88, metadata !30), !dbg !89
  %exitcond = icmp ne i64 %indvars.iv.next, 2000, !dbg !75
  br i1 %exitcond, label %for.body3, label %for.cond8.preheader, !dbg !75

for.cond11.preheader:                             ; preds = %for.cond8.preheader, %for.end22
  %indvars.iv9 = phi i64 [ 0, %for.cond8.preheader ], [ %indvars.iv.next10, %for.end22 ]
  br label %for.inc20, !dbg !90

for.inc20:                                        ; preds = %for.cond11.preheader, %for.inc20
  %indvars.iv6 = phi i64 [ 0, %for.cond11.preheader ], [ %indvars.iv.next7, %for.inc20 ]
  %sum.02 = phi i32 [ 0, %for.cond11.preheader ], [ %add, %for.inc20 ]
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !95, metadata !30), !dbg !96
  %arrayidx17 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %indvars.iv9, i64 %indvars.iv6, !dbg !97
  %1 = load i32, i32* %arrayidx17, align 4, !dbg !97
  %arrayidx19 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %indvars.iv6, !dbg !99
  %2 = load i32, i32* %arrayidx19, align 4, !dbg !99
  %mul = mul nsw i32 %2, %1, !dbg !100
  %add = add nsw i32 %mul, %sum.02, !dbg !101
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !90
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !102, metadata !30), !dbg !103
  %exitcond8 = icmp ne i64 %indvars.iv.next7, 2000, !dbg !90
  br i1 %exitcond8, label %for.inc20, label %for.end22, !dbg !90

for.end22:                                        ; preds = %for.inc20
  %add.lcssa = phi i32 [ %add, %for.inc20 ]
  %arrayidx26 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %indvars.iv9, i64 %indvars.iv12, !dbg !104
  store i32 %add.lcssa, i32* %arrayidx26, align 4, !dbg !105
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !80
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !88, metadata !30), !dbg !89
  %exitcond11 = icmp ne i64 %indvars.iv.next10, 2000, !dbg !80
  br i1 %exitcond11, label %for.cond11.preheader, label %for.inc30, !dbg !80

for.inc30:                                        ; preds = %for.end22
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !71
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !69, metadata !30), !dbg !70
  %exitcond14 = icmp ne i64 %indvars.iv.next13, 2000, !dbg !71
  br i1 %exitcond14, label %for.cond1.preheader, label %for.end32, !dbg !71

for.end32:                                        ; preds = %for.inc30
  ret void, !dbg !106
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 !dbg !10 {
entry:
  br label %entry.split, !dbg !107

entry.split:                                      ; preds = %entry
  tail call void @init(), !dbg !107
  tail call void @mat_mult(), !dbg !108
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 2000, i32 2000) #5, !dbg !109
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !110
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !111
  %2 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 1999, i64 1999), align 4, !dbg !112
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i32 %2) #5, !dbg !113
  ret i32 0, !dbg !114
}

declare i32 @printf(i8*, ...) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !14)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !9, !10}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !7, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 35, type: !7, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: false, variables: !2)
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 98, type: !11, isLocal: false, isDefinition: true, scopeLine: 98, isOptimized: false, variables: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!14 = !{!15, !19, !20, !21}
!15 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 7, type: !16, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @A)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128000000, align: 32, elements: !17)
!17 = !{!18, !18}
!18 = !DISubrange(count: 2000)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 8, type: !16, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 9, type: !16, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @C)
!21 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 10, type: !16, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @R)
!22 = !{i32 2, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!25 = !DILocation(line: 17, column: 22, scope: !6)
!26 = !DILocation(line: 17, column: 11, scope: !6)
!27 = !DILocation(line: 17, column: 5, scope: !28)
!28 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!29 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 13, type: !13)
!30 = !DIExpression()
!31 = !DILocation(line: 13, column: 9, scope: !6)
!32 = !DILocation(line: 18, column: 5, scope: !33)
!33 = !DILexicalBlockFile(scope: !34, file: !1, discriminator: 1)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 18, column: 5)
!35 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 5)
!36 = !DILocation(line: 19, column: 9, scope: !37)
!37 = !DILexicalBlockFile(scope: !38, file: !1, discriminator: 1)
!38 = distinct !DILexicalBlock(scope: !39, file: !1, line: 19, column: 9)
!39 = distinct !DILexicalBlock(scope: !40, file: !1, line: 19, column: 9)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 18, column: 25)
!41 = !DILocation(line: 25, column: 5, scope: !42)
!42 = !DILexicalBlockFile(scope: !43, file: !1, discriminator: 1)
!43 = distinct !DILexicalBlock(scope: !44, file: !1, line: 25, column: 5)
!44 = distinct !DILexicalBlock(scope: !6, file: !1, line: 25, column: 5)
!45 = !DILocation(line: 21, column: 23, scope: !46)
!46 = distinct !DILexicalBlock(scope: !38, file: !1, line: 19, column: 29)
!47 = !DILocation(line: 21, column: 29, scope: !46)
!48 = !DILocation(line: 21, column: 13, scope: !46)
!49 = !DILocation(line: 21, column: 21, scope: !46)
!50 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 14, type: !13)
!51 = !DILocation(line: 14, column: 9, scope: !6)
!52 = !DILocation(line: 26, column: 9, scope: !53)
!53 = !DILexicalBlockFile(scope: !54, file: !1, discriminator: 1)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 26, column: 9)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 26, column: 9)
!56 = distinct !DILexicalBlock(scope: !43, file: !1, line: 25, column: 25)
!57 = !DILocation(line: 29, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 26, column: 29)
!59 = !DILocation(line: 29, column: 13, scope: !58)
!60 = !DILocation(line: 29, column: 21, scope: !58)
!61 = !DILocation(line: 30, column: 23, scope: !58)
!62 = !DILocation(line: 30, column: 13, scope: !58)
!63 = !DILocation(line: 30, column: 21, scope: !58)
!64 = !DILocation(line: 33, column: 1, scope: !6)
!65 = !DILocation(line: 37, column: 6, scope: !9)
!66 = !DILocalVariable(name: "b_t", scope: !9, file: !1, line: 37, type: !67)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64000, align: 32, elements: !68)
!68 = !{!18}
!69 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 36, type: !13)
!70 = !DILocation(line: 36, column: 8, scope: !9)
!71 = !DILocation(line: 39, column: 2, scope: !72)
!72 = !DILexicalBlockFile(scope: !73, file: !1, discriminator: 1)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 39, column: 2)
!74 = distinct !DILexicalBlock(scope: !9, file: !1, line: 39, column: 2)
!75 = !DILocation(line: 41, column: 3, scope: !76)
!76 = !DILexicalBlockFile(scope: !77, file: !1, discriminator: 1)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 41, column: 3)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 41, column: 3)
!79 = distinct !DILexicalBlock(scope: !73, file: !1, line: 39, column: 26)
!80 = !DILocation(line: 45, column: 3, scope: !81)
!81 = !DILexicalBlockFile(scope: !82, file: !1, discriminator: 1)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 45, column: 3)
!83 = distinct !DILexicalBlock(scope: !79, file: !1, line: 45, column: 3)
!84 = !DILocation(line: 42, column: 13, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !1, line: 41, column: 27)
!86 = !DILocation(line: 42, column: 4, scope: !85)
!87 = !DILocation(line: 42, column: 11, scope: !85)
!88 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 36, type: !13)
!89 = !DILocation(line: 36, column: 6, scope: !9)
!90 = !DILocation(line: 47, column: 4, scope: !91)
!91 = !DILexicalBlockFile(scope: !92, file: !1, discriminator: 1)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 47, column: 4)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 47, column: 4)
!94 = distinct !DILexicalBlock(scope: !82, file: !1, line: 45, column: 27)
!95 = !DILocalVariable(name: "sum", scope: !94, file: !1, line: 46, type: !13)
!96 = !DILocation(line: 46, column: 8, scope: !94)
!97 = !DILocation(line: 48, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !1, line: 47, column: 20)
!99 = !DILocation(line: 48, column: 25, scope: !98)
!100 = !DILocation(line: 48, column: 24, scope: !98)
!101 = !DILocation(line: 48, column: 15, scope: !98)
!102 = !DILocalVariable(name: "k", scope: !9, file: !1, line: 36, type: !13)
!103 = !DILocation(line: 36, column: 10, scope: !9)
!104 = !DILocation(line: 50, column: 4, scope: !94)
!105 = !DILocation(line: 50, column: 12, scope: !94)
!106 = !DILocation(line: 53, column: 1, scope: !9)
!107 = !DILocation(line: 99, column: 2, scope: !10)
!108 = !DILocation(line: 100, column: 2, scope: !10)
!109 = !DILocation(line: 102, column: 2, scope: !10)
!110 = !DILocation(line: 104, column: 19, scope: !10)
!111 = !DILocation(line: 105, column: 19, scope: !10)
!112 = !DILocation(line: 106, column: 19, scope: !10)
!113 = !DILocation(line: 103, column: 5, scope: !10)
!114 = !DILocation(line: 108, column: 5, scope: !10)
