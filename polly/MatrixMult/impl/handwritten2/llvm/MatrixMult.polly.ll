; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i32*, i32, i32 }

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @init(i32 %value, i32 %width, i32 %height) #0 {
entry:
  %mul = mul nsw i32 %height, %width
  %conv = sext i32 %mul to i64
  %mul1 = shl nsw i64 %conv, 2
  %call = tail call noalias i8* @malloc(i64 %mul1) #4
  %cmp3 = icmp sgt i32 %height, 0
  br i1 %cmp3, label %for.cond3.preheader.lr.ph, label %for.end10

for.cond3.preheader.lr.ph:                        ; preds = %entry
  %0 = sext i32 %width to i64
  %1 = sext i32 %height to i64
  %2 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %2, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %for.end10

for.end10.loopexit:                               ; preds = %polly.loop_exit7
  br label %for.end10

for.end10:                                        ; preds = %for.end10.loopexit, %for.cond3.preheader.lr.ph, %entry
  %call11 = tail call noalias i8* @malloc(i64 16) #4
  %3 = bitcast i8* %call11 to %struct.Matrix*
  %4 = bitcast i8* %call11 to i8**
  store i8* %call, i8** %4, align 8
  %width13 = getelementptr inbounds i8, i8* %call11, i64 8
  %5 = bitcast i8* %width13 to i32*
  store i32 %width, i32* %5, align 8
  %height14 = getelementptr inbounds i8, i8* %call11, i64 12
  %6 = bitcast i8* %height14 to i32*
  store i32 %height, i32* %6, align 4
  ret %struct.Matrix* %3

polly.loop_header:                                ; preds = %polly.loop_exit7, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit7 ]
  br i1 %polly.loop_guard8, label %polly.loop_header5.preheader, label %polly.loop_exit7

polly.loop_header5.preheader:                     ; preds = %polly.loop_header
  %7 = shl nsw i64 %polly.indvar, 5
  %8 = sub nsw i64 %1, %7
  %9 = add nsw i64 %8, -1
  %10 = icmp sgt i64 %9, 31
  %11 = select i1 %10, i64 31, i64 %9
  %polly.loop_guard17 = icmp sgt i64 %11, -1
  %polly.adjust_ub20 = add i64 %11, -1
  br i1 %polly.loop_guard17, label %polly.loop_header14.preheader.us.preheader, label %polly.loop_exit7

polly.loop_header14.preheader.us.preheader:       ; preds = %polly.loop_header5.preheader
  br label %polly.loop_header14.preheader.us

polly.loop_header14.preheader.us:                 ; preds = %polly.loop_header14.preheader.us.preheader, %polly.loop_exit16.loopexit.us
  %polly.indvar9.us = phi i64 [ %polly.indvar_next10.us, %polly.loop_exit16.loopexit.us ], [ 0, %polly.loop_header14.preheader.us.preheader ]
  %12 = shl nsw i64 %polly.indvar9.us, 5
  %13 = sub nsw i64 %0, %12
  %14 = add nsw i64 %13, -1
  %15 = icmp sgt i64 %14, 31
  %16 = select i1 %15, i64 31, i64 %14
  %polly.loop_guard26.us = icmp sgt i64 %16, -1
  %polly.adjust_ub29.us = add i64 %16, -1
  br i1 %polly.loop_guard26.us, label %polly.stmt.for.body6.preheader.us.us.preheader, label %polly.loop_exit16.loopexit.us

polly.stmt.for.body6.preheader.us.us.preheader:   ; preds = %polly.loop_header14.preheader.us
  br label %polly.stmt.for.body6.preheader.us.us

polly.loop_exit16.loopexit.us.loopexit:           ; preds = %polly.loop_exit25.loopexit.us.us
  br label %polly.loop_exit16.loopexit.us

polly.loop_exit16.loopexit.us:                    ; preds = %polly.loop_exit16.loopexit.us.loopexit, %polly.loop_header14.preheader.us
  %polly.indvar_next10.us = add nuw nsw i64 %polly.indvar9.us, 1
  %exitcond52 = icmp eq i64 %polly.indvar9.us, %polly.fdiv_q.shr3
  br i1 %exitcond52, label %polly.loop_exit7.loopexit, label %polly.loop_header14.preheader.us

polly.stmt.for.body6.preheader.us.us:             ; preds = %polly.stmt.for.body6.preheader.us.us.preheader, %polly.loop_exit25.loopexit.us.us
  %polly.indvar18.us.us = phi i64 [ %polly.indvar_next19.us.us, %polly.loop_exit25.loopexit.us.us ], [ 0, %polly.stmt.for.body6.preheader.us.us.preheader ]
  %17 = add nuw nsw i64 %polly.indvar18.us.us, %7
  %18 = mul i64 %17, %0
  %19 = add i64 %18, %12
  br label %polly.stmt.for.body6.us.us

polly.loop_exit25.loopexit.us.us:                 ; preds = %polly.stmt.for.body6.us.us
  %polly.indvar_next19.us.us = add nuw nsw i64 %polly.indvar18.us.us, 1
  %polly.loop_cond21.us.us = icmp sgt i64 %polly.indvar18.us.us, %polly.adjust_ub20
  br i1 %polly.loop_cond21.us.us, label %polly.loop_exit16.loopexit.us.loopexit, label %polly.stmt.for.body6.preheader.us.us

polly.stmt.for.body6.us.us:                       ; preds = %polly.stmt.for.body6.us.us, %polly.stmt.for.body6.preheader.us.us
  %polly.indvar27.us.us = phi i64 [ %polly.indvar_next28.us.us, %polly.stmt.for.body6.us.us ], [ 0, %polly.stmt.for.body6.preheader.us.us ]
  %tmp.us.us = add nsw i64 %19, %polly.indvar27.us.us
  %tmp32.us.us = shl i64 %tmp.us.us, 2
  %scevgep.us.us = getelementptr i8, i8* %call, i64 %tmp32.us.us
  %scevgep31.us.us = bitcast i8* %scevgep.us.us to i32*
  store i32 %value, i32* %scevgep31.us.us, align 4, !alias.scope !1, !noalias !3
  %polly.indvar_next28.us.us = add nuw nsw i64 %polly.indvar27.us.us, 1
  %polly.loop_cond30.us.us = icmp sgt i64 %polly.indvar27.us.us, %polly.adjust_ub29.us
  br i1 %polly.loop_cond30.us.us, label %polly.loop_exit25.loopexit.us.us, label %polly.stmt.for.body6.us.us

polly.loop_exit7.loopexit:                        ; preds = %polly.loop_exit16.loopexit.us
  br label %polly.loop_exit7

polly.loop_exit7:                                 ; preds = %polly.loop_exit7.loopexit, %polly.loop_header5.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond53 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond53, label %for.end10.loopexit, label %polly.loop_header

polly.loop_preheader:                             ; preds = %for.cond3.preheader.lr.ph
  %20 = add nsw i64 %0, -1
  %polly.fdiv_q.shr3 = ashr i64 %20, 5
  %polly.loop_guard8 = icmp sgt i64 %polly.fdiv_q.shr3, -1
  br label %polly.loop_header
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @matrix_multiply(%struct.Matrix* noalias nocapture readonly %A, %struct.Matrix* noalias nocapture readonly %B) #0 {
entry:
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 0
  %0 = load i32*, i32** %data, align 8
  %data1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 0
  %1 = load i32*, i32** %data1, align 8
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 1
  %2 = load i32, i32* %width2, align 8
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 2
  %3 = load i32, i32* %height3, align 4
  %mul = mul nsw i32 %3, %2
  %conv = sext i32 %mul to i64
  %mul4 = shl nsw i64 %conv, 2
  %call = tail call noalias i8* @malloc(i64 %mul4) #4
  %4 = bitcast i8* %call to i32*
  %cmp6 = icmp sgt i32 %3, 0
  br i1 %cmp6, label %for.cond7.preheader.lr.ph, label %for.end41

for.cond7.preheader.lr.ph:                        ; preds = %entry
  %5 = sext i32 %2 to i64
  %6 = icmp sgt i32 %2, 0
  br i1 %6, label %polly.preload.exec, label %polly.preload.merge

polly.preload.merge:                              ; preds = %polly.preload.exec, %for.cond7.preheader.lr.ph
  %7 = phi i32 [ %53, %polly.preload.exec ], [ %3, %for.cond7.preheader.lr.ph ]
  %polly.preload..merge = phi i32 [ %51, %polly.preload.exec ], [ 0, %for.cond7.preheader.lr.ph ]
  %8 = icmp sge i32 %2, %polly.preload..merge
  %9 = sext i32 %polly.preload..merge to i64
  %10 = add nsw i64 %9, -1
  %polly.access.add. = mul nsw i64 %9, %5
  %polly.access. = getelementptr i32, i32* %1, i64 %polly.access.add.
  %11 = icmp ule i32* %polly.access., %4
  %12 = sext i32 %3 to i64
  %13 = add nsw i64 %12, -1
  %polly.access.mul.call6 = mul i64 %13, %5
  %polly.access.add.call7 = mul nsw i64 %12, %5
  %polly.access.call8 = getelementptr i32, i32* %4, i64 %polly.access.add.call7
  %14 = icmp ule i32* %polly.access.call8, %1
  %15 = or i1 %14, %11
  %16 = and i1 %8, %15
  %polly.access.add.13 = add i64 %9, %polly.access.mul.call6
  %polly.access.14 = getelementptr i32, i32* %0, i64 %polly.access.add.13
  %17 = icmp ule i32* %polly.access.14, %4
  %18 = icmp ule i32* %polly.access.call8, %0
  %19 = or i1 %18, %17
  %20 = and i1 %19, %16
  br i1 %20, label %polly.start, label %for.cond7.preheader.preheader

