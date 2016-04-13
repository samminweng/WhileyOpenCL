; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64* @init(i64 %n) #0 !dbg !6 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !12, metadata !177), !dbg !178
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !13, metadata !177), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !177), !dbg !179
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !15, metadata !177), !dbg !180
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !17, metadata !177), !dbg !181
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !18, metadata !177), !dbg !181
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !19, metadata !177), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !20, metadata !177), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !21, metadata !177), !dbg !184
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !22, metadata !177), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !23, metadata !177), !dbg !185
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !24, metadata !177), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !177), !dbg !187
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !26, metadata !177), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !177), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !28, metadata !177), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !177), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !21, metadata !177), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !23, metadata !177), !dbg !185
  %conv1 = trunc i64 %n to i32, !dbg !192
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #7, !dbg !192
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !22, metadata !177), !dbg !185
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !24, metadata !177), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !18, metadata !177), !dbg !181
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !17, metadata !177), !dbg !181
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !19, metadata !177), !dbg !182
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !24, metadata !177), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !177), !dbg !187
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !20, metadata !177), !dbg !183
  %cmp41 = icmp sgt i64 %n, 0, !dbg !193
  br i1 %cmp41, label %if.end7.preheader, label %if.end15, !dbg !196

if.end7.preheader:                                ; preds = %entry
  %min.iters.check = icmp ult i64 %n, 4, !dbg !197
  br i1 %min.iters.check, label %if.end7.preheader47, label %min.iters.checked, !dbg !197

min.iters.checked:                                ; preds = %if.end7.preheader
  %n.vec = and i64 %n, -4, !dbg !197
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !197
  br i1 %cmp.zero, label %if.end7.preheader47, label %vector.body.preheader, !dbg !197

vector.body.preheader:                            ; preds = %min.iters.checked
  %0 = add i64 %n.vec, -4
  %1 = lshr exact i64 %0, 2
  %2 = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %2, 0
  br i1 %lcmp.mod, label %vector.body.prol, label %vector.body.preheader.split

vector.body.prol:                                 ; preds = %vector.body.preheader
  %3 = bitcast i64* %call to <2 x i64>*, !dbg !197
  %wide.load.prol = load <2 x i64>, <2 x i64>* %3, align 8, !dbg !197, !tbaa !198
  %4 = getelementptr i64, i64* %call, i64 2, !dbg !197
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !197
  %wide.load44.prol = load <2 x i64>, <2 x i64>* %5, align 8, !dbg !197, !tbaa !198
  %6 = add nsw <2 x i64> %wide.load.prol, <i64 0, i64 1>, !dbg !202
  %7 = add nsw <2 x i64> %wide.load44.prol, <i64 2, i64 3>, !dbg !202
  %8 = bitcast i64* %call to <2 x i64>*, !dbg !203
  store <2 x i64> %6, <2 x i64>* %8, align 8, !dbg !203, !tbaa !198
  %9 = bitcast i64* %4 to <2 x i64>*, !dbg !203
  store <2 x i64> %7, <2 x i64>* %9, align 8, !dbg !203, !tbaa !198
  br label %vector.body.preheader.split, !dbg !197

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %10 = icmp eq i64 %1, 0
  br i1 %10, label %middle.block, label %vector.body.preheader.split.split

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !204
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction = add <2 x i64> %broadcast.splat, <i64 0, i64 1>
  %induction43 = add <2 x i64> %broadcast.splat, <i64 2, i64 3>
  %11 = getelementptr inbounds i64, i64* %call, i64 %index, !dbg !197
  %12 = bitcast i64* %11 to <2 x i64>*, !dbg !197
  %wide.load = load <2 x i64>, <2 x i64>* %12, align 8, !dbg !197, !tbaa !198
  %13 = getelementptr i64, i64* %11, i64 2, !dbg !197
  %14 = bitcast i64* %13 to <2 x i64>*, !dbg !197
  %wide.load44 = load <2 x i64>, <2 x i64>* %14, align 8, !dbg !197, !tbaa !198
  %15 = add nsw <2 x i64> %wide.load, %induction, !dbg !202
  %16 = add nsw <2 x i64> %wide.load44, %induction43, !dbg !202
  %17 = bitcast i64* %11 to <2 x i64>*, !dbg !203
  store <2 x i64> %15, <2 x i64>* %17, align 8, !dbg !203, !tbaa !198
  %18 = bitcast i64* %13 to <2 x i64>*, !dbg !203
  store <2 x i64> %16, <2 x i64>* %18, align 8, !dbg !203, !tbaa !198
  %index.next = add i64 %index, 4, !dbg !197
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer
  %induction.1 = add <2 x i64> %broadcast.splat.1, <i64 0, i64 1>
  %induction43.1 = add <2 x i64> %broadcast.splat.1, <i64 2, i64 3>
  %19 = getelementptr inbounds i64, i64* %call, i64 %index.next, !dbg !197
  %20 = bitcast i64* %19 to <2 x i64>*, !dbg !197
  %wide.load.1 = load <2 x i64>, <2 x i64>* %20, align 8, !dbg !197, !tbaa !198
  %21 = getelementptr i64, i64* %19, i64 2, !dbg !197
  %22 = bitcast i64* %21 to <2 x i64>*, !dbg !197
  %wide.load44.1 = load <2 x i64>, <2 x i64>* %22, align 8, !dbg !197, !tbaa !198
  %23 = add nsw <2 x i64> %wide.load.1, %induction.1, !dbg !202
  %24 = add nsw <2 x i64> %wide.load44.1, %induction43.1, !dbg !202
  %25 = bitcast i64* %19 to <2 x i64>*, !dbg !203
  store <2 x i64> %23, <2 x i64>* %25, align 8, !dbg !203, !tbaa !198
  %26 = bitcast i64* %21 to <2 x i64>*, !dbg !203
  store <2 x i64> %24, <2 x i64>* %26, align 8, !dbg !203, !tbaa !198
  %index.next.1 = add i64 %index, 8, !dbg !197
  %27 = icmp eq i64 %index.next.1, %n.vec, !dbg !197
  br i1 %27, label %middle.block.unr-lcssa, label %vector.body, !dbg !197, !llvm.loop !205

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %n.vec, %n
  br i1 %cmp.n, label %if.end15, label %if.end7.preheader47, !dbg !197

if.end7.preheader47:                              ; preds = %middle.block, %min.iters.checked, %if.end7.preheader
  %i.042.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end7.preheader ], [ %n.vec, %middle.block ]
  br label %if.end7, !dbg !197

if.end7:                                          ; preds = %if.end7.preheader47, %if.end7
  %i.042 = phi i64 [ %add9, %if.end7 ], [ %i.042.ph, %if.end7.preheader47 ]
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %i.042, !dbg !197
  %28 = load i64, i64* %arrayidx, align 8, !dbg !197, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 %28, i64 0, metadata !26, metadata !177), !dbg !188
  %add = add nsw i64 %28, %i.042, !dbg !202
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !27, metadata !177), !dbg !189
  store i64 %add, i64* %arrayidx, align 8, !dbg !203, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !177), !dbg !190
  %add9 = add nuw nsw i64 %i.042, 1, !dbg !204
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !29, metadata !177), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 %add9, i64 0, metadata !20, metadata !177), !dbg !183
  %exitcond = icmp eq i64 %add9, %n, !dbg !196
  br i1 %exitcond, label %if.end15.loopexit, label %if.end7, !dbg !196, !llvm.loop !208

if.end15.loopexit:                                ; preds = %if.end7
  br label %if.end15, !dbg !210

if.end15:                                         ; preds = %if.end15.loopexit, %middle.block, %entry
  ret i64* %call, !dbg !210
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

declare i64* @gen1DArray(i32, i32) #2

; Function Attrs: nounwind uwtable
define i64 @getBobSum(i64 %sum_alice, i64* nocapture %coins, i64 %coins_size, i1 zeroext %coins_has_ownership, i64 %n) #0 !dbg !30 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %sum_alice, i64 0, metadata !34, metadata !177), !dbg !211
  tail call void @llvm.dbg.value(metadata i64* %coins, i64 0, metadata !35, metadata !177), !dbg !212
  tail call void @llvm.dbg.value(metadata i64 %coins_size, i64 0, metadata !36, metadata !177), !dbg !212
  tail call void @llvm.dbg.value(metadata i1 %coins_has_ownership, i64 0, metadata !37, metadata !213), !dbg !214
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !38, metadata !177), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !177), !dbg !216
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !177), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !177), !dbg !218
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !177), !dbg !219
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !177), !dbg !220
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !177), !dbg !221
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !177), !dbg !222
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !177), !dbg !223
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !47, metadata !177), !dbg !224
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !48, metadata !177), !dbg !225
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !177), !dbg !219
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !177), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !177), !dbg !220
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !177), !dbg !218
  %cmp18 = icmp sgt i64 %n, 0, !dbg !226
  br i1 %cmp18, label %if.end.preheader, label %blklab2, !dbg !229

if.end.preheader:                                 ; preds = %entry
  %min.iters.check = icmp ult i64 %n, 4, !dbg !230
  br i1 %min.iters.check, label %if.end.preheader27, label %min.iters.checked, !dbg !230

min.iters.checked:                                ; preds = %if.end.preheader
  %n.vec = and i64 %n, -4, !dbg !230
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !230
  br i1 %cmp.zero, label %if.end.preheader27, label %vector.body.preheader, !dbg !230

vector.body.preheader:                            ; preds = %min.iters.checked
  %0 = add i64 %n.vec, -4, !dbg !230
  %1 = lshr exact i64 %0, 2, !dbg !230
  %2 = add nuw nsw i64 %1, 1, !dbg !230
  %xtraiter = and i64 %2, 3, !dbg !230
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !230
  br i1 %lcmp.mod, label %vector.body.preheader.split, label %vector.body.prol.preheader, !dbg !230

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol, !dbg !230

vector.body.prol:                                 ; preds = %vector.body.prol.preheader, %vector.body.prol
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ], !dbg !231
  %vec.phi.prol = phi <2 x i64> [ %7, %vector.body.prol ], [ zeroinitializer, %vector.body.prol.preheader ]
  %vec.phi22.prol = phi <2 x i64> [ %8, %vector.body.prol ], [ zeroinitializer, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %3 = getelementptr inbounds i64, i64* %coins, i64 %index.prol, !dbg !230
  %4 = bitcast i64* %3 to <2 x i64>*, !dbg !230
  %wide.load.prol = load <2 x i64>, <2 x i64>* %4, align 8, !dbg !230, !tbaa !198
  %5 = getelementptr i64, i64* %3, i64 2, !dbg !230
  %6 = bitcast i64* %5 to <2 x i64>*, !dbg !230
  %wide.load23.prol = load <2 x i64>, <2 x i64>* %6, align 8, !dbg !230, !tbaa !198
  %7 = add nsw <2 x i64> %wide.load.prol, %vec.phi.prol, !dbg !232
  %8 = add nsw <2 x i64> %wide.load23.prol, %vec.phi22.prol, !dbg !232
  %index.next.prol = add i64 %index.prol, 4, !dbg !230
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !230
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !230
  br i1 %prol.iter.cmp, label %vector.body.preheader.split.loopexit, label %vector.body.prol, !dbg !230, !llvm.loop !233

vector.body.preheader.split.loopexit:             ; preds = %vector.body.prol
  %index.next.prol.lcssa = phi i64 [ %index.next.prol, %vector.body.prol ]
  %.lcssa32 = phi <2 x i64> [ %8, %vector.body.prol ]
  %.lcssa31 = phi <2 x i64> [ %7, %vector.body.prol ]
  br label %vector.body.preheader.split, !dbg !230

vector.body.preheader.split:                      ; preds = %vector.body.preheader.split.loopexit, %vector.body.preheader
  %.lcssa28.unr = phi <2 x i64> [ undef, %vector.body.preheader ], [ %.lcssa32, %vector.body.preheader.split.loopexit ]
  %.lcssa.unr = phi <2 x i64> [ undef, %vector.body.preheader ], [ %.lcssa31, %vector.body.preheader.split.loopexit ]
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol.lcssa, %vector.body.preheader.split.loopexit ]
  %vec.phi.unr = phi <2 x i64> [ zeroinitializer, %vector.body.preheader ], [ %.lcssa31, %vector.body.preheader.split.loopexit ]
  %vec.phi22.unr = phi <2 x i64> [ zeroinitializer, %vector.body.preheader ], [ %.lcssa32, %vector.body.preheader.split.loopexit ]
  %9 = icmp ult i64 %0, 12, !dbg !230
  br i1 %9, label %middle.block, label %vector.body.preheader.split.split, !dbg !230

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !230

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.3, %vector.body ], !dbg !231
  %vec.phi = phi <2 x i64> [ %vec.phi.unr, %vector.body.preheader.split.split ], [ %32, %vector.body ]
  %vec.phi22 = phi <2 x i64> [ %vec.phi22.unr, %vector.body.preheader.split.split ], [ %33, %vector.body ]
  %10 = getelementptr inbounds i64, i64* %coins, i64 %index, !dbg !230
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !230
  %wide.load = load <2 x i64>, <2 x i64>* %11, align 8, !dbg !230, !tbaa !198
  %12 = getelementptr i64, i64* %10, i64 2, !dbg !230
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !230
  %wide.load23 = load <2 x i64>, <2 x i64>* %13, align 8, !dbg !230, !tbaa !198
  %14 = add nsw <2 x i64> %wide.load, %vec.phi, !dbg !232
  %15 = add nsw <2 x i64> %wide.load23, %vec.phi22, !dbg !232
  %index.next = add i64 %index, 4, !dbg !230
  %16 = getelementptr inbounds i64, i64* %coins, i64 %index.next, !dbg !230
  %17 = bitcast i64* %16 to <2 x i64>*, !dbg !230
  %wide.load.1 = load <2 x i64>, <2 x i64>* %17, align 8, !dbg !230, !tbaa !198
  %18 = getelementptr i64, i64* %16, i64 2, !dbg !230
  %19 = bitcast i64* %18 to <2 x i64>*, !dbg !230
  %wide.load23.1 = load <2 x i64>, <2 x i64>* %19, align 8, !dbg !230, !tbaa !198
  %20 = add nsw <2 x i64> %wide.load.1, %14, !dbg !232
  %21 = add nsw <2 x i64> %wide.load23.1, %15, !dbg !232
  %index.next.1 = add i64 %index, 8, !dbg !230
  %22 = getelementptr inbounds i64, i64* %coins, i64 %index.next.1, !dbg !230
  %23 = bitcast i64* %22 to <2 x i64>*, !dbg !230
  %wide.load.2 = load <2 x i64>, <2 x i64>* %23, align 8, !dbg !230, !tbaa !198
  %24 = getelementptr i64, i64* %22, i64 2, !dbg !230
  %25 = bitcast i64* %24 to <2 x i64>*, !dbg !230
  %wide.load23.2 = load <2 x i64>, <2 x i64>* %25, align 8, !dbg !230, !tbaa !198
  %26 = add nsw <2 x i64> %wide.load.2, %20, !dbg !232
  %27 = add nsw <2 x i64> %wide.load23.2, %21, !dbg !232
  %index.next.2 = add i64 %index, 12, !dbg !230
  %28 = getelementptr inbounds i64, i64* %coins, i64 %index.next.2, !dbg !230
  %29 = bitcast i64* %28 to <2 x i64>*, !dbg !230
  %wide.load.3 = load <2 x i64>, <2 x i64>* %29, align 8, !dbg !230, !tbaa !198
  %30 = getelementptr i64, i64* %28, i64 2, !dbg !230
  %31 = bitcast i64* %30 to <2 x i64>*, !dbg !230
  %wide.load23.3 = load <2 x i64>, <2 x i64>* %31, align 8, !dbg !230, !tbaa !198
  %32 = add nsw <2 x i64> %wide.load.3, %26, !dbg !232
  %33 = add nsw <2 x i64> %wide.load23.3, %27, !dbg !232
  %index.next.3 = add i64 %index, 16, !dbg !230
  %34 = icmp eq i64 %index.next.3, %n.vec, !dbg !230
  br i1 %34, label %middle.block.unr-lcssa, label %vector.body, !dbg !230, !llvm.loop !235

