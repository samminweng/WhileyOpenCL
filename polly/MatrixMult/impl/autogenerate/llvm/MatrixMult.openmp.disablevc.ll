; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i64*, i64, i64, i64 }

@.str.1 = private unnamed_addr constant [7 x i8] c" data:\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c" width:\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c" height:\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @copy_Matrix(%struct.Matrix* nocapture readonly %_Matrix) #0 !dbg !4 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %_Matrix, i64 0, metadata !19, metadata !212), !dbg !213
  %call = tail call noalias i8* @malloc(i64 32) #9, !dbg !214
  %0 = bitcast i8* %call to %struct.Matrix*, !dbg !216
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %0, i64 0, metadata !20, metadata !212), !dbg !217
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 1, !dbg !218
  %1 = load i64, i64* %data_size, align 8, !dbg !218, !tbaa !219
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8, !dbg !218
  %2 = bitcast i8* %data_size1 to i64*, !dbg !218
  store i64 %1, i64* %2, align 8, !dbg !218, !tbaa !219
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 0, !dbg !218
  %3 = load i64*, i64** %data, align 8, !dbg !218, !tbaa !225
  %call3 = tail call i64* @copy(i64* %3, i64 %1) #9, !dbg !218
  %data4 = bitcast i8* %call to i64**, !dbg !218
  store i64* %call3, i64** %data4, align 8, !dbg !218, !tbaa !225
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 2, !dbg !226
  %width5 = getelementptr inbounds i8, i8* %call, i64 16, !dbg !227
  %4 = bitcast i64* %width to <2 x i64>*, !dbg !226
  %5 = load <2 x i64>, <2 x i64>* %4, align 8, !dbg !226, !tbaa !228
  %6 = bitcast i8* %width5 to <2 x i64>*, !dbg !229
  store <2 x i64> %5, <2 x i64>* %6, align 8, !dbg !229, !tbaa !228
  ret %struct.Matrix* %0, !dbg !230
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare i64* @copy(i64*, i64) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @free_Matrix(%struct.Matrix* nocapture %matrix) #0 !dbg !21 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %matrix, i64 0, metadata !25, metadata !212), !dbg !231
  %0 = bitcast %struct.Matrix* %matrix to i8**, !dbg !232
  %1 = load i8*, i8** %0, align 8, !dbg !232, !tbaa !225
  tail call void @free(i8* %1) #9, !dbg !233
  %2 = bitcast %struct.Matrix* %matrix to i8*, !dbg !234
  tail call void @free(i8* %2) #9, !dbg !235
  ret void, !dbg !236
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @printf_Matrix(%struct.Matrix* nocapture readonly %matrix) #0 !dbg !26 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %matrix, i64 0, metadata !28, metadata !212), !dbg !237
  %putchar = tail call i32 @putchar(i32 123) #9, !dbg !238
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !239
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 0, !dbg !240
  %0 = load i64*, i64** %data, align 8, !dbg !240, !tbaa !225
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 1, !dbg !240
  %1 = load i64, i64* %data_size, align 8, !dbg !240, !tbaa !219
  tail call void @printf1DArray(i64* %0, i64 %1) #9, !dbg !240
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0)), !dbg !241
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 2, !dbg !242
  %2 = load i64, i64* %width, align 8, !dbg !242, !tbaa !243
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %2), !dbg !244
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0)), !dbg !245
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 3, !dbg !246
  %3 = load i64, i64* %height, align 8, !dbg !246, !tbaa !247
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %3), !dbg !248
  %putchar10 = tail call i32 @putchar(i32 125) #9, !dbg !249
  ret void, !dbg !250
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

declare void @printf1DArray(i64*, i64) #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @matrix(i64 %width, i64 %height, i64* %data, i64 %data_size, i1 zeroext %data_has_ownership) #0 !dbg !29 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %width, i64 0, metadata !34, metadata !212), !dbg !251
  tail call void @llvm.dbg.value(metadata i64 %height, i64 0, metadata !35, metadata !212), !dbg !252
  tail call void @llvm.dbg.value(metadata i64* %data, i64 0, metadata !36, metadata !212), !dbg !253
  tail call void @llvm.dbg.value(metadata i64 %data_size, i64 0, metadata !37, metadata !212), !dbg !253
  tail call void @llvm.dbg.value(metadata i1 %data_has_ownership, i64 0, metadata !38, metadata !254), !dbg !255
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !40, metadata !212), !dbg !256
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !42, metadata !212), !dbg !257
  %call = tail call noalias i8* @malloc(i64 32) #9, !dbg !258
  %0 = bitcast i8* %call to %struct.Matrix*, !dbg !258
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %0, i64 0, metadata !41, metadata !212), !dbg !259
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8, !dbg !260
  %1 = bitcast i8* %data_size1 to i64*, !dbg !260
  store i64 %data_size, i64* %1, align 8, !dbg !260, !tbaa !219
  %call2 = tail call i64* @copy(i64* %data, i64 %data_size) #9, !dbg !260
  %data3 = bitcast i8* %call to i64**, !dbg !260
  store i64* %call2, i64** %data3, align 8, !dbg !260, !tbaa !225
  %height4 = getelementptr inbounds i8, i8* %call, i64 24, !dbg !261
  %2 = bitcast i8* %height4 to i64*, !dbg !261
  store i64 %height, i64* %2, align 8, !dbg !262, !tbaa !247
  %width5 = getelementptr inbounds i8, i8* %call, i64 16, !dbg !263
  %3 = bitcast i8* %width5 to i64*, !dbg !263
  store i64 %width, i64* %3, align 8, !dbg !264, !tbaa !243
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !42, metadata !212), !dbg !257
  br i1 %data_has_ownership, label %if.then7, label %if.end11, !dbg !265

if.then7:                                         ; preds = %entry
  %4 = bitcast i64* %data to i8*, !dbg !266
  tail call void @free(i8* %4) #9, !dbg !266
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !38, metadata !212), !dbg !255
  br label %if.end11, !dbg !266

if.end11:                                         ; preds = %entry, %if.then7
  ret %struct.Matrix* %0, !dbg !270
}

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @init() #4 !dbg !43 {
entry:
  %polly.par.userContext = alloca { i64* }, align 8
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !48, metadata !212), !dbg !271
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !49, metadata !212), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !50, metadata !212), !dbg !272
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !51, metadata !212), !dbg !273
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !212), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !53, metadata !212), !dbg !275
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !212), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !55, metadata !212), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !56, metadata !212), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !57, metadata !212), !dbg !279
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !58, metadata !212), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !59, metadata !212), !dbg !280
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !60, metadata !212), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !212), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !62, metadata !212), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !63, metadata !212), !dbg !284
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !64, metadata !212), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !65, metadata !212), !dbg !286
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !66, metadata !212), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !67, metadata !212), !dbg !288
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !68, metadata !212), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !69, metadata !212), !dbg !290
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !70, metadata !212), !dbg !291
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !71, metadata !212), !dbg !292
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !72, metadata !212), !dbg !293
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !73, metadata !212), !dbg !294
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !74, metadata !212), !dbg !295
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !75, metadata !212), !dbg !296
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !76, metadata !212), !dbg !297
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !78, metadata !212), !dbg !298
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !79, metadata !212), !dbg !299
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !80, metadata !212), !dbg !300
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !54, metadata !212), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !55, metadata !212), !dbg !277
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !56, metadata !212), !dbg !278
  tail call void @llvm.dbg.value(metadata i64 4000000, i64 0, metadata !57, metadata !212), !dbg !279
  tail call void @llvm.dbg.value(metadata i64 4000000, i64 0, metadata !59, metadata !212), !dbg !280
  %call = tail call i64* @gen1DArray(i32 0, i32 4000000) #9, !dbg !301
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !58, metadata !212), !dbg !280
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !60, metadata !212), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 4000000, i64 0, metadata !50, metadata !212), !dbg !272
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !49, metadata !212), !dbg !272
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !51, metadata !212), !dbg !273
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !60, metadata !212), !dbg !281
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !61, metadata !212), !dbg !282
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !52, metadata !212), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !62, metadata !212), !dbg !283
  %0 = bitcast { i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 8, i8* %0)
  %polly.subfn.storeaddr.call = getelementptr inbounds { i64* }, { i64* }* %polly.par.userContext, i64 0, i32 0
  store i64* %call, i64** %polly.subfn.storeaddr.call, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %0, i32 0, i64 0, i64 63, i64 1) #9
  call void @init_polly_subfn(i8* %0) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %0)
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !79, metadata !212), !dbg !299
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !80, metadata !212), !dbg !300
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !51, metadata !212), !dbg !273
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !34, metadata !212) #9, !dbg !302
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !35, metadata !212) #9, !dbg !304
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !36, metadata !212) #9, !dbg !305
  tail call void @llvm.dbg.value(metadata i64 4000000, i64 0, metadata !37, metadata !212) #9, !dbg !305
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !38, metadata !254) #9, !dbg !306
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !40, metadata !212) #9, !dbg !307
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !42, metadata !212) #9, !dbg !308
  %call.i = tail call noalias i8* @malloc(i64 32) #9, !dbg !309
  %1 = bitcast i8* %call.i to %struct.Matrix*, !dbg !309
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %1, i64 0, metadata !41, metadata !212) #9, !dbg !310
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8, !dbg !311
  %2 = bitcast i8* %data_size1.i to i64*, !dbg !311
  store i64 4000000, i64* %2, align 8, !dbg !311, !tbaa !219
  %call2.i = tail call i64* @copy(i64* %call, i64 4000000) #9, !dbg !311
  %data3.i = bitcast i8* %call.i to i64**, !dbg !311
  store i64* %call2.i, i64** %data3.i, align 8, !dbg !311, !tbaa !225
  %width5.i = getelementptr inbounds i8, i8* %call.i, i64 16, !dbg !312
  %3 = bitcast i8* %width5.i to <2 x i64>*, !dbg !313
  store <2 x i64> <i64 2000, i64 2000>, <2 x i64>* %3, align 8, !dbg !313, !tbaa !228
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !42, metadata !212) #9, !dbg !308
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %1, i64 0, metadata !77, metadata !212), !dbg !314
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !78, metadata !212), !dbg !298
  %4 = bitcast i64* %call to i8*, !dbg !315
  tail call void @free(i8* %4) #9, !dbg !315
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !51, metadata !212), !dbg !273
  ret %struct.Matrix* %1, !dbg !319
}

declare i64* @gen1DArray(i32, i32) #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @mat_mult(%struct.Matrix* nocapture %a, i1 zeroext %a_has_ownership, %struct.Matrix* nocapture %b, i1 zeroext %b_has_ownership) #4 !dbg !81 {
entry:
  %polly.par.userContext = alloca { i64*, i64*, i64* }, align 8
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !85, metadata !212), !dbg !320
  tail call void @llvm.dbg.value(metadata i1 %a_has_ownership, i64 0, metadata !86, metadata !254), !dbg !321
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !87, metadata !212), !dbg !322
  tail call void @llvm.dbg.value(metadata i1 %b_has_ownership, i64 0, metadata !88, metadata !254), !dbg !323
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !90, metadata !212), !dbg !324
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !91, metadata !212), !dbg !325
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !92, metadata !212), !dbg !325
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !93, metadata !212), !dbg !326
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !94, metadata !212), !dbg !327
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !95, metadata !212), !dbg !327
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !96, metadata !212), !dbg !328
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !97, metadata !212), !dbg !329
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !98, metadata !212), !dbg !329
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !99, metadata !212), !dbg !330
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !212), !dbg !331
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !101, metadata !212), !dbg !332
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !102, metadata !212), !dbg !333
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !103, metadata !212), !dbg !334
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !104, metadata !212), !dbg !335
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !105, metadata !212), !dbg !336
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !106, metadata !212), !dbg !337
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !107, metadata !212), !dbg !338
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !108, metadata !212), !dbg !338
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !109, metadata !212), !dbg !339
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !110, metadata !212), !dbg !340
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !111, metadata !212), !dbg !340
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !112, metadata !212), !dbg !341
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !113, metadata !212), !dbg !342
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !114, metadata !212), !dbg !342
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !115, metadata !212), !dbg !343
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !212), !dbg !344
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !117, metadata !212), !dbg !345
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !118, metadata !212), !dbg !346
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !119, metadata !212), !dbg !347
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !120, metadata !212), !dbg !348
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !121, metadata !212), !dbg !349
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !122, metadata !212), !dbg !350
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !123, metadata !212), !dbg !351
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !124, metadata !212), !dbg !352
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !125, metadata !212), !dbg !353
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !126, metadata !212), !dbg !354
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !127, metadata !212), !dbg !355
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !128, metadata !212), !dbg !356
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !129, metadata !212), !dbg !357
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !130, metadata !212), !dbg !358
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !131, metadata !212), !dbg !359
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !132, metadata !212), !dbg !360
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !133, metadata !212), !dbg !361
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !134, metadata !212), !dbg !362
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !135, metadata !212), !dbg !363
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !136, metadata !212), !dbg !364
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !137, metadata !212), !dbg !365
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !138, metadata !212), !dbg !366
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !139, metadata !212), !dbg !367
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !140, metadata !212), !dbg !368
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !141, metadata !212), !dbg !369
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !142, metadata !212), !dbg !370
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !143, metadata !212), !dbg !371
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !144, metadata !212), !dbg !372
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !146, metadata !212), !dbg !373
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !147, metadata !212), !dbg !374
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !148, metadata !212), !dbg !375
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !103, metadata !212), !dbg !334
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !104, metadata !212), !dbg !335
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !105, metadata !212), !dbg !336
  tail call void @llvm.dbg.value(metadata i64 4000000, i64 0, metadata !106, metadata !212), !dbg !337
  tail call void @llvm.dbg.value(metadata i64 4000000, i64 0, metadata !108, metadata !212), !dbg !338
  %call = tail call i64* @gen1DArray(i32 0, i32 4000000) #9, !dbg !376
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !107, metadata !212), !dbg !338
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !109, metadata !212), !dbg !339
  tail call void @llvm.dbg.value(metadata i64 4000000, i64 0, metadata !92, metadata !212), !dbg !325
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !91, metadata !212), !dbg !325
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !93, metadata !212), !dbg !326
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !109, metadata !212), !dbg !339
  %data_size9 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1, !dbg !377
  %data10 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !377
  %0 = load i64*, i64** %data10, align 8, !dbg !377, !tbaa !225
  %1 = load i64, i64* %data_size9, align 8, !dbg !377, !tbaa !219
  %call12 = tail call i64* @copy(i64* %0, i64 %1) #9, !dbg !377
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !110, metadata !212), !dbg !340
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !112, metadata !212), !dbg !341
  tail call void @llvm.dbg.value(metadata i64* %call12, i64 0, metadata !94, metadata !212), !dbg !327
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !96, metadata !212), !dbg !328
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !112, metadata !212), !dbg !341
  %data_size19 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !378
  %data20 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !378
  %2 = load i64*, i64** %data20, align 8, !dbg !378, !tbaa !225
  %3 = load i64, i64* %data_size19, align 8, !dbg !378, !tbaa !219
  %call22 = tail call i64* @copy(i64* %2, i64 %3) #9, !dbg !378
  tail call void @llvm.dbg.value(metadata i64* %call22, i64 0, metadata !113, metadata !212), !dbg !342
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !115, metadata !212), !dbg !343
  tail call void @llvm.dbg.value(metadata i64* %call22, i64 0, metadata !97, metadata !212), !dbg !329
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !99, metadata !212), !dbg !330
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !115, metadata !212), !dbg !343
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !116, metadata !212), !dbg !344
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !100, metadata !212), !dbg !331
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !117, metadata !212), !dbg !345
  %polly.access.call22 = getelementptr i64, i64* %call22, i64 4000000
  %4 = icmp ule i64* %polly.access.call22, %call
  %polly.access.call183 = getelementptr i64, i64* %call, i64 4000000
  %5 = icmp ule i64* %polly.access.call183, %call22
  %6 = or i1 %5, %4
  %polly.access.call12 = getelementptr i64, i64* %call12, i64 4000000
  %7 = icmp ule i64* %polly.access.call12, %call
  %8 = icmp ule i64* %polly.access.call183, %call12
  %9 = or i1 %8, %7
  %10 = and i1 %9, %6
  br i1 %10, label %polly.parallel.for, label %while.body30.preheader.preheader

