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
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !11, metadata !131), !dbg !132
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !12, metadata !131), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !13, metadata !131), !dbg !134
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !131), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !131), !dbg !136
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !16, metadata !131), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !17, metadata !131), !dbg !138
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !18, metadata !131), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !131), !dbg !135
  %cmp = icmp eq i64 %a, 0, !dbg !140
  br i1 %cmp, label %cleanup, label %while.cond.preheader, !dbg !142

while.cond.preheader:                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !131), !dbg !136
  %cmp13234 = icmp sgt i64 %a, -1, !dbg !143
  br i1 %cmp13234, label %blklab4.lr.ph.preheader, label %if.end3, !dbg !147

blklab4.lr.ph.preheader:                          ; preds = %while.cond.preheader
  %cmp447 = icmp eq i64 %b, 0, !dbg !148
  br i1 %cmp447, label %cleanup, label %blklab4.preheader.preheader, !dbg !150

blklab4.preheader.preheader:                      ; preds = %blklab4.lr.ph.preheader
  br label %blklab4.preheader, !dbg !137

blklab4.preheader:                                ; preds = %blklab4.preheader.preheader, %blklab5
  %b.addr.0.ph3549 = phi i64 [ %sub10, %blklab5 ], [ %b, %blklab4.preheader.preheader ]
  %a.addr.0.ph3648 = phi i64 [ %a.addr.033.lcssa, %blklab5 ], [ %a, %blklab4.preheader.preheader ]
  br label %blklab4, !dbg !137

if.end3.loopexit:                                 ; preds = %if.end9
  br label %if.end3, !dbg !151

if.end3:                                          ; preds = %if.end3.loopexit, %while.cond.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !151, !tbaa !152
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #7, !dbg !156
  tail call void @exit(i32 -1) #8, !dbg !157
  unreachable, !dbg !157

blklab4:                                          ; preds = %blklab4.preheader, %if.end9
  %a.addr.033 = phi i64 [ %sub, %if.end9 ], [ %a.addr.0.ph3648, %blklab4.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !16, metadata !131), !dbg !137
  %cmp7 = icmp sgt i64 %a.addr.033, %b.addr.0.ph3549, !dbg !158
  br i1 %cmp7, label %if.end9, label %blklab5, !dbg !160

if.end9:                                          ; preds = %blklab4
  %sub = sub nsw i64 %a.addr.033, %b.addr.0.ph3549, !dbg !161
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !17, metadata !131), !dbg !138
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !11, metadata !131), !dbg !132
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !131), !dbg !136
  %cmp1 = icmp sgt i64 %sub, -1, !dbg !143
  br i1 %cmp1, label %blklab4, label %if.end3.loopexit, !dbg !147

blklab5:                                          ; preds = %blklab4
  %a.addr.033.lcssa = phi i64 [ %a.addr.033, %blklab4 ]
  %sub10 = sub nsw i64 %b.addr.0.ph3549, %a.addr.033.lcssa, !dbg !162
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !18, metadata !131), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !12, metadata !131), !dbg !133
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !131), !dbg !136
  %cmp4 = icmp eq i64 %sub10, 0, !dbg !148
  br i1 %cmp4, label %cleanup.loopexit, label %blklab4.preheader, !dbg !150

cleanup.loopexit:                                 ; preds = %blklab5
  %a.addr.033.lcssa.lcssa = phi i64 [ %a.addr.033.lcssa, %blklab5 ]
  br label %cleanup, !dbg !163

cleanup:                                          ; preds = %cleanup.loopexit, %blklab4.lr.ph.preheader, %entry
  %retval.0 = phi i64 [ %b, %entry ], [ %a, %blklab4.lr.ph.preheader ], [ %a.addr.033.lcssa.lcssa, %cleanup.loopexit ]
  ret i64 %retval.0, !dbg !163
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i64* @gcd_array(i64* nocapture readonly %data, i64 %data_size, i64 %n) #0 !dbg !19 {
entry:
  tail call void @llvm.dbg.value(metadata i64* %data, i64 0, metadata !24, metadata !131), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 %data_size, i64 0, metadata !25, metadata !131), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !26, metadata !131), !dbg !165
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !27, metadata !131), !dbg !166
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !28, metadata !131), !dbg !166
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !29, metadata !131), !dbg !167
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !30, metadata !131), !dbg !167
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !131), !dbg !168
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !131), !dbg !169
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !131), !dbg !170
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !131), !dbg !171
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !131), !dbg !172
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !131), !dbg !173
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !37, metadata !131), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !131), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !131), !dbg !175
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !131), !dbg !176
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !131), !dbg !177
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !131), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !131), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !131), !dbg !180
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !131), !dbg !181
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !131), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !47, metadata !131), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !48, metadata !131), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !49, metadata !131), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !131), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !131), !dbg !187
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !131), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !53, metadata !131), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !131), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !131), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !131), !dbg !192
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !57, metadata !131), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !58, metadata !131), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !59, metadata !131), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !60, metadata !131), !dbg !196
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !131), !dbg !197
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !62, metadata !131), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !131), !dbg !199
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !131), !dbg !172
  %mul = mul nsw i64 %n, %n, !dbg !200
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !36, metadata !131), !dbg !173
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !38, metadata !131), !dbg !174
  %conv1 = trunc i64 %mul to i32, !dbg !201
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #6, !dbg !201
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !37, metadata !131), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !30, metadata !131), !dbg !167
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !29, metadata !131), !dbg !167
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !131), !dbg !175
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !131), !dbg !168
  %cmp126 = icmp sgt i64 %n, 0, !dbg !202
  br i1 %cmp126, label %while.cond3.preheader.us.preheader, label %blklab7, !dbg !205

while.cond3.preheader.us.preheader:               ; preds = %entry
  br label %while.cond3.preheader.us, !dbg !206

while.cond3.preheader.us:                         ; preds = %while.cond3.preheader.us.preheader, %blklab9.loopexit.us
  %i.0127.us = phi i64 [ %add44.us, %blklab9.loopexit.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %arrayidx.us = getelementptr inbounds i64, i64* %data, i64 %i.0127.us, !dbg !206
  %mul14.us = mul nsw i64 %i.0127.us, %n, !dbg !208
  br label %if.end8.us, !dbg !206

if.end8.us:                                       ; preds = %while.cond3.preheader.us, %blklab12.us
  %j.0124.us = phi i64 [ %add43.us, %blklab12.us ], [ 0, %while.cond3.preheader.us ]
  %0 = load i64, i64* %arrayidx.us, align 8, !dbg !206, !tbaa !209
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !41, metadata !131), !dbg !177
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !33, metadata !131), !dbg !170
  %arrayidx9.us = getelementptr inbounds i64, i64* %data, i64 %j.0124.us, !dbg !211
  %1 = load i64, i64* %arrayidx9.us, align 8, !dbg !211, !tbaa !209
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !42, metadata !131), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !34, metadata !131), !dbg !171
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !131), !dbg !179
  %cmp10.us = icmp eq i64 %0, 0, !dbg !212
  br i1 %cmp10.us, label %if.end13.us, label %while.cond20.preheader.us, !dbg !214

while.cond20.preheader.us:                        ; preds = %if.end8.us
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !131), !dbg !186
  %cmp22118120.us = icmp sgt i64 %0, -1, !dbg !215
  br i1 %cmp22118120.us, label %blklab15.lr.ph.us.preheader, label %if.end25.loopexit158, !dbg !219

blklab15.lr.ph.us.preheader:                      ; preds = %while.cond20.preheader.us
  %cmp27.us155 = icmp eq i64 %1, 0, !dbg !220
  br i1 %cmp27.us155, label %blklab13.us-lcssa.us.us, label %blklab15.us134.preheader.preheader, !dbg !222

blklab15.us134.preheader.preheader:               ; preds = %blklab15.lr.ph.us.preheader
  br label %blklab15.us134.preheader, !dbg !187

blklab15.us134.preheader:                         ; preds = %blklab15.us134.preheader.preheader, %blklab16.us-lcssa.us144
  %b.0.ph121.us157 = phi i64 [ %sub35.us, %blklab16.us-lcssa.us144 ], [ %1, %blklab15.us134.preheader.preheader ]
  %a.0.ph122.us156 = phi i64 [ %a.0119.us135.lcssa, %blklab16.us-lcssa.us144 ], [ %0, %blklab15.us134.preheader.preheader ]
  br label %blklab15.us134, !dbg !187

blklab15.us134:                                   ; preds = %blklab15.us134.preheader, %if.end34.us138
  %a.0119.us135 = phi i64 [ %sub.us139, %if.end34.us138 ], [ %a.0.ph122.us156, %blklab15.us134.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !131), !dbg !187
  %cmp31.us137 = icmp sgt i64 %a.0119.us135, %b.0.ph121.us157, !dbg !223
  br i1 %cmp31.us137, label %if.end34.us138, label %blklab16.us-lcssa.us144, !dbg !225

if.end34.us138:                                   ; preds = %blklab15.us134
  %sub.us139 = sub nsw i64 %a.0119.us135, %b.0.ph121.us157, !dbg !226
  tail call void @llvm.dbg.value(metadata i64 %sub.us139, i64 0, metadata !52, metadata !131), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 %sub.us139, i64 0, metadata !33, metadata !131), !dbg !170
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !131), !dbg !186
  %cmp22.us140 = icmp sgt i64 %sub.us139, -1, !dbg !215
  br i1 %cmp22.us140, label %blklab15.us134, label %if.end25.loopexit, !dbg !219

