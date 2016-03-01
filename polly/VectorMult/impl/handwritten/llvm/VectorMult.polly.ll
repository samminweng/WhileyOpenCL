; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [64 x i32] zeroinitializer, align 16
@v = common global [64 x i32] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 {
entry:
  br label %vector.ph

vector.ph:                                        ; preds = %vector.body, %entry
  %polly.indvar4 = phi i64 [ 0, %entry ], [ %polly.indvar_next5, %vector.body ]
  br label %vector.body

vector.body:                                      ; preds = %vector.ph
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond20 = icmp eq i64 %polly.indvar_next5, 8388608
  br i1 %exitcond20, label %vector.ph26.preheader, label %vector.ph

vector.ph26.preheader:                            ; preds = %vector.body
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast ([64 x i32]* @u to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast ([64 x i32]* @v to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 4) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 4) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 8) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 8) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 12) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 12) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 16) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 16) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 20) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 20) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 24) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 24) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 28) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 28) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  br label %vector.ph26

vector.ph26:                                      ; preds = %vector.ph26.preheader, %vector.body22
  %polly.indvar4.1 = phi i64 [ %polly.indvar_next5.1, %vector.body22 ], [ 0, %vector.ph26.preheader ]
  br label %vector.body22

vector.body22:                                    ; preds = %vector.ph26
  %polly.indvar_next5.1 = add nuw nsw i64 %polly.indvar4.1, 1
  %exitcond20.1 = icmp eq i64 %polly.indvar_next5.1, 8388608
  br i1 %exitcond20.1, label %polly.loop_exit3.1, label %vector.ph26

polly.loop_exit3.1:                               ; preds = %vector.body22
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 32) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 32) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 36) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 36) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 40) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 40) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 44) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 44) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 48) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 48) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 52) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 52) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 56) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 56) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 60) to <4 x i32>*), align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 60) to <4 x i32>*), align 16, !alias.scope !4, !noalias !5
  %call15 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #2
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 17179869184, i32 64, i64 17179869184) #2
  ret i32 0
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
