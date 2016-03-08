; ModuleID = 'VectorMult.before.none.ll'
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
  %0 = bitcast i8* %call to i32*, !dbg !23
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !24, metadata !18), !dbg !25
  %call1 = tail call noalias i8* @malloc(i64 41943040) #4, !dbg !26
  %1 = bitcast i8* %call1 to i32*, !dbg !27
  tail call void @llvm.dbg.value(metadata i32* %1, i64 0, metadata !28, metadata !18), !dbg !29
  %call2 = tail call noalias i8* @malloc(i64 40960) #4, !dbg !30
  tail call void @llvm.dbg.value(metadata i32* %39, i64 0, metadata !31, metadata !18), !dbg !32
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !18), !dbg !34
  br label %for.cond3.preheader, !dbg !35

for.cond3.preheader:                              ; preds = %for.inc10, %entry
  %r.07 = phi i64 [ 0, %entry ], [ %inc11, %for.inc10 ]
  %mul = shl i64 %r.07, 10, !dbg !39
  br label %vector.body, !dbg !44

vector.body:                                      ; preds = %vector.body, %for.cond3.preheader
  %index = phi i64 [ 0, %for.cond3.preheader ], [ %index.next.3, %vector.body ], !dbg !44
  %2 = add nuw nsw i64 %index, %mul, !dbg !46
  %3 = getelementptr inbounds i32, i32* %0, i64 %2, !dbg !46
  %4 = bitcast i32* %3 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %4, align 4, !dbg !47
  %5 = getelementptr i32, i32* %3, i64 4, !dbg !47
  %6 = bitcast i32* %5 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %6, align 4, !dbg !47
  %7 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !48
  %8 = bitcast i32* %7 to <4 x i32>*, !dbg !49
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %8, align 4, !dbg !49
  %9 = getelementptr i32, i32* %7, i64 4, !dbg !49
  %10 = bitcast i32* %9 to <4 x i32>*, !dbg !49
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 4, !dbg !49
  %index.next = or i64 %index, 8, !dbg !44
  %11 = add nuw nsw i64 %index.next, %mul, !dbg !46
  %12 = getelementptr inbounds i32, i32* %0, i64 %11, !dbg !46
  %13 = bitcast i32* %12 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 4, !dbg !47
  %14 = getelementptr i32, i32* %12, i64 4, !dbg !47
  %15 = bitcast i32* %14 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 4, !dbg !47
  %16 = getelementptr inbounds i32, i32* %1, i64 %11, !dbg !48
  %17 = bitcast i32* %16 to <4 x i32>*, !dbg !49
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 4, !dbg !49
  %18 = getelementptr i32, i32* %16, i64 4, !dbg !49
  %19 = bitcast i32* %18 to <4 x i32>*, !dbg !49
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 4, !dbg !49
  %index.next.1 = or i64 %index, 16, !dbg !44
  %20 = add nuw nsw i64 %index.next.1, %mul, !dbg !46
  %21 = getelementptr inbounds i32, i32* %0, i64 %20, !dbg !46
  %22 = bitcast i32* %21 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %22, align 4, !dbg !47
  %23 = getelementptr i32, i32* %21, i64 4, !dbg !47
  %24 = bitcast i32* %23 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %24, align 4, !dbg !47
  %25 = getelementptr inbounds i32, i32* %1, i64 %20, !dbg !48
  %26 = bitcast i32* %25 to <4 x i32>*, !dbg !49
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %26, align 4, !dbg !49
  %27 = getelementptr i32, i32* %25, i64 4, !dbg !49
  %28 = bitcast i32* %27 to <4 x i32>*, !dbg !49
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %28, align 4, !dbg !49
  %index.next.2 = or i64 %index, 24, !dbg !44
  %29 = add nuw nsw i64 %index.next.2, %mul, !dbg !46
  %30 = getelementptr inbounds i32, i32* %0, i64 %29, !dbg !46
  %31 = bitcast i32* %30 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 4, !dbg !47
  %32 = getelementptr i32, i32* %30, i64 4, !dbg !47
  %33 = bitcast i32* %32 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 4, !dbg !47
  %34 = getelementptr inbounds i32, i32* %1, i64 %29, !dbg !48
  %35 = bitcast i32* %34 to <4 x i32>*, !dbg !49
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 4, !dbg !49
  %36 = getelementptr i32, i32* %34, i64 4, !dbg !49
  %37 = bitcast i32* %36 to <4 x i32>*, !dbg !49
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 4, !dbg !49
  %index.next.3 = add nsw i64 %index, 32, !dbg !44
  %38 = icmp eq i64 %index.next.3, 1024, !dbg !44
  br i1 %38, label %for.inc10, label %vector.body, !dbg !44, !llvm.loop !50

