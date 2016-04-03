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
  %xtraiter198 = and i32 %height, 7, !dbg !76
  %lcmp.mod199 = icmp eq i32 %xtraiter198, 0, !dbg !76
  br i1 %lcmp.mod199, label %for.cond3.preheader.us.preheader.split, label %for.cond3.preheader.us.prol.preheader, !dbg !76

for.cond3.preheader.us.prol.preheader:            ; preds = %for.cond3.preheader.us.preheader
  br label %for.cond3.preheader.us.prol, !dbg !76

for.cond3.preheader.us.prol:                      ; preds = %for.cond3.preheader.us.prol.preheader, %for.cond3.preheader.us.prol
  %indvars.iv90.us.prol = phi i64 [ %indvars.iv.next91.us.prol, %for.cond3.preheader.us.prol ], [ 0, %for.cond3.preheader.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond3.preheader.us.prol ], [ %xtraiter198, %for.cond3.preheader.us.prol.preheader ]
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
  %exitcond187.7 = icmp eq i32 %lftr.wideiv.7, %height, !dbg !75
  br i1 %exitcond187.7, label %polly.start.loopexit.unr-lcssa, label %for.cond3.preheader.us, !dbg !75

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
  br label %polly.loop_header97

polly.loop_exit99.loopexit:                       ; preds = %polly.loop_exit108
  br label %polly.loop_exit99

polly.loop_exit99:                                ; preds = %polly.loop_exit99.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond185 = icmp eq i64 %polly.indvar, %polly.fdiv_q.shr
  br i1 %exitcond185, label %polly.exiting.loopexit, label %polly.loop_header, !llvm.loop !98

polly.loop_preheader:                             ; preds = %polly.start
  %28 = sext i32 %width to i64
  %29 = shl nsw i64 %28, 3
  %30 = add nsw i64 %28, -1
  %polly.fdiv_q.shr95 = ashr i64 %30, 5
  %polly.loop_guard100 = icmp sgt i64 %polly.fdiv_q.shr95, -1
  %pexp.p_div_q = lshr i64 %28, 2
  %31 = add nsw i64 %pexp.p_div_q, -1
  %32 = zext i32 %width to i64
  %pexp.pdiv_r = and i64 %32, 3
  %polly.loop_guard134 = icmp eq i64 %pexp.pdiv_r, 0
  %33 = sub nsw i64 %28, %pexp.pdiv_r
  %34 = add nsw i64 %pexp.pdiv_r, -1
  %xtraiter196 = and i64 %32, 1
  %lcmp.mod197 = icmp eq i64 %xtraiter196, 0
  %35 = shl nsw i64 %33, 3
  %36 = icmp eq i64 %34, 0
  %xtraiter = and i64 %32, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %37 = shl nsw i64 %33, 3
  %38 = icmp eq i64 %34, 0
  br label %polly.loop_header

polly.loop_header97:                              ; preds = %polly.loop_exit108, %polly.loop_header97.preheader
  %polly.indvar101 = phi i64 [ %polly.indvar_next102, %polly.loop_exit108 ], [ 0, %polly.loop_header97.preheader ]
  br i1 %polly.loop_guard109, label %polly.loop_header106.preheader, label %polly.loop_exit108

polly.loop_header106.preheader:                   ; preds = %polly.loop_header97
  %39 = mul nsw i64 %polly.indvar101, -8
  %40 = add nsw i64 %31, %39
  %41 = icmp sgt i64 %40, 7
  %42 = select i1 %41, i64 7, i64 %40
  %polly.loop_guard118 = icmp sgt i64 %42, -1
  %43 = shl i64 %polly.indvar101, 5
  %44 = or i64 %43, 31
  %45 = icmp slt i64 %44, %28
  %polly.adjust_ub121 = add i64 %42, -1
  br i1 %polly.loop_guard118, label %polly.loop_header106.us.preheader, label %polly.loop_header106.preheader.split

polly.loop_header106.us.preheader:                ; preds = %polly.loop_header106.preheader
  %brmerge = or i1 %45, %polly.loop_guard134
  br label %polly.loop_header106.us

polly.loop_header106.us:                          ; preds = %polly.loop_header106.us.preheader, %polly.merge.us
  %polly.indvar110.us = phi i64 [ %polly.indvar_next111.us, %polly.merge.us ], [ 0, %polly.loop_header106.us.preheader ]
  %46 = add nuw nsw i64 %polly.indvar110.us, %23
  %47 = mul i64 %46, %29
  br label %polly.loop_header115.us

polly.loop_header115.us:                          ; preds = %polly.loop_header106.us, %polly.loop_header115.us
  %polly.indvar119.us = phi i64 [ %polly.indvar_next120.us, %polly.loop_header115.us ], [ 0, %polly.loop_header106.us ]
  %48 = shl i64 %polly.indvar119.us, 2
  %49 = add nuw nsw i64 %48, %43
  %50 = shl i64 %49, 3
  %51 = add i64 %50, %47
  %scevgep.us = getelementptr i8, i8* %call, i64 %51
  %scevgep129.us = bitcast i8* %scevgep.us to i64*
  %_p_scalar_.us = load i64, i64* %scevgep129.us, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %p_add24.us = add nsw i64 %_p_scalar_.us, %46, !dbg !103
  store i64 %p_add24.us, i64* %scevgep129.us, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %52 = shl i64 %49, 3
  %53 = or i64 %52, 8
  %54 = add i64 %53, %47
  %scevgep.us.1 = getelementptr i8, i8* %call, i64 %54
  %scevgep129.us.1 = bitcast i8* %scevgep.us.1 to i64*
  %_p_scalar_.us.1 = load i64, i64* %scevgep129.us.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %p_add24.us.1 = add nsw i64 %_p_scalar_.us.1, %46, !dbg !103
  store i64 %p_add24.us.1, i64* %scevgep129.us.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %55 = shl i64 %49, 3
  %56 = or i64 %55, 16
  %57 = add i64 %56, %47
  %scevgep.us.2 = getelementptr i8, i8* %call, i64 %57
  %scevgep129.us.2 = bitcast i8* %scevgep.us.2 to i64*
  %_p_scalar_.us.2 = load i64, i64* %scevgep129.us.2, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %p_add24.us.2 = add nsw i64 %_p_scalar_.us.2, %46, !dbg !103
  store i64 %p_add24.us.2, i64* %scevgep129.us.2, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %58 = shl i64 %49, 3
  %59 = or i64 %58, 24
  %60 = add i64 %59, %47
  %scevgep.us.3 = getelementptr i8, i8* %call, i64 %60
  %scevgep129.us.3 = bitcast i8* %scevgep.us.3 to i64*
  %_p_scalar_.us.3 = load i64, i64* %scevgep129.us.3, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %p_add24.us.3 = add nsw i64 %_p_scalar_.us.3, %46, !dbg !103
  store i64 %p_add24.us.3, i64* %scevgep129.us.3, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !101
  %polly.indvar_next120.us = add nuw nsw i64 %polly.indvar119.us, 1
  %polly.loop_cond122.us = icmp sgt i64 %polly.indvar119.us, %polly.adjust_ub121
  br i1 %polly.loop_cond122.us, label %polly.cond.loopexit.us, label %polly.loop_header115.us

polly.loop_header131.us:                          ; preds = %polly.loop_header131.us, %polly.loop_header131.us.preheader.split.split
  %polly.indvar135.us = phi i64 [ %polly.indvar135.us.unr, %polly.loop_header131.us.preheader.split.split ], [ %polly.indvar_next136.us.1, %polly.loop_header131.us ]
  %61 = add nsw i64 %33, %polly.indvar135.us
  %62 = shl i64 %61, 3
  %63 = add i64 %62, %47
  %scevgep141.us = getelementptr i8, i8* %call, i64 %63
  %scevgep141142.us = bitcast i8* %scevgep141.us to i64*
  %_p_scalar_143.us = load i64, i64* %scevgep141142.us, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add24144.us = add nsw i64 %_p_scalar_143.us, %46, !dbg !103
  store i64 %p_add24144.us, i64* %scevgep141142.us, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next136.us = add nuw nsw i64 %polly.indvar135.us, 1
  %64 = add nsw i64 %33, %polly.indvar_next136.us
  %65 = shl i64 %64, 3
  %66 = add i64 %65, %47
  %scevgep141.us.1 = getelementptr i8, i8* %call, i64 %66
  %scevgep141142.us.1 = bitcast i8* %scevgep141.us.1 to i64*
  %_p_scalar_143.us.1 = load i64, i64* %scevgep141142.us.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add24144.us.1 = add nsw i64 %_p_scalar_143.us.1, %46, !dbg !103
  store i64 %p_add24144.us.1, i64* %scevgep141142.us.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next136.us.1 = add nsw i64 %polly.indvar135.us, 2
  %exitcond183.1 = icmp eq i64 %polly.indvar_next136.us.1, %pexp.pdiv_r
  br i1 %exitcond183.1, label %polly.merge.us.loopexit.unr-lcssa, label %polly.loop_header131.us, !llvm.loop !111

polly.merge.us.loopexit.unr-lcssa:                ; preds = %polly.loop_header131.us
  br label %polly.merge.us.loopexit

polly.merge.us.loopexit:                          ; preds = %polly.loop_header131.us.preheader.split, %polly.merge.us.loopexit.unr-lcssa
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next111.us = add nuw nsw i64 %polly.indvar110.us, 1
  %polly.loop_cond113.us = icmp sgt i64 %polly.indvar110.us, %polly.adjust_ub112
  br i1 %polly.loop_cond113.us, label %polly.loop_exit108.loopexit, label %polly.loop_header106.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header115.us
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header131.us.preheader

polly.loop_header131.us.preheader:                ; preds = %polly.cond.loopexit.us
  br i1 %lcmp.mod197, label %polly.loop_header131.us.preheader.split, label %polly.loop_header131.us.prol

polly.loop_header131.us.prol:                     ; preds = %polly.loop_header131.us.preheader
  %67 = add i64 %35, %47
  %scevgep141.us.prol = getelementptr i8, i8* %call, i64 %67
  %scevgep141142.us.prol = bitcast i8* %scevgep141.us.prol to i64*
  %_p_scalar_143.us.prol = load i64, i64* %scevgep141142.us.prol, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add24144.us.prol = add nsw i64 %_p_scalar_143.us.prol, %46, !dbg !103
  store i64 %p_add24144.us.prol, i64* %scevgep141142.us.prol, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  br label %polly.loop_header131.us.preheader.split

polly.loop_header131.us.preheader.split:          ; preds = %polly.loop_header131.us.preheader, %polly.loop_header131.us.prol
  %polly.indvar135.us.unr = phi i64 [ 0, %polly.loop_header131.us.preheader ], [ 1, %polly.loop_header131.us.prol ]
  br i1 %36, label %polly.merge.us.loopexit, label %polly.loop_header131.us.preheader.split.split

polly.loop_header131.us.preheader.split.split:    ; preds = %polly.loop_header131.us.preheader.split
  br label %polly.loop_header131.us

polly.loop_header106.preheader.split:             ; preds = %polly.loop_header106.preheader
  br i1 %45, label %polly.loop_exit108, label %polly.loop_header106.preheader194

polly.loop_header106.preheader194:                ; preds = %polly.loop_header106.preheader.split
  br label %polly.loop_header106

polly.loop_exit108.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit108

polly.loop_exit108.loopexit195:                   ; preds = %polly.merge
  br label %polly.loop_exit108

polly.loop_exit108:                               ; preds = %polly.loop_exit108.loopexit195, %polly.loop_exit108.loopexit, %polly.loop_header106.preheader.split, %polly.loop_header97
  %polly.indvar_next102 = add nuw nsw i64 %polly.indvar101, 1
  %exitcond184 = icmp eq i64 %polly.indvar101, %polly.fdiv_q.shr95
  br i1 %exitcond184, label %polly.loop_exit99.loopexit, label %polly.loop_header97

polly.loop_header106:                             ; preds = %polly.loop_header106.preheader194, %polly.merge
  %polly.indvar110 = phi i64 [ %polly.indvar_next111, %polly.merge ], [ 0, %polly.loop_header106.preheader194 ]
  br i1 %polly.loop_guard134, label %polly.merge, label %polly.loop_header131.preheader

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header131
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.loop_header131.preheader.split, %polly.merge.loopexit.unr-lcssa
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header106
  %polly.indvar_next111 = add nuw nsw i64 %polly.indvar110, 1
  %polly.loop_cond113 = icmp sgt i64 %polly.indvar110, %polly.adjust_ub112
  br i1 %polly.loop_cond113, label %polly.loop_exit108.loopexit195, label %polly.loop_header106

polly.loop_header131.preheader:                   ; preds = %polly.loop_header106
  %68 = add nuw nsw i64 %polly.indvar110, %23
  %69 = mul i64 %68, %29
  br i1 %lcmp.mod, label %polly.loop_header131.preheader.split, label %polly.loop_header131.prol

polly.loop_header131.prol:                        ; preds = %polly.loop_header131.preheader
  %70 = add i64 %37, %69
  %scevgep141.prol = getelementptr i8, i8* %call, i64 %70
  %scevgep141142.prol = bitcast i8* %scevgep141.prol to i64*
  %_p_scalar_143.prol = load i64, i64* %scevgep141142.prol, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add24144.prol = add nsw i64 %_p_scalar_143.prol, %68, !dbg !103
  store i64 %p_add24144.prol, i64* %scevgep141142.prol, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  br label %polly.loop_header131.preheader.split

polly.loop_header131.preheader.split:             ; preds = %polly.loop_header131.preheader, %polly.loop_header131.prol
  %polly.indvar135.unr = phi i64 [ 0, %polly.loop_header131.preheader ], [ 1, %polly.loop_header131.prol ]
  br i1 %38, label %polly.merge.loopexit, label %polly.loop_header131.preheader.split.split

polly.loop_header131.preheader.split.split:       ; preds = %polly.loop_header131.preheader.split
  br label %polly.loop_header131

