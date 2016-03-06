; ModuleID = 'VectorMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !8 {
entry:
  br label %entry.split, !dbg !17

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !18, metadata !19), !dbg !17
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !20, metadata !19), !dbg !21
  %call = tail call noalias i8* @malloc(i64 41943040) #5, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !24, metadata !19), !dbg !25
  %call1 = tail call noalias i8* @malloc(i64 41943040) #5, !dbg !26
  %1 = bitcast i8* %call1 to i32*, !dbg !27
  tail call void @llvm.dbg.value(metadata i32* %1, i64 0, metadata !28, metadata !19), !dbg !29
  %call2 = tail call noalias i8* @malloc(i64 40960) #5, !dbg !30
  tail call void @llvm.dbg.value(metadata i32* %2, i64 0, metadata !31, metadata !19), !dbg !32
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !19), !dbg !34
  br label %for.cond3.preheader, !dbg !35

for.cond3.preheader:                              ; preds = %entry.split, %for.inc10
  %r.07 = phi i64 [ 0, %entry.split ], [ %inc11, %for.inc10 ]
  br label %for.body5, !dbg !39

for.cond13.preheader:                             ; preds = %for.inc10
  %2 = bitcast i8* %call2 to i32*, !dbg !44
  br label %for.cond17.preheader, !dbg !45

for.body5:                                        ; preds = %for.cond3.preheader, %for.body5
  %indvars.iv10 = phi i64 [ 0, %for.cond3.preheader ], [ %indvars.iv.next11, %for.body5 ]
  %mul = shl i64 %r.07, 10, !dbg !49
  %add = add nuw nsw i64 %indvars.iv10, %mul, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %add, !dbg !52
  store i32 1, i32* %arrayidx, align 4, !dbg !53
  %mul6 = shl i64 %r.07, 10, !dbg !54
  %add8 = add nuw nsw i64 %indvars.iv10, %mul6, !dbg !55
  %arrayidx9 = getelementptr inbounds i32, i32* %1, i64 %add8, !dbg !56
  store i32 1, i32* %arrayidx9, align 4, !dbg !57
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1, !dbg !39
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !58, metadata !19), !dbg !59
  %exitcond12 = icmp ne i64 %indvars.iv.next11, 1024, !dbg !39
  br i1 %exitcond12, label %for.body5, label %for.inc10, !dbg !39

for.inc10:                                        ; preds = %for.body5
  %inc11 = add nuw nsw i64 %r.07, 1, !dbg !60
  tail call void @llvm.dbg.value(metadata i64 %inc11, i64 0, metadata !33, metadata !19), !dbg !34
  %exitcond13 = icmp ne i64 %inc11, 10240, !dbg !35
  br i1 %exitcond13, label %for.cond3.preheader, label %for.cond13.preheader, !dbg !35

for.cond17.preheader:                             ; preds = %for.cond13.preheader, %for.end33
  %r.15 = phi i64 [ 0, %for.cond13.preheader ], [ %inc36, %for.end33 ]
  br label %for.inc31, !dbg !62

for.cond39.preheader:                             ; preds = %for.end33
  br label %for.inc46, !dbg !67

for.inc31:                                        ; preds = %for.cond17.preheader, %for.inc31
  %indvars.iv = phi i64 [ 0, %for.cond17.preheader ], [ %indvars.iv.next, %for.inc31 ]
  %tmp.04 = phi i32 [ 0, %for.cond17.preheader ], [ %add30, %for.inc31 ]
  tail call void @llvm.dbg.value(metadata i32 %add30, i64 0, metadata !71, metadata !19), !dbg !72
  %mul21 = shl i64 %r.15, 10, !dbg !73
  %add23 = add nuw nsw i64 %indvars.iv, %mul21, !dbg !75
  %arrayidx24 = getelementptr inbounds i32, i32* %0, i64 %add23, !dbg !76
  %3 = load i32, i32* %arrayidx24, align 4, !dbg !76
  %mul25 = shl i64 %r.15, 10, !dbg !77
  %add27 = add nuw nsw i64 %indvars.iv, %mul25, !dbg !78
  %arrayidx28 = getelementptr inbounds i32, i32* %1, i64 %add27, !dbg !79
  %4 = load i32, i32* %arrayidx28, align 4, !dbg !79
  %mul29 = mul nsw i32 %4, %3, !dbg !80
  %add30 = add nsw i32 %mul29, %tmp.04, !dbg !81
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !62
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !58, metadata !19), !dbg !59
  %exitcond8 = icmp ne i64 %indvars.iv.next, 1024, !dbg !62
  br i1 %exitcond8, label %for.inc31, label %for.end33, !dbg !62

