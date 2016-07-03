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
  tail call void @llvm.dbg.value(metadata i32 %width, i64 0, metadata !19, metadata !56), !dbg !57
  tail call void @llvm.dbg.value(metadata i32 %height, i64 0, metadata !20, metadata !56), !dbg !58
  %conv = sext i32 %width to i64, !dbg !59
  %mul = shl nsw i64 %conv, 3, !dbg !60
  %conv1 = sext i32 %height to i64, !dbg !61
  %mul2 = mul i64 %mul, %conv1, !dbg !62
  %call = tail call noalias i8* @malloc(i64 %mul2) #5, !dbg !63
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !21, metadata !56), !dbg !65
  %cmp77 = icmp sgt i32 %height, 0, !dbg !66
  %cmp575 = icmp sgt i32 %width, 0, !dbg !70
  %or.cond = and i1 %cmp77, %cmp575, !dbg !75
  br i1 %or.cond, label %for.cond4.preheader.us.preheader, label %polly.start, !dbg !75

for.cond4.preheader.us.preheader:                 ; preds = %entry
  %0 = add i32 %width, -1, !dbg !76
  %1 = zext i32 %0 to i64, !dbg !76
  %2 = shl nuw nsw i64 %1, 3, !dbg !76
  %3 = add nuw nsw i64 %2, 8, !dbg !76
  %4 = add i32 %height, -1, !dbg !76
  %xtraiter = and i32 %height, 7, !dbg !76
  %lcmp.mod = icmp eq i32 %xtraiter, 0, !dbg !76
  br i1 %lcmp.mod, label %for.cond4.preheader.us.preheader.split, label %for.cond4.preheader.us.prol.preheader, !dbg !76

for.cond4.preheader.us.prol.preheader:            ; preds = %for.cond4.preheader.us.preheader
  br label %for.cond4.preheader.us.prol, !dbg !76

for.cond4.preheader.us.prol:                      ; preds = %for.cond4.preheader.us.prol.preheader, %for.cond4.preheader.us.prol
  %indvars.iv91.us.prol = phi i64 [ %indvars.iv.next92.us.prol, %for.cond4.preheader.us.prol ], [ 0, %for.cond4.preheader.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond4.preheader.us.prol ], [ %xtraiter, %for.cond4.preheader.us.prol.preheader ]
  %5 = mul i64 %mul, %indvars.iv91.us.prol, !dbg !76
  %scevgep.prol = getelementptr i8, i8* %call, i64 %5, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %3, i32 8, i1 false), !dbg !78
  %indvars.iv.next92.us.prol = add nuw nsw i64 %indvars.iv91.us.prol, 1, !dbg !75
  %prol.iter.sub = add i32 %prol.iter, -1, !dbg !75
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0, !dbg !75
  br i1 %prol.iter.cmp, label %for.cond4.preheader.us.preheader.split.loopexit, label %for.cond4.preheader.us.prol, !dbg !75, !llvm.loop !79

for.cond4.preheader.us.preheader.split.loopexit:  ; preds = %for.cond4.preheader.us.prol
  %indvars.iv.next92.us.prol.lcssa = phi i64 [ %indvars.iv.next92.us.prol, %for.cond4.preheader.us.prol ]
  br label %for.cond4.preheader.us.preheader.split, !dbg !76

for.cond4.preheader.us.preheader.split:           ; preds = %for.cond4.preheader.us.preheader.split.loopexit, %for.cond4.preheader.us.preheader
  %indvars.iv91.us.unr = phi i64 [ 0, %for.cond4.preheader.us.preheader ], [ %indvars.iv.next92.us.prol.lcssa, %for.cond4.preheader.us.preheader.split.loopexit ]
  %6 = icmp ult i32 %4, 7, !dbg !76
  br i1 %6, label %polly.start.loopexit, label %for.cond4.preheader.us.preheader.split.split, !dbg !76

for.cond4.preheader.us.preheader.split.split:     ; preds = %for.cond4.preheader.us.preheader.split
  br label %for.cond4.preheader.us, !dbg !76

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us, %for.cond4.preheader.us.preheader.split.split
  %indvars.iv91.us = phi i64 [ %indvars.iv91.us.unr, %for.cond4.preheader.us.preheader.split.split ], [ %indvars.iv.next92.us.7, %for.cond4.preheader.us ]
  %7 = mul i64 %mul, %indvars.iv91.us, !dbg !76
  %scevgep = getelementptr i8, i8* %call, i64 %7, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %3, i32 8, i1 false), !dbg !78
  %indvars.iv.next92.us = add nuw nsw i64 %indvars.iv91.us, 1, !dbg !75
  %8 = mul i64 %mul, %indvars.iv.next92.us, !dbg !76
  %scevgep.1 = getelementptr i8, i8* %call, i64 %8, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %3, i32 8, i1 false), !dbg !78
  %indvars.iv.next92.us.1 = add nsw i64 %indvars.iv91.us, 2, !dbg !75
  %9 = mul i64 %mul, %indvars.iv.next92.us.1, !dbg !76
  %scevgep.2 = getelementptr i8, i8* %call, i64 %9, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %3, i32 8, i1 false), !dbg !78
  %indvars.iv.next92.us.2 = add nsw i64 %indvars.iv91.us, 3, !dbg !75
  %10 = mul i64 %mul, %indvars.iv.next92.us.2, !dbg !76
  %scevgep.3 = getelementptr i8, i8* %call, i64 %10, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %3, i32 8, i1 false), !dbg !78
  %indvars.iv.next92.us.3 = add nsw i64 %indvars.iv91.us, 4, !dbg !75
  %11 = mul i64 %mul, %indvars.iv.next92.us.3, !dbg !76
  %scevgep.4 = getelementptr i8, i8* %call, i64 %11, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %3, i32 8, i1 false), !dbg !78
  %indvars.iv.next92.us.4 = add nsw i64 %indvars.iv91.us, 5, !dbg !75
  %12 = mul i64 %mul, %indvars.iv.next92.us.4, !dbg !76
  %scevgep.5 = getelementptr i8, i8* %call, i64 %12, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %3, i32 8, i1 false), !dbg !78
  %indvars.iv.next92.us.5 = add nsw i64 %indvars.iv91.us, 6, !dbg !75
  %13 = mul i64 %mul, %indvars.iv.next92.us.5, !dbg !76
  %scevgep.6 = getelementptr i8, i8* %call, i64 %13, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %3, i32 8, i1 false), !dbg !78
  %indvars.iv.next92.us.6 = add nsw i64 %indvars.iv91.us, 7, !dbg !75
  %14 = mul i64 %mul, %indvars.iv.next92.us.6, !dbg !76
  %scevgep.7 = getelementptr i8, i8* %call, i64 %14, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %3, i32 8, i1 false), !dbg !78
  %indvars.iv.next92.us.7 = add nsw i64 %indvars.iv91.us, 8, !dbg !75
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next92.us.7 to i32, !dbg !75
  %exitcond149.7 = icmp eq i32 %lftr.wideiv.7, %height, !dbg !75
  br i1 %exitcond149.7, label %polly.start.loopexit.unr-lcssa, label %for.cond4.preheader.us, !dbg !75

