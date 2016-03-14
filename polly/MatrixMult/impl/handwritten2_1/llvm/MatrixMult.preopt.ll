; ModuleID = 'MatrixMult.s'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i32*, i32, i32 }

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @init(i32 %value, i32 %width, i32 %height) #0 !dbg !15 {
entry:
  br label %entry.split, !dbg !31

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %value, i64 0, metadata !32, metadata !33), !dbg !31
  tail call void @llvm.dbg.value(metadata i32 %width, i64 0, metadata !34, metadata !33), !dbg !35
  tail call void @llvm.dbg.value(metadata i32 %height, i64 0, metadata !36, metadata !33), !dbg !37
  %mul = mul nsw i32 %height, %width, !dbg !38
  %conv = sext i32 %mul to i64, !dbg !39
  %mul1 = shl nsw i64 %conv, 2, !dbg !40
  %call = tail call noalias i8* @malloc(i64 %mul1) #4, !dbg !41
  %0 = bitcast i8* %call to i32*, !dbg !42
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !43, metadata !33), !dbg !44
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !45, metadata !33), !dbg !46
  %cmp3 = icmp sgt i32 %height, 0, !dbg !47
  br i1 %cmp3, label %for.cond3.preheader.lr.ph, label %for.end10, !dbg !51

for.cond3.preheader.lr.ph:                        ; preds = %entry.split
  %1 = sext i32 %width to i64, !dbg !51
  br label %for.cond3.preheader, !dbg !51

for.cond3.preheader:                              ; preds = %for.cond3.preheader.lr.ph, %for.inc8
  %indvars.iv7 = phi i64 [ 0, %for.cond3.preheader.lr.ph ], [ %indvars.iv.next8, %for.inc8 ]
  %cmp41 = icmp sgt i32 %width, 0, !dbg !52
  br i1 %cmp41, label %for.body6.lr.ph, label %for.inc8, !dbg !57

for.body6.lr.ph:                                  ; preds = %for.cond3.preheader
  br label %for.body6, !dbg !57

for.body6:                                        ; preds = %for.body6.lr.ph, %for.body6
  %indvars.iv = phi i64 [ 0, %for.body6.lr.ph ], [ %indvars.iv.next, %for.body6 ]
  %2 = mul nsw i64 %indvars.iv7, %1, !dbg !58
  %3 = add nsw i64 %indvars.iv, %2, !dbg !60
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %3, !dbg !61
  store i32 %value, i32* %arrayidx, align 4, !dbg !62
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !57
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !63, metadata !33), !dbg !64
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !57
  %exitcond = icmp ne i32 %lftr.wideiv, %width, !dbg !57
  br i1 %exitcond, label %for.body6, label %for.cond3.for.inc8_crit_edge, !dbg !57

for.cond3.for.inc8_crit_edge:                     ; preds = %for.body6
  br label %for.inc8, !dbg !57

for.inc8:                                         ; preds = %for.cond3.for.inc8_crit_edge, %for.cond3.preheader
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !dbg !51
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !45, metadata !33), !dbg !46
  %lftr.wideiv10 = trunc i64 %indvars.iv.next8 to i32, !dbg !51
  %exitcond11 = icmp ne i32 %lftr.wideiv10, %height, !dbg !51
  br i1 %exitcond11, label %for.cond3.preheader, label %for.cond.for.end10_crit_edge, !dbg !51

for.cond.for.end10_crit_edge:                     ; preds = %for.inc8
  br label %for.end10, !dbg !51

