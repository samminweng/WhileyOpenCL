; ModuleID = 'CoinGame_array.c'
source_filename = "CoinGame_array.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @_findMoves_(i64* noalias returned %moves, i64 %moves_size, i64 %n, i64* noalias %x, i64 %x_size, i64* noalias %y, i64 %y_size, i64* noalias %z, i64 %z_size, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %polly.par.LBPtr.i320 = alloca i64, align 8
  %polly.par.UBPtr.i321 = alloca i64, align 8
  %polly.par.LBPtr.i306 = alloca i64, align 8
  %polly.par.UBPtr.i307 = alloca i64, align 8
  %polly.par.LBPtr.i284 = alloca i64, align 8
  %polly.par.UBPtr.i285 = alloca i64, align 8
  %polly.par.LBPtr.i270 = alloca i64, align 8
  %polly.par.UBPtr.i271 = alloca i64, align 8
  %polly.par.LBPtr.i257 = alloca i64, align 8
  %polly.par.UBPtr.i258 = alloca i64, align 8
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext244 = alloca { i64, i64, i64*, i64* }, align 8
  %polly.par.userContext231 = alloca { i64, i64, i64* }, align 8
  %polly.par.userContext218 = alloca { i64, i64, i64*, i64* }, align 8
  %polly.par.userContext204 = alloca { i64, i64, i64*, i64* }, align 8
  %polly.par.userContext195 = alloca { i64, i64, i64*, i64*, i64*, i64* }, align 8
  %polly.par.userContext189 = alloca { i64, i64, i64* }, align 8
  %polly.par.userContext = alloca { i64, i64, i64* }, align 8
  %0 = icmp slt i64 %n, 1152921504606846977
  br i1 %0, label %polly.start, label %while.cond1.preheader.preheader

while.cond1.preheader.preheader:                  ; preds = %entry
  br label %while.cond1.preheader

while.cond1.preheader:                            ; preds = %while.cond1.preheader.preheader, %blklab2
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab2 ], [ %n, %while.cond1.preheader.preheader ]
  %s.0179 = phi i64 [ %add66, %blklab2 ], [ 0, %while.cond1.preheader.preheader ]
  br label %if.end5

if.end5:                                          ; preds = %blklab6, %while.cond1.preheader
  %i.0177 = phi i64 [ 0, %while.cond1.preheader ], [ %add, %blklab6 ]
  %j.0176 = phi i64 [ %s.0179, %while.cond1.preheader ], [ %add64, %blklab6 ]
  %arrayidx = getelementptr inbounds i64, i64* %y, i64 %j.0176
  store i64 0, i64* %arrayidx, align 8, !tbaa !1
  %add = add nuw nsw i64 %i.0177, 1
  %cmp6 = icmp sge i64 %add, %n
  %cmp9 = icmp slt i64 %j.0176, 1
  %or.cond = or i1 %cmp9, %cmp6
  br i1 %or.cond, label %blklab4, label %if.end11

if.end11:                                         ; preds = %if.end5
  %mul = mul nsw i64 %add, %n
  %add13 = add nsw i64 %j.0176, -1
  %sub14 = add i64 %add13, %mul
  %arrayidx15 = getelementptr inbounds i64, i64* %moves, i64 %sub14
  %1 = load i64, i64* %arrayidx15, align 8, !tbaa !1
  store i64 %1, i64* %arrayidx, align 8, !tbaa !1
  br label %blklab4

blklab4:                                          ; preds = %if.end5, %if.end11
  %2 = phi i64 [ 0, %if.end5 ], [ %1, %if.end11 ]
  %arrayidx17 = getelementptr inbounds i64, i64* %x, i64 %j.0176
  store i64 0, i64* %arrayidx17, align 8, !tbaa !1
  %add18 = add nuw nsw i64 %i.0177, 2
  %cmp19 = icmp slt i64 %add18, %n
  br i1 %cmp19, label %if.end21, label %blklab5

if.end21:                                         ; preds = %blklab4
  %mul23 = mul nsw i64 %add18, %n
  %add24 = add nsw i64 %mul23, %j.0176
  %arrayidx25 = getelementptr inbounds i64, i64* %moves, i64 %add24
  %3 = load i64, i64* %arrayidx25, align 8, !tbaa !1
  store i64 %3, i64* %arrayidx17, align 8, !tbaa !1
  br label %blklab5

blklab5:                                          ; preds = %blklab4, %if.end21
  %4 = phi i64 [ 0, %blklab4 ], [ %3, %if.end21 ]
  %arrayidx27 = getelementptr inbounds i64, i64* %z, i64 %j.0176
  store i64 0, i64* %arrayidx27, align 8, !tbaa !1
  %cmp29 = icmp slt i64 %j.0176, 2
  %mul61 = mul nsw i64 %i.0177, %n
  br i1 %cmp29, label %blklab6, label %if.end31

if.end31:                                         ; preds = %blklab5
  %add33 = add nsw i64 %j.0176, -2
  %sub34 = add i64 %add33, %mul61
  %arrayidx35 = getelementptr inbounds i64, i64* %moves, i64 %sub34
  %5 = load i64, i64* %arrayidx35, align 8, !tbaa !1
  store i64 %5, i64* %arrayidx27, align 8, !tbaa !1
  br label %blklab6

blklab6:                                          ; preds = %blklab5, %if.end31
  %6 = phi i64 [ 0, %blklab5 ], [ %5, %if.end31 ]
  %xor = xor i64 %2, %4
  %cmp39 = icmp slt i64 %4, %2
  %and = select i1 %cmp39, i64 %xor, i64 0
  %xor42 = xor i64 %and, %2
  %add43 = add nsw i64 %xor42, %i.0177
  %xor46 = xor i64 %6, %2
  %cmp47 = icmp slt i64 %2, %6
  %and51 = select i1 %cmp47, i64 %xor46, i64 0
  %xor52 = xor i64 %and51, %6
  %add53 = add nsw i64 %xor52, %j.0176
  %xor54 = xor i64 %add53, %add43
  %cmp55 = icmp slt i64 %add43, %add53
  %and59 = select i1 %cmp55, i64 %xor54, i64 0
  %xor60 = xor i64 %and59, %add43
  %add62 = add nsw i64 %mul61, %j.0176
  %arrayidx63 = getelementptr inbounds i64, i64* %moves, i64 %add62
  store i64 %xor60, i64* %arrayidx63, align 8, !tbaa !1
  %add64 = add nuw nsw i64 %j.0176, 1
  %exitcond = icmp eq i64 %add, %indvars.iv
  br i1 %exitcond, label %blklab2, label %if.end5

blklab2:                                          ; preds = %blklab6
  %add66 = add nuw nsw i64 %s.0179, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %exitcond180 = icmp eq i64 %add66, %n
  br i1 %exitcond180, label %blklab0.loopexit, label %while.cond1.preheader

blklab0.loopexit:                                 ; preds = %blklab2
  br label %blklab0

blklab0:                                          ; preds = %blklab0.loopexit, %polly.cond, %polly.stmt.blklab6
  store i64 %moves_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  ret i64* %moves

polly.start:                                      ; preds = %entry
  %7 = mul nsw i64 %n, -2
  %8 = add nsw i64 %7, 2
  %9 = shl nsw i64 %n, 1
  %10 = add nsw i64 %9, -2
  %11 = icmp slt i64 %10, %n
  %12 = select i1 %11, i64 %10, i64 %n
  %polly.loop_guard = icmp sgt i64 %8, %12
  br i1 %polly.loop_guard, label %polly.cond, label %polly.loop_header.preheader