for.cond13.preheader:                             ; preds = %for.inc10
  %39 = bitcast i8* %call2 to i32*, !dbg !53
  br label %for.cond17.preheader, !dbg !54

for.inc10:                                        ; preds = %vector.body
  %inc11 = add nuw nsw i64 %r.07, 1, !dbg !58
  tail call void @llvm.dbg.value(metadata i64 %inc11, i64 0, metadata !33, metadata !18), !dbg !34
  %exitcond13 = icmp eq i64 %inc11, 10240, !dbg !35
  br i1 %exitcond13, label %for.cond13.preheader, label %for.cond3.preheader, !dbg !35

for.cond17.preheader:                             ; preds = %middle.block5, %for.cond13.preheader
  %r.15 = phi i64 [ 0, %for.cond13.preheader ], [ %inc36, %middle.block5 ]
  %mul21 = shl i64 %r.15, 10, !dbg !60
  br label %vector.body4, !dbg !65

vector.body4:                                     ; preds = %vector.body4, %for.cond17.preheader
  %index9 = phi i64 [ 0, %for.cond17.preheader ], [ %index.next10.3, %vector.body4 ], !dbg !65
  %vec.phi = phi <4 x i32> [ zeroinitializer, %for.cond17.preheader ], [ %67, %vector.body4 ]
  %40 = add nuw nsw i64 %index9, %mul21, !dbg !67
  %41 = getelementptr inbounds i32, i32* %0, i64 %40, !dbg !67
  %42 = bitcast i32* %41 to <4 x i32>*, !dbg !67
  %wide.load = load <4 x i32>, <4 x i32>* %42, align 4, !dbg !67
  %43 = getelementptr inbounds i32, i32* %1, i64 %40, !dbg !68
  %44 = bitcast i32* %43 to <4 x i32>*, !dbg !68
  %wide.load18 = load <4 x i32>, <4 x i32>* %44, align 4, !dbg !68
  %45 = mul nsw <4 x i32> %wide.load18, %wide.load, !dbg !69
  %46 = add nsw <4 x i32> %45, %vec.phi, !dbg !70
  %index.next10 = or i64 %index9, 4, !dbg !65
  %47 = add nuw nsw i64 %index.next10, %mul21, !dbg !67
  %48 = getelementptr inbounds i32, i32* %0, i64 %47, !dbg !67
  %49 = bitcast i32* %48 to <4 x i32>*, !dbg !67
  %wide.load.1 = load <4 x i32>, <4 x i32>* %49, align 4, !dbg !67
  %50 = getelementptr inbounds i32, i32* %1, i64 %47, !dbg !68
  %51 = bitcast i32* %50 to <4 x i32>*, !dbg !68
  %wide.load18.1 = load <4 x i32>, <4 x i32>* %51, align 4, !dbg !68
  %52 = mul nsw <4 x i32> %wide.load18.1, %wide.load.1, !dbg !69
  %53 = add nsw <4 x i32> %52, %46, !dbg !70
  %index.next10.1 = or i64 %index9, 8, !dbg !65
  %54 = add nuw nsw i64 %index.next10.1, %mul21, !dbg !67
  %55 = getelementptr inbounds i32, i32* %0, i64 %54, !dbg !67
  %56 = bitcast i32* %55 to <4 x i32>*, !dbg !67
  %wide.load.2 = load <4 x i32>, <4 x i32>* %56, align 4, !dbg !67
  %57 = getelementptr inbounds i32, i32* %1, i64 %54, !dbg !68
  %58 = bitcast i32* %57 to <4 x i32>*, !dbg !68
  %wide.load18.2 = load <4 x i32>, <4 x i32>* %58, align 4, !dbg !68
  %59 = mul nsw <4 x i32> %wide.load18.2, %wide.load.2, !dbg !69
  %60 = add nsw <4 x i32> %59, %53, !dbg !70
  %index.next10.2 = or i64 %index9, 12, !dbg !65
  %61 = add nuw nsw i64 %index.next10.2, %mul21, !dbg !67
  %62 = getelementptr inbounds i32, i32* %0, i64 %61, !dbg !67
  %63 = bitcast i32* %62 to <4 x i32>*, !dbg !67
  %wide.load.3 = load <4 x i32>, <4 x i32>* %63, align 4, !dbg !67
  %64 = getelementptr inbounds i32, i32* %1, i64 %61, !dbg !68
  %65 = bitcast i32* %64 to <4 x i32>*, !dbg !68
  %wide.load18.3 = load <4 x i32>, <4 x i32>* %65, align 4, !dbg !68
  %66 = mul nsw <4 x i32> %wide.load18.3, %wide.load.3, !dbg !69
  %67 = add nsw <4 x i32> %66, %60, !dbg !70
  %index.next10.3 = add nsw i64 %index9, 16, !dbg !65
  %68 = icmp eq i64 %index.next10.3, 1024, !dbg !65
  br i1 %68, label %middle.block5, label %vector.body4, !dbg !65, !llvm.loop !71

