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
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !11, metadata !146), !dbg !147
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !12, metadata !146), !dbg !148
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !13, metadata !146), !dbg !149
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !146), !dbg !150
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !146), !dbg !151
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !16, metadata !146), !dbg !152
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !17, metadata !146), !dbg !153
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !18, metadata !146), !dbg !154
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !146), !dbg !150
  %cmp = icmp eq i64 %a, 0, !dbg !155
  br i1 %cmp, label %cleanup, label %while.cond.preheader, !dbg !157

while.cond.preheader:                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !146), !dbg !151
  %cmp13234 = icmp sgt i64 %a, -1, !dbg !158
  br i1 %cmp13234, label %blklab4.lr.ph.preheader, label %if.end3, !dbg !162

blklab4.lr.ph.preheader:                          ; preds = %while.cond.preheader
  %cmp447 = icmp eq i64 %b, 0, !dbg !163
  br i1 %cmp447, label %cleanup, label %blklab4.preheader.preheader, !dbg !165

blklab4.preheader.preheader:                      ; preds = %blklab4.lr.ph.preheader
  br label %blklab4.preheader, !dbg !152

blklab4.preheader:                                ; preds = %blklab4.preheader.preheader, %blklab5
  %b.addr.0.ph3549 = phi i64 [ %sub10, %blklab5 ], [ %b, %blklab4.preheader.preheader ]
  %a.addr.0.ph3648 = phi i64 [ %a.addr.033.lcssa, %blklab5 ], [ %a, %blklab4.preheader.preheader ]
  br label %blklab4, !dbg !152

if.end3.loopexit:                                 ; preds = %if.end9
  br label %if.end3, !dbg !166

if.end3:                                          ; preds = %if.end3.loopexit, %while.cond.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !166, !tbaa !167
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #7, !dbg !171
  tail call void @exit(i32 -1) #8, !dbg !172
  unreachable, !dbg !172

blklab4:                                          ; preds = %blklab4.preheader, %if.end9
  %a.addr.033 = phi i64 [ %sub, %if.end9 ], [ %a.addr.0.ph3648, %blklab4.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !16, metadata !146), !dbg !152
  %cmp7 = icmp sgt i64 %a.addr.033, %b.addr.0.ph3549, !dbg !173
  br i1 %cmp7, label %if.end9, label %blklab5, !dbg !175

if.end9:                                          ; preds = %blklab4
  %sub = sub nsw i64 %a.addr.033, %b.addr.0.ph3549, !dbg !176
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !17, metadata !146), !dbg !153
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !11, metadata !146), !dbg !147
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !146), !dbg !151
  %cmp1 = icmp sgt i64 %sub, -1, !dbg !158
  br i1 %cmp1, label %blklab4, label %if.end3.loopexit, !dbg !162

blklab5:                                          ; preds = %blklab4
  %a.addr.033.lcssa = phi i64 [ %a.addr.033, %blklab4 ]
  %sub10 = sub nsw i64 %b.addr.0.ph3549, %a.addr.033.lcssa, !dbg !177
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !18, metadata !146), !dbg !154
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !12, metadata !146), !dbg !148
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !146), !dbg !151
  %cmp4 = icmp eq i64 %sub10, 0, !dbg !163
  br i1 %cmp4, label %cleanup.loopexit, label %blklab4.preheader, !dbg !165

cleanup.loopexit:                                 ; preds = %blklab5
  %a.addr.033.lcssa.lcssa = phi i64 [ %a.addr.033.lcssa, %blklab5 ]
  br label %cleanup, !dbg !178

cleanup:                                          ; preds = %cleanup.loopexit, %blklab4.lr.ph.preheader, %entry
  %retval.0 = phi i64 [ %b, %entry ], [ %a, %blklab4.lr.ph.preheader ], [ %a.addr.033.lcssa.lcssa, %cleanup.loopexit ]
  ret i64 %retval.0, !dbg !178
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i64* @gcd_array(i64* nocapture %data, i64 %data_size, i1 zeroext %data_has_ownership, i64 %n) #0 !dbg !19 {
entry:
  tail call void @llvm.dbg.value(metadata i64* %data, i64 0, metadata !25, metadata !146), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 %data_size, i64 0, metadata !26, metadata !146), !dbg !179
  tail call void @llvm.dbg.value(metadata i1 %data_has_ownership, i64 0, metadata !27, metadata !180), !dbg !181
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !28, metadata !146), !dbg !182
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !29, metadata !146), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !30, metadata !146), !dbg !183
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !31, metadata !146), !dbg !184
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !32, metadata !146), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !146), !dbg !185
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !34, metadata !146), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !146), !dbg !187
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !146), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !146), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !146), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !146), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !146), !dbg !192
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !41, metadata !146), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !146), !dbg !193
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !43, metadata !146), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !146), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !146), !dbg !196
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !146), !dbg !197
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !47, metadata !146), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !48, metadata !146), !dbg !199
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !49, metadata !146), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !146), !dbg !201
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !146), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !146), !dbg !203
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !53, metadata !146), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !146), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !146), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !146), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !57, metadata !146), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !58, metadata !146), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !59, metadata !146), !dbg !210
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !60, metadata !146), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !146), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !62, metadata !146), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !146), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !146), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !65, metadata !146), !dbg !216
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !146), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !146), !dbg !218
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !146), !dbg !219
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !146), !dbg !191
  %mul = mul nsw i64 %n, %n, !dbg !220
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !40, metadata !146), !dbg !192
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !42, metadata !146), !dbg !193
  %conv1 = trunc i64 %mul to i32, !dbg !221
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #6, !dbg !221
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !41, metadata !146), !dbg !193
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !43, metadata !146), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !33, metadata !146), !dbg !185
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !32, metadata !146), !dbg !185
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !34, metadata !146), !dbg !186
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !43, metadata !146), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !146), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !146), !dbg !187
  %cmp146 = icmp sgt i64 %n, 0, !dbg !222
  br i1 %cmp146, label %while.cond8.preheader.us.preheader, label %blklab7, !dbg !225

while.cond8.preheader.us.preheader:               ; preds = %entry
  br label %while.cond8.preheader.us, !dbg !226

while.cond8.preheader.us:                         ; preds = %while.cond8.preheader.us.preheader, %blklab9.loopexit.us
  %i.0147.us = phi i64 [ %add49.us, %blklab9.loopexit.us ], [ 0, %while.cond8.preheader.us.preheader ]
  %arrayidx.us = getelementptr inbounds i64, i64* %data, i64 %i.0147.us, !dbg !226
  %mul19.us = mul nsw i64 %i.0147.us, %n, !dbg !228
  br label %if.end13.us, !dbg !226

if.end13.us:                                      ; preds = %while.cond8.preheader.us, %blklab12.us
  %j.0144.us = phi i64 [ %add48.us, %blklab12.us ], [ 0, %while.cond8.preheader.us ]
  %0 = load i64, i64* %arrayidx.us, align 8, !dbg !226, !tbaa !229
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !46, metadata !146), !dbg !197
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !37, metadata !146), !dbg !189
  %arrayidx14.us = getelementptr inbounds i64, i64* %data, i64 %j.0144.us, !dbg !231
  %1 = load i64, i64* %arrayidx14.us, align 8, !dbg !231, !tbaa !229
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !47, metadata !146), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !38, metadata !146), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !48, metadata !146), !dbg !199
  %cmp15.us = icmp eq i64 %0, 0, !dbg !232
  br i1 %cmp15.us, label %if.end18.us, label %while.cond25.preheader.us, !dbg !234

while.cond25.preheader.us:                        ; preds = %if.end13.us
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !146), !dbg !206
  %cmp27139.us = icmp sgt i64 %0, -1, !dbg !235
  br i1 %cmp27139.us, label %blklab15.lr.ph.us.preheader, label %if.end30.loopexit179, !dbg !239

blklab15.lr.ph.us.preheader:                      ; preds = %while.cond25.preheader.us
  br label %blklab15.lr.ph.us, !dbg !207

blklab15.lr.ph.us:                                ; preds = %blklab15.lr.ph.us.preheader, %if.end39.us
  %b.0.ph141.us = phi i64 [ %b.0138158.us.lcssa, %if.end39.us ], [ %1, %blklab15.lr.ph.us.preheader ]
  %a.0.ph140.us = phi i64 [ %sub.us, %if.end39.us ], [ %0, %blklab15.lr.ph.us.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !146), !dbg !207
  %cmp32157.us = icmp eq i64 %b.0.ph141.us, 0, !dbg !240
  br i1 %cmp32157.us, label %blklab13.us.loopexit178, label %if.end35.us.preheader, !dbg !242

if.end35.us.preheader:                            ; preds = %blklab15.lr.ph.us
  br label %if.end35.us, !dbg !243

if.end35.us:                                      ; preds = %if.end35.us.preheader, %blklab16.thread.us
  %b.0138158.us = phi i64 [ %sub40153.us, %blklab16.thread.us ], [ %b.0.ph141.us, %if.end35.us.preheader ]
  %cmp36.us = icmp slt i64 %b.0138158.us, %a.0.ph140.us, !dbg !243
  br i1 %cmp36.us, label %if.end39.us, label %blklab16.thread.us, !dbg !245

blklab16.thread.us:                               ; preds = %if.end35.us
  %sub40153.us = sub nsw i64 %b.0138158.us, %a.0.ph140.us, !dbg !246
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !146), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !146), !dbg !207
  %cmp32.us = icmp eq i64 %sub40153.us, 0, !dbg !240
  br i1 %cmp32.us, label %blklab13.us.loopexit, label %if.end35.us, !dbg !242

if.end39.us:                                      ; preds = %if.end35.us
  %b.0138158.us.lcssa = phi i64 [ %b.0138158.us, %if.end35.us ]
  %sub.us = sub nsw i64 %a.0.ph140.us, %b.0138158.us.lcssa, !dbg !247
  tail call void @llvm.dbg.value(metadata i64 %sub.us, i64 0, metadata !57, metadata !146), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 %sub.us, i64 0, metadata !37, metadata !146), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !146), !dbg !206
  %cmp27.us = icmp sgt i64 %sub.us, -1, !dbg !235
  br i1 %cmp27.us, label %blklab15.lr.ph.us, label %if.end30.loopexit, !dbg !239

