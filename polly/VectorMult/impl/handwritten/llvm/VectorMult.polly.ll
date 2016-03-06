; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !17, metadata !18), !dbg !19
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !20, metadata !18), !dbg !21
  %call = tail call noalias i8* @malloc(i64 41943040) #4, !dbg !22
  %call1 = tail call noalias i8* @malloc(i64 41943040) #4, !dbg !23
  %call2 = tail call noalias i8* @malloc(i64 40960) #4, !dbg !24
  tail call void @llvm.dbg.value(metadata i32* undef, i64 0, metadata !25, metadata !18), !dbg !26
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !18), !dbg !28
  br label %polly.loop_preheader2

if.then:                                          ; preds = %polly.exiting
  %call51 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4, !dbg !29
  tail call void @exit(i32 -2) #5, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %polly.exiting
  %call52 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !33
  %call53 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 10485760, i32 1024, i64 10485760) #4, !dbg !34
  ret i32 0, !dbg !35

polly.exiting:                                    ; preds = %polly.stmt.for.inc46
  %p_add45.4.lcssa = phi i64 [ %p_add45.4, %polly.stmt.for.inc46 ]
  %cmp49 = icmp eq i64 %p_add45.4.lcssa, 10485760, !dbg !36
  br i1 %cmp49, label %if.end, label %if.then, !dbg !37

polly.loop_exit3:                                 ; preds = %polly.loop_exit9
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond57 = icmp eq i64 %polly.indvar_next, 320
  br i1 %exitcond57, label %polly.loop_preheader29.preheader, label %polly.loop_preheader2

polly.loop_preheader29.preheader:                 ; preds = %polly.loop_exit3
  br label %polly.loop_preheader29

polly.loop_exit9:                                 ; preds = %polly.loop_exit15
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond56 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond56, label %polly.loop_exit3, label %polly.loop_preheader8

polly.loop_preheader2:                            ; preds = %polly.loop_exit3, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit3 ]
  %0 = shl i64 %polly.indvar, 5
  br label %polly.loop_preheader8

polly.loop_exit15:                                ; preds = %polly.stmt.for.body5
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond55 = icmp eq i64 %polly.indvar_next11, 32
  br i1 %exitcond55, label %polly.loop_exit9, label %polly.loop_preheader14

polly.loop_preheader8:                            ; preds = %polly.loop_exit9, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %polly.loop_exit9 ]
  %1 = shl i64 %polly.indvar4, 5
  br label %polly.loop_preheader14

polly.stmt.for.body5:                             ; preds = %polly.stmt.for.body5, %polly.loop_preheader14
  %polly.indvar16 = phi i64 [ 0, %polly.loop_preheader14 ], [ %polly.indvar_next17.3, %polly.stmt.for.body5 ]
  %2 = add nuw nsw i64 %polly.indvar16, %1
  %3 = shl i64 %2, 2
  %4 = add nuw nsw i64 %3, %15
  %scevgep = getelementptr i8, i8* %call, i64 %4
  %scevgep19 = bitcast i8* %scevgep to i32*
  store i32 1, i32* %scevgep19, align 4, !alias.scope !38, !noalias !40
  %scevgep20 = getelementptr i8, i8* %call1, i64 %4
  %scevgep2021 = bitcast i8* %scevgep20 to i32*
  store i32 1, i32* %scevgep2021, align 4, !alias.scope !45, !noalias !47
  %polly.indvar_next17 = or i64 %polly.indvar16, 1
  %5 = add nuw nsw i64 %polly.indvar_next17, %1
  %6 = shl i64 %5, 2
  %7 = add nuw nsw i64 %6, %15
  %scevgep.1 = getelementptr i8, i8* %call, i64 %7
  %scevgep19.1 = bitcast i8* %scevgep.1 to i32*
  store i32 1, i32* %scevgep19.1, align 4, !alias.scope !38, !noalias !40
  %scevgep20.1 = getelementptr i8, i8* %call1, i64 %7
  %scevgep2021.1 = bitcast i8* %scevgep20.1 to i32*
  store i32 1, i32* %scevgep2021.1, align 4, !alias.scope !45, !noalias !47
  %polly.indvar_next17.1 = or i64 %polly.indvar16, 2
  %8 = add nuw nsw i64 %polly.indvar_next17.1, %1
  %9 = shl i64 %8, 2
  %10 = add nuw nsw i64 %9, %15
  %scevgep.2 = getelementptr i8, i8* %call, i64 %10
  %scevgep19.2 = bitcast i8* %scevgep.2 to i32*
  store i32 1, i32* %scevgep19.2, align 4, !alias.scope !38, !noalias !40
  %scevgep20.2 = getelementptr i8, i8* %call1, i64 %10
  %scevgep2021.2 = bitcast i8* %scevgep20.2 to i32*
  store i32 1, i32* %scevgep2021.2, align 4, !alias.scope !45, !noalias !47
  %polly.indvar_next17.2 = or i64 %polly.indvar16, 3
  %11 = add nuw nsw i64 %polly.indvar_next17.2, %1
  %12 = shl i64 %11, 2
  %13 = add nuw nsw i64 %12, %15
  %scevgep.3 = getelementptr i8, i8* %call, i64 %13
  %scevgep19.3 = bitcast i8* %scevgep.3 to i32*
  store i32 1, i32* %scevgep19.3, align 4, !alias.scope !38, !noalias !40
  %scevgep20.3 = getelementptr i8, i8* %call1, i64 %13
  %scevgep2021.3 = bitcast i8* %scevgep20.3 to i32*
  store i32 1, i32* %scevgep2021.3, align 4, !alias.scope !45, !noalias !47
  %polly.indvar_next17.3 = add nsw i64 %polly.indvar16, 4
  %exitcond54.3 = icmp eq i64 %polly.indvar_next17.3, 32
  br i1 %exitcond54.3, label %polly.loop_exit15, label %polly.stmt.for.body5

