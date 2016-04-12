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
define i64 @gcd(i64 %a, i64 %b) #0 !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !9, metadata !124), !dbg !125
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !10, metadata !124), !dbg !126
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !11, metadata !124), !dbg !127
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !12, metadata !124), !dbg !128
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !13, metadata !124), !dbg !129
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !124), !dbg !130
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !124), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !16, metadata !124), !dbg !132
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !12, metadata !124), !dbg !128
  %cmp = icmp eq i64 %a, 0, !dbg !133
  br i1 %cmp, label %cleanup, label %while.cond.preheader, !dbg !135

while.cond.preheader:                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !13, metadata !124), !dbg !129
  %cmp13234 = icmp sgt i64 %a, -1, !dbg !136
  br i1 %cmp13234, label %blklab4.lr.ph.preheader, label %if.end3, !dbg !140

blklab4.lr.ph.preheader:                          ; preds = %while.cond.preheader
  %cmp447 = icmp eq i64 %b, 0, !dbg !141
  br i1 %cmp447, label %cleanup, label %blklab4.preheader.preheader, !dbg !143

blklab4.preheader.preheader:                      ; preds = %blklab4.lr.ph.preheader
  br label %blklab4.preheader, !dbg !130

blklab4.preheader:                                ; preds = %blklab4.preheader.preheader, %blklab5
  %b.addr.0.ph3549 = phi i64 [ %sub10, %blklab5 ], [ %b, %blklab4.preheader.preheader ]
  %a.addr.0.ph3648 = phi i64 [ %a.addr.033.lcssa, %blklab5 ], [ %a, %blklab4.preheader.preheader ]
  br label %blklab4, !dbg !130

if.end3.loopexit:                                 ; preds = %if.end9
  br label %if.end3, !dbg !144

if.end3:                                          ; preds = %if.end3.loopexit, %while.cond.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !144, !tbaa !145
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #7, !dbg !149
  tail call void @exit(i32 -1) #8, !dbg !150
  unreachable, !dbg !150

blklab4:                                          ; preds = %blklab4.preheader, %if.end9
  %a.addr.033 = phi i64 [ %sub, %if.end9 ], [ %a.addr.0.ph3648, %blklab4.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !124), !dbg !130
  %cmp7 = icmp sgt i64 %a.addr.033, %b.addr.0.ph3549, !dbg !151
  br i1 %cmp7, label %if.end9, label %blklab5, !dbg !153

if.end9:                                          ; preds = %blklab4
  %sub = sub nsw i64 %a.addr.033, %b.addr.0.ph3549, !dbg !154
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !15, metadata !124), !dbg !131
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !9, metadata !124), !dbg !125
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !13, metadata !124), !dbg !129
  %cmp1 = icmp sgt i64 %sub, -1, !dbg !136
  br i1 %cmp1, label %blklab4, label %if.end3.loopexit, !dbg !140

blklab5:                                          ; preds = %blklab4
  %a.addr.033.lcssa = phi i64 [ %a.addr.033, %blklab4 ]
  %sub10 = sub nsw i64 %b.addr.0.ph3549, %a.addr.033.lcssa, !dbg !155
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !16, metadata !124), !dbg !132
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !10, metadata !124), !dbg !126
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !13, metadata !124), !dbg !129
  %cmp4 = icmp eq i64 %sub10, 0, !dbg !141
  br i1 %cmp4, label %cleanup.loopexit, label %blklab4.preheader, !dbg !143

cleanup.loopexit:                                 ; preds = %blklab5
  %a.addr.033.lcssa.lcssa = phi i64 [ %a.addr.033.lcssa, %blklab5 ]
  br label %cleanup, !dbg !156

cleanup:                                          ; preds = %cleanup.loopexit, %blklab4.lr.ph.preheader, %entry
  %retval.0 = phi i64 [ %b, %entry ], [ %a, %blklab4.lr.ph.preheader ], [ %a.addr.033.lcssa.lcssa, %cleanup.loopexit ]
  ret i64 %retval.0, !dbg !156
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i64* @gcd_array(i64* nocapture readonly %data, i64 %data_size, i64 %n) #0 !dbg !17 {
entry:
  tail call void @llvm.dbg.value(metadata i64* %data, i64 0, metadata !22, metadata !124), !dbg !157
  tail call void @llvm.dbg.value(metadata i64 %data_size, i64 0, metadata !23, metadata !124), !dbg !157
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !24, metadata !124), !dbg !158
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !25, metadata !124), !dbg !159
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !26, metadata !124), !dbg !159
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !27, metadata !124), !dbg !160
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !28, metadata !124), !dbg !160
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !124), !dbg !161
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !30, metadata !124), !dbg !162
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !124), !dbg !163
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !32, metadata !124), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !124), !dbg !165
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !124), !dbg !166
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !124), !dbg !167
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !36, metadata !124), !dbg !168
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !124), !dbg !168
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !124), !dbg !169
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !124), !dbg !170
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !124), !dbg !171
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !124), !dbg !172
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !124), !dbg !173
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !124), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !124), !dbg !175
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !124), !dbg !176
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !124), !dbg !177
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !47, metadata !124), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !48, metadata !124), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !49, metadata !124), !dbg !180
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !124), !dbg !181
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !124), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !124), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !53, metadata !124), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !124), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !124), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !124), !dbg !187
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !57, metadata !124), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !58, metadata !124), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !59, metadata !124), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !60, metadata !124), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !124), !dbg !192
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !62, metadata !124), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !124), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !124), !dbg !166
  %mul = mul nsw i64 %n, %n, !dbg !195
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !35, metadata !124), !dbg !167
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !37, metadata !124), !dbg !168
  %conv1 = trunc i64 %mul to i32, !dbg !196
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #6, !dbg !196
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !36, metadata !124), !dbg !168
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !28, metadata !124), !dbg !160
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !27, metadata !124), !dbg !160
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !124), !dbg !169
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !124), !dbg !161
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !124), !dbg !170
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !30, metadata !124), !dbg !162
  %cmp128 = icmp sgt i64 %n, 0, !dbg !197
  br i1 %cmp128, label %while.cond3.preheader.us.preheader, label %blklab7, !dbg !200

while.cond3.preheader.us.preheader:               ; preds = %entry
  br label %while.cond3.preheader.us, !dbg !201

while.cond3.preheader.us:                         ; preds = %while.cond3.preheader.us.preheader, %blklab9.loopexit.us
  %i.0129.us = phi i64 [ %add44.us, %blklab9.loopexit.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %arrayidx.us = getelementptr inbounds i64, i64* %data, i64 %i.0129.us, !dbg !201
  %mul14.us = mul nsw i64 %i.0129.us, %n, !dbg !203
  br label %if.end8.us, !dbg !201

if.end8.us:                                       ; preds = %while.cond3.preheader.us, %blklab12.us
  %j.0126.us = phi i64 [ %add43.us, %blklab12.us ], [ 0, %while.cond3.preheader.us ]
  %0 = load i64, i64* %arrayidx.us, align 8, !dbg !201, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !41, metadata !124), !dbg !172
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !32, metadata !124), !dbg !164
  %arrayidx9.us = getelementptr inbounds i64, i64* %data, i64 %j.0126.us, !dbg !206
  %1 = load i64, i64* %arrayidx9.us, align 8, !dbg !206, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !42, metadata !124), !dbg !173
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !33, metadata !124), !dbg !165
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !124), !dbg !174
  %cmp10.us = icmp eq i64 %0, 0, !dbg !207
  br i1 %cmp10.us, label %if.end13.us, label %while.cond20.preheader.us, !dbg !209

