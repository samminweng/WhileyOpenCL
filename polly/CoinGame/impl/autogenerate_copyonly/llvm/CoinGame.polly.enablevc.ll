; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i64 %n) #0 !dbg !8 {
entry:
  %0 = icmp eq i64 %n, 9223372036854775807
  br i1 %0, label %while.cond1.preheader.preheader, label %polly.loop_if

while.cond1.preheader.preheader:                  ; preds = %entry
  br label %while.cond1.preheader, !dbg !71

while.cond1.preheader:                            ; preds = %while.cond1.preheader.preheader, %blklab2
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab2 ], [ 9223372036854775807, %while.cond1.preheader.preheader ]
  %s.0152 = phi i64 [ %add52, %blklab2 ], [ 0, %while.cond1.preheader.preheader ]
  br label %if.end5, !dbg !71

if.end5:                                          ; preds = %blklab6, %while.cond1.preheader
  %i.0150 = phi i64 [ 0, %while.cond1.preheader ], [ %add, %blklab6 ]
  %j.0149 = phi i64 [ %s.0152, %while.cond1.preheader ], [ %add50, %blklab6 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !74), !dbg !75
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !22, metadata !74), !dbg !76
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !74), !dbg !77
  %add = add nuw nsw i64 %i.0150, 1, !dbg !78
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !29, metadata !74), !dbg !79
  %cmp6 = icmp eq i64 %add, 9223372036854775807, !dbg !80
  %cmp9 = icmp slt i64 %j.0149, 1, !dbg !82
  %or.cond = or i1 %cmp9, %cmp6, !dbg !84
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !30, metadata !74), !dbg !85
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !74), !dbg !86
  br i1 %or.cond, label %blklab4, label %if.end11, !dbg !84

if.end11:                                         ; preds = %if.end5
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !33, metadata !74), !dbg !87
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !34, metadata !74), !dbg !88
  %mul = mul nsw i64 %add, 9223372036854775807, !dbg !89
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !35, metadata !74), !dbg !90
  tail call void @llvm.dbg.value(metadata i64 %add13, i64 0, metadata !36, metadata !74), !dbg !91
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !37, metadata !74), !dbg !92
  %add13 = add nsw i64 %j.0149, -1, !dbg !93
  %sub14 = add i64 %add13, %mul, !dbg !94
  tail call void @llvm.dbg.value(metadata i64 %sub14, i64 0, metadata !38, metadata !74), !dbg !95
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %sub14, !dbg !96
  %1 = load i64, i64* %arrayidx, align 8, !dbg !96, !tbaa !97
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !39, metadata !74), !dbg !101
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !22, metadata !74), !dbg !76
  br label %blklab4, !dbg !102

blklab4:                                          ; preds = %if.end5, %if.end11
  %y.0 = phi i64 [ 0, %if.end5 ], [ %1, %if.end11 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !74), !dbg !103
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !23, metadata !74), !dbg !104
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !41, metadata !74), !dbg !105
  %add15 = add nuw nsw i64 %i.0150, 2, !dbg !106
  tail call void @llvm.dbg.value(metadata i64 %add15, i64 0, metadata !42, metadata !74), !dbg !107
  %cmp16 = icmp eq i64 %add15, 9223372036854775807, !dbg !108
  br i1 %cmp16, label %blklab5, label %if.end18, !dbg !110

if.end18:                                         ; preds = %blklab4
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !43, metadata !74), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 %add15, i64 0, metadata !44, metadata !74), !dbg !112
  %mul20 = mul nsw i64 %add15, 9223372036854775807, !dbg !113
  tail call void @llvm.dbg.value(metadata i64 %mul20, i64 0, metadata !45, metadata !74), !dbg !114
  %add21 = add nsw i64 %mul20, %j.0149, !dbg !115
  tail call void @llvm.dbg.value(metadata i64 %add21, i64 0, metadata !46, metadata !74), !dbg !116
  %arrayidx22 = getelementptr inbounds i64, i64* %moves, i64 %add21, !dbg !117
  %2 = load i64, i64* %arrayidx22, align 8, !dbg !117, !tbaa !97
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !47, metadata !74), !dbg !118
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !23, metadata !74), !dbg !104
  br label %blklab5, !dbg !119

blklab5:                                          ; preds = %blklab4, %if.end18
  %x.0 = phi i64 [ 0, %blklab4 ], [ %2, %if.end18 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !48, metadata !74), !dbg !120
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !24, metadata !74), !dbg !121
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !49, metadata !74), !dbg !122
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !74), !dbg !123
  %cmp24 = icmp slt i64 %j.0149, 2, !dbg !124
  %.pre = mul nsw i64 %i.0150, 9223372036854775807, !dbg !126
  br i1 %cmp24, label %blklab6, label %if.end26, !dbg !127

if.end26:                                         ; preds = %blklab5
  tail call void @llvm.dbg.value(metadata i64 %.pre, i64 0, metadata !52, metadata !74), !dbg !128
  tail call void @llvm.dbg.value(metadata i64 %add28, i64 0, metadata !53, metadata !74), !dbg !129
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !54, metadata !74), !dbg !130
  %add28 = add nsw i64 %j.0149, -2, !dbg !131
  %sub29 = add i64 %add28, %.pre, !dbg !132
  tail call void @llvm.dbg.value(metadata i64 %sub29, i64 0, metadata !55, metadata !74), !dbg !133
  %arrayidx30 = getelementptr inbounds i64, i64* %moves, i64 %sub29, !dbg !134
  %3 = load i64, i64* %arrayidx30, align 8, !dbg !134, !tbaa !97
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !56, metadata !74), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !24, metadata !74), !dbg !121
  br label %blklab6, !dbg !136