for.cond7.preheader.preheader:                    ; preds = %polly.preload.merge
  %21 = sext i32 %7 to i64
  br i1 %6, label %for.body11.preheader.us.preheader, label %for.end41

for.body11.preheader.us.preheader:                ; preds = %for.cond7.preheader.preheader
  %width14 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 1
  %22 = shl nsw i64 %5, 2
  %.pre = load i32, i32* %width14, align 8
  %cmp151.us = icmp sgt i32 %.pre, 0
  %23 = icmp sgt i64 %5, 1
  %smax310 = select i1 %23, i64 %5, i64 1
  %24 = shl nsw i64 %smax310, 2
  %25 = sext i32 %.pre to i64
  %xtraiter379 = and i64 %25, 1
  %lcmp.mod380 = icmp eq i64 %xtraiter379, 0
  %26 = icmp eq i32 %.pre, 1
  br label %for.body11.preheader.us

for.body11.preheader.us:                          ; preds = %for.body11.preheader.us.preheader, %for.inc39.loopexit.us
  %indvars.iv17.us = phi i64 [ %indvars.iv.next18.us, %for.inc39.loopexit.us ], [ 0, %for.body11.preheader.us.preheader ]
  %27 = mul nsw i64 %indvars.iv17.us, %5
  br i1 %cmp151.us, label %for.body11.us.us.preheader, label %for.body11.us271.preheader

for.body11.us.us.preheader:                       ; preds = %for.body11.preheader.us
  %arrayidx25.us.us.prol = getelementptr inbounds i32, i32* %0, i64 %27
  br label %for.body11.us.us

for.body11.us271.preheader:                       ; preds = %for.body11.preheader.us
  %28 = mul i64 %22, %indvars.iv17.us
  %scevgep309 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep309, i8 0, i64 %24, i32 4, i1 false)
  br label %for.inc39.loopexit.us

for.inc39.loopexit.us.loopexit:                   ; preds = %for.inc36.loopexit.us.us
  br label %for.inc39.loopexit.us

for.inc39.loopexit.us:                            ; preds = %for.inc39.loopexit.us.loopexit, %for.body11.us271.preheader
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv17.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next18.us, %21
  br i1 %cmp.us, label %for.body11.preheader.us, label %for.end41.loopexit367

for.body11.us.us:                                 ; preds = %for.body11.us.us.preheader, %for.inc36.loopexit.us.us
  %indvars.iv12.us.us = phi i64 [ %indvars.iv.next13.us.us, %for.inc36.loopexit.us.us ], [ 0, %for.body11.us.us.preheader ]
  %29 = add nsw i64 %indvars.iv12.us.us, %27
  %arrayidx.us.us = getelementptr inbounds i32, i32* %4, i64 %29
  store i32 0, i32* %arrayidx.us.us, align 4
  br i1 %lcmp.mod380, label %for.body11.us.us.split, label %for.body17.us.us.prol

for.body17.us.us.prol:                            ; preds = %for.body11.us.us
  %30 = load i32, i32* %arrayidx25.us.us.prol, align 4
  %arrayidx29.us.us.prol = getelementptr inbounds i32, i32* %1, i64 %indvars.iv12.us.us
  %31 = load i32, i32* %arrayidx29.us.us.prol, align 4
  %mul30.us.us.prol = mul nsw i32 %31, %30
  store i32 %mul30.us.us.prol, i32* %arrayidx.us.us, align 4
  br label %for.body11.us.us.split

for.body11.us.us.split:                           ; preds = %for.body11.us.us, %for.body17.us.us.prol
  %.unr = phi i32 [ 0, %for.body11.us.us ], [ %mul30.us.us.prol, %for.body17.us.us.prol ]
  %indvars.iv.us.us.unr = phi i64 [ 0, %for.body11.us.us ], [ 1, %for.body17.us.us.prol ]
  br i1 %26, label %for.inc36.loopexit.us.us, label %for.body11.us.us.split.split

for.body11.us.us.split.split:                     ; preds = %for.body11.us.us.split
  br label %for.body17.us.us

for.inc36.loopexit.us.us.unr-lcssa:               ; preds = %for.body17.us.us
  br label %for.inc36.loopexit.us.us

for.inc36.loopexit.us.us:                         ; preds = %for.body11.us.us.split, %for.inc36.loopexit.us.us.unr-lcssa
  %indvars.iv.next13.us.us = add nuw nsw i64 %indvars.iv12.us.us, 1
  %cmp9.us.us = icmp slt i64 %indvars.iv.next13.us.us, %5
  br i1 %cmp9.us.us, label %for.body11.us.us, label %for.inc39.loopexit.us.loopexit

for.body17.us.us:                                 ; preds = %for.body17.us.us, %for.body11.us.us.split.split
  %32 = phi i32 [ %.unr, %for.body11.us.us.split.split ], [ %add31.us.us.1, %for.body17.us.us ]
  %indvars.iv.us.us = phi i64 [ %indvars.iv.us.us.unr, %for.body11.us.us.split.split ], [ %indvars.iv.next.us.us.1, %for.body17.us.us ]
  %33 = add nsw i64 %indvars.iv.us.us, %27
  %arrayidx25.us.us = getelementptr inbounds i32, i32* %0, i64 %33
  %34 = load i32, i32* %arrayidx25.us.us, align 4
  %35 = mul nsw i64 %indvars.iv.us.us, %5
  %36 = add nsw i64 %35, %indvars.iv12.us.us
  %arrayidx29.us.us = getelementptr inbounds i32, i32* %1, i64 %36
  %37 = load i32, i32* %arrayidx29.us.us, align 4
  %mul30.us.us = mul nsw i32 %37, %34
  %add31.us.us = add nsw i32 %mul30.us.us, %32
  store i32 %add31.us.us, i32* %arrayidx.us.us, align 4
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %38 = add nsw i64 %indvars.iv.next.us.us, %27
  %arrayidx25.us.us.1 = getelementptr inbounds i32, i32* %0, i64 %38
  %39 = load i32, i32* %arrayidx25.us.us.1, align 4
  %40 = mul nsw i64 %indvars.iv.next.us.us, %5
  %41 = add nsw i64 %40, %indvars.iv12.us.us
  %arrayidx29.us.us.1 = getelementptr inbounds i32, i32* %1, i64 %41
  %42 = load i32, i32* %arrayidx29.us.us.1, align 4
  %mul30.us.us.1 = mul nsw i32 %42, %39
  %add31.us.us.1 = add nsw i32 %mul30.us.us.1, %add31.us.us
  store i32 %add31.us.us.1, i32* %arrayidx.us.us, align 4
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv.us.us, 2
  %cmp15.us.us.1 = icmp slt i64 %indvars.iv.next.us.us.1, %25
  br i1 %cmp15.us.us.1, label %for.body17.us.us, label %for.inc36.loopexit.us.us.unr-lcssa

for.end41.loopexit:                               ; preds = %polly.loop_exit160
  br label %for.end41

for.end41.loopexit367:                            ; preds = %for.inc39.loopexit.us
  br label %for.end41

for.end41:                                        ; preds = %for.end41.loopexit367, %for.end41.loopexit, %polly.start, %for.cond7.preheader.preheader, %polly.cond142, %polly.then144, %entry
  %call42 = tail call noalias i8* @malloc(i64 16) #4
  %43 = bitcast i8* %call42 to %struct.Matrix*
  %44 = bitcast i8* %call42 to i8**
  store i8* %call, i8** %44, align 8
  %width44 = getelementptr inbounds i8, i8* %call42, i64 8
  %45 = bitcast i8* %width44 to i32*
  store i32 %2, i32* %45, align 8
  %height45 = getelementptr inbounds i8, i8* %call42, i64 12
  %46 = bitcast i8* %height45 to i32*
  store i32 %3, i32* %46, align 4
  ret %struct.Matrix* %43

polly.start:                                      ; preds = %polly.preload.merge
  %polly.fdiv_q.shr = ashr i64 %13, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %for.end41

polly.cond:                                       ; preds = %polly.loop_exit30
  %47 = icmp slt i32 %3, 1
  br i1 %47, label %polly.then, label %polly.merge

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_exit68.1
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.loop_header57.preheader.split, %polly.merge.loopexit.unr-lcssa
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.cond, %polly.then
  %48 = phi i1 [ false, %polly.cond ], [ true, %polly.then ], [ %47, %polly.merge.loopexit ]
  br i1 %polly.loop_guard, label %polly.loop_preheader82, label %polly.cond142

polly.cond142.loopexit:                           ; preds = %polly.loop_exit93
  br label %polly.cond142

polly.cond142:                                    ; preds = %polly.cond142.loopexit, %polly.merge
  br i1 %48, label %polly.then144, label %for.end41

polly.preload.exec:                               ; preds = %for.cond7.preheader.lr.ph
  %49 = getelementptr %struct.Matrix, %struct.Matrix* %A, i64 0, i32 1
  %50 = bitcast i32* %49 to i64*
  %polly.access.A3.load = load i64, i64* %50, align 8
  %51 = trunc i64 %polly.access.A3.load to i32
  %52 = lshr i64 %polly.access.A3.load, 32
  %53 = trunc i64 %52 to i32
  br label %polly.preload.merge

polly.loop_header:                                ; preds = %polly.loop_exit30, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit30 ]
  %54 = mul i64 %70, %polly.indvar
  br i1 %polly.loop_guard31, label %polly.loop_header28.preheader, label %polly.loop_exit30

polly.loop_header28.preheader:                    ; preds = %polly.loop_header
  %55 = shl nsw i64 %polly.indvar, 5
  %56 = sub nsw i64 %12, %55
  %57 = add nsw i64 %56, -1
  %58 = icmp sgt i64 %57, 31
  %59 = select i1 %58, i64 31, i64 %57
  %polly.loop_guard40 = icmp sgt i64 %59, -1
  %polly.adjust_ub43 = add i64 %59, -1
  br i1 %polly.loop_guard40, label %polly.loop_header37.preheader.us.preheader, label %polly.loop_exit30

