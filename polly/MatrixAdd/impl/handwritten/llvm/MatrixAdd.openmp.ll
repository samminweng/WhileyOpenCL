; ModuleID = 'MatrixAdd.c'
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
  %polly.par.userContext = alloca {}, align 8
  %call = tail call i64 @time(i64* null) #6, !dbg !36
  %conv = trunc i64 %call to i32, !dbg !37
  tail call void @srand(i32 %conv) #6, !dbg !38
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !10, metadata !40), !dbg !41
  br label %for.cond2.preheader, !dbg !42

for.cond2.preheader:                              ; preds = %for.inc9, %entry
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc9 ]
  br label %for.body5, !dbg !46

for.body5:                                        ; preds = %for.body5, %for.cond2.preheader
  %indvars.iv67 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next68, %for.body5 ]
  %call6 = tail call i32 @rand() #6, !dbg !51
  %rem = srem i32 %call6, 100, !dbg !53
  %arrayidx8 = getelementptr inbounds [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %indvars.iv70, i64 %indvars.iv67, !dbg !54
  store i32 %rem, i32* %arrayidx8, align 4, !dbg !55, !tbaa !56
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !46
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 2000, !dbg !46
  br i1 %exitcond69, label %for.inc9, label %for.body5, !dbg !46

for.inc9:                                         ; preds = %for.body5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1, !dbg !42
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 2000, !dbg !42
  br i1 %exitcond72, label %polly.parallel.for, label %for.cond2.preheader, !dbg !42

polly.parallel.for:                               ; preds = %for.inc9
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 63, i64 1) #6
  call void @init_polly_subfn(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !60
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @srand(i32) #2

; Function Attrs: nounwind
declare i64 @time(i64*) #2

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define void @mat_add() #0 !dbg !13 {
entry:
  %polly.par.userContext = alloca {}, align 8
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !15, metadata !40), !dbg !61
  %0 = bitcast {}* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 0, i8* %0)
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_add_polly_subfn, i8* %0, i32 0, i64 0, i64 63, i64 1) #6
  call void @mat_add_polly_subfn(i8* %0) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %0)
  ret void, !dbg !62
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 !dbg !18 {
entry:
  tail call void @init(), !dbg !63
  tail call void @mat_add(), !dbg !64
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 2000, i32 2000), !dbg !65
  %0 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 1999, i64 1999), align 4, !dbg !66, !tbaa !56
  %1 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 1999, i64 1999), align 4, !dbg !67, !tbaa !56
  %2 = load i32, i32* getelementptr inbounds ([2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 1999, i64 1999), align 4, !dbg !68, !tbaa !56
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i64 0, i64 0), i32 1999, i32 1999, i32 %0, i32 1999, i32 1999, i32 %1, i32 1999, i32 1999, i32 %2), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

define internal void @init_polly_subfn(i8* nocapture readnone %polly.par.userContext) #5 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %2 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_preheader3

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit10.loopexit.us
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_preheader3
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  %indvar.next = add i64 %indvar, 1
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %indvar = phi i64 [ 0, %polly.par.loadIVBounds ], [ %indvar.next, %polly.loop_exit4 ]
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = add i64 %polly.par.LB, %indvar
  %5 = shl i64 %4, 5
  %6 = mul nsw i64 %polly.indvar, -32
  %7 = add nsw i64 %6, 1999
  %8 = icmp sgt i64 %7, 31
  %9 = select i1 %8, i64 31, i64 %7
  %polly.loop_guard = icmp sgt i64 %9, -1
  %polly.adjust_ub13 = add i64 %9, -1
  br i1 %polly.loop_guard, label %polly.loop_header8.preheader.us.preheader, label %polly.loop_exit4

polly.loop_header8.preheader.us.preheader:        ; preds = %polly.loop_preheader3
  br label %polly.loop_header8.preheader.us

