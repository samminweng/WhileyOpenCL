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
  %polly.par.userContext = alloca { i32, i32, i8* }, align 8
  tail call void @llvm.dbg.value(metadata i32 %width, i64 0, metadata !19, metadata !56), !dbg !57
  tail call void @llvm.dbg.value(metadata i32 %height, i64 0, metadata !20, metadata !56), !dbg !58
  %conv = sext i32 %width to i64, !dbg !59
  %mul = shl nsw i64 %conv, 3, !dbg !60
  %conv1 = sext i32 %height to i64, !dbg !61
  %mul2 = mul i64 %mul, %conv1, !dbg !62
  %call = tail call noalias i8* @malloc(i64 %mul2) #6, !dbg !63
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !21, metadata !56), !dbg !65
  %cmp77 = icmp sgt i32 %height, 0, !dbg !66
  %cmp575 = icmp sgt i32 %width, 0, !dbg !70
  %or.cond = and i1 %cmp77, %cmp575, !dbg !75
  br i1 %or.cond, label %for.cond4.preheader.us.preheader, label %polly.parallel.for, !dbg !75

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
  br i1 %6, label %polly.parallel.for.loopexit, label %for.cond4.preheader.us.preheader.split.split, !dbg !76

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
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %height, !dbg !75
  br i1 %exitcond.7, label %polly.parallel.for.loopexit.unr-lcssa, label %for.cond4.preheader.us, !dbg !75

polly.parallel.for.loopexit.unr-lcssa:            ; preds = %for.cond4.preheader.us
  br label %polly.parallel.for.loopexit

polly.parallel.for.loopexit:                      ; preds = %for.cond4.preheader.us.preheader.split, %polly.parallel.for.loopexit.unr-lcssa
  br label %polly.parallel.for

polly.parallel.for:                               ; preds = %polly.parallel.for.loopexit, %entry
  %15 = add nsw i64 %conv1, -1
  %polly.fdiv_q.shr = ashr i64 %15, 5
  %16 = bitcast { i32, i32, i8* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* %16)
  %polly.subfn.storeaddr.height = getelementptr inbounds { i32, i32, i8* }, { i32, i32, i8* }* %polly.par.userContext, i64 0, i32 0
  store i32 %height, i32* %polly.subfn.storeaddr.height, align 8
  %polly.subfn.storeaddr.width = getelementptr inbounds { i32, i32, i8* }, { i32, i32, i8* }* %polly.par.userContext, i64 0, i32 1
  store i32 %width, i32* %polly.subfn.storeaddr.width, align 4
  %polly.subfn.storeaddr.call = getelementptr inbounds { i32, i32, i8* }, { i32, i32, i8* }* %polly.par.userContext, i64 0, i32 2
  store i8* %call, i8** %polly.subfn.storeaddr.call, align 8
  %17 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %16, i32 0, i64 0, i64 %17, i64 1) #6
  call void @init_polly_subfn(i8* %16) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %16)
  %call36 = tail call noalias i8* @malloc(i64 16) #6, !dbg !81
  %18 = bitcast i8* %call36 to %struct.Matrix*, !dbg !82
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %18, i64 0, metadata !24, metadata !56), !dbg !83
  %19 = bitcast i8* %call36 to i8**, !dbg !84
  store i8* %call, i8** %19, align 8, !dbg !84, !tbaa !85
  %width38 = getelementptr inbounds i8, i8* %call36, i64 8, !dbg !91
  %20 = bitcast i8* %width38 to i32*, !dbg !91
  store i32 %width, i32* %20, align 8, !dbg !92, !tbaa !93
  %height39 = getelementptr inbounds i8, i8* %call36, i64 12, !dbg !94
  %21 = bitcast i8* %height39 to i32*, !dbg !94
  store i32 %height, i32* %21, align 4, !dbg !95, !tbaa !96
  ret %struct.Matrix* %18, !dbg !97
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
  %polly.par.userContext130 = alloca { i32, i32, i8*, i64*, i64* }, align 8
  %polly.par.userContext = alloca { i32, i32, i8* }, align 8
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !29, metadata !56), !dbg !98
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !30, metadata !56), !dbg !99
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !100
  %0 = load i32, i32* %width1, align 8, !dbg !100, !tbaa !93
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !34, metadata !56), !dbg !101
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !102
  %1 = load i32, i32* %height2, align 4, !dbg !102, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !35, metadata !56), !dbg !103
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !104
  %2 = load i64*, i64** %data, align 8, !dbg !104, !tbaa !85
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !36, metadata !56), !dbg !105
  %data3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !106
  %3 = load i64*, i64** %data3, align 8, !dbg !106, !tbaa !85
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !37, metadata !56), !dbg !107
  %conv = sext i32 %0 to i64, !dbg !108
  %mul = shl nsw i64 %conv, 3, !dbg !109
  %conv5 = sext i32 %1 to i64, !dbg !110
  %mul6 = mul i64 %mul, %conv5, !dbg !111
  %call = tail call noalias i8* @malloc(i64 %mul6) #6, !dbg !112
  %4 = bitcast i8* %call to i64*, !dbg !114
  tail call void @llvm.dbg.value(metadata i64* %4, i64 0, metadata !38, metadata !56), !dbg !115
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !31, metadata !56), !dbg !116
  %cmp89 = icmp sgt i32 %0, 0, !dbg !117
  br i1 %cmp89, label %for.cond8.preheader.lr.ph, label %for.end40, !dbg !121

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
  br i1 %14, label %polly.parallel.for, label %for.cond8.preheader.preheader

for.cond8.preheader.preheader:                    ; preds = %for.cond8.preheader.lr.ph
  %cmp986 = icmp sgt i32 %1, 0, !dbg !122
  br i1 %cmp986, label %for.cond8.preheader.us.preheader, label %for.end40, !dbg !127

for.cond8.preheader.us.preheader:                 ; preds = %for.cond8.preheader.preheader
  %xtraiter = and i32 %0, 1, !dbg !128
  %lcmp.mod = icmp eq i32 %xtraiter, 0, !dbg !128
  %15 = icmp eq i32 %0, 1, !dbg !128
  br label %for.cond8.preheader.us, !dbg !133

for.cond8.preheader.us:                           ; preds = %for.cond8.preheader.us.preheader, %for.inc38.loopexit.us
  %indvars.iv100.us = phi i64 [ %indvars.iv.next101.us, %for.inc38.loopexit.us ], [ 0, %for.cond8.preheader.us.preheader ]
  %16 = mul nsw i64 %indvars.iv100.us, %conv, !dbg !133
  %arrayidx24.us.prol = getelementptr inbounds i64, i64* %2, i64 %16, !dbg !134
  br label %for.body11.us, !dbg !133

for.body11.us:                                    ; preds = %for.cond8.preheader.us, %for.inc35.us
  %indvars.iv95.us = phi i64 [ %indvars.iv.next96.us, %for.inc35.us ], [ 0, %for.cond8.preheader.us ]
  %17 = add nsw i64 %indvars.iv95.us, %16, !dbg !135
  %arrayidx.us = getelementptr inbounds i64, i64* %4, i64 %17, !dbg !136
  store i64 0, i64* %arrayidx.us, align 8, !dbg !137, !tbaa !138
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !56), !dbg !140
  br i1 %lcmp.mod, label %for.body11.us.split, label %for.body16.us.prol, !dbg !128

for.body16.us.prol:                               ; preds = %for.body11.us
  %18 = load i64, i64* %arrayidx24.us.prol, align 8, !dbg !134, !tbaa !138
  %arrayidx28.us.prol = getelementptr inbounds i64, i64* %3, i64 %indvars.iv95.us, !dbg !141
  %19 = load i64, i64* %arrayidx28.us.prol, align 8, !dbg !141, !tbaa !138
  %mul29.us.prol = mul nsw i64 %19, %18, !dbg !142
  store i64 %mul29.us.prol, i64* %arrayidx.us, align 8, !dbg !143, !tbaa !138
  br label %for.body11.us.split, !dbg !128

for.body11.us.split:                              ; preds = %for.body11.us, %for.body16.us.prol
  %.unr = phi i64 [ 0, %for.body11.us ], [ %mul29.us.prol, %for.body16.us.prol ]
  %indvars.iv.us.unr = phi i64 [ 0, %for.body11.us ], [ 1, %for.body16.us.prol ]
  br i1 %15, label %for.inc35.us, label %for.body11.us.split.split, !dbg !128

for.body11.us.split.split:                        ; preds = %for.body11.us.split
  br label %for.body16.us, !dbg !128

for.body16.us:                                    ; preds = %for.body16.us, %for.body11.us.split.split
  %20 = phi i64 [ %.unr, %for.body11.us.split.split ], [ %add30.us.1, %for.body16.us ], !dbg !144
  %indvars.iv.us = phi i64 [ %indvars.iv.us.unr, %for.body11.us.split.split ], [ %indvars.iv.next.us.1, %for.body16.us ]
  %21 = add nsw i64 %indvars.iv.us, %16, !dbg !145
  %arrayidx24.us = getelementptr inbounds i64, i64* %2, i64 %21, !dbg !134
  %22 = load i64, i64* %arrayidx24.us, align 8, !dbg !134, !tbaa !138
  %23 = mul nsw i64 %indvars.iv.us, %conv, !dbg !146
  %24 = add nsw i64 %23, %indvars.iv95.us, !dbg !147
  %arrayidx28.us = getelementptr inbounds i64, i64* %3, i64 %24, !dbg !141
  %25 = load i64, i64* %arrayidx28.us, align 8, !dbg !141, !tbaa !138
  %mul29.us = mul nsw i64 %25, %22, !dbg !142
  %add30.us = add nsw i64 %mul29.us, %20, !dbg !148
  store i64 %add30.us, i64* %arrayidx.us, align 8, !dbg !143, !tbaa !138
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1, !dbg !128
  %26 = add nsw i64 %indvars.iv.next.us, %16, !dbg !145
  %arrayidx24.us.1 = getelementptr inbounds i64, i64* %2, i64 %26, !dbg !134
  %27 = load i64, i64* %arrayidx24.us.1, align 8, !dbg !134, !tbaa !138
  %28 = mul nsw i64 %indvars.iv.next.us, %conv, !dbg !146
  %29 = add nsw i64 %28, %indvars.iv95.us, !dbg !147
  %arrayidx28.us.1 = getelementptr inbounds i64, i64* %3, i64 %29, !dbg !141
  %30 = load i64, i64* %arrayidx28.us.1, align 8, !dbg !141, !tbaa !138
  %mul29.us.1 = mul nsw i64 %30, %27, !dbg !142
  %add30.us.1 = add nsw i64 %mul29.us.1, %add30.us, !dbg !148
  store i64 %add30.us.1, i64* %arrayidx.us, align 8, !dbg !143, !tbaa !138
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2, !dbg !128
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.us.1 to i32, !dbg !128
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %0, !dbg !128
  br i1 %exitcond.1, label %for.inc35.us.unr-lcssa, label %for.body16.us, !dbg !128