while.cond20.preheader.us:                        ; preds = %if.end8.us
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !124), !dbg !181
  %cmp22120122.us = icmp sgt i64 %0, -1, !dbg !210
  br i1 %cmp22120122.us, label %blklab15.lr.ph.us.preheader, label %if.end25.loopexit160, !dbg !214

blklab15.lr.ph.us.preheader:                      ; preds = %while.cond20.preheader.us
  %cmp27.us157 = icmp eq i64 %1, 0, !dbg !215
  br i1 %cmp27.us157, label %blklab13.us-lcssa.us.us, label %blklab15.us136.preheader.preheader, !dbg !217

blklab15.us136.preheader.preheader:               ; preds = %blklab15.lr.ph.us.preheader
  br label %blklab15.us136.preheader, !dbg !182

blklab15.us136.preheader:                         ; preds = %blklab15.us136.preheader.preheader, %blklab16.us-lcssa.us146
  %b.0.ph123.us159 = phi i64 [ %sub35.us, %blklab16.us-lcssa.us146 ], [ %1, %blklab15.us136.preheader.preheader ]
  %a.0.ph124.us158 = phi i64 [ %a.0121.us137.lcssa, %blklab16.us-lcssa.us146 ], [ %0, %blklab15.us136.preheader.preheader ]
  br label %blklab15.us136, !dbg !182

blklab15.us136:                                   ; preds = %blklab15.us136.preheader, %if.end34.us140
  %a.0121.us137 = phi i64 [ %sub.us141, %if.end34.us140 ], [ %a.0.ph124.us158, %blklab15.us136.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !124), !dbg !182
  %cmp31.us139 = icmp sgt i64 %a.0121.us137, %b.0.ph123.us159, !dbg !218
  br i1 %cmp31.us139, label %if.end34.us140, label %blklab16.us-lcssa.us146, !dbg !220

if.end34.us140:                                   ; preds = %blklab15.us136
  %sub.us141 = sub nsw i64 %a.0121.us137, %b.0.ph123.us159, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %sub.us141, i64 0, metadata !52, metadata !124), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 %sub.us141, i64 0, metadata !32, metadata !124), !dbg !164
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !124), !dbg !181
  %cmp22.us142 = icmp sgt i64 %sub.us141, -1, !dbg !210
  br i1 %cmp22.us142, label %blklab15.us136, label %if.end25.loopexit, !dbg !214

if.end13.us:                                      ; preds = %if.end8.us
  tail call void @llvm.dbg.value(metadata i64 %mul14.us, i64 0, metadata !44, metadata !124), !dbg !175
  %add.us = add nsw i64 %j.0126.us, %mul14.us, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !45, metadata !124), !dbg !176
  %arrayidx15.us = getelementptr inbounds i64, i64* %call, i64 %add.us, !dbg !223
  %2 = load i64, i64* %arrayidx15.us, align 8, !dbg !223, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !46, metadata !124), !dbg !177
  %add16.us = add nsw i64 %2, %1, !dbg !224
  tail call void @llvm.dbg.value(metadata i64 %add16.us, i64 0, metadata !47, metadata !124), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 %mul14.us, i64 0, metadata !48, metadata !124), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !49, metadata !124), !dbg !180
  store i64 %add16.us, i64* %arrayidx15.us, align 8, !dbg !225, !tbaa !204
  br label %blklab12.us, !dbg !226

blklab12.us:                                      ; preds = %if.end13.us, %blklab13.us-lcssa.us.us
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !60, metadata !124), !dbg !191
  %add43.us = add nuw nsw i64 %j.0126.us, 1, !dbg !227
  tail call void @llvm.dbg.value(metadata i64 %add43.us, i64 0, metadata !61, metadata !124), !dbg !192
  tail call void @llvm.dbg.value(metadata i64 %add43.us, i64 0, metadata !31, metadata !124), !dbg !163
  %cmp5.us = icmp slt i64 %add43.us, %n, !dbg !228
  br i1 %cmp5.us, label %if.end8.us, label %blklab9.loopexit.us, !dbg !230

blklab9.loopexit.us:                              ; preds = %blklab12.us
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !62, metadata !124), !dbg !193
  %add44.us = add nuw nsw i64 %i.0129.us, 1, !dbg !231
  tail call void @llvm.dbg.value(metadata i64 %add44.us, i64 0, metadata !63, metadata !124), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 %add44.us, i64 0, metadata !30, metadata !124), !dbg !162
  %cmp.us = icmp slt i64 %add44.us, %n, !dbg !197
  br i1 %cmp.us, label %while.cond3.preheader.us, label %blklab7.loopexit, !dbg !200

blklab16.us-lcssa.us146:                          ; preds = %blklab15.us136
  %a.0121.us137.lcssa = phi i64 [ %a.0121.us137, %blklab15.us136 ]
  %sub35.us = sub nsw i64 %b.0.ph123.us159, %a.0121.us137.lcssa, !dbg !232
  tail call void @llvm.dbg.value(metadata i64 %sub35.us, i64 0, metadata !53, metadata !124), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %sub35.us, i64 0, metadata !33, metadata !124), !dbg !165
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !124), !dbg !181
  %cmp27.us = icmp eq i64 %sub35.us, 0, !dbg !215
  br i1 %cmp27.us, label %blklab13.us-lcssa.us.us.loopexit, label %blklab15.us136.preheader, !dbg !217

blklab13.us-lcssa.us.us.loopexit:                 ; preds = %blklab16.us-lcssa.us146
  %a.0121.us137.lcssa.lcssa = phi i64 [ %a.0121.us137.lcssa, %blklab16.us-lcssa.us146 ]
  br label %blklab13.us-lcssa.us.us, !dbg !182

blklab13.us-lcssa.us.us:                          ; preds = %blklab13.us-lcssa.us.us.loopexit, %blklab15.lr.ph.us.preheader
  %a.0.ph124.us.lcssa = phi i64 [ %0, %blklab15.lr.ph.us.preheader ], [ %a.0121.us137.lcssa.lcssa, %blklab13.us-lcssa.us.us.loopexit ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !124), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 %mul14.us, i64 0, metadata !54, metadata !124), !dbg !185
  %add37.us = add nsw i64 %j.0126.us, %mul14.us, !dbg !233
  tail call void @llvm.dbg.value(metadata i64 %add37.us, i64 0, metadata !55, metadata !124), !dbg !186
  %arrayidx38.us = getelementptr inbounds i64, i64* %call, i64 %add37.us, !dbg !234
  %3 = load i64, i64* %arrayidx38.us, align 8, !dbg !234, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !56, metadata !124), !dbg !187
  %add39.us = add nsw i64 %3, %a.0.ph124.us.lcssa, !dbg !235
  tail call void @llvm.dbg.value(metadata i64 %add39.us, i64 0, metadata !57, metadata !124), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 %mul14.us, i64 0, metadata !58, metadata !124), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 %add37.us, i64 0, metadata !59, metadata !124), !dbg !190
  store i64 %add39.us, i64* %arrayidx38.us, align 8, !dbg !236, !tbaa !204
  br label %blklab12.us, !dbg !237

