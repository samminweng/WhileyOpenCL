; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_has_ownership, i64 %n) #0 {
entry:
  %conv1 = trunc i64 %n to i32
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #6
  %0 = bitcast i64* %call to i8*
  %call10 = tail call i64* @gen1DArray(i32 0, i32 %conv1) #6
  %1 = bitcast i64* %call10 to i8*
  %call19 = tail call i64* @gen1DArray(i32 0, i32 %conv1) #6
  %2 = bitcast i64* %call19 to i8*
  %cmp294 = icmp sgt i64 %n, 0
  br i1 %cmp294, label %polly.split_new_and_old, label %if.then108

polly.split_new_and_old:                          ; preds = %entry
  %3 = icmp ne i64 %n, 9223372036854775807
  %polly.access.call = getelementptr i64, i64* %call, i64 %n
  %4 = icmp ule i64* %polly.access.call, %moves
  %polly.access.add.moves298 = mul i64 %n, %n
  %polly.access.moves299 = getelementptr i64, i64* %moves, i64 %polly.access.add.moves298
  %5 = icmp ule i64* %polly.access.moves299, %call
  %6 = or i1 %5, %4
  %7 = and i1 %3, %6
  %polly.access.call19 = getelementptr i64, i64* %call19, i64 %n
  %8 = icmp ule i64* %polly.access.call19, %moves
  %9 = icmp ule i64* %polly.access.moves299, %call19
  %10 = or i1 %9, %8
  %11 = and i1 %7, %10
  %polly.access.call10 = getelementptr i64, i64* %call10, i64 %n
  %12 = icmp ule i64* %polly.access.call10, %moves
  %13 = icmp ule i64* %polly.access.moves299, %call10
  %14 = or i1 %13, %12
  %15 = and i1 %14, %11
  %16 = icmp ule i64* %polly.access.call19, %call
  %17 = icmp ule i64* %polly.access.call, %call19
  %18 = or i1 %17, %16
  %19 = and i1 %18, %15
  %20 = icmp ule i64* %polly.access.call10, %call
  %21 = icmp ule i64* %polly.access.call, %call10
  %22 = or i1 %21, %20
  %23 = and i1 %22, %19
  %24 = icmp ule i64* %polly.access.call10, %call19
  %25 = icmp ule i64* %polly.access.call19, %call10
  %26 = or i1 %24, %25
  %27 = and i1 %26, %23
  br i1 %27, label %polly.loop_preheader, label %while.cond26.preheader.preheader

while.cond26.preheader.preheader:                 ; preds = %polly.split_new_and_old
  br label %while.cond26.preheader

while.cond26.preheader:                           ; preds = %while.cond26.preheader.preheader, %blklab2
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab2 ], [ %n, %while.cond26.preheader.preheader ]
  %s.0295 = phi i64 [ %add103, %blklab2 ], [ 0, %while.cond26.preheader.preheader ]
  br label %if.end31

if.end31:                                         ; preds = %blklab8, %while.cond26.preheader
  %i.0293 = phi i64 [ 0, %while.cond26.preheader ], [ %add, %blklab8 ]
  %j.0292 = phi i64 [ %s.0295, %while.cond26.preheader ], [ %add101, %blklab8 ]
  %arrayidx = getelementptr inbounds i64, i64* %call10, i64 %i.0293
  store i64 0, i64* %arrayidx, align 8, !tbaa !1
  %add = add nuw nsw i64 %i.0293, 1
  %cmp32 = icmp sge i64 %add, %n
  %cmp36 = icmp slt i64 %j.0292, 1
  %or.cond = or i1 %cmp36, %cmp32
  br i1 %or.cond, label %blklab4, label %if.end39

if.end39:                                         ; preds = %if.end31
  %mul = mul nsw i64 %add, %n
  %add41 = add nsw i64 %j.0292, -1
  %sub42 = add i64 %add41, %mul
  %arrayidx43 = getelementptr inbounds i64, i64* %moves, i64 %sub42
  %28 = load i64, i64* %arrayidx43, align 8, !tbaa !1
  store i64 %28, i64* %arrayidx, align 8, !tbaa !1
  br label %blklab4

blklab4:                                          ; preds = %if.end31, %if.end39
  %arrayidx45 = getelementptr inbounds i64, i64* %call, i64 %i.0293
  store i64 0, i64* %arrayidx45, align 8, !tbaa !1
  %add46 = add nuw nsw i64 %i.0293, 2
  %cmp47 = icmp slt i64 %add46, %n
  br i1 %cmp47, label %if.end50, label %blklab5

