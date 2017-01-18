; ModuleID = 'newTicTacToe_original.c'
source_filename = "newTicTacToe_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Board = type { i64*, i64, i64 }

@.str.1 = private unnamed_addr constant [9 x i8] c" pieces:\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c" move:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.Board* @copy_Board(%struct.Board* nocapture readonly %_Board) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 24) #6
  %0 = bitcast i8* %call to %struct.Board*
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %_Board, i64 0, i32 1
  %1 = load i64, i64* %pieces_size, align 8, !tbaa !1
  %pieces_size1 = getelementptr inbounds i8, i8* %call, i64 8
  %2 = bitcast i8* %pieces_size1 to i64*
  store i64 %1, i64* %2, align 8, !tbaa !1
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %_Board, i64 0, i32 0
  %3 = load i64*, i64** %pieces, align 8, !tbaa !7
  %call3 = tail call i64* @copy1DArray_int64_t(i64* %3, i64 %1) #6
  %pieces4 = bitcast i8* %call to i64**
  store i64* %call3, i64** %pieces4, align 8, !tbaa !7
  %move = getelementptr inbounds %struct.Board, %struct.Board* %_Board, i64 0, i32 2
  %4 = load i64, i64* %move, align 8, !tbaa !8
  %move5 = getelementptr inbounds i8, i8* %call, i64 16
  %5 = bitcast i8* %move5 to i64*
  store i64 %4, i64* %5, align 8, !tbaa !8
  ret %struct.Board* %0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #2

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Board** @copy_array_Board(%struct.Board** nocapture readonly %_Board, i64 %_Board_size) local_unnamed_addr #0 {
entry:
  %mul = shl i64 %_Board_size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #6
  %0 = bitcast i8* %call to %struct.Board**
  %cmp12 = icmp eq i64 %_Board_size, 0
  br i1 %cmp12, label %for.cond.cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret %struct.Board** %0

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.Board*, %struct.Board** %_Board, i64 %indvars.iv
  %1 = load %struct.Board*, %struct.Board** %arrayidx, align 8, !tbaa !9
  %call.i = tail call noalias i8* @malloc(i64 24) #6
  %pieces_size.i = getelementptr inbounds %struct.Board, %struct.Board* %1, i64 0, i32 1
  %2 = load i64, i64* %pieces_size.i, align 8, !tbaa !1
  %pieces_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %3 = bitcast i8* %pieces_size1.i to i64*
  store i64 %2, i64* %3, align 8, !tbaa !1
  %pieces.i = getelementptr inbounds %struct.Board, %struct.Board* %1, i64 0, i32 0
  %4 = load i64*, i64** %pieces.i, align 8, !tbaa !7
  %call3.i = tail call i64* @copy1DArray_int64_t(i64* %4, i64 %2) #6
  %pieces4.i = bitcast i8* %call.i to i64**
  store i64* %call3.i, i64** %pieces4.i, align 8, !tbaa !7
  %move.i = getelementptr inbounds %struct.Board, %struct.Board* %1, i64 0, i32 2
  %5 = load i64, i64* %move.i, align 8, !tbaa !8
  %move5.i = getelementptr inbounds i8, i8* %call.i, i64 16
  %6 = bitcast i8* %move5.i to i64*
  store i64 %5, i64* %6, align 8, !tbaa !8
  %arrayidx4 = getelementptr inbounds %struct.Board*, %struct.Board** %0, i64 %indvars.iv
  %7 = bitcast %struct.Board** %arrayidx4 to i8**
  store i8* %call.i, i8** %7, align 8, !tbaa !9
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %_Board_size
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body
}

; Function Attrs: nounwind uwtable
define void @free_Board(%struct.Board* nocapture %board) local_unnamed_addr #0 {
entry:
  %0 = bitcast %struct.Board* %board to i8**
  %1 = load i8*, i8** %0, align 8, !tbaa !7
  tail call void @free(i8* %1) #6
  %2 = bitcast %struct.Board* %board to i8*
  tail call void @free(i8* %2) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define void @printf_Board(%struct.Board* nocapture readonly %board) local_unnamed_addr #0 {
entry:
  %putchar = tail call i32 @putchar(i32 123) #6
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0))
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %board, i64 0, i32 0
  %0 = load i64*, i64** %pieces, align 8, !tbaa !7
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %board, i64 0, i32 1
  %1 = load i64, i64* %pieces_size, align 8, !tbaa !1
  tail call void @printf1DArray_int64_t(i64* %0, i64 %1) #6
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0))
  %move = getelementptr inbounds %struct.Board, %struct.Board* %board, i64 0, i32 2
  %2 = load i64, i64* %move, align 8, !tbaa !8
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i64 %2)
  %putchar7 = tail call i32 @putchar(i32 125) #6
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @printf1DArray_int64_t(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Board* @_EmptyBoard_() local_unnamed_addr #0 {
entry:
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 9) #6
  %not.cmp = icmp eq i64* %call, null
  %0 = bitcast i64* %call to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 72, i32 8, i1 false)
  %call14 = tail call noalias i8* @malloc(i64 24) #6
  %1 = bitcast i8* %call14 to %struct.Board*
  %pieces_size = getelementptr inbounds i8, i8* %call14, i64 8
  %2 = bitcast i8* %pieces_size to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %2, align 8, !tbaa !10
  %call15 = tail call i64* @copy1DArray_int64_t(i64* %call, i64 9) #6
  %pieces = bitcast i8* %call14 to i64**
  store i64* %call15, i64** %pieces, align 8, !tbaa !7
  br i1 %not.cmp, label %if.end25, label %if.then24

