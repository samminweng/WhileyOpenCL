; ModuleID = 'CoinGame_original.c'
source_filename = "CoinGame_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define i64* @_findMoves_(i64* noalias returned %moves, i64 %moves_size, i1 zeroext %moves_dealloc, i64 %n, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %cmp126 = icmp sgt i64 %n, 0
  br i1 %cmp126, label %while.cond1.preheader, label %if.end67

while.cond1.preheader:                            ; preds = %entry, %blklab2
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab2 ], [ %n, %entry ]
  %s.0127 = phi i64 [ %add65, %blklab2 ], [ 0, %entry ]
  %cmp3124 = icmp slt i64 %s.0127, %n
  br i1 %cmp3124, label %if.end5, label %blklab2

if.end5:                                          ; preds = %while.cond1.preheader, %if.end5
  %i.0125 = phi i64 [ %add6, %if.end5 ], [ 0, %while.cond1.preheader ]
  %add = add nuw nsw i64 %i.0125, %s.0127
  %add6 = add nuw nsw i64 %i.0125, 1
  %mul = mul nsw i64 %add6, %n
  %add7 = add nsw i64 %add, -1
  %sub8 = add i64 %add7, %mul
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %sub8
  %0 = load i64, i64* %arrayidx, align 8, !tbaa !2
  %add9 = add nuw nsw i64 %i.0125, 2
  %mul10 = mul nsw i64 %add9, %n
  %add11 = add nsw i64 %mul10, %add
  %arrayidx12 = getelementptr inbounds i64, i64* %moves, i64 %add11
  %1 = load i64, i64* %arrayidx12, align 8, !tbaa !2
  %mul13 = mul nsw i64 %i.0125, %n
  %add14 = add nsw i64 %mul13, %add
  %sub15 = add nsw i64 %add14, -2
  %arrayidx16 = getelementptr inbounds i64, i64* %moves, i64 %sub15
  %2 = load i64, i64* %arrayidx16, align 8, !tbaa !2
  %xor = xor i64 %1, %0
  %cmp17 = icmp slt i64 %1, %0
  %and = select i1 %cmp17, i64 %xor, i64 0
  %xor20 = xor i64 %and, %0
  %add21 = add nsw i64 %xor20, %i.0125
  %xor30 = xor i64 %2, %0
  %cmp31 = icmp slt i64 %0, %2
  %and35 = select i1 %cmp31, i64 %xor30, i64 0
  %xor36 = xor i64 %and35, %2
  %add37 = add nsw i64 %xor36, %add
  %xor38 = xor i64 %add37, %add21
  %cmp55 = icmp slt i64 %add21, %add37
  %and59 = select i1 %cmp55, i64 %xor38, i64 0
  %xor60 = xor i64 %and59, %add21
  %arrayidx63 = getelementptr inbounds i64, i64* %moves, i64 %add14
  store i64 %xor60, i64* %arrayidx63, align 8, !tbaa !2
  %exitcond = icmp eq i64 %add6, %indvars.iv
  br i1 %exitcond, label %blklab2, label %if.end5

blklab2:                                          ; preds = %if.end5, %while.cond1.preheader
  %add65 = add nuw nsw i64 %s.0127, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %exitcond129 = icmp eq i64 %add65, %n
  br i1 %exitcond129, label %if.end67, label %while.cond1.preheader

if.end67:                                         ; preds = %blklab2, %entry
  store i64 %moves_size, i64* %_size_call_by_ref, align 8, !tbaa !2
  ret i64* %moves
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
entry:
  %_6_size = alloca i64, align 8
  %_6_size_size = alloca i64, align 8
  %0 = bitcast i64* %_6_size to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #6
  store i64 0, i64* %_6_size, align 8, !tbaa !2
  %1 = bitcast i64* %_6_size_size to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #6
  store i64 0, i64* %_6_size_size, align 8, !tbaa !2
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_6_size, i64* nonnull %_6_size_size) #6
  %cmp = icmp eq i64** %call, null
  %2 = load i64*, i64** %call, align 8, !tbaa !6
  %call3 = call i64* @parseStringToInt(i64* %2) #6
  %cmp4 = icmp eq i64* %call3, null
  br i1 %cmp4, label %if.end142, label %if.end14