polly.loop_header.preheader:                      ; preds = %polly.start
  %polly.subfn.storeaddr.n = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 0
  %polly.subfn.storeaddr.polly.indvar = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 1
  %polly.subfn.storeaddr.x = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 2
  %polly.par.userContext181 = bitcast { i64, i64, i64* }* %polly.par.userContext to i8*
  %13 = bitcast i64* %polly.par.LBPtr.i to i8*
  %14 = bitcast i64* %polly.par.UBPtr.i to i8*
  %polly.subfn.storeaddr.n190 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext189, i64 0, i32 0
  %polly.subfn.storeaddr.polly.indvar191 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext189, i64 0, i32 1
  %polly.subfn.storeaddr.y = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext189, i64 0, i32 2
  %polly.par.userContext192 = bitcast { i64, i64, i64* }* %polly.par.userContext189 to i8*
  %15 = bitcast i64* %polly.par.LBPtr.i257 to i8*
  %16 = bitcast i64* %polly.par.UBPtr.i258 to i8*
  %polly.subfn.storeaddr.n196 = getelementptr inbounds { i64, i64, i64*, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64*, i64* }* %polly.par.userContext195, i64 0, i32 0
  %polly.subfn.storeaddr.polly.indvar197 = getelementptr inbounds { i64, i64, i64*, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64*, i64* }* %polly.par.userContext195, i64 0, i32 1
  %polly.subfn.storeaddr.x198 = getelementptr inbounds { i64, i64, i64*, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64*, i64* }* %polly.par.userContext195, i64 0, i32 2
  %polly.subfn.storeaddr.y199 = getelementptr inbounds { i64, i64, i64*, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64*, i64* }* %polly.par.userContext195, i64 0, i32 3
  %polly.subfn.storeaddr.z = getelementptr inbounds { i64, i64, i64*, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64*, i64* }* %polly.par.userContext195, i64 0, i32 4
  %polly.subfn.storeaddr.moves = getelementptr inbounds { i64, i64, i64*, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64*, i64* }* %polly.par.userContext195, i64 0, i32 5
  %polly.par.userContext200 = bitcast { i64, i64, i64*, i64*, i64*, i64* }* %polly.par.userContext195 to i8*
  %17 = add nsw i64 %n, -3
  %polly.subfn.storeaddr.n205 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext204, i64 0, i32 0
  %polly.subfn.storeaddr.polly.indvar206 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext204, i64 0, i32 1
  %polly.subfn.storeaddr.moves207 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext204, i64 0, i32 2
  %polly.subfn.storeaddr.x208 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext204, i64 0, i32 3
  %polly.par.userContext209 = bitcast { i64, i64, i64*, i64* }* %polly.par.userContext204 to i8*
  %18 = bitcast i64* %polly.par.LBPtr.i270 to i8*
  %19 = bitcast i64* %polly.par.UBPtr.i271 to i8*
  %polly.subfn.storeaddr.n219 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext218, i64 0, i32 0
  %polly.subfn.storeaddr.polly.indvar220 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext218, i64 0, i32 1
  %polly.subfn.storeaddr.moves221 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext218, i64 0, i32 2
  %polly.subfn.storeaddr.z222 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext218, i64 0, i32 3
  %polly.par.userContext223 = bitcast { i64, i64, i64*, i64* }* %polly.par.userContext218 to i8*
  %20 = bitcast i64* %polly.par.LBPtr.i284 to i8*
  %21 = bitcast i64* %polly.par.UBPtr.i285 to i8*
  %polly.subfn.storeaddr.n232 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext231, i64 0, i32 0
  %polly.subfn.storeaddr.polly.indvar233 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext231, i64 0, i32 1
  %polly.subfn.storeaddr.z234 = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext231, i64 0, i32 2
  %polly.par.userContext235 = bitcast { i64, i64, i64* }* %polly.par.userContext231 to i8*
  %22 = bitcast i64* %polly.par.LBPtr.i306 to i8*
  %23 = bitcast i64* %polly.par.UBPtr.i307 to i8*
  %24 = add nsw i64 %n, -2
  %polly.subfn.storeaddr.n245 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext244, i64 0, i32 0
  %polly.subfn.storeaddr.polly.indvar246 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext244, i64 0, i32 1
  %polly.subfn.storeaddr.moves247 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext244, i64 0, i32 2
  %polly.subfn.storeaddr.y248 = getelementptr inbounds { i64, i64, i64*, i64* }, { i64, i64, i64*, i64* }* %polly.par.userContext244, i64 0, i32 3
  %polly.par.userContext249 = bitcast { i64, i64, i64*, i64* }* %polly.par.userContext244 to i8*
  %25 = bitcast i64* %polly.par.LBPtr.i320 to i8*
  %26 = bitcast i64* %polly.par.UBPtr.i321 to i8*
  %polly.adjust_ub = add i64 %12, -1
  br label %polly.loop_header

polly.cond.loopexit:                              ; preds = %_findMoves__polly_subfn_6.exit
  br label %polly.cond

polly.cond:                                       ; preds = %polly.cond.loopexit, %polly.start
  %27 = icmp sgt i64 %n, 0
  br i1 %27, label %polly.stmt.blklab6, label %blklab0

polly.loop_header:                                ; preds = %polly.loop_header.preheader, %_findMoves__polly_subfn_6.exit
  %polly.indvar = phi i64 [ %28, %_findMoves__polly_subfn_6.exit ], [ %8, %polly.loop_header.preheader ]
  %28 = add nsw i64 %polly.indvar, 1
  %polly.fdiv_q.shr = ashr i64 %28, 1
  %29 = sub i64 %polly.fdiv_q.shr, %polly.indvar
  %30 = icmp sgt i64 %29, 0
  %31 = select i1 %30, i64 %29, i64 0
  %32 = sub nsw i64 %n, %polly.indvar
  %pexp.fdiv_q.2 = icmp slt i64 %32, 1
  %pexp.fdiv_q.3.v = select i1 %pexp.fdiv_q.2, i64 -3, i64 -1
  %pexp.fdiv_q.3 = add i64 %pexp.fdiv_q.3.v, %32
  %pexp.fdiv_q.4 = sdiv i64 %pexp.fdiv_q.3, 3
  store i64 %n, i64* %polly.subfn.storeaddr.n, align 8
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar, align 8
  store i64* %x, i64** %polly.subfn.storeaddr.x, align 8
  %33 = add nsw i64 %pexp.fdiv_q.4, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_findMoves__polly_subfn, i8* nonnull %polly.par.userContext181, i32 0, i64 %31, i64 %33, i64 1) #7
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %13)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %14)
  %polly.subfunc.arg.polly.indvar.i = load i64, i64* %polly.subfn.storeaddr.polly.indvar, align 8
  %polly.subfunc.arg.x.i = load i64*, i64** %polly.subfn.storeaddr.x, align 8
  %34 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #7
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %_findMoves__polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.loop_header
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i
  %36 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #7
  %37 = icmp eq i8 %36, 0
  br i1 %37, label %_findMoves__polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.loop_header.i, %polly.par.loadIVBounds.i
  %polly.indvar.i = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i ]
  %38 = shl i64 %polly.indvar.i, 1
  %39 = add i64 %polly.indvar.i, %polly.subfunc.arg.polly.indvar.i
  %40 = add i64 %39, %38
  %scevgep.i = getelementptr i64, i64* %polly.subfunc.arg.x.i, i64 %40
  store i64 0, i64* %scevgep.i, align 8, !alias.scope !5, !noalias !7
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i

_findMoves__polly_subfn.exit.loopexit:            ; preds = %polly.par.checkNext.loopexit.i
  br label %_findMoves__polly_subfn.exit

