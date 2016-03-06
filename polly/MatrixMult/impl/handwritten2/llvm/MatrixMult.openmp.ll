; ModuleID = 'MatrixMult.preopt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i32*, i32, i32 }

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @init(i32 %value, i32 %width, i32 %height) #0 !dbg !15 {
entry:
  %polly.par.userContext = alloca { i32, i32, i8*, i32 }, align 8
  tail call void @llvm.dbg.value(metadata i32 %value, i64 0, metadata !31, metadata !32), !dbg !33
  tail call void @llvm.dbg.value(metadata i32 %width, i64 0, metadata !34, metadata !32), !dbg !35
  tail call void @llvm.dbg.value(metadata i32 %height, i64 0, metadata !36, metadata !32), !dbg !37
  %mul = mul nsw i32 %height, %width, !dbg !38
  %conv = sext i32 %mul to i64, !dbg !39
  %mul1 = shl nsw i64 %conv, 2, !dbg !40
  %call = tail call noalias i8* @malloc(i64 %mul1) #7, !dbg !41
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !42, metadata !32), !dbg !43
  %cmp3 = icmp sgt i32 %height, 0, !dbg !44
  br i1 %cmp3, label %polly.parallel.for, label %for.end10, !dbg !48

for.end10:                                        ; preds = %polly.parallel.for, %entry
  %call11 = tail call noalias i8* @malloc(i64 16) #7, !dbg !49
  %0 = bitcast i8* %call11 to %struct.Matrix*, !dbg !50
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %0, i64 0, metadata !51, metadata !32), !dbg !52
  %1 = bitcast i8* %call11 to i8**, !dbg !53
  store i8* %call, i8** %1, align 8, !dbg !53
  %width13 = getelementptr inbounds i8, i8* %call11, i64 8, !dbg !54
  %2 = bitcast i8* %width13 to i32*, !dbg !54
  store i32 %width, i32* %2, align 8, !dbg !55
  %height14 = getelementptr inbounds i8, i8* %call11, i64 12, !dbg !56
  %3 = bitcast i8* %height14 to i32*, !dbg !56
  store i32 %height, i32* %3, align 4, !dbg !57
  ret %struct.Matrix* %0, !dbg !58

polly.parallel.for:                               ; preds = %entry
  %4 = sext i32 %height to i64
  %5 = add nsw i64 %4, -1
  %polly.fdiv_q.shr = ashr i64 %5, 5
  %6 = bitcast { i32, i32, i8*, i32 }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 24, i8* %6)
  %polly.subfn.storeaddr.width = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext, i64 0, i32 0
  store i32 %width, i32* %polly.subfn.storeaddr.width, align 8
  %polly.subfn.storeaddr.height = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext, i64 0, i32 1
  store i32 %height, i32* %polly.subfn.storeaddr.height, align 4
  %polly.subfn.storeaddr.call = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext, i64 0, i32 2
  store i8* %call, i8** %polly.subfn.storeaddr.call, align 8
  %polly.subfn.storeaddr.value = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext, i64 0, i32 3
  store i32 %value, i32* %polly.subfn.storeaddr.value, align 8
  %7 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %6, i32 0, i64 0, i64 %7, i64 1) #7
  call void @init_polly_subfn(i8* %6) #7
  call void @GOMP_parallel_end() #7
  call void @llvm.lifetime.end(i64 8, i8* %6)
  br label %for.end10, !dbg !49
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @matrix_multiply(%struct.Matrix* noalias %A, %struct.Matrix* noalias nocapture readonly %B) #0 !dbg !19 {
entry:
  %polly.preload..merge.s2a = alloca i32
  %.s2a184 = alloca i32
  %.s2a183 = alloca i1
  %.s2a182 = alloca i64
  %polly.access.A3.load.preload.s2a = alloca i64
  %indvars.iv.us.unr.s2a = alloca i64
  %.unr.s2a = alloca i32
  %.preload.s2a154 = alloca i32
  %.preload.s2a = alloca i32
  %.phiops = alloca i32
  %index.next.prol.lcssa.phiops = alloca i64
  %index.unr.s2a = alloca i64
  %.s2a = alloca i64
  %polly.par.userContext39 = alloca { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, align 8
  %polly.par.userContext = alloca { i32, i32, i32, i32, i8*, %struct.Matrix* }, align 8
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %A, i64 0, metadata !59, metadata !32), !dbg !60
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %B, i64 0, metadata !61, metadata !32), !dbg !62
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 0, !dbg !63
  %0 = load i32*, i32** %data, align 8, !dbg !63
  tail call void @llvm.dbg.value(metadata i32* %0, i64 0, metadata !64, metadata !32), !dbg !65
  %data1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 0, !dbg !66
  %1 = load i32*, i32** %data1, align 8, !dbg !66
  tail call void @llvm.dbg.value(metadata i32* %1, i64 0, metadata !67, metadata !32), !dbg !68
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %B, i64 0, i32 1, !dbg !69
  %2 = load i32, i32* %width2, align 8, !dbg !70
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !77, metadata !32), !dbg !78
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 2, !dbg !79
  %3 = load i32, i32* %height3, align 4, !dbg !79
  tail call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !80, metadata !32), !dbg !81
  %mul = mul nsw i32 %3, %2, !dbg !82
  %conv = sext i32 %mul to i64, !dbg !83
  %mul4 = shl nsw i64 %conv, 2, !dbg !84
  %call = tail call noalias i8* @malloc(i64 %mul4) #7, !dbg !85
  %4 = bitcast i8* %call to i32*, !dbg !86
  tail call void @llvm.dbg.value(metadata i32* %4, i64 0, metadata !87, metadata !32), !dbg !88
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !89, metadata !32), !dbg !90
  %cmp6 = icmp sgt i32 %3, 0, !dbg !91
  br i1 %cmp6, label %polly.split_new_and_old174, label %for.end41, !dbg !93

polly.split_new_and_old174:                       ; preds = %entry
  br label %polly.preload.begin178

polly.preload.begin178:                           ; preds = %polly.split_new_and_old174
  %5 = sext i32 %2 to i64
  %6 = icmp sge i64 %5, 1
  br label %polly.preload.cond179

polly.preload.cond179:                            ; preds = %polly.preload.begin178
  br i1 %6, label %polly.preload.exec181, label %polly.preload.merge180

polly.preload.merge180:                           ; preds = %polly.preload.exec181, %polly.preload.cond179
  %polly.preload.polly.access.A3.load.merge = phi i64 [ %polly.access.A.load, %polly.preload.exec181 ], [ 0, %polly.preload.cond179 ]
  store i64 %polly.preload.polly.access.A3.load.merge, i64* %polly.access.A3.load.preload.s2a
  br i1 true, label %polly.start176, label %for.cond7.preheader.lr.ph

for.cond7.preheader.lr.ph:                        ; preds = %polly.preload.merge180
  %7 = sext i32 %2 to i64, !dbg !93
  %8 = icmp sgt i32 %2, 0
  br i1 %8, label %polly.preload.exec, label %polly.preload.merge.region_exiting

polly.preload.merge.region_exiting:               ; preds = %for.cond7.preheader.lr.ph, %polly.preload.exec
  %.ph = phi i32 [ %3, %for.cond7.preheader.lr.ph ], [ %186, %polly.preload.exec ]
  %polly.preload..merge.ph = phi i32 [ 0, %for.cond7.preheader.lr.ph ], [ %184, %polly.preload.exec ]
  br label %polly.merge_new_and_old175

polly.merge_new_and_old175:                       ; preds = %polly.exiting177, %polly.preload.merge.region_exiting
  %.ph.merge = phi i32 [ %.ph.final_reload, %polly.exiting177 ], [ %.ph, %polly.preload.merge.region_exiting ]
  %polly.preload..merge.ph.merge = phi i32 [ %polly.preload..merge.ph.final_reload, %polly.exiting177 ], [ %polly.preload..merge.ph, %polly.preload.merge.region_exiting ]
  %.merge193 = phi i64 [ %.final_reload192, %polly.exiting177 ], [ %7, %polly.preload.merge.region_exiting ]
  %.merge195 = phi i1 [ %.final_reload194, %polly.exiting177 ], [ %8, %polly.preload.merge.region_exiting ]
  br label %polly.preload.merge

polly.preload.merge:                              ; preds = %polly.merge_new_and_old175
  %9 = phi i32 [ %.ph.merge, %polly.merge_new_and_old175 ]
  %polly.preload..merge = phi i32 [ %polly.preload..merge.ph.merge, %polly.merge_new_and_old175 ]
  %10 = icmp sge i32 %2, %polly.preload..merge
  %11 = sext i32 %polly.preload..merge to i64
  %polly.access.add. = mul nsw i64 %11, %.merge193
  %polly.access. = getelementptr i32, i32* %1, i64 %polly.access.add.
  %12 = icmp ule i32* %polly.access., %4
  %13 = sext i32 %3 to i64
  %14 = add nsw i64 %13, -1
  %polly.access.mul.call6 = mul i64 %14, %.merge193
  %polly.access.add.call7 = mul nsw i64 %13, %.merge193
  %polly.access.call8 = getelementptr i32, i32* %4, i64 %polly.access.add.call7
  %15 = icmp ule i32* %polly.access.call8, %1
  %16 = or i1 %15, %12
  %17 = and i1 %10, %16
  %polly.access.add.13 = add i64 %11, %polly.access.mul.call6
  %polly.access.14 = getelementptr i32, i32* %0, i64 %polly.access.add.13
  %18 = icmp ule i32* %polly.access.14, %4
  %19 = icmp ule i32* %polly.access.call8, %0
  %20 = or i1 %19, %18
  %21 = and i1 %20, %17
  br i1 %21, label %polly.parallel.for37, label %for.cond7.preheader.preheader

for.cond7.preheader.preheader:                    ; preds = %polly.preload.merge
  br i1 %.merge195, label %for.body11.preheader.us.preheader, label %for.inc39.preheader, !dbg !94

for.inc39.preheader:                              ; preds = %for.cond7.preheader.preheader
  %22 = sext i32 %9 to i64, !dbg !91
  %23 = icmp sgt i64 %22, 1, !dbg !93
  %smax = select i1 %23, i64 %22, i64 1, !dbg !93
  %min.iters.check = icmp ult i64 %smax, 16, !dbg !93
  br i1 %min.iters.check, label %for.inc39.preheader71, label %min.iters.checked, !dbg !93

for.inc39.preheader71:                            ; preds = %middle.block, %min.iters.checked, %for.inc39.preheader
  %indvars.iv17.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.inc39.preheader ], [ %n.vec, %middle.block ]
  br label %for.inc39, !dbg !93

min.iters.checked:                                ; preds = %for.inc39.preheader
  %n.vec = and i64 %smax, -16, !dbg !93
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !93
  br i1 %cmp.zero, label %for.inc39.preheader71, label %polly.split_new_and_old, !dbg !93

polly.split_new_and_old:                          ; preds = %min.iters.checked
  %24 = add i64 %n.vec, -16
  %25 = lshr i64 %24, 4
  %26 = add i64 %25, 1
  %27 = trunc i64 %26 to i3
  %28 = zext i3 %27 to i64
  br i1 true, label %polly.start, label %vector.body.preheader

vector.body.preheader:                            ; preds = %polly.split_new_and_old
  %29 = add nsw i64 %n.vec, -16, !dbg !93
  %30 = lshr exact i64 %29, 4, !dbg !93
  %31 = add nuw nsw i64 %30, 1, !dbg !93
  %xtraiter73 = and i64 %31, 7, !dbg !93
  %lcmp.mod74 = icmp eq i64 %xtraiter73, 0, !dbg !93
  br i1 %lcmp.mod74, label %vector.body.preheader.split.region_exiting, label %vector.body.prol.preheader, !dbg !93

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol, !dbg !93

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !93
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter73, %vector.body.prol.preheader ]
  %index.next.prol = add i64 %index.prol, 16, !dbg !93
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !93
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !93
  br i1 %prol.iter.cmp, label %vector.body.preheader.split.loopexit, label %vector.body.prol, !dbg !93, !llvm.loop !95

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.next.prol.lcssa = phi i64 [ %index.next.prol, %vector.body.prol ]
  br label %vector.body.preheader.split.region_exiting, !dbg !93

vector.body.preheader.split.region_exiting:       ; preds = %vector.body.preheader, %vector.body.preheader.split.loopexit
  %index.unr.ph = phi i64 [ %index.next.prol.lcssa, %vector.body.preheader.split.loopexit ], [ 0, %vector.body.preheader ]
  br label %polly.merge_new_and_old, !dbg !93