if.end14:                                         ; preds = %entry
  %3 = load i64, i64* %call3, align 8, !tbaa !2
  %add = add nsw i64 %3, 2
  %mul = mul nsw i64 %add, %add
  %call19 = call i64* @create1DArray_int64_t(i64 0, i64 %mul) #6
  %cmp126.i = icmp sgt i64 %3, 0
  br i1 %cmp126.i, label %while.cond1.preheader.i, label %if.then138

while.cond1.preheader.i:                          ; preds = %if.end14, %blklab2.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %blklab2.i ], [ %3, %if.end14 ]
  %s.0127.i = phi i64 [ %add65.i, %blklab2.i ], [ 0, %if.end14 ]
  %cmp3124.i = icmp slt i64 %s.0127.i, %3
  br i1 %cmp3124.i, label %if.end5.i, label %blklab2.i

if.end5.i:                                        ; preds = %while.cond1.preheader.i, %if.end5.i
  %i.0125.i = phi i64 [ %add6.i, %if.end5.i ], [ 0, %while.cond1.preheader.i ]
  %add.i = add nuw nsw i64 %i.0125.i, %s.0127.i
  %add6.i = add nuw nsw i64 %i.0125.i, 1
  %mul.i = mul nsw i64 %add6.i, %3
  %add7.i = add nsw i64 %add.i, -1
  %sub8.i = add i64 %add7.i, %mul.i
  %arrayidx.i = getelementptr inbounds i64, i64* %call19, i64 %sub8.i
  %4 = load i64, i64* %arrayidx.i, align 8, !tbaa !2, !alias.scope !8
  %add9.i = add nuw nsw i64 %i.0125.i, 2
  %mul10.i = mul nsw i64 %add9.i, %3
  %add11.i = add nsw i64 %mul10.i, %add.i
  %arrayidx12.i = getelementptr inbounds i64, i64* %call19, i64 %add11.i
  %5 = load i64, i64* %arrayidx12.i, align 8, !tbaa !2, !alias.scope !8
  %mul13.i = mul nsw i64 %i.0125.i, %3
  %add14.i = add nsw i64 %mul13.i, %add.i
  %sub15.i = add nsw i64 %add14.i, -2
  %arrayidx16.i = getelementptr inbounds i64, i64* %call19, i64 %sub15.i
  %6 = load i64, i64* %arrayidx16.i, align 8, !tbaa !2, !alias.scope !8
  %xor.i = xor i64 %5, %4
  %cmp17.i = icmp slt i64 %5, %4
  %and.i = select i1 %cmp17.i, i64 %xor.i, i64 0
  %xor20.i = xor i64 %and.i, %4
  %add21.i = add nsw i64 %xor20.i, %i.0125.i
  %xor30.i = xor i64 %6, %4
  %cmp31.i = icmp slt i64 %4, %6
  %and35.i = select i1 %cmp31.i, i64 %xor30.i, i64 0
  %xor36.i = xor i64 %and35.i, %6
  %add37.i = add nsw i64 %xor36.i, %add.i
  %xor38.i = xor i64 %add37.i, %add21.i
  %cmp55.i = icmp slt i64 %add21.i, %add37.i
  %and59.i = select i1 %cmp55.i, i64 %xor38.i, i64 0
  %xor60.i = xor i64 %and59.i, %add21.i
  %arrayidx63.i = getelementptr inbounds i64, i64* %call19, i64 %add14.i
  store i64 %xor60.i, i64* %arrayidx63.i, align 8, !tbaa !2, !alias.scope !8
  %exitcond.i = icmp eq i64 %add6.i, %indvars.iv.i
  br i1 %exitcond.i, label %blklab2.i, label %if.end5.i

blklab2.i:                                        ; preds = %if.end5.i, %while.cond1.preheader.i
  %add65.i = add nuw nsw i64 %s.0127.i, 1
  %indvars.iv.next.i = add i64 %indvars.iv.i, -1
  %exitcond129.i = icmp eq i64 %add65.i, %3
  br i1 %exitcond129.i, label %if.then138, label %while.cond1.preheader.i

