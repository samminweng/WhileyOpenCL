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
  %xtraiter200 = and i32 %height, 7, !dbg !76
  %lcmp.mod201 = icmp eq i32 %xtraiter200, 0, !dbg !76
  br i1 %lcmp.mod201, label %for.cond4.preheader.us.preheader.split, label %for.cond4.preheader.us.prol.preheader, !dbg !76

for.cond4.preheader.us.prol.preheader:            ; preds = %for.cond4.preheader.us.preheader
  br label %for.cond4.preheader.us.prol, !dbg !76

for.cond4.preheader.us.prol:                      ; preds = %for.cond4.preheader.us.prol.preheader, %for.cond4.preheader.us.prol
  %indvars.iv91.us.prol = phi i64 [ %indvars.iv.next92.us.prol, %for.cond4.preheader.us.prol ], [ 0, %for.cond4.preheader.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond4.preheader.us.prol ], [ %xtraiter200, %for.cond4.preheader.us.prol.preheader ]
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
  %exitcond189.7 = icmp eq i32 %lftr.wideiv.7, %height, !dbg !75
  br i1 %exitcond189.7, label %polly.start.loopexit.unr-lcssa, label %for.cond4.preheader.us, !dbg !75

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
  %pexp.p_div_q = lshr i64 %conv, 2
  %17 = add nsw i64 %pexp.p_div_q, -1
  %18 = zext i32 %width to i64
  %pexp.pdiv_r = and i64 %18, 3
  %polly.loop_guard135 = icmp eq i64 %pexp.pdiv_r, 0
  %19 = sub nsw i64 %conv, %pexp.pdiv_r
  %20 = add nsw i64 %pexp.pdiv_r, -1
  %xtraiter198 = and i64 %18, 1
  %lcmp.mod199 = icmp eq i64 %xtraiter198, 0
  %21 = shl nsw i64 %19, 3
  %22 = icmp eq i64 %20, 0
  %xtraiter = and i64 %18, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %23 = shl nsw i64 %19, 3
  %24 = icmp eq i64 %20, 0
  br label %polly.loop_header

polly.exiting.loopexit:                           ; preds = %polly.loop_exit100
  br label %polly.exiting, !dbg !81

polly.exiting:                                    ; preds = %polly.exiting.loopexit, %polly.start
  %call36 = tail call noalias i8* @malloc(i64 16) #5, !dbg !81
  %25 = bitcast i8* %call36 to %struct.Matrix*, !dbg !82
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %25, i64 0, metadata !24, metadata !56), !dbg !83
  %26 = bitcast i8* %call36 to i8**, !dbg !84
  store i8* %call, i8** %26, align 8, !dbg !84, !tbaa !85
  %width38 = getelementptr inbounds i8, i8* %call36, i64 8, !dbg !91
  %27 = bitcast i8* %width38 to i32*, !dbg !91
  store i32 %width, i32* %27, align 8, !dbg !92, !tbaa !93
  %height39 = getelementptr inbounds i8, i8* %call36, i64 12, !dbg !94
  %28 = bitcast i8* %height39 to i32*, !dbg !94
  store i32 %height, i32* %28, align 4, !dbg !95, !tbaa !96
  ret %struct.Matrix* %25, !dbg !97

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
  %exitcond187 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond187, label %polly.exiting.loopexit, label %polly.loop_header, !llvm.loop !98

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
  br i1 %polly.loop_guard119, label %polly.loop_header107.us.preheader, label %polly.loop_header107.preheader.split

polly.loop_header107.us.preheader:                ; preds = %polly.loop_header107.preheader
  %brmerge = or i1 %40, %polly.loop_guard135
  br label %polly.loop_header107.us

polly.loop_header107.us:                          ; preds = %polly.loop_header107.us.preheader, %polly.merge.us
  %polly.indvar111.us = phi i64 [ %polly.indvar_next112.us, %polly.merge.us ], [ 0, %polly.loop_header107.us.preheader ]
  %41 = add nuw nsw i64 %polly.indvar111.us, %29
  %42 = mul i64 %41, %mul
  br label %polly.loop_header116.us

polly.loop_header116.us:                          ; preds = %polly.loop_header107.us, %polly.loop_header116.us
  %polly.indvar120.us = phi i64 [ %polly.indvar_next121.us, %polly.loop_header116.us ], [ 0, %polly.loop_header107.us ]
  %43 = shl i64 %polly.indvar120.us, 2
  %44 = add nuw nsw i64 %43, %38
  %45 = shl i64 %44, 3
  %46 = add i64 %45, %42
  %scevgep.us = getelementptr i8, i8* %call, i64 %46
  %scevgep130.us = bitcast i8* %scevgep.us to i64*
  %_p_scalar_.us = load i64, i64* %scevgep130.us, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %p_add25.us = add nsw i64 %_p_scalar_.us, %41, !dbg !103
  store i64 %p_add25.us, i64* %scevgep130.us, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %47 = shl i64 %44, 3
  %48 = or i64 %47, 8
  %49 = add i64 %48, %42
  %scevgep.us.1 = getelementptr i8, i8* %call, i64 %49
  %scevgep130.us.1 = bitcast i8* %scevgep.us.1 to i64*
  %_p_scalar_.us.1 = load i64, i64* %scevgep130.us.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %p_add25.us.1 = add nsw i64 %_p_scalar_.us.1, %41, !dbg !103
  store i64 %p_add25.us.1, i64* %scevgep130.us.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %50 = shl i64 %44, 3
  %51 = or i64 %50, 16
  %52 = add i64 %51, %42
  %scevgep.us.2 = getelementptr i8, i8* %call, i64 %52
  %scevgep130.us.2 = bitcast i8* %scevgep.us.2 to i64*
  %_p_scalar_.us.2 = load i64, i64* %scevgep130.us.2, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %p_add25.us.2 = add nsw i64 %_p_scalar_.us.2, %41, !dbg !103
  store i64 %p_add25.us.2, i64* %scevgep130.us.2, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %53 = shl i64 %44, 3
  %54 = or i64 %53, 24
  %55 = add i64 %54, %42
  %scevgep.us.3 = getelementptr i8, i8* %call, i64 %55
  %scevgep130.us.3 = bitcast i8* %scevgep.us.3 to i64*
  %_p_scalar_.us.3 = load i64, i64* %scevgep130.us.3, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %p_add25.us.3 = add nsw i64 %_p_scalar_.us.3, %41, !dbg !103
  store i64 %p_add25.us.3, i64* %scevgep130.us.3, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %polly.indvar_next121.us = add nuw nsw i64 %polly.indvar120.us, 1
  %polly.loop_cond123.us = icmp sgt i64 %polly.indvar120.us, %polly.adjust_ub122
  br i1 %polly.loop_cond123.us, label %polly.cond.loopexit.us, label %polly.loop_header116.us

