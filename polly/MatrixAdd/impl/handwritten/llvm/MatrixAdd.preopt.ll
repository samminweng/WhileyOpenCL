; ModuleID = 'MatrixAdd.preopt.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@B = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@C = common global [10240 x [10240 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[%d][%d] =%d) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init() #0 !dbg !6 {
entry:
  %t = alloca i64, align 8
  br label %entry.split, !dbg !25

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64* %t, i64 0, metadata !26, metadata !32), !dbg !25
  %call = call i64 @time(i64* nonnull %t) #4, !dbg !33
  %conv = trunc i64 %call to i32, !dbg !34
  call void @srand(i32 %conv) #4, !dbg !35
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !37, metadata !38), !dbg !39
  br label %for.cond2.preheader, !dbg !40

for.cond2.preheader:                              ; preds = %entry.split, %for.inc22
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc22 ]
  br label %for.body5, !dbg !44

for.body5:                                        ; preds = %for.cond2.preheader, %for.body5
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.body5 ]
  %call6 = call i32 @rand() #4, !dbg !49
  %rem = srem i32 %call6, 100, !dbg !51
  call void @llvm.dbg.value(metadata i32 %rem, i64 0, metadata !52, metadata !38), !dbg !53
  %arrayidx8 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !54
  %0 = load i32, i32* %arrayidx8, align 4, !dbg !54
  %add = add nsw i32 %0, %rem, !dbg !55
  %arrayidx12 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !56
  store i32 %add, i32* %arrayidx12, align 4, !dbg !57
  %arrayidx16 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !58
  %1 = load i32, i32* %arrayidx16, align 4, !dbg !58
  %add17 = sub nsw i32 100, %rem, !dbg !59
  %sub = add i32 %add17, %1, !dbg !60
  %arrayidx21 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !61
  store i32 %sub, i32* %arrayidx21, align 4, !dbg !62
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !44
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !63, metadata !38), !dbg !64
  %exitcond = icmp ne i64 %indvars.iv.next, 10240, !dbg !44
  br i1 %exitcond, label %for.body5, label %for.inc22, !dbg !44

for.inc22:                                        ; preds = %for.body5
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !40
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !37, metadata !38), !dbg !39
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 10240, !dbg !40
  br i1 %exitcond5, label %for.cond2.preheader, label %for.end24, !dbg !40

for.end24:                                        ; preds = %for.inc22
  ret void, !dbg !65
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare void @srand(i32) #2

; Function Attrs: nounwind
declare i64 @time(i64*) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nounwind uwtable
define void @mat_add() #0 !dbg !9 {
entry:
  br label %entry.split, !dbg !66

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !67, metadata !38), !dbg !66
  br label %for.cond1.preheader, !dbg !68

for.cond1.preheader:                              ; preds = %entry.split, %for.inc14
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc14 ]
  br label %for.body3, !dbg !72

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @A, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !77
  %0 = load i32, i32* %arrayidx5, align 4, !dbg !77
  %arrayidx9 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @B, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !79
  %1 = load i32, i32* %arrayidx9, align 4, !dbg !79
  %add = add nsw i32 %1, %0, !dbg !80
  %arrayidx13 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !81
  store i32 %add, i32* %arrayidx13, align 4, !dbg !82
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !72
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !83, metadata !38), !dbg !84
  %exitcond = icmp ne i64 %indvars.iv.next, 10240, !dbg !72
  br i1 %exitcond, label %for.body3, label %for.inc14, !dbg !72

for.inc14:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !67, metadata !38), !dbg !66
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 10240, !dbg !68
  br i1 %exitcond5, label %for.cond1.preheader, label %for.end16, !dbg !68

for.end16:                                        ; preds = %for.inc14
  ret void, !dbg !85
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !10 {
entry:
  br label %entry.split, !dbg !86

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !87, metadata !38), !dbg !86
  br label %for.cond1.preheader, !dbg !88

for.cond1.preheader:                              ; preds = %entry.split, %for.end
  %indvars.iv4 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next5, %for.end ]
  br label %for.body3, !dbg !92

