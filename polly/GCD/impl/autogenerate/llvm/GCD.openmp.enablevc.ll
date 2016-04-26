; ModuleID = 'GCD.c'
source_filename = "GCD.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @gcd(i64 %a, i64 %b) #0 {
entry:
  %cmp = icmp eq i64 %a, 0
  br i1 %cmp, label %cleanup, label %while.cond.preheader

while.cond.preheader:                             ; preds = %entry
  %cmp13234 = icmp sgt i64 %a, -1
  br i1 %cmp13234, label %blklab4.lr.ph.preheader, label %if.end3

blklab4.lr.ph.preheader:                          ; preds = %while.cond.preheader
  %cmp447 = icmp eq i64 %b, 0
  br i1 %cmp447, label %cleanup, label %blklab4.preheader.preheader

blklab4.preheader.preheader:                      ; preds = %blklab4.lr.ph.preheader
  br label %blklab4.preheader

blklab4.preheader:                                ; preds = %blklab4.preheader.preheader, %blklab5
  %b.addr.0.ph3549 = phi i64 [ %sub10, %blklab5 ], [ %b, %blklab4.preheader.preheader ]
  %a.addr.0.ph3648 = phi i64 [ %a.addr.033.lcssa, %blklab5 ], [ %a, %blklab4.preheader.preheader ]
  br label %blklab4

if.end3.loopexit:                                 ; preds = %if.end9
  br label %if.end3

if.end3:                                          ; preds = %if.end3.loopexit, %while.cond.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #6
  tail call void @exit(i32 -1) #7
  unreachable

blklab4:                                          ; preds = %blklab4.preheader, %if.end9
  %a.addr.033 = phi i64 [ %sub, %if.end9 ], [ %a.addr.0.ph3648, %blklab4.preheader ]
  %cmp7 = icmp sgt i64 %a.addr.033, %b.addr.0.ph3549
  br i1 %cmp7, label %if.end9, label %blklab5

if.end9:                                          ; preds = %blklab4
  %sub = sub nsw i64 %a.addr.033, %b.addr.0.ph3549
  %cmp1 = icmp sgt i64 %sub, -1
  br i1 %cmp1, label %blklab4, label %if.end3.loopexit

blklab5:                                          ; preds = %blklab4
  %a.addr.033.lcssa = phi i64 [ %a.addr.033, %blklab4 ]
  %sub10 = sub nsw i64 %b.addr.0.ph3549, %a.addr.033.lcssa
  %cmp4 = icmp eq i64 %sub10, 0
  br i1 %cmp4, label %cleanup.loopexit, label %blklab4.preheader

cleanup.loopexit:                                 ; preds = %blklab5
  %a.addr.033.lcssa.lcssa = phi i64 [ %a.addr.033.lcssa, %blklab5 ]
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %blklab4.lr.ph.preheader, %entry
  %retval.0 = phi i64 [ %b, %entry ], [ %a, %blklab4.lr.ph.preheader ], [ %a.addr.033.lcssa.lcssa, %cleanup.loopexit ]
  ret i64 %retval.0
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #2 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5
  %0 = load i64*, i64** %call, align 8, !tbaa !1
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab7, label %if.end

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !5
  %call3 = tail call noalias i8* @malloc(i64 32) #5
  %2 = bitcast i8* %call3 to i64*
  %3 = bitcast i8* %call3 to <2 x i64>*
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %3, align 8, !tbaa !5
  %arrayidx6 = getelementptr inbounds i8, i8* %call3, i64 16
  %4 = bitcast i8* %arrayidx6 to <2 x i64>*
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %4, align 8, !tbaa !5
  tail call void @printf_s(i64* %2, i64 4) #5
  %call8 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1)
  %cmp9101 = icmp sgt i64 %1, 0
  br i1 %cmp9101, label %while.cond13.preheader.us.preheader, label %blklab8

while.cond13.preheader.us.preheader:              ; preds = %if.end
  %5 = add i64 %1, -1
  %6 = zext i64 %5 to i65
  %7 = add i64 %1, -2
  %8 = zext i64 %7 to i65
  %9 = mul i65 %6, %8
  %10 = lshr i65 %9, 1
  %11 = trunc i65 %10 to i64
  %12 = add i64 %1, %11
  %13 = add i64 %12, -1
  br label %while.cond13.preheader.us

while.cond13.preheader.us:                        ; preds = %while.cond13.preheader.us.preheader, %blklab10.loopexit.us
  %sum.0104.us = phi i64 [ %add.lcssa.us, %blklab10.loopexit.us ], [ 0, %while.cond13.preheader.us.preheader ]
  %i.0102.us = phi i64 [ %add21.us, %blklab10.loopexit.us ], [ 0, %while.cond13.preheader.us.preheader ]
  %cmp.i.us = icmp eq i64 %i.0102.us, 0
  br i1 %cmp.i.us, label %if.end18.us.us.us.preheader, label %if.end18.us113.preheader

