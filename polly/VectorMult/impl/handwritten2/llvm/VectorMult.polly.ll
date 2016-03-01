; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [1024 x i32] zeroinitializer, align 16
@v = common global [1024 x i32] zeroinitializer, align 16
@p = common global [1024 x i32] zeroinitializer, align 16
@sum = common global [67108864 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 {
entry:
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.7, %vector.body ]
  %0 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index
  %1 = bitcast i32* %0 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %1, align 16, !alias.scope !1, !noalias !3
  %2 = getelementptr i32, i32* %0, i64 4
  %3 = bitcast i32* %2 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %3, align 16, !alias.scope !1, !noalias !3
  %index.next = or i64 %index, 8
  %4 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next
  %5 = bitcast i32* %4 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %5, align 16, !alias.scope !1, !noalias !3
  %6 = getelementptr i32, i32* %4, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %7, align 16, !alias.scope !1, !noalias !3
  %index.next.1 = or i64 %index, 16
  %8 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.1
  %9 = bitcast i32* %8 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %9, align 16, !alias.scope !1, !noalias !3
  %10 = getelementptr i32, i32* %8, i64 4
  %11 = bitcast i32* %10 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %11, align 16, !alias.scope !1, !noalias !3
  %index.next.2 = or i64 %index, 24
  %12 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.2
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %13, align 16, !alias.scope !1, !noalias !3
  %14 = getelementptr i32, i32* %12, i64 4
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %15, align 16, !alias.scope !1, !noalias !3
  %index.next.3 = or i64 %index, 32
  %16 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.3
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %17, align 16, !alias.scope !1, !noalias !3
  %18 = getelementptr i32, i32* %16, i64 4
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %19, align 16, !alias.scope !1, !noalias !3
  %index.next.4 = or i64 %index, 40
  %20 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.4
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %21, align 16, !alias.scope !1, !noalias !3
  %22 = getelementptr i32, i32* %20, i64 4
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %23, align 16, !alias.scope !1, !noalias !3
  %index.next.5 = or i64 %index, 48
  %24 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.5
  %25 = bitcast i32* %24 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %25, align 16, !alias.scope !1, !noalias !3
  %26 = getelementptr i32, i32* %24, i64 4
  %27 = bitcast i32* %26 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %27, align 16, !alias.scope !1, !noalias !3
  %index.next.6 = or i64 %index, 56
  %28 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next.6
  %29 = bitcast i32* %28 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %29, align 16, !alias.scope !1, !noalias !3
  %30 = getelementptr i32, i32* %28, i64 4
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1024, i32 1024, i32 1024, i32 1024>, <4 x i32>* %31, align 16, !alias.scope !1, !noalias !3
  %index.next.7 = add nsw i64 %index, 64
  %32 = icmp eq i64 %index.next.7, 67108864
  br i1 %32, label %polly.loop_preheader8.preheader, label %vector.body, !llvm.loop !9

polly.loop_preheader8.preheader:                  ; preds = %vector.body
  br label %polly.loop_preheader8

if.then:                                          ; preds = %middle.block56
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #3
  tail call void @exit(i32 -2) #4
  unreachable

if.end:                                           ; preds = %middle.block56
  %call29 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #3
  %call30 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 68719476736, i32 1024, i64 68719476736) #3
  ret i32 0

polly.loop_exit9:                                 ; preds = %vector.body41
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %55, align 16, !alias.scope !6, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %56, align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %57, align 16, !alias.scope !7, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %62, align 16, !alias.scope !6, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %63, align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %64, align 16, !alias.scope !7, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %69, align 16, !alias.scope !6, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %70, align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %71, align 16, !alias.scope !7, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %76, align 16, !alias.scope !6, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %77, align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %78, align 16, !alias.scope !7, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %83, align 16, !alias.scope !6, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %84, align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %85, align 16, !alias.scope !7, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %90, align 16, !alias.scope !6, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %91, align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %92, align 16, !alias.scope !7, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %97, align 16, !alias.scope !6, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %98, align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %99, align 16, !alias.scope !7, !noalias !14
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %104, align 16, !alias.scope !6, !noalias !12
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %105, align 16, !alias.scope !5, !noalias !13
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %106, align 16, !alias.scope !7, !noalias !14
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond38 = icmp eq i64 %polly.indvar_next5, 32
  br i1 %exitcond38, label %vector.body55.preheader, label %polly.loop_preheader8

vector.body55.preheader:                          ; preds = %polly.loop_exit9
  br label %vector.body55

