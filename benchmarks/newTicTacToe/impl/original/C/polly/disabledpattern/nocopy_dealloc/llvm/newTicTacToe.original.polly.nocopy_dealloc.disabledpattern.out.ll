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
  %0 = bitcast i64* %call to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 72, i32 8, i1 false)
  %call14 = tail call noalias i8* @malloc(i64 24) #6
  %1 = bitcast i8* %call14 to %struct.Board*
  %pieces_size = getelementptr inbounds i8, i8* %call14, i64 8
  %2 = bitcast i8* %pieces_size to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %2, align 8, !tbaa !10
  %pieces = bitcast i8* %call14 to i64**
  store i64* %call, i64** %pieces, align 8, !tbaa !7
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
  br i1 %not.cmp4, label %if.end170, label %if.end14

if.end14:                                         ; preds = %entry
  %3 = load i64, i64* %call3, align 8, !tbaa !10
  %cmp15308 = icmp sgt i64 %3, 0
  br i1 %cmp15308, label %if.end20.preheader, label %if.end161

if.end20.preheader:                               ; preds = %if.end14
  br label %if.end20

if.end20:                                         ; preds = %if.end20.preheader, %blklab17
  %_18_dealloc.0317 = phi i8 [ %_18_dealloc.3, %blklab17 ], [ 0, %if.end20.preheader ]
  %_18.0316 = phi i64* [ %_18.2, %blklab17 ], [ null, %if.end20.preheader ]
  %_16_dealloc.0315 = phi i8 [ %.304, %blklab17 ], [ 0, %if.end20.preheader ]
  %_16.0314 = phi i64* [ %call49, %blklab17 ], [ null, %if.end20.preheader ]
  %b2_dealloc.0313 = phi i8 [ %b2_dealloc.1, %blklab17 ], [ 0, %if.end20.preheader ]
  %4 = phi i8* [ %19, %blklab17 ], [ undef, %if.end20.preheader ]
  %b2.0312 = phi %struct.Board* [ %b2.1, %blklab17 ], [ undef, %if.end20.preheader ]
  %b1_dealloc.0311 = phi i8 [ %b1_dealloc.1, %blklab17 ], [ 0, %if.end20.preheader ]
  %5 = phi i8* [ %18, %blklab17 ], [ undef, %if.end20.preheader ]
  %b1.0310 = phi %struct.Board* [ %b1.1, %blklab17 ], [ undef, %if.end20.preheader ]
  %repeat.0309 = phi i64 [ %add123, %blklab17 ], [ 0, %if.end20.preheader ]
  %call.i = call i64* @create1DArray_int64_t(i64 0, i64 9) #6
  %6 = bitcast i64* %call.i to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 72, i32 8, i1 false) #6
  %call14.i = call noalias i8* @malloc(i64 24) #6
  %7 = bitcast i8* %call14.i to %struct.Board*
  %pieces_size.i = getelementptr inbounds i8, i8* %call14.i, i64 8
  %8 = bitcast i8* %pieces_size.i to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %8, align 8, !tbaa !10
  %pieces.i = bitcast i8* %call14.i to i64**
  store i64* %call.i, i64** %pieces.i, align 8, !tbaa !7
  %not.cmp22 = icmp ne i8* %call14.i, null
  %.302 = zext i1 %not.cmp22 to i8
  %9 = and i8 %b1_dealloc.0311, 1
  %tobool26 = icmp eq i8 %9, 0
  br i1 %tobool26, label %if.end33, label %if.then27

if.then27:                                        ; preds = %if.end20
  %10 = bitcast %struct.Board* %b1.0310 to i8**
  %11 = load i8*, i8** %10, align 8, !tbaa !7
  call void @free(i8* %11) #6
  call void @free(i8* %5) #6
  br label %if.end33