while.body30.preheader.preheader:                 ; preds = %entry
  br label %while.body30.preheader, !dbg !347

while.body30.preheader:                           ; preds = %while.body30.preheader.preheader, %blklab7
  %i.0180 = phi i64 [ %add55, %blklab7 ], [ 0, %while.body30.preheader.preheader ]
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !119, metadata !212), !dbg !347
  %mul41 = mul nuw nsw i64 %i.0180, 2000, !dbg !379
  br label %while.body36.preheader, !dbg !383

while.body36.preheader:                           ; preds = %while.body30.preheader, %blklab9
  %j.0179 = phi i64 [ 0, %while.body30.preheader ], [ %add54, %blklab9 ]
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !121, metadata !212), !dbg !349
  %add = add nuw nsw i64 %j.0179, %mul41, !dbg !384
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %add, !dbg !385
  %.pre = load i64, i64* %arrayidx, align 8, !dbg !385, !tbaa !228
  br label %if.end40, !dbg !386

if.end40:                                         ; preds = %if.end40, %while.body36.preheader
  %11 = phi i64 [ %.pre, %while.body36.preheader ], [ %add49.1, %if.end40 ], !dbg !385
  %k.0178 = phi i64 [ 0, %while.body36.preheader ], [ %add53.1, %if.end40 ]
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !122, metadata !212), !dbg !350
  tail call void @llvm.dbg.value(metadata i64 %mul41, i64 0, metadata !123, metadata !212), !dbg !351
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !124, metadata !212), !dbg !352
  tail call void @llvm.dbg.value(metadata i64 %11, i64 0, metadata !125, metadata !212), !dbg !353
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !126, metadata !212), !dbg !354
  tail call void @llvm.dbg.value(metadata i64 %mul41, i64 0, metadata !127, metadata !212), !dbg !355
  %add43 = add nuw nsw i64 %k.0178, %mul41, !dbg !387
  tail call void @llvm.dbg.value(metadata i64 %add43, i64 0, metadata !128, metadata !212), !dbg !356
  %arrayidx44 = getelementptr inbounds i64, i64* %call12, i64 %add43, !dbg !388
  %12 = load i64, i64* %arrayidx44, align 8, !dbg !388, !tbaa !228
  tail call void @llvm.dbg.value(metadata i64 %12, i64 0, metadata !129, metadata !212), !dbg !357
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !130, metadata !212), !dbg !358
  %mul45 = mul nuw nsw i64 %k.0178, 2000, !dbg !389
  tail call void @llvm.dbg.value(metadata i64 %mul45, i64 0, metadata !131, metadata !212), !dbg !359
  %add46 = add nuw nsw i64 %mul45, %j.0179, !dbg !390
  tail call void @llvm.dbg.value(metadata i64 %add46, i64 0, metadata !132, metadata !212), !dbg !360
  %arrayidx47 = getelementptr inbounds i64, i64* %call22, i64 %add46, !dbg !391
  %13 = load i64, i64* %arrayidx47, align 8, !dbg !391, !tbaa !228
  tail call void @llvm.dbg.value(metadata i64 %13, i64 0, metadata !133, metadata !212), !dbg !361
  %mul48 = mul nsw i64 %13, %12, !dbg !392
  tail call void @llvm.dbg.value(metadata i64 %mul48, i64 0, metadata !134, metadata !212), !dbg !362
  %add49 = add nsw i64 %mul48, %11, !dbg !393
  tail call void @llvm.dbg.value(metadata i64 %add49, i64 0, metadata !135, metadata !212), !dbg !363
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !136, metadata !212), !dbg !364
  tail call void @llvm.dbg.value(metadata i64 %mul41, i64 0, metadata !137, metadata !212), !dbg !365
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !138, metadata !212), !dbg !366
  store i64 %add49, i64* %arrayidx, align 8, !dbg !394, !tbaa !228
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !139, metadata !212), !dbg !367
  %add53 = or i64 %k.0178, 1, !dbg !395
  tail call void @llvm.dbg.value(metadata i64 %add53, i64 0, metadata !140, metadata !212), !dbg !368
  tail call void @llvm.dbg.value(metadata i64 %add53, i64 0, metadata !102, metadata !212), !dbg !333
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !121, metadata !212), !dbg !349
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !122, metadata !212), !dbg !350
  tail call void @llvm.dbg.value(metadata i64 %mul41, i64 0, metadata !123, metadata !212), !dbg !351
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !124, metadata !212), !dbg !352
  tail call void @llvm.dbg.value(metadata i64 %11, i64 0, metadata !125, metadata !212), !dbg !353
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !126, metadata !212), !dbg !354
  tail call void @llvm.dbg.value(metadata i64 %mul41, i64 0, metadata !127, metadata !212), !dbg !355
  %add43.1 = add nuw nsw i64 %add53, %mul41, !dbg !387
  tail call void @llvm.dbg.value(metadata i64 %add43, i64 0, metadata !128, metadata !212), !dbg !356
  %arrayidx44.1 = getelementptr inbounds i64, i64* %call12, i64 %add43.1, !dbg !388
  %14 = load i64, i64* %arrayidx44.1, align 8, !dbg !388, !tbaa !228
  tail call void @llvm.dbg.value(metadata i64 %12, i64 0, metadata !129, metadata !212), !dbg !357
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !130, metadata !212), !dbg !358
  %mul45.1 = mul nuw nsw i64 %add53, 2000, !dbg !389
  tail call void @llvm.dbg.value(metadata i64 %mul45, i64 0, metadata !131, metadata !212), !dbg !359
  %add46.1 = add nuw nsw i64 %mul45.1, %j.0179, !dbg !390
  tail call void @llvm.dbg.value(metadata i64 %add46, i64 0, metadata !132, metadata !212), !dbg !360
  %arrayidx47.1 = getelementptr inbounds i64, i64* %call22, i64 %add46.1, !dbg !391
  %15 = load i64, i64* %arrayidx47.1, align 8, !dbg !391, !tbaa !228
  tail call void @llvm.dbg.value(metadata i64 %13, i64 0, metadata !133, metadata !212), !dbg !361
  %mul48.1 = mul nsw i64 %15, %14, !dbg !392
  tail call void @llvm.dbg.value(metadata i64 %mul48, i64 0, metadata !134, metadata !212), !dbg !362
  %add49.1 = add nsw i64 %mul48.1, %add49, !dbg !393
  tail call void @llvm.dbg.value(metadata i64 %add49, i64 0, metadata !135, metadata !212), !dbg !363
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !136, metadata !212), !dbg !364
  tail call void @llvm.dbg.value(metadata i64 %mul41, i64 0, metadata !137, metadata !212), !dbg !365
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !138, metadata !212), !dbg !366
  store i64 %add49.1, i64* %arrayidx, align 8, !dbg !394, !tbaa !228
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !139, metadata !212), !dbg !367
  %add53.1 = add nsw i64 %k.0178, 2, !dbg !395
  tail call void @llvm.dbg.value(metadata i64 %add53, i64 0, metadata !140, metadata !212), !dbg !368
  tail call void @llvm.dbg.value(metadata i64 %add53, i64 0, metadata !102, metadata !212), !dbg !333
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !121, metadata !212), !dbg !349
  %exitcond.1 = icmp eq i64 %add53.1, 2000, !dbg !386
  br i1 %exitcond.1, label %blklab9, label %if.end40, !dbg !386

blklab9:                                          ; preds = %if.end40
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !141, metadata !212), !dbg !369
  %add54 = add nuw nsw i64 %j.0179, 1, !dbg !396
  tail call void @llvm.dbg.value(metadata i64 %add54, i64 0, metadata !142, metadata !212), !dbg !370
  tail call void @llvm.dbg.value(metadata i64 %add54, i64 0, metadata !101, metadata !212), !dbg !332
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !119, metadata !212), !dbg !347
  %exitcond181 = icmp eq i64 %add54, 2000, !dbg !383
  br i1 %exitcond181, label %blklab7, label %while.body36.preheader, !dbg !383

blklab7:                                          ; preds = %blklab9
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !143, metadata !212), !dbg !371
  %add55 = add nuw nsw i64 %i.0180, 1, !dbg !397
  tail call void @llvm.dbg.value(metadata i64 %add55, i64 0, metadata !144, metadata !212), !dbg !372
  tail call void @llvm.dbg.value(metadata i64 %add55, i64 0, metadata !100, metadata !212), !dbg !331
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !117, metadata !212), !dbg !345
  %exitcond182 = icmp eq i64 %add55, 2000, !dbg !398
  br i1 %exitcond182, label %if.end58.loopexit, label %while.body30.preheader, !dbg !398

if.end58.loopexit:                                ; preds = %blklab7
  br label %if.end58, !dbg !374

if.end58:                                         ; preds = %if.end58.loopexit, %polly.parallel.for
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !147, metadata !212), !dbg !374
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !148, metadata !212), !dbg !375
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !93, metadata !212), !dbg !326
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !34, metadata !212) #9, !dbg !399
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !35, metadata !212) #9, !dbg !401
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !36, metadata !212) #9, !dbg !402
  tail call void @llvm.dbg.value(metadata i64 4000000, i64 0, metadata !37, metadata !212) #9, !dbg !402
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !38, metadata !254) #9, !dbg !403
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !40, metadata !212) #9, !dbg !404
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !42, metadata !212) #9, !dbg !405
  %call.i = tail call noalias i8* @malloc(i64 32) #9, !dbg !406
  %16 = bitcast i8* %call.i to %struct.Matrix*, !dbg !406
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %16, i64 0, metadata !41, metadata !212) #9, !dbg !407
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8, !dbg !408
  %17 = bitcast i8* %data_size1.i to i64*, !dbg !408
  store i64 4000000, i64* %17, align 8, !dbg !408, !tbaa !219
  %call2.i = tail call i64* @copy(i64* %call, i64 4000000) #9, !dbg !408
  %data3.i = bitcast i8* %call.i to i64**, !dbg !408
  store i64* %call2.i, i64** %data3.i, align 8, !dbg !408, !tbaa !225
  %width5.i = getelementptr inbounds i8, i8* %call.i, i64 16, !dbg !409
  %18 = bitcast i8* %width5.i to <2 x i64>*, !dbg !410
  store <2 x i64> <i64 2000, i64 2000>, <2 x i64>* %18, align 8, !dbg !410, !tbaa !228
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !42, metadata !212) #9, !dbg !405
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %16, i64 0, metadata !145, metadata !212), !dbg !411
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !146, metadata !212), !dbg !373
  br i1 %a_has_ownership, label %if.then61, label %if.end62, !dbg !412

