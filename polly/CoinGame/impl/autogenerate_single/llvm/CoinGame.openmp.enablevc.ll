; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: norecurse nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_has_ownership, i64 %n) #0 {
entry:
  %0 = icmp eq i64 %n, 9223372036854775807
  br i1 %0, label %while.cond1.preheader.preheader, label %polly.loop_if

while.cond1.preheader.preheader:                  ; preds = %entry
  br label %while.cond1.preheader

while.cond1.preheader:                            ; preds = %while.cond1.preheader.preheader, %blklab2
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab2 ], [ 9223372036854775807, %while.cond1.preheader.preheader ]
  %s.0154 = phi i64 [ %add56, %blklab2 ], [ 0, %while.cond1.preheader.preheader ]
  br label %if.end5

if.end5:                                          ; preds = %blklab6, %while.cond1.preheader
  %i.0152 = phi i64 [ 0, %while.cond1.preheader ], [ %add, %blklab6 ]
  %j.0151 = phi i64 [ %s.0154, %while.cond1.preheader ], [ %add54, %blklab6 ]
  %add = add nuw nsw i64 %i.0152, 1
  %cmp6 = icmp eq i64 %add, 9223372036854775807
  %cmp9 = icmp slt i64 %j.0151, 1
  %or.cond = or i1 %cmp9, %cmp6
  br i1 %or.cond, label %blklab4, label %if.end11

if.end11:                                         ; preds = %if.end5
  %mul = mul nsw i64 %add, 9223372036854775807
  %add13 = add nsw i64 %j.0151, -1
  %sub14 = add i64 %add13, %mul
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %sub14
  %1 = load i64, i64* %arrayidx, align 8, !tbaa !1
  br label %blklab4

blklab4:                                          ; preds = %if.end5, %if.end11
  %y.0 = phi i64 [ 0, %if.end5 ], [ %1, %if.end11 ]
  %add15 = add nuw nsw i64 %i.0152, 2
  %cmp16 = icmp eq i64 %add15, 9223372036854775807
  br i1 %cmp16, label %blklab5, label %if.end18

if.end18:                                         ; preds = %blklab4
  %mul20 = mul nsw i64 %add15, 9223372036854775807
  %add21 = add nsw i64 %mul20, %j.0151
  %arrayidx22 = getelementptr inbounds i64, i64* %moves, i64 %add21
  %2 = load i64, i64* %arrayidx22, align 8, !tbaa !1
  br label %blklab5

blklab5:                                          ; preds = %blklab4, %if.end18
  %x.0 = phi i64 [ 0, %blklab4 ], [ %2, %if.end18 ]
  %cmp24 = icmp slt i64 %j.0151, 2
  %.pre = mul nsw i64 %i.0152, 9223372036854775807
  br i1 %cmp24, label %blklab6, label %if.end26

if.end26:                                         ; preds = %blklab5
  %add28 = add nsw i64 %j.0151, -2
  %sub29 = add i64 %add28, %.pre
  %arrayidx30 = getelementptr inbounds i64, i64* %moves, i64 %sub29
  %3 = load i64, i64* %arrayidx30, align 8, !tbaa !1
  br label %blklab6

blklab6:                                          ; preds = %blklab5, %if.end26
  %z.0 = phi i64 [ %3, %if.end26 ], [ 0, %blklab5 ]
  %xor = xor i64 %x.0, %y.0
  %cmp31 = icmp slt i64 %x.0, %y.0
  %and = select i1 %cmp31, i64 %xor, i64 0
  %xor34 = xor i64 %and, %y.0
  %add35 = add nsw i64 %xor34, %i.0152
  %xor36 = xor i64 %z.0, %y.0
  %cmp37 = icmp slt i64 %y.0, %z.0
  %and41 = select i1 %cmp37, i64 %xor36, i64 0
  %xor42 = xor i64 %and41, %z.0
  %add43 = add nsw i64 %xor42, %j.0151
  %xor44 = xor i64 %add43, %add35
  %cmp45 = icmp slt i64 %add35, %add43
  %and49 = select i1 %cmp45, i64 %xor44, i64 0
  %xor50 = xor i64 %and49, %add35
  %add52 = add nsw i64 %.pre, %j.0151
  %arrayidx53 = getelementptr inbounds i64, i64* %moves, i64 %add52
  store i64 %xor50, i64* %arrayidx53, align 8, !tbaa !1
  %add54 = add nuw nsw i64 %j.0151, 1
  %exitcond = icmp eq i64 %add, %indvars.iv
  br i1 %exitcond, label %blklab2, label %if.end5

blklab2:                                          ; preds = %blklab6
  %add56 = add nuw nsw i64 %s.0154, 1
  %indvars.iv.next = add i64 %indvars.iv, -1
  %exitcond155 = icmp eq i64 %add56, 9223372036854775807
  br i1 %exitcond155, label %if.end58.loopexit, label %while.cond1.preheader

