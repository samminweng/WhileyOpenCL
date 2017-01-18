; ModuleID = 'BubbleSort_original.c'
source_filename = "BubbleSort_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define i64* @_bubbleSort_(i64* returned %items, i64 %items_size, i1 zeroext %items_dealloc, i64* nocapture %_size_call_by_ref) local_unnamed_addr #0 {
entry:
  %cmp77 = icmp slt i64 %items_size, 1
  br i1 %cmp77, label %if.end34, label %while.cond18.preheader.lr.ph

while.cond18.preheader.lr.ph:                     ; preds = %entry
  %scevgep80 = getelementptr i64, i64* %items, i64 1
  br label %while.cond18.preheader

while.cond.loopexit:                              ; preds = %polly.stmt.blklab4
  %cmp = icmp slt i64 %polly.last_swapped.1, 1
  br i1 %cmp, label %if.end34.loopexit, label %while.cond18.preheader

while.cond18.preheader:                           ; preds = %while.cond18.preheader.lr.ph, %while.cond.loopexit
  %length.078 = phi i64 [ %items_size, %while.cond18.preheader.lr.ph ], [ %polly.last_swapped.1, %while.cond.loopexit ]
  %cmp2074 = icmp sgt i64 %length.078, 1
  br i1 %cmp2074, label %polly.loop_header.preheader, label %if.end34.loopexit

polly.loop_header.preheader:                      ; preds = %while.cond18.preheader
  %0 = add nsw i64 %length.078, -1
  br label %polly.loop_header

if.end34.loopexit:                                ; preds = %while.cond.loopexit, %while.cond18.preheader
  br label %if.end34

if.end34:                                         ; preds = %if.end34.loopexit, %entry
  store i64 %items_size, i64* %_size_call_by_ref, align 8, !tbaa !1
  ret i64* %items

polly.loop_header:                                ; preds = %polly.stmt.blklab4, %polly.loop_header.preheader
  %last_swapped.075.phiops.0 = phi i64 [ %polly.last_swapped.1, %polly.stmt.blklab4 ], [ 0, %polly.loop_header.preheader ]
  %polly.indvar = phi i64 [ %polly.indvar_next.pre-phi, %polly.stmt.blklab4 ], [ 0, %polly.loop_header.preheader ]
  %scevgep = getelementptr i64, i64* %items, i64 %polly.indvar
  %_p_scalar_ = load i64, i64* %scevgep, align 8, !alias.scope !5, !noalias !7
  %scevgep81 = getelementptr i64, i64* %scevgep80, i64 %polly.indvar
  %_p_scalar_82 = load i64, i64* %scevgep81, align 8, !alias.scope !5, !noalias !7
  %p_cmp24 = icmp sgt i64 %_p_scalar_, %_p_scalar_82
  br i1 %p_cmp24, label %polly.stmt.if.end26, label %polly.loop_header.polly.stmt.blklab4_crit_edge

polly.loop_header.polly.stmt.blklab4_crit_edge:   ; preds = %polly.loop_header
  %.pre = add nuw nsw i64 %polly.indvar, 1
  br label %polly.stmt.blklab4

polly.stmt.if.end26:                              ; preds = %polly.loop_header
  store i64 %_p_scalar_82, i64* %scevgep, align 8, !alias.scope !5, !noalias !7
  store i64 %_p_scalar_, i64* %scevgep81, align 8, !alias.scope !5, !noalias !7
  %1 = add nuw i64 %polly.indvar, 1
  br label %polly.stmt.blklab4

