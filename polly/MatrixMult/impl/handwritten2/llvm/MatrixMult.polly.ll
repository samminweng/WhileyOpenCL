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
  %call = tail call i64 @time(i64* null) #6, !dbg !42
  %conv = trunc i64 %call to i32, !dbg !43
  tail call void @srand(i32 %conv) #6, !dbg !44
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !46), !dbg !47
  br label %for.cond2.preheader, !dbg !48

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !52

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = tail call i32 @rand() #6, !dbg !57
  %rem = srem i32 %call6, 10, !dbg !59
  %arrayidx8 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !60
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !61, !tbaa !62
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !52
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 2000, !dbg !52
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !52

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !48
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 2000, !dbg !48
  br i1 %exitcond72, label %polly.loop_preheader74.preheader, label %for.cond2.preheader, !dbg !48

polly.loop_preheader74.preheader:                 ; preds = %for.inc9
  br label %polly.loop_preheader74

polly.exiting:                                    ; preds = %polly.loop_exit75
  ret void, !dbg !66

polly.loop_exit75:                                ; preds = %polly.loop_exit81
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond103 = icmp eq i64 %polly.indvar_next, 63
  br i1 %exitcond103, label %polly.exiting, label %polly.loop_preheader74

polly.loop_header73:                              ; preds = %polly.loop_exit81, %polly.loop_preheader74
  %polly.indvar76 = phi i64 [ 0, %polly.loop_preheader74 ], [ %polly.indvar_next77, %polly.loop_exit81 ]
  %0 = shl i64 %polly.indvar76, 5
  %1 = add nuw nsw i64 %0, -2000
  %2 = icmp sgt i64 %1, -32
  %smax102 = select i1 %2, i64 %1, i64 -32
  %3 = mul i64 %smax102, -4
  br label %polly.loop_header79

polly.loop_exit81:                                ; preds = %polly.loop_header79
  %polly.indvar_next77 = add nuw nsw i64 %polly.indvar76, 1
  %exitcond = icmp eq i64 %polly.indvar_next77, 63
  br i1 %exitcond, label %polly.loop_exit75, label %polly.loop_header73

polly.loop_preheader74:                           ; preds = %polly.loop_preheader74.preheader, %polly.loop_exit75
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit75 ], [ 0, %polly.loop_preheader74.preheader ]
  %4 = shl i64 %polly.indvar, 5
  %5 = mul nsw i64 %polly.indvar, -32
  %6 = add nsw i64 %5, 1999
  %7 = icmp sgt i64 %6, 31
  %8 = select i1 %7, i64 31, i64 %6
  %polly.adjust_ub = add i64 %8, -1
  br label %polly.loop_header73

polly.loop_header79:                              ; preds = %polly.loop_header79, %polly.loop_header73
  %polly.indvar82 = phi i64 [ 0, %polly.loop_header73 ], [ %polly.indvar_next83, %polly.loop_header79 ]
  %9 = add nuw nsw i64 %4, %polly.indvar82
  %scevgep98 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %9, i64 %0
  %scevgep9899 = bitcast i32* %scevgep98 to i8*
  %scevgep100 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %9, i64 %0
  %scevgep100101 = bitcast i32* %scevgep100 to i8*
  %scevgep94 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %9, i64 %0
  %scevgep9495 = bitcast i32* %scevgep94 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep9495, i8* %scevgep100101, i64 %3, i32 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep9899, i8* %scevgep100101, i64 %3, i32 16, i1 false)
  %polly.indvar_next83 = add nuw nsw i64 %polly.indvar82, 1
  %polly.loop_cond84 = icmp sgt i64 %polly.indvar82, %polly.adjust_ub
  br i1 %polly.loop_cond84, label %polly.loop_exit81, label %polly.loop_header79
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare void @srand(i32) #3

; Function Attrs: nounwind
declare i64 @time(i64*) #3

; Function Attrs: nounwind
declare i32 @rand() #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @mat_mult() #4 !dbg !13 {
entry:
  %b_t = alloca [2000 x i32], align 16
  %0 = bitcast [2000 x i32]* %b_t to i8*, !dbg !67
  call void @llvm.lifetime.start(i64 8000, i8* %0) #6, !dbg !67
  tail call void @llvm.dbg.declare(metadata [2000 x i32]* %b_t, metadata !18, metadata !46), !dbg !68
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !16, metadata !46), !dbg !69
  br label %for.cond1.preheader, !dbg !70