if.end25.loopexit:                                ; preds = %if.end34.us140
  br label %if.end25, !dbg !238

if.end25.loopexit160:                             ; preds = %while.cond20.preheader.us
  br label %if.end25, !dbg !238

if.end25:                                         ; preds = %if.end25.loopexit160, %if.end25.loopexit
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !238, !tbaa !145
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %4) #7, !dbg !239
  tail call void @exit(i32 -1) #8, !dbg !240
  unreachable, !dbg !240

blklab7.loopexit:                                 ; preds = %blklab9.loopexit.us
  br label %blklab7, !dbg !241

blklab7:                                          ; preds = %blklab7.loopexit, %entry
  ret i64* %call, !dbg !241
}

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !64 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !68, metadata !124), !dbg !242
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !69, metadata !124), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !124), !dbg !243
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !71, metadata !124), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !124), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !124), !dbg !245
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !124), !dbg !246
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !75, metadata !124), !dbg !247
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !124), !dbg !247
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !124), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !124), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !124), !dbg !250
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !124), !dbg !251
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !124), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !124), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !76, metadata !124), !dbg !247
  %conv1 = trunc i64 %n to i32, !dbg !253
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #6, !dbg !253
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !75, metadata !124), !dbg !247
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !72, metadata !124), !dbg !244
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !71, metadata !124), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !124), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !124), !dbg !245
  %cmp26 = icmp sgt i64 %n, 0, !dbg !254
  br i1 %cmp26, label %if.end.preheader, label %blklab18, !dbg !257

if.end.preheader:                                 ; preds = %entry
  %0 = add i64 %n, -1, !dbg !258
  %xtraiter = and i64 %n, 3, !dbg !258
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !258
  br i1 %lcmp.mod, label %if.end.preheader.split, label %if.end.prol.preheader, !dbg !258

if.end.prol.preheader:                            ; preds = %if.end.preheader
  br label %if.end.prol, !dbg !258

if.end.prol:                                      ; preds = %if.end.prol.preheader, %if.end.prol
  %i.027.prol = phi i64 [ %add4.prol, %if.end.prol ], [ 0, %if.end.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end.prol ], [ %xtraiter, %if.end.prol.preheader ]
  %arrayidx.prol = getelementptr inbounds i64, i64* %call, i64 %i.027.prol, !dbg !258
  %1 = load i64, i64* %arrayidx.prol, align 8, !dbg !258, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !78, metadata !124), !dbg !249
  %add.prol = add nsw i64 %1, %i.027.prol, !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %add.prol, i64 0, metadata !79, metadata !124), !dbg !250
  store i64 %add.prol, i64* %arrayidx.prol, align 8, !dbg !260, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !124), !dbg !251
  %add4.prol = add nuw nsw i64 %i.027.prol, 1, !dbg !261
  tail call void @llvm.dbg.value(metadata i64 %add4.prol, i64 0, metadata !81, metadata !124), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 %add4.prol, i64 0, metadata !73, metadata !124), !dbg !245
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !257
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !257
  br i1 %prol.iter.cmp, label %if.end.preheader.split.loopexit, label %if.end.prol, !dbg !257, !llvm.loop !262

if.end.preheader.split.loopexit:                  ; preds = %if.end.prol
  %add4.prol.lcssa = phi i64 [ %add4.prol, %if.end.prol ]
  br label %if.end.preheader.split, !dbg !258

if.end.preheader.split:                           ; preds = %if.end.preheader.split.loopexit, %if.end.preheader
  %i.027.unr = phi i64 [ 0, %if.end.preheader ], [ %add4.prol.lcssa, %if.end.preheader.split.loopexit ]
  %2 = icmp ult i64 %0, 3, !dbg !258
  br i1 %2, label %blklab18.loopexit, label %if.end.preheader.split.split, !dbg !258

if.end.preheader.split.split:                     ; preds = %if.end.preheader.split
  br label %if.end, !dbg !258

if.end:                                           ; preds = %if.end, %if.end.preheader.split.split
  %i.027 = phi i64 [ %i.027.unr, %if.end.preheader.split.split ], [ %add4.3, %if.end ]
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %i.027, !dbg !258
  %3 = load i64, i64* %arrayidx, align 8, !dbg !258, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !78, metadata !124), !dbg !249
  %add = add nsw i64 %3, %i.027, !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !79, metadata !124), !dbg !250
  store i64 %add, i64* %arrayidx, align 8, !dbg !260, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !124), !dbg !251
  %add4 = add nuw nsw i64 %i.027, 1, !dbg !261
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !81, metadata !124), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !73, metadata !124), !dbg !245
  %arrayidx.1 = getelementptr inbounds i64, i64* %call, i64 %add4, !dbg !258
  %4 = load i64, i64* %arrayidx.1, align 8, !dbg !258, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !78, metadata !124), !dbg !249
  %add.1 = add nsw i64 %4, %add4, !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !79, metadata !124), !dbg !250
  store i64 %add.1, i64* %arrayidx.1, align 8, !dbg !260, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !124), !dbg !251
  %add4.1 = add nsw i64 %i.027, 2, !dbg !261
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !81, metadata !124), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !73, metadata !124), !dbg !245
  %arrayidx.2 = getelementptr inbounds i64, i64* %call, i64 %add4.1, !dbg !258
  %5 = load i64, i64* %arrayidx.2, align 8, !dbg !258, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !78, metadata !124), !dbg !249
  %add.2 = add nsw i64 %5, %add4.1, !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !79, metadata !124), !dbg !250
  store i64 %add.2, i64* %arrayidx.2, align 8, !dbg !260, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !124), !dbg !251
  %add4.2 = add nsw i64 %i.027, 3, !dbg !261
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !81, metadata !124), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !73, metadata !124), !dbg !245
  %arrayidx.3 = getelementptr inbounds i64, i64* %call, i64 %add4.2, !dbg !258
  %6 = load i64, i64* %arrayidx.3, align 8, !dbg !258, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !78, metadata !124), !dbg !249
  %add.3 = add nsw i64 %6, %add4.2, !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !79, metadata !124), !dbg !250
  store i64 %add.3, i64* %arrayidx.3, align 8, !dbg !260, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !124), !dbg !251
  %add4.3 = add nsw i64 %i.027, 4, !dbg !261
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !81, metadata !124), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 %add4, i64 0, metadata !73, metadata !124), !dbg !245
  %exitcond.3 = icmp eq i64 %add4.3, %n, !dbg !257
  br i1 %exitcond.3, label %blklab18.loopexit.unr-lcssa, label %if.end, !dbg !257

blklab18.loopexit.unr-lcssa:                      ; preds = %if.end
  br label %blklab18.loopexit, !dbg !264

blklab18.loopexit:                                ; preds = %if.end.preheader.split, %blklab18.loopexit.unr-lcssa
  br label %blklab18, !dbg !264

