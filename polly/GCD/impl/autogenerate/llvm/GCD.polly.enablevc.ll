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
  tail call void @llvm.dbg.value(metadata i64 %a, i64 0, metadata !9, metadata !133), !dbg !134
  tail call void @llvm.dbg.value(metadata i64 %b, i64 0, metadata !10, metadata !133), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !11, metadata !133), !dbg !136
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !12, metadata !133), !dbg !137
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !13, metadata !133), !dbg !138
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !133), !dbg !139
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !15, metadata !133), !dbg !140
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !16, metadata !133), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !12, metadata !133), !dbg !137
  %cmp = icmp eq i64 %a, 0, !dbg !142
  br i1 %cmp, label %cleanup, label %while.cond.preheader, !dbg !144

while.cond.preheader:                             ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !13, metadata !133), !dbg !138
  %cmp13234 = icmp sgt i64 %a, -1, !dbg !145
  br i1 %cmp13234, label %blklab4.lr.ph.preheader, label %if.end3, !dbg !149

blklab4.lr.ph.preheader:                          ; preds = %while.cond.preheader
  %cmp447 = icmp eq i64 %b, 0, !dbg !150
  br i1 %cmp447, label %cleanup, label %blklab4.preheader.preheader, !dbg !152

blklab4.preheader.preheader:                      ; preds = %blklab4.lr.ph.preheader
  br label %blklab4.preheader, !dbg !139

blklab4.preheader:                                ; preds = %blklab4.preheader.preheader, %blklab5
  %b.addr.0.ph3549 = phi i64 [ %sub10, %blklab5 ], [ %b, %blklab4.preheader.preheader ]
  %a.addr.0.ph3648 = phi i64 [ %a.addr.033.lcssa, %blklab5 ], [ %a, %blklab4.preheader.preheader ]
  br label %blklab4, !dbg !139

if.end3.loopexit:                                 ; preds = %if.end9
  br label %if.end3, !dbg !153

if.end3:                                          ; preds = %if.end3.loopexit, %while.cond.preheader
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !153, !tbaa !154
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %0) #7, !dbg !158
  tail call void @exit(i32 -1) #8, !dbg !159
  unreachable, !dbg !159

blklab4:                                          ; preds = %blklab4.preheader, %if.end9
  %a.addr.033 = phi i64 [ %sub, %if.end9 ], [ %a.addr.0.ph3648, %blklab4.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !133), !dbg !139
  %cmp7 = icmp sgt i64 %a.addr.033, %b.addr.0.ph3549, !dbg !160
  br i1 %cmp7, label %if.end9, label %blklab5, !dbg !162

if.end9:                                          ; preds = %blklab4
  %sub = sub nsw i64 %a.addr.033, %b.addr.0.ph3549, !dbg !163
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !15, metadata !133), !dbg !140
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !9, metadata !133), !dbg !134
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !13, metadata !133), !dbg !138
  %cmp1 = icmp sgt i64 %sub, -1, !dbg !145
  br i1 %cmp1, label %blklab4, label %if.end3.loopexit, !dbg !149

blklab5:                                          ; preds = %blklab4
  %a.addr.033.lcssa = phi i64 [ %a.addr.033, %blklab4 ]
  %sub10 = sub nsw i64 %b.addr.0.ph3549, %a.addr.033.lcssa, !dbg !164
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !16, metadata !133), !dbg !141
  tail call void @llvm.dbg.value(metadata i64 %sub10, i64 0, metadata !10, metadata !133), !dbg !135
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !13, metadata !133), !dbg !138
  %cmp4 = icmp eq i64 %sub10, 0, !dbg !150
  br i1 %cmp4, label %cleanup.loopexit, label %blklab4.preheader, !dbg !152

cleanup.loopexit:                                 ; preds = %blklab5
  %a.addr.033.lcssa.lcssa = phi i64 [ %a.addr.033.lcssa, %blklab5 ]
  br label %cleanup, !dbg !165

cleanup:                                          ; preds = %cleanup.loopexit, %blklab4.lr.ph.preheader, %entry
  %retval.0 = phi i64 [ %b, %entry ], [ %a, %blklab4.lr.ph.preheader ], [ %a.addr.033.lcssa.lcssa, %cleanup.loopexit ]
  ret i64 %retval.0, !dbg !165
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i64* @gcd_array(i64* nocapture %data, i64 %data_size, i1 zeroext %data_has_ownership, i64 %n) #0 !dbg !17 {
entry:
  tail call void @llvm.dbg.value(metadata i64* %data, i64 0, metadata !23, metadata !133), !dbg !166
  tail call void @llvm.dbg.value(metadata i64 %data_size, i64 0, metadata !24, metadata !133), !dbg !166
  tail call void @llvm.dbg.value(metadata i1 %data_has_ownership, i64 0, metadata !25, metadata !167), !dbg !168
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !26, metadata !133), !dbg !169
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !27, metadata !133), !dbg !170
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !28, metadata !133), !dbg !170
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !29, metadata !133), !dbg !171
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !30, metadata !133), !dbg !172
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !133), !dbg !172
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !32, metadata !133), !dbg !173
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !133), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !133), !dbg !175
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !133), !dbg !176
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !133), !dbg !177
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !133), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !133), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !133), !dbg !180
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !133), !dbg !181
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !41, metadata !133), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !133), !dbg !182
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !43, metadata !133), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !133), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !133), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !133), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !47, metadata !133), !dbg !187
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !48, metadata !133), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !49, metadata !133), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !133), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !133), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !133), !dbg !192
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !53, metadata !133), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !133), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !133), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !133), !dbg !196
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !57, metadata !133), !dbg !197
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !58, metadata !133), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !59, metadata !133), !dbg !199
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !60, metadata !133), !dbg !200
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !133), !dbg !201
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !62, metadata !133), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !133), !dbg !203
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !133), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !133), !dbg !180
  %mul = mul nsw i64 %n, %n, !dbg !205
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !40, metadata !133), !dbg !181
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !42, metadata !133), !dbg !182
  %conv1 = trunc i64 %mul to i32, !dbg !206
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #6, !dbg !206
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !41, metadata !133), !dbg !182
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !43, metadata !133), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !31, metadata !133), !dbg !172
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !30, metadata !133), !dbg !172
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !32, metadata !133), !dbg !173
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !43, metadata !133), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !133), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !133), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !133), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !133), !dbg !175
  %cmp127 = icmp sgt i64 %n, 0, !dbg !207
  br i1 %cmp127, label %while.cond8.preheader.us.preheader, label %blklab7, !dbg !210

while.cond8.preheader.us.preheader:               ; preds = %entry
  br label %while.cond8.preheader.us, !dbg !211

while.cond8.preheader.us:                         ; preds = %while.cond8.preheader.us.preheader, %blklab9.loopexit.us
  %i.0128.us = phi i64 [ %add42.us, %blklab9.loopexit.us ], [ 0, %while.cond8.preheader.us.preheader ]
  %arrayidx.us = getelementptr inbounds i64, i64* %data, i64 %i.0128.us, !dbg !211
  %mul35.us = mul nsw i64 %i.0128.us, %n, !dbg !213
  br label %if.end13.us, !dbg !211

if.end13.us:                                      ; preds = %while.cond8.preheader.us, %blklab12.us
  %j.0126.us = phi i64 [ %add41.us, %blklab12.us ], [ 0, %while.cond8.preheader.us ]
  %0 = load i64, i64* %arrayidx.us, align 8, !dbg !211, !tbaa !214
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !47, metadata !133), !dbg !187
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !36, metadata !133), !dbg !177
  %arrayidx14.us = getelementptr inbounds i64, i64* %data, i64 %j.0126.us, !dbg !216
  %1 = load i64, i64* %arrayidx14.us, align 8, !dbg !216, !tbaa !214
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !48, metadata !133), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !37, metadata !133), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !49, metadata !133), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !133), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !133), !dbg !190
  %cmp15.us = icmp eq i64 %0, 0, !dbg !217
  br i1 %cmp15.us, label %blklab12.us, label %while.cond19.preheader.us, !dbg !219

while.cond19.preheader.us:                        ; preds = %if.end13.us
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !133), !dbg !191
  %cmp21121.us = icmp sgt i64 %0, -1, !dbg !220
  br i1 %cmp21121.us, label %blklab15.lr.ph.us.preheader, label %if.end24.loopexit157, !dbg !224

blklab15.lr.ph.us.preheader:                      ; preds = %while.cond19.preheader.us
  br label %blklab15.lr.ph.us, !dbg !192

blklab15.lr.ph.us:                                ; preds = %blklab15.lr.ph.us.preheader, %if.end33.us
  %b.0.ph123.us = phi i64 [ %b.0120139.us.lcssa, %if.end33.us ], [ %1, %blklab15.lr.ph.us.preheader ]
  %a.0.ph122.us = phi i64 [ %sub.us, %if.end33.us ], [ %0, %blklab15.lr.ph.us.preheader ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !133), !dbg !192
  %cmp26138.us = icmp eq i64 %b.0.ph123.us, 0, !dbg !225
  br i1 %cmp26138.us, label %blklab12.us.loopexit156, label %if.end29.us.preheader, !dbg !227

if.end29.us.preheader:                            ; preds = %blklab15.lr.ph.us
  br label %if.end29.us, !dbg !228

if.end29.us:                                      ; preds = %if.end29.us.preheader, %blklab16.thread.us
  %b.0120139.us = phi i64 [ %sub34134.us, %blklab16.thread.us ], [ %b.0.ph123.us, %if.end29.us.preheader ]
  %cmp30.us = icmp slt i64 %b.0120139.us, %a.0.ph122.us, !dbg !228
  br i1 %cmp30.us, label %if.end33.us, label %blklab16.thread.us, !dbg !230

blklab16.thread.us:                               ; preds = %if.end29.us
  %sub34134.us = sub nsw i64 %b.0120139.us, %a.0.ph122.us, !dbg !231
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !133), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !133), !dbg !192
  %cmp26.us = icmp eq i64 %sub34134.us, 0, !dbg !225
  br i1 %cmp26.us, label %blklab12.us.loopexit, label %if.end29.us, !dbg !227

