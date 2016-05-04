; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_has_ownership, i64 %n) #0 !dbg !8 {
entry:
  %0 = icmp eq i64 %n, 9223372036854775807
  br i1 %0, label %while.cond1.preheader.preheader, label %polly.loop_if

while.cond1.preheader.preheader:                  ; preds = %entry
  br label %while.cond1.preheader, !dbg !73

while.cond1.preheader:                            ; preds = %while.cond1.preheader.preheader, %blklab2
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab2 ], [ 9223372036854775807, %while.cond1.preheader.preheader ]
  %s.0154 = phi i64 [ %add56, %blklab2 ], [ 0, %while.cond1.preheader.preheader ]
  br label %if.end5, !dbg !73

if.end5:                                          ; preds = %blklab6, %while.cond1.preheader
  %i.0152 = phi i64 [ 0, %while.cond1.preheader ], [ %add, %blklab6 ]
  %j.0151 = phi i64 [ %s.0154, %while.cond1.preheader ], [ %add54, %blklab6 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !30, metadata !76), !dbg !77
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !76), !dbg !78
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !31, metadata !76), !dbg !79
  %add = add nuw nsw i64 %i.0152, 1, !dbg !80
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !32, metadata !76), !dbg !81
  %cmp6 = icmp eq i64 %add, 9223372036854775807, !dbg !82
  %cmp9 = icmp slt i64 %j.0151, 1, !dbg !84
  %or.cond = or i1 %cmp9, %cmp6, !dbg !86
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !33, metadata !76), !dbg !87
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !76), !dbg !88
  br i1 %or.cond, label %blklab4, label %if.end11, !dbg !86

if.end11:                                         ; preds = %if.end5
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !36, metadata !76), !dbg !89
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !37, metadata !76), !dbg !90
  %mul = mul nsw i64 %add, 9223372036854775807, !dbg !91
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !38, metadata !76), !dbg !92
  tail call void @llvm.dbg.value(metadata i64 %add13, i64 0, metadata !39, metadata !76), !dbg !93
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !40, metadata !76), !dbg !94
  %add13 = add nsw i64 %j.0151, -1, !dbg !95
  %sub14 = add i64 %add13, %mul, !dbg !96
  tail call void @llvm.dbg.value(metadata i64 %sub14, i64 0, metadata !41, metadata !76), !dbg !97
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %sub14, !dbg !98
  %1 = load i64, i64* %arrayidx, align 8, !dbg !98, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !42, metadata !76), !dbg !103
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !25, metadata !76), !dbg !78
  br label %blklab4, !dbg !104

blklab4:                                          ; preds = %if.end5, %if.end11
  %y.0 = phi i64 [ 0, %if.end5 ], [ %1, %if.end11 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !76), !dbg !105
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !26, metadata !76), !dbg !106
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !44, metadata !76), !dbg !107
  %add15 = add nuw nsw i64 %i.0152, 2, !dbg !108
  tail call void @llvm.dbg.value(metadata i64 %add15, i64 0, metadata !45, metadata !76), !dbg !109
  %cmp16 = icmp eq i64 %add15, 9223372036854775807, !dbg !110
  br i1 %cmp16, label %blklab5, label %if.end18, !dbg !112

if.end18:                                         ; preds = %blklab4
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !46, metadata !76), !dbg !113
  tail call void @llvm.dbg.value(metadata i64 %add15, i64 0, metadata !47, metadata !76), !dbg !114
  %mul20 = mul nsw i64 %add15, 9223372036854775807, !dbg !115
  tail call void @llvm.dbg.value(metadata i64 %mul20, i64 0, metadata !48, metadata !76), !dbg !116
  %add21 = add nsw i64 %mul20, %j.0151, !dbg !117
  tail call void @llvm.dbg.value(metadata i64 %add21, i64 0, metadata !49, metadata !76), !dbg !118
  %arrayidx22 = getelementptr inbounds i64, i64* %moves, i64 %add21, !dbg !119
  %2 = load i64, i64* %arrayidx22, align 8, !dbg !119, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !50, metadata !76), !dbg !120
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !26, metadata !76), !dbg !106
  br label %blklab5, !dbg !121

blklab5:                                          ; preds = %blklab4, %if.end18
  %x.0 = phi i64 [ 0, %blklab4 ], [ %2, %if.end18 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !76), !dbg !122
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !76), !dbg !123
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !52, metadata !76), !dbg !124
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !76), !dbg !125
  %cmp24 = icmp slt i64 %j.0151, 2, !dbg !126
  %.pre = mul nsw i64 %i.0152, 9223372036854775807, !dbg !128
  br i1 %cmp24, label %blklab6, label %if.end26, !dbg !129

if.end26:                                         ; preds = %blklab5
  tail call void @llvm.dbg.value(metadata i64 %.pre, i64 0, metadata !55, metadata !76), !dbg !130
  tail call void @llvm.dbg.value(metadata i64 %add28, i64 0, metadata !56, metadata !76), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !57, metadata !76), !dbg !132
  %add28 = add nsw i64 %j.0151, -2, !dbg !133
  %sub29 = add i64 %add28, %.pre, !dbg !134
  tail call void @llvm.dbg.value(metadata i64 %sub29, i64 0, metadata !58, metadata !76), !dbg !135
  %arrayidx30 = getelementptr inbounds i64, i64* %moves, i64 %sub29, !dbg !136
  %3 = load i64, i64* %arrayidx30, align 8, !dbg !136, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !59, metadata !76), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !27, metadata !76), !dbg !123
  br label %blklab6, !dbg !138