for.inc35.us.unr-lcssa:                           ; preds = %for.body16.us
  br label %for.inc35.us, !dbg !127

for.inc35.us:                                     ; preds = %for.body11.us.split, %for.inc35.us.unr-lcssa
  %indvars.iv.next96.us = add nuw nsw i64 %indvars.iv95.us, 1, !dbg !127
  %lftr.wideiv139 = trunc i64 %indvars.iv.next96.us to i32, !dbg !127
  %exitcond140 = icmp eq i32 %lftr.wideiv139, %1, !dbg !127
  br i1 %exitcond140, label %for.inc38.loopexit.us, label %for.body11.us, !dbg !127

for.inc38.loopexit.us:                            ; preds = %for.inc35.us
  %indvars.iv.next101.us = add nuw nsw i64 %indvars.iv100.us, 1, !dbg !121
  %lftr.wideiv141 = trunc i64 %indvars.iv.next101.us to i32, !dbg !121
  %exitcond142 = icmp eq i32 %lftr.wideiv141, %0, !dbg !121
  br i1 %exitcond142, label %for.end40.loopexit, label %for.cond8.preheader.us, !dbg !121

for.end40.loopexit:                               ; preds = %for.inc38.loopexit.us
  br label %for.end40, !dbg !149

for.end40:                                        ; preds = %for.end40.loopexit, %for.cond8.preheader.preheader, %polly.parallel.for, %entry
  %call41 = tail call noalias i8* @malloc(i64 16) #6, !dbg !149
  %31 = bitcast i8* %call41 to %struct.Matrix*, !dbg !150
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %31, i64 0, metadata !39, metadata !56), !dbg !151
  %width42 = getelementptr inbounds i8, i8* %call41, i64 8, !dbg !152
  %32 = bitcast i8* %width42 to i32*, !dbg !152
  store i32 %0, i32* %32, align 8, !dbg !153, !tbaa !93
  %height43 = getelementptr inbounds i8, i8* %call41, i64 12, !dbg !154
  %33 = bitcast i8* %height43 to i32*, !dbg !154
  store i32 %1, i32* %33, align 4, !dbg !155, !tbaa !96
  %34 = bitcast i8* %call41 to i8**, !dbg !156
  store i8* %call, i8** %34, align 8, !dbg !156, !tbaa !85
  ret %struct.Matrix* %31, !dbg !157

polly.parallel.for:                               ; preds = %for.cond8.preheader.lr.ph
  %polly.fdiv_q.shr = ashr i64 %6, 5
  %35 = bitcast { i32, i32, i8* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* %35)
  %polly.subfn.storeaddr. = getelementptr inbounds { i32, i32, i8* }, { i32, i32, i8* }* %polly.par.userContext, i64 0, i32 0
  store i32 %1, i32* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.126 = getelementptr inbounds { i32, i32, i8* }, { i32, i32, i8* }* %polly.par.userContext, i64 0, i32 1
  store i32 %0, i32* %polly.subfn.storeaddr.126, align 4
  %polly.subfn.storeaddr.call = getelementptr inbounds { i32, i32, i8* }, { i32, i32, i8* }* %polly.par.userContext, i64 0, i32 2
  store i8* %call, i8** %polly.subfn.storeaddr.call, align 8
  %36 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn, i8* %35, i32 0, i64 0, i64 %36, i64 1) #6
  call void @mat_mult_polly_subfn(i8* %35) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %35)
  %37 = bitcast { i32, i32, i8*, i64*, i64* }* %polly.par.userContext130 to i8*
  call void @llvm.lifetime.start(i64 32, i8* %37)
  %polly.subfn.storeaddr.131 = getelementptr inbounds { i32, i32, i8*, i64*, i64* }, { i32, i32, i8*, i64*, i64* }* %polly.par.userContext130, i64 0, i32 0
  store i32 %1, i32* %polly.subfn.storeaddr.131, align 8
  %polly.subfn.storeaddr.132 = getelementptr inbounds { i32, i32, i8*, i64*, i64* }, { i32, i32, i8*, i64*, i64* }* %polly.par.userContext130, i64 0, i32 1
  store i32 %0, i32* %polly.subfn.storeaddr.132, align 4
  %polly.subfn.storeaddr.call133 = getelementptr inbounds { i32, i32, i8*, i64*, i64* }, { i32, i32, i8*, i64*, i64* }* %polly.par.userContext130, i64 0, i32 2
  store i8* %call, i8** %polly.subfn.storeaddr.call133, align 8
  %polly.subfn.storeaddr.134 = getelementptr inbounds { i32, i32, i8*, i64*, i64* }, { i32, i32, i8*, i64*, i64* }* %polly.par.userContext130, i64 0, i32 3
  store i64* %2, i64** %polly.subfn.storeaddr.134, align 8
  %polly.subfn.storeaddr.135 = getelementptr inbounds { i32, i32, i8*, i64*, i64* }, { i32, i32, i8*, i64*, i64* }* %polly.par.userContext130, i64 0, i32 4
  store i64* %3, i64** %polly.subfn.storeaddr.135, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn_4, i8* %37, i32 0, i64 0, i64 %36, i64 1) #6
  call void @mat_mult_polly_subfn_4(i8* %37) #6
  call void @GOMP_parallel_end() #6
  call void @llvm.lifetime.end(i64 8, i8* %37)
  br label %for.end40
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %args) #3 !dbg !40 {
entry:
  %max = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !47, metadata !56), !dbg !158
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !48, metadata !56), !dbg !159
  %0 = bitcast i32* %max to i8*, !dbg !160
  call void @llvm.lifetime.start(i64 4, i8* %0) #6, !dbg !160
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 1, !dbg !161
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !161, !tbaa !162
  tail call void @llvm.dbg.value(metadata i32* %max, i64 0, metadata !49, metadata !163), !dbg !164
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %max) #6, !dbg !165
  %2 = load i32, i32* %max, align 4, !dbg !166, !tbaa !167
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !49, metadata !56), !dbg !164
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %2), !dbg !168
  %3 = load i32, i32* %max, align 4, !dbg !169, !tbaa !167
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !49, metadata !56), !dbg !164
  %call2 = call %struct.Matrix* @init(i32 %3, i32 %3), !dbg !170
  call void @llvm.dbg.value(metadata %struct.Matrix* %call2, i64 0, metadata !50, metadata !56), !dbg !172
  %4 = load i32, i32* %max, align 4, !dbg !173, !tbaa !167
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !49, metadata !56), !dbg !164
  %call3 = call %struct.Matrix* @init(i32 %4, i32 %4), !dbg !174
  call void @llvm.dbg.value(metadata %struct.Matrix* %call3, i64 0, metadata !51, metadata !56), !dbg !175
  %call4 = call %struct.Matrix* @mat_mult(%struct.Matrix* %call2, %struct.Matrix* %call3), !dbg !176
  call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !52, metadata !56), !dbg !177
  %5 = load i32, i32* %max, align 4, !dbg !178, !tbaa !167
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !49, metadata !56), !dbg !164
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %5, i32 %5), !dbg !179
  %6 = load i32, i32* %max, align 4, !dbg !180, !tbaa !167
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !49, metadata !56), !dbg !164
  %sub = add nsw i32 %6, -1, !dbg !181
  %add = mul i32 %6, %6, !dbg !182
  %sub8 = add nsw i32 %add, -1, !dbg !183
  %idxprom = sext i32 %sub8 to i64, !dbg !184
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0, !dbg !185
  %7 = load i64*, i64** %data, align 8, !dbg !185, !tbaa !85
  %arrayidx9 = getelementptr inbounds i64, i64* %7, i64 %idxprom, !dbg !184
  %8 = load i64, i64* %arrayidx9, align 8, !dbg !184, !tbaa !138
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call3, i64 0, i32 0, !dbg !186
  %9 = load i64*, i64** %data17, align 8, !dbg !186, !tbaa !85
  %arrayidx18 = getelementptr inbounds i64, i64* %9, i64 %idxprom, !dbg !187
  %10 = load i64, i64* %arrayidx18, align 8, !dbg !187, !tbaa !138
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !188
  %11 = load i64*, i64** %data26, align 8, !dbg !188, !tbaa !85
  %arrayidx27 = getelementptr inbounds i64, i64* %11, i64 %idxprom, !dbg !189
  %12 = load i64, i64* %arrayidx27, align 8, !dbg !189, !tbaa !138
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %6, i32 %sub, i64 %8, i32 %sub, i32 %6, i32 %sub, i64 %10, i32 %sub, i32 %6, i32 %sub, i64 %12), !dbg !190
  call void @llvm.lifetime.end(i64 4, i8* %0) #6, !dbg !191
  ret i32 0, !dbg !193
}

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