if.end33.us:                                      ; preds = %if.end29.us
  %b.0120139.us.lcssa = phi i64 [ %b.0120139.us, %if.end29.us ]
  %sub.us = sub nsw i64 %a.0.ph122.us, %b.0120139.us.lcssa, !dbg !232
  tail call void @llvm.dbg.value(metadata i64 %sub.us, i64 0, metadata !53, metadata !133), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 %sub.us, i64 0, metadata !36, metadata !133), !dbg !177
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !133), !dbg !191
  %cmp21.us = icmp sgt i64 %sub.us, -1, !dbg !220
  br i1 %cmp21.us, label %blklab15.lr.ph.us, label %if.end24.loopexit, !dbg !224

blklab12.us.loopexit:                             ; preds = %blklab16.thread.us
  %a.0.ph122.us.lcssa162 = phi i64 [ %a.0.ph122.us, %blklab16.thread.us ]
  br label %blklab12.us, !dbg !195

blklab12.us.loopexit156:                          ; preds = %blklab15.lr.ph.us
  %a.0.ph122.us.lcssa = phi i64 [ %a.0.ph122.us, %blklab15.lr.ph.us ]
  br label %blklab12.us, !dbg !195

blklab12.us:                                      ; preds = %blklab12.us.loopexit156, %blklab12.us.loopexit, %if.end13.us
  %g.0.us = phi i64 [ %1, %if.end13.us ], [ %a.0.ph122.us.lcssa162, %blklab12.us.loopexit ], [ %a.0.ph122.us.lcssa, %blklab12.us.loopexit156 ]
  tail call void @llvm.dbg.value(metadata i64 %mul35.us, i64 0, metadata !55, metadata !133), !dbg !195
  %add.us = add nsw i64 %j.0126.us, %mul35.us, !dbg !233
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !56, metadata !133), !dbg !196
  %arrayidx36.us = getelementptr inbounds i64, i64* %call, i64 %add.us, !dbg !234
  %2 = load i64, i64* %arrayidx36.us, align 8, !dbg !234, !tbaa !214
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !57, metadata !133), !dbg !197
  %add37.us = add nsw i64 %2, %g.0.us, !dbg !235
  tail call void @llvm.dbg.value(metadata i64 %add37.us, i64 0, metadata !58, metadata !133), !dbg !198
  tail call void @llvm.dbg.value(metadata i64 %mul35.us, i64 0, metadata !59, metadata !133), !dbg !199
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !60, metadata !133), !dbg !200
  store i64 %add37.us, i64* %arrayidx36.us, align 8, !dbg !236, !tbaa !214
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !61, metadata !133), !dbg !201
  %add41.us = add nuw nsw i64 %j.0126.us, 1, !dbg !237
  tail call void @llvm.dbg.value(metadata i64 %add41.us, i64 0, metadata !62, metadata !133), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 %add41.us, i64 0, metadata !35, metadata !133), !dbg !176
  %cmp10.us = icmp slt i64 %add41.us, %n, !dbg !238
  br i1 %cmp10.us, label %if.end13.us, label %blklab9.loopexit.us, !dbg !240

blklab9.loopexit.us:                              ; preds = %blklab12.us
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !63, metadata !133), !dbg !203
  %add42.us = add nuw nsw i64 %i.0128.us, 1, !dbg !241
  tail call void @llvm.dbg.value(metadata i64 %add42.us, i64 0, metadata !64, metadata !133), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 %add42.us, i64 0, metadata !34, metadata !133), !dbg !175
  %cmp.us = icmp slt i64 %add42.us, %n, !dbg !207
  br i1 %cmp.us, label %while.cond8.preheader.us, label %blklab7.loopexit, !dbg !210

if.end24.loopexit:                                ; preds = %if.end33.us
  br label %if.end24, !dbg !242

if.end24.loopexit157:                             ; preds = %while.cond19.preheader.us
  br label %if.end24, !dbg !242

if.end24:                                         ; preds = %if.end24.loopexit157, %if.end24.loopexit
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !242, !tbaa !154
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %3) #7, !dbg !243
  tail call void @exit(i32 -1) #8, !dbg !244
  unreachable, !dbg !244

blklab7.loopexit:                                 ; preds = %blklab9.loopexit.us
  br label %blklab7, !dbg !245

blklab7:                                          ; preds = %blklab7.loopexit, %entry
  br i1 %data_has_ownership, label %if.then44, label %if.end51, !dbg !245

if.then44:                                        ; preds = %blklab7
  %5 = bitcast i64* %data to i8*, !dbg !246
  tail call void @free(i8* %5) #6, !dbg !246
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !25, metadata !133), !dbg !168
  br label %if.end51, !dbg !246

if.end51:                                         ; preds = %if.then44, %blklab7
  ret i64* %call, !dbg !250
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

declare i64* @gen1DArray(i32, i32) #3

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !65 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !69, metadata !133), !dbg !251
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !70, metadata !133), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !133), !dbg !252
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !72, metadata !133), !dbg !253
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !73, metadata !133), !dbg !254
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !133), !dbg !254
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !75, metadata !133), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !133), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !133), !dbg !257
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !78, metadata !133), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !133), !dbg !258
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !80, metadata !133), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !133), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !82, metadata !133), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !133), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !84, metadata !133), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !133), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !133), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !79, metadata !133), !dbg !258
  %conv1 = trunc i64 %n to i32, !dbg !265
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #6, !dbg !265
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !78, metadata !133), !dbg !258
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !80, metadata !133), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !74, metadata !133), !dbg !254
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !73, metadata !133), !dbg !254
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !75, metadata !133), !dbg !255
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !80, metadata !133), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !133), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !133), !dbg !256
  %cmp41 = icmp sgt i64 %n, 0, !dbg !266
  br i1 %cmp41, label %if.end7.preheader, label %if.end15, !dbg !269

if.end7.preheader:                                ; preds = %entry
  %min.iters.check = icmp ult i64 %n, 4, !dbg !270
  br i1 %min.iters.check, label %if.end7.preheader47, label %min.iters.checked, !dbg !270

min.iters.checked:                                ; preds = %if.end7.preheader
  %n.vec = and i64 %n, -4, !dbg !270
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !270
  br i1 %cmp.zero, label %if.end7.preheader47, label %vector.body.preheader, !dbg !270

vector.body.preheader:                            ; preds = %min.iters.checked
  %0 = add i64 %n.vec, -4
  %1 = lshr exact i64 %0, 2
  %2 = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %2, 0
  br i1 %lcmp.mod, label %vector.body.prol, label %vector.body.preheader.split

vector.body.prol:                                 ; preds = %vector.body.preheader
  %3 = bitcast i64* %call to <2 x i64>*, !dbg !270
  %wide.load.prol = load <2 x i64>, <2 x i64>* %3, align 8, !dbg !270, !tbaa !214
  %4 = getelementptr i64, i64* %call, i64 2, !dbg !270
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !270
  %wide.load44.prol = load <2 x i64>, <2 x i64>* %5, align 8, !dbg !270, !tbaa !214
  %6 = add nsw <2 x i64> %wide.load.prol, <i64 0, i64 1>, !dbg !271
  %7 = add nsw <2 x i64> %wide.load44.prol, <i64 2, i64 3>, !dbg !271
  %8 = bitcast i64* %call to <2 x i64>*, !dbg !272
  store <2 x i64> %6, <2 x i64>* %8, align 8, !dbg !272, !tbaa !214
  %9 = bitcast i64* %4 to <2 x i64>*, !dbg !272
  store <2 x i64> %7, <2 x i64>* %9, align 8, !dbg !272, !tbaa !214
  br label %vector.body.preheader.split, !dbg !270

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %10 = icmp eq i64 %1, 0
  br i1 %10, label %middle.block, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !273
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction = add <2 x i64> %broadcast.splat, <i64 0, i64 1>
  %induction43 = add <2 x i64> %broadcast.splat, <i64 2, i64 3>
  %11 = getelementptr inbounds i64, i64* %call, i64 %index, !dbg !270
  %12 = bitcast i64* %11 to <2 x i64>*, !dbg !270
  %wide.load = load <2 x i64>, <2 x i64>* %12, align 8, !dbg !270, !tbaa !214
  %13 = getelementptr i64, i64* %11, i64 2, !dbg !270
  %14 = bitcast i64* %13 to <2 x i64>*, !dbg !270
  %wide.load44 = load <2 x i64>, <2 x i64>* %14, align 8, !dbg !270, !tbaa !214
  %15 = add nsw <2 x i64> %wide.load, %induction, !dbg !271
  %16 = add nsw <2 x i64> %wide.load44, %induction43, !dbg !271
  %17 = bitcast i64* %11 to <2 x i64>*, !dbg !272
  store <2 x i64> %15, <2 x i64>* %17, align 8, !dbg !272, !tbaa !214
  %18 = bitcast i64* %13 to <2 x i64>*, !dbg !272
  store <2 x i64> %16, <2 x i64>* %18, align 8, !dbg !272, !tbaa !214
  %index.next = add i64 %index, 4, !dbg !270
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction.1 = add <2 x i64> %broadcast.splat.1, <i64 0, i64 1>
  %induction43.1 = add <2 x i64> %broadcast.splat.1, <i64 2, i64 3>
  %19 = getelementptr inbounds i64, i64* %call, i64 %index.next, !dbg !270
  %20 = bitcast i64* %19 to <2 x i64>*, !dbg !270
  %wide.load.1 = load <2 x i64>, <2 x i64>* %20, align 8, !dbg !270, !tbaa !214
  %21 = getelementptr i64, i64* %19, i64 2, !dbg !270
  %22 = bitcast i64* %21 to <2 x i64>*, !dbg !270
  %wide.load44.1 = load <2 x i64>, <2 x i64>* %22, align 8, !dbg !270, !tbaa !214
  %23 = add nsw <2 x i64> %wide.load.1, %induction.1, !dbg !271
  %24 = add nsw <2 x i64> %wide.load44.1, %induction43.1, !dbg !271
  %25 = bitcast i64* %19 to <2 x i64>*, !dbg !272
  store <2 x i64> %23, <2 x i64>* %25, align 8, !dbg !272, !tbaa !214
  %26 = bitcast i64* %21 to <2 x i64>*, !dbg !272
  store <2 x i64> %24, <2 x i64>* %26, align 8, !dbg !272, !tbaa !214
  %index.next.1 = add i64 %index, 8, !dbg !270
  %27 = icmp eq i64 %index.next.1, %n.vec, !dbg !270
  br i1 %27, label %middle.block.unr-lcssa, label %vector.body, !dbg !270, !llvm.loop !274

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %n.vec, %n
  br i1 %cmp.n, label %if.end15, label %if.end7.preheader47, !dbg !270