if.end50:                                         ; preds = %blklab4
  %mul52 = mul nsw i64 %add46, %n
  %add53 = add nsw i64 %mul52, %j.0292
  %arrayidx54 = getelementptr inbounds i64, i64* %moves, i64 %add53
  %29 = load i64, i64* %arrayidx54, align 8, !tbaa !1
  store i64 %29, i64* %arrayidx45, align 8, !tbaa !1
  br label %blklab5

blklab5:                                          ; preds = %blklab4, %if.end50
  %arrayidx56 = getelementptr inbounds i64, i64* %call19, i64 %i.0293
  store i64 0, i64* %arrayidx56, align 8, !tbaa !1
  %cmp58 = icmp slt i64 %j.0292, 2
  br i1 %cmp58, label %blklab6, label %if.end61

if.end61:                                         ; preds = %blklab5
  %mul62 = mul nsw i64 %i.0293, %n
  %add63 = add nsw i64 %j.0292, -2
  %sub64 = add i64 %add63, %mul62
  %arrayidx65 = getelementptr inbounds i64, i64* %moves, i64 %sub64
  %30 = load i64, i64* %arrayidx65, align 8, !tbaa !1
  store i64 %30, i64* %arrayidx56, align 8, !tbaa !1
  br label %blklab6

blklab6:                                          ; preds = %blklab5, %if.end61
  %31 = phi i64 [ 0, %blklab5 ], [ %30, %if.end61 ]
  %32 = load i64, i64* %arrayidx45, align 8, !tbaa !1
  %33 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %cmp69 = icmp sgt i64 %32, %33
  br i1 %cmp69, label %if.end72, label %blklab7

if.end72:                                         ; preds = %blklab6
  store i64 %33, i64* %arrayidx45, align 8, !tbaa !1
  %.pre = load i64, i64* %arrayidx56, align 8, !tbaa !1
  %.pre450 = load i64, i64* %arrayidx, align 8, !tbaa !1
  br label %blklab7

blklab7:                                          ; preds = %blklab6, %if.end72
  %34 = phi i64 [ %32, %blklab6 ], [ %33, %if.end72 ]
  %35 = phi i64 [ %33, %blklab6 ], [ %.pre450, %if.end72 ]
  %36 = phi i64 [ %31, %blklab6 ], [ %.pre, %if.end72 ]
  %cmp77 = icmp sgt i64 %36, %35
  br i1 %cmp77, label %if.end80, label %blklab8

if.end80:                                         ; preds = %blklab7
  store i64 %35, i64* %arrayidx56, align 8, !tbaa !1
  %.pre451 = load i64, i64* %arrayidx45, align 8, !tbaa !1
  br label %blklab8

blklab8:                                          ; preds = %blklab7, %if.end80
  %37 = phi i64 [ %36, %blklab7 ], [ %35, %if.end80 ]
  %38 = phi i64 [ %34, %blklab7 ], [ %.pre451, %if.end80 ]
  %add84 = add nsw i64 %38, %i.0293
  %add86 = add nsw i64 %37, %j.0292
  %cmp87 = icmp sgt i64 %add84, %add86
  %mul93 = mul nsw i64 %i.0293, %n
  %add94 = add nsw i64 %mul93, %j.0292
  %arrayidx95 = getelementptr inbounds i64, i64* %moves, i64 %add94
  %add84.add86 = select i1 %cmp87, i64 %add84, i64 %add86
  store i64 %add84.add86, i64* %arrayidx95, align 8, !tbaa !1
  %add101 = add nuw nsw i64 %j.0292, 1
  %exitcond = icmp eq i64 %add, %indvars.iv
  br i1 %exitcond, label %blklab2, label %if.end31

blklab2:                                          ; preds = %blklab8
  %add103 = add nuw nsw i64 %s.0295, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %exitcond296 = icmp eq i64 %add103, %n
  br i1 %exitcond296, label %if.then108.loopexit454, label %while.cond26.preheader

if.then108.loopexit:                              ; preds = %polly.loop_exit431
  br label %if.then108

if.then108.loopexit454:                           ; preds = %blklab2
  br label %if.then108