polly.loop_header132.us:                          ; preds = %polly.loop_header132.us, %polly.loop_header132.us.preheader.split.split
  %polly.indvar136.us = phi i64 [ %polly.indvar136.us.unr, %polly.loop_header132.us.preheader.split.split ], [ %polly.indvar_next137.us.1, %polly.loop_header132.us ]
  %56 = add nsw i64 %19, %polly.indvar136.us
  %57 = shl i64 %56, 3
  %58 = add i64 %57, %42
  %scevgep142.us = getelementptr i8, i8* %call, i64 %58
  %scevgep142143.us = bitcast i8* %scevgep142.us to i64*
  %_p_scalar_144.us = load i64, i64* %scevgep142143.us, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add25145.us = add nsw i64 %_p_scalar_144.us, %41, !dbg !103
  store i64 %p_add25145.us, i64* %scevgep142143.us, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next137.us = add nuw nsw i64 %polly.indvar136.us, 1
  %59 = add nsw i64 %19, %polly.indvar_next137.us
  %60 = shl i64 %59, 3
  %61 = add i64 %60, %42
  %scevgep142.us.1 = getelementptr i8, i8* %call, i64 %61
  %scevgep142143.us.1 = bitcast i8* %scevgep142.us.1 to i64*
  %_p_scalar_144.us.1 = load i64, i64* %scevgep142143.us.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add25145.us.1 = add nsw i64 %_p_scalar_144.us.1, %41, !dbg !103
  store i64 %p_add25145.us.1, i64* %scevgep142143.us.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next137.us.1 = add nsw i64 %polly.indvar136.us, 2
  %exitcond185.1 = icmp eq i64 %polly.indvar_next137.us.1, %pexp.pdiv_r
  br i1 %exitcond185.1, label %polly.merge.us.loopexit.unr-lcssa, label %polly.loop_header132.us, !llvm.loop !111

polly.merge.us.loopexit.unr-lcssa:                ; preds = %polly.loop_header132.us
  br label %polly.merge.us.loopexit

polly.merge.us.loopexit:                          ; preds = %polly.loop_header132.us.preheader.split, %polly.merge.us.loopexit.unr-lcssa
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next112.us = add nuw nsw i64 %polly.indvar111.us, 1
  %polly.loop_cond114.us = icmp sgt i64 %polly.indvar111.us, %polly.adjust_ub113
  br i1 %polly.loop_cond114.us, label %polly.loop_exit109.loopexit, label %polly.loop_header107.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header116.us
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header132.us.preheader

polly.loop_header132.us.preheader:                ; preds = %polly.cond.loopexit.us
  br i1 %lcmp.mod199, label %polly.loop_header132.us.preheader.split, label %polly.loop_header132.us.prol

polly.loop_header132.us.prol:                     ; preds = %polly.loop_header132.us.preheader
  %62 = add i64 %21, %42
  %scevgep142.us.prol = getelementptr i8, i8* %call, i64 %62
  %scevgep142143.us.prol = bitcast i8* %scevgep142.us.prol to i64*
  %_p_scalar_144.us.prol = load i64, i64* %scevgep142143.us.prol, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add25145.us.prol = add nsw i64 %_p_scalar_144.us.prol, %41, !dbg !103
  store i64 %p_add25145.us.prol, i64* %scevgep142143.us.prol, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  br label %polly.loop_header132.us.preheader.split

polly.loop_header132.us.preheader.split:          ; preds = %polly.loop_header132.us.preheader, %polly.loop_header132.us.prol
  %polly.indvar136.us.unr = phi i64 [ 0, %polly.loop_header132.us.preheader ], [ 1, %polly.loop_header132.us.prol ]
  br i1 %22, label %polly.merge.us.loopexit, label %polly.loop_header132.us.preheader.split.split

polly.loop_header132.us.preheader.split.split:    ; preds = %polly.loop_header132.us.preheader.split
  br label %polly.loop_header132.us

polly.loop_header107.preheader.split:             ; preds = %polly.loop_header107.preheader
  br i1 %40, label %polly.loop_exit109, label %polly.loop_header107.preheader196

polly.loop_header107.preheader196:                ; preds = %polly.loop_header107.preheader.split
  br label %polly.loop_header107

polly.loop_exit109.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit109

polly.loop_exit109.loopexit197:                   ; preds = %polly.merge
  br label %polly.loop_exit109

polly.loop_exit109:                               ; preds = %polly.loop_exit109.loopexit197, %polly.loop_exit109.loopexit, %polly.loop_header107.preheader.split, %polly.loop_header98
  %polly.indvar_next103 = add nuw nsw i64 %polly.indvar102, 1
  %exitcond186 = icmp eq i64 %polly.indvar102, %polly.fdiv_q.shr96
  br i1 %exitcond186, label %polly.loop_exit100.loopexit, label %polly.loop_header98

polly.loop_header107:                             ; preds = %polly.loop_header107.preheader196, %polly.merge
  %polly.indvar111 = phi i64 [ %polly.indvar_next112, %polly.merge ], [ 0, %polly.loop_header107.preheader196 ]
  br i1 %polly.loop_guard135, label %polly.merge, label %polly.loop_header132.preheader

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header132
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.loop_header132.preheader.split, %polly.merge.loopexit.unr-lcssa
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header107
  %polly.indvar_next112 = add nuw nsw i64 %polly.indvar111, 1
  %polly.loop_cond114 = icmp sgt i64 %polly.indvar111, %polly.adjust_ub113
  br i1 %polly.loop_cond114, label %polly.loop_exit109.loopexit197, label %polly.loop_header107

polly.loop_header132.preheader:                   ; preds = %polly.loop_header107
  %63 = add nuw nsw i64 %polly.indvar111, %29
  %64 = mul i64 %63, %mul
  br i1 %lcmp.mod, label %polly.loop_header132.preheader.split, label %polly.loop_header132.prol

polly.loop_header132.prol:                        ; preds = %polly.loop_header132.preheader
  %65 = add i64 %23, %64
  %scevgep142.prol = getelementptr i8, i8* %call, i64 %65
  %scevgep142143.prol = bitcast i8* %scevgep142.prol to i64*
  %_p_scalar_144.prol = load i64, i64* %scevgep142143.prol, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add25145.prol = add nsw i64 %_p_scalar_144.prol, %63, !dbg !103
  store i64 %p_add25145.prol, i64* %scevgep142143.prol, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
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
  %_p_scalar_144 = load i64, i64* %scevgep142143, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add25145 = add nsw i64 %_p_scalar_144, %63, !dbg !103
  store i64 %p_add25145, i64* %scevgep142143, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next137 = add nuw nsw i64 %polly.indvar136, 1
  %69 = add nsw i64 %19, %polly.indvar_next137
  %70 = shl i64 %69, 3
  %71 = add i64 %70, %64
  %scevgep142.1 = getelementptr i8, i8* %call, i64 %71
  %scevgep142143.1 = bitcast i8* %scevgep142.1 to i64*
  %_p_scalar_144.1 = load i64, i64* %scevgep142143.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add25145.1 = add nsw i64 %_p_scalar_144.1, %63, !dbg !103
  store i64 %p_add25145.1, i64* %scevgep142143.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next137.1 = add nsw i64 %polly.indvar136, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next137.1, %pexp.pdiv_r
  br i1 %exitcond.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header132, !llvm.loop !111
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
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !29, metadata !56), !dbg !112
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !30, metadata !56), !dbg !113
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !114
  %0 = load i32, i32* %width1, align 8, !dbg !114, !tbaa !93
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !34, metadata !56), !dbg !115
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !116
  %1 = load i32, i32* %height2, align 4, !dbg !116, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !35, metadata !56), !dbg !117
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !118
  %2 = load i64*, i64** %data, align 8, !dbg !118, !tbaa !85
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !36, metadata !56), !dbg !119
  %data3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !120
  %3 = load i64*, i64** %data3, align 8, !dbg !120, !tbaa !85
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !37, metadata !56), !dbg !121
  %conv = sext i32 %0 to i64, !dbg !122
  %mul = shl nsw i64 %conv, 3, !dbg !123
  %conv5 = sext i32 %1 to i64, !dbg !124
  %mul6 = mul i64 %mul, %conv5, !dbg !125
  %call = tail call noalias i8* @malloc(i64 %mul6) #5, !dbg !126
  %4 = bitcast i8* %call to i64*, !dbg !128
  tail call void @llvm.dbg.value(metadata i64* %4, i64 0, metadata !38, metadata !56), !dbg !129
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !31, metadata !56), !dbg !130
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
  br i1 %cmp986, label %for.cond8.preheader.us.preheader, label %for.end40, !dbg !141