if.end7.preheader47:                              ; preds = %middle.block, %min.iters.checked, %if.end7.preheader
  %i.042.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end7.preheader ], [ %n.vec, %middle.block ]
  br label %if.end7, !dbg !270

if.end7:                                          ; preds = %if.end7.preheader47, %if.end7
  %i.042 = phi i64 [ %add9, %if.end7 ], [ %i.042.ph, %if.end7.preheader47 ]
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %i.042, !dbg !270
  %28 = load i64, i64* %arrayidx, align 8, !dbg !270, !tbaa !214
  tail call void @llvm.dbg.value(metadata i64 %28, i64 0, metadata !82, metadata !133), !dbg !261
  %add = add nsw i64 %28, %i.042, !dbg !271
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !83, metadata !133), !dbg !262
  store i64 %add, i64* %arrayidx, align 8, !dbg !272, !tbaa !214
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !84, metadata !133), !dbg !263
  %add9 = add nuw nsw i64 %i.042, 1, !dbg !273
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !85, metadata !133), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !76, metadata !133), !dbg !256
  %exitcond = icmp eq i64 %add9, %n, !dbg !269
  br i1 %exitcond, label %if.end15.loopexit, label %if.end7, !dbg !269, !llvm.loop !277

if.end15.loopexit:                                ; preds = %if.end7
  br label %if.end15, !dbg !279

if.end15:                                         ; preds = %if.end15.loopexit, %middle.block, %entry
  ret i64* %call, !dbg !279
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #4 !dbg !86 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !94, metadata !133), !dbg !280
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !95, metadata !133), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !96, metadata !133), !dbg !282
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !97, metadata !133), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !133), !dbg !283
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !99, metadata !133), !dbg !284
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !100, metadata !133), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !101, metadata !133), !dbg !285
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !102, metadata !133), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !103, metadata !133), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !133), !dbg !288
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !105, metadata !133), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !133), !dbg !290
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !107, metadata !133), !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !133), !dbg !291
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !109, metadata !133), !dbg !292
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !110, metadata !133), !dbg !293
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !111, metadata !133), !dbg !293
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !112, metadata !133), !dbg !294
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !113, metadata !133), !dbg !295
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !133), !dbg !296
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !115, metadata !133), !dbg !297
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !133), !dbg !298
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !117, metadata !133), !dbg !299
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !118, metadata !133), !dbg !300
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !119, metadata !133), !dbg !301
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !133), !dbg !302
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !121, metadata !133), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !133), !dbg !304
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !123, metadata !133), !dbg !305
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !126, metadata !133), !dbg !306
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !127, metadata !133), !dbg !306
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !128, metadata !133), !dbg !307
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !106, metadata !133), !dbg !290
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !96, metadata !133), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !69, metadata !133) #6, !dbg !308
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !70, metadata !133) #6, !dbg !310
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !133) #6, !dbg !310
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !72, metadata !133) #6, !dbg !311
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !73, metadata !133) #6, !dbg !312
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !133) #6, !dbg !312
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !75, metadata !133) #6, !dbg !313
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !133) #6, !dbg !314
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !133) #6, !dbg !315
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !78, metadata !133) #6, !dbg !316
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !133) #6, !dbg !316
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !80, metadata !133) #6, !dbg !317
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !133) #6, !dbg !318
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !82, metadata !133) #6, !dbg !319
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !133) #6, !dbg !320
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !84, metadata !133) #6, !dbg !321
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !133) #6, !dbg !322
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !133) #6, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !79, metadata !133) #6, !dbg !316
  %call.i = tail call i64* @gen1DArray(i32 0, i32 1000) #6, !dbg !323
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !78, metadata !133) #6, !dbg !316
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !80, metadata !133) #6, !dbg !317
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !74, metadata !133) #6, !dbg !312
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !73, metadata !133) #6, !dbg !312
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !75, metadata !133) #6, !dbg !313
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !80, metadata !133) #6, !dbg !317
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !133) #6, !dbg !318
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !133) #6, !dbg !314
  br label %vector.body, !dbg !324

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.1, %vector.body ], !dbg !324
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0, !dbg !324
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !324
  %induction = add <2 x i64> %broadcast.splat, <i64 0, i64 1>, !dbg !324
  %induction100 = add <2 x i64> %broadcast.splat, <i64 2, i64 3>, !dbg !324
  %0 = getelementptr inbounds i64, i64* %call.i, i64 %index, !dbg !325
  %1 = bitcast i64* %0 to <2 x i64>*, !dbg !325
  %wide.load = load <2 x i64>, <2 x i64>* %1, align 8, !dbg !325, !tbaa !214
  %2 = getelementptr i64, i64* %0, i64 2, !dbg !325
  %3 = bitcast i64* %2 to <2 x i64>*, !dbg !325
  %wide.load101 = load <2 x i64>, <2 x i64>* %3, align 8, !dbg !325, !tbaa !214
  %4 = add nsw <2 x i64> %wide.load, %induction, !dbg !326
  %5 = add nsw <2 x i64> %wide.load101, %induction100, !dbg !326
  %6 = bitcast i64* %0 to <2 x i64>*, !dbg !327
  store <2 x i64> %4, <2 x i64>* %6, align 8, !dbg !327, !tbaa !214
  %7 = bitcast i64* %2 to <2 x i64>*, !dbg !327
  store <2 x i64> %5, <2 x i64>* %7, align 8, !dbg !327, !tbaa !214
  %index.next = or i64 %index, 4, !dbg !324
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0, !dbg !324
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !324
  %induction.1 = add <2 x i64> %broadcast.splat.1, <i64 0, i64 1>, !dbg !324
  %induction100.1 = add <2 x i64> %broadcast.splat.1, <i64 2, i64 3>, !dbg !324
  %8 = getelementptr inbounds i64, i64* %call.i, i64 %index.next, !dbg !325
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !325
  %wide.load.1 = load <2 x i64>, <2 x i64>* %9, align 8, !dbg !325, !tbaa !214
  %10 = getelementptr i64, i64* %8, i64 2, !dbg !325
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !325
  %wide.load101.1 = load <2 x i64>, <2 x i64>* %11, align 8, !dbg !325, !tbaa !214
  %12 = add nsw <2 x i64> %wide.load.1, %induction.1, !dbg !326
  %13 = add nsw <2 x i64> %wide.load101.1, %induction100.1, !dbg !326
  %14 = bitcast i64* %8 to <2 x i64>*, !dbg !327
  store <2 x i64> %12, <2 x i64>* %14, align 8, !dbg !327, !tbaa !214
  %15 = bitcast i64* %10 to <2 x i64>*, !dbg !327
  store <2 x i64> %13, <2 x i64>* %15, align 8, !dbg !327, !tbaa !214
  %index.next.1 = add nsw i64 %index, 8, !dbg !324
  %16 = icmp eq i64 %index.next.1, 1000, !dbg !324
  br i1 %16, label %init.exit, label %vector.body, !dbg !324, !llvm.loop !328

init.exit:                                        ; preds = %vector.body
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !107, metadata !133), !dbg !291
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !109, metadata !133), !dbg !292
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !133), !dbg !283
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !97, metadata !133), !dbg !283
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !99, metadata !133), !dbg !284
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !109, metadata !133), !dbg !292
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !99, metadata !133), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !111, metadata !133), !dbg !293
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !23, metadata !133) #6, !dbg !329
  tail call void @llvm.dbg.value(metadata i64 undef, i64 0, metadata !24, metadata !133) #6, !dbg !329
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !25, metadata !167) #6, !dbg !331
  tail call void @llvm.dbg.value(metadata i64 1000, i64 0, metadata !26, metadata !133) #6, !dbg !332
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !27, metadata !133) #6, !dbg !333
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !28, metadata !133) #6, !dbg !333
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !29, metadata !133) #6, !dbg !334
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !30, metadata !133) #6, !dbg !335
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !31, metadata !133) #6, !dbg !335
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !32, metadata !133) #6, !dbg !336
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !133) #6, !dbg !337
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !133) #6, !dbg !338
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !35, metadata !133) #6, !dbg !339
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !36, metadata !133) #6, !dbg !340
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !37, metadata !133) #6, !dbg !341
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !133) #6, !dbg !342
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !133) #6, !dbg !343
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !133) #6, !dbg !344
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !41, metadata !133) #6, !dbg !345
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !133) #6, !dbg !345
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !43, metadata !133) #6, !dbg !346
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !133) #6, !dbg !347
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !133) #6, !dbg !348
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !133) #6, !dbg !349
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !47, metadata !133) #6, !dbg !350
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !48, metadata !133) #6, !dbg !351
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !49, metadata !133) #6, !dbg !352
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !133) #6, !dbg !353
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !133) #6, !dbg !354
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !133) #6, !dbg !355
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !53, metadata !133) #6, !dbg !356
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !133) #6, !dbg !357
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !133) #6, !dbg !358
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !133) #6, !dbg !359
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !57, metadata !133) #6, !dbg !360
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !58, metadata !133) #6, !dbg !361
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !59, metadata !133) #6, !dbg !362
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !60, metadata !133) #6, !dbg !363
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !133) #6, !dbg !364
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !62, metadata !133) #6, !dbg !365
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !133) #6, !dbg !366
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !133) #6, !dbg !367
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !133) #6, !dbg !343
  tail call void @llvm.dbg.value(metadata i64 1000000, i64 0, metadata !40, metadata !133) #6, !dbg !344
  tail call void @llvm.dbg.value(metadata i64 1000000, i64 0, metadata !42, metadata !133) #6, !dbg !345
  %call.i79 = tail call i64* @gen1DArray(i32 0, i32 1000000) #6, !dbg !368
  tail call void @llvm.dbg.value(metadata i64* %call.i79, i64 0, metadata !41, metadata !133) #6, !dbg !345
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !43, metadata !133) #6, !dbg !346
  tail call void @llvm.dbg.value(metadata i64 1000000, i64 0, metadata !31, metadata !133) #6, !dbg !335
  tail call void @llvm.dbg.value(metadata i64* %call.i79, i64 0, metadata !30, metadata !133) #6, !dbg !335
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !32, metadata !133) #6, !dbg !336
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !43, metadata !133) #6, !dbg !346
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !133) #6, !dbg !347
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !33, metadata !133) #6, !dbg !337
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !133) #6, !dbg !348
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !34, metadata !133) #6, !dbg !338
  br label %while.cond8.preheader.us.i, !dbg !369

