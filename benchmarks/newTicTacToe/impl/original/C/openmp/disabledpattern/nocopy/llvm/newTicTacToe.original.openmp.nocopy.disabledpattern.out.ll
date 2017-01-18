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
  %call = tail call noalias i8* @malloc(i64 24) #7
  %0 = bitcast i8* %call to %struct.Board*
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %_Board, i64 0, i32 1
  %1 = load i64, i64* %pieces_size, align 8, !tbaa !1
  %pieces_size1 = getelementptr inbounds i8, i8* %call, i64 8
  %2 = bitcast i8* %pieces_size1 to i64*
  store i64 %1, i64* %2, align 8, !tbaa !1
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %_Board, i64 0, i32 0
  %3 = load i64*, i64** %pieces, align 8, !tbaa !7
  %call3 = tail call i64* @copy1DArray_int64_t(i64* %3, i64 %1) #7
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
  %call = tail call noalias i8* @malloc(i64 %mul) #7
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
  %call.i = tail call noalias i8* @malloc(i64 24) #7
  %pieces_size.i = getelementptr inbounds %struct.Board, %struct.Board* %1, i64 0, i32 1
  %2 = load i64, i64* %pieces_size.i, align 8, !tbaa !1
  %pieces_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8
  %3 = bitcast i8* %pieces_size1.i to i64*
  store i64 %2, i64* %3, align 8, !tbaa !1
  %pieces.i = getelementptr inbounds %struct.Board, %struct.Board* %1, i64 0, i32 0
  %4 = load i64*, i64** %pieces.i, align 8, !tbaa !7
  %call3.i = tail call i64* @copy1DArray_int64_t(i64* %4, i64 %2) #7
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
  tail call void @free(i8* %1) #7
  %2 = bitcast %struct.Board* %board to i8*
  tail call void @free(i8* %2) #7
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define void @printf_Board(%struct.Board* nocapture readonly %board) local_unnamed_addr #0 {
entry:
  %putchar = tail call i32 @putchar(i32 123) #7
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0))
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %board, i64 0, i32 0
  %0 = load i64*, i64** %pieces, align 8, !tbaa !7
  %pieces_size = getelementptr inbounds %struct.Board, %struct.Board* %board, i64 0, i32 1
  %1 = load i64, i64* %pieces_size, align 8, !tbaa !1
  tail call void @printf1DArray_int64_t(i64* %0, i64 %1) #7
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0))
  %move = getelementptr inbounds %struct.Board, %struct.Board* %board, i64 0, i32 2
  %2 = load i64, i64* %move, align 8, !tbaa !8
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i64 %2)
  %putchar7 = tail call i32 @putchar(i32 125) #7
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @printf1DArray_int64_t(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define noalias %struct.Board* @_EmptyBoard_() local_unnamed_addr #0 {
entry:
  %call = tail call i64* @create1DArray_int64_t(i64 0, i64 9) #7
  %0 = bitcast i64* %call to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 72, i32 8, i1 false)
  %call9 = tail call noalias i8* @malloc(i64 24) #7
  %1 = bitcast i8* %call9 to %struct.Board*
  %pieces_size = getelementptr inbounds i8, i8* %call9, i64 8
  %2 = bitcast i8* %pieces_size to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %2, align 8, !tbaa !10
  %pieces = bitcast i8* %call9 to i64**
  store i64* %call, i64** %pieces, align 8, !tbaa !7
  ret %struct.Board* %1
}

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #3

; Function Attrs: norecurse nounwind readonly uwtable
define i64 @_countOf_(i64* nocapture readonly %pieces, i64 %pieces_size, i64 %s) local_unnamed_addr #4 {
entry:
  %polly.loop_guard = icmp sgt i64 %pieces_size, 0
  br i1 %polly.loop_guard, label %polly.loop_header.preheader, label %polly.cond22

polly.loop_header.preheader:                      ; preds = %entry
  %0 = add i64 %pieces_size, -1
  %xtraiter = and i64 %pieces_size, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %polly.loop_header.prol.loopexit, label %polly.loop_header.prol.preheader

polly.loop_header.prol.preheader:                 ; preds = %polly.loop_header.preheader
  br label %polly.loop_header.prol

