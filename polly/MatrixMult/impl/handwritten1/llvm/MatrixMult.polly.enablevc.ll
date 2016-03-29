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
  %xtraiter195 = and i32 %height, 7, !dbg !77
  %lcmp.mod196 = icmp eq i32 %xtraiter195, 0, !dbg !77
  br i1 %lcmp.mod196, label %for.body7.preheader.us.preheader.split, label %for.body7.preheader.us.prol.preheader, !dbg !77

for.body7.preheader.us.prol.preheader:            ; preds = %for.body7.preheader.us.preheader
  br label %for.body7.preheader.us.prol, !dbg !77

for.body7.preheader.us.prol:                      ; preds = %for.body7.preheader.us.prol.preheader, %for.body7.preheader.us.prol
  %indvars.iv91.us.prol = phi i64 [ %indvars.iv.next92.us.prol, %for.body7.preheader.us.prol ], [ 0, %for.body7.preheader.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body7.preheader.us.prol ], [ %xtraiter195, %for.body7.preheader.us.prol.preheader ]
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
  %exitcond187.7 = icmp eq i32 %lftr.wideiv.7, %height, !dbg !76
  br i1 %exitcond187.7, label %polly.start.loopexit.unr-lcssa, label %for.body7.preheader.us, !dbg !76

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
  %pexp.p_div_q = lshr i64 %conv, 2
  %17 = add nsw i64 %pexp.p_div_q, -1
  %18 = zext i32 %width to i64
  %pexp.pdiv_r = and i64 %18, 3
  %polly.loop_guard135 = icmp eq i64 %pexp.pdiv_r, 0
  %19 = sub nsw i64 %conv, %pexp.pdiv_r
  %20 = add nsw i64 %pexp.pdiv_r, -1
  %xtraiter193 = and i64 %18, 1
  %lcmp.mod194 = icmp eq i64 %xtraiter193, 0
  %21 = shl nsw i64 %19, 3
  %22 = icmp eq i64 %20, 0
  %xtraiter = and i64 %18, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %23 = shl nsw i64 %19, 3
  %24 = icmp eq i64 %20, 0
  br label %polly.loop_header

polly.exiting.loopexit:                           ; preds = %polly.loop_exit100
  br label %polly.exiting, !dbg !82

polly.exiting:                                    ; preds = %polly.exiting.loopexit, %polly.start
  %call36 = tail call noalias i8* @malloc(i64 16) #5, !dbg !82
  %25 = bitcast i8* %call36 to %struct.Matrix*, !dbg !83
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %25, i64 0, metadata !24, metadata !57), !dbg !84
  %26 = bitcast i8* %call36 to i8**, !dbg !85
  store i8* %call, i8** %26, align 8, !dbg !85, !tbaa !86
  %width38 = getelementptr inbounds i8, i8* %call36, i64 8, !dbg !92
  %27 = bitcast i8* %width38 to i32*, !dbg !92
  store i32 %width, i32* %27, align 8, !dbg !93, !tbaa !94
  %height39 = getelementptr inbounds i8, i8* %call36, i64 12, !dbg !95
  %28 = bitcast i8* %height39 to i32*, !dbg !95
  store i32 %height, i32* %28, align 4, !dbg !96, !tbaa !97
  ret %struct.Matrix* %25, !dbg !98

polly.loop_header:                                ; preds = %polly.loop_exit100, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit100 ], [ 0, %polly.loop_header.preheader ]
  br i1 %polly.loop_guard101, label %polly.loop_header98.preheader, label %polly.loop_exit100

polly.loop_header98.preheader:                    ; preds = %polly.loop_header
  %29 = shl nsw i64 %polly.indvar, 5
  %30 = sub nsw i64 %conv1, %29
  %31 = add nsw i64 %30, -1
  %32 = icmp sgt i64 %31, 31
  %33 = select i1 %32, i64 31, i64 %31
  %polly.loop_guard110 = icmp sgt i64 %33, -1
  %polly.adjust_ub113 = add i64 %33, -1
  br label %polly.loop_header98

polly.loop_exit100.loopexit:                      ; preds = %polly.loop_exit109
  br label %polly.loop_exit100

polly.loop_exit100:                               ; preds = %polly.loop_exit100.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond185 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond185, label %polly.exiting.loopexit, label %polly.loop_header, !llvm.loop !99

polly.loop_header98:                              ; preds = %polly.loop_exit109, %polly.loop_header98.preheader
  %polly.indvar102 = phi i64 [ %polly.indvar_next103, %polly.loop_exit109 ], [ 0, %polly.loop_header98.preheader ]
  br i1 %polly.loop_guard110, label %polly.loop_header107.preheader, label %polly.loop_exit109

polly.loop_header107.preheader:                   ; preds = %polly.loop_header98
  %34 = mul nsw i64 %polly.indvar102, -8
  %35 = add nsw i64 %17, %34
  %36 = icmp sgt i64 %35, 7
  %37 = select i1 %36, i64 7, i64 %35
  %polly.loop_guard119 = icmp sgt i64 %37, -1
  %38 = shl i64 %polly.indvar102, 5
  %39 = or i64 %38, 31
  %40 = icmp slt i64 %39, %conv
  %polly.adjust_ub122 = add i64 %37, -1
  br i1 %polly.loop_guard119, label %polly.loop_preheader125.preheader.us.preheader, label %polly.loop_header107.preheader.split

polly.loop_preheader125.preheader.us.preheader:   ; preds = %polly.loop_header107.preheader
  %brmerge = or i1 %40, %polly.loop_guard135
  br label %polly.loop_preheader125.preheader.us

polly.loop_preheader125.us:                       ; preds = %polly.loop_preheader125.preheader.us, %polly.loop_preheader125.us
  %polly.indvar120.us = phi i64 [ %polly.indvar_next121.us, %polly.loop_preheader125.us ], [ 0, %polly.loop_preheader125.preheader.us ]
  %41 = shl i64 %polly.indvar120.us, 2
  %42 = add nuw nsw i64 %41, %38
  %43 = shl i64 %42, 3
  %44 = add i64 %43, %61
  %scevgep.us = getelementptr i8, i8* %call, i64 %44
  %scevgep130.us = bitcast i8* %scevgep.us to i64*
  %_p_scalar_.us = load i64, i64* %scevgep130.us, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !102
  %p_add25.us = add nsw i64 %_p_scalar_.us, %60, !dbg !104
  store i64 %p_add25.us, i64* %scevgep130.us, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !102
  %45 = shl i64 %42, 3
  %46 = or i64 %45, 8
  %47 = add i64 %46, %61
  %scevgep.us.1 = getelementptr i8, i8* %call, i64 %47
  %scevgep130.us.1 = bitcast i8* %scevgep.us.1 to i64*
  %_p_scalar_.us.1 = load i64, i64* %scevgep130.us.1, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !102
  %p_add25.us.1 = add nsw i64 %_p_scalar_.us.1, %60, !dbg !104
  store i64 %p_add25.us.1, i64* %scevgep130.us.1, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !102
  %48 = shl i64 %42, 3
  %49 = or i64 %48, 16
  %50 = add i64 %49, %61
  %scevgep.us.2 = getelementptr i8, i8* %call, i64 %50
  %scevgep130.us.2 = bitcast i8* %scevgep.us.2 to i64*
  %_p_scalar_.us.2 = load i64, i64* %scevgep130.us.2, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !102
  %p_add25.us.2 = add nsw i64 %_p_scalar_.us.2, %60, !dbg !104
  store i64 %p_add25.us.2, i64* %scevgep130.us.2, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !102
  %51 = shl i64 %42, 3
  %52 = or i64 %51, 24
  %53 = add i64 %52, %61
  %scevgep.us.3 = getelementptr i8, i8* %call, i64 %53
  %scevgep130.us.3 = bitcast i8* %scevgep.us.3 to i64*
  %_p_scalar_.us.3 = load i64, i64* %scevgep130.us.3, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !102
  %p_add25.us.3 = add nsw i64 %_p_scalar_.us.3, %60, !dbg !104
  store i64 %p_add25.us.3, i64* %scevgep130.us.3, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !102
  %polly.indvar_next121.us = add nuw nsw i64 %polly.indvar120.us, 1
  %polly.loop_cond123.us = icmp sgt i64 %polly.indvar120.us, %polly.adjust_ub122
  br i1 %polly.loop_cond123.us, label %polly.cond.loopexit.us, label %polly.loop_preheader125.us

