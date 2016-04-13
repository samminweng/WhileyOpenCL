; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !6 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !12, metadata !170), !dbg !171
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !13, metadata !170), !dbg !172
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !170), !dbg !172
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !15, metadata !170), !dbg !173
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !17, metadata !170), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !18, metadata !170), !dbg !174
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !19, metadata !170), !dbg !175
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !20, metadata !170), !dbg !176
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !21, metadata !170), !dbg !177
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !22, metadata !170), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !23, metadata !170), !dbg !178
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !24, metadata !170), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !170), !dbg !180
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !26, metadata !170), !dbg !181
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !170), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !28, metadata !170), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !170), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !21, metadata !170), !dbg !177
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !23, metadata !170), !dbg !178
  %conv1 = trunc i64 %n to i32, !dbg !185
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #7, !dbg !185
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !22, metadata !170), !dbg !178
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !24, metadata !170), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !18, metadata !170), !dbg !174
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !17, metadata !170), !dbg !174
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !19, metadata !170), !dbg !175
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !24, metadata !170), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !170), !dbg !180
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !20, metadata !170), !dbg !176
  %cmp41 = icmp sgt i64 %n, 0, !dbg !186
  br i1 %cmp41, label %if.end7.preheader, label %if.end15, !dbg !189

if.end7.preheader:                                ; preds = %entry
  %0 = add i64 %n, -1, !dbg !190
  %xtraiter = and i64 %n, 3, !dbg !190
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !190
  br i1 %lcmp.mod, label %if.end7.preheader.split, label %if.end7.prol.preheader, !dbg !190

if.end7.prol.preheader:                           ; preds = %if.end7.preheader
  br label %if.end7.prol, !dbg !190

if.end7.prol:                                     ; preds = %if.end7.prol.preheader, %if.end7.prol
  %i.042.prol = phi i64 [ %add9.prol, %if.end7.prol ], [ 0, %if.end7.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end7.prol ], [ %xtraiter, %if.end7.prol.preheader ]
  %arrayidx.prol = getelementptr inbounds i64, i64* %call, i64 %i.042.prol, !dbg !190
  %1 = load i64, i64* %arrayidx.prol, align 8, !dbg !190, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !26, metadata !170), !dbg !181
  %add.prol = add nsw i64 %1, %i.042.prol, !dbg !195
  tail call void @llvm.dbg.value(metadata i64 %add.prol, i64 0, metadata !27, metadata !170), !dbg !182
  store i64 %add.prol, i64* %arrayidx.prol, align 8, !dbg !196, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !170), !dbg !183
  %add9.prol = add nuw nsw i64 %i.042.prol, 1, !dbg !197
  tail call void @llvm.dbg.value(metadata i64 %add9.prol, i64 0, metadata !29, metadata !170), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %add9.prol, i64 0, metadata !20, metadata !170), !dbg !176
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !189
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !189
  br i1 %prol.iter.cmp, label %if.end7.preheader.split.loopexit, label %if.end7.prol, !dbg !189, !llvm.loop !198

if.end7.preheader.split.loopexit:                 ; preds = %if.end7.prol
  %add9.prol.lcssa = phi i64 [ %add9.prol, %if.end7.prol ]
  br label %if.end7.preheader.split, !dbg !190

if.end7.preheader.split:                          ; preds = %if.end7.preheader.split.loopexit, %if.end7.preheader
  %i.042.unr = phi i64 [ 0, %if.end7.preheader ], [ %add9.prol.lcssa, %if.end7.preheader.split.loopexit ]
  %2 = icmp ult i64 %0, 3, !dbg !190
  br i1 %2, label %if.end15.loopexit, label %if.end7.preheader.split.split, !dbg !190

if.end7.preheader.split.split:                    ; preds = %if.end7.preheader.split
  br label %if.end7, !dbg !190

if.end7:                                          ; preds = %if.end7, %if.end7.preheader.split.split
  %i.042 = phi i64 [ %i.042.unr, %if.end7.preheader.split.split ], [ %add9.3, %if.end7 ]
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %i.042, !dbg !190
  %3 = load i64, i64* %arrayidx, align 8, !dbg !190, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !26, metadata !170), !dbg !181
  %add = add nsw i64 %3, %i.042, !dbg !195
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !27, metadata !170), !dbg !182
  store i64 %add, i64* %arrayidx, align 8, !dbg !196, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !170), !dbg !183
  %add9 = add nuw nsw i64 %i.042, 1, !dbg !197
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !29, metadata !170), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !20, metadata !170), !dbg !176
  %arrayidx.1 = getelementptr inbounds i64, i64* %call, i64 %add9, !dbg !190
  %4 = load i64, i64* %arrayidx.1, align 8, !dbg !190, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !26, metadata !170), !dbg !181
  %add.1 = add nsw i64 %4, %add9, !dbg !195
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !27, metadata !170), !dbg !182
  store i64 %add.1, i64* %arrayidx.1, align 8, !dbg !196, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !170), !dbg !183
  %add9.1 = add nsw i64 %i.042, 2, !dbg !197
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !29, metadata !170), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !20, metadata !170), !dbg !176
  %arrayidx.2 = getelementptr inbounds i64, i64* %call, i64 %add9.1, !dbg !190
  %5 = load i64, i64* %arrayidx.2, align 8, !dbg !190, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !26, metadata !170), !dbg !181
  %add.2 = add nsw i64 %5, %add9.1, !dbg !195
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !27, metadata !170), !dbg !182
  store i64 %add.2, i64* %arrayidx.2, align 8, !dbg !196, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !170), !dbg !183
  %add9.2 = add nsw i64 %i.042, 3, !dbg !197
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !29, metadata !170), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !20, metadata !170), !dbg !176
  %arrayidx.3 = getelementptr inbounds i64, i64* %call, i64 %add9.2, !dbg !190
  %6 = load i64, i64* %arrayidx.3, align 8, !dbg !190, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !26, metadata !170), !dbg !181
  %add.3 = add nsw i64 %6, %add9.2, !dbg !195
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !27, metadata !170), !dbg !182
  store i64 %add.3, i64* %arrayidx.3, align 8, !dbg !196, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !170), !dbg !183
  %add9.3 = add nsw i64 %i.042, 4, !dbg !197
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !29, metadata !170), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !20, metadata !170), !dbg !176
  %exitcond.3 = icmp eq i64 %add9.3, %n, !dbg !189
  br i1 %exitcond.3, label %if.end15.loopexit.unr-lcssa, label %if.end7, !dbg !189

if.end15.loopexit.unr-lcssa:                      ; preds = %if.end7
  br label %if.end15.loopexit, !dbg !200

if.end15.loopexit:                                ; preds = %if.end7.preheader.split, %if.end15.loopexit.unr-lcssa
  br label %if.end15, !dbg !200

if.end15:                                         ; preds = %if.end15.loopexit, %entry
  ret i64* %call, !dbg !200
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind uwtable
define i64 @getBobSum(i64 %sum_alice, i64* nocapture %coins, i64 %coins_size, i1 zeroext %coins_has_ownership, i64 %n) #0 !dbg !30 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %sum_alice, i64 0, metadata !34, metadata !170), !dbg !201
  tail call void @llvm.dbg.value(metadata i64* %coins, i64 0, metadata !35, metadata !170), !dbg !202
  tail call void @llvm.dbg.value(metadata i64 %coins_size, i64 0, metadata !36, metadata !170), !dbg !202
  tail call void @llvm.dbg.value(metadata i1 %coins_has_ownership, i64 0, metadata !37, metadata !203), !dbg !204
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !38, metadata !170), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !170), !dbg !206
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !170), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !170), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !170), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !170), !dbg !210
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !170), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !170), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !170), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !47, metadata !170), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !48, metadata !170), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !170), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !170), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !170), !dbg !210
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !170), !dbg !208
  %cmp18 = icmp sgt i64 %n, 0, !dbg !216
  br i1 %cmp18, label %if.end.preheader, label %blklab2, !dbg !219

if.end.preheader:                                 ; preds = %entry
  %0 = add i64 %n, -1, !dbg !220
  %xtraiter = and i64 %n, 7, !dbg !220
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !220
  br i1 %lcmp.mod, label %if.end.preheader.split, label %if.end.prol.preheader, !dbg !220

if.end.prol.preheader:                            ; preds = %if.end.preheader
  br label %if.end.prol, !dbg !220

if.end.prol:                                      ; preds = %if.end.prol.preheader, %if.end.prol
  %i.020.prol = phi i64 [ %add1.prol, %if.end.prol ], [ 0, %if.end.prol.preheader ]
  %sum.019.prol = phi i64 [ %add.prol, %if.end.prol ], [ 0, %if.end.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end.prol ], [ %xtraiter, %if.end.prol.preheader ]
  %arrayidx.prol = getelementptr inbounds i64, i64* %coins, i64 %i.020.prol, !dbg !220
  %1 = load i64, i64* %arrayidx.prol, align 8, !dbg !220, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !44, metadata !170), !dbg !211
  %add.prol = add nsw i64 %1, %sum.019.prol, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %add.prol, i64 0, metadata !45, metadata !170), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add.prol, i64 0, metadata !41, metadata !170), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !46, metadata !170), !dbg !213
  %add1.prol = add nuw nsw i64 %i.020.prol, 1, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %add1.prol, i64 0, metadata !47, metadata !170), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %add1.prol, i64 0, metadata !40, metadata !170), !dbg !207
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !219
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !219
  br i1 %prol.iter.cmp, label %if.end.preheader.split.loopexit, label %if.end.prol, !dbg !219, !llvm.loop !223

if.end.preheader.split.loopexit:                  ; preds = %if.end.prol
  %add1.prol.lcssa = phi i64 [ %add1.prol, %if.end.prol ]
  %add.prol.lcssa = phi i64 [ %add.prol, %if.end.prol ]
  br label %if.end.preheader.split, !dbg !220

if.end.preheader.split:                           ; preds = %if.end.preheader.split.loopexit, %if.end.preheader
  %add.lcssa.unr = phi i64 [ undef, %if.end.preheader ], [ %add.prol.lcssa, %if.end.preheader.split.loopexit ]
  %i.020.unr = phi i64 [ 0, %if.end.preheader ], [ %add1.prol.lcssa, %if.end.preheader.split.loopexit ]
  %sum.019.unr = phi i64 [ 0, %if.end.preheader ], [ %add.prol.lcssa, %if.end.preheader.split.loopexit ]
  %2 = icmp ult i64 %0, 7, !dbg !220
  br i1 %2, label %blklab2.loopexit, label %if.end.preheader.split.split, !dbg !220

if.end.preheader.split.split:                     ; preds = %if.end.preheader.split
  br label %if.end, !dbg !220