if.then24:                                        ; preds = %entry
  %3 = bitcast i64* %call to i8*
  tail call void @free(i8* %3) #6
  br label %if.end25

if.end25:                                         ; preds = %entry, %if.then24
  ret %struct.Board* %1
}

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define i64 @_countOf_(i64* nocapture %pieces, i64 %pieces_size, i1 zeroext %pieces_dealloc, i64 %s) local_unnamed_addr #0 {
entry:
  %cmp22 = icmp sgt i64 %pieces_size, 0
  br i1 %cmp22, label %if.end.preheader, label %blklab11

if.end.preheader:                                 ; preds = %entry
  %0 = add i64 %pieces_size, -1
  %xtraiter = and i64 %pieces_size, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %if.end.prol.loopexit, label %if.end.prol.preheader

if.end.prol.preheader:                            ; preds = %if.end.preheader
  br label %if.end.prol

if.end.prol:                                      ; preds = %if.end.prol, %if.end.prol.preheader
  %i.024.prol = phi i64 [ %add4.prol, %if.end.prol ], [ 0, %if.end.prol.preheader ]
  %count.023.prol = phi i64 [ %add.count.0.prol, %if.end.prol ], [ 0, %if.end.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end.prol ], [ %xtraiter, %if.end.prol.preheader ]
  %arrayidx.prol = getelementptr inbounds i64, i64* %pieces, i64 %i.024.prol
  %1 = load i64, i64* %arrayidx.prol, align 8, !tbaa !10
  %cmp1.prol = icmp eq i64 %1, %s
  %add.prol = zext i1 %cmp1.prol to i64
  %add.count.0.prol = add nsw i64 %add.prol, %count.023.prol
  %add4.prol = add nuw nsw i64 %i.024.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %if.end.prol.loopexit.unr-lcssa, label %if.end.prol, !llvm.loop !11

if.end.prol.loopexit.unr-lcssa:                   ; preds = %if.end.prol
  br label %if.end.prol.loopexit

if.end.prol.loopexit:                             ; preds = %if.end.preheader, %if.end.prol.loopexit.unr-lcssa
  %add.count.0.lcssa.unr = phi i64 [ undef, %if.end.preheader ], [ %add.count.0.prol, %if.end.prol.loopexit.unr-lcssa ]
  %i.024.unr = phi i64 [ 0, %if.end.preheader ], [ %add4.prol, %if.end.prol.loopexit.unr-lcssa ]
  %count.023.unr = phi i64 [ 0, %if.end.preheader ], [ %add.count.0.prol, %if.end.prol.loopexit.unr-lcssa ]
  %2 = icmp ult i64 %0, 3
  br i1 %2, label %blklab11.loopexit, label %if.end.preheader.new

if.end.preheader.new:                             ; preds = %if.end.prol.loopexit
  br label %if.end

if.end:                                           ; preds = %if.end, %if.end.preheader.new
  %i.024 = phi i64 [ %i.024.unr, %if.end.preheader.new ], [ %add4.3, %if.end ]
  %count.023 = phi i64 [ %count.023.unr, %if.end.preheader.new ], [ %add.count.0.3, %if.end ]
  %arrayidx = getelementptr inbounds i64, i64* %pieces, i64 %i.024
  %3 = load i64, i64* %arrayidx, align 8, !tbaa !10
  %cmp1 = icmp eq i64 %3, %s
  %add = zext i1 %cmp1 to i64
  %add.count.0 = add nsw i64 %add, %count.023
  %add4 = add nuw nsw i64 %i.024, 1
  %arrayidx.1 = getelementptr inbounds i64, i64* %pieces, i64 %add4
  %4 = load i64, i64* %arrayidx.1, align 8, !tbaa !10
  %cmp1.1 = icmp eq i64 %4, %s
  %add.1 = zext i1 %cmp1.1 to i64
  %add.count.0.1 = add nsw i64 %add.1, %add.count.0
  %add4.1 = add nsw i64 %i.024, 2
  %arrayidx.2 = getelementptr inbounds i64, i64* %pieces, i64 %add4.1
  %5 = load i64, i64* %arrayidx.2, align 8, !tbaa !10
  %cmp1.2 = icmp eq i64 %5, %s
  %add.2 = zext i1 %cmp1.2 to i64
  %add.count.0.2 = add nsw i64 %add.2, %add.count.0.1
  %add4.2 = add nsw i64 %i.024, 3
  %arrayidx.3 = getelementptr inbounds i64, i64* %pieces, i64 %add4.2
  %6 = load i64, i64* %arrayidx.3, align 8, !tbaa !10
  %cmp1.3 = icmp eq i64 %6, %s
  %add.3 = zext i1 %cmp1.3 to i64
  %add.count.0.3 = add nsw i64 %add.3, %add.count.0.2
  %add4.3 = add nsw i64 %i.024, 4
  %exitcond.3 = icmp eq i64 %add4.3, %pieces_size
  br i1 %exitcond.3, label %blklab11.loopexit.unr-lcssa, label %if.end

blklab11.loopexit.unr-lcssa:                      ; preds = %if.end
  br label %blklab11.loopexit

blklab11.loopexit:                                ; preds = %if.end.prol.loopexit, %blklab11.loopexit.unr-lcssa
  %add.count.0.lcssa = phi i64 [ %add.count.0.lcssa.unr, %if.end.prol.loopexit ], [ %add.count.0.3, %blklab11.loopexit.unr-lcssa ]
  br label %blklab11

blklab11:                                         ; preds = %blklab11.loopexit, %entry
  %count.0.lcssa = phi i64 [ 0, %entry ], [ %add.count.0.lcssa, %blklab11.loopexit ]
  br i1 %pieces_dealloc, label %if.then5, label %if.end6

