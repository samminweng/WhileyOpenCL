; ModuleID = 'llvm/array.preopt.ll.tmp'
source_filename = "CoinGame_array.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_dealloc, i64 %n) local_unnamed_addr #0 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %conv1 = trunc i64 %n to i32
  %call = tail call i64* @create1DArray(i32 0, i32 %conv1) #7
  %0 = bitcast i64* %call to i8*
  %call12 = tail call i64* @create1DArray(i32 0, i32 %conv1) #7
  %1 = bitcast i64* %call12 to i8*
  %call23 = tail call i64* @create1DArray(i32 0, i32 %conv1) #7
  %2 = bitcast i64* %call23 to i8*
  %cmp303 = icmp sgt i64 %n, 0
  br i1 %cmp303, label %polly.split_new_and_old, label %if.then114

polly.split_new_and_old:                          ; preds = %entry.split
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

blklab4:                                          ; preds = %if.end45, %if.end37
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

blklab5:                                          ; preds = %if.end56, %blklab4
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

blklab6:                                          ; preds = %if.end67, %blklab5
  %32 = phi i64 [ 0, %blklab5 ], [ %31, %if.end67 ]
  %33 = load i64, i64* %arrayidx51, align 8, !tbaa !1
  %34 = load i64, i64* %arrayidx, align 8, !tbaa !1
  %cmp75 = icmp sgt i64 %33, %34
  br i1 %cmp75, label %if.end78, label %blklab7

if.end78:                                         ; preds = %blklab6
  store i64 %34, i64* %arrayidx51, align 8, !tbaa !1
  %.pre = load i64, i64* %arrayidx62, align 8, !tbaa !1
  %.pre502 = load i64, i64* %arrayidx, align 8, !tbaa !1
  br label %blklab7

blklab7:                                          ; preds = %if.end78, %blklab6
  %35 = phi i64 [ %33, %blklab6 ], [ %34, %if.end78 ]
  %36 = phi i64 [ %34, %blklab6 ], [ %.pre502, %if.end78 ]
  %37 = phi i64 [ %32, %blklab6 ], [ %.pre, %if.end78 ]
  %cmp83 = icmp sgt i64 %37, %36
  br i1 %cmp83, label %if.end86, label %blklab8

if.end86:                                         ; preds = %blklab7
  store i64 %36, i64* %arrayidx62, align 8, !tbaa !1
  %.pre503 = load i64, i64* %arrayidx51, align 8, !tbaa !1
  br label %blklab8

blklab8:                                          ; preds = %if.end86, %blklab7
  %38 = phi i64 [ %37, %blklab7 ], [ %36, %if.end86 ]
  %39 = phi i64 [ %35, %blklab7 ], [ %.pre503, %if.end86 ]
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
  br i1 %exitcond305, label %if.then114.loopexit202, label %while.cond32.preheader

if.then114.loopexit:                              ; preds = %polly.loop_exit486
  br label %if.then114

if.then114.loopexit202:                           ; preds = %blklab2
  br label %if.then114

if.then114:                                       ; preds = %if.then114.loopexit202, %if.then114.loopexit, %entry.split
  tail call void @free(i8* %0) #7
  tail call void @free(i8* %1) #7
  tail call void @free(i8* %2) #7
  ret i64* %moves

polly.loop_header:                                ; preds = %polly.loop_preheader, %polly.loop_exit486
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit486 ]
  %40 = sub i64 %57, %polly.indvar
  %41 = icmp sgt i64 %40, 0
  %smax500 = select i1 %41, i64 %40, i64 0
  %42 = shl i64 %smax500, 3
  %43 = add i64 %42, 8
  %44 = sub nsw i64 %n, %polly.indvar
  %polly.loop_guard378 = icmp sgt i64 %44, 0
  br i1 %polly.loop_guard378, label %polly.loop_header375.preheader, label %polly.loop_exit377

polly.loop_header375.preheader:                   ; preds = %polly.loop_header
  tail call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 %43, i32 8, i1 false)
  br label %polly.loop_exit377

polly.loop_exit377:                               ; preds = %polly.loop_header375.preheader, %polly.loop_header
  %45 = sub nsw i64 1, %polly.indvar
  %46 = icmp slt i64 %45, 0
  %47 = select i1 %46, i64 0, i64 %45
  %48 = icmp slt i64 %57, %44
  %49 = select i1 %48, i64 %57, i64 %44
  %polly.loop_guard387 = icmp slt i64 %47, %49
  br i1 %polly.loop_guard387, label %polly.loop_preheader385, label %polly.cond397

polly.cond397.loopexit:                           ; preds = %polly.loop_header384
  br label %polly.cond397

