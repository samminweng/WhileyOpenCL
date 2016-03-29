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
  %polly.par.userContext = alloca { i32, i32, i8* }, align 8
  tail call void @llvm.dbg.value(metadata i32 %width, i64 0, metadata !19, metadata !57), !dbg !58
  tail call void @llvm.dbg.value(metadata i32 %height, i64 0, metadata !20, metadata !57), !dbg !59
  %conv = sext i32 %width to i64, !dbg !60
  %mul = shl nsw i64 %conv, 3, !dbg !61
  %conv1 = sext i32 %height to i64, !dbg !62
  %mul2 = mul i64 %mul, %conv1, !dbg !63
  %call = tail call noalias i8* @malloc(i64 %mul2) #6, !dbg !64
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !21, metadata !57), !dbg !66
  %cmp77 = icmp sgt i32 %height, 0, !dbg !67
  %cmp575 = icmp sgt i32 %width, 0, !dbg !71
  %or.cond = and i1 %cmp77, %cmp575, !dbg !76
  br i1 %or.cond, label %for.body7.preheader.us.preheader, label %polly.parallel.for, !dbg !76

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
  br i1 %6, label %polly.parallel.for.loopexit, label %for.body7.preheader.us.preheader.split.split, !dbg !77

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
  %exitcond.7 = icmp eq i32 %lftr.wideiv.7, %height, !dbg !76
  br i1 %exitcond.7, label %polly.parallel.for.loopexit.unr-lcssa, label %for.body7.preheader.us, !dbg !76

polly.parallel.for.loopexit.unr-lcssa:            ; preds = %for.body7.preheader.us
  br label %polly.parallel.for.loopexit

polly.parallel.for.loopexit:                      ; preds = %for.body7.preheader.us.preheader.split, %polly.parallel.for.loopexit.unr-lcssa
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
  %call36 = tail call noalias i8* @malloc(i64 16) #6, !dbg !82
  %18 = bitcast i8* %call36 to %struct.Matrix*, !dbg !83
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %18, i64 0, metadata !24, metadata !57), !dbg !84
  %19 = bitcast i8* %call36 to i8**, !dbg !85
  store i8* %call, i8** %19, align 8, !dbg !85, !tbaa !86
  %width38 = getelementptr inbounds i8, i8* %call36, i64 8, !dbg !92
  %20 = bitcast i8* %width38 to i32*, !dbg !92
  store i32 %width, i32* %20, align 8, !dbg !93, !tbaa !94
  %height39 = getelementptr inbounds i8, i8* %call36, i64 12, !dbg !95
  %21 = bitcast i8* %height39 to i32*, !dbg !95
  store i32 %height, i32* %21, align 4, !dbg !96, !tbaa !97
  ret %struct.Matrix* %18, !dbg !98
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
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !29, metadata !57), !dbg !99
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !30, metadata !57), !dbg !100
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !101
  %0 = load i32, i32* %width1, align 8, !dbg !101, !tbaa !94
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !34, metadata !57), !dbg !102
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !103
  %1 = load i32, i32* %height2, align 4, !dbg !103, !tbaa !97
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !35, metadata !57), !dbg !104
  %data3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !105
  %2 = load i64*, i64** %data3, align 8, !dbg !105, !tbaa !86
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !36, metadata !57), !dbg !106
  %data4 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !107
  %3 = load i64*, i64** %data4, align 8, !dbg !107, !tbaa !86
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !38, metadata !57), !dbg !108
  %conv = sext i32 %0 to i64, !dbg !109
  %mul = shl nsw i64 %conv, 3, !dbg !110
  %conv5 = sext i32 %1 to i64, !dbg !111
  %mul6 = mul i64 %mul, %conv5, !dbg !112
  %call = tail call noalias i8* @malloc(i64 %mul6) #6, !dbg !113
  %4 = bitcast i8* %call to i64*, !dbg !114
  tail call void @llvm.dbg.value(metadata i64* %4, i64 0, metadata !39, metadata !57), !dbg !115
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !31, metadata !57), !dbg !116
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
  br i1 %cmp986, label %for.body11.preheader.us.preheader, label %for.end40, !dbg !127

for.body11.preheader.us.preheader:                ; preds = %for.cond8.preheader.preheader
  %xtraiter = and i32 %0, 1, !dbg !128
  %lcmp.mod = icmp eq i32 %xtraiter, 0, !dbg !128
  %15 = icmp eq i32 %0, 1, !dbg !128
  br label %for.body11.preheader.us, !dbg !133

for.body11.us:                                    ; preds = %for.body11.preheader.us, %for.inc35.us
  %indvars.iv95.us = phi i64 [ %indvars.iv.next96.us, %for.inc35.us ], [ 0, %for.body11.preheader.us ]
  %16 = add nsw i64 %indvars.iv95.us, %30, !dbg !134
  %arrayidx.us = getelementptr inbounds i64, i64* %4, i64 %16, !dbg !135
  store i64 0, i64* %arrayidx.us, align 8, !dbg !136, !tbaa !137
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !57), !dbg !139
  br i1 %lcmp.mod, label %for.body11.us.split, label %for.body16.us.prol, !dbg !128

