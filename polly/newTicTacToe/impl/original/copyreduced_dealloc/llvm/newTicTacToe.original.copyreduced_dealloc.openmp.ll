; ModuleID = 'newTicTacToe_original.c'
source_filename = "newTicTacToe_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Board = type { i64*, i64, i64 }

@.str.1 = private unnamed_addr constant [9 x i8] c" pieces:\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c" move:\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.Board* @copy_Board(%struct.Board* nocapture readonly %_Board) local_unnamed_addr #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 24) #7
  %0 = bitcast i8* %call to %struct.Board*
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %_Board, i64 0, i32 1
  %1 = load i64, i64* %pieces_size, align 8, !tbaa !1
  %pieces_size1 = getelementptr inbounds i8, i8* %call, i64 8
  %2 = bitcast i8* %pieces_size1 to i64*
  store i64 %1, i64* %2, align 8, !tbaa !1
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %_Board, i64 0, i32 0
  %3 = load i64*, i64** %pieces, align 8, !tbaa !7
  %call3 = tail call i64* @copy(i64* %3, i64 %1) #7
  %pieces4 = bitcast i8* %call to i64**
  store i64* %call3, i64** %pieces4, align 8, !tbaa !7
  %move = getelementptr inbounds %struct.Board, %struct.Board* %_Board, i64 0, i32 2
  %4 = load i64, i64* %move, align 8, !tbaa !8
  %move5 = getelementptr inbounds i8, i8* %call, i64 16
  %5 = bitcast i8* %move5 to i64*
  store i64 %4, i64* %5, align 8, !tbaa !8
  ret %struct.Board* %0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #1

declare i64* @copy(i64*, i64) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define noalias %struct.Board** @copy_array_Board(%struct.Board** nocapture readonly %_Board, i64 %_Board_size) local_unnamed_addr #0 {
entry:
  %mul = shl i64 %_Board_size, 3
  %call = tail call noalias i8* @malloc(i64 %mul) #7
  %0 = bitcast i8* %call to %struct.Board**
  %cmp12 = icmp sgt i64 %_Board_size, 0
  br i1 %cmp12, label %for.body.preheader, label %for.cond.cleanup

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
  %call.i = tail call noalias i8* @malloc(i64 24) #7
  %pieces_size.i = getelementptr inbounds %struct.Board, %struct.Board* %1, i64 0, i32 1
  %2 = load i64, i64* %pieces_size.i, align 8, !tbaa !1
  %pieces_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %3 = bitcast i8* %pieces_size1.i to i64*
  store i64 %2, i64* %3, align 8, !tbaa !1
  %pieces.i = getelementptr inbounds %struct.Board, %struct.Board* %1, i64 0, i32 0
  %4 = load i64*, i64** %pieces.i, align 8, !tbaa !7
  %call3.i = tail call i64* @copy(i64* %4, i64 %2) #7
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
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %_Board_size
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body
}

; Function Attrs: nounwind uwtable
define void @free_Board(%struct.Board* nocapture %board) local_unnamed_addr #0 {
entry:
  %0 = bitcast %struct.Board* %board to i8**
  %1 = load i8*, i8** %0, align 8, !tbaa !7
  tail call void @free(i8* %1) #7
  %2 = bitcast %struct.Board* %board to i8*
  tail call void @free(i8* %2) #7
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define void @printf_Board(%struct.Board* nocapture readonly %board) local_unnamed_addr #0 {
entry:
  %putchar = tail call i32 @putchar(i32 123) #7
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0))
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %board, i64 0, i32 0
  %0 = load i64*, i64** %pieces, align 8, !tbaa !7
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %board, i64 0, i32 1
  %1 = load i64, i64* %pieces_size, align 8, !tbaa !1
  tail call void @printf1DArray(i64* %0, i64 %1) #7
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0))
  %move = getelementptr inbounds %struct.Board, %struct.Board* %board, i64 0, i32 2
  %2 = load i64, i64* %move, align 8, !tbaa !8
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %2)
  %putchar7 = tail call i32 @putchar(i32 125) #7
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

declare void @printf1DArray(i64*, i64) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define noalias %struct.Board* @EmptyBoard() local_unnamed_addr #0 {
entry:
  %call = tail call i64* @create1DArray(i32 0, i32 9) #7
  %0 = bitcast i64* %call to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 72, i32 8, i1 false)
  %call12 = tail call noalias i8* @malloc(i64 24) #7
  %1 = bitcast i8* %call12 to %struct.Board*
  %pieces_size = getelementptr inbounds i8, i8* %call12, i64 8
  %2 = bitcast i8* %pieces_size to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %2, align 8, !tbaa !10
  %pieces = bitcast i8* %call12 to i64**
  store i64* %call, i64** %pieces, align 8, !tbaa !7
  ret %struct.Board* %1
}

declare i64* @create1DArray(i32, i32) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define i64 @countOf(i64* nocapture %pieces, i64 %pieces_size, i1 zeroext %pieces_dealloc, i64 %s) local_unnamed_addr #0 {
entry:
  %cmp22 = icmp sgt i64 %pieces_size, 0
  br i1 %cmp22, label %if.end.preheader, label %blklab11

if.end.preheader:                                 ; preds = %entry
  %0 = add i64 %pieces_size, -1
  %xtraiter = and i64 %pieces_size, 3
  %1 = icmp ult i64 %0, 3
  br i1 %1, label %blklab11.loopexit.unr-lcssa, label %if.end.preheader.new