polly.cond397:                                    ; preds = %polly.cond397.loopexit, %polly.loop_exit377
  %50 = icmp sgt i64 %polly.indvar, 0
  %polly.loop_guard405 = icmp sgt i64 %44, -1
  %or.cond496 = and i1 %50, %polly.loop_guard405
  br i1 %or.cond496, label %polly.loop_header402.preheader, label %polly.merge398

polly.loop_header402.preheader:                   ; preds = %polly.cond397
  %51 = add nsw i64 %polly.indvar, -1
  %scevgep414 = getelementptr i64, i64* %moves, i64 %51
  %scevgep414415 = bitcast i64* %scevgep414 to i8*
  %polly.adjust_ub408 = add i64 %44, -1
  br label %polly.loop_header402

polly.merge398.loopexit:                          ; preds = %polly.loop_header402
  br label %polly.merge398

polly.merge398:                                   ; preds = %polly.merge398.loopexit, %polly.cond397
  br i1 %polly.loop_guard378, label %polly.loop_header419.preheader, label %polly.loop_exit421

polly.loop_header419.preheader:                   ; preds = %polly.merge398
  tail call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 %43, i32 8, i1 false)
  br label %polly.loop_exit421

polly.loop_exit421:                               ; preds = %polly.loop_header419.preheader, %polly.merge398
  %52 = icmp slt i64 %61, %44
  %53 = select i1 %52, i64 %61, i64 %44
  %polly.loop_guard432 = icmp sgt i64 %53, 0
  br i1 %polly.loop_guard432, label %polly.loop_preheader430, label %polly.loop_exit431

polly.loop_exit431.loopexit:                      ; preds = %polly.loop_header429
  br label %polly.loop_exit431

polly.loop_exit431:                               ; preds = %polly.loop_exit431.loopexit, %polly.loop_exit421
  br i1 %polly.loop_guard378, label %polly.loop_header445.preheader, label %polly.loop_exit460

polly.loop_header445.preheader:                   ; preds = %polly.loop_exit431
  %polly.adjust_ub451 = add i64 %44, -1
  br label %polly.loop_header445

polly.loop_header458.preheader:                   ; preds = %polly.stmt.blklab7.exit
  tail call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 %43, i32 8, i1 false)
  br label %polly.loop_exit460

polly.loop_exit460:                               ; preds = %polly.loop_header458.preheader, %polly.loop_exit431
  %54 = sub nsw i64 2, %polly.indvar
  %55 = icmp slt i64 %54, 0
  %56 = select i1 %55, i64 0, i64 %54
  %polly.loop_guard471 = icmp slt i64 %56, %44
  br i1 %polly.loop_guard471, label %polly.loop_preheader469, label %polly.loop_exit470

polly.loop_exit470.loopexit:                      ; preds = %polly.loop_header468
  br label %polly.loop_exit470

polly.loop_exit470:                               ; preds = %polly.loop_exit470.loopexit, %polly.loop_exit460
  br i1 %polly.loop_guard378, label %polly.loop_header484.preheader, label %polly.loop_exit486

polly.loop_header484.preheader:                   ; preds = %polly.loop_exit470
  %polly.adjust_ub490 = add i64 %44, -1
  br label %polly.loop_header484

polly.loop_exit486.loopexit:                      ; preds = %polly.stmt.blklab8.exit
  br label %polly.loop_exit486

polly.loop_exit486:                               ; preds = %polly.loop_exit486.loopexit, %polly.loop_exit470
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond501 = icmp eq i64 %polly.indvar, %n
  br i1 %exitcond501, label %if.then114.loopexit, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.split_new_and_old
  %57 = add i64 %n, -1
  %scevgep392 = getelementptr i64, i64* %moves, i64 %57
  %58 = shl i64 %n, 3
  %59 = add i64 %58, 8
  %60 = shl i64 %n, 1
  %scevgep437 = getelementptr i64, i64* %moves, i64 %60
  %scevgep476 = getelementptr i64, i64* %moves, i64 -2
  %61 = add nsw i64 %n, -2
  br label %polly.loop_header

polly.loop_header384:                             ; preds = %polly.loop_preheader385, %polly.loop_header384
  %polly.indvar388 = phi i64 [ %47, %polly.loop_preheader385 ], [ %polly.indvar_next389, %polly.loop_header384 ]
  %62 = mul i64 %polly.indvar388, %59
  %uglygep = getelementptr i8, i8* %scevgep393394, i64 %62
  %uglygep395 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep395, align 8, !alias.scope !5, !noalias !7
  %scevgep396 = getelementptr i64, i64* %call12, i64 %polly.indvar388
  store i64 %_p_scalar_, i64* %scevgep396, align 8, !alias.scope !8, !noalias !12
  %polly.indvar_next389 = add nuw nsw i64 %polly.indvar388, 1
  %polly.loop_cond391 = icmp slt i64 %polly.indvar388, %polly.adjust_ub390
  br i1 %polly.loop_cond391, label %polly.loop_header384, label %polly.cond397.loopexit