middle.block.unr-lcssa:                           ; preds = %vector.body
  %.lcssa30 = phi <2 x i64> [ %33, %vector.body ]
  %.lcssa29 = phi <2 x i64> [ %32, %vector.body ]
  br label %middle.block, !dbg !232

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %.lcssa28 = phi <2 x i64> [ %.lcssa28.unr, %vector.body.preheader.split ], [ %.lcssa30, %middle.block.unr-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.unr, %vector.body.preheader.split ], [ %.lcssa29, %middle.block.unr-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa28, %.lcssa, !dbg !232
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>, !dbg !232
  %bin.rdx26 = add <2 x i64> %bin.rdx, %rdx.shuf, !dbg !232
  %35 = extractelement <2 x i64> %bin.rdx26, i32 0, !dbg !232
  %cmp.n = icmp eq i64 %n.vec, %n
  br i1 %cmp.n, label %blklab2, label %if.end.preheader27, !dbg !230

if.end.preheader27:                               ; preds = %middle.block, %min.iters.checked, %if.end.preheader
  %i.020.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end.preheader ], [ %n.vec, %middle.block ]
  %sum.019.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end.preheader ], [ %35, %middle.block ]
  br label %if.end, !dbg !230

if.end:                                           ; preds = %if.end.preheader27, %if.end
  %i.020 = phi i64 [ %add1, %if.end ], [ %i.020.ph, %if.end.preheader27 ]
  %sum.019 = phi i64 [ %add, %if.end ], [ %sum.019.ph, %if.end.preheader27 ]
  %arrayidx = getelementptr inbounds i64, i64* %coins, i64 %i.020, !dbg !230
  %36 = load i64, i64* %arrayidx, align 8, !dbg !230, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 %36, i64 0, metadata !44, metadata !177), !dbg !221
  %add = add nsw i64 %36, %sum.019, !dbg !232
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !45, metadata !177), !dbg !222
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !41, metadata !177), !dbg !218
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !46, metadata !177), !dbg !223
  %add1 = add nuw nsw i64 %i.020, 1, !dbg !231
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !47, metadata !177), !dbg !224
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !40, metadata !177), !dbg !217
  %exitcond = icmp eq i64 %add1, %n, !dbg !229
  br i1 %exitcond, label %blklab2.loopexit, label %if.end, !dbg !229, !llvm.loop !236

blklab2.loopexit:                                 ; preds = %if.end
  %add.lcssa = phi i64 [ %add, %if.end ]
  br label %blklab2, !dbg !237

blklab2:                                          ; preds = %blklab2.loopexit, %middle.block, %entry
  %sum.0.lcssa = phi i64 [ 0, %entry ], [ %35, %middle.block ], [ %add.lcssa, %blklab2.loopexit ]
  %sub = sub nsw i64 %sum.0.lcssa, %sum_alice, !dbg !237
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !48, metadata !177), !dbg !225
  br i1 %coins_has_ownership, label %if.then2, label %if.end3, !dbg !238

if.then2:                                         ; preds = %blklab2
  %37 = bitcast i64* %coins to i8*, !dbg !239
  tail call void @free(i8* %37) #7, !dbg !239
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !37, metadata !177), !dbg !214
  br label %if.end3, !dbg !239

if.end3:                                          ; preds = %if.then2, %blklab2
  ret i64 %sub, !dbg !243
}

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %coins, i64 %coins_size, i1 zeroext %coins_has_ownership, i64 %n) #3 !dbg !49 {
entry:
  tail call void @llvm.dbg.value(metadata i64* %coins, i64 0, metadata !53, metadata !177), !dbg !244
  tail call void @llvm.dbg.value(metadata i64 %coins_size, i64 0, metadata !54, metadata !177), !dbg !244
  tail call void @llvm.dbg.value(metadata i1 %coins_has_ownership, i64 0, metadata !55, metadata !213), !dbg !245
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !56, metadata !177), !dbg !246
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !57, metadata !177), !dbg !247
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !58, metadata !177), !dbg !247
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !59, metadata !177), !dbg !248
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !60, metadata !177), !dbg !249
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !177), !dbg !249
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !62, metadata !177), !dbg !250
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !177), !dbg !251
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !177), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !65, metadata !177), !dbg !253
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !177), !dbg !254
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !177), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !177), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !177), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !177), !dbg !258
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !71, metadata !177), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !177), !dbg !259
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !73, metadata !177), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !177), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !75, metadata !177), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !177), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !77, metadata !177), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !78, metadata !177), !dbg !265
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !177), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !177), !dbg !267
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !177), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !82, metadata !177), !dbg !269
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !177), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !84, metadata !177), !dbg !271
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !177), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !177), !dbg !273
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !177), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !177), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !177), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !177), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !91, metadata !177), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !177), !dbg !279
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !93, metadata !177), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !94, metadata !177), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !95, metadata !177), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !96, metadata !177), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !177), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !177), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !99, metadata !177), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !177), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !101, metadata !177), !dbg !288
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !177), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !103, metadata !177), !dbg !290
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !177), !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !105, metadata !177), !dbg !292
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !177), !dbg !293
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !107, metadata !177), !dbg !294
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !177), !dbg !295
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !109, metadata !177), !dbg !296
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !110, metadata !177), !dbg !297
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !111, metadata !177), !dbg !298
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !177), !dbg !299
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !113, metadata !177), !dbg !300
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !177), !dbg !301
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !115, metadata !177), !dbg !302
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !177), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !117, metadata !177), !dbg !304
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !118, metadata !177), !dbg !305
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !119, metadata !177), !dbg !306
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !177), !dbg !307
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !121, metadata !177), !dbg !308
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !177), !dbg !309
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !123, metadata !177), !dbg !310
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !177), !dbg !257
  %mul = mul i64 %n, %n, !dbg !311
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !70, metadata !177), !dbg !258
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !72, metadata !177), !dbg !259
  %conv1 = trunc i64 %mul to i32, !dbg !312
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #7, !dbg !312
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !71, metadata !177), !dbg !259
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !73, metadata !177), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !61, metadata !177), !dbg !249
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !60, metadata !177), !dbg !249
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !62, metadata !177), !dbg !250
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !73, metadata !177), !dbg !260
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !177), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !177), !dbg !251
  %cmp201 = icmp sgt i64 %n, 0, !dbg !313
  br i1 %cmp201, label %polly.split_new_and_old, label %blklab4, !dbg !316

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
  br label %while.cond8.preheader, !dbg !317

while.cond8.preheader:                            ; preds = %while.cond8.preheader.preheader, %blklab6
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab6 ], [ %n, %while.cond8.preheader.preheader ]
  %s.0202 = phi i64 [ %add72, %blklab6 ], [ 0, %while.cond8.preheader.preheader ]
  br label %if.end13, !dbg !317

if.end13:                                         ; preds = %blklab10, %while.cond8.preheader
  %i.0200 = phi i64 [ 0, %while.cond8.preheader ], [ %add, %blklab10 ]
  %j.0199 = phi i64 [ %s.0202, %while.cond8.preheader ], [ %add70, %blklab10 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !177), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !177), !dbg !254
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !77, metadata !177), !dbg !264
  %add = add nuw nsw i64 %i.0200, 1, !dbg !319
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !78, metadata !177), !dbg !265
  %cmp14 = icmp sge i64 %add, %n, !dbg !320
  %cmp18 = icmp slt i64 %j.0199, 1, !dbg !322
  %or.cond = or i1 %cmp18, %cmp14, !dbg !324
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !79, metadata !177), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !177), !dbg !268
  br i1 %or.cond, label %blklab8, label %if.end21, !dbg !324

if.end21:                                         ; preds = %if.end13
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !82, metadata !177), !dbg !269
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !83, metadata !177), !dbg !270
  %mul23 = mul nsw i64 %add, %n, !dbg !325
  tail call void @llvm.dbg.value(metadata i64 %mul23, i64 0, metadata !84, metadata !177), !dbg !271
  tail call void @llvm.dbg.value(metadata i64 %add24, i64 0, metadata !85, metadata !177), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !86, metadata !177), !dbg !273
  %add24 = add nsw i64 %j.0199, -1, !dbg !326
  %sub25 = add i64 %add24, %mul23, !dbg !327
  tail call void @llvm.dbg.value(metadata i64 %sub25, i64 0, metadata !87, metadata !177), !dbg !274
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %sub25, !dbg !328
  %8 = load i64, i64* %arrayidx, align 8, !dbg !328, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 %8, i64 0, metadata !88, metadata !177), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 %8, i64 0, metadata !66, metadata !177), !dbg !254
  br label %blklab8, !dbg !329

blklab8:                                          ; preds = %if.end13, %if.end21
  %y.0 = phi i64 [ 0, %if.end13 ], [ %8, %if.end21 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !177), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !177), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !90, metadata !177), !dbg !277
  %add26 = add nuw nsw i64 %i.0200, 2, !dbg !330
  tail call void @llvm.dbg.value(metadata i64 %add26, i64 0, metadata !91, metadata !177), !dbg !278
  %cmp27 = icmp slt i64 %add26, %n, !dbg !331
  br i1 %cmp27, label %if.end30, label %blklab9, !dbg !333

if.end30:                                         ; preds = %blklab8
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !92, metadata !177), !dbg !279
  tail call void @llvm.dbg.value(metadata i64 %add26, i64 0, metadata !93, metadata !177), !dbg !280
  %mul32 = mul nsw i64 %add26, %n, !dbg !334
  tail call void @llvm.dbg.value(metadata i64 %mul32, i64 0, metadata !94, metadata !177), !dbg !281
  %add33 = add nsw i64 %mul32, %j.0199, !dbg !335
  tail call void @llvm.dbg.value(metadata i64 %add33, i64 0, metadata !95, metadata !177), !dbg !282
  %arrayidx34 = getelementptr inbounds i64, i64* %call, i64 %add33, !dbg !336
  %9 = load i64, i64* %arrayidx34, align 8, !dbg !336, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !96, metadata !177), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !67, metadata !177), !dbg !255
  br label %blklab9, !dbg !337

blklab9:                                          ; preds = %blklab8, %if.end30
  %x.0 = phi i64 [ 0, %blklab8 ], [ %9, %if.end30 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !177), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !177), !dbg !256
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !98, metadata !177), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !177), !dbg !287
  %cmp36 = icmp slt i64 %j.0199, 2, !dbg !338
  %.pre = mul nsw i64 %i.0200, %n, !dbg !340
  br i1 %cmp36, label %blklab10, label %if.end39, !dbg !341

if.end39:                                         ; preds = %blklab9
  tail call void @llvm.dbg.value(metadata i64 %.pre, i64 0, metadata !101, metadata !177), !dbg !288
  tail call void @llvm.dbg.value(metadata i64 %add41, i64 0, metadata !102, metadata !177), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !103, metadata !177), !dbg !290
  %add41 = add nsw i64 %j.0199, -2, !dbg !342
  %sub42 = add i64 %add41, %.pre, !dbg !343
  tail call void @llvm.dbg.value(metadata i64 %sub42, i64 0, metadata !104, metadata !177), !dbg !291
  %arrayidx43 = getelementptr inbounds i64, i64* %call, i64 %sub42, !dbg !344
  %10 = load i64, i64* %arrayidx43, align 8, !dbg !344, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 %10, i64 0, metadata !105, metadata !177), !dbg !292
  tail call void @llvm.dbg.value(metadata i64 %10, i64 0, metadata !68, metadata !177), !dbg !256
  br label %blklab10, !dbg !345