polly.loop_header.prol:                           ; preds = %polly.loop_header.prol, %polly.loop_header.prol.preheader
  %count.021.phiops.1.prol = phi i64 [ %p_add.count.0.prol, %polly.loop_header.prol ], [ 0, %polly.loop_header.prol.preheader ]
  %polly.indvar.prol = phi i64 [ %polly.indvar_next.prol, %polly.loop_header.prol ], [ 0, %polly.loop_header.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %polly.loop_header.prol ], [ %xtraiter, %polly.loop_header.prol.preheader ]
  %scevgep.prol = getelementptr i64, i64* %pieces, i64 %polly.indvar.prol
  %_p_scalar_.prol = load i64, i64* %scevgep.prol, align 8, !alias.scope !11, !noalias !13
  %p_cmp1.prol = icmp eq i64 %_p_scalar_.prol, %s
  %p_add.prol = zext i1 %p_cmp1.prol to i64
  %p_add.count.0.prol = add nsw i64 %p_add.prol, %count.021.phiops.1.prol
  %polly.indvar_next.prol = add nuw nsw i64 %polly.indvar.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %polly.loop_header.prol.loopexit.unr-lcssa, label %polly.loop_header.prol, !llvm.loop !17

polly.loop_header.prol.loopexit.unr-lcssa:        ; preds = %polly.loop_header.prol
  br label %polly.loop_header.prol.loopexit

polly.loop_header.prol.loopexit:                  ; preds = %polly.loop_header.preheader, %polly.loop_header.prol.loopexit.unr-lcssa
  %p_add.count.0.lcssa.unr = phi i64 [ undef, %polly.loop_header.preheader ], [ %p_add.count.0.prol, %polly.loop_header.prol.loopexit.unr-lcssa ]
  %count.021.phiops.1.unr = phi i64 [ 0, %polly.loop_header.preheader ], [ %p_add.count.0.prol, %polly.loop_header.prol.loopexit.unr-lcssa ]
  %polly.indvar.unr = phi i64 [ 0, %polly.loop_header.preheader ], [ %polly.indvar_next.prol, %polly.loop_header.prol.loopexit.unr-lcssa ]
  %1 = icmp ult i64 %0, 3
  br i1 %1, label %polly.cond22.loopexit, label %polly.loop_header.preheader.new

polly.loop_header.preheader.new:                  ; preds = %polly.loop_header.prol.loopexit
  br label %polly.loop_header

polly.cond22.loopexit.unr-lcssa:                  ; preds = %polly.loop_header
  br label %polly.cond22.loopexit

polly.cond22.loopexit:                            ; preds = %polly.loop_header.prol.loopexit, %polly.cond22.loopexit.unr-lcssa
  %p_add.count.0.lcssa = phi i64 [ %p_add.count.0.lcssa.unr, %polly.loop_header.prol.loopexit ], [ %p_add.count.0.3, %polly.cond22.loopexit.unr-lcssa ]
  br label %polly.cond22

polly.cond22:                                     ; preds = %polly.cond22.loopexit, %entry
  %add.count.0.lcssa.phiops.0 = phi i64 [ undef, %entry ], [ %p_add.count.0.lcssa, %polly.cond22.loopexit ]
  %add.count.0.lcssa.phiops.0. = select i1 %polly.loop_guard, i64 %add.count.0.lcssa.phiops.0, i64 0
  ret i64 %add.count.0.lcssa.phiops.0.

