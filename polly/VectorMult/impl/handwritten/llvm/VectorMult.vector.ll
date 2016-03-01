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
  br label %polly.split_new_and_old

polly.merge_new_and_old:                          ; preds = %polly.exiting29, %polly.loop_exit3
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.merge_new_and_old
  %call15 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #2
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 68719476736, i32 1024, i64 68719476736) #2
  ret i32 0

polly.loop_exit3:                                 ; preds = %vector.body.7
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %3, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %4, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %6, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %7, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %9, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %12, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %16, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %18, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %22, align 16, !alias.scope !4, !noalias !5
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %2, align 16, !alias.scope !1, !noalias !3
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16, !alias.scope !4, !noalias !5
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond28 = icmp eq i64 %polly.indvar_next, 32
  br i1 %exitcond28, label %polly.merge_new_and_old, label %polly.loop_preheader2, !llvm.loop !6

polly.split_new_and_old:                          ; preds = %entry
  br i1 true, label %polly.start, label %polly.loop_preheader2

polly.loop_preheader2:                            ; preds = %polly.split_new_and_old, %polly.loop_exit3
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit3 ], [ 0, %polly.split_new_and_old ]
  %0 = shl i64 %polly.indvar, 5
  %1 = or i64 %0, 28
  %scevgep.7 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %1
  %2 = bitcast i32* %scevgep.7 to <4 x i32>*
  %scevgep25.7 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %1
  %scevgep25 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %0
  %scevgep = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %0
  %3 = bitcast i32* %scevgep to <4 x i32>*
  %4 = bitcast i32* %scevgep25 to <4 x i32>*
  %5 = or i64 %0, 4
  %scevgep25.1 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %5
  %scevgep.1 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %5
  %6 = bitcast i32* %scevgep.1 to <4 x i32>*
  %7 = bitcast i32* %scevgep25.1 to <4 x i32>*
  %8 = or i64 %0, 8
  %scevgep25.2 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %8
  %scevgep.2 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %8
  %9 = bitcast i32* %scevgep.2 to <4 x i32>*
  %10 = bitcast i32* %scevgep25.2 to <4 x i32>*
  %11 = or i64 %0, 12
  %scevgep25.3 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %11
  %scevgep.3 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %11
  %12 = bitcast i32* %scevgep.3 to <4 x i32>*
  %13 = bitcast i32* %scevgep25.3 to <4 x i32>*
  %14 = or i64 %0, 16
  %scevgep25.4 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %14
  %scevgep.4 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %14
  %15 = bitcast i32* %scevgep.4 to <4 x i32>*
  %16 = bitcast i32* %scevgep25.4 to <4 x i32>*
  %17 = or i64 %0, 20
  %scevgep25.5 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %17
  %scevgep.5 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %17
  %18 = bitcast i32* %scevgep.5 to <4 x i32>*
  %19 = bitcast i32* %scevgep25.5 to <4 x i32>*
  %20 = or i64 %0, 24
  %scevgep25.6 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %20
  %scevgep.6 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %20
  %21 = bitcast i32* %scevgep.6 to <4 x i32>*
  %22 = bitcast i32* %scevgep25.6 to <4 x i32>*
  %23 = bitcast i32* %scevgep25.7 to <4 x i32>*
  br label %polly.loop_preheader8

polly.loop_preheader8:                            ; preds = %vector.body.7, %polly.loop_preheader2
  %polly.indvar4 = phi i64 [ 0, %polly.loop_preheader2 ], [ %polly.indvar_next5, %vector.body.7 ]
  br label %polly.loop_preheader14

polly.loop_preheader14:                           ; preds = %polly.loop_preheader8
  br label %vector.body

vector.body:                                      ; preds = %polly.loop_preheader14
  br label %vector.body.1

vector.body.1:                                    ; preds = %vector.body
  br label %vector.body.2

vector.body.2:                                    ; preds = %vector.body.1
  br label %vector.body.3

vector.body.3:                                    ; preds = %vector.body.2
  br label %vector.body.4

vector.body.4:                                    ; preds = %vector.body.3
  br label %vector.body.5

vector.body.5:                                    ; preds = %vector.body.4
  br label %vector.body.6

vector.body.6:                                    ; preds = %vector.body.5
  br label %vector.body.7