blklab10:                                         ; preds = %blklab9, %if.end39
  %z.0 = phi i64 [ %10, %if.end39 ], [ 0, %blklab9 ]
  %cmp44 = icmp sgt i64 %x.0, %y.0, !dbg !346
  tail call void @llvm.dbg.value(metadata i64 %y.0, i64 0, metadata !67, metadata !177), !dbg !255
  %y.0.x.0 = select i1 %cmp44, i64 %y.0, i64 %x.0, !dbg !348
  %cmp48 = icmp sgt i64 %z.0, %y.0, !dbg !349
  tail call void @llvm.dbg.value(metadata i64 %y.0, i64 0, metadata !68, metadata !177), !dbg !256
  %z.1 = select i1 %cmp48, i64 %y.0, i64 %z.0, !dbg !351
  %arrayidx52 = getelementptr inbounds i64, i64* %coins, i64 %i.0200, !dbg !352
  %11 = load i64, i64* %arrayidx52, align 8, !dbg !352, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 %11, i64 0, metadata !106, metadata !177), !dbg !293
  %add53 = add nsw i64 %11, %y.0.x.0, !dbg !353
  tail call void @llvm.dbg.value(metadata i64 %add53, i64 0, metadata !107, metadata !177), !dbg !294
  %arrayidx54 = getelementptr inbounds i64, i64* %coins, i64 %j.0199, !dbg !354
  %12 = load i64, i64* %arrayidx54, align 8, !dbg !354, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 %12, i64 0, metadata !108, metadata !177), !dbg !295
  %add55 = add nsw i64 %12, %z.1, !dbg !355
  tail call void @llvm.dbg.value(metadata i64 %add55, i64 0, metadata !109, metadata !177), !dbg !296
  %cmp56 = icmp sgt i64 %add53, %add55, !dbg !356
  %add63 = add nsw i64 %.pre, %j.0199, !dbg !358
  %arrayidx64 = getelementptr inbounds i64, i64* %call, i64 %add63, !dbg !359
  %add53.add55 = select i1 %cmp56, i64 %add53, i64 %add55, !dbg !360
  store i64 %add53.add55, i64* %arrayidx64, align 8, !dbg !361, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !118, metadata !177), !dbg !305
  %add70 = add nuw nsw i64 %j.0199, 1, !dbg !362
  tail call void @llvm.dbg.value(metadata i64 %add70, i64 0, metadata !119, metadata !177), !dbg !306
  tail call void @llvm.dbg.value(metadata i64 %add70, i64 0, metadata !64, metadata !177), !dbg !252
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !120, metadata !177), !dbg !307
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !121, metadata !177), !dbg !308
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !65, metadata !177), !dbg !253
  %exitcond = icmp eq i64 %add, %indvars.iv, !dbg !317
  br i1 %exitcond, label %blklab6, label %if.end13, !dbg !317

blklab6:                                          ; preds = %blklab10
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !122, metadata !177), !dbg !309
  %add72 = add nuw nsw i64 %s.0202, 1, !dbg !363
  tail call void @llvm.dbg.value(metadata i64 %add72, i64 0, metadata !123, metadata !177), !dbg !310
  tail call void @llvm.dbg.value(metadata i64 %add72, i64 0, metadata !63, metadata !177), !dbg !251
  %indvars.iv.next = add i64 %indvars.iv, -1, !dbg !316
  %exitcond203 = icmp eq i64 %add72, %n, !dbg !316
  br i1 %exitcond203, label %blklab4.loopexit268, label %while.cond8.preheader, !dbg !316

blklab4.loopexit:                                 ; preds = %polly.loop_exit211
  br label %blklab4, !dbg !364

blklab4.loopexit268:                              ; preds = %blklab6
  br label %blklab4, !dbg !364

blklab4:                                          ; preds = %blklab4.loopexit268, %blklab4.loopexit, %entry
  br i1 %coins_has_ownership, label %if.then74, label %if.end81, !dbg !364

if.then74:                                        ; preds = %blklab4
  %13 = bitcast i64* %coins to i8*, !dbg !365
  tail call void @free(i8* %13) #7, !dbg !365
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !55, metadata !177), !dbg !245
  br label %if.end81, !dbg !365

if.end81:                                         ; preds = %if.then74, %blklab4
  ret i64* %call, !dbg !369

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
  %_p_scalar_.us = load i64, i64* %uglygep219.us, align 8, !alias.scope !370, !noalias !372
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
  %_p_scalar_233.us = load i64, i64* %uglygep231232.us, align 8, !alias.scope !370, !noalias !372
  br label %polly.cond234.us

polly.cond234.us:                                 ; preds = %polly.stmt.if.end30.us, %polly.cond224.us
  %x.0.phiops.0.us = phi i64 [ %_p_scalar_233.us, %polly.stmt.if.end30.us ], [ 0, %polly.cond224.us ]
  %53 = icmp sgt i64 %34, 1
  br i1 %53, label %polly.stmt.if.end39.us, label %polly.cond244.us

polly.stmt.if.end39.us:                           ; preds = %polly.cond234.us
  %54 = mul i64 %polly.indvar213.us, %16
  %uglygep241.us = getelementptr i8, i8* %scevgep239240, i64 %54
  %uglygep241242.us = bitcast i8* %uglygep241.us to i64*
  %_p_scalar_243.us = load i64, i64* %uglygep241242.us, align 8, !alias.scope !370, !noalias !372
  br label %polly.cond244.us

polly.cond244.us:                                 ; preds = %polly.stmt.if.end39.us, %polly.cond234.us
  %z.0.phiops.0.us = phi i64 [ %_p_scalar_243.us, %polly.stmt.if.end39.us ], [ 0, %polly.cond234.us ]
  %55 = and i1 %31, %35
  %56 = or i1 %55, %45
  %57 = or i1 %19, %56
  br i1 %57, label %polly.stmt.blklab10.us, label %polly.merge221.us

polly.stmt.blklab10.us:                           ; preds = %polly.cond244.us
  %p_cmp44.us = icmp sgt i64 %x.0.phiops.0.us, %y.0.phiops.0258.us, !dbg !346
  %p_y.0.x.0.us = select i1 %p_cmp44.us, i64 %y.0.phiops.0258.us, i64 %x.0.phiops.0.us, !dbg !348
  %p_cmp48.us = icmp sgt i64 %z.0.phiops.0.us, %y.0.phiops.0258.us, !dbg !349
  %p_z.1.us = select i1 %p_cmp48.us, i64 %y.0.phiops.0258.us, i64 %z.0.phiops.0.us, !dbg !351
  %scevgep249.us = getelementptr i64, i64* %coins, i64 %polly.indvar213.us
  %_p_scalar_250.us = load i64, i64* %scevgep249.us, align 8, !alias.scope !376, !noalias !378
  %p_add53.us = add nsw i64 %_p_scalar_250.us, %p_y.0.x.0.us, !dbg !353
  %scevgep252.us = getelementptr i64, i64* %scevgep251, i64 %polly.indvar213.us
  %_p_scalar_253.us = load i64, i64* %scevgep252.us, align 8, !alias.scope !376, !noalias !378
  %p_add55.us = add nsw i64 %_p_scalar_253.us, %p_z.1.us, !dbg !355
  %p_cmp56.us = icmp sgt i64 %p_add53.us, %p_add55.us, !dbg !356
  %p_add53.p_add55.us = select i1 %p_cmp56.us, i64 %p_add53.us, i64 %p_add55.us, !dbg !360
  %58 = mul i64 %polly.indvar213.us, %16
  %uglygep256.us = getelementptr i8, i8* %scevgep254255, i64 %58
  %uglygep256257.us = bitcast i8* %uglygep256.us to i64*
  store i64 %p_add53.p_add55.us, i64* %uglygep256257.us, align 8, !alias.scope !370, !noalias !372
  br label %polly.merge221.us

polly.merge221.us:                                ; preds = %polly.stmt.blklab10.us, %polly.cond244.us, %polly.cond220.us
  %59 = phi i64 [ %44, %polly.cond244.us ], [ %38, %polly.cond220.us ], [ %44, %polly.stmt.blklab10.us ]
  %polly.loop_cond216.us = icmp slt i64 %polly.indvar213.us, %polly.adjust_ub215
  br i1 %polly.loop_cond216.us, label %polly.loop_header209.us, label %polly.loop_exit211.loopexit

polly.cond220.thread:                             ; preds = %polly.loop_header209
  %60 = mul i64 %polly.indvar213, %16
  %uglygep = getelementptr i8, i8* %scevgep217218, i64 %60
  %uglygep219 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep219, align 8, !alias.scope !370, !noalias !372
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
  %_p_scalar_233 = load i64, i64* %uglygep231232, align 8, !alias.scope !370, !noalias !372
  br label %polly.cond234

polly.stmt.if.end39:                              ; preds = %polly.cond234
  %73 = mul i64 %polly.indvar213, %16
  %uglygep241 = getelementptr i8, i8* %scevgep239240, i64 %73
  %uglygep241242 = bitcast i8* %uglygep241 to i64*
  %_p_scalar_243 = load i64, i64* %uglygep241242, align 8, !alias.scope !370, !noalias !372
  br label %polly.cond244

polly.stmt.blklab10:                              ; preds = %polly.cond244
  %p_cmp44 = icmp sgt i64 %x.0.phiops.0, %y.0.phiops.0258, !dbg !346
  %p_y.0.x.0 = select i1 %p_cmp44, i64 %y.0.phiops.0258, i64 %x.0.phiops.0, !dbg !348
  %p_cmp48 = icmp sgt i64 %z.0.phiops.0, %y.0.phiops.0258, !dbg !349
  %p_z.1 = select i1 %p_cmp48, i64 %y.0.phiops.0258, i64 %z.0.phiops.0, !dbg !351
  %scevgep249 = getelementptr i64, i64* %coins, i64 %polly.indvar213
  %_p_scalar_250 = load i64, i64* %scevgep249, align 8, !alias.scope !376, !noalias !378
  %p_add53 = add nsw i64 %_p_scalar_250, %p_y.0.x.0, !dbg !353
  %scevgep252 = getelementptr i64, i64* %scevgep251, i64 %polly.indvar213
  %_p_scalar_253 = load i64, i64* %scevgep252, align 8, !alias.scope !376, !noalias !378
  %p_add55 = add nsw i64 %_p_scalar_253, %p_z.1, !dbg !355
  %p_cmp56 = icmp sgt i64 %p_add53, %p_add55, !dbg !356
  %p_add53.p_add55 = select i1 %p_cmp56, i64 %p_add53, i64 %p_add55, !dbg !360
  %74 = mul i64 %polly.indvar213, %16
  %uglygep256 = getelementptr i8, i8* %scevgep254255, i64 %74
  %uglygep256257 = bitcast i8* %uglygep256 to i64*
  store i64 %p_add53.p_add55, i64* %uglygep256257, align 8, !alias.scope !370, !noalias !372
  br label %polly.merge221
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #4 !dbg !124 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !132, metadata !177), !dbg !379
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !133, metadata !177), !dbg !380
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !135, metadata !177), !dbg !381
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !136, metadata !177), !dbg !382
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !137, metadata !177), !dbg !382
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !138, metadata !177), !dbg !383
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !139, metadata !177), !dbg !384
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !177), !dbg !384
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !141, metadata !177), !dbg !385
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !142, metadata !177), !dbg !386
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !143, metadata !177), !dbg !387
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !145, metadata !177), !dbg !388
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !147, metadata !177), !dbg !388
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !148, metadata !177), !dbg !388
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !149, metadata !177), !dbg !389
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !150, metadata !177), !dbg !390
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !151, metadata !177), !dbg !391
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !152, metadata !177), !dbg !391
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !153, metadata !177), !dbg !392
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !154, metadata !177), !dbg !393
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !155, metadata !177), !dbg !393
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !156, metadata !177), !dbg !394
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !157, metadata !177), !dbg !395
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !158, metadata !177), !dbg !395
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !159, metadata !177), !dbg !396
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !160, metadata !177), !dbg !397
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !161, metadata !177), !dbg !398
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !162, metadata !177), !dbg !399
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !163, metadata !177), !dbg !400
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !165, metadata !177), !dbg !401
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !166, metadata !177), !dbg !401
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !167, metadata !177), !dbg !402
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !170, metadata !177), !dbg !403
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !171, metadata !177), !dbg !403
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !172, metadata !177), !dbg !404
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #7, !dbg !405
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !145, metadata !177), !dbg !388
  %sub = add nsw i32 %argc, -1, !dbg !405
  %conv = sext i32 %sub to i64, !dbg !405
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !147, metadata !177), !dbg !388
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !149, metadata !177), !dbg !389
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !150, metadata !177), !dbg !390
  %0 = load i64*, i64** %call, align 8, !dbg !406, !tbaa !407
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !151, metadata !177), !dbg !391
  %call1 = tail call i64* @parseStringToInt(i64* %0) #7, !dbg !409
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !144, metadata !177), !dbg !410
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !134, metadata !177), !dbg !411
  %cmp = icmp eq i64* %call1, null, !dbg !412
  br i1 %cmp, label %if.end155.critedge, label %if.end, !dbg !414

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !415, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !135, metadata !177), !dbg !381
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !12, metadata !177) #7, !dbg !416
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !13, metadata !177) #7, !dbg !418
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !14, metadata !177) #7, !dbg !418
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !15, metadata !177) #7, !dbg !419
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !17, metadata !177) #7, !dbg !420
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !18, metadata !177) #7, !dbg !420
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !19, metadata !177) #7, !dbg !421
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !20, metadata !177) #7, !dbg !422
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !21, metadata !177) #7, !dbg !423
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !22, metadata !177) #7, !dbg !424
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !23, metadata !177) #7, !dbg !424
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !24, metadata !177) #7, !dbg !425
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !177) #7, !dbg !426
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !26, metadata !177) #7, !dbg !427
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !177) #7, !dbg !428
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !28, metadata !177) #7, !dbg !429
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !29, metadata !177) #7, !dbg !430
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !21, metadata !177) #7, !dbg !423
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !23, metadata !177) #7, !dbg !424
  %conv1.i = trunc i64 %1 to i32, !dbg !431
  %call.i = tail call i64* @gen1DArray(i32 0, i32 %conv1.i) #7, !dbg !431
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !22, metadata !177) #7, !dbg !424
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !24, metadata !177) #7, !dbg !425
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !18, metadata !177) #7, !dbg !420
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !17, metadata !177) #7, !dbg !420
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !19, metadata !177) #7, !dbg !421
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !24, metadata !177) #7, !dbg !425
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !25, metadata !177) #7, !dbg !426
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !20, metadata !177) #7, !dbg !422
  %cmp41.i = icmp sgt i64 %1, 0, !dbg !432
  br i1 %cmp41.i, label %if.end7.i.preheader, label %init.exit, !dbg !433

if.end7.i.preheader:                              ; preds = %if.end
  %min.iters.check = icmp ult i64 %1, 4, !dbg !434
  br i1 %min.iters.check, label %if.end7.i.preheader319, label %min.iters.checked, !dbg !434