polly.stmt.blklab4:                               ; preds = %polly.loop_header.polly.stmt.blklab4_crit_edge, %polly.stmt.if.end26
  %polly.indvar_next.pre-phi = phi i64 [ %.pre, %polly.loop_header.polly.stmt.blklab4_crit_edge ], [ %1, %polly.stmt.if.end26 ]
  %polly.last_swapped.1 = phi i64 [ %last_swapped.075.phiops.0, %polly.loop_header.polly.stmt.blklab4_crit_edge ], [ %1, %polly.stmt.if.end26 ]
  %exitcond = icmp eq i64 %polly.indvar_next.pre-phi, %0
  br i1 %exitcond, label %while.cond.loopexit, label %polly.loop_header
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #3 {
entry:
  %polly.par.LBPtr.i = alloca i64, align 8
  %polly.par.UBPtr.i = alloca i64, align 8
  %polly.par.userContext = alloca { i64, i64* }, align 8
  %_6_size = alloca i64, align 8
  %_6_size_size = alloca i64, align 8
  %0 = bitcast i64* %_6_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #7
  store i64 0, i64* %_6_size, align 8, !tbaa !1
  %1 = bitcast i64* %_6_size_size to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #7
  store i64 0, i64* %_6_size_size, align 8, !tbaa !1
  %call = call i64** @convertArgsToIntArray(i32 %argc, i8** %args, i64* nonnull %_6_size, i64* nonnull %_6_size_size) #7
  %not.cmp = icmp eq i64** %call, null
  %2 = load i64*, i64** %call, align 8, !tbaa !11
  %call3 = call i64* @parseStringToInt(i64* %2) #7
  %not.cmp4 = icmp eq i64* %call3, null
  %3 = load i64, i64* %call3, align 8, !tbaa !1
  %call22 = call i64* @create1DArray_int64_t(i64 0, i64 %3) #7
  %not.cmp23 = icmp eq i64* %call22, null
  %call30 = call i64* @copy1DArray_int64_t(i64* %call22, i64 %3) #7
  %cmp35201 = icmp slt i64 %3, 0
  br i1 %cmp35201, label %if.end42.thread, label %polly.split_new_and_old203

if.end42.thread:                                  ; preds = %entry
  %call43211 = call i64* @copy1DArray_int64_t(i64* %call30, i64 %3) #7
  br label %polly.split_new_and_old

polly.split_new_and_old203:                       ; preds = %entry
  %4 = icmp eq i64 %3, 9223372036854775807
  br i1 %4, label %vector.body.preheader, label %polly.parallel.for

vector.body.preheader:                            ; preds = %polly.split_new_and_old203
  br i1 false, label %vector.body.prol.preheader, label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  br i1 false, label %vector.body.prol, label %vector.body.prol.loopexit.unr-lcssa, !llvm.loop !13

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa, %vector.body.preheader
  br i1 false, label %if.end42.loopexit, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ 0, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %vec.ind = phi <2 x i64> [ <i64 0, i64 1>, %vector.body.preheader.new ], [ %vec.ind.next.3, %vector.body ]
  %5 = sub nsw <2 x i64> <i64 9223372036854775807, i64 9223372036854775807>, %vec.ind
  %6 = sub <2 x i64> <i64 9223372036854775805, i64 9223372036854775805>, %vec.ind
  %7 = getelementptr inbounds i64, i64* %call30, i64 %index
  %8 = bitcast i64* %7 to <2 x i64>*
  store <2 x i64> %5, <2 x i64>* %8, align 8, !tbaa !1
  %9 = getelementptr i64, i64* %7, i64 2
  %10 = bitcast i64* %9 to <2 x i64>*
  store <2 x i64> %6, <2 x i64>* %10, align 8, !tbaa !1
  %index.next = or i64 %index, 4
  %11 = sub <2 x i64> <i64 9223372036854775803, i64 9223372036854775803>, %vec.ind
  %12 = sub <2 x i64> <i64 9223372036854775801, i64 9223372036854775801>, %vec.ind
  %13 = getelementptr inbounds i64, i64* %call30, i64 %index.next
  %14 = bitcast i64* %13 to <2 x i64>*
  store <2 x i64> %11, <2 x i64>* %14, align 8, !tbaa !1
  %15 = getelementptr i64, i64* %13, i64 2
  %16 = bitcast i64* %15 to <2 x i64>*
  store <2 x i64> %12, <2 x i64>* %16, align 8, !tbaa !1
  %index.next.1 = or i64 %index, 8
  %17 = sub <2 x i64> <i64 9223372036854775799, i64 9223372036854775799>, %vec.ind
  %18 = sub <2 x i64> <i64 9223372036854775797, i64 9223372036854775797>, %vec.ind
  %19 = getelementptr inbounds i64, i64* %call30, i64 %index.next.1
  %20 = bitcast i64* %19 to <2 x i64>*
  store <2 x i64> %17, <2 x i64>* %20, align 8, !tbaa !1
  %21 = getelementptr i64, i64* %19, i64 2
  %22 = bitcast i64* %21 to <2 x i64>*
  store <2 x i64> %18, <2 x i64>* %22, align 8, !tbaa !1
  %index.next.2 = or i64 %index, 12
  %23 = sub <2 x i64> <i64 9223372036854775795, i64 9223372036854775795>, %vec.ind
  %24 = sub <2 x i64> <i64 9223372036854775793, i64 9223372036854775793>, %vec.ind
  %25 = getelementptr inbounds i64, i64* %call30, i64 %index.next.2
  %26 = bitcast i64* %25 to <2 x i64>*
  store <2 x i64> %23, <2 x i64>* %26, align 8, !tbaa !1
  %27 = getelementptr i64, i64* %25, i64 2
  %28 = bitcast i64* %27 to <2 x i64>*
  store <2 x i64> %24, <2 x i64>* %28, align 8, !tbaa !1
  %index.next.3 = add i64 %index, 16
  %vec.ind.next.3 = add <2 x i64> %vec.ind, <i64 16, i64 16>
  %29 = icmp eq i64 %index.next.3, -9223372036854775808
  br i1 %29, label %if.end42.loopexit.unr-lcssa, label %vector.body, !llvm.loop !15

