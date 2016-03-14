; ModuleID = 'MatrixMult.c'
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !25, metadata !26), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %j, metadata !28, metadata !26), !dbg !29
  %call = call i64 @time(i64* null) #5, !dbg !30
  %conv = trunc i64 %call to i32, !dbg !31
  call void @srand(i32 %conv) #5, !dbg !32
  store i32 0, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc9, %entry
  %0 = load i32, i32* %i, align 4, !dbg !37
  %cmp = icmp slt i32 %0, 2000, !dbg !40
  br i1 %cmp, label %for.body, label %for.end11, !dbg !41

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !42
  br label %for.cond2, !dbg !45

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !46
  %cmp3 = icmp slt i32 %1, 2000, !dbg !49
  br i1 %cmp3, label %for.body5, label %for.end, !dbg !50

for.body5:                                        ; preds = %for.cond2
  %call6 = call i32 @rand() #5, !dbg !51
  %rem = srem i32 %call6, 10, !dbg !53
  %2 = load i32, i32* %j, align 4, !dbg !54
  %idxprom = sext i32 %2 to i64, !dbg !55
  %3 = load i32, i32* %i, align 4, !dbg !56
  %idxprom7 = sext i32 %3 to i64, !dbg !55
  %arrayidx = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %idxprom7, !dbg !55
  %arrayidx8 = getelementptr inbounds [2000 x i32], [2000 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !55
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body5
  %4 = load i32, i32* %j, align 4, !dbg !59
  %inc = add nsw i32 %4, 1, !dbg !59
  store i32 %inc, i32* %j, align 4, !dbg !59
  br label %for.cond2, !dbg !61

for.end:                                          ; preds = %for.cond2
  br label %for.inc9, !dbg !62

for.inc9:                                         ; preds = %for.end
  %5 = load i32, i32* %i, align 4, !dbg !63
  %inc10 = add nsw i32 %5, 1, !dbg !63
  store i32 %inc10, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !65

for.end11:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !66
  br label %for.cond12, !dbg !68

for.cond12:                                       ; preds = %for.inc39, %for.end11
  %6 = load i32, i32* %i, align 4, !dbg !69
  %cmp13 = icmp slt i32 %6, 2000, !dbg !72
  br i1 %cmp13, label %for.body15, label %for.end41, !dbg !73

for.body15:                                       ; preds = %for.cond12
  store i32 0, i32* %j, align 4, !dbg !74
  br label %for.cond16, !dbg !77

for.cond16:                                       ; preds = %for.inc36, %for.body15
  %7 = load i32, i32* %j, align 4, !dbg !78
  %cmp17 = icmp slt i32 %7, 2000, !dbg !81
  br i1 %cmp17, label %for.body19, label %for.end38, !dbg !82

for.body19:                                       ; preds = %for.cond16
  %8 = load i32, i32* %j, align 4, !dbg !83
  %idxprom20 = sext i32 %8 to i64, !dbg !85
  %9 = load i32, i32* %i, align 4, !dbg !86
  %idxprom21 = sext i32 %9 to i64, !dbg !85
  %arrayidx22 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %idxprom21, !dbg !85
  %arrayidx23 = getelementptr inbounds [2000 x i32], [2000 x i32]* %arrayidx22, i64 0, i64 %idxprom20, !dbg !85
  %10 = load i32, i32* %arrayidx23, align 4, !dbg !85
  %11 = load i32, i32* %j, align 4, !dbg !87
  %idxprom24 = sext i32 %11 to i64, !dbg !88
  %12 = load i32, i32* %i, align 4, !dbg !89
  %idxprom25 = sext i32 %12 to i64, !dbg !88
  %arrayidx26 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %idxprom25, !dbg !88
  %arrayidx27 = getelementptr inbounds [2000 x i32], [2000 x i32]* %arrayidx26, i64 0, i64 %idxprom24, !dbg !88
  store i32 %10, i32* %arrayidx27, align 4, !dbg !90
  %13 = load i32, i32* %j, align 4, !dbg !91
  %idxprom28 = sext i32 %13 to i64, !dbg !92
  %14 = load i32, i32* %i, align 4, !dbg !93
  %idxprom29 = sext i32 %14 to i64, !dbg !92
  %arrayidx30 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %idxprom29, !dbg !92
  %arrayidx31 = getelementptr inbounds [2000 x i32], [2000 x i32]* %arrayidx30, i64 0, i64 %idxprom28, !dbg !92
  %15 = load i32, i32* %arrayidx31, align 4, !dbg !92
  %16 = load i32, i32* %j, align 4, !dbg !94
  %idxprom32 = sext i32 %16 to i64, !dbg !95
  %17 = load i32, i32* %i, align 4, !dbg !96
  %idxprom33 = sext i32 %17 to i64, !dbg !95
  %arrayidx34 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %idxprom33, !dbg !95
  %arrayidx35 = getelementptr inbounds [2000 x i32], [2000 x i32]* %arrayidx34, i64 0, i64 %idxprom32, !dbg !95
  store i32 %15, i32* %arrayidx35, align 4, !dbg !97
  br label %for.inc36, !dbg !98

for.inc36:                                        ; preds = %for.body19
  %18 = load i32, i32* %j, align 4, !dbg !99
  %inc37 = add nsw i32 %18, 1, !dbg !99
  store i32 %inc37, i32* %j, align 4, !dbg !99
  br label %for.cond16, !dbg !101

for.end38:                                        ; preds = %for.cond16
  br label %for.inc39, !dbg !102

for.inc39:                                        ; preds = %for.end38
  %19 = load i32, i32* %i, align 4, !dbg !103
  %inc40 = add nsw i32 %19, 1, !dbg !103
  store i32 %inc40, i32* %i, align 4, !dbg !103
  br label %for.cond12, !dbg !105

for.end41:                                        ; preds = %for.cond12
  ret void, !dbg !106
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %b_t = alloca [2000 x i32], align 16
  %sum = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !107, metadata !26), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %j, metadata !109, metadata !26), !dbg !110
  call void @llvm.dbg.declare(metadata i32* %k, metadata !111, metadata !26), !dbg !112
  call void @llvm.dbg.declare(metadata [2000 x i32]* %b_t, metadata !113, metadata !26), !dbg !116
  store i32 0, i32* %j, align 4, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc30, %entry
  %0 = load i32, i32* %j, align 4, !dbg !120
  %cmp = icmp slt i32 %0, 2000, !dbg !123
  br i1 %cmp, label %for.body, label %for.end32, !dbg !124

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !125
  br label %for.cond1, !dbg !128

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %i, align 4, !dbg !129
  %cmp2 = icmp slt i32 %1, 2000, !dbg !132
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !133

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %j, align 4, !dbg !134
  %idxprom = sext i32 %2 to i64, !dbg !136
  %3 = load i32, i32* %i, align 4, !dbg !137
  %idxprom4 = sext i32 %3 to i64, !dbg !136
  %arrayidx = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %idxprom4, !dbg !136
  %arrayidx5 = getelementptr inbounds [2000 x i32], [2000 x i32]* %arrayidx, i64 0, i64 %idxprom, !dbg !136
  %4 = load i32, i32* %arrayidx5, align 4, !dbg !136
  %5 = load i32, i32* %i, align 4, !dbg !138
  %idxprom6 = sext i32 %5 to i64, !dbg !139
  %arrayidx7 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %idxprom6, !dbg !139
  store i32 %4, i32* %arrayidx7, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body3
  %6 = load i32, i32* %i, align 4, !dbg !142
  %inc = add nsw i32 %6, 1, !dbg !142
  store i32 %inc, i32* %i, align 4, !dbg !142
  br label %for.cond1, !dbg !144