_findMoves__polly_subfn.exit:                     ; preds = %_findMoves__polly_subfn.exit.loopexit, %polly.loop_header
  call void @GOMP_loop_end_nowait() #7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14)
  call void @GOMP_parallel_end() #7
  store i64 %n, i64* %polly.subfn.storeaddr.n190, align 8
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar191, align 8
  store i64* %y, i64** %polly.subfn.storeaddr.y, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_findMoves__polly_subfn_1, i8* nonnull %polly.par.userContext192, i32 0, i64 %31, i64 %33, i64 1) #7
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %15)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %16)
  %polly.subfunc.arg.polly.indvar.i259 = load i64, i64* %polly.subfn.storeaddr.polly.indvar191, align 8
  %polly.subfunc.arg.y.i = load i64*, i64** %polly.subfn.storeaddr.y, align 8
  %41 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i257, i64* nonnull %polly.par.UBPtr.i258) #7
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %_findMoves__polly_subfn_1.exit, label %polly.par.loadIVBounds.i264.preheader

polly.par.loadIVBounds.i264.preheader:            ; preds = %_findMoves__polly_subfn.exit
  br label %polly.par.loadIVBounds.i264

polly.par.checkNext.loopexit.i260:                ; preds = %polly.loop_header.i269
  %43 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i257, i64* nonnull %polly.par.UBPtr.i258) #7
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %_findMoves__polly_subfn_1.exit.loopexit, label %polly.par.loadIVBounds.i264

polly.par.loadIVBounds.i264:                      ; preds = %polly.par.loadIVBounds.i264.preheader, %polly.par.checkNext.loopexit.i260
  %polly.par.UB.i261 = load i64, i64* %polly.par.UBPtr.i258, align 8
  %polly.par.LB.i262 = load i64, i64* %polly.par.LBPtr.i257, align 8
  %polly.adjust_ub.i263 = add i64 %polly.par.UB.i261, -2
  br label %polly.loop_header.i269

polly.loop_header.i269:                           ; preds = %polly.loop_header.i269, %polly.par.loadIVBounds.i264
  %polly.indvar.i265 = phi i64 [ %polly.par.LB.i262, %polly.par.loadIVBounds.i264 ], [ %polly.indvar_next.i267, %polly.loop_header.i269 ]
  %45 = shl i64 %polly.indvar.i265, 1
  %46 = add i64 %polly.indvar.i265, %polly.subfunc.arg.polly.indvar.i259
  %47 = add i64 %46, %45
  %scevgep.i266 = getelementptr i64, i64* %polly.subfunc.arg.y.i, i64 %47
  store i64 0, i64* %scevgep.i266, align 8, !alias.scope !11, !noalias !13
  %polly.indvar_next.i267 = add nsw i64 %polly.indvar.i265, 1
  %polly.loop_cond.i268 = icmp sgt i64 %polly.indvar.i265, %polly.adjust_ub.i263
  br i1 %polly.loop_cond.i268, label %polly.par.checkNext.loopexit.i260, label %polly.loop_header.i269

_findMoves__polly_subfn_1.exit.loopexit:          ; preds = %polly.par.checkNext.loopexit.i260
  br label %_findMoves__polly_subfn_1.exit

_findMoves__polly_subfn_1.exit:                   ; preds = %_findMoves__polly_subfn_1.exit.loopexit, %_findMoves__polly_subfn.exit
  call void @GOMP_loop_end_nowait() #7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %15)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %16)
  call void @GOMP_parallel_end() #7
  %48 = add nsw i64 %29, 1
  %49 = icmp sgt i64 %48, 0
  %50 = select i1 %49, i64 %48, i64 0
  %51 = add nsw i64 %32, 1
  %pexp.p_div_q = udiv i64 %51, 3
  store i64 %n, i64* %polly.subfn.storeaddr.n196, align 8
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar197, align 8
  store i64* %x, i64** %polly.subfn.storeaddr.x198, align 8
  store i64* %y, i64** %polly.subfn.storeaddr.y199, align 8
  store i64* %z, i64** %polly.subfn.storeaddr.z, align 8
  store i64* %moves, i64** %polly.subfn.storeaddr.moves, align 8
  %52 = add nuw i64 %pexp.p_div_q, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_findMoves__polly_subfn_2, i8* nonnull %polly.par.userContext200, i32 0, i64 %50, i64 %52, i64 1) #7
  call void @_findMoves__polly_subfn_2(i8* nonnull %polly.par.userContext200) #7
  call void @GOMP_parallel_end() #7
  %polly.fdiv_q.shr202 = ashr i64 %polly.indvar, 1
  %53 = sub i64 %polly.fdiv_q.shr202, %polly.indvar
  %54 = add nsw i64 %53, 1
  %55 = icmp sgt i64 %54, 0
  %56 = select i1 %55, i64 %54, i64 0
  %pexp.p_div_q203 = udiv i64 %32, 3
  %57 = icmp slt i64 %17, %pexp.p_div_q203
  %58 = select i1 %57, i64 %17, i64 %pexp.p_div_q203
  store i64 %n, i64* %polly.subfn.storeaddr.n205, align 8
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar206, align 8
  store i64* %moves, i64** %polly.subfn.storeaddr.moves207, align 8
  store i64* %x, i64** %polly.subfn.storeaddr.x208, align 8
  %59 = add i64 %58, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_findMoves__polly_subfn_3, i8* nonnull %polly.par.userContext209, i32 0, i64 %56, i64 %59, i64 1) #7
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %18)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %19)
  %polly.subfunc.arg.n.i = load i64, i64* %polly.subfn.storeaddr.n205, align 8
  %polly.subfunc.arg.polly.indvar.i272 = load i64, i64* %polly.subfn.storeaddr.polly.indvar206, align 8
  %polly.subfunc.arg.moves.i = load i64*, i64** %polly.subfn.storeaddr.moves207, align 8
  %polly.subfunc.arg.x.i273 = load i64*, i64** %polly.subfn.storeaddr.x208, align 8
  %60 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i270, i64* nonnull %polly.par.UBPtr.i271) #7
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %_findMoves__polly_subfn_3.exit, label %polly.par.loadIVBounds.preheader.i

polly.par.loadIVBounds.preheader.i:               ; preds = %_findMoves__polly_subfn_1.exit
  %62 = shl i64 %polly.subfunc.arg.n.i, 1
  %scevgep.i274 = getelementptr i64, i64* %polly.subfunc.arg.moves.i, i64 %62
  %63 = shl i64 %polly.subfunc.arg.n.i, 3
  %64 = add i64 %63, 8
  %65 = add i64 %polly.subfunc.arg.polly.indvar.i272, -1
  br label %polly.par.loadIVBounds.i279

polly.par.checkNext.loopexit.i275:                ; preds = %polly.loop_header.i283
  %66 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i270, i64* nonnull %polly.par.UBPtr.i271) #7
  %67 = icmp eq i8 %66, 0
  br i1 %67, label %_findMoves__polly_subfn_3.exit.loopexit, label %polly.par.loadIVBounds.i279

polly.par.loadIVBounds.i279:                      ; preds = %polly.par.checkNext.loopexit.i275, %polly.par.loadIVBounds.preheader.i
  %polly.par.UB.i276 = load i64, i64* %polly.par.UBPtr.i271, align 8
  %polly.par.LB.i277 = load i64, i64* %polly.par.LBPtr.i270, align 8
  %polly.adjust_ub.i278 = add i64 %polly.par.UB.i276, -2
  br label %polly.loop_header.i283