for.end10:                                        ; preds = %for.cond.for.end10_crit_edge, %entry.split
  %call11 = tail call noalias i8* @malloc(i64 16) #4, !dbg !65
  %4 = bitcast i8* %call11 to %struct.Matrix*, !dbg !66
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %4, i64 0, metadata !67, metadata !33), !dbg !68
  %5 = bitcast i8* %call11 to i8**, !dbg !69
  store i8* %call, i8** %5, align 8, !dbg !69
  %width13 = getelementptr inbounds i8, i8* %call11, i64 8, !dbg !70
  %6 = bitcast i8* %width13 to i32*, !dbg !70
  store i32 %width, i32* %6, align 8, !dbg !71
  %height14 = getelementptr inbounds i8, i8* %call11, i64 12, !dbg !72
  %7 = bitcast i8* %height14 to i32*, !dbg !72
  store i32 %height, i32* %7, align 4, !dbg !73
  ret %struct.Matrix* %4, !dbg !74
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.Matrix* @matrix_multiply(%struct.Matrix* noalias %A, %struct.Matrix* noalias %B) #0 !dbg !19 {
entry:
  br label %entry.split, !dbg !75

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %A, i64 0, metadata !76, metadata !33), !dbg !75
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %B, i64 0, metadata !77, metadata !33), !dbg !78
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 0, !dbg !79
  %0 = load i32*, i32** %data, align 8, !dbg !79
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !80, metadata !33), !dbg !81
  %data1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 0, !dbg !82
  %1 = load i32*, i32** %data1, align 8, !dbg !82
  tail call void @llvm.dbg.value(metadata i32* %1, i64 0, metadata !83, metadata !33), !dbg !84
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 1, !dbg !85
  %2 = load i32, i32* %width2, align 8, !dbg !85
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !86, metadata !33), !dbg !87
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 2, !dbg !88
  %3 = load i32, i32* %height3, align 4, !dbg !88
  tail call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !89, metadata !33), !dbg !90
  %mul = mul nsw i32 %3, %2, !dbg !91
  %conv = sext i32 %mul to i64, !dbg !92
  %mul4 = shl nsw i64 %conv, 2, !dbg !93
  %call = tail call noalias i8* @malloc(i64 %mul4) #4, !dbg !94
  %4 = bitcast i8* %call to i32*, !dbg !95
  tail call void @llvm.dbg.value(metadata i32* %4, i64 0, metadata !96, metadata !33), !dbg !97
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !98, metadata !33), !dbg !99
  %height5 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 2, !dbg !100
  %5 = load i32, i32* %height5, align 4, !dbg !100
  %cmp6 = icmp sgt i32 %5, 0, !dbg !104
  br i1 %cmp6, label %for.cond7.preheader.lr.ph, label %for.end41, !dbg !105

for.cond7.preheader.lr.ph:                        ; preds = %entry.split
  %6 = sext i32 %2 to i64, !dbg !105
  %7 = sext i32 %2 to i64, !dbg !105
  %8 = sext i32 %2 to i64, !dbg !105
  %9 = sext i32 %2 to i64, !dbg !105
  %10 = sext i32 %2 to i64, !dbg !105
  br label %for.cond7.preheader, !dbg !105

for.cond7.preheader:                              ; preds = %for.cond7.preheader.lr.ph, %for.inc39
  %indvars.iv17 = phi i64 [ 0, %for.cond7.preheader.lr.ph ], [ %indvars.iv.next18, %for.inc39 ]
  %width8 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 1, !dbg !106
  %11 = load i32, i32* %width8, align 8, !dbg !106
  %cmp93 = icmp sgt i32 %11, 0, !dbg !111
  br i1 %cmp93, label %for.body11.lr.ph, label %for.inc39, !dbg !112

for.body11.lr.ph:                                 ; preds = %for.cond7.preheader
  br label %for.body11, !dbg !112

for.body11:                                       ; preds = %for.body11.lr.ph, %for.inc36
  %indvars.iv12 = phi i64 [ 0, %for.body11.lr.ph ], [ %indvars.iv.next13, %for.inc36 ]
  %12 = mul nsw i64 %indvars.iv17, %10, !dbg !113
  %13 = add nsw i64 %indvars.iv12, %12, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %13, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !118, metadata !33), !dbg !119
  %width14 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 1, !dbg !120
  %14 = load i32, i32* %width14, align 8, !dbg !120
  %cmp151 = icmp sgt i32 %14, 0, !dbg !124
  br i1 %cmp151, label %for.body17.lr.ph, label %for.inc36, !dbg !125

