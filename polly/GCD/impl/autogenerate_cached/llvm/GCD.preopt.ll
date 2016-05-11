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
define i64 @gcd_cached(i64 %a, i64 %b, i64 %n, i64* %gcds, i64 %gcds_size, i1 zeroext %gcds_has_ownership) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp = icmp eq i64 %a, 0
  br i1 %cmp, label %if.end, label %blklab7

if.end:                                           ; preds = %entry.split
  br i1 %gcds_has_ownership, label %if.then1, label %blklab8

if.then1:                                         ; preds = %if.end
  %0 = bitcast i64* %gcds to i8*
  tail call void @free(i8* %0) #4
  br label %blklab8

blklab7:                                          ; preds = %entry.split
  %cmp3 = icmp eq i64 %b, 0
  br i1 %cmp3, label %if.end5, label %blklab9

if.end5:                                          ; preds = %blklab7
  br i1 %gcds_has_ownership, label %if.then7, label %blklab8

if.then7:                                         ; preds = %if.end5
  %1 = bitcast i64* %gcds to i8*
  tail call void @free(i8* %1) #4
  br label %blklab8

blklab9:                                          ; preds = %blklab7
  %cmp9 = icmp sgt i64 %a, %b
  %sub12 = select i1 %cmp9, i64 0, i64 %a
  %b.addr.0 = sub nsw i64 %b, %sub12
  %sub = select i1 %cmp9, i64 %b, i64 0
  %a.addr.0 = sub nsw i64 %a, %sub
  %mul = mul nsw i64 %a.addr.0, %n
  %add = add nsw i64 %mul, %b.addr.0
  %arrayidx = getelementptr inbounds i64, i64* %gcds, i64 %add
  %2 = load i64, i64* %arrayidx, align 8
  br i1 %gcds_has_ownership, label %if.then14, label %blklab8

if.then14:                                        ; preds = %blklab9
  %3 = bitcast i64* %gcds to i8*
  tail call void @free(i8* %3) #4
  br label %blklab8

blklab8:                                          ; preds = %blklab9, %if.then14, %if.end5, %if.then7, %if.end, %if.then1
  %retval.0 = phi i64 [ %b, %if.then1 ], [ %b, %if.end ], [ %a, %if.then7 ], [ %a, %if.end5 ], [ %2, %if.then14 ], [ %2, %blklab9 ]
  ret i64 %retval.0
}

; Function Attrs: nounwind
declare void @free(i8*) #3

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
  br i1 %cmp, label %blklab13, label %if.end

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
  %mul = mul nsw i64 %1, %1
  %conv15 = trunc i64 %mul to i32
  %call16 = tail call i64* @gen1DArray(i32 0, i32 %conv15) #4
  %cmp205 = icmp sgt i64 %1, 0
  br i1 %cmp205, label %while.body25.preheader.lr.ph, label %if.end41

while.body25.preheader.lr.ph:                     ; preds = %if.end
  br label %while.body25.preheader

while.body25.preheader:                           ; preds = %while.body25.preheader.lr.ph, %blklab15
  %sum.08 = phi i64 [ 0, %while.body25.preheader.lr.ph ], [ %sum.1.lcssa, %blklab15 ]
  %i.06 = phi i64 [ 0, %while.body25.preheader.lr.ph ], [ %add38, %blklab15 ]
  %cmp262 = icmp sgt i64 %1, 0
  br i1 %cmp262, label %if.end29.lr.ph, label %blklab15

if.end29.lr.ph:                                   ; preds = %while.body25.preheader
  br label %if.end29

if.end29:                                         ; preds = %if.end29.lr.ph, %if.end29
  %sum.14 = phi i64 [ %sum.08, %if.end29.lr.ph ], [ %add36, %if.end29 ]
  %j.03 = phi i64 [ 0, %if.end29.lr.ph ], [ %add37, %if.end29 ]
  %call30 = tail call i64 @gcd_cached(i64 %i.06, i64 %j.03, i64 %1, i64* %call16, i64 %mul, i1 zeroext false)
  %mul31 = mul nsw i64 %i.06, %1
  %add = add nsw i64 %j.03, %mul31
  %arrayidx32 = getelementptr inbounds i64, i64* %call16, i64 %add
  store i64 %call30, i64* %arrayidx32, align 8
  %add37 = add nuw nsw i64 %j.03, 1
  %mul33 = mul nsw i64 %i.06, %1
  %add34 = add nsw i64 %j.03, %mul33
  %arrayidx35 = getelementptr inbounds i64, i64* %call16, i64 %add34
  %6 = load i64, i64* %arrayidx35, align 8
  %add36 = add nsw i64 %6, %sum.14
  %exitcond = icmp ne i64 %add37, %1
  br i1 %exitcond, label %if.end29, label %while.body25.blklab15_crit_edge

