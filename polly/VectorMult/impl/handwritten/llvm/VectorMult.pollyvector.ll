; ModuleID = 'VectorMult.before.pollyvector.ll'
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
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !18), !dbg !32
  br label %for.cond3.preheader, !dbg !33

for.cond3.preheader:                              ; preds = %for.inc10, %entry
  %r.07 = phi i64 [ 0, %entry ], [ %inc11, %for.inc10 ]
  %mul = shl i64 %r.07, 10, !dbg !37
  br label %vector.body, !dbg !42

vector.body:                                      ; preds = %vector.body, %for.cond3.preheader
  %index = phi i64 [ 0, %for.cond3.preheader ], [ %index.next.3, %vector.body ], !dbg !42
  %2 = add nuw nsw i64 %index, %mul, !dbg !44
  %3 = getelementptr inbounds i32, i32* %0, i64 %2, !dbg !44
  %4 = bitcast i32* %3 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %4, align 4, !dbg !45
  %5 = getelementptr i32, i32* %3, i64 4, !dbg !45
  %6 = bitcast i32* %5 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %6, align 4, !dbg !45
  %7 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !46
  %8 = bitcast i32* %7 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %8, align 4, !dbg !47
  %9 = getelementptr i32, i32* %7, i64 4, !dbg !47
  %10 = bitcast i32* %9 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 4, !dbg !47
  %index.next = or i64 %index, 8, !dbg !42
  %11 = add nuw nsw i64 %index.next, %mul, !dbg !44
  %12 = getelementptr inbounds i32, i32* %0, i64 %11, !dbg !44
  %13 = bitcast i32* %12 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 4, !dbg !45
  %14 = getelementptr i32, i32* %12, i64 4, !dbg !45
  %15 = bitcast i32* %14 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 4, !dbg !45
  %16 = getelementptr inbounds i32, i32* %1, i64 %11, !dbg !46
  %17 = bitcast i32* %16 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 4, !dbg !47
  %18 = getelementptr i32, i32* %16, i64 4, !dbg !47
  %19 = bitcast i32* %18 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 4, !dbg !47
  %index.next.1 = or i64 %index, 16, !dbg !42
  %20 = add nuw nsw i64 %index.next.1, %mul, !dbg !44
  %21 = getelementptr inbounds i32, i32* %0, i64 %20, !dbg !44
  %22 = bitcast i32* %21 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %22, align 4, !dbg !45
  %23 = getelementptr i32, i32* %21, i64 4, !dbg !45
  %24 = bitcast i32* %23 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %24, align 4, !dbg !45
  %25 = getelementptr inbounds i32, i32* %1, i64 %20, !dbg !46
  %26 = bitcast i32* %25 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %26, align 4, !dbg !47
  %27 = getelementptr i32, i32* %25, i64 4, !dbg !47
  %28 = bitcast i32* %27 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %28, align 4, !dbg !47
  %index.next.2 = or i64 %index, 24, !dbg !42
  %29 = add nuw nsw i64 %index.next.2, %mul, !dbg !44
  %30 = getelementptr inbounds i32, i32* %0, i64 %29, !dbg !44
  %31 = bitcast i32* %30 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 4, !dbg !45
  %32 = getelementptr i32, i32* %30, i64 4, !dbg !45
  %33 = bitcast i32* %32 to <4 x i32>*, !dbg !45
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 4, !dbg !45
  %34 = getelementptr inbounds i32, i32* %1, i64 %29, !dbg !46
  %35 = bitcast i32* %34 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 4, !dbg !47
  %36 = getelementptr i32, i32* %34, i64 4, !dbg !47
  %37 = bitcast i32* %36 to <4 x i32>*, !dbg !47
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 4, !dbg !47
  %index.next.3 = add nuw nsw i64 %index, 32, !dbg !42
  %38 = icmp eq i64 %index.next.3, 1024, !dbg !42
  br i1 %38, label %for.inc10, label %vector.body, !dbg !42, !llvm.loop !48

