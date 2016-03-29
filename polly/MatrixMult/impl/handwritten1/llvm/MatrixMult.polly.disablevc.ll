; ModuleID = 'MatrixMult.c'
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
  %conv = sext i32 %width to i64, !dbg !60
  %mul = shl nsw i64 %conv, 3, !dbg !61
  %conv1 = sext i32 %height to i64, !dbg !62
  %mul2 = mul i64 %mul, %conv1, !dbg !63
  %call = tail call noalias i8* @malloc(i64 %mul2) #5, !dbg !64
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !21, metadata !57), !dbg !66
  %cmp77 = icmp sgt i32 %height, 0, !dbg !67
  %cmp575 = icmp sgt i32 %width, 0, !dbg !71
  %or.cond = and i1 %cmp77, %cmp575, !dbg !76
  br i1 %or.cond, label %for.body7.preheader.us.preheader, label %polly.start, !dbg !76

for.body7.preheader.us.preheader:                 ; preds = %entry
  %0 = add i32 %width, -1, !dbg !77
  %1 = zext i32 %0 to i64, !dbg !77
  %2 = shl nuw nsw i64 %1, 3, !dbg !77
  %3 = add nuw nsw i64 %2, 8, !dbg !77
  %4 = add i32 %height, -1, !dbg !77
  %xtraiter = and i32 %height, 7, !dbg !77
  %lcmp.mod = icmp eq i32 %xtraiter, 0, !dbg !77
  br i1 %lcmp.mod, label %for.body7.preheader.us.preheader.split, label %for.body7.preheader.us.prol.preheader, !dbg !77

for.body7.preheader.us.prol.preheader:            ; preds = %for.body7.preheader.us.preheader
  br label %for.body7.preheader.us.prol, !dbg !77

for.body7.preheader.us.prol:                      ; preds = %for.body7.preheader.us.prol.preheader, %for.body7.preheader.us.prol
  %indvars.iv91.us.prol = phi i64 [ %indvars.iv.next92.us.prol, %for.body7.preheader.us.prol ], [ 0, %for.body7.preheader.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body7.preheader.us.prol ], [ %xtraiter, %for.body7.preheader.us.prol.preheader ]
  %5 = mul i64 %mul, %indvars.iv91.us.prol, !dbg !77
  %scevgep.prol = getelementptr i8, i8* %call, i64 %5, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %3, i32 8, i1 false), !dbg !79
  %indvars.iv.next92.us.prol = add nuw nsw i64 %indvars.iv91.us.prol, 1, !dbg !76
  %prol.iter.sub = add i32 %prol.iter, -1, !dbg !76
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0, !dbg !76
  br i1 %prol.iter.cmp, label %for.body7.preheader.us.preheader.split.loopexit, label %for.body7.preheader.us.prol, !dbg !76, !llvm.loop !80

for.body7.preheader.us.preheader.split.loopexit:  ; preds = %for.body7.preheader.us.prol
  %indvars.iv.next92.us.prol.lcssa = phi i64 [ %indvars.iv.next92.us.prol, %for.body7.preheader.us.prol ]
  br label %for.body7.preheader.us.preheader.split, !dbg !77

for.body7.preheader.us.preheader.split:           ; preds = %for.body7.preheader.us.preheader.split.loopexit, %for.body7.preheader.us.preheader
  %indvars.iv91.us.unr = phi i64 [ 0, %for.body7.preheader.us.preheader ], [ %indvars.iv.next92.us.prol.lcssa, %for.body7.preheader.us.preheader.split.loopexit ]
  %6 = icmp ult i32 %4, 7, !dbg !77
  br i1 %6, label %polly.start.loopexit, label %for.body7.preheader.us.preheader.split.split, !dbg !77

for.body7.preheader.us.preheader.split.split:     ; preds = %for.body7.preheader.us.preheader.split
  br label %for.body7.preheader.us, !dbg !77

for.body7.preheader.us:                           ; preds = %for.body7.preheader.us, %for.body7.preheader.us.preheader.split.split
  %indvars.iv91.us = phi i64 [ %indvars.iv91.us.unr, %for.body7.preheader.us.preheader.split.split ], [ %indvars.iv.next92.us.7, %for.body7.preheader.us ]
  %7 = mul i64 %mul, %indvars.iv91.us, !dbg !77
  %scevgep = getelementptr i8, i8* %call, i64 %7, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %3, i32 8, i1 false), !dbg !79
  %indvars.iv.next92.us = add nuw nsw i64 %indvars.iv91.us, 1, !dbg !76
  %8 = mul i64 %mul, %indvars.iv.next92.us, !dbg !77
  %scevgep.1 = getelementptr i8, i8* %call, i64 %8, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %3, i32 8, i1 false), !dbg !79
  %indvars.iv.next92.us.1 = add nsw i64 %indvars.iv91.us, 2, !dbg !76
  %9 = mul i64 %mul, %indvars.iv.next92.us.1, !dbg !77
  %scevgep.2 = getelementptr i8, i8* %call, i64 %9, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %3, i32 8, i1 false), !dbg !79
  %indvars.iv.next92.us.2 = add nsw i64 %indvars.iv91.us, 3, !dbg !76
  %10 = mul i64 %mul, %indvars.iv.next92.us.2, !dbg !77
  %scevgep.3 = getelementptr i8, i8* %call, i64 %10, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %3, i32 8, i1 false), !dbg !79
  %indvars.iv.next92.us.3 = add nsw i64 %indvars.iv91.us, 4, !dbg !76
  %11 = mul i64 %mul, %indvars.iv.next92.us.3, !dbg !77
  %scevgep.4 = getelementptr i8, i8* %call, i64 %11, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %3, i32 8, i1 false), !dbg !79
  %indvars.iv.next92.us.4 = add nsw i64 %indvars.iv91.us, 5, !dbg !76
  %12 = mul i64 %mul, %indvars.iv.next92.us.4, !dbg !77
  %scevgep.5 = getelementptr i8, i8* %call, i64 %12, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %3, i32 8, i1 false), !dbg !79
  %indvars.iv.next92.us.5 = add nsw i64 %indvars.iv91.us, 6, !dbg !76
  %13 = mul i64 %mul, %indvars.iv.next92.us.5, !dbg !77
  %scevgep.6 = getelementptr i8, i8* %call, i64 %13, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %3, i32 8, i1 false), !dbg !79
  %indvars.iv.next92.us.6 = add nsw i64 %indvars.iv91.us, 7, !dbg !76
  %14 = mul i64 %mul, %indvars.iv.next92.us.6, !dbg !77
  %scevgep.7 = getelementptr i8, i8* %call, i64 %14, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %3, i32 8, i1 false), !dbg !79
  %indvars.iv.next92.us.7 = add nsw i64 %indvars.iv91.us, 8, !dbg !76
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next92.us.7 to i32, !dbg !76
  %exitcond147.7 = icmp eq i32 %lftr.wideiv.7, %height, !dbg !76
  br i1 %exitcond147.7, label %polly.start.loopexit.unr-lcssa, label %for.body7.preheader.us, !dbg !76