if.end18.us113.preheader:                         ; preds = %while.cond13.preheader.us
  br label %if.end18.us113

if.end18.us113:                                   ; preds = %if.end18.us113.preheader, %gcd.exit.loopexit.us137
  %sum.1100.us114 = phi i64 [ %add.us129, %gcd.exit.loopexit.us137 ], [ %sum.0104.us, %if.end18.us113.preheader ]
  %j.099.us115 = phi i64 [ %add20.us130, %gcd.exit.loopexit.us137 ], [ 0, %if.end18.us113.preheader ]
  %cmp4.i110.us136 = icmp eq i64 %j.099.us115, 0
  br i1 %cmp4.i110.us136, label %gcd.exit.loopexit.us137, label %blklab4.i.preheader.us132.preheader

blklab4.i.preheader.us132.preheader:              ; preds = %if.end18.us113
  br label %blklab4.i.preheader.us132

blklab4.i.us117:                                  ; preds = %blklab4.i.preheader.us132, %if.end9.i.us124
  %a.addr.033.i.us118 = phi i64 [ %sub.i.us125, %if.end9.i.us124 ], [ %a.addr.0.ph36.i111.us134, %blklab4.i.preheader.us132 ]
  %cmp7.i.us119 = icmp sgt i64 %a.addr.033.i.us118, %b.addr.0.ph35.i112.us133
  br i1 %cmp7.i.us119, label %if.end9.i.us124, label %blklab5.i.us120

blklab5.i.us120:                                  ; preds = %blklab4.i.us117
  %a.addr.033.i.us118.lcssa = phi i64 [ %a.addr.033.i.us118, %blklab4.i.us117 ]
  %sub10.i.us122 = sub nsw i64 %b.addr.0.ph35.i112.us133, %a.addr.033.i.us118.lcssa
  %cmp4.i.us123 = icmp eq i64 %sub10.i.us122, 0
  br i1 %cmp4.i.us123, label %gcd.exit.loopexit.us137.loopexit, label %blklab4.i.preheader.us132

if.end9.i.us124:                                  ; preds = %blklab4.i.us117
  %sub.i.us125 = sub nsw i64 %a.addr.033.i.us118, %b.addr.0.ph35.i112.us133
  %cmp1.i.us126 = icmp sgt i64 %sub.i.us125, -1
  br i1 %cmp1.i.us126, label %blklab4.i.us117, label %if.end3.i

blklab4.i.preheader.us132:                        ; preds = %blklab4.i.preheader.us132.preheader, %blklab5.i.us120
  %b.addr.0.ph35.i112.us133 = phi i64 [ %sub10.i.us122, %blklab5.i.us120 ], [ %j.099.us115, %blklab4.i.preheader.us132.preheader ]
  %a.addr.0.ph36.i111.us134 = phi i64 [ %a.addr.033.i.us118.lcssa, %blklab5.i.us120 ], [ %i.0102.us, %blklab4.i.preheader.us132.preheader ]
  br label %blklab4.i.us117

gcd.exit.loopexit.us137.loopexit:                 ; preds = %blklab5.i.us120
  %a.addr.033.i.us118.lcssa.lcssa = phi i64 [ %a.addr.033.i.us118.lcssa, %blklab5.i.us120 ]
  br label %gcd.exit.loopexit.us137

gcd.exit.loopexit.us137:                          ; preds = %gcd.exit.loopexit.us137.loopexit, %if.end18.us113
  %a.addr.0.ph36.i.lcssa.us138 = phi i64 [ %i.0102.us, %if.end18.us113 ], [ %a.addr.033.i.us118.lcssa.lcssa, %gcd.exit.loopexit.us137.loopexit ]
  %add.us129 = add nsw i64 %a.addr.0.ph36.i.lcssa.us138, %sum.1100.us114
  %add20.us130 = add nuw nsw i64 %j.099.us115, 1
  %exitcond.us131 = icmp eq i64 %add20.us130, %1
  br i1 %exitcond.us131, label %blklab10.loopexit.us.loopexit, label %if.end18.us113

blklab10.loopexit.us.loopexit:                    ; preds = %gcd.exit.loopexit.us137
  %add.us129.lcssa = phi i64 [ %add.us129, %gcd.exit.loopexit.us137 ]
  br label %blklab10.loopexit.us

blklab10.loopexit.us:                             ; preds = %blklab10.loopexit.us.loopexit, %if.end18.us.us.us.preheader
  %add.lcssa.us = phi i64 [ %14, %if.end18.us.us.us.preheader ], [ %add.us129.lcssa, %blklab10.loopexit.us.loopexit ]
  %add21.us = add nuw nsw i64 %i.0102.us, 1
  %exitcond106.us = icmp eq i64 %add21.us, %1
  br i1 %exitcond106.us, label %blklab8.loopexit, label %while.cond13.preheader.us

