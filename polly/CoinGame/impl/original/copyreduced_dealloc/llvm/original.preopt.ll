; ModuleID = 'llvm/original.preopt.ll.tmp'
source_filename = "CoinGame_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_dealloc, i64 %n) local_unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %cmp153 = icmp sgt i64 %n, 0
  br i1 %cmp153, label %while.cond1.preheader.preheader, label %if.end54

while.cond1.preheader.preheader:                  ; preds = %entry.split
  br label %while.cond1.preheader

while.cond1.preheader:                            ; preds = %while.cond1.preheader.preheader, %blklab2
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab2 ], [ %n, %while.cond1.preheader.preheader ]
  %s.0154 = phi i64 [ %add52, %blklab2 ], [ 0, %while.cond1.preheader.preheader ]
  br label %if.end5

if.end5:                                          ; preds = %blklab6, %while.cond1.preheader
  %i.0152 = phi i64 [ 0, %while.cond1.preheader ], [ %add, %blklab6 ]
  %j.0151 = phi i64 [ %s.0154, %while.cond1.preheader ], [ %add50, %blklab6 ]
  %add = add nuw nsw i64 %i.0152, 1
  %cmp6 = icmp sge i64 %add, %n
  %cmp9 = icmp slt i64 %j.0151, 1
  %or.cond = or i1 %cmp9, %cmp6
  br i1 %or.cond, label %blklab4, label %if.end11

if.end11:                                         ; preds = %if.end5
  %mul = mul nsw i64 %add, %n
  %add13 = add nsw i64 %j.0151, -1
  %sub14 = add i64 %add13, %mul
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %sub14
  %0 = load i64, i64* %arrayidx, align 8, !tbaa !1
  br label %blklab4

blklab4:                                          ; preds = %if.end11, %if.end5
  %y.0 = phi i64 [ 0, %if.end5 ], [ %0, %if.end11 ]
  %add15 = add nuw nsw i64 %i.0152, 2
  %cmp16 = icmp slt i64 %add15, %n
  br i1 %cmp16, label %if.end18, label %blklab5

if.end18:                                         ; preds = %blklab4
  %mul20 = mul nsw i64 %add15, %n
  %add21 = add nsw i64 %mul20, %j.0151
  %arrayidx22 = getelementptr inbounds i64, i64* %moves, i64 %add21
  %1 = load i64, i64* %arrayidx22, align 8, !tbaa !1
  br label %blklab5

blklab5:                                          ; preds = %if.end18, %blklab4
  %x.0 = phi i64 [ 0, %blklab4 ], [ %1, %if.end18 ]
  %cmp24 = icmp slt i64 %j.0151, 2
  %.pre = mul nsw i64 %i.0152, %n
  br i1 %cmp24, label %blklab6, label %if.end26

if.end26:                                         ; preds = %blklab5
  %add28 = add nsw i64 %j.0151, -2
  %sub29 = add i64 %add28, %.pre
  %arrayidx30 = getelementptr inbounds i64, i64* %moves, i64 %sub29
  %2 = load i64, i64* %arrayidx30, align 8, !tbaa !1
  br label %blklab6

blklab6:                                          ; preds = %if.end26, %blklab5
  %z.0 = phi i64 [ %2, %if.end26 ], [ 0, %blklab5 ]
  %cmp31 = icmp sgt i64 %x.0, %y.0
  %y.0.x.0 = select i1 %cmp31, i64 %y.0, i64 %x.0
  %cmp34 = icmp sgt i64 %z.0, %y.0
  %z.1 = select i1 %cmp34, i64 %y.0, i64 %z.0
  %add37 = add nsw i64 %y.0.x.0, %i.0152
  %add38 = add nsw i64 %z.1, %j.0151
  %cmp39 = icmp sgt i64 %add37, %add38
  %add44 = add nsw i64 %.pre, %j.0151
  %arrayidx45 = getelementptr inbounds i64, i64* %moves, i64 %add44
  %add37.add38 = select i1 %cmp39, i64 %add37, i64 %add38
  store i64 %add37.add38, i64* %arrayidx45, align 8, !tbaa !1
  %add50 = add nuw nsw i64 %j.0151, 1
  %exitcond = icmp eq i64 %add, %indvars.iv
  br i1 %exitcond, label %blklab2, label %if.end5