if.end13.us:                                      ; preds = %if.end8.us
  tail call void @llvm.dbg.value(metadata i64 %mul14.us, i64 0, metadata !44, metadata !131), !dbg !180
  %add.us = add nsw i64 %j.0124.us, %mul14.us, !dbg !227
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !45, metadata !131), !dbg !181
  %arrayidx15.us = getelementptr inbounds i64, i64* %call, i64 %add.us, !dbg !228
  %2 = load i64, i64* %arrayidx15.us, align 8, !dbg !228, !tbaa !209
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !46, metadata !131), !dbg !182
  %add16.us = add nsw i64 %2, %1, !dbg !229
  tail call void @llvm.dbg.value(metadata i64 %add16.us, i64 0, metadata !47, metadata !131), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 %mul14.us, i64 0, metadata !48, metadata !131), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !49, metadata !131), !dbg !185
  store i64 %add16.us, i64* %arrayidx15.us, align 8, !dbg !230, !tbaa !209
  br label %blklab12.us, !dbg !231

blklab12.us:                                      ; preds = %if.end13.us, %blklab13.us-lcssa.us.us
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !60, metadata !131), !dbg !196
  %add43.us = add nuw nsw i64 %j.0124.us, 1, !dbg !232
  tail call void @llvm.dbg.value(metadata i64 %add43.us, i64 0, metadata !61, metadata !131), !dbg !197
  tail call void @llvm.dbg.value(metadata i64 %add43.us, i64 0, metadata !32, metadata !131), !dbg !169
  %cmp5.us = icmp slt i64 %add43.us, %n, !dbg !233
  br i1 %cmp5.us, label %if.end8.us, label %blklab9.loopexit.us, !dbg !235

blklab9.loopexit.us:                              ; preds = %blklab12.us
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !62, metadata !131), !dbg !198
  %add44.us = add nuw nsw i64 %i.0127.us, 1, !dbg !236
  tail call void @llvm.dbg.value(metadata i64 %add44.us, i64 0, metadata !63, metadata !131), !dbg !199
  tail call void @llvm.dbg.value(metadata i64 %add44.us, i64 0, metadata !31, metadata !131), !dbg !168
  %cmp.us = icmp slt i64 %add44.us, %n, !dbg !202
  br i1 %cmp.us, label %while.cond3.preheader.us, label %blklab7.loopexit, !dbg !205

blklab16.us-lcssa.us144:                          ; preds = %blklab15.us134
  %a.0119.us135.lcssa = phi i64 [ %a.0119.us135, %blklab15.us134 ]
  %sub35.us = sub nsw i64 %b.0.ph121.us157, %a.0119.us135.lcssa, !dbg !237
  tail call void @llvm.dbg.value(metadata i64 %sub35.us, i64 0, metadata !53, metadata !131), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 %sub35.us, i64 0, metadata !34, metadata !131), !dbg !171
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !131), !dbg !186
  %cmp27.us = icmp eq i64 %sub35.us, 0, !dbg !220
  br i1 %cmp27.us, label %blklab13.us-lcssa.us.us.loopexit, label %blklab15.us134.preheader, !dbg !222

blklab13.us-lcssa.us.us.loopexit:                 ; preds = %blklab16.us-lcssa.us144
  %a.0119.us135.lcssa.lcssa = phi i64 [ %a.0119.us135.lcssa, %blklab16.us-lcssa.us144 ]
  br label %blklab13.us-lcssa.us.us, !dbg !187

blklab13.us-lcssa.us.us:                          ; preds = %blklab13.us-lcssa.us.us.loopexit, %blklab15.lr.ph.us.preheader
  %a.0.ph122.us.lcssa = phi i64 [ %0, %blklab15.lr.ph.us.preheader ], [ %a.0119.us135.lcssa.lcssa, %blklab13.us-lcssa.us.us.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !131), !dbg !187
  tail call void @llvm.dbg.value(metadata i64 %mul14.us, i64 0, metadata !54, metadata !131), !dbg !190
  %add37.us = add nsw i64 %j.0124.us, %mul14.us, !dbg !238
  tail call void @llvm.dbg.value(metadata i64 %add37.us, i64 0, metadata !55, metadata !131), !dbg !191
  %arrayidx38.us = getelementptr inbounds i64, i64* %call, i64 %add37.us, !dbg !239
  %3 = load i64, i64* %arrayidx38.us, align 8, !dbg !239, !tbaa !209
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !56, metadata !131), !dbg !192
  %add39.us = add nsw i64 %3, %a.0.ph122.us.lcssa, !dbg !240
  tail call void @llvm.dbg.value(metadata i64 %add39.us, i64 0, metadata !57, metadata !131), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 %mul14.us, i64 0, metadata !58, metadata !131), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 %add37.us, i64 0, metadata !59, metadata !131), !dbg !195
  store i64 %add39.us, i64* %arrayidx38.us, align 8, !dbg !241, !tbaa !209
  br label %blklab12.us, !dbg !242

if.end25.loopexit:                                ; preds = %if.end34.us138
  br label %if.end25, !dbg !243

if.end25.loopexit158:                             ; preds = %while.cond20.preheader.us
  br label %if.end25, !dbg !243

if.end25:                                         ; preds = %if.end25.loopexit158, %if.end25.loopexit
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !243, !tbaa !152
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %4) #7, !dbg !244
  tail call void @exit(i32 -1) #8, !dbg !245
  unreachable, !dbg !245

blklab7.loopexit:                                 ; preds = %blklab9.loopexit.us
  br label %blklab7, !dbg !246

blklab7:                                          ; preds = %blklab7.loopexit, %entry
  ret i64* %call, !dbg !246
}

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !64 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !68, metadata !131), !dbg !247
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !69, metadata !131), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !131), !dbg !248
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !71, metadata !131), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !131), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !131), !dbg !250
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !131), !dbg !251
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !75, metadata !131), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !131), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !131), !dbg !253
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !131), !dbg !254
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !131), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !131), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !131), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !131), !dbg !251
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !76, metadata !131), !dbg !252
  %conv1 = trunc i64 %n to i32, !dbg !258
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #6, !dbg !258
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !75, metadata !131), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !72, metadata !131), !dbg !249
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !71, metadata !131), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !131), !dbg !253
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !131), !dbg !250
  %cmp26 = icmp sgt i64 %n, 0, !dbg !259
  br i1 %cmp26, label %if.end.preheader, label %blklab18, !dbg !262

if.end.preheader:                                 ; preds = %entry
  %min.iters.check = icmp ult i64 %n, 4, !dbg !263
  br i1 %min.iters.check, label %if.end.preheader32, label %min.iters.checked, !dbg !263

min.iters.checked:                                ; preds = %if.end.preheader
  %n.vec = and i64 %n, -4, !dbg !263
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !263
  br i1 %cmp.zero, label %if.end.preheader32, label %vector.body.preheader, !dbg !263

vector.body.preheader:                            ; preds = %min.iters.checked
  %0 = add i64 %n.vec, -4
  %1 = lshr exact i64 %0, 2
  %2 = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %2, 0
  br i1 %lcmp.mod, label %vector.body.prol, label %vector.body.preheader.split