if.end.preheader.new:                             ; preds = %if.end.preheader
  %unroll_iter = sub i64 %pieces_size, %xtraiter
  br label %if.end

if.end:                                           ; preds = %if.end, %if.end.preheader.new
  %i.024 = phi i64 [ 0, %if.end.preheader.new ], [ %add4.3, %if.end ]
  %count.023 = phi i64 [ 0, %if.end.preheader.new ], [ %add.count.0.3, %if.end ]
  %niter = phi i64 [ %unroll_iter, %if.end.preheader.new ], [ %niter.nsub.3, %if.end ]
  %arrayidx = getelementptr inbounds i64, i64* %pieces, i64 %i.024
  %2 = load i64, i64* %arrayidx, align 8, !tbaa !10
  %cmp1 = icmp eq i64 %2, %s
  %add = zext i1 %cmp1 to i64
  %add.count.0 = add nsw i64 %add, %count.023
  %add4 = or i64 %i.024, 1
  %arrayidx.1 = getelementptr inbounds i64, i64* %pieces, i64 %add4
  %3 = load i64, i64* %arrayidx.1, align 8, !tbaa !10
  %cmp1.1 = icmp eq i64 %3, %s
  %add.1 = zext i1 %cmp1.1 to i64
  %add.count.0.1 = add nsw i64 %add.1, %add.count.0
  %add4.1 = or i64 %i.024, 2
  %arrayidx.2 = getelementptr inbounds i64, i64* %pieces, i64 %add4.1
  %4 = load i64, i64* %arrayidx.2, align 8, !tbaa !10
  %cmp1.2 = icmp eq i64 %4, %s
  %add.2 = zext i1 %cmp1.2 to i64
  %add.count.0.2 = add nsw i64 %add.2, %add.count.0.1
  %add4.2 = or i64 %i.024, 3
  %arrayidx.3 = getelementptr inbounds i64, i64* %pieces, i64 %add4.2
  %5 = load i64, i64* %arrayidx.3, align 8, !tbaa !10
  %cmp1.3 = icmp eq i64 %5, %s
  %add.3 = zext i1 %cmp1.3 to i64
  %add.count.0.3 = add nsw i64 %add.3, %add.count.0.2
  %add4.3 = add nsw i64 %i.024, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %blklab11.loopexit.unr-lcssa.loopexit, label %if.end

blklab11.loopexit.unr-lcssa.loopexit:             ; preds = %if.end
  br label %blklab11.loopexit.unr-lcssa

blklab11.loopexit.unr-lcssa:                      ; preds = %blklab11.loopexit.unr-lcssa.loopexit, %if.end.preheader
  %add.count.0.lcssa.ph = phi i64 [ undef, %if.end.preheader ], [ %add.count.0.3, %blklab11.loopexit.unr-lcssa.loopexit ]
  %i.024.unr = phi i64 [ 0, %if.end.preheader ], [ %add4.3, %blklab11.loopexit.unr-lcssa.loopexit ]
  %count.023.unr = phi i64 [ 0, %if.end.preheader ], [ %add.count.0.3, %blklab11.loopexit.unr-lcssa.loopexit ]
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %blklab11.loopexit, label %if.end.epil.preheader

if.end.epil.preheader:                            ; preds = %blklab11.loopexit.unr-lcssa
  br label %if.end.epil

if.end.epil:                                      ; preds = %if.end.epil, %if.end.epil.preheader
  %i.024.epil = phi i64 [ %add4.epil, %if.end.epil ], [ %i.024.unr, %if.end.epil.preheader ]
  %count.023.epil = phi i64 [ %add.count.0.epil, %if.end.epil ], [ %count.023.unr, %if.end.epil.preheader ]
  %epil.iter = phi i64 [ %epil.iter.sub, %if.end.epil ], [ %xtraiter, %if.end.epil.preheader ]
  %arrayidx.epil = getelementptr inbounds i64, i64* %pieces, i64 %i.024.epil
  %6 = load i64, i64* %arrayidx.epil, align 8, !tbaa !10
  %cmp1.epil = icmp eq i64 %6, %s
  %add.epil = zext i1 %cmp1.epil to i64
  %add.count.0.epil = add nsw i64 %add.epil, %count.023.epil
  %add4.epil = add nuw nsw i64 %i.024.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %blklab11.loopexit.epilog-lcssa, label %if.end.epil, !llvm.loop !11

blklab11.loopexit.epilog-lcssa:                   ; preds = %if.end.epil
  br label %blklab11.loopexit

blklab11.loopexit:                                ; preds = %blklab11.loopexit.unr-lcssa, %blklab11.loopexit.epilog-lcssa
  %add.count.0.lcssa = phi i64 [ %add.count.0.lcssa.ph, %blklab11.loopexit.unr-lcssa ], [ %add.count.0.epil, %blklab11.loopexit.epilog-lcssa ]
  br label %blklab11

blklab11:                                         ; preds = %blklab11.loopexit, %entry
  %count.0.lcssa = phi i64 [ 0, %entry ], [ %add.count.0.lcssa, %blklab11.loopexit ]
  br i1 %pieces_dealloc, label %if.then5, label %if.end6