polly.start.loopexit.unr-lcssa:                   ; preds = %for.body7.preheader.us
  br label %polly.start.loopexit

polly.start.loopexit:                             ; preds = %for.body7.preheader.us.preheader.split, %polly.start.loopexit.unr-lcssa
  br label %polly.start

polly.start:                                      ; preds = %polly.start.loopexit, %entry
  %15 = add nsw i64 %conv1, -1
  %polly.fdiv_q.shr = ashr i64 %15, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %polly.exiting

polly.loop_header.preheader:                      ; preds = %polly.start
  %16 = add nsw i64 %conv, -1
  %polly.fdiv_q.shr96 = ashr i64 %16, 5
  %polly.loop_guard101 = icmp sgt i64 %polly.fdiv_q.shr96, -1
  br label %polly.loop_header

polly.exiting.loopexit:                           ; preds = %polly.loop_exit100
  br label %polly.exiting, !dbg !82

polly.exiting:                                    ; preds = %polly.exiting.loopexit, %polly.start
  %call36 = tail call noalias i8* @malloc(i64 16) #5, !dbg !82
  %17 = bitcast i8* %call36 to %struct.Matrix*, !dbg !83
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %17, i64 0, metadata !24, metadata !57), !dbg !84
  %18 = bitcast i8* %call36 to i8**, !dbg !85
  store i8* %call, i8** %18, align 8, !dbg !85, !tbaa !86
  %width38 = getelementptr inbounds i8, i8* %call36, i64 8, !dbg !92
  %19 = bitcast i8* %width38 to i32*, !dbg !92
  store i32 %width, i32* %19, align 8, !dbg !93, !tbaa !94
  %height39 = getelementptr inbounds i8, i8* %call36, i64 12, !dbg !95
  %20 = bitcast i8* %height39 to i32*, !dbg !95
  store i32 %height, i32* %20, align 4, !dbg !96, !tbaa !97
  ret %struct.Matrix* %17, !dbg !98

polly.loop_header:                                ; preds = %polly.loop_exit100, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit100 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard101, label %polly.loop_header98.preheader, label %polly.loop_exit100

polly.loop_header98.preheader:                    ; preds = %polly.loop_header
  %21 = shl nsw i64 %polly.indvar, 5
  %22 = sub nsw i64 %conv1, %21
  %23 = add nsw i64 %22, -1
  %24 = icmp sgt i64 %23, 31
  %25 = select i1 %24, i64 31, i64 %23
  %polly.loop_guard110 = icmp sgt i64 %25, -1
  %polly.adjust_ub113 = add i64 %25, -1
  br i1 %polly.loop_guard110, label %polly.loop_header107.preheader.us.preheader, label %polly.loop_exit100

polly.loop_header107.preheader.us.preheader:      ; preds = %polly.loop_header98.preheader
  br label %polly.loop_header107.preheader.us

polly.loop_header107.preheader.us:                ; preds = %polly.loop_header107.preheader.us.preheader, %polly.loop_exit109.loopexit.us
  %polly.indvar102.us = phi i64 [ %polly.indvar_next103.us, %polly.loop_exit109.loopexit.us ], [ 0, %polly.loop_header107.preheader.us.preheader ]
  %26 = shl nsw i64 %polly.indvar102.us, 5
  %27 = sub nsw i64 %conv, %26
  %28 = add nsw i64 %27, -1
  %29 = icmp sgt i64 %28, 31
  %30 = select i1 %29, i64 31, i64 %28
  %polly.loop_guard119.us = icmp sgt i64 %30, -1
  %polly.adjust_ub122.us = add i64 %30, -1
  br i1 %polly.loop_guard119.us, label %polly.loop_header116.preheader.us.us.preheader, label %polly.loop_exit109.loopexit.us

polly.loop_header116.preheader.us.us.preheader:   ; preds = %polly.loop_header107.preheader.us
  br label %polly.loop_header116.preheader.us.us

polly.loop_exit109.loopexit.us.loopexit:          ; preds = %polly.loop_exit118.loopexit.us.us
  br label %polly.loop_exit109.loopexit.us

polly.loop_exit109.loopexit.us:                   ; preds = %polly.loop_exit109.loopexit.us.loopexit, %polly.loop_header107.preheader.us
  %polly.indvar_next103.us = add nuw nsw i64 %polly.indvar102.us, 1
  %exitcond = icmp eq i64 %polly.indvar102.us, %polly.fdiv_q.shr96
  br i1 %exitcond, label %polly.loop_exit100.loopexit, label %polly.loop_header107.preheader.us

polly.loop_header116.preheader.us.us:             ; preds = %polly.loop_header116.preheader.us.us.preheader, %polly.loop_exit118.loopexit.us.us
  %polly.indvar111.us.us = phi i64 [ %polly.indvar_next112.us.us, %polly.loop_exit118.loopexit.us.us ], [ 0, %polly.loop_header116.preheader.us.us.preheader ]
  %31 = add nuw nsw i64 %polly.indvar111.us.us, %21
  %32 = mul i64 %31, %mul
  br label %polly.loop_header116.us.us

polly.loop_exit118.loopexit.us.us:                ; preds = %polly.loop_header116.us.us
  %polly.indvar_next112.us.us = add nuw nsw i64 %polly.indvar111.us.us, 1
  %polly.loop_cond114.us.us = icmp sgt i64 %polly.indvar111.us.us, %polly.adjust_ub113
  br i1 %polly.loop_cond114.us.us, label %polly.loop_exit109.loopexit.us.loopexit, label %polly.loop_header116.preheader.us.us

polly.loop_header116.us.us:                       ; preds = %polly.loop_header116.us.us, %polly.loop_header116.preheader.us.us
  %polly.indvar120.us.us = phi i64 [ %polly.indvar_next121.us.us, %polly.loop_header116.us.us ], [ 0, %polly.loop_header116.preheader.us.us ]
  %33 = add nuw nsw i64 %polly.indvar120.us.us, %26
  %34 = shl i64 %33, 3
  %35 = add i64 %34, %32
  %scevgep.us.us = getelementptr i8, i8* %call, i64 %35
  %scevgep124.us.us = bitcast i8* %scevgep.us.us to i64*
  %_p_scalar_.us.us = load i64, i64* %scevgep124.us.us, align 8, !alias.scope !99, !noalias !2
  %p_add25.us.us = add nsw i64 %_p_scalar_.us.us, %31, !dbg !101
  store i64 %p_add25.us.us, i64* %scevgep124.us.us, align 8, !alias.scope !99, !noalias !2
  %polly.indvar_next121.us.us = add nuw nsw i64 %polly.indvar120.us.us, 1
  %polly.loop_cond123.us.us = icmp sgt i64 %polly.indvar120.us.us, %polly.adjust_ub122.us
  br i1 %polly.loop_cond123.us.us, label %polly.loop_exit118.loopexit.us.us, label %polly.loop_header116.us.us