polly.loop_preheader14:                           ; preds = %polly.loop_exit15, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %polly.loop_exit15 ]
  %14 = add nuw nsw i64 %polly.indvar10, %0
  %15 = shl i64 %14, 12
  br label %polly.stmt.for.body5

polly.stmt.for.end33:                             ; preds = %polly.stmt.for.inc31
  %p_add30.3.lcssa = phi i32 [ %p_add30.3, %polly.stmt.for.inc31 ]
  %16 = shl i64 %polly.indvar25, 2
  %scevgep41 = getelementptr i8, i8* %call2, i64 %16
  %scevgep4142 = bitcast i8* %scevgep41 to i32*
  store i32 %p_add30.3.lcssa, i32* %scevgep4142, align 4, !alias.scope !41, !noalias !48
  %polly.indvar_next26 = add nuw nsw i64 %polly.indvar25, 1
  %exitcond53 = icmp eq i64 %polly.indvar_next26, 10240
  br i1 %exitcond53, label %polly.stmt.for.inc46.preheader, label %polly.loop_preheader29

polly.stmt.for.inc46.preheader:                   ; preds = %polly.stmt.for.end33
  br label %polly.stmt.for.inc46

polly.stmt.for.inc31:                             ; preds = %polly.stmt.for.inc31, %polly.loop_preheader29
  %tmp.04.phiops.0 = phi i32 [ 0, %polly.loop_preheader29 ], [ %p_add30.3, %polly.stmt.for.inc31 ]
  %polly.indvar31 = phi i64 [ 0, %polly.loop_preheader29 ], [ %polly.indvar_next32.3, %polly.stmt.for.inc31 ]
  %17 = shl i64 %polly.indvar31, 2
  %scevgep35 = getelementptr i8, i8* %scevgep34, i64 %17
  %scevgep3536 = bitcast i8* %scevgep35 to i32*
  %_p_scalar_ = load i32, i32* %scevgep3536, align 4, !alias.scope !38, !noalias !40
  %scevgep38 = getelementptr i8, i8* %scevgep37, i64 %17
  %scevgep3839 = bitcast i8* %scevgep38 to i32*
  %_p_scalar_40 = load i32, i32* %scevgep3839, align 4, !alias.scope !45, !noalias !47
  %p_mul29 = mul nsw i32 %_p_scalar_40, %_p_scalar_, !dbg !49
  %p_add30 = add nsw i32 %p_mul29, %tmp.04.phiops.0, !dbg !56
  %polly.indvar_next32 = shl i64 %polly.indvar31, 2
  %18 = or i64 %polly.indvar_next32, 4
  %scevgep35.1 = getelementptr i8, i8* %scevgep34, i64 %18
  %scevgep3536.1 = bitcast i8* %scevgep35.1 to i32*
  %_p_scalar_.1 = load i32, i32* %scevgep3536.1, align 4, !alias.scope !38, !noalias !40
  %scevgep38.1 = getelementptr i8, i8* %scevgep37, i64 %18
  %scevgep3839.1 = bitcast i8* %scevgep38.1 to i32*
  %_p_scalar_40.1 = load i32, i32* %scevgep3839.1, align 4, !alias.scope !45, !noalias !47
  %p_mul29.1 = mul nsw i32 %_p_scalar_40.1, %_p_scalar_.1, !dbg !49
  %p_add30.1 = add nsw i32 %p_mul29.1, %p_add30, !dbg !56
  %polly.indvar_next32.1 = shl i64 %polly.indvar31, 2
  %19 = or i64 %polly.indvar_next32.1, 8
  %scevgep35.2 = getelementptr i8, i8* %scevgep34, i64 %19
  %scevgep3536.2 = bitcast i8* %scevgep35.2 to i32*
  %_p_scalar_.2 = load i32, i32* %scevgep3536.2, align 4, !alias.scope !38, !noalias !40
  %scevgep38.2 = getelementptr i8, i8* %scevgep37, i64 %19
  %scevgep3839.2 = bitcast i8* %scevgep38.2 to i32*
  %_p_scalar_40.2 = load i32, i32* %scevgep3839.2, align 4, !alias.scope !45, !noalias !47
  %p_mul29.2 = mul nsw i32 %_p_scalar_40.2, %_p_scalar_.2, !dbg !49
  %p_add30.2 = add nsw i32 %p_mul29.2, %p_add30.1, !dbg !56
  %polly.indvar_next32.2 = shl i64 %polly.indvar31, 2
  %20 = or i64 %polly.indvar_next32.2, 12
  %scevgep35.3 = getelementptr i8, i8* %scevgep34, i64 %20
  %scevgep3536.3 = bitcast i8* %scevgep35.3 to i32*
  %_p_scalar_.3 = load i32, i32* %scevgep3536.3, align 4, !alias.scope !38, !noalias !40
  %scevgep38.3 = getelementptr i8, i8* %scevgep37, i64 %20
  %scevgep3839.3 = bitcast i8* %scevgep38.3 to i32*
  %_p_scalar_40.3 = load i32, i32* %scevgep3839.3, align 4, !alias.scope !45, !noalias !47
  %p_mul29.3 = mul nsw i32 %_p_scalar_40.3, %_p_scalar_.3, !dbg !49
  %p_add30.3 = add nsw i32 %p_mul29.3, %p_add30.2, !dbg !56
  %polly.indvar_next32.3 = add nsw i64 %polly.indvar31, 4
  %exitcond52.3 = icmp eq i64 %polly.indvar_next32.3, 1024
  br i1 %exitcond52.3, label %polly.stmt.for.end33, label %polly.stmt.for.inc31