blklab6:                                          ; preds = %blklab5, %if.end26
  %z.0 = phi i64 [ %3, %if.end26 ], [ 0, %blklab5 ]
  %xor = xor i64 %x.0, %y.0, !dbg !139
  %cmp31 = icmp slt i64 %x.0, %y.0, !dbg !139
  %and = select i1 %cmp31, i64 %xor, i64 0, !dbg !139
  %xor34 = xor i64 %and, %y.0, !dbg !139
  tail call void @llvm.dbg.value(metadata i64 %xor34, i64 0, metadata !61, metadata !76), !dbg !140
  %add35 = add nsw i64 %xor34, %i.0152, !dbg !141
  tail call void @llvm.dbg.value(metadata i64 %add35, i64 0, metadata !62, metadata !76), !dbg !142
  %xor36 = xor i64 %z.0, %y.0, !dbg !143
  %cmp37 = icmp slt i64 %y.0, %z.0, !dbg !143
  %and41 = select i1 %cmp37, i64 %xor36, i64 0, !dbg !143
  %xor42 = xor i64 %and41, %z.0, !dbg !143
  tail call void @llvm.dbg.value(metadata i64 %xor42, i64 0, metadata !63, metadata !76), !dbg !144
  %add43 = add nsw i64 %xor42, %j.0151, !dbg !145
  tail call void @llvm.dbg.value(metadata i64 %add43, i64 0, metadata !64, metadata !76), !dbg !146
  %xor44 = xor i64 %add43, %add35, !dbg !147
  %cmp45 = icmp slt i64 %add35, %add43, !dbg !147
  %and49 = select i1 %cmp45, i64 %xor44, i64 0, !dbg !147
  %xor50 = xor i64 %and49, %add35, !dbg !147
  tail call void @llvm.dbg.value(metadata i64 %xor50, i64 0, metadata !60, metadata !76), !dbg !148
  tail call void @llvm.dbg.value(metadata i64 %.pre, i64 0, metadata !65, metadata !76), !dbg !149
  %add52 = add nsw i64 %.pre, %j.0151, !dbg !150
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !66, metadata !76), !dbg !151
  %arrayidx53 = getelementptr inbounds i64, i64* %moves, i64 %add52, !dbg !152
  store i64 %xor50, i64* %arrayidx53, align 8, !dbg !153, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !67, metadata !76), !dbg !154
  %add54 = add nuw nsw i64 %j.0151, 1, !dbg !155
  tail call void @llvm.dbg.value(metadata i64 %add54, i64 0, metadata !68, metadata !76), !dbg !156
  tail call void @llvm.dbg.value(metadata i64 %add54, i64 0, metadata !23, metadata !76), !dbg !157
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !69, metadata !76), !dbg !158
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !70, metadata !76), !dbg !159
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !24, metadata !76), !dbg !160
  %exitcond = icmp eq i64 %add, %indvars.iv, !dbg !73
  br i1 %exitcond, label %blklab2, label %if.end5, !dbg !73

blklab2:                                          ; preds = %blklab6
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !71, metadata !76), !dbg !161
  %add56 = add nuw nsw i64 %s.0154, 1, !dbg !162
  tail call void @llvm.dbg.value(metadata i64 %add56, i64 0, metadata !72, metadata !76), !dbg !163
  tail call void @llvm.dbg.value(metadata i64 %add56, i64 0, metadata !22, metadata !76), !dbg !164
  %indvars.iv.next = add i64 %indvars.iv, -1, !dbg !165
  %exitcond155 = icmp eq i64 %add56, 9223372036854775807, !dbg !165
  br i1 %exitcond155, label %if.end58.loopexit, label %while.cond1.preheader, !dbg !165

if.end58.loopexit:                                ; preds = %blklab2
  br label %if.end58, !dbg !166

if.end58.loopexit198:                             ; preds = %polly.loop_exit159
  br label %if.end58, !dbg !166

if.end58:                                         ; preds = %if.end58.loopexit198, %if.end58.loopexit, %polly.loop_if
  ret i64* %moves, !dbg !166

polly.loop_if:                                    ; preds = %entry
  %cmp153 = icmp sgt i64 %n, 0, !dbg !167
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
  %p_xor = xor i64 %x.0.phiops.0, %y.0.phiops.0, !dbg !139
  %p_cmp31 = icmp slt i64 %x.0.phiops.0, %y.0.phiops.0, !dbg !139
  %p_and = select i1 %p_cmp31, i64 %p_xor, i64 0, !dbg !139
  %p_xor34 = xor i64 %p_and, %y.0.phiops.0, !dbg !139
  %p_add35 = add nsw i64 %p_xor34, %polly.indvar161, !dbg !141
  %p_xor36 = xor i64 %z.0.phiops.0, %y.0.phiops.0, !dbg !143
  %p_cmp37 = icmp slt i64 %y.0.phiops.0, %z.0.phiops.0, !dbg !143
  %p_and41 = select i1 %p_cmp37, i64 %p_xor36, i64 0, !dbg !143
  %p_xor42 = xor i64 %p_and41, %z.0.phiops.0, !dbg !143
  %p_add43 = add nsw i64 %p_xor42, %11, !dbg !145
  %p_xor44 = xor i64 %p_add43, %p_add35, !dbg !147
  %p_cmp45 = icmp slt i64 %p_add35, %p_add43, !dbg !147
  %p_and49 = select i1 %p_cmp45, i64 %p_xor44, i64 0, !dbg !147
  %p_xor50 = xor i64 %p_and49, %p_add35, !dbg !147
  %uglygep190 = getelementptr i8, i8* %scevgep188189, i64 %17
  %uglygep190191 = bitcast i8* %uglygep190 to i64*
  store i64 %p_xor50, i64* %uglygep190191, align 8, !alias.scope !169, !noalias !171
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
  %_p_scalar_ = load i64, i64* %uglygep167, align 8, !alias.scope !169, !noalias !171
  br label %polly.cond168

polly.stmt.if.end18:                              ; preds = %polly.cond168
  %19 = mul i64 %polly.indvar161, %7
  %uglygep175 = getelementptr i8, i8* %scevgep173174, i64 %19
  %uglygep175176 = bitcast i8* %uglygep175 to i64*
  %_p_scalar_177 = load i64, i64* %uglygep175176, align 8, !alias.scope !169, !noalias !171
  br label %polly.cond178

polly.stmt.if.end26:                              ; preds = %polly.cond178
  %uglygep185 = getelementptr i8, i8* %scevgep183184, i64 %17
  %uglygep185186 = bitcast i8* %uglygep185 to i64*
  %_p_scalar_187 = load i64, i64* %uglygep185186, align 8, !alias.scope !169, !noalias !171
  br label %polly.stmt.blklab6
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #2 !dbg !175 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !183, metadata !76), !dbg !221
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !184, metadata !76), !dbg !222
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !186, metadata !76), !dbg !223
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !187, metadata !76), !dbg !224
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !188, metadata !76), !dbg !224
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !189, metadata !76), !dbg !225
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !190, metadata !76), !dbg !226
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !192, metadata !76), !dbg !227
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !194, metadata !76), !dbg !227
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !195, metadata !76), !dbg !227
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !196, metadata !76), !dbg !228
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !197, metadata !76), !dbg !229
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !198, metadata !76), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !199, metadata !76), !dbg !230
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !200, metadata !76), !dbg !231
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !201, metadata !76), !dbg !232
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !202, metadata !76), !dbg !233
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !203, metadata !76), !dbg !234
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !204, metadata !76), !dbg !234
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !205, metadata !76), !dbg !235
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !206, metadata !76), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !207, metadata !76), !dbg !236
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !208, metadata !76), !dbg !237
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !209, metadata !76), !dbg !238
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !210, metadata !76), !dbg !239
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !211, metadata !76), !dbg !240
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !213, metadata !76), !dbg !241
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !214, metadata !76), !dbg !241
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !215, metadata !76), !dbg !242
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !218, metadata !76), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !219, metadata !76), !dbg !243
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !220, metadata !76), !dbg !244
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6, !dbg !245
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !192, metadata !76), !dbg !227
  %sub = add nsw i32 %argc, -1, !dbg !245
  %conv = sext i32 %sub to i64, !dbg !245
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !194, metadata !76), !dbg !227
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !196, metadata !76), !dbg !228
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !197, metadata !76), !dbg !229
  %0 = load i64*, i64** %call, align 8, !dbg !246, !tbaa !247
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !198, metadata !76), !dbg !230
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !200, metadata !76), !dbg !231
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6, !dbg !249
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !191, metadata !76), !dbg !250
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !185, metadata !76), !dbg !251
  %cmp = icmp eq i64* %call1, null, !dbg !252
  br i1 %cmp, label %if.end122.critedge, label %if.then103, !dbg !254

