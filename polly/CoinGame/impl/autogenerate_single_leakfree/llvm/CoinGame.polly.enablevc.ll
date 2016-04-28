; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind readnone uwtable
define i64 @max(i64 %a, i64 %b) #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !13, metadata !16), !dbg !17
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !14, metadata !16), !dbg !18
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !16), !dbg !19
  %cmp = icmp slt i64 %a, %b, !dbg !20
  %b.a = select i1 %cmp, i64 %b, i64 %a, !dbg !22
  ret i64 %b.a, !dbg !23
}

; Function Attrs: nounwind readnone uwtable
define i64 @min(i64 %a, i64 %b) #0 !dbg !25 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !27, metadata !16), !dbg !30
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !28, metadata !16), !dbg !31
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !16), !dbg !32
  %cmp = icmp slt i64 %a, %b, !dbg !33
  %a.b = select i1 %cmp, i64 %a, i64 %b, !dbg !35
  ret i64 %a.b, !dbg !36
}

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_has_ownership, i64 %n) #1 !dbg !38 {
entry:
  tail call void @llvm.dbg.value(metadata i64* %moves, i64 0, metadata !44, metadata !16), !dbg !102
  tail call void @llvm.dbg.value(metadata i64 %moves_size, i64 0, metadata !45, metadata !16), !dbg !102
  tail call void @llvm.dbg.value(metadata i1 %moves_has_ownership, i64 0, metadata !46, metadata !103), !dbg !104
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !47, metadata !16), !dbg !105
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !48, metadata !16), !dbg !106
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !49, metadata !16), !dbg !106
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !50, metadata !16), !dbg !107
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !16), !dbg !108
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !16), !dbg !109
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !53, metadata !16), !dbg !110
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !16), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !16), !dbg !112
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !16), !dbg !113
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !57, metadata !16), !dbg !114
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !58, metadata !16), !dbg !115
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !59, metadata !16), !dbg !116
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !60, metadata !16), !dbg !117
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !16), !dbg !118
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !62, metadata !16), !dbg !119
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !16), !dbg !120
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !16), !dbg !121
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !65, metadata !16), !dbg !122
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !16), !dbg !123
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !16), !dbg !124
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !16), !dbg !125
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !16), !dbg !126
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !16), !dbg !127
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !16), !dbg !128
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !16), !dbg !129
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !16), !dbg !130
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !16), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !75, metadata !16), !dbg !132
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !16), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !16), !dbg !134
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !16), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !16), !dbg !136
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !16), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !16), !dbg !138
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !82, metadata !16), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !16), !dbg !140
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !84, metadata !16), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !16), !dbg !142
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !16), !dbg !143
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !16), !dbg !144
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !16), !dbg !145
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !16), !dbg !146
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !16), !dbg !147
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !91, metadata !16), !dbg !148
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !16), !dbg !149
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !93, metadata !16), !dbg !150
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !94, metadata !16), !dbg !151
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !95, metadata !16), !dbg !152
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !96, metadata !16), !dbg !153
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !16), !dbg !154
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !16), !dbg !155
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !99, metadata !16), !dbg !156
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !16), !dbg !157
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !101, metadata !16), !dbg !158
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !57, metadata !16), !dbg !114
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !16), !dbg !108
  %cmp128 = icmp sgt i64 %n, 0, !dbg !159
  br i1 %cmp128, label %while.cond1.preheader.lr.ph, label %if.end42, !dbg !162

while.cond1.preheader.lr.ph:                      ; preds = %entry
  %0 = shl i64 %n, 3, !dbg !162
  %1 = add i64 %0, 8, !dbg !162
  br label %while.cond1.preheader, !dbg !162

while.cond1.preheader:                            ; preds = %blklab6, %while.cond1.preheader.lr.ph
  %indvars.iv = phi i64 [ %n, %while.cond1.preheader.lr.ph ], [ %indvars.iv.next, %blklab6 ]
  %s.0129 = phi i64 [ 0, %while.cond1.preheader.lr.ph ], [ %add40, %blklab6 ]
  %2 = add nsw i64 %s.0129, -2
  %3 = shl nsw i64 %s.0129, 3
  %4 = icmp sgt i64 %s.0129, 1152921504606846975
  br i1 %4, label %if.end5.us.preheader, label %if.end5.preheader

if.end5.preheader:                                ; preds = %while.cond1.preheader
  br label %if.end5, !dbg !116

if.end5.us.preheader:                             ; preds = %while.cond1.preheader
  br label %if.end5.us, !dbg !116

if.end5.us:                                       ; preds = %if.end5.us.preheader, %blklab10.us
  %i.0127.us = phi i64 [ %add.us, %blklab10.us ], [ 0, %if.end5.us.preheader ]
  %j.0126.us = phi i64 [ %add38.us, %blklab10.us ], [ %s.0129, %if.end5.us.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !59, metadata !16), !dbg !116
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !16), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !60, metadata !16), !dbg !117
  %add.us = add nuw nsw i64 %i.0127.us, 1, !dbg !163
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !61, metadata !16), !dbg !118
  %cmp6.us = icmp sge i64 %add.us, %n, !dbg !165
  %cmp9.us = icmp slt i64 %j.0126.us, 1, !dbg !167
  %or.cond.us = or i1 %cmp9.us, %cmp6.us, !dbg !169
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !62, metadata !16), !dbg !119
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !16), !dbg !121
  br i1 %or.cond.us, label %blklab8.us, label %if.end11.us, !dbg !169

if.end11.us:                                      ; preds = %if.end5.us
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !65, metadata !16), !dbg !122
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !66, metadata !16), !dbg !123
  %mul.us = mul nsw i64 %add.us, %n, !dbg !170
  tail call void @llvm.dbg.value(metadata i64 %mul.us, i64 0, metadata !67, metadata !16), !dbg !124
  tail call void @llvm.dbg.value(metadata i64 %add13.us, i64 0, metadata !68, metadata !16), !dbg !125
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !69, metadata !16), !dbg !126
  %add13.us = add nsw i64 %j.0126.us, -1, !dbg !171
  %sub14.us = add i64 %add13.us, %mul.us, !dbg !172
  tail call void @llvm.dbg.value(metadata i64 %sub14.us, i64 0, metadata !70, metadata !16), !dbg !127
  %arrayidx.us = getelementptr inbounds i64, i64* %moves, i64 %sub14.us, !dbg !173
  %5 = load i64, i64* %arrayidx.us, align 8, !dbg !173, !tbaa !174
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !71, metadata !16), !dbg !128
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !54, metadata !16), !dbg !111
  br label %blklab8.us, !dbg !178

blklab8.us:                                       ; preds = %if.end11.us, %if.end5.us
  %y.0.ph.us = phi i64 [ %5, %if.end11.us ], [ 0, %if.end5.us ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !16), !dbg !129
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !16), !dbg !112
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !73, metadata !16), !dbg !130
  %add15.us = add nuw nsw i64 %i.0127.us, 2, !dbg !179
  tail call void @llvm.dbg.value(metadata i64 %add15.us, i64 0, metadata !74, metadata !16), !dbg !131
  %cmp16.us = icmp slt i64 %add15.us, %n, !dbg !180
  br i1 %cmp16.us, label %if.end18.us, label %blklab9.us, !dbg !182

if.end18.us:                                      ; preds = %blklab8.us
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !75, metadata !16), !dbg !132
  tail call void @llvm.dbg.value(metadata i64 %add15.us, i64 0, metadata !76, metadata !16), !dbg !133
  %mul20.us = mul nsw i64 %add15.us, %n, !dbg !183
  tail call void @llvm.dbg.value(metadata i64 %mul20.us, i64 0, metadata !77, metadata !16), !dbg !134
  %add21.us = add nsw i64 %mul20.us, %j.0126.us, !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %add21.us, i64 0, metadata !78, metadata !16), !dbg !135
  %arrayidx22.us = getelementptr inbounds i64, i64* %moves, i64 %add21.us, !dbg !185
  %6 = load i64, i64* %arrayidx22.us, align 8, !dbg !185, !tbaa !174
  tail call void @llvm.dbg.value(metadata i64 %6, i64 0, metadata !79, metadata !16), !dbg !136
  tail call void @llvm.dbg.value(metadata i64 %6, i64 0, metadata !55, metadata !16), !dbg !112
  br label %blklab9.us, !dbg !186

blklab9.us:                                       ; preds = %if.end18.us, %blklab8.us
  %x.0.us = phi i64 [ 0, %blklab8.us ], [ %6, %if.end18.us ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !16), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !16), !dbg !113
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !81, metadata !16), !dbg !138
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !16), !dbg !140
  %cmp24.us = icmp slt i64 %j.0126.us, 2, !dbg !187
  %.pre = mul nsw i64 %i.0127.us, %n, !dbg !189
  br i1 %cmp24.us, label %blklab10.us, label %if.end26.us, !dbg !190