polly.loop_header132.us:                          ; preds = %polly.loop_header132.us, %polly.loop_header132.us.preheader.split.split
  %polly.indvar136.us = phi i64 [ %polly.indvar136.us.unr, %polly.loop_header132.us.preheader.split.split ], [ %polly.indvar_next137.us.1, %polly.loop_header132.us ]
  %54 = add nsw i64 %19, %polly.indvar136.us
  %55 = shl i64 %54, 3
  %56 = add i64 %55, %61
  %scevgep142.us = getelementptr i8, i8* %call, i64 %56
  %scevgep142143.us = bitcast i8* %scevgep142.us to i64*
  %_p_scalar_144.us = load i64, i64* %scevgep142143.us, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  %p_add25145.us = add nsw i64 %_p_scalar_144.us, %60, !dbg !104
  store i64 %p_add25145.us, i64* %scevgep142143.us, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  %polly.indvar_next137.us = add nuw nsw i64 %polly.indvar136.us, 1
  %57 = add nsw i64 %19, %polly.indvar_next137.us
  %58 = shl i64 %57, 3
  %59 = add i64 %58, %61
  %scevgep142.us.1 = getelementptr i8, i8* %call, i64 %59
  %scevgep142143.us.1 = bitcast i8* %scevgep142.us.1 to i64*
  %_p_scalar_144.us.1 = load i64, i64* %scevgep142143.us.1, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  %p_add25145.us.1 = add nsw i64 %_p_scalar_144.us.1, %60, !dbg !104
  store i64 %p_add25145.us.1, i64* %scevgep142143.us.1, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  %polly.indvar_next137.us.1 = add nsw i64 %polly.indvar136.us, 2
  %exitcond183.1 = icmp eq i64 %polly.indvar_next137.us.1, %pexp.pdiv_r
  br i1 %exitcond183.1, label %polly.merge.us.loopexit.unr-lcssa, label %polly.loop_header132.us, !llvm.loop !112

polly.merge.us.loopexit.unr-lcssa:                ; preds = %polly.loop_header132.us
  br label %polly.merge.us.loopexit

polly.merge.us.loopexit:                          ; preds = %polly.loop_header132.us.preheader.split, %polly.merge.us.loopexit.unr-lcssa
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next112.us = add nuw nsw i64 %polly.indvar111.us, 1
  %polly.loop_cond114.us = icmp sgt i64 %polly.indvar111.us, %polly.adjust_ub113
  br i1 %polly.loop_cond114.us, label %polly.loop_exit109.loopexit, label %polly.loop_preheader125.preheader.us

polly.loop_preheader125.preheader.us:             ; preds = %polly.loop_preheader125.preheader.us.preheader, %polly.merge.us
  %polly.indvar111.us = phi i64 [ %polly.indvar_next112.us, %polly.merge.us ], [ 0, %polly.loop_preheader125.preheader.us.preheader ]
  %60 = add nuw nsw i64 %polly.indvar111.us, %29
  %61 = mul i64 %60, %mul
  br label %polly.loop_preheader125.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_preheader125.us
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header132.us.preheader

polly.loop_header132.us.preheader:                ; preds = %polly.cond.loopexit.us
  br i1 %lcmp.mod194, label %polly.loop_header132.us.preheader.split, label %polly.loop_header132.us.prol

polly.loop_header132.us.prol:                     ; preds = %polly.loop_header132.us.preheader
  %62 = add i64 %21, %61
  %scevgep142.us.prol = getelementptr i8, i8* %call, i64 %62
  %scevgep142143.us.prol = bitcast i8* %scevgep142.us.prol to i64*
  %_p_scalar_144.us.prol = load i64, i64* %scevgep142143.us.prol, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  %p_add25145.us.prol = add nsw i64 %_p_scalar_144.us.prol, %60, !dbg !104
  store i64 %p_add25145.us.prol, i64* %scevgep142143.us.prol, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  br label %polly.loop_header132.us.preheader.split

polly.loop_header132.us.preheader.split:          ; preds = %polly.loop_header132.us.preheader, %polly.loop_header132.us.prol
  %polly.indvar136.us.unr = phi i64 [ 0, %polly.loop_header132.us.preheader ], [ 1, %polly.loop_header132.us.prol ]
  br i1 %22, label %polly.merge.us.loopexit, label %polly.loop_header132.us.preheader.split.split

polly.loop_header132.us.preheader.split.split:    ; preds = %polly.loop_header132.us.preheader.split
  br label %polly.loop_header132.us

polly.loop_header107.preheader.split:             ; preds = %polly.loop_header107.preheader
  br i1 %40, label %polly.loop_exit109, label %polly.then.preheader

polly.then.preheader:                             ; preds = %polly.loop_header107.preheader.split
  br label %polly.then

polly.loop_exit109.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit109

polly.loop_exit109.loopexit192:                   ; preds = %polly.merge
  br label %polly.loop_exit109

polly.loop_exit109:                               ; preds = %polly.loop_exit109.loopexit192, %polly.loop_exit109.loopexit, %polly.loop_header107.preheader.split, %polly.loop_header98
  %polly.indvar_next103 = add nuw nsw i64 %polly.indvar102, 1
  %exitcond184 = icmp eq i64 %polly.indvar102, %polly.fdiv_q.shr96
  br i1 %exitcond184, label %polly.loop_exit100.loopexit, label %polly.loop_header98

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header132
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.loop_header132.preheader.split, %polly.merge.loopexit.unr-lcssa
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.then
  %polly.indvar_next112 = add nuw nsw i64 %polly.indvar111, 1
  %polly.loop_cond114 = icmp sgt i64 %polly.indvar111, %polly.adjust_ub113
  br i1 %polly.loop_cond114, label %polly.loop_exit109.loopexit192, label %polly.then

polly.then:                                       ; preds = %polly.then.preheader, %polly.merge
  %polly.indvar111 = phi i64 [ %polly.indvar_next112, %polly.merge ], [ 0, %polly.then.preheader ]
  br i1 %polly.loop_guard135, label %polly.merge, label %polly.loop_header132.preheader

polly.loop_header132.preheader:                   ; preds = %polly.then
  %63 = add nuw nsw i64 %polly.indvar111, %29
  %64 = mul i64 %63, %mul
  br i1 %lcmp.mod, label %polly.loop_header132.preheader.split, label %polly.loop_header132.prol

polly.loop_header132.prol:                        ; preds = %polly.loop_header132.preheader
  %65 = add i64 %23, %64
  %scevgep142.prol = getelementptr i8, i8* %call, i64 %65
  %scevgep142143.prol = bitcast i8* %scevgep142.prol to i64*
  %_p_scalar_144.prol = load i64, i64* %scevgep142143.prol, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  %p_add25145.prol = add nsw i64 %_p_scalar_144.prol, %63, !dbg !104
  store i64 %p_add25145.prol, i64* %scevgep142143.prol, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  br label %polly.loop_header132.preheader.split

polly.loop_header132.preheader.split:             ; preds = %polly.loop_header132.preheader, %polly.loop_header132.prol
  %polly.indvar136.unr = phi i64 [ 0, %polly.loop_header132.preheader ], [ 1, %polly.loop_header132.prol ]
  br i1 %24, label %polly.merge.loopexit, label %polly.loop_header132.preheader.split.split

polly.loop_header132.preheader.split.split:       ; preds = %polly.loop_header132.preheader.split
  br label %polly.loop_header132

polly.loop_header132:                             ; preds = %polly.loop_header132, %polly.loop_header132.preheader.split.split
  %polly.indvar136 = phi i64 [ %polly.indvar136.unr, %polly.loop_header132.preheader.split.split ], [ %polly.indvar_next137.1, %polly.loop_header132 ]
  %66 = add nsw i64 %19, %polly.indvar136
  %67 = shl i64 %66, 3
  %68 = add i64 %67, %64
  %scevgep142 = getelementptr i8, i8* %call, i64 %68
  %scevgep142143 = bitcast i8* %scevgep142 to i64*
  %_p_scalar_144 = load i64, i64* %scevgep142143, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  %p_add25145 = add nsw i64 %_p_scalar_144, %63, !dbg !104
  store i64 %p_add25145, i64* %scevgep142143, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  %polly.indvar_next137 = add nuw nsw i64 %polly.indvar136, 1
  %69 = add nsw i64 %19, %polly.indvar_next137
  %70 = shl i64 %69, 3
  %71 = add i64 %70, %64
  %scevgep142.1 = getelementptr i8, i8* %call, i64 %71
  %scevgep142143.1 = bitcast i8* %scevgep142.1 to i64*
  %_p_scalar_144.1 = load i64, i64* %scevgep142143.1, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  %p_add25145.1 = add nsw i64 %_p_scalar_144.1, %63, !dbg !104
  store i64 %p_add25145.1, i64* %scevgep142143.1, align 8, !alias.scope !100, !noalias !2, !llvm.mem.parallel_loop_access !111
  %polly.indvar_next137.1 = add nsw i64 %polly.indvar136, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next137.1, %pexp.pdiv_r
  br i1 %exitcond.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header132, !llvm.loop !112
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
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !29, metadata !57), !dbg !113
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !30, metadata !57), !dbg !114
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !115
  %0 = load i32, i32* %width1, align 8, !dbg !115, !tbaa !94
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !34, metadata !57), !dbg !116
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !117
  %1 = load i32, i32* %height2, align 4, !dbg !117, !tbaa !97
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !35, metadata !57), !dbg !118
  %data3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !119
  %2 = load i64*, i64** %data3, align 8, !dbg !119, !tbaa !86
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !36, metadata !57), !dbg !120
  %data4 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !121
  %3 = load i64*, i64** %data4, align 8, !dbg !121, !tbaa !86
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !38, metadata !57), !dbg !122
  %conv = sext i32 %0 to i64, !dbg !123
  %mul = shl nsw i64 %conv, 3, !dbg !124
  %conv5 = sext i32 %1 to i64, !dbg !125
  %mul6 = mul i64 %mul, %conv5, !dbg !126
  %call = tail call noalias i8* @malloc(i64 %mul6) #5, !dbg !127
  %4 = bitcast i8* %call to i64*, !dbg !128
  tail call void @llvm.dbg.value(metadata i64* %4, i64 0, metadata !39, metadata !57), !dbg !129
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !31, metadata !57), !dbg !130
  %cmp89 = icmp sgt i32 %0, 0, !dbg !131
  br i1 %cmp89, label %for.cond8.preheader.lr.ph, label %for.end40, !dbg !135

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
  %cmp986 = icmp sgt i32 %1, 0, !dbg !136
  br i1 %cmp986, label %for.body11.preheader.us.preheader, label %for.end40, !dbg !141