polly.loop_exit100.loopexit:                      ; preds = %polly.loop_exit109.loopexit.us
  br label %polly.loop_exit100

polly.loop_exit100:                               ; preds = %polly.loop_exit100.loopexit, %polly.loop_header98.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond145 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond145, label %polly.exiting.loopexit, label %polly.loop_header
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noinline nounwind uwtable
define noalias %struct.Matrix* @mat_mult(%struct.Matrix* nocapture readonly %a, %struct.Matrix* nocapture readonly %b) #0 !dbg !25 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !29, metadata !57), !dbg !108
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !30, metadata !57), !dbg !109
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !110
  %0 = load i32, i32* %width1, align 8, !dbg !110, !tbaa !94
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !34, metadata !57), !dbg !111
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !112
  %1 = load i32, i32* %height2, align 4, !dbg !112, !tbaa !97
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !35, metadata !57), !dbg !113
  %data3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !114
  %2 = load i64*, i64** %data3, align 8, !dbg !114, !tbaa !86
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !36, metadata !57), !dbg !115
  %data4 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !116
  %3 = load i64*, i64** %data4, align 8, !dbg !116, !tbaa !86
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !38, metadata !57), !dbg !117
  %conv = sext i32 %0 to i64, !dbg !118
  %mul = shl nsw i64 %conv, 3, !dbg !119
  %conv5 = sext i32 %1 to i64, !dbg !120
  %mul6 = mul i64 %mul, %conv5, !dbg !121
  %call = tail call noalias i8* @malloc(i64 %mul6) #5, !dbg !122
  %4 = bitcast i8* %call to i64*, !dbg !123
  tail call void @llvm.dbg.value(metadata i64* %4, i64 0, metadata !39, metadata !57), !dbg !124
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !31, metadata !57), !dbg !125
  %cmp89 = icmp sgt i32 %0, 0, !dbg !126
  br i1 %cmp89, label %for.cond8.preheader.lr.ph, label %for.end40, !dbg !130

for.cond8.preheader.lr.ph:                        ; preds = %entry
  %5 = icmp sge i32 %0, %1
  %6 = add nsw i64 %conv, -1
  %polly.access.mul. = mul i64 %6, %conv
  %polly.access.add. = add i64 %polly.access.mul., %conv5
  %polly.access. = getelementptr i64, i64* %3, i64 %polly.access.add.
  %7 = icmp ule i64* %polly.access., %4
  %polly.access.call108 = getelementptr i64, i64* %4, i64 %polly.access.add.
  %8 = icmp ule i64* %polly.access.call108, %3
  %9 = or i1 %7, %8
  %10 = and i1 %5, %9
  %polly.access.add.113 = mul nsw i64 %conv, %conv
  %polly.access.114 = getelementptr i64, i64* %2, i64 %polly.access.add.113
  %11 = icmp ule i64* %polly.access.114, %4
  %12 = icmp ule i64* %polly.access.call108, %2
  %13 = or i1 %11, %12
  %14 = and i1 %13, %10
  br i1 %14, label %polly.start, label %for.cond8.preheader.preheader

for.cond8.preheader.preheader:                    ; preds = %for.cond8.preheader.lr.ph
  %cmp986 = icmp sgt i32 %1, 0, !dbg !131
  br i1 %cmp986, label %for.body11.preheader.us.preheader, label %for.end40, !dbg !136

for.body11.preheader.us.preheader:                ; preds = %for.cond8.preheader.preheader
  %xtraiter = and i32 %0, 1, !dbg !137
  %lcmp.mod = icmp eq i32 %xtraiter, 0, !dbg !137
  %15 = icmp eq i32 %0, 1, !dbg !137
  br label %for.body11.preheader.us, !dbg !142

for.body11.us:                                    ; preds = %for.body11.preheader.us, %for.inc35.us
  %indvars.iv95.us = phi i64 [ %indvars.iv.next96.us, %for.inc35.us ], [ 0, %for.body11.preheader.us ]
  %16 = add nsw i64 %indvars.iv95.us, %30, !dbg !143
  %arrayidx.us = getelementptr inbounds i64, i64* %4, i64 %16, !dbg !144
  store i64 0, i64* %arrayidx.us, align 8, !dbg !145, !tbaa !146
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !57), !dbg !148
  br i1 %lcmp.mod, label %for.body11.us.split, label %for.body16.us.prol, !dbg !137

for.body16.us.prol:                               ; preds = %for.body11.us
  %17 = load i64, i64* %arrayidx24.us.prol, align 8, !dbg !149, !tbaa !146
  %arrayidx28.us.prol = getelementptr inbounds i64, i64* %3, i64 %indvars.iv95.us, !dbg !150
  %18 = load i64, i64* %arrayidx28.us.prol, align 8, !dbg !150, !tbaa !146
  %mul29.us.prol = mul nsw i64 %18, %17, !dbg !151
  store i64 %mul29.us.prol, i64* %arrayidx.us, align 8, !dbg !152, !tbaa !146
  br label %for.body11.us.split, !dbg !137

for.body11.us.split:                              ; preds = %for.body11.us, %for.body16.us.prol
  %.unr = phi i64 [ 0, %for.body11.us ], [ %mul29.us.prol, %for.body16.us.prol ]
  %indvars.iv.us.unr = phi i64 [ 0, %for.body11.us ], [ 1, %for.body16.us.prol ]
  br i1 %15, label %for.inc35.us, label %for.body11.us.split.split, !dbg !137

for.body11.us.split.split:                        ; preds = %for.body11.us.split
  br label %for.body16.us, !dbg !137