min.iters.checked:                                ; preds = %if.end7.i.preheader
  %n.vec = and i64 %1, -4, !dbg !434
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !434
  br i1 %cmp.zero, label %if.end7.i.preheader319, label %vector.body.preheader, !dbg !434

vector.body.preheader:                            ; preds = %min.iters.checked
  %2 = add i64 %n.vec, -4, !dbg !435
  %3 = lshr exact i64 %2, 2, !dbg !435
  %4 = and i64 %3, 1, !dbg !435
  %lcmp.mod322 = icmp eq i64 %4, 0, !dbg !435
  br i1 %lcmp.mod322, label %vector.body.prol, label %vector.body.preheader.split, !dbg !435

vector.body.prol:                                 ; preds = %vector.body.preheader
  %5 = bitcast i64* %call.i to <2 x i64>*, !dbg !434
  %wide.load.prol = load <2 x i64>, <2 x i64>* %5, align 8, !dbg !434, !tbaa !198
  %6 = getelementptr i64, i64* %call.i, i64 2, !dbg !434
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !434
  %wide.load292.prol = load <2 x i64>, <2 x i64>* %7, align 8, !dbg !434, !tbaa !198
  %8 = add nsw <2 x i64> %wide.load.prol, <i64 0, i64 1>, !dbg !436
  %9 = add nsw <2 x i64> %wide.load292.prol, <i64 2, i64 3>, !dbg !436
  %10 = bitcast i64* %call.i to <2 x i64>*, !dbg !437
  store <2 x i64> %8, <2 x i64>* %10, align 8, !dbg !437, !tbaa !198
  %11 = bitcast i64* %6 to <2 x i64>*, !dbg !437
  store <2 x i64> %9, <2 x i64>* %11, align 8, !dbg !437, !tbaa !198
  br label %vector.body.preheader.split, !dbg !434

vector.body.preheader.split:                      ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ 4, %vector.body.prol ]
  %12 = icmp eq i64 %3, 0, !dbg !435
  br i1 %12, label %middle.block, label %vector.body.preheader.split.split, !dbg !435

vector.body.preheader.split.split:                ; preds = %vector.body.preheader.split
  br label %vector.body, !dbg !435

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.split.split
  %index = phi i64 [ %index.unr, %vector.body.preheader.split.split ], [ %index.next.1, %vector.body ], !dbg !435
  %broadcast.splatinsert = insertelement <2 x i64> undef, i64 %index, i32 0, !dbg !435
  %broadcast.splat = shufflevector <2 x i64> %broadcast.splatinsert, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !435
  %induction = add <2 x i64> %broadcast.splat, <i64 0, i64 1>, !dbg !435
  %induction291 = add <2 x i64> %broadcast.splat, <i64 2, i64 3>, !dbg !435
  %13 = getelementptr inbounds i64, i64* %call.i, i64 %index, !dbg !434
  %14 = bitcast i64* %13 to <2 x i64>*, !dbg !434
  %wide.load = load <2 x i64>, <2 x i64>* %14, align 8, !dbg !434, !tbaa !198
  %15 = getelementptr i64, i64* %13, i64 2, !dbg !434
  %16 = bitcast i64* %15 to <2 x i64>*, !dbg !434
  %wide.load292 = load <2 x i64>, <2 x i64>* %16, align 8, !dbg !434, !tbaa !198
  %17 = add nsw <2 x i64> %wide.load, %induction, !dbg !436
  %18 = add nsw <2 x i64> %wide.load292, %induction291, !dbg !436
  %19 = bitcast i64* %13 to <2 x i64>*, !dbg !437
  store <2 x i64> %17, <2 x i64>* %19, align 8, !dbg !437, !tbaa !198
  %20 = bitcast i64* %15 to <2 x i64>*, !dbg !437
  store <2 x i64> %18, <2 x i64>* %20, align 8, !dbg !437, !tbaa !198
  %index.next = add i64 %index, 4, !dbg !434
  %broadcast.splatinsert.1 = insertelement <2 x i64> undef, i64 %index.next, i32 0, !dbg !435
  %broadcast.splat.1 = shufflevector <2 x i64> %broadcast.splatinsert.1, <2 x i64> undef, <2 x i32> zeroinitializer, !dbg !435
  %induction.1 = add <2 x i64> %broadcast.splat.1, <i64 0, i64 1>, !dbg !435
  %induction291.1 = add <2 x i64> %broadcast.splat.1, <i64 2, i64 3>, !dbg !435
  %21 = getelementptr inbounds i64, i64* %call.i, i64 %index.next, !dbg !434
  %22 = bitcast i64* %21 to <2 x i64>*, !dbg !434
  %wide.load.1 = load <2 x i64>, <2 x i64>* %22, align 8, !dbg !434, !tbaa !198
  %23 = getelementptr i64, i64* %21, i64 2, !dbg !434
  %24 = bitcast i64* %23 to <2 x i64>*, !dbg !434
  %wide.load292.1 = load <2 x i64>, <2 x i64>* %24, align 8, !dbg !434, !tbaa !198
  %25 = add nsw <2 x i64> %wide.load.1, %induction.1, !dbg !436
  %26 = add nsw <2 x i64> %wide.load292.1, %induction291.1, !dbg !436
  %27 = bitcast i64* %21 to <2 x i64>*, !dbg !437
  store <2 x i64> %25, <2 x i64>* %27, align 8, !dbg !437, !tbaa !198
  %28 = bitcast i64* %23 to <2 x i64>*, !dbg !437
  store <2 x i64> %26, <2 x i64>* %28, align 8, !dbg !437, !tbaa !198
  %index.next.1 = add i64 %index, 8, !dbg !434
  %29 = icmp eq i64 %index.next.1, %n.vec, !dbg !434
  br i1 %29, label %middle.block.unr-lcssa, label %vector.body, !dbg !434, !llvm.loop !438

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.preheader.split, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %1, %n.vec
  br i1 %cmp.n, label %init.exit, label %if.end7.i.preheader319, !dbg !434

if.end7.i.preheader319:                           ; preds = %middle.block, %min.iters.checked, %if.end7.i.preheader
  %i.042.i.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %if.end7.i.preheader ], [ %n.vec, %middle.block ]
  br label %if.end7.i, !dbg !434

if.end7.i:                                        ; preds = %if.end7.i.preheader319, %if.end7.i
  %i.042.i = phi i64 [ %add9.i, %if.end7.i ], [ %i.042.i.ph, %if.end7.i.preheader319 ], !dbg !435
  %arrayidx.i = getelementptr inbounds i64, i64* %call.i, i64 %i.042.i, !dbg !434
  %30 = load i64, i64* %arrayidx.i, align 8, !dbg !434, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 %30, i64 0, metadata !26, metadata !177) #7, !dbg !427
  %add.i = add nsw i64 %30, %i.042.i, !dbg !436
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !27, metadata !177) #7, !dbg !428
  store i64 %add.i, i64* %arrayidx.i, align 8, !dbg !437, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !28, metadata !177) #7, !dbg !429
  %add9.i = add nuw nsw i64 %i.042.i, 1, !dbg !439
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !29, metadata !177) #7, !dbg !430
  tail call void @llvm.dbg.value(metadata i64 %add9.i, i64 0, metadata !20, metadata !177) #7, !dbg !422
  %exitcond.i = icmp eq i64 %add9.i, %1, !dbg !433
  br i1 %exitcond.i, label %init.exit.loopexit, label %if.end7.i, !dbg !433, !llvm.loop !440

init.exit.loopexit:                               ; preds = %if.end7.i
  br label %init.exit, !dbg !393

init.exit:                                        ; preds = %init.exit.loopexit, %middle.block, %if.end
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !154, metadata !177), !dbg !393
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !156, metadata !177), !dbg !394
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !137, metadata !177), !dbg !382
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !136, metadata !177), !dbg !382
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !138, metadata !177), !dbg !383
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !156, metadata !177), !dbg !394
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !138, metadata !177), !dbg !383
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !158, metadata !177), !dbg !395
  %call12 = tail call i64* @findMoves(i64* %call.i, i64 undef, i1 zeroext false, i64 %1), !dbg !441
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !157, metadata !177), !dbg !395
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !159, metadata !177), !dbg !396
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !177), !dbg !384
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !139, metadata !177), !dbg !384
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !141, metadata !177), !dbg !385
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !159, metadata !177), !dbg !396
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !160, metadata !177), !dbg !397
  %sub16 = add nsw i64 %1, -1, !dbg !442
  tail call void @llvm.dbg.value(metadata i64 %sub16, i64 0, metadata !161, metadata !177), !dbg !398
  %arrayidx17 = getelementptr inbounds i64, i64* %call12, i64 %sub16, !dbg !443
  %31 = load i64, i64* %arrayidx17, align 8, !dbg !443, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 %31, i64 0, metadata !162, metadata !177), !dbg !399
  tail call void @llvm.dbg.value(metadata i64 %31, i64 0, metadata !142, metadata !177), !dbg !386
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !138, metadata !177), !dbg !383
  tail call void @llvm.dbg.value(metadata i64 %31, i64 0, metadata !34, metadata !177), !dbg !444
  tail call void @llvm.dbg.value(metadata i64* %call.i, i64 0, metadata !35, metadata !177), !dbg !446
  tail call void @llvm.dbg.value(metadata i64 undef, i64 0, metadata !36, metadata !177), !dbg !446
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !37, metadata !213), !dbg !447
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !38, metadata !177), !dbg !448
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !39, metadata !177), !dbg !449
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !177), !dbg !450
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !177), !dbg !451
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !177), !dbg !452
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !177), !dbg !453
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !44, metadata !177), !dbg !454
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !45, metadata !177), !dbg !455
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !46, metadata !177), !dbg !456
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !47, metadata !177), !dbg !457
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !48, metadata !177), !dbg !458
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !42, metadata !177), !dbg !452
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !40, metadata !177), !dbg !450
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !43, metadata !177), !dbg !453
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !41, metadata !177), !dbg !451
  br i1 %cmp41.i, label %if.end.i.preheader, label %getBobSum.exit, !dbg !459

if.end.i.preheader:                               ; preds = %init.exit
  %min.iters.check298 = icmp ult i64 %1, 4, !dbg !460
  br i1 %min.iters.check298, label %if.end.i.preheader318, label %min.iters.checked299, !dbg !460

min.iters.checked299:                             ; preds = %if.end.i.preheader
  %n.vec301 = and i64 %1, -4, !dbg !460
  %cmp.zero302 = icmp eq i64 %n.vec301, 0, !dbg !460
  br i1 %cmp.zero302, label %if.end.i.preheader318, label %vector.body295.preheader, !dbg !460

vector.body295.preheader:                         ; preds = %min.iters.checked299
  %32 = add i64 %n.vec301, -4, !dbg !460
  %33 = lshr exact i64 %32, 2, !dbg !460
  %34 = add nuw nsw i64 %33, 1, !dbg !460
  %xtraiter = and i64 %34, 3, !dbg !460
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !460
  br i1 %lcmp.mod, label %vector.body295.preheader.split, label %vector.body295.prol.preheader, !dbg !460

vector.body295.prol.preheader:                    ; preds = %vector.body295.preheader
  br label %vector.body295.prol, !dbg !460

vector.body295.prol:                              ; preds = %vector.body295.prol.preheader, %vector.body295.prol
  %index304.prol = phi i64 [ %index.next305.prol, %vector.body295.prol ], [ 0, %vector.body295.prol.preheader ], !dbg !461
  %vec.phi.prol = phi <2 x i64> [ %39, %vector.body295.prol ], [ zeroinitializer, %vector.body295.prol.preheader ]
  %vec.phi312.prol = phi <2 x i64> [ %40, %vector.body295.prol ], [ zeroinitializer, %vector.body295.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body295.prol ], [ %xtraiter, %vector.body295.prol.preheader ]
  %35 = getelementptr inbounds i64, i64* %call.i, i64 %index304.prol, !dbg !460
  %36 = bitcast i64* %35 to <2 x i64>*, !dbg !460
  %wide.load313.prol = load <2 x i64>, <2 x i64>* %36, align 8, !dbg !460, !tbaa !198
  %37 = getelementptr i64, i64* %35, i64 2, !dbg !460
  %38 = bitcast i64* %37 to <2 x i64>*, !dbg !460
  %wide.load314.prol = load <2 x i64>, <2 x i64>* %38, align 8, !dbg !460, !tbaa !198
  %39 = add nsw <2 x i64> %wide.load313.prol, %vec.phi.prol, !dbg !462
  %40 = add nsw <2 x i64> %wide.load314.prol, %vec.phi312.prol, !dbg !462
  %index.next305.prol = add i64 %index304.prol, 4, !dbg !460
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !460
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !460
  br i1 %prol.iter.cmp, label %vector.body295.preheader.split.loopexit, label %vector.body295.prol, !dbg !460, !llvm.loop !463

vector.body295.preheader.split.loopexit:          ; preds = %vector.body295.prol
  %index.next305.prol.lcssa = phi i64 [ %index.next305.prol, %vector.body295.prol ]
  %.lcssa326 = phi <2 x i64> [ %40, %vector.body295.prol ]
  %.lcssa325 = phi <2 x i64> [ %39, %vector.body295.prol ]
  br label %vector.body295.preheader.split, !dbg !460

vector.body295.preheader.split:                   ; preds = %vector.body295.preheader.split.loopexit, %vector.body295.preheader
  %.lcssa320.unr = phi <2 x i64> [ undef, %vector.body295.preheader ], [ %.lcssa326, %vector.body295.preheader.split.loopexit ]
  %.lcssa.unr = phi <2 x i64> [ undef, %vector.body295.preheader ], [ %.lcssa325, %vector.body295.preheader.split.loopexit ]
  %index304.unr = phi i64 [ 0, %vector.body295.preheader ], [ %index.next305.prol.lcssa, %vector.body295.preheader.split.loopexit ]
  %vec.phi.unr = phi <2 x i64> [ zeroinitializer, %vector.body295.preheader ], [ %.lcssa325, %vector.body295.preheader.split.loopexit ]
  %vec.phi312.unr = phi <2 x i64> [ zeroinitializer, %vector.body295.preheader ], [ %.lcssa326, %vector.body295.preheader.split.loopexit ]
  %41 = icmp ult i64 %32, 12, !dbg !460
  br i1 %41, label %middle.block296, label %vector.body295.preheader.split.split, !dbg !460