if.then5:                                         ; preds = %blklab11
  %7 = bitcast i64* %pieces to i8*
  tail call void @free(i8* %7) #6
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %blklab11
  ret i64 %count.0.lcssa
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #4 {
entry:
  %_9_size = alloca i64, align 8
  %_9_size_size = alloca i64, align 8
  %0 = bitcast i64* %_9_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #6
  store i64 0, i64* %_9_size, align 8, !tbaa !10
  %1 = bitcast i64* %_9_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #6
  store i64 0, i64* %_9_size_size, align 8, !tbaa !10
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_9_size, i64* nonnull %_9_size_size) #6
  %not.cmp = icmp eq i64** %call, null
  %2 = load i64*, i64** %call, align 8, !tbaa !9
  %call3 = call i64* @parseStringToInt(i64* %2) #6
  %not.cmp4 = icmp eq i64* %call3, null
  %3 = load i64, i64* %call3, align 8, !tbaa !10
  %cmp19325 = icmp sgt i64 %3, 0
  br i1 %cmp19325, label %if.end21.preheader, label %blklab14

if.end21.preheader:                               ; preds = %entry
  br label %if.end21

if.end21:                                         ; preds = %if.end21.preheader, %blklab17
  %repeat.0338 = phi i64 [ %add136, %blklab17 ], [ 0, %if.end21.preheader ]
  %_18_dealloc.0337 = phi i8 [ %_18_dealloc.3, %blklab17 ], [ 0, %if.end21.preheader ]
  %_18.0336 = phi i64* [ %_18.2, %blklab17 ], [ null, %if.end21.preheader ]
  %_16_dealloc.0335 = phi i8 [ %.320, %blklab17 ], [ 0, %if.end21.preheader ]
  %_16.0334 = phi i64* [ %call59, %blklab17 ], [ null, %if.end21.preheader ]
  %_14_dealloc.0333 = phi i8 [ %.318, %blklab17 ], [ 0, %if.end21.preheader ]
  %4 = phi i8* [ %call14.i356, %blklab17 ], [ undef, %if.end21.preheader ]
  %_14.0332 = phi %struct.Board* [ %27, %blklab17 ], [ undef, %if.end21.preheader ]
  %_13_dealloc.0331 = phi i8 [ %.316, %blklab17 ], [ 0, %if.end21.preheader ]
  %5 = phi i8* [ %call14.i, %blklab17 ], [ undef, %if.end21.preheader ]
  %_13.0330 = phi %struct.Board* [ %11, %blklab17 ], [ undef, %if.end21.preheader ]
  %b2_dealloc.0329 = phi i8 [ %b2_dealloc.2, %blklab17 ], [ 0, %if.end21.preheader ]
  %6 = phi i8* [ %41, %blklab17 ], [ undef, %if.end21.preheader ]
  %b2.0328 = phi %struct.Board* [ %b2.1, %blklab17 ], [ undef, %if.end21.preheader ]
  %b1_dealloc.0327 = phi i8 [ %b1_dealloc.2, %blklab17 ], [ 0, %if.end21.preheader ]
  %7 = phi i8* [ %40, %blklab17 ], [ undef, %if.end21.preheader ]
  %b1.0326 = phi %struct.Board* [ %b1.1, %blklab17 ], [ undef, %if.end21.preheader ]
  %tobool22 = icmp eq i8 %_13_dealloc.0331, 0
  br i1 %tobool22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end21
  %8 = bitcast %struct.Board* %_13.0330 to i8**
  %9 = load i8*, i8** %8, align 8, !tbaa !7
  call void @free(i8* %9) #6
  call void @free(i8* %5) #6
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %if.then23
  %call.i = call i64* @create1DArray_int64_t(i64 0, i64 9) #6
  %not.cmp.i = icmp eq i64* %call.i, null
  %10 = bitcast i64* %call.i to i8*
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 72, i32 8, i1 false) #6
  %call14.i = call noalias i8* @malloc(i64 24) #6
  %11 = bitcast i8* %call14.i to %struct.Board*
  %move.i = getelementptr inbounds i8, i8* %call14.i, i64 16
  %12 = bitcast i8* %move.i to i64*
  %pieces_size.i = getelementptr inbounds i8, i8* %call14.i, i64 8
  %13 = bitcast i8* %pieces_size.i to i64*
  %14 = bitcast i8* %pieces_size.i to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %14, align 8, !tbaa !10
  %call15.i = call i64* @copy1DArray_int64_t(i64* %call.i, i64 9) #6
  %pieces.i = bitcast i8* %call14.i to i64**
  store i64* %call15.i, i64** %pieces.i, align 8, !tbaa !7
  br i1 %not.cmp.i, label %_EmptyBoard_.exit, label %if.then24.i

if.then24.i:                                      ; preds = %if.end24
  call void @free(i8* %10) #6
  br label %_EmptyBoard_.exit

_EmptyBoard_.exit:                                ; preds = %if.end24, %if.then24.i
  %not.cmp26 = icmp ne i8* %call14.i, null
  %.316 = zext i1 %not.cmp26 to i8
  %15 = and i8 %b1_dealloc.0327, 1
  %tobool30 = icmp eq i8 %15, 0
  br i1 %tobool30, label %if.end32, label %if.then31

if.then31:                                        ; preds = %_EmptyBoard_.exit
  %16 = bitcast %struct.Board* %b1.0326 to i8**
  %17 = load i8*, i8** %16, align 8, !tbaa !7
  call void @free(i8* %17) #6
  call void @free(i8* %7) #6
  %.pre = load i64, i64* %13, align 8, !tbaa !1
  %.pre431 = load i64*, i64** %pieces.i, align 8, !tbaa !7
  %.pre432 = load i64, i64* %12, align 8, !tbaa !8
  br label %if.end32