for.body3:                                        ; preds = %for.cond1.preheader, %for.inc
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %arrayidx5 = getelementptr inbounds [10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 %indvars.iv4, i64 %indvars.iv, !dbg !97
  %0 = load i32, i32* %arrayidx5, align 4, !dbg !97
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %0) #4, !dbg !99
  %1 = trunc i64 %indvars.iv to i32, !dbg !100
  %rem = srem i32 %1, 80, !dbg !100
  %cmp6 = icmp eq i32 %rem, 79, !dbg !102
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !103

if.then:                                          ; preds = %for.body3
  %putchar1 = tail call i32 @putchar(i32 10) #4, !dbg !104
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !92
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !106, metadata !38), !dbg !107
  %exitcond = icmp ne i64 %indvars.iv.next, 10240, !dbg !92
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !92

for.end:                                          ; preds = %for.inc
  %putchar = tail call i32 @putchar(i32 10) #4, !dbg !108
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !88
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !87, metadata !38), !dbg !86
  %exitcond6 = icmp ne i64 %indvars.iv.next5, 10240, !dbg !88
  br i1 %exitcond6, label %for.cond1.preheader, label %for.end11, !dbg !88

for.end11:                                        ; preds = %for.end
  ret void, !dbg !109
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !11 {
entry:
  br label %entry.split, !dbg !110

entry.split:                                      ; preds = %entry
  tail call void @init(), !dbg !110
  tail call void @mat_add(), !dbg !111
  %0 = load i32, i32* getelementptr inbounds ([10240 x [10240 x i32]], [10240 x [10240 x i32]]* @C, i64 0, i64 10239, i64 10239), align 4, !dbg !112
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 10240, i32 10240, i32 10239, i32 10239, i32 %0) #4, !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

