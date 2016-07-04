; ModuleID = 'CoinGame_original.c'
source_filename = "CoinGame_original.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_dealloc, i64 %n) local_unnamed_addr #0 !dbg !8 {
entry:
  %0 = icmp eq i64 %n, 9223372036854775807
  br i1 %0, label %while.cond1.preheader.preheader, label %polly.loop_if

while.cond1.preheader.preheader:                  ; preds = %entry
  br label %while.cond1.preheader, !dbg !74

while.cond1.preheader:                            ; preds = %while.cond1.preheader.preheader, %blklab2
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab2 ], [ 9223372036854775807, %while.cond1.preheader.preheader ]
  %s.0154 = phi i64 [ %add52, %blklab2 ], [ 0, %while.cond1.preheader.preheader ]
  br label %if.end5, !dbg !74

if.end5:                                          ; preds = %blklab6, %while.cond1.preheader
  %i.0152 = phi i64 [ 0, %while.cond1.preheader ], [ %add, %blklab6 ]
  %j.0151 = phi i64 [ %s.0154, %while.cond1.preheader ], [ %add50, %blklab6 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !30, metadata !77), !dbg !78
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !77), !dbg !79
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !31, metadata !77), !dbg !80
  %add = add nuw nsw i64 %i.0152, 1, !dbg !81
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !32, metadata !77), !dbg !82
  %cmp6 = icmp eq i64 %add, 9223372036854775807, !dbg !83
  %cmp9 = icmp slt i64 %j.0151, 1, !dbg !85
  %or.cond = or i1 %cmp9, %cmp6, !dbg !87
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !33, metadata !77), !dbg !88
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !77), !dbg !89
  br i1 %or.cond, label %blklab4, label %if.end11, !dbg !87

if.end11:                                         ; preds = %if.end5
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !36, metadata !77), !dbg !90
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !37, metadata !77), !dbg !91
  %mul = mul nsw i64 %add, 9223372036854775807, !dbg !92
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !38, metadata !77), !dbg !93
  tail call void @llvm.dbg.value(metadata i64 %add13, i64 0, metadata !39, metadata !77), !dbg !94
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !40, metadata !77), !dbg !95
  %add13 = add nsw i64 %j.0151, -1, !dbg !96
  %sub14 = add i64 %add13, %mul, !dbg !97
  tail call void @llvm.dbg.value(metadata i64 %sub14, i64 0, metadata !41, metadata !77), !dbg !98
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %sub14, !dbg !99
  %1 = load i64, i64* %arrayidx, align 8, !dbg !99, !tbaa !100
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !42, metadata !77), !dbg !104
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !25, metadata !77), !dbg !79
  br label %blklab4, !dbg !105

blklab4:                                          ; preds = %if.end5, %if.end11
  %y.0 = phi i64 [ 0, %if.end5 ], [ %1, %if.end11 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !77), !dbg !106
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !26, metadata !77), !dbg !107
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !44, metadata !77), !dbg !108
  %add15 = add nuw nsw i64 %i.0152, 2, !dbg !109
  tail call void @llvm.dbg.value(metadata i64 %add15, i64 0, metadata !45, metadata !77), !dbg !110
  %cmp16 = icmp eq i64 %add15, 9223372036854775807, !dbg !111
  br i1 %cmp16, label %blklab5, label %if.end18, !dbg !113

if.end18:                                         ; preds = %blklab4
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !46, metadata !77), !dbg !114
  tail call void @llvm.dbg.value(metadata i64 %add15, i64 0, metadata !47, metadata !77), !dbg !115
  %mul20 = mul nsw i64 %add15, 9223372036854775807, !dbg !116
  tail call void @llvm.dbg.value(metadata i64 %mul20, i64 0, metadata !48, metadata !77), !dbg !117
  %add21 = add nsw i64 %mul20, %j.0151, !dbg !118
  tail call void @llvm.dbg.value(metadata i64 %add21, i64 0, metadata !49, metadata !77), !dbg !119
  %arrayidx22 = getelementptr inbounds i64, i64* %moves, i64 %add21, !dbg !120
  %2 = load i64, i64* %arrayidx22, align 8, !dbg !120, !tbaa !100
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !50, metadata !77), !dbg !121
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !26, metadata !77), !dbg !107
  br label %blklab5, !dbg !122

blklab5:                                          ; preds = %blklab4, %if.end18
  %x.0 = phi i64 [ 0, %blklab4 ], [ %2, %if.end18 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !77), !dbg !123
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !77), !dbg !124
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !52, metadata !77), !dbg !125
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !77), !dbg !126
  %cmp24 = icmp slt i64 %j.0151, 2, !dbg !127
  %.pre = mul nsw i64 %i.0152, 9223372036854775807, !dbg !129
  br i1 %cmp24, label %blklab6, label %if.end26, !dbg !130

if.end26:                                         ; preds = %blklab5
  tail call void @llvm.dbg.value(metadata i64 %.pre, i64 0, metadata !55, metadata !77), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 %add28, i64 0, metadata !56, metadata !77), !dbg !132
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !57, metadata !77), !dbg !133
  %add28 = add nsw i64 %j.0151, -2, !dbg !134
  %sub29 = add i64 %add28, %.pre, !dbg !135
  tail call void @llvm.dbg.value(metadata i64 %sub29, i64 0, metadata !58, metadata !77), !dbg !136
  %arrayidx30 = getelementptr inbounds i64, i64* %moves, i64 %sub29, !dbg !137
  %3 = load i64, i64* %arrayidx30, align 8, !dbg !137, !tbaa !100
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !59, metadata !77), !dbg !138
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !27, metadata !77), !dbg !124
  br label %blklab6, !dbg !139