vector.body.prol:                                 ; preds = %vector.body.preheader
  %3 = bitcast i64* %call to <2 x i64>*, !dbg !263
  %wide.load.prol = load <2 x i64>, <2 x i64>* %3, align 8, !dbg !263, !tbaa !209
  %4 = getelementptr i64, i64* %call, i64 2, !dbg !263
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !263
  %wide.load29.prol = load <2 x i64>, <2 x i64>* %5, align 8, !dbg !263, !tbaa !209
  %6 = add nsw <2 x i64> %wide.load.prol, <i64 0, i64 1>, !dbg !264
  %7 = add nsw <2 x i64> %wide.load29.prol, <i64 2, i64 3>, !dbg !264
  %8 = bitcast i64* %call to <2 x i64>*, !dbg !265
  store <2 x i64> %6, <2 x i64>* %8, align 8, !dbg !265, !tbaa !209
  %9 = bitcast i64* %4 to <2 x i64>*, !dbg !265
  store <2 x i64> %7, <2 x i64>* %9, align 8, !dbg !265, !tbaa !209
  br label %vector.body.preheader.split, !dbg !263

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %10 = icmp eq i64 %1, 0
  br i1 %10, label %middle.block, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !266
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction = add <2 x i64> %broadcast.splat, <i64 0, i64 1>
  %induction28 = add <2 x i64> %broadcast.splat, <i64 2, i64 3>
  %11 = getelementptr inbounds i64, i64* %call, i64 %index, !dbg !263
  %12 = bitcast i64* %11 to <2 x i64>*, !dbg !263
  %wide.load = load <2 x i64>, <2 x i64>* %12, align 8, !dbg !263, !tbaa !209
  %13 = getelementptr i64, i64* %11, i64 2, !dbg !263
  %14 = bitcast i64* %13 to <2 x i64>*, !dbg !263
  %wide.load29 = load <2 x i64>, <2 x i64>* %14, align 8, !dbg !263, !tbaa !209
  %15 = add nsw <2 x i64> %wide.load, %induction, !dbg !264
  %16 = add nsw <2 x i64> %wide.load29, %induction28, !dbg !264
  %17 = bitcast i64* %11 to <2 x i64>*, !dbg !265
  store <2 x i64> %15, <2 x i64>* %17, align 8, !dbg !265, !tbaa !209
  %18 = bitcast i64* %13 to <2 x i64>*, !dbg !265
  store <2 x i64> %16, <2 x i64>* %18, align 8, !dbg !265, !tbaa !209
  %index.next = add i64 %index, 4, !dbg !263
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction.1 = add <2 x i64> %broadcast.splat.1, <i64 0, i64 1>
  %induction28.1 = add <2 x i64> %broadcast.splat.1, <i64 2, i64 3>
  %19 = getelementptr inbounds i64, i64* %call, i64 %index.next, !dbg !263
  %20 = bitcast i64* %19 to <2 x i64>*, !dbg !263
  %wide.load.1 = load <2 x i64>, <2 x i64>* %20, align 8, !dbg !263, !tbaa !209
  %21 = getelementptr i64, i64* %19, i64 2, !dbg !263
  %22 = bitcast i64* %21 to <2 x i64>*, !dbg !263
  %wide.load29.1 = load <2 x i64>, <2 x i64>* %22, align 8, !dbg !263, !tbaa !209
  %23 = add nsw <2 x i64> %wide.load.1, %induction.1, !dbg !264
  %24 = add nsw <2 x i64> %wide.load29.1, %induction28.1, !dbg !264
  %25 = bitcast i64* %19 to <2 x i64>*, !dbg !265
  store <2 x i64> %23, <2 x i64>* %25, align 8, !dbg !265, !tbaa !209
  %26 = bitcast i64* %21 to <2 x i64>*, !dbg !265
  store <2 x i64> %24, <2 x i64>* %26, align 8, !dbg !265, !tbaa !209
  %index.next.1 = add i64 %index, 8, !dbg !263
  %27 = icmp eq i64 %index.next.1, %n.vec, !dbg !263
  br i1 %27, label %middle.block.unr-lcssa, label %vector.body, !dbg !263, !llvm.loop !267

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %n.vec, %n
  br i1 %cmp.n, label %blklab18, label %if.end.preheader32, !dbg !263

if.end.preheader32:                               ; preds = %middle.block, %min.iters.checked, %if.end.preheader
  %i.027.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end.preheader ], [ %n.vec, %middle.block ]
  br label %if.end, !dbg !263

if.end:                                           ; preds = %if.end.preheader32, %if.end
  %i.027 = phi i64 [ %add4, %if.end ], [ %i.027.ph, %if.end.preheader32 ]
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %i.027, !dbg !263
  %28 = load i64, i64* %arrayidx, align 8, !dbg !263, !tbaa !209
  tail call void @llvm.dbg.value(metadata i64 %28, i64 0, metadata !78, metadata !131), !dbg !254
  %add = add nsw i64 %28, %i.027, !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !79, metadata !131), !dbg !255
  store i64 %add, i64* %arrayidx, align 8, !dbg !265, !tbaa !209
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !131), !dbg !256
  %add4 = add nuw nsw i64 %i.027, 1, !dbg !266
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !81, metadata !131), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !73, metadata !131), !dbg !250
  %exitcond = icmp eq i64 %add4, %n, !dbg !262
  br i1 %exitcond, label %blklab18.loopexit, label %if.end, !dbg !262, !llvm.loop !270

blklab18.loopexit:                                ; preds = %if.end
  br label %blklab18, !dbg !272

blklab18:                                         ; preds = %blklab18.loopexit, %middle.block, %entry
  ret i64* %call, !dbg !272
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #3 !dbg !82 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !90, metadata !131), !dbg !273
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !91, metadata !131), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !93, metadata !131), !dbg !275
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !94, metadata !131), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !95, metadata !131), !dbg !276
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !96, metadata !131), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !131), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !131), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !99, metadata !131), !dbg !279
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !131), !dbg !280
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !102, metadata !131), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !131), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !105, metadata !131), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !131), !dbg !282
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !107, metadata !131), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !131), !dbg !283
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !109, metadata !131), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !131), !dbg !284
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !111, metadata !131), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !131), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !113, metadata !131), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !131), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !115, metadata !131), !dbg !288
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !131), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !117, metadata !131), !dbg !290
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !118, metadata !131), !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !119, metadata !131), !dbg !292
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !131), !dbg !293
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !121, metadata !131), !dbg !294
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !131), !dbg !295
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !123, metadata !131), !dbg !296
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !125, metadata !131), !dbg !297
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !126, metadata !131), !dbg !297
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6, !dbg !298
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !102, metadata !131), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !131), !dbg !282
  %0 = load i64*, i64** %call, align 8, !dbg !299, !tbaa !152
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !107, metadata !131), !dbg !283
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6, !dbg !300
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !101, metadata !131), !dbg !301
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !92, metadata !131), !dbg !302
  %cmp = icmp eq i64* %call1, null, !dbg !303
  br i1 %cmp, label %blklab20, label %if.end, !dbg !305

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !306, !tbaa !209
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !93, metadata !131), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !68, metadata !131) #6, !dbg !307
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !69, metadata !131) #6, !dbg !309
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !131) #6, !dbg !309
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !71, metadata !131) #6, !dbg !310
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !131) #6, !dbg !310
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !131) #6, !dbg !311
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !131) #6, !dbg !312
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !75, metadata !131) #6, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !131) #6, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !131) #6, !dbg !314
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !131) #6, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !131) #6, !dbg !316
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !131) #6, !dbg !317
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !131) #6, !dbg !318
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !131) #6, !dbg !312
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !76, metadata !131) #6, !dbg !313
  %conv1.i = trunc i64 %1 to i32, !dbg !319
  %call.i = tail call i64* @gen1DArray(i32 0, i32 %conv1.i) #6, !dbg !319
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !75, metadata !131) #6, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !72, metadata !131) #6, !dbg !310
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !71, metadata !131) #6, !dbg !310
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !131) #6, !dbg !314
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !131) #6, !dbg !311
  %cmp26.i = icmp sgt i64 %1, 0, !dbg !320
  br i1 %cmp26.i, label %if.end.i.preheader, label %init.exit.thread, !dbg !321

if.end.i.preheader:                               ; preds = %if.end
  %min.iters.check = icmp ult i64 %1, 4, !dbg !322
  br i1 %min.iters.check, label %if.end.i.preheader80, label %min.iters.checked, !dbg !322

if.end.i.preheader80:                             ; preds = %middle.block, %min.iters.checked, %if.end.i.preheader
  %i.027.i.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end.i.preheader ], [ %n.vec, %middle.block ]
  br label %if.end.i, !dbg !322

min.iters.checked:                                ; preds = %if.end.i.preheader
  %n.vec = and i64 %1, -4, !dbg !322
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !322
  br i1 %cmp.zero, label %if.end.i.preheader80, label %vector.body.preheader, !dbg !322

vector.body.preheader:                            ; preds = %min.iters.checked
  %2 = add i64 %n.vec, -4, !dbg !323
  %3 = lshr exact i64 %2, 2, !dbg !323
  %4 = and i64 %3, 1, !dbg !323
  %lcmp.mod84 = icmp eq i64 %4, 0, !dbg !323
  br i1 %lcmp.mod84, label %vector.body.prol, label %vector.body.preheader.split, !dbg !323