polly.loop_header.i283:                           ; preds = %polly.loop_header.i283, %polly.par.loadIVBounds.i279
  %polly.indvar.i280 = phi i64 [ %polly.par.LB.i277, %polly.par.loadIVBounds.i279 ], [ %polly.indvar_next.i281, %polly.loop_header.i283 ]
  %68 = shl i64 %polly.indvar.i280, 1
  %69 = add i64 %65, %68
  %scevgep2.i = getelementptr i64, i64* %scevgep.i274, i64 %69
  %scevgep23.i = bitcast i64* %scevgep2.i to i8*
  %70 = mul i64 %polly.indvar.i280, %64
  %uglygep.i = getelementptr i8, i8* %scevgep23.i, i64 %70
  %uglygep4.i = bitcast i8* %uglygep.i to i64*
  %_p_scalar_.i = load i64, i64* %uglygep4.i, align 8, !alias.scope !17, !noalias !19
  %71 = add i64 %69, %polly.indvar.i280
  %scevgep5.i = getelementptr i64, i64* %polly.subfunc.arg.x.i273, i64 %71
  store i64 %_p_scalar_.i, i64* %scevgep5.i, align 8, !alias.scope !21, !noalias !23
  %polly.indvar_next.i281 = add nsw i64 %polly.indvar.i280, 1
  %polly.loop_cond.i282 = icmp sgt i64 %polly.indvar.i280, %polly.adjust_ub.i278
  br i1 %polly.loop_cond.i282, label %polly.par.checkNext.loopexit.i275, label %polly.loop_header.i283

_findMoves__polly_subfn_3.exit.loopexit:          ; preds = %polly.par.checkNext.loopexit.i275
  br label %_findMoves__polly_subfn_3.exit

_findMoves__polly_subfn_3.exit:                   ; preds = %_findMoves__polly_subfn_3.exit.loopexit, %_findMoves__polly_subfn_1.exit
  call void @GOMP_loop_end_nowait() #7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %18)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %19)
  call void @GOMP_parallel_end() #7
  %72 = xor i64 %polly.indvar, -1
  %pexp.fdiv_q.1213 = sub i64 -3, %polly.indvar
  %pexp.fdiv_q.2214 = icmp sgt i64 %polly.indvar, -1
  %pexp.fdiv_q.3215 = select i1 %pexp.fdiv_q.2214, i64 %pexp.fdiv_q.1213, i64 %72
  %pexp.fdiv_q.4216 = sdiv i64 %pexp.fdiv_q.3215, 3
  %73 = add nsw i64 %pexp.fdiv_q.4216, 2
  %74 = icmp sgt i64 %56, %73
  %75 = select i1 %74, i64 %56, i64 %73
  store i64 %n, i64* %polly.subfn.storeaddr.n219, align 8
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar220, align 8
  store i64* %moves, i64** %polly.subfn.storeaddr.moves221, align 8
  store i64* %z, i64** %polly.subfn.storeaddr.z222, align 8
  %76 = add nuw i64 %pexp.p_div_q203, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_findMoves__polly_subfn_4, i8* nonnull %polly.par.userContext223, i32 0, i64 %75, i64 %76, i64 1) #7
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %20)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %21)
  %polly.subfunc.arg.n.i286 = load i64, i64* %polly.subfn.storeaddr.n219, align 8
  %polly.subfunc.arg.polly.indvar.i287 = load i64, i64* %polly.subfn.storeaddr.polly.indvar220, align 8
  %polly.subfunc.arg.moves.i288 = load i64*, i64** %polly.subfn.storeaddr.moves221, align 8
  %polly.subfunc.arg.z.i = load i64*, i64** %polly.subfn.storeaddr.z222, align 8
  %77 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i284, i64* nonnull %polly.par.UBPtr.i285) #7
  %78 = icmp eq i8 %77, 0
  br i1 %78, label %_findMoves__polly_subfn_4.exit, label %polly.par.loadIVBounds.preheader.i290

polly.par.loadIVBounds.preheader.i290:            ; preds = %_findMoves__polly_subfn_3.exit
  %scevgep.i289 = getelementptr i64, i64* %polly.subfunc.arg.moves.i288, i64 -2
  %79 = shl i64 %polly.subfunc.arg.n.i286, 3
  %80 = add i64 %79, 8
  %81 = add i64 %polly.subfunc.arg.polly.indvar.i287, -1
  br label %polly.par.loadIVBounds.i295

polly.par.checkNext.loopexit.i291:                ; preds = %polly.loop_header.i305
  %82 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i284, i64* nonnull %polly.par.UBPtr.i285) #7
  %83 = icmp eq i8 %82, 0
  br i1 %83, label %_findMoves__polly_subfn_4.exit.loopexit, label %polly.par.loadIVBounds.i295

polly.par.loadIVBounds.i295:                      ; preds = %polly.par.checkNext.loopexit.i291, %polly.par.loadIVBounds.preheader.i290
  %polly.par.UB.i292 = load i64, i64* %polly.par.UBPtr.i285, align 8
  %polly.par.LB.i293 = load i64, i64* %polly.par.LBPtr.i284, align 8
  %polly.adjust_ub.i294 = add i64 %polly.par.UB.i292, -2
  br label %polly.loop_header.i305

polly.loop_header.i305:                           ; preds = %polly.loop_header.i305, %polly.par.loadIVBounds.i295
  %polly.indvar.i296 = phi i64 [ %polly.par.LB.i293, %polly.par.loadIVBounds.i295 ], [ %polly.indvar_next.i303, %polly.loop_header.i305 ]
  %84 = shl i64 %polly.indvar.i296, 1
  %85 = add i64 %81, %84
  %scevgep2.i297 = getelementptr i64, i64* %scevgep.i289, i64 %85
  %scevgep23.i298 = bitcast i64* %scevgep2.i297 to i8*
  %86 = mul i64 %polly.indvar.i296, %80
  %uglygep.i299 = getelementptr i8, i8* %scevgep23.i298, i64 %86
  %uglygep4.i300 = bitcast i8* %uglygep.i299 to i64*
  %_p_scalar_.i301 = load i64, i64* %uglygep4.i300, align 8, !alias.scope !24, !noalias !26
  %87 = add i64 %85, %polly.indvar.i296
  %scevgep5.i302 = getelementptr i64, i64* %polly.subfunc.arg.z.i, i64 %87
  store i64 %_p_scalar_.i301, i64* %scevgep5.i302, align 8, !alias.scope !29, !noalias !30
  %polly.indvar_next.i303 = add nsw i64 %polly.indvar.i296, 1
  %polly.loop_cond.i304 = icmp sgt i64 %polly.indvar.i296, %polly.adjust_ub.i294
  br i1 %polly.loop_cond.i304, label %polly.par.checkNext.loopexit.i291, label %polly.loop_header.i305

_findMoves__polly_subfn_4.exit.loopexit:          ; preds = %polly.par.checkNext.loopexit.i291
  br label %_findMoves__polly_subfn_4.exit

_findMoves__polly_subfn_4.exit:                   ; preds = %_findMoves__polly_subfn_4.exit.loopexit, %_findMoves__polly_subfn_3.exit
  call void @GOMP_loop_end_nowait() #7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21)
  call void @GOMP_parallel_end() #7
  store i64 %n, i64* %polly.subfn.storeaddr.n232, align 8
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar233, align 8
  store i64* %z, i64** %polly.subfn.storeaddr.z234, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_findMoves__polly_subfn_5, i8* nonnull %polly.par.userContext235, i32 0, i64 %31, i64 %33, i64 1) #7
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %22)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %23)
  %polly.subfunc.arg.polly.indvar.i308 = load i64, i64* %polly.subfn.storeaddr.polly.indvar233, align 8
  %polly.subfunc.arg.z.i309 = load i64*, i64** %polly.subfn.storeaddr.z234, align 8
  %88 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i306, i64* nonnull %polly.par.UBPtr.i307) #7
  %89 = icmp eq i8 %88, 0
  br i1 %89, label %_findMoves__polly_subfn_5.exit, label %polly.par.loadIVBounds.i314.preheader

