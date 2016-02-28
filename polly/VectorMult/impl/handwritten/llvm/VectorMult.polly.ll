; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@p = common global [65536 x i32] zeroinitializer, align 16
@u = common global [65536 x i32] zeroinitializer, align 16
@v = common global [65536 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [76 x i8] c"Pass the %'d X %'d vector multiplication test case with dot Product = %'lld\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 {
entry:
  call void @llvm.memset.p0i8.i64(i8* bitcast ([65536 x i32]* @p to i8*), i8 0, i64 262144, i32 16, i1 false)
  br label %polly.loop_preheader8

if.then:                                          ; preds = %middle.block44
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4
  tail call void @exit(i32 -2) #5
  unreachable

if.end:                                           ; preds = %middle.block44
  %call30 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4
  %call31 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.2, i64 0, i64 0), i32 65536, i32 65536, i64 4294967296) #4
  ret i32 0

polly.loop_exit9:                                 ; preds = %polly.loop_exit15
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond39 = icmp eq i64 %polly.indvar_next5, 2048
  br i1 %exitcond39, label %vector.body43.preheader, label %polly.loop_preheader8

vector.body43.preheader:                          ; preds = %polly.loop_exit9
  br label %vector.body43

vector.body43:                                    ; preds = %vector.body43, %vector.body43.preheader
  %index48 = phi i64 [ 0, %vector.body43.preheader ], [ %index.next49.1, %vector.body43 ]
  %vec.phi = phi <2 x i64> [ zeroinitializer, %vector.body43.preheader ], [ %14, %vector.body43 ]
  %vec.phi52 = phi <2 x i64> [ zeroinitializer, %vector.body43.preheader ], [ %15, %vector.body43 ]
  %0 = getelementptr [65536 x i32], [65536 x i32]* @p, i64 0, i64 %index48
  %1 = bitcast i32* %0 to <2 x i32>*
  %wide.load57 = load <2 x i32>, <2 x i32>* %1, align 16, !alias.scope !1, !noalias !3
  %2 = getelementptr i32, i32* %0, i64 2
  %3 = bitcast i32* %2 to <2 x i32>*
  %wide.load58 = load <2 x i32>, <2 x i32>* %3, align 8, !alias.scope !1, !noalias !3
  %4 = sext <2 x i32> %wide.load57 to <2 x i64>
  %5 = sext <2 x i32> %wide.load58 to <2 x i64>
  %6 = add nsw <2 x i64> %4, %vec.phi
  %7 = add nsw <2 x i64> %5, %vec.phi52
  %index.next49 = or i64 %index48, 4
  %8 = getelementptr [65536 x i32], [65536 x i32]* @p, i64 0, i64 %index.next49
  %9 = bitcast i32* %8 to <2 x i32>*
  %wide.load57.1 = load <2 x i32>, <2 x i32>* %9, align 16, !alias.scope !1, !noalias !3
  %10 = getelementptr i32, i32* %8, i64 2
  %11 = bitcast i32* %10 to <2 x i32>*
  %wide.load58.1 = load <2 x i32>, <2 x i32>* %11, align 8, !alias.scope !1, !noalias !3
  %12 = sext <2 x i32> %wide.load57.1 to <2 x i64>
  %13 = sext <2 x i32> %wide.load58.1 to <2 x i64>
  %14 = add nsw <2 x i64> %12, %6
  %15 = add nsw <2 x i64> %13, %7
  %index.next49.1 = add nsw i64 %index48, 8
  %16 = icmp eq i64 %index.next49.1, 65536
  br i1 %16, label %middle.block44, label %vector.body43, !llvm.loop !8

middle.block44:                                   ; preds = %vector.body43
  %.lcssa61 = phi <2 x i64> [ %15, %vector.body43 ]
  %.lcssa = phi <2 x i64> [ %14, %vector.body43 ]
  %bin.rdx = add <2 x i64> %.lcssa61, %.lcssa
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx59 = add <2 x i64> %bin.rdx, %rdx.shuf
  %17 = extractelement <2 x i64> %bin.rdx59, i32 0
  %cmp28 = icmp eq i64 %17, 4294967296
  br i1 %cmp28, label %if.end, label %if.then