if.end32:                                         ; preds = %_EmptyBoard_.exit, %if.then31
  %18 = phi i64 [ 0, %_EmptyBoard_.exit ], [ %.pre432, %if.then31 ]
  %19 = phi i64* [ %call15.i, %_EmptyBoard_.exit ], [ %.pre431, %if.then31 ]
  %20 = phi i64 [ 9, %_EmptyBoard_.exit ], [ %.pre, %if.then31 ]
  %call.i350 = call noalias i8* @malloc(i64 24) #6
  %21 = bitcast i8* %call.i350 to %struct.Board*
  %pieces_size1.i = getelementptr inbounds i8, i8* %call.i350, i64 8
  %22 = bitcast i8* %pieces_size1.i to i64*
  store i64 %20, i64* %22, align 8, !tbaa !1
  %call3.i = call i64* @copy1DArray_int64_t(i64* %19, i64 %20) #6
  %pieces4.i = bitcast i8* %call.i350 to i64**
  store i64* %call3.i, i64** %pieces4.i, align 8, !tbaa !7
  %move5.i = getelementptr inbounds i8, i8* %call.i350, i64 16
  %23 = bitcast i8* %move5.i to i64*
  store i64 %18, i64* %23, align 8, !tbaa !8
  %not.cmp34 = icmp ne i8* %call.i350, null
  %.317 = zext i1 %not.cmp34 to i8
  %tobool38 = icmp eq i8 %_14_dealloc.0333, 0
  br i1 %tobool38, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end32
  %24 = bitcast %struct.Board* %_14.0332 to i8**
  %25 = load i8*, i8** %24, align 8, !tbaa !7
  call void @free(i8* %25) #6
  call void @free(i8* %4) #6
  br label %if.end40

if.end40:                                         ; preds = %if.end32, %if.then39
  %call.i354 = call i64* @create1DArray_int64_t(i64 0, i64 9) #6
  %not.cmp.i355 = icmp eq i64* %call.i354, null
  %26 = bitcast i64* %call.i354 to i8*
  call void @llvm.memset.p0i8.i64(i8* %26, i8 0, i64 72, i32 8, i1 false) #6
  %call14.i356 = call noalias i8* @malloc(i64 24) #6
  %27 = bitcast i8* %call14.i356 to %struct.Board*
  %move.i357 = getelementptr inbounds i8, i8* %call14.i356, i64 16
  %28 = bitcast i8* %move.i357 to i64*
  %pieces_size.i358 = getelementptr inbounds i8, i8* %call14.i356, i64 8
  %29 = bitcast i8* %pieces_size.i358 to i64*
  %30 = bitcast i8* %pieces_size.i358 to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %30, align 8, !tbaa !10
  %call15.i359 = call i64* @copy1DArray_int64_t(i64* %call.i354, i64 9) #6
  %pieces.i360 = bitcast i8* %call14.i356 to i64**
  store i64* %call15.i359, i64** %pieces.i360, align 8, !tbaa !7
  br i1 %not.cmp.i355, label %_EmptyBoard_.exit362, label %if.then24.i361

if.then24.i361:                                   ; preds = %if.end40
  call void @free(i8* %26) #6
  br label %_EmptyBoard_.exit362

_EmptyBoard_.exit362:                             ; preds = %if.end40, %if.then24.i361
  %not.cmp42 = icmp ne i8* %call14.i356, null
  %.318 = zext i1 %not.cmp42 to i8
  %31 = and i8 %b2_dealloc.0329, 1
  %tobool46 = icmp eq i8 %31, 0
  br i1 %tobool46, label %if.end48, label %if.then47

if.then47:                                        ; preds = %_EmptyBoard_.exit362
  %32 = bitcast %struct.Board* %b2.0328 to i8**
  %33 = load i8*, i8** %32, align 8, !tbaa !7
  call void @free(i8* %33) #6
  call void @free(i8* %6) #6
  %.pre433 = load i64, i64* %29, align 8, !tbaa !1
  %.pre434 = load i64*, i64** %pieces.i360, align 8, !tbaa !7
  %.pre435 = load i64, i64* %28, align 8, !tbaa !8
  br label %if.end48

if.end48:                                         ; preds = %_EmptyBoard_.exit362, %if.then47
  %34 = phi i64 [ 0, %_EmptyBoard_.exit362 ], [ %.pre435, %if.then47 ]
  %35 = phi i64* [ %call15.i359, %_EmptyBoard_.exit362 ], [ %.pre434, %if.then47 ]
  %36 = phi i64 [ 9, %_EmptyBoard_.exit362 ], [ %.pre433, %if.then47 ]
  %call.i363 = call noalias i8* @malloc(i64 24) #6
  %37 = bitcast i8* %call.i363 to %struct.Board*
  %pieces_size1.i365 = getelementptr inbounds i8, i8* %call.i363, i64 8
  %38 = bitcast i8* %pieces_size1.i365 to i64*
  store i64 %36, i64* %38, align 8, !tbaa !1
  %call3.i367 = call i64* @copy1DArray_int64_t(i64* %35, i64 %36) #6
  %pieces4.i368 = bitcast i8* %call.i363 to i64**
  store i64* %call3.i367, i64** %pieces4.i368, align 8, !tbaa !7
  %move5.i370 = getelementptr inbounds i8, i8* %call.i363, i64 16
  %39 = bitcast i8* %move5.i370 to i64*
  store i64 %34, i64* %39, align 8, !tbaa !8
  %not.cmp50 = icmp ne i8* %call.i363, null
  %.319 = zext i1 %not.cmp50 to i8
  br label %while.cond54