if.then5:                                         ; preds = %blklab11
  %7 = bitcast i64* %pieces to i8*
  tail call void @free(i8* %7) #7
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %blklab11
  ret i64 %count.0.lcssa
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !9
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end167.thread, label %if.end8

if.end167.thread:                                 ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #7
  br label %if.end170

if.end8:                                          ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !10
  %cmp9275 = icmp sgt i64 %1, 0
  br i1 %cmp9275, label %if.end15.preheader, label %if.then139

if.end15.preheader:                               ; preds = %if.end8
  br label %if.end15

if.end15:                                         ; preds = %if.end15.preheader, %blklab17
  %b1_dealloc.2.s2a.0 = phi i8 [ %b1_dealloc.2.s2a.1, %blklab17 ], [ undef, %if.end15.preheader ]
  %b2_dealloc.2.s2a.0 = phi i8 [ %b2_dealloc.2.s2a.1, %blklab17 ], [ undef, %if.end15.preheader ]
  %b1.2.s2a.0 = phi %struct.Board* [ %b1.2.s2a.1, %blklab17 ], [ undef, %if.end15.preheader ]
  %_18_dealloc.0284 = phi i8 [ %_18_dealloc.2, %blklab17 ], [ 0, %if.end15.preheader ]
  %_18.0283 = phi i64* [ %_18.2, %blklab17 ], [ null, %if.end15.preheader ]
  %_16_dealloc.0282 = phi i8 [ 1, %blklab17 ], [ 0, %if.end15.preheader ]
  %_16.0281 = phi i64* [ %call37, %blklab17 ], [ null, %if.end15.preheader ]
  %repeat.0280 = phi i64 [ %add105, %blklab17 ], [ 0, %if.end15.preheader ]
  %b1.0279 = phi %struct.Board* [ %b1.1, %blklab17 ], [ undef, %if.end15.preheader ]
  %b2_dealloc.0278 = phi i8 [ %b2_dealloc.1, %blklab17 ], [ 0, %if.end15.preheader ]
  %b2.0277 = phi %struct.Board* [ %b2.1, %blklab17 ], [ undef, %if.end15.preheader ]
  %b1_dealloc.0276 = phi i8 [ %b1_dealloc.1, %blklab17 ], [ 0, %if.end15.preheader ]
  %call.i = tail call i64* @create1DArray(i32 0, i32 9) #7
  %2 = bitcast i64* %call.i to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 72, i32 8, i1 false) #7
  %call12.i = tail call noalias i8* @malloc(i64 24) #7
  %3 = bitcast i8* %call12.i to %struct.Board*
  %pieces_size.i = getelementptr inbounds i8, i8* %call12.i, i64 8
  %4 = bitcast i8* %pieces_size.i to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %4, align 8, !tbaa !10
  %pieces.i = bitcast i8* %call12.i to i64**
  store i64* %call.i, i64** %pieces.i, align 8, !tbaa !7
  %5 = and i8 %b1_dealloc.0276, 1
  %tobool17 = icmp eq i8 %5, 0
  br i1 %tobool17, label %if.end24, label %if.then18

if.then18:                                        ; preds = %if.end15
  %6 = bitcast %struct.Board* %b1.0279 to i8**
  %7 = load i8*, i8** %6, align 8, !tbaa !7
  tail call void @free(i8* %7) #7
  %8 = bitcast %struct.Board* %b1.0279 to i8*
  tail call void @free(i8* %8) #7
  br label %if.end24

if.end24:                                         ; preds = %if.then18, %if.end15
  %call.i327 = tail call i64* @create1DArray(i32 0, i32 9) #7
  %9 = bitcast i64* %call.i327 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 72, i32 8, i1 false) #7
  %call12.i328 = tail call noalias i8* @malloc(i64 24) #7
  %10 = bitcast i8* %call12.i328 to %struct.Board*
  %pieces_size.i330 = getelementptr inbounds i8, i8* %call12.i328, i64 8
  %11 = bitcast i8* %pieces_size.i330 to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %11, align 8, !tbaa !10
  %pieces.i331 = bitcast i8* %call12.i328 to i64**
  store i64* %call.i327, i64** %pieces.i331, align 8, !tbaa !7
  %12 = and i8 %b2_dealloc.0278, 1
  %tobool26 = icmp eq i8 %12, 0
  br i1 %tobool26, label %while.cond31.preheader, label %if.then27

if.then27:                                        ; preds = %if.end24
  %13 = bitcast %struct.Board* %b2.0277 to i8**
  %14 = load i8*, i8** %13, align 8, !tbaa !7
  tail call void @free(i8* %14) #7
  %15 = bitcast %struct.Board* %b2.0277 to i8*
  tail call void @free(i8* %15) #7
  br label %while.cond31.preheader

while.cond31.preheader:                           ; preds = %if.end24, %if.then27
  br label %while.cond31

