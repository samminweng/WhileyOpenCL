; ModuleID = 'CoinGame.c'
source_filename = "CoinGame.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [5 x i8] c"fail\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @play(%struct._IO_FILE* nocapture readnone %sys, i64* nocapture %moves, i64 %moves_size, i1 zeroext %moves_has_ownership, i64 %n) #0 !dbg !6 {
entry:
  tail call void @llvm.dbg.value(metadata %struct._IO_FILE* %sys, i64 0, metadata !75, metadata !257), !dbg !258
  tail call void @llvm.dbg.value(metadata i64* %moves, i64 0, metadata !76, metadata !257), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 %moves_size, i64 0, metadata !77, metadata !257), !dbg !259
  tail call void @llvm.dbg.value(metadata i1 %moves_has_ownership, i64 0, metadata !78, metadata !260), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 %n, i64 0, metadata !79, metadata !257), !dbg !262
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !257), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !257), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !82, metadata !257), !dbg !265
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !257), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !84, metadata !257), !dbg !267
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !257), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !257), !dbg !269
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !87, metadata !257), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !88, metadata !257), !dbg !271
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !257), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !257), !dbg !273
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !91, metadata !257), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !257), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !93, metadata !257), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !94, metadata !257), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !95, metadata !257), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !96, metadata !257), !dbg !279
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !97, metadata !257), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !257), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !99, metadata !257), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !257), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !101, metadata !257), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !257), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !103, metadata !257), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !257), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !105, metadata !257), !dbg !288
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !257), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !107, metadata !257), !dbg !290
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !257), !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !109, metadata !257), !dbg !292
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !111, metadata !257), !dbg !293
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !112, metadata !257), !dbg !293
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !113, metadata !257), !dbg !294
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !115, metadata !257), !dbg !295
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !257), !dbg !295
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !117, metadata !257), !dbg !296
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !120, metadata !257), !dbg !297
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !121, metadata !257), !dbg !297
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !122, metadata !257), !dbg !298
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !125, metadata !257), !dbg !299
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !126, metadata !257), !dbg !299
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !127, metadata !257), !dbg !300
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !128, metadata !257), !dbg !301
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !129, metadata !257), !dbg !302
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !257), !dbg !303
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !131, metadata !257), !dbg !304
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !133, metadata !257), !dbg !305
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !257), !dbg !305
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !135, metadata !257), !dbg !306
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !257), !dbg !307
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !138, metadata !257), !dbg !308
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !139, metadata !257), !dbg !308
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !140, metadata !257), !dbg !309
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !141, metadata !257), !dbg !310
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !142, metadata !257), !dbg !311
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !144, metadata !257), !dbg !312
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !145, metadata !257), !dbg !312
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !146, metadata !257), !dbg !313
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !86, metadata !257), !dbg !269
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !257), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !87, metadata !257), !dbg !270
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !88, metadata !257), !dbg !271
  tail call void @llvm.dbg.value(metadata i64 %sub, i64 0, metadata !81, metadata !257), !dbg !264
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !89, metadata !257), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !82, metadata !257), !dbg !265
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !90, metadata !257), !dbg !273
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !83, metadata !257), !dbg !266
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !91, metadata !257), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !84, metadata !257), !dbg !267
  %cmp366 = icmp sgt i64 %n, 0, !dbg !314
  br i1 %cmp366, label %if.end.lr.ph, label %if.end93, !dbg !317

if.end.lr.ph:                                     ; preds = %entry
  %sub = add nsw i64 %n, -1, !dbg !318
  br label %if.end, !dbg !317

if.end:                                           ; preds = %blklab7, %if.end.lr.ph
  %left.0376 = phi i64 [ 0, %if.end.lr.ph ], [ %left.1, %blklab7 ]
  %_59_has_ownership.0375 = phi i8 [ 0, %if.end.lr.ph ], [ %_59_has_ownership.1, %blklab7 ]
  %0 = phi i8* [ null, %if.end.lr.ph ], [ %50, %blklab7 ]
  %1 = phi i8* [ null, %if.end.lr.ph ], [ %49, %blklab7 ]
  %right.0374 = phi i64 [ %sub, %if.end.lr.ph ], [ %right.1, %blklab7 ]
  %_55_has_ownership.0373 = phi i8 [ 0, %if.end.lr.ph ], [ %_55_has_ownership.1, %blklab7 ]
  %2 = phi i8* [ null, %if.end.lr.ph ], [ %48, %blklab7 ]
  %3 = phi i8* [ null, %if.end.lr.ph ], [ %47, %blklab7 ]
  %i.0372 = phi i64 [ 0, %if.end.lr.ph ], [ %add86, %blklab7 ]
  %4 = phi i8* [ null, %if.end.lr.ph ], [ %call66, %blklab7 ]
  %sum_alice.0371 = phi i64 [ 0, %if.end.lr.ph ], [ %sum_alice.1, %blklab7 ]
  %sum_bob.0370 = phi i64 [ 0, %if.end.lr.ph ], [ %sum_bob.1, %blklab7 ]
  %_43_has_ownership.0369 = phi i1 [ false, %if.end.lr.ph ], [ true, %blklab7 ]
  %5 = phi i8* [ null, %if.end.lr.ph ], [ %call58, %blklab7 ]
  %_38_has_ownership.0368 = phi i8 [ 0, %if.end.lr.ph ], [ %_38_has_ownership.1, %blklab7 ]
  %6 = phi i8* [ null, %if.end.lr.ph ], [ %36, %blklab7 ]
  %7 = phi i8* [ null, %if.end.lr.ph ], [ %35, %blklab7 ]
  %_35_has_ownership.0367 = phi i8 [ 0, %if.end.lr.ph ], [ %_35_has_ownership.1, %blklab7 ]
  %8 = phi i8* [ null, %if.end.lr.ph ], [ %34, %blklab7 ]
  %9 = phi i8* [ null, %if.end.lr.ph ], [ %33, %blklab7 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !257), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !85, metadata !257), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !93, metadata !257), !dbg !276
  %add = add nsw i64 %left.0376, 1, !dbg !319
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !94, metadata !257), !dbg !277
  %mul = mul nsw i64 %add, %n, !dbg !320
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !95, metadata !257), !dbg !278
  %add1 = add nsw i64 %right.0374, %mul, !dbg !321
  tail call void @llvm.dbg.value(metadata i64 %add1, i64 0, metadata !96, metadata !257), !dbg !279
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %add1, !dbg !322
  %10 = load i64, i64* %arrayidx, align 8, !dbg !322, !tbaa !323
  tail call void @llvm.dbg.value(metadata i64 %10, i64 0, metadata !97, metadata !257), !dbg !280
  %mul2 = mul nsw i64 %left.0376, %n, !dbg !327
  tail call void @llvm.dbg.value(metadata i64 %mul2, i64 0, metadata !98, metadata !257), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 %add3, i64 0, metadata !99, metadata !257), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !100, metadata !257), !dbg !283
  %add3 = add i64 %mul2, -1, !dbg !328
  %sub4 = add i64 %add3, %right.0374, !dbg !329
  tail call void @llvm.dbg.value(metadata i64 %sub4, i64 0, metadata !101, metadata !257), !dbg !284
  %arrayidx5 = getelementptr inbounds i64, i64* %moves, i64 %sub4, !dbg !330
  %11 = load i64, i64* %arrayidx5, align 8, !dbg !330, !tbaa !323
  tail call void @llvm.dbg.value(metadata i64 %11, i64 0, metadata !102, metadata !257), !dbg !285
  %cmp6 = icmp sgt i64 %10, %11, !dbg !331
  tail call void @llvm.dbg.value(metadata i64 %right.1, i64 0, metadata !85, metadata !257), !dbg !268
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !105, metadata !257), !dbg !288
  %coin.0 = select i1 %cmp6, i64 %right.0374, i64 %left.0376, !dbg !333
  %sub10 = sext i1 %cmp6 to i64, !dbg !333
  %right.1 = add nsw i64 %sub10, %right.0374, !dbg !333
  %left.1 = select i1 %cmp6, i64 %left.0376, i64 %add, !dbg !333
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !107, metadata !257), !dbg !290
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !109, metadata !257), !dbg !292
  %rem360 = and i64 %i.0372, 1, !dbg !334
  %cmp11 = icmp ne i64 %rem360, 0, !dbg !334
  br i1 %cmp11, label %blklab4, label %if.end13, !dbg !336

if.end13:                                         ; preds = %if.end
  %12 = and i8 %_35_has_ownership.0367, 1, !dbg !337
  %tobool = icmp eq i8 %12, 0, !dbg !337
  br i1 %tobool, label %if.end15, label %if.then14, !dbg !339

if.then14:                                        ; preds = %if.end13
  tail call void @free(i8* %9) #6, !dbg !340
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !113, metadata !257), !dbg !294
  br label %if.end15, !dbg !340

if.end15:                                         ; preds = %if.end13, %if.then14
  tail call void @llvm.dbg.value(metadata i64 18, i64 0, metadata !112, metadata !257), !dbg !293
  %call = tail call noalias i8* @malloc(i64 144) #6, !dbg !343
  %13 = bitcast i8* %call to i64*, !dbg !343
  tail call void @llvm.dbg.value(metadata i64* %13, i64 0, metadata !111, metadata !257), !dbg !293
  %14 = bitcast i8* %call to <2 x i64>*, !dbg !344
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %14, align 8, !dbg !344, !tbaa !323
  %arrayidx18 = getelementptr inbounds i8, i8* %call, i64 16, !dbg !345
  %15 = bitcast i8* %arrayidx18 to <2 x i64>*, !dbg !346
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %15, align 8, !dbg !346, !tbaa !323
  %arrayidx20 = getelementptr inbounds i8, i8* %call, i64 32, !dbg !347
  %16 = bitcast i8* %arrayidx20 to <2 x i64>*, !dbg !348
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %16, align 8, !dbg !348, !tbaa !323
  %arrayidx22 = getelementptr inbounds i8, i8* %call, i64 48, !dbg !349
  %17 = bitcast i8* %arrayidx22 to <2 x i64>*, !dbg !350
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %17, align 8, !dbg !350, !tbaa !323
  %arrayidx24 = getelementptr inbounds i8, i8* %call, i64 64, !dbg !351
  %18 = bitcast i8* %arrayidx24 to <2 x i64>*, !dbg !352
  store <2 x i64> <i64 107, i64 101>, <2 x i64>* %18, align 8, !dbg !352, !tbaa !323
  %arrayidx26 = getelementptr inbounds i8, i8* %call, i64 80, !dbg !353
  %19 = bitcast i8* %arrayidx26 to <2 x i64>*, !dbg !354
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %19, align 8, !dbg !354, !tbaa !323
  %arrayidx28 = getelementptr inbounds i8, i8* %call, i64 96, !dbg !355
  %20 = bitcast i8* %arrayidx28 to <2 x i64>*, !dbg !356
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %20, align 8, !dbg !356, !tbaa !323
  %arrayidx30 = getelementptr inbounds i8, i8* %call, i64 112, !dbg !357
  %21 = bitcast i8* %arrayidx30 to <2 x i64>*, !dbg !358
  store <2 x i64> <i64 110, i64 32>, <2 x i64>* %21, align 8, !dbg !358, !tbaa !323
  %arrayidx32 = getelementptr inbounds i8, i8* %call, i64 128, !dbg !359
  %22 = bitcast i8* %arrayidx32 to <2 x i64>*, !dbg !360
  store <2 x i64> <i64 40, i64 32>, <2 x i64>* %22, align 8, !dbg !360, !tbaa !323
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !113, metadata !257), !dbg !294
  tail call void @printf_s(i64* %13, i64 18) #6, !dbg !361
  br label %blklab5, !dbg !362

blklab4:                                          ; preds = %if.end
  %23 = and i8 %_38_has_ownership.0368, 1, !dbg !363
  %tobool34 = icmp eq i8 %23, 0, !dbg !363
  br i1 %tobool34, label %if.end36, label %if.then35, !dbg !365

if.then35:                                        ; preds = %blklab4
  tail call void @free(i8* %7) #6, !dbg !366
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !117, metadata !257), !dbg !296
  br label %if.end36, !dbg !366

if.end36:                                         ; preds = %blklab4, %if.then35
  tail call void @llvm.dbg.value(metadata i64 16, i64 0, metadata !116, metadata !257), !dbg !295
  %call37 = tail call noalias i8* @malloc(i64 128) #6, !dbg !369
  %24 = bitcast i8* %call37 to i64*, !dbg !369
  tail call void @llvm.dbg.value(metadata i64* %24, i64 0, metadata !115, metadata !257), !dbg !295
  %25 = bitcast i8* %call37 to <2 x i64>*, !dbg !370
  store <2 x i64> <i64 66, i64 111>, <2 x i64>* %25, align 8, !dbg !370, !tbaa !323
  %arrayidx40 = getelementptr inbounds i8, i8* %call37, i64 16, !dbg !371
  %26 = bitcast i8* %arrayidx40 to <2 x i64>*, !dbg !372
  store <2 x i64> <i64 98, i64 32>, <2 x i64>* %26, align 8, !dbg !372, !tbaa !323
  %arrayidx42 = getelementptr inbounds i8, i8* %call37, i64 32, !dbg !373
  %27 = bitcast i8* %arrayidx42 to <2 x i64>*, !dbg !374
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %27, align 8, !dbg !374, !tbaa !323
  %arrayidx44 = getelementptr inbounds i8, i8* %call37, i64 48, !dbg !375
  %28 = bitcast i8* %arrayidx44 to <2 x i64>*, !dbg !376
  store <2 x i64> <i64 107, i64 101>, <2 x i64>* %28, align 8, !dbg !376, !tbaa !323
  %arrayidx46 = getelementptr inbounds i8, i8* %call37, i64 64, !dbg !377
  %29 = bitcast i8* %arrayidx46 to <2 x i64>*, !dbg !378
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %29, align 8, !dbg !378, !tbaa !323
  %arrayidx48 = getelementptr inbounds i8, i8* %call37, i64 80, !dbg !379
  %30 = bitcast i8* %arrayidx48 to <2 x i64>*, !dbg !380
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %30, align 8, !dbg !380, !tbaa !323
  %arrayidx50 = getelementptr inbounds i8, i8* %call37, i64 96, !dbg !381
  %31 = bitcast i8* %arrayidx50 to <2 x i64>*, !dbg !382
  store <2 x i64> <i64 110, i64 32>, <2 x i64>* %31, align 8, !dbg !382, !tbaa !323
  %arrayidx52 = getelementptr inbounds i8, i8* %call37, i64 112, !dbg !383
  %32 = bitcast i8* %arrayidx52 to <2 x i64>*, !dbg !384
  store <2 x i64> <i64 40, i64 32>, <2 x i64>* %32, align 8, !dbg !384, !tbaa !323
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !117, metadata !257), !dbg !296
  tail call void @printf_s(i64* %24, i64 16) #6, !dbg !385
  br label %blklab5, !dbg !385

blklab5:                                          ; preds = %if.end36, %if.end15
  %33 = phi i8* [ %9, %if.end36 ], [ %call, %if.end15 ]
  %34 = phi i8* [ %8, %if.end36 ], [ %call, %if.end15 ]
  %_35_has_ownership.1 = phi i8 [ %_35_has_ownership.0367, %if.end36 ], [ 1, %if.end15 ]
  %35 = phi i8* [ %call37, %if.end36 ], [ %7, %if.end15 ]
  %36 = phi i8* [ %call37, %if.end36 ], [ %6, %if.end15 ]
  %_38_has_ownership.1 = phi i8 [ 1, %if.end36 ], [ %_38_has_ownership.0368, %if.end15 ]
  %call54 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %i.0372), !dbg !386
  br i1 %_43_has_ownership.0369, label %if.then56, label %if.end57, !dbg !387

if.then56:                                        ; preds = %blklab5
  tail call void @free(i8* %5) #6, !dbg !388
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !122, metadata !257), !dbg !298
  br label %if.end57, !dbg !388

if.end57:                                         ; preds = %if.then56, %blklab5
  tail call void @llvm.dbg.value(metadata i64 3, i64 0, metadata !121, metadata !257), !dbg !297
  %call58 = tail call noalias i8* @malloc(i64 24) #6, !dbg !392
  %37 = bitcast i8* %call58 to i64*, !dbg !392
  tail call void @llvm.dbg.value(metadata i64* %37, i64 0, metadata !120, metadata !257), !dbg !297
  %38 = bitcast i8* %call58 to <2 x i64>*, !dbg !393
  store <2 x i64> <i64 32, i64 44>, <2 x i64>* %38, align 8, !dbg !393, !tbaa !323
  %arrayidx61 = getelementptr inbounds i8, i8* %call58, i64 16, !dbg !394
  %39 = bitcast i8* %arrayidx61 to i64*, !dbg !394
  store i64 32, i64* %39, align 8, !dbg !395, !tbaa !323
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !122, metadata !257), !dbg !298
  tail call void @printf_s(i64* %37, i64 3) #6, !dbg !396
  %call62 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i64 %coin.0), !dbg !397
  br i1 %_43_has_ownership.0369, label %if.then64, label %if.end65, !dbg !398

