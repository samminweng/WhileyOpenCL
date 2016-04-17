; ModuleID = 'GCD.c'
source_filename = "GCD.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @gcd(i64 %a, i64 %b) #0 !dbg !6 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !11, metadata !103), !dbg !104
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !12, metadata !103), !dbg !105
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !13, metadata !103), !dbg !106
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !103), !dbg !107
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !103), !dbg !108
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !16, metadata !103), !dbg !109
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !17, metadata !103), !dbg !110
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !18, metadata !103), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !103), !dbg !107
  %cmp = icmp eq i64 %a, 0, !dbg !112
  br i1 %cmp, label %cleanup, label %while.cond.preheader, !dbg !114

while.cond.preheader:                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !103), !dbg !108
  %cmp13234 = icmp sgt i64 %a, -1, !dbg !115
  br i1 %cmp13234, label %blklab4.lr.ph.preheader, label %if.end3, !dbg !119

blklab4.lr.ph.preheader:                          ; preds = %while.cond.preheader
  %cmp447 = icmp eq i64 %b, 0, !dbg !120
  br i1 %cmp447, label %cleanup, label %blklab4.preheader.preheader, !dbg !122

blklab4.preheader.preheader:                      ; preds = %blklab4.lr.ph.preheader
  br label %blklab4.preheader, !dbg !109

blklab4.preheader:                                ; preds = %blklab4.preheader.preheader, %blklab5
  %b.addr.0.ph3549 = phi i64 [ %sub10, %blklab5 ], [ %b, %blklab4.preheader.preheader ]
  %a.addr.0.ph3648 = phi i64 [ %a.addr.033.lcssa, %blklab5 ], [ %a, %blklab4.preheader.preheader ]
  br label %blklab4, !dbg !109

if.end3.loopexit:                                 ; preds = %if.end9
  br label %if.end3, !dbg !123

if.end3:                                          ; preds = %if.end3.loopexit, %while.cond.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !123, !tbaa !124
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #7, !dbg !128
  tail call void @exit(i32 -1) #8, !dbg !129
  unreachable, !dbg !129

blklab4:                                          ; preds = %blklab4.preheader, %if.end9
  %a.addr.033 = phi i64 [ %sub, %if.end9 ], [ %a.addr.0.ph3648, %blklab4.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !16, metadata !103), !dbg !109
  %cmp7 = icmp sgt i64 %a.addr.033, %b.addr.0.ph3549, !dbg !130
  br i1 %cmp7, label %if.end9, label %blklab5, !dbg !132

if.end9:                                          ; preds = %blklab4
  %sub = sub nsw i64 %a.addr.033, %b.addr.0.ph3549, !dbg !133
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !17, metadata !103), !dbg !110
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !11, metadata !103), !dbg !104
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !103), !dbg !108
  %cmp1 = icmp sgt i64 %sub, -1, !dbg !115
  br i1 %cmp1, label %blklab4, label %if.end3.loopexit, !dbg !119

blklab5:                                          ; preds = %blklab4
  %a.addr.033.lcssa = phi i64 [ %a.addr.033, %blklab4 ]
  %sub10 = sub nsw i64 %b.addr.0.ph3549, %a.addr.033.lcssa, !dbg !134
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !18, metadata !103), !dbg !111
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !12, metadata !103), !dbg !105
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !103), !dbg !108
  %cmp4 = icmp eq i64 %sub10, 0, !dbg !120
  br i1 %cmp4, label %cleanup.loopexit, label %blklab4.preheader, !dbg !122

cleanup.loopexit:                                 ; preds = %blklab5
  %a.addr.033.lcssa.lcssa = phi i64 [ %a.addr.033.lcssa, %blklab5 ]
  br label %cleanup, !dbg !135

cleanup:                                          ; preds = %cleanup.loopexit, %blklab4.lr.ph.preheader, %entry
  %retval.0 = phi i64 [ %b, %entry ], [ %a, %blklab4.lr.ph.preheader ], [ %a.addr.033.lcssa.lcssa, %cleanup.loopexit ]
  ret i64 %retval.0, !dbg !135
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i64 @gcd_cached(i64 %a, i64 %b, i64 %n, i64* nocapture %gcds, i64 %gcds_size, i1 zeroext %gcds_has_ownership) #0 !dbg !19 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !25, metadata !103), !dbg !136
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !26, metadata !103), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !27, metadata !103), !dbg !138
  tail call void @llvm.dbg.value(metadata i64* %gcds, i64 0, metadata !28, metadata !103), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 %gcds_size, i64 0, metadata !29, metadata !103), !dbg !139
  tail call void @llvm.dbg.value(metadata i1 %gcds_has_ownership, i64 0, metadata !30, metadata !140), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !103), !dbg !142
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !103), !dbg !143
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !103), !dbg !144
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !103), !dbg !145
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !103), !dbg !146
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !103), !dbg !147
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !103), !dbg !148
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !103), !dbg !149
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !103), !dbg !143
  %cmp = icmp eq i64 %a, 0, !dbg !150
  br i1 %cmp, label %if.end, label %blklab7, !dbg !152

if.end:                                           ; preds = %entry
  br i1 %gcds_has_ownership, label %if.then1, label %cleanup, !dbg !153

if.then1:                                         ; preds = %if.end
  %0 = bitcast i64* %gcds to i8*, !dbg !154
  tail call void @free(i8* %0) #6, !dbg !154
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !30, metadata !103), !dbg !141
  br label %cleanup, !dbg !154

blklab7:                                          ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !103), !dbg !144
  %cmp3 = icmp eq i64 %b, 0, !dbg !158
  br i1 %cmp3, label %if.end5, label %blklab9, !dbg !160

if.end5:                                          ; preds = %blklab7
  br i1 %gcds_has_ownership, label %if.then7, label %cleanup, !dbg !161

if.then7:                                         ; preds = %if.end5
  %1 = bitcast i64* %gcds to i8*, !dbg !162
  tail call void @free(i8* %1) #6, !dbg !162
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !30, metadata !103), !dbg !141
  br label %cleanup, !dbg !162

blklab9:                                          ; preds = %blklab7
  %cmp9 = icmp sgt i64 %a, %b, !dbg !166
  %a.op = sub i64 0, %a
  %sub12.neg = select i1 %cmp9, i64 0, i64 %a.op
  %b.addr.0 = add i64 %sub12.neg, %b, !dbg !168
  %sub = select i1 %cmp9, i64 %b, i64 0, !dbg !168
  %a.addr.0 = sub nsw i64 %a, %sub, !dbg !168
  %mul = mul nsw i64 %a.addr.0, %n, !dbg !169
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !36, metadata !103), !dbg !147
  %add = add nsw i64 %b.addr.0, %mul, !dbg !170
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !37, metadata !103), !dbg !148
  %arrayidx = getelementptr inbounds i64, i64* %gcds, i64 %add, !dbg !171
  %2 = load i64, i64* %arrayidx, align 8, !dbg !171, !tbaa !172
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !38, metadata !103), !dbg !149
  br i1 %gcds_has_ownership, label %if.then14, label %cleanup, !dbg !174

if.then14:                                        ; preds = %blklab9
  %3 = bitcast i64* %gcds to i8*, !dbg !175
  tail call void @free(i8* %3) #6, !dbg !175
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !30, metadata !103), !dbg !141
  br label %cleanup, !dbg !175