if.then61:                                        ; preds = %if.end58
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !25, metadata !212) #9, !dbg !413
  %19 = bitcast %struct.Matrix* %a to i8**, !dbg !418
  %20 = load i8*, i8** %19, align 8, !dbg !418, !tbaa !225
  tail call void @free(i8* %20) #9, !dbg !419
  %21 = bitcast %struct.Matrix* %a to i8*, !dbg !420
  tail call void @free(i8* %21) #9, !dbg !421
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !86, metadata !212), !dbg !321
  br label %if.end62, !dbg !422

if.end62:                                         ; preds = %if.then61, %if.end58
  br i1 %b_has_ownership, label %if.then64, label %if.then70, !dbg !423

if.then64:                                        ; preds = %if.end62
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !25, metadata !212) #9, !dbg !424
  %22 = bitcast %struct.Matrix* %b to i8**, !dbg !429
  %23 = load i8*, i8** %22, align 8, !dbg !429, !tbaa !225
  tail call void @free(i8* %23) #9, !dbg !430
  %24 = bitcast %struct.Matrix* %b to i8*, !dbg !431
  tail call void @free(i8* %24) #9, !dbg !432
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !88, metadata !212), !dbg !323
  br label %if.then70, !dbg !433

if.then70:                                        ; preds = %if.then64, %if.end62
  %25 = bitcast i64* %call to i8*, !dbg !434
  tail call void @free(i8* %25) #9, !dbg !434
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !93, metadata !212), !dbg !326
  %26 = bitcast i64* %call12 to i8*, !dbg !438
  tail call void @free(i8* %26) #9, !dbg !438
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !96, metadata !212), !dbg !328
  %27 = bitcast i64* %call22 to i8*, !dbg !442
  tail call void @free(i8* %27) #9, !dbg !442
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !99, metadata !212), !dbg !330
  ret %struct.Matrix* %16, !dbg !446

polly.parallel.for:                               ; preds = %entry
  %28 = bitcast { i64*, i64*, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 24, i8* %28)
  %polly.subfn.storeaddr.call = getelementptr inbounds { i64*, i64*, i64* }, { i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64* %call, i64** %polly.subfn.storeaddr.call, align 8
  %polly.subfn.storeaddr.call12 = getelementptr inbounds { i64*, i64*, i64* }, { i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64* %call12, i64** %polly.subfn.storeaddr.call12, align 8
  %polly.subfn.storeaddr.call22 = getelementptr inbounds { i64*, i64*, i64* }, { i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %call22, i64** %polly.subfn.storeaddr.call22, align 8
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn, i8* %28, i32 0, i64 0, i64 63, i64 1) #9
  call void @mat_mult_polly_subfn(i8* %28) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %28)
  br label %if.end58
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %args) #5 !dbg !149 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !157, metadata !212), !dbg !447
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !158, metadata !212), !dbg !448
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !160, metadata !212), !dbg !449
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !162, metadata !212), !dbg !450
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !164, metadata !212), !dbg !451
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !165, metadata !212), !dbg !452
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !166, metadata !212), !dbg !452
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !167, metadata !212), !dbg !453
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !169, metadata !212), !dbg !454
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !172, metadata !212), !dbg !455
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !173, metadata !212), !dbg !455
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !174, metadata !212), !dbg !456
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !176, metadata !212), !dbg !457
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !177, metadata !212), !dbg !457
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !178, metadata !212), !dbg !458
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !179, metadata !212), !dbg !459
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !180, metadata !212), !dbg !460
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !182, metadata !212), !dbg !461
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !184, metadata !212), !dbg !462
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !185, metadata !212), !dbg !462
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !186, metadata !212), !dbg !463
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !188, metadata !212), !dbg !464
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !189, metadata !212), !dbg !464
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !190, metadata !212), !dbg !465
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !191, metadata !212), !dbg !466
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !192, metadata !212), !dbg !467
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !194, metadata !212), !dbg !468
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !195, metadata !212), !dbg !469
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !196, metadata !212), !dbg !469
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !197, metadata !212), !dbg !470
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !199, metadata !212), !dbg !471
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !200, metadata !212), !dbg !471
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !201, metadata !212), !dbg !472
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !203, metadata !212), !dbg !473
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !204, metadata !212), !dbg !474
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !206, metadata !212), !dbg !475
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !207, metadata !212), !dbg !475
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !208, metadata !212), !dbg !476
  %call = tail call %struct.Matrix* @init(), !dbg !477
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call, i64 0, metadata !168, metadata !212), !dbg !478
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !169, metadata !212), !dbg !454
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call, i64 0, metadata !159, metadata !212), !dbg !479
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !160, metadata !212), !dbg !449
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !169, metadata !212), !dbg !454
  tail call void @llvm.dbg.value(metadata i64 14, i64 0, metadata !173, metadata !212), !dbg !455
  %call7 = tail call noalias i8* @malloc(i64 112) #9, !dbg !480
  %0 = bitcast i8* %call7 to i64*, !dbg !480
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !172, metadata !212), !dbg !455
  %1 = bitcast i8* %call7 to <2 x i64>*, !dbg !481
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %1, align 8, !dbg !481, !tbaa !228
  %arrayidx9 = getelementptr inbounds i8, i8* %call7, i64 16, !dbg !482
  %2 = bitcast i8* %arrayidx9 to <2 x i64>*, !dbg !483
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %2, align 8, !dbg !483, !tbaa !228
  %arrayidx11 = getelementptr inbounds i8, i8* %call7, i64 32, !dbg !484
  %3 = bitcast i8* %arrayidx11 to <2 x i64>*, !dbg !485
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %3, align 8, !dbg !485, !tbaa !228
  %arrayidx13 = getelementptr inbounds i8, i8* %call7, i64 48, !dbg !486
  %4 = bitcast i8* %arrayidx13 to <2 x i64>*, !dbg !487
  store <2 x i64> <i64 32, i64 65>, <2 x i64>* %4, align 8, !dbg !487, !tbaa !228
  %arrayidx15 = getelementptr inbounds i8, i8* %call7, i64 64, !dbg !488
  %5 = bitcast i8* %arrayidx15 to <2 x i64>*, !dbg !489
  store <2 x i64> <i64 91, i64 78>, <2 x i64>* %5, align 8, !dbg !489, !tbaa !228
  %arrayidx17 = getelementptr inbounds i8, i8* %call7, i64 80, !dbg !490
  %6 = bitcast i8* %arrayidx17 to <2 x i64>*, !dbg !491
  store <2 x i64> <i64 93, i64 32>, <2 x i64>* %6, align 8, !dbg !491, !tbaa !228
  %arrayidx19 = getelementptr inbounds i8, i8* %call7, i64 96, !dbg !492
  %7 = bitcast i8* %arrayidx19 to <2 x i64>*, !dbg !493
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %7, align 8, !dbg !493, !tbaa !228
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !174, metadata !212), !dbg !456
  tail call void @printf_s(i64* %0, i64 14) #9, !dbg !494
  %data_size24 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call, i64 0, i32 1, !dbg !495
  %data25 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call, i64 0, i32 0, !dbg !495
  %8 = load i64*, i64** %data25, align 8, !dbg !495, !tbaa !225
  %9 = load i64, i64* %data_size24, align 8, !dbg !495, !tbaa !219
  %call27 = tail call i64* @copy(i64* %8, i64 %9) #9, !dbg !495
  tail call void @llvm.dbg.value(metadata i64* %call27, i64 0, metadata !176, metadata !212), !dbg !457
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !178, metadata !212), !dbg !458
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !179, metadata !212), !dbg !459
  %arrayidx28 = getelementptr inbounds i64, i64* %call27, i64 2000, !dbg !496
  %10 = load i64, i64* %arrayidx28, align 8, !dbg !496, !tbaa !228
  tail call void @llvm.dbg.value(metadata i64 %10, i64 0, metadata !180, metadata !212), !dbg !460
  %call29 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %10), !dbg !497
  %call33 = tail call %struct.Matrix* @init(), !dbg !498
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call33, i64 0, metadata !181, metadata !212), !dbg !499
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !182, metadata !212), !dbg !461
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call33, i64 0, metadata !161, metadata !212), !dbg !500
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !162, metadata !212), !dbg !450
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !182, metadata !212), !dbg !461
  tail call void @llvm.dbg.value(metadata i64 14, i64 0, metadata !185, metadata !212), !dbg !462
  %call40 = tail call noalias i8* @malloc(i64 112) #9, !dbg !501
  %11 = bitcast i8* %call40 to i64*, !dbg !501
  tail call void @llvm.dbg.value(metadata i64* %11, i64 0, metadata !184, metadata !212), !dbg !462
  %12 = bitcast i8* %call40 to <2 x i64>*, !dbg !502
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %12, align 8, !dbg !502, !tbaa !228
  %arrayidx43 = getelementptr inbounds i8, i8* %call40, i64 16, !dbg !503
  %13 = bitcast i8* %arrayidx43 to <2 x i64>*, !dbg !504
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %13, align 8, !dbg !504, !tbaa !228
  %arrayidx45 = getelementptr inbounds i8, i8* %call40, i64 32, !dbg !505
  %14 = bitcast i8* %arrayidx45 to <2 x i64>*, !dbg !506
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %14, align 8, !dbg !506, !tbaa !228
  %arrayidx47 = getelementptr inbounds i8, i8* %call40, i64 48, !dbg !507
  %15 = bitcast i8* %arrayidx47 to <2 x i64>*, !dbg !508
  store <2 x i64> <i64 32, i64 66>, <2 x i64>* %15, align 8, !dbg !508, !tbaa !228
  %arrayidx49 = getelementptr inbounds i8, i8* %call40, i64 64, !dbg !509
  %16 = bitcast i8* %arrayidx49 to <2 x i64>*, !dbg !510
  store <2 x i64> <i64 91, i64 78>, <2 x i64>* %16, align 8, !dbg !510, !tbaa !228
  %arrayidx51 = getelementptr inbounds i8, i8* %call40, i64 80, !dbg !511
  %17 = bitcast i8* %arrayidx51 to <2 x i64>*, !dbg !512
  store <2 x i64> <i64 93, i64 32>, <2 x i64>* %17, align 8, !dbg !512, !tbaa !228
  %arrayidx53 = getelementptr inbounds i8, i8* %call40, i64 96, !dbg !513
  %18 = bitcast i8* %arrayidx53 to <2 x i64>*, !dbg !514
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %18, align 8, !dbg !514, !tbaa !228
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !186, metadata !212), !dbg !463
  tail call void @printf_s(i64* %11, i64 14) #9, !dbg !515
  %data_size58 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call33, i64 0, i32 1, !dbg !516
  %data59 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call33, i64 0, i32 0, !dbg !516
  %19 = load i64*, i64** %data59, align 8, !dbg !516, !tbaa !225
  %20 = load i64, i64* %data_size58, align 8, !dbg !516, !tbaa !219
  %call61 = tail call i64* @copy(i64* %19, i64 %20) #9, !dbg !516
  tail call void @llvm.dbg.value(metadata i64* %call61, i64 0, metadata !188, metadata !212), !dbg !464
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !190, metadata !212), !dbg !465
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !191, metadata !212), !dbg !466
  %arrayidx62 = getelementptr inbounds i64, i64* %call61, i64 2000, !dbg !517
  %21 = load i64, i64* %arrayidx62, align 8, !dbg !517, !tbaa !228
  tail call void @llvm.dbg.value(metadata i64 %21, i64 0, metadata !192, metadata !212), !dbg !467
  %call63 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %21), !dbg !518
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !160, metadata !212), !dbg !449
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !162, metadata !212), !dbg !450
  %call67 = tail call %struct.Matrix* @mat_mult(%struct.Matrix* %call, i1 zeroext false, %struct.Matrix* %call33, i1 zeroext false), !dbg !519
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call67, i64 0, metadata !193, metadata !212), !dbg !520
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !194, metadata !212), !dbg !468
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call67, i64 0, metadata !163, metadata !212), !dbg !521
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !164, metadata !212), !dbg !451
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !194, metadata !212), !dbg !468
  %data_size74 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call67, i64 0, i32 1, !dbg !522
  %data75 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call67, i64 0, i32 0, !dbg !522
  %22 = load i64*, i64** %data75, align 8, !dbg !522, !tbaa !225
  %23 = load i64, i64* %data_size74, align 8, !dbg !522, !tbaa !219
  %call77 = tail call i64* @copy(i64* %22, i64 %23) #9, !dbg !522
  tail call void @llvm.dbg.value(metadata i64* %call77, i64 0, metadata !195, metadata !212), !dbg !469
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !197, metadata !212), !dbg !470
  tail call void @llvm.dbg.value(metadata i64* %call77, i64 0, metadata !165, metadata !212), !dbg !452
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !167, metadata !212), !dbg !453
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !197, metadata !212), !dbg !470
  tail call void @llvm.dbg.value(metadata i64 14, i64 0, metadata !200, metadata !212), !dbg !471
  %call84 = tail call noalias i8* @malloc(i64 112) #9, !dbg !523
  %24 = bitcast i8* %call84 to i64*, !dbg !523
  tail call void @llvm.dbg.value(metadata i64* %24, i64 0, metadata !199, metadata !212), !dbg !471
  %25 = bitcast i8* %call84 to <2 x i64>*, !dbg !524
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %25, align 8, !dbg !524, !tbaa !228
  %arrayidx87 = getelementptr inbounds i8, i8* %call84, i64 16, !dbg !525
  %26 = bitcast i8* %arrayidx87 to <2 x i64>*, !dbg !526
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %26, align 8, !dbg !526, !tbaa !228
  %arrayidx89 = getelementptr inbounds i8, i8* %call84, i64 32, !dbg !527
  %27 = bitcast i8* %arrayidx89 to <2 x i64>*, !dbg !528
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %27, align 8, !dbg !528, !tbaa !228
  %arrayidx91 = getelementptr inbounds i8, i8* %call84, i64 48, !dbg !529
  %28 = bitcast i8* %arrayidx91 to <2 x i64>*, !dbg !530
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %28, align 8, !dbg !530, !tbaa !228
  %arrayidx93 = getelementptr inbounds i8, i8* %call84, i64 64, !dbg !531
  %29 = bitcast i8* %arrayidx93 to <2 x i64>*, !dbg !532
  store <2 x i64> <i64 91, i64 78>, <2 x i64>* %29, align 8, !dbg !532, !tbaa !228
  %arrayidx95 = getelementptr inbounds i8, i8* %call84, i64 80, !dbg !533
  %30 = bitcast i8* %arrayidx95 to <2 x i64>*, !dbg !534
  store <2 x i64> <i64 93, i64 32>, <2 x i64>* %30, align 8, !dbg !534, !tbaa !228
  %arrayidx97 = getelementptr inbounds i8, i8* %call84, i64 96, !dbg !535
  %31 = bitcast i8* %arrayidx97 to <2 x i64>*, !dbg !536
  store <2 x i64> <i64 61, i64 32>, <2 x i64>* %31, align 8, !dbg !536, !tbaa !228
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !201, metadata !212), !dbg !472
  tail call void @printf_s(i64* %24, i64 14) #9, !dbg !537
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !203, metadata !212), !dbg !473
  %arrayidx99 = getelementptr inbounds i64, i64* %call77, i64 2000, !dbg !538
  %32 = load i64, i64* %arrayidx99, align 8, !dbg !538, !tbaa !228
  tail call void @llvm.dbg.value(metadata i64 %32, i64 0, metadata !204, metadata !212), !dbg !474
  %call100 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %32), !dbg !539
  tail call void @llvm.dbg.value(metadata i64 25, i64 0, metadata !207, metadata !212), !dbg !475
  %call104 = tail call noalias i8* @malloc(i64 200) #9, !dbg !540
  %33 = bitcast i8* %call104 to i64*, !dbg !540
  tail call void @llvm.dbg.value(metadata i64* %33, i64 0, metadata !206, metadata !212), !dbg !475
  %34 = bitcast i8* %call104 to <2 x i64>*, !dbg !541
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %34, align 8, !dbg !541, !tbaa !228
  %arrayidx107 = getelementptr inbounds i8, i8* %call104, i64 16, !dbg !542
  %35 = bitcast i8* %arrayidx107 to <2 x i64>*, !dbg !543
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %35, align 8, !dbg !543, !tbaa !228
  %arrayidx109 = getelementptr inbounds i8, i8* %call104, i64 32, !dbg !544
  %36 = bitcast i8* %arrayidx109 to <2 x i64>*, !dbg !545
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %36, align 8, !dbg !545, !tbaa !228
  %arrayidx111 = getelementptr inbounds i8, i8* %call104, i64 48, !dbg !546
  %37 = bitcast i8* %arrayidx111 to <2 x i64>*, !dbg !547
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %37, align 8, !dbg !547, !tbaa !228
  %arrayidx113 = getelementptr inbounds i8, i8* %call104, i64 64, !dbg !548
  %38 = bitcast i8* %arrayidx113 to <2 x i64>*, !dbg !549
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %38, align 8, !dbg !549, !tbaa !228
  %arrayidx115 = getelementptr inbounds i8, i8* %call104, i64 80, !dbg !550
  %39 = bitcast i8* %arrayidx115 to <2 x i64>*, !dbg !551
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %39, align 8, !dbg !551, !tbaa !228
  %arrayidx117 = getelementptr inbounds i8, i8* %call104, i64 96, !dbg !552
  %40 = bitcast i8* %arrayidx117 to <2 x i64>*, !dbg !553
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %40, align 8, !dbg !553, !tbaa !228
  %arrayidx119 = getelementptr inbounds i8, i8* %call104, i64 112, !dbg !554
  %41 = bitcast i8* %arrayidx119 to <2 x i64>*, !dbg !555
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %41, align 8, !dbg !555, !tbaa !228
  %arrayidx121 = getelementptr inbounds i8, i8* %call104, i64 128, !dbg !556
  %42 = bitcast i8* %arrayidx121 to <2 x i64>*, !dbg !557
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %42, align 8, !dbg !557, !tbaa !228
  %arrayidx123 = getelementptr inbounds i8, i8* %call104, i64 144, !dbg !558
  %43 = bitcast i8* %arrayidx123 to <2 x i64>*, !dbg !559
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %43, align 8, !dbg !559, !tbaa !228
  %arrayidx125 = getelementptr inbounds i8, i8* %call104, i64 160, !dbg !560
  %44 = bitcast i8* %arrayidx125 to <2 x i64>*, !dbg !561
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %44, align 8, !dbg !561, !tbaa !228
  %arrayidx127 = getelementptr inbounds i8, i8* %call104, i64 176, !dbg !562
  %45 = bitcast i8* %arrayidx127 to <2 x i64>*, !dbg !563
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %45, align 8, !dbg !563, !tbaa !228
  %arrayidx129 = getelementptr inbounds i8, i8* %call104, i64 192, !dbg !564
  %46 = bitcast i8* %arrayidx129 to i64*, !dbg !564
  store i64 101, i64* %46, align 8, !dbg !565, !tbaa !228
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !208, metadata !212), !dbg !476
  tail call void @println_s(i64* %33, i64 25) #9, !dbg !566
  tail call void @free_Matrix(%struct.Matrix* %call), !dbg !567
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !160, metadata !212), !dbg !449
  tail call void @free_Matrix(%struct.Matrix* %call33), !dbg !571
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !162, metadata !212), !dbg !450
  tail call void @free_Matrix(%struct.Matrix* %call67), !dbg !575
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !164, metadata !212), !dbg !451
  %47 = bitcast i64* %call77 to i8*, !dbg !579
  tail call void @free(i8* %47) #9, !dbg !579
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !167, metadata !212), !dbg !453
  tail call void @free(i8* %call7) #9, !dbg !583
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !174, metadata !212), !dbg !456
  %48 = bitcast i64* %call27 to i8*, !dbg !587
  tail call void @free(i8* %48) #9, !dbg !587
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !178, metadata !212), !dbg !458
  tail call void @free(i8* %call40) #9, !dbg !591
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !186, metadata !212), !dbg !463
  %49 = bitcast i64* %call61 to i8*, !dbg !595
  tail call void @free(i8* %49) #9, !dbg !595
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !190, metadata !212), !dbg !465
  tail call void @free(i8* %call84) #9, !dbg !599
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !201, metadata !212), !dbg !472
  tail call void @free(i8* %call104) #9, !dbg !603
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !208, metadata !212), !dbg !476
  tail call void @exit(i32 0) #10, !dbg !607
  unreachable, !dbg !607
}

