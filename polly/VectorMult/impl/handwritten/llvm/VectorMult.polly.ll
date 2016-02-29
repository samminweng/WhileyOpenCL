; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [1048576 x i32] zeroinitializer, align 16
@v = common global [1048576 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [102 x i8] c"Pass the %'lld vector multiplication test case with local vectors = %d size.\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 65536) #4
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 65536, i32 4, i1 false)
  br label %polly.loop_preheader9

if.then:                                          ; preds = %polly.exiting
  %call27 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #4
  tail call void @exit(i32 -2) #5
  unreachable

if.end:                                           ; preds = %polly.exiting
  %call28 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #4
  %call29 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([102 x i8], [102 x i8]* @.str.2, i64 0, i64 0), i64 17179869184, i32 1048576, i64 17179869184) #4
  ret i32 0

polly.exiting:                                    ; preds = %polly.stmt.for.inc22
  %p_add21.3.lcssa = phi i64 [ %p_add21.3, %polly.stmt.for.inc22 ]
  %cmp25 = icmp eq i64 %p_add21.3.lcssa, 17179869184
  br i1 %cmp25, label %if.end, label %if.then

polly.loop_exit10:                                ; preds = %polly.loop_exit16
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond42 = icmp eq i64 %polly.indvar_next6, 32768
  br i1 %exitcond42, label %polly.stmt.for.inc22.preheader, label %polly.loop_preheader9

polly.stmt.for.inc22.preheader:                   ; preds = %polly.loop_exit10
  br label %polly.stmt.for.inc22

polly.loop_exit16:                                ; preds = %polly.loop_exit22
  %polly.indvar_next12 = add nuw nsw i64 %polly.indvar11, 1
  %exitcond41 = icmp eq i64 %polly.indvar_next12, 512
  br i1 %exitcond41, label %polly.loop_exit10, label %polly.loop_preheader15

polly.loop_preheader9:                            ; preds = %polly.loop_exit10, %entry
  %polly.indvar5 = phi i64 [ %polly.indvar_next6, %polly.loop_exit10 ], [ 0, %entry ]
  %0 = shl nsw i64 %polly.indvar5, 5
  br label %polly.loop_preheader15

polly.loop_exit22:                                ; preds = %polly.loop_header20
  %scevgep27 = getelementptr [1048576 x i32], [1048576 x i32]* @v, i64 0, i64 %10
  store i32 1, i32* %scevgep26, align 4, !alias.scope !1, !noalias !3
  store i32 1, i32* %scevgep27, align 4, !alias.scope !4, !noalias !8
  %polly.indvar_next18 = add nuw nsw i64 %polly.indvar17, 1
  %exitcond40 = icmp eq i64 %polly.indvar_next18, 32
  br i1 %exitcond40, label %polly.loop_exit16, label %polly.loop_preheader21

polly.loop_preheader15:                           ; preds = %polly.loop_exit16, %polly.loop_preheader9
  %polly.indvar11 = phi i64 [ 0, %polly.loop_preheader9 ], [ %polly.indvar_next12, %polly.loop_exit16 ]
  %1 = shl i64 %polly.indvar11, 5
  br label %polly.loop_preheader21

polly.loop_header20:                              ; preds = %polly.loop_header20, %polly.loop_preheader21
  %polly.indvar23 = phi i64 [ 0, %polly.loop_preheader21 ], [ %polly.indvar_next24.3, %polly.loop_header20 ]
  %2 = add nuw nsw i64 %polly.indvar23, %1
  %3 = shl i64 %2, 2
  %scevgep28 = getelementptr i8, i8* %call, i64 %3
  %scevgep2829 = bitcast i8* %scevgep28 to i32*
  %_p_scalar_ = load i32, i32* %scevgep2829, align 4, !alias.scope !7, !noalias !9
  %p_add = add nsw i32 %_p_scalar_, 1
  store i32 %p_add, i32* %scevgep2829, align 4, !alias.scope !7, !noalias !9
  %polly.indvar_next24 = or i64 %polly.indvar23, 1
  %4 = add nuw nsw i64 %polly.indvar_next24, %1
  %5 = shl i64 %4, 2
  %scevgep28.1 = getelementptr i8, i8* %call, i64 %5
  %scevgep2829.1 = bitcast i8* %scevgep28.1 to i32*
  %_p_scalar_.1 = load i32, i32* %scevgep2829.1, align 4, !alias.scope !7, !noalias !9
  %p_add.1 = add nsw i32 %_p_scalar_.1, 1
  store i32 %p_add.1, i32* %scevgep2829.1, align 4, !alias.scope !7, !noalias !9
  %polly.indvar_next24.1 = or i64 %polly.indvar23, 2
  %6 = add nuw nsw i64 %polly.indvar_next24.1, %1
  %7 = shl i64 %6, 2
  %scevgep28.2 = getelementptr i8, i8* %call, i64 %7
  %scevgep2829.2 = bitcast i8* %scevgep28.2 to i32*
  %_p_scalar_.2 = load i32, i32* %scevgep2829.2, align 4, !alias.scope !7, !noalias !9
  %p_add.2 = add nsw i32 %_p_scalar_.2, 1
  store i32 %p_add.2, i32* %scevgep2829.2, align 4, !alias.scope !7, !noalias !9
  %polly.indvar_next24.2 = or i64 %polly.indvar23, 3
  %8 = add nuw nsw i64 %polly.indvar_next24.2, %1
  %9 = shl i64 %8, 2
  %scevgep28.3 = getelementptr i8, i8* %call, i64 %9
  %scevgep2829.3 = bitcast i8* %scevgep28.3 to i32*
  %_p_scalar_.3 = load i32, i32* %scevgep2829.3, align 4, !alias.scope !7, !noalias !9
  %p_add.3 = add nsw i32 %_p_scalar_.3, 1
  store i32 %p_add.3, i32* %scevgep2829.3, align 4, !alias.scope !7, !noalias !9
  %polly.indvar_next24.3 = add nsw i64 %polly.indvar23, 4
  %exitcond39.3 = icmp eq i64 %polly.indvar_next24.3, 32
  br i1 %exitcond39.3, label %polly.loop_exit22, label %polly.loop_header20