if.end26.us:                                      ; preds = %blklab9.us
  tail call void @llvm.dbg.value(metadata i64 %.pre, i64 0, metadata !84, metadata !16), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 %add28.us, i64 0, metadata !85, metadata !16), !dbg !142
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !86, metadata !16), !dbg !143
  %add28.us = add nsw i64 %j.0126.us, -2, !dbg !191
  %sub29.us = add i64 %add28.us, %.pre, !dbg !192
  tail call void @llvm.dbg.value(metadata i64 %sub29.us, i64 0, metadata !87, metadata !16), !dbg !144
  %arrayidx30.us = getelementptr inbounds i64, i64* %moves, i64 %sub29.us, !dbg !193
  %7 = load i64, i64* %arrayidx30.us, align 8, !dbg !193, !tbaa !174
  tail call void @llvm.dbg.value(metadata i64 %7, i64 0, metadata !88, metadata !16), !dbg !145
  tail call void @llvm.dbg.value(metadata i64 %7, i64 0, metadata !56, metadata !16), !dbg !113
  br label %blklab10.us, !dbg !194

blklab10.us:                                      ; preds = %blklab9.us, %if.end26.us
  %z.0.ph.merge.us = phi i64 [ %7, %if.end26.us ], [ 0, %blklab9.us ]
  tail call void @llvm.dbg.value(metadata i64 %x.0.us, i64 0, metadata !27, metadata !16), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 %y.0.ph.us, i64 0, metadata !28, metadata !16), !dbg !197
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !16), !dbg !198
  %cmp.i.us = icmp slt i64 %x.0.us, %y.0.ph.us, !dbg !199
  %a.b.i.us = select i1 %cmp.i.us, i64 %x.0.us, i64 %y.0.ph.us, !dbg !200
  tail call void @llvm.dbg.value(metadata i64 %a.b.i.us, i64 0, metadata !90, metadata !16), !dbg !147
  %add31.us = add nsw i64 %a.b.i.us, %i.0127.us, !dbg !201
  tail call void @llvm.dbg.value(metadata i64 %add31.us, i64 0, metadata !91, metadata !16), !dbg !148
  tail call void @llvm.dbg.value(metadata i64 %y.0.ph.us, i64 0, metadata !27, metadata !16), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 %z.0.ph.merge.us, i64 0, metadata !28, metadata !16), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !16), !dbg !205
  %cmp.i143.us = icmp slt i64 %y.0.ph.us, %z.0.ph.merge.us, !dbg !206
  %a.b.i144.us = select i1 %cmp.i143.us, i64 %y.0.ph.us, i64 %z.0.ph.merge.us, !dbg !207
  tail call void @llvm.dbg.value(metadata i64 %a.b.i144.us, i64 0, metadata !92, metadata !16), !dbg !149
  %add33.us = add nsw i64 %a.b.i144.us, %j.0126.us, !dbg !208
  tail call void @llvm.dbg.value(metadata i64 %add33.us, i64 0, metadata !93, metadata !16), !dbg !150
  tail call void @llvm.dbg.value(metadata i64 %add31.us, i64 0, metadata !13, metadata !16), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 %add33.us, i64 0, metadata !14, metadata !16), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !16), !dbg !212
  %cmp.i142.us = icmp slt i64 %add31.us, %add33.us, !dbg !213
  %b.a.i.us = select i1 %cmp.i142.us, i64 %add33.us, i64 %add31.us, !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %b.a.i.us, i64 0, metadata !89, metadata !16), !dbg !146
  tail call void @llvm.dbg.value(metadata i64 %.pre, i64 0, metadata !94, metadata !16), !dbg !151
  %add36.us = add nsw i64 %.pre, %j.0126.us, !dbg !215
  tail call void @llvm.dbg.value(metadata i64 %add36.us, i64 0, metadata !95, metadata !16), !dbg !152
  %arrayidx37.us = getelementptr inbounds i64, i64* %moves, i64 %add36.us, !dbg !216
  store i64 %b.a.i.us, i64* %arrayidx37.us, align 8, !dbg !217, !tbaa !174
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !96, metadata !16), !dbg !153
  %add38.us = add nuw nsw i64 %j.0126.us, 1, !dbg !218
  tail call void @llvm.dbg.value(metadata i64 %add38.us, i64 0, metadata !97, metadata !16), !dbg !154
  tail call void @llvm.dbg.value(metadata i64 %add38.us, i64 0, metadata !52, metadata !16), !dbg !109
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !98, metadata !16), !dbg !155
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !99, metadata !16), !dbg !156
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !53, metadata !16), !dbg !110
  %exitcond.us = icmp eq i64 %add.us, %indvars.iv, !dbg !219
  br i1 %exitcond.us, label %blklab6.loopexit, label %if.end5.us, !dbg !219

if.end5:                                          ; preds = %if.end5.preheader, %blklab10
  %i.0127 = phi i64 [ %add, %blklab10 ], [ 0, %if.end5.preheader ]
  %j.0126 = phi i64 [ %add38, %blklab10 ], [ %s.0129, %if.end5.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !59, metadata !16), !dbg !116
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !16), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !60, metadata !16), !dbg !117
  %8 = mul i64 %i.0127, %1, !dbg !163
  %add = add nuw nsw i64 %i.0127, 1, !dbg !163
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !61, metadata !16), !dbg !118
  %cmp6 = icmp sge i64 %add, %n, !dbg !165
  %cmp9 = icmp slt i64 %j.0126, 1, !dbg !167
  %or.cond = or i1 %cmp9, %cmp6, !dbg !169
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !62, metadata !16), !dbg !119
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !16), !dbg !121
  br i1 %or.cond, label %polly.preload.cond, label %if.end11, !dbg !169

if.end11:                                         ; preds = %if.end5
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !65, metadata !16), !dbg !122
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !66, metadata !16), !dbg !123
  %mul = mul nsw i64 %add, %n, !dbg !170
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !67, metadata !16), !dbg !124
  tail call void @llvm.dbg.value(metadata i64 %add13, i64 0, metadata !68, metadata !16), !dbg !125
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !69, metadata !16), !dbg !126
  %add13 = add nsw i64 %j.0126, -1, !dbg !171
  %sub14 = add i64 %add13, %mul, !dbg !172
  tail call void @llvm.dbg.value(metadata i64 %sub14, i64 0, metadata !70, metadata !16), !dbg !127
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %sub14, !dbg !173
  %9 = load i64, i64* %arrayidx, align 8, !dbg !173, !tbaa !174
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !71, metadata !16), !dbg !128
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !54, metadata !16), !dbg !111
  br label %polly.preload.cond, !dbg !178

polly.preload.cond:                               ; preds = %if.end5, %if.end11
  %y.0.ph = phi i64 [ %9, %if.end11 ], [ 0, %if.end5 ]
  %10 = add nuw nsw i64 %i.0127, 3
  %11 = add nuw nsw i64 %i.0127, %s.0129
  %12 = icmp sgt i64 %11, 1
  br i1 %12, label %polly.preload.exec133, label %polly.preload.merge132

polly.preload.merge132:                           ; preds = %polly.preload.exec133, %polly.preload.cond
  %polly.preload..merge136 = phi i64 [ %polly.access.moves135.load, %polly.preload.exec133 ], [ 0, %polly.preload.cond ]
  %13 = add nsw i64 %8, %3
  %14 = icmp sgt i64 %13, -9223372036854775793
  %15 = icmp sgt i64 %i.0127, 9223372036854775805
  %16 = or i1 %15, %14
  %17 = icmp sle i64 %10, %n
  %18 = or i1 %17, %16
  %19 = icmp slt i64 %13, -9223372036854775792
  %20 = and i1 %12, %19
  %21 = or i1 %20, %18
  br i1 %21, label %blklab8, label %polly.cond

blklab8:                                          ; preds = %polly.preload.merge132
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !16), !dbg !129
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !16), !dbg !112
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !73, metadata !16), !dbg !130
  %add15 = add nuw nsw i64 %i.0127, 2, !dbg !179
  tail call void @llvm.dbg.value(metadata i64 %add15, i64 0, metadata !74, metadata !16), !dbg !131
  %cmp16 = icmp slt i64 %add15, %n, !dbg !180
  br i1 %cmp16, label %if.end18, label %blklab9, !dbg !182

