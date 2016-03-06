; ModuleID = 'MatrixMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@B = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@C = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  br label %entry.split, !dbg !23

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !25), !dbg !23
  br label %for.cond1.preheader, !dbg !26

for.cond1.preheader:                              ; preds = %entry.split, %for.inc10
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc10 ]
  br label %for.body3, !dbg !30

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !35
  store i64 1, i64* %arrayidx5, align 8, !dbg !37
  %arrayidx9 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !38
  store i64 1, i64* %arrayidx9, align 8, !dbg !39
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !30
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !40, metadata !25), !dbg !41
  %exitcond = icmp ne i64 %indvars.iv.next, 1024, !dbg !30
  br i1 %exitcond, label %for.body3, label %for.inc10, !dbg !30

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !26
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !24, metadata !25), !dbg !23
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 1024, !dbg !26
  br i1 %exitcond5, label %for.cond1.preheader, label %for.end12, !dbg !26

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !42
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !7 {
entry:
  br label %entry.split, !dbg !43

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !44, metadata !25), !dbg !43
  br label %for.cond1.preheader, !dbg !45

for.cond1.preheader:                              ; preds = %entry.split, %for.end
  %indvars.iv6 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !49
  br label %for.body3, !dbg !54

for.body3:                                        ; preds = %for.cond1.preheader, %for.inc
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !56
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !56
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #3, !dbg !57
  %3 = trunc i64 %indvars.iv to i32, !dbg !58
  %rem = srem i32 %3, 80, !dbg !58
  %cmp6 = icmp eq i32 %rem, 79, !dbg !60
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !61

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !62
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !64
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !54
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !65, metadata !25), !dbg !66
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !49
  %exitcond = icmp ne i64 %indvars.iv.next, 1024, !dbg !54
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !54

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !67
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !45
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !44, metadata !25), !dbg !43
  %exitcond8 = icmp ne i64 %indvars.iv.next7, 1024, !dbg !45
  br i1 %exitcond8, label %for.cond1.preheader, label %for.end11, !dbg !45

for.end11:                                        ; preds = %for.end
  ret void, !dbg !68
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !69

entry.split:                                      ; preds = %entry
  tail call void @init_array(), !dbg !69
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !70, metadata !25), !dbg !71
  br label %for.cond1.preheader, !dbg !72

for.cond1.preheader:                              ; preds = %entry.split, %for.inc28
  %indvars.iv7 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next8, %for.inc28 ]
  br label %for.body3, !dbg !76

for.body3:                                        ; preds = %for.cond1.preheader, %for.inc25
  %indvars.iv4 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next5, %for.inc25 ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !81
  store i64 0, i64* %arrayidx5, align 8, !dbg !83
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !84, metadata !25), !dbg !85
  br label %for.body8, !dbg !86

for.body8:                                        ; preds = %for.body3, %for.body8
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !90
  %0 = load i64, i64* %arrayidx12, align 8, !dbg !90
  %arrayidx16 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv7, i64 %indvars.iv, !dbg !91
  %1 = load i64, i64* %arrayidx16, align 8, !dbg !91
  %arrayidx20 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv4, !dbg !92
  %2 = load i64, i64* %arrayidx20, align 8, !dbg !92
  %mul = mul nsw i64 %2, %1, !dbg !93
  %add = add nsw i64 %mul, %0, !dbg !94
  %arrayidx24 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv7, i64 %indvars.iv4, !dbg !95
  store i64 %add, i64* %arrayidx24, align 8, !dbg !96
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !86
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !84, metadata !25), !dbg !85
  %exitcond = icmp ne i64 %indvars.iv.next, 1024, !dbg !86
  br i1 %exitcond, label %for.body8, label %for.inc25, !dbg !86

for.inc25:                                        ; preds = %for.body8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !dbg !76
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !97, metadata !25), !dbg !98
  %exitcond6 = icmp ne i64 %indvars.iv.next5, 1024, !dbg !76
  br i1 %exitcond6, label %for.body3, label %for.inc28, !dbg !76

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !72
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !70, metadata !25), !dbg !71
  %exitcond9 = icmp ne i64 %indvars.iv.next8, 1024, !dbg !72
  br i1 %exitcond9, label %for.cond1.preheader, label %for.end30, !dbg !72