if.then103:                                       ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !255, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !186, metadata !76), !dbg !223
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !201, metadata !76), !dbg !232
  %mul = mul nsw i64 %1, %1, !dbg !256
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !202, metadata !76), !dbg !233
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !204, metadata !76), !dbg !234
  %conv6 = trunc i64 %mul to i32, !dbg !257
  %call7 = tail call i64* @gen1DArray(i32 0, i32 %conv6) #6, !dbg !257
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !203, metadata !76), !dbg !234
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !205, metadata !76), !dbg !235
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !188, metadata !76), !dbg !224
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !187, metadata !76), !dbg !224
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !189, metadata !76), !dbg !225
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !205, metadata !76), !dbg !235
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !189, metadata !76), !dbg !225
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !207, metadata !76), !dbg !236
  %call14 = tail call i64* @findMoves(i64* %call7, i64 undef, i1 zeroext undef, i64 %1), !dbg !258
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !206, metadata !76), !dbg !236
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !208, metadata !76), !dbg !237
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !188, metadata !76), !dbg !224
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !187, metadata !76), !dbg !224
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !189, metadata !76), !dbg !225
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !208, metadata !76), !dbg !237
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !209, metadata !76), !dbg !238
  %sub18 = add nsw i64 %1, -1, !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %sub18, i64 0, metadata !210, metadata !76), !dbg !239
  %arrayidx19 = getelementptr inbounds i64, i64* %call14, i64 %sub18, !dbg !260
  %2 = load i64, i64* %arrayidx19, align 8, !dbg !260, !tbaa !99
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !211, metadata !76), !dbg !240
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !190, metadata !76), !dbg !226
  tail call void @llvm.dbg.value(metadata i64 50, i64 0, metadata !214, metadata !76), !dbg !241
  %call23 = tail call noalias i8* @malloc(i64 400) #6, !dbg !261
  %3 = bitcast i8* %call23 to i64*, !dbg !261
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !213, metadata !76), !dbg !241
  %4 = bitcast i8* %call23 to <2 x i64>*, !dbg !262
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %4, align 8, !dbg !262, !tbaa !99
  %arrayidx26 = getelementptr inbounds i8, i8* %call23, i64 16, !dbg !263
  %5 = bitcast i8* %arrayidx26 to <2 x i64>*, !dbg !264
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %5, align 8, !dbg !264, !tbaa !99
  %arrayidx28 = getelementptr inbounds i8, i8* %call23, i64 32, !dbg !265
  %6 = bitcast i8* %arrayidx28 to <2 x i64>*, !dbg !266
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %6, align 8, !dbg !266, !tbaa !99
  %arrayidx30 = getelementptr inbounds i8, i8* %call23, i64 48, !dbg !267
  %7 = bitcast i8* %arrayidx30 to <2 x i64>*, !dbg !268
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %7, align 8, !dbg !268, !tbaa !99
  %arrayidx32 = getelementptr inbounds i8, i8* %call23, i64 64, !dbg !269
  %8 = bitcast i8* %arrayidx32 to <2 x i64>*, !dbg !270
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %8, align 8, !dbg !270, !tbaa !99
  %arrayidx34 = getelementptr inbounds i8, i8* %call23, i64 80, !dbg !271
  %9 = bitcast i8* %arrayidx34 to <2 x i64>*, !dbg !272
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %9, align 8, !dbg !272, !tbaa !99
  %arrayidx36 = getelementptr inbounds i8, i8* %call23, i64 96, !dbg !273
  %10 = bitcast i8* %arrayidx36 to <2 x i64>*, !dbg !274
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %10, align 8, !dbg !274, !tbaa !99
  %arrayidx38 = getelementptr inbounds i8, i8* %call23, i64 112, !dbg !275
  %11 = bitcast i8* %arrayidx38 to <2 x i64>*, !dbg !276
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %11, align 8, !dbg !276, !tbaa !99
  %arrayidx40 = getelementptr inbounds i8, i8* %call23, i64 128, !dbg !277
  %12 = bitcast i8* %arrayidx40 to <2 x i64>*, !dbg !278
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %12, align 8, !dbg !278, !tbaa !99
  %arrayidx42 = getelementptr inbounds i8, i8* %call23, i64 144, !dbg !279
  %13 = bitcast i8* %arrayidx42 to <2 x i64>*, !dbg !280
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %13, align 8, !dbg !280, !tbaa !99
  %arrayidx44 = getelementptr inbounds i8, i8* %call23, i64 160, !dbg !281
  %14 = bitcast i8* %arrayidx44 to <2 x i64>*, !dbg !282
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %14, align 8, !dbg !282, !tbaa !99
  %arrayidx46 = getelementptr inbounds i8, i8* %call23, i64 176, !dbg !283
  %15 = bitcast i8* %arrayidx46 to <2 x i64>*, !dbg !284
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %15, align 8, !dbg !284, !tbaa !99
  %arrayidx48 = getelementptr inbounds i8, i8* %call23, i64 192, !dbg !285
  %16 = bitcast i8* %arrayidx48 to <2 x i64>*, !dbg !286
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %16, align 8, !dbg !286, !tbaa !99
  %arrayidx50 = getelementptr inbounds i8, i8* %call23, i64 208, !dbg !287
  %17 = bitcast i8* %arrayidx50 to <2 x i64>*, !dbg !288
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %17, align 8, !dbg !288, !tbaa !99
  %arrayidx52 = getelementptr inbounds i8, i8* %call23, i64 224, !dbg !289
  %18 = bitcast i8* %arrayidx52 to <2 x i64>*, !dbg !290
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %18, align 8, !dbg !290, !tbaa !99
  %arrayidx54 = getelementptr inbounds i8, i8* %call23, i64 240, !dbg !291
  %19 = bitcast i8* %arrayidx54 to <2 x i64>*, !dbg !292
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %19, align 8, !dbg !292, !tbaa !99
  %arrayidx56 = getelementptr inbounds i8, i8* %call23, i64 256, !dbg !293
  %20 = bitcast i8* %arrayidx56 to <2 x i64>*, !dbg !294
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %20, align 8, !dbg !294, !tbaa !99
  %arrayidx58 = getelementptr inbounds i8, i8* %call23, i64 272, !dbg !295
  %21 = bitcast i8* %arrayidx58 to <2 x i64>*, !dbg !296
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %21, align 8, !dbg !296, !tbaa !99
  %arrayidx60 = getelementptr inbounds i8, i8* %call23, i64 288, !dbg !297
  %22 = bitcast i8* %arrayidx60 to <2 x i64>*, !dbg !298
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %22, align 8, !dbg !298, !tbaa !99
  %arrayidx62 = getelementptr inbounds i8, i8* %call23, i64 304, !dbg !299
  %23 = bitcast i8* %arrayidx62 to <2 x i64>*, !dbg !300
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %23, align 8, !dbg !300, !tbaa !99
  %arrayidx64 = getelementptr inbounds i8, i8* %call23, i64 320, !dbg !301
  %24 = bitcast i8* %arrayidx64 to <2 x i64>*, !dbg !302
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %24, align 8, !dbg !302, !tbaa !99
  %arrayidx66 = getelementptr inbounds i8, i8* %call23, i64 336, !dbg !303
  %25 = bitcast i8* %arrayidx66 to <2 x i64>*, !dbg !304
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %25, align 8, !dbg !304, !tbaa !99
  %arrayidx68 = getelementptr inbounds i8, i8* %call23, i64 352, !dbg !305
  %26 = bitcast i8* %arrayidx68 to <2 x i64>*, !dbg !306
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %26, align 8, !dbg !306, !tbaa !99
  %arrayidx70 = getelementptr inbounds i8, i8* %call23, i64 368, !dbg !307
  %27 = bitcast i8* %arrayidx70 to <2 x i64>*, !dbg !308
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %27, align 8, !dbg !308, !tbaa !99
  %arrayidx72 = getelementptr inbounds i8, i8* %call23, i64 384, !dbg !309
  %28 = bitcast i8* %arrayidx72 to <2 x i64>*, !dbg !310
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %28, align 8, !dbg !310, !tbaa !99
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !215, metadata !76), !dbg !242
  tail call void @printf_s(i64* %3, i64 50) #6, !dbg !311
  %call74 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2), !dbg !312
  tail call void @llvm.dbg.value(metadata i64 23, i64 0, metadata !219, metadata !76), !dbg !243
  %call78 = tail call noalias i8* @malloc(i64 184) #6, !dbg !313
  %29 = bitcast i8* %call78 to i64*, !dbg !313
  tail call void @llvm.dbg.value(metadata i64* %29, i64 0, metadata !218, metadata !76), !dbg !243
  %30 = bitcast i8* %call78 to <2 x i64>*, !dbg !314
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %30, align 8, !dbg !314, !tbaa !99
  %arrayidx81 = getelementptr inbounds i8, i8* %call78, i64 16, !dbg !315
  %31 = bitcast i8* %arrayidx81 to <2 x i64>*, !dbg !316
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %31, align 8, !dbg !316, !tbaa !99
  %arrayidx83 = getelementptr inbounds i8, i8* %call78, i64 32, !dbg !317
  %32 = bitcast i8* %arrayidx83 to <2 x i64>*, !dbg !318
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %32, align 8, !dbg !318, !tbaa !99
  %arrayidx85 = getelementptr inbounds i8, i8* %call78, i64 48, !dbg !319
  %33 = bitcast i8* %arrayidx85 to <2 x i64>*, !dbg !320
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %33, align 8, !dbg !320, !tbaa !99
  %arrayidx87 = getelementptr inbounds i8, i8* %call78, i64 64, !dbg !321
  %34 = bitcast i8* %arrayidx87 to <2 x i64>*, !dbg !322
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %34, align 8, !dbg !322, !tbaa !99
  %arrayidx89 = getelementptr inbounds i8, i8* %call78, i64 80, !dbg !323
  %35 = bitcast i8* %arrayidx89 to <2 x i64>*, !dbg !324
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %35, align 8, !dbg !324, !tbaa !99
  %arrayidx91 = getelementptr inbounds i8, i8* %call78, i64 96, !dbg !325
  %36 = bitcast i8* %arrayidx91 to <2 x i64>*, !dbg !326
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %36, align 8, !dbg !326, !tbaa !99
  %arrayidx93 = getelementptr inbounds i8, i8* %call78, i64 112, !dbg !327
  %37 = bitcast i8* %arrayidx93 to <2 x i64>*, !dbg !328
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %37, align 8, !dbg !328, !tbaa !99
  %arrayidx95 = getelementptr inbounds i8, i8* %call78, i64 128, !dbg !329
  %38 = bitcast i8* %arrayidx95 to <2 x i64>*, !dbg !330
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %38, align 8, !dbg !330, !tbaa !99
  %arrayidx97 = getelementptr inbounds i8, i8* %call78, i64 144, !dbg !331
  %39 = bitcast i8* %arrayidx97 to <2 x i64>*, !dbg !332
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %39, align 8, !dbg !332, !tbaa !99
  %arrayidx99 = getelementptr inbounds i8, i8* %call78, i64 160, !dbg !333
  %40 = bitcast i8* %arrayidx99 to <2 x i64>*, !dbg !334
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %40, align 8, !dbg !334, !tbaa !99
  %arrayidx101 = getelementptr inbounds i8, i8* %call78, i64 176, !dbg !335
  %41 = bitcast i8* %arrayidx101 to i64*, !dbg !335
  store i64 101, i64* %41, align 8, !dbg !336, !tbaa !99
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !220, metadata !76), !dbg !244
  tail call void @println_s(i64* %29, i64 23) #6, !dbg !337
  %phitmp = bitcast i64* %call14 to i8*, !dbg !337
  tail call void @free(i8* %phitmp) #6, !dbg !338
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !189, metadata !76), !dbg !225
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !342
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !196, metadata !76), !dbg !228
  tail call void @free(i8* %call23) #6, !dbg !346
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !215, metadata !76), !dbg !242
  tail call void @free(i8* %call78) #6, !dbg !350
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !220, metadata !76), !dbg !244
  br label %if.end122, !dbg !350