if.end18:                                         ; preds = %blklab8
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !75, metadata !16), !dbg !132
  tail call void @llvm.dbg.value(metadata i64 %add15, i64 0, metadata !76, metadata !16), !dbg !133
  %mul20 = mul nsw i64 %add15, %n, !dbg !183
  tail call void @llvm.dbg.value(metadata i64 %mul20, i64 0, metadata !77, metadata !16), !dbg !134
  %add21 = add nsw i64 %mul20, %j.0126, !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %add21, i64 0, metadata !78, metadata !16), !dbg !135
  %arrayidx22 = getelementptr inbounds i64, i64* %moves, i64 %add21, !dbg !185
  %22 = load i64, i64* %arrayidx22, align 8, !dbg !185, !tbaa !174
  tail call void @llvm.dbg.value(metadata i64 %22, i64 0, metadata !79, metadata !16), !dbg !136
  tail call void @llvm.dbg.value(metadata i64 %22, i64 0, metadata !55, metadata !16), !dbg !112
  br label %blklab9, !dbg !186

blklab9:                                          ; preds = %blklab8, %if.end18
  %x.0 = phi i64 [ 0, %blklab8 ], [ %22, %if.end18 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !16), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !16), !dbg !113
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !81, metadata !16), !dbg !138
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !16), !dbg !140
  %cmp24 = icmp slt i64 %j.0126, 2, !dbg !187
  br i1 %cmp24, label %blklab10, label %if.end26, !dbg !190

if.end26:                                         ; preds = %blklab9
  %mul27 = mul nsw i64 %i.0127, %n, !dbg !220
  tail call void @llvm.dbg.value(metadata i64 %mul27, i64 0, metadata !84, metadata !16), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 %add28, i64 0, metadata !85, metadata !16), !dbg !142
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !86, metadata !16), !dbg !143
  %add28 = add nsw i64 %j.0126, -2, !dbg !191
  %sub29 = add i64 %add28, %mul27, !dbg !192
  tail call void @llvm.dbg.value(metadata i64 %sub29, i64 0, metadata !87, metadata !16), !dbg !144
  %arrayidx30 = getelementptr inbounds i64, i64* %moves, i64 %sub29, !dbg !193
  %23 = load i64, i64* %arrayidx30, align 8, !dbg !193, !tbaa !174
  tail call void @llvm.dbg.value(metadata i64 %23, i64 0, metadata !88, metadata !16), !dbg !145
  tail call void @llvm.dbg.value(metadata i64 %23, i64 0, metadata !56, metadata !16), !dbg !113
  br label %blklab10, !dbg !194

blklab10:                                         ; preds = %polly.cond, %if.end26, %blklab9
  %z.0.ph.merge = phi i64 [ %23, %if.end26 ], [ 0, %blklab9 ], [ %polly.preload..merge136., %polly.cond ]
  %x.0.merge = phi i64 [ %x.0, %if.end26 ], [ %x.0, %blklab9 ], [ 0, %polly.cond ]
  tail call void @llvm.dbg.value(metadata i64 %x.0.merge, i64 0, metadata !27, metadata !16), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 %y.0.ph, i64 0, metadata !28, metadata !16), !dbg !197
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !16), !dbg !198
  %cmp.i = icmp slt i64 %x.0.merge, %y.0.ph, !dbg !199
  %a.b.i = select i1 %cmp.i, i64 %x.0.merge, i64 %y.0.ph, !dbg !200
  tail call void @llvm.dbg.value(metadata i64 %a.b.i, i64 0, metadata !90, metadata !16), !dbg !147
  %add31 = add nsw i64 %a.b.i, %i.0127, !dbg !201
  tail call void @llvm.dbg.value(metadata i64 %add31, i64 0, metadata !91, metadata !16), !dbg !148
  tail call void @llvm.dbg.value(metadata i64 %y.0.ph, i64 0, metadata !27, metadata !16), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 %z.0.ph.merge, i64 0, metadata !28, metadata !16), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !16), !dbg !205
  %cmp.i143 = icmp slt i64 %y.0.ph, %z.0.ph.merge, !dbg !206
  %a.b.i144 = select i1 %cmp.i143, i64 %y.0.ph, i64 %z.0.ph.merge, !dbg !207
  tail call void @llvm.dbg.value(metadata i64 %a.b.i144, i64 0, metadata !92, metadata !16), !dbg !149
  %add33 = add nsw i64 %a.b.i144, %j.0126, !dbg !208
  tail call void @llvm.dbg.value(metadata i64 %add33, i64 0, metadata !93, metadata !16), !dbg !150
  tail call void @llvm.dbg.value(metadata i64 %add31, i64 0, metadata !13, metadata !16), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 %add33, i64 0, metadata !14, metadata !16), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !16), !dbg !212
  %cmp.i142 = icmp slt i64 %add31, %add33, !dbg !213
  %b.a.i = select i1 %cmp.i142, i64 %add33, i64 %add31, !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %b.a.i, i64 0, metadata !89, metadata !16), !dbg !146
  %mul35 = mul nsw i64 %i.0127, %n, !dbg !189
  tail call void @llvm.dbg.value(metadata i64 %mul35, i64 0, metadata !94, metadata !16), !dbg !151
  %add36 = add nsw i64 %mul35, %j.0126, !dbg !215
  tail call void @llvm.dbg.value(metadata i64 %add36, i64 0, metadata !95, metadata !16), !dbg !152
  %arrayidx37 = getelementptr inbounds i64, i64* %moves, i64 %add36, !dbg !216
  store i64 %b.a.i, i64* %arrayidx37, align 8, !dbg !217, !tbaa !174
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !96, metadata !16), !dbg !153
  %add38 = add nuw nsw i64 %j.0126, 1, !dbg !218
  tail call void @llvm.dbg.value(metadata i64 %add38, i64 0, metadata !97, metadata !16), !dbg !154
  tail call void @llvm.dbg.value(metadata i64 %add38, i64 0, metadata !52, metadata !16), !dbg !109
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !98, metadata !16), !dbg !155
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !99, metadata !16), !dbg !156
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !53, metadata !16), !dbg !110
  %exitcond = icmp eq i64 %add, %indvars.iv, !dbg !219
  br i1 %exitcond, label %blklab6.loopexit148, label %if.end5, !dbg !219

blklab6.loopexit:                                 ; preds = %blklab10.us
  br label %blklab6, !dbg !157

blklab6.loopexit148:                              ; preds = %blklab10
  br label %blklab6, !dbg !157

blklab6:                                          ; preds = %blklab6.loopexit148, %blklab6.loopexit
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !100, metadata !16), !dbg !157
  %add40 = add nuw nsw i64 %s.0129, 1, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %add40, i64 0, metadata !101, metadata !16), !dbg !158
  tail call void @llvm.dbg.value(metadata i64 %add40, i64 0, metadata !51, metadata !16), !dbg !108
  %indvars.iv.next = add i64 %indvars.iv, -1, !dbg !162
  %exitcond130 = icmp eq i64 %add40, %n, !dbg !162
  br i1 %exitcond130, label %if.end42.loopexit, label %while.cond1.preheader, !dbg !162

if.end42.loopexit:                                ; preds = %blklab6
  br label %if.end42, !dbg !222

if.end42:                                         ; preds = %if.end42.loopexit, %entry
  ret i64* %moves, !dbg !222

polly.cond:                                       ; preds = %polly.preload.merge132
  %polly.preload..merge136. = select i1 %12, i64 %polly.preload..merge136, i64 0
  br label %blklab10

polly.preload.exec133:                            ; preds = %polly.preload.cond
  %polly.fdiv_q.shr134 = ashr exact i64 %8, 3
  %24 = add i64 %2, %polly.fdiv_q.shr134
  %polly.access.moves135 = getelementptr i64, i64* %moves, i64 %24
  %polly.access.moves135.load = load i64, i64* %polly.access.moves135, align 8
  br label %polly.preload.merge132
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #3 !dbg !223 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !231, metadata !16), !dbg !269
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !232, metadata !16), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !234, metadata !16), !dbg !271
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !235, metadata !16), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !236, metadata !16), !dbg !272
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !237, metadata !16), !dbg !273
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !238, metadata !16), !dbg !274
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !240, metadata !16), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !242, metadata !16), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !243, metadata !16), !dbg !275
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !244, metadata !16), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !245, metadata !16), !dbg !277
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !246, metadata !16), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !247, metadata !16), !dbg !278
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !248, metadata !16), !dbg !279
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !249, metadata !16), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !250, metadata !16), !dbg !281
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !251, metadata !16), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !252, metadata !16), !dbg !282
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !253, metadata !16), !dbg !283
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !254, metadata !16), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !255, metadata !16), !dbg !284
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !256, metadata !16), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !257, metadata !16), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !258, metadata !16), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !259, metadata !16), !dbg !288
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !261, metadata !16), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !262, metadata !16), !dbg !289
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !263, metadata !16), !dbg !290
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !266, metadata !16), !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !267, metadata !16), !dbg !291
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !268, metadata !16), !dbg !292
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7, !dbg !293
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !240, metadata !16), !dbg !275
  %sub = add nsw i32 %argc, -1, !dbg !293
  %conv = sext i32 %sub to i64, !dbg !293
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !242, metadata !16), !dbg !275
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !244, metadata !16), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !245, metadata !16), !dbg !277
  %0 = load i64*, i64** %call, align 8, !dbg !294, !tbaa !295
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !246, metadata !16), !dbg !278
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7, !dbg !297
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !239, metadata !16), !dbg !298
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !233, metadata !16), !dbg !299
  %cmp = icmp eq i64* %call1, null, !dbg !300
  br i1 %cmp, label %if.end122.critedge, label %if.then103, !dbg !302