polly.loop_header37.preheader.us.preheader:       ; preds = %polly.loop_header28.preheader
  br label %polly.loop_header37.preheader.us

polly.loop_header37.preheader.us:                 ; preds = %polly.loop_header37.preheader.us.preheader, %polly.loop_exit39.loopexit.us
  %polly.indvar32.us = phi i64 [ %polly.indvar_next33.us, %polly.loop_exit39.loopexit.us ], [ 0, %polly.loop_header37.preheader.us.preheader ]
  %60 = shl i64 %polly.indvar32.us, 7
  %61 = add i64 %54, %60
  %62 = shl i64 %polly.indvar32.us, 5
  %63 = sub i64 %62, %5
  %64 = icmp sgt i64 %63, -32
  %smax308 = select i1 %64, i64 %63, i64 -32
  %65 = mul i64 %smax308, -4
  %polly.loop_guard49.us313 = icmp slt i64 %62, %5
  br i1 %polly.loop_guard49.us313, label %polly.stmt.for.body11.preheader.us.us.preheader, label %polly.loop_exit39.loopexit.us

polly.stmt.for.body11.preheader.us.us.preheader:  ; preds = %polly.loop_header37.preheader.us
  br label %polly.stmt.for.body11.preheader.us.us

polly.loop_exit39.loopexit.us.loopexit:           ; preds = %polly.stmt.for.body11.preheader.us.us
  br label %polly.loop_exit39.loopexit.us

polly.loop_exit39.loopexit.us:                    ; preds = %polly.loop_exit39.loopexit.us.loopexit, %polly.loop_header37.preheader.us
  %polly.indvar_next33.us = add nuw nsw i64 %polly.indvar32.us, 1
  %exitcond305 = icmp eq i64 %polly.indvar32.us, %polly.fdiv_q.shr26
  br i1 %exitcond305, label %polly.loop_exit30.loopexit, label %polly.loop_header37.preheader.us

polly.stmt.for.body11.preheader.us.us:            ; preds = %polly.stmt.for.body11.preheader.us.us.preheader, %polly.stmt.for.body11.preheader.us.us
  %polly.indvar41.us.us = phi i64 [ %polly.indvar_next42.us.us, %polly.stmt.for.body11.preheader.us.us ], [ 0, %polly.stmt.for.body11.preheader.us.us.preheader ]
  %66 = mul i64 %69, %polly.indvar41.us.us
  %67 = add i64 %61, %66
  %scevgep307 = getelementptr i8, i8* %call, i64 %67
  call void @llvm.memset.p0i8.i64(i8* %scevgep307, i8 0, i64 %65, i32 4, i1 false)
  %polly.indvar_next42.us.us = add nuw nsw i64 %polly.indvar41.us.us, 1
  %polly.loop_cond44.us.us = icmp sgt i64 %polly.indvar41.us.us, %polly.adjust_ub43
  br i1 %polly.loop_cond44.us.us, label %polly.loop_exit39.loopexit.us.loopexit, label %polly.stmt.for.body11.preheader.us.us

polly.loop_exit30.loopexit:                       ; preds = %polly.loop_exit39.loopexit.us
  br label %polly.loop_exit30

polly.loop_exit30:                                ; preds = %polly.loop_exit30.loopexit, %polly.loop_header28.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond306 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond306, label %polly.cond, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.start
  %68 = add nsw i64 %5, -1
  %polly.fdiv_q.shr26 = ashr i64 %68, 5
  %polly.loop_guard31 = icmp sgt i64 %polly.fdiv_q.shr26, -1
  %69 = shl nsw i64 %5, 2
  %70 = shl nsw i64 %5, 7
  br label %polly.loop_header

polly.then:                                       ; preds = %polly.cond
  %71 = add nsw i64 %5, -1
  %polly.fdiv_q.shr55 = ashr i64 %71, 5
  %polly.loop_guard60 = icmp sgt i64 %polly.fdiv_q.shr55, -1
  br i1 %polly.loop_guard60, label %polly.loop_header57.preheader, label %polly.merge

polly.loop_header57.preheader:                    ; preds = %polly.then
  %72 = and i64 %polly.fdiv_q.shr55, 1
  %lcmp.mod378 = icmp eq i64 %72, 0
  br i1 %lcmp.mod378, label %polly.loop_header57.prol, label %polly.loop_header57.preheader.split

polly.loop_header57.prol:                         ; preds = %polly.loop_header57.preheader
  %73 = sub nsw i64 0, %5
  %polly.loop_guard69312.prol = icmp sgt i32 %2, 0
  br i1 %polly.loop_guard69312.prol, label %polly.stmt.for.body1174.preheader.prol, label %polly.loop_exit68.prol

polly.stmt.for.body1174.preheader.prol:           ; preds = %polly.loop_header57.prol
  %74 = icmp sgt i64 %73, -32
  %smax.prol = select i1 %74, i64 %73, i64 -32
  %75 = mul nsw i64 %smax.prol, -4
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 %75, i32 4, i1 false)
  br label %polly.loop_exit68.prol

polly.loop_exit68.prol:                           ; preds = %polly.stmt.for.body1174.preheader.prol, %polly.loop_header57.prol
  br label %polly.loop_header57.preheader.split

polly.loop_header57.preheader.split:              ; preds = %polly.loop_exit68.prol, %polly.loop_header57.preheader
  %polly.indvar61.unr = phi i64 [ 0, %polly.loop_header57.preheader ], [ 1, %polly.loop_exit68.prol ]
  %76 = icmp eq i64 %polly.fdiv_q.shr55, 0
  br i1 %76, label %polly.merge.loopexit, label %polly.loop_header57.preheader.split.split

polly.loop_header57.preheader.split.split:        ; preds = %polly.loop_header57.preheader.split
  br label %polly.loop_header57

polly.loop_header57:                              ; preds = %polly.loop_exit68.1, %polly.loop_header57.preheader.split.split
  %polly.indvar61 = phi i64 [ %polly.indvar61.unr, %polly.loop_header57.preheader.split.split ], [ %polly.indvar_next62.1, %polly.loop_exit68.1 ]
  %77 = shl i64 %polly.indvar61, 5
  %78 = sub i64 %77, %5
  %polly.loop_guard69312 = icmp slt i64 %77, %5
  br i1 %polly.loop_guard69312, label %polly.stmt.for.body1174.preheader, label %polly.loop_exit68

polly.stmt.for.body1174.preheader:                ; preds = %polly.loop_header57
  %79 = icmp sgt i64 %78, -32
  %smax = select i1 %79, i64 %78, i64 -32
  %80 = mul i64 %smax, -4
  %81 = shl i64 %polly.indvar61, 7
  %scevgep = getelementptr i8, i8* %call, i64 %81
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %80, i32 4, i1 false)
  br label %polly.loop_exit68

polly.loop_exit68:                                ; preds = %polly.stmt.for.body1174.preheader, %polly.loop_header57
  %polly.indvar_next62 = add nuw nsw i64 %polly.indvar61, 1
  %82 = shl i64 %polly.indvar_next62, 5
  %83 = sub i64 %82, %5
  %polly.loop_guard69312.1 = icmp slt i64 %82, %5
  br i1 %polly.loop_guard69312.1, label %polly.stmt.for.body1174.preheader.1, label %polly.loop_exit68.1

polly.loop_header81:                              ; preds = %polly.loop_exit93, %polly.loop_preheader82
  %polly.indvar85 = phi i64 [ 0, %polly.loop_preheader82 ], [ %polly.indvar_next86, %polly.loop_exit93 ]
  br i1 %polly.loop_guard94, label %polly.loop_header91.preheader, label %polly.loop_exit93

polly.loop_header91.preheader:                    ; preds = %polly.loop_header81
  %84 = shl nsw i64 %polly.indvar85, 5
  %85 = sub nsw i64 %12, %84
  %86 = add nsw i64 %85, -1
  %87 = icmp sgt i64 %86, 31
  %88 = select i1 %87, i64 31, i64 %86
  %polly.loop_guard113 = icmp sgt i64 %88, -1
  %polly.adjust_ub116 = add i64 %88, -1
  br label %polly.loop_header91

polly.loop_exit93.loopexit:                       ; preds = %polly.loop_exit103
  br label %polly.loop_exit93

polly.loop_exit93:                                ; preds = %polly.loop_exit93.loopexit, %polly.loop_header81
  %polly.indvar_next86 = add nuw nsw i64 %polly.indvar85, 1
  %exitcond302 = icmp eq i64 %polly.indvar85, %polly.fdiv_q.shr
  br i1 %exitcond302, label %polly.cond142.loopexit, label %polly.loop_header81

polly.loop_preheader82:                           ; preds = %polly.merge
  %89 = add nsw i64 %5, -1
  %polly.fdiv_q.shr89 = ashr i64 %89, 5
  %polly.loop_guard94 = icmp sgt i64 %polly.fdiv_q.shr89, -1
  %polly.fdiv_q.shr99 = ashr i64 %10, 5
  %polly.loop_guard104 = icmp sgt i64 %polly.fdiv_q.shr99, -1
  %ident.check = icmp eq i32 %2, 1
  br label %polly.loop_header81

polly.loop_header91:                              ; preds = %polly.loop_exit103, %polly.loop_header91.preheader
  %polly.indvar95 = phi i64 [ %polly.indvar_next96, %polly.loop_exit103 ], [ 0, %polly.loop_header91.preheader ]
  br i1 %polly.loop_guard104, label %polly.loop_header101.preheader, label %polly.loop_exit103