while.cond31:                                     ; preds = %while.cond31.preheader, %blklab20
  %b1_dealloc.2.s2a.1 = phi i8 [ %b1_dealloc.2.s2a.2, %blklab20 ], [ %b1_dealloc.2.s2a.0, %while.cond31.preheader ]
  %b2_dealloc.2.s2a.1 = phi i8 [ %b2_dealloc.2.s2a.2, %blklab20 ], [ %b2_dealloc.2.s2a.0, %while.cond31.preheader ]
  %b1.2.s2a.1 = phi %struct.Board* [ %b1.2.s2a.2, %blklab20 ], [ %b1.2.s2a.0, %while.cond31.preheader ]
  %b1_dealloc.1 = phi i8 [ %b1_dealloc.2.ph.merge, %blklab20 ], [ 1, %while.cond31.preheader ]
  %b2.1 = phi %struct.Board* [ %b2.2.ph.merge, %blklab20 ], [ %10, %while.cond31.preheader ]
  %b2_dealloc.1 = phi i8 [ %b2_dealloc.2.ph.merge, %blklab20 ], [ 1, %while.cond31.preheader ]
  %i.0 = phi i64 [ %add104, %blklab20 ], [ 0, %while.cond31.preheader ]
  %b1.1 = phi %struct.Board* [ %b1.2.ph.merge, %blklab20 ], [ %3, %while.cond31.preheader ]
  %_16.1 = phi i64* [ %call37, %blklab20 ], [ %_16.0281, %while.cond31.preheader ]
  %_16_dealloc.1 = phi i8 [ 1, %blklab20 ], [ %_16_dealloc.0282, %while.cond31.preheader ]
  %_18.1 = phi i64* [ %call55, %blklab20 ], [ %_18.0283, %while.cond31.preheader ]
  %_18_dealloc.1 = phi i8 [ 1, %blklab20 ], [ %_18_dealloc.0284, %while.cond31.preheader ]
  %16 = and i8 %_16_dealloc.1, 1
  %tobool33 = icmp eq i8 %16, 0
  br i1 %tobool33, label %if.end35, label %if.then34

if.then34:                                        ; preds = %while.cond31
  %17 = bitcast i64* %_16.1 to i8*
  tail call void @free(i8* %17) #7
  br label %if.end35

if.end35:                                         ; preds = %while.cond31, %if.then34
  %call37 = tail call i64* @create1DArray(i32 0, i32 9) #7
  %18 = bitcast i64* %call37 to <2 x i64>*
  store <2 x i64> <i64 0, i64 1>, <2 x i64>* %18, align 8, !tbaa !10
  %arrayidx40 = getelementptr inbounds i64, i64* %call37, i64 2
  %19 = bitcast i64* %arrayidx40 to <2 x i64>*
  store <2 x i64> <i64 2, i64 3>, <2 x i64>* %19, align 8, !tbaa !10
  %arrayidx42 = getelementptr inbounds i64, i64* %call37, i64 4
  %20 = bitcast i64* %arrayidx42 to <2 x i64>*
  store <2 x i64> <i64 4, i64 5>, <2 x i64>* %20, align 8, !tbaa !10
  %arrayidx44 = getelementptr inbounds i64, i64* %call37, i64 6
  %21 = bitcast i64* %arrayidx44 to <2 x i64>*
  store <2 x i64> <i64 6, i64 7>, <2 x i64>* %21, align 8, !tbaa !10
  %arrayidx46 = getelementptr inbounds i64, i64* %call37, i64 8
  store i64 8, i64* %arrayidx46, align 8, !tbaa !10
  %cmp47 = icmp sgt i64 %i.0, 8
  br i1 %cmp47, label %blklab17, label %if.end50

if.end50:                                         ; preds = %if.end35
  %22 = and i8 %_18_dealloc.1, 1
  %tobool51 = icmp eq i8 %22, 0
  br i1 %tobool51, label %if.end53, label %if.then52

if.then52:                                        ; preds = %if.end50
  %23 = bitcast i64* %_18.1 to i8*
  tail call void @free(i8* %23) #7
  br label %if.end53

if.end53:                                         ; preds = %if.end50, %if.then52
  %call55 = tail call i64* @create1DArray(i32 0, i32 9) #7
  %24 = bitcast i64* %call55 to <2 x i64>*
  store <2 x i64> <i64 0, i64 1>, <2 x i64>* %24, align 8, !tbaa !10
  %arrayidx58 = getelementptr inbounds i64, i64* %call55, i64 2
  %25 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 2, i64 3>, <2 x i64>* %25, align 8, !tbaa !10
  %arrayidx60 = getelementptr inbounds i64, i64* %call55, i64 4
  %26 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 4, i64 5>, <2 x i64>* %26, align 8, !tbaa !10
  %arrayidx62 = getelementptr inbounds i64, i64* %call55, i64 6
  %27 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 6, i64 7>, <2 x i64>* %27, align 8, !tbaa !10
  %arrayidx64 = getelementptr inbounds i64, i64* %call55, i64 8
  store i64 8, i64* %arrayidx64, align 8, !tbaa !10
  %arrayidx65 = getelementptr inbounds i64, i64* %call55, i64 %i.0
  %28 = load i64, i64* %arrayidx65, align 8, !tbaa !10
  %29 = icmp ult i64 %28, 10
  br i1 %29, label %polly.preload.cond, label %blklab17

polly.preload.cond:                               ; preds = %if.end53
  %30 = icmp eq %struct.Board* %b1.1, null
  %31 = icmp slt %struct.Board* %b2.1, null
  %32 = icmp sgt %struct.Board* %b2.1, null
  %33 = icmp ne %struct.Board* %b2.1, null
  %34 = and i1 %33, %30
  br i1 %34, label %polly.preload.exec, label %polly.preload.cond292