polly.loop_header8.us:                            ; preds = %polly.loop_header8.preheader.us, %polly.loop_header8.us
  %polly.indvar11.us = phi i64 [ %polly.indvar_next12.us, %polly.loop_header8.us ], [ 0, %polly.loop_header8.preheader.us ]
  %10 = add i64 %5, %polly.indvar11.us
  %scevgep28 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %10, i64 %11
  %scevgep2829 = bitcast i32* %scevgep28 to i8*
  %scevgep30 = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @R, i64 0, i64 %10, i64 %11
  %scevgep3031 = bitcast i32* %scevgep30 to i8*
  %scevgep = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %10, i64 %11
  %scevgep25 = bitcast i32* %scevgep to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep25, i8* %scevgep3031, i64 %14, i32 16, i1 false)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep2829, i8* %scevgep3031, i64 %14, i32 16, i1 false)
  %polly.indvar_next12.us = add nuw nsw i64 %polly.indvar11.us, 1
  %polly.loop_cond14.us = icmp sgt i64 %polly.indvar11.us, %polly.adjust_ub13
  br i1 %polly.loop_cond14.us, label %polly.loop_exit10.loopexit.us, label %polly.loop_header8.us

polly.loop_header8.preheader.us:                  ; preds = %polly.loop_header8.preheader.us.preheader, %polly.loop_exit10.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit10.loopexit.us ], [ 0, %polly.loop_header8.preheader.us.preheader ]
  %11 = shl i64 %polly.indvar5.us, 5
  %12 = add nuw nsw i64 %11, -2000
  %13 = icmp sgt i64 %12, -32
  %smax32 = select i1 %13, i64 %12, i64 -32
  %14 = mul i64 %smax32, -4
  br label %polly.loop_header8.us

polly.loop_exit10.loopexit.us:                    ; preds = %polly.loop_header8.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar_next6.us, 63
  br i1 %exitcond.us, label %polly.loop_exit4.loopexit, label %polly.loop_header8.preheader.us
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @mat_add_polly_subfn(i8* nocapture readnone %polly.par.userContext) #5 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %1 = icmp eq i8 %0, 0
  br i1 %1, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %2 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_preheader3

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit10.loopexit.us
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_preheader3
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %4 = mul nsw i64 %polly.indvar, -32
  %5 = add nsw i64 %4, 1999
  %6 = icmp sgt i64 %5, 31
  %7 = select i1 %6, i64 31, i64 %5
  %polly.loop_guard = icmp sgt i64 %7, -1
  %8 = shl nsw i64 %polly.indvar, 5
  %polly.adjust_ub13 = add i64 %7, -1
  br i1 %polly.loop_guard, label %polly.loop_header8.preheader.us.preheader, label %polly.loop_exit4

polly.loop_header8.preheader.us.preheader:        ; preds = %polly.loop_preheader3
  br label %polly.loop_header8.preheader.us

polly.loop_header8.us:                            ; preds = %polly.loop_header8.preheader.us, %polly.loop_exit17.us
  %polly.indvar11.us = phi i64 [ %polly.indvar_next12.us, %polly.loop_exit17.us ], [ 0, %polly.loop_header8.preheader.us ]
  %9 = add nsw i64 %polly.indvar11.us, %8
  br label %polly.loop_header15.us