polly.merge_new_and_old:                          ; preds = %polly.exiting, %vector.body.preheader.split.region_exiting
  %index.unr.ph.merge = phi i64 [ %index.unr.ph.final_reload, %polly.exiting ], [ %index.unr.ph, %vector.body.preheader.split.region_exiting ]
  %.merge = phi i64 [ %.final_reload, %polly.exiting ], [ %29, %vector.body.preheader.split.region_exiting ]
  br label %vector.body.preheader.split, !dbg !93

vector.body.preheader.split:                      ; preds = %polly.merge_new_and_old
  %index.unr = phi i64 [ %index.unr.ph.merge, %polly.merge_new_and_old ]
  %32 = icmp ult i64 %.merge, 112, !dbg !93
  br i1 %32, label %middle.block, label %vector.body.preheader.split.split, !dbg !93

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !93

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.7, %vector.body ], !dbg !93
  %index.next.7 = add i64 %index, 128, !dbg !93
  %33 = icmp eq i64 %index.next.7, %n.vec, !dbg !93
  br i1 %33, label %middle.block.unr-lcssa, label %vector.body, !dbg !93, !llvm.loop !97

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %smax, %n.vec
  br i1 %cmp.n, label %for.end41, label %for.inc39.preheader71, !dbg !93

for.body11.preheader.us.preheader:                ; preds = %for.cond7.preheader.preheader
  %width14 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %A, i64 0, i32 1, !dbg !100
  %.phi.trans.insert = bitcast i32* %width14 to i64*, !dbg !100
  %.pre.pre = load i64, i64* %.phi.trans.insert, align 8, !dbg !100
  %34 = trunc i64 %.pre.pre to i32, !dbg !100
  %cmp151.us = icmp sgt i32 %34, 0, !dbg !105
  %sext = shl i64 %.pre.pre, 32, !dbg !105
  %35 = ashr exact i64 %sext, 32, !dbg !105
  %36 = ashr i64 %.pre.pre, 32, !dbg !91
  %xtraiter = and i64 %35, 1, !dbg !106
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !106
  %37 = icmp eq i64 %35, 1, !dbg !106
  %38 = trunc i64 %.pre.pre to i32, !dbg !108
  %scevgep = getelementptr i32, i32* %0, i64 0, !dbg !108
  %39 = mul i64 %.merge193, 0, !dbg !108
  %40 = shl i64 %39, 1, !dbg !108
  %scevgep93 = getelementptr i32, i32* %1, i64 %40, !dbg !108
  %41 = shl i64 %.merge193, 2, !dbg !108
  %scevgep99 = getelementptr i32, i32* %0, i64 1, !dbg !108
  %42 = shl i64 %.merge193, 1
  %43 = shl i64 %.merge193, 2, !dbg !108
  %scevgep129 = getelementptr i32, i32* %0, i64 1, !dbg !108
  %44 = shl i64 %.merge193, 2, !dbg !108
  br label %for.body11.preheader.us, !dbg !108

for.body11.us:                                    ; preds = %for.body11.preheader.us, %for.inc36.us
  %indvars.iv12.us = phi i64 [ %indvars.iv.next13.us, %for.inc36.us ], [ 0, %for.body11.preheader.us ]
  %45 = shl i64 %indvars.iv12.us, 0, !dbg !109
  %46 = add i64 %45, 0, !dbg !109
  %47 = shl i64 %indvars.iv12.us, 0, !dbg !109
  %48 = add i64 %47, 0, !dbg !109
  %49 = add nsw i64 %indvars.iv12.us, %170, !dbg !109
  %arrayidx.us = getelementptr inbounds i32, i32* %4, i64 %49, !dbg !110
  store i32 0, i32* %arrayidx.us, align 4, !dbg !111
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !112, metadata !32), !dbg !113
  br i1 %cmp151.us, label %polly.split_new_and_old141, label %for.inc36.us, !dbg !114

polly.split_new_and_old141:                       ; preds = %for.body11.us
  br label %polly.preload.begin

polly.preload.begin:                              ; preds = %polly.split_new_and_old141
  %50 = icmp sle i64 %xtraiter, -1
  %51 = icmp sge i64 %xtraiter, 1
  %52 = or i1 %50, %51
  br label %polly.preload.cond

polly.preload.cond:                               ; preds = %polly.preload.begin
  br i1 %52, label %polly.preload.exec146, label %polly.preload.merge145

polly.preload.merge145:                           ; preds = %polly.preload.exec146, %polly.preload.cond
  %polly.preload..merge148 = phi i32 [ %polly.access.147.load, %polly.preload.exec146 ], [ 0, %polly.preload.cond ]
  store i32 %polly.preload..merge148, i32* %.preload.s2a
  %53 = icmp sle i64 %xtraiter, -1
  %54 = icmp sge i64 %xtraiter, 1
  %55 = or i1 %53, %54
  br label %polly.preload.cond149

polly.preload.cond149:                            ; preds = %polly.preload.merge145
  br i1 %55, label %polly.preload.exec151, label %polly.preload.merge150

polly.preload.merge150:                           ; preds = %polly.preload.exec151, %polly.preload.cond149
  %polly.preload..merge153 = phi i32 [ %polly.access.152.load, %polly.preload.exec151 ], [ 0, %polly.preload.cond149 ]
  store i32 %polly.preload..merge153, i32* %.preload.s2a154
  %56 = icmp eq i64 %xtraiter, 0
  %57 = icmp eq i64 %xtraiter, 1
  %58 = icmp sle i64 %166, 2305843009213693951
  %59 = and i1 %57, %58
  %60 = icmp sge i64 %166, -2305843009213693952
  %61 = and i1 %59, %60
  %62 = or i1 %56, %61
  %63 = add nsw i64 %indvars.iv12.us, 1
  %polly.access.155 = getelementptr i32, i32* %1, i64 %63
  %polly.access.cast.call156 = bitcast i8* %call to i32*
  %64 = add nsw i64 %166, %indvars.iv12.us
  %polly.access.call157 = getelementptr i32, i32* %polly.access.cast.call156, i64 %64
  %65 = icmp ule i32* %polly.access.155, %polly.access.call157
  %polly.access.cast.call158 = bitcast i8* %call to i32*
  %66 = add nsw i64 %166, %indvars.iv12.us
  %67 = add nsw i64 %66, 1
  %polly.access.call159 = getelementptr i32, i32* %polly.access.cast.call158, i64 %67
  %polly.access.160 = getelementptr i32, i32* %1, i64 %indvars.iv12.us
  %68 = icmp ule i32* %polly.access.call159, %polly.access.160
  %69 = or i1 %65, %68
  %70 = and i1 %62, %69
  %71 = add nsw i64 %166, 1
  %polly.access.161 = getelementptr i32, i32* %0, i64 %71
  %polly.access.cast.call162 = bitcast i8* %call to i32*
  %72 = add nsw i64 %166, %indvars.iv12.us
  %polly.access.call163 = getelementptr i32, i32* %polly.access.cast.call162, i64 %72
  %73 = icmp ule i32* %polly.access.161, %polly.access.call163
  %polly.access.cast.call164 = bitcast i8* %call to i32*
  %74 = add nsw i64 %166, %indvars.iv12.us
  %75 = add nsw i64 %74, 1
  %polly.access.call165 = getelementptr i32, i32* %polly.access.cast.call164, i64 %75
  %polly.access.166 = getelementptr i32, i32* %0, i64 %166
  %76 = icmp ule i32* %polly.access.call165, %polly.access.166
  %77 = or i1 %73, %76
  %78 = and i1 %70, %77
  br i1 %78, label %polly.start143, label %for.body17.us.preheader

for.body17.us.preheader:                          ; preds = %polly.preload.merge150
  br i1 %lcmp.mod, label %for.body17.us.preheader.split.region_exiting, label %for.body17.us.prol, !dbg !106

for.body17.us.prol:                               ; preds = %for.body17.us.preheader
  %79 = load i32, i32* %arrayidx25.us.prol, align 4, !dbg !115
  %arrayidx29.us.prol = getelementptr inbounds i32, i32* %1, i64 %indvars.iv12.us, !dbg !116
  %80 = load i32, i32* %arrayidx29.us.prol, align 4, !dbg !116
  %mul30.us.prol = mul nsw i32 %80, %79, !dbg !117
  store i32 %mul30.us.prol, i32* %arrayidx.us, align 4, !dbg !118
  br label %for.body17.us.preheader.split.region_exiting, !dbg !114

for.body17.us.preheader.split.region_exiting:     ; preds = %for.body17.us.prol, %for.body17.us.preheader
  %.unr.ph = phi i32 [ %mul30.us.prol, %for.body17.us.prol ], [ 0, %for.body17.us.preheader ]
  %indvars.iv.us.unr.ph = phi i64 [ 1, %for.body17.us.prol ], [ 0, %for.body17.us.preheader ]
  br label %polly.merge_new_and_old142, !dbg !106

polly.merge_new_and_old142:                       ; preds = %polly.exiting144, %for.body17.us.preheader.split.region_exiting
  %.unr.ph.merge = phi i32 [ %.unr.ph.final_reload, %polly.exiting144 ], [ %.unr.ph, %for.body17.us.preheader.split.region_exiting ]
  %indvars.iv.us.unr.ph.merge = phi i64 [ %indvars.iv.us.unr.ph.final_reload, %polly.exiting144 ], [ %indvars.iv.us.unr.ph, %for.body17.us.preheader.split.region_exiting ]
  br label %for.body17.us.preheader.split, !dbg !106

for.body17.us.preheader.split:                    ; preds = %polly.merge_new_and_old142
  %.unr = phi i32 [ %.unr.ph.merge, %polly.merge_new_and_old142 ]
  %indvars.iv.us.unr = phi i64 [ %indvars.iv.us.unr.ph.merge, %polly.merge_new_and_old142 ]
  br i1 %37, label %for.inc36.us.loopexit, label %for.body17.us.preheader.split.split, !dbg !106

for.body17.us.preheader.split.split:              ; preds = %for.body17.us.preheader.split
  br label %polly.split_new_and_old75, !dbg !106

polly.split_new_and_old75:                        ; preds = %for.body17.us.preheader.split.split
  %81 = add nsw i64 %indvars.iv.us.unr, %169
  %82 = icmp sle i64 %81, 2305843009213693950
  %83 = icmp sle i64 %169, 2305843009213693951
  %84 = and i1 %82, %83
  %85 = icmp sge i64 %169, -2305843009213693952
  %86 = and i1 %84, %85
  %87 = add nsw i64 %indvars.iv.us.unr, %169
  %88 = icmp sge i64 %87, -2305843009213693952
  %89 = and i1 %86, %88
  %90 = add nsw i64 %indvars.iv12.us, 1
  %91 = sext i32 %2 to i64
  %92 = icmp sge i64 %91, %90
  %93 = and i1 %89, %92
  %94 = add nsw i64 %indvars.iv.us.unr, 2
  %95 = sext i32 %38 to i64
  %96 = icmp sge i64 %95, %94
  %97 = icmp sle i64 %indvars.iv12.us, -1
  %98 = and i1 %96, %97
  %99 = sext i32 %38 to i64
  %100 = sub nsw i64 %99, 1
  %101 = add nsw i64 %indvars.iv.us.unr, 1
  %102 = sext i32 %38 to i64
  %103 = icmp sge i64 %101, %102
  %104 = icmp sle i64 %indvars.iv12.us, -1
  %105 = and i1 %103, %104
  %106 = add nsw i64 %indvars.iv.us.unr, 2
  %107 = sext i32 %38 to i64
  %108 = icmp sge i64 %107, %106
  %109 = icmp sge i64 %indvars.iv12.us, 0
  %110 = and i1 %108, %109
  %111 = add nsw i64 %indvars.iv.us.unr, 1
  %112 = sext i32 %38 to i64
  %113 = select i1 %110, i64 %112, i64 %111
  %114 = select i1 %105, i64 %indvars.iv.us.unr, i64 %113
  %115 = select i1 %98, i64 %100, i64 %114
  %polly.access.mul. = mul i64 %115, %.merge193
  %116 = icmp sle i64 %indvars.iv12.us, -1
  %117 = sext i32 %2 to i64
  %118 = add nsw i64 %117, %indvars.iv12.us
  %119 = add nsw i64 %118, 1
  %120 = add nsw i64 %indvars.iv12.us, 1
  %121 = select i1 %116, i64 %119, i64 %120
  %polly.access.add.79 = add i64 %polly.access.mul., %121
  %polly.access.80 = getelementptr i32, i32* %1, i64 %polly.access.add.79
  %polly.access.cast.call = bitcast i8* %call to i32*
  %122 = add nsw i64 %169, %indvars.iv12.us
  %polly.access.call = getelementptr i32, i32* %polly.access.cast.call, i64 %122
  %123 = icmp ule i32* %polly.access.80, %polly.access.call
  %polly.access.cast.call81 = bitcast i8* %call to i32*
  %124 = add nsw i64 %169, %indvars.iv12.us
  %125 = add nsw i64 %124, 1
  %polly.access.call82 = getelementptr i32, i32* %polly.access.cast.call81, i64 %125
  %126 = icmp sle i64 %indvars.iv12.us, -1
  %127 = sub nsw i64 %indvars.iv.us.unr, 1
  %128 = select i1 %126, i64 %127, i64 %indvars.iv.us.unr
  %polly.access.mul.83 = mul i64 %128, %.merge193
  %129 = icmp sle i64 %indvars.iv12.us, -1
  %130 = sext i32 %2 to i64
  %131 = add nsw i64 %130, %indvars.iv12.us
  %132 = select i1 %129, i64 %131, i64 %indvars.iv12.us
  %polly.access.add.84 = add i64 %polly.access.mul.83, %132
  %polly.access.85 = getelementptr i32, i32* %1, i64 %polly.access.add.84
  %133 = icmp ule i32* %polly.access.call82, %polly.access.85
  %134 = or i1 %123, %133
  %135 = and i1 %93, %134
  %136 = add nsw i64 %indvars.iv.us.unr, 2
  %137 = sext i32 %38 to i64
  %138 = icmp sge i64 %137, %136
  %139 = sext i32 %38 to i64
  %140 = add nsw i64 %139, %169
  %141 = add nsw i64 %140, 1
  %142 = add nsw i64 %indvars.iv.us.unr, %169
  %143 = add nsw i64 %142, 2
  %144 = select i1 %138, i64 %141, i64 %143
  %polly.access.86 = getelementptr i32, i32* %0, i64 %144
  %polly.access.cast.call87 = bitcast i8* %call to i32*
  %145 = add nsw i64 %169, %indvars.iv12.us
  %polly.access.call88 = getelementptr i32, i32* %polly.access.cast.call87, i64 %145
  %146 = icmp ule i32* %polly.access.86, %polly.access.call88
  %polly.access.cast.call89 = bitcast i8* %call to i32*
  %147 = add nsw i64 %169, %indvars.iv12.us
  %148 = add nsw i64 %147, 1
  %polly.access.call90 = getelementptr i32, i32* %polly.access.cast.call89, i64 %148
  %149 = add nsw i64 %indvars.iv.us.unr, %169
  %polly.access.91 = getelementptr i32, i32* %0, i64 %149
  %150 = icmp ule i32* %polly.access.call90, %polly.access.91
  %151 = or i1 %146, %150
  %152 = and i1 %135, %151
  br i1 %152, label %polly.start77, label %for.body17.us