polly.preload.cond292:                            ; preds = %polly.preload.cond, %polly.preload.exec
  %polly.preload..merge = phi i64* [ %polly.access.b2.1.load, %polly.preload.exec ], [ null, %polly.preload.cond ]
  %.pre = getelementptr inbounds %struct.Board, %struct.Board* %b1.1, i64 0, i32 0
  br i1 %30, label %polly.preload.merge293, label %polly.preload.exec294

polly.preload.merge293:                           ; preds = %polly.preload.cond292, %polly.preload.exec294
  %polly.preload..merge295 = phi i64* [ %polly.access.b1.1.load, %polly.preload.exec294 ], [ null, %polly.preload.cond292 ]
  %35 = getelementptr inbounds %struct.Board, %struct.Board* %b1.1, i64 0, i32 0
  %36 = icmp ne %struct.Board* %b1.1, null
  %37 = and i8 %b1_dealloc.1, 1
  %38 = icmp ne i8 %37, 0
  %39 = and i1 %31, %38
  %40 = or i1 %39, %36
  %41 = and i1 %32, %38
  %42 = or i1 %41, %40
  %43 = xor i1 %42, true
  %44 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %28, i64 1)
  %.obit301 = extractvalue { i64, i1 } %44, 1
  %.res303 = extractvalue { i64, i1 } %44, 0
  %polly.access.polly.preload..merge = getelementptr i64, i64* %polly.preload..merge, i64 %.res303
  %polly.access.cast.b2.1304 = getelementptr inbounds %struct.Board, %struct.Board* %b2.1, i64 0, i32 0
  %polly.access.b2.1305 = getelementptr i64*, i64** %polly.access.cast.b2.1304, i64 2
  %45 = bitcast i64** %polly.access.b2.1305 to i64*
  %46 = icmp ule i64* %polly.access.polly.preload..merge, %45
  %polly.access.b2.1307 = getelementptr inbounds %struct.Board, %struct.Board* %b2.1, i64 1, i32 0
  %polly.access.polly.preload..merge308 = getelementptr i64, i64* %polly.preload..merge, i64 %28
  %47 = bitcast i64* %polly.access.polly.preload..merge308 to i64**
  %48 = icmp ule i64** %polly.access.b2.1307, %47
  %49 = or i1 %46, %48
  %50 = and i1 %49, %43
  %polly.access.polly.preload..merge295 = getelementptr i64, i64* %polly.preload..merge295, i64 %.res303
  %polly.access.b1.1313 = getelementptr i64*, i64** %35, i64 2
  %51 = bitcast i64** %polly.access.b1.1313 to i64*
  %52 = icmp ule i64* %polly.access.polly.preload..merge295, %51
  %polly.access.b1.1315 = getelementptr inbounds %struct.Board, %struct.Board* %b1.1, i64 1, i32 0
  %polly.access.polly.preload..merge295316 = getelementptr i64, i64* %polly.preload..merge295, i64 %28
  %53 = bitcast i64* %polly.access.polly.preload..merge295316 to i64**
  %54 = icmp ule i64** %polly.access.b1.1315, %53
  %55 = or i1 %52, %54
  %56 = and i1 %50, %55
  %polly.rtc.overflown = xor i1 %.obit301, true
  %polly.rtc.result = and i1 %56, %polly.rtc.overflown
  br i1 %polly.rtc.result, label %polly.cond, label %blklab19

blklab19:                                         ; preds = %polly.preload.merge293
  br i1 %30, label %blklab22, label %if.end77

if.end77:                                         ; preds = %blklab19
  %57 = load i64*, i64** %.pre, align 8, !tbaa !7
  %arrayidx78 = getelementptr inbounds i64, i64* %57, i64 %28
  store i64 1, i64* %arrayidx78, align 8, !tbaa !10
  %move = getelementptr inbounds %struct.Board, %struct.Board* %b1.1, i64 0, i32 2
  %58 = load i64, i64* %move, align 8, !tbaa !8
  %add = add nsw i64 %58, 1
  store i64 %add, i64* %move, align 8, !tbaa !8
  %59 = and i8 %b2_dealloc.1, 1
  %tobool80 = icmp eq i8 %59, 0
  br i1 %tobool80, label %if.end82, label %if.then81

if.then81:                                        ; preds = %if.end77
  %60 = bitcast %struct.Board* %b2.1 to i8**
  %61 = load i8*, i8** %60, align 8, !tbaa !7
  tail call void @free(i8* %61) #7
  %62 = bitcast %struct.Board* %b2.1 to i8*
  tail call void @free(i8* %62) #7
  br label %if.end82

if.end82:                                         ; preds = %if.end77, %if.then81
  %call.i332 = tail call noalias i8* @malloc(i64 24) #7
  %63 = bitcast i8* %call.i332 to %struct.Board*
  %pieces_size.i333 = getelementptr inbounds %struct.Board, %struct.Board* %b1.1, i64 0, i32 1
  %64 = load i64, i64* %pieces_size.i333, align 8, !tbaa !1
  %pieces_size1.i = getelementptr inbounds i8, i8* %call.i332, i64 8
  %65 = bitcast i8* %pieces_size1.i to i64*
  store i64 %64, i64* %65, align 8, !tbaa !1
  %66 = load i64*, i64** %.pre, align 8, !tbaa !7
  %call3.i = tail call i64* @copy(i64* %66, i64 %64) #7
  %pieces4.i = bitcast i8* %call.i332 to i64**
  store i64* %call3.i, i64** %pieces4.i, align 8, !tbaa !7
  %67 = load i64, i64* %move, align 8, !tbaa !8
  %move5.i = getelementptr inbounds i8, i8* %call.i332, i64 16
  %68 = bitcast i8* %move5.i to i64*
  store i64 %67, i64* %68, align 8, !tbaa !8
  %tobool84 = icmp eq i8 %37, 0
  br i1 %tobool84, label %blklab20, label %if.then85