polly.loop_header:                                ; preds = %polly.loop_header, %polly.loop_header.preheader.new
  %count.021.phiops.1 = phi i64 [ %count.021.phiops.1.unr, %polly.loop_header.preheader.new ], [ %p_add.count.0.3, %polly.loop_header ]
  %polly.indvar = phi i64 [ %polly.indvar.unr, %polly.loop_header.preheader.new ], [ %polly.indvar_next.3, %polly.loop_header ]
  %scevgep = getelementptr i64, i64* %pieces, i64 %polly.indvar
  %_p_scalar_ = load i64, i64* %scevgep, align 8, !alias.scope !11, !noalias !13
  %p_cmp1 = icmp eq i64 %_p_scalar_, %s
  %p_add = zext i1 %p_cmp1 to i64
  %p_add.count.0 = add nsw i64 %p_add, %count.021.phiops.1
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %scevgep.1 = getelementptr i64, i64* %pieces, i64 %polly.indvar_next
  %_p_scalar_.1 = load i64, i64* %scevgep.1, align 8, !alias.scope !11, !noalias !13
  %p_cmp1.1 = icmp eq i64 %_p_scalar_.1, %s
  %p_add.1 = zext i1 %p_cmp1.1 to i64
  %p_add.count.0.1 = add nsw i64 %p_add.1, %p_add.count.0
  %polly.indvar_next.1 = add nsw i64 %polly.indvar, 2
  %scevgep.2 = getelementptr i64, i64* %pieces, i64 %polly.indvar_next.1
  %_p_scalar_.2 = load i64, i64* %scevgep.2, align 8, !alias.scope !11, !noalias !13
  %p_cmp1.2 = icmp eq i64 %_p_scalar_.2, %s
  %p_add.2 = zext i1 %p_cmp1.2 to i64
  %p_add.count.0.2 = add nsw i64 %p_add.2, %p_add.count.0.1
  %polly.indvar_next.2 = add nsw i64 %polly.indvar, 3
  %scevgep.3 = getelementptr i64, i64* %pieces, i64 %polly.indvar_next.2
  %_p_scalar_.3 = load i64, i64* %scevgep.3, align 8, !alias.scope !11, !noalias !13
  %p_cmp1.3 = icmp eq i64 %_p_scalar_.3, %s
  %p_add.3 = zext i1 %p_cmp1.3 to i64
  %p_add.count.0.3 = add nsw i64 %p_add.3, %p_add.count.0.2
  %polly.indvar_next.3 = add nsw i64 %polly.indvar, 4
  %exitcond.3 = icmp eq i64 %polly.indvar_next.3, %pieces_size
  br i1 %exitcond.3, label %polly.cond22.loopexit.unr-lcssa, label %polly.loop_header
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #5 {
entry:
  %_9_size = alloca i64, align 8
  %_9_size_size = alloca i64, align 8
  %0 = bitcast i64* %_9_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #7
  store i64 0, i64* %_9_size, align 8, !tbaa !10
  %1 = bitcast i64* %_9_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #7
  store i64 0, i64* %_9_size_size, align 8, !tbaa !10
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_9_size, i64* nonnull %_9_size_size) #7
  %2 = load i64*, i64** %call, align 8, !tbaa !9
  %call1 = call i64* @parseStringToInt(i64* %2) #7
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %blklab14, label %if.end

if.end:                                           ; preds = %entry
  %3 = load i64, i64* %call1, align 8, !tbaa !10
  %cmp2156 = icmp sgt i64 %3, 0
  br i1 %cmp2156, label %if.end4.preheader, label %blklab15

if.end4.preheader:                                ; preds = %if.end
  br label %if.end4

