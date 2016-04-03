; ModuleID = 'MatrixMult.c'
source_filename = "MatrixMult.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i64*, i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"N = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.3 = private unnamed_addr constant [59 x i8] c"A[%dX%d+%d] = %lld, B[%dX%d+%d] =%lld, C[%dX%d+%d] =%lld \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define noalias %struct.Matrix* @init(i32 %width, i32 %height) #0 !dbg !7 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %width, i64 0, metadata !19, metadata !57), !dbg !58
  tail call void @llvm.dbg.value(metadata i32 %height, i64 0, metadata !20, metadata !57), !dbg !59
  %mul = mul nsw i32 %height, %width, !dbg !60
  %conv = sext i32 %mul to i64, !dbg !61
  %mul1 = shl nsw i64 %conv, 3, !dbg !62
  %call = tail call noalias i8* @malloc(i64 %mul1) #5, !dbg !63
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !21, metadata !57), !dbg !65
  %cmp76 = icmp sgt i32 %height, 0, !dbg !66
  %cmp474 = icmp sgt i32 %width, 0, !dbg !70
  %or.cond = and i1 %cmp76, %cmp474, !dbg !75
  br i1 %or.cond, label %for.cond3.preheader.us.preheader, label %polly.start, !dbg !75

for.cond3.preheader.us.preheader:                 ; preds = %entry
  %0 = sext i32 %width to i64, !dbg !75
  %1 = shl nsw i64 %0, 3, !dbg !76
  %2 = add i32 %width, -1, !dbg !76
  %3 = zext i32 %2 to i64, !dbg !76
  %4 = shl nuw nsw i64 %3, 3, !dbg !76
  %5 = add nuw nsw i64 %4, 8, !dbg !76
  %6 = add i32 %height, -1, !dbg !76
  %xtraiter = and i32 %height, 7, !dbg !76
  %lcmp.mod = icmp eq i32 %xtraiter, 0, !dbg !76
  br i1 %lcmp.mod, label %for.cond3.preheader.us.preheader.split, label %for.cond3.preheader.us.prol.preheader, !dbg !76

for.cond3.preheader.us.prol.preheader:            ; preds = %for.cond3.preheader.us.preheader
  br label %for.cond3.preheader.us.prol, !dbg !76

for.cond3.preheader.us.prol:                      ; preds = %for.cond3.preheader.us.prol.preheader, %for.cond3.preheader.us.prol
  %indvars.iv90.us.prol = phi i64 [ %indvars.iv.next91.us.prol, %for.cond3.preheader.us.prol ], [ 0, %for.cond3.preheader.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond3.preheader.us.prol ], [ %xtraiter, %for.cond3.preheader.us.prol.preheader ]
  %7 = mul i64 %1, %indvars.iv90.us.prol, !dbg !76
  %scevgep.prol = getelementptr i8, i8* %call, i64 %7, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %5, i32 8, i1 false), !dbg !78
  %indvars.iv.next91.us.prol = add nuw nsw i64 %indvars.iv90.us.prol, 1, !dbg !75
  %prol.iter.sub = add i32 %prol.iter, -1, !dbg !75
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0, !dbg !75
  br i1 %prol.iter.cmp, label %for.cond3.preheader.us.preheader.split.loopexit, label %for.cond3.preheader.us.prol, !dbg !75, !llvm.loop !79

for.cond3.preheader.us.preheader.split.loopexit:  ; preds = %for.cond3.preheader.us.prol
  %indvars.iv.next91.us.prol.lcssa = phi i64 [ %indvars.iv.next91.us.prol, %for.cond3.preheader.us.prol ]
  br label %for.cond3.preheader.us.preheader.split, !dbg !76

for.cond3.preheader.us.preheader.split:           ; preds = %for.cond3.preheader.us.preheader.split.loopexit, %for.cond3.preheader.us.preheader
  %indvars.iv90.us.unr = phi i64 [ 0, %for.cond3.preheader.us.preheader ], [ %indvars.iv.next91.us.prol.lcssa, %for.cond3.preheader.us.preheader.split.loopexit ]
  %8 = icmp ult i32 %6, 7, !dbg !76
  br i1 %8, label %polly.start.loopexit, label %for.cond3.preheader.us.preheader.split.split, !dbg !76

for.cond3.preheader.us.preheader.split.split:     ; preds = %for.cond3.preheader.us.preheader.split
  br label %for.cond3.preheader.us, !dbg !76

for.cond3.preheader.us:                           ; preds = %for.cond3.preheader.us, %for.cond3.preheader.us.preheader.split.split
  %indvars.iv90.us = phi i64 [ %indvars.iv90.us.unr, %for.cond3.preheader.us.preheader.split.split ], [ %indvars.iv.next91.us.7, %for.cond3.preheader.us ]
  %9 = mul i64 %1, %indvars.iv90.us, !dbg !76
  %scevgep = getelementptr i8, i8* %call, i64 %9, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %5, i32 8, i1 false), !dbg !78
  %indvars.iv.next91.us = add nuw nsw i64 %indvars.iv90.us, 1, !dbg !75
  %10 = mul i64 %1, %indvars.iv.next91.us, !dbg !76
  %scevgep.1 = getelementptr i8, i8* %call, i64 %10, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %5, i32 8, i1 false), !dbg !78
  %indvars.iv.next91.us.1 = add nsw i64 %indvars.iv90.us, 2, !dbg !75
  %11 = mul i64 %1, %indvars.iv.next91.us.1, !dbg !76
  %scevgep.2 = getelementptr i8, i8* %call, i64 %11, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %5, i32 8, i1 false), !dbg !78
  %indvars.iv.next91.us.2 = add nsw i64 %indvars.iv90.us, 3, !dbg !75
  %12 = mul i64 %1, %indvars.iv.next91.us.2, !dbg !76
  %scevgep.3 = getelementptr i8, i8* %call, i64 %12, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %5, i32 8, i1 false), !dbg !78
  %indvars.iv.next91.us.3 = add nsw i64 %indvars.iv90.us, 4, !dbg !75
  %13 = mul i64 %1, %indvars.iv.next91.us.3, !dbg !76
  %scevgep.4 = getelementptr i8, i8* %call, i64 %13, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %5, i32 8, i1 false), !dbg !78
  %indvars.iv.next91.us.4 = add nsw i64 %indvars.iv90.us, 5, !dbg !75
  %14 = mul i64 %1, %indvars.iv.next91.us.4, !dbg !76
  %scevgep.5 = getelementptr i8, i8* %call, i64 %14, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %5, i32 8, i1 false), !dbg !78
  %indvars.iv.next91.us.5 = add nsw i64 %indvars.iv90.us, 6, !dbg !75
  %15 = mul i64 %1, %indvars.iv.next91.us.5, !dbg !76
  %scevgep.6 = getelementptr i8, i8* %call, i64 %15, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %5, i32 8, i1 false), !dbg !78
  %indvars.iv.next91.us.6 = add nsw i64 %indvars.iv90.us, 7, !dbg !75
  %16 = mul i64 %1, %indvars.iv.next91.us.6, !dbg !76
  %scevgep.7 = getelementptr i8, i8* %call, i64 %16, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %5, i32 8, i1 false), !dbg !78
  %indvars.iv.next91.us.7 = add nsw i64 %indvars.iv90.us, 8, !dbg !75
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next91.us.7 to i32, !dbg !75
  %exitcond150.7 = icmp eq i32 %lftr.wideiv.7, %height, !dbg !75
  br i1 %exitcond150.7, label %polly.start.loopexit.unr-lcssa, label %for.cond3.preheader.us, !dbg !75

polly.start.loopexit.unr-lcssa:                   ; preds = %for.cond3.preheader.us
  br label %polly.start.loopexit

polly.start.loopexit:                             ; preds = %for.cond3.preheader.us.preheader.split, %polly.start.loopexit.unr-lcssa
  br label %polly.start

polly.start:                                      ; preds = %polly.start.loopexit, %entry
  %17 = sext i32 %height to i64
  %18 = add nsw i64 %17, -1
  %polly.fdiv_q.shr = ashr i64 %18, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %polly.exiting

polly.exiting.loopexit:                           ; preds = %polly.loop_exit99
  br label %polly.exiting, !dbg !81

polly.exiting:                                    ; preds = %polly.exiting.loopexit, %polly.start
  %call35 = tail call noalias i8* @malloc(i64 16) #5, !dbg !81
  %19 = bitcast i8* %call35 to %struct.Matrix*, !dbg !82
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %19, i64 0, metadata !24, metadata !57), !dbg !83
  %20 = bitcast i8* %call35 to i8**, !dbg !84
  store i8* %call, i8** %20, align 8, !dbg !84, !tbaa !85
  %width37 = getelementptr inbounds i8, i8* %call35, i64 8, !dbg !91
  %21 = bitcast i8* %width37 to i32*, !dbg !91
  store i32 %width, i32* %21, align 8, !dbg !92, !tbaa !93
  %height38 = getelementptr inbounds i8, i8* %call35, i64 12, !dbg !94
  %22 = bitcast i8* %height38 to i32*, !dbg !94
  store i32 %height, i32* %22, align 4, !dbg !95, !tbaa !96
  ret %struct.Matrix* %19, !dbg !97

