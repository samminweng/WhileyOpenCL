; ModuleID = 'CoinGame_array.c'
source_filename = "CoinGame_array.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_dealloc, i64 %n) local_unnamed_addr #0 {
entry:
  %conv1 = trunc i64 %n to i32
  %call = tail call i64* @create1DArray(i32 0, i32 %conv1) #7
  %0 = bitcast i64* %call to i8*
  %call12 = tail call i64* @create1DArray(i32 0, i32 %conv1) #7
  %1 = bitcast i64* %call12 to i8*
  %call23 = tail call i64* @create1DArray(i32 0, i32 %conv1) #7
  %2 = bitcast i64* %call23 to i8*
  %cmp303 = icmp sgt i64 %n, 0
  br i1 %cmp303, label %polly.split_new_and_old, label %if.then114

polly.split_new_and_old:                          ; preds = %entry
  %3 = icmp ne i64 %n, 9223372036854775807
  %4 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %n, i64 1)
  %.obit = extractvalue { i64, i1 } %4, 1
  %.res = extractvalue { i64, i1 } %4, 0
  %polly.access.mul.moves = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.res, i64 %n)
  %polly.access.mul.moves.obit = extractvalue { i64, i1 } %polly.access.mul.moves, 1
  %polly.overflow.state306 = or i1 %.obit, %polly.access.mul.moves.obit
  %polly.access.mul.moves.res = extractvalue { i64, i1 } %polly.access.mul.moves, 0
  %polly.access.add.moves = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %polly.access.mul.moves.res, i64 %n)
  %polly.access.add.moves.obit = extractvalue { i64, i1 } %polly.access.add.moves, 1
  %polly.access.add.moves.res = extractvalue { i64, i1 } %polly.access.add.moves, 0
  %polly.access.moves = getelementptr i64, i64* %moves, i64 %polly.access.add.moves.res
  %5 = icmp ule i64* %polly.access.moves, %call12
  %polly.access.call12308 = getelementptr i64, i64* %call12, i64 %n
  %6 = icmp ule i64* %polly.access.call12308, %moves
  %7 = or i1 %5, %6
  %8 = and i1 %3, %7
  %polly.access.call = getelementptr i64, i64* %call, i64 %n
  %9 = icmp ule i64* %polly.access.call, %call12
  %10 = icmp ule i64* %polly.access.call12308, %call
  %11 = or i1 %9, %10
  %12 = and i1 %11, %8
  %polly.access.call23 = getelementptr i64, i64* %call23, i64 %n
  %13 = icmp ule i64* %polly.access.call23, %call12
  %14 = icmp ule i64* %polly.access.call12308, %call23
  %15 = or i1 %14, %13
  %16 = and i1 %15, %12
  %polly.overflow.state331 = or i1 %polly.overflow.state306, %polly.access.add.moves.obit
  %17 = icmp ule i64* %polly.access.call, %moves
  %18 = icmp ule i64* %polly.access.moves, %call
  %19 = or i1 %18, %17
  %20 = and i1 %19, %16
  %21 = icmp ule i64* %polly.access.call23, %moves
  %22 = icmp ule i64* %polly.access.moves, %call23
  %23 = or i1 %22, %21
  %24 = and i1 %23, %20
  %25 = icmp ule i64* %polly.access.call23, %call
  %26 = icmp ule i64* %polly.access.call, %call23
  %27 = or i1 %26, %25
  %28 = and i1 %27, %24
  %polly.rtc.overflown = xor i1 %polly.overflow.state331, true
  %polly.rtc.result = and i1 %28, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.loop_preheader, label %while.cond32.preheader.preheader

while.cond32.preheader.preheader:                 ; preds = %polly.split_new_and_old
  br label %while.cond32.preheader

while.cond32.preheader:                           ; preds = %while.cond32.preheader.preheader, %blklab2
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab2 ], [ %n, %while.cond32.preheader.preheader ]
  %s.0304 = phi i64 [ %add109, %blklab2 ], [ 0, %while.cond32.preheader.preheader ]
  br label %if.end37

