; ModuleID = 'MatrixAdd.preopt.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@R = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@A = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@B = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@C = common global [8000 x [8000 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.1 = private unnamed_addr constant [47 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%d \0A\00", align 1

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

for.cond2.preheader:                              ; preds = %entry.split, %for.inc9
  %indvars.iv11 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next12, %for.inc9 ]
  br label %for.body5, !dbg !44

for.cond12.preheader:                             ; preds = %for.inc9
  br label %for.cond16.preheader, !dbg !49

for.body5:                                        ; preds = %for.cond2.preheader, %for.body5
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next9, %for.body5 ]
  %call6 = call i32 @rand() #4, !dbg !53
  %rem = srem i32 %call6, 100, !dbg !55
  %arrayidx8 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %indvars.iv11, i64 %indvars.iv8, !dbg !56
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !57
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !44
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !58, metadata !38), !dbg !59
  %exitcond10 = icmp ne i64 %indvars.iv.next9, 8000, !dbg !44
  br i1 %exitcond10, label %for.body5, label %for.inc9, !dbg !44

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !40
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !37, metadata !38), !dbg !39
  %exitcond13 = icmp ne i64 %indvars.iv.next12, 8000, !dbg !40
  br i1 %exitcond13, label %for.cond2.preheader, label %for.cond12.preheader, !dbg !40

for.cond16.preheader:                             ; preds = %for.cond12.preheader, %for.inc39
  %indvars.iv5 = phi i64 [ 0, %for.cond12.preheader ], [ %indvars.iv.next6, %for.inc39 ]
  br label %for.body19, !dbg !60

for.body19:                                       ; preds = %for.cond16.preheader, %for.body19
  %indvars.iv = phi i64 [ 0, %for.cond16.preheader ], [ %indvars.iv.next, %for.body19 ]
  %arrayidx23 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !65
  %0 = load i32, i32* %arrayidx23, align 4, !dbg !65
  %arrayidx27 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !67
  store i32 %0, i32* %arrayidx27, align 4, !dbg !68
  %arrayidx31 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !69
  %1 = load i32, i32* %arrayidx31, align 4, !dbg !69
  %sub = sub nsw i32 100, %1, !dbg !70
  %arrayidx35 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !71
  store i32 %sub, i32* %arrayidx35, align 4, !dbg !72
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !60
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !58, metadata !38), !dbg !59
  %exitcond = icmp ne i64 %indvars.iv.next, 8000, !dbg !60
  br i1 %exitcond, label %for.body19, label %for.inc39, !dbg !60

for.inc39:                                        ; preds = %for.body19
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !49
  call void @llvm.dbg.value(metadata !2, i64 0, metadata !37, metadata !38), !dbg !39
  %exitcond7 = icmp ne i64 %indvars.iv.next6, 8000, !dbg !49
  br i1 %exitcond7, label %for.cond16.preheader, label %for.end41, !dbg !49

for.end41:                                        ; preds = %for.inc39
  ret void, !dbg !73
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
  br label %entry.split, !dbg !74

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !75, metadata !38), !dbg !74
  br label %for.cond1.preheader, !dbg !76

for.cond1.preheader:                              ; preds = %entry.split, %for.inc14
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc14 ]
  br label %for.body3, !dbg !80

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !85
  %0 = load i32, i32* %arrayidx5, align 4, !dbg !85
  %arrayidx9 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !87
  %1 = load i32, i32* %arrayidx9, align 4, !dbg !87
  %add = add nsw i32 %1, %0, !dbg !88
  %arrayidx13 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !89
  store i32 %add, i32* %arrayidx13, align 4, !dbg !90
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !80
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !91, metadata !38), !dbg !92
  %exitcond = icmp ne i64 %indvars.iv.next, 8000, !dbg !80
  br i1 %exitcond, label %for.body3, label %for.inc14, !dbg !80

for.inc14:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !76
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !75, metadata !38), !dbg !74
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 8000, !dbg !76
  br i1 %exitcond5, label %for.cond1.preheader, label %for.end16, !dbg !76