blklab6:                                          ; preds = %blklab5, %if.end26
  %z.0 = phi i64 [ %3, %if.end26 ], [ 0, %blklab5 ]
  %cmp31 = icmp sgt i64 %x.0, %y.0, !dbg !140
  tail call void @llvm.dbg.value(metadata i64 %y.0, i64 0, metadata !26, metadata !77), !dbg !107
  %y.0.x.0 = select i1 %cmp31, i64 %y.0, i64 %x.0, !dbg !142
  %cmp34 = icmp sgt i64 %z.0, %y.0, !dbg !143
  tail call void @llvm.dbg.value(metadata i64 %y.0, i64 0, metadata !27, metadata !77), !dbg !124
  %z.1 = select i1 %cmp34, i64 %y.0, i64 %z.0, !dbg !145
  %add37 = add nsw i64 %y.0.x.0, %i.0152, !dbg !146
  tail call void @llvm.dbg.value(metadata i64 %add37, i64 0, metadata !60, metadata !77), !dbg !147
  %add38 = add nsw i64 %z.1, %j.0151, !dbg !148
  tail call void @llvm.dbg.value(metadata i64 %add38, i64 0, metadata !61, metadata !77), !dbg !149
  %cmp39 = icmp sgt i64 %add37, %add38, !dbg !150
  %add44 = add nsw i64 %.pre, %j.0151, !dbg !152
  %arrayidx45 = getelementptr inbounds i64, i64* %moves, i64 %add44, !dbg !153
  %add37.add38 = select i1 %cmp39, i64 %add37, i64 %add38, !dbg !154
  store i64 %add37.add38, i64* %arrayidx45, align 8, !dbg !155, !tbaa !100
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !68, metadata !77), !dbg !156
  %add50 = add nuw nsw i64 %j.0151, 1, !dbg !157
  tail call void @llvm.dbg.value(metadata i64 %add50, i64 0, metadata !69, metadata !77), !dbg !158
  tail call void @llvm.dbg.value(metadata i64 %add50, i64 0, metadata !23, metadata !77), !dbg !159
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !70, metadata !77), !dbg !160
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !71, metadata !77), !dbg !161
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !24, metadata !77), !dbg !162
  %exitcond = icmp eq i64 %add, %indvars.iv, !dbg !74
  br i1 %exitcond, label %blklab2, label %if.end5, !dbg !74, !llvm.loop !163

blklab2:                                          ; preds = %blklab6
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !72, metadata !77), !dbg !165
  %add52 = add nuw nsw i64 %s.0154, 1, !dbg !166
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !73, metadata !77), !dbg !167
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !22, metadata !77), !dbg !168
  %indvars.iv.next = add i64 %indvars.iv, -1, !dbg !169
  %exitcond155 = icmp eq i64 %add52, 9223372036854775807, !dbg !169
  br i1 %exitcond155, label %if.end54.loopexit, label %while.cond1.preheader, !dbg !169, !llvm.loop !170

if.end54.loopexit:                                ; preds = %blklab2
  br label %if.end54, !dbg !172

if.end54.loopexit199:                             ; preds = %polly.loop_exit159
  br label %if.end54, !dbg !172

if.end54:                                         ; preds = %if.end54.loopexit199, %if.end54.loopexit, %polly.loop_if
  ret i64* %moves, !dbg !172

polly.loop_if:                                    ; preds = %entry
  %polly.loop_guard = icmp sgt i64 %n, 0
  br i1 %polly.loop_guard, label %polly.loop_preheader, label %if.end54

polly.loop_header:                                ; preds = %polly.loop_exit159, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit159 ]
  %4 = sub nsw i64 %n, %polly.indvar
  %polly.loop_guard160 = icmp sgt i64 %4, 0
  br i1 %polly.loop_guard160, label %polly.loop_preheader158, label %polly.loop_exit159

polly.loop_exit159.loopexit:                      ; preds = %polly.stmt.blklab6
  br label %polly.loop_exit159

polly.loop_exit159:                               ; preds = %polly.loop_exit159.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond195 = icmp eq i64 %polly.indvar_next, %n
  br i1 %exitcond195, label %if.end54.loopexit199, label %polly.loop_header

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
  %p_cmp31 = icmp sgt i64 %x.0.phiops.0, %y.0.phiops.0, !dbg !140
  %p_y.0.x.0 = select i1 %p_cmp31, i64 %y.0.phiops.0, i64 %x.0.phiops.0, !dbg !142
  %p_cmp34 = icmp sgt i64 %z.0.phiops.0, %y.0.phiops.0, !dbg !143
  %p_z.1 = select i1 %p_cmp34, i64 %y.0.phiops.0, i64 %z.0.phiops.0, !dbg !145
  %p_add37 = add nsw i64 %p_y.0.x.0, %polly.indvar161, !dbg !146
  %p_add38 = add nsw i64 %p_z.1, %11, !dbg !148
  %p_cmp39 = icmp sgt i64 %p_add37, %p_add38, !dbg !150
  %p_add37.p_add38 = select i1 %p_cmp39, i64 %p_add37, i64 %p_add38, !dbg !154
  %uglygep191 = getelementptr i8, i8* %scevgep189190, i64 %17
  %uglygep191192 = bitcast i8* %uglygep191 to i64*
  store i64 %p_add37.p_add38, i64* %uglygep191192, align 8, !alias.scope !173, !noalias !175
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
  %scevgep189 = getelementptr i64, i64* %moves, i64 %polly.indvar
  %scevgep189190 = bitcast i64* %scevgep189 to i8*
  %polly.adjust_ub163 = add i64 %4, -1
  br label %polly.loop_header157

polly.stmt.if.end11:                              ; preds = %polly.loop_header157
  %18 = mul i64 %polly.indvar161, %7
  %uglygep = getelementptr i8, i8* %scevgep165166, i64 %18
  %uglygep167 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep167, align 8, !alias.scope !173, !noalias !175
  br label %polly.cond168

polly.stmt.if.end18:                              ; preds = %polly.cond168
  %19 = mul i64 %polly.indvar161, %7
  %uglygep175 = getelementptr i8, i8* %scevgep173174, i64 %19
  %uglygep175176 = bitcast i8* %uglygep175 to i64*
  %_p_scalar_177 = load i64, i64* %uglygep175176, align 8, !alias.scope !173, !noalias !175
  br label %polly.cond178

