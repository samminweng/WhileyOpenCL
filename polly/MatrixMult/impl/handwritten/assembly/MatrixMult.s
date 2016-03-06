; ModuleID = 'MatrixMult.c'
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !24), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %j, metadata !26, metadata !24), !dbg !27
  store i32 0, i32* %i, align 4, !dbg !28
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc10, %entry
  %0 = load i32, i32* %i, align 4, !dbg !31
  %cmp = icmp slt i32 %0, 1024, !dbg !34
  br i1 %cmp, label %for.body, label %for.end12, !dbg !35

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !36
  br label %for.cond1, !dbg !39

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !40
  %cmp2 = icmp slt i32 %1, 1024, !dbg !43
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !44

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %j, align 4, !dbg !45
  %idxprom = sext i32 %2 to i64, !dbg !47
  %3 = load i32, i32* %i, align 4, !dbg !48
  %idxprom4 = sext i32 %3 to i64, !dbg !47
  %arrayidx = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %idxprom4, !dbg !47
  %arrayidx5 = getelementptr inbounds [1024 x i64], [1024 x i64]* %arrayidx, i64 0, i64 %idxprom, !dbg !47
  store i64 1, i64* %arrayidx5, align 8, !dbg !49
  %4 = load i32, i32* %j, align 4, !dbg !50
  %idxprom6 = sext i32 %4 to i64, !dbg !51
  %5 = load i32, i32* %i, align 4, !dbg !52
  %idxprom7 = sext i32 %5 to i64, !dbg !51
  %arrayidx8 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %idxprom7, !dbg !51
  %arrayidx9 = getelementptr inbounds [1024 x i64], [1024 x i64]* %arrayidx8, i64 0, i64 %idxprom6, !dbg !51
  store i64 1, i64* %arrayidx9, align 8, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body3
  %6 = load i32, i32* %j, align 4, !dbg !55
  %inc = add nsw i32 %6, 1, !dbg !55
  store i32 %inc, i32* %j, align 4, !dbg !55
  br label %for.cond1, !dbg !57

for.end:                                          ; preds = %for.cond1
  br label %for.inc10, !dbg !58

for.inc10:                                        ; preds = %for.end
  %7 = load i32, i32* %i, align 4, !dbg !59
  %inc11 = add nsw i32 %7, 1, !dbg !59
  store i32 %inc11, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !61

for.end12:                                        ; preds = %for.cond
  ret void, !dbg !62
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define void @print_array() #0 !dbg !7 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !63, metadata !24), !dbg !64
  call void @llvm.dbg.declare(metadata i32* %j, metadata !65, metadata !24), !dbg !66
  store i32 0, i32* %i, align 4, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc9, %entry
  %0 = load i32, i32* %i, align 4, !dbg !70
  %cmp = icmp slt i32 %0, 1024, !dbg !73
  br i1 %cmp, label %for.body, label %for.end11, !dbg !74

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !75
  br label %for.cond1, !dbg !78

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !79
  %cmp2 = icmp slt i32 %1, 1024, !dbg !82
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !83

for.body3:                                        ; preds = %for.cond1
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !84
  %3 = load i32, i32* %j, align 4, !dbg !86
  %idxprom = sext i32 %3 to i64, !dbg !87
  %4 = load i32, i32* %i, align 4, !dbg !88
  %idxprom4 = sext i32 %4 to i64, !dbg !87
  %arrayidx = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %idxprom4, !dbg !87
  %arrayidx5 = getelementptr inbounds [1024 x i64], [1024 x i64]* %arrayidx, i64 0, i64 %idxprom, !dbg !87
  %5 = load i64, i64* %arrayidx5, align 8, !dbg !87
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i64 %5), !dbg !89
  %6 = load i32, i32* %j, align 4, !dbg !90
  %rem = srem i32 %6, 80, !dbg !92
  %cmp6 = icmp eq i32 %rem, 79, !dbg !93
  br i1 %cmp6, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %for.body3
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !95
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !97
  br label %if.end, !dbg !97

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %if.end
  %8 = load i32, i32* %j, align 4, !dbg !99
  %inc = add nsw i32 %8, 1, !dbg !99
  store i32 %inc, i32* %j, align 4, !dbg !99
  br label %for.cond1, !dbg !101

for.end:                                          ; preds = %for.cond1
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !102
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !103
  br label %for.inc9, !dbg !104