blklab2:                                          ; preds = %blklab6
  %add52 = add nuw nsw i64 %s.0154, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %exitcond155 = icmp eq i64 %add52, %n
  br i1 %exitcond155, label %if.end54.loopexit, label %while.cond1.preheader

if.end54.loopexit:                                ; preds = %blklab2
  br label %if.end54

if.end54:                                         ; preds = %if.end54.loopexit, %entry.split
  ret i64* %moves
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #2 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5
  %0 = load i64*, i64** %call, align 8, !tbaa !5
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end139, label %if.end5

if.end5:                                          ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %mul = mul nsw i64 %1, %1
  %conv10 = trunc i64 %mul to i32
  %call11 = tail call i64* @create1DArray(i32 0, i32 %conv10) #5
  %cmp153.i = icmp sgt i64 %1, 0
  br i1 %cmp153.i, label %while.cond1.preheader.i.preheader, label %if.then117

while.cond1.preheader.i.preheader:                ; preds = %if.end5
  br label %while.cond1.preheader.i

while.cond1.preheader.i:                          ; preds = %while.cond1.preheader.i.preheader, %blklab2.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %blklab2.i ], [ %1, %while.cond1.preheader.i.preheader ]
  %s.0154.i = phi i64 [ %add52.i, %blklab2.i ], [ 0, %while.cond1.preheader.i.preheader ]
  br label %if.end5.i

if.end5.i:                                        ; preds = %blklab6.i, %while.cond1.preheader.i
  %i.0152.i = phi i64 [ 0, %while.cond1.preheader.i ], [ %add.i, %blklab6.i ]
  %j.0151.i = phi i64 [ %s.0154.i, %while.cond1.preheader.i ], [ %add50.i, %blklab6.i ]
  %add.i = add nuw nsw i64 %i.0152.i, 1
  %cmp6.i = icmp sge i64 %add.i, %1
  %cmp9.i = icmp slt i64 %j.0151.i, 1
  %or.cond.i = or i1 %cmp9.i, %cmp6.i
  br i1 %or.cond.i, label %blklab4.i, label %if.end11.i

if.end11.i:                                       ; preds = %if.end5.i
  %mul.i = mul nsw i64 %add.i, %1
  %add13.i = add nsw i64 %j.0151.i, -1
  %sub14.i = add i64 %add13.i, %mul.i
  %arrayidx.i = getelementptr inbounds i64, i64* %call11, i64 %sub14.i
  %2 = load i64, i64* %arrayidx.i, align 8, !tbaa !1
  br label %blklab4.i

blklab4.i:                                        ; preds = %if.end11.i, %if.end5.i
  %y.0.i = phi i64 [ 0, %if.end5.i ], [ %2, %if.end11.i ]
  %add15.i = add nuw nsw i64 %i.0152.i, 2
  %cmp16.i = icmp slt i64 %add15.i, %1
  br i1 %cmp16.i, label %if.end18.i, label %blklab5.i

if.end18.i:                                       ; preds = %blklab4.i
  %mul20.i = mul nsw i64 %add15.i, %1
  %add21.i = add nsw i64 %mul20.i, %j.0151.i
  %arrayidx22.i = getelementptr inbounds i64, i64* %call11, i64 %add21.i
  %3 = load i64, i64* %arrayidx22.i, align 8, !tbaa !1
  br label %blklab5.i

blklab5.i:                                        ; preds = %if.end18.i, %blklab4.i
  %x.0.i = phi i64 [ 0, %blklab4.i ], [ %3, %if.end18.i ]
  %cmp24.i = icmp slt i64 %j.0151.i, 2
  %.pre.i = mul nsw i64 %i.0152.i, %1
  br i1 %cmp24.i, label %blklab6.i, label %if.end26.i

if.end26.i:                                       ; preds = %blklab5.i
  %add28.i = add nsw i64 %j.0151.i, -2
  %sub29.i = add i64 %add28.i, %.pre.i
  %arrayidx30.i = getelementptr inbounds i64, i64* %call11, i64 %sub29.i
  %4 = load i64, i64* %arrayidx30.i, align 8, !tbaa !1
  br label %blklab6.i

