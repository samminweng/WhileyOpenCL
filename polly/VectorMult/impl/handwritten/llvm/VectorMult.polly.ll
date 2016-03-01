; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [1024 x i32] zeroinitializer, align 16
@v = common global [1024 x i32] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 {
entry:
  br label %polly.loop_preheader2

polly.exiting:                                    ; preds = %polly.loop_exit3
  %call15 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #2
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 68719476736, i32 1024, i64 68719476736) #2
  ret i32 0

polly.loop_exit3:                                 ; preds = %vector.body
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %3, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %4, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %8, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %9, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %14, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %18, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %24, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %28, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %29, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %34, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %38, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %39, align 16, !alias.scope !4, !noalias !5
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond21 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond21, label %polly.exiting, label %polly.loop_preheader2

polly.loop_preheader2:                            ; preds = %polly.loop_exit3, %entry
  %polly.indvar = phi i64 [ 0, %entry ], [ %polly.indvar_next, %polly.loop_exit3 ]
  %0 = shl nsw i64 %polly.indvar, 5
  %1 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %0
  %2 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %0
  %3 = bitcast i32* %1 to <4 x i32>*
  %4 = bitcast i32* %2 to <4 x i32>*
  %5 = or i64 %0, 4
  %6 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %5
  %7 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %5
  %8 = bitcast i32* %6 to <4 x i32>*
  %9 = bitcast i32* %7 to <4 x i32>*
  %10 = or i64 %0, 8
  %11 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %10
  %12 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %10
  %13 = bitcast i32* %11 to <4 x i32>*
  %14 = bitcast i32* %12 to <4 x i32>*
  %15 = or i64 %0, 12
  %16 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %15
  %17 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %15
  %18 = bitcast i32* %16 to <4 x i32>*
  %19 = bitcast i32* %17 to <4 x i32>*
  %20 = or i64 %0, 16
  %21 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %20
  %22 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %20
  %23 = bitcast i32* %21 to <4 x i32>*
  %24 = bitcast i32* %22 to <4 x i32>*
  %25 = or i64 %0, 20
  %26 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %25
  %27 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %25
  %28 = bitcast i32* %26 to <4 x i32>*
  %29 = bitcast i32* %27 to <4 x i32>*
  %30 = or i64 %0, 24
  %31 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %30
  %32 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %30
  %33 = bitcast i32* %31 to <4 x i32>*
  %34 = bitcast i32* %32 to <4 x i32>*
  %35 = or i64 %0, 28
  %36 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %35
  %37 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %35
  %38 = bitcast i32* %36 to <4 x i32>*
  %39 = bitcast i32* %37 to <4 x i32>*
  br label %vector.ph

vector.ph:                                        ; preds = %vector.body, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %vector.body ]
  br label %vector.body

vector.body:                                      ; preds = %vector.ph
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond20 = icmp eq i64 %polly.indvar_next5, 2097152
  br i1 %exitcond20, label %polly.loop_exit3, label %vector.ph
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.u"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4}
!4 = distinct !{!4, !2, !"polly.alias.scope.v"}
!5 = !{!1}