if.end:                                           ; preds = %if.end, %if.end.preheader.split.split
  %i.020 = phi i64 [ %i.020.unr, %if.end.preheader.split.split ], [ %add1.7, %if.end ]
  %sum.019 = phi i64 [ %sum.019.unr, %if.end.preheader.split.split ], [ %add.7, %if.end ]
  %arrayidx = getelementptr inbounds i64, i64* %coins, i64 %i.020, !dbg !220
  %3 = load i64, i64* %arrayidx, align 8, !dbg !220, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !44, metadata !170), !dbg !211
  %add = add nsw i64 %3, %sum.019, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !45, metadata !170), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !41, metadata !170), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !46, metadata !170), !dbg !213
  %add1 = add nuw nsw i64 %i.020, 1, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !47, metadata !170), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !40, metadata !170), !dbg !207
  %arrayidx.1 = getelementptr inbounds i64, i64* %coins, i64 %add1, !dbg !220
  %4 = load i64, i64* %arrayidx.1, align 8, !dbg !220, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !44, metadata !170), !dbg !211
  %add.1 = add nsw i64 %4, %add, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !45, metadata !170), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !41, metadata !170), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !46, metadata !170), !dbg !213
  %add1.1 = add nsw i64 %i.020, 2, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !47, metadata !170), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !40, metadata !170), !dbg !207
  %arrayidx.2 = getelementptr inbounds i64, i64* %coins, i64 %add1.1, !dbg !220
  %5 = load i64, i64* %arrayidx.2, align 8, !dbg !220, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !44, metadata !170), !dbg !211
  %add.2 = add nsw i64 %5, %add.1, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !45, metadata !170), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !41, metadata !170), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !46, metadata !170), !dbg !213
  %add1.2 = add nsw i64 %i.020, 3, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !47, metadata !170), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !40, metadata !170), !dbg !207
  %arrayidx.3 = getelementptr inbounds i64, i64* %coins, i64 %add1.2, !dbg !220
  %6 = load i64, i64* %arrayidx.3, align 8, !dbg !220, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !44, metadata !170), !dbg !211
  %add.3 = add nsw i64 %6, %add.2, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !45, metadata !170), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !41, metadata !170), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !46, metadata !170), !dbg !213
  %add1.3 = add nsw i64 %i.020, 4, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !47, metadata !170), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !40, metadata !170), !dbg !207
  %arrayidx.4 = getelementptr inbounds i64, i64* %coins, i64 %add1.3, !dbg !220
  %7 = load i64, i64* %arrayidx.4, align 8, !dbg !220, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !44, metadata !170), !dbg !211
  %add.4 = add nsw i64 %7, %add.3, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !45, metadata !170), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !41, metadata !170), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !46, metadata !170), !dbg !213
  %add1.4 = add nsw i64 %i.020, 5, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !47, metadata !170), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !40, metadata !170), !dbg !207
  %arrayidx.5 = getelementptr inbounds i64, i64* %coins, i64 %add1.4, !dbg !220
  %8 = load i64, i64* %arrayidx.5, align 8, !dbg !220, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !44, metadata !170), !dbg !211
  %add.5 = add nsw i64 %8, %add.4, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !45, metadata !170), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !41, metadata !170), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !46, metadata !170), !dbg !213
  %add1.5 = add nsw i64 %i.020, 6, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !47, metadata !170), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !40, metadata !170), !dbg !207
  %arrayidx.6 = getelementptr inbounds i64, i64* %coins, i64 %add1.5, !dbg !220
  %9 = load i64, i64* %arrayidx.6, align 8, !dbg !220, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !44, metadata !170), !dbg !211
  %add.6 = add nsw i64 %9, %add.5, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !45, metadata !170), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !41, metadata !170), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !46, metadata !170), !dbg !213
  %add1.6 = add nsw i64 %i.020, 7, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !47, metadata !170), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !40, metadata !170), !dbg !207
  %arrayidx.7 = getelementptr inbounds i64, i64* %coins, i64 %add1.6, !dbg !220
  %10 = load i64, i64* %arrayidx.7, align 8, !dbg !220, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !44, metadata !170), !dbg !211
  %add.7 = add nsw i64 %10, %add.6, !dbg !221
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !45, metadata !170), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !41, metadata !170), !dbg !208
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !46, metadata !170), !dbg !213
  %add1.7 = add nsw i64 %i.020, 8, !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !47, metadata !170), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !40, metadata !170), !dbg !207
  %exitcond.7 = icmp eq i64 %add1.7, %n, !dbg !219
  br i1 %exitcond.7, label %blklab2.loopexit.unr-lcssa, label %if.end, !dbg !219

blklab2.loopexit.unr-lcssa:                       ; preds = %if.end
  %add.7.lcssa = phi i64 [ %add.7, %if.end ]
  br label %blklab2.loopexit, !dbg !224

blklab2.loopexit:                                 ; preds = %if.end.preheader.split, %blklab2.loopexit.unr-lcssa
  %add.lcssa = phi i64 [ %add.lcssa.unr, %if.end.preheader.split ], [ %add.7.lcssa, %blklab2.loopexit.unr-lcssa ]
  br label %blklab2, !dbg !224

blklab2:                                          ; preds = %blklab2.loopexit, %entry
  %sum.0.lcssa = phi i64 [ 0, %entry ], [ %add.lcssa, %blklab2.loopexit ]
  %sub = sub nsw i64 %sum.0.lcssa, %sum_alice, !dbg !224
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !48, metadata !170), !dbg !215
  br i1 %coins_has_ownership, label %if.then2, label %if.end3, !dbg !225

if.then2:                                         ; preds = %blklab2
  %11 = bitcast i64* %coins to i8*, !dbg !226
  tail call void @free(i8* %11) #7, !dbg !226
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !37, metadata !170), !dbg !204
  br label %if.end3, !dbg !226

if.end3:                                          ; preds = %if.then2, %blklab2
  ret i64 %sub, !dbg !230
}

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %coins, i64 %coins_size, i1 zeroext %coins_has_ownership, i64 %n) #3 !dbg !49 {
entry:
  tail call void @llvm.dbg.value(metadata i64* %coins, i64 0, metadata !53, metadata !170), !dbg !231
  tail call void @llvm.dbg.value(metadata i64 %coins_size, i64 0, metadata !54, metadata !170), !dbg !231
  tail call void @llvm.dbg.value(metadata i1 %coins_has_ownership, i64 0, metadata !55, metadata !203), !dbg !232
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !56, metadata !170), !dbg !233
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !57, metadata !170), !dbg !234
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !58, metadata !170), !dbg !234
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !59, metadata !170), !dbg !235
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !60, metadata !170), !dbg !236
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !170), !dbg !236
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !62, metadata !170), !dbg !237
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !170), !dbg !238
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !170), !dbg !239
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !65, metadata !170), !dbg !240
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !170), !dbg !241
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !170), !dbg !242
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !170), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !170), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !170), !dbg !245
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !71, metadata !170), !dbg !246
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !170), !dbg !246
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !73, metadata !170), !dbg !247
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !170), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !75, metadata !170), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !170), !dbg !250
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !170), !dbg !251
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !170), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !170), !dbg !253
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !170), !dbg !254
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !170), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !82, metadata !170), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !170), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !84, metadata !170), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !170), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !170), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !170), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !170), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !170), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !170), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !91, metadata !170), !dbg !265
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !170), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !93, metadata !170), !dbg !267
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !94, metadata !170), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !95, metadata !170), !dbg !269
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !96, metadata !170), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !170), !dbg !271
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !170), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !99, metadata !170), !dbg !273
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !170), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !101, metadata !170), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !170), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !103, metadata !170), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !170), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !105, metadata !170), !dbg !279
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !170), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !107, metadata !170), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !170), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !109, metadata !170), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !170), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !111, metadata !170), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !170), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !113, metadata !170), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !170), !dbg !288
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !115, metadata !170), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !170), !dbg !290
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !117, metadata !170), !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !118, metadata !170), !dbg !292
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !119, metadata !170), !dbg !293
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !170), !dbg !294
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !121, metadata !170), !dbg !295
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !170), !dbg !296
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !123, metadata !170), !dbg !297
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !170), !dbg !244
  %mul = mul i64 %n, %n, !dbg !298
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !70, metadata !170), !dbg !245
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !72, metadata !170), !dbg !246
  %conv1 = trunc i64 %mul to i32, !dbg !299
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #7, !dbg !299
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !71, metadata !170), !dbg !246
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !73, metadata !170), !dbg !247
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !61, metadata !170), !dbg !236
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !60, metadata !170), !dbg !236
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !62, metadata !170), !dbg !237
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !73, metadata !170), !dbg !247
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !170), !dbg !248
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !170), !dbg !238
  %cmp201 = icmp sgt i64 %n, 0, !dbg !300
  br i1 %cmp201, label %polly.split_new_and_old, label %blklab4, !dbg !303

polly.split_new_and_old:                          ; preds = %entry
  %0 = icmp slt i64 %n, 1152921504606846977
  %polly.access.coins = getelementptr i64, i64* %coins, i64 %n
  %1 = icmp sgt i64 %n, 1
  %2 = add i64 %n, -1
  %3 = select i1 %1, i64 0, i64 %2
  %polly.access.mul.call = mul i64 %3, %n
  %polly.access.add.call = add i64 %polly.access.mul.call, %3
  %polly.access.call = getelementptr i64, i64* %call, i64 %polly.access.add.call
  %4 = icmp ule i64* %polly.access.coins, %polly.access.call
  %polly.access.call206 = getelementptr i64, i64* %call, i64 %mul
  %5 = icmp ule i64* %polly.access.call206, %coins
  %6 = or i1 %4, %5
  %7 = and i1 %0, %6
  br i1 %7, label %polly.loop_preheader, label %while.cond8.preheader.preheader

while.cond8.preheader.preheader:                  ; preds = %polly.split_new_and_old
  br label %while.cond8.preheader, !dbg !304

while.cond8.preheader:                            ; preds = %while.cond8.preheader.preheader, %blklab6
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab6 ], [ %n, %while.cond8.preheader.preheader ]
  %s.0202 = phi i64 [ %add72, %blklab6 ], [ 0, %while.cond8.preheader.preheader ]
  br label %if.end13, !dbg !304

if.end13:                                         ; preds = %blklab10, %while.cond8.preheader
  %i.0200 = phi i64 [ 0, %while.cond8.preheader ], [ %add, %blklab10 ]
  %j.0199 = phi i64 [ %s.0202, %while.cond8.preheader ], [ %add70, %blklab10 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !170), !dbg !250
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !170), !dbg !241
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !77, metadata !170), !dbg !251
  %add = add nuw nsw i64 %i.0200, 1, !dbg !306
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !78, metadata !170), !dbg !252
  %cmp14 = icmp sge i64 %add, %n, !dbg !307
  %cmp18 = icmp slt i64 %j.0199, 1, !dbg !309
  %or.cond = or i1 %cmp18, %cmp14, !dbg !311
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !79, metadata !170), !dbg !253
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !170), !dbg !255
  br i1 %or.cond, label %blklab8, label %if.end21, !dbg !311

if.end21:                                         ; preds = %if.end13
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !82, metadata !170), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !83, metadata !170), !dbg !257
  %mul23 = mul nsw i64 %add, %n, !dbg !312
  tail call void @llvm.dbg.value(metadata i64 %mul23, i64 0, metadata !84, metadata !170), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 %add24, i64 0, metadata !85, metadata !170), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !86, metadata !170), !dbg !260
  %add24 = add nsw i64 %j.0199, -1, !dbg !313
  %sub25 = add i64 %add24, %mul23, !dbg !314
  tail call void @llvm.dbg.value(metadata i64 %sub25, i64 0, metadata !87, metadata !170), !dbg !261
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %sub25, !dbg !315
  %8 = load i64, i64* %arrayidx, align 8, !dbg !315, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %8, i64 0, metadata !88, metadata !170), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 %8, i64 0, metadata !66, metadata !170), !dbg !241
  br label %blklab8, !dbg !316

blklab8:                                          ; preds = %if.end13, %if.end21
  %y.0 = phi i64 [ 0, %if.end13 ], [ %8, %if.end21 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !170), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !170), !dbg !242
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !90, metadata !170), !dbg !264
  %add26 = add nuw nsw i64 %i.0200, 2, !dbg !317
  tail call void @llvm.dbg.value(metadata i64 %add26, i64 0, metadata !91, metadata !170), !dbg !265
  %cmp27 = icmp slt i64 %add26, %n, !dbg !318
  br i1 %cmp27, label %if.end30, label %blklab9, !dbg !320

if.end30:                                         ; preds = %blklab8
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !92, metadata !170), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 %add26, i64 0, metadata !93, metadata !170), !dbg !267
  %mul32 = mul nsw i64 %add26, %n, !dbg !321
  tail call void @llvm.dbg.value(metadata i64 %mul32, i64 0, metadata !94, metadata !170), !dbg !268
  %add33 = add nsw i64 %mul32, %j.0199, !dbg !322
  tail call void @llvm.dbg.value(metadata i64 %add33, i64 0, metadata !95, metadata !170), !dbg !269
  %arrayidx34 = getelementptr inbounds i64, i64* %call, i64 %add33, !dbg !323
  %9 = load i64, i64* %arrayidx34, align 8, !dbg !323, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !96, metadata !170), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !67, metadata !170), !dbg !242
  br label %blklab9, !dbg !324

blklab9:                                          ; preds = %blklab8, %if.end30
  %x.0 = phi i64 [ 0, %blklab8 ], [ %9, %if.end30 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !170), !dbg !271
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !170), !dbg !243
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !98, metadata !170), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !170), !dbg !274
  %cmp36 = icmp slt i64 %j.0199, 2, !dbg !325
  %.pre = mul nsw i64 %i.0200, %n, !dbg !327
  br i1 %cmp36, label %blklab10, label %if.end39, !dbg !328

if.end39:                                         ; preds = %blklab9
  tail call void @llvm.dbg.value(metadata i64 %.pre, i64 0, metadata !101, metadata !170), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 %add41, i64 0, metadata !102, metadata !170), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !103, metadata !170), !dbg !277
  %add41 = add nsw i64 %j.0199, -2, !dbg !329
  %sub42 = add i64 %add41, %.pre, !dbg !330
  tail call void @llvm.dbg.value(metadata i64 %sub42, i64 0, metadata !104, metadata !170), !dbg !278
  %arrayidx43 = getelementptr inbounds i64, i64* %call, i64 %sub42, !dbg !331
  %10 = load i64, i64* %arrayidx43, align 8, !dbg !331, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %10, i64 0, metadata !105, metadata !170), !dbg !279
  tail call void @llvm.dbg.value(metadata i64 %10, i64 0, metadata !68, metadata !170), !dbg !243
  br label %blklab10, !dbg !332