cleanup:                                          ; preds = %blklab9, %if.then14, %if.end5, %if.then7, %if.end, %if.then1
  %retval.0 = phi i64 [ %b, %if.then1 ], [ %b, %if.end ], [ %a, %if.then7 ], [ %a, %if.end5 ], [ %2, %if.then14 ], [ %2, %blklab9 ]
  ret i64 %retval.0, !dbg !179
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #3 !dbg !39 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !47, metadata !103), !dbg !181
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !48, metadata !103), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !103), !dbg !183
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !51, metadata !103), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !103), !dbg !184
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !53, metadata !103), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !103), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !103), !dbg !187
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !103), !dbg !188
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !58, metadata !103), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !60, metadata !103), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !103), !dbg !189
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !62, metadata !103), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !103), !dbg !191
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !64, metadata !103), !dbg !192
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !65, metadata !103), !dbg !192
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !66, metadata !103), !dbg !193
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !68, metadata !103), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !103), !dbg !194
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !70, metadata !103), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !103), !dbg !196
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !103), !dbg !197
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !74, metadata !103), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !75, metadata !103), !dbg !198
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !76, metadata !103), !dbg !199
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !103), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !103), !dbg !201
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !103), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !103), !dbg !203
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !103), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !82, metadata !103), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !103), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !84, metadata !103), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !103), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !103), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !103), !dbg !210
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !103), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !103), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !103), !dbg !213
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !92, metadata !103), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !93, metadata !103), !dbg !214
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !94, metadata !103), !dbg !215
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !97, metadata !103), !dbg !216
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !103), !dbg !216
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !99, metadata !103), !dbg !217
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6, !dbg !218
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !58, metadata !103), !dbg !189
  %sub = add nsw i32 %argc, -1, !dbg !218
  %conv = sext i32 %sub to i64, !dbg !218
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !60, metadata !103), !dbg !189
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !62, metadata !103), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !103), !dbg !191
  %0 = load i64*, i64** %call, align 8, !dbg !219, !tbaa !124
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !64, metadata !103), !dbg !192
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6, !dbg !220
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !57, metadata !103), !dbg !221
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !49, metadata !103), !dbg !222
  %cmp = icmp eq i64* %call1, null, !dbg !223
  br i1 %cmp, label %if.end105.critedge, label %if.end, !dbg !225

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !226, !tbaa !172
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !50, metadata !103), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !69, metadata !103), !dbg !194
  %call5 = tail call noalias i8* @malloc(i64 32) #6, !dbg !227
  %2 = bitcast i8* %call5 to i64*, !dbg !227
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !68, metadata !103), !dbg !194
  %3 = bitcast i8* %call5 to <2 x i64>*, !dbg !228
  store <2 x i64> <i64 78, i64 32>, <2 x i64>* %3, align 8, !dbg !228, !tbaa !172
  %arrayidx8 = getelementptr inbounds i8, i8* %call5, i64 16, !dbg !229
  %4 = bitcast i8* %arrayidx8 to <2 x i64>*, !dbg !230
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %4, align 8, !dbg !230, !tbaa !172
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !70, metadata !103), !dbg !195
  tail call void @printf_s(i64* %2, i64 4) #6, !dbg !231
  %call10 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %1), !dbg !232
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !103), !dbg !196
  %mul = mul nsw i64 %1, %1, !dbg !233
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !73, metadata !103), !dbg !197
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !75, metadata !103), !dbg !198
  %conv15 = trunc i64 %mul to i32, !dbg !234
  %call16 = tail call i64* @gen1DArray(i32 0, i32 %conv15) #6, !dbg !234
  tail call void @llvm.dbg.value(metadata i64* %call16, i64 0, metadata !74, metadata !103), !dbg !198
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !76, metadata !103), !dbg !199
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !52, metadata !103), !dbg !184
  tail call void @llvm.dbg.value(metadata i64* %call16, i64 0, metadata !51, metadata !103), !dbg !184
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !53, metadata !103), !dbg !185
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !76, metadata !103), !dbg !199
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !103), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !103), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !103), !dbg !201
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !103), !dbg !187
  %cmp20189 = icmp sgt i64 %1, 0, !dbg !235
  br i1 %cmp20189, label %while.cond24.preheader.us.preheader, label %if.then86, !dbg !238

while.cond24.preheader.us.preheader:              ; preds = %if.end
  %5 = add i64 %1, -4, !dbg !239
  %6 = lshr i64 %5, 2, !dbg !239
  %min.iters.check = icmp ult i64 %1, 4, !dbg !185
  %n.vec = and i64 %1, -4, !dbg !185
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !185
  %7 = and i64 %6, 1, !dbg !185
  %lcmp.mod = icmp eq i64 %7, 0, !dbg !185
  %8 = icmp eq i64 %6, 0, !dbg !185
  %cmp.n = icmp eq i64 %1, %n.vec
  br label %while.cond24.preheader.us, !dbg !239

while.cond24.preheader.us:                        ; preds = %while.cond24.preheader.us.preheader, %blklab16.loopexit.us
  %sum.0192.us = phi i64 [ %add36.lcssa.us, %blklab16.loopexit.us ], [ 0, %while.cond24.preheader.us.preheader ]
  %i.0190.us = phi i64 [ %add38.us, %blklab16.loopexit.us ], [ 0, %while.cond24.preheader.us.preheader ]
  %cmp.i.us = icmp eq i64 %i.0190.us, 0, !dbg !239
  %mul31.us = mul nsw i64 %i.0190.us, %1, !dbg !242
  %a.op.i.us = sub i64 0, %i.0190.us, !dbg !243
  br i1 %cmp.i.us, label %if.end29.us.us.preheader, label %if.end29.us196.preheader, !dbg !244

if.end29.us196.preheader:                         ; preds = %while.cond24.preheader.us
  br label %if.end29.us196, !dbg !185

if.end29.us.us.preheader:                         ; preds = %while.cond24.preheader.us
  br i1 %min.iters.check, label %if.end29.us.us.preheader230, label %min.iters.checked, !dbg !185

if.end29.us.us.preheader230:                      ; preds = %middle.block, %min.iters.checked, %if.end29.us.us.preheader
  %sum.1188.us.us.ph = phi i64 [ %sum.0192.us, %min.iters.checked ], [ %sum.0192.us, %if.end29.us.us.preheader ], [ %30, %middle.block ]
  %j.0187.us.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end29.us.us.preheader ], [ %n.vec, %middle.block ]
  br label %if.end29.us.us, !dbg !185

min.iters.checked:                                ; preds = %if.end29.us.us.preheader
  br i1 %cmp.zero, label %if.end29.us.us.preheader230, label %vector.ph, !dbg !185

vector.ph:                                        ; preds = %min.iters.checked
  %9 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %sum.0192.us, i32 0, !dbg !185
  br i1 %lcmp.mod, label %vector.body.prol, label %vector.ph.split, !dbg !185

vector.body.prol:                                 ; preds = %vector.ph
  %10 = getelementptr inbounds i64, i64* %call16, i64 %mul31.us, !dbg !245
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !246
  store <2 x i64> <i64 0, i64 1>, <2 x i64>* %11, align 8, !dbg !246, !tbaa !172
  %12 = getelementptr i64, i64* %10, i64 2, !dbg !246
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !246
  store <2 x i64> <i64 2, i64 3>, <2 x i64>* %13, align 8, !dbg !246, !tbaa !172
  %14 = add nsw <2 x i64> %9, <i64 0, i64 1>, !dbg !247
  br label %vector.ph.split, !dbg !185

vector.ph.split:                                  ; preds = %vector.body.prol, %vector.ph
  %.lcssa.unr = phi <2 x i64> [ undef, %vector.ph ], [ %14, %vector.body.prol ]
  %index.unr = phi i64 [ 0, %vector.ph ], [ 4, %vector.body.prol ]
  %vec.phi.unr = phi <2 x i64> [ %9, %vector.ph ], [ %14, %vector.body.prol ]
  %vec.phi223.unr = phi <2 x i64> [ zeroinitializer, %vector.ph ], [ <i64 2, i64 3>, %vector.body.prol ]
  br i1 %8, label %middle.block, label %vector.ph.split.split, !dbg !185