define internal void @init_polly_subfn(i8* nocapture readonly %polly.par.userContext) #5 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i32*
  %polly.subfunc.arg.height = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 4
  %2 = bitcast i8* %1 to i32*
  %polly.subfunc.arg.width = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %4 = bitcast i8* %3 to i8**
  %polly.subfunc.arg.call = load i8*, i8** %4, align 8
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit, label %polly.par.loadIVBounds.lr.ph

polly.par.loadIVBounds.lr.ph:                     ; preds = %polly.par.setup
  %7 = zext i32 %polly.subfunc.arg.width to i64
  %8 = and i64 %7, 3
  %9 = sext i32 %polly.subfunc.arg.width to i64
  %10 = add nsw i64 %9, -1
  %polly.fdiv_q.shr = ashr i64 %10, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %11 = sext i32 %polly.subfunc.arg.height to i64
  %pexp.p_div_q = lshr i64 %9, 2
  %12 = add nsw i64 %pexp.p_div_q, -1
  %pexp.pdiv_r = and i32 %polly.subfunc.arg.width, 3
  %polly.loop_guard38 = icmp eq i32 %pexp.pdiv_r, 0
  %13 = sub nsw i64 %9, %8
  %14 = add nsw i64 %8, -1
  %xtraiter99 = and i64 %7, 3
  %lcmp.mod100 = icmp eq i64 %xtraiter99, 0
  %15 = icmp ult i64 %14, 3
  %xtraiter = and i64 %7, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %16 = icmp ult i64 %14, 3
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %17 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.lr.ph, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  br i1 %polly.loop_guard, label %polly.loop_header2.preheader, label %polly.loop_exit4

polly.loop_header2.preheader:                     ; preds = %polly.loop_header
  %19 = shl nsw i64 %polly.indvar, 5
  %20 = sub nsw i64 %11, %19
  %21 = add nsw i64 %20, -1
  %22 = icmp sgt i64 %21, 31
  %23 = select i1 %22, i64 31, i64 %21
  %polly.loop_guard13 = icmp sgt i64 %23, -1
  %polly.adjust_ub16 = add i64 %23, -1
  br label %polly.loop_header2

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit12
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header2:                               ; preds = %polly.loop_header2.preheader, %polly.loop_exit12
  %polly.indvar5 = phi i64 [ %polly.indvar_next6, %polly.loop_exit12 ], [ 0, %polly.loop_header2.preheader ]
  br i1 %polly.loop_guard13, label %polly.loop_header10.preheader, label %polly.loop_exit12

polly.loop_header10.preheader:                    ; preds = %polly.loop_header2
  %24 = mul nsw i64 %polly.indvar5, -8
  %25 = add nsw i64 %12, %24
  %26 = icmp sgt i64 %25, 7
  %27 = select i1 %26, i64 7, i64 %25
  %polly.loop_guard22 = icmp sgt i64 %27, -1
  %28 = shl i64 %polly.indvar5, 5
  %29 = or i64 %28, 31
  %30 = icmp slt i64 %29, %9
  %or.cond = or i1 %polly.loop_guard38, %30
  %polly.adjust_ub25 = add i64 %27, -1
  br i1 %polly.loop_guard22, label %polly.loop_header10.us.preheader, label %polly.loop_header10.preheader.split

polly.loop_header10.us.preheader:                 ; preds = %polly.loop_header10.preheader
  br label %polly.loop_header10.us

polly.loop_header10.us:                           ; preds = %polly.loop_header10.us.preheader, %polly.merge.us
  %polly.indvar14.us = phi i64 [ %polly.indvar_next15.us, %polly.merge.us ], [ 0, %polly.loop_header10.us.preheader ]
  %31 = add nsw i64 %polly.indvar14.us, %19
  %32 = mul i64 %31, %9
  %33 = add i64 %32, %28
  %34 = insertelement <2 x i64> undef, i64 %31, i32 0, !dbg !194
  %35 = insertelement <2 x i64> %34, i64 %31, i32 1, !dbg !194
  %36 = insertelement <2 x i64> undef, i64 %31, i32 0, !dbg !194
  %37 = insertelement <2 x i64> %36, i64 %31, i32 1, !dbg !194
  br label %polly.loop_header19.us

polly.loop_header19.us:                           ; preds = %polly.loop_header10.us, %polly.loop_header19.us
  %polly.indvar23.us = phi i64 [ %polly.indvar_next24.us, %polly.loop_header19.us ], [ 0, %polly.loop_header10.us ]
  %38 = shl i64 %polly.indvar23.us, 2
  %39 = add i64 %33, %38
  %tmp50.us = shl i64 %39, 3
  %scevgep.us = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp50.us
  %40 = bitcast i8* %scevgep.us to <2 x i64>*
  %41 = load <2 x i64>, <2 x i64>* %40, align 8, !alias.scope !201, !noalias !2
  %42 = add nsw <2 x i64> %41, %35, !dbg !194
  %43 = bitcast i8* %scevgep.us to <2 x i64>*
  store <2 x i64> %42, <2 x i64>* %43, align 8, !alias.scope !201, !noalias !2
  %tmp.us.2 = shl i64 %39, 3
  %tmp50.us.2 = add i64 %tmp.us.2, 16
  %scevgep.us.2 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp50.us.2
  %44 = bitcast i8* %scevgep.us.2 to <2 x i64>*
  %45 = load <2 x i64>, <2 x i64>* %44, align 8, !alias.scope !201, !noalias !2
  %46 = add nsw <2 x i64> %45, %37, !dbg !194
  %47 = bitcast i8* %scevgep.us.2 to <2 x i64>*
  store <2 x i64> %46, <2 x i64>* %47, align 8, !alias.scope !201, !noalias !2
  %polly.indvar_next24.us = add nuw nsw i64 %polly.indvar23.us, 1
  %polly.loop_cond26.us = icmp sgt i64 %polly.indvar23.us, %polly.adjust_ub25
  br i1 %polly.loop_cond26.us, label %polly.cond.loopexit.us, label %polly.loop_header19.us

polly.loop_header35.us:                           ; preds = %polly.loop_header35.us, %polly.loop_header35.preheader.us.split.split
  %polly.indvar39.us = phi i64 [ %polly.indvar39.us.unr, %polly.loop_header35.preheader.us.split.split ], [ %polly.indvar_next40.us.3, %polly.loop_header35.us ]
  %tmp51.us = add i64 %48, %polly.indvar39.us
  %tmp52.us = shl i64 %tmp51.us, 3
  %scevgep45.us = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp52.us
  %scevgep4546.us = bitcast i8* %scevgep45.us to i64*
  %_p_scalar_47.us = load i64, i64* %scevgep4546.us, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %p_add2548.us = add nsw i64 %_p_scalar_47.us, %31, !dbg !194
  store i64 %p_add2548.us, i64* %scevgep4546.us, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %polly.indvar_next40.us = add nuw nsw i64 %polly.indvar39.us, 1
  %tmp51.us.1 = add i64 %48, %polly.indvar_next40.us
  %tmp52.us.1 = shl i64 %tmp51.us.1, 3
  %scevgep45.us.1 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp52.us.1
  %scevgep4546.us.1 = bitcast i8* %scevgep45.us.1 to i64*
  %_p_scalar_47.us.1 = load i64, i64* %scevgep4546.us.1, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %p_add2548.us.1 = add nsw i64 %_p_scalar_47.us.1, %31, !dbg !194
  store i64 %p_add2548.us.1, i64* %scevgep4546.us.1, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %polly.indvar_next40.us.1 = add nsw i64 %polly.indvar39.us, 2
  %tmp51.us.2 = add i64 %48, %polly.indvar_next40.us.1
  %tmp52.us.2 = shl i64 %tmp51.us.2, 3
  %scevgep45.us.2 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp52.us.2
  %scevgep4546.us.2 = bitcast i8* %scevgep45.us.2 to i64*
  %_p_scalar_47.us.2 = load i64, i64* %scevgep4546.us.2, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %p_add2548.us.2 = add nsw i64 %_p_scalar_47.us.2, %31, !dbg !194
  store i64 %p_add2548.us.2, i64* %scevgep4546.us.2, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %polly.indvar_next40.us.2 = add nsw i64 %polly.indvar39.us, 3
  %tmp51.us.3 = add i64 %48, %polly.indvar_next40.us.2
  %tmp52.us.3 = shl i64 %tmp51.us.3, 3
  %scevgep45.us.3 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp52.us.3
  %scevgep4546.us.3 = bitcast i8* %scevgep45.us.3 to i64*
  %_p_scalar_47.us.3 = load i64, i64* %scevgep4546.us.3, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %p_add2548.us.3 = add nsw i64 %_p_scalar_47.us.3, %31, !dbg !194
  store i64 %p_add2548.us.3, i64* %scevgep4546.us.3, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %polly.indvar_next40.us.3 = add nsw i64 %polly.indvar39.us, 4
  %exitcond53.us.3 = icmp eq i64 %polly.indvar_next40.us.3, %8
  br i1 %exitcond53.us.3, label %polly.merge.us.loopexit.unr-lcssa, label %polly.loop_header35.us, !llvm.loop !203

polly.merge.us.loopexit.unr-lcssa:                ; preds = %polly.loop_header35.us
  br label %polly.merge.us.loopexit

polly.merge.us.loopexit:                          ; preds = %polly.loop_header35.preheader.us.split, %polly.merge.us.loopexit.unr-lcssa
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next15.us = add nuw nsw i64 %polly.indvar14.us, 1
  %polly.loop_cond17.us = icmp sgt i64 %polly.indvar14.us, %polly.adjust_ub16
  br i1 %polly.loop_cond17.us, label %polly.loop_exit12.loopexit, label %polly.loop_header10.us

polly.loop_header35.preheader.us:                 ; preds = %polly.cond.loopexit.us
  %48 = add i64 %13, %32
  br i1 %lcmp.mod100, label %polly.loop_header35.preheader.us.split, label %polly.loop_header35.us.prol.preheader

polly.loop_header35.us.prol.preheader:            ; preds = %polly.loop_header35.preheader.us
  br label %polly.loop_header35.us.prol