polly.stmt.if.end26:                              ; preds = %polly.cond178
  %uglygep185 = getelementptr i8, i8* %scevgep183184, i64 %17
  %uglygep185186 = bitcast i8* %uglygep185 to i64*
  %_p_scalar_187 = load i64, i64* %uglygep185186, align 8, !alias.scope !173, !noalias !175
  br label %polly.stmt.blklab6
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) local_unnamed_addr #2 !dbg !180 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !188, metadata !77), !dbg !228
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !189, metadata !77), !dbg !229
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !191, metadata !77), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !192, metadata !77), !dbg !231
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !193, metadata !77), !dbg !232
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !194, metadata !77), !dbg !232
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !195, metadata !77), !dbg !233
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !196, metadata !77), !dbg !234
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !198, metadata !77), !dbg !235
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !199, metadata !77), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !201, metadata !77), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !202, metadata !77), !dbg !236
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !203, metadata !77), !dbg !237
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !204, metadata !77), !dbg !238
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !205, metadata !77), !dbg !239
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !206, metadata !77), !dbg !239
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !207, metadata !77), !dbg !240
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !208, metadata !77), !dbg !241
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !209, metadata !77), !dbg !242
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !210, metadata !77), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !211, metadata !77), !dbg !243
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !212, metadata !77), !dbg !244
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !213, metadata !77), !dbg !245
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !214, metadata !77), !dbg !245
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !215, metadata !77), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !216, metadata !77), !dbg !247
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !217, metadata !77), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !218, metadata !77), !dbg !249
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !220, metadata !77), !dbg !250
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !221, metadata !77), !dbg !250
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !222, metadata !77), !dbg !251
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !225, metadata !77), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !226, metadata !77), !dbg !252
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !227, metadata !77), !dbg !253
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6, !dbg !254
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !199, metadata !77), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !204, metadata !77), !dbg !238
  %0 = load i64*, i64** %call, align 8, !dbg !255, !tbaa !256
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !205, metadata !77), !dbg !239
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !207, metadata !77), !dbg !240
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6, !dbg !258
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !197, metadata !77), !dbg !259
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !198, metadata !77), !dbg !235
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !207, metadata !77), !dbg !240
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !190, metadata !77), !dbg !260
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !191, metadata !77), !dbg !230
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !198, metadata !77), !dbg !235
  %cmp = icmp eq i64* %call1, null, !dbg !261
  br i1 %cmp, label %if.end139, label %if.then117, !dbg !263