for.end:                                          ; preds = %for.cond1
  store i32 0, i32* %i, align 4, !dbg !145
  br label %for.cond8, !dbg !147

for.cond8:                                        ; preds = %for.inc27, %for.end
  %7 = load i32, i32* %i, align 4, !dbg !148
  %cmp9 = icmp slt i32 %7, 2000, !dbg !151
  br i1 %cmp9, label %for.body10, label %for.end29, !dbg !152

for.body10:                                       ; preds = %for.cond8
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !153, metadata !26), !dbg !155
  store i32 0, i32* %sum, align 4, !dbg !155
  store i32 0, i32* %k, align 4, !dbg !156
  br label %for.cond11, !dbg !158

for.cond11:                                       ; preds = %for.inc20, %for.body10
  %8 = load i32, i32* %k, align 4, !dbg !159
  %cmp12 = icmp slt i32 %8, 2000, !dbg !162
  br i1 %cmp12, label %for.body13, label %for.end22, !dbg !163

for.body13:                                       ; preds = %for.cond11
  %9 = load i32, i32* %sum, align 4, !dbg !164
  %10 = load i32, i32* %k, align 4, !dbg !166
  %idxprom14 = sext i32 %10 to i64, !dbg !167
  %11 = load i32, i32* %i, align 4, !dbg !168
  %idxprom15 = sext i32 %11 to i64, !dbg !167
  %arrayidx16 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %idxprom15, !dbg !167
  %arrayidx17 = getelementptr inbounds [2000 x i32], [2000 x i32]* %arrayidx16, i64 0, i64 %idxprom14, !dbg !167
  %12 = load i32, i32* %arrayidx17, align 4, !dbg !167
  %13 = load i32, i32* %k, align 4, !dbg !169
  %idxprom18 = sext i32 %13 to i64, !dbg !170
  %arrayidx19 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %idxprom18, !dbg !170
  %14 = load i32, i32* %arrayidx19, align 4, !dbg !170
  %mul = mul nsw i32 %12, %14, !dbg !171
  %add = add nsw i32 %9, %mul, !dbg !172
  store i32 %add, i32* %sum, align 4, !dbg !173
  br label %for.inc20, !dbg !174