if.then108:                                       ; preds = %if.then108.loopexit454, %if.then108.loopexit, %entry
  tail call void @free(i8* %0) #6
  tail call void @free(i8* %1) #6
  tail call void @free(i8* %2) #6
  ret i64* %moves

polly.loop_header:                                ; preds = %polly.loop_exit431, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit431 ]
  %39 = sub i64 %54, %polly.indvar
  %40 = icmp sgt i64 %39, 0
  %smax448 = select i1 %40, i64 %39, i64 0
  %41 = shl i64 %smax448, 3
  %42 = add i64 %41, 8
  %43 = sub nsw i64 %n, %polly.indvar
  %polly.loop_guard331 = icmp sgt i64 %43, 0
  br i1 %polly.loop_guard331, label %polly.loop_header347.preheader, label %polly.loop_exit349

polly.loop_header347.preheader:                   ; preds = %polly.loop_header
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 %42, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 %42, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 %42, i32 8, i1 false)
  br label %polly.loop_exit349

polly.loop_exit349:                               ; preds = %polly.loop_header347.preheader, %polly.loop_header
  %44 = sub nsw i64 1, %polly.indvar
  %45 = icmp slt i64 %44, 0
  %46 = select i1 %45, i64 0, i64 %44
  %47 = icmp slt i64 %54, %43
  %48 = select i1 %47, i64 %54, i64 %43
  %polly.loop_guard360 = icmp slt i64 %46, %48
  br i1 %polly.loop_guard360, label %polly.loop_preheader358, label %polly.loop_exit359

polly.loop_exit359.loopexit:                      ; preds = %polly.loop_header357
  br label %polly.loop_exit359

polly.loop_exit359:                               ; preds = %polly.loop_exit359.loopexit, %polly.loop_exit349
  %49 = sub nsw i64 2, %polly.indvar
  %50 = icmp slt i64 %49, 0
  %51 = select i1 %50, i64 0, i64 %49
  %polly.loop_guard374 = icmp slt i64 %51, %43
  br i1 %polly.loop_guard374, label %polly.loop_preheader372, label %polly.loop_exit373

polly.loop_exit373.loopexit:                      ; preds = %polly.loop_header371
  br label %polly.loop_exit373

polly.loop_exit373:                               ; preds = %polly.loop_exit373.loopexit, %polly.loop_exit359
  %52 = icmp slt i64 %58, %43
  %53 = select i1 %52, i64 %58, i64 %43
  %polly.loop_guard390 = icmp sgt i64 %53, 0
  br i1 %polly.loop_guard390, label %polly.loop_preheader388, label %polly.loop_exit389

polly.loop_exit389.loopexit:                      ; preds = %polly.loop_header387
  br label %polly.loop_exit389

polly.loop_exit389:                               ; preds = %polly.loop_exit389.loopexit, %polly.loop_exit373
  br i1 %polly.loop_guard331, label %polly.loop_header403.preheader, label %polly.loop_exit431

polly.loop_header403.preheader:                   ; preds = %polly.loop_exit389
  %polly.adjust_ub409 = add i64 %43, -1
  br label %polly.loop_header403

polly.loop_exit431.loopexit:                      ; preds = %polly.loop_header429
  br label %polly.loop_exit431

polly.loop_exit431:                               ; preds = %polly.loop_exit431.loopexit, %polly.loop_exit389
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond449 = icmp eq i64 %polly.indvar_next, %n
  br i1 %exitcond449, label %if.then108.loopexit, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.split_new_and_old
  %54 = add i64 %n, -1
  %scevgep365 = getelementptr i64, i64* %moves, i64 %54
  %55 = shl i64 %n, 3
  %56 = add i64 %55, 8
  %scevgep379 = getelementptr i64, i64* %moves, i64 -2
  %57 = shl i64 %n, 1
  %scevgep395 = getelementptr i64, i64* %moves, i64 %57
  %58 = add nsw i64 %n, -2
  br label %polly.loop_header