polly.start.loopexit.unr-lcssa:                   ; preds = %for.cond4.preheader.us
  br label %polly.start.loopexit

polly.start.loopexit:                             ; preds = %for.cond4.preheader.us.preheader.split, %polly.start.loopexit.unr-lcssa
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
  br label %polly.exiting, !dbg !81

polly.exiting:                                    ; preds = %polly.exiting.loopexit, %polly.start
  %call36 = tail call noalias i8* @malloc(i64 16) #5, !dbg !81
  %17 = bitcast i8* %call36 to %struct.Matrix*, !dbg !82
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %17, i64 0, metadata !24, metadata !56), !dbg !83
  %18 = bitcast i8* %call36 to i8**, !dbg !84
  store i8* %call, i8** %18, align 8, !dbg !84, !tbaa !85
  %width38 = getelementptr inbounds i8, i8* %call36, i64 8, !dbg !91
  %19 = bitcast i8* %width38 to i32*, !dbg !91
  store i32 %width, i32* %19, align 8, !dbg !92, !tbaa !93
  %height39 = getelementptr inbounds i8, i8* %call36, i64 12, !dbg !94
  %20 = bitcast i8* %height39 to i32*, !dbg !94
  store i32 %height, i32* %20, align 4, !dbg !95, !tbaa !96
  ret %struct.Matrix* %17, !dbg !97

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
  br i1 %polly.loop_guard110, label %polly.loop_header98.us.preheader, label %polly.loop_exit100

polly.loop_header98.us.preheader:                 ; preds = %polly.loop_header98.preheader
  br label %polly.loop_header98.us

polly.loop_header98.us:                           ; preds = %polly.loop_header98.us.preheader, %polly.loop_exit109.loopexit.us
  %polly.indvar102.us = phi i64 [ %polly.indvar_next103.us, %polly.loop_exit109.loopexit.us ], [ 0, %polly.loop_header98.us.preheader ]
  %26 = shl nsw i64 %polly.indvar102.us, 5
  %27 = sub nsw i64 %conv, %26
  %28 = add nsw i64 %27, -1
  %29 = icmp sgt i64 %28, 31
  %30 = select i1 %29, i64 31, i64 %28
  %polly.loop_guard119.us = icmp sgt i64 %30, -1
  %polly.adjust_ub122.us = add i64 %30, -1
  br i1 %polly.loop_guard119.us, label %polly.loop_header107.us.us.preheader, label %polly.loop_exit109.loopexit.us

polly.loop_header107.us.us.preheader:             ; preds = %polly.loop_header98.us
  br label %polly.loop_header107.us.us

polly.loop_exit109.loopexit.us.loopexit:          ; preds = %polly.loop_exit118.loopexit.us.us
  br label %polly.loop_exit109.loopexit.us

polly.loop_exit109.loopexit.us:                   ; preds = %polly.loop_exit109.loopexit.us.loopexit, %polly.loop_header98.us
  %polly.indvar_next103.us = add nuw nsw i64 %polly.indvar102.us, 1
  %exitcond = icmp eq i64 %polly.indvar102.us, %polly.fdiv_q.shr96
  br i1 %exitcond, label %polly.loop_exit100.loopexit, label %polly.loop_header98.us

polly.loop_header107.us.us:                       ; preds = %polly.loop_header107.us.us.preheader, %polly.loop_exit118.loopexit.us.us
  %polly.indvar111.us.us = phi i64 [ %polly.indvar_next112.us.us, %polly.loop_exit118.loopexit.us.us ], [ 0, %polly.loop_header107.us.us.preheader ]
  %31 = add nuw nsw i64 %polly.indvar111.us.us, %21
  %32 = mul i64 %31, %mul
  br label %polly.loop_header116.us.us

polly.loop_exit118.loopexit.us.us:                ; preds = %polly.loop_header116.us.us
  %polly.indvar_next112.us.us = add nuw nsw i64 %polly.indvar111.us.us, 1
  %polly.loop_cond114.us.us = icmp sgt i64 %polly.indvar111.us.us, %polly.adjust_ub113
  br i1 %polly.loop_cond114.us.us, label %polly.loop_exit109.loopexit.us.loopexit, label %polly.loop_header107.us.us

