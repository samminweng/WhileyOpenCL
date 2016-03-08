; ModuleID = 'MatrixAdd.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@A = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@B = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@C = common global [1024 x [1024 x i64]] zeroinitializer, align 16
@stdout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [6 x i8] c"%lld \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [51 x i8] c"Pass %d X %d matrix test case (C[%d][%d] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define void @init_array() #0 !dbg !4 {
entry:
  br label %entry.split, !dbg !24

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !25, metadata !26), !dbg !24
  br label %for.cond1.preheader, !dbg !27

for.cond1.preheader:                              ; preds = %for.inc10, %entry.split
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc10 ]
  br label %for.body3, !dbg !31

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !36
  store i64 1, i64* %arrayidx5, align 8, !dbg !38
  %arrayidx9 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !39
  store i64 1, i64* %arrayidx9, align 8, !dbg !40
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !31
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !41, metadata !26), !dbg !42
  %exitcond = icmp ne i64 %indvars.iv.next, 1024, !dbg !31
  br i1 %exitcond, label %for.body3, label %for.inc10, !dbg !31

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !27
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !25, metadata !26), !dbg !24
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 1024, !dbg !27
  br i1 %exitcond5, label %for.cond1.preheader, label %for.end12, !dbg !27

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !43
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @mat_add() #0 !dbg !7 {
entry:
  br label %entry.split, !dbg !44

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !45, metadata !26), !dbg !44
  br label %for.cond1.preheader, !dbg !46

for.cond1.preheader:                              ; preds = %for.inc14, %entry.split
  %indvars.iv3 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next4, %for.inc14 ]
  br label %for.body3, !dbg !50

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !55
  %0 = load i64, i64* %arrayidx5, align 8, !dbg !55
  %arrayidx9 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !57
  %1 = load i64, i64* %arrayidx9, align 8, !dbg !57
  %add = add nsw i64 %1, %0, !dbg !58
  %arrayidx13 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv3, i64 %indvars.iv, !dbg !59
  store i64 %add, i64* %arrayidx13, align 8, !dbg !60
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !50
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !61, metadata !26), !dbg !62
  %exitcond = icmp ne i64 %indvars.iv.next, 1024, !dbg !50
  br i1 %exitcond, label %for.body3, label %for.inc14, !dbg !50

for.inc14:                                        ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !dbg !46
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !45, metadata !26), !dbg !44
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 1024, !dbg !46
  br i1 %exitcond5, label %for.cond1.preheader, label %for.end16, !dbg !46

for.end16:                                        ; preds = %for.inc14
  ret void, !dbg !63
}

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !64

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !65, metadata !26), !dbg !64
  br label %for.cond1.preheader, !dbg !66

for.cond1.preheader:                              ; preds = %for.end, %entry.split
  %indvars.iv6 = phi i64 [ 0, %entry.split ], [ %indvars.iv.next7, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !70
  br label %for.body3, !dbg !75

for.body3:                                        ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %indvars.iv6, i64 %indvars.iv, !dbg !77
  %2 = load i64, i64* %arrayidx5, align 8, !dbg !77
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #3, !dbg !78
  %3 = trunc i64 %indvars.iv to i32, !dbg !79
  %rem = srem i32 %3, 80, !dbg !79
  %cmp6 = icmp eq i32 %rem, 79, !dbg !81
  br i1 %cmp6, label %if.then, label %for.inc, !dbg !82

if.then:                                          ; preds = %for.body3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !83
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4), !dbg !85
  br label %for.inc, !dbg !85

for.inc:                                          ; preds = %if.then, %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !75
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !86, metadata !26), !dbg !87
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !70
  %exitcond = icmp ne i64 %indvars.iv.next, 1024, !dbg !75
  br i1 %exitcond, label %for.body3, label %for.end, !dbg !75

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa), !dbg !88
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !dbg !66
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !65, metadata !26), !dbg !64
  %exitcond8 = icmp ne i64 %indvars.iv.next7, 1024, !dbg !66
  br i1 %exitcond8, label %for.cond1.preheader, label %for.end11, !dbg !66

for.end11:                                        ; preds = %for.end
  ret void, !dbg !89
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !9 {
entry:
  br label %entry.split, !dbg !90

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !91, metadata !26), !dbg !90
  br label %for.body, !dbg !92

for.body:                                         ; preds = %for.body, %entry.split
  %r.01 = phi i32 [ 0, %entry.split ], [ %inc, %for.body ]
  tail call void @init_array(), !dbg !96
  tail call void @mat_add(), !dbg !98
  %inc = add nuw nsw i32 %r.01, 1, !dbg !99
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !91, metadata !26), !dbg !90
  %exitcond = icmp ne i32 %inc, 100, !dbg !92
  br i1 %exitcond, label %for.body, label %for.end, !dbg !92

