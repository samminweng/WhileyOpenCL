; ModuleID = 'MatrixAdd.preopt.s'
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
  %rem = srem i32 %call6, 100, !dbg !47
  %arrayidx8 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %indvars.iv11, i64 %indvars.iv8, !dbg !48
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !49
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1, !dbg !36
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !50, metadata !30), !dbg !51
  %exitcond10 = icmp ne i64 %indvars.iv.next9, 8000, !dbg !36
  br i1 %exitcond10, label %for.body5, label %for.inc9, !dbg !36

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !dbg !32
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !29, metadata !30), !dbg !31
  %exitcond13 = icmp ne i64 %indvars.iv.next12, 8000, !dbg !32
  br i1 %exitcond13, label %for.cond2.preheader, label %for.cond12.preheader, !dbg !32

for.cond16.preheader:                             ; preds = %for.cond12.preheader, %for.inc39
  %indvars.iv5 = phi i64 [ 0, %for.cond12.preheader ], [ %indvars.iv.next6, %for.inc39 ]
  br label %for.body19, !dbg !52

for.body19:                                       ; preds = %for.cond16.preheader, %for.body19
  %indvars.iv = phi i64 [ 0, %for.cond16.preheader ], [ %indvars.iv.next, %for.body19 ]
  %arrayidx23 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !57
  %0 = load i32, i32* %arrayidx23, align 4, !dbg !57
  %arrayidx27 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !59
  store i32 %0, i32* %arrayidx27, align 4, !dbg !60
  %arrayidx31 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @R, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !61
  %1 = load i32, i32* %arrayidx31, align 4, !dbg !61
  %sub = sub nsw i32 100, %1, !dbg !62
  %arrayidx35 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %indvars.iv5, i64 %indvars.iv, !dbg !63
  store i32 %sub, i32* %arrayidx35, align 4, !dbg !64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !52
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !50, metadata !30), !dbg !51
  %exitcond = icmp ne i64 %indvars.iv.next, 8000, !dbg !52
  br i1 %exitcond, label %for.body19, label %for.inc39, !dbg !52

for.inc39:                                        ; preds = %for.body19
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !dbg !41
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !29, metadata !30), !dbg !31
  %exitcond7 = icmp ne i64 %indvars.iv.next6, 8000, !dbg !41
  br i1 %exitcond7, label %for.cond16.preheader, label %for.end41, !dbg !41

for.end41:                                        ; preds = %for.inc39
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

; Function Attrs: noinline nounwind uwtable
define void @mat_add() #0 !dbg !9 {
entry:
  br label %entry.split, !dbg !66

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !67, metadata !30), !dbg !66
  br label %for.cond1.preheader, !dbg !68

for.cond1.preheader:                              ; preds = %entry.split, %for.inc14
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc14 ]
  br label %for.body3, !dbg !72

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !77
  %0 = load i32, i32* %arrayidx5, align 4, !dbg !77
  %arrayidx9 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !79
  %1 = load i32, i32* %arrayidx9, align 4, !dbg !79
  %add = add nsw i32 %1, %0, !dbg !80
  %arrayidx13 = getelementptr inbounds [8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !81
  store i32 %add, i32* %arrayidx13, align 4, !dbg !82
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !72
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !83, metadata !30), !dbg !84
  %exitcond = icmp ne i64 %indvars.iv.next, 8000, !dbg !72
  br i1 %exitcond, label %for.body3, label %for.inc14, !dbg !72

for.inc14:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !68
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !67, metadata !30), !dbg !66
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 8000, !dbg !68
  br i1 %exitcond5, label %for.cond1.preheader, label %for.end16, !dbg !68

