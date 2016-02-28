; ModuleID = 'VectorMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@p = common global [0 x i32] zeroinitializer, align 4
@u = common global [0 x i32] zeroinitializer, align 4
@v = common global [0 x i32] zeroinitializer, align 4
@.str = private unnamed_addr constant [34 x i8] c"fail to multiply two unit vectors\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [76 x i8] c"Pass the %'d X %'d vector multiplication test case with dot Product = %'lld\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc24, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.inc24 ]
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @p, i64 0, i64 %indvars.iv12
  store i32 0, i32* %arrayidx, align 4
  %0 = trunc i64 %indvars.iv12 to i32
  %mul = shl i32 %0, 16
  %1 = sext i32 %mul to i64
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body
  %index = phi i64 [ 0, %for.body ], [ %index.next.3, %vector.body ]
  %2 = add nsw i64 %index, %1
  %3 = getelementptr inbounds [0 x i32], [0 x i32]* @u, i64 0, i64 %2
  %4 = bitcast i32* %3 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %4, align 4
  %5 = getelementptr i32, i32* %3, i64 4
  %6 = bitcast i32* %5 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %6, align 4
  %7 = getelementptr inbounds [0 x i32], [0 x i32]* @v, i64 0, i64 %2
  %8 = bitcast i32* %7 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %8, align 4
  %9 = getelementptr i32, i32* %7, i64 4
  %10 = bitcast i32* %9 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 4
  %index.next = or i64 %index, 8
  %11 = add nsw i64 %index.next, %1
  %12 = getelementptr inbounds [0 x i32], [0 x i32]* @u, i64 0, i64 %11
  %13 = bitcast i32* %12 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %13, align 4
  %14 = getelementptr i32, i32* %12, i64 4
  %15 = bitcast i32* %14 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %15, align 4
  %16 = getelementptr inbounds [0 x i32], [0 x i32]* @v, i64 0, i64 %11
  %17 = bitcast i32* %16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %17, align 4
  %18 = getelementptr i32, i32* %16, i64 4
  %19 = bitcast i32* %18 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %19, align 4
  %index.next.1 = or i64 %index, 16
  %20 = add nsw i64 %index.next.1, %1
  %21 = getelementptr inbounds [0 x i32], [0 x i32]* @u, i64 0, i64 %20
  %22 = bitcast i32* %21 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %22, align 4
  %23 = getelementptr i32, i32* %21, i64 4
  %24 = bitcast i32* %23 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %24, align 4
  %25 = getelementptr inbounds [0 x i32], [0 x i32]* @v, i64 0, i64 %20
  %26 = bitcast i32* %25 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %26, align 4
  %27 = getelementptr i32, i32* %25, i64 4
  %28 = bitcast i32* %27 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %28, align 4
  %index.next.2 = or i64 %index, 24
  %29 = add nsw i64 %index.next.2, %1
  %30 = getelementptr inbounds [0 x i32], [0 x i32]* @u, i64 0, i64 %29
  %31 = bitcast i32* %30 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %31, align 4
  %32 = getelementptr i32, i32* %30, i64 4
  %33 = bitcast i32* %32 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %33, align 4
  %34 = getelementptr inbounds [0 x i32], [0 x i32]* @v, i64 0, i64 %29
  %35 = bitcast i32* %34 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %35, align 4
  %36 = getelementptr i32, i32* %34, i64 4
  %37 = bitcast i32* %36 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %37, align 4
  %index.next.3 = add nsw i64 %index, 32
  %38 = icmp eq i64 %index.next.3, 65536
  br i1 %38, label %for.inc24, label %vector.body, !llvm.loop !1

for.inc24:                                        ; preds = %vector.body
  store i32 65536, i32* %arrayidx, align 4
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 65536
  br i1 %exitcond14, label %vector.body5.preheader, label %for.body

vector.body5.preheader:                           ; preds = %for.inc24
  br label %vector.body5

vector.body5:                                     ; preds = %vector.body5, %vector.body5.preheader
  %index10 = phi i64 [ 0, %vector.body5.preheader ], [ %index.next11.1, %vector.body5 ]
  %vec.phi = phi <2 x i64> [ zeroinitializer, %vector.body5.preheader ], [ %53, %vector.body5 ]
  %vec.phi18 = phi <2 x i64> [ zeroinitializer, %vector.body5.preheader ], [ %54, %vector.body5 ]
  %39 = getelementptr inbounds [0 x i32], [0 x i32]* @p, i64 0, i64 %index10
  %40 = bitcast i32* %39 to <2 x i32>*
  %wide.load = load <2 x i32>, <2 x i32>* %40, align 4
  %41 = getelementptr i32, i32* %39, i64 2
  %42 = bitcast i32* %41 to <2 x i32>*
  %wide.load19 = load <2 x i32>, <2 x i32>* %42, align 4
  %43 = sext <2 x i32> %wide.load to <2 x i64>
  %44 = sext <2 x i32> %wide.load19 to <2 x i64>
  %45 = add nsw <2 x i64> %43, %vec.phi
  %46 = add nsw <2 x i64> %44, %vec.phi18
  %index.next11 = or i64 %index10, 4
  %47 = getelementptr inbounds [0 x i32], [0 x i32]* @p, i64 0, i64 %index.next11
  %48 = bitcast i32* %47 to <2 x i32>*
  %wide.load.1 = load <2 x i32>, <2 x i32>* %48, align 4
  %49 = getelementptr i32, i32* %47, i64 2
  %50 = bitcast i32* %49 to <2 x i32>*
  %wide.load19.1 = load <2 x i32>, <2 x i32>* %50, align 4
  %51 = sext <2 x i32> %wide.load.1 to <2 x i64>
  %52 = sext <2 x i32> %wide.load19.1 to <2 x i64>
  %53 = add nsw <2 x i64> %51, %45
  %54 = add nsw <2 x i64> %52, %46
  %index.next11.1 = add nsw i64 %index10, 8
  %55 = icmp eq i64 %index.next11.1, 65536
  br i1 %55, label %middle.block6, label %vector.body5, !llvm.loop !4

middle.block6:                                    ; preds = %vector.body5
  %.lcssa22 = phi <2 x i64> [ %54, %vector.body5 ]
  %.lcssa = phi <2 x i64> [ %53, %vector.body5 ]
  %bin.rdx = add <2 x i64> %.lcssa22, %.lcssa
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>
  %bin.rdx20 = add <2 x i64> %bin.rdx, %rdx.shuf
  %56 = extractelement <2 x i64> %bin.rdx20, i32 0
  %cmp36 = icmp eq i64 %56, 4294967296
  br i1 %cmp36, label %if.end, label %if.then

if.then:                                          ; preds = %middle.block6
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str, i64 0, i64 0)) #3
  tail call void @exit(i32 -2) #4
  unreachable

if.end:                                           ; preds = %middle.block6
  %call38 = tail call i8* @setlocale(i32 6, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0)) #3
  %call39 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.2, i64 0, i64 0), i32 65536, i32 65536, i64 4294967296) #3
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