if.end37:                                         ; preds = %blklab8, %while.cond32.preheader
  %i.0302 = phi i64 [ 0, %while.cond32.preheader ], [ %add, %blklab8 ]
  %j.0301 = phi i64 [ %s.0304, %while.cond32.preheader ], [ %add107, %blklab8 ]
  %arrayidx = getelementptr inbounds i64, i64* %call12, i64 %i.0302
  store i64 0, i64* %arrayidx, align 8, !tbaa !1
  %add = add nuw nsw i64 %i.0302, 1
  %cmp38 = icmp sge i64 %add, %n
  %cmp42 = icmp slt i64 %j.0301, 1
  %or.cond = or i1 %cmp42, %cmp38
  br i1 %or.cond, label %blklab4, label %if.end45

if.end45:                                         ; preds = %if.end37
  %mul = mul nsw i64 %add, %n
  %add47 = add nsw i64 %j.0301, -1
  %sub48 = add i64 %add47, %mul
  %arrayidx49 = getelementptr inbounds i64, i64* %moves, i64 %sub48
  %29 = load i64, i64* %arrayidx49, align 8, !tbaa !1
  store i64 %29, i64* %arrayidx, align 8, !tbaa !1
  br label %blklab4

blklab4:                                          ; preds = %if.end37, %if.end45
  %arrayidx51 = getelementptr inbounds i64, i64* %call, i64 %i.0302
  store i64 0, i64* %arrayidx51, align 8, !tbaa !1
  %add52 = add nuw nsw i64 %i.0302, 2
  %cmp53 = icmp slt i64 %add52, %n
  br i1 %cmp53, label %if.end56, label %blklab5

if.end56:                                         ; preds = %blklab4
  %mul58 = mul nsw i64 %add52, %n
  %add59 = add nsw i64 %mul58, %j.0301
  %arrayidx60 = getelementptr inbounds i64, i64* %moves, i64 %add59
  %30 = load i64, i64* %arrayidx60, align 8, !tbaa !1
  store i64 %30, i64* %arrayidx51, align 8, !tbaa !1
  br label %blklab5

blklab5:                                          ; preds = %blklab4, %if.end56
  %arrayidx62 = getelementptr inbounds i64, i64* %call23, i64 %i.0302
  store i64 0, i64* %arrayidx62, align 8, !tbaa !1
  %cmp64 = icmp slt i64 %j.0301, 2
  br i1 %cmp64, label %blklab6, label %if.end67

if.end67:                                         ; preds = %blklab5
  %mul68 = mul nsw i64 %i.0302, %n
  %add69 = add nsw i64 %j.0301, -2
  %sub70 = add i64 %add69, %mul68
  %arrayidx71 = getelementptr inbounds i64, i64* %moves, i64 %sub70
  %31 = load i64, i64* %arrayidx71, align 8, !tbaa !1
  store i64 %31, i64* %arrayidx62, align 8, !tbaa !1
  br label %blklab6

blklab6:                                          ; preds = %blklab5, %if.end67
  %32 = phi i64 [ 0, %blklab5 ], [ %31, %if.end67 ]
  %33 = load i64, i64* %arrayidx51, align 8, !tbaa !1
  %34 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %cmp75 = icmp sgt i64 %33, %34
  br i1 %cmp75, label %if.end78, label %blklab7

if.end78:                                         ; preds = %blklab6
  store i64 %34, i64* %arrayidx51, align 8, !tbaa !1
  %.pre = load i64, i64* %arrayidx62, align 8, !tbaa !1
  %.pre497 = load i64, i64* %arrayidx, align 8, !tbaa !1
  br label %blklab7