for.body17.us:                                    ; preds = %polly.split_new_and_old75, %for.body17.us
  %153 = phi i32 [ %add31.us.1, %for.body17.us ], [ %.unr, %polly.split_new_and_old75 ], !dbg !119
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %for.body17.us ], [ %indvars.iv.us.unr, %polly.split_new_and_old75 ]
  %154 = add nsw i64 %indvars.iv.us, %170, !dbg !106
  %arrayidx25.us = getelementptr inbounds i32, i32* %0, i64 %154, !dbg !115
  %155 = load i32, i32* %arrayidx25.us, align 4, !dbg !115
  %156 = mul nsw i64 %indvars.iv.us, %.merge193, !dbg !120
  %157 = add nsw i64 %156, %indvars.iv12.us, !dbg !121
  %arrayidx29.us = getelementptr inbounds i32, i32* %1, i64 %157, !dbg !116
  %158 = load i32, i32* %arrayidx29.us, align 4, !dbg !116
  %mul30.us = mul nsw i32 %158, %155, !dbg !117
  %add31.us = add nsw i32 %mul30.us, %153, !dbg !122
  store i32 %add31.us, i32* %arrayidx.us, align 4, !dbg !118
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1, !dbg !114
  %159 = add nsw i64 %indvars.iv.next.us, %170, !dbg !106
  %arrayidx25.us.1 = getelementptr inbounds i32, i32* %0, i64 %159, !dbg !115
  %160 = load i32, i32* %arrayidx25.us.1, align 4, !dbg !115
  %161 = mul nsw i64 %indvars.iv.next.us, %.merge193, !dbg !120
  %162 = add nsw i64 %161, %indvars.iv12.us, !dbg !121
  %arrayidx29.us.1 = getelementptr inbounds i32, i32* %1, i64 %162, !dbg !116
  %163 = load i32, i32* %arrayidx29.us.1, align 4, !dbg !116
  %mul30.us.1 = mul nsw i32 %163, %160, !dbg !117
  %add31.us.1 = add nsw i32 %mul30.us.1, %add31.us, !dbg !122
  store i32 %add31.us.1, i32* %arrayidx.us, align 4, !dbg !118
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2, !dbg !114
  %cmp15.us.1 = icmp slt i64 %indvars.iv.next.us.1, %35, !dbg !105
  br i1 %cmp15.us.1, label %for.body17.us, label %for.inc36.us.loopexit.unr-lcssa, !dbg !114

for.inc36.us.loopexit.unr-lcssa:                  ; preds = %for.body17.us
  br label %polly.merge_new_and_old76, !dbg !94

polly.merge_new_and_old76:                        ; preds = %polly.exiting78, %for.inc36.us.loopexit.unr-lcssa
  br label %for.inc36.us.loopexit, !dbg !94

for.inc36.us.loopexit:                            ; preds = %polly.merge_new_and_old76, %for.body17.us.preheader.split
  br label %for.inc36.us, !dbg !94

for.inc36.us:                                     ; preds = %for.inc36.us.loopexit, %for.body11.us
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv12.us, 1, !dbg !94
  %cmp9.us = icmp slt i64 %indvars.iv.next13.us, %.merge193, !dbg !123
  br i1 %cmp9.us, label %for.body11.us, label %for.inc39.loopexit.us, !dbg !94

for.body11.preheader.us:                          ; preds = %for.body11.preheader.us.preheader, %for.inc39.loopexit.us
  %indvars.iv17.us = phi i64 [ %indvars.iv.next18.us, %for.inc39.loopexit.us ], [ 0, %for.body11.preheader.us.preheader ]
  %164 = shl i64 %indvars.iv17.us, 0, !dbg !108
  %165 = add i64 %164, 0, !dbg !108
  %166 = mul i64 %.merge193, %indvars.iv17.us, !dbg !108
  %167 = shl i64 %indvars.iv17.us, 0, !dbg !108
  %168 = add i64 %167, 0, !dbg !108
  %169 = mul i64 %.merge193, %indvars.iv17.us, !dbg !108
  %170 = mul nsw i64 %indvars.iv17.us, %.merge193, !dbg !108
  %arrayidx25.us.prol = getelementptr inbounds i32, i32* %0, i64 %170, !dbg !115
  %171 = mul i64 %.merge193, %168, !dbg !108
  %172 = mul i64 %41, %168, !dbg !108
  %scevgep96 = getelementptr i8, i8* %call, i64 %172, !dbg !108
  %173 = mul i64 %43, %168, !dbg !108
  %scevgep126 = getelementptr i8, i8* %call, i64 %173, !dbg !108
  %174 = mul i64 %44, %165, !dbg !108
  %scevgep171 = getelementptr i8, i8* %call, i64 %174, !dbg !108
  br label %for.body11.us, !dbg !108

for.inc39.loopexit.us:                            ; preds = %for.inc36.us
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv17.us, 1, !dbg !93
  %cmp.us = icmp slt i64 %indvars.iv.next18.us, %36, !dbg !91
  br i1 %cmp.us, label %for.body11.preheader.us, label %for.end41.loopexit, !dbg !93

for.inc39:                                        ; preds = %for.inc39.preheader71, %for.inc39
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.inc39 ], [ %indvars.iv17.ph, %for.inc39.preheader71 ]
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1, !dbg !93
  %cmp = icmp slt i64 %indvars.iv.next18, %22, !dbg !91
  br i1 %cmp, label %for.inc39, label %for.end41.loopexit72, !dbg !93, !llvm.loop !124

for.end41.loopexit:                               ; preds = %for.inc39.loopexit.us
  br label %for.end41, !dbg !126

for.end41.loopexit72:                             ; preds = %for.inc39
  br label %for.end41, !dbg !126

for.end41:                                        ; preds = %for.end41.loopexit72, %for.end41.loopexit, %middle.block, %polly.parallel.for37, %entry
  %call42 = tail call noalias i8* @malloc(i64 16) #7, !dbg !126
  %175 = bitcast i8* %call42 to %struct.Matrix*, !dbg !127
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %175, i64 0, metadata !128, metadata !32), !dbg !129
  %176 = bitcast i8* %call42 to i8**, !dbg !130
  store i8* %call, i8** %176, align 8, !dbg !130
  %width44 = getelementptr inbounds i8, i8* %call42, i64 8, !dbg !131
  %177 = bitcast i8* %width44 to i32*, !dbg !131
  store i32 %2, i32* %177, align 8, !dbg !132
  %height45 = getelementptr inbounds i8, i8* %call42, i64 12, !dbg !133
  %178 = bitcast i8* %height45 to i32*, !dbg !133
  store i32 %3, i32* %178, align 4, !dbg !134
  ret %struct.Matrix* %175, !dbg !135

polly.parallel.for37:                             ; preds = %polly.preload.merge
  %polly.fdiv_q.shr = ashr i64 %14, 5
  %179 = bitcast { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 32, i8* %179)
  %polly.subfn.storeaddr.polly.access.A.load = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 0
  store i32 %3, i32* %polly.subfn.storeaddr.polly.access.A.load, align 8
  %polly.subfn.storeaddr.polly.access.B.load = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 1
  store i32 %2, i32* %polly.subfn.storeaddr.polly.access.B.load, align 4
  %polly.subfn.storeaddr.polly.preload..merge = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 2
  store i32 %polly.preload..merge, i32* %polly.subfn.storeaddr.polly.preload..merge, align 8
  %polly.subfn.storeaddr. = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 3
  store i32 %2, i32* %polly.subfn.storeaddr., align 4
  %polly.subfn.storeaddr.call = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 4
  store i8* %call, i8** %polly.subfn.storeaddr.call, align 8
  %polly.subfn.storeaddr.A = getelementptr inbounds { i32, i32, i32, i32, i8*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, %struct.Matrix* }* %polly.par.userContext, i64 0, i32 5
  store %struct.Matrix* %A, %struct.Matrix** %polly.subfn.storeaddr.A, align 8
  %180 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @matrix_multiply_polly_subfn, i8* %179, i32 0, i64 0, i64 %180, i64 1) #7
  call void @matrix_multiply_polly_subfn(i8* %179) #7
  call void @GOMP_parallel_end() #7
  call void @llvm.lifetime.end(i64 8, i8* %179)
  %181 = bitcast { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39 to i8*
  call void @llvm.lifetime.start(i64 48, i8* %181)
  %polly.subfn.storeaddr.polly.access.A.load40 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 0
  store i32 %3, i32* %polly.subfn.storeaddr.polly.access.A.load40, align 8
  %polly.subfn.storeaddr.polly.access.B.load41 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 1
  store i32 %2, i32* %polly.subfn.storeaddr.polly.access.B.load41, align 4
  %polly.subfn.storeaddr.polly.preload..merge42 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 2
  store i32 %polly.preload..merge, i32* %polly.subfn.storeaddr.polly.preload..merge42, align 8
  %polly.subfn.storeaddr.43 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 3
  store i32 %2, i32* %polly.subfn.storeaddr.43, align 4
  %polly.subfn.storeaddr.call44 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 4
  store i8* %call, i8** %polly.subfn.storeaddr.call44, align 8
  %polly.subfn.storeaddr.45 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 5
  store i32* %0, i32** %polly.subfn.storeaddr.45, align 8
  %polly.subfn.storeaddr.46 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 6
  store i32* %1, i32** %polly.subfn.storeaddr.46, align 8
  %polly.subfn.storeaddr.A47 = getelementptr inbounds { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }, { i32, i32, i32, i32, i8*, i32*, i32*, %struct.Matrix* }* %polly.par.userContext39, i64 0, i32 7
  store %struct.Matrix* %A, %struct.Matrix** %polly.subfn.storeaddr.A47, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @matrix_multiply_polly_subfn_2, i8* %181, i32 0, i64 0, i64 %180, i64 1) #7
  call void @matrix_multiply_polly_subfn_2(i8* %181) #7
  call void @GOMP_parallel_end() #7
  call void @llvm.lifetime.end(i64 8, i8* %181)
  br label %for.end41