polly.loop_preheader29:                           ; preds = %polly.loop_preheader29.preheader, %polly.stmt.for.end33
  %polly.indvar25 = phi i64 [ %polly.indvar_next26, %polly.stmt.for.end33 ], [ 0, %polly.loop_preheader29.preheader ]
  %21 = shl i64 %polly.indvar25, 12
  %scevgep34 = getelementptr i8, i8* %call, i64 %21
  %scevgep37 = getelementptr i8, i8* %call1, i64 %21
  br label %polly.stmt.for.inc31

polly.stmt.for.inc46:                             ; preds = %polly.stmt.for.inc46, %polly.stmt.for.inc46.preheader
  %total.02.phiops.0 = phi i64 [ 0, %polly.stmt.for.inc46.preheader ], [ %p_add45.4, %polly.stmt.for.inc46 ]
  %polly.indvar46 = phi i64 [ 0, %polly.stmt.for.inc46.preheader ], [ %polly.indvar_next47.4, %polly.stmt.for.inc46 ]
  %22 = shl i64 %polly.indvar46, 2
  %scevgep49 = getelementptr i8, i8* %call2, i64 %22
  %scevgep4950 = bitcast i8* %scevgep49 to i32*
  %_p_scalar_51 = load i32, i32* %scevgep4950, align 4, !alias.scope !41, !noalias !48
  %p_conv44 = sext i32 %_p_scalar_51 to i64, !dbg !57
  %p_add45 = add nsw i64 %p_conv44, %total.02.phiops.0, !dbg !61
  %polly.indvar_next47 = shl i64 %polly.indvar46, 2
  %23 = add i64 %polly.indvar_next47, 4
  %scevgep49.1 = getelementptr i8, i8* %call2, i64 %23
  %scevgep4950.1 = bitcast i8* %scevgep49.1 to i32*
  %_p_scalar_51.1 = load i32, i32* %scevgep4950.1, align 4, !alias.scope !41, !noalias !48
  %p_conv44.1 = sext i32 %_p_scalar_51.1 to i64, !dbg !57
  %p_add45.1 = add nsw i64 %p_conv44.1, %p_add45, !dbg !61
  %polly.indvar_next47.1 = shl i64 %polly.indvar46, 2
  %24 = add i64 %polly.indvar_next47.1, 8
  %scevgep49.2 = getelementptr i8, i8* %call2, i64 %24
  %scevgep4950.2 = bitcast i8* %scevgep49.2 to i32*
  %_p_scalar_51.2 = load i32, i32* %scevgep4950.2, align 4, !alias.scope !41, !noalias !48
  %p_conv44.2 = sext i32 %_p_scalar_51.2 to i64, !dbg !57
  %p_add45.2 = add nsw i64 %p_conv44.2, %p_add45.1, !dbg !61
  %polly.indvar_next47.2 = shl i64 %polly.indvar46, 2
  %25 = add i64 %polly.indvar_next47.2, 12
  %scevgep49.3 = getelementptr i8, i8* %call2, i64 %25
  %scevgep4950.3 = bitcast i8* %scevgep49.3 to i32*
  %_p_scalar_51.3 = load i32, i32* %scevgep4950.3, align 4, !alias.scope !41, !noalias !48
  %p_conv44.3 = sext i32 %_p_scalar_51.3 to i64, !dbg !57
  %p_add45.3 = add nsw i64 %p_conv44.3, %p_add45.2, !dbg !61
  %polly.indvar_next47.3 = shl i64 %polly.indvar46, 2
  %26 = add i64 %polly.indvar_next47.3, 16
  %scevgep49.4 = getelementptr i8, i8* %call2, i64 %26
  %scevgep4950.4 = bitcast i8* %scevgep49.4 to i32*
  %_p_scalar_51.4 = load i32, i32* %scevgep4950.4, align 4, !alias.scope !41, !noalias !48
  %p_conv44.4 = sext i32 %_p_scalar_51.4 to i64, !dbg !57
  %p_add45.4 = add nsw i64 %p_conv44.4, %p_add45.3, !dbg !61
  %polly.indvar_next47.4 = add nsw i64 %polly.indvar46, 5
  %exitcond.4 = icmp eq i64 %polly.indvar_next47.4, 10240
  br i1 %exitcond.4, label %polly.exiting, label %polly.stmt.for.inc46
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

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
!22 = !DILocation(line: 12, column: 18, scope: !8)
!23 = !DILocation(line: 13, column: 18, scope: !8)
!24 = !DILocation(line: 14, column: 20, scope: !8)
!25 = !DILocalVariable(name: "sum", scope: !8, file: !1, line: 14, type: !4)
!26 = !DILocation(line: 14, column: 7, scope: !8)
!27 = !DILocalVariable(name: "r", scope: !8, file: !1, line: 11, type: !6)
!28 = !DILocation(line: 11, column: 12, scope: !8)
!29 = !DILocation(line: 41, column: 3, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !1, line: 40, column: 19)
!31 = distinct !DILexicalBlock(scope: !8, file: !1, line: 40, column: 5)
!32 = !DILocation(line: 42, column: 3, scope: !30)
!33 = !DILocation(line: 46, column: 2, scope: !8)
!34 = !DILocation(line: 47, column: 2, scope: !8)
!35 = !DILocation(line: 49, column: 2, scope: !8)
!36 = !DILocation(line: 40, column: 11, scope: !31)
!37 = !DILocation(line: 40, column: 5, scope: !8)
!38 = distinct !{!38, !39, !"polly.alias.scope.call"}
!39 = distinct !{!39, !"polly.alias.scope.domain"}
!40 = !{!41, !42, !43, !44, !45, !46}
!41 = distinct !{!41, !39, !"polly.alias.scope.call2"}
!42 = distinct !{!42, !39, !"polly.alias.scope.add45"}
!43 = distinct !{!43, !39, !"polly.alias.scope.add30.lcssa"}
!44 = distinct !{!44, !39, !"polly.alias.scope.tmp.04"}
!45 = distinct !{!45, !39, !"polly.alias.scope.call1"}
!46 = distinct !{!46, !39, !"polly.alias.scope.total.02"}
!47 = !{!38, !41, !42, !43, !44, !46}
!48 = !{!38, !42, !43, !44, !45, !46}
!49 = !DILocation(line: 29, column: 23, scope: !50)
!50 = distinct !DILexicalBlock(scope: !51, file: !1, line: 27, column: 21)
!51 = distinct !DILexicalBlock(scope: !52, file: !1, line: 27, column: 3)
!52 = distinct !DILexicalBlock(scope: !53, file: !1, line: 27, column: 3)
!53 = distinct !DILexicalBlock(scope: !54, file: !1, line: 25, column: 18)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 25, column: 2)
!55 = distinct !DILexicalBlock(scope: !8, file: !1, line: 25, column: 2)
!56 = !DILocation(line: 29, column: 13, scope: !50)
!57 = !DILocation(line: 36, column: 19, scope: !58)
!58 = distinct !DILexicalBlock(scope: !59, file: !1, line: 35, column: 18)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 35, column: 2)
!60 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 2)
!61 = !DILocation(line: 36, column: 17, scope: !58)
