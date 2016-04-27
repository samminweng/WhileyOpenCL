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
  br i1 %exitcond, label %blklab2, label %if.end5, !dbg !74

blklab2:                                          ; preds = %blklab6
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !72, metadata !77), !dbg !163
  %add52 = add nuw nsw i64 %s.0154, 1, !dbg !164
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !73, metadata !77), !dbg !165
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !22, metadata !77), !dbg !166
  %indvars.iv.next = add i64 %indvars.iv, -1, !dbg !167
  %exitcond155 = icmp eq i64 %add52, 9223372036854775807, !dbg !167
  br i1 %exitcond155, label %if.end54.loopexit, label %while.cond1.preheader, !dbg !167

if.end54.loopexit:                                ; preds = %blklab2
  br label %if.end54, !dbg !168

if.end54.loopexit199:                             ; preds = %polly.loop_exit159
  br label %if.end54, !dbg !168

if.end54:                                         ; preds = %if.end54.loopexit199, %if.end54.loopexit, %polly.loop_if
  ret i64* %moves, !dbg !168

polly.loop_if:                                    ; preds = %entry
  %cmp153 = icmp sgt i64 %n, 0, !dbg !169
  br i1 %cmp153, label %polly.loop_preheader, label %if.end54

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
  store i64 %p_add37.p_add38, i64* %uglygep191192, align 8, !alias.scope !171, !noalias !173
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
  %_p_scalar_ = load i64, i64* %uglygep167, align 8, !alias.scope !171, !noalias !173
  br label %polly.cond168

polly.stmt.if.end18:                              ; preds = %polly.cond168
  %19 = mul i64 %polly.indvar161, %7
  %uglygep175 = getelementptr i8, i8* %scevgep173174, i64 %19
  %uglygep175176 = bitcast i8* %uglygep175 to i64*
  %_p_scalar_177 = load i64, i64* %uglygep175176, align 8, !alias.scope !171, !noalias !173
  br label %polly.cond178

polly.stmt.if.end26:                              ; preds = %polly.cond178
  %uglygep185 = getelementptr i8, i8* %scevgep183184, i64 %17
  %uglygep185186 = bitcast i8* %uglygep185 to i64*
  %_p_scalar_187 = load i64, i64* %uglygep185186, align 8, !alias.scope !171, !noalias !173
  br label %polly.stmt.blklab6
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #2 !dbg !178 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !186, metadata !77), !dbg !224
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !187, metadata !77), !dbg !225
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !189, metadata !77), !dbg !226
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !190, metadata !77), !dbg !227
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !191, metadata !77), !dbg !227
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !192, metadata !77), !dbg !228
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !193, metadata !77), !dbg !229
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !195, metadata !77), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !197, metadata !77), !dbg !230
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !198, metadata !77), !dbg !230
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !199, metadata !77), !dbg !231
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !200, metadata !77), !dbg !232
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !201, metadata !77), !dbg !233
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !202, metadata !77), !dbg !233
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !203, metadata !77), !dbg !234
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !204, metadata !77), !dbg !235
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !205, metadata !77), !dbg !236
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !206, metadata !77), !dbg !237
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !207, metadata !77), !dbg !237
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !208, metadata !77), !dbg !238
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !209, metadata !77), !dbg !239
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !210, metadata !77), !dbg !239
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !211, metadata !77), !dbg !240
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !212, metadata !77), !dbg !241
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !213, metadata !77), !dbg !242
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !214, metadata !77), !dbg !243
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !216, metadata !77), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !217, metadata !77), !dbg !244
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !218, metadata !77), !dbg !245
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !221, metadata !77), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !222, metadata !77), !dbg !246
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !223, metadata !77), !dbg !247
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6, !dbg !248
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !195, metadata !77), !dbg !230
  %sub = add nsw i32 %argc, -1, !dbg !248
  %conv = sext i32 %sub to i64, !dbg !248
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !197, metadata !77), !dbg !230
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !199, metadata !77), !dbg !231
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !200, metadata !77), !dbg !232
  %0 = load i64*, i64** %call, align 8, !dbg !249, !tbaa !250
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !201, metadata !77), !dbg !233
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6, !dbg !252
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !194, metadata !77), !dbg !253
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !188, metadata !77), !dbg !254
  %cmp = icmp eq i64* %call1, null, !dbg !255
  br i1 %cmp, label %if.end122.critedge, label %if.then103, !dbg !257