if.end33:                                         ; preds = %if.then27, %if.end20
  %call.i325 = call i64* @create1DArray_int64_t(i64 0, i64 9) #6
  %12 = bitcast i64* %call.i325 to i8*
  call void @llvm.memset.p0i8.i64(i8* %12, i8 0, i64 72, i32 8, i1 false) #6
  %call14.i326 = call noalias i8* @malloc(i64 24) #6
  %13 = bitcast i8* %call14.i326 to %struct.Board*
  %pieces_size.i328 = getelementptr inbounds i8, i8* %call14.i326, i64 8
  %14 = bitcast i8* %pieces_size.i328 to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %14, align 8, !tbaa !10
  %pieces.i329 = bitcast i8* %call14.i326 to i64**
  store i64* %call.i325, i64** %pieces.i329, align 8, !tbaa !7
  %not.cmp35 = icmp ne i8* %call14.i326, null
  %.303 = zext i1 %not.cmp35 to i8
  %15 = and i8 %b2_dealloc.0313, 1
  %tobool39 = icmp eq i8 %15, 0
  br i1 %tobool39, label %while.cond44.preheader, label %if.then40

if.then40:                                        ; preds = %if.end33
  %16 = bitcast %struct.Board* %b2.0312 to i8**
  %17 = load i8*, i8** %16, align 8, !tbaa !7
  call void @free(i8* %17) #6
  call void @free(i8* %4) #6
  br label %while.cond44.preheader

while.cond44.preheader:                           ; preds = %if.end33, %if.then40
  br label %while.cond44

while.cond44:                                     ; preds = %while.cond44.preheader, %blklab20
  %18 = phi i8* [ %52, %blklab20 ], [ %call14.i, %while.cond44.preheader ]
  %b1.1 = phi %struct.Board* [ %b1.2, %blklab20 ], [ %7, %while.cond44.preheader ]
  %b1_dealloc.1 = phi i8 [ %b1_dealloc.2, %blklab20 ], [ %.302, %while.cond44.preheader ]
  %19 = phi i8* [ %53, %blklab20 ], [ %call14.i326, %while.cond44.preheader ]
  %b2.1 = phi %struct.Board* [ %b2.2, %blklab20 ], [ %13, %while.cond44.preheader ]
  %b2_dealloc.1 = phi i8 [ %b2_dealloc.3, %blklab20 ], [ %.303, %while.cond44.preheader ]
  %i.0 = phi i64 [ %add122, %blklab20 ], [ 0, %while.cond44.preheader ]
  %_16.1 = phi i64* [ %call49, %blklab20 ], [ %_16.0314, %while.cond44.preheader ]
  %_16_dealloc.1 = phi i8 [ %.304, %blklab20 ], [ %_16_dealloc.0315, %while.cond44.preheader ]
  %_18.1 = phi i64* [ %call69, %blklab20 ], [ %_18.0316, %while.cond44.preheader ]
  %_18_dealloc.1 = phi i8 [ %.305, %blklab20 ], [ %_18_dealloc.0317, %while.cond44.preheader ]
  %20 = and i8 %_16_dealloc.1, 1
  %tobool46 = icmp eq i8 %20, 0
  br i1 %tobool46, label %if.end48, label %if.then47

if.then47:                                        ; preds = %while.cond44
  %21 = bitcast i64* %_16.1 to i8*
  call void @free(i8* %21) #6
  br label %if.end48

if.end48:                                         ; preds = %while.cond44, %if.then47
  %call49 = call i64* @create1DArray_int64_t(i64 0, i64 9) #6
  %22 = bitcast i64* %call49 to <2 x i64>*
  store <2 x i64> <i64 0, i64 1>, <2 x i64>* %22, align 8, !tbaa !10
  %arrayidx52 = getelementptr inbounds i64, i64* %call49, i64 2
  %23 = bitcast i64* %arrayidx52 to <2 x i64>*
  store <2 x i64> <i64 2, i64 3>, <2 x i64>* %23, align 8, !tbaa !10
  %arrayidx54 = getelementptr inbounds i64, i64* %call49, i64 4
  %24 = bitcast i64* %arrayidx54 to <2 x i64>*
  store <2 x i64> <i64 4, i64 5>, <2 x i64>* %24, align 8, !tbaa !10
  %arrayidx56 = getelementptr inbounds i64, i64* %call49, i64 6
  %25 = bitcast i64* %arrayidx56 to <2 x i64>*
  store <2 x i64> <i64 6, i64 7>, <2 x i64>* %25, align 8, !tbaa !10
  %arrayidx58 = getelementptr inbounds i64, i64* %call49, i64 8
  store i64 8, i64* %arrayidx58, align 8, !tbaa !10
  %not.cmp59 = icmp ne i64* %call49, null
  %.304 = zext i1 %not.cmp59 to i8
  %cmp63 = icmp sgt i64 %i.0, 8
  br i1 %cmp63, label %blklab17, label %if.end65