if.then103:                                       ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !303, !tbaa !174
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !234, metadata !16), !dbg !271
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !249, metadata !16), !dbg !280
  %mul = mul nsw i64 %1, %1, !dbg !304
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !250, metadata !16), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !252, metadata !16), !dbg !282
  %conv6 = trunc i64 %mul to i32, !dbg !305
  %call7 = tail call i64* @gen1DArray(i32 0, i32 %conv6) #7, !dbg !305
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !251, metadata !16), !dbg !282
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !253, metadata !16), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !236, metadata !16), !dbg !272
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !235, metadata !16), !dbg !272
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !237, metadata !16), !dbg !273
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !253, metadata !16), !dbg !283
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !237, metadata !16), !dbg !273
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !255, metadata !16), !dbg !284
  %call14 = tail call i64* @findMoves(i64* %call7, i64 undef, i1 zeroext undef, i64 %1), !dbg !306
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !254, metadata !16), !dbg !284
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !256, metadata !16), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !236, metadata !16), !dbg !272
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !235, metadata !16), !dbg !272
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !237, metadata !16), !dbg !273
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !256, metadata !16), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !257, metadata !16), !dbg !286
  %sub18 = add nsw i64 %1, -1, !dbg !307
  tail call void @llvm.dbg.value(metadata i64 %sub18, i64 0, metadata !258, metadata !16), !dbg !287
  %arrayidx19 = getelementptr inbounds i64, i64* %call14, i64 %sub18, !dbg !308
  %2 = load i64, i64* %arrayidx19, align 8, !dbg !308, !tbaa !174
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !259, metadata !16), !dbg !288
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !238, metadata !16), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 50, i64 0, metadata !262, metadata !16), !dbg !289
  %call23 = tail call noalias i8* @malloc(i64 400) #7, !dbg !309
  %3 = bitcast i8* %call23 to i64*, !dbg !309
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !261, metadata !16), !dbg !289
  %4 = bitcast i8* %call23 to <2 x i64>*, !dbg !310
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %4, align 8, !dbg !310, !tbaa !174
  %arrayidx26 = getelementptr inbounds i8, i8* %call23, i64 16, !dbg !311
  %5 = bitcast i8* %arrayidx26 to <2 x i64>*, !dbg !312
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %5, align 8, !dbg !312, !tbaa !174
  %arrayidx28 = getelementptr inbounds i8, i8* %call23, i64 32, !dbg !313
  %6 = bitcast i8* %arrayidx28 to <2 x i64>*, !dbg !314
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %6, align 8, !dbg !314, !tbaa !174
  %arrayidx30 = getelementptr inbounds i8, i8* %call23, i64 48, !dbg !315
  %7 = bitcast i8* %arrayidx30 to <2 x i64>*, !dbg !316
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %7, align 8, !dbg !316, !tbaa !174
  %arrayidx32 = getelementptr inbounds i8, i8* %call23, i64 64, !dbg !317
  %8 = bitcast i8* %arrayidx32 to <2 x i64>*, !dbg !318
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %8, align 8, !dbg !318, !tbaa !174
  %arrayidx34 = getelementptr inbounds i8, i8* %call23, i64 80, !dbg !319
  %9 = bitcast i8* %arrayidx34 to <2 x i64>*, !dbg !320
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %9, align 8, !dbg !320, !tbaa !174
  %arrayidx36 = getelementptr inbounds i8, i8* %call23, i64 96, !dbg !321
  %10 = bitcast i8* %arrayidx36 to <2 x i64>*, !dbg !322
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %10, align 8, !dbg !322, !tbaa !174
  %arrayidx38 = getelementptr inbounds i8, i8* %call23, i64 112, !dbg !323
  %11 = bitcast i8* %arrayidx38 to <2 x i64>*, !dbg !324
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %11, align 8, !dbg !324, !tbaa !174
  %arrayidx40 = getelementptr inbounds i8, i8* %call23, i64 128, !dbg !325
  %12 = bitcast i8* %arrayidx40 to <2 x i64>*, !dbg !326
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %12, align 8, !dbg !326, !tbaa !174
  %arrayidx42 = getelementptr inbounds i8, i8* %call23, i64 144, !dbg !327
  %13 = bitcast i8* %arrayidx42 to <2 x i64>*, !dbg !328
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %13, align 8, !dbg !328, !tbaa !174
  %arrayidx44 = getelementptr inbounds i8, i8* %call23, i64 160, !dbg !329
  %14 = bitcast i8* %arrayidx44 to <2 x i64>*, !dbg !330
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %14, align 8, !dbg !330, !tbaa !174
  %arrayidx46 = getelementptr inbounds i8, i8* %call23, i64 176, !dbg !331
  %15 = bitcast i8* %arrayidx46 to <2 x i64>*, !dbg !332
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %15, align 8, !dbg !332, !tbaa !174
  %arrayidx48 = getelementptr inbounds i8, i8* %call23, i64 192, !dbg !333
  %16 = bitcast i8* %arrayidx48 to <2 x i64>*, !dbg !334
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %16, align 8, !dbg !334, !tbaa !174
  %arrayidx50 = getelementptr inbounds i8, i8* %call23, i64 208, !dbg !335
  %17 = bitcast i8* %arrayidx50 to <2 x i64>*, !dbg !336
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %17, align 8, !dbg !336, !tbaa !174
  %arrayidx52 = getelementptr inbounds i8, i8* %call23, i64 224, !dbg !337
  %18 = bitcast i8* %arrayidx52 to <2 x i64>*, !dbg !338
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %18, align 8, !dbg !338, !tbaa !174
  %arrayidx54 = getelementptr inbounds i8, i8* %call23, i64 240, !dbg !339
  %19 = bitcast i8* %arrayidx54 to <2 x i64>*, !dbg !340
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %19, align 8, !dbg !340, !tbaa !174
  %arrayidx56 = getelementptr inbounds i8, i8* %call23, i64 256, !dbg !341
  %20 = bitcast i8* %arrayidx56 to <2 x i64>*, !dbg !342
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %20, align 8, !dbg !342, !tbaa !174
  %arrayidx58 = getelementptr inbounds i8, i8* %call23, i64 272, !dbg !343
  %21 = bitcast i8* %arrayidx58 to <2 x i64>*, !dbg !344
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %21, align 8, !dbg !344, !tbaa !174
  %arrayidx60 = getelementptr inbounds i8, i8* %call23, i64 288, !dbg !345
  %22 = bitcast i8* %arrayidx60 to <2 x i64>*, !dbg !346
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %22, align 8, !dbg !346, !tbaa !174
  %arrayidx62 = getelementptr inbounds i8, i8* %call23, i64 304, !dbg !347
  %23 = bitcast i8* %arrayidx62 to <2 x i64>*, !dbg !348
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %23, align 8, !dbg !348, !tbaa !174
  %arrayidx64 = getelementptr inbounds i8, i8* %call23, i64 320, !dbg !349
  %24 = bitcast i8* %arrayidx64 to <2 x i64>*, !dbg !350
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %24, align 8, !dbg !350, !tbaa !174
  %arrayidx66 = getelementptr inbounds i8, i8* %call23, i64 336, !dbg !351
  %25 = bitcast i8* %arrayidx66 to <2 x i64>*, !dbg !352
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %25, align 8, !dbg !352, !tbaa !174
  %arrayidx68 = getelementptr inbounds i8, i8* %call23, i64 352, !dbg !353
  %26 = bitcast i8* %arrayidx68 to <2 x i64>*, !dbg !354
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %26, align 8, !dbg !354, !tbaa !174
  %arrayidx70 = getelementptr inbounds i8, i8* %call23, i64 368, !dbg !355
  %27 = bitcast i8* %arrayidx70 to <2 x i64>*, !dbg !356
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %27, align 8, !dbg !356, !tbaa !174
  %arrayidx72 = getelementptr inbounds i8, i8* %call23, i64 384, !dbg !357
  %28 = bitcast i8* %arrayidx72 to <2 x i64>*, !dbg !358
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %28, align 8, !dbg !358, !tbaa !174
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !263, metadata !16), !dbg !290
  tail call void @printf_s(i64* %3, i64 50) #7, !dbg !359
  %call74 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %2), !dbg !360
  tail call void @llvm.dbg.value(metadata i64 23, i64 0, metadata !267, metadata !16), !dbg !291
  %call78 = tail call noalias i8* @malloc(i64 184) #7, !dbg !361
  %29 = bitcast i8* %call78 to i64*, !dbg !361
  tail call void @llvm.dbg.value(metadata i64* %29, i64 0, metadata !266, metadata !16), !dbg !291
  %30 = bitcast i8* %call78 to <2 x i64>*, !dbg !362
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %30, align 8, !dbg !362, !tbaa !174
  %arrayidx81 = getelementptr inbounds i8, i8* %call78, i64 16, !dbg !363
  %31 = bitcast i8* %arrayidx81 to <2 x i64>*, !dbg !364
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %31, align 8, !dbg !364, !tbaa !174
  %arrayidx83 = getelementptr inbounds i8, i8* %call78, i64 32, !dbg !365
  %32 = bitcast i8* %arrayidx83 to <2 x i64>*, !dbg !366
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %32, align 8, !dbg !366, !tbaa !174
  %arrayidx85 = getelementptr inbounds i8, i8* %call78, i64 48, !dbg !367
  %33 = bitcast i8* %arrayidx85 to <2 x i64>*, !dbg !368
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %33, align 8, !dbg !368, !tbaa !174
  %arrayidx87 = getelementptr inbounds i8, i8* %call78, i64 64, !dbg !369
  %34 = bitcast i8* %arrayidx87 to <2 x i64>*, !dbg !370
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %34, align 8, !dbg !370, !tbaa !174
  %arrayidx89 = getelementptr inbounds i8, i8* %call78, i64 80, !dbg !371
  %35 = bitcast i8* %arrayidx89 to <2 x i64>*, !dbg !372
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %35, align 8, !dbg !372, !tbaa !174
  %arrayidx91 = getelementptr inbounds i8, i8* %call78, i64 96, !dbg !373
  %36 = bitcast i8* %arrayidx91 to <2 x i64>*, !dbg !374
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %36, align 8, !dbg !374, !tbaa !174
  %arrayidx93 = getelementptr inbounds i8, i8* %call78, i64 112, !dbg !375
  %37 = bitcast i8* %arrayidx93 to <2 x i64>*, !dbg !376
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %37, align 8, !dbg !376, !tbaa !174
  %arrayidx95 = getelementptr inbounds i8, i8* %call78, i64 128, !dbg !377
  %38 = bitcast i8* %arrayidx95 to <2 x i64>*, !dbg !378
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %38, align 8, !dbg !378, !tbaa !174
  %arrayidx97 = getelementptr inbounds i8, i8* %call78, i64 144, !dbg !379
  %39 = bitcast i8* %arrayidx97 to <2 x i64>*, !dbg !380
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %39, align 8, !dbg !380, !tbaa !174
  %arrayidx99 = getelementptr inbounds i8, i8* %call78, i64 160, !dbg !381
  %40 = bitcast i8* %arrayidx99 to <2 x i64>*, !dbg !382
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %40, align 8, !dbg !382, !tbaa !174
  %arrayidx101 = getelementptr inbounds i8, i8* %call78, i64 176, !dbg !383
  %41 = bitcast i8* %arrayidx101 to i64*, !dbg !383
  store i64 101, i64* %41, align 8, !dbg !384, !tbaa !174
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !268, metadata !16), !dbg !292
  tail call void @println_s(i64* %29, i64 23) #7, !dbg !385
  %phitmp = bitcast i64* %call14 to i8*, !dbg !385
  tail call void @free(i8* %phitmp) #7, !dbg !386
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !237, metadata !16), !dbg !273
  tail call void @free2DArray(i64** %call, i64 %conv) #7, !dbg !390
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !244, metadata !16), !dbg !276
  tail call void @free(i8* %call23) #7, !dbg !394
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !263, metadata !16), !dbg !290
  tail call void @free(i8* %call78) #7, !dbg !398
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !268, metadata !16), !dbg !292
  br label %if.end122, !dbg !398

