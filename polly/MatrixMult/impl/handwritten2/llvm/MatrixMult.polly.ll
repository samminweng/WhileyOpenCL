; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@X = common global [512 x [512 x i32]] zeroinitializer, align 16
@Y = common global [512 x [512 x i32]] zeroinitializer, align 16
@Z = common global [512 x [512 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !8, metadata !38), !dbg !39
  br label %for.cond1.preheader, !dbg !40

for.cond1.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv23 = phi i64 [ 0, %entry ], [ %indvars.iv.next24, %for.inc10 ]
  br label %for.body3, !dbg !44

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.3, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv23, i64 %indvars.iv, !dbg !49
  store i32 1, i32* %arrayidx5, align 16, !dbg !51, !tbaa !52
  %arrayidx9 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv23, i64 %indvars.iv, !dbg !56
  store i32 1, i32* %arrayidx9, align 16, !dbg !57, !tbaa !52
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !44
  %arrayidx5.1 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next, !dbg !49
  store i32 1, i32* %arrayidx5.1, align 4, !dbg !51, !tbaa !52
  %arrayidx9.1 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next, !dbg !56
  store i32 1, i32* %arrayidx9.1, align 4, !dbg !57, !tbaa !52
  %indvars.iv.next.1 = or i64 %indvars.iv, 2, !dbg !44
  %arrayidx5.2 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.1, !dbg !49
  store i32 1, i32* %arrayidx5.2, align 8, !dbg !51, !tbaa !52
  %arrayidx9.2 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.1, !dbg !56
  store i32 1, i32* %arrayidx9.2, align 8, !dbg !57, !tbaa !52
  %indvars.iv.next.2 = or i64 %indvars.iv, 3, !dbg !44
  %arrayidx5.3 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.2, !dbg !49
  store i32 1, i32* %arrayidx5.3, align 4, !dbg !51, !tbaa !52
  %arrayidx9.3 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv23, i64 %indvars.iv.next.2, !dbg !56
  store i32 1, i32* %arrayidx9.3, align 4, !dbg !57, !tbaa !52
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4, !dbg !44
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 512, !dbg !44
  br i1 %exitcond.3, label %for.inc10, label %for.body3, !dbg !44

for.inc10:                                        ; preds = %for.body3
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1, !dbg !40
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 512, !dbg !40
  br i1 %exitcond25, label %for.end12, label %for.cond1.preheader, !dbg !40

for.end12:                                        ; preds = %for.inc10
  ret void, !dbg !58
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define i32 @main() #3 !dbg !11 {
entry:
  %y_t = alloca [512 x i32], align 16
  tail call void @init(), !dbg !59
  %0 = bitcast [512 x i32]* %y_t to i8*, !dbg !60
  call void @llvm.lifetime.start(i64 2048, i8* %0) #5, !dbg !60
  tail call void @llvm.dbg.declare(metadata [512 x i32]* %y_t, metadata !18, metadata !38), !dbg !61
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !16, metadata !38), !dbg !62
  br label %for.cond1.preheader, !dbg !63

