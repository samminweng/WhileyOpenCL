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
  br label %entry.split, !dbg !65

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !66, metadata !30), !dbg !65
  br label %for.cond1.preheader, !dbg !67

for.cond1.preheader:                              ; preds = %entry.split, %for.inc28
  %indvars.iv7 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next8, %for.inc28 ]
  br label %for.body3, !dbg !71

for.body3:                                        ; preds = %for.cond1.preheader, %for.inc25
  %indvars.iv4 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next5, %for.inc25 ]
  %arrayidx5 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !76
  store i32 0, i32* %arrayidx5, align 4, !dbg !78
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !79, metadata !30), !dbg !80
  br label %for.body8, !dbg !81

for.body8:                                        ; preds = %for.body3, %for.body8
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !85
  %0 = load i32, i32* %arrayidx12, align 4, !dbg !85
  %arrayidx16 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %indvars.iv7, i64 %indvars.iv, !dbg !86
  %1 = load i32, i32* %arrayidx16, align 4, !dbg !86
  %arrayidx20 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv4, !dbg !87
  %2 = load i32, i32* %arrayidx20, align 4, !dbg !87
  %mul = mul nsw i32 %2, %1, !dbg !88
  %add = add nsw i32 %mul, %0, !dbg !89
  %arrayidx24 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !90
  store i32 %add, i32* %arrayidx24, align 4, !dbg !91
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !81
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !79, metadata !30), !dbg !80
  %exitcond = icmp ne i64 %indvars.iv.next, 2000, !dbg !81
  br i1 %exitcond, label %for.body8, label %for.inc25, !dbg !81

for.inc25:                                        ; preds = %for.body8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !71
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !92, metadata !30), !dbg !93
  %exitcond6 = icmp ne i64 %indvars.iv.next5, 2000, !dbg !71
  br i1 %exitcond6, label %for.body3, label %for.inc28, !dbg !71

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !67
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !66, metadata !30), !dbg !65
  %exitcond9 = icmp ne i64 %indvars.iv.next8, 2000, !dbg !67
  br i1 %exitcond9, label %for.cond1.preheader, label %for.end30, !dbg !67

for.end30:                                        ; preds = %for.inc28
  ret void, !dbg !94
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 !dbg !10 {
entry:
  br label %entry.split, !dbg !95

entry.split:                                      ; preds = %entry
  tail call void @init(), !dbg !95
  tail call void @mat_mult(), !dbg !96
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 2000, i32 2000) #5, !dbg !97
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !98
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !99
  %2 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 1999, i64 1999), align 4, !dbg !100
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i32 %2) #5, !dbg !101
  ret i32 0, !dbg !102
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
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !9, !10}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !7, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 33, type: !7, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, variables: !2)
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 57, type: !11, isLocal: false, isDefinition: true, scopeLine: 58, isOptimized: false, variables: !2)
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
!57 = !DILocation(line: 27, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 26, column: 29)
!59 = !DILocation(line: 27, column: 13, scope: !58)
!60 = !DILocation(line: 27, column: 21, scope: !58)
!61 = !DILocation(line: 28, column: 23, scope: !58)
!62 = !DILocation(line: 28, column: 13, scope: !58)
!63 = !DILocation(line: 28, column: 21, scope: !58)
!64 = !DILocation(line: 31, column: 1, scope: !6)
!65 = !DILocation(line: 34, column: 9, scope: !9)
!66 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 34, type: !13)
!67 = !DILocation(line: 35, column: 5, scope: !68)
!68 = !DILexicalBlockFile(scope: !69, file: !1, discriminator: 1)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 35, column: 5)
!70 = distinct !DILexicalBlock(scope: !9, file: !1, line: 35, column: 5)
!71 = !DILocation(line: 36, column: 9, scope: !72)
!72 = !DILexicalBlockFile(scope: !73, file: !1, discriminator: 1)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 36, column: 9)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 36, column: 9)
!75 = distinct !DILexicalBlock(scope: !69, file: !1, line: 35, column: 25)
!76 = !DILocation(line: 37, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !1, line: 36, column: 29)
!78 = !DILocation(line: 37, column: 21, scope: !77)
!79 = !DILocalVariable(name: "k", scope: !9, file: !1, line: 34, type: !13)
!80 = !DILocation(line: 34, column: 15, scope: !9)
!81 = !DILocation(line: 38, column: 13, scope: !82)
!82 = !DILexicalBlockFile(scope: !83, file: !1, discriminator: 1)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 38, column: 13)
!84 = distinct !DILexicalBlock(scope: !77, file: !1, line: 38, column: 13)
!85 = !DILocation(line: 39, column: 27, scope: !83)
!86 = !DILocation(line: 39, column: 37, scope: !83)
!87 = !DILocation(line: 39, column: 47, scope: !83)
!88 = !DILocation(line: 39, column: 45, scope: !83)
!89 = !DILocation(line: 39, column: 35, scope: !83)
!90 = !DILocation(line: 39, column: 17, scope: !83)
!91 = !DILocation(line: 39, column: 25, scope: !83)
!92 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 34, type: !13)
!93 = !DILocation(line: 34, column: 12, scope: !9)
!94 = !DILocation(line: 42, column: 1, scope: !9)
!95 = !DILocation(line: 60, column: 5, scope: !10)
!96 = !DILocation(line: 61, column: 5, scope: !10)
!97 = !DILocation(line: 63, column: 5, scope: !10)
!98 = !DILocation(line: 65, column: 19, scope: !10)
!99 = !DILocation(line: 66, column: 19, scope: !10)
!100 = !DILocation(line: 67, column: 19, scope: !10)
!101 = !DILocation(line: 64, column: 5, scope: !10)
!102 = !DILocation(line: 68, column: 5, scope: !10)