blklab13.us.loopexit:                             ; preds = %blklab16.thread.us
  %a.0.ph140.us.lcssa185 = phi i64 [ %a.0.ph140.us, %blklab16.thread.us ]
  br label %blklab13.us, !dbg !210

blklab13.us.loopexit178:                          ; preds = %blklab15.lr.ph.us
  %a.0.ph140.us.lcssa = phi i64 [ %a.0.ph140.us, %blklab15.lr.ph.us ]
  br label %blklab13.us, !dbg !210

blklab13.us:                                      ; preds = %blklab13.us.loopexit178, %blklab13.us.loopexit
  %a.0.ph140.us187 = phi i64 [ %a.0.ph140.us.lcssa, %blklab13.us.loopexit178 ], [ %a.0.ph140.us.lcssa185, %blklab13.us.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 %mul19.us, i64 0, metadata !59, metadata !146), !dbg !210
  %add42.us = add nsw i64 %j.0144.us, %mul19.us, !dbg !248
  tail call void @llvm.dbg.value(metadata i64 %add42.us, i64 0, metadata !60, metadata !146), !dbg !211
  %arrayidx43.us = getelementptr inbounds i64, i64* %call, i64 %add42.us, !dbg !249
  %2 = load i64, i64* %arrayidx43.us, align 8, !dbg !249, !tbaa !229
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !61, metadata !146), !dbg !212
  %add44.us = add nsw i64 %2, %a.0.ph140.us187, !dbg !250
  tail call void @llvm.dbg.value(metadata i64 %add44.us, i64 0, metadata !62, metadata !146), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 %mul19.us, i64 0, metadata !63, metadata !146), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %add42.us, i64 0, metadata !64, metadata !146), !dbg !215
  store i64 %add44.us, i64* %arrayidx43.us, align 8, !dbg !251, !tbaa !229
  br label %blklab12.us, !dbg !252

if.end18.us:                                      ; preds = %if.end13.us
  tail call void @llvm.dbg.value(metadata i64 %mul19.us, i64 0, metadata !49, metadata !146), !dbg !200
  %add.us = add nsw i64 %j.0144.us, %mul19.us, !dbg !253
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !50, metadata !146), !dbg !201
  %arrayidx20.us = getelementptr inbounds i64, i64* %call, i64 %add.us, !dbg !254
  %3 = load i64, i64* %arrayidx20.us, align 8, !dbg !254, !tbaa !229
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !51, metadata !146), !dbg !202
  %add21.us = add nsw i64 %3, %1, !dbg !255
  tail call void @llvm.dbg.value(metadata i64 %add21.us, i64 0, metadata !52, metadata !146), !dbg !203
  tail call void @llvm.dbg.value(metadata i64 %mul19.us, i64 0, metadata !53, metadata !146), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !54, metadata !146), !dbg !205
  store i64 %add21.us, i64* %arrayidx20.us, align 8, !dbg !256, !tbaa !229
  br label %blklab12.us, !dbg !257

blklab12.us:                                      ; preds = %if.end18.us, %blklab13.us
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !65, metadata !146), !dbg !216
  %add48.us = add nuw nsw i64 %j.0144.us, 1, !dbg !258
  tail call void @llvm.dbg.value(metadata i64 %add48.us, i64 0, metadata !66, metadata !146), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 %add48.us, i64 0, metadata !36, metadata !146), !dbg !188
  %cmp10.us = icmp slt i64 %add48.us, %n, !dbg !259
  br i1 %cmp10.us, label %if.end13.us, label %blklab9.loopexit.us, !dbg !261

blklab9.loopexit.us:                              ; preds = %blklab12.us
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !67, metadata !146), !dbg !218
  %add49.us = add nuw nsw i64 %i.0147.us, 1, !dbg !262
  tail call void @llvm.dbg.value(metadata i64 %add49.us, i64 0, metadata !68, metadata !146), !dbg !219
  tail call void @llvm.dbg.value(metadata i64 %add49.us, i64 0, metadata !35, metadata !146), !dbg !187
  %cmp.us = icmp slt i64 %add49.us, %n, !dbg !222
  br i1 %cmp.us, label %while.cond8.preheader.us, label %blklab7.loopexit, !dbg !225

if.end30.loopexit:                                ; preds = %if.end39.us
  br label %if.end30, !dbg !263

if.end30.loopexit179:                             ; preds = %while.cond25.preheader.us
  br label %if.end30, !dbg !263

if.end30:                                         ; preds = %if.end30.loopexit179, %if.end30.loopexit
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !263, !tbaa !167
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %4) #7, !dbg !264
  tail call void @exit(i32 -1) #8, !dbg !265
  unreachable, !dbg !265

blklab7.loopexit:                                 ; preds = %blklab9.loopexit.us
  br label %blklab7, !dbg !266

blklab7:                                          ; preds = %blklab7.loopexit, %entry
  br i1 %data_has_ownership, label %if.then51, label %if.end58, !dbg !266

if.then51:                                        ; preds = %blklab7
  %6 = bitcast i64* %data to i8*, !dbg !267
  tail call void @free(i8* %6) #6, !dbg !267
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !27, metadata !146), !dbg !181
  br label %if.end58, !dbg !267

if.end58:                                         ; preds = %if.then51, %blklab7
  ret i64* %call, !dbg !271
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

declare i64* @gen1DArray(i32, i32) #3

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !69 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !73, metadata !146), !dbg !272
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !74, metadata !146), !dbg !273
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !75, metadata !146), !dbg !273
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !76, metadata !146), !dbg !274
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !77, metadata !146), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !146), !dbg !275
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !79, metadata !146), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !146), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !146), !dbg !278
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !82, metadata !146), !dbg !279
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !146), !dbg !279
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !84, metadata !146), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !146), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !146), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !146), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !146), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !146), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !146), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !83, metadata !146), !dbg !279
  %conv1 = trunc i64 %n to i32, !dbg !286
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #6, !dbg !286
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !82, metadata !146), !dbg !279
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !84, metadata !146), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !78, metadata !146), !dbg !275
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !77, metadata !146), !dbg !275
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !79, metadata !146), !dbg !276
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !84, metadata !146), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !146), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !146), !dbg !277
  %cmp41 = icmp sgt i64 %n, 0, !dbg !287
  br i1 %cmp41, label %if.end7.preheader, label %if.end15, !dbg !290

if.end7.preheader:                                ; preds = %entry
  %min.iters.check = icmp ult i64 %n, 4, !dbg !291
  br i1 %min.iters.check, label %if.end7.preheader47, label %min.iters.checked, !dbg !291

min.iters.checked:                                ; preds = %if.end7.preheader
  %n.vec = and i64 %n, -4, !dbg !291
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !291
  br i1 %cmp.zero, label %if.end7.preheader47, label %vector.body.preheader, !dbg !291

vector.body.preheader:                            ; preds = %min.iters.checked
  %0 = add i64 %n.vec, -4
  %1 = lshr exact i64 %0, 2
  %2 = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %2, 0
  br i1 %lcmp.mod, label %vector.body.prol, label %vector.body.preheader.split

vector.body.prol:                                 ; preds = %vector.body.preheader
  %3 = bitcast i64* %call to <2 x i64>*, !dbg !291
  %wide.load.prol = load <2 x i64>, <2 x i64>* %3, align 8, !dbg !291, !tbaa !229
  %4 = getelementptr i64, i64* %call, i64 2, !dbg !291
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !291
  %wide.load44.prol = load <2 x i64>, <2 x i64>* %5, align 8, !dbg !291, !tbaa !229
  %6 = add nsw <2 x i64> %wide.load.prol, <i64 0, i64 1>, !dbg !292
  %7 = add nsw <2 x i64> %wide.load44.prol, <i64 2, i64 3>, !dbg !292
  %8 = bitcast i64* %call to <2 x i64>*, !dbg !293
  store <2 x i64> %6, <2 x i64>* %8, align 8, !dbg !293, !tbaa !229
  %9 = bitcast i64* %4 to <2 x i64>*, !dbg !293
  store <2 x i64> %7, <2 x i64>* %9, align 8, !dbg !293, !tbaa !229
  br label %vector.body.preheader.split, !dbg !291

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %10 = icmp eq i64 %1, 0
  br i1 %10, label %middle.block, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !294
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction = add <2 x i64> %broadcast.splat, <i64 0, i64 1>
  %induction43 = add <2 x i64> %broadcast.splat, <i64 2, i64 3>
  %11 = getelementptr inbounds i64, i64* %call, i64 %index, !dbg !291
  %12 = bitcast i64* %11 to <2 x i64>*, !dbg !291
  %wide.load = load <2 x i64>, <2 x i64>* %12, align 8, !dbg !291, !tbaa !229
  %13 = getelementptr i64, i64* %11, i64 2, !dbg !291
  %14 = bitcast i64* %13 to <2 x i64>*, !dbg !291
  %wide.load44 = load <2 x i64>, <2 x i64>* %14, align 8, !dbg !291, !tbaa !229
  %15 = add nsw <2 x i64> %wide.load, %induction, !dbg !292
  %16 = add nsw <2 x i64> %wide.load44, %induction43, !dbg !292
  %17 = bitcast i64* %11 to <2 x i64>*, !dbg !293
  store <2 x i64> %15, <2 x i64>* %17, align 8, !dbg !293, !tbaa !229
  %18 = bitcast i64* %13 to <2 x i64>*, !dbg !293
  store <2 x i64> %16, <2 x i64>* %18, align 8, !dbg !293, !tbaa !229
  %index.next = add i64 %index, 4, !dbg !291
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction.1 = add <2 x i64> %broadcast.splat.1, <i64 0, i64 1>
  %induction43.1 = add <2 x i64> %broadcast.splat.1, <i64 2, i64 3>
  %19 = getelementptr inbounds i64, i64* %call, i64 %index.next, !dbg !291
  %20 = bitcast i64* %19 to <2 x i64>*, !dbg !291
  %wide.load.1 = load <2 x i64>, <2 x i64>* %20, align 8, !dbg !291, !tbaa !229
  %21 = getelementptr i64, i64* %19, i64 2, !dbg !291
  %22 = bitcast i64* %21 to <2 x i64>*, !dbg !291
  %wide.load44.1 = load <2 x i64>, <2 x i64>* %22, align 8, !dbg !291, !tbaa !229
  %23 = add nsw <2 x i64> %wide.load.1, %induction.1, !dbg !292
  %24 = add nsw <2 x i64> %wide.load44.1, %induction43.1, !dbg !292
  %25 = bitcast i64* %19 to <2 x i64>*, !dbg !293
  store <2 x i64> %23, <2 x i64>* %25, align 8, !dbg !293, !tbaa !229
  %26 = bitcast i64* %21 to <2 x i64>*, !dbg !293
  store <2 x i64> %24, <2 x i64>* %26, align 8, !dbg !293, !tbaa !229
  %index.next.1 = add i64 %index, 8, !dbg !291
  %27 = icmp eq i64 %index.next.1, %n.vec, !dbg !291
  br i1 %27, label %middle.block.unr-lcssa, label %vector.body, !dbg !291, !llvm.loop !295

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %n.vec, %n
  br i1 %cmp.n, label %if.end15, label %if.end7.preheader47, !dbg !291