if.end122.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #7, !dbg !390
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !244, metadata !16), !dbg !276
  br label %if.end122

if.end122:                                        ; preds = %if.end122.critedge, %if.then103
  tail call void @exit(i32 0) #8, !dbg !402
  unreachable, !dbg !402
}

declare i64** @convertArgsToIntArray(i32, i8**) #4

declare i64* @parseStringToInt(i64*) #4

declare i64* @gen1DArray(i32, i32) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @printf_s(i64*, i64) #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

declare void @println_s(i64*, i64) #4

declare void @free2DArray(i64**, i64) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #6

attributes #0 = { nounwind readnone uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate_single_leakfree")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"}
!8 = distinct !DISubprogram(name: "max", scope: !1, file: !1, line: 2, type: !9, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !12)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11, !11}
!11 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!12 = !{!13, !14, !15}
!13 = !DILocalVariable(name: "a", arg: 1, scope: !8, file: !1, line: 2, type: !11)
!14 = !DILocalVariable(name: "b", arg: 2, scope: !8, file: !1, line: 2, type: !11)
!15 = !DILocalVariable(name: "r", scope: !8, file: !1, line: 3, type: !11)
!16 = !DIExpression()
!17 = !DILocation(line: 2, column: 25, scope: !8)
!18 = !DILocation(line: 2, column: 38, scope: !8)
!19 = !DILocation(line: 3, column: 12, scope: !8)
!20 = !DILocation(line: 5, column: 6, scope: !21)
!21 = distinct !DILexicalBlock(scope: !8, file: !1, line: 5, column: 5)
!22 = !DILocation(line: 7, column: 2, scope: !8)
!23 = !DILocation(line: 17, column: 1, scope: !24)
!24 = !DILexicalBlockFile(scope: !8, file: !1, discriminator: 2)
!25 = distinct !DISubprogram(name: "min", scope: !1, file: !1, line: 19, type: !9, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !26)
!26 = !{!27, !28, !29}
!27 = !DILocalVariable(name: "a", arg: 1, scope: !25, file: !1, line: 19, type: !11)
!28 = !DILocalVariable(name: "b", arg: 2, scope: !25, file: !1, line: 19, type: !11)
!29 = !DILocalVariable(name: "r", scope: !25, file: !1, line: 20, type: !11)
!30 = !DILocation(line: 19, column: 25, scope: !25)
!31 = !DILocation(line: 19, column: 38, scope: !25)
!32 = !DILocation(line: 20, column: 12, scope: !25)
!33 = !DILocation(line: 22, column: 6, scope: !34)
!34 = distinct !DILexicalBlock(scope: !25, file: !1, line: 22, column: 5)
!35 = !DILocation(line: 24, column: 2, scope: !25)
!36 = !DILocation(line: 34, column: 1, scope: !37)
!37 = !DILexicalBlockFile(scope: !25, file: !1, discriminator: 2)
!38 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 36, type: !39, isLocal: false, isDefinition: true, scopeLine: 36, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !43)
!39 = !DISubroutineType(types: !40)
!40 = !{!41, !41, !11, !42, !11}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!42 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!43 = !{!44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101}
!44 = !DILocalVariable(name: "moves", arg: 1, scope: !38, file: !1, line: 36, type: !41)
!45 = !DILocalVariable(name: "moves_size", arg: 2, scope: !38, file: !1, line: 36, type: !11)
!46 = !DILocalVariable(name: "moves_has_ownership", arg: 3, scope: !38, file: !1, line: 36, type: !42)
!47 = !DILocalVariable(name: "n", arg: 4, scope: !38, file: !1, line: 36, type: !11)
!48 = !DILocalVariable(name: "_2", scope: !38, file: !1, line: 37, type: !41)
!49 = !DILocalVariable(name: "_2_size", scope: !38, file: !1, line: 37, type: !11)
!50 = !DILocalVariable(name: "_2_has_ownership", scope: !38, file: !1, line: 38, type: !42)
!51 = !DILocalVariable(name: "s", scope: !38, file: !1, line: 39, type: !11)
!52 = !DILocalVariable(name: "j", scope: !38, file: !1, line: 40, type: !11)
!53 = !DILocalVariable(name: "i", scope: !38, file: !1, line: 41, type: !11)
!54 = !DILocalVariable(name: "y", scope: !38, file: !1, line: 42, type: !11)
!55 = !DILocalVariable(name: "x", scope: !38, file: !1, line: 43, type: !11)
!56 = !DILocalVariable(name: "z", scope: !38, file: !1, line: 44, type: !11)
!57 = !DILocalVariable(name: "_9", scope: !38, file: !1, line: 45, type: !11)
!58 = !DILocalVariable(name: "_10", scope: !38, file: !1, line: 46, type: !11)
!59 = !DILocalVariable(name: "_11", scope: !38, file: !1, line: 47, type: !11)
!60 = !DILocalVariable(name: "_12", scope: !38, file: !1, line: 48, type: !11)
!61 = !DILocalVariable(name: "_13", scope: !38, file: !1, line: 49, type: !11)
!62 = !DILocalVariable(name: "_14", scope: !38, file: !1, line: 50, type: !11)
!63 = !DILocalVariable(name: "_15", scope: !38, file: !1, line: 51, type: !11)
!64 = !DILocalVariable(name: "_16", scope: !38, file: !1, line: 52, type: !11)
!65 = !DILocalVariable(name: "_17", scope: !38, file: !1, line: 53, type: !11)
!66 = !DILocalVariable(name: "_18", scope: !38, file: !1, line: 54, type: !11)
!67 = !DILocalVariable(name: "_19", scope: !38, file: !1, line: 55, type: !11)
!68 = !DILocalVariable(name: "_20", scope: !38, file: !1, line: 56, type: !11)
!69 = !DILocalVariable(name: "_21", scope: !38, file: !1, line: 57, type: !11)
!70 = !DILocalVariable(name: "_22", scope: !38, file: !1, line: 58, type: !11)
!71 = !DILocalVariable(name: "_23", scope: !38, file: !1, line: 59, type: !11)
!72 = !DILocalVariable(name: "_24", scope: !38, file: !1, line: 60, type: !11)
!73 = !DILocalVariable(name: "_25", scope: !38, file: !1, line: 61, type: !11)
!74 = !DILocalVariable(name: "_26", scope: !38, file: !1, line: 62, type: !11)
!75 = !DILocalVariable(name: "_27", scope: !38, file: !1, line: 63, type: !11)
!76 = !DILocalVariable(name: "_28", scope: !38, file: !1, line: 64, type: !11)
!77 = !DILocalVariable(name: "_29", scope: !38, file: !1, line: 65, type: !11)
!78 = !DILocalVariable(name: "_30", scope: !38, file: !1, line: 66, type: !11)
!79 = !DILocalVariable(name: "_31", scope: !38, file: !1, line: 67, type: !11)
!80 = !DILocalVariable(name: "_32", scope: !38, file: !1, line: 68, type: !11)
!81 = !DILocalVariable(name: "_33", scope: !38, file: !1, line: 69, type: !11)
!82 = !DILocalVariable(name: "_34", scope: !38, file: !1, line: 70, type: !11)
!83 = !DILocalVariable(name: "_35", scope: !38, file: !1, line: 71, type: !11)
!84 = !DILocalVariable(name: "_36", scope: !38, file: !1, line: 72, type: !11)
!85 = !DILocalVariable(name: "_37", scope: !38, file: !1, line: 73, type: !11)
!86 = !DILocalVariable(name: "_38", scope: !38, file: !1, line: 74, type: !11)
!87 = !DILocalVariable(name: "_39", scope: !38, file: !1, line: 75, type: !11)
!88 = !DILocalVariable(name: "_40", scope: !38, file: !1, line: 76, type: !11)
!89 = !DILocalVariable(name: "_41", scope: !38, file: !1, line: 77, type: !11)
!90 = !DILocalVariable(name: "_42", scope: !38, file: !1, line: 78, type: !11)
!91 = !DILocalVariable(name: "_43", scope: !38, file: !1, line: 79, type: !11)
!92 = !DILocalVariable(name: "_44", scope: !38, file: !1, line: 80, type: !11)
!93 = !DILocalVariable(name: "_45", scope: !38, file: !1, line: 81, type: !11)
!94 = !DILocalVariable(name: "_46", scope: !38, file: !1, line: 82, type: !11)
!95 = !DILocalVariable(name: "_47", scope: !38, file: !1, line: 83, type: !11)
!96 = !DILocalVariable(name: "_48", scope: !38, file: !1, line: 84, type: !11)
!97 = !DILocalVariable(name: "_49", scope: !38, file: !1, line: 85, type: !11)
!98 = !DILocalVariable(name: "_50", scope: !38, file: !1, line: 86, type: !11)
!99 = !DILocalVariable(name: "_51", scope: !38, file: !1, line: 87, type: !11)
!100 = !DILocalVariable(name: "_52", scope: !38, file: !1, line: 88, type: !11)
!101 = !DILocalVariable(name: "_53", scope: !38, file: !1, line: 89, type: !11)
!102 = !DILocation(line: 36, column: 22, scope: !38)
!103 = !DIExpression(DW_OP_bit_piece, 0, 1)
!104 = !DILocation(line: 36, column: 50, scope: !38)
!105 = !DILocation(line: 36, column: 90, scope: !38)
!106 = !DILocation(line: 37, column: 2, scope: !38)
!107 = !DILocation(line: 38, column: 2, scope: !38)
!108 = !DILocation(line: 39, column: 12, scope: !38)
!109 = !DILocation(line: 40, column: 12, scope: !38)
!110 = !DILocation(line: 41, column: 12, scope: !38)
!111 = !DILocation(line: 42, column: 12, scope: !38)
!112 = !DILocation(line: 43, column: 12, scope: !38)
!113 = !DILocation(line: 44, column: 12, scope: !38)
!114 = !DILocation(line: 45, column: 12, scope: !38)
!115 = !DILocation(line: 46, column: 12, scope: !38)
!116 = !DILocation(line: 47, column: 12, scope: !38)
!117 = !DILocation(line: 48, column: 12, scope: !38)
!118 = !DILocation(line: 49, column: 12, scope: !38)
!119 = !DILocation(line: 50, column: 12, scope: !38)
!120 = !DILocation(line: 51, column: 12, scope: !38)
!121 = !DILocation(line: 52, column: 12, scope: !38)
!122 = !DILocation(line: 53, column: 12, scope: !38)
!123 = !DILocation(line: 54, column: 12, scope: !38)
!124 = !DILocation(line: 55, column: 12, scope: !38)
!125 = !DILocation(line: 56, column: 12, scope: !38)
!126 = !DILocation(line: 57, column: 12, scope: !38)
!127 = !DILocation(line: 58, column: 12, scope: !38)
!128 = !DILocation(line: 59, column: 12, scope: !38)
!129 = !DILocation(line: 60, column: 12, scope: !38)
!130 = !DILocation(line: 61, column: 12, scope: !38)
!131 = !DILocation(line: 62, column: 12, scope: !38)
!132 = !DILocation(line: 63, column: 12, scope: !38)
!133 = !DILocation(line: 64, column: 12, scope: !38)
!134 = !DILocation(line: 65, column: 12, scope: !38)
!135 = !DILocation(line: 66, column: 12, scope: !38)
!136 = !DILocation(line: 67, column: 12, scope: !38)
!137 = !DILocation(line: 68, column: 12, scope: !38)
!138 = !DILocation(line: 69, column: 12, scope: !38)
!139 = !DILocation(line: 70, column: 12, scope: !38)
!140 = !DILocation(line: 71, column: 12, scope: !38)
!141 = !DILocation(line: 72, column: 12, scope: !38)
!142 = !DILocation(line: 73, column: 12, scope: !38)
!143 = !DILocation(line: 74, column: 12, scope: !38)
!144 = !DILocation(line: 75, column: 12, scope: !38)
!145 = !DILocation(line: 76, column: 12, scope: !38)
!146 = !DILocation(line: 77, column: 12, scope: !38)
!147 = !DILocation(line: 78, column: 12, scope: !38)
!148 = !DILocation(line: 79, column: 12, scope: !38)
!149 = !DILocation(line: 80, column: 12, scope: !38)
!150 = !DILocation(line: 81, column: 12, scope: !38)
!151 = !DILocation(line: 82, column: 12, scope: !38)
!152 = !DILocation(line: 83, column: 12, scope: !38)
!153 = !DILocation(line: 84, column: 12, scope: !38)
!154 = !DILocation(line: 85, column: 12, scope: !38)
!155 = !DILocation(line: 86, column: 12, scope: !38)
!156 = !DILocation(line: 87, column: 12, scope: !38)
!157 = !DILocation(line: 88, column: 12, scope: !38)
!158 = !DILocation(line: 89, column: 12, scope: !38)
!159 = !DILocation(line: 97, column: 7, scope: !160)
!160 = distinct !DILexicalBlock(scope: !161, file: !1, line: 97, column: 6)
!161 = distinct !DILexicalBlock(scope: !38, file: !1, line: 95, column: 13)
!162 = !DILocation(line: 97, column: 6, scope: !161)
!163 = !DILocation(line: 115, column: 9, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !1, line: 105, column: 14)
!165 = !DILocation(line: 117, column: 10, scope: !166)
!166 = distinct !DILexicalBlock(scope: !164, file: !1, line: 117, column: 7)
!167 = !DILocation(line: 125, column: 10, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !1, line: 125, column: 7)
!169 = !DILocation(line: 117, column: 7, scope: !164)
!170 = !DILocation(line: 131, column: 11, scope: !164)
!171 = !DILocation(line: 133, column: 11, scope: !164)
!172 = !DILocation(line: 137, column: 11, scope: !164)
!173 = !DILocation(line: 139, column: 8, scope: !164)
!174 = !{!175, !175, i64 0}
!175 = !{!"long long", !176, i64 0}
!176 = !{!"omnipotent char", !177, i64 0}
!177 = !{!"Simple C/C++ TBAA"}
!178 = !DILocation(line: 141, column: 4, scope: !164)
!179 = !DILocation(line: 151, column: 9, scope: !164)
!180 = !DILocation(line: 153, column: 10, scope: !181)
!181 = distinct !DILexicalBlock(scope: !164, file: !1, line: 153, column: 7)
!182 = !DILocation(line: 153, column: 7, scope: !164)
!183 = !DILocation(line: 159, column: 11, scope: !164)
!184 = !DILocation(line: 161, column: 11, scope: !164)
!185 = !DILocation(line: 163, column: 8, scope: !164)
!186 = !DILocation(line: 165, column: 4, scope: !164)
!187 = !DILocation(line: 179, column: 10, scope: !188)
!188 = distinct !DILexicalBlock(scope: !164, file: !1, line: 179, column: 7)
!189 = !DILocation(line: 205, column: 9, scope: !164)
!190 = !DILocation(line: 179, column: 7, scope: !164)
!191 = !DILocation(line: 183, column: 11, scope: !164)
!192 = !DILocation(line: 187, column: 11, scope: !164)
!193 = !DILocation(line: 189, column: 8, scope: !164)
!194 = !DILocation(line: 191, column: 4, scope: !164)
!195 = !DILocation(line: 19, column: 25, scope: !25, inlinedAt: !196)
!196 = distinct !DILocation(line: 195, column: 10, scope: !164)
!197 = !DILocation(line: 19, column: 38, scope: !25, inlinedAt: !196)
!198 = !DILocation(line: 20, column: 12, scope: !25, inlinedAt: !196)
!199 = !DILocation(line: 22, column: 6, scope: !34, inlinedAt: !196)
!200 = !DILocation(line: 24, column: 2, scope: !25, inlinedAt: !196)
!201 = !DILocation(line: 197, column: 9, scope: !164)
!202 = !DILocation(line: 19, column: 25, scope: !25, inlinedAt: !203)
!203 = distinct !DILocation(line: 199, column: 10, scope: !164)
!204 = !DILocation(line: 19, column: 38, scope: !25, inlinedAt: !203)
!205 = !DILocation(line: 20, column: 12, scope: !25, inlinedAt: !203)
!206 = !DILocation(line: 22, column: 6, scope: !34, inlinedAt: !203)
!207 = !DILocation(line: 24, column: 2, scope: !25, inlinedAt: !203)
!208 = !DILocation(line: 201, column: 9, scope: !164)
!209 = !DILocation(line: 2, column: 25, scope: !8, inlinedAt: !210)
!210 = distinct !DILocation(line: 203, column: 10, scope: !164)
!211 = !DILocation(line: 2, column: 38, scope: !8, inlinedAt: !210)
!212 = !DILocation(line: 3, column: 12, scope: !8, inlinedAt: !210)
!213 = !DILocation(line: 5, column: 6, scope: !21, inlinedAt: !210)
!214 = !DILocation(line: 7, column: 2, scope: !8, inlinedAt: !210)
!215 = !DILocation(line: 207, column: 11, scope: !164)
!216 = !DILocation(line: 209, column: 4, scope: !164)
!217 = !DILocation(line: 209, column: 15, scope: !164)
!218 = !DILocation(line: 213, column: 9, scope: !164)
!219 = !DILocation(line: 107, column: 7, scope: !164)
!220 = !DILocation(line: 181, column: 9, scope: !164)
!221 = !DILocation(line: 230, column: 8, scope: !161)
!222 = !DILocation(line: 240, column: 2, scope: !38)
!223 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 244, type: !224, isLocal: false, isDefinition: true, scopeLine: 244, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !230)
!224 = !DISubroutineType(types: !225)
!225 = !{!226, !226, !227}
!226 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !228, size: 64, align: 64)
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !229, size: 64, align: 64)
!229 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!230 = !{!231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268}
!231 = !DILocalVariable(name: "argc", arg: 1, scope: !223, file: !1, line: 244, type: !226)
!232 = !DILocalVariable(name: "args", arg: 2, scope: !223, file: !1, line: 244, type: !227)
!233 = !DILocalVariable(name: "max", scope: !223, file: !1, line: 245, type: !41)
!234 = !DILocalVariable(name: "n", scope: !223, file: !1, line: 246, type: !11)
!235 = !DILocalVariable(name: "moves", scope: !223, file: !1, line: 247, type: !41)
!236 = !DILocalVariable(name: "moves_size", scope: !223, file: !1, line: 247, type: !11)
!237 = !DILocalVariable(name: "moves_has_ownership", scope: !223, file: !1, line: 248, type: !42)
!238 = !DILocalVariable(name: "sum_alice", scope: !223, file: !1, line: 249, type: !11)
!239 = !DILocalVariable(name: "_5", scope: !223, file: !1, line: 250, type: !41)
!240 = !DILocalVariable(name: "_6", scope: !223, file: !1, line: 251, type: !241)
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64, align: 64)
!242 = !DILocalVariable(name: "_6_size", scope: !223, file: !1, line: 251, type: !11)
!243 = !DILocalVariable(name: "_6_size_size", scope: !223, file: !1, line: 251, type: !11)
!244 = !DILocalVariable(name: "_6_has_ownership", scope: !223, file: !1, line: 252, type: !42)
!245 = !DILocalVariable(name: "_7", scope: !223, file: !1, line: 253, type: !11)
!246 = !DILocalVariable(name: "_8", scope: !223, file: !1, line: 254, type: !41)
!247 = !DILocalVariable(name: "_8_size", scope: !223, file: !1, line: 254, type: !11)
!248 = !DILocalVariable(name: "_8_has_ownership", scope: !223, file: !1, line: 255, type: !42)
!249 = !DILocalVariable(name: "_9", scope: !223, file: !1, line: 256, type: !11)
!250 = !DILocalVariable(name: "_10", scope: !223, file: !1, line: 257, type: !11)
!251 = !DILocalVariable(name: "_11", scope: !223, file: !1, line: 258, type: !41)
!252 = !DILocalVariable(name: "_11_size", scope: !223, file: !1, line: 258, type: !11)
!253 = !DILocalVariable(name: "_11_has_ownership", scope: !223, file: !1, line: 259, type: !42)
!254 = !DILocalVariable(name: "_12", scope: !223, file: !1, line: 260, type: !41)
!255 = !DILocalVariable(name: "_12_size", scope: !223, file: !1, line: 260, type: !11)
!256 = !DILocalVariable(name: "_12_has_ownership", scope: !223, file: !1, line: 261, type: !42)
!257 = !DILocalVariable(name: "_13", scope: !223, file: !1, line: 262, type: !11)
!258 = !DILocalVariable(name: "_14", scope: !223, file: !1, line: 263, type: !11)
!259 = !DILocalVariable(name: "_15", scope: !223, file: !1, line: 264, type: !11)
!260 = !DILocalVariable(name: "_16", scope: !223, file: !1, line: 265, type: !4)
!261 = !DILocalVariable(name: "_18", scope: !223, file: !1, line: 266, type: !41)
!262 = !DILocalVariable(name: "_18_size", scope: !223, file: !1, line: 266, type: !11)
!263 = !DILocalVariable(name: "_18_has_ownership", scope: !223, file: !1, line: 267, type: !42)
!264 = !DILocalVariable(name: "_19", scope: !223, file: !1, line: 268, type: !4)
!265 = !DILocalVariable(name: "_21", scope: !223, file: !1, line: 269, type: !4)
!266 = !DILocalVariable(name: "_23", scope: !223, file: !1, line: 270, type: !41)
!267 = !DILocalVariable(name: "_23_size", scope: !223, file: !1, line: 270, type: !11)
!268 = !DILocalVariable(name: "_23_has_ownership", scope: !223, file: !1, line: 271, type: !42)
!269 = !DILocation(line: 244, column: 14, scope: !223)
!270 = !DILocation(line: 244, column: 27, scope: !223)
!271 = !DILocation(line: 246, column: 12, scope: !223)
!272 = !DILocation(line: 247, column: 2, scope: !223)
!273 = !DILocation(line: 248, column: 2, scope: !223)
!274 = !DILocation(line: 249, column: 12, scope: !223)
!275 = !DILocation(line: 251, column: 2, scope: !223)
!276 = !DILocation(line: 252, column: 2, scope: !223)
!277 = !DILocation(line: 253, column: 12, scope: !223)
!278 = !DILocation(line: 254, column: 2, scope: !223)
!279 = !DILocation(line: 255, column: 2, scope: !223)
!280 = !DILocation(line: 256, column: 12, scope: !223)
!281 = !DILocation(line: 257, column: 12, scope: !223)
!282 = !DILocation(line: 258, column: 2, scope: !223)
!283 = !DILocation(line: 259, column: 2, scope: !223)
!284 = !DILocation(line: 260, column: 2, scope: !223)
!285 = !DILocation(line: 261, column: 2, scope: !223)
!286 = !DILocation(line: 262, column: 12, scope: !223)
!287 = !DILocation(line: 263, column: 12, scope: !223)
!288 = !DILocation(line: 264, column: 12, scope: !223)
!289 = !DILocation(line: 266, column: 2, scope: !223)
!290 = !DILocation(line: 267, column: 2, scope: !223)
!291 = !DILocation(line: 270, column: 2, scope: !223)
!292 = !DILocation(line: 271, column: 2, scope: !223)
!293 = !DILocation(line: 273, column: 2, scope: !223)
!294 = !DILocation(line: 278, column: 5, scope: !223)
!295 = !{!296, !296, i64 0}
!296 = !{!"any pointer", !176, i64 0}
!297 = !DILocation(line: 280, column: 2, scope: !223)
!298 = !DILocation(line: 250, column: 13, scope: !223)
!299 = !DILocation(line: 245, column: 13, scope: !223)
!300 = !DILocation(line: 284, column: 9, scope: !301)
!301 = distinct !DILexicalBlock(scope: !223, file: !1, line: 284, column: 5)
!302 = !DILocation(line: 284, column: 5, scope: !223)
!303 = !DILocation(line: 286, column: 6, scope: !223)
!304 = !DILocation(line: 290, column: 7, scope: !223)
!305 = !DILocation(line: 293, column: 2, scope: !223)
!306 = !DILocation(line: 304, column: 8, scope: !223)
!307 = !DILocation(line: 314, column: 7, scope: !223)
!308 = !DILocation(line: 316, column: 6, scope: !223)
!309 = !DILocation(line: 323, column: 2, scope: !223)
!310 = !DILocation(line: 324, column: 9, scope: !223)
!311 = !DILocation(line: 324, column: 29, scope: !223)
!312 = !DILocation(line: 324, column: 36, scope: !223)
!313 = !DILocation(line: 324, column: 56, scope: !223)
!314 = !DILocation(line: 324, column: 63, scope: !223)
!315 = !DILocation(line: 324, column: 84, scope: !223)
!316 = !DILocation(line: 324, column: 91, scope: !223)
!317 = !DILocation(line: 324, column: 111, scope: !223)
!318 = !DILocation(line: 324, column: 118, scope: !223)
!319 = !DILocation(line: 324, column: 138, scope: !223)
!320 = !DILocation(line: 324, column: 146, scope: !223)
!321 = !DILocation(line: 324, column: 167, scope: !223)
!322 = !DILocation(line: 324, column: 175, scope: !223)
!323 = !DILocation(line: 324, column: 197, scope: !223)
!324 = !DILocation(line: 324, column: 205, scope: !223)
!325 = !DILocation(line: 324, column: 227, scope: !223)
!326 = !DILocation(line: 324, column: 235, scope: !223)
!327 = !DILocation(line: 324, column: 256, scope: !223)
!328 = !DILocation(line: 324, column: 264, scope: !223)
!329 = !DILocation(line: 324, column: 285, scope: !223)
!330 = !DILocation(line: 324, column: 293, scope: !223)
!331 = !DILocation(line: 324, column: 315, scope: !223)
!332 = !DILocation(line: 324, column: 323, scope: !223)
!333 = !DILocation(line: 324, column: 345, scope: !223)
!334 = !DILocation(line: 324, column: 353, scope: !223)
!335 = !DILocation(line: 324, column: 374, scope: !223)
!336 = !DILocation(line: 324, column: 382, scope: !223)
!337 = !DILocation(line: 324, column: 403, scope: !223)
!338 = !DILocation(line: 324, column: 411, scope: !223)
!339 = !DILocation(line: 324, column: 432, scope: !223)
!340 = !DILocation(line: 324, column: 440, scope: !223)
!341 = !DILocation(line: 324, column: 462, scope: !223)
!342 = !DILocation(line: 324, column: 470, scope: !223)
!343 = !DILocation(line: 324, column: 492, scope: !223)
!344 = !DILocation(line: 324, column: 500, scope: !223)
!345 = !DILocation(line: 324, column: 520, scope: !223)
!346 = !DILocation(line: 324, column: 528, scope: !223)
!347 = !DILocation(line: 324, column: 549, scope: !223)
!348 = !DILocation(line: 324, column: 557, scope: !223)
!349 = !DILocation(line: 324, column: 578, scope: !223)
!350 = !DILocation(line: 324, column: 586, scope: !223)
!351 = !DILocation(line: 324, column: 607, scope: !223)
!352 = !DILocation(line: 324, column: 615, scope: !223)
!353 = !DILocation(line: 324, column: 637, scope: !223)
!354 = !DILocation(line: 324, column: 645, scope: !223)
!355 = !DILocation(line: 324, column: 667, scope: !223)
!356 = !DILocation(line: 324, column: 675, scope: !223)
!357 = !DILocation(line: 324, column: 696, scope: !223)
!358 = !DILocation(line: 324, column: 704, scope: !223)
!359 = !DILocation(line: 327, column: 2, scope: !223)
!360 = !DILocation(line: 331, column: 2, scope: !223)
!361 = !DILocation(line: 336, column: 2, scope: !223)
!362 = !DILocation(line: 337, column: 9, scope: !223)
!363 = !DILocation(line: 337, column: 28, scope: !223)
!364 = !DILocation(line: 337, column: 35, scope: !223)
!365 = !DILocation(line: 337, column: 56, scope: !223)
!366 = !DILocation(line: 337, column: 63, scope: !223)
!367 = !DILocation(line: 337, column: 82, scope: !223)
!368 = !DILocation(line: 337, column: 89, scope: !223)
!369 = !DILocation(line: 337, column: 110, scope: !223)
!370 = !DILocation(line: 337, column: 117, scope: !223)
!371 = !DILocation(line: 337, column: 137, scope: !223)
!372 = !DILocation(line: 337, column: 145, scope: !223)
!373 = !DILocation(line: 337, column: 166, scope: !223)
!374 = !DILocation(line: 337, column: 174, scope: !223)
!375 = !DILocation(line: 337, column: 195, scope: !223)
!376 = !DILocation(line: 337, column: 203, scope: !223)
!377 = !DILocation(line: 337, column: 225, scope: !223)
!378 = !DILocation(line: 337, column: 233, scope: !223)
!379 = !DILocation(line: 337, column: 255, scope: !223)
!380 = !DILocation(line: 337, column: 263, scope: !223)
!381 = !DILocation(line: 337, column: 283, scope: !223)
!382 = !DILocation(line: 337, column: 291, scope: !223)
!383 = !DILocation(line: 337, column: 312, scope: !223)
!384 = !DILocation(line: 337, column: 320, scope: !223)
!385 = !DILocation(line: 340, column: 2, scope: !223)
!386 = !DILocation(line: 344, column: 2, scope: !387)
!387 = !DILexicalBlockFile(scope: !388, file: !1, discriminator: 1)
!388 = distinct !DILexicalBlock(scope: !389, file: !1, line: 344, column: 2)
!389 = distinct !DILexicalBlock(scope: !223, file: !1, line: 344, column: 2)
!390 = !DILocation(line: 345, column: 2, scope: !391)
!391 = !DILexicalBlockFile(scope: !392, file: !1, discriminator: 1)
!392 = distinct !DILexicalBlock(scope: !393, file: !1, line: 345, column: 2)
!393 = distinct !DILexicalBlock(scope: !223, file: !1, line: 345, column: 2)
!394 = !DILocation(line: 349, column: 2, scope: !395)
!395 = !DILexicalBlockFile(scope: !396, file: !1, discriminator: 1)
!396 = distinct !DILexicalBlock(scope: !397, file: !1, line: 349, column: 2)
!397 = distinct !DILexicalBlock(scope: !223, file: !1, line: 349, column: 2)
!398 = !DILocation(line: 350, column: 2, scope: !399)
!399 = !DILexicalBlockFile(scope: !400, file: !1, discriminator: 1)
!400 = distinct !DILexicalBlock(scope: !401, file: !1, line: 350, column: 2)
!401 = distinct !DILexicalBlock(scope: !223, file: !1, line: 350, column: 2)
!402 = !DILocation(line: 351, column: 2, scope: !223)