if.then85:                                        ; preds = %if.end82
  %69 = bitcast %struct.Board* %b1.1 to i8**
  %70 = load i8*, i8** %69, align 8, !tbaa !7
  tail call void @free(i8* %70) #7
  %71 = bitcast %struct.Board* %b1.1 to i8*
  tail call void @free(i8* %71) #7
  br label %blklab20

blklab22:                                         ; preds = %blklab19
  %cmp87 = icmp eq %struct.Board* %b2.1, null
  br i1 %cmp87, label %blklab20, label %if.end90

if.end90:                                         ; preds = %blklab22
  %72 = load i64*, i64** %polly.access.cast.b2.1304, align 8, !tbaa !7
  %arrayidx92 = getelementptr inbounds i64, i64* %72, i64 %28
  store i64 2, i64* %arrayidx92, align 8, !tbaa !10
  %move93 = getelementptr inbounds %struct.Board, %struct.Board* %b2.1, i64 0, i32 2
  %73 = load i64, i64* %move93, align 8, !tbaa !8
  %add94 = add nsw i64 %73, 1
  store i64 %add94, i64* %move93, align 8, !tbaa !8
  %74 = and i8 %b2_dealloc.1, 1
  br label %blklab20

blklab20:                                         ; preds = %polly.cond317, %polly.stmt.if.end90, %polly.stmt.if.end77, %if.end90, %blklab22, %if.end82, %if.then85
  %b1_dealloc.2.s2a.2 = phi i8 [ %b1_dealloc.2.s2a.1, %if.end90 ], [ %b1_dealloc.2.s2a.1, %blklab22 ], [ %b1_dealloc.2.s2a.1, %if.end82 ], [ %b1_dealloc.2.s2a.1, %if.then85 ], [ %b1_dealloc.2.s2a.1, %polly.stmt.if.end77 ], [ %100, %polly.stmt.if.end90 ], [ %b1_dealloc.1, %polly.cond317 ]
  %b2_dealloc.2.s2a.2 = phi i8 [ %b2_dealloc.2.s2a.1, %if.end90 ], [ %b2_dealloc.2.s2a.1, %blklab22 ], [ %b2_dealloc.2.s2a.1, %if.end82 ], [ %b2_dealloc.2.s2a.1, %if.then85 ], [ %b2_dealloc.2.s2a.1, %polly.stmt.if.end77 ], [ 0, %polly.stmt.if.end90 ], [ %b2_dealloc.1, %polly.cond317 ]
  %b1.2.s2a.2 = phi %struct.Board* [ %b1.2.s2a.1, %if.end90 ], [ %b1.2.s2a.1, %blklab22 ], [ %b1.2.s2a.1, %if.end82 ], [ %b1.2.s2a.1, %if.then85 ], [ %b1.2.s2a.1, %polly.stmt.if.end77 ], [ %b2.1, %polly.stmt.if.end90 ], [ null, %polly.cond317 ]
  %b1_dealloc.2.ph.merge = phi i8 [ %74, %if.end90 ], [ %b1_dealloc.1, %blklab22 ], [ 0, %if.end82 ], [ 0, %if.then85 ], [ %b1_dealloc.2.s2a.1, %polly.stmt.if.end77 ], [ %100, %polly.stmt.if.end90 ], [ %b1_dealloc.1, %polly.cond317 ]
  %b2.2.ph.merge = phi %struct.Board* [ null, %if.end90 ], [ null, %blklab22 ], [ %63, %if.end82 ], [ %63, %if.then85 ], [ null, %polly.stmt.if.end77 ], [ null, %polly.stmt.if.end90 ], [ null, %polly.cond317 ]
  %b2_dealloc.2.ph.merge = phi i8 [ 0, %if.end90 ], [ %b2_dealloc.1, %blklab22 ], [ 1, %if.end82 ], [ 1, %if.then85 ], [ %b2_dealloc.2.s2a.1, %polly.stmt.if.end77 ], [ 0, %polly.stmt.if.end90 ], [ %b2_dealloc.1, %polly.cond317 ]
  %b1.2.ph.merge = phi %struct.Board* [ %b2.1, %if.end90 ], [ null, %blklab22 ], [ null, %if.end82 ], [ null, %if.then85 ], [ %b1.2.s2a.1, %polly.stmt.if.end77 ], [ %b2.1, %polly.stmt.if.end90 ], [ null, %polly.cond317 ]
  %add104 = add nuw nsw i64 %i.0, 1
  br label %while.cond31

blklab17:                                         ; preds = %if.end53, %if.end35
  %_18.2 = phi i64* [ %_18.1, %if.end35 ], [ %call55, %if.end53 ]
  %_18_dealloc.2 = phi i8 [ %_18_dealloc.1, %if.end35 ], [ 1, %if.end53 ]
  %add105 = add nuw nsw i64 %repeat.0280, 1
  %exitcond = icmp eq i64 %add105, %1
  br i1 %exitcond, label %if.then139.loopexit, label %if.end15