for.inc20:                                        ; preds = %for.body13
  %15 = load i32, i32* %k, align 4, !dbg !175
  %inc21 = add nsw i32 %15, 1, !dbg !175
  store i32 %inc21, i32* %k, align 4, !dbg !175
  br label %for.cond11, !dbg !177

for.end22:                                        ; preds = %for.cond11
  %16 = load i32, i32* %sum, align 4, !dbg !178
  %17 = load i32, i32* %j, align 4, !dbg !179
  %idxprom23 = sext i32 %17 to i64, !dbg !180
  %18 = load i32, i32* %i, align 4, !dbg !181
  %idxprom24 = sext i32 %18 to i64, !dbg !180
  %arrayidx25 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %idxprom24, !dbg !180
  %arrayidx26 = getelementptr inbounds [2000 x i32], [2000 x i32]* %arrayidx25, i64 0, i64 %idxprom23, !dbg !180
  store i32 %16, i32* %arrayidx26, align 4, !dbg !182
  br label %for.inc27, !dbg !183

for.inc27:                                        ; preds = %for.end22
  %19 = load i32, i32* %i, align 4, !dbg !184
  %inc28 = add nsw i32 %19, 1, !dbg !184
  store i32 %inc28, i32* %i, align 4, !dbg !184
  br label %for.cond8, !dbg !186

for.end29:                                        ; preds = %for.cond8
  br label %for.inc30, !dbg !187

for.inc30:                                        ; preds = %for.end29
  %20 = load i32, i32* %j, align 4, !dbg !188
  %inc31 = add nsw i32 %20, 1, !dbg !188
  store i32 %inc31, i32* %j, align 4, !dbg !188
  br label %for.cond, !dbg !190

for.end32:                                        ; preds = %for.cond
  ret void, !dbg !191
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 !dbg !10 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @init(), !dbg !192
  call void @mat_mult(), !dbg !193
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0), i32 2000, i32 2000), !dbg !194
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !195
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !196
  %2 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 1999, i64 1999), align 4, !dbg !197
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i32 0, i32 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i32 %2), !dbg !198
  ret i32 0, !dbg !199
}