declare void @printf_s(i64*, i64) #3

declare void @println_s(i64*, i64) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #6

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #7

declare i32 @putchar(i32)

define internal void @init_polly_subfn(i8* nocapture readonly %polly.par.userContext) #8 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64**
  %polly.subfunc.arg.call = load i64*, i64** %0, align 8
  %1 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %3 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_preheader3

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit10.loopexit.us
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_preheader3
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %5 = mul nsw i64 %polly.indvar, -32
  %6 = add nsw i64 %5, 1999
  %7 = icmp sgt i64 %6, 31
  %8 = select i1 %7, i64 31, i64 %6
  %polly.loop_guard = icmp sgt i64 %8, -1
  %9 = shl nsw i64 %polly.indvar, 5
  %polly.adjust_ub13 = add i64 %8, -1
  br i1 %polly.loop_guard, label %polly.loop_header8.preheader.us.preheader, label %polly.loop_exit4

polly.loop_header8.preheader.us.preheader:        ; preds = %polly.loop_preheader3
  br label %polly.loop_header8.preheader.us

polly.loop_header8.us:                            ; preds = %polly.loop_header8.preheader.us, %polly.loop_exit17.us
  %polly.indvar11.us = phi i64 [ %polly.indvar_next12.us, %polly.loop_exit17.us ], [ 0, %polly.loop_header8.preheader.us ]
  %10 = add nsw i64 %polly.indvar11.us, %9
  %11 = mul i64 %10, 2000
  %12 = add i64 %11, %18
  br label %polly.loop_header15.us

polly.loop_header15.us:                           ; preds = %polly.loop_header15.us, %polly.loop_header8.us
  %polly.indvar18.us = phi i64 [ 0, %polly.loop_header8.us ], [ %polly.indvar_next19.us, %polly.loop_header15.us ]
  %13 = add i64 %12, %polly.indvar18.us
  %scevgep.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %13
  %_p_scalar_.us = load i64, i64* %scevgep.us, align 8, !alias.scope !608, !noalias !2, !llvm.mem.parallel_loop_access !610
  %p_add15.us = add nsw i64 %_p_scalar_.us, %10, !dbg !611
  store i64 %p_add15.us, i64* %scevgep.us, align 8, !alias.scope !608, !noalias !2, !llvm.mem.parallel_loop_access !610
  %polly.indvar_next19.us = add nuw nsw i64 %polly.indvar18.us, 1
  %polly.loop_cond21.us = icmp sgt i64 %polly.indvar18.us, %polly.adjust_ub20.us
  br i1 %polly.loop_cond21.us, label %polly.loop_exit17.us, label %polly.loop_header15.us, !llvm.loop !610

polly.loop_exit17.us:                             ; preds = %polly.loop_header15.us
  %polly.indvar_next12.us = add nuw nsw i64 %polly.indvar11.us, 1
  %polly.loop_cond14.us = icmp sgt i64 %polly.indvar11.us, %polly.adjust_ub13
  br i1 %polly.loop_cond14.us, label %polly.loop_exit10.loopexit.us, label %polly.loop_header8.us

polly.loop_header8.preheader.us:                  ; preds = %polly.loop_header8.preheader.us.preheader, %polly.loop_exit10.loopexit.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit10.loopexit.us ], [ 0, %polly.loop_header8.preheader.us.preheader ]
  %14 = mul nsw i64 %polly.indvar5.us, -32
  %15 = add nsw i64 %14, 1999
  %16 = icmp sgt i64 %15, 31
  %17 = select i1 %16, i64 31, i64 %15
  %18 = shl i64 %polly.indvar5.us, 5
  %polly.adjust_ub20.us = add i64 %17, -1
  br label %polly.loop_header8.us

polly.loop_exit10.loopexit.us:                    ; preds = %polly.loop_exit17.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond.us = icmp eq i64 %polly.indvar_next6.us, 63
  br i1 %exitcond.us, label %polly.loop_exit4.loopexit, label %polly.loop_header8.preheader.us
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @mat_mult_polly_subfn(i8* nocapture readonly %polly.par.userContext) #8 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64**
  %polly.subfunc.arg.call = load i64*, i64** %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64**
  %polly.subfunc.arg.call12 = load i64*, i64** %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.call22 = load i64*, i64** %4, align 8
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit, label %polly.par.loadIVBounds.preheader

polly.par.loadIVBounds.preheader:                 ; preds = %polly.par.setup
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %7 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.preheader, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_preheader3

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit10.us-lcssa.us.us
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_preheader3
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_preheader3

polly.loop_preheader3:                            ; preds = %polly.par.loadIVBounds, %polly.loop_exit4
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  %9 = mul nsw i64 %polly.indvar, -32
  %10 = add nsw i64 %9, 1999
  %11 = icmp sgt i64 %10, 31
  %12 = select i1 %11, i64 31, i64 %10
  %polly.loop_guard = icmp sgt i64 %12, -1
  %13 = shl i64 %polly.indvar, 5
  %polly.adjust_ub19 = add i64 %12, -1
  br i1 %polly.loop_guard, label %polly.loop_preheader9.us.preheader, label %polly.loop_exit4

polly.loop_preheader9.us.preheader:               ; preds = %polly.loop_preheader3
  br label %polly.loop_preheader9.us

polly.loop_preheader9.us:                         ; preds = %polly.loop_preheader9.us.preheader, %polly.loop_exit10.us-lcssa.us.us
  %polly.indvar5.us = phi i64 [ %polly.indvar_next6.us, %polly.loop_exit10.us-lcssa.us.us ], [ 0, %polly.loop_preheader9.us.preheader ]
  %14 = mul nsw i64 %polly.indvar5.us, -32
  %15 = add nsw i64 %14, 1999
  %16 = icmp sgt i64 %15, 31
  %17 = select i1 %16, i64 31, i64 %15
  %18 = shl nsw i64 %polly.indvar5.us, 5
  %polly.adjust_ub26.us = add i64 %17, -1
  br label %polly.loop_header14.preheader.us.us

polly.loop_header14.preheader.us.us:              ; preds = %polly.loop_exit16.loopexit.us.us, %polly.loop_preheader9.us
  %polly.indvar11.us.us = phi i64 [ 0, %polly.loop_preheader9.us ], [ %polly.indvar_next12.us.us, %polly.loop_exit16.loopexit.us.us ]
  %19 = mul nsw i64 %polly.indvar11.us.us, -32
  %20 = add nsw i64 %19, 1999
  %21 = icmp sgt i64 %20, 31
  %22 = select i1 %21, i64 31, i64 %20
  %23 = shl nsw i64 %polly.indvar11.us.us, 5
  %polly.adjust_ub33.us.us = add i64 %22, -1
  br label %polly.loop_header14.us.us