for.body11.preheader.us.preheader:                ; preds = %for.cond8.preheader.preheader
  %xtraiter390 = and i32 %0, 1, !dbg !142
  %lcmp.mod391 = icmp eq i32 %xtraiter390, 0, !dbg !142
  %15 = icmp eq i32 %0, 1, !dbg !142
  br label %for.body11.preheader.us, !dbg !147

for.body11.us:                                    ; preds = %for.body11.preheader.us, %for.inc35.us
  %indvars.iv95.us = phi i64 [ %indvars.iv.next96.us, %for.inc35.us ], [ 0, %for.body11.preheader.us ]
  %16 = add nsw i64 %indvars.iv95.us, %30, !dbg !148
  %arrayidx.us = getelementptr inbounds i64, i64* %4, i64 %16, !dbg !149
  store i64 0, i64* %arrayidx.us, align 8, !dbg !150, !tbaa !151
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !57), !dbg !153
  br i1 %lcmp.mod391, label %for.body11.us.split, label %for.body16.us.prol, !dbg !142

for.body16.us.prol:                               ; preds = %for.body11.us
  %17 = load i64, i64* %arrayidx24.us.prol, align 8, !dbg !154, !tbaa !151
  %arrayidx28.us.prol = getelementptr inbounds i64, i64* %3, i64 %indvars.iv95.us, !dbg !155
  %18 = load i64, i64* %arrayidx28.us.prol, align 8, !dbg !155, !tbaa !151
  %mul29.us.prol = mul nsw i64 %18, %17, !dbg !156
  store i64 %mul29.us.prol, i64* %arrayidx.us, align 8, !dbg !157, !tbaa !151
  br label %for.body11.us.split, !dbg !142

for.body11.us.split:                              ; preds = %for.body11.us, %for.body16.us.prol
  %.unr = phi i64 [ 0, %for.body11.us ], [ %mul29.us.prol, %for.body16.us.prol ]
  %indvars.iv.us.unr = phi i64 [ 0, %for.body11.us ], [ 1, %for.body16.us.prol ]
  br i1 %15, label %for.inc35.us, label %for.body11.us.split.split, !dbg !142

for.body11.us.split.split:                        ; preds = %for.body11.us.split
  br label %for.body16.us, !dbg !142

for.body16.us:                                    ; preds = %for.body16.us, %for.body11.us.split.split
  %19 = phi i64 [ %.unr, %for.body11.us.split.split ], [ %add30.us.1, %for.body16.us ], !dbg !158
  %indvars.iv.us = phi i64 [ %indvars.iv.us.unr, %for.body11.us.split.split ], [ %indvars.iv.next.us.1, %for.body16.us ]
  %20 = add nsw i64 %indvars.iv.us, %30, !dbg !159
  %arrayidx24.us = getelementptr inbounds i64, i64* %2, i64 %20, !dbg !154
  %21 = load i64, i64* %arrayidx24.us, align 8, !dbg !154, !tbaa !151
  %22 = mul nsw i64 %indvars.iv.us, %conv, !dbg !160
  %23 = add nsw i64 %22, %indvars.iv95.us, !dbg !161
  %arrayidx28.us = getelementptr inbounds i64, i64* %3, i64 %23, !dbg !155
  %24 = load i64, i64* %arrayidx28.us, align 8, !dbg !155, !tbaa !151
  %mul29.us = mul nsw i64 %24, %21, !dbg !156
  %add30.us = add nsw i64 %mul29.us, %19, !dbg !162
  store i64 %add30.us, i64* %arrayidx.us, align 8, !dbg !157, !tbaa !151
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1, !dbg !142
  %25 = add nsw i64 %indvars.iv.next.us, %30, !dbg !159
  %arrayidx24.us.1 = getelementptr inbounds i64, i64* %2, i64 %25, !dbg !154
  %26 = load i64, i64* %arrayidx24.us.1, align 8, !dbg !154, !tbaa !151
  %27 = mul nsw i64 %indvars.iv.next.us, %conv, !dbg !160
  %28 = add nsw i64 %27, %indvars.iv95.us, !dbg !161
  %arrayidx28.us.1 = getelementptr inbounds i64, i64* %3, i64 %28, !dbg !155
  %29 = load i64, i64* %arrayidx28.us.1, align 8, !dbg !155, !tbaa !151
  %mul29.us.1 = mul nsw i64 %29, %26, !dbg !156
  %add30.us.1 = add nsw i64 %mul29.us.1, %add30.us, !dbg !162
  store i64 %add30.us.1, i64* %arrayidx.us, align 8, !dbg !157, !tbaa !151
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2, !dbg !142
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.us.1 to i32, !dbg !142
  %exitcond370.1 = icmp eq i32 %lftr.wideiv.1, %0, !dbg !142
  br i1 %exitcond370.1, label %for.inc35.us.unr-lcssa, label %for.body16.us, !dbg !142

for.inc35.us.unr-lcssa:                           ; preds = %for.body16.us
  br label %for.inc35.us, !dbg !141

for.inc35.us:                                     ; preds = %for.body11.us.split, %for.inc35.us.unr-lcssa
  %indvars.iv.next96.us = add nuw nsw i64 %indvars.iv95.us, 1, !dbg !141
  %lftr.wideiv371 = trunc i64 %indvars.iv.next96.us to i32, !dbg !141
  %exitcond372 = icmp eq i32 %lftr.wideiv371, %1, !dbg !141
  br i1 %exitcond372, label %for.inc38.loopexit.us, label %for.body11.us, !dbg !141

for.body11.preheader.us:                          ; preds = %for.body11.preheader.us.preheader, %for.inc38.loopexit.us
  %indvars.iv100.us = phi i64 [ %indvars.iv.next101.us, %for.inc38.loopexit.us ], [ 0, %for.body11.preheader.us.preheader ]
  %30 = mul nsw i64 %indvars.iv100.us, %conv, !dbg !147
  %arrayidx24.us.prol = getelementptr inbounds i64, i64* %2, i64 %30, !dbg !154
  br label %for.body11.us, !dbg !147

for.inc38.loopexit.us:                            ; preds = %for.inc35.us
  %indvars.iv.next101.us = add nuw nsw i64 %indvars.iv100.us, 1, !dbg !135
  %lftr.wideiv374 = trunc i64 %indvars.iv.next101.us to i32, !dbg !135
  %exitcond375 = icmp eq i32 %lftr.wideiv374, %0, !dbg !135
  br i1 %exitcond375, label %for.end40.loopexit387, label %for.body11.preheader.us, !dbg !135

for.end40.loopexit:                               ; preds = %polly.loop_exit189
  br label %for.end40, !dbg !163

for.end40.loopexit387:                            ; preds = %for.inc38.loopexit.us
  br label %for.end40, !dbg !163

for.end40:                                        ; preds = %for.end40.loopexit387, %for.end40.loopexit, %for.cond8.preheader.preheader, %polly.start, %entry
  %call41 = tail call noalias i8* @malloc(i64 16) #5, !dbg !163
  %31 = bitcast i8* %call41 to %struct.Matrix*, !dbg !165
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %31, i64 0, metadata !40, metadata !57), !dbg !166
  %width42 = getelementptr inbounds i8, i8* %call41, i64 8, !dbg !167
  %32 = bitcast i8* %width42 to i32*, !dbg !167
  store i32 %0, i32* %32, align 8, !dbg !168, !tbaa !94
  %height43 = getelementptr inbounds i8, i8* %call41, i64 12, !dbg !169
  %33 = bitcast i8* %height43 to i32*, !dbg !169
  store i32 %1, i32* %33, align 4, !dbg !170, !tbaa !97
  %34 = bitcast i8* %call41 to i8**, !dbg !171
  store i8* %call, i8** %34, align 8, !dbg !171, !tbaa !86
  ret %struct.Matrix* %31, !dbg !172

