; ModuleID = 'llvm/CoinGame.preopt.ll.tmp'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_has_ownership, i64 %n) #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %conv1 = trunc i64 %n to i32
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #4
  %conv9 = trunc i64 %n to i32
  %call10 = tail call i64* @gen1DArray(i32 0, i32 %conv9) #4
  %conv18 = trunc i64 %n to i32
  %call19 = tail call i64* @gen1DArray(i32 0, i32 %conv18) #4
  %cmp4 = icmp sgt i64 %n, 0
  br i1 %cmp4, label %while.body27.preheader.lr.ph, label %if.then108

while.body27.preheader.lr.ph:                     ; preds = %entry.split
  br label %while.body27.preheader

while.body27.preheader:                           ; preds = %while.body27.preheader.lr.ph, %blklab1
  %indvars.iv = phi i64 [ %n, %while.body27.preheader.lr.ph ], [ %indvars.iv.next, %blklab1 ]
  %s.05 = phi i64 [ 0, %while.body27.preheader.lr.ph ], [ %add103, %blklab1 ]
  br i1 true, label %if.end31.lr.ph, label %blklab1

if.end31.lr.ph:                                   ; preds = %while.body27.preheader
  br label %if.end31

if.end31:                                         ; preds = %if.end31.lr.ph, %blklab3
  %j.03 = phi i64 [ %s.05, %if.end31.lr.ph ], [ %add101, %blklab3 ]
  %i.02 = phi i64 [ 0, %if.end31.lr.ph ], [ %add102, %blklab3 ]
  %arrayidx = getelementptr inbounds i64, i64* %call10, i64 %i.02
  store i64 0, i64* %arrayidx, align 8
  %add = add nuw nsw i64 %i.02, 1
  %cmp32 = icmp sge i64 %add, %n
  %cmp36 = icmp slt i64 %j.03, 1
  %or.cond = or i1 %cmp32, %cmp36
  br i1 %or.cond, label %blklab4, label %if.end39

if.end39:                                         ; preds = %if.end31
  %mul = mul nsw i64 %add, %n
  %add41 = add nsw i64 %j.03, -1
  %sub42 = add i64 %add41, %mul
  %arrayidx43 = getelementptr inbounds i64, i64* %moves, i64 %sub42
  %0 = load i64, i64* %arrayidx43, align 8
  %arrayidx44 = getelementptr inbounds i64, i64* %call10, i64 %i.02
  store i64 %0, i64* %arrayidx44, align 8
  br label %blklab4

blklab4:                                          ; preds = %if.end31, %if.end39
  %arrayidx45 = getelementptr inbounds i64, i64* %call, i64 %i.02
  store i64 0, i64* %arrayidx45, align 8
  %add46 = add nuw nsw i64 %i.02, 2
  %cmp47 = icmp slt i64 %add46, %n
  br i1 %cmp47, label %if.end50, label %blklab5

if.end50:                                         ; preds = %blklab4
  %mul52 = mul nsw i64 %add46, %n
  %add53 = add nsw i64 %mul52, %j.03
  %arrayidx54 = getelementptr inbounds i64, i64* %moves, i64 %add53
  %1 = load i64, i64* %arrayidx54, align 8
  %arrayidx55 = getelementptr inbounds i64, i64* %call, i64 %i.02
  store i64 %1, i64* %arrayidx55, align 8
  br label %blklab5

blklab5:                                          ; preds = %blklab4, %if.end50
  %arrayidx56 = getelementptr inbounds i64, i64* %call19, i64 %i.02
  store i64 0, i64* %arrayidx56, align 8
  %cmp58 = icmp slt i64 %j.03, 2
  br i1 %cmp58, label %blklab6, label %if.end61

if.end61:                                         ; preds = %blklab5
  %mul62 = mul nsw i64 %i.02, %n
  %add63 = add nsw i64 %j.03, -2
  %sub64 = add i64 %add63, %mul62
  %arrayidx65 = getelementptr inbounds i64, i64* %moves, i64 %sub64
  %2 = load i64, i64* %arrayidx65, align 8
  %arrayidx66 = getelementptr inbounds i64, i64* %call19, i64 %i.02
  store i64 %2, i64* %arrayidx66, align 8
  br label %blklab6