for.body16.us.prol:                               ; preds = %for.body11.us
  %17 = load i64, i64* %arrayidx24.us.prol, align 8, !dbg !140, !tbaa !137
  %arrayidx28.us.prol = getelementptr inbounds i64, i64* %3, i64 %indvars.iv95.us, !dbg !141
  %18 = load i64, i64* %arrayidx28.us.prol, align 8, !dbg !141, !tbaa !137
  %mul29.us.prol = mul nsw i64 %18, %17, !dbg !142
  store i64 %mul29.us.prol, i64* %arrayidx.us, align 8, !dbg !143, !tbaa !137
  br label %for.body11.us.split, !dbg !128

for.body11.us.split:                              ; preds = %for.body11.us, %for.body16.us.prol
  %.unr = phi i64 [ 0, %for.body11.us ], [ %mul29.us.prol, %for.body16.us.prol ]
  %indvars.iv.us.unr = phi i64 [ 0, %for.body11.us ], [ 1, %for.body16.us.prol ]
  br i1 %15, label %for.inc35.us, label %for.body11.us.split.split, !dbg !128

for.body11.us.split.split:                        ; preds = %for.body11.us.split
  br label %for.body16.us, !dbg !128

for.body16.us:                                    ; preds = %for.body16.us, %for.body11.us.split.split
  %19 = phi i64 [ %.unr, %for.body11.us.split.split ], [ %add30.us.1, %for.body16.us ], !dbg !144
  %indvars.iv.us = phi i64 [ %indvars.iv.us.unr, %for.body11.us.split.split ], [ %indvars.iv.next.us.1, %for.body16.us ]
  %20 = add nsw i64 %indvars.iv.us, %30, !dbg !145
  %arrayidx24.us = getelementptr inbounds i64, i64* %2, i64 %20, !dbg !140
  %21 = load i64, i64* %arrayidx24.us, align 8, !dbg !140, !tbaa !137
  %22 = mul nsw i64 %indvars.iv.us, %conv, !dbg !146
  %23 = add nsw i64 %22, %indvars.iv95.us, !dbg !147
  %arrayidx28.us = getelementptr inbounds i64, i64* %3, i64 %23, !dbg !141
  %24 = load i64, i64* %arrayidx28.us, align 8, !dbg !141, !tbaa !137
  %mul29.us = mul nsw i64 %24, %21, !dbg !142
  %add30.us = add nsw i64 %mul29.us, %19, !dbg !148
  store i64 %add30.us, i64* %arrayidx.us, align 8, !dbg !143, !tbaa !137
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1, !dbg !128
  %25 = add nsw i64 %indvars.iv.next.us, %30, !dbg !145
  %arrayidx24.us.1 = getelementptr inbounds i64, i64* %2, i64 %25, !dbg !140
  %26 = load i64, i64* %arrayidx24.us.1, align 8, !dbg !140, !tbaa !137
  %27 = mul nsw i64 %indvars.iv.next.us, %conv, !dbg !146
  %28 = add nsw i64 %27, %indvars.iv95.us, !dbg !147
  %arrayidx28.us.1 = getelementptr inbounds i64, i64* %3, i64 %28, !dbg !141
  %29 = load i64, i64* %arrayidx28.us.1, align 8, !dbg !141, !tbaa !137
  %mul29.us.1 = mul nsw i64 %29, %26, !dbg !142
  %add30.us.1 = add nsw i64 %mul29.us.1, %add30.us, !dbg !148
  store i64 %add30.us.1, i64* %arrayidx.us, align 8, !dbg !143, !tbaa !137
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2, !dbg !128
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.us.1 to i32, !dbg !128
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %0, !dbg !128
  br i1 %exitcond.1, label %for.inc35.us.unr-lcssa, label %for.body16.us, !dbg !128

for.inc35.us.unr-lcssa:                           ; preds = %for.body16.us
  br label %for.inc35.us, !dbg !127

for.inc35.us:                                     ; preds = %for.body11.us.split, %for.inc35.us.unr-lcssa
  %indvars.iv.next96.us = add nuw nsw i64 %indvars.iv95.us, 1, !dbg !127
  %lftr.wideiv138 = trunc i64 %indvars.iv.next96.us to i32, !dbg !127
  %exitcond139 = icmp eq i32 %lftr.wideiv138, %1, !dbg !127
  br i1 %exitcond139, label %for.inc38.loopexit.us, label %for.body11.us, !dbg !127

for.body11.preheader.us:                          ; preds = %for.body11.preheader.us.preheader, %for.inc38.loopexit.us
  %indvars.iv100.us = phi i64 [ %indvars.iv.next101.us, %for.inc38.loopexit.us ], [ 0, %for.body11.preheader.us.preheader ]
  %30 = mul nsw i64 %indvars.iv100.us, %conv, !dbg !133
  %arrayidx24.us.prol = getelementptr inbounds i64, i64* %2, i64 %30, !dbg !140
  br label %for.body11.us, !dbg !133

for.inc38.loopexit.us:                            ; preds = %for.inc35.us
  %indvars.iv.next101.us = add nuw nsw i64 %indvars.iv100.us, 1, !dbg !121
  %lftr.wideiv140 = trunc i64 %indvars.iv.next101.us to i32, !dbg !121
  %exitcond141 = icmp eq i32 %lftr.wideiv140, %0, !dbg !121
  br i1 %exitcond141, label %for.end40.loopexit, label %for.body11.preheader.us, !dbg !121