if.end42.loopexit.unr-lcssa:                      ; preds = %vector.body
  br label %if.end42.loopexit

if.end42.loopexit:                                ; preds = %vector.body.prol.loopexit, %if.end42.loopexit.unr-lcssa
  br label %if.end42

if.end42:                                         ; preds = %if.end42.loopexit, %main_polly_subfn.exit
  %call43 = call i64* @copy1DArray_int64_t(i64* %call30, i64 %3) #7
  %cmp77.i = icmp slt i64 %3, 1
  br i1 %cmp77.i, label %polly.split_new_and_old, label %while.cond18.preheader.lr.ph.i

while.cond18.preheader.lr.ph.i:                   ; preds = %if.end42
  %scevgep80.i = getelementptr i64, i64* %call43, i64 1
  br label %while.cond18.preheader.i

while.cond.loopexit.i:                            ; preds = %polly.stmt.blklab4.i
  %cmp.i = icmp slt i64 %polly.last_swapped.1.i, 1
  br i1 %cmp.i, label %polly.split_new_and_old.loopexit, label %while.cond18.preheader.i

while.cond18.preheader.i:                         ; preds = %while.cond.loopexit.i, %while.cond18.preheader.lr.ph.i
  %length.078.i = phi i64 [ %3, %while.cond18.preheader.lr.ph.i ], [ %polly.last_swapped.1.i, %while.cond.loopexit.i ]
  %cmp2074.i = icmp sgt i64 %length.078.i, 1
  br i1 %cmp2074.i, label %polly.loop_header.preheader.i, label %polly.split_new_and_old.loopexit

polly.loop_header.preheader.i:                    ; preds = %while.cond18.preheader.i
  %30 = add nsw i64 %length.078.i, -1
  br label %polly.loop_header.i

polly.loop_header.i:                              ; preds = %polly.stmt.blklab4.i, %polly.loop_header.preheader.i
  %last_swapped.075.phiops.0.i = phi i64 [ %polly.last_swapped.1.i, %polly.stmt.blklab4.i ], [ 0, %polly.loop_header.preheader.i ]
  %polly.indvar.i = phi i64 [ %polly.indvar_next.pre-phi.i, %polly.stmt.blklab4.i ], [ 0, %polly.loop_header.preheader.i ]
  %scevgep.i = getelementptr i64, i64* %call43, i64 %polly.indvar.i
  %_p_scalar_.i = load i64, i64* %scevgep.i, align 8, !alias.scope !18, !noalias !20
  %scevgep81.i = getelementptr i64, i64* %scevgep80.i, i64 %polly.indvar.i
  %_p_scalar_82.i = load i64, i64* %scevgep81.i, align 8, !alias.scope !18, !noalias !20
  %p_cmp24.i = icmp sgt i64 %_p_scalar_.i, %_p_scalar_82.i
  br i1 %p_cmp24.i, label %polly.stmt.if.end26.i, label %polly.loop_header.polly.stmt.blklab4_crit_edge.i

polly.loop_header.polly.stmt.blklab4_crit_edge.i: ; preds = %polly.loop_header.i
  %.pre.i = add nuw nsw i64 %polly.indvar.i, 1
  br label %polly.stmt.blklab4.i

polly.stmt.if.end26.i:                            ; preds = %polly.loop_header.i
  store i64 %_p_scalar_82.i, i64* %scevgep.i, align 8, !alias.scope !18, !noalias !20
  store i64 %_p_scalar_.i, i64* %scevgep81.i, align 8, !alias.scope !18, !noalias !20
  %31 = add nuw i64 %polly.indvar.i, 1
  br label %polly.stmt.blklab4.i