blklab10:                                         ; preds = %blklab9, %if.end39
  %z.0 = phi i64 [ %10, %if.end39 ], [ 0, %blklab9 ]
  %cmp44 = icmp sgt i64 %x.0, %y.0, !dbg !333
  tail call void @llvm.dbg.value(metadata i64 %y.0, i64 0, metadata !67, metadata !170), !dbg !242
  %y.0.x.0 = select i1 %cmp44, i64 %y.0, i64 %x.0, !dbg !335
  %cmp48 = icmp sgt i64 %z.0, %y.0, !dbg !336
  tail call void @llvm.dbg.value(metadata i64 %y.0, i64 0, metadata !68, metadata !170), !dbg !243
  %z.1 = select i1 %cmp48, i64 %y.0, i64 %z.0, !dbg !338
  %arrayidx52 = getelementptr inbounds i64, i64* %coins, i64 %i.0200, !dbg !339
  %11 = load i64, i64* %arrayidx52, align 8, !dbg !339, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %11, i64 0, metadata !106, metadata !170), !dbg !280
  %add53 = add nsw i64 %11, %y.0.x.0, !dbg !340
  tail call void @llvm.dbg.value(metadata i64 %add53, i64 0, metadata !107, metadata !170), !dbg !281
  %arrayidx54 = getelementptr inbounds i64, i64* %coins, i64 %j.0199, !dbg !341
  %12 = load i64, i64* %arrayidx54, align 8, !dbg !341, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %12, i64 0, metadata !108, metadata !170), !dbg !282
  %add55 = add nsw i64 %12, %z.1, !dbg !342
  tail call void @llvm.dbg.value(metadata i64 %add55, i64 0, metadata !109, metadata !170), !dbg !283
  %cmp56 = icmp sgt i64 %add53, %add55, !dbg !343
  %add63 = add nsw i64 %.pre, %j.0199, !dbg !345
  %arrayidx64 = getelementptr inbounds i64, i64* %call, i64 %add63, !dbg !346
  %add53.add55 = select i1 %cmp56, i64 %add53, i64 %add55, !dbg !347
  store i64 %add53.add55, i64* %arrayidx64, align 8, !dbg !348, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !118, metadata !170), !dbg !292
  %add70 = add nuw nsw i64 %j.0199, 1, !dbg !349
  tail call void @llvm.dbg.value(metadata i64 %add70, i64 0, metadata !119, metadata !170), !dbg !293
  tail call void @llvm.dbg.value(metadata i64 %add70, i64 0, metadata !64, metadata !170), !dbg !239
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !120, metadata !170), !dbg !294
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !121, metadata !170), !dbg !295
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !65, metadata !170), !dbg !240
  %exitcond = icmp eq i64 %add, %indvars.iv, !dbg !304
  br i1 %exitcond, label %blklab6, label %if.end13, !dbg !304

blklab6:                                          ; preds = %blklab10
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !122, metadata !170), !dbg !296
  %add72 = add nuw nsw i64 %s.0202, 1, !dbg !350
  tail call void @llvm.dbg.value(metadata i64 %add72, i64 0, metadata !123, metadata !170), !dbg !297
  tail call void @llvm.dbg.value(metadata i64 %add72, i64 0, metadata !63, metadata !170), !dbg !238
  %indvars.iv.next = add i64 %indvars.iv, -1, !dbg !303
  %exitcond203 = icmp eq i64 %add72, %n, !dbg !303
  br i1 %exitcond203, label %blklab4.loopexit268, label %while.cond8.preheader, !dbg !303

blklab4.loopexit:                                 ; preds = %polly.loop_exit211
  br label %blklab4, !dbg !351

blklab4.loopexit268:                              ; preds = %blklab6
  br label %blklab4, !dbg !351

blklab4:                                          ; preds = %blklab4.loopexit268, %blklab4.loopexit, %entry
  br i1 %coins_has_ownership, label %if.then74, label %if.end81, !dbg !351

if.then74:                                        ; preds = %blklab4
  %13 = bitcast i64* %coins to i8*, !dbg !352
  tail call void @free(i8* %13) #7, !dbg !352
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !55, metadata !170), !dbg !232
  br label %if.end81, !dbg !352

if.end81:                                         ; preds = %if.then74, %blklab4
  ret i64* %call, !dbg !356

polly.loop_header:                                ; preds = %polly.loop_exit211, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit211 ]
  %14 = sub nsw i64 %n, %polly.indvar
  %polly.loop_guard212 = icmp sgt i64 %14, 0
  br i1 %polly.loop_guard212, label %polly.loop_preheader210, label %polly.loop_exit211

polly.loop_exit211.loopexit:                      ; preds = %polly.merge221.us
  br label %polly.loop_exit211

polly.loop_exit211.loopexit267:                   ; preds = %polly.merge221
  br label %polly.loop_exit211

polly.loop_exit211:                               ; preds = %polly.loop_exit211.loopexit267, %polly.loop_exit211.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond262 = icmp eq i64 %polly.indvar_next, %n
  br i1 %exitcond262, label %blklab4.loopexit, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.split_new_and_old
  %scevgep = getelementptr i64, i64* %call, i64 %2
  %15 = shl i64 %n, 3
  %16 = add i64 %15, 8
  %17 = shl i64 %n, 1
  %scevgep228 = getelementptr i64, i64* %call, i64 %17
  %scevgep238 = getelementptr i64, i64* %call, i64 -2
  %18 = icmp sgt i64 %n, 2
  %19 = icmp eq i64 %n, 2
  br label %polly.loop_header

polly.loop_header209:                             ; preds = %polly.loop_header209.preheader, %polly.merge221
  %polly.indvar213 = phi i64 [ %29, %polly.merge221 ], [ 0, %polly.loop_header209.preheader ]
  %20 = add nsw i64 %polly.indvar213, 2
  %21 = icmp sle i64 %20, %n
  %22 = add nsw i64 %polly.indvar213, %polly.indvar
  %23 = icmp sgt i64 %22, 0
  %24 = and i1 %21, %23
  br i1 %24, label %polly.cond220.thread, label %polly.cond220

polly.cond220:                                    ; preds = %polly.loop_header209
  %25 = icmp eq i64 %polly.indvar213, 0
  %26 = add nsw i64 %polly.indvar213, 1
  %27 = icmp eq i64 %26, %n
  %28 = or i1 %27, %25
  br i1 %28, label %polly.cond224, label %polly.merge221

polly.merge221:                                   ; preds = %polly.cond244, %polly.cond220, %polly.stmt.blklab10
  %29 = phi i64 [ %63, %polly.cond244 ], [ %26, %polly.cond220 ], [ %63, %polly.stmt.blklab10 ]
  %polly.loop_cond216 = icmp slt i64 %polly.indvar213, %polly.adjust_ub215
  br i1 %polly.loop_cond216, label %polly.loop_header209, label %polly.loop_exit211.loopexit267

polly.loop_preheader210:                          ; preds = %polly.loop_header
  %scevgep217 = getelementptr i64, i64* %scevgep, i64 %polly.indvar
  %scevgep217218 = bitcast i64* %scevgep217 to i8*
  %scevgep229 = getelementptr i64, i64* %scevgep228, i64 %polly.indvar
  %scevgep229230 = bitcast i64* %scevgep229 to i8*
  %scevgep239 = getelementptr i64, i64* %scevgep238, i64 %polly.indvar
  %scevgep239240 = bitcast i64* %scevgep239 to i8*
  %scevgep251 = getelementptr i64, i64* %coins, i64 %polly.indvar
  %scevgep254 = getelementptr i64, i64* %call, i64 %polly.indvar
  %scevgep254255 = bitcast i64* %scevgep254 to i8*
  %30 = add nsw i64 %polly.indvar, %n
  %31 = icmp sgt i64 %30, 2
  %polly.adjust_ub215 = add i64 %14, -1
  br i1 %18, label %polly.loop_header209.us.preheader, label %polly.loop_header209.preheader

polly.loop_header209.preheader:                   ; preds = %polly.loop_preheader210
  br label %polly.loop_header209

polly.loop_header209.us.preheader:                ; preds = %polly.loop_preheader210
  br label %polly.loop_header209.us

polly.loop_header209.us:                          ; preds = %polly.loop_header209.us.preheader, %polly.merge221.us
  %polly.indvar213.us = phi i64 [ %59, %polly.merge221.us ], [ 0, %polly.loop_header209.us.preheader ]
  %32 = add nsw i64 %polly.indvar213.us, 2
  %33 = icmp sle i64 %32, %n
  %34 = add nsw i64 %polly.indvar213.us, %polly.indvar
  %35 = icmp sgt i64 %34, 0
  %36 = and i1 %33, %35
  br i1 %36, label %polly.cond220.thread.us, label %polly.cond220.us

polly.cond220.us:                                 ; preds = %polly.loop_header209.us
  %37 = icmp eq i64 %polly.indvar213.us, 0
  %38 = add nsw i64 %polly.indvar213.us, 1
  %39 = icmp eq i64 %38, %n
  %40 = or i1 %39, %37
  br i1 %40, label %polly.cond224.us, label %polly.merge221.us

polly.cond220.thread.us:                          ; preds = %polly.loop_header209.us
  %41 = mul i64 %polly.indvar213.us, %16
  %uglygep.us = getelementptr i8, i8* %scevgep217218, i64 %41
  %uglygep219.us = bitcast i8* %uglygep.us to i64*
  %_p_scalar_.us = load i64, i64* %uglygep219.us, align 8, !alias.scope !357, !noalias !359
  %42 = icmp eq i64 %polly.indvar213.us, 0
  %43 = add nsw i64 %polly.indvar213.us, 1
  br label %polly.cond224.us

polly.cond224.us:                                 ; preds = %polly.cond220.thread.us, %polly.cond220.us
  %44 = phi i64 [ %43, %polly.cond220.thread.us ], [ %38, %polly.cond220.us ]
  %45 = phi i1 [ %42, %polly.cond220.thread.us ], [ %37, %polly.cond220.us ]
  %y.0.phiops.0258.us = phi i64 [ %_p_scalar_.us, %polly.cond220.thread.us ], [ 0, %polly.cond220.us ]
  %46 = add nsw i64 %polly.indvar213.us, 3
  %47 = icmp sle i64 %46, %n
  %48 = and i1 %47, %35
  %49 = or i64 %polly.indvar213.us, %polly.indvar
  %50 = icmp eq i64 %49, 0
  %51 = or i1 %48, %50
  br i1 %51, label %polly.stmt.if.end30.us, label %polly.cond234.us

polly.stmt.if.end30.us:                           ; preds = %polly.cond224.us
  %52 = mul i64 %polly.indvar213.us, %16
  %uglygep231.us = getelementptr i8, i8* %scevgep229230, i64 %52
  %uglygep231232.us = bitcast i8* %uglygep231.us to i64*
  %_p_scalar_233.us = load i64, i64* %uglygep231232.us, align 8, !alias.scope !357, !noalias !359
  br label %polly.cond234.us

polly.cond234.us:                                 ; preds = %polly.stmt.if.end30.us, %polly.cond224.us
  %x.0.phiops.0.us = phi i64 [ %_p_scalar_233.us, %polly.stmt.if.end30.us ], [ 0, %polly.cond224.us ]
  %53 = icmp sgt i64 %34, 1
  br i1 %53, label %polly.stmt.if.end39.us, label %polly.cond244.us

polly.stmt.if.end39.us:                           ; preds = %polly.cond234.us
  %54 = mul i64 %polly.indvar213.us, %16
  %uglygep241.us = getelementptr i8, i8* %scevgep239240, i64 %54
  %uglygep241242.us = bitcast i8* %uglygep241.us to i64*
  %_p_scalar_243.us = load i64, i64* %uglygep241242.us, align 8, !alias.scope !357, !noalias !359
  br label %polly.cond244.us

polly.cond244.us:                                 ; preds = %polly.stmt.if.end39.us, %polly.cond234.us
  %z.0.phiops.0.us = phi i64 [ %_p_scalar_243.us, %polly.stmt.if.end39.us ], [ 0, %polly.cond234.us ]
  %55 = and i1 %31, %35
  %56 = or i1 %55, %45
  %57 = or i1 %19, %56
  br i1 %57, label %polly.stmt.blklab10.us, label %polly.merge221.us