if.end58.loopexit:                                ; preds = %blklab2
  br label %if.end58

if.end58.loopexit198:                             ; preds = %polly.loop_exit159
  br label %if.end58

if.end58:                                         ; preds = %if.end58.loopexit198, %if.end58.loopexit, %polly.loop_if
  ret i64* %moves

polly.loop_if:                                    ; preds = %entry
  %cmp153 = icmp sgt i64 %n, 0
  br i1 %cmp153, label %polly.loop_preheader, label %if.end58

polly.loop_header:                                ; preds = %polly.loop_exit159, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit159 ]
  %4 = sub nsw i64 %n, %polly.indvar
  %polly.loop_guard160 = icmp sgt i64 %4, 0
  br i1 %polly.loop_guard160, label %polly.loop_preheader158, label %polly.loop_exit159

polly.loop_exit159.loopexit:                      ; preds = %polly.stmt.blklab6
  br label %polly.loop_exit159

polly.loop_exit159:                               ; preds = %polly.loop_exit159.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond194 = icmp eq i64 %polly.indvar_next, %n
  br i1 %exitcond194, label %if.end58.loopexit198, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.loop_if
  %5 = add i64 %n, -1
  %scevgep = getelementptr i64, i64* %moves, i64 %5
  %6 = shl i64 %n, 3
  %7 = add i64 %6, 8
  %8 = shl i64 %n, 1
  %scevgep172 = getelementptr i64, i64* %moves, i64 %8
  %scevgep182 = getelementptr i64, i64* %moves, i64 -2
  br label %polly.loop_header

polly.loop_header157:                             ; preds = %polly.stmt.blklab6, %polly.loop_preheader158
  %polly.indvar161 = phi i64 [ 0, %polly.loop_preheader158 ], [ %polly.indvar_next162, %polly.stmt.blklab6 ]
  %9 = add nuw nsw i64 %polly.indvar161, 2
  %10 = icmp sle i64 %9, %n
  %11 = add nuw i64 %polly.indvar161, %polly.indvar
  %12 = icmp sgt i64 %11, 0
  %13 = and i1 %10, %12
  br i1 %13, label %polly.stmt.if.end11, label %polly.cond168

polly.cond168:                                    ; preds = %polly.loop_header157, %polly.stmt.if.end11
  %y.0.phiops.0 = phi i64 [ %_p_scalar_, %polly.stmt.if.end11 ], [ 0, %polly.loop_header157 ]
  %14 = add nuw nsw i64 %polly.indvar161, 3
  %15 = icmp sgt i64 %14, %n
  br i1 %15, label %polly.cond178, label %polly.stmt.if.end18

polly.cond178:                                    ; preds = %polly.cond168, %polly.stmt.if.end18
  %x.0.phiops.0 = phi i64 [ %_p_scalar_177, %polly.stmt.if.end18 ], [ 0, %polly.cond168 ]
  %16 = icmp sgt i64 %11, 1
  %17 = mul i64 %polly.indvar161, %7
  br i1 %16, label %polly.stmt.if.end26, label %polly.stmt.blklab6

polly.stmt.blklab6:                               ; preds = %polly.cond178, %polly.stmt.if.end26
  %z.0.phiops.0 = phi i64 [ %_p_scalar_187, %polly.stmt.if.end26 ], [ 0, %polly.cond178 ]
  %p_xor = xor i64 %x.0.phiops.0, %y.0.phiops.0
  %p_cmp31 = icmp slt i64 %x.0.phiops.0, %y.0.phiops.0
  %p_and = select i1 %p_cmp31, i64 %p_xor, i64 0
  %p_xor34 = xor i64 %p_and, %y.0.phiops.0
  %p_add35 = add nsw i64 %p_xor34, %polly.indvar161
  %p_xor36 = xor i64 %z.0.phiops.0, %y.0.phiops.0
  %p_cmp37 = icmp slt i64 %y.0.phiops.0, %z.0.phiops.0
  %p_and41 = select i1 %p_cmp37, i64 %p_xor36, i64 0
  %p_xor42 = xor i64 %p_and41, %z.0.phiops.0
  %p_add43 = add nsw i64 %p_xor42, %11
  %p_xor44 = xor i64 %p_add43, %p_add35
  %p_cmp45 = icmp slt i64 %p_add35, %p_add43
  %p_and49 = select i1 %p_cmp45, i64 %p_xor44, i64 0
  %p_xor50 = xor i64 %p_and49, %p_add35
  %uglygep190 = getelementptr i8, i8* %scevgep188189, i64 %17
  %uglygep190191 = bitcast i8* %uglygep190 to i64*
  store i64 %p_xor50, i64* %uglygep190191, align 8, !alias.scope !5, !noalias !7
  %polly.indvar_next162 = add nuw nsw i64 %polly.indvar161, 1
  %polly.loop_cond164 = icmp slt i64 %polly.indvar161, %polly.adjust_ub163
  br i1 %polly.loop_cond164, label %polly.loop_header157, label %polly.loop_exit159.loopexit