polly.loop_header35.us.prol:                      ; preds = %polly.loop_header35.us.prol, %polly.loop_header35.us.prol.preheader
  %polly.indvar39.us.prol = phi i64 [ %polly.indvar_next40.us.prol, %polly.loop_header35.us.prol ], [ 0, %polly.loop_header35.us.prol.preheader ]
  %prol.iter101 = phi i64 [ %prol.iter101.sub, %polly.loop_header35.us.prol ], [ %xtraiter99, %polly.loop_header35.us.prol.preheader ]
  %tmp51.us.prol = add i64 %48, %polly.indvar39.us.prol
  %tmp52.us.prol = shl i64 %tmp51.us.prol, 3
  %scevgep45.us.prol = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp52.us.prol
  %scevgep4546.us.prol = bitcast i8* %scevgep45.us.prol to i64*
  %_p_scalar_47.us.prol = load i64, i64* %scevgep4546.us.prol, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %p_add2548.us.prol = add nsw i64 %_p_scalar_47.us.prol, %31, !dbg !194
  store i64 %p_add2548.us.prol, i64* %scevgep4546.us.prol, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %polly.indvar_next40.us.prol = add nuw nsw i64 %polly.indvar39.us.prol, 1
  %prol.iter101.sub = add i64 %prol.iter101, -1
  %prol.iter101.cmp = icmp eq i64 %prol.iter101.sub, 0
  br i1 %prol.iter101.cmp, label %polly.loop_header35.preheader.us.split.loopexit, label %polly.loop_header35.us.prol, !llvm.loop !204

polly.loop_header35.preheader.us.split.loopexit:  ; preds = %polly.loop_header35.us.prol
  %polly.indvar_next40.us.prol.lcssa = phi i64 [ %polly.indvar_next40.us.prol, %polly.loop_header35.us.prol ]
  br label %polly.loop_header35.preheader.us.split

polly.loop_header35.preheader.us.split:           ; preds = %polly.loop_header35.preheader.us, %polly.loop_header35.preheader.us.split.loopexit
  %polly.indvar39.us.unr = phi i64 [ 0, %polly.loop_header35.preheader.us ], [ %polly.indvar_next40.us.prol.lcssa, %polly.loop_header35.preheader.us.split.loopexit ]
  br i1 %15, label %polly.merge.us.loopexit, label %polly.loop_header35.preheader.us.split.split

polly.loop_header35.preheader.us.split.split:     ; preds = %polly.loop_header35.preheader.us.split
  br label %polly.loop_header35.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header19.us
  br i1 %or.cond, label %polly.merge.us, label %polly.loop_header35.preheader.us

polly.loop_header10.preheader.split:              ; preds = %polly.loop_header10.preheader
  br i1 %or.cond, label %polly.loop_exit12, label %polly.loop_header10.preheader97

polly.loop_header10.preheader97:                  ; preds = %polly.loop_header10.preheader.split
  br label %polly.loop_header10

polly.loop_exit12.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit12

polly.loop_exit12.loopexit98:                     ; preds = %polly.merge
  br label %polly.loop_exit12

polly.loop_exit12:                                ; preds = %polly.loop_exit12.loopexit98, %polly.loop_exit12.loopexit, %polly.loop_header10.preheader.split, %polly.loop_header2
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond54 = icmp eq i64 %polly.indvar5, %polly.fdiv_q.shr
  br i1 %exitcond54, label %polly.loop_exit4.loopexit, label %polly.loop_header2

polly.loop_header10:                              ; preds = %polly.loop_header10.preheader97, %polly.merge
  %polly.indvar14 = phi i64 [ %polly.indvar_next15, %polly.merge ], [ 0, %polly.loop_header10.preheader97 ]
  %49 = add nsw i64 %polly.indvar14, %19
  %50 = mul i64 %49, %9
  %51 = add i64 %13, %50
  br i1 %lcmp.mod, label %polly.loop_header10.split, label %polly.loop_header35.prol.preheader

polly.loop_header35.prol.preheader:               ; preds = %polly.loop_header10
  br label %polly.loop_header35.prol

polly.loop_header35.prol:                         ; preds = %polly.loop_header35.prol, %polly.loop_header35.prol.preheader
  %polly.indvar39.prol = phi i64 [ %polly.indvar_next40.prol, %polly.loop_header35.prol ], [ 0, %polly.loop_header35.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %polly.loop_header35.prol ], [ %xtraiter, %polly.loop_header35.prol.preheader ]
  %tmp51.prol = add i64 %51, %polly.indvar39.prol
  %tmp52.prol = shl i64 %tmp51.prol, 3
  %scevgep45.prol = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp52.prol
  %scevgep4546.prol = bitcast i8* %scevgep45.prol to i64*
  %_p_scalar_47.prol = load i64, i64* %scevgep4546.prol, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %p_add2548.prol = add nsw i64 %_p_scalar_47.prol, %49, !dbg !194
  store i64 %p_add2548.prol, i64* %scevgep4546.prol, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %polly.indvar_next40.prol = add nuw nsw i64 %polly.indvar39.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %polly.loop_header10.split.loopexit, label %polly.loop_header35.prol, !llvm.loop !205

polly.loop_header10.split.loopexit:               ; preds = %polly.loop_header35.prol
  %polly.indvar_next40.prol.lcssa = phi i64 [ %polly.indvar_next40.prol, %polly.loop_header35.prol ]
  br label %polly.loop_header10.split

polly.loop_header10.split:                        ; preds = %polly.loop_header10, %polly.loop_header10.split.loopexit
  %polly.indvar39.unr = phi i64 [ 0, %polly.loop_header10 ], [ %polly.indvar_next40.prol.lcssa, %polly.loop_header10.split.loopexit ]
  br i1 %16, label %polly.merge, label %polly.loop_header10.split.split

polly.loop_header10.split.split:                  ; preds = %polly.loop_header10.split
  br label %polly.loop_header35

polly.merge.unr-lcssa:                            ; preds = %polly.loop_header35
  br label %polly.merge

polly.merge:                                      ; preds = %polly.loop_header10.split, %polly.merge.unr-lcssa
  %polly.indvar_next15 = add nuw nsw i64 %polly.indvar14, 1
  %polly.loop_cond17 = icmp sgt i64 %polly.indvar14, %polly.adjust_ub16
  br i1 %polly.loop_cond17, label %polly.loop_exit12.loopexit98, label %polly.loop_header10

polly.loop_header35:                              ; preds = %polly.loop_header35, %polly.loop_header10.split.split
  %polly.indvar39 = phi i64 [ %polly.indvar39.unr, %polly.loop_header10.split.split ], [ %polly.indvar_next40.3, %polly.loop_header35 ]
  %tmp51 = add i64 %51, %polly.indvar39
  %tmp52 = shl i64 %tmp51, 3
  %scevgep45 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp52
  %scevgep4546 = bitcast i8* %scevgep45 to i64*
  %_p_scalar_47 = load i64, i64* %scevgep4546, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %p_add2548 = add nsw i64 %_p_scalar_47, %49, !dbg !194
  store i64 %p_add2548, i64* %scevgep4546, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %polly.indvar_next40 = add nuw nsw i64 %polly.indvar39, 1
  %tmp51.1 = add i64 %51, %polly.indvar_next40
  %tmp52.1 = shl i64 %tmp51.1, 3
  %scevgep45.1 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp52.1
  %scevgep4546.1 = bitcast i8* %scevgep45.1 to i64*
  %_p_scalar_47.1 = load i64, i64* %scevgep4546.1, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %p_add2548.1 = add nsw i64 %_p_scalar_47.1, %49, !dbg !194
  store i64 %p_add2548.1, i64* %scevgep4546.1, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %polly.indvar_next40.1 = add nsw i64 %polly.indvar39, 2
  %tmp51.2 = add i64 %51, %polly.indvar_next40.1
  %tmp52.2 = shl i64 %tmp51.2, 3
  %scevgep45.2 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp52.2
  %scevgep4546.2 = bitcast i8* %scevgep45.2 to i64*
  %_p_scalar_47.2 = load i64, i64* %scevgep4546.2, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %p_add2548.2 = add nsw i64 %_p_scalar_47.2, %49, !dbg !194
  store i64 %p_add2548.2, i64* %scevgep4546.2, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %polly.indvar_next40.2 = add nsw i64 %polly.indvar39, 3
  %tmp51.3 = add i64 %51, %polly.indvar_next40.2
  %tmp52.3 = shl i64 %tmp51.3, 3
  %scevgep45.3 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp52.3
  %scevgep4546.3 = bitcast i8* %scevgep45.3 to i64*
  %_p_scalar_47.3 = load i64, i64* %scevgep4546.3, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %p_add2548.3 = add nsw i64 %_p_scalar_47.3, %49, !dbg !194
  store i64 %p_add2548.3, i64* %scevgep4546.3, align 8, !alias.scope !201, !noalias !2, !llvm.mem.parallel_loop_access !203
  %polly.indvar_next40.3 = add nsw i64 %polly.indvar39, 4
  %exitcond53.3 = icmp eq i64 %polly.indvar_next40.3, %8
  br i1 %exitcond53.3, label %polly.merge.unr-lcssa, label %polly.loop_header35, !llvm.loop !203
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @mat_mult_polly_subfn(i8* nocapture readonly %polly.par.userContext) #5 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i32*
  %polly.subfunc.arg. = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 4
  %2 = bitcast i8* %1 to i32*
  %polly.subfunc.arg.2 = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %4 = bitcast i8* %3 to i8**
  %polly.subfunc.arg.call = load i8*, i8** %4, align 8
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit, label %polly.par.loadIVBounds.lr.ph

