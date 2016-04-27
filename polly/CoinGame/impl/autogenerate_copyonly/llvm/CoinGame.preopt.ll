; ModuleID = 'llvm/CoinGame.preopt.ll.tmp'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i64 %n) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp5 = icmp sgt i64 %n, 0
  br i1 %cmp5, label %while.body2.preheader.lr.ph, label %blklab0

while.body2.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body2.preheader

while.body2.preheader:                            ; preds = %while.body2.preheader.lr.ph, %blklab1
  %indvars.iv = phi i64 [ %n, %while.body2.preheader.lr.ph ], [ %indvars.iv.next, %blklab1 ]
  %s.06 = phi i64 [ 0, %while.body2.preheader.lr.ph ], [ %add52, %blklab1 ]
  br i1 true, label %if.end5.lr.ph, label %blklab1

if.end5.lr.ph:                                    ; preds = %while.body2.preheader
  br label %if.end5

if.end5:                                          ; preds = %if.end5.lr.ph, %blklab3
  %j.04 = phi i64 [ %s.06, %if.end5.lr.ph ], [ %add50, %blklab3 ]
  %i.03 = phi i64 [ 0, %if.end5.lr.ph ], [ %add51, %blklab3 ]
  %add = add nuw nsw i64 %i.03, 1
  %cmp6 = icmp sge i64 %add, %n
  %cmp9 = icmp slt i64 %j.04, 1
  %or.cond = or i1 %cmp6, %cmp9
  br i1 %or.cond, label %blklab4, label %if.end11

if.end11:                                         ; preds = %if.end5
  %mul = mul nsw i64 %add, %n
  %add13 = add nsw i64 %j.04, -1
  %sub14 = add i64 %add13, %mul
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %sub14
  %0 = load i64, i64* %arrayidx, align 8
  br label %blklab4

blklab4:                                          ; preds = %if.end5, %if.end11
  %y.0 = phi i64 [ %0, %if.end11 ], [ 0, %if.end5 ]
  %add15 = add nuw nsw i64 %i.03, 2
  %cmp16 = icmp slt i64 %add15, %n
  br i1 %cmp16, label %if.end18, label %blklab5

if.end18:                                         ; preds = %blklab4
  %mul20 = mul nsw i64 %add15, %n
  %add21 = add nsw i64 %mul20, %j.04
  %arrayidx22 = getelementptr inbounds i64, i64* %moves, i64 %add21
  %1 = load i64, i64* %arrayidx22, align 8
  br label %blklab5

blklab5:                                          ; preds = %blklab4, %if.end18
  %x.0 = phi i64 [ %1, %if.end18 ], [ 0, %blklab4 ]
  %cmp24 = icmp slt i64 %j.04, 2
  br i1 %cmp24, label %blklab6, label %if.end26

if.end26:                                         ; preds = %blklab5
  %mul27 = mul nsw i64 %i.03, %n
  %add28 = add nsw i64 %j.04, -2
  %sub29 = add i64 %add28, %mul27
  %arrayidx30 = getelementptr inbounds i64, i64* %moves, i64 %sub29
  %2 = load i64, i64* %arrayidx30, align 8
  br label %blklab6

blklab6:                                          ; preds = %blklab5, %if.end26
  %z.0 = phi i64 [ %2, %if.end26 ], [ 0, %blklab5 ]
  %cmp31 = icmp sgt i64 %x.0, %y.0
  %y.0.x.0 = select i1 %cmp31, i64 %y.0, i64 %x.0
  %cmp34 = icmp sgt i64 %z.0, %y.0
  %z.1 = select i1 %cmp34, i64 %y.0, i64 %z.0
  %add37 = add nsw i64 %y.0.x.0, %i.03
  %add38 = add nsw i64 %z.1, %j.04
  %cmp39 = icmp sgt i64 %add37, %add38
  br i1 %cmp39, label %if.end41, label %blklab9

if.end41:                                         ; preds = %blklab6
  %add42 = add nsw i64 %y.0.x.0, %i.03
  %mul43 = mul nsw i64 %i.03, %n
  %add44 = add nsw i64 %mul43, %j.04
  %arrayidx45 = getelementptr inbounds i64, i64* %moves, i64 %add44
  store i64 %add42, i64* %arrayidx45, align 8
  br label %blklab3