for.end33:                                        ; preds = %for.inc31
  %add30.lcssa = phi i32 [ %add30, %for.inc31 ]
  %arrayidx34 = getelementptr inbounds i32, i32* %2, i64 %r.15, !dbg !82
  store i32 %add30.lcssa, i32* %arrayidx34, align 4, !dbg !83
  %inc36 = add nuw nsw i64 %r.15, 1, !dbg !84
  tail call void @llvm.dbg.value(metadata i64 %inc36, i64 0, metadata !33, metadata !19), !dbg !34
  %exitcond9 = icmp ne i64 %inc36, 10240, !dbg !45
  br i1 %exitcond9, label %for.cond17.preheader, label %for.cond39.preheader, !dbg !45

for.inc46:                                        ; preds = %for.cond39.preheader, %for.inc46
  %total.02 = phi i64 [ 0, %for.cond39.preheader ], [ %add45, %for.inc46 ]
  %r.21 = phi i64 [ 0, %for.cond39.preheader ], [ %inc47, %for.inc46 ]
  tail call void @llvm.dbg.value(metadata i64 %add45, i64 0, metadata !86, metadata !19), !dbg !87
  %arrayidx43 = getelementptr inbounds i32, i32* %2, i64 %r.21, !dbg !88
  %5 = load i32, i32* %arrayidx43, align 4, !dbg !88
  %conv44 = sext i32 %5 to i64, !dbg !88
  %add45 = add nsw i64 %conv44, %total.02, !dbg !90
  %inc47 = add nuw nsw i64 %r.21, 1, !dbg !91
  tail call void @llvm.dbg.value(metadata i64 %inc47, i64 0, metadata !33, metadata !19), !dbg !34
  %exitcond = icmp ne i64 %inc47, 10240, !dbg !67
  br i1 %exitcond, label %for.inc46, label %for.end48, !dbg !67

for.end48:                                        ; preds = %for.inc46
  %add45.lcssa = phi i64 [ %add45, %for.inc46 ]
  %cmp49 = icmp eq i64 %add45.lcssa, 10485760, !dbg !93
  br i1 %cmp49, label %if.end, label %if.then, !dbg !95

if.then:                                          ; preds = %for.end48
  %call51 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #5, !dbg !96
  tail call void @exit(i32 -2) #6, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %for.end48
  %call52 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #5, !dbg !99
  %call53 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 10485760, i32 1024, i64 %add45.lcssa) #5, !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !7)