polly.loop_header357:                             ; preds = %polly.loop_header357, %polly.loop_preheader358
  %polly.indvar361 = phi i64 [ %46, %polly.loop_preheader358 ], [ %polly.indvar_next362, %polly.loop_header357 ]
  %59 = mul i64 %polly.indvar361, %56
  %uglygep = getelementptr i8, i8* %scevgep366367, i64 %59
  %uglygep368 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep368, align 8, !alias.scope !5, !noalias !7, !llvm.mem.parallel_loop_access !12
  %scevgep369 = getelementptr i64, i64* %call10, i64 %polly.indvar361
  store i64 %_p_scalar_, i64* %scevgep369, align 8, !alias.scope !8, !noalias !13, !llvm.mem.parallel_loop_access !12
  %polly.indvar_next362 = add nuw nsw i64 %polly.indvar361, 1
  %polly.loop_cond364 = icmp slt i64 %polly.indvar361, %polly.adjust_ub363
  br i1 %polly.loop_cond364, label %polly.loop_header357, label %polly.loop_exit359.loopexit, !llvm.loop !12

polly.loop_preheader358:                          ; preds = %polly.loop_exit349
  %scevgep366 = getelementptr i64, i64* %scevgep365, i64 %polly.indvar
  %scevgep366367 = bitcast i64* %scevgep366 to i8*
  %polly.adjust_ub363 = add i64 %48, -1
  br label %polly.loop_header357

polly.loop_header371:                             ; preds = %polly.loop_header371, %polly.loop_preheader372
  %polly.indvar375 = phi i64 [ %51, %polly.loop_preheader372 ], [ %polly.indvar_next376, %polly.loop_header371 ]
  %60 = mul i64 %polly.indvar375, %56
  %uglygep382 = getelementptr i8, i8* %scevgep380381, i64 %60
  %uglygep382383 = bitcast i8* %uglygep382 to i64*
  %_p_scalar_384 = load i64, i64* %uglygep382383, align 8, !alias.scope !5, !noalias !7, !llvm.mem.parallel_loop_access !14
  %scevgep385 = getelementptr i64, i64* %call19, i64 %polly.indvar375
  store i64 %_p_scalar_384, i64* %scevgep385, align 8, !alias.scope !9, !noalias !15, !llvm.mem.parallel_loop_access !14
  %polly.indvar_next376 = add nuw nsw i64 %polly.indvar375, 1
  %polly.loop_cond378 = icmp slt i64 %polly.indvar375, %polly.adjust_ub377
  br i1 %polly.loop_cond378, label %polly.loop_header371, label %polly.loop_exit373.loopexit, !llvm.loop !14

polly.loop_preheader372:                          ; preds = %polly.loop_exit359
  %scevgep380 = getelementptr i64, i64* %scevgep379, i64 %polly.indvar
  %scevgep380381 = bitcast i64* %scevgep380 to i8*
  %polly.adjust_ub377 = add i64 %43, -1
  br label %polly.loop_header371

polly.loop_header387:                             ; preds = %polly.loop_header387, %polly.loop_preheader388
  %polly.indvar391 = phi i64 [ 0, %polly.loop_preheader388 ], [ %polly.indvar_next392, %polly.loop_header387 ]
  %61 = mul i64 %polly.indvar391, %56
  %uglygep398 = getelementptr i8, i8* %scevgep396397, i64 %61
  %uglygep398399 = bitcast i8* %uglygep398 to i64*
  %_p_scalar_400 = load i64, i64* %uglygep398399, align 8, !alias.scope !5, !noalias !7, !llvm.mem.parallel_loop_access !16
  %scevgep401 = getelementptr i64, i64* %call, i64 %polly.indvar391
  store i64 %_p_scalar_400, i64* %scevgep401, align 8, !alias.scope !10, !noalias !17, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next392 = add nuw nsw i64 %polly.indvar391, 1
  %polly.loop_cond394 = icmp slt i64 %polly.indvar391, %polly.adjust_ub393
  br i1 %polly.loop_cond394, label %polly.loop_header387, label %polly.loop_exit389.loopexit, !llvm.loop !16

polly.loop_preheader388:                          ; preds = %polly.loop_exit373
  %scevgep396 = getelementptr i64, i64* %scevgep395, i64 %polly.indvar
  %scevgep396397 = bitcast i64* %scevgep396 to i8*
  %polly.adjust_ub393 = add i64 %53, -1
  br label %polly.loop_header387