if.then64:                                        ; preds = %if.end57
  tail call void @free(i8* %4) #6, !dbg !399
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !127, metadata !257), !dbg !300
  br label %if.end65, !dbg !399

if.end65:                                         ; preds = %if.then64, %if.end57
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !126, metadata !257), !dbg !299
  %call66 = tail call noalias i8* @malloc(i64 16) #6, !dbg !403
  %40 = bitcast i8* %call66 to i64*, !dbg !403
  tail call void @llvm.dbg.value(metadata i64* %40, i64 0, metadata !125, metadata !257), !dbg !299
  %41 = bitcast i8* %call66 to <2 x i64>*, !dbg !404
  store <2 x i64> <i64 32, i64 41>, <2 x i64>* %41, align 8, !dbg !404, !tbaa !323
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !127, metadata !257), !dbg !300
  tail call void @printf_s(i64* %40, i64 2) #6, !dbg !405
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !128, metadata !257), !dbg !301
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !257), !dbg !303
  br i1 %cmp11, label %polly.split_new_and_old393, label %polly.split_new_and_old, !dbg !406

polly.split_new_and_old:                          ; preds = %if.end65
  %.mask = and i8 %_55_has_ownership.0373, 1
  %42 = icmp eq i8 %.mask, 0
  br i1 %42, label %if.end76, label %if.then75

if.then75:                                        ; preds = %polly.split_new_and_old
  tail call void @free(i8* %3) #6, !dbg !407
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !135, metadata !257), !dbg !306
  br label %if.end76, !dbg !407

if.end76:                                         ; preds = %polly.split_new_and_old, %if.then75
  %add73.merge = add i64 %coin.0, %sum_alice.0371
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !134, metadata !257), !dbg !305
  %call77 = tail call noalias i8* @malloc(i64 16) #6, !dbg !411
  %43 = bitcast i8* %call77 to i64*, !dbg !411
  tail call void @llvm.dbg.value(metadata i64* %43, i64 0, metadata !133, metadata !257), !dbg !305
  %44 = bitcast i8* %call77 to <2 x i64>*, !dbg !412
  store <2 x i64> <i64 44, i64 32>, <2 x i64>* %44, align 8, !dbg !412, !tbaa !323
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !135, metadata !257), !dbg !306
  tail call void @printf_s(i64* %43, i64 2) #6, !dbg !413
  br label %blklab7, !dbg !414

polly.split_new_and_old393:                       ; preds = %if.end65
  %.mask397 = and i8 %_59_has_ownership.0375, 1
  %45 = icmp eq i8 %.mask397, 0
  br i1 %45, label %if.end83, label %if.then82

if.then82:                                        ; preds = %polly.split_new_and_old393
  tail call void @free(i8* %1) #6, !dbg !415
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !140, metadata !257), !dbg !309
  br label %if.end83, !dbg !415

if.end83:                                         ; preds = %polly.split_new_and_old393, %if.then82
  %add80.merge = add i64 %coin.0, %sum_bob.0370
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !139, metadata !257), !dbg !308
  %call84 = tail call noalias i8* @malloc(i64 8) #6, !dbg !419
  %46 = bitcast i8* %call84 to i64*, !dbg !419
  tail call void @llvm.dbg.value(metadata i64* %46, i64 0, metadata !138, metadata !257), !dbg !308
  store i64 32, i64* %46, align 8, !dbg !420, !tbaa !323
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !140, metadata !257), !dbg !309
  tail call void @println_s(i64* %46, i64 1) #6, !dbg !421
  br label %blklab7, !dbg !421

blklab7:                                          ; preds = %if.end83, %if.end76
  %sum_bob.1 = phi i64 [ %add80.merge, %if.end83 ], [ %sum_bob.0370, %if.end76 ]
  %sum_alice.1 = phi i64 [ %sum_alice.0371, %if.end83 ], [ %add73.merge, %if.end76 ]
  %47 = phi i8* [ %3, %if.end83 ], [ %call77, %if.end76 ]
  %48 = phi i8* [ %2, %if.end83 ], [ %call77, %if.end76 ]
  %_55_has_ownership.1 = phi i8 [ %_55_has_ownership.0373, %if.end83 ], [ 1, %if.end76 ]
  %49 = phi i8* [ %call84, %if.end83 ], [ %1, %if.end76 ]
  %50 = phi i8* [ %call84, %if.end83 ], [ %0, %if.end76 ]
  %_59_has_ownership.1 = phi i8 [ 1, %if.end83 ], [ %_59_has_ownership.0375, %if.end76 ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !141, metadata !257), !dbg !310
  %add86 = add nuw nsw i64 %i.0372, 1, !dbg !422
  tail call void @llvm.dbg.value(metadata i64 %add86, i64 0, metadata !142, metadata !257), !dbg !311
  tail call void @llvm.dbg.value(metadata i64 %add86, i64 0, metadata !82, metadata !257), !dbg !265
  %exitcond = icmp eq i64 %add86, %n, !dbg !317
  br i1 %exitcond, label %blklab0, label %if.end, !dbg !317

blklab0:                                          ; preds = %blklab7
  %_59_has_ownership.1.lcssa = phi i8 [ %_59_has_ownership.1, %blklab7 ]
  %.lcssa429 = phi i8* [ %50, %blklab7 ]
  %_55_has_ownership.1.lcssa = phi i8 [ %_55_has_ownership.1, %blklab7 ]
  %.lcssa428 = phi i8* [ %48, %blklab7 ]
  %sum_alice.1.lcssa = phi i64 [ %sum_alice.1, %blklab7 ]
  %sum_bob.1.lcssa = phi i64 [ %sum_bob.1, %blklab7 ]
  %call66.lcssa = phi i8* [ %call66, %blklab7 ]
  %call58.lcssa = phi i8* [ %call58, %blklab7 ]
  %_38_has_ownership.1.lcssa = phi i8 [ %_38_has_ownership.1, %blklab7 ]
  %.lcssa427 = phi i8* [ %36, %blklab7 ]
  %_35_has_ownership.1.lcssa = phi i8 [ %_35_has_ownership.1, %blklab7 ]
  %.lcssa = phi i8* [ %34, %blklab7 ]
  %cmp87 = icmp slt i64 %sum_alice.1.lcssa, %sum_bob.1.lcssa, !dbg !423
  br i1 %cmp87, label %if.end89, label %if.end93, !dbg !426

if.end89:                                         ; preds = %blklab0
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !427, !tbaa !428
  %52 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %51) #7, !dbg !430
  tail call void @exit(i32 -1) #8, !dbg !431
  unreachable, !dbg !431

if.end93:                                         ; preds = %entry, %blklab0
  %.lcssa411 = phi i8* [ %.lcssa, %blklab0 ], [ null, %entry ]
  %_35_has_ownership.0.lcssa410 = phi i8 [ %_35_has_ownership.1.lcssa, %blklab0 ], [ 0, %entry ]
  %.lcssa361409 = phi i8* [ %.lcssa427, %blklab0 ], [ null, %entry ]
  %_38_has_ownership.0.lcssa408 = phi i8 [ %_38_has_ownership.1.lcssa, %blklab0 ], [ 0, %entry ]
  %.lcssa362407 = phi i8* [ %call58.lcssa, %blklab0 ], [ null, %entry ]
  %_43_has_ownership.0.lcssa406 = phi i1 [ true, %blklab0 ], [ false, %entry ]
  %sum_bob.0.lcssa405 = phi i64 [ %sum_bob.1.lcssa, %blklab0 ], [ 0, %entry ]
  %.lcssa363404 = phi i8* [ %call66.lcssa, %blklab0 ], [ null, %entry ]
  %.lcssa364403 = phi i8* [ %.lcssa428, %blklab0 ], [ null, %entry ]
  %_55_has_ownership.0.lcssa402 = phi i8 [ %_55_has_ownership.1.lcssa, %blklab0 ], [ 0, %entry ]
  %.lcssa365401 = phi i8* [ %.lcssa429, %blklab0 ], [ null, %entry ]
  %_59_has_ownership.0.lcssa400 = phi i8 [ %_59_has_ownership.1.lcssa, %blklab0 ], [ 0, %entry ]
  tail call void @llvm.dbg.value(metadata i64 48, i64 0, metadata !145, metadata !257), !dbg !312
  %call94 = tail call noalias i8* @malloc(i64 384) #6, !dbg !432
  %53 = bitcast i8* %call94 to i64*, !dbg !432
  tail call void @llvm.dbg.value(metadata i64* %53, i64 0, metadata !144, metadata !257), !dbg !312
  %54 = bitcast i8* %call94 to <2 x i64>*, !dbg !433
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %54, align 8, !dbg !433, !tbaa !323
  %arrayidx97 = getelementptr inbounds i8, i8* %call94, i64 16, !dbg !434
  %55 = bitcast i8* %arrayidx97 to <2 x i64>*, !dbg !435
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %55, align 8, !dbg !435, !tbaa !323
  %arrayidx99 = getelementptr inbounds i8, i8* %call94, i64 32, !dbg !436
  %56 = bitcast i8* %arrayidx99 to <2 x i64>*, !dbg !437
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %56, align 8, !dbg !437, !tbaa !323
  %arrayidx101 = getelementptr inbounds i8, i8* %call94, i64 48, !dbg !438
  %57 = bitcast i8* %arrayidx101 to <2 x i64>*, !dbg !439
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %57, align 8, !dbg !439, !tbaa !323
  %arrayidx103 = getelementptr inbounds i8, i8* %call94, i64 64, !dbg !440
  %58 = bitcast i8* %arrayidx103 to <2 x i64>*, !dbg !441
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %58, align 8, !dbg !441, !tbaa !323
  %arrayidx105 = getelementptr inbounds i8, i8* %call94, i64 80, !dbg !442
  %59 = bitcast i8* %arrayidx105 to <2 x i64>*, !dbg !443
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %59, align 8, !dbg !443, !tbaa !323
  %arrayidx107 = getelementptr inbounds i8, i8* %call94, i64 96, !dbg !444
  %60 = bitcast i8* %arrayidx107 to <2 x i64>*, !dbg !445
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %60, align 8, !dbg !445, !tbaa !323
  %arrayidx109 = getelementptr inbounds i8, i8* %call94, i64 112, !dbg !446
  %61 = bitcast i8* %arrayidx109 to <2 x i64>*, !dbg !447
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %61, align 8, !dbg !447, !tbaa !323
  %arrayidx111 = getelementptr inbounds i8, i8* %call94, i64 128, !dbg !448
  %62 = bitcast i8* %arrayidx111 to <2 x i64>*, !dbg !449
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %62, align 8, !dbg !449, !tbaa !323
  %arrayidx113 = getelementptr inbounds i8, i8* %call94, i64 144, !dbg !450
  %63 = bitcast i8* %arrayidx113 to <2 x i64>*, !dbg !451
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %63, align 8, !dbg !451, !tbaa !323
  %arrayidx115 = getelementptr inbounds i8, i8* %call94, i64 160, !dbg !452
  %64 = bitcast i8* %arrayidx115 to <2 x i64>*, !dbg !453
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %64, align 8, !dbg !453, !tbaa !323
  %arrayidx117 = getelementptr inbounds i8, i8* %call94, i64 176, !dbg !454
  %65 = bitcast i8* %arrayidx117 to <2 x i64>*, !dbg !455
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %65, align 8, !dbg !455, !tbaa !323
  %arrayidx119 = getelementptr inbounds i8, i8* %call94, i64 192, !dbg !456
  %66 = bitcast i8* %arrayidx119 to <2 x i64>*, !dbg !457
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %66, align 8, !dbg !457, !tbaa !323
  %arrayidx121 = getelementptr inbounds i8, i8* %call94, i64 208, !dbg !458
  %67 = bitcast i8* %arrayidx121 to <2 x i64>*, !dbg !459
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %67, align 8, !dbg !459, !tbaa !323
  %arrayidx123 = getelementptr inbounds i8, i8* %call94, i64 224, !dbg !460
  %68 = bitcast i8* %arrayidx123 to <2 x i64>*, !dbg !461
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %68, align 8, !dbg !461, !tbaa !323
  %arrayidx125 = getelementptr inbounds i8, i8* %call94, i64 240, !dbg !462
  %69 = bitcast i8* %arrayidx125 to <2 x i64>*, !dbg !463
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %69, align 8, !dbg !463, !tbaa !323
  %arrayidx127 = getelementptr inbounds i8, i8* %call94, i64 256, !dbg !464
  %70 = bitcast i8* %arrayidx127 to <2 x i64>*, !dbg !465
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %70, align 8, !dbg !465, !tbaa !323
  %arrayidx129 = getelementptr inbounds i8, i8* %call94, i64 272, !dbg !466
  %71 = bitcast i8* %arrayidx129 to <2 x i64>*, !dbg !467
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %71, align 8, !dbg !467, !tbaa !323
  %arrayidx131 = getelementptr inbounds i8, i8* %call94, i64 288, !dbg !468
  %72 = bitcast i8* %arrayidx131 to <2 x i64>*, !dbg !469
  store <2 x i64> <i64 66, i64 111>, <2 x i64>* %72, align 8, !dbg !469, !tbaa !323
  %arrayidx133 = getelementptr inbounds i8, i8* %call94, i64 304, !dbg !470
  %73 = bitcast i8* %arrayidx133 to <2 x i64>*, !dbg !471
  store <2 x i64> <i64 98, i64 32>, <2 x i64>* %73, align 8, !dbg !471, !tbaa !323
  %arrayidx135 = getelementptr inbounds i8, i8* %call94, i64 320, !dbg !472
  %74 = bitcast i8* %arrayidx135 to <2 x i64>*, !dbg !473
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %74, align 8, !dbg !473, !tbaa !323
  %arrayidx137 = getelementptr inbounds i8, i8* %call94, i64 336, !dbg !474
  %75 = bitcast i8* %arrayidx137 to <2 x i64>*, !dbg !475
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %75, align 8, !dbg !475, !tbaa !323
  %arrayidx139 = getelementptr inbounds i8, i8* %call94, i64 352, !dbg !476
  %76 = bitcast i8* %arrayidx139 to <2 x i64>*, !dbg !477
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %76, align 8, !dbg !477, !tbaa !323
  %arrayidx141 = getelementptr inbounds i8, i8* %call94, i64 368, !dbg !478
  %77 = bitcast i8* %arrayidx141 to <2 x i64>*, !dbg !479
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %77, align 8, !dbg !479, !tbaa !323
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !146, metadata !257), !dbg !313
  tail call void @printf_s(i64* %53, i64 48) #6, !dbg !480
  %call143 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i64 %sum_bob.0.lcssa405), !dbg !481
  br i1 %moves_has_ownership, label %if.then145, label %if.end146, !dbg !482

if.then145:                                       ; preds = %if.end93
  %78 = bitcast i64* %moves to i8*, !dbg !483
  tail call void @free(i8* %78) #6, !dbg !483
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !78, metadata !257), !dbg !261
  br label %if.end146, !dbg !483

if.end146:                                        ; preds = %if.then145, %if.end93
  %79 = and i8 %_35_has_ownership.0.lcssa410, 1, !dbg !487
  %tobool147 = icmp eq i8 %79, 0, !dbg !487
  br i1 %tobool147, label %if.end149, label %if.then148, !dbg !489

if.then148:                                       ; preds = %if.end146
  tail call void @free(i8* %.lcssa411) #6, !dbg !490
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !113, metadata !257), !dbg !294
  br label %if.end149, !dbg !490

if.end149:                                        ; preds = %if.end146, %if.then148
  %80 = and i8 %_38_has_ownership.0.lcssa408, 1, !dbg !493
  %tobool150 = icmp eq i8 %80, 0, !dbg !493
  br i1 %tobool150, label %if.end152, label %if.then151, !dbg !495

if.then151:                                       ; preds = %if.end149
  tail call void @free(i8* %.lcssa361409) #6, !dbg !496
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !117, metadata !257), !dbg !296
  br label %if.end152, !dbg !496

if.end152:                                        ; preds = %if.end149, %if.then151
  br i1 %_43_has_ownership.0.lcssa406, label %if.then154, label %if.end158, !dbg !499