polly.par.loadIVBounds.i314.preheader:            ; preds = %_findMoves__polly_subfn_4.exit
  br label %polly.par.loadIVBounds.i314

polly.par.checkNext.loopexit.i310:                ; preds = %polly.loop_header.i319
  %90 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i306, i64* nonnull %polly.par.UBPtr.i307) #7
  %91 = icmp eq i8 %90, 0
  br i1 %91, label %_findMoves__polly_subfn_5.exit.loopexit, label %polly.par.loadIVBounds.i314

polly.par.loadIVBounds.i314:                      ; preds = %polly.par.loadIVBounds.i314.preheader, %polly.par.checkNext.loopexit.i310
  %polly.par.UB.i311 = load i64, i64* %polly.par.UBPtr.i307, align 8
  %polly.par.LB.i312 = load i64, i64* %polly.par.LBPtr.i306, align 8
  %polly.adjust_ub.i313 = add i64 %polly.par.UB.i311, -2
  br label %polly.loop_header.i319

polly.loop_header.i319:                           ; preds = %polly.loop_header.i319, %polly.par.loadIVBounds.i314
  %polly.indvar.i315 = phi i64 [ %polly.par.LB.i312, %polly.par.loadIVBounds.i314 ], [ %polly.indvar_next.i317, %polly.loop_header.i319 ]
  %92 = shl i64 %polly.indvar.i315, 1
  %93 = add i64 %polly.indvar.i315, %polly.subfunc.arg.polly.indvar.i308
  %94 = add i64 %93, %92
  %scevgep.i316 = getelementptr i64, i64* %polly.subfunc.arg.z.i309, i64 %94
  store i64 0, i64* %scevgep.i316, align 8, !alias.scope !31, !noalias !33
  %polly.indvar_next.i317 = add nsw i64 %polly.indvar.i315, 1
  %polly.loop_cond.i318 = icmp sgt i64 %polly.indvar.i315, %polly.adjust_ub.i313
  br i1 %polly.loop_cond.i318, label %polly.par.checkNext.loopexit.i310, label %polly.loop_header.i319

_findMoves__polly_subfn_5.exit.loopexit:          ; preds = %polly.par.checkNext.loopexit.i310
  br label %_findMoves__polly_subfn_5.exit

_findMoves__polly_subfn_5.exit:                   ; preds = %_findMoves__polly_subfn_5.exit.loopexit, %_findMoves__polly_subfn_4.exit
  call void @GOMP_loop_end_nowait() #7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %23)
  call void @GOMP_parallel_end() #7
  %95 = sub i64 1, %polly.indvar
  %pexp.fdiv_q.1239 = add nsw i64 %95, -2
  %pexp.fdiv_q.2240 = icmp slt i64 %95, 0
  %pexp.fdiv_q.3241 = select i1 %pexp.fdiv_q.2240, i64 %pexp.fdiv_q.1239, i64 %95
  %pexp.fdiv_q.4242 = sdiv i64 %pexp.fdiv_q.3241, 3
  %96 = add nsw i64 %pexp.fdiv_q.4242, 1
  %97 = icmp sgt i64 %56, %96
  %98 = select i1 %97, i64 %56, i64 %96
  %99 = icmp slt i64 %24, %pexp.p_div_q203
  %100 = select i1 %99, i64 %24, i64 %pexp.p_div_q203
  store i64 %n, i64* %polly.subfn.storeaddr.n245, align 8
  store i64 %polly.indvar, i64* %polly.subfn.storeaddr.polly.indvar246, align 8
  store i64* %moves, i64** %polly.subfn.storeaddr.moves247, align 8
  store i64* %y, i64** %polly.subfn.storeaddr.y248, align 8
  %101 = add i64 %100, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @_findMoves__polly_subfn_6, i8* nonnull %polly.par.userContext249, i32 0, i64 %98, i64 %101, i64 1) #7
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %25)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %26)
  %polly.subfunc.arg.n.i322 = load i64, i64* %polly.subfn.storeaddr.n245, align 8
  %polly.subfunc.arg.polly.indvar.i323 = load i64, i64* %polly.subfn.storeaddr.polly.indvar246, align 8
  %polly.subfunc.arg.moves.i324 = load i64*, i64** %polly.subfn.storeaddr.moves247, align 8
  %polly.subfunc.arg.y.i325 = load i64*, i64** %polly.subfn.storeaddr.y248, align 8
  %102 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i320, i64* nonnull %polly.par.UBPtr.i321) #7
  %103 = icmp eq i8 %102, 0
  br i1 %103, label %_findMoves__polly_subfn_6.exit, label %polly.par.loadIVBounds.preheader.i327

polly.par.loadIVBounds.preheader.i327:            ; preds = %_findMoves__polly_subfn_5.exit
  %104 = add i64 %polly.subfunc.arg.n.i322, -1
  %scevgep.i326 = getelementptr i64, i64* %polly.subfunc.arg.moves.i324, i64 %104
  %105 = shl i64 %polly.subfunc.arg.n.i322, 3
  %106 = add i64 %105, 8
  %107 = add i64 %polly.subfunc.arg.polly.indvar.i323, -1
  br label %polly.par.loadIVBounds.i332

polly.par.checkNext.loopexit.i328:                ; preds = %polly.loop_header.i342
  %108 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i320, i64* nonnull %polly.par.UBPtr.i321) #7
  %109 = icmp eq i8 %108, 0
  br i1 %109, label %_findMoves__polly_subfn_6.exit.loopexit, label %polly.par.loadIVBounds.i332

polly.par.loadIVBounds.i332:                      ; preds = %polly.par.checkNext.loopexit.i328, %polly.par.loadIVBounds.preheader.i327
  %polly.par.UB.i329 = load i64, i64* %polly.par.UBPtr.i321, align 8
  %polly.par.LB.i330 = load i64, i64* %polly.par.LBPtr.i320, align 8
  %polly.adjust_ub.i331 = add i64 %polly.par.UB.i329, -2
  br label %polly.loop_header.i342

polly.loop_header.i342:                           ; preds = %polly.loop_header.i342, %polly.par.loadIVBounds.i332
  %polly.indvar.i333 = phi i64 [ %polly.par.LB.i330, %polly.par.loadIVBounds.i332 ], [ %polly.indvar_next.i340, %polly.loop_header.i342 ]
  %110 = shl i64 %polly.indvar.i333, 1
  %111 = add i64 %107, %110
  %scevgep2.i334 = getelementptr i64, i64* %scevgep.i326, i64 %111
  %scevgep23.i335 = bitcast i64* %scevgep2.i334 to i8*
  %112 = mul i64 %polly.indvar.i333, %106
  %uglygep.i336 = getelementptr i8, i8* %scevgep23.i335, i64 %112
  %uglygep4.i337 = bitcast i8* %uglygep.i336 to i64*
  %_p_scalar_.i338 = load i64, i64* %uglygep4.i337, align 8, !alias.scope !37, !noalias !39
  %113 = add i64 %111, %polly.indvar.i333
  %scevgep5.i339 = getelementptr i64, i64* %polly.subfunc.arg.y.i325, i64 %113
  store i64 %_p_scalar_.i338, i64* %scevgep5.i339, align 8, !alias.scope !40, !noalias !43
  %polly.indvar_next.i340 = add nsw i64 %polly.indvar.i333, 1
  %polly.loop_cond.i341 = icmp sgt i64 %polly.indvar.i333, %polly.adjust_ub.i331
  br i1 %polly.loop_cond.i341, label %polly.par.checkNext.loopexit.i328, label %polly.loop_header.i342

_findMoves__polly_subfn_6.exit.loopexit:          ; preds = %polly.par.checkNext.loopexit.i328
  br label %_findMoves__polly_subfn_6.exit