while.cond8.preheader.us.i:                       ; preds = %blklab9.loopexit.us.i, %init.exit
  %i.0128.us.i = phi i64 [ %add42.us.i, %blklab9.loopexit.us.i ], [ 0, %init.exit ], !dbg !369
  %arrayidx.us.i = getelementptr inbounds i64, i64* %call.i, i64 %i.0128.us.i, !dbg !370
  %mul35.us.i = mul nuw nsw i64 %i.0128.us.i, 1000, !dbg !371
  br label %if.end13.us.i, !dbg !370

if.end13.us.i:                                    ; preds = %blklab12.us.i, %while.cond8.preheader.us.i
  %j.0126.us.i = phi i64 [ %add41.us.i, %blklab12.us.i ], [ 0, %while.cond8.preheader.us.i ], !dbg !369
  %17 = load i64, i64* %arrayidx.us.i, align 8, !dbg !370, !tbaa !214
  tail call void @llvm.dbg.value(metadata i64 %17, i64 0, metadata !47, metadata !133) #6, !dbg !350
  tail call void @llvm.dbg.value(metadata i64 %17, i64 0, metadata !36, metadata !133) #6, !dbg !340
  %arrayidx14.us.i = getelementptr inbounds i64, i64* %call.i, i64 %j.0126.us.i, !dbg !372
  %18 = load i64, i64* %arrayidx14.us.i, align 8, !dbg !372, !tbaa !214
  tail call void @llvm.dbg.value(metadata i64 %18, i64 0, metadata !48, metadata !133) #6, !dbg !351
  tail call void @llvm.dbg.value(metadata i64 %18, i64 0, metadata !37, metadata !133) #6, !dbg !341
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !49, metadata !133) #6, !dbg !352
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !38, metadata !133) #6, !dbg !342
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !133) #6, !dbg !353
  %cmp15.us.i = icmp eq i64 %17, 0, !dbg !373
  br i1 %cmp15.us.i, label %blklab12.us.i, label %while.cond19.preheader.us.i, !dbg !374

while.cond19.preheader.us.i:                      ; preds = %if.end13.us.i
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !133) #6, !dbg !354
  %cmp21121.us.i = icmp sgt i64 %17, -1, !dbg !375
  br i1 %cmp21121.us.i, label %blklab15.lr.ph.us.i.preheader, label %if.end24.i.loopexit122, !dbg !376

blklab15.lr.ph.us.i.preheader:                    ; preds = %while.cond19.preheader.us.i
  br label %blklab15.lr.ph.us.i, !dbg !355

blklab15.lr.ph.us.i:                              ; preds = %blklab15.lr.ph.us.i.preheader, %if.end33.us.i
  %b.0.ph123.us.i = phi i64 [ %b.0120139.us.i.lcssa, %if.end33.us.i ], [ %18, %blklab15.lr.ph.us.i.preheader ], !dbg !369
  %a.0.ph122.us.i = phi i64 [ %sub.us.i, %if.end33.us.i ], [ %17, %blklab15.lr.ph.us.i.preheader ], !dbg !369
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !133) #6, !dbg !355
  %cmp26138.us.i = icmp eq i64 %b.0.ph123.us.i, 0, !dbg !377
  br i1 %cmp26138.us.i, label %blklab12.us.i.loopexit121, label %if.end29.us.i.preheader, !dbg !378

if.end29.us.i.preheader:                          ; preds = %blklab15.lr.ph.us.i
  br label %if.end29.us.i, !dbg !379

if.end29.us.i:                                    ; preds = %if.end29.us.i.preheader, %blklab16.thread.us.i
  %b.0120139.us.i = phi i64 [ %sub34134.us.i, %blklab16.thread.us.i ], [ %b.0.ph123.us.i, %if.end29.us.i.preheader ], !dbg !369
  %cmp30.us.i = icmp slt i64 %b.0120139.us.i, %a.0.ph122.us.i, !dbg !379
  br i1 %cmp30.us.i, label %if.end33.us.i, label %blklab16.thread.us.i, !dbg !380

blklab16.thread.us.i:                             ; preds = %if.end29.us.i
  %sub34134.us.i = sub nsw i64 %b.0120139.us.i, %a.0.ph122.us.i, !dbg !381
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !133) #6, !dbg !354
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !133) #6, !dbg !355
  %cmp26.us.i = icmp eq i64 %sub34134.us.i, 0, !dbg !377
  br i1 %cmp26.us.i, label %blklab12.us.i.loopexit, label %if.end29.us.i, !dbg !378

if.end33.us.i:                                    ; preds = %if.end29.us.i
  %b.0120139.us.i.lcssa = phi i64 [ %b.0120139.us.i, %if.end29.us.i ]
  %sub.us.i = sub nsw i64 %a.0.ph122.us.i, %b.0120139.us.i.lcssa, !dbg !382
  tail call void @llvm.dbg.value(metadata i64 %sub.us.i, i64 0, metadata !53, metadata !133) #6, !dbg !356
  tail call void @llvm.dbg.value(metadata i64 %sub.us.i, i64 0, metadata !36, metadata !133) #6, !dbg !340
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !51, metadata !133) #6, !dbg !354
  %cmp21.us.i = icmp sgt i64 %sub.us.i, -1, !dbg !375
  br i1 %cmp21.us.i, label %blklab15.lr.ph.us.i, label %if.end24.i.loopexit, !dbg !376

blklab12.us.i.loopexit:                           ; preds = %blklab16.thread.us.i
  %a.0.ph122.us.i.lcssa131 = phi i64 [ %a.0.ph122.us.i, %blklab16.thread.us.i ]
  br label %blklab12.us.i, !dbg !358

blklab12.us.i.loopexit121:                        ; preds = %blklab15.lr.ph.us.i
  %a.0.ph122.us.i.lcssa = phi i64 [ %a.0.ph122.us.i, %blklab15.lr.ph.us.i ]
  br label %blklab12.us.i, !dbg !358

blklab12.us.i:                                    ; preds = %blklab12.us.i.loopexit121, %blklab12.us.i.loopexit, %if.end13.us.i
  %g.0.us.i = phi i64 [ %18, %if.end13.us.i ], [ %a.0.ph122.us.i.lcssa131, %blklab12.us.i.loopexit ], [ %a.0.ph122.us.i.lcssa, %blklab12.us.i.loopexit121 ], !dbg !369
  tail call void @llvm.dbg.value(metadata i64 %mul35.us.i, i64 0, metadata !55, metadata !133) #6, !dbg !358
  %add.us.i = add nuw nsw i64 %j.0126.us.i, %mul35.us.i, !dbg !383
  tail call void @llvm.dbg.value(metadata i64 %add.us.i, i64 0, metadata !56, metadata !133) #6, !dbg !359
  %arrayidx36.us.i = getelementptr inbounds i64, i64* %call.i79, i64 %add.us.i, !dbg !384
  %19 = load i64, i64* %arrayidx36.us.i, align 8, !dbg !384, !tbaa !214
  tail call void @llvm.dbg.value(metadata i64 %19, i64 0, metadata !57, metadata !133) #6, !dbg !360
  %add37.us.i = add nsw i64 %19, %g.0.us.i, !dbg !385
  tail call void @llvm.dbg.value(metadata i64 %add37.us.i, i64 0, metadata !58, metadata !133) #6, !dbg !361
  tail call void @llvm.dbg.value(metadata i64 %mul35.us.i, i64 0, metadata !59, metadata !133) #6, !dbg !362
  tail call void @llvm.dbg.value(metadata i64 %add.us.i, i64 0, metadata !60, metadata !133) #6, !dbg !363
  store i64 %add37.us.i, i64* %arrayidx36.us.i, align 8, !dbg !386, !tbaa !214
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !61, metadata !133) #6, !dbg !364
  %add41.us.i = add nuw nsw i64 %j.0126.us.i, 1, !dbg !387
  tail call void @llvm.dbg.value(metadata i64 %add41.us.i, i64 0, metadata !62, metadata !133) #6, !dbg !365
  tail call void @llvm.dbg.value(metadata i64 %add41.us.i, i64 0, metadata !35, metadata !133) #6, !dbg !339
  %cmp10.us.i = icmp slt i64 %add41.us.i, 1000, !dbg !388
  br i1 %cmp10.us.i, label %if.end13.us.i, label %blklab9.loopexit.us.i, !dbg !389

blklab9.loopexit.us.i:                            ; preds = %blklab12.us.i
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !63, metadata !133) #6, !dbg !366
  %add42.us.i = add nuw nsw i64 %i.0128.us.i, 1, !dbg !390
  tail call void @llvm.dbg.value(metadata i64 %add42.us.i, i64 0, metadata !64, metadata !133) #6, !dbg !367
  tail call void @llvm.dbg.value(metadata i64 %add42.us.i, i64 0, metadata !34, metadata !133) #6, !dbg !338
  %cmp.us.i = icmp slt i64 %add42.us.i, 1000, !dbg !391
  br i1 %cmp.us.i, label %while.cond8.preheader.us.i, label %while.cond13.preheader.preheader, !dbg !392