if.then154:                                       ; preds = %if.end152
  tail call void @free(i8* %.lcssa362407) #6, !dbg !500
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !122, metadata !257), !dbg !298
  tail call void @free(i8* %.lcssa363404) #6, !dbg !504
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !127, metadata !257), !dbg !300
  br label %if.end158, !dbg !504

if.end158:                                        ; preds = %if.end152, %if.then154
  %81 = and i8 %_55_has_ownership.0.lcssa402, 1, !dbg !508
  %tobool159 = icmp eq i8 %81, 0, !dbg !508
  br i1 %tobool159, label %if.end161, label %if.then160, !dbg !510

if.then160:                                       ; preds = %if.end158
  tail call void @free(i8* %.lcssa364403) #6, !dbg !511
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !135, metadata !257), !dbg !306
  br label %if.end161, !dbg !511

if.end161:                                        ; preds = %if.end158, %if.then160
  %82 = and i8 %_59_has_ownership.0.lcssa400, 1, !dbg !514
  %tobool162 = icmp eq i8 %82, 0, !dbg !514
  br i1 %tobool162, label %if.then166, label %if.then163, !dbg !516

if.then163:                                       ; preds = %if.end161
  tail call void @free(i8* %.lcssa365401) #6, !dbg !517
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !140, metadata !257), !dbg !309
  br label %if.then166, !dbg !517

if.then166:                                       ; preds = %if.then163, %if.end161
  tail call void @free(i8* %call94) #6, !dbg !520
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !146, metadata !257), !dbg !313
  ret void, !dbg !524
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare void @printf_s(i64*, i64) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

declare void @println_s(i64*, i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define i64* @findMoves(i64* %moves, i64 %moves_size, i1 zeroext %moves_has_ownership, i64 %n) #0 !dbg !148 {
entry:
  %0 = icmp eq i64 %n, 9223372036854775807
  br i1 %0, label %while.cond1.preheader.preheader, label %polly.loop_if

while.cond1.preheader.preheader:                  ; preds = %entry
  br label %while.cond1.preheader, !dbg !525

while.cond1.preheader:                            ; preds = %while.cond1.preheader.preheader, %blklab11
  %indvars.iv = phi i64 [ %indvars.iv.next, %blklab11 ], [ 9223372036854775807, %while.cond1.preheader.preheader ]
  %s.0154 = phi i64 [ %add52, %blklab11 ], [ 0, %while.cond1.preheader.preheader ]
  br label %if.end5, !dbg !525

if.end5:                                          ; preds = %blklab15, %while.cond1.preheader
  %i.0152 = phi i64 [ 0, %while.cond1.preheader ], [ %add, %blklab15 ]
  %j.0151 = phi i64 [ %s.0154, %while.cond1.preheader ], [ %add50, %blklab15 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !167, metadata !257), !dbg !528
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !162, metadata !257), !dbg !529
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !168, metadata !257), !dbg !530
  %add = add nuw nsw i64 %i.0152, 1, !dbg !531
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !169, metadata !257), !dbg !532
  %cmp6 = icmp eq i64 %add, 9223372036854775807, !dbg !533
  %cmp9 = icmp slt i64 %j.0151, 1, !dbg !535
  %or.cond = or i1 %cmp9, %cmp6, !dbg !537
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !170, metadata !257), !dbg !538
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !172, metadata !257), !dbg !539
  br i1 %or.cond, label %blklab13, label %if.end11, !dbg !537

if.end11:                                         ; preds = %if.end5
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !173, metadata !257), !dbg !540
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !174, metadata !257), !dbg !541
  %mul = mul nsw i64 %add, 9223372036854775807, !dbg !542
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !175, metadata !257), !dbg !543
  tail call void @llvm.dbg.value(metadata i64 %add13, i64 0, metadata !176, metadata !257), !dbg !544
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !177, metadata !257), !dbg !545
  %add13 = add nsw i64 %j.0151, -1, !dbg !546
  %sub14 = add i64 %add13, %mul, !dbg !547
  tail call void @llvm.dbg.value(metadata i64 %sub14, i64 0, metadata !178, metadata !257), !dbg !548
  %arrayidx = getelementptr inbounds i64, i64* %moves, i64 %sub14, !dbg !549
  %1 = load i64, i64* %arrayidx, align 8, !dbg !549, !tbaa !323
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !179, metadata !257), !dbg !550
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !162, metadata !257), !dbg !529
  br label %blklab13, !dbg !551

blklab13:                                         ; preds = %if.end5, %if.end11
  %y.0 = phi i64 [ 0, %if.end5 ], [ %1, %if.end11 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !180, metadata !257), !dbg !552
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !163, metadata !257), !dbg !553
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !181, metadata !257), !dbg !554
  %add15 = add nuw nsw i64 %i.0152, 2, !dbg !555
  tail call void @llvm.dbg.value(metadata i64 %add15, i64 0, metadata !182, metadata !257), !dbg !556
  %cmp16 = icmp eq i64 %add15, 9223372036854775807, !dbg !557
  br i1 %cmp16, label %blklab14, label %if.end18, !dbg !559

if.end18:                                         ; preds = %blklab13
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !183, metadata !257), !dbg !560
  tail call void @llvm.dbg.value(metadata i64 %add15, i64 0, metadata !184, metadata !257), !dbg !561
  %mul20 = mul nsw i64 %add15, 9223372036854775807, !dbg !562
  tail call void @llvm.dbg.value(metadata i64 %mul20, i64 0, metadata !185, metadata !257), !dbg !563
  %add21 = add nsw i64 %mul20, %j.0151, !dbg !564
  tail call void @llvm.dbg.value(metadata i64 %add21, i64 0, metadata !186, metadata !257), !dbg !565
  %arrayidx22 = getelementptr inbounds i64, i64* %moves, i64 %add21, !dbg !566
  %2 = load i64, i64* %arrayidx22, align 8, !dbg !566, !tbaa !323
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !187, metadata !257), !dbg !567
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !163, metadata !257), !dbg !553
  br label %blklab14, !dbg !568

blklab14:                                         ; preds = %blklab13, %if.end18
  %x.0 = phi i64 [ 0, %blklab13 ], [ %2, %if.end18 ]
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !188, metadata !257), !dbg !569
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !164, metadata !257), !dbg !570
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !189, metadata !257), !dbg !571
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !191, metadata !257), !dbg !572
  %cmp24 = icmp slt i64 %j.0151, 2, !dbg !573
  %.pre = mul nsw i64 %i.0152, 9223372036854775807, !dbg !575
  br i1 %cmp24, label %blklab15, label %if.end26, !dbg !576

if.end26:                                         ; preds = %blklab14
  tail call void @llvm.dbg.value(metadata i64 %.pre, i64 0, metadata !192, metadata !257), !dbg !577
  tail call void @llvm.dbg.value(metadata i64 %add28, i64 0, metadata !193, metadata !257), !dbg !578
  tail call void @llvm.dbg.value(metadata i64 2, i64 0, metadata !194, metadata !257), !dbg !579
  %add28 = add nsw i64 %j.0151, -2, !dbg !580
  %sub29 = add i64 %add28, %.pre, !dbg !581
  tail call void @llvm.dbg.value(metadata i64 %sub29, i64 0, metadata !195, metadata !257), !dbg !582
  %arrayidx30 = getelementptr inbounds i64, i64* %moves, i64 %sub29, !dbg !583
  %3 = load i64, i64* %arrayidx30, align 8, !dbg !583, !tbaa !323
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !196, metadata !257), !dbg !584
  tail call void @llvm.dbg.value(metadata i64 %3, i64 0, metadata !164, metadata !257), !dbg !570
  br label %blklab15, !dbg !585

blklab15:                                         ; preds = %blklab14, %if.end26
  %z.0 = phi i64 [ %3, %if.end26 ], [ 0, %blklab14 ]
  %cmp31 = icmp sgt i64 %x.0, %y.0, !dbg !586
  tail call void @llvm.dbg.value(metadata i64 %y.0, i64 0, metadata !163, metadata !257), !dbg !553
  %y.0.x.0 = select i1 %cmp31, i64 %y.0, i64 %x.0, !dbg !588
  %cmp34 = icmp sgt i64 %z.0, %y.0, !dbg !589
  tail call void @llvm.dbg.value(metadata i64 %y.0, i64 0, metadata !164, metadata !257), !dbg !570
  %z.1 = select i1 %cmp34, i64 %y.0, i64 %z.0, !dbg !591
  %add37 = add nsw i64 %y.0.x.0, %i.0152, !dbg !592
  tail call void @llvm.dbg.value(metadata i64 %add37, i64 0, metadata !197, metadata !257), !dbg !593
  %add38 = add nsw i64 %z.1, %j.0151, !dbg !594
  tail call void @llvm.dbg.value(metadata i64 %add38, i64 0, metadata !198, metadata !257), !dbg !595
  %cmp39 = icmp sgt i64 %add37, %add38, !dbg !596
  %add44 = add nsw i64 %.pre, %j.0151, !dbg !598
  %arrayidx45 = getelementptr inbounds i64, i64* %moves, i64 %add44, !dbg !599
  %add37.add38 = select i1 %cmp39, i64 %add37, i64 %add38, !dbg !600
  store i64 %add37.add38, i64* %arrayidx45, align 8, !dbg !601, !tbaa !323
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !205, metadata !257), !dbg !602
  %add50 = add nuw nsw i64 %j.0151, 1, !dbg !603
  tail call void @llvm.dbg.value(metadata i64 %add50, i64 0, metadata !206, metadata !257), !dbg !604
  tail call void @llvm.dbg.value(metadata i64 %add50, i64 0, metadata !160, metadata !257), !dbg !605
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !207, metadata !257), !dbg !606
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !208, metadata !257), !dbg !607
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !161, metadata !257), !dbg !608
  %exitcond = icmp eq i64 %add, %indvars.iv, !dbg !525
  br i1 %exitcond, label %blklab11, label %if.end5, !dbg !525

blklab11:                                         ; preds = %blklab15
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !209, metadata !257), !dbg !609
  %add52 = add nuw nsw i64 %s.0154, 1, !dbg !610
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !210, metadata !257), !dbg !611
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !159, metadata !257), !dbg !612
  %indvars.iv.next = add i64 %indvars.iv, -1, !dbg !613
  %exitcond155 = icmp eq i64 %add52, 9223372036854775807, !dbg !613
  br i1 %exitcond155, label %if.end54.loopexit, label %while.cond1.preheader, !dbg !613

if.end54.loopexit:                                ; preds = %blklab11
  br label %if.end54, !dbg !614

if.end54.loopexit211:                             ; preds = %polly.loop_exit159
  br label %if.end54, !dbg !614

if.end54:                                         ; preds = %if.end54.loopexit211, %if.end54.loopexit, %polly.loop_if
  ret i64* %moves, !dbg !614

polly.loop_if:                                    ; preds = %entry
  %cmp153 = icmp sgt i64 %n, 0, !dbg !615
  br i1 %cmp153, label %polly.loop_preheader, label %if.end54

polly.loop_header:                                ; preds = %polly.loop_exit159, %polly.loop_preheader
  %polly.indvar = phi i64 [ 0, %polly.loop_preheader ], [ %polly.indvar_next, %polly.loop_exit159 ]
  %4 = sub nsw i64 %n, %polly.indvar
  %polly.loop_guard160 = icmp sgt i64 %4, 0
  br i1 %polly.loop_guard160, label %polly.loop_preheader158, label %polly.loop_exit159

polly.loop_exit159.loopexit:                      ; preds = %polly.merge169.us
  br label %polly.loop_exit159

polly.loop_exit159.loopexit210:                   ; preds = %polly.merge169
  br label %polly.loop_exit159

polly.loop_exit159:                               ; preds = %polly.loop_exit159.loopexit210, %polly.loop_exit159.loopexit, %polly.loop_header
  %polly.indvar_next = add nuw nsw i64 %polly.indvar, 1
  %exitcond205 = icmp eq i64 %polly.indvar_next, %n
  br i1 %exitcond205, label %if.end54.loopexit211, label %polly.loop_header

polly.loop_preheader:                             ; preds = %polly.loop_if
  %5 = add i64 %n, -1
  %scevgep = getelementptr i64, i64* %moves, i64 %5
  %6 = shl i64 %n, 3
  %7 = add i64 %6, 8
  %8 = shl i64 %n, 1
  %scevgep176 = getelementptr i64, i64* %moves, i64 %8
  %scevgep186 = getelementptr i64, i64* %moves, i64 -2
  %9 = icmp sgt i64 %n, 2
  %10 = icmp eq i64 %n, 2
  br label %polly.loop_header

polly.loop_header157:                             ; preds = %polly.loop_header157.preheader, %polly.merge169
  %polly.indvar161 = phi i64 [ %20, %polly.merge169 ], [ 0, %polly.loop_header157.preheader ]
  %11 = add nsw i64 %polly.indvar161, 2
  %12 = icmp sle i64 %11, %n
  %13 = add i64 %polly.indvar161, %polly.indvar
  %14 = icmp sgt i64 %13, 0
  %15 = and i1 %12, %14
  br i1 %15, label %polly.cond168.thread, label %polly.cond168

polly.cond168:                                    ; preds = %polly.loop_header157
  %16 = icmp eq i64 %polly.indvar161, 0
  %17 = add nsw i64 %polly.indvar161, 1
  %18 = icmp eq i64 %17, %n
  %19 = or i1 %18, %16
  br i1 %19, label %polly.cond172, label %polly.merge169

polly.merge169:                                   ; preds = %polly.cond192, %polly.cond168, %polly.stmt.blklab15
  %20 = phi i64 [ %54, %polly.cond192 ], [ %17, %polly.cond168 ], [ %54, %polly.stmt.blklab15 ]
  %polly.loop_cond164 = icmp slt i64 %polly.indvar161, %polly.adjust_ub163
  br i1 %polly.loop_cond164, label %polly.loop_header157, label %polly.loop_exit159.loopexit210

polly.loop_preheader158:                          ; preds = %polly.loop_header
  %scevgep165 = getelementptr i64, i64* %scevgep, i64 %polly.indvar
  %scevgep165166 = bitcast i64* %scevgep165 to i8*
  %scevgep177 = getelementptr i64, i64* %scevgep176, i64 %polly.indvar
  %scevgep177178 = bitcast i64* %scevgep177 to i8*
  %scevgep187 = getelementptr i64, i64* %scevgep186, i64 %polly.indvar
  %scevgep187188 = bitcast i64* %scevgep187 to i8*
  %scevgep197 = getelementptr i64, i64* %moves, i64 %polly.indvar
  %scevgep197198 = bitcast i64* %scevgep197 to i8*
  %21 = add nsw i64 %polly.indvar, %n
  %22 = icmp sgt i64 %21, 2
  %polly.adjust_ub163 = add i64 %4, -1
  br i1 %9, label %polly.loop_header157.us.preheader, label %polly.loop_header157.preheader

polly.loop_header157.preheader:                   ; preds = %polly.loop_preheader158
  br label %polly.loop_header157

polly.loop_header157.us.preheader:                ; preds = %polly.loop_preheader158
  br label %polly.loop_header157.us

polly.loop_header157.us:                          ; preds = %polly.loop_header157.us.preheader, %polly.merge169.us
  %polly.indvar161.us = phi i64 [ %50, %polly.merge169.us ], [ 0, %polly.loop_header157.us.preheader ]
  %23 = add nsw i64 %polly.indvar161.us, 2
  %24 = icmp sle i64 %23, %n
  %25 = add i64 %polly.indvar161.us, %polly.indvar
  %26 = icmp sgt i64 %25, 0
  %27 = and i1 %24, %26
  br i1 %27, label %polly.cond168.thread.us, label %polly.cond168.us

polly.cond168.us:                                 ; preds = %polly.loop_header157.us
  %28 = icmp eq i64 %polly.indvar161.us, 0
  %29 = add nsw i64 %polly.indvar161.us, 1
  %30 = icmp eq i64 %29, %n
  %31 = or i1 %30, %28
  br i1 %31, label %polly.cond172.us, label %polly.merge169.us

polly.cond168.thread.us:                          ; preds = %polly.loop_header157.us
  %32 = mul i64 %polly.indvar161.us, %7
  %uglygep.us = getelementptr i8, i8* %scevgep165166, i64 %32
  %uglygep167.us = bitcast i8* %uglygep.us to i64*
  %_p_scalar_.us = load i64, i64* %uglygep167.us, align 8, !alias.scope !617, !noalias !619
  %33 = icmp eq i64 %polly.indvar161.us, 0
  %34 = add nsw i64 %polly.indvar161.us, 1
  br label %polly.cond172.us

