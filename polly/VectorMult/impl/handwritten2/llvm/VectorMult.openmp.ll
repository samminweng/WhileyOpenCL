; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@u = common global [256 x i32] zeroinitializer, align 16
@v = common global [256 x i32] zeroinitializer, align 16
@p = common global [256 x i32] zeroinitializer, align 16
@sum = common global [268435456 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [100 x i8] c"Pass the %'lld vector multiplication test case with local vector size = %d\0AThe Dot Product = %'lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 {
entry:
  br label %vector.ph

vector.ph:                                        ; preds = %for.end, %entry
  %r.05 = phi i64 [ 0, %entry ], [ %inc16, %for.end ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  %0 = getelementptr inbounds [256 x i32], [256 x i32]* @u, i64 0, i64 %index
  %1 = bitcast i32* %0 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %1, align 16
  %2 = getelementptr i32, i32* %0, i64 4
  %3 = bitcast i32* %2 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %3, align 16
  %4 = getelementptr inbounds [256 x i32], [256 x i32]* @v, i64 0, i64 %index
  %5 = bitcast i32* %4 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %5, align 16
  %6 = getelementptr i32, i32* %4, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %7, align 16
  %8 = getelementptr inbounds [256 x i32], [256 x i32]* @p, i64 0, i64 %index
  %9 = bitcast i32* %8 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %9, align 16
  %10 = getelementptr i32, i32* %8, i64 4
  %11 = bitcast i32* %10 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %11, align 16
  %index.next = or i64 %index, 8
  %12 = getelementptr inbounds [256 x i32], [256 x i32]* @u, i64 0, i64 %index.next
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 16
  %14 = getelementptr i32, i32* %12, i64 4
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 16
  %16 = getelementptr inbounds [256 x i32], [256 x i32]* @v, i64 0, i64 %index.next
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 16
  %18 = getelementptr i32, i32* %16, i64 4
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 16
  %20 = getelementptr inbounds [256 x i32], [256 x i32]* @p, i64 0, i64 %index.next
  %21 = bitcast i32* %20 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 16
  %22 = getelementptr i32, i32* %20, i64 4
  %23 = bitcast i32* %22 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 16
  %index.next.1 = add nsw i64 %index, 16
  %24 = icmp eq i64 %index.next.1, 256
  br i1 %24, label %for.end, label %vector.body, !llvm.loop !1

for.end:                                          ; preds = %vector.body
  %arrayidx14 = getelementptr inbounds [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %r.05
  store i32 256, i32* %arrayidx14, align 4
  %inc16 = add nuw nsw i64 %r.05, 1
  %exitcond7 = icmp eq i64 %inc16, 268435456
  br i1 %exitcond7, label %vector.body2.preheader, label %vector.ph

vector.body2.preheader:                           ; preds = %for.end
  br label %vector.body2

vector.body2:                                     ; preds = %vector.body2, %vector.body2.preheader
  %index7 = phi i64 [ 0, %vector.body2.preheader ], [ %index.next8.1, %vector.body2 ]
  %vec.phi = phi <2 x i64> [ zeroinitializer, %vector.body2.preheader ], [ %39, %vector.body2 ]
  %vec.phi11 = phi <2 x i64> [ zeroinitializer, %vector.body2.preheader ], [ %40, %vector.body2 ]
  %25 = getelementptr inbounds [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index7
  %26 = bitcast i32* %25 to <2 x i32>*
  %wide.load = load <2 x i32>, <2 x i32>* %26, align 16
  %27 = getelementptr i32, i32* %25, i64 2
  %28 = bitcast i32* %27 to <2 x i32>*
  %wide.load16 = load <2 x i32>, <2 x i32>* %28, align 8
  %29 = sext <2 x i32> %wide.load to <2 x i64>
  %30 = sext <2 x i32> %wide.load16 to <2 x i64>
  %31 = add nsw <2 x i64> %29, %vec.phi
  %32 = add nsw <2 x i64> %30, %vec.phi11
  %index.next8 = or i64 %index7, 4
  %33 = getelementptr inbounds [268435456 x i32], [268435456 x i32]* @sum, i64 0, i64 %index.next8
  %34 = bitcast i32* %33 to <2 x i32>*
  %wide.load.1 = load <2 x i32>, <2 x i32>* %34, align 16
  %35 = getelementptr i32, i32* %33, i64 2
  %36 = bitcast i32* %35 to <2 x i32>*
  %wide.load16.1 = load <2 x i32>, <2 x i32>* %36, align 8
  %37 = sext <2 x i32> %wide.load.1 to <2 x i64>
  %38 = sext <2 x i32> %wide.load16.1 to <2 x i64>
  %39 = add nsw <2 x i64> %37, %31
  %40 = add nsw <2 x i64> %38, %32
  %index.next8.1 = add nsw i64 %index7, 8
  %41 = icmp eq i64 %index.next8.1, 268435456
  br i1 %41, label %middle.block3, label %vector.body2, !llvm.loop !4

middle.block3:                                    ; preds = %vector.body2
  %.lcssa19 = phi <2 x i64> [ %40, %vector.body2 ]
  %.lcssa = phi <2 x i64> [ %39, %vector.body2 ]
  %bin.rdx = add <2 x i64> %.lcssa19, %.lcssa
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx17 = add <2 x i64> %bin.rdx, %rdx.shuf
  %42 = extractelement <2 x i64> %bin.rdx17, i32 0
  %cmp27 = icmp eq i64 %42, 68719476736
  br i1 %cmp27, label %if.end, label %if.then

if.then:                                          ; preds = %middle.block3
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #3
  tail call void @exit(i32 -2) #4
  unreachable

if.end:                                           ; preds = %middle.block3
  %call29 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #3
  %call30 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.2, i64 0, i64 0), i64 68719476736, i32 256, i64 68719476736) #3
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind
declare i8* @setlocale(i32, i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !2, !3}