polly.start:                                      ; preds = %for.cond8.preheader.lr.ph
  %polly.fdiv_q.shr = ashr i64 %6, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %for.end40

polly.loop_header.preheader:                      ; preds = %polly.start
  %35 = add nsw i64 %conv5, -1
  %polly.fdiv_q.shr126 = ashr i64 %35, 5
  %polly.loop_guard131 = icmp sgt i64 %polly.fdiv_q.shr126, -1
  %pexp.p_div_q = lshr i64 %conv5, 2
  %36 = add nsw i64 %pexp.p_div_q, -1
  %37 = zext i32 %1 to i64
  %pexp.pdiv_r = and i64 %37, 3
  %polly.loop_guard165 = icmp eq i64 %pexp.pdiv_r, 0
  %38 = shl nsw i64 %conv, 8
  %39 = shl nsw i64 %conv5, 3
  %40 = shl nuw nsw i64 %pexp.pdiv_r, 3
  %41 = sub nsw i64 %39, %40
  %42 = add nsw i64 %polly.fdiv_q.shr126, 1
  %43 = add nsw i64 %polly.fdiv_q.shr, 1
  br label %polly.loop_header

polly.loop_header177.preheader:                   ; preds = %polly.loop_exit130
  %pexp.p_div_q195 = lshr i64 %6, 5
  %pexp.p_div_q221 = lshr i64 %conv, 2
  %44 = add nsw i64 %pexp.p_div_q221, -1
  %45 = zext i32 %0 to i64
  %pexp.pdiv_r247 = and i64 %45, 3
  %polly.loop_guard252 = icmp eq i64 %pexp.pdiv_r247, 0
  %46 = sub nsw i64 %conv, %pexp.pdiv_r247
  %47 = add nsw i64 %pexp.pdiv_r247, -1
  %xtraiter388 = and i64 %45, 1
  %lcmp.mod389 = icmp eq i64 %xtraiter388, 0
  %48 = mul i64 %46, %conv
  %49 = icmp eq i64 %47, 0
  %xtraiter = and i64 %45, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %50 = mul i64 %46, %conv
  %51 = icmp eq i64 %47, 0
  br label %polly.loop_header177

polly.loop_header:                                ; preds = %polly.loop_exit130, %polly.loop_header.preheader
  %polly.indvar = phi i64 [ %polly.indvar_next, %polly.loop_exit130 ], [ 0, %polly.loop_header.preheader ]
  %52 = mul i64 %38, %polly.indvar
  %53 = add i64 %41, %52
  br i1 %polly.loop_guard131, label %polly.loop_header128.preheader, label %polly.loop_exit130

polly.loop_header128.preheader:                   ; preds = %polly.loop_header
  %54 = shl nsw i64 %polly.indvar, 5
  %55 = sub nsw i64 %conv, %54
  %56 = add nsw i64 %55, -1
  %57 = icmp sgt i64 %56, 31
  %58 = select i1 %57, i64 31, i64 %56
  %polly.loop_guard140 = icmp sgt i64 %58, -1
  %polly.adjust_ub143 = add i64 %58, -1
  br label %polly.loop_header128

polly.loop_exit130.loopexit:                      ; preds = %polly.loop_exit139
  br label %polly.loop_exit130

polly.loop_exit130:                               ; preds = %polly.loop_exit130.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond369 = icmp eq i64 %polly.indvar_next, %43
  br i1 %exitcond369, label %polly.loop_header177.preheader, label %polly.loop_header, !llvm.loop !173

polly.loop_header128:                             ; preds = %polly.loop_exit139, %polly.loop_header128.preheader
  %polly.indvar132 = phi i64 [ %polly.indvar_next133, %polly.loop_exit139 ], [ 0, %polly.loop_header128.preheader ]
  %59 = shl i64 %polly.indvar132, 8
  %60 = add i64 %52, %59
  %61 = shl i64 %polly.indvar132, 3
  %62 = sub i64 %61, %pexp.p_div_q
  %63 = icmp sgt i64 %62, -8
  %smax = select i1 %63, i64 %62, i64 -8
  %64 = mul i64 %smax, -32
  br i1 %polly.loop_guard140, label %polly.loop_header137.preheader, label %polly.loop_exit139

polly.loop_header137.preheader:                   ; preds = %polly.loop_header128
  %65 = mul nsw i64 %polly.indvar132, -8
  %66 = add nsw i64 %36, %65
  %polly.loop_guard149378 = icmp sgt i64 %66, -1
  %67 = shl nsw i64 %polly.indvar132, 5
  %68 = or i64 %67, 31
  %69 = icmp slt i64 %68, %conv5
  br i1 %polly.loop_guard149378, label %polly.loop_preheader155.preheader.us.preheader, label %polly.loop_header137.preheader.split

polly.loop_preheader155.preheader.us.preheader:   ; preds = %polly.loop_header137.preheader
  %brmerge = or i1 %69, %polly.loop_guard165
  br label %polly.loop_preheader155.preheader.us

polly.merge.us:                                   ; preds = %polly.stmt.for.body11171.preheader.us, %polly.loop_preheader155.preheader.us
  %polly.indvar_next142.us = add nuw nsw i64 %polly.indvar141.us, 1
  %polly.loop_cond144.us = icmp sgt i64 %polly.indvar141.us, %polly.adjust_ub143
  br i1 %polly.loop_cond144.us, label %polly.loop_exit139.loopexit, label %polly.loop_preheader155.preheader.us

polly.stmt.for.body11171.preheader.us:            ; preds = %polly.loop_preheader155.preheader.us
  %70 = add i64 %53, %71
  %scevgep367 = getelementptr i8, i8* %call, i64 %70
  call void @llvm.memset.p0i8.i64(i8* %scevgep367, i8 0, i64 %40, i32 8, i1 false)
  br label %polly.merge.us

polly.loop_preheader155.preheader.us:             ; preds = %polly.loop_preheader155.preheader.us.preheader, %polly.merge.us
  %polly.indvar141.us = phi i64 [ %polly.indvar_next142.us, %polly.merge.us ], [ 0, %polly.loop_preheader155.preheader.us.preheader ]
  %71 = mul i64 %mul, %polly.indvar141.us
  %72 = add i64 %60, %71
  %scevgep365 = getelementptr i8, i8* %call, i64 %72
  call void @llvm.memset.p0i8.i64(i8* %scevgep365, i8 0, i64 %64, i32 8, i1 false)
  br i1 %brmerge, label %polly.merge.us, label %polly.stmt.for.body11171.preheader.us

polly.loop_header137.preheader.split:             ; preds = %polly.loop_header137.preheader
  br i1 %69, label %polly.loop_exit139, label %polly.then.preheader

polly.then.preheader:                             ; preds = %polly.loop_header137.preheader.split
  br label %polly.then

polly.loop_exit139.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit139

polly.loop_exit139.loopexit386:                   ; preds = %polly.merge
  br label %polly.loop_exit139

polly.loop_exit139:                               ; preds = %polly.loop_exit139.loopexit386, %polly.loop_exit139.loopexit, %polly.loop_header137.preheader.split, %polly.loop_header128
  %polly.indvar_next133 = add nuw nsw i64 %polly.indvar132, 1
  %exitcond368 = icmp eq i64 %polly.indvar_next133, %42
  br i1 %exitcond368, label %polly.loop_exit130.loopexit, label %polly.loop_header128

polly.merge:                                      ; preds = %polly.stmt.for.body11171.preheader, %polly.then
  %polly.indvar_next142 = add nuw nsw i64 %polly.indvar141, 1
  %polly.loop_cond144 = icmp sgt i64 %polly.indvar141, %polly.adjust_ub143
  br i1 %polly.loop_cond144, label %polly.loop_exit139.loopexit386, label %polly.then

polly.then:                                       ; preds = %polly.then.preheader, %polly.merge
  %polly.indvar141 = phi i64 [ %polly.indvar_next142, %polly.merge ], [ 0, %polly.then.preheader ]
  br i1 %polly.loop_guard165, label %polly.merge, label %polly.stmt.for.body11171.preheader

polly.stmt.for.body11171.preheader:               ; preds = %polly.then
  %73 = mul i64 %mul, %polly.indvar141
  %74 = add i64 %53, %73
  %scevgep = getelementptr i8, i8* %call, i64 %74
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %40, i32 8, i1 false)
  br label %polly.merge