polly.loop_preheader158:                          ; preds = %polly.loop_header
  %scevgep165 = getelementptr i64, i64* %scevgep, i64 %polly.indvar
  %scevgep165166 = bitcast i64* %scevgep165 to i8*
  %scevgep173 = getelementptr i64, i64* %scevgep172, i64 %polly.indvar
  %scevgep173174 = bitcast i64* %scevgep173 to i8*
  %scevgep183 = getelementptr i64, i64* %scevgep182, i64 %polly.indvar
  %scevgep183184 = bitcast i64* %scevgep183 to i8*
  %scevgep188 = getelementptr i64, i64* %moves, i64 %polly.indvar
  %scevgep188189 = bitcast i64* %scevgep188 to i8*
  %polly.adjust_ub163 = add i64 %4, -1
  br label %polly.loop_header157

polly.stmt.if.end11:                              ; preds = %polly.loop_header157
  %18 = mul i64 %polly.indvar161, %7
  %uglygep = getelementptr i8, i8* %scevgep165166, i64 %18
  %uglygep167 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep167, align 8, !alias.scope !5, !noalias !7
  br label %polly.cond168

polly.stmt.if.end18:                              ; preds = %polly.cond168
  %19 = mul i64 %polly.indvar161, %7
  %uglygep175 = getelementptr i8, i8* %scevgep173174, i64 %19
  %uglygep175176 = bitcast i8* %uglygep175 to i64*
  %_p_scalar_177 = load i64, i64* %uglygep175176, align 8, !alias.scope !5, !noalias !7
  br label %polly.cond178

polly.stmt.if.end26:                              ; preds = %polly.cond178
  %uglygep185 = getelementptr i8, i8* %scevgep183184, i64 %17
  %uglygep185186 = bitcast i8* %uglygep185 to i64*
  %_p_scalar_187 = load i64, i64* %uglygep185186, align 8, !alias.scope !5, !noalias !7
  br label %polly.stmt.blklab6
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #2 {
entry:
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5
  %sub = add nsw i32 %argc, -1
  %conv = sext i32 %sub to i64
  %0 = load i64*, i64** %call, align 8, !tbaa !11
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5
  %cmp = icmp eq i64* %call1, null
  br i1 %cmp, label %if.end122.critedge, label %if.then103

if.then103:                                       ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !tbaa !1
  %mul = mul nsw i64 %1, %1
  %conv6 = trunc i64 %mul to i32
  %call7 = tail call i64* @gen1DArray(i32 0, i32 %conv6) #5
  %call14 = tail call i64* @findMoves(i64* %call7, i64 undef, i1 zeroext undef, i64 %1)
  %sub18 = add nsw i64 %1, -1
  %arrayidx19 = getelementptr inbounds i64, i64* %call14, i64 %sub18
  %2 = load i64, i64* %arrayidx19, align 8, !tbaa !1
  %call23 = tail call noalias i8* @malloc(i64 400) #5
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
  tail call void @printf_s(i64* %3, i64 50) #5
  %call74 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2)
  %call78 = tail call noalias i8* @malloc(i64 184) #5
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
  tail call void @println_s(i64* %29, i64 23) #5
  %phitmp = bitcast i64* %call14 to i8*
  tail call void @free(i8* %phitmp) #5
  tail call void @free2DArray(i64** %call, i64 %conv) #5
  tail call void @free(i8* %call23) #5
  tail call void @free(i8* %call78) #5
  br label %if.end122

if.end122.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #5
  br label %if.end122

if.end122:                                        ; preds = %if.end122.critedge, %if.then103
  tail call void @exit(i32 0) #6
  unreachable
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64* @parseStringToInt(i64*) #3

declare i64* @gen1DArray(i32, i32) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare void @printf_s(i64*, i64) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

declare void @println_s(i64*, i64) #3

declare void @free2DArray(i64**, i64) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

attributes #0 = { norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git f0413f80c8330e9495069bc2d1358908bba19914) (http://llvm.org/git/llvm.git 84bc70bd9cdc366afa53717cb14d6abb7f201138)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6, !"polly.alias.scope.moves"}
!6 = distinct !{!6, !"polly.alias.scope.domain"}
!7 = !{!8, !9, !10}
!8 = distinct !{!8, !6, !"polly.alias.scope.y.0"}
!9 = distinct !{!9, !6, !"polly.alias.scope.x.0"}
!10 = distinct !{!10, !6, !"polly.alias.scope.z.0"}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !3, i64 0}