polly.stmt.blklab10.us:                           ; preds = %polly.cond244.us
  %p_cmp44.us = icmp sgt i64 %x.0.phiops.0.us, %y.0.phiops.0258.us, !dbg !333
  %p_y.0.x.0.us = select i1 %p_cmp44.us, i64 %y.0.phiops.0258.us, i64 %x.0.phiops.0.us, !dbg !335
  %p_cmp48.us = icmp sgt i64 %z.0.phiops.0.us, %y.0.phiops.0258.us, !dbg !336
  %p_z.1.us = select i1 %p_cmp48.us, i64 %y.0.phiops.0258.us, i64 %z.0.phiops.0.us, !dbg !338
  %scevgep249.us = getelementptr i64, i64* %coins, i64 %polly.indvar213.us
  %_p_scalar_250.us = load i64, i64* %scevgep249.us, align 8, !alias.scope !364, !noalias !365
  %p_add53.us = add nsw i64 %_p_scalar_250.us, %p_y.0.x.0.us, !dbg !340
  %scevgep252.us = getelementptr i64, i64* %scevgep251, i64 %polly.indvar213.us
  %_p_scalar_253.us = load i64, i64* %scevgep252.us, align 8, !alias.scope !364, !noalias !365
  %p_add55.us = add nsw i64 %_p_scalar_253.us, %p_z.1.us, !dbg !342
  %p_cmp56.us = icmp sgt i64 %p_add53.us, %p_add55.us, !dbg !343
  %p_add53.p_add55.us = select i1 %p_cmp56.us, i64 %p_add53.us, i64 %p_add55.us, !dbg !347
  %58 = mul i64 %polly.indvar213.us, %16
  %uglygep256.us = getelementptr i8, i8* %scevgep254255, i64 %58
  %uglygep256257.us = bitcast i8* %uglygep256.us to i64*
  store i64 %p_add53.p_add55.us, i64* %uglygep256257.us, align 8, !alias.scope !357, !noalias !359
  br label %polly.merge221.us

polly.merge221.us:                                ; preds = %polly.stmt.blklab10.us, %polly.cond244.us, %polly.cond220.us
  %59 = phi i64 [ %44, %polly.cond244.us ], [ %38, %polly.cond220.us ], [ %44, %polly.stmt.blklab10.us ]
  %polly.loop_cond216.us = icmp slt i64 %polly.indvar213.us, %polly.adjust_ub215
  br i1 %polly.loop_cond216.us, label %polly.loop_header209.us, label %polly.loop_exit211.loopexit

polly.cond220.thread:                             ; preds = %polly.loop_header209
  %60 = mul i64 %polly.indvar213, %16
  %uglygep = getelementptr i8, i8* %scevgep217218, i64 %60
  %uglygep219 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep219, align 8, !alias.scope !357, !noalias !359
  %61 = icmp eq i64 %polly.indvar213, 0
  %62 = add nsw i64 %polly.indvar213, 1
  br label %polly.cond224

polly.cond224:                                    ; preds = %polly.cond220.thread, %polly.cond220
  %63 = phi i64 [ %62, %polly.cond220.thread ], [ %26, %polly.cond220 ]
  %64 = phi i1 [ %61, %polly.cond220.thread ], [ %25, %polly.cond220 ]
  %y.0.phiops.0258 = phi i64 [ %_p_scalar_, %polly.cond220.thread ], [ 0, %polly.cond220 ]
  %65 = add nsw i64 %polly.indvar213, 3
  %66 = icmp sle i64 %65, %n
  %67 = and i1 %66, %23
  br i1 %67, label %polly.stmt.if.end30, label %polly.cond234

polly.cond234:                                    ; preds = %polly.cond224, %polly.stmt.if.end30
  %x.0.phiops.0 = phi i64 [ %_p_scalar_233, %polly.stmt.if.end30 ], [ 0, %polly.cond224 ]
  %68 = icmp sgt i64 %22, 1
  br i1 %68, label %polly.stmt.if.end39, label %polly.cond244

polly.cond244:                                    ; preds = %polly.cond234, %polly.stmt.if.end39
  %z.0.phiops.0 = phi i64 [ %_p_scalar_243, %polly.stmt.if.end39 ], [ 0, %polly.cond234 ]
  %69 = and i1 %31, %23
  %70 = or i1 %69, %64
  %71 = or i1 %19, %70
  br i1 %71, label %polly.stmt.blklab10, label %polly.merge221

polly.stmt.if.end30:                              ; preds = %polly.cond224
  %72 = mul i64 %polly.indvar213, %16
  %uglygep231 = getelementptr i8, i8* %scevgep229230, i64 %72
  %uglygep231232 = bitcast i8* %uglygep231 to i64*
  %_p_scalar_233 = load i64, i64* %uglygep231232, align 8, !alias.scope !357, !noalias !359
  br label %polly.cond234

polly.stmt.if.end39:                              ; preds = %polly.cond234
  %73 = mul i64 %polly.indvar213, %16
  %uglygep241 = getelementptr i8, i8* %scevgep239240, i64 %73
  %uglygep241242 = bitcast i8* %uglygep241 to i64*
  %_p_scalar_243 = load i64, i64* %uglygep241242, align 8, !alias.scope !357, !noalias !359
  br label %polly.cond244

polly.stmt.blklab10:                              ; preds = %polly.cond244
  %p_cmp44 = icmp sgt i64 %x.0.phiops.0, %y.0.phiops.0258, !dbg !333
  %p_y.0.x.0 = select i1 %p_cmp44, i64 %y.0.phiops.0258, i64 %x.0.phiops.0, !dbg !335
  %p_cmp48 = icmp sgt i64 %z.0.phiops.0, %y.0.phiops.0258, !dbg !336
  %p_z.1 = select i1 %p_cmp48, i64 %y.0.phiops.0258, i64 %z.0.phiops.0, !dbg !338
  %scevgep249 = getelementptr i64, i64* %coins, i64 %polly.indvar213
  %_p_scalar_250 = load i64, i64* %scevgep249, align 8, !alias.scope !364, !noalias !365
  %p_add53 = add nsw i64 %_p_scalar_250, %p_y.0.x.0, !dbg !340
  %scevgep252 = getelementptr i64, i64* %scevgep251, i64 %polly.indvar213
  %_p_scalar_253 = load i64, i64* %scevgep252, align 8, !alias.scope !364, !noalias !365
  %p_add55 = add nsw i64 %_p_scalar_253, %p_z.1, !dbg !342
  %p_cmp56 = icmp sgt i64 %p_add53, %p_add55, !dbg !343
  %p_add53.p_add55 = select i1 %p_cmp56, i64 %p_add53, i64 %p_add55, !dbg !347
  %74 = mul i64 %polly.indvar213, %16
  %uglygep256 = getelementptr i8, i8* %scevgep254255, i64 %74
  %uglygep256257 = bitcast i8* %uglygep256 to i64*
  store i64 %p_add53.p_add55, i64* %uglygep256257, align 8, !alias.scope !357, !noalias !359
  br label %polly.merge221
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #4 !dbg !124 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !132, metadata !170), !dbg !366
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !133, metadata !170), !dbg !367
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !135, metadata !170), !dbg !368
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !136, metadata !170), !dbg !369
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !137, metadata !170), !dbg !369
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !138, metadata !170), !dbg !370
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !139, metadata !170), !dbg !371
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !170), !dbg !371
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !141, metadata !170), !dbg !372
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !142, metadata !170), !dbg !373
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !144, metadata !170), !dbg !374
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !146, metadata !170), !dbg !374
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !147, metadata !170), !dbg !374
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !148, metadata !170), !dbg !375
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !149, metadata !170), !dbg !376
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !150, metadata !170), !dbg !377
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !151, metadata !170), !dbg !377
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !152, metadata !170), !dbg !378
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !153, metadata !170), !dbg !379
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !154, metadata !170), !dbg !379
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !155, metadata !170), !dbg !380
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !156, metadata !170), !dbg !381
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !157, metadata !170), !dbg !381
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !158, metadata !170), !dbg !382
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !159, metadata !170), !dbg !383
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !160, metadata !170), !dbg !384
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !161, metadata !170), !dbg !385
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !163, metadata !170), !dbg !386
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !164, metadata !170), !dbg !386
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !165, metadata !170), !dbg !387
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7, !dbg !388
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !144, metadata !170), !dbg !374
  %sub = add nsw i32 %argc, -1, !dbg !388
  %conv = sext i32 %sub to i64, !dbg !388
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !146, metadata !170), !dbg !374
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !148, metadata !170), !dbg !375
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !149, metadata !170), !dbg !376
  %0 = load i64*, i64** %call, align 8, !dbg !389, !tbaa !390
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !150, metadata !170), !dbg !377
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7, !dbg !392
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !143, metadata !170), !dbg !393
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !134, metadata !170), !dbg !394
  %cmp = icmp eq i64* %call1, null, !dbg !395
  br i1 %cmp, label %if.end93.critedge, label %if.end, !dbg !397

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !398, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !135, metadata !170), !dbg !368
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !12, metadata !170) #7, !dbg !399
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !13, metadata !170) #7, !dbg !401
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !170) #7, !dbg !401
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !15, metadata !170) #7, !dbg !402
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !17, metadata !170) #7, !dbg !403
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !18, metadata !170) #7, !dbg !403
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !19, metadata !170) #7, !dbg !404
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !20, metadata !170) #7, !dbg !405
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !21, metadata !170) #7, !dbg !406
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !22, metadata !170) #7, !dbg !407
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !23, metadata !170) #7, !dbg !407
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !24, metadata !170) #7, !dbg !408
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !170) #7, !dbg !409
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !26, metadata !170) #7, !dbg !410
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !170) #7, !dbg !411
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !28, metadata !170) #7, !dbg !412
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !170) #7, !dbg !413
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !21, metadata !170) #7, !dbg !406
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !23, metadata !170) #7, !dbg !407
  %conv1.i = trunc i64 %1 to i32, !dbg !414
  %call.i = tail call i64* @gen1DArray(i32 0, i32 %conv1.i) #7, !dbg !414
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !22, metadata !170) #7, !dbg !407
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !24, metadata !170) #7, !dbg !408
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !18, metadata !170) #7, !dbg !403
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !17, metadata !170) #7, !dbg !403
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !19, metadata !170) #7, !dbg !404
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !24, metadata !170) #7, !dbg !408
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !170) #7, !dbg !409
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !20, metadata !170) #7, !dbg !405
  %cmp41.i = icmp sgt i64 %1, 0, !dbg !415
  br i1 %cmp41.i, label %if.end7.i.preheader, label %if.then74, !dbg !416

if.end7.i.preheader:                              ; preds = %if.end
  %2 = add i64 %1, -1, !dbg !417
  %xtraiter = and i64 %1, 3, !dbg !417
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !417
  br i1 %lcmp.mod, label %if.end7.i.preheader.split, label %if.end7.i.prol.preheader, !dbg !417

if.end7.i.prol.preheader:                         ; preds = %if.end7.i.preheader
  br label %if.end7.i.prol, !dbg !417

if.end7.i.prol:                                   ; preds = %if.end7.i.prol.preheader, %if.end7.i.prol
  %i.042.i.prol = phi i64 [ %add9.i.prol, %if.end7.i.prol ], [ 0, %if.end7.i.prol.preheader ], !dbg !418
  %prol.iter = phi i64 [ %prol.iter.sub, %if.end7.i.prol ], [ %xtraiter, %if.end7.i.prol.preheader ]
  %arrayidx.i.prol = getelementptr inbounds i64, i64* %call.i, i64 %i.042.i.prol, !dbg !417
  %3 = load i64, i64* %arrayidx.i.prol, align 8, !dbg !417, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !26, metadata !170) #7, !dbg !410
  %add.i.prol = add nsw i64 %3, %i.042.i.prol, !dbg !419
  tail call void @llvm.dbg.value(metadata i64 %add.i.prol, i64 0, metadata !27, metadata !170) #7, !dbg !411
  store i64 %add.i.prol, i64* %arrayidx.i.prol, align 8, !dbg !420, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !170) #7, !dbg !412
  %add9.i.prol = add nuw nsw i64 %i.042.i.prol, 1, !dbg !421
  tail call void @llvm.dbg.value(metadata i64 %add9.i.prol, i64 0, metadata !29, metadata !170) #7, !dbg !413
  tail call void @llvm.dbg.value(metadata i64 %add9.i.prol, i64 0, metadata !20, metadata !170) #7, !dbg !405
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !416
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !416
  br i1 %prol.iter.cmp, label %if.end7.i.preheader.split.loopexit, label %if.end7.i.prol, !dbg !416, !llvm.loop !422

if.end7.i.preheader.split.loopexit:               ; preds = %if.end7.i.prol
  %add9.i.prol.lcssa = phi i64 [ %add9.i.prol, %if.end7.i.prol ]
  br label %if.end7.i.preheader.split, !dbg !417

if.end7.i.preheader.split:                        ; preds = %if.end7.i.preheader.split.loopexit, %if.end7.i.preheader
  %i.042.i.unr = phi i64 [ 0, %if.end7.i.preheader ], [ %add9.i.prol.lcssa, %if.end7.i.preheader.split.loopexit ]
  %4 = icmp ult i64 %2, 3, !dbg !417
  br i1 %4, label %if.then74.loopexit, label %if.end7.i.preheader.split.split, !dbg !417