if.end7.preheader47:                              ; preds = %middle.block, %min.iters.checked, %if.end7.preheader
  %i.042.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end7.preheader ], [ %n.vec, %middle.block ]
  br label %if.end7, !dbg !291

if.end7:                                          ; preds = %if.end7.preheader47, %if.end7
  %i.042 = phi i64 [ %add9, %if.end7 ], [ %i.042.ph, %if.end7.preheader47 ]
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %i.042, !dbg !291
  %28 = load i64, i64* %arrayidx, align 8, !dbg !291, !tbaa !229
  tail call void @llvm.dbg.value(metadata i64 %28, i64 0, metadata !86, metadata !146), !dbg !282
  %add = add nsw i64 %28, %i.042, !dbg !292
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !87, metadata !146), !dbg !283
  store i64 %add, i64* %arrayidx, align 8, !dbg !293, !tbaa !229
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !88, metadata !146), !dbg !284
  %add9 = add nuw nsw i64 %i.042, 1, !dbg !294
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !89, metadata !146), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !80, metadata !146), !dbg !277
  %exitcond = icmp eq i64 %add9, %n, !dbg !290
  br i1 %exitcond, label %if.end15.loopexit, label %if.end7, !dbg !290, !llvm.loop !298

if.end15.loopexit:                                ; preds = %if.end7
  br label %if.end15, !dbg !300

if.end15:                                         ; preds = %if.end15.loopexit, %middle.block, %entry
  ret i64* %call, !dbg !300
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #4 !dbg !90 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !98, metadata !146), !dbg !301
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !99, metadata !146), !dbg !302
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !101, metadata !146), !dbg !303
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !102, metadata !146), !dbg !304
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !103, metadata !146), !dbg !304
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !104, metadata !146), !dbg !305
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !105, metadata !146), !dbg !306
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !146), !dbg !306
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !107, metadata !146), !dbg !307
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !146), !dbg !308
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !109, metadata !146), !dbg !309
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !146), !dbg !310
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !112, metadata !146), !dbg !311
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !146), !dbg !311
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !115, metadata !146), !dbg !311
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !116, metadata !146), !dbg !312
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !117, metadata !146), !dbg !313
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !118, metadata !146), !dbg !314
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !119, metadata !146), !dbg !314
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !120, metadata !146), !dbg !315
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !121, metadata !146), !dbg !316
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !146), !dbg !316
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !123, metadata !146), !dbg !317
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !124, metadata !146), !dbg !318
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !125, metadata !146), !dbg !318
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !126, metadata !146), !dbg !319
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !127, metadata !146), !dbg !320
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !128, metadata !146), !dbg !321
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !129, metadata !146), !dbg !322
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !146), !dbg !323
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !131, metadata !146), !dbg !324
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !132, metadata !146), !dbg !325
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !133, metadata !146), !dbg !326
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !146), !dbg !327
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !135, metadata !146), !dbg !328
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !146), !dbg !329
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !137, metadata !146), !dbg !330
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !139, metadata !146), !dbg !331
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !146), !dbg !331
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !141, metadata !146), !dbg !332
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6, !dbg !333
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !112, metadata !146), !dbg !311
  %sub = add nsw i32 %argc, -1, !dbg !333
  %conv = sext i32 %sub to i64, !dbg !333
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !114, metadata !146), !dbg !311
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !116, metadata !146), !dbg !312
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !117, metadata !146), !dbg !313
  %0 = load i64*, i64** %call, align 8, !dbg !334, !tbaa !167
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !118, metadata !146), !dbg !314
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6, !dbg !335
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !111, metadata !146), !dbg !336
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !100, metadata !146), !dbg !337
  %cmp = icmp eq i64* %call1, null, !dbg !338
  br i1 %cmp, label %if.end59.critedge, label %if.end, !dbg !340

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !341, !tbaa !229
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !101, metadata !146), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !73, metadata !146) #6, !dbg !342
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !74, metadata !146) #6, !dbg !344
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !75, metadata !146) #6, !dbg !344
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !76, metadata !146) #6, !dbg !345
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !77, metadata !146) #6, !dbg !346
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !146) #6, !dbg !346
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !79, metadata !146) #6, !dbg !347
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !146) #6, !dbg !348
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !146) #6, !dbg !349
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !82, metadata !146) #6, !dbg !350
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !146) #6, !dbg !350
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !84, metadata !146) #6, !dbg !351
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !146) #6, !dbg !352
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !146) #6, !dbg !353
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !146) #6, !dbg !354
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !146) #6, !dbg !355
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !146) #6, !dbg !356
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !146) #6, !dbg !349
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !83, metadata !146) #6, !dbg !350
  %conv1.i = trunc i64 %1 to i32, !dbg !357
  %call.i = tail call i64* @gen1DArray(i32 0, i32 %conv1.i) #6, !dbg !357
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !82, metadata !146) #6, !dbg !350
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !84, metadata !146) #6, !dbg !351
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !78, metadata !146) #6, !dbg !346
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !77, metadata !146) #6, !dbg !346
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !79, metadata !146) #6, !dbg !347
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !84, metadata !146) #6, !dbg !351
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !146) #6, !dbg !352
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !146) #6, !dbg !348
  %cmp41.i = icmp sgt i64 %1, 0, !dbg !358
  br i1 %cmp41.i, label %if.end7.i.preheader, label %init.exit.thread, !dbg !359

if.end7.i.preheader:                              ; preds = %if.end
  %min.iters.check = icmp ult i64 %1, 4, !dbg !360
  br i1 %min.iters.check, label %if.end7.i.preheader136, label %min.iters.checked, !dbg !360

if.end7.i.preheader136:                           ; preds = %middle.block, %min.iters.checked, %if.end7.i.preheader
  %i.042.i.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end7.i.preheader ], [ %n.vec, %middle.block ]
  br label %if.end7.i, !dbg !360

min.iters.checked:                                ; preds = %if.end7.i.preheader
  %n.vec = and i64 %1, -4, !dbg !360
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !360
  br i1 %cmp.zero, label %if.end7.i.preheader136, label %vector.body.preheader, !dbg !360

vector.body.preheader:                            ; preds = %min.iters.checked
  %2 = add i64 %n.vec, -4, !dbg !361
  %3 = lshr exact i64 %2, 2, !dbg !361
  %4 = and i64 %3, 1, !dbg !361
  %lcmp.mod140 = icmp eq i64 %4, 0, !dbg !361
  br i1 %lcmp.mod140, label %vector.body.prol, label %vector.body.preheader.split, !dbg !361

vector.body.prol:                                 ; preds = %vector.body.preheader
  %5 = bitcast i64* %call.i to <2 x i64>*, !dbg !360
  %wide.load.prol = load <2 x i64>, <2 x i64>* %5, align 8, !dbg !360, !tbaa !229
  %6 = getelementptr i64, i64* %call.i, i64 2, !dbg !360
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !360
  %wide.load108.prol = load <2 x i64>, <2 x i64>* %7, align 8, !dbg !360, !tbaa !229
  %8 = add nsw <2 x i64> %wide.load.prol, <i64 0, i64 1>, !dbg !362
  %9 = add nsw <2 x i64> %wide.load108.prol, <i64 2, i64 3>, !dbg !362
  %10 = bitcast i64* %call.i to <2 x i64>*, !dbg !363
  store <2 x i64> %8, <2 x i64>* %10, align 8, !dbg !363, !tbaa !229
  %11 = bitcast i64* %6 to <2 x i64>*, !dbg !363
  store <2 x i64> %9, <2 x i64>* %11, align 8, !dbg !363, !tbaa !229
  br label %vector.body.preheader.split, !dbg !360

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %12 = icmp eq i64 %3, 0, !dbg !361
  br i1 %12, label %middle.block, label %vector.body.preheader.split.split, !dbg !361

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !361

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !361
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0, !dbg !361
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !361
  %induction = add <2 x i64> %broadcast.splat, <i64 0, i64 1>, !dbg !361
  %induction107 = add <2 x i64> %broadcast.splat, <i64 2, i64 3>, !dbg !361
  %13 = getelementptr inbounds i64, i64* %call.i, i64 %index, !dbg !360
  %14 = bitcast i64* %13 to <2 x i64>*, !dbg !360
  %wide.load = load <2 x i64>, <2 x i64>* %14, align 8, !dbg !360, !tbaa !229
  %15 = getelementptr i64, i64* %13, i64 2, !dbg !360
  %16 = bitcast i64* %15 to <2 x i64>*, !dbg !360
  %wide.load108 = load <2 x i64>, <2 x i64>* %16, align 8, !dbg !360, !tbaa !229
  %17 = add nsw <2 x i64> %wide.load, %induction, !dbg !362
  %18 = add nsw <2 x i64> %wide.load108, %induction107, !dbg !362
  %19 = bitcast i64* %13 to <2 x i64>*, !dbg !363
  store <2 x i64> %17, <2 x i64>* %19, align 8, !dbg !363, !tbaa !229
  %20 = bitcast i64* %15 to <2 x i64>*, !dbg !363
  store <2 x i64> %18, <2 x i64>* %20, align 8, !dbg !363, !tbaa !229
  %index.next = add i64 %index, 4, !dbg !360
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0, !dbg !361
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !361
  %induction.1 = add <2 x i64> %broadcast.splat.1, <i64 0, i64 1>, !dbg !361
  %induction107.1 = add <2 x i64> %broadcast.splat.1, <i64 2, i64 3>, !dbg !361
  %21 = getelementptr inbounds i64, i64* %call.i, i64 %index.next, !dbg !360
  %22 = bitcast i64* %21 to <2 x i64>*, !dbg !360
  %wide.load.1 = load <2 x i64>, <2 x i64>* %22, align 8, !dbg !360, !tbaa !229
  %23 = getelementptr i64, i64* %21, i64 2, !dbg !360
  %24 = bitcast i64* %23 to <2 x i64>*, !dbg !360
  %wide.load108.1 = load <2 x i64>, <2 x i64>* %24, align 8, !dbg !360, !tbaa !229
  %25 = add nsw <2 x i64> %wide.load.1, %induction.1, !dbg !362
  %26 = add nsw <2 x i64> %wide.load108.1, %induction107.1, !dbg !362
  %27 = bitcast i64* %21 to <2 x i64>*, !dbg !363
  store <2 x i64> %25, <2 x i64>* %27, align 8, !dbg !363, !tbaa !229
  %28 = bitcast i64* %23 to <2 x i64>*, !dbg !363
  store <2 x i64> %26, <2 x i64>* %28, align 8, !dbg !363, !tbaa !229
  %index.next.1 = add i64 %index, 8, !dbg !360
  %29 = icmp eq i64 %index.next.1, %n.vec, !dbg !360
  br i1 %29, label %middle.block.unr-lcssa, label %vector.body, !dbg !360, !llvm.loop !364

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %1, %n.vec
  br i1 %cmp.n, label %while.cond20.preheader.us.preheader, label %if.end7.i.preheader136, !dbg !360

