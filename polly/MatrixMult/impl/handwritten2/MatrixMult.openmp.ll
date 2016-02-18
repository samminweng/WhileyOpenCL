; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [49 x i8] c"Pass %d X %d matrix test case (C[N][N] =%lld) \0A \00", align 1

; Function Attrs: nounwind uwtable
define i64* @init_array(i64 %value) #0 {
entry:
  %call = call noalias i8* @malloc(i64 8388608) #4
  %0 = bitcast i8* %call to i64*
  br label %for.cond

for.cond:                                         ; preds = %for.inc20, %entry
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc20 ], [ 0, %entry ]
  %exitcond = icmp ne i64 %indvars.iv8, 1024
  br i1 %exitcond, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body ]
  %cmp2 = icmp slt i64 %indvars.iv, 1024
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %1 = mul nuw nsw i64 %indvars.iv8, 1024
  %2 = add nuw nsw i64 %1, %indvars.iv
  %arrayidx = getelementptr inbounds i64, i64* %0, i64 %2
  store i64 %value, i64* %arrayidx, align 8
  %3 = mul nuw nsw i64 %indvars.iv8, 1024
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = add nuw nsw i64 %4, 1
  %arrayidx8 = getelementptr inbounds i64, i64* %0, i64 %5
  store i64 %value, i64* %arrayidx8, align 8
  %6 = mul nuw nsw i64 %indvars.iv8, 1024
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = add nuw nsw i64 %7, 2
  %arrayidx13 = getelementptr inbounds i64, i64* %0, i64 %8
  store i64 %value, i64* %arrayidx13, align 8
  %9 = mul nuw nsw i64 %indvars.iv8, 1024
  %10 = add nuw nsw i64 %9, %indvars.iv
  %11 = add nuw nsw i64 %10, 3
  %arrayidx18 = getelementptr inbounds i64, i64* %0, i64 %11
  store i64 %value, i64* %arrayidx18, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc20

for.inc20:                                        ; preds = %for.end
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  br label %for.cond

for.end21:                                        ; preds = %for.cond
  ret i64* %0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #2 {
entry:
  %add14.s2a = alloca i64
  %tmp.0.lcssa.phiops = alloca i64
  %tmp.0.s2a = alloca i64
  %tmp.0.phiops = alloca i64
  %call = call i64* @init_array(i64 1)
  %call1 = call i64* @init_array(i64 1)
  %call2 = call i64* @init_array(i64 0)
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %entry
  %polly.access.call = getelementptr i64, i64* %call, i64 1048576
  %polly.access.call2 = getelementptr i64, i64* %call2, i64 0
  %0 = icmp ule i64* %polly.access.call, %polly.access.call2
  %polly.access.call21 = getelementptr i64, i64* %call2, i64 1048576
  %polly.access.call3 = getelementptr i64, i64* %call, i64 0
  %1 = icmp ule i64* %polly.access.call21, %polly.access.call3
  %2 = or i1 %0, %1
  %3 = and i1 true, %2
  %polly.access.call1 = getelementptr i64, i64* %call1, i64 1048576
  %polly.access.call24 = getelementptr i64, i64* %call2, i64 0
  %4 = icmp ule i64* %polly.access.call1, %polly.access.call24
  %polly.access.call25 = getelementptr i64, i64* %call2, i64 1048576
  %polly.access.call16 = getelementptr i64, i64* %call1, i64 0
  %5 = icmp ule i64* %polly.access.call25, %polly.access.call16
  %6 = or i1 %4, %5
  %7 = and i1 %3, %6
  br i1 %7, label %polly.start, label %for.cond

for.cond:                                         ; preds = %polly.split_new_and_old, %for.inc22
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc22 ], [ 0, %polly.split_new_and_old ]
  %exitcond12 = icmp ne i64 %indvars.iv8, 1024
  br i1 %exitcond12, label %for.body, label %polly.merge_new_and_old

for.body:                                         ; preds = %for.cond
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc19, %for.body
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.inc19 ], [ 0, %for.body ]
  %exitcond7 = icmp ne i64 %indvars.iv4, 1024
  br i1 %exitcond7, label %for.body5, label %for.end21

for.body5:                                        ; preds = %for.cond3
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body5
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body5 ]
  %tmp.0 = phi i64 [ 0, %for.body5 ], [ %add14, %for.inc ]
  %exitcond = icmp ne i64 %indvars.iv, 1024
  br i1 %exitcond, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %8 = mul nuw nsw i64 %indvars.iv8, 1024
  %9 = add nuw nsw i64 %8, %indvars.iv
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %9
  %10 = load i64, i64* %arrayidx, align 8
  %11 = mul nuw nsw i64 %indvars.iv, 1024
  %12 = add nuw nsw i64 %11, %indvars.iv4
  %arrayidx12 = getelementptr inbounds i64, i64* %call1, i64 %12
  %13 = load i64, i64* %arrayidx12, align 8
  %mul13 = mul nsw i64 %10, %13
  %add14 = add nsw i64 %tmp.0, %mul13
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  %tmp.0.lcssa = phi i64 [ %tmp.0, %for.cond6 ]
  %14 = mul nuw nsw i64 %indvars.iv8, 1024
  %15 = add nuw nsw i64 %14, %indvars.iv4
  %arrayidx18 = getelementptr inbounds i64, i64* %call2, i64 %15
  store i64 %tmp.0.lcssa, i64* %arrayidx18, align 8
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  br label %for.cond3

for.end21:                                        ; preds = %for.cond3
  br label %for.inc22

for.inc22:                                        ; preds = %for.end21
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  br label %for.cond

polly.merge_new_and_old:                          ; preds = %polly.exiting, %for.cond
  br label %for.end24