blklab18:                                         ; preds = %blklab18.loopexit, %entry
  ret i64* %call, !dbg !264
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #3 !dbg !82 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !90, metadata !124), !dbg !265
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !91, metadata !124), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !124), !dbg !267
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !93, metadata !124), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !94, metadata !124), !dbg !268
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !95, metadata !124), !dbg !269
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !96, metadata !124), !dbg !269
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !124), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !124), !dbg !271
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !99, metadata !124), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !124), !dbg !273
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !101, metadata !124), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !124), !dbg !274
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !103, metadata !124), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !124), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !105, metadata !124), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !124), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !107, metadata !124), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !124), !dbg !279
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !109, metadata !124), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !124), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !111, metadata !124), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !124), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !113, metadata !124), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !124), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !115, metadata !124), !dbg !286
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !118, metadata !124), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !119, metadata !124), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !100, metadata !124), !dbg !273
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !92, metadata !124), !dbg !267
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !68, metadata !124) #6, !dbg !288
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !69, metadata !124) #6, !dbg !290
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !124) #6, !dbg !290
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !71, metadata !124) #6, !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !124) #6, !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !124) #6, !dbg !292
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !124) #6, !dbg !293
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !75, metadata !124) #6, !dbg !294
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !124) #6, !dbg !294
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !124) #6, !dbg !295
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !124) #6, !dbg !296
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !124) #6, !dbg !297
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !124) #6, !dbg !298
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !124) #6, !dbg !299
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !124) #6, !dbg !293
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !76, metadata !124) #6, !dbg !294
  %call.i = tail call i64* @gen1DArray(i32 0, i32 1000) #6, !dbg !300
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !75, metadata !124) #6, !dbg !294
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !72, metadata !124) #6, !dbg !291
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !71, metadata !124) #6, !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !124) #6, !dbg !295
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !124) #6, !dbg !292
  br label %if.end.i, !dbg !301

if.end.i:                                         ; preds = %if.end.i, %entry
  %i.027.i = phi i64 [ 0, %entry ], [ %add4.i.4, %if.end.i ], !dbg !301
  %arrayidx.i = getelementptr inbounds i64, i64* %call.i, i64 %i.027.i, !dbg !302
  %0 = load i64, i64* %arrayidx.i, align 8, !dbg !302, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !78, metadata !124) #6, !dbg !296
  %add.i = add nsw i64 %0, %i.027.i, !dbg !303
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !79, metadata !124) #6, !dbg !297
  store i64 %add.i, i64* %arrayidx.i, align 8, !dbg !304, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !124) #6, !dbg !298
  %add4.i = add nuw nsw i64 %i.027.i, 1, !dbg !305
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !81, metadata !124) #6, !dbg !299
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !73, metadata !124) #6, !dbg !292
  %arrayidx.i.1 = getelementptr inbounds i64, i64* %call.i, i64 %add4.i, !dbg !302
  %1 = load i64, i64* %arrayidx.i.1, align 8, !dbg !302, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !78, metadata !124) #6, !dbg !296
  %add.i.1 = add nsw i64 %1, %add4.i, !dbg !303
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !79, metadata !124) #6, !dbg !297
  store i64 %add.i.1, i64* %arrayidx.i.1, align 8, !dbg !304, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !124) #6, !dbg !298
  %add4.i.1 = add nsw i64 %i.027.i, 2, !dbg !305
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !81, metadata !124) #6, !dbg !299
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !73, metadata !124) #6, !dbg !292
  %arrayidx.i.2 = getelementptr inbounds i64, i64* %call.i, i64 %add4.i.1, !dbg !302
  %2 = load i64, i64* %arrayidx.i.2, align 8, !dbg !302, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !78, metadata !124) #6, !dbg !296
  %add.i.2 = add nsw i64 %2, %add4.i.1, !dbg !303
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !79, metadata !124) #6, !dbg !297
  store i64 %add.i.2, i64* %arrayidx.i.2, align 8, !dbg !304, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !124) #6, !dbg !298
  %add4.i.2 = add nsw i64 %i.027.i, 3, !dbg !305
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !81, metadata !124) #6, !dbg !299
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !73, metadata !124) #6, !dbg !292
  %arrayidx.i.3 = getelementptr inbounds i64, i64* %call.i, i64 %add4.i.2, !dbg !302
  %3 = load i64, i64* %arrayidx.i.3, align 8, !dbg !302, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !78, metadata !124) #6, !dbg !296
  %add.i.3 = add nsw i64 %3, %add4.i.2, !dbg !303
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !79, metadata !124) #6, !dbg !297
  store i64 %add.i.3, i64* %arrayidx.i.3, align 8, !dbg !304, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !124) #6, !dbg !298
  %add4.i.3 = add nsw i64 %i.027.i, 4, !dbg !305
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !81, metadata !124) #6, !dbg !299
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !73, metadata !124) #6, !dbg !292
  %arrayidx.i.4 = getelementptr inbounds i64, i64* %call.i, i64 %add4.i.3, !dbg !302
  %4 = load i64, i64* %arrayidx.i.4, align 8, !dbg !302, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !78, metadata !124) #6, !dbg !296
  %add.i.4 = add nsw i64 %4, %add4.i.3, !dbg !303
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !79, metadata !124) #6, !dbg !297
  store i64 %add.i.4, i64* %arrayidx.i.4, align 8, !dbg !304, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !80, metadata !124) #6, !dbg !298
  %add4.i.4 = add nsw i64 %i.027.i, 5, !dbg !305
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !81, metadata !124) #6, !dbg !299
  tail call void @llvm.dbg.value(metadata i64 %add4.i, i64 0, metadata !73, metadata !124) #6, !dbg !292
  %exitcond.i.4 = icmp eq i64 %add4.i.4, 1000, !dbg !306
  br i1 %exitcond.i.4, label %init.exit, label %if.end.i, !dbg !306

init.exit:                                        ; preds = %if.end.i
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !101, metadata !124), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !94, metadata !124), !dbg !268
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !93, metadata !124), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !124), !dbg !275
  %call1 = tail call i64* @gcd_array(i64* nonnull %call.i, i64 undef, i64 1000), !dbg !307
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !103, metadata !124), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !96, metadata !124), !dbg !269
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !95, metadata !124), !dbg !269
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !105, metadata !124), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !124), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !124), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !124), !dbg !271
  br label %while.cond2.preheader, !dbg !308

while.cond2.preheader:                            ; preds = %init.exit, %blklab22
  %sum.033 = phi i64 [ 0, %init.exit ], [ %add7.4.lcssa, %blklab22 ]
  %i.032 = phi i64 [ 0, %init.exit ], [ %add9, %blklab22 ]
  %mul = mul nuw nsw i64 %i.032, 1000, !dbg !310
  br label %if.end6, !dbg !312