vector.body.7:                                    ; preds = %vector.body.6
  %polly.indvar_next5 = add nuw nsw i64 %polly.indvar4, 1
  %exitcond27 = icmp eq i64 %polly.indvar_next5, 2097152
  br i1 %exitcond27, label %polly.loop_exit3, label %polly.loop_preheader8

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.stmt.polly.loop_exit3
  br label %polly.exiting29

polly.exiting29:                                  ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.stmt.polly.loop_exit3, %polly.loop_preheader
  %polly.indvar30 = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next31, %polly.stmt.polly.loop_exit3 ]
  br label %polly.stmt.polly.loop_exit3

polly.stmt.polly.loop_exit3:                      ; preds = %polly.loop_header
  %24 = shl i64 %polly.indvar30, 5
  %scevgep32 = getelementptr [1024 x i32], [1024 x i32]* @u, i64 0, i64 %24
  %scevgep3233 = bitcast i32* %scevgep32 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep3233, align 16, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %scevgep34 = getelementptr [1024 x i32], [1024 x i32]* @v, i64 0, i64 %24
  %scevgep3435 = bitcast i32* %scevgep34 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep3435, align 16, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %25 = shl i64 %polly.indvar30, 5
  %scevgep36 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 4), i64 %25
  %scevgep3637 = bitcast i32* %scevgep36 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep3637, align 16, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %scevgep38 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 4), i64 %25
  %scevgep3839 = bitcast i32* %scevgep38 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep3839, align 16, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %26 = shl i64 %polly.indvar30, 5
  %scevgep40 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 8), i64 %26
  %scevgep4041 = bitcast i32* %scevgep40 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep4041, align 16, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %scevgep42 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 8), i64 %26
  %scevgep4243 = bitcast i32* %scevgep42 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep4243, align 16, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %27 = shl i64 %polly.indvar30, 5
  %scevgep44 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 12), i64 %27
  %scevgep4445 = bitcast i32* %scevgep44 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep4445, align 16, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %scevgep46 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 12), i64 %27
  %scevgep4647 = bitcast i32* %scevgep46 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep4647, align 16, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %28 = shl i64 %polly.indvar30, 5
  %scevgep48 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 16), i64 %28
  %scevgep4849 = bitcast i32* %scevgep48 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep4849, align 16, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %scevgep50 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 16), i64 %28
  %scevgep5051 = bitcast i32* %scevgep50 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5051, align 16, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %29 = shl i64 %polly.indvar30, 5
  %scevgep52 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 20), i64 %29
  %scevgep5253 = bitcast i32* %scevgep52 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5253, align 16, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %scevgep54 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 20), i64 %29
  %scevgep5455 = bitcast i32* %scevgep54 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5455, align 16, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %30 = shl i64 %polly.indvar30, 5
  %scevgep56 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 24), i64 %30
  %scevgep5657 = bitcast i32* %scevgep56 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5657, align 16, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %scevgep58 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 24), i64 %30
  %scevgep5859 = bitcast i32* %scevgep58 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep5859, align 16, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %31 = shl i64 %polly.indvar30, 5
  %scevgep60 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @u, i64 0, i64 28), i64 %31
  %scevgep6061 = bitcast i32* %scevgep60 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep6061, align 16, !alias.scope !7, !noalias !9, !llvm.mem.parallel_loop_access !11
  %scevgep62 = getelementptr i32, i32* getelementptr inbounds ([1024 x i32], [1024 x i32]* @v, i64 0, i64 28), i64 %31
  %scevgep6263 = bitcast i32* %scevgep62 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %scevgep6263, align 16, !alias.scope !10, !noalias !12, !llvm.mem.parallel_loop_access !11
  %32 = add i64 %polly.indvar30, 1
  %p_exitcond28 = icmp eq i64 %32, 32
  %polly.indvar_next31 = add nsw i64 %polly.indvar30, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar30, 30
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit, !llvm.loop !11

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header
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
!6 = distinct !{!6}
!7 = distinct !{!7, !8, !"polly.alias.scope.u"}
!8 = distinct !{!8, !"polly.alias.scope.domain"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"polly.alias.scope.v"}
!11 = distinct !{!11}
!12 = !{!7}
