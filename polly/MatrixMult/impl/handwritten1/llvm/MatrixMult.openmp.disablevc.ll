; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = common global i32** null, align 8
@B = common global [2000 x [2000 x i32]] zeroinitializer, align 16
@C = common global [2000 x [2000 x i64]] zeroinitializer, align 16
@.str = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.1 = private unnamed_addr constant [49 x i8] c"A[%d][%d] = %d, B[%d][%d] =%d, C[%d][%d] =%lld \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @init() #0 !dbg !8 {
entry:
  %call = tail call noalias i8* @malloc(i64 16000) #4, !dbg !34
  store i8* %call, i8** bitcast (i32*** @A to i8**), align 8, !dbg !35, !tbaa !36
  %call1 = tail call noalias i8* @malloc(i64 16000000) #4, !dbg !40
  %0 = bitcast i8* %call to i8**, !dbg !41
  store i8* %call1, i8** %0, align 8, !dbg !42, !tbaa !36
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !12, metadata !43), !dbg !44
  br label %for.body, !dbg !45

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv92 = phi i64 [ 0, %entry ], [ %indvars.iv.next93.4, %for.body ]
  %1 = load i32**, i32*** @A, align 8, !dbg !49, !tbaa !36
  %2 = load i32*, i32** %1, align 8, !dbg !51, !tbaa !36
  %3 = mul nuw nsw i64 %indvars.iv92, 2000, !dbg !52
  %add.ptr = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !53
  %arrayidx2 = getelementptr inbounds i32*, i32** %1, i64 %indvars.iv92, !dbg !54
  store i32* %add.ptr, i32** %arrayidx2, align 8, !dbg !55, !tbaa !36
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1, !dbg !45
  %4 = load i32**, i32*** @A, align 8, !dbg !49, !tbaa !36
  %5 = load i32*, i32** %4, align 8, !dbg !51, !tbaa !36
  %6 = mul nuw nsw i64 %indvars.iv.next93, 2000, !dbg !52
  %add.ptr.1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !53
  %arrayidx2.1 = getelementptr inbounds i32*, i32** %4, i64 %indvars.iv.next93, !dbg !54
  store i32* %add.ptr.1, i32** %arrayidx2.1, align 8, !dbg !55, !tbaa !36
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2, !dbg !45
  %7 = load i32**, i32*** @A, align 8, !dbg !49, !tbaa !36
  %8 = load i32*, i32** %7, align 8, !dbg !51, !tbaa !36
  %9 = mul nuw nsw i64 %indvars.iv.next93.1, 2000, !dbg !52
  %add.ptr.2 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !53
  %arrayidx2.2 = getelementptr inbounds i32*, i32** %7, i64 %indvars.iv.next93.1, !dbg !54
  store i32* %add.ptr.2, i32** %arrayidx2.2, align 8, !dbg !55, !tbaa !36
  %indvars.iv.next93.2 = add nsw i64 %indvars.iv92, 3, !dbg !45
  %10 = load i32**, i32*** @A, align 8, !dbg !49, !tbaa !36
  %11 = load i32*, i32** %10, align 8, !dbg !51, !tbaa !36
  %12 = mul nuw nsw i64 %indvars.iv.next93.2, 2000, !dbg !52
  %add.ptr.3 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !53
  %arrayidx2.3 = getelementptr inbounds i32*, i32** %10, i64 %indvars.iv.next93.2, !dbg !54
  store i32* %add.ptr.3, i32** %arrayidx2.3, align 8, !dbg !55, !tbaa !36
  %indvars.iv.next93.3 = add nsw i64 %indvars.iv92, 4, !dbg !45
  %13 = load i32**, i32*** @A, align 8, !dbg !49, !tbaa !36
  %14 = load i32*, i32** %13, align 8, !dbg !51, !tbaa !36
  %15 = mul nuw nsw i64 %indvars.iv.next93.3, 2000, !dbg !52
  %add.ptr.4 = getelementptr inbounds i32, i32* %14, i64 %15, !dbg !53
  %arrayidx2.4 = getelementptr inbounds i32*, i32** %13, i64 %indvars.iv.next93.3, !dbg !54
  store i32* %add.ptr.4, i32** %arrayidx2.4, align 8, !dbg !55, !tbaa !36
  %indvars.iv.next93.4 = add nsw i64 %indvars.iv92, 5, !dbg !45
  %exitcond95.4 = icmp eq i64 %indvars.iv.next93.4, 2000, !dbg !45
  br i1 %exitcond95.4, label %for.cond6.preheader.preheader, label %for.body, !dbg !45