if.end122.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !342
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !196, metadata !76), !dbg !228
  br label %if.end122

if.end122:                                        ; preds = %if.end122.critedge, %if.then103
  tail call void @exit(i32 0) #7, !dbg !354
  unreachable, !dbg !354
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

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git adeb741e4ef2208282d408214f045b0ce284645a) (http://llvm.org/git/llvm.git 1b960de1374531cbb65e712c7e5843720761e455)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate_single_leakfree")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git adeb741e4ef2208282d408214f045b0ce284645a) (http://llvm.org/git/llvm.git 1b960de1374531cbb65e712c7e5843720761e455)"}
!8 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 2, type: !9, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !14)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !12, !13, !12}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!13 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!14 = !{!15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72}
!15 = !DILocalVariable(name: "moves", arg: 1, scope: !8, file: !1, line: 2, type: !11)
!16 = !DILocalVariable(name: "moves_size", arg: 2, scope: !8, file: !1, line: 2, type: !12)
!17 = !DILocalVariable(name: "moves_has_ownership", arg: 3, scope: !8, file: !1, line: 2, type: !13)
!18 = !DILocalVariable(name: "n", arg: 4, scope: !8, file: !1, line: 2, type: !12)
!19 = !DILocalVariable(name: "_2", scope: !8, file: !1, line: 3, type: !11)
!20 = !DILocalVariable(name: "_2_size", scope: !8, file: !1, line: 3, type: !12)
!21 = !DILocalVariable(name: "_2_has_ownership", scope: !8, file: !1, line: 4, type: !13)
!22 = !DILocalVariable(name: "s", scope: !8, file: !1, line: 5, type: !12)
!23 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 6, type: !12)
!24 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 7, type: !12)
!25 = !DILocalVariable(name: "y", scope: !8, file: !1, line: 8, type: !12)
!26 = !DILocalVariable(name: "x", scope: !8, file: !1, line: 9, type: !12)
!27 = !DILocalVariable(name: "z", scope: !8, file: !1, line: 10, type: !12)
!28 = !DILocalVariable(name: "_9", scope: !8, file: !1, line: 11, type: !12)
!29 = !DILocalVariable(name: "_10", scope: !8, file: !1, line: 12, type: !12)
!30 = !DILocalVariable(name: "_11", scope: !8, file: !1, line: 13, type: !12)
!31 = !DILocalVariable(name: "_12", scope: !8, file: !1, line: 14, type: !12)
!32 = !DILocalVariable(name: "_13", scope: !8, file: !1, line: 15, type: !12)
!33 = !DILocalVariable(name: "_14", scope: !8, file: !1, line: 16, type: !12)
!34 = !DILocalVariable(name: "_15", scope: !8, file: !1, line: 17, type: !12)
!35 = !DILocalVariable(name: "_16", scope: !8, file: !1, line: 18, type: !12)
!36 = !DILocalVariable(name: "_17", scope: !8, file: !1, line: 19, type: !12)
!37 = !DILocalVariable(name: "_18", scope: !8, file: !1, line: 20, type: !12)
!38 = !DILocalVariable(name: "_19", scope: !8, file: !1, line: 21, type: !12)
!39 = !DILocalVariable(name: "_20", scope: !8, file: !1, line: 22, type: !12)
!40 = !DILocalVariable(name: "_21", scope: !8, file: !1, line: 23, type: !12)
!41 = !DILocalVariable(name: "_22", scope: !8, file: !1, line: 24, type: !12)
!42 = !DILocalVariable(name: "_23", scope: !8, file: !1, line: 25, type: !12)
!43 = !DILocalVariable(name: "_24", scope: !8, file: !1, line: 26, type: !12)
!44 = !DILocalVariable(name: "_25", scope: !8, file: !1, line: 27, type: !12)
!45 = !DILocalVariable(name: "_26", scope: !8, file: !1, line: 28, type: !12)
!46 = !DILocalVariable(name: "_27", scope: !8, file: !1, line: 29, type: !12)
!47 = !DILocalVariable(name: "_28", scope: !8, file: !1, line: 30, type: !12)
!48 = !DILocalVariable(name: "_29", scope: !8, file: !1, line: 31, type: !12)
!49 = !DILocalVariable(name: "_30", scope: !8, file: !1, line: 32, type: !12)
!50 = !DILocalVariable(name: "_31", scope: !8, file: !1, line: 33, type: !12)
!51 = !DILocalVariable(name: "_32", scope: !8, file: !1, line: 34, type: !12)
!52 = !DILocalVariable(name: "_33", scope: !8, file: !1, line: 35, type: !12)
!53 = !DILocalVariable(name: "_34", scope: !8, file: !1, line: 36, type: !12)
!54 = !DILocalVariable(name: "_35", scope: !8, file: !1, line: 37, type: !12)
!55 = !DILocalVariable(name: "_36", scope: !8, file: !1, line: 38, type: !12)
!56 = !DILocalVariable(name: "_37", scope: !8, file: !1, line: 39, type: !12)
!57 = !DILocalVariable(name: "_38", scope: !8, file: !1, line: 40, type: !12)
!58 = !DILocalVariable(name: "_39", scope: !8, file: !1, line: 41, type: !12)
!59 = !DILocalVariable(name: "_40", scope: !8, file: !1, line: 42, type: !12)
!60 = !DILocalVariable(name: "_41", scope: !8, file: !1, line: 43, type: !12)
!61 = !DILocalVariable(name: "_42", scope: !8, file: !1, line: 44, type: !12)
!62 = !DILocalVariable(name: "_43", scope: !8, file: !1, line: 45, type: !12)
!63 = !DILocalVariable(name: "_44", scope: !8, file: !1, line: 46, type: !12)
!64 = !DILocalVariable(name: "_45", scope: !8, file: !1, line: 47, type: !12)
!65 = !DILocalVariable(name: "_46", scope: !8, file: !1, line: 48, type: !12)
!66 = !DILocalVariable(name: "_47", scope: !8, file: !1, line: 49, type: !12)
!67 = !DILocalVariable(name: "_48", scope: !8, file: !1, line: 50, type: !12)
!68 = !DILocalVariable(name: "_49", scope: !8, file: !1, line: 51, type: !12)
!69 = !DILocalVariable(name: "_50", scope: !8, file: !1, line: 52, type: !12)
!70 = !DILocalVariable(name: "_51", scope: !8, file: !1, line: 53, type: !12)
!71 = !DILocalVariable(name: "_52", scope: !8, file: !1, line: 54, type: !12)
!72 = !DILocalVariable(name: "_53", scope: !8, file: !1, line: 55, type: !12)
!73 = !DILocation(line: 73, column: 7, scope: !74)
!74 = distinct !DILexicalBlock(scope: !75, file: !1, line: 71, column: 14)
!75 = distinct !DILexicalBlock(scope: !8, file: !1, line: 61, column: 13)
!76 = !DIExpression()
!77 = !DILocation(line: 13, column: 12, scope: !8)
!78 = !DILocation(line: 8, column: 12, scope: !8)
!79 = !DILocation(line: 14, column: 12, scope: !8)
!80 = !DILocation(line: 81, column: 9, scope: !74)
!81 = !DILocation(line: 15, column: 12, scope: !8)
!82 = !DILocation(line: 83, column: 10, scope: !83)
!83 = distinct !DILexicalBlock(scope: !74, file: !1, line: 83, column: 7)
!84 = !DILocation(line: 91, column: 10, scope: !85)
!85 = distinct !DILexicalBlock(scope: !74, file: !1, line: 91, column: 7)
!86 = !DILocation(line: 83, column: 7, scope: !74)
!87 = !DILocation(line: 16, column: 12, scope: !8)
!88 = !DILocation(line: 18, column: 12, scope: !8)
!89 = !DILocation(line: 19, column: 12, scope: !8)
!90 = !DILocation(line: 20, column: 12, scope: !8)
!91 = !DILocation(line: 97, column: 11, scope: !74)
!92 = !DILocation(line: 21, column: 12, scope: !8)
!93 = !DILocation(line: 22, column: 12, scope: !8)
!94 = !DILocation(line: 23, column: 12, scope: !8)
!95 = !DILocation(line: 99, column: 11, scope: !74)
!96 = !DILocation(line: 103, column: 11, scope: !74)
!97 = !DILocation(line: 24, column: 12, scope: !8)
!98 = !DILocation(line: 105, column: 8, scope: !74)
!99 = !{!100, !100, i64 0}
!100 = !{!"long long", !101, i64 0}
!101 = !{!"omnipotent char", !102, i64 0}
!102 = !{!"Simple C/C++ TBAA"}
!103 = !DILocation(line: 25, column: 12, scope: !8)
!104 = !DILocation(line: 107, column: 4, scope: !74)
!105 = !DILocation(line: 26, column: 12, scope: !8)
!106 = !DILocation(line: 9, column: 12, scope: !8)
!107 = !DILocation(line: 27, column: 12, scope: !8)
!108 = !DILocation(line: 117, column: 9, scope: !74)
!109 = !DILocation(line: 28, column: 12, scope: !8)
!110 = !DILocation(line: 119, column: 10, scope: !111)
!111 = distinct !DILexicalBlock(scope: !74, file: !1, line: 119, column: 7)
!112 = !DILocation(line: 119, column: 7, scope: !74)
!113 = !DILocation(line: 29, column: 12, scope: !8)
!114 = !DILocation(line: 30, column: 12, scope: !8)
!115 = !DILocation(line: 125, column: 11, scope: !74)
!116 = !DILocation(line: 31, column: 12, scope: !8)
!117 = !DILocation(line: 127, column: 11, scope: !74)
!118 = !DILocation(line: 32, column: 12, scope: !8)
!119 = !DILocation(line: 129, column: 8, scope: !74)
!120 = !DILocation(line: 33, column: 12, scope: !8)
!121 = !DILocation(line: 131, column: 4, scope: !74)
!122 = !DILocation(line: 34, column: 12, scope: !8)
!123 = !DILocation(line: 10, column: 12, scope: !8)
!124 = !DILocation(line: 35, column: 12, scope: !8)
!125 = !DILocation(line: 37, column: 12, scope: !8)
!126 = !DILocation(line: 145, column: 10, scope: !127)
!127 = distinct !DILexicalBlock(scope: !74, file: !1, line: 145, column: 7)
!128 = !DILocation(line: 171, column: 9, scope: !74)
!129 = !DILocation(line: 145, column: 7, scope: !74)
!130 = !DILocation(line: 38, column: 12, scope: !8)
!131 = !DILocation(line: 39, column: 12, scope: !8)
!132 = !DILocation(line: 40, column: 12, scope: !8)
!133 = !DILocation(line: 149, column: 11, scope: !74)
!134 = !DILocation(line: 153, column: 11, scope: !74)
!135 = !DILocation(line: 41, column: 12, scope: !8)
!136 = !DILocation(line: 155, column: 8, scope: !74)
!137 = !DILocation(line: 42, column: 12, scope: !8)
!138 = !DILocation(line: 157, column: 4, scope: !74)
!139 = !DILocation(line: 161, column: 10, scope: !74)
!140 = !DILocation(line: 44, column: 12, scope: !8)
!141 = !DILocation(line: 163, column: 9, scope: !74)
!142 = !DILocation(line: 45, column: 12, scope: !8)
!143 = !DILocation(line: 165, column: 10, scope: !74)
!144 = !DILocation(line: 46, column: 12, scope: !8)
!145 = !DILocation(line: 167, column: 9, scope: !74)
!146 = !DILocation(line: 47, column: 12, scope: !8)
!147 = !DILocation(line: 169, column: 10, scope: !74)
!148 = !DILocation(line: 43, column: 12, scope: !8)
!149 = !DILocation(line: 48, column: 12, scope: !8)
!150 = !DILocation(line: 173, column: 11, scope: !74)
!151 = !DILocation(line: 49, column: 12, scope: !8)
!152 = !DILocation(line: 175, column: 4, scope: !74)
!153 = !DILocation(line: 175, column: 15, scope: !74)
!154 = !DILocation(line: 50, column: 12, scope: !8)
!155 = !DILocation(line: 179, column: 9, scope: !74)
!156 = !DILocation(line: 51, column: 12, scope: !8)
!157 = !DILocation(line: 6, column: 12, scope: !8)
!158 = !DILocation(line: 52, column: 12, scope: !8)
!159 = !DILocation(line: 53, column: 12, scope: !8)
!160 = !DILocation(line: 7, column: 12, scope: !8)
!161 = !DILocation(line: 54, column: 12, scope: !8)
!162 = !DILocation(line: 196, column: 8, scope: !75)
!163 = !DILocation(line: 55, column: 12, scope: !8)
!164 = !DILocation(line: 5, column: 12, scope: !8)
!165 = !DILocation(line: 63, column: 6, scope: !75)
!166 = !DILocation(line: 206, column: 2, scope: !8)
!167 = !DILocation(line: 63, column: 7, scope: !168)
!168 = distinct !DILexicalBlock(scope: !75, file: !1, line: 63, column: 6)
!169 = distinct !{!169, !170, !"polly.alias.scope.moves"}
!170 = distinct !{!170, !"polly.alias.scope.domain"}
!171 = !{!172, !173, !174}
!172 = distinct !{!172, !170, !"polly.alias.scope.z.0"}
!173 = distinct !{!173, !170, !"polly.alias.scope.x.0"}
!174 = distinct !{!174, !170, !"polly.alias.scope.y.0"}
!175 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 210, type: !176, isLocal: false, isDefinition: true, scopeLine: 210, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !182)
!176 = !DISubroutineType(types: !177)
!177 = !{!178, !178, !179}
!178 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64, align: 64)
!180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64, align: 64)
!181 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!182 = !{!183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220}
!183 = !DILocalVariable(name: "argc", arg: 1, scope: !175, file: !1, line: 210, type: !178)
!184 = !DILocalVariable(name: "args", arg: 2, scope: !175, file: !1, line: 210, type: !179)
!185 = !DILocalVariable(name: "max", scope: !175, file: !1, line: 211, type: !11)
!186 = !DILocalVariable(name: "n", scope: !175, file: !1, line: 212, type: !12)
!187 = !DILocalVariable(name: "moves", scope: !175, file: !1, line: 213, type: !11)
!188 = !DILocalVariable(name: "moves_size", scope: !175, file: !1, line: 213, type: !12)
!189 = !DILocalVariable(name: "moves_has_ownership", scope: !175, file: !1, line: 214, type: !13)
!190 = !DILocalVariable(name: "sum_alice", scope: !175, file: !1, line: 215, type: !12)
!191 = !DILocalVariable(name: "_5", scope: !175, file: !1, line: 216, type: !11)
!192 = !DILocalVariable(name: "_6", scope: !175, file: !1, line: 217, type: !193)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!194 = !DILocalVariable(name: "_6_size", scope: !175, file: !1, line: 217, type: !12)
!195 = !DILocalVariable(name: "_6_size_size", scope: !175, file: !1, line: 217, type: !12)
!196 = !DILocalVariable(name: "_6_has_ownership", scope: !175, file: !1, line: 218, type: !13)
!197 = !DILocalVariable(name: "_7", scope: !175, file: !1, line: 219, type: !12)
!198 = !DILocalVariable(name: "_8", scope: !175, file: !1, line: 220, type: !11)
!199 = !DILocalVariable(name: "_8_size", scope: !175, file: !1, line: 220, type: !12)
!200 = !DILocalVariable(name: "_8_has_ownership", scope: !175, file: !1, line: 221, type: !13)
!201 = !DILocalVariable(name: "_9", scope: !175, file: !1, line: 222, type: !12)
!202 = !DILocalVariable(name: "_10", scope: !175, file: !1, line: 223, type: !12)
!203 = !DILocalVariable(name: "_11", scope: !175, file: !1, line: 224, type: !11)
!204 = !DILocalVariable(name: "_11_size", scope: !175, file: !1, line: 224, type: !12)
!205 = !DILocalVariable(name: "_11_has_ownership", scope: !175, file: !1, line: 225, type: !13)
!206 = !DILocalVariable(name: "_12", scope: !175, file: !1, line: 226, type: !11)
!207 = !DILocalVariable(name: "_12_size", scope: !175, file: !1, line: 226, type: !12)
!208 = !DILocalVariable(name: "_12_has_ownership", scope: !175, file: !1, line: 227, type: !13)
!209 = !DILocalVariable(name: "_13", scope: !175, file: !1, line: 228, type: !12)
!210 = !DILocalVariable(name: "_14", scope: !175, file: !1, line: 229, type: !12)
!211 = !DILocalVariable(name: "_15", scope: !175, file: !1, line: 230, type: !12)
!212 = !DILocalVariable(name: "_16", scope: !175, file: !1, line: 231, type: !4)
!213 = !DILocalVariable(name: "_18", scope: !175, file: !1, line: 232, type: !11)
!214 = !DILocalVariable(name: "_18_size", scope: !175, file: !1, line: 232, type: !12)
!215 = !DILocalVariable(name: "_18_has_ownership", scope: !175, file: !1, line: 233, type: !13)
!216 = !DILocalVariable(name: "_19", scope: !175, file: !1, line: 234, type: !4)
!217 = !DILocalVariable(name: "_21", scope: !175, file: !1, line: 235, type: !4)
!218 = !DILocalVariable(name: "_23", scope: !175, file: !1, line: 236, type: !11)
!219 = !DILocalVariable(name: "_23_size", scope: !175, file: !1, line: 236, type: !12)
!220 = !DILocalVariable(name: "_23_has_ownership", scope: !175, file: !1, line: 237, type: !13)
!221 = !DILocation(line: 210, column: 14, scope: !175)
!222 = !DILocation(line: 210, column: 27, scope: !175)
!223 = !DILocation(line: 212, column: 12, scope: !175)
!224 = !DILocation(line: 213, column: 2, scope: !175)
!225 = !DILocation(line: 214, column: 2, scope: !175)
!226 = !DILocation(line: 215, column: 12, scope: !175)
!227 = !DILocation(line: 217, column: 2, scope: !175)
!228 = !DILocation(line: 218, column: 2, scope: !175)
!229 = !DILocation(line: 219, column: 12, scope: !175)
!230 = !DILocation(line: 220, column: 2, scope: !175)
!231 = !DILocation(line: 221, column: 2, scope: !175)
!232 = !DILocation(line: 222, column: 12, scope: !175)
!233 = !DILocation(line: 223, column: 12, scope: !175)
!234 = !DILocation(line: 224, column: 2, scope: !175)
!235 = !DILocation(line: 225, column: 2, scope: !175)
!236 = !DILocation(line: 226, column: 2, scope: !175)
!237 = !DILocation(line: 227, column: 2, scope: !175)
!238 = !DILocation(line: 228, column: 12, scope: !175)
!239 = !DILocation(line: 229, column: 12, scope: !175)
!240 = !DILocation(line: 230, column: 12, scope: !175)
!241 = !DILocation(line: 232, column: 2, scope: !175)
!242 = !DILocation(line: 233, column: 2, scope: !175)
!243 = !DILocation(line: 236, column: 2, scope: !175)
!244 = !DILocation(line: 237, column: 2, scope: !175)
!245 = !DILocation(line: 239, column: 2, scope: !175)
!246 = !DILocation(line: 244, column: 5, scope: !175)
!247 = !{!248, !248, i64 0}
!248 = !{!"any pointer", !101, i64 0}
!249 = !DILocation(line: 247, column: 2, scope: !175)
!250 = !DILocation(line: 216, column: 13, scope: !175)
!251 = !DILocation(line: 211, column: 13, scope: !175)
!252 = !DILocation(line: 251, column: 9, scope: !253)
!253 = distinct !DILexicalBlock(scope: !175, file: !1, line: 251, column: 5)
!254 = !DILocation(line: 251, column: 5, scope: !175)
!255 = !DILocation(line: 253, column: 6, scope: !175)
!256 = !DILocation(line: 257, column: 7, scope: !175)
!257 = !DILocation(line: 260, column: 2, scope: !175)
!258 = !DILocation(line: 271, column: 8, scope: !175)
!259 = !DILocation(line: 281, column: 7, scope: !175)
!260 = !DILocation(line: 283, column: 6, scope: !175)
!261 = !DILocation(line: 290, column: 2, scope: !175)
!262 = !DILocation(line: 291, column: 9, scope: !175)
!263 = !DILocation(line: 291, column: 29, scope: !175)
!264 = !DILocation(line: 291, column: 36, scope: !175)
!265 = !DILocation(line: 291, column: 56, scope: !175)
!266 = !DILocation(line: 291, column: 63, scope: !175)
!267 = !DILocation(line: 291, column: 84, scope: !175)
!268 = !DILocation(line: 291, column: 91, scope: !175)
!269 = !DILocation(line: 291, column: 111, scope: !175)
!270 = !DILocation(line: 291, column: 118, scope: !175)
!271 = !DILocation(line: 291, column: 138, scope: !175)
!272 = !DILocation(line: 291, column: 146, scope: !175)
!273 = !DILocation(line: 291, column: 167, scope: !175)
!274 = !DILocation(line: 291, column: 175, scope: !175)
!275 = !DILocation(line: 291, column: 197, scope: !175)
!276 = !DILocation(line: 291, column: 205, scope: !175)
!277 = !DILocation(line: 291, column: 227, scope: !175)
!278 = !DILocation(line: 291, column: 235, scope: !175)
!279 = !DILocation(line: 291, column: 256, scope: !175)
!280 = !DILocation(line: 291, column: 264, scope: !175)
!281 = !DILocation(line: 291, column: 285, scope: !175)
!282 = !DILocation(line: 291, column: 293, scope: !175)
!283 = !DILocation(line: 291, column: 315, scope: !175)
!284 = !DILocation(line: 291, column: 323, scope: !175)
!285 = !DILocation(line: 291, column: 345, scope: !175)
!286 = !DILocation(line: 291, column: 353, scope: !175)
!287 = !DILocation(line: 291, column: 374, scope: !175)
!288 = !DILocation(line: 291, column: 382, scope: !175)
!289 = !DILocation(line: 291, column: 403, scope: !175)
!290 = !DILocation(line: 291, column: 411, scope: !175)
!291 = !DILocation(line: 291, column: 432, scope: !175)
!292 = !DILocation(line: 291, column: 440, scope: !175)
!293 = !DILocation(line: 291, column: 462, scope: !175)
!294 = !DILocation(line: 291, column: 470, scope: !175)
!295 = !DILocation(line: 291, column: 492, scope: !175)
!296 = !DILocation(line: 291, column: 500, scope: !175)
!297 = !DILocation(line: 291, column: 520, scope: !175)
!298 = !DILocation(line: 291, column: 528, scope: !175)
!299 = !DILocation(line: 291, column: 549, scope: !175)
!300 = !DILocation(line: 291, column: 557, scope: !175)
!301 = !DILocation(line: 291, column: 578, scope: !175)
!302 = !DILocation(line: 291, column: 586, scope: !175)
!303 = !DILocation(line: 291, column: 607, scope: !175)
!304 = !DILocation(line: 291, column: 615, scope: !175)
!305 = !DILocation(line: 291, column: 637, scope: !175)
!306 = !DILocation(line: 291, column: 645, scope: !175)
!307 = !DILocation(line: 291, column: 667, scope: !175)
!308 = !DILocation(line: 291, column: 675, scope: !175)
!309 = !DILocation(line: 291, column: 696, scope: !175)
!310 = !DILocation(line: 291, column: 704, scope: !175)
!311 = !DILocation(line: 294, column: 2, scope: !175)
!312 = !DILocation(line: 298, column: 2, scope: !175)
!313 = !DILocation(line: 303, column: 2, scope: !175)
!314 = !DILocation(line: 304, column: 9, scope: !175)
!315 = !DILocation(line: 304, column: 28, scope: !175)
!316 = !DILocation(line: 304, column: 35, scope: !175)
!317 = !DILocation(line: 304, column: 56, scope: !175)
!318 = !DILocation(line: 304, column: 63, scope: !175)
!319 = !DILocation(line: 304, column: 82, scope: !175)
!320 = !DILocation(line: 304, column: 89, scope: !175)
!321 = !DILocation(line: 304, column: 110, scope: !175)
!322 = !DILocation(line: 304, column: 117, scope: !175)
!323 = !DILocation(line: 304, column: 137, scope: !175)
!324 = !DILocation(line: 304, column: 145, scope: !175)
!325 = !DILocation(line: 304, column: 166, scope: !175)
!326 = !DILocation(line: 304, column: 174, scope: !175)
!327 = !DILocation(line: 304, column: 195, scope: !175)
!328 = !DILocation(line: 304, column: 203, scope: !175)
!329 = !DILocation(line: 304, column: 225, scope: !175)
!330 = !DILocation(line: 304, column: 233, scope: !175)
!331 = !DILocation(line: 304, column: 255, scope: !175)
!332 = !DILocation(line: 304, column: 263, scope: !175)
!333 = !DILocation(line: 304, column: 283, scope: !175)
!334 = !DILocation(line: 304, column: 291, scope: !175)
!335 = !DILocation(line: 304, column: 312, scope: !175)
!336 = !DILocation(line: 304, column: 320, scope: !175)
!337 = !DILocation(line: 307, column: 2, scope: !175)
!338 = !DILocation(line: 311, column: 2, scope: !339)
!339 = !DILexicalBlockFile(scope: !340, file: !1, discriminator: 1)
!340 = distinct !DILexicalBlock(scope: !341, file: !1, line: 311, column: 2)
!341 = distinct !DILexicalBlock(scope: !175, file: !1, line: 311, column: 2)
!342 = !DILocation(line: 312, column: 2, scope: !343)
!343 = !DILexicalBlockFile(scope: !344, file: !1, discriminator: 1)
!344 = distinct !DILexicalBlock(scope: !345, file: !1, line: 312, column: 2)
!345 = distinct !DILexicalBlock(scope: !175, file: !1, line: 312, column: 2)
!346 = !DILocation(line: 316, column: 2, scope: !347)
!347 = !DILexicalBlockFile(scope: !348, file: !1, discriminator: 1)
!348 = distinct !DILexicalBlock(scope: !349, file: !1, line: 316, column: 2)
!349 = distinct !DILexicalBlock(scope: !175, file: !1, line: 316, column: 2)
!350 = !DILocation(line: 317, column: 2, scope: !351)
!351 = !DILexicalBlockFile(scope: !352, file: !1, discriminator: 1)
!352 = distinct !DILexicalBlock(scope: !353, file: !1, line: 317, column: 2)
!353 = distinct !DILexicalBlock(scope: !175, file: !1, line: 317, column: 2)
!354 = !DILocation(line: 318, column: 2, scope: !175)