polly.loop_header116.us.us:                       ; preds = %polly.loop_header116.us.us, %polly.loop_header107.us.us
  %polly.indvar120.us.us = phi i64 [ %polly.indvar_next121.us.us, %polly.loop_header116.us.us ], [ 0, %polly.loop_header107.us.us ]
  %33 = add nuw nsw i64 %polly.indvar120.us.us, %26
  %34 = shl i64 %33, 3
  %35 = add i64 %34, %32
  %scevgep.us.us = getelementptr i8, i8* %call, i64 %35
  %scevgep124.us.us = bitcast i8* %scevgep.us.us to i64*
  %_p_scalar_.us.us = load i64, i64* %scevgep124.us.us, align 8, !alias.scope !98, !noalias !2
  %p_add25.us.us = add nsw i64 %_p_scalar_.us.us, %31, !dbg !100
  store i64 %p_add25.us.us, i64* %scevgep124.us.us, align 8, !alias.scope !98, !noalias !2
  %polly.indvar_next121.us.us = add nuw nsw i64 %polly.indvar120.us.us, 1
  %polly.loop_cond123.us.us = icmp sgt i64 %polly.indvar120.us.us, %polly.adjust_ub122.us
  br i1 %polly.loop_cond123.us.us, label %polly.loop_exit118.loopexit.us.us, label %polly.loop_header116.us.us

polly.loop_exit100.loopexit:                      ; preds = %polly.loop_exit109.loopexit.us
  br label %polly.loop_exit100

polly.loop_exit100:                               ; preds = %polly.loop_exit100.loopexit, %polly.loop_header98.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond147 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond147, label %polly.exiting.loopexit, label %polly.loop_header
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
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !29, metadata !56), !dbg !107
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !30, metadata !56), !dbg !108
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !109
  %0 = load i32, i32* %width1, align 8, !dbg !109, !tbaa !93
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !34, metadata !56), !dbg !110
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !111
  %1 = load i32, i32* %height2, align 4, !dbg !111, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !35, metadata !56), !dbg !112
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !113
  %2 = load i64*, i64** %data, align 8, !dbg !113, !tbaa !85
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !36, metadata !56), !dbg !114
  %data3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !115
  %3 = load i64*, i64** %data3, align 8, !dbg !115, !tbaa !85
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !37, metadata !56), !dbg !116
  %conv = sext i32 %0 to i64, !dbg !117
  %mul = shl nsw i64 %conv, 3, !dbg !118
  %conv5 = sext i32 %1 to i64, !dbg !119
  %mul6 = mul i64 %mul, %conv5, !dbg !120
  %call = tail call noalias i8* @malloc(i64 %mul6) #5, !dbg !121
  %4 = bitcast i8* %call to i64*, !dbg !123
  tail call void @llvm.dbg.value(metadata i64* %4, i64 0, metadata !38, metadata !56), !dbg !124
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !31, metadata !56), !dbg !125
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
  br i1 %cmp986, label %for.cond8.preheader.us.preheader, label %for.end40, !dbg !136

for.cond8.preheader.us.preheader:                 ; preds = %for.cond8.preheader.preheader
  %xtraiter = and i32 %0, 1, !dbg !137
  %lcmp.mod = icmp eq i32 %xtraiter, 0, !dbg !137
  %15 = icmp eq i32 %0, 1, !dbg !137
  br label %for.cond8.preheader.us, !dbg !142

for.cond8.preheader.us:                           ; preds = %for.cond8.preheader.us.preheader, %for.inc38.loopexit.us
  %indvars.iv100.us = phi i64 [ %indvars.iv.next101.us, %for.inc38.loopexit.us ], [ 0, %for.cond8.preheader.us.preheader ]
  %16 = mul nsw i64 %indvars.iv100.us, %conv, !dbg !142
  %arrayidx24.us.prol = getelementptr inbounds i64, i64* %2, i64 %16, !dbg !143
  br label %for.body11.us, !dbg !142

for.body11.us:                                    ; preds = %for.cond8.preheader.us, %for.inc35.us
  %indvars.iv95.us = phi i64 [ %indvars.iv.next96.us, %for.inc35.us ], [ 0, %for.cond8.preheader.us ]
  %17 = add nsw i64 %indvars.iv95.us, %16, !dbg !144
  %arrayidx.us = getelementptr inbounds i64, i64* %4, i64 %17, !dbg !145
  store i64 0, i64* %arrayidx.us, align 8, !dbg !146, !tbaa !147
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !56), !dbg !149
  br i1 %lcmp.mod, label %for.body11.us.split, label %for.body16.us.prol, !dbg !137

for.body16.us.prol:                               ; preds = %for.body11.us
  %18 = load i64, i64* %arrayidx24.us.prol, align 8, !dbg !143, !tbaa !147
  %arrayidx28.us.prol = getelementptr inbounds i64, i64* %3, i64 %indvars.iv95.us, !dbg !150
  %19 = load i64, i64* %arrayidx28.us.prol, align 8, !dbg !150, !tbaa !147
  %mul29.us.prol = mul nsw i64 %19, %18, !dbg !151
  store i64 %mul29.us.prol, i64* %arrayidx.us, align 8, !dbg !152, !tbaa !147
  br label %for.body11.us.split, !dbg !137

for.body11.us.split:                              ; preds = %for.body11.us, %for.body16.us.prol
  %.unr = phi i64 [ 0, %for.body11.us ], [ %mul29.us.prol, %for.body16.us.prol ]
  %indvars.iv.us.unr = phi i64 [ 0, %for.body11.us ], [ 1, %for.body16.us.prol ]
  br i1 %15, label %for.inc35.us, label %for.body11.us.split.split, !dbg !137

for.body11.us.split.split:                        ; preds = %for.body11.us.split
  br label %for.body16.us, !dbg !137