polly.loop_header:                                ; preds = %polly.loop_exit99, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit99 ]
  br i1 %polly.loop_guard100, label %polly.loop_header97.preheader, label %polly.loop_exit99

polly.loop_header97.preheader:                    ; preds = %polly.loop_header
  %23 = shl nsw i64 %polly.indvar, 5
  %24 = sub nsw i64 %17, %23
  %25 = add nsw i64 %24, -1
  %26 = icmp sgt i64 %25, 31
  %27 = select i1 %26, i64 31, i64 %25
  %polly.loop_guard109 = icmp sgt i64 %27, -1
  %polly.adjust_ub112 = add i64 %27, -1
  br i1 %polly.loop_guard109, label %polly.loop_header97.us.preheader, label %polly.loop_exit99

polly.loop_header97.us.preheader:                 ; preds = %polly.loop_header97.preheader
  br label %polly.loop_header97.us

polly.loop_header97.us:                           ; preds = %polly.loop_header97.us.preheader, %polly.loop_exit108.loopexit.us
  %polly.indvar101.us = phi i64 [ %polly.indvar_next102.us, %polly.loop_exit108.loopexit.us ], [ 0, %polly.loop_header97.us.preheader ]
  %28 = shl nsw i64 %polly.indvar101.us, 5
  %29 = sub nsw i64 %36, %28
  %30 = add nsw i64 %29, -1
  %31 = icmp sgt i64 %30, 31
  %32 = select i1 %31, i64 31, i64 %30
  %polly.loop_guard118.us = icmp sgt i64 %32, -1
  %polly.adjust_ub121.us = add i64 %32, -1
  br i1 %polly.loop_guard118.us, label %polly.loop_header106.us.us.preheader, label %polly.loop_exit108.loopexit.us

polly.loop_header106.us.us.preheader:             ; preds = %polly.loop_header97.us
  br label %polly.loop_header106.us.us

polly.loop_exit108.loopexit.us.loopexit:          ; preds = %polly.loop_exit117.loopexit.us.us
  br label %polly.loop_exit108.loopexit.us

polly.loop_exit108.loopexit.us:                   ; preds = %polly.loop_exit108.loopexit.us.loopexit, %polly.loop_header97.us
  %polly.indvar_next102.us = add nuw nsw i64 %polly.indvar101.us, 1
  %exitcond = icmp eq i64 %polly.indvar101.us, %polly.fdiv_q.shr95
  br i1 %exitcond, label %polly.loop_exit99.loopexit, label %polly.loop_header97.us

polly.loop_header106.us.us:                       ; preds = %polly.loop_header106.us.us.preheader, %polly.loop_exit117.loopexit.us.us
  %polly.indvar110.us.us = phi i64 [ %polly.indvar_next111.us.us, %polly.loop_exit117.loopexit.us.us ], [ 0, %polly.loop_header106.us.us.preheader ]
  %33 = add nuw nsw i64 %polly.indvar110.us.us, %23
  %34 = mul i64 %33, %36
  %35 = add nsw i64 %34, %28
  br label %polly.loop_header115.us.us

polly.loop_exit117.loopexit.us.us:                ; preds = %polly.loop_header115.us.us
  %polly.indvar_next111.us.us = add nuw nsw i64 %polly.indvar110.us.us, 1
  %polly.loop_cond113.us.us = icmp sgt i64 %polly.indvar110.us.us, %polly.adjust_ub112
  br i1 %polly.loop_cond113.us.us, label %polly.loop_exit108.loopexit.us.loopexit, label %polly.loop_header106.us.us

polly.loop_header115.us.us:                       ; preds = %polly.loop_header115.us.us, %polly.loop_header106.us.us
  %polly.indvar119.us.us = phi i64 [ %polly.indvar_next120.us.us, %polly.loop_header115.us.us ], [ 0, %polly.loop_header106.us.us ]
  %tmp.us.us = add nsw i64 %35, %polly.indvar119.us.us
  %tmp124.us.us = shl i64 %tmp.us.us, 3
  %scevgep.us.us = getelementptr i8, i8* %call, i64 %tmp124.us.us
  %scevgep123.us.us = bitcast i8* %scevgep.us.us to i64*
  %_p_scalar_.us.us = load i64, i64* %scevgep123.us.us, align 8, !alias.scope !98, !noalias !2
  %p_add24.us.us = add nsw i64 %_p_scalar_.us.us, %33, !dbg !100
  store i64 %p_add24.us.us, i64* %scevgep123.us.us, align 8, !alias.scope !98, !noalias !2
  %polly.indvar_next120.us.us = add nuw nsw i64 %polly.indvar119.us.us, 1
  %polly.loop_cond122.us.us = icmp sgt i64 %polly.indvar119.us.us, %polly.adjust_ub121.us
  br i1 %polly.loop_cond122.us.us, label %polly.loop_exit117.loopexit.us.us, label %polly.loop_header115.us.us

polly.loop_exit99.loopexit:                       ; preds = %polly.loop_exit108.loopexit.us
  br label %polly.loop_exit99

polly.loop_exit99:                                ; preds = %polly.loop_exit99.loopexit, %polly.loop_header97.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond148 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond148, label %polly.exiting.loopexit, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.start
  %36 = sext i32 %width to i64
  %37 = add nsw i64 %36, -1
  %polly.fdiv_q.shr95 = ashr i64 %37, 5
  %polly.loop_guard100 = icmp sgt i64 %polly.fdiv_q.shr95, -1
  br label %polly.loop_header
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define noalias %struct.Matrix* @matmult(%struct.Matrix* nocapture readonly %a, %struct.Matrix* nocapture readonly %b) #0 !dbg !25 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !29, metadata !57), !dbg !107
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !30, metadata !57), !dbg !108
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !109
  %0 = load i32, i32* %width1, align 8, !dbg !109, !tbaa !93
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !34, metadata !57), !dbg !110
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !111
  %1 = load i32, i32* %height2, align 4, !dbg !111, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !35, metadata !57), !dbg !112
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !113
  %2 = load i64*, i64** %data, align 8, !dbg !113, !tbaa !85
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !36, metadata !57), !dbg !114
  %data3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !115
  %3 = load i64*, i64** %data3, align 8, !dbg !115, !tbaa !85
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !37, metadata !57), !dbg !116
  %mul = mul nsw i32 %1, %0, !dbg !117
  %conv = sext i32 %mul to i64, !dbg !118
  %mul5 = shl nsw i64 %conv, 3, !dbg !119
  %call = tail call noalias i8* @malloc(i64 %mul5) #5, !dbg !120
  %4 = bitcast i8* %call to i64*, !dbg !122
  tail call void @llvm.dbg.value(metadata i64* %4, i64 0, metadata !38, metadata !57), !dbg !123
  %call9 = tail call noalias i8* @malloc(i64 %mul5) #5, !dbg !124
  %5 = bitcast i8* %call9 to i64*, !dbg !125
  tail call void @llvm.dbg.value(metadata i64* %5, i64 0, metadata !39, metadata !57), !dbg !126
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !57), !dbg !127
  %cmp134 = icmp sgt i32 %1, 0, !dbg !128
  %6 = sext i32 %0 to i64, !dbg !132
  %7 = sext i32 %1 to i64, !dbg !132
  br i1 %cmp134, label %for.cond11.preheader.lr.ph, label %polly.split_new_and_old, !dbg !132

for.cond11.preheader.lr.ph:                       ; preds = %entry
  %8 = icmp eq i32 %1, %0
  br i1 %8, label %polly.start259, label %for.cond11.preheader.preheader

for.cond11.preheader.preheader:                   ; preds = %for.cond11.preheader.lr.ph
  %cmp12132 = icmp sgt i32 %0, 0, !dbg !133
  br i1 %cmp12132, label %for.cond11.preheader.us.preheader, label %polly.split_new_and_old, !dbg !138

for.cond11.preheader.us.preheader:                ; preds = %for.cond11.preheader.preheader
  %9 = add i32 %0, -1, !dbg !139
  %xtraiter434 = and i32 %0, 3, !dbg !141
  %lcmp.mod435 = icmp eq i32 %xtraiter434, 0, !dbg !141
  %10 = icmp ult i32 %9, 3, !dbg !141
  br label %for.cond11.preheader.us, !dbg !139

for.cond11.preheader.us:                          ; preds = %for.cond11.preheader.us.preheader, %for.inc20.loopexit.us
  %indvars.iv155.us = phi i64 [ %indvars.iv.next156.us, %for.inc20.loopexit.us ], [ 0, %for.cond11.preheader.us.preheader ]
  %11 = mul nsw i64 %indvars.iv155.us, %7, !dbg !139
  br i1 %lcmp.mod435, label %for.cond11.preheader.us.split, label %for.body14.us.prol.preheader, !dbg !141

for.body14.us.prol.preheader:                     ; preds = %for.cond11.preheader.us
  br label %for.body14.us.prol, !dbg !141