for.body16.us:                                    ; preds = %for.body16.us, %for.body11.us.split.split
  %19 = phi i64 [ %.unr, %for.body11.us.split.split ], [ %add30.us.1, %for.body16.us ], !dbg !153
  %indvars.iv.us = phi i64 [ %indvars.iv.us.unr, %for.body11.us.split.split ], [ %indvars.iv.next.us.1, %for.body16.us ]
  %20 = add nsw i64 %indvars.iv.us, %30, !dbg !154
  %arrayidx24.us = getelementptr inbounds i64, i64* %2, i64 %20, !dbg !149
  %21 = load i64, i64* %arrayidx24.us, align 8, !dbg !149, !tbaa !146
  %22 = mul nsw i64 %indvars.iv.us, %conv, !dbg !155
  %23 = add nsw i64 %22, %indvars.iv95.us, !dbg !156
  %arrayidx28.us = getelementptr inbounds i64, i64* %3, i64 %23, !dbg !150
  %24 = load i64, i64* %arrayidx28.us, align 8, !dbg !150, !tbaa !146
  %mul29.us = mul nsw i64 %24, %21, !dbg !151
  %add30.us = add nsw i64 %mul29.us, %19, !dbg !157
  store i64 %add30.us, i64* %arrayidx.us, align 8, !dbg !152, !tbaa !146
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1, !dbg !137
  %25 = add nsw i64 %indvars.iv.next.us, %30, !dbg !154
  %arrayidx24.us.1 = getelementptr inbounds i64, i64* %2, i64 %25, !dbg !149
  %26 = load i64, i64* %arrayidx24.us.1, align 8, !dbg !149, !tbaa !146
  %27 = mul nsw i64 %indvars.iv.next.us, %conv, !dbg !155
  %28 = add nsw i64 %27, %indvars.iv95.us, !dbg !156
  %arrayidx28.us.1 = getelementptr inbounds i64, i64* %3, i64 %28, !dbg !150
  %29 = load i64, i64* %arrayidx28.us.1, align 8, !dbg !150, !tbaa !146
  %mul29.us.1 = mul nsw i64 %29, %26, !dbg !151
  %add30.us.1 = add nsw i64 %mul29.us.1, %add30.us, !dbg !157
  store i64 %add30.us.1, i64* %arrayidx.us, align 8, !dbg !152, !tbaa !146
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2, !dbg !137
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.us.1 to i32, !dbg !137
  %exitcond267.1 = icmp eq i32 %lftr.wideiv.1, %0, !dbg !137
  br i1 %exitcond267.1, label %for.inc35.us.unr-lcssa, label %for.body16.us, !dbg !137

for.inc35.us.unr-lcssa:                           ; preds = %for.body16.us
  br label %for.inc35.us, !dbg !136

for.inc35.us:                                     ; preds = %for.body11.us.split, %for.inc35.us.unr-lcssa
  %indvars.iv.next96.us = add nuw nsw i64 %indvars.iv95.us, 1, !dbg !136
  %lftr.wideiv268 = trunc i64 %indvars.iv.next96.us to i32, !dbg !136
  %exitcond269 = icmp eq i32 %lftr.wideiv268, %1, !dbg !136
  br i1 %exitcond269, label %for.inc38.loopexit.us, label %for.body11.us, !dbg !136

for.body11.preheader.us:                          ; preds = %for.body11.preheader.us.preheader, %for.inc38.loopexit.us
  %indvars.iv100.us = phi i64 [ %indvars.iv.next101.us, %for.inc38.loopexit.us ], [ 0, %for.body11.preheader.us.preheader ]
  %30 = mul nsw i64 %indvars.iv100.us, %conv, !dbg !142
  %arrayidx24.us.prol = getelementptr inbounds i64, i64* %2, i64 %30, !dbg !149
  br label %for.body11.us, !dbg !142

for.inc38.loopexit.us:                            ; preds = %for.inc35.us
  %indvars.iv.next101.us = add nuw nsw i64 %indvars.iv100.us, 1, !dbg !130
  %lftr.wideiv271 = trunc i64 %indvars.iv.next101.us to i32, !dbg !130
  %exitcond272 = icmp eq i32 %lftr.wideiv271, %0, !dbg !130
  br i1 %exitcond272, label %for.end40.loopexit278, label %for.body11.preheader.us, !dbg !130

for.end40.loopexit:                               ; preds = %polly.loop_exit169
  br label %for.end40, !dbg !158

for.end40.loopexit278:                            ; preds = %for.inc38.loopexit.us
  br label %for.end40, !dbg !158

for.end40:                                        ; preds = %for.end40.loopexit278, %for.end40.loopexit, %for.cond8.preheader.preheader, %polly.start, %entry
  %call41 = tail call noalias i8* @malloc(i64 16) #5, !dbg !158
  %31 = bitcast i8* %call41 to %struct.Matrix*, !dbg !160
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %31, i64 0, metadata !40, metadata !57), !dbg !161
  %width42 = getelementptr inbounds i8, i8* %call41, i64 8, !dbg !162
  %32 = bitcast i8* %width42 to i32*, !dbg !162
  store i32 %0, i32* %32, align 8, !dbg !163, !tbaa !94
  %height43 = getelementptr inbounds i8, i8* %call41, i64 12, !dbg !164
  %33 = bitcast i8* %height43 to i32*, !dbg !164
  store i32 %1, i32* %33, align 4, !dbg !165, !tbaa !97
  %34 = bitcast i8* %call41 to i8**, !dbg !166
  store i8* %call, i8** %34, align 8, !dbg !166, !tbaa !86
  ret %struct.Matrix* %31, !dbg !167

polly.start:                                      ; preds = %for.cond8.preheader.lr.ph
  %polly.fdiv_q.shr = ashr i64 %6, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %for.end40

polly.loop_header.preheader:                      ; preds = %polly.start
  %35 = add nsw i64 %conv5, -1
  %polly.fdiv_q.shr126 = ashr i64 %35, 5
  %polly.loop_guard131 = icmp sgt i64 %polly.fdiv_q.shr126, -1
  %36 = add nsw i64 %polly.fdiv_q.shr126, 1
  %37 = shl nsw i64 %conv, 8
  %38 = add nsw i64 %polly.fdiv_q.shr, 1
  br label %polly.loop_header

polly.loop_header157.preheader:                   ; preds = %polly.loop_exit130
  %pexp.p_div_q = lshr i64 %6, 5
  br label %polly.loop_header157

polly.loop_header:                                ; preds = %polly.loop_exit130, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit130 ], [ 0, %polly.loop_header.preheader ]
  %39 = mul i64 %37, %polly.indvar
  br i1 %polly.loop_guard131, label %polly.loop_header128.preheader, label %polly.loop_exit130

polly.loop_header128.preheader:                   ; preds = %polly.loop_header
  %40 = shl nsw i64 %polly.indvar, 5
  %41 = sub nsw i64 %conv, %40
  %42 = add nsw i64 %41, -1
  %43 = icmp sgt i64 %42, 31
  %44 = select i1 %43, i64 31, i64 %42
  %polly.loop_guard140 = icmp sgt i64 %44, -1
  %polly.adjust_ub143 = add i64 %44, -1
  br i1 %polly.loop_guard140, label %polly.loop_header137.preheader.us.preheader, label %polly.loop_exit130

polly.loop_header137.preheader.us.preheader:      ; preds = %polly.loop_header128.preheader
  br label %polly.loop_header137.preheader.us