polly.loop_header101.preheader:                   ; preds = %polly.loop_header91
  %90 = shl nsw i64 %polly.indvar95, 5
  %91 = sub nsw i64 %5, %90
  %92 = add nsw i64 %91, -1
  %93 = icmp sgt i64 %92, 31
  %94 = select i1 %93, i64 31, i64 %92
  %polly.loop_guard122 = icmp sgt i64 %94, -1
  %polly.adjust_ub125 = add i64 %94, -1
  br label %polly.loop_header101

polly.loop_exit103.loopexit:                      ; preds = %polly.loop_exit112
  br label %polly.loop_exit103

polly.loop_exit103:                               ; preds = %polly.loop_exit103.loopexit, %polly.loop_header91
  %polly.indvar_next96 = add nuw nsw i64 %polly.indvar95, 1
  %exitcond301 = icmp eq i64 %polly.indvar95, %polly.fdiv_q.shr89
  br i1 %exitcond301, label %polly.loop_exit93.loopexit, label %polly.loop_header91

polly.loop_header101:                             ; preds = %polly.loop_exit112, %polly.loop_header101.preheader
  %polly.indvar105 = phi i64 [ %polly.indvar_next106, %polly.loop_exit112 ], [ 0, %polly.loop_header101.preheader ]
  %95 = shl i64 %polly.indvar105, 5
  %96 = sub i64 %95, %9
  %97 = icmp sgt i64 %96, -32
  %smax373 = select i1 %97, i64 %96, i64 -32
  %98 = sub i64 -2, %smax373
  %99 = icmp sgt i64 %98, -1
  %smax374 = select i1 %99, i64 %98, i64 -1
  %100 = add i64 %smax374, -2
  %101 = lshr i64 %100, 2
  %102 = shl i64 %polly.indvar105, 5
  %103 = sub i64 %102, %9
  %104 = icmp sgt i64 %103, -32
  %smax316 = select i1 %104, i64 %103, i64 -32
  %105 = sub i64 -2, %smax316
  %106 = icmp sgt i64 %105, -1
  %smax317 = select i1 %106, i64 %105, i64 -1
  %107 = add i64 %smax317, 2
  br i1 %polly.loop_guard113, label %polly.loop_header110.preheader, label %polly.loop_exit112

polly.loop_header110.preheader:                   ; preds = %polly.loop_header101
  %108 = shl nsw i64 %polly.indvar105, 5
  %109 = sub nsw i64 %9, %108
  %110 = add nsw i64 %109, -1
  %111 = icmp sgt i64 %110, 31
  %112 = select i1 %111, i64 31, i64 %110
  %polly.loop_guard131 = icmp sgt i64 %112, -1
  %polly.adjust_ub134 = add i64 %112, -1
  br i1 %polly.loop_guard122, label %polly.loop_header119.preheader.us.preheader, label %polly.loop_exit112

polly.loop_header119.preheader.us.preheader:      ; preds = %polly.loop_header110.preheader
  %min.iters.check = icmp ult i64 %107, 4
  %n.vec = and i64 %107, -4
  %cmp.zero = icmp ne i64 %n.vec, 0
  %or.cond = and i1 %cmp.zero, %ident.check
  %broadcast.splatinsert318 = insertelement <4 x i64> undef, i64 %108, i32 0
  %broadcast.splat319 = shufflevector <4 x i64> %broadcast.splatinsert318, <4 x i64> undef, <4 x i32> zeroinitializer
  %113 = and i64 %101, 1
  %lcmp.mod376 = icmp eq i64 %113, 0
  %114 = icmp eq i64 %101, 0
  %cmp.n = icmp eq i64 %107, %n.vec
  br label %polly.loop_header119.preheader.us

polly.loop_header119.preheader.us:                ; preds = %polly.loop_header119.preheader.us.preheader, %polly.loop_exit121.loopexit.us
  %polly.indvar114.us = phi i64 [ %polly.indvar_next115.us, %polly.loop_exit121.loopexit.us ], [ 0, %polly.loop_header119.preheader.us.preheader ]
  %115 = add nuw nsw i64 %polly.indvar114.us, %84
  %116 = mul i64 %115, %5
  br i1 %polly.loop_guard131, label %polly.loop_header128.preheader.us.us.preheader, label %polly.loop_exit121.loopexit.us

polly.loop_header128.preheader.us.us.preheader:   ; preds = %polly.loop_header119.preheader.us
  %117 = add i64 %108, %116
  %118 = getelementptr i32, i32* %0, i64 %117
  %119 = bitcast i32* %118 to <4 x i32>*
  br label %polly.loop_header128.preheader.us.us

polly.loop_exit121.loopexit.us.loopexit:          ; preds = %polly.loop_exit130.loopexit.us.us
  br label %polly.loop_exit121.loopexit.us

polly.loop_exit121.loopexit.us:                   ; preds = %polly.loop_exit121.loopexit.us.loopexit, %polly.loop_header119.preheader.us
  %polly.indvar_next115.us = add nuw nsw i64 %polly.indvar114.us, 1
  %polly.loop_cond117.us = icmp sgt i64 %polly.indvar114.us, %polly.adjust_ub116
  br i1 %polly.loop_cond117.us, label %polly.loop_exit112.loopexit, label %polly.loop_header119.preheader.us

polly.loop_header128.preheader.us.us:             ; preds = %polly.loop_header128.preheader.us.us.preheader, %polly.loop_exit130.loopexit.us.us
  %polly.indvar123.us.us = phi i64 [ %polly.indvar_next124.us.us, %polly.loop_exit130.loopexit.us.us ], [ 0, %polly.loop_header128.preheader.us.us.preheader ]
  %120 = add nuw nsw i64 %polly.indvar123.us.us, %90
  %tmp199.us.us = add i64 %120, %116
  %tmp200.us.us = shl i64 %tmp199.us.us, 2
  %scevgep136.us.us = getelementptr i8, i8* %call, i64 %tmp200.us.us
  %scevgep136137.us.us = bitcast i8* %scevgep136.us.us to i32*
  %scevgep136137.promoted.us.us = load i32, i32* %scevgep136137.us.us, align 4, !alias.scope !4, !noalias !6
  br i1 %min.iters.check, label %polly.loop_header128.us.us.preheader, label %min.iters.checked

polly.loop_header128.us.us.preheader:             ; preds = %min.iters.checked, %middle.block, %polly.loop_header128.preheader.us.us
  %p_add31203.us.us.ph = phi i32 [ %scevgep136137.promoted.us.us, %min.iters.checked ], [ %scevgep136137.promoted.us.us, %polly.loop_header128.preheader.us.us ], [ %146, %middle.block ]
  %polly.indvar132.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %polly.loop_header128.preheader.us.us ], [ %n.vec, %middle.block ]
  br label %polly.loop_header128.us.us

min.iters.checked:                                ; preds = %polly.loop_header128.preheader.us.us
  br i1 %or.cond, label %vector.ph, label %polly.loop_header128.us.us.preheader

vector.ph:                                        ; preds = %min.iters.checked
  %121 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %scevgep136137.promoted.us.us, i32 0
  br i1 %lcmp.mod376, label %vector.body.prol, label %vector.ph.split

vector.body.prol:                                 ; preds = %vector.ph
  %wide.load.prol = load <4 x i32>, <4 x i32>* %119, align 4, !alias.scope !8, !noalias !9
  %122 = add i64 %108, %120
  %123 = getelementptr i32, i32* %1, i64 %122
  %124 = bitcast i32* %123 to <4 x i32>*
  %wide.load324.prol = load <4 x i32>, <4 x i32>* %124, align 4, !alias.scope !7, !noalias !10
  %125 = mul nsw <4 x i32> %wide.load324.prol, %wide.load.prol
  %126 = add nsw <4 x i32> %125, %121
  br label %vector.ph.split

vector.ph.split:                                  ; preds = %vector.body.prol, %vector.ph
  %.lcssa369.unr = phi <4 x i32> [ undef, %vector.ph ], [ %126, %vector.body.prol ]
  %index.unr = phi i64 [ 0, %vector.ph ], [ 4, %vector.body.prol ]
  %vec.phi.unr = phi <4 x i32> [ %121, %vector.ph ], [ %126, %vector.body.prol ]
  br i1 %114, label %middle.block, label %vector.ph.split.split

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i64 [ %index.unr, %vector.ph.split.split ], [ %index.next.1, %vector.body ]
  %vec.phi = phi <4 x i32> [ %vec.phi.unr, %vector.ph.split.split ], [ %144, %vector.body ]
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i64> %broadcast.splat, <i64 0, i64 1, i64 2, i64 3>
  %127 = add nuw nsw <4 x i64> %induction, %broadcast.splat319
  %.lhs364 = extractelement <4 x i64> %127, i32 0
  %128 = add i64 %.lhs364, %116
  %129 = getelementptr i32, i32* %0, i64 %128
  %130 = bitcast i32* %129 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %130, align 4, !alias.scope !8, !noalias !9
  %.lhs365 = extractelement <4 x i64> %127, i32 0
  %131 = add i64 %.lhs365, %120
  %132 = getelementptr i32, i32* %1, i64 %131
  %133 = bitcast i32* %132 to <4 x i32>*
  %wide.load324 = load <4 x i32>, <4 x i32>* %133, align 4, !alias.scope !7, !noalias !10
  %134 = mul nsw <4 x i32> %wide.load324, %wide.load
  %135 = add nsw <4 x i32> %134, %vec.phi
  %index.next = add i64 %index, 4
  %broadcast.splatinsert.1 = insertelement <4 x i64> undef, i64 %index.next, i32 0
  %broadcast.splat.1 = shufflevector <4 x i64> %broadcast.splatinsert.1, <4 x i64> undef, <4 x i32> zeroinitializer
  %induction.1 = add <4 x i64> %broadcast.splat.1, <i64 0, i64 1, i64 2, i64 3>
  %136 = add nuw nsw <4 x i64> %induction.1, %broadcast.splat319
  %.lhs364.1 = extractelement <4 x i64> %136, i32 0
  %137 = add i64 %.lhs364.1, %116
  %138 = getelementptr i32, i32* %0, i64 %137
  %139 = bitcast i32* %138 to <4 x i32>*
  %wide.load.1 = load <4 x i32>, <4 x i32>* %139, align 4, !alias.scope !8, !noalias !9
  %.lhs365.1 = extractelement <4 x i64> %136, i32 0
  %140 = add i64 %.lhs365.1, %120
  %141 = getelementptr i32, i32* %1, i64 %140
  %142 = bitcast i32* %141 to <4 x i32>*
  %wide.load324.1 = load <4 x i32>, <4 x i32>* %142, align 4, !alias.scope !7, !noalias !10
  %143 = mul nsw <4 x i32> %wide.load324.1, %wide.load.1
  %144 = add nsw <4 x i32> %143, %135
  %index.next.1 = add i64 %index, 8
  %145 = icmp eq i64 %index.next.1, %n.vec
  br i1 %145, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !11

