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
  %r.03 = phi i64 [ 0, %entry ], [ %inc11, %vector.body ]
  br label %vector.body

vector.body:                                      ; preds = %vector.ph
  %inc11 = add nuw nsw i64 %r.03, 1
  %exitcond5 = icmp eq i64 %inc11, 1073741824
  br i1 %exitcond5, label %if.end, label %vector.ph

if.end:                                           ; preds = %vector.body
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast ([64 x i32]* @u to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast ([64 x i32]* @v to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 4) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 4) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 8) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 8) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 12) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 12) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 16) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 16) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 20) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 20) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 24) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 24) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 28) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 28) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 32) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 32) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 36) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 36) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 40) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 40) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 44) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 44) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 48) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 48) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 52) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 52) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 56) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 56) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @u, i64 0, i64 60) to <4 x i32>*), align 16
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* bitcast (i32* getelementptr inbounds ([64 x i32], [64 x i32]* @v, i64 0, i64 60) to <4 x i32>*), align 16
  %call15 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #2
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 68719476736, i32 64, i64 68719476736) #2
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 3f10def1e46ea783186be08e2138d0f76a707712) (http://llvm.org/git/llvm.git 626ceb277f4fd20c1899e04490b0ea6c2b1a0da8)"}