vector.ph.split.split:                            ; preds = %vector.ph.split
  br label %vector.body, !dbg !185

vector.body:                                      ; preds = %vector.body, %vector.ph.split.split
  %index = phi i64 [ %index.unr, %vector.ph.split.split ], [ %index.next.1, %vector.body ], !dbg !248
  %vec.phi = phi <2 x i64> [ %vec.phi.unr, %vector.ph.split.split ], [ %27, %vector.body ]
  %vec.phi223 = phi <2 x i64> [ %vec.phi223.unr, %vector.ph.split.split ], [ %28, %vector.body ]
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction = add <2 x i64> %broadcast.splat, <i64 0, i64 1>
  %induction224 = add <2 x i64> %broadcast.splat, <i64 2, i64 3>
  %15 = add nsw i64 %index, %mul31.us, !dbg !245
  %16 = getelementptr inbounds i64, i64* %call16, i64 %15, !dbg !245
  %17 = bitcast i64* %16 to <2 x i64>*, !dbg !246
  store <2 x i64> %induction, <2 x i64>* %17, align 8, !dbg !246, !tbaa !172
  %18 = getelementptr i64, i64* %16, i64 2, !dbg !246
  %19 = bitcast i64* %18 to <2 x i64>*, !dbg !246
  store <2 x i64> %induction224, <2 x i64>* %19, align 8, !dbg !246, !tbaa !172
  %20 = add nsw <2 x i64> %induction, %vec.phi, !dbg !247
  %21 = add nsw <2 x i64> %induction224, %vec.phi223, !dbg !247
  %index.next = add i64 %index, 4, !dbg !185
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction.1 = add <2 x i64> %broadcast.splat.1, <i64 0, i64 1>
  %induction224.1 = add <2 x i64> %broadcast.splat.1, <i64 2, i64 3>
  %22 = add nsw i64 %index.next, %mul31.us, !dbg !245
  %23 = getelementptr inbounds i64, i64* %call16, i64 %22, !dbg !245
  %24 = bitcast i64* %23 to <2 x i64>*, !dbg !246
  store <2 x i64> %induction.1, <2 x i64>* %24, align 8, !dbg !246, !tbaa !172
  %25 = getelementptr i64, i64* %23, i64 2, !dbg !246
  %26 = bitcast i64* %25 to <2 x i64>*, !dbg !246
  store <2 x i64> %induction224.1, <2 x i64>* %26, align 8, !dbg !246, !tbaa !172
  %27 = add nsw <2 x i64> %induction.1, %20, !dbg !247
  %28 = add nsw <2 x i64> %induction224.1, %21, !dbg !247
  %index.next.1 = add i64 %index, 8, !dbg !185
  %29 = icmp eq i64 %index.next.1, %n.vec, !dbg !185
  br i1 %29, label %middle.block.unr-lcssa, label %vector.body, !dbg !185, !llvm.loop !249

middle.block.unr-lcssa:                           ; preds = %vector.body
  %.lcssa234 = phi <2 x i64> [ %28, %vector.body ]
  %.lcssa233 = phi <2 x i64> [ %27, %vector.body ]
  br label %middle.block, !dbg !247

middle.block:                                     ; preds = %vector.ph.split, %middle.block.unr-lcssa
  %.lcssa232 = phi <2 x i64> [ <i64 2, i64 3>, %vector.ph.split ], [ %.lcssa234, %middle.block.unr-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.unr, %vector.ph.split ], [ %.lcssa233, %middle.block.unr-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa232, %.lcssa, !dbg !247
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>, !dbg !247
  %bin.rdx229 = add <2 x i64> %bin.rdx, %rdx.shuf, !dbg !247
  %30 = extractelement <2 x i64> %bin.rdx229, i32 0, !dbg !247
  br i1 %cmp.n, label %blklab16.loopexit.us, label %if.end29.us.us.preheader230, !dbg !185

if.end29.us196:                                   ; preds = %if.end29.us196.preheader, %gcd_cached.exit.us210
  %sum.1188.us197 = phi i64 [ %add36.us214, %gcd_cached.exit.us210 ], [ %sum.0192.us, %if.end29.us196.preheader ]
  %j.0187.us198 = phi i64 [ %add37.us215, %gcd_cached.exit.us210 ], [ 0, %if.end29.us196.preheader ]
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !53, metadata !103), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 %i.0190.us, i64 0, metadata !25, metadata !103), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 %j.0187.us198, i64 0, metadata !26, metadata !103), !dbg !253
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !27, metadata !103), !dbg !254
  tail call void @llvm.dbg.value(metadata i64* %call16, i64 0, metadata !28, metadata !103), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 undef, i64 0, metadata !29, metadata !103), !dbg !255
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !30, metadata !140), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !103), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !103), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !103), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !103), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !103), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !103), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !103), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !103), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !103), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !103), !dbg !259
  %cmp3.i.us200 = icmp eq i64 %j.0187.us198, 0, !dbg !265
  br i1 %cmp3.i.us200, label %gcd_cached.exit.us210, label %blklab9.i.us201, !dbg !266

blklab9.i.us201:                                  ; preds = %if.end29.us196
  %cmp9.i.us202 = icmp sgt i64 %i.0190.us, %j.0187.us198, !dbg !267
  %sub12.neg.i.us203 = select i1 %cmp9.i.us202, i64 0, i64 %a.op.i.us, !dbg !243
  %b.addr.0.i.us204 = add i64 %sub12.neg.i.us203, %j.0187.us198, !dbg !268
  %sub.i.us205 = select i1 %cmp9.i.us202, i64 %j.0187.us198, i64 0, !dbg !268
  %a.addr.0.i.us206 = sub nsw i64 %i.0190.us, %sub.i.us205, !dbg !268
  %mul.i.us207 = mul nsw i64 %a.addr.0.i.us206, %1, !dbg !269
  tail call void @llvm.dbg.value(metadata i64 %mul.i.us207, i64 0, metadata !36, metadata !103), !dbg !262
  %add.i.us208 = add nsw i64 %b.addr.0.i.us204, %mul.i.us207, !dbg !270
  tail call void @llvm.dbg.value(metadata i64 %add.i.us208, i64 0, metadata !37, metadata !103), !dbg !263
  %arrayidx.i.us209 = getelementptr inbounds i64, i64* %call16, i64 %add.i.us208, !dbg !271
  %31 = load i64, i64* %arrayidx.i.us209, align 8, !dbg !271, !tbaa !172
  tail call void @llvm.dbg.value(metadata i64 %31, i64 0, metadata !38, metadata !103), !dbg !264
  br label %gcd_cached.exit.us210, !dbg !243

gcd_cached.exit.us210:                            ; preds = %blklab9.i.us201, %if.end29.us196
  %retval.0.i.us211 = phi i64 [ %31, %blklab9.i.us201 ], [ %i.0190.us, %if.end29.us196 ], !dbg !243
  tail call void @llvm.dbg.value(metadata i64 %retval.0.i.us211, i64 0, metadata !80, metadata !103), !dbg !203
  tail call void @llvm.dbg.value(metadata i64 %mul31.us, i64 0, metadata !81, metadata !103), !dbg !204
  %add.us212 = add nsw i64 %j.0187.us198, %mul31.us, !dbg !272
  tail call void @llvm.dbg.value(metadata i64 %add.us212, i64 0, metadata !82, metadata !103), !dbg !205
  %arrayidx32.us213 = getelementptr inbounds i64, i64* %call16, i64 %add.us212, !dbg !245
  store i64 %retval.0.i.us211, i64* %arrayidx32.us213, align 8, !dbg !246, !tbaa !172
  tail call void @llvm.dbg.value(metadata i64 %mul31.us, i64 0, metadata !83, metadata !103), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 %add.us212, i64 0, metadata !84, metadata !103), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 %retval.0.i.us211, i64 0, metadata !85, metadata !103), !dbg !208
  %add36.us214 = add nsw i64 %retval.0.i.us211, %sum.1188.us197, !dbg !247
  tail call void @llvm.dbg.value(metadata i64 %add36.us214, i64 0, metadata !86, metadata !103), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 %add36.us214, i64 0, metadata !54, metadata !103), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !87, metadata !103), !dbg !210
  %add37.us215 = add nuw nsw i64 %j.0187.us198, 1, !dbg !248
  tail call void @llvm.dbg.value(metadata i64 %add37.us215, i64 0, metadata !88, metadata !103), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 %add37.us215, i64 0, metadata !56, metadata !103), !dbg !188
  %exitcond.us216 = icmp eq i64 %add37.us215, %1, !dbg !273
  br i1 %exitcond.us216, label %blklab16.loopexit.us.loopexit231, label %if.end29.us196, !dbg !273