polly.preload.exec:                               ; preds = %for.cond7.preheader.lr.ph
  %182 = getelementptr %struct.Matrix, %struct.Matrix* %A, i64 0, i32 1
  %183 = bitcast i32* %182 to i64*
  %polly.access.A3.load = load i64, i64* %183, align 8
  %184 = trunc i64 %polly.access.A3.load to i32
  %185 = lshr i64 %polly.access.A3.load, 32
  %186 = trunc i64 %185 to i32
  br label %polly.preload.merge.region_exiting

polly.start:                                      ; preds = %polly.split_new_and_old
  br label %polly.stmt.vector.body.preheader

polly.stmt.vector.body.preheader:                 ; preds = %polly.start
  %187 = add i64 %n.vec, -16
  %188 = lshr i64 %187, 4
  %189 = add i64 %188, 1
  %190 = trunc i64 %189 to i3
  %191 = zext i3 %190 to i64
  %p_lcmp.mod74 = icmp eq i64 %191, 0, !dbg !93
  store i64 %187, i64* %.s2a
  store i64 0, i64* %index.unr.s2a
  br label %polly.loop_if

polly.loop_exit:                                  ; preds = %polly.stmt.vector.body.prol, %polly.loop_if
  br label %polly.cond

polly.cond:                                       ; preds = %polly.loop_exit
  %192 = icmp sge i64 %28, 1
  br i1 %192, label %polly.then, label %polly.else

polly.merge:                                      ; preds = %polly.else, %polly.stmt.vector.body.preheader.split.loopexit
  br label %polly.exiting

polly.exiting:                                    ; preds = %polly.merge
  %index.unr.ph.final_reload = load i64, i64* %index.unr.s2a
  %.final_reload = load i64, i64* %.s2a
  br label %polly.merge_new_and_old

polly.loop_if:                                    ; preds = %polly.stmt.vector.body.preheader
  %polly.loop_guard = icmp slt i64 0, %28
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %polly.loop_exit

polly.loop_header:                                ; preds = %polly.stmt.vector.body.prol, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.stmt.vector.body.prol ]
  br label %polly.stmt.vector.body.prol

polly.stmt.vector.body.prol:                      ; preds = %polly.loop_header
  %193 = sub i64 %196, %polly.indvar
  %p_prol.iter.cmp = icmp eq i64 %193, 0, !dbg !93
  %194 = shl i64 %polly.indvar, 4
  %195 = add i64 %194, 16
  store i64 %195, i64* %index.next.prol.lcssa.phiops
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.adjust_ub = sub i64 %28, 1
  %polly.loop_cond = icmp slt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.loop_header, label %polly.loop_exit

polly.loop_preheader:                             ; preds = %polly.loop_if
  %196 = add i64 %28, -1
  br label %polly.loop_header

polly.then:                                       ; preds = %polly.cond
  br label %polly.stmt.vector.body.preheader.split.loopexit

polly.stmt.vector.body.preheader.split.loopexit:  ; preds = %polly.then
  %index.next.prol.lcssa.phiops.reload = load i64, i64* %index.next.prol.lcssa.phiops
  store i64 %index.next.prol.lcssa.phiops.reload, i64* %index.unr.s2a
  br label %polly.merge

polly.else:                                       ; preds = %polly.cond
  br label %polly.merge

polly.start77:                                    ; preds = %polly.split_new_and_old75
  store i32 %.unr, i32* %.phiops
  br label %polly.stmt.for.body17.us

polly.stmt.for.body17.us:                         ; preds = %polly.start77
  %.phiops.reload = load i32, i32* %.phiops
  %197 = add i64 %171, %indvars.iv.us.unr
  %scevgep92 = getelementptr i32, i32* %scevgep, i64 %197
  %_p_scalar_ = load i32, i32* %scevgep92, align 4, !alias.scope !136, !noalias !138
  %198 = mul i64 %.merge193, %indvars.iv.us.unr
  %199 = add i64 %48, %198
  %scevgep94 = getelementptr i32, i32* %scevgep93, i64 %199
  %_p_scalar_95 = load i32, i32* %scevgep94, align 4, !alias.scope !139, !noalias !142
  %p_mul30.us = mul nsw i32 %_p_scalar_95, %_p_scalar_, !dbg !117
  %p_add31.us = add nsw i32 %p_mul30.us, %.phiops.reload, !dbg !122
  %200 = shl i64 %48, 2
  %scevgep97 = getelementptr i8, i8* %scevgep96, i64 %200
  %scevgep9798 = bitcast i8* %scevgep97 to i32*
  store i32 %p_add31.us, i32* %scevgep9798, align 4, !alias.scope !140, !noalias !143
  %201 = add i64 %171, %indvars.iv.us.unr
  %scevgep100 = getelementptr i32, i32* %scevgep99, i64 %201
  %_p_scalar_101 = load i32, i32* %scevgep100, align 4, !alias.scope !136, !noalias !138
  %scevgep102 = getelementptr i32, i32* %1, i64 %48
  %scevgep102103 = bitcast i32* %scevgep102 to i8*
  %202 = shl i64 %indvars.iv.us.unr, 2
  %203 = add i64 %202, 4
  %204 = mul i64 %.merge193, %203
  %uglygep = getelementptr i8, i8* %scevgep102103, i64 %204
  %uglygep104 = bitcast i8* %uglygep to i32*
  %_p_scalar_105 = load i32, i32* %uglygep104, align 4, !alias.scope !139, !noalias !142
  %p_mul30.us.1 = mul nsw i32 %_p_scalar_105, %_p_scalar_101, !dbg !117
  %p_add31.us.1 = add nsw i32 %p_mul30.us.1, %p_add31.us, !dbg !122
  store i32 %p_add31.us.1, i32* %scevgep9798, align 4, !alias.scope !140, !noalias !143
  %205 = add i64 %indvars.iv.us.unr, 2
  %p_cmp15.us.1 = icmp slt i64 %205, %35, !dbg !105
  store i32 %p_add31.us.1, i32* %.phiops
  %206 = sext i32 %38 to i64
  %207 = add nsw i64 %indvars.iv.us.unr, %206
  %208 = add nsw i64 %207, 1
  %polly.fdiv_q.shr106 = ashr i64 %208, 1
  %209 = sub nsw i64 %polly.fdiv_q.shr106, %indvars.iv.us.unr
  br label %polly.loop_if107

polly.loop_exit110:                               ; preds = %polly.stmt.for.body17.us116, %polly.loop_if107
  br label %polly.exiting78

polly.exiting78:                                  ; preds = %polly.loop_exit110
  br label %polly.merge_new_and_old76

polly.loop_if107:                                 ; preds = %polly.stmt.for.body17.us
  %polly.loop_guard111 = icmp slt i64 1, %209
  br i1 %polly.loop_guard111, label %polly.loop_preheader109, label %polly.loop_exit110

polly.loop_header108:                             ; preds = %polly.stmt.for.body17.us116, %polly.loop_preheader109
  %polly.indvar112 = phi i64 [ 1, %polly.loop_preheader109 ], [ %polly.indvar_next113, %polly.stmt.for.body17.us116 ]
  br label %polly.stmt.for.body17.us116

polly.stmt.for.body17.us116:                      ; preds = %polly.loop_header108
  %.phiops.reload117 = load i32, i32* %.phiops
  %210 = shl i64 %polly.indvar112, 1
  %scevgep119 = getelementptr i32, i32* %scevgep118, i64 %210
  %_p_scalar_120 = load i32, i32* %scevgep119, align 4, !alias.scope !136, !noalias !138
  %211 = mul i64 %42, %polly.indvar112
  %scevgep122 = getelementptr i32, i32* %scevgep121, i64 %211
  %_p_scalar_123 = load i32, i32* %scevgep122, align 4, !alias.scope !139, !noalias !142
  %p_mul30.us124 = mul nsw i32 %_p_scalar_123, %_p_scalar_120, !dbg !117
  %p_add31.us125 = add nsw i32 %p_mul30.us124, %.phiops.reload117, !dbg !122
  store i32 %p_add31.us125, i32* %scevgep127128, align 4, !alias.scope !140, !noalias !143
  %212 = shl i64 %polly.indvar112, 1
  %scevgep131 = getelementptr i32, i32* %scevgep130, i64 %212
  %_p_scalar_132 = load i32, i32* %scevgep131, align 4, !alias.scope !136, !noalias !138
  %213 = shl i64 %polly.indvar112, 3
  %214 = add i64 %222, %213
  %215 = mul i64 %.merge193, %214
  %uglygep135 = getelementptr i8, i8* %scevgep133134, i64 %215
  %uglygep135136 = bitcast i8* %uglygep135 to i32*
  %_p_scalar_137 = load i32, i32* %uglygep135136, align 4, !alias.scope !139, !noalias !142
  %p_mul30.us.1138 = mul nsw i32 %_p_scalar_137, %_p_scalar_132, !dbg !117
  %p_add31.us.1139 = add nsw i32 %p_mul30.us.1138, %p_add31.us125, !dbg !122
  store i32 %p_add31.us.1139, i32* %scevgep127128, align 4, !alias.scope !140, !noalias !143
  %216 = shl i64 %polly.indvar112, 1
  %217 = add i64 %223, %216
  %p_cmp15.us.1140 = icmp slt i64 %217, %35, !dbg !105
  store i32 %p_add31.us.1139, i32* %.phiops
  %polly.indvar_next113 = add nsw i64 %polly.indvar112, 1
  %polly.adjust_ub114 = sub i64 %209, 1
  %polly.loop_cond115 = icmp slt i64 %polly.indvar112, %polly.adjust_ub114
  br i1 %polly.loop_cond115, label %polly.loop_header108, label %polly.loop_exit110

polly.loop_preheader109:                          ; preds = %polly.loop_if107
  %218 = add i64 %171, %indvars.iv.us.unr
  %scevgep118 = getelementptr i32, i32* %0, i64 %218
  %219 = add i64 %48, %198
  %scevgep121 = getelementptr i32, i32* %1, i64 %219
  %220 = shl i64 %48, 2
  %scevgep127 = getelementptr i8, i8* %scevgep126, i64 %220
  %scevgep127128 = bitcast i8* %scevgep127 to i32*
  %221 = add i64 %171, %indvars.iv.us.unr
  %scevgep130 = getelementptr i32, i32* %scevgep129, i64 %221
  %scevgep133 = getelementptr i32, i32* %1, i64 %48
  %scevgep133134 = bitcast i32* %scevgep133 to i8*
  %222 = add i64 %202, 4
  %223 = add i64 %indvars.iv.us.unr, 2
  br label %polly.loop_header108

polly.start143:                                   ; preds = %polly.preload.merge150
  br label %polly.stmt.for.body17.us.preheader

polly.stmt.for.body17.us.preheader:               ; preds = %polly.start143
  store i32 0, i32* %.unr.s2a
  store i64 0, i64* %indvars.iv.us.unr.s2a
  br label %polly.cond167

polly.cond167:                                    ; preds = %polly.stmt.for.body17.us.preheader
  %224 = icmp sle i64 %xtraiter, -1
  %225 = icmp sge i64 %xtraiter, 1
  %226 = or i1 %224, %225
  br i1 %226, label %polly.then169, label %polly.else170

polly.merge168:                                   ; preds = %polly.else170, %polly.stmt.for.body17.us.prol
  br label %polly.exiting144

polly.exiting144:                                 ; preds = %polly.merge168
  %.unr.ph.final_reload = load i32, i32* %.unr.s2a
  %indvars.iv.us.unr.ph.final_reload = load i64, i64* %indvars.iv.us.unr.s2a
  br label %polly.merge_new_and_old142

polly.preload.exec146:                            ; preds = %polly.preload.cond
  %polly.access.147 = getelementptr i32, i32* %0, i64 %166
  %polly.access.147.load = load i32, i32* %polly.access.147, align 4
  br label %polly.preload.merge145

polly.preload.exec151:                            ; preds = %polly.preload.cond149
  %polly.access.152 = getelementptr i32, i32* %1, i64 %indvars.iv12.us
  %polly.access.152.load = load i32, i32* %polly.access.152, align 4
  br label %polly.preload.merge150

polly.then169:                                    ; preds = %polly.cond167
  br label %polly.stmt.for.body17.us.prol

polly.stmt.for.body17.us.prol:                    ; preds = %polly.then169
  %p_mul30.us.prol = mul nsw i32 %polly.preload..merge153, %polly.preload..merge148, !dbg !117
  %227 = shl i64 %46, 2
  %scevgep172 = getelementptr i8, i8* %scevgep171, i64 %227
  %scevgep172173 = bitcast i8* %scevgep172 to i32*
  store i32 %p_mul30.us.prol, i32* %scevgep172173, align 4, !alias.scope !144, !noalias !146
  store i32 %p_mul30.us.prol, i32* %.unr.s2a
  store i64 1, i64* %indvars.iv.us.unr.s2a
  br label %polly.merge168

polly.else170:                                    ; preds = %polly.cond167
  br label %polly.merge168