polly.loop_header177:                             ; preds = %polly.loop_exit189, %polly.loop_header177.preheader
  %polly.indvar181 = phi i64 [ %polly.indvar_next182, %polly.loop_exit189 ], [ 0, %polly.loop_header177.preheader ]
  br i1 %polly.loop_guard131, label %polly.loop_header187.preheader, label %polly.loop_exit189

polly.loop_header187.preheader:                   ; preds = %polly.loop_header177
  %75 = shl nsw i64 %polly.indvar181, 5
  %76 = sub nsw i64 %conv, %75
  %77 = add nsw i64 %76, -1
  %78 = icmp sgt i64 %77, 31
  %79 = select i1 %78, i64 31, i64 %77
  %polly.loop_guard207 = icmp sgt i64 %79, -1
  %polly.adjust_ub210 = add i64 %79, -1
  br label %polly.loop_header187

polly.loop_exit189.loopexit:                      ; preds = %polly.loop_exit198
  br label %polly.loop_exit189

polly.loop_exit189:                               ; preds = %polly.loop_exit189.loopexit, %polly.loop_header177
  %polly.indvar_next182 = add nuw nsw i64 %polly.indvar181, 1
  %exitcond361 = icmp eq i64 %polly.indvar_next182, %43
  br i1 %exitcond361, label %for.end40.loopexit, label %polly.loop_header177, !llvm.loop !174

polly.loop_header187:                             ; preds = %polly.loop_exit198, %polly.loop_header187.preheader
  %polly.indvar191 = phi i64 [ %polly.indvar_next192, %polly.loop_exit198 ], [ 0, %polly.loop_header187.preheader ]
  %80 = shl nsw i64 %polly.indvar191, 5
  %81 = sub nsw i64 %conv5, %80
  %82 = add nsw i64 %81, -1
  %83 = icmp sgt i64 %82, 31
  %84 = select i1 %83, i64 31, i64 %82
  %polly.loop_guard216 = icmp sgt i64 %84, -1
  %polly.adjust_ub219 = add i64 %84, -1
  br label %polly.loop_header196

polly.loop_exit198:                               ; preds = %polly.loop_exit206
  %polly.indvar_next192 = add nuw nsw i64 %polly.indvar191, 1
  %exitcond360 = icmp eq i64 %polly.indvar_next192, %42
  br i1 %exitcond360, label %polly.loop_exit189.loopexit, label %polly.loop_header187

polly.loop_header196:                             ; preds = %polly.loop_exit206, %polly.loop_header187
  %polly.indvar199 = phi i64 [ 0, %polly.loop_header187 ], [ %polly.indvar_next200, %polly.loop_exit206 ]
  br i1 %polly.loop_guard207, label %polly.loop_header204.preheader, label %polly.loop_exit206

polly.loop_header204.preheader:                   ; preds = %polly.loop_header196
  %85 = mul nsw i64 %polly.indvar199, -8
  %86 = add nsw i64 %44, %85
  %87 = icmp sgt i64 %86, 7
  %88 = select i1 %87, i64 7, i64 %86
  %polly.loop_guard226 = icmp sgt i64 %88, -1
  %89 = shl i64 %polly.indvar199, 5
  %90 = or i64 %89, 31
  %91 = icmp slt i64 %90, %conv
  %polly.adjust_ub229 = add i64 %88, -1
  %brmerge350 = or i1 %91, %polly.loop_guard252
  br label %polly.loop_header204

polly.loop_exit206.loopexit:                      ; preds = %polly.loop_exit215
  br label %polly.loop_exit206

polly.loop_exit206:                               ; preds = %polly.loop_exit206.loopexit, %polly.loop_header196
  %polly.indvar_next200 = add nuw nsw i64 %polly.indvar199, 1
  %exitcond359 = icmp eq i64 %polly.indvar199, %pexp.p_div_q195
  br i1 %exitcond359, label %polly.loop_exit198, label %polly.loop_header196

polly.loop_header204:                             ; preds = %polly.loop_header204.preheader, %polly.loop_exit215
  %polly.indvar208 = phi i64 [ %polly.indvar_next209, %polly.loop_exit215 ], [ 0, %polly.loop_header204.preheader ]
  br i1 %polly.loop_guard216, label %polly.loop_header213.preheader, label %polly.loop_exit215

polly.loop_header213.preheader:                   ; preds = %polly.loop_header204
  %92 = add nuw nsw i64 %polly.indvar208, %75
  %93 = mul i64 %92, %mul
  %94 = mul i64 %92, %conv
  br i1 %polly.loop_guard226, label %polly.loop_preheader232.preheader.us.preheader, label %polly.loop_header213.preheader.split

polly.loop_preheader232.preheader.us.preheader:   ; preds = %polly.loop_header213.preheader
  %95 = add i64 %46, %94
  %scevgep262.us.prol = getelementptr i64, i64* %2, i64 %95
  br label %polly.loop_preheader232.preheader.us

polly.loop_preheader232.us:                       ; preds = %polly.loop_preheader232.preheader.us, %polly.loop_preheader232.us
  %p_add30.lcssa272.us = phi i64 [ %p_add30.us.3, %polly.loop_preheader232.us ], [ %scevgep237238.promoted271.us, %polly.loop_preheader232.preheader.us ]
  %polly.indvar227.us = phi i64 [ %polly.indvar_next228.us, %polly.loop_preheader232.us ], [ 0, %polly.loop_preheader232.preheader.us ]
  %96 = shl i64 %polly.indvar227.us, 2
  %97 = add nuw nsw i64 %96, %89
  %98 = add i64 %97, %94
  %scevgep239.us = getelementptr i64, i64* %2, i64 %98
  %_p_scalar_240.us = load i64, i64* %scevgep239.us, align 8, !alias.scope !175, !noalias !177, !llvm.mem.parallel_loop_access !180
  %99 = mul i64 %97, %conv
  %100 = add i64 %99, %121
  %scevgep241.us = getelementptr i64, i64* %3, i64 %100
  %_p_scalar_242.us = load i64, i64* %scevgep241.us, align 8, !alias.scope !178, !noalias !182, !llvm.mem.parallel_loop_access !180
  %p_mul29.us = mul nsw i64 %_p_scalar_242.us, %_p_scalar_240.us, !dbg !156
  %p_add30.us = add nsw i64 %p_mul29.us, %p_add30.lcssa272.us, !dbg !162
  %101 = or i64 %97, 1
  %102 = add i64 %101, %94
  %scevgep239.us.1 = getelementptr i64, i64* %2, i64 %102
  %_p_scalar_240.us.1 = load i64, i64* %scevgep239.us.1, align 8, !alias.scope !175, !noalias !177, !llvm.mem.parallel_loop_access !180
  %103 = mul i64 %101, %conv
  %104 = add i64 %103, %121
  %scevgep241.us.1 = getelementptr i64, i64* %3, i64 %104
  %_p_scalar_242.us.1 = load i64, i64* %scevgep241.us.1, align 8, !alias.scope !178, !noalias !182, !llvm.mem.parallel_loop_access !180
  %p_mul29.us.1 = mul nsw i64 %_p_scalar_242.us.1, %_p_scalar_240.us.1, !dbg !156
  %p_add30.us.1 = add nsw i64 %p_mul29.us.1, %p_add30.us, !dbg !162
  %105 = or i64 %97, 2
  %106 = add i64 %105, %94
  %scevgep239.us.2 = getelementptr i64, i64* %2, i64 %106
  %_p_scalar_240.us.2 = load i64, i64* %scevgep239.us.2, align 8, !alias.scope !175, !noalias !177, !llvm.mem.parallel_loop_access !180
  %107 = mul i64 %105, %conv
  %108 = add i64 %107, %121
  %scevgep241.us.2 = getelementptr i64, i64* %3, i64 %108
  %_p_scalar_242.us.2 = load i64, i64* %scevgep241.us.2, align 8, !alias.scope !178, !noalias !182, !llvm.mem.parallel_loop_access !180
  %p_mul29.us.2 = mul nsw i64 %_p_scalar_242.us.2, %_p_scalar_240.us.2, !dbg !156
  %p_add30.us.2 = add nsw i64 %p_mul29.us.2, %p_add30.us.1, !dbg !162
  %109 = or i64 %97, 3
  %110 = add i64 %109, %94
  %scevgep239.us.3 = getelementptr i64, i64* %2, i64 %110
  %_p_scalar_240.us.3 = load i64, i64* %scevgep239.us.3, align 8, !alias.scope !175, !noalias !177, !llvm.mem.parallel_loop_access !180
  %111 = mul i64 %109, %conv
  %112 = add i64 %111, %121
  %scevgep241.us.3 = getelementptr i64, i64* %3, i64 %112
  %_p_scalar_242.us.3 = load i64, i64* %scevgep241.us.3, align 8, !alias.scope !178, !noalias !182, !llvm.mem.parallel_loop_access !180
  %p_mul29.us.3 = mul nsw i64 %_p_scalar_242.us.3, %_p_scalar_240.us.3, !dbg !156
  %p_add30.us.3 = add nsw i64 %p_mul29.us.3, %p_add30.us.2, !dbg !162
  %polly.indvar_next228.us = add nuw nsw i64 %polly.indvar227.us, 1
  %polly.loop_cond230.us = icmp sgt i64 %polly.indvar227.us, %polly.adjust_ub229
  br i1 %polly.loop_cond230.us, label %polly.cond243.loopexit.us, label %polly.loop_preheader232.us