blklab6.i:                                        ; preds = %if.end26.i, %blklab5.i
  %z.0.i = phi i64 [ %4, %if.end26.i ], [ 0, %blklab5.i ]
  %cmp31.i = icmp sgt i64 %x.0.i, %y.0.i
  %y.0.x.0.i = select i1 %cmp31.i, i64 %y.0.i, i64 %x.0.i
  %cmp34.i = icmp sgt i64 %z.0.i, %y.0.i
  %z.1.i = select i1 %cmp34.i, i64 %y.0.i, i64 %z.0.i
  %add37.i = add nsw i64 %y.0.x.0.i, %i.0152.i
  %add38.i = add nsw i64 %z.1.i, %j.0151.i
  %cmp39.i = icmp sgt i64 %add37.i, %add38.i
  %add44.i = add nsw i64 %.pre.i, %j.0151.i
  %arrayidx45.i = getelementptr inbounds i64, i64* %call11, i64 %add44.i
  %add37.add38.i = select i1 %cmp39.i, i64 %add37.i, i64 %add38.i
  store i64 %add37.add38.i, i64* %arrayidx45.i, align 8, !tbaa !1
  %add50.i = add nuw nsw i64 %j.0151.i, 1
  %exitcond.i = icmp eq i64 %add.i, %indvars.iv.i
  br i1 %exitcond.i, label %blklab2.i, label %if.end5.i

blklab2.i:                                        ; preds = %blklab6.i
  %add52.i = add nuw nsw i64 %s.0154.i, 1
  %indvars.iv.next.i = add i64 %indvars.iv.i, -1
  %exitcond155.i = icmp eq i64 %add52.i, %1
  br i1 %exitcond155.i, label %if.then117.loopexit, label %while.cond1.preheader.i

if.then117.loopexit:                              ; preds = %blklab2.i
  br label %if.then117