for.cond8.preheader.us.preheader:                 ; preds = %for.cond8.preheader.preheader
  %xtraiter399 = and i32 %0, 1, !dbg !142
  %lcmp.mod400 = icmp eq i32 %xtraiter399, 0, !dbg !142
  %15 = icmp eq i32 %0, 1, !dbg !142
  br label %for.cond8.preheader.us, !dbg !147

for.cond8.preheader.us:                           ; preds = %for.cond8.preheader.us.preheader, %for.inc38.loopexit.us
  %indvars.iv100.us = phi i64 [ %indvars.iv.next101.us, %for.inc38.loopexit.us ], [ 0, %for.cond8.preheader.us.preheader ]
  %16 = mul nsw i64 %indvars.iv100.us, %conv, !dbg !147
  %arrayidx24.us.prol = getelementptr inbounds i64, i64* %2, i64 %16, !dbg !148
  br label %for.body11.us, !dbg !147

for.body11.us:                                    ; preds = %for.cond8.preheader.us, %for.inc35.us
  %indvars.iv95.us = phi i64 [ %indvars.iv.next96.us, %for.inc35.us ], [ 0, %for.cond8.preheader.us ]
  %17 = add nsw i64 %indvars.iv95.us, %16, !dbg !149
  %arrayidx.us = getelementptr inbounds i64, i64* %4, i64 %17, !dbg !150
  store i64 0, i64* %arrayidx.us, align 8, !dbg !151, !tbaa !152
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !56), !dbg !154
  br i1 %lcmp.mod400, label %for.body11.us.split, label %for.body16.us.prol, !dbg !142

for.body16.us.prol:                               ; preds = %for.body11.us
  %18 = load i64, i64* %arrayidx24.us.prol, align 8, !dbg !148, !tbaa !152
  %arrayidx28.us.prol = getelementptr inbounds i64, i64* %3, i64 %indvars.iv95.us, !dbg !155
  %19 = load i64, i64* %arrayidx28.us.prol, align 8, !dbg !155, !tbaa !152
  %mul29.us.prol = mul nsw i64 %19, %18, !dbg !156
  store i64 %mul29.us.prol, i64* %arrayidx.us, align 8, !dbg !157, !tbaa !152
  br label %for.body11.us.split, !dbg !142

for.body11.us.split:                              ; preds = %for.body11.us, %for.body16.us.prol
  %.unr = phi i64 [ 0, %for.body11.us ], [ %mul29.us.prol, %for.body16.us.prol ]
  %indvars.iv.us.unr = phi i64 [ 0, %for.body11.us ], [ 1, %for.body16.us.prol ]
  br i1 %15, label %for.inc35.us, label %for.body11.us.split.split, !dbg !142

for.body11.us.split.split:                        ; preds = %for.body11.us.split
  br label %for.body16.us, !dbg !142

for.body16.us:                                    ; preds = %for.body16.us, %for.body11.us.split.split
  %20 = phi i64 [ %.unr, %for.body11.us.split.split ], [ %add30.us.1, %for.body16.us ], !dbg !158
  %indvars.iv.us = phi i64 [ %indvars.iv.us.unr, %for.body11.us.split.split ], [ %indvars.iv.next.us.1, %for.body16.us ]
  %21 = add nsw i64 %indvars.iv.us, %16, !dbg !159
  %arrayidx24.us = getelementptr inbounds i64, i64* %2, i64 %21, !dbg !148
  %22 = load i64, i64* %arrayidx24.us, align 8, !dbg !148, !tbaa !152
  %23 = mul nsw i64 %indvars.iv.us, %conv, !dbg !160
  %24 = add nsw i64 %23, %indvars.iv95.us, !dbg !161
  %arrayidx28.us = getelementptr inbounds i64, i64* %3, i64 %24, !dbg !155
  %25 = load i64, i64* %arrayidx28.us, align 8, !dbg !155, !tbaa !152
  %mul29.us = mul nsw i64 %25, %22, !dbg !156
  %add30.us = add nsw i64 %mul29.us, %20, !dbg !162
  store i64 %add30.us, i64* %arrayidx.us, align 8, !dbg !157, !tbaa !152
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1, !dbg !142
  %26 = add nsw i64 %indvars.iv.next.us, %16, !dbg !159
  %arrayidx24.us.1 = getelementptr inbounds i64, i64* %2, i64 %26, !dbg !148
  %27 = load i64, i64* %arrayidx24.us.1, align 8, !dbg !148, !tbaa !152
  %28 = mul nsw i64 %indvars.iv.next.us, %conv, !dbg !160
  %29 = add nsw i64 %28, %indvars.iv95.us, !dbg !161
  %arrayidx28.us.1 = getelementptr inbounds i64, i64* %3, i64 %29, !dbg !155
  %30 = load i64, i64* %arrayidx28.us.1, align 8, !dbg !155, !tbaa !152
  %mul29.us.1 = mul nsw i64 %30, %27, !dbg !156
  %add30.us.1 = add nsw i64 %mul29.us.1, %add30.us, !dbg !162
  store i64 %add30.us.1, i64* %arrayidx.us, align 8, !dbg !157, !tbaa !152
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2, !dbg !142
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.us.1 to i32, !dbg !142
  %exitcond373.1 = icmp eq i32 %lftr.wideiv.1, %0, !dbg !142
  br i1 %exitcond373.1, label %for.inc35.us.unr-lcssa, label %for.body16.us, !dbg !142

for.inc35.us.unr-lcssa:                           ; preds = %for.body16.us
  br label %for.inc35.us, !dbg !141