polly.loop_header15.us:                           ; preds = %polly.loop_header15.us, %polly.loop_header8.us
  %polly.indvar18.us = phi i64 [ 0, %polly.loop_header8.us ], [ %polly.indvar_next19.us, %polly.loop_header15.us ]
  %10 = add nuw nsw i64 %polly.indvar18.us, %15
  %scevgep.us = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @A, i64 0, i64 %9, i64 %10
  %_p_scalar_.us = load i32, i32* %scevgep.us, align 4, !alias.scope !71, !noalias !73, !llvm.mem.parallel_loop_access !76
  %scevgep22.us = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @B, i64 0, i64 %9, i64 %10
  %_p_scalar_23.us = load i32, i32* %scevgep22.us, align 4, !alias.scope !74, !noalias !77, !llvm.mem.parallel_loop_access !76
  %p_add.us = add nsw i32 %_p_scalar_23.us, %_p_scalar_.us, !dbg !78
  %scevgep24.us = getelementptr [2000 x [2000 x i32]], [2000 x [2000 x i32]]* @C, i64 0, i64 %9, i64 %10
  store i32 %p_add.us, i32* %scevgep24.us, align 4, !alias.scope !75, !noalias !85, !llvm.mem.parallel_loop_access !76
  %polly.indvar_next19.us = add nuw nsw i64 %polly.indvar18.us, 1
  %polly.loop_cond21.us = icmp sgt i64 %polly.indvar18.us, %polly.adjust_ub20.us
  br i1 %polly.loop_cond21.us, label %polly.loop_exit17.us, label %polly.loop_header15.us, !llvm.loop !76

polly.loop_exit17.us:                             ; preds = %polly.loop_header15.us
  %polly.indvar_next12.us = add nuw nsw i64 %polly.indvar11.us, 1
  %polly.loop_cond14.us = icmp sgt i64 %polly.indvar11.us, %polly.adjust_ub13
  br i1 %polly.loop_cond14.us, label %polly.loop_exit10.loopexit.us, label %polly.loop_header8.us

polly.loop_header8.preheader.us:                  ; preds = %polly.loop_header8.preheader.us.preheader, %polly.loop_exit10.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit10.loopexit.us ], [ 0, %polly.loop_header8.preheader.us.preheader ]
  %11 = mul nsw i64 %polly.indvar5.us, -32
  %12 = add nsw i64 %11, 1999
  %13 = icmp sgt i64 %12, 31
  %14 = select i1 %13, i64 31, i64 %12
  %15 = shl nsw i64 %polly.indvar5.us, 5
  %polly.adjust_ub20.us = add i64 %14, -1
  br label %polly.loop_header8.us

