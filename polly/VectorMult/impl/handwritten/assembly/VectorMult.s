; ModuleID = 'VectorMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !8 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %r = alloca i64, align 8
  %u = alloca i32*, align 8
  %v = alloca i32*, align 8
  %sum = alloca i32*, align 8
  %tmp = alloca i32, align 4
  %total = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !17, metadata !18), !dbg !19
  store i8** %args, i8*** %args.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %args.addr, metadata !20, metadata !18), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !18), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %r, metadata !24, metadata !18), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %u, metadata !26, metadata !18), !dbg !27
  %call = call noalias i8* @malloc(i64 41943040) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %u, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %v, metadata !30, metadata !18), !dbg !31
  %call1 = call noalias i8* @malloc(i64 41943040) #5, !dbg !32
  %1 = bitcast i8* %call1 to i32*, !dbg !33
  store i32* %1, i32** %v, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %sum, metadata !34, metadata !18), !dbg !35
  %call2 = call noalias i8* @malloc(i64 40960) #5, !dbg !36
  %2 = bitcast i8* %call2 to i32*, !dbg !37
  store i32* %2, i32** %sum, align 8, !dbg !35
  store i64 0, i64* %r, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc10, %entry
  %3 = load i64, i64* %r, align 8, !dbg !41
  %cmp = icmp slt i64 %3, 10240, !dbg !44
  br i1 %cmp, label %for.body, label %for.end12, !dbg !45

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !46
  br label %for.cond3, !dbg !49

for.cond3:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %i, align 4, !dbg !50
  %cmp4 = icmp slt i32 %4, 1024, !dbg !53
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !54

for.body5:                                        ; preds = %for.cond3
  %5 = load i64, i64* %r, align 8, !dbg !55
  %mul = mul nsw i64 %5, 1024, !dbg !57
  %6 = load i32, i32* %i, align 4, !dbg !58
  %conv = sext i32 %6 to i64, !dbg !58
  %add = add nsw i64 %mul, %conv, !dbg !59
  %7 = load i32*, i32** %u, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 %add, !dbg !60
  store i32 1, i32* %arrayidx, align 4, !dbg !61
  %8 = load i64, i64* %r, align 8, !dbg !62
  %mul6 = mul nsw i64 %8, 1024, !dbg !63
  %9 = load i32, i32* %i, align 4, !dbg !64
  %conv7 = sext i32 %9 to i64, !dbg !64
  %add8 = add nsw i64 %mul6, %conv7, !dbg !65
  %10 = load i32*, i32** %v, align 8, !dbg !66
  %arrayidx9 = getelementptr inbounds i32, i32* %10, i64 %add8, !dbg !66
  store i32 1, i32* %arrayidx9, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body5
  %11 = load i32, i32* %i, align 4, !dbg !69
  %inc = add nsw i32 %11, 1, !dbg !69
  store i32 %inc, i32* %i, align 4, !dbg !69
  br label %for.cond3, !dbg !71

for.end:                                          ; preds = %for.cond3
  br label %for.inc10, !dbg !72

for.inc10:                                        ; preds = %for.end
  %12 = load i64, i64* %r, align 8, !dbg !73
  %inc11 = add nsw i64 %12, 1, !dbg !73
  store i64 %inc11, i64* %r, align 8, !dbg !73
  br label %for.cond, !dbg !75

for.end12:                                        ; preds = %for.cond
  store i64 0, i64* %r, align 8, !dbg !76
  br label %for.cond13, !dbg !78

for.cond13:                                       ; preds = %for.inc35, %for.end12
  %13 = load i64, i64* %r, align 8, !dbg !79
  %cmp14 = icmp slt i64 %13, 10240, !dbg !82
  br i1 %cmp14, label %for.body16, label %for.end37, !dbg !83

for.body16:                                       ; preds = %for.cond13
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !84, metadata !18), !dbg !86
  store i32 0, i32* %tmp, align 4, !dbg !86
  store i32 0, i32* %i, align 4, !dbg !87
  br label %for.cond17, !dbg !89

for.cond17:                                       ; preds = %for.inc31, %for.body16
  %14 = load i32, i32* %i, align 4, !dbg !90
  %cmp18 = icmp slt i32 %14, 1024, !dbg !93
  br i1 %cmp18, label %for.body20, label %for.end33, !dbg !94