polly.loop_header403:                             ; preds = %polly.loop_header403.preheader, %polly.stmt.blklab7.exit
  %polly.indvar407 = phi i64 [ %polly.indvar_next408, %polly.stmt.blklab7.exit ], [ 0, %polly.loop_header403.preheader ]
  %scevgep411 = getelementptr i64, i64* %call, i64 %polly.indvar407
  %_p_scalar_412 = load i64, i64* %scevgep411, align 8, !alias.scope !10, !noalias !17, !llvm.mem.parallel_loop_access !18
  %scevgep413 = getelementptr i64, i64* %call10, i64 %polly.indvar407
  %_p_scalar_414 = load i64, i64* %scevgep413, align 8, !alias.scope !8, !noalias !13, !llvm.mem.parallel_loop_access !18
  %p_cmp69 = icmp sgt i64 %_p_scalar_412, %_p_scalar_414
  br i1 %p_cmp69, label %polly.stmt.if.end72, label %polly.stmt.blklab7.exit

polly.stmt.if.end72:                              ; preds = %polly.loop_header403
  store i64 %_p_scalar_414, i64* %scevgep411, align 8, !alias.scope !10, !noalias !17, !llvm.mem.parallel_loop_access !18
  br label %polly.stmt.blklab7.exit

polly.stmt.blklab7.exit:                          ; preds = %polly.stmt.if.end72, %polly.loop_header403
  %polly.indvar_next408 = add nuw nsw i64 %polly.indvar407, 1
  %polly.loop_cond410 = icmp slt i64 %polly.indvar407, %polly.adjust_ub409
  br i1 %polly.loop_cond410, label %polly.loop_header403, label %polly.loop_header416.preheader, !llvm.loop !18

polly.loop_header416.preheader:                   ; preds = %polly.stmt.blklab7.exit
  br label %polly.loop_header416

polly.loop_header416:                             ; preds = %polly.loop_header416.preheader, %polly.stmt.blklab8.exit
  %polly.indvar420 = phi i64 [ %polly.indvar_next421, %polly.stmt.blklab8.exit ], [ 0, %polly.loop_header416.preheader ]
  %scevgep424 = getelementptr i64, i64* %call19, i64 %polly.indvar420
  %_p_scalar_425 = load i64, i64* %scevgep424, align 8, !alias.scope !9, !noalias !15, !llvm.mem.parallel_loop_access !19
  %scevgep426 = getelementptr i64, i64* %call10, i64 %polly.indvar420
  %_p_scalar_427 = load i64, i64* %scevgep426, align 8, !alias.scope !8, !noalias !13, !llvm.mem.parallel_loop_access !19
  %p_cmp77 = icmp sgt i64 %_p_scalar_425, %_p_scalar_427
  br i1 %p_cmp77, label %polly.stmt.if.end80, label %polly.stmt.blklab8.exit

polly.stmt.if.end80:                              ; preds = %polly.loop_header416
  store i64 %_p_scalar_427, i64* %scevgep424, align 8, !alias.scope !9, !noalias !15, !llvm.mem.parallel_loop_access !19
  br label %polly.stmt.blklab8.exit

polly.stmt.blklab8.exit:                          ; preds = %polly.stmt.if.end80, %polly.loop_header416
  %polly.indvar_next421 = add nuw nsw i64 %polly.indvar420, 1
  %polly.loop_cond423 = icmp slt i64 %polly.indvar420, %polly.adjust_ub409
  br i1 %polly.loop_cond423, label %polly.loop_header416, label %polly.loop_preheader430, !llvm.loop !19

polly.loop_header429:                             ; preds = %polly.loop_header429, %polly.loop_preheader430
  %polly.indvar433 = phi i64 [ 0, %polly.loop_preheader430 ], [ %polly.indvar_next434, %polly.loop_header429 ]
  %scevgep437 = getelementptr i64, i64* %call, i64 %polly.indvar433
  %_p_scalar_438 = load i64, i64* %scevgep437, align 8, !alias.scope !10, !noalias !17
  %p_add84 = add nsw i64 %_p_scalar_438, %polly.indvar433
  %scevgep439 = getelementptr i64, i64* %call19, i64 %polly.indvar433
  %_p_scalar_440 = load i64, i64* %scevgep439, align 8, !alias.scope !9, !noalias !15
  %62 = add nuw i64 %polly.indvar433, %polly.indvar
  %p_add86 = add nsw i64 %62, %_p_scalar_440
  %p_cmp87 = icmp sgt i64 %p_add84, %p_add86
  %polly.storemerge = select i1 %p_cmp87, i64 %p_add84, i64 %p_add86
  %63 = mul i64 %polly.indvar433, %56
  %uglygep443 = getelementptr i8, i8* %scevgep441442, i64 %63
  %uglygep443444 = bitcast i8* %uglygep443 to i64*
  store i64 %polly.storemerge, i64* %uglygep443444, align 8, !alias.scope !5, !noalias !7
  %polly.indvar_next434 = add nuw nsw i64 %polly.indvar433, 1
  %polly.loop_cond436 = icmp slt i64 %polly.indvar433, %polly.adjust_ub409
  br i1 %polly.loop_cond436, label %polly.loop_header429, label %polly.loop_exit431.loopexit