polly.loop_header131:                             ; preds = %polly.loop_header131, %polly.loop_header131.preheader.split.split
  %polly.indvar135 = phi i64 [ %polly.indvar135.unr, %polly.loop_header131.preheader.split.split ], [ %polly.indvar_next136.1, %polly.loop_header131 ]
  %71 = add nsw i64 %33, %polly.indvar135
  %72 = shl i64 %71, 3
  %73 = add i64 %72, %69
  %scevgep141 = getelementptr i8, i8* %call, i64 %73
  %scevgep141142 = bitcast i8* %scevgep141 to i64*
  %_p_scalar_143 = load i64, i64* %scevgep141142, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add24144 = add nsw i64 %_p_scalar_143, %68, !dbg !103
  store i64 %p_add24144, i64* %scevgep141142, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next136 = add nuw nsw i64 %polly.indvar135, 1
  %74 = add nsw i64 %33, %polly.indvar_next136
  %75 = shl i64 %74, 3
  %76 = add i64 %75, %69
  %scevgep141.1 = getelementptr i8, i8* %call, i64 %76
  %scevgep141142.1 = bitcast i8* %scevgep141.1 to i64*
  %_p_scalar_143.1 = load i64, i64* %scevgep141142.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %p_add24144.1 = add nsw i64 %_p_scalar_143.1, %68, !dbg !103
  store i64 %p_add24144.1, i64* %scevgep141142.1, align 8, !alias.scope !99, !noalias !2, !llvm.mem.parallel_loop_access !110
  %polly.indvar_next136.1 = add nsw i64 %polly.indvar135, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next136.1, %pexp.pdiv_r
  br i1 %exitcond.1, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header131, !llvm.loop !111
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
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !29, metadata !57), !dbg !112
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !30, metadata !57), !dbg !113
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !114
  %0 = load i32, i32* %width1, align 8, !dbg !114, !tbaa !93
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !34, metadata !57), !dbg !115
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !116
  %1 = load i32, i32* %height2, align 4, !dbg !116, !tbaa !96
  tail call void @llvm.dbg.value(metadata i32 %1, i64 0, metadata !35, metadata !57), !dbg !117
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !118
  %2 = load i64*, i64** %data, align 8, !dbg !118, !tbaa !85
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !36, metadata !57), !dbg !119
  %data3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !120
  %3 = load i64*, i64** %data3, align 8, !dbg !120, !tbaa !85
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !37, metadata !57), !dbg !121
  %mul = mul nsw i32 %1, %0, !dbg !122
  %conv = sext i32 %mul to i64, !dbg !123
  %mul5 = shl nsw i64 %conv, 3, !dbg !124
  %call = tail call noalias i8* @malloc(i64 %mul5) #5, !dbg !125
  %4 = bitcast i8* %call to i64*, !dbg !127
  tail call void @llvm.dbg.value(metadata i64* %4, i64 0, metadata !38, metadata !57), !dbg !128
  %call9 = tail call noalias i8* @malloc(i64 %mul5) #5, !dbg !129
  %5 = bitcast i8* %call9 to i64*, !dbg !130
  tail call void @llvm.dbg.value(metadata i64* %5, i64 0, metadata !39, metadata !57), !dbg !131
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !32, metadata !57), !dbg !132
  %cmp134 = icmp sgt i32 %1, 0, !dbg !133
  %6 = sext i32 %0 to i64, !dbg !137
  br i1 %cmp134, label %for.cond11.preheader.lr.ph, label %polly.split_new_and_old, !dbg !137

for.cond11.preheader.lr.ph:                       ; preds = %entry
  %7 = icmp slt i32 %0, %1
  br i1 %7, label %for.cond11.preheader.preheader, label %polly.start314

for.cond11.preheader.preheader:                   ; preds = %for.cond11.preheader.lr.ph
  %cmp12132 = icmp sgt i32 %0, 0, !dbg !138
  br i1 %cmp12132, label %for.cond11.preheader.us.preheader, label %polly.split_new_and_old, !dbg !143

for.cond11.preheader.us.preheader:                ; preds = %for.cond11.preheader.preheader
  %8 = add i32 %0, -1, !dbg !144
  %xtraiter568 = and i32 %0, 3, !dbg !146
  %lcmp.mod569 = icmp eq i32 %xtraiter568, 0, !dbg !146
  %9 = icmp ult i32 %8, 3, !dbg !146
  br label %for.cond11.preheader.us, !dbg !144

for.cond11.preheader.us:                          ; preds = %for.cond11.preheader.us.preheader, %for.inc20.loopexit.us
  %indvars.iv155.us = phi i64 [ %indvars.iv.next156.us, %for.inc20.loopexit.us ], [ 0, %for.cond11.preheader.us.preheader ]
  %10 = mul nsw i64 %indvars.iv155.us, %6, !dbg !144
  br i1 %lcmp.mod569, label %for.cond11.preheader.us.split, label %for.body14.us.prol.preheader, !dbg !146

for.body14.us.prol.preheader:                     ; preds = %for.cond11.preheader.us
  br label %for.body14.us.prol, !dbg !146

for.body14.us.prol:                               ; preds = %for.body14.us.prol, %for.body14.us.prol.preheader
  %indvars.iv148.us.prol = phi i64 [ %indvars.iv.next149.us.prol, %for.body14.us.prol ], [ 0, %for.body14.us.prol.preheader ]
  %prol.iter570 = phi i32 [ %prol.iter570.sub, %for.body14.us.prol ], [ %xtraiter568, %for.body14.us.prol.preheader ]
  %11 = mul nsw i64 %indvars.iv148.us.prol, %6, !dbg !146
  %12 = add nsw i64 %11, %indvars.iv155.us, !dbg !147
  %arrayidx.us.prol = getelementptr inbounds i64, i64* %3, i64 %12, !dbg !148
  %13 = load i64, i64* %arrayidx.us.prol, align 8, !dbg !148, !tbaa !149
  %14 = add nsw i64 %indvars.iv148.us.prol, %10, !dbg !151
  %arrayidx19.us.prol = getelementptr inbounds i64, i64* %5, i64 %14, !dbg !152
  store i64 %13, i64* %arrayidx19.us.prol, align 8, !dbg !153, !tbaa !149
  %indvars.iv.next149.us.prol = add nuw nsw i64 %indvars.iv148.us.prol, 1, !dbg !143
  %prol.iter570.sub = add i32 %prol.iter570, -1, !dbg !143
  %prol.iter570.cmp = icmp eq i32 %prol.iter570.sub, 0, !dbg !143
  br i1 %prol.iter570.cmp, label %for.cond11.preheader.us.split.loopexit, label %for.body14.us.prol, !dbg !143, !llvm.loop !154

for.cond11.preheader.us.split.loopexit:           ; preds = %for.body14.us.prol
  %indvars.iv.next149.us.prol.lcssa = phi i64 [ %indvars.iv.next149.us.prol, %for.body14.us.prol ]
  br label %for.cond11.preheader.us.split, !dbg !146

for.cond11.preheader.us.split:                    ; preds = %for.cond11.preheader.us, %for.cond11.preheader.us.split.loopexit
  %indvars.iv148.us.unr = phi i64 [ 0, %for.cond11.preheader.us ], [ %indvars.iv.next149.us.prol.lcssa, %for.cond11.preheader.us.split.loopexit ]
  br i1 %9, label %for.inc20.loopexit.us, label %for.cond11.preheader.us.split.split, !dbg !146

for.cond11.preheader.us.split.split:              ; preds = %for.cond11.preheader.us.split
  br label %for.body14.us, !dbg !146

for.body14.us:                                    ; preds = %for.body14.us, %for.cond11.preheader.us.split.split
  %indvars.iv148.us = phi i64 [ %indvars.iv148.us.unr, %for.cond11.preheader.us.split.split ], [ %indvars.iv.next149.us.3, %for.body14.us ]
  %15 = mul nsw i64 %indvars.iv148.us, %6, !dbg !146
  %16 = add nsw i64 %15, %indvars.iv155.us, !dbg !147
  %arrayidx.us = getelementptr inbounds i64, i64* %3, i64 %16, !dbg !148
  %17 = load i64, i64* %arrayidx.us, align 8, !dbg !148, !tbaa !149
  %18 = add nsw i64 %indvars.iv148.us, %10, !dbg !151
  %arrayidx19.us = getelementptr inbounds i64, i64* %5, i64 %18, !dbg !152
  store i64 %17, i64* %arrayidx19.us, align 8, !dbg !153, !tbaa !149
  %indvars.iv.next149.us = add nuw nsw i64 %indvars.iv148.us, 1, !dbg !143
  %19 = mul nsw i64 %indvars.iv.next149.us, %6, !dbg !146
  %20 = add nsw i64 %19, %indvars.iv155.us, !dbg !147
  %arrayidx.us.1 = getelementptr inbounds i64, i64* %3, i64 %20, !dbg !148
  %21 = load i64, i64* %arrayidx.us.1, align 8, !dbg !148, !tbaa !149
  %22 = add nsw i64 %indvars.iv.next149.us, %10, !dbg !151
  %arrayidx19.us.1 = getelementptr inbounds i64, i64* %5, i64 %22, !dbg !152
  store i64 %21, i64* %arrayidx19.us.1, align 8, !dbg !153, !tbaa !149
  %indvars.iv.next149.us.1 = add nsw i64 %indvars.iv148.us, 2, !dbg !143
  %23 = mul nsw i64 %indvars.iv.next149.us.1, %6, !dbg !146
  %24 = add nsw i64 %23, %indvars.iv155.us, !dbg !147
  %arrayidx.us.2 = getelementptr inbounds i64, i64* %3, i64 %24, !dbg !148
  %25 = load i64, i64* %arrayidx.us.2, align 8, !dbg !148, !tbaa !149
  %26 = add nsw i64 %indvars.iv.next149.us.1, %10, !dbg !151
  %arrayidx19.us.2 = getelementptr inbounds i64, i64* %5, i64 %26, !dbg !152
  store i64 %25, i64* %arrayidx19.us.2, align 8, !dbg !153, !tbaa !149
  %indvars.iv.next149.us.2 = add nsw i64 %indvars.iv148.us, 3, !dbg !143
  %27 = mul nsw i64 %indvars.iv.next149.us.2, %6, !dbg !146
  %28 = add nsw i64 %27, %indvars.iv155.us, !dbg !147
  %arrayidx.us.3 = getelementptr inbounds i64, i64* %3, i64 %28, !dbg !148
  %29 = load i64, i64* %arrayidx.us.3, align 8, !dbg !148, !tbaa !149
  %30 = add nsw i64 %indvars.iv.next149.us.2, %10, !dbg !151
  %arrayidx19.us.3 = getelementptr inbounds i64, i64* %5, i64 %30, !dbg !152
  store i64 %29, i64* %arrayidx19.us.3, align 8, !dbg !153, !tbaa !149
  %indvars.iv.next149.us.3 = add nsw i64 %indvars.iv148.us, 4, !dbg !143
  %lftr.wideiv524.3 = trunc i64 %indvars.iv.next149.us.3 to i32, !dbg !143
  %exitcond525.3 = icmp eq i32 %lftr.wideiv524.3, %0, !dbg !143
  br i1 %exitcond525.3, label %for.inc20.loopexit.us.unr-lcssa, label %for.body14.us, !dbg !143

for.inc20.loopexit.us.unr-lcssa:                  ; preds = %for.body14.us
  br label %for.inc20.loopexit.us, !dbg !137

for.inc20.loopexit.us:                            ; preds = %for.cond11.preheader.us.split, %for.inc20.loopexit.us.unr-lcssa
  %indvars.iv.next156.us = add nuw nsw i64 %indvars.iv155.us, 1, !dbg !137
  %lftr.wideiv526 = trunc i64 %indvars.iv.next156.us to i32, !dbg !137
  %exitcond527 = icmp eq i32 %lftr.wideiv526, %1, !dbg !137
  br i1 %exitcond527, label %polly.split_new_and_old.loopexit, label %for.cond11.preheader.us, !dbg !137

polly.split_new_and_old.loopexit:                 ; preds = %for.inc20.loopexit.us
  br label %polly.split_new_and_old

polly.split_new_and_old.loopexit558:              ; preds = %polly.loop_exit330
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %polly.split_new_and_old.loopexit558, %polly.split_new_and_old.loopexit, %entry, %for.cond11.preheader.preheader, %polly.start314
  %31 = icmp sge i32 %0, %1
  %32 = add nsw i64 %6, -1
  %polly.access.mul. = mul i64 %32, %6
  %polly.access.add. = mul nsw i64 %6, %6
  %polly.access. = getelementptr i64, i64* %2, i64 %polly.access.add.
  %33 = icmp ule i64* %polly.access., %4
  %34 = sext i32 %1 to i64
  %polly.access.add.call162 = add i64 %polly.access.mul., %34
  %polly.access.call163 = getelementptr i64, i64* %4, i64 %polly.access.add.call162
  %35 = icmp ule i64* %polly.access.call163, %2
  %36 = or i1 %33, %35
  %37 = and i1 %31, %36
  br i1 %37, label %polly.start, label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %polly.split_new_and_old
  %cmp28127 = icmp sgt i32 %0, 0, !dbg !155
  %or.cond = and i1 %cmp134, %cmp28127, !dbg !162
  br i1 %or.cond, label %for.cond27.preheader.us.preheader, label %for.end65, !dbg !162

for.cond27.preheader.us.preheader:                ; preds = %for.cond23.preheader
  %xtraiter566 = and i32 %0, 1, !dbg !164
  %lcmp.mod567 = icmp eq i32 %xtraiter566, 0, !dbg !164
  %38 = icmp eq i32 %0, 1, !dbg !164
  br label %for.cond27.preheader.us, !dbg !169

for.cond27.preheader.us:                          ; preds = %for.cond27.preheader.us.preheader, %for.inc63.loopexit.us-lcssa.us.us
  %indvars.iv144.us = phi i64 [ %indvars.iv.next145.us, %for.inc63.loopexit.us-lcssa.us.us ], [ 0, %for.cond27.preheader.us.preheader ]
  br label %for.body30.us.us, !dbg !169