for.end16:                                        ; preds = %for.inc14
  ret void, !dbg !85
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 !dbg !10 {
entry:
  br label %entry.split, !dbg !86

entry.split:                                      ; preds = %entry
  tail call void @init(), !dbg !86
  tail call void @mat_add(), !dbg !87
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 8000, i32 8000) #5, !dbg !88
  %0 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @A, i64 0, i64 7999, i64 7999), align 4, !dbg !89
  %1 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @B, i64 0, i64 7999, i64 7999), align 4, !dbg !90
  %2 = load i32, i32* getelementptr inbounds ([8000 x [8000 x i32]], [8000 x [8000 x i32]]* @C, i64 0, i64 7999, i64 7999), align 4, !dbg !91
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 7999, i32 7999, i32 %0, i32 7999, i32 7999, i32 %1, i32 7999, i32 7999, i32 %2) #5, !dbg !92
  ret i32 0, !dbg !93
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
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !9, !10}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 11, type: !7, isLocal: false, isDefinition: true, scopeLine: 11, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 32, type: !7, isLocal: false, isDefinition: true, scopeLine: 32, isOptimized: false, variables: !2)
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 55, type: !11, isLocal: false, isDefinition: true, scopeLine: 56, isOptimized: false, variables: !2)
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
!25 = !DILocation(line: 16, column: 22, scope: !6)
!26 = !DILocation(line: 16, column: 11, scope: !6)
!27 = !DILocation(line: 16, column: 5, scope: !28)
!28 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!29 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 12, type: !13)
!30 = !DIExpression()
!31 = !DILocation(line: 12, column: 9, scope: !6)
!32 = !DILocation(line: 17, column: 5, scope: !33)
!33 = !DILexicalBlockFile(scope: !34, file: !1, discriminator: 1)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 17, column: 5)
!35 = distinct !DILexicalBlock(scope: !6, file: !1, line: 17, column: 5)
!36 = !DILocation(line: 18, column: 9, scope: !37)
!37 = !DILexicalBlockFile(scope: !38, file: !1, discriminator: 1)
!38 = distinct !DILexicalBlock(scope: !39, file: !1, line: 18, column: 9)
!39 = distinct !DILexicalBlock(scope: !40, file: !1, line: 18, column: 9)
!40 = distinct !DILexicalBlock(scope: !34, file: !1, line: 17, column: 25)
!41 = !DILocation(line: 24, column: 5, scope: !42)
!42 = !DILexicalBlockFile(scope: !43, file: !1, discriminator: 1)
!43 = distinct !DILexicalBlock(scope: !44, file: !1, line: 24, column: 5)
!44 = distinct !DILexicalBlock(scope: !6, file: !1, line: 24, column: 5)
!45 = !DILocation(line: 20, column: 23, scope: !46)
!46 = distinct !DILexicalBlock(scope: !38, file: !1, line: 18, column: 29)
!47 = !DILocation(line: 20, column: 29, scope: !46)
!48 = !DILocation(line: 20, column: 13, scope: !46)
!49 = !DILocation(line: 20, column: 21, scope: !46)
!50 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 13, type: !13)
!51 = !DILocation(line: 13, column: 9, scope: !6)
!52 = !DILocation(line: 25, column: 9, scope: !53)
!53 = !DILexicalBlockFile(scope: !54, file: !1, discriminator: 1)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 25, column: 9)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 25, column: 9)
!56 = distinct !DILexicalBlock(scope: !43, file: !1, line: 24, column: 25)
!57 = !DILocation(line: 26, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 25, column: 29)
!59 = !DILocation(line: 26, column: 13, scope: !58)
!60 = !DILocation(line: 26, column: 21, scope: !58)
!61 = !DILocation(line: 27, column: 29, scope: !58)
!62 = !DILocation(line: 27, column: 27, scope: !58)
!63 = !DILocation(line: 27, column: 13, scope: !58)
!64 = !DILocation(line: 27, column: 21, scope: !58)
!65 = !DILocation(line: 30, column: 1, scope: !6)
!66 = !DILocation(line: 34, column: 9, scope: !9)
!67 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 34, type: !13)
!68 = !DILocation(line: 35, column: 5, scope: !69)
!69 = !DILexicalBlockFile(scope: !70, file: !1, discriminator: 1)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 35, column: 5)
!71 = distinct !DILexicalBlock(scope: !9, file: !1, line: 35, column: 5)
!72 = !DILocation(line: 36, column: 9, scope: !73)
!73 = !DILexicalBlockFile(scope: !74, file: !1, discriminator: 1)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 36, column: 9)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 36, column: 9)
!76 = distinct !DILexicalBlock(scope: !70, file: !1, line: 35, column: 25)
!77 = !DILocation(line: 37, column: 23, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !1, line: 36, column: 29)
!79 = !DILocation(line: 37, column: 33, scope: !78)
!80 = !DILocation(line: 37, column: 31, scope: !78)
!81 = !DILocation(line: 37, column: 13, scope: !78)
!82 = !DILocation(line: 37, column: 21, scope: !78)
!83 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 34, type: !13)
!84 = !DILocation(line: 34, column: 12, scope: !9)
!85 = !DILocation(line: 40, column: 1, scope: !9)
!86 = !DILocation(line: 59, column: 5, scope: !10)
!87 = !DILocation(line: 60, column: 5, scope: !10)
!88 = !DILocation(line: 62, column: 5, scope: !10)
!89 = !DILocation(line: 64, column: 19, scope: !10)
!90 = !DILocation(line: 65, column: 19, scope: !10)
!91 = !DILocation(line: 66, column: 19, scope: !10)
!92 = !DILocation(line: 63, column: 5, scope: !10)
!93 = !DILocation(line: 67, column: 5, scope: !10)