while.cond13.preheader.preheader:                 ; preds = %blklab9.loopexit.us.i
  br label %while.cond13.preheader, !dbg !393

if.end24.i.loopexit:                              ; preds = %if.end33.us.i
  br label %if.end24.i, !dbg !396

if.end24.i.loopexit122:                           ; preds = %while.cond19.preheader.us.i
  br label %if.end24.i, !dbg !396

if.end24.i:                                       ; preds = %if.end24.i.loopexit122, %if.end24.i.loopexit
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !396, !tbaa !154
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %20) #9, !dbg !397
  tail call void @exit(i32 -1) #8, !dbg !398
  unreachable, !dbg !398

while.cond13.preheader:                           ; preds = %while.cond13.preheader.preheader, %middle.block103
  %i.077 = phi i64 [ %add20, %middle.block103 ], [ 0, %while.cond13.preheader.preheader ]
  %sum.076 = phi i64 [ %38, %middle.block103 ], [ 0, %while.cond13.preheader.preheader ]
  %mul = mul nuw nsw i64 %i.077, 1000, !dbg !393
  %22 = insertelement <2 x i64> <i64 undef, i64 0>, i64 %sum.076, i32 0, !dbg !399
  br label %vector.body102, !dbg !399

vector.body102:                                   ; preds = %vector.body102, %while.cond13.preheader
  %index107 = phi i64 [ 0, %while.cond13.preheader ], [ %index.next108.1, %vector.body102 ], !dbg !400
  %vec.phi = phi <2 x i64> [ %22, %while.cond13.preheader ], [ %35, %vector.body102 ]
  %vec.phi115 = phi <2 x i64> [ zeroinitializer, %while.cond13.preheader ], [ %36, %vector.body102 ]
  %23 = add nuw nsw i64 %index107, %mul, !dbg !401
  %24 = getelementptr inbounds i64, i64* %call.i79, i64 %23, !dbg !401
  %25 = bitcast i64* %24 to <2 x i64>*, !dbg !401
  %wide.load118 = load <2 x i64>, <2 x i64>* %25, align 8, !dbg !401, !tbaa !214
  %26 = getelementptr i64, i64* %24, i64 2, !dbg !401
  %27 = bitcast i64* %26 to <2 x i64>*, !dbg !401
  %wide.load119 = load <2 x i64>, <2 x i64>* %27, align 8, !dbg !401, !tbaa !214
  %28 = add nsw <2 x i64> %wide.load118, %vec.phi, !dbg !402
  %29 = add nsw <2 x i64> %wide.load119, %vec.phi115, !dbg !402
  %index.next108 = or i64 %index107, 4, !dbg !399
  %30 = add nuw nsw i64 %index.next108, %mul, !dbg !401
  %31 = getelementptr inbounds i64, i64* %call.i79, i64 %30, !dbg !401
  %32 = bitcast i64* %31 to <2 x i64>*, !dbg !401
  %wide.load118.1 = load <2 x i64>, <2 x i64>* %32, align 8, !dbg !401, !tbaa !214
  %33 = getelementptr i64, i64* %31, i64 2, !dbg !401
  %34 = bitcast i64* %33 to <2 x i64>*, !dbg !401
  %wide.load119.1 = load <2 x i64>, <2 x i64>* %34, align 8, !dbg !401, !tbaa !214
  %35 = add nsw <2 x i64> %wide.load118.1, %28, !dbg !402
  %36 = add nsw <2 x i64> %wide.load119.1, %29, !dbg !402
  %index.next108.1 = add nsw i64 %index107, 8, !dbg !399
  %37 = icmp eq i64 %index.next108.1, 1000, !dbg !399
  br i1 %37, label %middle.block103, label %vector.body102, !dbg !399, !llvm.loop !403

middle.block103:                                  ; preds = %vector.body102
  %.lcssa128 = phi <2 x i64> [ %36, %vector.body102 ]
  %.lcssa = phi <2 x i64> [ %35, %vector.body102 ]
  %bin.rdx = add <2 x i64> %.lcssa128, %.lcssa, !dbg !402
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>, !dbg !402
  %bin.rdx120 = add <2 x i64> %bin.rdx, %rdx.shuf, !dbg !402
  %38 = extractelement <2 x i64> %bin.rdx120, i32 0, !dbg !402
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !122, metadata !133), !dbg !304
  %add20 = add nuw nsw i64 %i.077, 1, !dbg !404
  tail call void @llvm.dbg.value(metadata i64 %add20, i64 0, metadata !123, metadata !133), !dbg !305
  tail call void @llvm.dbg.value(metadata i64 %add20, i64 0, metadata !104, metadata !133), !dbg !288
  %exitcond78 = icmp eq i64 %add20, 1000, !dbg !405
  br i1 %exitcond78, label %if.end23, label %while.cond13.preheader, !dbg !405