polly.start176:                                   ; preds = %polly.preload.merge180
  br label %polly.stmt.for.cond7.preheader.lr.ph

polly.stmt.for.cond7.preheader.lr.ph:             ; preds = %polly.start176
  %p_ = icmp sgt i32 %2, 0
  %228 = sext i32 %2 to i64
  store i64 %228, i64* %.s2a182
  store i1 %p_, i1* %.s2a183
  store i32 %3, i32* %.s2a184
  store i32 0, i32* %polly.preload..merge.s2a
  br label %polly.cond185

polly.cond185:                                    ; preds = %polly.stmt.for.cond7.preheader.lr.ph
  %229 = sext i32 %2 to i64
  %230 = icmp sge i64 %229, 1
  br i1 %230, label %polly.then187, label %polly.else188

polly.merge186:                                   ; preds = %polly.else188, %polly.stmt.polly.preload.exec
  br label %polly.exiting177

polly.exiting177:                                 ; preds = %polly.merge186
  %.ph.final_reload = load i32, i32* %.s2a184
  %polly.preload..merge.ph.final_reload = load i32, i32* %polly.preload..merge.s2a
  %.final_reload192 = load i64, i64* %.s2a182
  %.final_reload194 = load i1, i1* %.s2a183
  br label %polly.merge_new_and_old175

polly.preload.exec181:                            ; preds = %polly.preload.cond179
  %polly.access.cast.A = bitcast %struct.Matrix* %A to i64*
  %polly.access.A = getelementptr i64, i64* %polly.access.cast.A, i64 1
  %polly.access.A.load = load i64, i64* %polly.access.A, align 8
  br label %polly.preload.merge180

polly.then187:                                    ; preds = %polly.cond185
  br label %polly.stmt.polly.preload.exec

polly.stmt.polly.preload.exec:                    ; preds = %polly.then187
  %p_189 = trunc i64 %polly.preload.polly.access.A3.load.merge to i32
  %p_190 = lshr i64 %polly.preload.polly.access.A3.load.merge, 32
  %p_191 = trunc i64 %p_190 to i32
  store i32 %p_191, i32* %.s2a184
  store i32 %p_189, i32* %polly.preload..merge.s2a
  br label %polly.merge186

polly.else188:                                    ; preds = %polly.cond185
  br label %polly.merge186
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #2 !dbg !22 {
entry:
  %polly.par.userContext.i1 = alloca { i32, i32, i8*, i32 }, align 8
  %polly.par.userContext.i = alloca { i32, i32, i8*, i32 }, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !149, metadata !32), !dbg !150
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !151, metadata !32), !dbg !152
  tail call void @llvm.dbg.value(metadata %struct.Matrix* null, i64 0, metadata !153, metadata !32), !dbg !154
  tail call void @llvm.dbg.value(metadata %struct.Matrix* null, i64 0, metadata !155, metadata !32), !dbg !156
  tail call void @llvm.dbg.value(metadata %struct.Matrix* null, i64 0, metadata !157, metadata !32), !dbg !158
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7, !dbg !159
  %0 = load i64*, i64** %call, align 8, !dbg !160
  %call1 = tail call i64 @parseStringToInt(i64* %0) #7, !dbg !161
  %conv = trunc i64 %call1 to i32, !dbg !161
  tail call void @llvm.dbg.value(metadata i32 %conv, i64 0, metadata !162, metadata !32), !dbg !163
  tail call void @llvm.dbg.value(metadata i32 %conv, i64 0, metadata !164, metadata !32), !dbg !165
  tail call void @llvm.dbg.value(metadata i32 %conv, i64 0, metadata !166, metadata !32), !dbg !167
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !31, metadata !32) #7, !dbg !168
  tail call void @llvm.dbg.value(metadata i32 %conv, i64 0, metadata !34, metadata !32) #7, !dbg !170
  tail call void @llvm.dbg.value(metadata i32 %conv, i64 0, metadata !36, metadata !32) #7, !dbg !171
  %mul.i = shl i64 %call1, 2, !dbg !172
  %conv.i17 = mul i64 %mul.i, %call1, !dbg !173
  %mul1.i = and i64 %conv.i17, 17179869180, !dbg !173
  %call.i = tail call noalias i8* @malloc(i64 %mul1.i) #7, !dbg !174
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !42, metadata !32) #7, !dbg !175
  %cmp3.i = icmp sgt i32 %conv, 0, !dbg !176
  br i1 %cmp3.i, label %polly.parallel.for.i, label %init.exit, !dbg !177

polly.parallel.for.i:                             ; preds = %entry
  %sext19 = shl i64 %call1, 32, !dbg !178
  %1 = ashr exact i64 %sext19, 32, !dbg !178
  %2 = add nsw i64 %1, -1, !dbg !178
  %polly.fdiv_q.shr.i = ashr i64 %2, 5, !dbg !178
  %3 = bitcast { i32, i32, i8*, i32 }* %polly.par.userContext.i to i8*, !dbg !178
  call void @llvm.lifetime.start(i64 24, i8* %3) #7, !dbg !178
  %polly.subfn.storeaddr.width.i = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext.i, i64 0, i32 0, !dbg !178
  store i32 %conv, i32* %polly.subfn.storeaddr.width.i, align 8, !dbg !178
  %polly.subfn.storeaddr.height.i = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext.i, i64 0, i32 1, !dbg !178
  store i32 %conv, i32* %polly.subfn.storeaddr.height.i, align 4, !dbg !178
  %polly.subfn.storeaddr.call.i = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext.i, i64 0, i32 2, !dbg !178
  store i8* %call.i, i8** %polly.subfn.storeaddr.call.i, align 8, !dbg !178
  %polly.subfn.storeaddr.value.i = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext.i, i64 0, i32 3, !dbg !178
  store i32 1, i32* %polly.subfn.storeaddr.value.i, align 8, !dbg !178
  %4 = add nsw i64 %polly.fdiv_q.shr.i, 1, !dbg !178
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %3, i32 0, i64 0, i64 %4, i64 1) #7, !dbg !178
  call void @init_polly_subfn(i8* %3) #7, !dbg !178
  call void @GOMP_parallel_end() #7, !dbg !178
  call void @llvm.lifetime.end(i64 8, i8* %3) #7, !dbg !178
  br label %init.exit, !dbg !179

init.exit:                                        ; preds = %entry, %polly.parallel.for.i
  %call11.i = tail call noalias i8* @malloc(i64 16) #7, !dbg !179
  %5 = bitcast i8* %call11.i to %struct.Matrix*, !dbg !180
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %5, i64 0, metadata !51, metadata !32) #7, !dbg !181
  %6 = bitcast i8* %call11.i to i8**, !dbg !182
  store i8* %call.i, i8** %6, align 8, !dbg !182
  %width13.i = getelementptr inbounds i8, i8* %call11.i, i64 8, !dbg !183
  %7 = bitcast i8* %width13.i to i32*, !dbg !183
  store i32 %conv, i32* %7, align 8, !dbg !184
  %height14.i = getelementptr inbounds i8, i8* %call11.i, i64 12, !dbg !185
  %8 = bitcast i8* %height14.i to i32*, !dbg !185
  store i32 %conv, i32* %8, align 4, !dbg !186
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %5, i64 0, metadata !153, metadata !32), !dbg !154
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !31, metadata !32) #7, !dbg !187
  tail call void @llvm.dbg.value(metadata i32 %conv, i64 0, metadata !34, metadata !32) #7, !dbg !189
  tail call void @llvm.dbg.value(metadata i32 %conv, i64 0, metadata !36, metadata !32) #7, !dbg !190
  %call.i5 = tail call noalias i8* @malloc(i64 %mul1.i) #7, !dbg !191
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !42, metadata !32) #7, !dbg !192
  %sext18 = shl i64 %call1, 32, !dbg !193
  br i1 %cmp3.i, label %polly.parallel.for.i15, label %init.exit16, !dbg !194

polly.parallel.for.i15:                           ; preds = %init.exit
  %9 = ashr exact i64 %sext18, 32, !dbg !193
  %10 = add nsw i64 %9, -1, !dbg !193
  %polly.fdiv_q.shr.i10 = ashr i64 %10, 5, !dbg !193
  %11 = bitcast { i32, i32, i8*, i32 }* %polly.par.userContext.i1 to i8*, !dbg !193
  call void @llvm.lifetime.start(i64 24, i8* %11) #7, !dbg !193
  %polly.subfn.storeaddr.width.i11 = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext.i1, i64 0, i32 0, !dbg !193
  store i32 %conv, i32* %polly.subfn.storeaddr.width.i11, align 8, !dbg !193
  %polly.subfn.storeaddr.height.i12 = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext.i1, i64 0, i32 1, !dbg !193
  store i32 %conv, i32* %polly.subfn.storeaddr.height.i12, align 4, !dbg !193
  %polly.subfn.storeaddr.call.i13 = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext.i1, i64 0, i32 2, !dbg !193
  store i8* %call.i5, i8** %polly.subfn.storeaddr.call.i13, align 8, !dbg !193
  %polly.subfn.storeaddr.value.i14 = getelementptr inbounds { i32, i32, i8*, i32 }, { i32, i32, i8*, i32 }* %polly.par.userContext.i1, i64 0, i32 3, !dbg !193
  store i32 1, i32* %polly.subfn.storeaddr.value.i14, align 8, !dbg !193
  %12 = add nsw i64 %polly.fdiv_q.shr.i10, 1, !dbg !193
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %11, i32 0, i64 0, i64 %12, i64 1) #7, !dbg !193
  call void @init_polly_subfn(i8* %11) #7, !dbg !193
  call void @GOMP_parallel_end() #7, !dbg !193
  call void @llvm.lifetime.end(i64 8, i8* %11) #7, !dbg !193
  br label %init.exit16, !dbg !195

init.exit16:                                      ; preds = %init.exit, %polly.parallel.for.i15
  %call11.i7 = tail call noalias i8* @malloc(i64 16) #7, !dbg !195
  %13 = bitcast i8* %call11.i7 to %struct.Matrix*, !dbg !196
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %13, i64 0, metadata !51, metadata !32) #7, !dbg !197
  %14 = bitcast i8* %call11.i7 to i8**, !dbg !198
  store i8* %call.i5, i8** %14, align 8, !dbg !198
  %width13.i8 = getelementptr inbounds i8, i8* %call11.i7, i64 8, !dbg !199
  %15 = bitcast i8* %width13.i8 to i32*, !dbg !199
  store i32 %conv, i32* %15, align 8, !dbg !200
  %height14.i9 = getelementptr inbounds i8, i8* %call11.i7, i64 12, !dbg !201
  %16 = bitcast i8* %height14.i9 to i32*, !dbg !201
  store i32 %conv, i32* %16, align 4, !dbg !202
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %13, i64 0, metadata !155, metadata !32), !dbg !156
  %call4 = tail call %struct.Matrix* @matrix_multiply(%struct.Matrix* %5, %struct.Matrix* %13), !dbg !203
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !157, metadata !32), !dbg !158
  %sub = add nsw i32 %conv, -1, !dbg !204
  %sub7 = mul i64 %sext18, %call1, !dbg !205
  %sext = add i64 %sub7, -4294967296, !dbg !205
  %idxprom = ashr exact i64 %sext, 32, !dbg !205
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !206
  %17 = load i32*, i32** %data, align 8, !dbg !206
  %arrayidx8 = getelementptr inbounds i32, i32* %17, i64 %idxprom, !dbg !205
  %18 = load i32, i32* %arrayidx8, align 4, !dbg !205
  %call9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv, i32 %sub, i32 %sub, i32 %18) #7, !dbg !207
  ret i32 0, !dbg !208
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64 @parseStringToInt(i64*) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #5