for.body14.us.prol:                               ; preds = %for.body14.us.prol, %for.body14.us.prol.preheader
  %indvars.iv148.us.prol = phi i64 [ %indvars.iv.next149.us.prol, %for.body14.us.prol ], [ 0, %for.body14.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body14.us.prol ], [ %xtraiter434, %for.body14.us.prol.preheader ]
  %12 = mul nsw i64 %indvars.iv148.us.prol, %6, !dbg !141
  %13 = add nsw i64 %12, %indvars.iv155.us, !dbg !142
  %arrayidx.us.prol = getelementptr inbounds i64, i64* %3, i64 %13, !dbg !143
  %14 = load i64, i64* %arrayidx.us.prol, align 8, !dbg !143, !tbaa !144
  %15 = add nsw i64 %indvars.iv148.us.prol, %11, !dbg !146
  %arrayidx19.us.prol = getelementptr inbounds i64, i64* %5, i64 %15, !dbg !147
  store i64 %14, i64* %arrayidx19.us.prol, align 8, !dbg !148, !tbaa !144
  %indvars.iv.next149.us.prol = add nuw nsw i64 %indvars.iv148.us.prol, 1, !dbg !138
  %prol.iter.sub = add i32 %prol.iter, -1, !dbg !138
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0, !dbg !138
  br i1 %prol.iter.cmp, label %for.cond11.preheader.us.split.loopexit, label %for.body14.us.prol, !dbg !138, !llvm.loop !149

for.cond11.preheader.us.split.loopexit:           ; preds = %for.body14.us.prol
  %indvars.iv.next149.us.prol.lcssa = phi i64 [ %indvars.iv.next149.us.prol, %for.body14.us.prol ]
  br label %for.cond11.preheader.us.split, !dbg !141

for.cond11.preheader.us.split:                    ; preds = %for.cond11.preheader.us, %for.cond11.preheader.us.split.loopexit
  %indvars.iv148.us.unr = phi i64 [ 0, %for.cond11.preheader.us ], [ %indvars.iv.next149.us.prol.lcssa, %for.cond11.preheader.us.split.loopexit ]
  br i1 %10, label %for.inc20.loopexit.us, label %for.cond11.preheader.us.split.split, !dbg !141

for.cond11.preheader.us.split.split:              ; preds = %for.cond11.preheader.us.split
  br label %for.body14.us, !dbg !141

for.body14.us:                                    ; preds = %for.body14.us, %for.cond11.preheader.us.split.split
  %indvars.iv148.us = phi i64 [ %indvars.iv148.us.unr, %for.cond11.preheader.us.split.split ], [ %indvars.iv.next149.us.3, %for.body14.us ]
  %16 = mul nsw i64 %indvars.iv148.us, %6, !dbg !141
  %17 = add nsw i64 %16, %indvars.iv155.us, !dbg !142
  %arrayidx.us = getelementptr inbounds i64, i64* %3, i64 %17, !dbg !143
  %18 = load i64, i64* %arrayidx.us, align 8, !dbg !143, !tbaa !144
  %19 = add nsw i64 %indvars.iv148.us, %11, !dbg !146
  %arrayidx19.us = getelementptr inbounds i64, i64* %5, i64 %19, !dbg !147
  store i64 %18, i64* %arrayidx19.us, align 8, !dbg !148, !tbaa !144
  %indvars.iv.next149.us = add nuw nsw i64 %indvars.iv148.us, 1, !dbg !138
  %20 = mul nsw i64 %indvars.iv.next149.us, %6, !dbg !141
  %21 = add nsw i64 %20, %indvars.iv155.us, !dbg !142
  %arrayidx.us.1 = getelementptr inbounds i64, i64* %3, i64 %21, !dbg !143
  %22 = load i64, i64* %arrayidx.us.1, align 8, !dbg !143, !tbaa !144
  %23 = add nsw i64 %indvars.iv.next149.us, %11, !dbg !146
  %arrayidx19.us.1 = getelementptr inbounds i64, i64* %5, i64 %23, !dbg !147
  store i64 %22, i64* %arrayidx19.us.1, align 8, !dbg !148, !tbaa !144
  %indvars.iv.next149.us.1 = add nsw i64 %indvars.iv148.us, 2, !dbg !138
  %24 = mul nsw i64 %indvars.iv.next149.us.1, %6, !dbg !141
  %25 = add nsw i64 %24, %indvars.iv155.us, !dbg !142
  %arrayidx.us.2 = getelementptr inbounds i64, i64* %3, i64 %25, !dbg !143
  %26 = load i64, i64* %arrayidx.us.2, align 8, !dbg !143, !tbaa !144
  %27 = add nsw i64 %indvars.iv.next149.us.1, %11, !dbg !146
  %arrayidx19.us.2 = getelementptr inbounds i64, i64* %5, i64 %27, !dbg !147
  store i64 %26, i64* %arrayidx19.us.2, align 8, !dbg !148, !tbaa !144
  %indvars.iv.next149.us.2 = add nsw i64 %indvars.iv148.us, 3, !dbg !138
  %28 = mul nsw i64 %indvars.iv.next149.us.2, %6, !dbg !141
  %29 = add nsw i64 %28, %indvars.iv155.us, !dbg !142
  %arrayidx.us.3 = getelementptr inbounds i64, i64* %3, i64 %29, !dbg !143
  %30 = load i64, i64* %arrayidx.us.3, align 8, !dbg !143, !tbaa !144
  %31 = add nsw i64 %indvars.iv.next149.us.2, %11, !dbg !146
  %arrayidx19.us.3 = getelementptr inbounds i64, i64* %5, i64 %31, !dbg !147
  store i64 %30, i64* %arrayidx19.us.3, align 8, !dbg !148, !tbaa !144
  %indvars.iv.next149.us.3 = add nsw i64 %indvars.iv148.us, 4, !dbg !138
  %lftr.wideiv420.3 = trunc i64 %indvars.iv.next149.us.3 to i32, !dbg !138
  %exitcond421.3 = icmp eq i32 %lftr.wideiv420.3, %0, !dbg !138
  br i1 %exitcond421.3, label %for.inc20.loopexit.us.unr-lcssa, label %for.body14.us, !dbg !138

for.inc20.loopexit.us.unr-lcssa:                  ; preds = %for.body14.us
  br label %for.inc20.loopexit.us, !dbg !132

for.inc20.loopexit.us:                            ; preds = %for.cond11.preheader.us.split, %for.inc20.loopexit.us.unr-lcssa
  %indvars.iv.next156.us = add nuw nsw i64 %indvars.iv155.us, 1, !dbg !132
  %lftr.wideiv422 = trunc i64 %indvars.iv.next156.us to i32, !dbg !132
  %exitcond423 = icmp eq i32 %lftr.wideiv422, %1, !dbg !132
  br i1 %exitcond423, label %polly.split_new_and_old.loopexit433, label %for.cond11.preheader.us, !dbg !132

polly.split_new_and_old.loopexit:                 ; preds = %polly.loop_exit275
  br label %polly.split_new_and_old

polly.split_new_and_old.loopexit433:              ; preds = %for.inc20.loopexit.us
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %polly.split_new_and_old.loopexit433, %polly.split_new_and_old.loopexit, %entry, %for.cond11.preheader.preheader, %polly.start259
  %32 = icmp sge i32 %0, %1
  %33 = add nsw i64 %6, -1
  %polly.access.mul. = mul i64 %33, %6
  %polly.access.add. = mul nsw i64 %6, %6
  %polly.access. = getelementptr i64, i64* %2, i64 %polly.access.add.
  %34 = icmp ule i64* %polly.access., %4
  %polly.access.add.call162 = add i64 %polly.access.mul., %7
  %polly.access.call163 = getelementptr i64, i64* %4, i64 %polly.access.add.call162
  %35 = icmp ule i64* %polly.access.call163, %2
  %36 = or i1 %34, %35
  %37 = and i1 %32, %36
  br i1 %37, label %polly.start, label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %polly.split_new_and_old
  %cmp28127 = icmp sgt i32 %0, 0, !dbg !150
  %or.cond = and i1 %cmp134, %cmp28127, !dbg !157
  br i1 %or.cond, label %for.cond27.preheader.us.preheader, label %for.end65, !dbg !157

for.cond27.preheader.us.preheader:                ; preds = %for.cond23.preheader
  %xtraiter = and i32 %0, 1, !dbg !159
  %lcmp.mod = icmp eq i32 %xtraiter, 0, !dbg !159
  %38 = icmp eq i32 %0, 1, !dbg !159
  br label %for.cond27.preheader.us, !dbg !164

for.cond27.preheader.us:                          ; preds = %for.cond27.preheader.us.preheader, %for.inc63.loopexit.us-lcssa.us.us
  %indvars.iv144.us = phi i64 [ %indvars.iv.next145.us, %for.inc63.loopexit.us-lcssa.us.us ], [ 0, %for.cond27.preheader.us.preheader ]
  br label %for.body30.us.us, !dbg !164

for.body30.us.us:                                 ; preds = %for.cond27.preheader.us, %for.inc60.loopexit.us.us
  %indvars.iv138.us.us = phi i64 [ %indvars.iv.next139.us.us, %for.inc60.loopexit.us.us ], [ 0, %for.cond27.preheader.us ]
  %39 = mul nsw i64 %indvars.iv138.us.us, %6, !dbg !164
  %40 = add nsw i64 %39, %indvars.iv144.us, !dbg !165
  %arrayidx34.us.us = getelementptr inbounds i64, i64* %4, i64 %40, !dbg !166
  store i64 0, i64* %arrayidx34.us.us, align 8, !dbg !167, !tbaa !144
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !57), !dbg !168
  br i1 %lcmp.mod, label %for.body30.us.us.split, label %for.body38.us.us.prol, !dbg !159