blklab7:                                          ; preds = %blklab6, %if.end78
  %35 = phi i64 [ %33, %blklab6 ], [ %34, %if.end78 ]
  %36 = phi i64 [ %34, %blklab6 ], [ %.pre497, %if.end78 ]
  %37 = phi i64 [ %32, %blklab6 ], [ %.pre, %if.end78 ]
  %cmp83 = icmp sgt i64 %37, %36
  br i1 %cmp83, label %if.end86, label %blklab8

if.end86:                                         ; preds = %blklab7
  store i64 %36, i64* %arrayidx62, align 8, !tbaa !1
  %.pre498 = load i64, i64* %arrayidx51, align 8, !tbaa !1
  br label %blklab8

blklab8:                                          ; preds = %blklab7, %if.end86
  %38 = phi i64 [ %37, %blklab7 ], [ %36, %if.end86 ]
  %39 = phi i64 [ %35, %blklab7 ], [ %.pre498, %if.end86 ]
  %add90 = add nsw i64 %39, %i.0302
  %add92 = add nsw i64 %38, %j.0301
  %cmp93 = icmp sgt i64 %add90, %add92
  %mul99 = mul nsw i64 %i.0302, %n
  %add100 = add nsw i64 %mul99, %j.0301
  %arrayidx101 = getelementptr inbounds i64, i64* %moves, i64 %add100
  %add90.add92 = select i1 %cmp93, i64 %add90, i64 %add92
  store i64 %add90.add92, i64* %arrayidx101, align 8, !tbaa !1
  %add107 = add nuw nsw i64 %j.0301, 1
  %exitcond = icmp eq i64 %add, %indvars.iv
  br i1 %exitcond, label %blklab2, label %if.end37

blklab2:                                          ; preds = %blklab8
  %add109 = add nuw nsw i64 %s.0304, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %exitcond305 = icmp eq i64 %add109, %n
  br i1 %exitcond305, label %if.then114.loopexit501, label %while.cond32.preheader

if.then114.loopexit:                              ; preds = %polly.loop_exit478
  br label %if.then114

if.then114.loopexit501:                           ; preds = %blklab2
  br label %if.then114

if.then114:                                       ; preds = %if.then114.loopexit501, %if.then114.loopexit, %entry
  tail call void @free(i8* %0) #7
  tail call void @free(i8* %1) #7
  tail call void @free(i8* %2) #7
  ret i64* %moves

polly.loop_header:                                ; preds = %polly.loop_exit478, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit478 ]
  %40 = sub i64 %55, %polly.indvar
  %41 = icmp sgt i64 %40, 0
  %smax495 = select i1 %41, i64 %40, i64 0
  %42 = shl i64 %smax495, 3
  %43 = add i64 %42, 8
  %44 = sub nsw i64 %n, %polly.indvar
  %polly.loop_guard378 = icmp sgt i64 %44, 0
  br i1 %polly.loop_guard378, label %polly.loop_header394.preheader, label %polly.loop_exit396

polly.loop_header394.preheader:                   ; preds = %polly.loop_header
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 %43, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 %43, i32 8, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 %43, i32 8, i1 false)
  br label %polly.loop_exit396

polly.loop_exit396:                               ; preds = %polly.loop_header394.preheader, %polly.loop_header
  %45 = sub nsw i64 1, %polly.indvar
  %46 = icmp slt i64 %45, 0
  %47 = select i1 %46, i64 0, i64 %45
  %48 = icmp slt i64 %55, %44
  %49 = select i1 %48, i64 %55, i64 %44
  %polly.loop_guard407 = icmp slt i64 %47, %49
  br i1 %polly.loop_guard407, label %polly.loop_preheader405, label %polly.loop_exit406

polly.loop_exit406.loopexit:                      ; preds = %polly.loop_header404
  br label %polly.loop_exit406

polly.loop_exit406:                               ; preds = %polly.loop_exit406.loopexit, %polly.loop_exit396
  %50 = icmp slt i64 %59, %44
  %51 = select i1 %50, i64 %59, i64 %44
  %polly.loop_guard421 = icmp sgt i64 %51, 0
  br i1 %polly.loop_guard421, label %polly.loop_preheader419, label %polly.loop_exit420