polly.par.loadIVBounds.lr.ph:                     ; preds = %polly.par.setup
  %7 = zext i32 %polly.subfunc.arg. to i64
  %8 = and i64 %7, 3
  %9 = sext i32 %polly.subfunc.arg.2 to i64
  %10 = sext i32 %polly.subfunc.arg. to i64
  %11 = add nsw i64 %10, -1
  %polly.fdiv_q.shr = ashr i64 %11, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %pexp.p_div_q = lshr i64 %10, 2
  %12 = add nsw i64 %pexp.p_div_q, -1
  %pexp.pdiv_r = and i32 %polly.subfunc.arg., 3
  %polly.loop_guard39 = icmp eq i32 %pexp.pdiv_r, 0
  %13 = shl nsw i64 %9, 3
  %14 = shl nsw i64 %9, 8
  %15 = sub nsw i64 %10, %8
  %16 = shl nsw i64 %9, 5
  %17 = shl nuw nsw i64 %8, 3
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit5
  %18 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.lr.ph, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  %20 = mul i64 %16, %polly.par.LB
  %21 = add i64 %15, %20
  %22 = shl i64 %21, 3
  %23 = mul i64 %14, %polly.par.LB
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit5, %polly.par.loadIVBounds
  %indvar = phi i64 [ %indvar.next, %polly.loop_exit5 ], [ 0, %polly.par.loadIVBounds ]
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit5 ], [ %polly.par.LB, %polly.par.loadIVBounds ]
  %24 = mul i64 %14, %indvar
  %25 = add i64 %23, %24
  %26 = add i64 %22, %24
  br i1 %polly.loop_guard, label %polly.loop_header3.preheader, label %polly.loop_exit5

polly.loop_header3.preheader:                     ; preds = %polly.loop_header
  %27 = shl nsw i64 %polly.indvar, 5
  %28 = sub nsw i64 %9, %27
  %29 = add nsw i64 %28, -1
  %30 = icmp sgt i64 %29, 31
  %31 = select i1 %30, i64 31, i64 %29
  %polly.loop_guard14 = icmp sgt i64 %31, -1
  %polly.adjust_ub17 = add i64 %31, -1
  br label %polly.loop_header3

polly.loop_exit5.loopexit:                        ; preds = %polly.loop_exit13
  br label %polly.loop_exit5

polly.loop_exit5:                                 ; preds = %polly.loop_exit5.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  %indvar.next = add i64 %indvar, 1
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header3:                               ; preds = %polly.loop_header3.preheader, %polly.loop_exit13
  %polly.indvar6 = phi i64 [ %polly.indvar_next7, %polly.loop_exit13 ], [ 0, %polly.loop_header3.preheader ]
  %32 = shl i64 %polly.indvar6, 8
  %33 = add i64 %25, %32
  %34 = shl i64 %polly.indvar6, 3
  %35 = sub i64 %34, %pexp.p_div_q
  %36 = icmp sgt i64 %35, -8
  %smax95 = select i1 %36, i64 %35, i64 -8
  %37 = sub i64 -2, %smax95
  %38 = icmp sgt i64 %37, -1
  %smax96 = select i1 %38, i64 %37, i64 -1
  %39 = shl i64 %smax96, 5
  %40 = add i64 %39, 64
  br i1 %polly.loop_guard14, label %polly.loop_header11.preheader, label %polly.loop_exit13

polly.loop_header11.preheader:                    ; preds = %polly.loop_header3
  %41 = mul nsw i64 %polly.indvar6, -8
  %42 = add nsw i64 %12, %41
  %polly.loop_guard2397 = icmp sgt i64 %42, -1
  %43 = shl nsw i64 %polly.indvar6, 5
  %44 = or i64 %43, 31
  %45 = icmp slt i64 %44, %10
  %or.cond = or i1 %polly.loop_guard39, %45
  br i1 %polly.loop_guard2397, label %polly.loop_header11.preheader.split.us, label %polly.loop_header11.preheader.split

polly.loop_header11.preheader.split.us:           ; preds = %polly.loop_header11.preheader
  br i1 %or.cond, label %polly.loop_header11.us.us.preheader, label %polly.loop_header11.us.preheader

polly.loop_header11.us.preheader:                 ; preds = %polly.loop_header11.preheader.split.us
  br label %polly.loop_header11.us

polly.loop_header11.us.us.preheader:              ; preds = %polly.loop_header11.preheader.split.us
  br label %polly.loop_header11.us.us

polly.loop_header11.us.us:                        ; preds = %polly.loop_header11.us.us.preheader, %polly.loop_header11.us.us
  %polly.indvar15.us.us = phi i64 [ %polly.indvar_next16.us.us, %polly.loop_header11.us.us ], [ 0, %polly.loop_header11.us.us.preheader ]
  %46 = mul i64 %13, %polly.indvar15.us.us
  %47 = add i64 %33, %46
  %scevgep94 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep94, i8 0, i64 %40, i32 8, i1 false)
  %polly.indvar_next16.us.us = add nuw nsw i64 %polly.indvar15.us.us, 1
  %polly.loop_cond18.us.us = icmp sgt i64 %polly.indvar15.us.us, %polly.adjust_ub17
  br i1 %polly.loop_cond18.us.us, label %polly.loop_exit13.loopexit, label %polly.loop_header11.us.us

polly.loop_header11.us:                           ; preds = %polly.loop_header11.us.preheader, %polly.loop_header11.us
  %polly.indvar15.us = phi i64 [ %polly.indvar_next16.us, %polly.loop_header11.us ], [ 0, %polly.loop_header11.us.preheader ]
  %48 = mul i64 %13, %polly.indvar15.us
  %49 = add i64 %26, %48
  %scevgep92 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %49
  %50 = add i64 %33, %48
  %scevgep90 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %50
  call void @llvm.memset.p0i8.i64(i8* %scevgep90, i8 0, i64 %40, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %scevgep92, i8 0, i64 %17, i32 8, i1 false)
  %polly.indvar_next16.us = add nuw nsw i64 %polly.indvar15.us, 1
  %polly.loop_cond18.us = icmp sgt i64 %polly.indvar15.us, %polly.adjust_ub17
  br i1 %polly.loop_cond18.us, label %polly.loop_exit13.loopexit104, label %polly.loop_header11.us

polly.loop_header11.preheader.split:              ; preds = %polly.loop_header11.preheader
  br i1 %or.cond, label %polly.loop_exit13, label %polly.loop_header11.preheader105

polly.loop_header11.preheader105:                 ; preds = %polly.loop_header11.preheader.split
  br label %polly.loop_header11

polly.loop_exit13.loopexit:                       ; preds = %polly.loop_header11.us.us
  br label %polly.loop_exit13

polly.loop_exit13.loopexit104:                    ; preds = %polly.loop_header11.us
  br label %polly.loop_exit13

polly.loop_exit13.loopexit106:                    ; preds = %polly.loop_header11
  br label %polly.loop_exit13

polly.loop_exit13:                                ; preds = %polly.loop_exit13.loopexit106, %polly.loop_exit13.loopexit104, %polly.loop_exit13.loopexit, %polly.loop_header11.preheader.split, %polly.loop_header3
  %polly.indvar_next7 = add nuw nsw i64 %polly.indvar6, 1
  %exitcond53 = icmp eq i64 %polly.indvar6, %polly.fdiv_q.shr
  br i1 %exitcond53, label %polly.loop_exit5.loopexit, label %polly.loop_header3

polly.loop_header11:                              ; preds = %polly.loop_header11.preheader105, %polly.loop_header11
  %polly.indvar15 = phi i64 [ %polly.indvar_next16, %polly.loop_header11 ], [ 0, %polly.loop_header11.preheader105 ]
  %51 = mul i64 %13, %polly.indvar15
  %52 = add i64 %26, %51
  %scevgep = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %52
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %17, i32 8, i1 false)
  %polly.indvar_next16 = add nuw nsw i64 %polly.indvar15, 1
  %polly.loop_cond18 = icmp sgt i64 %polly.indvar15, %polly.adjust_ub17
  br i1 %polly.loop_cond18, label %polly.loop_exit13.loopexit106, label %polly.loop_header11
}

define internal void @mat_mult_polly_subfn_4(i8* nocapture readonly %polly.par.userContext) #5 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i32*
  %polly.subfunc.arg. = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 4
  %2 = bitcast i8* %1 to i32*
  %polly.subfunc.arg.2 = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %4 = bitcast i8* %3 to i8**
  %polly.subfunc.arg.call = load i8*, i8** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.3 = load i64*, i64** %6, align 8
  %7 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 24
  %8 = bitcast i8* %7 to i64**
  %polly.subfunc.arg.4 = load i64*, i64** %8, align 8
  %9 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %polly.par.exit, label %polly.par.loadIVBounds.lr.ph

polly.par.loadIVBounds.lr.ph:                     ; preds = %polly.par.setup
  %11 = zext i32 %polly.subfunc.arg.2 to i64
  %12 = and i64 %11, 3
  %13 = sext i32 %polly.subfunc.arg.2 to i64
  %14 = add nsw i64 %13, -1
  %15 = lshr i64 %14, 5
  %16 = sext i32 %polly.subfunc.arg. to i64
  %17 = add nsw i64 %16, -1
  %polly.fdiv_q.shr = ashr i64 %17, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %pexp.p_div_q37 = lshr i64 %13, 2
  %18 = add nsw i64 %pexp.p_div_q37, -1
  %pexp.pdiv_r = and i32 %polly.subfunc.arg.2, 3
  %polly.loop_guard62 = icmp eq i32 %pexp.pdiv_r, 0
  %19 = sub nsw i64 %13, %12
  %20 = add nsw i64 %12, -1
  %xtraiter149 = and i64 %11, 1
  %lcmp.mod150 = icmp eq i64 %xtraiter149, 0
  %21 = mul i64 %19, %13
  %22 = icmp eq i64 %20, 0
  %xtraiter = and i64 %11, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %23 = mul i64 %19, %13
  %24 = icmp eq i64 %20, 0
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit7
  %25 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.lr.ph, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit7, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit7 ]
  br i1 %polly.loop_guard, label %polly.loop_header5.preheader, label %polly.loop_exit7