if.then103:                                       ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !258, !tbaa !100
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !189, metadata !77), !dbg !226
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !204, metadata !77), !dbg !235
  %mul = mul nsw i64 %1, %1, !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !205, metadata !77), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !207, metadata !77), !dbg !237
  %conv6 = trunc i64 %mul to i32, !dbg !260
  %call7 = tail call i64* @gen1DArray(i32 0, i32 %conv6) #6, !dbg !260
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !206, metadata !77), !dbg !237
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !208, metadata !77), !dbg !238
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !191, metadata !77), !dbg !227
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !190, metadata !77), !dbg !227
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !192, metadata !77), !dbg !228
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !208, metadata !77), !dbg !238
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !192, metadata !77), !dbg !228
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !210, metadata !77), !dbg !239
  %call14 = tail call i64* @findMoves(i64* %call7, i64 undef, i1 zeroext undef, i64 %1), !dbg !261
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !209, metadata !77), !dbg !239
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !211, metadata !77), !dbg !240
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !191, metadata !77), !dbg !227
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !190, metadata !77), !dbg !227
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !192, metadata !77), !dbg !228
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !211, metadata !77), !dbg !240
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !212, metadata !77), !dbg !241
  %sub18 = add nsw i64 %1, -1, !dbg !262
  tail call void @llvm.dbg.value(metadata i64 %sub18, i64 0, metadata !213, metadata !77), !dbg !242
  %arrayidx19 = getelementptr inbounds i64, i64* %call14, i64 %sub18, !dbg !263
  %2 = load i64, i64* %arrayidx19, align 8, !dbg !263, !tbaa !100
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !214, metadata !77), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !193, metadata !77), !dbg !229
  tail call void @llvm.dbg.value(metadata i64 50, i64 0, metadata !217, metadata !77), !dbg !244
  %call23 = tail call noalias i8* @malloc(i64 400) #6, !dbg !264
  %3 = bitcast i8* %call23 to i64*, !dbg !264
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !216, metadata !77), !dbg !244
  %4 = bitcast i8* %call23 to <2 x i64>*, !dbg !265
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %4, align 8, !dbg !265, !tbaa !100
  %arrayidx26 = getelementptr inbounds i8, i8* %call23, i64 16, !dbg !266
  %5 = bitcast i8* %arrayidx26 to <2 x i64>*, !dbg !267
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %5, align 8, !dbg !267, !tbaa !100
  %arrayidx28 = getelementptr inbounds i8, i8* %call23, i64 32, !dbg !268
  %6 = bitcast i8* %arrayidx28 to <2 x i64>*, !dbg !269
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %6, align 8, !dbg !269, !tbaa !100
  %arrayidx30 = getelementptr inbounds i8, i8* %call23, i64 48, !dbg !270
  %7 = bitcast i8* %arrayidx30 to <2 x i64>*, !dbg !271
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %7, align 8, !dbg !271, !tbaa !100
  %arrayidx32 = getelementptr inbounds i8, i8* %call23, i64 64, !dbg !272
  %8 = bitcast i8* %arrayidx32 to <2 x i64>*, !dbg !273
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %8, align 8, !dbg !273, !tbaa !100
  %arrayidx34 = getelementptr inbounds i8, i8* %call23, i64 80, !dbg !274
  %9 = bitcast i8* %arrayidx34 to <2 x i64>*, !dbg !275
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %9, align 8, !dbg !275, !tbaa !100
  %arrayidx36 = getelementptr inbounds i8, i8* %call23, i64 96, !dbg !276
  %10 = bitcast i8* %arrayidx36 to <2 x i64>*, !dbg !277
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %10, align 8, !dbg !277, !tbaa !100
  %arrayidx38 = getelementptr inbounds i8, i8* %call23, i64 112, !dbg !278
  %11 = bitcast i8* %arrayidx38 to <2 x i64>*, !dbg !279
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %11, align 8, !dbg !279, !tbaa !100
  %arrayidx40 = getelementptr inbounds i8, i8* %call23, i64 128, !dbg !280
  %12 = bitcast i8* %arrayidx40 to <2 x i64>*, !dbg !281
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %12, align 8, !dbg !281, !tbaa !100
  %arrayidx42 = getelementptr inbounds i8, i8* %call23, i64 144, !dbg !282
  %13 = bitcast i8* %arrayidx42 to <2 x i64>*, !dbg !283
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %13, align 8, !dbg !283, !tbaa !100
  %arrayidx44 = getelementptr inbounds i8, i8* %call23, i64 160, !dbg !284
  %14 = bitcast i8* %arrayidx44 to <2 x i64>*, !dbg !285
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %14, align 8, !dbg !285, !tbaa !100
  %arrayidx46 = getelementptr inbounds i8, i8* %call23, i64 176, !dbg !286
  %15 = bitcast i8* %arrayidx46 to <2 x i64>*, !dbg !287
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %15, align 8, !dbg !287, !tbaa !100
  %arrayidx48 = getelementptr inbounds i8, i8* %call23, i64 192, !dbg !288
  %16 = bitcast i8* %arrayidx48 to <2 x i64>*, !dbg !289
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %16, align 8, !dbg !289, !tbaa !100
  %arrayidx50 = getelementptr inbounds i8, i8* %call23, i64 208, !dbg !290
  %17 = bitcast i8* %arrayidx50 to <2 x i64>*, !dbg !291
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %17, align 8, !dbg !291, !tbaa !100
  %arrayidx52 = getelementptr inbounds i8, i8* %call23, i64 224, !dbg !292
  %18 = bitcast i8* %arrayidx52 to <2 x i64>*, !dbg !293
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %18, align 8, !dbg !293, !tbaa !100
  %arrayidx54 = getelementptr inbounds i8, i8* %call23, i64 240, !dbg !294
  %19 = bitcast i8* %arrayidx54 to <2 x i64>*, !dbg !295
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %19, align 8, !dbg !295, !tbaa !100
  %arrayidx56 = getelementptr inbounds i8, i8* %call23, i64 256, !dbg !296
  %20 = bitcast i8* %arrayidx56 to <2 x i64>*, !dbg !297
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %20, align 8, !dbg !297, !tbaa !100
  %arrayidx58 = getelementptr inbounds i8, i8* %call23, i64 272, !dbg !298
  %21 = bitcast i8* %arrayidx58 to <2 x i64>*, !dbg !299
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %21, align 8, !dbg !299, !tbaa !100
  %arrayidx60 = getelementptr inbounds i8, i8* %call23, i64 288, !dbg !300
  %22 = bitcast i8* %arrayidx60 to <2 x i64>*, !dbg !301
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %22, align 8, !dbg !301, !tbaa !100
  %arrayidx62 = getelementptr inbounds i8, i8* %call23, i64 304, !dbg !302
  %23 = bitcast i8* %arrayidx62 to <2 x i64>*, !dbg !303
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %23, align 8, !dbg !303, !tbaa !100
  %arrayidx64 = getelementptr inbounds i8, i8* %call23, i64 320, !dbg !304
  %24 = bitcast i8* %arrayidx64 to <2 x i64>*, !dbg !305
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %24, align 8, !dbg !305, !tbaa !100
  %arrayidx66 = getelementptr inbounds i8, i8* %call23, i64 336, !dbg !306
  %25 = bitcast i8* %arrayidx66 to <2 x i64>*, !dbg !307
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %25, align 8, !dbg !307, !tbaa !100
  %arrayidx68 = getelementptr inbounds i8, i8* %call23, i64 352, !dbg !308
  %26 = bitcast i8* %arrayidx68 to <2 x i64>*, !dbg !309
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %26, align 8, !dbg !309, !tbaa !100
  %arrayidx70 = getelementptr inbounds i8, i8* %call23, i64 368, !dbg !310
  %27 = bitcast i8* %arrayidx70 to <2 x i64>*, !dbg !311
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %27, align 8, !dbg !311, !tbaa !100
  %arrayidx72 = getelementptr inbounds i8, i8* %call23, i64 384, !dbg !312
  %28 = bitcast i8* %arrayidx72 to <2 x i64>*, !dbg !313
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %28, align 8, !dbg !313, !tbaa !100
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !218, metadata !77), !dbg !245
  tail call void @printf_s(i64* %3, i64 50) #6, !dbg !314
  %call74 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2), !dbg !315
  tail call void @llvm.dbg.value(metadata i64 23, i64 0, metadata !222, metadata !77), !dbg !246
  %call78 = tail call noalias i8* @malloc(i64 184) #6, !dbg !316
  %29 = bitcast i8* %call78 to i64*, !dbg !316
  tail call void @llvm.dbg.value(metadata i64* %29, i64 0, metadata !221, metadata !77), !dbg !246
  %30 = bitcast i8* %call78 to <2 x i64>*, !dbg !317
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %30, align 8, !dbg !317, !tbaa !100
  %arrayidx81 = getelementptr inbounds i8, i8* %call78, i64 16, !dbg !318
  %31 = bitcast i8* %arrayidx81 to <2 x i64>*, !dbg !319
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %31, align 8, !dbg !319, !tbaa !100
  %arrayidx83 = getelementptr inbounds i8, i8* %call78, i64 32, !dbg !320
  %32 = bitcast i8* %arrayidx83 to <2 x i64>*, !dbg !321
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %32, align 8, !dbg !321, !tbaa !100
  %arrayidx85 = getelementptr inbounds i8, i8* %call78, i64 48, !dbg !322
  %33 = bitcast i8* %arrayidx85 to <2 x i64>*, !dbg !323
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %33, align 8, !dbg !323, !tbaa !100
  %arrayidx87 = getelementptr inbounds i8, i8* %call78, i64 64, !dbg !324
  %34 = bitcast i8* %arrayidx87 to <2 x i64>*, !dbg !325
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %34, align 8, !dbg !325, !tbaa !100
  %arrayidx89 = getelementptr inbounds i8, i8* %call78, i64 80, !dbg !326
  %35 = bitcast i8* %arrayidx89 to <2 x i64>*, !dbg !327
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %35, align 8, !dbg !327, !tbaa !100
  %arrayidx91 = getelementptr inbounds i8, i8* %call78, i64 96, !dbg !328
  %36 = bitcast i8* %arrayidx91 to <2 x i64>*, !dbg !329
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %36, align 8, !dbg !329, !tbaa !100
  %arrayidx93 = getelementptr inbounds i8, i8* %call78, i64 112, !dbg !330
  %37 = bitcast i8* %arrayidx93 to <2 x i64>*, !dbg !331
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %37, align 8, !dbg !331, !tbaa !100
  %arrayidx95 = getelementptr inbounds i8, i8* %call78, i64 128, !dbg !332
  %38 = bitcast i8* %arrayidx95 to <2 x i64>*, !dbg !333
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %38, align 8, !dbg !333, !tbaa !100
  %arrayidx97 = getelementptr inbounds i8, i8* %call78, i64 144, !dbg !334
  %39 = bitcast i8* %arrayidx97 to <2 x i64>*, !dbg !335
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %39, align 8, !dbg !335, !tbaa !100
  %arrayidx99 = getelementptr inbounds i8, i8* %call78, i64 160, !dbg !336
  %40 = bitcast i8* %arrayidx99 to <2 x i64>*, !dbg !337
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %40, align 8, !dbg !337, !tbaa !100
  %arrayidx101 = getelementptr inbounds i8, i8* %call78, i64 176, !dbg !338
  %41 = bitcast i8* %arrayidx101 to i64*, !dbg !338
  store i64 101, i64* %41, align 8, !dbg !339, !tbaa !100
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !223, metadata !77), !dbg !247
  tail call void @println_s(i64* %29, i64 23) #6, !dbg !340
  %phitmp = bitcast i64* %call14 to i8*, !dbg !340
  tail call void @free(i8* %phitmp) #6, !dbg !341
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !192, metadata !77), !dbg !228
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !345
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !199, metadata !77), !dbg !231
  tail call void @free(i8* %call23) #6, !dbg !349
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !218, metadata !77), !dbg !245
  tail call void @free(i8* %call78) #6, !dbg !353
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !223, metadata !77), !dbg !247
  br label %if.end122, !dbg !353