if.end65:                                         ; preds = %if.end48
  %26 = and i8 %_18_dealloc.1, 1
  %tobool66 = icmp eq i8 %26, 0
  br i1 %tobool66, label %if.end68, label %if.then67

if.then67:                                        ; preds = %if.end65
  %27 = bitcast i64* %_18.1 to i8*
  call void @free(i8* %27) #6
  br label %if.end68

if.end68:                                         ; preds = %if.end65, %if.then67
  %call69 = call i64* @create1DArray_int64_t(i64 0, i64 9) #6
  %28 = bitcast i64* %call69 to <2 x i64>*
  store <2 x i64> <i64 0, i64 1>, <2 x i64>* %28, align 8, !tbaa !10
  %arrayidx72 = getelementptr inbounds i64, i64* %call69, i64 2
  %29 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 2, i64 3>, <2 x i64>* %29, align 8, !tbaa !10
  %arrayidx74 = getelementptr inbounds i64, i64* %call69, i64 4
  %30 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 4, i64 5>, <2 x i64>* %30, align 8, !tbaa !10
  %arrayidx76 = getelementptr inbounds i64, i64* %call69, i64 6
  %31 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 6, i64 7>, <2 x i64>* %31, align 8, !tbaa !10
  %arrayidx78 = getelementptr inbounds i64, i64* %call69, i64 8
  store i64 8, i64* %arrayidx78, align 8, !tbaa !10
  %not.cmp79 = icmp ne i64* %call69, null
  %.305 = zext i1 %not.cmp79 to i8
  %arrayidx83 = getelementptr inbounds i64, i64* %call69, i64 %i.0
  %32 = load i64, i64* %arrayidx83, align 8, !tbaa !10
  %33 = icmp ult i64 %32, 10
  br i1 %33, label %blklab19, label %blklab17

blklab19:                                         ; preds = %if.end68
  %cmp90 = icmp eq %struct.Board* %b1.1, null
  br i1 %cmp90, label %blklab22, label %if.end92

if.end92:                                         ; preds = %blklab19
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %b1.1, i64 0, i32 0
  %34 = load i64*, i64** %pieces, align 8, !tbaa !7
  %arrayidx93 = getelementptr inbounds i64, i64* %34, i64 %32
  store i64 1, i64* %arrayidx93, align 8, !tbaa !10
  %move = getelementptr inbounds %struct.Board, %struct.Board* %b1.1, i64 0, i32 2
  %35 = load i64, i64* %move, align 8, !tbaa !8
  %add = add nsw i64 %35, 1
  store i64 %add, i64* %move, align 8, !tbaa !8
  %36 = and i8 %b2_dealloc.1, 1
  %tobool95 = icmp eq i8 %36, 0
  br i1 %tobool95, label %if.end97, label %if.then96

if.then96:                                        ; preds = %if.end92
  %37 = bitcast %struct.Board* %b2.1 to i8**
  %38 = load i8*, i8** %37, align 8, !tbaa !7
  call void @free(i8* %38) #6
  call void @free(i8* %19) #6
  br label %if.end97

if.end97:                                         ; preds = %if.end92, %if.then96
  %call.i330 = call noalias i8* @malloc(i64 24) #6
  %39 = bitcast i8* %call.i330 to %struct.Board*
  %pieces_size.i331 = getelementptr inbounds %struct.Board, %struct.Board* %b1.1, i64 0, i32 1
  %40 = load i64, i64* %pieces_size.i331, align 8, !tbaa !1
  %pieces_size1.i = getelementptr inbounds i8, i8* %call.i330, i64 8
  %41 = bitcast i8* %pieces_size1.i to i64*
  store i64 %40, i64* %41, align 8, !tbaa !1
  %42 = load i64*, i64** %pieces, align 8, !tbaa !7
  %call3.i = call i64* @copy1DArray_int64_t(i64* %42, i64 %40) #6
  %pieces4.i = bitcast i8* %call.i330 to i64**
  store i64* %call3.i, i64** %pieces4.i, align 8, !tbaa !7
  %43 = load i64, i64* %move, align 8, !tbaa !8
  %move5.i = getelementptr inbounds i8, i8* %call.i330, i64 16
  %44 = bitcast i8* %move5.i to i64*
  store i64 %43, i64* %44, align 8, !tbaa !8
  %not.cmp99 = icmp ne i8* %call.i330, null
  %.306 = zext i1 %not.cmp99 to i8
  %45 = and i8 %b1_dealloc.1, 1
  %tobool103 = icmp eq i8 %45, 0
  br i1 %tobool103, label %blklab20, label %if.then104