if.then117:                                       ; preds = %if.then117.loopexit, %if.end5
  %sub27 = add nsw i64 %1, -1
  %arrayidx28 = getelementptr inbounds i64, i64* %call11, i64 %sub27
  %5 = load i64, i64* %arrayidx28, align 8, !tbaa !1
  %call33 = tail call i64* @create1DArray(i32 0, i32 50) #5
  %6 = bitcast i64* %call33 to <2 x i64>*
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %6, align 8, !tbaa !1
  %arrayidx36 = getelementptr inbounds i64, i64* %call33, i64 2
  %7 = bitcast i64* %arrayidx36 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx38 = getelementptr inbounds i64, i64* %call33, i64 4
  %8 = bitcast i64* %arrayidx38 to <2 x i64>*
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx40 = getelementptr inbounds i64, i64* %call33, i64 6
  %9 = bitcast i64* %arrayidx40 to <2 x i64>*
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx42 = getelementptr inbounds i64, i64* %call33, i64 8
  %10 = bitcast i64* %arrayidx42 to <2 x i64>*
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx44 = getelementptr inbounds i64, i64* %call33, i64 10
  %11 = bitcast i64* %arrayidx44 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx46 = getelementptr inbounds i64, i64* %call33, i64 12
  %12 = bitcast i64* %arrayidx46 to <2 x i64>*
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx48 = getelementptr inbounds i64, i64* %call33, i64 14
  %13 = bitcast i64* %arrayidx48 to <2 x i64>*
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx50 = getelementptr inbounds i64, i64* %call33, i64 16
  %14 = bitcast i64* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx52 = getelementptr inbounds i64, i64* %call33, i64 18
  %15 = bitcast i64* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx54 = getelementptr inbounds i64, i64* %call33, i64 20
  %16 = bitcast i64* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx56 = getelementptr inbounds i64, i64* %call33, i64 22
  %17 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx58 = getelementptr inbounds i64, i64* %call33, i64 24
  %18 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx60 = getelementptr inbounds i64, i64* %call33, i64 26
  %19 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %19, align 8, !tbaa !1
  %arrayidx62 = getelementptr inbounds i64, i64* %call33, i64 28
  %20 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %20, align 8, !tbaa !1
  %arrayidx64 = getelementptr inbounds i64, i64* %call33, i64 30
  %21 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %21, align 8, !tbaa !1
  %arrayidx66 = getelementptr inbounds i64, i64* %call33, i64 32
  %22 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %22, align 8, !tbaa !1
  %arrayidx68 = getelementptr inbounds i64, i64* %call33, i64 34
  %23 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %23, align 8, !tbaa !1
  %arrayidx70 = getelementptr inbounds i64, i64* %call33, i64 36
  %24 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %24, align 8, !tbaa !1
  %arrayidx72 = getelementptr inbounds i64, i64* %call33, i64 38
  %25 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %25, align 8, !tbaa !1
  %arrayidx74 = getelementptr inbounds i64, i64* %call33, i64 40
  %26 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %26, align 8, !tbaa !1
  %arrayidx76 = getelementptr inbounds i64, i64* %call33, i64 42
  %27 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %27, align 8, !tbaa !1
  %arrayidx78 = getelementptr inbounds i64, i64* %call33, i64 44
  %28 = bitcast i64* %arrayidx78 to <2 x i64>*
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %28, align 8, !tbaa !1
  %arrayidx80 = getelementptr inbounds i64, i64* %call33, i64 46
  %29 = bitcast i64* %arrayidx80 to <2 x i64>*
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %29, align 8, !tbaa !1
  %arrayidx82 = getelementptr inbounds i64, i64* %call33, i64 48
  %30 = bitcast i64* %arrayidx82 to <2 x i64>*
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %30, align 8, !tbaa !1
  tail call void @printf_s(i64* %call33, i64 50) #5
  %call84 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %5)
  %call89 = tail call i64* @create1DArray(i32 0, i32 23) #5
  %31 = bitcast i64* %call89 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx92 = getelementptr inbounds i64, i64* %call89, i64 2
  %32 = bitcast i64* %arrayidx92 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx94 = getelementptr inbounds i64, i64* %call89, i64 4
  %33 = bitcast i64* %arrayidx94 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx96 = getelementptr inbounds i64, i64* %call89, i64 6
  %34 = bitcast i64* %arrayidx96 to <2 x i64>*
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx98 = getelementptr inbounds i64, i64* %call89, i64 8
  %35 = bitcast i64* %arrayidx98 to <2 x i64>*
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx100 = getelementptr inbounds i64, i64* %call89, i64 10
  %36 = bitcast i64* %arrayidx100 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx102 = getelementptr inbounds i64, i64* %call89, i64 12
  %37 = bitcast i64* %arrayidx102 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx104 = getelementptr inbounds i64, i64* %call89, i64 14
  %38 = bitcast i64* %arrayidx104 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx106 = getelementptr inbounds i64, i64* %call89, i64 16
  %39 = bitcast i64* %arrayidx106 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx108 = getelementptr inbounds i64, i64* %call89, i64 18
  %40 = bitcast i64* %arrayidx108 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %40, align 8, !tbaa !1
  %arrayidx110 = getelementptr inbounds i64, i64* %call89, i64 20
  %41 = bitcast i64* %arrayidx110 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %41, align 8, !tbaa !1
  %arrayidx112 = getelementptr inbounds i64, i64* %call89, i64 22
  store i64 101, i64* %arrayidx112, align 8, !tbaa !1
  tail call void @println_s(i64* %call89, i64 23) #5
  %phitmp = bitcast i64* %call89 to i8*
  %phitmp250 = bitcast i64* %call33 to i8*
  %phitmp251 = bitcast i64* %call11 to i8*
  %42 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %42) #5
  tail call void @free(i8* %phitmp251) #5
  tail call void @free(i8* %phitmp250) #5
  tail call void @free(i8* %phitmp) #5
  br label %if.end139

if.end139:                                        ; preds = %if.then117, %entry.split
  tail call void @exit(i32 0) #6
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

declare i64* @create1DArray(i32, i32) local_unnamed_addr #3

declare void @printf_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

attributes #0 = { norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