for.end16:                                        ; preds = %for.inc14
  ret void, !dbg !93
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !10 {
entry:
  br label %entry.split, !dbg !94

entry.split:                                      ; preds = %entry
  tail call void @init(), !dbg !94
  tail call void @mat_add(), !dbg !95
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 8000, i32 8000) #4, !dbg !96
  %0 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 7999, i64 7999), align 4, !dbg !97
  %1 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 7999, i64 7999), align 4, !dbg !98
  %2 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 7999, i64 7999), align 4, !dbg !99
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 7999, i32 7999, i32 %0, i32 7999, i32 7999, i32 %1, i32 7999, i32 7999, i32 %2) #4, !dbg !100
  ret i32 0, !dbg !101
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !14)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !9, !10}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 8, type: !7, isLocal: false, isDefinition: true, scopeLine: 9, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 31, type: !7, isLocal: false, isDefinition: true, scopeLine: 31, isOptimized: false, variables: !2)
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 53, type: !11, isLocal: false, isDefinition: true, scopeLine: 54, isOptimized: false, variables: !2)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!14 = !{!15, !19, !20, !21}
!15 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !16, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @A)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2048000000, align: 32, elements: !17)
!17 = !{!18, !18}
!18 = !DISubrange(count: 8000)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !16, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !16, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @C)
!21 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 6, type: !16, isLocal: false, isDefinition: true, variable: [8000 x [8000 x i32]]* @R)
!22 = !{i32 2, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!25 = !DILocation(line: 13, column: 12, scope: !6)
!26 = !DILocalVariable(name: "t", scope: !6, file: !1, line: 13, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !28, line: 75, baseType: !29)
!28 = !DIFile(filename: "/usr/include/time.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !30, line: 139, baseType: !31)
!30 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!31 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!32 = !DIExpression(DW_OP_deref)
!33 = !DILocation(line: 15, column: 22, scope: !6)
!34 = !DILocation(line: 15, column: 11, scope: !6)
!35 = !DILocation(line: 15, column: 5, scope: !36)
!36 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!37 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 10, type: !13)
!38 = !DIExpression()
!39 = !DILocation(line: 10, column: 9, scope: !6)
!40 = !DILocation(line: 16, column: 5, scope: !41)
!41 = !DILexicalBlockFile(scope: !42, file: !1, discriminator: 1)
!42 = distinct !DILexicalBlock(scope: !43, file: !1, line: 16, column: 5)
!43 = distinct !DILexicalBlock(scope: !6, file: !1, line: 16, column: 5)
!44 = !DILocation(line: 17, column: 9, scope: !45)
!45 = !DILexicalBlockFile(scope: !46, file: !1, discriminator: 1)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 17, column: 9)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 17, column: 9)
!48 = distinct !DILexicalBlock(scope: !42, file: !1, line: 16, column: 25)
!49 = !DILocation(line: 23, column: 5, scope: !50)
!50 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 1)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 23, column: 5)
!52 = distinct !DILexicalBlock(scope: !6, file: !1, line: 23, column: 5)
!53 = !DILocation(line: 19, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !46, file: !1, line: 17, column: 29)
!55 = !DILocation(line: 19, column: 29, scope: !54)
!56 = !DILocation(line: 19, column: 13, scope: !54)
!57 = !DILocation(line: 19, column: 21, scope: !54)
!58 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 11, type: !13)
!59 = !DILocation(line: 11, column: 9, scope: !6)
!60 = !DILocation(line: 24, column: 9, scope: !61)
!61 = !DILexicalBlockFile(scope: !62, file: !1, discriminator: 1)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 24, column: 9)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 24, column: 9)
!64 = distinct !DILexicalBlock(scope: !51, file: !1, line: 23, column: 25)
!65 = !DILocation(line: 25, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !1, line: 24, column: 29)
!67 = !DILocation(line: 25, column: 13, scope: !66)
!68 = !DILocation(line: 25, column: 21, scope: !66)
!69 = !DILocation(line: 26, column: 29, scope: !66)
!70 = !DILocation(line: 26, column: 27, scope: !66)
!71 = !DILocation(line: 26, column: 13, scope: !66)
!72 = !DILocation(line: 26, column: 21, scope: !66)
!73 = !DILocation(line: 29, column: 1, scope: !6)
!74 = !DILocation(line: 32, column: 9, scope: !9)
!75 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 32, type: !13)
!76 = !DILocation(line: 33, column: 5, scope: !77)
!77 = !DILexicalBlockFile(scope: !78, file: !1, discriminator: 1)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 33, column: 5)
!79 = distinct !DILexicalBlock(scope: !9, file: !1, line: 33, column: 5)
!80 = !DILocation(line: 34, column: 9, scope: !81)
!81 = !DILexicalBlockFile(scope: !82, file: !1, discriminator: 1)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 34, column: 9)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 34, column: 9)
!84 = distinct !DILexicalBlock(scope: !78, file: !1, line: 33, column: 25)
!85 = !DILocation(line: 35, column: 23, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !1, line: 34, column: 29)
!87 = !DILocation(line: 35, column: 33, scope: !86)
!88 = !DILocation(line: 35, column: 31, scope: !86)
!89 = !DILocation(line: 35, column: 13, scope: !86)
!90 = !DILocation(line: 35, column: 21, scope: !86)
!91 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 32, type: !13)
!92 = !DILocation(line: 32, column: 12, scope: !9)
!93 = !DILocation(line: 38, column: 1, scope: !9)
!94 = !DILocation(line: 57, column: 5, scope: !10)
!95 = !DILocation(line: 58, column: 5, scope: !10)
!96 = !DILocation(line: 60, column: 5, scope: !10)
!97 = !DILocation(line: 62, column: 19, scope: !10)
!98 = !DILocation(line: 63, column: 19, scope: !10)
!99 = !DILocation(line: 64, column: 19, scope: !10)
!100 = !DILocation(line: 61, column: 5, scope: !10)
!101 = !DILocation(line: 65, column: 5, scope: !10)