if.then104:                                       ; preds = %if.end97
  %46 = bitcast %struct.Board* %b1.1 to i8**
  %47 = load i8*, i8** %46, align 8, !tbaa !7
  call void @free(i8* %47) #6
  call void @free(i8* %18) #6
  br label %blklab20

blklab22:                                         ; preds = %blklab19
  %cmp106 = icmp eq %struct.Board* %b2.1, null
  br i1 %cmp106, label %blklab20, label %if.end108

if.end108:                                        ; preds = %blklab22
  %pieces109 = getelementptr inbounds %struct.Board, %struct.Board* %b2.1, i64 0, i32 0
  %48 = load i64*, i64** %pieces109, align 8, !tbaa !7
  %arrayidx110 = getelementptr inbounds i64, i64* %48, i64 %32
  store i64 2, i64* %arrayidx110, align 8, !tbaa !10
  %move111 = getelementptr inbounds %struct.Board, %struct.Board* %b2.1, i64 0, i32 2
  %49 = load i64, i64* %move111, align 8, !tbaa !8
  %add112 = add nsw i64 %49, 1
  store i64 %add112, i64* %move111, align 8, !tbaa !8
  %50 = and i8 %b1_dealloc.1, 1
  %tobool114 = icmp eq i8 %50, 0
  br i1 %tobool114, label %if.end116, label %if.then115

if.then115:                                       ; preds = %if.end108
  call void @free(i8* %18) #6
  br label %if.end116

if.end116:                                        ; preds = %if.end108, %if.then115
  %51 = and i8 %b2_dealloc.1, 1
  br label %blklab20

blklab20:                                         ; preds = %if.then104, %if.end97, %blklab22, %if.end116
  %52 = phi i8* [ null, %blklab22 ], [ %19, %if.end116 ], [ null, %if.end97 ], [ null, %if.then104 ]
  %b1.2 = phi %struct.Board* [ null, %blklab22 ], [ %b2.1, %if.end116 ], [ null, %if.end97 ], [ null, %if.then104 ]
  %b1_dealloc.2 = phi i8 [ %b1_dealloc.1, %blklab22 ], [ %51, %if.end116 ], [ 0, %if.end97 ], [ 0, %if.then104 ]
  %53 = phi i8* [ null, %blklab22 ], [ null, %if.end116 ], [ %call.i330, %if.end97 ], [ %call.i330, %if.then104 ]
  %b2.2 = phi %struct.Board* [ null, %blklab22 ], [ null, %if.end116 ], [ %39, %if.end97 ], [ %39, %if.then104 ]
  %b2_dealloc.3 = phi i8 [ %b2_dealloc.1, %blklab22 ], [ 0, %if.end116 ], [ %.306, %if.end97 ], [ %.306, %if.then104 ]
  %add122 = add nuw nsw i64 %i.0, 1
  br label %while.cond44

blklab17:                                         ; preds = %if.end68, %if.end48
  %_18.2 = phi i64* [ %_18.1, %if.end48 ], [ %call69, %if.end68 ]
  %_18_dealloc.3 = phi i8 [ %_18_dealloc.1, %if.end48 ], [ %.305, %if.end68 ]
  %add123 = add nuw nsw i64 %repeat.0309, 1
  %exitcond = icmp eq i64 %add123, %3
  br i1 %exitcond, label %if.end161.loopexit, label %if.end20

if.end161.loopexit:                               ; preds = %blklab17
  br label %if.end161