for.body30.us.us:                                 ; preds = %for.cond27.preheader.us, %for.inc60.loopexit.us.us
  %indvars.iv138.us.us = phi i64 [ %indvars.iv.next139.us.us, %for.inc60.loopexit.us.us ], [ 0, %for.cond27.preheader.us ]
  %39 = mul nsw i64 %indvars.iv138.us.us, %6, !dbg !169
  %40 = add nsw i64 %39, %indvars.iv144.us, !dbg !170
  %arrayidx34.us.us = getelementptr inbounds i64, i64* %4, i64 %40, !dbg !171
  store i64 0, i64* %arrayidx34.us.us, align 8, !dbg !172, !tbaa !149
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !33, metadata !57), !dbg !173
  br i1 %lcmp.mod567, label %for.body30.us.us.split, label %for.body38.us.us.prol, !dbg !164

for.body38.us.us.prol:                            ; preds = %for.body30.us.us
  %arrayidx46.us.us.prol = getelementptr inbounds i64, i64* %2, i64 %39, !dbg !174
  %41 = load i64, i64* %arrayidx46.us.us.prol, align 8, !dbg !174, !tbaa !149
  %arrayidx50.us.us.prol = getelementptr inbounds i64, i64* %5, i64 %39, !dbg !175
  %42 = load i64, i64* %arrayidx50.us.us.prol, align 8, !dbg !175, !tbaa !149
  %mul51.us.us.prol = mul nsw i64 %42, %41, !dbg !176
  store i64 %mul51.us.us.prol, i64* %arrayidx34.us.us, align 8, !dbg !177, !tbaa !149
  br label %for.body30.us.us.split, !dbg !178

for.body30.us.us.split:                           ; preds = %for.body30.us.us, %for.body38.us.us.prol
  %.unr = phi i64 [ 0, %for.body30.us.us ], [ %mul51.us.us.prol, %for.body38.us.us.prol ]
  %indvars.iv.us.us.unr = phi i64 [ 0, %for.body30.us.us ], [ 1, %for.body38.us.us.prol ]
  br i1 %38, label %for.inc60.loopexit.us.us, label %for.body30.us.us.split.split, !dbg !164

for.body30.us.us.split.split:                     ; preds = %for.body30.us.us.split
  br label %for.body38.us.us, !dbg !164

for.inc60.loopexit.us.us.unr-lcssa:               ; preds = %for.body38.us.us
  br label %for.inc60.loopexit.us.us, !dbg !180

for.inc60.loopexit.us.us:                         ; preds = %for.body30.us.us.split, %for.inc60.loopexit.us.us.unr-lcssa
  %indvars.iv.next139.us.us = add nuw nsw i64 %indvars.iv138.us.us, 1, !dbg !180
  %lftr.wideiv518 = trunc i64 %indvars.iv.next139.us.us to i32, !dbg !180
  %exitcond519 = icmp eq i32 %lftr.wideiv518, %0, !dbg !180
  br i1 %exitcond519, label %for.inc63.loopexit.us-lcssa.us.us, label %for.body30.us.us, !dbg !180

for.body38.us.us:                                 ; preds = %for.body38.us.us, %for.body30.us.us.split.split
  %43 = phi i64 [ %.unr, %for.body30.us.us.split.split ], [ %add52.us.us.1, %for.body38.us.us ], !dbg !164
  %indvars.iv.us.us = phi i64 [ %indvars.iv.us.us.unr, %for.body30.us.us.split.split ], [ %indvars.iv.next.us.us.1, %for.body38.us.us ]
  %44 = add nsw i64 %indvars.iv.us.us, %39, !dbg !181
  %arrayidx46.us.us = getelementptr inbounds i64, i64* %2, i64 %44, !dbg !174
  %45 = load i64, i64* %arrayidx46.us.us, align 8, !dbg !174, !tbaa !149
  %arrayidx50.us.us = getelementptr inbounds i64, i64* %5, i64 %44, !dbg !175
  %46 = load i64, i64* %arrayidx50.us.us, align 8, !dbg !175, !tbaa !149
  %mul51.us.us = mul nsw i64 %46, %45, !dbg !176
  %add52.us.us = add nsw i64 %mul51.us.us, %43, !dbg !182
  store i64 %add52.us.us, i64* %arrayidx34.us.us, align 8, !dbg !177, !tbaa !149
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1, !dbg !178
  %47 = add nsw i64 %indvars.iv.next.us.us, %39, !dbg !181
  %arrayidx46.us.us.1 = getelementptr inbounds i64, i64* %2, i64 %47, !dbg !174
  %48 = load i64, i64* %arrayidx46.us.us.1, align 8, !dbg !174, !tbaa !149
  %arrayidx50.us.us.1 = getelementptr inbounds i64, i64* %5, i64 %47, !dbg !175
  %49 = load i64, i64* %arrayidx50.us.us.1, align 8, !dbg !175, !tbaa !149
  %mul51.us.us.1 = mul nsw i64 %49, %48, !dbg !176
  %add52.us.us.1 = add nsw i64 %mul51.us.us.1, %add52.us.us, !dbg !182
  store i64 %add52.us.us.1, i64* %arrayidx34.us.us, align 8, !dbg !177, !tbaa !149
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv.us.us, 2, !dbg !178
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.us.us.1 to i32, !dbg !178
  %exitcond517.1 = icmp eq i32 %lftr.wideiv.1, %0, !dbg !178
  br i1 %exitcond517.1, label %for.inc60.loopexit.us.us.unr-lcssa, label %for.body38.us.us, !dbg !178

for.inc63.loopexit.us-lcssa.us.us:                ; preds = %for.inc60.loopexit.us.us
  %indvars.iv.next145.us = add nuw nsw i64 %indvars.iv144.us, 1, !dbg !162
  %lftr.wideiv520 = trunc i64 %indvars.iv.next145.us to i32, !dbg !162
  %exitcond521 = icmp eq i32 %lftr.wideiv520, %1, !dbg !162
  br i1 %exitcond521, label %for.end65.loopexit555, label %for.cond27.preheader.us, !dbg !162

for.end65.loopexit:                               ; preds = %polly.loop_exit230
  br label %for.end65, !dbg !183

for.end65.loopexit555:                            ; preds = %for.inc63.loopexit.us-lcssa.us.us
  br label %for.end65, !dbg !183

for.end65:                                        ; preds = %for.end65.loopexit555, %for.end65.loopexit, %polly.start, %for.cond23.preheader
  %call66 = tail call noalias i8* @malloc(i64 16) #5, !dbg !183
  %50 = bitcast i8* %call66 to %struct.Matrix*, !dbg !184
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %50, i64 0, metadata !40, metadata !57), !dbg !185
  %width67 = getelementptr inbounds i8, i8* %call66, i64 8, !dbg !186
  %51 = bitcast i8* %width67 to i32*, !dbg !186
  store i32 %0, i32* %51, align 8, !dbg !187, !tbaa !93
  %height68 = getelementptr inbounds i8, i8* %call66, i64 12, !dbg !188
  %52 = bitcast i8* %height68 to i32*, !dbg !188
  store i32 %1, i32* %52, align 4, !dbg !189, !tbaa !96
  %53 = bitcast i8* %call66 to i8**, !dbg !190
  store i8* %call, i8** %53, align 8, !dbg !190, !tbaa !85
  ret %struct.Matrix* %50, !dbg !191

polly.start:                                      ; preds = %polly.split_new_and_old
  %54 = add nsw i64 %34, -1
  %polly.fdiv_q.shr = ashr i64 %54, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %for.end65

polly.loop_header:                                ; preds = %polly.loop_exit171, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit171 ]
  br i1 %polly.loop_guard172, label %polly.loop_header169.preheader, label %polly.loop_exit171

polly.loop_header169.preheader:                   ; preds = %polly.loop_header
  %55 = shl nsw i64 %polly.indvar, 5
  %56 = sub nsw i64 %34, %55
  %57 = add nsw i64 %56, -1
  %58 = icmp sgt i64 %57, 31
  %59 = select i1 %58, i64 31, i64 %57
  %polly.loop_guard181 = icmp sgt i64 %59, -1
  %polly.adjust_ub184 = add i64 %59, -1
  br label %polly.loop_header169

polly.loop_exit171.loopexit:                      ; preds = %polly.loop_exit180
  br label %polly.loop_exit171

polly.loop_exit171:                               ; preds = %polly.loop_exit171.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond516 = icmp eq i64 %polly.indvar_next, %65
  br i1 %exitcond516, label %polly.loop_preheader219, label %polly.loop_header, !llvm.loop !192

polly.loop_preheader:                             ; preds = %polly.start
  %60 = shl nsw i64 %6, 3
  %polly.fdiv_q.shr167 = ashr i64 %32, 5
  %polly.loop_guard172 = icmp sgt i64 %polly.fdiv_q.shr167, -1
  %pexp.p_div_q = lshr i64 %6, 2
  %61 = add nsw i64 %pexp.p_div_q, -1
  %62 = zext i32 %0 to i64
  %pexp.pdiv_r = and i64 %62, 3
  %polly.loop_guard206 = icmp eq i64 %pexp.pdiv_r, 0
  %63 = sub nsw i64 %6, %pexp.pdiv_r
  %64 = add nsw i64 %polly.fdiv_q.shr167, 1
  %65 = add nsw i64 %polly.fdiv_q.shr, 1
  %66 = add nsw i64 %pexp.pdiv_r, -1
  %xtraiter563 = and i64 %62, 3
  %lcmp.mod564 = icmp eq i64 %xtraiter563, 0
  %67 = icmp ult i64 %66, 3
  %xtraiter561 = and i64 %62, 3
  %lcmp.mod562 = icmp eq i64 %xtraiter561, 0
  %68 = icmp ult i64 %66, 3
  br label %polly.loop_header

polly.loop_header169:                             ; preds = %polly.loop_exit180, %polly.loop_header169.preheader
  %polly.indvar173 = phi i64 [ %polly.indvar_next174, %polly.loop_exit180 ], [ 0, %polly.loop_header169.preheader ]
  br i1 %polly.loop_guard181, label %polly.loop_header178.preheader, label %polly.loop_exit180

polly.loop_header178.preheader:                   ; preds = %polly.loop_header169
  %69 = mul nsw i64 %polly.indvar173, -8
  %70 = add nsw i64 %61, %69
  %71 = icmp sgt i64 %70, 7
  %72 = select i1 %71, i64 7, i64 %70
  %polly.loop_guard190 = icmp sgt i64 %72, -1
  %73 = shl i64 %polly.indvar173, 5
  %polly.adjust_ub193 = add i64 %72, -1
  %74 = or i64 %73, 31
  %75 = icmp slt i64 %74, %6
  br i1 %polly.loop_guard190, label %polly.loop_header178.us.preheader, label %polly.loop_header178.preheader.split

polly.loop_header178.us.preheader:                ; preds = %polly.loop_header178.preheader
  %brmerge = or i1 %75, %polly.loop_guard206
  br label %polly.loop_header178.us

polly.loop_header178.us:                          ; preds = %polly.loop_header178.us.preheader, %polly.merge.us
  %polly.indvar182.us = phi i64 [ %polly.indvar_next183.us, %polly.merge.us ], [ 0, %polly.loop_header178.us.preheader ]
  %76 = add nuw nsw i64 %polly.indvar182.us, %55
  %77 = shl i64 %76, 3
  br label %polly.loop_header187.us

polly.loop_header187.us:                          ; preds = %polly.loop_header178.us, %polly.loop_header187.us
  %polly.indvar191.us = phi i64 [ %polly.indvar_next192.us, %polly.loop_header187.us ], [ 0, %polly.loop_header178.us ]
  %78 = shl i64 %polly.indvar191.us, 2
  %79 = add nuw nsw i64 %78, %73
  %80 = mul i64 %79, %60
  %81 = add i64 %80, %77
  %scevgep.us = getelementptr i8, i8* %call, i64 %81
  %scevgep201.us = bitcast i8* %scevgep.us to i64*
  store i64 0, i64* %scevgep201.us, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !198
  %82 = or i64 %79, 1
  %83 = mul i64 %82, %60
  %84 = add i64 %83, %77
  %scevgep.us.1 = getelementptr i8, i8* %call, i64 %84
  %scevgep201.us.1 = bitcast i8* %scevgep.us.1 to i64*
  store i64 0, i64* %scevgep201.us.1, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !198
  %85 = or i64 %79, 2
  %86 = mul i64 %85, %60
  %87 = add i64 %86, %77
  %scevgep.us.2 = getelementptr i8, i8* %call, i64 %87
  %scevgep201.us.2 = bitcast i8* %scevgep.us.2 to i64*
  store i64 0, i64* %scevgep201.us.2, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !198
  %88 = or i64 %79, 3
  %89 = mul i64 %88, %60
  %90 = add i64 %89, %77
  %scevgep.us.3 = getelementptr i8, i8* %call, i64 %90
  %scevgep201.us.3 = bitcast i8* %scevgep.us.3 to i64*
  store i64 0, i64* %scevgep201.us.3, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !198
  %polly.indvar_next192.us = add nuw nsw i64 %polly.indvar191.us, 1
  %polly.loop_cond194.us = icmp sgt i64 %polly.indvar191.us, %polly.adjust_ub193
  br i1 %polly.loop_cond194.us, label %polly.cond.loopexit.us, label %polly.loop_header187.us