polly.loop_header249.us:                          ; preds = %polly.loop_header249.us, %polly.loop_header249.us.preheader.split.split
  %p_add30267273.us = phi i64 [ %p_add30267273.us.unr, %polly.loop_header249.us.preheader.split.split ], [ %p_add30267.us.1, %polly.loop_header249.us ]
  %polly.indvar253.us = phi i64 [ %polly.indvar253.us.unr, %polly.loop_header249.us.preheader.split.split ], [ %polly.indvar_next254.us.1, %polly.loop_header249.us ]
  %113 = add nsw i64 %polly.indvar253.us, %46
  %114 = add i64 %113, %94
  %scevgep262.us = getelementptr i64, i64* %2, i64 %114
  %_p_scalar_263.us = load i64, i64* %scevgep262.us, align 8, !alias.scope !175, !noalias !177, !llvm.mem.parallel_loop_access !183
  %115 = mul i64 %113, %conv
  %116 = add i64 %115, %121
  %scevgep264.us = getelementptr i64, i64* %3, i64 %116
  %_p_scalar_265.us = load i64, i64* %scevgep264.us, align 8, !alias.scope !178, !noalias !182, !llvm.mem.parallel_loop_access !183
  %p_mul29266.us = mul nsw i64 %_p_scalar_265.us, %_p_scalar_263.us, !dbg !156
  %p_add30267.us = add nsw i64 %p_mul29266.us, %p_add30267273.us, !dbg !162
  %polly.indvar_next254.us = add nuw nsw i64 %polly.indvar253.us, 1
  %117 = add nsw i64 %polly.indvar_next254.us, %46
  %118 = add i64 %117, %94
  %scevgep262.us.1 = getelementptr i64, i64* %2, i64 %118
  %_p_scalar_263.us.1 = load i64, i64* %scevgep262.us.1, align 8, !alias.scope !175, !noalias !177, !llvm.mem.parallel_loop_access !183
  %119 = mul i64 %117, %conv
  %120 = add i64 %119, %121
  %scevgep264.us.1 = getelementptr i64, i64* %3, i64 %120
  %_p_scalar_265.us.1 = load i64, i64* %scevgep264.us.1, align 8, !alias.scope !178, !noalias !182, !llvm.mem.parallel_loop_access !183
  %p_mul29266.us.1 = mul nsw i64 %_p_scalar_265.us.1, %_p_scalar_263.us.1, !dbg !156
  %p_add30267.us.1 = add nsw i64 %p_mul29266.us.1, %p_add30267.us, !dbg !162
  %polly.indvar_next254.us.1 = add nsw i64 %polly.indvar253.us, 2
  %exitcond358.1 = icmp eq i64 %polly.indvar_next254.us.1, %pexp.pdiv_r247
  br i1 %exitcond358.1, label %polly.merge244.loopexit.us.unr-lcssa, label %polly.loop_header249.us, !llvm.loop !184

polly.merge244.us:                                ; preds = %polly.cond243.loopexit.us, %polly.merge244.loopexit.us
  %polly.indvar_next218.us = add nuw nsw i64 %polly.indvar217.us, 1
  %polly.loop_cond220.us = icmp sgt i64 %polly.indvar217.us, %polly.adjust_ub219
  br i1 %polly.loop_cond220.us, label %polly.loop_exit215.loopexit, label %polly.loop_preheader232.preheader.us

polly.merge244.loopexit.us.unr-lcssa:             ; preds = %polly.loop_header249.us
  %p_add30267.us.1.lcssa = phi i64 [ %p_add30267.us.1, %polly.loop_header249.us ]
  br label %polly.merge244.loopexit.us

polly.merge244.loopexit.us:                       ; preds = %polly.loop_header249.us.preheader.split, %polly.merge244.loopexit.us.unr-lcssa
  %p_add30267.us.lcssa = phi i64 [ %p_add30267.us.lcssa.unr, %polly.loop_header249.us.preheader.split ], [ %p_add30267.us.1.lcssa, %polly.merge244.loopexit.us.unr-lcssa ]
  store i64 %p_add30267.us.lcssa, i64* %scevgep237238.us, align 8, !alias.scope !179, !noalias !185
  br label %polly.merge244.us

polly.loop_preheader232.preheader.us:             ; preds = %polly.loop_preheader232.preheader.us.preheader, %polly.merge244.us
  %polly.indvar217.us = phi i64 [ %polly.indvar_next218.us, %polly.merge244.us ], [ 0, %polly.loop_preheader232.preheader.us.preheader ]
  %121 = add nuw nsw i64 %polly.indvar217.us, %80
  %122 = shl i64 %121, 3
  %123 = add i64 %122, %93
  %scevgep237.us = getelementptr i8, i8* %call, i64 %123
  %scevgep237238.us = bitcast i8* %scevgep237.us to i64*
  %scevgep237238.promoted271.us = load i64, i64* %scevgep237238.us, align 8, !alias.scope !179, !noalias !185
  br label %polly.loop_preheader232.us

polly.cond243.loopexit.us:                        ; preds = %polly.loop_preheader232.us
  %p_add30.us.3.lcssa = phi i64 [ %p_add30.us.3, %polly.loop_preheader232.us ]
  store i64 %p_add30.us.3.lcssa, i64* %scevgep237238.us, align 8, !alias.scope !179, !noalias !185
  br i1 %brmerge350, label %polly.merge244.us, label %polly.loop_header249.us.preheader

polly.loop_header249.us.preheader:                ; preds = %polly.cond243.loopexit.us
  br i1 %lcmp.mod389, label %polly.loop_header249.us.preheader.split, label %polly.loop_header249.us.prol

polly.loop_header249.us.prol:                     ; preds = %polly.loop_header249.us.preheader
  %_p_scalar_263.us.prol = load i64, i64* %scevgep262.us.prol, align 8, !alias.scope !175, !noalias !177, !llvm.mem.parallel_loop_access !183
  %124 = add i64 %48, %121
  %scevgep264.us.prol = getelementptr i64, i64* %3, i64 %124
  %_p_scalar_265.us.prol = load i64, i64* %scevgep264.us.prol, align 8, !alias.scope !178, !noalias !182, !llvm.mem.parallel_loop_access !183
  %p_mul29266.us.prol = mul nsw i64 %_p_scalar_265.us.prol, %_p_scalar_263.us.prol, !dbg !156
  %p_add30267.us.prol = add nsw i64 %p_mul29266.us.prol, %p_add30.us.3.lcssa, !dbg !162
  br label %polly.loop_header249.us.preheader.split

polly.loop_header249.us.preheader.split:          ; preds = %polly.loop_header249.us.preheader, %polly.loop_header249.us.prol
  %p_add30267.us.lcssa.unr = phi i64 [ undef, %polly.loop_header249.us.preheader ], [ %p_add30267.us.prol, %polly.loop_header249.us.prol ]
  %p_add30267273.us.unr = phi i64 [ %p_add30.us.3.lcssa, %polly.loop_header249.us.preheader ], [ %p_add30267.us.prol, %polly.loop_header249.us.prol ]
  %polly.indvar253.us.unr = phi i64 [ 0, %polly.loop_header249.us.preheader ], [ 1, %polly.loop_header249.us.prol ]
  br i1 %49, label %polly.merge244.loopexit.us, label %polly.loop_header249.us.preheader.split.split

polly.loop_header249.us.preheader.split.split:    ; preds = %polly.loop_header249.us.preheader.split
  br label %polly.loop_header249.us

polly.loop_header213.preheader.split:             ; preds = %polly.loop_header213.preheader
  br i1 %91, label %polly.loop_exit215, label %polly.then245.preheader

polly.then245.preheader:                          ; preds = %polly.loop_header213.preheader.split
  %125 = add i64 %46, %94
  %scevgep262.prol = getelementptr i64, i64* %2, i64 %125
  br label %polly.then245

polly.loop_exit215.loopexit:                      ; preds = %polly.merge244.us
  br label %polly.loop_exit215

polly.loop_exit215.loopexit385:                   ; preds = %polly.merge244
  br label %polly.loop_exit215