polly.stmt.blklab4.i:                             ; preds = %polly.stmt.if.end26.i, %polly.loop_header.polly.stmt.blklab4_crit_edge.i
  %polly.indvar_next.pre-phi.i = phi i64 [ %.pre.i, %polly.loop_header.polly.stmt.blklab4_crit_edge.i ], [ %31, %polly.stmt.if.end26.i ]
  %polly.last_swapped.1.i = phi i64 [ %last_swapped.075.phiops.0.i, %polly.loop_header.polly.stmt.blklab4_crit_edge.i ], [ %31, %polly.stmt.if.end26.i ]
  %exitcond.i = icmp eq i64 %polly.indvar_next.pre-phi.i, %30
  br i1 %exitcond.i, label %while.cond.loopexit.i, label %polly.loop_header.i

polly.split_new_and_old.loopexit:                 ; preds = %while.cond.loopexit.i, %while.cond18.preheader.i
  br label %polly.split_new_and_old

polly.split_new_and_old:                          ; preds = %polly.split_new_and_old.loopexit, %if.end42, %if.end42.thread
  %call43213 = phi i64* [ %call43211, %if.end42.thread ], [ %call43, %if.end42 ], [ %call43, %polly.split_new_and_old.loopexit ]
  %32 = icmp eq i64* %call30, null
  %p_not.cmp48 = icmp eq i64* %call43213, null
  br i1 %32, label %blklab5, label %if.end47

if.end47:                                         ; preds = %polly.split_new_and_old
  %33 = bitcast i64* %call30 to i8*
  call void @free(i8* %33) #7
  br label %blklab5

blklab5:                                          ; preds = %if.end47, %polly.split_new_and_old
  %call55 = call i64* @copy1DArray_int64_t(i64* %call43213, i64 %3) #7
  %not.cmp56 = icmp eq i64* %call55, null
  %34 = load i64, i64* %call55, align 8, !tbaa !1
  %call61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %34)
  %sub62 = add nsw i64 %3, -1
  %arrayidx63 = getelementptr inbounds i64, i64* %call55, i64 %sub62
  %35 = load i64, i64* %arrayidx63, align 8, !tbaa !1
  %call64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %35)
  %call68 = call i64* @create1DArray_int64_t(i64 0, i64 25) #7
  %36 = bitcast i64* %call68 to <2 x i64>*
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %36, align 8, !tbaa !1
  %arrayidx71 = getelementptr inbounds i64, i64* %call68, i64 2
  %37 = bitcast i64* %arrayidx71 to <2 x i64>*
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %37, align 8, !tbaa !1
  %arrayidx73 = getelementptr inbounds i64, i64* %call68, i64 4
  %38 = bitcast i64* %arrayidx73 to <2 x i64>*
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %38, align 8, !tbaa !1
  %arrayidx75 = getelementptr inbounds i64, i64* %call68, i64 6
  %39 = bitcast i64* %arrayidx75 to <2 x i64>*
  store <2 x i64> <i64 117, i64 98>, <2 x i64>* %39, align 8, !tbaa !1
  %arrayidx77 = getelementptr inbounds i64, i64* %call68, i64 8
  %40 = bitcast i64* %arrayidx77 to <2 x i64>*
  store <2 x i64> <i64 98, i64 108>, <2 x i64>* %40, align 8, !tbaa !1
  %arrayidx79 = getelementptr inbounds i64, i64* %call68, i64 10
  %41 = bitcast i64* %arrayidx79 to <2 x i64>*
  store <2 x i64> <i64 101, i64 83>, <2 x i64>* %41, align 8, !tbaa !1
  %arrayidx81 = getelementptr inbounds i64, i64* %call68, i64 12
  %42 = bitcast i64* %arrayidx81 to <2 x i64>*
  store <2 x i64> <i64 111, i64 114>, <2 x i64>* %42, align 8, !tbaa !1
  %arrayidx83 = getelementptr inbounds i64, i64* %call68, i64 14
  %43 = bitcast i64* %arrayidx83 to <2 x i64>*
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %43, align 8, !tbaa !1
  %arrayidx85 = getelementptr inbounds i64, i64* %call68, i64 16
  %44 = bitcast i64* %arrayidx85 to <2 x i64>*
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %44, align 8, !tbaa !1
  %arrayidx87 = getelementptr inbounds i64, i64* %call68, i64 18
  %45 = bitcast i64* %arrayidx87 to <2 x i64>*
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %45, align 8, !tbaa !1
  %arrayidx89 = getelementptr inbounds i64, i64* %call68, i64 20
  %46 = bitcast i64* %arrayidx89 to <2 x i64>*
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %46, align 8, !tbaa !1
  %arrayidx91 = getelementptr inbounds i64, i64* %call68, i64 22
  %47 = bitcast i64* %arrayidx91 to <2 x i64>*
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %47, align 8, !tbaa !1
  %arrayidx93 = getelementptr inbounds i64, i64* %call68, i64 24
  store i64 101, i64* %arrayidx93, align 8, !tbaa !1
  %not.cmp94 = icmp eq i64* %call68, null
  call void @println_s(i64* %call68, i64 25) #7
  %phitmp = bitcast i64* %call68 to i8*
  %phitmp195 = bitcast i64* %call43213 to i8*
  %phitmp196 = bitcast i64* %call22 to i8*
  br i1 %not.cmp56, label %if.end103, label %if.then102