polly.loop_preheader385:                          ; preds = %polly.loop_exit377
  %scevgep393 = getelementptr i64, i64* %scevgep392, i64 %polly.indvar
  %scevgep393394 = bitcast i64* %scevgep393 to i8*
  %polly.adjust_ub390 = add i64 %49, -1
  br label %polly.loop_header384

polly.loop_header402:                             ; preds = %polly.loop_header402, %polly.loop_header402.preheader
  %polly.indvar406 = phi i64 [ %polly.indvar_next407, %polly.loop_header402 ], [ 0, %polly.loop_header402.preheader ]
  %scevgep410 = getelementptr i64, i64* %call, i64 %polly.indvar406
  %_p_scalar_411 = load i64, i64* %scevgep410, align 8, !alias.scope !10, !noalias !13
  %p_add90 = add nsw i64 %_p_scalar_411, %polly.indvar406
  %scevgep412 = getelementptr i64, i64* %call23, i64 %polly.indvar406
  %_p_scalar_413 = load i64, i64* %scevgep412, align 8, !alias.scope !9, !noalias !14
  %63 = add i64 %polly.indvar406, %51
  %p_add92 = add nsw i64 %63, %_p_scalar_413
  %p_cmp93 = icmp sgt i64 %p_add90, %p_add92
  %polly.storemerge = select i1 %p_cmp93, i64 %p_add90, i64 %p_add92
  %64 = mul i64 %polly.indvar406, %59
  %uglygep416 = getelementptr i8, i8* %scevgep414415, i64 %64
  %uglygep416417 = bitcast i8* %uglygep416 to i64*
  store i64 %polly.storemerge, i64* %uglygep416417, align 8, !alias.scope !5, !noalias !7
  %polly.indvar_next407 = add nuw nsw i64 %polly.indvar406, 1
  %polly.loop_cond409 = icmp sgt i64 %polly.indvar406, %polly.adjust_ub408
  br i1 %polly.loop_cond409, label %polly.merge398.loopexit, label %polly.loop_header402

polly.loop_header429:                             ; preds = %polly.loop_preheader430, %polly.loop_header429
  %polly.indvar433 = phi i64 [ 0, %polly.loop_preheader430 ], [ %polly.indvar_next434, %polly.loop_header429 ]
  %65 = mul i64 %polly.indvar433, %59
  %uglygep440 = getelementptr i8, i8* %scevgep438439, i64 %65
  %uglygep440441 = bitcast i8* %uglygep440 to i64*
  %_p_scalar_442 = load i64, i64* %uglygep440441, align 8, !alias.scope !5, !noalias !7
  %scevgep443 = getelementptr i64, i64* %call, i64 %polly.indvar433
  store i64 %_p_scalar_442, i64* %scevgep443, align 8, !alias.scope !10, !noalias !13
  %polly.indvar_next434 = add nuw nsw i64 %polly.indvar433, 1
  %polly.loop_cond436 = icmp slt i64 %polly.indvar433, %polly.adjust_ub435
  br i1 %polly.loop_cond436, label %polly.loop_header429, label %polly.loop_exit431.loopexit

polly.loop_preheader430:                          ; preds = %polly.loop_exit421
  %scevgep438 = getelementptr i64, i64* %scevgep437, i64 %polly.indvar
  %scevgep438439 = bitcast i64* %scevgep438 to i8*
  %polly.adjust_ub435 = add i64 %53, -1
  br label %polly.loop_header429

polly.loop_header445:                             ; preds = %polly.stmt.blklab7.exit, %polly.loop_header445.preheader
  %polly.indvar449 = phi i64 [ %polly.indvar_next450, %polly.stmt.blklab7.exit ], [ 0, %polly.loop_header445.preheader ]
  %scevgep453 = getelementptr i64, i64* %call, i64 %polly.indvar449
  %_p_scalar_454 = load i64, i64* %scevgep453, align 8, !alias.scope !10, !noalias !13
  %scevgep455 = getelementptr i64, i64* %call12, i64 %polly.indvar449
  %_p_scalar_456 = load i64, i64* %scevgep455, align 8, !alias.scope !8, !noalias !12
  %p_cmp75 = icmp sgt i64 %_p_scalar_454, %_p_scalar_456
  br i1 %p_cmp75, label %polly.stmt.if.end78, label %polly.stmt.blklab7.exit