for.end40.loopexit:                               ; preds = %for.inc38.loopexit.us
  br label %for.end40, !dbg !149

for.end40:                                        ; preds = %for.end40.loopexit, %for.cond8.preheader.preheader, %polly.parallel.for, %entry
  %call41 = tail call noalias i8* @malloc(i64 16) #6, !dbg !149
  %31 = bitcast i8* %call41 to %struct.Matrix*, !dbg !151
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %31, i64 0, metadata !40, metadata !57), !dbg !152
  %width42 = getelementptr inbounds i8, i8* %call41, i64 8, !dbg !153
  %32 = bitcast i8* %width42 to i32*, !dbg !153
  store i32 %0, i32* %32, align 8, !dbg !154, !tbaa !94
  %height43 = getelementptr inbounds i8, i8* %call41, i64 12, !dbg !155
  %33 = bitcast i8* %height43 to i32*, !dbg !155
  store i32 %1, i32* %33, align 4, !dbg !156, !tbaa !97
  %34 = bitcast i8* %call41 to i8**, !dbg !157
  store i8* %call, i8** %34, align 8, !dbg !157, !tbaa !86
  ret %struct.Matrix* %31, !dbg !158

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
define i32 @main(i32 %argc, i8** nocapture readonly %args) #3 !dbg !41 {
entry:
  %max = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !48, metadata !57), !dbg !159
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !49, metadata !57), !dbg !160
  %0 = bitcast i32* %max to i8*, !dbg !161
  call void @llvm.lifetime.start(i64 4, i8* %0) #6, !dbg !161
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 1, !dbg !162
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !162, !tbaa !163
  tail call void @llvm.dbg.value(metadata i32* %max, i64 0, metadata !50, metadata !164), !dbg !165
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %max) #6, !dbg !166
  %2 = load i32, i32* %max, align 4, !dbg !167, !tbaa !168
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !50, metadata !57), !dbg !165
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %2), !dbg !169
  %3 = load i32, i32* %max, align 4, !dbg !170, !tbaa !168
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !50, metadata !57), !dbg !165
  %call2 = call %struct.Matrix* @init(i32 %3, i32 %3), !dbg !171
  call void @llvm.dbg.value(metadata %struct.Matrix* %call2, i64 0, metadata !51, metadata !57), !dbg !173
  %4 = load i32, i32* %max, align 4, !dbg !174, !tbaa !168
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !50, metadata !57), !dbg !165
  %call3 = call %struct.Matrix* @init(i32 %4, i32 %4), !dbg !175
  call void @llvm.dbg.value(metadata %struct.Matrix* %call3, i64 0, metadata !52, metadata !57), !dbg !176
  %call4 = call %struct.Matrix* @mat_mult(%struct.Matrix* %call2, %struct.Matrix* %call3), !dbg !177
  call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !53, metadata !57), !dbg !178
  %5 = load i32, i32* %max, align 4, !dbg !179, !tbaa !168
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !50, metadata !57), !dbg !165
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %5, i32 %5), !dbg !180
  %6 = load i32, i32* %max, align 4, !dbg !181, !tbaa !168
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !50, metadata !57), !dbg !165
  %sub = add nsw i32 %6, -1, !dbg !182
  %add = mul i32 %6, %6, !dbg !183
  %sub8 = add nsw i32 %add, -1, !dbg !184
  %idxprom = sext i32 %sub8 to i64, !dbg !185
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0, !dbg !186
  %7 = load i64*, i64** %data, align 8, !dbg !186, !tbaa !86
  %arrayidx9 = getelementptr inbounds i64, i64* %7, i64 %idxprom, !dbg !185
  %8 = load i64, i64* %arrayidx9, align 8, !dbg !185, !tbaa !137
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call3, i64 0, i32 0, !dbg !187
  %9 = load i64*, i64** %data17, align 8, !dbg !187, !tbaa !86
  %arrayidx18 = getelementptr inbounds i64, i64* %9, i64 %idxprom, !dbg !188
  %10 = load i64, i64* %arrayidx18, align 8, !dbg !188, !tbaa !137
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !189
  %11 = load i64*, i64** %data26, align 8, !dbg !189, !tbaa !86
  %arrayidx27 = getelementptr inbounds i64, i64* %11, i64 %idxprom, !dbg !190
  %12 = load i64, i64* %arrayidx27, align 8, !dbg !190, !tbaa !137
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %6, i32 %sub, i64 %8, i32 %sub, i32 %6, i32 %sub, i64 %10, i32 %sub, i32 %6, i32 %sub, i64 %12), !dbg !191
  call void @llvm.lifetime.end(i64 4, i8* %0) #6, !dbg !192
  ret i32 0, !dbg !194
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
  br i1 %6, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %7 = sext i32 %polly.subfunc.arg.width to i64
  %8 = add nsw i64 %7, -1
  %polly.fdiv_q.shr = ashr i64 %8, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %9 = sext i32 %polly.subfunc.arg.height to i64
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %10 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  br i1 %polly.loop_guard, label %polly.loop_header2.preheader, label %polly.loop_exit4