blklab6:                                          ; preds = %blklab5, %if.end26
  %z.0 = phi i64 [ %3, %if.end26 ], [ 0, %blklab5 ]
  %cmp31 = icmp sgt i64 %x.0, %y.0, !dbg !137
  tail call void @llvm.dbg.value(metadata i64 %y.0, i64 0, metadata !23, metadata !74), !dbg !104
  %y.0.x.0 = select i1 %cmp31, i64 %y.0, i64 %x.0, !dbg !139
  %cmp34 = icmp sgt i64 %z.0, %y.0, !dbg !140
  tail call void @llvm.dbg.value(metadata i64 %y.0, i64 0, metadata !24, metadata !74), !dbg !121
  %z.1 = select i1 %cmp34, i64 %y.0, i64 %z.0, !dbg !142
  %add37 = add nsw i64 %y.0.x.0, %i.0150, !dbg !143
  tail call void @llvm.dbg.value(metadata i64 %add37, i64 0, metadata !57, metadata !74), !dbg !144
  %add38 = add nsw i64 %z.1, %j.0149, !dbg !145
  tail call void @llvm.dbg.value(metadata i64 %add38, i64 0, metadata !58, metadata !74), !dbg !146
  %cmp39 = icmp sgt i64 %add37, %add38, !dbg !147
  %add44 = add nsw i64 %.pre, %j.0149, !dbg !149
  %arrayidx45 = getelementptr inbounds i64, i64* %moves, i64 %add44, !dbg !150
  %add37.add38 = select i1 %cmp39, i64 %add37, i64 %add38, !dbg !151
  store i64 %add37.add38, i64* %arrayidx45, align 8, !dbg !152, !tbaa !97
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !65, metadata !74), !dbg !153
  %add50 = add nuw nsw i64 %j.0149, 1, !dbg !154
  tail call void @llvm.dbg.value(metadata i64 %add50, i64 0, metadata !66, metadata !74), !dbg !155
  tail call void @llvm.dbg.value(metadata i64 %add50, i64 0, metadata !20, metadata !74), !dbg !156
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !67, metadata !74), !dbg !157
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !68, metadata !74), !dbg !158
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !21, metadata !74), !dbg !159
  %exitcond = icmp eq i64 %add, %indvars.iv, !dbg !71
  br i1 %exitcond, label %blklab2, label %if.end5, !dbg !71

blklab2:                                          ; preds = %blklab6
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !69, metadata !74), !dbg !160
  %add52 = add nuw nsw i64 %s.0152, 1, !dbg !161
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !70, metadata !74), !dbg !162
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !19, metadata !74), !dbg !163
  %indvars.iv.next = add i64 %indvars.iv, -1, !dbg !164
  %exitcond153 = icmp eq i64 %add52, 9223372036854775807, !dbg !164
  br i1 %exitcond153, label %blklab0.loopexit, label %while.cond1.preheader, !dbg !164

blklab0.loopexit:                                 ; preds = %blklab2
  br label %blklab0, !dbg !165

blklab0.loopexit197:                              ; preds = %polly.loop_exit157
  br label %blklab0, !dbg !165

blklab0:                                          ; preds = %blklab0.loopexit197, %blklab0.loopexit, %polly.loop_if
  ret i64* %moves, !dbg !165

polly.loop_if:                                    ; preds = %entry
  %cmp151 = icmp sgt i64 %n, 0, !dbg !166
  br i1 %cmp151, label %polly.loop_preheader, label %blklab0

polly.loop_header:                                ; preds = %polly.loop_exit157, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit157 ]
  %4 = sub nsw i64 %n, %polly.indvar
  %polly.loop_guard158 = icmp sgt i64 %4, 0
  br i1 %polly.loop_guard158, label %polly.loop_preheader156, label %polly.loop_exit157

polly.loop_exit157.loopexit:                      ; preds = %polly.stmt.blklab6
  br label %polly.loop_exit157

polly.loop_exit157:                               ; preds = %polly.loop_exit157.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond193 = icmp eq i64 %polly.indvar_next, %n
  br i1 %exitcond193, label %blklab0.loopexit197, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.loop_if
  %5 = add i64 %n, -1
  %scevgep = getelementptr i64, i64* %moves, i64 %5
  %6 = shl i64 %n, 3
  %7 = add i64 %6, 8
  %8 = shl i64 %n, 1
  %scevgep170 = getelementptr i64, i64* %moves, i64 %8
  %scevgep180 = getelementptr i64, i64* %moves, i64 -2
  br label %polly.loop_header

polly.loop_header155:                             ; preds = %polly.stmt.blklab6, %polly.loop_preheader156
  %polly.indvar159 = phi i64 [ 0, %polly.loop_preheader156 ], [ %polly.indvar_next160, %polly.stmt.blklab6 ]
  %9 = add nuw nsw i64 %polly.indvar159, 2
  %10 = icmp sle i64 %9, %n
  %11 = add nuw i64 %polly.indvar159, %polly.indvar
  %12 = icmp sgt i64 %11, 0
  %13 = and i1 %10, %12
  br i1 %13, label %polly.stmt.if.end11, label %polly.cond166

polly.cond166:                                    ; preds = %polly.loop_header155, %polly.stmt.if.end11
  %y.0.phiops.0 = phi i64 [ %_p_scalar_, %polly.stmt.if.end11 ], [ 0, %polly.loop_header155 ]
  %14 = add nuw nsw i64 %polly.indvar159, 3
  %15 = icmp sgt i64 %14, %n
  br i1 %15, label %polly.cond176, label %polly.stmt.if.end18

polly.cond176:                                    ; preds = %polly.cond166, %polly.stmt.if.end18
  %x.0.phiops.0 = phi i64 [ %_p_scalar_175, %polly.stmt.if.end18 ], [ 0, %polly.cond166 ]
  %16 = icmp sgt i64 %11, 1
  %17 = mul i64 %polly.indvar159, %7
  br i1 %16, label %polly.stmt.if.end26, label %polly.stmt.blklab6

polly.stmt.blklab6:                               ; preds = %polly.cond176, %polly.stmt.if.end26
  %z.0.phiops.0 = phi i64 [ %_p_scalar_185, %polly.stmt.if.end26 ], [ 0, %polly.cond176 ]
  %p_cmp31 = icmp sgt i64 %x.0.phiops.0, %y.0.phiops.0, !dbg !137
  %p_y.0.x.0 = select i1 %p_cmp31, i64 %y.0.phiops.0, i64 %x.0.phiops.0, !dbg !139
  %p_cmp34 = icmp sgt i64 %z.0.phiops.0, %y.0.phiops.0, !dbg !140
  %p_z.1 = select i1 %p_cmp34, i64 %y.0.phiops.0, i64 %z.0.phiops.0, !dbg !142
  %p_add37 = add nsw i64 %p_y.0.x.0, %polly.indvar159, !dbg !143
  %p_add38 = add nsw i64 %p_z.1, %11, !dbg !145
  %p_cmp39 = icmp sgt i64 %p_add37, %p_add38, !dbg !147
  %p_add37.p_add38 = select i1 %p_cmp39, i64 %p_add37, i64 %p_add38, !dbg !151
  %uglygep189 = getelementptr i8, i8* %scevgep187188, i64 %17
  %uglygep189190 = bitcast i8* %uglygep189 to i64*
  store i64 %p_add37.p_add38, i64* %uglygep189190, align 8, !alias.scope !168, !noalias !170
  %polly.indvar_next160 = add nuw nsw i64 %polly.indvar159, 1
  %polly.loop_cond162 = icmp slt i64 %polly.indvar159, %polly.adjust_ub161
  br i1 %polly.loop_cond162, label %polly.loop_header155, label %polly.loop_exit157.loopexit