if.end18.us.us.us.preheader:                      ; preds = %while.cond13.preheader.us
  %14 = add i64 %13, %sum.0104.us
  br label %blklab10.loopexit.us

if.end3.i:                                        ; preds = %if.end9.i.us124
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !1
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %15) #8
  tail call void @exit(i32 -1) #7
  unreachable

blklab8.loopexit:                                 ; preds = %blklab10.loopexit.us
  %add.lcssa.us.lcssa = phi i64 [ %add.lcssa.us, %blklab10.loopexit.us ]
  br label %blklab8

blklab8:                                          ; preds = %blklab8.loopexit, %if.end
  %sum.0.lcssa = phi i64 [ 0, %if.end ], [ %add.lcssa.us.lcssa, %blklab8.loopexit ]
  %call22 = tail call noalias i8* @malloc(i64 40) #5
  %17 = bitcast i8* %call22 to i64*
  %18 = bitcast i8* %call22 to <2 x i64>*
  store <2 x i64> <i64 83, i64 117>, <2 x i64>* %18, align 8, !tbaa !5
  %arrayidx25 = getelementptr inbounds i8, i8* %call22, i64 16
  %19 = bitcast i8* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 109, i64 58>, <2 x i64>* %19, align 8, !tbaa !5
  %arrayidx27 = getelementptr inbounds i8, i8* %call22, i64 32
  %20 = bitcast i8* %arrayidx27 to i64*
  store i64 32, i64* %20, align 8, !tbaa !5
  tail call void @printf_s(i64* %17, i64 5) #5
  %call28 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa)
  %call29 = tail call noalias i8* @malloc(i64 200) #5
  %21 = bitcast i8* %call29 to i64*
  %22 = bitcast i8* %call29 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %22, align 8, !tbaa !5
  %arrayidx32 = getelementptr inbounds i8, i8* %call29, i64 16
  %23 = bitcast i8* %arrayidx32 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %23, align 8, !tbaa !5
  %arrayidx34 = getelementptr inbounds i8, i8* %call29, i64 32
  %24 = bitcast i8* %arrayidx34 to <2 x i64>*
  store <2 x i64> <i64 32, i64 69>, <2 x i64>* %24, align 8, !tbaa !5
  %arrayidx36 = getelementptr inbounds i8, i8* %call29, i64 48
  %25 = bitcast i8* %arrayidx36 to <2 x i64>*
  store <2 x i64> <i64 117, i64 99>, <2 x i64>* %25, align 8, !tbaa !5
  %arrayidx38 = getelementptr inbounds i8, i8* %call29, i64 64
  %26 = bitcast i8* %arrayidx38 to <2 x i64>*
  store <2 x i64> <i64 108, i64 105>, <2 x i64>* %26, align 8, !tbaa !5
  %arrayidx40 = getelementptr inbounds i8, i8* %call29, i64 80
  %27 = bitcast i8* %arrayidx40 to <2 x i64>*
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %27, align 8, !tbaa !5
  %arrayidx42 = getelementptr inbounds i8, i8* %call29, i64 96
  %28 = bitcast i8* %arrayidx42 to <2 x i64>*
  store <2 x i64> <i64 71, i64 67>, <2 x i64>* %28, align 8, !tbaa !5
  %arrayidx44 = getelementptr inbounds i8, i8* %call29, i64 112
  %29 = bitcast i8* %arrayidx44 to <2 x i64>*
  store <2 x i64> <i64 68, i64 32>, <2 x i64>* %29, align 8, !tbaa !5
  %arrayidx46 = getelementptr inbounds i8, i8* %call29, i64 128
  %30 = bitcast i8* %arrayidx46 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %30, align 8, !tbaa !5
  %arrayidx48 = getelementptr inbounds i8, i8* %call29, i64 144
  %31 = bitcast i8* %arrayidx48 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %31, align 8, !tbaa !5
  %arrayidx50 = getelementptr inbounds i8, i8* %call29, i64 160
  %32 = bitcast i8* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %32, align 8, !tbaa !5
  %arrayidx52 = getelementptr inbounds i8, i8* %call29, i64 176
  %33 = bitcast i8* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %33, align 8, !tbaa !5
  %arrayidx54 = getelementptr inbounds i8, i8* %call29, i64 192
  %34 = bitcast i8* %arrayidx54 to i64*
  store i64 101, i64* %34, align 8, !tbaa !5
  tail call void @println_s(i64* %21, i64 25) #5
  br label %blklab7

blklab7:                                          ; preds = %entry, %blklab8
  tail call void @exit(i32 0) #7
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64* @parseStringToInt(i64*) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

declare void @printf_s(i64*, i64) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #4

declare void @println_s(i64*, i64) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }
attributes #8 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"any pointer", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"long long", !3, i64 0}