_findMoves__polly_subfn_6.exit:                   ; preds = %_findMoves__polly_subfn_6.exit.loopexit, %_findMoves__polly_subfn_5.exit
  call void @GOMP_loop_end_nowait() #7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %25)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %26)
  call void @GOMP_parallel_end() #7
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.cond.loopexit, label %polly.loop_header

polly.stmt.blklab6:                               ; preds = %polly.cond
  %114 = add i64 %n, -1
  %scevgep = getelementptr i64, i64* %x, i64 %114
  %_p_scalar_ = load i64, i64* %scevgep, align 8, !alias.scope !44, !noalias !46
  %scevgep250 = getelementptr i64, i64* %y, i64 %114
  %_p_scalar_251 = load i64, i64* %scevgep250, align 8, !alias.scope !48, !noalias !50
  %p_xor = xor i64 %_p_scalar_251, %_p_scalar_
  %p_cmp39 = icmp slt i64 %_p_scalar_, %_p_scalar_251
  %p_and = select i1 %p_cmp39, i64 %p_xor, i64 0
  %p_xor42 = xor i64 %p_and, %_p_scalar_251
  %scevgep252 = getelementptr i64, i64* %z, i64 %114
  %_p_scalar_253 = load i64, i64* %scevgep252, align 8, !alias.scope !49, !noalias !51
  %p_xor46 = xor i64 %_p_scalar_253, %_p_scalar_251
  %p_cmp47 = icmp slt i64 %_p_scalar_251, %_p_scalar_253
  %p_and51 = select i1 %p_cmp47, i64 %p_xor46, i64 0
  %p_xor52 = xor i64 %p_and51, %_p_scalar_253
  %p_add53 = add nsw i64 %p_xor52, %114
  %p_xor54 = xor i64 %p_add53, %p_xor42
  %p_cmp55 = icmp slt i64 %p_xor42, %p_add53
  %p_and59 = select i1 %p_cmp55, i64 %p_xor54, i64 0
  %p_xor60 = xor i64 %p_and59, %p_xor42
  %scevgep254 = getelementptr i64, i64* %moves, i64 %114
  store i64 %p_xor60, i64* %scevgep254, align 8, !alias.scope !47, !noalias !52
  br label %blklab0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #2 {
entry:
  %_9_size = alloca i64, align 8
  %_9_size_size = alloca i64, align 8
  %_21_size = alloca i64, align 8
  %0 = bitcast i64* %_9_size to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #7
  store i64 0, i64* %_9_size, align 8, !tbaa !1
  %1 = bitcast i64* %_9_size_size to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %1) #7
  store i64 0, i64* %_9_size_size, align 8, !tbaa !1
  %2 = bitcast i64* %_21_size to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #7
  store i64 0, i64* %_21_size, align 8, !tbaa !1
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_9_size, i64* nonnull %_9_size_size) #7
  %3 = load i64*, i64** %call, align 8, !tbaa !53
  %call1 = call i64* @parseStringToInt(i64* %3) #7
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab7, label %if.end

if.end:                                           ; preds = %entry
  %4 = load i64, i64* %call1, align 8, !tbaa !1
  %mul = mul nsw i64 %4, %4
  %call2 = call i64* @create1DArray_int64_t(i64 0, i64 %mul) #7
  %call3 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #7
  %call4 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #7
  %call5 = call i64* @create1DArray_int64_t(i64 0, i64 %4) #7
  %call6 = call i64* @_findMoves_(i64* %call2, i64 %mul, i64 %4, i64* %call3, i64 undef, i64* %call4, i64 undef, i64* %call5, i64 undef, i64* nonnull %_21_size)
  %sub = add nsw i64 %4, -1
  %arrayidx7171 = getelementptr inbounds i64, i64* %call2, i64 %sub
  %5 = load i64, i64* %arrayidx7171, align 8, !tbaa !1
  %call8 = call i64* @create1DArray_int64_t(i64 0, i64 50) #7
  %6 = bitcast i64* %call8 to <2 x i64>*
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %6, align 8, !tbaa !1
  %arrayidx11 = getelementptr inbounds i64, i64* %call8, i64 2
  %7 = bitcast i64* %arrayidx11 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %7, align 8, !tbaa !1
  %arrayidx13 = getelementptr inbounds i64, i64* %call8, i64 4
  %8 = bitcast i64* %arrayidx13 to <2 x i64>*
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %8, align 8, !tbaa !1
  %arrayidx15 = getelementptr inbounds i64, i64* %call8, i64 6
  %9 = bitcast i64* %arrayidx15 to <2 x i64>*
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %9, align 8, !tbaa !1
  %arrayidx17 = getelementptr inbounds i64, i64* %call8, i64 8
  %10 = bitcast i64* %arrayidx17 to <2 x i64>*
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %10, align 8, !tbaa !1
  %arrayidx19 = getelementptr inbounds i64, i64* %call8, i64 10
  %11 = bitcast i64* %arrayidx19 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %11, align 8, !tbaa !1
  %arrayidx21 = getelementptr inbounds i64, i64* %call8, i64 12
  %12 = bitcast i64* %arrayidx21 to <2 x i64>*
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %12, align 8, !tbaa !1
  %arrayidx23 = getelementptr inbounds i64, i64* %call8, i64 14
  %13 = bitcast i64* %arrayidx23 to <2 x i64>*
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %13, align 8, !tbaa !1
  %arrayidx25 = getelementptr inbounds i64, i64* %call8, i64 16
  %14 = bitcast i64* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %14, align 8, !tbaa !1
  %arrayidx27 = getelementptr inbounds i64, i64* %call8, i64 18
  %15 = bitcast i64* %arrayidx27 to <2 x i64>*
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %15, align 8, !tbaa !1
  %arrayidx29 = getelementptr inbounds i64, i64* %call8, i64 20
  %16 = bitcast i64* %arrayidx29 to <2 x i64>*
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %16, align 8, !tbaa !1
  %arrayidx31 = getelementptr inbounds i64, i64* %call8, i64 22
  %17 = bitcast i64* %arrayidx31 to <2 x i64>*
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %17, align 8, !tbaa !1
  %arrayidx33 = getelementptr inbounds i64, i64* %call8, i64 24
  %18 = bitcast i64* %arrayidx33 to <2 x i64>*
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %18, align 8, !tbaa !1
  %arrayidx35 = getelementptr inbounds i64, i64* %call8, i64 26
  %19 = bitcast i64* %arrayidx35 to <2 x i64>*
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %19, align 8, !tbaa !1
  %arrayidx37 = getelementptr inbounds i64, i64* %call8, i64 28
  %20 = bitcast i64* %arrayidx37 to <2 x i64>*
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %20, align 8, !tbaa !1
  %arrayidx39 = getelementptr inbounds i64, i64* %call8, i64 30
  %21 = bitcast i64* %arrayidx39 to <2 x i64>*
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %21, align 8, !tbaa !1
  %arrayidx41 = getelementptr inbounds i64, i64* %call8, i64 32
  %22 = bitcast i64* %arrayidx41 to <2 x i64>*
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %22, align 8, !tbaa !1
  %arrayidx43 = getelementptr inbounds i64, i64* %call8, i64 34
  %23 = bitcast i64* %arrayidx43 to <2 x i64>*
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %23, align 8, !tbaa !1
  %arrayidx45 = getelementptr inbounds i64, i64* %call8, i64 36
  %24 = bitcast i64* %arrayidx45 to <2 x i64>*
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %24, align 8, !tbaa !1
  %arrayidx47 = getelementptr inbounds i64, i64* %call8, i64 38
  %25 = bitcast i64* %arrayidx47 to <2 x i64>*
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %25, align 8, !tbaa !1
  %arrayidx49 = getelementptr inbounds i64, i64* %call8, i64 40
  %26 = bitcast i64* %arrayidx49 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %26, align 8, !tbaa !1
  %arrayidx51 = getelementptr inbounds i64, i64* %call8, i64 42
  %27 = bitcast i64* %arrayidx51 to <2 x i64>*
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %27, align 8, !tbaa !1
  %arrayidx53 = getelementptr inbounds i64, i64* %call8, i64 44
  %28 = bitcast i64* %arrayidx53 to <2 x i64>*
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %28, align 8, !tbaa !1
  %arrayidx55 = getelementptr inbounds i64, i64* %call8, i64 46
  %29 = bitcast i64* %arrayidx55 to <2 x i64>*
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %29, align 8, !tbaa !1
  %arrayidx57 = getelementptr inbounds i64, i64* %call8, i64 48
  %30 = bitcast i64* %arrayidx57 to <2 x i64>*
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %30, align 8, !tbaa !1
  call void @printf_s(i64* %call8, i64 50) #7
  %call59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %5)
  %call60 = call i64* @create1DArray_int64_t(i64 0, i64 23) #7
  %31 = bitcast i64* %call60 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %31, align 8, !tbaa !1
  %arrayidx63 = getelementptr inbounds i64, i64* %call60, i64 2
  %32 = bitcast i64* %arrayidx63 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %32, align 8, !tbaa !1
  %arrayidx65 = getelementptr inbounds i64, i64* %call60, i64 4
  %33 = bitcast i64* %arrayidx65 to <2 x i64>*
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %33, align 8, !tbaa !1
  %arrayidx67 = getelementptr inbounds i64, i64* %call60, i64 6
  %34 = bitcast i64* %arrayidx67 to <2 x i64>*
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %34, align 8, !tbaa !1
  %arrayidx69 = getelementptr inbounds i64, i64* %call60, i64 8
  %35 = bitcast i64* %arrayidx69 to <2 x i64>*
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %35, align 8, !tbaa !1
  %arrayidx71 = getelementptr inbounds i64, i64* %call60, i64 10
  %36 = bitcast i64* %arrayidx71 to <2 x i64>*
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx73 = getelementptr inbounds i64, i64* %call60, i64 12
  %37 = bitcast i64* %arrayidx73 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx75 = getelementptr inbounds i64, i64* %call60, i64 14
  %38 = bitcast i64* %arrayidx75 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx77 = getelementptr inbounds i64, i64* %call60, i64 16
  %39 = bitcast i64* %arrayidx77 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx79 = getelementptr inbounds i64, i64* %call60, i64 18
  %40 = bitcast i64* %arrayidx79 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %40, align 8, !tbaa !1
  %arrayidx81 = getelementptr inbounds i64, i64* %call60, i64 20
  %41 = bitcast i64* %arrayidx81 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %41, align 8, !tbaa !1
  %arrayidx83 = getelementptr inbounds i64, i64* %call60, i64 22
  store i64 101, i64* %arrayidx83, align 8, !tbaa !1
  call void @println_s(i64* %call60, i64 23) #7
  br label %blklab7