for.cond1.preheader:                              ; preds = %for.inc30, %entry
  %indvars.iv61 = phi i64 [ 0, %entry ], [ %indvars.iv.next62, %for.inc30 ]
  br label %for.body3, !dbg !65

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.3, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv, i64 %indvars.iv61, !dbg !69
  %1 = load i32, i32* %arrayidx5, align 4, !dbg !69, !tbaa !52
  %arrayidx7 = getelementptr inbounds [512 x i32], [512 x i32]* %y_t, i64 0, i64 %indvars.iv, !dbg !71
  store i32 %1, i32* %arrayidx7, align 16, !dbg !72, !tbaa !52
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !65
  %arrayidx5.1 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv.next, i64 %indvars.iv61, !dbg !69
  %2 = load i32, i32* %arrayidx5.1, align 4, !dbg !69, !tbaa !52
  %arrayidx7.1 = getelementptr inbounds [512 x i32], [512 x i32]* %y_t, i64 0, i64 %indvars.iv.next, !dbg !71
  store i32 %2, i32* %arrayidx7.1, align 4, !dbg !72, !tbaa !52
  %indvars.iv.next.1 = or i64 %indvars.iv, 2, !dbg !65
  %arrayidx5.2 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv.next.1, i64 %indvars.iv61, !dbg !69
  %3 = load i32, i32* %arrayidx5.2, align 4, !dbg !69, !tbaa !52
  %arrayidx7.2 = getelementptr inbounds [512 x i32], [512 x i32]* %y_t, i64 0, i64 %indvars.iv.next.1, !dbg !71
  store i32 %3, i32* %arrayidx7.2, align 8, !dbg !72, !tbaa !52
  %indvars.iv.next.2 = or i64 %indvars.iv, 3, !dbg !65
  %arrayidx5.3 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Y, i64 0, i64 %indvars.iv.next.2, i64 %indvars.iv61, !dbg !69
  %4 = load i32, i32* %arrayidx5.3, align 4, !dbg !69, !tbaa !52
  %arrayidx7.3 = getelementptr inbounds [512 x i32], [512 x i32]* %y_t, i64 0, i64 %indvars.iv.next.2, !dbg !71
  store i32 %4, i32* %arrayidx7.3, align 4, !dbg !72, !tbaa !52
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4, !dbg !65
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 512, !dbg !65
  br i1 %exitcond.3, label %for.cond11.preheader.preheader, label %for.body3, !dbg !65

for.cond11.preheader.preheader:                   ; preds = %for.body3
  br label %for.cond11.preheader, !dbg !73

for.cond11.preheader:                             ; preds = %for.cond11.preheader.preheader, %for.end22
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.end22 ], [ 0, %for.cond11.preheader.preheader ]
  br label %for.body13, !dbg !73

for.body13:                                       ; preds = %for.body13, %for.cond11.preheader
  %indvars.iv55 = phi i64 [ 0, %for.cond11.preheader ], [ %indvars.iv.next56.3, %for.body13 ]
  %sum.052 = phi i32 [ 0, %for.cond11.preheader ], [ %add.3, %for.body13 ]
  %arrayidx17 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv58, i64 %indvars.iv55, !dbg !77
  %5 = load i32, i32* %arrayidx17, align 16, !dbg !77, !tbaa !52
  %arrayidx19 = getelementptr inbounds [512 x i32], [512 x i32]* %y_t, i64 0, i64 %indvars.iv55, !dbg !79
  %6 = load i32, i32* %arrayidx19, align 16, !dbg !79, !tbaa !52
  %mul = mul nsw i32 %6, %5, !dbg !80
  %add = add nsw i32 %mul, %sum.052, !dbg !81
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !22, metadata !38), !dbg !82
  %indvars.iv.next56 = or i64 %indvars.iv55, 1, !dbg !73
  %arrayidx17.1 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv58, i64 %indvars.iv.next56, !dbg !77
  %7 = load i32, i32* %arrayidx17.1, align 4, !dbg !77, !tbaa !52
  %arrayidx19.1 = getelementptr inbounds [512 x i32], [512 x i32]* %y_t, i64 0, i64 %indvars.iv.next56, !dbg !79
  %8 = load i32, i32* %arrayidx19.1, align 4, !dbg !79, !tbaa !52
  %mul.1 = mul nsw i32 %8, %7, !dbg !80
  %add.1 = add nsw i32 %mul.1, %add, !dbg !81
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !22, metadata !38), !dbg !82
  %indvars.iv.next56.1 = or i64 %indvars.iv55, 2, !dbg !73
  %arrayidx17.2 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv58, i64 %indvars.iv.next56.1, !dbg !77
  %9 = load i32, i32* %arrayidx17.2, align 8, !dbg !77, !tbaa !52
  %arrayidx19.2 = getelementptr inbounds [512 x i32], [512 x i32]* %y_t, i64 0, i64 %indvars.iv.next56.1, !dbg !79
  %10 = load i32, i32* %arrayidx19.2, align 8, !dbg !79, !tbaa !52
  %mul.2 = mul nsw i32 %10, %9, !dbg !80
  %add.2 = add nsw i32 %mul.2, %add.1, !dbg !81
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !22, metadata !38), !dbg !82
  %indvars.iv.next56.2 = or i64 %indvars.iv55, 3, !dbg !73
  %arrayidx17.3 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @X, i64 0, i64 %indvars.iv58, i64 %indvars.iv.next56.2, !dbg !77
  %11 = load i32, i32* %arrayidx17.3, align 4, !dbg !77, !tbaa !52
  %arrayidx19.3 = getelementptr inbounds [512 x i32], [512 x i32]* %y_t, i64 0, i64 %indvars.iv.next56.2, !dbg !79
  %12 = load i32, i32* %arrayidx19.3, align 4, !dbg !79, !tbaa !52
  %mul.3 = mul nsw i32 %12, %11, !dbg !80
  %add.3 = add nsw i32 %mul.3, %add.2, !dbg !81
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !22, metadata !38), !dbg !82
  %indvars.iv.next56.3 = add nsw i64 %indvars.iv55, 4, !dbg !73
  %exitcond57.3 = icmp eq i64 %indvars.iv.next56.3, 512, !dbg !73
  br i1 %exitcond57.3, label %for.end22, label %for.body13, !dbg !73