polly.loop_exit16.loopexit.us.us:                 ; preds = %polly.loop_exit23.us.us
  %polly.indvar_next12.us.us = add nuw nsw i64 %polly.indvar11.us.us, 1
  %exitcond.us.us = icmp eq i64 %polly.indvar_next12.us.us, 63
  br i1 %exitcond.us.us, label %polly.loop_exit10.us-lcssa.us.us, label %polly.loop_header14.preheader.us.us

polly.loop_header14.us.us:                        ; preds = %polly.loop_exit23.us.us, %polly.loop_header14.preheader.us.us
  %polly.indvar17.us.us = phi i64 [ %polly.indvar_next18.us.us, %polly.loop_exit23.us.us ], [ 0, %polly.loop_header14.preheader.us.us ]
  %24 = add nsw i64 %polly.indvar17.us.us, %13
  %25 = mul i64 %24, 2000
  br label %polly.loop_header21.us.us

polly.loop_exit23.us.us:                          ; preds = %polly.loop_exit30.us.us
  %polly.indvar_next18.us.us = add nuw nsw i64 %polly.indvar17.us.us, 1
  %polly.loop_cond20.us.us = icmp sgt i64 %polly.indvar17.us.us, %polly.adjust_ub19
  br i1 %polly.loop_cond20.us.us, label %polly.loop_exit16.loopexit.us.us, label %polly.loop_header14.us.us

polly.loop_header21.us.us:                        ; preds = %polly.loop_exit30.us.us, %polly.loop_header14.us.us
  %polly.indvar24.us.us = phi i64 [ 0, %polly.loop_header14.us.us ], [ %polly.indvar_next25.us.us, %polly.loop_exit30.us.us ]
  %26 = add nuw nsw i64 %polly.indvar24.us.us, %18
  %27 = add i64 %26, %25
  %scevgep.us.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %27
  %scevgep.promoted.us.us = load i64, i64* %scevgep.us.us, align 8, !alias.scope !614, !noalias !616
  br label %polly.loop_header28.us.us

polly.loop_exit30.us.us:                          ; preds = %polly.loop_header28.us.us
  %p_add49.us.us.lcssa = phi i64 [ %p_add49.us.us, %polly.loop_header28.us.us ]
  store i64 %p_add49.us.us.lcssa, i64* %scevgep.us.us, align 8, !alias.scope !614, !noalias !616
  %polly.indvar_next25.us.us = add nuw nsw i64 %polly.indvar24.us.us, 1
  %polly.loop_cond27.us.us = icmp sgt i64 %polly.indvar24.us.us, %polly.adjust_ub26.us
  br i1 %polly.loop_cond27.us.us, label %polly.loop_exit23.us.us, label %polly.loop_header21.us.us

polly.loop_header28.us.us:                        ; preds = %polly.loop_header28.us.us, %polly.loop_header21.us.us
  %p_add4940.us.us = phi i64 [ %scevgep.promoted.us.us, %polly.loop_header21.us.us ], [ %p_add49.us.us, %polly.loop_header28.us.us ]
  %polly.indvar31.us.us = phi i64 [ 0, %polly.loop_header21.us.us ], [ %polly.indvar_next32.us.us, %polly.loop_header28.us.us ]
  %28 = add nuw nsw i64 %polly.indvar31.us.us, %23
  %29 = add i64 %28, %25
  %scevgep35.us.us = getelementptr i64, i64* %polly.subfunc.arg.call12, i64 %29
  %_p_scalar_36.us.us = load i64, i64* %scevgep35.us.us, align 8, !alias.scope !617, !noalias !619
  %30 = mul nuw nsw i64 %28, 2000
  %31 = add nuw nsw i64 %30, %26
  %scevgep37.us.us = getelementptr i64, i64* %polly.subfunc.arg.call22, i64 %31
  %_p_scalar_38.us.us = load i64, i64* %scevgep37.us.us, align 8, !alias.scope !618, !noalias !620
  %p_mul48.us.us = mul nsw i64 %_p_scalar_38.us.us, %_p_scalar_36.us.us, !dbg !392
  %p_add49.us.us = add nsw i64 %p_mul48.us.us, %p_add4940.us.us, !dbg !393
  %polly.indvar_next32.us.us = add nuw nsw i64 %polly.indvar31.us.us, 1
  %polly.loop_cond34.us.us = icmp sgt i64 %polly.indvar31.us.us, %polly.adjust_ub33.us.us
  br i1 %polly.loop_cond34.us.us, label %polly.loop_exit30.us.us, label %polly.loop_header28.us.us