if.end4:                                          ; preds = %if.end4.preheader, %blklab17
  %repeat.0157 = phi i64 [ %add54, %blklab17 ], [ 0, %if.end4.preheader ]
  %call.i = call i64* @create1DArray_int64_t(i64 0, i64 9) #7
  %4 = bitcast i64* %call.i to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 72, i32 8, i1 false) #7
  %call9.i = call noalias i8* @malloc(i64 24) #7
  %5 = bitcast i8* %call9.i to %struct.Board*
  %pieces_size.i = getelementptr inbounds i8, i8* %call9.i, i64 8
  %6 = bitcast i8* %pieces_size.i to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %6, align 8, !tbaa !10
  %pieces.i = bitcast i8* %call9.i to i64**
  store i64* %call.i, i64** %pieces.i, align 8, !tbaa !7
  %call.i158 = call i64* @create1DArray_int64_t(i64 0, i64 9) #7
  %7 = bitcast i64* %call.i158 to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 72, i32 8, i1 false) #7
  %call9.i159 = call noalias i8* @malloc(i64 24) #7
  %8 = bitcast i8* %call9.i159 to %struct.Board*
  %pieces_size.i161 = getelementptr inbounds i8, i8* %call9.i159, i64 8
  %9 = bitcast i8* %pieces_size.i161 to <2 x i64>*
  store <2 x i64> <i64 9, i64 0>, <2 x i64>* %9, align 8, !tbaa !10
  %pieces.i162 = bitcast i8* %call9.i159 to i64**
  store i64* %call.i158, i64** %pieces.i162, align 8, !tbaa !7
  %call9144 = call i64* @create1DArray_int64_t(i64 0, i64 9) #7
  %10 = bitcast i64* %call9144 to <2 x i64>*
  store <2 x i64> <i64 0, i64 1>, <2 x i64>* %10, align 8, !tbaa !10
  %arrayidx12146 = getelementptr inbounds i64, i64* %call9144, i64 2
  %11 = bitcast i64* %arrayidx12146 to <2 x i64>*
  store <2 x i64> <i64 2, i64 3>, <2 x i64>* %11, align 8, !tbaa !10
  %arrayidx14148 = getelementptr inbounds i64, i64* %call9144, i64 4
  %12 = bitcast i64* %arrayidx14148 to <2 x i64>*
  store <2 x i64> <i64 4, i64 5>, <2 x i64>* %12, align 8, !tbaa !10
  %arrayidx16150 = getelementptr inbounds i64, i64* %call9144, i64 6
  %13 = bitcast i64* %arrayidx16150 to <2 x i64>*
  store <2 x i64> <i64 6, i64 7>, <2 x i64>* %13, align 8, !tbaa !10
  %arrayidx18152 = getelementptr inbounds i64, i64* %call9144, i64 8
  store i64 8, i64* %arrayidx18152, align 8, !tbaa !10
  br label %if.end21

if.end21:                                         ; preds = %if.end4, %blklab20
  %b1.0155 = phi %struct.Board* [ %5, %if.end4 ], [ %b1.1, %blklab20 ]
  %b2.0154 = phi %struct.Board* [ %8, %if.end4 ], [ %b2.1, %blklab20 ]
  %i.0153 = phi i64 [ 0, %if.end4 ], [ %add53, %blklab20 ]
  %call22 = call i64* @create1DArray_int64_t(i64 0, i64 9) #7
  %14 = bitcast i64* %call22 to <2 x i64>*
  store <2 x i64> <i64 0, i64 1>, <2 x i64>* %14, align 8, !tbaa !10
  %arrayidx25 = getelementptr inbounds i64, i64* %call22, i64 2
  %15 = bitcast i64* %arrayidx25 to <2 x i64>*
  store <2 x i64> <i64 2, i64 3>, <2 x i64>* %15, align 8, !tbaa !10
  %arrayidx27 = getelementptr inbounds i64, i64* %call22, i64 4
  %16 = bitcast i64* %arrayidx27 to <2 x i64>*
  store <2 x i64> <i64 4, i64 5>, <2 x i64>* %16, align 8, !tbaa !10
  %arrayidx29 = getelementptr inbounds i64, i64* %call22, i64 6
  %17 = bitcast i64* %arrayidx29 to <2 x i64>*
  store <2 x i64> <i64 6, i64 7>, <2 x i64>* %17, align 8, !tbaa !10
  %arrayidx31 = getelementptr inbounds i64, i64* %call22, i64 8
  store i64 8, i64* %arrayidx31, align 8, !tbaa !10
  %arrayidx32 = getelementptr inbounds i64, i64* %call22, i64 %i.0153
  %18 = load i64, i64* %arrayidx32, align 8, !tbaa !10
  %19 = icmp ult i64 %18, 10
  br i1 %19, label %blklab19, label %blklab17

blklab19:                                         ; preds = %if.end21
  %cmp39 = icmp eq %struct.Board* %b1.0155, null
  br i1 %cmp39, label %blklab22, label %if.end41