for.end22:                                        ; preds = %for.body13
  %add.3.lcssa = phi i32 [ %add.3, %for.body13 ]
  %arrayidx26 = getelementptr inbounds [512 x [512 x i32]], [512 x [512 x i32]]* @Z, i64 0, i64 %indvars.iv58, i64 %indvars.iv61, !dbg !83
  store i32 %add.3.lcssa, i32* %arrayidx26, align 4, !dbg !84, !tbaa !52
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1, !dbg !85
  %exitcond60 = icmp eq i64 %indvars.iv.next59, 512, !dbg !85
  br i1 %exitcond60, label %for.inc30, label %for.cond11.preheader, !dbg !85

for.inc30:                                        ; preds = %for.end22
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1, !dbg !63
  %exitcond63 = icmp eq i64 %indvars.iv.next62, 512, !dbg !63
  br i1 %exitcond63, label %for.end32, label %for.cond1.preheader, !dbg !63

for.end32:                                        ; preds = %for.inc30
  %13 = load i32, i32* getelementptr inbounds ([512 x [512 x i32]], [512 x [512 x i32]]* @Z, i64 0, i64 511, i64 511), align 4, !dbg !87, !tbaa !52
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 512, i32 512, i32 511, i32 511, i32 %13), !dbg !88
  call void @llvm.lifetime.end(i64 2048, i8* nonnull %0) #5, !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!35, !36}