middle.block5:                                    ; preds = %vector.body4
  %.lcssa45 = phi <4 x i32> [ %67, %vector.body4 ]
  %rdx.shuf = shufflevector <4 x i32> %.lcssa45, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !70
  %bin.rdx = add <4 x i32> %.lcssa45, %rdx.shuf, !dbg !70
  %rdx.shuf19 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !70
  %bin.rdx20 = add <4 x i32> %bin.rdx, %rdx.shuf19, !dbg !70
  %69 = extractelement <4 x i32> %bin.rdx20, i32 0, !dbg !70
  %arrayidx34 = getelementptr inbounds i32, i32* %39, i64 %r.15, !dbg !72
  store i32 %69, i32* %arrayidx34, align 4, !dbg !73
  %inc36 = add nuw nsw i64 %r.15, 1, !dbg !74
  tail call void @llvm.dbg.value(metadata i64 %inc36, i64 0, metadata !33, metadata !18), !dbg !34
  %exitcond9 = icmp eq i64 %inc36, 10240, !dbg !54
  br i1 %exitcond9, label %vector.body21.preheader, label %for.cond17.preheader, !dbg !54

vector.body21.preheader:                          ; preds = %middle.block5
  br label %vector.body21, !dbg !76

vector.body21:                                    ; preds = %vector.body21, %vector.body21.preheader
  %index26 = phi i64 [ 0, %vector.body21.preheader ], [ %index.next27.1, %vector.body21 ], !dbg !80
  %vec.phi30 = phi <2 x i64> [ zeroinitializer, %vector.body21.preheader ], [ %84, %vector.body21 ]
  %vec.phi31 = phi <2 x i64> [ zeroinitializer, %vector.body21.preheader ], [ %85, %vector.body21 ]
  %70 = getelementptr inbounds i32, i32* %39, i64 %index26, !dbg !76
  %71 = bitcast i32* %70 to <2 x i32>*, !dbg !76
  %wide.load36 = load <2 x i32>, <2 x i32>* %71, align 4, !dbg !76
  %72 = getelementptr i32, i32* %70, i64 2, !dbg !76
  %73 = bitcast i32* %72 to <2 x i32>*, !dbg !76
  %wide.load37 = load <2 x i32>, <2 x i32>* %73, align 4, !dbg !76
  %74 = sext <2 x i32> %wide.load36 to <2 x i64>, !dbg !76
  %75 = sext <2 x i32> %wide.load37 to <2 x i64>, !dbg !76
  %76 = add nsw <2 x i64> %74, %vec.phi30, !dbg !82
  %77 = add nsw <2 x i64> %75, %vec.phi31, !dbg !82
  %index.next27 = or i64 %index26, 4, !dbg !83
  %78 = getelementptr inbounds i32, i32* %39, i64 %index.next27, !dbg !76
  %79 = bitcast i32* %78 to <2 x i32>*, !dbg !76
  %wide.load36.1 = load <2 x i32>, <2 x i32>* %79, align 4, !dbg !76
  %80 = getelementptr i32, i32* %78, i64 2, !dbg !76
  %81 = bitcast i32* %80 to <2 x i32>*, !dbg !76
  %wide.load37.1 = load <2 x i32>, <2 x i32>* %81, align 4, !dbg !76
  %82 = sext <2 x i32> %wide.load36.1 to <2 x i64>, !dbg !76
  %83 = sext <2 x i32> %wide.load37.1 to <2 x i64>, !dbg !76
  %84 = add nsw <2 x i64> %82, %76, !dbg !82
  %85 = add nsw <2 x i64> %83, %77, !dbg !82
  %index.next27.1 = add nsw i64 %index26, 8, !dbg !83
  %86 = icmp eq i64 %index.next27.1, 10240, !dbg !83
  br i1 %86, label %middle.block22, label %vector.body21, !dbg !83, !llvm.loop !84