for.body38.us.us.prol:                            ; preds = %for.body30.us.us
  %arrayidx46.us.us.prol = getelementptr inbounds i64, i64* %2, i64 %39, !dbg !169
  %41 = load i64, i64* %arrayidx46.us.us.prol, align 8, !dbg !169, !tbaa !144
  %arrayidx50.us.us.prol = getelementptr inbounds i64, i64* %5, i64 %39, !dbg !170
  %42 = load i64, i64* %arrayidx50.us.us.prol, align 8, !dbg !170, !tbaa !144
  %mul51.us.us.prol = mul nsw i64 %42, %41, !dbg !171
  store i64 %mul51.us.us.prol, i64* %arrayidx34.us.us, align 8, !dbg !172, !tbaa !144
  br label %for.body30.us.us.split, !dbg !173

for.body30.us.us.split:                           ; preds = %for.body30.us.us, %for.body38.us.us.prol
  %.unr = phi i64 [ 0, %for.body30.us.us ], [ %mul51.us.us.prol, %for.body38.us.us.prol ]
  %indvars.iv.us.us.unr = phi i64 [ 0, %for.body30.us.us ], [ 1, %for.body38.us.us.prol ]
  br i1 %38, label %for.inc60.loopexit.us.us, label %for.body30.us.us.split.split, !dbg !159

for.body30.us.us.split.split:                     ; preds = %for.body30.us.us.split
  br label %for.body38.us.us, !dbg !159

for.inc60.loopexit.us.us.unr-lcssa:               ; preds = %for.body38.us.us
  br label %for.inc60.loopexit.us.us, !dbg !175

for.inc60.loopexit.us.us:                         ; preds = %for.body30.us.us.split, %for.inc60.loopexit.us.us.unr-lcssa
  %indvars.iv.next139.us.us = add nuw nsw i64 %indvars.iv138.us.us, 1, !dbg !175
  %lftr.wideiv411 = trunc i64 %indvars.iv.next139.us.us to i32, !dbg !175
  %exitcond412 = icmp eq i32 %lftr.wideiv411, %0, !dbg !175
  br i1 %exitcond412, label %for.inc63.loopexit.us-lcssa.us.us, label %for.body30.us.us, !dbg !175

for.body38.us.us:                                 ; preds = %for.body38.us.us, %for.body30.us.us.split.split
  %43 = phi i64 [ %.unr, %for.body30.us.us.split.split ], [ %add52.us.us.1, %for.body38.us.us ], !dbg !159
  %indvars.iv.us.us = phi i64 [ %indvars.iv.us.us.unr, %for.body30.us.us.split.split ], [ %indvars.iv.next.us.us.1, %for.body38.us.us ]
  %44 = add nsw i64 %indvars.iv.us.us, %39, !dbg !176
  %arrayidx46.us.us = getelementptr inbounds i64, i64* %2, i64 %44, !dbg !169
  %45 = load i64, i64* %arrayidx46.us.us, align 8, !dbg !169, !tbaa !144
  %arrayidx50.us.us = getelementptr inbounds i64, i64* %5, i64 %44, !dbg !170
  %46 = load i64, i64* %arrayidx50.us.us, align 8, !dbg !170, !tbaa !144
  %mul51.us.us = mul nsw i64 %46, %45, !dbg !171
  %add52.us.us = add nsw i64 %mul51.us.us, %43, !dbg !177
  store i64 %add52.us.us, i64* %arrayidx34.us.us, align 8, !dbg !172, !tbaa !144
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1, !dbg !173
  %47 = add nsw i64 %indvars.iv.next.us.us, %39, !dbg !176
  %arrayidx46.us.us.1 = getelementptr inbounds i64, i64* %2, i64 %47, !dbg !169
  %48 = load i64, i64* %arrayidx46.us.us.1, align 8, !dbg !169, !tbaa !144
  %arrayidx50.us.us.1 = getelementptr inbounds i64, i64* %5, i64 %47, !dbg !170
  %49 = load i64, i64* %arrayidx50.us.us.1, align 8, !dbg !170, !tbaa !144
  %mul51.us.us.1 = mul nsw i64 %49, %48, !dbg !171
  %add52.us.us.1 = add nsw i64 %mul51.us.us.1, %add52.us.us, !dbg !177
  store i64 %add52.us.us.1, i64* %arrayidx34.us.us, align 8, !dbg !172, !tbaa !144
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv.us.us, 2, !dbg !173
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.us.us.1 to i32, !dbg !173
  %exitcond410.1 = icmp eq i32 %lftr.wideiv.1, %0, !dbg !173
  br i1 %exitcond410.1, label %for.inc60.loopexit.us.us.unr-lcssa, label %for.body38.us.us, !dbg !173

for.inc63.loopexit.us-lcssa.us.us:                ; preds = %for.inc60.loopexit.us.us
  %indvars.iv.next145.us = add nuw nsw i64 %indvars.iv144.us, 1, !dbg !157
  %lftr.wideiv413 = trunc i64 %indvars.iv.next145.us to i32, !dbg !157
  %exitcond414 = icmp eq i32 %lftr.wideiv413, %1, !dbg !157
  br i1 %exitcond414, label %for.end65.loopexit432, label %for.cond27.preheader.us, !dbg !157

for.end65.loopexit:                               ; preds = %polly.loop_exit210
  br label %for.end65, !dbg !178

for.end65.loopexit432:                            ; preds = %for.inc63.loopexit.us-lcssa.us.us
  br label %for.end65, !dbg !178

for.end65:                                        ; preds = %for.end65.loopexit432, %for.end65.loopexit, %polly.start, %for.cond23.preheader
  %call66 = tail call noalias i8* @malloc(i64 16) #5, !dbg !178
  %50 = bitcast i8* %call66 to %struct.Matrix*, !dbg !179
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %50, i64 0, metadata !40, metadata !57), !dbg !180
  %width67 = getelementptr inbounds i8, i8* %call66, i64 8, !dbg !181
  %51 = bitcast i8* %width67 to i32*, !dbg !181
  store i32 %0, i32* %51, align 8, !dbg !182, !tbaa !93
  %height68 = getelementptr inbounds i8, i8* %call66, i64 12, !dbg !183
  %52 = bitcast i8* %height68 to i32*, !dbg !183
  store i32 %1, i32* %52, align 4, !dbg !184, !tbaa !96
  %53 = bitcast i8* %call66 to i8**, !dbg !185
  store i8* %call, i8** %53, align 8, !dbg !185, !tbaa !85
  ret %struct.Matrix* %50, !dbg !186

polly.start:                                      ; preds = %polly.split_new_and_old
  %54 = add nsw i64 %7, -1
  %polly.fdiv_q.shr = ashr i64 %54, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %for.end65

polly.loop_header:                                ; preds = %polly.loop_exit171, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit171 ]
  br i1 %polly.loop_guard172, label %polly.loop_header169.preheader, label %polly.loop_exit171

polly.loop_header169.preheader:                   ; preds = %polly.loop_header
  %55 = shl nsw i64 %polly.indvar, 5
  %56 = sub nsw i64 %7, %55
  %57 = add nsw i64 %56, -1
  %58 = icmp sgt i64 %57, 31
  %59 = select i1 %58, i64 31, i64 %57
  %polly.loop_guard181 = icmp sgt i64 %59, -1
  %polly.adjust_ub184 = add i64 %59, -1
  br i1 %polly.loop_guard181, label %polly.loop_header169.us.preheader, label %polly.loop_exit171

polly.loop_header169.us.preheader:                ; preds = %polly.loop_header169.preheader
  br label %polly.loop_header169.us

polly.loop_header169.us:                          ; preds = %polly.loop_header169.us.preheader, %polly.loop_exit180.loopexit.us
  %polly.indvar173.us = phi i64 [ %polly.indvar_next174.us, %polly.loop_exit180.loopexit.us ], [ 0, %polly.loop_header169.us.preheader ]
  %60 = shl nsw i64 %polly.indvar173.us, 5
  %61 = sub nsw i64 %6, %60
  %62 = add nsw i64 %61, -1
  %63 = icmp sgt i64 %62, 31
  %64 = select i1 %63, i64 31, i64 %62
  %polly.loop_guard190.us = icmp sgt i64 %64, -1
  %polly.adjust_ub193.us = add i64 %64, -1
  br i1 %polly.loop_guard190.us, label %polly.loop_header178.us.us.preheader, label %polly.loop_exit180.loopexit.us

polly.loop_header178.us.us.preheader:             ; preds = %polly.loop_header169.us
  br label %polly.loop_header178.us.us

polly.loop_exit180.loopexit.us.loopexit:          ; preds = %polly.loop_exit189.loopexit.us.us
  br label %polly.loop_exit180.loopexit.us