polly.loop_header5.preheader:                     ; preds = %polly.loop_header
  %27 = shl nsw i64 %polly.indvar, 5
  %28 = sub nsw i64 %13, %27
  %29 = add nsw i64 %28, -1
  %30 = icmp sgt i64 %29, 31
  %31 = select i1 %30, i64 31, i64 %29
  %polly.loop_guard23 = icmp sgt i64 %31, -1
  %polly.adjust_ub26 = add i64 %31, -1
  br label %polly.loop_header5

polly.loop_exit7.loopexit:                        ; preds = %polly.loop_exit14
  br label %polly.loop_exit7

polly.loop_exit7:                                 ; preds = %polly.loop_exit7.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header5:                               ; preds = %polly.loop_header5.preheader, %polly.loop_exit14
  %polly.indvar8 = phi i64 [ %polly.indvar_next9, %polly.loop_exit14 ], [ 0, %polly.loop_header5.preheader ]
  %32 = shl nsw i64 %polly.indvar8, 5
  %33 = sub nsw i64 %16, %32
  %34 = add nsw i64 %33, -1
  %35 = icmp sgt i64 %34, 31
  %36 = select i1 %35, i64 31, i64 %34
  %polly.loop_guard32 = icmp sgt i64 %36, -1
  %polly.adjust_ub35 = add i64 %36, -1
  br label %polly.loop_header12

polly.loop_exit14:                                ; preds = %polly.loop_exit22
  %polly.indvar_next9 = add nuw nsw i64 %polly.indvar8, 1
  %exitcond84 = icmp eq i64 %polly.indvar8, %polly.fdiv_q.shr
  br i1 %exitcond84, label %polly.loop_exit7.loopexit, label %polly.loop_header5

polly.loop_header12:                              ; preds = %polly.loop_exit22, %polly.loop_header5
  %polly.indvar15 = phi i64 [ 0, %polly.loop_header5 ], [ %polly.indvar_next16, %polly.loop_exit22 ]
  br i1 %polly.loop_guard23, label %polly.loop_header20.preheader, label %polly.loop_exit22

polly.loop_header20.preheader:                    ; preds = %polly.loop_header12
  %37 = mul nsw i64 %polly.indvar15, -8
  %38 = add nsw i64 %18, %37
  %39 = icmp sgt i64 %38, 7
  %40 = select i1 %39, i64 7, i64 %38
  %polly.loop_guard42 = icmp sgt i64 %40, -1
  %41 = shl i64 %polly.indvar15, 5
  %42 = or i64 %41, 31
  %43 = icmp slt i64 %42, %13
  %or.cond = or i1 %polly.loop_guard62, %43
  %polly.adjust_ub45 = add i64 %40, -1
  br label %polly.loop_header20

polly.loop_exit22.loopexit:                       ; preds = %polly.loop_exit31
  br label %polly.loop_exit22

polly.loop_exit22:                                ; preds = %polly.loop_exit22.loopexit, %polly.loop_header12
  %polly.indvar_next16 = add nuw nsw i64 %polly.indvar15, 1
  %exitcond83 = icmp eq i64 %polly.indvar15, %15
  br i1 %exitcond83, label %polly.loop_exit14, label %polly.loop_header12

polly.loop_header20:                              ; preds = %polly.loop_header20.preheader, %polly.loop_exit31
  %polly.indvar24 = phi i64 [ %polly.indvar_next25, %polly.loop_exit31 ], [ 0, %polly.loop_header20.preheader ]
  br i1 %polly.loop_guard32, label %polly.loop_header29.preheader, label %polly.loop_exit31

polly.loop_header29.preheader:                    ; preds = %polly.loop_header20
  %44 = add nsw i64 %polly.indvar24, %27
  %45 = mul i64 %44, %13
  br i1 %polly.loop_guard42, label %polly.loop_header29.us.preheader, label %polly.loop_header29.preheader.split

polly.loop_header29.us.preheader:                 ; preds = %polly.loop_header29.preheader
  %46 = add i64 %19, %45
  %scevgep72.us.prol = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %46
  br label %polly.loop_header29.us

polly.loop_header29.us:                           ; preds = %polly.loop_header29.us.preheader, %polly.merge.us
  %polly.indvar33.us = phi i64 [ %polly.indvar_next34.us, %polly.merge.us ], [ 0, %polly.loop_header29.us.preheader ]
  %47 = add nuw nsw i64 %polly.indvar33.us, %32
  %tmp.us = add i64 %47, %45
  %tmp79.us = shl i64 %tmp.us, 3
  %scevgep.us = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp79.us
  %scevgep53.us = bitcast i8* %scevgep.us to i64*
  %scevgep53.promoted86.us = load i64, i64* %scevgep53.us, align 8, !alias.scope !206, !noalias !208
  br label %polly.loop_header39.us

polly.loop_header39.us:                           ; preds = %polly.loop_header29.us, %polly.loop_header39.us
  %p_add30.lcssa87.us = phi i64 [ %p_add30.us.3, %polly.loop_header39.us ], [ %scevgep53.promoted86.us, %polly.loop_header29.us ]
  %polly.indvar43.us = phi i64 [ %polly.indvar_next44.us, %polly.loop_header39.us ], [ 0, %polly.loop_header29.us ]
  %48 = shl i64 %polly.indvar43.us, 2
  %49 = add nuw nsw i64 %48, %41
  %50 = add i64 %49, %45
  %scevgep54.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %50
  %_p_scalar_55.us = load i64, i64* %scevgep54.us, align 8, !alias.scope !209, !noalias !211, !llvm.mem.parallel_loop_access !212
  %51 = mul i64 %49, %13
  %52 = add i64 %51, %47
  %scevgep56.us = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %52
  %_p_scalar_57.us = load i64, i64* %scevgep56.us, align 8, !alias.scope !210, !noalias !213, !llvm.mem.parallel_loop_access !212
  %p_mul29.us = mul nsw i64 %_p_scalar_57.us, %_p_scalar_55.us, !dbg !142
  %p_add30.us = add nsw i64 %p_mul29.us, %p_add30.lcssa87.us, !dbg !148
  %53 = or i64 %49, 1
  %54 = add i64 %53, %45
  %scevgep54.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %54
  %_p_scalar_55.us.1 = load i64, i64* %scevgep54.us.1, align 8, !alias.scope !209, !noalias !211, !llvm.mem.parallel_loop_access !212
  %55 = mul i64 %53, %13
  %56 = add i64 %55, %47
  %scevgep56.us.1 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %56
  %_p_scalar_57.us.1 = load i64, i64* %scevgep56.us.1, align 8, !alias.scope !210, !noalias !213, !llvm.mem.parallel_loop_access !212
  %p_mul29.us.1 = mul nsw i64 %_p_scalar_57.us.1, %_p_scalar_55.us.1, !dbg !142
  %p_add30.us.1 = add nsw i64 %p_mul29.us.1, %p_add30.us, !dbg !148
  %57 = or i64 %49, 2
  %58 = add i64 %57, %45
  %scevgep54.us.2 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %58
  %_p_scalar_55.us.2 = load i64, i64* %scevgep54.us.2, align 8, !alias.scope !209, !noalias !211, !llvm.mem.parallel_loop_access !212
  %59 = mul i64 %57, %13
  %60 = add i64 %59, %47
  %scevgep56.us.2 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %60
  %_p_scalar_57.us.2 = load i64, i64* %scevgep56.us.2, align 8, !alias.scope !210, !noalias !213, !llvm.mem.parallel_loop_access !212
  %p_mul29.us.2 = mul nsw i64 %_p_scalar_57.us.2, %_p_scalar_55.us.2, !dbg !142
  %p_add30.us.2 = add nsw i64 %p_mul29.us.2, %p_add30.us.1, !dbg !148
  %61 = or i64 %49, 3
  %62 = add i64 %61, %45
  %scevgep54.us.3 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %62
  %_p_scalar_55.us.3 = load i64, i64* %scevgep54.us.3, align 8, !alias.scope !209, !noalias !211, !llvm.mem.parallel_loop_access !212
  %63 = mul i64 %61, %13
  %64 = add i64 %63, %47
  %scevgep56.us.3 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %64
  %_p_scalar_57.us.3 = load i64, i64* %scevgep56.us.3, align 8, !alias.scope !210, !noalias !213, !llvm.mem.parallel_loop_access !212
  %p_mul29.us.3 = mul nsw i64 %_p_scalar_57.us.3, %_p_scalar_55.us.3, !dbg !142
  %p_add30.us.3 = add nsw i64 %p_mul29.us.3, %p_add30.us.2, !dbg !148
  %polly.indvar_next44.us = add nuw nsw i64 %polly.indvar43.us, 1
  %polly.loop_cond46.us = icmp sgt i64 %polly.indvar43.us, %polly.adjust_ub45
  br i1 %polly.loop_cond46.us, label %polly.cond.loopexit.us, label %polly.loop_header39.us