polly.loop_header2.preheader:                     ; preds = %polly.loop_header
  %12 = shl nsw i64 %polly.indvar, 5
  %13 = sub nsw i64 %9, %12
  %14 = add nsw i64 %13, -1
  %15 = icmp sgt i64 %14, 31
  %16 = select i1 %15, i64 31, i64 %14
  %polly.loop_guard13 = icmp sgt i64 %16, -1
  %polly.adjust_ub16 = add i64 %16, -1
  br i1 %polly.loop_guard13, label %polly.loop_header10.preheader.us.preheader, label %polly.loop_exit4

polly.loop_header10.preheader.us.preheader:       ; preds = %polly.loop_header2.preheader
  br label %polly.loop_header10.preheader.us

polly.loop_header10.preheader.us:                 ; preds = %polly.loop_header10.preheader.us.preheader, %polly.loop_exit12.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit12.loopexit.us ], [ 0, %polly.loop_header10.preheader.us.preheader ]
  %17 = shl i64 %polly.indvar5.us, 5
  %18 = sub nsw i64 %7, %17
  %19 = add nsw i64 %18, -1
  %20 = icmp sgt i64 %19, 31
  %21 = select i1 %20, i64 31, i64 %19
  %polly.loop_guard22.us = icmp sgt i64 %21, -1
  %polly.adjust_ub25.us = add i64 %21, -1
  br i1 %polly.loop_guard22.us, label %polly.loop_header19.preheader.us.us.preheader, label %polly.loop_exit12.loopexit.us

polly.loop_header19.preheader.us.us.preheader:    ; preds = %polly.loop_header10.preheader.us
  br label %polly.loop_header19.preheader.us.us

polly.loop_exit12.loopexit.us.loopexit:           ; preds = %polly.loop_exit21.loopexit.us.us
  br label %polly.loop_exit12.loopexit.us

polly.loop_exit12.loopexit.us:                    ; preds = %polly.loop_exit12.loopexit.us.loopexit, %polly.loop_header10.preheader.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar5.us, %polly.fdiv_q.shr
  br i1 %exitcond.us, label %polly.loop_exit4.loopexit, label %polly.loop_header10.preheader.us

polly.loop_header19.preheader.us.us:              ; preds = %polly.loop_header19.preheader.us.us.preheader, %polly.loop_exit21.loopexit.us.us
  %polly.indvar14.us.us = phi i64 [ %polly.indvar_next15.us.us, %polly.loop_exit21.loopexit.us.us ], [ 0, %polly.loop_header19.preheader.us.us.preheader ]
  %22 = add nsw i64 %polly.indvar14.us.us, %12
  %23 = mul i64 %22, %7
  %24 = add i64 %23, %17
  br label %polly.loop_header19.us.us

polly.loop_exit21.loopexit.us.us:                 ; preds = %polly.loop_header19.us.us
  %polly.indvar_next15.us.us = add nuw nsw i64 %polly.indvar14.us.us, 1
  %polly.loop_cond17.us.us = icmp sgt i64 %polly.indvar14.us.us, %polly.adjust_ub16
  br i1 %polly.loop_cond17.us.us, label %polly.loop_exit12.loopexit.us.loopexit, label %polly.loop_header19.preheader.us.us

polly.loop_header19.us.us:                        ; preds = %polly.loop_header19.us.us, %polly.loop_header19.preheader.us.us
  %polly.indvar23.us.us = phi i64 [ %polly.indvar_next24.us.us, %polly.loop_header19.us.us ], [ 0, %polly.loop_header19.preheader.us.us ]
  %tmp.us.us = add i64 %24, %polly.indvar23.us.us
  %tmp28.us.us = shl i64 %tmp.us.us, 3
  %scevgep.us.us = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp28.us.us
  %scevgep27.us.us = bitcast i8* %scevgep.us.us to i64*
  %_p_scalar_.us.us = load i64, i64* %scevgep27.us.us, align 8, !alias.scope !195, !noalias !2, !llvm.mem.parallel_loop_access !197
  %p_add25.us.us = add nsw i64 %_p_scalar_.us.us, %22, !dbg !198
  store i64 %p_add25.us.us, i64* %scevgep27.us.us, align 8, !alias.scope !195, !noalias !2, !llvm.mem.parallel_loop_access !197
  %polly.indvar_next24.us.us = add nuw nsw i64 %polly.indvar23.us.us, 1
  %polly.loop_cond26.us.us = icmp sgt i64 %polly.indvar23.us.us, %polly.adjust_ub25.us
  br i1 %polly.loop_cond26.us.us, label %polly.loop_exit21.loopexit.us.us, label %polly.loop_header19.us.us, !llvm.loop !197

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit12.loopexit.us
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_header2.preheader, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
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
  br i1 %6, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %7 = sext i32 %polly.subfunc.arg.2 to i64
  %8 = sext i32 %polly.subfunc.arg. to i64
  %9 = add nsw i64 %8, -1
  %polly.fdiv_q.shr = ashr i64 %9, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %10 = shl nsw i64 %7, 3
  %11 = shl nsw i64 %7, 8
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit5
  %12 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit5, %polly.par.loadIVBounds
  %indvar = phi i64 [ %indvar.next, %polly.loop_exit5 ], [ 0, %polly.par.loadIVBounds ]
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit5 ], [ %polly.par.LB, %polly.par.loadIVBounds ]
  %14 = add i64 %polly.par.LB, %indvar
  %15 = mul i64 %11, %14
  br i1 %polly.loop_guard, label %polly.loop_header3.preheader, label %polly.loop_exit5