for.cond13.preheader:                             ; preds = %for.inc10
  %scevgep13 = getelementptr i8, i8* %call, i64 16
  %scevgep17 = getelementptr i8, i8* %call1, i64 16
  %scevgep23 = getelementptr i8, i8* %call, i64 32
  %scevgep27 = getelementptr i8, i8* %call1, i64 32
  %scevgep33 = getelementptr i8, i8* %call, i64 48
  %scevgep37 = getelementptr i8, i8* %call1, i64 48
  br label %polly.stmt.for.cond17.preheader

for.inc10:                                        ; preds = %vector.body
  %inc11 = add nuw nsw i64 %r.07, 1, !dbg !51
  tail call void @llvm.dbg.value(metadata i64 %inc11, i64 0, metadata !31, metadata !18), !dbg !32
  %exitcond13 = icmp eq i64 %inc11, 10240, !dbg !33
  br i1 %exitcond13, label %for.cond13.preheader, label %for.cond3.preheader, !dbg !33

if.then:                                          ; preds = %polly.exiting
  %call51 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4, !dbg !53
  tail call void @exit(i32 -2) #5, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %polly.exiting
  %call52 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4, !dbg !57
  %call53 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 10485760, i32 1024, i64 10485760) #4, !dbg !58
  ret i32 0, !dbg !59

polly.stmt.vector.body21.preheader:               ; preds = %polly.stmt.middle.block5
  %scevgep55 = getelementptr i8, i8* %call2, i64 8
  %scevgep62 = getelementptr i8, i8* %call2, i64 16
  %scevgep65 = getelementptr i8, i8* %call2, i64 24
  br label %polly.stmt.vector.body21

polly.exiting:                                    ; preds = %polly.stmt.vector.body21
  %p_71.lcssa = phi <2 x i64> [ %p_71, %polly.stmt.vector.body21 ]
  %p_70.lcssa = phi <2 x i64> [ %p_70, %polly.stmt.vector.body21 ]
  %bin.rdx38 = add <2 x i64> %p_71.lcssa, %p_70.lcssa, !dbg !60
  %rdx.shuf39 = shufflevector <2 x i64> %bin.rdx38, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>, !dbg !60
  %bin.rdx40 = add <2 x i64> %rdx.shuf39, %bin.rdx38, !dbg !60
  %39 = extractelement <2 x i64> %bin.rdx40, i32 0, !dbg !60
  %cmp49 = icmp eq i64 %39, 10485760, !dbg !64
  br i1 %cmp49, label %if.end, label %if.then, !dbg !65

polly.stmt.for.cond17.preheader:                  ; preds = %polly.stmt.middle.block5, %for.cond13.preheader
  %polly.indvar = phi i64 [ 0, %for.cond13.preheader ], [ %polly.indvar_next, %polly.stmt.middle.block5 ]
  %40 = shl i64 %polly.indvar, 12
  %scevgep = getelementptr i8, i8* %call, i64 %40
  %scevgep9 = getelementptr i8, i8* %call1, i64 %40
  %scevgep14 = getelementptr i8, i8* %scevgep13, i64 %40
  %scevgep18 = getelementptr i8, i8* %scevgep17, i64 %40
  %scevgep24 = getelementptr i8, i8* %scevgep23, i64 %40
  %scevgep28 = getelementptr i8, i8* %scevgep27, i64 %40
  %scevgep34 = getelementptr i8, i8* %scevgep33, i64 %40
  %scevgep38 = getelementptr i8, i8* %scevgep37, i64 %40
  br label %polly.stmt.vector.body4