vector.body.prol:                                 ; preds = %vector.body.preheader
  %5 = bitcast i64* %call.i to <2 x i64>*, !dbg !322
  %wide.load.prol = load <2 x i64>, <2 x i64>* %5, align 8, !dbg !322, !tbaa !209
  %6 = getelementptr i64, i64* %call.i, i64 2, !dbg !322
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !322
  %wide.load52.prol = load <2 x i64>, <2 x i64>* %7, align 8, !dbg !322, !tbaa !209
  %8 = add nsw <2 x i64> %wide.load.prol, <i64 0, i64 1>, !dbg !324
  %9 = add nsw <2 x i64> %wide.load52.prol, <i64 2, i64 3>, !dbg !324
  %10 = bitcast i64* %call.i to <2 x i64>*, !dbg !325
  store <2 x i64> %8, <2 x i64>* %10, align 8, !dbg !325, !tbaa !209
  %11 = bitcast i64* %6 to <2 x i64>*, !dbg !325
  store <2 x i64> %9, <2 x i64>* %11, align 8, !dbg !325, !tbaa !209
  br label %vector.body.preheader.split, !dbg !322

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %12 = icmp eq i64 %3, 0, !dbg !323
  br i1 %12, label %middle.block, label %vector.body.preheader.split.split, !dbg !323

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !323

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !323
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0, !dbg !323
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !323
  %induction = add <2 x i64> %broadcast.splat, <i64 0, i64 1>, !dbg !323
  %induction51 = add <2 x i64> %broadcast.splat, <i64 2, i64 3>, !dbg !323
  %13 = getelementptr inbounds i64, i64* %call.i, i64 %index, !dbg !322
  %14 = bitcast i64* %13 to <2 x i64>*, !dbg !322
  %wide.load = load <2 x i64>, <2 x i64>* %14, align 8, !dbg !322, !tbaa !209
  %15 = getelementptr i64, i64* %13, i64 2, !dbg !322
  %16 = bitcast i64* %15 to <2 x i64>*, !dbg !322
  %wide.load52 = load <2 x i64>, <2 x i64>* %16, align 8, !dbg !322, !tbaa !209
  %17 = add nsw <2 x i64> %wide.load, %induction, !dbg !324
  %18 = add nsw <2 x i64> %wide.load52, %induction51, !dbg !324
  %19 = bitcast i64* %13 to <2 x i64>*, !dbg !325
  store <2 x i64> %17, <2 x i64>* %19, align 8, !dbg !325, !tbaa !209
  %20 = bitcast i64* %15 to <2 x i64>*, !dbg !325
  store <2 x i64> %18, <2 x i64>* %20, align 8, !dbg !325, !tbaa !209
  %index.next = add i64 %index, 4, !dbg !322
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0, !dbg !323
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !323
  %induction.1 = add <2 x i64> %broadcast.splat.1, <i64 0, i64 1>, !dbg !323
  %induction51.1 = add <2 x i64> %broadcast.splat.1, <i64 2, i64 3>, !dbg !323
  %21 = getelementptr inbounds i64, i64* %call.i, i64 %index.next, !dbg !322
  %22 = bitcast i64* %21 to <2 x i64>*, !dbg !322
  %wide.load.1 = load <2 x i64>, <2 x i64>* %22, align 8, !dbg !322, !tbaa !209
  %23 = getelementptr i64, i64* %21, i64 2, !dbg !322
  %24 = bitcast i64* %23 to <2 x i64>*, !dbg !322
  %wide.load52.1 = load <2 x i64>, <2 x i64>* %24, align 8, !dbg !322, !tbaa !209
  %25 = add nsw <2 x i64> %wide.load.1, %induction.1, !dbg !324
  %26 = add nsw <2 x i64> %wide.load52.1, %induction51.1, !dbg !324
  %27 = bitcast i64* %21 to <2 x i64>*, !dbg !325
  store <2 x i64> %25, <2 x i64>* %27, align 8, !dbg !325, !tbaa !209
  %28 = bitcast i64* %23 to <2 x i64>*, !dbg !325
  store <2 x i64> %26, <2 x i64>* %28, align 8, !dbg !325, !tbaa !209
  %index.next.1 = add i64 %index, 8, !dbg !322
  %29 = icmp eq i64 %index.next.1, %n.vec, !dbg !322
  br i1 %29, label %middle.block.unr-lcssa, label %vector.body, !dbg !322, !llvm.loop !326

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %1, %n.vec
  br i1 %cmp.n, label %while.cond9.preheader.us.preheader, label %if.end.i.preheader80, !dbg !322

init.exit.thread:                                 ; preds = %if.end
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !109, metadata !131), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !95, metadata !131), !dbg !276
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !94, metadata !131), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !131), !dbg !285
  %call450 = tail call i64* @gcd_array(i64* %call.i, i64 undef, i64 %1), !dbg !327
  tail call void @llvm.dbg.value(metadata i64* %call4, i64 0, metadata !111, metadata !131), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !131), !dbg !277
  tail call void @llvm.dbg.value(metadata i64* %call4, i64 0, metadata !96, metadata !131), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !113, metadata !131), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !131), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !131), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !99, metadata !131), !dbg !279
  br label %blklab21, !dbg !328

if.end.i:                                         ; preds = %if.end.i.preheader80, %if.end.i
  %i.027.i = phi i64 [ %add4.i, %if.end.i ], [ %i.027.i.ph, %if.end.i.preheader80 ], !dbg !323
  %arrayidx.i = getelementptr inbounds i64, i64* %call.i, i64 %i.027.i, !dbg !322
  %30 = load i64, i64* %arrayidx.i, align 8, !dbg !322, !tbaa !209
  tail call void @llvm.dbg.value(metadata i64 %30, i64 0, metadata !78, metadata !131) #6, !dbg !315
  %add.i = add nsw i64 %30, %i.027.i, !dbg !324
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !79, metadata !131) #6, !dbg !316
  store i64 %add.i, i64* %arrayidx.i, align 8, !dbg !325, !tbaa !209
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !131) #6, !dbg !317
  %add4.i = add nuw nsw i64 %i.027.i, 1, !dbg !330
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !81, metadata !131) #6, !dbg !318
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !73, metadata !131) #6, !dbg !311
  %exitcond.i = icmp eq i64 %add4.i, %1, !dbg !321
  br i1 %exitcond.i, label %while.cond9.preheader.us.preheader.loopexit, label %if.end.i, !dbg !321, !llvm.loop !331

while.cond9.preheader.us.preheader.loopexit:      ; preds = %if.end.i
  br label %while.cond9.preheader.us.preheader, !dbg !284

while.cond9.preheader.us.preheader:               ; preds = %while.cond9.preheader.us.preheader.loopexit, %middle.block
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !109, metadata !131), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !95, metadata !131), !dbg !276
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !94, metadata !131), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !131), !dbg !285
  %call4 = tail call i64* @gcd_array(i64* nonnull %call.i, i64 undef, i64 %1), !dbg !327
  tail call void @llvm.dbg.value(metadata i64* %call4, i64 0, metadata !111, metadata !131), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !131), !dbg !277
  tail call void @llvm.dbg.value(metadata i64* %call4, i64 0, metadata !96, metadata !131), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !113, metadata !131), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !131), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !131), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !99, metadata !131), !dbg !279
  %31 = add i64 %1, -4, !dbg !332
  %32 = lshr i64 %31, 2, !dbg !332
  %33 = add nuw nsw i64 %32, 1, !dbg !332
  %min.iters.check58 = icmp ult i64 %1, 4, !dbg !332
  %n.vec61 = and i64 %1, -4, !dbg !332
  %cmp.zero62 = icmp eq i64 %n.vec61, 0, !dbg !332
  %xtraiter = and i64 %33, 3, !dbg !332
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !332
  %34 = icmp ult i64 %31, 12, !dbg !332
  %cmp.n67 = icmp eq i64 %1, %n.vec61
  br label %while.cond9.preheader.us, !dbg !332

while.cond9.preheader.us:                         ; preds = %while.cond9.preheader.us.preheader, %blklab23.loopexit.us
  %sum.047.us = phi i64 [ %add16.us.lcssa, %blklab23.loopexit.us ], [ 0, %while.cond9.preheader.us.preheader ]
  %i.045.us = phi i64 [ %add18.us, %blklab23.loopexit.us ], [ 0, %while.cond9.preheader.us.preheader ]
  %mul.us = mul nsw i64 %i.045.us, %1, !dbg !332
  br i1 %min.iters.check58, label %if.end14.us.preheader, label %min.iters.checked59, !dbg !332

min.iters.checked59:                              ; preds = %while.cond9.preheader.us
  br i1 %cmp.zero62, label %if.end14.us.preheader, label %vector.ph63, !dbg !332

vector.ph63:                                      ; preds = %min.iters.checked59
  %35 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %sum.047.us, i32 0, !dbg !332
  br i1 %lcmp.mod, label %vector.ph63.split, label %vector.body55.prol.preheader, !dbg !332

vector.body55.prol.preheader:                     ; preds = %vector.ph63
  br label %vector.body55.prol, !dbg !334

vector.body55.prol:                               ; preds = %vector.body55.prol, %vector.body55.prol.preheader
  %index64.prol = phi i64 [ %index.next65.prol, %vector.body55.prol ], [ 0, %vector.body55.prol.preheader ], !dbg !335
  %vec.phi.prol = phi <2 x i64> [ %41, %vector.body55.prol ], [ %35, %vector.body55.prol.preheader ]
  %vec.phi68.prol = phi <2 x i64> [ %42, %vector.body55.prol ], [ zeroinitializer, %vector.body55.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body55.prol ], [ %xtraiter, %vector.body55.prol.preheader ]
  %36 = add nsw i64 %index64.prol, %mul.us, !dbg !334
  %37 = getelementptr inbounds i64, i64* %call4, i64 %36, !dbg !334
  %38 = bitcast i64* %37 to <2 x i64>*, !dbg !334
  %wide.load75.prol = load <2 x i64>, <2 x i64>* %38, align 8, !dbg !334, !tbaa !209
  %39 = getelementptr i64, i64* %37, i64 2, !dbg !334
  %40 = bitcast i64* %39 to <2 x i64>*, !dbg !334
  %wide.load76.prol = load <2 x i64>, <2 x i64>* %40, align 8, !dbg !334, !tbaa !209
  %41 = add nsw <2 x i64> %wide.load75.prol, %vec.phi.prol, !dbg !336
  %42 = add nsw <2 x i64> %wide.load76.prol, %vec.phi68.prol, !dbg !336
  %index.next65.prol = add i64 %index64.prol, 4, !dbg !332
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !332
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !332
  br i1 %prol.iter.cmp, label %vector.ph63.split.loopexit, label %vector.body55.prol, !dbg !332, !llvm.loop !337

vector.ph63.split.loopexit:                       ; preds = %vector.body55.prol
  %index.next65.prol.lcssa = phi i64 [ %index.next65.prol, %vector.body55.prol ]
  %.lcssa89 = phi <2 x i64> [ %42, %vector.body55.prol ]
  %.lcssa88 = phi <2 x i64> [ %41, %vector.body55.prol ]
  br label %vector.ph63.split, !dbg !332