polly.loop_header3.preheader:                     ; preds = %polly.loop_header
  %16 = shl nsw i64 %polly.indvar, 5
  %17 = sub nsw i64 %7, %16
  %18 = add nsw i64 %17, -1
  %19 = icmp sgt i64 %18, 31
  %20 = select i1 %19, i64 31, i64 %18
  %polly.loop_guard14 = icmp sgt i64 %20, -1
  %polly.adjust_ub17 = add i64 %20, -1
  br i1 %polly.loop_guard14, label %polly.loop_header11.preheader.us.preheader, label %polly.loop_exit5

polly.loop_header11.preheader.us.preheader:       ; preds = %polly.loop_header3.preheader
  br label %polly.loop_header11.preheader.us

polly.loop_header11.preheader.us:                 ; preds = %polly.loop_header11.preheader.us.preheader, %polly.loop_exit13.loopexit.us
  %polly.indvar6.us = phi i64 [ %polly.indvar_next7.us, %polly.loop_exit13.loopexit.us ], [ 0, %polly.loop_header11.preheader.us.preheader ]
  %21 = shl i64 %polly.indvar6.us, 8
  %22 = add i64 %15, %21
  %23 = shl i64 %polly.indvar6.us, 5
  %24 = sub i64 %23, %8
  %25 = icmp sgt i64 %24, -32
  %smax = select i1 %25, i64 %24, i64 -32
  %26 = sub i64 -2, %smax
  %27 = icmp sgt i64 %26, -1
  %smax49 = select i1 %27, i64 %26, i64 -1
  %28 = shl i64 %smax49, 3
  %29 = add i64 %28, 16
  %polly.loop_guard23.us50 = icmp slt i64 %23, %8
  br i1 %polly.loop_guard23.us50, label %polly.stmt.for.body11.preheader.us.us.preheader, label %polly.loop_exit13.loopexit.us

polly.stmt.for.body11.preheader.us.us.preheader:  ; preds = %polly.loop_header11.preheader.us
  br label %polly.stmt.for.body11.preheader.us.us

polly.loop_exit13.loopexit.us.loopexit:           ; preds = %polly.stmt.for.body11.preheader.us.us
  br label %polly.loop_exit13.loopexit.us

polly.loop_exit13.loopexit.us:                    ; preds = %polly.loop_exit13.loopexit.us.loopexit, %polly.loop_header11.preheader.us
  %polly.indvar_next7.us = add nuw nsw i64 %polly.indvar6.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar6.us, %polly.fdiv_q.shr
  br i1 %exitcond.us, label %polly.loop_exit5.loopexit, label %polly.loop_header11.preheader.us

polly.stmt.for.body11.preheader.us.us:            ; preds = %polly.stmt.for.body11.preheader.us.us.preheader, %polly.stmt.for.body11.preheader.us.us
  %polly.indvar15.us.us = phi i64 [ %polly.indvar_next16.us.us, %polly.stmt.for.body11.preheader.us.us ], [ 0, %polly.stmt.for.body11.preheader.us.us.preheader ]
  %30 = mul i64 %10, %polly.indvar15.us.us
  %31 = add i64 %22, %30
  %scevgep = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %29, i32 8, i1 false)
  %polly.indvar_next16.us.us = add nuw nsw i64 %polly.indvar15.us.us, 1
  %polly.loop_cond18.us.us = icmp sgt i64 %polly.indvar15.us.us, %polly.adjust_ub17
  br i1 %polly.loop_cond18.us.us, label %polly.loop_exit13.loopexit.us.loopexit, label %polly.stmt.for.body11.preheader.us.us

polly.loop_exit5.loopexit:                        ; preds = %polly.loop_exit13.loopexit.us
  br label %polly.loop_exit5

polly.loop_exit5:                                 ; preds = %polly.loop_exit5.loopexit, %polly.loop_header3.preheader, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  %indvar.next = add i64 %indvar, 1
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
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
  %11 = sext i32 %polly.subfunc.arg.2 to i64
  %12 = add nsw i64 %11, -1
  %13 = lshr i64 %12, 5
  %14 = sext i32 %polly.subfunc.arg. to i64
  %15 = add nsw i64 %14, -1
  %polly.fdiv_q.shr = ashr i64 %15, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit7
  %16 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.lr.ph, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit7, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit7 ]
  br i1 %polly.loop_guard, label %polly.loop_header5.preheader, label %polly.loop_exit7

polly.loop_header5.preheader:                     ; preds = %polly.loop_header
  %18 = shl nsw i64 %polly.indvar, 5
  %19 = sub nsw i64 %11, %18
  %20 = add nsw i64 %19, -1
  %21 = icmp sgt i64 %20, 31
  %22 = select i1 %21, i64 31, i64 %20
  %polly.loop_guard23 = icmp sgt i64 %22, -1
  %polly.adjust_ub26 = add i64 %22, -1
  br label %polly.loop_header5