for.body17.lr.ph:                                 ; preds = %for.body11
  br label %for.body17, !dbg !125

for.body17:                                       ; preds = %for.body17.lr.ph, %for.body17
  %indvars.iv = phi i64 [ 0, %for.body17.lr.ph ], [ %indvars.iv.next, %for.body17 ]
  %15 = mul nsw i64 %indvars.iv17, %9, !dbg !126
  %16 = add nsw i64 %indvars.iv12, %15, !dbg !128
  %arrayidx21 = getelementptr inbounds i32, i32* %4, i64 %16, !dbg !129
  %17 = load i32, i32* %arrayidx21, align 4, !dbg !129
  %18 = mul nsw i64 %indvars.iv17, %8, !dbg !130
  %19 = add nsw i64 %indvars.iv, %18, !dbg !131
  %arrayidx25 = getelementptr inbounds i32, i32* %0, i64 %19, !dbg !132
  %20 = load i32, i32* %arrayidx25, align 4, !dbg !132
  %21 = mul nsw i64 %indvars.iv, %6, !dbg !133
  %22 = add nsw i64 %21, %indvars.iv12, !dbg !134
  %arrayidx29 = getelementptr inbounds i32, i32* %1, i64 %22, !dbg !135
  %23 = load i32, i32* %arrayidx29, align 4, !dbg !135
  %mul30 = mul nsw i32 %23, %20, !dbg !136
  %add31 = add nsw i32 %mul30, %17, !dbg !137
  %24 = mul nsw i64 %indvars.iv17, %7, !dbg !138
  %25 = add nsw i64 %indvars.iv12, %24, !dbg !139
  %arrayidx35 = getelementptr inbounds i32, i32* %4, i64 %25, !dbg !140
  store i32 %add31, i32* %arrayidx35, align 4, !dbg !141
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !125
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !118, metadata !33), !dbg !119
  %26 = load i32, i32* %width14, align 8, !dbg !120
  %27 = sext i32 %26 to i64, !dbg !124
  %cmp15 = icmp slt i64 %indvars.iv.next, %27, !dbg !124
  br i1 %cmp15, label %for.body17, label %for.cond13.for.inc36_crit_edge, !dbg !125

for.cond13.for.inc36_crit_edge:                   ; preds = %for.body17
  br label %for.inc36, !dbg !125

for.inc36:                                        ; preds = %for.cond13.for.inc36_crit_edge, %for.body11
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !dbg !112
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !142, metadata !33), !dbg !143
  %28 = load i32, i32* %width8, align 8, !dbg !106
  %29 = sext i32 %28 to i64, !dbg !111
  %cmp9 = icmp slt i64 %indvars.iv.next13, %29, !dbg !111
  br i1 %cmp9, label %for.body11, label %for.cond7.for.inc39_crit_edge, !dbg !112

for.cond7.for.inc39_crit_edge:                    ; preds = %for.inc36
  br label %for.inc39, !dbg !112

for.inc39:                                        ; preds = %for.cond7.for.inc39_crit_edge, %for.cond7.preheader
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1, !dbg !105
  tail call void @llvm.dbg.value(metadata !2, i64 0, metadata !98, metadata !33), !dbg !99
  %30 = load i32, i32* %height5, align 4, !dbg !100
  %31 = sext i32 %30 to i64, !dbg !104
  %cmp = icmp slt i64 %indvars.iv.next18, %31, !dbg !104
  br i1 %cmp, label %for.cond7.preheader, label %for.cond.for.end41_crit_edge, !dbg !105

for.cond.for.end41_crit_edge:                     ; preds = %for.inc39
  br label %for.end41, !dbg !105