for.cond1.preheader:                              ; preds = %for.inc30, %entry
  %indvars.iv61 = phi i64 [ 0, %entry ], [ %indvars.iv.next62, %for.inc30 ]
  br label %for.body3, !dbg !72

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.4, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv61, !dbg !76
  %1 = load i32, i32* %arrayidx5, align 4, !dbg !76, !tbaa !62
  %arrayidx7 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %indvars.iv, !dbg !78
  store i32 %1, i32* %arrayidx7, align 4, !dbg !79, !tbaa !62
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !72
  %arrayidx5.1 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv.next, i64 %indvars.iv61, !dbg !76
  %2 = load i32, i32* %arrayidx5.1, align 4, !dbg !76, !tbaa !62
  %arrayidx7.1 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %indvars.iv.next, !dbg !78
  store i32 %2, i32* %arrayidx7.1, align 4, !dbg !79, !tbaa !62
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !72
  %arrayidx5.2 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv.next.1, i64 %indvars.iv61, !dbg !76
  %3 = load i32, i32* %arrayidx5.2, align 4, !dbg !76, !tbaa !62
  %arrayidx7.2 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %indvars.iv.next.1, !dbg !78
  store i32 %3, i32* %arrayidx7.2, align 4, !dbg !79, !tbaa !62
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3, !dbg !72
  %arrayidx5.3 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv.next.2, i64 %indvars.iv61, !dbg !76
  %4 = load i32, i32* %arrayidx5.3, align 4, !dbg !76, !tbaa !62
  %arrayidx7.3 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %indvars.iv.next.2, !dbg !78
  store i32 %4, i32* %arrayidx7.3, align 4, !dbg !79, !tbaa !62
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4, !dbg !72
  %arrayidx5.4 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %indvars.iv.next.3, i64 %indvars.iv61, !dbg !76
  %5 = load i32, i32* %arrayidx5.4, align 4, !dbg !76, !tbaa !62
  %arrayidx7.4 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %indvars.iv.next.3, !dbg !78
  store i32 %5, i32* %arrayidx7.4, align 4, !dbg !79, !tbaa !62
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5, !dbg !72
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000, !dbg !72
  br i1 %exitcond.4, label %for.cond11.preheader.preheader, label %for.body3, !dbg !72

for.cond11.preheader.preheader:                   ; preds = %for.body3
  br label %for.cond11.preheader, !dbg !80

for.cond11.preheader:                             ; preds = %for.cond11.preheader.preheader, %for.end22
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.end22 ], [ 0, %for.cond11.preheader.preheader ]
  br label %for.body13, !dbg !80