polly.loop_header203.us:                          ; preds = %polly.loop_header203.us, %polly.loop_header203.us.preheader.split.split
  %polly.indvar207.us = phi i64 [ %polly.indvar207.us.unr, %polly.loop_header203.us.preheader.split.split ], [ %polly.indvar_next208.us.3, %polly.loop_header203.us ]
  %91 = add nsw i64 %63, %polly.indvar207.us
  %92 = mul i64 %91, %60
  %93 = add i64 %92, %77
  %scevgep213.us = getelementptr i8, i8* %call, i64 %93
  %scevgep213214.us = bitcast i8* %scevgep213.us to i64*
  store i64 0, i64* %scevgep213214.us, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !200
  %polly.indvar_next208.us = add nuw nsw i64 %polly.indvar207.us, 1
  %94 = add nsw i64 %63, %polly.indvar_next208.us
  %95 = mul i64 %94, %60
  %96 = add i64 %95, %77
  %scevgep213.us.1 = getelementptr i8, i8* %call, i64 %96
  %scevgep213214.us.1 = bitcast i8* %scevgep213.us.1 to i64*
  store i64 0, i64* %scevgep213214.us.1, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !200
  %polly.indvar_next208.us.1 = add nsw i64 %polly.indvar207.us, 2
  %97 = add nsw i64 %63, %polly.indvar_next208.us.1
  %98 = mul i64 %97, %60
  %99 = add i64 %98, %77
  %scevgep213.us.2 = getelementptr i8, i8* %call, i64 %99
  %scevgep213214.us.2 = bitcast i8* %scevgep213.us.2 to i64*
  store i64 0, i64* %scevgep213214.us.2, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !200
  %polly.indvar_next208.us.2 = add nsw i64 %polly.indvar207.us, 3
  %100 = add nsw i64 %63, %polly.indvar_next208.us.2
  %101 = mul i64 %100, %60
  %102 = add i64 %101, %77
  %scevgep213.us.3 = getelementptr i8, i8* %call, i64 %102
  %scevgep213214.us.3 = bitcast i8* %scevgep213.us.3 to i64*
  store i64 0, i64* %scevgep213214.us.3, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !200
  %polly.indvar_next208.us.3 = add nsw i64 %polly.indvar207.us, 4
  %exitcond514.3 = icmp eq i64 %polly.indvar_next208.us.3, %pexp.pdiv_r
  br i1 %exitcond514.3, label %polly.merge.us.loopexit.unr-lcssa, label %polly.loop_header203.us, !llvm.loop !201

polly.merge.us.loopexit.unr-lcssa:                ; preds = %polly.loop_header203.us
  br label %polly.merge.us.loopexit

polly.merge.us.loopexit:                          ; preds = %polly.loop_header203.us.preheader.split, %polly.merge.us.loopexit.unr-lcssa
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next183.us = add nuw nsw i64 %polly.indvar182.us, 1
  %polly.loop_cond185.us = icmp sgt i64 %polly.indvar182.us, %polly.adjust_ub184
  br i1 %polly.loop_cond185.us, label %polly.loop_exit180.loopexit, label %polly.loop_header178.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header187.us
  br i1 %brmerge, label %polly.merge.us, label %polly.loop_header203.us.preheader

polly.loop_header203.us.preheader:                ; preds = %polly.cond.loopexit.us
  br i1 %lcmp.mod564, label %polly.loop_header203.us.preheader.split, label %polly.loop_header203.us.prol.preheader

polly.loop_header203.us.prol.preheader:           ; preds = %polly.loop_header203.us.preheader
  br label %polly.loop_header203.us.prol

polly.loop_header203.us.prol:                     ; preds = %polly.loop_header203.us.prol, %polly.loop_header203.us.prol.preheader
  %polly.indvar207.us.prol = phi i64 [ %polly.indvar_next208.us.prol, %polly.loop_header203.us.prol ], [ 0, %polly.loop_header203.us.prol.preheader ]
  %prol.iter565 = phi i64 [ %prol.iter565.sub, %polly.loop_header203.us.prol ], [ %xtraiter563, %polly.loop_header203.us.prol.preheader ]
  %103 = add nsw i64 %63, %polly.indvar207.us.prol
  %104 = mul i64 %103, %60
  %105 = add i64 %104, %77
  %scevgep213.us.prol = getelementptr i8, i8* %call, i64 %105
  %scevgep213214.us.prol = bitcast i8* %scevgep213.us.prol to i64*
  store i64 0, i64* %scevgep213214.us.prol, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !200
  %polly.indvar_next208.us.prol = add nuw nsw i64 %polly.indvar207.us.prol, 1
  %prol.iter565.sub = add i64 %prol.iter565, -1
  %prol.iter565.cmp = icmp eq i64 %prol.iter565.sub, 0
  br i1 %prol.iter565.cmp, label %polly.loop_header203.us.preheader.split.loopexit, label %polly.loop_header203.us.prol, !llvm.loop !202

polly.loop_header203.us.preheader.split.loopexit: ; preds = %polly.loop_header203.us.prol
  %polly.indvar_next208.us.prol.lcssa = phi i64 [ %polly.indvar_next208.us.prol, %polly.loop_header203.us.prol ]
  br label %polly.loop_header203.us.preheader.split

polly.loop_header203.us.preheader.split:          ; preds = %polly.loop_header203.us.preheader, %polly.loop_header203.us.preheader.split.loopexit
  %polly.indvar207.us.unr = phi i64 [ 0, %polly.loop_header203.us.preheader ], [ %polly.indvar_next208.us.prol.lcssa, %polly.loop_header203.us.preheader.split.loopexit ]
  br i1 %67, label %polly.merge.us.loopexit, label %polly.loop_header203.us.preheader.split.split

polly.loop_header203.us.preheader.split.split:    ; preds = %polly.loop_header203.us.preheader.split
  br label %polly.loop_header203.us

polly.loop_header178.preheader.split:             ; preds = %polly.loop_header178.preheader
  br i1 %75, label %polly.loop_exit180, label %polly.loop_header178.preheader553

polly.loop_header178.preheader553:                ; preds = %polly.loop_header178.preheader.split
  br label %polly.loop_header178

polly.loop_exit180.loopexit:                      ; preds = %polly.merge.us
  br label %polly.loop_exit180

polly.loop_exit180.loopexit554:                   ; preds = %polly.merge
  br label %polly.loop_exit180

polly.loop_exit180:                               ; preds = %polly.loop_exit180.loopexit554, %polly.loop_exit180.loopexit, %polly.loop_header178.preheader.split, %polly.loop_header169
  %polly.indvar_next174 = add nuw nsw i64 %polly.indvar173, 1
  %exitcond515 = icmp eq i64 %polly.indvar_next174, %64
  br i1 %exitcond515, label %polly.loop_exit171.loopexit, label %polly.loop_header169

polly.loop_header178:                             ; preds = %polly.loop_header178.preheader553, %polly.merge
  %polly.indvar182 = phi i64 [ %polly.indvar_next183, %polly.merge ], [ 0, %polly.loop_header178.preheader553 ]
  br i1 %polly.loop_guard206, label %polly.merge, label %polly.loop_header203.preheader

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header203
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.loop_header203.preheader.split, %polly.merge.loopexit.unr-lcssa
  br label %polly.merge

polly.merge:                                      ; preds = %polly.merge.loopexit, %polly.loop_header178
  %polly.indvar_next183 = add nuw nsw i64 %polly.indvar182, 1
  %polly.loop_cond185 = icmp sgt i64 %polly.indvar182, %polly.adjust_ub184
  br i1 %polly.loop_cond185, label %polly.loop_exit180.loopexit554, label %polly.loop_header178

polly.loop_header203.preheader:                   ; preds = %polly.loop_header178
  %106 = add nuw nsw i64 %polly.indvar182, %55
  %107 = shl i64 %106, 3
  br i1 %lcmp.mod562, label %polly.loop_header203.preheader.split, label %polly.loop_header203.prol.preheader

polly.loop_header203.prol.preheader:              ; preds = %polly.loop_header203.preheader
  br label %polly.loop_header203.prol

polly.loop_header203.prol:                        ; preds = %polly.loop_header203.prol, %polly.loop_header203.prol.preheader
  %polly.indvar207.prol = phi i64 [ %polly.indvar_next208.prol, %polly.loop_header203.prol ], [ 0, %polly.loop_header203.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %polly.loop_header203.prol ], [ %xtraiter561, %polly.loop_header203.prol.preheader ]
  %108 = add nsw i64 %63, %polly.indvar207.prol
  %109 = mul i64 %108, %60
  %110 = add i64 %109, %107
  %scevgep213.prol = getelementptr i8, i8* %call, i64 %110
  %scevgep213214.prol = bitcast i8* %scevgep213.prol to i64*
  store i64 0, i64* %scevgep213214.prol, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !200
  %polly.indvar_next208.prol = add nuw nsw i64 %polly.indvar207.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %polly.loop_header203.preheader.split.loopexit, label %polly.loop_header203.prol, !llvm.loop !203

polly.loop_header203.preheader.split.loopexit:    ; preds = %polly.loop_header203.prol
  %polly.indvar_next208.prol.lcssa = phi i64 [ %polly.indvar_next208.prol, %polly.loop_header203.prol ]
  br label %polly.loop_header203.preheader.split

polly.loop_header203.preheader.split:             ; preds = %polly.loop_header203.preheader, %polly.loop_header203.preheader.split.loopexit
  %polly.indvar207.unr = phi i64 [ 0, %polly.loop_header203.preheader ], [ %polly.indvar_next208.prol.lcssa, %polly.loop_header203.preheader.split.loopexit ]
  br i1 %68, label %polly.merge.loopexit, label %polly.loop_header203.preheader.split.split

polly.loop_header203.preheader.split.split:       ; preds = %polly.loop_header203.preheader.split
  br label %polly.loop_header203

polly.loop_header203:                             ; preds = %polly.loop_header203, %polly.loop_header203.preheader.split.split
  %polly.indvar207 = phi i64 [ %polly.indvar207.unr, %polly.loop_header203.preheader.split.split ], [ %polly.indvar_next208.3, %polly.loop_header203 ]
  %111 = add nsw i64 %63, %polly.indvar207
  %112 = mul i64 %111, %60
  %113 = add i64 %112, %107
  %scevgep213 = getelementptr i8, i8* %call, i64 %113
  %scevgep213214 = bitcast i8* %scevgep213 to i64*
  store i64 0, i64* %scevgep213214, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !200
  %polly.indvar_next208 = add nuw nsw i64 %polly.indvar207, 1
  %114 = add nsw i64 %63, %polly.indvar_next208
  %115 = mul i64 %114, %60
  %116 = add i64 %115, %107
  %scevgep213.1 = getelementptr i8, i8* %call, i64 %116
  %scevgep213214.1 = bitcast i8* %scevgep213.1 to i64*
  store i64 0, i64* %scevgep213214.1, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !200
  %polly.indvar_next208.1 = add nsw i64 %polly.indvar207, 2
  %117 = add nsw i64 %63, %polly.indvar_next208.1
  %118 = mul i64 %117, %60
  %119 = add i64 %118, %107
  %scevgep213.2 = getelementptr i8, i8* %call, i64 %119
  %scevgep213214.2 = bitcast i8* %scevgep213.2 to i64*
  store i64 0, i64* %scevgep213214.2, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !200
  %polly.indvar_next208.2 = add nsw i64 %polly.indvar207, 3
  %120 = add nsw i64 %63, %polly.indvar_next208.2
  %121 = mul i64 %120, %60
  %122 = add i64 %121, %107
  %scevgep213.3 = getelementptr i8, i8* %call, i64 %122
  %scevgep213214.3 = bitcast i8* %scevgep213.3 to i64*
  store i64 0, i64* %scevgep213214.3, align 8, !alias.scope !193, !noalias !195, !llvm.mem.parallel_loop_access !200
  %polly.indvar_next208.3 = add nsw i64 %polly.indvar207, 4
  %exitcond512.3 = icmp eq i64 %polly.indvar_next208.3, %pexp.pdiv_r
  br i1 %exitcond512.3, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header203, !llvm.loop !201

polly.loop_header218:                             ; preds = %polly.loop_exit230, %polly.loop_preheader219
  %polly.indvar222 = phi i64 [ 0, %polly.loop_preheader219 ], [ %polly.indvar_next223, %polly.loop_exit230 ]
  br i1 %polly.loop_guard172, label %polly.loop_header228.preheader, label %polly.loop_exit230

polly.loop_header228.preheader:                   ; preds = %polly.loop_header218
  %123 = shl nsw i64 %polly.indvar222, 5
  %124 = sub nsw i64 %34, %123
  %125 = add nsw i64 %124, -1
  %126 = icmp sgt i64 %125, 31
  %127 = select i1 %126, i64 31, i64 %125
  %polly.loop_guard248 = icmp sgt i64 %127, -1
  %polly.adjust_ub251 = add i64 %127, -1
  br label %polly.loop_header228

polly.loop_exit230.loopexit:                      ; preds = %polly.loop_exit239
  br label %polly.loop_exit230

polly.loop_exit230:                               ; preds = %polly.loop_exit230.loopexit, %polly.loop_header218
  %polly.indvar_next223 = add nuw nsw i64 %polly.indvar222, 1
  %exitcond511 = icmp eq i64 %polly.indvar_next223, %65
  br i1 %exitcond511, label %for.end65.loopexit, label %polly.loop_header218, !llvm.loop !204

polly.loop_preheader219:                          ; preds = %polly.loop_exit171
  %pexp.p_div_q236 = lshr i64 %32, 5
  %128 = add nsw i64 %pexp.pdiv_r, -1
  %xtraiter559 = and i64 %62, 1
  %lcmp.mod560 = icmp eq i64 %xtraiter559, 0
  %129 = shl nsw i64 %63, 3
  %130 = icmp eq i64 %128, 0
  %xtraiter = and i64 %62, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %131 = shl nsw i64 %63, 3
  %132 = icmp eq i64 %128, 0
  br label %polly.loop_header218

polly.loop_header228:                             ; preds = %polly.loop_exit239, %polly.loop_header228.preheader
  %polly.indvar232 = phi i64 [ %polly.indvar_next233, %polly.loop_exit239 ], [ 0, %polly.loop_header228.preheader ]
  %133 = shl nsw i64 %polly.indvar232, 5
  %134 = sub nsw i64 %6, %133
  %135 = add nsw i64 %134, -1
  %136 = icmp sgt i64 %135, 31
  %137 = select i1 %136, i64 31, i64 %135
  %polly.loop_guard257 = icmp sgt i64 %137, -1
  %polly.adjust_ub260 = add i64 %137, -1
  br label %polly.loop_header237

polly.loop_exit239:                               ; preds = %polly.loop_exit247
  %polly.indvar_next233 = add nuw nsw i64 %polly.indvar232, 1
  %exitcond510 = icmp eq i64 %polly.indvar_next233, %64
  br i1 %exitcond510, label %polly.loop_exit230.loopexit, label %polly.loop_header228

