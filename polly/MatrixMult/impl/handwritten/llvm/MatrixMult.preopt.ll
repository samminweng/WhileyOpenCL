; ModuleID = 'MatrixMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [32 x [32 x i64]] zeroinitializer, align 16
@B = common global [32 x [32 x i64]] zeroinitializer, align 16
@C = common global [32 x [32 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  br label %entry.split, !dbg !24

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !24
  br label %for.cond1.preheader, !dbg !27

for.cond1.preheader:                              ; preds = %entry.split, %for.inc10
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc10 ]
  br label %for.body3, !dbg !31

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !36
  store i64 1, i64* %arrayidx5, align 8, !dbg !38
  %arrayidx9 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !39
  store i64 1, i64* %arrayidx9, align 8, !dbg !40
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !31
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !41, metadata !26), !dbg !42
  %exitcond = icmp ne i64 %indvars.iv.next, 32, !dbg !31
  br i1 %exitcond, label %for.body3, label %for.inc10, !dbg !31

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !27
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !25, metadata !26), !dbg !24
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 32, !dbg !27
  br i1 %exitcond5, label %for.cond1.preheader, label %for.end12, !dbg !27

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !43
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @mat_mult() #0 !dbg !7 {
entry:
  br label %entry.split, !dbg !44

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !45, metadata !26), !dbg !44
  br label %for.cond1.preheader, !dbg !46

for.cond1.preheader:                              ; preds = %entry.split, %for.inc28
  %indvars.iv7 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next8, %for.inc28 ]
  br label %for.body3, !dbg !50

for.body3:                                        ; preds = %for.cond1.preheader, %for.inc25
  %indvars.iv4 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next5, %for.inc25 ]
  %arrayidx5 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !55
  store i64 0, i64* %arrayidx5, align 8, !dbg !57
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !58, metadata !26), !dbg !59
  br label %for.body8, !dbg !60

for.body8:                                        ; preds = %for.body3, %for.body8
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !64
  %0 = load i64, i64* %arrayidx12, align 8, !dbg !64
  %arrayidx16 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @A, i64 0, i64 %indvars.iv7, i64 %indvars.iv, !dbg !65
  %1 = load i64, i64* %arrayidx16, align 8, !dbg !65
  %arrayidx20 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv4, !dbg !66
  %2 = load i64, i64* %arrayidx20, align 8, !dbg !66
  %mul = mul nsw i64 %2, %1, !dbg !67
  %add = add nsw i64 %mul, %0, !dbg !68
  %arrayidx24 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !69
  store i64 %add, i64* %arrayidx24, align 8, !dbg !70
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !60
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !58, metadata !26), !dbg !59
  %exitcond = icmp ne i64 %indvars.iv.next, 32, !dbg !60
  br i1 %exitcond, label %for.body8, label %for.inc25, !dbg !60

for.inc25:                                        ; preds = %for.body8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !50
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !71, metadata !26), !dbg !72
  %exitcond6 = icmp ne i64 %indvars.iv.next5, 32, !dbg !50
  br i1 %exitcond6, label %for.body3, label %for.inc28, !dbg !50

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !46
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !45, metadata !26), !dbg !44
  %exitcond9 = icmp ne i64 %indvars.iv.next8, 32, !dbg !46
  br i1 %exitcond9, label %for.cond1.preheader, label %for.end30, !dbg !46

for.end30:                                        ; preds = %for.inc28
  ret void, !dbg !73
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !74

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !75, metadata !26), !dbg !74
  br label %for.cond1.preheader, !dbg !76

for.cond1.preheader:                              ; preds = %entry.split, %for.end
  %indvars.iv6 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !80
  br label %for.body3, !dbg !85