polly.cond172.us:                                 ; preds = %polly.cond168.thread.us, %polly.cond168.us
  %35 = phi i64 [ %34, %polly.cond168.thread.us ], [ %29, %polly.cond168.us ]
  %36 = phi i1 [ %33, %polly.cond168.thread.us ], [ %28, %polly.cond168.us ]
  %y.0.phiops.0201.us = phi i64 [ %_p_scalar_.us, %polly.cond168.thread.us ], [ 0, %polly.cond168.us ]
  %37 = add nsw i64 %polly.indvar161.us, 3
  %38 = icmp sle i64 %37, %n
  %39 = and i1 %38, %26
  %40 = or i64 %polly.indvar161.us, %polly.indvar
  %41 = icmp eq i64 %40, 0
  %42 = or i1 %39, %41
  br i1 %42, label %polly.stmt.if.end18.us, label %polly.cond182.us

polly.stmt.if.end18.us:                           ; preds = %polly.cond172.us
  %43 = mul i64 %polly.indvar161.us, %7
  %uglygep179.us = getelementptr i8, i8* %scevgep177178, i64 %43
  %uglygep179180.us = bitcast i8* %uglygep179.us to i64*
  %_p_scalar_181.us = load i64, i64* %uglygep179180.us, align 8, !alias.scope !617, !noalias !619
  br label %polly.cond182.us

polly.cond182.us:                                 ; preds = %polly.stmt.if.end18.us, %polly.cond172.us
  %x.0.phiops.0.us = phi i64 [ %_p_scalar_181.us, %polly.stmt.if.end18.us ], [ 0, %polly.cond172.us ]
  %44 = icmp sgt i64 %25, 1
  br i1 %44, label %polly.stmt.if.end26.us, label %polly.cond192.us

polly.stmt.if.end26.us:                           ; preds = %polly.cond182.us
  %45 = mul i64 %polly.indvar161.us, %7
  %uglygep189.us = getelementptr i8, i8* %scevgep187188, i64 %45
  %uglygep189190.us = bitcast i8* %uglygep189.us to i64*
  %_p_scalar_191.us = load i64, i64* %uglygep189190.us, align 8, !alias.scope !617, !noalias !619
  br label %polly.cond192.us

polly.cond192.us:                                 ; preds = %polly.stmt.if.end26.us, %polly.cond182.us
  %z.0.phiops.0.us = phi i64 [ %_p_scalar_191.us, %polly.stmt.if.end26.us ], [ 0, %polly.cond182.us ]
  %46 = and i1 %22, %26
  %47 = or i1 %46, %36
  %48 = or i1 %10, %47
  br i1 %48, label %polly.stmt.blklab15.us, label %polly.merge169.us

polly.stmt.blklab15.us:                           ; preds = %polly.cond192.us
  %p_cmp31.us = icmp sgt i64 %x.0.phiops.0.us, %y.0.phiops.0201.us, !dbg !586
  %p_y.0.x.0.us = select i1 %p_cmp31.us, i64 %y.0.phiops.0201.us, i64 %x.0.phiops.0.us, !dbg !588
  %p_cmp34.us = icmp sgt i64 %z.0.phiops.0.us, %y.0.phiops.0201.us, !dbg !589
  %p_z.1.us = select i1 %p_cmp34.us, i64 %y.0.phiops.0201.us, i64 %z.0.phiops.0.us, !dbg !591
  %p_add37.us = add nsw i64 %p_y.0.x.0.us, %polly.indvar161.us, !dbg !592
  %p_add38.us = add nsw i64 %25, %p_z.1.us, !dbg !594
  %p_cmp39.us = icmp sgt i64 %p_add37.us, %p_add38.us, !dbg !596
  %p_add37.p_add38.us = select i1 %p_cmp39.us, i64 %p_add37.us, i64 %p_add38.us, !dbg !600
  %49 = mul i64 %polly.indvar161.us, %7
  %uglygep199.us = getelementptr i8, i8* %scevgep197198, i64 %49
  %uglygep199200.us = bitcast i8* %uglygep199.us to i64*
  store i64 %p_add37.p_add38.us, i64* %uglygep199200.us, align 8, !alias.scope !617, !noalias !619
  br label %polly.merge169.us

polly.merge169.us:                                ; preds = %polly.stmt.blklab15.us, %polly.cond192.us, %polly.cond168.us
  %50 = phi i64 [ %35, %polly.cond192.us ], [ %29, %polly.cond168.us ], [ %35, %polly.stmt.blklab15.us ]
  %polly.loop_cond164.us = icmp slt i64 %polly.indvar161.us, %polly.adjust_ub163
  br i1 %polly.loop_cond164.us, label %polly.loop_header157.us, label %polly.loop_exit159.loopexit

polly.cond168.thread:                             ; preds = %polly.loop_header157
  %51 = mul i64 %polly.indvar161, %7
  %uglygep = getelementptr i8, i8* %scevgep165166, i64 %51
  %uglygep167 = bitcast i8* %uglygep to i64*
  %_p_scalar_ = load i64, i64* %uglygep167, align 8, !alias.scope !617, !noalias !619
  %52 = icmp eq i64 %polly.indvar161, 0
  %53 = add nsw i64 %polly.indvar161, 1
  br label %polly.cond172

polly.cond172:                                    ; preds = %polly.cond168.thread, %polly.cond168
  %54 = phi i64 [ %53, %polly.cond168.thread ], [ %17, %polly.cond168 ]
  %55 = phi i1 [ %52, %polly.cond168.thread ], [ %16, %polly.cond168 ]
  %y.0.phiops.0201 = phi i64 [ %_p_scalar_, %polly.cond168.thread ], [ 0, %polly.cond168 ]
  %56 = add nsw i64 %polly.indvar161, 3
  %57 = icmp sle i64 %56, %n
  %58 = and i1 %57, %14
  br i1 %58, label %polly.stmt.if.end18, label %polly.cond182

polly.cond182:                                    ; preds = %polly.cond172, %polly.stmt.if.end18
  %x.0.phiops.0 = phi i64 [ %_p_scalar_181, %polly.stmt.if.end18 ], [ 0, %polly.cond172 ]
  %59 = icmp sgt i64 %13, 1
  br i1 %59, label %polly.stmt.if.end26, label %polly.cond192

polly.cond192:                                    ; preds = %polly.cond182, %polly.stmt.if.end26
  %z.0.phiops.0 = phi i64 [ %_p_scalar_191, %polly.stmt.if.end26 ], [ 0, %polly.cond182 ]
  %60 = and i1 %22, %14
  %61 = or i1 %60, %55
  %62 = or i1 %10, %61
  br i1 %62, label %polly.stmt.blklab15, label %polly.merge169

polly.stmt.if.end18:                              ; preds = %polly.cond172
  %63 = mul i64 %polly.indvar161, %7
  %uglygep179 = getelementptr i8, i8* %scevgep177178, i64 %63
  %uglygep179180 = bitcast i8* %uglygep179 to i64*
  %_p_scalar_181 = load i64, i64* %uglygep179180, align 8, !alias.scope !617, !noalias !619
  br label %polly.cond182

polly.stmt.if.end26:                              ; preds = %polly.cond182
  %64 = mul i64 %polly.indvar161, %7
  %uglygep189 = getelementptr i8, i8* %scevgep187188, i64 %64
  %uglygep189190 = bitcast i8* %uglygep189 to i64*
  %_p_scalar_191 = load i64, i64* %uglygep189190, align 8, !alias.scope !617, !noalias !619
  br label %polly.cond192

polly.stmt.blklab15:                              ; preds = %polly.cond192
  %p_cmp31 = icmp sgt i64 %x.0.phiops.0, %y.0.phiops.0201, !dbg !586
  %p_y.0.x.0 = select i1 %p_cmp31, i64 %y.0.phiops.0201, i64 %x.0.phiops.0, !dbg !588
  %p_cmp34 = icmp sgt i64 %z.0.phiops.0, %y.0.phiops.0201, !dbg !589
  %p_z.1 = select i1 %p_cmp34, i64 %y.0.phiops.0201, i64 %z.0.phiops.0, !dbg !591
  %p_add37 = add nsw i64 %p_y.0.x.0, %polly.indvar161, !dbg !592
  %p_add38 = add nsw i64 %13, %p_z.1, !dbg !594
  %p_cmp39 = icmp sgt i64 %p_add37, %p_add38, !dbg !596
  %p_add37.p_add38 = select i1 %p_cmp39, i64 %p_add37, i64 %p_add38, !dbg !600
  %65 = mul i64 %polly.indvar161, %7
  %uglygep199 = getelementptr i8, i8* %scevgep197198, i64 %65
  %uglygep199200 = bitcast i8* %uglygep199 to i64*
  store i64 %p_add37.p_add38, i64* %uglygep199200, align 8, !alias.scope !617, !noalias !619
  br label %polly.merge169
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #4 !dbg !211 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !216, metadata !257), !dbg !624
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !217, metadata !257), !dbg !625
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !219, metadata !257), !dbg !626
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !220, metadata !257), !dbg !627
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !221, metadata !257), !dbg !627
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !222, metadata !257), !dbg !628
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !223, metadata !257), !dbg !629
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !225, metadata !257), !dbg !630
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !227, metadata !257), !dbg !630
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !228, metadata !257), !dbg !630
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !229, metadata !257), !dbg !631
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !230, metadata !257), !dbg !632
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !231, metadata !257), !dbg !633
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !232, metadata !257), !dbg !633
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !233, metadata !257), !dbg !634
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !234, metadata !257), !dbg !635
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !235, metadata !257), !dbg !636
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !236, metadata !257), !dbg !637
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !237, metadata !257), !dbg !637
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !238, metadata !257), !dbg !638
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !239, metadata !257), !dbg !639
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !240, metadata !257), !dbg !639
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !241, metadata !257), !dbg !640
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !242, metadata !257), !dbg !641
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !243, metadata !257), !dbg !642
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !244, metadata !257), !dbg !643
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !246, metadata !257), !dbg !644
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !247, metadata !257), !dbg !644
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !248, metadata !257), !dbg !645
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !251, metadata !257), !dbg !646
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !252, metadata !257), !dbg !646
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !253, metadata !257), !dbg !647
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #6, !dbg !648
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !225, metadata !257), !dbg !630
  %sub = add nsw i32 %argc, -1, !dbg !648
  %conv = sext i32 %sub to i64, !dbg !648
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !227, metadata !257), !dbg !630
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !229, metadata !257), !dbg !631
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !230, metadata !257), !dbg !632
  %0 = load i64*, i64** %call, align 8, !dbg !649, !tbaa !428
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !231, metadata !257), !dbg !633
  %call1 = tail call i64* @parseStringToInt(i64* %0) #6, !dbg !650
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !224, metadata !257), !dbg !651
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !218, metadata !257), !dbg !652
  %cmp = icmp eq i64* %call1, null, !dbg !653
  br i1 %cmp, label %if.end122.critedge, label %if.then103, !dbg !655