polly.loop_header237:                             ; preds = %polly.loop_exit247, %polly.loop_header228
  %polly.indvar240 = phi i64 [ 0, %polly.loop_header228 ], [ %polly.indvar_next241, %polly.loop_exit247 ]
  br i1 %polly.loop_guard248, label %polly.loop_header245.preheader, label %polly.loop_exit247

polly.loop_header245.preheader:                   ; preds = %polly.loop_header237
  %138 = mul nsw i64 %polly.indvar240, -8
  %139 = add nsw i64 %61, %138
  %140 = icmp sgt i64 %139, 7
  %141 = select i1 %140, i64 7, i64 %139
  %polly.loop_guard267 = icmp sgt i64 %141, -1
  %142 = shl i64 %polly.indvar240, 5
  %143 = or i64 %142, 31
  %144 = icmp slt i64 %143, %6
  %polly.adjust_ub270 = add i64 %141, -1
  %brmerge490 = or i1 %144, %polly.loop_guard206
  br label %polly.loop_header245

polly.loop_exit247.loopexit:                      ; preds = %polly.loop_exit256
  br label %polly.loop_exit247

polly.loop_exit247:                               ; preds = %polly.loop_exit247.loopexit, %polly.loop_header237
  %polly.indvar_next241 = add nuw nsw i64 %polly.indvar240, 1
  %exitcond509 = icmp eq i64 %polly.indvar240, %pexp.p_div_q236
  br i1 %exitcond509, label %polly.loop_exit239, label %polly.loop_header237

polly.loop_header245:                             ; preds = %polly.loop_header245.preheader, %polly.loop_exit256
  %polly.indvar249 = phi i64 [ %polly.indvar_next250, %polly.loop_exit256 ], [ 0, %polly.loop_header245.preheader ]
  br i1 %polly.loop_guard257, label %polly.loop_header254.preheader, label %polly.loop_exit256

polly.loop_header254.preheader:                   ; preds = %polly.loop_header245
  %145 = add nuw nsw i64 %polly.indvar249, %123
  %146 = shl i64 %145, 3
  br i1 %polly.loop_guard267, label %polly.loop_header254.us.preheader, label %polly.loop_header254.preheader.split

polly.loop_header254.us.preheader:                ; preds = %polly.loop_header254.preheader
  br label %polly.loop_header254.us

polly.loop_header254.us:                          ; preds = %polly.loop_header254.us.preheader, %polly.merge286.us
  %polly.indvar258.us = phi i64 [ %polly.indvar_next259.us, %polly.merge286.us ], [ 0, %polly.loop_header254.us.preheader ]
  %147 = add nuw nsw i64 %polly.indvar258.us, %133
  %148 = mul i64 %147, %60
  %149 = add i64 %148, %146
  %scevgep278.us = getelementptr i8, i8* %call, i64 %149
  %scevgep278279.us = bitcast i8* %scevgep278.us to i64*
  %150 = mul i64 %147, %6
  %scevgep278279.promoted389.us = load i64, i64* %scevgep278279.us, align 8, !alias.scope !193, !noalias !195
  br label %polly.loop_header264.us

polly.loop_header264.us:                          ; preds = %polly.loop_header254.us, %polly.loop_header264.us
  %p_add52.lcssa390.us = phi i64 [ %p_add52.us.3, %polly.loop_header264.us ], [ %scevgep278279.promoted389.us, %polly.loop_header254.us ]
  %polly.indvar268.us = phi i64 [ %polly.indvar_next269.us, %polly.loop_header264.us ], [ 0, %polly.loop_header254.us ]
  %151 = shl i64 %polly.indvar268.us, 2
  %152 = add nuw nsw i64 %151, %142
  %153 = add i64 %152, %150
  %scevgep280.us = getelementptr i64, i64* %2, i64 %153
  %_p_scalar_281.us = load i64, i64* %scevgep280.us, align 8, !alias.scope !196, !noalias !205, !llvm.mem.parallel_loop_access !206
  %154 = shl i64 %152, 3
  %155 = add i64 %154, %148
  %scevgep282.us = getelementptr i8, i8* %call9, i64 %155
  %scevgep282283.us = bitcast i8* %scevgep282.us to i64*
  %_p_scalar_284.us = load i64, i64* %scevgep282283.us, align 8, !alias.scope !197, !noalias !208, !llvm.mem.parallel_loop_access !206
  %p_mul51.us = mul nsw i64 %_p_scalar_284.us, %_p_scalar_281.us, !dbg !176
  %p_add52.us = add nsw i64 %p_mul51.us, %p_add52.lcssa390.us, !dbg !182
  %156 = or i64 %152, 1
  %157 = add i64 %156, %150
  %scevgep280.us.1 = getelementptr i64, i64* %2, i64 %157
  %_p_scalar_281.us.1 = load i64, i64* %scevgep280.us.1, align 8, !alias.scope !196, !noalias !205, !llvm.mem.parallel_loop_access !206
  %158 = shl i64 %156, 3
  %159 = add i64 %158, %148
  %scevgep282.us.1 = getelementptr i8, i8* %call9, i64 %159
  %scevgep282283.us.1 = bitcast i8* %scevgep282.us.1 to i64*
  %_p_scalar_284.us.1 = load i64, i64* %scevgep282283.us.1, align 8, !alias.scope !197, !noalias !208, !llvm.mem.parallel_loop_access !206
  %p_mul51.us.1 = mul nsw i64 %_p_scalar_284.us.1, %_p_scalar_281.us.1, !dbg !176
  %p_add52.us.1 = add nsw i64 %p_mul51.us.1, %p_add52.us, !dbg !182
  %160 = or i64 %152, 2
  %161 = add i64 %160, %150
  %scevgep280.us.2 = getelementptr i64, i64* %2, i64 %161
  %_p_scalar_281.us.2 = load i64, i64* %scevgep280.us.2, align 8, !alias.scope !196, !noalias !205, !llvm.mem.parallel_loop_access !206
  %162 = shl i64 %160, 3
  %163 = add i64 %162, %148
  %scevgep282.us.2 = getelementptr i8, i8* %call9, i64 %163
  %scevgep282283.us.2 = bitcast i8* %scevgep282.us.2 to i64*
  %_p_scalar_284.us.2 = load i64, i64* %scevgep282283.us.2, align 8, !alias.scope !197, !noalias !208, !llvm.mem.parallel_loop_access !206
  %p_mul51.us.2 = mul nsw i64 %_p_scalar_284.us.2, %_p_scalar_281.us.2, !dbg !176
  %p_add52.us.2 = add nsw i64 %p_mul51.us.2, %p_add52.us.1, !dbg !182
  %164 = or i64 %152, 3
  %165 = add i64 %164, %150
  %scevgep280.us.3 = getelementptr i64, i64* %2, i64 %165
  %_p_scalar_281.us.3 = load i64, i64* %scevgep280.us.3, align 8, !alias.scope !196, !noalias !205, !llvm.mem.parallel_loop_access !206
  %166 = shl i64 %164, 3
  %167 = add i64 %166, %148
  %scevgep282.us.3 = getelementptr i8, i8* %call9, i64 %167
  %scevgep282283.us.3 = bitcast i8* %scevgep282.us.3 to i64*
  %_p_scalar_284.us.3 = load i64, i64* %scevgep282283.us.3, align 8, !alias.scope !197, !noalias !208, !llvm.mem.parallel_loop_access !206
  %p_mul51.us.3 = mul nsw i64 %_p_scalar_284.us.3, %_p_scalar_281.us.3, !dbg !176
  %p_add52.us.3 = add nsw i64 %p_mul51.us.3, %p_add52.us.2, !dbg !182
  %polly.indvar_next269.us = add nuw nsw i64 %polly.indvar268.us, 1
  %polly.loop_cond271.us = icmp sgt i64 %polly.indvar268.us, %polly.adjust_ub270
  br i1 %polly.loop_cond271.us, label %polly.cond285.loopexit.us, label %polly.loop_header264.us

polly.loop_header291.us:                          ; preds = %polly.loop_header291.us, %polly.loop_header291.us.preheader.split.split
  %p_add52310391.us = phi i64 [ %p_add52310391.us.unr, %polly.loop_header291.us.preheader.split.split ], [ %p_add52310.us.1, %polly.loop_header291.us ]
  %polly.indvar295.us = phi i64 [ %polly.indvar295.us.unr, %polly.loop_header291.us.preheader.split.split ], [ %polly.indvar_next296.us.1, %polly.loop_header291.us ]
  %168 = add nsw i64 %polly.indvar295.us, %63
  %169 = add i64 %168, %150
  %scevgep304.us = getelementptr i64, i64* %2, i64 %169
  %_p_scalar_305.us = load i64, i64* %scevgep304.us, align 8, !alias.scope !196, !noalias !205, !llvm.mem.parallel_loop_access !209
  %170 = shl i64 %168, 3
  %171 = add i64 %170, %148
  %scevgep306.us = getelementptr i8, i8* %call9, i64 %171
  %scevgep306307.us = bitcast i8* %scevgep306.us to i64*
  %_p_scalar_308.us = load i64, i64* %scevgep306307.us, align 8, !alias.scope !197, !noalias !208, !llvm.mem.parallel_loop_access !209
  %p_mul51309.us = mul nsw i64 %_p_scalar_308.us, %_p_scalar_305.us, !dbg !176
  %p_add52310.us = add nsw i64 %p_mul51309.us, %p_add52310391.us, !dbg !182
  %polly.indvar_next296.us = add nuw nsw i64 %polly.indvar295.us, 1
  %172 = add nsw i64 %polly.indvar_next296.us, %63
  %173 = add i64 %172, %150
  %scevgep304.us.1 = getelementptr i64, i64* %2, i64 %173
  %_p_scalar_305.us.1 = load i64, i64* %scevgep304.us.1, align 8, !alias.scope !196, !noalias !205, !llvm.mem.parallel_loop_access !209
  %174 = shl i64 %172, 3
  %175 = add i64 %174, %148
  %scevgep306.us.1 = getelementptr i8, i8* %call9, i64 %175
  %scevgep306307.us.1 = bitcast i8* %scevgep306.us.1 to i64*
  %_p_scalar_308.us.1 = load i64, i64* %scevgep306307.us.1, align 8, !alias.scope !197, !noalias !208, !llvm.mem.parallel_loop_access !209
  %p_mul51309.us.1 = mul nsw i64 %_p_scalar_308.us.1, %_p_scalar_305.us.1, !dbg !176
  %p_add52310.us.1 = add nsw i64 %p_mul51309.us.1, %p_add52310.us, !dbg !182
  %polly.indvar_next296.us.1 = add nsw i64 %polly.indvar295.us, 2
  %exitcond508.1 = icmp eq i64 %polly.indvar_next296.us.1, %pexp.pdiv_r
  br i1 %exitcond508.1, label %polly.merge286.loopexit.us.unr-lcssa, label %polly.loop_header291.us, !llvm.loop !210

polly.merge286.us:                                ; preds = %polly.cond285.loopexit.us, %polly.merge286.loopexit.us
  %polly.indvar_next259.us = add nuw nsw i64 %polly.indvar258.us, 1
  %polly.loop_cond261.us = icmp sgt i64 %polly.indvar258.us, %polly.adjust_ub260
  br i1 %polly.loop_cond261.us, label %polly.loop_exit256.loopexit, label %polly.loop_header254.us

polly.merge286.loopexit.us.unr-lcssa:             ; preds = %polly.loop_header291.us
  %p_add52310.us.1.lcssa = phi i64 [ %p_add52310.us.1, %polly.loop_header291.us ]
  br label %polly.merge286.loopexit.us

polly.merge286.loopexit.us:                       ; preds = %polly.loop_header291.us.preheader.split, %polly.merge286.loopexit.us.unr-lcssa
  %p_add52310.us.lcssa = phi i64 [ %p_add52310.us.lcssa.unr, %polly.loop_header291.us.preheader.split ], [ %p_add52310.us.1.lcssa, %polly.merge286.loopexit.us.unr-lcssa ]
  store i64 %p_add52310.us.lcssa, i64* %scevgep278279.us, align 8, !alias.scope !193, !noalias !195
  br label %polly.merge286.us

polly.cond285.loopexit.us:                        ; preds = %polly.loop_header264.us
  %p_add52.us.3.lcssa = phi i64 [ %p_add52.us.3, %polly.loop_header264.us ]
  store i64 %p_add52.us.3.lcssa, i64* %scevgep278279.us, align 8, !alias.scope !193, !noalias !195
  br i1 %brmerge490, label %polly.merge286.us, label %polly.loop_header291.us.preheader

polly.loop_header291.us.preheader:                ; preds = %polly.cond285.loopexit.us
  br i1 %lcmp.mod560, label %polly.loop_header291.us.preheader.split, label %polly.loop_header291.us.prol

polly.loop_header291.us.prol:                     ; preds = %polly.loop_header291.us.preheader
  %176 = add i64 %63, %150
  %scevgep304.us.prol = getelementptr i64, i64* %2, i64 %176
  %_p_scalar_305.us.prol = load i64, i64* %scevgep304.us.prol, align 8, !alias.scope !196, !noalias !205, !llvm.mem.parallel_loop_access !209
  %177 = add i64 %129, %148
  %scevgep306.us.prol = getelementptr i8, i8* %call9, i64 %177
  %scevgep306307.us.prol = bitcast i8* %scevgep306.us.prol to i64*
  %_p_scalar_308.us.prol = load i64, i64* %scevgep306307.us.prol, align 8, !alias.scope !197, !noalias !208, !llvm.mem.parallel_loop_access !209
  %p_mul51309.us.prol = mul nsw i64 %_p_scalar_308.us.prol, %_p_scalar_305.us.prol, !dbg !176
  %p_add52310.us.prol = add nsw i64 %p_mul51309.us.prol, %p_add52.us.3.lcssa, !dbg !182
  br label %polly.loop_header291.us.preheader.split