vector.ph63.split:                                ; preds = %vector.ph63, %vector.ph63.split.loopexit
  %.lcssa81.unr = phi <2 x i64> [ undef, %vector.ph63 ], [ %.lcssa89, %vector.ph63.split.loopexit ]
  %.lcssa.unr = phi <2 x i64> [ undef, %vector.ph63 ], [ %.lcssa88, %vector.ph63.split.loopexit ]
  %index64.unr = phi i64 [ 0, %vector.ph63 ], [ %index.next65.prol.lcssa, %vector.ph63.split.loopexit ]
  %vec.phi.unr = phi <2 x i64> [ %35, %vector.ph63 ], [ %.lcssa88, %vector.ph63.split.loopexit ]
  %vec.phi68.unr = phi <2 x i64> [ zeroinitializer, %vector.ph63 ], [ %.lcssa89, %vector.ph63.split.loopexit ]
  br i1 %34, label %middle.block56, label %vector.ph63.split.split, !dbg !332

vector.ph63.split.split:                          ; preds = %vector.ph63.split
  br label %vector.body55, !dbg !332

vector.body55:                                    ; preds = %vector.body55, %vector.ph63.split.split
  %index64 = phi i64 [ %index64.unr, %vector.ph63.split.split ], [ %index.next65.3, %vector.body55 ], !dbg !335
  %vec.phi = phi <2 x i64> [ %vec.phi.unr, %vector.ph63.split.split ], [ %69, %vector.body55 ]
  %vec.phi68 = phi <2 x i64> [ %vec.phi68.unr, %vector.ph63.split.split ], [ %70, %vector.body55 ]
  %43 = add nsw i64 %index64, %mul.us, !dbg !334
  %44 = getelementptr inbounds i64, i64* %call4, i64 %43, !dbg !334
  %45 = bitcast i64* %44 to <2 x i64>*, !dbg !334
  %wide.load75 = load <2 x i64>, <2 x i64>* %45, align 8, !dbg !334, !tbaa !209
  %46 = getelementptr i64, i64* %44, i64 2, !dbg !334
  %47 = bitcast i64* %46 to <2 x i64>*, !dbg !334
  %wide.load76 = load <2 x i64>, <2 x i64>* %47, align 8, !dbg !334, !tbaa !209
  %48 = add nsw <2 x i64> %wide.load75, %vec.phi, !dbg !336
  %49 = add nsw <2 x i64> %wide.load76, %vec.phi68, !dbg !336
  %index.next65 = add i64 %index64, 4, !dbg !332
  %50 = add nsw i64 %index.next65, %mul.us, !dbg !334
  %51 = getelementptr inbounds i64, i64* %call4, i64 %50, !dbg !334
  %52 = bitcast i64* %51 to <2 x i64>*, !dbg !334
  %wide.load75.1 = load <2 x i64>, <2 x i64>* %52, align 8, !dbg !334, !tbaa !209
  %53 = getelementptr i64, i64* %51, i64 2, !dbg !334
  %54 = bitcast i64* %53 to <2 x i64>*, !dbg !334
  %wide.load76.1 = load <2 x i64>, <2 x i64>* %54, align 8, !dbg !334, !tbaa !209
  %55 = add nsw <2 x i64> %wide.load75.1, %48, !dbg !336
  %56 = add nsw <2 x i64> %wide.load76.1, %49, !dbg !336
  %index.next65.1 = add i64 %index64, 8, !dbg !332
  %57 = add nsw i64 %index.next65.1, %mul.us, !dbg !334
  %58 = getelementptr inbounds i64, i64* %call4, i64 %57, !dbg !334
  %59 = bitcast i64* %58 to <2 x i64>*, !dbg !334
  %wide.load75.2 = load <2 x i64>, <2 x i64>* %59, align 8, !dbg !334, !tbaa !209
  %60 = getelementptr i64, i64* %58, i64 2, !dbg !334
  %61 = bitcast i64* %60 to <2 x i64>*, !dbg !334
  %wide.load76.2 = load <2 x i64>, <2 x i64>* %61, align 8, !dbg !334, !tbaa !209
  %62 = add nsw <2 x i64> %wide.load75.2, %55, !dbg !336
  %63 = add nsw <2 x i64> %wide.load76.2, %56, !dbg !336
  %index.next65.2 = add i64 %index64, 12, !dbg !332
  %64 = add nsw i64 %index.next65.2, %mul.us, !dbg !334
  %65 = getelementptr inbounds i64, i64* %call4, i64 %64, !dbg !334
  %66 = bitcast i64* %65 to <2 x i64>*, !dbg !334
  %wide.load75.3 = load <2 x i64>, <2 x i64>* %66, align 8, !dbg !334, !tbaa !209
  %67 = getelementptr i64, i64* %65, i64 2, !dbg !334
  %68 = bitcast i64* %67 to <2 x i64>*, !dbg !334
  %wide.load76.3 = load <2 x i64>, <2 x i64>* %68, align 8, !dbg !334, !tbaa !209
  %69 = add nsw <2 x i64> %wide.load75.3, %62, !dbg !336
  %70 = add nsw <2 x i64> %wide.load76.3, %63, !dbg !336
  %index.next65.3 = add i64 %index64, 16, !dbg !332
  %71 = icmp eq i64 %index.next65.3, %n.vec61, !dbg !332
  br i1 %71, label %middle.block56.unr-lcssa, label %vector.body55, !dbg !332, !llvm.loop !339

middle.block56.unr-lcssa:                         ; preds = %vector.body55
  %.lcssa86 = phi <2 x i64> [ %70, %vector.body55 ]
  %.lcssa85 = phi <2 x i64> [ %69, %vector.body55 ]
  br label %middle.block56, !dbg !336

middle.block56:                                   ; preds = %vector.ph63.split, %middle.block56.unr-lcssa
  %.lcssa81 = phi <2 x i64> [ %.lcssa81.unr, %vector.ph63.split ], [ %.lcssa86, %middle.block56.unr-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.unr, %vector.ph63.split ], [ %.lcssa85, %middle.block56.unr-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa81, %.lcssa, !dbg !336
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>, !dbg !336
  %bin.rdx79 = add <2 x i64> %bin.rdx, %rdx.shuf, !dbg !336
  %72 = extractelement <2 x i64> %bin.rdx79, i32 0, !dbg !336
  br i1 %cmp.n67, label %blklab23.loopexit.us, label %if.end14.us.preheader, !dbg !332

if.end14.us.preheader:                            ; preds = %middle.block56, %min.iters.checked59, %while.cond9.preheader.us
  %sum.143.us.ph = phi i64 [ %sum.047.us, %min.iters.checked59 ], [ %sum.047.us, %while.cond9.preheader.us ], [ %72, %middle.block56 ]
  %j.042.us.ph = phi i64 [ 0, %min.iters.checked59 ], [ 0, %while.cond9.preheader.us ], [ %n.vec61, %middle.block56 ]
  br label %if.end14.us, !dbg !289

if.end14.us:                                      ; preds = %if.end14.us.preheader, %if.end14.us
  %sum.143.us = phi i64 [ %add16.us, %if.end14.us ], [ %sum.143.us.ph, %if.end14.us.preheader ]
  %j.042.us = phi i64 [ %add17.us, %if.end14.us ], [ %j.042.us.ph, %if.end14.us.preheader ]
  tail call void @llvm.dbg.value(metadata i64 %mul.us, i64 0, metadata !116, metadata !131), !dbg !289
  %add.us = add nsw i64 %j.042.us, %mul.us, !dbg !340
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !117, metadata !131), !dbg !290
  %arrayidx15.us = getelementptr inbounds i64, i64* %call4, i64 %add.us, !dbg !334
  %73 = load i64, i64* %arrayidx15.us, align 8, !dbg !334, !tbaa !209
  tail call void @llvm.dbg.value(metadata i64 %73, i64 0, metadata !118, metadata !131), !dbg !291
  %add16.us = add nsw i64 %73, %sum.143.us, !dbg !336
  tail call void @llvm.dbg.value(metadata i64 %add16.us, i64 0, metadata !119, metadata !131), !dbg !292
  tail call void @llvm.dbg.value(metadata i64 %add16.us, i64 0, metadata !98, metadata !131), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !120, metadata !131), !dbg !293
  %add17.us = add nuw nsw i64 %j.042.us, 1, !dbg !335
  tail call void @llvm.dbg.value(metadata i64 %add17.us, i64 0, metadata !121, metadata !131), !dbg !294
  tail call void @llvm.dbg.value(metadata i64 %add17.us, i64 0, metadata !100, metadata !131), !dbg !280
  %exitcond.us = icmp eq i64 %add17.us, %1, !dbg !341
  br i1 %exitcond.us, label %blklab23.loopexit.us.loopexit, label %if.end14.us, !dbg !341, !llvm.loop !342

blklab23.loopexit.us.loopexit:                    ; preds = %if.end14.us
  %add16.us.lcssa87 = phi i64 [ %add16.us, %if.end14.us ]
  br label %blklab23.loopexit.us, !dbg !295