if.end41:                                         ; preds = %blklab19
  %pieces = getelementptr inbounds %struct.Board, %struct.Board* %b1.0155, i64 0, i32 0
  %20 = load i64*, i64** %pieces, align 8, !tbaa !7
  %arrayidx42 = getelementptr inbounds i64, i64* %20, i64 %18
  store i64 1, i64* %arrayidx42, align 8, !tbaa !10
  %move = getelementptr inbounds %struct.Board, %struct.Board* %b1.0155, i64 0, i32 2
  %21 = load i64, i64* %move, align 8, !tbaa !8
  %add = add nsw i64 %21, 1
  store i64 %add, i64* %move, align 8, !tbaa !8
  %call.i163 = call noalias i8* @malloc(i64 24) #7
  %22 = bitcast i8* %call.i163 to %struct.Board*
  %pieces_size.i164 = getelementptr inbounds %struct.Board, %struct.Board* %b1.0155, i64 0, i32 1
  %23 = load i64, i64* %pieces_size.i164, align 8, !tbaa !1
  %pieces_size1.i = getelementptr inbounds i8, i8* %call.i163, i64 8
  %24 = bitcast i8* %pieces_size1.i to i64*
  store i64 %23, i64* %24, align 8, !tbaa !1
  %25 = load i64*, i64** %pieces, align 8, !tbaa !7
  %call3.i = call i64* @copy1DArray_int64_t(i64* %25, i64 %23) #7
  %pieces4.i = bitcast i8* %call.i163 to i64**
  store i64* %call3.i, i64** %pieces4.i, align 8, !tbaa !7
  %26 = load i64, i64* %move, align 8, !tbaa !8
  %move5.i = getelementptr inbounds i8, i8* %call.i163, i64 16
  %27 = bitcast i8* %move5.i to i64*
  store i64 %26, i64* %27, align 8, !tbaa !8
  br label %blklab20

blklab22:                                         ; preds = %blklab19
  %cmp45 = icmp eq %struct.Board* %b2.0154, null
  br i1 %cmp45, label %blklab20, label %if.end47

if.end47:                                         ; preds = %blklab22
  %pieces48 = getelementptr inbounds %struct.Board, %struct.Board* %b2.0154, i64 0, i32 0
  %28 = load i64*, i64** %pieces48, align 8, !tbaa !7
  %arrayidx49 = getelementptr inbounds i64, i64* %28, i64 %18
  store i64 2, i64* %arrayidx49, align 8, !tbaa !10
  %move50 = getelementptr inbounds %struct.Board, %struct.Board* %b2.0154, i64 0, i32 2
  %29 = load i64, i64* %move50, align 8, !tbaa !8
  %add51 = add nsw i64 %29, 1
  store i64 %add51, i64* %move50, align 8, !tbaa !8
  br label %blklab20

blklab20:                                         ; preds = %if.end41, %blklab22, %if.end47
  %b2.1 = phi %struct.Board* [ null, %blklab22 ], [ null, %if.end47 ], [ %22, %if.end41 ]
  %b1.1 = phi %struct.Board* [ null, %blklab22 ], [ %b2.0154, %if.end47 ], [ null, %if.end41 ]
  %add53 = add nuw nsw i64 %i.0153, 1
  %call9 = call i64* @create1DArray_int64_t(i64 0, i64 9) #7
  %30 = bitcast i64* %call9 to <2 x i64>*
  store <2 x i64> <i64 0, i64 1>, <2 x i64>* %30, align 8, !tbaa !10
  %arrayidx12 = getelementptr inbounds i64, i64* %call9, i64 2
  %31 = bitcast i64* %arrayidx12 to <2 x i64>*
  store <2 x i64> <i64 2, i64 3>, <2 x i64>* %31, align 8, !tbaa !10
  %arrayidx14 = getelementptr inbounds i64, i64* %call9, i64 4
  %32 = bitcast i64* %arrayidx14 to <2 x i64>*
  store <2 x i64> <i64 4, i64 5>, <2 x i64>* %32, align 8, !tbaa !10
  %arrayidx16 = getelementptr inbounds i64, i64* %call9, i64 6
  %33 = bitcast i64* %arrayidx16 to <2 x i64>*
  store <2 x i64> <i64 6, i64 7>, <2 x i64>* %33, align 8, !tbaa !10
  %arrayidx18 = getelementptr inbounds i64, i64* %call9, i64 8
  store i64 8, i64* %arrayidx18, align 8, !tbaa !10
  %cmp19 = icmp sgt i64 %i.0153, 7
  br i1 %cmp19, label %blklab17, label %if.end21