for.inc35.us:                                     ; preds = %for.body11.us.split, %for.inc35.us.unr-lcssa
  %indvars.iv.next96.us = add nuw nsw i64 %indvars.iv95.us, 1, !dbg !141
  %lftr.wideiv374 = trunc i64 %indvars.iv.next96.us to i32, !dbg !141
  %exitcond375 = icmp eq i32 %lftr.wideiv374, %1, !dbg !141
  br i1 %exitcond375, label %for.inc38.loopexit.us, label %for.body11.us, !dbg !141

for.inc38.loopexit.us:                            ; preds = %for.inc35.us
  %indvars.iv.next101.us = add nuw nsw i64 %indvars.iv100.us, 1, !dbg !135
  %lftr.wideiv377 = trunc i64 %indvars.iv.next101.us to i32, !dbg !135
  %exitcond378 = icmp eq i32 %lftr.wideiv377, %0, !dbg !135
  br i1 %exitcond378, label %for.end40.loopexit396, label %for.cond8.preheader.us, !dbg !135

for.end40.loopexit:                               ; preds = %polly.loop_exit189
  br label %for.end40, !dbg !163

for.end40.loopexit396:                            ; preds = %for.inc38.loopexit.us
  br label %for.end40, !dbg !163

for.end40:                                        ; preds = %for.end40.loopexit396, %for.end40.loopexit, %for.cond8.preheader.preheader, %polly.start, %entry
  %call41 = tail call noalias i8* @malloc(i64 16) #5, !dbg !163
  %31 = bitcast i8* %call41 to %struct.Matrix*, !dbg !164
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %31, i64 0, metadata !39, metadata !56), !dbg !165
  %width42 = getelementptr inbounds i8, i8* %call41, i64 8, !dbg !166
  %32 = bitcast i8* %width42 to i32*, !dbg !166
  store i32 %0, i32* %32, align 8, !dbg !167, !tbaa !93
  %height43 = getelementptr inbounds i8, i8* %call41, i64 12, !dbg !168
  %33 = bitcast i8* %height43 to i32*, !dbg !168
  store i32 %1, i32* %33, align 4, !dbg !169, !tbaa !96
  %34 = bitcast i8* %call41 to i8**, !dbg !170
  store i8* %call, i8** %34, align 8, !dbg !170, !tbaa !85
  ret %struct.Matrix* %31, !dbg !171

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
  %xtraiter397 = and i64 %45, 1
  %lcmp.mod398 = icmp eq i64 %xtraiter397, 0
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
  %exitcond372 = icmp eq i64 %polly.indvar_next, %43
  br i1 %exitcond372, label %polly.loop_header177.preheader, label %polly.loop_header, !llvm.loop !172

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
  %polly.loop_guard149381 = icmp sgt i64 %66, -1
  %67 = shl nsw i64 %polly.indvar132, 5
  %68 = or i64 %67, 31
  %69 = icmp slt i64 %68, %conv5
  br i1 %polly.loop_guard149381, label %polly.loop_header137.us.preheader, label %polly.loop_header137.preheader.split

polly.loop_header137.us.preheader:                ; preds = %polly.loop_header137.preheader
  %brmerge = or i1 %69, %polly.loop_guard165
  br label %polly.loop_header137.us

polly.loop_header137.us:                          ; preds = %polly.loop_header137.us.preheader, %polly.merge.us
  %polly.indvar141.us = phi i64 [ %polly.indvar_next142.us, %polly.merge.us ], [ 0, %polly.loop_header137.us.preheader ]
  %70 = mul nsw i64 %mul, %polly.indvar141.us
  %71 = add i64 %60, %70
  %scevgep368 = getelementptr i8, i8* %call, i64 %71
  call void @llvm.memset.p0i8.i64(i8* %scevgep368, i8 0, i64 %64, i32 8, i1 false)
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header162.preheader.us

polly.merge.us:                                   ; preds = %polly.loop_header162.preheader.us, %polly.loop_header137.us
  %polly.indvar_next142.us = add nuw nsw i64 %polly.indvar141.us, 1
  %polly.loop_cond144.us = icmp sgt i64 %polly.indvar141.us, %polly.adjust_ub143
  br i1 %polly.loop_cond144.us, label %polly.loop_exit139.loopexit, label %polly.loop_header137.us

polly.loop_header162.preheader.us:                ; preds = %polly.loop_header137.us
  %72 = add i64 %53, %70
  %scevgep370 = getelementptr i8, i8* %call, i64 %72
  call void @llvm.memset.p0i8.i64(i8* %scevgep370, i8 0, i64 %40, i32 8, i1 false)
  br label %polly.merge.us

polly.loop_header137.preheader.split:             ; preds = %polly.loop_header137.preheader
  br i1 %69, label %polly.loop_exit139, label %polly.loop_header137.preheader394

polly.loop_header137.preheader394:                ; preds = %polly.loop_header137.preheader.split
  br label %polly.loop_header137

polly.loop_exit139.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit139

polly.loop_exit139.loopexit395:                   ; preds = %polly.merge
  br label %polly.loop_exit139

polly.loop_exit139:                               ; preds = %polly.loop_exit139.loopexit395, %polly.loop_exit139.loopexit, %polly.loop_header137.preheader.split, %polly.loop_header128
  %polly.indvar_next133 = add nuw nsw i64 %polly.indvar132, 1
  %exitcond371 = icmp eq i64 %polly.indvar_next133, %42
  br i1 %exitcond371, label %polly.loop_exit130.loopexit, label %polly.loop_header128

polly.loop_header137:                             ; preds = %polly.loop_header137.preheader394, %polly.merge
  %polly.indvar141 = phi i64 [ %polly.indvar_next142, %polly.merge ], [ 0, %polly.loop_header137.preheader394 ]
  br i1 %polly.loop_guard165, label %polly.merge, label %polly.loop_header162.preheader

polly.merge:                                      ; preds = %polly.loop_header162.preheader, %polly.loop_header137
  %polly.indvar_next142 = add nuw nsw i64 %polly.indvar141, 1
  %polly.loop_cond144 = icmp sgt i64 %polly.indvar141, %polly.adjust_ub143
  br i1 %polly.loop_cond144, label %polly.loop_exit139.loopexit395, label %polly.loop_header137

polly.loop_header162.preheader:                   ; preds = %polly.loop_header137
  %73 = mul nsw i64 %mul, %polly.indvar141
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
  %exitcond364 = icmp eq i64 %polly.indvar_next182, %43
  br i1 %exitcond364, label %for.end40.loopexit, label %polly.loop_header177, !llvm.loop !173

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
  %exitcond363 = icmp eq i64 %polly.indvar_next192, %42
  br i1 %exitcond363, label %polly.loop_exit189.loopexit, label %polly.loop_header187

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
  %exitcond362 = icmp eq i64 %polly.indvar199, %pexp.p_div_q195
  br i1 %exitcond362, label %polly.loop_exit198, label %polly.loop_header196

polly.loop_header204:                             ; preds = %polly.loop_header204.preheader, %polly.loop_exit215
  %polly.indvar208 = phi i64 [ %polly.indvar_next209, %polly.loop_exit215 ], [ 0, %polly.loop_header204.preheader ]
  br i1 %polly.loop_guard216, label %polly.loop_header213.preheader, label %polly.loop_exit215