middle.block.unr-lcssa:                           ; preds = %vector.body
  %.lcssa383 = phi <4 x i32> [ %144, %vector.body ]
  br label %middle.block

middle.block:                                     ; preds = %vector.ph.split, %middle.block.unr-lcssa
  %.lcssa369 = phi <4 x i32> [ %.lcssa369.unr, %vector.ph.split ], [ %.lcssa383, %middle.block.unr-lcssa ]
  %rdx.shuf = shufflevector <4 x i32> %.lcssa369, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %.lcssa369, %rdx.shuf
  %rdx.shuf327 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx328 = add <4 x i32> %bin.rdx, %rdx.shuf327
  %146 = extractelement <4 x i32> %bin.rdx328, i32 0
  br i1 %cmp.n, label %polly.loop_exit130.loopexit.us.us, label %polly.loop_header128.us.us.preheader

polly.loop_exit130.loopexit.us.us.loopexit:       ; preds = %polly.loop_header128.us.us
  %p_add31.us.us.lcssa384 = phi i32 [ %p_add31.us.us, %polly.loop_header128.us.us ]
  br label %polly.loop_exit130.loopexit.us.us

polly.loop_exit130.loopexit.us.us:                ; preds = %polly.loop_exit130.loopexit.us.us.loopexit, %middle.block
  %p_add31.us.us.lcssa = phi i32 [ %146, %middle.block ], [ %p_add31.us.us.lcssa384, %polly.loop_exit130.loopexit.us.us.loopexit ]
  store i32 %p_add31.us.us.lcssa, i32* %scevgep136137.us.us, align 4, !alias.scope !4, !noalias !6
  %polly.indvar_next124.us.us = add nuw nsw i64 %polly.indvar123.us.us, 1
  %polly.loop_cond126.us.us = icmp sgt i64 %polly.indvar123.us.us, %polly.adjust_ub125
  br i1 %polly.loop_cond126.us.us, label %polly.loop_exit121.loopexit.us.loopexit, label %polly.loop_header128.preheader.us.us

polly.loop_header128.us.us:                       ; preds = %polly.loop_header128.us.us.preheader, %polly.loop_header128.us.us
  %p_add31203.us.us = phi i32 [ %p_add31.us.us, %polly.loop_header128.us.us ], [ %p_add31203.us.us.ph, %polly.loop_header128.us.us.preheader ]
  %polly.indvar132.us.us = phi i64 [ %polly.indvar_next133.us.us, %polly.loop_header128.us.us ], [ %polly.indvar132.us.us.ph, %polly.loop_header128.us.us.preheader ]
  %147 = add nuw nsw i64 %polly.indvar132.us.us, %108
  %148 = add i64 %147, %116
  %scevgep138.us.us = getelementptr i32, i32* %0, i64 %148
  %_p_scalar_139.us.us = load i32, i32* %scevgep138.us.us, align 4, !alias.scope !8, !noalias !9
  %149 = mul i64 %147, %5
  %150 = add i64 %149, %120
  %scevgep140.us.us = getelementptr i32, i32* %1, i64 %150
  %_p_scalar_141.us.us = load i32, i32* %scevgep140.us.us, align 4, !alias.scope !7, !noalias !10
  %p_mul30.us.us = mul nsw i32 %_p_scalar_141.us.us, %_p_scalar_139.us.us
  %p_add31.us.us = add nsw i32 %p_mul30.us.us, %p_add31203.us.us
  %polly.indvar_next133.us.us = add nuw nsw i64 %polly.indvar132.us.us, 1
  %polly.loop_cond135.us.us = icmp sgt i64 %polly.indvar132.us.us, %polly.adjust_ub134
  br i1 %polly.loop_cond135.us.us, label %polly.loop_exit130.loopexit.us.us.loopexit, label %polly.loop_header128.us.us, !llvm.loop !14

polly.loop_exit112.loopexit:                      ; preds = %polly.loop_exit121.loopexit.us
  br label %polly.loop_exit112

polly.loop_exit112:                               ; preds = %polly.loop_exit112.loopexit, %polly.loop_header110.preheader, %polly.loop_header101
  %polly.indvar_next106 = add nuw nsw i64 %polly.indvar105, 1
  %exitcond300 = icmp eq i64 %polly.indvar105, %polly.fdiv_q.shr99
  br i1 %exitcond300, label %polly.loop_exit103.loopexit, label %polly.loop_header101

polly.then144:                                    ; preds = %polly.cond142
  %151 = add nsw i64 %5, -1
  %polly.fdiv_q.shr146 = ashr i64 %151, 5
  %polly.loop_guard151 = icmp sgt i64 %polly.fdiv_q.shr146, -1
  br i1 %polly.loop_guard151, label %polly.loop_header148.preheader, label %for.end41

polly.loop_header148.preheader:                   ; preds = %polly.then144
  %polly.fdiv_q.shr156 = ashr i64 %10, 5
  %polly.loop_guard161 = icmp sgt i64 %polly.fdiv_q.shr156, -1
  %ident.check340 = icmp eq i32 %2, 1
  br label %polly.loop_header148

polly.loop_header148:                             ; preds = %polly.loop_exit160, %polly.loop_header148.preheader
  %polly.indvar152 = phi i64 [ %polly.indvar_next153, %polly.loop_exit160 ], [ 0, %polly.loop_header148.preheader ]
  br i1 %polly.loop_guard161, label %polly.loop_header158.preheader, label %polly.loop_exit160

polly.loop_header158.preheader:                   ; preds = %polly.loop_header148
  %152 = shl nsw i64 %polly.indvar152, 5
  %153 = sub nsw i64 %5, %152
  %154 = add nsw i64 %153, -1
  %155 = icmp sgt i64 %154, 31
  %156 = select i1 %155, i64 31, i64 %154
  %polly.loop_guard170 = icmp sgt i64 %156, -1
  %polly.adjust_ub173 = add i64 %156, -1
  br i1 %polly.loop_guard170, label %polly.loop_header167.preheader.us.preheader, label %polly.loop_exit160

polly.loop_header167.preheader.us.preheader:      ; preds = %polly.loop_header158.preheader
  br label %polly.loop_header167.preheader.us

polly.loop_header167.preheader.us:                ; preds = %polly.loop_header167.preheader.us.preheader, %polly.loop_exit169.loopexit.us
  %polly.indvar162.us = phi i64 [ %polly.indvar_next163.us, %polly.loop_exit169.loopexit.us ], [ 0, %polly.loop_header167.preheader.us.preheader ]
  %157 = shl i64 %polly.indvar162.us, 5
  %158 = sub i64 %157, %9
  %159 = icmp sgt i64 %158, -32
  %smax371 = select i1 %159, i64 %158, i64 -32
  %160 = sub i64 -2, %smax371
  %161 = icmp sgt i64 %160, -1
  %smax372 = select i1 %161, i64 %160, i64 -1
  %162 = add i64 %smax372, -2
  %163 = lshr i64 %162, 2
  %164 = shl i64 %polly.indvar162.us, 5
  %165 = sub i64 %164, %9
  %166 = icmp sgt i64 %165, -32
  %smax332 = select i1 %166, i64 %165, i64 -32
  %167 = sub i64 -2, %smax332
  %168 = icmp sgt i64 %167, -1
  %smax333 = select i1 %168, i64 %167, i64 -1
  %169 = add i64 %smax333, 2
  %170 = shl nsw i64 %polly.indvar162.us, 5
  %171 = sub nsw i64 %9, %170
  %172 = add nsw i64 %171, -1
  %173 = icmp sgt i64 %172, 31
  %174 = select i1 %173, i64 31, i64 %172
  %polly.loop_guard179.us = icmp sgt i64 %174, -1
  %polly.adjust_ub182.us = add i64 %174, -1
  br i1 %polly.loop_guard179.us, label %polly.loop_header176.preheader.us.us.preheader, label %polly.loop_exit169.loopexit.us

polly.loop_header176.preheader.us.us.preheader:   ; preds = %polly.loop_header167.preheader.us
  %min.iters.check334 = icmp ult i64 %169, 4
  %n.vec337 = and i64 %169, -4
  %cmp.zero338 = icmp ne i64 %n.vec337, 0
  %or.cond366 = and i1 %cmp.zero338, %ident.check340
  %broadcast.splatinsert351 = insertelement <4 x i64> undef, i64 %170, i32 0
  %broadcast.splat352 = shufflevector <4 x i64> %broadcast.splatinsert351, <4 x i64> undef, <4 x i32> zeroinitializer
  %175 = and i64 %163, 1
  %lcmp.mod = icmp eq i64 %175, 0
  %176 = getelementptr i32, i32* %0, i64 %170
  %177 = bitcast i32* %176 to <4 x i32>*
  %178 = icmp eq i64 %163, 0
  %cmp.n346 = icmp eq i64 %169, %n.vec337
  br label %polly.loop_header176.preheader.us.us