if.then102:                                       ; preds = %blklab5
  %phitmp197 = bitcast i64* %call55 to i8*
  call void @free(i8* %phitmp197) #7
  br label %if.end103

if.end103:                                        ; preds = %blklab5, %if.then102
  br i1 %not.cmp4, label %if.end106, label %if.then105

if.then105:                                       ; preds = %if.end103
  %48 = bitcast i64* %call3 to i8*
  call void @free(i8* %48) #7
  br label %if.end106

if.end106:                                        ; preds = %if.end103, %if.then105
  br i1 %not.cmp, label %if.end112, label %if.then108

if.then108:                                       ; preds = %if.end106
  %49 = load i64, i64* %_6_size, align 8, !tbaa !1
  call void @free2DArray_int64_t(i64** nonnull %call, i64 %49) #7
  br label %if.end112

if.end112:                                        ; preds = %if.end106, %if.then108
  br i1 %not.cmp23, label %if.end115, label %if.then114

if.then114:                                       ; preds = %if.end112
  call void @free(i8* %phitmp196) #7
  br label %if.end115

if.end115:                                        ; preds = %if.end112, %if.then114
  br i1 %p_not.cmp48, label %if.end118, label %if.then117

if.then117:                                       ; preds = %if.end115
  call void @free(i8* %phitmp195) #7
  br label %if.end118

if.end118:                                        ; preds = %if.end115, %if.then117
  br i1 %not.cmp94, label %if.end121, label %if.then120

if.then120:                                       ; preds = %if.end118
  call void @free(i8* %phitmp) #7
  br label %if.end121

if.end121:                                        ; preds = %if.end118, %if.then120
  call void @exit(i32 0) #8
  unreachable

polly.parallel.for:                               ; preds = %polly.split_new_and_old203
  %50 = bitcast { i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 16, i8* nonnull %50)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %3, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.call30 = getelementptr inbounds { i64, i64* }, { i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call30, i64** %polly.subfn.storeaddr.call30, align 8
  %51 = add nuw nsw i64 %3, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @main_polly_subfn, i8* nonnull %50, i32 0, i64 0, i64 %51, i64 1) #7
  %52 = bitcast i64* %polly.par.LBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %52)
  %53 = bitcast i64* %polly.par.UBPtr.i to i8*
  call void @llvm.lifetime.start(i64 8, i8* nonnull %53)
  %polly.subfunc.arg..i = load i64, i64* %polly.subfn.storeaddr., align 8
  %polly.subfunc.arg.call30.i = load i64*, i64** %polly.subfn.storeaddr.call30, align 8
  %54 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #7
  %55 = icmp eq i8 %54, 0
  br i1 %55, label %main_polly_subfn.exit, label %polly.par.loadIVBounds.i.preheader

polly.par.loadIVBounds.i.preheader:               ; preds = %polly.parallel.for
  br label %polly.par.loadIVBounds.i

polly.par.checkNext.loopexit.i:                   ; preds = %polly.loop_header.i210
  %56 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr.i, i64* nonnull %polly.par.UBPtr.i) #7
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %main_polly_subfn.exit.loopexit, label %polly.par.loadIVBounds.i

polly.par.loadIVBounds.i:                         ; preds = %polly.par.loadIVBounds.i.preheader, %polly.par.checkNext.loopexit.i
  %polly.par.UB.i = load i64, i64* %polly.par.UBPtr.i, align 8
  %polly.par.LB.i = load i64, i64* %polly.par.LBPtr.i, align 8
  %polly.adjust_ub.i = add i64 %polly.par.UB.i, -2
  br label %polly.loop_header.i210