polly.loop_preheader21:                           ; preds = %polly.loop_exit22, %polly.loop_preheader15
  %polly.indvar17 = phi i64 [ 0, %polly.loop_preheader15 ], [ %polly.indvar_next18, %polly.loop_exit22 ]
  %10 = add nuw nsw i64 %polly.indvar17, %0
  %scevgep26 = getelementptr [1048576 x i32], [1048576 x i32]* @u, i64 0, i64 %10
  br label %polly.loop_header20

polly.stmt.for.inc22:                             ; preds = %polly.stmt.for.inc22, %polly.stmt.for.inc22.preheader
  %sum.02.phiops.0 = phi i64 [ 0, %polly.stmt.for.inc22.preheader ], [ %p_add21.3, %polly.stmt.for.inc22 ]
  %polly.indvar33 = phi i64 [ 0, %polly.stmt.for.inc22.preheader ], [ %polly.indvar_next34.3, %polly.stmt.for.inc22 ]
  %11 = shl i64 %polly.indvar33, 2
  %scevgep36 = getelementptr i8, i8* %call, i64 %11
  %scevgep3637 = bitcast i8* %scevgep36 to i32*
  %_p_scalar_38 = load i32, i32* %scevgep3637, align 4, !alias.scope !7, !noalias !9
  %p_conv = sext i32 %_p_scalar_38 to i64
  %p_add21 = add nsw i64 %p_conv, %sum.02.phiops.0
  %polly.indvar_next34 = shl i64 %polly.indvar33, 2
  %12 = or i64 %polly.indvar_next34, 4
  %scevgep36.1 = getelementptr i8, i8* %call, i64 %12
  %scevgep3637.1 = bitcast i8* %scevgep36.1 to i32*
  %_p_scalar_38.1 = load i32, i32* %scevgep3637.1, align 4, !alias.scope !7, !noalias !9
  %p_conv.1 = sext i32 %_p_scalar_38.1 to i64
  %p_add21.1 = add nsw i64 %p_conv.1, %p_add21
  %polly.indvar_next34.1 = shl i64 %polly.indvar33, 2
  %13 = or i64 %polly.indvar_next34.1, 8
  %scevgep36.2 = getelementptr i8, i8* %call, i64 %13
  %scevgep3637.2 = bitcast i8* %scevgep36.2 to i32*
  %_p_scalar_38.2 = load i32, i32* %scevgep3637.2, align 4, !alias.scope !7, !noalias !9
  %p_conv.2 = sext i32 %_p_scalar_38.2 to i64
  %p_add21.2 = add nsw i64 %p_conv.2, %p_add21.1
  %polly.indvar_next34.2 = shl i64 %polly.indvar33, 2
  %14 = or i64 %polly.indvar_next34.2, 12
  %scevgep36.3 = getelementptr i8, i8* %call, i64 %14
  %scevgep3637.3 = bitcast i8* %scevgep36.3 to i32*
  %_p_scalar_38.3 = load i32, i32* %scevgep3637.3, align 4, !alias.scope !7, !noalias !9
  %p_conv.3 = sext i32 %_p_scalar_38.3 to i64
  %p_add21.3 = add nsw i64 %p_conv.3, %p_add21.2
  %polly.indvar_next34.3 = add nsw i64 %polly.indvar33, 4
  %exitcond.3 = icmp eq i64 %polly.indvar_next34.3, 16384
  br i1 %exitcond.3, label %polly.exiting, label %polly.stmt.for.inc22
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

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
!1 = distinct !{!1, !2, !"polly.alias.scope.u"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4, !5, !6, !7}
!4 = distinct !{!4, !2, !"polly.alias.scope.v"}
!5 = distinct !{!5, !2, !"polly.alias.scope.add21"}
!6 = distinct !{!6, !2, !"polly.alias.scope.sum.02"}
!7 = distinct !{!7, !2, !"polly.alias.scope.call"}
!8 = !{!5, !1, !6, !7}
!9 = !{!4, !5, !1, !6}