declare i32 @printf(i8*, ...) #4

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
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !9, !10}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !7, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 35, type: !7, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: false, variables: !2)
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 98, type: !11, isLocal: false, isDefinition: true, scopeLine: 98, isOptimized: false, variables: !2)
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
!25 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 13, type: !13)
!26 = !DIExpression()
!27 = !DILocation(line: 13, column: 9, scope: !6)
!28 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 14, type: !13)
!29 = !DILocation(line: 14, column: 9, scope: !6)
!30 = !DILocation(line: 17, column: 22, scope: !6)
!31 = !DILocation(line: 17, column: 11, scope: !6)
!32 = !DILocation(line: 17, column: 5, scope: !33)
!33 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!34 = !DILocation(line: 18, column: 11, scope: !35)
!35 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 5)
!36 = !DILocation(line: 18, column: 10, scope: !35)
!37 = !DILocation(line: 18, column: 15, scope: !38)
!38 = !DILexicalBlockFile(scope: !39, file: !1, discriminator: 1)
!39 = distinct !DILexicalBlock(scope: !35, file: !1, line: 18, column: 5)
!40 = !DILocation(line: 18, column: 16, scope: !38)
!41 = !DILocation(line: 18, column: 5, scope: !38)
!42 = !DILocation(line: 19, column: 15, scope: !43)
!43 = distinct !DILexicalBlock(scope: !44, file: !1, line: 19, column: 9)
!44 = distinct !DILexicalBlock(scope: !39, file: !1, line: 18, column: 25)
!45 = !DILocation(line: 19, column: 14, scope: !43)
!46 = !DILocation(line: 19, column: 19, scope: !47)
!47 = !DILexicalBlockFile(scope: !48, file: !1, discriminator: 1)
!48 = distinct !DILexicalBlock(scope: !43, file: !1, line: 19, column: 9)
!49 = !DILocation(line: 19, column: 20, scope: !47)
!50 = !DILocation(line: 19, column: 9, scope: !47)
!51 = !DILocation(line: 21, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 19, column: 29)
!53 = !DILocation(line: 21, column: 29, scope: !52)
!54 = !DILocation(line: 21, column: 18, scope: !52)
!55 = !DILocation(line: 21, column: 13, scope: !52)
!56 = !DILocation(line: 21, column: 15, scope: !52)
!57 = !DILocation(line: 21, column: 21, scope: !52)
!58 = !DILocation(line: 22, column: 9, scope: !52)
!59 = !DILocation(line: 19, column: 25, scope: !60)
!60 = !DILexicalBlockFile(scope: !48, file: !1, discriminator: 2)
!61 = !DILocation(line: 19, column: 9, scope: !60)
!62 = !DILocation(line: 23, column: 5, scope: !44)
!63 = !DILocation(line: 18, column: 21, scope: !64)
!64 = !DILexicalBlockFile(scope: !39, file: !1, discriminator: 2)
!65 = !DILocation(line: 18, column: 5, scope: !64)
!66 = !DILocation(line: 25, column: 11, scope: !67)
!67 = distinct !DILexicalBlock(scope: !6, file: !1, line: 25, column: 5)
!68 = !DILocation(line: 25, column: 10, scope: !67)
!69 = !DILocation(line: 25, column: 15, scope: !70)
!70 = !DILexicalBlockFile(scope: !71, file: !1, discriminator: 1)
!71 = distinct !DILexicalBlock(scope: !67, file: !1, line: 25, column: 5)
!72 = !DILocation(line: 25, column: 16, scope: !70)
!73 = !DILocation(line: 25, column: 5, scope: !70)
!74 = !DILocation(line: 26, column: 15, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 26, column: 9)
!76 = distinct !DILexicalBlock(scope: !71, file: !1, line: 25, column: 25)
!77 = !DILocation(line: 26, column: 14, scope: !75)
!78 = !DILocation(line: 26, column: 19, scope: !79)
!79 = !DILexicalBlockFile(scope: !80, file: !1, discriminator: 1)
!80 = distinct !DILexicalBlock(scope: !75, file: !1, line: 26, column: 9)
!81 = !DILocation(line: 26, column: 20, scope: !79)
!82 = !DILocation(line: 26, column: 9, scope: !79)
!83 = !DILocation(line: 29, column: 28, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !1, line: 26, column: 29)
!85 = !DILocation(line: 29, column: 23, scope: !84)
!86 = !DILocation(line: 29, column: 25, scope: !84)
!87 = !DILocation(line: 29, column: 18, scope: !84)
!88 = !DILocation(line: 29, column: 13, scope: !84)
!89 = !DILocation(line: 29, column: 15, scope: !84)
!90 = !DILocation(line: 29, column: 21, scope: !84)
!91 = !DILocation(line: 30, column: 28, scope: !84)
!92 = !DILocation(line: 30, column: 23, scope: !84)
!93 = !DILocation(line: 30, column: 25, scope: !84)
!94 = !DILocation(line: 30, column: 18, scope: !84)
!95 = !DILocation(line: 30, column: 13, scope: !84)
!96 = !DILocation(line: 30, column: 15, scope: !84)
!97 = !DILocation(line: 30, column: 21, scope: !84)
!98 = !DILocation(line: 31, column: 9, scope: !84)
!99 = !DILocation(line: 26, column: 25, scope: !100)
!100 = !DILexicalBlockFile(scope: !80, file: !1, discriminator: 2)
!101 = !DILocation(line: 26, column: 9, scope: !100)
!102 = !DILocation(line: 32, column: 5, scope: !76)
!103 = !DILocation(line: 25, column: 21, scope: !104)
!104 = !DILexicalBlockFile(scope: !71, file: !1, discriminator: 2)
!105 = !DILocation(line: 25, column: 5, scope: !104)
!106 = !DILocation(line: 33, column: 1, scope: !6)
!107 = !DILocalVariable(name: "i", scope: !9, file: !1, line: 36, type: !13)
!108 = !DILocation(line: 36, column: 6, scope: !9)
!109 = !DILocalVariable(name: "j", scope: !9, file: !1, line: 36, type: !13)
!110 = !DILocation(line: 36, column: 8, scope: !9)
!111 = !DILocalVariable(name: "k", scope: !9, file: !1, line: 36, type: !13)
!112 = !DILocation(line: 36, column: 10, scope: !9)
!113 = !DILocalVariable(name: "b_t", scope: !9, file: !1, line: 37, type: !114)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64000, align: 32, elements: !115)
!115 = !{!18}
!116 = !DILocation(line: 37, column: 6, scope: !9)
!117 = !DILocation(line: 39, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !9, file: !1, line: 39, column: 2)
!119 = !DILocation(line: 39, column: 7, scope: !118)
!120 = !DILocation(line: 39, column: 14, scope: !121)
!121 = !DILexicalBlockFile(scope: !122, file: !1, discriminator: 1)
!122 = distinct !DILexicalBlock(scope: !118, file: !1, line: 39, column: 2)
!123 = !DILocation(line: 39, column: 16, scope: !121)
!124 = !DILocation(line: 39, column: 2, scope: !121)
!125 = !DILocation(line: 41, column: 10, scope: !126)
!126 = distinct !DILexicalBlock(scope: !127, file: !1, line: 41, column: 3)
!127 = distinct !DILexicalBlock(scope: !122, file: !1, line: 39, column: 26)
!128 = !DILocation(line: 41, column: 8, scope: !126)
!129 = !DILocation(line: 41, column: 15, scope: !130)
!130 = !DILexicalBlockFile(scope: !131, file: !1, discriminator: 1)
!131 = distinct !DILexicalBlock(scope: !126, file: !1, line: 41, column: 3)
!132 = !DILocation(line: 41, column: 17, scope: !130)
!133 = !DILocation(line: 41, column: 3, scope: !130)
!134 = !DILocation(line: 42, column: 18, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !1, line: 41, column: 27)
!136 = !DILocation(line: 42, column: 13, scope: !135)
!137 = !DILocation(line: 42, column: 15, scope: !135)
!138 = !DILocation(line: 42, column: 8, scope: !135)
!139 = !DILocation(line: 42, column: 4, scope: !135)
!140 = !DILocation(line: 42, column: 11, scope: !135)
!141 = !DILocation(line: 43, column: 3, scope: !135)
!142 = !DILocation(line: 41, column: 23, scope: !143)
!143 = !DILexicalBlockFile(scope: !131, file: !1, discriminator: 2)
!144 = !DILocation(line: 41, column: 3, scope: !143)
!145 = !DILocation(line: 45, column: 10, scope: !146)
!146 = distinct !DILexicalBlock(scope: !127, file: !1, line: 45, column: 3)
!147 = !DILocation(line: 45, column: 8, scope: !146)
!148 = !DILocation(line: 45, column: 15, scope: !149)
!149 = !DILexicalBlockFile(scope: !150, file: !1, discriminator: 1)
!150 = distinct !DILexicalBlock(scope: !146, file: !1, line: 45, column: 3)
!151 = !DILocation(line: 45, column: 17, scope: !149)
!152 = !DILocation(line: 45, column: 3, scope: !149)
!153 = !DILocalVariable(name: "sum", scope: !154, file: !1, line: 46, type: !13)
!154 = distinct !DILexicalBlock(scope: !150, file: !1, line: 45, column: 27)
!155 = !DILocation(line: 46, column: 8, scope: !154)
!156 = !DILocation(line: 47, column: 9, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !1, line: 47, column: 4)
!158 = !DILocation(line: 47, column: 8, scope: !157)
!159 = !DILocation(line: 47, column: 12, scope: !160)
!160 = !DILexicalBlockFile(scope: !161, file: !1, discriminator: 1)
!161 = distinct !DILexicalBlock(scope: !157, file: !1, line: 47, column: 4)
!162 = !DILocation(line: 47, column: 13, scope: !160)
!163 = !DILocation(line: 47, column: 4, scope: !160)
!164 = !DILocation(line: 48, column: 11, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !1, line: 47, column: 20)
!166 = !DILocation(line: 48, column: 22, scope: !165)
!167 = !DILocation(line: 48, column: 17, scope: !165)
!168 = !DILocation(line: 48, column: 19, scope: !165)
!169 = !DILocation(line: 48, column: 29, scope: !165)
!170 = !DILocation(line: 48, column: 25, scope: !165)
!171 = !DILocation(line: 48, column: 24, scope: !165)
!172 = !DILocation(line: 48, column: 15, scope: !165)
!173 = !DILocation(line: 48, column: 9, scope: !165)
!174 = !DILocation(line: 49, column: 4, scope: !165)
!175 = !DILocation(line: 47, column: 17, scope: !176)
!176 = !DILexicalBlockFile(scope: !161, file: !1, discriminator: 2)
!177 = !DILocation(line: 47, column: 4, scope: !176)
!178 = !DILocation(line: 50, column: 14, scope: !154)
!179 = !DILocation(line: 50, column: 9, scope: !154)
!180 = !DILocation(line: 50, column: 4, scope: !154)
!181 = !DILocation(line: 50, column: 6, scope: !154)
!182 = !DILocation(line: 50, column: 12, scope: !154)
!183 = !DILocation(line: 51, column: 3, scope: !154)
!184 = !DILocation(line: 45, column: 23, scope: !185)
!185 = !DILexicalBlockFile(scope: !150, file: !1, discriminator: 2)
!186 = !DILocation(line: 45, column: 3, scope: !185)
!187 = !DILocation(line: 52, column: 2, scope: !127)
!188 = !DILocation(line: 39, column: 22, scope: !189)
!189 = !DILexicalBlockFile(scope: !122, file: !1, discriminator: 2)
!190 = !DILocation(line: 39, column: 2, scope: !189)
!191 = !DILocation(line: 53, column: 1, scope: !9)
!192 = !DILocation(line: 99, column: 2, scope: !10)
!193 = !DILocation(line: 100, column: 2, scope: !10)
!194 = !DILocation(line: 102, column: 2, scope: !10)
!195 = !DILocation(line: 104, column: 19, scope: !10)
!196 = !DILocation(line: 105, column: 19, scope: !10)
!197 = !DILocation(line: 106, column: 19, scope: !10)
!198 = !DILocation(line: 103, column: 5, scope: !10)
!199 = !DILocation(line: 108, column: 5, scope: !10)