blklab23.loopexit.us:                             ; preds = %blklab23.loopexit.us.loopexit, %middle.block56
  %add16.us.lcssa = phi i64 [ %72, %middle.block56 ], [ %add16.us.lcssa87, %blklab23.loopexit.us.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !122, metadata !131), !dbg !295
  %add18.us = add nuw nsw i64 %i.045.us, 1, !dbg !343
  tail call void @llvm.dbg.value(metadata i64 %add18.us, i64 0, metadata !123, metadata !131), !dbg !296
  tail call void @llvm.dbg.value(metadata i64 %add18.us, i64 0, metadata !99, metadata !131), !dbg !279
  %exitcond49.us = icmp eq i64 %add18.us, %1, !dbg !328
  br i1 %exitcond49.us, label %blklab21.loopexit, label %while.cond9.preheader.us, !dbg !328

blklab21.loopexit:                                ; preds = %blklab23.loopexit.us
  %add16.us.lcssa.lcssa = phi i64 [ %add16.us.lcssa, %blklab23.loopexit.us ]
  br label %blklab21, !dbg !297

blklab21:                                         ; preds = %blklab21.loopexit, %init.exit.thread
  %sum.0.lcssa = phi i64 [ 0, %init.exit.thread ], [ %add16.us.lcssa.lcssa, %blklab21.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !126, metadata !131), !dbg !297
  %call19 = tail call noalias i8* @malloc(i64 32) #6, !dbg !344
  %74 = bitcast i8* %call19 to i64*, !dbg !344
  tail call void @llvm.dbg.value(metadata i64* %74, i64 0, metadata !125, metadata !131), !dbg !297
  %75 = bitcast i8* %call19 to <2 x i64>*, !dbg !345
  store <2 x i64> <i64 83, i64 85>, <2 x i64>* %75, align 8, !dbg !345, !tbaa !209
  %arrayidx22 = getelementptr inbounds i8, i8* %call19, i64 16, !dbg !346
  %76 = bitcast i8* %arrayidx22 to <2 x i64>*, !dbg !347
  store <2 x i64> <i64 77, i64 58>, <2 x i64>* %76, align 8, !dbg !347, !tbaa !209
  tail call void @printf_s(i64* %74, i64 4) #6, !dbg !348
  %call24 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sum.0.lcssa), !dbg !349
  br label %blklab20, !dbg !349

blklab20:                                         ; preds = %entry, %blklab21
  tail call void @exit(i32 0) #8, !dbg !350
  unreachable, !dbg !350
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