polly.loop_exit420.loopexit:                      ; preds = %polly.loop_header418
  br label %polly.loop_exit420

polly.loop_exit420:                               ; preds = %polly.loop_exit420.loopexit, %polly.loop_exit406
  %52 = sub nsw i64 2, %polly.indvar
  %53 = icmp slt i64 %52, 0
  %54 = select i1 %53, i64 0, i64 %52
  %polly.loop_guard437 = icmp slt i64 %54, %44
  br i1 %polly.loop_guard437, label %polly.loop_preheader435, label %polly.loop_exit436

polly.loop_exit436.loopexit:                      ; preds = %polly.loop_header434
  br label %polly.loop_exit436

polly.loop_exit436:                               ; preds = %polly.loop_exit436.loopexit, %polly.loop_exit420
  br i1 %polly.loop_guard378, label %polly.loop_header450.preheader, label %polly.loop_exit478

polly.loop_header450.preheader:                   ; preds = %polly.loop_exit436
  %polly.adjust_ub456 = add i64 %44, -1
  br label %polly.loop_header450

polly.loop_exit478.loopexit:                      ; preds = %polly.loop_header476
  br label %polly.loop_exit478

polly.loop_exit478:                               ; preds = %polly.loop_exit478.loopexit, %polly.loop_exit436
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond496 = icmp eq i64 %polly.indvar_next, %n
  br i1 %exitcond496, label %if.then114.loopexit, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.split_new_and_old
  %55 = add i64 %n, -1
  %scevgep412 = getelementptr i64, i64* %moves, i64 %55
  %56 = shl i64 %n, 3
  %57 = add i64 %56, 8
  %58 = shl i64 %n, 1
  %scevgep426 = getelementptr i64, i64* %moves, i64 %58
  %scevgep442 = getelementptr i64, i64* %moves, i64 -2
  %59 = add nsw i64 %n, -2
  br label %polly.loop_header

polly.loop_header404:                             ; preds = %polly.loop_header404, %polly.loop_preheader405
  %polly.indvar408 = phi i64 [ %47, %polly.loop_preheader405 ], [ %polly.indvar_next409, %polly.loop_header404 ]
  %60 = mul i64 %polly.indvar408, %57
  %uglygep = getelementptr i8, i8* %scevgep413414, i64 %60
  %uglygep415 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep415, align 8, !alias.scope !5, !noalias !7, !llvm.mem.parallel_loop_access !12
  %scevgep416 = getelementptr i64, i64* %call12, i64 %polly.indvar408
  store i64 %_p_scalar_, i64* %scevgep416, align 8, !alias.scope !10, !noalias !13, !llvm.mem.parallel_loop_access !12
  %polly.indvar_next409 = add nuw nsw i64 %polly.indvar408, 1
  %polly.loop_cond411 = icmp slt i64 %polly.indvar408, %polly.adjust_ub410
  br i1 %polly.loop_cond411, label %polly.loop_header404, label %polly.loop_exit406.loopexit, !llvm.loop !12

polly.loop_preheader405:                          ; preds = %polly.loop_exit396
  %scevgep413 = getelementptr i64, i64* %scevgep412, i64 %polly.indvar
  %scevgep413414 = bitcast i64* %scevgep413 to i8*
  %polly.adjust_ub410 = add i64 %49, -1
  br label %polly.loop_header404