if.end23:                                         ; preds = %middle.block103
  %.lcssa129 = phi i64 [ %38, %middle.block103 ]
  tail call void @llvm.dbg.value(metadata i64 4, i64 0, metadata !127, metadata !133), !dbg !306
  %call24 = tail call noalias i8* @malloc(i64 32) #6, !dbg !406
  %39 = bitcast i8* %call24 to i64*, !dbg !406
  tail call void @llvm.dbg.value(metadata i64* %39, i64 0, metadata !126, metadata !133), !dbg !306
  %40 = bitcast i8* %call24 to <2 x i64>*, !dbg !407
  store <2 x i64> <i64 83, i64 85>, <2 x i64>* %40, align 8, !dbg !407, !tbaa !214
  %arrayidx27 = getelementptr inbounds i8, i8* %call24, i64 16, !dbg !408
  %41 = bitcast i8* %arrayidx27 to <2 x i64>*, !dbg !409
  store <2 x i64> <i64 77, i64 58>, <2 x i64>* %41, align 8, !dbg !409, !tbaa !214
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !128, metadata !133), !dbg !307
  tail call void @printf_s(i64* %39, i64 4) #6, !dbg !410
  %call29 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %.lcssa129), !dbg !411
  %42 = bitcast i64* %call.i to i8*, !dbg !412
  tail call void @free(i8* %42) #6, !dbg !412
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !99, metadata !133), !dbg !284
  %43 = bitcast i64* %call.i79 to i8*, !dbg !416
  tail call void @free(i8* %43) #6, !dbg !416
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !102, metadata !133), !dbg !286
  tail call void @free(i8* %call24) #6, !dbg !420
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !128, metadata !133), !dbg !307
  tail call void @exit(i32 0) #8, !dbg !424
  unreachable, !dbg !424
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare void @printf_s(i64*, i64) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

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
attributes #9 = { cold nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!130, !131}
!llvm.ident = !{!132}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, subprograms: !3)
!1 = !DIFile(filename: "GCD.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/GCD/impl/autogenerate")
!2 = !{}
!3 = !{!4, !17, !65, !86}
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
!17 = distinct !DISubprogram(name: "gcd_array", scope: !1, file: !1, line: 62, type: !18, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: true, variables: !22)
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !20, !7, !21, !7}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!21 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!22 = !{!23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64}
!23 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !1, line: 62, type: !20)
!24 = !DILocalVariable(name: "data_size", arg: 2, scope: !17, file: !1, line: 62, type: !7)
!25 = !DILocalVariable(name: "data_has_ownership", arg: 3, scope: !17, file: !1, line: 62, type: !21)
!26 = !DILocalVariable(name: "n", arg: 4, scope: !17, file: !1, line: 62, type: !7)
!27 = !DILocalVariable(name: "_2", scope: !17, file: !1, line: 63, type: !20)
!28 = !DILocalVariable(name: "_2_size", scope: !17, file: !1, line: 63, type: !7)
!29 = !DILocalVariable(name: "_2_has_ownership", scope: !17, file: !1, line: 64, type: !21)
!30 = !DILocalVariable(name: "gcds", scope: !17, file: !1, line: 65, type: !20)
!31 = !DILocalVariable(name: "gcds_size", scope: !17, file: !1, line: 65, type: !7)
!32 = !DILocalVariable(name: "gcds_has_ownership", scope: !17, file: !1, line: 66, type: !21)
!33 = !DILocalVariable(name: "sum", scope: !17, file: !1, line: 67, type: !7)
!34 = !DILocalVariable(name: "i", scope: !17, file: !1, line: 68, type: !7)
!35 = !DILocalVariable(name: "j", scope: !17, file: !1, line: 69, type: !7)
!36 = !DILocalVariable(name: "a", scope: !17, file: !1, line: 70, type: !7)
!37 = !DILocalVariable(name: "b", scope: !17, file: !1, line: 71, type: !7)
!38 = !DILocalVariable(name: "g", scope: !17, file: !1, line: 72, type: !7)
!39 = !DILocalVariable(name: "_10", scope: !17, file: !1, line: 73, type: !7)
!40 = !DILocalVariable(name: "_11", scope: !17, file: !1, line: 74, type: !7)
!41 = !DILocalVariable(name: "_12", scope: !17, file: !1, line: 75, type: !20)
!42 = !DILocalVariable(name: "_12_size", scope: !17, file: !1, line: 75, type: !7)
!43 = !DILocalVariable(name: "_12_has_ownership", scope: !17, file: !1, line: 76, type: !21)
!44 = !DILocalVariable(name: "_13", scope: !17, file: !1, line: 77, type: !7)
!45 = !DILocalVariable(name: "_14", scope: !17, file: !1, line: 78, type: !7)
!46 = !DILocalVariable(name: "_15", scope: !17, file: !1, line: 79, type: !7)
!47 = !DILocalVariable(name: "_16", scope: !17, file: !1, line: 80, type: !7)
!48 = !DILocalVariable(name: "_17", scope: !17, file: !1, line: 81, type: !7)
!49 = !DILocalVariable(name: "_18", scope: !17, file: !1, line: 82, type: !7)
!50 = !DILocalVariable(name: "_19", scope: !17, file: !1, line: 83, type: !7)
!51 = !DILocalVariable(name: "_20", scope: !17, file: !1, line: 84, type: !7)
!52 = !DILocalVariable(name: "_21", scope: !17, file: !1, line: 85, type: !7)
!53 = !DILocalVariable(name: "_22", scope: !17, file: !1, line: 86, type: !7)
!54 = !DILocalVariable(name: "_23", scope: !17, file: !1, line: 87, type: !7)
!55 = !DILocalVariable(name: "_24", scope: !17, file: !1, line: 88, type: !7)
!56 = !DILocalVariable(name: "_25", scope: !17, file: !1, line: 89, type: !7)
!57 = !DILocalVariable(name: "_26", scope: !17, file: !1, line: 90, type: !7)
!58 = !DILocalVariable(name: "_27", scope: !17, file: !1, line: 91, type: !7)
!59 = !DILocalVariable(name: "_28", scope: !17, file: !1, line: 92, type: !7)
!60 = !DILocalVariable(name: "_29", scope: !17, file: !1, line: 93, type: !7)
!61 = !DILocalVariable(name: "_30", scope: !17, file: !1, line: 94, type: !7)
!62 = !DILocalVariable(name: "_31", scope: !17, file: !1, line: 95, type: !7)
!63 = !DILocalVariable(name: "_32", scope: !17, file: !1, line: 96, type: !7)
!64 = !DILocalVariable(name: "_33", scope: !17, file: !1, line: 97, type: !7)
!65 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 241, type: !66, isLocal: false, isDefinition: true, scopeLine: 241, flags: DIFlagPrototyped, isOptimized: true, variables: !68)
!66 = !DISubroutineType(types: !67)
!67 = !{!20, !7}
!68 = !{!69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85}
!69 = !DILocalVariable(name: "n", arg: 1, scope: !65, file: !1, line: 241, type: !7)
!70 = !DILocalVariable(name: "_1", scope: !65, file: !1, line: 242, type: !20)
!71 = !DILocalVariable(name: "_1_size", scope: !65, file: !1, line: 242, type: !7)
!72 = !DILocalVariable(name: "_1_has_ownership", scope: !65, file: !1, line: 243, type: !21)
!73 = !DILocalVariable(name: "data", scope: !65, file: !1, line: 244, type: !20)
!74 = !DILocalVariable(name: "data_size", scope: !65, file: !1, line: 244, type: !7)
!75 = !DILocalVariable(name: "data_has_ownership", scope: !65, file: !1, line: 245, type: !21)
!76 = !DILocalVariable(name: "i", scope: !65, file: !1, line: 246, type: !7)
!77 = !DILocalVariable(name: "_4", scope: !65, file: !1, line: 247, type: !7)
!78 = !DILocalVariable(name: "_5", scope: !65, file: !1, line: 248, type: !20)
!79 = !DILocalVariable(name: "_5_size", scope: !65, file: !1, line: 248, type: !7)
!80 = !DILocalVariable(name: "_5_has_ownership", scope: !65, file: !1, line: 249, type: !21)
!81 = !DILocalVariable(name: "_6", scope: !65, file: !1, line: 250, type: !7)
!82 = !DILocalVariable(name: "_7", scope: !65, file: !1, line: 251, type: !7)
!83 = !DILocalVariable(name: "_8", scope: !65, file: !1, line: 252, type: !7)
!84 = !DILocalVariable(name: "_9", scope: !65, file: !1, line: 253, type: !7)
!85 = !DILocalVariable(name: "_10", scope: !65, file: !1, line: 254, type: !7)
!86 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 298, type: !87, isLocal: false, isDefinition: true, scopeLine: 298, flags: DIFlagPrototyped, isOptimized: true, variables: !93)
!87 = !DISubroutineType(types: !88)
!88 = !{!89, !89, !90}
!89 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64, align: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64, align: 64)
!92 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!93 = !{!94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !126, !127, !128, !129}
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !1, line: 298, type: !89)
!95 = !DILocalVariable(name: "args", arg: 2, scope: !86, file: !1, line: 298, type: !90)
!96 = !DILocalVariable(name: "n", scope: !86, file: !1, line: 299, type: !7)
!97 = !DILocalVariable(name: "data", scope: !86, file: !1, line: 300, type: !20)
!98 = !DILocalVariable(name: "data_size", scope: !86, file: !1, line: 300, type: !7)
!99 = !DILocalVariable(name: "data_has_ownership", scope: !86, file: !1, line: 301, type: !21)
!100 = !DILocalVariable(name: "gcds", scope: !86, file: !1, line: 302, type: !20)
!101 = !DILocalVariable(name: "gcds_size", scope: !86, file: !1, line: 302, type: !7)
!102 = !DILocalVariable(name: "gcds_has_ownership", scope: !86, file: !1, line: 303, type: !21)
!103 = !DILocalVariable(name: "sum", scope: !86, file: !1, line: 304, type: !7)
!104 = !DILocalVariable(name: "i", scope: !86, file: !1, line: 305, type: !7)
!105 = !DILocalVariable(name: "j", scope: !86, file: !1, line: 306, type: !7)
!106 = !DILocalVariable(name: "_7", scope: !86, file: !1, line: 307, type: !7)
!107 = !DILocalVariable(name: "_8", scope: !86, file: !1, line: 308, type: !20)
!108 = !DILocalVariable(name: "_8_size", scope: !86, file: !1, line: 308, type: !7)
!109 = !DILocalVariable(name: "_8_has_ownership", scope: !86, file: !1, line: 309, type: !21)
!110 = !DILocalVariable(name: "_9", scope: !86, file: !1, line: 310, type: !20)
!111 = !DILocalVariable(name: "_9_size", scope: !86, file: !1, line: 310, type: !7)
!112 = !DILocalVariable(name: "_9_has_ownership", scope: !86, file: !1, line: 311, type: !21)
!113 = !DILocalVariable(name: "_10", scope: !86, file: !1, line: 312, type: !7)
!114 = !DILocalVariable(name: "_11", scope: !86, file: !1, line: 313, type: !7)
!115 = !DILocalVariable(name: "_12", scope: !86, file: !1, line: 314, type: !7)
!116 = !DILocalVariable(name: "_13", scope: !86, file: !1, line: 315, type: !7)
!117 = !DILocalVariable(name: "_14", scope: !86, file: !1, line: 316, type: !7)
!118 = !DILocalVariable(name: "_15", scope: !86, file: !1, line: 317, type: !7)
!119 = !DILocalVariable(name: "_16", scope: !86, file: !1, line: 318, type: !7)
!120 = !DILocalVariable(name: "_17", scope: !86, file: !1, line: 319, type: !7)
!121 = !DILocalVariable(name: "_18", scope: !86, file: !1, line: 320, type: !7)
!122 = !DILocalVariable(name: "_19", scope: !86, file: !1, line: 321, type: !7)
!123 = !DILocalVariable(name: "_20", scope: !86, file: !1, line: 322, type: !7)
!124 = !DILocalVariable(name: "_21", scope: !86, file: !1, line: 323, type: !125)
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!126 = !DILocalVariable(name: "_23", scope: !86, file: !1, line: 324, type: !20)
!127 = !DILocalVariable(name: "_23_size", scope: !86, file: !1, line: 324, type: !7)
!128 = !DILocalVariable(name: "_23_has_ownership", scope: !86, file: !1, line: 325, type: !21)
!129 = !DILocalVariable(name: "_24", scope: !86, file: !1, line: 326, type: !125)
!130 = !{i32 2, !"Dwarf Version", i32 4}
!131 = !{i32 2, !"Debug Info Version", i32 3}
!132 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!133 = !DIExpression()
!134 = !DILocation(line: 2, column: 25, scope: !4)
!135 = !DILocation(line: 2, column: 38, scope: !4)
!136 = !DILocation(line: 3, column: 12, scope: !4)
!137 = !DILocation(line: 4, column: 12, scope: !4)
!138 = !DILocation(line: 5, column: 12, scope: !4)
!139 = !DILocation(line: 6, column: 12, scope: !4)
!140 = !DILocation(line: 7, column: 12, scope: !4)
!141 = !DILocation(line: 8, column: 12, scope: !4)
!142 = !DILocation(line: 12, column: 6, scope: !143)
!143 = distinct !DILexicalBlock(scope: !4, file: !1, line: 12, column: 5)
!144 = !DILocation(line: 12, column: 5, scope: !4)
!145 = !DILocation(line: 24, column: 8, scope: !146)
!146 = distinct !DILexicalBlock(scope: !147, file: !1, line: 24, column: 7)
!147 = distinct !DILexicalBlock(scope: !148, file: !1, line: 20, column: 3)
!148 = distinct !DILexicalBlock(scope: !4, file: !1, line: 18, column: 13)
!149 = !DILocation(line: 24, column: 7, scope: !147)
!150 = !DILocation(line: 35, column: 7, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !1, line: 35, column: 6)
!152 = !DILocation(line: 35, column: 6, scope: !148)
!153 = !DILocation(line: 26, column: 12, scope: !147)
!154 = !{!155, !155, i64 0}
!155 = !{!"any pointer", !156, i64 0}
!156 = !{!"omnipotent char", !157, i64 0}
!157 = !{!"Simple C/C++ TBAA"}
!158 = !DILocation(line: 26, column: 4, scope: !147)
!159 = !DILocation(line: 27, column: 4, scope: !147)
!160 = !DILocation(line: 37, column: 7, scope: !161)
!161 = distinct !DILexicalBlock(scope: !148, file: !1, line: 37, column: 6)
!162 = !DILocation(line: 37, column: 6, scope: !148)
!163 = !DILocation(line: 39, column: 7, scope: !148)
!164 = !DILocation(line: 47, column: 7, scope: !148)
!165 = !DILocation(line: 60, column: 1, scope: !4)
!166 = !DILocation(line: 62, column: 22, scope: !17)
!167 = !DIExpression(DW_OP_bit_piece, 0, 1)
!168 = !DILocation(line: 62, column: 49, scope: !17)
!169 = !DILocation(line: 62, column: 88, scope: !17)
!170 = !DILocation(line: 63, column: 2, scope: !17)
!171 = !DILocation(line: 64, column: 2, scope: !17)
!172 = !DILocation(line: 65, column: 2, scope: !17)
!173 = !DILocation(line: 66, column: 2, scope: !17)
!174 = !DILocation(line: 67, column: 12, scope: !17)
!175 = !DILocation(line: 68, column: 12, scope: !17)
!176 = !DILocation(line: 69, column: 12, scope: !17)
!177 = !DILocation(line: 70, column: 12, scope: !17)
!178 = !DILocation(line: 71, column: 12, scope: !17)
!179 = !DILocation(line: 72, column: 12, scope: !17)
!180 = !DILocation(line: 73, column: 12, scope: !17)
!181 = !DILocation(line: 74, column: 12, scope: !17)
!182 = !DILocation(line: 75, column: 2, scope: !17)
!183 = !DILocation(line: 76, column: 2, scope: !17)
!184 = !DILocation(line: 77, column: 12, scope: !17)
!185 = !DILocation(line: 78, column: 12, scope: !17)
!186 = !DILocation(line: 79, column: 12, scope: !17)
!187 = !DILocation(line: 80, column: 12, scope: !17)
!188 = !DILocation(line: 81, column: 12, scope: !17)
!189 = !DILocation(line: 82, column: 12, scope: !17)
!190 = !DILocation(line: 83, column: 12, scope: !17)
!191 = !DILocation(line: 84, column: 12, scope: !17)
!192 = !DILocation(line: 85, column: 12, scope: !17)
!193 = !DILocation(line: 86, column: 12, scope: !17)
!194 = !DILocation(line: 87, column: 12, scope: !17)
!195 = !DILocation(line: 88, column: 12, scope: !17)
!196 = !DILocation(line: 89, column: 12, scope: !17)
!197 = !DILocation(line: 90, column: 12, scope: !17)
!198 = !DILocation(line: 91, column: 12, scope: !17)
!199 = !DILocation(line: 92, column: 12, scope: !17)
!200 = !DILocation(line: 93, column: 12, scope: !17)
!201 = !DILocation(line: 94, column: 12, scope: !17)
!202 = !DILocation(line: 95, column: 12, scope: !17)
!203 = !DILocation(line: 96, column: 12, scope: !17)
!204 = !DILocation(line: 97, column: 12, scope: !17)
!205 = !DILocation(line: 101, column: 7, scope: !17)
!206 = !DILocation(line: 104, column: 2, scope: !17)
!207 = !DILocation(line: 122, column: 7, scope: !208)
!208 = distinct !DILexicalBlock(scope: !209, file: !1, line: 122, column: 6)
!209 = distinct !DILexicalBlock(scope: !17, file: !1, line: 120, column: 13)
!210 = !DILocation(line: 122, column: 6, scope: !209)
!211 = !DILocation(line: 132, column: 8, scope: !212)
!212 = distinct !DILexicalBlock(scope: !209, file: !1, line: 128, column: 14)
!213 = !DILocation(line: 198, column: 9, scope: !212)
!214 = !{!215, !215, i64 0}
!215 = !{!"long long", !156, i64 0}
!216 = !DILocation(line: 136, column: 8, scope: !212)
!217 = !DILocation(line: 146, column: 8, scope: !218)
!218 = distinct !DILexicalBlock(scope: !212, file: !1, line: 146, column: 7)
!219 = !DILocation(line: 146, column: 7, scope: !212)
!220 = !DILocation(line: 160, column: 10, scope: !221)
!221 = distinct !DILexicalBlock(scope: !222, file: !1, line: 160, column: 9)
!222 = distinct !DILexicalBlock(scope: !223, file: !1, line: 156, column: 5)
!223 = distinct !DILexicalBlock(scope: !212, file: !1, line: 154, column: 15)
!224 = !DILocation(line: 160, column: 9, scope: !222)
!225 = !DILocation(line: 171, column: 9, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !1, line: 171, column: 8)
!227 = !DILocation(line: 171, column: 8, scope: !223)
!228 = !DILocation(line: 173, column: 9, scope: !229)
!229 = distinct !DILexicalBlock(scope: !223, file: !1, line: 173, column: 8)
!230 = !DILocation(line: 173, column: 8, scope: !223)
!231 = !DILocation(line: 183, column: 10, scope: !223)
!232 = !DILocation(line: 175, column: 10, scope: !223)
!233 = !DILocation(line: 200, column: 11, scope: !212)
!234 = !DILocation(line: 202, column: 8, scope: !212)
!235 = !DILocation(line: 204, column: 11, scope: !212)
!236 = !DILocation(line: 210, column: 14, scope: !212)
!237 = !DILocation(line: 214, column: 9, scope: !212)
!238 = !DILocation(line: 130, column: 8, scope: !239)
!239 = distinct !DILexicalBlock(scope: !212, file: !1, line: 130, column: 7)
!240 = !DILocation(line: 130, column: 7, scope: !212)
!241 = !DILocation(line: 225, column: 8, scope: !209)
!242 = !DILocation(line: 162, column: 14, scope: !222)
!243 = !DILocation(line: 162, column: 6, scope: !222)
!244 = !DILocation(line: 163, column: 6, scope: !222)
!245 = !DILocation(line: 234, column: 2, scope: !17)
!246 = !DILocation(line: 234, column: 2, scope: !247)
!247 = !DILexicalBlockFile(scope: !248, file: !1, discriminator: 1)
!248 = distinct !DILexicalBlock(scope: !249, file: !1, line: 234, column: 2)
!249 = distinct !DILexicalBlock(scope: !17, file: !1, line: 234, column: 2)
!250 = !DILocation(line: 237, column: 2, scope: !17)
!251 = !DILocation(line: 241, column: 27, scope: !65)
!252 = !DILocation(line: 242, column: 2, scope: !65)
!253 = !DILocation(line: 243, column: 2, scope: !65)
!254 = !DILocation(line: 244, column: 2, scope: !65)
!255 = !DILocation(line: 245, column: 2, scope: !65)
!256 = !DILocation(line: 246, column: 12, scope: !65)
!257 = !DILocation(line: 247, column: 12, scope: !65)
!258 = !DILocation(line: 248, column: 2, scope: !65)
!259 = !DILocation(line: 249, column: 2, scope: !65)
!260 = !DILocation(line: 250, column: 12, scope: !65)
!261 = !DILocation(line: 251, column: 12, scope: !65)
!262 = !DILocation(line: 252, column: 12, scope: !65)
!263 = !DILocation(line: 253, column: 12, scope: !65)
!264 = !DILocation(line: 254, column: 12, scope: !65)
!265 = !DILocation(line: 259, column: 2, scope: !65)
!266 = !DILocation(line: 273, column: 7, scope: !267)
!267 = distinct !DILexicalBlock(scope: !268, file: !1, line: 273, column: 6)
!268 = distinct !DILexicalBlock(scope: !65, file: !1, line: 271, column: 13)
!269 = !DILocation(line: 273, column: 6, scope: !268)
!270 = !DILocation(line: 275, column: 6, scope: !268)
!271 = !DILocation(line: 277, column: 8, scope: !268)
!272 = !DILocation(line: 279, column: 11, scope: !268)
!273 = !DILocation(line: 283, column: 8, scope: !268)
!274 = distinct !{!274, !275, !276}
!275 = !{!"llvm.loop.vectorize.width", i32 1}
!276 = !{!"llvm.loop.interleave.count", i32 1}
!277 = distinct !{!277, !278, !275, !276}
!278 = !{!"llvm.loop.unroll.runtime.disable"}
!279 = !DILocation(line: 294, column: 2, scope: !65)
!280 = !DILocation(line: 298, column: 14, scope: !86)
!281 = !DILocation(line: 298, column: 27, scope: !86)
!282 = !DILocation(line: 299, column: 12, scope: !86)
!283 = !DILocation(line: 300, column: 2, scope: !86)
!284 = !DILocation(line: 301, column: 2, scope: !86)
!285 = !DILocation(line: 302, column: 2, scope: !86)
!286 = !DILocation(line: 303, column: 2, scope: !86)
!287 = !DILocation(line: 304, column: 12, scope: !86)
!288 = !DILocation(line: 305, column: 12, scope: !86)
!289 = !DILocation(line: 306, column: 12, scope: !86)
!290 = !DILocation(line: 307, column: 12, scope: !86)
!291 = !DILocation(line: 308, column: 2, scope: !86)
!292 = !DILocation(line: 309, column: 2, scope: !86)
!293 = !DILocation(line: 310, column: 2, scope: !86)
!294 = !DILocation(line: 311, column: 2, scope: !86)
!295 = !DILocation(line: 312, column: 12, scope: !86)
!296 = !DILocation(line: 313, column: 12, scope: !86)
!297 = !DILocation(line: 314, column: 12, scope: !86)
!298 = !DILocation(line: 315, column: 12, scope: !86)
!299 = !DILocation(line: 316, column: 12, scope: !86)
!300 = !DILocation(line: 317, column: 12, scope: !86)
!301 = !DILocation(line: 318, column: 12, scope: !86)
!302 = !DILocation(line: 319, column: 12, scope: !86)
!303 = !DILocation(line: 320, column: 12, scope: !86)
!304 = !DILocation(line: 321, column: 12, scope: !86)
!305 = !DILocation(line: 322, column: 12, scope: !86)
!306 = !DILocation(line: 324, column: 2, scope: !86)
!307 = !DILocation(line: 325, column: 2, scope: !86)
!308 = !DILocation(line: 241, column: 27, scope: !65, inlinedAt: !309)
!309 = distinct !DILocation(line: 333, column: 7, scope: !86)
!310 = !DILocation(line: 242, column: 2, scope: !65, inlinedAt: !309)
!311 = !DILocation(line: 243, column: 2, scope: !65, inlinedAt: !309)
!312 = !DILocation(line: 244, column: 2, scope: !65, inlinedAt: !309)
!313 = !DILocation(line: 245, column: 2, scope: !65, inlinedAt: !309)
!314 = !DILocation(line: 246, column: 12, scope: !65, inlinedAt: !309)
!315 = !DILocation(line: 247, column: 12, scope: !65, inlinedAt: !309)
!316 = !DILocation(line: 248, column: 2, scope: !65, inlinedAt: !309)
!317 = !DILocation(line: 249, column: 2, scope: !65, inlinedAt: !309)
!318 = !DILocation(line: 250, column: 12, scope: !65, inlinedAt: !309)
!319 = !DILocation(line: 251, column: 12, scope: !65, inlinedAt: !309)
!320 = !DILocation(line: 252, column: 12, scope: !65, inlinedAt: !309)
!321 = !DILocation(line: 253, column: 12, scope: !65, inlinedAt: !309)
!322 = !DILocation(line: 254, column: 12, scope: !65, inlinedAt: !309)
!323 = !DILocation(line: 259, column: 2, scope: !65, inlinedAt: !309)
!324 = !DILocation(line: 333, column: 7, scope: !86)
!325 = !DILocation(line: 275, column: 6, scope: !268, inlinedAt: !309)
!326 = !DILocation(line: 277, column: 8, scope: !268, inlinedAt: !309)
!327 = !DILocation(line: 279, column: 11, scope: !268, inlinedAt: !309)
!328 = distinct !{!328, !275, !276}
!329 = !DILocation(line: 62, column: 22, scope: !17, inlinedAt: !330)
!330 = distinct !DILocation(line: 344, column: 7, scope: !86)
!331 = !DILocation(line: 62, column: 49, scope: !17, inlinedAt: !330)
!332 = !DILocation(line: 62, column: 88, scope: !17, inlinedAt: !330)
!333 = !DILocation(line: 63, column: 2, scope: !17, inlinedAt: !330)
!334 = !DILocation(line: 64, column: 2, scope: !17, inlinedAt: !330)
!335 = !DILocation(line: 65, column: 2, scope: !17, inlinedAt: !330)
!336 = !DILocation(line: 66, column: 2, scope: !17, inlinedAt: !330)
!337 = !DILocation(line: 67, column: 12, scope: !17, inlinedAt: !330)
!338 = !DILocation(line: 68, column: 12, scope: !17, inlinedAt: !330)
!339 = !DILocation(line: 69, column: 12, scope: !17, inlinedAt: !330)
!340 = !DILocation(line: 70, column: 12, scope: !17, inlinedAt: !330)
!341 = !DILocation(line: 71, column: 12, scope: !17, inlinedAt: !330)
!342 = !DILocation(line: 72, column: 12, scope: !17, inlinedAt: !330)
!343 = !DILocation(line: 73, column: 12, scope: !17, inlinedAt: !330)
!344 = !DILocation(line: 74, column: 12, scope: !17, inlinedAt: !330)
!345 = !DILocation(line: 75, column: 2, scope: !17, inlinedAt: !330)
!346 = !DILocation(line: 76, column: 2, scope: !17, inlinedAt: !330)
!347 = !DILocation(line: 77, column: 12, scope: !17, inlinedAt: !330)
!348 = !DILocation(line: 78, column: 12, scope: !17, inlinedAt: !330)
!349 = !DILocation(line: 79, column: 12, scope: !17, inlinedAt: !330)
!350 = !DILocation(line: 80, column: 12, scope: !17, inlinedAt: !330)
!351 = !DILocation(line: 81, column: 12, scope: !17, inlinedAt: !330)
!352 = !DILocation(line: 82, column: 12, scope: !17, inlinedAt: !330)
!353 = !DILocation(line: 83, column: 12, scope: !17, inlinedAt: !330)
!354 = !DILocation(line: 84, column: 12, scope: !17, inlinedAt: !330)
!355 = !DILocation(line: 85, column: 12, scope: !17, inlinedAt: !330)
!356 = !DILocation(line: 86, column: 12, scope: !17, inlinedAt: !330)
!357 = !DILocation(line: 87, column: 12, scope: !17, inlinedAt: !330)
!358 = !DILocation(line: 88, column: 12, scope: !17, inlinedAt: !330)
!359 = !DILocation(line: 89, column: 12, scope: !17, inlinedAt: !330)
!360 = !DILocation(line: 90, column: 12, scope: !17, inlinedAt: !330)
!361 = !DILocation(line: 91, column: 12, scope: !17, inlinedAt: !330)
!362 = !DILocation(line: 92, column: 12, scope: !17, inlinedAt: !330)
!363 = !DILocation(line: 93, column: 12, scope: !17, inlinedAt: !330)
!364 = !DILocation(line: 94, column: 12, scope: !17, inlinedAt: !330)
!365 = !DILocation(line: 95, column: 12, scope: !17, inlinedAt: !330)
!366 = !DILocation(line: 96, column: 12, scope: !17, inlinedAt: !330)
!367 = !DILocation(line: 97, column: 12, scope: !17, inlinedAt: !330)
!368 = !DILocation(line: 104, column: 2, scope: !17, inlinedAt: !330)
!369 = !DILocation(line: 344, column: 7, scope: !86)
!370 = !DILocation(line: 132, column: 8, scope: !212, inlinedAt: !330)
!371 = !DILocation(line: 198, column: 9, scope: !212, inlinedAt: !330)
!372 = !DILocation(line: 136, column: 8, scope: !212, inlinedAt: !330)
!373 = !DILocation(line: 146, column: 8, scope: !218, inlinedAt: !330)
!374 = !DILocation(line: 146, column: 7, scope: !212, inlinedAt: !330)
!375 = !DILocation(line: 160, column: 10, scope: !221, inlinedAt: !330)
!376 = !DILocation(line: 160, column: 9, scope: !222, inlinedAt: !330)
!377 = !DILocation(line: 171, column: 9, scope: !226, inlinedAt: !330)
!378 = !DILocation(line: 171, column: 8, scope: !223, inlinedAt: !330)
!379 = !DILocation(line: 173, column: 9, scope: !229, inlinedAt: !330)
!380 = !DILocation(line: 173, column: 8, scope: !223, inlinedAt: !330)
!381 = !DILocation(line: 183, column: 10, scope: !223, inlinedAt: !330)
!382 = !DILocation(line: 175, column: 10, scope: !223, inlinedAt: !330)
!383 = !DILocation(line: 200, column: 11, scope: !212, inlinedAt: !330)
!384 = !DILocation(line: 202, column: 8, scope: !212, inlinedAt: !330)
!385 = !DILocation(line: 204, column: 11, scope: !212, inlinedAt: !330)
!386 = !DILocation(line: 210, column: 14, scope: !212, inlinedAt: !330)
!387 = !DILocation(line: 214, column: 9, scope: !212, inlinedAt: !330)
!388 = !DILocation(line: 130, column: 8, scope: !239, inlinedAt: !330)
!389 = !DILocation(line: 130, column: 7, scope: !212, inlinedAt: !330)
!390 = !DILocation(line: 225, column: 8, scope: !209, inlinedAt: !330)
!391 = !DILocation(line: 122, column: 7, scope: !208, inlinedAt: !330)
!392 = !DILocation(line: 122, column: 6, scope: !209, inlinedAt: !330)
!393 = !DILocation(line: 372, column: 9, scope: !394)
!394 = distinct !DILexicalBlock(scope: !395, file: !1, line: 368, column: 14)
!395 = distinct !DILexicalBlock(scope: !86, file: !1, line: 360, column: 13)
!396 = !DILocation(line: 162, column: 14, scope: !222, inlinedAt: !330)
!397 = !DILocation(line: 162, column: 6, scope: !222, inlinedAt: !330)
!398 = !DILocation(line: 163, column: 6, scope: !222, inlinedAt: !330)
!399 = !DILocation(line: 370, column: 7, scope: !394)
!400 = !DILocation(line: 384, column: 9, scope: !394)
!401 = !DILocation(line: 376, column: 8, scope: !394)
!402 = !DILocation(line: 378, column: 11, scope: !394)
!403 = distinct !{!403, !275, !276}
!404 = !DILocation(line: 395, column: 8, scope: !395)
!405 = !DILocation(line: 362, column: 6, scope: !395)
!406 = !DILocation(line: 407, column: 2, scope: !86)
!407 = !DILocation(line: 408, column: 9, scope: !86)
!408 = !DILocation(line: 408, column: 28, scope: !86)
!409 = !DILocation(line: 408, column: 35, scope: !86)
!410 = !DILocation(line: 411, column: 2, scope: !86)
!411 = !DILocation(line: 415, column: 2, scope: !86)
!412 = !DILocation(line: 417, column: 2, scope: !413)
!413 = !DILexicalBlockFile(scope: !414, file: !1, discriminator: 1)
!414 = distinct !DILexicalBlock(scope: !415, file: !1, line: 417, column: 2)
!415 = distinct !DILexicalBlock(scope: !86, file: !1, line: 417, column: 2)
!416 = !DILocation(line: 418, column: 2, scope: !417)
!417 = !DILexicalBlockFile(scope: !418, file: !1, discriminator: 1)
!418 = distinct !DILexicalBlock(scope: !419, file: !1, line: 418, column: 2)
!419 = distinct !DILexicalBlock(scope: !86, file: !1, line: 418, column: 2)
!420 = !DILocation(line: 421, column: 2, scope: !421)
!421 = !DILexicalBlockFile(scope: !422, file: !1, discriminator: 1)
!422 = distinct !DILexicalBlock(scope: !423, file: !1, line: 421, column: 2)
!423 = distinct !DILexicalBlock(scope: !86, file: !1, line: 421, column: 2)
!424 = !DILocation(line: 422, column: 2, scope: !86)