vector.body295.preheader.split.split:             ; preds = %vector.body295.preheader.split
  br label %vector.body295, !dbg !460

vector.body295:                                   ; preds = %vector.body295, %vector.body295.preheader.split.split
  %index304 = phi i64 [ %index304.unr, %vector.body295.preheader.split.split ], [ %index.next305.3, %vector.body295 ], !dbg !461
  %vec.phi = phi <2 x i64> [ %vec.phi.unr, %vector.body295.preheader.split.split ], [ %64, %vector.body295 ]
  %vec.phi312 = phi <2 x i64> [ %vec.phi312.unr, %vector.body295.preheader.split.split ], [ %65, %vector.body295 ]
  %42 = getelementptr inbounds i64, i64* %call.i, i64 %index304, !dbg !460
  %43 = bitcast i64* %42 to <2 x i64>*, !dbg !460
  %wide.load313 = load <2 x i64>, <2 x i64>* %43, align 8, !dbg !460, !tbaa !198
  %44 = getelementptr i64, i64* %42, i64 2, !dbg !460
  %45 = bitcast i64* %44 to <2 x i64>*, !dbg !460
  %wide.load314 = load <2 x i64>, <2 x i64>* %45, align 8, !dbg !460, !tbaa !198
  %46 = add nsw <2 x i64> %wide.load313, %vec.phi, !dbg !462
  %47 = add nsw <2 x i64> %wide.load314, %vec.phi312, !dbg !462
  %index.next305 = add i64 %index304, 4, !dbg !460
  %48 = getelementptr inbounds i64, i64* %call.i, i64 %index.next305, !dbg !460
  %49 = bitcast i64* %48 to <2 x i64>*, !dbg !460
  %wide.load313.1 = load <2 x i64>, <2 x i64>* %49, align 8, !dbg !460, !tbaa !198
  %50 = getelementptr i64, i64* %48, i64 2, !dbg !460
  %51 = bitcast i64* %50 to <2 x i64>*, !dbg !460
  %wide.load314.1 = load <2 x i64>, <2 x i64>* %51, align 8, !dbg !460, !tbaa !198
  %52 = add nsw <2 x i64> %wide.load313.1, %46, !dbg !462
  %53 = add nsw <2 x i64> %wide.load314.1, %47, !dbg !462
  %index.next305.1 = add i64 %index304, 8, !dbg !460
  %54 = getelementptr inbounds i64, i64* %call.i, i64 %index.next305.1, !dbg !460
  %55 = bitcast i64* %54 to <2 x i64>*, !dbg !460
  %wide.load313.2 = load <2 x i64>, <2 x i64>* %55, align 8, !dbg !460, !tbaa !198
  %56 = getelementptr i64, i64* %54, i64 2, !dbg !460
  %57 = bitcast i64* %56 to <2 x i64>*, !dbg !460
  %wide.load314.2 = load <2 x i64>, <2 x i64>* %57, align 8, !dbg !460, !tbaa !198
  %58 = add nsw <2 x i64> %wide.load313.2, %52, !dbg !462
  %59 = add nsw <2 x i64> %wide.load314.2, %53, !dbg !462
  %index.next305.2 = add i64 %index304, 12, !dbg !460
  %60 = getelementptr inbounds i64, i64* %call.i, i64 %index.next305.2, !dbg !460
  %61 = bitcast i64* %60 to <2 x i64>*, !dbg !460
  %wide.load313.3 = load <2 x i64>, <2 x i64>* %61, align 8, !dbg !460, !tbaa !198
  %62 = getelementptr i64, i64* %60, i64 2, !dbg !460
  %63 = bitcast i64* %62 to <2 x i64>*, !dbg !460
  %wide.load314.3 = load <2 x i64>, <2 x i64>* %63, align 8, !dbg !460, !tbaa !198
  %64 = add nsw <2 x i64> %wide.load313.3, %58, !dbg !462
  %65 = add nsw <2 x i64> %wide.load314.3, %59, !dbg !462
  %index.next305.3 = add i64 %index304, 16, !dbg !460
  %66 = icmp eq i64 %index.next305.3, %n.vec301, !dbg !460
  br i1 %66, label %middle.block296.unr-lcssa, label %vector.body295, !dbg !460, !llvm.loop !464

middle.block296.unr-lcssa:                        ; preds = %vector.body295
  %.lcssa324 = phi <2 x i64> [ %65, %vector.body295 ]
  %.lcssa323 = phi <2 x i64> [ %64, %vector.body295 ]
  br label %middle.block296, !dbg !462

middle.block296:                                  ; preds = %vector.body295.preheader.split, %middle.block296.unr-lcssa
  %.lcssa320 = phi <2 x i64> [ %.lcssa320.unr, %vector.body295.preheader.split ], [ %.lcssa324, %middle.block296.unr-lcssa ]
  %.lcssa = phi <2 x i64> [ %.lcssa.unr, %vector.body295.preheader.split ], [ %.lcssa323, %middle.block296.unr-lcssa ]
  %bin.rdx = add <2 x i64> %.lcssa320, %.lcssa, !dbg !462
  %rdx.shuf = shufflevector <2 x i64> %bin.rdx, <2 x i64> undef, <2 x i32> <i32 1, i32 undef>, !dbg !462
  %bin.rdx317 = add <2 x i64> %bin.rdx, %rdx.shuf, !dbg !462
  %67 = extractelement <2 x i64> %bin.rdx317, i32 0, !dbg !462
  %cmp.n307 = icmp eq i64 %1, %n.vec301
  br i1 %cmp.n307, label %getBobSum.exit, label %if.end.i.preheader318, !dbg !460

if.end.i.preheader318:                            ; preds = %middle.block296, %min.iters.checked299, %if.end.i.preheader
  %i.020.i.ph = phi i64 [ 0, %min.iters.checked299 ], [ 0, %if.end.i.preheader ], [ %n.vec301, %middle.block296 ]
  %sum.019.i.ph = phi i64 [ 0, %min.iters.checked299 ], [ 0, %if.end.i.preheader ], [ %67, %middle.block296 ]
  br label %if.end.i, !dbg !460

if.end.i:                                         ; preds = %if.end.i.preheader318, %if.end.i
  %i.020.i = phi i64 [ %add1.i, %if.end.i ], [ %i.020.i.ph, %if.end.i.preheader318 ], !dbg !461
  %sum.019.i = phi i64 [ %add.i287, %if.end.i ], [ %sum.019.i.ph, %if.end.i.preheader318 ], !dbg !461
  %arrayidx.i286 = getelementptr inbounds i64, i64* %call.i, i64 %i.020.i, !dbg !460
  %68 = load i64, i64* %arrayidx.i286, align 8, !dbg !460, !tbaa !198
  tail call void @llvm.dbg.value(metadata i64 %68, i64 0, metadata !44, metadata !177), !dbg !454
  %add.i287 = add nsw i64 %68, %sum.019.i, !dbg !462
  tail call void @llvm.dbg.value(metadata i64 %add.i287, i64 0, metadata !45, metadata !177), !dbg !455
  tail call void @llvm.dbg.value(metadata i64 %add.i287, i64 0, metadata !41, metadata !177), !dbg !451
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !46, metadata !177), !dbg !456
  %add1.i = add nuw nsw i64 %i.020.i, 1, !dbg !465
  tail call void @llvm.dbg.value(metadata i64 %add1.i, i64 0, metadata !47, metadata !177), !dbg !457
  tail call void @llvm.dbg.value(metadata i64 %add1.i, i64 0, metadata !40, metadata !177), !dbg !450
  %exitcond.i288 = icmp eq i64 %add1.i, %1, !dbg !459
  br i1 %exitcond.i288, label %getBobSum.exit.loopexit, label %if.end.i, !dbg !459, !llvm.loop !466

getBobSum.exit.loopexit:                          ; preds = %if.end.i
  %add.i287.lcssa = phi i64 [ %add.i287, %if.end.i ]
  br label %getBobSum.exit, !dbg !467

getBobSum.exit:                                   ; preds = %getBobSum.exit.loopexit, %middle.block296, %init.exit
  %sum.0.lcssa.i = phi i64 [ 0, %init.exit ], [ %67, %middle.block296 ], [ %add.i287.lcssa, %getBobSum.exit.loopexit ], !dbg !461
  %sub.i = sub nsw i64 %sum.0.lcssa.i, %31, !dbg !467
  tail call void @llvm.dbg.value(metadata i64 %sub.i, i64 0, metadata !48, metadata !177), !dbg !458
  tail call void @llvm.dbg.value(metadata i64 %sub.i, i64 0, metadata !163, metadata !177), !dbg !400
  tail call void @llvm.dbg.value(metadata i64 %sub.i, i64 0, metadata !143, metadata !177), !dbg !387
  %cmp19 = icmp slt i64 %31, %sub.i, !dbg !468
  br i1 %cmp19, label %if.end22, label %if.then133, !dbg !471

if.end22:                                         ; preds = %getBobSum.exit
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !472, !tbaa !407
  %70 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %69) #8, !dbg !473
  tail call void @exit(i32 -1) #9, !dbg !474
  unreachable, !dbg !474