for.cond6.preheader.preheader:                    ; preds = %for.body
  %16 = load i32**, i32*** @A, align 8, !dbg !56, !tbaa !36
  br label %for.cond6.preheader, !dbg !63

for.cond6.preheader:                              ; preds = %for.cond6.preheader.preheader, %for.inc20
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %for.inc20 ], [ 0, %for.cond6.preheader.preheader ]
  %arrayidx11 = getelementptr inbounds i32*, i32** %16, i64 %indvars.iv89, !dbg !70
  %17 = load i32*, i32** %arrayidx11, align 8, !dbg !70, !tbaa !36
  br label %for.body8, !dbg !63

for.body8:                                        ; preds = %for.body8, %for.cond6.preheader
  %indvars.iv86 = phi i64 [ 0, %for.cond6.preheader ], [ %indvars.iv.next87.4, %for.body8 ]
  %arrayidx12 = getelementptr inbounds i32, i32* %17, i64 %indvars.iv86, !dbg !70
  store i32 0, i32* %arrayidx12, align 4, !dbg !72, !tbaa !73
  %arrayidx16 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %indvars.iv86, !dbg !75
  store i32 0, i32* %arrayidx16, align 4, !dbg !76, !tbaa !73
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1, !dbg !63
  %arrayidx12.1 = getelementptr inbounds i32, i32* %17, i64 %indvars.iv.next87, !dbg !70
  store i32 0, i32* %arrayidx12.1, align 4, !dbg !72, !tbaa !73
  %arrayidx16.1 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next87, !dbg !75
  store i32 0, i32* %arrayidx16.1, align 4, !dbg !76, !tbaa !73
  %indvars.iv.next87.1 = add nsw i64 %indvars.iv86, 2, !dbg !63
  %arrayidx12.2 = getelementptr inbounds i32, i32* %17, i64 %indvars.iv.next87.1, !dbg !70
  store i32 0, i32* %arrayidx12.2, align 4, !dbg !72, !tbaa !73
  %arrayidx16.2 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next87.1, !dbg !75
  store i32 0, i32* %arrayidx16.2, align 4, !dbg !76, !tbaa !73
  %indvars.iv.next87.2 = add nsw i64 %indvars.iv86, 3, !dbg !63
  %arrayidx12.3 = getelementptr inbounds i32, i32* %17, i64 %indvars.iv.next87.2, !dbg !70
  store i32 0, i32* %arrayidx12.3, align 4, !dbg !72, !tbaa !73
  %arrayidx16.3 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next87.2, !dbg !75
  store i32 0, i32* %arrayidx16.3, align 4, !dbg !76, !tbaa !73
  %indvars.iv.next87.3 = add nsw i64 %indvars.iv86, 4, !dbg !63
  %arrayidx12.4 = getelementptr inbounds i32, i32* %17, i64 %indvars.iv.next87.3, !dbg !70
  store i32 0, i32* %arrayidx12.4, align 4, !dbg !72, !tbaa !73
  %arrayidx16.4 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next87.3, !dbg !75
  store i32 0, i32* %arrayidx16.4, align 4, !dbg !76, !tbaa !73
  %indvars.iv.next87.4 = add nsw i64 %indvars.iv86, 5, !dbg !63
  %exitcond88.4 = icmp eq i64 %indvars.iv.next87.4, 2000, !dbg !63
  br i1 %exitcond88.4, label %for.inc20, label %for.body8, !dbg !63

for.inc20:                                        ; preds = %for.body8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1, !dbg !77
  %exitcond91 = icmp eq i64 %indvars.iv.next90, 2000, !dbg !77
  br i1 %exitcond91, label %for.cond26.preheader.preheader, label %for.cond6.preheader, !dbg !77

for.cond26.preheader.preheader:                   ; preds = %for.inc20
  br label %for.cond26.preheader, !dbg !56

for.cond26.preheader:                             ; preds = %for.cond26.preheader.preheader, %for.inc49
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %for.inc49 ], [ 0, %for.cond26.preheader.preheader ]
  %arrayidx31 = getelementptr inbounds i32*, i32** %16, i64 %indvars.iv83, !dbg !56
  %18 = load i32*, i32** %arrayidx31, align 8, !dbg !56, !tbaa !36
  %19 = trunc i64 %indvars.iv83 to i32, !dbg !79
  br label %for.body28, !dbg !80