for.inc9:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4, !dbg !105
  %inc10 = add nsw i32 %10, 1, !dbg !105
  store i32 %inc10, i32* %i, align 4, !dbg !105
  br label %for.cond, !dbg !107

for.end11:                                        ; preds = %for.cond
  ret void, !dbg !108
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !8 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %t_start = alloca double, align 8
  %t_end = alloca double, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !109, metadata !24), !dbg !110
  call void @llvm.dbg.declare(metadata i32* %j, metadata !111, metadata !24), !dbg !112
  call void @llvm.dbg.declare(metadata i32* %k, metadata !113, metadata !24), !dbg !114
  call void @llvm.dbg.declare(metadata double* %t_start, metadata !115, metadata !24), !dbg !117
  call void @llvm.dbg.declare(metadata double* %t_end, metadata !118, metadata !24), !dbg !119
  call void @init_array(), !dbg !120
  store i32 0, i32* %i, align 4, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc28, %entry
  %0 = load i32, i32* %i, align 4, !dbg !124
  %cmp = icmp slt i32 %0, 1024, !dbg !127
  br i1 %cmp, label %for.body, label %for.end30, !dbg !128

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !129
  br label %for.cond1, !dbg !132

for.cond1:                                        ; preds = %for.inc25, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !133
  %cmp2 = icmp slt i32 %1, 1024, !dbg !136
  br i1 %cmp2, label %for.body3, label %for.end27, !dbg !137

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %j, align 4, !dbg !138
  %idxprom = sext i32 %2 to i64, !dbg !140
  %3 = load i32, i32* %i, align 4, !dbg !141
  %idxprom4 = sext i32 %3 to i64, !dbg !140
  %arrayidx = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %idxprom4, !dbg !140
  %arrayidx5 = getelementptr inbounds [1024 x i64], [1024 x i64]* %arrayidx, i64 0, i64 %idxprom, !dbg !140
  store i64 0, i64* %arrayidx5, align 8, !dbg !142
  store i32 0, i32* %k, align 4, !dbg !143
  br label %for.cond6, !dbg !145

for.cond6:                                        ; preds = %for.inc, %for.body3
  %4 = load i32, i32* %k, align 4, !dbg !146
  %cmp7 = icmp slt i32 %4, 1024, !dbg !149
  br i1 %cmp7, label %for.body8, label %for.end, !dbg !150