for.end:                                          ; preds = %for.body
  %0 = load i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 1023, i64 1023), align 8, !dbg !101
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.2, i64 0, i64 0), i32 1024, i32 1024, i32 1023, i32 1023, i64 %0) #3, !dbg !102
  ret i32 0, !dbg !103
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
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4, !7, !8, !9}
!4 = distinct !DISubprogram(name: "init_array", scope: !1, file: !1, line: 7, type: !5, isLocal: false, isDefinition: true, scopeLine: 8, isOptimized: false, variables: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 19, type: !5, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, variables: !2)
!8 = distinct !DISubprogram(name: "print_array", scope: !1, file: !1, line: 29, type: !5, isLocal: false, isDefinition: true, scopeLine: 30, isOptimized: false, variables: !2)
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 42, type: !10, isLocal: false, isDefinition: true, scopeLine: 43, isOptimized: false, variables: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!13 = !{!14, !19, !20}
!14 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !15, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @A)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 67108864, align: 64, elements: !17)
!16 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!17 = !{!18, !18}
!18 = !DISubrange(count: 1024)
!19 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !15, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @B)
!20 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !15, isLocal: false, isDefinition: true, variable: [1024 x [1024 x i64]]* @C)
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
!55 = !DILocation(line: 23, column: 23, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !1, line: 22, column: 29)
!57 = !DILocation(line: 23, column: 33, scope: !56)
!58 = !DILocation(line: 23, column: 31, scope: !56)
!59 = !DILocation(line: 23, column: 13, scope: !56)
!60 = !DILocation(line: 23, column: 21, scope: !56)
!61 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 20, type: !12)
!62 = !DILocation(line: 20, column: 12, scope: !7)
!63 = !DILocation(line: 27, column: 1, scope: !7)
!64 = !DILocation(line: 31, column: 9, scope: !8)
!65 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 31, type: !12)
!66 = !DILocation(line: 33, column: 5, scope: !67)
!67 = !DILexicalBlockFile(scope: !68, file: !1, discriminator: 1)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 33, column: 5)
!69 = distinct !DILexicalBlock(scope: !8, file: !1, line: 33, column: 5)
!70 = !DILocation(line: 35, column: 21, scope: !71)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 34, column: 29)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 34, column: 9)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 34, column: 9)
!74 = distinct !DILexicalBlock(scope: !68, file: !1, line: 33, column: 25)
!75 = !DILocation(line: 34, column: 9, scope: !76)
!76 = !DILexicalBlockFile(scope: !72, file: !1, discriminator: 1)
!77 = !DILocation(line: 35, column: 38, scope: !71)
!78 = !DILocation(line: 35, column: 13, scope: !71)
!79 = !DILocation(line: 36, column: 18, scope: !80)
!80 = distinct !DILexicalBlock(scope: !71, file: !1, line: 36, column: 17)
!81 = !DILocation(line: 36, column: 22, scope: !80)
!82 = !DILocation(line: 36, column: 17, scope: !71)
!83 = !DILocation(line: 36, column: 37, scope: !84)
!84 = !DILexicalBlockFile(scope: !80, file: !1, discriminator: 1)
!85 = !DILocation(line: 36, column: 29, scope: !84)
!86 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 31, type: !12)
!87 = !DILocation(line: 31, column: 12, scope: !8)
!88 = !DILocation(line: 38, column: 9, scope: !74)
!89 = !DILocation(line: 40, column: 1, scope: !8)
!90 = !DILocation(line: 47, column: 9, scope: !9)
!91 = !DILocalVariable(name: "r", scope: !9, file: !1, line: 47, type: !12)
!92 = !DILocation(line: 48, column: 5, scope: !93)
!93 = !DILexicalBlockFile(scope: !94, file: !1, discriminator: 1)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 48, column: 5)
!95 = distinct !DILexicalBlock(scope: !9, file: !1, line: 48, column: 5)
!96 = !DILocation(line: 49, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !1, line: 48, column: 23)
!98 = !DILocation(line: 50, column: 9, scope: !97)
!99 = !DILocation(line: 48, column: 20, scope: !100)
!100 = !DILexicalBlockFile(scope: !94, file: !1, discriminator: 2)
!101 = !DILocation(line: 53, column: 83, scope: !9)
!102 = !DILocation(line: 53, column: 5, scope: !9)
!103 = !DILocation(line: 54, column: 5, scope: !9)