while.cond54:                                     ; preds = %blklab20, %if.end48
  %40 = phi i8* [ %call.i350, %if.end48 ], [ %82, %blklab20 ]
  %b1.1 = phi %struct.Board* [ %21, %if.end48 ], [ %b1.2, %blklab20 ]
  %b1_dealloc.2 = phi i8 [ %.317, %if.end48 ], [ %b1_dealloc.4, %blklab20 ]
  %41 = phi i8* [ %call.i363, %if.end48 ], [ %83, %blklab20 ]
  %b2.1 = phi %struct.Board* [ %37, %if.end48 ], [ %b2.2, %blklab20 ]
  %b2_dealloc.2 = phi i8 [ %.319, %if.end48 ], [ %b2_dealloc.4, %blklab20 ]
  %i.0 = phi i64 [ 0, %if.end48 ], [ %add135, %blklab20 ]
  %_16.1 = phi i64* [ %_16.0334, %if.end48 ], [ %call59, %blklab20 ]
  %_16_dealloc.1 = phi i8 [ %_16_dealloc.0335, %if.end48 ], [ %.320, %blklab20 ]
  %_18.1 = phi i64* [ %_18.0336, %if.end48 ], [ %call79, %blklab20 ]
  %_18_dealloc.1 = phi i8 [ %_18_dealloc.0337, %if.end48 ], [ %.321, %blklab20 ]
  %42 = and i8 %_16_dealloc.1, 1
  %tobool56 = icmp eq i8 %42, 0
  br i1 %tobool56, label %if.end58, label %if.then57

if.then57:                                        ; preds = %while.cond54
  %43 = bitcast i64* %_16.1 to i8*
  call void @free(i8* %43) #6
  br label %if.end58

if.end58:                                         ; preds = %while.cond54, %if.then57
  %call59 = call i64* @create1DArray_int64_t(i64 0, i64 9) #6
  %44 = bitcast i64* %call59 to <2 x i64>*
  store <2 x i64> <i64 0, i64 1>, <2 x i64>* %44, align 8, !tbaa !10
  %arrayidx62 = getelementptr inbounds i64, i64* %call59, i64 2
  %45 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 2, i64 3>, <2 x i64>* %45, align 8, !tbaa !10
  %arrayidx64 = getelementptr inbounds i64, i64* %call59, i64 4
  %46 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 4, i64 5>, <2 x i64>* %46, align 8, !tbaa !10
  %arrayidx66 = getelementptr inbounds i64, i64* %call59, i64 6
  %47 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 6, i64 7>, <2 x i64>* %47, align 8, !tbaa !10
  %arrayidx68 = getelementptr inbounds i64, i64* %call59, i64 8
  store i64 8, i64* %arrayidx68, align 8, !tbaa !10
  %not.cmp69 = icmp ne i64* %call59, null
  %.320 = zext i1 %not.cmp69 to i8
  %cmp73 = icmp sgt i64 %i.0, 8
  br i1 %cmp73, label %blklab17, label %if.end75

if.end75:                                         ; preds = %if.end58
  %48 = and i8 %_18_dealloc.1, 1
  %tobool76 = icmp eq i8 %48, 0
  br i1 %tobool76, label %if.end78, label %if.then77

if.then77:                                        ; preds = %if.end75
  %49 = bitcast i64* %_18.1 to i8*
  call void @free(i8* %49) #6
  br label %if.end78

if.end78:                                         ; preds = %if.end75, %if.then77
  %call79 = call i64* @create1DArray_int64_t(i64 0, i64 9) #6
  %50 = bitcast i64* %call79 to <2 x i64>*
  store <2 x i64> <i64 0, i64 1>, <2 x i64>* %50, align 8, !tbaa !10
  %arrayidx82 = getelementptr inbounds i64, i64* %call79, i64 2
  %51 = bitcast i64* %arrayidx82 to <2 x i64>*
  store <2 x i64> <i64 2, i64 3>, <2 x i64>* %51, align 8, !tbaa !10
  %arrayidx84 = getelementptr inbounds i64, i64* %call79, i64 4
  %52 = bitcast i64* %arrayidx84 to <2 x i64>*
  store <2 x i64> <i64 4, i64 5>, <2 x i64>* %52, align 8, !tbaa !10
  %arrayidx86 = getelementptr inbounds i64, i64* %call79, i64 6
  %53 = bitcast i64* %arrayidx86 to <2 x i64>*
  store <2 x i64> <i64 6, i64 7>, <2 x i64>* %53, align 8, !tbaa !10
  %arrayidx88 = getelementptr inbounds i64, i64* %call79, i64 8
  store i64 8, i64* %arrayidx88, align 8, !tbaa !10
  %not.cmp89 = icmp ne i64* %call79, null
  %.321 = zext i1 %not.cmp89 to i8
  %arrayidx93 = getelementptr inbounds i64, i64* %call79, i64 %i.0
  %54 = load i64, i64* %arrayidx93, align 8, !tbaa !10
  %55 = icmp ult i64 %54, 10
  br i1 %55, label %blklab19, label %blklab17

blklab19:                                         ; preds = %if.end78
  %cmp100 = icmp eq %struct.Board* %b1.1, null
  br i1 %cmp100, label %blklab22, label %if.end102