polly.loop_exit180.loopexit.us:                   ; preds = %polly.loop_exit180.loopexit.us.loopexit, %polly.loop_header169.us
  %polly.indvar_next174.us = add nuw nsw i64 %polly.indvar173.us, 1
  %exitcond408 = icmp eq i64 %polly.indvar_next174.us, %68
  br i1 %exitcond408, label %polly.loop_exit171.loopexit, label %polly.loop_header169.us

polly.loop_header178.us.us:                       ; preds = %polly.loop_header178.us.us.preheader, %polly.loop_exit189.loopexit.us.us
  %polly.indvar182.us.us = phi i64 [ %polly.indvar_next183.us.us, %polly.loop_exit189.loopexit.us.us ], [ 0, %polly.loop_header178.us.us.preheader ]
  %65 = add nuw nsw i64 %polly.indvar182.us.us, %55
  br label %polly.loop_header187.us.us

polly.loop_exit189.loopexit.us.us:                ; preds = %polly.loop_header187.us.us
  %polly.indvar_next183.us.us = add nuw nsw i64 %polly.indvar182.us.us, 1
  %polly.loop_cond185.us.us = icmp sgt i64 %polly.indvar182.us.us, %polly.adjust_ub184
  br i1 %polly.loop_cond185.us.us, label %polly.loop_exit180.loopexit.us.loopexit, label %polly.loop_header178.us.us

polly.loop_header187.us.us:                       ; preds = %polly.loop_header187.us.us, %polly.loop_header178.us.us
  %polly.indvar191.us.us = phi i64 [ %polly.indvar_next192.us.us, %polly.loop_header187.us.us ], [ 0, %polly.loop_header178.us.us ]
  %66 = add nuw nsw i64 %polly.indvar191.us.us, %60
  %67 = mul i64 %66, %6
  %tmp304.us.us = add nsw i64 %65, %67
  %tmp305.us.us = shl i64 %tmp304.us.us, 3
  %scevgep.us.us = getelementptr i8, i8* %call, i64 %tmp305.us.us
  %scevgep195.us.us = bitcast i8* %scevgep.us.us to i64*
  store i64 0, i64* %scevgep195.us.us, align 8, !alias.scope !187, !noalias !189
  %polly.indvar_next192.us.us = add nuw nsw i64 %polly.indvar191.us.us, 1
  %polly.loop_cond194.us.us = icmp sgt i64 %polly.indvar191.us.us, %polly.adjust_ub193.us
  br i1 %polly.loop_cond194.us.us, label %polly.loop_exit189.loopexit.us.us, label %polly.loop_header187.us.us

polly.loop_exit171.loopexit:                      ; preds = %polly.loop_exit180.loopexit.us
  br label %polly.loop_exit171

polly.loop_exit171:                               ; preds = %polly.loop_exit171.loopexit, %polly.loop_header169.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond409 = icmp eq i64 %polly.indvar_next, %69
  br i1 %exitcond409, label %polly.loop_preheader199, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.start
  %polly.fdiv_q.shr167 = ashr i64 %33, 5
  %polly.loop_guard172 = icmp sgt i64 %polly.fdiv_q.shr167, -1
  %68 = add nsw i64 %polly.fdiv_q.shr167, 1
  %69 = add nsw i64 %polly.fdiv_q.shr, 1
  br label %polly.loop_header

polly.loop_header198:                             ; preds = %polly.loop_exit210, %polly.loop_preheader199
  %polly.indvar202 = phi i64 [ 0, %polly.loop_preheader199 ], [ %polly.indvar_next203, %polly.loop_exit210 ]
  br i1 %polly.loop_guard172, label %polly.loop_header208.preheader, label %polly.loop_exit210

polly.loop_header208.preheader:                   ; preds = %polly.loop_header198
  %70 = shl nsw i64 %polly.indvar202, 5
  %71 = sub nsw i64 %7, %70
  %72 = add nsw i64 %71, -1
  %73 = icmp sgt i64 %72, 31
  %74 = select i1 %73, i64 31, i64 %72
  %polly.loop_guard227 = icmp sgt i64 %74, -1
  %polly.adjust_ub230 = add i64 %74, -1
  br label %polly.loop_header208

polly.loop_exit210.loopexit:                      ; preds = %polly.loop_exit218
  br label %polly.loop_exit210

polly.loop_exit210:                               ; preds = %polly.loop_exit210.loopexit, %polly.loop_header198
  %polly.indvar_next203 = add nuw nsw i64 %polly.indvar202, 1
  %exitcond406 = icmp eq i64 %polly.indvar_next203, %69
  br i1 %exitcond406, label %for.end65.loopexit, label %polly.loop_header198

polly.loop_preheader199:                          ; preds = %polly.loop_exit171
  %75 = shl nsw i64 %6, 3
  %pexp.p_div_q = lshr i64 %33, 5
  br label %polly.loop_header198

polly.loop_header208:                             ; preds = %polly.loop_exit218, %polly.loop_header208.preheader
  %polly.indvar212 = phi i64 [ %polly.indvar_next213, %polly.loop_exit218 ], [ 0, %polly.loop_header208.preheader ]
  %76 = shl nsw i64 %polly.indvar212, 5
  %77 = sub nsw i64 %6, %76
  %78 = add nsw i64 %77, -1
  %79 = icmp sgt i64 %78, 31
  %80 = select i1 %79, i64 31, i64 %78
  %polly.loop_guard236 = icmp sgt i64 %80, -1
  %polly.adjust_ub239 = add i64 %80, -1
  br label %polly.loop_header216

polly.loop_exit218:                               ; preds = %polly.loop_exit226
  %polly.indvar_next213 = add nuw nsw i64 %polly.indvar212, 1
  %exitcond405 = icmp eq i64 %polly.indvar_next213, %68
  br i1 %exitcond405, label %polly.loop_exit210.loopexit, label %polly.loop_header208

polly.loop_header216:                             ; preds = %polly.loop_exit226, %polly.loop_header208
  %polly.indvar219 = phi i64 [ 0, %polly.loop_header208 ], [ %polly.indvar_next220, %polly.loop_exit226 ]
  br i1 %polly.loop_guard227, label %polly.loop_header224.preheader, label %polly.loop_exit226

polly.loop_header224.preheader:                   ; preds = %polly.loop_header216
  %81 = shl nsw i64 %polly.indvar219, 5
  %82 = sub nsw i64 %6, %81
  %83 = add nsw i64 %82, -1
  %84 = icmp sgt i64 %83, 31
  %85 = select i1 %84, i64 31, i64 %83
  %polly.loop_guard245 = icmp sgt i64 %85, -1
  %polly.adjust_ub248 = add i64 %85, -1
  br i1 %polly.loop_guard236, label %polly.loop_header224.us.preheader, label %polly.loop_exit226

polly.loop_header224.us.preheader:                ; preds = %polly.loop_header224.preheader
  br label %polly.loop_header224.us

polly.loop_header224.us:                          ; preds = %polly.loop_header224.us.preheader, %polly.loop_exit235.loopexit.us
  %polly.indvar228.us = phi i64 [ %polly.indvar_next229.us, %polly.loop_exit235.loopexit.us ], [ 0, %polly.loop_header224.us.preheader ]
  %86 = add nuw nsw i64 %polly.indvar228.us, %70
  %87 = shl i64 %86, 3
  br i1 %polly.loop_guard245, label %polly.loop_header233.us.us.preheader, label %polly.loop_exit235.loopexit.us

polly.loop_header233.us.us.preheader:             ; preds = %polly.loop_header224.us
  br label %polly.loop_header233.us.us

polly.loop_exit235.loopexit.us.loopexit:          ; preds = %polly.loop_exit244.loopexit.us.us
  br label %polly.loop_exit235.loopexit.us

polly.loop_exit235.loopexit.us:                   ; preds = %polly.loop_exit235.loopexit.us.loopexit, %polly.loop_header224.us
  %polly.indvar_next229.us = add nuw nsw i64 %polly.indvar228.us, 1
  %polly.loop_cond231.us = icmp sgt i64 %polly.indvar228.us, %polly.adjust_ub230
  br i1 %polly.loop_cond231.us, label %polly.loop_exit226.loopexit, label %polly.loop_header224.us

polly.loop_header233.us.us:                       ; preds = %polly.loop_header233.us.us.preheader, %polly.loop_exit244.loopexit.us.us
  %polly.indvar237.us.us = phi i64 [ %polly.indvar_next238.us.us, %polly.loop_exit244.loopexit.us.us ], [ 0, %polly.loop_header233.us.us.preheader ]
  %88 = add nuw nsw i64 %polly.indvar237.us.us, %76
  %89 = mul i64 %88, %75
  %90 = add i64 %89, %87
  %scevgep250.us.us = getelementptr i8, i8* %call, i64 %90
  %scevgep250251.us.us = bitcast i8* %scevgep250.us.us to i64*
  %91 = mul i64 %88, %6
  %scevgep250251.promoted.us.us = load i64, i64* %scevgep250251.us.us, align 8, !alias.scope !187, !noalias !189
  br label %polly.loop_header242.us.us

