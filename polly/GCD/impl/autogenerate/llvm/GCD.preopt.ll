; ModuleID = 'llvm/GCD.preopt.ll.tmp'
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
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp = icmp eq i64 %a, 0
  br i1 %cmp, label %return, label %while.body.preheader

while.body.preheader:                             ; preds = %entry.split
  %cmp12 = icmp sgt i64 %a, -1
  br i1 %cmp12, label %blklab4.lr.ph, label %if.end3

blklab4.lr.ph:                                    ; preds = %while.body.preheader
  br label %blklab4

while.body.if.end3_crit_edge:                     ; preds = %if.end6
  br label %if.end3

if.end3:                                          ; preds = %while.body.if.end3_crit_edge, %while.body.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #5
  tail call void @exit(i32 -1) #6
  unreachable

blklab4:                                          ; preds = %blklab4.lr.ph, %if.end6
  %a.addr.04 = phi i64 [ %a, %blklab4.lr.ph ], [ %a.addr.1, %if.end6 ]
  %b.addr.03 = phi i64 [ %b, %blklab4.lr.ph ], [ %b.addr.1, %if.end6 ]
  %cmp4 = icmp eq i64 %b.addr.03, 0
  br i1 %cmp4, label %return.loopexit, label %if.end6

if.end6:                                          ; preds = %blklab4
  %cmp7 = icmp sgt i64 %a.addr.04, %b.addr.03
  %sub10 = select i1 %cmp7, i64 0, i64 %a.addr.04
  %b.addr.1 = sub nsw i64 %b.addr.03, %sub10
  %sub = select i1 %cmp7, i64 %b.addr.03, i64 0
  %a.addr.1 = sub nsw i64 %a.addr.04, %sub
  %cmp1 = icmp sgt i64 %a.addr.1, -1
  br i1 %cmp1, label %blklab4, label %while.body.if.end3_crit_edge

return.loopexit:                                  ; preds = %blklab4
  %a.addr.04.lcssa = phi i64 [ %a.addr.04, %blklab4 ]
  br label %return

return:                                           ; preds = %return.loopexit, %entry.split
  %retval.0 = phi i64 [ %b, %entry.split ], [ %a.addr.04.lcssa, %return.loopexit ]
  ret i64 %retval.0
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #4
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8
  %call1 = tail call i64* @parseStringToInt(i64* %0) #4
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.then64, label %if.end

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8
  %call5 = tail call noalias i8* @malloc(i64 32) #4
  %2 = bitcast i8* %call5 to i64*
  store i64 78, i64* %2, align 8
  %arrayidx7 = getelementptr inbounds i8, i8* %call5, i64 8
  %3 = bitcast i8* %arrayidx7 to i64*
  store i64 32, i64* %3, align 8
  %arrayidx8 = getelementptr inbounds i8, i8* %call5, i64 16
  %4 = bitcast i8* %arrayidx8 to i64*
  store i64 61, i64* %4, align 8
  %arrayidx9 = getelementptr inbounds i8, i8* %call5, i64 24
  %5 = bitcast i8* %arrayidx9 to i64*
  store i64 32, i64* %5, align 8
  tail call void @printf_s(i64* %2, i64 4) #4
  %call10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1) #4
  %cmp115 = icmp sgt i64 %1, 0
  br i1 %cmp115, label %while.body16.preheader.lr.ph, label %if.end26

while.body16.preheader.lr.ph:                     ; preds = %if.end
  br label %while.body16.preheader

while.body16.preheader:                           ; preds = %while.body16.preheader.lr.ph, %blklab9
  %sum.08 = phi i64 [ 0, %while.body16.preheader.lr.ph ], [ %sum.1.lcssa, %blklab9 ]
  %i.06 = phi i64 [ 0, %while.body16.preheader.lr.ph ], [ %add23, %blklab9 ]
  %cmp172 = icmp sgt i64 %1, 0
  br i1 %cmp172, label %if.end20.lr.ph, label %blklab9

if.end20.lr.ph:                                   ; preds = %while.body16.preheader
  br label %if.end20