polly.loop_header418:                             ; preds = %polly.loop_header418, %polly.loop_preheader419
  %polly.indvar422 = phi i64 [ 0, %polly.loop_preheader419 ], [ %polly.indvar_next423, %polly.loop_header418 ]
  %61 = mul i64 %polly.indvar422, %57
  %uglygep429 = getelementptr i8, i8* %scevgep427428, i64 %61
  %uglygep429430 = bitcast i8* %uglygep429 to i64*
  %_p_scalar_431 = load i64, i64* %uglygep429430, align 8, !alias.scope !5, !noalias !7, !llvm.mem.parallel_loop_access !14
  %scevgep432 = getelementptr i64, i64* %call, i64 %polly.indvar422
  store i64 %_p_scalar_431, i64* %scevgep432, align 8, !alias.scope !8, !noalias !15, !llvm.mem.parallel_loop_access !14
  %polly.indvar_next423 = add nuw nsw i64 %polly.indvar422, 1
  %polly.loop_cond425 = icmp slt i64 %polly.indvar422, %polly.adjust_ub424
  br i1 %polly.loop_cond425, label %polly.loop_header418, label %polly.loop_exit420.loopexit, !llvm.loop !14

polly.loop_preheader419:                          ; preds = %polly.loop_exit406
  %scevgep427 = getelementptr i64, i64* %scevgep426, i64 %polly.indvar
  %scevgep427428 = bitcast i64* %scevgep427 to i8*
  %polly.adjust_ub424 = add i64 %51, -1
  br label %polly.loop_header418

polly.loop_header434:                             ; preds = %polly.loop_header434, %polly.loop_preheader435
  %polly.indvar438 = phi i64 [ %54, %polly.loop_preheader435 ], [ %polly.indvar_next439, %polly.loop_header434 ]
  %62 = mul i64 %polly.indvar438, %57
  %uglygep445 = getelementptr i8, i8* %scevgep443444, i64 %62
  %uglygep445446 = bitcast i8* %uglygep445 to i64*
  %_p_scalar_447 = load i64, i64* %uglygep445446, align 8, !alias.scope !5, !noalias !7, !llvm.mem.parallel_loop_access !16
  %scevgep448 = getelementptr i64, i64* %call23, i64 %polly.indvar438
  store i64 %_p_scalar_447, i64* %scevgep448, align 8, !alias.scope !9, !noalias !17, !llvm.mem.parallel_loop_access !16
  %polly.indvar_next439 = add nuw nsw i64 %polly.indvar438, 1
  %polly.loop_cond441 = icmp slt i64 %polly.indvar438, %polly.adjust_ub440
  br i1 %polly.loop_cond441, label %polly.loop_header434, label %polly.loop_exit436.loopexit, !llvm.loop !16

polly.loop_preheader435:                          ; preds = %polly.loop_exit420
  %scevgep443 = getelementptr i64, i64* %scevgep442, i64 %polly.indvar
  %scevgep443444 = bitcast i64* %scevgep443 to i8*
  %polly.adjust_ub440 = add i64 %44, -1
  br label %polly.loop_header434

polly.loop_header450:                             ; preds = %polly.loop_header450.preheader, %polly.stmt.blklab7.exit
  %polly.indvar454 = phi i64 [ %polly.indvar_next455, %polly.stmt.blklab7.exit ], [ 0, %polly.loop_header450.preheader ]
  %scevgep458 = getelementptr i64, i64* %call, i64 %polly.indvar454
  %_p_scalar_459 = load i64, i64* %scevgep458, align 8, !alias.scope !8, !noalias !15, !llvm.mem.parallel_loop_access !18
  %scevgep460 = getelementptr i64, i64* %call12, i64 %polly.indvar454
  %_p_scalar_461 = load i64, i64* %scevgep460, align 8, !alias.scope !10, !noalias !13, !llvm.mem.parallel_loop_access !18
  %p_cmp75 = icmp sgt i64 %_p_scalar_459, %_p_scalar_461
  br i1 %p_cmp75, label %polly.stmt.if.end78, label %polly.stmt.blklab7.exit

polly.stmt.if.end78:                              ; preds = %polly.loop_header450
  store i64 %_p_scalar_461, i64* %scevgep458, align 8, !alias.scope !8, !noalias !15, !llvm.mem.parallel_loop_access !18
  br label %polly.stmt.blklab7.exit