polly.loop_header59.us:                           ; preds = %polly.loop_header59.us, %polly.loop_header59.us.preheader.split.split
  %p_add307788.us = phi i64 [ %p_add307788.us.unr, %polly.loop_header59.us.preheader.split.split ], [ %p_add3077.us.1, %polly.loop_header59.us ]
  %polly.indvar63.us = phi i64 [ %polly.indvar63.us.unr, %polly.loop_header59.us.preheader.split.split ], [ %polly.indvar_next64.us.1, %polly.loop_header59.us ]
  %65 = add nsw i64 %polly.indvar63.us, %19
  %66 = add i64 %65, %45
  %scevgep72.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %66
  %_p_scalar_73.us = load i64, i64* %scevgep72.us, align 8, !alias.scope !209, !noalias !211, !llvm.mem.parallel_loop_access !214
  %67 = mul i64 %65, %13
  %68 = add nsw i64 %67, %47
  %scevgep74.us = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %68
  %_p_scalar_75.us = load i64, i64* %scevgep74.us, align 8, !alias.scope !210, !noalias !213, !llvm.mem.parallel_loop_access !214
  %p_mul2976.us = mul nsw i64 %_p_scalar_75.us, %_p_scalar_73.us, !dbg !142
  %p_add3077.us = add nsw i64 %p_mul2976.us, %p_add307788.us, !dbg !148
  %polly.indvar_next64.us = add nuw nsw i64 %polly.indvar63.us, 1
  %69 = add nsw i64 %polly.indvar_next64.us, %19
  %70 = add i64 %69, %45
  %scevgep72.us.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %70
  %_p_scalar_73.us.1 = load i64, i64* %scevgep72.us.1, align 8, !alias.scope !209, !noalias !211, !llvm.mem.parallel_loop_access !214
  %71 = mul i64 %69, %13
  %72 = add nsw i64 %71, %47
  %scevgep74.us.1 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %72
  %_p_scalar_75.us.1 = load i64, i64* %scevgep74.us.1, align 8, !alias.scope !210, !noalias !213, !llvm.mem.parallel_loop_access !214
  %p_mul2976.us.1 = mul nsw i64 %_p_scalar_75.us.1, %_p_scalar_73.us.1, !dbg !142
  %p_add3077.us.1 = add nsw i64 %p_mul2976.us.1, %p_add3077.us, !dbg !148
  %polly.indvar_next64.us.1 = add nsw i64 %polly.indvar63.us, 2
  %exitcond82.us.1 = icmp eq i64 %polly.indvar_next64.us.1, %12
  br i1 %exitcond82.us.1, label %polly.merge.loopexit.us.unr-lcssa, label %polly.loop_header59.us, !llvm.loop !214

polly.merge.us:                                   ; preds = %polly.merge.loopexit.us, %polly.cond.loopexit.us
  %polly.indvar_next34.us = add nuw nsw i64 %polly.indvar33.us, 1
  %polly.loop_cond36.us = icmp sgt i64 %polly.indvar33.us, %polly.adjust_ub35
  br i1 %polly.loop_cond36.us, label %polly.loop_exit31.loopexit, label %polly.loop_header29.us

polly.merge.loopexit.us.unr-lcssa:                ; preds = %polly.loop_header59.us
  %p_add3077.us.1.lcssa = phi i64 [ %p_add3077.us.1, %polly.loop_header59.us ]
  br label %polly.merge.loopexit.us

polly.merge.loopexit.us:                          ; preds = %polly.loop_header59.us.preheader.split, %polly.merge.loopexit.us.unr-lcssa
  %p_add3077.us.lcssa = phi i64 [ %p_add3077.us.lcssa.unr, %polly.loop_header59.us.preheader.split ], [ %p_add3077.us.1.lcssa, %polly.merge.loopexit.us.unr-lcssa ]
  store i64 %p_add3077.us.lcssa, i64* %scevgep53.us, align 8, !alias.scope !206, !noalias !208
  br label %polly.merge.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header39.us
  %p_add30.us.3.lcssa = phi i64 [ %p_add30.us.3, %polly.loop_header39.us ]
  store i64 %p_add30.us.3.lcssa, i64* %scevgep53.us, align 8, !alias.scope !206, !noalias !208
  br i1 %or.cond, label %polly.merge.us, label %polly.loop_header59.us.preheader

polly.loop_header59.us.preheader:                 ; preds = %polly.cond.loopexit.us
  br i1 %lcmp.mod150, label %polly.loop_header59.us.preheader.split, label %polly.loop_header59.us.prol

polly.loop_header59.us.prol:                      ; preds = %polly.loop_header59.us.preheader
  %_p_scalar_73.us.prol = load i64, i64* %scevgep72.us.prol, align 8, !alias.scope !209, !noalias !211, !llvm.mem.parallel_loop_access !214
  %73 = add nsw i64 %21, %47
  %scevgep74.us.prol = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %73
  %_p_scalar_75.us.prol = load i64, i64* %scevgep74.us.prol, align 8, !alias.scope !210, !noalias !213, !llvm.mem.parallel_loop_access !214
  %p_mul2976.us.prol = mul nsw i64 %_p_scalar_75.us.prol, %_p_scalar_73.us.prol, !dbg !142
  %p_add3077.us.prol = add nsw i64 %p_mul2976.us.prol, %p_add30.us.3.lcssa, !dbg !148
  br label %polly.loop_header59.us.preheader.split

polly.loop_header59.us.preheader.split:           ; preds = %polly.loop_header59.us.preheader, %polly.loop_header59.us.prol
  %p_add3077.us.lcssa.unr = phi i64 [ undef, %polly.loop_header59.us.preheader ], [ %p_add3077.us.prol, %polly.loop_header59.us.prol ]
  %p_add307788.us.unr = phi i64 [ %p_add30.us.3.lcssa, %polly.loop_header59.us.preheader ], [ %p_add3077.us.prol, %polly.loop_header59.us.prol ]
  %polly.indvar63.us.unr = phi i64 [ 0, %polly.loop_header59.us.preheader ], [ 1, %polly.loop_header59.us.prol ]
  br i1 %22, label %polly.merge.loopexit.us, label %polly.loop_header59.us.preheader.split.split

polly.loop_header59.us.preheader.split.split:     ; preds = %polly.loop_header59.us.preheader.split
  br label %polly.loop_header59.us

polly.loop_header29.preheader.split:              ; preds = %polly.loop_header29.preheader
  br i1 %or.cond, label %polly.loop_exit31, label %polly.loop_header29.preheader147

polly.loop_header29.preheader147:                 ; preds = %polly.loop_header29.preheader.split
  %74 = add i64 %19, %45
  %scevgep72.prol = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %74
  br label %polly.loop_header29

polly.loop_exit31.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit31

polly.loop_exit31.loopexit148:                    ; preds = %polly.merge.loopexit
  br label %polly.loop_exit31

polly.loop_exit31:                                ; preds = %polly.loop_exit31.loopexit148, %polly.loop_exit31.loopexit, %polly.loop_header29.preheader.split, %polly.loop_header20
  %polly.indvar_next25 = add nuw nsw i64 %polly.indvar24, 1
  %polly.loop_cond27 = icmp sgt i64 %polly.indvar24, %polly.adjust_ub26
  br i1 %polly.loop_cond27, label %polly.loop_exit22.loopexit, label %polly.loop_header20

polly.loop_header29:                              ; preds = %polly.loop_header29.preheader147, %polly.merge.loopexit
  %polly.indvar33 = phi i64 [ %polly.indvar_next34, %polly.merge.loopexit ], [ 0, %polly.loop_header29.preheader147 ]
  %75 = add nuw nsw i64 %polly.indvar33, %32
  %tmp80 = add i64 %75, %45
  %tmp81 = shl i64 %tmp80, 3
  %scevgep69 = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp81
  %scevgep6970 = bitcast i8* %scevgep69 to i64*
  %scevgep6970.promoted = load i64, i64* %scevgep6970, align 8, !alias.scope !206, !noalias !208
  br i1 %lcmp.mod, label %polly.loop_header29.split, label %polly.loop_header59.prol

polly.loop_header59.prol:                         ; preds = %polly.loop_header29
  %_p_scalar_73.prol = load i64, i64* %scevgep72.prol, align 8, !alias.scope !209, !noalias !211, !llvm.mem.parallel_loop_access !214
  %76 = add nsw i64 %23, %75
  %scevgep74.prol = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %76
  %_p_scalar_75.prol = load i64, i64* %scevgep74.prol, align 8, !alias.scope !210, !noalias !213, !llvm.mem.parallel_loop_access !214
  %p_mul2976.prol = mul nsw i64 %_p_scalar_75.prol, %_p_scalar_73.prol, !dbg !142
  %p_add3077.prol = add nsw i64 %p_mul2976.prol, %scevgep6970.promoted, !dbg !148
  br label %polly.loop_header29.split

polly.loop_header29.split:                        ; preds = %polly.loop_header29, %polly.loop_header59.prol
  %p_add3077.lcssa.unr = phi i64 [ undef, %polly.loop_header29 ], [ %p_add3077.prol, %polly.loop_header59.prol ]
  %p_add307788.unr = phi i64 [ %scevgep6970.promoted, %polly.loop_header29 ], [ %p_add3077.prol, %polly.loop_header59.prol ]
  %polly.indvar63.unr = phi i64 [ 0, %polly.loop_header29 ], [ 1, %polly.loop_header59.prol ]
  br i1 %24, label %polly.merge.loopexit, label %polly.loop_header29.split.split

polly.loop_header29.split.split:                  ; preds = %polly.loop_header29.split
  br label %polly.loop_header59

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header59
  %p_add3077.1.lcssa = phi i64 [ %p_add3077.1, %polly.loop_header59 ]
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.loop_header29.split, %polly.merge.loopexit.unr-lcssa
  %p_add3077.lcssa = phi i64 [ %p_add3077.lcssa.unr, %polly.loop_header29.split ], [ %p_add3077.1.lcssa, %polly.merge.loopexit.unr-lcssa ]
  store i64 %p_add3077.lcssa, i64* %scevgep6970, align 8, !alias.scope !206, !noalias !208
  %polly.indvar_next34 = add nuw nsw i64 %polly.indvar33, 1
  %polly.loop_cond36 = icmp sgt i64 %polly.indvar33, %polly.adjust_ub35
  br i1 %polly.loop_cond36, label %polly.loop_exit31.loopexit148, label %polly.loop_header29