polly.loop_exit169.loopexit.us.loopexit:          ; preds = %polly.loop_exit178.loopexit.us.us
  br label %polly.loop_exit169.loopexit.us

polly.loop_exit169.loopexit.us:                   ; preds = %polly.loop_exit169.loopexit.us.loopexit, %polly.loop_header167.preheader.us
  %polly.indvar_next163.us = add nuw nsw i64 %polly.indvar162.us, 1
  %exitcond298 = icmp eq i64 %polly.indvar162.us, %polly.fdiv_q.shr156
  br i1 %exitcond298, label %polly.loop_exit160.loopexit, label %polly.loop_header167.preheader.us

polly.loop_header176.preheader.us.us:             ; preds = %polly.loop_header176.preheader.us.us.preheader, %polly.loop_exit178.loopexit.us.us
  %polly.indvar171.us.us = phi i64 [ %polly.indvar_next172.us.us, %polly.loop_exit178.loopexit.us.us ], [ 0, %polly.loop_header176.preheader.us.us.preheader ]
  %179 = add nuw nsw i64 %polly.indvar171.us.us, %152
  %180 = shl i64 %179, 2
  %scevgep186.us.us = getelementptr i8, i8* %call, i64 %180
  %scevgep186187.us.us = bitcast i8* %scevgep186.us.us to i32*
  %scevgep186187.promoted.us.us = load i32, i32* %scevgep186187.us.us, align 4, !alias.scope !4, !noalias !6
  br i1 %min.iters.check334, label %polly.loop_header176.us.us.preheader, label %min.iters.checked335

polly.loop_header176.us.us.preheader:             ; preds = %min.iters.checked335, %middle.block330, %polly.loop_header176.preheader.us.us
  %p_add31195202.us.us.ph = phi i32 [ %scevgep186187.promoted.us.us, %min.iters.checked335 ], [ %scevgep186187.promoted.us.us, %polly.loop_header176.preheader.us.us ], [ %206, %middle.block330 ]
  %polly.indvar180.us.us.ph = phi i64 [ 0, %min.iters.checked335 ], [ 0, %polly.loop_header176.preheader.us.us ], [ %n.vec337, %middle.block330 ]
  br label %polly.loop_header176.us.us

min.iters.checked335:                             ; preds = %polly.loop_header176.preheader.us.us
  br i1 %or.cond366, label %vector.ph342, label %polly.loop_header176.us.us.preheader

vector.ph342:                                     ; preds = %min.iters.checked335
  %181 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %scevgep186187.promoted.us.us, i32 0
  br i1 %lcmp.mod, label %vector.body329.prol, label %vector.ph342.split

vector.body329.prol:                              ; preds = %vector.ph342
  %wide.load353.prol = load <4 x i32>, <4 x i32>* %177, align 4, !alias.scope !8, !noalias !9
  %182 = add i64 %170, %179
  %183 = getelementptr i32, i32* %1, i64 %182
  %184 = bitcast i32* %183 to <4 x i32>*
  %wide.load356.prol = load <4 x i32>, <4 x i32>* %184, align 4, !alias.scope !7, !noalias !10
  %185 = mul nsw <4 x i32> %wide.load356.prol, %wide.load353.prol
  %186 = add nsw <4 x i32> %185, %181
  br label %vector.ph342.split

vector.ph342.split:                               ; preds = %vector.body329.prol, %vector.ph342
  %.lcssa.unr = phi <4 x i32> [ undef, %vector.ph342 ], [ %186, %vector.body329.prol ]
  %index343.unr = phi i64 [ 0, %vector.ph342 ], [ 4, %vector.body329.prol ]
  %vec.phi347.unr = phi <4 x i32> [ %181, %vector.ph342 ], [ %186, %vector.body329.prol ]
  br i1 %178, label %middle.block330, label %vector.ph342.split.split

vector.ph342.split.split:                         ; preds = %vector.ph342.split
  br label %vector.body329

vector.body329:                                   ; preds = %vector.body329, %vector.ph342.split.split
  %index343 = phi i64 [ %index343.unr, %vector.ph342.split.split ], [ %index.next344.1, %vector.body329 ]
  %vec.phi347 = phi <4 x i32> [ %vec.phi347.unr, %vector.ph342.split.split ], [ %204, %vector.body329 ]
  %broadcast.splatinsert348 = insertelement <4 x i64> undef, i64 %index343, i32 0
  %broadcast.splat349 = shufflevector <4 x i64> %broadcast.splatinsert348, <4 x i64> undef, <4 x i32> zeroinitializer
  %induction350 = add <4 x i64> %broadcast.splat349, <i64 0, i64 1, i64 2, i64 3>
  %187 = add nuw nsw <4 x i64> %induction350, %broadcast.splat352
  %188 = extractelement <4 x i64> %187, i32 0
  %189 = getelementptr i32, i32* %0, i64 %188
  %190 = bitcast i32* %189 to <4 x i32>*
  %wide.load353 = load <4 x i32>, <4 x i32>* %190, align 4, !alias.scope !8, !noalias !9
  %.lhs = extractelement <4 x i64> %187, i32 0
  %191 = add i64 %.lhs, %179
  %192 = getelementptr i32, i32* %1, i64 %191
  %193 = bitcast i32* %192 to <4 x i32>*
  %wide.load356 = load <4 x i32>, <4 x i32>* %193, align 4, !alias.scope !7, !noalias !10
  %194 = mul nsw <4 x i32> %wide.load356, %wide.load353
  %195 = add nsw <4 x i32> %194, %vec.phi347
  %index.next344 = add i64 %index343, 4
  %broadcast.splatinsert348.1 = insertelement <4 x i64> undef, i64 %index.next344, i32 0
  %broadcast.splat349.1 = shufflevector <4 x i64> %broadcast.splatinsert348.1, <4 x i64> undef, <4 x i32> zeroinitializer
  %induction350.1 = add <4 x i64> %broadcast.splat349.1, <i64 0, i64 1, i64 2, i64 3>
  %196 = add nuw nsw <4 x i64> %induction350.1, %broadcast.splat352
  %197 = extractelement <4 x i64> %196, i32 0
  %198 = getelementptr i32, i32* %0, i64 %197
  %199 = bitcast i32* %198 to <4 x i32>*
  %wide.load353.1 = load <4 x i32>, <4 x i32>* %199, align 4, !alias.scope !8, !noalias !9
  %.lhs.1 = extractelement <4 x i64> %196, i32 0
  %200 = add i64 %.lhs.1, %179
  %201 = getelementptr i32, i32* %1, i64 %200
  %202 = bitcast i32* %201 to <4 x i32>*
  %wide.load356.1 = load <4 x i32>, <4 x i32>* %202, align 4, !alias.scope !7, !noalias !10
  %203 = mul nsw <4 x i32> %wide.load356.1, %wide.load353.1
  %204 = add nsw <4 x i32> %203, %195
  %index.next344.1 = add i64 %index343, 8
  %205 = icmp eq i64 %index.next344.1, %n.vec337
  br i1 %205, label %middle.block330.unr-lcssa, label %vector.body329, !llvm.loop !15

middle.block330.unr-lcssa:                        ; preds = %vector.body329
  %.lcssa381 = phi <4 x i32> [ %204, %vector.body329 ]
  br label %middle.block330

middle.block330:                                  ; preds = %vector.ph342.split, %middle.block330.unr-lcssa
  %.lcssa = phi <4 x i32> [ %.lcssa.unr, %vector.ph342.split ], [ %.lcssa381, %middle.block330.unr-lcssa ]
  %rdx.shuf359 = shufflevector <4 x i32> %.lcssa, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx360 = add <4 x i32> %.lcssa, %rdx.shuf359
  %rdx.shuf361 = shufflevector <4 x i32> %bin.rdx360, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx362 = add <4 x i32> %bin.rdx360, %rdx.shuf361
  %206 = extractelement <4 x i32> %bin.rdx362, i32 0
  br i1 %cmp.n346, label %polly.loop_exit178.loopexit.us.us, label %polly.loop_header176.us.us.preheader

polly.loop_exit178.loopexit.us.us.loopexit:       ; preds = %polly.loop_header176.us.us
  %p_add31195.us.us.lcssa382 = phi i32 [ %p_add31195.us.us, %polly.loop_header176.us.us ]
  br label %polly.loop_exit178.loopexit.us.us

polly.loop_exit178.loopexit.us.us:                ; preds = %polly.loop_exit178.loopexit.us.us.loopexit, %middle.block330
  %p_add31195.us.us.lcssa = phi i32 [ %206, %middle.block330 ], [ %p_add31195.us.us.lcssa382, %polly.loop_exit178.loopexit.us.us.loopexit ]
  store i32 %p_add31195.us.us.lcssa, i32* %scevgep186187.us.us, align 4, !alias.scope !4, !noalias !6
  %polly.indvar_next172.us.us = add nuw nsw i64 %polly.indvar171.us.us, 1
  %polly.loop_cond174.us.us = icmp sgt i64 %polly.indvar171.us.us, %polly.adjust_ub173
  br i1 %polly.loop_cond174.us.us, label %polly.loop_exit169.loopexit.us.loopexit, label %polly.loop_header176.preheader.us.us