if.then133:                                       ; preds = %getBobSum.exit
  tail call void @llvm.dbg.value(metadata i64 50, i64 0, metadata !166, metadata !177), !dbg !401
  %call27 = tail call noalias i8* @malloc(i64 400) #7, !dbg !475
  %71 = bitcast i8* %call27 to i64*, !dbg !475
  tail call void @llvm.dbg.value(metadata i64* %71, i64 0, metadata !165, metadata !177), !dbg !401
  %72 = bitcast i8* %call27 to <2 x i64>*, !dbg !476
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %72, align 8, !dbg !476, !tbaa !198
  %arrayidx30 = getelementptr inbounds i8, i8* %call27, i64 16, !dbg !477
  %73 = bitcast i8* %arrayidx30 to <2 x i64>*, !dbg !478
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %73, align 8, !dbg !478, !tbaa !198
  %arrayidx32 = getelementptr inbounds i8, i8* %call27, i64 32, !dbg !479
  %74 = bitcast i8* %arrayidx32 to <2 x i64>*, !dbg !480
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %74, align 8, !dbg !480, !tbaa !198
  %arrayidx34 = getelementptr inbounds i8, i8* %call27, i64 48, !dbg !481
  %75 = bitcast i8* %arrayidx34 to <2 x i64>*, !dbg !482
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %75, align 8, !dbg !482, !tbaa !198
  %arrayidx36 = getelementptr inbounds i8, i8* %call27, i64 64, !dbg !483
  %76 = bitcast i8* %arrayidx36 to <2 x i64>*, !dbg !484
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %76, align 8, !dbg !484, !tbaa !198
  %arrayidx38 = getelementptr inbounds i8, i8* %call27, i64 80, !dbg !485
  %77 = bitcast i8* %arrayidx38 to <2 x i64>*, !dbg !486
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %77, align 8, !dbg !486, !tbaa !198
  %arrayidx40 = getelementptr inbounds i8, i8* %call27, i64 96, !dbg !487
  %78 = bitcast i8* %arrayidx40 to <2 x i64>*, !dbg !488
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %78, align 8, !dbg !488, !tbaa !198
  %arrayidx42 = getelementptr inbounds i8, i8* %call27, i64 112, !dbg !489
  %79 = bitcast i8* %arrayidx42 to <2 x i64>*, !dbg !490
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %79, align 8, !dbg !490, !tbaa !198
  %arrayidx44 = getelementptr inbounds i8, i8* %call27, i64 128, !dbg !491
  %80 = bitcast i8* %arrayidx44 to <2 x i64>*, !dbg !492
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %80, align 8, !dbg !492, !tbaa !198
  %arrayidx46 = getelementptr inbounds i8, i8* %call27, i64 144, !dbg !493
  %81 = bitcast i8* %arrayidx46 to <2 x i64>*, !dbg !494
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %81, align 8, !dbg !494, !tbaa !198
  %arrayidx48 = getelementptr inbounds i8, i8* %call27, i64 160, !dbg !495
  %82 = bitcast i8* %arrayidx48 to <2 x i64>*, !dbg !496
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %82, align 8, !dbg !496, !tbaa !198
  %arrayidx50 = getelementptr inbounds i8, i8* %call27, i64 176, !dbg !497
  %83 = bitcast i8* %arrayidx50 to <2 x i64>*, !dbg !498
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %83, align 8, !dbg !498, !tbaa !198
  %arrayidx52 = getelementptr inbounds i8, i8* %call27, i64 192, !dbg !499
  %84 = bitcast i8* %arrayidx52 to <2 x i64>*, !dbg !500
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %84, align 8, !dbg !500, !tbaa !198
  %arrayidx54 = getelementptr inbounds i8, i8* %call27, i64 208, !dbg !501
  %85 = bitcast i8* %arrayidx54 to <2 x i64>*, !dbg !502
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %85, align 8, !dbg !502, !tbaa !198
  %arrayidx56 = getelementptr inbounds i8, i8* %call27, i64 224, !dbg !503
  %86 = bitcast i8* %arrayidx56 to <2 x i64>*, !dbg !504
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %86, align 8, !dbg !504, !tbaa !198
  %arrayidx58 = getelementptr inbounds i8, i8* %call27, i64 240, !dbg !505
  %87 = bitcast i8* %arrayidx58 to <2 x i64>*, !dbg !506
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %87, align 8, !dbg !506, !tbaa !198
  %arrayidx60 = getelementptr inbounds i8, i8* %call27, i64 256, !dbg !507
  %88 = bitcast i8* %arrayidx60 to <2 x i64>*, !dbg !508
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %88, align 8, !dbg !508, !tbaa !198
  %arrayidx62 = getelementptr inbounds i8, i8* %call27, i64 272, !dbg !509
  %89 = bitcast i8* %arrayidx62 to <2 x i64>*, !dbg !510
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %89, align 8, !dbg !510, !tbaa !198
  %arrayidx64 = getelementptr inbounds i8, i8* %call27, i64 288, !dbg !511
  %90 = bitcast i8* %arrayidx64 to <2 x i64>*, !dbg !512
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %90, align 8, !dbg !512, !tbaa !198
  %arrayidx66 = getelementptr inbounds i8, i8* %call27, i64 304, !dbg !513
  %91 = bitcast i8* %arrayidx66 to <2 x i64>*, !dbg !514
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %91, align 8, !dbg !514, !tbaa !198
  %arrayidx68 = getelementptr inbounds i8, i8* %call27, i64 320, !dbg !515
  %92 = bitcast i8* %arrayidx68 to <2 x i64>*, !dbg !516
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %92, align 8, !dbg !516, !tbaa !198
  %arrayidx70 = getelementptr inbounds i8, i8* %call27, i64 336, !dbg !517
  %93 = bitcast i8* %arrayidx70 to <2 x i64>*, !dbg !518
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %93, align 8, !dbg !518, !tbaa !198
  %arrayidx72 = getelementptr inbounds i8, i8* %call27, i64 352, !dbg !519
  %94 = bitcast i8* %arrayidx72 to <2 x i64>*, !dbg !520
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %94, align 8, !dbg !520, !tbaa !198
  %arrayidx74 = getelementptr inbounds i8, i8* %call27, i64 368, !dbg !521
  %95 = bitcast i8* %arrayidx74 to <2 x i64>*, !dbg !522
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %95, align 8, !dbg !522, !tbaa !198
  %arrayidx76 = getelementptr inbounds i8, i8* %call27, i64 384, !dbg !523
  %96 = bitcast i8* %arrayidx76 to <2 x i64>*, !dbg !524
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %96, align 8, !dbg !524, !tbaa !198
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !167, metadata !177), !dbg !402
  tail call void @printf_s(i64* %71, i64 50) #7, !dbg !525
  %call78 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %31), !dbg !526
  tail call void @llvm.dbg.value(metadata i64 48, i64 0, metadata !171, metadata !177), !dbg !403
  %call82 = tail call noalias i8* @malloc(i64 384) #7, !dbg !527
  %97 = bitcast i8* %call82 to i64*, !dbg !527
  tail call void @llvm.dbg.value(metadata i64* %97, i64 0, metadata !170, metadata !177), !dbg !403
  %98 = bitcast i8* %call82 to <2 x i64>*, !dbg !528
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %98, align 8, !dbg !528, !tbaa !198
  %arrayidx85 = getelementptr inbounds i8, i8* %call82, i64 16, !dbg !529
  %99 = bitcast i8* %arrayidx85 to <2 x i64>*, !dbg !530
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %99, align 8, !dbg !530, !tbaa !198
  %arrayidx87 = getelementptr inbounds i8, i8* %call82, i64 32, !dbg !531
  %100 = bitcast i8* %arrayidx87 to <2 x i64>*, !dbg !532
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %100, align 8, !dbg !532, !tbaa !198
  %arrayidx89 = getelementptr inbounds i8, i8* %call82, i64 48, !dbg !533
  %101 = bitcast i8* %arrayidx89 to <2 x i64>*, !dbg !534
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %101, align 8, !dbg !534, !tbaa !198
  %arrayidx91 = getelementptr inbounds i8, i8* %call82, i64 64, !dbg !535
  %102 = bitcast i8* %arrayidx91 to <2 x i64>*, !dbg !536
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %102, align 8, !dbg !536, !tbaa !198
  %arrayidx93 = getelementptr inbounds i8, i8* %call82, i64 80, !dbg !537
  %103 = bitcast i8* %arrayidx93 to <2 x i64>*, !dbg !538
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %103, align 8, !dbg !538, !tbaa !198
  %arrayidx95 = getelementptr inbounds i8, i8* %call82, i64 96, !dbg !539
  %104 = bitcast i8* %arrayidx95 to <2 x i64>*, !dbg !540
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %104, align 8, !dbg !540, !tbaa !198
  %arrayidx97 = getelementptr inbounds i8, i8* %call82, i64 112, !dbg !541
  %105 = bitcast i8* %arrayidx97 to <2 x i64>*, !dbg !542
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %105, align 8, !dbg !542, !tbaa !198
  %arrayidx99 = getelementptr inbounds i8, i8* %call82, i64 128, !dbg !543
  %106 = bitcast i8* %arrayidx99 to <2 x i64>*, !dbg !544
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %106, align 8, !dbg !544, !tbaa !198
  %arrayidx101 = getelementptr inbounds i8, i8* %call82, i64 144, !dbg !545
  %107 = bitcast i8* %arrayidx101 to <2 x i64>*, !dbg !546
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %107, align 8, !dbg !546, !tbaa !198
  %arrayidx103 = getelementptr inbounds i8, i8* %call82, i64 160, !dbg !547
  %108 = bitcast i8* %arrayidx103 to <2 x i64>*, !dbg !548
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %108, align 8, !dbg !548, !tbaa !198
  %arrayidx105 = getelementptr inbounds i8, i8* %call82, i64 176, !dbg !549
  %109 = bitcast i8* %arrayidx105 to <2 x i64>*, !dbg !550
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %109, align 8, !dbg !550, !tbaa !198
  %arrayidx107 = getelementptr inbounds i8, i8* %call82, i64 192, !dbg !551
  %110 = bitcast i8* %arrayidx107 to <2 x i64>*, !dbg !552
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %110, align 8, !dbg !552, !tbaa !198
  %arrayidx109 = getelementptr inbounds i8, i8* %call82, i64 208, !dbg !553
  %111 = bitcast i8* %arrayidx109 to <2 x i64>*, !dbg !554
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %111, align 8, !dbg !554, !tbaa !198
  %arrayidx111 = getelementptr inbounds i8, i8* %call82, i64 224, !dbg !555
  %112 = bitcast i8* %arrayidx111 to <2 x i64>*, !dbg !556
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %112, align 8, !dbg !556, !tbaa !198
  %arrayidx113 = getelementptr inbounds i8, i8* %call82, i64 240, !dbg !557
  %113 = bitcast i8* %arrayidx113 to <2 x i64>*, !dbg !558
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %113, align 8, !dbg !558, !tbaa !198
  %arrayidx115 = getelementptr inbounds i8, i8* %call82, i64 256, !dbg !559
  %114 = bitcast i8* %arrayidx115 to <2 x i64>*, !dbg !560
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %114, align 8, !dbg !560, !tbaa !198
  %arrayidx117 = getelementptr inbounds i8, i8* %call82, i64 272, !dbg !561
  %115 = bitcast i8* %arrayidx117 to <2 x i64>*, !dbg !562
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %115, align 8, !dbg !562, !tbaa !198
  %arrayidx119 = getelementptr inbounds i8, i8* %call82, i64 288, !dbg !563
  %116 = bitcast i8* %arrayidx119 to <2 x i64>*, !dbg !564
  store <2 x i64> <i64 66, i64 111>, <2 x i64>* %116, align 8, !dbg !564, !tbaa !198
  %arrayidx121 = getelementptr inbounds i8, i8* %call82, i64 304, !dbg !565
  %117 = bitcast i8* %arrayidx121 to <2 x i64>*, !dbg !566
  store <2 x i64> <i64 98, i64 32>, <2 x i64>* %117, align 8, !dbg !566, !tbaa !198
  %arrayidx123 = getelementptr inbounds i8, i8* %call82, i64 320, !dbg !567
  %118 = bitcast i8* %arrayidx123 to <2 x i64>*, !dbg !568
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %118, align 8, !dbg !568, !tbaa !198
  %arrayidx125 = getelementptr inbounds i8, i8* %call82, i64 336, !dbg !569
  %119 = bitcast i8* %arrayidx125 to <2 x i64>*, !dbg !570
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %119, align 8, !dbg !570, !tbaa !198
  %arrayidx127 = getelementptr inbounds i8, i8* %call82, i64 352, !dbg !571
  %120 = bitcast i8* %arrayidx127 to <2 x i64>*, !dbg !572
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %120, align 8, !dbg !572, !tbaa !198
  %arrayidx129 = getelementptr inbounds i8, i8* %call82, i64 368, !dbg !573
  %121 = bitcast i8* %arrayidx129 to <2 x i64>*, !dbg !574
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %121, align 8, !dbg !574, !tbaa !198
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !172, metadata !177), !dbg !404
  tail call void @printf_s(i64* %97, i64 48) #7, !dbg !575
  %call131 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i64 %sub.i), !dbg !576
  %phitmp = bitcast i64* %call12 to i8*, !dbg !576
  %phitmp285 = bitcast i64* %call.i to i8*, !dbg !576
  tail call void @free(i8* %phitmp285) #7, !dbg !577
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !138, metadata !177), !dbg !383
  tail call void @free(i8* %phitmp) #7, !dbg !581
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !141, metadata !177), !dbg !385
  tail call void @free2DArray(i64** %call, i64 %conv) #7, !dbg !585
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !149, metadata !177), !dbg !389
  tail call void @free(i8* %call27) #7, !dbg !589
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !167, metadata !177), !dbg !402
  tail call void @free(i8* %call82) #7, !dbg !593
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !172, metadata !177), !dbg !404
  br label %if.end155, !dbg !593

if.end155.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #7, !dbg !585
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !149, metadata !177), !dbg !389
  br label %if.end155