polly.stmt.middle.block5:                         ; preds = %polly.stmt.vector.body4
  %p_42.lcssa = phi <4 x i32> [ %p_42, %polly.stmt.vector.body4 ]
  %p_rdx.shuf = shufflevector <4 x i32> %p_42.lcssa, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !66
  %p_bin.rdx = add <4 x i32> %p_rdx.shuf, %p_42.lcssa, !dbg !66
  %p_rdx.shuf19 = shufflevector <4 x i32> %p_bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !66
  %p_bin.rdx20 = add <4 x i32> %p_rdx.shuf19, %p_bin.rdx, !dbg !66
  %p_44 = extractelement <4 x i32> %p_bin.rdx20, i32 0, !dbg !66
  %41 = shl i64 %polly.indvar, 2
  %scevgep45 = getelementptr i8, i8* %call2, i64 %41
  %scevgep4546 = bitcast i8* %scevgep45 to i32*
  store i32 %p_44, i32* %scevgep4546, align 4, !alias.scope !73, !noalias !75
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond2 = icmp eq i64 %polly.indvar_next, 10240
  br i1 %exitcond2, label %polly.stmt.vector.body21.preheader, label %polly.stmt.for.cond17.preheader

polly.stmt.vector.body4:                          ; preds = %polly.stmt.vector.body4, %polly.stmt.for.cond17.preheader
  %vec.phi.phiops.0 = phi <4 x i32> [ zeroinitializer, %polly.stmt.for.cond17.preheader ], [ %p_42, %polly.stmt.vector.body4 ]
  %polly.indvar4 = phi i64 [ 0, %polly.stmt.for.cond17.preheader ], [ %polly.indvar_next5, %polly.stmt.vector.body4 ]
  %42 = shl i64 %polly.indvar4, 6
  %scevgep7 = getelementptr i8, i8* %scevgep, i64 %42
  %scevgep78 = bitcast i8* %scevgep7 to <4 x i32>*
  %wide.load_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep78, align 4, !alias.scope !77, !noalias !84
  %scevgep10 = getelementptr i8, i8* %scevgep9, i64 %42
  %scevgep1011 = bitcast i8* %scevgep10 to <4 x i32>*
  %wide.load18_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep1011, align 4, !alias.scope !83, !noalias !85
  %p_ = mul nsw <4 x i32> %wide.load18_p_scalar_, %wide.load_p_scalar_, !dbg !86
  %p_12 = add nsw <4 x i32> %p_, %vec.phi.phiops.0, !dbg !66
  %scevgep15 = getelementptr i8, i8* %scevgep14, i64 %42
  %scevgep1516 = bitcast i8* %scevgep15 to <4 x i32>*
  %wide.load.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep1516, align 4, !alias.scope !77, !noalias !84
  %scevgep19 = getelementptr i8, i8* %scevgep18, i64 %42
  %scevgep1920 = bitcast i8* %scevgep19 to <4 x i32>*
  %wide.load18.1_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep1920, align 4, !alias.scope !83, !noalias !85
  %p_21 = mul nsw <4 x i32> %wide.load18.1_p_scalar_, %wide.load.1_p_scalar_, !dbg !86
  %p_22 = add nsw <4 x i32> %p_12, %p_21, !dbg !66
  %scevgep25 = getelementptr i8, i8* %scevgep24, i64 %42
  %scevgep2526 = bitcast i8* %scevgep25 to <4 x i32>*
  %wide.load.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2526, align 4, !alias.scope !77, !noalias !84
  %scevgep29 = getelementptr i8, i8* %scevgep28, i64 %42
  %scevgep2930 = bitcast i8* %scevgep29 to <4 x i32>*
  %wide.load18.2_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep2930, align 4, !alias.scope !83, !noalias !85
  %p_31 = mul nsw <4 x i32> %wide.load18.2_p_scalar_, %wide.load.2_p_scalar_, !dbg !86
  %p_32 = add nsw <4 x i32> %p_22, %p_31, !dbg !66
  %scevgep35 = getelementptr i8, i8* %scevgep34, i64 %42
  %scevgep3536 = bitcast i8* %scevgep35 to <4 x i32>*
  %wide.load.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3536, align 4, !alias.scope !77, !noalias !84
  %scevgep39 = getelementptr i8, i8* %scevgep38, i64 %42
  %scevgep3940 = bitcast i8* %scevgep39 to <4 x i32>*
  %wide.load18.3_p_scalar_ = load <4 x i32>, <4 x i32>* %scevgep3940, align 4, !alias.scope !83, !noalias !85
  %p_41 = mul nsw <4 x i32> %wide.load18.3_p_scalar_, %wide.load.3_p_scalar_, !dbg !86
  %p_42 = add nsw <4 x i32> %p_32, %p_41, !dbg !66
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond1 = icmp eq i64 %polly.indvar_next5, 64
  br i1 %exitcond1, label %polly.stmt.middle.block5, label %polly.stmt.vector.body4