define internal void @init_polly_subfn(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i32*
  %polly.subfunc.arg.width = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 4
  %2 = bitcast i8* %1 to i32*
  %polly.subfunc.arg.height = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %4 = bitcast i8* %3 to i8**
  %polly.subfunc.arg.call = load i8*, i8** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %6 = bitcast i8* %5 to i32*
  %polly.subfunc.arg.value = load i32, i32* %6, align 4
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %9 = sext i32 %polly.subfunc.arg.width to i64
  %10 = add nsw i64 %9, -1
  %polly.fdiv_q.shr = ashr i64 %10, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %11 = sext i32 %polly.subfunc.arg.height to i64
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %12 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  br i1 %polly.loop_guard, label %polly.loop_header2.preheader, label %polly.loop_exit4

polly.loop_header2.preheader:                     ; preds = %polly.loop_header
  %14 = shl i64 %polly.indvar, 5
  %15 = sub nsw i64 %11, %14
  %16 = add nsw i64 %15, -1
  %17 = icmp sgt i64 %16, 31
  %18 = select i1 %17, i64 31, i64 %16
  %polly.loop_guard13 = icmp sgt i64 %18, -1
  %polly.adjust_ub16 = add i64 %18, -1
  br i1 %polly.loop_guard13, label %polly.loop_header10.preheader.us.preheader, label %polly.loop_exit4

polly.loop_header10.preheader.us.preheader:       ; preds = %polly.loop_header2.preheader
  br label %polly.loop_header10.preheader.us

polly.loop_header10.preheader.us:                 ; preds = %polly.loop_header10.preheader.us.preheader, %polly.loop_exit12.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit12.loopexit.us ], [ 0, %polly.loop_header10.preheader.us.preheader ]
  %19 = shl i64 %polly.indvar5.us, 5
  %20 = sub nsw i64 %9, %19
  %21 = add nsw i64 %20, -1
  %22 = icmp sgt i64 %21, 31
  %23 = select i1 %22, i64 31, i64 %21
  %polly.loop_guard22.us = icmp sgt i64 %23, -1
  %polly.adjust_ub25.us = add i64 %23, -1
  br i1 %polly.loop_guard22.us, label %polly.stmt.for.body6.preheader.us.us.preheader, label %polly.loop_exit12.loopexit.us

polly.stmt.for.body6.preheader.us.us.preheader:   ; preds = %polly.loop_header10.preheader.us
  br label %polly.stmt.for.body6.preheader.us.us

polly.loop_exit12.loopexit.us.loopexit:           ; preds = %polly.loop_exit21.loopexit.us.us
  br label %polly.loop_exit12.loopexit.us

polly.loop_exit12.loopexit.us:                    ; preds = %polly.loop_exit12.loopexit.us.loopexit, %polly.loop_header10.preheader.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar5.us, %polly.fdiv_q.shr
  br i1 %exitcond.us, label %polly.loop_exit4.loopexit, label %polly.loop_header10.preheader.us

polly.stmt.for.body6.preheader.us.us:             ; preds = %polly.stmt.for.body6.preheader.us.us.preheader, %polly.loop_exit21.loopexit.us.us
  %polly.indvar14.us.us = phi i64 [ %polly.indvar_next15.us.us, %polly.loop_exit21.loopexit.us.us ], [ 0, %polly.stmt.for.body6.preheader.us.us.preheader ]
  %24 = add nsw i64 %polly.indvar14.us.us, %14
  %25 = mul i64 %24, %9
  %26 = add i64 %25, %19
  br label %polly.stmt.for.body6.us.us

polly.loop_exit21.loopexit.us.us:                 ; preds = %polly.stmt.for.body6.us.us
  %polly.indvar_next15.us.us = add nuw nsw i64 %polly.indvar14.us.us, 1
  %polly.loop_cond17.us.us = icmp sgt i64 %polly.indvar14.us.us, %polly.adjust_ub16
  br i1 %polly.loop_cond17.us.us, label %polly.loop_exit12.loopexit.us.loopexit, label %polly.stmt.for.body6.preheader.us.us

polly.stmt.for.body6.us.us:                       ; preds = %polly.stmt.for.body6.us.us, %polly.stmt.for.body6.preheader.us.us
  %polly.indvar23.us.us = phi i64 [ %polly.indvar_next24.us.us, %polly.stmt.for.body6.us.us ], [ 0, %polly.stmt.for.body6.preheader.us.us ]
  %tmp.us.us = add i64 %26, %polly.indvar23.us.us
  %tmp28.us.us = shl i64 %tmp.us.us, 2
  %scevgep.us.us = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp28.us.us
  %scevgep27.us.us = bitcast i8* %scevgep.us.us to i32*
  store i32 %polly.subfunc.arg.value, i32* %scevgep27.us.us, align 4, !alias.scope !209, !noalias !2, !llvm.mem.parallel_loop_access !211
  %polly.indvar_next24.us.us = add nuw nsw i64 %polly.indvar23.us.us, 1
  %polly.loop_cond26.us.us = icmp sgt i64 %polly.indvar23.us.us, %polly.adjust_ub25.us
  br i1 %polly.loop_cond26.us.us, label %polly.loop_exit21.loopexit.us.us, label %polly.stmt.for.body6.us.us, !llvm.loop !211

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

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #5

define internal void @matrix_multiply_polly_subfn(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i32*
  %polly.subfunc.arg.polly.access.A.load = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 4
  %2 = bitcast i8* %1 to i32*
  %polly.subfunc.arg.polly.access.B.load = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 12
  %4 = bitcast i8* %3 to i32*
  %polly.subfunc.arg. = load i32, i32* %4, align 4
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %6 = bitcast i8* %5 to i8**
  %polly.subfunc.arg.call = load i8*, i8** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %9 = sext i32 %polly.subfunc.arg. to i64
  %10 = sext i32 %polly.subfunc.arg.polly.access.B.load to i64
  %11 = add nsw i64 %10, -1
  %polly.fdiv_q.shr = ashr i64 %11, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %12 = sext i32 %polly.subfunc.arg.polly.access.A.load to i64
  %13 = shl nsw i64 %9, 2
  %14 = shl nsw i64 %9, 7
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %15 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.par.loadIVBounds
  %indvar = phi i64 [ %indvar.next, %polly.loop_exit4 ], [ 0, %polly.par.loadIVBounds ]
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit4 ], [ %polly.par.LB, %polly.par.loadIVBounds ]
  %17 = add i64 %polly.par.LB, %indvar
  %18 = mul i64 %14, %17
  br i1 %polly.loop_guard, label %polly.loop_header2.preheader, label %polly.loop_exit4

polly.loop_header2.preheader:                     ; preds = %polly.loop_header
  %19 = shl nsw i64 %polly.indvar, 5
  %20 = sub nsw i64 %12, %19
  %21 = add nsw i64 %20, -1
  %22 = icmp sgt i64 %21, 31
  %23 = select i1 %22, i64 31, i64 %21
  %polly.loop_guard13 = icmp sgt i64 %23, -1
  %polly.adjust_ub16 = add i64 %23, -1
  br i1 %polly.loop_guard13, label %polly.loop_header10.preheader.us.preheader, label %polly.loop_exit4

polly.loop_header10.preheader.us.preheader:       ; preds = %polly.loop_header2.preheader
  br label %polly.loop_header10.preheader.us

polly.loop_header10.preheader.us:                 ; preds = %polly.loop_header10.preheader.us.preheader, %polly.loop_exit12.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit12.loopexit.us ], [ 0, %polly.loop_header10.preheader.us.preheader ]
  %24 = shl i64 %polly.indvar5.us, 7
  %25 = add i64 %18, %24
  %26 = shl i64 %polly.indvar5.us, 5
  %27 = sub i64 %26, %10
  %28 = icmp sgt i64 %27, -32
  %smax = select i1 %28, i64 %27, i64 -32
  %29 = sub i64 -2, %smax
  %30 = icmp sgt i64 %29, -1
  %smax48 = select i1 %30, i64 %29, i64 -1
  %31 = shl i64 %smax48, 2
  %32 = add i64 %31, 8
  %polly.loop_guard22.us49 = icmp slt i64 %26, %10
  br i1 %polly.loop_guard22.us49, label %polly.stmt.for.body11.preheader.us.us.preheader, label %polly.loop_exit12.loopexit.us

polly.stmt.for.body11.preheader.us.us.preheader:  ; preds = %polly.loop_header10.preheader.us
  br label %polly.stmt.for.body11.preheader.us.us

polly.loop_exit12.loopexit.us.loopexit:           ; preds = %polly.stmt.for.body11.preheader.us.us
  br label %polly.loop_exit12.loopexit.us

polly.loop_exit12.loopexit.us:                    ; preds = %polly.loop_exit12.loopexit.us.loopexit, %polly.loop_header10.preheader.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar5.us, %polly.fdiv_q.shr
  br i1 %exitcond.us, label %polly.loop_exit4.loopexit, label %polly.loop_header10.preheader.us

polly.stmt.for.body11.preheader.us.us:            ; preds = %polly.stmt.for.body11.preheader.us.us.preheader, %polly.stmt.for.body11.preheader.us.us
  %polly.indvar14.us.us = phi i64 [ %polly.indvar_next15.us.us, %polly.stmt.for.body11.preheader.us.us ], [ 0, %polly.stmt.for.body11.preheader.us.us.preheader ]
  %33 = mul i64 %13, %polly.indvar14.us.us
  %34 = add i64 %25, %33
  %scevgep = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %32, i32 4, i1 false)
  %polly.indvar_next15.us.us = add nuw nsw i64 %polly.indvar14.us.us, 1
  %polly.loop_cond17.us.us = icmp sgt i64 %polly.indvar14.us.us, %polly.adjust_ub16
  br i1 %polly.loop_cond17.us.us, label %polly.loop_exit12.loopexit.us.loopexit, label %polly.stmt.for.body11.preheader.us.us

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit12.loopexit.us
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_header2.preheader, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  %indvar.next = add i64 %indvar, 1
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

define internal void @matrix_multiply_polly_subfn_2(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i32*
  %polly.subfunc.arg.polly.access.A.load = load i32, i32* %0, align 4
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 4
  %2 = bitcast i8* %1 to i32*
  %polly.subfunc.arg.polly.access.B.load = load i32, i32* %2, align 4
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %4 = bitcast i8* %3 to i32*
  %polly.subfunc.arg.polly.preload..merge = load i32, i32* %4, align 4
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 12
  %6 = bitcast i8* %5 to i32*
  %polly.subfunc.arg. = load i32, i32* %6, align 4
  %7 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %8 = bitcast i8* %7 to i8**
  %polly.subfunc.arg.call = load i8*, i8** %8, align 8
  %9 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 24
  %10 = bitcast i8* %9 to i32**
  %polly.subfunc.arg.2 = load i32*, i32** %10, align 8
  %11 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 32
  %12 = bitcast i8* %11 to i32**
  %polly.subfunc.arg.3 = load i32*, i32** %12, align 8
  %13 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %15 = sext i32 %polly.subfunc.arg. to i64
  %16 = sext i32 %polly.subfunc.arg.polly.access.B.load to i64
  %17 = add nsw i64 %16, -1
  %polly.fdiv_q.shr = ashr i64 %17, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %18 = sext i32 %polly.subfunc.arg.polly.preload..merge to i64
  %19 = add nsw i64 %18, -1
  %polly.fdiv_q.shr11 = ashr i64 %19, 5
  %polly.loop_guard16 = icmp sgt i64 %polly.fdiv_q.shr11, -1
  %20 = sext i32 %polly.subfunc.arg.polly.access.A.load to i64
  %ident.check = icmp eq i32 %polly.subfunc.arg., 1
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit6
  %21 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit6, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit6 ]
  br i1 %polly.loop_guard, label %polly.loop_header4.preheader, label %polly.loop_exit6

polly.loop_header4.preheader:                     ; preds = %polly.loop_header
  %23 = shl nsw i64 %polly.indvar, 5
  %24 = sub nsw i64 %20, %23
  %25 = add nsw i64 %24, -1
  %26 = icmp sgt i64 %25, 31
  %27 = select i1 %26, i64 31, i64 %25
  %polly.loop_guard25 = icmp sgt i64 %27, -1
  %polly.adjust_ub28 = add i64 %27, -1
  br label %polly.loop_header4

polly.loop_exit6.loopexit:                        ; preds = %polly.loop_exit15
  br label %polly.loop_exit6

polly.loop_exit6:                                 ; preds = %polly.loop_exit6.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header4:                               ; preds = %polly.loop_header4.preheader, %polly.loop_exit15
  %polly.indvar7 = phi i64 [ %polly.indvar_next8, %polly.loop_exit15 ], [ 0, %polly.loop_header4.preheader ]
  br i1 %polly.loop_guard16, label %polly.loop_header13.preheader, label %polly.loop_exit15

polly.loop_header13.preheader:                    ; preds = %polly.loop_header4
  %28 = shl nsw i64 %polly.indvar7, 5
  %29 = sub nsw i64 %16, %28
  %30 = add nsw i64 %29, -1
  %31 = icmp sgt i64 %30, 31
  %32 = select i1 %31, i64 31, i64 %30
  %polly.loop_guard34 = icmp sgt i64 %32, -1
  %polly.adjust_ub37 = add i64 %32, -1
  br label %polly.loop_header13

polly.loop_exit15.loopexit:                       ; preds = %polly.loop_exit24
  br label %polly.loop_exit15

polly.loop_exit15:                                ; preds = %polly.loop_exit15.loopexit, %polly.loop_header4
  %polly.indvar_next8 = add nuw nsw i64 %polly.indvar7, 1
  %exitcond58 = icmp eq i64 %polly.indvar7, %polly.fdiv_q.shr
  br i1 %exitcond58, label %polly.loop_exit6.loopexit, label %polly.loop_header4

