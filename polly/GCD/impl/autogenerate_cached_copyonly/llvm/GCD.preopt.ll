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
define i64 @gcd_cached(i64 %a, i64 %b, i64 %n, i64* %gcds, i64 %gcds_size) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp = icmp eq i64 %a, 0
  br i1 %cmp, label %blklab8, label %blklab7

blklab7:                                          ; preds = %entry.split
  %cmp1 = icmp eq i64 %b, 0
  br i1 %cmp1, label %blklab8, label %blklab9

blklab9:                                          ; preds = %blklab7
  %cmp4 = icmp sgt i64 %a, %b
  %sub7 = select i1 %cmp4, i64 0, i64 %a
  %b.addr.0 = sub nsw i64 %b, %sub7
  %sub = select i1 %cmp4, i64 %b, i64 0
  %a.addr.0 = sub nsw i64 %a, %sub
  %mul = mul nsw i64 %a.addr.0, %n
  %add = add nsw i64 %mul, %b.addr.0
  %arrayidx = getelementptr inbounds i64, i64* %gcds, i64 %add
  %0 = load i64, i64* %arrayidx, align 8
  br label %blklab8

blklab8:                                          ; preds = %blklab7, %entry.split, %blklab9
  %retval.0 = phi i64 [ %0, %blklab9 ], [ %b, %entry.split ], [ %a, %blklab7 ]
  ret i64 %retval.0
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #4
  %0 = load i64*, i64** %call, align 8
  %call1 = tail call i64* @parseStringToInt(i64* %0) #4
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab13, label %if.end

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8
  %call3 = tail call noalias i8* @malloc(i64 32) #4
  %2 = bitcast i8* %call3 to i64*
  store i64 78, i64* %2, align 8
  %arrayidx5 = getelementptr inbounds i8, i8* %call3, i64 8
  %3 = bitcast i8* %arrayidx5 to i64*
  store i64 32, i64* %3, align 8
  %arrayidx6 = getelementptr inbounds i8, i8* %call3, i64 16
  %4 = bitcast i8* %arrayidx6 to i64*
  store i64 61, i64* %4, align 8
  %arrayidx7 = getelementptr inbounds i8, i8* %call3, i64 24
  %5 = bitcast i8* %arrayidx7 to i64*
  store i64 32, i64* %5, align 8
  tail call void @printf_s(i64* %2, i64 4) #4
  %call8 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1) #4
  %mul = mul nsw i64 %1, %1
  %conv10 = trunc i64 %mul to i32
  %call11 = tail call i64* @gen1DArray(i32 0, i32 %conv10) #4
  %cmp124 = icmp sgt i64 %1, 0
  br i1 %cmp124, label %while.body17.preheader.lr.ph, label %blklab14

while.body17.preheader.lr.ph:                     ; preds = %if.end
  br label %while.body17.preheader

while.body17.preheader:                           ; preds = %while.body17.preheader.lr.ph, %blklab15
  %sum.07 = phi i64 [ 0, %while.body17.preheader.lr.ph ], [ %sum.1.lcssa, %blklab15 ]
  %i.05 = phi i64 [ 0, %while.body17.preheader.lr.ph ], [ %add30, %blklab15 ]
  %cmp181 = icmp sgt i64 %1, 0
  br i1 %cmp181, label %if.end21.lr.ph, label %blklab15

if.end21.lr.ph:                                   ; preds = %while.body17.preheader
  br label %if.end21

if.end21:                                         ; preds = %if.end21.lr.ph, %if.end21
  %sum.13 = phi i64 [ %sum.07, %if.end21.lr.ph ], [ %add28, %if.end21 ]
  %j.02 = phi i64 [ 0, %if.end21.lr.ph ], [ %add29, %if.end21 ]
  %call22 = tail call i64 @gcd_cached(i64 %i.05, i64 %j.02, i64 %1, i64* %call11, i64 %mul)
  %mul23 = mul nsw i64 %i.05, %1
  %add = add nsw i64 %j.02, %mul23
  %arrayidx24 = getelementptr inbounds i64, i64* %call11, i64 %add
  store i64 %call22, i64* %arrayidx24, align 8
  %add29 = add nuw nsw i64 %j.02, 1
  %mul25 = mul nsw i64 %i.05, %1
  %add26 = add nsw i64 %j.02, %mul25
  %arrayidx27 = getelementptr inbounds i64, i64* %call11, i64 %add26
  %6 = load i64, i64* %arrayidx27, align 8
  %add28 = add nsw i64 %6, %sum.13
  %exitcond = icmp ne i64 %add29, %1
  br i1 %exitcond, label %if.end21, label %while.body17.blklab15_crit_edge