for.end41:                                        ; preds = %for.cond.for.end41_crit_edge, %entry.split
  %call42 = tail call noalias i8* @malloc(i64 16) #4, !dbg !144
  %32 = bitcast i8* %call42 to %struct.Matrix*, !dbg !145
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %32, i64 0, metadata !146, metadata !33), !dbg !147
  %33 = bitcast i8* %call42 to i8**, !dbg !148
  store i8* %call, i8** %33, align 8, !dbg !148
  %width44 = getelementptr inbounds i8, i8* %call42, i64 8, !dbg !149
  %34 = bitcast i8* %width44 to i32*, !dbg !149
  store i32 %2, i32* %34, align 8, !dbg !150
  %height45 = getelementptr inbounds i8, i8* %call42, i64 12, !dbg !151
  %35 = bitcast i8* %height45 to i32*, !dbg !151
  store i32 %3, i32* %35, align 4, !dbg !152
  ret %struct.Matrix* %32, !dbg !153
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !22 {
entry:
  br label %entry.split, !dbg !154

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !155, metadata !33), !dbg !154
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !156, metadata !33), !dbg !157
  tail call void @llvm.dbg.value(metadata %struct.Matrix* null, i64 0, metadata !158, metadata !33), !dbg !159
  tail call void @llvm.dbg.value(metadata %struct.Matrix* null, i64 0, metadata !160, metadata !33), !dbg !161
  tail call void @llvm.dbg.value(metadata %struct.Matrix* null, i64 0, metadata !162, metadata !33), !dbg !163
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #4, !dbg !164
  %0 = load i64*, i64** %call, align 8, !dbg !165
  %call1 = tail call i64 @parseStringToInt(i64* %0) #4, !dbg !166
  %conv = trunc i64 %call1 to i32, !dbg !166
  tail call void @llvm.dbg.value(metadata i32 %conv, i64 0, metadata !167, metadata !33), !dbg !168
  tail call void @llvm.dbg.value(metadata i32 %conv, i64 0, metadata !169, metadata !33), !dbg !170
  tail call void @llvm.dbg.value(metadata i32 %conv, i64 0, metadata !171, metadata !33), !dbg !172
  %call2 = tail call %struct.Matrix* @init(i32 1, i32 %conv, i32 %conv), !dbg !173
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call2, i64 0, metadata !158, metadata !33), !dbg !159
  %call3 = tail call %struct.Matrix* @init(i32 1, i32 %conv, i32 %conv), !dbg !174
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call3, i64 0, metadata !160, metadata !33), !dbg !161
  %call4 = tail call %struct.Matrix* @matrix_multiply(%struct.Matrix* %call2, %struct.Matrix* %call3), !dbg !175
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !162, metadata !33), !dbg !163
  %sub = add nsw i32 %conv, -1, !dbg !176
  %sub5 = add nsw i32 %conv, -1, !dbg !177
  %add = shl i64 %call1, 32, !dbg !178
  %sub7 = mul i64 %add, %call1, !dbg !179
  %sext = add i64 %sub7, -4294967296, !dbg !179
  %idxprom = ashr exact i64 %sext, 32, !dbg !179
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !180
  %1 = load i32*, i32** %data, align 8, !dbg !180
  %arrayidx8 = getelementptr inbounds i32, i32* %1, i64 %idxprom, !dbg !179
  %2 = load i32, i32* %arrayidx8, align 4, !dbg !179
  %call9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv, i32 %sub, i32 %sub5, i32 %2) #4, !dbg !181
  ret i32 0, !dbg !182
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64 @parseStringToInt(i64*) #3

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !14)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "Matrix", file: !1, line: 9, baseType: !8)
!8 = !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 5, size: 128, align: 64, elements: !9)
!9 = !{!10, !12, !13}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !1, line: 6, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !4)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !8, file: !1, line: 7, baseType: !5, size: 32, align: 32, offset: 64)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !8, file: !1, line: 8, baseType: !5, size: 32, align: 32, offset: 96)
!14 = !{!15, !19, !22}
!15 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 11, type: !16, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !5, !5, !5}
!18 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !6)
!19 = distinct !DISubprogram(name: "matrix_multiply", scope: !1, file: !1, line: 29, type: !20, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!18, !18, !18}
!22 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 85, type: !23, isLocal: false, isDefinition: true, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!5, !5, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, align: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64, align: 64)
!27 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!28 = !{i32 2, !"Dwarf Version", i32 4}
!29 = !{i32 2, !"Debug Info Version", i32 3}
!30 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!31 = !DILocation(line: 11, column: 31, scope: !15)
!32 = !DILocalVariable(name: "value", arg: 1, scope: !15, file: !1, line: 11, type: !5)
!33 = !DIExpression()
!34 = !DILocalVariable(name: "width", arg: 2, scope: !15, file: !1, line: 11, type: !5)
!35 = !DILocation(line: 11, column: 42, scope: !15)
!36 = !DILocalVariable(name: "height", arg: 3, scope: !15, file: !1, line: 11, type: !5)
!37 = !DILocation(line: 11, column: 53, scope: !15)
!38 = !DILocation(line: 15, column: 49, scope: !15)
!39 = !DILocation(line: 15, column: 43, scope: !15)
!40 = !DILocation(line: 15, column: 55, scope: !15)
!41 = !DILocation(line: 15, column: 36, scope: !15)
!42 = !DILocation(line: 15, column: 30, scope: !15)
!43 = !DILocalVariable(name: "data", scope: !15, file: !1, line: 15, type: !11)
!44 = !DILocation(line: 15, column: 23, scope: !15)
!45 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 13, type: !5)
!46 = !DILocation(line: 13, column: 9, scope: !15)
!47 = !DILocation(line: 16, column: 14, scope: !48)
!48 = !DILexicalBlockFile(scope: !49, file: !1, discriminator: 1)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 16, column: 5)
!50 = distinct !DILexicalBlock(scope: !15, file: !1, line: 16, column: 5)
!51 = !DILocation(line: 16, column: 5, scope: !48)
!52 = !DILocation(line: 17, column: 18, scope: !53)
!53 = !DILexicalBlockFile(scope: !54, file: !1, discriminator: 1)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 17, column: 9)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 17, column: 9)
!56 = distinct !DILexicalBlock(scope: !49, file: !1, line: 16, column: 26)
!57 = !DILocation(line: 17, column: 9, scope: !53)
!58 = !DILocation(line: 18, column: 19, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !1, line: 17, column: 29)
!60 = !DILocation(line: 18, column: 25, scope: !59)
!61 = !DILocation(line: 18, column: 13, scope: !59)
!62 = !DILocation(line: 18, column: 29, scope: !59)
!63 = !DILocalVariable(name: "j", scope: !15, file: !1, line: 13, type: !5)
!64 = !DILocation(line: 13, column: 12, scope: !15)
!65 = !DILocation(line: 21, column: 44, scope: !15)
!66 = !DILocation(line: 21, column: 35, scope: !15)
!67 = !DILocalVariable(name: "matrix", scope: !15, file: !1, line: 21, type: !18)
!68 = !DILocation(line: 21, column: 26, scope: !15)
!69 = !DILocation(line: 22, column: 18, scope: !15)
!70 = !DILocation(line: 23, column: 13, scope: !15)
!71 = !DILocation(line: 23, column: 19, scope: !15)
!72 = !DILocation(line: 24, column: 13, scope: !15)
!73 = !DILocation(line: 24, column: 20, scope: !15)
!74 = !DILocation(line: 26, column: 5, scope: !15)
!75 = !DILocation(line: 29, column: 59, scope: !19)
!76 = !DILocalVariable(name: "A", arg: 1, scope: !19, file: !1, line: 29, type: !18)
!77 = !DILocalVariable(name: "B", arg: 2, scope: !19, file: !1, line: 29, type: !18)
!78 = !DILocation(line: 29, column: 83, scope: !19)
!79 = !DILocation(line: 31, column: 35, scope: !19)
!80 = !DILocalVariable(name: "A_data", scope: !19, file: !1, line: 31, type: !11)
!81 = !DILocation(line: 31, column: 23, scope: !19)
!82 = !DILocation(line: 32, column: 35, scope: !19)
!83 = !DILocalVariable(name: "B_data", scope: !19, file: !1, line: 32, type: !11)
!84 = !DILocation(line: 32, column: 23, scope: !19)
!85 = !DILocation(line: 34, column: 20, scope: !19)
!86 = !DILocalVariable(name: "width", scope: !19, file: !1, line: 34, type: !5)
!87 = !DILocation(line: 34, column: 9, scope: !19)
!88 = !DILocation(line: 35, column: 21, scope: !19)
!89 = !DILocalVariable(name: "height", scope: !19, file: !1, line: 35, type: !5)
!90 = !DILocation(line: 35, column: 9, scope: !19)
!91 = !DILocation(line: 36, column: 50, scope: !19)
!92 = !DILocation(line: 36, column: 45, scope: !19)
!93 = !DILocation(line: 36, column: 57, scope: !19)
!94 = !DILocation(line: 36, column: 38, scope: !19)
!95 = !DILocation(line: 36, column: 32, scope: !19)
!96 = !DILocalVariable(name: "C_data", scope: !19, file: !1, line: 36, type: !11)
!97 = !DILocation(line: 36, column: 23, scope: !19)
!98 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 30, type: !5)
!99 = !DILocation(line: 30, column: 9, scope: !19)
!100 = !DILocation(line: 37, column: 19, scope: !101)
!101 = !DILexicalBlockFile(scope: !102, file: !1, discriminator: 1)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 37, column: 5)
!103 = distinct !DILexicalBlock(scope: !19, file: !1, line: 37, column: 5)
!104 = !DILocation(line: 37, column: 15, scope: !101)
!105 = !DILocation(line: 37, column: 5, scope: !101)
!106 = !DILocation(line: 39, column: 22, scope: !107)
!107 = !DILexicalBlockFile(scope: !108, file: !1, discriminator: 1)
!108 = distinct !DILexicalBlock(scope: !109, file: !1, line: 39, column: 9)
!109 = distinct !DILexicalBlock(scope: !110, file: !1, line: 39, column: 9)
!110 = distinct !DILexicalBlock(scope: !102, file: !1, line: 37, column: 33)
!111 = !DILocation(line: 39, column: 18, scope: !107)
!112 = !DILocation(line: 39, column: 9, scope: !107)
!113 = !DILocation(line: 40, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !1, line: 39, column: 32)
!115 = !DILocation(line: 40, column: 27, scope: !114)
!116 = !DILocation(line: 40, column: 13, scope: !114)
!117 = !DILocation(line: 40, column: 31, scope: !114)
!118 = !DILocalVariable(name: "k", scope: !19, file: !1, line: 30, type: !5)
!119 = !DILocation(line: 30, column: 13, scope: !19)
!120 = !DILocation(line: 41, column: 26, scope: !121)
!121 = !DILexicalBlockFile(scope: !122, file: !1, discriminator: 1)
!122 = distinct !DILexicalBlock(scope: !123, file: !1, line: 41, column: 13)
!123 = distinct !DILexicalBlock(scope: !114, file: !1, line: 41, column: 13)
!124 = !DILocation(line: 41, column: 22, scope: !121)
!125 = !DILocation(line: 41, column: 13, scope: !121)
!126 = !DILocation(line: 42, column: 45, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !1, line: 41, column: 36)
!128 = !DILocation(line: 42, column: 51, scope: !127)
!129 = !DILocation(line: 42, column: 37, scope: !127)
!130 = !DILocation(line: 42, column: 65, scope: !127)
!131 = !DILocation(line: 42, column: 71, scope: !127)
!132 = !DILocation(line: 42, column: 57, scope: !127)
!133 = !DILocation(line: 42, column: 83, scope: !127)
!134 = !DILocation(line: 42, column: 89, scope: !127)
!135 = !DILocation(line: 42, column: 75, scope: !127)
!136 = !DILocation(line: 42, column: 74, scope: !127)
!137 = !DILocation(line: 42, column: 55, scope: !127)
!138 = !DILocation(line: 42, column: 25, scope: !127)
!139 = !DILocation(line: 42, column: 31, scope: !127)
!140 = !DILocation(line: 42, column: 17, scope: !127)
!141 = !DILocation(line: 42, column: 35, scope: !127)
!142 = !DILocalVariable(name: "j", scope: !19, file: !1, line: 30, type: !5)
!143 = !DILocation(line: 30, column: 11, scope: !19)
!144 = !DILocation(line: 47, column: 39, scope: !19)
!145 = !DILocation(line: 47, column: 30, scope: !19)
!146 = !DILocalVariable(name: "C", scope: !19, file: !1, line: 47, type: !18)
!147 = !DILocation(line: 47, column: 26, scope: !19)
!148 = !DILocation(line: 48, column: 13, scope: !19)
!149 = !DILocation(line: 49, column: 8, scope: !19)
!150 = !DILocation(line: 49, column: 14, scope: !19)
!151 = !DILocation(line: 50, column: 8, scope: !19)
!152 = !DILocation(line: 50, column: 15, scope: !19)
!153 = !DILocation(line: 52, column: 5, scope: !19)
!154 = !DILocation(line: 85, column: 14, scope: !22)
!155 = !DILocalVariable(name: "argc", arg: 1, scope: !22, file: !1, line: 85, type: !5)
!156 = !DILocalVariable(name: "args", arg: 2, scope: !22, file: !1, line: 85, type: !25)
!157 = !DILocation(line: 85, column: 27, scope: !22)
!158 = !DILocalVariable(name: "A", scope: !22, file: !1, line: 94, type: !18)
!159 = !DILocation(line: 94, column: 26, scope: !22)
!160 = !DILocalVariable(name: "B", scope: !22, file: !1, line: 95, type: !18)
!161 = !DILocation(line: 95, column: 26, scope: !22)
!162 = !DILocalVariable(name: "C", scope: !22, file: !1, line: 96, type: !18)
!163 = !DILocation(line: 96, column: 26, scope: !22)
!164 = !DILocation(line: 99, column: 19, scope: !22)
!165 = !DILocation(line: 100, column: 32, scope: !22)
!166 = !DILocation(line: 100, column: 15, scope: !22)
!167 = !DILocalVariable(name: "max", scope: !22, file: !1, line: 100, type: !5)
!168 = !DILocation(line: 100, column: 9, scope: !22)
!169 = !DILocalVariable(name: "width", scope: !22, file: !1, line: 97, type: !5)
!170 = !DILocation(line: 97, column: 9, scope: !22)
!171 = !DILocalVariable(name: "height", scope: !22, file: !1, line: 97, type: !5)
!172 = !DILocation(line: 97, column: 16, scope: !22)
!173 = !DILocation(line: 105, column: 7, scope: !22)
!174 = !DILocation(line: 106, column: 7, scope: !22)
!175 = !DILocation(line: 108, column: 7, scope: !22)
!176 = !DILocation(line: 109, column: 75, scope: !22)
!177 = !DILocation(line: 109, column: 82, scope: !22)
!178 = !DILocation(line: 109, column: 107, scope: !22)
!179 = !DILocation(line: 109, column: 86, scope: !22)
!180 = !DILocation(line: 109, column: 90, scope: !22)
!181 = !DILocation(line: 109, column: 5, scope: !22)
!182 = !DILocation(line: 111, column: 5, scope: !22)