if.end102:                                        ; preds = %blklab19
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %b1.1, i64 0, i32 0
  %56 = load i64*, i64** %pieces, align 8, !tbaa !7
  %arrayidx103 = getelementptr inbounds i64, i64* %56, i64 %54
  store i64 1, i64* %arrayidx103, align 8, !tbaa !10
  %move = getelementptr inbounds %struct.Board, %struct.Board* %b1.1, i64 0, i32 2
  %57 = load i64, i64* %move, align 8, !tbaa !8
  %add = add nsw i64 %57, 1
  store i64 %add, i64* %move, align 8, !tbaa !8
  %58 = and i8 %b2_dealloc.2, 1
  %tobool105 = icmp eq i8 %58, 0
  br i1 %tobool105, label %if.end107, label %if.then106

if.then106:                                       ; preds = %if.end102
  %59 = bitcast %struct.Board* %b2.1 to i8**
  %60 = load i8*, i8** %59, align 8, !tbaa !7
  call void @free(i8* %60) #6
  call void @free(i8* %41) #6
  br label %if.end107

if.end107:                                        ; preds = %if.end102, %if.then106
  %call.i371 = call noalias i8* @malloc(i64 24) #6
  %61 = bitcast i8* %call.i371 to %struct.Board*
  %pieces_size.i372 = getelementptr inbounds %struct.Board, %struct.Board* %b1.1, i64 0, i32 1
  %62 = load i64, i64* %pieces_size.i372, align 8, !tbaa !1
  %pieces_size1.i373 = getelementptr inbounds i8, i8* %call.i371, i64 8
  %63 = bitcast i8* %pieces_size1.i373 to i64*
  store i64 %62, i64* %63, align 8, !tbaa !1
  %64 = load i64*, i64** %pieces, align 8, !tbaa !7
  %call3.i375 = call i64* @copy1DArray_int64_t(i64* %64, i64 %62) #6
  %pieces4.i376 = bitcast i8* %call.i371 to i64**
  store i64* %call3.i375, i64** %pieces4.i376, align 8, !tbaa !7
  %65 = load i64, i64* %move, align 8, !tbaa !8
  %move5.i378 = getelementptr inbounds i8, i8* %call.i371, i64 16
  %66 = bitcast i8* %move5.i378 to i64*
  store i64 %65, i64* %66, align 8, !tbaa !8
  %not.cmp109 = icmp ne i8* %call.i371, null
  %.322 = zext i1 %not.cmp109 to i8
  %67 = and i8 %b1_dealloc.2, 1
  %tobool113 = icmp eq i8 %67, 0
  br i1 %tobool113, label %blklab20, label %if.then114

if.then114:                                       ; preds = %if.end107
  %68 = bitcast %struct.Board* %b1.1 to i8**
  %69 = load i8*, i8** %68, align 8, !tbaa !7
  call void @free(i8* %69) #6
  call void @free(i8* %40) #6
  br label %blklab20

blklab22:                                         ; preds = %blklab19
  %cmp116 = icmp eq %struct.Board* %b2.1, null
  br i1 %cmp116, label %blklab20, label %if.end118

if.end118:                                        ; preds = %blklab22
  %pieces119 = getelementptr inbounds %struct.Board, %struct.Board* %b2.1, i64 0, i32 0
  %70 = load i64*, i64** %pieces119, align 8, !tbaa !7
  %arrayidx120 = getelementptr inbounds i64, i64* %70, i64 %54
  store i64 2, i64* %arrayidx120, align 8, !tbaa !10
  %move121 = getelementptr inbounds %struct.Board, %struct.Board* %b2.1, i64 0, i32 2
  %71 = load i64, i64* %move121, align 8, !tbaa !8
  %add122 = add nsw i64 %71, 1
  store i64 %add122, i64* %move121, align 8, !tbaa !8
  %72 = and i8 %b1_dealloc.2, 1
  %tobool124 = icmp eq i8 %72, 0
  br i1 %tobool124, label %if.end126, label %if.then125

if.then125:                                       ; preds = %if.end118
  call void @free(i8* %40) #6
  br label %if.end126

if.end126:                                        ; preds = %if.end118, %if.then125
  %call.i379 = call noalias i8* @malloc(i64 24) #6
  %73 = bitcast i8* %call.i379 to %struct.Board*
  %pieces_size.i380 = getelementptr inbounds %struct.Board, %struct.Board* %b2.1, i64 0, i32 1
  %74 = load i64, i64* %pieces_size.i380, align 8, !tbaa !1
  %pieces_size1.i381 = getelementptr inbounds i8, i8* %call.i379, i64 8
  %75 = bitcast i8* %pieces_size1.i381 to i64*
  store i64 %74, i64* %75, align 8, !tbaa !1
  %76 = load i64*, i64** %pieces119, align 8, !tbaa !7
  %call3.i383 = call i64* @copy1DArray_int64_t(i64* %76, i64 %74) #6
  %pieces4.i384 = bitcast i8* %call.i379 to i64**
  store i64* %call3.i383, i64** %pieces4.i384, align 8, !tbaa !7
  %77 = load i64, i64* %move121, align 8, !tbaa !8
  %move5.i386 = getelementptr inbounds i8, i8* %call.i379, i64 16
  %78 = bitcast i8* %move5.i386 to i64*
  store i64 %77, i64* %78, align 8, !tbaa !8
  %not.cmp128 = icmp ne i8* %call.i379, null
  %.323 = zext i1 %not.cmp128 to i8
  %79 = and i8 %b2_dealloc.2, 1
  %tobool132 = icmp eq i8 %79, 0
  br i1 %tobool132, label %blklab20, label %if.then133

if.then133:                                       ; preds = %if.end126
  %80 = bitcast %struct.Board* %b2.1 to i8**
  %81 = load i8*, i8** %80, align 8, !tbaa !7
  call void @free(i8* %81) #6
  call void @free(i8* %41) #6
  br label %blklab20