init.exit.thread:                                 ; preds = %if.end
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !121, metadata !146), !dbg !316
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !123, metadata !146), !dbg !317
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !103, metadata !146), !dbg !304
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !102, metadata !146), !dbg !304
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !104, metadata !146), !dbg !305
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !123, metadata !146), !dbg !317
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !104, metadata !146), !dbg !305
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !125, metadata !146), !dbg !318
  %call12103 = tail call i64* @gcd_array(i64* %call.i, i64 undef, i1 zeroext false, i64 %1), !dbg !365
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !124, metadata !146), !dbg !318
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !126, metadata !146), !dbg !319
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !146), !dbg !306
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !105, metadata !146), !dbg !306
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !107, metadata !146), !dbg !307
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !126, metadata !146), !dbg !319
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !127, metadata !146), !dbg !320
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !146), !dbg !308
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !128, metadata !146), !dbg !321
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !109, metadata !146), !dbg !309
  br label %if.then40, !dbg !366

if.end7.i:                                        ; preds = %if.end7.i.preheader136, %if.end7.i
  %i.042.i = phi i64 [ %add9.i, %if.end7.i ], [ %i.042.i.ph, %if.end7.i.preheader136 ], !dbg !361
  %arrayidx.i = getelementptr inbounds i64, i64* %call.i, i64 %i.042.i, !dbg !360
  %30 = load i64, i64* %arrayidx.i, align 8, !dbg !360, !tbaa !229
  tail call void @llvm.dbg.value(metadata i64 %30, i64 0, metadata !86, metadata !146) #6, !dbg !353
  %add.i = add nsw i64 %30, %i.042.i, !dbg !362
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !87, metadata !146) #6, !dbg !354
  store i64 %add.i, i64* %arrayidx.i, align 8, !dbg !363, !tbaa !229
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !88, metadata !146) #6, !dbg !355
  %add9.i = add nuw nsw i64 %i.042.i, 1, !dbg !368
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !89, metadata !146) #6, !dbg !356
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !80, metadata !146) #6, !dbg !348
  %exitcond.i = icmp eq i64 %add9.i, %1, !dbg !359
  br i1 %exitcond.i, label %while.cond20.preheader.us.preheader.loopexit, label %if.end7.i, !dbg !359, !llvm.loop !369

while.cond20.preheader.us.preheader.loopexit:     ; preds = %if.end7.i
  br label %while.cond20.preheader.us.preheader, !dbg !316

while.cond20.preheader.us.preheader:              ; preds = %while.cond20.preheader.us.preheader.loopexit, %middle.block
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !121, metadata !146), !dbg !316
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !123, metadata !146), !dbg !317
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !103, metadata !146), !dbg !304
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !102, metadata !146), !dbg !304
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !104, metadata !146), !dbg !305
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !123, metadata !146), !dbg !317
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !104, metadata !146), !dbg !305
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !125, metadata !146), !dbg !318
  %call12 = tail call i64* @gcd_array(i64* nonnull %call.i, i64 undef, i1 zeroext false, i64 %1), !dbg !365
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !124, metadata !146), !dbg !318
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !126, metadata !146), !dbg !319
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !146), !dbg !306
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !105, metadata !146), !dbg !306
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !107, metadata !146), !dbg !307
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !126, metadata !146), !dbg !319
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !127, metadata !146), !dbg !320
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !146), !dbg !308
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !128, metadata !146), !dbg !321
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !109, metadata !146), !dbg !309
  %31 = add i64 %1, -4, !dbg !370
  %32 = lshr i64 %31, 2, !dbg !370
  %33 = add nuw nsw i64 %32, 1, !dbg !370
  %min.iters.check114 = icmp ult i64 %1, 4, !dbg !370
  %n.vec117 = and i64 %1, -4, !dbg !370
  %cmp.zero118 = icmp eq i64 %n.vec117, 0, !dbg !370
  %xtraiter = and i64 %33, 3, !dbg !370
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !370
  %34 = icmp ult i64 %31, 12, !dbg !370
  %cmp.n123 = icmp eq i64 %1, %n.vec117
  br label %while.cond20.preheader.us, !dbg !370

while.cond20.preheader.us:                        ; preds = %while.cond20.preheader.us.preheader, %blklab23.loopexit.us
  %i.099.us = phi i64 [ %add29.us, %blklab23.loopexit.us ], [ 0, %while.cond20.preheader.us.preheader ]
  %sum.098.us = phi i64 [ %add27.us.lcssa, %blklab23.loopexit.us ], [ 0, %while.cond20.preheader.us.preheader ]
  %mul.us = mul nsw i64 %i.099.us, %1, !dbg !370
  br i1 %min.iters.check114, label %if.end25.us.preheader, label %min.iters.checked115, !dbg !370

min.iters.checked115:                             ; preds = %while.cond20.preheader.us
  br i1 %cmp.zero118, label %if.end25.us.preheader, label %vector.ph119, !dbg !370

vector.ph119:                                     ; preds = %min.iters.checked115
  %35 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %sum.098.us, i32 0, !dbg !370
  br i1 %lcmp.mod, label %vector.ph119.split, label %vector.body111.prol.preheader, !dbg !370

vector.body111.prol.preheader:                    ; preds = %vector.ph119
  br label %vector.body111.prol, !dbg !372

vector.body111.prol:                              ; preds = %vector.body111.prol, %vector.body111.prol.preheader
  %index120.prol = phi i64 [ %index.next121.prol, %vector.body111.prol ], [ 0, %vector.body111.prol.preheader ], !dbg !373
  %vec.phi.prol = phi <2 x i64> [ %41, %vector.body111.prol ], [ %35, %vector.body111.prol.preheader ]
  %vec.phi128.prol = phi <2 x i64> [ %42, %vector.body111.prol ], [ zeroinitializer, %vector.body111.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body111.prol ], [ %xtraiter, %vector.body111.prol.preheader ]
  %36 = add nsw i64 %index120.prol, %mul.us, !dbg !372
  %37 = getelementptr inbounds i64, i64* %call12, i64 %36, !dbg !372
  %38 = bitcast i64* %37 to <2 x i64>*, !dbg !372
  %wide.load131.prol = load <2 x i64>, <2 x i64>* %38, align 8, !dbg !372, !tbaa !229
  %39 = getelementptr i64, i64* %37, i64 2, !dbg !372
  %40 = bitcast i64* %39 to <2 x i64>*, !dbg !372
  %wide.load132.prol = load <2 x i64>, <2 x i64>* %40, align 8, !dbg !372, !tbaa !229
  %41 = add nsw <2 x i64> %wide.load131.prol, %vec.phi.prol, !dbg !374
  %42 = add nsw <2 x i64> %wide.load132.prol, %vec.phi128.prol, !dbg !374
  %index.next121.prol = add i64 %index120.prol, 4, !dbg !370
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !370
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !370
  br i1 %prol.iter.cmp, label %vector.ph119.split.loopexit, label %vector.body111.prol, !dbg !370, !llvm.loop !375

vector.ph119.split.loopexit:                      ; preds = %vector.body111.prol
  %index.next121.prol.lcssa = phi i64 [ %index.next121.prol, %vector.body111.prol ]
  %.lcssa145 = phi <2 x i64> [ %42, %vector.body111.prol ]
  %.lcssa144 = phi <2 x i64> [ %41, %vector.body111.prol ]
  br label %vector.ph119.split, !dbg !370

vector.ph119.split:                               ; preds = %vector.ph119, %vector.ph119.split.loopexit
  %.lcssa137.unr = phi <2 x i64> [ undef, %vector.ph119 ], [ %.lcssa145, %vector.ph119.split.loopexit ]
  %.lcssa.unr = phi <2 x i64> [ undef, %vector.ph119 ], [ %.lcssa144, %vector.ph119.split.loopexit ]
  %index120.unr = phi i64 [ 0, %vector.ph119 ], [ %index.next121.prol.lcssa, %vector.ph119.split.loopexit ]
  %vec.phi.unr = phi <2 x i64> [ %35, %vector.ph119 ], [ %.lcssa144, %vector.ph119.split.loopexit ]
  %vec.phi128.unr = phi <2 x i64> [ zeroinitializer, %vector.ph119 ], [ %.lcssa145, %vector.ph119.split.loopexit ]
  br i1 %34, label %middle.block112, label %vector.ph119.split.split, !dbg !370

vector.ph119.split.split:                         ; preds = %vector.ph119.split
  br label %vector.body111, !dbg !370