polly.loop_header137.preheader.us:                ; preds = %polly.loop_header137.preheader.us.preheader, %polly.loop_exit139.loopexit.us
  %polly.indvar132.us = phi i64 [ %polly.indvar_next133.us, %polly.loop_exit139.loopexit.us ], [ 0, %polly.loop_header137.preheader.us.preheader ]
  %45 = shl i64 %polly.indvar132.us, 8
  %46 = add i64 %39, %45
  %47 = shl i64 %polly.indvar132.us, 5
  %48 = sub i64 %47, %conv5
  %49 = icmp sgt i64 %48, -32
  %smax = select i1 %49, i64 %48, i64 -32
  %50 = mul i64 %smax, -8
  %polly.loop_guard149.us275 = icmp slt i64 %47, %conv5
  br i1 %polly.loop_guard149.us275, label %polly.stmt.for.body11.preheader.us.us.preheader, label %polly.loop_exit139.loopexit.us

polly.stmt.for.body11.preheader.us.us.preheader:  ; preds = %polly.loop_header137.preheader.us
  br label %polly.stmt.for.body11.preheader.us.us

polly.loop_exit139.loopexit.us.loopexit:          ; preds = %polly.stmt.for.body11.preheader.us.us
  br label %polly.loop_exit139.loopexit.us

polly.loop_exit139.loopexit.us:                   ; preds = %polly.loop_exit139.loopexit.us.loopexit, %polly.loop_header137.preheader.us
  %polly.indvar_next133.us = add nuw nsw i64 %polly.indvar132.us, 1
  %exitcond265 = icmp eq i64 %polly.indvar_next133.us, %36
  br i1 %exitcond265, label %polly.loop_exit130.loopexit, label %polly.loop_header137.preheader.us

polly.stmt.for.body11.preheader.us.us:            ; preds = %polly.stmt.for.body11.preheader.us.us.preheader, %polly.stmt.for.body11.preheader.us.us
  %polly.indvar141.us.us = phi i64 [ %polly.indvar_next142.us.us, %polly.stmt.for.body11.preheader.us.us ], [ 0, %polly.stmt.for.body11.preheader.us.us.preheader ]
  %51 = mul i64 %mul, %polly.indvar141.us.us
  %52 = add i64 %46, %51
  %scevgep = getelementptr i8, i8* %call, i64 %52
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %50, i32 8, i1 false)
  %polly.indvar_next142.us.us = add nuw nsw i64 %polly.indvar141.us.us, 1
  %polly.loop_cond144.us.us = icmp sgt i64 %polly.indvar141.us.us, %polly.adjust_ub143
  br i1 %polly.loop_cond144.us.us, label %polly.loop_exit139.loopexit.us.loopexit, label %polly.stmt.for.body11.preheader.us.us

polly.loop_exit130.loopexit:                      ; preds = %polly.loop_exit139.loopexit.us
  br label %polly.loop_exit130

polly.loop_exit130:                               ; preds = %polly.loop_exit130.loopexit, %polly.loop_header128.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond266 = icmp eq i64 %polly.indvar_next, %38
  br i1 %exitcond266, label %polly.loop_header157.preheader, label %polly.loop_header

polly.loop_header157:                             ; preds = %polly.loop_exit169, %polly.loop_header157.preheader
  %polly.indvar161 = phi i64 [ %polly.indvar_next162, %polly.loop_exit169 ], [ 0, %polly.loop_header157.preheader ]
  br i1 %polly.loop_guard131, label %polly.loop_header167.preheader, label %polly.loop_exit169

polly.loop_header167.preheader:                   ; preds = %polly.loop_header157
  %53 = shl nsw i64 %polly.indvar161, 5
  %54 = sub nsw i64 %conv, %53
  %55 = add nsw i64 %54, -1
  %56 = icmp sgt i64 %55, 31
  %57 = select i1 %56, i64 31, i64 %55
  %polly.loop_guard186 = icmp sgt i64 %57, -1
  %polly.adjust_ub189 = add i64 %57, -1
  br label %polly.loop_header167

polly.loop_exit169.loopexit:                      ; preds = %polly.loop_exit177
  br label %polly.loop_exit169

polly.loop_exit169:                               ; preds = %polly.loop_exit169.loopexit, %polly.loop_header157
  %polly.indvar_next162 = add nuw nsw i64 %polly.indvar161, 1
  %exitcond263 = icmp eq i64 %polly.indvar_next162, %38
  br i1 %exitcond263, label %for.end40.loopexit, label %polly.loop_header157

polly.loop_header167:                             ; preds = %polly.loop_exit177, %polly.loop_header167.preheader
  %polly.indvar171 = phi i64 [ %polly.indvar_next172, %polly.loop_exit177 ], [ 0, %polly.loop_header167.preheader ]
  %58 = shl nsw i64 %polly.indvar171, 5
  %59 = sub nsw i64 %conv5, %58
  %60 = add nsw i64 %59, -1
  %61 = icmp sgt i64 %60, 31
  %62 = select i1 %61, i64 31, i64 %60
  %polly.loop_guard195 = icmp sgt i64 %62, -1
  %polly.adjust_ub198 = add i64 %62, -1
  br label %polly.loop_header175

polly.loop_exit177:                               ; preds = %polly.loop_exit185
  %polly.indvar_next172 = add nuw nsw i64 %polly.indvar171, 1
  %exitcond262 = icmp eq i64 %polly.indvar_next172, %36
  br i1 %exitcond262, label %polly.loop_exit169.loopexit, label %polly.loop_header167

polly.loop_header175:                             ; preds = %polly.loop_exit185, %polly.loop_header167
  %polly.indvar178 = phi i64 [ 0, %polly.loop_header167 ], [ %polly.indvar_next179, %polly.loop_exit185 ]
  br i1 %polly.loop_guard186, label %polly.loop_header183.preheader, label %polly.loop_exit185

polly.loop_header183.preheader:                   ; preds = %polly.loop_header175
  %63 = shl nsw i64 %polly.indvar178, 5
  %64 = sub nsw i64 %conv, %63
  %65 = add nsw i64 %64, -1
  %66 = icmp sgt i64 %65, 31
  %67 = select i1 %66, i64 31, i64 %65
  %polly.loop_guard204 = icmp sgt i64 %67, -1
  %polly.adjust_ub207 = add i64 %67, -1
  br i1 %polly.loop_guard195, label %polly.loop_header192.preheader.us.preheader, label %polly.loop_exit185

polly.loop_header192.preheader.us.preheader:      ; preds = %polly.loop_header183.preheader
  br label %polly.loop_header192.preheader.us

polly.loop_header192.preheader.us:                ; preds = %polly.loop_header192.preheader.us.preheader, %polly.loop_exit194.loopexit.us
  %polly.indvar187.us = phi i64 [ %polly.indvar_next188.us, %polly.loop_exit194.loopexit.us ], [ 0, %polly.loop_header192.preheader.us.preheader ]
  %68 = add nuw nsw i64 %polly.indvar187.us, %53
  %69 = mul i64 %68, %mul
  %70 = mul i64 %68, %conv
  br i1 %polly.loop_guard204, label %polly.loop_header201.preheader.us.us.preheader, label %polly.loop_exit194.loopexit.us