middle.block22:                                   ; preds = %vector.body21
  %.lcssa44 = phi <2 x i64> [ %85, %vector.body21 ]
  %.lcssa = phi <2 x i64> [ %84, %vector.body21 ]
  %bin.rdx38 = add <2 x i64> %.lcssa44, %.lcssa, !dbg !82
  %rdx.shuf39 = shufflevector <2 x i64> %bin.rdx38, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>, !dbg !82
  %bin.rdx40 = add <2 x i64> %bin.rdx38, %rdx.shuf39, !dbg !82
  %87 = extractelement <2 x i64> %bin.rdx40, i32 0, !dbg !82
  %cmp49 = icmp eq i64 %87, 10485760, !dbg !85
  br i1 %cmp49, label %if.end, label %if.then, !dbg !87

if.then:                                          ; preds = %middle.block22
  %call51 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4, !dbg !88
  tail call void @exit(i32 -2) #5, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %middle.block22
  %call52 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !91
  %call53 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 10485760, i32 1024, i64 10485760) #4, !dbg !92
  ret i32 0, !dbg !93
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

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!39 = !DILocation(line: 20, column: 7, scope: !40)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 19, column: 21)
!41 = distinct !DILexicalBlock(scope: !42, file: !1, line: 19, column: 3)
!42 = distinct !DILexicalBlock(scope: !43, file: !1, line: 19, column: 3)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 17, column: 18)
!44 = !DILocation(line: 19, column: 3, scope: !45)
!45 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 1)
!46 = !DILocation(line: 20, column: 4, scope: !40)
!47 = !DILocation(line: 20, column: 13, scope: !40)
!48 = !DILocation(line: 21, column: 4, scope: !40)
!49 = !DILocation(line: 21, column: 13, scope: !40)
!50 = distinct !{!50, !51, !52}
!51 = !{!"llvm.loop.vectorize.width", i32 1}
!52 = !{!"llvm.loop.interleave.count", i32 1}
!53 = !DILocation(line: 14, column: 13, scope: !8)
!54 = !DILocation(line: 25, column: 2, scope: !55)
!55 = !DILexicalBlockFile(scope: !56, file: !1, discriminator: 1)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 25, column: 2)
!57 = distinct !DILexicalBlock(scope: !8, file: !1, line: 25, column: 2)
!58 = !DILocation(line: 17, column: 15, scope: !59)
!59 = !DILexicalBlockFile(scope: !37, file: !1, discriminator: 2)
!60 = !DILocation(line: 29, column: 18, scope: !61)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 27, column: 21)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 27, column: 3)
!63 = distinct !DILexicalBlock(scope: !64, file: !1, line: 27, column: 3)
!64 = distinct !DILexicalBlock(scope: !56, file: !1, line: 25, column: 18)
!65 = !DILocation(line: 27, column: 3, scope: !66)
!66 = !DILexicalBlockFile(scope: !62, file: !1, discriminator: 1)
!67 = !DILocation(line: 29, column: 15, scope: !61)
!68 = !DILocation(line: 29, column: 24, scope: !61)
!69 = !DILocation(line: 29, column: 23, scope: !61)
!70 = !DILocation(line: 29, column: 13, scope: !61)
!71 = distinct !{!71, !51, !52}
!72 = !DILocation(line: 31, column: 3, scope: !64)
!73 = !DILocation(line: 31, column: 10, scope: !64)
!74 = !DILocation(line: 25, column: 15, scope: !75)
!75 = !DILexicalBlockFile(scope: !56, file: !1, discriminator: 2)
!76 = !DILocation(line: 36, column: 19, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !1, line: 35, column: 18)
!78 = distinct !DILexicalBlock(scope: !79, file: !1, line: 35, column: 2)
!79 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 2)
!80 = !DILocation(line: 35, column: 15, scope: !81)
!81 = !DILexicalBlockFile(scope: !78, file: !1, discriminator: 2)
!82 = !DILocation(line: 36, column: 17, scope: !77)
!83 = !DILocation(line: 34, column: 12, scope: !8)
!84 = distinct !{!84, !51, !52}
!85 = !DILocation(line: 40, column: 11, scope: !86)
!86 = distinct !DILexicalBlock(scope: !8, file: !1, line: 40, column: 5)
!87 = !DILocation(line: 40, column: 5, scope: !8)
!88 = !DILocation(line: 41, column: 3, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !1, line: 40, column: 19)
!90 = !DILocation(line: 42, column: 3, scope: !89)
!91 = !DILocation(line: 46, column: 2, scope: !8)
!92 = !DILocation(line: 47, column: 2, scope: !8)
!93 = !DILocation(line: 49, column: 2, scope: !8)