declare i32 @putchar(i32)

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !15)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !9, !10, !11}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 7, type: !7, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 23, type: !7, isLocal: false, isDefinition: true, scopeLine: 23, isOptimized: false, variables: !2)
!10 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 32, type: !7, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, variables: !2)
!11 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 45, type: !12, isLocal: false, isDefinition: true, scopeLine: 46, isOptimized: false, variables: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{!14}
!14 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!15 = !{!16, !20, !21}
!16 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !17, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @A)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 3355443200, align: 32, elements: !18)
!18 = !{!19, !19}
!19 = !DISubrange(count: 10240)
!20 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !17, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @B)
!21 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !17, isLocal: false, isDefinition: true, variable: [10240 x [10240 x i32]]* @C)
!22 = !{i32 2, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!25 = !DILocation(line: 11, column: 12, scope: !6)
!26 = !DILocalVariable(name: "t", scope: !6, file: !1, line: 11, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !28, line: 75, baseType: !29)
!28 = !DIFile(filename: "/usr/include/time.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !30, line: 139, baseType: !31)
!30 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!31 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!32 = !DIExpression(DW_OP_deref)
!33 = !DILocation(line: 13, column: 22, scope: !6)
!34 = !DILocation(line: 13, column: 11, scope: !6)
!35 = !DILocation(line: 13, column: 5, scope: !36)
!36 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!37 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 9, type: !14)
!38 = !DIExpression()
!39 = !DILocation(line: 9, column: 9, scope: !6)
!40 = !DILocation(line: 14, column: 5, scope: !41)
!41 = !DILexicalBlockFile(scope: !42, file: !1, discriminator: 1)
!42 = distinct !DILexicalBlock(scope: !43, file: !1, line: 14, column: 5)
!43 = distinct !DILexicalBlock(scope: !6, file: !1, line: 14, column: 5)
!44 = !DILocation(line: 15, column: 9, scope: !45)
!45 = !DILexicalBlockFile(scope: !46, file: !1, discriminator: 1)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 15, column: 9)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 15, column: 9)
!48 = distinct !DILexicalBlock(scope: !42, file: !1, line: 14, column: 25)
!49 = !DILocation(line: 16, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 15, column: 29)
!51 = !DILocation(line: 16, column: 28, scope: !50)
!52 = !DILocalVariable(name: "r", scope: !50, file: !1, line: 16, type: !14)
!53 = !DILocation(line: 16, column: 17, scope: !50)
!54 = !DILocation(line: 17, column: 23, scope: !50)
!55 = !DILocation(line: 17, column: 31, scope: !50)
!56 = !DILocation(line: 17, column: 13, scope: !50)
!57 = !DILocation(line: 17, column: 21, scope: !50)
!58 = !DILocation(line: 18, column: 23, scope: !50)
!59 = !DILocation(line: 18, column: 31, scope: !50)
!60 = !DILocation(line: 18, column: 37, scope: !50)
!61 = !DILocation(line: 18, column: 13, scope: !50)
!62 = !DILocation(line: 18, column: 21, scope: !50)
!63 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 10, type: !14)
!64 = !DILocation(line: 10, column: 9, scope: !6)
!65 = !DILocation(line: 21, column: 1, scope: !6)
!66 = !DILocation(line: 24, column: 9, scope: !9)
!67 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 24, type: !14)
!68 = !DILocation(line: 25, column: 5, scope: !69)
!69 = !DILexicalBlockFile(scope: !70, file: !1, discriminator: 1)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 25, column: 5)
!71 = distinct !DILexicalBlock(scope: !9, file: !1, line: 25, column: 5)
!72 = !DILocation(line: 26, column: 9, scope: !73)
!73 = !DILexicalBlockFile(scope: !74, file: !1, discriminator: 1)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 26, column: 9)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 26, column: 9)
!76 = distinct !DILexicalBlock(scope: !70, file: !1, line: 25, column: 25)
!77 = !DILocation(line: 27, column: 23, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !1, line: 26, column: 29)
!79 = !DILocation(line: 27, column: 33, scope: !78)
!80 = !DILocation(line: 27, column: 31, scope: !78)
!81 = !DILocation(line: 27, column: 13, scope: !78)
!82 = !DILocation(line: 27, column: 21, scope: !78)
!83 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 24, type: !14)
!84 = !DILocation(line: 24, column: 12, scope: !9)
!85 = !DILocation(line: 30, column: 1, scope: !9)
!86 = !DILocation(line: 34, column: 9, scope: !10)
!87 = !DILocalVariable(name: "i", scope: !10, file: !1, line: 34, type: !14)
!88 = !DILocation(line: 36, column: 5, scope: !89)
!89 = !DILexicalBlockFile(scope: !90, file: !1, discriminator: 1)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 36, column: 5)
!91 = distinct !DILexicalBlock(scope: !10, file: !1, line: 36, column: 5)
!92 = !DILocation(line: 37, column: 9, scope: !93)
!93 = !DILexicalBlockFile(scope: !94, file: !1, discriminator: 1)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 37, column: 9)
!95 = distinct !DILexicalBlock(scope: !96, file: !1, line: 37, column: 9)
!96 = distinct !DILexicalBlock(scope: !90, file: !1, line: 36, column: 25)
!97 = !DILocation(line: 38, column: 27, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 37, column: 29)
!99 = !DILocation(line: 38, column: 13, scope: !98)
!100 = !DILocation(line: 39, column: 18, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !1, line: 39, column: 17)
!102 = !DILocation(line: 39, column: 22, scope: !101)
!103 = !DILocation(line: 39, column: 17, scope: !98)
!104 = !DILocation(line: 39, column: 29, scope: !105)
!105 = !DILexicalBlockFile(scope: !101, file: !1, discriminator: 1)
!106 = !DILocalVariable(name: "j", scope: !10, file: !1, line: 34, type: !14)
!107 = !DILocation(line: 34, column: 12, scope: !10)
!108 = !DILocation(line: 41, column: 9, scope: !96)
!109 = !DILocation(line: 43, column: 1, scope: !10)
!110 = !DILocation(line: 49, column: 5, scope: !11)
!111 = !DILocation(line: 50, column: 5, scope: !11)
!112 = !DILocation(line: 52, column: 81, scope: !11)
!113 = !DILocation(line: 52, column: 5, scope: !11)
!114 = !DILocation(line: 53, column: 5, scope: !11)