if.end7.i.preheader.split.split:                  ; preds = %if.end7.i.preheader.split
  br label %if.end7.i, !dbg !417

if.end7.i:                                        ; preds = %if.end7.i, %if.end7.i.preheader.split.split
  %i.042.i = phi i64 [ %i.042.i.unr, %if.end7.i.preheader.split.split ], [ %add9.i.3, %if.end7.i ], !dbg !418
  %arrayidx.i = getelementptr inbounds i64, i64* %call.i, i64 %i.042.i, !dbg !417
  %5 = load i64, i64* %arrayidx.i, align 8, !dbg !417, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !26, metadata !170) #7, !dbg !410
  %add.i = add nsw i64 %5, %i.042.i, !dbg !419
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !27, metadata !170) #7, !dbg !411
  store i64 %add.i, i64* %arrayidx.i, align 8, !dbg !420, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !170) #7, !dbg !412
  %add9.i = add nuw nsw i64 %i.042.i, 1, !dbg !421
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !29, metadata !170) #7, !dbg !413
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !20, metadata !170) #7, !dbg !405
  %arrayidx.i.1 = getelementptr inbounds i64, i64* %call.i, i64 %add9.i, !dbg !417
  %6 = load i64, i64* %arrayidx.i.1, align 8, !dbg !417, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !26, metadata !170) #7, !dbg !410
  %add.i.1 = add nsw i64 %6, %add9.i, !dbg !419
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !27, metadata !170) #7, !dbg !411
  store i64 %add.i.1, i64* %arrayidx.i.1, align 8, !dbg !420, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !170) #7, !dbg !412
  %add9.i.1 = add nsw i64 %i.042.i, 2, !dbg !421
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !29, metadata !170) #7, !dbg !413
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !20, metadata !170) #7, !dbg !405
  %arrayidx.i.2 = getelementptr inbounds i64, i64* %call.i, i64 %add9.i.1, !dbg !417
  %7 = load i64, i64* %arrayidx.i.2, align 8, !dbg !417, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !26, metadata !170) #7, !dbg !410
  %add.i.2 = add nsw i64 %7, %add9.i.1, !dbg !419
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !27, metadata !170) #7, !dbg !411
  store i64 %add.i.2, i64* %arrayidx.i.2, align 8, !dbg !420, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !170) #7, !dbg !412
  %add9.i.2 = add nsw i64 %i.042.i, 3, !dbg !421
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !29, metadata !170) #7, !dbg !413
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !20, metadata !170) #7, !dbg !405
  %arrayidx.i.3 = getelementptr inbounds i64, i64* %call.i, i64 %add9.i.2, !dbg !417
  %8 = load i64, i64* %arrayidx.i.3, align 8, !dbg !417, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %5, i64 0, metadata !26, metadata !170) #7, !dbg !410
  %add.i.3 = add nsw i64 %8, %add9.i.2, !dbg !419
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !27, metadata !170) #7, !dbg !411
  store i64 %add.i.3, i64* %arrayidx.i.3, align 8, !dbg !420, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !170) #7, !dbg !412
  %add9.i.3 = add nsw i64 %i.042.i, 4, !dbg !421
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !29, metadata !170) #7, !dbg !413
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !20, metadata !170) #7, !dbg !405
  %exitcond.i.3 = icmp eq i64 %add9.i.3, %1, !dbg !416
  br i1 %exitcond.i.3, label %if.then74.loopexit.unr-lcssa, label %if.end7.i, !dbg !416

if.then74.loopexit.unr-lcssa:                     ; preds = %if.end7.i
  br label %if.then74.loopexit, !dbg !379

if.then74.loopexit:                               ; preds = %if.end7.i.preheader.split, %if.then74.loopexit.unr-lcssa
  br label %if.then74, !dbg !379

if.then74:                                        ; preds = %if.then74.loopexit, %if.end
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !153, metadata !170), !dbg !379
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !155, metadata !170), !dbg !380
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !137, metadata !170), !dbg !369
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !136, metadata !170), !dbg !369
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !138, metadata !170), !dbg !370
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !155, metadata !170), !dbg !380
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !138, metadata !170), !dbg !370
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !157, metadata !170), !dbg !381
  %call12 = tail call i64* @findMoves(i64* %call.i, i64 undef, i1 zeroext false, i64 %1), !dbg !423
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !156, metadata !170), !dbg !381
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !158, metadata !170), !dbg !382
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !170), !dbg !371
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !139, metadata !170), !dbg !371
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !141, metadata !170), !dbg !372
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !158, metadata !170), !dbg !382
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !159, metadata !170), !dbg !383
  %sub16 = add nsw i64 %1, -1, !dbg !424
  tail call void @llvm.dbg.value(metadata i64 %sub16, i64 0, metadata !160, metadata !170), !dbg !384
  %arrayidx17 = getelementptr inbounds i64, i64* %call12, i64 %sub16, !dbg !425
  %9 = load i64, i64* %arrayidx17, align 8, !dbg !425, !tbaa !191
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !161, metadata !170), !dbg !385
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !142, metadata !170), !dbg !373
  tail call void @llvm.dbg.value(metadata i64 50, i64 0, metadata !164, metadata !170), !dbg !386
  %call21 = tail call noalias i8* @malloc(i64 400) #7, !dbg !426
  %10 = bitcast i8* %call21 to i64*, !dbg !426
  tail call void @llvm.dbg.value(metadata i64* %10, i64 0, metadata !163, metadata !170), !dbg !386
  %11 = bitcast i8* %call21 to <2 x i64>*, !dbg !427
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %11, align 8, !dbg !427, !tbaa !191
  %arrayidx24 = getelementptr inbounds i8, i8* %call21, i64 16, !dbg !428
  %12 = bitcast i8* %arrayidx24 to <2 x i64>*, !dbg !429
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %12, align 8, !dbg !429, !tbaa !191
  %arrayidx26 = getelementptr inbounds i8, i8* %call21, i64 32, !dbg !430
  %13 = bitcast i8* %arrayidx26 to <2 x i64>*, !dbg !431
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %13, align 8, !dbg !431, !tbaa !191
  %arrayidx28 = getelementptr inbounds i8, i8* %call21, i64 48, !dbg !432
  %14 = bitcast i8* %arrayidx28 to <2 x i64>*, !dbg !433
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %14, align 8, !dbg !433, !tbaa !191
  %arrayidx30 = getelementptr inbounds i8, i8* %call21, i64 64, !dbg !434
  %15 = bitcast i8* %arrayidx30 to <2 x i64>*, !dbg !435
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %15, align 8, !dbg !435, !tbaa !191
  %arrayidx32 = getelementptr inbounds i8, i8* %call21, i64 80, !dbg !436
  %16 = bitcast i8* %arrayidx32 to <2 x i64>*, !dbg !437
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %16, align 8, !dbg !437, !tbaa !191
  %arrayidx34 = getelementptr inbounds i8, i8* %call21, i64 96, !dbg !438
  %17 = bitcast i8* %arrayidx34 to <2 x i64>*, !dbg !439
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %17, align 8, !dbg !439, !tbaa !191
  %arrayidx36 = getelementptr inbounds i8, i8* %call21, i64 112, !dbg !440
  %18 = bitcast i8* %arrayidx36 to <2 x i64>*, !dbg !441
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %18, align 8, !dbg !441, !tbaa !191
  %arrayidx38 = getelementptr inbounds i8, i8* %call21, i64 128, !dbg !442
  %19 = bitcast i8* %arrayidx38 to <2 x i64>*, !dbg !443
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %19, align 8, !dbg !443, !tbaa !191
  %arrayidx40 = getelementptr inbounds i8, i8* %call21, i64 144, !dbg !444
  %20 = bitcast i8* %arrayidx40 to <2 x i64>*, !dbg !445
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %20, align 8, !dbg !445, !tbaa !191
  %arrayidx42 = getelementptr inbounds i8, i8* %call21, i64 160, !dbg !446
  %21 = bitcast i8* %arrayidx42 to <2 x i64>*, !dbg !447
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %21, align 8, !dbg !447, !tbaa !191
  %arrayidx44 = getelementptr inbounds i8, i8* %call21, i64 176, !dbg !448
  %22 = bitcast i8* %arrayidx44 to <2 x i64>*, !dbg !449
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %22, align 8, !dbg !449, !tbaa !191
  %arrayidx46 = getelementptr inbounds i8, i8* %call21, i64 192, !dbg !450
  %23 = bitcast i8* %arrayidx46 to <2 x i64>*, !dbg !451
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %23, align 8, !dbg !451, !tbaa !191
  %arrayidx48 = getelementptr inbounds i8, i8* %call21, i64 208, !dbg !452
  %24 = bitcast i8* %arrayidx48 to <2 x i64>*, !dbg !453
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %24, align 8, !dbg !453, !tbaa !191
  %arrayidx50 = getelementptr inbounds i8, i8* %call21, i64 224, !dbg !454
  %25 = bitcast i8* %arrayidx50 to <2 x i64>*, !dbg !455
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %25, align 8, !dbg !455, !tbaa !191
  %arrayidx52 = getelementptr inbounds i8, i8* %call21, i64 240, !dbg !456
  %26 = bitcast i8* %arrayidx52 to <2 x i64>*, !dbg !457
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %26, align 8, !dbg !457, !tbaa !191
  %arrayidx54 = getelementptr inbounds i8, i8* %call21, i64 256, !dbg !458
  %27 = bitcast i8* %arrayidx54 to <2 x i64>*, !dbg !459
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %27, align 8, !dbg !459, !tbaa !191
  %arrayidx56 = getelementptr inbounds i8, i8* %call21, i64 272, !dbg !460
  %28 = bitcast i8* %arrayidx56 to <2 x i64>*, !dbg !461
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %28, align 8, !dbg !461, !tbaa !191
  %arrayidx58 = getelementptr inbounds i8, i8* %call21, i64 288, !dbg !462
  %29 = bitcast i8* %arrayidx58 to <2 x i64>*, !dbg !463
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %29, align 8, !dbg !463, !tbaa !191
  %arrayidx60 = getelementptr inbounds i8, i8* %call21, i64 304, !dbg !464
  %30 = bitcast i8* %arrayidx60 to <2 x i64>*, !dbg !465
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %30, align 8, !dbg !465, !tbaa !191
  %arrayidx62 = getelementptr inbounds i8, i8* %call21, i64 320, !dbg !466
  %31 = bitcast i8* %arrayidx62 to <2 x i64>*, !dbg !467
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %31, align 8, !dbg !467, !tbaa !191
  %arrayidx64 = getelementptr inbounds i8, i8* %call21, i64 336, !dbg !468
  %32 = bitcast i8* %arrayidx64 to <2 x i64>*, !dbg !469
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %32, align 8, !dbg !469, !tbaa !191
  %arrayidx66 = getelementptr inbounds i8, i8* %call21, i64 352, !dbg !470
  %33 = bitcast i8* %arrayidx66 to <2 x i64>*, !dbg !471
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %33, align 8, !dbg !471, !tbaa !191
  %arrayidx68 = getelementptr inbounds i8, i8* %call21, i64 368, !dbg !472
  %34 = bitcast i8* %arrayidx68 to <2 x i64>*, !dbg !473
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %34, align 8, !dbg !473, !tbaa !191
  %arrayidx70 = getelementptr inbounds i8, i8* %call21, i64 384, !dbg !474
  %35 = bitcast i8* %arrayidx70 to <2 x i64>*, !dbg !475
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %35, align 8, !dbg !475, !tbaa !191
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !165, metadata !170), !dbg !387
  tail call void @printf_s(i64* %10, i64 50) #7, !dbg !476
  %call72 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i64 %9), !dbg !477
  %phitmp = bitcast i64* %call12 to i8*, !dbg !477
  %phitmp166 = bitcast i64* %call.i to i8*, !dbg !477
  tail call void @free(i8* %phitmp166) #7, !dbg !478
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !138, metadata !170), !dbg !370
  tail call void @free(i8* %phitmp) #7, !dbg !482
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !141, metadata !170), !dbg !372
  tail call void @free2DArray(i64** %call, i64 %conv) #7, !dbg !486
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !148, metadata !170), !dbg !375
  tail call void @free(i8* %call21) #7, !dbg !490
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !165, metadata !170), !dbg !387
  br label %if.end93, !dbg !490

if.end93.critedge:                                ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #7, !dbg !486
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !148, metadata !170), !dbg !375
  br label %if.end93