for.body28:                                       ; preds = %for.body28, %for.cond26.preheader
  %indvars.iv = phi i64 [ 0, %for.cond26.preheader ], [ %indvars.iv.next.1, %for.body28 ]
  %arrayidx32 = getelementptr inbounds i32, i32* %18, i64 %indvars.iv, !dbg !56
  %20 = load i32, i32* %arrayidx32, align 4, !dbg !56, !tbaa !73
  %add = add nsw i32 %20, %19, !dbg !79
  store i32 %add, i32* %arrayidx32, align 4, !dbg !82, !tbaa !73
  %arrayidx40 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv83, i64 %indvars.iv, !dbg !83
  %21 = load i32, i32* %arrayidx40, align 8, !dbg !83, !tbaa !73
  %add41 = add nsw i32 %21, %19, !dbg !84
  store i32 %add41, i32* %arrayidx40, align 8, !dbg !85, !tbaa !73
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !80
  %arrayidx32.1 = getelementptr inbounds i32, i32* %18, i64 %indvars.iv.next, !dbg !56
  %22 = load i32, i32* %arrayidx32.1, align 4, !dbg !56, !tbaa !73
  %add.1 = add nsw i32 %22, %19, !dbg !79
  store i32 %add.1, i32* %arrayidx32.1, align 4, !dbg !82, !tbaa !73
  %arrayidx40.1 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next, !dbg !83
  %23 = load i32, i32* %arrayidx40.1, align 4, !dbg !83, !tbaa !73
  %add41.1 = add nsw i32 %23, %19, !dbg !84
  store i32 %add41.1, i32* %arrayidx40.1, align 4, !dbg !85, !tbaa !73
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !80
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000, !dbg !80
  br i1 %exitcond.1, label %for.inc49, label %for.body28, !dbg !80

for.inc49:                                        ; preds = %for.body28
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1, !dbg !86
  %exitcond85 = icmp eq i64 %indvars.iv.next84, 2000, !dbg !86
  br i1 %exitcond85, label %for.end51, label %for.cond26.preheader, !dbg !86

for.end51:                                        ; preds = %for.inc49
  ret void, !dbg !88
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind uwtable
define void @mat_mult() #0 !dbg !14 {
entry:
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !16, metadata !43), !dbg !89
  %0 = load i32**, i32*** @A, align 8, !dbg !90, !tbaa !36
  br label %for.cond1.preheader, !dbg !99

for.cond1.preheader:                              ; preds = %for.inc28, %entry
  %indvars.iv52 = phi i64 [ 0, %entry ], [ %indvars.iv.next53, %for.inc28 ]
  %arrayidx15 = getelementptr inbounds i32*, i32** %0, i64 %indvars.iv52, !dbg !90
  %1 = load i32*, i32** %arrayidx15, align 8, !dbg !90, !tbaa !36
  br label %for.body3, !dbg !101

for.body3:                                        ; preds = %for.inc25, %for.cond1.preheader
  %indvars.iv49 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next50, %for.inc25 ]
  %arrayidx5 = getelementptr inbounds [2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 %indvars.iv52, i64 %indvars.iv49, !dbg !103
  store i64 0, i64* %arrayidx5, align 8, !dbg !104, !tbaa !105
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !18, metadata !43), !dbg !107
  br label %for.body8, !dbg !108

for.body8:                                        ; preds = %for.body8, %for.body3
  %2 = phi i64 [ 0, %for.body3 ], [ %add.1, %for.body8 ], !dbg !110
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next.1, %for.body8 ]
  %arrayidx16 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv, !dbg !90
  %3 = load i32, i32* %arrayidx16, align 4, !dbg !90, !tbaa !73
  %arrayidx20 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv49, !dbg !111
  %4 = load i32, i32* %arrayidx20, align 4, !dbg !111, !tbaa !73
  %mul = mul nsw i32 %4, %3, !dbg !112
  %conv = sext i32 %mul to i64, !dbg !90
  %add = add nsw i64 %conv, %2, !dbg !113
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !108
  %arrayidx16.1 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv.next, !dbg !90
  %5 = load i32, i32* %arrayidx16.1, align 4, !dbg !90, !tbaa !73
  %arrayidx20.1 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv.next, i64 %indvars.iv49, !dbg !111
  %6 = load i32, i32* %arrayidx20.1, align 4, !dbg !111, !tbaa !73
  %mul.1 = mul nsw i32 %6, %5, !dbg !112
  %conv.1 = sext i32 %mul.1 to i64, !dbg !90
  %add.1 = add nsw i64 %conv.1, %add, !dbg !113
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !108
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000, !dbg !108
  br i1 %exitcond.1, label %for.inc25, label %for.body8, !dbg !108