polly.loop_header213.preheader:                   ; preds = %polly.loop_header204
  %92 = add nuw nsw i64 %polly.indvar208, %75
  %93 = mul i64 %92, %mul
  %94 = mul i64 %92, %conv
  br i1 %polly.loop_guard226, label %polly.loop_header213.us.preheader, label %polly.loop_header213.preheader.split

polly.loop_header213.us.preheader:                ; preds = %polly.loop_header213.preheader
  %95 = add i64 %46, %94
  %scevgep262.us.prol = getelementptr i64, i64* %2, i64 %95
  br label %polly.loop_header213.us

polly.loop_header213.us:                          ; preds = %polly.loop_header213.us.preheader, %polly.merge244.us
  %polly.indvar217.us = phi i64 [ %polly.indvar_next218.us, %polly.merge244.us ], [ 0, %polly.loop_header213.us.preheader ]
  %96 = add nuw nsw i64 %polly.indvar217.us, %80
  %97 = shl i64 %96, 3
  %98 = add i64 %97, %93
  %scevgep237.us = getelementptr i8, i8* %call, i64 %98
  %scevgep237238.us = bitcast i8* %scevgep237.us to i64*
  %scevgep237238.promoted271.us = load i64, i64* %scevgep237238.us, align 8, !alias.scope !174, !noalias !176
  br label %polly.loop_header223.us

polly.loop_header223.us:                          ; preds = %polly.loop_header213.us, %polly.loop_header223.us
  %p_add30.lcssa272.us = phi i64 [ %p_add30.us.3, %polly.loop_header223.us ], [ %scevgep237238.promoted271.us, %polly.loop_header213.us ]
  %polly.indvar227.us = phi i64 [ %polly.indvar_next228.us, %polly.loop_header223.us ], [ 0, %polly.loop_header213.us ]
  %99 = shl i64 %polly.indvar227.us, 2
  %100 = add nuw nsw i64 %99, %89
  %101 = add i64 %100, %94
  %scevgep239.us = getelementptr i64, i64* %2, i64 %101
  %_p_scalar_240.us = load i64, i64* %scevgep239.us, align 8, !alias.scope !178, !noalias !179, !llvm.mem.parallel_loop_access !180
  %102 = mul i64 %100, %conv
  %103 = add i64 %102, %96
  %scevgep241.us = getelementptr i64, i64* %3, i64 %103
  %_p_scalar_242.us = load i64, i64* %scevgep241.us, align 8, !alias.scope !177, !noalias !182, !llvm.mem.parallel_loop_access !180
  %p_mul29.us = mul nsw i64 %_p_scalar_242.us, %_p_scalar_240.us, !dbg !156
  %p_add30.us = add nsw i64 %p_mul29.us, %p_add30.lcssa272.us, !dbg !162
  %104 = or i64 %100, 1
  %105 = add i64 %104, %94
  %scevgep239.us.1 = getelementptr i64, i64* %2, i64 %105
  %_p_scalar_240.us.1 = load i64, i64* %scevgep239.us.1, align 8, !alias.scope !178, !noalias !179, !llvm.mem.parallel_loop_access !180
  %106 = mul i64 %104, %conv
  %107 = add i64 %106, %96
  %scevgep241.us.1 = getelementptr i64, i64* %3, i64 %107
  %_p_scalar_242.us.1 = load i64, i64* %scevgep241.us.1, align 8, !alias.scope !177, !noalias !182, !llvm.mem.parallel_loop_access !180
  %p_mul29.us.1 = mul nsw i64 %_p_scalar_242.us.1, %_p_scalar_240.us.1, !dbg !156
  %p_add30.us.1 = add nsw i64 %p_mul29.us.1, %p_add30.us, !dbg !162
  %108 = or i64 %100, 2
  %109 = add i64 %108, %94
  %scevgep239.us.2 = getelementptr i64, i64* %2, i64 %109
  %_p_scalar_240.us.2 = load i64, i64* %scevgep239.us.2, align 8, !alias.scope !178, !noalias !179, !llvm.mem.parallel_loop_access !180
  %110 = mul i64 %108, %conv
  %111 = add i64 %110, %96
  %scevgep241.us.2 = getelementptr i64, i64* %3, i64 %111
  %_p_scalar_242.us.2 = load i64, i64* %scevgep241.us.2, align 8, !alias.scope !177, !noalias !182, !llvm.mem.parallel_loop_access !180
  %p_mul29.us.2 = mul nsw i64 %_p_scalar_242.us.2, %_p_scalar_240.us.2, !dbg !156
  %p_add30.us.2 = add nsw i64 %p_mul29.us.2, %p_add30.us.1, !dbg !162
  %112 = or i64 %100, 3
  %113 = add i64 %112, %94
  %scevgep239.us.3 = getelementptr i64, i64* %2, i64 %113
  %_p_scalar_240.us.3 = load i64, i64* %scevgep239.us.3, align 8, !alias.scope !178, !noalias !179, !llvm.mem.parallel_loop_access !180
  %114 = mul i64 %112, %conv
  %115 = add i64 %114, %96
  %scevgep241.us.3 = getelementptr i64, i64* %3, i64 %115
  %_p_scalar_242.us.3 = load i64, i64* %scevgep241.us.3, align 8, !alias.scope !177, !noalias !182, !llvm.mem.parallel_loop_access !180
  %p_mul29.us.3 = mul nsw i64 %_p_scalar_242.us.3, %_p_scalar_240.us.3, !dbg !156
  %p_add30.us.3 = add nsw i64 %p_mul29.us.3, %p_add30.us.2, !dbg !162
  %polly.indvar_next228.us = add nuw nsw i64 %polly.indvar227.us, 1
  %polly.loop_cond230.us = icmp sgt i64 %polly.indvar227.us, %polly.adjust_ub229
  br i1 %polly.loop_cond230.us, label %polly.cond243.loopexit.us, label %polly.loop_header223.us