for.body3:                                        ; preds = %for.cond1.preheader, %for.inc
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %4, %for.inc ]
  %arrayidx5 = getelementptr inbounds [32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !87
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !87
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #3, !dbg !88
  br i1 false, label %if.then, label %for.inc, !dbg !89

if.then:                                          ; preds = %for.body3
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !90
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3), !dbg !93
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !85
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !94, metadata !26), !dbg !95
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !80
  %exitcond = icmp ne i64 %indvars.iv.next, 32, !dbg !85
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !85

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %4, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !96
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !76
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !75, metadata !26), !dbg !74
  %exitcond8 = icmp ne i64 %indvars.iv.next7, 32, !dbg !76
  br i1 %exitcond8, label %for.cond1.preheader, label %for.end11, !dbg !76

for.end11:                                        ; preds = %for.end
  ret void, !dbg !97
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !9 {
entry:
  br label %entry.split, !dbg !98

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !99, metadata !26), !dbg !98
  br label %for.body, !dbg !100

for.body:                                         ; preds = %entry.split, %for.body
  %r.01 = phi i32 [ 0, %entry.split ], [ %inc, %for.body ]
  tail call void @init_array(), !dbg !104
  tail call void @mat_mult(), !dbg !106
  %inc = add nuw nsw i32 %r.01, 1, !dbg !107
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !99, metadata !26), !dbg !98
  %exitcond = icmp ne i32 %inc, 10000, !dbg !100
  br i1 %exitcond, label %for.body, label %for.end, !dbg !100