!1 = !DIFile(filename: "VectorMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/VectorMult/impl/handwritten")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!7 = !{!8}
!8 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 8, type: !9, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!9 = !DISubroutineType(types: !10)
!10 = !{!5, !5, !11}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64, align: 64)
!13 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!14 = !{i32 2, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!17 = !DILocation(line: 8, column: 14, scope: !8)
!18 = !DILocalVariable(name: "argc", arg: 1, scope: !8, file: !1, line: 8, type: !5)
!19 = !DIExpression()
!20 = !DILocalVariable(name: "args", arg: 2, scope: !8, file: !1, line: 8, type: !11)
!21 = !DILocation(line: 8, column: 27, scope: !8)
!22 = !DILocation(line: 12, column: 18, scope: !8)
!23 = !DILocation(line: 12, column: 11, scope: !8)
!24 = !DILocalVariable(name: "u", scope: !8, file: !1, line: 12, type: !4)
!25 = !DILocation(line: 12, column: 7, scope: !8)
!26 = !DILocation(line: 13, column: 18, scope: !8)
!27 = !DILocation(line: 13, column: 11, scope: !8)
!28 = !DILocalVariable(name: "v", scope: !8, file: !1, line: 13, type: !4)
!29 = !DILocation(line: 13, column: 7, scope: !8)
!30 = !DILocation(line: 14, column: 20, scope: !8)
!31 = !DILocalVariable(name: "sum", scope: !8, file: !1, line: 14, type: !4)
!32 = !DILocation(line: 14, column: 7, scope: !8)
!33 = !DILocalVariable(name: "r", scope: !8, file: !1, line: 11, type: !6)
!34 = !DILocation(line: 11, column: 12, scope: !8)
!35 = !DILocation(line: 17, column: 2, scope: !36)
!36 = !DILexicalBlockFile(scope: !37, file: !1, discriminator: 1)
!37 = distinct !DILexicalBlock(scope: !38, file: !1, line: 17, column: 2)
!38 = distinct !DILexicalBlock(scope: !8, file: !1, line: 17, column: 2)
!39 = !DILocation(line: 19, column: 3, scope: !40)
!40 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 1)
!41 = distinct !DILexicalBlock(scope: !42, file: !1, line: 19, column: 3)
!42 = distinct !DILexicalBlock(scope: !43, file: !1, line: 19, column: 3)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 17, column: 18)
!44 = !DILocation(line: 14, column: 13, scope: !8)
!45 = !DILocation(line: 25, column: 2, scope: !46)
!46 = !DILexicalBlockFile(scope: !47, file: !1, discriminator: 1)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 25, column: 2)
!48 = distinct !DILexicalBlock(scope: !8, file: !1, line: 25, column: 2)
!49 = !DILocation(line: 20, column: 7, scope: !50)
!50 = distinct !DILexicalBlock(scope: !41, file: !1, line: 19, column: 21)
!51 = !DILocation(line: 20, column: 9, scope: !50)
!52 = !DILocation(line: 20, column: 4, scope: !50)
!53 = !DILocation(line: 20, column: 13, scope: !50)
!54 = !DILocation(line: 21, column: 7, scope: !50)
!55 = !DILocation(line: 21, column: 9, scope: !50)
!56 = !DILocation(line: 21, column: 4, scope: !50)
!57 = !DILocation(line: 21, column: 13, scope: !50)
!58 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 9, type: !5)
!59 = !DILocation(line: 9, column: 6, scope: !8)
!60 = !DILocation(line: 17, column: 15, scope: !61)
!61 = !DILexicalBlockFile(scope: !37, file: !1, discriminator: 2)
!62 = !DILocation(line: 27, column: 3, scope: !63)
!63 = !DILexicalBlockFile(scope: !64, file: !1, discriminator: 1)
!64 = distinct !DILexicalBlock(scope: !65, file: !1, line: 27, column: 3)
!65 = distinct !DILexicalBlock(scope: !66, file: !1, line: 27, column: 3)
!66 = distinct !DILexicalBlock(scope: !47, file: !1, line: 25, column: 18)
!67 = !DILocation(line: 35, column: 2, scope: !68)
!68 = !DILexicalBlockFile(scope: !69, file: !1, discriminator: 1)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 35, column: 2)
!70 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 2)
!71 = !DILocalVariable(name: "tmp", scope: !66, file: !1, line: 26, type: !5)
!72 = !DILocation(line: 26, column: 7, scope: !66)
!73 = !DILocation(line: 29, column: 18, scope: !74)
!74 = distinct !DILexicalBlock(scope: !64, file: !1, line: 27, column: 21)
!75 = !DILocation(line: 29, column: 20, scope: !74)
!76 = !DILocation(line: 29, column: 15, scope: !74)
!77 = !DILocation(line: 29, column: 27, scope: !74)
!78 = !DILocation(line: 29, column: 29, scope: !74)
!79 = !DILocation(line: 29, column: 24, scope: !74)
!80 = !DILocation(line: 29, column: 23, scope: !74)
!81 = !DILocation(line: 29, column: 13, scope: !74)
!82 = !DILocation(line: 31, column: 3, scope: !66)
!83 = !DILocation(line: 31, column: 10, scope: !66)
!84 = !DILocation(line: 25, column: 15, scope: !85)
!85 = !DILexicalBlockFile(scope: !47, file: !1, discriminator: 2)
!86 = !DILocalVariable(name: "total", scope: !8, file: !1, line: 34, type: !6)
!87 = !DILocation(line: 34, column: 12, scope: !8)
!88 = !DILocation(line: 36, column: 19, scope: !89)
!89 = distinct !DILexicalBlock(scope: !69, file: !1, line: 35, column: 18)
!90 = !DILocation(line: 36, column: 17, scope: !89)
!91 = !DILocation(line: 35, column: 15, scope: !92)
!92 = !DILexicalBlockFile(scope: !69, file: !1, discriminator: 2)
!93 = !DILocation(line: 40, column: 11, scope: !94)
!94 = distinct !DILexicalBlock(scope: !8, file: !1, line: 40, column: 5)
!95 = !DILocation(line: 40, column: 5, scope: !8)
!96 = !DILocation(line: 41, column: 3, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !1, line: 40, column: 19)
!98 = !DILocation(line: 42, column: 3, scope: !97)
!99 = !DILocation(line: 46, column: 2, scope: !8)
!100 = !DILocation(line: 47, column: 2, scope: !8)
!101 = !DILocation(line: 49, column: 2, scope: !8)