polly.loop_header59:                              ; preds = %polly.loop_header59, %polly.loop_header29.split.split
  %p_add307788 = phi i64 [ %p_add307788.unr, %polly.loop_header29.split.split ], [ %p_add3077.1, %polly.loop_header59 ]
  %polly.indvar63 = phi i64 [ %polly.indvar63.unr, %polly.loop_header29.split.split ], [ %polly.indvar_next64.1, %polly.loop_header59 ]
  %77 = add nsw i64 %polly.indvar63, %19
  %78 = add i64 %77, %45
  %scevgep72 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %78
  %_p_scalar_73 = load i64, i64* %scevgep72, align 8, !alias.scope !209, !noalias !211, !llvm.mem.parallel_loop_access !214
  %79 = mul i64 %77, %13
  %80 = add nsw i64 %79, %75
  %scevgep74 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %80
  %_p_scalar_75 = load i64, i64* %scevgep74, align 8, !alias.scope !210, !noalias !213, !llvm.mem.parallel_loop_access !214
  %p_mul2976 = mul nsw i64 %_p_scalar_75, %_p_scalar_73, !dbg !142
  %p_add3077 = add nsw i64 %p_mul2976, %p_add307788, !dbg !148
  %polly.indvar_next64 = add nuw nsw i64 %polly.indvar63, 1
  %81 = add nsw i64 %polly.indvar_next64, %19
  %82 = add i64 %81, %45
  %scevgep72.1 = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %82
  %_p_scalar_73.1 = load i64, i64* %scevgep72.1, align 8, !alias.scope !209, !noalias !211, !llvm.mem.parallel_loop_access !214
  %83 = mul i64 %81, %13
  %84 = add nsw i64 %83, %75
  %scevgep74.1 = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %84
  %_p_scalar_75.1 = load i64, i64* %scevgep74.1, align 8, !alias.scope !210, !noalias !213, !llvm.mem.parallel_loop_access !214
  %p_mul2976.1 = mul nsw i64 %_p_scalar_75.1, %_p_scalar_73.1, !dbg !142
  %p_add3077.1 = add nsw i64 %p_mul2976.1, %p_add3077, !dbg !148
  %polly.indvar_next64.1 = add nsw i64 %polly.indvar63, 2
  %exitcond82.1 = icmp eq i64 %polly.indvar_next64.1, %12
  br i1 %exitcond82.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header59, !llvm.loop !214
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { "polly.skip.fn" }
attributes #6 = { nounwind }

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
!98 = !DILocation(line: 47, column: 26, scope: !25)
!99 = !DILocation(line: 47, column: 37, scope: !25)
!100 = !DILocation(line: 49, column: 20, scope: !25)
!101 = !DILocation(line: 49, column: 9, scope: !25)
!102 = !DILocation(line: 50, column: 21, scope: !25)
!103 = !DILocation(line: 50, column: 9, scope: !25)
!104 = !DILocation(line: 51, column: 28, scope: !25)
!105 = !DILocation(line: 51, column: 16, scope: !25)
!106 = !DILocation(line: 52, column: 28, scope: !25)
!107 = !DILocation(line: 52, column: 16, scope: !25)
!108 = !DILocation(line: 53, column: 60, scope: !25)
!109 = !DILocation(line: 53, column: 59, scope: !25)
!110 = !DILocation(line: 53, column: 66, scope: !25)
!111 = !DILocation(line: 53, column: 65, scope: !25)
!112 = !DILocation(line: 53, column: 35, scope: !113)
!113 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 1)
!114 = !DILocation(line: 53, column: 23, scope: !25)
!115 = !DILocation(line: 53, column: 16, scope: !25)
!116 = !DILocation(line: 48, column: 9, scope: !25)
!117 = !DILocation(line: 55, column: 15, scope: !118)
!118 = !DILexicalBlockFile(scope: !119, file: !1, discriminator: 1)
!119 = distinct !DILexicalBlock(scope: !120, file: !1, line: 55, column: 5)
!120 = distinct !DILexicalBlock(scope: !25, file: !1, line: 55, column: 5)
!121 = !DILocation(line: 55, column: 5, scope: !118)
!122 = !DILocation(line: 56, column: 19, scope: !123)
!123 = !DILexicalBlockFile(scope: !124, file: !1, discriminator: 1)
!124 = distinct !DILexicalBlock(scope: !125, file: !1, line: 56, column: 9)
!125 = distinct !DILexicalBlock(scope: !126, file: !1, line: 56, column: 9)
!126 = distinct !DILexicalBlock(scope: !119, file: !1, line: 55, column: 29)
!127 = !DILocation(line: 56, column: 9, scope: !123)
!128 = !DILocation(line: 58, column: 13, scope: !129)
!129 = !DILexicalBlockFile(scope: !130, file: !1, discriminator: 1)
!130 = distinct !DILexicalBlock(scope: !131, file: !1, line: 58, column: 13)
!131 = distinct !DILexicalBlock(scope: !132, file: !1, line: 58, column: 13)
!132 = distinct !DILexicalBlock(scope: !124, file: !1, line: 56, column: 34)
!133 = !DILocation(line: 57, column: 19, scope: !132)
!134 = !DILocation(line: 59, column: 53, scope: !130)
!135 = !DILocation(line: 57, column: 25, scope: !132)
!136 = !DILocation(line: 57, column: 13, scope: !132)
!137 = !DILocation(line: 57, column: 29, scope: !132)
!138 = !{!139, !139, i64 0}
!139 = !{!"long long", !88, i64 0}
!140 = !DILocation(line: 48, column: 15, scope: !25)
!141 = !DILocation(line: 59, column: 73, scope: !130)
!142 = !DILocation(line: 59, column: 71, scope: !130)
!143 = !DILocation(line: 59, column: 33, scope: !130)
!144 = !DILocation(line: 59, column: 35, scope: !130)
!145 = !DILocation(line: 59, column: 67, scope: !130)
!146 = !DILocation(line: 59, column: 81, scope: !130)
!147 = !DILocation(line: 59, column: 87, scope: !130)
!148 = !DILocation(line: 59, column: 51, scope: !130)
!149 = !DILocation(line: 63, column: 17, scope: !113)
!150 = !DILocation(line: 63, column: 17, scope: !25)
!151 = !DILocation(line: 63, column: 13, scope: !25)
!152 = !DILocation(line: 64, column: 8, scope: !25)
!153 = !DILocation(line: 64, column: 14, scope: !25)
!154 = !DILocation(line: 65, column: 8, scope: !25)
!155 = !DILocation(line: 65, column: 15, scope: !25)
!156 = !DILocation(line: 66, column: 13, scope: !25)
!157 = !DILocation(line: 67, column: 5, scope: !25)
!158 = !DILocation(line: 71, column: 14, scope: !40)
!159 = !DILocation(line: 71, column: 27, scope: !40)
!160 = !DILocation(line: 74, column: 5, scope: !40)
!161 = !DILocation(line: 75, column: 12, scope: !40)
!162 = !{!87, !87, i64 0}
!163 = !DIExpression(DW_OP_deref)
!164 = !DILocation(line: 74, column: 9, scope: !40)
!165 = !DILocation(line: 75, column: 5, scope: !40)
!166 = !DILocation(line: 76, column: 24, scope: !40)
!167 = !{!90, !90, i64 0}
!168 = !DILocation(line: 76, column: 5, scope: !40)
!169 = !DILocation(line: 78, column: 22, scope: !40)
!170 = !DILocation(line: 78, column: 17, scope: !171)
!171 = !DILexicalBlockFile(scope: !40, file: !1, discriminator: 1)
!172 = !DILocation(line: 78, column: 13, scope: !40)
!173 = !DILocation(line: 79, column: 22, scope: !40)
!174 = !DILocation(line: 79, column: 17, scope: !171)
!175 = !DILocation(line: 79, column: 13, scope: !40)
!176 = !DILocation(line: 81, column: 17, scope: !171)
!177 = !DILocation(line: 81, column: 13, scope: !40)
!178 = !DILocation(line: 83, column: 48, scope: !40)
!179 = !DILocation(line: 83, column: 5, scope: !40)
!180 = !DILocation(line: 85, column: 9, scope: !40)
!181 = !DILocation(line: 85, column: 12, scope: !40)
!182 = !DILocation(line: 85, column: 47, scope: !40)
!183 = !DILocation(line: 85, column: 51, scope: !40)
!184 = !DILocation(line: 85, column: 28, scope: !40)
!185 = !DILocation(line: 85, column: 31, scope: !40)
!186 = !DILocation(line: 86, column: 31, scope: !40)
!187 = !DILocation(line: 86, column: 28, scope: !40)
!188 = !DILocation(line: 87, column: 31, scope: !40)
!189 = !DILocation(line: 87, column: 28, scope: !40)
!190 = !DILocation(line: 84, column: 5, scope: !40)
!191 = !DILocation(line: 89, column: 1, scope: !192)
!192 = !DILexicalBlockFile(scope: !40, file: !1, discriminator: 3)
!193 = !DILocation(line: 88, column: 5, scope: !40)
!194 = !DILocation(line: 35, column: 47, scope: !195)
!195 = distinct !DILexicalBlock(scope: !196, file: !1, line: 34, column: 33)
!196 = distinct !DILexicalBlock(scope: !197, file: !1, line: 34, column: 9)
!197 = distinct !DILexicalBlock(scope: !198, file: !1, line: 34, column: 9)
!198 = distinct !DILexicalBlock(scope: !199, file: !1, line: 33, column: 30)
!199 = distinct !DILexicalBlock(scope: !200, file: !1, line: 33, column: 5)
!200 = distinct !DILexicalBlock(scope: !7, file: !1, line: 33, column: 5)
!201 = distinct !{!201, !202, !"polly.alias.scope.call"}
!202 = distinct !{!202, !"polly.alias.scope.domain"}
!203 = distinct !{!203}
!204 = distinct !{!204, !80}
!205 = distinct !{!205, !80}
!206 = distinct !{!206, !207, !"polly.alias.scope.call"}
!207 = distinct !{!207, !"polly.alias.scope.domain"}
!208 = !{!209, !210}
!209 = distinct !{!209, !207, !"polly.alias.scope."}
!210 = distinct !{!210, !207, !"polly.alias.scope."}
!211 = !{!210, !206}
!212 = distinct !{!212}
!213 = !{!209, !206}
!214 = distinct !{!214}