for.body8:                                        ; preds = %for.cond6
  %5 = load i32, i32* %j, align 4, !dbg !151
  %idxprom9 = sext i32 %5 to i64, !dbg !152
  %6 = load i32, i32* %i, align 4, !dbg !153
  %idxprom10 = sext i32 %6 to i64, !dbg !152
  %arrayidx11 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %idxprom10, !dbg !152
  %arrayidx12 = getelementptr inbounds [1024 x i64], [1024 x i64]* %arrayidx11, i64 0, i64 %idxprom9, !dbg !152
  %7 = load i64, i64* %arrayidx12, align 8, !dbg !152
  %8 = load i32, i32* %k, align 4, !dbg !154
  %idxprom13 = sext i32 %8 to i64, !dbg !155
  %9 = load i32, i32* %i, align 4, !dbg !156
  %idxprom14 = sext i32 %9 to i64, !dbg !155
  %arrayidx15 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @A, i64 0, i64 %idxprom14, !dbg !155
  %arrayidx16 = getelementptr inbounds [1024 x i64], [1024 x i64]* %arrayidx15, i64 0, i64 %idxprom13, !dbg !155
  %10 = load i64, i64* %arrayidx16, align 8, !dbg !155
  %11 = load i32, i32* %j, align 4, !dbg !157
  %idxprom17 = sext i32 %11 to i64, !dbg !158
  %12 = load i32, i32* %k, align 4, !dbg !159
  %idxprom18 = sext i32 %12 to i64, !dbg !158
  %arrayidx19 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @B, i64 0, i64 %idxprom18, !dbg !158
  %arrayidx20 = getelementptr inbounds [1024 x i64], [1024 x i64]* %arrayidx19, i64 0, i64 %idxprom17, !dbg !158
  %13 = load i64, i64* %arrayidx20, align 8, !dbg !158
  %mul = mul nsw i64 %10, %13, !dbg !160
  %add = add nsw i64 %7, %mul, !dbg !161
  %14 = load i32, i32* %j, align 4, !dbg !162
  %idxprom21 = sext i32 %14 to i64, !dbg !163
  %15 = load i32, i32* %i, align 4, !dbg !164
  %idxprom22 = sext i32 %15 to i64, !dbg !163
  %arrayidx23 = getelementptr inbounds [1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 %idxprom22, !dbg !163
  %arrayidx24 = getelementptr inbounds [1024 x i64], [1024 x i64]* %arrayidx23, i64 0, i64 %idxprom21, !dbg !163
  store i64 %add, i64* %arrayidx24, align 8, !dbg !165
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body8
  %16 = load i32, i32* %k, align 4, !dbg !166
  %inc = add nsw i32 %16, 1, !dbg !166
  store i32 %inc, i32* %k, align 4, !dbg !166
  br label %for.cond6, !dbg !168

for.end:                                          ; preds = %for.cond6
  br label %for.inc25, !dbg !169

for.inc25:                                        ; preds = %for.end
  %17 = load i32, i32* %j, align 4, !dbg !170
  %inc26 = add nsw i32 %17, 1, !dbg !170
  store i32 %inc26, i32* %j, align 4, !dbg !170
  br label %for.cond1, !dbg !172

for.end27:                                        ; preds = %for.cond1
  br label %for.inc28, !dbg !173

for.inc28:                                        ; preds = %for.end27
  %18 = load i32, i32* %i, align 4, !dbg !174
  %inc29 = add nsw i32 %18, 1, !dbg !174
  store i32 %inc29, i32* %i, align 4, !dbg !174
  br label %for.cond, !dbg !176

for.end30:                                        ; preds = %for.cond
  %19 = load i64, i64* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @C, i64 0, i64 1023, i64 1023), align 8, !dbg !177
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i32 0, i32 0), i32 1024, i32 1024, i64 %19), !dbg !178
  ret i32 0, !dbg !179
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

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
!23 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 9, type: !11)
!24 = !DIExpression()
!25 = !DILocation(line: 9, column: 9, scope: !4)
!26 = !DILocalVariable(name: "j", scope: !4, file: !1, line: 9, type: !11)
!27 = !DILocation(line: 9, column: 12, scope: !4)
!28 = !DILocation(line: 11, column: 11, scope: !29)
!29 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 5)
!30 = !DILocation(line: 11, column: 10, scope: !29)
!31 = !DILocation(line: 11, column: 15, scope: !32)
!32 = !DILexicalBlockFile(scope: !33, file: !1, discriminator: 1)
!33 = distinct !DILexicalBlock(scope: !29, file: !1, line: 11, column: 5)
!34 = !DILocation(line: 11, column: 16, scope: !32)
!35 = !DILocation(line: 11, column: 5, scope: !32)
!36 = !DILocation(line: 12, column: 15, scope: !37)
!37 = distinct !DILexicalBlock(scope: !38, file: !1, line: 12, column: 9)
!38 = distinct !DILexicalBlock(scope: !33, file: !1, line: 11, column: 25)
!39 = !DILocation(line: 12, column: 14, scope: !37)
!40 = !DILocation(line: 12, column: 19, scope: !41)
!41 = !DILexicalBlockFile(scope: !42, file: !1, discriminator: 1)
!42 = distinct !DILexicalBlock(scope: !37, file: !1, line: 12, column: 9)
!43 = !DILocation(line: 12, column: 20, scope: !41)
!44 = !DILocation(line: 12, column: 9, scope: !41)
!45 = !DILocation(line: 13, column: 18, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !1, line: 12, column: 29)
!47 = !DILocation(line: 13, column: 13, scope: !46)
!48 = !DILocation(line: 13, column: 15, scope: !46)
!49 = !DILocation(line: 13, column: 21, scope: !46)
!50 = !DILocation(line: 14, column: 18, scope: !46)
!51 = !DILocation(line: 14, column: 13, scope: !46)
!52 = !DILocation(line: 14, column: 15, scope: !46)
!53 = !DILocation(line: 14, column: 21, scope: !46)
!54 = !DILocation(line: 15, column: 9, scope: !46)
!55 = !DILocation(line: 12, column: 25, scope: !56)
!56 = !DILexicalBlockFile(scope: !42, file: !1, discriminator: 2)
!57 = !DILocation(line: 12, column: 9, scope: !56)
!58 = !DILocation(line: 16, column: 5, scope: !38)
!59 = !DILocation(line: 11, column: 21, scope: !60)
!60 = !DILexicalBlockFile(scope: !33, file: !1, discriminator: 2)
!61 = !DILocation(line: 11, column: 5, scope: !60)
!62 = !DILocation(line: 17, column: 1, scope: !4)
!63 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 21, type: !11)
!64 = !DILocation(line: 21, column: 9, scope: !7)
!65 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 21, type: !11)
!66 = !DILocation(line: 21, column: 12, scope: !7)
!67 = !DILocation(line: 23, column: 11, scope: !68)
!68 = distinct !DILexicalBlock(scope: !7, file: !1, line: 23, column: 5)
!69 = !DILocation(line: 23, column: 10, scope: !68)
!70 = !DILocation(line: 23, column: 15, scope: !71)
!71 = !DILexicalBlockFile(scope: !72, file: !1, discriminator: 1)
!72 = distinct !DILexicalBlock(scope: !68, file: !1, line: 23, column: 5)
!73 = !DILocation(line: 23, column: 16, scope: !71)
!74 = !DILocation(line: 23, column: 5, scope: !71)
!75 = !DILocation(line: 24, column: 15, scope: !76)
!76 = distinct !DILexicalBlock(scope: !77, file: !1, line: 24, column: 9)
!77 = distinct !DILexicalBlock(scope: !72, file: !1, line: 23, column: 25)
!78 = !DILocation(line: 24, column: 14, scope: !76)
!79 = !DILocation(line: 24, column: 19, scope: !80)
!80 = !DILexicalBlockFile(scope: !81, file: !1, discriminator: 1)
!81 = distinct !DILexicalBlock(scope: !76, file: !1, line: 24, column: 9)
!82 = !DILocation(line: 24, column: 20, scope: !80)
!83 = !DILocation(line: 24, column: 9, scope: !80)
!84 = !DILocation(line: 25, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !1, line: 24, column: 29)
!86 = !DILocation(line: 25, column: 43, scope: !85)
!87 = !DILocation(line: 25, column: 38, scope: !85)
!88 = !DILocation(line: 25, column: 40, scope: !85)
!89 = !DILocation(line: 25, column: 13, scope: !85)
!90 = !DILocation(line: 26, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !1, line: 26, column: 17)
!92 = !DILocation(line: 26, column: 18, scope: !91)
!93 = !DILocation(line: 26, column: 22, scope: !91)
!94 = !DILocation(line: 26, column: 17, scope: !85)
!95 = !DILocation(line: 26, column: 37, scope: !96)
!96 = !DILexicalBlockFile(scope: !91, file: !1, discriminator: 1)
!97 = !DILocation(line: 26, column: 29, scope: !96)
!98 = !DILocation(line: 27, column: 9, scope: !85)
!99 = !DILocation(line: 24, column: 25, scope: !100)
!100 = !DILexicalBlockFile(scope: !81, file: !1, discriminator: 2)
!101 = !DILocation(line: 24, column: 9, scope: !100)
!102 = !DILocation(line: 28, column: 17, scope: !77)
!103 = !DILocation(line: 28, column: 9, scope: !77)
!104 = !DILocation(line: 29, column: 5, scope: !77)
!105 = !DILocation(line: 23, column: 21, scope: !106)
!106 = !DILexicalBlockFile(scope: !72, file: !1, discriminator: 2)
!107 = !DILocation(line: 23, column: 5, scope: !106)
!108 = !DILocation(line: 30, column: 1, scope: !7)
!109 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 34, type: !11)
!110 = !DILocation(line: 34, column: 9, scope: !8)
!111 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 34, type: !11)
!112 = !DILocation(line: 34, column: 12, scope: !8)
!113 = !DILocalVariable(name: "k", scope: !8, file: !1, line: 34, type: !11)
!114 = !DILocation(line: 34, column: 15, scope: !8)
!115 = !DILocalVariable(name: "t_start", scope: !8, file: !1, line: 35, type: !116)
!116 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!117 = !DILocation(line: 35, column: 12, scope: !8)
!118 = !DILocalVariable(name: "t_end", scope: !8, file: !1, line: 35, type: !116)
!119 = !DILocation(line: 35, column: 21, scope: !8)
!120 = !DILocation(line: 37, column: 5, scope: !8)
!121 = !DILocation(line: 39, column: 10, scope: !122)
!122 = distinct !DILexicalBlock(scope: !8, file: !1, line: 39, column: 5)
!123 = !DILocation(line: 39, column: 9, scope: !122)
!124 = !DILocation(line: 39, column: 14, scope: !125)
!125 = !DILexicalBlockFile(scope: !126, file: !1, discriminator: 1)
!126 = distinct !DILexicalBlock(scope: !122, file: !1, line: 39, column: 5)
!127 = !DILocation(line: 39, column: 15, scope: !125)
!128 = !DILocation(line: 39, column: 5, scope: !125)
!129 = !DILocation(line: 40, column: 14, scope: !130)
!130 = distinct !DILexicalBlock(scope: !131, file: !1, line: 40, column: 9)
!131 = distinct !DILexicalBlock(scope: !126, file: !1, line: 39, column: 25)
!132 = !DILocation(line: 40, column: 13, scope: !130)
!133 = !DILocation(line: 40, column: 18, scope: !134)
!134 = !DILexicalBlockFile(scope: !135, file: !1, discriminator: 1)
!135 = distinct !DILexicalBlock(scope: !130, file: !1, line: 40, column: 9)
!136 = !DILocation(line: 40, column: 19, scope: !134)
!137 = !DILocation(line: 40, column: 9, scope: !134)
!138 = !DILocation(line: 41, column: 18, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !1, line: 40, column: 29)
!140 = !DILocation(line: 41, column: 13, scope: !139)
!141 = !DILocation(line: 41, column: 15, scope: !139)
!142 = !DILocation(line: 41, column: 21, scope: !139)
!143 = !DILocation(line: 42, column: 18, scope: !144)
!144 = distinct !DILexicalBlock(scope: !139, file: !1, line: 42, column: 13)
!145 = !DILocation(line: 42, column: 17, scope: !144)
!146 = !DILocation(line: 42, column: 22, scope: !147)
!147 = !DILexicalBlockFile(scope: !148, file: !1, discriminator: 1)
!148 = distinct !DILexicalBlock(scope: !144, file: !1, line: 42, column: 13)
!149 = !DILocation(line: 42, column: 23, scope: !147)
!150 = !DILocation(line: 42, column: 13, scope: !147)
!151 = !DILocation(line: 43, column: 32, scope: !148)
!152 = !DILocation(line: 43, column: 27, scope: !148)
!153 = !DILocation(line: 43, column: 29, scope: !148)
!154 = !DILocation(line: 43, column: 42, scope: !148)
!155 = !DILocation(line: 43, column: 37, scope: !148)
!156 = !DILocation(line: 43, column: 39, scope: !148)
!157 = !DILocation(line: 43, column: 52, scope: !148)
!158 = !DILocation(line: 43, column: 47, scope: !148)
!159 = !DILocation(line: 43, column: 49, scope: !148)
!160 = !DILocation(line: 43, column: 45, scope: !148)
!161 = !DILocation(line: 43, column: 35, scope: !148)
!162 = !DILocation(line: 43, column: 22, scope: !148)
!163 = !DILocation(line: 43, column: 17, scope: !148)
!164 = !DILocation(line: 43, column: 19, scope: !148)
!165 = !DILocation(line: 43, column: 25, scope: !148)
!166 = !DILocation(line: 42, column: 28, scope: !167)
!167 = !DILexicalBlockFile(scope: !148, file: !1, discriminator: 2)
!168 = !DILocation(line: 42, column: 13, scope: !167)
!169 = !DILocation(line: 44, column: 9, scope: !139)
!170 = !DILocation(line: 40, column: 24, scope: !171)
!171 = !DILexicalBlockFile(scope: !135, file: !1, discriminator: 2)
!172 = !DILocation(line: 40, column: 9, scope: !171)
!173 = !DILocation(line: 45, column: 5, scope: !131)
!174 = !DILocation(line: 39, column: 20, scope: !175)
!175 = !DILexicalBlockFile(scope: !126, file: !1, discriminator: 2)
!176 = !DILocation(line: 39, column: 5, scope: !175)
!177 = !DILocation(line: 47, column: 71, scope: !8)
!178 = !DILocation(line: 47, column: 5, scope: !8)
!179 = !DILocation(line: 48, column: 5, scope: !8)