polly.stmt.vector.body21:                         ; preds = %polly.stmt.vector.body21, %polly.stmt.vector.body21.preheader
  %vec.phi30.phiops.0 = phi <2 x i64> [ zeroinitializer, %polly.stmt.vector.body21.preheader ], [ %p_70, %polly.stmt.vector.body21 ]
  %vec.phi31.phiops.0 = phi <2 x i64> [ zeroinitializer, %polly.stmt.vector.body21.preheader ], [ %p_71, %polly.stmt.vector.body21 ]
  %polly.indvar50 = phi i64 [ 0, %polly.stmt.vector.body21.preheader ], [ %polly.indvar_next51, %polly.stmt.vector.body21 ]
  %43 = shl i64 %polly.indvar50, 5
  %scevgep53 = getelementptr i8, i8* %call2, i64 %43
  %scevgep5354 = bitcast i8* %scevgep53 to <2 x i32>*
  %wide.load36_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep5354, align 4, !alias.scope !73, !noalias !75
  %scevgep56 = getelementptr i8, i8* %scevgep55, i64 %43
  %scevgep5657 = bitcast i8* %scevgep56 to <2 x i32>*
  %wide.load37_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep5657, align 4, !alias.scope !73, !noalias !75
  %p_58 = sext <2 x i32> %wide.load36_p_scalar_ to <2 x i64>, !dbg !87
  %p_59 = sext <2 x i32> %wide.load37_p_scalar_ to <2 x i64>, !dbg !87
  %p_60 = add nsw <2 x i64> %p_58, %vec.phi30.phiops.0, !dbg !60
  %p_61 = add nsw <2 x i64> %p_59, %vec.phi31.phiops.0, !dbg !60
  %scevgep63 = getelementptr i8, i8* %scevgep62, i64 %43
  %scevgep6364 = bitcast i8* %scevgep63 to <2 x i32>*
  %wide.load36.1_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep6364, align 4, !alias.scope !73, !noalias !75
  %scevgep66 = getelementptr i8, i8* %scevgep65, i64 %43
  %scevgep6667 = bitcast i8* %scevgep66 to <2 x i32>*
  %wide.load37.1_p_scalar_ = load <2 x i32>, <2 x i32>* %scevgep6667, align 4, !alias.scope !73, !noalias !75
  %p_68 = sext <2 x i32> %wide.load36.1_p_scalar_ to <2 x i64>, !dbg !87
  %p_69 = sext <2 x i32> %wide.load37.1_p_scalar_ to <2 x i64>, !dbg !87
  %p_70 = add nsw <2 x i64> %p_60, %p_68, !dbg !60
  %p_71 = add nsw <2 x i64> %p_61, %p_69, !dbg !60
  %polly.indvar_next51 = add nuw nsw i64 %polly.indvar50, 1
  %exitcond = icmp eq i64 %polly.indvar_next51, 1280
  br i1 %exitcond, label %polly.exiting, label %polly.stmt.vector.body21
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
!23 = !DILocation(line: 12, column: 11, scope: !8)
!24 = !DILocalVariable(name: "u", scope: !8, file: !1, line: 12, type: !4)
!25 = !DILocation(line: 12, column: 7, scope: !8)
!26 = !DILocation(line: 13, column: 18, scope: !8)
!27 = !DILocation(line: 13, column: 11, scope: !8)
!28 = !DILocalVariable(name: "v", scope: !8, file: !1, line: 13, type: !4)
!29 = !DILocation(line: 13, column: 7, scope: !8)
!30 = !DILocation(line: 14, column: 20, scope: !8)
!31 = !DILocalVariable(name: "r", scope: !8, file: !1, line: 11, type: !6)
!32 = !DILocation(line: 11, column: 12, scope: !8)
!33 = !DILocation(line: 17, column: 2, scope: !34)
!34 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 1)
!35 = distinct !DILexicalBlock(scope: !36, file: !1, line: 17, column: 2)
!36 = distinct !DILexicalBlock(scope: !8, file: !1, line: 17, column: 2)
!37 = !DILocation(line: 20, column: 7, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !1, line: 19, column: 21)
!39 = distinct !DILexicalBlock(scope: !40, file: !1, line: 19, column: 3)
!40 = distinct !DILexicalBlock(scope: !41, file: !1, line: 19, column: 3)
!41 = distinct !DILexicalBlock(scope: !35, file: !1, line: 17, column: 18)
!42 = !DILocation(line: 19, column: 3, scope: !43)
!43 = !DILexicalBlockFile(scope: !39, file: !1, discriminator: 1)
!44 = !DILocation(line: 20, column: 4, scope: !38)
!45 = !DILocation(line: 20, column: 13, scope: !38)
!46 = !DILocation(line: 21, column: 4, scope: !38)
!47 = !DILocation(line: 21, column: 13, scope: !38)
!48 = distinct !{!48, !49, !50}
!49 = !{!"llvm.loop.vectorize.width", i32 1}
!50 = !{!"llvm.loop.interleave.count", i32 1}
!51 = !DILocation(line: 17, column: 15, scope: !52)
!52 = !DILexicalBlockFile(scope: !35, file: !1, discriminator: 2)
!53 = !DILocation(line: 41, column: 3, scope: !54)
!54 = distinct !DILexicalBlock(scope: !55, file: !1, line: 40, column: 19)
!55 = distinct !DILexicalBlock(scope: !8, file: !1, line: 40, column: 5)
!56 = !DILocation(line: 42, column: 3, scope: !54)
!57 = !DILocation(line: 46, column: 2, scope: !8)
!58 = !DILocation(line: 47, column: 2, scope: !8)
!59 = !DILocation(line: 49, column: 2, scope: !8)
!60 = !DILocation(line: 36, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !62, file: !1, line: 35, column: 18)
!62 = distinct !DILexicalBlock(scope: !63, file: !1, line: 35, column: 2)
!63 = distinct !DILexicalBlock(scope: !8, file: !1, line: 35, column: 2)
!64 = !DILocation(line: 40, column: 11, scope: !55)
!65 = !DILocation(line: 40, column: 5, scope: !8)
!66 = !DILocation(line: 29, column: 13, scope: !67)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 27, column: 21)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 27, column: 3)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 27, column: 3)
!70 = distinct !DILexicalBlock(scope: !71, file: !1, line: 25, column: 18)
!71 = distinct !DILexicalBlock(scope: !72, file: !1, line: 25, column: 2)
!72 = distinct !DILexicalBlock(scope: !8, file: !1, line: 25, column: 2)
!73 = distinct !{!73, !74, !"polly.alias.scope.call2"}
!74 = distinct !{!74, !"polly.alias.scope.domain"}
!75 = !{!76, !77, !78, !79, !80, !81, !82, !83}
!76 = distinct !{!76, !74, !"polly.alias.scope."}
!77 = distinct !{!77, !74, !"polly.alias.scope.call"}
!78 = distinct !{!78, !74, !"polly.alias.scope..lcssa45"}
!79 = distinct !{!79, !74, !"polly.alias.scope."}
!80 = distinct !{!80, !74, !"polly.alias.scope.vec.phi30"}
!81 = distinct !{!81, !74, !"polly.alias.scope.vec.phi"}
!82 = distinct !{!82, !74, !"polly.alias.scope.vec.phi31"}
!83 = distinct !{!83, !74, !"polly.alias.scope.call1"}
!84 = !{!76, !78, !79, !80, !81, !82, !73, !83}
!85 = !{!76, !77, !78, !79, !80, !81, !82, !73}
!86 = !DILocation(line: 29, column: 23, scope: !67)
!87 = !DILocation(line: 36, column: 19, scope: !61)