polly.loop_exit10.loopexit.us:                    ; preds = %polly.loop_exit17.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar_next6.us, 63
  br i1 %exitcond.us, label %polly.loop_exit4.loopexit, label %polly.loop_header8.preheader.us
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { "polly.skip.fn" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!33, !34}
!llvm.ident = !{!35}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !25)
!1 = !DIFile(filename: "MatrixAdd.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixAdd/impl/handwritten")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!5 = !{!6, !13, !18}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 11, type: !7, isLocal: false, isDefinition: true, scopeLine: 11, isOptimized: true, variables: !9)
!7 = !DISubroutineType(types: !8)
!8 = !{null}
!9 = !{!10, !12}
!10 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 12, type: !11)
!11 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!12 = !DILocalVariable(name: "j", scope: !6, file: !1, line: 13, type: !11)
!13 = distinct !DISubprogram(name: "mat_add", scope: !1, file: !1, line: 32, type: !7, isLocal: false, isDefinition: true, scopeLine: 32, isOptimized: true, variables: !14)
!14 = !{!15, !16, !17}
!15 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 34, type: !11)
!16 = !DILocalVariable(name: "j", scope: !13, file: !1, line: 34, type: !11)
!17 = !DILocalVariable(name: "k", scope: !13, file: !1, line: 34, type: !11)
!18 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 55, type: !19, isLocal: false, isDefinition: true, scopeLine: 56, isOptimized: true, variables: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{!11}
!21 = !{!22, !23, !24}
!22 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 57, type: !11)
!23 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 57, type: !11)
!24 = !DILocalVariable(name: "k", scope: !18, file: !1, line: 57, type: !11)
!25 = !{!26, !30, !31, !32}
!26 = !DIGlobalVariable(name: "A", scope: !0, file: !1, line: 3, type: !27, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @A)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128000000, align: 32, elements: !28)
!28 = !{!29, !29}
!29 = !DISubrange(count: 2000)
!30 = !DIGlobalVariable(name: "B", scope: !0, file: !1, line: 4, type: !27, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @B)
!31 = !DIGlobalVariable(name: "C", scope: !0, file: !1, line: 5, type: !27, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @C)
!32 = !DIGlobalVariable(name: "R", scope: !0, file: !1, line: 6, type: !27, isLocal: false, isDefinition: true, variable: [2000 x [2000 x i32]]* @R)
!33 = !{i32 2, !"Dwarf Version", i32 4}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!36 = !DILocation(line: 16, column: 22, scope: !6)
!37 = !DILocation(line: 16, column: 11, scope: !6)
!38 = !DILocation(line: 16, column: 5, scope: !39)
!39 = !DILexicalBlockFile(scope: !6, file: !1, discriminator: 1)
!40 = !DIExpression()
!41 = !DILocation(line: 12, column: 9, scope: !6)
!42 = !DILocation(line: 17, column: 5, scope: !43)
!43 = !DILexicalBlockFile(scope: !44, file: !1, discriminator: 1)
!44 = distinct !DILexicalBlock(scope: !45, file: !1, line: 17, column: 5)
!45 = distinct !DILexicalBlock(scope: !6, file: !1, line: 17, column: 5)
!46 = !DILocation(line: 18, column: 9, scope: !47)
!47 = !DILexicalBlockFile(scope: !48, file: !1, discriminator: 1)
!48 = distinct !DILexicalBlock(scope: !49, file: !1, line: 18, column: 9)
!49 = distinct !DILexicalBlock(scope: !50, file: !1, line: 18, column: 9)
!50 = distinct !DILexicalBlock(scope: !44, file: !1, line: 17, column: 25)
!51 = !DILocation(line: 20, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 18, column: 29)
!53 = !DILocation(line: 20, column: 29, scope: !52)
!54 = !DILocation(line: 20, column: 13, scope: !52)
!55 = !DILocation(line: 20, column: 21, scope: !52)
!56 = !{!57, !57, i64 0}
!57 = !{!"int", !58, i64 0}
!58 = !{!"omnipotent char", !59, i64 0}
!59 = !{!"Simple C/C++ TBAA"}
!60 = !DILocation(line: 30, column: 1, scope: !6)
!61 = !DILocation(line: 34, column: 9, scope: !13)
!62 = !DILocation(line: 40, column: 1, scope: !13)
!63 = !DILocation(line: 59, column: 5, scope: !18)
!64 = !DILocation(line: 60, column: 5, scope: !18)
!65 = !DILocation(line: 62, column: 5, scope: !18)
!66 = !DILocation(line: 64, column: 19, scope: !18)
!67 = !DILocation(line: 65, column: 19, scope: !18)
!68 = !DILocation(line: 66, column: 19, scope: !18)
!69 = !DILocation(line: 63, column: 5, scope: !18)
!70 = !DILocation(line: 67, column: 5, scope: !18)
!71 = distinct !{!71, !72, !"polly.alias.scope.A"}
!72 = distinct !{!72, !"polly.alias.scope.domain"}
!73 = !{!74, !75}
!74 = distinct !{!74, !72, !"polly.alias.scope.B"}
!75 = distinct !{!75, !72, !"polly.alias.scope.C"}
!76 = distinct !{!76}
!77 = !{!71, !75}
!78 = !DILocation(line: 37, column: 31, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 36, column: 29)
!80 = distinct !DILexicalBlock(scope: !81, file: !1, line: 36, column: 9)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 36, column: 9)
!82 = distinct !DILexicalBlock(scope: !83, file: !1, line: 35, column: 25)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 35, column: 5)
!84 = distinct !DILexicalBlock(scope: !13, file: !1, line: 35, column: 5)
!85 = !{!74, !71}