declare void @printf_s(i64*, i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!128, !129}
!llvm.ident = !{!130}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "GCD.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !19, !64, !82}
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
!19 = distinct !DISubprogram(name: "gcd_array", scope: !1, file: !1, line: 62, type: !20, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: true, variables: !23)
!20 = !DISubroutineType(types: !21)
!21 = !{!22, !22, !9, !9}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!23 = !{!24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63}
!24 = !DILocalVariable(name: "data", arg: 1, scope: !19, file: !1, line: 62, type: !22)
!25 = !DILocalVariable(name: "data_size", arg: 2, scope: !19, file: !1, line: 62, type: !9)
!26 = !DILocalVariable(name: "n", arg: 3, scope: !19, file: !1, line: 62, type: !9)
!27 = !DILocalVariable(name: "_2", scope: !19, file: !1, line: 63, type: !22)
!28 = !DILocalVariable(name: "_2_size", scope: !19, file: !1, line: 63, type: !9)
!29 = !DILocalVariable(name: "gcds", scope: !19, file: !1, line: 64, type: !22)
!30 = !DILocalVariable(name: "gcds_size", scope: !19, file: !1, line: 64, type: !9)
!31 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 65, type: !9)
!32 = !DILocalVariable(name: "j", scope: !19, file: !1, line: 66, type: !9)
!33 = !DILocalVariable(name: "a", scope: !19, file: !1, line: 67, type: !9)
!34 = !DILocalVariable(name: "b", scope: !19, file: !1, line: 68, type: !9)
!35 = !DILocalVariable(name: "_8", scope: !19, file: !1, line: 69, type: !9)
!36 = !DILocalVariable(name: "_9", scope: !19, file: !1, line: 70, type: !9)
!37 = !DILocalVariable(name: "_10", scope: !19, file: !1, line: 71, type: !22)
!38 = !DILocalVariable(name: "_10_size", scope: !19, file: !1, line: 71, type: !9)
!39 = !DILocalVariable(name: "_11", scope: !19, file: !1, line: 72, type: !9)
!40 = !DILocalVariable(name: "_12", scope: !19, file: !1, line: 73, type: !9)
!41 = !DILocalVariable(name: "_13", scope: !19, file: !1, line: 74, type: !9)
!42 = !DILocalVariable(name: "_14", scope: !19, file: !1, line: 75, type: !9)
!43 = !DILocalVariable(name: "_15", scope: !19, file: !1, line: 76, type: !9)
!44 = !DILocalVariable(name: "_16", scope: !19, file: !1, line: 77, type: !9)
!45 = !DILocalVariable(name: "_17", scope: !19, file: !1, line: 78, type: !9)
!46 = !DILocalVariable(name: "_18", scope: !19, file: !1, line: 79, type: !9)
!47 = !DILocalVariable(name: "_19", scope: !19, file: !1, line: 80, type: !9)
!48 = !DILocalVariable(name: "_20", scope: !19, file: !1, line: 81, type: !9)
!49 = !DILocalVariable(name: "_21", scope: !19, file: !1, line: 82, type: !9)
!50 = !DILocalVariable(name: "_22", scope: !19, file: !1, line: 83, type: !9)
!51 = !DILocalVariable(name: "_23", scope: !19, file: !1, line: 84, type: !9)
!52 = !DILocalVariable(name: "_24", scope: !19, file: !1, line: 85, type: !9)
!53 = !DILocalVariable(name: "_25", scope: !19, file: !1, line: 86, type: !9)
!54 = !DILocalVariable(name: "_26", scope: !19, file: !1, line: 87, type: !9)
!55 = !DILocalVariable(name: "_27", scope: !19, file: !1, line: 88, type: !9)
!56 = !DILocalVariable(name: "_28", scope: !19, file: !1, line: 89, type: !9)
!57 = !DILocalVariable(name: "_29", scope: !19, file: !1, line: 90, type: !9)
!58 = !DILocalVariable(name: "_30", scope: !19, file: !1, line: 91, type: !9)
!59 = !DILocalVariable(name: "_31", scope: !19, file: !1, line: 92, type: !9)
!60 = !DILocalVariable(name: "_32", scope: !19, file: !1, line: 93, type: !9)
!61 = !DILocalVariable(name: "_33", scope: !19, file: !1, line: 94, type: !9)
!62 = !DILocalVariable(name: "_34", scope: !19, file: !1, line: 95, type: !9)
!63 = !DILocalVariable(name: "_35", scope: !19, file: !1, line: 96, type: !9)
!64 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 234, type: !65, isLocal: false, isDefinition: true, scopeLine: 234, flags: DIFlagPrototyped, isOptimized: true, variables: !67)
!65 = !DISubroutineType(types: !66)
!66 = !{!22, !9}
!67 = !{!68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81}
!68 = !DILocalVariable(name: "n", arg: 1, scope: !64, file: !1, line: 234, type: !9)
!69 = !DILocalVariable(name: "_1", scope: !64, file: !1, line: 235, type: !22)
!70 = !DILocalVariable(name: "_1_size", scope: !64, file: !1, line: 235, type: !9)
!71 = !DILocalVariable(name: "data", scope: !64, file: !1, line: 236, type: !22)
!72 = !DILocalVariable(name: "data_size", scope: !64, file: !1, line: 236, type: !9)
!73 = !DILocalVariable(name: "i", scope: !64, file: !1, line: 237, type: !9)
!74 = !DILocalVariable(name: "_4", scope: !64, file: !1, line: 238, type: !9)
!75 = !DILocalVariable(name: "_5", scope: !64, file: !1, line: 239, type: !22)
!76 = !DILocalVariable(name: "_5_size", scope: !64, file: !1, line: 239, type: !9)
!77 = !DILocalVariable(name: "_6", scope: !64, file: !1, line: 240, type: !9)
!78 = !DILocalVariable(name: "_7", scope: !64, file: !1, line: 241, type: !9)
!79 = !DILocalVariable(name: "_8", scope: !64, file: !1, line: 242, type: !9)
!80 = !DILocalVariable(name: "_9", scope: !64, file: !1, line: 243, type: !9)
!81 = !DILocalVariable(name: "_10", scope: !64, file: !1, line: 244, type: !9)
!82 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 281, type: !83, isLocal: false, isDefinition: true, scopeLine: 281, flags: DIFlagPrototyped, isOptimized: true, variables: !89)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64, align: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64, align: 64)
!88 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!89 = !{!90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127}
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !1, line: 281, type: !85)
!91 = !DILocalVariable(name: "args", arg: 2, scope: !82, file: !1, line: 281, type: !86)
!92 = !DILocalVariable(name: "max", scope: !82, file: !1, line: 282, type: !22)
!93 = !DILocalVariable(name: "n", scope: !82, file: !1, line: 283, type: !9)
!94 = !DILocalVariable(name: "data", scope: !82, file: !1, line: 284, type: !22)
!95 = !DILocalVariable(name: "data_size", scope: !82, file: !1, line: 284, type: !9)
!96 = !DILocalVariable(name: "gcds", scope: !82, file: !1, line: 285, type: !22)
!97 = !DILocalVariable(name: "gcds_size", scope: !82, file: !1, line: 285, type: !9)
!98 = !DILocalVariable(name: "sum", scope: !82, file: !1, line: 286, type: !9)
!99 = !DILocalVariable(name: "i", scope: !82, file: !1, line: 287, type: !9)
!100 = !DILocalVariable(name: "j", scope: !82, file: !1, line: 288, type: !9)
!101 = !DILocalVariable(name: "_8", scope: !82, file: !1, line: 289, type: !22)
!102 = !DILocalVariable(name: "_9", scope: !82, file: !1, line: 290, type: !103)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64, align: 64)
!104 = !DILocalVariable(name: "_9_size", scope: !82, file: !1, line: 290, type: !9)
!105 = !DILocalVariable(name: "_9_size_size", scope: !82, file: !1, line: 290, type: !9)
!106 = !DILocalVariable(name: "_10", scope: !82, file: !1, line: 291, type: !9)
!107 = !DILocalVariable(name: "_11", scope: !82, file: !1, line: 292, type: !22)
!108 = !DILocalVariable(name: "_11_size", scope: !82, file: !1, line: 292, type: !9)
!109 = !DILocalVariable(name: "_12", scope: !82, file: !1, line: 293, type: !22)
!110 = !DILocalVariable(name: "_12_size", scope: !82, file: !1, line: 293, type: !9)
!111 = !DILocalVariable(name: "_13", scope: !82, file: !1, line: 294, type: !22)
!112 = !DILocalVariable(name: "_13_size", scope: !82, file: !1, line: 294, type: !9)
!113 = !DILocalVariable(name: "_14", scope: !82, file: !1, line: 295, type: !9)
!114 = !DILocalVariable(name: "_15", scope: !82, file: !1, line: 296, type: !9)
!115 = !DILocalVariable(name: "_16", scope: !82, file: !1, line: 297, type: !9)
!116 = !DILocalVariable(name: "_17", scope: !82, file: !1, line: 298, type: !9)
!117 = !DILocalVariable(name: "_18", scope: !82, file: !1, line: 299, type: !9)
!118 = !DILocalVariable(name: "_19", scope: !82, file: !1, line: 300, type: !9)
!119 = !DILocalVariable(name: "_20", scope: !82, file: !1, line: 301, type: !9)
!120 = !DILocalVariable(name: "_21", scope: !82, file: !1, line: 302, type: !9)
!121 = !DILocalVariable(name: "_22", scope: !82, file: !1, line: 303, type: !9)
!122 = !DILocalVariable(name: "_23", scope: !82, file: !1, line: 304, type: !9)
!123 = !DILocalVariable(name: "_24", scope: !82, file: !1, line: 305, type: !9)
!124 = !DILocalVariable(name: "_25", scope: !82, file: !1, line: 306, type: !4)
!125 = !DILocalVariable(name: "_27", scope: !82, file: !1, line: 307, type: !22)
!126 = !DILocalVariable(name: "_27_size", scope: !82, file: !1, line: 307, type: !9)
!127 = !DILocalVariable(name: "_28", scope: !82, file: !1, line: 308, type: !4)
!128 = !{i32 2, !"Dwarf Version", i32 4}
!129 = !{i32 2, !"Debug Info Version", i32 3}
!130 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!131 = !DIExpression()
!132 = !DILocation(line: 2, column: 25, scope: !6)
!133 = !DILocation(line: 2, column: 38, scope: !6)
!134 = !DILocation(line: 3, column: 12, scope: !6)
!135 = !DILocation(line: 4, column: 12, scope: !6)
!136 = !DILocation(line: 5, column: 12, scope: !6)
!137 = !DILocation(line: 6, column: 12, scope: !6)
!138 = !DILocation(line: 7, column: 12, scope: !6)
!139 = !DILocation(line: 8, column: 12, scope: !6)
!140 = !DILocation(line: 12, column: 6, scope: !141)
!141 = distinct !DILexicalBlock(scope: !6, file: !1, line: 12, column: 5)
!142 = !DILocation(line: 12, column: 5, scope: !6)
!143 = !DILocation(line: 24, column: 8, scope: !144)
!144 = distinct !DILexicalBlock(scope: !145, file: !1, line: 24, column: 7)
!145 = distinct !DILexicalBlock(scope: !146, file: !1, line: 20, column: 3)
!146 = distinct !DILexicalBlock(scope: !6, file: !1, line: 18, column: 13)
!147 = !DILocation(line: 24, column: 7, scope: !145)
!148 = !DILocation(line: 35, column: 7, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !1, line: 35, column: 6)
!150 = !DILocation(line: 35, column: 6, scope: !146)
!151 = !DILocation(line: 26, column: 12, scope: !145)
!152 = !{!153, !153, i64 0}
!153 = !{!"any pointer", !154, i64 0}
!154 = !{!"omnipotent char", !155, i64 0}
!155 = !{!"Simple C/C++ TBAA"}
!156 = !DILocation(line: 26, column: 4, scope: !145)
!157 = !DILocation(line: 27, column: 4, scope: !145)
!158 = !DILocation(line: 37, column: 7, scope: !159)
!159 = distinct !DILexicalBlock(scope: !146, file: !1, line: 37, column: 6)
!160 = !DILocation(line: 37, column: 6, scope: !146)
!161 = !DILocation(line: 39, column: 7, scope: !146)
!162 = !DILocation(line: 47, column: 7, scope: !146)
!163 = !DILocation(line: 60, column: 1, scope: !6)
!164 = !DILocation(line: 62, column: 22, scope: !19)
!165 = !DILocation(line: 62, column: 59, scope: !19)
!166 = !DILocation(line: 63, column: 2, scope: !19)
!167 = !DILocation(line: 64, column: 2, scope: !19)
!168 = !DILocation(line: 65, column: 12, scope: !19)
!169 = !DILocation(line: 66, column: 12, scope: !19)
!170 = !DILocation(line: 67, column: 12, scope: !19)
!171 = !DILocation(line: 68, column: 12, scope: !19)
!172 = !DILocation(line: 69, column: 12, scope: !19)
!173 = !DILocation(line: 70, column: 12, scope: !19)
!174 = !DILocation(line: 71, column: 2, scope: !19)
!175 = !DILocation(line: 72, column: 12, scope: !19)
!176 = !DILocation(line: 73, column: 12, scope: !19)
!177 = !DILocation(line: 74, column: 12, scope: !19)
!178 = !DILocation(line: 75, column: 12, scope: !19)
!179 = !DILocation(line: 76, column: 12, scope: !19)
!180 = !DILocation(line: 77, column: 12, scope: !19)
!181 = !DILocation(line: 78, column: 12, scope: !19)
!182 = !DILocation(line: 79, column: 12, scope: !19)
!183 = !DILocation(line: 80, column: 12, scope: !19)
!184 = !DILocation(line: 81, column: 12, scope: !19)
!185 = !DILocation(line: 82, column: 12, scope: !19)
!186 = !DILocation(line: 83, column: 12, scope: !19)
!187 = !DILocation(line: 84, column: 12, scope: !19)
!188 = !DILocation(line: 85, column: 12, scope: !19)
!189 = !DILocation(line: 86, column: 12, scope: !19)
!190 = !DILocation(line: 87, column: 12, scope: !19)
!191 = !DILocation(line: 88, column: 12, scope: !19)
!192 = !DILocation(line: 89, column: 12, scope: !19)
!193 = !DILocation(line: 90, column: 12, scope: !19)
!194 = !DILocation(line: 91, column: 12, scope: !19)
!195 = !DILocation(line: 92, column: 12, scope: !19)
!196 = !DILocation(line: 93, column: 12, scope: !19)
!197 = !DILocation(line: 94, column: 12, scope: !19)
!198 = !DILocation(line: 95, column: 12, scope: !19)
!199 = !DILocation(line: 96, column: 12, scope: !19)
!200 = !DILocation(line: 100, column: 6, scope: !19)
!201 = !DILocation(line: 102, column: 2, scope: !19)
!202 = !DILocation(line: 112, column: 7, scope: !203)
!203 = distinct !DILexicalBlock(scope: !204, file: !1, line: 112, column: 6)
!204 = distinct !DILexicalBlock(scope: !19, file: !1, line: 110, column: 13)
!205 = !DILocation(line: 112, column: 6, scope: !204)
!206 = !DILocation(line: 122, column: 8, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !1, line: 118, column: 14)
!208 = !DILocation(line: 134, column: 9, scope: !207)
!209 = !{!210, !210, i64 0}
!210 = !{!"long long", !154, i64 0}
!211 = !DILocation(line: 126, column: 8, scope: !207)
!212 = !DILocation(line: 132, column: 8, scope: !213)
!213 = distinct !DILexicalBlock(scope: !207, file: !1, line: 132, column: 7)
!214 = !DILocation(line: 132, column: 7, scope: !207)
!215 = !DILocation(line: 158, column: 10, scope: !216)
!216 = distinct !DILexicalBlock(scope: !217, file: !1, line: 158, column: 9)
!217 = distinct !DILexicalBlock(scope: !218, file: !1, line: 154, column: 5)
!218 = distinct !DILexicalBlock(scope: !207, file: !1, line: 152, column: 15)
!219 = !DILocation(line: 158, column: 9, scope: !217)
!220 = !DILocation(line: 169, column: 9, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !1, line: 169, column: 8)
!222 = !DILocation(line: 169, column: 8, scope: !218)
!223 = !DILocation(line: 171, column: 9, scope: !224)
!224 = distinct !DILexicalBlock(scope: !218, file: !1, line: 171, column: 8)
!225 = !DILocation(line: 171, column: 8, scope: !218)
!226 = !DILocation(line: 173, column: 10, scope: !218)
!227 = !DILocation(line: 136, column: 11, scope: !207)
!228 = !DILocation(line: 138, column: 8, scope: !207)
!229 = !DILocation(line: 140, column: 11, scope: !207)
!230 = !DILocation(line: 146, column: 14, scope: !207)
!231 = !DILocation(line: 148, column: 4, scope: !207)
!232 = !DILocation(line: 210, column: 9, scope: !207)
!233 = !DILocation(line: 120, column: 8, scope: !234)
!234 = distinct !DILexicalBlock(scope: !207, file: !1, line: 120, column: 7)
!235 = !DILocation(line: 120, column: 7, scope: !207)
!236 = !DILocation(line: 221, column: 8, scope: !204)
!237 = !DILocation(line: 181, column: 10, scope: !218)
!238 = !DILocation(line: 194, column: 11, scope: !207)
!239 = !DILocation(line: 196, column: 8, scope: !207)
!240 = !DILocation(line: 198, column: 11, scope: !207)
!241 = !DILocation(line: 204, column: 14, scope: !207)
!242 = !DILocation(line: 204, column: 4, scope: !207)
!243 = !DILocation(line: 160, column: 14, scope: !217)
!244 = !DILocation(line: 160, column: 6, scope: !217)
!245 = !DILocation(line: 161, column: 6, scope: !217)
!246 = !DILocation(line: 230, column: 2, scope: !19)
!247 = !DILocation(line: 234, column: 27, scope: !64)
!248 = !DILocation(line: 235, column: 2, scope: !64)
!249 = !DILocation(line: 236, column: 2, scope: !64)
!250 = !DILocation(line: 237, column: 12, scope: !64)
!251 = !DILocation(line: 238, column: 12, scope: !64)
!252 = !DILocation(line: 239, column: 2, scope: !64)
!253 = !DILocation(line: 240, column: 12, scope: !64)
!254 = !DILocation(line: 241, column: 12, scope: !64)
!255 = !DILocation(line: 242, column: 12, scope: !64)
!256 = !DILocation(line: 243, column: 12, scope: !64)
!257 = !DILocation(line: 244, column: 12, scope: !64)
!258 = !DILocation(line: 248, column: 2, scope: !64)
!259 = !DILocation(line: 258, column: 7, scope: !260)
!260 = distinct !DILexicalBlock(scope: !261, file: !1, line: 258, column: 6)
!261 = distinct !DILexicalBlock(scope: !64, file: !1, line: 256, column: 13)
!262 = !DILocation(line: 258, column: 6, scope: !261)
!263 = !DILocation(line: 260, column: 6, scope: !261)
!264 = !DILocation(line: 262, column: 8, scope: !261)
!265 = !DILocation(line: 264, column: 11, scope: !261)
!266 = !DILocation(line: 268, column: 8, scope: !261)
!267 = distinct !{!267, !268, !269}
!268 = !{!"llvm.loop.vectorize.width", i32 1}
!269 = !{!"llvm.loop.interleave.count", i32 1}
!270 = distinct !{!270, !271, !268, !269}
!271 = !{!"llvm.loop.unroll.runtime.disable"}
!272 = !DILocation(line: 277, column: 2, scope: !64)
!273 = !DILocation(line: 281, column: 14, scope: !82)
!274 = !DILocation(line: 281, column: 27, scope: !82)
!275 = !DILocation(line: 283, column: 12, scope: !82)
!276 = !DILocation(line: 284, column: 2, scope: !82)
!277 = !DILocation(line: 285, column: 2, scope: !82)
!278 = !DILocation(line: 286, column: 12, scope: !82)
!279 = !DILocation(line: 287, column: 12, scope: !82)
!280 = !DILocation(line: 288, column: 12, scope: !82)
!281 = !DILocation(line: 290, column: 2, scope: !82)
!282 = !DILocation(line: 291, column: 12, scope: !82)
!283 = !DILocation(line: 292, column: 2, scope: !82)
!284 = !DILocation(line: 293, column: 2, scope: !82)
!285 = !DILocation(line: 294, column: 2, scope: !82)
!286 = !DILocation(line: 295, column: 12, scope: !82)
!287 = !DILocation(line: 296, column: 12, scope: !82)
!288 = !DILocation(line: 297, column: 12, scope: !82)
!289 = !DILocation(line: 298, column: 12, scope: !82)
!290 = !DILocation(line: 299, column: 12, scope: !82)
!291 = !DILocation(line: 300, column: 12, scope: !82)
!292 = !DILocation(line: 301, column: 12, scope: !82)
!293 = !DILocation(line: 302, column: 12, scope: !82)
!294 = !DILocation(line: 303, column: 12, scope: !82)
!295 = !DILocation(line: 304, column: 12, scope: !82)
!296 = !DILocation(line: 305, column: 12, scope: !82)
!297 = !DILocation(line: 307, column: 2, scope: !82)
!298 = !DILocation(line: 310, column: 2, scope: !82)
!299 = !DILocation(line: 314, column: 6, scope: !82)
!300 = !DILocation(line: 316, column: 2, scope: !82)
!301 = !DILocation(line: 289, column: 13, scope: !82)
!302 = !DILocation(line: 282, column: 13, scope: !82)
!303 = !DILocation(line: 320, column: 9, scope: !304)
!304 = distinct !DILexicalBlock(scope: !82, file: !1, line: 320, column: 5)
!305 = !DILocation(line: 320, column: 5, scope: !82)
!306 = !DILocation(line: 322, column: 6, scope: !82)
!307 = !DILocation(line: 234, column: 27, scope: !64, inlinedAt: !308)
!308 = distinct !DILocation(line: 324, column: 8, scope: !82)
!309 = !DILocation(line: 235, column: 2, scope: !64, inlinedAt: !308)
!310 = !DILocation(line: 236, column: 2, scope: !64, inlinedAt: !308)
!311 = !DILocation(line: 237, column: 12, scope: !64, inlinedAt: !308)
!312 = !DILocation(line: 238, column: 12, scope: !64, inlinedAt: !308)
!313 = !DILocation(line: 239, column: 2, scope: !64, inlinedAt: !308)
!314 = !DILocation(line: 240, column: 12, scope: !64, inlinedAt: !308)
!315 = !DILocation(line: 241, column: 12, scope: !64, inlinedAt: !308)
!316 = !DILocation(line: 242, column: 12, scope: !64, inlinedAt: !308)
!317 = !DILocation(line: 243, column: 12, scope: !64, inlinedAt: !308)
!318 = !DILocation(line: 244, column: 12, scope: !64, inlinedAt: !308)
!319 = !DILocation(line: 248, column: 2, scope: !64, inlinedAt: !308)
!320 = !DILocation(line: 258, column: 7, scope: !260, inlinedAt: !308)
!321 = !DILocation(line: 258, column: 6, scope: !261, inlinedAt: !308)
!322 = !DILocation(line: 260, column: 6, scope: !261, inlinedAt: !308)
!323 = !DILocation(line: 324, column: 8, scope: !82)
!324 = !DILocation(line: 262, column: 8, scope: !261, inlinedAt: !308)
!325 = !DILocation(line: 264, column: 11, scope: !261, inlinedAt: !308)
!326 = distinct !{!326, !268, !269}
!327 = !DILocation(line: 329, column: 8, scope: !82)
!328 = !DILocation(line: 343, column: 6, scope: !329)
!329 = distinct !DILexicalBlock(scope: !82, file: !1, line: 341, column: 13)
!330 = !DILocation(line: 268, column: 8, scope: !261, inlinedAt: !308)
!331 = distinct !{!331, !271, !268, !269}
!332 = !DILocation(line: 353, column: 9, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !1, line: 349, column: 14)
!334 = !DILocation(line: 357, column: 8, scope: !333)
!335 = !DILocation(line: 365, column: 9, scope: !333)
!336 = !DILocation(line: 359, column: 11, scope: !333)
!337 = distinct !{!337, !338}
!338 = !{!"llvm.loop.unroll.disable"}
!339 = distinct !{!339, !268, !269}
!340 = !DILocation(line: 355, column: 11, scope: !333)
!341 = !DILocation(line: 351, column: 7, scope: !333)
!342 = distinct !{!342, !271, !268, !269}
!343 = !DILocation(line: 376, column: 8, scope: !329)
!344 = !DILocation(line: 387, column: 2, scope: !82)
!345 = !DILocation(line: 388, column: 9, scope: !82)
!346 = !DILocation(line: 388, column: 28, scope: !82)
!347 = !DILocation(line: 388, column: 35, scope: !82)
!348 = !DILocation(line: 390, column: 2, scope: !82)
!349 = !DILocation(line: 394, column: 2, scope: !82)
!350 = !DILocation(line: 398, column: 2, scope: !82)