polly.loop_header291.us.preheader.split:          ; preds = %polly.loop_header291.us.preheader, %polly.loop_header291.us.prol
  %p_add52310.us.lcssa.unr = phi i64 [ undef, %polly.loop_header291.us.preheader ], [ %p_add52310.us.prol, %polly.loop_header291.us.prol ]
  %p_add52310391.us.unr = phi i64 [ %p_add52.us.3.lcssa, %polly.loop_header291.us.preheader ], [ %p_add52310.us.prol, %polly.loop_header291.us.prol ]
  %polly.indvar295.us.unr = phi i64 [ 0, %polly.loop_header291.us.preheader ], [ 1, %polly.loop_header291.us.prol ]
  br i1 %130, label %polly.merge286.loopexit.us, label %polly.loop_header291.us.preheader.split.split

polly.loop_header291.us.preheader.split.split:    ; preds = %polly.loop_header291.us.preheader.split
  br label %polly.loop_header291.us

polly.loop_header254.preheader.split:             ; preds = %polly.loop_header254.preheader
  br i1 %144, label %polly.loop_exit256, label %polly.loop_header254.preheader551

polly.loop_header254.preheader551:                ; preds = %polly.loop_header254.preheader.split
  br label %polly.loop_header254

polly.loop_exit256.loopexit:                      ; preds = %polly.merge286.us
  br label %polly.loop_exit256

polly.loop_exit256.loopexit552:                   ; preds = %polly.merge286
  br label %polly.loop_exit256

polly.loop_exit256:                               ; preds = %polly.loop_exit256.loopexit552, %polly.loop_exit256.loopexit, %polly.loop_header254.preheader.split, %polly.loop_header245
  %polly.indvar_next250 = add nuw nsw i64 %polly.indvar249, 1
  %polly.loop_cond252 = icmp sgt i64 %polly.indvar249, %polly.adjust_ub251
  br i1 %polly.loop_cond252, label %polly.loop_exit247.loopexit, label %polly.loop_header245

polly.loop_header254:                             ; preds = %polly.loop_header254.preheader551, %polly.merge286
  %polly.indvar258 = phi i64 [ %polly.indvar_next259, %polly.merge286 ], [ 0, %polly.loop_header254.preheader551 ]
  br i1 %polly.loop_guard206, label %polly.merge286, label %polly.loop_header291.preheader

polly.merge286.loopexit.unr-lcssa:                ; preds = %polly.loop_header291
  %p_add52310.1.lcssa = phi i64 [ %p_add52310.1, %polly.loop_header291 ]
  br label %polly.merge286.loopexit

polly.merge286.loopexit:                          ; preds = %polly.loop_header291.preheader.split, %polly.merge286.loopexit.unr-lcssa
  %p_add52310.lcssa = phi i64 [ %p_add52310.lcssa.unr, %polly.loop_header291.preheader.split ], [ %p_add52310.1.lcssa, %polly.merge286.loopexit.unr-lcssa ]
  store i64 %p_add52310.lcssa, i64* %scevgep301302, align 8, !alias.scope !193, !noalias !195
  br label %polly.merge286

polly.merge286:                                   ; preds = %polly.merge286.loopexit, %polly.loop_header254
  %polly.indvar_next259 = add nuw nsw i64 %polly.indvar258, 1
  %polly.loop_cond261 = icmp sgt i64 %polly.indvar258, %polly.adjust_ub260
  br i1 %polly.loop_cond261, label %polly.loop_exit256.loopexit552, label %polly.loop_header254

polly.loop_header291.preheader:                   ; preds = %polly.loop_header254
  %178 = add nuw nsw i64 %polly.indvar258, %133
  %179 = mul i64 %178, %60
  %180 = add i64 %179, %146
  %scevgep301 = getelementptr i8, i8* %call, i64 %180
  %scevgep301302 = bitcast i8* %scevgep301 to i64*
  %181 = mul i64 %178, %6
  %scevgep301302.promoted = load i64, i64* %scevgep301302, align 8, !alias.scope !193, !noalias !195
  br i1 %lcmp.mod, label %polly.loop_header291.preheader.split, label %polly.loop_header291.prol

polly.loop_header291.prol:                        ; preds = %polly.loop_header291.preheader
  %182 = add i64 %63, %181
  %scevgep304.prol = getelementptr i64, i64* %2, i64 %182
  %_p_scalar_305.prol = load i64, i64* %scevgep304.prol, align 8, !alias.scope !196, !noalias !205, !llvm.mem.parallel_loop_access !209
  %183 = add i64 %131, %179
  %scevgep306.prol = getelementptr i8, i8* %call9, i64 %183
  %scevgep306307.prol = bitcast i8* %scevgep306.prol to i64*
  %_p_scalar_308.prol = load i64, i64* %scevgep306307.prol, align 8, !alias.scope !197, !noalias !208, !llvm.mem.parallel_loop_access !209
  %p_mul51309.prol = mul nsw i64 %_p_scalar_308.prol, %_p_scalar_305.prol, !dbg !176
  %p_add52310.prol = add nsw i64 %p_mul51309.prol, %scevgep301302.promoted, !dbg !182
  br label %polly.loop_header291.preheader.split

polly.loop_header291.preheader.split:             ; preds = %polly.loop_header291.preheader, %polly.loop_header291.prol
  %p_add52310.lcssa.unr = phi i64 [ undef, %polly.loop_header291.preheader ], [ %p_add52310.prol, %polly.loop_header291.prol ]
  %p_add52310391.unr = phi i64 [ %scevgep301302.promoted, %polly.loop_header291.preheader ], [ %p_add52310.prol, %polly.loop_header291.prol ]
  %polly.indvar295.unr = phi i64 [ 0, %polly.loop_header291.preheader ], [ 1, %polly.loop_header291.prol ]
  br i1 %132, label %polly.merge286.loopexit, label %polly.loop_header291.preheader.split.split

polly.loop_header291.preheader.split.split:       ; preds = %polly.loop_header291.preheader.split
  br label %polly.loop_header291

polly.loop_header291:                             ; preds = %polly.loop_header291, %polly.loop_header291.preheader.split.split
  %p_add52310391 = phi i64 [ %p_add52310391.unr, %polly.loop_header291.preheader.split.split ], [ %p_add52310.1, %polly.loop_header291 ]
  %polly.indvar295 = phi i64 [ %polly.indvar295.unr, %polly.loop_header291.preheader.split.split ], [ %polly.indvar_next296.1, %polly.loop_header291 ]
  %184 = add nsw i64 %polly.indvar295, %63
  %185 = add i64 %184, %181
  %scevgep304 = getelementptr i64, i64* %2, i64 %185
  %_p_scalar_305 = load i64, i64* %scevgep304, align 8, !alias.scope !196, !noalias !205, !llvm.mem.parallel_loop_access !209
  %186 = shl i64 %184, 3
  %187 = add i64 %186, %179
  %scevgep306 = getelementptr i8, i8* %call9, i64 %187
  %scevgep306307 = bitcast i8* %scevgep306 to i64*
  %_p_scalar_308 = load i64, i64* %scevgep306307, align 8, !alias.scope !197, !noalias !208, !llvm.mem.parallel_loop_access !209
  %p_mul51309 = mul nsw i64 %_p_scalar_308, %_p_scalar_305, !dbg !176
  %p_add52310 = add nsw i64 %p_mul51309, %p_add52310391, !dbg !182
  %polly.indvar_next296 = add nuw nsw i64 %polly.indvar295, 1
  %188 = add nsw i64 %polly.indvar_next296, %63
  %189 = add i64 %188, %181
  %scevgep304.1 = getelementptr i64, i64* %2, i64 %189
  %_p_scalar_305.1 = load i64, i64* %scevgep304.1, align 8, !alias.scope !196, !noalias !205, !llvm.mem.parallel_loop_access !209
  %190 = shl i64 %188, 3
  %191 = add i64 %190, %179
  %scevgep306.1 = getelementptr i8, i8* %call9, i64 %191
  %scevgep306307.1 = bitcast i8* %scevgep306.1 to i64*
  %_p_scalar_308.1 = load i64, i64* %scevgep306307.1, align 8, !alias.scope !197, !noalias !208, !llvm.mem.parallel_loop_access !209
  %p_mul51309.1 = mul nsw i64 %_p_scalar_308.1, %_p_scalar_305.1, !dbg !176
  %p_add52310.1 = add nsw i64 %p_mul51309.1, %p_add52310, !dbg !182
  %polly.indvar_next296.1 = add nsw i64 %polly.indvar295, 2
  %exitcond.1 = icmp eq i64 %polly.indvar_next296.1, %pexp.pdiv_r
  br i1 %exitcond.1, label %polly.merge286.loopexit.unr-lcssa, label %polly.loop_header291, !llvm.loop !210

polly.start314:                                   ; preds = %for.cond11.preheader.lr.ph
  %192 = sext i32 %1 to i64
  %193 = add nsw i64 %192, -1
  %polly.fdiv_q.shr316 = ashr i64 %193, 5
  %polly.loop_guard321 = icmp sgt i64 %polly.fdiv_q.shr316, -1
  br i1 %polly.loop_guard321, label %polly.loop_preheader319, label %polly.split_new_and_old

polly.loop_header318:                             ; preds = %polly.loop_exit330, %polly.loop_preheader319
  %polly.indvar322 = phi i64 [ 0, %polly.loop_preheader319 ], [ %polly.indvar_next323, %polly.loop_exit330 ]
  br i1 %polly.loop_guard331, label %polly.loop_header328.preheader, label %polly.loop_exit330

polly.loop_header328.preheader:                   ; preds = %polly.loop_header318
  %194 = shl nsw i64 %polly.indvar322, 5
  %195 = sub nsw i64 %192, %194
  %196 = add nsw i64 %195, -1
  %197 = icmp sgt i64 %196, 31
  %198 = select i1 %197, i64 31, i64 %196
  %polly.loop_guard340 = icmp sgt i64 %198, -1
  %polly.adjust_ub343 = add i64 %198, -1
  br label %polly.loop_header328

polly.loop_exit330.loopexit:                      ; preds = %polly.loop_exit339
  br label %polly.loop_exit330

polly.loop_exit330:                               ; preds = %polly.loop_exit330.loopexit, %polly.loop_header318
  %polly.indvar_next323 = add nuw nsw i64 %polly.indvar322, 1
  %exitcond534 = icmp eq i64 %polly.indvar322, %polly.fdiv_q.shr316
  br i1 %exitcond534, label %polly.split_new_and_old.loopexit558, label %polly.loop_header318, !llvm.loop !211

polly.loop_preheader319:                          ; preds = %polly.start314
  %199 = shl nsw i64 %6, 3
  %200 = add nsw i64 %6, -1
  %polly.fdiv_q.shr326 = ashr i64 %200, 5
  %polly.loop_guard331 = icmp sgt i64 %polly.fdiv_q.shr326, -1
  %pexp.p_div_q345 = lshr i64 %6, 2
  %201 = add nsw i64 %pexp.p_div_q345, -1
  %202 = zext i32 %0 to i64
  %pexp.pdiv_r369 = and i64 %202, 3
  %polly.loop_guard374 = icmp eq i64 %pexp.pdiv_r369, 0
  %203 = sub nsw i64 %6, %pexp.pdiv_r369
  %204 = add nsw i64 %pexp.pdiv_r369, -1
  %xtraiter573 = and i64 %202, 1
  %lcmp.mod574 = icmp eq i64 %xtraiter573, 0
  %205 = mul i64 %203, %6
  %206 = shl nsw i64 %203, 3
  %207 = icmp eq i64 %204, 0
  %xtraiter571 = and i64 %202, 1
  %lcmp.mod572 = icmp eq i64 %xtraiter571, 0
  %208 = mul i64 %203, %6
  %209 = shl nsw i64 %203, 3
  %210 = icmp eq i64 %204, 0
  br label %polly.loop_header318

polly.loop_header328:                             ; preds = %polly.loop_exit339, %polly.loop_header328.preheader
  %polly.indvar332 = phi i64 [ %polly.indvar_next333, %polly.loop_exit339 ], [ 0, %polly.loop_header328.preheader ]
  br i1 %polly.loop_guard340, label %polly.loop_header337.preheader, label %polly.loop_exit339

polly.loop_header337.preheader:                   ; preds = %polly.loop_header328
  %211 = mul nsw i64 %polly.indvar332, -8
  %212 = add nsw i64 %201, %211
  %213 = icmp sgt i64 %212, 7
  %214 = select i1 %213, i64 7, i64 %212
  %polly.loop_guard350 = icmp sgt i64 %214, -1
  %215 = shl i64 %polly.indvar332, 5
  %polly.adjust_ub353 = add i64 %214, -1
  %216 = or i64 %215, 31
  %217 = icmp slt i64 %216, %6
  %brmerge491 = or i1 %217, %polly.loop_guard374
  br i1 %polly.loop_guard350, label %polly.loop_header337.us.preheader, label %polly.loop_header337.preheader556

polly.loop_header337.preheader556:                ; preds = %polly.loop_header337.preheader
  br label %polly.loop_header337

polly.loop_header337.us.preheader:                ; preds = %polly.loop_header337.preheader
  br label %polly.loop_header337.us

polly.loop_header337.us:                          ; preds = %polly.loop_header337.us.preheader, %polly.merge366.us
  %polly.indvar341.us = phi i64 [ %polly.indvar_next342.us, %polly.merge366.us ], [ 0, %polly.loop_header337.us.preheader ]
  %218 = add nuw nsw i64 %polly.indvar341.us, %194
  %219 = mul i64 %218, %199
  br label %polly.loop_header347.us