blklab7:                                          ; preds = %entry, %if.end
  call void @exit(i32 0) #8
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

declare void @printf_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #4

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

define internal void @_findMoves__polly_subfn(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %1 = bitcast i8* %0 to i64*
  %polly.subfunc.arg.polly.indvar = load i64, i64* %1, align 8
  %2 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %3 = bitcast i8* %2 to i64**
  %polly.subfunc.arg.x = load i64*, i64** %3, align 8
  %4 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %6 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %8 = shl i64 %polly.indvar, 1
  %9 = add i64 %polly.indvar, %polly.subfunc.arg.polly.indvar
  %10 = add i64 %9, %8
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.x, i64 %10
  store i64 0, i64* %scevgep, align 8, !alias.scope !44, !noalias !46
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*) local_unnamed_addr

declare void @GOMP_loop_end_nowait() local_unnamed_addr

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64) local_unnamed_addr

declare void @GOMP_parallel_end() local_unnamed_addr

define internal void @_findMoves__polly_subfn_1(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %1 = bitcast i8* %0 to i64*
  %polly.subfunc.arg.polly.indvar = load i64, i64* %1, align 8
  %2 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %3 = bitcast i8* %2 to i64**
  %polly.subfunc.arg.y = load i64*, i64** %3, align 8
  %4 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %6 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %8 = shl i64 %polly.indvar, 1
  %9 = add i64 %polly.indvar, %polly.subfunc.arg.polly.indvar
  %10 = add i64 %9, %8
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.y, i64 %10
  store i64 0, i64* %scevgep, align 8, !alias.scope !48, !noalias !50
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

define internal void @_findMoves__polly_subfn_2(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.n = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64*
  %polly.subfunc.arg.polly.indvar = load i64, i64* %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.x = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 24
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.y = load i64*, i64** %6, align 8
  %7 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 32
  %8 = bitcast i8* %7 to i64**
  %polly.subfunc.arg.z = load i64*, i64** %8, align 8
  %9 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 40
  %10 = bitcast i8* %9 to i64**
  %polly.subfunc.arg.moves = load i64*, i64** %10, align 8
  %11 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %13 = shl i64 %polly.subfunc.arg.n, 3
  %14 = add i64 %13, 8
  %15 = add i64 %polly.subfunc.arg.polly.indvar, -2
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %16 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %18 = shl i64 %polly.indvar, 1
  %19 = add i64 %15, %18
  %20 = add i64 %19, %polly.indvar
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.x, i64 %20
  %_p_scalar_ = load i64, i64* %scevgep, align 8, !alias.scope !44, !noalias !46
  %scevgep2 = getelementptr i64, i64* %polly.subfunc.arg.y, i64 %20
  %_p_scalar_3 = load i64, i64* %scevgep2, align 8, !alias.scope !48, !noalias !50
  %p_xor = xor i64 %_p_scalar_3, %_p_scalar_
  %p_cmp39 = icmp slt i64 %_p_scalar_, %_p_scalar_3
  %p_and = select i1 %p_cmp39, i64 %p_xor, i64 0
  %p_xor42 = xor i64 %p_and, %_p_scalar_3
  %p_add43 = add nsw i64 %p_xor42, %polly.indvar
  %scevgep4 = getelementptr i64, i64* %polly.subfunc.arg.z, i64 %20
  %_p_scalar_5 = load i64, i64* %scevgep4, align 8, !alias.scope !49, !noalias !51
  %p_xor46 = xor i64 %_p_scalar_5, %_p_scalar_3
  %p_cmp47 = icmp slt i64 %_p_scalar_3, %_p_scalar_5
  %p_and51 = select i1 %p_cmp47, i64 %p_xor46, i64 0
  %p_xor52 = xor i64 %p_and51, %_p_scalar_5
  %p_add53 = add nsw i64 %p_xor52, %20
  %p_xor54 = xor i64 %p_add53, %p_add43
  %p_cmp55 = icmp slt i64 %p_add43, %p_add53
  %p_and59 = select i1 %p_cmp55, i64 %p_xor54, i64 0
  %p_xor60 = xor i64 %p_and59, %p_add43
  %scevgep6 = getelementptr i64, i64* %polly.subfunc.arg.moves, i64 %19
  %scevgep67 = bitcast i64* %scevgep6 to i8*
  %21 = mul i64 %polly.indvar, %14
  %uglygep = getelementptr i8, i8* %scevgep67, i64 %21
  %uglygep8 = bitcast i8* %uglygep to i64*
  store i64 %p_xor60, i64* %uglygep8, align 8, !alias.scope !47, !noalias !52
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

define internal void @_findMoves__polly_subfn_3(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.n = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64*
  %polly.subfunc.arg.polly.indvar = load i64, i64* %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.moves = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 24
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.x = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %9 = shl i64 %polly.subfunc.arg.n, 1
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.moves, i64 %9
  %10 = shl i64 %polly.subfunc.arg.n, 3
  %11 = add i64 %10, 8
  %12 = add i64 %polly.subfunc.arg.polly.indvar, -1
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %13 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %15 = shl i64 %polly.indvar, 1
  %16 = add i64 %12, %15
  %scevgep2 = getelementptr i64, i64* %scevgep, i64 %16
  %scevgep23 = bitcast i64* %scevgep2 to i8*
  %17 = mul i64 %polly.indvar, %11
  %uglygep = getelementptr i8, i8* %scevgep23, i64 %17
  %uglygep4 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep4, align 8, !alias.scope !47, !noalias !52
  %18 = add i64 %16, %polly.indvar
  %scevgep5 = getelementptr i64, i64* %polly.subfunc.arg.x, i64 %18
  store i64 %_p_scalar_, i64* %scevgep5, align 8, !alias.scope !44, !noalias !46
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

define internal void @_findMoves__polly_subfn_4(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.n = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64*
  %polly.subfunc.arg.polly.indvar = load i64, i64* %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.moves = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 24
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.z = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.moves, i64 -2
  %9 = shl i64 %polly.subfunc.arg.n, 3
  %10 = add i64 %9, 8
  %11 = add i64 %polly.subfunc.arg.polly.indvar, -1
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %12 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %14 = shl i64 %polly.indvar, 1
  %15 = add i64 %11, %14
  %scevgep2 = getelementptr i64, i64* %scevgep, i64 %15
  %scevgep23 = bitcast i64* %scevgep2 to i8*
  %16 = mul i64 %polly.indvar, %10
  %uglygep = getelementptr i8, i8* %scevgep23, i64 %16
  %uglygep4 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep4, align 8, !alias.scope !47, !noalias !52
  %17 = add i64 %15, %polly.indvar
  %scevgep5 = getelementptr i64, i64* %polly.subfunc.arg.z, i64 %17
  store i64 %_p_scalar_, i64* %scevgep5, align 8, !alias.scope !49, !noalias !51
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

define internal void @_findMoves__polly_subfn_5(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %1 = bitcast i8* %0 to i64*
  %polly.subfunc.arg.polly.indvar = load i64, i64* %1, align 8
  %2 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %3 = bitcast i8* %2 to i64**
  %polly.subfunc.arg.z = load i64*, i64** %3, align 8
  %4 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %6 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %8 = shl i64 %polly.indvar, 1
  %9 = add i64 %polly.indvar, %polly.subfunc.arg.polly.indvar
  %10 = add i64 %9, %8
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.z, i64 %10
  store i64 0, i64* %scevgep, align 8, !alias.scope !49, !noalias !51
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

define internal void @_findMoves__polly_subfn_6(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.n = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64*
  %polly.subfunc.arg.polly.indvar = load i64, i64* %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.moves = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 24
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.y = load i64*, i64** %6, align 8
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  %9 = add i64 %polly.subfunc.arg.n, -1
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.moves, i64 %9
  %10 = shl i64 %polly.subfunc.arg.n, 3
  %11 = add i64 %10, 8
  %12 = add i64 %polly.subfunc.arg.polly.indvar, -1
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %13 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %15 = shl i64 %polly.indvar, 1
  %16 = add i64 %12, %15
  %scevgep2 = getelementptr i64, i64* %scevgep, i64 %16
  %scevgep23 = bitcast i64* %scevgep2 to i8*
  %17 = mul i64 %polly.indvar, %11
  %uglygep = getelementptr i8, i8* %scevgep23, i64 %17
  %uglygep4 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep4, align 8, !alias.scope !47, !noalias !52
  %18 = add i64 %16, %polly.indvar
  %scevgep5 = getelementptr i64, i64* %polly.subfunc.arg.y, i64 %18
  store i64 %_p_scalar_, i64* %scevgep5, align 8, !alias.scope !48, !noalias !50
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "polly.skip.fn" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 5.0.0 (http://llvm.org/git/clang.git f6333015598c753d3d07062eea2a6bff85416b1b) (http://llvm.org/git/llvm.git a753d9a103647208b4ff0d21517e40b30511b818)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6, !"polly.alias.scope.MemRef_x"}
!6 = distinct !{!6, !"polly.alias.scope.domain"}
!7 = !{!8, !9, !10}
!8 = distinct !{!8, !6, !"polly.alias.scope.MemRef_moves"}
!9 = distinct !{!9, !6, !"polly.alias.scope.MemRef_y"}
!10 = distinct !{!10, !6, !"polly.alias.scope.MemRef_z"}
!11 = distinct !{!11, !12, !"polly.alias.scope.MemRef_y"}
!12 = distinct !{!12, !"polly.alias.scope.domain"}
!13 = !{!14, !15, !16}
!14 = distinct !{!14, !12, !"polly.alias.scope.MemRef_moves"}
!15 = distinct !{!15, !12, !"polly.alias.scope.MemRef_x"}
!16 = distinct !{!16, !12, !"polly.alias.scope.MemRef_z"}
!17 = distinct !{!17, !18, !"polly.alias.scope.MemRef_moves"}
!18 = distinct !{!18, !"polly.alias.scope.domain"}
!19 = !{!20, !21, !22}
!20 = distinct !{!20, !18, !"polly.alias.scope.MemRef_y"}
!21 = distinct !{!21, !18, !"polly.alias.scope.MemRef_x"}
!22 = distinct !{!22, !18, !"polly.alias.scope.MemRef_z"}
!23 = !{!17, !20, !22}
!24 = distinct !{!24, !25, !"polly.alias.scope.MemRef_moves"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{!27, !28, !29}
!27 = distinct !{!27, !25, !"polly.alias.scope.MemRef_y"}
!28 = distinct !{!28, !25, !"polly.alias.scope.MemRef_x"}
!29 = distinct !{!29, !25, !"polly.alias.scope.MemRef_z"}
!30 = !{!24, !27, !28}
!31 = distinct !{!31, !32, !"polly.alias.scope.MemRef_z"}
!32 = distinct !{!32, !"polly.alias.scope.domain"}
!33 = !{!34, !35, !36}
!34 = distinct !{!34, !32, !"polly.alias.scope.MemRef_moves"}
!35 = distinct !{!35, !32, !"polly.alias.scope.MemRef_y"}
!36 = distinct !{!36, !32, !"polly.alias.scope.MemRef_x"}
!37 = distinct !{!37, !38, !"polly.alias.scope.MemRef_moves"}
!38 = distinct !{!38, !"polly.alias.scope.domain"}
!39 = !{!40, !41, !42}
!40 = distinct !{!40, !38, !"polly.alias.scope.MemRef_y"}
!41 = distinct !{!41, !38, !"polly.alias.scope.MemRef_x"}
!42 = distinct !{!42, !38, !"polly.alias.scope.MemRef_z"}
!43 = !{!37, !41, !42}
!44 = distinct !{!44, !45, !"polly.alias.scope.MemRef_x"}
!45 = distinct !{!45, !"polly.alias.scope.domain"}
!46 = !{!47, !48, !49}
!47 = distinct !{!47, !45, !"polly.alias.scope.MemRef_moves"}
!48 = distinct !{!48, !45, !"polly.alias.scope.MemRef_y"}
!49 = distinct !{!49, !45, !"polly.alias.scope.MemRef_z"}
!50 = !{!47, !44, !49}
!51 = !{!47, !48, !44}
!52 = !{!48, !44, !49}
!53 = !{!54, !54, i64 0}
!54 = !{!"any pointer", !3, i64 0}