vector.body55:                                    ; preds = %vector.body55, %vector.body55.preheader
  %index60 = phi i64 [ 0, %vector.body55.preheader ], [ %index.next61.1, %vector.body55 ]
  %vec.phi = phi <2 x i64> [ zeroinitializer, %vector.body55.preheader ], [ %47, %vector.body55 ]
  %vec.phi64 = phi <2 x i64> [ zeroinitializer, %vector.body55.preheader ], [ %48, %vector.body55 ]
  %33 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index60
  %34 = bitcast i32* %33 to <2 x i32>*
  %wide.load = load <2 x i32>, <2 x i32>* %34, align 16, !alias.scope !1, !noalias !3
  %35 = getelementptr i32, i32* %33, i64 2
  %36 = bitcast i32* %35 to <2 x i32>*
  %wide.load69 = load <2 x i32>, <2 x i32>* %36, align 8, !alias.scope !1, !noalias !3
  %37 = sext <2 x i32> %wide.load to <2 x i64>
  %38 = sext <2 x i32> %wide.load69 to <2 x i64>
  %39 = add nsw <2 x i64> %37, %vec.phi
  %40 = add nsw <2 x i64> %38, %vec.phi64
  %index.next61 = or i64 %index60, 4
  %41 = getelementptr [67108864 x i32], [67108864 x i32]* @sum, i64 0, i64 %index.next61
  %42 = bitcast i32* %41 to <2 x i32>*
  %wide.load.1 = load <2 x i32>, <2 x i32>* %42, align 16, !alias.scope !1, !noalias !3
  %43 = getelementptr i32, i32* %41, i64 2
  %44 = bitcast i32* %43 to <2 x i32>*
  %wide.load69.1 = load <2 x i32>, <2 x i32>* %44, align 8, !alias.scope !1, !noalias !3
  %45 = sext <2 x i32> %wide.load.1 to <2 x i64>
  %46 = sext <2 x i32> %wide.load69.1 to <2 x i64>
  %47 = add nsw <2 x i64> %45, %39
  %48 = add nsw <2 x i64> %46, %40
  %index.next61.1 = add nsw i64 %index60, 8
  %49 = icmp eq i64 %index.next61.1, 67108864
  br i1 %49, label %middle.block56, label %vector.body55, !llvm.loop !15

middle.block56:                                   ; preds = %vector.body55
  %.lcssa72 = phi <2 x i64> [ %48, %vector.body55 ]
  %.lcssa = phi <2 x i64> [ %47, %vector.body55 ]
  %bin.rdx = add <2 x i64> %.lcssa72, %.lcssa
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx70 = add <2 x i64> %bin.rdx, %rdx.shuf
  %50 = extractelement <2 x i64> %bin.rdx70, i32 0
  %cmp27 = icmp eq i64 %50, 68719476736
  br i1 %cmp27, label %if.end, label %if.then

polly.loop_preheader8:                            ; preds = %polly.loop_preheader8.preheader, %polly.loop_exit9
  %polly.indvar4 = phi i64 [ %polly.indvar_next5, %polly.loop_exit9 ], [ 0, %polly.loop_preheader8.preheader ]
  %51 = shl nsw i64 %polly.indvar4, 5
  %52 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %51
  %53 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %51
  %54 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %51
  %55 = bitcast i32* %53 to <4 x i32>*
  %56 = bitcast i32* %52 to <4 x i32>*
  %57 = bitcast i32* %54 to <4 x i32>*
  %58 = or i64 %51, 4
  %59 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %58
  %60 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %58
  %61 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %58
  %62 = bitcast i32* %60 to <4 x i32>*
  %63 = bitcast i32* %59 to <4 x i32>*
  %64 = bitcast i32* %61 to <4 x i32>*
  %65 = or i64 %51, 8
  %66 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %65
  %67 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %65
  %68 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %65
  %69 = bitcast i32* %67 to <4 x i32>*
  %70 = bitcast i32* %66 to <4 x i32>*
  %71 = bitcast i32* %68 to <4 x i32>*
  %72 = or i64 %51, 12
  %73 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %72
  %74 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %72
  %75 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %72
  %76 = bitcast i32* %74 to <4 x i32>*
  %77 = bitcast i32* %73 to <4 x i32>*
  %78 = bitcast i32* %75 to <4 x i32>*
  %79 = or i64 %51, 16
  %80 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %79
  %81 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %79
  %82 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %79
  %83 = bitcast i32* %81 to <4 x i32>*
  %84 = bitcast i32* %80 to <4 x i32>*
  %85 = bitcast i32* %82 to <4 x i32>*
  %86 = or i64 %51, 20
  %87 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %86
  %88 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %86
  %89 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %86
  %90 = bitcast i32* %88 to <4 x i32>*
  %91 = bitcast i32* %87 to <4 x i32>*
  %92 = bitcast i32* %89 to <4 x i32>*
  %93 = or i64 %51, 24
  %94 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %93
  %95 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %93
  %96 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %93
  %97 = bitcast i32* %95 to <4 x i32>*
  %98 = bitcast i32* %94 to <4 x i32>*
  %99 = bitcast i32* %96 to <4 x i32>*
  %100 = or i64 %51, 28
  %101 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %100
  %102 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %100
  %103 = getelementptr [1024 x i32], [1024 x i32]* @p, i64 0, i64 %100
  %104 = bitcast i32* %102 to <4 x i32>*
  %105 = bitcast i32* %101 to <4 x i32>*
  %106 = bitcast i32* %103 to <4 x i32>*
  br label %vector.ph45

vector.ph45:                                      ; preds = %vector.body41, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %vector.body41 ]
  br label %vector.body41

vector.body41:                                    ; preds = %vector.ph45
  %polly.indvar_next11 = add nuw nsw i64 %polly.indvar10, 1
  %exitcond37 = icmp eq i64 %polly.indvar_next11, 2097152
  br i1 %exitcond37, label %polly.loop_exit9, label %vector.ph45
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.sum"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4, !5, !6, !7, !8}
!4 = distinct !{!4, !2, !"polly.alias.scope.add23"}
!5 = distinct !{!5, !2, !"polly.alias.scope.v"}
!6 = distinct !{!6, !2, !"polly.alias.scope.u"}
!7 = distinct !{!7, !2, !"polly.alias.scope.p"}
!8 = distinct !{!8, !2, !"polly.alias.scope.total.02"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = !{!4, !5, !7, !1, !8}
!13 = !{!4, !6, !7, !1, !8}
!14 = !{!4, !5, !6, !1, !8}
!15 = distinct !{!15, !10, !11}