!llvm.ident = !{!37}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3, globals: !29)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten3")
!2 = !{}
!3 = !{!4, !11}
!4 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 9, type: !5, isLocal: false, isDefinition: true, scopeLine: 9, isOptimized: true, variables: !7)
!5 = !DISubroutineType(types: !6)
!6 = !{null}
!7 = !{!8, !10}
!8 = !DILocalVariable(name: "i", scope: !4, file: !1, line: 10, type: !9)
!9 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!10 = !DILocalVariable(name: "j", scope: !4, file: !1, line: 10, type: !9)
!11 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 61, type: !12, isLocal: false, isDefinition: true, scopeLine: 61, isOptimized: true, variables: !14)
!12 = !DISubroutineType(types: !13)
!13 = !{!9}
!14 = !{!15, !16, !17, !18, !22}
!15 = !DILocalVariable(name: "i", scope: !11, file: !1, line: 62, type: !9)
!16 = !DILocalVariable(name: "j", scope: !11, file: !1, line: 62, type: !9)
!17 = !DILocalVariable(name: "k", scope: !11, file: !1, line: 62, type: !9)
!18 = !DILocalVariable(name: "y_t", scope: !11, file: !1, line: 64, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 16384, align: 32, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 512)
!22 = !DILocalVariable(name: "sum", scope: !23, file: !1, line: 75, type: !9)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 74, column: 27)
!24 = distinct !DILexicalBlock(scope: !25, file: !1, line: 74, column: 3)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 74, column: 3)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 68, column: 26)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 68, column: 2)
!28 = distinct !DILexicalBlock(scope: !11, file: !1, line: 68, column: 2)
!29 = !{!30, !33, !34}
!30 = !DIGlobalVariable(name: "X", scope: !0, file: !1, line: 4, type: !31, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @X)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 8388608, align: 32, elements: !32)
!32 = !{!21, !21}
!33 = !DIGlobalVariable(name: "Y", scope: !0, file: !1, line: 5, type: !31, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @Y)
!34 = !DIGlobalVariable(name: "Z", scope: !0, file: !1, line: 6, type: !31, isLocal: false, isDefinition: true, variable: [512 x [512 x i32]]* @Z)
!35 = !{i32 2, !"Dwarf Version", i32 4}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!38 = !DIExpression()
!39 = !DILocation(line: 10, column: 6, scope: !4)
!40 = !DILocation(line: 11, column: 2, scope: !41)
!41 = !DILexicalBlockFile(scope: !42, file: !1, discriminator: 1)
!42 = distinct !DILexicalBlock(scope: !43, file: !1, line: 11, column: 2)
!43 = distinct !DILexicalBlock(scope: !4, file: !1, line: 11, column: 2)
!44 = !DILocation(line: 12, column: 3, scope: !45)
!45 = !DILexicalBlockFile(scope: !46, file: !1, discriminator: 1)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 12, column: 3)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 12, column: 3)
!48 = distinct !DILexicalBlock(scope: !42, file: !1, line: 11, column: 22)
!49 = !DILocation(line: 13, column: 4, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !1, line: 12, column: 23)
!51 = !DILocation(line: 13, column: 12, scope: !50)
!52 = !{!53, !53, i64 0}
!53 = !{!"int", !54, i64 0}
!54 = !{!"omnipotent char", !55, i64 0}
!55 = !{!"Simple C/C++ TBAA"}
!56 = !DILocation(line: 14, column: 4, scope: !50)
!57 = !DILocation(line: 14, column: 12, scope: !50)
!58 = !DILocation(line: 17, column: 1, scope: !4)
!59 = !DILocation(line: 63, column: 2, scope: !11)
!60 = !DILocation(line: 64, column: 2, scope: !11)
!61 = !DILocation(line: 64, column: 6, scope: !11)
!62 = !DILocation(line: 62, column: 8, scope: !11)
!63 = !DILocation(line: 68, column: 2, scope: !64)
!64 = !DILexicalBlockFile(scope: !27, file: !1, discriminator: 1)
!65 = !DILocation(line: 70, column: 3, scope: !66)
!66 = !DILexicalBlockFile(scope: !67, file: !1, discriminator: 1)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 70, column: 3)
!68 = distinct !DILexicalBlock(scope: !26, file: !1, line: 70, column: 3)
!69 = !DILocation(line: 71, column: 13, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !1, line: 70, column: 27)
!71 = !DILocation(line: 71, column: 4, scope: !70)
!72 = !DILocation(line: 71, column: 11, scope: !70)
!73 = !DILocation(line: 76, column: 4, scope: !74)
!74 = !DILexicalBlockFile(scope: !75, file: !1, discriminator: 1)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 76, column: 4)
!76 = distinct !DILexicalBlock(scope: !23, file: !1, line: 76, column: 4)
!77 = !DILocation(line: 77, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !1, line: 76, column: 20)
!79 = !DILocation(line: 77, column: 25, scope: !78)
!80 = !DILocation(line: 77, column: 24, scope: !78)
!81 = !DILocation(line: 77, column: 15, scope: !78)
!82 = !DILocation(line: 75, column: 8, scope: !23)
!83 = !DILocation(line: 79, column: 4, scope: !23)
!84 = !DILocation(line: 79, column: 12, scope: !23)
!85 = !DILocation(line: 74, column: 3, scope: !86)
!86 = !DILexicalBlockFile(scope: !24, file: !1, discriminator: 1)
!87 = !DILocation(line: 82, column: 75, scope: !11)
!88 = !DILocation(line: 82, column: 2, scope: !11)
!89 = !DILocation(line: 86, column: 1, scope: !11)
!90 = !DILocation(line: 84, column: 5, scope: !11)
