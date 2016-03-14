; ModuleID = 'MatrixMult.preopt.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@X = common global [512 x [512 x i32]] zeroinitializer, align 16
@Y = common global [512 x [512 x i32]] zeroinitializer, align 16
@Z = common global [512 x [512 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !4 {
entry:
  br label %entry.split, !dbg !21

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !22, metadata !23), !dbg !21
  br label %for.cond1.preheader, !dbg !24

for.cond1.preheader:                              ; preds = %entry.split, %for.inc10
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc10 ]
  br label %for.body3, !dbg !28

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !33
  store i32 1, i32* %arrayidx5, align 4, !dbg !35
  %arrayidx9 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !36
  store i32 1, i32* %arrayidx9, align 4, !dbg !37
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !28
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !38, metadata !23), !dbg !39
  %exitcond = icmp ne i64 %indvars.iv.next, 512, !dbg !28
  br i1 %exitcond, label %for.body3, label %for.inc10, !dbg !28

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !24
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !22, metadata !23), !dbg !21
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 512, !dbg !24
  br i1 %exitcond5, label %for.cond1.preheader, label %for.end12, !dbg !24

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !40
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 !dbg !7 {
entry:
  %y_t = alloca [512 x i32], align 16
  br label %entry.split, !dbg !41

entry.split:                                      ; preds = %entry
  tail call void @init(), !dbg !41
  tail call void @llvm.dbg.declare(metadata [512 x i32]* %y_t, metadata !42, metadata !23), !dbg !45
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !46, metadata !23), !dbg !47
  br label %for.cond1.preheader, !dbg !48

for.cond1.preheader:                              ; preds = %entry.split, %for.inc30
  %indvars.iv12 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next13, %for.inc30 ]
  br label %for.body3, !dbg !52

for.cond8.preheader:                              ; preds = %for.body3
  br label %for.cond11.preheader, !dbg !57

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv12, !dbg !61
  %0 = load i32, i32* %arrayidx5, align 4, !dbg !61
  %arrayidx7 = getelementptr inbounds [512 x i32], [512 x i32]* %y_t, i64 0, i64 %indvars.iv, !dbg !63
  store i32 %0, i32* %arrayidx7, align 4, !dbg !64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !52
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !65, metadata !23), !dbg !66
  %exitcond = icmp ne i64 %indvars.iv.next, 512, !dbg !52
  br i1 %exitcond, label %for.body3, label %for.cond8.preheader, !dbg !52

for.cond11.preheader:                             ; preds = %for.cond8.preheader, %for.end22
  %indvars.iv9 = phi i64 [ 0, %for.cond8.preheader ], [ %indvars.iv.next10, %for.end22 ]
  br label %for.inc20, !dbg !67

for.inc20:                                        ; preds = %for.cond11.preheader, %for.inc20
  %indvars.iv6 = phi i64 [ 0, %for.cond11.preheader ], [ %indvars.iv.next7, %for.inc20 ]
  %sum.03 = phi i32 [ 0, %for.cond11.preheader ], [ %add, %for.inc20 ]
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !72, metadata !23), !dbg !73
  %arrayidx17 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv9, i64 %indvars.iv6, !dbg !74
  %1 = load i32, i32* %arrayidx17, align 4, !dbg !74
  %arrayidx19 = getelementptr inbounds [512 x i32], [512 x i32]* %y_t, i64 0, i64 %indvars.iv6, !dbg !76
  %2 = load i32, i32* %arrayidx19, align 4, !dbg !76
  %mul = mul nsw i32 %2, %1, !dbg !77
  %add = add nsw i32 %mul, %sum.03, !dbg !78
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !67
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !79, metadata !23), !dbg !80
  %exitcond8 = icmp ne i64 %indvars.iv.next7, 512, !dbg !67
  br i1 %exitcond8, label %for.inc20, label %for.end22, !dbg !67

for.end22:                                        ; preds = %for.inc20
  %add.lcssa = phi i32 [ %add, %for.inc20 ]
  %arrayidx26 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Z, i64 0, i64 %indvars.iv9, i64 %indvars.iv12, !dbg !81
  store i32 %add.lcssa, i32* %arrayidx26, align 4, !dbg !82
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1, !dbg !57
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !65, metadata !23), !dbg !66
  %exitcond11 = icmp ne i64 %indvars.iv.next10, 512, !dbg !57
  br i1 %exitcond11, label %for.cond11.preheader, label %for.inc30, !dbg !57

for.inc30:                                        ; preds = %for.end22
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !48
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !46, metadata !23), !dbg !47
  %exitcond14 = icmp ne i64 %indvars.iv.next13, 512, !dbg !48
  br i1 %exitcond14, label %for.cond1.preheader, label %for.end32, !dbg !48