vector.body111:                                   ; preds = %vector.body111, %vector.ph119.split.split
  %index120 = phi i64 [ %index120.unr, %vector.ph119.split.split ], [ %index.next121.3, %vector.body111 ], !dbg !373
  %vec.phi = phi <2 x i64> [ %vec.phi.unr, %vector.ph119.split.split ], [ %69, %vector.body111 ]
  %vec.phi128 = phi <2 x i64> [ %vec.phi128.unr, %vector.ph119.split.split ], [ %70, %vector.body111 ]
  %43 = add nsw i64 %index120, %mul.us, !dbg !372
  %44 = getelementptr inbounds i64, i64* %call12, i64 %43, !dbg !372
  %45 = bitcast i64* %44 to <2 x i64>*, !dbg !372
  %wide.load131 = load <2 x i64>, <2 x i64>* %45, align 8, !dbg !372, !tbaa !229
  %46 = getelementptr i64, i64* %44, i64 2, !dbg !372
  %47 = bitcast i64* %46 to <2 x i64>*, !dbg !372
  %wide.load132 = load <2 x i64>, <2 x i64>* %47, align 8, !dbg !372, !tbaa !229
  %48 = add nsw <2 x i64> %wide.load131, %vec.phi, !dbg !374
  %49 = add nsw <2 x i64> %wide.load132, %vec.phi128, !dbg !374
  %index.next121 = add i64 %index120, 4, !dbg !370
  %50 = add nsw i64 %index.next121, %mul.us, !dbg !372
  %51 = getelementptr inbounds i64, i64* %call12, i64 %50, !dbg !372
  %52 = bitcast i64* %51 to <2 x i64>*, !dbg !372
  %wide.load131.1 = load <2 x i64>, <2 x i64>* %52, align 8, !dbg !372, !tbaa !229
  %53 = getelementptr i64, i64* %51, i64 2, !dbg !372
  %54 = bitcast i64* %53 to <2 x i64>*, !dbg !372
  %wide.load132.1 = load <2 x i64>, <2 x i64>* %54, align 8, !dbg !372, !tbaa !229
  %55 = add nsw <2 x i64> %wide.load131.1, %48, !dbg !374
  %56 = add nsw <2 x i64> %wide.load132.1, %49, !dbg !374
  %index.next121.1 = add i64 %index120, 8, !dbg !370
  %57 = add nsw i64 %index.next121.1, %mul.us, !dbg !372
  %58 = getelementptr inbounds i64, i64* %call12, i64 %57, !dbg !372
  %59 = bitcast i64* %58 to <2 x i64>*, !dbg !372
  %wide.load131.2 = load <2 x i64>, <2 x i64>* %59, align 8, !dbg !372, !tbaa !229
  %60 = getelementptr i64, i64* %58, i64 2, !dbg !372
  %61 = bitcast i64* %60 to <2 x i64>*, !dbg !372
  %wide.load132.2 = load <2 x i64>, <2 x i64>* %61, align 8, !dbg !372, !tbaa !229
  %62 = add nsw <2 x i64> %wide.load131.2, %55, !dbg !374
  %63 = add nsw <2 x i64> %wide.load132.2, %56, !dbg !374
  %index.next121.2 = add i64 %index120, 12, !dbg !370
  %64 = add nsw i64 %index.next121.2, %mul.us, !dbg !372
  %65 = getelementptr inbounds i64, i64* %call12, i64 %64, !dbg !372
  %66 = bitcast i64* %65 to <2 x i64>*, !dbg !372
  %wide.load131.3 = load <2 x i64>, <2 x i64>* %66, align 8, !dbg !372, !tbaa !229
  %67 = getelementptr i64, i64* %65, i64 2, !dbg !372
  %68 = bitcast i64* %67 to <2 x i64>*, !dbg !372
  %wide.load132.3 = load <2 x i64>, <2 x i64>* %68, align 8, !dbg !372, !tbaa !229
  %69 = add nsw <2 x i64> %wide.load131.3, %62, !dbg !374
  %70 = add nsw <2 x i64> %wide.load132.3, %63, !dbg !374
  %index.next121.3 = add i64 %index120, 16, !dbg !370
  %71 = icmp eq i64 %index.next121.3, %n.vec117, !dbg !370
  br i1 %71, label %middle.block112.unr-lcssa, label %vector.body111, !dbg !370, !llvm.loop !377

middle.block112.unr-lcssa:                        ; preds = %vector.body111
  %.lcssa142 = phi <2 x i64> [ %70, %vector.body111 ]
  %.lcssa141 = phi <2 x i64> [ %69, %vector.body111 ]
  br label %middle.block112, !dbg !374

middle.block112:                                  ; preds = %vector.ph119.split, %middle.block112.unr-lcssa
  %.lcssa137 = phi <2 x i64> [ %.lcssa137.unr, %vector.ph119.split ], [ %.lcssa142, %middle.block112.unr-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.unr, %vector.ph119.split ], [ %.lcssa141, %middle.block112.unr-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa137, %.lcssa, !dbg !374
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>, !dbg !374
  %bin.rdx135 = add <2 x i64> %bin.rdx, %rdx.shuf, !dbg !374
  %72 = extractelement <2 x i64> %bin.rdx135, i32 0, !dbg !374
  br i1 %cmp.n123, label %blklab23.loopexit.us, label %if.end25.us.preheader, !dbg !370

if.end25.us.preheader:                            ; preds = %middle.block112, %min.iters.checked115, %while.cond20.preheader.us
  %j.096.us.ph = phi i64 [ 0, %min.iters.checked115 ], [ 0, %while.cond20.preheader.us ], [ %n.vec117, %middle.block112 ]
  %sum.195.us.ph = phi i64 [ %sum.098.us, %min.iters.checked115 ], [ %sum.098.us, %while.cond20.preheader.us ], [ %72, %middle.block112 ]
  br label %if.end25.us, !dbg !323

if.end25.us:                                      ; preds = %if.end25.us.preheader, %if.end25.us
  %j.096.us = phi i64 [ %add28.us, %if.end25.us ], [ %j.096.us.ph, %if.end25.us.preheader ]
  %sum.195.us = phi i64 [ %add27.us, %if.end25.us ], [ %sum.195.us.ph, %if.end25.us.preheader ]
  tail call void @llvm.dbg.value(metadata i64 %mul.us, i64 0, metadata !130, metadata !146), !dbg !323
  %add.us = add nsw i64 %j.096.us, %mul.us, !dbg !378
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !131, metadata !146), !dbg !324
  %arrayidx26.us = getelementptr inbounds i64, i64* %call12, i64 %add.us, !dbg !372
  %73 = load i64, i64* %arrayidx26.us, align 8, !dbg !372, !tbaa !229
  tail call void @llvm.dbg.value(metadata i64 %73, i64 0, metadata !132, metadata !146), !dbg !325
  %add27.us = add nsw i64 %73, %sum.195.us, !dbg !374
  tail call void @llvm.dbg.value(metadata i64 %add27.us, i64 0, metadata !133, metadata !146), !dbg !326
  tail call void @llvm.dbg.value(metadata i64 %add27.us, i64 0, metadata !108, metadata !146), !dbg !308
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !134, metadata !146), !dbg !327
  %add28.us = add nuw nsw i64 %j.096.us, 1, !dbg !373
  tail call void @llvm.dbg.value(metadata i64 %add28.us, i64 0, metadata !135, metadata !146), !dbg !328
  tail call void @llvm.dbg.value(metadata i64 %add28.us, i64 0, metadata !110, metadata !146), !dbg !310
  %exitcond.us = icmp eq i64 %add28.us, %1, !dbg !379
  br i1 %exitcond.us, label %blklab23.loopexit.us.loopexit, label %if.end25.us, !dbg !379, !llvm.loop !380

blklab23.loopexit.us.loopexit:                    ; preds = %if.end25.us
  %add27.us.lcssa143 = phi i64 [ %add27.us, %if.end25.us ]
  br label %blklab23.loopexit.us, !dbg !329

blklab23.loopexit.us:                             ; preds = %blklab23.loopexit.us.loopexit, %middle.block112
  %add27.us.lcssa = phi i64 [ %72, %middle.block112 ], [ %add27.us.lcssa143, %blklab23.loopexit.us.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !136, metadata !146), !dbg !329
  %add29.us = add nuw nsw i64 %i.099.us, 1, !dbg !381
  tail call void @llvm.dbg.value(metadata i64 %add29.us, i64 0, metadata !137, metadata !146), !dbg !330
  tail call void @llvm.dbg.value(metadata i64 %add29.us, i64 0, metadata !109, metadata !146), !dbg !309
  %exitcond102.us = icmp eq i64 %add29.us, %1, !dbg !366
  br i1 %exitcond102.us, label %if.then40.loopexit, label %while.cond20.preheader.us, !dbg !366

if.then40.loopexit:                               ; preds = %blklab23.loopexit.us
  %add27.us.lcssa.lcssa = phi i64 [ %add27.us.lcssa, %blklab23.loopexit.us ]
  br label %if.then40, !dbg !331

if.then40:                                        ; preds = %if.then40.loopexit, %init.exit.thread
  %call12104 = phi i64* [ %call12103, %init.exit.thread ], [ %call12, %if.then40.loopexit ]
  %sum.0.lcssa = phi i64 [ 0, %init.exit.thread ], [ %add27.us.lcssa.lcssa, %if.then40.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !140, metadata !146), !dbg !331
  %call33 = tail call noalias i8* @malloc(i64 32) #6, !dbg !382
  %74 = bitcast i8* %call33 to i64*, !dbg !382
  tail call void @llvm.dbg.value(metadata i64* %74, i64 0, metadata !139, metadata !146), !dbg !331
  %75 = bitcast i8* %call33 to <2 x i64>*, !dbg !383
  store <2 x i64> <i64 83, i64 85>, <2 x i64>* %75, align 8, !dbg !383, !tbaa !229
  %arrayidx36 = getelementptr inbounds i8, i8* %call33, i64 16, !dbg !384
  %76 = bitcast i8* %arrayidx36 to <2 x i64>*, !dbg !385
  store <2 x i64> <i64 77, i64 58>, <2 x i64>* %76, align 8, !dbg !385, !tbaa !229
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !141, metadata !146), !dbg !332
  tail call void @printf_s(i64* %74, i64 4) #6, !dbg !386
  %call38 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa), !dbg !387
  %phitmp = bitcast i64* %call12104 to i8*, !dbg !387
  %phitmp93 = bitcast i64* %call.i to i8*, !dbg !387
  tail call void @free(i8* %phitmp93) #6, !dbg !388
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !104, metadata !146), !dbg !305
  tail call void @free(i8* %phitmp) #6, !dbg !392
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !107, metadata !146), !dbg !307
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !396
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !116, metadata !146), !dbg !312
  tail call void @free(i8* %call33) #6, !dbg !400
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !141, metadata !146), !dbg !332
  br label %if.end59, !dbg !400