if.then139.loopexit:                              ; preds = %blklab17
  %phitmp361 = bitcast i64* %call37 to i8*
  br label %if.then139

if.then139:                                       ; preds = %if.then139.loopexit, %if.end8
  %_18_dealloc.0.lcssa = phi i8 [ 0, %if.end8 ], [ %_18_dealloc.2, %if.then139.loopexit ]
  %_18.0.lcssa = phi i64* [ null, %if.end8 ], [ %_18.2, %if.then139.loopexit ]
  %_16_dealloc.0.lcssa = phi i8 [ 0, %if.end8 ], [ 1, %if.then139.loopexit ]
  %_16.0.lcssa = phi i8* [ null, %if.end8 ], [ %phitmp361, %if.then139.loopexit ]
  %b1.0.lcssa = phi %struct.Board* [ undef, %if.end8 ], [ %b1.1, %if.then139.loopexit ]
  %b2_dealloc.0.lcssa = phi i8 [ 0, %if.end8 ], [ %b2_dealloc.1, %if.then139.loopexit ]
  %b2.0.lcssa = phi %struct.Board* [ undef, %if.end8 ], [ %b2.1, %if.then139.loopexit ]
  %b1_dealloc.0.lcssa = phi i8 [ 0, %if.end8 ], [ %b1_dealloc.1, %if.then139.loopexit ]
  %call110 = tail call i64* @create1DArray(i32 0, i32 27) #7
  %75 = bitcast i64* %call110 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %75, align 8, !tbaa !10
  %arrayidx113 = getelementptr inbounds i64, i64* %call110, i64 2
  %76 = bitcast i64* %arrayidx113 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %76, align 8, !tbaa !10
  %arrayidx115 = getelementptr inbounds i64, i64* %call110, i64 4
  %77 = bitcast i64* %arrayidx115 to <2 x i64>*
  store <2 x i64> <i64 32, i64 110>, <2 x i64>* %77, align 8, !tbaa !10
  %arrayidx117 = getelementptr inbounds i64, i64* %call110, i64 6
  %78 = bitcast i64* %arrayidx117 to <2 x i64>*
  store <2 x i64> <i64 101, i64 119>, <2 x i64>* %78, align 8, !tbaa !10
  %arrayidx119 = getelementptr inbounds i64, i64* %call110, i64 8
  %79 = bitcast i64* %arrayidx119 to <2 x i64>*
  store <2 x i64> <i64 84, i64 105>, <2 x i64>* %79, align 8, !tbaa !10
  %arrayidx121 = getelementptr inbounds i64, i64* %call110, i64 10
  %80 = bitcast i64* %arrayidx121 to <2 x i64>*
  store <2 x i64> <i64 99, i64 84>, <2 x i64>* %80, align 8, !tbaa !10
  %arrayidx123 = getelementptr inbounds i64, i64* %call110, i64 12
  %81 = bitcast i64* %arrayidx123 to <2 x i64>*
  store <2 x i64> <i64 97, i64 99>, <2 x i64>* %81, align 8, !tbaa !10
  %arrayidx125 = getelementptr inbounds i64, i64* %call110, i64 14
  %82 = bitcast i64* %arrayidx125 to <2 x i64>*
  store <2 x i64> <i64 84, i64 111>, <2 x i64>* %82, align 8, !tbaa !10
  %arrayidx127 = getelementptr inbounds i64, i64* %call110, i64 16
  %83 = bitcast i64* %arrayidx127 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %83, align 8, !tbaa !10
  %arrayidx129 = getelementptr inbounds i64, i64* %call110, i64 18
  %84 = bitcast i64* %arrayidx129 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %84, align 8, !tbaa !10
  %arrayidx131 = getelementptr inbounds i64, i64* %call110, i64 20
  %85 = bitcast i64* %arrayidx131 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %85, align 8, !tbaa !10
  %arrayidx133 = getelementptr inbounds i64, i64* %call110, i64 22
  %86 = bitcast i64* %arrayidx133 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %86, align 8, !tbaa !10
  %arrayidx135 = getelementptr inbounds i64, i64* %call110, i64 24
  %87 = bitcast i64* %arrayidx135 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %87, align 8, !tbaa !10
  %arrayidx137 = getelementptr inbounds i64, i64* %call110, i64 26
  store i64 101, i64* %arrayidx137, align 8, !tbaa !10
  tail call void @println_s(i64* %call110, i64 27) #7
  %phitmp = bitcast i64* %call110 to i8*
  %88 = bitcast i64* %call1 to i8*
  tail call void @free(i8* %88) #7
  %89 = and i8 %b1_dealloc.0.lcssa, 1
  %tobool141 = icmp eq i8 %89, 0
  br i1 %tobool141, label %if.end143, label %if.then142

if.then142:                                       ; preds = %if.then139
  %90 = bitcast %struct.Board* %b1.0.lcssa to i8**
  %91 = load i8*, i8** %90, align 8, !tbaa !7
  tail call void @free(i8* %91) #7
  %92 = bitcast %struct.Board* %b1.0.lcssa to i8*
  tail call void @free(i8* %92) #7
  br label %if.end143