if.end93:                                         ; preds = %if.end93.critedge, %if.then74
  tail call void @exit(i32 0) #8, !dbg !494
  unreachable, !dbg !494
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare void @printf_s(i64*, i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

declare void @free2DArray(i64**, i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!167, !168}
!llvm.ident = !{!169}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !30, !49, !124}
!6 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 2, type: !7, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, variables: !11)
!7 = !DISubroutineType(types: !8)
!8 = !{!9, !10}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!10 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!11 = !{!12, !13, !14, !15, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29}
!12 = !DILocalVariable(name: "n", arg: 1, scope: !6, file: !1, line: 2, type: !10)
!13 = !DILocalVariable(name: "_1", scope: !6, file: !1, line: 3, type: !9)
!14 = !DILocalVariable(name: "_1_size", scope: !6, file: !1, line: 3, type: !10)
!15 = !DILocalVariable(name: "_1_has_ownership", scope: !6, file: !1, line: 4, type: !16)
!16 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!17 = !DILocalVariable(name: "coins", scope: !6, file: !1, line: 5, type: !9)
!18 = !DILocalVariable(name: "coins_size", scope: !6, file: !1, line: 5, type: !10)
!19 = !DILocalVariable(name: "coins_has_ownership", scope: !6, file: !1, line: 6, type: !16)
!20 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 7, type: !10)
!21 = !DILocalVariable(name: "_4", scope: !6, file: !1, line: 8, type: !10)
!22 = !DILocalVariable(name: "_5", scope: !6, file: !1, line: 9, type: !9)
!23 = !DILocalVariable(name: "_5_size", scope: !6, file: !1, line: 9, type: !10)
!24 = !DILocalVariable(name: "_5_has_ownership", scope: !6, file: !1, line: 10, type: !16)
!25 = !DILocalVariable(name: "_6", scope: !6, file: !1, line: 11, type: !10)
!26 = !DILocalVariable(name: "_7", scope: !6, file: !1, line: 12, type: !10)
!27 = !DILocalVariable(name: "_8", scope: !6, file: !1, line: 13, type: !10)
!28 = !DILocalVariable(name: "_9", scope: !6, file: !1, line: 14, type: !10)
!29 = !DILocalVariable(name: "_10", scope: !6, file: !1, line: 15, type: !10)
!30 = distinct !DISubprogram(name: "getBobSum", scope: !1, file: !1, line: 59, type: !31, isLocal: false, isDefinition: true, scopeLine: 59, flags: DIFlagPrototyped, isOptimized: true, variables: !33)
!31 = !DISubroutineType(types: !32)
!32 = !{!10, !10, !9, !10, !16, !10}
!33 = !{!34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48}
!34 = !DILocalVariable(name: "sum_alice", arg: 1, scope: !30, file: !1, line: 59, type: !10)
!35 = !DILocalVariable(name: "coins", arg: 2, scope: !30, file: !1, line: 59, type: !9)
!36 = !DILocalVariable(name: "coins_size", arg: 3, scope: !30, file: !1, line: 59, type: !10)
!37 = !DILocalVariable(name: "coins_has_ownership", arg: 4, scope: !30, file: !1, line: 59, type: !16)
!38 = !DILocalVariable(name: "n", arg: 5, scope: !30, file: !1, line: 59, type: !10)
!39 = !DILocalVariable(name: "_3", scope: !30, file: !1, line: 60, type: !10)
!40 = !DILocalVariable(name: "i", scope: !30, file: !1, line: 61, type: !10)
!41 = !DILocalVariable(name: "sum", scope: !30, file: !1, line: 62, type: !10)
!42 = !DILocalVariable(name: "_6", scope: !30, file: !1, line: 63, type: !10)
!43 = !DILocalVariable(name: "_7", scope: !30, file: !1, line: 64, type: !10)
!44 = !DILocalVariable(name: "_8", scope: !30, file: !1, line: 65, type: !10)
!45 = !DILocalVariable(name: "_9", scope: !30, file: !1, line: 66, type: !10)
!46 = !DILocalVariable(name: "_10", scope: !30, file: !1, line: 67, type: !10)
!47 = !DILocalVariable(name: "_11", scope: !30, file: !1, line: 68, type: !10)
!48 = !DILocalVariable(name: "_12", scope: !30, file: !1, line: 69, type: !10)
!49 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 107, type: !50, isLocal: false, isDefinition: true, scopeLine: 107, flags: DIFlagPrototyped, isOptimized: true, variables: !52)
!50 = !DISubroutineType(types: !51)
!51 = !{!9, !9, !10, !16, !10}
!52 = !{!53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123}
!53 = !DILocalVariable(name: "coins", arg: 1, scope: !49, file: !1, line: 107, type: !9)
!54 = !DILocalVariable(name: "coins_size", arg: 2, scope: !49, file: !1, line: 107, type: !10)
!55 = !DILocalVariable(name: "coins_has_ownership", arg: 3, scope: !49, file: !1, line: 107, type: !16)
!56 = !DILocalVariable(name: "n", arg: 4, scope: !49, file: !1, line: 107, type: !10)
!57 = !DILocalVariable(name: "_2", scope: !49, file: !1, line: 108, type: !9)
!58 = !DILocalVariable(name: "_2_size", scope: !49, file: !1, line: 108, type: !10)
!59 = !DILocalVariable(name: "_2_has_ownership", scope: !49, file: !1, line: 109, type: !16)
!60 = !DILocalVariable(name: "moves", scope: !49, file: !1, line: 110, type: !9)
!61 = !DILocalVariable(name: "moves_size", scope: !49, file: !1, line: 110, type: !10)
!62 = !DILocalVariable(name: "moves_has_ownership", scope: !49, file: !1, line: 111, type: !16)
!63 = !DILocalVariable(name: "s", scope: !49, file: !1, line: 112, type: !10)
!64 = !DILocalVariable(name: "j", scope: !49, file: !1, line: 113, type: !10)
!65 = !DILocalVariable(name: "i", scope: !49, file: !1, line: 114, type: !10)
!66 = !DILocalVariable(name: "y", scope: !49, file: !1, line: 115, type: !10)
!67 = !DILocalVariable(name: "x", scope: !49, file: !1, line: 116, type: !10)
!68 = !DILocalVariable(name: "z", scope: !49, file: !1, line: 117, type: !10)
!69 = !DILocalVariable(name: "_10", scope: !49, file: !1, line: 118, type: !10)
!70 = !DILocalVariable(name: "_11", scope: !49, file: !1, line: 119, type: !10)
!71 = !DILocalVariable(name: "_12", scope: !49, file: !1, line: 120, type: !9)
!72 = !DILocalVariable(name: "_12_size", scope: !49, file: !1, line: 120, type: !10)
!73 = !DILocalVariable(name: "_12_has_ownership", scope: !49, file: !1, line: 121, type: !16)
!74 = !DILocalVariable(name: "_13", scope: !49, file: !1, line: 122, type: !10)
!75 = !DILocalVariable(name: "_14", scope: !49, file: !1, line: 123, type: !10)
!76 = !DILocalVariable(name: "_15", scope: !49, file: !1, line: 124, type: !10)
!77 = !DILocalVariable(name: "_16", scope: !49, file: !1, line: 125, type: !10)
!78 = !DILocalVariable(name: "_17", scope: !49, file: !1, line: 126, type: !10)
!79 = !DILocalVariable(name: "_18", scope: !49, file: !1, line: 127, type: !10)
!80 = !DILocalVariable(name: "_19", scope: !49, file: !1, line: 128, type: !10)
!81 = !DILocalVariable(name: "_20", scope: !49, file: !1, line: 129, type: !10)
!82 = !DILocalVariable(name: "_21", scope: !49, file: !1, line: 130, type: !10)
!83 = !DILocalVariable(name: "_22", scope: !49, file: !1, line: 131, type: !10)
!84 = !DILocalVariable(name: "_23", scope: !49, file: !1, line: 132, type: !10)
!85 = !DILocalVariable(name: "_24", scope: !49, file: !1, line: 133, type: !10)
!86 = !DILocalVariable(name: "_25", scope: !49, file: !1, line: 134, type: !10)
!87 = !DILocalVariable(name: "_26", scope: !49, file: !1, line: 135, type: !10)
!88 = !DILocalVariable(name: "_27", scope: !49, file: !1, line: 136, type: !10)
!89 = !DILocalVariable(name: "_28", scope: !49, file: !1, line: 137, type: !10)
!90 = !DILocalVariable(name: "_29", scope: !49, file: !1, line: 138, type: !10)
!91 = !DILocalVariable(name: "_30", scope: !49, file: !1, line: 139, type: !10)
!92 = !DILocalVariable(name: "_31", scope: !49, file: !1, line: 140, type: !10)
!93 = !DILocalVariable(name: "_32", scope: !49, file: !1, line: 141, type: !10)
!94 = !DILocalVariable(name: "_33", scope: !49, file: !1, line: 142, type: !10)
!95 = !DILocalVariable(name: "_34", scope: !49, file: !1, line: 143, type: !10)
!96 = !DILocalVariable(name: "_35", scope: !49, file: !1, line: 144, type: !10)
!97 = !DILocalVariable(name: "_36", scope: !49, file: !1, line: 145, type: !10)
!98 = !DILocalVariable(name: "_37", scope: !49, file: !1, line: 146, type: !10)
!99 = !DILocalVariable(name: "_38", scope: !49, file: !1, line: 147, type: !10)
!100 = !DILocalVariable(name: "_39", scope: !49, file: !1, line: 148, type: !10)
!101 = !DILocalVariable(name: "_40", scope: !49, file: !1, line: 149, type: !10)
!102 = !DILocalVariable(name: "_41", scope: !49, file: !1, line: 150, type: !10)
!103 = !DILocalVariable(name: "_42", scope: !49, file: !1, line: 151, type: !10)
!104 = !DILocalVariable(name: "_43", scope: !49, file: !1, line: 152, type: !10)
!105 = !DILocalVariable(name: "_44", scope: !49, file: !1, line: 153, type: !10)
!106 = !DILocalVariable(name: "_45", scope: !49, file: !1, line: 154, type: !10)
!107 = !DILocalVariable(name: "_46", scope: !49, file: !1, line: 155, type: !10)
!108 = !DILocalVariable(name: "_47", scope: !49, file: !1, line: 156, type: !10)
!109 = !DILocalVariable(name: "_48", scope: !49, file: !1, line: 157, type: !10)
!110 = !DILocalVariable(name: "_49", scope: !49, file: !1, line: 158, type: !10)
!111 = !DILocalVariable(name: "_50", scope: !49, file: !1, line: 159, type: !10)
!112 = !DILocalVariable(name: "_51", scope: !49, file: !1, line: 160, type: !10)
!113 = !DILocalVariable(name: "_52", scope: !49, file: !1, line: 161, type: !10)
!114 = !DILocalVariable(name: "_53", scope: !49, file: !1, line: 162, type: !10)
!115 = !DILocalVariable(name: "_54", scope: !49, file: !1, line: 163, type: !10)
!116 = !DILocalVariable(name: "_55", scope: !49, file: !1, line: 164, type: !10)
!117 = !DILocalVariable(name: "_56", scope: !49, file: !1, line: 165, type: !10)
!118 = !DILocalVariable(name: "_57", scope: !49, file: !1, line: 166, type: !10)
!119 = !DILocalVariable(name: "_58", scope: !49, file: !1, line: 167, type: !10)
!120 = !DILocalVariable(name: "_59", scope: !49, file: !1, line: 168, type: !10)
!121 = !DILocalVariable(name: "_60", scope: !49, file: !1, line: 169, type: !10)
!122 = !DILocalVariable(name: "_61", scope: !49, file: !1, line: 170, type: !10)
!123 = !DILocalVariable(name: "_62", scope: !49, file: !1, line: 171, type: !10)
!124 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 373, type: !125, isLocal: false, isDefinition: true, scopeLine: 373, flags: DIFlagPrototyped, isOptimized: true, variables: !131)
!125 = !DISubroutineType(types: !126)
!126 = !{!127, !127, !128}
!127 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64, align: 64)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64, align: 64)
!130 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!131 = !{!132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166}
!132 = !DILocalVariable(name: "argc", arg: 1, scope: !124, file: !1, line: 373, type: !127)
!133 = !DILocalVariable(name: "args", arg: 2, scope: !124, file: !1, line: 373, type: !128)
!134 = !DILocalVariable(name: "max", scope: !124, file: !1, line: 374, type: !9)
!135 = !DILocalVariable(name: "n", scope: !124, file: !1, line: 375, type: !10)
!136 = !DILocalVariable(name: "coins", scope: !124, file: !1, line: 376, type: !9)
!137 = !DILocalVariable(name: "coins_size", scope: !124, file: !1, line: 376, type: !10)
!138 = !DILocalVariable(name: "coins_has_ownership", scope: !124, file: !1, line: 377, type: !16)
!139 = !DILocalVariable(name: "moves", scope: !124, file: !1, line: 378, type: !9)
!140 = !DILocalVariable(name: "moves_size", scope: !124, file: !1, line: 378, type: !10)
!141 = !DILocalVariable(name: "moves_has_ownership", scope: !124, file: !1, line: 379, type: !16)
!142 = !DILocalVariable(name: "sum_alice", scope: !124, file: !1, line: 380, type: !10)
!143 = !DILocalVariable(name: "_6", scope: !124, file: !1, line: 381, type: !9)
!144 = !DILocalVariable(name: "_7", scope: !124, file: !1, line: 382, type: !145)
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!146 = !DILocalVariable(name: "_7_size", scope: !124, file: !1, line: 382, type: !10)
!147 = !DILocalVariable(name: "_7_size_size", scope: !124, file: !1, line: 382, type: !10)
!148 = !DILocalVariable(name: "_7_has_ownership", scope: !124, file: !1, line: 383, type: !16)
!149 = !DILocalVariable(name: "_8", scope: !124, file: !1, line: 384, type: !10)
!150 = !DILocalVariable(name: "_9", scope: !124, file: !1, line: 385, type: !9)
!151 = !DILocalVariable(name: "_9_size", scope: !124, file: !1, line: 385, type: !10)
!152 = !DILocalVariable(name: "_9_has_ownership", scope: !124, file: !1, line: 386, type: !16)
!153 = !DILocalVariable(name: "_10", scope: !124, file: !1, line: 387, type: !9)
!154 = !DILocalVariable(name: "_10_size", scope: !124, file: !1, line: 387, type: !10)
!155 = !DILocalVariable(name: "_10_has_ownership", scope: !124, file: !1, line: 388, type: !16)
!156 = !DILocalVariable(name: "_11", scope: !124, file: !1, line: 389, type: !9)
!157 = !DILocalVariable(name: "_11_size", scope: !124, file: !1, line: 389, type: !10)
!158 = !DILocalVariable(name: "_11_has_ownership", scope: !124, file: !1, line: 390, type: !16)
!159 = !DILocalVariable(name: "_12", scope: !124, file: !1, line: 391, type: !10)
!160 = !DILocalVariable(name: "_13", scope: !124, file: !1, line: 392, type: !10)
!161 = !DILocalVariable(name: "_14", scope: !124, file: !1, line: 393, type: !10)
!162 = !DILocalVariable(name: "_15", scope: !124, file: !1, line: 394, type: !4)
!163 = !DILocalVariable(name: "_17", scope: !124, file: !1, line: 395, type: !9)
!164 = !DILocalVariable(name: "_17_size", scope: !124, file: !1, line: 395, type: !10)
!165 = !DILocalVariable(name: "_17_has_ownership", scope: !124, file: !1, line: 396, type: !16)
!166 = !DILocalVariable(name: "_18", scope: !124, file: !1, line: 397, type: !4)
!167 = !{i32 2, !"Dwarf Version", i32 4}
!168 = !{i32 2, !"Debug Info Version", i32 3}
!169 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!170 = !DIExpression()
!171 = !DILocation(line: 2, column: 27, scope: !6)
!172 = !DILocation(line: 3, column: 2, scope: !6)
!173 = !DILocation(line: 4, column: 2, scope: !6)
!174 = !DILocation(line: 5, column: 2, scope: !6)
!175 = !DILocation(line: 6, column: 2, scope: !6)
!176 = !DILocation(line: 7, column: 12, scope: !6)
!177 = !DILocation(line: 8, column: 12, scope: !6)
!178 = !DILocation(line: 9, column: 2, scope: !6)
!179 = !DILocation(line: 10, column: 2, scope: !6)
!180 = !DILocation(line: 11, column: 12, scope: !6)
!181 = !DILocation(line: 12, column: 12, scope: !6)
!182 = !DILocation(line: 13, column: 12, scope: !6)
!183 = !DILocation(line: 14, column: 12, scope: !6)
!184 = !DILocation(line: 15, column: 12, scope: !6)
!185 = !DILocation(line: 20, column: 2, scope: !6)
!186 = !DILocation(line: 34, column: 7, scope: !187)
!187 = distinct !DILexicalBlock(scope: !188, file: !1, line: 34, column: 6)
!188 = distinct !DILexicalBlock(scope: !6, file: !1, line: 32, column: 13)
!189 = !DILocation(line: 34, column: 6, scope: !188)
!190 = !DILocation(line: 36, column: 6, scope: !188)
!191 = !{!192, !192, i64 0}
!192 = !{!"long long", !193, i64 0}
!193 = !{!"omnipotent char", !194, i64 0}
!194 = !{!"Simple C/C++ TBAA"}
!195 = !DILocation(line: 38, column: 8, scope: !188)
!196 = !DILocation(line: 40, column: 12, scope: !188)
!197 = !DILocation(line: 44, column: 8, scope: !188)
!198 = distinct !{!198, !199}
!199 = !{!"llvm.loop.unroll.disable"}
!200 = !DILocation(line: 55, column: 2, scope: !6)
!201 = !DILocation(line: 59, column: 31, scope: !30)
!202 = !DILocation(line: 59, column: 42, scope: !30)
!203 = !DIExpression(DW_OP_bit_piece, 0, 1)
!204 = !DILocation(line: 59, column: 70, scope: !30)
!205 = !DILocation(line: 59, column: 110, scope: !30)
!206 = !DILocation(line: 60, column: 12, scope: !30)
!207 = !DILocation(line: 61, column: 12, scope: !30)
!208 = !DILocation(line: 62, column: 12, scope: !30)
!209 = !DILocation(line: 63, column: 12, scope: !30)
!210 = !DILocation(line: 64, column: 12, scope: !30)
!211 = !DILocation(line: 65, column: 12, scope: !30)
!212 = !DILocation(line: 66, column: 12, scope: !30)
!213 = !DILocation(line: 67, column: 12, scope: !30)
!214 = !DILocation(line: 68, column: 12, scope: !30)
!215 = !DILocation(line: 69, column: 12, scope: !30)
!216 = !DILocation(line: 81, column: 7, scope: !217)
!217 = distinct !DILexicalBlock(scope: !218, file: !1, line: 81, column: 6)
!218 = distinct !DILexicalBlock(scope: !30, file: !1, line: 79, column: 13)
!219 = !DILocation(line: 81, column: 6, scope: !218)
!220 = !DILocation(line: 83, column: 6, scope: !218)
!221 = !DILocation(line: 85, column: 9, scope: !218)
!222 = !DILocation(line: 91, column: 8, scope: !218)
!223 = distinct !{!223, !199}
!224 = !DILocation(line: 100, column: 9, scope: !30)
!225 = !DILocation(line: 102, column: 2, scope: !30)
!226 = !DILocation(line: 102, column: 2, scope: !227)
!227 = !DILexicalBlockFile(scope: !228, file: !1, discriminator: 1)
!228 = distinct !DILexicalBlock(scope: !229, file: !1, line: 102, column: 2)
!229 = distinct !DILexicalBlock(scope: !30, file: !1, line: 102, column: 2)
!230 = !DILocation(line: 103, column: 2, scope: !30)
!231 = !DILocation(line: 107, column: 22, scope: !49)
!232 = !DILocation(line: 107, column: 50, scope: !49)
!233 = !DILocation(line: 107, column: 90, scope: !49)
!234 = !DILocation(line: 108, column: 2, scope: !49)
!235 = !DILocation(line: 109, column: 2, scope: !49)
!236 = !DILocation(line: 110, column: 2, scope: !49)
!237 = !DILocation(line: 111, column: 2, scope: !49)
!238 = !DILocation(line: 112, column: 12, scope: !49)
!239 = !DILocation(line: 113, column: 12, scope: !49)
!240 = !DILocation(line: 114, column: 12, scope: !49)
!241 = !DILocation(line: 115, column: 12, scope: !49)
!242 = !DILocation(line: 116, column: 12, scope: !49)
!243 = !DILocation(line: 117, column: 12, scope: !49)
!244 = !DILocation(line: 118, column: 12, scope: !49)
!245 = !DILocation(line: 119, column: 12, scope: !49)
!246 = !DILocation(line: 120, column: 2, scope: !49)
!247 = !DILocation(line: 121, column: 2, scope: !49)
!248 = !DILocation(line: 122, column: 12, scope: !49)
!249 = !DILocation(line: 123, column: 12, scope: !49)
!250 = !DILocation(line: 124, column: 12, scope: !49)
!251 = !DILocation(line: 125, column: 12, scope: !49)
!252 = !DILocation(line: 126, column: 12, scope: !49)
!253 = !DILocation(line: 127, column: 12, scope: !49)
!254 = !DILocation(line: 128, column: 12, scope: !49)
!255 = !DILocation(line: 129, column: 12, scope: !49)
!256 = !DILocation(line: 130, column: 12, scope: !49)
!257 = !DILocation(line: 131, column: 12, scope: !49)
!258 = !DILocation(line: 132, column: 12, scope: !49)
!259 = !DILocation(line: 133, column: 12, scope: !49)
!260 = !DILocation(line: 134, column: 12, scope: !49)
!261 = !DILocation(line: 135, column: 12, scope: !49)
!262 = !DILocation(line: 136, column: 12, scope: !49)
!263 = !DILocation(line: 137, column: 12, scope: !49)
!264 = !DILocation(line: 138, column: 12, scope: !49)
!265 = !DILocation(line: 139, column: 12, scope: !49)
!266 = !DILocation(line: 140, column: 12, scope: !49)
!267 = !DILocation(line: 141, column: 12, scope: !49)
!268 = !DILocation(line: 142, column: 12, scope: !49)
!269 = !DILocation(line: 143, column: 12, scope: !49)
!270 = !DILocation(line: 144, column: 12, scope: !49)
!271 = !DILocation(line: 145, column: 12, scope: !49)
!272 = !DILocation(line: 146, column: 12, scope: !49)
!273 = !DILocation(line: 147, column: 12, scope: !49)
!274 = !DILocation(line: 148, column: 12, scope: !49)
!275 = !DILocation(line: 149, column: 12, scope: !49)
!276 = !DILocation(line: 150, column: 12, scope: !49)
!277 = !DILocation(line: 151, column: 12, scope: !49)
!278 = !DILocation(line: 152, column: 12, scope: !49)
!279 = !DILocation(line: 153, column: 12, scope: !49)
!280 = !DILocation(line: 154, column: 12, scope: !49)
!281 = !DILocation(line: 155, column: 12, scope: !49)
!282 = !DILocation(line: 156, column: 12, scope: !49)
!283 = !DILocation(line: 157, column: 12, scope: !49)
!284 = !DILocation(line: 158, column: 12, scope: !49)
!285 = !DILocation(line: 159, column: 12, scope: !49)
!286 = !DILocation(line: 160, column: 12, scope: !49)
!287 = !DILocation(line: 161, column: 12, scope: !49)
!288 = !DILocation(line: 162, column: 12, scope: !49)
!289 = !DILocation(line: 163, column: 12, scope: !49)
!290 = !DILocation(line: 164, column: 12, scope: !49)
!291 = !DILocation(line: 165, column: 12, scope: !49)
!292 = !DILocation(line: 166, column: 12, scope: !49)
!293 = !DILocation(line: 167, column: 12, scope: !49)
!294 = !DILocation(line: 168, column: 12, scope: !49)
!295 = !DILocation(line: 169, column: 12, scope: !49)
!296 = !DILocation(line: 170, column: 12, scope: !49)
!297 = !DILocation(line: 171, column: 12, scope: !49)
!298 = !DILocation(line: 175, column: 7, scope: !49)
!299 = !DILocation(line: 178, column: 2, scope: !49)
!300 = !DILocation(line: 192, column: 7, scope: !301)
!301 = distinct !DILexicalBlock(scope: !302, file: !1, line: 192, column: 6)
!302 = distinct !DILexicalBlock(scope: !49, file: !1, line: 190, column: 13)
!303 = !DILocation(line: 192, column: 6, scope: !302)
!304 = !DILocation(line: 202, column: 7, scope: !305)
!305 = distinct !DILexicalBlock(scope: !302, file: !1, line: 200, column: 14)
!306 = !DILocation(line: 210, column: 9, scope: !305)
!307 = !DILocation(line: 212, column: 10, scope: !308)
!308 = distinct !DILexicalBlock(scope: !305, file: !1, line: 212, column: 7)
!309 = !DILocation(line: 220, column: 10, scope: !310)
!310 = distinct !DILexicalBlock(scope: !305, file: !1, line: 220, column: 7)
!311 = !DILocation(line: 212, column: 7, scope: !305)
!312 = !DILocation(line: 226, column: 11, scope: !305)
!313 = !DILocation(line: 228, column: 11, scope: !305)
!314 = !DILocation(line: 232, column: 11, scope: !305)
!315 = !DILocation(line: 234, column: 8, scope: !305)
!316 = !DILocation(line: 236, column: 4, scope: !305)
!317 = !DILocation(line: 246, column: 9, scope: !305)
!318 = !DILocation(line: 248, column: 10, scope: !319)
!319 = distinct !DILexicalBlock(scope: !305, file: !1, line: 248, column: 7)
!320 = !DILocation(line: 248, column: 7, scope: !305)
!321 = !DILocation(line: 254, column: 11, scope: !305)
!322 = !DILocation(line: 256, column: 11, scope: !305)
!323 = !DILocation(line: 258, column: 8, scope: !305)
!324 = !DILocation(line: 260, column: 4, scope: !305)
!325 = !DILocation(line: 274, column: 10, scope: !326)
!326 = distinct !DILexicalBlock(scope: !305, file: !1, line: 274, column: 7)
!327 = !DILocation(line: 316, column: 9, scope: !305)
!328 = !DILocation(line: 274, column: 7, scope: !305)
!329 = !DILocation(line: 278, column: 11, scope: !305)
!330 = !DILocation(line: 282, column: 11, scope: !305)
!331 = !DILocation(line: 284, column: 8, scope: !305)
!332 = !DILocation(line: 286, column: 4, scope: !305)
!333 = !DILocation(line: 290, column: 8, scope: !334)
!334 = distinct !DILexicalBlock(scope: !305, file: !1, line: 290, column: 7)
!335 = !DILocation(line: 290, column: 7, scope: !305)
!336 = !DILocation(line: 296, column: 8, scope: !337)
!337 = distinct !DILexicalBlock(scope: !305, file: !1, line: 296, column: 7)
!338 = !DILocation(line: 296, column: 7, scope: !305)
!339 = !DILocation(line: 302, column: 8, scope: !305)
!340 = !DILocation(line: 304, column: 11, scope: !305)
!341 = !DILocation(line: 306, column: 8, scope: !305)
!342 = !DILocation(line: 308, column: 11, scope: !305)
!343 = !DILocation(line: 310, column: 10, scope: !344)
!344 = distinct !DILexicalBlock(scope: !305, file: !1, line: 310, column: 7)
!345 = !DILocation(line: 318, column: 11, scope: !305)
!346 = !DILocation(line: 320, column: 4, scope: !305)
!347 = !DILocation(line: 322, column: 4, scope: !305)
!348 = !DILocation(line: 320, column: 15, scope: !305)
!349 = !DILocation(line: 340, column: 9, scope: !305)
!350 = !DILocation(line: 357, column: 8, scope: !302)
!351 = !DILocation(line: 366, column: 2, scope: !49)
!352 = !DILocation(line: 366, column: 2, scope: !353)
!353 = !DILexicalBlockFile(scope: !354, file: !1, discriminator: 1)
!354 = distinct !DILexicalBlock(scope: !355, file: !1, line: 366, column: 2)
!355 = distinct !DILexicalBlock(scope: !49, file: !1, line: 366, column: 2)
!356 = !DILocation(line: 369, column: 2, scope: !49)
!357 = distinct !{!357, !358, !"polly.alias.scope.call"}
!358 = distinct !{!358, !"polly.alias.scope.domain"}
!359 = !{!360, !361, !362, !363, !364}
!360 = distinct !{!360, !358, !"polly.alias.scope.y.0"}
!361 = distinct !{!361, !358, !"polly.alias.scope.storemerge"}
!362 = distinct !{!362, !358, !"polly.alias.scope.x.0"}
!363 = distinct !{!363, !358, !"polly.alias.scope.z.0"}
!364 = distinct !{!364, !358, !"polly.alias.scope.coins"}
!365 = !{!360, !361, !362, !357, !363}
!366 = !DILocation(line: 373, column: 14, scope: !124)
!367 = !DILocation(line: 373, column: 27, scope: !124)
!368 = !DILocation(line: 375, column: 12, scope: !124)
!369 = !DILocation(line: 376, column: 2, scope: !124)
!370 = !DILocation(line: 377, column: 2, scope: !124)
!371 = !DILocation(line: 378, column: 2, scope: !124)
!372 = !DILocation(line: 379, column: 2, scope: !124)
!373 = !DILocation(line: 380, column: 12, scope: !124)
!374 = !DILocation(line: 382, column: 2, scope: !124)
!375 = !DILocation(line: 383, column: 2, scope: !124)
!376 = !DILocation(line: 384, column: 12, scope: !124)
!377 = !DILocation(line: 385, column: 2, scope: !124)
!378 = !DILocation(line: 386, column: 2, scope: !124)
!379 = !DILocation(line: 387, column: 2, scope: !124)
!380 = !DILocation(line: 388, column: 2, scope: !124)
!381 = !DILocation(line: 389, column: 2, scope: !124)
!382 = !DILocation(line: 390, column: 2, scope: !124)
!383 = !DILocation(line: 391, column: 12, scope: !124)
!384 = !DILocation(line: 392, column: 12, scope: !124)
!385 = !DILocation(line: 393, column: 12, scope: !124)
!386 = !DILocation(line: 395, column: 2, scope: !124)
!387 = !DILocation(line: 396, column: 2, scope: !124)
!388 = !DILocation(line: 399, column: 2, scope: !124)
!389 = !DILocation(line: 404, column: 5, scope: !124)
!390 = !{!391, !391, i64 0}
!391 = !{!"any pointer", !193, i64 0}
!392 = !DILocation(line: 406, column: 2, scope: !124)
!393 = !DILocation(line: 381, column: 13, scope: !124)
!394 = !DILocation(line: 374, column: 13, scope: !124)
!395 = !DILocation(line: 410, column: 9, scope: !396)
!396 = distinct !DILexicalBlock(scope: !124, file: !1, line: 410, column: 5)
!397 = !DILocation(line: 410, column: 5, scope: !124)
!398 = !DILocation(line: 412, column: 6, scope: !124)
!399 = !DILocation(line: 2, column: 27, scope: !6, inlinedAt: !400)
!400 = distinct !DILocation(line: 415, column: 8, scope: !124)
!401 = !DILocation(line: 3, column: 2, scope: !6, inlinedAt: !400)
!402 = !DILocation(line: 4, column: 2, scope: !6, inlinedAt: !400)
!403 = !DILocation(line: 5, column: 2, scope: !6, inlinedAt: !400)
!404 = !DILocation(line: 6, column: 2, scope: !6, inlinedAt: !400)
!405 = !DILocation(line: 7, column: 12, scope: !6, inlinedAt: !400)
!406 = !DILocation(line: 8, column: 12, scope: !6, inlinedAt: !400)
!407 = !DILocation(line: 9, column: 2, scope: !6, inlinedAt: !400)
!408 = !DILocation(line: 10, column: 2, scope: !6, inlinedAt: !400)
!409 = !DILocation(line: 11, column: 12, scope: !6, inlinedAt: !400)
!410 = !DILocation(line: 12, column: 12, scope: !6, inlinedAt: !400)
!411 = !DILocation(line: 13, column: 12, scope: !6, inlinedAt: !400)
!412 = !DILocation(line: 14, column: 12, scope: !6, inlinedAt: !400)
!413 = !DILocation(line: 15, column: 12, scope: !6, inlinedAt: !400)
!414 = !DILocation(line: 20, column: 2, scope: !6, inlinedAt: !400)
!415 = !DILocation(line: 34, column: 7, scope: !187, inlinedAt: !400)
!416 = !DILocation(line: 34, column: 6, scope: !188, inlinedAt: !400)
!417 = !DILocation(line: 36, column: 6, scope: !188, inlinedAt: !400)
!418 = !DILocation(line: 415, column: 8, scope: !124)
!419 = !DILocation(line: 38, column: 8, scope: !188, inlinedAt: !400)
!420 = !DILocation(line: 40, column: 12, scope: !188, inlinedAt: !400)
!421 = !DILocation(line: 44, column: 8, scope: !188, inlinedAt: !400)
!422 = distinct !{!422, !199}
!423 = !DILocation(line: 426, column: 8, scope: !124)
!424 = !DILocation(line: 436, column: 7, scope: !124)
!425 = !DILocation(line: 438, column: 6, scope: !124)
!426 = !DILocation(line: 445, column: 2, scope: !124)
!427 = !DILocation(line: 446, column: 9, scope: !124)
!428 = !DILocation(line: 446, column: 29, scope: !124)
!429 = !DILocation(line: 446, column: 36, scope: !124)
!430 = !DILocation(line: 446, column: 56, scope: !124)
!431 = !DILocation(line: 446, column: 63, scope: !124)
!432 = !DILocation(line: 446, column: 84, scope: !124)
!433 = !DILocation(line: 446, column: 91, scope: !124)
!434 = !DILocation(line: 446, column: 111, scope: !124)
!435 = !DILocation(line: 446, column: 118, scope: !124)
!436 = !DILocation(line: 446, column: 138, scope: !124)
!437 = !DILocation(line: 446, column: 146, scope: !124)
!438 = !DILocation(line: 446, column: 167, scope: !124)
!439 = !DILocation(line: 446, column: 175, scope: !124)
!440 = !DILocation(line: 446, column: 197, scope: !124)
!441 = !DILocation(line: 446, column: 205, scope: !124)
!442 = !DILocation(line: 446, column: 227, scope: !124)
!443 = !DILocation(line: 446, column: 235, scope: !124)
!444 = !DILocation(line: 446, column: 256, scope: !124)
!445 = !DILocation(line: 446, column: 264, scope: !124)
!446 = !DILocation(line: 446, column: 285, scope: !124)
!447 = !DILocation(line: 446, column: 293, scope: !124)
!448 = !DILocation(line: 446, column: 315, scope: !124)
!449 = !DILocation(line: 446, column: 323, scope: !124)
!450 = !DILocation(line: 446, column: 345, scope: !124)
!451 = !DILocation(line: 446, column: 353, scope: !124)
!452 = !DILocation(line: 446, column: 374, scope: !124)
!453 = !DILocation(line: 446, column: 382, scope: !124)
!454 = !DILocation(line: 446, column: 403, scope: !124)
!455 = !DILocation(line: 446, column: 411, scope: !124)
!456 = !DILocation(line: 446, column: 432, scope: !124)
!457 = !DILocation(line: 446, column: 440, scope: !124)
!458 = !DILocation(line: 446, column: 462, scope: !124)
!459 = !DILocation(line: 446, column: 470, scope: !124)
!460 = !DILocation(line: 446, column: 492, scope: !124)
!461 = !DILocation(line: 446, column: 500, scope: !124)
!462 = !DILocation(line: 446, column: 520, scope: !124)
!463 = !DILocation(line: 446, column: 528, scope: !124)
!464 = !DILocation(line: 446, column: 549, scope: !124)
!465 = !DILocation(line: 446, column: 557, scope: !124)
!466 = !DILocation(line: 446, column: 578, scope: !124)
!467 = !DILocation(line: 446, column: 586, scope: !124)
!468 = !DILocation(line: 446, column: 607, scope: !124)
!469 = !DILocation(line: 446, column: 615, scope: !124)
!470 = !DILocation(line: 446, column: 637, scope: !124)
!471 = !DILocation(line: 446, column: 645, scope: !124)
!472 = !DILocation(line: 446, column: 667, scope: !124)
!473 = !DILocation(line: 446, column: 675, scope: !124)
!474 = !DILocation(line: 446, column: 696, scope: !124)
!475 = !DILocation(line: 446, column: 704, scope: !124)
!476 = !DILocation(line: 449, column: 2, scope: !124)
!477 = !DILocation(line: 453, column: 2, scope: !124)
!478 = !DILocation(line: 457, column: 2, scope: !479)
!479 = !DILexicalBlockFile(scope: !480, file: !1, discriminator: 1)
!480 = distinct !DILexicalBlock(scope: !481, file: !1, line: 457, column: 2)
!481 = distinct !DILexicalBlock(scope: !124, file: !1, line: 457, column: 2)
!482 = !DILocation(line: 458, column: 2, scope: !483)
!483 = !DILexicalBlockFile(scope: !484, file: !1, discriminator: 1)
!484 = distinct !DILexicalBlock(scope: !485, file: !1, line: 458, column: 2)
!485 = distinct !DILexicalBlock(scope: !124, file: !1, line: 458, column: 2)
!486 = !DILocation(line: 459, column: 2, scope: !487)
!487 = !DILexicalBlockFile(scope: !488, file: !1, discriminator: 1)
!488 = distinct !DILexicalBlock(scope: !489, file: !1, line: 459, column: 2)
!489 = distinct !DILexicalBlock(scope: !124, file: !1, line: 459, column: 2)
!490 = !DILocation(line: 463, column: 2, scope: !491)
!491 = !DILexicalBlockFile(scope: !492, file: !1, discriminator: 1)
!492 = distinct !DILexicalBlock(scope: !493, file: !1, line: 463, column: 2)
!493 = distinct !DILexicalBlock(scope: !124, file: !1, line: 463, column: 2)
!494 = !DILocation(line: 464, column: 2, scope: !124)