polly.loop_exit10.us-lcssa.us.us:                 ; preds = %polly.loop_exit16.loopexit.us.us
  %polly.indvar_next6.us = add nuw nsw i64 %polly.indvar5.us, 1
  %exitcond39.us = icmp eq i64 %polly.indvar_next6.us, 63
  br i1 %exitcond39.us, label %polly.loop_exit4.loopexit, label %polly.loop_preheader9.us
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone }
attributes #8 = { "polly.skip.fn" }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!209, !210}
!llvm.ident = !{!211}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: true, runtimeVersion: 0, emissionKind: 1, enums: !2, subprograms: !3)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate")
!2 = !{}
!3 = !{!4, !21, !26, !29, !43, !81, !149}
!4 = distinct !DISubprogram(name: "copy_Matrix", scope: !1, file: !1, line: 2, type: !5, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, variables: !18)
!5 = !DISubroutineType(types: !6)
!6 = !{!7, !7}
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64, align: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "Matrix", file: !9, line: 8, baseType: !10)
!9 = !DIFile(filename: "./MatrixMult.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate")
!10 = !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 4, size: 256, align: 64, elements: !11)
!11 = !{!12, !15, !16, !17}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !10, file: !9, line: 5, baseType: !13, size: 64, align: 64)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64, align: 64)
!14 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "data_size", scope: !10, file: !9, line: 5, baseType: !14, size: 64, align: 64, offset: 64)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !10, file: !9, line: 6, baseType: !14, size: 64, align: 64, offset: 128)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !10, file: !9, line: 7, baseType: !14, size: 64, align: 64, offset: 192)
!18 = !{!19, !20}
!19 = !DILocalVariable(name: "_Matrix", arg: 1, scope: !4, file: !1, line: 2, type: !7)
!20 = !DILocalVariable(name: "new_Matrix", scope: !4, file: !1, line: 3, type: !7)
!21 = distinct !DISubprogram(name: "free_Matrix", scope: !1, file: !1, line: 9, type: !22, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: true, variables: !24)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !7}
!24 = !{!25}
!25 = !DILocalVariable(name: "matrix", arg: 1, scope: !21, file: !1, line: 9, type: !7)
!26 = distinct !DISubprogram(name: "printf_Matrix", scope: !1, file: !1, line: 13, type: !22, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: true, variables: !27)
!27 = !{!28}
!28 = !DILocalVariable(name: "matrix", arg: 1, scope: !26, file: !1, line: 13, type: !7)
!29 = distinct !DISubprogram(name: "matrix", scope: !1, file: !1, line: 23, type: !30, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: true, variables: !33)
!30 = !DISubroutineType(types: !31)
!31 = !{!7, !14, !14, !13, !14, !32}
!32 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!33 = !{!34, !35, !36, !37, !38, !39, !40, !41, !42}
!34 = !DILocalVariable(name: "width", arg: 1, scope: !29, file: !1, line: 23, type: !14)
!35 = !DILocalVariable(name: "height", arg: 2, scope: !29, file: !1, line: 23, type: !14)
!36 = !DILocalVariable(name: "data", arg: 3, scope: !29, file: !1, line: 23, type: !13)
!37 = !DILocalVariable(name: "data_size", arg: 4, scope: !29, file: !1, line: 23, type: !14)
!38 = !DILocalVariable(name: "data_has_ownership", arg: 5, scope: !29, file: !1, line: 23, type: !32)
!39 = !DILocalVariable(name: "r", scope: !29, file: !1, line: 24, type: !7)
!40 = !DILocalVariable(name: "r_has_ownership", scope: !29, file: !1, line: 25, type: !32)
!41 = !DILocalVariable(name: "_4", scope: !29, file: !1, line: 26, type: !7)
!42 = !DILocalVariable(name: "_4_has_ownership", scope: !29, file: !1, line: 27, type: !32)
!43 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 42, type: !44, isLocal: false, isDefinition: true, scopeLine: 42, isOptimized: true, variables: !46)
!44 = !DISubroutineType(types: !45)
!45 = !{!7}
!46 = !{!47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80}
!47 = !DILocalVariable(name: "r", scope: !43, file: !1, line: 43, type: !7)
!48 = !DILocalVariable(name: "r_has_ownership", scope: !43, file: !1, line: 44, type: !32)
!49 = !DILocalVariable(name: "data", scope: !43, file: !1, line: 45, type: !13)
!50 = !DILocalVariable(name: "data_size", scope: !43, file: !1, line: 45, type: !14)
!51 = !DILocalVariable(name: "data_has_ownership", scope: !43, file: !1, line: 46, type: !32)
!52 = !DILocalVariable(name: "i", scope: !43, file: !1, line: 47, type: !14)
!53 = !DILocalVariable(name: "j", scope: !43, file: !1, line: 48, type: !14)
!54 = !DILocalVariable(name: "_4", scope: !43, file: !1, line: 49, type: !14)
!55 = !DILocalVariable(name: "_5", scope: !43, file: !1, line: 50, type: !14)
!56 = !DILocalVariable(name: "_6", scope: !43, file: !1, line: 51, type: !14)
!57 = !DILocalVariable(name: "_7", scope: !43, file: !1, line: 52, type: !14)
!58 = !DILocalVariable(name: "_8", scope: !43, file: !1, line: 53, type: !13)
!59 = !DILocalVariable(name: "_8_size", scope: !43, file: !1, line: 53, type: !14)
!60 = !DILocalVariable(name: "_8_has_ownership", scope: !43, file: !1, line: 54, type: !32)
!61 = !DILocalVariable(name: "_9", scope: !43, file: !1, line: 55, type: !14)
!62 = !DILocalVariable(name: "_10", scope: !43, file: !1, line: 56, type: !14)
!63 = !DILocalVariable(name: "_11", scope: !43, file: !1, line: 57, type: !14)
!64 = !DILocalVariable(name: "_12", scope: !43, file: !1, line: 58, type: !14)
!65 = !DILocalVariable(name: "_13", scope: !43, file: !1, line: 59, type: !14)
!66 = !DILocalVariable(name: "_14", scope: !43, file: !1, line: 60, type: !14)
!67 = !DILocalVariable(name: "_15", scope: !43, file: !1, line: 61, type: !14)
!68 = !DILocalVariable(name: "_16", scope: !43, file: !1, line: 62, type: !14)
!69 = !DILocalVariable(name: "_17", scope: !43, file: !1, line: 63, type: !14)
!70 = !DILocalVariable(name: "_18", scope: !43, file: !1, line: 64, type: !14)
!71 = !DILocalVariable(name: "_19", scope: !43, file: !1, line: 65, type: !14)
!72 = !DILocalVariable(name: "_20", scope: !43, file: !1, line: 66, type: !14)
!73 = !DILocalVariable(name: "_21", scope: !43, file: !1, line: 67, type: !14)
!74 = !DILocalVariable(name: "_22", scope: !43, file: !1, line: 68, type: !14)
!75 = !DILocalVariable(name: "_23", scope: !43, file: !1, line: 69, type: !14)
!76 = !DILocalVariable(name: "_24", scope: !43, file: !1, line: 70, type: !14)
!77 = !DILocalVariable(name: "_25", scope: !43, file: !1, line: 71, type: !7)
!78 = !DILocalVariable(name: "_25_has_ownership", scope: !43, file: !1, line: 72, type: !32)
!79 = !DILocalVariable(name: "_26", scope: !43, file: !1, line: 73, type: !14)
!80 = !DILocalVariable(name: "_27", scope: !43, file: !1, line: 74, type: !14)
!81 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 169, type: !82, isLocal: false, isDefinition: true, scopeLine: 169, flags: DIFlagPrototyped, isOptimized: true, variables: !84)
!82 = !DISubroutineType(types: !83)
!83 = !{!7, !7, !32, !7, !32}
!84 = !{!85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148}
!85 = !DILocalVariable(name: "a", arg: 1, scope: !81, file: !1, line: 169, type: !7)
!86 = !DILocalVariable(name: "a_has_ownership", arg: 2, scope: !81, file: !1, line: 169, type: !32)
!87 = !DILocalVariable(name: "b", arg: 3, scope: !81, file: !1, line: 169, type: !7)
!88 = !DILocalVariable(name: "b_has_ownership", arg: 4, scope: !81, file: !1, line: 169, type: !32)
!89 = !DILocalVariable(name: "r", scope: !81, file: !1, line: 170, type: !7)
!90 = !DILocalVariable(name: "r_has_ownership", scope: !81, file: !1, line: 171, type: !32)
!91 = !DILocalVariable(name: "data", scope: !81, file: !1, line: 172, type: !13)
!92 = !DILocalVariable(name: "data_size", scope: !81, file: !1, line: 172, type: !14)
!93 = !DILocalVariable(name: "data_has_ownership", scope: !81, file: !1, line: 173, type: !32)
!94 = !DILocalVariable(name: "a_data", scope: !81, file: !1, line: 174, type: !13)
!95 = !DILocalVariable(name: "a_data_size", scope: !81, file: !1, line: 174, type: !14)
!96 = !DILocalVariable(name: "a_data_has_ownership", scope: !81, file: !1, line: 175, type: !32)
!97 = !DILocalVariable(name: "b_data", scope: !81, file: !1, line: 176, type: !13)
!98 = !DILocalVariable(name: "b_data_size", scope: !81, file: !1, line: 176, type: !14)
!99 = !DILocalVariable(name: "b_data_has_ownership", scope: !81, file: !1, line: 177, type: !32)
!100 = !DILocalVariable(name: "i", scope: !81, file: !1, line: 178, type: !14)
!101 = !DILocalVariable(name: "j", scope: !81, file: !1, line: 179, type: !14)
!102 = !DILocalVariable(name: "k", scope: !81, file: !1, line: 180, type: !14)
!103 = !DILocalVariable(name: "_9", scope: !81, file: !1, line: 181, type: !14)
!104 = !DILocalVariable(name: "_10", scope: !81, file: !1, line: 182, type: !14)
!105 = !DILocalVariable(name: "_11", scope: !81, file: !1, line: 183, type: !14)
!106 = !DILocalVariable(name: "_12", scope: !81, file: !1, line: 184, type: !14)
!107 = !DILocalVariable(name: "_13", scope: !81, file: !1, line: 185, type: !13)
!108 = !DILocalVariable(name: "_13_size", scope: !81, file: !1, line: 185, type: !14)
!109 = !DILocalVariable(name: "_13_has_ownership", scope: !81, file: !1, line: 186, type: !32)
!110 = !DILocalVariable(name: "_14", scope: !81, file: !1, line: 187, type: !13)
!111 = !DILocalVariable(name: "_14_size", scope: !81, file: !1, line: 187, type: !14)
!112 = !DILocalVariable(name: "_14_has_ownership", scope: !81, file: !1, line: 188, type: !32)
!113 = !DILocalVariable(name: "_15", scope: !81, file: !1, line: 189, type: !13)
!114 = !DILocalVariable(name: "_15_size", scope: !81, file: !1, line: 189, type: !14)
!115 = !DILocalVariable(name: "_15_has_ownership", scope: !81, file: !1, line: 190, type: !32)
!116 = !DILocalVariable(name: "_16", scope: !81, file: !1, line: 191, type: !14)
!117 = !DILocalVariable(name: "_17", scope: !81, file: !1, line: 192, type: !14)
!118 = !DILocalVariable(name: "_18", scope: !81, file: !1, line: 193, type: !14)
!119 = !DILocalVariable(name: "_19", scope: !81, file: !1, line: 194, type: !14)
!120 = !DILocalVariable(name: "_20", scope: !81, file: !1, line: 195, type: !14)
!121 = !DILocalVariable(name: "_21", scope: !81, file: !1, line: 196, type: !14)
!122 = !DILocalVariable(name: "_22", scope: !81, file: !1, line: 197, type: !14)
!123 = !DILocalVariable(name: "_23", scope: !81, file: !1, line: 198, type: !14)
!124 = !DILocalVariable(name: "_24", scope: !81, file: !1, line: 199, type: !14)
!125 = !DILocalVariable(name: "_25", scope: !81, file: !1, line: 200, type: !14)
!126 = !DILocalVariable(name: "_26", scope: !81, file: !1, line: 201, type: !14)
!127 = !DILocalVariable(name: "_27", scope: !81, file: !1, line: 202, type: !14)
!128 = !DILocalVariable(name: "_28", scope: !81, file: !1, line: 203, type: !14)
!129 = !DILocalVariable(name: "_29", scope: !81, file: !1, line: 204, type: !14)
!130 = !DILocalVariable(name: "_30", scope: !81, file: !1, line: 205, type: !14)
!131 = !DILocalVariable(name: "_31", scope: !81, file: !1, line: 206, type: !14)
!132 = !DILocalVariable(name: "_32", scope: !81, file: !1, line: 207, type: !14)
!133 = !DILocalVariable(name: "_33", scope: !81, file: !1, line: 208, type: !14)
!134 = !DILocalVariable(name: "_34", scope: !81, file: !1, line: 209, type: !14)
!135 = !DILocalVariable(name: "_35", scope: !81, file: !1, line: 210, type: !14)
!136 = !DILocalVariable(name: "_36", scope: !81, file: !1, line: 211, type: !14)
!137 = !DILocalVariable(name: "_37", scope: !81, file: !1, line: 212, type: !14)
!138 = !DILocalVariable(name: "_38", scope: !81, file: !1, line: 213, type: !14)
!139 = !DILocalVariable(name: "_39", scope: !81, file: !1, line: 214, type: !14)
!140 = !DILocalVariable(name: "_40", scope: !81, file: !1, line: 215, type: !14)
!141 = !DILocalVariable(name: "_41", scope: !81, file: !1, line: 216, type: !14)
!142 = !DILocalVariable(name: "_42", scope: !81, file: !1, line: 217, type: !14)
!143 = !DILocalVariable(name: "_43", scope: !81, file: !1, line: 218, type: !14)
!144 = !DILocalVariable(name: "_44", scope: !81, file: !1, line: 219, type: !14)
!145 = !DILocalVariable(name: "_45", scope: !81, file: !1, line: 220, type: !7)
!146 = !DILocalVariable(name: "_45_has_ownership", scope: !81, file: !1, line: 221, type: !32)
!147 = !DILocalVariable(name: "_46", scope: !81, file: !1, line: 222, type: !14)
!148 = !DILocalVariable(name: "_47", scope: !81, file: !1, line: 223, type: !14)
!149 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 381, type: !150, isLocal: false, isDefinition: true, scopeLine: 381, flags: DIFlagPrototyped, isOptimized: true, variables: !156)
!150 = !DISubroutineType(types: !151)
!151 = !{!152, !152, !153}
!152 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64, align: 64)
!154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !155, size: 64, align: 64)
!155 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!156 = !{!157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208}
!157 = !DILocalVariable(name: "argc", arg: 1, scope: !149, file: !1, line: 381, type: !152)
!158 = !DILocalVariable(name: "args", arg: 2, scope: !149, file: !1, line: 381, type: !153)
!159 = !DILocalVariable(name: "A", scope: !149, file: !1, line: 382, type: !7)
!160 = !DILocalVariable(name: "A_has_ownership", scope: !149, file: !1, line: 383, type: !32)
!161 = !DILocalVariable(name: "B", scope: !149, file: !1, line: 384, type: !7)
!162 = !DILocalVariable(name: "B_has_ownership", scope: !149, file: !1, line: 385, type: !32)
!163 = !DILocalVariable(name: "C", scope: !149, file: !1, line: 386, type: !7)
!164 = !DILocalVariable(name: "C_has_ownership", scope: !149, file: !1, line: 387, type: !32)
!165 = !DILocalVariable(name: "data", scope: !149, file: !1, line: 388, type: !13)
!166 = !DILocalVariable(name: "data_size", scope: !149, file: !1, line: 388, type: !14)
!167 = !DILocalVariable(name: "data_has_ownership", scope: !149, file: !1, line: 389, type: !32)
!168 = !DILocalVariable(name: "_5", scope: !149, file: !1, line: 390, type: !7)
!169 = !DILocalVariable(name: "_5_has_ownership", scope: !149, file: !1, line: 391, type: !32)
!170 = !DILocalVariable(name: "_6", scope: !149, file: !1, line: 392, type: !171)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!172 = !DILocalVariable(name: "_8", scope: !149, file: !1, line: 393, type: !13)
!173 = !DILocalVariable(name: "_8_size", scope: !149, file: !1, line: 393, type: !14)
!174 = !DILocalVariable(name: "_8_has_ownership", scope: !149, file: !1, line: 394, type: !32)
!175 = !DILocalVariable(name: "_9", scope: !149, file: !1, line: 395, type: !171)
!176 = !DILocalVariable(name: "_11", scope: !149, file: !1, line: 396, type: !13)
!177 = !DILocalVariable(name: "_11_size", scope: !149, file: !1, line: 396, type: !14)
!178 = !DILocalVariable(name: "_11_has_ownership", scope: !149, file: !1, line: 397, type: !32)
!179 = !DILocalVariable(name: "_12", scope: !149, file: !1, line: 398, type: !14)
!180 = !DILocalVariable(name: "_13", scope: !149, file: !1, line: 399, type: !14)
!181 = !DILocalVariable(name: "_14", scope: !149, file: !1, line: 400, type: !7)
!182 = !DILocalVariable(name: "_14_has_ownership", scope: !149, file: !1, line: 401, type: !32)
!183 = !DILocalVariable(name: "_15", scope: !149, file: !1, line: 402, type: !171)
!184 = !DILocalVariable(name: "_17", scope: !149, file: !1, line: 403, type: !13)
!185 = !DILocalVariable(name: "_17_size", scope: !149, file: !1, line: 403, type: !14)
!186 = !DILocalVariable(name: "_17_has_ownership", scope: !149, file: !1, line: 404, type: !32)
!187 = !DILocalVariable(name: "_18", scope: !149, file: !1, line: 405, type: !171)
!188 = !DILocalVariable(name: "_20", scope: !149, file: !1, line: 406, type: !13)
!189 = !DILocalVariable(name: "_20_size", scope: !149, file: !1, line: 406, type: !14)
!190 = !DILocalVariable(name: "_20_has_ownership", scope: !149, file: !1, line: 407, type: !32)
!191 = !DILocalVariable(name: "_21", scope: !149, file: !1, line: 408, type: !14)
!192 = !DILocalVariable(name: "_22", scope: !149, file: !1, line: 409, type: !14)
!193 = !DILocalVariable(name: "_23", scope: !149, file: !1, line: 410, type: !7)
!194 = !DILocalVariable(name: "_23_has_ownership", scope: !149, file: !1, line: 411, type: !32)
!195 = !DILocalVariable(name: "_24", scope: !149, file: !1, line: 412, type: !13)
!196 = !DILocalVariable(name: "_24_size", scope: !149, file: !1, line: 412, type: !14)
!197 = !DILocalVariable(name: "_24_has_ownership", scope: !149, file: !1, line: 413, type: !32)
!198 = !DILocalVariable(name: "_25", scope: !149, file: !1, line: 414, type: !171)
!199 = !DILocalVariable(name: "_27", scope: !149, file: !1, line: 415, type: !13)
!200 = !DILocalVariable(name: "_27_size", scope: !149, file: !1, line: 415, type: !14)
!201 = !DILocalVariable(name: "_27_has_ownership", scope: !149, file: !1, line: 416, type: !32)
!202 = !DILocalVariable(name: "_28", scope: !149, file: !1, line: 417, type: !171)
!203 = !DILocalVariable(name: "_30", scope: !149, file: !1, line: 418, type: !14)
!204 = !DILocalVariable(name: "_31", scope: !149, file: !1, line: 419, type: !14)
!205 = !DILocalVariable(name: "_32", scope: !149, file: !1, line: 420, type: !171)
!206 = !DILocalVariable(name: "_34", scope: !149, file: !1, line: 421, type: !13)
!207 = !DILocalVariable(name: "_34_size", scope: !149, file: !1, line: 421, type: !14)
!208 = !DILocalVariable(name: "_34_has_ownership", scope: !149, file: !1, line: 422, type: !32)
!209 = !{i32 2, !"Dwarf Version", i32 4}
!210 = !{i32 2, !"Debug Info Version", i32 3}
!211 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!212 = !DIExpression()
!213 = !DILocation(line: 2, column: 29, scope: !4)
!214 = !DILocation(line: 3, column: 23, scope: !215)
!215 = !DILexicalBlockFile(scope: !4, file: !1, discriminator: 1)
!216 = !DILocation(line: 3, column: 23, scope: !4)
!217 = !DILocation(line: 3, column: 10, scope: !4)
!218 = !DILocation(line: 4, column: 2, scope: !4)
!219 = !{!220, !224, i64 8}
!220 = !{!"", !221, i64 0, !224, i64 8, !224, i64 16, !224, i64 24}
!221 = !{!"any pointer", !222, i64 0}
!222 = !{!"omnipotent char", !223, i64 0}
!223 = !{!"Simple C/C++ TBAA"}
!224 = !{!"long long", !222, i64 0}
!225 = !{!220, !221, i64 0}
!226 = !DILocation(line: 5, column: 31, scope: !4)
!227 = !DILocation(line: 5, column: 14, scope: !4)
!228 = !{!224, !224, i64 0}
!229 = !DILocation(line: 5, column: 20, scope: !4)
!230 = !DILocation(line: 7, column: 2, scope: !4)
!231 = !DILocation(line: 9, column: 26, scope: !21)
!232 = !DILocation(line: 10, column: 15, scope: !21)
!233 = !DILocation(line: 10, column: 2, scope: !21)
!234 = !DILocation(line: 11, column: 7, scope: !21)
!235 = !DILocation(line: 11, column: 2, scope: !21)
!236 = !DILocation(line: 12, column: 1, scope: !21)
!237 = !DILocation(line: 13, column: 28, scope: !26)
!238 = !DILocation(line: 14, column: 2, scope: !26)
!239 = !DILocation(line: 15, column: 2, scope: !26)
!240 = !DILocation(line: 16, column: 2, scope: !26)
!241 = !DILocation(line: 17, column: 2, scope: !26)
!242 = !DILocation(line: 18, column: 25, scope: !26)
!243 = !{!220, !224, i64 16}
!244 = !DILocation(line: 18, column: 2, scope: !26)
!245 = !DILocation(line: 19, column: 2, scope: !26)
!246 = !DILocation(line: 20, column: 25, scope: !26)
!247 = !{!220, !224, i64 24}
!248 = !DILocation(line: 20, column: 2, scope: !26)
!249 = !DILocation(line: 21, column: 2, scope: !26)
!250 = !DILocation(line: 22, column: 1, scope: !26)
!251 = !DILocation(line: 23, column: 26, scope: !29)
!252 = !DILocation(line: 23, column: 43, scope: !29)
!253 = !DILocation(line: 23, column: 51, scope: !29)
!254 = !DIExpression(DW_OP_bit_piece, 0, 1)
!255 = !DILocation(line: 23, column: 78, scope: !29)
!256 = !DILocation(line: 25, column: 2, scope: !29)
!257 = !DILocation(line: 27, column: 2, scope: !29)
!258 = !DILocation(line: 30, column: 7, scope: !29)
!259 = !DILocation(line: 26, column: 10, scope: !29)
!260 = !DILocation(line: 31, column: 2, scope: !29)
!261 = !DILocation(line: 32, column: 6, scope: !29)
!262 = !DILocation(line: 32, column: 13, scope: !29)
!263 = !DILocation(line: 33, column: 6, scope: !29)
!264 = !DILocation(line: 33, column: 12, scope: !29)
!265 = !DILocation(line: 36, column: 2, scope: !29)
!266 = !DILocation(line: 36, column: 2, scope: !267)
!267 = !DILexicalBlockFile(scope: !268, file: !1, discriminator: 1)
!268 = distinct !DILexicalBlock(scope: !269, file: !1, line: 36, column: 2)
!269 = distinct !DILexicalBlock(scope: !29, file: !1, line: 36, column: 2)
!270 = !DILocation(line: 38, column: 2, scope: !29)
!271 = !DILocation(line: 44, column: 2, scope: !43)
!272 = !DILocation(line: 45, column: 2, scope: !43)
!273 = !DILocation(line: 46, column: 2, scope: !43)
!274 = !DILocation(line: 47, column: 12, scope: !43)
!275 = !DILocation(line: 48, column: 12, scope: !43)
!276 = !DILocation(line: 49, column: 12, scope: !43)
!277 = !DILocation(line: 50, column: 12, scope: !43)
!278 = !DILocation(line: 51, column: 12, scope: !43)
!279 = !DILocation(line: 52, column: 12, scope: !43)
!280 = !DILocation(line: 53, column: 2, scope: !43)
!281 = !DILocation(line: 54, column: 2, scope: !43)
!282 = !DILocation(line: 55, column: 12, scope: !43)
!283 = !DILocation(line: 56, column: 12, scope: !43)
!284 = !DILocation(line: 57, column: 12, scope: !43)
!285 = !DILocation(line: 58, column: 12, scope: !43)
!286 = !DILocation(line: 59, column: 12, scope: !43)
!287 = !DILocation(line: 60, column: 12, scope: !43)
!288 = !DILocation(line: 61, column: 12, scope: !43)
!289 = !DILocation(line: 62, column: 12, scope: !43)
!290 = !DILocation(line: 63, column: 12, scope: !43)
!291 = !DILocation(line: 64, column: 12, scope: !43)
!292 = !DILocation(line: 65, column: 12, scope: !43)
!293 = !DILocation(line: 66, column: 12, scope: !43)
!294 = !DILocation(line: 67, column: 12, scope: !43)
!295 = !DILocation(line: 68, column: 12, scope: !43)
!296 = !DILocation(line: 69, column: 12, scope: !43)
!297 = !DILocation(line: 70, column: 12, scope: !43)
!298 = !DILocation(line: 72, column: 2, scope: !43)
!299 = !DILocation(line: 73, column: 12, scope: !43)
!300 = !DILocation(line: 74, column: 12, scope: !43)
!301 = !DILocation(line: 85, column: 2, scope: !43)
!302 = !DILocation(line: 23, column: 26, scope: !29, inlinedAt: !303)
!303 = distinct !DILocation(line: 159, column: 8, scope: !43)
!304 = !DILocation(line: 23, column: 43, scope: !29, inlinedAt: !303)
!305 = !DILocation(line: 23, column: 51, scope: !29, inlinedAt: !303)
!306 = !DILocation(line: 23, column: 78, scope: !29, inlinedAt: !303)
!307 = !DILocation(line: 25, column: 2, scope: !29, inlinedAt: !303)
!308 = !DILocation(line: 27, column: 2, scope: !29, inlinedAt: !303)
!309 = !DILocation(line: 30, column: 7, scope: !29, inlinedAt: !303)
!310 = !DILocation(line: 26, column: 10, scope: !29, inlinedAt: !303)
!311 = !DILocation(line: 31, column: 2, scope: !29, inlinedAt: !303)
!312 = !DILocation(line: 33, column: 6, scope: !29, inlinedAt: !303)
!313 = !DILocation(line: 33, column: 12, scope: !29, inlinedAt: !303)
!314 = !DILocation(line: 71, column: 10, scope: !43)
!315 = !DILocation(line: 163, column: 2, scope: !316)
!316 = !DILexicalBlockFile(scope: !317, file: !1, discriminator: 1)
!317 = distinct !DILexicalBlock(scope: !318, file: !1, line: 163, column: 2)
!318 = distinct !DILexicalBlock(scope: !43, file: !1, line: 163, column: 2)
!319 = !DILocation(line: 165, column: 2, scope: !43)
!320 = !DILocation(line: 169, column: 26, scope: !81)
!321 = !DILocation(line: 169, column: 29, scope: !81)
!322 = !DILocation(line: 169, column: 63, scope: !81)
!323 = !DILocation(line: 169, column: 66, scope: !81)
!324 = !DILocation(line: 171, column: 2, scope: !81)
!325 = !DILocation(line: 172, column: 2, scope: !81)
!326 = !DILocation(line: 173, column: 2, scope: !81)
!327 = !DILocation(line: 174, column: 2, scope: !81)
!328 = !DILocation(line: 175, column: 2, scope: !81)
!329 = !DILocation(line: 176, column: 2, scope: !81)
!330 = !DILocation(line: 177, column: 2, scope: !81)
!331 = !DILocation(line: 178, column: 12, scope: !81)
!332 = !DILocation(line: 179, column: 12, scope: !81)
!333 = !DILocation(line: 180, column: 12, scope: !81)
!334 = !DILocation(line: 181, column: 12, scope: !81)
!335 = !DILocation(line: 182, column: 12, scope: !81)
!336 = !DILocation(line: 183, column: 12, scope: !81)
!337 = !DILocation(line: 184, column: 12, scope: !81)
!338 = !DILocation(line: 185, column: 2, scope: !81)
!339 = !DILocation(line: 186, column: 2, scope: !81)
!340 = !DILocation(line: 187, column: 2, scope: !81)
!341 = !DILocation(line: 188, column: 2, scope: !81)
!342 = !DILocation(line: 189, column: 2, scope: !81)
!343 = !DILocation(line: 190, column: 2, scope: !81)
!344 = !DILocation(line: 191, column: 12, scope: !81)
!345 = !DILocation(line: 192, column: 12, scope: !81)
!346 = !DILocation(line: 193, column: 12, scope: !81)
!347 = !DILocation(line: 194, column: 12, scope: !81)
!348 = !DILocation(line: 195, column: 12, scope: !81)
!349 = !DILocation(line: 196, column: 12, scope: !81)
!350 = !DILocation(line: 197, column: 12, scope: !81)
!351 = !DILocation(line: 198, column: 12, scope: !81)
!352 = !DILocation(line: 199, column: 12, scope: !81)
!353 = !DILocation(line: 200, column: 12, scope: !81)
!354 = !DILocation(line: 201, column: 12, scope: !81)
!355 = !DILocation(line: 202, column: 12, scope: !81)
!356 = !DILocation(line: 203, column: 12, scope: !81)
!357 = !DILocation(line: 204, column: 12, scope: !81)
!358 = !DILocation(line: 205, column: 12, scope: !81)
!359 = !DILocation(line: 206, column: 12, scope: !81)
!360 = !DILocation(line: 207, column: 12, scope: !81)
!361 = !DILocation(line: 208, column: 12, scope: !81)
!362 = !DILocation(line: 209, column: 12, scope: !81)
!363 = !DILocation(line: 210, column: 12, scope: !81)
!364 = !DILocation(line: 211, column: 12, scope: !81)
!365 = !DILocation(line: 212, column: 12, scope: !81)
!366 = !DILocation(line: 213, column: 12, scope: !81)
!367 = !DILocation(line: 214, column: 12, scope: !81)
!368 = !DILocation(line: 215, column: 12, scope: !81)
!369 = !DILocation(line: 216, column: 12, scope: !81)
!370 = !DILocation(line: 217, column: 12, scope: !81)
!371 = !DILocation(line: 218, column: 12, scope: !81)
!372 = !DILocation(line: 219, column: 12, scope: !81)
!373 = !DILocation(line: 221, column: 2, scope: !81)
!374 = !DILocation(line: 222, column: 12, scope: !81)
!375 = !DILocation(line: 223, column: 12, scope: !81)
!376 = !DILocation(line: 234, column: 2, scope: !81)
!377 = !DILocation(line: 243, column: 2, scope: !81)
!378 = !DILocation(line: 252, column: 2, scope: !81)
!379 = !DILocation(line: 292, column: 10, scope: !380)
!380 = distinct !DILexicalBlock(scope: !381, file: !1, line: 284, column: 15)
!381 = distinct !DILexicalBlock(scope: !382, file: !1, line: 274, column: 14)
!382 = distinct !DILexicalBlock(scope: !81, file: !1, line: 264, column: 13)
!383 = !DILocation(line: 278, column: 7, scope: !381)
!384 = !DILocation(line: 294, column: 12, scope: !380)
!385 = !DILocation(line: 296, column: 9, scope: !380)
!386 = !DILocation(line: 288, column: 8, scope: !380)
!387 = !DILocation(line: 302, column: 12, scope: !380)
!388 = !DILocation(line: 304, column: 9, scope: !380)
!389 = !DILocation(line: 308, column: 10, scope: !380)
!390 = !DILocation(line: 310, column: 12, scope: !380)
!391 = !DILocation(line: 312, column: 9, scope: !380)
!392 = !DILocation(line: 314, column: 12, scope: !380)
!393 = !DILocation(line: 316, column: 12, scope: !380)
!394 = !DILocation(line: 324, column: 15, scope: !380)
!395 = !DILocation(line: 328, column: 10, scope: !380)
!396 = !DILocation(line: 339, column: 9, scope: !381)
!397 = !DILocation(line: 350, column: 8, scope: !382)
!398 = !DILocation(line: 268, column: 6, scope: !382)
!399 = !DILocation(line: 23, column: 26, scope: !29, inlinedAt: !400)
!400 = distinct !DILocation(line: 365, column: 8, scope: !81)
!401 = !DILocation(line: 23, column: 43, scope: !29, inlinedAt: !400)
!402 = !DILocation(line: 23, column: 51, scope: !29, inlinedAt: !400)
!403 = !DILocation(line: 23, column: 78, scope: !29, inlinedAt: !400)
!404 = !DILocation(line: 25, column: 2, scope: !29, inlinedAt: !400)
!405 = !DILocation(line: 27, column: 2, scope: !29, inlinedAt: !400)
!406 = !DILocation(line: 30, column: 7, scope: !29, inlinedAt: !400)
!407 = !DILocation(line: 26, column: 10, scope: !29, inlinedAt: !400)
!408 = !DILocation(line: 31, column: 2, scope: !29, inlinedAt: !400)
!409 = !DILocation(line: 33, column: 6, scope: !29, inlinedAt: !400)
!410 = !DILocation(line: 33, column: 12, scope: !29, inlinedAt: !400)
!411 = !DILocation(line: 220, column: 10, scope: !81)
!412 = !DILocation(line: 368, column: 2, scope: !81)
!413 = !DILocation(line: 9, column: 26, scope: !21, inlinedAt: !414)
!414 = distinct !DILocation(line: 368, column: 2, scope: !415)
!415 = !DILexicalBlockFile(scope: !416, file: !1, discriminator: 1)
!416 = distinct !DILexicalBlock(scope: !417, file: !1, line: 368, column: 2)
!417 = distinct !DILexicalBlock(scope: !81, file: !1, line: 368, column: 2)
!418 = !DILocation(line: 10, column: 15, scope: !21, inlinedAt: !414)
!419 = !DILocation(line: 10, column: 2, scope: !21, inlinedAt: !414)
!420 = !DILocation(line: 11, column: 7, scope: !21, inlinedAt: !414)
!421 = !DILocation(line: 11, column: 2, scope: !21, inlinedAt: !414)
!422 = !DILocation(line: 368, column: 2, scope: !415)
!423 = !DILocation(line: 369, column: 2, scope: !81)
!424 = !DILocation(line: 9, column: 26, scope: !21, inlinedAt: !425)
!425 = distinct !DILocation(line: 369, column: 2, scope: !426)
!426 = !DILexicalBlockFile(scope: !427, file: !1, discriminator: 1)
!427 = distinct !DILexicalBlock(scope: !428, file: !1, line: 369, column: 2)
!428 = distinct !DILexicalBlock(scope: !81, file: !1, line: 369, column: 2)
!429 = !DILocation(line: 10, column: 15, scope: !21, inlinedAt: !425)
!430 = !DILocation(line: 10, column: 2, scope: !21, inlinedAt: !425)
!431 = !DILocation(line: 11, column: 7, scope: !21, inlinedAt: !425)
!432 = !DILocation(line: 11, column: 2, scope: !21, inlinedAt: !425)
!433 = !DILocation(line: 369, column: 2, scope: !426)
!434 = !DILocation(line: 371, column: 2, scope: !435)
!435 = !DILexicalBlockFile(scope: !436, file: !1, discriminator: 1)
!436 = distinct !DILexicalBlock(scope: !437, file: !1, line: 371, column: 2)
!437 = distinct !DILexicalBlock(scope: !81, file: !1, line: 371, column: 2)
!438 = !DILocation(line: 372, column: 2, scope: !439)
!439 = !DILexicalBlockFile(scope: !440, file: !1, discriminator: 1)
!440 = distinct !DILexicalBlock(scope: !441, file: !1, line: 372, column: 2)
!441 = distinct !DILexicalBlock(scope: !81, file: !1, line: 372, column: 2)
!442 = !DILocation(line: 373, column: 2, scope: !443)
!443 = !DILexicalBlockFile(scope: !444, file: !1, discriminator: 1)
!444 = distinct !DILexicalBlock(scope: !445, file: !1, line: 373, column: 2)
!445 = distinct !DILexicalBlock(scope: !81, file: !1, line: 373, column: 2)
!446 = !DILocation(line: 377, column: 2, scope: !81)
!447 = !DILocation(line: 381, column: 14, scope: !149)
!448 = !DILocation(line: 381, column: 27, scope: !149)
!449 = !DILocation(line: 383, column: 2, scope: !149)
!450 = !DILocation(line: 385, column: 2, scope: !149)
!451 = !DILocation(line: 387, column: 2, scope: !149)
!452 = !DILocation(line: 388, column: 2, scope: !149)
!453 = !DILocation(line: 389, column: 2, scope: !149)
!454 = !DILocation(line: 391, column: 2, scope: !149)
!455 = !DILocation(line: 393, column: 2, scope: !149)
!456 = !DILocation(line: 394, column: 2, scope: !149)
!457 = !DILocation(line: 396, column: 2, scope: !149)
!458 = !DILocation(line: 397, column: 2, scope: !149)
!459 = !DILocation(line: 398, column: 12, scope: !149)
!460 = !DILocation(line: 399, column: 12, scope: !149)
!461 = !DILocation(line: 401, column: 2, scope: !149)
!462 = !DILocation(line: 403, column: 2, scope: !149)
!463 = !DILocation(line: 404, column: 2, scope: !149)
!464 = !DILocation(line: 406, column: 2, scope: !149)
!465 = !DILocation(line: 407, column: 2, scope: !149)
!466 = !DILocation(line: 408, column: 12, scope: !149)
!467 = !DILocation(line: 409, column: 12, scope: !149)
!468 = !DILocation(line: 411, column: 2, scope: !149)
!469 = !DILocation(line: 412, column: 2, scope: !149)
!470 = !DILocation(line: 413, column: 2, scope: !149)
!471 = !DILocation(line: 415, column: 2, scope: !149)
!472 = !DILocation(line: 416, column: 2, scope: !149)
!473 = !DILocation(line: 418, column: 12, scope: !149)
!474 = !DILocation(line: 419, column: 12, scope: !149)
!475 = !DILocation(line: 421, column: 2, scope: !149)
!476 = !DILocation(line: 422, column: 2, scope: !149)
!477 = !DILocation(line: 425, column: 7, scope: !149)
!478 = !DILocation(line: 390, column: 10, scope: !149)
!479 = !DILocation(line: 382, column: 10, scope: !149)
!480 = !DILocation(line: 436, column: 2, scope: !149)
!481 = !DILocation(line: 437, column: 8, scope: !149)
!482 = !DILocation(line: 437, column: 26, scope: !149)
!483 = !DILocation(line: 437, column: 32, scope: !149)
!484 = !DILocation(line: 437, column: 52, scope: !149)
!485 = !DILocation(line: 437, column: 58, scope: !149)
!486 = !DILocation(line: 437, column: 78, scope: !149)
!487 = !DILocation(line: 437, column: 84, scope: !149)
!488 = !DILocation(line: 437, column: 102, scope: !149)
!489 = !DILocation(line: 437, column: 108, scope: !149)
!490 = !DILocation(line: 437, column: 126, scope: !149)
!491 = !DILocation(line: 437, column: 133, scope: !149)
!492 = !DILocation(line: 437, column: 152, scope: !149)
!493 = !DILocation(line: 437, column: 159, scope: !149)
!494 = !DILocation(line: 440, column: 2, scope: !149)
!495 = !DILocation(line: 445, column: 2, scope: !149)
!496 = !DILocation(line: 450, column: 6, scope: !149)
!497 = !DILocation(line: 452, column: 2, scope: !149)
!498 = !DILocation(line: 455, column: 8, scope: !149)
!499 = !DILocation(line: 400, column: 10, scope: !149)
!500 = !DILocation(line: 384, column: 10, scope: !149)
!501 = !DILocation(line: 466, column: 2, scope: !149)
!502 = !DILocation(line: 467, column: 9, scope: !149)
!503 = !DILocation(line: 467, column: 28, scope: !149)
!504 = !DILocation(line: 467, column: 35, scope: !149)
!505 = !DILocation(line: 467, column: 56, scope: !149)
!506 = !DILocation(line: 467, column: 63, scope: !149)
!507 = !DILocation(line: 467, column: 84, scope: !149)
!508 = !DILocation(line: 467, column: 91, scope: !149)
!509 = !DILocation(line: 467, column: 110, scope: !149)
!510 = !DILocation(line: 467, column: 117, scope: !149)
!511 = !DILocation(line: 467, column: 136, scope: !149)
!512 = !DILocation(line: 467, column: 144, scope: !149)
!513 = !DILocation(line: 467, column: 164, scope: !149)
!514 = !DILocation(line: 467, column: 172, scope: !149)
!515 = !DILocation(line: 470, column: 2, scope: !149)
!516 = !DILocation(line: 475, column: 2, scope: !149)
!517 = !DILocation(line: 480, column: 6, scope: !149)
!518 = !DILocation(line: 482, column: 2, scope: !149)
!519 = !DILocation(line: 487, column: 8, scope: !149)
!520 = !DILocation(line: 410, column: 10, scope: !149)
!521 = !DILocation(line: 386, column: 10, scope: !149)
!522 = !DILocation(line: 496, column: 2, scope: !149)
!523 = !DILocation(line: 507, column: 2, scope: !149)
!524 = !DILocation(line: 508, column: 9, scope: !149)
!525 = !DILocation(line: 508, column: 28, scope: !149)
!526 = !DILocation(line: 508, column: 35, scope: !149)
!527 = !DILocation(line: 508, column: 56, scope: !149)
!528 = !DILocation(line: 508, column: 63, scope: !149)
!529 = !DILocation(line: 508, column: 84, scope: !149)
!530 = !DILocation(line: 508, column: 91, scope: !149)
!531 = !DILocation(line: 508, column: 110, scope: !149)
!532 = !DILocation(line: 508, column: 117, scope: !149)
!533 = !DILocation(line: 508, column: 136, scope: !149)
!534 = !DILocation(line: 508, column: 144, scope: !149)
!535 = !DILocation(line: 508, column: 164, scope: !149)
!536 = !DILocation(line: 508, column: 172, scope: !149)
!537 = !DILocation(line: 511, column: 2, scope: !149)
!538 = !DILocation(line: 517, column: 6, scope: !149)
!539 = !DILocation(line: 519, column: 2, scope: !149)
!540 = !DILocation(line: 524, column: 2, scope: !149)
!541 = !DILocation(line: 525, column: 9, scope: !149)
!542 = !DILocation(line: 525, column: 28, scope: !149)
!543 = !DILocation(line: 525, column: 35, scope: !149)
!544 = !DILocation(line: 525, column: 56, scope: !149)
!545 = !DILocation(line: 525, column: 63, scope: !149)
!546 = !DILocation(line: 525, column: 82, scope: !149)
!547 = !DILocation(line: 525, column: 89, scope: !149)
!548 = !DILocation(line: 525, column: 109, scope: !149)
!549 = !DILocation(line: 525, column: 116, scope: !149)
!550 = !DILocation(line: 525, column: 137, scope: !149)
!551 = !DILocation(line: 525, column: 145, scope: !149)
!552 = !DILocation(line: 525, column: 166, scope: !149)
!553 = !DILocation(line: 525, column: 174, scope: !149)
!554 = !DILocation(line: 525, column: 196, scope: !149)
!555 = !DILocation(line: 525, column: 204, scope: !149)
!556 = !DILocation(line: 525, column: 225, scope: !149)
!557 = !DILocation(line: 525, column: 233, scope: !149)
!558 = !DILocation(line: 525, column: 255, scope: !149)
!559 = !DILocation(line: 525, column: 263, scope: !149)
!560 = !DILocation(line: 525, column: 285, scope: !149)
!561 = !DILocation(line: 525, column: 293, scope: !149)
!562 = !DILocation(line: 525, column: 313, scope: !149)
!563 = !DILocation(line: 525, column: 321, scope: !149)
!564 = !DILocation(line: 525, column: 342, scope: !149)
!565 = !DILocation(line: 525, column: 350, scope: !149)
!566 = !DILocation(line: 528, column: 2, scope: !149)
!567 = !DILocation(line: 530, column: 2, scope: !568)
!568 = !DILexicalBlockFile(scope: !569, file: !1, discriminator: 1)
!569 = distinct !DILexicalBlock(scope: !570, file: !1, line: 530, column: 2)
!570 = distinct !DILexicalBlock(scope: !149, file: !1, line: 530, column: 2)
!571 = !DILocation(line: 531, column: 2, scope: !572)
!572 = !DILexicalBlockFile(scope: !573, file: !1, discriminator: 1)
!573 = distinct !DILexicalBlock(scope: !574, file: !1, line: 531, column: 2)
!574 = distinct !DILexicalBlock(scope: !149, file: !1, line: 531, column: 2)
!575 = !DILocation(line: 532, column: 2, scope: !576)
!576 = !DILexicalBlockFile(scope: !577, file: !1, discriminator: 1)
!577 = distinct !DILexicalBlock(scope: !578, file: !1, line: 532, column: 2)
!578 = distinct !DILexicalBlock(scope: !149, file: !1, line: 532, column: 2)
!579 = !DILocation(line: 533, column: 2, scope: !580)
!580 = !DILexicalBlockFile(scope: !581, file: !1, discriminator: 1)
!581 = distinct !DILexicalBlock(scope: !582, file: !1, line: 533, column: 2)
!582 = distinct !DILexicalBlock(scope: !149, file: !1, line: 533, column: 2)
!583 = !DILocation(line: 535, column: 2, scope: !584)
!584 = !DILexicalBlockFile(scope: !585, file: !1, discriminator: 1)
!585 = distinct !DILexicalBlock(scope: !586, file: !1, line: 535, column: 2)
!586 = distinct !DILexicalBlock(scope: !149, file: !1, line: 535, column: 2)
!587 = !DILocation(line: 536, column: 2, scope: !588)
!588 = !DILexicalBlockFile(scope: !589, file: !1, discriminator: 1)
!589 = distinct !DILexicalBlock(scope: !590, file: !1, line: 536, column: 2)
!590 = distinct !DILexicalBlock(scope: !149, file: !1, line: 536, column: 2)
!591 = !DILocation(line: 538, column: 2, scope: !592)
!592 = !DILexicalBlockFile(scope: !593, file: !1, discriminator: 1)
!593 = distinct !DILexicalBlock(scope: !594, file: !1, line: 538, column: 2)
!594 = distinct !DILexicalBlock(scope: !149, file: !1, line: 538, column: 2)
!595 = !DILocation(line: 539, column: 2, scope: !596)
!596 = !DILexicalBlockFile(scope: !597, file: !1, discriminator: 1)
!597 = distinct !DILexicalBlock(scope: !598, file: !1, line: 539, column: 2)
!598 = distinct !DILexicalBlock(scope: !149, file: !1, line: 539, column: 2)
!599 = !DILocation(line: 542, column: 2, scope: !600)
!600 = !DILexicalBlockFile(scope: !601, file: !1, discriminator: 1)
!601 = distinct !DILexicalBlock(scope: !602, file: !1, line: 542, column: 2)
!602 = distinct !DILexicalBlock(scope: !149, file: !1, line: 542, column: 2)
!603 = !DILocation(line: 543, column: 2, scope: !604)
!604 = !DILexicalBlockFile(scope: !605, file: !1, discriminator: 1)
!605 = distinct !DILexicalBlock(scope: !606, file: !1, line: 543, column: 2)
!606 = distinct !DILexicalBlock(scope: !149, file: !1, line: 543, column: 2)
!607 = !DILocation(line: 544, column: 2, scope: !149)
!608 = distinct !{!608, !609, !"polly.alias.scope.call"}
!609 = distinct !{!609, !"polly.alias.scope.domain"}
!610 = distinct !{!610}
!611 = !DILocation(line: 121, column: 11, scope: !612)
!612 = distinct !DILexicalBlock(scope: !613, file: !1, line: 107, column: 14)
!613 = distinct !DILexicalBlock(scope: !43, file: !1, line: 97, column: 13)
!614 = distinct !{!614, !615, !"polly.alias.scope.call"}
!615 = distinct !{!615, !"polly.alias.scope.domain"}
!616 = !{!617, !618}
!617 = distinct !{!617, !615, !"polly.alias.scope.call12"}
!618 = distinct !{!618, !615, !"polly.alias.scope.call22"}
!619 = !{!618, !614}
!620 = !{!617, !614}