if.then117:                                       ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !264, !tbaa !100
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !192, metadata !77), !dbg !231
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !208, metadata !77), !dbg !241
  %mul = mul nsw i64 %1, %1, !dbg !265
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !209, metadata !77), !dbg !242
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !211, metadata !77), !dbg !243
  %conv10 = trunc i64 %mul to i32, !dbg !266
  %call11 = tail call i64* @create1DArray(i32 0, i32 %conv10) #6, !dbg !266
  tail call void @llvm.dbg.value(metadata i64* %call11, i64 0, metadata !210, metadata !77), !dbg !243
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !212, metadata !77), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !194, metadata !77), !dbg !232
  tail call void @llvm.dbg.value(metadata i64* %call11, i64 0, metadata !193, metadata !77), !dbg !232
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !195, metadata !77), !dbg !233
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !212, metadata !77), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !214, metadata !77), !dbg !245
  %call21 = tail call i64* @findMoves(i64* %call11, i64 undef, i1 zeroext undef, i64 %1), !dbg !267
  tail call void @llvm.dbg.value(metadata i64* %call21, i64 0, metadata !213, metadata !77), !dbg !245
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !195, metadata !77), !dbg !233
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !215, metadata !77), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !194, metadata !77), !dbg !232
  tail call void @llvm.dbg.value(metadata i64* %call21, i64 0, metadata !193, metadata !77), !dbg !232
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !195, metadata !77), !dbg !233
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !215, metadata !77), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !216, metadata !77), !dbg !247
  %sub27 = add nsw i64 %1, -1, !dbg !268
  tail call void @llvm.dbg.value(metadata i64 %sub27, i64 0, metadata !217, metadata !77), !dbg !248
  %arrayidx28 = getelementptr inbounds i64, i64* %call21, i64 %sub27, !dbg !269
  %2 = load i64, i64* %arrayidx28, align 8, !dbg !269, !tbaa !100
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !218, metadata !77), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !196, metadata !77), !dbg !234
  tail call void @llvm.dbg.value(metadata i64 50, i64 0, metadata !221, metadata !77), !dbg !250
  %call33 = tail call i64* @create1DArray(i32 0, i32 50) #6, !dbg !270
  tail call void @llvm.dbg.value(metadata i64* %call33, i64 0, metadata !220, metadata !77), !dbg !250
  %3 = bitcast i64* %call33 to <2 x i64>*, !dbg !271
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %3, align 8, !dbg !271, !tbaa !100
  %arrayidx36 = getelementptr inbounds i64, i64* %call33, i64 2, !dbg !272
  %4 = bitcast i64* %arrayidx36 to <2 x i64>*, !dbg !273
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %4, align 8, !dbg !273, !tbaa !100
  %arrayidx38 = getelementptr inbounds i64, i64* %call33, i64 4, !dbg !274
  %5 = bitcast i64* %arrayidx38 to <2 x i64>*, !dbg !275
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %5, align 8, !dbg !275, !tbaa !100
  %arrayidx40 = getelementptr inbounds i64, i64* %call33, i64 6, !dbg !276
  %6 = bitcast i64* %arrayidx40 to <2 x i64>*, !dbg !277
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %6, align 8, !dbg !277, !tbaa !100
  %arrayidx42 = getelementptr inbounds i64, i64* %call33, i64 8, !dbg !278
  %7 = bitcast i64* %arrayidx42 to <2 x i64>*, !dbg !279
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %7, align 8, !dbg !279, !tbaa !100
  %arrayidx44 = getelementptr inbounds i64, i64* %call33, i64 10, !dbg !280
  %8 = bitcast i64* %arrayidx44 to <2 x i64>*, !dbg !281
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %8, align 8, !dbg !281, !tbaa !100
  %arrayidx46 = getelementptr inbounds i64, i64* %call33, i64 12, !dbg !282
  %9 = bitcast i64* %arrayidx46 to <2 x i64>*, !dbg !283
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %9, align 8, !dbg !283, !tbaa !100
  %arrayidx48 = getelementptr inbounds i64, i64* %call33, i64 14, !dbg !284
  %10 = bitcast i64* %arrayidx48 to <2 x i64>*, !dbg !285
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %10, align 8, !dbg !285, !tbaa !100
  %arrayidx50 = getelementptr inbounds i64, i64* %call33, i64 16, !dbg !286
  %11 = bitcast i64* %arrayidx50 to <2 x i64>*, !dbg !287
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %11, align 8, !dbg !287, !tbaa !100
  %arrayidx52 = getelementptr inbounds i64, i64* %call33, i64 18, !dbg !288
  %12 = bitcast i64* %arrayidx52 to <2 x i64>*, !dbg !289
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %12, align 8, !dbg !289, !tbaa !100
  %arrayidx54 = getelementptr inbounds i64, i64* %call33, i64 20, !dbg !290
  %13 = bitcast i64* %arrayidx54 to <2 x i64>*, !dbg !291
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %13, align 8, !dbg !291, !tbaa !100
  %arrayidx56 = getelementptr inbounds i64, i64* %call33, i64 22, !dbg !292
  %14 = bitcast i64* %arrayidx56 to <2 x i64>*, !dbg !293
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %14, align 8, !dbg !293, !tbaa !100
  %arrayidx58 = getelementptr inbounds i64, i64* %call33, i64 24, !dbg !294
  %15 = bitcast i64* %arrayidx58 to <2 x i64>*, !dbg !295
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %15, align 8, !dbg !295, !tbaa !100
  %arrayidx60 = getelementptr inbounds i64, i64* %call33, i64 26, !dbg !296
  %16 = bitcast i64* %arrayidx60 to <2 x i64>*, !dbg !297
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %16, align 8, !dbg !297, !tbaa !100
  %arrayidx62 = getelementptr inbounds i64, i64* %call33, i64 28, !dbg !298
  %17 = bitcast i64* %arrayidx62 to <2 x i64>*, !dbg !299
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %17, align 8, !dbg !299, !tbaa !100
  %arrayidx64 = getelementptr inbounds i64, i64* %call33, i64 30, !dbg !300
  %18 = bitcast i64* %arrayidx64 to <2 x i64>*, !dbg !301
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %18, align 8, !dbg !301, !tbaa !100
  %arrayidx66 = getelementptr inbounds i64, i64* %call33, i64 32, !dbg !302
  %19 = bitcast i64* %arrayidx66 to <2 x i64>*, !dbg !303
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %19, align 8, !dbg !303, !tbaa !100
  %arrayidx68 = getelementptr inbounds i64, i64* %call33, i64 34, !dbg !304
  %20 = bitcast i64* %arrayidx68 to <2 x i64>*, !dbg !305
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %20, align 8, !dbg !305, !tbaa !100
  %arrayidx70 = getelementptr inbounds i64, i64* %call33, i64 36, !dbg !306
  %21 = bitcast i64* %arrayidx70 to <2 x i64>*, !dbg !307
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %21, align 8, !dbg !307, !tbaa !100
  %arrayidx72 = getelementptr inbounds i64, i64* %call33, i64 38, !dbg !308
  %22 = bitcast i64* %arrayidx72 to <2 x i64>*, !dbg !309
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %22, align 8, !dbg !309, !tbaa !100
  %arrayidx74 = getelementptr inbounds i64, i64* %call33, i64 40, !dbg !310
  %23 = bitcast i64* %arrayidx74 to <2 x i64>*, !dbg !311
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %23, align 8, !dbg !311, !tbaa !100
  %arrayidx76 = getelementptr inbounds i64, i64* %call33, i64 42, !dbg !312
  %24 = bitcast i64* %arrayidx76 to <2 x i64>*, !dbg !313
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %24, align 8, !dbg !313, !tbaa !100
  %arrayidx78 = getelementptr inbounds i64, i64* %call33, i64 44, !dbg !314
  %25 = bitcast i64* %arrayidx78 to <2 x i64>*, !dbg !315
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %25, align 8, !dbg !315, !tbaa !100
  %arrayidx80 = getelementptr inbounds i64, i64* %call33, i64 46, !dbg !316
  %26 = bitcast i64* %arrayidx80 to <2 x i64>*, !dbg !317
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %26, align 8, !dbg !317, !tbaa !100
  %arrayidx82 = getelementptr inbounds i64, i64* %call33, i64 48, !dbg !318
  %27 = bitcast i64* %arrayidx82 to <2 x i64>*, !dbg !319
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %27, align 8, !dbg !319, !tbaa !100
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !222, metadata !77), !dbg !251
  tail call void @printf_s(i64* %call33, i64 50) #6, !dbg !320
  %call84 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2), !dbg !321
  tail call void @llvm.dbg.value(metadata i64 23, i64 0, metadata !226, metadata !77), !dbg !252
  %call89 = tail call i64* @create1DArray(i32 0, i32 23) #6, !dbg !322
  tail call void @llvm.dbg.value(metadata i64* %call89, i64 0, metadata !225, metadata !77), !dbg !252
  %28 = bitcast i64* %call89 to <2 x i64>*, !dbg !323
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %28, align 8, !dbg !323, !tbaa !100
  %arrayidx92 = getelementptr inbounds i64, i64* %call89, i64 2, !dbg !324
  %29 = bitcast i64* %arrayidx92 to <2 x i64>*, !dbg !325
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %29, align 8, !dbg !325, !tbaa !100
  %arrayidx94 = getelementptr inbounds i64, i64* %call89, i64 4, !dbg !326
  %30 = bitcast i64* %arrayidx94 to <2 x i64>*, !dbg !327
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %30, align 8, !dbg !327, !tbaa !100
  %arrayidx96 = getelementptr inbounds i64, i64* %call89, i64 6, !dbg !328
  %31 = bitcast i64* %arrayidx96 to <2 x i64>*, !dbg !329
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %31, align 8, !dbg !329, !tbaa !100
  %arrayidx98 = getelementptr inbounds i64, i64* %call89, i64 8, !dbg !330
  %32 = bitcast i64* %arrayidx98 to <2 x i64>*, !dbg !331
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %32, align 8, !dbg !331, !tbaa !100
  %arrayidx100 = getelementptr inbounds i64, i64* %call89, i64 10, !dbg !332
  %33 = bitcast i64* %arrayidx100 to <2 x i64>*, !dbg !333
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %33, align 8, !dbg !333, !tbaa !100
  %arrayidx102 = getelementptr inbounds i64, i64* %call89, i64 12, !dbg !334
  %34 = bitcast i64* %arrayidx102 to <2 x i64>*, !dbg !335
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %34, align 8, !dbg !335, !tbaa !100
  %arrayidx104 = getelementptr inbounds i64, i64* %call89, i64 14, !dbg !336
  %35 = bitcast i64* %arrayidx104 to <2 x i64>*, !dbg !337
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %35, align 8, !dbg !337, !tbaa !100
  %arrayidx106 = getelementptr inbounds i64, i64* %call89, i64 16, !dbg !338
  %36 = bitcast i64* %arrayidx106 to <2 x i64>*, !dbg !339
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %36, align 8, !dbg !339, !tbaa !100
  %arrayidx108 = getelementptr inbounds i64, i64* %call89, i64 18, !dbg !340
  %37 = bitcast i64* %arrayidx108 to <2 x i64>*, !dbg !341
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %37, align 8, !dbg !341, !tbaa !100
  %arrayidx110 = getelementptr inbounds i64, i64* %call89, i64 20, !dbg !342
  %38 = bitcast i64* %arrayidx110 to <2 x i64>*, !dbg !343
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %38, align 8, !dbg !343, !tbaa !100
  %arrayidx112 = getelementptr inbounds i64, i64* %call89, i64 22, !dbg !344
  store i64 101, i64* %arrayidx112, align 8, !dbg !345, !tbaa !100
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !227, metadata !77), !dbg !253
  tail call void @println_s(i64* %call89, i64 23) #6, !dbg !346
  %phitmp = bitcast i64* %call89 to i8*, !dbg !346
  %phitmp250 = bitcast i64* %call33 to i8*, !dbg !346
  %phitmp251 = bitcast i64* %call21 to i8*, !dbg !346
  %39 = bitcast i64* %call1 to i8*, !dbg !347
  tail call void @free(i8* %39) #6, !dbg !347
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !190, metadata !77), !dbg !260
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !191, metadata !77), !dbg !230
  tail call void @free(i8* %phitmp251) #6, !dbg !352
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !193, metadata !77), !dbg !232
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !195, metadata !77), !dbg !233
  tail call void @free(i8* %phitmp250) #6, !dbg !357
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !220, metadata !77), !dbg !250
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !222, metadata !77), !dbg !251
  tail call void @free(i8* %phitmp) #6, !dbg !362
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !225, metadata !77), !dbg !252
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !227, metadata !77), !dbg !253
  br label %if.end139, !dbg !362