polly.loop_exit15:                                ; preds = %vector.body
  %.lcssa84 = phi <4 x i32> [ %51, %vector.body ]
  %.lcssa81 = phi <4 x i32> [ %50, %vector.body ]
  %.lcssa78 = phi <4 x i32> [ %49, %vector.body ]
  %.lcssa75 = phi <4 x i32> [ %48, %vector.body ]
  %.lcssa72 = phi <4 x i32> [ %47, %vector.body ]
  %.lcssa69 = phi <4 x i32> [ %46, %vector.body ]
  %.lcssa66 = phi <4 x i32> [ %45, %vector.body ]
  %.lcssa63 = phi <4 x i32> [ %44, %vector.body ]
  store <4 x i32> %.lcssa63, <4 x i32>* %21, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> %.lcssa66, <4 x i32>* %24, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> %.lcssa69, <4 x i32>* %27, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> %.lcssa72, <4 x i32>* %30, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> %.lcssa75, <4 x i32>* %33, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> %.lcssa78, <4 x i32>* %36, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> %.lcssa81, <4 x i32>* %39, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> %.lcssa84, <4 x i32>* %42, align 16, !alias.scope !1, !noalias !3
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond38 = icmp eq i64 %polly.indvar_next11, 2048
  br i1 %exitcond38, label %polly.loop_exit9, label %polly.loop_preheader14

polly.loop_preheader8:                            ; preds = %polly.loop_exit9, %entry
  %polly.indvar4 = phi i64 [ %polly.indvar_next5, %polly.loop_exit9 ], [ 0, %entry ]
  %18 = shl nsw i64 %polly.indvar4, 5
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %polly.loop_exit15, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %polly.loop_exit15 ]
  %19 = shl i64 %polly.indvar10, 5
  %20 = getelementptr [65536 x i32], [65536 x i32]* @p, i64 0, i64 %19
  %21 = bitcast i32* %20 to <4 x i32>*
  %22 = or i64 %19, 4
  %23 = getelementptr [65536 x i32], [65536 x i32]* @p, i64 0, i64 %22
  %24 = bitcast i32* %23 to <4 x i32>*
  %25 = or i64 %19, 8
  %26 = getelementptr [65536 x i32], [65536 x i32]* @p, i64 0, i64 %25
  %27 = bitcast i32* %26 to <4 x i32>*
  %28 = or i64 %19, 12
  %29 = getelementptr [65536 x i32], [65536 x i32]* @p, i64 0, i64 %28
  %30 = bitcast i32* %29 to <4 x i32>*
  %31 = or i64 %19, 16
  %32 = getelementptr [65536 x i32], [65536 x i32]* @p, i64 0, i64 %31
  %33 = bitcast i32* %32 to <4 x i32>*
  %34 = or i64 %19, 20
  %35 = getelementptr [65536 x i32], [65536 x i32]* @p, i64 0, i64 %34
  %36 = bitcast i32* %35 to <4 x i32>*
  %37 = or i64 %19, 24
  %38 = getelementptr [65536 x i32], [65536 x i32]* @p, i64 0, i64 %37
  %39 = bitcast i32* %38 to <4 x i32>*
  %40 = or i64 %19, 28
  %41 = getelementptr [65536 x i32], [65536 x i32]* @p, i64 0, i64 %40
  %42 = bitcast i32* %41 to <4 x i32>*
  %.promoted = load <4 x i32>, <4 x i32>* %21, align 16, !alias.scope !1, !noalias !3
  %.promoted64 = load <4 x i32>, <4 x i32>* %24, align 16, !alias.scope !1, !noalias !3
  %.promoted67 = load <4 x i32>, <4 x i32>* %27, align 16, !alias.scope !1, !noalias !3
  %.promoted70 = load <4 x i32>, <4 x i32>* %30, align 16, !alias.scope !1, !noalias !3
  %.promoted73 = load <4 x i32>, <4 x i32>* %33, align 16, !alias.scope !1, !noalias !3
  %.promoted76 = load <4 x i32>, <4 x i32>* %36, align 16, !alias.scope !1, !noalias !3
  %.promoted79 = load <4 x i32>, <4 x i32>* %39, align 16, !alias.scope !1, !noalias !3
  %.promoted82 = load <4 x i32>, <4 x i32>* %42, align 16, !alias.scope !1, !noalias !3
  br label %polly.loop_preheader20