blklab20:                                         ; preds = %if.then133, %if.end126, %if.then114, %if.end107, %blklab22
  %82 = phi i8* [ null, %blklab22 ], [ null, %if.end107 ], [ null, %if.then114 ], [ %call.i379, %if.end126 ], [ %call.i379, %if.then133 ]
  %b1.2 = phi %struct.Board* [ null, %blklab22 ], [ null, %if.end107 ], [ null, %if.then114 ], [ %73, %if.end126 ], [ %73, %if.then133 ]
  %b1_dealloc.4 = phi i8 [ %b1_dealloc.2, %blklab22 ], [ 0, %if.end107 ], [ 0, %if.then114 ], [ %.323, %if.end126 ], [ %.323, %if.then133 ]
  %83 = phi i8* [ null, %blklab22 ], [ %call.i371, %if.end107 ], [ %call.i371, %if.then114 ], [ null, %if.end126 ], [ null, %if.then133 ]
  %b2.2 = phi %struct.Board* [ null, %blklab22 ], [ %61, %if.end107 ], [ %61, %if.then114 ], [ null, %if.end126 ], [ null, %if.then133 ]
  %b2_dealloc.4 = phi i8 [ %b2_dealloc.2, %blklab22 ], [ %.322, %if.end107 ], [ %.322, %if.then114 ], [ 0, %if.end126 ], [ 0, %if.then133 ]
  %add135 = add nuw nsw i64 %i.0, 1
  br label %while.cond54

blklab17:                                         ; preds = %if.end78, %if.end58
  %_18.2 = phi i64* [ %_18.1, %if.end58 ], [ %call79, %if.end78 ]
  %_18_dealloc.3 = phi i8 [ %_18_dealloc.1, %if.end58 ], [ %.321, %if.end78 ]
  %add136 = add nuw nsw i64 %repeat.0338, 1
  %exitcond = icmp eq i64 %add136, %3
  br i1 %exitcond, label %blklab14.loopexit, label %if.end21

blklab14.loopexit:                                ; preds = %blklab17
  %phitmp436 = bitcast i8* %call14.i to i8**
  %phitmp437 = bitcast i8* %call14.i356 to i8**
  %phitmp438 = bitcast i64* %call59 to i8*
  br label %blklab14

blklab14:                                         ; preds = %blklab14.loopexit, %entry
  %84 = phi i8* [ undef, %entry ], [ %40, %blklab14.loopexit ]
  %b1.0.lcssa = phi %struct.Board* [ undef, %entry ], [ %b1.1, %blklab14.loopexit ]
  %b1_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %b1_dealloc.2, %blklab14.loopexit ]
  %85 = phi i8* [ undef, %entry ], [ %41, %blklab14.loopexit ]
  %b2.0.lcssa = phi %struct.Board* [ undef, %entry ], [ %b2.1, %blklab14.loopexit ]
  %b2_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %b2_dealloc.2, %blklab14.loopexit ]
  %86 = phi i8* [ undef, %entry ], [ %call14.i, %blklab14.loopexit ]
  %_13.0.lcssa = phi i8** [ undef, %entry ], [ %phitmp436, %blklab14.loopexit ]
  %_13_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %.316, %blklab14.loopexit ]
  %87 = phi i8* [ undef, %entry ], [ %call14.i356, %blklab14.loopexit ]
  %_14.0.lcssa = phi i8** [ undef, %entry ], [ %phitmp437, %blklab14.loopexit ]
  %_14_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %.318, %blklab14.loopexit ]
  %_16.0.lcssa = phi i8* [ null, %entry ], [ %phitmp438, %blklab14.loopexit ]
  %_16_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %.320, %blklab14.loopexit ]
  %_18.0.lcssa = phi i64* [ null, %entry ], [ %_18.2, %blklab14.loopexit ]
  %_18_dealloc.0.lcssa = phi i8 [ 0, %entry ], [ %_18_dealloc.3, %blklab14.loopexit ]
  %call140 = call i64* @create1DArray_int64_t(i64 0, i64 27) #6
  %88 = bitcast i64* %call140 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %88, align 8, !tbaa !10
  %arrayidx143 = getelementptr inbounds i64, i64* %call140, i64 2
  %89 = bitcast i64* %arrayidx143 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %89, align 8, !tbaa !10
  %arrayidx145 = getelementptr inbounds i64, i64* %call140, i64 4
  %90 = bitcast i64* %arrayidx145 to <2 x i64>*
  store <2 x i64> <i64 32, i64 110>, <2 x i64>* %90, align 8, !tbaa !10
  %arrayidx147 = getelementptr inbounds i64, i64* %call140, i64 6
  %91 = bitcast i64* %arrayidx147 to <2 x i64>*
  store <2 x i64> <i64 101, i64 119>, <2 x i64>* %91, align 8, !tbaa !10
  %arrayidx149 = getelementptr inbounds i64, i64* %call140, i64 8
  %92 = bitcast i64* %arrayidx149 to <2 x i64>*
  store <2 x i64> <i64 84, i64 105>, <2 x i64>* %92, align 8, !tbaa !10
  %arrayidx151 = getelementptr inbounds i64, i64* %call140, i64 10
  %93 = bitcast i64* %arrayidx151 to <2 x i64>*
  store <2 x i64> <i64 99, i64 84>, <2 x i64>* %93, align 8, !tbaa !10
  %arrayidx153 = getelementptr inbounds i64, i64* %call140, i64 12
  %94 = bitcast i64* %arrayidx153 to <2 x i64>*
  store <2 x i64> <i64 97, i64 99>, <2 x i64>* %94, align 8, !tbaa !10
  %arrayidx155 = getelementptr inbounds i64, i64* %call140, i64 14
  %95 = bitcast i64* %arrayidx155 to <2 x i64>*
  store <2 x i64> <i64 84, i64 111>, <2 x i64>* %95, align 8, !tbaa !10
  %arrayidx157 = getelementptr inbounds i64, i64* %call140, i64 16
  %96 = bitcast i64* %arrayidx157 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %96, align 8, !tbaa !10
  %arrayidx159 = getelementptr inbounds i64, i64* %call140, i64 18
  %97 = bitcast i64* %arrayidx159 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %97, align 8, !tbaa !10
  %arrayidx161 = getelementptr inbounds i64, i64* %call140, i64 20
  %98 = bitcast i64* %arrayidx161 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %98, align 8, !tbaa !10
  %arrayidx163 = getelementptr inbounds i64, i64* %call140, i64 22
  %99 = bitcast i64* %arrayidx163 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %99, align 8, !tbaa !10
  %arrayidx165 = getelementptr inbounds i64, i64* %call140, i64 24
  %100 = bitcast i64* %arrayidx165 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %100, align 8, !tbaa !10
  %arrayidx167 = getelementptr inbounds i64, i64* %call140, i64 26
  store i64 101, i64* %arrayidx167, align 8, !tbaa !10
  %not.cmp168 = icmp eq i64* %call140, null
  call void @println_s(i64* %call140, i64 27) #6
  %phitmp = bitcast i64* %call140 to i8*
  %101 = and i8 %b1_dealloc.0.lcssa, 1
  %tobool175 = icmp eq i8 %101, 0
  br i1 %tobool175, label %if.end177, label %if.then176