if.end20:                                         ; preds = %if.end20.lr.ph, %if.end20
  %sum.14 = phi i64 [ %sum.08, %if.end20.lr.ph ], [ %add, %if.end20 ]
  %j.03 = phi i64 [ 0, %if.end20.lr.ph ], [ %add22, %if.end20 ]
  %call21 = tail call i64 @gcd(i64 %i.06, i64 %j.03)
  %add22 = add nuw nsw i64 %j.03, 1
  %add = add nsw i64 %call21, %sum.14
  %exitcond = icmp ne i64 %add22, %1
  br i1 %exitcond, label %if.end20, label %while.body16.blklab9_crit_edge

while.body16.blklab9_crit_edge:                   ; preds = %if.end20
  %add.lcssa = phi i64 [ %add, %if.end20 ]
  br label %blklab9

blklab9:                                          ; preds = %while.body16.blklab9_crit_edge, %while.body16.preheader
  %sum.1.lcssa = phi i64 [ %add.lcssa, %while.body16.blklab9_crit_edge ], [ %sum.08, %while.body16.preheader ]
  %add23 = add nuw nsw i64 %i.06, 1
  %exitcond10 = icmp ne i64 %add23, %1
  br i1 %exitcond10, label %while.body16.preheader, label %while.body.if.end26_crit_edge

while.body.if.end26_crit_edge:                    ; preds = %blklab9
  %sum.1.lcssa.lcssa = phi i64 [ %sum.1.lcssa, %blklab9 ]
  br label %if.end26