polly.loop_header13:                              ; preds = %polly.loop_header13.preheader, %polly.loop_exit24
  %polly.indvar17 = phi i64 [ %polly.indvar_next18, %polly.loop_exit24 ], [ 0, %polly.loop_header13.preheader ]
  %33 = shl i64 %polly.indvar17, 5
  %34 = sub i64 %33, %18
  %35 = icmp sgt i64 %34, -32
  %smax = select i1 %35, i64 %34, i64 -32
  %36 = sub i64 -2, %smax
  %37 = icmp sgt i64 %36, -1
  %smax88 = select i1 %37, i64 %36, i64 -1
  %38 = add i64 %smax88, 2
  br i1 %polly.loop_guard25, label %polly.loop_header22.preheader, label %polly.loop_exit24

polly.loop_header22.preheader:                    ; preds = %polly.loop_header13
  %39 = shl nsw i64 %polly.indvar17, 5
  %40 = sub nsw i64 %18, %39
  %41 = add nsw i64 %40, -1
  %42 = icmp sgt i64 %41, 31
  %43 = select i1 %42, i64 31, i64 %41
  %polly.loop_guard43 = icmp sgt i64 %43, -1
  %polly.adjust_ub46 = add i64 %43, -1
  br i1 %polly.loop_guard34, label %polly.loop_header31.preheader.us.preheader, label %polly.loop_exit24

polly.loop_header31.preheader.us.preheader:       ; preds = %polly.loop_header22.preheader
  %min.iters.check = icmp ult i64 %38, 4
  %n.vec = and i64 %38, -4
  %cmp.zero = icmp ne i64 %n.vec, 0
  %or.cond = and i1 %cmp.zero, %ident.check
  %broadcast.splatinsert89 = insertelement <4 x i64> undef, i64 %39, i32 0
  %broadcast.splat90 = shufflevector <4 x i64> %broadcast.splatinsert89, <4 x i64> undef, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i64 %38, %n.vec
  br label %polly.loop_header31.preheader.us

polly.loop_header31.preheader.us:                 ; preds = %polly.loop_header31.preheader.us.preheader, %polly.loop_exit33.loopexit.us
  %polly.indvar26.us = phi i64 [ %polly.indvar_next27.us, %polly.loop_exit33.loopexit.us ], [ 0, %polly.loop_header31.preheader.us.preheader ]
  %44 = add nsw i64 %polly.indvar26.us, %23
  %45 = mul i64 %44, %15
  br i1 %polly.loop_guard43, label %polly.loop_header40.preheader.us.us.preheader, label %polly.loop_exit33.loopexit.us

polly.loop_header40.preheader.us.us.preheader:    ; preds = %polly.loop_header31.preheader.us
  br label %polly.loop_header40.preheader.us.us

polly.loop_exit33.loopexit.us.loopexit:           ; preds = %polly.loop_exit42.loopexit.us.us
  br label %polly.loop_exit33.loopexit.us

polly.loop_exit33.loopexit.us:                    ; preds = %polly.loop_exit33.loopexit.us.loopexit, %polly.loop_header31.preheader.us
  %polly.indvar_next27.us = add nuw nsw i64 %polly.indvar26.us, 1
  %polly.loop_cond29.us = icmp sgt i64 %polly.indvar26.us, %polly.adjust_ub28
  br i1 %polly.loop_cond29.us, label %polly.loop_exit24.loopexit, label %polly.loop_header31.preheader.us

polly.loop_header40.preheader.us.us:              ; preds = %polly.loop_header40.preheader.us.us.preheader, %polly.loop_exit42.loopexit.us.us
  %polly.indvar35.us.us = phi i64 [ %polly.indvar_next36.us.us, %polly.loop_exit42.loopexit.us.us ], [ 0, %polly.loop_header40.preheader.us.us.preheader ]
  %46 = add nuw nsw i64 %polly.indvar35.us.us, %28
  %tmp.us.us = add i64 %46, %45
  %tmp55.us.us = shl i64 %tmp.us.us, 2
  %scevgep.us.us = getelementptr i8, i8* %polly.subfunc.arg.call, i64 %tmp55.us.us
  %scevgep48.us.us = bitcast i8* %scevgep.us.us to i32*
  %scevgep48.promoted.us.us = load i32, i32* %scevgep48.us.us, align 4, !alias.scope !212, !noalias !214
  br i1 %min.iters.check, label %polly.loop_header40.us.us.preheader, label %min.iters.checked

polly.loop_header40.us.us.preheader:              ; preds = %min.iters.checked, %middle.block, %polly.loop_header40.preheader.us.us
  %p_add3159.us.us.ph = phi i32 [ %scevgep48.promoted.us.us, %min.iters.checked ], [ %scevgep48.promoted.us.us, %polly.loop_header40.preheader.us.us ], [ %58, %middle.block ]
  %polly.indvar44.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %polly.loop_header40.preheader.us.us ], [ %n.vec, %middle.block ]
  br label %polly.loop_header40.us.us

min.iters.checked:                                ; preds = %polly.loop_header40.preheader.us.us
  br i1 %or.cond, label %vector.ph, label %polly.loop_header40.us.us.preheader

vector.ph:                                        ; preds = %min.iters.checked
  %47 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %scevgep48.promoted.us.us, i32 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %47, %vector.ph ], [ %56, %vector.body ]
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i64> %broadcast.splat, <i64 0, i64 1, i64 2, i64 3>
  %48 = add nuw nsw <4 x i64> %induction, %broadcast.splat90
  %.lhs = extractelement <4 x i64> %48, i32 0
  %49 = add i64 %.lhs, %45
  %50 = getelementptr i32, i32* %polly.subfunc.arg.2, i64 %49
  %51 = bitcast i32* %50 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %51, align 4, !alias.scope !216, !noalias !217
  %.lhs100 = extractelement <4 x i64> %48, i32 0
  %52 = add i64 %.lhs100, %46
  %53 = getelementptr i32, i32* %polly.subfunc.arg.3, i64 %52
  %54 = bitcast i32* %53 to <4 x i32>*
  %wide.load95 = load <4 x i32>, <4 x i32>* %54, align 4, !alias.scope !215, !noalias !218
  %55 = mul nsw <4 x i32> %wide.load95, %wide.load, !dbg !117
  %56 = add nsw <4 x i32> %55, %vec.phi, !dbg !122
  %index.next = add i64 %index, 4
  %57 = icmp eq i64 %index.next, %n.vec
  br i1 %57, label %middle.block, label %vector.body, !llvm.loop !219

middle.block:                                     ; preds = %vector.body
  %.lcssa = phi <4 x i32> [ %56, %vector.body ]
  %rdx.shuf = shufflevector <4 x i32> %.lcssa, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !122
  %bin.rdx = add <4 x i32> %.lcssa, %rdx.shuf, !dbg !122
  %rdx.shuf98 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !122
  %bin.rdx99 = add <4 x i32> %bin.rdx, %rdx.shuf98, !dbg !122
  %58 = extractelement <4 x i32> %bin.rdx99, i32 0, !dbg !122
  br i1 %cmp.n, label %polly.loop_exit42.loopexit.us.us, label %polly.loop_header40.us.us.preheader

polly.loop_exit42.loopexit.us.us.loopexit:        ; preds = %polly.loop_header40.us.us
  %p_add31.us.us.lcssa102 = phi i32 [ %p_add31.us.us, %polly.loop_header40.us.us ]
  br label %polly.loop_exit42.loopexit.us.us

polly.loop_exit42.loopexit.us.us:                 ; preds = %polly.loop_exit42.loopexit.us.us.loopexit, %middle.block
  %p_add31.us.us.lcssa = phi i32 [ %58, %middle.block ], [ %p_add31.us.us.lcssa102, %polly.loop_exit42.loopexit.us.us.loopexit ]
  store i32 %p_add31.us.us.lcssa, i32* %scevgep48.us.us, align 4, !alias.scope !212, !noalias !214
  %polly.indvar_next36.us.us = add nuw nsw i64 %polly.indvar35.us.us, 1
  %polly.loop_cond38.us.us = icmp sgt i64 %polly.indvar35.us.us, %polly.adjust_ub37
  br i1 %polly.loop_cond38.us.us, label %polly.loop_exit33.loopexit.us.loopexit, label %polly.loop_header40.preheader.us.us

polly.loop_header40.us.us:                        ; preds = %polly.loop_header40.us.us.preheader, %polly.loop_header40.us.us
  %p_add3159.us.us = phi i32 [ %p_add31.us.us, %polly.loop_header40.us.us ], [ %p_add3159.us.us.ph, %polly.loop_header40.us.us.preheader ]
  %polly.indvar44.us.us = phi i64 [ %polly.indvar_next45.us.us, %polly.loop_header40.us.us ], [ %polly.indvar44.us.us.ph, %polly.loop_header40.us.us.preheader ]
  %59 = add nuw nsw i64 %polly.indvar44.us.us, %39
  %60 = add i64 %59, %45
  %scevgep49.us.us = getelementptr i32, i32* %polly.subfunc.arg.2, i64 %60
  %_p_scalar_50.us.us = load i32, i32* %scevgep49.us.us, align 4, !alias.scope !216, !noalias !217
  %61 = mul i64 %59, %15
  %62 = add i64 %61, %46
  %scevgep51.us.us = getelementptr i32, i32* %polly.subfunc.arg.3, i64 %62
  %_p_scalar_52.us.us = load i32, i32* %scevgep51.us.us, align 4, !alias.scope !215, !noalias !218
  %p_mul30.us.us = mul nsw i32 %_p_scalar_52.us.us, %_p_scalar_50.us.us, !dbg !117
  %p_add31.us.us = add nsw i32 %p_mul30.us.us, %p_add3159.us.us, !dbg !122
  %polly.indvar_next45.us.us = add nuw nsw i64 %polly.indvar44.us.us, 1
  %polly.loop_cond47.us.us = icmp sgt i64 %polly.indvar44.us.us, %polly.adjust_ub46
  br i1 %polly.loop_cond47.us.us, label %polly.loop_exit42.loopexit.us.us.loopexit, label %polly.loop_header40.us.us, !llvm.loop !220

polly.loop_exit24.loopexit:                       ; preds = %polly.loop_exit33.loopexit.us
  br label %polly.loop_exit24