if.end122.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !345
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !199, metadata !77), !dbg !231
  br label %if.end122

if.end122:                                        ; preds = %if.end122.critedge, %if.then103
  tail call void @exit(i32 0) #7, !dbg !357
  unreachable, !dbg !357
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

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate_copyfree")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"}
!8 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 2, type: !9, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !14)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !12, !13, !12}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!13 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!14 = !{!15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73}
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
!163 = !DILocation(line: 55, column: 12, scope: !8)
!164 = !DILocation(line: 221, column: 8, scope: !76)
!165 = !DILocation(line: 56, column: 12, scope: !8)
!166 = !DILocation(line: 5, column: 12, scope: !8)
!167 = !DILocation(line: 64, column: 6, scope: !76)
!168 = !DILocation(line: 231, column: 2, scope: !8)
!169 = !DILocation(line: 64, column: 7, scope: !170)
!170 = distinct !DILexicalBlock(scope: !76, file: !1, line: 64, column: 6)
!171 = distinct !{!171, !172, !"polly.alias.scope.moves"}
!172 = distinct !{!172, !"polly.alias.scope.domain"}
!173 = !{!174, !175, !176, !177}
!174 = distinct !{!174, !172, !"polly.alias.scope.y.0"}
!175 = distinct !{!175, !172, !"polly.alias.scope.storemerge"}
!176 = distinct !{!176, !172, !"polly.alias.scope.x.0"}
!177 = distinct !{!177, !172, !"polly.alias.scope.z.0"}
!178 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 235, type: !179, isLocal: false, isDefinition: true, scopeLine: 235, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !185)
!179 = !DISubroutineType(types: !180)
!180 = !{!181, !181, !182}
!181 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64, align: 64)
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64, align: 64)
!184 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!185 = !{!186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223}
!186 = !DILocalVariable(name: "argc", arg: 1, scope: !178, file: !1, line: 235, type: !181)
!187 = !DILocalVariable(name: "args", arg: 2, scope: !178, file: !1, line: 235, type: !182)
!188 = !DILocalVariable(name: "max", scope: !178, file: !1, line: 236, type: !11)
!189 = !DILocalVariable(name: "n", scope: !178, file: !1, line: 237, type: !12)
!190 = !DILocalVariable(name: "moves", scope: !178, file: !1, line: 238, type: !11)
!191 = !DILocalVariable(name: "moves_size", scope: !178, file: !1, line: 238, type: !12)
!192 = !DILocalVariable(name: "moves_has_ownership", scope: !178, file: !1, line: 239, type: !13)
!193 = !DILocalVariable(name: "sum_alice", scope: !178, file: !1, line: 240, type: !12)
!194 = !DILocalVariable(name: "_5", scope: !178, file: !1, line: 241, type: !11)
!195 = !DILocalVariable(name: "_6", scope: !178, file: !1, line: 242, type: !196)
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!197 = !DILocalVariable(name: "_6_size", scope: !178, file: !1, line: 242, type: !12)
!198 = !DILocalVariable(name: "_6_size_size", scope: !178, file: !1, line: 242, type: !12)
!199 = !DILocalVariable(name: "_6_has_ownership", scope: !178, file: !1, line: 243, type: !13)
!200 = !DILocalVariable(name: "_7", scope: !178, file: !1, line: 244, type: !12)
!201 = !DILocalVariable(name: "_8", scope: !178, file: !1, line: 245, type: !11)
!202 = !DILocalVariable(name: "_8_size", scope: !178, file: !1, line: 245, type: !12)
!203 = !DILocalVariable(name: "_8_has_ownership", scope: !178, file: !1, line: 246, type: !13)
!204 = !DILocalVariable(name: "_9", scope: !178, file: !1, line: 247, type: !12)
!205 = !DILocalVariable(name: "_10", scope: !178, file: !1, line: 248, type: !12)
!206 = !DILocalVariable(name: "_11", scope: !178, file: !1, line: 249, type: !11)
!207 = !DILocalVariable(name: "_11_size", scope: !178, file: !1, line: 249, type: !12)
!208 = !DILocalVariable(name: "_11_has_ownership", scope: !178, file: !1, line: 250, type: !13)
!209 = !DILocalVariable(name: "_12", scope: !178, file: !1, line: 251, type: !11)
!210 = !DILocalVariable(name: "_12_size", scope: !178, file: !1, line: 251, type: !12)
!211 = !DILocalVariable(name: "_12_has_ownership", scope: !178, file: !1, line: 252, type: !13)
!212 = !DILocalVariable(name: "_13", scope: !178, file: !1, line: 253, type: !12)
!213 = !DILocalVariable(name: "_14", scope: !178, file: !1, line: 254, type: !12)
!214 = !DILocalVariable(name: "_15", scope: !178, file: !1, line: 255, type: !12)
!215 = !DILocalVariable(name: "_16", scope: !178, file: !1, line: 256, type: !4)
!216 = !DILocalVariable(name: "_18", scope: !178, file: !1, line: 257, type: !11)
!217 = !DILocalVariable(name: "_18_size", scope: !178, file: !1, line: 257, type: !12)
!218 = !DILocalVariable(name: "_18_has_ownership", scope: !178, file: !1, line: 258, type: !13)
!219 = !DILocalVariable(name: "_19", scope: !178, file: !1, line: 259, type: !4)
!220 = !DILocalVariable(name: "_21", scope: !178, file: !1, line: 260, type: !4)
!221 = !DILocalVariable(name: "_23", scope: !178, file: !1, line: 261, type: !11)
!222 = !DILocalVariable(name: "_23_size", scope: !178, file: !1, line: 261, type: !12)
!223 = !DILocalVariable(name: "_23_has_ownership", scope: !178, file: !1, line: 262, type: !13)
!224 = !DILocation(line: 235, column: 14, scope: !178)
!225 = !DILocation(line: 235, column: 27, scope: !178)
!226 = !DILocation(line: 237, column: 12, scope: !178)
!227 = !DILocation(line: 238, column: 2, scope: !178)
!228 = !DILocation(line: 239, column: 2, scope: !178)
!229 = !DILocation(line: 240, column: 12, scope: !178)
!230 = !DILocation(line: 242, column: 2, scope: !178)
!231 = !DILocation(line: 243, column: 2, scope: !178)
!232 = !DILocation(line: 244, column: 12, scope: !178)
!233 = !DILocation(line: 245, column: 2, scope: !178)
!234 = !DILocation(line: 246, column: 2, scope: !178)
!235 = !DILocation(line: 247, column: 12, scope: !178)
!236 = !DILocation(line: 248, column: 12, scope: !178)
!237 = !DILocation(line: 249, column: 2, scope: !178)
!238 = !DILocation(line: 250, column: 2, scope: !178)
!239 = !DILocation(line: 251, column: 2, scope: !178)
!240 = !DILocation(line: 252, column: 2, scope: !178)
!241 = !DILocation(line: 253, column: 12, scope: !178)
!242 = !DILocation(line: 254, column: 12, scope: !178)
!243 = !DILocation(line: 255, column: 12, scope: !178)
!244 = !DILocation(line: 257, column: 2, scope: !178)
!245 = !DILocation(line: 258, column: 2, scope: !178)
!246 = !DILocation(line: 261, column: 2, scope: !178)
!247 = !DILocation(line: 262, column: 2, scope: !178)
!248 = !DILocation(line: 264, column: 2, scope: !178)
!249 = !DILocation(line: 269, column: 5, scope: !178)
!250 = !{!251, !251, i64 0}
!251 = !{!"any pointer", !102, i64 0}
!252 = !DILocation(line: 271, column: 2, scope: !178)
!253 = !DILocation(line: 241, column: 13, scope: !178)
!254 = !DILocation(line: 236, column: 13, scope: !178)
!255 = !DILocation(line: 275, column: 9, scope: !256)
!256 = distinct !DILexicalBlock(scope: !178, file: !1, line: 275, column: 5)
!257 = !DILocation(line: 275, column: 5, scope: !178)
!258 = !DILocation(line: 277, column: 6, scope: !178)
!259 = !DILocation(line: 281, column: 7, scope: !178)
!260 = !DILocation(line: 284, column: 2, scope: !178)
!261 = !DILocation(line: 295, column: 8, scope: !178)
!262 = !DILocation(line: 305, column: 7, scope: !178)
!263 = !DILocation(line: 307, column: 6, scope: !178)
!264 = !DILocation(line: 314, column: 2, scope: !178)
!265 = !DILocation(line: 315, column: 9, scope: !178)
!266 = !DILocation(line: 315, column: 29, scope: !178)
!267 = !DILocation(line: 315, column: 36, scope: !178)
!268 = !DILocation(line: 315, column: 56, scope: !178)
!269 = !DILocation(line: 315, column: 63, scope: !178)
!270 = !DILocation(line: 315, column: 84, scope: !178)
!271 = !DILocation(line: 315, column: 91, scope: !178)
!272 = !DILocation(line: 315, column: 111, scope: !178)
!273 = !DILocation(line: 315, column: 118, scope: !178)
!274 = !DILocation(line: 315, column: 138, scope: !178)
!275 = !DILocation(line: 315, column: 146, scope: !178)
!276 = !DILocation(line: 315, column: 167, scope: !178)
!277 = !DILocation(line: 315, column: 175, scope: !178)
!278 = !DILocation(line: 315, column: 197, scope: !178)
!279 = !DILocation(line: 315, column: 205, scope: !178)
!280 = !DILocation(line: 315, column: 227, scope: !178)
!281 = !DILocation(line: 315, column: 235, scope: !178)
!282 = !DILocation(line: 315, column: 256, scope: !178)
!283 = !DILocation(line: 315, column: 264, scope: !178)
!284 = !DILocation(line: 315, column: 285, scope: !178)
!285 = !DILocation(line: 315, column: 293, scope: !178)
!286 = !DILocation(line: 315, column: 315, scope: !178)
!287 = !DILocation(line: 315, column: 323, scope: !178)
!288 = !DILocation(line: 315, column: 345, scope: !178)
!289 = !DILocation(line: 315, column: 353, scope: !178)
!290 = !DILocation(line: 315, column: 374, scope: !178)
!291 = !DILocation(line: 315, column: 382, scope: !178)
!292 = !DILocation(line: 315, column: 403, scope: !178)
!293 = !DILocation(line: 315, column: 411, scope: !178)
!294 = !DILocation(line: 315, column: 432, scope: !178)
!295 = !DILocation(line: 315, column: 440, scope: !178)
!296 = !DILocation(line: 315, column: 462, scope: !178)
!297 = !DILocation(line: 315, column: 470, scope: !178)
!298 = !DILocation(line: 315, column: 492, scope: !178)
!299 = !DILocation(line: 315, column: 500, scope: !178)
!300 = !DILocation(line: 315, column: 520, scope: !178)
!301 = !DILocation(line: 315, column: 528, scope: !178)
!302 = !DILocation(line: 315, column: 549, scope: !178)
!303 = !DILocation(line: 315, column: 557, scope: !178)
!304 = !DILocation(line: 315, column: 578, scope: !178)
!305 = !DILocation(line: 315, column: 586, scope: !178)
!306 = !DILocation(line: 315, column: 607, scope: !178)
!307 = !DILocation(line: 315, column: 615, scope: !178)
!308 = !DILocation(line: 315, column: 637, scope: !178)
!309 = !DILocation(line: 315, column: 645, scope: !178)
!310 = !DILocation(line: 315, column: 667, scope: !178)
!311 = !DILocation(line: 315, column: 675, scope: !178)
!312 = !DILocation(line: 315, column: 696, scope: !178)
!313 = !DILocation(line: 315, column: 704, scope: !178)
!314 = !DILocation(line: 318, column: 2, scope: !178)
!315 = !DILocation(line: 322, column: 2, scope: !178)
!316 = !DILocation(line: 327, column: 2, scope: !178)
!317 = !DILocation(line: 328, column: 9, scope: !178)
!318 = !DILocation(line: 328, column: 28, scope: !178)
!319 = !DILocation(line: 328, column: 35, scope: !178)
!320 = !DILocation(line: 328, column: 56, scope: !178)
!321 = !DILocation(line: 328, column: 63, scope: !178)
!322 = !DILocation(line: 328, column: 82, scope: !178)
!323 = !DILocation(line: 328, column: 89, scope: !178)
!324 = !DILocation(line: 328, column: 110, scope: !178)
!325 = !DILocation(line: 328, column: 117, scope: !178)
!326 = !DILocation(line: 328, column: 137, scope: !178)
!327 = !DILocation(line: 328, column: 145, scope: !178)
!328 = !DILocation(line: 328, column: 166, scope: !178)
!329 = !DILocation(line: 328, column: 174, scope: !178)
!330 = !DILocation(line: 328, column: 195, scope: !178)
!331 = !DILocation(line: 328, column: 203, scope: !178)
!332 = !DILocation(line: 328, column: 225, scope: !178)
!333 = !DILocation(line: 328, column: 233, scope: !178)
!334 = !DILocation(line: 328, column: 255, scope: !178)
!335 = !DILocation(line: 328, column: 263, scope: !178)
!336 = !DILocation(line: 328, column: 283, scope: !178)
!337 = !DILocation(line: 328, column: 291, scope: !178)
!338 = !DILocation(line: 328, column: 312, scope: !178)
!339 = !DILocation(line: 328, column: 320, scope: !178)
!340 = !DILocation(line: 331, column: 2, scope: !178)
!341 = !DILocation(line: 335, column: 2, scope: !342)
!342 = !DILexicalBlockFile(scope: !343, file: !1, discriminator: 1)
!343 = distinct !DILexicalBlock(scope: !344, file: !1, line: 335, column: 2)
!344 = distinct !DILexicalBlock(scope: !178, file: !1, line: 335, column: 2)
!345 = !DILocation(line: 336, column: 2, scope: !346)
!346 = !DILexicalBlockFile(scope: !347, file: !1, discriminator: 1)
!347 = distinct !DILexicalBlock(scope: !348, file: !1, line: 336, column: 2)
!348 = distinct !DILexicalBlock(scope: !178, file: !1, line: 336, column: 2)
!349 = !DILocation(line: 340, column: 2, scope: !350)
!350 = !DILexicalBlockFile(scope: !351, file: !1, discriminator: 1)
!351 = distinct !DILexicalBlock(scope: !352, file: !1, line: 340, column: 2)
!352 = distinct !DILexicalBlock(scope: !178, file: !1, line: 340, column: 2)
!353 = !DILocation(line: 341, column: 2, scope: !354)
!354 = !DILexicalBlockFile(scope: !355, file: !1, discriminator: 1)
!355 = distinct !DILexicalBlock(scope: !356, file: !1, line: 341, column: 2)
!356 = distinct !DILexicalBlock(scope: !178, file: !1, line: 341, column: 2)
!357 = !DILocation(line: 342, column: 2, scope: !178)