for.end30:                                        ; preds = %for.inc28
  %3 = load i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 1023, i64 1023), align 8, !dbg !99
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0), i32 1024, i32 1024, i64 %3) #3, !dbg !100
  ret i32 0, !dbg !101
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
!llvm.module.flags = !{!20, !21}
!llvm.ident = !{!22}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !12)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8}
!4 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 7, type: !5, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 19, type: !5, isLocal: false, isDefinition: true, scopeLine: 20, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 32, type: !9, isLocal: false, isDefinition: true, scopeLine: 33, isOptimized: false, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!11}
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !{!13, !18, !19}
!13 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !14, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @A)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 67108864, align: 64, elements: !16)
!15 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!16 = !{!17, !17}
!17 = !DISubrange(count: 1024)
!18 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !14, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @B)
!19 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !14, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @C)
!20 = !{i32 2, !"Dwarf Version", i32 4}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!23 = !DILocation(line: 9, column: 9, scope: !4)
!24 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !11)
!25 = !DIExpression()
!26 = !DILocation(line: 11, column: 5, scope: !27)
!27 = !DILexicalBlockFile(scope: !28, file: !1, discriminator: 1)
!28 = distinct !DILexicalBlock(scope: !29, file: !1, line: 11, column: 5)
!29 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 5)
!30 = !DILocation(line: 12, column: 9, scope: !31)
!31 = !DILexicalBlockFile(scope: !32, file: !1, discriminator: 1)
!32 = distinct !DILexicalBlock(scope: !33, file: !1, line: 12, column: 9)
!33 = distinct !DILexicalBlock(scope: !34, file: !1, line: 12, column: 9)
!34 = distinct !DILexicalBlock(scope: !28, file: !1, line: 11, column: 25)
!35 = !DILocation(line: 13, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !1, line: 12, column: 29)
!37 = !DILocation(line: 13, column: 21, scope: !36)
!38 = !DILocation(line: 14, column: 13, scope: !36)
!39 = !DILocation(line: 14, column: 21, scope: !36)
!40 = !DILocalVariable(name: "j", scope: !4, file: !1, line: 9, type: !11)
!41 = !DILocation(line: 9, column: 12, scope: !4)
!42 = !DILocation(line: 17, column: 1, scope: !4)
!43 = !DILocation(line: 21, column: 9, scope: !7)
!44 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 21, type: !11)
!45 = !DILocation(line: 23, column: 5, scope: !46)
!46 = !DILexicalBlockFile(scope: !47, file: !1, discriminator: 1)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 23, column: 5)
!48 = distinct !DILexicalBlock(scope: !7, file: !1, line: 23, column: 5)
!49 = !DILocation(line: 25, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 24, column: 29)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 24, column: 9)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 24, column: 9)
!53 = distinct !DILexicalBlock(scope: !47, file: !1, line: 23, column: 25)
!54 = !DILocation(line: 24, column: 9, scope: !55)
!55 = !DILexicalBlockFile(scope: !51, file: !1, discriminator: 1)
!56 = !DILocation(line: 25, column: 38, scope: !50)
!57 = !DILocation(line: 25, column: 13, scope: !50)
!58 = !DILocation(line: 26, column: 18, scope: !59)
!59 = distinct !DILexicalBlock(scope: !50, file: !1, line: 26, column: 17)
!60 = !DILocation(line: 26, column: 22, scope: !59)
!61 = !DILocation(line: 26, column: 17, scope: !50)
!62 = !DILocation(line: 26, column: 37, scope: !63)
!63 = !DILexicalBlockFile(scope: !59, file: !1, discriminator: 1)
!64 = !DILocation(line: 26, column: 29, scope: !63)
!65 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 21, type: !11)
!66 = !DILocation(line: 21, column: 12, scope: !7)
!67 = !DILocation(line: 28, column: 9, scope: !53)
!68 = !DILocation(line: 30, column: 1, scope: !7)
!69 = !DILocation(line: 37, column: 5, scope: !8)
!70 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 34, type: !11)
!71 = !DILocation(line: 34, column: 9, scope: !8)
!72 = !DILocation(line: 39, column: 5, scope: !73)
!73 = !DILexicalBlockFile(scope: !74, file: !1, discriminator: 1)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 39, column: 5)
!75 = distinct !DILexicalBlock(scope: !8, file: !1, line: 39, column: 5)
!76 = !DILocation(line: 40, column: 9, scope: !77)
!77 = !DILexicalBlockFile(scope: !78, file: !1, discriminator: 1)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 40, column: 9)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 40, column: 9)
!80 = distinct !DILexicalBlock(scope: !74, file: !1, line: 39, column: 25)
!81 = !DILocation(line: 41, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !1, line: 40, column: 29)
!83 = !DILocation(line: 41, column: 21, scope: !82)
!84 = !DILocalVariable(name: "k", scope: !8, file: !1, line: 34, type: !11)
!85 = !DILocation(line: 34, column: 15, scope: !8)
!86 = !DILocation(line: 42, column: 13, scope: !87)
!87 = !DILexicalBlockFile(scope: !88, file: !1, discriminator: 1)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 42, column: 13)
!89 = distinct !DILexicalBlock(scope: !82, file: !1, line: 42, column: 13)
!90 = !DILocation(line: 43, column: 27, scope: !88)
!91 = !DILocation(line: 43, column: 37, scope: !88)
!92 = !DILocation(line: 43, column: 47, scope: !88)
!93 = !DILocation(line: 43, column: 45, scope: !88)
!94 = !DILocation(line: 43, column: 35, scope: !88)
!95 = !DILocation(line: 43, column: 17, scope: !88)
!96 = !DILocation(line: 43, column: 25, scope: !88)
!97 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 34, type: !11)
!98 = !DILocation(line: 34, column: 12, scope: !8)
!99 = !DILocation(line: 47, column: 71, scope: !8)
!100 = !DILocation(line: 47, column: 5, scope: !8)
!101 = !DILocation(line: 48, column: 5, scope: !8)