blklab16.loopexit.us.loopexit:                    ; preds = %if.end29.us.us
  %add36.us.us.lcssa = phi i64 [ %add36.us.us, %if.end29.us.us ]
  br label %blklab16.loopexit.us, !dbg !212

blklab16.loopexit.us.loopexit231:                 ; preds = %gcd_cached.exit.us210
  %add36.us214.lcssa = phi i64 [ %add36.us214, %gcd_cached.exit.us210 ]
  br label %blklab16.loopexit.us, !dbg !212

blklab16.loopexit.us:                             ; preds = %blklab16.loopexit.us.loopexit231, %blklab16.loopexit.us.loopexit, %middle.block
  %add36.lcssa.us = phi i64 [ %30, %middle.block ], [ %add36.us.us.lcssa, %blklab16.loopexit.us.loopexit ], [ %add36.us214.lcssa, %blklab16.loopexit.us.loopexit231 ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !89, metadata !103), !dbg !212
  %add38.us = add nuw nsw i64 %i.0190.us, 1, !dbg !274
  tail call void @llvm.dbg.value(metadata i64 %add38.us, i64 0, metadata !90, metadata !103), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 %add38.us, i64 0, metadata !55, metadata !103), !dbg !187
  %exitcond194.us = icmp eq i64 %add38.us, %1, !dbg !238
  br i1 %exitcond194.us, label %if.then86.loopexit, label %while.cond24.preheader.us, !dbg !238

if.end29.us.us:                                   ; preds = %if.end29.us.us.preheader230, %if.end29.us.us
  %sum.1188.us.us = phi i64 [ %add36.us.us, %if.end29.us.us ], [ %sum.1188.us.us.ph, %if.end29.us.us.preheader230 ]
  %j.0187.us.us = phi i64 [ %add37.us.us, %if.end29.us.us ], [ %j.0187.us.us.ph, %if.end29.us.us.preheader230 ]
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !53, metadata !103), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 %i.0190.us, i64 0, metadata !25, metadata !103), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 %j.0187.us.us, i64 0, metadata !26, metadata !103), !dbg !253
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !27, metadata !103), !dbg !254
  tail call void @llvm.dbg.value(metadata i64* %call16, i64 0, metadata !28, metadata !103), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 undef, i64 0, metadata !29, metadata !103), !dbg !255
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !30, metadata !140), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !103), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !103), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !103), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !103), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !103), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !103), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !103), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !103), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !103), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 %j.0187.us.us, i64 0, metadata !80, metadata !103), !dbg !203
  tail call void @llvm.dbg.value(metadata i64 %mul31.us, i64 0, metadata !81, metadata !103), !dbg !204
  %add.us.us = add nsw i64 %j.0187.us.us, %mul31.us, !dbg !272
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !82, metadata !103), !dbg !205
  %arrayidx32.us.us = getelementptr inbounds i64, i64* %call16, i64 %add.us.us, !dbg !245
  store i64 %j.0187.us.us, i64* %arrayidx32.us.us, align 8, !dbg !246, !tbaa !172
  tail call void @llvm.dbg.value(metadata i64 %mul31.us, i64 0, metadata !83, metadata !103), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !84, metadata !103), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 %j.0187.us.us, i64 0, metadata !85, metadata !103), !dbg !208
  %add36.us.us = add nsw i64 %j.0187.us.us, %sum.1188.us.us, !dbg !247
  tail call void @llvm.dbg.value(metadata i64 %add36.us.us, i64 0, metadata !86, metadata !103), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 %add36.us.us, i64 0, metadata !54, metadata !103), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !87, metadata !103), !dbg !210
  %add37.us.us = add nuw nsw i64 %j.0187.us.us, 1, !dbg !248
  tail call void @llvm.dbg.value(metadata i64 %add37.us.us, i64 0, metadata !88, metadata !103), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 %add37.us.us, i64 0, metadata !56, metadata !103), !dbg !188
  %exitcond.us.us = icmp eq i64 %add37.us.us, %1, !dbg !273
  br i1 %exitcond.us.us, label %blklab16.loopexit.us.loopexit, label %if.end29.us.us, !dbg !273, !llvm.loop !275

if.then86.loopexit:                               ; preds = %blklab16.loopexit.us
  %add36.lcssa.us.lcssa = phi i64 [ %add36.lcssa.us, %blklab16.loopexit.us ]
  br label %if.then86, !dbg !214