polly.loop_preheader156:                          ; preds = %polly.loop_header
  %scevgep163 = getelementptr i64, i64* %scevgep, i64 %polly.indvar
  %scevgep163164 = bitcast i64* %scevgep163 to i8*
  %scevgep171 = getelementptr i64, i64* %scevgep170, i64 %polly.indvar
  %scevgep171172 = bitcast i64* %scevgep171 to i8*
  %scevgep181 = getelementptr i64, i64* %scevgep180, i64 %polly.indvar
  %scevgep181182 = bitcast i64* %scevgep181 to i8*
  %scevgep187 = getelementptr i64, i64* %moves, i64 %polly.indvar
  %scevgep187188 = bitcast i64* %scevgep187 to i8*
  %polly.adjust_ub161 = add i64 %4, -1
  br label %polly.loop_header155

polly.stmt.if.end11:                              ; preds = %polly.loop_header155
  %18 = mul i64 %polly.indvar159, %7
  %uglygep = getelementptr i8, i8* %scevgep163164, i64 %18
  %uglygep165 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep165, align 8, !alias.scope !168, !noalias !170
  br label %polly.cond166

polly.stmt.if.end18:                              ; preds = %polly.cond166
  %19 = mul i64 %polly.indvar159, %7
  %uglygep173 = getelementptr i8, i8* %scevgep171172, i64 %19
  %uglygep173174 = bitcast i8* %uglygep173 to i64*
  %_p_scalar_175 = load i64, i64* %uglygep173174, align 8, !alias.scope !168, !noalias !170
  br label %polly.cond176