if.end161:                                        ; preds = %if.end161.loopexit, %if.end14
  %54 = phi i8* [ undef, %if.end14 ], [ %18, %if.end161.loopexit ]
  %b1.0.lcssa = phi %struct.Board* [ undef, %if.end14 ], [ %b1.1, %if.end161.loopexit ]
  %b1_dealloc.0.lcssa = phi i8 [ 0, %if.end14 ], [ %b1_dealloc.1, %if.end161.loopexit ]
  %55 = phi i8* [ undef, %if.end14 ], [ %19, %if.end161.loopexit ]
  %b2.0.lcssa = phi %struct.Board* [ undef, %if.end14 ], [ %b2.1, %if.end161.loopexit ]
  %b2_dealloc.0.lcssa = phi i8 [ 0, %if.end14 ], [ %b2_dealloc.1, %if.end161.loopexit ]
  %_16.0.lcssa = phi i64* [ null, %if.end14 ], [ %call49, %if.end161.loopexit ]
  %_16_dealloc.0.lcssa = phi i8 [ 0, %if.end14 ], [ %.304, %if.end161.loopexit ]
  %_18.0.lcssa = phi i64* [ null, %if.end14 ], [ %_18.2, %if.end161.loopexit ]
  %_18_dealloc.0.lcssa = phi i8 [ 0, %if.end14 ], [ %_18_dealloc.3, %if.end161.loopexit ]
  %call127 = call i64* @create1DArray_int64_t(i64 0, i64 27) #6
  %56 = bitcast i64* %call127 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %56, align 8, !tbaa !10
  %arrayidx130 = getelementptr inbounds i64, i64* %call127, i64 2
  %57 = bitcast i64* %arrayidx130 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %57, align 8, !tbaa !10
  %arrayidx132 = getelementptr inbounds i64, i64* %call127, i64 4
  %58 = bitcast i64* %arrayidx132 to <2 x i64>*
  store <2 x i64> <i64 32, i64 110>, <2 x i64>* %58, align 8, !tbaa !10
  %arrayidx134 = getelementptr inbounds i64, i64* %call127, i64 6
  %59 = bitcast i64* %arrayidx134 to <2 x i64>*
  store <2 x i64> <i64 101, i64 119>, <2 x i64>* %59, align 8, !tbaa !10
  %arrayidx136 = getelementptr inbounds i64, i64* %call127, i64 8
  %60 = bitcast i64* %arrayidx136 to <2 x i64>*
  store <2 x i64> <i64 84, i64 105>, <2 x i64>* %60, align 8, !tbaa !10
  %arrayidx138 = getelementptr inbounds i64, i64* %call127, i64 10
  %61 = bitcast i64* %arrayidx138 to <2 x i64>*
  store <2 x i64> <i64 99, i64 84>, <2 x i64>* %61, align 8, !tbaa !10
  %arrayidx140 = getelementptr inbounds i64, i64* %call127, i64 12
  %62 = bitcast i64* %arrayidx140 to <2 x i64>*
  store <2 x i64> <i64 97, i64 99>, <2 x i64>* %62, align 8, !tbaa !10
  %arrayidx142 = getelementptr inbounds i64, i64* %call127, i64 14
  %63 = bitcast i64* %arrayidx142 to <2 x i64>*
  store <2 x i64> <i64 84, i64 111>, <2 x i64>* %63, align 8, !tbaa !10
  %arrayidx144 = getelementptr inbounds i64, i64* %call127, i64 16
  %64 = bitcast i64* %arrayidx144 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %64, align 8, !tbaa !10
  %arrayidx146 = getelementptr inbounds i64, i64* %call127, i64 18
  %65 = bitcast i64* %arrayidx146 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %65, align 8, !tbaa !10
  %arrayidx148 = getelementptr inbounds i64, i64* %call127, i64 20
  %66 = bitcast i64* %arrayidx148 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %66, align 8, !tbaa !10
  %arrayidx150 = getelementptr inbounds i64, i64* %call127, i64 22
  %67 = bitcast i64* %arrayidx150 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %67, align 8, !tbaa !10
  %arrayidx152 = getelementptr inbounds i64, i64* %call127, i64 24
  %68 = bitcast i64* %arrayidx152 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %68, align 8, !tbaa !10
  %arrayidx154 = getelementptr inbounds i64, i64* %call127, i64 26
  store i64 101, i64* %arrayidx154, align 8, !tbaa !10
  %not.cmp155 = icmp ne i64* %call127, null
  %.307 = zext i1 %not.cmp155 to i8
  call void @println_s(i64* %call127, i64 27) #6
  %phitmp = bitcast i64* %call127 to i8*
  %69 = bitcast i64* %call3 to i8*
  call void @free(i8* %69) #6
  %70 = and i8 %b1_dealloc.0.lcssa, 1
  %tobool162 = icmp eq i8 %70, 0
  br i1 %tobool162, label %if.end164, label %if.then163