for.body16.us:                                    ; preds = %for.body16.us, %for.body11.us.split.split
  %20 = phi i64 [ %.unr, %for.body11.us.split.split ], [ %add30.us.1, %for.body16.us ], !dbg !153
  %indvars.iv.us = phi i64 [ %indvars.iv.us.unr, %for.body11.us.split.split ], [ %indvars.iv.next.us.1, %for.body16.us ]
  %21 = add nsw i64 %indvars.iv.us, %16, !dbg !154
  %arrayidx24.us = getelementptr inbounds i64, i64* %2, i64 %21, !dbg !143
  %22 = load i64, i64* %arrayidx24.us, align 8, !dbg !143, !tbaa !147
  %23 = mul nsw i64 %indvars.iv.us, %conv, !dbg !155
  %24 = add nsw i64 %23, %indvars.iv95.us, !dbg !156
  %arrayidx28.us = getelementptr inbounds i64, i64* %3, i64 %24, !dbg !150
  %25 = load i64, i64* %arrayidx28.us, align 8, !dbg !150, !tbaa !147
  %mul29.us = mul nsw i64 %25, %22, !dbg !151
  %add30.us = add nsw i64 %mul29.us, %20, !dbg !157
  store i64 %add30.us, i64* %arrayidx.us, align 8, !dbg !152, !tbaa !147
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1, !dbg !137
  %26 = add nsw i64 %indvars.iv.next.us, %16, !dbg !154
  %arrayidx24.us.1 = getelementptr inbounds i64, i64* %2, i64 %26, !dbg !143
  %27 = load i64, i64* %arrayidx24.us.1, align 8, !dbg !143, !tbaa !147
  %28 = mul nsw i64 %indvars.iv.next.us, %conv, !dbg !155
  %29 = add nsw i64 %28, %indvars.iv95.us, !dbg !156
  %arrayidx28.us.1 = getelementptr inbounds i64, i64* %3, i64 %29, !dbg !150
  %30 = load i64, i64* %arrayidx28.us.1, align 8, !dbg !150, !tbaa !147
  %mul29.us.1 = mul nsw i64 %30, %27, !dbg !151
  %add30.us.1 = add nsw i64 %mul29.us.1, %add30.us, !dbg !157
  store i64 %add30.us.1, i64* %arrayidx.us, align 8, !dbg !152, !tbaa !147
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2, !dbg !137
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.us.1 to i32, !dbg !137
  %exitcond270.1 = icmp eq i32 %lftr.wideiv.1, %0, !dbg !137
  br i1 %exitcond270.1, label %for.inc35.us.unr-lcssa, label %for.body16.us, !dbg !137

for.inc35.us.unr-lcssa:                           ; preds = %for.body16.us
  br label %for.inc35.us, !dbg !136

for.inc35.us:                                     ; preds = %for.body11.us.split, %for.inc35.us.unr-lcssa
  %indvars.iv.next96.us = add nuw nsw i64 %indvars.iv95.us, 1, !dbg !136
  %lftr.wideiv271 = trunc i64 %indvars.iv.next96.us to i32, !dbg !136
  %exitcond272 = icmp eq i32 %lftr.wideiv271, %1, !dbg !136
  br i1 %exitcond272, label %for.inc38.loopexit.us, label %for.body11.us, !dbg !136

for.inc38.loopexit.us:                            ; preds = %for.inc35.us
  %indvars.iv.next101.us = add nuw nsw i64 %indvars.iv100.us, 1, !dbg !130
  %lftr.wideiv274 = trunc i64 %indvars.iv.next101.us to i32, !dbg !130
  %exitcond275 = icmp eq i32 %lftr.wideiv274, %0, !dbg !130
  br i1 %exitcond275, label %for.end40.loopexit281, label %for.cond8.preheader.us, !dbg !130

for.end40.loopexit:                               ; preds = %polly.loop_exit169
  br label %for.end40, !dbg !158

for.end40.loopexit281:                            ; preds = %for.inc38.loopexit.us
  br label %for.end40, !dbg !158

for.end40:                                        ; preds = %for.end40.loopexit281, %for.end40.loopexit, %for.cond8.preheader.preheader, %polly.start, %entry
  %call41 = tail call noalias i8* @malloc(i64 16) #5, !dbg !158
  %31 = bitcast i8* %call41 to %struct.Matrix*, !dbg !159
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %31, i64 0, metadata !39, metadata !56), !dbg !160
  %width42 = getelementptr inbounds i8, i8* %call41, i64 8, !dbg !161
  %32 = bitcast i8* %width42 to i32*, !dbg !161
  store i32 %0, i32* %32, align 8, !dbg !162, !tbaa !93
  %height43 = getelementptr inbounds i8, i8* %call41, i64 12, !dbg !163
  %33 = bitcast i8* %height43 to i32*, !dbg !163
  store i32 %1, i32* %33, align 4, !dbg !164, !tbaa !96
  %34 = bitcast i8* %call41 to i8**, !dbg !165
  store i8* %call, i8** %34, align 8, !dbg !165, !tbaa !85
  ret %struct.Matrix* %31, !dbg !166

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
  br i1 %polly.loop_guard140, label %polly.loop_header128.us.preheader, label %polly.loop_exit130

polly.loop_header128.us.preheader:                ; preds = %polly.loop_header128.preheader
  br label %polly.loop_header128.us

polly.loop_header128.us:                          ; preds = %polly.loop_header128.us.preheader, %polly.loop_exit139.loopexit.us
  %polly.indvar132.us = phi i64 [ %polly.indvar_next133.us, %polly.loop_exit139.loopexit.us ], [ 0, %polly.loop_header128.us.preheader ]
  %45 = shl i64 %polly.indvar132.us, 8
  %46 = add i64 %39, %45
  %47 = shl i64 %polly.indvar132.us, 5
  %48 = sub i64 %47, %conv5
  %49 = icmp sgt i64 %48, -32
  %smax = select i1 %49, i64 %48, i64 -32
  %50 = mul i64 %smax, -8
  %polly.loop_guard149.us278 = icmp slt i64 %47, %conv5
  br i1 %polly.loop_guard149.us278, label %polly.loop_header137.us.us.preheader, label %polly.loop_exit139.loopexit.us