polly.loop_header249.us:                          ; preds = %polly.loop_header249.us, %polly.loop_header249.us.preheader.split.split
  %p_add30267273.us = phi i64 [ %p_add30267273.us.unr, %polly.loop_header249.us.preheader.split.split ], [ %p_add30267.us.1, %polly.loop_header249.us ]
  %polly.indvar253.us = phi i64 [ %polly.indvar253.us.unr, %polly.loop_header249.us.preheader.split.split ], [ %polly.indvar_next254.us.1, %polly.loop_header249.us ]
  %116 = add nsw i64 %polly.indvar253.us, %46
  %117 = add i64 %116, %94
  %scevgep262.us = getelementptr i64, i64* %2, i64 %117
  %_p_scalar_263.us = load i64, i64* %scevgep262.us, align 8, !alias.scope !178, !noalias !179, !llvm.mem.parallel_loop_access !183
  %118 = mul i64 %116, %conv
  %119 = add nsw i64 %118, %96
  %scevgep264.us = getelementptr i64, i64* %3, i64 %119
  %_p_scalar_265.us = load i64, i64* %scevgep264.us, align 8, !alias.scope !177, !noalias !182, !llvm.mem.parallel_loop_access !183
  %p_mul29266.us = mul nsw i64 %_p_scalar_265.us, %_p_scalar_263.us, !dbg !156
  %p_add30267.us = add nsw i64 %p_mul29266.us, %p_add30267273.us, !dbg !162
  %polly.indvar_next254.us = add nuw nsw i64 %polly.indvar253.us, 1
  %120 = add nsw i64 %polly.indvar_next254.us, %46
  %121 = add i64 %120, %94
  %scevgep262.us.1 = getelementptr i64, i64* %2, i64 %121
  %_p_scalar_263.us.1 = load i64, i64* %scevgep262.us.1, align 8, !alias.scope !178, !noalias !179, !llvm.mem.parallel_loop_access !183
  %122 = mul i64 %120, %conv
  %123 = add nsw i64 %122, %96
  %scevgep264.us.1 = getelementptr i64, i64* %3, i64 %123
  %_p_scalar_265.us.1 = load i64, i64* %scevgep264.us.1, align 8, !alias.scope !177, !noalias !182, !llvm.mem.parallel_loop_access !183
  %p_mul29266.us.1 = mul nsw i64 %_p_scalar_265.us.1, %_p_scalar_263.us.1, !dbg !156
  %p_add30267.us.1 = add nsw i64 %p_mul29266.us.1, %p_add30267.us, !dbg !162
  %polly.indvar_next254.us.1 = add nsw i64 %polly.indvar253.us, 2
  %exitcond361.1 = icmp eq i64 %polly.indvar_next254.us.1, %pexp.pdiv_r247
  br i1 %exitcond361.1, label %polly.merge244.loopexit.us.unr-lcssa, label %polly.loop_header249.us, !llvm.loop !184

polly.merge244.us:                                ; preds = %polly.cond243.loopexit.us, %polly.merge244.loopexit.us
  %polly.indvar_next218.us = add nuw nsw i64 %polly.indvar217.us, 1
  %polly.loop_cond220.us = icmp sgt i64 %polly.indvar217.us, %polly.adjust_ub219
  br i1 %polly.loop_cond220.us, label %polly.loop_exit215.loopexit, label %polly.loop_header213.us

polly.merge244.loopexit.us.unr-lcssa:             ; preds = %polly.loop_header249.us
  %p_add30267.us.1.lcssa = phi i64 [ %p_add30267.us.1, %polly.loop_header249.us ]
  br label %polly.merge244.loopexit.us

polly.merge244.loopexit.us:                       ; preds = %polly.loop_header249.us.preheader.split, %polly.merge244.loopexit.us.unr-lcssa
  %p_add30267.us.lcssa = phi i64 [ %p_add30267.us.lcssa.unr, %polly.loop_header249.us.preheader.split ], [ %p_add30267.us.1.lcssa, %polly.merge244.loopexit.us.unr-lcssa ]
  store i64 %p_add30267.us.lcssa, i64* %scevgep237238.us, align 8, !alias.scope !174, !noalias !176
  br label %polly.merge244.us

polly.cond243.loopexit.us:                        ; preds = %polly.loop_header223.us
  %p_add30.us.3.lcssa = phi i64 [ %p_add30.us.3, %polly.loop_header223.us ]
  store i64 %p_add30.us.3.lcssa, i64* %scevgep237238.us, align 8, !alias.scope !174, !noalias !176
  br i1 %brmerge350, label %polly.merge244.us, label %polly.loop_header249.us.preheader

polly.loop_header249.us.preheader:                ; preds = %polly.cond243.loopexit.us
  br i1 %lcmp.mod398, label %polly.loop_header249.us.preheader.split, label %polly.loop_header249.us.prol

polly.loop_header249.us.prol:                     ; preds = %polly.loop_header249.us.preheader
  %_p_scalar_263.us.prol = load i64, i64* %scevgep262.us.prol, align 8, !alias.scope !178, !noalias !179, !llvm.mem.parallel_loop_access !183
  %124 = add nsw i64 %48, %96
  %scevgep264.us.prol = getelementptr i64, i64* %3, i64 %124
  %_p_scalar_265.us.prol = load i64, i64* %scevgep264.us.prol, align 8, !alias.scope !177, !noalias !182, !llvm.mem.parallel_loop_access !183
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
  br i1 %91, label %polly.loop_exit215, label %polly.loop_header213.preheader392

polly.loop_header213.preheader392:                ; preds = %polly.loop_header213.preheader.split
  %125 = add i64 %46, %94
  %scevgep262.prol = getelementptr i64, i64* %2, i64 %125
  br label %polly.loop_header213

polly.loop_exit215.loopexit:                      ; preds = %polly.merge244.us
  br label %polly.loop_exit215

polly.loop_exit215.loopexit393:                   ; preds = %polly.merge244
  br label %polly.loop_exit215

polly.loop_exit215:                               ; preds = %polly.loop_exit215.loopexit393, %polly.loop_exit215.loopexit, %polly.loop_header213.preheader.split, %polly.loop_header204
  %polly.indvar_next209 = add nuw nsw i64 %polly.indvar208, 1
  %polly.loop_cond211 = icmp sgt i64 %polly.indvar208, %polly.adjust_ub210
  br i1 %polly.loop_cond211, label %polly.loop_exit206.loopexit, label %polly.loop_header204

polly.loop_header213:                             ; preds = %polly.loop_header213.preheader392, %polly.merge244
  %polly.indvar217 = phi i64 [ %polly.indvar_next218, %polly.merge244 ], [ 0, %polly.loop_header213.preheader392 ]
  br i1 %polly.loop_guard252, label %polly.merge244, label %polly.loop_header249.preheader

polly.merge244.loopexit.unr-lcssa:                ; preds = %polly.loop_header249
  %p_add30267.1.lcssa = phi i64 [ %p_add30267.1, %polly.loop_header249 ]
  br label %polly.merge244.loopexit

polly.merge244.loopexit:                          ; preds = %polly.loop_header249.preheader.split, %polly.merge244.loopexit.unr-lcssa
  %p_add30267.lcssa = phi i64 [ %p_add30267.lcssa.unr, %polly.loop_header249.preheader.split ], [ %p_add30267.1.lcssa, %polly.merge244.loopexit.unr-lcssa ]
  store i64 %p_add30267.lcssa, i64* %scevgep259260, align 8, !alias.scope !174, !noalias !176
  br label %polly.merge244

polly.merge244:                                   ; preds = %polly.merge244.loopexit, %polly.loop_header213
  %polly.indvar_next218 = add nuw nsw i64 %polly.indvar217, 1
  %polly.loop_cond220 = icmp sgt i64 %polly.indvar217, %polly.adjust_ub219
  br i1 %polly.loop_cond220, label %polly.loop_exit215.loopexit393, label %polly.loop_header213