blklab17:                                         ; preds = %if.end21, %blklab20
  %add54 = add nuw nsw i64 %repeat.0157, 1
  %exitcond = icmp eq i64 %add54, %3
  br i1 %exitcond, label %blklab15.loopexit, label %if.end4

blklab15.loopexit:                                ; preds = %blklab17
  br label %blklab15

blklab15:                                         ; preds = %blklab15.loopexit, %if.end
  %call55 = call i64* @create1DArray_int64_t(i64 0, i64 27) #7
  %34 = bitcast i64* %call55 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %34, align 8, !tbaa !10
  %arrayidx58 = getelementptr inbounds i64, i64* %call55, i64 2
  %35 = bitcast i64* %arrayidx58 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %35, align 8, !tbaa !10
  %arrayidx60 = getelementptr inbounds i64, i64* %call55, i64 4
  %36 = bitcast i64* %arrayidx60 to <2 x i64>*
  store <2 x i64> <i64 32, i64 110>, <2 x i64>* %36, align 8, !tbaa !10
  %arrayidx62 = getelementptr inbounds i64, i64* %call55, i64 6
  %37 = bitcast i64* %arrayidx62 to <2 x i64>*
  store <2 x i64> <i64 101, i64 119>, <2 x i64>* %37, align 8, !tbaa !10
  %arrayidx64 = getelementptr inbounds i64, i64* %call55, i64 8
  %38 = bitcast i64* %arrayidx64 to <2 x i64>*
  store <2 x i64> <i64 84, i64 105>, <2 x i64>* %38, align 8, !tbaa !10
  %arrayidx66 = getelementptr inbounds i64, i64* %call55, i64 10
  %39 = bitcast i64* %arrayidx66 to <2 x i64>*
  store <2 x i64> <i64 99, i64 84>, <2 x i64>* %39, align 8, !tbaa !10
  %arrayidx68 = getelementptr inbounds i64, i64* %call55, i64 12
  %40 = bitcast i64* %arrayidx68 to <2 x i64>*
  store <2 x i64> <i64 97, i64 99>, <2 x i64>* %40, align 8, !tbaa !10
  %arrayidx70 = getelementptr inbounds i64, i64* %call55, i64 14
  %41 = bitcast i64* %arrayidx70 to <2 x i64>*
  store <2 x i64> <i64 84, i64 111>, <2 x i64>* %41, align 8, !tbaa !10
  %arrayidx72 = getelementptr inbounds i64, i64* %call55, i64 16
  %42 = bitcast i64* %arrayidx72 to <2 x i64>*
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %42, align 8, !tbaa !10
  %arrayidx74 = getelementptr inbounds i64, i64* %call55, i64 18
  %43 = bitcast i64* %arrayidx74 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %43, align 8, !tbaa !10
  %arrayidx76 = getelementptr inbounds i64, i64* %call55, i64 20
  %44 = bitcast i64* %arrayidx76 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %44, align 8, !tbaa !10
  %arrayidx78 = getelementptr inbounds i64, i64* %call55, i64 22
  %45 = bitcast i64* %arrayidx78 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %45, align 8, !tbaa !10
  %arrayidx80 = getelementptr inbounds i64, i64* %call55, i64 24
  %46 = bitcast i64* %arrayidx80 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %46, align 8, !tbaa !10
  %arrayidx82 = getelementptr inbounds i64, i64* %call55, i64 26
  store i64 101, i64* %arrayidx82, align 8, !tbaa !10
  call void @println_s(i64* %call55, i64 27) #7
  br label %blklab14

blklab14:                                         ; preds = %entry, %blklab15
  call void @exit(i32 0) #8
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #6

declare i32 @putchar(i32) local_unnamed_addr

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

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
!11 = distinct !{!11, !12, !"polly.alias.scope.pieces"}
!12 = distinct !{!12, !"polly.alias.scope.domain"}
!13 = !{!14, !15, !16}
!14 = distinct !{!14, !12, !"polly.alias.scope.count.021"}
!15 = distinct !{!15, !12, !"polly.alias.scope.count.0.lcssa"}
!16 = distinct !{!16, !12, !"polly.alias.scope.add.count.0.lcssa"}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