for.end32:                                        ; preds = %for.inc30
  %3 = load i32, i32* getelementptr inbounds ([512 x [512 x i32]], [512 x [512 x i32]]* @Z, i64 0, i64 511, i64 511), align 4, !dbg !83
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 512, i32 512, i32 511, i32 511, i32 %3) #4, !dbg !84
  ret i32 0, !dbg !85
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!18, !19}
!llvm.ident = !{!20}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !11)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten3")
!2 = !{}
!3 = !{!4, !7}
!4 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 9, type: !5, isLocal: false, isDefinition: true, scopeLine: 9, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 61, type: !8, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: false, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!11 = !{!12, !16, !17}
!12 = !DIGlobalVariable(name: "X", scope: !0, file: !1, line: 4, type: !13, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @X)
!13 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 8388608, align: 32, elements: !14)
!14 = !{!15, !15}
!15 = !DISubrange(count: 512)
!16 = !DIGlobalVariable(name: "Y", scope: !0, file: !1, line: 5, type: !13, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @Y)
!17 = !DIGlobalVariable(name: "Z", scope: !0, file: !1, line: 6, type: !13, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @Z)
!18 = !{i32 2, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!21 = !DILocation(line: 10, column: 6, scope: !4)
!22 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 10, type: !10)
!23 = !DIExpression()
!24 = !DILocation(line: 11, column: 2, scope: !25)
!25 = !DILexicalBlockFile(scope: !26, file: !1, discriminator: 1)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 11, column: 2)
!27 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 2)
!28 = !DILocation(line: 12, column: 3, scope: !29)
!29 = !DILexicalBlockFile(scope: !30, file: !1, discriminator: 1)
!30 = distinct !DILexicalBlock(scope: !31, file: !1, line: 12, column: 3)
!31 = distinct !DILexicalBlock(scope: !32, file: !1, line: 12, column: 3)
!32 = distinct !DILexicalBlock(scope: !26, file: !1, line: 11, column: 22)
!33 = !DILocation(line: 13, column: 4, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !1, line: 12, column: 23)
!35 = !DILocation(line: 13, column: 12, scope: !34)
!36 = !DILocation(line: 14, column: 4, scope: !34)
!37 = !DILocation(line: 14, column: 12, scope: !34)
!38 = !DILocalVariable(name: "j", scope: !4, file: !1, line: 10, type: !10)
!39 = !DILocation(line: 10, column: 9, scope: !4)
!40 = !DILocation(line: 17, column: 1, scope: !4)
!41 = !DILocation(line: 63, column: 2, scope: !7)
!42 = !DILocalVariable(name: "y_t", scope: !7, file: !1, line: 64, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 16384, align: 32, elements: !44)
!44 = !{!15}
!45 = !DILocation(line: 64, column: 6, scope: !7)
!46 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 62, type: !10)
!47 = !DILocation(line: 62, column: 8, scope: !7)
!48 = !DILocation(line: 68, column: 2, scope: !49)
!49 = !DILexicalBlockFile(scope: !50, file: !1, discriminator: 1)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 68, column: 2)
!51 = distinct !DILexicalBlock(scope: !7, file: !1, line: 68, column: 2)
!52 = !DILocation(line: 70, column: 3, scope: !53)
!53 = !DILexicalBlockFile(scope: !54, file: !1, discriminator: 1)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 70, column: 3)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 70, column: 3)
!56 = distinct !DILexicalBlock(scope: !50, file: !1, line: 68, column: 26)
!57 = !DILocation(line: 74, column: 3, scope: !58)
!58 = !DILexicalBlockFile(scope: !59, file: !1, discriminator: 1)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 74, column: 3)
!60 = distinct !DILexicalBlock(scope: !56, file: !1, line: 74, column: 3)
!61 = !DILocation(line: 71, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !54, file: !1, line: 70, column: 27)
!63 = !DILocation(line: 71, column: 4, scope: !62)
!64 = !DILocation(line: 71, column: 11, scope: !62)
!65 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 62, type: !10)
!66 = !DILocation(line: 62, column: 6, scope: !7)
!67 = !DILocation(line: 76, column: 4, scope: !68)
!68 = !DILexicalBlockFile(scope: !69, file: !1, discriminator: 1)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 76, column: 4)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 76, column: 4)
!71 = distinct !DILexicalBlock(scope: !59, file: !1, line: 74, column: 27)
!72 = !DILocalVariable(name: "sum", scope: !71, file: !1, line: 75, type: !10)
!73 = !DILocation(line: 75, column: 8, scope: !71)
!74 = !DILocation(line: 77, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !1, line: 76, column: 20)
!76 = !DILocation(line: 77, column: 25, scope: !75)
!77 = !DILocation(line: 77, column: 24, scope: !75)
!78 = !DILocation(line: 77, column: 15, scope: !75)
!79 = !DILocalVariable(name: "k", scope: !7, file: !1, line: 62, type: !10)
!80 = !DILocation(line: 62, column: 10, scope: !7)
!81 = !DILocation(line: 79, column: 4, scope: !71)
!82 = !DILocation(line: 79, column: 12, scope: !71)
!83 = !DILocation(line: 82, column: 75, scope: !7)
!84 = !DILocation(line: 82, column: 2, scope: !7)
!85 = !DILocation(line: 84, column: 5, scope: !7)