polly.stmt.if.end78:                              ; preds = %polly.loop_header445
  store i64 %_p_scalar_456, i64* %scevgep453, align 8, !alias.scope !10, !noalias !13
  br label %polly.stmt.blklab7.exit

polly.stmt.blklab7.exit:                          ; preds = %polly.stmt.if.end78, %polly.loop_header445
  %polly.indvar_next450 = add nuw nsw i64 %polly.indvar449, 1
  %polly.loop_cond452 = icmp slt i64 %polly.indvar449, %polly.adjust_ub451
  br i1 %polly.loop_cond452, label %polly.loop_header445, label %polly.loop_header458.preheader

polly.loop_header468:                             ; preds = %polly.loop_preheader469, %polly.loop_header468
  %polly.indvar472 = phi i64 [ %56, %polly.loop_preheader469 ], [ %polly.indvar_next473, %polly.loop_header468 ]
  %66 = mul i64 %polly.indvar472, %59
  %uglygep479 = getelementptr i8, i8* %scevgep477478, i64 %66
  %uglygep479480 = bitcast i8* %uglygep479 to i64*
  %_p_scalar_481 = load i64, i64* %uglygep479480, align 8, !alias.scope !5, !noalias !7
  %scevgep482 = getelementptr i64, i64* %call23, i64 %polly.indvar472
  store i64 %_p_scalar_481, i64* %scevgep482, align 8, !alias.scope !9, !noalias !14
  %polly.indvar_next473 = add nuw nsw i64 %polly.indvar472, 1
  %polly.loop_cond475 = icmp slt i64 %polly.indvar472, %polly.adjust_ub474
  br i1 %polly.loop_cond475, label %polly.loop_header468, label %polly.loop_exit470.loopexit

polly.loop_preheader469:                          ; preds = %polly.loop_exit460
  %scevgep477 = getelementptr i64, i64* %scevgep476, i64 %polly.indvar
  %scevgep477478 = bitcast i64* %scevgep477 to i8*
  %polly.adjust_ub474 = add i64 %44, -1
  br label %polly.loop_header468

polly.loop_header484:                             ; preds = %polly.stmt.blklab8.exit, %polly.loop_header484.preheader
  %polly.indvar488 = phi i64 [ %polly.indvar_next489, %polly.stmt.blklab8.exit ], [ 0, %polly.loop_header484.preheader ]
  %scevgep492 = getelementptr i64, i64* %call23, i64 %polly.indvar488
  %_p_scalar_493 = load i64, i64* %scevgep492, align 8, !alias.scope !9, !noalias !14
  %scevgep494 = getelementptr i64, i64* %call12, i64 %polly.indvar488
  %_p_scalar_495 = load i64, i64* %scevgep494, align 8, !alias.scope !8, !noalias !12
  %p_cmp83 = icmp sgt i64 %_p_scalar_493, %_p_scalar_495
  br i1 %p_cmp83, label %polly.stmt.if.end86, label %polly.stmt.blklab8.exit

polly.stmt.if.end86:                              ; preds = %polly.loop_header484
  store i64 %_p_scalar_495, i64* %scevgep492, align 8, !alias.scope !9, !noalias !14
  br label %polly.stmt.blklab8.exit

polly.stmt.blklab8.exit:                          ; preds = %polly.stmt.if.end86, %polly.loop_header484
  %polly.indvar_next489 = add nuw nsw i64 %polly.indvar488, 1
  %polly.loop_cond491 = icmp slt i64 %polly.indvar488, %polly.adjust_ub490
  br i1 %polly.loop_cond491, label %polly.loop_header484, label %polly.loop_exit486.loopexit
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

declare i64* @create1DArray(i32, i32) local_unnamed_addr #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
entry:
  br label %entry.split

entry.split:                                      ; preds = %entry
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7
  %0 = load i64*, i64** %call, align 8, !tbaa !15
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end139, label %if.then117

if.then117:                                       ; preds = %entry.split
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

if.end139:                                        ; preds = %if.then117, %entry.split
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
!8 = distinct !{!8, !6, !"polly.alias.scope.call12"}
!9 = distinct !{!9, !6, !"polly.alias.scope.call23"}
!10 = distinct !{!10, !6, !"polly.alias.scope.call"}
!11 = distinct !{!11, !6, !"polly.alias.scope.storemerge"}
!12 = !{!9, !10, !5, !11}
!13 = !{!8, !9, !5, !11}
!14 = !{!8, !10, !5, !11}
!15 = !{!16, !16, i64 0}
!16 = !{!"any pointer", !3, i64 0}