for.end24:                                        ; preds = %polly.merge_new_and_old
  %arrayidx25 = getelementptr inbounds i64, i64* %call2, i64 1048575
  %16 = load i64, i64* %arrayidx25, align 8
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i32 0, i32 0), i32 1024, i32 1024, i64 %16)
  ret i32 0

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.loop_preheader

polly.loop_exit:                                  ; preds = %polly.loop_exit9
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.loop_exit
  br label %polly.merge_new_and_old

polly.loop_header:                                ; preds = %polly.loop_exit9, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit9 ]
  br label %polly.loop_preheader8

polly.loop_exit9:                                 ; preds = %polly.stmt.for.end
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sle i64 %polly.indvar, 1022
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.start
  br label %polly.loop_header

polly.loop_header7:                               ; preds = %polly.stmt.for.end, %polly.loop_preheader8
  %polly.indvar10 = phi i64 [ 0, %polly.loop_preheader8 ], [ %polly.indvar_next11, %polly.stmt.for.end ]
  br label %polly.stmt.for.body5

polly.stmt.for.body5:                             ; preds = %polly.loop_header7
  store i64 0, i64* %tmp.0.phiops
  br label %polly.loop_preheader14

polly.loop_exit15:                                ; preds = %polly.merge
  br label %polly.stmt.for.end

polly.stmt.for.end:                               ; preds = %polly.loop_exit15
  %tmp.0.lcssa.phiops.reload = load i64, i64* %tmp.0.lcssa.phiops
  %scevgep24 = getelementptr i64, i64* %scevgep23, i64 %polly.indvar10
  store i64 %tmp.0.lcssa.phiops.reload, i64* %scevgep24, align 8, !alias.scope !1, !noalias !3
  %polly.indvar_next11 = add nsw i64 %polly.indvar10, 1
  %polly.loop_cond12 = icmp sle i64 %polly.indvar10, 1022
  br i1 %polly.loop_cond12, label %polly.loop_header7, label %polly.loop_exit9

polly.loop_preheader8:                            ; preds = %polly.loop_header
  %17 = shl i64 %polly.indvar, 10
  %scevgep = getelementptr i64, i64* %call, i64 %17
  %scevgep23 = getelementptr i64, i64* %call2, i64 %17
  br label %polly.loop_header7

polly.loop_header13:                              ; preds = %polly.merge, %polly.loop_preheader14
  %polly.indvar16 = phi i64 [ 0, %polly.loop_preheader14 ], [ %polly.indvar_next17, %polly.merge ]
  br label %polly.stmt.for.cond6

polly.stmt.for.cond6:                             ; preds = %polly.loop_header13
  %tmp.0.phiops.reload = load i64, i64* %tmp.0.phiops
  %p_exitcond = icmp ne i64 %polly.indvar16, 1024
  store i64 %tmp.0.phiops.reload, i64* %tmp.0.s2a
  store i64 %tmp.0.phiops.reload, i64* %tmp.0.lcssa.phiops
  br label %polly.cond

polly.cond:                                       ; preds = %polly.stmt.for.cond6
  %18 = icmp sle i64 %polly.indvar16, 1023
  br i1 %18, label %polly.then, label %polly.else

polly.merge:                                      ; preds = %polly.else, %polly.stmt.for.inc
  %polly.indvar_next17 = add nsw i64 %polly.indvar16, 1
  %polly.loop_cond18 = icmp sle i64 %polly.indvar16, 1023
  br i1 %polly.loop_cond18, label %polly.loop_header13, label %polly.loop_exit15

polly.loop_preheader14:                           ; preds = %polly.stmt.for.body5
  %scevgep20 = getelementptr i64, i64* %call1, i64 %polly.indvar10
  br label %polly.loop_header13

polly.then:                                       ; preds = %polly.cond
  br label %polly.stmt.for.body8

polly.stmt.for.body8:                             ; preds = %polly.then
  %tmp.0.s2a.reload = load i64, i64* %tmp.0.s2a
  %scevgep19 = getelementptr i64, i64* %scevgep, i64 %polly.indvar16
  %_p_scalar_ = load i64, i64* %scevgep19, align 8, !alias.scope !7, !noalias !9
  %19 = shl i64 %polly.indvar16, 10
  %scevgep21 = getelementptr i64, i64* %scevgep20, i64 %19
  %_p_scalar_22 = load i64, i64* %scevgep21, align 8, !alias.scope !5, !noalias !10
  %p_mul13 = mul nsw i64 %_p_scalar_, %_p_scalar_22
  %p_add14 = add nsw i64 %tmp.0.s2a.reload, %p_mul13
  store i64 %p_add14, i64* %add14.s2a
  br label %polly.stmt.for.inc

polly.stmt.for.inc:                               ; preds = %polly.stmt.for.body8
  %add14.s2a.reload = load i64, i64* %add14.s2a
  store i64 %add14.s2a.reload, i64* %tmp.0.phiops
  br label %polly.merge

polly.else:                                       ; preds = %polly.cond
  br label %polly.merge
}

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.call2"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{!4, !5, !6, !7, !8}
!4 = distinct !{!4, !2, !"polly.alias.scope.add14"}
!5 = distinct !{!5, !2, !"polly.alias.scope.call1"}
!6 = distinct !{!6, !2, !"polly.alias.scope.tmp.0"}
!7 = distinct !{!7, !2, !"polly.alias.scope.call"}
!8 = distinct !{!8, !2, !"polly.alias.scope.tmp.0.lcssa"}
!9 = !{!1, !4, !5, !6, !8}
!10 = !{!1, !4, !6, !7, !8}