polly.loop_header201.preheader.us.us.preheader:   ; preds = %polly.loop_header192.preheader.us
  br label %polly.loop_header201.preheader.us.us

polly.loop_exit194.loopexit.us.loopexit:          ; preds = %polly.loop_exit203.loopexit.us.us
  br label %polly.loop_exit194.loopexit.us

polly.loop_exit194.loopexit.us:                   ; preds = %polly.loop_exit194.loopexit.us.loopexit, %polly.loop_header192.preheader.us
  %polly.indvar_next188.us = add nuw nsw i64 %polly.indvar187.us, 1
  %polly.loop_cond190.us = icmp sgt i64 %polly.indvar187.us, %polly.adjust_ub189
  br i1 %polly.loop_cond190.us, label %polly.loop_exit185.loopexit, label %polly.loop_header192.preheader.us

polly.loop_header201.preheader.us.us:             ; preds = %polly.loop_header201.preheader.us.us.preheader, %polly.loop_exit203.loopexit.us.us
  %polly.indvar196.us.us = phi i64 [ %polly.indvar_next197.us.us, %polly.loop_exit203.loopexit.us.us ], [ 0, %polly.loop_header201.preheader.us.us.preheader ]
  %71 = add nuw nsw i64 %polly.indvar196.us.us, %58
  %72 = shl i64 %71, 3
  %73 = add i64 %72, %69
  %scevgep209.us.us = getelementptr i8, i8* %call, i64 %73
  %scevgep209210.us.us = bitcast i8* %scevgep209.us.us to i64*
  %scevgep209210.promoted.us.us = load i64, i64* %scevgep209210.us.us, align 8, !alias.scope !168, !noalias !170
  br label %polly.loop_header201.us.us

polly.loop_exit203.loopexit.us.us:                ; preds = %polly.loop_header201.us.us
  %p_add30.us.us.lcssa = phi i64 [ %p_add30.us.us, %polly.loop_header201.us.us ]
  store i64 %p_add30.us.us.lcssa, i64* %scevgep209210.us.us, align 8, !alias.scope !168, !noalias !170
  %polly.indvar_next197.us.us = add nuw nsw i64 %polly.indvar196.us.us, 1
  %polly.loop_cond199.us.us = icmp sgt i64 %polly.indvar196.us.us, %polly.adjust_ub198
  br i1 %polly.loop_cond199.us.us, label %polly.loop_exit194.loopexit.us.loopexit, label %polly.loop_header201.preheader.us.us

polly.loop_header201.us.us:                       ; preds = %polly.loop_header201.us.us, %polly.loop_header201.preheader.us.us
  %p_add30216.us.us = phi i64 [ %p_add30.us.us, %polly.loop_header201.us.us ], [ %scevgep209210.promoted.us.us, %polly.loop_header201.preheader.us.us ]
  %polly.indvar205.us.us = phi i64 [ %polly.indvar_next206.us.us, %polly.loop_header201.us.us ], [ 0, %polly.loop_header201.preheader.us.us ]
  %74 = add nsw i64 %polly.indvar205.us.us, %63
  %75 = add i64 %74, %70
  %scevgep211.us.us = getelementptr i64, i64* %2, i64 %75
  %_p_scalar_212.us.us = load i64, i64* %scevgep211.us.us, align 8, !alias.scope !171, !noalias !173
  %76 = mul i64 %74, %conv
  %77 = add i64 %76, %71
  %scevgep213.us.us = getelementptr i64, i64* %3, i64 %77
  %_p_scalar_214.us.us = load i64, i64* %scevgep213.us.us, align 8, !alias.scope !172, !noalias !174
  %p_mul29.us.us = mul nsw i64 %_p_scalar_214.us.us, %_p_scalar_212.us.us, !dbg !151
  %p_add30.us.us = add nsw i64 %p_mul29.us.us, %p_add30216.us.us, !dbg !157
  %polly.indvar_next206.us.us = add nuw nsw i64 %polly.indvar205.us.us, 1
  %polly.loop_cond208.us.us = icmp sgt i64 %polly.indvar205.us.us, %polly.adjust_ub207
  br i1 %polly.loop_cond208.us.us, label %polly.loop_exit203.loopexit.us.us, label %polly.loop_header201.us.us

polly.loop_exit185.loopexit:                      ; preds = %polly.loop_exit194.loopexit.us
  br label %polly.loop_exit185