while.body17.blklab15_crit_edge:                  ; preds = %if.end21
  %add28.lcssa = phi i64 [ %add28, %if.end21 ]
  br label %blklab15

blklab15:                                         ; preds = %while.body17.blklab15_crit_edge, %while.body17.preheader
  %sum.1.lcssa = phi i64 [ %add28.lcssa, %while.body17.blklab15_crit_edge ], [ %sum.07, %while.body17.preheader ]
  %add30 = add nuw nsw i64 %i.05, 1
  %exitcond9 = icmp ne i64 %add30, %1
  br i1 %exitcond9, label %while.body17.preheader, label %while.body.blklab14_crit_edge

while.body.blklab14_crit_edge:                    ; preds = %blklab15
  %sum.1.lcssa.lcssa = phi i64 [ %sum.1.lcssa, %blklab15 ]
  br label %blklab14

blklab14:                                         ; preds = %while.body.blklab14_crit_edge, %if.end
  %sum.0.lcssa = phi i64 [ %sum.1.lcssa.lcssa, %while.body.blklab14_crit_edge ], [ 0, %if.end ]
  %call31 = tail call noalias i8* @malloc(i64 40) #4
  %7 = bitcast i8* %call31 to i64*
  store i64 83, i64* %7, align 8
  %arrayidx33 = getelementptr inbounds i8, i8* %call31, i64 8
  %8 = bitcast i8* %arrayidx33 to i64*
  store i64 117, i64* %8, align 8
  %arrayidx34 = getelementptr inbounds i8, i8* %call31, i64 16
  %9 = bitcast i8* %arrayidx34 to i64*
  store i64 109, i64* %9, align 8
  %arrayidx35 = getelementptr inbounds i8, i8* %call31, i64 24
  %10 = bitcast i8* %arrayidx35 to i64*
  store i64 58, i64* %10, align 8
  %arrayidx36 = getelementptr inbounds i8, i8* %call31, i64 32
  %11 = bitcast i8* %arrayidx36 to i64*
  store i64 32, i64* %11, align 8
  tail call void @printf_s(i64* %7, i64 5) #4
  %call37 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa) #4
  %call38 = tail call noalias i8* @malloc(i64 256) #4
  %12 = bitcast i8* %call38 to i64*
  store i64 80, i64* %12, align 8
  %arrayidx40 = getelementptr inbounds i8, i8* %call38, i64 8
  %13 = bitcast i8* %arrayidx40 to i64*
  store i64 97, i64* %13, align 8
  %arrayidx41 = getelementptr inbounds i8, i8* %call38, i64 16
  %14 = bitcast i8* %arrayidx41 to i64*
  store i64 115, i64* %14, align 8
  %arrayidx42 = getelementptr inbounds i8, i8* %call38, i64 24
  %15 = bitcast i8* %arrayidx42 to i64*
  store i64 115, i64* %15, align 8
  %arrayidx43 = getelementptr inbounds i8, i8* %call38, i64 32
  %16 = bitcast i8* %arrayidx43 to i64*
  store i64 32, i64* %16, align 8
  %arrayidx44 = getelementptr inbounds i8, i8* %call38, i64 40
  %17 = bitcast i8* %arrayidx44 to i64*
  store i64 99, i64* %17, align 8
  %arrayidx45 = getelementptr inbounds i8, i8* %call38, i64 48
  %18 = bitcast i8* %arrayidx45 to i64*
  store i64 97, i64* %18, align 8
  %arrayidx46 = getelementptr inbounds i8, i8* %call38, i64 56
  %19 = bitcast i8* %arrayidx46 to i64*
  store i64 99, i64* %19, align 8
  %arrayidx47 = getelementptr inbounds i8, i8* %call38, i64 64
  %20 = bitcast i8* %arrayidx47 to i64*
  store i64 104, i64* %20, align 8
  %arrayidx48 = getelementptr inbounds i8, i8* %call38, i64 72
  %21 = bitcast i8* %arrayidx48 to i64*
  store i64 101, i64* %21, align 8
  %arrayidx49 = getelementptr inbounds i8, i8* %call38, i64 80
  %22 = bitcast i8* %arrayidx49 to i64*
  store i64 100, i64* %22, align 8
  %arrayidx50 = getelementptr inbounds i8, i8* %call38, i64 88
  %23 = bitcast i8* %arrayidx50 to i64*
  store i64 32, i64* %23, align 8
  %arrayidx51 = getelementptr inbounds i8, i8* %call38, i64 96
  %24 = bitcast i8* %arrayidx51 to i64*
  store i64 69, i64* %24, align 8
  %arrayidx52 = getelementptr inbounds i8, i8* %call38, i64 104
  %25 = bitcast i8* %arrayidx52 to i64*
  store i64 117, i64* %25, align 8
  %arrayidx53 = getelementptr inbounds i8, i8* %call38, i64 112
  %26 = bitcast i8* %arrayidx53 to i64*
  store i64 99, i64* %26, align 8
  %arrayidx54 = getelementptr inbounds i8, i8* %call38, i64 120
  %27 = bitcast i8* %arrayidx54 to i64*
  store i64 108, i64* %27, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %call38, i64 128
  %28 = bitcast i8* %arrayidx55 to i64*
  store i64 105, i64* %28, align 8
  %arrayidx56 = getelementptr inbounds i8, i8* %call38, i64 136
  %29 = bitcast i8* %arrayidx56 to i64*
  store i64 100, i64* %29, align 8
  %arrayidx57 = getelementptr inbounds i8, i8* %call38, i64 144
  %30 = bitcast i8* %arrayidx57 to i64*
  store i64 32, i64* %30, align 8
  %arrayidx58 = getelementptr inbounds i8, i8* %call38, i64 152
  %31 = bitcast i8* %arrayidx58 to i64*
  store i64 71, i64* %31, align 8
  %arrayidx59 = getelementptr inbounds i8, i8* %call38, i64 160
  %32 = bitcast i8* %arrayidx59 to i64*
  store i64 67, i64* %32, align 8
  %arrayidx60 = getelementptr inbounds i8, i8* %call38, i64 168
  %33 = bitcast i8* %arrayidx60 to i64*
  store i64 68, i64* %33, align 8
  %arrayidx61 = getelementptr inbounds i8, i8* %call38, i64 176
  %34 = bitcast i8* %arrayidx61 to i64*
  store i64 32, i64* %34, align 8
  %arrayidx62 = getelementptr inbounds i8, i8* %call38, i64 184
  %35 = bitcast i8* %arrayidx62 to i64*
  store i64 116, i64* %35, align 8
  %arrayidx63 = getelementptr inbounds i8, i8* %call38, i64 192
  %36 = bitcast i8* %arrayidx63 to i64*
  store i64 101, i64* %36, align 8
  %arrayidx64 = getelementptr inbounds i8, i8* %call38, i64 200
  %37 = bitcast i8* %arrayidx64 to i64*
  store i64 115, i64* %37, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %call38, i64 208
  %38 = bitcast i8* %arrayidx65 to i64*
  store i64 116, i64* %38, align 8
  %arrayidx66 = getelementptr inbounds i8, i8* %call38, i64 216
  %39 = bitcast i8* %arrayidx66 to i64*
  store i64 32, i64* %39, align 8
  %arrayidx67 = getelementptr inbounds i8, i8* %call38, i64 224
  %40 = bitcast i8* %arrayidx67 to i64*
  store i64 99, i64* %40, align 8
  %arrayidx68 = getelementptr inbounds i8, i8* %call38, i64 232
  %41 = bitcast i8* %arrayidx68 to i64*
  store i64 97, i64* %41, align 8
  %arrayidx69 = getelementptr inbounds i8, i8* %call38, i64 240
  %42 = bitcast i8* %arrayidx69 to i64*
  store i64 115, i64* %42, align 8
  %arrayidx70 = getelementptr inbounds i8, i8* %call38, i64 248
  %43 = bitcast i8* %arrayidx70 to i64*
  store i64 101, i64* %43, align 8
  tail call void @println_s(i64* %12, i64 32) #4
  br label %blklab13

blklab13:                                         ; preds = %entry.split, %blklab14
  tail call void @exit(i32 0) #6
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #1

declare i64* @parseStringToInt(i64*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare void @printf_s(i64*, i64) #1

declare i32 @printf(i8*, ...) #1

declare i64* @gen1DArray(i32, i32) #1

declare void @println_s(i64*, i64) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"}