if.end143:                                        ; preds = %if.then139, %if.then142
  %93 = and i8 %b2_dealloc.0.lcssa, 1
  %tobool144 = icmp eq i8 %93, 0
  br i1 %tobool144, label %if.then151, label %if.then145

if.then145:                                       ; preds = %if.end143
  %94 = bitcast %struct.Board* %b2.0.lcssa to i8**
  %95 = load i8*, i8** %94, align 8, !tbaa !7
  tail call void @free(i8* %95) #7
  %96 = bitcast %struct.Board* %b2.0.lcssa to i8*
  tail call void @free(i8* %96) #7
  br label %if.then151

if.then151:                                       ; preds = %if.end143, %if.then145
  tail call void @free2DArray(i64** %call, i64 %conv) #7
  %tobool162 = icmp eq i8 %_16_dealloc.0.lcssa, 0
  br i1 %tobool162, label %if.end164, label %if.then163

if.then163:                                       ; preds = %if.then151
  tail call void @free(i8* %_16.0.lcssa) #7
  br label %if.end164

if.end164:                                        ; preds = %if.then151, %if.then163
  %97 = and i8 %_18_dealloc.0.lcssa, 1
  %tobool165 = icmp eq i8 %97, 0
  br i1 %tobool165, label %if.then169, label %if.then166

if.then166:                                       ; preds = %if.end164
  %98 = bitcast i64* %_18.0.lcssa to i8*
  tail call void @free(i8* %98) #7
  br label %if.then169

if.then169:                                       ; preds = %if.end164, %if.then166
  tail call void @free(i8* %phitmp) #7
  br label %if.end170

if.end170:                                        ; preds = %if.end167.thread, %if.then169
  tail call void @exit(i32 0) #8
  unreachable

polly.cond:                                       ; preds = %polly.preload.merge293
  br i1 %30, label %polly.cond317, label %polly.stmt.if.end77

polly.preload.exec:                               ; preds = %polly.preload.cond
  %polly.access.cast.b2.1 = getelementptr inbounds %struct.Board, %struct.Board* %b2.1, i64 0, i32 0
  %polly.access.b2.1.load = load i64*, i64** %polly.access.cast.b2.1, align 8, !alias.scope !13, !noalias !15
  br label %polly.preload.cond292

polly.preload.exec294:                            ; preds = %polly.preload.cond292
  %polly.access.b1.1.load = load i64*, i64** %.pre, align 8, !alias.scope !20, !noalias !23
  br label %polly.preload.merge293

polly.cond317:                                    ; preds = %polly.cond
  %99 = icmp eq %struct.Board* %b2.1, null
  br i1 %99, label %blklab20, label %polly.stmt.if.end90

polly.stmt.if.end77:                              ; preds = %polly.cond
  store i64 1, i64* %polly.access.polly.preload..merge295316, align 8
  %scevgep321 = getelementptr %struct.Board, %struct.Board* %b1.1, i64 0, i32 2
  %_p_scalar_322 = load i64, i64* %scevgep321, align 8, !alias.scope !20, !noalias !23
  %p_add = add nsw i64 %_p_scalar_322, 1
  store i64 %p_add, i64* %scevgep321, align 8, !alias.scope !20, !noalias !23
  br label %blklab20

polly.stmt.if.end90:                              ; preds = %polly.cond317
  %100 = and i8 %b2_dealloc.1, 1
  store i64 2, i64* %polly.access.polly.preload..merge308, align 8
  %scevgep = getelementptr %struct.Board, %struct.Board* %b2.1, i64 0, i32 2
  %_p_scalar_ = load i64, i64* %scevgep, align 8, !alias.scope !13, !noalias !15
  %p_add94 = add nsw i64 %_p_scalar_, 1
  store i64 %p_add94, i64* %scevgep, align 8, !alias.scope !13, !noalias !15
  br label %blklab20
}

declare void @free2DArray(i64**, i64) local_unnamed_addr #2

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #2

declare i64* @parseStringToInt(i64*) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

declare i32 @putchar(i32) local_unnamed_addr

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { argmemonly nounwind }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git aec29e5973c27bcbc3c1cf54295e3778050a73cd) (http://llvm.org/git/llvm.git 4c6356e8c64e246972f760a1f05bc0f365b090ad)"}
!1 = !{!2, !6, i64 8}
!2 = !{!"", !3, i64 0, !6, i64 8, !6, i64 16}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!"long long", !4, i64 0}
!7 = !{!2, !3, i64 0}
!8 = !{!2, !6, i64 16}
!9 = !{!3, !3, i64 0}
!10 = !{!6, !6, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14, !"polly.alias.scope.b2.1"}
!14 = distinct !{!14, !"polly.alias.scope.domain"}
!15 = !{!16, !17, !18, !19, !20, !21, !22}
!16 = distinct !{!16, !14, !"polly.alias.scope.b1.2"}
!17 = distinct !{!17, !14, !"polly.alias.scope.b2_dealloc.2"}
!18 = distinct !{!18, !14, !"polly.alias.scope.b2.2"}
!19 = distinct !{!19, !14, !"polly.alias.scope."}
!20 = distinct !{!20, !14, !"polly.alias.scope.b1.1"}
!21 = distinct !{!21, !14, !"polly.alias.scope.b1_dealloc.2"}
!22 = distinct !{!22, !14, !"polly.alias.scope."}
!23 = !{!16, !17, !18, !19, !13, !21, !22}