if.then86:                                        ; preds = %if.then86.loopexit, %if.end
  %sum.0.lcssa = phi i64 [ 0, %if.end ], [ %add36.lcssa.us.lcssa, %if.then86.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 5, i64 0, metadata !93, metadata !103), !dbg !214
  %call42 = tail call noalias i8* @malloc(i64 40) #6, !dbg !277
  %32 = bitcast i8* %call42 to i64*, !dbg !277
  tail call void @llvm.dbg.value(metadata i64* %32, i64 0, metadata !92, metadata !103), !dbg !214
  %33 = bitcast i8* %call42 to <2 x i64>*, !dbg !278
  store <2 x i64> <i64 83, i64 117>, <2 x i64>* %33, align 8, !dbg !278, !tbaa !172
  %arrayidx45 = getelementptr inbounds i8, i8* %call42, i64 16, !dbg !279
  %34 = bitcast i8* %arrayidx45 to <2 x i64>*, !dbg !280
  store <2 x i64> <i64 109, i64 58>, <2 x i64>* %34, align 8, !dbg !280, !tbaa !172
  %arrayidx47 = getelementptr inbounds i8, i8* %call42, i64 32, !dbg !281
  %35 = bitcast i8* %arrayidx47 to i64*, !dbg !281
  store i64 32, i64* %35, align 8, !dbg !282, !tbaa !172
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !94, metadata !103), !dbg !215
  tail call void @printf_s(i64* %32, i64 5) #6, !dbg !283
  %call48 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 32, i64 0, metadata !98, metadata !103), !dbg !216
  %call52 = tail call noalias i8* @malloc(i64 256) #6, !dbg !285
  %36 = bitcast i8* %call52 to i64*, !dbg !285
  tail call void @llvm.dbg.value(metadata i64* %36, i64 0, metadata !97, metadata !103), !dbg !216
  %37 = bitcast i8* %call52 to <2 x i64>*, !dbg !286
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %37, align 8, !dbg !286, !tbaa !172
  %arrayidx55 = getelementptr inbounds i8, i8* %call52, i64 16, !dbg !287
  %38 = bitcast i8* %arrayidx55 to <2 x i64>*, !dbg !288
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %38, align 8, !dbg !288, !tbaa !172
  %arrayidx57 = getelementptr inbounds i8, i8* %call52, i64 32, !dbg !289
  %39 = bitcast i8* %arrayidx57 to <2 x i64>*, !dbg !290
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %39, align 8, !dbg !290, !tbaa !172
  %arrayidx59 = getelementptr inbounds i8, i8* %call52, i64 48, !dbg !291
  %40 = bitcast i8* %arrayidx59 to <2 x i64>*, !dbg !292
  store <2 x i64> <i64 97, i64 99>, <2 x i64>* %40, align 8, !dbg !292, !tbaa !172
  %arrayidx61 = getelementptr inbounds i8, i8* %call52, i64 64, !dbg !293
  %41 = bitcast i8* %arrayidx61 to <2 x i64>*, !dbg !294
  store <2 x i64> <i64 104, i64 101>, <2 x i64>* %41, align 8, !dbg !294, !tbaa !172
  %arrayidx63 = getelementptr inbounds i8, i8* %call52, i64 80, !dbg !295
  %42 = bitcast i8* %arrayidx63 to <2 x i64>*, !dbg !296
  store <2 x i64> <i64 100, i64 32>, <2 x i64>* %42, align 8, !dbg !296, !tbaa !172
  %arrayidx65 = getelementptr inbounds i8, i8* %call52, i64 96, !dbg !297
  %43 = bitcast i8* %arrayidx65 to <2 x i64>*, !dbg !298
  store <2 x i64> <i64 69, i64 117>, <2 x i64>* %43, align 8, !dbg !298, !tbaa !172
  %arrayidx67 = getelementptr inbounds i8, i8* %call52, i64 112, !dbg !299
  %44 = bitcast i8* %arrayidx67 to <2 x i64>*, !dbg !300
  store <2 x i64> <i64 99, i64 108>, <2 x i64>* %44, align 8, !dbg !300, !tbaa !172
  %arrayidx69 = getelementptr inbounds i8, i8* %call52, i64 128, !dbg !301
  %45 = bitcast i8* %arrayidx69 to <2 x i64>*, !dbg !302
  store <2 x i64> <i64 105, i64 100>, <2 x i64>* %45, align 8, !dbg !302, !tbaa !172
  %arrayidx71 = getelementptr inbounds i8, i8* %call52, i64 144, !dbg !303
  %46 = bitcast i8* %arrayidx71 to <2 x i64>*, !dbg !304
  store <2 x i64> <i64 32, i64 71>, <2 x i64>* %46, align 8, !dbg !304, !tbaa !172
  %arrayidx73 = getelementptr inbounds i8, i8* %call52, i64 160, !dbg !305
  %47 = bitcast i8* %arrayidx73 to <2 x i64>*, !dbg !306
  store <2 x i64> <i64 67, i64 68>, <2 x i64>* %47, align 8, !dbg !306, !tbaa !172
  %arrayidx75 = getelementptr inbounds i8, i8* %call52, i64 176, !dbg !307
  %48 = bitcast i8* %arrayidx75 to <2 x i64>*, !dbg !308
  store <2 x i64> <i64 32, i64 116>, <2 x i64>* %48, align 8, !dbg !308, !tbaa !172
  %arrayidx77 = getelementptr inbounds i8, i8* %call52, i64 192, !dbg !309
  %49 = bitcast i8* %arrayidx77 to <2 x i64>*, !dbg !310
  store <2 x i64> <i64 101, i64 115>, <2 x i64>* %49, align 8, !dbg !310, !tbaa !172
  %arrayidx79 = getelementptr inbounds i8, i8* %call52, i64 208, !dbg !311
  %50 = bitcast i8* %arrayidx79 to <2 x i64>*, !dbg !312
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %50, align 8, !dbg !312, !tbaa !172
  %arrayidx81 = getelementptr inbounds i8, i8* %call52, i64 224, !dbg !313
  %51 = bitcast i8* %arrayidx81 to <2 x i64>*, !dbg !314
  store <2 x i64> <i64 99, i64 97>, <2 x i64>* %51, align 8, !dbg !314, !tbaa !172
  %arrayidx83 = getelementptr inbounds i8, i8* %call52, i64 240, !dbg !315
  %52 = bitcast i8* %arrayidx83 to <2 x i64>*, !dbg !316
  store <2 x i64> <i64 115, i64 101>, <2 x i64>* %52, align 8, !dbg !316, !tbaa !172
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !99, metadata !103), !dbg !217
  tail call void @println_s(i64* %36, i64 32) #6, !dbg !317
  %phitmp = bitcast i64* %call16 to i8*, !dbg !317
  tail call void @free(i8* %phitmp) #6, !dbg !318
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !53, metadata !103), !dbg !185
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !322
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !62, metadata !103), !dbg !190
  tail call void @free(i8* %call5) #6, !dbg !326
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !70, metadata !103), !dbg !195
  tail call void @free(i8* %call42) #6, !dbg !330
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !94, metadata !103), !dbg !215
  tail call void @free(i8* %call52) #6, !dbg !334
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !99, metadata !103), !dbg !217
  br label %if.end105, !dbg !334

if.end105.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !322
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !62, metadata !103), !dbg !190
  br label %if.end105

if.end105:                                        ; preds = %if.end105.critedge, %if.then86
  tail call void @exit(i32 0) #8, !dbg !338
  unreachable, !dbg !338
}

declare i64** @convertArgsToIntArray(i32, i8**) #4

declare i64* @parseStringToInt(i64*) #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @printf_s(i64*, i64) #4

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

declare i64* @gen1DArray(i32, i32) #4

declare void @println_s(i64*, i64) #4