polly.stmt.if.end26:                              ; preds = %polly.cond176
  %uglygep183 = getelementptr i8, i8* %scevgep181182, i64 %17
  %uglygep183184 = bitcast i8* %uglygep183 to i64*
  %_p_scalar_185 = load i64, i64* %uglygep183184, align 8, !alias.scope !168, !noalias !170
  br label %polly.stmt.blklab6
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #1 !dbg !175 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !183, metadata !74), !dbg !214
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !184, metadata !74), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !186, metadata !74), !dbg !216
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !187, metadata !74), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !188, metadata !74), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !189, metadata !74), !dbg !218
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !191, metadata !74), !dbg !219
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !193, metadata !74), !dbg !219
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !194, metadata !74), !dbg !219
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !195, metadata !74), !dbg !220
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !196, metadata !74), !dbg !221
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !197, metadata !74), !dbg !221
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !198, metadata !74), !dbg !222
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !199, metadata !74), !dbg !223
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !200, metadata !74), !dbg !224
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !201, metadata !74), !dbg !224
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !202, metadata !74), !dbg !225
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !203, metadata !74), !dbg !225
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !204, metadata !74), !dbg !226
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !205, metadata !74), !dbg !227
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !206, metadata !74), !dbg !228
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !208, metadata !74), !dbg !229
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !209, metadata !74), !dbg !229
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !212, metadata !74), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !213, metadata !74), !dbg !230
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6, !dbg !231
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !191, metadata !74), !dbg !219
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !195, metadata !74), !dbg !220
  %0 = load i64*, i64** %call, align 8, !dbg !232, !tbaa !233
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !196, metadata !74), !dbg !221
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6, !dbg !235
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !190, metadata !74), !dbg !236
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !185, metadata !74), !dbg !237
  %cmp = icmp eq i64* %call1, null, !dbg !238
  br i1 %cmp, label %blklab11, label %if.end, !dbg !240

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !241, !tbaa !97
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !186, metadata !74), !dbg !216
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !198, metadata !74), !dbg !222
  %mul = mul nsw i64 %1, %1, !dbg !242
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !199, metadata !74), !dbg !223
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !201, metadata !74), !dbg !224
  %conv4 = trunc i64 %mul to i32, !dbg !243
  %call5 = tail call i64* @gen1DArray(i32 0, i32 %conv4) #6, !dbg !243
  tail call void @llvm.dbg.value(metadata i64* %call5, i64 0, metadata !200, metadata !74), !dbg !224
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !188, metadata !74), !dbg !217
  tail call void @llvm.dbg.value(metadata i64* %call5, i64 0, metadata !187, metadata !74), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !203, metadata !74), !dbg !225
  %call6 = tail call i64* @findMoves(i64* %call5, i64 undef, i64 %1), !dbg !244
  tail call void @llvm.dbg.value(metadata i64* %call6, i64 0, metadata !202, metadata !74), !dbg !225
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !188, metadata !74), !dbg !217
  tail call void @llvm.dbg.value(metadata i64* %call6, i64 0, metadata !187, metadata !74), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !204, metadata !74), !dbg !226
  %sub7 = add nsw i64 %1, -1, !dbg !245
  tail call void @llvm.dbg.value(metadata i64 %sub7, i64 0, metadata !205, metadata !74), !dbg !227
  %arrayidx8 = getelementptr inbounds i64, i64* %call6, i64 %sub7, !dbg !246
  %2 = load i64, i64* %arrayidx8, align 8, !dbg !246, !tbaa !97
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !206, metadata !74), !dbg !228
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !189, metadata !74), !dbg !218
  tail call void @llvm.dbg.value(metadata i64 50, i64 0, metadata !209, metadata !74), !dbg !229
  %call9 = tail call noalias i8* @malloc(i64 400) #6, !dbg !247
  %3 = bitcast i8* %call9 to i64*, !dbg !247
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !208, metadata !74), !dbg !229
  %4 = bitcast i8* %call9 to <2 x i64>*, !dbg !248
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %4, align 8, !dbg !248, !tbaa !97
  %arrayidx12 = getelementptr inbounds i8, i8* %call9, i64 16, !dbg !249
  %5 = bitcast i8* %arrayidx12 to <2 x i64>*, !dbg !250
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %5, align 8, !dbg !250, !tbaa !97
  %arrayidx14 = getelementptr inbounds i8, i8* %call9, i64 32, !dbg !251
  %6 = bitcast i8* %arrayidx14 to <2 x i64>*, !dbg !252
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %6, align 8, !dbg !252, !tbaa !97
  %arrayidx16 = getelementptr inbounds i8, i8* %call9, i64 48, !dbg !253
  %7 = bitcast i8* %arrayidx16 to <2 x i64>*, !dbg !254
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %7, align 8, !dbg !254, !tbaa !97
  %arrayidx18 = getelementptr inbounds i8, i8* %call9, i64 64, !dbg !255
  %8 = bitcast i8* %arrayidx18 to <2 x i64>*, !dbg !256
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %8, align 8, !dbg !256, !tbaa !97
  %arrayidx20 = getelementptr inbounds i8, i8* %call9, i64 80, !dbg !257
  %9 = bitcast i8* %arrayidx20 to <2 x i64>*, !dbg !258
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %9, align 8, !dbg !258, !tbaa !97
  %arrayidx22 = getelementptr inbounds i8, i8* %call9, i64 96, !dbg !259
  %10 = bitcast i8* %arrayidx22 to <2 x i64>*, !dbg !260
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %10, align 8, !dbg !260, !tbaa !97
  %arrayidx24 = getelementptr inbounds i8, i8* %call9, i64 112, !dbg !261
  %11 = bitcast i8* %arrayidx24 to <2 x i64>*, !dbg !262
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %11, align 8, !dbg !262, !tbaa !97
  %arrayidx26 = getelementptr inbounds i8, i8* %call9, i64 128, !dbg !263
  %12 = bitcast i8* %arrayidx26 to <2 x i64>*, !dbg !264
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %12, align 8, !dbg !264, !tbaa !97
  %arrayidx28 = getelementptr inbounds i8, i8* %call9, i64 144, !dbg !265
  %13 = bitcast i8* %arrayidx28 to <2 x i64>*, !dbg !266
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %13, align 8, !dbg !266, !tbaa !97
  %arrayidx30 = getelementptr inbounds i8, i8* %call9, i64 160, !dbg !267
  %14 = bitcast i8* %arrayidx30 to <2 x i64>*, !dbg !268
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %14, align 8, !dbg !268, !tbaa !97
  %arrayidx32 = getelementptr inbounds i8, i8* %call9, i64 176, !dbg !269
  %15 = bitcast i8* %arrayidx32 to <2 x i64>*, !dbg !270
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %15, align 8, !dbg !270, !tbaa !97
  %arrayidx34 = getelementptr inbounds i8, i8* %call9, i64 192, !dbg !271
  %16 = bitcast i8* %arrayidx34 to <2 x i64>*, !dbg !272
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %16, align 8, !dbg !272, !tbaa !97
  %arrayidx36 = getelementptr inbounds i8, i8* %call9, i64 208, !dbg !273
  %17 = bitcast i8* %arrayidx36 to <2 x i64>*, !dbg !274
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %17, align 8, !dbg !274, !tbaa !97
  %arrayidx38 = getelementptr inbounds i8, i8* %call9, i64 224, !dbg !275
  %18 = bitcast i8* %arrayidx38 to <2 x i64>*, !dbg !276
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %18, align 8, !dbg !276, !tbaa !97
  %arrayidx40 = getelementptr inbounds i8, i8* %call9, i64 240, !dbg !277
  %19 = bitcast i8* %arrayidx40 to <2 x i64>*, !dbg !278
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %19, align 8, !dbg !278, !tbaa !97
  %arrayidx42 = getelementptr inbounds i8, i8* %call9, i64 256, !dbg !279
  %20 = bitcast i8* %arrayidx42 to <2 x i64>*, !dbg !280
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %20, align 8, !dbg !280, !tbaa !97
  %arrayidx44 = getelementptr inbounds i8, i8* %call9, i64 272, !dbg !281
  %21 = bitcast i8* %arrayidx44 to <2 x i64>*, !dbg !282
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %21, align 8, !dbg !282, !tbaa !97
  %arrayidx46 = getelementptr inbounds i8, i8* %call9, i64 288, !dbg !283
  %22 = bitcast i8* %arrayidx46 to <2 x i64>*, !dbg !284
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %22, align 8, !dbg !284, !tbaa !97
  %arrayidx48 = getelementptr inbounds i8, i8* %call9, i64 304, !dbg !285
  %23 = bitcast i8* %arrayidx48 to <2 x i64>*, !dbg !286
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %23, align 8, !dbg !286, !tbaa !97
  %arrayidx50 = getelementptr inbounds i8, i8* %call9, i64 320, !dbg !287
  %24 = bitcast i8* %arrayidx50 to <2 x i64>*, !dbg !288
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %24, align 8, !dbg !288, !tbaa !97
  %arrayidx52 = getelementptr inbounds i8, i8* %call9, i64 336, !dbg !289
  %25 = bitcast i8* %arrayidx52 to <2 x i64>*, !dbg !290
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %25, align 8, !dbg !290, !tbaa !97
  %arrayidx54 = getelementptr inbounds i8, i8* %call9, i64 352, !dbg !291
  %26 = bitcast i8* %arrayidx54 to <2 x i64>*, !dbg !292
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %26, align 8, !dbg !292, !tbaa !97
  %arrayidx56 = getelementptr inbounds i8, i8* %call9, i64 368, !dbg !293
  %27 = bitcast i8* %arrayidx56 to <2 x i64>*, !dbg !294
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %27, align 8, !dbg !294, !tbaa !97
  %arrayidx58 = getelementptr inbounds i8, i8* %call9, i64 384, !dbg !295
  %28 = bitcast i8* %arrayidx58 to <2 x i64>*, !dbg !296
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %28, align 8, !dbg !296, !tbaa !97
  tail call void @printf_s(i64* %3, i64 50) #6, !dbg !297
  %call60 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2), !dbg !298
  tail call void @llvm.dbg.value(metadata i64 23, i64 0, metadata !213, metadata !74), !dbg !230
  %call61 = tail call noalias i8* @malloc(i64 184) #6, !dbg !299
  %29 = bitcast i8* %call61 to i64*, !dbg !299
  tail call void @llvm.dbg.value(metadata i64* %29, i64 0, metadata !212, metadata !74), !dbg !230
  %30 = bitcast i8* %call61 to <2 x i64>*, !dbg !300
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %30, align 8, !dbg !300, !tbaa !97
  %arrayidx64 = getelementptr inbounds i8, i8* %call61, i64 16, !dbg !301
  %31 = bitcast i8* %arrayidx64 to <2 x i64>*, !dbg !302
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %31, align 8, !dbg !302, !tbaa !97
  %arrayidx66 = getelementptr inbounds i8, i8* %call61, i64 32, !dbg !303
  %32 = bitcast i8* %arrayidx66 to <2 x i64>*, !dbg !304
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %32, align 8, !dbg !304, !tbaa !97
  %arrayidx68 = getelementptr inbounds i8, i8* %call61, i64 48, !dbg !305
  %33 = bitcast i8* %arrayidx68 to <2 x i64>*, !dbg !306
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %33, align 8, !dbg !306, !tbaa !97
  %arrayidx70 = getelementptr inbounds i8, i8* %call61, i64 64, !dbg !307
  %34 = bitcast i8* %arrayidx70 to <2 x i64>*, !dbg !308
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %34, align 8, !dbg !308, !tbaa !97
  %arrayidx72 = getelementptr inbounds i8, i8* %call61, i64 80, !dbg !309
  %35 = bitcast i8* %arrayidx72 to <2 x i64>*, !dbg !310
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %35, align 8, !dbg !310, !tbaa !97
  %arrayidx74 = getelementptr inbounds i8, i8* %call61, i64 96, !dbg !311
  %36 = bitcast i8* %arrayidx74 to <2 x i64>*, !dbg !312
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %36, align 8, !dbg !312, !tbaa !97
  %arrayidx76 = getelementptr inbounds i8, i8* %call61, i64 112, !dbg !313
  %37 = bitcast i8* %arrayidx76 to <2 x i64>*, !dbg !314
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %37, align 8, !dbg !314, !tbaa !97
  %arrayidx78 = getelementptr inbounds i8, i8* %call61, i64 128, !dbg !315
  %38 = bitcast i8* %arrayidx78 to <2 x i64>*, !dbg !316
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %38, align 8, !dbg !316, !tbaa !97
  %arrayidx80 = getelementptr inbounds i8, i8* %call61, i64 144, !dbg !317
  %39 = bitcast i8* %arrayidx80 to <2 x i64>*, !dbg !318
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %39, align 8, !dbg !318, !tbaa !97
  %arrayidx82 = getelementptr inbounds i8, i8* %call61, i64 160, !dbg !319
  %40 = bitcast i8* %arrayidx82 to <2 x i64>*, !dbg !320
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %40, align 8, !dbg !320, !tbaa !97
  %arrayidx84 = getelementptr inbounds i8, i8* %call61, i64 176, !dbg !321
  %41 = bitcast i8* %arrayidx84 to i64*, !dbg !321
  store i64 101, i64* %41, align 8, !dbg !322, !tbaa !97
  tail call void @println_s(i64* %29, i64 23) #6, !dbg !323
  br label %blklab11, !dbg !323