polly.loop_header.i210:                           ; preds = %polly.loop_header.i210, %polly.par.loadIVBounds.i
  %polly.indvar.i208 = phi i64 [ %polly.par.LB.i, %polly.par.loadIVBounds.i ], [ %polly.indvar_next.i, %polly.loop_header.i210 ]
  %scevgep.i209 = getelementptr i64, i64* %polly.subfunc.arg.call30.i, i64 %polly.indvar.i208
  %58 = sub i64 %polly.subfunc.arg..i, %polly.indvar.i208
  store i64 %58, i64* %scevgep.i209, align 8, !alias.scope !24, !noalias !26
  %polly.indvar_next.i = add nsw i64 %polly.indvar.i208, 1
  %polly.loop_cond.i = icmp sgt i64 %polly.indvar.i208, %polly.adjust_ub.i
  br i1 %polly.loop_cond.i, label %polly.par.checkNext.loopexit.i, label %polly.loop_header.i210

main_polly_subfn.exit.loopexit:                   ; preds = %polly.par.checkNext.loopexit.i
  br label %main_polly_subfn.exit

main_polly_subfn.exit:                            ; preds = %main_polly_subfn.exit.loopexit, %polly.parallel.for
  call void @GOMP_loop_end_nowait() #7
  call void @llvm.lifetime.end(i64 8, i8* nonnull %52)
  call void @llvm.lifetime.end(i64 8, i8* nonnull %53)
  call void @GOMP_parallel_end() #7
  call void @llvm.lifetime.end(i64 8, i8* nonnull %50)
  br label %if.end42
}

declare void @free2DArray_int64_t(i64**, i64) local_unnamed_addr #4

declare i64** @convertArgsToIntArray(i32, i8**, i64*, i64*) local_unnamed_addr #4

declare i64* @parseStringToInt(i64*) local_unnamed_addr #4

declare i64* @create1DArray_int64_t(i64, i64) local_unnamed_addr #4

declare i64* @copy1DArray_int64_t(i64*, i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

declare void @println_s(i64*, i64) local_unnamed_addr #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

define internal void @main_polly_subfn(i8* nocapture readonly %polly.par.userContext) #6 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg. = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64**
  %polly.subfunc.arg.call30 = load i64*, i64** %2, align 8
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_header
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_header, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_header ]
  %scevgep = getelementptr i64, i64* %polly.subfunc.arg.call30, i64 %polly.indvar
  %7 = sub i64 %polly.subfunc.arg., %polly.indvar
  store i64 %7, i64* %scevgep, align 8, !alias.scope !27, !noalias !26
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*) local_unnamed_addr

declare void @GOMP_loop_end_nowait() local_unnamed_addr

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64) local_unnamed_addr

declare void @GOMP_parallel_end() local_unnamed_addr

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "polly.skip.fn" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git 9b9db7fa41a1905899dbcbcc6cbdd05d2511da8e) (http://llvm.org/git/llvm.git fd456e365e09d54850dabc6a2f840a0c2eae7c27)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6, !"polly.alias.scope.items"}
!6 = distinct !{!6, !"polly.alias.scope.domain"}
!7 = !{!8, !9, !10}
!8 = distinct !{!8, !6, !"polly.alias.scope.last_swapped.1.lcssa"}
!9 = distinct !{!9, !6, !"polly.alias.scope.last_swapped.1"}
!10 = distinct !{!10, !6, !"polly.alias.scope.last_swapped.075"}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !3, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !19, !"polly.alias.scope.items"}
!19 = distinct !{!19, !"polly.alias.scope.domain"}
!20 = !{!21, !22, !23}
!21 = distinct !{!21, !19, !"polly.alias.scope.last_swapped.1.lcssa"}
!22 = distinct !{!22, !19, !"polly.alias.scope.last_swapped.1"}
!23 = distinct !{!23, !19, !"polly.alias.scope.last_swapped.075"}
!24 = distinct !{!24, !25, !"polly.alias.scope.call30"}
!25 = distinct !{!25, !"polly.alias.scope.domain"}
!26 = !{}
!27 = distinct !{!27, !28, !"polly.alias.scope.call30"}
!28 = distinct !{!28, !"polly.alias.scope.domain"}