if.end59.critedge:                                ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !396
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !116, metadata !146), !dbg !312
  br label %if.end59

if.end59:                                         ; preds = %if.end59.critedge, %if.then40
  tail call void @exit(i32 0) #8, !dbg !404
  unreachable, !dbg !404
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64* @parseStringToInt(i64*) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @printf_s(i64*, i64) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

declare void @free2DArray(i64**, i64) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!143, !144}
!llvm.ident = !{!145}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "GCD.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !19, !69, !90}
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
!19 = distinct !DISubprogram(name: "gcd_array", scope: !1, file: !1, line: 62, type: !20, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: true, variables: !24)
!20 = !DISubroutineType(types: !21)
!21 = !{!22, !22, !9, !23, !9}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!23 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!24 = !{!25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68}
!25 = !DILocalVariable(name: "data", arg: 1, scope: !19, file: !1, line: 62, type: !22)
!26 = !DILocalVariable(name: "data_size", arg: 2, scope: !19, file: !1, line: 62, type: !9)
!27 = !DILocalVariable(name: "data_has_ownership", arg: 3, scope: !19, file: !1, line: 62, type: !23)
!28 = !DILocalVariable(name: "n", arg: 4, scope: !19, file: !1, line: 62, type: !9)
!29 = !DILocalVariable(name: "_2", scope: !19, file: !1, line: 63, type: !22)
!30 = !DILocalVariable(name: "_2_size", scope: !19, file: !1, line: 63, type: !9)
!31 = !DILocalVariable(name: "_2_has_ownership", scope: !19, file: !1, line: 64, type: !23)
!32 = !DILocalVariable(name: "gcds", scope: !19, file: !1, line: 65, type: !22)
!33 = !DILocalVariable(name: "gcds_size", scope: !19, file: !1, line: 65, type: !9)
!34 = !DILocalVariable(name: "gcds_has_ownership", scope: !19, file: !1, line: 66, type: !23)
!35 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 67, type: !9)
!36 = !DILocalVariable(name: "j", scope: !19, file: !1, line: 68, type: !9)
!37 = !DILocalVariable(name: "a", scope: !19, file: !1, line: 69, type: !9)
!38 = !DILocalVariable(name: "b", scope: !19, file: !1, line: 70, type: !9)
!39 = !DILocalVariable(name: "_8", scope: !19, file: !1, line: 71, type: !9)
!40 = !DILocalVariable(name: "_9", scope: !19, file: !1, line: 72, type: !9)
!41 = !DILocalVariable(name: "_10", scope: !19, file: !1, line: 73, type: !22)
!42 = !DILocalVariable(name: "_10_size", scope: !19, file: !1, line: 73, type: !9)
!43 = !DILocalVariable(name: "_10_has_ownership", scope: !19, file: !1, line: 74, type: !23)
!44 = !DILocalVariable(name: "_11", scope: !19, file: !1, line: 75, type: !9)
!45 = !DILocalVariable(name: "_12", scope: !19, file: !1, line: 76, type: !9)
!46 = !DILocalVariable(name: "_13", scope: !19, file: !1, line: 77, type: !9)
!47 = !DILocalVariable(name: "_14", scope: !19, file: !1, line: 78, type: !9)
!48 = !DILocalVariable(name: "_15", scope: !19, file: !1, line: 79, type: !9)
!49 = !DILocalVariable(name: "_16", scope: !19, file: !1, line: 80, type: !9)
!50 = !DILocalVariable(name: "_17", scope: !19, file: !1, line: 81, type: !9)
!51 = !DILocalVariable(name: "_18", scope: !19, file: !1, line: 82, type: !9)
!52 = !DILocalVariable(name: "_19", scope: !19, file: !1, line: 83, type: !9)
!53 = !DILocalVariable(name: "_20", scope: !19, file: !1, line: 84, type: !9)
!54 = !DILocalVariable(name: "_21", scope: !19, file: !1, line: 85, type: !9)
!55 = !DILocalVariable(name: "_22", scope: !19, file: !1, line: 86, type: !9)
!56 = !DILocalVariable(name: "_23", scope: !19, file: !1, line: 87, type: !9)
!57 = !DILocalVariable(name: "_24", scope: !19, file: !1, line: 88, type: !9)
!58 = !DILocalVariable(name: "_25", scope: !19, file: !1, line: 89, type: !9)
!59 = !DILocalVariable(name: "_26", scope: !19, file: !1, line: 90, type: !9)
!60 = !DILocalVariable(name: "_27", scope: !19, file: !1, line: 91, type: !9)
!61 = !DILocalVariable(name: "_28", scope: !19, file: !1, line: 92, type: !9)
!62 = !DILocalVariable(name: "_29", scope: !19, file: !1, line: 93, type: !9)
!63 = !DILocalVariable(name: "_30", scope: !19, file: !1, line: 94, type: !9)
!64 = !DILocalVariable(name: "_31", scope: !19, file: !1, line: 95, type: !9)
!65 = !DILocalVariable(name: "_32", scope: !19, file: !1, line: 96, type: !9)
!66 = !DILocalVariable(name: "_33", scope: !19, file: !1, line: 97, type: !9)
!67 = !DILocalVariable(name: "_34", scope: !19, file: !1, line: 98, type: !9)
!68 = !DILocalVariable(name: "_35", scope: !19, file: !1, line: 99, type: !9)
!69 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 245, type: !70, isLocal: false, isDefinition: true, scopeLine: 245, flags: DIFlagPrototyped, isOptimized: true, variables: !72)
!70 = !DISubroutineType(types: !71)
!71 = !{!22, !9}
!72 = !{!73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89}
!73 = !DILocalVariable(name: "n", arg: 1, scope: !69, file: !1, line: 245, type: !9)
!74 = !DILocalVariable(name: "_1", scope: !69, file: !1, line: 246, type: !22)
!75 = !DILocalVariable(name: "_1_size", scope: !69, file: !1, line: 246, type: !9)
!76 = !DILocalVariable(name: "_1_has_ownership", scope: !69, file: !1, line: 247, type: !23)
!77 = !DILocalVariable(name: "data", scope: !69, file: !1, line: 248, type: !22)
!78 = !DILocalVariable(name: "data_size", scope: !69, file: !1, line: 248, type: !9)
!79 = !DILocalVariable(name: "data_has_ownership", scope: !69, file: !1, line: 249, type: !23)
!80 = !DILocalVariable(name: "i", scope: !69, file: !1, line: 250, type: !9)
!81 = !DILocalVariable(name: "_4", scope: !69, file: !1, line: 251, type: !9)
!82 = !DILocalVariable(name: "_5", scope: !69, file: !1, line: 252, type: !22)
!83 = !DILocalVariable(name: "_5_size", scope: !69, file: !1, line: 252, type: !9)
!84 = !DILocalVariable(name: "_5_has_ownership", scope: !69, file: !1, line: 253, type: !23)
!85 = !DILocalVariable(name: "_6", scope: !69, file: !1, line: 254, type: !9)
!86 = !DILocalVariable(name: "_7", scope: !69, file: !1, line: 255, type: !9)
!87 = !DILocalVariable(name: "_8", scope: !69, file: !1, line: 256, type: !9)
!88 = !DILocalVariable(name: "_9", scope: !69, file: !1, line: 257, type: !9)
!89 = !DILocalVariable(name: "_10", scope: !69, file: !1, line: 258, type: !9)
!90 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 302, type: !91, isLocal: false, isDefinition: true, scopeLine: 302, flags: DIFlagPrototyped, isOptimized: true, variables: !97)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !93, !94}
!93 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64, align: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64, align: 64)
!96 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!97 = !{!98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142}
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !1, line: 302, type: !93)
!99 = !DILocalVariable(name: "args", arg: 2, scope: !90, file: !1, line: 302, type: !94)
!100 = !DILocalVariable(name: "max", scope: !90, file: !1, line: 303, type: !22)
!101 = !DILocalVariable(name: "n", scope: !90, file: !1, line: 304, type: !9)
!102 = !DILocalVariable(name: "data", scope: !90, file: !1, line: 305, type: !22)
!103 = !DILocalVariable(name: "data_size", scope: !90, file: !1, line: 305, type: !9)
!104 = !DILocalVariable(name: "data_has_ownership", scope: !90, file: !1, line: 306, type: !23)
!105 = !DILocalVariable(name: "gcds", scope: !90, file: !1, line: 307, type: !22)
!106 = !DILocalVariable(name: "gcds_size", scope: !90, file: !1, line: 307, type: !9)
!107 = !DILocalVariable(name: "gcds_has_ownership", scope: !90, file: !1, line: 308, type: !23)
!108 = !DILocalVariable(name: "sum", scope: !90, file: !1, line: 309, type: !9)
!109 = !DILocalVariable(name: "i", scope: !90, file: !1, line: 310, type: !9)
!110 = !DILocalVariable(name: "j", scope: !90, file: !1, line: 311, type: !9)
!111 = !DILocalVariable(name: "_8", scope: !90, file: !1, line: 312, type: !22)
!112 = !DILocalVariable(name: "_9", scope: !90, file: !1, line: 313, type: !113)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!114 = !DILocalVariable(name: "_9_size", scope: !90, file: !1, line: 313, type: !9)
!115 = !DILocalVariable(name: "_9_size_size", scope: !90, file: !1, line: 313, type: !9)
!116 = !DILocalVariable(name: "_9_has_ownership", scope: !90, file: !1, line: 314, type: !23)
!117 = !DILocalVariable(name: "_10", scope: !90, file: !1, line: 315, type: !9)
!118 = !DILocalVariable(name: "_11", scope: !90, file: !1, line: 316, type: !22)
!119 = !DILocalVariable(name: "_11_size", scope: !90, file: !1, line: 316, type: !9)
!120 = !DILocalVariable(name: "_11_has_ownership", scope: !90, file: !1, line: 317, type: !23)
!121 = !DILocalVariable(name: "_12", scope: !90, file: !1, line: 318, type: !22)
!122 = !DILocalVariable(name: "_12_size", scope: !90, file: !1, line: 318, type: !9)
!123 = !DILocalVariable(name: "_12_has_ownership", scope: !90, file: !1, line: 319, type: !23)
!124 = !DILocalVariable(name: "_13", scope: !90, file: !1, line: 320, type: !22)
!125 = !DILocalVariable(name: "_13_size", scope: !90, file: !1, line: 320, type: !9)
!126 = !DILocalVariable(name: "_13_has_ownership", scope: !90, file: !1, line: 321, type: !23)
!127 = !DILocalVariable(name: "_14", scope: !90, file: !1, line: 322, type: !9)
!128 = !DILocalVariable(name: "_15", scope: !90, file: !1, line: 323, type: !9)
!129 = !DILocalVariable(name: "_16", scope: !90, file: !1, line: 324, type: !9)
!130 = !DILocalVariable(name: "_17", scope: !90, file: !1, line: 325, type: !9)
!131 = !DILocalVariable(name: "_18", scope: !90, file: !1, line: 326, type: !9)
!132 = !DILocalVariable(name: "_19", scope: !90, file: !1, line: 327, type: !9)
!133 = !DILocalVariable(name: "_20", scope: !90, file: !1, line: 328, type: !9)
!134 = !DILocalVariable(name: "_21", scope: !90, file: !1, line: 329, type: !9)
!135 = !DILocalVariable(name: "_22", scope: !90, file: !1, line: 330, type: !9)
!136 = !DILocalVariable(name: "_23", scope: !90, file: !1, line: 331, type: !9)
!137 = !DILocalVariable(name: "_24", scope: !90, file: !1, line: 332, type: !9)
!138 = !DILocalVariable(name: "_25", scope: !90, file: !1, line: 333, type: !4)
!139 = !DILocalVariable(name: "_27", scope: !90, file: !1, line: 334, type: !22)
!140 = !DILocalVariable(name: "_27_size", scope: !90, file: !1, line: 334, type: !9)
!141 = !DILocalVariable(name: "_27_has_ownership", scope: !90, file: !1, line: 335, type: !23)
!142 = !DILocalVariable(name: "_28", scope: !90, file: !1, line: 336, type: !4)
!143 = !{i32 2, !"Dwarf Version", i32 4}
!144 = !{i32 2, !"Debug Info Version", i32 3}
!145 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!146 = !DIExpression()
!147 = !DILocation(line: 2, column: 25, scope: !6)
!148 = !DILocation(line: 2, column: 38, scope: !6)
!149 = !DILocation(line: 3, column: 12, scope: !6)
!150 = !DILocation(line: 4, column: 12, scope: !6)
!151 = !DILocation(line: 5, column: 12, scope: !6)
!152 = !DILocation(line: 6, column: 12, scope: !6)
!153 = !DILocation(line: 7, column: 12, scope: !6)
!154 = !DILocation(line: 8, column: 12, scope: !6)
!155 = !DILocation(line: 12, column: 6, scope: !156)
!156 = distinct !DILexicalBlock(scope: !6, file: !1, line: 12, column: 5)
!157 = !DILocation(line: 12, column: 5, scope: !6)
!158 = !DILocation(line: 24, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !160, file: !1, line: 24, column: 7)
!160 = distinct !DILexicalBlock(scope: !161, file: !1, line: 20, column: 3)
!161 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 13)
!162 = !DILocation(line: 24, column: 7, scope: !160)
!163 = !DILocation(line: 35, column: 7, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !1, line: 35, column: 6)
!165 = !DILocation(line: 35, column: 6, scope: !161)
!166 = !DILocation(line: 26, column: 12, scope: !160)
!167 = !{!168, !168, i64 0}
!168 = !{!"any pointer", !169, i64 0}
!169 = !{!"omnipotent char", !170, i64 0}
!170 = !{!"Simple C/C++ TBAA"}
!171 = !DILocation(line: 26, column: 4, scope: !160)
!172 = !DILocation(line: 27, column: 4, scope: !160)
!173 = !DILocation(line: 37, column: 7, scope: !174)
!174 = distinct !DILexicalBlock(scope: !161, file: !1, line: 37, column: 6)
!175 = !DILocation(line: 37, column: 6, scope: !161)
!176 = !DILocation(line: 39, column: 7, scope: !161)
!177 = !DILocation(line: 47, column: 7, scope: !161)
!178 = !DILocation(line: 60, column: 1, scope: !6)
!179 = !DILocation(line: 62, column: 22, scope: !19)
!180 = !DIExpression(DW_OP_bit_piece, 0, 1)
!181 = !DILocation(line: 62, column: 49, scope: !19)
!182 = !DILocation(line: 62, column: 88, scope: !19)
!183 = !DILocation(line: 63, column: 2, scope: !19)
!184 = !DILocation(line: 64, column: 2, scope: !19)
!185 = !DILocation(line: 65, column: 2, scope: !19)
!186 = !DILocation(line: 66, column: 2, scope: !19)
!187 = !DILocation(line: 67, column: 12, scope: !19)
!188 = !DILocation(line: 68, column: 12, scope: !19)
!189 = !DILocation(line: 69, column: 12, scope: !19)
!190 = !DILocation(line: 70, column: 12, scope: !19)
!191 = !DILocation(line: 71, column: 12, scope: !19)
!192 = !DILocation(line: 72, column: 12, scope: !19)
!193 = !DILocation(line: 73, column: 2, scope: !19)
!194 = !DILocation(line: 74, column: 2, scope: !19)
!195 = !DILocation(line: 75, column: 12, scope: !19)
!196 = !DILocation(line: 76, column: 12, scope: !19)
!197 = !DILocation(line: 77, column: 12, scope: !19)
!198 = !DILocation(line: 78, column: 12, scope: !19)
!199 = !DILocation(line: 79, column: 12, scope: !19)
!200 = !DILocation(line: 80, column: 12, scope: !19)
!201 = !DILocation(line: 81, column: 12, scope: !19)
!202 = !DILocation(line: 82, column: 12, scope: !19)
!203 = !DILocation(line: 83, column: 12, scope: !19)
!204 = !DILocation(line: 84, column: 12, scope: !19)
!205 = !DILocation(line: 85, column: 12, scope: !19)
!206 = !DILocation(line: 86, column: 12, scope: !19)
!207 = !DILocation(line: 87, column: 12, scope: !19)
!208 = !DILocation(line: 88, column: 12, scope: !19)
!209 = !DILocation(line: 89, column: 12, scope: !19)
!210 = !DILocation(line: 90, column: 12, scope: !19)
!211 = !DILocation(line: 91, column: 12, scope: !19)
!212 = !DILocation(line: 92, column: 12, scope: !19)
!213 = !DILocation(line: 93, column: 12, scope: !19)
!214 = !DILocation(line: 94, column: 12, scope: !19)
!215 = !DILocation(line: 95, column: 12, scope: !19)
!216 = !DILocation(line: 96, column: 12, scope: !19)
!217 = !DILocation(line: 97, column: 12, scope: !19)
!218 = !DILocation(line: 98, column: 12, scope: !19)
!219 = !DILocation(line: 99, column: 12, scope: !19)
!220 = !DILocation(line: 103, column: 6, scope: !19)
!221 = !DILocation(line: 106, column: 2, scope: !19)
!222 = !DILocation(line: 120, column: 7, scope: !223)
!223 = distinct !DILexicalBlock(scope: !224, file: !1, line: 120, column: 6)
!224 = distinct !DILexicalBlock(scope: !19, file: !1, line: 118, column: 13)
!225 = !DILocation(line: 120, column: 6, scope: !224)
!226 = !DILocation(line: 130, column: 8, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !1, line: 126, column: 14)
!228 = !DILocation(line: 142, column: 9, scope: !227)
!229 = !{!230, !230, i64 0}
!230 = !{!"long long", !169, i64 0}
!231 = !DILocation(line: 134, column: 8, scope: !227)
!232 = !DILocation(line: 140, column: 8, scope: !233)
!233 = distinct !DILexicalBlock(scope: !227, file: !1, line: 140, column: 7)
!234 = !DILocation(line: 140, column: 7, scope: !227)
!235 = !DILocation(line: 166, column: 10, scope: !236)
!236 = distinct !DILexicalBlock(scope: !237, file: !1, line: 166, column: 9)
!237 = distinct !DILexicalBlock(scope: !238, file: !1, line: 162, column: 5)
!238 = distinct !DILexicalBlock(scope: !227, file: !1, line: 160, column: 15)
!239 = !DILocation(line: 166, column: 9, scope: !237)
!240 = !DILocation(line: 177, column: 9, scope: !241)
!241 = distinct !DILexicalBlock(scope: !238, file: !1, line: 177, column: 8)
!242 = !DILocation(line: 177, column: 8, scope: !238)
!243 = !DILocation(line: 179, column: 9, scope: !244)
!244 = distinct !DILexicalBlock(scope: !238, file: !1, line: 179, column: 8)
!245 = !DILocation(line: 179, column: 8, scope: !238)
!246 = !DILocation(line: 189, column: 10, scope: !238)
!247 = !DILocation(line: 181, column: 10, scope: !238)
!248 = !DILocation(line: 202, column: 11, scope: !227)
!249 = !DILocation(line: 204, column: 8, scope: !227)
!250 = !DILocation(line: 206, column: 11, scope: !227)
!251 = !DILocation(line: 212, column: 14, scope: !227)
!252 = !DILocation(line: 212, column: 4, scope: !227)
!253 = !DILocation(line: 144, column: 11, scope: !227)
!254 = !DILocation(line: 146, column: 8, scope: !227)
!255 = !DILocation(line: 148, column: 11, scope: !227)
!256 = !DILocation(line: 154, column: 14, scope: !227)
!257 = !DILocation(line: 156, column: 4, scope: !227)
!258 = !DILocation(line: 218, column: 9, scope: !227)
!259 = !DILocation(line: 128, column: 8, scope: !260)
!260 = distinct !DILexicalBlock(scope: !227, file: !1, line: 128, column: 7)
!261 = !DILocation(line: 128, column: 7, scope: !227)
!262 = !DILocation(line: 229, column: 8, scope: !224)
!263 = !DILocation(line: 168, column: 14, scope: !237)
!264 = !DILocation(line: 168, column: 6, scope: !237)
!265 = !DILocation(line: 169, column: 6, scope: !237)
!266 = !DILocation(line: 238, column: 2, scope: !19)
!267 = !DILocation(line: 238, column: 2, scope: !268)
!268 = !DILexicalBlockFile(scope: !269, file: !1, discriminator: 1)
!269 = distinct !DILexicalBlock(scope: !270, file: !1, line: 238, column: 2)
!270 = distinct !DILexicalBlock(scope: !19, file: !1, line: 238, column: 2)
!271 = !DILocation(line: 241, column: 2, scope: !19)
!272 = !DILocation(line: 245, column: 27, scope: !69)
!273 = !DILocation(line: 246, column: 2, scope: !69)
!274 = !DILocation(line: 247, column: 2, scope: !69)
!275 = !DILocation(line: 248, column: 2, scope: !69)
!276 = !DILocation(line: 249, column: 2, scope: !69)
!277 = !DILocation(line: 250, column: 12, scope: !69)
!278 = !DILocation(line: 251, column: 12, scope: !69)
!279 = !DILocation(line: 252, column: 2, scope: !69)
!280 = !DILocation(line: 253, column: 2, scope: !69)
!281 = !DILocation(line: 254, column: 12, scope: !69)
!282 = !DILocation(line: 255, column: 12, scope: !69)
!283 = !DILocation(line: 256, column: 12, scope: !69)
!284 = !DILocation(line: 257, column: 12, scope: !69)
!285 = !DILocation(line: 258, column: 12, scope: !69)
!286 = !DILocation(line: 263, column: 2, scope: !69)
!287 = !DILocation(line: 277, column: 7, scope: !288)
!288 = distinct !DILexicalBlock(scope: !289, file: !1, line: 277, column: 6)
!289 = distinct !DILexicalBlock(scope: !69, file: !1, line: 275, column: 13)
!290 = !DILocation(line: 277, column: 6, scope: !289)
!291 = !DILocation(line: 279, column: 6, scope: !289)
!292 = !DILocation(line: 281, column: 8, scope: !289)
!293 = !DILocation(line: 283, column: 11, scope: !289)
!294 = !DILocation(line: 287, column: 8, scope: !289)
!295 = distinct !{!295, !296, !297}
!296 = !{!"llvm.loop.vectorize.width", i32 1}
!297 = !{!"llvm.loop.interleave.count", i32 1}
!298 = distinct !{!298, !299, !296, !297}
!299 = !{!"llvm.loop.unroll.runtime.disable"}
!300 = !DILocation(line: 298, column: 2, scope: !69)
!301 = !DILocation(line: 302, column: 14, scope: !90)
!302 = !DILocation(line: 302, column: 27, scope: !90)
!303 = !DILocation(line: 304, column: 12, scope: !90)
!304 = !DILocation(line: 305, column: 2, scope: !90)
!305 = !DILocation(line: 306, column: 2, scope: !90)
!306 = !DILocation(line: 307, column: 2, scope: !90)
!307 = !DILocation(line: 308, column: 2, scope: !90)
!308 = !DILocation(line: 309, column: 12, scope: !90)
!309 = !DILocation(line: 310, column: 12, scope: !90)
!310 = !DILocation(line: 311, column: 12, scope: !90)
!311 = !DILocation(line: 313, column: 2, scope: !90)
!312 = !DILocation(line: 314, column: 2, scope: !90)
!313 = !DILocation(line: 315, column: 12, scope: !90)
!314 = !DILocation(line: 316, column: 2, scope: !90)
!315 = !DILocation(line: 317, column: 2, scope: !90)
!316 = !DILocation(line: 318, column: 2, scope: !90)
!317 = !DILocation(line: 319, column: 2, scope: !90)
!318 = !DILocation(line: 320, column: 2, scope: !90)
!319 = !DILocation(line: 321, column: 2, scope: !90)
!320 = !DILocation(line: 322, column: 12, scope: !90)
!321 = !DILocation(line: 323, column: 12, scope: !90)
!322 = !DILocation(line: 324, column: 12, scope: !90)
!323 = !DILocation(line: 325, column: 12, scope: !90)
!324 = !DILocation(line: 326, column: 12, scope: !90)
!325 = !DILocation(line: 327, column: 12, scope: !90)
!326 = !DILocation(line: 328, column: 12, scope: !90)
!327 = !DILocation(line: 329, column: 12, scope: !90)
!328 = !DILocation(line: 330, column: 12, scope: !90)
!329 = !DILocation(line: 331, column: 12, scope: !90)
!330 = !DILocation(line: 332, column: 12, scope: !90)
!331 = !DILocation(line: 334, column: 2, scope: !90)
!332 = !DILocation(line: 335, column: 2, scope: !90)
!333 = !DILocation(line: 338, column: 2, scope: !90)
!334 = !DILocation(line: 343, column: 6, scope: !90)
!335 = !DILocation(line: 345, column: 2, scope: !90)
!336 = !DILocation(line: 312, column: 13, scope: !90)
!337 = !DILocation(line: 303, column: 13, scope: !90)
!338 = !DILocation(line: 349, column: 9, scope: !339)
!339 = distinct !DILexicalBlock(scope: !90, file: !1, line: 349, column: 5)
!340 = !DILocation(line: 349, column: 5, scope: !90)
!341 = !DILocation(line: 351, column: 6, scope: !90)
!342 = !DILocation(line: 245, column: 27, scope: !69, inlinedAt: !343)
!343 = distinct !DILocation(line: 354, column: 8, scope: !90)
!344 = !DILocation(line: 246, column: 2, scope: !69, inlinedAt: !343)
!345 = !DILocation(line: 247, column: 2, scope: !69, inlinedAt: !343)
!346 = !DILocation(line: 248, column: 2, scope: !69, inlinedAt: !343)
!347 = !DILocation(line: 249, column: 2, scope: !69, inlinedAt: !343)
!348 = !DILocation(line: 250, column: 12, scope: !69, inlinedAt: !343)
!349 = !DILocation(line: 251, column: 12, scope: !69, inlinedAt: !343)
!350 = !DILocation(line: 252, column: 2, scope: !69, inlinedAt: !343)
!351 = !DILocation(line: 253, column: 2, scope: !69, inlinedAt: !343)
!352 = !DILocation(line: 254, column: 12, scope: !69, inlinedAt: !343)
!353 = !DILocation(line: 255, column: 12, scope: !69, inlinedAt: !343)
!354 = !DILocation(line: 256, column: 12, scope: !69, inlinedAt: !343)
!355 = !DILocation(line: 257, column: 12, scope: !69, inlinedAt: !343)
!356 = !DILocation(line: 258, column: 12, scope: !69, inlinedAt: !343)
!357 = !DILocation(line: 263, column: 2, scope: !69, inlinedAt: !343)
!358 = !DILocation(line: 277, column: 7, scope: !288, inlinedAt: !343)
!359 = !DILocation(line: 277, column: 6, scope: !289, inlinedAt: !343)
!360 = !DILocation(line: 279, column: 6, scope: !289, inlinedAt: !343)
!361 = !DILocation(line: 354, column: 8, scope: !90)
!362 = !DILocation(line: 281, column: 8, scope: !289, inlinedAt: !343)
!363 = !DILocation(line: 283, column: 11, scope: !289, inlinedAt: !343)
!364 = distinct !{!364, !296, !297}
!365 = !DILocation(line: 365, column: 8, scope: !90)
!366 = !DILocation(line: 383, column: 6, scope: !367)
!367 = distinct !DILexicalBlock(scope: !90, file: !1, line: 381, column: 13)
!368 = !DILocation(line: 287, column: 8, scope: !289, inlinedAt: !343)
!369 = distinct !{!369, !299, !296, !297}
!370 = !DILocation(line: 393, column: 9, scope: !371)
!371 = distinct !DILexicalBlock(scope: !367, file: !1, line: 389, column: 14)
!372 = !DILocation(line: 397, column: 8, scope: !371)
!373 = !DILocation(line: 405, column: 9, scope: !371)
!374 = !DILocation(line: 399, column: 11, scope: !371)
!375 = distinct !{!375, !376}
!376 = !{!"llvm.loop.unroll.disable"}
!377 = distinct !{!377, !296, !297}
!378 = !DILocation(line: 395, column: 11, scope: !371)
!379 = !DILocation(line: 391, column: 7, scope: !371)
!380 = distinct !{!380, !299, !296, !297}
!381 = !DILocation(line: 416, column: 8, scope: !367)
!382 = !DILocation(line: 428, column: 2, scope: !90)
!383 = !DILocation(line: 429, column: 9, scope: !90)
!384 = !DILocation(line: 429, column: 28, scope: !90)
!385 = !DILocation(line: 429, column: 35, scope: !90)
!386 = !DILocation(line: 432, column: 2, scope: !90)
!387 = !DILocation(line: 436, column: 2, scope: !90)
!388 = !DILocation(line: 440, column: 2, scope: !389)
!389 = !DILexicalBlockFile(scope: !390, file: !1, discriminator: 1)
!390 = distinct !DILexicalBlock(scope: !391, file: !1, line: 440, column: 2)
!391 = distinct !DILexicalBlock(scope: !90, file: !1, line: 440, column: 2)
!392 = !DILocation(line: 441, column: 2, scope: !393)
!393 = !DILexicalBlockFile(scope: !394, file: !1, discriminator: 1)
!394 = distinct !DILexicalBlock(scope: !395, file: !1, line: 441, column: 2)
!395 = distinct !DILexicalBlock(scope: !90, file: !1, line: 441, column: 2)
!396 = !DILocation(line: 442, column: 2, scope: !397)
!397 = !DILexicalBlockFile(scope: !398, file: !1, discriminator: 1)
!398 = distinct !DILexicalBlock(scope: !399, file: !1, line: 442, column: 2)
!399 = distinct !DILexicalBlock(scope: !90, file: !1, line: 442, column: 2)
!400 = !DILocation(line: 446, column: 2, scope: !401)
!401 = !DILexicalBlockFile(scope: !402, file: !1, discriminator: 1)
!402 = distinct !DILexicalBlock(scope: !403, file: !1, line: 446, column: 2)
!403 = distinct !DILexicalBlock(scope: !90, file: !1, line: 446, column: 2)
!404 = !DILocation(line: 447, column: 2, scope: !90)