if.then103:                                       ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !656, !tbaa !323
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !219, metadata !257), !dbg !626
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !234, metadata !257), !dbg !635
  %mul = mul nsw i64 %1, %1, !dbg !657
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !235, metadata !257), !dbg !636
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !237, metadata !257), !dbg !637
  %conv6 = trunc i64 %mul to i32, !dbg !658
  %call7 = tail call i64* @gen1DArray(i32 0, i32 %conv6) #6, !dbg !658
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !236, metadata !257), !dbg !637
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !238, metadata !257), !dbg !638
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !221, metadata !257), !dbg !627
  tail call void @llvm.dbg.value(metadata i64* %call7, i64 0, metadata !220, metadata !257), !dbg !627
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !222, metadata !257), !dbg !628
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !238, metadata !257), !dbg !638
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !222, metadata !257), !dbg !628
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !240, metadata !257), !dbg !639
  %call14 = tail call i64* @findMoves(i64* %call7, i64 undef, i1 zeroext undef, i64 %1), !dbg !659
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !239, metadata !257), !dbg !639
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !241, metadata !257), !dbg !640
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !221, metadata !257), !dbg !627
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !220, metadata !257), !dbg !627
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !222, metadata !257), !dbg !628
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !241, metadata !257), !dbg !640
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !242, metadata !257), !dbg !641
  %sub18 = add nsw i64 %1, -1, !dbg !660
  tail call void @llvm.dbg.value(metadata i64 %sub18, i64 0, metadata !243, metadata !257), !dbg !642
  %arrayidx19 = getelementptr inbounds i64, i64* %call14, i64 %sub18, !dbg !661
  %2 = load i64, i64* %arrayidx19, align 8, !dbg !661, !tbaa !323
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !244, metadata !257), !dbg !643
  tail call void @llvm.dbg.value(metadata i64 %2, i64 0, metadata !223, metadata !257), !dbg !629
  tail call void @llvm.dbg.value(metadata i64 50, i64 0, metadata !247, metadata !257), !dbg !644
  %call23 = tail call noalias i8* @malloc(i64 400) #6, !dbg !662
  %3 = bitcast i8* %call23 to i64*, !dbg !662
  tail call void @llvm.dbg.value(metadata i64* %3, i64 0, metadata !246, metadata !257), !dbg !644
  %4 = bitcast i8* %call23 to <2 x i64>*, !dbg !663
  store <2 x i64> <i64 84, i64 104>, <2 x i64>* %4, align 8, !dbg !663, !tbaa !323
  %arrayidx26 = getelementptr inbounds i8, i8* %call23, i64 16, !dbg !664
  %5 = bitcast i8* %arrayidx26 to <2 x i64>*, !dbg !665
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %5, align 8, !dbg !665, !tbaa !323
  %arrayidx28 = getelementptr inbounds i8, i8* %call23, i64 32, !dbg !666
  %6 = bitcast i8* %arrayidx28 to <2 x i64>*, !dbg !667
  store <2 x i64> <i64 116, i64 111>, <2 x i64>* %6, align 8, !dbg !667, !tbaa !323
  %arrayidx30 = getelementptr inbounds i8, i8* %call23, i64 48, !dbg !668
  %7 = bitcast i8* %arrayidx30 to <2 x i64>*, !dbg !669
  store <2 x i64> <i64 116, i64 97>, <2 x i64>* %7, align 8, !dbg !669, !tbaa !323
  %arrayidx32 = getelementptr inbounds i8, i8* %call23, i64 64, !dbg !670
  %8 = bitcast i8* %arrayidx32 to <2 x i64>*, !dbg !671
  store <2 x i64> <i64 108, i64 32>, <2 x i64>* %8, align 8, !dbg !671, !tbaa !323
  %arrayidx34 = getelementptr inbounds i8, i8* %call23, i64 80, !dbg !672
  %9 = bitcast i8* %arrayidx34 to <2 x i64>*, !dbg !673
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %9, align 8, !dbg !673, !tbaa !323
  %arrayidx36 = getelementptr inbounds i8, i8* %call23, i64 96, !dbg !674
  %10 = bitcast i8* %arrayidx36 to <2 x i64>*, !dbg !675
  store <2 x i64> <i64 111, i64 117>, <2 x i64>* %10, align 8, !dbg !675, !tbaa !323
  %arrayidx38 = getelementptr inbounds i8, i8* %call23, i64 112, !dbg !676
  %11 = bitcast i8* %arrayidx38 to <2 x i64>*, !dbg !677
  store <2 x i64> <i64 110, i64 116>, <2 x i64>* %11, align 8, !dbg !677, !tbaa !323
  %arrayidx40 = getelementptr inbounds i8, i8* %call23, i64 128, !dbg !678
  %12 = bitcast i8* %arrayidx40 to <2 x i64>*, !dbg !679
  store <2 x i64> <i64 32, i64 111>, <2 x i64>* %12, align 8, !dbg !679, !tbaa !323
  %arrayidx42 = getelementptr inbounds i8, i8* %call23, i64 144, !dbg !680
  %13 = bitcast i8* %arrayidx42 to <2 x i64>*, !dbg !681
  store <2 x i64> <i64 102, i64 32>, <2 x i64>* %13, align 8, !dbg !681, !tbaa !323
  %arrayidx44 = getelementptr inbounds i8, i8* %call23, i64 160, !dbg !682
  %14 = bitcast i8* %arrayidx44 to <2 x i64>*, !dbg !683
  store <2 x i64> <i64 109, i64 111>, <2 x i64>* %14, align 8, !dbg !683, !tbaa !323
  %arrayidx46 = getelementptr inbounds i8, i8* %call23, i64 176, !dbg !684
  %15 = bitcast i8* %arrayidx46 to <2 x i64>*, !dbg !685
  store <2 x i64> <i64 110, i64 101>, <2 x i64>* %15, align 8, !dbg !685, !tbaa !323
  %arrayidx48 = getelementptr inbounds i8, i8* %call23, i64 192, !dbg !686
  %16 = bitcast i8* %arrayidx48 to <2 x i64>*, !dbg !687
  store <2 x i64> <i64 121, i64 32>, <2 x i64>* %16, align 8, !dbg !687, !tbaa !323
  %arrayidx50 = getelementptr inbounds i8, i8* %call23, i64 208, !dbg !688
  %17 = bitcast i8* %arrayidx50 to <2 x i64>*, !dbg !689
  store <2 x i64> <i64 40, i64 109>, <2 x i64>* %17, align 8, !dbg !689, !tbaa !323
  %arrayidx52 = getelementptr inbounds i8, i8* %call23, i64 224, !dbg !690
  %18 = bitcast i8* %arrayidx52 to <2 x i64>*, !dbg !691
  store <2 x i64> <i64 97, i64 120>, <2 x i64>* %18, align 8, !dbg !691, !tbaa !323
  %arrayidx54 = getelementptr inbounds i8, i8* %call23, i64 240, !dbg !692
  %19 = bitcast i8* %arrayidx54 to <2 x i64>*, !dbg !693
  store <2 x i64> <i64 105, i64 109>, <2 x i64>* %19, align 8, !dbg !693, !tbaa !323
  %arrayidx56 = getelementptr inbounds i8, i8* %call23, i64 256, !dbg !694
  %20 = bitcast i8* %arrayidx56 to <2 x i64>*, !dbg !695
  store <2 x i64> <i64 117, i64 109>, <2 x i64>* %20, align 8, !dbg !695, !tbaa !323
  %arrayidx58 = getelementptr inbounds i8, i8* %call23, i64 272, !dbg !696
  %21 = bitcast i8* %arrayidx58 to <2 x i64>*, !dbg !697
  store <2 x i64> <i64 41, i64 32>, <2 x i64>* %21, align 8, !dbg !697, !tbaa !323
  %arrayidx60 = getelementptr inbounds i8, i8* %call23, i64 288, !dbg !698
  %22 = bitcast i8* %arrayidx60 to <2 x i64>*, !dbg !699
  store <2 x i64> <i64 65, i64 108>, <2 x i64>* %22, align 8, !dbg !699, !tbaa !323
  %arrayidx62 = getelementptr inbounds i8, i8* %call23, i64 304, !dbg !700
  %23 = bitcast i8* %arrayidx62 to <2 x i64>*, !dbg !701
  store <2 x i64> <i64 105, i64 99>, <2 x i64>* %23, align 8, !dbg !701, !tbaa !323
  %arrayidx64 = getelementptr inbounds i8, i8* %call23, i64 320, !dbg !702
  %24 = bitcast i8* %arrayidx64 to <2 x i64>*, !dbg !703
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %24, align 8, !dbg !703, !tbaa !323
  %arrayidx66 = getelementptr inbounds i8, i8* %call23, i64 336, !dbg !704
  %25 = bitcast i8* %arrayidx66 to <2 x i64>*, !dbg !705
  store <2 x i64> <i64 103, i64 101>, <2 x i64>* %25, align 8, !dbg !705, !tbaa !323
  %arrayidx68 = getelementptr inbounds i8, i8* %call23, i64 352, !dbg !706
  %26 = bitcast i8* %arrayidx68 to <2 x i64>*, !dbg !707
  store <2 x i64> <i64 116, i64 115>, <2 x i64>* %26, align 8, !dbg !707, !tbaa !323
  %arrayidx70 = getelementptr inbounds i8, i8* %call23, i64 368, !dbg !708
  %27 = bitcast i8* %arrayidx70 to <2 x i64>*, !dbg !709
  store <2 x i64> <i64 32, i64 105>, <2 x i64>* %27, align 8, !dbg !709, !tbaa !323
  %arrayidx72 = getelementptr inbounds i8, i8* %call23, i64 384, !dbg !710
  %28 = bitcast i8* %arrayidx72 to <2 x i64>*, !dbg !711
  store <2 x i64> <i64 115, i64 32>, <2 x i64>* %28, align 8, !dbg !711, !tbaa !323
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !248, metadata !257), !dbg !645
  tail call void @printf_s(i64* %3, i64 50) #6, !dbg !712
  %call74 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i64 %2), !dbg !713
  tail call void @llvm.dbg.value(metadata i64 23, i64 0, metadata !252, metadata !257), !dbg !646
  %call78 = tail call noalias i8* @malloc(i64 184) #6, !dbg !714
  %29 = bitcast i8* %call78 to i64*, !dbg !714
  tail call void @llvm.dbg.value(metadata i64* %29, i64 0, metadata !251, metadata !257), !dbg !646
  %30 = bitcast i8* %call78 to <2 x i64>*, !dbg !715
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %30, align 8, !dbg !715, !tbaa !323
  %arrayidx81 = getelementptr inbounds i8, i8* %call78, i64 16, !dbg !716
  %31 = bitcast i8* %arrayidx81 to <2 x i64>*, !dbg !717
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %31, align 8, !dbg !717, !tbaa !323
  %arrayidx83 = getelementptr inbounds i8, i8* %call78, i64 32, !dbg !718
  %32 = bitcast i8* %arrayidx83 to <2 x i64>*, !dbg !719
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %32, align 8, !dbg !719, !tbaa !323
  %arrayidx85 = getelementptr inbounds i8, i8* %call78, i64 48, !dbg !720
  %33 = bitcast i8* %arrayidx85 to <2 x i64>*, !dbg !721
  store <2 x i64> <i64 111, i64 105>, <2 x i64>* %33, align 8, !dbg !721, !tbaa !323
  %arrayidx87 = getelementptr inbounds i8, i8* %call78, i64 64, !dbg !722
  %34 = bitcast i8* %arrayidx87 to <2 x i64>*, !dbg !723
  store <2 x i64> <i64 110, i64 71>, <2 x i64>* %34, align 8, !dbg !723, !tbaa !323
  %arrayidx89 = getelementptr inbounds i8, i8* %call78, i64 80, !dbg !724
  %35 = bitcast i8* %arrayidx89 to <2 x i64>*, !dbg !725
  store <2 x i64> <i64 97, i64 109>, <2 x i64>* %35, align 8, !dbg !725, !tbaa !323
  %arrayidx91 = getelementptr inbounds i8, i8* %call78, i64 96, !dbg !726
  %36 = bitcast i8* %arrayidx91 to <2 x i64>*, !dbg !727
  store <2 x i64> <i64 101, i64 32>, <2 x i64>* %36, align 8, !dbg !727, !tbaa !323
  %arrayidx93 = getelementptr inbounds i8, i8* %call78, i64 112, !dbg !728
  %37 = bitcast i8* %arrayidx93 to <2 x i64>*, !dbg !729
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %37, align 8, !dbg !729, !tbaa !323
  %arrayidx95 = getelementptr inbounds i8, i8* %call78, i64 128, !dbg !730
  %38 = bitcast i8* %arrayidx95 to <2 x i64>*, !dbg !731
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %38, align 8, !dbg !731, !tbaa !323
  %arrayidx97 = getelementptr inbounds i8, i8* %call78, i64 144, !dbg !732
  %39 = bitcast i8* %arrayidx97 to <2 x i64>*, !dbg !733
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %39, align 8, !dbg !733, !tbaa !323
  %arrayidx99 = getelementptr inbounds i8, i8* %call78, i64 160, !dbg !734
  %40 = bitcast i8* %arrayidx99 to <2 x i64>*, !dbg !735
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %40, align 8, !dbg !735, !tbaa !323
  %arrayidx101 = getelementptr inbounds i8, i8* %call78, i64 176, !dbg !736
  %41 = bitcast i8* %arrayidx101 to i64*, !dbg !736
  store i64 101, i64* %41, align 8, !dbg !737, !tbaa !323
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !253, metadata !257), !dbg !647
  tail call void @println_s(i64* %29, i64 23) #6, !dbg !738
  %phitmp = bitcast i64* %call14 to i8*, !dbg !738
  tail call void @free(i8* %phitmp) #6, !dbg !739
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !222, metadata !257), !dbg !628
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !743
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !229, metadata !257), !dbg !631
  tail call void @free(i8* %call23) #6, !dbg !747
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !248, metadata !257), !dbg !645
  tail call void @free(i8* %call78) #6, !dbg !751
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !253, metadata !257), !dbg !647
  br label %if.end122, !dbg !751

if.end122.critedge:                               ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #6, !dbg !743
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !229, metadata !257), !dbg !631
  br label %if.end122

if.end122:                                        ; preds = %if.end122.critedge, %if.then103
  tail call void @exit(i32 0) #8, !dbg !755
  unreachable, !dbg !755
}

declare i64** @convertArgsToIntArray(i32, i8**) #2

declare i64* @parseStringToInt(i64*) #2

declare i64* @gen1DArray(i32, i32) #2