if.end155:                                        ; preds = %if.end155.critedge, %if.then133
  tail call void @exit(i32 0) #9, !dbg !597
  unreachable, !dbg !597
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare void @printf_s(i64*, i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

declare void @free2DArray(i64**, i64) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #6

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #7

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind }
attributes #8 = { cold }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!174, !175}
!llvm.ident = !{!176}

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
!131 = !{!132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173}
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
!143 = !DILocalVariable(name: "sum_bob", scope: !124, file: !1, line: 381, type: !10)
!144 = !DILocalVariable(name: "_7", scope: !124, file: !1, line: 382, type: !9)
!145 = !DILocalVariable(name: "_8", scope: !124, file: !1, line: 383, type: !146)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64, align: 64)
!147 = !DILocalVariable(name: "_8_size", scope: !124, file: !1, line: 383, type: !10)
!148 = !DILocalVariable(name: "_8_size_size", scope: !124, file: !1, line: 383, type: !10)
!149 = !DILocalVariable(name: "_8_has_ownership", scope: !124, file: !1, line: 384, type: !16)
!150 = !DILocalVariable(name: "_9", scope: !124, file: !1, line: 385, type: !10)
!151 = !DILocalVariable(name: "_10", scope: !124, file: !1, line: 386, type: !9)
!152 = !DILocalVariable(name: "_10_size", scope: !124, file: !1, line: 386, type: !10)
!153 = !DILocalVariable(name: "_10_has_ownership", scope: !124, file: !1, line: 387, type: !16)
!154 = !DILocalVariable(name: "_11", scope: !124, file: !1, line: 388, type: !9)
!155 = !DILocalVariable(name: "_11_size", scope: !124, file: !1, line: 388, type: !10)
!156 = !DILocalVariable(name: "_11_has_ownership", scope: !124, file: !1, line: 389, type: !16)
!157 = !DILocalVariable(name: "_12", scope: !124, file: !1, line: 390, type: !9)
!158 = !DILocalVariable(name: "_12_size", scope: !124, file: !1, line: 390, type: !10)
!159 = !DILocalVariable(name: "_12_has_ownership", scope: !124, file: !1, line: 391, type: !16)
!160 = !DILocalVariable(name: "_13", scope: !124, file: !1, line: 392, type: !10)
!161 = !DILocalVariable(name: "_14", scope: !124, file: !1, line: 393, type: !10)
!162 = !DILocalVariable(name: "_15", scope: !124, file: !1, line: 394, type: !10)
!163 = !DILocalVariable(name: "_16", scope: !124, file: !1, line: 395, type: !10)
!164 = !DILocalVariable(name: "_17", scope: !124, file: !1, line: 396, type: !4)
!165 = !DILocalVariable(name: "_19", scope: !124, file: !1, line: 397, type: !9)
!166 = !DILocalVariable(name: "_19_size", scope: !124, file: !1, line: 397, type: !10)
!167 = !DILocalVariable(name: "_19_has_ownership", scope: !124, file: !1, line: 398, type: !16)
!168 = !DILocalVariable(name: "_20", scope: !124, file: !1, line: 399, type: !4)
!169 = !DILocalVariable(name: "_22", scope: !124, file: !1, line: 400, type: !4)
!170 = !DILocalVariable(name: "_24", scope: !124, file: !1, line: 401, type: !9)
!171 = !DILocalVariable(name: "_24_size", scope: !124, file: !1, line: 401, type: !10)
!172 = !DILocalVariable(name: "_24_has_ownership", scope: !124, file: !1, line: 402, type: !16)
!173 = !DILocalVariable(name: "_25", scope: !124, file: !1, line: 403, type: !4)
!174 = !{i32 2, !"Dwarf Version", i32 4}
!175 = !{i32 2, !"Debug Info Version", i32 3}
!176 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!177 = !DIExpression()
!178 = !DILocation(line: 2, column: 27, scope: !6)
!179 = !DILocation(line: 3, column: 2, scope: !6)
!180 = !DILocation(line: 4, column: 2, scope: !6)
!181 = !DILocation(line: 5, column: 2, scope: !6)
!182 = !DILocation(line: 6, column: 2, scope: !6)
!183 = !DILocation(line: 7, column: 12, scope: !6)
!184 = !DILocation(line: 8, column: 12, scope: !6)
!185 = !DILocation(line: 9, column: 2, scope: !6)
!186 = !DILocation(line: 10, column: 2, scope: !6)
!187 = !DILocation(line: 11, column: 12, scope: !6)
!188 = !DILocation(line: 12, column: 12, scope: !6)
!189 = !DILocation(line: 13, column: 12, scope: !6)
!190 = !DILocation(line: 14, column: 12, scope: !6)
!191 = !DILocation(line: 15, column: 12, scope: !6)
!192 = !DILocation(line: 20, column: 2, scope: !6)
!193 = !DILocation(line: 34, column: 7, scope: !194)
!194 = distinct !DILexicalBlock(scope: !195, file: !1, line: 34, column: 6)
!195 = distinct !DILexicalBlock(scope: !6, file: !1, line: 32, column: 13)
!196 = !DILocation(line: 34, column: 6, scope: !195)
!197 = !DILocation(line: 36, column: 6, scope: !195)
!198 = !{!199, !199, i64 0}
!199 = !{!"long long", !200, i64 0}
!200 = !{!"omnipotent char", !201, i64 0}
!201 = !{!"Simple C/C++ TBAA"}
!202 = !DILocation(line: 38, column: 8, scope: !195)
!203 = !DILocation(line: 40, column: 12, scope: !195)
!204 = !DILocation(line: 44, column: 8, scope: !195)
!205 = distinct !{!205, !206, !207}
!206 = !{!"llvm.loop.vectorize.width", i32 1}
!207 = !{!"llvm.loop.interleave.count", i32 1}
!208 = distinct !{!208, !209, !206, !207}
!209 = !{!"llvm.loop.unroll.runtime.disable"}
!210 = !DILocation(line: 55, column: 2, scope: !6)
!211 = !DILocation(line: 59, column: 31, scope: !30)
!212 = !DILocation(line: 59, column: 42, scope: !30)
!213 = !DIExpression(DW_OP_bit_piece, 0, 1)
!214 = !DILocation(line: 59, column: 70, scope: !30)
!215 = !DILocation(line: 59, column: 110, scope: !30)
!216 = !DILocation(line: 60, column: 12, scope: !30)
!217 = !DILocation(line: 61, column: 12, scope: !30)
!218 = !DILocation(line: 62, column: 12, scope: !30)
!219 = !DILocation(line: 63, column: 12, scope: !30)
!220 = !DILocation(line: 64, column: 12, scope: !30)
!221 = !DILocation(line: 65, column: 12, scope: !30)
!222 = !DILocation(line: 66, column: 12, scope: !30)
!223 = !DILocation(line: 67, column: 12, scope: !30)
!224 = !DILocation(line: 68, column: 12, scope: !30)
!225 = !DILocation(line: 69, column: 12, scope: !30)
!226 = !DILocation(line: 81, column: 7, scope: !227)
!227 = distinct !DILexicalBlock(scope: !228, file: !1, line: 81, column: 6)
!228 = distinct !DILexicalBlock(scope: !30, file: !1, line: 79, column: 13)
!229 = !DILocation(line: 81, column: 6, scope: !228)
!230 = !DILocation(line: 83, column: 6, scope: !228)
!231 = !DILocation(line: 91, column: 8, scope: !228)
!232 = !DILocation(line: 85, column: 9, scope: !228)
!233 = distinct !{!233, !234}
!234 = !{!"llvm.loop.unroll.disable"}
!235 = distinct !{!235, !206, !207}
!236 = distinct !{!236, !209, !206, !207}
!237 = !DILocation(line: 100, column: 9, scope: !30)
!238 = !DILocation(line: 102, column: 2, scope: !30)
!239 = !DILocation(line: 102, column: 2, scope: !240)
!240 = !DILexicalBlockFile(scope: !241, file: !1, discriminator: 1)
!241 = distinct !DILexicalBlock(scope: !242, file: !1, line: 102, column: 2)
!242 = distinct !DILexicalBlock(scope: !30, file: !1, line: 102, column: 2)
!243 = !DILocation(line: 103, column: 2, scope: !30)
!244 = !DILocation(line: 107, column: 22, scope: !49)
!245 = !DILocation(line: 107, column: 50, scope: !49)
!246 = !DILocation(line: 107, column: 90, scope: !49)
!247 = !DILocation(line: 108, column: 2, scope: !49)
!248 = !DILocation(line: 109, column: 2, scope: !49)
!249 = !DILocation(line: 110, column: 2, scope: !49)
!250 = !DILocation(line: 111, column: 2, scope: !49)
!251 = !DILocation(line: 112, column: 12, scope: !49)
!252 = !DILocation(line: 113, column: 12, scope: !49)
!253 = !DILocation(line: 114, column: 12, scope: !49)
!254 = !DILocation(line: 115, column: 12, scope: !49)
!255 = !DILocation(line: 116, column: 12, scope: !49)
!256 = !DILocation(line: 117, column: 12, scope: !49)
!257 = !DILocation(line: 118, column: 12, scope: !49)
!258 = !DILocation(line: 119, column: 12, scope: !49)
!259 = !DILocation(line: 120, column: 2, scope: !49)
!260 = !DILocation(line: 121, column: 2, scope: !49)
!261 = !DILocation(line: 122, column: 12, scope: !49)
!262 = !DILocation(line: 123, column: 12, scope: !49)
!263 = !DILocation(line: 124, column: 12, scope: !49)
!264 = !DILocation(line: 125, column: 12, scope: !49)
!265 = !DILocation(line: 126, column: 12, scope: !49)
!266 = !DILocation(line: 127, column: 12, scope: !49)
!267 = !DILocation(line: 128, column: 12, scope: !49)
!268 = !DILocation(line: 129, column: 12, scope: !49)
!269 = !DILocation(line: 130, column: 12, scope: !49)
!270 = !DILocation(line: 131, column: 12, scope: !49)
!271 = !DILocation(line: 132, column: 12, scope: !49)
!272 = !DILocation(line: 133, column: 12, scope: !49)
!273 = !DILocation(line: 134, column: 12, scope: !49)
!274 = !DILocation(line: 135, column: 12, scope: !49)
!275 = !DILocation(line: 136, column: 12, scope: !49)
!276 = !DILocation(line: 137, column: 12, scope: !49)
!277 = !DILocation(line: 138, column: 12, scope: !49)
!278 = !DILocation(line: 139, column: 12, scope: !49)
!279 = !DILocation(line: 140, column: 12, scope: !49)
!280 = !DILocation(line: 141, column: 12, scope: !49)
!281 = !DILocation(line: 142, column: 12, scope: !49)
!282 = !DILocation(line: 143, column: 12, scope: !49)
!283 = !DILocation(line: 144, column: 12, scope: !49)
!284 = !DILocation(line: 145, column: 12, scope: !49)
!285 = !DILocation(line: 146, column: 12, scope: !49)
!286 = !DILocation(line: 147, column: 12, scope: !49)
!287 = !DILocation(line: 148, column: 12, scope: !49)
!288 = !DILocation(line: 149, column: 12, scope: !49)
!289 = !DILocation(line: 150, column: 12, scope: !49)
!290 = !DILocation(line: 151, column: 12, scope: !49)
!291 = !DILocation(line: 152, column: 12, scope: !49)
!292 = !DILocation(line: 153, column: 12, scope: !49)
!293 = !DILocation(line: 154, column: 12, scope: !49)
!294 = !DILocation(line: 155, column: 12, scope: !49)
!295 = !DILocation(line: 156, column: 12, scope: !49)
!296 = !DILocation(line: 157, column: 12, scope: !49)
!297 = !DILocation(line: 158, column: 12, scope: !49)
!298 = !DILocation(line: 159, column: 12, scope: !49)
!299 = !DILocation(line: 160, column: 12, scope: !49)
!300 = !DILocation(line: 161, column: 12, scope: !49)
!301 = !DILocation(line: 162, column: 12, scope: !49)
!302 = !DILocation(line: 163, column: 12, scope: !49)
!303 = !DILocation(line: 164, column: 12, scope: !49)
!304 = !DILocation(line: 165, column: 12, scope: !49)
!305 = !DILocation(line: 166, column: 12, scope: !49)
!306 = !DILocation(line: 167, column: 12, scope: !49)
!307 = !DILocation(line: 168, column: 12, scope: !49)
!308 = !DILocation(line: 169, column: 12, scope: !49)
!309 = !DILocation(line: 170, column: 12, scope: !49)
!310 = !DILocation(line: 171, column: 12, scope: !49)
!311 = !DILocation(line: 175, column: 7, scope: !49)
!312 = !DILocation(line: 178, column: 2, scope: !49)
!313 = !DILocation(line: 192, column: 7, scope: !314)
!314 = distinct !DILexicalBlock(scope: !315, file: !1, line: 192, column: 6)
!315 = distinct !DILexicalBlock(scope: !49, file: !1, line: 190, column: 13)
!316 = !DILocation(line: 192, column: 6, scope: !315)
!317 = !DILocation(line: 202, column: 7, scope: !318)
!318 = distinct !DILexicalBlock(scope: !315, file: !1, line: 200, column: 14)
!319 = !DILocation(line: 210, column: 9, scope: !318)
!320 = !DILocation(line: 212, column: 10, scope: !321)
!321 = distinct !DILexicalBlock(scope: !318, file: !1, line: 212, column: 7)
!322 = !DILocation(line: 220, column: 10, scope: !323)
!323 = distinct !DILexicalBlock(scope: !318, file: !1, line: 220, column: 7)
!324 = !DILocation(line: 212, column: 7, scope: !318)
!325 = !DILocation(line: 226, column: 11, scope: !318)
!326 = !DILocation(line: 228, column: 11, scope: !318)
!327 = !DILocation(line: 232, column: 11, scope: !318)
!328 = !DILocation(line: 234, column: 8, scope: !318)
!329 = !DILocation(line: 236, column: 4, scope: !318)
!330 = !DILocation(line: 246, column: 9, scope: !318)
!331 = !DILocation(line: 248, column: 10, scope: !332)
!332 = distinct !DILexicalBlock(scope: !318, file: !1, line: 248, column: 7)
!333 = !DILocation(line: 248, column: 7, scope: !318)
!334 = !DILocation(line: 254, column: 11, scope: !318)
!335 = !DILocation(line: 256, column: 11, scope: !318)
!336 = !DILocation(line: 258, column: 8, scope: !318)
!337 = !DILocation(line: 260, column: 4, scope: !318)
!338 = !DILocation(line: 274, column: 10, scope: !339)
!339 = distinct !DILexicalBlock(scope: !318, file: !1, line: 274, column: 7)
!340 = !DILocation(line: 316, column: 9, scope: !318)
!341 = !DILocation(line: 274, column: 7, scope: !318)
!342 = !DILocation(line: 278, column: 11, scope: !318)
!343 = !DILocation(line: 282, column: 11, scope: !318)
!344 = !DILocation(line: 284, column: 8, scope: !318)
!345 = !DILocation(line: 286, column: 4, scope: !318)
!346 = !DILocation(line: 290, column: 8, scope: !347)
!347 = distinct !DILexicalBlock(scope: !318, file: !1, line: 290, column: 7)
!348 = !DILocation(line: 290, column: 7, scope: !318)
!349 = !DILocation(line: 296, column: 8, scope: !350)
!350 = distinct !DILexicalBlock(scope: !318, file: !1, line: 296, column: 7)
!351 = !DILocation(line: 296, column: 7, scope: !318)
!352 = !DILocation(line: 302, column: 8, scope: !318)
!353 = !DILocation(line: 304, column: 11, scope: !318)
!354 = !DILocation(line: 306, column: 8, scope: !318)
!355 = !DILocation(line: 308, column: 11, scope: !318)
!356 = !DILocation(line: 310, column: 10, scope: !357)
!357 = distinct !DILexicalBlock(scope: !318, file: !1, line: 310, column: 7)
!358 = !DILocation(line: 318, column: 11, scope: !318)
!359 = !DILocation(line: 320, column: 4, scope: !318)
!360 = !DILocation(line: 322, column: 4, scope: !318)
!361 = !DILocation(line: 320, column: 15, scope: !318)
!362 = !DILocation(line: 340, column: 9, scope: !318)
!363 = !DILocation(line: 357, column: 8, scope: !315)
!364 = !DILocation(line: 366, column: 2, scope: !49)
!365 = !DILocation(line: 366, column: 2, scope: !366)
!366 = !DILexicalBlockFile(scope: !367, file: !1, discriminator: 1)
!367 = distinct !DILexicalBlock(scope: !368, file: !1, line: 366, column: 2)
!368 = distinct !DILexicalBlock(scope: !49, file: !1, line: 366, column: 2)
!369 = !DILocation(line: 369, column: 2, scope: !49)
!370 = distinct !{!370, !371, !"polly.alias.scope.call"}
!371 = distinct !{!371, !"polly.alias.scope.domain"}
!372 = !{!373, !374, !375, !376, !377}
!373 = distinct !{!373, !371, !"polly.alias.scope.x.0"}
!374 = distinct !{!374, !371, !"polly.alias.scope.storemerge"}
!375 = distinct !{!375, !371, !"polly.alias.scope.y.0"}
!376 = distinct !{!376, !371, !"polly.alias.scope.coins"}
!377 = distinct !{!377, !371, !"polly.alias.scope.z.0"}
!378 = !{!373, !374, !375, !377, !370}
!379 = !DILocation(line: 373, column: 14, scope: !124)
!380 = !DILocation(line: 373, column: 27, scope: !124)
!381 = !DILocation(line: 375, column: 12, scope: !124)
!382 = !DILocation(line: 376, column: 2, scope: !124)
!383 = !DILocation(line: 377, column: 2, scope: !124)
!384 = !DILocation(line: 378, column: 2, scope: !124)
!385 = !DILocation(line: 379, column: 2, scope: !124)
!386 = !DILocation(line: 380, column: 12, scope: !124)
!387 = !DILocation(line: 381, column: 12, scope: !124)
!388 = !DILocation(line: 383, column: 2, scope: !124)
!389 = !DILocation(line: 384, column: 2, scope: !124)
!390 = !DILocation(line: 385, column: 12, scope: !124)
!391 = !DILocation(line: 386, column: 2, scope: !124)
!392 = !DILocation(line: 387, column: 2, scope: !124)
!393 = !DILocation(line: 388, column: 2, scope: !124)
!394 = !DILocation(line: 389, column: 2, scope: !124)
!395 = !DILocation(line: 390, column: 2, scope: !124)
!396 = !DILocation(line: 391, column: 2, scope: !124)
!397 = !DILocation(line: 392, column: 12, scope: !124)
!398 = !DILocation(line: 393, column: 12, scope: !124)
!399 = !DILocation(line: 394, column: 12, scope: !124)
!400 = !DILocation(line: 395, column: 12, scope: !124)
!401 = !DILocation(line: 397, column: 2, scope: !124)
!402 = !DILocation(line: 398, column: 2, scope: !124)
!403 = !DILocation(line: 401, column: 2, scope: !124)
!404 = !DILocation(line: 402, column: 2, scope: !124)
!405 = !DILocation(line: 405, column: 2, scope: !124)
!406 = !DILocation(line: 410, column: 6, scope: !124)
!407 = !{!408, !408, i64 0}
!408 = !{!"any pointer", !200, i64 0}
!409 = !DILocation(line: 412, column: 2, scope: !124)
!410 = !DILocation(line: 382, column: 13, scope: !124)
!411 = !DILocation(line: 374, column: 13, scope: !124)
!412 = !DILocation(line: 416, column: 9, scope: !413)
!413 = distinct !DILexicalBlock(scope: !124, file: !1, line: 416, column: 5)
!414 = !DILocation(line: 416, column: 5, scope: !124)
!415 = !DILocation(line: 418, column: 6, scope: !124)
!416 = !DILocation(line: 2, column: 27, scope: !6, inlinedAt: !417)
!417 = distinct !DILocation(line: 421, column: 8, scope: !124)
!418 = !DILocation(line: 3, column: 2, scope: !6, inlinedAt: !417)
!419 = !DILocation(line: 4, column: 2, scope: !6, inlinedAt: !417)
!420 = !DILocation(line: 5, column: 2, scope: !6, inlinedAt: !417)
!421 = !DILocation(line: 6, column: 2, scope: !6, inlinedAt: !417)
!422 = !DILocation(line: 7, column: 12, scope: !6, inlinedAt: !417)
!423 = !DILocation(line: 8, column: 12, scope: !6, inlinedAt: !417)
!424 = !DILocation(line: 9, column: 2, scope: !6, inlinedAt: !417)
!425 = !DILocation(line: 10, column: 2, scope: !6, inlinedAt: !417)
!426 = !DILocation(line: 11, column: 12, scope: !6, inlinedAt: !417)
!427 = !DILocation(line: 12, column: 12, scope: !6, inlinedAt: !417)
!428 = !DILocation(line: 13, column: 12, scope: !6, inlinedAt: !417)
!429 = !DILocation(line: 14, column: 12, scope: !6, inlinedAt: !417)
!430 = !DILocation(line: 15, column: 12, scope: !6, inlinedAt: !417)
!431 = !DILocation(line: 20, column: 2, scope: !6, inlinedAt: !417)
!432 = !DILocation(line: 34, column: 7, scope: !194, inlinedAt: !417)
!433 = !DILocation(line: 34, column: 6, scope: !195, inlinedAt: !417)
!434 = !DILocation(line: 36, column: 6, scope: !195, inlinedAt: !417)
!435 = !DILocation(line: 421, column: 8, scope: !124)
!436 = !DILocation(line: 38, column: 8, scope: !195, inlinedAt: !417)
!437 = !DILocation(line: 40, column: 12, scope: !195, inlinedAt: !417)
!438 = distinct !{!438, !206, !207}
!439 = !DILocation(line: 44, column: 8, scope: !195, inlinedAt: !417)
!440 = distinct !{!440, !209, !206, !207}
!441 = !DILocation(line: 432, column: 8, scope: !124)
!442 = !DILocation(line: 442, column: 7, scope: !124)
!443 = !DILocation(line: 444, column: 6, scope: !124)
!444 = !DILocation(line: 59, column: 31, scope: !30, inlinedAt: !445)
!445 = distinct !DILocation(line: 449, column: 8, scope: !124)
!446 = !DILocation(line: 59, column: 42, scope: !30, inlinedAt: !445)
!447 = !DILocation(line: 59, column: 70, scope: !30, inlinedAt: !445)
!448 = !DILocation(line: 59, column: 110, scope: !30, inlinedAt: !445)
!449 = !DILocation(line: 60, column: 12, scope: !30, inlinedAt: !445)
!450 = !DILocation(line: 61, column: 12, scope: !30, inlinedAt: !445)
!451 = !DILocation(line: 62, column: 12, scope: !30, inlinedAt: !445)
!452 = !DILocation(line: 63, column: 12, scope: !30, inlinedAt: !445)
!453 = !DILocation(line: 64, column: 12, scope: !30, inlinedAt: !445)
!454 = !DILocation(line: 65, column: 12, scope: !30, inlinedAt: !445)
!455 = !DILocation(line: 66, column: 12, scope: !30, inlinedAt: !445)
!456 = !DILocation(line: 67, column: 12, scope: !30, inlinedAt: !445)
!457 = !DILocation(line: 68, column: 12, scope: !30, inlinedAt: !445)
!458 = !DILocation(line: 69, column: 12, scope: !30, inlinedAt: !445)
!459 = !DILocation(line: 81, column: 6, scope: !228, inlinedAt: !445)
!460 = !DILocation(line: 83, column: 6, scope: !228, inlinedAt: !445)
!461 = !DILocation(line: 449, column: 8, scope: !124)
!462 = !DILocation(line: 85, column: 9, scope: !228, inlinedAt: !445)
!463 = distinct !{!463, !234}
!464 = distinct !{!464, !206, !207}
!465 = !DILocation(line: 91, column: 8, scope: !228, inlinedAt: !445)
!466 = distinct !{!466, !209, !206, !207}
!467 = !DILocation(line: 100, column: 9, scope: !30, inlinedAt: !445)
!468 = !DILocation(line: 455, column: 15, scope: !469)
!469 = distinct !DILexicalBlock(scope: !470, file: !1, line: 455, column: 6)
!470 = distinct !DILexicalBlock(scope: !124, file: !1, line: 453, column: 2)
!471 = !DILocation(line: 455, column: 6, scope: !470)
!472 = !DILocation(line: 457, column: 11, scope: !470)
!473 = !DILocation(line: 457, column: 3, scope: !470)
!474 = !DILocation(line: 458, column: 3, scope: !470)
!475 = !DILocation(line: 467, column: 2, scope: !124)
!476 = !DILocation(line: 468, column: 9, scope: !124)
!477 = !DILocation(line: 468, column: 29, scope: !124)
!478 = !DILocation(line: 468, column: 36, scope: !124)
!479 = !DILocation(line: 468, column: 56, scope: !124)
!480 = !DILocation(line: 468, column: 63, scope: !124)
!481 = !DILocation(line: 468, column: 84, scope: !124)
!482 = !DILocation(line: 468, column: 91, scope: !124)
!483 = !DILocation(line: 468, column: 111, scope: !124)
!484 = !DILocation(line: 468, column: 118, scope: !124)
!485 = !DILocation(line: 468, column: 138, scope: !124)
!486 = !DILocation(line: 468, column: 146, scope: !124)
!487 = !DILocation(line: 468, column: 167, scope: !124)
!488 = !DILocation(line: 468, column: 175, scope: !124)
!489 = !DILocation(line: 468, column: 197, scope: !124)
!490 = !DILocation(line: 468, column: 205, scope: !124)
!491 = !DILocation(line: 468, column: 227, scope: !124)
!492 = !DILocation(line: 468, column: 235, scope: !124)
!493 = !DILocation(line: 468, column: 256, scope: !124)
!494 = !DILocation(line: 468, column: 264, scope: !124)
!495 = !DILocation(line: 468, column: 285, scope: !124)
!496 = !DILocation(line: 468, column: 293, scope: !124)
!497 = !DILocation(line: 468, column: 315, scope: !124)
!498 = !DILocation(line: 468, column: 323, scope: !124)
!499 = !DILocation(line: 468, column: 345, scope: !124)
!500 = !DILocation(line: 468, column: 353, scope: !124)
!501 = !DILocation(line: 468, column: 374, scope: !124)
!502 = !DILocation(line: 468, column: 382, scope: !124)
!503 = !DILocation(line: 468, column: 403, scope: !124)
!504 = !DILocation(line: 468, column: 411, scope: !124)
!505 = !DILocation(line: 468, column: 432, scope: !124)
!506 = !DILocation(line: 468, column: 440, scope: !124)
!507 = !DILocation(line: 468, column: 462, scope: !124)
!508 = !DILocation(line: 468, column: 470, scope: !124)
!509 = !DILocation(line: 468, column: 492, scope: !124)
!510 = !DILocation(line: 468, column: 500, scope: !124)
!511 = !DILocation(line: 468, column: 520, scope: !124)
!512 = !DILocation(line: 468, column: 528, scope: !124)
!513 = !DILocation(line: 468, column: 549, scope: !124)
!514 = !DILocation(line: 468, column: 557, scope: !124)
!515 = !DILocation(line: 468, column: 578, scope: !124)
!516 = !DILocation(line: 468, column: 586, scope: !124)
!517 = !DILocation(line: 468, column: 607, scope: !124)
!518 = !DILocation(line: 468, column: 615, scope: !124)
!519 = !DILocation(line: 468, column: 637, scope: !124)
!520 = !DILocation(line: 468, column: 645, scope: !124)
!521 = !DILocation(line: 468, column: 667, scope: !124)
!522 = !DILocation(line: 468, column: 675, scope: !124)
!523 = !DILocation(line: 468, column: 696, scope: !124)
!524 = !DILocation(line: 468, column: 704, scope: !124)
!525 = !DILocation(line: 471, column: 2, scope: !124)
!526 = !DILocation(line: 475, column: 2, scope: !124)
!527 = !DILocation(line: 480, column: 2, scope: !124)
!528 = !DILocation(line: 481, column: 9, scope: !124)
!529 = !DILocation(line: 481, column: 29, scope: !124)
!530 = !DILocation(line: 481, column: 36, scope: !124)
!531 = !DILocation(line: 481, column: 56, scope: !124)
!532 = !DILocation(line: 481, column: 63, scope: !124)
!533 = !DILocation(line: 481, column: 84, scope: !124)
!534 = !DILocation(line: 481, column: 91, scope: !124)
!535 = !DILocation(line: 481, column: 111, scope: !124)
!536 = !DILocation(line: 481, column: 118, scope: !124)
!537 = !DILocation(line: 481, column: 138, scope: !124)
!538 = !DILocation(line: 481, column: 146, scope: !124)
!539 = !DILocation(line: 481, column: 167, scope: !124)
!540 = !DILocation(line: 481, column: 175, scope: !124)
!541 = !DILocation(line: 481, column: 197, scope: !124)
!542 = !DILocation(line: 481, column: 205, scope: !124)
!543 = !DILocation(line: 481, column: 227, scope: !124)
!544 = !DILocation(line: 481, column: 235, scope: !124)
!545 = !DILocation(line: 481, column: 256, scope: !124)
!546 = !DILocation(line: 481, column: 264, scope: !124)
!547 = !DILocation(line: 481, column: 285, scope: !124)
!548 = !DILocation(line: 481, column: 293, scope: !124)
!549 = !DILocation(line: 481, column: 315, scope: !124)
!550 = !DILocation(line: 481, column: 323, scope: !124)
!551 = !DILocation(line: 481, column: 345, scope: !124)
!552 = !DILocation(line: 481, column: 353, scope: !124)
!553 = !DILocation(line: 481, column: 374, scope: !124)
!554 = !DILocation(line: 481, column: 382, scope: !124)
!555 = !DILocation(line: 481, column: 403, scope: !124)
!556 = !DILocation(line: 481, column: 411, scope: !124)
!557 = !DILocation(line: 481, column: 432, scope: !124)
!558 = !DILocation(line: 481, column: 440, scope: !124)
!559 = !DILocation(line: 481, column: 462, scope: !124)
!560 = !DILocation(line: 481, column: 470, scope: !124)
!561 = !DILocation(line: 481, column: 492, scope: !124)
!562 = !DILocation(line: 481, column: 500, scope: !124)
!563 = !DILocation(line: 481, column: 520, scope: !124)
!564 = !DILocation(line: 481, column: 528, scope: !124)
!565 = !DILocation(line: 481, column: 549, scope: !124)
!566 = !DILocation(line: 481, column: 557, scope: !124)
!567 = !DILocation(line: 481, column: 577, scope: !124)
!568 = !DILocation(line: 481, column: 585, scope: !124)
!569 = !DILocation(line: 481, column: 607, scope: !124)
!570 = !DILocation(line: 481, column: 615, scope: !124)
!571 = !DILocation(line: 481, column: 637, scope: !124)
!572 = !DILocation(line: 481, column: 645, scope: !124)
!573 = !DILocation(line: 481, column: 666, scope: !124)
!574 = !DILocation(line: 481, column: 674, scope: !124)
!575 = !DILocation(line: 484, column: 2, scope: !124)
!576 = !DILocation(line: 488, column: 2, scope: !124)
!577 = !DILocation(line: 492, column: 2, scope: !578)
!578 = !DILexicalBlockFile(scope: !579, file: !1, discriminator: 1)
!579 = distinct !DILexicalBlock(scope: !580, file: !1, line: 492, column: 2)
!580 = distinct !DILexicalBlock(scope: !124, file: !1, line: 492, column: 2)
!581 = !DILocation(line: 493, column: 2, scope: !582)
!582 = !DILexicalBlockFile(scope: !583, file: !1, discriminator: 1)
!583 = distinct !DILexicalBlock(scope: !584, file: !1, line: 493, column: 2)
!584 = distinct !DILexicalBlock(scope: !124, file: !1, line: 493, column: 2)
!585 = !DILocation(line: 494, column: 2, scope: !586)
!586 = !DILexicalBlockFile(scope: !587, file: !1, discriminator: 1)
!587 = distinct !DILexicalBlock(scope: !588, file: !1, line: 494, column: 2)
!588 = distinct !DILexicalBlock(scope: !124, file: !1, line: 494, column: 2)
!589 = !DILocation(line: 498, column: 2, scope: !590)
!590 = !DILexicalBlockFile(scope: !591, file: !1, discriminator: 1)
!591 = distinct !DILexicalBlock(scope: !592, file: !1, line: 498, column: 2)
!592 = distinct !DILexicalBlock(scope: !124, file: !1, line: 498, column: 2)
!593 = !DILocation(line: 499, column: 2, scope: !594)
!594 = !DILexicalBlockFile(scope: !595, file: !1, discriminator: 1)
!595 = distinct !DILexicalBlock(scope: !596, file: !1, line: 499, column: 2)
!596 = distinct !DILexicalBlock(scope: !124, file: !1, line: 499, column: 2)
!597 = !DILocation(line: 500, column: 2, scope: !124)