polly.loop_exit215:                               ; preds = %polly.loop_exit215.loopexit385, %polly.loop_exit215.loopexit, %polly.loop_header213.preheader.split, %polly.loop_header204
  %polly.indvar_next209 = add nuw nsw i64 %polly.indvar208, 1
  %polly.loop_cond211 = icmp sgt i64 %polly.indvar208, %polly.adjust_ub210
  br i1 %polly.loop_cond211, label %polly.loop_exit206.loopexit, label %polly.loop_header204

polly.merge244.loopexit.unr-lcssa:                ; preds = %polly.loop_header249
  %p_add30267.1.lcssa = phi i64 [ %p_add30267.1, %polly.loop_header249 ]
  br label %polly.merge244.loopexit

polly.merge244.loopexit:                          ; preds = %polly.loop_header249.preheader.split, %polly.merge244.loopexit.unr-lcssa
  %p_add30267.lcssa = phi i64 [ %p_add30267.lcssa.unr, %polly.loop_header249.preheader.split ], [ %p_add30267.1.lcssa, %polly.merge244.loopexit.unr-lcssa ]
  store i64 %p_add30267.lcssa, i64* %scevgep259260, align 8, !alias.scope !179, !noalias !185
  br label %polly.merge244

polly.merge244:                                   ; preds = %polly.merge244.loopexit, %polly.then245
  %polly.indvar_next218 = add nuw nsw i64 %polly.indvar217, 1
  %polly.loop_cond220 = icmp sgt i64 %polly.indvar217, %polly.adjust_ub219
  br i1 %polly.loop_cond220, label %polly.loop_exit215.loopexit385, label %polly.then245

polly.then245:                                    ; preds = %polly.then245.preheader, %polly.merge244
  %polly.indvar217 = phi i64 [ %polly.indvar_next218, %polly.merge244 ], [ 0, %polly.then245.preheader ]
  br i1 %polly.loop_guard252, label %polly.merge244, label %polly.loop_header249.preheader

polly.loop_header249.preheader:                   ; preds = %polly.then245
  %126 = add nuw nsw i64 %polly.indvar217, %80
  %127 = shl i64 %126, 3
  %128 = add i64 %127, %93
  %scevgep259 = getelementptr i8, i8* %call, i64 %128
  %scevgep259260 = bitcast i8* %scevgep259 to i64*
  %scevgep259260.promoted = load i64, i64* %scevgep259260, align 8, !alias.scope !179, !noalias !185
  br i1 %lcmp.mod, label %polly.loop_header249.preheader.split, label %polly.loop_header249.prol

polly.loop_header249.prol:                        ; preds = %polly.loop_header249.preheader
  %_p_scalar_263.prol = load i64, i64* %scevgep262.prol, align 8, !alias.scope !175, !noalias !177, !llvm.mem.parallel_loop_access !183
  %129 = add i64 %50, %126
  %scevgep264.prol = getelementptr i64, i64* %3, i64 %129
  %_p_scalar_265.prol = load i64, i64* %scevgep264.prol, align 8, !alias.scope !178, !noalias !182, !llvm.mem.parallel_loop_access !183
  %p_mul29266.prol = mul nsw i64 %_p_scalar_265.prol, %_p_scalar_263.prol, !dbg !156
  %p_add30267.prol = add nsw i64 %p_mul29266.prol, %scevgep259260.promoted, !dbg !162
  br label %polly.loop_header249.preheader.split

polly.loop_header249.preheader.split:             ; preds = %polly.loop_header249.preheader, %polly.loop_header249.prol
  %p_add30267.lcssa.unr = phi i64 [ undef, %polly.loop_header249.preheader ], [ %p_add30267.prol, %polly.loop_header249.prol ]
  %p_add30267273.unr = phi i64 [ %scevgep259260.promoted, %polly.loop_header249.preheader ], [ %p_add30267.prol, %polly.loop_header249.prol ]
  %polly.indvar253.unr = phi i64 [ 0, %polly.loop_header249.preheader ], [ 1, %polly.loop_header249.prol ]
  br i1 %51, label %polly.merge244.loopexit, label %polly.loop_header249.preheader.split.split

polly.loop_header249.preheader.split.split:       ; preds = %polly.loop_header249.preheader.split
  br label %polly.loop_header249