blklab6:                                          ; preds = %blklab5, %if.end61
  %arrayidx67 = getelementptr inbounds i64, i64* %call, i64 %i.02
  %3 = load i64, i64* %arrayidx67, align 8
  %arrayidx68 = getelementptr inbounds i64, i64* %call10, i64 %i.02
  %4 = load i64, i64* %arrayidx68, align 8
  %cmp69 = icmp sgt i64 %3, %4
  br i1 %cmp69, label %if.end72, label %blklab7

if.end72:                                         ; preds = %blklab6
  %arrayidx73 = getelementptr inbounds i64, i64* %call10, i64 %i.02
  %5 = load i64, i64* %arrayidx73, align 8
  %arrayidx74 = getelementptr inbounds i64, i64* %call, i64 %i.02
  store i64 %5, i64* %arrayidx74, align 8
  br label %blklab7

blklab7:                                          ; preds = %blklab6, %if.end72
  %arrayidx75 = getelementptr inbounds i64, i64* %call19, i64 %i.02
  %6 = load i64, i64* %arrayidx75, align 8
  %arrayidx76 = getelementptr inbounds i64, i64* %call10, i64 %i.02
  %7 = load i64, i64* %arrayidx76, align 8
  %cmp77 = icmp sgt i64 %6, %7
  br i1 %cmp77, label %if.end80, label %blklab8

if.end80:                                         ; preds = %blklab7
  %arrayidx81 = getelementptr inbounds i64, i64* %call10, i64 %i.02
  %8 = load i64, i64* %arrayidx81, align 8
  %arrayidx82 = getelementptr inbounds i64, i64* %call19, i64 %i.02
  store i64 %8, i64* %arrayidx82, align 8
  br label %blklab8

blklab8:                                          ; preds = %blklab7, %if.end80
  %arrayidx83 = getelementptr inbounds i64, i64* %call, i64 %i.02
  %9 = load i64, i64* %arrayidx83, align 8
  %add84 = add nsw i64 %9, %i.02
  %arrayidx85 = getelementptr inbounds i64, i64* %call19, i64 %i.02
  %10 = load i64, i64* %arrayidx85, align 8
  %add86 = add nsw i64 %10, %j.03
  %cmp87 = icmp sgt i64 %add84, %add86
  br i1 %cmp87, label %if.end90, label %blklab9

if.end90:                                         ; preds = %blklab8
  %arrayidx91 = getelementptr inbounds i64, i64* %call, i64 %i.02
  %11 = load i64, i64* %arrayidx91, align 8
  %add92 = add nsw i64 %11, %i.02
  %mul93 = mul nsw i64 %i.02, %n
  %add94 = add nsw i64 %mul93, %j.03
  %arrayidx95 = getelementptr inbounds i64, i64* %moves, i64 %add94
  store i64 %add92, i64* %arrayidx95, align 8
  br label %blklab3

blklab9:                                          ; preds = %blklab8
  %arrayidx96 = getelementptr inbounds i64, i64* %call19, i64 %i.02
  %12 = load i64, i64* %arrayidx96, align 8
  %add97 = add nsw i64 %12, %j.03
  %mul98 = mul nsw i64 %i.02, %n
  %add99 = add nsw i64 %mul98, %j.03
  %arrayidx100 = getelementptr inbounds i64, i64* %moves, i64 %add99
  store i64 %add97, i64* %arrayidx100, align 8
  br label %blklab3

blklab3:                                          ; preds = %if.end90, %blklab9
  %add102 = add nuw nsw i64 %i.02, 1
  %add101 = add nuw nsw i64 %j.03, 1
  %exitcond = icmp ne i64 %add102, %indvars.iv
  br i1 %exitcond, label %if.end31, label %while.body27.blklab1_crit_edge

while.body27.blklab1_crit_edge:                   ; preds = %blklab3
  br label %blklab1

blklab1:                                          ; preds = %while.body27.blklab1_crit_edge, %while.body27.preheader
  %add103 = add nuw nsw i64 %s.05, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %exitcond6 = icmp ne i64 %add103, %n
  br i1 %exitcond6, label %while.body27.preheader, label %while.body.if.then108_crit_edge