if.then138:                                       ; preds = %blklab2.i, %if.end14
  %sub = add nsw i64 %3, -1
  %arrayidx43 = getelementptr inbounds i64, i64* %call19, i64 %sub
  %7 = load i64, i64* %arrayidx43, align 8, !tbaa !2
  %call47 = call i64* @create1DArray_int64_t(i64 0, i64 50) #6
  %8 = bitcast i64* %call47 to <2 x i64>*
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %8, align 8, !tbaa !2
  %arrayidx50 = getelementptr inbounds i64, i64* %call47, i64 2
  %9 = bitcast i64* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %9, align 8, !tbaa !2
  %arrayidx52 = getelementptr inbounds i64, i64* %call47, i64 4
  %10 = bitcast i64* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %10, align 8, !tbaa !2
  %arrayidx54 = getelementptr inbounds i64, i64* %call47, i64 6
  %11 = bitcast i64* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %11, align 8, !tbaa !2
  %arrayidx56 = getelementptr inbounds i64, i64* %call47, i64 8
  %12 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %12, align 8, !tbaa !2
  %arrayidx58 = getelementptr inbounds i64, i64* %call47, i64 10
  %13 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %13, align 8, !tbaa !2
  %arrayidx60 = getelementptr inbounds i64, i64* %call47, i64 12
  %14 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %14, align 8, !tbaa !2
  %arrayidx62 = getelementptr inbounds i64, i64* %call47, i64 14
  %15 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %15, align 8, !tbaa !2
  %arrayidx64 = getelementptr inbounds i64, i64* %call47, i64 16
  %16 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %16, align 8, !tbaa !2
  %arrayidx66 = getelementptr inbounds i64, i64* %call47, i64 18
  %17 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %17, align 8, !tbaa !2
  %arrayidx68 = getelementptr inbounds i64, i64* %call47, i64 20
  %18 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %18, align 8, !tbaa !2
  %arrayidx70 = getelementptr inbounds i64, i64* %call47, i64 22
  %19 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %19, align 8, !tbaa !2
  %arrayidx72 = getelementptr inbounds i64, i64* %call47, i64 24
  %20 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %20, align 8, !tbaa !2
  %arrayidx74 = getelementptr inbounds i64, i64* %call47, i64 26
  %21 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %21, align 8, !tbaa !2
  %arrayidx76 = getelementptr inbounds i64, i64* %call47, i64 28
  %22 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %22, align 8, !tbaa !2
  %arrayidx78 = getelementptr inbounds i64, i64* %call47, i64 30
  %23 = bitcast i64* %arrayidx78 to <2 x i64>*
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %23, align 8, !tbaa !2
  %arrayidx80 = getelementptr inbounds i64, i64* %call47, i64 32
  %24 = bitcast i64* %arrayidx80 to <2 x i64>*
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %24, align 8, !tbaa !2
  %arrayidx82 = getelementptr inbounds i64, i64* %call47, i64 34
  %25 = bitcast i64* %arrayidx82 to <2 x i64>*
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %25, align 8, !tbaa !2
  %arrayidx84 = getelementptr inbounds i64, i64* %call47, i64 36
  %26 = bitcast i64* %arrayidx84 to <2 x i64>*
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %26, align 8, !tbaa !2
  %arrayidx86 = getelementptr inbounds i64, i64* %call47, i64 38
  %27 = bitcast i64* %arrayidx86 to <2 x i64>*
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %27, align 8, !tbaa !2
  %arrayidx88 = getelementptr inbounds i64, i64* %call47, i64 40
  %28 = bitcast i64* %arrayidx88 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %28, align 8, !tbaa !2
  %arrayidx90 = getelementptr inbounds i64, i64* %call47, i64 42
  %29 = bitcast i64* %arrayidx90 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %29, align 8, !tbaa !2
  %arrayidx92 = getelementptr inbounds i64, i64* %call47, i64 44
  %30 = bitcast i64* %arrayidx92 to <2 x i64>*
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %30, align 8, !tbaa !2
  %arrayidx94 = getelementptr inbounds i64, i64* %call47, i64 46
  %31 = bitcast i64* %arrayidx94 to <2 x i64>*
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %31, align 8, !tbaa !2
  %arrayidx96 = getelementptr inbounds i64, i64* %call47, i64 48
  %32 = bitcast i64* %arrayidx96 to <2 x i64>*
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %32, align 8, !tbaa !2
  %cmp98 = icmp ne i64* %call47, null
  call void @printf_s(i64* %call47, i64 50) #6
  %call102 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %7)
  %call106 = call i64* @create1DArray_int64_t(i64 0, i64 23) #6
  %33 = bitcast i64* %call106 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %33, align 8, !tbaa !2
  %arrayidx109 = getelementptr inbounds i64, i64* %call106, i64 2
  %34 = bitcast i64* %arrayidx109 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %34, align 8, !tbaa !2
  %arrayidx111 = getelementptr inbounds i64, i64* %call106, i64 4
  %35 = bitcast i64* %arrayidx111 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %35, align 8, !tbaa !2
  %arrayidx113 = getelementptr inbounds i64, i64* %call106, i64 6
  %36 = bitcast i64* %arrayidx113 to <2 x i64>*
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %36, align 8, !tbaa !2
  %arrayidx115 = getelementptr inbounds i64, i64* %call106, i64 8
  %37 = bitcast i64* %arrayidx115 to <2 x i64>*
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %37, align 8, !tbaa !2
  %arrayidx117 = getelementptr inbounds i64, i64* %call106, i64 10
  %38 = bitcast i64* %arrayidx117 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %38, align 8, !tbaa !2
  %arrayidx119 = getelementptr inbounds i64, i64* %call106, i64 12
  %39 = bitcast i64* %arrayidx119 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %39, align 8, !tbaa !2
  %arrayidx121 = getelementptr inbounds i64, i64* %call106, i64 14
  %40 = bitcast i64* %arrayidx121 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %40, align 8, !tbaa !2
  %arrayidx123 = getelementptr inbounds i64, i64* %call106, i64 16
  %41 = bitcast i64* %arrayidx123 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %41, align 8, !tbaa !2
  %arrayidx125 = getelementptr inbounds i64, i64* %call106, i64 18
  %42 = bitcast i64* %arrayidx125 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %42, align 8, !tbaa !2
  %arrayidx127 = getelementptr inbounds i64, i64* %call106, i64 20
  %43 = bitcast i64* %arrayidx127 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %43, align 8, !tbaa !2
  %arrayidx129 = getelementptr inbounds i64, i64* %call106, i64 22
  store i64 101, i64* %arrayidx129, align 8, !tbaa !2
  %cmp130 = icmp ne i64* %call106, null
  call void @println_s(i64* %call106, i64 23) #6
  %phitmp = bitcast i64* %call106 to i8*
  %phitmp276 = bitcast i64* %call47 to i8*
  %phitmp277 = bitcast i64* %call19 to i8*
  %44 = bitcast i64* %call3 to i8*
  call void @free(i8* %44) #6
  call void @free(i8* %phitmp277) #6
  br label %if.end142