for.inc25:                                        ; preds = %for.body8
  %add.1.lcssa = phi i64 [ %add.1, %for.body8 ]
  store i64 %add.1.lcssa, i64* %arrayidx5, align 8, !dbg !110, !tbaa !105
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1, !dbg !101
  %exitcond51 = icmp eq i64 %indvars.iv.next50, 2000, !dbg !101
  br i1 %exitcond51, label %for.inc28, label %for.body3, !dbg !101

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1, !dbg !99
  %exitcond54 = icmp eq i64 %indvars.iv.next53, 2000, !dbg !99
  br i1 %exitcond54, label %for.end30, label %for.cond1.preheader, !dbg !99

for.end30:                                        ; preds = %for.inc28
  ret void, !dbg !114
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 !dbg !19 {
entry:
  tail call void @init(), !dbg !115
  tail call void @mat_mult(), !dbg !116
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 2000, i32 2000), !dbg !117
  %0 = load i32**, i32*** @A, align 8, !dbg !118, !tbaa !36
  %arrayidx = getelementptr inbounds i32*, i32** %0, i64 1999, !dbg !118
  %1 = load i32*, i32** %arrayidx, align 8, !dbg !118, !tbaa !36
  %arrayidx1 = getelementptr inbounds i32, i32* %1, i64 1999, !dbg !118
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !118, !tbaa !73
  %3 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !119, !tbaa !73
  %4 = load i64, i64* getelementptr inbounds ([2000 x [2000 x i64]], [2000 x [2000 x i64]]* @C, i64 0, i64 1999, i64 1999), align 8, !dbg !120, !tbaa !105
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.1, i64 0, i64 0), i32 1999, i32 1999, i32 %2, i32 1999, i32 1999, i32 %3, i32 1999, i32 1999, i64 %4), !dbg !121
  ret i32 0, !dbg !122
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!31, !32}
!llvm.ident = !{!33}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !7, globals: !22)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten1")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64, align: 64)
!6 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!7 = !{!8, !14, !19}
!8 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 13, type: !9, isLocal: false, isDefinition: true, scopeLine: 13, isOptimized: true, variables: !11)
!9 = !DISubroutineType(types: !10)
!10 = !{null}
!11 = !{!12, !13}
!12 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 15, type: !6)
!13 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 15, type: !6)
!14 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 38, type: !9, isLocal: false, isDefinition: true, scopeLine: 38, isOptimized: true, variables: !15)
!15 = !{!16, !17, !18}
!16 = !DILocalVariable(name: "i", scope: !14, file: !1, line: 39, type: !6)
!17 = !DILocalVariable(name: "j", scope: !14, file: !1, line: 39, type: !6)
!18 = !DILocalVariable(name: "k", scope: !14, file: !1, line: 39, type: !6)
!19 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 62, type: !20, isLocal: false, isDefinition: true, scopeLine: 63, isOptimized: true, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!6}
!22 = !{!23, !24, !28}
!23 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 8, type: !4, isLocal: false, isDefinition: true, variable: i32*** @A)
!24 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 9, type: !25, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128000000, align: 32, elements: !26)
!26 = !{!27, !27}
!27 = !DISubrange(count: 2000)
!28 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 10, type: !29, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i64]]* @C)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 256000000, align: 64, elements: !26)
!30 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!31 = !{i32 2, !"Dwarf Version", i32 4}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!34 = !DILocation(line: 16, column: 16, scope: !8)
!35 = !DILocation(line: 16, column: 7, scope: !8)
!36 = !{!37, !37, i64 0}
!37 = !{!"any pointer", !38, i64 0}
!38 = !{!"omnipotent char", !39, i64 0}
!39 = !{!"Simple C/C++ TBAA"}
!40 = !DILocation(line: 17, column: 18, scope: !8)
!41 = !DILocation(line: 17, column: 5, scope: !8)
!42 = !DILocation(line: 17, column: 10, scope: !8)
!43 = !DIExpression()
!44 = !DILocation(line: 15, column: 9, scope: !8)
!45 = !DILocation(line: 19, column: 5, scope: !46)
!46 = !DILexicalBlockFile(scope: !47, file: !1, discriminator: 1)
!47 = distinct !DILexicalBlock(scope: !48, file: !1, line: 19, column: 5)
!48 = distinct !DILexicalBlock(scope: !8, file: !1, line: 19, column: 5)
!49 = !DILocation(line: 20, column: 18, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !1, line: 19, column: 21)
!51 = !DILocation(line: 20, column: 17, scope: !50)
!52 = !DILocation(line: 20, column: 23, scope: !50)
!53 = !DILocation(line: 20, column: 20, scope: !50)
!54 = !DILocation(line: 20, column: 9, scope: !50)
!55 = !DILocation(line: 20, column: 14, scope: !50)
!56 = !DILocation(line: 32, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 31, column: 29)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 31, column: 9)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 31, column: 9)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 30, column: 25)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 30, column: 5)
!62 = distinct !DILexicalBlock(scope: !8, file: !1, line: 30, column: 5)
!63 = !DILocation(line: 24, column: 9, scope: !64)
!64 = !DILexicalBlockFile(scope: !65, file: !1, discriminator: 1)
!65 = distinct !DILexicalBlock(scope: !66, file: !1, line: 24, column: 9)
!66 = distinct !DILexicalBlock(scope: !67, file: !1, line: 24, column: 9)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 23, column: 25)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 23, column: 5)
!69 = distinct !DILexicalBlock(scope: !8, file: !1, line: 23, column: 5)
!70 = !DILocation(line: 25, column: 13, scope: !71)
!71 = distinct !DILexicalBlock(scope: !65, file: !1, line: 24, column: 29)
!72 = !DILocation(line: 25, column: 21, scope: !71)
!73 = !{!74, !74, i64 0}
!74 = !{!"int", !38, i64 0}
!75 = !DILocation(line: 26, column: 13, scope: !71)
!76 = !DILocation(line: 26, column: 21, scope: !71)
!77 = !DILocation(line: 23, column: 5, scope: !78)
!78 = !DILexicalBlockFile(scope: !68, file: !1, discriminator: 1)
!79 = !DILocation(line: 32, column: 31, scope: !57)
!80 = !DILocation(line: 31, column: 9, scope: !81)
!81 = !DILexicalBlockFile(scope: !58, file: !1, discriminator: 1)
!82 = !DILocation(line: 32, column: 21, scope: !57)
!83 = !DILocation(line: 33, column: 23, scope: !57)
!84 = !DILocation(line: 33, column: 31, scope: !57)
!85 = !DILocation(line: 33, column: 21, scope: !57)
!86 = !DILocation(line: 30, column: 5, scope: !87)
!87 = !DILexicalBlockFile(scope: !61, file: !1, discriminator: 1)
!88 = !DILocation(line: 36, column: 1, scope: !8)
!89 = !DILocation(line: 39, column: 9, scope: !14)
!90 = !DILocation(line: 44, column: 37, scope: !91)
!91 = distinct !DILexicalBlock(scope: !92, file: !1, line: 43, column: 13)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 43, column: 13)
!93 = distinct !DILexicalBlock(scope: !94, file: !1, line: 41, column: 29)
!94 = distinct !DILexicalBlock(scope: !95, file: !1, line: 41, column: 9)
!95 = distinct !DILexicalBlock(scope: !96, file: !1, line: 41, column: 9)
!96 = distinct !DILexicalBlock(scope: !97, file: !1, line: 40, column: 25)
!97 = distinct !DILexicalBlock(scope: !98, file: !1, line: 40, column: 5)
!98 = distinct !DILexicalBlock(scope: !14, file: !1, line: 40, column: 5)
!99 = !DILocation(line: 40, column: 5, scope: !100)
!100 = !DILexicalBlockFile(scope: !97, file: !1, discriminator: 1)
!101 = !DILocation(line: 41, column: 9, scope: !102)
!102 = !DILexicalBlockFile(scope: !94, file: !1, discriminator: 1)
!103 = !DILocation(line: 42, column: 13, scope: !93)
!104 = !DILocation(line: 42, column: 21, scope: !93)
!105 = !{!106, !106, i64 0}
!106 = !{!"long long", !38, i64 0}
!107 = !DILocation(line: 39, column: 15, scope: !14)
!108 = !DILocation(line: 43, column: 13, scope: !109)
!109 = !DILexicalBlockFile(scope: !91, file: !1, discriminator: 1)
!110 = !DILocation(line: 44, column: 27, scope: !91)
!111 = !DILocation(line: 44, column: 47, scope: !91)
!112 = !DILocation(line: 44, column: 45, scope: !91)
!113 = !DILocation(line: 44, column: 35, scope: !91)
!114 = !DILocation(line: 47, column: 1, scope: !14)
!115 = !DILocation(line: 64, column: 5, scope: !19)
!116 = !DILocation(line: 65, column: 5, scope: !19)
!117 = !DILocation(line: 68, column: 5, scope: !19)
!118 = !DILocation(line: 70, column: 19, scope: !19)
!119 = !DILocation(line: 71, column: 19, scope: !19)
!120 = !DILocation(line: 72, column: 19, scope: !19)
!121 = !DILocation(line: 69, column: 5, scope: !19)
!122 = !DILocation(line: 73, column: 5, scope: !19)