polly.stmt.blklab7.exit:                          ; preds = %polly.stmt.if.end78, %polly.loop_header450
  %polly.indvar_next455 = add nuw nsw i64 %polly.indvar454, 1
  %polly.loop_cond457 = icmp slt i64 %polly.indvar454, %polly.adjust_ub456
  br i1 %polly.loop_cond457, label %polly.loop_header450, label %polly.loop_header463.preheader, !llvm.loop !18

polly.loop_header463.preheader:                   ; preds = %polly.stmt.blklab7.exit
  br label %polly.loop_header463

polly.loop_header463:                             ; preds = %polly.loop_header463.preheader, %polly.stmt.blklab8.exit
  %polly.indvar467 = phi i64 [ %polly.indvar_next468, %polly.stmt.blklab8.exit ], [ 0, %polly.loop_header463.preheader ]
  %scevgep471 = getelementptr i64, i64* %call23, i64 %polly.indvar467
  %_p_scalar_472 = load i64, i64* %scevgep471, align 8, !alias.scope !9, !noalias !17, !llvm.mem.parallel_loop_access !19
  %scevgep473 = getelementptr i64, i64* %call12, i64 %polly.indvar467
  %_p_scalar_474 = load i64, i64* %scevgep473, align 8, !alias.scope !10, !noalias !13, !llvm.mem.parallel_loop_access !19
  %p_cmp83 = icmp sgt i64 %_p_scalar_472, %_p_scalar_474
  br i1 %p_cmp83, label %polly.stmt.if.end86, label %polly.stmt.blklab8.exit

polly.stmt.if.end86:                              ; preds = %polly.loop_header463
  store i64 %_p_scalar_474, i64* %scevgep471, align 8, !alias.scope !9, !noalias !17, !llvm.mem.parallel_loop_access !19
  br label %polly.stmt.blklab8.exit

polly.stmt.blklab8.exit:                          ; preds = %polly.stmt.if.end86, %polly.loop_header463
  %polly.indvar_next468 = add nuw nsw i64 %polly.indvar467, 1
  %polly.loop_cond470 = icmp slt i64 %polly.indvar467, %polly.adjust_ub456
  br i1 %polly.loop_cond470, label %polly.loop_header463, label %polly.loop_preheader477, !llvm.loop !19

polly.loop_header476:                             ; preds = %polly.loop_header476, %polly.loop_preheader477
  %polly.indvar480 = phi i64 [ 0, %polly.loop_preheader477 ], [ %polly.indvar_next481, %polly.loop_header476 ]
  %scevgep484 = getelementptr i64, i64* %call, i64 %polly.indvar480
  %_p_scalar_485 = load i64, i64* %scevgep484, align 8, !alias.scope !8, !noalias !15
  %p_add90 = add nsw i64 %_p_scalar_485, %polly.indvar480
  %scevgep486 = getelementptr i64, i64* %call23, i64 %polly.indvar480
  %_p_scalar_487 = load i64, i64* %scevgep486, align 8, !alias.scope !9, !noalias !17
  %63 = add nuw i64 %polly.indvar480, %polly.indvar
  %p_add92 = add nsw i64 %63, %_p_scalar_487
  %p_cmp93 = icmp sgt i64 %p_add90, %p_add92
  %polly.storemerge = select i1 %p_cmp93, i64 %p_add90, i64 %p_add92
  %64 = mul i64 %polly.indvar480, %57
  %uglygep490 = getelementptr i8, i8* %scevgep488489, i64 %64
  %uglygep490491 = bitcast i8* %uglygep490 to i64*
  store i64 %polly.storemerge, i64* %uglygep490491, align 8, !alias.scope !5, !noalias !7
  %polly.indvar_next481 = add nuw nsw i64 %polly.indvar480, 1
  %polly.loop_cond483 = icmp slt i64 %polly.indvar480, %polly.adjust_ub456
  br i1 %polly.loop_cond483, label %polly.loop_header476, label %polly.loop_exit478.loopexit