for.body13:                                       ; preds = %for.body13, %for.cond11.preheader
  %indvars.iv55 = phi i64 [ 0, %for.cond11.preheader ], [ %indvars.iv.next56.3, %for.body13 ]
  %sum.052 = phi i32 [ 0, %for.cond11.preheader ], [ %add.3, %for.body13 ]
  %arrayidx17 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %indvars.iv58, i64 %indvars.iv55, !dbg !84
  %6 = load i32, i32* %arrayidx17, align 16, !dbg !84, !tbaa !62
  %arrayidx19 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %indvars.iv55, !dbg !86
  %7 = load i32, i32* %arrayidx19, align 16, !dbg !86, !tbaa !62
  %mul = mul nsw i32 %7, %6, !dbg !87
  %add = add nsw i32 %mul, %sum.052, !dbg !88
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !22, metadata !46), !dbg !89
  %indvars.iv.next56 = or i64 %indvars.iv55, 1, !dbg !80
  %arrayidx17.1 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %indvars.iv58, i64 %indvars.iv.next56, !dbg !84
  %8 = load i32, i32* %arrayidx17.1, align 4, !dbg !84, !tbaa !62
  %arrayidx19.1 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %indvars.iv.next56, !dbg !86
  %9 = load i32, i32* %arrayidx19.1, align 4, !dbg !86, !tbaa !62
  %mul.1 = mul nsw i32 %9, %8, !dbg !87
  %add.1 = add nsw i32 %mul.1, %add, !dbg !88
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !22, metadata !46), !dbg !89
  %indvars.iv.next56.1 = or i64 %indvars.iv55, 2, !dbg !80
  %arrayidx17.2 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %indvars.iv58, i64 %indvars.iv.next56.1, !dbg !84
  %10 = load i32, i32* %arrayidx17.2, align 8, !dbg !84, !tbaa !62
  %arrayidx19.2 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %indvars.iv.next56.1, !dbg !86
  %11 = load i32, i32* %arrayidx19.2, align 8, !dbg !86, !tbaa !62
  %mul.2 = mul nsw i32 %11, %10, !dbg !87
  %add.2 = add nsw i32 %mul.2, %add.1, !dbg !88
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !22, metadata !46), !dbg !89
  %indvars.iv.next56.2 = or i64 %indvars.iv55, 3, !dbg !80
  %arrayidx17.3 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %indvars.iv58, i64 %indvars.iv.next56.2, !dbg !84
  %12 = load i32, i32* %arrayidx17.3, align 4, !dbg !84, !tbaa !62
  %arrayidx19.3 = getelementptr inbounds [2000 x i32], [2000 x i32]* %b_t, i64 0, i64 %indvars.iv.next56.2, !dbg !86
  %13 = load i32, i32* %arrayidx19.3, align 4, !dbg !86, !tbaa !62
  %mul.3 = mul nsw i32 %13, %12, !dbg !87
  %add.3 = add nsw i32 %mul.3, %add.2, !dbg !88
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !22, metadata !46), !dbg !89
  %indvars.iv.next56.3 = add nsw i64 %indvars.iv55, 4, !dbg !80
  %exitcond57.3 = icmp eq i64 %indvars.iv.next56.3, 2000, !dbg !80
  br i1 %exitcond57.3, label %for.end22, label %for.body13, !dbg !80

for.end22:                                        ; preds = %for.body13
  %add.3.lcssa = phi i32 [ %add.3, %for.body13 ]
  %arrayidx26 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %indvars.iv58, i64 %indvars.iv61, !dbg !90
  store i32 %add.3.lcssa, i32* %arrayidx26, align 4, !dbg !91, !tbaa !62
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1, !dbg !92
  %exitcond60 = icmp eq i64 %indvars.iv.next59, 2000, !dbg !92
  br i1 %exitcond60, label %for.inc30, label %for.cond11.preheader, !dbg !92

for.inc30:                                        ; preds = %for.end22
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1, !dbg !70
  %exitcond63 = icmp eq i64 %indvars.iv.next62, 2000, !dbg !70
  br i1 %exitcond63, label %for.end32, label %for.cond1.preheader, !dbg !70

for.end32:                                        ; preds = %for.inc30
  call void @llvm.lifetime.end(i64 8000, i8* nonnull %0) #6, !dbg !94
  ret void, !dbg !94
}