blklab11:                                         ; preds = %entry, %if.end
  tail call void @exit(i32 0) #7, !dbg !324
  unreachable, !dbg !324
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

declare void @printf_s(i64*, i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #3

declare void @println_s(i64*, i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate_copyonly")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"}
!8 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 2, type: !9, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !13)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !12, !12}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!13 = !{!14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70}
!14 = !DILocalVariable(name: "moves", arg: 1, scope: !8, file: !1, line: 2, type: !11)
!15 = !DILocalVariable(name: "moves_size", arg: 2, scope: !8, file: !1, line: 2, type: !12)
!16 = !DILocalVariable(name: "n", arg: 3, scope: !8, file: !1, line: 2, type: !12)
!17 = !DILocalVariable(name: "_2", scope: !8, file: !1, line: 3, type: !11)
!18 = !DILocalVariable(name: "_2_size", scope: !8, file: !1, line: 3, type: !12)
!19 = !DILocalVariable(name: "s", scope: !8, file: !1, line: 4, type: !12)
!20 = !DILocalVariable(name: "j", scope: !8, file: !1, line: 5, type: !12)
!21 = !DILocalVariable(name: "i", scope: !8, file: !1, line: 6, type: !12)
!22 = !DILocalVariable(name: "y", scope: !8, file: !1, line: 7, type: !12)
!23 = !DILocalVariable(name: "x", scope: !8, file: !1, line: 8, type: !12)
!24 = !DILocalVariable(name: "z", scope: !8, file: !1, line: 9, type: !12)
!25 = !DILocalVariable(name: "_9", scope: !8, file: !1, line: 10, type: !12)
!26 = !DILocalVariable(name: "_10", scope: !8, file: !1, line: 11, type: !12)
!27 = !DILocalVariable(name: "_11", scope: !8, file: !1, line: 12, type: !12)
!28 = !DILocalVariable(name: "_12", scope: !8, file: !1, line: 13, type: !12)
!29 = !DILocalVariable(name: "_13", scope: !8, file: !1, line: 14, type: !12)
!30 = !DILocalVariable(name: "_14", scope: !8, file: !1, line: 15, type: !12)
!31 = !DILocalVariable(name: "_15", scope: !8, file: !1, line: 16, type: !12)
!32 = !DILocalVariable(name: "_16", scope: !8, file: !1, line: 17, type: !12)
!33 = !DILocalVariable(name: "_17", scope: !8, file: !1, line: 18, type: !12)
!34 = !DILocalVariable(name: "_18", scope: !8, file: !1, line: 19, type: !12)
!35 = !DILocalVariable(name: "_19", scope: !8, file: !1, line: 20, type: !12)
!36 = !DILocalVariable(name: "_20", scope: !8, file: !1, line: 21, type: !12)
!37 = !DILocalVariable(name: "_21", scope: !8, file: !1, line: 22, type: !12)
!38 = !DILocalVariable(name: "_22", scope: !8, file: !1, line: 23, type: !12)
!39 = !DILocalVariable(name: "_23", scope: !8, file: !1, line: 24, type: !12)
!40 = !DILocalVariable(name: "_24", scope: !8, file: !1, line: 25, type: !12)
!41 = !DILocalVariable(name: "_25", scope: !8, file: !1, line: 26, type: !12)
!42 = !DILocalVariable(name: "_26", scope: !8, file: !1, line: 27, type: !12)
!43 = !DILocalVariable(name: "_27", scope: !8, file: !1, line: 28, type: !12)
!44 = !DILocalVariable(name: "_28", scope: !8, file: !1, line: 29, type: !12)
!45 = !DILocalVariable(name: "_29", scope: !8, file: !1, line: 30, type: !12)
!46 = !DILocalVariable(name: "_30", scope: !8, file: !1, line: 31, type: !12)
!47 = !DILocalVariable(name: "_31", scope: !8, file: !1, line: 32, type: !12)
!48 = !DILocalVariable(name: "_32", scope: !8, file: !1, line: 33, type: !12)
!49 = !DILocalVariable(name: "_33", scope: !8, file: !1, line: 34, type: !12)
!50 = !DILocalVariable(name: "_34", scope: !8, file: !1, line: 35, type: !12)
!51 = !DILocalVariable(name: "_35", scope: !8, file: !1, line: 36, type: !12)
!52 = !DILocalVariable(name: "_36", scope: !8, file: !1, line: 37, type: !12)
!53 = !DILocalVariable(name: "_37", scope: !8, file: !1, line: 38, type: !12)
!54 = !DILocalVariable(name: "_38", scope: !8, file: !1, line: 39, type: !12)
!55 = !DILocalVariable(name: "_39", scope: !8, file: !1, line: 40, type: !12)
!56 = !DILocalVariable(name: "_40", scope: !8, file: !1, line: 41, type: !12)
!57 = !DILocalVariable(name: "_41", scope: !8, file: !1, line: 42, type: !12)
!58 = !DILocalVariable(name: "_42", scope: !8, file: !1, line: 43, type: !12)
!59 = !DILocalVariable(name: "_43", scope: !8, file: !1, line: 44, type: !12)
!60 = !DILocalVariable(name: "_44", scope: !8, file: !1, line: 45, type: !12)
!61 = !DILocalVariable(name: "_45", scope: !8, file: !1, line: 46, type: !12)
!62 = !DILocalVariable(name: "_46", scope: !8, file: !1, line: 47, type: !12)
!63 = !DILocalVariable(name: "_47", scope: !8, file: !1, line: 48, type: !12)
!64 = !DILocalVariable(name: "_48", scope: !8, file: !1, line: 49, type: !12)
!65 = !DILocalVariable(name: "_49", scope: !8, file: !1, line: 50, type: !12)
!66 = !DILocalVariable(name: "_50", scope: !8, file: !1, line: 51, type: !12)
!67 = !DILocalVariable(name: "_51", scope: !8, file: !1, line: 52, type: !12)
!68 = !DILocalVariable(name: "_52", scope: !8, file: !1, line: 53, type: !12)
!69 = !DILocalVariable(name: "_53", scope: !8, file: !1, line: 54, type: !12)
!70 = !DILocalVariable(name: "_54", scope: !8, file: !1, line: 55, type: !12)
!71 = !DILocation(line: 73, column: 7, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !1, line: 71, column: 14)
!73 = distinct !DILexicalBlock(scope: !8, file: !1, line: 61, column: 13)
!74 = !DIExpression()
!75 = !DILocation(line: 12, column: 12, scope: !8)
!76 = !DILocation(line: 7, column: 12, scope: !8)
!77 = !DILocation(line: 13, column: 12, scope: !8)
!78 = !DILocation(line: 81, column: 9, scope: !72)
!79 = !DILocation(line: 14, column: 12, scope: !8)
!80 = !DILocation(line: 83, column: 10, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !1, line: 83, column: 7)
!82 = !DILocation(line: 91, column: 10, scope: !83)
!83 = distinct !DILexicalBlock(scope: !72, file: !1, line: 91, column: 7)
!84 = !DILocation(line: 83, column: 7, scope: !72)
!85 = !DILocation(line: 15, column: 12, scope: !8)
!86 = !DILocation(line: 17, column: 12, scope: !8)
!87 = !DILocation(line: 18, column: 12, scope: !8)
!88 = !DILocation(line: 19, column: 12, scope: !8)
!89 = !DILocation(line: 97, column: 11, scope: !72)
!90 = !DILocation(line: 20, column: 12, scope: !8)
!91 = !DILocation(line: 21, column: 12, scope: !8)
!92 = !DILocation(line: 22, column: 12, scope: !8)
!93 = !DILocation(line: 99, column: 11, scope: !72)
!94 = !DILocation(line: 103, column: 11, scope: !72)
!95 = !DILocation(line: 23, column: 12, scope: !8)
!96 = !DILocation(line: 105, column: 8, scope: !72)
!97 = !{!98, !98, i64 0}
!98 = !{!"long long", !99, i64 0}
!99 = !{!"omnipotent char", !100, i64 0}
!100 = !{!"Simple C/C++ TBAA"}
!101 = !DILocation(line: 24, column: 12, scope: !8)
!102 = !DILocation(line: 107, column: 4, scope: !72)
!103 = !DILocation(line: 25, column: 12, scope: !8)
!104 = !DILocation(line: 8, column: 12, scope: !8)
!105 = !DILocation(line: 26, column: 12, scope: !8)
!106 = !DILocation(line: 117, column: 9, scope: !72)
!107 = !DILocation(line: 27, column: 12, scope: !8)
!108 = !DILocation(line: 119, column: 10, scope: !109)
!109 = distinct !DILexicalBlock(scope: !72, file: !1, line: 119, column: 7)
!110 = !DILocation(line: 119, column: 7, scope: !72)
!111 = !DILocation(line: 28, column: 12, scope: !8)
!112 = !DILocation(line: 29, column: 12, scope: !8)
!113 = !DILocation(line: 125, column: 11, scope: !72)
!114 = !DILocation(line: 30, column: 12, scope: !8)
!115 = !DILocation(line: 127, column: 11, scope: !72)
!116 = !DILocation(line: 31, column: 12, scope: !8)
!117 = !DILocation(line: 129, column: 8, scope: !72)
!118 = !DILocation(line: 32, column: 12, scope: !8)
!119 = !DILocation(line: 131, column: 4, scope: !72)
!120 = !DILocation(line: 33, column: 12, scope: !8)
!121 = !DILocation(line: 9, column: 12, scope: !8)
!122 = !DILocation(line: 34, column: 12, scope: !8)
!123 = !DILocation(line: 36, column: 12, scope: !8)
!124 = !DILocation(line: 145, column: 10, scope: !125)
!125 = distinct !DILexicalBlock(scope: !72, file: !1, line: 145, column: 7)
!126 = !DILocation(line: 181, column: 9, scope: !72)
!127 = !DILocation(line: 145, column: 7, scope: !72)
!128 = !DILocation(line: 37, column: 12, scope: !8)
!129 = !DILocation(line: 38, column: 12, scope: !8)
!130 = !DILocation(line: 39, column: 12, scope: !8)
!131 = !DILocation(line: 149, column: 11, scope: !72)
!132 = !DILocation(line: 153, column: 11, scope: !72)
!133 = !DILocation(line: 40, column: 12, scope: !8)
!134 = !DILocation(line: 155, column: 8, scope: !72)
!135 = !DILocation(line: 41, column: 12, scope: !8)
!136 = !DILocation(line: 157, column: 4, scope: !72)
!137 = !DILocation(line: 161, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !72, file: !1, line: 161, column: 7)
!139 = !DILocation(line: 161, column: 7, scope: !72)
!140 = !DILocation(line: 167, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !72, file: !1, line: 167, column: 7)
!142 = !DILocation(line: 167, column: 7, scope: !72)
!143 = !DILocation(line: 173, column: 9, scope: !72)
!144 = !DILocation(line: 42, column: 12, scope: !8)
!145 = !DILocation(line: 175, column: 9, scope: !72)
!146 = !DILocation(line: 43, column: 12, scope: !8)
!147 = !DILocation(line: 177, column: 10, scope: !148)
!148 = distinct !DILexicalBlock(scope: !72, file: !1, line: 177, column: 7)
!149 = !DILocation(line: 183, column: 11, scope: !72)
!150 = !DILocation(line: 185, column: 4, scope: !72)
!151 = !DILocation(line: 187, column: 4, scope: !72)
!152 = !DILocation(line: 185, column: 15, scope: !72)
!153 = !DILocation(line: 50, column: 12, scope: !8)
!154 = !DILocation(line: 203, column: 9, scope: !72)
!155 = !DILocation(line: 51, column: 12, scope: !8)
!156 = !DILocation(line: 5, column: 12, scope: !8)
!157 = !DILocation(line: 52, column: 12, scope: !8)
!158 = !DILocation(line: 53, column: 12, scope: !8)
!159 = !DILocation(line: 6, column: 12, scope: !8)
!160 = !DILocation(line: 54, column: 12, scope: !8)
!161 = !DILocation(line: 220, column: 8, scope: !73)
!162 = !DILocation(line: 55, column: 12, scope: !8)
!163 = !DILocation(line: 4, column: 12, scope: !8)
!164 = !DILocation(line: 63, column: 6, scope: !73)
!165 = !DILocation(line: 229, column: 2, scope: !8)
!166 = !DILocation(line: 63, column: 7, scope: !167)
!167 = distinct !DILexicalBlock(scope: !73, file: !1, line: 63, column: 6)
!168 = distinct !{!168, !169, !"polly.alias.scope.moves"}
!169 = distinct !{!169, !"polly.alias.scope.domain"}
!170 = !{!171, !172, !173, !174}
!171 = distinct !{!171, !169, !"polly.alias.scope.x.0"}
!172 = distinct !{!172, !169, !"polly.alias.scope.storemerge"}
!173 = distinct !{!173, !169, !"polly.alias.scope.z.0"}
!174 = distinct !{!174, !169, !"polly.alias.scope.y.0"}
!175 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 233, type: !176, isLocal: false, isDefinition: true, scopeLine: 233, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !182)
!176 = !DISubroutineType(types: !177)
!177 = !{!178, !178, !179}
!178 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64, align: 64)
!180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !181, size: 64, align: 64)
!181 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!182 = !{!183, !184, !185, !186, !187, !188, !189, !190, !191, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213}
!183 = !DILocalVariable(name: "argc", arg: 1, scope: !175, file: !1, line: 233, type: !178)
!184 = !DILocalVariable(name: "args", arg: 2, scope: !175, file: !1, line: 233, type: !179)
!185 = !DILocalVariable(name: "max", scope: !175, file: !1, line: 234, type: !11)
!186 = !DILocalVariable(name: "n", scope: !175, file: !1, line: 235, type: !12)
!187 = !DILocalVariable(name: "moves", scope: !175, file: !1, line: 236, type: !11)
!188 = !DILocalVariable(name: "moves_size", scope: !175, file: !1, line: 236, type: !12)
!189 = !DILocalVariable(name: "sum_alice", scope: !175, file: !1, line: 237, type: !12)
!190 = !DILocalVariable(name: "_5", scope: !175, file: !1, line: 238, type: !11)
!191 = !DILocalVariable(name: "_6", scope: !175, file: !1, line: 239, type: !192)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!193 = !DILocalVariable(name: "_6_size", scope: !175, file: !1, line: 239, type: !12)
!194 = !DILocalVariable(name: "_6_size_size", scope: !175, file: !1, line: 239, type: !12)
!195 = !DILocalVariable(name: "_7", scope: !175, file: !1, line: 240, type: !12)
!196 = !DILocalVariable(name: "_8", scope: !175, file: !1, line: 241, type: !11)
!197 = !DILocalVariable(name: "_8_size", scope: !175, file: !1, line: 241, type: !12)
!198 = !DILocalVariable(name: "_9", scope: !175, file: !1, line: 242, type: !12)
!199 = !DILocalVariable(name: "_10", scope: !175, file: !1, line: 243, type: !12)
!200 = !DILocalVariable(name: "_11", scope: !175, file: !1, line: 244, type: !11)
!201 = !DILocalVariable(name: "_11_size", scope: !175, file: !1, line: 244, type: !12)
!202 = !DILocalVariable(name: "_12", scope: !175, file: !1, line: 245, type: !11)
!203 = !DILocalVariable(name: "_12_size", scope: !175, file: !1, line: 245, type: !12)
!204 = !DILocalVariable(name: "_13", scope: !175, file: !1, line: 246, type: !12)
!205 = !DILocalVariable(name: "_14", scope: !175, file: !1, line: 247, type: !12)
!206 = !DILocalVariable(name: "_15", scope: !175, file: !1, line: 248, type: !12)
!207 = !DILocalVariable(name: "_16", scope: !175, file: !1, line: 249, type: !4)
!208 = !DILocalVariable(name: "_18", scope: !175, file: !1, line: 250, type: !11)
!209 = !DILocalVariable(name: "_18_size", scope: !175, file: !1, line: 250, type: !12)
!210 = !DILocalVariable(name: "_19", scope: !175, file: !1, line: 251, type: !4)
!211 = !DILocalVariable(name: "_21", scope: !175, file: !1, line: 252, type: !4)
!212 = !DILocalVariable(name: "_23", scope: !175, file: !1, line: 253, type: !11)
!213 = !DILocalVariable(name: "_23_size", scope: !175, file: !1, line: 253, type: !12)
!214 = !DILocation(line: 233, column: 14, scope: !175)
!215 = !DILocation(line: 233, column: 27, scope: !175)
!216 = !DILocation(line: 235, column: 12, scope: !175)
!217 = !DILocation(line: 236, column: 2, scope: !175)
!218 = !DILocation(line: 237, column: 12, scope: !175)
!219 = !DILocation(line: 239, column: 2, scope: !175)
!220 = !DILocation(line: 240, column: 12, scope: !175)
!221 = !DILocation(line: 241, column: 2, scope: !175)
!222 = !DILocation(line: 242, column: 12, scope: !175)
!223 = !DILocation(line: 243, column: 12, scope: !175)
!224 = !DILocation(line: 244, column: 2, scope: !175)
!225 = !DILocation(line: 245, column: 2, scope: !175)
!226 = !DILocation(line: 246, column: 12, scope: !175)
!227 = !DILocation(line: 247, column: 12, scope: !175)
!228 = !DILocation(line: 248, column: 12, scope: !175)
!229 = !DILocation(line: 250, column: 2, scope: !175)
!230 = !DILocation(line: 253, column: 2, scope: !175)
!231 = !DILocation(line: 255, column: 2, scope: !175)
!232 = !DILocation(line: 259, column: 5, scope: !175)
!233 = !{!234, !234, i64 0}
!234 = !{!"any pointer", !99, i64 0}
!235 = !DILocation(line: 261, column: 2, scope: !175)
!236 = !DILocation(line: 238, column: 13, scope: !175)
!237 = !DILocation(line: 234, column: 13, scope: !175)
!238 = !DILocation(line: 265, column: 9, scope: !239)
!239 = distinct !DILexicalBlock(scope: !175, file: !1, line: 265, column: 5)
!240 = !DILocation(line: 265, column: 5, scope: !175)
!241 = !DILocation(line: 267, column: 6, scope: !175)
!242 = !DILocation(line: 271, column: 7, scope: !175)
!243 = !DILocation(line: 273, column: 2, scope: !175)
!244 = !DILocation(line: 278, column: 8, scope: !175)
!245 = !DILocation(line: 284, column: 7, scope: !175)
!246 = !DILocation(line: 286, column: 6, scope: !175)
!247 = !DILocation(line: 292, column: 2, scope: !175)
!248 = !DILocation(line: 293, column: 9, scope: !175)
!249 = !DILocation(line: 293, column: 29, scope: !175)
!250 = !DILocation(line: 293, column: 36, scope: !175)
!251 = !DILocation(line: 293, column: 56, scope: !175)
!252 = !DILocation(line: 293, column: 63, scope: !175)
!253 = !DILocation(line: 293, column: 84, scope: !175)
!254 = !DILocation(line: 293, column: 91, scope: !175)
!255 = !DILocation(line: 293, column: 111, scope: !175)
!256 = !DILocation(line: 293, column: 118, scope: !175)
!257 = !DILocation(line: 293, column: 138, scope: !175)
!258 = !DILocation(line: 293, column: 146, scope: !175)
!259 = !DILocation(line: 293, column: 167, scope: !175)
!260 = !DILocation(line: 293, column: 175, scope: !175)
!261 = !DILocation(line: 293, column: 197, scope: !175)
!262 = !DILocation(line: 293, column: 205, scope: !175)
!263 = !DILocation(line: 293, column: 227, scope: !175)
!264 = !DILocation(line: 293, column: 235, scope: !175)
!265 = !DILocation(line: 293, column: 256, scope: !175)
!266 = !DILocation(line: 293, column: 264, scope: !175)
!267 = !DILocation(line: 293, column: 285, scope: !175)
!268 = !DILocation(line: 293, column: 293, scope: !175)
!269 = !DILocation(line: 293, column: 315, scope: !175)
!270 = !DILocation(line: 293, column: 323, scope: !175)
!271 = !DILocation(line: 293, column: 345, scope: !175)
!272 = !DILocation(line: 293, column: 353, scope: !175)
!273 = !DILocation(line: 293, column: 374, scope: !175)
!274 = !DILocation(line: 293, column: 382, scope: !175)
!275 = !DILocation(line: 293, column: 403, scope: !175)
!276 = !DILocation(line: 293, column: 411, scope: !175)
!277 = !DILocation(line: 293, column: 432, scope: !175)
!278 = !DILocation(line: 293, column: 440, scope: !175)
!279 = !DILocation(line: 293, column: 462, scope: !175)
!280 = !DILocation(line: 293, column: 470, scope: !175)
!281 = !DILocation(line: 293, column: 492, scope: !175)
!282 = !DILocation(line: 293, column: 500, scope: !175)
!283 = !DILocation(line: 293, column: 520, scope: !175)
!284 = !DILocation(line: 293, column: 528, scope: !175)
!285 = !DILocation(line: 293, column: 549, scope: !175)
!286 = !DILocation(line: 293, column: 557, scope: !175)
!287 = !DILocation(line: 293, column: 578, scope: !175)
!288 = !DILocation(line: 293, column: 586, scope: !175)
!289 = !DILocation(line: 293, column: 607, scope: !175)
!290 = !DILocation(line: 293, column: 615, scope: !175)
!291 = !DILocation(line: 293, column: 637, scope: !175)
!292 = !DILocation(line: 293, column: 645, scope: !175)
!293 = !DILocation(line: 293, column: 667, scope: !175)
!294 = !DILocation(line: 293, column: 675, scope: !175)
!295 = !DILocation(line: 293, column: 696, scope: !175)
!296 = !DILocation(line: 293, column: 704, scope: !175)
!297 = !DILocation(line: 295, column: 2, scope: !175)
!298 = !DILocation(line: 299, column: 2, scope: !175)
!299 = !DILocation(line: 303, column: 2, scope: !175)
!300 = !DILocation(line: 304, column: 9, scope: !175)
!301 = !DILocation(line: 304, column: 28, scope: !175)
!302 = !DILocation(line: 304, column: 35, scope: !175)
!303 = !DILocation(line: 304, column: 56, scope: !175)
!304 = !DILocation(line: 304, column: 63, scope: !175)
!305 = !DILocation(line: 304, column: 82, scope: !175)
!306 = !DILocation(line: 304, column: 89, scope: !175)
!307 = !DILocation(line: 304, column: 110, scope: !175)
!308 = !DILocation(line: 304, column: 117, scope: !175)
!309 = !DILocation(line: 304, column: 137, scope: !175)
!310 = !DILocation(line: 304, column: 145, scope: !175)
!311 = !DILocation(line: 304, column: 166, scope: !175)
!312 = !DILocation(line: 304, column: 174, scope: !175)
!313 = !DILocation(line: 304, column: 195, scope: !175)
!314 = !DILocation(line: 304, column: 203, scope: !175)
!315 = !DILocation(line: 304, column: 225, scope: !175)
!316 = !DILocation(line: 304, column: 233, scope: !175)
!317 = !DILocation(line: 304, column: 255, scope: !175)
!318 = !DILocation(line: 304, column: 263, scope: !175)
!319 = !DILocation(line: 304, column: 283, scope: !175)
!320 = !DILocation(line: 304, column: 291, scope: !175)
!321 = !DILocation(line: 304, column: 312, scope: !175)
!322 = !DILocation(line: 304, column: 320, scope: !175)
!323 = !DILocation(line: 306, column: 2, scope: !175)
!324 = !DILocation(line: 310, column: 2, scope: !175)