while.body.if.then108_crit_edge:                  ; preds = %blklab1
  br label %if.then108

if.then108:                                       ; preds = %while.body.if.then108_crit_edge, %entry.split
  %13 = bitcast i64* %call to i8*
  tail call void @free(i8* %13) #4
  %14 = bitcast i64* %call10 to i8*
  tail call void @free(i8* %14) #4
  %15 = bitcast i64* %call19 to i8*
  tail call void @free(i8* %15) #4
  ret i64* %moves
}

; Function Attrs: nounwind
declare void @free(i8*) #1

declare i64* @gen1DArray(i32, i32) #2

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
  br i1 %cmp, label %blklab11, label %if.end

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8
  %mul = mul nsw i64 %1, %1
  %conv6 = trunc i64 %mul to i32
  %call7 = tail call i64* @gen1DArray(i32 0, i32 %conv6) #4
  %call14 = tail call i64* @findMoves(i64* %call7, i64 %mul, i1 zeroext true, i64 %1)
  %sub18 = add nsw i64 %1, -1
  %arrayidx19 = getelementptr inbounds i64, i64* %call14, i64 %sub18
  %2 = load i64, i64* %arrayidx19, align 8
  %call23 = tail call noalias i8* @malloc(i64 400) #4
  %3 = bitcast i8* %call23 to i64*
  store i64 84, i64* %3, align 8
  %arrayidx25 = getelementptr inbounds i8, i8* %call23, i64 8
  %4 = bitcast i8* %arrayidx25 to i64*
  store i64 104, i64* %4, align 8
  %arrayidx26 = getelementptr inbounds i8, i8* %call23, i64 16
  %5 = bitcast i8* %arrayidx26 to i64*
  store i64 101, i64* %5, align 8
  %arrayidx27 = getelementptr inbounds i8, i8* %call23, i64 24
  %6 = bitcast i8* %arrayidx27 to i64*
  store i64 32, i64* %6, align 8
  %arrayidx28 = getelementptr inbounds i8, i8* %call23, i64 32
  %7 = bitcast i8* %arrayidx28 to i64*
  store i64 116, i64* %7, align 8
  %arrayidx29 = getelementptr inbounds i8, i8* %call23, i64 40
  %8 = bitcast i8* %arrayidx29 to i64*
  store i64 111, i64* %8, align 8
  %arrayidx30 = getelementptr inbounds i8, i8* %call23, i64 48
  %9 = bitcast i8* %arrayidx30 to i64*
  store i64 116, i64* %9, align 8
  %arrayidx31 = getelementptr inbounds i8, i8* %call23, i64 56
  %10 = bitcast i8* %arrayidx31 to i64*
  store i64 97, i64* %10, align 8
  %arrayidx32 = getelementptr inbounds i8, i8* %call23, i64 64
  %11 = bitcast i8* %arrayidx32 to i64*
  store i64 108, i64* %11, align 8
  %arrayidx33 = getelementptr inbounds i8, i8* %call23, i64 72
  %12 = bitcast i8* %arrayidx33 to i64*
  store i64 32, i64* %12, align 8
  %arrayidx34 = getelementptr inbounds i8, i8* %call23, i64 80
  %13 = bitcast i8* %arrayidx34 to i64*
  store i64 97, i64* %13, align 8
  %arrayidx35 = getelementptr inbounds i8, i8* %call23, i64 88
  %14 = bitcast i8* %arrayidx35 to i64*
  store i64 109, i64* %14, align 8
  %arrayidx36 = getelementptr inbounds i8, i8* %call23, i64 96
  %15 = bitcast i8* %arrayidx36 to i64*
  store i64 111, i64* %15, align 8
  %arrayidx37 = getelementptr inbounds i8, i8* %call23, i64 104
  %16 = bitcast i8* %arrayidx37 to i64*
  store i64 117, i64* %16, align 8
  %arrayidx38 = getelementptr inbounds i8, i8* %call23, i64 112
  %17 = bitcast i8* %arrayidx38 to i64*
  store i64 110, i64* %17, align 8
  %arrayidx39 = getelementptr inbounds i8, i8* %call23, i64 120
  %18 = bitcast i8* %arrayidx39 to i64*
  store i64 116, i64* %18, align 8
  %arrayidx40 = getelementptr inbounds i8, i8* %call23, i64 128
  %19 = bitcast i8* %arrayidx40 to i64*
  store i64 32, i64* %19, align 8
  %arrayidx41 = getelementptr inbounds i8, i8* %call23, i64 136
  %20 = bitcast i8* %arrayidx41 to i64*
  store i64 111, i64* %20, align 8
  %arrayidx42 = getelementptr inbounds i8, i8* %call23, i64 144
  %21 = bitcast i8* %arrayidx42 to i64*
  store i64 102, i64* %21, align 8
  %arrayidx43 = getelementptr inbounds i8, i8* %call23, i64 152
  %22 = bitcast i8* %arrayidx43 to i64*
  store i64 32, i64* %22, align 8
  %arrayidx44 = getelementptr inbounds i8, i8* %call23, i64 160
  %23 = bitcast i8* %arrayidx44 to i64*
  store i64 109, i64* %23, align 8
  %arrayidx45 = getelementptr inbounds i8, i8* %call23, i64 168
  %24 = bitcast i8* %arrayidx45 to i64*
  store i64 111, i64* %24, align 8
  %arrayidx46 = getelementptr inbounds i8, i8* %call23, i64 176
  %25 = bitcast i8* %arrayidx46 to i64*
  store i64 110, i64* %25, align 8
  %arrayidx47 = getelementptr inbounds i8, i8* %call23, i64 184
  %26 = bitcast i8* %arrayidx47 to i64*
  store i64 101, i64* %26, align 8
  %arrayidx48 = getelementptr inbounds i8, i8* %call23, i64 192
  %27 = bitcast i8* %arrayidx48 to i64*
  store i64 121, i64* %27, align 8
  %arrayidx49 = getelementptr inbounds i8, i8* %call23, i64 200
  %28 = bitcast i8* %arrayidx49 to i64*
  store i64 32, i64* %28, align 8
  %arrayidx50 = getelementptr inbounds i8, i8* %call23, i64 208
  %29 = bitcast i8* %arrayidx50 to i64*
  store i64 40, i64* %29, align 8
  %arrayidx51 = getelementptr inbounds i8, i8* %call23, i64 216
  %30 = bitcast i8* %arrayidx51 to i64*
  store i64 109, i64* %30, align 8
  %arrayidx52 = getelementptr inbounds i8, i8* %call23, i64 224
  %31 = bitcast i8* %arrayidx52 to i64*
  store i64 97, i64* %31, align 8
  %arrayidx53 = getelementptr inbounds i8, i8* %call23, i64 232
  %32 = bitcast i8* %arrayidx53 to i64*
  store i64 120, i64* %32, align 8
  %arrayidx54 = getelementptr inbounds i8, i8* %call23, i64 240
  %33 = bitcast i8* %arrayidx54 to i64*
  store i64 105, i64* %33, align 8
  %arrayidx55 = getelementptr inbounds i8, i8* %call23, i64 248
  %34 = bitcast i8* %arrayidx55 to i64*
  store i64 109, i64* %34, align 8
  %arrayidx56 = getelementptr inbounds i8, i8* %call23, i64 256
  %35 = bitcast i8* %arrayidx56 to i64*
  store i64 117, i64* %35, align 8
  %arrayidx57 = getelementptr inbounds i8, i8* %call23, i64 264
  %36 = bitcast i8* %arrayidx57 to i64*
  store i64 109, i64* %36, align 8
  %arrayidx58 = getelementptr inbounds i8, i8* %call23, i64 272
  %37 = bitcast i8* %arrayidx58 to i64*
  store i64 41, i64* %37, align 8
  %arrayidx59 = getelementptr inbounds i8, i8* %call23, i64 280
  %38 = bitcast i8* %arrayidx59 to i64*
  store i64 32, i64* %38, align 8
  %arrayidx60 = getelementptr inbounds i8, i8* %call23, i64 288
  %39 = bitcast i8* %arrayidx60 to i64*
  store i64 65, i64* %39, align 8
  %arrayidx61 = getelementptr inbounds i8, i8* %call23, i64 296
  %40 = bitcast i8* %arrayidx61 to i64*
  store i64 108, i64* %40, align 8
  %arrayidx62 = getelementptr inbounds i8, i8* %call23, i64 304
  %41 = bitcast i8* %arrayidx62 to i64*
  store i64 105, i64* %41, align 8
  %arrayidx63 = getelementptr inbounds i8, i8* %call23, i64 312
  %42 = bitcast i8* %arrayidx63 to i64*
  store i64 99, i64* %42, align 8
  %arrayidx64 = getelementptr inbounds i8, i8* %call23, i64 320
  %43 = bitcast i8* %arrayidx64 to i64*
  store i64 101, i64* %43, align 8
  %arrayidx65 = getelementptr inbounds i8, i8* %call23, i64 328
  %44 = bitcast i8* %arrayidx65 to i64*
  store i64 32, i64* %44, align 8
  %arrayidx66 = getelementptr inbounds i8, i8* %call23, i64 336
  %45 = bitcast i8* %arrayidx66 to i64*
  store i64 103, i64* %45, align 8
  %arrayidx67 = getelementptr inbounds i8, i8* %call23, i64 344
  %46 = bitcast i8* %arrayidx67 to i64*
  store i64 101, i64* %46, align 8
  %arrayidx68 = getelementptr inbounds i8, i8* %call23, i64 352
  %47 = bitcast i8* %arrayidx68 to i64*
  store i64 116, i64* %47, align 8
  %arrayidx69 = getelementptr inbounds i8, i8* %call23, i64 360
  %48 = bitcast i8* %arrayidx69 to i64*
  store i64 115, i64* %48, align 8
  %arrayidx70 = getelementptr inbounds i8, i8* %call23, i64 368
  %49 = bitcast i8* %arrayidx70 to i64*
  store i64 32, i64* %49, align 8
  %arrayidx71 = getelementptr inbounds i8, i8* %call23, i64 376
  %50 = bitcast i8* %arrayidx71 to i64*
  store i64 105, i64* %50, align 8
  %arrayidx72 = getelementptr inbounds i8, i8* %call23, i64 384
  %51 = bitcast i8* %arrayidx72 to i64*
  store i64 115, i64* %51, align 8
  %arrayidx73 = getelementptr inbounds i8, i8* %call23, i64 392
  %52 = bitcast i8* %arrayidx73 to i64*
  store i64 32, i64* %52, align 8
  tail call void @printf_s(i64* %3, i64 50) #4
  %call74 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2) #4
  %call78 = tail call noalias i8* @malloc(i64 184) #4
  %53 = bitcast i8* %call78 to i64*
  store i64 80, i64* %53, align 8
  %arrayidx80 = getelementptr inbounds i8, i8* %call78, i64 8
  %54 = bitcast i8* %arrayidx80 to i64*
  store i64 97, i64* %54, align 8
  %arrayidx81 = getelementptr inbounds i8, i8* %call78, i64 16
  %55 = bitcast i8* %arrayidx81 to i64*
  store i64 115, i64* %55, align 8
  %arrayidx82 = getelementptr inbounds i8, i8* %call78, i64 24
  %56 = bitcast i8* %arrayidx82 to i64*
  store i64 115, i64* %56, align 8
  %arrayidx83 = getelementptr inbounds i8, i8* %call78, i64 32
  %57 = bitcast i8* %arrayidx83 to i64*
  store i64 32, i64* %57, align 8
  %arrayidx84 = getelementptr inbounds i8, i8* %call78, i64 40
  %58 = bitcast i8* %arrayidx84 to i64*
  store i64 67, i64* %58, align 8
  %arrayidx85 = getelementptr inbounds i8, i8* %call78, i64 48
  %59 = bitcast i8* %arrayidx85 to i64*
  store i64 111, i64* %59, align 8
  %arrayidx86 = getelementptr inbounds i8, i8* %call78, i64 56
  %60 = bitcast i8* %arrayidx86 to i64*
  store i64 105, i64* %60, align 8
  %arrayidx87 = getelementptr inbounds i8, i8* %call78, i64 64
  %61 = bitcast i8* %arrayidx87 to i64*
  store i64 110, i64* %61, align 8
  %arrayidx88 = getelementptr inbounds i8, i8* %call78, i64 72
  %62 = bitcast i8* %arrayidx88 to i64*
  store i64 71, i64* %62, align 8
  %arrayidx89 = getelementptr inbounds i8, i8* %call78, i64 80
  %63 = bitcast i8* %arrayidx89 to i64*
  store i64 97, i64* %63, align 8
  %arrayidx90 = getelementptr inbounds i8, i8* %call78, i64 88
  %64 = bitcast i8* %arrayidx90 to i64*
  store i64 109, i64* %64, align 8
  %arrayidx91 = getelementptr inbounds i8, i8* %call78, i64 96
  %65 = bitcast i8* %arrayidx91 to i64*
  store i64 101, i64* %65, align 8
  %arrayidx92 = getelementptr inbounds i8, i8* %call78, i64 104
  %66 = bitcast i8* %arrayidx92 to i64*
  store i64 32, i64* %66, align 8
  %arrayidx93 = getelementptr inbounds i8, i8* %call78, i64 112
  %67 = bitcast i8* %arrayidx93 to i64*
  store i64 116, i64* %67, align 8
  %arrayidx94 = getelementptr inbounds i8, i8* %call78, i64 120
  %68 = bitcast i8* %arrayidx94 to i64*
  store i64 101, i64* %68, align 8
  %arrayidx95 = getelementptr inbounds i8, i8* %call78, i64 128
  %69 = bitcast i8* %arrayidx95 to i64*
  store i64 115, i64* %69, align 8
  %arrayidx96 = getelementptr inbounds i8, i8* %call78, i64 136
  %70 = bitcast i8* %arrayidx96 to i64*
  store i64 116, i64* %70, align 8
  %arrayidx97 = getelementptr inbounds i8, i8* %call78, i64 144
  %71 = bitcast i8* %arrayidx97 to i64*
  store i64 32, i64* %71, align 8
  %arrayidx98 = getelementptr inbounds i8, i8* %call78, i64 152
  %72 = bitcast i8* %arrayidx98 to i64*
  store i64 99, i64* %72, align 8
  %arrayidx99 = getelementptr inbounds i8, i8* %call78, i64 160
  %73 = bitcast i8* %arrayidx99 to i64*
  store i64 97, i64* %73, align 8
  %arrayidx100 = getelementptr inbounds i8, i8* %call78, i64 168
  %74 = bitcast i8* %arrayidx100 to i64*
  store i64 115, i64* %74, align 8
  %arrayidx101 = getelementptr inbounds i8, i8* %call78, i64 176
  %75 = bitcast i8* %arrayidx101 to i64*
  store i64 101, i64* %75, align 8
  tail call void @println_s(i64* %53, i64 23) #4
  %phitmp = bitcast i64* %call14 to i8*
  br label %blklab11

blklab11:                                         ; preds = %entry.split, %if.end
  %76 = phi i8* [ %call23, %if.end ], [ null, %entry.split ]
  %moves_has_ownership.0 = phi i1 [ true, %if.end ], [ false, %entry.split ]
  %moves.0 = phi i8* [ %phitmp, %if.end ], [ null, %entry.split ]
  %77 = phi i8* [ %call78, %if.end ], [ null, %entry.split ]
  br i1 %moves_has_ownership.0, label %if.then103, label %if.end122.critedge

if.then103:                                       ; preds = %blklab11
  tail call void @free(i8* %moves.0) #4
  tail call void @free2DArray(i64** %call, i64 %conv) #4
  tail call void @free(i8* %76) #4
  tail call void @free(i8* %77) #4
  br label %if.end122

if.end122.critedge:                               ; preds = %blklab11
  tail call void @free2DArray(i64** %call, i64 %conv) #4
  br label %if.end122

if.end122:                                        ; preds = %if.end122.critedge, %if.then103
  tail call void @exit(i32 0) #5
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare void @printf_s(i64*, i64) #2

declare i32 @printf(i8*, ...) #2

declare void @println_s(i64*, i64) #2

declare void @free2DArray(i64**, i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"}