polly.loop_header176.us.us:                       ; preds = %polly.loop_header176.us.us.preheader, %polly.loop_header176.us.us
  %p_add31195202.us.us = phi i32 [ %p_add31195.us.us, %polly.loop_header176.us.us ], [ %p_add31195202.us.us.ph, %polly.loop_header176.us.us.preheader ]
  %polly.indvar180.us.us = phi i64 [ %polly.indvar_next181.us.us, %polly.loop_header176.us.us ], [ %polly.indvar180.us.us.ph, %polly.loop_header176.us.us.preheader ]
  %207 = add nuw nsw i64 %polly.indvar180.us.us, %170
  %scevgep190.us.us = getelementptr i32, i32* %0, i64 %207
  %_p_scalar_191.us.us = load i32, i32* %scevgep190.us.us, align 4, !alias.scope !8, !noalias !9
  %208 = mul i64 %207, %5
  %209 = add i64 %208, %179
  %scevgep192.us.us = getelementptr i32, i32* %1, i64 %209
  %_p_scalar_193.us.us = load i32, i32* %scevgep192.us.us, align 4, !alias.scope !7, !noalias !10
  %p_mul30194.us.us = mul nsw i32 %_p_scalar_193.us.us, %_p_scalar_191.us.us
  %p_add31195.us.us = add nsw i32 %p_mul30194.us.us, %p_add31195202.us.us
  %polly.indvar_next181.us.us = add nuw nsw i64 %polly.indvar180.us.us, 1
  %polly.loop_cond183.us.us = icmp sgt i64 %polly.indvar180.us.us, %polly.adjust_ub182.us
  br i1 %polly.loop_cond183.us.us, label %polly.loop_exit178.loopexit.us.us.loopexit, label %polly.loop_header176.us.us, !llvm.loop !16

polly.loop_exit160.loopexit:                      ; preds = %polly.loop_exit169.loopexit.us
  br label %polly.loop_exit160

polly.loop_exit160:                               ; preds = %polly.loop_exit160.loopexit, %polly.loop_header158.preheader, %polly.loop_header148
  %polly.indvar_next153 = add nuw nsw i64 %polly.indvar152, 1
  %exitcond299 = icmp eq i64 %polly.indvar152, %polly.fdiv_q.shr146
  br i1 %exitcond299, label %for.end41.loopexit, label %polly.loop_header148

polly.stmt.for.body1174.preheader.1:              ; preds = %polly.loop_exit68
  %210 = icmp sgt i64 %83, -32
  %smax.1 = select i1 %210, i64 %83, i64 -32
  %211 = mul i64 %smax.1, -4
  %212 = shl i64 %polly.indvar_next62, 7
  %scevgep.1 = getelementptr i8, i8* %call, i64 %212
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %211, i32 4, i1 false)
  br label %polly.loop_exit68.1

polly.loop_exit68.1:                              ; preds = %polly.stmt.for.body1174.preheader.1, %polly.loop_exit68
  %polly.indvar_next62.1 = add nsw i64 %polly.indvar61, 2
  %exitcond303.1 = icmp eq i64 %polly.indvar_next62, %polly.fdiv_q.shr55
  br i1 %exitcond303.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header57
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #2 {
entry:
  %call.i = tail call noalias i8* @malloc(i64 16777216) #4
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %entry, %polly.loop_exit7.i
  %polly.indvar.i = phi i64 [ 0, %entry ], [ %polly.indvar_next.i, %polly.loop_exit7.i ]
  %0 = shl nsw i64 %polly.indvar.i, 5
  %polly.loop_guard17.i36 = icmp slt i64 %0, 2048
  br i1 %polly.loop_guard17.i36, label %polly.loop_header14.preheader.us.i.preheader, label %polly.loop_exit7.i

polly.loop_header14.preheader.us.i.preheader:     ; preds = %polly.loop_header.i
  br label %polly.loop_header14.preheader.us.i

polly.loop_header14.preheader.us.i:               ; preds = %polly.loop_header14.preheader.us.i.preheader, %polly.loop_exit16.loopexit.us.i
  %polly.indvar9.us.i = phi i64 [ %polly.indvar_next10.us.i, %polly.loop_exit16.loopexit.us.i ], [ 0, %polly.loop_header14.preheader.us.i.preheader ]
  %1 = shl nsw i64 %polly.indvar9.us.i, 5
  %polly.loop_guard26.us.i39 = icmp slt i64 %1, 2048
  br i1 %polly.loop_guard26.us.i39, label %polly.stmt.for.body6.preheader.us.us.i.preheader, label %polly.loop_exit16.loopexit.us.i

polly.stmt.for.body6.preheader.us.us.i.preheader: ; preds = %polly.loop_header14.preheader.us.i
  br label %polly.stmt.for.body6.preheader.us.us.i

polly.loop_exit16.loopexit.us.i.loopexit:         ; preds = %polly.stmt.for.body6.preheader.us.us.i
  br label %polly.loop_exit16.loopexit.us.i

polly.loop_exit16.loopexit.us.i:                  ; preds = %polly.loop_exit16.loopexit.us.i.loopexit, %polly.loop_header14.preheader.us.i
  %polly.indvar_next10.us.i = add nuw nsw i64 %polly.indvar9.us.i, 1
  %exitcond52.i = icmp eq i64 %polly.indvar9.us.i, 63
  br i1 %exitcond52.i, label %polly.loop_exit7.i.loopexit, label %polly.loop_header14.preheader.us.i

polly.stmt.for.body6.preheader.us.us.i:           ; preds = %polly.stmt.for.body6.preheader.us.us.i.preheader, %polly.stmt.for.body6.preheader.us.us.i
  %polly.indvar18.us.us.i = phi i64 [ %polly.indvar_next19.us.us.i, %polly.stmt.for.body6.preheader.us.us.i ], [ 0, %polly.stmt.for.body6.preheader.us.us.i.preheader ]
  %2 = add nuw nsw i64 %polly.indvar18.us.us.i, %0
  %3 = shl i64 %2, 11
  %4 = add nuw nsw i64 %3, %1
  %tmp32.us.us.i = shl i64 %4, 2
  %scevgep.us.us.i = getelementptr i8, i8* %call.i, i64 %tmp32.us.us.i
  %5 = bitcast i8* %scevgep.us.us.i to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %5, align 4, !alias.scope !17, !noalias !3
  %tmp.us.us.i.4 = shl i64 %4, 2
  %tmp32.us.us.i.4 = or i64 %tmp.us.us.i.4, 16
  %scevgep.us.us.i.4 = getelementptr i8, i8* %call.i, i64 %tmp32.us.us.i.4
  %6 = bitcast i8* %scevgep.us.us.i.4 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %6, align 4, !alias.scope !17, !noalias !3
  %tmp.us.us.i.8 = shl i64 %4, 2
  %tmp32.us.us.i.8 = or i64 %tmp.us.us.i.8, 32
  %scevgep.us.us.i.8 = getelementptr i8, i8* %call.i, i64 %tmp32.us.us.i.8
  %7 = bitcast i8* %scevgep.us.us.i.8 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %7, align 4, !alias.scope !17, !noalias !3
  %tmp.us.us.i.12 = shl i64 %4, 2
  %tmp32.us.us.i.12 = or i64 %tmp.us.us.i.12, 48
  %scevgep.us.us.i.12 = getelementptr i8, i8* %call.i, i64 %tmp32.us.us.i.12
  %8 = bitcast i8* %scevgep.us.us.i.12 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %8, align 4, !alias.scope !17, !noalias !3
  %tmp.us.us.i.16 = shl i64 %4, 2
  %tmp32.us.us.i.16 = or i64 %tmp.us.us.i.16, 64
  %scevgep.us.us.i.16 = getelementptr i8, i8* %call.i, i64 %tmp32.us.us.i.16
  %9 = bitcast i8* %scevgep.us.us.i.16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %9, align 4, !alias.scope !17, !noalias !3
  %tmp.us.us.i.20 = shl i64 %4, 2
  %tmp32.us.us.i.20 = or i64 %tmp.us.us.i.20, 80
  %scevgep.us.us.i.20 = getelementptr i8, i8* %call.i, i64 %tmp32.us.us.i.20
  %10 = bitcast i8* %scevgep.us.us.i.20 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %10, align 4, !alias.scope !17, !noalias !3
  %tmp.us.us.i.24 = shl i64 %4, 2
  %tmp32.us.us.i.24 = or i64 %tmp.us.us.i.24, 96
  %scevgep.us.us.i.24 = getelementptr i8, i8* %call.i, i64 %tmp32.us.us.i.24
  %11 = bitcast i8* %scevgep.us.us.i.24 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %11, align 4, !alias.scope !17, !noalias !3
  %tmp.us.us.i.28 = shl i64 %4, 2
  %tmp32.us.us.i.28 = or i64 %tmp.us.us.i.28, 112
  %scevgep.us.us.i.28 = getelementptr i8, i8* %call.i, i64 %tmp32.us.us.i.28
  %12 = bitcast i8* %scevgep.us.us.i.28 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %12, align 4, !alias.scope !17, !noalias !3
  %polly.indvar_next19.us.us.i = add nuw nsw i64 %polly.indvar18.us.us.i, 1
  %exitcond35 = icmp eq i64 %polly.indvar_next19.us.us.i, 32
  br i1 %exitcond35, label %polly.loop_exit16.loopexit.us.i.loopexit, label %polly.stmt.for.body6.preheader.us.us.i

polly.loop_exit7.i.loopexit:                      ; preds = %polly.loop_exit16.loopexit.us.i
  br label %polly.loop_exit7.i

polly.loop_exit7.i:                               ; preds = %polly.loop_exit7.i.loopexit, %polly.loop_header.i
  %polly.indvar_next.i = add nuw nsw i64 %polly.indvar.i, 1
  %exitcond53.i = icmp eq i64 %polly.indvar.i, 63
  br i1 %exitcond53.i, label %init.exit, label %polly.loop_header.i