polly.loop_header249.preheader:                   ; preds = %polly.loop_header213
  %126 = add nuw nsw i64 %polly.indvar217, %80
  %127 = shl i64 %126, 3
  %128 = add i64 %127, %93
  %scevgep259 = getelementptr i8, i8* %call, i64 %128
  %scevgep259260 = bitcast i8* %scevgep259 to i64*
  %scevgep259260.promoted = load i64, i64* %scevgep259260, align 8, !alias.scope !174, !noalias !176
  br i1 %lcmp.mod, label %polly.loop_header249.preheader.split, label %polly.loop_header249.prol

polly.loop_header249.prol:                        ; preds = %polly.loop_header249.preheader
  %_p_scalar_263.prol = load i64, i64* %scevgep262.prol, align 8, !alias.scope !178, !noalias !179, !llvm.mem.parallel_loop_access !183
  %129 = add nsw i64 %50, %126
  %scevgep264.prol = getelementptr i64, i64* %3, i64 %129
  %_p_scalar_265.prol = load i64, i64* %scevgep264.prol, align 8, !alias.scope !177, !noalias !182, !llvm.mem.parallel_loop_access !183
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
  %_p_scalar_263 = load i64, i64* %scevgep262, align 8, !alias.scope !178, !noalias !179, !llvm.mem.parallel_loop_access !183
  %132 = mul i64 %130, %conv
  %133 = add nsw i64 %132, %126
  %scevgep264 = getelementptr i64, i64* %3, i64 %133
  %_p_scalar_265 = load i64, i64* %scevgep264, align 8, !alias.scope !177, !noalias !182, !llvm.mem.parallel_loop_access !183
  %p_mul29266 = mul nsw i64 %_p_scalar_265, %_p_scalar_263, !dbg !156
  %p_add30267 = add nsw i64 %p_mul29266, %p_add30267273, !dbg !162
  %polly.indvar_next254 = add nuw nsw i64 %polly.indvar253, 1
  %134 = add nsw i64 %polly.indvar_next254, %46
  %135 = add i64 %134, %94
  %scevgep262.1 = getelementptr i64, i64* %2, i64 %135
  %_p_scalar_263.1 = load i64, i64* %scevgep262.1, align 8, !alias.scope !178, !noalias !179, !llvm.mem.parallel_loop_access !183
  %136 = mul i64 %134, %conv
  %137 = add nsw i64 %136, %126
  %scevgep264.1 = getelementptr i64, i64* %3, i64 %137
  %_p_scalar_265.1 = load i64, i64* %scevgep264.1, align 8, !alias.scope !177, !noalias !182, !llvm.mem.parallel_loop_access !183
  %p_mul29266.1 = mul nsw i64 %_p_scalar_265.1, %_p_scalar_263.1, !dbg !156
  %p_add30267.1 = add nsw i64 %p_mul29266.1, %p_add30267, !dbg !162
  %polly.indvar_next254.1 = add nsw i64 %polly.indvar253, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next254.1, %pexp.pdiv_r247
  br i1 %exitcond.1, label %polly.merge244.loopexit.unr-lcssa, label %polly.loop_header249, !llvm.loop !184
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %args) #3 !dbg !40 {
entry:
  %max = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !47, metadata !56), !dbg !185
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !48, metadata !56), !dbg !186
  %0 = bitcast i32* %max to i8*, !dbg !187
  call void @llvm.lifetime.start(i64 4, i8* %0) #5, !dbg !187
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 1, !dbg !188
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !188, !tbaa !189
  tail call void @llvm.dbg.value(metadata i32* %max, i64 0, metadata !49, metadata !190), !dbg !191
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %max) #5, !dbg !192
  %2 = load i32, i32* %max, align 4, !dbg !193, !tbaa !194
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !49, metadata !56), !dbg !191
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %2), !dbg !195
  %3 = load i32, i32* %max, align 4, !dbg !196, !tbaa !194
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !49, metadata !56), !dbg !191
  %call2 = call %struct.Matrix* @init(i32 %3, i32 %3), !dbg !197
  call void @llvm.dbg.value(metadata %struct.Matrix* %call2, i64 0, metadata !50, metadata !56), !dbg !199
  %4 = load i32, i32* %max, align 4, !dbg !200, !tbaa !194
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !49, metadata !56), !dbg !191
  %call3 = call %struct.Matrix* @init(i32 %4, i32 %4), !dbg !201
  call void @llvm.dbg.value(metadata %struct.Matrix* %call3, i64 0, metadata !51, metadata !56), !dbg !202
  %call4 = call %struct.Matrix* @mat_mult(%struct.Matrix* %call2, %struct.Matrix* %call3), !dbg !203
  call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !52, metadata !56), !dbg !204
  %5 = load i32, i32* %max, align 4, !dbg !205, !tbaa !194
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !49, metadata !56), !dbg !191
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %5, i32 %5), !dbg !206
  %6 = load i32, i32* %max, align 4, !dbg !207, !tbaa !194
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !49, metadata !56), !dbg !191
  %sub = add nsw i32 %6, -1, !dbg !208
  %add = mul i32 %6, %6, !dbg !209
  %sub8 = add nsw i32 %add, -1, !dbg !210
  %idxprom = sext i32 %sub8 to i64, !dbg !211
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0, !dbg !212
  %7 = load i64*, i64** %data, align 8, !dbg !212, !tbaa !85
  %arrayidx9 = getelementptr inbounds i64, i64* %7, i64 %idxprom, !dbg !211
  %8 = load i64, i64* %arrayidx9, align 8, !dbg !211, !tbaa !152
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call3, i64 0, i32 0, !dbg !213
  %9 = load i64*, i64** %data17, align 8, !dbg !213, !tbaa !85
  %arrayidx18 = getelementptr inbounds i64, i64* %9, i64 %idxprom, !dbg !214
  %10 = load i64, i64* %arrayidx18, align 8, !dbg !214, !tbaa !152
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !215
  %11 = load i64*, i64** %data26, align 8, !dbg !215, !tbaa !85
  %arrayidx27 = getelementptr inbounds i64, i64* %11, i64 %idxprom, !dbg !216
  %12 = load i64, i64* %arrayidx27, align 8, !dbg !216, !tbaa !152
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %6, i32 %sub, i64 %8, i32 %sub, i32 %6, i32 %sub, i64 %10, i32 %sub, i32 %6, i32 %sub, i64 %12), !dbg !217
  call void @llvm.lifetime.end(i64 4, i8* %0) #5, !dbg !218
  ret i32 0, !dbg !220
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
!98 = distinct !{!98}
!99 = distinct !{!99, !100, !"polly.alias.scope.call"}
!100 = distinct !{!100, !"polly.alias.scope.domain"}
!101 = !{!98, !102}
!102 = distinct !{!102}
!103 = !DILocation(line: 35, column: 47, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 34, column: 33)
!105 = distinct !DILexicalBlock(scope: !106, file: !1, line: 34, column: 9)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 34, column: 9)
!107 = distinct !DILexicalBlock(scope: !108, file: !1, line: 33, column: 30)
!108 = distinct !DILexicalBlock(scope: !109, file: !1, line: 33, column: 5)
!109 = distinct !DILexicalBlock(scope: !7, file: !1, line: 33, column: 5)
!110 = !{!98, !111}
!111 = distinct !{!111}
!112 = !DILocation(line: 47, column: 26, scope: !25)
!113 = !DILocation(line: 47, column: 37, scope: !25)
!114 = !DILocation(line: 49, column: 20, scope: !25)
!115 = !DILocation(line: 49, column: 9, scope: !25)
!116 = !DILocation(line: 50, column: 21, scope: !25)
!117 = !DILocation(line: 50, column: 9, scope: !25)
!118 = !DILocation(line: 51, column: 28, scope: !25)
!119 = !DILocation(line: 51, column: 16, scope: !25)
!120 = !DILocation(line: 52, column: 28, scope: !25)
!121 = !DILocation(line: 52, column: 16, scope: !25)
!122 = !DILocation(line: 53, column: 60, scope: !25)
!123 = !DILocation(line: 53, column: 59, scope: !25)
!124 = !DILocation(line: 53, column: 66, scope: !25)
!125 = !DILocation(line: 53, column: 65, scope: !25)
!126 = !DILocation(line: 53, column: 35, scope: !127)
!127 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 1)
!128 = !DILocation(line: 53, column: 23, scope: !25)
!129 = !DILocation(line: 53, column: 16, scope: !25)
!130 = !DILocation(line: 48, column: 9, scope: !25)
!131 = !DILocation(line: 55, column: 15, scope: !132)
!132 = !DILexicalBlockFile(scope: !133, file: !1, discriminator: 1)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 55, column: 5)
!134 = distinct !DILexicalBlock(scope: !25, file: !1, line: 55, column: 5)
!135 = !DILocation(line: 55, column: 5, scope: !132)
!136 = !DILocation(line: 56, column: 19, scope: !137)
!137 = !DILexicalBlockFile(scope: !138, file: !1, discriminator: 1)
!138 = distinct !DILexicalBlock(scope: !139, file: !1, line: 56, column: 9)
!139 = distinct !DILexicalBlock(scope: !140, file: !1, line: 56, column: 9)
!140 = distinct !DILexicalBlock(scope: !133, file: !1, line: 55, column: 29)
!141 = !DILocation(line: 56, column: 9, scope: !137)
!142 = !DILocation(line: 58, column: 13, scope: !143)
!143 = !DILexicalBlockFile(scope: !144, file: !1, discriminator: 1)
!144 = distinct !DILexicalBlock(scope: !145, file: !1, line: 58, column: 13)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 58, column: 13)
!146 = distinct !DILexicalBlock(scope: !138, file: !1, line: 56, column: 34)
!147 = !DILocation(line: 57, column: 19, scope: !146)
!148 = !DILocation(line: 59, column: 53, scope: !144)
!149 = !DILocation(line: 57, column: 25, scope: !146)
!150 = !DILocation(line: 57, column: 13, scope: !146)
!151 = !DILocation(line: 57, column: 29, scope: !146)
!152 = !{!153, !153, i64 0}
!153 = !{!"long long", !88, i64 0}
!154 = !DILocation(line: 48, column: 15, scope: !25)
!155 = !DILocation(line: 59, column: 73, scope: !144)
!156 = !DILocation(line: 59, column: 71, scope: !144)
!157 = !DILocation(line: 59, column: 33, scope: !144)
!158 = !DILocation(line: 59, column: 35, scope: !144)
!159 = !DILocation(line: 59, column: 67, scope: !144)
!160 = !DILocation(line: 59, column: 81, scope: !144)
!161 = !DILocation(line: 59, column: 87, scope: !144)
!162 = !DILocation(line: 59, column: 51, scope: !144)
!163 = !DILocation(line: 63, column: 17, scope: !127)
!164 = !DILocation(line: 63, column: 17, scope: !25)
!165 = !DILocation(line: 63, column: 13, scope: !25)
!166 = !DILocation(line: 64, column: 8, scope: !25)
!167 = !DILocation(line: 64, column: 14, scope: !25)
!168 = !DILocation(line: 65, column: 8, scope: !25)
!169 = !DILocation(line: 65, column: 15, scope: !25)
!170 = !DILocation(line: 66, column: 13, scope: !25)
!171 = !DILocation(line: 67, column: 5, scope: !25)
!172 = distinct !{!172}
!173 = distinct !{!173}
!174 = distinct !{!174, !175, !"polly.alias.scope.call"}
!175 = distinct !{!175, !"polly.alias.scope.domain"}
!176 = !{!177, !178}
!177 = distinct !{!177, !175, !"polly.alias.scope."}
!178 = distinct !{!178, !175, !"polly.alias.scope."}
!179 = !{!177, !174}
!180 = !{!173, !181}
!181 = distinct !{!181}
!182 = !{!178, !174}
!183 = !{!173, !184}
!184 = distinct !{!184}
!185 = !DILocation(line: 71, column: 14, scope: !40)
!186 = !DILocation(line: 71, column: 27, scope: !40)
!187 = !DILocation(line: 74, column: 5, scope: !40)
!188 = !DILocation(line: 75, column: 12, scope: !40)
!189 = !{!87, !87, i64 0}
!190 = !DIExpression(DW_OP_deref)
!191 = !DILocation(line: 74, column: 9, scope: !40)
!192 = !DILocation(line: 75, column: 5, scope: !40)
!193 = !DILocation(line: 76, column: 24, scope: !40)
!194 = !{!90, !90, i64 0}
!195 = !DILocation(line: 76, column: 5, scope: !40)
!196 = !DILocation(line: 78, column: 22, scope: !40)
!197 = !DILocation(line: 78, column: 17, scope: !198)
!198 = !DILexicalBlockFile(scope: !40, file: !1, discriminator: 1)
!199 = !DILocation(line: 78, column: 13, scope: !40)
!200 = !DILocation(line: 79, column: 22, scope: !40)
!201 = !DILocation(line: 79, column: 17, scope: !198)
!202 = !DILocation(line: 79, column: 13, scope: !40)
!203 = !DILocation(line: 81, column: 17, scope: !198)
!204 = !DILocation(line: 81, column: 13, scope: !40)
!205 = !DILocation(line: 83, column: 48, scope: !40)
!206 = !DILocation(line: 83, column: 5, scope: !40)
!207 = !DILocation(line: 85, column: 9, scope: !40)
!208 = !DILocation(line: 85, column: 12, scope: !40)
!209 = !DILocation(line: 85, column: 47, scope: !40)
!210 = !DILocation(line: 85, column: 51, scope: !40)
!211 = !DILocation(line: 85, column: 28, scope: !40)
!212 = !DILocation(line: 85, column: 31, scope: !40)
!213 = !DILocation(line: 86, column: 31, scope: !40)
!214 = !DILocation(line: 86, column: 28, scope: !40)
!215 = !DILocation(line: 87, column: 31, scope: !40)
!216 = !DILocation(line: 87, column: 28, scope: !40)
!217 = !DILocation(line: 84, column: 5, scope: !40)
!218 = !DILocation(line: 89, column: 1, scope: !219)
!219 = !DILexicalBlockFile(scope: !40, file: !1, discriminator: 3)
!220 = !DILocation(line: 88, column: 5, scope: !40)