if.end139:                                        ; preds = %entry, %if.then117
  tail call void @exit(i32 0) #7, !dbg !367
  unreachable, !dbg !367
}

declare i64** @convertArgsToIntArray(i32, i8**) local_unnamed_addr #3

declare i64* @parseStringToInt(i64*) local_unnamed_addr #3

declare i64* @create1DArray(i32, i32) local_unnamed_addr #3

declare void @printf_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

declare void @println_s(i64*, i64) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #4

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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "CoinGame_original.c", directory: "/home/mw169/workspace/WhileyOpenCL/polly/CoinGame/impl/original/copyreduced_dealloc")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git f82fb5beb88e841f7a00cfb2a2ceabe46bcb2a9b) (http://llvm.org/git/llvm.git bafbf2b643f118fd2ea402ed6cd204281c7e9e94)"}
!8 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 2, type: !9, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !14)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !12, !13, !12}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!13 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!14 = !{!15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73}
!15 = !DILocalVariable(name: "moves", arg: 1, scope: !8, file: !1, line: 2, type: !11)
!16 = !DILocalVariable(name: "moves_size", arg: 2, scope: !8, file: !1, line: 2, type: !12)
!17 = !DILocalVariable(name: "moves_dealloc", arg: 3, scope: !8, file: !1, line: 2, type: !13)
!18 = !DILocalVariable(name: "n", arg: 4, scope: !8, file: !1, line: 2, type: !12)
!19 = !DILocalVariable(name: "_2", scope: !8, file: !1, line: 3, type: !11)
!20 = !DILocalVariable(name: "_2_size", scope: !8, file: !1, line: 3, type: !12)
!21 = !DILocalVariable(name: "_2_dealloc", scope: !8, file: !1, line: 4, type: !13)
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
!73 = !DILocalVariable(name: "_54", scope: !8, file: !1, line: 56, type: !12)
!74 = !DILocation(line: 74, column: 7, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 72, column: 14)
!76 = distinct !DILexicalBlock(scope: !8, file: !1, line: 62, column: 13)
!77 = !DIExpression()
!78 = !DILocation(line: 13, column: 12, scope: !8)
!79 = !DILocation(line: 8, column: 12, scope: !8)
!80 = !DILocation(line: 14, column: 12, scope: !8)
!81 = !DILocation(line: 82, column: 9, scope: !75)
!82 = !DILocation(line: 15, column: 12, scope: !8)
!83 = !DILocation(line: 84, column: 10, scope: !84)
!84 = distinct !DILexicalBlock(scope: !75, file: !1, line: 84, column: 7)
!85 = !DILocation(line: 92, column: 10, scope: !86)
!86 = distinct !DILexicalBlock(scope: !75, file: !1, line: 92, column: 7)
!87 = !DILocation(line: 84, column: 7, scope: !75)
!88 = !DILocation(line: 16, column: 12, scope: !8)
!89 = !DILocation(line: 18, column: 12, scope: !8)
!90 = !DILocation(line: 19, column: 12, scope: !8)
!91 = !DILocation(line: 20, column: 12, scope: !8)
!92 = !DILocation(line: 98, column: 11, scope: !75)
!93 = !DILocation(line: 21, column: 12, scope: !8)
!94 = !DILocation(line: 22, column: 12, scope: !8)
!95 = !DILocation(line: 23, column: 12, scope: !8)
!96 = !DILocation(line: 100, column: 11, scope: !75)
!97 = !DILocation(line: 104, column: 11, scope: !75)
!98 = !DILocation(line: 24, column: 12, scope: !8)
!99 = !DILocation(line: 106, column: 8, scope: !75)
!100 = !{!101, !101, i64 0}
!101 = !{!"long long", !102, i64 0}
!102 = !{!"omnipotent char", !103, i64 0}
!103 = !{!"Simple C/C++ TBAA"}
!104 = !DILocation(line: 25, column: 12, scope: !8)
!105 = !DILocation(line: 108, column: 4, scope: !75)
!106 = !DILocation(line: 26, column: 12, scope: !8)
!107 = !DILocation(line: 9, column: 12, scope: !8)
!108 = !DILocation(line: 27, column: 12, scope: !8)
!109 = !DILocation(line: 118, column: 9, scope: !75)
!110 = !DILocation(line: 28, column: 12, scope: !8)
!111 = !DILocation(line: 120, column: 10, scope: !112)
!112 = distinct !DILexicalBlock(scope: !75, file: !1, line: 120, column: 7)
!113 = !DILocation(line: 120, column: 7, scope: !75)
!114 = !DILocation(line: 29, column: 12, scope: !8)
!115 = !DILocation(line: 30, column: 12, scope: !8)
!116 = !DILocation(line: 126, column: 11, scope: !75)
!117 = !DILocation(line: 31, column: 12, scope: !8)
!118 = !DILocation(line: 128, column: 11, scope: !75)
!119 = !DILocation(line: 32, column: 12, scope: !8)
!120 = !DILocation(line: 130, column: 8, scope: !75)
!121 = !DILocation(line: 33, column: 12, scope: !8)
!122 = !DILocation(line: 132, column: 4, scope: !75)
!123 = !DILocation(line: 34, column: 12, scope: !8)
!124 = !DILocation(line: 10, column: 12, scope: !8)
!125 = !DILocation(line: 35, column: 12, scope: !8)
!126 = !DILocation(line: 37, column: 12, scope: !8)
!127 = !DILocation(line: 146, column: 10, scope: !128)
!128 = distinct !DILexicalBlock(scope: !75, file: !1, line: 146, column: 7)
!129 = !DILocation(line: 182, column: 9, scope: !75)
!130 = !DILocation(line: 146, column: 7, scope: !75)
!131 = !DILocation(line: 38, column: 12, scope: !8)
!132 = !DILocation(line: 39, column: 12, scope: !8)
!133 = !DILocation(line: 40, column: 12, scope: !8)
!134 = !DILocation(line: 150, column: 11, scope: !75)
!135 = !DILocation(line: 154, column: 11, scope: !75)
!136 = !DILocation(line: 41, column: 12, scope: !8)
!137 = !DILocation(line: 156, column: 8, scope: !75)
!138 = !DILocation(line: 42, column: 12, scope: !8)
!139 = !DILocation(line: 158, column: 4, scope: !75)
!140 = !DILocation(line: 162, column: 8, scope: !141)
!141 = distinct !DILexicalBlock(scope: !75, file: !1, line: 162, column: 7)
!142 = !DILocation(line: 162, column: 7, scope: !75)
!143 = !DILocation(line: 168, column: 8, scope: !144)
!144 = distinct !DILexicalBlock(scope: !75, file: !1, line: 168, column: 7)
!145 = !DILocation(line: 168, column: 7, scope: !75)
!146 = !DILocation(line: 174, column: 9, scope: !75)
!147 = !DILocation(line: 43, column: 12, scope: !8)
!148 = !DILocation(line: 176, column: 9, scope: !75)
!149 = !DILocation(line: 44, column: 12, scope: !8)
!150 = !DILocation(line: 178, column: 10, scope: !151)
!151 = distinct !DILexicalBlock(scope: !75, file: !1, line: 178, column: 7)
!152 = !DILocation(line: 184, column: 11, scope: !75)
!153 = !DILocation(line: 186, column: 4, scope: !75)
!154 = !DILocation(line: 188, column: 4, scope: !75)
!155 = !DILocation(line: 186, column: 15, scope: !75)
!156 = !DILocation(line: 51, column: 12, scope: !8)
!157 = !DILocation(line: 204, column: 9, scope: !75)
!158 = !DILocation(line: 52, column: 12, scope: !8)
!159 = !DILocation(line: 6, column: 12, scope: !8)
!160 = !DILocation(line: 53, column: 12, scope: !8)
!161 = !DILocation(line: 54, column: 12, scope: !8)
!162 = !DILocation(line: 7, column: 12, scope: !8)
!163 = distinct !{!163, !164}
!164 = !DILocation(line: 72, column: 3, scope: !76)
!165 = !DILocation(line: 55, column: 12, scope: !8)
!166 = !DILocation(line: 221, column: 8, scope: !76)
!167 = !DILocation(line: 56, column: 12, scope: !8)
!168 = !DILocation(line: 5, column: 12, scope: !8)
!169 = !DILocation(line: 64, column: 6, scope: !76)
!170 = distinct !{!170, !171}
!171 = !DILocation(line: 62, column: 2, scope: !8)
!172 = !DILocation(line: 231, column: 2, scope: !8)
!173 = distinct !{!173, !174, !"polly.alias.scope.moves"}
!174 = distinct !{!174, !"polly.alias.scope.domain"}
!175 = !{!176, !177, !178, !179}
!176 = distinct !{!176, !174, !"polly.alias.scope.z.0"}
!177 = distinct !{!177, !174, !"polly.alias.scope.storemerge"}
!178 = distinct !{!178, !174, !"polly.alias.scope.x.0"}
!179 = distinct !{!179, !174, !"polly.alias.scope.y.0"}
!180 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 235, type: !181, isLocal: false, isDefinition: true, scopeLine: 235, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !187)
!181 = !DISubroutineType(types: !182)
!182 = !{!183, !183, !184}
!183 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!184 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !185, size: 64, align: 64)
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64, align: 64)
!186 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!187 = !{!188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227}
!188 = !DILocalVariable(name: "argc", arg: 1, scope: !180, file: !1, line: 235, type: !183)
!189 = !DILocalVariable(name: "args", arg: 2, scope: !180, file: !1, line: 235, type: !184)
!190 = !DILocalVariable(name: "max", scope: !180, file: !1, line: 236, type: !11)
!191 = !DILocalVariable(name: "max_dealloc", scope: !180, file: !1, line: 237, type: !13)
!192 = !DILocalVariable(name: "n", scope: !180, file: !1, line: 238, type: !12)
!193 = !DILocalVariable(name: "moves", scope: !180, file: !1, line: 239, type: !11)
!194 = !DILocalVariable(name: "moves_size", scope: !180, file: !1, line: 239, type: !12)
!195 = !DILocalVariable(name: "moves_dealloc", scope: !180, file: !1, line: 240, type: !13)
!196 = !DILocalVariable(name: "sum_alice", scope: !180, file: !1, line: 241, type: !12)
!197 = !DILocalVariable(name: "_5", scope: !180, file: !1, line: 242, type: !11)
!198 = !DILocalVariable(name: "_5_dealloc", scope: !180, file: !1, line: 243, type: !13)
!199 = !DILocalVariable(name: "_6", scope: !180, file: !1, line: 244, type: !200)
!200 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!201 = !DILocalVariable(name: "_6_size", scope: !180, file: !1, line: 244, type: !12)
!202 = !DILocalVariable(name: "_6_size_size", scope: !180, file: !1, line: 244, type: !12)
!203 = !DILocalVariable(name: "_6_dealloc", scope: !180, file: !1, line: 245, type: !13)
!204 = !DILocalVariable(name: "_7", scope: !180, file: !1, line: 246, type: !12)
!205 = !DILocalVariable(name: "_8", scope: !180, file: !1, line: 247, type: !11)
!206 = !DILocalVariable(name: "_8_size", scope: !180, file: !1, line: 247, type: !12)
!207 = !DILocalVariable(name: "_8_dealloc", scope: !180, file: !1, line: 248, type: !13)
!208 = !DILocalVariable(name: "_9", scope: !180, file: !1, line: 249, type: !12)
!209 = !DILocalVariable(name: "_10", scope: !180, file: !1, line: 250, type: !12)
!210 = !DILocalVariable(name: "_11", scope: !180, file: !1, line: 251, type: !11)
!211 = !DILocalVariable(name: "_11_size", scope: !180, file: !1, line: 251, type: !12)
!212 = !DILocalVariable(name: "_11_dealloc", scope: !180, file: !1, line: 252, type: !13)
!213 = !DILocalVariable(name: "_12", scope: !180, file: !1, line: 253, type: !11)
!214 = !DILocalVariable(name: "_12_size", scope: !180, file: !1, line: 253, type: !12)
!215 = !DILocalVariable(name: "_12_dealloc", scope: !180, file: !1, line: 254, type: !13)
!216 = !DILocalVariable(name: "_13", scope: !180, file: !1, line: 255, type: !12)
!217 = !DILocalVariable(name: "_14", scope: !180, file: !1, line: 256, type: !12)
!218 = !DILocalVariable(name: "_15", scope: !180, file: !1, line: 257, type: !12)
!219 = !DILocalVariable(name: "_16", scope: !180, file: !1, line: 258, type: !4)
!220 = !DILocalVariable(name: "_18", scope: !180, file: !1, line: 259, type: !11)
!221 = !DILocalVariable(name: "_18_size", scope: !180, file: !1, line: 259, type: !12)
!222 = !DILocalVariable(name: "_18_dealloc", scope: !180, file: !1, line: 260, type: !13)
!223 = !DILocalVariable(name: "_19", scope: !180, file: !1, line: 261, type: !4)
!224 = !DILocalVariable(name: "_21", scope: !180, file: !1, line: 262, type: !4)
!225 = !DILocalVariable(name: "_23", scope: !180, file: !1, line: 263, type: !11)
!226 = !DILocalVariable(name: "_23_size", scope: !180, file: !1, line: 263, type: !12)
!227 = !DILocalVariable(name: "_23_dealloc", scope: !180, file: !1, line: 264, type: !13)
!228 = !DILocation(line: 235, column: 14, scope: !180)
!229 = !DILocation(line: 235, column: 27, scope: !180)
!230 = !DILocation(line: 237, column: 2, scope: !180)
!231 = !DILocation(line: 238, column: 12, scope: !180)
!232 = !DILocation(line: 239, column: 2, scope: !180)
!233 = !DILocation(line: 240, column: 2, scope: !180)
!234 = !DILocation(line: 241, column: 12, scope: !180)
!235 = !DILocation(line: 243, column: 2, scope: !180)
!236 = !DILocation(line: 244, column: 2, scope: !180)
!237 = !DILocation(line: 245, column: 2, scope: !180)
!238 = !DILocation(line: 246, column: 12, scope: !180)
!239 = !DILocation(line: 247, column: 2, scope: !180)
!240 = !DILocation(line: 248, column: 2, scope: !180)
!241 = !DILocation(line: 249, column: 12, scope: !180)
!242 = !DILocation(line: 250, column: 12, scope: !180)
!243 = !DILocation(line: 251, column: 2, scope: !180)
!244 = !DILocation(line: 252, column: 2, scope: !180)
!245 = !DILocation(line: 253, column: 2, scope: !180)
!246 = !DILocation(line: 254, column: 2, scope: !180)
!247 = !DILocation(line: 255, column: 12, scope: !180)
!248 = !DILocation(line: 256, column: 12, scope: !180)
!249 = !DILocation(line: 257, column: 12, scope: !180)
!250 = !DILocation(line: 259, column: 2, scope: !180)
!251 = !DILocation(line: 260, column: 2, scope: !180)
!252 = !DILocation(line: 263, column: 2, scope: !180)
!253 = !DILocation(line: 264, column: 2, scope: !180)
!254 = !DILocation(line: 266, column: 2, scope: !180)
!255 = !DILocation(line: 270, column: 5, scope: !180)
!256 = !{!257, !257, i64 0}
!257 = !{!"any pointer", !102, i64 0}
!258 = !DILocation(line: 273, column: 2, scope: !180)
!259 = !DILocation(line: 242, column: 13, scope: !180)
!260 = !DILocation(line: 236, column: 13, scope: !180)
!261 = !DILocation(line: 281, column: 9, scope: !262)
!262 = distinct !DILexicalBlock(scope: !180, file: !1, line: 281, column: 5)
!263 = !DILocation(line: 281, column: 5, scope: !180)
!264 = !DILocation(line: 283, column: 6, scope: !180)
!265 = !DILocation(line: 287, column: 7, scope: !180)
!266 = !DILocation(line: 290, column: 2, scope: !180)
!267 = !DILocation(line: 299, column: 8, scope: !180)
!268 = !DILocation(line: 309, column: 7, scope: !180)
!269 = !DILocation(line: 311, column: 6, scope: !180)
!270 = !DILocation(line: 318, column: 2, scope: !180)
!271 = !DILocation(line: 319, column: 9, scope: !180)
!272 = !DILocation(line: 319, column: 29, scope: !180)
!273 = !DILocation(line: 319, column: 36, scope: !180)
!274 = !DILocation(line: 319, column: 56, scope: !180)
!275 = !DILocation(line: 319, column: 63, scope: !180)
!276 = !DILocation(line: 319, column: 84, scope: !180)
!277 = !DILocation(line: 319, column: 91, scope: !180)
!278 = !DILocation(line: 319, column: 111, scope: !180)
!279 = !DILocation(line: 319, column: 118, scope: !180)
!280 = !DILocation(line: 319, column: 138, scope: !180)
!281 = !DILocation(line: 319, column: 146, scope: !180)
!282 = !DILocation(line: 319, column: 167, scope: !180)
!283 = !DILocation(line: 319, column: 175, scope: !180)
!284 = !DILocation(line: 319, column: 197, scope: !180)
!285 = !DILocation(line: 319, column: 205, scope: !180)
!286 = !DILocation(line: 319, column: 227, scope: !180)
!287 = !DILocation(line: 319, column: 235, scope: !180)
!288 = !DILocation(line: 319, column: 256, scope: !180)
!289 = !DILocation(line: 319, column: 264, scope: !180)
!290 = !DILocation(line: 319, column: 285, scope: !180)
!291 = !DILocation(line: 319, column: 293, scope: !180)
!292 = !DILocation(line: 319, column: 315, scope: !180)
!293 = !DILocation(line: 319, column: 323, scope: !180)
!294 = !DILocation(line: 319, column: 345, scope: !180)
!295 = !DILocation(line: 319, column: 353, scope: !180)
!296 = !DILocation(line: 319, column: 374, scope: !180)
!297 = !DILocation(line: 319, column: 382, scope: !180)
!298 = !DILocation(line: 319, column: 403, scope: !180)
!299 = !DILocation(line: 319, column: 411, scope: !180)
!300 = !DILocation(line: 319, column: 432, scope: !180)
!301 = !DILocation(line: 319, column: 440, scope: !180)
!302 = !DILocation(line: 319, column: 462, scope: !180)
!303 = !DILocation(line: 319, column: 470, scope: !180)
!304 = !DILocation(line: 319, column: 492, scope: !180)
!305 = !DILocation(line: 319, column: 500, scope: !180)
!306 = !DILocation(line: 319, column: 520, scope: !180)
!307 = !DILocation(line: 319, column: 528, scope: !180)
!308 = !DILocation(line: 319, column: 549, scope: !180)
!309 = !DILocation(line: 319, column: 557, scope: !180)
!310 = !DILocation(line: 319, column: 578, scope: !180)
!311 = !DILocation(line: 319, column: 586, scope: !180)
!312 = !DILocation(line: 319, column: 607, scope: !180)
!313 = !DILocation(line: 319, column: 615, scope: !180)
!314 = !DILocation(line: 319, column: 637, scope: !180)
!315 = !DILocation(line: 319, column: 645, scope: !180)
!316 = !DILocation(line: 319, column: 667, scope: !180)
!317 = !DILocation(line: 319, column: 675, scope: !180)
!318 = !DILocation(line: 319, column: 696, scope: !180)
!319 = !DILocation(line: 319, column: 704, scope: !180)
!320 = !DILocation(line: 322, column: 2, scope: !180)
!321 = !DILocation(line: 326, column: 2, scope: !180)
!322 = !DILocation(line: 331, column: 2, scope: !180)
!323 = !DILocation(line: 332, column: 9, scope: !180)
!324 = !DILocation(line: 332, column: 28, scope: !180)
!325 = !DILocation(line: 332, column: 35, scope: !180)
!326 = !DILocation(line: 332, column: 56, scope: !180)
!327 = !DILocation(line: 332, column: 63, scope: !180)
!328 = !DILocation(line: 332, column: 82, scope: !180)
!329 = !DILocation(line: 332, column: 89, scope: !180)
!330 = !DILocation(line: 332, column: 110, scope: !180)
!331 = !DILocation(line: 332, column: 117, scope: !180)
!332 = !DILocation(line: 332, column: 137, scope: !180)
!333 = !DILocation(line: 332, column: 145, scope: !180)
!334 = !DILocation(line: 332, column: 166, scope: !180)
!335 = !DILocation(line: 332, column: 174, scope: !180)
!336 = !DILocation(line: 332, column: 195, scope: !180)
!337 = !DILocation(line: 332, column: 203, scope: !180)
!338 = !DILocation(line: 332, column: 225, scope: !180)
!339 = !DILocation(line: 332, column: 233, scope: !180)
!340 = !DILocation(line: 332, column: 255, scope: !180)
!341 = !DILocation(line: 332, column: 263, scope: !180)
!342 = !DILocation(line: 332, column: 283, scope: !180)
!343 = !DILocation(line: 332, column: 291, scope: !180)
!344 = !DILocation(line: 332, column: 312, scope: !180)
!345 = !DILocation(line: 332, column: 320, scope: !180)
!346 = !DILocation(line: 335, column: 2, scope: !180)
!347 = !DILocation(line: 339, column: 2, scope: !348)
!348 = !DILexicalBlockFile(scope: !349, file: !1, discriminator: 1)
!349 = distinct !DILexicalBlock(scope: !350, file: !1, line: 339, column: 2)
!350 = distinct !DILexicalBlock(scope: !351, file: !1, line: 339, column: 2)
!351 = distinct !DILexicalBlock(scope: !180, file: !1, line: 339, column: 2)
!352 = !DILocation(line: 340, column: 2, scope: !353)
!353 = !DILexicalBlockFile(scope: !354, file: !1, discriminator: 1)
!354 = distinct !DILexicalBlock(scope: !355, file: !1, line: 340, column: 2)
!355 = distinct !DILexicalBlock(scope: !356, file: !1, line: 340, column: 2)
!356 = distinct !DILexicalBlock(scope: !180, file: !1, line: 340, column: 2)
!357 = !DILocation(line: 346, column: 2, scope: !358)
!358 = !DILexicalBlockFile(scope: !359, file: !1, discriminator: 1)
!359 = distinct !DILexicalBlock(scope: !360, file: !1, line: 346, column: 2)
!360 = distinct !DILexicalBlock(scope: !361, file: !1, line: 346, column: 2)
!361 = distinct !DILexicalBlock(scope: !180, file: !1, line: 346, column: 2)
!362 = !DILocation(line: 347, column: 2, scope: !363)
!363 = !DILexicalBlockFile(scope: !364, file: !1, discriminator: 1)
!364 = distinct !DILexicalBlock(scope: !365, file: !1, line: 347, column: 2)
!365 = distinct !DILexicalBlock(scope: !366, file: !1, line: 347, column: 2)
!366 = distinct !DILexicalBlock(scope: !180, file: !1, line: 347, column: 2)
!367 = !DILocation(line: 348, column: 2, scope: !180)