polly.loop_header137.us.us.preheader:             ; preds = %polly.loop_header128.us
  br label %polly.loop_header137.us.us

polly.loop_exit139.loopexit.us.loopexit:          ; preds = %polly.loop_header137.us.us
  br label %polly.loop_exit139.loopexit.us

polly.loop_exit139.loopexit.us:                   ; preds = %polly.loop_exit139.loopexit.us.loopexit, %polly.loop_header128.us
  %polly.indvar_next133.us = add nuw nsw i64 %polly.indvar132.us, 1
  %exitcond268 = icmp eq i64 %polly.indvar_next133.us, %36
  br i1 %exitcond268, label %polly.loop_exit130.loopexit, label %polly.loop_header128.us

polly.loop_header137.us.us:                       ; preds = %polly.loop_header137.us.us.preheader, %polly.loop_header137.us.us
  %polly.indvar141.us.us = phi i64 [ %polly.indvar_next142.us.us, %polly.loop_header137.us.us ], [ 0, %polly.loop_header137.us.us.preheader ]
  %51 = mul nsw i64 %mul, %polly.indvar141.us.us
  %52 = add i64 %46, %51
  %scevgep = getelementptr i8, i8* %call, i64 %52
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %50, i32 8, i1 false)
  %polly.indvar_next142.us.us = add nuw nsw i64 %polly.indvar141.us.us, 1
  %polly.loop_cond144.us.us = icmp sgt i64 %polly.indvar141.us.us, %polly.adjust_ub143
  br i1 %polly.loop_cond144.us.us, label %polly.loop_exit139.loopexit.us.loopexit, label %polly.loop_header137.us.us

polly.loop_exit130.loopexit:                      ; preds = %polly.loop_exit139.loopexit.us
  br label %polly.loop_exit130

polly.loop_exit130:                               ; preds = %polly.loop_exit130.loopexit, %polly.loop_header128.preheader, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond269 = icmp eq i64 %polly.indvar_next, %38
  br i1 %exitcond269, label %polly.loop_header157.preheader, label %polly.loop_header

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
  %exitcond266 = icmp eq i64 %polly.indvar_next162, %38
  br i1 %exitcond266, label %for.end40.loopexit, label %polly.loop_header157

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
  %exitcond265 = icmp eq i64 %polly.indvar_next172, %36
  br i1 %exitcond265, label %polly.loop_exit169.loopexit, label %polly.loop_header167

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
  br i1 %polly.loop_guard195, label %polly.loop_header183.us.preheader, label %polly.loop_exit185

polly.loop_header183.us.preheader:                ; preds = %polly.loop_header183.preheader
  br label %polly.loop_header183.us

polly.loop_header183.us:                          ; preds = %polly.loop_header183.us.preheader, %polly.loop_exit194.loopexit.us
  %polly.indvar187.us = phi i64 [ %polly.indvar_next188.us, %polly.loop_exit194.loopexit.us ], [ 0, %polly.loop_header183.us.preheader ]
  %68 = add nuw nsw i64 %polly.indvar187.us, %53
  %69 = mul i64 %68, %mul
  %70 = mul i64 %68, %conv
  br i1 %polly.loop_guard204, label %polly.loop_header192.us.us.preheader, label %polly.loop_exit194.loopexit.us

polly.loop_header192.us.us.preheader:             ; preds = %polly.loop_header183.us
  br label %polly.loop_header192.us.us

polly.loop_exit194.loopexit.us.loopexit:          ; preds = %polly.loop_exit203.loopexit.us.us
  br label %polly.loop_exit194.loopexit.us

polly.loop_exit194.loopexit.us:                   ; preds = %polly.loop_exit194.loopexit.us.loopexit, %polly.loop_header183.us
  %polly.indvar_next188.us = add nuw nsw i64 %polly.indvar187.us, 1
  %polly.loop_cond190.us = icmp sgt i64 %polly.indvar187.us, %polly.adjust_ub189
  br i1 %polly.loop_cond190.us, label %polly.loop_exit185.loopexit, label %polly.loop_header183.us

polly.loop_header192.us.us:                       ; preds = %polly.loop_header192.us.us.preheader, %polly.loop_exit203.loopexit.us.us
  %polly.indvar196.us.us = phi i64 [ %polly.indvar_next197.us.us, %polly.loop_exit203.loopexit.us.us ], [ 0, %polly.loop_header192.us.us.preheader ]
  %71 = add nuw nsw i64 %polly.indvar196.us.us, %58
  %72 = shl i64 %71, 3
  %73 = add i64 %72, %69
  %scevgep209.us.us = getelementptr i8, i8* %call, i64 %73
  %scevgep209210.us.us = bitcast i8* %scevgep209.us.us to i64*
  %scevgep209210.promoted.us.us = load i64, i64* %scevgep209210.us.us, align 8, !alias.scope !167, !noalias !169
  br label %polly.loop_header201.us.us

polly.loop_exit203.loopexit.us.us:                ; preds = %polly.loop_header201.us.us
  %p_add30.us.us.lcssa = phi i64 [ %p_add30.us.us, %polly.loop_header201.us.us ]
  store i64 %p_add30.us.us.lcssa, i64* %scevgep209210.us.us, align 8, !alias.scope !167, !noalias !169
  %polly.indvar_next197.us.us = add nuw nsw i64 %polly.indvar196.us.us, 1
  %polly.loop_cond199.us.us = icmp sgt i64 %polly.indvar196.us.us, %polly.adjust_ub198
  br i1 %polly.loop_cond199.us.us, label %polly.loop_exit194.loopexit.us.loopexit, label %polly.loop_header192.us.us