; Function Attrs: nounwind uwtable
define i32 @main() #5 !dbg !29 {
entry:
  tail call void @init(), !dbg !95
  tail call void @mat_mult(), !dbg !96
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 2000, i32 2000), !dbg !97
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !98, !tbaa !62
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !99, !tbaa !62
  %2 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 1999, i64 1999), align 4, !dbg !100, !tbaa !62
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i32 %2), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !32)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !13, !29}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !7, isLocal: false, isDefinition: true, scopeLine: 12, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 13, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 14, type: !11)
!13 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 35, type: !7, isLocal: false, isDefinition: true, scopeLine: 35, isOptimized: true, variables: !14)
!14 = !{!15, !16, !17, !18, !22}
!15 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 36, type: !11)
!16 = !DILocalVariable(name: "j", scope: !13, file: !1, line: 36, type: !11)
!17 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 36, type: !11)
!18 = !DILocalVariable(name: "b_t", scope: !13, file: !1, line: 37, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 64000, align: 32, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 2000)
!22 = !DILocalVariable(name: "sum", scope: !23, file: !1, line: 46, type: !11)
!23 = distinct !DILexicalBlock(scope: !24, file: !1, line: 45, column: 27)
!24 = distinct !DILexicalBlock(scope: !25, file: !1, line: 45, column: 3)
!25 = distinct !DILexicalBlock(scope: !26, file: !1, line: 45, column: 3)
!26 = distinct !DILexicalBlock(scope: !27, file: !1, line: 39, column: 26)
!27 = distinct !DILexicalBlock(scope: !28, file: !1, line: 39, column: 2)
!28 = distinct !DILexicalBlock(scope: !13, file: !1, line: 39, column: 2)
!29 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 98, type: !30, isLocal: false, isDefinition: true, scopeLine: 98, isOptimized: true, variables: !2)
!30 = !DISubroutineType(types: !31)
!31 = !{!11}
!32 = !{!33, !36, !37, !38}
!33 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 7, type: !34, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @A)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128000000, align: 32, elements: !35)
!35 = !{!21, !21}
!36 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 8, type: !34, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!37 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 9, type: !34, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @C)
!38 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 10, type: !34, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @R)
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!42 = !DILocation(line: 17, column: 22, scope: !6)
!43 = !DILocation(line: 17, column: 11, scope: !6)
!44 = !DILocation(line: 17, column: 5, scope: !45)
!45 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!46 = !DIExpression()
!47 = !DILocation(line: 13, column: 9, scope: !6)
!48 = !DILocation(line: 18, column: 5, scope: !49)
!49 = !DILexicalBlockFile(scope: !50, file: !1, discriminator: 1)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 18, column: 5)
!51 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 5)
!52 = !DILocation(line: 19, column: 9, scope: !53)
!53 = !DILexicalBlockFile(scope: !54, file: !1, discriminator: 1)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 19, column: 9)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 19, column: 9)
!56 = distinct !DILexicalBlock(scope: !50, file: !1, line: 18, column: 25)
!57 = !DILocation(line: 21, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !1, line: 19, column: 29)
!59 = !DILocation(line: 21, column: 29, scope: !58)
!60 = !DILocation(line: 21, column: 13, scope: !58)
!61 = !DILocation(line: 21, column: 21, scope: !58)
!62 = !{!63, !63, i64 0}
!63 = !{!"int", !64, i64 0}
!64 = !{!"omnipotent char", !65, i64 0}
!65 = !{!"Simple C/C++ TBAA"}
!66 = !DILocation(line: 33, column: 1, scope: !6)
!67 = !DILocation(line: 37, column: 2, scope: !13)
!68 = !DILocation(line: 37, column: 6, scope: !13)
!69 = !DILocation(line: 36, column: 8, scope: !13)
!70 = !DILocation(line: 39, column: 2, scope: !71)
!71 = !DILexicalBlockFile(scope: !27, file: !1, discriminator: 1)
!72 = !DILocation(line: 41, column: 3, scope: !73)
!73 = !DILexicalBlockFile(scope: !74, file: !1, discriminator: 1)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 41, column: 3)
!75 = distinct !DILexicalBlock(scope: !26, file: !1, line: 41, column: 3)
!76 = !DILocation(line: 42, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !1, line: 41, column: 27)
!78 = !DILocation(line: 42, column: 4, scope: !77)
!79 = !DILocation(line: 42, column: 11, scope: !77)
!80 = !DILocation(line: 47, column: 4, scope: !81)
!81 = !DILexicalBlockFile(scope: !82, file: !1, discriminator: 1)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 47, column: 4)
!83 = distinct !DILexicalBlock(scope: !23, file: !1, line: 47, column: 4)
!84 = !DILocation(line: 48, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !1, line: 47, column: 20)
!86 = !DILocation(line: 48, column: 25, scope: !85)
!87 = !DILocation(line: 48, column: 24, scope: !85)
!88 = !DILocation(line: 48, column: 15, scope: !85)
!89 = !DILocation(line: 46, column: 8, scope: !23)
!90 = !DILocation(line: 50, column: 4, scope: !23)
!91 = !DILocation(line: 50, column: 12, scope: !23)
!92 = !DILocation(line: 45, column: 3, scope: !93)
!93 = !DILexicalBlockFile(scope: !24, file: !1, discriminator: 1)
!94 = !DILocation(line: 53, column: 1, scope: !13)
!95 = !DILocation(line: 99, column: 2, scope: !29)
!96 = !DILocation(line: 100, column: 2, scope: !29)
!97 = !DILocation(line: 102, column: 2, scope: !29)
!98 = !DILocation(line: 104, column: 19, scope: !29)
!99 = !DILocation(line: 105, column: 19, scope: !29)
!100 = !DILocation(line: 106, column: 19, scope: !29)
!101 = !DILocation(line: 103, column: 5, scope: !29)
!102 = !DILocation(line: 108, column: 5, scope: !29)