if.end6:                                          ; preds = %if.end6, %while.cond2.preheader
  %sum.131 = phi i64 [ %sum.033, %while.cond2.preheader ], [ %add7.4, %if.end6 ]
  %j.030 = phi i64 [ 0, %while.cond2.preheader ], [ %add8.4, %if.end6 ]
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !108, metadata !124), !dbg !279
  %add = add nuw nsw i64 %j.030, %mul, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !109, metadata !124), !dbg !280
  %arrayidx = getelementptr inbounds i64, i64* %call1, i64 %add, !dbg !314
  %5 = load i64, i64* %arrayidx, align 8, !dbg !314, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !110, metadata !124), !dbg !281
  %add7 = add nsw i64 %5, %sum.131, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !111, metadata !124), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !97, metadata !124), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !112, metadata !124), !dbg !283
  %add8 = add nuw nsw i64 %j.030, 1, !dbg !316
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !113, metadata !124), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !99, metadata !124), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !108, metadata !124), !dbg !279
  %add.1 = add nuw nsw i64 %add8, %mul, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !109, metadata !124), !dbg !280
  %arrayidx.1 = getelementptr inbounds i64, i64* %call1, i64 %add.1, !dbg !314
  %6 = load i64, i64* %arrayidx.1, align 8, !dbg !314, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !110, metadata !124), !dbg !281
  %add7.1 = add nsw i64 %6, %add7, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !111, metadata !124), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !97, metadata !124), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !112, metadata !124), !dbg !283
  %add8.1 = add nsw i64 %j.030, 2, !dbg !316
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !113, metadata !124), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !99, metadata !124), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !108, metadata !124), !dbg !279
  %add.2 = add nuw nsw i64 %add8.1, %mul, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !109, metadata !124), !dbg !280
  %arrayidx.2 = getelementptr inbounds i64, i64* %call1, i64 %add.2, !dbg !314
  %7 = load i64, i64* %arrayidx.2, align 8, !dbg !314, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !110, metadata !124), !dbg !281
  %add7.2 = add nsw i64 %7, %add7.1, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !111, metadata !124), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !97, metadata !124), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !112, metadata !124), !dbg !283
  %add8.2 = add nsw i64 %j.030, 3, !dbg !316
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !113, metadata !124), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !99, metadata !124), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !108, metadata !124), !dbg !279
  %add.3 = add nuw nsw i64 %add8.2, %mul, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !109, metadata !124), !dbg !280
  %arrayidx.3 = getelementptr inbounds i64, i64* %call1, i64 %add.3, !dbg !314
  %8 = load i64, i64* %arrayidx.3, align 8, !dbg !314, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !110, metadata !124), !dbg !281
  %add7.3 = add nsw i64 %8, %add7.2, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !111, metadata !124), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !97, metadata !124), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !112, metadata !124), !dbg !283
  %add8.3 = add nsw i64 %j.030, 4, !dbg !316
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !113, metadata !124), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !99, metadata !124), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !108, metadata !124), !dbg !279
  %add.4 = add nuw nsw i64 %add8.3, %mul, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !109, metadata !124), !dbg !280
  %arrayidx.4 = getelementptr inbounds i64, i64* %call1, i64 %add.4, !dbg !314
  %9 = load i64, i64* %arrayidx.4, align 8, !dbg !314, !tbaa !204
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !110, metadata !124), !dbg !281
  %add7.4 = add nsw i64 %9, %add7.3, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !111, metadata !124), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 %add7, i64 0, metadata !97, metadata !124), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !112, metadata !124), !dbg !283
  %add8.4 = add nsw i64 %j.030, 5, !dbg !316
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !113, metadata !124), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 %add8, i64 0, metadata !99, metadata !124), !dbg !272
  %exitcond.4 = icmp eq i64 %add8.4, 1000, !dbg !312
  br i1 %exitcond.4, label %blklab22, label %if.end6, !dbg !312

blklab22:                                         ; preds = %if.end6
  %add7.4.lcssa = phi i64 [ %add7.4, %if.end6 ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !114, metadata !124), !dbg !285
  %add9 = add nuw nsw i64 %i.032, 1, !dbg !317
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !115, metadata !124), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !98, metadata !124), !dbg !271
  %exitcond34 = icmp eq i64 %add9, 1000, !dbg !308
  br i1 %exitcond34, label %blklab20, label %while.cond2.preheader, !dbg !308