for.body20:                                       ; preds = %for.cond17
  %15 = load i32, i32* %tmp, align 4, !dbg !95
  %16 = load i64, i64* %r, align 8, !dbg !97
  %mul21 = mul nsw i64 %16, 1024, !dbg !98
  %17 = load i32, i32* %i, align 4, !dbg !99
  %conv22 = sext i32 %17 to i64, !dbg !99
  %add23 = add nsw i64 %mul21, %conv22, !dbg !100
  %18 = load i32*, i32** %u, align 8, !dbg !101
  %arrayidx24 = getelementptr inbounds i32, i32* %18, i64 %add23, !dbg !101
  %19 = load i32, i32* %arrayidx24, align 4, !dbg !101
  %20 = load i64, i64* %r, align 8, !dbg !102
  %mul25 = mul nsw i64 %20, 1024, !dbg !103
  %21 = load i32, i32* %i, align 4, !dbg !104
  %conv26 = sext i32 %21 to i64, !dbg !104
  %add27 = add nsw i64 %mul25, %conv26, !dbg !105
  %22 = load i32*, i32** %v, align 8, !dbg !106
  %arrayidx28 = getelementptr inbounds i32, i32* %22, i64 %add27, !dbg !106
  %23 = load i32, i32* %arrayidx28, align 4, !dbg !106
  %mul29 = mul nsw i32 %19, %23, !dbg !107
  %add30 = add nsw i32 %15, %mul29, !dbg !108
  store i32 %add30, i32* %tmp, align 4, !dbg !109
  br label %for.inc31, !dbg !110

for.inc31:                                        ; preds = %for.body20
  %24 = load i32, i32* %i, align 4, !dbg !111
  %inc32 = add nsw i32 %24, 1, !dbg !111
  store i32 %inc32, i32* %i, align 4, !dbg !111
  br label %for.cond17, !dbg !113

for.end33:                                        ; preds = %for.cond17
  %25 = load i32, i32* %tmp, align 4, !dbg !114
  %26 = load i64, i64* %r, align 8, !dbg !115
  %27 = load i32*, i32** %sum, align 8, !dbg !116
  %arrayidx34 = getelementptr inbounds i32, i32* %27, i64 %26, !dbg !116
  store i32 %25, i32* %arrayidx34, align 4, !dbg !117
  br label %for.inc35, !dbg !118

for.inc35:                                        ; preds = %for.end33
  %28 = load i64, i64* %r, align 8, !dbg !119
  %inc36 = add nsw i64 %28, 1, !dbg !119
  store i64 %inc36, i64* %r, align 8, !dbg !119
  br label %for.cond13, !dbg !121

for.end37:                                        ; preds = %for.cond13
  call void @llvm.dbg.declare(metadata i64* %total, metadata !122, metadata !18), !dbg !123
  store i64 0, i64* %total, align 8, !dbg !123
  store i64 0, i64* %r, align 8, !dbg !124
  br label %for.cond39, !dbg !126

for.cond39:                                       ; preds = %for.inc46, %for.end37
  %29 = load i64, i64* %r, align 8, !dbg !127
  %cmp40 = icmp slt i64 %29, 10240, !dbg !130
  br i1 %cmp40, label %for.body42, label %for.end48, !dbg !131

for.body42:                                       ; preds = %for.cond39
  %30 = load i64, i64* %total, align 8, !dbg !132
  %31 = load i64, i64* %r, align 8, !dbg !134
  %32 = load i32*, i32** %sum, align 8, !dbg !135
  %arrayidx43 = getelementptr inbounds i32, i32* %32, i64 %31, !dbg !135
  %33 = load i32, i32* %arrayidx43, align 4, !dbg !135
  %conv44 = sext i32 %33 to i64, !dbg !135
  %add45 = add nsw i64 %30, %conv44, !dbg !136
  store i64 %add45, i64* %total, align 8, !dbg !137
  br label %for.inc46, !dbg !138

for.inc46:                                        ; preds = %for.body42
  %34 = load i64, i64* %r, align 8, !dbg !139
  %inc47 = add nsw i64 %34, 1, !dbg !139
  store i64 %inc47, i64* %r, align 8, !dbg !139
  br label %for.cond39, !dbg !141

for.end48:                                        ; preds = %for.cond39
  %35 = load i64, i64* %total, align 8, !dbg !142
  %cmp49 = icmp ne i64 %35, 10485760, !dbg !144
  br i1 %cmp49, label %if.then, label %if.end, !dbg !145

if.then:                                          ; preds = %for.end48
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i32 0, i32 0)), !dbg !146
  call void @exit(i32 -2) #6, !dbg !148
  unreachable, !dbg !148