if.then163:                                       ; preds = %if.end161
  %71 = bitcast %struct.Board* %b1.0.lcssa to i8**
  %72 = load i8*, i8** %71, align 8, !tbaa !7
  call void @free(i8* %72) #6
  call void @free(i8* %54) #6
  br label %if.end164

if.end164:                                        ; preds = %if.end161, %if.then163
  %73 = and i8 %b2_dealloc.0.lcssa, 1
  %tobool165 = icmp eq i8 %73, 0
  br i1 %tobool165, label %if.end170, label %if.then166

if.then166:                                       ; preds = %if.end164
  %74 = bitcast %struct.Board* %b2.0.lcssa to i8**
  %75 = load i8*, i8** %74, align 8, !tbaa !7
  call void @free(i8* %75) #6
  call void @free(i8* %55) #6
  br label %if.end170

if.end170:                                        ; preds = %entry, %if.then166, %if.end164
  %_38_dealloc.1343345359 = phi i8 [ %.307, %if.then166 ], [ %.307, %if.end164 ], [ 0, %entry ]
  %_38.0342346358 = phi i8* [ %phitmp, %if.then166 ], [ %phitmp, %if.end164 ], [ null, %entry ]
  %_18_dealloc.4341347357 = phi i8 [ %_18_dealloc.0.lcssa, %if.then166 ], [ %_18_dealloc.0.lcssa, %if.end164 ], [ 0, %entry ]
  %_18.3340348356 = phi i64* [ %_18.0.lcssa, %if.then166 ], [ %_18.0.lcssa, %if.end164 ], [ null, %entry ]
  %_16_dealloc.3339349355 = phi i8 [ %_16_dealloc.0.lcssa, %if.then166 ], [ %_16_dealloc.0.lcssa, %if.end164 ], [ 0, %entry ]
  %_16.2338350354 = phi i64* [ %_16.0.lcssa, %if.then166 ], [ %_16.0.lcssa, %if.end164 ], [ null, %entry ]
  br i1 %not.cmp, label %if.end182, label %if.then172

if.then172:                                       ; preds = %if.end170
  %76 = load i64, i64* %_9_size, align 8, !tbaa !10
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %76) #6
  br label %if.end182

if.end182:                                        ; preds = %if.end170, %if.then172
  %77 = and i8 %_16_dealloc.3339349355, 1
  %tobool183 = icmp eq i8 %77, 0
  br i1 %tobool183, label %if.end185, label %if.then184

if.then184:                                       ; preds = %if.end182
  %78 = bitcast i64* %_16.2338350354 to i8*
  call void @free(i8* %78) #6
  br label %if.end185

if.end185:                                        ; preds = %if.end182, %if.then184
  %79 = and i8 %_18_dealloc.4341347357, 1
  %tobool186 = icmp eq i8 %79, 0
  br i1 %tobool186, label %if.end188, label %if.then187

if.then187:                                       ; preds = %if.end185
  %80 = bitcast i64* %_18.3340348356 to i8*
  call void @free(i8* %80) #6
  br label %if.end188

if.end188:                                        ; preds = %if.end185, %if.then187
  %tobool189 = icmp eq i8 %_38_dealloc.1343345359, 0
  br i1 %tobool189, label %if.end191, label %if.then190

if.then190:                                       ; preds = %if.end188
  call void @free(i8* %_38.0342346358) #6
  br label %if.end191

if.end191:                                        ; preds = %if.end188, %if.then190
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