if.end142:                                        ; preds = %entry, %if.then138
  %_22.0280287 = phi i8* [ %phitmp276, %if.then138 ], [ null, %entry ]
  %_22_dealloc.1281286 = phi i1 [ %cmp98, %if.then138 ], [ false, %entry ]
  %_27.0282285 = phi i8* [ %phitmp, %if.then138 ], [ null, %entry ]
  %_27_dealloc.1283284 = phi i1 [ %cmp130, %if.then138 ], [ false, %entry ]
  br i1 %cmp, label %if.end154, label %if.then144

if.then144:                                       ; preds = %if.end142
  %45 = load i64, i64* %_6_size, align 8, !tbaa !2
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %45) #6
  br label %if.end154

if.end154:                                        ; preds = %if.end142, %if.then144
  br i1 %_22_dealloc.1281286, label %if.then156, label %if.end157

if.then156:                                       ; preds = %if.end154
  call void @free(i8* %_22.0280287) #6
  br label %if.end157

if.end157:                                        ; preds = %if.then156, %if.end154
  br i1 %_27_dealloc.1283284, label %if.then159, label %if.end160

if.then159:                                       ; preds = %if.end157
  call void @free(i8* %_27.0282285) #6
  br label %if.end160

if.end160:                                        ; preds = %if.then159, %if.end157
  call void @exit(i32 0) #7
  unreachable
}

declare void @free2DArray_int64_t(i64**, i64) local_unnamed_addr #4

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #4

declare i64* @parseStringToInt(i64*) local_unnamed_addr #4

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #4

declare void @printf_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0 (http://llvm.org/git/clang.git bd8aa3a7c974c9404a21faf306aad785cf0a7549) (http://llvm.org/git/llvm.git b618c820b01fb49ce529b7cc08c354958d3e3a13)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = !{!9}
!9 = distinct !{!9, !10, !"_findMoves_: %moves"}
!10 = distinct !{!10, !"_findMoves_"}