blklab9:                                          ; preds = %blklab6
  %add46 = add nsw i64 %z.1, %j.04
  %mul47 = mul nsw i64 %i.03, %n
  %add48 = add nsw i64 %mul47, %j.04
  %arrayidx49 = getelementptr inbounds i64, i64* %moves, i64 %add48
  store i64 %add46, i64* %arrayidx49, align 8
  br label %blklab3

blklab3:                                          ; preds = %if.end41, %blklab9
  %add51 = add nuw nsw i64 %i.03, 1
  %add50 = add nuw nsw i64 %j.04, 1
  %exitcond = icmp ne i64 %add51, %indvars.iv
  br i1 %exitcond, label %if.end5, label %while.body2.blklab1_crit_edge

while.body2.blklab1_crit_edge:                    ; preds = %blklab3
  br label %blklab1

blklab1:                                          ; preds = %while.body2.blklab1_crit_edge, %while.body2.preheader
  %add52 = add nuw nsw i64 %s.06, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %exitcond7 = icmp ne i64 %add52, %n
  br i1 %exitcond7, label %while.body2.preheader, label %while.body.blklab0_crit_edge

while.body.blklab0_crit_edge:                     ; preds = %blklab1
  br label %blklab0

blklab0:                                          ; preds = %while.body.blklab0_crit_edge, %entry.split
  ret i64* %moves
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
  br i1 %cmp, label %blklab11, label %if.end

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8
  %mul = mul nsw i64 %1, %1
  %conv4 = trunc i64 %mul to i32
  %call5 = tail call i64* @gen1DArray(i32 0, i32 %conv4) #4
  %call6 = tail call i64* @findMoves(i64* %call5, i64 %mul, i64 %1)
  %sub7 = add nsw i64 %1, -1
  %arrayidx8 = getelementptr inbounds i64, i64* %call6, i64 %sub7
  %2 = load i64, i64* %arrayidx8, align 8
  %call9 = tail call noalias i8* @malloc(i64 400) #4
  %3 = bitcast i8* %call9 to i64*
  store i64 84, i64* %3, align 8
  %arrayidx11 = getelementptr inbounds i8, i8* %call9, i64 8
  %4 = bitcast i8* %arrayidx11 to i64*
  store i64 104, i64* %4, align 8
  %arrayidx12 = getelementptr inbounds i8, i8* %call9, i64 16
  %5 = bitcast i8* %arrayidx12 to i64*
  store i64 101, i64* %5, align 8
  %arrayidx13 = getelementptr inbounds i8, i8* %call9, i64 24
  %6 = bitcast i8* %arrayidx13 to i64*
  store i64 32, i64* %6, align 8
  %arrayidx14 = getelementptr inbounds i8, i8* %call9, i64 32
  %7 = bitcast i8* %arrayidx14 to i64*
  store i64 116, i64* %7, align 8
  %arrayidx15 = getelementptr inbounds i8, i8* %call9, i64 40
  %8 = bitcast i8* %arrayidx15 to i64*
  store i64 111, i64* %8, align 8
  %arrayidx16 = getelementptr inbounds i8, i8* %call9, i64 48
  %9 = bitcast i8* %arrayidx16 to i64*
  store i64 116, i64* %9, align 8
  %arrayidx17 = getelementptr inbounds i8, i8* %call9, i64 56
  %10 = bitcast i8* %arrayidx17 to i64*
  store i64 97, i64* %10, align 8
  %arrayidx18 = getelementptr inbounds i8, i8* %call9, i64 64
  %11 = bitcast i8* %arrayidx18 to i64*
  store i64 108, i64* %11, align 8
  %arrayidx19 = getelementptr inbounds i8, i8* %call9, i64 72
  %12 = bitcast i8* %arrayidx19 to i64*
  store i64 32, i64* %12, align 8
  %arrayidx20 = getelementptr inbounds i8, i8* %call9, i64 80
  %13 = bitcast i8* %arrayidx20 to i64*
  store i64 97, i64* %13, align 8
  %arrayidx21 = getelementptr inbounds i8, i8* %call9, i64 88
  %14 = bitcast i8* %arrayidx21 to i64*
  store i64 109, i64* %14, align 8
  %arrayidx22 = getelementptr inbounds i8, i8* %call9, i64 96
  %15 = bitcast i8* %arrayidx22 to i64*
  store i64 111, i64* %15, align 8
  %arrayidx23 = getelementptr inbounds i8, i8* %call9, i64 104
  %16 = bitcast i8* %arrayidx23 to i64*
  store i64 117, i64* %16, align 8
  %arrayidx24 = getelementptr inbounds i8, i8* %call9, i64 112
  %17 = bitcast i8* %arrayidx24 to i64*
  store i64 110, i64* %17, align 8
  %arrayidx25 = getelementptr inbounds i8, i8* %call9, i64 120
  %18 = bitcast i8* %arrayidx25 to i64*
  store i64 116, i64* %18, align 8
  %arrayidx26 = getelementptr inbounds i8, i8* %call9, i64 128
  %19 = bitcast i8* %arrayidx26 to i64*
  store i64 32, i64* %19, align 8
  %arrayidx27 = getelementptr inbounds i8, i8* %call9, i64 136
  %20 = bitcast i8* %arrayidx27 to i64*
  store i64 111, i64* %20, align 8
  %arrayidx28 = getelementptr inbounds i8, i8* %call9, i64 144
  %21 = bitcast i8* %arrayidx28 to i64*
  store i64 102, i64* %21, align 8
  %arrayidx29 = getelementptr inbounds i8, i8* %call9, i64 152
  %22 = bitcast i8* %arrayidx29 to i64*
  store i64 32, i64* %22, align 8
  %arrayidx30 = getelementptr inbounds i8, i8* %call9, i64 160
  %23 = bitcast i8* %arrayidx30 to i64*
  store i64 109, i64* %23, align 8
  %arrayidx31 = getelementptr inbounds i8, i8* %call9, i64 168
  %24 = bitcast i8* %arrayidx31 to i64*
  store i64 111, i64* %24, align 8
  %arrayidx32 = getelementptr inbounds i8, i8* %call9, i64 176
  %25 = bitcast i8* %arrayidx32 to i64*
  store i64 110, i64* %25, align 8
  %arrayidx33 = getelementptr inbounds i8, i8* %call9, i64 184
  %26 = bitcast i8* %arrayidx33 to i64*
  store i64 101, i64* %26, align 8
  %arrayidx34 = getelementptr inbounds i8, i8* %call9, i64 192
  %27 = bitcast i8* %arrayidx34 to i64*
  store i64 121, i64* %27, align 8
  %arrayidx35 = getelementptr inbounds i8, i8* %call9, i64 200
  %28 = bitcast i8* %arrayidx35 to i64*
  store i64 32, i64* %28, align 8
  %arrayidx36 = getelementptr inbounds i8, i8* %call9, i64 208
  %29 = bitcast i8* %arrayidx36 to i64*
  store i64 40, i64* %29, align 8
  %arrayidx37 = getelementptr inbounds i8, i8* %call9, i64 216
  %30 = bitcast i8* %arrayidx37 to i64*
  store i64 109, i64* %30, align 8
  %arrayidx38 = getelementptr inbounds i8, i8* %call9, i64 224
  %31 = bitcast i8* %arrayidx38 to i64*
  store i64 97, i64* %31, align 8
  %arrayidx39 = getelementptr inbounds i8, i8* %call9, i64 232
  %32 = bitcast i8* %arrayidx39 to i64*
  store i64 120, i64* %32, align 8
  %arrayidx40 = getelementptr inbounds i8, i8* %call9, i64 240
  %33 = bitcast i8* %arrayidx40 to i64*
  store i64 105, i64* %33, align 8
  %arrayidx41 = getelementptr inbounds i8, i8* %call9, i64 248
  %34 = bitcast i8* %arrayidx41 to i64*
  store i64 109, i64* %34, align 8
  %arrayidx42 = getelementptr inbounds i8, i8* %call9, i64 256
  %35 = bitcast i8* %arrayidx42 to i64*
  store i64 117, i64* %35, align 8
  %arrayidx43 = getelementptr inbounds i8, i8* %call9, i64 264
  %36 = bitcast i8* %arrayidx43 to i64*
  store i64 109, i64* %36, align 8
  %arrayidx44 = getelementptr inbounds i8, i8* %call9, i64 272
  %37 = bitcast i8* %arrayidx44 to i64*
  store i64 41, i64* %37, align 8
  %arrayidx45 = getelementptr inbounds i8, i8* %call9, i64 280
  %38 = bitcast i8* %arrayidx45 to i64*
  store i64 32, i64* %38, align 8
  %arrayidx46 = getelementptr inbounds i8, i8* %call9, i64 288
  %39 = bitcast i8* %arrayidx46 to i64*
  store i64 65, i64* %39, align 8
  %arrayidx47 = getelementptr inbounds i8, i8* %call9, i64 296
  %40 = bitcast i8* %arrayidx47 to i64*
  store i64 108, i64* %40, align 8
  %arrayidx48 = getelementptr inbounds i8, i8* %call9, i64 304
  %41 = bitcast i8* %arrayidx48 to i64*
  store i64 105, i64* %41, align 8
  %arrayidx49 = getelementptr inbounds i8, i8* %call9, i64 312
  %42 = bitcast i8* %arrayidx49 to i64*
  store i64 99, i64* %42, align 8
  %arrayidx50 = getelementptr inbounds i8, i8* %call9, i64 320
  %43 = bitcast i8* %arrayidx50 to i64*
  store i64 101, i64* %43, align 8
  %arrayidx51 = getelementptr inbounds i8, i8* %call9, i64 328
  %44 = bitcast i8* %arrayidx51 to i64*
  store i64 32, i64* %44, align 8
  %arrayidx52 = getelementptr inbounds i8, i8* %call9, i64 336
  %45 = bitcast i8* %arrayidx52 to i64*
  store i64 103, i64* %45, align 8
  %arrayidx53 = getelementptr inbounds i8, i8* %call9, i64 344
  %46 = bitcast i8* %arrayidx53 to i64*
  store i64 101, i64* %46, align 8
  %arrayidx54 = getelementptr inbounds i8, i8* %call9, i64 352
  %47 = bitcast i8* %arrayidx54 to i64*
  store i64 116, i64* %47, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %call9, i64 360
  %48 = bitcast i8* %arrayidx55 to i64*
  store i64 115, i64* %48, align 8
  %arrayidx56 = getelementptr inbounds i8, i8* %call9, i64 368
  %49 = bitcast i8* %arrayidx56 to i64*
  store i64 32, i64* %49, align 8
  %arrayidx57 = getelementptr inbounds i8, i8* %call9, i64 376
  %50 = bitcast i8* %arrayidx57 to i64*
  store i64 105, i64* %50, align 8
  %arrayidx58 = getelementptr inbounds i8, i8* %call9, i64 384
  %51 = bitcast i8* %arrayidx58 to i64*
  store i64 115, i64* %51, align 8
  %arrayidx59 = getelementptr inbounds i8, i8* %call9, i64 392
  %52 = bitcast i8* %arrayidx59 to i64*
  store i64 32, i64* %52, align 8
  tail call void @printf_s(i64* %3, i64 50) #4
  %call60 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4
  %call61 = tail call noalias i8* @malloc(i64 184) #4
  %53 = bitcast i8* %call61 to i64*
  store i64 80, i64* %53, align 8
  %arrayidx63 = getelementptr inbounds i8, i8* %call61, i64 8
  %54 = bitcast i8* %arrayidx63 to i64*
  store i64 97, i64* %54, align 8
  %arrayidx64 = getelementptr inbounds i8, i8* %call61, i64 16
  %55 = bitcast i8* %arrayidx64 to i64*
  store i64 115, i64* %55, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %call61, i64 24
  %56 = bitcast i8* %arrayidx65 to i64*
  store i64 115, i64* %56, align 8
  %arrayidx66 = getelementptr inbounds i8, i8* %call61, i64 32
  %57 = bitcast i8* %arrayidx66 to i64*
  store i64 32, i64* %57, align 8
  %arrayidx67 = getelementptr inbounds i8, i8* %call61, i64 40
  %58 = bitcast i8* %arrayidx67 to i64*
  store i64 67, i64* %58, align 8
  %arrayidx68 = getelementptr inbounds i8, i8* %call61, i64 48
  %59 = bitcast i8* %arrayidx68 to i64*
  store i64 111, i64* %59, align 8
  %arrayidx69 = getelementptr inbounds i8, i8* %call61, i64 56
  %60 = bitcast i8* %arrayidx69 to i64*
  store i64 105, i64* %60, align 8
  %arrayidx70 = getelementptr inbounds i8, i8* %call61, i64 64
  %61 = bitcast i8* %arrayidx70 to i64*
  store i64 110, i64* %61, align 8
  %arrayidx71 = getelementptr inbounds i8, i8* %call61, i64 72
  %62 = bitcast i8* %arrayidx71 to i64*
  store i64 71, i64* %62, align 8
  %arrayidx72 = getelementptr inbounds i8, i8* %call61, i64 80
  %63 = bitcast i8* %arrayidx72 to i64*
  store i64 97, i64* %63, align 8
  %arrayidx73 = getelementptr inbounds i8, i8* %call61, i64 88
  %64 = bitcast i8* %arrayidx73 to i64*
  store i64 109, i64* %64, align 8
  %arrayidx74 = getelementptr inbounds i8, i8* %call61, i64 96
  %65 = bitcast i8* %arrayidx74 to i64*
  store i64 101, i64* %65, align 8
  %arrayidx75 = getelementptr inbounds i8, i8* %call61, i64 104
  %66 = bitcast i8* %arrayidx75 to i64*
  store i64 32, i64* %66, align 8
  %arrayidx76 = getelementptr inbounds i8, i8* %call61, i64 112
  %67 = bitcast i8* %arrayidx76 to i64*
  store i64 116, i64* %67, align 8
  %arrayidx77 = getelementptr inbounds i8, i8* %call61, i64 120
  %68 = bitcast i8* %arrayidx77 to i64*
  store i64 101, i64* %68, align 8
  %arrayidx78 = getelementptr inbounds i8, i8* %call61, i64 128
  %69 = bitcast i8* %arrayidx78 to i64*
  store i64 115, i64* %69, align 8
  %arrayidx79 = getelementptr inbounds i8, i8* %call61, i64 136
  %70 = bitcast i8* %arrayidx79 to i64*
  store i64 116, i64* %70, align 8
  %arrayidx80 = getelementptr inbounds i8, i8* %call61, i64 144
  %71 = bitcast i8* %arrayidx80 to i64*
  store i64 32, i64* %71, align 8
  %arrayidx81 = getelementptr inbounds i8, i8* %call61, i64 152
  %72 = bitcast i8* %arrayidx81 to i64*
  store i64 99, i64* %72, align 8
  %arrayidx82 = getelementptr inbounds i8, i8* %call61, i64 160
  %73 = bitcast i8* %arrayidx82 to i64*
  store i64 97, i64* %73, align 8
  %arrayidx83 = getelementptr inbounds i8, i8* %call61, i64 168
  %74 = bitcast i8* %arrayidx83 to i64*
  store i64 115, i64* %74, align 8
  %arrayidx84 = getelementptr inbounds i8, i8* %call61, i64 176
  %75 = bitcast i8* %arrayidx84 to i64*
  store i64 101, i64* %75, align 8
  tail call void @println_s(i64* %53, i64 23) #4
  br label %blklab11

blklab11:                                         ; preds = %entry.split, %if.end
  tail call void @exit(i32 0) #5
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #1

declare i64* @parseStringToInt(i64*) #1

declare i64* @gen1DArray(i32, i32) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @printf_s(i64*, i64) #1

declare i32 @printf(i8*, ...) #1

declare void @println_s(i64*, i64) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"}