declare void @free2DArray(i64**, i64) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!100, !101}
!llvm.ident = !{!102}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "GCD.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate1")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !19, !39}
!6 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 2, type: !7, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, variables: !10)
!7 = !DISubroutineType(types: !8)
!8 = !{!9, !9, !9}
!9 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!10 = !{!11, !12, !13, !14, !15, !16, !17, !18}
!11 = !DILocalVariable(name: "a", arg: 1, scope: !6, file: !1, line: 2, type: !9)
!12 = !DILocalVariable(name: "b", arg: 2, scope: !6, file: !1, line: 2, type: !9)
!13 = !DILocalVariable(name: "_2", scope: !6, file: !1, line: 3, type: !9)
!14 = !DILocalVariable(name: "_3", scope: !6, file: !1, line: 4, type: !9)
!15 = !DILocalVariable(name: "_4", scope: !6, file: !1, line: 5, type: !9)
!16 = !DILocalVariable(name: "_5", scope: !6, file: !1, line: 6, type: !9)
!17 = !DILocalVariable(name: "_6", scope: !6, file: !1, line: 7, type: !9)
!18 = !DILocalVariable(name: "_7", scope: !6, file: !1, line: 8, type: !9)
!19 = distinct !DISubprogram(name: "gcd_cached", scope: !1, file: !1, line: 62, type: !20, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: true, variables: !24)
!20 = !DISubroutineType(types: !21)
!21 = !{!9, !9, !9, !9, !22, !9, !23}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!23 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!24 = !{!25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38}
!25 = !DILocalVariable(name: "a", arg: 1, scope: !19, file: !1, line: 62, type: !9)
!26 = !DILocalVariable(name: "b", arg: 2, scope: !19, file: !1, line: 62, type: !9)
!27 = !DILocalVariable(name: "n", arg: 3, scope: !19, file: !1, line: 62, type: !9)
!28 = !DILocalVariable(name: "gcds", arg: 4, scope: !19, file: !1, line: 62, type: !22)
!29 = !DILocalVariable(name: "gcds_size", arg: 5, scope: !19, file: !1, line: 62, type: !9)
!30 = !DILocalVariable(name: "gcds_has_ownership", arg: 6, scope: !19, file: !1, line: 62, type: !23)
!31 = !DILocalVariable(name: "_4", scope: !19, file: !1, line: 63, type: !9)
!32 = !DILocalVariable(name: "_5", scope: !19, file: !1, line: 64, type: !9)
!33 = !DILocalVariable(name: "_6", scope: !19, file: !1, line: 65, type: !9)
!34 = !DILocalVariable(name: "_7", scope: !19, file: !1, line: 66, type: !9)
!35 = !DILocalVariable(name: "_8", scope: !19, file: !1, line: 67, type: !9)
!36 = !DILocalVariable(name: "_9", scope: !19, file: !1, line: 68, type: !9)
!37 = !DILocalVariable(name: "_10", scope: !19, file: !1, line: 69, type: !9)
!38 = !DILocalVariable(name: "_11", scope: !19, file: !1, line: 70, type: !9)
!39 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 125, type: !40, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: true, variables: !46)
!40 = !DISubroutineType(types: !41)
!41 = !{!42, !42, !43}
!42 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, align: 64)
!45 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!46 = !{!47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99}
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !39, file: !1, line: 125, type: !42)
!48 = !DILocalVariable(name: "args", arg: 2, scope: !39, file: !1, line: 125, type: !43)
!49 = !DILocalVariable(name: "max", scope: !39, file: !1, line: 126, type: !22)
!50 = !DILocalVariable(name: "n", scope: !39, file: !1, line: 127, type: !9)
!51 = !DILocalVariable(name: "gcds", scope: !39, file: !1, line: 128, type: !22)
!52 = !DILocalVariable(name: "gcds_size", scope: !39, file: !1, line: 128, type: !9)
!53 = !DILocalVariable(name: "gcds_has_ownership", scope: !39, file: !1, line: 129, type: !23)
!54 = !DILocalVariable(name: "sum", scope: !39, file: !1, line: 130, type: !9)
!55 = !DILocalVariable(name: "i", scope: !39, file: !1, line: 131, type: !9)
!56 = !DILocalVariable(name: "j", scope: !39, file: !1, line: 132, type: !9)
!57 = !DILocalVariable(name: "_7", scope: !39, file: !1, line: 133, type: !22)
!58 = !DILocalVariable(name: "_8", scope: !39, file: !1, line: 134, type: !59)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!60 = !DILocalVariable(name: "_8_size", scope: !39, file: !1, line: 134, type: !9)
!61 = !DILocalVariable(name: "_8_size_size", scope: !39, file: !1, line: 134, type: !9)
!62 = !DILocalVariable(name: "_8_has_ownership", scope: !39, file: !1, line: 135, type: !23)
!63 = !DILocalVariable(name: "_9", scope: !39, file: !1, line: 136, type: !9)
!64 = !DILocalVariable(name: "_10", scope: !39, file: !1, line: 137, type: !22)
!65 = !DILocalVariable(name: "_10_size", scope: !39, file: !1, line: 137, type: !9)
!66 = !DILocalVariable(name: "_10_has_ownership", scope: !39, file: !1, line: 138, type: !23)
!67 = !DILocalVariable(name: "_11", scope: !39, file: !1, line: 139, type: !4)
!68 = !DILocalVariable(name: "_13", scope: !39, file: !1, line: 140, type: !22)
!69 = !DILocalVariable(name: "_13_size", scope: !39, file: !1, line: 140, type: !9)
!70 = !DILocalVariable(name: "_13_has_ownership", scope: !39, file: !1, line: 141, type: !23)
!71 = !DILocalVariable(name: "_14", scope: !39, file: !1, line: 142, type: !4)
!72 = !DILocalVariable(name: "_16", scope: !39, file: !1, line: 143, type: !9)
!73 = !DILocalVariable(name: "_17", scope: !39, file: !1, line: 144, type: !9)
!74 = !DILocalVariable(name: "_18", scope: !39, file: !1, line: 145, type: !22)
!75 = !DILocalVariable(name: "_18_size", scope: !39, file: !1, line: 145, type: !9)
!76 = !DILocalVariable(name: "_18_has_ownership", scope: !39, file: !1, line: 146, type: !23)
!77 = !DILocalVariable(name: "_19", scope: !39, file: !1, line: 147, type: !9)
!78 = !DILocalVariable(name: "_20", scope: !39, file: !1, line: 148, type: !9)
!79 = !DILocalVariable(name: "_21", scope: !39, file: !1, line: 149, type: !9)
!80 = !DILocalVariable(name: "_22", scope: !39, file: !1, line: 150, type: !9)
!81 = !DILocalVariable(name: "_23", scope: !39, file: !1, line: 151, type: !9)
!82 = !DILocalVariable(name: "_24", scope: !39, file: !1, line: 152, type: !9)
!83 = !DILocalVariable(name: "_25", scope: !39, file: !1, line: 153, type: !9)
!84 = !DILocalVariable(name: "_26", scope: !39, file: !1, line: 154, type: !9)
!85 = !DILocalVariable(name: "_27", scope: !39, file: !1, line: 155, type: !9)
!86 = !DILocalVariable(name: "_28", scope: !39, file: !1, line: 156, type: !9)
!87 = !DILocalVariable(name: "_29", scope: !39, file: !1, line: 157, type: !9)
!88 = !DILocalVariable(name: "_30", scope: !39, file: !1, line: 158, type: !9)
!89 = !DILocalVariable(name: "_31", scope: !39, file: !1, line: 159, type: !9)
!90 = !DILocalVariable(name: "_32", scope: !39, file: !1, line: 160, type: !9)
!91 = !DILocalVariable(name: "_33", scope: !39, file: !1, line: 161, type: !4)
!92 = !DILocalVariable(name: "_35", scope: !39, file: !1, line: 162, type: !22)
!93 = !DILocalVariable(name: "_35_size", scope: !39, file: !1, line: 162, type: !9)
!94 = !DILocalVariable(name: "_35_has_ownership", scope: !39, file: !1, line: 163, type: !23)
!95 = !DILocalVariable(name: "_36", scope: !39, file: !1, line: 164, type: !4)
!96 = !DILocalVariable(name: "_38", scope: !39, file: !1, line: 165, type: !4)
!97 = !DILocalVariable(name: "_40", scope: !39, file: !1, line: 166, type: !22)
!98 = !DILocalVariable(name: "_40_size", scope: !39, file: !1, line: 166, type: !9)
!99 = !DILocalVariable(name: "_40_has_ownership", scope: !39, file: !1, line: 167, type: !23)
!100 = !{i32 2, !"Dwarf Version", i32 4}
!101 = !{i32 2, !"Debug Info Version", i32 3}
!102 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!103 = !DIExpression()
!104 = !DILocation(line: 2, column: 25, scope: !6)
!105 = !DILocation(line: 2, column: 38, scope: !6)
!106 = !DILocation(line: 3, column: 12, scope: !6)
!107 = !DILocation(line: 4, column: 12, scope: !6)
!108 = !DILocation(line: 5, column: 12, scope: !6)
!109 = !DILocation(line: 6, column: 12, scope: !6)
!110 = !DILocation(line: 7, column: 12, scope: !6)
!111 = !DILocation(line: 8, column: 12, scope: !6)
!112 = !DILocation(line: 12, column: 6, scope: !113)
!113 = distinct !DILexicalBlock(scope: !6, file: !1, line: 12, column: 5)
!114 = !DILocation(line: 12, column: 5, scope: !6)
!115 = !DILocation(line: 24, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !117, file: !1, line: 24, column: 7)
!117 = distinct !DILexicalBlock(scope: !118, file: !1, line: 20, column: 3)
!118 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 13)
!119 = !DILocation(line: 24, column: 7, scope: !117)
!120 = !DILocation(line: 35, column: 7, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !1, line: 35, column: 6)
!122 = !DILocation(line: 35, column: 6, scope: !118)
!123 = !DILocation(line: 26, column: 12, scope: !117)
!124 = !{!125, !125, i64 0}
!125 = !{!"any pointer", !126, i64 0}
!126 = !{!"omnipotent char", !127, i64 0}
!127 = !{!"Simple C/C++ TBAA"}
!128 = !DILocation(line: 26, column: 4, scope: !117)
!129 = !DILocation(line: 27, column: 4, scope: !117)
!130 = !DILocation(line: 37, column: 7, scope: !131)
!131 = distinct !DILexicalBlock(scope: !118, file: !1, line: 37, column: 6)
!132 = !DILocation(line: 37, column: 6, scope: !118)
!133 = !DILocation(line: 39, column: 7, scope: !118)
!134 = !DILocation(line: 47, column: 7, scope: !118)
!135 = !DILocation(line: 60, column: 1, scope: !6)
!136 = !DILocation(line: 62, column: 32, scope: !19)
!137 = !DILocation(line: 62, column: 45, scope: !19)
!138 = !DILocation(line: 62, column: 58, scope: !19)
!139 = !DILocation(line: 62, column: 61, scope: !19)
!140 = !DIExpression(DW_OP_bit_piece, 0, 1)
!141 = !DILocation(line: 62, column: 88, scope: !19)
!142 = !DILocation(line: 63, column: 12, scope: !19)
!143 = !DILocation(line: 64, column: 12, scope: !19)
!144 = !DILocation(line: 65, column: 12, scope: !19)
!145 = !DILocation(line: 66, column: 12, scope: !19)
!146 = !DILocation(line: 67, column: 12, scope: !19)
!147 = !DILocation(line: 68, column: 12, scope: !19)
!148 = !DILocation(line: 69, column: 12, scope: !19)
!149 = !DILocation(line: 70, column: 12, scope: !19)
!150 = !DILocation(line: 74, column: 6, scope: !151)
!151 = distinct !DILexicalBlock(scope: !19, file: !1, line: 74, column: 5)
!152 = !DILocation(line: 74, column: 5, scope: !19)
!153 = !DILocation(line: 76, column: 2, scope: !19)
!154 = !DILocation(line: 76, column: 2, scope: !155)
!155 = !DILexicalBlockFile(scope: !156, file: !1, discriminator: 1)
!156 = distinct !DILexicalBlock(scope: !157, file: !1, line: 76, column: 2)
!157 = distinct !DILexicalBlock(scope: !19, file: !1, line: 76, column: 2)
!158 = !DILocation(line: 85, column: 6, scope: !159)
!159 = distinct !DILexicalBlock(scope: !19, file: !1, line: 85, column: 5)
!160 = !DILocation(line: 85, column: 5, scope: !19)
!161 = !DILocation(line: 87, column: 2, scope: !19)
!162 = !DILocation(line: 87, column: 2, scope: !163)
!163 = !DILexicalBlockFile(scope: !164, file: !1, discriminator: 1)
!164 = distinct !DILexicalBlock(scope: !165, file: !1, line: 87, column: 2)
!165 = distinct !DILexicalBlock(scope: !19, file: !1, line: 87, column: 2)
!166 = !DILocation(line: 94, column: 6, scope: !167)
!167 = distinct !DILexicalBlock(scope: !19, file: !1, line: 94, column: 5)
!168 = !DILocation(line: 94, column: 5, scope: !19)
!169 = !DILocation(line: 110, column: 6, scope: !19)
!170 = !DILocation(line: 112, column: 8, scope: !19)
!171 = !DILocation(line: 114, column: 6, scope: !19)
!172 = !{!173, !173, i64 0}
!173 = !{!"long long", !126, i64 0}
!174 = !DILocation(line: 116, column: 2, scope: !19)
!175 = !DILocation(line: 116, column: 2, scope: !176)
!176 = !DILexicalBlockFile(scope: !177, file: !1, discriminator: 1)
!177 = distinct !DILexicalBlock(scope: !178, file: !1, line: 116, column: 2)
!178 = distinct !DILexicalBlock(scope: !19, file: !1, line: 116, column: 2)
!179 = !DILocation(line: 123, column: 1, scope: !180)
!180 = !DILexicalBlockFile(scope: !19, file: !1, discriminator: 2)
!181 = !DILocation(line: 125, column: 14, scope: !39)
!182 = !DILocation(line: 125, column: 27, scope: !39)
!183 = !DILocation(line: 127, column: 12, scope: !39)
!184 = !DILocation(line: 128, column: 2, scope: !39)
!185 = !DILocation(line: 129, column: 2, scope: !39)
!186 = !DILocation(line: 130, column: 12, scope: !39)
!187 = !DILocation(line: 131, column: 12, scope: !39)
!188 = !DILocation(line: 132, column: 12, scope: !39)
!189 = !DILocation(line: 134, column: 2, scope: !39)
!190 = !DILocation(line: 135, column: 2, scope: !39)
!191 = !DILocation(line: 136, column: 12, scope: !39)
!192 = !DILocation(line: 137, column: 2, scope: !39)
!193 = !DILocation(line: 138, column: 2, scope: !39)
!194 = !DILocation(line: 140, column: 2, scope: !39)
!195 = !DILocation(line: 141, column: 2, scope: !39)
!196 = !DILocation(line: 143, column: 12, scope: !39)
!197 = !DILocation(line: 144, column: 12, scope: !39)
!198 = !DILocation(line: 145, column: 2, scope: !39)
!199 = !DILocation(line: 146, column: 2, scope: !39)
!200 = !DILocation(line: 147, column: 12, scope: !39)
!201 = !DILocation(line: 148, column: 12, scope: !39)
!202 = !DILocation(line: 149, column: 12, scope: !39)
!203 = !DILocation(line: 150, column: 12, scope: !39)
!204 = !DILocation(line: 151, column: 12, scope: !39)
!205 = !DILocation(line: 152, column: 12, scope: !39)
!206 = !DILocation(line: 153, column: 12, scope: !39)
!207 = !DILocation(line: 154, column: 12, scope: !39)
!208 = !DILocation(line: 155, column: 12, scope: !39)
!209 = !DILocation(line: 156, column: 12, scope: !39)
!210 = !DILocation(line: 157, column: 12, scope: !39)
!211 = !DILocation(line: 158, column: 12, scope: !39)
!212 = !DILocation(line: 159, column: 12, scope: !39)
!213 = !DILocation(line: 160, column: 12, scope: !39)
!214 = !DILocation(line: 162, column: 2, scope: !39)
!215 = !DILocation(line: 163, column: 2, scope: !39)
!216 = !DILocation(line: 166, column: 2, scope: !39)
!217 = !DILocation(line: 167, column: 2, scope: !39)
!218 = !DILocation(line: 169, column: 2, scope: !39)
!219 = !DILocation(line: 174, column: 6, scope: !39)
!220 = !DILocation(line: 176, column: 2, scope: !39)
!221 = !DILocation(line: 133, column: 13, scope: !39)
!222 = !DILocation(line: 126, column: 13, scope: !39)
!223 = !DILocation(line: 180, column: 9, scope: !224)
!224 = distinct !DILexicalBlock(scope: !39, file: !1, line: 180, column: 5)
!225 = !DILocation(line: 180, column: 5, scope: !39)
!226 = !DILocation(line: 182, column: 6, scope: !39)
!227 = !DILocation(line: 187, column: 2, scope: !39)
!228 = !DILocation(line: 188, column: 9, scope: !39)
!229 = !DILocation(line: 188, column: 28, scope: !39)
!230 = !DILocation(line: 188, column: 35, scope: !39)
!231 = !DILocation(line: 191, column: 2, scope: !39)
!232 = !DILocation(line: 195, column: 2, scope: !39)
!233 = !DILocation(line: 199, column: 7, scope: !39)
!234 = !DILocation(line: 202, column: 2, scope: !39)
!235 = !DILocation(line: 220, column: 7, scope: !236)
!236 = distinct !DILexicalBlock(scope: !237, file: !1, line: 220, column: 6)
!237 = distinct !DILexicalBlock(scope: !39, file: !1, line: 218, column: 13)
!238 = !DILocation(line: 220, column: 6, scope: !237)
!239 = !DILocation(line: 74, column: 6, scope: !151, inlinedAt: !240)
!240 = distinct !DILocation(line: 231, column: 10, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !1, line: 226, column: 14)
!242 = !DILocation(line: 233, column: 9, scope: !241)
!243 = !DILocation(line: 231, column: 10, scope: !241)
!244 = !DILocation(line: 74, column: 5, scope: !19, inlinedAt: !240)
!245 = !DILocation(line: 237, column: 4, scope: !241)
!246 = !DILocation(line: 237, column: 14, scope: !241)
!247 = !DILocation(line: 245, column: 11, scope: !241)
!248 = !DILocation(line: 251, column: 9, scope: !241)
!249 = distinct !{!249, !250, !251}
!250 = !{!"llvm.loop.vectorize.width", i32 1}
!251 = !{!"llvm.loop.interleave.count", i32 1}
!252 = !DILocation(line: 62, column: 32, scope: !19, inlinedAt: !240)
!253 = !DILocation(line: 62, column: 45, scope: !19, inlinedAt: !240)
!254 = !DILocation(line: 62, column: 58, scope: !19, inlinedAt: !240)
!255 = !DILocation(line: 62, column: 61, scope: !19, inlinedAt: !240)
!256 = !DILocation(line: 62, column: 88, scope: !19, inlinedAt: !240)
!257 = !DILocation(line: 63, column: 12, scope: !19, inlinedAt: !240)
!258 = !DILocation(line: 64, column: 12, scope: !19, inlinedAt: !240)
!259 = !DILocation(line: 65, column: 12, scope: !19, inlinedAt: !240)
!260 = !DILocation(line: 66, column: 12, scope: !19, inlinedAt: !240)
!261 = !DILocation(line: 67, column: 12, scope: !19, inlinedAt: !240)
!262 = !DILocation(line: 68, column: 12, scope: !19, inlinedAt: !240)
!263 = !DILocation(line: 69, column: 12, scope: !19, inlinedAt: !240)
!264 = !DILocation(line: 70, column: 12, scope: !19, inlinedAt: !240)
!265 = !DILocation(line: 85, column: 6, scope: !159, inlinedAt: !240)
!266 = !DILocation(line: 85, column: 5, scope: !19, inlinedAt: !240)
!267 = !DILocation(line: 94, column: 6, scope: !167, inlinedAt: !240)
!268 = !DILocation(line: 94, column: 5, scope: !19, inlinedAt: !240)
!269 = !DILocation(line: 110, column: 6, scope: !19, inlinedAt: !240)
!270 = !DILocation(line: 112, column: 8, scope: !19, inlinedAt: !240)
!271 = !DILocation(line: 114, column: 6, scope: !19, inlinedAt: !240)
!272 = !DILocation(line: 235, column: 11, scope: !241)
!273 = !DILocation(line: 228, column: 7, scope: !241)
!274 = !DILocation(line: 262, column: 8, scope: !237)
!275 = distinct !{!275, !276, !250, !251}
!276 = !{!"llvm.loop.unroll.runtime.disable"}
!277 = !DILocation(line: 274, column: 2, scope: !39)
!278 = !DILocation(line: 275, column: 9, scope: !39)
!279 = !DILocation(line: 275, column: 29, scope: !39)
!280 = !DILocation(line: 275, column: 36, scope: !39)
!281 = !DILocation(line: 275, column: 56, scope: !39)
!282 = !DILocation(line: 275, column: 63, scope: !39)
!283 = !DILocation(line: 278, column: 2, scope: !39)
!284 = !DILocation(line: 282, column: 2, scope: !39)
!285 = !DILocation(line: 287, column: 2, scope: !39)
!286 = !DILocation(line: 288, column: 9, scope: !39)
!287 = !DILocation(line: 288, column: 28, scope: !39)
!288 = !DILocation(line: 288, column: 35, scope: !39)
!289 = !DILocation(line: 288, column: 56, scope: !39)
!290 = !DILocation(line: 288, column: 63, scope: !39)
!291 = !DILocation(line: 288, column: 82, scope: !39)
!292 = !DILocation(line: 288, column: 89, scope: !39)
!293 = !DILocation(line: 288, column: 108, scope: !39)
!294 = !DILocation(line: 288, column: 115, scope: !39)
!295 = !DILocation(line: 288, column: 136, scope: !39)
!296 = !DILocation(line: 288, column: 144, scope: !39)
!297 = !DILocation(line: 288, column: 165, scope: !39)
!298 = !DILocation(line: 288, column: 173, scope: !39)
!299 = !DILocation(line: 288, column: 194, scope: !39)
!300 = !DILocation(line: 288, column: 202, scope: !39)
!301 = !DILocation(line: 288, column: 223, scope: !39)
!302 = !DILocation(line: 288, column: 231, scope: !39)
!303 = !DILocation(line: 288, column: 253, scope: !39)
!304 = !DILocation(line: 288, column: 261, scope: !39)
!305 = !DILocation(line: 288, column: 281, scope: !39)
!306 = !DILocation(line: 288, column: 289, scope: !39)
!307 = !DILocation(line: 288, column: 309, scope: !39)
!308 = !DILocation(line: 288, column: 317, scope: !39)
!309 = !DILocation(line: 288, column: 338, scope: !39)
!310 = !DILocation(line: 288, column: 346, scope: !39)
!311 = !DILocation(line: 288, column: 368, scope: !39)
!312 = !DILocation(line: 288, column: 376, scope: !39)
!313 = !DILocation(line: 288, column: 397, scope: !39)
!314 = !DILocation(line: 288, column: 405, scope: !39)
!315 = !DILocation(line: 288, column: 425, scope: !39)
!316 = !DILocation(line: 288, column: 433, scope: !39)
!317 = !DILocation(line: 291, column: 2, scope: !39)
!318 = !DILocation(line: 295, column: 2, scope: !319)
!319 = !DILexicalBlockFile(scope: !320, file: !1, discriminator: 1)
!320 = distinct !DILexicalBlock(scope: !321, file: !1, line: 295, column: 2)
!321 = distinct !DILexicalBlock(scope: !39, file: !1, line: 295, column: 2)
!322 = !DILocation(line: 296, column: 2, scope: !323)
!323 = !DILexicalBlockFile(scope: !324, file: !1, discriminator: 1)
!324 = distinct !DILexicalBlock(scope: !325, file: !1, line: 296, column: 2)
!325 = distinct !DILexicalBlock(scope: !39, file: !1, line: 296, column: 2)
!326 = !DILocation(line: 298, column: 2, scope: !327)
!327 = !DILexicalBlockFile(scope: !328, file: !1, discriminator: 1)
!328 = distinct !DILexicalBlock(scope: !329, file: !1, line: 298, column: 2)
!329 = distinct !DILexicalBlock(scope: !39, file: !1, line: 298, column: 2)
!330 = !DILocation(line: 300, column: 2, scope: !331)
!331 = !DILexicalBlockFile(scope: !332, file: !1, discriminator: 1)
!332 = distinct !DILexicalBlock(scope: !333, file: !1, line: 300, column: 2)
!333 = distinct !DILexicalBlock(scope: !39, file: !1, line: 300, column: 2)
!334 = !DILocation(line: 301, column: 2, scope: !335)
!335 = !DILexicalBlockFile(scope: !336, file: !1, discriminator: 1)
!336 = distinct !DILexicalBlock(scope: !337, file: !1, line: 301, column: 2)
!337 = distinct !DILexicalBlock(scope: !39, file: !1, line: 301, column: 2)
!338 = !DILocation(line: 302, column: 2, scope: !39)