polly.loop_preheader430:                          ; preds = %polly.stmt.blklab8.exit
  %scevgep441 = getelementptr i64, i64* %moves, i64 %polly.indvar
  %scevgep441442 = bitcast i64* %scevgep441 to i8*
  br label %polly.loop_header429
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #3 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !20
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end122.critedge, label %if.then103

if.then103:                                       ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %mul = mul nsw i64 %1, %1
  %conv6 = trunc i64 %mul to i32
  %call7 = tail call i64* @gen1DArray(i32 0, i32 %conv6) #6
  %call14 = tail call i64* @findMoves(i64* %call7, i64 undef, i1 zeroext undef, i64 %1)
  %sub18 = add nsw i64 %1, -1
  %arrayidx19 = getelementptr inbounds i64, i64* %call14, i64 %sub18
  %2 = load i64, i64* %arrayidx19, align 8, !tbaa !1
  %call23 = tail call noalias i8* @malloc(i64 400) #6
  %3 = bitcast i8* %call23 to i64*
  %4 = bitcast i8* %call23 to <2 x i64>*
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %4, align 8, !tbaa !1
  %arrayidx26 = getelementptr inbounds i8, i8* %call23, i64 16
  %5 = bitcast i8* %arrayidx26 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %5, align 8, !tbaa !1
  %arrayidx28 = getelementptr inbounds i8, i8* %call23, i64 32
  %6 = bitcast i8* %arrayidx28 to <2 x i64>*
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %6, align 8, !tbaa !1
  %arrayidx30 = getelementptr inbounds i8, i8* %call23, i64 48
  %7 = bitcast i8* %arrayidx30 to <2 x i64>*
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx32 = getelementptr inbounds i8, i8* %call23, i64 64
  %8 = bitcast i8* %arrayidx32 to <2 x i64>*
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx34 = getelementptr inbounds i8, i8* %call23, i64 80
  %9 = bitcast i8* %arrayidx34 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx36 = getelementptr inbounds i8, i8* %call23, i64 96
  %10 = bitcast i8* %arrayidx36 to <2 x i64>*
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx38 = getelementptr inbounds i8, i8* %call23, i64 112
  %11 = bitcast i8* %arrayidx38 to <2 x i64>*
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx40 = getelementptr inbounds i8, i8* %call23, i64 128
  %12 = bitcast i8* %arrayidx40 to <2 x i64>*
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx42 = getelementptr inbounds i8, i8* %call23, i64 144
  %13 = bitcast i8* %arrayidx42 to <2 x i64>*
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx44 = getelementptr inbounds i8, i8* %call23, i64 160
  %14 = bitcast i8* %arrayidx44 to <2 x i64>*
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx46 = getelementptr inbounds i8, i8* %call23, i64 176
  %15 = bitcast i8* %arrayidx46 to <2 x i64>*
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx48 = getelementptr inbounds i8, i8* %call23, i64 192
  %16 = bitcast i8* %arrayidx48 to <2 x i64>*
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx50 = getelementptr inbounds i8, i8* %call23, i64 208
  %17 = bitcast i8* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx52 = getelementptr inbounds i8, i8* %call23, i64 224
  %18 = bitcast i8* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx54 = getelementptr inbounds i8, i8* %call23, i64 240
  %19 = bitcast i8* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %19, align 8, !tbaa !1
  %arrayidx56 = getelementptr inbounds i8, i8* %call23, i64 256
  %20 = bitcast i8* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %20, align 8, !tbaa !1
  %arrayidx58 = getelementptr inbounds i8, i8* %call23, i64 272
  %21 = bitcast i8* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %21, align 8, !tbaa !1
  %arrayidx60 = getelementptr inbounds i8, i8* %call23, i64 288
  %22 = bitcast i8* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %22, align 8, !tbaa !1
  %arrayidx62 = getelementptr inbounds i8, i8* %call23, i64 304
  %23 = bitcast i8* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %23, align 8, !tbaa !1
  %arrayidx64 = getelementptr inbounds i8, i8* %call23, i64 320
  %24 = bitcast i8* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %24, align 8, !tbaa !1
  %arrayidx66 = getelementptr inbounds i8, i8* %call23, i64 336
  %25 = bitcast i8* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %25, align 8, !tbaa !1
  %arrayidx68 = getelementptr inbounds i8, i8* %call23, i64 352
  %26 = bitcast i8* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %26, align 8, !tbaa !1
  %arrayidx70 = getelementptr inbounds i8, i8* %call23, i64 368
  %27 = bitcast i8* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %27, align 8, !tbaa !1
  %arrayidx72 = getelementptr inbounds i8, i8* %call23, i64 384
  %28 = bitcast i8* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %28, align 8, !tbaa !1
  tail call void @printf_s(i64* %3, i64 50) #6
  %call74 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2)
  %call78 = tail call noalias i8* @malloc(i64 184) #6
  %29 = bitcast i8* %call78 to i64*
  %30 = bitcast i8* %call78 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %30, align 8, !tbaa !1
  %arrayidx81 = getelementptr inbounds i8, i8* %call78, i64 16
  %31 = bitcast i8* %arrayidx81 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx83 = getelementptr inbounds i8, i8* %call78, i64 32
  %32 = bitcast i8* %arrayidx83 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx85 = getelementptr inbounds i8, i8* %call78, i64 48
  %33 = bitcast i8* %arrayidx85 to <2 x i64>*
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx87 = getelementptr inbounds i8, i8* %call78, i64 64
  %34 = bitcast i8* %arrayidx87 to <2 x i64>*
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx89 = getelementptr inbounds i8, i8* %call78, i64 80
  %35 = bitcast i8* %arrayidx89 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx91 = getelementptr inbounds i8, i8* %call78, i64 96
  %36 = bitcast i8* %arrayidx91 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx93 = getelementptr inbounds i8, i8* %call78, i64 112
  %37 = bitcast i8* %arrayidx93 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx95 = getelementptr inbounds i8, i8* %call78, i64 128
  %38 = bitcast i8* %arrayidx95 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx97 = getelementptr inbounds i8, i8* %call78, i64 144
  %39 = bitcast i8* %arrayidx97 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx99 = getelementptr inbounds i8, i8* %call78, i64 160
  %40 = bitcast i8* %arrayidx99 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %40, align 8, !tbaa !1
  %arrayidx101 = getelementptr inbounds i8, i8* %call78, i64 176
  %41 = bitcast i8* %arrayidx101 to i64*
  store i64 101, i64* %41, align 8, !tbaa !1
  tail call void @println_s(i64* %29, i64 23) #6
  %phitmp = bitcast i64* %call14 to i8*
  tail call void @free(i8* %phitmp) #6
  tail call void @free2DArray(i64** %call, i64 %conv) #6
  tail call void @free(i8* %call23) #6
  tail call void @free(i8* %call78) #6
  br label %if.end122