polly.loop_exit24:                                ; preds = %polly.loop_exit24.loopexit, %polly.loop_header22.preheader, %polly.loop_header13
  %polly.indvar_next18 = add nuw nsw i64 %polly.indvar17, 1
  %exitcond = icmp eq i64 %polly.indvar17, %polly.fdiv_q.shr11
  br i1 %exitcond, label %polly.loop_exit15.loopexit, label %polly.loop_header13
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { argmemonly nounwind }
attributes #6 = { "polly.skip.fn" }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !14)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "Matrix", file: !1, line: 9, baseType: !8)
!8 = !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 5, size: 128, align: 64, elements: !9)
!9 = !{!10, !12, !13}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !1, line: 6, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !4)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !8, file: !1, line: 7, baseType: !5, size: 32, align: 32, offset: 64)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !8, file: !1, line: 8, baseType: !5, size: 32, align: 32, offset: 96)
!14 = !{!15, !19, !22}
!15 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 11, type: !16, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !5, !5, !5}
!18 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !6)
!19 = distinct !DISubprogram(name: "matrix_multiply", scope: !1, file: !1, line: 29, type: !20, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!18, !18, !18}
!22 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 85, type: !23, isLocal: false, isDefinition: true, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!5, !5, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, align: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64, align: 64)
!27 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!28 = !{i32 2, !"Dwarf Version", i32 4}
!29 = !{i32 2, !"Debug Info Version", i32 3}
!30 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!31 = !DILocalVariable(name: "value", arg: 1, scope: !15, file: !1, line: 11, type: !5)
!32 = !DIExpression()
!33 = !DILocation(line: 11, column: 31, scope: !15)
!34 = !DILocalVariable(name: "width", arg: 2, scope: !15, file: !1, line: 11, type: !5)
!35 = !DILocation(line: 11, column: 42, scope: !15)
!36 = !DILocalVariable(name: "height", arg: 3, scope: !15, file: !1, line: 11, type: !5)
!37 = !DILocation(line: 11, column: 53, scope: !15)
!38 = !DILocation(line: 15, column: 49, scope: !15)
!39 = !DILocation(line: 15, column: 43, scope: !15)
!40 = !DILocation(line: 15, column: 55, scope: !15)
!41 = !DILocation(line: 15, column: 36, scope: !15)
!42 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 13, type: !5)
!43 = !DILocation(line: 13, column: 9, scope: !15)
!44 = !DILocation(line: 16, column: 14, scope: !45)
!45 = !DILexicalBlockFile(scope: !46, file: !1, discriminator: 1)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 16, column: 5)
!47 = distinct !DILexicalBlock(scope: !15, file: !1, line: 16, column: 5)
!48 = !DILocation(line: 16, column: 5, scope: !45)
!49 = !DILocation(line: 21, column: 44, scope: !15)
!50 = !DILocation(line: 21, column: 35, scope: !15)
!51 = !DILocalVariable(name: "matrix", scope: !15, file: !1, line: 21, type: !18)
!52 = !DILocation(line: 21, column: 26, scope: !15)
!53 = !DILocation(line: 22, column: 18, scope: !15)
!54 = !DILocation(line: 23, column: 13, scope: !15)
!55 = !DILocation(line: 23, column: 19, scope: !15)
!56 = !DILocation(line: 24, column: 13, scope: !15)
!57 = !DILocation(line: 24, column: 20, scope: !15)
!58 = !DILocation(line: 26, column: 5, scope: !15)
!59 = !DILocalVariable(name: "A", arg: 1, scope: !19, file: !1, line: 29, type: !18)
!60 = !DILocation(line: 29, column: 59, scope: !19)
!61 = !DILocalVariable(name: "B", arg: 2, scope: !19, file: !1, line: 29, type: !18)
!62 = !DILocation(line: 29, column: 83, scope: !19)
!63 = !DILocation(line: 31, column: 35, scope: !19)
!64 = !DILocalVariable(name: "A_data", scope: !19, file: !1, line: 31, type: !11)
!65 = !DILocation(line: 31, column: 23, scope: !19)
!66 = !DILocation(line: 32, column: 35, scope: !19)
!67 = !DILocalVariable(name: "B_data", scope: !19, file: !1, line: 32, type: !11)
!68 = !DILocation(line: 32, column: 23, scope: !19)
!69 = !DILocation(line: 34, column: 20, scope: !19)
!70 = !DILocation(line: 39, column: 22, scope: !71)
!71 = !DILexicalBlockFile(scope: !72, file: !1, discriminator: 1)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 39, column: 9)
!73 = distinct !DILexicalBlock(scope: !74, file: !1, line: 39, column: 9)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 37, column: 33)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 37, column: 5)
!76 = distinct !DILexicalBlock(scope: !19, file: !1, line: 37, column: 5)
!77 = !DILocalVariable(name: "width", scope: !19, file: !1, line: 34, type: !5)
!78 = !DILocation(line: 34, column: 9, scope: !19)
!79 = !DILocation(line: 35, column: 21, scope: !19)
!80 = !DILocalVariable(name: "height", scope: !19, file: !1, line: 35, type: !5)
!81 = !DILocation(line: 35, column: 9, scope: !19)
!82 = !DILocation(line: 36, column: 50, scope: !19)
!83 = !DILocation(line: 36, column: 45, scope: !19)
!84 = !DILocation(line: 36, column: 57, scope: !19)
!85 = !DILocation(line: 36, column: 38, scope: !19)
!86 = !DILocation(line: 36, column: 32, scope: !19)
!87 = !DILocalVariable(name: "C_data", scope: !19, file: !1, line: 36, type: !11)
!88 = !DILocation(line: 36, column: 23, scope: !19)
!89 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 30, type: !5)
!90 = !DILocation(line: 30, column: 9, scope: !19)
!91 = !DILocation(line: 37, column: 15, scope: !92)
!92 = !DILexicalBlockFile(scope: !75, file: !1, discriminator: 1)
!93 = !DILocation(line: 37, column: 5, scope: !92)
!94 = !DILocation(line: 39, column: 9, scope: !71)
!95 = distinct !{!95, !96}
!96 = !{!"llvm.loop.unroll.disable"}
!97 = distinct !{!97, !98, !99}
!98 = !{!"llvm.loop.vectorize.width", i32 1}
!99 = !{!"llvm.loop.interleave.count", i32 1}
!100 = !DILocation(line: 41, column: 26, scope: !101)
!101 = !DILexicalBlockFile(scope: !102, file: !1, discriminator: 1)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 41, column: 13)
!103 = distinct !DILexicalBlock(scope: !104, file: !1, line: 41, column: 13)
!104 = distinct !DILexicalBlock(scope: !72, file: !1, line: 39, column: 32)
!105 = !DILocation(line: 41, column: 22, scope: !101)
!106 = !DILocation(line: 42, column: 71, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !1, line: 41, column: 36)
!108 = !DILocation(line: 40, column: 21, scope: !104)
!109 = !DILocation(line: 40, column: 27, scope: !104)
!110 = !DILocation(line: 40, column: 13, scope: !104)
!111 = !DILocation(line: 40, column: 31, scope: !104)
!112 = !DILocalVariable(name: "k", scope: !19, file: !1, line: 30, type: !5)
!113 = !DILocation(line: 30, column: 13, scope: !19)
!114 = !DILocation(line: 41, column: 13, scope: !101)
!115 = !DILocation(line: 42, column: 57, scope: !107)
!116 = !DILocation(line: 42, column: 75, scope: !107)
!117 = !DILocation(line: 42, column: 74, scope: !107)
!118 = !DILocation(line: 42, column: 35, scope: !107)
!119 = !DILocation(line: 42, column: 37, scope: !107)
!120 = !DILocation(line: 42, column: 83, scope: !107)
!121 = !DILocation(line: 42, column: 89, scope: !107)
!122 = !DILocation(line: 42, column: 55, scope: !107)
!123 = !DILocation(line: 39, column: 18, scope: !71)
!124 = distinct !{!124, !125, !98, !99}
!125 = !{!"llvm.loop.unroll.runtime.disable"}
!126 = !DILocation(line: 47, column: 39, scope: !19)
!127 = !DILocation(line: 47, column: 30, scope: !19)
!128 = !DILocalVariable(name: "C", scope: !19, file: !1, line: 47, type: !18)
!129 = !DILocation(line: 47, column: 26, scope: !19)
!130 = !DILocation(line: 48, column: 13, scope: !19)
!131 = !DILocation(line: 49, column: 8, scope: !19)
!132 = !DILocation(line: 49, column: 14, scope: !19)
!133 = !DILocation(line: 50, column: 8, scope: !19)
!134 = !DILocation(line: 50, column: 15, scope: !19)
!135 = !DILocation(line: 52, column: 5, scope: !19)
!136 = distinct !{!136, !137, !"polly.alias.scope."}
!137 = distinct !{!137, !"polly.alias.scope.domain"}
!138 = !{!139, !140, !141}
!139 = distinct !{!139, !137, !"polly.alias.scope."}
!140 = distinct !{!140, !137, !"polly.alias.scope.call"}
!141 = distinct !{!141, !137, !"polly.alias.scope."}
!142 = !{!136, !140, !141}
!143 = !{!139, !136, !141}
!144 = distinct !{!144, !145, !"polly.alias.scope.call"}
!145 = distinct !{!145, !"polly.alias.scope.domain"}
!146 = !{!147, !148}
!147 = distinct !{!147, !145, !"polly.alias.scope..unr"}
!148 = distinct !{!148, !145, !"polly.alias.scope.indvars.iv.us.unr"}
!149 = !DILocalVariable(name: "argc", arg: 1, scope: !22, file: !1, line: 85, type: !5)
!150 = !DILocation(line: 85, column: 14, scope: !22)
!151 = !DILocalVariable(name: "args", arg: 2, scope: !22, file: !1, line: 85, type: !25)
!152 = !DILocation(line: 85, column: 27, scope: !22)
!153 = !DILocalVariable(name: "A", scope: !22, file: !1, line: 94, type: !18)
!154 = !DILocation(line: 94, column: 26, scope: !22)
!155 = !DILocalVariable(name: "B", scope: !22, file: !1, line: 95, type: !18)
!156 = !DILocation(line: 95, column: 26, scope: !22)
!157 = !DILocalVariable(name: "C", scope: !22, file: !1, line: 96, type: !18)
!158 = !DILocation(line: 96, column: 26, scope: !22)
!159 = !DILocation(line: 99, column: 19, scope: !22)
!160 = !DILocation(line: 100, column: 32, scope: !22)
!161 = !DILocation(line: 100, column: 15, scope: !22)
!162 = !DILocalVariable(name: "max", scope: !22, file: !1, line: 100, type: !5)
!163 = !DILocation(line: 100, column: 9, scope: !22)
!164 = !DILocalVariable(name: "width", scope: !22, file: !1, line: 97, type: !5)
!165 = !DILocation(line: 97, column: 9, scope: !22)
!166 = !DILocalVariable(name: "height", scope: !22, file: !1, line: 97, type: !5)
!167 = !DILocation(line: 97, column: 16, scope: !22)
!168 = !DILocation(line: 11, column: 31, scope: !15, inlinedAt: !169)
!169 = distinct !DILocation(line: 105, column: 7, scope: !22)
!170 = !DILocation(line: 11, column: 42, scope: !15, inlinedAt: !169)
!171 = !DILocation(line: 11, column: 53, scope: !15, inlinedAt: !169)
!172 = !DILocation(line: 15, column: 49, scope: !15, inlinedAt: !169)
!173 = !DILocation(line: 15, column: 55, scope: !15, inlinedAt: !169)
!174 = !DILocation(line: 15, column: 36, scope: !15, inlinedAt: !169)
!175 = !DILocation(line: 13, column: 9, scope: !15, inlinedAt: !169)
!176 = !DILocation(line: 16, column: 14, scope: !45, inlinedAt: !169)
!177 = !DILocation(line: 16, column: 5, scope: !45, inlinedAt: !169)
!178 = !DILocation(line: 105, column: 7, scope: !22)
!179 = !DILocation(line: 21, column: 44, scope: !15, inlinedAt: !169)
!180 = !DILocation(line: 21, column: 35, scope: !15, inlinedAt: !169)
!181 = !DILocation(line: 21, column: 26, scope: !15, inlinedAt: !169)
!182 = !DILocation(line: 22, column: 18, scope: !15, inlinedAt: !169)
!183 = !DILocation(line: 23, column: 13, scope: !15, inlinedAt: !169)
!184 = !DILocation(line: 23, column: 19, scope: !15, inlinedAt: !169)
!185 = !DILocation(line: 24, column: 13, scope: !15, inlinedAt: !169)
!186 = !DILocation(line: 24, column: 20, scope: !15, inlinedAt: !169)
!187 = !DILocation(line: 11, column: 31, scope: !15, inlinedAt: !188)
!188 = distinct !DILocation(line: 106, column: 7, scope: !22)
!189 = !DILocation(line: 11, column: 42, scope: !15, inlinedAt: !188)
!190 = !DILocation(line: 11, column: 53, scope: !15, inlinedAt: !188)
!191 = !DILocation(line: 15, column: 36, scope: !15, inlinedAt: !188)
!192 = !DILocation(line: 13, column: 9, scope: !15, inlinedAt: !188)
!193 = !DILocation(line: 106, column: 7, scope: !22)
!194 = !DILocation(line: 16, column: 5, scope: !45, inlinedAt: !188)
!195 = !DILocation(line: 21, column: 44, scope: !15, inlinedAt: !188)
!196 = !DILocation(line: 21, column: 35, scope: !15, inlinedAt: !188)
!197 = !DILocation(line: 21, column: 26, scope: !15, inlinedAt: !188)
!198 = !DILocation(line: 22, column: 18, scope: !15, inlinedAt: !188)
!199 = !DILocation(line: 23, column: 13, scope: !15, inlinedAt: !188)
!200 = !DILocation(line: 23, column: 19, scope: !15, inlinedAt: !188)
!201 = !DILocation(line: 24, column: 13, scope: !15, inlinedAt: !188)
!202 = !DILocation(line: 24, column: 20, scope: !15, inlinedAt: !188)
!203 = !DILocation(line: 108, column: 7, scope: !22)
!204 = !DILocation(line: 109, column: 75, scope: !22)
!205 = !DILocation(line: 109, column: 86, scope: !22)
!206 = !DILocation(line: 109, column: 90, scope: !22)
!207 = !DILocation(line: 109, column: 5, scope: !22)
!208 = !DILocation(line: 111, column: 5, scope: !22)
!209 = distinct !{!209, !210, !"polly.alias.scope.call"}
!210 = distinct !{!210, !"polly.alias.scope.domain"}
!211 = distinct !{!211}
!212 = distinct !{!212, !213, !"polly.alias.scope.call"}
!213 = distinct !{!213, !"polly.alias.scope.domain"}
!214 = !{!215, !216}
!215 = distinct !{!215, !213, !"polly.alias.scope."}
!216 = distinct !{!216, !213, !"polly.alias.scope."}
!217 = !{!215, !212}
!218 = !{!216, !212}
!219 = distinct !{!219, !98, !99}
!220 = distinct !{!220, !98, !99}