polly.loop_header347.us:                          ; preds = %polly.loop_header337.us, %polly.loop_header347.us
  %polly.indvar351.us = phi i64 [ %polly.indvar_next352.us, %polly.loop_header347.us ], [ 0, %polly.loop_header337.us ]
  %220 = shl i64 %polly.indvar351.us, 2
  %221 = add nuw nsw i64 %220, %215
  %222 = mul i64 %221, %6
  %223 = add nsw i64 %222, %218
  %scevgep361.us = getelementptr i64, i64* %3, i64 %223
  %_p_scalar_362.us = load i64, i64* %scevgep361.us, align 8, !alias.scope !212, !noalias !214, !llvm.mem.parallel_loop_access !216
  %224 = shl i64 %221, 3
  %225 = add i64 %224, %219
  %scevgep363.us = getelementptr i8, i8* %call9, i64 %225
  %scevgep363364.us = bitcast i8* %scevgep363.us to i64*
  store i64 %_p_scalar_362.us, i64* %scevgep363364.us, align 8, !alias.scope !215, !noalias !218, !llvm.mem.parallel_loop_access !216
  %226 = or i64 %221, 1
  %227 = mul i64 %226, %6
  %228 = add nsw i64 %227, %218
  %scevgep361.us.1 = getelementptr i64, i64* %3, i64 %228
  %_p_scalar_362.us.1 = load i64, i64* %scevgep361.us.1, align 8, !alias.scope !212, !noalias !214, !llvm.mem.parallel_loop_access !216
  %229 = shl i64 %226, 3
  %230 = add i64 %229, %219
  %scevgep363.us.1 = getelementptr i8, i8* %call9, i64 %230
  %scevgep363364.us.1 = bitcast i8* %scevgep363.us.1 to i64*
  store i64 %_p_scalar_362.us.1, i64* %scevgep363364.us.1, align 8, !alias.scope !215, !noalias !218, !llvm.mem.parallel_loop_access !216
  %231 = or i64 %221, 2
  %232 = mul i64 %231, %6
  %233 = add nsw i64 %232, %218
  %scevgep361.us.2 = getelementptr i64, i64* %3, i64 %233
  %_p_scalar_362.us.2 = load i64, i64* %scevgep361.us.2, align 8, !alias.scope !212, !noalias !214, !llvm.mem.parallel_loop_access !216
  %234 = shl i64 %231, 3
  %235 = add i64 %234, %219
  %scevgep363.us.2 = getelementptr i8, i8* %call9, i64 %235
  %scevgep363364.us.2 = bitcast i8* %scevgep363.us.2 to i64*
  store i64 %_p_scalar_362.us.2, i64* %scevgep363364.us.2, align 8, !alias.scope !215, !noalias !218, !llvm.mem.parallel_loop_access !216
  %236 = or i64 %221, 3
  %237 = mul i64 %236, %6
  %238 = add nsw i64 %237, %218
  %scevgep361.us.3 = getelementptr i64, i64* %3, i64 %238
  %_p_scalar_362.us.3 = load i64, i64* %scevgep361.us.3, align 8, !alias.scope !212, !noalias !214, !llvm.mem.parallel_loop_access !216
  %239 = shl i64 %236, 3
  %240 = add i64 %239, %219
  %scevgep363.us.3 = getelementptr i8, i8* %call9, i64 %240
  %scevgep363364.us.3 = bitcast i8* %scevgep363.us.3 to i64*
  store i64 %_p_scalar_362.us.3, i64* %scevgep363364.us.3, align 8, !alias.scope !215, !noalias !218, !llvm.mem.parallel_loop_access !216
  %polly.indvar_next352.us = add nuw nsw i64 %polly.indvar351.us, 1
  %polly.loop_cond354.us = icmp sgt i64 %polly.indvar351.us, %polly.adjust_ub353
  br i1 %polly.loop_cond354.us, label %polly.cond365.loopexit.us, label %polly.loop_header347.us

polly.loop_header371.us:                          ; preds = %polly.loop_header371.us, %polly.loop_header371.us.preheader.split.split
  %polly.indvar375.us = phi i64 [ %polly.indvar375.us.unr, %polly.loop_header371.us.preheader.split.split ], [ %polly.indvar_next376.us.1, %polly.loop_header371.us ]
  %241 = add nsw i64 %polly.indvar375.us, %203
  %242 = mul i64 %241, %6
  %243 = add nsw i64 %242, %218
  %scevgep381.us = getelementptr i64, i64* %3, i64 %243
  %_p_scalar_382.us = load i64, i64* %scevgep381.us, align 8, !alias.scope !212, !noalias !214, !llvm.mem.parallel_loop_access !219
  %244 = shl i64 %241, 3
  %245 = add i64 %244, %219
  %scevgep383.us = getelementptr i8, i8* %call9, i64 %245
  %scevgep383384.us = bitcast i8* %scevgep383.us to i64*
  store i64 %_p_scalar_382.us, i64* %scevgep383384.us, align 8, !alias.scope !215, !noalias !218, !llvm.mem.parallel_loop_access !219
  %polly.indvar_next376.us = add nuw nsw i64 %polly.indvar375.us, 1
  %246 = add nsw i64 %polly.indvar_next376.us, %203
  %247 = mul i64 %246, %6
  %248 = add nsw i64 %247, %218
  %scevgep381.us.1 = getelementptr i64, i64* %3, i64 %248
  %_p_scalar_382.us.1 = load i64, i64* %scevgep381.us.1, align 8, !alias.scope !212, !noalias !214, !llvm.mem.parallel_loop_access !219
  %249 = shl i64 %246, 3
  %250 = add i64 %249, %219
  %scevgep383.us.1 = getelementptr i8, i8* %call9, i64 %250
  %scevgep383384.us.1 = bitcast i8* %scevgep383.us.1 to i64*
  store i64 %_p_scalar_382.us.1, i64* %scevgep383384.us.1, align 8, !alias.scope !215, !noalias !218, !llvm.mem.parallel_loop_access !219
  %polly.indvar_next376.us.1 = add nsw i64 %polly.indvar375.us, 2
  %exitcond532.1 = icmp eq i64 %polly.indvar_next376.us.1, %pexp.pdiv_r369
  br i1 %exitcond532.1, label %polly.merge366.us.loopexit.unr-lcssa, label %polly.loop_header371.us, !llvm.loop !220

polly.merge366.us.loopexit.unr-lcssa:             ; preds = %polly.loop_header371.us
  br label %polly.merge366.us.loopexit

polly.merge366.us.loopexit:                       ; preds = %polly.loop_header371.us.preheader.split, %polly.merge366.us.loopexit.unr-lcssa
  br label %polly.merge366.us

polly.merge366.us:                                ; preds = %polly.merge366.us.loopexit, %polly.cond365.loopexit.us
  %polly.indvar_next342.us = add nuw nsw i64 %polly.indvar341.us, 1
  %polly.loop_cond344.us = icmp sgt i64 %polly.indvar341.us, %polly.adjust_ub343
  br i1 %polly.loop_cond344.us, label %polly.loop_exit339.loopexit, label %polly.loop_header337.us

polly.cond365.loopexit.us:                        ; preds = %polly.loop_header347.us
  br i1 %brmerge491, label %polly.merge366.us, label %polly.loop_header371.us.preheader

polly.loop_header371.us.preheader:                ; preds = %polly.cond365.loopexit.us
  br i1 %lcmp.mod574, label %polly.loop_header371.us.preheader.split, label %polly.loop_header371.us.prol

polly.loop_header371.us.prol:                     ; preds = %polly.loop_header371.us.preheader
  %251 = add nsw i64 %205, %218
  %scevgep381.us.prol = getelementptr i64, i64* %3, i64 %251
  %_p_scalar_382.us.prol = load i64, i64* %scevgep381.us.prol, align 8, !alias.scope !212, !noalias !214, !llvm.mem.parallel_loop_access !219
  %252 = add i64 %206, %219
  %scevgep383.us.prol = getelementptr i8, i8* %call9, i64 %252
  %scevgep383384.us.prol = bitcast i8* %scevgep383.us.prol to i64*
  store i64 %_p_scalar_382.us.prol, i64* %scevgep383384.us.prol, align 8, !alias.scope !215, !noalias !218, !llvm.mem.parallel_loop_access !219
  br label %polly.loop_header371.us.preheader.split

polly.loop_header371.us.preheader.split:          ; preds = %polly.loop_header371.us.preheader, %polly.loop_header371.us.prol
  %polly.indvar375.us.unr = phi i64 [ 0, %polly.loop_header371.us.preheader ], [ 1, %polly.loop_header371.us.prol ]
  br i1 %207, label %polly.merge366.us.loopexit, label %polly.loop_header371.us.preheader.split.split

polly.loop_header371.us.preheader.split.split:    ; preds = %polly.loop_header371.us.preheader.split
  br label %polly.loop_header371.us

polly.loop_exit339.loopexit:                      ; preds = %polly.merge366.us
  br label %polly.loop_exit339

polly.loop_exit339.loopexit557:                   ; preds = %polly.merge366
  br label %polly.loop_exit339

polly.loop_exit339:                               ; preds = %polly.loop_exit339.loopexit557, %polly.loop_exit339.loopexit, %polly.loop_header328
  %polly.indvar_next333 = add nuw nsw i64 %polly.indvar332, 1
  %exitcond533 = icmp eq i64 %polly.indvar332, %polly.fdiv_q.shr326
  br i1 %exitcond533, label %polly.loop_exit330.loopexit, label %polly.loop_header328

polly.loop_header337:                             ; preds = %polly.loop_header337.preheader556, %polly.merge366
  %polly.indvar341 = phi i64 [ %polly.indvar_next342, %polly.merge366 ], [ 0, %polly.loop_header337.preheader556 ]
  br i1 %brmerge491, label %polly.merge366, label %polly.loop_header371.preheader

polly.merge366.loopexit.unr-lcssa:                ; preds = %polly.loop_header371
  br label %polly.merge366.loopexit

polly.merge366.loopexit:                          ; preds = %polly.loop_header371.preheader.split, %polly.merge366.loopexit.unr-lcssa
  br label %polly.merge366

polly.merge366:                                   ; preds = %polly.merge366.loopexit, %polly.loop_header337
  %polly.indvar_next342 = add nuw nsw i64 %polly.indvar341, 1
  %polly.loop_cond344 = icmp sgt i64 %polly.indvar341, %polly.adjust_ub343
  br i1 %polly.loop_cond344, label %polly.loop_exit339.loopexit557, label %polly.loop_header337

polly.loop_header371.preheader:                   ; preds = %polly.loop_header337
  %253 = add nuw nsw i64 %polly.indvar341, %194
  %254 = mul i64 %253, %199
  br i1 %lcmp.mod572, label %polly.loop_header371.preheader.split, label %polly.loop_header371.prol

polly.loop_header371.prol:                        ; preds = %polly.loop_header371.preheader
  %255 = add nsw i64 %208, %253
  %scevgep381.prol = getelementptr i64, i64* %3, i64 %255
  %_p_scalar_382.prol = load i64, i64* %scevgep381.prol, align 8, !alias.scope !212, !noalias !214, !llvm.mem.parallel_loop_access !219
  %256 = add i64 %209, %254
  %scevgep383.prol = getelementptr i8, i8* %call9, i64 %256
  %scevgep383384.prol = bitcast i8* %scevgep383.prol to i64*
  store i64 %_p_scalar_382.prol, i64* %scevgep383384.prol, align 8, !alias.scope !215, !noalias !218, !llvm.mem.parallel_loop_access !219
  br label %polly.loop_header371.preheader.split

polly.loop_header371.preheader.split:             ; preds = %polly.loop_header371.preheader, %polly.loop_header371.prol
  %polly.indvar375.unr = phi i64 [ 0, %polly.loop_header371.preheader ], [ 1, %polly.loop_header371.prol ]
  br i1 %210, label %polly.merge366.loopexit, label %polly.loop_header371.preheader.split.split

polly.loop_header371.preheader.split.split:       ; preds = %polly.loop_header371.preheader.split
  br label %polly.loop_header371