polly.loop_exit244.loopexit.us.us:                ; preds = %polly.loop_header242.us.us
  %p_add52.us.us.lcssa = phi i64 [ %p_add52.us.us, %polly.loop_header242.us.us ]
  store i64 %p_add52.us.us.lcssa, i64* %scevgep250251.us.us, align 8, !alias.scope !187, !noalias !189
  %polly.indvar_next238.us.us = add nuw nsw i64 %polly.indvar237.us.us, 1
  %polly.loop_cond240.us.us = icmp sgt i64 %polly.indvar237.us.us, %polly.adjust_ub239
  br i1 %polly.loop_cond240.us.us, label %polly.loop_exit235.loopexit.us.loopexit, label %polly.loop_header233.us.us

polly.loop_header242.us.us:                       ; preds = %polly.loop_header242.us.us, %polly.loop_header233.us.us
  %p_add52308.us.us = phi i64 [ %p_add52.us.us, %polly.loop_header242.us.us ], [ %scevgep250251.promoted.us.us, %polly.loop_header233.us.us ]
  %polly.indvar246.us.us = phi i64 [ %polly.indvar_next247.us.us, %polly.loop_header242.us.us ], [ 0, %polly.loop_header233.us.us ]
  %92 = add nsw i64 %polly.indvar246.us.us, %81
  %93 = add i64 %92, %91
  %scevgep252.us.us = getelementptr i64, i64* %2, i64 %93
  %_p_scalar_253.us.us = load i64, i64* %scevgep252.us.us, align 8, !alias.scope !191, !noalias !192
  %94 = shl i64 %92, 3
  %95 = add i64 %94, %89
  %scevgep254.us.us = getelementptr i8, i8* %call9, i64 %95
  %scevgep254255.us.us = bitcast i8* %scevgep254.us.us to i64*
  %_p_scalar_256.us.us = load i64, i64* %scevgep254255.us.us, align 8, !alias.scope !190, !noalias !193
  %p_mul51.us.us = mul nsw i64 %_p_scalar_256.us.us, %_p_scalar_253.us.us, !dbg !171
  %p_add52.us.us = add nsw i64 %p_mul51.us.us, %p_add52308.us.us, !dbg !177
  %polly.indvar_next247.us.us = add nuw nsw i64 %polly.indvar246.us.us, 1
  %polly.loop_cond249.us.us = icmp sgt i64 %polly.indvar246.us.us, %polly.adjust_ub248
  br i1 %polly.loop_cond249.us.us, label %polly.loop_exit244.loopexit.us.us, label %polly.loop_header242.us.us

polly.loop_exit226.loopexit:                      ; preds = %polly.loop_exit235.loopexit.us
  br label %polly.loop_exit226

polly.loop_exit226:                               ; preds = %polly.loop_exit226.loopexit, %polly.loop_header224.preheader, %polly.loop_header216
  %polly.indvar_next220 = add nuw nsw i64 %polly.indvar219, 1
  %exitcond = icmp eq i64 %polly.indvar219, %pexp.p_div_q
  br i1 %exitcond, label %polly.loop_exit218, label %polly.loop_header216

polly.start259:                                   ; preds = %for.cond11.preheader.lr.ph
  %96 = add nsw i64 %7, -1
  %polly.fdiv_q.shr261 = ashr i64 %96, 5
  %polly.loop_guard266 = icmp sgt i64 %polly.fdiv_q.shr261, -1
  br i1 %polly.loop_guard266, label %polly.loop_preheader264, label %polly.split_new_and_old

polly.loop_header263:                             ; preds = %polly.loop_exit275, %polly.loop_preheader264
  %polly.indvar267 = phi i64 [ 0, %polly.loop_preheader264 ], [ %polly.indvar_next268, %polly.loop_exit275 ]
  br i1 %polly.loop_guard276, label %polly.loop_header273.preheader, label %polly.loop_exit275

polly.loop_header273.preheader:                   ; preds = %polly.loop_header263
  %97 = shl nsw i64 %polly.indvar267, 5
  %98 = sub nsw i64 %7, %97
  %99 = add nsw i64 %98, -1
  %100 = icmp sgt i64 %99, 31
  %101 = select i1 %100, i64 31, i64 %99
  %polly.loop_guard285 = icmp sgt i64 %101, -1
  %polly.adjust_ub288 = add i64 %101, -1
  br i1 %polly.loop_guard285, label %polly.loop_header273.us.preheader, label %polly.loop_exit275

polly.loop_header273.us.preheader:                ; preds = %polly.loop_header273.preheader
  br label %polly.loop_header273.us

polly.loop_header273.us:                          ; preds = %polly.loop_header273.us.preheader, %polly.loop_exit284.loopexit.us
  %polly.indvar277.us = phi i64 [ %polly.indvar_next278.us, %polly.loop_exit284.loopexit.us ], [ 0, %polly.loop_header273.us.preheader ]
  %102 = shl nsw i64 %polly.indvar277.us, 5
  %103 = sub nsw i64 %6, %102
  %104 = add nsw i64 %103, -1
  %105 = icmp sgt i64 %104, 31
  %106 = select i1 %105, i64 31, i64 %104
  %polly.loop_guard294.us = icmp sgt i64 %106, -1
  %polly.adjust_ub297.us = add i64 %106, -1
  br i1 %polly.loop_guard294.us, label %polly.loop_header282.us.us.preheader, label %polly.loop_exit284.loopexit.us

polly.loop_header282.us.us.preheader:             ; preds = %polly.loop_header273.us
  br label %polly.loop_header282.us.us

polly.loop_exit284.loopexit.us.loopexit:          ; preds = %polly.loop_exit293.loopexit.us.us
  br label %polly.loop_exit284.loopexit.us

polly.loop_exit284.loopexit.us:                   ; preds = %polly.loop_exit284.loopexit.us.loopexit, %polly.loop_header273.us
  %polly.indvar_next278.us = add nuw nsw i64 %polly.indvar277.us, 1
  %exitcond418 = icmp eq i64 %polly.indvar277.us, %polly.fdiv_q.shr271
  br i1 %exitcond418, label %polly.loop_exit275.loopexit, label %polly.loop_header273.us

polly.loop_header282.us.us:                       ; preds = %polly.loop_header282.us.us.preheader, %polly.loop_exit293.loopexit.us.us
  %polly.indvar286.us.us = phi i64 [ %polly.indvar_next287.us.us, %polly.loop_exit293.loopexit.us.us ], [ 0, %polly.loop_header282.us.us.preheader ]
  %107 = add nuw nsw i64 %polly.indvar286.us.us, %97
  %108 = mul i64 %107, %7
  br label %polly.loop_header291.us.us

polly.loop_exit293.loopexit.us.us:                ; preds = %polly.loop_header291.us.us
  %polly.indvar_next287.us.us = add nuw nsw i64 %polly.indvar286.us.us, 1
  %polly.loop_cond289.us.us = icmp sgt i64 %polly.indvar286.us.us, %polly.adjust_ub288
  br i1 %polly.loop_cond289.us.us, label %polly.loop_exit284.loopexit.us.loopexit, label %polly.loop_header282.us.us

polly.loop_header291.us.us:                       ; preds = %polly.loop_header291.us.us, %polly.loop_header282.us.us
  %polly.indvar295.us.us = phi i64 [ %polly.indvar_next296.us.us, %polly.loop_header291.us.us ], [ 0, %polly.loop_header282.us.us ]
  %109 = add nuw nsw i64 %polly.indvar295.us.us, %102
  %110 = mul i64 %109, %6
  %111 = add nsw i64 %110, %107
  %scevgep299.us.us = getelementptr i64, i64* %3, i64 %111
  %_p_scalar_300.us.us = load i64, i64* %scevgep299.us.us, align 8, !alias.scope !194, !noalias !196
  %tmp.us.us = add nsw i64 %109, %108
  %tmp303.us.us = shl i64 %tmp.us.us, 3
  %scevgep301.us.us = getelementptr i8, i8* %call9, i64 %tmp303.us.us
  %scevgep301302.us.us = bitcast i8* %scevgep301.us.us to i64*
  store i64 %_p_scalar_300.us.us, i64* %scevgep301302.us.us, align 8, !alias.scope !197, !noalias !198
  %polly.indvar_next296.us.us = add nuw nsw i64 %polly.indvar295.us.us, 1
  %polly.loop_cond298.us.us = icmp sgt i64 %polly.indvar295.us.us, %polly.adjust_ub297.us
  br i1 %polly.loop_cond298.us.us, label %polly.loop_exit293.loopexit.us.us, label %polly.loop_header291.us.us

polly.loop_exit275.loopexit:                      ; preds = %polly.loop_exit284.loopexit.us
  br label %polly.loop_exit275

polly.loop_exit275:                               ; preds = %polly.loop_exit275.loopexit, %polly.loop_header273.preheader, %polly.loop_header263
  %polly.indvar_next268 = add nuw nsw i64 %polly.indvar267, 1
  %exitcond419 = icmp eq i64 %polly.indvar267, %polly.fdiv_q.shr261
  br i1 %exitcond419, label %polly.split_new_and_old.loopexit, label %polly.loop_header263