if.end122.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #6
  br label %if.end122

if.end122:                                        ; preds = %if.end122.critedge, %if.then103
  tail call void @exit(i32 0) #7
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare void @printf_s(i64*, i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

declare void @println_s(i64*, i64) #2

declare void @free2DArray(i64**, i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 2af14cc4a90f43170f8ea9c1dfa0f71f46a0621c) (http://llvm.org/git/llvm.git 1e7e2b2b556977af8ccc12b7afba61302f3a2da9)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6, !"polly.alias.scope.moves"}
!6 = distinct !{!6, !"polly.alias.scope.domain"}
!7 = !{!8, !9, !10, !11}
!8 = distinct !{!8, !6, !"polly.alias.scope.call10"}
!9 = distinct !{!9, !6, !"polly.alias.scope.call19"}
!10 = distinct !{!10, !6, !"polly.alias.scope.call"}
!11 = distinct !{!11, !6, !"polly.alias.scope.storemerge"}
!12 = distinct !{!12}
!13 = !{!9, !10, !11, !5}
!14 = distinct !{!14}
!15 = !{!8, !10, !11, !5}
!16 = distinct !{!16}
!17 = !{!8, !9, !11, !5}
!18 = distinct !{!18}
!19 = distinct !{!19}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !3, i64 0}
