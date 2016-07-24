; ModuleID = 'Fibonacci_original.c'
source_filename = "Fibonacci_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @fibonacci(i64* %ls, i64 %ls_size, i1 zeroext %ls_dealloc, i64 %n) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i64 %n, 1
  br i1 %cmp, label %blklab0, label %if.end

if.end:                                           ; preds = %entry
  %0 = bitcast i64* %ls to <2 x i64>*
  store <2 x i64> <i64 0, i64 1>, <2 x i64>* %0, align 8, !tbaa !1
  ret i64* %ls

blklab0:                                          ; preds = %entry
  %sub = add nsw i64 %n, -1
  %call = tail call i64* @fibonacci(i64* %ls, i64 %ls_size, i1 zeroext undef, i64 %sub)
  %arrayidx10 = getelementptr inbounds i64, i64* %call, i64 %sub
  %1 = load i64, i64* %arrayidx10, align 8, !tbaa !1
  %sub11 = add nsw i64 %n, -2
  %arrayidx12 = getelementptr inbounds i64, i64* %call, i64 %sub11
  %2 = load i64, i64* %arrayidx12, align 8, !tbaa !1
  %add = add nsw i64 %2, %1
  %arrayidx13 = getelementptr inbounds i64, i64* %call, i64 %n
  store i64 %add, i64* %arrayidx13, align 8, !tbaa !1
  ret i64* %call
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #2 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !5
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end91.critedge, label %if.then72

if.then72:                                        ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %conv13 = trunc i64 %1 to i32
  %call14 = tail call i64* @create1DArray(i32 0, i32 %conv13) #5
  %sub20 = add nsw i64 %1, -1
  %call24 = tail call i64* @fibonacci(i64* %call14, i64 %1, i1 zeroext undef, i64 %sub20)
  %sub30 = add nsw i64 %1, -3
  %arrayidx31 = getelementptr inbounds i64, i64* %call24, i64 %sub30
  %2 = load i64, i64* %arrayidx31, align 8, !tbaa !1
  %call32 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2)
  %sub33 = add nsw i64 %1, -2
  %arrayidx34 = getelementptr inbounds i64, i64* %call24, i64 %sub33
  %3 = load i64, i64* %arrayidx34, align 8, !tbaa !1
  %call35 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %3)
  %arrayidx37 = getelementptr inbounds i64, i64* %call24, i64 %sub20
  %4 = load i64, i64* %arrayidx37, align 8, !tbaa !1
  %call38 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %4)
  %call43 = tail call i64* @create1DArray(i32 0, i32 24) #5
  %5 = bitcast i64* %call43 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %5, align 8, !tbaa !1
  %arrayidx46 = getelementptr inbounds i64, i64* %call43, i64 2
  %6 = bitcast i64* %arrayidx46 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %6, align 8, !tbaa !1
  %arrayidx48 = getelementptr inbounds i64, i64* %call43, i64 4
  %7 = bitcast i64* %arrayidx48 to <2 x i64>*
  store <2 x i64> <i64 32, i64 70>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx50 = getelementptr inbounds i64, i64* %call43, i64 6
  %8 = bitcast i64* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 105, i64 98>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx52 = getelementptr inbounds i64, i64* %call43, i64 8
  %9 = bitcast i64* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 111, i64 110>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx54 = getelementptr inbounds i64, i64* %call43, i64 10
  %10 = bitcast i64* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 97, i64 99>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx56 = getelementptr inbounds i64, i64* %call43, i64 12
  %11 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 99, i64 105>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx58 = getelementptr inbounds i64, i64* %call43, i64 14
  %12 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx60 = getelementptr inbounds i64, i64* %call43, i64 16
  %13 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx62 = getelementptr inbounds i64, i64* %call43, i64 18
  %14 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx64 = getelementptr inbounds i64, i64* %call43, i64 20
  %15 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx66 = getelementptr inbounds i64, i64* %call43, i64 22
  %16 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %16, align 8, !tbaa !1
  tail call void @println_s(i64* %call43, i64 24) #5
  %phitmp = bitcast i64* %call43 to i8*
  %phitmp154 = bitcast i64* %call24 to i8*
  %17 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %17) #5
  tail call void @free(i8* %phitmp154) #5
  tail call void @free2DArray(i64** %call, i64 %conv) #5
  tail call void @free(i8* %phitmp) #5
  br label %if.end91

if.end91.critedge:                                ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #5
  br label %if.end91

if.end91:                                         ; preds = %if.end91.critedge, %if.then72
  tail call void @exit(i32 0) #6
  unreachable
}

declare void @free2DArray(i64**, i64) local_unnamed_addr #3

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

declare i64* @create1DArray(i32, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