polly.loop_exit7.loopexit:                        ; preds = %polly.loop_exit14
  br label %polly.loop_exit7

polly.loop_exit7:                                 ; preds = %polly.loop_exit7.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header5:                               ; preds = %polly.loop_header5.preheader, %polly.loop_exit14
  %polly.indvar8 = phi i64 [ %polly.indvar_next9, %polly.loop_exit14 ], [ 0, %polly.loop_header5.preheader ]
  %23 = shl nsw i64 %polly.indvar8, 5
  %24 = sub nsw i64 %14, %23
  %25 = add nsw i64 %24, -1
  %26 = icmp sgt i64 %25, 31
  %27 = select i1 %26, i64 31, i64 %25
  %polly.loop_guard32 = icmp sgt i64 %27, -1
  %polly.adjust_ub35 = add i64 %27, -1
  br label %polly.loop_header12

polly.loop_exit14:                                ; preds = %polly.loop_exit22
  %polly.indvar_next9 = add nuw nsw i64 %polly.indvar8, 1
  %exitcond52 = icmp eq i64 %polly.indvar8, %polly.fdiv_q.shr
  br i1 %exitcond52, label %polly.loop_exit7.loopexit, label %polly.loop_header5

polly.loop_header12:                              ; preds = %polly.loop_exit22, %polly.loop_header5
  %polly.indvar15 = phi i64 [ 0, %polly.loop_header5 ], [ %polly.indvar_next16, %polly.loop_exit22 ]
  br i1 %polly.loop_guard23, label %polly.loop_header20.preheader, label %polly.loop_exit22

polly.loop_header20.preheader:                    ; preds = %polly.loop_header12
  %28 = shl nsw i64 %polly.indvar15, 5
  %29 = sub nsw i64 %11, %28
  %30 = add nsw i64 %29, -1
  %31 = icmp sgt i64 %30, 31
  %32 = select i1 %31, i64 31, i64 %30
  %polly.loop_guard41 = icmp sgt i64 %32, -1
  %polly.adjust_ub44 = add i64 %32, -1
  br i1 %polly.loop_guard32, label %polly.loop_header29.preheader.us.preheader, label %polly.loop_exit22

polly.loop_header29.preheader.us.preheader:       ; preds = %polly.loop_header20.preheader
  br label %polly.loop_header29.preheader.us

polly.loop_header29.preheader.us:                 ; preds = %polly.loop_header29.preheader.us.preheader, %polly.loop_exit31.loopexit.us
  %polly.indvar24.us = phi i64 [ %polly.indvar_next25.us, %polly.loop_exit31.loopexit.us ], [ 0, %polly.loop_header29.preheader.us.preheader ]
  %33 = add nsw i64 %polly.indvar24.us, %18
  %34 = mul i64 %33, %11
  br i1 %polly.loop_guard41, label %polly.loop_header38.preheader.us.us.preheader, label %polly.loop_exit31.loopexit.us

polly.loop_header38.preheader.us.us.preheader:    ; preds = %polly.loop_header29.preheader.us
  br label %polly.loop_header38.preheader.us.us

polly.loop_exit31.loopexit.us.loopexit:           ; preds = %polly.loop_exit40.loopexit.us.us
  br label %polly.loop_exit31.loopexit.us

polly.loop_exit31.loopexit.us:                    ; preds = %polly.loop_exit31.loopexit.us.loopexit, %polly.loop_header29.preheader.us
  %polly.indvar_next25.us = add nuw nsw i64 %polly.indvar24.us, 1
  %polly.loop_cond27.us = icmp sgt i64 %polly.indvar24.us, %polly.adjust_ub26
  br i1 %polly.loop_cond27.us, label %polly.loop_exit22.loopexit, label %polly.loop_header29.preheader.us

polly.loop_header38.preheader.us.us:              ; preds = %polly.loop_header38.preheader.us.us.preheader, %polly.loop_exit40.loopexit.us.us
  %polly.indvar33.us.us = phi i64 [ %polly.indvar_next34.us.us, %polly.loop_exit40.loopexit.us.us ], [ 0, %polly.loop_header38.preheader.us.us.preheader ]
  %35 = add nuw nsw i64 %polly.indvar33.us.us, %23
  %tmp.us.us = add i64 %35, %34
  %tmp51.us.us = shl i64 %tmp.us.us, 3
  %scevgep.us.us = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp51.us.us
  %scevgep46.us.us = bitcast i8* %scevgep.us.us to i64*
  %scevgep46.promoted.us.us = load i64, i64* %scevgep46.us.us, align 8, !alias.scope !205, !noalias !207
  br label %polly.loop_header38.us.us

polly.loop_exit40.loopexit.us.us:                 ; preds = %polly.loop_header38.us.us
  %p_add30.us.us.lcssa = phi i64 [ %p_add30.us.us, %polly.loop_header38.us.us ]
  store i64 %p_add30.us.us.lcssa, i64* %scevgep46.us.us, align 8, !alias.scope !205, !noalias !207
  %polly.indvar_next34.us.us = add nuw nsw i64 %polly.indvar33.us.us, 1
  %polly.loop_cond36.us.us = icmp sgt i64 %polly.indvar33.us.us, %polly.adjust_ub35
  br i1 %polly.loop_cond36.us.us, label %polly.loop_exit31.loopexit.us.loopexit, label %polly.loop_header38.preheader.us.us