declare void @free2DArray(i64**, i64) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #5

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #6

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { cold }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!254, !255}
!llvm.ident = !{!256}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "CoinGame.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !148, !211}
!6 = distinct !DISubprogram(name: "play", scope: !1, file: !1, line: 2, type: !7, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, variables: !74)
!7 = !DISubroutineType(types: !8)
!8 = !{null, !9, !71, !72, !73, !72}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !11, line: 48, baseType: !12)
!11 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate")
!12 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !13, line: 245, size: 1728, align: 64, elements: !14)
!13 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate")
!14 = !{!15, !17, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !38, !39, !40, !41, !45, !47, !49, !53, !56, !58, !59, !60, !61, !62, !66, !67}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !12, file: !13, line: 246, baseType: !16, size: 32, align: 32)
!16 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !12, file: !13, line: 251, baseType: !18, size: 64, align: 64, offset: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64, align: 64)
!19 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !12, file: !13, line: 252, baseType: !18, size: 64, align: 64, offset: 128)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !12, file: !13, line: 253, baseType: !18, size: 64, align: 64, offset: 192)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !12, file: !13, line: 254, baseType: !18, size: 64, align: 64, offset: 256)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !12, file: !13, line: 255, baseType: !18, size: 64, align: 64, offset: 320)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !12, file: !13, line: 256, baseType: !18, size: 64, align: 64, offset: 384)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !12, file: !13, line: 257, baseType: !18, size: 64, align: 64, offset: 448)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !12, file: !13, line: 258, baseType: !18, size: 64, align: 64, offset: 512)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !12, file: !13, line: 260, baseType: !18, size: 64, align: 64, offset: 576)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !12, file: !13, line: 261, baseType: !18, size: 64, align: 64, offset: 640)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !12, file: !13, line: 262, baseType: !18, size: 64, align: 64, offset: 704)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !12, file: !13, line: 264, baseType: !31, size: 64, align: 64, offset: 768)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64, align: 64)
!32 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !13, line: 160, size: 192, align: 64, elements: !33)
!33 = !{!34, !35, !37}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_next", scope: !32, file: !13, line: 161, baseType: !31, size: 64, align: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_sbuf", scope: !32, file: !13, line: 162, baseType: !36, size: 64, align: 64, offset: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_pos", scope: !32, file: !13, line: 166, baseType: !16, size: 32, align: 32, offset: 128)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !12, file: !13, line: 266, baseType: !36, size: 64, align: 64, offset: 832)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !12, file: !13, line: 268, baseType: !16, size: 32, align: 32, offset: 896)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !12, file: !13, line: 272, baseType: !16, size: 32, align: 32, offset: 928)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !12, file: !13, line: 274, baseType: !42, size: 64, align: 64, offset: 960)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !43, line: 131, baseType: !44)
!43 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate")
!44 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !12, file: !13, line: 278, baseType: !46, size: 16, align: 16, offset: 1024)
!46 = !DIBasicType(name: "unsigned short", size: 16, align: 16, encoding: DW_ATE_unsigned)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !12, file: !13, line: 279, baseType: !48, size: 8, align: 8, offset: 1040)
!48 = !DIBasicType(name: "signed char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !12, file: !13, line: 280, baseType: !50, size: 8, align: 8, offset: 1048)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 8, align: 8, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 1)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !12, file: !13, line: 284, baseType: !54, size: 64, align: 64, offset: 1088)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64, align: 64)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !13, line: 154, baseType: null)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !12, file: !13, line: 293, baseType: !57, size: 64, align: 64, offset: 1152)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !43, line: 132, baseType: !44)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "__pad1", scope: !12, file: !13, line: 302, baseType: !4, size: 64, align: 64, offset: 1216)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "__pad2", scope: !12, file: !13, line: 303, baseType: !4, size: 64, align: 64, offset: 1280)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "__pad3", scope: !12, file: !13, line: 304, baseType: !4, size: 64, align: 64, offset: 1344)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "__pad4", scope: !12, file: !13, line: 305, baseType: !4, size: 64, align: 64, offset: 1408)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !12, file: !13, line: 306, baseType: !63, size: 64, align: 64, offset: 1472)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !64, line: 62, baseType: !65)
!64 = !DIFile(filename: "/home/sam/polly/llvm_build/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/CoinGame/impl/autogenerate")
!65 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !12, file: !13, line: 308, baseType: !16, size: 32, align: 32, offset: 1536)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !12, file: !13, line: 310, baseType: !68, size: 160, align: 8, offset: 1568)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 160, align: 8, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 20)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64, align: 64)
!72 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!73 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!74 = !{!75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147}
!75 = !DILocalVariable(name: "sys", arg: 1, scope: !6, file: !1, line: 2, type: !9)
!76 = !DILocalVariable(name: "moves", arg: 2, scope: !6, file: !1, line: 2, type: !71)
!77 = !DILocalVariable(name: "moves_size", arg: 3, scope: !6, file: !1, line: 2, type: !72)
!78 = !DILocalVariable(name: "moves_has_ownership", arg: 4, scope: !6, file: !1, line: 2, type: !73)
!79 = !DILocalVariable(name: "n", arg: 5, scope: !6, file: !1, line: 2, type: !72)
!80 = !DILocalVariable(name: "left", scope: !6, file: !1, line: 3, type: !72)
!81 = !DILocalVariable(name: "right", scope: !6, file: !1, line: 4, type: !72)
!82 = !DILocalVariable(name: "i", scope: !6, file: !1, line: 5, type: !72)
!83 = !DILocalVariable(name: "sum_alice", scope: !6, file: !1, line: 6, type: !72)
!84 = !DILocalVariable(name: "sum_bob", scope: !6, file: !1, line: 7, type: !72)
!85 = !DILocalVariable(name: "coin", scope: !6, file: !1, line: 8, type: !72)
!86 = !DILocalVariable(name: "_9", scope: !6, file: !1, line: 9, type: !72)
!87 = !DILocalVariable(name: "_10", scope: !6, file: !1, line: 10, type: !72)
!88 = !DILocalVariable(name: "_11", scope: !6, file: !1, line: 11, type: !72)
!89 = !DILocalVariable(name: "_12", scope: !6, file: !1, line: 12, type: !72)
!90 = !DILocalVariable(name: "_13", scope: !6, file: !1, line: 13, type: !72)
!91 = !DILocalVariable(name: "_14", scope: !6, file: !1, line: 14, type: !72)
!92 = !DILocalVariable(name: "_15", scope: !6, file: !1, line: 15, type: !72)
!93 = !DILocalVariable(name: "_16", scope: !6, file: !1, line: 16, type: !72)
!94 = !DILocalVariable(name: "_17", scope: !6, file: !1, line: 17, type: !72)
!95 = !DILocalVariable(name: "_18", scope: !6, file: !1, line: 18, type: !72)
!96 = !DILocalVariable(name: "_19", scope: !6, file: !1, line: 19, type: !72)
!97 = !DILocalVariable(name: "_20", scope: !6, file: !1, line: 20, type: !72)
!98 = !DILocalVariable(name: "_21", scope: !6, file: !1, line: 21, type: !72)
!99 = !DILocalVariable(name: "_22", scope: !6, file: !1, line: 22, type: !72)
!100 = !DILocalVariable(name: "_23", scope: !6, file: !1, line: 23, type: !72)
!101 = !DILocalVariable(name: "_24", scope: !6, file: !1, line: 24, type: !72)
!102 = !DILocalVariable(name: "_25", scope: !6, file: !1, line: 25, type: !72)
!103 = !DILocalVariable(name: "_26", scope: !6, file: !1, line: 26, type: !72)
!104 = !DILocalVariable(name: "_27", scope: !6, file: !1, line: 27, type: !72)
!105 = !DILocalVariable(name: "_28", scope: !6, file: !1, line: 28, type: !72)
!106 = !DILocalVariable(name: "_29", scope: !6, file: !1, line: 29, type: !72)
!107 = !DILocalVariable(name: "_30", scope: !6, file: !1, line: 30, type: !72)
!108 = !DILocalVariable(name: "_31", scope: !6, file: !1, line: 31, type: !72)
!109 = !DILocalVariable(name: "_32", scope: !6, file: !1, line: 32, type: !72)
!110 = !DILocalVariable(name: "_33", scope: !6, file: !1, line: 33, type: !4)
!111 = !DILocalVariable(name: "_35", scope: !6, file: !1, line: 34, type: !71)
!112 = !DILocalVariable(name: "_35_size", scope: !6, file: !1, line: 34, type: !72)
!113 = !DILocalVariable(name: "_35_has_ownership", scope: !6, file: !1, line: 35, type: !73)
!114 = !DILocalVariable(name: "_36", scope: !6, file: !1, line: 36, type: !4)
!115 = !DILocalVariable(name: "_38", scope: !6, file: !1, line: 37, type: !71)
!116 = !DILocalVariable(name: "_38_size", scope: !6, file: !1, line: 37, type: !72)
!117 = !DILocalVariable(name: "_38_has_ownership", scope: !6, file: !1, line: 38, type: !73)
!118 = !DILocalVariable(name: "_39", scope: !6, file: !1, line: 39, type: !4)
!119 = !DILocalVariable(name: "_41", scope: !6, file: !1, line: 40, type: !4)
!120 = !DILocalVariable(name: "_43", scope: !6, file: !1, line: 41, type: !71)
!121 = !DILocalVariable(name: "_43_size", scope: !6, file: !1, line: 41, type: !72)
!122 = !DILocalVariable(name: "_43_has_ownership", scope: !6, file: !1, line: 42, type: !73)
!123 = !DILocalVariable(name: "_44", scope: !6, file: !1, line: 43, type: !4)
!124 = !DILocalVariable(name: "_46", scope: !6, file: !1, line: 44, type: !4)
!125 = !DILocalVariable(name: "_48", scope: !6, file: !1, line: 45, type: !71)
!126 = !DILocalVariable(name: "_48_size", scope: !6, file: !1, line: 45, type: !72)
!127 = !DILocalVariable(name: "_48_has_ownership", scope: !6, file: !1, line: 46, type: !73)
!128 = !DILocalVariable(name: "_49", scope: !6, file: !1, line: 47, type: !72)
!129 = !DILocalVariable(name: "_50", scope: !6, file: !1, line: 48, type: !72)
!130 = !DILocalVariable(name: "_51", scope: !6, file: !1, line: 49, type: !72)
!131 = !DILocalVariable(name: "_52", scope: !6, file: !1, line: 50, type: !72)
!132 = !DILocalVariable(name: "_53", scope: !6, file: !1, line: 51, type: !4)
!133 = !DILocalVariable(name: "_55", scope: !6, file: !1, line: 52, type: !71)
!134 = !DILocalVariable(name: "_55_size", scope: !6, file: !1, line: 52, type: !72)
!135 = !DILocalVariable(name: "_55_has_ownership", scope: !6, file: !1, line: 53, type: !73)
!136 = !DILocalVariable(name: "_56", scope: !6, file: !1, line: 54, type: !72)
!137 = !DILocalVariable(name: "_57", scope: !6, file: !1, line: 55, type: !4)
!138 = !DILocalVariable(name: "_59", scope: !6, file: !1, line: 56, type: !71)
!139 = !DILocalVariable(name: "_59_size", scope: !6, file: !1, line: 56, type: !72)
!140 = !DILocalVariable(name: "_59_has_ownership", scope: !6, file: !1, line: 57, type: !73)
!141 = !DILocalVariable(name: "_60", scope: !6, file: !1, line: 58, type: !72)
!142 = !DILocalVariable(name: "_61", scope: !6, file: !1, line: 59, type: !72)
!143 = !DILocalVariable(name: "_62", scope: !6, file: !1, line: 60, type: !4)
!144 = !DILocalVariable(name: "_64", scope: !6, file: !1, line: 61, type: !71)
!145 = !DILocalVariable(name: "_64_size", scope: !6, file: !1, line: 61, type: !72)
!146 = !DILocalVariable(name: "_64_has_ownership", scope: !6, file: !1, line: 62, type: !73)
!147 = !DILocalVariable(name: "_65", scope: !6, file: !1, line: 63, type: !4)
!148 = distinct !DISubprogram(name: "findMoves", scope: !1, file: !1, line: 283, type: !149, isLocal: false, isDefinition: true, scopeLine: 283, flags: DIFlagPrototyped, isOptimized: true, variables: !151)
!149 = !DISubroutineType(types: !150)
!150 = !{!71, !71, !72, !73, !72}
!151 = !{!152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210}
!152 = !DILocalVariable(name: "moves", arg: 1, scope: !148, file: !1, line: 283, type: !71)
!153 = !DILocalVariable(name: "moves_size", arg: 2, scope: !148, file: !1, line: 283, type: !72)
!154 = !DILocalVariable(name: "moves_has_ownership", arg: 3, scope: !148, file: !1, line: 283, type: !73)
!155 = !DILocalVariable(name: "n", arg: 4, scope: !148, file: !1, line: 283, type: !72)
!156 = !DILocalVariable(name: "_2", scope: !148, file: !1, line: 284, type: !71)
!157 = !DILocalVariable(name: "_2_size", scope: !148, file: !1, line: 284, type: !72)
!158 = !DILocalVariable(name: "_2_has_ownership", scope: !148, file: !1, line: 285, type: !73)
!159 = !DILocalVariable(name: "s", scope: !148, file: !1, line: 286, type: !72)
!160 = !DILocalVariable(name: "j", scope: !148, file: !1, line: 287, type: !72)
!161 = !DILocalVariable(name: "i", scope: !148, file: !1, line: 288, type: !72)
!162 = !DILocalVariable(name: "y", scope: !148, file: !1, line: 289, type: !72)
!163 = !DILocalVariable(name: "x", scope: !148, file: !1, line: 290, type: !72)
!164 = !DILocalVariable(name: "z", scope: !148, file: !1, line: 291, type: !72)
!165 = !DILocalVariable(name: "_9", scope: !148, file: !1, line: 292, type: !72)
!166 = !DILocalVariable(name: "_10", scope: !148, file: !1, line: 293, type: !72)
!167 = !DILocalVariable(name: "_11", scope: !148, file: !1, line: 294, type: !72)
!168 = !DILocalVariable(name: "_12", scope: !148, file: !1, line: 295, type: !72)
!169 = !DILocalVariable(name: "_13", scope: !148, file: !1, line: 296, type: !72)
!170 = !DILocalVariable(name: "_14", scope: !148, file: !1, line: 297, type: !72)
!171 = !DILocalVariable(name: "_15", scope: !148, file: !1, line: 298, type: !72)
!172 = !DILocalVariable(name: "_16", scope: !148, file: !1, line: 299, type: !72)
!173 = !DILocalVariable(name: "_17", scope: !148, file: !1, line: 300, type: !72)
!174 = !DILocalVariable(name: "_18", scope: !148, file: !1, line: 301, type: !72)
!175 = !DILocalVariable(name: "_19", scope: !148, file: !1, line: 302, type: !72)
!176 = !DILocalVariable(name: "_20", scope: !148, file: !1, line: 303, type: !72)
!177 = !DILocalVariable(name: "_21", scope: !148, file: !1, line: 304, type: !72)
!178 = !DILocalVariable(name: "_22", scope: !148, file: !1, line: 305, type: !72)
!179 = !DILocalVariable(name: "_23", scope: !148, file: !1, line: 306, type: !72)
!180 = !DILocalVariable(name: "_24", scope: !148, file: !1, line: 307, type: !72)
!181 = !DILocalVariable(name: "_25", scope: !148, file: !1, line: 308, type: !72)
!182 = !DILocalVariable(name: "_26", scope: !148, file: !1, line: 309, type: !72)
!183 = !DILocalVariable(name: "_27", scope: !148, file: !1, line: 310, type: !72)
!184 = !DILocalVariable(name: "_28", scope: !148, file: !1, line: 311, type: !72)
!185 = !DILocalVariable(name: "_29", scope: !148, file: !1, line: 312, type: !72)
!186 = !DILocalVariable(name: "_30", scope: !148, file: !1, line: 313, type: !72)
!187 = !DILocalVariable(name: "_31", scope: !148, file: !1, line: 314, type: !72)
!188 = !DILocalVariable(name: "_32", scope: !148, file: !1, line: 315, type: !72)
!189 = !DILocalVariable(name: "_33", scope: !148, file: !1, line: 316, type: !72)
!190 = !DILocalVariable(name: "_34", scope: !148, file: !1, line: 317, type: !72)
!191 = !DILocalVariable(name: "_35", scope: !148, file: !1, line: 318, type: !72)
!192 = !DILocalVariable(name: "_36", scope: !148, file: !1, line: 319, type: !72)
!193 = !DILocalVariable(name: "_37", scope: !148, file: !1, line: 320, type: !72)
!194 = !DILocalVariable(name: "_38", scope: !148, file: !1, line: 321, type: !72)
!195 = !DILocalVariable(name: "_39", scope: !148, file: !1, line: 322, type: !72)
!196 = !DILocalVariable(name: "_40", scope: !148, file: !1, line: 323, type: !72)
!197 = !DILocalVariable(name: "_41", scope: !148, file: !1, line: 324, type: !72)
!198 = !DILocalVariable(name: "_42", scope: !148, file: !1, line: 325, type: !72)
!199 = !DILocalVariable(name: "_43", scope: !148, file: !1, line: 326, type: !72)
!200 = !DILocalVariable(name: "_44", scope: !148, file: !1, line: 327, type: !72)
!201 = !DILocalVariable(name: "_45", scope: !148, file: !1, line: 328, type: !72)
!202 = !DILocalVariable(name: "_46", scope: !148, file: !1, line: 329, type: !72)
!203 = !DILocalVariable(name: "_47", scope: !148, file: !1, line: 330, type: !72)
!204 = !DILocalVariable(name: "_48", scope: !148, file: !1, line: 331, type: !72)
!205 = !DILocalVariable(name: "_49", scope: !148, file: !1, line: 332, type: !72)
!206 = !DILocalVariable(name: "_50", scope: !148, file: !1, line: 333, type: !72)
!207 = !DILocalVariable(name: "_51", scope: !148, file: !1, line: 334, type: !72)
!208 = !DILocalVariable(name: "_52", scope: !148, file: !1, line: 335, type: !72)
!209 = !DILocalVariable(name: "_53", scope: !148, file: !1, line: 336, type: !72)
!210 = !DILocalVariable(name: "_54", scope: !148, file: !1, line: 337, type: !72)
!211 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 516, type: !212, isLocal: false, isDefinition: true, scopeLine: 516, flags: DIFlagPrototyped, isOptimized: true, variables: !215)
!212 = !DISubroutineType(types: !213)
!213 = !{!16, !16, !214}
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64, align: 64)
!215 = !{!216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253}
!216 = !DILocalVariable(name: "argc", arg: 1, scope: !211, file: !1, line: 516, type: !16)
!217 = !DILocalVariable(name: "args", arg: 2, scope: !211, file: !1, line: 516, type: !214)
!218 = !DILocalVariable(name: "max", scope: !211, file: !1, line: 517, type: !71)
!219 = !DILocalVariable(name: "n", scope: !211, file: !1, line: 518, type: !72)
!220 = !DILocalVariable(name: "moves", scope: !211, file: !1, line: 519, type: !71)
!221 = !DILocalVariable(name: "moves_size", scope: !211, file: !1, line: 519, type: !72)
!222 = !DILocalVariable(name: "moves_has_ownership", scope: !211, file: !1, line: 520, type: !73)
!223 = !DILocalVariable(name: "sum_alice", scope: !211, file: !1, line: 521, type: !72)
!224 = !DILocalVariable(name: "_5", scope: !211, file: !1, line: 522, type: !71)
!225 = !DILocalVariable(name: "_6", scope: !211, file: !1, line: 523, type: !226)
!226 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64, align: 64)
!227 = !DILocalVariable(name: "_6_size", scope: !211, file: !1, line: 523, type: !72)
!228 = !DILocalVariable(name: "_6_size_size", scope: !211, file: !1, line: 523, type: !72)
!229 = !DILocalVariable(name: "_6_has_ownership", scope: !211, file: !1, line: 524, type: !73)
!230 = !DILocalVariable(name: "_7", scope: !211, file: !1, line: 525, type: !72)
!231 = !DILocalVariable(name: "_8", scope: !211, file: !1, line: 526, type: !71)
!232 = !DILocalVariable(name: "_8_size", scope: !211, file: !1, line: 526, type: !72)
!233 = !DILocalVariable(name: "_8_has_ownership", scope: !211, file: !1, line: 527, type: !73)
!234 = !DILocalVariable(name: "_9", scope: !211, file: !1, line: 528, type: !72)
!235 = !DILocalVariable(name: "_10", scope: !211, file: !1, line: 529, type: !72)
!236 = !DILocalVariable(name: "_11", scope: !211, file: !1, line: 530, type: !71)
!237 = !DILocalVariable(name: "_11_size", scope: !211, file: !1, line: 530, type: !72)
!238 = !DILocalVariable(name: "_11_has_ownership", scope: !211, file: !1, line: 531, type: !73)
!239 = !DILocalVariable(name: "_12", scope: !211, file: !1, line: 532, type: !71)
!240 = !DILocalVariable(name: "_12_size", scope: !211, file: !1, line: 532, type: !72)
!241 = !DILocalVariable(name: "_12_has_ownership", scope: !211, file: !1, line: 533, type: !73)
!242 = !DILocalVariable(name: "_13", scope: !211, file: !1, line: 534, type: !72)
!243 = !DILocalVariable(name: "_14", scope: !211, file: !1, line: 535, type: !72)
!244 = !DILocalVariable(name: "_15", scope: !211, file: !1, line: 536, type: !72)
!245 = !DILocalVariable(name: "_16", scope: !211, file: !1, line: 537, type: !4)
!246 = !DILocalVariable(name: "_18", scope: !211, file: !1, line: 538, type: !71)
!247 = !DILocalVariable(name: "_18_size", scope: !211, file: !1, line: 538, type: !72)
!248 = !DILocalVariable(name: "_18_has_ownership", scope: !211, file: !1, line: 539, type: !73)
!249 = !DILocalVariable(name: "_19", scope: !211, file: !1, line: 540, type: !4)
!250 = !DILocalVariable(name: "_21", scope: !211, file: !1, line: 541, type: !4)
!251 = !DILocalVariable(name: "_23", scope: !211, file: !1, line: 542, type: !71)
!252 = !DILocalVariable(name: "_23_size", scope: !211, file: !1, line: 542, type: !72)
!253 = !DILocalVariable(name: "_23_has_ownership", scope: !211, file: !1, line: 543, type: !73)
!254 = !{i32 2, !"Dwarf Version", i32 4}
!255 = !{i32 2, !"Debug Info Version", i32 3}
!256 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!257 = !DIExpression()
!258 = !DILocation(line: 2, column: 17, scope: !6)
!259 = !DILocation(line: 2, column: 22, scope: !6)
!260 = !DIExpression(DW_OP_bit_piece, 0, 1)
!261 = !DILocation(line: 2, column: 50, scope: !6)
!262 = !DILocation(line: 2, column: 90, scope: !6)
!263 = !DILocation(line: 3, column: 12, scope: !6)
!264 = !DILocation(line: 4, column: 12, scope: !6)
!265 = !DILocation(line: 5, column: 12, scope: !6)
!266 = !DILocation(line: 6, column: 12, scope: !6)
!267 = !DILocation(line: 7, column: 12, scope: !6)
!268 = !DILocation(line: 8, column: 12, scope: !6)
!269 = !DILocation(line: 9, column: 12, scope: !6)
!270 = !DILocation(line: 10, column: 12, scope: !6)
!271 = !DILocation(line: 11, column: 12, scope: !6)
!272 = !DILocation(line: 12, column: 12, scope: !6)
!273 = !DILocation(line: 13, column: 12, scope: !6)
!274 = !DILocation(line: 14, column: 12, scope: !6)
!275 = !DILocation(line: 15, column: 12, scope: !6)
!276 = !DILocation(line: 16, column: 12, scope: !6)
!277 = !DILocation(line: 17, column: 12, scope: !6)
!278 = !DILocation(line: 18, column: 12, scope: !6)
!279 = !DILocation(line: 19, column: 12, scope: !6)
!280 = !DILocation(line: 20, column: 12, scope: !6)
!281 = !DILocation(line: 21, column: 12, scope: !6)
!282 = !DILocation(line: 22, column: 12, scope: !6)
!283 = !DILocation(line: 23, column: 12, scope: !6)
!284 = !DILocation(line: 24, column: 12, scope: !6)
!285 = !DILocation(line: 25, column: 12, scope: !6)
!286 = !DILocation(line: 26, column: 12, scope: !6)
!287 = !DILocation(line: 27, column: 12, scope: !6)
!288 = !DILocation(line: 28, column: 12, scope: !6)
!289 = !DILocation(line: 29, column: 12, scope: !6)
!290 = !DILocation(line: 30, column: 12, scope: !6)
!291 = !DILocation(line: 31, column: 12, scope: !6)
!292 = !DILocation(line: 32, column: 12, scope: !6)
!293 = !DILocation(line: 34, column: 2, scope: !6)
!294 = !DILocation(line: 35, column: 2, scope: !6)
!295 = !DILocation(line: 37, column: 2, scope: !6)
!296 = !DILocation(line: 38, column: 2, scope: !6)
!297 = !DILocation(line: 41, column: 2, scope: !6)
!298 = !DILocation(line: 42, column: 2, scope: !6)
!299 = !DILocation(line: 45, column: 2, scope: !6)
!300 = !DILocation(line: 46, column: 2, scope: !6)
!301 = !DILocation(line: 47, column: 12, scope: !6)
!302 = !DILocation(line: 48, column: 12, scope: !6)
!303 = !DILocation(line: 49, column: 12, scope: !6)
!304 = !DILocation(line: 50, column: 12, scope: !6)
!305 = !DILocation(line: 52, column: 2, scope: !6)
!306 = !DILocation(line: 53, column: 2, scope: !6)
!307 = !DILocation(line: 54, column: 12, scope: !6)
!308 = !DILocation(line: 56, column: 2, scope: !6)
!309 = !DILocation(line: 57, column: 2, scope: !6)
!310 = !DILocation(line: 58, column: 12, scope: !6)
!311 = !DILocation(line: 59, column: 12, scope: !6)
!312 = !DILocation(line: 61, column: 2, scope: !6)
!313 = !DILocation(line: 62, column: 2, scope: !6)
!314 = !DILocation(line: 89, column: 7, scope: !315)
!315 = distinct !DILexicalBlock(scope: !316, file: !1, line: 89, column: 6)
!316 = distinct !DILexicalBlock(scope: !6, file: !1, line: 87, column: 13)
!317 = !DILocation(line: 89, column: 6, scope: !316)
!318 = !DILocation(line: 71, column: 7, scope: !6)
!319 = !DILocation(line: 97, column: 11, scope: !316)
!320 = !DILocation(line: 99, column: 10, scope: !316)
!321 = !DILocation(line: 101, column: 10, scope: !316)
!322 = !DILocation(line: 103, column: 7, scope: !316)
!323 = !{!324, !324, i64 0}
!324 = !{!"long long", !325, i64 0}
!325 = !{!"omnipotent char", !326, i64 0}
!326 = !{!"Simple C/C++ TBAA"}
!327 = !DILocation(line: 105, column: 11, scope: !316)
!328 = !DILocation(line: 107, column: 10, scope: !316)
!329 = !DILocation(line: 111, column: 10, scope: !316)
!330 = !DILocation(line: 113, column: 7, scope: !316)
!331 = !DILocation(line: 115, column: 9, scope: !332)
!332 = distinct !DILexicalBlock(scope: !316, file: !1, line: 115, column: 6)
!333 = !DILocation(line: 115, column: 6, scope: !316)
!334 = !DILocation(line: 145, column: 9, scope: !335)
!335 = distinct !DILexicalBlock(scope: !316, file: !1, line: 145, column: 6)
!336 = !DILocation(line: 145, column: 6, scope: !316)
!337 = !DILocation(line: 149, column: 3, scope: !338)
!338 = distinct !DILexicalBlock(scope: !316, file: !1, line: 149, column: 3)
!339 = !DILocation(line: 149, column: 3, scope: !316)
!340 = !DILocation(line: 149, column: 3, scope: !341)
!341 = !DILexicalBlockFile(scope: !342, file: !1, discriminator: 1)
!342 = distinct !DILexicalBlock(scope: !338, file: !1, line: 149, column: 3)
!343 = !DILocation(line: 150, column: 3, scope: !316)
!344 = !DILocation(line: 151, column: 10, scope: !316)
!345 = !DILocation(line: 151, column: 30, scope: !316)
!346 = !DILocation(line: 151, column: 37, scope: !316)
!347 = !DILocation(line: 151, column: 57, scope: !316)
!348 = !DILocation(line: 151, column: 64, scope: !316)
!349 = !DILocation(line: 151, column: 84, scope: !316)
!350 = !DILocation(line: 151, column: 91, scope: !316)
!351 = !DILocation(line: 151, column: 111, scope: !316)
!352 = !DILocation(line: 151, column: 118, scope: !316)
!353 = !DILocation(line: 151, column: 139, scope: !316)
!354 = !DILocation(line: 151, column: 147, scope: !316)
!355 = !DILocation(line: 151, column: 167, scope: !316)
!356 = !DILocation(line: 151, column: 175, scope: !316)
!357 = !DILocation(line: 151, column: 197, scope: !316)
!358 = !DILocation(line: 151, column: 205, scope: !316)
!359 = !DILocation(line: 151, column: 226, scope: !316)
!360 = !DILocation(line: 151, column: 234, scope: !316)
!361 = !DILocation(line: 154, column: 3, scope: !316)
!362 = !DILocation(line: 156, column: 3, scope: !316)
!363 = !DILocation(line: 162, column: 3, scope: !364)
!364 = distinct !DILexicalBlock(scope: !316, file: !1, line: 162, column: 3)
!365 = !DILocation(line: 162, column: 3, scope: !316)
!366 = !DILocation(line: 162, column: 3, scope: !367)
!367 = !DILexicalBlockFile(scope: !368, file: !1, discriminator: 1)
!368 = distinct !DILexicalBlock(scope: !364, file: !1, line: 162, column: 3)
!369 = !DILocation(line: 163, column: 3, scope: !316)
!370 = !DILocation(line: 164, column: 10, scope: !316)
!371 = !DILocation(line: 164, column: 30, scope: !316)
!372 = !DILocation(line: 164, column: 37, scope: !316)
!373 = !DILocation(line: 164, column: 56, scope: !316)
!374 = !DILocation(line: 164, column: 63, scope: !316)
!375 = !DILocation(line: 164, column: 83, scope: !316)
!376 = !DILocation(line: 164, column: 90, scope: !316)
!377 = !DILocation(line: 164, column: 111, scope: !316)
!378 = !DILocation(line: 164, column: 118, scope: !316)
!379 = !DILocation(line: 164, column: 137, scope: !316)
!380 = !DILocation(line: 164, column: 145, scope: !316)
!381 = !DILocation(line: 164, column: 167, scope: !316)
!382 = !DILocation(line: 164, column: 175, scope: !316)
!383 = !DILocation(line: 164, column: 196, scope: !316)
!384 = !DILocation(line: 164, column: 204, scope: !316)
!385 = !DILocation(line: 167, column: 3, scope: !316)
!386 = !DILocation(line: 173, column: 3, scope: !316)
!387 = !DILocation(line: 177, column: 3, scope: !316)
!388 = !DILocation(line: 177, column: 3, scope: !389)
!389 = !DILexicalBlockFile(scope: !390, file: !1, discriminator: 1)
!390 = distinct !DILexicalBlock(scope: !391, file: !1, line: 177, column: 3)
!391 = distinct !DILexicalBlock(scope: !316, file: !1, line: 177, column: 3)
!392 = !DILocation(line: 178, column: 3, scope: !316)
!393 = !DILocation(line: 179, column: 10, scope: !316)
!394 = !DILocation(line: 179, column: 29, scope: !316)
!395 = !DILocation(line: 179, column: 36, scope: !316)
!396 = !DILocation(line: 182, column: 3, scope: !316)
!397 = !DILocation(line: 186, column: 3, scope: !316)
!398 = !DILocation(line: 190, column: 3, scope: !316)
!399 = !DILocation(line: 190, column: 3, scope: !400)
!400 = !DILexicalBlockFile(scope: !401, file: !1, discriminator: 1)
!401 = distinct !DILexicalBlock(scope: !402, file: !1, line: 190, column: 3)
!402 = distinct !DILexicalBlock(scope: !316, file: !1, line: 190, column: 3)
!403 = !DILocation(line: 191, column: 3, scope: !316)
!404 = !DILocation(line: 192, column: 10, scope: !316)
!405 = !DILocation(line: 195, column: 3, scope: !316)
!406 = !DILocation(line: 203, column: 6, scope: !316)
!407 = !DILocation(line: 211, column: 3, scope: !408)
!408 = !DILexicalBlockFile(scope: !409, file: !1, discriminator: 1)
!409 = distinct !DILexicalBlock(scope: !410, file: !1, line: 211, column: 3)
!410 = distinct !DILexicalBlock(scope: !316, file: !1, line: 211, column: 3)
!411 = !DILocation(line: 212, column: 3, scope: !316)
!412 = !DILocation(line: 213, column: 10, scope: !316)
!413 = !DILocation(line: 216, column: 3, scope: !316)
!414 = !DILocation(line: 218, column: 3, scope: !316)
!415 = !DILocation(line: 228, column: 3, scope: !416)
!416 = !DILexicalBlockFile(scope: !417, file: !1, discriminator: 1)
!417 = distinct !DILexicalBlock(scope: !418, file: !1, line: 228, column: 3)
!418 = distinct !DILexicalBlock(scope: !316, file: !1, line: 228, column: 3)
!419 = !DILocation(line: 229, column: 3, scope: !316)
!420 = !DILocation(line: 230, column: 10, scope: !316)
!421 = !DILocation(line: 233, column: 3, scope: !316)
!422 = !DILocation(line: 239, column: 8, scope: !316)
!423 = !DILocation(line: 250, column: 15, scope: !424)
!424 = distinct !DILexicalBlock(scope: !425, file: !1, line: 250, column: 6)
!425 = distinct !DILexicalBlock(scope: !6, file: !1, line: 248, column: 2)
!426 = !DILocation(line: 250, column: 6, scope: !425)
!427 = !DILocation(line: 252, column: 11, scope: !425)
!428 = !{!429, !429, i64 0}
!429 = !{!"any pointer", !325, i64 0}
!430 = !DILocation(line: 252, column: 3, scope: !425)
!431 = !DILocation(line: 253, column: 3, scope: !425)
!432 = !DILocation(line: 262, column: 2, scope: !6)
!433 = !DILocation(line: 263, column: 9, scope: !6)
!434 = !DILocation(line: 263, column: 29, scope: !6)
!435 = !DILocation(line: 263, column: 36, scope: !6)
!436 = !DILocation(line: 263, column: 56, scope: !6)
!437 = !DILocation(line: 263, column: 63, scope: !6)
!438 = !DILocation(line: 263, column: 84, scope: !6)
!439 = !DILocation(line: 263, column: 91, scope: !6)
!440 = !DILocation(line: 263, column: 111, scope: !6)
!441 = !DILocation(line: 263, column: 118, scope: !6)
!442 = !DILocation(line: 263, column: 138, scope: !6)
!443 = !DILocation(line: 263, column: 146, scope: !6)
!444 = !DILocation(line: 263, column: 167, scope: !6)
!445 = !DILocation(line: 263, column: 175, scope: !6)
!446 = !DILocation(line: 263, column: 197, scope: !6)
!447 = !DILocation(line: 263, column: 205, scope: !6)
!448 = !DILocation(line: 263, column: 227, scope: !6)
!449 = !DILocation(line: 263, column: 235, scope: !6)
!450 = !DILocation(line: 263, column: 256, scope: !6)
!451 = !DILocation(line: 263, column: 264, scope: !6)
!452 = !DILocation(line: 263, column: 285, scope: !6)
!453 = !DILocation(line: 263, column: 293, scope: !6)
!454 = !DILocation(line: 263, column: 315, scope: !6)
!455 = !DILocation(line: 263, column: 323, scope: !6)
!456 = !DILocation(line: 263, column: 345, scope: !6)
!457 = !DILocation(line: 263, column: 353, scope: !6)
!458 = !DILocation(line: 263, column: 374, scope: !6)
!459 = !DILocation(line: 263, column: 382, scope: !6)
!460 = !DILocation(line: 263, column: 403, scope: !6)
!461 = !DILocation(line: 263, column: 411, scope: !6)
!462 = !DILocation(line: 263, column: 432, scope: !6)
!463 = !DILocation(line: 263, column: 440, scope: !6)
!464 = !DILocation(line: 263, column: 462, scope: !6)
!465 = !DILocation(line: 263, column: 470, scope: !6)
!466 = !DILocation(line: 263, column: 492, scope: !6)
!467 = !DILocation(line: 263, column: 500, scope: !6)
!468 = !DILocation(line: 263, column: 520, scope: !6)
!469 = !DILocation(line: 263, column: 528, scope: !6)
!470 = !DILocation(line: 263, column: 549, scope: !6)
!471 = !DILocation(line: 263, column: 557, scope: !6)
!472 = !DILocation(line: 263, column: 577, scope: !6)
!473 = !DILocation(line: 263, column: 585, scope: !6)
!474 = !DILocation(line: 263, column: 607, scope: !6)
!475 = !DILocation(line: 263, column: 615, scope: !6)
!476 = !DILocation(line: 263, column: 637, scope: !6)
!477 = !DILocation(line: 263, column: 645, scope: !6)
!478 = !DILocation(line: 263, column: 666, scope: !6)
!479 = !DILocation(line: 263, column: 674, scope: !6)
!480 = !DILocation(line: 266, column: 2, scope: !6)
!481 = !DILocation(line: 270, column: 2, scope: !6)
!482 = !DILocation(line: 272, column: 2, scope: !6)
!483 = !DILocation(line: 272, column: 2, scope: !484)
!484 = !DILexicalBlockFile(scope: !485, file: !1, discriminator: 1)
!485 = distinct !DILexicalBlock(scope: !486, file: !1, line: 272, column: 2)
!486 = distinct !DILexicalBlock(scope: !6, file: !1, line: 272, column: 2)
!487 = !DILocation(line: 273, column: 2, scope: !488)
!488 = distinct !DILexicalBlock(scope: !6, file: !1, line: 273, column: 2)
!489 = !DILocation(line: 273, column: 2, scope: !6)
!490 = !DILocation(line: 273, column: 2, scope: !491)
!491 = !DILexicalBlockFile(scope: !492, file: !1, discriminator: 1)
!492 = distinct !DILexicalBlock(scope: !488, file: !1, line: 273, column: 2)
!493 = !DILocation(line: 274, column: 2, scope: !494)
!494 = distinct !DILexicalBlock(scope: !6, file: !1, line: 274, column: 2)
!495 = !DILocation(line: 274, column: 2, scope: !6)
!496 = !DILocation(line: 274, column: 2, scope: !497)
!497 = !DILexicalBlockFile(scope: !498, file: !1, discriminator: 1)
!498 = distinct !DILexicalBlock(scope: !494, file: !1, line: 274, column: 2)
!499 = !DILocation(line: 275, column: 2, scope: !6)
!500 = !DILocation(line: 275, column: 2, scope: !501)
!501 = !DILexicalBlockFile(scope: !502, file: !1, discriminator: 1)
!502 = distinct !DILexicalBlock(scope: !503, file: !1, line: 275, column: 2)
!503 = distinct !DILexicalBlock(scope: !6, file: !1, line: 275, column: 2)
!504 = !DILocation(line: 276, column: 2, scope: !505)
!505 = !DILexicalBlockFile(scope: !506, file: !1, discriminator: 1)
!506 = distinct !DILexicalBlock(scope: !507, file: !1, line: 276, column: 2)
!507 = distinct !DILexicalBlock(scope: !6, file: !1, line: 276, column: 2)
!508 = !DILocation(line: 277, column: 2, scope: !509)
!509 = distinct !DILexicalBlock(scope: !6, file: !1, line: 277, column: 2)
!510 = !DILocation(line: 277, column: 2, scope: !6)
!511 = !DILocation(line: 277, column: 2, scope: !512)
!512 = !DILexicalBlockFile(scope: !513, file: !1, discriminator: 1)
!513 = distinct !DILexicalBlock(scope: !509, file: !1, line: 277, column: 2)
!514 = !DILocation(line: 278, column: 2, scope: !515)
!515 = distinct !DILexicalBlock(scope: !6, file: !1, line: 278, column: 2)
!516 = !DILocation(line: 278, column: 2, scope: !6)
!517 = !DILocation(line: 278, column: 2, scope: !518)
!518 = !DILexicalBlockFile(scope: !519, file: !1, discriminator: 1)
!519 = distinct !DILexicalBlock(scope: !515, file: !1, line: 278, column: 2)
!520 = !DILocation(line: 279, column: 2, scope: !521)
!521 = !DILexicalBlockFile(scope: !522, file: !1, discriminator: 1)
!522 = distinct !DILexicalBlock(scope: !523, file: !1, line: 279, column: 2)
!523 = distinct !DILexicalBlock(scope: !6, file: !1, line: 279, column: 2)
!524 = !DILocation(line: 281, column: 1, scope: !6)
!525 = !DILocation(line: 355, column: 7, scope: !526)
!526 = distinct !DILexicalBlock(scope: !527, file: !1, line: 353, column: 14)
!527 = distinct !DILexicalBlock(scope: !148, file: !1, line: 343, column: 13)
!528 = !DILocation(line: 294, column: 12, scope: !148)
!529 = !DILocation(line: 289, column: 12, scope: !148)
!530 = !DILocation(line: 295, column: 12, scope: !148)
!531 = !DILocation(line: 363, column: 9, scope: !526)
!532 = !DILocation(line: 296, column: 12, scope: !148)
!533 = !DILocation(line: 365, column: 10, scope: !534)
!534 = distinct !DILexicalBlock(scope: !526, file: !1, line: 365, column: 7)
!535 = !DILocation(line: 373, column: 10, scope: !536)
!536 = distinct !DILexicalBlock(scope: !526, file: !1, line: 373, column: 7)
!537 = !DILocation(line: 365, column: 7, scope: !526)
!538 = !DILocation(line: 297, column: 12, scope: !148)
!539 = !DILocation(line: 299, column: 12, scope: !148)
!540 = !DILocation(line: 300, column: 12, scope: !148)
!541 = !DILocation(line: 301, column: 12, scope: !148)
!542 = !DILocation(line: 379, column: 11, scope: !526)
!543 = !DILocation(line: 302, column: 12, scope: !148)
!544 = !DILocation(line: 303, column: 12, scope: !148)
!545 = !DILocation(line: 304, column: 12, scope: !148)
!546 = !DILocation(line: 381, column: 11, scope: !526)
!547 = !DILocation(line: 385, column: 11, scope: !526)
!548 = !DILocation(line: 305, column: 12, scope: !148)
!549 = !DILocation(line: 387, column: 8, scope: !526)
!550 = !DILocation(line: 306, column: 12, scope: !148)
!551 = !DILocation(line: 389, column: 4, scope: !526)
!552 = !DILocation(line: 307, column: 12, scope: !148)
!553 = !DILocation(line: 290, column: 12, scope: !148)
!554 = !DILocation(line: 308, column: 12, scope: !148)
!555 = !DILocation(line: 399, column: 9, scope: !526)
!556 = !DILocation(line: 309, column: 12, scope: !148)
!557 = !DILocation(line: 401, column: 10, scope: !558)
!558 = distinct !DILexicalBlock(scope: !526, file: !1, line: 401, column: 7)
!559 = !DILocation(line: 401, column: 7, scope: !526)
!560 = !DILocation(line: 310, column: 12, scope: !148)
!561 = !DILocation(line: 311, column: 12, scope: !148)
!562 = !DILocation(line: 407, column: 11, scope: !526)
!563 = !DILocation(line: 312, column: 12, scope: !148)
!564 = !DILocation(line: 409, column: 11, scope: !526)
!565 = !DILocation(line: 313, column: 12, scope: !148)
!566 = !DILocation(line: 411, column: 8, scope: !526)
!567 = !DILocation(line: 314, column: 12, scope: !148)
!568 = !DILocation(line: 413, column: 4, scope: !526)
!569 = !DILocation(line: 315, column: 12, scope: !148)
!570 = !DILocation(line: 291, column: 12, scope: !148)
!571 = !DILocation(line: 316, column: 12, scope: !148)
!572 = !DILocation(line: 318, column: 12, scope: !148)
!573 = !DILocation(line: 427, column: 10, scope: !574)
!574 = distinct !DILexicalBlock(scope: !526, file: !1, line: 427, column: 7)
!575 = !DILocation(line: 463, column: 9, scope: !526)
!576 = !DILocation(line: 427, column: 7, scope: !526)
!577 = !DILocation(line: 319, column: 12, scope: !148)
!578 = !DILocation(line: 320, column: 12, scope: !148)
!579 = !DILocation(line: 321, column: 12, scope: !148)
!580 = !DILocation(line: 431, column: 11, scope: !526)
!581 = !DILocation(line: 435, column: 11, scope: !526)
!582 = !DILocation(line: 322, column: 12, scope: !148)
!583 = !DILocation(line: 437, column: 8, scope: !526)
!584 = !DILocation(line: 323, column: 12, scope: !148)
!585 = !DILocation(line: 439, column: 4, scope: !526)
!586 = !DILocation(line: 443, column: 8, scope: !587)
!587 = distinct !DILexicalBlock(scope: !526, file: !1, line: 443, column: 7)
!588 = !DILocation(line: 443, column: 7, scope: !526)
!589 = !DILocation(line: 449, column: 8, scope: !590)
!590 = distinct !DILexicalBlock(scope: !526, file: !1, line: 449, column: 7)
!591 = !DILocation(line: 449, column: 7, scope: !526)
!592 = !DILocation(line: 455, column: 9, scope: !526)
!593 = !DILocation(line: 324, column: 12, scope: !148)
!594 = !DILocation(line: 457, column: 9, scope: !526)
!595 = !DILocation(line: 325, column: 12, scope: !148)
!596 = !DILocation(line: 459, column: 10, scope: !597)
!597 = distinct !DILexicalBlock(scope: !526, file: !1, line: 459, column: 7)
!598 = !DILocation(line: 465, column: 11, scope: !526)
!599 = !DILocation(line: 467, column: 4, scope: !526)
!600 = !DILocation(line: 469, column: 4, scope: !526)
!601 = !DILocation(line: 467, column: 15, scope: !526)
!602 = !DILocation(line: 332, column: 12, scope: !148)
!603 = !DILocation(line: 485, column: 9, scope: !526)
!604 = !DILocation(line: 333, column: 12, scope: !148)
!605 = !DILocation(line: 287, column: 12, scope: !148)
!606 = !DILocation(line: 334, column: 12, scope: !148)
!607 = !DILocation(line: 335, column: 12, scope: !148)
!608 = !DILocation(line: 288, column: 12, scope: !148)
!609 = !DILocation(line: 336, column: 12, scope: !148)
!610 = !DILocation(line: 502, column: 8, scope: !527)
!611 = !DILocation(line: 337, column: 12, scope: !148)
!612 = !DILocation(line: 286, column: 12, scope: !148)
!613 = !DILocation(line: 345, column: 6, scope: !527)
!614 = !DILocation(line: 512, column: 2, scope: !148)
!615 = !DILocation(line: 345, column: 7, scope: !616)
!616 = distinct !DILexicalBlock(scope: !527, file: !1, line: 345, column: 6)
!617 = distinct !{!617, !618, !"polly.alias.scope.moves"}
!618 = distinct !{!618, !"polly.alias.scope.domain"}
!619 = !{!620, !621, !622, !623}
!620 = distinct !{!620, !618, !"polly.alias.scope.x.0"}
!621 = distinct !{!621, !618, !"polly.alias.scope.y.0"}
!622 = distinct !{!622, !618, !"polly.alias.scope.storemerge"}
!623 = distinct !{!623, !618, !"polly.alias.scope.z.0"}
!624 = !DILocation(line: 516, column: 14, scope: !211)
!625 = !DILocation(line: 516, column: 27, scope: !211)
!626 = !DILocation(line: 518, column: 12, scope: !211)
!627 = !DILocation(line: 519, column: 2, scope: !211)
!628 = !DILocation(line: 520, column: 2, scope: !211)
!629 = !DILocation(line: 521, column: 12, scope: !211)
!630 = !DILocation(line: 523, column: 2, scope: !211)
!631 = !DILocation(line: 524, column: 2, scope: !211)
!632 = !DILocation(line: 525, column: 12, scope: !211)
!633 = !DILocation(line: 526, column: 2, scope: !211)
!634 = !DILocation(line: 527, column: 2, scope: !211)
!635 = !DILocation(line: 528, column: 12, scope: !211)
!636 = !DILocation(line: 529, column: 12, scope: !211)
!637 = !DILocation(line: 530, column: 2, scope: !211)
!638 = !DILocation(line: 531, column: 2, scope: !211)
!639 = !DILocation(line: 532, column: 2, scope: !211)
!640 = !DILocation(line: 533, column: 2, scope: !211)
!641 = !DILocation(line: 534, column: 12, scope: !211)
!642 = !DILocation(line: 535, column: 12, scope: !211)
!643 = !DILocation(line: 536, column: 12, scope: !211)
!644 = !DILocation(line: 538, column: 2, scope: !211)
!645 = !DILocation(line: 539, column: 2, scope: !211)
!646 = !DILocation(line: 542, column: 2, scope: !211)
!647 = !DILocation(line: 543, column: 2, scope: !211)
!648 = !DILocation(line: 545, column: 2, scope: !211)
!649 = !DILocation(line: 550, column: 5, scope: !211)
!650 = !DILocation(line: 552, column: 2, scope: !211)
!651 = !DILocation(line: 522, column: 13, scope: !211)
!652 = !DILocation(line: 517, column: 13, scope: !211)
!653 = !DILocation(line: 556, column: 9, scope: !654)
!654 = distinct !DILexicalBlock(scope: !211, file: !1, line: 556, column: 5)
!655 = !DILocation(line: 556, column: 5, scope: !211)
!656 = !DILocation(line: 558, column: 6, scope: !211)
!657 = !DILocation(line: 562, column: 7, scope: !211)
!658 = !DILocation(line: 565, column: 2, scope: !211)
!659 = !DILocation(line: 576, column: 8, scope: !211)
!660 = !DILocation(line: 586, column: 7, scope: !211)
!661 = !DILocation(line: 588, column: 6, scope: !211)
!662 = !DILocation(line: 595, column: 2, scope: !211)
!663 = !DILocation(line: 596, column: 9, scope: !211)
!664 = !DILocation(line: 596, column: 29, scope: !211)
!665 = !DILocation(line: 596, column: 36, scope: !211)
!666 = !DILocation(line: 596, column: 56, scope: !211)
!667 = !DILocation(line: 596, column: 63, scope: !211)
!668 = !DILocation(line: 596, column: 84, scope: !211)
!669 = !DILocation(line: 596, column: 91, scope: !211)
!670 = !DILocation(line: 596, column: 111, scope: !211)
!671 = !DILocation(line: 596, column: 118, scope: !211)
!672 = !DILocation(line: 596, column: 138, scope: !211)
!673 = !DILocation(line: 596, column: 146, scope: !211)
!674 = !DILocation(line: 596, column: 167, scope: !211)
!675 = !DILocation(line: 596, column: 175, scope: !211)
!676 = !DILocation(line: 596, column: 197, scope: !211)
!677 = !DILocation(line: 596, column: 205, scope: !211)
!678 = !DILocation(line: 596, column: 227, scope: !211)
!679 = !DILocation(line: 596, column: 235, scope: !211)
!680 = !DILocation(line: 596, column: 256, scope: !211)
!681 = !DILocation(line: 596, column: 264, scope: !211)
!682 = !DILocation(line: 596, column: 285, scope: !211)
!683 = !DILocation(line: 596, column: 293, scope: !211)
!684 = !DILocation(line: 596, column: 315, scope: !211)
!685 = !DILocation(line: 596, column: 323, scope: !211)
!686 = !DILocation(line: 596, column: 345, scope: !211)
!687 = !DILocation(line: 596, column: 353, scope: !211)
!688 = !DILocation(line: 596, column: 374, scope: !211)
!689 = !DILocation(line: 596, column: 382, scope: !211)
!690 = !DILocation(line: 596, column: 403, scope: !211)
!691 = !DILocation(line: 596, column: 411, scope: !211)
!692 = !DILocation(line: 596, column: 432, scope: !211)
!693 = !DILocation(line: 596, column: 440, scope: !211)
!694 = !DILocation(line: 596, column: 462, scope: !211)
!695 = !DILocation(line: 596, column: 470, scope: !211)
!696 = !DILocation(line: 596, column: 492, scope: !211)
!697 = !DILocation(line: 596, column: 500, scope: !211)
!698 = !DILocation(line: 596, column: 520, scope: !211)
!699 = !DILocation(line: 596, column: 528, scope: !211)
!700 = !DILocation(line: 596, column: 549, scope: !211)
!701 = !DILocation(line: 596, column: 557, scope: !211)
!702 = !DILocation(line: 596, column: 578, scope: !211)
!703 = !DILocation(line: 596, column: 586, scope: !211)
!704 = !DILocation(line: 596, column: 607, scope: !211)
!705 = !DILocation(line: 596, column: 615, scope: !211)
!706 = !DILocation(line: 596, column: 637, scope: !211)
!707 = !DILocation(line: 596, column: 645, scope: !211)
!708 = !DILocation(line: 596, column: 667, scope: !211)
!709 = !DILocation(line: 596, column: 675, scope: !211)
!710 = !DILocation(line: 596, column: 696, scope: !211)
!711 = !DILocation(line: 596, column: 704, scope: !211)
!712 = !DILocation(line: 599, column: 2, scope: !211)
!713 = !DILocation(line: 603, column: 2, scope: !211)
!714 = !DILocation(line: 608, column: 2, scope: !211)
!715 = !DILocation(line: 609, column: 9, scope: !211)
!716 = !DILocation(line: 609, column: 28, scope: !211)
!717 = !DILocation(line: 609, column: 35, scope: !211)
!718 = !DILocation(line: 609, column: 56, scope: !211)
!719 = !DILocation(line: 609, column: 63, scope: !211)
!720 = !DILocation(line: 609, column: 82, scope: !211)
!721 = !DILocation(line: 609, column: 89, scope: !211)
!722 = !DILocation(line: 609, column: 110, scope: !211)
!723 = !DILocation(line: 609, column: 117, scope: !211)
!724 = !DILocation(line: 609, column: 137, scope: !211)
!725 = !DILocation(line: 609, column: 145, scope: !211)
!726 = !DILocation(line: 609, column: 166, scope: !211)
!727 = !DILocation(line: 609, column: 174, scope: !211)
!728 = !DILocation(line: 609, column: 195, scope: !211)
!729 = !DILocation(line: 609, column: 203, scope: !211)
!730 = !DILocation(line: 609, column: 225, scope: !211)
!731 = !DILocation(line: 609, column: 233, scope: !211)
!732 = !DILocation(line: 609, column: 255, scope: !211)
!733 = !DILocation(line: 609, column: 263, scope: !211)
!734 = !DILocation(line: 609, column: 283, scope: !211)
!735 = !DILocation(line: 609, column: 291, scope: !211)
!736 = !DILocation(line: 609, column: 312, scope: !211)
!737 = !DILocation(line: 609, column: 320, scope: !211)
!738 = !DILocation(line: 612, column: 2, scope: !211)
!739 = !DILocation(line: 616, column: 2, scope: !740)
!740 = !DILexicalBlockFile(scope: !741, file: !1, discriminator: 1)
!741 = distinct !DILexicalBlock(scope: !742, file: !1, line: 616, column: 2)
!742 = distinct !DILexicalBlock(scope: !211, file: !1, line: 616, column: 2)
!743 = !DILocation(line: 617, column: 2, scope: !744)
!744 = !DILexicalBlockFile(scope: !745, file: !1, discriminator: 1)
!745 = distinct !DILexicalBlock(scope: !746, file: !1, line: 617, column: 2)
!746 = distinct !DILexicalBlock(scope: !211, file: !1, line: 617, column: 2)
!747 = !DILocation(line: 621, column: 2, scope: !748)
!748 = !DILexicalBlockFile(scope: !749, file: !1, discriminator: 1)
!749 = distinct !DILexicalBlock(scope: !750, file: !1, line: 621, column: 2)
!750 = distinct !DILexicalBlock(scope: !211, file: !1, line: 621, column: 2)
!751 = !DILocation(line: 622, column: 2, scope: !752)
!752 = !DILexicalBlockFile(scope: !753, file: !1, discriminator: 1)
!753 = distinct !DILexicalBlock(scope: !754, file: !1, line: 622, column: 2)
!754 = distinct !DILexicalBlock(scope: !211, file: !1, line: 622, column: 2)
!755 = !DILocation(line: 623, column: 2, scope: !211)