polly.loop_header249:                             ; preds = %polly.loop_header249, %polly.loop_header249.preheader.split.split
  %p_add30267273 = phi i64 [ %p_add30267273.unr, %polly.loop_header249.preheader.split.split ], [ %p_add30267.1, %polly.loop_header249 ]
  %polly.indvar253 = phi i64 [ %polly.indvar253.unr, %polly.loop_header249.preheader.split.split ], [ %polly.indvar_next254.1, %polly.loop_header249 ]
  %130 = add nsw i64 %polly.indvar253, %46
  %131 = add i64 %130, %94
  %scevgep262 = getelementptr i64, i64* %2, i64 %131
  %_p_scalar_263 = load i64, i64* %scevgep262, align 8, !alias.scope !175, !noalias !177, !llvm.mem.parallel_loop_access !183
  %132 = mul i64 %130, %conv
  %133 = add i64 %132, %126
  %scevgep264 = getelementptr i64, i64* %3, i64 %133
  %_p_scalar_265 = load i64, i64* %scevgep264, align 8, !alias.scope !178, !noalias !182, !llvm.mem.parallel_loop_access !183
  %p_mul29266 = mul nsw i64 %_p_scalar_265, %_p_scalar_263, !dbg !156
  %p_add30267 = add nsw i64 %p_mul29266, %p_add30267273, !dbg !162
  %polly.indvar_next254 = add nuw nsw i64 %polly.indvar253, 1
  %134 = add nsw i64 %polly.indvar_next254, %46
  %135 = add i64 %134, %94
  %scevgep262.1 = getelementptr i64, i64* %2, i64 %135
  %_p_scalar_263.1 = load i64, i64* %scevgep262.1, align 8, !alias.scope !175, !noalias !177, !llvm.mem.parallel_loop_access !183
  %136 = mul i64 %134, %conv
  %137 = add i64 %136, %126
  %scevgep264.1 = getelementptr i64, i64* %3, i64 %137
  %_p_scalar_265.1 = load i64, i64* %scevgep264.1, align 8, !alias.scope !178, !noalias !182, !llvm.mem.parallel_loop_access !183
  %p_mul29266.1 = mul nsw i64 %_p_scalar_265.1, %_p_scalar_263.1, !dbg !156
  %p_add30267.1 = add nsw i64 %p_mul29266.1, %p_add30267, !dbg !162
  %polly.indvar_next254.1 = add nsw i64 %polly.indvar253, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next254.1, %pexp.pdiv_r247
  br i1 %exitcond.1, label %polly.merge244.loopexit.unr-lcssa, label %polly.loop_header249, !llvm.loop !184
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %args) #3 !dbg !41 {
entry:
  %max = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !48, metadata !57), !dbg !186
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !49, metadata !57), !dbg !187
  %0 = bitcast i32* %max to i8*, !dbg !188
  call void @llvm.lifetime.start(i64 4, i8* %0) #5, !dbg !188
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 1, !dbg !189
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !189, !tbaa !190
  tail call void @llvm.dbg.value(metadata i32* %max, i64 0, metadata !50, metadata !191), !dbg !192
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %max) #5, !dbg !193
  %2 = load i32, i32* %max, align 4, !dbg !194, !tbaa !195
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !50, metadata !57), !dbg !192
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %2), !dbg !196
  %3 = load i32, i32* %max, align 4, !dbg !197, !tbaa !195
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !50, metadata !57), !dbg !192
  %call2 = call %struct.Matrix* @init(i32 %3, i32 %3), !dbg !198
  call void @llvm.dbg.value(metadata %struct.Matrix* %call2, i64 0, metadata !51, metadata !57), !dbg !200
  %4 = load i32, i32* %max, align 4, !dbg !201, !tbaa !195
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !50, metadata !57), !dbg !192
  %call3 = call %struct.Matrix* @init(i32 %4, i32 %4), !dbg !202
  call void @llvm.dbg.value(metadata %struct.Matrix* %call3, i64 0, metadata !52, metadata !57), !dbg !203
  %call4 = call %struct.Matrix* @mat_mult(%struct.Matrix* %call2, %struct.Matrix* %call3), !dbg !204
  call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !53, metadata !57), !dbg !205
  %5 = load i32, i32* %max, align 4, !dbg !206, !tbaa !195
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !50, metadata !57), !dbg !192
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %5, i32 %5), !dbg !207
  %6 = load i32, i32* %max, align 4, !dbg !208, !tbaa !195
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !50, metadata !57), !dbg !192
  %sub = add nsw i32 %6, -1, !dbg !209
  %add = mul i32 %6, %6, !dbg !210
  %sub8 = add nsw i32 %add, -1, !dbg !211
  %idxprom = sext i32 %sub8 to i64, !dbg !212
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0, !dbg !213
  %7 = load i64*, i64** %data, align 8, !dbg !213, !tbaa !86
  %arrayidx9 = getelementptr inbounds i64, i64* %7, i64 %idxprom, !dbg !212
  %8 = load i64, i64* %arrayidx9, align 8, !dbg !212, !tbaa !151
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call3, i64 0, i32 0, !dbg !214
  %9 = load i64*, i64** %data17, align 8, !dbg !214, !tbaa !86
  %arrayidx18 = getelementptr inbounds i64, i64* %9, i64 %idxprom, !dbg !215
  %10 = load i64, i64* %arrayidx18, align 8, !dbg !215, !tbaa !151
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !216
  %11 = load i64*, i64** %data26, align 8, !dbg !216, !tbaa !86
  %arrayidx27 = getelementptr inbounds i64, i64* %11, i64 %idxprom, !dbg !217
  %12 = load i64, i64* %arrayidx27, align 8, !dbg !217, !tbaa !151
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %6, i32 %sub, i64 %8, i32 %sub, i32 %6, i32 %sub, i64 %10, i32 %sub, i32 %6, i32 %sub, i64 %12), !dbg !218
  call void @llvm.lifetime.end(i64 4, i8* %0) #5, !dbg !219
  ret i32 0, !dbg !221
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
!99 = distinct !{!99}
!100 = distinct !{!100, !101, !"polly.alias.scope.call"}
!101 = distinct !{!101, !"polly.alias.scope.domain"}
!102 = !{!99, !103}
!103 = distinct !{!103}
!104 = !DILocation(line: 35, column: 47, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !1, line: 34, column: 33)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 34, column: 9)
!107 = distinct !DILexicalBlock(scope: !108, file: !1, line: 34, column: 9)
!108 = distinct !DILexicalBlock(scope: !109, file: !1, line: 33, column: 30)
!109 = distinct !DILexicalBlock(scope: !110, file: !1, line: 33, column: 5)
!110 = distinct !DILexicalBlock(scope: !7, file: !1, line: 33, column: 5)
!111 = !{!99, !112}
!112 = distinct !{!112}
!113 = !DILocation(line: 47, column: 26, scope: !25)
!114 = !DILocation(line: 47, column: 37, scope: !25)
!115 = !DILocation(line: 49, column: 20, scope: !25)
!116 = !DILocation(line: 49, column: 9, scope: !25)
!117 = !DILocation(line: 50, column: 21, scope: !25)
!118 = !DILocation(line: 50, column: 9, scope: !25)
!119 = !DILocation(line: 52, column: 17, scope: !25)
!120 = !DILocation(line: 51, column: 29, scope: !25)
!121 = !DILocation(line: 53, column: 17, scope: !25)
!122 = !DILocation(line: 51, column: 51, scope: !25)
!123 = !DILocation(line: 54, column: 49, scope: !25)
!124 = !DILocation(line: 54, column: 48, scope: !25)
!125 = !DILocation(line: 54, column: 55, scope: !25)
!126 = !DILocation(line: 54, column: 54, scope: !25)
!127 = !DILocation(line: 54, column: 24, scope: !25)
!128 = !DILocation(line: 54, column: 12, scope: !25)
!129 = !DILocation(line: 51, column: 73, scope: !25)
!130 = !DILocation(line: 48, column: 9, scope: !25)
!131 = !DILocation(line: 56, column: 15, scope: !132)
!132 = !DILexicalBlockFile(scope: !133, file: !1, discriminator: 1)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 56, column: 5)
!134 = distinct !DILexicalBlock(scope: !25, file: !1, line: 56, column: 5)
!135 = !DILocation(line: 56, column: 5, scope: !132)
!136 = !DILocation(line: 57, column: 19, scope: !137)
!137 = !DILexicalBlockFile(scope: !138, file: !1, discriminator: 1)
!138 = distinct !DILexicalBlock(scope: !139, file: !1, line: 57, column: 9)
!139 = distinct !DILexicalBlock(scope: !140, file: !1, line: 57, column: 9)
!140 = distinct !DILexicalBlock(scope: !133, file: !1, line: 56, column: 29)
!141 = !DILocation(line: 57, column: 9, scope: !137)
!142 = !DILocation(line: 59, column: 13, scope: !143)
!143 = !DILexicalBlockFile(scope: !144, file: !1, discriminator: 1)
!144 = distinct !DILexicalBlock(scope: !145, file: !1, line: 59, column: 13)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 59, column: 13)
!146 = distinct !DILexicalBlock(scope: !138, file: !1, line: 57, column: 34)
!147 = !DILocation(line: 58, column: 19, scope: !146)
!148 = !DILocation(line: 58, column: 25, scope: !146)
!149 = !DILocation(line: 58, column: 13, scope: !146)
!150 = !DILocation(line: 58, column: 29, scope: !146)
!151 = !{!152, !152, i64 0}
!152 = !{!"long long", !89, i64 0}
!153 = !DILocation(line: 48, column: 15, scope: !25)
!154 = !DILocation(line: 60, column: 53, scope: !144)
!155 = !DILocation(line: 60, column: 73, scope: !144)
!156 = !DILocation(line: 60, column: 71, scope: !144)
!157 = !DILocation(line: 60, column: 33, scope: !144)
!158 = !DILocation(line: 60, column: 35, scope: !144)
!159 = !DILocation(line: 60, column: 67, scope: !144)
!160 = !DILocation(line: 60, column: 81, scope: !144)
!161 = !DILocation(line: 60, column: 87, scope: !144)
!162 = !DILocation(line: 60, column: 51, scope: !144)
!163 = !DILocation(line: 64, column: 17, scope: !164)
!164 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 1)
!165 = !DILocation(line: 64, column: 17, scope: !25)
!166 = !DILocation(line: 64, column: 13, scope: !25)
!167 = !DILocation(line: 65, column: 8, scope: !25)
!168 = !DILocation(line: 65, column: 14, scope: !25)
!169 = !DILocation(line: 66, column: 8, scope: !25)
!170 = !DILocation(line: 66, column: 15, scope: !25)
!171 = !DILocation(line: 67, column: 13, scope: !25)
!172 = !DILocation(line: 68, column: 5, scope: !25)
!173 = distinct !{!173}
!174 = distinct !{!174}
!175 = distinct !{!175, !176, !"polly.alias.scope."}
!176 = distinct !{!176, !"polly.alias.scope.domain"}
!177 = !{!178, !179}
!178 = distinct !{!178, !176, !"polly.alias.scope."}
!179 = distinct !{!179, !176, !"polly.alias.scope.call"}
!180 = !{!174, !181}
!181 = distinct !{!181}
!182 = !{!179, !175}
!183 = !{!174, !184}
!184 = distinct !{!184}
!185 = !{!178, !175}
!186 = !DILocation(line: 72, column: 14, scope: !41)
!187 = !DILocation(line: 72, column: 27, scope: !41)
!188 = !DILocation(line: 75, column: 5, scope: !41)
!189 = !DILocation(line: 76, column: 12, scope: !41)
!190 = !{!88, !88, i64 0}
!191 = !DIExpression(DW_OP_deref)
!192 = !DILocation(line: 75, column: 9, scope: !41)
!193 = !DILocation(line: 76, column: 5, scope: !41)
!194 = !DILocation(line: 77, column: 24, scope: !41)
!195 = !{!91, !91, i64 0}
!196 = !DILocation(line: 77, column: 5, scope: !41)
!197 = !DILocation(line: 79, column: 22, scope: !41)
!198 = !DILocation(line: 79, column: 17, scope: !199)
!199 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 1)
!200 = !DILocation(line: 79, column: 13, scope: !41)
!201 = !DILocation(line: 80, column: 22, scope: !41)
!202 = !DILocation(line: 80, column: 17, scope: !199)
!203 = !DILocation(line: 80, column: 13, scope: !41)
!204 = !DILocation(line: 82, column: 17, scope: !199)
!205 = !DILocation(line: 82, column: 13, scope: !41)
!206 = !DILocation(line: 84, column: 48, scope: !41)
!207 = !DILocation(line: 84, column: 5, scope: !41)
!208 = !DILocation(line: 86, column: 9, scope: !41)
!209 = !DILocation(line: 86, column: 12, scope: !41)
!210 = !DILocation(line: 86, column: 47, scope: !41)
!211 = !DILocation(line: 86, column: 51, scope: !41)
!212 = !DILocation(line: 86, column: 28, scope: !41)
!213 = !DILocation(line: 86, column: 31, scope: !41)
!214 = !DILocation(line: 87, column: 31, scope: !41)
!215 = !DILocation(line: 87, column: 28, scope: !41)
!216 = !DILocation(line: 88, column: 31, scope: !41)
!217 = !DILocation(line: 88, column: 28, scope: !41)
!218 = !DILocation(line: 85, column: 5, scope: !41)
!219 = !DILocation(line: 90, column: 1, scope: !220)
!220 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 3)
!221 = !DILocation(line: 89, column: 5, scope: !41)