if.end:                                           ; preds = %for.end48
  %call52 = call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0)) #5, !dbg !149
  %36 = load i64, i64* %total, align 8, !dbg !150
  %call53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i32 0, i32 0), i64 10485760, i32 1024, i64 %36), !dbg !151
  ret i32 0, !dbg !152
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
!17 = !DILocalVariable(name: "argc", arg: 1, scope: !8, file: !1, line: 8, type: !5)
!18 = !DIExpression()
!19 = !DILocation(line: 8, column: 14, scope: !8)
!20 = !DILocalVariable(name: "args", arg: 2, scope: !8, file: !1, line: 8, type: !11)
!21 = !DILocation(line: 8, column: 27, scope: !8)
!22 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 9, type: !5)
!23 = !DILocation(line: 9, column: 6, scope: !8)
!24 = !DILocalVariable(name: "r", scope: !8, file: !1, line: 11, type: !6)
!25 = !DILocation(line: 11, column: 12, scope: !8)
!26 = !DILocalVariable(name: "u", scope: !8, file: !1, line: 12, type: !4)
!27 = !DILocation(line: 12, column: 7, scope: !8)
!28 = !DILocation(line: 12, column: 18, scope: !8)
!29 = !DILocation(line: 12, column: 11, scope: !8)
!30 = !DILocalVariable(name: "v", scope: !8, file: !1, line: 13, type: !4)
!31 = !DILocation(line: 13, column: 7, scope: !8)
!32 = !DILocation(line: 13, column: 18, scope: !8)
!33 = !DILocation(line: 13, column: 11, scope: !8)
!34 = !DILocalVariable(name: "sum", scope: !8, file: !1, line: 14, type: !4)
!35 = !DILocation(line: 14, column: 7, scope: !8)
!36 = !DILocation(line: 14, column: 20, scope: !8)
!37 = !DILocation(line: 14, column: 13, scope: !8)
!38 = !DILocation(line: 17, column: 7, scope: !39)
!39 = distinct !DILexicalBlock(scope: !8, file: !1, line: 17, column: 2)
!40 = !DILocation(line: 17, column: 6, scope: !39)
!41 = !DILocation(line: 17, column: 10, scope: !42)
!42 = !DILexicalBlockFile(scope: !43, file: !1, discriminator: 1)
!43 = distinct !DILexicalBlock(scope: !39, file: !1, line: 17, column: 2)
!44 = !DILocation(line: 17, column: 11, scope: !42)
!45 = !DILocation(line: 17, column: 2, scope: !42)
!46 = !DILocation(line: 19, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 19, column: 3)
!48 = distinct !DILexicalBlock(scope: !43, file: !1, line: 17, column: 18)
!49 = !DILocation(line: 19, column: 8, scope: !47)
!50 = !DILocation(line: 19, column: 12, scope: !51)
!51 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 1)
!52 = distinct !DILexicalBlock(scope: !47, file: !1, line: 19, column: 3)
!53 = !DILocation(line: 19, column: 13, scope: !51)
!54 = !DILocation(line: 19, column: 3, scope: !51)
!55 = !DILocation(line: 20, column: 6, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !1, line: 19, column: 21)
!57 = !DILocation(line: 20, column: 7, scope: !56)
!58 = !DILocation(line: 20, column: 10, scope: !56)
!59 = !DILocation(line: 20, column: 9, scope: !56)
!60 = !DILocation(line: 20, column: 4, scope: !56)
!61 = !DILocation(line: 20, column: 13, scope: !56)
!62 = !DILocation(line: 21, column: 6, scope: !56)
!63 = !DILocation(line: 21, column: 7, scope: !56)
!64 = !DILocation(line: 21, column: 10, scope: !56)
!65 = !DILocation(line: 21, column: 9, scope: !56)
!66 = !DILocation(line: 21, column: 4, scope: !56)
!67 = !DILocation(line: 21, column: 13, scope: !56)
!68 = !DILocation(line: 22, column: 3, scope: !56)
!69 = !DILocation(line: 19, column: 17, scope: !70)
!70 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 2)
!71 = !DILocation(line: 19, column: 3, scope: !70)
!72 = !DILocation(line: 23, column: 2, scope: !48)
!73 = !DILocation(line: 17, column: 15, scope: !74)
!74 = !DILexicalBlockFile(scope: !43, file: !1, discriminator: 2)
!75 = !DILocation(line: 17, column: 2, scope: !74)
!76 = !DILocation(line: 25, column: 7, scope: !77)
!77 = distinct !DILexicalBlock(scope: !8, file: !1, line: 25, column: 2)
!78 = !DILocation(line: 25, column: 6, scope: !77)
!79 = !DILocation(line: 25, column: 10, scope: !80)
!80 = !DILexicalBlockFile(scope: !81, file: !1, discriminator: 1)
!81 = distinct !DILexicalBlock(scope: !77, file: !1, line: 25, column: 2)
!82 = !DILocation(line: 25, column: 11, scope: !80)
!83 = !DILocation(line: 25, column: 2, scope: !80)
!84 = !DILocalVariable(name: "tmp", scope: !85, file: !1, line: 26, type: !5)
!85 = distinct !DILexicalBlock(scope: !81, file: !1, line: 25, column: 18)
!86 = !DILocation(line: 26, column: 7, scope: !85)
!87 = !DILocation(line: 27, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !1, line: 27, column: 3)
!89 = !DILocation(line: 27, column: 8, scope: !88)
!90 = !DILocation(line: 27, column: 12, scope: !91)
!91 = !DILexicalBlockFile(scope: !92, file: !1, discriminator: 1)
!92 = distinct !DILexicalBlock(scope: !88, file: !1, line: 27, column: 3)
!93 = !DILocation(line: 27, column: 13, scope: !91)
!94 = !DILocation(line: 27, column: 3, scope: !91)
!95 = !DILocation(line: 29, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !1, line: 27, column: 21)
!97 = !DILocation(line: 29, column: 17, scope: !96)
!98 = !DILocation(line: 29, column: 18, scope: !96)
!99 = !DILocation(line: 29, column: 21, scope: !96)
!100 = !DILocation(line: 29, column: 20, scope: !96)
!101 = !DILocation(line: 29, column: 15, scope: !96)
!102 = !DILocation(line: 29, column: 26, scope: !96)
!103 = !DILocation(line: 29, column: 27, scope: !96)
!104 = !DILocation(line: 29, column: 30, scope: !96)
!105 = !DILocation(line: 29, column: 29, scope: !96)
!106 = !DILocation(line: 29, column: 24, scope: !96)
!107 = !DILocation(line: 29, column: 23, scope: !96)
!108 = !DILocation(line: 29, column: 13, scope: !96)
!109 = !DILocation(line: 29, column: 7, scope: !96)
!110 = !DILocation(line: 30, column: 3, scope: !96)
!111 = !DILocation(line: 27, column: 17, scope: !112)
!112 = !DILexicalBlockFile(scope: !92, file: !1, discriminator: 2)
!113 = !DILocation(line: 27, column: 3, scope: !112)
!114 = !DILocation(line: 31, column: 12, scope: !85)
!115 = !DILocation(line: 31, column: 7, scope: !85)
!116 = !DILocation(line: 31, column: 3, scope: !85)
!117 = !DILocation(line: 31, column: 10, scope: !85)
!118 = !DILocation(line: 32, column: 2, scope: !85)
!119 = !DILocation(line: 25, column: 15, scope: !120)
!120 = !DILexicalBlockFile(scope: !81, file: !1, discriminator: 2)
!121 = !DILocation(line: 25, column: 2, scope: !120)
!122 = !DILocalVariable(name: "total", scope: !8, file: !1, line: 34, type: !6)
!123 = !DILocation(line: 34, column: 12, scope: !8)
!124 = !DILocation(line: 35, column: 7, scope: !125)
!125 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 2)
!126 = !DILocation(line: 35, column: 6, scope: !125)
!127 = !DILocation(line: 35, column: 10, scope: !128)
!128 = !DILexicalBlockFile(scope: !129, file: !1, discriminator: 1)
!129 = distinct !DILexicalBlock(scope: !125, file: !1, line: 35, column: 2)
!130 = !DILocation(line: 35, column: 11, scope: !128)
!131 = !DILocation(line: 35, column: 2, scope: !128)
!132 = !DILocation(line: 36, column: 11, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !1, line: 35, column: 18)
!134 = !DILocation(line: 36, column: 23, scope: !133)
!135 = !DILocation(line: 36, column: 19, scope: !133)
!136 = !DILocation(line: 36, column: 17, scope: !133)
!137 = !DILocation(line: 36, column: 9, scope: !133)
!138 = !DILocation(line: 37, column: 2, scope: !133)
!139 = !DILocation(line: 35, column: 15, scope: !140)
!140 = !DILexicalBlockFile(scope: !129, file: !1, discriminator: 2)
!141 = !DILocation(line: 35, column: 2, scope: !140)
!142 = !DILocation(line: 40, column: 5, scope: !143)
!143 = distinct !DILexicalBlock(scope: !8, file: !1, line: 40, column: 5)
!144 = !DILocation(line: 40, column: 11, scope: !143)
!145 = !DILocation(line: 40, column: 5, scope: !8)
!146 = !DILocation(line: 41, column: 3, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !1, line: 40, column: 19)
!148 = !DILocation(line: 42, column: 3, scope: !147)
!149 = !DILocation(line: 46, column: 2, scope: !8)
!150 = !DILocation(line: 48, column: 52, scope: !8)
!151 = !DILocation(line: 47, column: 2, scope: !8)
!152 = !DILocation(line: 49, column: 2, scope: !8)