polly.loop_header38.us.us:                        ; preds = %polly.loop_header38.us.us, %polly.loop_header38.preheader.us.us
  %p_add3053.us.us = phi i64 [ %p_add30.us.us, %polly.loop_header38.us.us ], [ %scevgep46.promoted.us.us, %polly.loop_header38.preheader.us.us ]
  %polly.indvar42.us.us = phi i64 [ %polly.indvar_next43.us.us, %polly.loop_header38.us.us ], [ 0, %polly.loop_header38.preheader.us.us ]
  %36 = add nsw i64 %polly.indvar42.us.us, %28
  %37 = add i64 %36, %34
  %scevgep47.us.us = getelementptr i64, i64* %polly.subfunc.arg.3, i64 %37
  %_p_scalar_48.us.us = load i64, i64* %scevgep47.us.us, align 8, !alias.scope !208, !noalias !210
  %38 = mul i64 %36, %11
  %39 = add i64 %38, %35
  %scevgep49.us.us = getelementptr i64, i64* %polly.subfunc.arg.4, i64 %39
  %_p_scalar_50.us.us = load i64, i64* %scevgep49.us.us, align 8, !alias.scope !209, !noalias !211
  %p_mul29.us.us = mul nsw i64 %_p_scalar_50.us.us, %_p_scalar_48.us.us, !dbg !142
  %p_add30.us.us = add nsw i64 %p_mul29.us.us, %p_add3053.us.us, !dbg !148
  %polly.indvar_next43.us.us = add nuw nsw i64 %polly.indvar42.us.us, 1
  %polly.loop_cond45.us.us = icmp sgt i64 %polly.indvar42.us.us, %polly.adjust_ub44
  br i1 %polly.loop_cond45.us.us, label %polly.loop_exit40.loopexit.us.us, label %polly.loop_header38.us.us

polly.loop_exit22.loopexit:                       ; preds = %polly.loop_exit31.loopexit.us
  br label %polly.loop_exit22