polly.loop_header201.us.us:                       ; preds = %polly.loop_header201.us.us, %polly.loop_header192.us.us
  %p_add30216.us.us = phi i64 [ %p_add30.us.us, %polly.loop_header201.us.us ], [ %scevgep209210.promoted.us.us, %polly.loop_header192.us.us ]
  %polly.indvar205.us.us = phi i64 [ %polly.indvar_next206.us.us, %polly.loop_header201.us.us ], [ 0, %polly.loop_header192.us.us ]
  %74 = add nsw i64 %polly.indvar205.us.us, %63
  %75 = add i64 %74, %70
  %scevgep211.us.us = getelementptr i64, i64* %2, i64 %75
  %_p_scalar_212.us.us = load i64, i64* %scevgep211.us.us, align 8, !alias.scope !170, !noalias !172
  %76 = mul i64 %74, %conv
  %77 = add i64 %76, %71
  %scevgep213.us.us = getelementptr i64, i64* %3, i64 %77
  %_p_scalar_214.us.us = load i64, i64* %scevgep213.us.us, align 8, !alias.scope !171, !noalias !173
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
define i32 @main(i32 %argc, i8** nocapture readonly %args) #3 !dbg !40 {
entry:
  %max = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !47, metadata !56), !dbg !174
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !48, metadata !56), !dbg !175
  %0 = bitcast i32* %max to i8*, !dbg !176
  call void @llvm.lifetime.start(i64 4, i8* %0) #5, !dbg !176
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 1, !dbg !177
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !177, !tbaa !178
  tail call void @llvm.dbg.value(metadata i32* %max, i64 0, metadata !49, metadata !179), !dbg !180
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %max) #5, !dbg !181
  %2 = load i32, i32* %max, align 4, !dbg !182, !tbaa !183
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !49, metadata !56), !dbg !180
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %2), !dbg !184
  %3 = load i32, i32* %max, align 4, !dbg !185, !tbaa !183
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !49, metadata !56), !dbg !180
  %call2 = call %struct.Matrix* @init(i32 %3, i32 %3), !dbg !186
  call void @llvm.dbg.value(metadata %struct.Matrix* %call2, i64 0, metadata !50, metadata !56), !dbg !188
  %4 = load i32, i32* %max, align 4, !dbg !189, !tbaa !183
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !49, metadata !56), !dbg !180
  %call3 = call %struct.Matrix* @init(i32 %4, i32 %4), !dbg !190
  call void @llvm.dbg.value(metadata %struct.Matrix* %call3, i64 0, metadata !51, metadata !56), !dbg !191
  %call4 = call %struct.Matrix* @mat_mult(%struct.Matrix* %call2, %struct.Matrix* %call3), !dbg !192
  call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !52, metadata !56), !dbg !193
  %5 = load i32, i32* %max, align 4, !dbg !194, !tbaa !183
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !49, metadata !56), !dbg !180
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %5, i32 %5), !dbg !195
  %6 = load i32, i32* %max, align 4, !dbg !196, !tbaa !183
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !49, metadata !56), !dbg !180
  %sub = add nsw i32 %6, -1, !dbg !197
  %add = mul i32 %6, %6, !dbg !198
  %sub8 = add nsw i32 %add, -1, !dbg !199
  %idxprom = sext i32 %sub8 to i64, !dbg !200
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0, !dbg !201
  %7 = load i64*, i64** %data, align 8, !dbg !201, !tbaa !85
  %arrayidx9 = getelementptr inbounds i64, i64* %7, i64 %idxprom, !dbg !200
  %8 = load i64, i64* %arrayidx9, align 8, !dbg !200, !tbaa !147
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call3, i64 0, i32 0, !dbg !202
  %9 = load i64*, i64** %data17, align 8, !dbg !202, !tbaa !85
  %arrayidx18 = getelementptr inbounds i64, i64* %9, i64 %idxprom, !dbg !203
  %10 = load i64, i64* %arrayidx18, align 8, !dbg !203, !tbaa !147
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !204
  %11 = load i64*, i64** %data26, align 8, !dbg !204, !tbaa !85
  %arrayidx27 = getelementptr inbounds i64, i64* %11, i64 %idxprom, !dbg !205
  %12 = load i64, i64* %arrayidx27, align 8, !dbg !205, !tbaa !147
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %6, i32 %sub, i64 %8, i32 %sub, i32 %6, i32 %sub, i64 %10, i32 %sub, i32 %6, i32 %sub, i64 %12), !dbg !206
  call void @llvm.lifetime.end(i64 4, i8* %0) #5, !dbg !207
  ret i32 0, !dbg !209
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
!llvm.module.flags = !{!53, !54}
!llvm.ident = !{!55}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !6)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten1")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!6 = !{!7, !25, !40}
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
!28 = !{!29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39}
!29 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !1, line: 47, type: !10)
!30 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !1, line: 47, type: !10)
!31 = !DILocalVariable(name: "i", scope: !25, file: !1, line: 48, type: !16)
!32 = !DILocalVariable(name: "j", scope: !25, file: !1, line: 48, type: !16)
!33 = !DILocalVariable(name: "k", scope: !25, file: !1, line: 48, type: !16)
!34 = !DILocalVariable(name: "width", scope: !25, file: !1, line: 49, type: !16)
!35 = !DILocalVariable(name: "height", scope: !25, file: !1, line: 50, type: !16)
!36 = !DILocalVariable(name: "a_data", scope: !25, file: !1, line: 51, type: !4)
!37 = !DILocalVariable(name: "b_data", scope: !25, file: !1, line: 52, type: !4)
!38 = !DILocalVariable(name: "data", scope: !25, file: !1, line: 53, type: !4)
!39 = !DILocalVariable(name: "m", scope: !25, file: !1, line: 63, type: !10)
!40 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 71, type: !41, isLocal: false, isDefinition: true, scopeLine: 72, flags: DIFlagPrototyped, isOptimized: true, variables: !46)
!41 = !DISubroutineType(types: !42)
!42 = !{!16, !16, !43}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!46 = !{!47, !48, !49, !50, !51, !52}
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !1, line: 71, type: !16)
!48 = !DILocalVariable(name: "args", arg: 2, scope: !40, file: !1, line: 71, type: !43)
!49 = !DILocalVariable(name: "max", scope: !40, file: !1, line: 74, type: !16)
!50 = !DILocalVariable(name: "a", scope: !40, file: !1, line: 78, type: !10)
!51 = !DILocalVariable(name: "b", scope: !40, file: !1, line: 79, type: !10)
!52 = !DILocalVariable(name: "c", scope: !40, file: !1, line: 81, type: !10)
!53 = !{i32 2, !"Dwarf Version", i32 4}
!54 = !{i32 2, !"Debug Info Version", i32 3}
!55 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!56 = !DIExpression()
!57 = !DILocation(line: 12, column: 18, scope: !7)
!58 = !DILocation(line: 12, column: 29, scope: !7)
!59 = !DILocation(line: 25, column: 60, scope: !7)
!60 = !DILocation(line: 25, column: 59, scope: !7)
!61 = !DILocation(line: 25, column: 66, scope: !7)
!62 = !DILocation(line: 25, column: 65, scope: !7)
!63 = !DILocation(line: 25, column: 35, scope: !64)
!64 = !DILexicalBlockFile(scope: !7, file: !1, discriminator: 1)
!65 = !DILocation(line: 14, column: 9, scope: !7)
!66 = !DILocation(line: 27, column: 16, scope: !67)
!67 = !DILexicalBlockFile(scope: !68, file: !1, discriminator: 1)
!68 = distinct !DILexicalBlock(scope: !69, file: !1, line: 27, column: 5)
!69 = distinct !DILexicalBlock(scope: !7, file: !1, line: 27, column: 5)
!70 = !DILocation(line: 28, column: 20, scope: !71)
!71 = !DILexicalBlockFile(scope: !72, file: !1, discriminator: 1)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 28, column: 9)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 28, column: 9)
!74 = distinct !DILexicalBlock(scope: !68, file: !1, line: 27, column: 30)
!75 = !DILocation(line: 27, column: 5, scope: !67)
!76 = !DILocation(line: 29, column: 19, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !1, line: 28, column: 33)
!78 = !DILocation(line: 29, column: 29, scope: !77)
!79 = distinct !{!79, !80}
!80 = !{!"llvm.loop.unroll.disable"}
!81 = !DILocation(line: 39, column: 17, scope: !64)
!82 = !DILocation(line: 39, column: 17, scope: !7)
!83 = !DILocation(line: 39, column: 13, scope: !7)
!84 = !DILocation(line: 40, column: 13, scope: !7)
!85 = !{!86, !87, i64 0}
!86 = !{!"", !87, i64 0, !90, i64 8, !90, i64 12}
!87 = !{!"any pointer", !88, i64 0}
!88 = !{!"omnipotent char", !89, i64 0}
!89 = !{!"Simple C/C++ TBAA"}
!90 = !{!"int", !88, i64 0}
!91 = !DILocation(line: 41, column: 8, scope: !7)
!92 = !DILocation(line: 41, column: 14, scope: !7)
!93 = !{!86, !90, i64 8}
!94 = !DILocation(line: 42, column: 8, scope: !7)
!95 = !DILocation(line: 42, column: 15, scope: !7)
!96 = !{!86, !90, i64 12}
!97 = !DILocation(line: 44, column: 5, scope: !7)
!98 = distinct !{!98, !99, !"polly.alias.scope.call"}
!99 = distinct !{!99, !"polly.alias.scope.domain"}
!100 = !DILocation(line: 35, column: 47, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !1, line: 34, column: 33)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 34, column: 9)
!103 = distinct !DILexicalBlock(scope: !104, file: !1, line: 34, column: 9)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 33, column: 30)
!105 = distinct !DILexicalBlock(scope: !106, file: !1, line: 33, column: 5)
!106 = distinct !DILexicalBlock(scope: !7, file: !1, line: 33, column: 5)
!107 = !DILocation(line: 47, column: 26, scope: !25)
!108 = !DILocation(line: 47, column: 37, scope: !25)
!109 = !DILocation(line: 49, column: 20, scope: !25)
!110 = !DILocation(line: 49, column: 9, scope: !25)
!111 = !DILocation(line: 50, column: 21, scope: !25)
!112 = !DILocation(line: 50, column: 9, scope: !25)
!113 = !DILocation(line: 51, column: 28, scope: !25)
!114 = !DILocation(line: 51, column: 16, scope: !25)
!115 = !DILocation(line: 52, column: 28, scope: !25)
!116 = !DILocation(line: 52, column: 16, scope: !25)
!117 = !DILocation(line: 53, column: 60, scope: !25)
!118 = !DILocation(line: 53, column: 59, scope: !25)
!119 = !DILocation(line: 53, column: 66, scope: !25)
!120 = !DILocation(line: 53, column: 65, scope: !25)
!121 = !DILocation(line: 53, column: 35, scope: !122)
!122 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 1)
!123 = !DILocation(line: 53, column: 23, scope: !25)
!124 = !DILocation(line: 53, column: 16, scope: !25)
!125 = !DILocation(line: 48, column: 9, scope: !25)
!126 = !DILocation(line: 55, column: 15, scope: !127)
!127 = !DILexicalBlockFile(scope: !128, file: !1, discriminator: 1)
!128 = distinct !DILexicalBlock(scope: !129, file: !1, line: 55, column: 5)
!129 = distinct !DILexicalBlock(scope: !25, file: !1, line: 55, column: 5)
!130 = !DILocation(line: 55, column: 5, scope: !127)
!131 = !DILocation(line: 56, column: 19, scope: !132)
!132 = !DILexicalBlockFile(scope: !133, file: !1, discriminator: 1)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 56, column: 9)
!134 = distinct !DILexicalBlock(scope: !135, file: !1, line: 56, column: 9)
!135 = distinct !DILexicalBlock(scope: !128, file: !1, line: 55, column: 29)
!136 = !DILocation(line: 56, column: 9, scope: !132)
!137 = !DILocation(line: 58, column: 13, scope: !138)
!138 = !DILexicalBlockFile(scope: !139, file: !1, discriminator: 1)
!139 = distinct !DILexicalBlock(scope: !140, file: !1, line: 58, column: 13)
!140 = distinct !DILexicalBlock(scope: !141, file: !1, line: 58, column: 13)
!141 = distinct !DILexicalBlock(scope: !133, file: !1, line: 56, column: 34)
!142 = !DILocation(line: 57, column: 19, scope: !141)
!143 = !DILocation(line: 59, column: 53, scope: !139)
!144 = !DILocation(line: 57, column: 25, scope: !141)
!145 = !DILocation(line: 57, column: 13, scope: !141)
!146 = !DILocation(line: 57, column: 29, scope: !141)
!147 = !{!148, !148, i64 0}
!148 = !{!"long long", !88, i64 0}
!149 = !DILocation(line: 48, column: 15, scope: !25)
!150 = !DILocation(line: 59, column: 73, scope: !139)
!151 = !DILocation(line: 59, column: 71, scope: !139)
!152 = !DILocation(line: 59, column: 33, scope: !139)
!153 = !DILocation(line: 59, column: 35, scope: !139)
!154 = !DILocation(line: 59, column: 67, scope: !139)
!155 = !DILocation(line: 59, column: 81, scope: !139)
!156 = !DILocation(line: 59, column: 87, scope: !139)
!157 = !DILocation(line: 59, column: 51, scope: !139)
!158 = !DILocation(line: 63, column: 17, scope: !122)
!159 = !DILocation(line: 63, column: 17, scope: !25)
!160 = !DILocation(line: 63, column: 13, scope: !25)
!161 = !DILocation(line: 64, column: 8, scope: !25)
!162 = !DILocation(line: 64, column: 14, scope: !25)
!163 = !DILocation(line: 65, column: 8, scope: !25)
!164 = !DILocation(line: 65, column: 15, scope: !25)
!165 = !DILocation(line: 66, column: 13, scope: !25)
!166 = !DILocation(line: 67, column: 5, scope: !25)
!167 = distinct !{!167, !168, !"polly.alias.scope.call"}
!168 = distinct !{!168, !"polly.alias.scope.domain"}
!169 = !{!170, !171}
!170 = distinct !{!170, !168, !"polly.alias.scope."}
!171 = distinct !{!171, !168, !"polly.alias.scope."}
!172 = !{!167, !171}
!173 = !{!170, !167}
!174 = !DILocation(line: 71, column: 14, scope: !40)
!175 = !DILocation(line: 71, column: 27, scope: !40)
!176 = !DILocation(line: 74, column: 5, scope: !40)
!177 = !DILocation(line: 75, column: 12, scope: !40)
!178 = !{!87, !87, i64 0}
!179 = !DIExpression(DW_OP_deref)
!180 = !DILocation(line: 74, column: 9, scope: !40)
!181 = !DILocation(line: 75, column: 5, scope: !40)
!182 = !DILocation(line: 76, column: 24, scope: !40)
!183 = !{!90, !90, i64 0}
!184 = !DILocation(line: 76, column: 5, scope: !40)
!185 = !DILocation(line: 78, column: 22, scope: !40)
!186 = !DILocation(line: 78, column: 17, scope: !187)
!187 = !DILexicalBlockFile(scope: !40, file: !1, discriminator: 1)
!188 = !DILocation(line: 78, column: 13, scope: !40)
!189 = !DILocation(line: 79, column: 22, scope: !40)
!190 = !DILocation(line: 79, column: 17, scope: !187)
!191 = !DILocation(line: 79, column: 13, scope: !40)
!192 = !DILocation(line: 81, column: 17, scope: !187)
!193 = !DILocation(line: 81, column: 13, scope: !40)
!194 = !DILocation(line: 83, column: 48, scope: !40)
!195 = !DILocation(line: 83, column: 5, scope: !40)
!196 = !DILocation(line: 85, column: 9, scope: !40)
!197 = !DILocation(line: 85, column: 12, scope: !40)
!198 = !DILocation(line: 85, column: 47, scope: !40)
!199 = !DILocation(line: 85, column: 51, scope: !40)
!200 = !DILocation(line: 85, column: 28, scope: !40)
!201 = !DILocation(line: 85, column: 31, scope: !40)
!202 = !DILocation(line: 86, column: 31, scope: !40)
!203 = !DILocation(line: 86, column: 28, scope: !40)
!204 = !DILocation(line: 87, column: 31, scope: !40)
!205 = !DILocation(line: 87, column: 28, scope: !40)
!206 = !DILocation(line: 84, column: 5, scope: !40)
!207 = !DILocation(line: 89, column: 1, scope: !208)
!208 = !DILexicalBlockFile(scope: !40, file: !1, discriminator: 3)
!209 = !DILocation(line: 88, column: 5, scope: !40)