polly.loop_preheader20:                           ; preds = %vector.body, %polly.loop_preheader14
  %wide.load.783 = phi <4 x i32> [ %.promoted82, %polly.loop_preheader14 ], [ %51, %vector.body ]
  %wide.load.680 = phi <4 x i32> [ %.promoted79, %polly.loop_preheader14 ], [ %50, %vector.body ]
  %wide.load.577 = phi <4 x i32> [ %.promoted76, %polly.loop_preheader14 ], [ %49, %vector.body ]
  %wide.load.474 = phi <4 x i32> [ %.promoted73, %polly.loop_preheader14 ], [ %48, %vector.body ]
  %wide.load.371 = phi <4 x i32> [ %.promoted70, %polly.loop_preheader14 ], [ %47, %vector.body ]
  %wide.load.268 = phi <4 x i32> [ %.promoted67, %polly.loop_preheader14 ], [ %46, %vector.body ]
  %wide.load.165 = phi <4 x i32> [ %.promoted64, %polly.loop_preheader14 ], [ %45, %vector.body ]
  %wide.load62 = phi <4 x i32> [ %.promoted, %polly.loop_preheader14 ], [ %44, %vector.body ]
  %polly.indvar16 = phi i64 [ 0, %polly.loop_preheader14 ], [ %polly.indvar_next17, %vector.body ]
  %43 = add nuw nsw i64 %polly.indvar16, %18
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader20
  %scevgep25 = getelementptr [65536 x i32], [65536 x i32]* @u, i64 0, i64 %43
  %44 = add nsw <4 x i32> %wide.load62, <i32 1, i32 1, i32 1, i32 1>
  %45 = add nsw <4 x i32> %wide.load.165, <i32 1, i32 1, i32 1, i32 1>
  %46 = add nsw <4 x i32> %wide.load.268, <i32 1, i32 1, i32 1, i32 1>
  %47 = add nsw <4 x i32> %wide.load.371, <i32 1, i32 1, i32 1, i32 1>
  %48 = add nsw <4 x i32> %wide.load.474, <i32 1, i32 1, i32 1, i32 1>
  %49 = add nsw <4 x i32> %wide.load.577, <i32 1, i32 1, i32 1, i32 1>
  %50 = add nsw <4 x i32> %wide.load.680, <i32 1, i32 1, i32 1, i32 1>
  %51 = add nsw <4 x i32> %wide.load.783, <i32 1, i32 1, i32 1, i32 1>
  %scevgep26 = getelementptr [65536 x i32], [65536 x i32]* @v, i64 0, i64 %43
  store i32 1, i32* %scevgep25, align 4, !alias.scope !7, !noalias !11
  store i32 1, i32* %scevgep26, align 4, !alias.scope !4, !noalias !12
  %polly.indvar_next17 = add nuw nsw i64 %polly.indvar16, 1
  %exitcond37 = icmp eq i64 %polly.indvar_next17, 32
  br i1 %exitcond37, label %polly.loop_exit15, label %polly.loop_preheader20
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.p"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4, !5, !6, !7}
!4 = distinct !{!4, !2, !"polly.alias.scope.v"}
!5 = distinct !{!5, !2, !"polly.alias.scope.sum.02"}
!6 = distinct !{!6, !2, !"polly.alias.scope.add24"}
!7 = distinct !{!7, !2, !"polly.alias.scope.u"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = !{!4, !5, !6, !1}
!12 = !{!5, !6, !7, !1}