polly.loop_exit22:                                ; preds = %polly.loop_exit22.loopexit, %polly.loop_header20.preheader, %polly.loop_header12
  %polly.indvar_next16 = add nuw nsw i64 %polly.indvar15, 1
  %exitcond = icmp eq i64 %polly.indvar15, %13
  br i1 %exitcond, label %polly.loop_exit14, label %polly.loop_header12
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { "polly.skip.fn" }
attributes #6 = { nounwind }

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
!99 = !DILocation(line: 47, column: 26, scope: !25)
!100 = !DILocation(line: 47, column: 37, scope: !25)
!101 = !DILocation(line: 49, column: 20, scope: !25)
!102 = !DILocation(line: 49, column: 9, scope: !25)
!103 = !DILocation(line: 50, column: 21, scope: !25)
!104 = !DILocation(line: 50, column: 9, scope: !25)
!105 = !DILocation(line: 52, column: 17, scope: !25)
!106 = !DILocation(line: 51, column: 29, scope: !25)
!107 = !DILocation(line: 53, column: 17, scope: !25)
!108 = !DILocation(line: 51, column: 51, scope: !25)
!109 = !DILocation(line: 54, column: 49, scope: !25)
!110 = !DILocation(line: 54, column: 48, scope: !25)
!111 = !DILocation(line: 54, column: 55, scope: !25)
!112 = !DILocation(line: 54, column: 54, scope: !25)
!113 = !DILocation(line: 54, column: 24, scope: !25)
!114 = !DILocation(line: 54, column: 12, scope: !25)
!115 = !DILocation(line: 51, column: 73, scope: !25)
!116 = !DILocation(line: 48, column: 9, scope: !25)
!117 = !DILocation(line: 56, column: 15, scope: !118)
!118 = !DILexicalBlockFile(scope: !119, file: !1, discriminator: 1)
!119 = distinct !DILexicalBlock(scope: !120, file: !1, line: 56, column: 5)
!120 = distinct !DILexicalBlock(scope: !25, file: !1, line: 56, column: 5)
!121 = !DILocation(line: 56, column: 5, scope: !118)
!122 = !DILocation(line: 57, column: 19, scope: !123)
!123 = !DILexicalBlockFile(scope: !124, file: !1, discriminator: 1)
!124 = distinct !DILexicalBlock(scope: !125, file: !1, line: 57, column: 9)
!125 = distinct !DILexicalBlock(scope: !126, file: !1, line: 57, column: 9)
!126 = distinct !DILexicalBlock(scope: !119, file: !1, line: 56, column: 29)
!127 = !DILocation(line: 57, column: 9, scope: !123)
!128 = !DILocation(line: 59, column: 13, scope: !129)
!129 = !DILexicalBlockFile(scope: !130, file: !1, discriminator: 1)
!130 = distinct !DILexicalBlock(scope: !131, file: !1, line: 59, column: 13)
!131 = distinct !DILexicalBlock(scope: !132, file: !1, line: 59, column: 13)
!132 = distinct !DILexicalBlock(scope: !124, file: !1, line: 57, column: 34)
!133 = !DILocation(line: 58, column: 19, scope: !132)
!134 = !DILocation(line: 58, column: 25, scope: !132)
!135 = !DILocation(line: 58, column: 13, scope: !132)
!136 = !DILocation(line: 58, column: 29, scope: !132)
!137 = !{!138, !138, i64 0}
!138 = !{!"long long", !89, i64 0}
!139 = !DILocation(line: 48, column: 15, scope: !25)
!140 = !DILocation(line: 60, column: 53, scope: !130)
!141 = !DILocation(line: 60, column: 73, scope: !130)
!142 = !DILocation(line: 60, column: 71, scope: !130)
!143 = !DILocation(line: 60, column: 33, scope: !130)
!144 = !DILocation(line: 60, column: 35, scope: !130)
!145 = !DILocation(line: 60, column: 67, scope: !130)
!146 = !DILocation(line: 60, column: 81, scope: !130)
!147 = !DILocation(line: 60, column: 87, scope: !130)
!148 = !DILocation(line: 60, column: 51, scope: !130)
!149 = !DILocation(line: 64, column: 17, scope: !150)
!150 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 1)
!151 = !DILocation(line: 64, column: 17, scope: !25)
!152 = !DILocation(line: 64, column: 13, scope: !25)
!153 = !DILocation(line: 65, column: 8, scope: !25)
!154 = !DILocation(line: 65, column: 14, scope: !25)
!155 = !DILocation(line: 66, column: 8, scope: !25)
!156 = !DILocation(line: 66, column: 15, scope: !25)
!157 = !DILocation(line: 67, column: 13, scope: !25)
!158 = !DILocation(line: 68, column: 5, scope: !25)
!159 = !DILocation(line: 72, column: 14, scope: !41)
!160 = !DILocation(line: 72, column: 27, scope: !41)
!161 = !DILocation(line: 75, column: 5, scope: !41)
!162 = !DILocation(line: 76, column: 12, scope: !41)
!163 = !{!88, !88, i64 0}
!164 = !DIExpression(DW_OP_deref)
!165 = !DILocation(line: 75, column: 9, scope: !41)
!166 = !DILocation(line: 76, column: 5, scope: !41)
!167 = !DILocation(line: 77, column: 24, scope: !41)
!168 = !{!91, !91, i64 0}
!169 = !DILocation(line: 77, column: 5, scope: !41)
!170 = !DILocation(line: 79, column: 22, scope: !41)
!171 = !DILocation(line: 79, column: 17, scope: !172)
!172 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 1)
!173 = !DILocation(line: 79, column: 13, scope: !41)
!174 = !DILocation(line: 80, column: 22, scope: !41)
!175 = !DILocation(line: 80, column: 17, scope: !172)
!176 = !DILocation(line: 80, column: 13, scope: !41)
!177 = !DILocation(line: 82, column: 17, scope: !172)
!178 = !DILocation(line: 82, column: 13, scope: !41)
!179 = !DILocation(line: 84, column: 48, scope: !41)
!180 = !DILocation(line: 84, column: 5, scope: !41)
!181 = !DILocation(line: 86, column: 9, scope: !41)
!182 = !DILocation(line: 86, column: 12, scope: !41)
!183 = !DILocation(line: 86, column: 47, scope: !41)
!184 = !DILocation(line: 86, column: 51, scope: !41)
!185 = !DILocation(line: 86, column: 28, scope: !41)
!186 = !DILocation(line: 86, column: 31, scope: !41)
!187 = !DILocation(line: 87, column: 31, scope: !41)
!188 = !DILocation(line: 87, column: 28, scope: !41)
!189 = !DILocation(line: 88, column: 31, scope: !41)
!190 = !DILocation(line: 88, column: 28, scope: !41)
!191 = !DILocation(line: 85, column: 5, scope: !41)
!192 = !DILocation(line: 90, column: 1, scope: !193)
!193 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 3)
!194 = !DILocation(line: 89, column: 5, scope: !41)
!195 = distinct !{!195, !196, !"polly.alias.scope.call"}
!196 = distinct !{!196, !"polly.alias.scope.domain"}
!197 = distinct !{!197}
!198 = !DILocation(line: 35, column: 47, scope: !199)
!199 = distinct !DILexicalBlock(scope: !200, file: !1, line: 34, column: 33)
!200 = distinct !DILexicalBlock(scope: !201, file: !1, line: 34, column: 9)
!201 = distinct !DILexicalBlock(scope: !202, file: !1, line: 34, column: 9)
!202 = distinct !DILexicalBlock(scope: !203, file: !1, line: 33, column: 30)
!203 = distinct !DILexicalBlock(scope: !204, file: !1, line: 33, column: 5)
!204 = distinct !DILexicalBlock(scope: !7, file: !1, line: 33, column: 5)
!205 = distinct !{!205, !206, !"polly.alias.scope.call"}
!206 = distinct !{!206, !"polly.alias.scope.domain"}
!207 = !{!208, !209}
!208 = distinct !{!208, !206, !"polly.alias.scope."}
!209 = distinct !{!209, !206, !"polly.alias.scope."}
!210 = !{!205, !209}
!211 = !{!205, !208}