init.exit:                                        ; preds = %polly.loop_exit7.i
  %call11.i = tail call noalias i8* @malloc(i64 16) #4
  %13 = bitcast i8* %call11.i to i8**
  store i8* %call.i, i8** %13, align 8
  %width13.i = getelementptr inbounds i8, i8* %call11.i, i64 8
  %14 = bitcast i8* %width13.i to i32*
  store i32 2048, i32* %14, align 8
  %height14.i = getelementptr inbounds i8, i8* %call11.i, i64 12
  %15 = bitcast i8* %height14.i to i32*
  store i32 2048, i32* %15, align 4
  %call.i1 = tail call noalias i8* @malloc(i64 16777216) #4
  br label %polly.loop_header.i6

polly.loop_header.i6:                             ; preds = %init.exit, %polly.loop_exit7.i31
  %polly.indvar.i5 = phi i64 [ 0, %init.exit ], [ %polly.indvar_next.i29, %polly.loop_exit7.i31 ]
  %16 = shl nsw i64 %polly.indvar.i5, 5
  %polly.loop_guard17.i737 = icmp slt i64 %16, 2048
  br i1 %polly.loop_guard17.i737, label %polly.loop_header14.preheader.us.i12.preheader, label %polly.loop_exit7.i31

polly.loop_header14.preheader.us.i12.preheader:   ; preds = %polly.loop_header.i6
  br label %polly.loop_header14.preheader.us.i12

polly.loop_header14.preheader.us.i12:             ; preds = %polly.loop_header14.preheader.us.i12.preheader, %polly.loop_exit16.loopexit.us.i15
  %polly.indvar9.us.i9 = phi i64 [ %polly.indvar_next10.us.i13, %polly.loop_exit16.loopexit.us.i15 ], [ 0, %polly.loop_header14.preheader.us.i12.preheader ]
  %17 = shl nsw i64 %polly.indvar9.us.i9, 5
  %polly.loop_guard26.us.i1038 = icmp slt i64 %17, 2048
  br i1 %polly.loop_guard26.us.i1038, label %polly.stmt.for.body6.preheader.us.us.i17.preheader, label %polly.loop_exit16.loopexit.us.i15

polly.stmt.for.body6.preheader.us.us.i17.preheader: ; preds = %polly.loop_header14.preheader.us.i12
  br label %polly.stmt.for.body6.preheader.us.us.i17

polly.loop_exit16.loopexit.us.i15.loopexit:       ; preds = %polly.stmt.for.body6.preheader.us.us.i17
  br label %polly.loop_exit16.loopexit.us.i15

polly.loop_exit16.loopexit.us.i15:                ; preds = %polly.loop_exit16.loopexit.us.i15.loopexit, %polly.loop_header14.preheader.us.i12
  %polly.indvar_next10.us.i13 = add nuw nsw i64 %polly.indvar9.us.i9, 1
  %exitcond52.i14 = icmp eq i64 %polly.indvar9.us.i9, 63
  br i1 %exitcond52.i14, label %polly.loop_exit7.i31.loopexit, label %polly.loop_header14.preheader.us.i12

polly.stmt.for.body6.preheader.us.us.i17:         ; preds = %polly.stmt.for.body6.preheader.us.us.i17.preheader, %polly.stmt.for.body6.preheader.us.us.i17
  %polly.indvar18.us.us.i16 = phi i64 [ %polly.indvar_next19.us.us.i18, %polly.stmt.for.body6.preheader.us.us.i17 ], [ 0, %polly.stmt.for.body6.preheader.us.us.i17.preheader ]
  %18 = add nuw nsw i64 %polly.indvar18.us.us.i16, %16
  %19 = shl i64 %18, 11
  %20 = add nuw nsw i64 %19, %17
  %tmp32.us.us.i23 = shl i64 %20, 2
  %scevgep.us.us.i24 = getelementptr i8, i8* %call.i1, i64 %tmp32.us.us.i23
  %21 = bitcast i8* %scevgep.us.us.i24 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %21, align 4, !alias.scope !19, !noalias !3
  %tmp.us.us.i22.4 = shl i64 %20, 2
  %tmp32.us.us.i23.4 = or i64 %tmp.us.us.i22.4, 16
  %scevgep.us.us.i24.4 = getelementptr i8, i8* %call.i1, i64 %tmp32.us.us.i23.4
  %22 = bitcast i8* %scevgep.us.us.i24.4 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %22, align 4, !alias.scope !19, !noalias !3
  %tmp.us.us.i22.8 = shl i64 %20, 2
  %tmp32.us.us.i23.8 = or i64 %tmp.us.us.i22.8, 32
  %scevgep.us.us.i24.8 = getelementptr i8, i8* %call.i1, i64 %tmp32.us.us.i23.8
  %23 = bitcast i8* %scevgep.us.us.i24.8 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %23, align 4, !alias.scope !19, !noalias !3
  %tmp.us.us.i22.12 = shl i64 %20, 2
  %tmp32.us.us.i23.12 = or i64 %tmp.us.us.i22.12, 48
  %scevgep.us.us.i24.12 = getelementptr i8, i8* %call.i1, i64 %tmp32.us.us.i23.12
  %24 = bitcast i8* %scevgep.us.us.i24.12 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %24, align 4, !alias.scope !19, !noalias !3
  %tmp.us.us.i22.16 = shl i64 %20, 2
  %tmp32.us.us.i23.16 = or i64 %tmp.us.us.i22.16, 64
  %scevgep.us.us.i24.16 = getelementptr i8, i8* %call.i1, i64 %tmp32.us.us.i23.16
  %25 = bitcast i8* %scevgep.us.us.i24.16 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %25, align 4, !alias.scope !19, !noalias !3
  %tmp.us.us.i22.20 = shl i64 %20, 2
  %tmp32.us.us.i23.20 = or i64 %tmp.us.us.i22.20, 80
  %scevgep.us.us.i24.20 = getelementptr i8, i8* %call.i1, i64 %tmp32.us.us.i23.20
  %26 = bitcast i8* %scevgep.us.us.i24.20 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %26, align 4, !alias.scope !19, !noalias !3
  %tmp.us.us.i22.24 = shl i64 %20, 2
  %tmp32.us.us.i23.24 = or i64 %tmp.us.us.i22.24, 96
  %scevgep.us.us.i24.24 = getelementptr i8, i8* %call.i1, i64 %tmp32.us.us.i23.24
  %27 = bitcast i8* %scevgep.us.us.i24.24 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %27, align 4, !alias.scope !19, !noalias !3
  %tmp.us.us.i22.28 = shl i64 %20, 2
  %tmp32.us.us.i23.28 = or i64 %tmp.us.us.i22.28, 112
  %scevgep.us.us.i24.28 = getelementptr i8, i8* %call.i1, i64 %tmp32.us.us.i23.28
  %28 = bitcast i8* %scevgep.us.us.i24.28 to <4 x i32>*
  store <4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32>* %28, align 4, !alias.scope !19, !noalias !3
  %polly.indvar_next19.us.us.i18 = add nuw nsw i64 %polly.indvar18.us.us.i16, 1
  %exitcond33 = icmp eq i64 %polly.indvar_next19.us.us.i18, 32
  br i1 %exitcond33, label %polly.loop_exit16.loopexit.us.i15.loopexit, label %polly.stmt.for.body6.preheader.us.us.i17

polly.loop_exit7.i31.loopexit:                    ; preds = %polly.loop_exit16.loopexit.us.i15
  br label %polly.loop_exit7.i31

polly.loop_exit7.i31:                             ; preds = %polly.loop_exit7.i31.loopexit, %polly.loop_header.i6
  %polly.indvar_next.i29 = add nuw nsw i64 %polly.indvar.i5, 1
  %exitcond53.i30 = icmp eq i64 %polly.indvar.i5, 63
  br i1 %exitcond53.i30, label %init.exit32, label %polly.loop_header.i6

init.exit32:                                      ; preds = %polly.loop_exit7.i31
  %29 = bitcast i8* %call11.i to %struct.Matrix*
  %call11.i2 = tail call noalias i8* @malloc(i64 16) #4
  %30 = bitcast i8* %call11.i2 to %struct.Matrix*
  %31 = bitcast i8* %call11.i2 to i8**
  store i8* %call.i1, i8** %31, align 8
  %width13.i3 = getelementptr inbounds i8, i8* %call11.i2, i64 8
  %32 = bitcast i8* %width13.i3 to i32*
  store i32 2048, i32* %32, align 8
  %height14.i4 = getelementptr inbounds i8, i8* %call11.i2, i64 12
  %33 = bitcast i8* %height14.i4 to i32*
  store i32 2048, i32* %33, align 4
  %call2 = tail call %struct.Matrix* @matrix_multiply(%struct.Matrix* %29, %struct.Matrix* %30)
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0
  %34 = load i32*, i32** %data, align 8
  %arrayidx = getelementptr inbounds i32, i32* %34, i64 4194303
  %35 = load i32, i32* %arrayidx, align 4
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 2048, i32 2048, i32 2047, i32 2047, i32 %35) #4
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git c43284c4913e075fc10ac6dea2961788a660f09d) (http://llvm.org/git/llvm.git 7f53bedefce9ad990a1906fed303e104ff621783)"}
!1 = distinct !{!1, !2, !"polly.alias.scope.call"}
!2 = distinct !{!2, !"polly.alias.scope.domain"}
!3 = !{}
!4 = distinct !{!4, !5, !"polly.alias.scope.call"}
!5 = distinct !{!5, !"polly.alias.scope.domain"}
!6 = !{!7, !8}
!7 = distinct !{!7, !5, !"polly.alias.scope."}
!8 = distinct !{!8, !5, !"polly.alias.scope."}
!9 = !{!4, !7}
!10 = !{!4, !8}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = distinct !{!15, !12, !13}
!16 = distinct !{!16, !12, !13}
!17 = distinct !{!17, !18, !"polly.alias.scope.call"}
!18 = distinct !{!18, !"polly.alias.scope.domain"}
!19 = distinct !{!19, !20, !"polly.alias.scope.call"}
!20 = distinct !{!20, !"polly.alias.scope.domain"}