polly.loop_exit185:                               ; preds = %polly.loop_exit185.loopexit, %polly.loop_header183.preheader, %polly.loop_header175
  %polly.indvar_next179 = add nuw nsw i64 %polly.indvar178, 1
  %exitcond = icmp eq i64 %polly.indvar178, %pexp.p_div_q
  br i1 %exitcond, label %polly.loop_exit177, label %polly.loop_header175
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %args) #3 !dbg !41 {
entry:
  %max = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !48, metadata !57), !dbg !175
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !49, metadata !57), !dbg !176
  %0 = bitcast i32* %max to i8*, !dbg !177
  call void @llvm.lifetime.start(i64 4, i8* %0) #5, !dbg !177
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 1, !dbg !178
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !178, !tbaa !179
  tail call void @llvm.dbg.value(metadata i32* %max, i64 0, metadata !50, metadata !180), !dbg !181
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %max) #5, !dbg !182
  %2 = load i32, i32* %max, align 4, !dbg !183, !tbaa !184
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !50, metadata !57), !dbg !181
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %2), !dbg !185
  %3 = load i32, i32* %max, align 4, !dbg !186, !tbaa !184
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !50, metadata !57), !dbg !181
  %call2 = call %struct.Matrix* @init(i32 %3, i32 %3), !dbg !187
  call void @llvm.dbg.value(metadata %struct.Matrix* %call2, i64 0, metadata !51, metadata !57), !dbg !189
  %4 = load i32, i32* %max, align 4, !dbg !190, !tbaa !184
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !50, metadata !57), !dbg !181
  %call3 = call %struct.Matrix* @init(i32 %4, i32 %4), !dbg !191
  call void @llvm.dbg.value(metadata %struct.Matrix* %call3, i64 0, metadata !52, metadata !57), !dbg !192
  %call4 = call %struct.Matrix* @mat_mult(%struct.Matrix* %call2, %struct.Matrix* %call3), !dbg !193
  call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !53, metadata !57), !dbg !194
  %5 = load i32, i32* %max, align 4, !dbg !195, !tbaa !184
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !50, metadata !57), !dbg !181
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %5, i32 %5), !dbg !196
  %6 = load i32, i32* %max, align 4, !dbg !197, !tbaa !184
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !50, metadata !57), !dbg !181
  %sub = add nsw i32 %6, -1, !dbg !198
  %add = mul i32 %6, %6, !dbg !199
  %sub8 = add nsw i32 %add, -1, !dbg !200
  %idxprom = sext i32 %sub8 to i64, !dbg !201
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0, !dbg !202
  %7 = load i64*, i64** %data, align 8, !dbg !202, !tbaa !86
  %arrayidx9 = getelementptr inbounds i64, i64* %7, i64 %idxprom, !dbg !201
  %8 = load i64, i64* %arrayidx9, align 8, !dbg !201, !tbaa !146
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call3, i64 0, i32 0, !dbg !203
  %9 = load i64*, i64** %data17, align 8, !dbg !203, !tbaa !86
  %arrayidx18 = getelementptr inbounds i64, i64* %9, i64 %idxprom, !dbg !204
  %10 = load i64, i64* %arrayidx18, align 8, !dbg !204, !tbaa !146
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !205
  %11 = load i64*, i64** %data26, align 8, !dbg !205, !tbaa !86
  %arrayidx27 = getelementptr inbounds i64, i64* %11, i64 %idxprom, !dbg !206
  %12 = load i64, i64* %arrayidx27, align 8, !dbg !206, !tbaa !146
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %6, i32 %sub, i64 %8, i32 %sub, i32 %6, i32 %sub, i64 %10, i32 %sub, i32 %6, i32 %sub, i64 %12), !dbg !207
  call void @llvm.lifetime.end(i64 4, i8* %0) #5, !dbg !208
  ret i32 0, !dbg !210
}

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!54, !55}
!llvm.ident = !{!56}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !6)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten1")
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
!23 = !DILocalVariable(name: "data", scope: !7, file: !1, line: 25, type: !4)
!24 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 39, type: !10)
!25 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 47, type: !26, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: true, variables: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{!10, !10, !10}
!28 = !{!29, !30, !31, !32, !33, !34, !35, !36, !38, !39, !40}
!29 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !1, line: 47, type: !10)
!30 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !1, line: 47, type: !10)
!31 = !DILocalVariable(name: "i", scope: !25, file: !1, line: 48, type: !16)
!32 = !DILocalVariable(name: "j", scope: !25, file: !1, line: 48, type: !16)
!33 = !DILocalVariable(name: "k", scope: !25, file: !1, line: 48, type: !16)
!34 = !DILocalVariable(name: "width", scope: !25, file: !1, line: 49, type: !16)
!35 = !DILocalVariable(name: "height", scope: !25, file: !1, line: 50, type: !16)
!36 = !DILocalVariable(name: "a_data", scope: !25, file: !1, line: 51, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !4)
!38 = !DILocalVariable(name: "b_data", scope: !25, file: !1, line: 51, type: !37)
!39 = !DILocalVariable(name: "data", scope: !25, file: !1, line: 51, type: !37)
!40 = !DILocalVariable(name: "m", scope: !25, file: !1, line: 64, type: !10)
!41 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 72, type: !42, isLocal: false, isDefinition: true, scopeLine: 73, flags: DIFlagPrototyped, isOptimized: true, variables: !47)
!42 = !DISubroutineType(types: !43)
!43 = !{!16, !16, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64, align: 64)
!46 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!47 = !{!48, !49, !50, !51, !52, !53}
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !1, line: 72, type: !16)
!49 = !DILocalVariable(name: "args", arg: 2, scope: !41, file: !1, line: 72, type: !44)
!50 = !DILocalVariable(name: "max", scope: !41, file: !1, line: 75, type: !16)
!51 = !DILocalVariable(name: "a", scope: !41, file: !1, line: 79, type: !10)
!52 = !DILocalVariable(name: "b", scope: !41, file: !1, line: 80, type: !10)
!53 = !DILocalVariable(name: "c", scope: !41, file: !1, line: 82, type: !10)
!54 = !{i32 2, !"Dwarf Version", i32 4}
!55 = !{i32 2, !"Debug Info Version", i32 3}
!56 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!57 = !DIExpression()
!58 = !DILocation(line: 12, column: 18, scope: !7)
!59 = !DILocation(line: 12, column: 29, scope: !7)
!60 = !DILocation(line: 25, column: 60, scope: !7)
!61 = !DILocation(line: 25, column: 59, scope: !7)
!62 = !DILocation(line: 25, column: 66, scope: !7)
!63 = !DILocation(line: 25, column: 65, scope: !7)
!64 = !DILocation(line: 25, column: 35, scope: !65)
!65 = !DILexicalBlockFile(scope: !7, file: !1, discriminator: 1)
!66 = !DILocation(line: 14, column: 9, scope: !7)
!67 = !DILocation(line: 27, column: 16, scope: !68)
!68 = !DILexicalBlockFile(scope: !69, file: !1, discriminator: 1)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 27, column: 5)
!70 = distinct !DILexicalBlock(scope: !7, file: !1, line: 27, column: 5)
!71 = !DILocation(line: 28, column: 20, scope: !72)
!72 = !DILexicalBlockFile(scope: !73, file: !1, discriminator: 1)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 28, column: 9)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 28, column: 9)
!75 = distinct !DILexicalBlock(scope: !69, file: !1, line: 27, column: 30)
!76 = !DILocation(line: 27, column: 5, scope: !68)
!77 = !DILocation(line: 29, column: 19, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !1, line: 28, column: 33)
!79 = !DILocation(line: 29, column: 29, scope: !78)
!80 = distinct !{!80, !81}
!81 = !{!"llvm.loop.unroll.disable"}
!82 = !DILocation(line: 39, column: 17, scope: !65)
!83 = !DILocation(line: 39, column: 17, scope: !7)
!84 = !DILocation(line: 39, column: 13, scope: !7)
!85 = !DILocation(line: 40, column: 13, scope: !7)
!86 = !{!87, !88, i64 0}
!87 = !{!"", !88, i64 0, !91, i64 8, !91, i64 12}
!88 = !{!"any pointer", !89, i64 0}
!89 = !{!"omnipotent char", !90, i64 0}
!90 = !{!"Simple C/C++ TBAA"}
!91 = !{!"int", !89, i64 0}
!92 = !DILocation(line: 41, column: 8, scope: !7)
!93 = !DILocation(line: 41, column: 14, scope: !7)
!94 = !{!87, !91, i64 8}
!95 = !DILocation(line: 42, column: 8, scope: !7)
!96 = !DILocation(line: 42, column: 15, scope: !7)
!97 = !{!87, !91, i64 12}
!98 = !DILocation(line: 44, column: 5, scope: !7)
!99 = distinct !{!99, !100, !"polly.alias.scope.call"}
!100 = distinct !{!100, !"polly.alias.scope.domain"}
!101 = !DILocation(line: 35, column: 47, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 34, column: 33)
!103 = distinct !DILexicalBlock(scope: !104, file: !1, line: 34, column: 9)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 34, column: 9)
!105 = distinct !DILexicalBlock(scope: !106, file: !1, line: 33, column: 30)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 33, column: 5)
!107 = distinct !DILexicalBlock(scope: !7, file: !1, line: 33, column: 5)
!108 = !DILocation(line: 47, column: 26, scope: !25)
!109 = !DILocation(line: 47, column: 37, scope: !25)
!110 = !DILocation(line: 49, column: 20, scope: !25)
!111 = !DILocation(line: 49, column: 9, scope: !25)
!112 = !DILocation(line: 50, column: 21, scope: !25)
!113 = !DILocation(line: 50, column: 9, scope: !25)
!114 = !DILocation(line: 52, column: 17, scope: !25)
!115 = !DILocation(line: 51, column: 29, scope: !25)
!116 = !DILocation(line: 53, column: 17, scope: !25)
!117 = !DILocation(line: 51, column: 51, scope: !25)
!118 = !DILocation(line: 54, column: 49, scope: !25)
!119 = !DILocation(line: 54, column: 48, scope: !25)
!120 = !DILocation(line: 54, column: 55, scope: !25)
!121 = !DILocation(line: 54, column: 54, scope: !25)
!122 = !DILocation(line: 54, column: 24, scope: !25)
!123 = !DILocation(line: 54, column: 12, scope: !25)
!124 = !DILocation(line: 51, column: 73, scope: !25)
!125 = !DILocation(line: 48, column: 9, scope: !25)
!126 = !DILocation(line: 56, column: 15, scope: !127)
!127 = !DILexicalBlockFile(scope: !128, file: !1, discriminator: 1)
!128 = distinct !DILexicalBlock(scope: !129, file: !1, line: 56, column: 5)
!129 = distinct !DILexicalBlock(scope: !25, file: !1, line: 56, column: 5)
!130 = !DILocation(line: 56, column: 5, scope: !127)
!131 = !DILocation(line: 57, column: 19, scope: !132)
!132 = !DILexicalBlockFile(scope: !133, file: !1, discriminator: 1)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 57, column: 9)
!134 = distinct !DILexicalBlock(scope: !135, file: !1, line: 57, column: 9)
!135 = distinct !DILexicalBlock(scope: !128, file: !1, line: 56, column: 29)
!136 = !DILocation(line: 57, column: 9, scope: !132)
!137 = !DILocation(line: 59, column: 13, scope: !138)
!138 = !DILexicalBlockFile(scope: !139, file: !1, discriminator: 1)
!139 = distinct !DILexicalBlock(scope: !140, file: !1, line: 59, column: 13)
!140 = distinct !DILexicalBlock(scope: !141, file: !1, line: 59, column: 13)
!141 = distinct !DILexicalBlock(scope: !133, file: !1, line: 57, column: 34)
!142 = !DILocation(line: 58, column: 19, scope: !141)
!143 = !DILocation(line: 58, column: 25, scope: !141)
!144 = !DILocation(line: 58, column: 13, scope: !141)
!145 = !DILocation(line: 58, column: 29, scope: !141)
!146 = !{!147, !147, i64 0}
!147 = !{!"long long", !89, i64 0}
!148 = !DILocation(line: 48, column: 15, scope: !25)
!149 = !DILocation(line: 60, column: 53, scope: !139)
!150 = !DILocation(line: 60, column: 73, scope: !139)
!151 = !DILocation(line: 60, column: 71, scope: !139)
!152 = !DILocation(line: 60, column: 33, scope: !139)
!153 = !DILocation(line: 60, column: 35, scope: !139)
!154 = !DILocation(line: 60, column: 67, scope: !139)
!155 = !DILocation(line: 60, column: 81, scope: !139)
!156 = !DILocation(line: 60, column: 87, scope: !139)
!157 = !DILocation(line: 60, column: 51, scope: !139)
!158 = !DILocation(line: 64, column: 17, scope: !159)
!159 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 1)
!160 = !DILocation(line: 64, column: 17, scope: !25)
!161 = !DILocation(line: 64, column: 13, scope: !25)
!162 = !DILocation(line: 65, column: 8, scope: !25)
!163 = !DILocation(line: 65, column: 14, scope: !25)
!164 = !DILocation(line: 66, column: 8, scope: !25)
!165 = !DILocation(line: 66, column: 15, scope: !25)
!166 = !DILocation(line: 67, column: 13, scope: !25)
!167 = !DILocation(line: 68, column: 5, scope: !25)
!168 = distinct !{!168, !169, !"polly.alias.scope.call"}
!169 = distinct !{!169, !"polly.alias.scope.domain"}
!170 = !{!171, !172}
!171 = distinct !{!171, !169, !"polly.alias.scope."}
!172 = distinct !{!172, !169, !"polly.alias.scope."}
!173 = !{!168, !172}
!174 = !{!168, !171}
!175 = !DILocation(line: 72, column: 14, scope: !41)
!176 = !DILocation(line: 72, column: 27, scope: !41)
!177 = !DILocation(line: 75, column: 5, scope: !41)
!178 = !DILocation(line: 76, column: 12, scope: !41)
!179 = !{!88, !88, i64 0}
!180 = !DIExpression(DW_OP_deref)
!181 = !DILocation(line: 75, column: 9, scope: !41)
!182 = !DILocation(line: 76, column: 5, scope: !41)
!183 = !DILocation(line: 77, column: 24, scope: !41)
!184 = !{!91, !91, i64 0}
!185 = !DILocation(line: 77, column: 5, scope: !41)
!186 = !DILocation(line: 79, column: 22, scope: !41)
!187 = !DILocation(line: 79, column: 17, scope: !188)
!188 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 1)
!189 = !DILocation(line: 79, column: 13, scope: !41)
!190 = !DILocation(line: 80, column: 22, scope: !41)
!191 = !DILocation(line: 80, column: 17, scope: !188)
!192 = !DILocation(line: 80, column: 13, scope: !41)
!193 = !DILocation(line: 82, column: 17, scope: !188)
!194 = !DILocation(line: 82, column: 13, scope: !41)
!195 = !DILocation(line: 84, column: 48, scope: !41)
!196 = !DILocation(line: 84, column: 5, scope: !41)
!197 = !DILocation(line: 86, column: 9, scope: !41)
!198 = !DILocation(line: 86, column: 12, scope: !41)
!199 = !DILocation(line: 86, column: 47, scope: !41)
!200 = !DILocation(line: 86, column: 51, scope: !41)
!201 = !DILocation(line: 86, column: 28, scope: !41)
!202 = !DILocation(line: 86, column: 31, scope: !41)
!203 = !DILocation(line: 87, column: 31, scope: !41)
!204 = !DILocation(line: 87, column: 28, scope: !41)
!205 = !DILocation(line: 88, column: 31, scope: !41)
!206 = !DILocation(line: 88, column: 28, scope: !41)
!207 = !DILocation(line: 85, column: 5, scope: !41)
!208 = !DILocation(line: 90, column: 1, scope: !209)
!209 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 3)
!210 = !DILocation(line: 89, column: 5, scope: !41)