polly.loop_preheader477:                          ; preds = %polly.stmt.blklab8.exit
  %scevgep488 = getelementptr i64, i64* %moves, i64 %polly.indvar
  %scevgep488489 = bitcast i64* %scevgep488 to i8*
  br label %polly.loop_header476
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

declare i64* @create1DArray(i32, i32) local_unnamed_addr #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7
  %0 = load i64*, i64** %call, align 8, !tbaa !20
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end139, label %if.then117

if.then117:                                       ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %mul = mul nsw i64 %1, %1
  %conv10 = trunc i64 %mul to i32
  %call11 = tail call i64* @create1DArray(i32 0, i32 %conv10) #7
  %call21 = tail call i64* @findMoves(i64* %call11, i64 undef, i1 zeroext undef, i64 %1)
  %sub27 = add nsw i64 %1, -1
  %arrayidx28 = getelementptr inbounds i64, i64* %call21, i64 %sub27
  %2 = load i64, i64* %arrayidx28, align 8, !tbaa !1
  %call33 = tail call i64* @create1DArray(i32 0, i32 50) #7
  %3 = bitcast i64* %call33 to <2 x i64>*
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %3, align 8, !tbaa !1
  %arrayidx36 = getelementptr inbounds i64, i64* %call33, i64 2
  %4 = bitcast i64* %arrayidx36 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %4, align 8, !tbaa !1
  %arrayidx38 = getelementptr inbounds i64, i64* %call33, i64 4
  %5 = bitcast i64* %arrayidx38 to <2 x i64>*
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %5, align 8, !tbaa !1
  %arrayidx40 = getelementptr inbounds i64, i64* %call33, i64 6
  %6 = bitcast i64* %arrayidx40 to <2 x i64>*
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %6, align 8, !tbaa !1
  %arrayidx42 = getelementptr inbounds i64, i64* %call33, i64 8
  %7 = bitcast i64* %arrayidx42 to <2 x i64>*
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx44 = getelementptr inbounds i64, i64* %call33, i64 10
  %8 = bitcast i64* %arrayidx44 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx46 = getelementptr inbounds i64, i64* %call33, i64 12
  %9 = bitcast i64* %arrayidx46 to <2 x i64>*
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx48 = getelementptr inbounds i64, i64* %call33, i64 14
  %10 = bitcast i64* %arrayidx48 to <2 x i64>*
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx50 = getelementptr inbounds i64, i64* %call33, i64 16
  %11 = bitcast i64* %arrayidx50 to <2 x i64>*
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx52 = getelementptr inbounds i64, i64* %call33, i64 18
  %12 = bitcast i64* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx54 = getelementptr inbounds i64, i64* %call33, i64 20
  %13 = bitcast i64* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx56 = getelementptr inbounds i64, i64* %call33, i64 22
  %14 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx58 = getelementptr inbounds i64, i64* %call33, i64 24
  %15 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx60 = getelementptr inbounds i64, i64* %call33, i64 26
  %16 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx62 = getelementptr inbounds i64, i64* %call33, i64 28
  %17 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx64 = getelementptr inbounds i64, i64* %call33, i64 30
  %18 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx66 = getelementptr inbounds i64, i64* %call33, i64 32
  %19 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %19, align 8, !tbaa !1
  %arrayidx68 = getelementptr inbounds i64, i64* %call33, i64 34
  %20 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %20, align 8, !tbaa !1
  %arrayidx70 = getelementptr inbounds i64, i64* %call33, i64 36
  %21 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %21, align 8, !tbaa !1
  %arrayidx72 = getelementptr inbounds i64, i64* %call33, i64 38
  %22 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %22, align 8, !tbaa !1
  %arrayidx74 = getelementptr inbounds i64, i64* %call33, i64 40
  %23 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %23, align 8, !tbaa !1
  %arrayidx76 = getelementptr inbounds i64, i64* %call33, i64 42
  %24 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %24, align 8, !tbaa !1
  %arrayidx78 = getelementptr inbounds i64, i64* %call33, i64 44
  %25 = bitcast i64* %arrayidx78 to <2 x i64>*
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %25, align 8, !tbaa !1
  %arrayidx80 = getelementptr inbounds i64, i64* %call33, i64 46
  %26 = bitcast i64* %arrayidx80 to <2 x i64>*
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %26, align 8, !tbaa !1
  %arrayidx82 = getelementptr inbounds i64, i64* %call33, i64 48
  %27 = bitcast i64* %arrayidx82 to <2 x i64>*
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %27, align 8, !tbaa !1
  tail call void @printf_s(i64* %call33, i64 50) #7
  %call84 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2)
  %call89 = tail call i64* @create1DArray(i32 0, i32 23) #7
  %28 = bitcast i64* %call89 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %28, align 8, !tbaa !1
  %arrayidx92 = getelementptr inbounds i64, i64* %call89, i64 2
  %29 = bitcast i64* %arrayidx92 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %29, align 8, !tbaa !1
  %arrayidx94 = getelementptr inbounds i64, i64* %call89, i64 4
  %30 = bitcast i64* %arrayidx94 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %30, align 8, !tbaa !1
  %arrayidx96 = getelementptr inbounds i64, i64* %call89, i64 6
  %31 = bitcast i64* %arrayidx96 to <2 x i64>*
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx98 = getelementptr inbounds i64, i64* %call89, i64 8
  %32 = bitcast i64* %arrayidx98 to <2 x i64>*
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx100 = getelementptr inbounds i64, i64* %call89, i64 10
  %33 = bitcast i64* %arrayidx100 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx102 = getelementptr inbounds i64, i64* %call89, i64 12
  %34 = bitcast i64* %arrayidx102 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx104 = getelementptr inbounds i64, i64* %call89, i64 14
  %35 = bitcast i64* %arrayidx104 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx106 = getelementptr inbounds i64, i64* %call89, i64 16
  %36 = bitcast i64* %arrayidx106 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx108 = getelementptr inbounds i64, i64* %call89, i64 18
  %37 = bitcast i64* %arrayidx108 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx110 = getelementptr inbounds i64, i64* %call89, i64 20
  %38 = bitcast i64* %arrayidx110 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx112 = getelementptr inbounds i64, i64* %call89, i64 22
  store i64 101, i64* %arrayidx112, align 8, !tbaa !1
  tail call void @println_s(i64* %call89, i64 23) #7
  %phitmp = bitcast i64* %call89 to i8*
  %phitmp250 = bitcast i64* %call33 to i8*
  %phitmp251 = bitcast i64* %call21 to i8*
  %39 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %39) #7
  tail call void @free(i8* %phitmp251) #7
  tail call void @free(i8* %phitmp250) #7
  tail call void @free(i8* %phitmp) #7
  br label %if.end139

if.end139:                                        ; preds = %entry, %if.then117
  tail call void @exit(i32 0) #8
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #2

declare i64* @parseStringToInt(i64*) local_unnamed_addr #2

declare void @printf_s(i64*, i64) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

declare void @println_s(i64*, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #5

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #5

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6, !"polly.alias.scope.moves"}
!6 = distinct !{!6, !"polly.alias.scope.domain"}
!7 = !{!8, !9, !10, !11}
!8 = distinct !{!8, !6, !"polly.alias.scope.call"}
!9 = distinct !{!9, !6, !"polly.alias.scope.call23"}
!10 = distinct !{!10, !6, !"polly.alias.scope.call12"}
!11 = distinct !{!11, !6, !"polly.alias.scope.storemerge"}
!12 = distinct !{!12}
!13 = !{!8, !5, !9, !11}
!14 = distinct !{!14}
!15 = !{!5, !9, !10, !11}
!16 = distinct !{!16}
!17 = !{!8, !5, !10, !11}
!18 = distinct !{!18}
!19 = distinct !{!19}
!20 = !{!21, !21, i64 0}
!21 = !{!"any pointer", !3, i64 0}