polly.loop_preheader264:                          ; preds = %polly.start259
  %112 = add nsw i64 %6, -1
  %polly.fdiv_q.shr271 = ashr i64 %112, 5
  %polly.loop_guard276 = icmp sgt i64 %polly.fdiv_q.shr271, -1
  br label %polly.loop_header263
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %args) #3 !dbg !41 {
entry:
  %max = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !48, metadata !57), !dbg !199
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !49, metadata !57), !dbg !200
  %0 = bitcast i32* %max to i8*, !dbg !201
  call void @llvm.lifetime.start(i64 4, i8* %0) #5, !dbg !201
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 1, !dbg !202
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !202, !tbaa !203
  tail call void @llvm.dbg.value(metadata i32* %max, i64 0, metadata !50, metadata !204), !dbg !205
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %max) #5, !dbg !206
  %2 = load i32, i32* %max, align 4, !dbg !207, !tbaa !208
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !50, metadata !57), !dbg !205
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %2), !dbg !209
  %3 = load i32, i32* %max, align 4, !dbg !210, !tbaa !208
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !50, metadata !57), !dbg !205
  %call2 = call %struct.Matrix* @init(i32 %3, i32 %3), !dbg !211
  call void @llvm.dbg.value(metadata %struct.Matrix* %call2, i64 0, metadata !51, metadata !57), !dbg !213
  %4 = load i32, i32* %max, align 4, !dbg !214, !tbaa !208
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !50, metadata !57), !dbg !205
  %call3 = call %struct.Matrix* @init(i32 %4, i32 %4), !dbg !215
  call void @llvm.dbg.value(metadata %struct.Matrix* %call3, i64 0, metadata !52, metadata !57), !dbg !216
  %call4 = call %struct.Matrix* @matmult(%struct.Matrix* %call2, %struct.Matrix* %call3), !dbg !217
  call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !53, metadata !57), !dbg !218
  %5 = load i32, i32* %max, align 4, !dbg !219, !tbaa !208
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !50, metadata !57), !dbg !205
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %5, i32 %5), !dbg !220
  %6 = load i32, i32* %max, align 4, !dbg !221, !tbaa !208
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !50, metadata !57), !dbg !205
  %sub = add nsw i32 %6, -1, !dbg !222
  %add = mul i32 %6, %6, !dbg !223
  %sub8 = add nsw i32 %add, -1, !dbg !224
  %idxprom = sext i32 %sub8 to i64, !dbg !225
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0, !dbg !226
  %7 = load i64*, i64** %data, align 8, !dbg !226, !tbaa !85
  %arrayidx9 = getelementptr inbounds i64, i64* %7, i64 %idxprom, !dbg !225
  %8 = load i64, i64* %arrayidx9, align 8, !dbg !225, !tbaa !144
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call3, i64 0, i32 0, !dbg !227
  %9 = load i64*, i64** %data17, align 8, !dbg !227, !tbaa !85
  %arrayidx18 = getelementptr inbounds i64, i64* %9, i64 %idxprom, !dbg !228
  %10 = load i64, i64* %arrayidx18, align 8, !dbg !228, !tbaa !144
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !229
  %11 = load i64*, i64** %data26, align 8, !dbg !229, !tbaa !85
  %arrayidx27 = getelementptr inbounds i64, i64* %11, i64 %idxprom, !dbg !230
  %12 = load i64, i64* %arrayidx27, align 8, !dbg !230, !tbaa !144
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %6, i32 %sub, i64 %8, i32 %sub, i32 %6, i32 %sub, i64 %10, i32 %sub, i32 %6, i32 %sub, i64 %12), !dbg !231
  call void @llvm.lifetime.end(i64 4, i8* %0) #5, !dbg !232
  ret i32 0, !dbg !234
}

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!54, !55}
!llvm.ident = !{!56}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !6)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!6 = !{!7, !25, !41}
!7 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !8, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: true, variables: !18)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !16, !16}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "Matrix", file: !1, line: 7, baseType: !12)
!12 = !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 3, size: 128, align: 64, elements: !13)
!13 = !{!14, !15, !17}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !12, file: !1, line: 4, baseType: !4, size: 64, align: 64)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !12, file: !1, line: 5, baseType: !16, size: 32, align: 32, offset: 64)
!16 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !12, file: !1, line: 6, baseType: !16, size: 32, align: 32, offset: 96)
!18 = !{!19, !20, !21, !22, !23, !24}
!19 = !DILocalVariable(name: "width", arg: 1, scope: !7, file: !1, line: 12, type: !16)
!20 = !DILocalVariable(name: "height", arg: 2, scope: !7, file: !1, line: 12, type: !16)
!21 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 14, type: !16)
!22 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 14, type: !16)
!23 = !DILocalVariable(name: "data", scope: !7, file: !1, line: 16, type: !4)
!24 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 30, type: !10)
!25 = distinct !DISubprogram(name: "matmult", scope: !1, file: !1, line: 38, type: !26, isLocal: false, isDefinition: true, scopeLine: 38, flags: DIFlagPrototyped, isOptimized: true, variables: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{!10, !10, !10}
!28 = !{!29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40}
!29 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !1, line: 38, type: !10)
!30 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !1, line: 38, type: !10)
!31 = !DILocalVariable(name: "i", scope: !25, file: !1, line: 39, type: !16)
!32 = !DILocalVariable(name: "j", scope: !25, file: !1, line: 39, type: !16)
!33 = !DILocalVariable(name: "k", scope: !25, file: !1, line: 39, type: !16)
!34 = !DILocalVariable(name: "width", scope: !25, file: !1, line: 40, type: !16)
!35 = !DILocalVariable(name: "height", scope: !25, file: !1, line: 41, type: !16)
!36 = !DILocalVariable(name: "a_data", scope: !25, file: !1, line: 42, type: !4)
!37 = !DILocalVariable(name: "b_data", scope: !25, file: !1, line: 43, type: !4)
!38 = !DILocalVariable(name: "data", scope: !25, file: !1, line: 46, type: !4)
!39 = !DILocalVariable(name: "b_t", scope: !25, file: !1, line: 48, type: !4)
!40 = !DILocalVariable(name: "m", scope: !25, file: !1, line: 68, type: !10)
!41 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 75, type: !42, isLocal: false, isDefinition: true, scopeLine: 75, flags: DIFlagPrototyped, isOptimized: true, variables: !47)
!42 = !DISubroutineType(types: !43)
!43 = !{!16, !16, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64, align: 64)
!46 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!47 = !{!48, !49, !50, !51, !52, !53}
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !1, line: 75, type: !16)
!49 = !DILocalVariable(name: "args", arg: 2, scope: !41, file: !1, line: 75, type: !44)
!50 = !DILocalVariable(name: "max", scope: !41, file: !1, line: 77, type: !16)
!51 = !DILocalVariable(name: "a", scope: !41, file: !1, line: 81, type: !10)
!52 = !DILocalVariable(name: "b", scope: !41, file: !1, line: 82, type: !10)
!53 = !DILocalVariable(name: "c", scope: !41, file: !1, line: 84, type: !10)
!54 = !{i32 2, !"Dwarf Version", i32 4}
!55 = !{i32 2, !"Debug Info Version", i32 3}
!56 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!57 = !DIExpression()
!58 = !DILocation(line: 12, column: 18, scope: !7)
!59 = !DILocation(line: 12, column: 29, scope: !7)
!60 = !DILocation(line: 16, column: 48, scope: !7)
!61 = !DILocation(line: 16, column: 42, scope: !7)
!62 = !DILocation(line: 16, column: 54, scope: !7)
!63 = !DILocation(line: 16, column: 35, scope: !64)
!64 = !DILexicalBlockFile(scope: !7, file: !1, discriminator: 1)
!65 = !DILocation(line: 14, column: 9, scope: !7)
!66 = !DILocation(line: 18, column: 16, scope: !67)
!67 = !DILexicalBlockFile(scope: !68, file: !1, discriminator: 1)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 18, column: 5)
!69 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 5)
!70 = !DILocation(line: 19, column: 20, scope: !71)
!71 = !DILexicalBlockFile(scope: !72, file: !1, discriminator: 1)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 19, column: 9)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 19, column: 9)
!74 = distinct !DILexicalBlock(scope: !68, file: !1, line: 18, column: 30)
!75 = !DILocation(line: 18, column: 5, scope: !67)
!76 = !DILocation(line: 20, column: 19, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !1, line: 19, column: 33)
!78 = !DILocation(line: 20, column: 29, scope: !77)
!79 = distinct !{!79, !80}
!80 = !{!"llvm.loop.unroll.disable"}
!81 = !DILocation(line: 30, column: 17, scope: !64)
!82 = !DILocation(line: 30, column: 17, scope: !7)
!83 = !DILocation(line: 30, column: 13, scope: !7)
!84 = !DILocation(line: 31, column: 13, scope: !7)
!85 = !{!86, !87, i64 0}
!86 = !{!"", !87, i64 0, !90, i64 8, !90, i64 12}
!87 = !{!"any pointer", !88, i64 0}
!88 = !{!"omnipotent char", !89, i64 0}
!89 = !{!"Simple C/C++ TBAA"}
!90 = !{!"int", !88, i64 0}
!91 = !DILocation(line: 32, column: 8, scope: !7)
!92 = !DILocation(line: 32, column: 14, scope: !7)
!93 = !{!86, !90, i64 8}
!94 = !DILocation(line: 33, column: 8, scope: !7)
!95 = !DILocation(line: 33, column: 15, scope: !7)
!96 = !{!86, !90, i64 12}
!97 = !DILocation(line: 35, column: 5, scope: !7)
!98 = distinct !{!98, !99, !"polly.alias.scope.call"}
!99 = distinct !{!99, !"polly.alias.scope.domain"}
!100 = !DILocation(line: 26, column: 47, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !1, line: 25, column: 33)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 25, column: 9)
!103 = distinct !DILexicalBlock(scope: !104, file: !1, line: 25, column: 9)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 24, column: 30)
!105 = distinct !DILexicalBlock(scope: !106, file: !1, line: 24, column: 5)
!106 = distinct !DILexicalBlock(scope: !7, file: !1, line: 24, column: 5)
!107 = !DILocation(line: 38, column: 25, scope: !25)
!108 = !DILocation(line: 38, column: 36, scope: !25)
!109 = !DILocation(line: 40, column: 20, scope: !25)
!110 = !DILocation(line: 40, column: 9, scope: !25)
!111 = !DILocation(line: 41, column: 21, scope: !25)
!112 = !DILocation(line: 41, column: 9, scope: !25)
!113 = !DILocation(line: 42, column: 28, scope: !25)
!114 = !DILocation(line: 42, column: 16, scope: !25)
!115 = !DILocation(line: 43, column: 28, scope: !25)
!116 = !DILocation(line: 43, column: 16, scope: !25)
!117 = !DILocation(line: 46, column: 45, scope: !25)
!118 = !DILocation(line: 46, column: 39, scope: !25)
!119 = !DILocation(line: 46, column: 51, scope: !25)
!120 = !DILocation(line: 46, column: 32, scope: !121)
!121 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 1)
!122 = !DILocation(line: 46, column: 20, scope: !25)
!123 = !DILocation(line: 46, column: 13, scope: !25)
!124 = !DILocation(line: 48, column: 22, scope: !121)
!125 = !DILocation(line: 48, column: 22, scope: !25)
!126 = !DILocation(line: 48, column: 16, scope: !25)
!127 = !DILocation(line: 39, column: 9, scope: !25)
!128 = !DILocation(line: 51, column: 16, scope: !129)
!129 = !DILexicalBlockFile(scope: !130, file: !1, discriminator: 1)
!130 = distinct !DILexicalBlock(scope: !131, file: !1, line: 51, column: 2)
!131 = distinct !DILexicalBlock(scope: !25, file: !1, line: 51, column: 2)
!132 = !DILocation(line: 51, column: 2, scope: !129)
!133 = !DILocation(line: 53, column: 17, scope: !134)
!134 = !DILexicalBlockFile(scope: !135, file: !1, discriminator: 1)
!135 = distinct !DILexicalBlock(scope: !136, file: !1, line: 53, column: 3)
!136 = distinct !DILexicalBlock(scope: !137, file: !1, line: 53, column: 3)
!137 = distinct !DILexicalBlock(scope: !130, file: !1, line: 51, column: 31)
!138 = !DILocation(line: 53, column: 3, scope: !134)
!139 = !DILocation(line: 54, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !1, line: 53, column: 31)
!141 = !DILocation(line: 54, column: 30, scope: !140)
!142 = !DILocation(line: 54, column: 36, scope: !140)
!143 = !DILocation(line: 54, column: 22, scope: !140)
!144 = !{!145, !145, i64 0}
!145 = !{!"long long", !88, i64 0}
!146 = !DILocation(line: 54, column: 16, scope: !140)
!147 = !DILocation(line: 54, column: 4, scope: !140)
!148 = !DILocation(line: 54, column: 20, scope: !140)
!149 = distinct !{!149, !80}
!150 = !DILocation(line: 59, column: 17, scope: !151)
!151 = !DILexicalBlockFile(scope: !152, file: !1, discriminator: 1)
!152 = distinct !DILexicalBlock(scope: !153, file: !1, line: 59, column: 3)
!153 = distinct !DILexicalBlock(scope: !154, file: !1, line: 59, column: 3)
!154 = distinct !DILexicalBlock(scope: !155, file: !1, line: 57, column: 31)
!155 = distinct !DILexicalBlock(scope: !156, file: !1, line: 57, column: 2)
!156 = distinct !DILexicalBlock(scope: !25, file: !1, line: 57, column: 2)
!157 = !DILocation(line: 57, column: 2, scope: !158)
!158 = !DILexicalBlockFile(scope: !155, file: !1, discriminator: 1)
!159 = !DILocation(line: 62, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !161, file: !1, line: 61, column: 24)
!161 = distinct !DILexicalBlock(scope: !162, file: !1, line: 61, column: 4)
!162 = distinct !DILexicalBlock(scope: !163, file: !1, line: 61, column: 4)
!163 = distinct !DILexicalBlock(scope: !152, file: !1, line: 59, column: 31)
!164 = !DILocation(line: 60, column: 10, scope: !163)
!165 = !DILocation(line: 60, column: 16, scope: !163)
!166 = !DILocation(line: 60, column: 4, scope: !163)
!167 = !DILocation(line: 60, column: 20, scope: !163)
!168 = !DILocation(line: 39, column: 12, scope: !25)
!169 = !DILocation(line: 62, column: 41, scope: !160)
!170 = !DILocation(line: 62, column: 59, scope: !160)
!171 = !DILocation(line: 62, column: 58, scope: !160)
!172 = !DILocation(line: 62, column: 21, scope: !160)
!173 = !DILocation(line: 61, column: 4, scope: !174)
!174 = !DILexicalBlockFile(scope: !161, file: !1, discriminator: 1)
!175 = !DILocation(line: 59, column: 3, scope: !151)
!176 = !DILocation(line: 62, column: 55, scope: !160)
!177 = !DILocation(line: 62, column: 39, scope: !160)
!178 = !DILocation(line: 68, column: 17, scope: !121)
!179 = !DILocation(line: 68, column: 17, scope: !25)
!180 = !DILocation(line: 68, column: 13, scope: !25)
!181 = !DILocation(line: 69, column: 8, scope: !25)
!182 = !DILocation(line: 69, column: 14, scope: !25)
!183 = !DILocation(line: 70, column: 8, scope: !25)
!184 = !DILocation(line: 70, column: 15, scope: !25)
!185 = !DILocation(line: 71, column: 13, scope: !25)
!186 = !DILocation(line: 72, column: 5, scope: !25)
!187 = distinct !{!187, !188, !"polly.alias.scope.call"}
!188 = distinct !{!188, !"polly.alias.scope.domain"}
!189 = !{!190, !191}
!190 = distinct !{!190, !188, !"polly.alias.scope.call9"}
!191 = distinct !{!191, !188, !"polly.alias.scope."}
!192 = !{!190, !187}
!193 = !{!187, !191}
!194 = distinct !{!194, !195, !"polly.alias.scope."}
!195 = distinct !{!195, !"polly.alias.scope.domain"}
!196 = !{!197}
!197 = distinct !{!197, !195, !"polly.alias.scope.call9"}
!198 = !{!194}
!199 = !DILocation(line: 75, column: 14, scope: !41)
!200 = !DILocation(line: 75, column: 27, scope: !41)
!201 = !DILocation(line: 77, column: 5, scope: !41)
!202 = !DILocation(line: 78, column: 12, scope: !41)
!203 = !{!87, !87, i64 0}
!204 = !DIExpression(DW_OP_deref)
!205 = !DILocation(line: 77, column: 9, scope: !41)
!206 = !DILocation(line: 78, column: 5, scope: !41)
!207 = !DILocation(line: 79, column: 24, scope: !41)
!208 = !{!90, !90, i64 0}
!209 = !DILocation(line: 79, column: 5, scope: !41)
!210 = !DILocation(line: 81, column: 22, scope: !41)
!211 = !DILocation(line: 81, column: 17, scope: !212)
!212 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 1)
!213 = !DILocation(line: 81, column: 13, scope: !41)
!214 = !DILocation(line: 82, column: 22, scope: !41)
!215 = !DILocation(line: 82, column: 17, scope: !212)
!216 = !DILocation(line: 82, column: 13, scope: !41)
!217 = !DILocation(line: 84, column: 17, scope: !212)
!218 = !DILocation(line: 84, column: 13, scope: !41)
!219 = !DILocation(line: 89, column: 48, scope: !41)
!220 = !DILocation(line: 89, column: 5, scope: !41)
!221 = !DILocation(line: 91, column: 9, scope: !41)
!222 = !DILocation(line: 91, column: 12, scope: !41)
!223 = !DILocation(line: 91, column: 47, scope: !41)
!224 = !DILocation(line: 91, column: 51, scope: !41)
!225 = !DILocation(line: 91, column: 28, scope: !41)
!226 = !DILocation(line: 91, column: 31, scope: !41)
!227 = !DILocation(line: 92, column: 31, scope: !41)
!228 = !DILocation(line: 92, column: 28, scope: !41)
!229 = !DILocation(line: 93, column: 31, scope: !41)
!230 = !DILocation(line: 93, column: 28, scope: !41)
!231 = !DILocation(line: 90, column: 5, scope: !41)
!232 = !DILocation(line: 96, column: 1, scope: !233)
!233 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 3)
!234 = !DILocation(line: 95, column: 5, scope: !41)