if.then176:                                       ; preds = %blklab14
  %102 = bitcast %struct.Board* %b1.0.lcssa to i8**
  %103 = load i8*, i8** %102, align 8, !tbaa !7
  call void @free(i8* %103) #6
  call void @free(i8* %84) #6
  br label %if.end177

if.end177:                                        ; preds = %blklab14, %if.then176
  %104 = and i8 %b2_dealloc.0.lcssa, 1
  %tobool178 = icmp eq i8 %104, 0
  br i1 %tobool178, label %if.end180, label %if.then179

if.then179:                                       ; preds = %if.end177
  %105 = bitcast %struct.Board* %b2.0.lcssa to i8**
  %106 = load i8*, i8** %105, align 8, !tbaa !7
  call void @free(i8* %106) #6
  call void @free(i8* %85) #6
  br label %if.end180

if.end180:                                        ; preds = %if.end177, %if.then179
  br i1 %not.cmp4, label %if.end183, label %if.then182

if.then182:                                       ; preds = %if.end180
  %107 = bitcast i64* %call3 to i8*
  call void @free(i8* %107) #6
  br label %if.end183

if.end183:                                        ; preds = %if.end180, %if.then182
  br i1 %not.cmp, label %if.end189, label %if.then185

if.then185:                                       ; preds = %if.end183
  %108 = load i64, i64* %_9_size, align 8, !tbaa !10
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %108) #6
  br label %if.end189

if.end189:                                        ; preds = %if.end183, %if.then185
  %tobool190 = icmp eq i8 %_13_dealloc.0.lcssa, 0
  br i1 %tobool190, label %if.end192, label %if.then191

if.then191:                                       ; preds = %if.end189
  %109 = load i8*, i8** %_13.0.lcssa, align 8, !tbaa !7
  call void @free(i8* %109) #6
  call void @free(i8* %86) #6
  br label %if.end192

if.end192:                                        ; preds = %if.end189, %if.then191
  %tobool193 = icmp eq i8 %_14_dealloc.0.lcssa, 0
  br i1 %tobool193, label %if.end195, label %if.then194

if.then194:                                       ; preds = %if.end192
  %110 = load i8*, i8** %_14.0.lcssa, align 8, !tbaa !7
  call void @free(i8* %110) #6
  call void @free(i8* %87) #6
  br label %if.end195

if.end195:                                        ; preds = %if.end192, %if.then194
  %tobool196 = icmp eq i8 %_16_dealloc.0.lcssa, 0
  br i1 %tobool196, label %if.end198, label %if.then197

if.then197:                                       ; preds = %if.end195
  call void @free(i8* %_16.0.lcssa) #6
  br label %if.end198

if.end198:                                        ; preds = %if.end195, %if.then197
  %111 = and i8 %_18_dealloc.0.lcssa, 1
  %tobool199 = icmp eq i8 %111, 0
  br i1 %tobool199, label %if.end201, label %if.then200

if.then200:                                       ; preds = %if.end198
  %112 = bitcast i64* %_18.0.lcssa to i8*
  call void @free(i8* %112) #6
  br label %if.end201

if.end201:                                        ; preds = %if.end198, %if.then200
  br i1 %not.cmp168, label %if.end204, label %if.then203

if.then203:                                       ; preds = %if.end201
  call void @free(i8* %phitmp) #6
  br label %if.end204

if.end204:                                        ; preds = %if.end201, %if.then203
  call void @exit(i32 0) #7
  unreachable
}

declare void @free2DArray_int64_t(i64**, i64) local_unnamed_addr #3

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

declare i32 @putchar(i32) local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"}
!1 = !{!2, !6, i64 8}
!2 = !{!"", !3, i64 0, !6, i64 8, !6, i64 16}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!"long", !4, i64 0}
!7 = !{!2, !3, i64 0}
!8 = !{!2, !6, i64 16}
!9 = !{!3, !3, i64 0}
!10 = !{!6, !6, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