polly.loop_header371:                             ; preds = %polly.loop_header371, %polly.loop_header371.preheader.split.split
  %polly.indvar375 = phi i64 [ %polly.indvar375.unr, %polly.loop_header371.preheader.split.split ], [ %polly.indvar_next376.1, %polly.loop_header371 ]
  %257 = add nsw i64 %polly.indvar375, %203
  %258 = mul i64 %257, %6
  %259 = add nsw i64 %258, %253
  %scevgep381 = getelementptr i64, i64* %3, i64 %259
  %_p_scalar_382 = load i64, i64* %scevgep381, align 8, !alias.scope !212, !noalias !214, !llvm.mem.parallel_loop_access !219
  %260 = shl i64 %257, 3
  %261 = add i64 %260, %254
  %scevgep383 = getelementptr i8, i8* %call9, i64 %261
  %scevgep383384 = bitcast i8* %scevgep383 to i64*
  store i64 %_p_scalar_382, i64* %scevgep383384, align 8, !alias.scope !215, !noalias !218, !llvm.mem.parallel_loop_access !219
  %polly.indvar_next376 = add nuw nsw i64 %polly.indvar375, 1
  %262 = add nsw i64 %polly.indvar_next376, %203
  %263 = mul i64 %262, %6
  %264 = add nsw i64 %263, %253
  %scevgep381.1 = getelementptr i64, i64* %3, i64 %264
  %_p_scalar_382.1 = load i64, i64* %scevgep381.1, align 8, !alias.scope !212, !noalias !214, !llvm.mem.parallel_loop_access !219
  %265 = shl i64 %262, 3
  %266 = add i64 %265, %254
  %scevgep383.1 = getelementptr i8, i8* %call9, i64 %266
  %scevgep383384.1 = bitcast i8* %scevgep383.1 to i64*
  store i64 %_p_scalar_382.1, i64* %scevgep383384.1, align 8, !alias.scope !215, !noalias !218, !llvm.mem.parallel_loop_access !219
  %polly.indvar_next376.1 = add nsw i64 %polly.indvar375, 2
  %exitcond530.1 = icmp eq i64 %polly.indvar_next376.1, %pexp.pdiv_r369
  br i1 %exitcond530.1, label %polly.merge366.loopexit.unr-lcssa, label %polly.loop_header371, !llvm.loop !220
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %args) #3 !dbg !41 {
entry:
  %max = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !48, metadata !57), !dbg !221
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !49, metadata !57), !dbg !222
  %0 = bitcast i32* %max to i8*, !dbg !223
  call void @llvm.lifetime.start(i64 4, i8* %0) #5, !dbg !223
  %arrayidx = getelementptr inbounds i8*, i8** %args, i64 1, !dbg !224
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !224, !tbaa !225
  tail call void @llvm.dbg.value(metadata i32* %max, i64 0, metadata !50, metadata !226), !dbg !227
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* nonnull %max) #5, !dbg !228
  %2 = load i32, i32* %max, align 4, !dbg !229, !tbaa !230
  call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !50, metadata !57), !dbg !227
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %2), !dbg !231
  %3 = load i32, i32* %max, align 4, !dbg !232, !tbaa !230
  call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !50, metadata !57), !dbg !227
  %call2 = call %struct.Matrix* @init(i32 %3, i32 %3), !dbg !233
  call void @llvm.dbg.value(metadata %struct.Matrix* %call2, i64 0, metadata !51, metadata !57), !dbg !235
  %4 = load i32, i32* %max, align 4, !dbg !236, !tbaa !230
  call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !50, metadata !57), !dbg !227
  %call3 = call %struct.Matrix* @init(i32 %4, i32 %4), !dbg !237
  call void @llvm.dbg.value(metadata %struct.Matrix* %call3, i64 0, metadata !52, metadata !57), !dbg !238
  %call4 = call %struct.Matrix* @matmult(%struct.Matrix* %call2, %struct.Matrix* %call3), !dbg !239
  call void @llvm.dbg.value(metadata %struct.Matrix* %call4, i64 0, metadata !53, metadata !57), !dbg !240
  %5 = load i32, i32* %max, align 4, !dbg !241, !tbaa !230
  call void @llvm.dbg.value(metadata i32 %5, i64 0, metadata !50, metadata !57), !dbg !227
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 %5, i32 %5), !dbg !242
  %6 = load i32, i32* %max, align 4, !dbg !243, !tbaa !230
  call void @llvm.dbg.value(metadata i32 %6, i64 0, metadata !50, metadata !57), !dbg !227
  %sub = add nsw i32 %6, -1, !dbg !244
  %add = mul i32 %6, %6, !dbg !245
  %sub8 = add nsw i32 %add, -1, !dbg !246
  %idxprom = sext i32 %sub8 to i64, !dbg !247
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call2, i64 0, i32 0, !dbg !248
  %7 = load i64*, i64** %data, align 8, !dbg !248, !tbaa !85
  %arrayidx9 = getelementptr inbounds i64, i64* %7, i64 %idxprom, !dbg !247
  %8 = load i64, i64* %arrayidx9, align 8, !dbg !247, !tbaa !149
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call3, i64 0, i32 0, !dbg !249
  %9 = load i64*, i64** %data17, align 8, !dbg !249, !tbaa !85
  %arrayidx18 = getelementptr inbounds i64, i64* %9, i64 %idxprom, !dbg !250
  %10 = load i64, i64* %arrayidx18, align 8, !dbg !250, !tbaa !149
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call4, i64 0, i32 0, !dbg !251
  %11 = load i64*, i64** %data26, align 8, !dbg !251, !tbaa !85
  %arrayidx27 = getelementptr inbounds i64, i64* %11, i64 %idxprom, !dbg !252
  %12 = load i64, i64* %arrayidx27, align 8, !dbg !252, !tbaa !149
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i64 0, i64 0), i32 %sub, i32 %6, i32 %sub, i64 %8, i32 %sub, i32 %6, i32 %sub, i64 %10, i32 %sub, i32 %6, i32 %sub, i64 %12), !dbg !253
  call void @llvm.lifetime.end(i64 4, i8* %0) #5, !dbg !254
  ret i32 0, !dbg !256
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
!39 = !DILocalVariable(name: "b_t", scope: !25, file: !1, line: 47, type: !4)
!40 = !DILocalVariable(name: "m", scope: !25, file: !1, line: 66, type: !10)
!41 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 73, type: !42, isLocal: false, isDefinition: true, scopeLine: 73, flags: DIFlagPrototyped, isOptimized: true, variables: !47)
!42 = !DISubroutineType(types: !43)
!43 = !{!16, !16, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64, align: 64)
!46 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!47 = !{!48, !49, !50, !51, !52, !53}
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !1, line: 73, type: !16)
!49 = !DILocalVariable(name: "args", arg: 2, scope: !41, file: !1, line: 73, type: !44)
!50 = !DILocalVariable(name: "max", scope: !41, file: !1, line: 75, type: !16)
!51 = !DILocalVariable(name: "a", scope: !41, file: !1, line: 79, type: !10)
!52 = !DILocalVariable(name: "b", scope: !41, file: !1, line: 80, type: !10)
!53 = !DILocalVariable(name: "c", scope: !41, file: !1, line: 82, type: !10)
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
!98 = distinct !{!98}
!99 = distinct !{!99, !100, !"polly.alias.scope.call"}
!100 = distinct !{!100, !"polly.alias.scope.domain"}
!101 = !{!98, !102}
!102 = distinct !{!102}
!103 = !DILocation(line: 26, column: 47, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 25, column: 33)
!105 = distinct !DILexicalBlock(scope: !106, file: !1, line: 25, column: 9)
!106 = distinct !DILexicalBlock(scope: !107, file: !1, line: 25, column: 9)
!107 = distinct !DILexicalBlock(scope: !108, file: !1, line: 24, column: 30)
!108 = distinct !DILexicalBlock(scope: !109, file: !1, line: 24, column: 5)
!109 = distinct !DILexicalBlock(scope: !7, file: !1, line: 24, column: 5)
!110 = !{!98, !111}
!111 = distinct !{!111}
!112 = !DILocation(line: 38, column: 25, scope: !25)
!113 = !DILocation(line: 38, column: 36, scope: !25)
!114 = !DILocation(line: 40, column: 20, scope: !25)
!115 = !DILocation(line: 40, column: 9, scope: !25)
!116 = !DILocation(line: 41, column: 21, scope: !25)
!117 = !DILocation(line: 41, column: 9, scope: !25)
!118 = !DILocation(line: 42, column: 28, scope: !25)
!119 = !DILocation(line: 42, column: 16, scope: !25)
!120 = !DILocation(line: 43, column: 28, scope: !25)
!121 = !DILocation(line: 43, column: 16, scope: !25)
!122 = !DILocation(line: 46, column: 45, scope: !25)
!123 = !DILocation(line: 46, column: 39, scope: !25)
!124 = !DILocation(line: 46, column: 51, scope: !25)
!125 = !DILocation(line: 46, column: 32, scope: !126)
!126 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 1)
!127 = !DILocation(line: 46, column: 20, scope: !25)
!128 = !DILocation(line: 46, column: 13, scope: !25)
!129 = !DILocation(line: 47, column: 22, scope: !126)
!130 = !DILocation(line: 47, column: 22, scope: !25)
!131 = !DILocation(line: 47, column: 16, scope: !25)
!132 = !DILocation(line: 39, column: 9, scope: !25)
!133 = !DILocation(line: 49, column: 16, scope: !134)
!134 = !DILexicalBlockFile(scope: !135, file: !1, discriminator: 1)
!135 = distinct !DILexicalBlock(scope: !136, file: !1, line: 49, column: 2)
!136 = distinct !DILexicalBlock(scope: !25, file: !1, line: 49, column: 2)
!137 = !DILocation(line: 49, column: 2, scope: !134)
!138 = !DILocation(line: 51, column: 17, scope: !139)
!139 = !DILexicalBlockFile(scope: !140, file: !1, discriminator: 1)
!140 = distinct !DILexicalBlock(scope: !141, file: !1, line: 51, column: 3)
!141 = distinct !DILexicalBlock(scope: !142, file: !1, line: 51, column: 3)
!142 = distinct !DILexicalBlock(scope: !135, file: !1, line: 49, column: 31)
!143 = !DILocation(line: 51, column: 3, scope: !139)
!144 = !DILocation(line: 52, column: 9, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !1, line: 51, column: 31)
!146 = !DILocation(line: 52, column: 29, scope: !145)
!147 = !DILocation(line: 52, column: 35, scope: !145)
!148 = !DILocation(line: 52, column: 21, scope: !145)
!149 = !{!150, !150, i64 0}
!150 = !{!"long long", !88, i64 0}
!151 = !DILocation(line: 52, column: 15, scope: !145)
!152 = !DILocation(line: 52, column: 4, scope: !145)
!153 = !DILocation(line: 52, column: 19, scope: !145)
!154 = distinct !{!154, !80}
!155 = !DILocation(line: 57, column: 17, scope: !156)
!156 = !DILexicalBlockFile(scope: !157, file: !1, discriminator: 1)
!157 = distinct !DILexicalBlock(scope: !158, file: !1, line: 57, column: 3)
!158 = distinct !DILexicalBlock(scope: !159, file: !1, line: 57, column: 3)
!159 = distinct !DILexicalBlock(scope: !160, file: !1, line: 55, column: 31)
!160 = distinct !DILexicalBlock(scope: !161, file: !1, line: 55, column: 2)
!161 = distinct !DILexicalBlock(scope: !25, file: !1, line: 55, column: 2)
!162 = !DILocation(line: 55, column: 2, scope: !163)
!163 = !DILexicalBlockFile(scope: !160, file: !1, discriminator: 1)
!164 = !DILocation(line: 60, column: 23, scope: !165)
!165 = distinct !DILexicalBlock(scope: !166, file: !1, line: 59, column: 24)
!166 = distinct !DILexicalBlock(scope: !167, file: !1, line: 59, column: 4)
!167 = distinct !DILexicalBlock(scope: !168, file: !1, line: 59, column: 4)
!168 = distinct !DILexicalBlock(scope: !157, file: !1, line: 57, column: 31)
!169 = !DILocation(line: 58, column: 10, scope: !168)
!170 = !DILocation(line: 58, column: 16, scope: !168)
!171 = !DILocation(line: 58, column: 4, scope: !168)
!172 = !DILocation(line: 58, column: 20, scope: !168)
!173 = !DILocation(line: 39, column: 12, scope: !25)
!174 = !DILocation(line: 60, column: 41, scope: !165)
!175 = !DILocation(line: 60, column: 59, scope: !165)
!176 = !DILocation(line: 60, column: 58, scope: !165)
!177 = !DILocation(line: 60, column: 21, scope: !165)
!178 = !DILocation(line: 59, column: 4, scope: !179)
!179 = !DILexicalBlockFile(scope: !166, file: !1, discriminator: 1)
!180 = !DILocation(line: 57, column: 3, scope: !156)
!181 = !DILocation(line: 60, column: 55, scope: !165)
!182 = !DILocation(line: 60, column: 39, scope: !165)
!183 = !DILocation(line: 66, column: 17, scope: !126)
!184 = !DILocation(line: 66, column: 17, scope: !25)
!185 = !DILocation(line: 66, column: 13, scope: !25)
!186 = !DILocation(line: 67, column: 8, scope: !25)
!187 = !DILocation(line: 67, column: 14, scope: !25)
!188 = !DILocation(line: 68, column: 8, scope: !25)
!189 = !DILocation(line: 68, column: 15, scope: !25)
!190 = !DILocation(line: 69, column: 13, scope: !25)
!191 = !DILocation(line: 70, column: 5, scope: !25)
!192 = distinct !{!192}
!193 = distinct !{!193, !194, !"polly.alias.scope.call"}
!194 = distinct !{!194, !"polly.alias.scope.domain"}
!195 = !{!196, !197}
!196 = distinct !{!196, !194, !"polly.alias.scope."}
!197 = distinct !{!197, !194, !"polly.alias.scope.call9"}
!198 = !{!192, !199}
!199 = distinct !{!199}
!200 = !{!192, !201}
!201 = distinct !{!201}
!202 = distinct !{!202, !80}
!203 = distinct !{!203, !80}
!204 = distinct !{!204}
!205 = !{!193, !197}
!206 = !{!204, !207}
!207 = distinct !{!207}
!208 = !{!193, !196}
!209 = !{!204, !210}
!210 = distinct !{!210}
!211 = distinct !{!211}
!212 = distinct !{!212, !213, !"polly.alias.scope."}
!213 = distinct !{!213, !"polly.alias.scope.domain"}
!214 = !{!215}
!215 = distinct !{!215, !213, !"polly.alias.scope.call9"}
!216 = !{!211, !217}
!217 = distinct !{!217}
!218 = !{!212}
!219 = !{!211, !220}
!220 = distinct !{!220}
!221 = !DILocation(line: 73, column: 14, scope: !41)
!222 = !DILocation(line: 73, column: 27, scope: !41)
!223 = !DILocation(line: 75, column: 5, scope: !41)
!224 = !DILocation(line: 76, column: 12, scope: !41)
!225 = !{!87, !87, i64 0}
!226 = !DIExpression(DW_OP_deref)
!227 = !DILocation(line: 75, column: 9, scope: !41)
!228 = !DILocation(line: 76, column: 5, scope: !41)
!229 = !DILocation(line: 77, column: 24, scope: !41)
!230 = !{!90, !90, i64 0}
!231 = !DILocation(line: 77, column: 5, scope: !41)
!232 = !DILocation(line: 79, column: 22, scope: !41)
!233 = !DILocation(line: 79, column: 17, scope: !234)
!234 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 1)
!235 = !DILocation(line: 79, column: 13, scope: !41)
!236 = !DILocation(line: 80, column: 22, scope: !41)
!237 = !DILocation(line: 80, column: 17, scope: !234)
!238 = !DILocation(line: 80, column: 13, scope: !41)
!239 = !DILocation(line: 82, column: 17, scope: !234)
!240 = !DILocation(line: 82, column: 13, scope: !41)
!241 = !DILocation(line: 87, column: 48, scope: !41)
!242 = !DILocation(line: 87, column: 5, scope: !41)
!243 = !DILocation(line: 89, column: 9, scope: !41)
!244 = !DILocation(line: 89, column: 12, scope: !41)
!245 = !DILocation(line: 89, column: 47, scope: !41)
!246 = !DILocation(line: 89, column: 51, scope: !41)
!247 = !DILocation(line: 89, column: 28, scope: !41)
!248 = !DILocation(line: 89, column: 31, scope: !41)
!249 = !DILocation(line: 90, column: 31, scope: !41)
!250 = !DILocation(line: 90, column: 28, scope: !41)
!251 = !DILocation(line: 91, column: 31, scope: !41)
!252 = !DILocation(line: 91, column: 28, scope: !41)
!253 = !DILocation(line: 88, column: 5, scope: !41)
!254 = !DILocation(line: 94, column: 1, scope: !255)
!255 = !DILexicalBlockFile(scope: !41, file: !1, discriminator: 3)
!256 = !DILocation(line: 93, column: 5, scope: !41)