blklab20:                                         ; preds = %blklab22
  %add7.4.lcssa.lcssa = phi i64 [ %add7.4.lcssa, %blklab22 ]
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !119, metadata !124), !dbg !287
  %call10 = tail call noalias i8* @malloc(i64 32) #6, !dbg !318
  %10 = bitcast i8* %call10 to i64*, !dbg !318
  tail call void @llvm.dbg.value(metadata i64* %10, i64 0, metadata !118, metadata !124), !dbg !287
  %11 = bitcast i8* %call10 to <2 x i64>*, !dbg !319
  store <2 x i64> <i64 83, i64 85>, <2 x i64>* %11, align 8, !dbg !319, !tbaa !204
  %arrayidx13 = getelementptr inbounds i8, i8* %call10, i64 16, !dbg !320
  %12 = bitcast i8* %arrayidx13 to <2 x i64>*, !dbg !321
  store <2 x i64> <i64 77, i64 58>, <2 x i64>* %12, align 8, !dbg !321, !tbaa !204
  tail call void @printf_s(i64* %10, i64 4) #6, !dbg !322
  %call15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %add7.4.lcssa.lcssa), !dbg !323
  tail call void @exit(i32 0) #8, !dbg !324
  unreachable, !dbg !324
}

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
!llvm.module.flags = !{!121, !122}
!llvm.ident = !{!123}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3)
!1 = !DIFile(filename: "GCD.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate")
!2 = !{}
!3 = !{!4, !17, !64, !82}
!4 = distinct !DISubprogram(name: "gcd", scope: !1, file: !1, line: 2, type: !5, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, variables: !8)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7, !7}
!7 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16}
!9 = !DILocalVariable(name: "a", arg: 1, scope: !4, file: !1, line: 2, type: !7)
!10 = !DILocalVariable(name: "b", arg: 2, scope: !4, file: !1, line: 2, type: !7)
!11 = !DILocalVariable(name: "_2", scope: !4, file: !1, line: 3, type: !7)
!12 = !DILocalVariable(name: "_3", scope: !4, file: !1, line: 4, type: !7)
!13 = !DILocalVariable(name: "_4", scope: !4, file: !1, line: 5, type: !7)
!14 = !DILocalVariable(name: "_5", scope: !4, file: !1, line: 6, type: !7)
!15 = !DILocalVariable(name: "_6", scope: !4, file: !1, line: 7, type: !7)
!16 = !DILocalVariable(name: "_7", scope: !4, file: !1, line: 8, type: !7)
!17 = distinct !DISubprogram(name: "gcd_array", scope: !1, file: !1, line: 62, type: !18, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: true, variables: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !20, !7, !7}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!21 = !{!22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !1, line: 62, type: !20)
!23 = !DILocalVariable(name: "data_size", arg: 2, scope: !17, file: !1, line: 62, type: !7)
!24 = !DILocalVariable(name: "n", arg: 3, scope: !17, file: !1, line: 62, type: !7)
!25 = !DILocalVariable(name: "_2", scope: !17, file: !1, line: 63, type: !20)
!26 = !DILocalVariable(name: "_2_size", scope: !17, file: !1, line: 63, type: !7)
!27 = !DILocalVariable(name: "gcds", scope: !17, file: !1, line: 64, type: !20)
!28 = !DILocalVariable(name: "gcds_size", scope: !17, file: !1, line: 64, type: !7)
!29 = !DILocalVariable(name: "sum", scope: !17, file: !1, line: 65, type: !7)
!30 = !DILocalVariable(name: "i", scope: !17, file: !1, line: 66, type: !7)
!31 = !DILocalVariable(name: "j", scope: !17, file: !1, line: 67, type: !7)
!32 = !DILocalVariable(name: "a", scope: !17, file: !1, line: 68, type: !7)
!33 = !DILocalVariable(name: "b", scope: !17, file: !1, line: 69, type: !7)
!34 = !DILocalVariable(name: "_9", scope: !17, file: !1, line: 70, type: !7)
!35 = !DILocalVariable(name: "_10", scope: !17, file: !1, line: 71, type: !7)
!36 = !DILocalVariable(name: "_11", scope: !17, file: !1, line: 72, type: !20)
!37 = !DILocalVariable(name: "_11_size", scope: !17, file: !1, line: 72, type: !7)
!38 = !DILocalVariable(name: "_12", scope: !17, file: !1, line: 73, type: !7)
!39 = !DILocalVariable(name: "_13", scope: !17, file: !1, line: 74, type: !7)
!40 = !DILocalVariable(name: "_14", scope: !17, file: !1, line: 75, type: !7)
!41 = !DILocalVariable(name: "_15", scope: !17, file: !1, line: 76, type: !7)
!42 = !DILocalVariable(name: "_16", scope: !17, file: !1, line: 77, type: !7)
!43 = !DILocalVariable(name: "_17", scope: !17, file: !1, line: 78, type: !7)
!44 = !DILocalVariable(name: "_18", scope: !17, file: !1, line: 79, type: !7)
!45 = !DILocalVariable(name: "_19", scope: !17, file: !1, line: 80, type: !7)
!46 = !DILocalVariable(name: "_20", scope: !17, file: !1, line: 81, type: !7)
!47 = !DILocalVariable(name: "_21", scope: !17, file: !1, line: 82, type: !7)
!48 = !DILocalVariable(name: "_22", scope: !17, file: !1, line: 83, type: !7)
!49 = !DILocalVariable(name: "_23", scope: !17, file: !1, line: 84, type: !7)
!50 = !DILocalVariable(name: "_24", scope: !17, file: !1, line: 85, type: !7)
!51 = !DILocalVariable(name: "_25", scope: !17, file: !1, line: 86, type: !7)
!52 = !DILocalVariable(name: "_26", scope: !17, file: !1, line: 87, type: !7)
!53 = !DILocalVariable(name: "_27", scope: !17, file: !1, line: 88, type: !7)
!54 = !DILocalVariable(name: "_28", scope: !17, file: !1, line: 89, type: !7)
!55 = !DILocalVariable(name: "_29", scope: !17, file: !1, line: 90, type: !7)
!56 = !DILocalVariable(name: "_30", scope: !17, file: !1, line: 91, type: !7)
!57 = !DILocalVariable(name: "_31", scope: !17, file: !1, line: 92, type: !7)
!58 = !DILocalVariable(name: "_32", scope: !17, file: !1, line: 93, type: !7)
!59 = !DILocalVariable(name: "_33", scope: !17, file: !1, line: 94, type: !7)
!60 = !DILocalVariable(name: "_34", scope: !17, file: !1, line: 95, type: !7)
!61 = !DILocalVariable(name: "_35", scope: !17, file: !1, line: 96, type: !7)
!62 = !DILocalVariable(name: "_36", scope: !17, file: !1, line: 97, type: !7)
!63 = !DILocalVariable(name: "_37", scope: !17, file: !1, line: 98, type: !7)
!64 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 240, type: !65, isLocal: false, isDefinition: true, scopeLine: 240, flags: DIFlagPrototyped, isOptimized: true, variables: !67)
!65 = !DISubroutineType(types: !66)
!66 = !{!20, !7}
!67 = !{!68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81}
!68 = !DILocalVariable(name: "n", arg: 1, scope: !64, file: !1, line: 240, type: !7)
!69 = !DILocalVariable(name: "_1", scope: !64, file: !1, line: 241, type: !20)
!70 = !DILocalVariable(name: "_1_size", scope: !64, file: !1, line: 241, type: !7)
!71 = !DILocalVariable(name: "data", scope: !64, file: !1, line: 242, type: !20)
!72 = !DILocalVariable(name: "data_size", scope: !64, file: !1, line: 242, type: !7)
!73 = !DILocalVariable(name: "i", scope: !64, file: !1, line: 243, type: !7)
!74 = !DILocalVariable(name: "_4", scope: !64, file: !1, line: 244, type: !7)
!75 = !DILocalVariable(name: "_5", scope: !64, file: !1, line: 245, type: !20)
!76 = !DILocalVariable(name: "_5_size", scope: !64, file: !1, line: 245, type: !7)
!77 = !DILocalVariable(name: "_6", scope: !64, file: !1, line: 246, type: !7)
!78 = !DILocalVariable(name: "_7", scope: !64, file: !1, line: 247, type: !7)
!79 = !DILocalVariable(name: "_8", scope: !64, file: !1, line: 248, type: !7)
!80 = !DILocalVariable(name: "_9", scope: !64, file: !1, line: 249, type: !7)
!81 = !DILocalVariable(name: "_10", scope: !64, file: !1, line: 250, type: !7)
!82 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 287, type: !83, isLocal: false, isDefinition: true, scopeLine: 287, flags: DIFlagPrototyped, isOptimized: true, variables: !89)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64, align: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64, align: 64)
!88 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!89 = !{!90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !118, !119, !120}
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !1, line: 287, type: !85)
!91 = !DILocalVariable(name: "args", arg: 2, scope: !82, file: !1, line: 287, type: !86)
!92 = !DILocalVariable(name: "n", scope: !82, file: !1, line: 288, type: !7)
!93 = !DILocalVariable(name: "data", scope: !82, file: !1, line: 289, type: !20)
!94 = !DILocalVariable(name: "data_size", scope: !82, file: !1, line: 289, type: !7)
!95 = !DILocalVariable(name: "gcds", scope: !82, file: !1, line: 290, type: !20)
!96 = !DILocalVariable(name: "gcds_size", scope: !82, file: !1, line: 290, type: !7)
!97 = !DILocalVariable(name: "sum", scope: !82, file: !1, line: 291, type: !7)
!98 = !DILocalVariable(name: "i", scope: !82, file: !1, line: 292, type: !7)
!99 = !DILocalVariable(name: "j", scope: !82, file: !1, line: 293, type: !7)
!100 = !DILocalVariable(name: "_7", scope: !82, file: !1, line: 294, type: !7)
!101 = !DILocalVariable(name: "_8", scope: !82, file: !1, line: 295, type: !20)
!102 = !DILocalVariable(name: "_8_size", scope: !82, file: !1, line: 295, type: !7)
!103 = !DILocalVariable(name: "_9", scope: !82, file: !1, line: 296, type: !20)
!104 = !DILocalVariable(name: "_9_size", scope: !82, file: !1, line: 296, type: !7)
!105 = !DILocalVariable(name: "_10", scope: !82, file: !1, line: 297, type: !7)
!106 = !DILocalVariable(name: "_11", scope: !82, file: !1, line: 298, type: !7)
!107 = !DILocalVariable(name: "_12", scope: !82, file: !1, line: 299, type: !7)
!108 = !DILocalVariable(name: "_13", scope: !82, file: !1, line: 300, type: !7)
!109 = !DILocalVariable(name: "_14", scope: !82, file: !1, line: 301, type: !7)
!110 = !DILocalVariable(name: "_15", scope: !82, file: !1, line: 302, type: !7)
!111 = !DILocalVariable(name: "_16", scope: !82, file: !1, line: 303, type: !7)
!112 = !DILocalVariable(name: "_17", scope: !82, file: !1, line: 304, type: !7)
!113 = !DILocalVariable(name: "_18", scope: !82, file: !1, line: 305, type: !7)
!114 = !DILocalVariable(name: "_19", scope: !82, file: !1, line: 306, type: !7)
!115 = !DILocalVariable(name: "_20", scope: !82, file: !1, line: 307, type: !7)
!116 = !DILocalVariable(name: "_21", scope: !82, file: !1, line: 308, type: !117)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!118 = !DILocalVariable(name: "_23", scope: !82, file: !1, line: 309, type: !20)
!119 = !DILocalVariable(name: "_23_size", scope: !82, file: !1, line: 309, type: !7)
!120 = !DILocalVariable(name: "_24", scope: !82, file: !1, line: 310, type: !117)
!121 = !{i32 2, !"Dwarf Version", i32 4}
!122 = !{i32 2, !"Debug Info Version", i32 3}
!123 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!124 = !DIExpression()
!125 = !DILocation(line: 2, column: 25, scope: !4)
!126 = !DILocation(line: 2, column: 38, scope: !4)
!127 = !DILocation(line: 3, column: 12, scope: !4)
!128 = !DILocation(line: 4, column: 12, scope: !4)
!129 = !DILocation(line: 5, column: 12, scope: !4)
!130 = !DILocation(line: 6, column: 12, scope: !4)
!131 = !DILocation(line: 7, column: 12, scope: !4)
!132 = !DILocation(line: 8, column: 12, scope: !4)
!133 = !DILocation(line: 12, column: 6, scope: !134)
!134 = distinct !DILexicalBlock(scope: !4, file: !1, line: 12, column: 5)
!135 = !DILocation(line: 12, column: 5, scope: !4)
!136 = !DILocation(line: 24, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !138, file: !1, line: 24, column: 7)
!138 = distinct !DILexicalBlock(scope: !139, file: !1, line: 20, column: 3)
!139 = distinct !DILexicalBlock(scope: !4, file: !1, line: 18, column: 13)
!140 = !DILocation(line: 24, column: 7, scope: !138)
!141 = !DILocation(line: 35, column: 7, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !1, line: 35, column: 6)
!143 = !DILocation(line: 35, column: 6, scope: !139)
!144 = !DILocation(line: 26, column: 12, scope: !138)
!145 = !{!146, !146, i64 0}
!146 = !{!"any pointer", !147, i64 0}
!147 = !{!"omnipotent char", !148, i64 0}
!148 = !{!"Simple C/C++ TBAA"}
!149 = !DILocation(line: 26, column: 4, scope: !138)
!150 = !DILocation(line: 27, column: 4, scope: !138)
!151 = !DILocation(line: 37, column: 7, scope: !152)
!152 = distinct !DILexicalBlock(scope: !139, file: !1, line: 37, column: 6)
!153 = !DILocation(line: 37, column: 6, scope: !139)
!154 = !DILocation(line: 39, column: 7, scope: !139)
!155 = !DILocation(line: 47, column: 7, scope: !139)
!156 = !DILocation(line: 60, column: 1, scope: !4)
!157 = !DILocation(line: 62, column: 22, scope: !17)
!158 = !DILocation(line: 62, column: 59, scope: !17)
!159 = !DILocation(line: 63, column: 2, scope: !17)
!160 = !DILocation(line: 64, column: 2, scope: !17)
!161 = !DILocation(line: 65, column: 12, scope: !17)
!162 = !DILocation(line: 66, column: 12, scope: !17)
!163 = !DILocation(line: 67, column: 12, scope: !17)
!164 = !DILocation(line: 68, column: 12, scope: !17)
!165 = !DILocation(line: 69, column: 12, scope: !17)
!166 = !DILocation(line: 70, column: 12, scope: !17)
!167 = !DILocation(line: 71, column: 12, scope: !17)
!168 = !DILocation(line: 72, column: 2, scope: !17)
!169 = !DILocation(line: 73, column: 12, scope: !17)
!170 = !DILocation(line: 74, column: 12, scope: !17)
!171 = !DILocation(line: 75, column: 12, scope: !17)
!172 = !DILocation(line: 76, column: 12, scope: !17)
!173 = !DILocation(line: 77, column: 12, scope: !17)
!174 = !DILocation(line: 78, column: 12, scope: !17)
!175 = !DILocation(line: 79, column: 12, scope: !17)
!176 = !DILocation(line: 80, column: 12, scope: !17)
!177 = !DILocation(line: 81, column: 12, scope: !17)
!178 = !DILocation(line: 82, column: 12, scope: !17)
!179 = !DILocation(line: 83, column: 12, scope: !17)
!180 = !DILocation(line: 84, column: 12, scope: !17)
!181 = !DILocation(line: 85, column: 12, scope: !17)
!182 = !DILocation(line: 86, column: 12, scope: !17)
!183 = !DILocation(line: 87, column: 12, scope: !17)
!184 = !DILocation(line: 88, column: 12, scope: !17)
!185 = !DILocation(line: 89, column: 12, scope: !17)
!186 = !DILocation(line: 90, column: 12, scope: !17)
!187 = !DILocation(line: 91, column: 12, scope: !17)
!188 = !DILocation(line: 92, column: 12, scope: !17)
!189 = !DILocation(line: 93, column: 12, scope: !17)
!190 = !DILocation(line: 94, column: 12, scope: !17)
!191 = !DILocation(line: 95, column: 12, scope: !17)
!192 = !DILocation(line: 96, column: 12, scope: !17)
!193 = !DILocation(line: 97, column: 12, scope: !17)
!194 = !DILocation(line: 98, column: 12, scope: !17)
!195 = !DILocation(line: 102, column: 7, scope: !17)
!196 = !DILocation(line: 104, column: 2, scope: !17)
!197 = !DILocation(line: 118, column: 7, scope: !198)
!198 = distinct !DILexicalBlock(scope: !199, file: !1, line: 118, column: 6)
!199 = distinct !DILexicalBlock(scope: !17, file: !1, line: 116, column: 13)
!200 = !DILocation(line: 118, column: 6, scope: !199)
!201 = !DILocation(line: 128, column: 8, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !1, line: 124, column: 14)
!203 = !DILocation(line: 140, column: 9, scope: !202)
!204 = !{!205, !205, i64 0}
!205 = !{!"long long", !147, i64 0}
!206 = !DILocation(line: 132, column: 8, scope: !202)
!207 = !DILocation(line: 138, column: 8, scope: !208)
!208 = distinct !DILexicalBlock(scope: !202, file: !1, line: 138, column: 7)
!209 = !DILocation(line: 138, column: 7, scope: !202)
!210 = !DILocation(line: 164, column: 10, scope: !211)
!211 = distinct !DILexicalBlock(scope: !212, file: !1, line: 164, column: 9)
!212 = distinct !DILexicalBlock(scope: !213, file: !1, line: 160, column: 5)
!213 = distinct !DILexicalBlock(scope: !202, file: !1, line: 158, column: 15)
!214 = !DILocation(line: 164, column: 9, scope: !212)
!215 = !DILocation(line: 175, column: 9, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !1, line: 175, column: 8)
!217 = !DILocation(line: 175, column: 8, scope: !213)
!218 = !DILocation(line: 177, column: 9, scope: !219)
!219 = distinct !DILexicalBlock(scope: !213, file: !1, line: 177, column: 8)
!220 = !DILocation(line: 177, column: 8, scope: !213)
!221 = !DILocation(line: 179, column: 10, scope: !213)
!222 = !DILocation(line: 142, column: 11, scope: !202)
!223 = !DILocation(line: 144, column: 8, scope: !202)
!224 = !DILocation(line: 146, column: 11, scope: !202)
!225 = !DILocation(line: 152, column: 14, scope: !202)
!226 = !DILocation(line: 154, column: 4, scope: !202)
!227 = !DILocation(line: 216, column: 9, scope: !202)
!228 = !DILocation(line: 126, column: 8, scope: !229)
!229 = distinct !DILexicalBlock(scope: !202, file: !1, line: 126, column: 7)
!230 = !DILocation(line: 126, column: 7, scope: !202)
!231 = !DILocation(line: 227, column: 8, scope: !199)
!232 = !DILocation(line: 187, column: 10, scope: !213)
!233 = !DILocation(line: 200, column: 11, scope: !202)
!234 = !DILocation(line: 202, column: 8, scope: !202)
!235 = !DILocation(line: 204, column: 11, scope: !202)
!236 = !DILocation(line: 210, column: 14, scope: !202)
!237 = !DILocation(line: 210, column: 4, scope: !202)
!238 = !DILocation(line: 166, column: 14, scope: !212)
!239 = !DILocation(line: 166, column: 6, scope: !212)
!240 = !DILocation(line: 167, column: 6, scope: !212)
!241 = !DILocation(line: 236, column: 2, scope: !17)
!242 = !DILocation(line: 240, column: 27, scope: !64)
!243 = !DILocation(line: 241, column: 2, scope: !64)
!244 = !DILocation(line: 242, column: 2, scope: !64)
!245 = !DILocation(line: 243, column: 12, scope: !64)
!246 = !DILocation(line: 244, column: 12, scope: !64)
!247 = !DILocation(line: 245, column: 2, scope: !64)
!248 = !DILocation(line: 246, column: 12, scope: !64)
!249 = !DILocation(line: 247, column: 12, scope: !64)
!250 = !DILocation(line: 248, column: 12, scope: !64)
!251 = !DILocation(line: 249, column: 12, scope: !64)
!252 = !DILocation(line: 250, column: 12, scope: !64)
!253 = !DILocation(line: 254, column: 2, scope: !64)
!254 = !DILocation(line: 264, column: 7, scope: !255)
!255 = distinct !DILexicalBlock(scope: !256, file: !1, line: 264, column: 6)
!256 = distinct !DILexicalBlock(scope: !64, file: !1, line: 262, column: 13)
!257 = !DILocation(line: 264, column: 6, scope: !256)
!258 = !DILocation(line: 266, column: 6, scope: !256)
!259 = !DILocation(line: 268, column: 8, scope: !256)
!260 = !DILocation(line: 270, column: 11, scope: !256)
!261 = !DILocation(line: 274, column: 8, scope: !256)
!262 = distinct !{!262, !263}
!263 = !{!"llvm.loop.unroll.disable"}
!264 = !DILocation(line: 283, column: 2, scope: !64)
!265 = !DILocation(line: 287, column: 14, scope: !82)
!266 = !DILocation(line: 287, column: 27, scope: !82)
!267 = !DILocation(line: 288, column: 12, scope: !82)
!268 = !DILocation(line: 289, column: 2, scope: !82)
!269 = !DILocation(line: 290, column: 2, scope: !82)
!270 = !DILocation(line: 291, column: 12, scope: !82)
!271 = !DILocation(line: 292, column: 12, scope: !82)
!272 = !DILocation(line: 293, column: 12, scope: !82)
!273 = !DILocation(line: 294, column: 12, scope: !82)
!274 = !DILocation(line: 295, column: 2, scope: !82)
!275 = !DILocation(line: 296, column: 2, scope: !82)
!276 = !DILocation(line: 297, column: 12, scope: !82)
!277 = !DILocation(line: 298, column: 12, scope: !82)
!278 = !DILocation(line: 299, column: 12, scope: !82)
!279 = !DILocation(line: 300, column: 12, scope: !82)
!280 = !DILocation(line: 301, column: 12, scope: !82)
!281 = !DILocation(line: 302, column: 12, scope: !82)
!282 = !DILocation(line: 303, column: 12, scope: !82)
!283 = !DILocation(line: 304, column: 12, scope: !82)
!284 = !DILocation(line: 305, column: 12, scope: !82)
!285 = !DILocation(line: 306, column: 12, scope: !82)
!286 = !DILocation(line: 307, column: 12, scope: !82)
!287 = !DILocation(line: 309, column: 2, scope: !82)
!288 = !DILocation(line: 240, column: 27, scope: !64, inlinedAt: !289)
!289 = distinct !DILocation(line: 316, column: 7, scope: !82)
!290 = !DILocation(line: 241, column: 2, scope: !64, inlinedAt: !289)
!291 = !DILocation(line: 242, column: 2, scope: !64, inlinedAt: !289)
!292 = !DILocation(line: 243, column: 12, scope: !64, inlinedAt: !289)
!293 = !DILocation(line: 244, column: 12, scope: !64, inlinedAt: !289)
!294 = !DILocation(line: 245, column: 2, scope: !64, inlinedAt: !289)
!295 = !DILocation(line: 246, column: 12, scope: !64, inlinedAt: !289)
!296 = !DILocation(line: 247, column: 12, scope: !64, inlinedAt: !289)
!297 = !DILocation(line: 248, column: 12, scope: !64, inlinedAt: !289)
!298 = !DILocation(line: 249, column: 12, scope: !64, inlinedAt: !289)
!299 = !DILocation(line: 250, column: 12, scope: !64, inlinedAt: !289)
!300 = !DILocation(line: 254, column: 2, scope: !64, inlinedAt: !289)
!301 = !DILocation(line: 316, column: 7, scope: !82)
!302 = !DILocation(line: 266, column: 6, scope: !256, inlinedAt: !289)
!303 = !DILocation(line: 268, column: 8, scope: !256, inlinedAt: !289)
!304 = !DILocation(line: 270, column: 11, scope: !256, inlinedAt: !289)
!305 = !DILocation(line: 274, column: 8, scope: !256, inlinedAt: !289)
!306 = !DILocation(line: 264, column: 6, scope: !256, inlinedAt: !289)
!307 = !DILocation(line: 321, column: 7, scope: !82)
!308 = !DILocation(line: 335, column: 6, scope: !309)
!309 = distinct !DILexicalBlock(scope: !82, file: !1, line: 333, column: 13)
!310 = !DILocation(line: 345, column: 9, scope: !311)
!311 = distinct !DILexicalBlock(scope: !309, file: !1, line: 341, column: 14)
!312 = !DILocation(line: 343, column: 7, scope: !311)
!313 = !DILocation(line: 347, column: 11, scope: !311)
!314 = !DILocation(line: 349, column: 8, scope: !311)
!315 = !DILocation(line: 351, column: 11, scope: !311)
!316 = !DILocation(line: 357, column: 9, scope: !311)
!317 = !DILocation(line: 368, column: 8, scope: !309)
!318 = !DILocation(line: 379, column: 2, scope: !82)
!319 = !DILocation(line: 380, column: 9, scope: !82)
!320 = !DILocation(line: 380, column: 28, scope: !82)
!321 = !DILocation(line: 380, column: 35, scope: !82)
!322 = !DILocation(line: 382, column: 2, scope: !82)
!323 = !DILocation(line: 386, column: 2, scope: !82)
!324 = !DILocation(line: 388, column: 2, scope: !82)