for.end:                                          ; preds = %for.body
  %0 = load i64, i64* getelementptr inbounds ([32 x [32 x i64]], [32 x [32 x i64]]* @C, i64 0, i64 31, i64 31), align 8, !dbg !109
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 32, i32 32, i64 %0) #3, !dbg !110
  ret i32 0, !dbg !111
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22}
!llvm.ident = !{!23}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !13)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8, !9}
!4 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 7, type: !5, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 19, type: !5, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 31, type: !5, isLocal: false, isDefinition: true, scopeLine: 32, isOptimized: false, variables: !2)
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 44, type: !10, isLocal: false, isDefinition: true, scopeLine: 45, isOptimized: false, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !{!14, !19, !20}
!14 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !15, isLocal: false, isDefinition: true, variable: [32 x [32 x i64]]* @A)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 65536, align: 64, elements: !17)
!16 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!17 = !{!18, !18}
!18 = !DISubrange(count: 32)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !15, isLocal: false, isDefinition: true, variable: [32 x [32 x i64]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !15, isLocal: false, isDefinition: true, variable: [32 x [32 x i64]]* @C)
!21 = !{i32 2, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!24 = !DILocation(line: 9, column: 9, scope: !4)
!25 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !12)
!26 = !DIExpression()
!27 = !DILocation(line: 11, column: 5, scope: !28)
!28 = !DILexicalBlockFile(scope: !29, file: !1, discriminator: 1)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 11, column: 5)
!30 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 5)
!31 = !DILocation(line: 12, column: 9, scope: !32)
!32 = !DILexicalBlockFile(scope: !33, file: !1, discriminator: 1)
!33 = distinct !DILexicalBlock(scope: !34, file: !1, line: 12, column: 9)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 12, column: 9)
!35 = distinct !DILexicalBlock(scope: !29, file: !1, line: 11, column: 25)
!36 = !DILocation(line: 13, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !1, line: 12, column: 29)
!38 = !DILocation(line: 13, column: 21, scope: !37)
!39 = !DILocation(line: 14, column: 13, scope: !37)
!40 = !DILocation(line: 14, column: 21, scope: !37)
!41 = !DILocalVariable(name: "j", scope: !4, file: !1, line: 9, type: !12)
!42 = !DILocation(line: 9, column: 12, scope: !4)
!43 = !DILocation(line: 17, column: 1, scope: !4)
!44 = !DILocation(line: 20, column: 9, scope: !7)
!45 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 20, type: !12)
!46 = !DILocation(line: 21, column: 5, scope: !47)
!47 = !DILexicalBlockFile(scope: !48, file: !1, discriminator: 1)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 21, column: 5)
!49 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!50 = !DILocation(line: 22, column: 9, scope: !51)
!51 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 1)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 22, column: 9)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 22, column: 9)
!54 = distinct !DILexicalBlock(scope: !48, file: !1, line: 21, column: 25)
!55 = !DILocation(line: 23, column: 13, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !1, line: 22, column: 29)
!57 = !DILocation(line: 23, column: 21, scope: !56)
!58 = !DILocalVariable(name: "k", scope: !7, file: !1, line: 20, type: !12)
!59 = !DILocation(line: 20, column: 15, scope: !7)
!60 = !DILocation(line: 24, column: 13, scope: !61)
!61 = !DILexicalBlockFile(scope: !62, file: !1, discriminator: 1)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 24, column: 13)
!63 = distinct !DILexicalBlock(scope: !56, file: !1, line: 24, column: 13)
!64 = !DILocation(line: 25, column: 27, scope: !62)
!65 = !DILocation(line: 25, column: 37, scope: !62)
!66 = !DILocation(line: 25, column: 47, scope: !62)
!67 = !DILocation(line: 25, column: 45, scope: !62)
!68 = !DILocation(line: 25, column: 35, scope: !62)
!69 = !DILocation(line: 25, column: 17, scope: !62)
!70 = !DILocation(line: 25, column: 25, scope: !62)
!71 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 20, type: !12)
!72 = !DILocation(line: 20, column: 12, scope: !7)
!73 = !DILocation(line: 29, column: 1, scope: !7)
!74 = !DILocation(line: 33, column: 9, scope: !8)
!75 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 33, type: !12)
!76 = !DILocation(line: 35, column: 5, scope: !77)
!77 = !DILexicalBlockFile(scope: !78, file: !1, discriminator: 1)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 35, column: 5)
!79 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 5)
!80 = !DILocation(line: 37, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 36, column: 29)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 36, column: 9)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 36, column: 9)
!84 = distinct !DILexicalBlock(scope: !78, file: !1, line: 35, column: 25)
!85 = !DILocation(line: 36, column: 9, scope: !86)
!86 = !DILexicalBlockFile(scope: !82, file: !1, discriminator: 1)
!87 = !DILocation(line: 37, column: 38, scope: !81)
!88 = !DILocation(line: 37, column: 13, scope: !81)
!89 = !DILocation(line: 38, column: 17, scope: !81)
!90 = !DILocation(line: 38, column: 37, scope: !91)
!91 = !DILexicalBlockFile(scope: !92, file: !1, discriminator: 1)
!92 = distinct !DILexicalBlock(scope: !81, file: !1, line: 38, column: 17)
!93 = !DILocation(line: 38, column: 29, scope: !91)
!94 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 33, type: !12)
!95 = !DILocation(line: 33, column: 12, scope: !8)
!96 = !DILocation(line: 40, column: 9, scope: !84)
!97 = !DILocation(line: 42, column: 1, scope: !8)
!98 = !DILocation(line: 49, column: 9, scope: !9)
!99 = !DILocalVariable(name: "r", scope: !9, file: !1, line: 49, type: !12)
!100 = !DILocation(line: 50, column: 5, scope: !101)
!101 = !DILexicalBlockFile(scope: !102, file: !1, discriminator: 1)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 50, column: 5)
!103 = distinct !DILexicalBlock(scope: !9, file: !1, line: 50, column: 5)
!104 = !DILocation(line: 51, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !1, line: 50, column: 25)
!106 = !DILocation(line: 52, column: 9, scope: !105)
!107 = !DILocation(line: 50, column: 22, scope: !108)
!108 = !DILexicalBlockFile(scope: !102, file: !1, discriminator: 2)
!109 = !DILocation(line: 55, column: 71, scope: !9)
!110 = !DILocation(line: 55, column: 5, scope: !9)
!111 = !DILocation(line: 56, column: 5, scope: !9)