if.end26:                                         ; preds = %while.body.if.end26_crit_edge, %if.end
  %sum.0.lcssa = phi i64 [ %sum.1.lcssa.lcssa, %while.body.if.end26_crit_edge ], [ 0, %if.end ]
  %call27 = tail call noalias i8* @malloc(i64 40) #4
  %6 = bitcast i8* %call27 to i64*
  store i64 83, i64* %6, align 8
  %arrayidx29 = getelementptr inbounds i8, i8* %call27, i64 8
  %7 = bitcast i8* %arrayidx29 to i64*
  store i64 117, i64* %7, align 8
  %arrayidx30 = getelementptr inbounds i8, i8* %call27, i64 16
  %8 = bitcast i8* %arrayidx30 to i64*
  store i64 109, i64* %8, align 8
  %arrayidx31 = getelementptr inbounds i8, i8* %call27, i64 24
  %9 = bitcast i8* %arrayidx31 to i64*
  store i64 58, i64* %9, align 8
  %arrayidx32 = getelementptr inbounds i8, i8* %call27, i64 32
  %10 = bitcast i8* %arrayidx32 to i64*
  store i64 32, i64* %10, align 8
  tail call void @printf_s(i64* %6, i64 5) #4
  %call33 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa) #4
  %call37 = tail call noalias i8* @malloc(i64 200) #4
  %11 = bitcast i8* %call37 to i64*
  store i64 80, i64* %11, align 8
  %arrayidx39 = getelementptr inbounds i8, i8* %call37, i64 8
  %12 = bitcast i8* %arrayidx39 to i64*
  store i64 97, i64* %12, align 8
  %arrayidx40 = getelementptr inbounds i8, i8* %call37, i64 16
  %13 = bitcast i8* %arrayidx40 to i64*
  store i64 115, i64* %13, align 8
  %arrayidx41 = getelementptr inbounds i8, i8* %call37, i64 24
  %14 = bitcast i8* %arrayidx41 to i64*
  store i64 115, i64* %14, align 8
  %arrayidx42 = getelementptr inbounds i8, i8* %call37, i64 32
  %15 = bitcast i8* %arrayidx42 to i64*
  store i64 32, i64* %15, align 8
  %arrayidx43 = getelementptr inbounds i8, i8* %call37, i64 40
  %16 = bitcast i8* %arrayidx43 to i64*
  store i64 69, i64* %16, align 8
  %arrayidx44 = getelementptr inbounds i8, i8* %call37, i64 48
  %17 = bitcast i8* %arrayidx44 to i64*
  store i64 117, i64* %17, align 8
  %arrayidx45 = getelementptr inbounds i8, i8* %call37, i64 56
  %18 = bitcast i8* %arrayidx45 to i64*
  store i64 99, i64* %18, align 8
  %arrayidx46 = getelementptr inbounds i8, i8* %call37, i64 64
  %19 = bitcast i8* %arrayidx46 to i64*
  store i64 108, i64* %19, align 8
  %arrayidx47 = getelementptr inbounds i8, i8* %call37, i64 72
  %20 = bitcast i8* %arrayidx47 to i64*
  store i64 105, i64* %20, align 8
  %arrayidx48 = getelementptr inbounds i8, i8* %call37, i64 80
  %21 = bitcast i8* %arrayidx48 to i64*
  store i64 100, i64* %21, align 8
  %arrayidx49 = getelementptr inbounds i8, i8* %call37, i64 88
  %22 = bitcast i8* %arrayidx49 to i64*
  store i64 32, i64* %22, align 8
  %arrayidx50 = getelementptr inbounds i8, i8* %call37, i64 96
  %23 = bitcast i8* %arrayidx50 to i64*
  store i64 71, i64* %23, align 8
  %arrayidx51 = getelementptr inbounds i8, i8* %call37, i64 104
  %24 = bitcast i8* %arrayidx51 to i64*
  store i64 67, i64* %24, align 8
  %arrayidx52 = getelementptr inbounds i8, i8* %call37, i64 112
  %25 = bitcast i8* %arrayidx52 to i64*
  store i64 68, i64* %25, align 8
  %arrayidx53 = getelementptr inbounds i8, i8* %call37, i64 120
  %26 = bitcast i8* %arrayidx53 to i64*
  store i64 32, i64* %26, align 8
  %arrayidx54 = getelementptr inbounds i8, i8* %call37, i64 128
  %27 = bitcast i8* %arrayidx54 to i64*
  store i64 116, i64* %27, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %call37, i64 136
  %28 = bitcast i8* %arrayidx55 to i64*
  store i64 101, i64* %28, align 8
  %arrayidx56 = getelementptr inbounds i8, i8* %call37, i64 144
  %29 = bitcast i8* %arrayidx56 to i64*
  store i64 115, i64* %29, align 8
  %arrayidx57 = getelementptr inbounds i8, i8* %call37, i64 152
  %30 = bitcast i8* %arrayidx57 to i64*
  store i64 116, i64* %30, align 8
  %arrayidx58 = getelementptr inbounds i8, i8* %call37, i64 160
  %31 = bitcast i8* %arrayidx58 to i64*
  store i64 32, i64* %31, align 8
  %arrayidx59 = getelementptr inbounds i8, i8* %call37, i64 168
  %32 = bitcast i8* %arrayidx59 to i64*
  store i64 99, i64* %32, align 8
  %arrayidx60 = getelementptr inbounds i8, i8* %call37, i64 176
  %33 = bitcast i8* %arrayidx60 to i64*
  store i64 97, i64* %33, align 8
  %arrayidx61 = getelementptr inbounds i8, i8* %call37, i64 184
  %34 = bitcast i8* %arrayidx61 to i64*
  store i64 115, i64* %34, align 8
  %arrayidx62 = getelementptr inbounds i8, i8* %call37, i64 192
  %35 = bitcast i8* %arrayidx62 to i64*
  store i64 101, i64* %35, align 8
  tail call void @println_s(i64* %11, i64 25) #4
  br label %if.then64

if.then64:                                        ; preds = %if.end26, %entry.split
  %_12_has_ownership.0 = phi i1 [ true, %if.end26 ], [ false, %entry.split ]
  %36 = phi i8* [ %call5, %if.end26 ], [ null, %entry.split ]
  %37 = phi i8* [ %call27, %if.end26 ], [ null, %entry.split ]
  %38 = phi i8* [ %call37, %if.end26 ], [ null, %entry.split ]
  tail call void @free2DArray(i64** %call, i64 %conv) #4
  br i1 %_12_has_ownership.0, label %if.then70, label %if.end77

if.then70:                                        ; preds = %if.then64
  tail call void @free(i8* %36) #4
  tail call void @free(i8* %37) #4
  tail call void @free(i8* %38) #4
  br label %if.end77

if.end77:                                         ; preds = %if.then64, %if.then70
  tail call void @exit(i32 0) #6
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #1

declare i64* @parseStringToInt(i64*) #1

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare void @printf_s(i64*, i64) #1

declare i32 @printf(i8*, ...) #1

declare void @println_s(i64*, i64) #1

declare void @free2DArray(i64**, i64) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