while.body25.blklab15_crit_edge:                  ; preds = %if.end29
  %add36.lcssa = phi i64 [ %add36, %if.end29 ]
  br label %blklab15

blklab15:                                         ; preds = %while.body25.blklab15_crit_edge, %while.body25.preheader
  %sum.1.lcssa = phi i64 [ %add36.lcssa, %while.body25.blklab15_crit_edge ], [ %sum.08, %while.body25.preheader ]
  %add38 = add nuw nsw i64 %i.06, 1
  %exitcond10 = icmp ne i64 %add38, %1
  br i1 %exitcond10, label %while.body25.preheader, label %while.body.if.end41_crit_edge

while.body.if.end41_crit_edge:                    ; preds = %blklab15
  %sum.1.lcssa.lcssa = phi i64 [ %sum.1.lcssa, %blklab15 ]
  br label %if.end41

if.end41:                                         ; preds = %while.body.if.end41_crit_edge, %if.end
  %sum.0.lcssa = phi i64 [ %sum.1.lcssa.lcssa, %while.body.if.end41_crit_edge ], [ 0, %if.end ]
  %call42 = tail call noalias i8* @malloc(i64 40) #4
  %7 = bitcast i8* %call42 to i64*
  store i64 83, i64* %7, align 8
  %arrayidx44 = getelementptr inbounds i8, i8* %call42, i64 8
  %8 = bitcast i8* %arrayidx44 to i64*
  store i64 117, i64* %8, align 8
  %arrayidx45 = getelementptr inbounds i8, i8* %call42, i64 16
  %9 = bitcast i8* %arrayidx45 to i64*
  store i64 109, i64* %9, align 8
  %arrayidx46 = getelementptr inbounds i8, i8* %call42, i64 24
  %10 = bitcast i8* %arrayidx46 to i64*
  store i64 58, i64* %10, align 8
  %arrayidx47 = getelementptr inbounds i8, i8* %call42, i64 32
  %11 = bitcast i8* %arrayidx47 to i64*
  store i64 32, i64* %11, align 8
  tail call void @printf_s(i64* %7, i64 5) #4
  %call48 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa) #4
  %call52 = tail call noalias i8* @malloc(i64 256) #4
  %12 = bitcast i8* %call52 to i64*
  store i64 80, i64* %12, align 8
  %arrayidx54 = getelementptr inbounds i8, i8* %call52, i64 8
  %13 = bitcast i8* %arrayidx54 to i64*
  store i64 97, i64* %13, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %call52, i64 16
  %14 = bitcast i8* %arrayidx55 to i64*
  store i64 115, i64* %14, align 8
  %arrayidx56 = getelementptr inbounds i8, i8* %call52, i64 24
  %15 = bitcast i8* %arrayidx56 to i64*
  store i64 115, i64* %15, align 8
  %arrayidx57 = getelementptr inbounds i8, i8* %call52, i64 32
  %16 = bitcast i8* %arrayidx57 to i64*
  store i64 32, i64* %16, align 8
  %arrayidx58 = getelementptr inbounds i8, i8* %call52, i64 40
  %17 = bitcast i8* %arrayidx58 to i64*
  store i64 99, i64* %17, align 8
  %arrayidx59 = getelementptr inbounds i8, i8* %call52, i64 48
  %18 = bitcast i8* %arrayidx59 to i64*
  store i64 97, i64* %18, align 8
  %arrayidx60 = getelementptr inbounds i8, i8* %call52, i64 56
  %19 = bitcast i8* %arrayidx60 to i64*
  store i64 99, i64* %19, align 8
  %arrayidx61 = getelementptr inbounds i8, i8* %call52, i64 64
  %20 = bitcast i8* %arrayidx61 to i64*
  store i64 104, i64* %20, align 8
  %arrayidx62 = getelementptr inbounds i8, i8* %call52, i64 72
  %21 = bitcast i8* %arrayidx62 to i64*
  store i64 101, i64* %21, align 8
  %arrayidx63 = getelementptr inbounds i8, i8* %call52, i64 80
  %22 = bitcast i8* %arrayidx63 to i64*
  store i64 100, i64* %22, align 8
  %arrayidx64 = getelementptr inbounds i8, i8* %call52, i64 88
  %23 = bitcast i8* %arrayidx64 to i64*
  store i64 32, i64* %23, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %call52, i64 96
  %24 = bitcast i8* %arrayidx65 to i64*
  store i64 69, i64* %24, align 8
  %arrayidx66 = getelementptr inbounds i8, i8* %call52, i64 104
  %25 = bitcast i8* %arrayidx66 to i64*
  store i64 117, i64* %25, align 8
  %arrayidx67 = getelementptr inbounds i8, i8* %call52, i64 112
  %26 = bitcast i8* %arrayidx67 to i64*
  store i64 99, i64* %26, align 8
  %arrayidx68 = getelementptr inbounds i8, i8* %call52, i64 120
  %27 = bitcast i8* %arrayidx68 to i64*
  store i64 108, i64* %27, align 8
  %arrayidx69 = getelementptr inbounds i8, i8* %call52, i64 128
  %28 = bitcast i8* %arrayidx69 to i64*
  store i64 105, i64* %28, align 8
  %arrayidx70 = getelementptr inbounds i8, i8* %call52, i64 136
  %29 = bitcast i8* %arrayidx70 to i64*
  store i64 100, i64* %29, align 8
  %arrayidx71 = getelementptr inbounds i8, i8* %call52, i64 144
  %30 = bitcast i8* %arrayidx71 to i64*
  store i64 32, i64* %30, align 8
  %arrayidx72 = getelementptr inbounds i8, i8* %call52, i64 152
  %31 = bitcast i8* %arrayidx72 to i64*
  store i64 71, i64* %31, align 8
  %arrayidx73 = getelementptr inbounds i8, i8* %call52, i64 160
  %32 = bitcast i8* %arrayidx73 to i64*
  store i64 67, i64* %32, align 8
  %arrayidx74 = getelementptr inbounds i8, i8* %call52, i64 168
  %33 = bitcast i8* %arrayidx74 to i64*
  store i64 68, i64* %33, align 8
  %arrayidx75 = getelementptr inbounds i8, i8* %call52, i64 176
  %34 = bitcast i8* %arrayidx75 to i64*
  store i64 32, i64* %34, align 8
  %arrayidx76 = getelementptr inbounds i8, i8* %call52, i64 184
  %35 = bitcast i8* %arrayidx76 to i64*
  store i64 116, i64* %35, align 8
  %arrayidx77 = getelementptr inbounds i8, i8* %call52, i64 192
  %36 = bitcast i8* %arrayidx77 to i64*
  store i64 101, i64* %36, align 8
  %arrayidx78 = getelementptr inbounds i8, i8* %call52, i64 200
  %37 = bitcast i8* %arrayidx78 to i64*
  store i64 115, i64* %37, align 8
  %arrayidx79 = getelementptr inbounds i8, i8* %call52, i64 208
  %38 = bitcast i8* %arrayidx79 to i64*
  store i64 116, i64* %38, align 8
  %arrayidx80 = getelementptr inbounds i8, i8* %call52, i64 216
  %39 = bitcast i8* %arrayidx80 to i64*
  store i64 32, i64* %39, align 8
  %arrayidx81 = getelementptr inbounds i8, i8* %call52, i64 224
  %40 = bitcast i8* %arrayidx81 to i64*
  store i64 99, i64* %40, align 8
  %arrayidx82 = getelementptr inbounds i8, i8* %call52, i64 232
  %41 = bitcast i8* %arrayidx82 to i64*
  store i64 97, i64* %41, align 8
  %arrayidx83 = getelementptr inbounds i8, i8* %call52, i64 240
  %42 = bitcast i8* %arrayidx83 to i64*
  store i64 115, i64* %42, align 8
  %arrayidx84 = getelementptr inbounds i8, i8* %call52, i64 248
  %43 = bitcast i8* %arrayidx84 to i64*
  store i64 101, i64* %43, align 8
  tail call void @println_s(i64* %12, i64 32) #4
  %phitmp = bitcast i64* %call16 to i8*
  br label %blklab13

blklab13:                                         ; preds = %entry.split, %if.end41
  %_13_has_ownership.0 = phi i1 [ true, %if.end41 ], [ false, %entry.split ]
  %44 = phi i8* [ %call5, %if.end41 ], [ null, %entry.split ]
  %45 = phi i8* [ %call42, %if.end41 ], [ null, %entry.split ]
  %gcds.0 = phi i8* [ %phitmp, %if.end41 ], [ null, %entry.split ]
  %46 = phi i8* [ %call52, %if.end41 ], [ null, %entry.split ]
  br i1 %_13_has_ownership.0, label %if.then86, label %if.end105.critedge

if.then86:                                        ; preds = %blklab13
  tail call void @free(i8* %gcds.0) #4
  tail call void @free2DArray(i64** %call, i64 %conv) #4
  tail call void @free(i8* %44) #4
  tail call void @free(i8* %45) #4
  tail call void @free(i8* %46) #4
  br label %if.end105

if.end105.critedge:                               ; preds = %blklab13
  tail call void @free2DArray(i64** %call, i64 %conv) #4
  br label %if.end105

if.end105:                                        ; preds = %if.end105.critedge, %if.then86
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

declare void @free2DArray(i64**, i64) #1

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
