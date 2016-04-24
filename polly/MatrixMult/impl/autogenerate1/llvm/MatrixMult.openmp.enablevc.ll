; ModuleID = 'MatrixMult.c'
source_filename = "MatrixMult.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Matrix = type { i64*, i64, i64, i64 }

@.str.1 = private unnamed_addr constant [7 x i8] c" data:\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c" width:\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c" height:\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [5 x i8] c"fail\00", align 1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @copy_Matrix(%struct.Matrix* nocapture readonly %_Matrix) #0 !dbg !8 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %_Matrix, i64 0, metadata !23, metadata !25), !dbg !26
  %call = tail call noalias i8* @malloc(i64 32) #9, !dbg !27
  %0 = bitcast i8* %call to %struct.Matrix*, !dbg !29
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %0, i64 0, metadata !24, metadata !25), !dbg !30
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 1, !dbg !31
  %1 = load i64, i64* %data_size, align 8, !dbg !31, !tbaa !32
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8, !dbg !31
  %2 = bitcast i8* %data_size1 to i64*, !dbg !31
  store i64 %1, i64* %2, align 8, !dbg !31, !tbaa !32
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 0, !dbg !31
  %3 = load i64*, i64** %data, align 8, !dbg !31, !tbaa !38
  %call3 = tail call i64* @copy(i64* %3, i64 %1) #9, !dbg !31
  %data4 = bitcast i8* %call to i64**, !dbg !31
  store i64* %call3, i64** %data4, align 8, !dbg !31, !tbaa !38
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 2, !dbg !39
  %width5 = getelementptr inbounds i8, i8* %call, i64 16, !dbg !40
  %4 = bitcast i64* %width to <2 x i64>*, !dbg !39
  %5 = load <2 x i64>, <2 x i64>* %4, align 8, !dbg !39, !tbaa !41
  %6 = bitcast i8* %width5 to <2 x i64>*, !dbg !42
  store <2 x i64> %5, <2 x i64>* %6, align 8, !dbg !42, !tbaa !41
  ret %struct.Matrix* %0, !dbg !43
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare i64* @copy(i64*, i64) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix** @copy_array_Matrix(%struct.Matrix** nocapture readonly %_Matrix, i64 %_Matrix_size) #0 !dbg !44 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Matrix** %_Matrix, i64 0, metadata !49, metadata !25), !dbg !55
  tail call void @llvm.dbg.value(metadata i64 %_Matrix_size, i64 0, metadata !50, metadata !25), !dbg !56
  %mul = shl i64 %_Matrix_size, 3, !dbg !57
  %call = tail call noalias i8* @malloc(i64 %mul) #9, !dbg !58
  %0 = bitcast i8* %call to %struct.Matrix**, !dbg !60
  tail call void @llvm.dbg.value(metadata %struct.Matrix** %0, i64 0, metadata !51, metadata !25), !dbg !61
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !52, metadata !25), !dbg !62
  %cmp12 = icmp sgt i64 %_Matrix_size, 0, !dbg !63
  br i1 %cmp12, label %for.body.preheader, label %for.cond.cleanup, !dbg !66

for.body.preheader:                               ; preds = %entry
  br label %for.body, !dbg !67

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup, !dbg !69

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret %struct.Matrix** %0, !dbg !69

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds %struct.Matrix*, %struct.Matrix** %_Matrix, i64 %indvars.iv, !dbg !67
  %1 = load %struct.Matrix*, %struct.Matrix** %arrayidx, align 8, !dbg !67, !tbaa !70
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %1, i64 0, metadata !23, metadata !25) #9, !dbg !71
  %call.i = tail call noalias i8* @malloc(i64 32) #9, !dbg !73
  %data_size.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 1, !dbg !74
  %2 = load i64, i64* %data_size.i, align 8, !dbg !74, !tbaa !32
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8, !dbg !74
  %3 = bitcast i8* %data_size1.i to i64*, !dbg !74
  store i64 %2, i64* %3, align 8, !dbg !74, !tbaa !32
  %data.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 0, !dbg !74
  %4 = load i64*, i64** %data.i, align 8, !dbg !74, !tbaa !38
  %call3.i = tail call i64* @copy(i64* %4, i64 %2) #9, !dbg !74
  %data4.i = bitcast i8* %call.i to i64**, !dbg !74
  store i64* %call3.i, i64** %data4.i, align 8, !dbg !74, !tbaa !38
  %width.i = getelementptr inbounds %struct.Matrix, %struct.Matrix* %1, i64 0, i32 2, !dbg !75
  %width5.i = getelementptr inbounds i8, i8* %call.i, i64 16, !dbg !76
  %5 = bitcast i64* %width.i to <2 x i64>*, !dbg !75
  %6 = load <2 x i64>, <2 x i64>* %5, align 8, !dbg !75, !tbaa !41
  %7 = bitcast i8* %width5.i to <2 x i64>*, !dbg !77
  store <2 x i64> %6, <2 x i64>* %7, align 8, !dbg !77, !tbaa !41
  %arrayidx4 = getelementptr inbounds %struct.Matrix*, %struct.Matrix** %0, i64 %indvars.iv, !dbg !78
  %8 = bitcast %struct.Matrix** %arrayidx4 to i8**, !dbg !79
  store i8* %call.i, i8** %8, align 8, !dbg !79, !tbaa !70
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !66
  %exitcond = icmp eq i64 %indvars.iv.next, %_Matrix_size, !dbg !66
  br i1 %exitcond, label %for.cond.cleanup.loopexit, label %for.body, !dbg !66
}

; Function Attrs: nounwind uwtable
define void @free_Matrix(%struct.Matrix* nocapture %matrix) #0 !dbg !80 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %matrix, i64 0, metadata !84, metadata !25), !dbg !85
  %0 = bitcast %struct.Matrix* %matrix to i8**, !dbg !86
  %1 = load i8*, i8** %0, align 8, !dbg !86, !tbaa !38
  tail call void @free(i8* %1) #9, !dbg !87
  %2 = bitcast %struct.Matrix* %matrix to i8*, !dbg !88
  tail call void @free(i8* %2) #9, !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @printf_Matrix(%struct.Matrix* nocapture readonly %matrix) #0 !dbg !91 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %matrix, i64 0, metadata !93, metadata !25), !dbg !94
  %putchar = tail call i32 @putchar(i32 123) #9, !dbg !95
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 0, !dbg !97
  %0 = load i64*, i64** %data, align 8, !dbg !97, !tbaa !38
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 1, !dbg !97
  %1 = load i64, i64* %data_size, align 8, !dbg !97, !tbaa !32
  tail call void @printf1DArray(i64* %0, i64 %1) #9, !dbg !97
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 2, !dbg !99
  %2 = load i64, i64* %width, align 8, !dbg !99, !tbaa !100
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %2), !dbg !101
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0)), !dbg !102
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 3, !dbg !103
  %3 = load i64, i64* %height, align 8, !dbg !103, !tbaa !104
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %3), !dbg !105
  %putchar10 = tail call i32 @putchar(i32 125) #9, !dbg !106
  ret void, !dbg !107
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

declare void @printf1DArray(i64*, i64) #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @matrix(i64 %width, i64 %height, i64* %data, i64 %data_size, i1 zeroext %data_has_ownership) #0 !dbg !108 {
entry:
  tail call void @llvm.dbg.value(metadata i64 %width, i64 0, metadata !113, metadata !25), !dbg !122
  tail call void @llvm.dbg.value(metadata i64 %height, i64 0, metadata !114, metadata !25), !dbg !123
  tail call void @llvm.dbg.value(metadata i64* %data, i64 0, metadata !115, metadata !25), !dbg !124
  tail call void @llvm.dbg.value(metadata i64 %data_size, i64 0, metadata !116, metadata !25), !dbg !124
  tail call void @llvm.dbg.value(metadata i1 %data_has_ownership, i64 0, metadata !117, metadata !125), !dbg !126
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !119, metadata !25), !dbg !127
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !121, metadata !25), !dbg !128
  %call = tail call noalias i8* @malloc(i64 32) #9, !dbg !129
  %0 = bitcast i8* %call to %struct.Matrix*, !dbg !129
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %0, i64 0, metadata !120, metadata !25), !dbg !130
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8, !dbg !131
  %1 = bitcast i8* %data_size1 to i64*, !dbg !131
  store i64 %data_size, i64* %1, align 8, !dbg !131, !tbaa !32
  %call2 = tail call i64* @copy(i64* %data, i64 %data_size) #9, !dbg !131
  %data3 = bitcast i8* %call to i64**, !dbg !131
  store i64* %call2, i64** %data3, align 8, !dbg !131, !tbaa !38
  %height4 = getelementptr inbounds i8, i8* %call, i64 24, !dbg !132
  %2 = bitcast i8* %height4 to i64*, !dbg !132
  store i64 %height, i64* %2, align 8, !dbg !133, !tbaa !104
  %width5 = getelementptr inbounds i8, i8* %call, i64 16, !dbg !134
  %3 = bitcast i8* %width5 to i64*, !dbg !134
  store i64 %width, i64* %3, align 8, !dbg !135, !tbaa !100
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !121, metadata !25), !dbg !128
  br i1 %data_has_ownership, label %if.then7, label %if.end11, !dbg !136

if.then7:                                         ; preds = %entry
  %4 = bitcast i64* %data to i8*, !dbg !137
  tail call void @free(i8* %4) #9, !dbg !137
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !117, metadata !25), !dbg !126
  br label %if.end11, !dbg !137

if.end11:                                         ; preds = %entry, %if.then7
  ret %struct.Matrix* %0, !dbg !141
}

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @init(i64 %width, i64 %height) #4 !dbg !142 {
entry:
  %polly.par.userContext = alloca { i64, i64, i64* }, align 8
  tail call void @llvm.dbg.value(metadata i64 %width, i64 0, metadata !146, metadata !25), !dbg !174
  tail call void @llvm.dbg.value(metadata i64 %height, i64 0, metadata !147, metadata !25), !dbg !175
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !149, metadata !25), !dbg !176
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !150, metadata !25), !dbg !177
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !151, metadata !25), !dbg !177
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !152, metadata !25), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !153, metadata !25), !dbg !179
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !154, metadata !25), !dbg !180
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !155, metadata !25), !dbg !181
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !156, metadata !25), !dbg !182
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !157, metadata !25), !dbg !183
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !158, metadata !25), !dbg !183
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !159, metadata !25), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !160, metadata !25), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !161, metadata !25), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !162, metadata !25), !dbg !187
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !163, metadata !25), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !164, metadata !25), !dbg !189
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !165, metadata !25), !dbg !190
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !166, metadata !25), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !167, metadata !25), !dbg !192
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !168, metadata !25), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !169, metadata !25), !dbg !194
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !170, metadata !25), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !171, metadata !25), !dbg !196
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !173, metadata !25), !dbg !197
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !155, metadata !25), !dbg !181
  %mul = mul nsw i64 %height, %width, !dbg !198
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !156, metadata !25), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !158, metadata !25), !dbg !183
  %conv1 = trunc i64 %mul to i32, !dbg !199
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #9, !dbg !199
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !157, metadata !25), !dbg !183
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !159, metadata !25), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !151, metadata !25), !dbg !177
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !150, metadata !25), !dbg !177
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !152, metadata !25), !dbg !178
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !159, metadata !25), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !160, metadata !25), !dbg !185
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !153, metadata !25), !dbg !179
  %cmp81 = icmp sgt i64 %height, 0, !dbg !200
  br i1 %cmp81, label %polly.parallel.for, label %if.end23, !dbg !203

if.end23:                                         ; preds = %polly.parallel.for, %entry
  tail call void @llvm.dbg.value(metadata i64 %width, i64 0, metadata !113, metadata !25) #9, !dbg !204
  tail call void @llvm.dbg.value(metadata i64 %height, i64 0, metadata !114, metadata !25) #9, !dbg !206
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !115, metadata !25) #9, !dbg !207
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !116, metadata !25) #9, !dbg !207
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !117, metadata !125) #9, !dbg !208
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !119, metadata !25) #9, !dbg !209
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !121, metadata !25) #9, !dbg !210
  %call.i = tail call noalias i8* @malloc(i64 32) #9, !dbg !211
  %0 = bitcast i8* %call.i to %struct.Matrix*, !dbg !211
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %0, i64 0, metadata !120, metadata !25) #9, !dbg !212
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8, !dbg !213
  %1 = bitcast i8* %data_size1.i to i64*, !dbg !213
  store i64 %mul, i64* %1, align 8, !dbg !213, !tbaa !32
  %call2.i = tail call i64* @copy(i64* %call, i64 %mul) #9, !dbg !213
  %data3.i = bitcast i8* %call.i to i64**, !dbg !213
  store i64* %call2.i, i64** %data3.i, align 8, !dbg !213, !tbaa !38
  %height4.i = getelementptr inbounds i8, i8* %call.i, i64 24, !dbg !214
  %2 = bitcast i8* %height4.i to i64*, !dbg !214
  store i64 %height, i64* %2, align 8, !dbg !215, !tbaa !104
  %width5.i = getelementptr inbounds i8, i8* %call.i, i64 16, !dbg !216
  %3 = bitcast i8* %width5.i to i64*, !dbg !216
  store i64 %width, i64* %3, align 8, !dbg !217, !tbaa !100
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !121, metadata !25) #9, !dbg !210
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %0, i64 0, metadata !172, metadata !25), !dbg !218
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !173, metadata !25), !dbg !197
  %4 = bitcast i64* %call to i8*, !dbg !219
  tail call void @free(i8* %4) #9, !dbg !219
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !152, metadata !25), !dbg !178
  ret %struct.Matrix* %0, !dbg !223

polly.parallel.for:                               ; preds = %entry
  %5 = add nsw i64 %height, -1
  %polly.fdiv_q.shr = ashr i64 %5, 5
  %6 = bitcast { i64, i64, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 24, i8* %6)
  %polly.subfn.storeaddr.width = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %width, i64* %polly.subfn.storeaddr.width, align 8
  %polly.subfn.storeaddr.height = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64 %height, i64* %polly.subfn.storeaddr.height, align 8
  %polly.subfn.storeaddr.call = getelementptr inbounds { i64, i64, i64* }, { i64, i64, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %call, i64** %polly.subfn.storeaddr.call, align 8
  %7 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @init_polly_subfn, i8* %6, i32 0, i64 0, i64 %7, i64 1) #9
  call void @init_polly_subfn(i8* %6) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %6)
  br label %if.end23, !dbg !224
}

declare i64* @gen1DArray(i32, i32) #3

; Function Attrs: nounwind uwtable
define void @print_mat(%struct._IO_FILE* nocapture readnone %sys, %struct.Matrix* nocapture %a, i1 zeroext %a_has_ownership) #0 !dbg !225 {
entry:
  tail call void @llvm.dbg.value(metadata %struct._IO_FILE* %sys, i64 0, metadata !290, metadata !25), !dbg !320
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !291, metadata !25), !dbg !321
  tail call void @llvm.dbg.value(metadata i1 %a_has_ownership, i64 0, metadata !292, metadata !125), !dbg !322
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !293, metadata !25), !dbg !323
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !294, metadata !25), !dbg !324
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !295, metadata !25), !dbg !325
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !296, metadata !25), !dbg !326
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !297, metadata !25), !dbg !327
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !298, metadata !25), !dbg !328
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !299, metadata !25), !dbg !329
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !300, metadata !25), !dbg !330
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !302, metadata !25), !dbg !331
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !303, metadata !25), !dbg !331
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !304, metadata !25), !dbg !332
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !305, metadata !25), !dbg !333
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !306, metadata !25), !dbg !334
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !307, metadata !25), !dbg !335
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !309, metadata !25), !dbg !336
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !310, metadata !25), !dbg !336
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !311, metadata !25), !dbg !337
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !312, metadata !25), !dbg !338
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !313, metadata !25), !dbg !339
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !314, metadata !25), !dbg !340
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !315, metadata !25), !dbg !341
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !318, metadata !25), !dbg !342
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !319, metadata !25), !dbg !343
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !297, metadata !25), !dbg !327
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !293, metadata !25), !dbg !323
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !344
  %0 = load i64, i64* %width1, align 8, !dbg !344, !tbaa !100
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !298, metadata !25), !dbg !328
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !294, metadata !25), !dbg !324
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3, !dbg !345
  %1 = load i64, i64* %height2, align 8, !dbg !345, !tbaa !104
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !299, metadata !25), !dbg !329
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !295, metadata !25), !dbg !325
  %cmp90 = icmp sgt i64 %1, 0, !dbg !346
  br i1 %cmp90, label %while.cond3.preheader.preheader, label %blklab6, !dbg !349

while.cond3.preheader.preheader:                  ; preds = %entry
  %cmp581 = icmp sgt i64 %0, 0, !dbg !350
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1, !dbg !353
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !353
  br i1 %cmp581, label %while.cond3.preheader.us.preheader, label %while.cond3.preheader.preheader111, !dbg !354

while.cond3.preheader.preheader111:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader, !dbg !340

while.cond3.preheader.us.preheader:               ; preds = %while.cond3.preheader.preheader
  br label %while.cond3.preheader.us, !dbg !355

while.cond3.preheader.us:                         ; preds = %while.cond3.preheader.us.preheader, %if.end21.us
  %_25_has_ownership.097.us = phi i1 [ true, %if.end21.us ], [ false, %while.cond3.preheader.us.preheader ]
  %_25.096.us = phi i8* [ %call22.us, %if.end21.us ], [ undef, %while.cond3.preheader.us.preheader ]
  %_18_has_ownership.095.us = phi i8 [ 1, %if.end21.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %2 = phi i8* [ %call15.us.lcssa, %if.end21.us ], [ null, %while.cond3.preheader.us.preheader ]
  %i.093.us = phi i64 [ %add18.us, %if.end21.us ], [ 0, %while.cond3.preheader.us.preheader ]
  %_12.091.us = phi i64* [ %call.us.lcssa, %if.end21.us ], [ null, %while.cond3.preheader.us.preheader ]
  %mul.us = mul nsw i64 %i.093.us, %0, !dbg !355
  br label %if.end7.us, !dbg !356

if.end7.us:                                       ; preds = %while.cond3.preheader.us, %if.end14.us
  %_18_has_ownership.185.us = phi i8 [ 1, %if.end14.us ], [ %_18_has_ownership.095.us, %while.cond3.preheader.us ]
  %3 = phi i8* [ %call15.us, %if.end14.us ], [ %2, %while.cond3.preheader.us ]
  %_12.183.us = phi i64* [ %call.us, %if.end14.us ], [ %_12.091.us, %while.cond3.preheader.us ]
  %j.082.us = phi i64 [ %add17.us, %if.end14.us ], [ 0, %while.cond3.preheader.us ]
  %4 = and i8 %_18_has_ownership.185.us, 1, !dbg !356
  %tobool.us = icmp eq i8 %4, 0, !dbg !356
  br i1 %tobool.us, label %if.end9.us, label %if.then8.us, !dbg !358

if.then8.us:                                      ; preds = %if.end7.us
  %5 = bitcast i64* %_12.183.us to i8*, !dbg !359
  tail call void @free(i8* %5) #9, !dbg !359
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !304, metadata !25), !dbg !332
  br label %if.end9.us, !dbg !359

if.end9.us:                                       ; preds = %if.then8.us, %if.end7.us
  %6 = load i64*, i64** %data, align 8, !dbg !353, !tbaa !38
  %7 = load i64, i64* %data_size, align 8, !dbg !353, !tbaa !32
  %call.us = tail call i64* @copy(i64* %6, i64 %7) #9, !dbg !353
  tail call void @llvm.dbg.value(metadata i64* %call.us, i64 0, metadata !302, metadata !25), !dbg !331
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !304, metadata !25), !dbg !332
  tail call void @llvm.dbg.value(metadata i64 %mul.us, i64 0, metadata !305, metadata !25), !dbg !333
  %add.us = add nsw i64 %j.082.us, %mul.us, !dbg !362
  tail call void @llvm.dbg.value(metadata i64 %add.us, i64 0, metadata !306, metadata !25), !dbg !334
  %arrayidx.us = getelementptr inbounds i64, i64* %call.us, i64 %add.us, !dbg !363
  %8 = load i64, i64* %arrayidx.us, align 8, !dbg !363, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %8, i64 0, metadata !307, metadata !25), !dbg !335
  %call11.us = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %8), !dbg !364
  br i1 %tobool.us, label %if.end14.us, label %if.then13.us, !dbg !365

if.then13.us:                                     ; preds = %if.end9.us
  tail call void @free(i8* %3) #9, !dbg !366
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !311, metadata !25), !dbg !337
  br label %if.end14.us, !dbg !366

if.end14.us:                                      ; preds = %if.then13.us, %if.end9.us
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !310, metadata !25), !dbg !336
  %call15.us = tail call noalias i8* @malloc(i64 8) #9, !dbg !370
  %9 = bitcast i8* %call15.us to i64*, !dbg !370
  tail call void @llvm.dbg.value(metadata i64* %9, i64 0, metadata !309, metadata !25), !dbg !336
  store i64 32, i64* %9, align 8, !dbg !371, !tbaa !41
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !311, metadata !25), !dbg !337
  tail call void @printf_s(i64* %9, i64 1) #9, !dbg !372
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !312, metadata !25), !dbg !338
  %add17.us = add nuw nsw i64 %j.082.us, 1, !dbg !373
  tail call void @llvm.dbg.value(metadata i64 %add17.us, i64 0, metadata !313, metadata !25), !dbg !339
  tail call void @llvm.dbg.value(metadata i64 %add17.us, i64 0, metadata !296, metadata !25), !dbg !326
  %exitcond.us = icmp eq i64 %add17.us, %0, !dbg !354
  br i1 %exitcond.us, label %blklab8.loopexit.us, label %if.end7.us, !dbg !354

if.then20.us:                                     ; preds = %blklab8.loopexit.us
  tail call void @free(i8* %_25.096.us) #9, !dbg !374
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !319, metadata !25), !dbg !343
  br label %if.end21.us, !dbg !374

if.end21.us:                                      ; preds = %if.then20.us, %blklab8.loopexit.us
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !318, metadata !25), !dbg !342
  %call22.us = tail call noalias i8* @malloc(i64 0) #9, !dbg !378
  tail call void @llvm.dbg.value(metadata i8* %call22.us, i64 0, metadata !317, metadata !25), !dbg !379
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !319, metadata !25), !dbg !343
  %10 = bitcast i8* %call22.us to i64*, !dbg !380
  tail call void @println_s(i64* %10, i64 0) #9, !dbg !381
  %exitcond104.us = icmp eq i64 %add18.us, %1, !dbg !349
  br i1 %exitcond104.us, label %blklab6.loopexit, label %while.cond3.preheader.us, !dbg !349

blklab8.loopexit.us:                              ; preds = %if.end14.us
  %call15.us.lcssa = phi i8* [ %call15.us, %if.end14.us ]
  %call.us.lcssa = phi i64* [ %call.us, %if.end14.us ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !314, metadata !25), !dbg !340
  %add18.us = add nuw nsw i64 %i.093.us, 1, !dbg !382
  tail call void @llvm.dbg.value(metadata i64 %add18.us, i64 0, metadata !315, metadata !25), !dbg !341
  tail call void @llvm.dbg.value(metadata i64 %add18.us, i64 0, metadata !293, metadata !25), !dbg !323
  br i1 %_25_has_ownership.097.us, label %if.then20.us, label %if.end21.us, !dbg !383

while.cond3.preheader:                            ; preds = %while.cond3.preheader.preheader111, %if.end21
  %_25_has_ownership.097 = phi i1 [ true, %if.end21 ], [ false, %while.cond3.preheader.preheader111 ]
  %_25.096 = phi i8* [ %call22, %if.end21 ], [ undef, %while.cond3.preheader.preheader111 ]
  %i.093 = phi i64 [ %add18, %if.end21 ], [ 0, %while.cond3.preheader.preheader111 ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !314, metadata !25), !dbg !340
  %add18 = add nuw nsw i64 %i.093, 1, !dbg !382
  tail call void @llvm.dbg.value(metadata i64 %add18, i64 0, metadata !315, metadata !25), !dbg !341
  tail call void @llvm.dbg.value(metadata i64 %add18, i64 0, metadata !293, metadata !25), !dbg !323
  br i1 %_25_has_ownership.097, label %if.then20, label %if.end21, !dbg !383

if.then20:                                        ; preds = %while.cond3.preheader
  tail call void @free(i8* %_25.096) #9, !dbg !374
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !319, metadata !25), !dbg !343
  br label %if.end21, !dbg !374

if.end21:                                         ; preds = %if.then20, %while.cond3.preheader
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !318, metadata !25), !dbg !342
  %call22 = tail call noalias i8* @malloc(i64 0) #9, !dbg !378
  tail call void @llvm.dbg.value(metadata i8* %call22, i64 0, metadata !317, metadata !25), !dbg !379
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !319, metadata !25), !dbg !343
  %11 = bitcast i8* %call22 to i64*, !dbg !380
  tail call void @println_s(i64* %11, i64 0) #9, !dbg !381
  %exitcond104 = icmp eq i64 %add18, %1, !dbg !349
  br i1 %exitcond104, label %blklab6.loopexit112, label %while.cond3.preheader, !dbg !349

blklab6.loopexit:                                 ; preds = %if.end21.us
  %call22.us.lcssa = phi i8* [ %call22.us, %if.end21.us ]
  %call15.us.lcssa.lcssa = phi i8* [ %call15.us.lcssa, %if.end21.us ]
  %call.us.lcssa.lcssa = phi i64* [ %call.us.lcssa, %if.end21.us ]
  %phitmp = bitcast i64* %call.us.lcssa.lcssa to i8*, !dbg !384
  br label %blklab6, !dbg !384

blklab6.loopexit112:                              ; preds = %if.end21
  %call22.lcssa = phi i8* [ %call22, %if.end21 ]
  br label %blklab6, !dbg !384

blklab6:                                          ; preds = %blklab6.loopexit112, %blklab6.loopexit, %entry
  %_25_has_ownership.0.lcssa = phi i1 [ false, %entry ], [ true, %blklab6.loopexit ], [ true, %blklab6.loopexit112 ]
  %_25.0.lcssa = phi i8* [ undef, %entry ], [ %call22.us.lcssa, %blklab6.loopexit ], [ %call22.lcssa, %blklab6.loopexit112 ]
  %_18_has_ownership.0.lcssa = phi i8 [ 0, %entry ], [ 1, %blklab6.loopexit ], [ 0, %blklab6.loopexit112 ]
  %.lcssa80 = phi i8* [ null, %entry ], [ %call15.us.lcssa.lcssa, %blklab6.loopexit ], [ null, %blklab6.loopexit112 ]
  %_12.0.lcssa = phi i8* [ null, %entry ], [ %phitmp, %blklab6.loopexit ], [ null, %blklab6.loopexit112 ]
  br i1 %a_has_ownership, label %if.then24, label %if.end25, !dbg !384

if.then24:                                        ; preds = %blklab6
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !84, metadata !25) #9, !dbg !385
  %12 = bitcast %struct.Matrix* %a to i8**, !dbg !390
  %13 = load i8*, i8** %12, align 8, !dbg !390, !tbaa !38
  tail call void @free(i8* %13) #9, !dbg !391
  %14 = bitcast %struct.Matrix* %a to i8*, !dbg !392
  tail call void @free(i8* %14) #9, !dbg !393
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !292, metadata !25), !dbg !322
  br label %if.end25, !dbg !394

if.end25:                                         ; preds = %if.then24, %blklab6
  %cond = icmp eq i8 %_18_has_ownership.0.lcssa, 0, !dbg !395
  br i1 %cond, label %if.end31, label %if.then27, !dbg !395

if.then27:                                        ; preds = %if.end25
  tail call void @free(i8* %_12.0.lcssa) #9, !dbg !396
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !304, metadata !25), !dbg !332
  tail call void @free(i8* %.lcssa80) #9, !dbg !400
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !311, metadata !25), !dbg !337
  br label %if.end31, !dbg !400

if.end31:                                         ; preds = %if.end25, %if.then27
  br i1 %_25_has_ownership.0.lcssa, label %if.then33, label %if.end34, !dbg !404

if.then33:                                        ; preds = %if.end31
  tail call void @free(i8* %_25.0.lcssa) #9, !dbg !405
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !319, metadata !25), !dbg !343
  br label %if.end34, !dbg !405

if.end34:                                         ; preds = %if.then33, %if.end31
  ret void, !dbg !409
}

declare void @printf_s(i64*, i64) #3

declare void @println_s(i64*, i64) #3

; Function Attrs: nounwind uwtable
define noalias %struct.Matrix* @mat_mult(%struct.Matrix* nocapture %a, i1 zeroext %a_has_ownership, %struct.Matrix* nocapture %b, i1 zeroext %b_has_ownership) #4 !dbg !410 {
entry:
  %polly.par.userContext = alloca { i64, i64, i64*, i64*, i64* }, align 8
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !414, metadata !25), !dbg !471
  tail call void @llvm.dbg.value(metadata i1 %a_has_ownership, i64 0, metadata !415, metadata !125), !dbg !472
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !416, metadata !25), !dbg !473
  tail call void @llvm.dbg.value(metadata i1 %b_has_ownership, i64 0, metadata !417, metadata !125), !dbg !474
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !419, metadata !25), !dbg !475
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !420, metadata !25), !dbg !476
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !421, metadata !25), !dbg !477
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !422, metadata !25), !dbg !478
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !423, metadata !25), !dbg !478
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !424, metadata !25), !dbg !479
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !425, metadata !25), !dbg !480
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !426, metadata !25), !dbg !480
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !427, metadata !25), !dbg !481
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !428, metadata !25), !dbg !482
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !429, metadata !25), !dbg !482
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !430, metadata !25), !dbg !483
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !431, metadata !25), !dbg !484
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !432, metadata !25), !dbg !485
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !433, metadata !25), !dbg !486
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !434, metadata !25), !dbg !487
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !435, metadata !25), !dbg !488
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !436, metadata !25), !dbg !489
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !437, metadata !25), !dbg !490
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !438, metadata !25), !dbg !491
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !439, metadata !25), !dbg !491
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !440, metadata !25), !dbg !492
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !441, metadata !25), !dbg !493
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !442, metadata !25), !dbg !493
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !443, metadata !25), !dbg !494
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !444, metadata !25), !dbg !495
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !445, metadata !25), !dbg !495
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !446, metadata !25), !dbg !496
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !447, metadata !25), !dbg !497
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !448, metadata !25), !dbg !498
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !449, metadata !25), !dbg !499
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !450, metadata !25), !dbg !500
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !451, metadata !25), !dbg !501
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !452, metadata !25), !dbg !502
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !453, metadata !25), !dbg !503
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !454, metadata !25), !dbg !504
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !455, metadata !25), !dbg !505
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !456, metadata !25), !dbg !506
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !457, metadata !25), !dbg !507
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !458, metadata !25), !dbg !508
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !459, metadata !25), !dbg !509
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !460, metadata !25), !dbg !510
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !461, metadata !25), !dbg !511
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !462, metadata !25), !dbg !512
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !463, metadata !25), !dbg !513
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !464, metadata !25), !dbg !514
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !465, metadata !25), !dbg !515
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !466, metadata !25), !dbg !516
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !467, metadata !25), !dbg !517
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !468, metadata !25), !dbg !518
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !470, metadata !25), !dbg !519
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 2, !dbg !520
  %0 = load i64, i64* %width2, align 8, !dbg !520, !tbaa !100
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !434, metadata !25), !dbg !487
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !420, metadata !25), !dbg !476
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3, !dbg !521
  %1 = load i64, i64* %height3, align 8, !dbg !521, !tbaa !104
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !435, metadata !25), !dbg !488
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !421, metadata !25), !dbg !477
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !436, metadata !25), !dbg !489
  %mul = mul i64 %1, %0, !dbg !522
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !437, metadata !25), !dbg !490
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !439, metadata !25), !dbg !491
  %conv4 = trunc i64 %mul to i32, !dbg !523
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv4) #9, !dbg !523
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !438, metadata !25), !dbg !491
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !440, metadata !25), !dbg !492
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !423, metadata !25), !dbg !478
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !422, metadata !25), !dbg !478
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !424, metadata !25), !dbg !479
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !440, metadata !25), !dbg !492
  %data_size11 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1, !dbg !524
  %data12 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !524
  %2 = load i64*, i64** %data12, align 8, !dbg !524, !tbaa !38
  %3 = load i64, i64* %data_size11, align 8, !dbg !524, !tbaa !32
  %call14 = tail call i64* @copy(i64* %2, i64 %3) #9, !dbg !524
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !441, metadata !25), !dbg !493
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !443, metadata !25), !dbg !494
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !425, metadata !25), !dbg !480
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !427, metadata !25), !dbg !481
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !443, metadata !25), !dbg !494
  %data_size21 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !525
  %data22 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !525
  %4 = load i64*, i64** %data22, align 8, !dbg !525, !tbaa !38
  %5 = load i64, i64* %data_size21, align 8, !dbg !525, !tbaa !32
  %call24 = tail call i64* @copy(i64* %4, i64 %5) #9, !dbg !525
  tail call void @llvm.dbg.value(metadata i64* %call24, i64 0, metadata !444, metadata !25), !dbg !495
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !446, metadata !25), !dbg !496
  tail call void @llvm.dbg.value(metadata i64* %call24, i64 0, metadata !428, metadata !25), !dbg !482
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !430, metadata !25), !dbg !483
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !446, metadata !25), !dbg !496
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !447, metadata !25), !dbg !497
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !431, metadata !25), !dbg !484
  %cmp189 = icmp sgt i64 %1, 0, !dbg !526
  br i1 %cmp189, label %polly.split_new_and_old, label %if.end60, !dbg !529

polly.split_new_and_old:                          ; preds = %entry
  %polly.access.add.call24 = mul i64 %0, %0
  %polly.access.call24 = getelementptr i64, i64* %call24, i64 %polly.access.add.call24
  %6 = icmp ule i64* %polly.access.call24, %call
  %polly.access.call196 = getelementptr i64, i64* %call, i64 %mul
  %7 = icmp ule i64* %polly.access.call196, %call24
  %8 = or i1 %7, %6
  %polly.access.call14 = getelementptr i64, i64* %call14, i64 %mul
  %9 = icmp ule i64* %polly.access.call14, %call
  %10 = icmp ule i64* %polly.access.call196, %call14
  %11 = or i1 %10, %9
  %12 = and i1 %11, %8
  br i1 %12, label %polly.parallel.for, label %while.cond31.preheader.preheader

while.cond31.preheader.preheader:                 ; preds = %polly.split_new_and_old
  %cmp33186 = icmp sgt i64 %0, 0, !dbg !530
  br i1 %cmp33186, label %while.cond31.preheader.us.preheader, label %if.end60, !dbg !533

while.cond31.preheader.us.preheader:              ; preds = %while.cond31.preheader.preheader
  %xtraiter = and i64 %0, 1, !dbg !534
  %lcmp.mod = icmp eq i64 %0, %xtraiter, !dbg !534
  %unroll_iter = sub i64 %0, %xtraiter, !dbg !534
  %13 = icmp eq i64 %xtraiter, 0, !dbg !515
  br label %while.cond31.preheader.us, !dbg !534

while.cond31.preheader.us:                        ; preds = %while.cond31.preheader.us.preheader, %blklab15.loopexit.us-lcssa.us.us
  %i.0190.us = phi i64 [ %add57.us, %blklab15.loopexit.us-lcssa.us.us ], [ 0, %while.cond31.preheader.us.preheader ]
  %mul43.us = mul nsw i64 %i.0190.us, %0, !dbg !534
  br label %while.cond37.preheader.us.us, !dbg !536

while.cond37.preheader.us.us:                     ; preds = %while.cond31.preheader.us, %blklab17.loopexit.us.us
  %j.0187.us.us = phi i64 [ %add56.us.us, %blklab17.loopexit.us.us ], [ 0, %while.cond31.preheader.us ]
  %add.us.us = add nsw i64 %j.0187.us.us, %mul43.us, !dbg !537
  %arrayidx.us.us = getelementptr inbounds i64, i64* %call, i64 %add.us.us, !dbg !538
  %.pre = load i64, i64* %arrayidx.us.us, align 8, !dbg !538, !tbaa !41
  br i1 %lcmp.mod, label %blklab17.loopexit.us.us.unr-lcssa, label %while.cond37.preheader.us.us.new, !dbg !534

while.cond37.preheader.us.us.new:                 ; preds = %while.cond37.preheader.us.us
  br label %if.end42.us.us, !dbg !534

blklab17.loopexit.us.us.unr-lcssa.loopexit:       ; preds = %if.end42.us.us
  %add55.us.us.1.lcssa = phi i64 [ %add55.us.us.1, %if.end42.us.us ]
  %add51.us.us.1.lcssa = phi i64 [ %add51.us.us.1, %if.end42.us.us ]
  br label %blklab17.loopexit.us.us.unr-lcssa, !dbg !515

blklab17.loopexit.us.us.unr-lcssa:                ; preds = %while.cond37.preheader.us.us, %blklab17.loopexit.us.us.unr-lcssa.loopexit
  %.unr = phi i64 [ %.pre, %while.cond37.preheader.us.us ], [ %add51.us.us.1.lcssa, %blklab17.loopexit.us.us.unr-lcssa.loopexit ]
  %k.0185.us.us.unr = phi i64 [ 0, %while.cond37.preheader.us.us ], [ %add55.us.us.1.lcssa, %blklab17.loopexit.us.us.unr-lcssa.loopexit ]
  br i1 %13, label %blklab17.loopexit.us.us, label %if.end42.us.us.epil.preheader, !dbg !515

if.end42.us.us.epil.preheader:                    ; preds = %blklab17.loopexit.us.us.unr-lcssa
  br label %if.end42.us.us.epil, !dbg !515

if.end42.us.us.epil:                              ; preds = %if.end42.us.us.epil.preheader
  tail call void @llvm.dbg.value(metadata i64 %mul43.us, i64 0, metadata !450, metadata !25), !dbg !500
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !451, metadata !25), !dbg !501
  tail call void @llvm.dbg.value(metadata i64 %.unr, i64 0, metadata !452, metadata !25), !dbg !502
  tail call void @llvm.dbg.value(metadata i64 %mul43.us, i64 0, metadata !453, metadata !25), !dbg !503
  %add45.us.us.epil = add nsw i64 %k.0185.us.us.unr, %mul43.us, !dbg !539
  tail call void @llvm.dbg.value(metadata i64 %add45.us.us.epil, i64 0, metadata !454, metadata !25), !dbg !504
  %arrayidx46.us.us.epil = getelementptr inbounds i64, i64* %call14, i64 %add45.us.us.epil, !dbg !540
  %14 = load i64, i64* %arrayidx46.us.us.epil, align 8, !dbg !540, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %14, i64 0, metadata !455, metadata !25), !dbg !505
  %mul47.us.us.epil = mul nsw i64 %k.0185.us.us.unr, %0, !dbg !541
  tail call void @llvm.dbg.value(metadata i64 %mul47.us.us.epil, i64 0, metadata !456, metadata !25), !dbg !506
  %add48.us.us.epil = add nsw i64 %mul47.us.us.epil, %j.0187.us.us, !dbg !542
  tail call void @llvm.dbg.value(metadata i64 %add48.us.us.epil, i64 0, metadata !457, metadata !25), !dbg !507
  %arrayidx49.us.us.epil = getelementptr inbounds i64, i64* %call24, i64 %add48.us.us.epil, !dbg !543
  %15 = load i64, i64* %arrayidx49.us.us.epil, align 8, !dbg !543, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %15, i64 0, metadata !458, metadata !25), !dbg !508
  %mul50.us.us.epil = mul nsw i64 %15, %14, !dbg !544
  tail call void @llvm.dbg.value(metadata i64 %mul50.us.us.epil, i64 0, metadata !459, metadata !25), !dbg !509
  %add51.us.us.epil = add nsw i64 %mul50.us.us.epil, %.unr, !dbg !545
  tail call void @llvm.dbg.value(metadata i64 %add51.us.us.epil, i64 0, metadata !460, metadata !25), !dbg !510
  tail call void @llvm.dbg.value(metadata i64 %mul43.us, i64 0, metadata !461, metadata !25), !dbg !511
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !462, metadata !25), !dbg !512
  store i64 %add51.us.us.epil, i64* %arrayidx.us.us, align 8, !dbg !546, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !463, metadata !25), !dbg !513
  br label %blklab17.loopexit.us.us.epilog-lcssa, !dbg !536

blklab17.loopexit.us.us.epilog-lcssa:             ; preds = %if.end42.us.us.epil
  br label %blklab17.loopexit.us.us, !dbg !515

blklab17.loopexit.us.us:                          ; preds = %blklab17.loopexit.us.us.unr-lcssa, %blklab17.loopexit.us.us.epilog-lcssa
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !465, metadata !25), !dbg !515
  %add56.us.us = add nuw nsw i64 %j.0187.us.us, 1, !dbg !547
  tail call void @llvm.dbg.value(metadata i64 %add56.us.us, i64 0, metadata !466, metadata !25), !dbg !516
  tail call void @llvm.dbg.value(metadata i64 %add56.us.us, i64 0, metadata !432, metadata !25), !dbg !485
  %exitcond192.us.us = icmp eq i64 %add56.us.us, %0, !dbg !533
  br i1 %exitcond192.us.us, label %blklab15.loopexit.us-lcssa.us.us, label %while.cond37.preheader.us.us, !dbg !533

if.end42.us.us:                                   ; preds = %if.end42.us.us, %while.cond37.preheader.us.us.new
  %16 = phi i64 [ %.pre, %while.cond37.preheader.us.us.new ], [ %add51.us.us.1, %if.end42.us.us ], !dbg !538
  %k.0185.us.us = phi i64 [ 0, %while.cond37.preheader.us.us.new ], [ %add55.us.us.1, %if.end42.us.us ]
  %niter = phi i64 [ %unroll_iter, %while.cond37.preheader.us.us.new ], [ %niter.nsub.1, %if.end42.us.us ]
  tail call void @llvm.dbg.value(metadata i64 %mul43.us, i64 0, metadata !450, metadata !25), !dbg !500
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !451, metadata !25), !dbg !501
  tail call void @llvm.dbg.value(metadata i64 %16, i64 0, metadata !452, metadata !25), !dbg !502
  tail call void @llvm.dbg.value(metadata i64 %mul43.us, i64 0, metadata !453, metadata !25), !dbg !503
  %add45.us.us = add nsw i64 %k.0185.us.us, %mul43.us, !dbg !539
  tail call void @llvm.dbg.value(metadata i64 %add45.us.us, i64 0, metadata !454, metadata !25), !dbg !504
  %arrayidx46.us.us = getelementptr inbounds i64, i64* %call14, i64 %add45.us.us, !dbg !540
  %17 = load i64, i64* %arrayidx46.us.us, align 8, !dbg !540, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %17, i64 0, metadata !455, metadata !25), !dbg !505
  %mul47.us.us = mul nsw i64 %k.0185.us.us, %0, !dbg !541
  tail call void @llvm.dbg.value(metadata i64 %mul47.us.us, i64 0, metadata !456, metadata !25), !dbg !506
  %add48.us.us = add nsw i64 %mul47.us.us, %j.0187.us.us, !dbg !542
  tail call void @llvm.dbg.value(metadata i64 %add48.us.us, i64 0, metadata !457, metadata !25), !dbg !507
  %arrayidx49.us.us = getelementptr inbounds i64, i64* %call24, i64 %add48.us.us, !dbg !543
  %18 = load i64, i64* %arrayidx49.us.us, align 8, !dbg !543, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %18, i64 0, metadata !458, metadata !25), !dbg !508
  %mul50.us.us = mul nsw i64 %18, %17, !dbg !544
  tail call void @llvm.dbg.value(metadata i64 %mul50.us.us, i64 0, metadata !459, metadata !25), !dbg !509
  %add51.us.us = add nsw i64 %mul50.us.us, %16, !dbg !545
  tail call void @llvm.dbg.value(metadata i64 %add51.us.us, i64 0, metadata !460, metadata !25), !dbg !510
  tail call void @llvm.dbg.value(metadata i64 %mul43.us, i64 0, metadata !461, metadata !25), !dbg !511
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !462, metadata !25), !dbg !512
  store i64 %add51.us.us, i64* %arrayidx.us.us, align 8, !dbg !546, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !463, metadata !25), !dbg !513
  %add55.us.us = or i64 %k.0185.us.us, 1, !dbg !548
  tail call void @llvm.dbg.value(metadata i64 %add55.us.us, i64 0, metadata !464, metadata !25), !dbg !514
  tail call void @llvm.dbg.value(metadata i64 %add55.us.us, i64 0, metadata !433, metadata !25), !dbg !486
  tail call void @llvm.dbg.value(metadata i64 %mul43.us, i64 0, metadata !450, metadata !25), !dbg !500
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !451, metadata !25), !dbg !501
  tail call void @llvm.dbg.value(metadata i64 %16, i64 0, metadata !452, metadata !25), !dbg !502
  tail call void @llvm.dbg.value(metadata i64 %mul43.us, i64 0, metadata !453, metadata !25), !dbg !503
  %add45.us.us.1 = add nsw i64 %add55.us.us, %mul43.us, !dbg !539
  tail call void @llvm.dbg.value(metadata i64 %add45.us.us, i64 0, metadata !454, metadata !25), !dbg !504
  %arrayidx46.us.us.1 = getelementptr inbounds i64, i64* %call14, i64 %add45.us.us.1, !dbg !540
  %19 = load i64, i64* %arrayidx46.us.us.1, align 8, !dbg !540, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %17, i64 0, metadata !455, metadata !25), !dbg !505
  %mul47.us.us.1 = mul nsw i64 %add55.us.us, %0, !dbg !541
  tail call void @llvm.dbg.value(metadata i64 %mul47.us.us, i64 0, metadata !456, metadata !25), !dbg !506
  %add48.us.us.1 = add nsw i64 %mul47.us.us.1, %j.0187.us.us, !dbg !542
  tail call void @llvm.dbg.value(metadata i64 %add48.us.us, i64 0, metadata !457, metadata !25), !dbg !507
  %arrayidx49.us.us.1 = getelementptr inbounds i64, i64* %call24, i64 %add48.us.us.1, !dbg !543
  %20 = load i64, i64* %arrayidx49.us.us.1, align 8, !dbg !543, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %18, i64 0, metadata !458, metadata !25), !dbg !508
  %mul50.us.us.1 = mul nsw i64 %20, %19, !dbg !544
  tail call void @llvm.dbg.value(metadata i64 %mul50.us.us, i64 0, metadata !459, metadata !25), !dbg !509
  %add51.us.us.1 = add nsw i64 %mul50.us.us.1, %add51.us.us, !dbg !545
  tail call void @llvm.dbg.value(metadata i64 %add51.us.us, i64 0, metadata !460, metadata !25), !dbg !510
  tail call void @llvm.dbg.value(metadata i64 %mul43.us, i64 0, metadata !461, metadata !25), !dbg !511
  tail call void @llvm.dbg.value(metadata i64 %add.us.us, i64 0, metadata !462, metadata !25), !dbg !512
  store i64 %add51.us.us.1, i64* %arrayidx.us.us, align 8, !dbg !546, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !463, metadata !25), !dbg !513
  %add55.us.us.1 = add nsw i64 %k.0185.us.us, 2, !dbg !548
  tail call void @llvm.dbg.value(metadata i64 %add55.us.us, i64 0, metadata !464, metadata !25), !dbg !514
  tail call void @llvm.dbg.value(metadata i64 %add55.us.us, i64 0, metadata !433, metadata !25), !dbg !486
  %niter.nsub.1 = add i64 %niter, -2, !dbg !536
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0, !dbg !536
  br i1 %niter.ncmp.1, label %blklab17.loopexit.us.us.unr-lcssa.loopexit, label %if.end42.us.us, !dbg !536

blklab15.loopexit.us-lcssa.us.us:                 ; preds = %blklab17.loopexit.us.us
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !467, metadata !25), !dbg !517
  %add57.us = add nuw nsw i64 %i.0190.us, 1, !dbg !549
  tail call void @llvm.dbg.value(metadata i64 %add57.us, i64 0, metadata !468, metadata !25), !dbg !518
  tail call void @llvm.dbg.value(metadata i64 %add57.us, i64 0, metadata !431, metadata !25), !dbg !484
  %exitcond193.us = icmp eq i64 %add57.us, %1, !dbg !529
  br i1 %exitcond193.us, label %if.end60.loopexit, label %while.cond31.preheader.us, !dbg !529

if.end60.loopexit:                                ; preds = %blklab15.loopexit.us-lcssa.us.us
  br label %if.end60, !dbg !550

if.end60:                                         ; preds = %if.end60.loopexit, %while.cond31.preheader.preheader, %polly.parallel.for, %entry
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !113, metadata !25) #9, !dbg !550
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !114, metadata !25) #9, !dbg !552
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !115, metadata !25) #9, !dbg !553
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !116, metadata !25) #9, !dbg !553
  tail call void @llvm.dbg.value(metadata i1 false, i64 0, metadata !117, metadata !125) #9, !dbg !554
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !119, metadata !25) #9, !dbg !555
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !121, metadata !25) #9, !dbg !556
  %call.i = tail call noalias i8* @malloc(i64 32) #9, !dbg !557
  %21 = bitcast i8* %call.i to %struct.Matrix*, !dbg !557
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %21, i64 0, metadata !120, metadata !25) #9, !dbg !558
  %data_size1.i = getelementptr inbounds i8, i8* %call.i, i64 8, !dbg !559
  %22 = bitcast i8* %data_size1.i to i64*, !dbg !559
  store i64 %mul, i64* %22, align 8, !dbg !559, !tbaa !32
  %call2.i = tail call i64* @copy(i64* %call, i64 %mul) #9, !dbg !559
  %data3.i = bitcast i8* %call.i to i64**, !dbg !559
  store i64* %call2.i, i64** %data3.i, align 8, !dbg !559, !tbaa !38
  %height4.i = getelementptr inbounds i8, i8* %call.i, i64 24, !dbg !560
  %23 = bitcast i8* %height4.i to i64*, !dbg !560
  store i64 %1, i64* %23, align 8, !dbg !561, !tbaa !104
  %width5.i = getelementptr inbounds i8, i8* %call.i, i64 16, !dbg !562
  %24 = bitcast i8* %width5.i to i64*, !dbg !562
  store i64 %0, i64* %24, align 8, !dbg !563, !tbaa !100
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !121, metadata !25) #9, !dbg !556
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %21, i64 0, metadata !469, metadata !25), !dbg !564
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !470, metadata !25), !dbg !519
  br i1 %a_has_ownership, label %if.then63, label %if.end64, !dbg !565

if.then63:                                        ; preds = %if.end60
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !84, metadata !25) #9, !dbg !566
  %25 = bitcast %struct.Matrix* %a to i8**, !dbg !571
  %26 = load i8*, i8** %25, align 8, !dbg !571, !tbaa !38
  tail call void @free(i8* %26) #9, !dbg !572
  %27 = bitcast %struct.Matrix* %a to i8*, !dbg !573
  tail call void @free(i8* %27) #9, !dbg !574
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !415, metadata !25), !dbg !472
  br label %if.end64, !dbg !575

if.end64:                                         ; preds = %if.then63, %if.end60
  br i1 %b_has_ownership, label %if.then66, label %if.then72, !dbg !576

if.then66:                                        ; preds = %if.end64
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !84, metadata !25) #9, !dbg !577
  %28 = bitcast %struct.Matrix* %b to i8**, !dbg !582
  %29 = load i8*, i8** %28, align 8, !dbg !582, !tbaa !38
  tail call void @free(i8* %29) #9, !dbg !583
  %30 = bitcast %struct.Matrix* %b to i8*, !dbg !584
  tail call void @free(i8* %30) #9, !dbg !585
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !417, metadata !25), !dbg !474
  br label %if.then72, !dbg !586

if.then72:                                        ; preds = %if.then66, %if.end64
  %31 = bitcast i64* %call to i8*, !dbg !587
  tail call void @free(i8* %31) #9, !dbg !587
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !424, metadata !25), !dbg !479
  %32 = bitcast i64* %call14 to i8*, !dbg !591
  tail call void @free(i8* %32) #9, !dbg !591
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !427, metadata !25), !dbg !481
  %33 = bitcast i64* %call24 to i8*, !dbg !595
  tail call void @free(i8* %33) #9, !dbg !595
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !430, metadata !25), !dbg !483
  ret %struct.Matrix* %21, !dbg !599

polly.parallel.for:                               ; preds = %polly.split_new_and_old
  %34 = add nsw i64 %1, -1
  %polly.fdiv_q.shr = ashr i64 %34, 5
  %35 = bitcast { i64, i64, i64*, i64*, i64* }* %polly.par.userContext to i8*
  call void @llvm.lifetime.start(i64 40, i8* %35)
  %polly.subfn.storeaddr. = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 0
  store i64 %0, i64* %polly.subfn.storeaddr., align 8
  %polly.subfn.storeaddr.209 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 1
  store i64 %1, i64* %polly.subfn.storeaddr.209, align 8
  %polly.subfn.storeaddr.call = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 2
  store i64* %call, i64** %polly.subfn.storeaddr.call, align 8
  %polly.subfn.storeaddr.call14 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 3
  store i64* %call14, i64** %polly.subfn.storeaddr.call14, align 8
  %polly.subfn.storeaddr.call24 = getelementptr inbounds { i64, i64, i64*, i64*, i64* }, { i64, i64, i64*, i64*, i64* }* %polly.par.userContext, i64 0, i32 4
  store i64* %call24, i64** %polly.subfn.storeaddr.call24, align 8
  %36 = add nsw i64 %polly.fdiv_q.shr, 1
  call void @GOMP_parallel_loop_runtime_start(void (i8*)* nonnull @mat_mult_polly_subfn, i8* %35, i32 0, i64 0, i64 %36, i64 1) #9
  call void @mat_mult_polly_subfn(i8* %35) #9
  call void @GOMP_parallel_end() #9
  call void @llvm.lifetime.end(i64 8, i8* %35)
  br label %if.end60
}

; Function Attrs: noreturn nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #5 !dbg !600 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !605, metadata !25), !dbg !691
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !606, metadata !25), !dbg !692
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !608, metadata !25), !dbg !693
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !610, metadata !25), !dbg !694
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !612, metadata !25), !dbg !695
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !614, metadata !25), !dbg !696
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !616, metadata !25), !dbg !697
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !618, metadata !25), !dbg !697
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !619, metadata !25), !dbg !697
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !620, metadata !25), !dbg !698
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !621, metadata !25), !dbg !699
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !622, metadata !25), !dbg !700
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !623, metadata !25), !dbg !700
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !624, metadata !25), !dbg !701
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !626, metadata !25), !dbg !702
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !627, metadata !25), !dbg !702
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !628, metadata !25), !dbg !703
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !631, metadata !25), !dbg !704
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !633, metadata !25), !dbg !705
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !635, metadata !25), !dbg !706
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !636, metadata !25), !dbg !707
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !637, metadata !25), !dbg !707
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !638, metadata !25), !dbg !708
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !639, metadata !25), !dbg !709
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !640, metadata !25), !dbg !710
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !641, metadata !25), !dbg !711
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !642, metadata !25), !dbg !712
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !643, metadata !25), !dbg !713
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !644, metadata !25), !dbg !714
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !645, metadata !25), !dbg !715
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !646, metadata !25), !dbg !716
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !647, metadata !25), !dbg !717
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !648, metadata !25), !dbg !718
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !649, metadata !25), !dbg !718
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !650, metadata !25), !dbg !719
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !651, metadata !25), !dbg !720
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !652, metadata !25), !dbg !721
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !653, metadata !25), !dbg !722
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !654, metadata !25), !dbg !723
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !655, metadata !25), !dbg !724
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !656, metadata !25), !dbg !725
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !657, metadata !25), !dbg !726
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !658, metadata !25), !dbg !727
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !659, metadata !25), !dbg !728
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !660, metadata !25), !dbg !729
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !661, metadata !25), !dbg !730
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !662, metadata !25), !dbg !730
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !663, metadata !25), !dbg !731
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !664, metadata !25), !dbg !732
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !665, metadata !25), !dbg !733
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !666, metadata !25), !dbg !734
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !667, metadata !25), !dbg !735
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !668, metadata !25), !dbg !736
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !669, metadata !25), !dbg !737
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !670, metadata !25), !dbg !738
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !671, metadata !25), !dbg !739
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !673, metadata !25), !dbg !740
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !674, metadata !25), !dbg !740
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !675, metadata !25), !dbg !741
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !677, metadata !25), !dbg !742
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !678, metadata !25), !dbg !742
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !679, metadata !25), !dbg !743
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !680, metadata !25), !dbg !744
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !681, metadata !25), !dbg !745
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !682, metadata !25), !dbg !746
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !683, metadata !25), !dbg !747
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !684, metadata !25), !dbg !748
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !685, metadata !25), !dbg !749
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !686, metadata !25), !dbg !750
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !688, metadata !25), !dbg !751
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !689, metadata !25), !dbg !751
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !690, metadata !25), !dbg !752
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #9, !dbg !753
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !616, metadata !25), !dbg !697
  %sub = add nsw i32 %argc, -1, !dbg !753
  %conv = sext i32 %sub to i64, !dbg !753
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !618, metadata !25), !dbg !697
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !620, metadata !25), !dbg !698
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !621, metadata !25), !dbg !699
  %0 = load i64*, i64** %call, align 8, !dbg !754, !tbaa !70
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !622, metadata !25), !dbg !700
  %call1 = tail call i64* @parseStringToInt(i64* %0) #9, !dbg !755
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !615, metadata !25), !dbg !756
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !607, metadata !25), !dbg !757
  %cmp = icmp eq i64* %call1, null, !dbg !758
  br i1 %cmp, label %if.end196, label %if.end, !dbg !760

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %call1, align 8, !dbg !761, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !608, metadata !25), !dbg !693
  tail call void @llvm.dbg.value(metadata i64 7, i64 0, metadata !627, metadata !25), !dbg !702
  %call5 = tail call noalias i8* @malloc(i64 56) #9, !dbg !762
  %2 = bitcast i8* %call5 to i64*, !dbg !762
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !626, metadata !25), !dbg !702
  %3 = bitcast i8* %call5 to <2 x i64>*, !dbg !763
  store <2 x i64> <i64 115, i64 105>, <2 x i64>* %3, align 8, !dbg !763, !tbaa !41
  %arrayidx8 = getelementptr inbounds i8, i8* %call5, i64 16, !dbg !764
  %4 = bitcast i8* %arrayidx8 to <2 x i64>*, !dbg !765
  store <2 x i64> <i64 122, i64 101>, <2 x i64>* %4, align 8, !dbg !765, !tbaa !41
  %arrayidx10 = getelementptr inbounds i8, i8* %call5, i64 32, !dbg !766
  %5 = bitcast i8* %arrayidx10 to <2 x i64>*, !dbg !767
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %5, align 8, !dbg !767, !tbaa !41
  %arrayidx12 = getelementptr inbounds i8, i8* %call5, i64 48, !dbg !768
  %6 = bitcast i8* %arrayidx12 to i64*, !dbg !768
  store i64 32, i64* %6, align 8, !dbg !769, !tbaa !41
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !628, metadata !25), !dbg !703
  tail call void @printf_s(i64* %2, i64 7) #9, !dbg !770
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1), !dbg !771
  %call17 = tail call %struct.Matrix* @init(i64 %1, i64 %1), !dbg !772
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call17, i64 0, metadata !630, metadata !25), !dbg !773
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !631, metadata !25), !dbg !704
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call17, i64 0, metadata !609, metadata !25), !dbg !774
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !610, metadata !25), !dbg !694
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !631, metadata !25), !dbg !704
  %call24 = tail call %struct.Matrix* @init(i64 %1, i64 %1), !dbg !775
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call24, i64 0, metadata !632, metadata !25), !dbg !776
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !633, metadata !25), !dbg !705
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call24, i64 0, metadata !611, metadata !25), !dbg !777
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !612, metadata !25), !dbg !695
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !633, metadata !25), !dbg !705
  %call31 = tail call %struct.Matrix* @mat_mult(%struct.Matrix* %call17, i1 zeroext false, %struct.Matrix* %call24, i1 zeroext false), !dbg !778
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call31, i64 0, metadata !634, metadata !25), !dbg !779
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !635, metadata !25), !dbg !706
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call31, i64 0, metadata !613, metadata !25), !dbg !780
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !614, metadata !25), !dbg !696
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !635, metadata !25), !dbg !706
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call17, i64 0, i32 1, !dbg !781
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call17, i64 0, i32 0, !dbg !781
  %7 = load i64*, i64** %data, align 8, !dbg !781, !tbaa !38
  %8 = load i64, i64* %data_size, align 8, !dbg !781, !tbaa !32
  %call39 = tail call i64* @copy(i64* %7, i64 %8) #9, !dbg !781
  tail call void @llvm.dbg.value(metadata i64* %call39, i64 0, metadata !636, metadata !25), !dbg !707
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !638, metadata !25), !dbg !708
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !639, metadata !25), !dbg !709
  %sub40 = add nsw i64 %1, -1, !dbg !783
  tail call void @llvm.dbg.value(metadata i64 %sub40, i64 0, metadata !640, metadata !25), !dbg !710
  %add = mul i64 %1, %1, !dbg !784
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !642, metadata !25), !dbg !712
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !643, metadata !25), !dbg !713
  %sub41 = add nsw i64 %add, -1, !dbg !785
  tail call void @llvm.dbg.value(metadata i64 %sub41, i64 0, metadata !644, metadata !25), !dbg !714
  %arrayidx42 = getelementptr inbounds i64, i64* %call39, i64 %sub41, !dbg !786
  %9 = load i64, i64* %arrayidx42, align 8, !dbg !786, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !645, metadata !25), !dbg !715
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !646, metadata !25), !dbg !716
  tail call void @llvm.dbg.value(metadata i64 %sub40, i64 0, metadata !647, metadata !25), !dbg !717
  %cmp44 = icmp eq i64 %9, %sub40, !dbg !787
  br i1 %cmp44, label %if.end51, label %if.end47, !dbg !789

if.end47:                                         ; preds = %if.end
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !790, !tbaa !70
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %10) #10, !dbg !791
  tail call void @exit(i32 -1) #11, !dbg !792
  unreachable, !dbg !792

if.end51:                                         ; preds = %if.end
  %data_size52 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call24, i64 0, i32 1, !dbg !793
  %data53 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call24, i64 0, i32 0, !dbg !793
  %12 = load i64*, i64** %data53, align 8, !dbg !793, !tbaa !38
  %13 = load i64, i64* %data_size52, align 8, !dbg !793, !tbaa !32
  %call55 = tail call i64* @copy(i64* %12, i64 %13) #9, !dbg !793
  tail call void @llvm.dbg.value(metadata i64* %call55, i64 0, metadata !648, metadata !25), !dbg !718
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !650, metadata !25), !dbg !719
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !651, metadata !25), !dbg !720
  tail call void @llvm.dbg.value(metadata i64 %sub40, i64 0, metadata !652, metadata !25), !dbg !721
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !654, metadata !25), !dbg !723
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !655, metadata !25), !dbg !724
  tail call void @llvm.dbg.value(metadata i64 %sub41, i64 0, metadata !656, metadata !25), !dbg !725
  %arrayidx60 = getelementptr inbounds i64, i64* %call55, i64 %sub41, !dbg !795
  %14 = load i64, i64* %arrayidx60, align 8, !dbg !795, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %14, i64 0, metadata !657, metadata !25), !dbg !726
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !658, metadata !25), !dbg !727
  tail call void @llvm.dbg.value(metadata i64 %sub40, i64 0, metadata !659, metadata !25), !dbg !728
  %cmp62 = icmp eq i64 %14, %sub40, !dbg !796
  br i1 %cmp62, label %blklab21, label %if.end65, !dbg !798

if.end65:                                         ; preds = %if.end51
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !799, !tbaa !70
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %15) #10, !dbg !800
  tail call void @exit(i32 -1) #11, !dbg !801
  unreachable, !dbg !801

blklab21:                                         ; preds = %if.end51
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !660, metadata !25), !dbg !729
  %cmp67 = icmp eq i64 %1, 2000, !dbg !802
  br i1 %cmp67, label %if.end73, label %blklab21.if.end193_crit_edge, !dbg !804

blklab21.if.end193_crit_edge:                     ; preds = %blklab21
  %data123.phi.trans.insert = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 0, !dbg !805
  %.pre = load i64*, i64** %data123.phi.trans.insert, align 8, !dbg !805, !tbaa !38
  %data_size122.phi.trans.insert = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 1, !dbg !805
  %.pre361 = load i64, i64* %data_size122.phi.trans.insert, align 8, !dbg !805, !tbaa !32
  br label %if.end193, !dbg !804

if.end73:                                         ; preds = %blklab21
  %data_size74 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 1, !dbg !806
  %data75 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 0, !dbg !806
  %17 = load i64*, i64** %data75, align 8, !dbg !806, !tbaa !38
  %18 = load i64, i64* %data_size74, align 8, !dbg !806, !tbaa !32
  %call77 = tail call i64* @copy(i64* %17, i64 %18) #9, !dbg !806
  tail call void @llvm.dbg.value(metadata i64* %call77, i64 0, metadata !661, metadata !25), !dbg !730
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !663, metadata !25), !dbg !731
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !664, metadata !25), !dbg !732
  tail call void @llvm.dbg.value(metadata i64 %sub40, i64 0, metadata !665, metadata !25), !dbg !733
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !667, metadata !25), !dbg !735
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !668, metadata !25), !dbg !736
  tail call void @llvm.dbg.value(metadata i64 %sub41, i64 0, metadata !669, metadata !25), !dbg !737
  %arrayidx82 = getelementptr inbounds i64, i64* %call77, i64 %sub41, !dbg !808
  %19 = load i64, i64* %arrayidx82, align 8, !dbg !808, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %19, i64 0, metadata !670, metadata !25), !dbg !738
  tail call void @llvm.dbg.value(metadata i64 3996001000, i64 0, metadata !671, metadata !25), !dbg !739
  %cmp83 = icmp eq i64 %19, 3996001000, !dbg !809
  br i1 %cmp83, label %if.end193, label %if.end86, !dbg !811

if.end86:                                         ; preds = %if.end73
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !812, !tbaa !70
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %20) #10, !dbg !813
  tail call void @exit(i32 -1) #11, !dbg !814
  unreachable, !dbg !814

if.end193:                                        ; preds = %blklab21.if.end193_crit_edge, %if.end73
  %22 = phi i64 [ %.pre361, %blklab21.if.end193_crit_edge ], [ %18, %if.end73 ], !dbg !805
  %23 = phi i64* [ %.pre, %blklab21.if.end193_crit_edge ], [ %17, %if.end73 ], !dbg !805
  %_39.0 = phi i64* [ null, %blklab21.if.end193_crit_edge ], [ %call77, %if.end73 ]
  %_39_has_ownership.0 = phi i1 [ true, %blklab21.if.end193_crit_edge ], [ false, %if.end73 ]
  tail call void @llvm.dbg.value(metadata i64 27, i64 0, metadata !674, metadata !25), !dbg !740
  %call91 = tail call noalias i8* @malloc(i64 216) #9, !dbg !815
  %24 = bitcast i8* %call91 to i64*, !dbg !815
  tail call void @llvm.dbg.value(metadata i64* %24, i64 0, metadata !673, metadata !25), !dbg !740
  %25 = bitcast i8* %call91 to <2 x i64>*, !dbg !816
  store <2 x i64> <i64 77, i64 97>, <2 x i64>* %25, align 8, !dbg !816, !tbaa !41
  %arrayidx94 = getelementptr inbounds i8, i8* %call91, i64 16, !dbg !817
  %26 = bitcast i8* %arrayidx94 to <2 x i64>*, !dbg !818
  store <2 x i64> <i64 116, i64 114>, <2 x i64>* %26, align 8, !dbg !818, !tbaa !41
  %arrayidx96 = getelementptr inbounds i8, i8* %call91, i64 32, !dbg !819
  %27 = bitcast i8* %arrayidx96 to <2 x i64>*, !dbg !820
  store <2 x i64> <i64 105, i64 120>, <2 x i64>* %27, align 8, !dbg !820, !tbaa !41
  %arrayidx98 = getelementptr inbounds i8, i8* %call91, i64 48, !dbg !821
  %28 = bitcast i8* %arrayidx98 to <2 x i64>*, !dbg !822
  store <2 x i64> <i64 32, i64 67>, <2 x i64>* %28, align 8, !dbg !822, !tbaa !41
  %arrayidx100 = getelementptr inbounds i8, i8* %call91, i64 64, !dbg !823
  %29 = bitcast i8* %arrayidx100 to <2 x i64>*, !dbg !824
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %29, align 8, !dbg !824, !tbaa !41
  %arrayidx102 = getelementptr inbounds i8, i8* %call91, i64 80, !dbg !825
  %30 = bitcast i8* %arrayidx102 to <2 x i64>*, !dbg !826
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %30, align 8, !dbg !826, !tbaa !41
  %arrayidx104 = getelementptr inbounds i8, i8* %call91, i64 96, !dbg !827
  %31 = bitcast i8* %arrayidx104 to <2 x i64>*, !dbg !828
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %31, align 8, !dbg !828, !tbaa !41
  %arrayidx106 = getelementptr inbounds i8, i8* %call91, i64 112, !dbg !829
  %32 = bitcast i8* %arrayidx106 to <2 x i64>*, !dbg !830
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %32, align 8, !dbg !830, !tbaa !41
  %arrayidx108 = getelementptr inbounds i8, i8* %call91, i64 128, !dbg !831
  %33 = bitcast i8* %arrayidx108 to <2 x i64>*, !dbg !832
  store <2 x i64> <i64 91, i64 115>, <2 x i64>* %33, align 8, !dbg !832, !tbaa !41
  %arrayidx110 = getelementptr inbounds i8, i8* %call91, i64 144, !dbg !833
  %34 = bitcast i8* %arrayidx110 to <2 x i64>*, !dbg !834
  store <2 x i64> <i64 105, i64 122>, <2 x i64>* %34, align 8, !dbg !834, !tbaa !41
  %arrayidx112 = getelementptr inbounds i8, i8* %call91, i64 160, !dbg !835
  %35 = bitcast i8* %arrayidx112 to <2 x i64>*, !dbg !836
  store <2 x i64> <i64 101, i64 45>, <2 x i64>* %35, align 8, !dbg !836, !tbaa !41
  %arrayidx114 = getelementptr inbounds i8, i8* %call91, i64 176, !dbg !837
  %36 = bitcast i8* %arrayidx114 to <2 x i64>*, !dbg !838
  store <2 x i64> <i64 49, i64 93>, <2 x i64>* %36, align 8, !dbg !838, !tbaa !41
  %arrayidx116 = getelementptr inbounds i8, i8* %call91, i64 192, !dbg !839
  %37 = bitcast i8* %arrayidx116 to <2 x i64>*, !dbg !840
  store <2 x i64> <i64 32, i64 61>, <2 x i64>* %37, align 8, !dbg !840, !tbaa !41
  %arrayidx118 = getelementptr inbounds i8, i8* %call91, i64 208, !dbg !841
  %38 = bitcast i8* %arrayidx118 to i64*, !dbg !841
  store i64 32, i64* %38, align 8, !dbg !842, !tbaa !41
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !675, metadata !25), !dbg !741
  tail call void @printf_s(i64* %24, i64 27) #9, !dbg !843
  %call125 = tail call i64* @copy(i64* %23, i64 %22) #9, !dbg !805
  tail call void @llvm.dbg.value(metadata i64* %call125, i64 0, metadata !677, metadata !25), !dbg !742
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !679, metadata !25), !dbg !743
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !680, metadata !25), !dbg !744
  tail call void @llvm.dbg.value(metadata i64 %sub40, i64 0, metadata !681, metadata !25), !dbg !745
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !683, metadata !25), !dbg !747
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !684, metadata !25), !dbg !748
  tail call void @llvm.dbg.value(metadata i64 %sub41, i64 0, metadata !685, metadata !25), !dbg !749
  %arrayidx130 = getelementptr inbounds i64, i64* %call125, i64 %sub41, !dbg !844
  %39 = load i64, i64* %arrayidx130, align 8, !dbg !844, !tbaa !41
  tail call void @llvm.dbg.value(metadata i64 %39, i64 0, metadata !686, metadata !25), !dbg !750
  %call131 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %39), !dbg !845
  tail call void @llvm.dbg.value(metadata i64 25, i64 0, metadata !689, metadata !25), !dbg !751
  %call135 = tail call noalias i8* @malloc(i64 200) #9, !dbg !846
  %40 = bitcast i8* %call135 to i64*, !dbg !846
  tail call void @llvm.dbg.value(metadata i64* %40, i64 0, metadata !688, metadata !25), !dbg !751
  %41 = bitcast i8* %call135 to <2 x i64>*, !dbg !847
  store <2 x i64> <i64 80, i64 97>, <2 x i64>* %41, align 8, !dbg !847, !tbaa !41
  %arrayidx138 = getelementptr inbounds i8, i8* %call135, i64 16, !dbg !848
  %42 = bitcast i8* %arrayidx138 to <2 x i64>*, !dbg !849
  store <2 x i64> <i64 115, i64 115>, <2 x i64>* %42, align 8, !dbg !849, !tbaa !41
  %arrayidx140 = getelementptr inbounds i8, i8* %call135, i64 32, !dbg !850
  %43 = bitcast i8* %arrayidx140 to <2 x i64>*, !dbg !851
  store <2 x i64> <i64 32, i64 77>, <2 x i64>* %43, align 8, !dbg !851, !tbaa !41
  %arrayidx142 = getelementptr inbounds i8, i8* %call135, i64 48, !dbg !852
  %44 = bitcast i8* %arrayidx142 to <2 x i64>*, !dbg !853
  store <2 x i64> <i64 97, i64 116>, <2 x i64>* %44, align 8, !dbg !853, !tbaa !41
  %arrayidx144 = getelementptr inbounds i8, i8* %call135, i64 64, !dbg !854
  %45 = bitcast i8* %arrayidx144 to <2 x i64>*, !dbg !855
  store <2 x i64> <i64 114, i64 105>, <2 x i64>* %45, align 8, !dbg !855, !tbaa !41
  %arrayidx146 = getelementptr inbounds i8, i8* %call135, i64 80, !dbg !856
  %46 = bitcast i8* %arrayidx146 to <2 x i64>*, !dbg !857
  store <2 x i64> <i64 120, i64 77>, <2 x i64>* %46, align 8, !dbg !857, !tbaa !41
  %arrayidx148 = getelementptr inbounds i8, i8* %call135, i64 96, !dbg !858
  %47 = bitcast i8* %arrayidx148 to <2 x i64>*, !dbg !859
  store <2 x i64> <i64 117, i64 108>, <2 x i64>* %47, align 8, !dbg !859, !tbaa !41
  %arrayidx150 = getelementptr inbounds i8, i8* %call135, i64 112, !dbg !860
  %48 = bitcast i8* %arrayidx150 to <2 x i64>*, !dbg !861
  store <2 x i64> <i64 116, i64 32>, <2 x i64>* %48, align 8, !dbg !861, !tbaa !41
  %arrayidx152 = getelementptr inbounds i8, i8* %call135, i64 128, !dbg !862
  %49 = bitcast i8* %arrayidx152 to <2 x i64>*, !dbg !863
  store <2 x i64> <i64 116, i64 101>, <2 x i64>* %49, align 8, !dbg !863, !tbaa !41
  %arrayidx154 = getelementptr inbounds i8, i8* %call135, i64 144, !dbg !864
  %50 = bitcast i8* %arrayidx154 to <2 x i64>*, !dbg !865
  store <2 x i64> <i64 115, i64 116>, <2 x i64>* %50, align 8, !dbg !865, !tbaa !41
  %arrayidx156 = getelementptr inbounds i8, i8* %call135, i64 160, !dbg !866
  %51 = bitcast i8* %arrayidx156 to <2 x i64>*, !dbg !867
  store <2 x i64> <i64 32, i64 99>, <2 x i64>* %51, align 8, !dbg !867, !tbaa !41
  %arrayidx158 = getelementptr inbounds i8, i8* %call135, i64 176, !dbg !868
  %52 = bitcast i8* %arrayidx158 to <2 x i64>*, !dbg !869
  store <2 x i64> <i64 97, i64 115>, <2 x i64>* %52, align 8, !dbg !869, !tbaa !41
  %arrayidx160 = getelementptr inbounds i8, i8* %call135, i64 192, !dbg !870
  %53 = bitcast i8* %arrayidx160 to i64*, !dbg !870
  store i64 101, i64* %53, align 8, !dbg !871, !tbaa !41
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !690, metadata !25), !dbg !752
  tail call void @println_s(i64* %40, i64 25) #9, !dbg !872
  %phitmp = bitcast i64* %call125 to i8*, !dbg !872
  %phitmp338 = bitcast i64* %call55 to i8*, !dbg !872
  %phitmp339 = bitcast i64* %call39 to i8*, !dbg !872
  tail call void @llvm.dbg.value(metadata %struct.Matrix* undef, i64 0, metadata !84, metadata !25) #9, !dbg !873
  %54 = bitcast %struct.Matrix* %call17 to i8**, !dbg !878
  %55 = load i8*, i8** %54, align 8, !dbg !878, !tbaa !38
  tail call void @free(i8* %55) #9, !dbg !879
  %56 = bitcast %struct.Matrix* %call17 to i8*, !dbg !880
  tail call void @free(i8* %56) #9, !dbg !881
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !610, metadata !25), !dbg !694
  tail call void @llvm.dbg.value(metadata %struct.Matrix* undef, i64 0, metadata !84, metadata !25) #9, !dbg !882
  %57 = bitcast %struct.Matrix* %call24 to i8**, !dbg !887
  %58 = load i8*, i8** %57, align 8, !dbg !887, !tbaa !38
  tail call void @free(i8* %58) #9, !dbg !888
  %59 = bitcast %struct.Matrix* %call24 to i8*, !dbg !889
  tail call void @free(i8* %59) #9, !dbg !890
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !612, metadata !25), !dbg !695
  tail call void @llvm.dbg.value(metadata %struct.Matrix* undef, i64 0, metadata !84, metadata !25) #9, !dbg !891
  %60 = bitcast %struct.Matrix* %call31 to i8**, !dbg !896
  %61 = load i8*, i8** %60, align 8, !dbg !896, !tbaa !38
  tail call void @free(i8* %61) #9, !dbg !897
  %62 = bitcast %struct.Matrix* %call31 to i8*, !dbg !898
  tail call void @free(i8* %62) #9, !dbg !899
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !614, metadata !25), !dbg !696
  tail call void @free2DArray(i64** %call, i64 %conv) #9, !dbg !900
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !620, metadata !25), !dbg !698
  tail call void @free(i8* %call5) #9, !dbg !904
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !628, metadata !25), !dbg !703
  tail call void @free(i8* %phitmp339) #9, !dbg !908
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !638, metadata !25), !dbg !708
  tail call void @free(i8* %phitmp338) #9, !dbg !912
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !650, metadata !25), !dbg !719
  br i1 %_39_has_ownership.0, label %if.then198, label %if.then195, !dbg !916

if.then195:                                       ; preds = %if.end193
  %63 = bitcast i64* %_39.0 to i8*, !dbg !917
  tail call void @free(i8* %63) #9, !dbg !917
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !663, metadata !25), !dbg !731
  br label %if.then198, !dbg !917

if.end196:                                        ; preds = %entry
  tail call void @free2DArray(i64** %call, i64 %conv) #9, !dbg !900
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !620, metadata !25), !dbg !698
  br label %if.end205, !dbg !921

if.then198:                                       ; preds = %if.end193, %if.then195
  tail call void @free(i8* %call91) #9, !dbg !922
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !675, metadata !25), !dbg !741
  tail call void @free(i8* %phitmp) #9, !dbg !926
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !679, metadata !25), !dbg !743
  tail call void @free(i8* %call135) #9, !dbg !930
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !690, metadata !25), !dbg !752
  br label %if.end205, !dbg !930

if.end205:                                        ; preds = %if.end196, %if.then198
  tail call void @exit(i32 0) #11, !dbg !934
  unreachable, !dbg !934
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64* @parseStringToInt(i64*) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #6

declare void @free2DArray(i64**, i64) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #7

declare i32 @putchar(i32)

define internal void @init_polly_subfn(i8* nocapture readonly %polly.par.userContext) #8 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg.width = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64*
  %polly.subfunc.arg.height = load i64, i64* %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.call = load i64*, i64** %4, align 8
  %5 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %polly.par.exit, label %polly.par.loadIVBounds.lr.ph

polly.par.loadIVBounds.lr.ph:                     ; preds = %polly.par.setup
  %7 = and i64 %polly.subfunc.arg.width, 3
  %8 = add nsw i64 %polly.subfunc.arg.width, -1
  %polly.fdiv_q.shr = ashr i64 %8, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %pexp.p_div_q = lshr i64 %polly.subfunc.arg.width, 2
  %9 = add nsw i64 %pexp.p_div_q, -1
  %polly.loop_guard37 = icmp eq i64 %7, 0
  %10 = and i64 %polly.subfunc.arg.width, -4
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit4
  %11 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.lr.ph, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit4, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit4 ]
  br i1 %polly.loop_guard, label %polly.loop_header2.preheader, label %polly.loop_exit4

polly.loop_header2.preheader:                     ; preds = %polly.loop_header
  %13 = shl nsw i64 %polly.indvar, 5
  %14 = sub nsw i64 %polly.subfunc.arg.height, %13
  %15 = add nsw i64 %14, -1
  %16 = icmp sgt i64 %15, 31
  %17 = select i1 %16, i64 31, i64 %15
  %polly.loop_guard13 = icmp sgt i64 %17, -1
  %polly.adjust_ub16 = add i64 %17, -1
  br label %polly.loop_header2

polly.loop_exit4.loopexit:                        ; preds = %polly.loop_exit12
  br label %polly.loop_exit4

polly.loop_exit4:                                 ; preds = %polly.loop_exit4.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header2:                               ; preds = %polly.loop_header2.preheader, %polly.loop_exit12
  %polly.indvar5 = phi i64 [ %polly.indvar_next6, %polly.loop_exit12 ], [ 0, %polly.loop_header2.preheader ]
  br i1 %polly.loop_guard13, label %polly.loop_header10.preheader, label %polly.loop_exit12

polly.loop_header10.preheader:                    ; preds = %polly.loop_header2
  %18 = mul nsw i64 %polly.indvar5, -8
  %19 = add nsw i64 %9, %18
  %20 = icmp sgt i64 %19, 7
  %21 = select i1 %20, i64 7, i64 %19
  %polly.loop_guard22 = icmp sgt i64 %21, -1
  %22 = shl i64 %polly.indvar5, 5
  %23 = or i64 %22, 31
  %24 = icmp slt i64 %23, %polly.subfunc.arg.width
  %or.cond = or i1 %polly.loop_guard37, %24
  %polly.adjust_ub25 = add i64 %21, -1
  br i1 %polly.loop_guard22, label %polly.loop_header10.us.preheader, label %polly.loop_header10.preheader.split

polly.loop_header10.us.preheader:                 ; preds = %polly.loop_header10.preheader
  br label %polly.loop_header10.us

polly.loop_header10.us:                           ; preds = %polly.loop_header10.us.preheader, %polly.merge.us
  %polly.indvar14.us = phi i64 [ %polly.indvar_next15.us, %polly.merge.us ], [ 0, %polly.loop_header10.us.preheader ]
  %25 = add nsw i64 %polly.indvar14.us, %13
  %26 = mul i64 %25, %polly.subfunc.arg.width
  %27 = add i64 %26, %22
  %28 = insertelement <2 x i64> undef, i64 %25, i32 0, !dbg !935
  %29 = insertelement <2 x i64> %28, i64 %25, i32 1, !dbg !935
  %30 = insertelement <2 x i64> undef, i64 %25, i32 0, !dbg !935
  %31 = insertelement <2 x i64> %30, i64 %25, i32 1, !dbg !935
  br label %polly.loop_header19.us

polly.loop_header19.us:                           ; preds = %polly.loop_header10.us, %polly.loop_header19.us
  %polly.indvar23.us = phi i64 [ %polly.indvar_next24.us, %polly.loop_header19.us ], [ 0, %polly.loop_header10.us ]
  %32 = shl i64 %polly.indvar23.us, 2
  %33 = add i64 %27, %32
  %scevgep.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %33
  %34 = bitcast i64* %scevgep.us to <2 x i64>*
  %35 = load <2 x i64>, <2 x i64>* %34, align 8, !alias.scope !937, !noalias !2
  %36 = add nsw <2 x i64> %35, %29, !dbg !935
  %37 = bitcast i64* %scevgep.us to <2 x i64>*
  store <2 x i64> %36, <2 x i64>* %37, align 8, !alias.scope !937, !noalias !2
  %38 = add i64 %33, 2
  %scevgep.us.2 = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %38
  %39 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  %40 = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !937, !noalias !2
  %41 = add nsw <2 x i64> %40, %31, !dbg !935
  %42 = bitcast i64* %scevgep.us.2 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %42, align 8, !alias.scope !937, !noalias !2
  %polly.indvar_next24.us = add nuw nsw i64 %polly.indvar23.us, 1
  %polly.loop_cond26.us = icmp sgt i64 %polly.indvar23.us, %polly.adjust_ub25
  br i1 %polly.loop_cond26.us, label %polly.cond.loopexit.us, label %polly.loop_header19.us

polly.loop_header34.us:                           ; preds = %polly.loop_header34.preheader.us, %polly.loop_header34.us
  %polly.indvar38.us = phi i64 [ %polly.indvar_next39.us, %polly.loop_header34.us ], [ 0, %polly.loop_header34.preheader.us ]
  %43 = add i64 %44, %polly.indvar38.us
  %scevgep44.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %43
  %_p_scalar_45.us = load i64, i64* %scevgep44.us, align 8, !alias.scope !937, !noalias !2, !llvm.mem.parallel_loop_access !939
  %p_add1546.us = add nsw i64 %_p_scalar_45.us, %25, !dbg !935
  store i64 %p_add1546.us, i64* %scevgep44.us, align 8, !alias.scope !937, !noalias !2, !llvm.mem.parallel_loop_access !939
  %polly.indvar_next39.us = add nuw nsw i64 %polly.indvar38.us, 1
  %exitcond48.us = icmp eq i64 %polly.indvar_next39.us, %7
  br i1 %exitcond48.us, label %polly.merge.us.loopexit, label %polly.loop_header34.us, !llvm.loop !940

polly.merge.us.loopexit:                          ; preds = %polly.loop_header34.us
  br label %polly.merge.us

polly.merge.us:                                   ; preds = %polly.merge.us.loopexit, %polly.cond.loopexit.us
  %polly.indvar_next15.us = add nuw nsw i64 %polly.indvar14.us, 1
  %polly.loop_cond17.us = icmp sgt i64 %polly.indvar14.us, %polly.adjust_ub16
  br i1 %polly.loop_cond17.us, label %polly.loop_exit12.loopexit, label %polly.loop_header10.us

polly.loop_header34.preheader.us:                 ; preds = %polly.cond.loopexit.us
  %44 = add i64 %26, %10
  br label %polly.loop_header34.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header19.us
  br i1 %or.cond, label %polly.merge.us, label %polly.loop_header34.preheader.us

polly.loop_header10.preheader.split:              ; preds = %polly.loop_header10.preheader
  br i1 %or.cond, label %polly.loop_exit12, label %polly.loop_header10.preheader119

polly.loop_header10.preheader119:                 ; preds = %polly.loop_header10.preheader.split
  br label %polly.loop_header10

polly.loop_exit12.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit12

polly.loop_exit12.loopexit120:                    ; preds = %polly.merge
  br label %polly.loop_exit12

polly.loop_exit12:                                ; preds = %polly.loop_exit12.loopexit120, %polly.loop_exit12.loopexit, %polly.loop_header10.preheader.split, %polly.loop_header2
  %polly.indvar_next6 = add nuw nsw i64 %polly.indvar5, 1
  %exitcond49 = icmp eq i64 %polly.indvar5, %polly.fdiv_q.shr
  br i1 %exitcond49, label %polly.loop_exit4.loopexit, label %polly.loop_header2

polly.loop_header10:                              ; preds = %polly.loop_header10.preheader119, %polly.merge
  %polly.indvar14 = phi i64 [ %polly.indvar_next15, %polly.merge ], [ 0, %polly.loop_header10.preheader119 ]
  %45 = add nsw i64 %polly.indvar14, %13
  %46 = mul i64 %45, %polly.subfunc.arg.width
  %47 = add i64 %46, %10
  br label %polly.loop_header34

polly.merge:                                      ; preds = %polly.loop_header34
  %polly.indvar_next15 = add nuw nsw i64 %polly.indvar14, 1
  %polly.loop_cond17 = icmp sgt i64 %polly.indvar14, %polly.adjust_ub16
  br i1 %polly.loop_cond17, label %polly.loop_exit12.loopexit120, label %polly.loop_header10

polly.loop_header34:                              ; preds = %polly.loop_header10, %polly.loop_header34
  %polly.indvar38 = phi i64 [ %polly.indvar_next39, %polly.loop_header34 ], [ 0, %polly.loop_header10 ]
  %48 = add i64 %47, %polly.indvar38
  %scevgep44 = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %48
  %_p_scalar_45 = load i64, i64* %scevgep44, align 8, !alias.scope !937, !noalias !2, !llvm.mem.parallel_loop_access !939
  %p_add1546 = add nsw i64 %_p_scalar_45, %45, !dbg !935
  store i64 %p_add1546, i64* %scevgep44, align 8, !alias.scope !937, !noalias !2, !llvm.mem.parallel_loop_access !939
  %polly.indvar_next39 = add nuw nsw i64 %polly.indvar38, 1
  %exitcond48 = icmp eq i64 %polly.indvar_next39, %7
  br i1 %exitcond48, label %polly.merge, label %polly.loop_header34, !llvm.loop !944
}

declare i8 @GOMP_loop_runtime_next(i64*, i64*)

declare void @GOMP_loop_end_nowait()

declare void @GOMP_parallel_loop_runtime_start(void (i8*)*, i8*, i32, i64, i64, i64)

declare void @GOMP_parallel_end()

define internal void @mat_mult_polly_subfn(i8* nocapture readonly %polly.par.userContext) #8 {
polly.par.setup:
  %polly.par.LBPtr = alloca i64, align 8
  %polly.par.UBPtr = alloca i64, align 8
  %0 = bitcast i8* %polly.par.userContext to i64*
  %polly.subfunc.arg. = load i64, i64* %0, align 8
  %1 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 8
  %2 = bitcast i8* %1 to i64*
  %polly.subfunc.arg.2 = load i64, i64* %2, align 8
  %3 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 16
  %4 = bitcast i8* %3 to i64**
  %polly.subfunc.arg.call = load i64*, i64** %4, align 8
  %5 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 24
  %6 = bitcast i8* %5 to i64**
  %polly.subfunc.arg.call14 = load i64*, i64** %6, align 8
  %7 = getelementptr inbounds i8, i8* %polly.par.userContext, i64 32
  %8 = bitcast i8* %7 to i64**
  %polly.subfunc.arg.call24 = load i64*, i64** %8, align 8
  %9 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %polly.par.exit, label %polly.par.loadIVBounds.lr.ph

polly.par.loadIVBounds.lr.ph:                     ; preds = %polly.par.setup
  %11 = and i64 %polly.subfunc.arg., 3
  %12 = add i64 %polly.subfunc.arg., -1
  %13 = lshr i64 %12, 5
  %polly.fdiv_q.shr = ashr i64 %12, 5
  %polly.loop_guard = icmp sgt i64 %polly.fdiv_q.shr, -1
  %pexp.p_div_q35 = lshr i64 %polly.subfunc.arg., 2
  %14 = add nsw i64 %pexp.p_div_q35, -1
  %polly.loop_guard59 = icmp eq i64 %11, 0
  %15 = and i64 %polly.subfunc.arg., -4
  %xtraiter188 = and i64 %polly.subfunc.arg., 1
  %lcmp.mod189 = icmp eq i64 %11, %xtraiter188
  %unroll_iter190 = sub nsw i64 %11, %xtraiter188
  %16 = icmp eq i64 %xtraiter188, 0
  %xtraiter = and i64 %polly.subfunc.arg., 1
  %lcmp.mod = icmp eq i64 %11, %xtraiter
  %unroll_iter = sub nsw i64 %11, %xtraiter
  %17 = icmp eq i64 %xtraiter, 0
  br label %polly.par.loadIVBounds

polly.par.exit.loopexit:                          ; preds = %polly.par.checkNext.loopexit
  br label %polly.par.exit

polly.par.exit:                                   ; preds = %polly.par.exit.loopexit, %polly.par.setup
  call void @GOMP_loop_end_nowait()
  ret void

polly.par.checkNext.loopexit:                     ; preds = %polly.loop_exit5
  %18 = call i8 @GOMP_loop_runtime_next(i64* nonnull %polly.par.LBPtr, i64* nonnull %polly.par.UBPtr)
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %polly.par.exit.loopexit, label %polly.par.loadIVBounds

polly.par.loadIVBounds:                           ; preds = %polly.par.loadIVBounds.lr.ph, %polly.par.checkNext.loopexit
  %polly.par.UB = load i64, i64* %polly.par.UBPtr, align 8
  %polly.par.LB = load i64, i64* %polly.par.LBPtr, align 8
  %polly.adjust_ub = add i64 %polly.par.UB, -2
  br label %polly.loop_header

polly.loop_header:                                ; preds = %polly.loop_exit5, %polly.par.loadIVBounds
  %polly.indvar = phi i64 [ %polly.par.LB, %polly.par.loadIVBounds ], [ %polly.indvar_next, %polly.loop_exit5 ]
  br i1 %polly.loop_guard, label %polly.loop_header3.preheader, label %polly.loop_exit5

polly.loop_header3.preheader:                     ; preds = %polly.loop_header
  %20 = shl i64 %polly.indvar, 5
  %21 = sub nsw i64 %polly.subfunc.arg.2, %20
  %22 = add nsw i64 %21, -1
  %23 = icmp sgt i64 %22, 31
  %24 = select i1 %23, i64 31, i64 %22
  %polly.loop_guard21 = icmp sgt i64 %24, -1
  %polly.adjust_ub24 = add i64 %24, -1
  br label %polly.loop_header3

polly.loop_exit5.loopexit:                        ; preds = %polly.loop_exit12
  br label %polly.loop_exit5

polly.loop_exit5:                                 ; preds = %polly.loop_exit5.loopexit, %polly.loop_header
  %polly.indvar_next = add nsw i64 %polly.indvar, 1
  %polly.loop_cond = icmp sgt i64 %polly.indvar, %polly.adjust_ub
  br i1 %polly.loop_cond, label %polly.par.checkNext.loopexit, label %polly.loop_header

polly.loop_header3:                               ; preds = %polly.loop_header3.preheader, %polly.loop_exit12
  %polly.indvar6 = phi i64 [ %polly.indvar_next7, %polly.loop_exit12 ], [ 0, %polly.loop_header3.preheader ]
  %25 = shl nsw i64 %polly.indvar6, 5
  %26 = sub nsw i64 %polly.subfunc.arg., %25
  %27 = add nsw i64 %26, -1
  %28 = icmp sgt i64 %27, 31
  %29 = select i1 %28, i64 31, i64 %27
  %polly.loop_guard30 = icmp sgt i64 %29, -1
  %polly.adjust_ub33 = add i64 %29, -1
  br label %polly.loop_header10

polly.loop_exit12:                                ; preds = %polly.loop_exit20
  %polly.indvar_next7 = add nuw nsw i64 %polly.indvar6, 1
  %exitcond77 = icmp eq i64 %polly.indvar6, %polly.fdiv_q.shr
  br i1 %exitcond77, label %polly.loop_exit5.loopexit, label %polly.loop_header3

polly.loop_header10:                              ; preds = %polly.loop_exit20, %polly.loop_header3
  %polly.indvar13 = phi i64 [ 0, %polly.loop_header3 ], [ %polly.indvar_next14, %polly.loop_exit20 ]
  br i1 %polly.loop_guard21, label %polly.loop_header18.preheader, label %polly.loop_exit20

polly.loop_header18.preheader:                    ; preds = %polly.loop_header10
  %30 = mul nsw i64 %polly.indvar13, -8
  %31 = add nsw i64 %14, %30
  %32 = icmp sgt i64 %31, 7
  %33 = select i1 %32, i64 7, i64 %31
  %polly.loop_guard40 = icmp sgt i64 %33, -1
  %34 = shl i64 %polly.indvar13, 5
  %35 = or i64 %34, 31
  %36 = icmp slt i64 %35, %polly.subfunc.arg.
  %or.cond = or i1 %polly.loop_guard59, %36
  %polly.adjust_ub43 = add i64 %33, -1
  br label %polly.loop_header18

polly.loop_exit20.loopexit:                       ; preds = %polly.loop_exit29
  br label %polly.loop_exit20

polly.loop_exit20:                                ; preds = %polly.loop_exit20.loopexit, %polly.loop_header10
  %polly.indvar_next14 = add nuw nsw i64 %polly.indvar13, 1
  %exitcond76 = icmp eq i64 %polly.indvar13, %13
  br i1 %exitcond76, label %polly.loop_exit12, label %polly.loop_header10

polly.loop_header18:                              ; preds = %polly.loop_header18.preheader, %polly.loop_exit29
  %polly.indvar22 = phi i64 [ %polly.indvar_next23, %polly.loop_exit29 ], [ 0, %polly.loop_header18.preheader ]
  br i1 %polly.loop_guard30, label %polly.loop_header27.preheader, label %polly.loop_exit29

polly.loop_header27.preheader:                    ; preds = %polly.loop_header18
  %37 = add nsw i64 %polly.indvar22, %20
  %38 = mul i64 %37, %polly.subfunc.arg.
  br i1 %polly.loop_guard40, label %polly.loop_header27.us.preheader, label %polly.loop_header27.preheader.split

polly.loop_header27.us.preheader:                 ; preds = %polly.loop_header27.preheader
  br label %polly.loop_header27.us

polly.loop_header27.us:                           ; preds = %polly.loop_header27.us.preheader, %polly.merge.us
  %polly.indvar31.us = phi i64 [ %polly.indvar_next32.us, %polly.merge.us ], [ 0, %polly.loop_header27.us.preheader ]
  %39 = add nuw nsw i64 %polly.indvar31.us, %25
  %40 = add i64 %39, %38
  %scevgep.us = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %40
  %scevgep.promoted79.us = load i64, i64* %scevgep.us, align 8, !alias.scope !945, !noalias !947
  br label %polly.loop_header37.us

polly.loop_header37.us:                           ; preds = %polly.loop_header27.us, %polly.loop_header37.us
  %p_add51.lcssa80.us = phi i64 [ %p_add51.us.3, %polly.loop_header37.us ], [ %scevgep.promoted79.us, %polly.loop_header27.us ]
  %polly.indvar41.us = phi i64 [ %polly.indvar_next42.us, %polly.loop_header37.us ], [ 0, %polly.loop_header27.us ]
  %41 = shl i64 %polly.indvar41.us, 2
  %42 = add nuw nsw i64 %41, %34
  %43 = add i64 %42, %38
  %scevgep51.us = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %43
  %_p_scalar_52.us = load i64, i64* %scevgep51.us, align 8, !alias.scope !949, !noalias !950, !llvm.mem.parallel_loop_access !951
  %44 = mul i64 %42, %polly.subfunc.arg.
  %45 = add i64 %44, %39
  %scevgep53.us = getelementptr i64, i64* %polly.subfunc.arg.call24, i64 %45
  %_p_scalar_54.us = load i64, i64* %scevgep53.us, align 8, !alias.scope !948, !noalias !952, !llvm.mem.parallel_loop_access !951
  %p_mul50.us = mul nsw i64 %_p_scalar_54.us, %_p_scalar_52.us, !dbg !544
  %p_add51.us = add nsw i64 %p_mul50.us, %p_add51.lcssa80.us, !dbg !545
  %46 = or i64 %42, 1
  %47 = add i64 %46, %38
  %scevgep51.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %47
  %_p_scalar_52.us.1 = load i64, i64* %scevgep51.us.1, align 8, !alias.scope !949, !noalias !950, !llvm.mem.parallel_loop_access !951
  %48 = mul i64 %46, %polly.subfunc.arg.
  %49 = add i64 %48, %39
  %scevgep53.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call24, i64 %49
  %_p_scalar_54.us.1 = load i64, i64* %scevgep53.us.1, align 8, !alias.scope !948, !noalias !952, !llvm.mem.parallel_loop_access !951
  %p_mul50.us.1 = mul nsw i64 %_p_scalar_54.us.1, %_p_scalar_52.us.1, !dbg !544
  %p_add51.us.1 = add nsw i64 %p_mul50.us.1, %p_add51.us, !dbg !545
  %50 = or i64 %42, 2
  %51 = add i64 %50, %38
  %scevgep51.us.2 = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %51
  %_p_scalar_52.us.2 = load i64, i64* %scevgep51.us.2, align 8, !alias.scope !949, !noalias !950, !llvm.mem.parallel_loop_access !951
  %52 = mul i64 %50, %polly.subfunc.arg.
  %53 = add i64 %52, %39
  %scevgep53.us.2 = getelementptr i64, i64* %polly.subfunc.arg.call24, i64 %53
  %_p_scalar_54.us.2 = load i64, i64* %scevgep53.us.2, align 8, !alias.scope !948, !noalias !952, !llvm.mem.parallel_loop_access !951
  %p_mul50.us.2 = mul nsw i64 %_p_scalar_54.us.2, %_p_scalar_52.us.2, !dbg !544
  %p_add51.us.2 = add nsw i64 %p_mul50.us.2, %p_add51.us.1, !dbg !545
  %54 = or i64 %42, 3
  %55 = add i64 %54, %38
  %scevgep51.us.3 = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %55
  %_p_scalar_52.us.3 = load i64, i64* %scevgep51.us.3, align 8, !alias.scope !949, !noalias !950, !llvm.mem.parallel_loop_access !951
  %56 = mul i64 %54, %polly.subfunc.arg.
  %57 = add i64 %56, %39
  %scevgep53.us.3 = getelementptr i64, i64* %polly.subfunc.arg.call24, i64 %57
  %_p_scalar_54.us.3 = load i64, i64* %scevgep53.us.3, align 8, !alias.scope !948, !noalias !952, !llvm.mem.parallel_loop_access !951
  %p_mul50.us.3 = mul nsw i64 %_p_scalar_54.us.3, %_p_scalar_52.us.3, !dbg !544
  %p_add51.us.3 = add nsw i64 %p_mul50.us.3, %p_add51.us.2, !dbg !545
  %polly.indvar_next42.us = add nuw nsw i64 %polly.indvar41.us, 1
  %polly.loop_cond44.us = icmp sgt i64 %polly.indvar41.us, %polly.adjust_ub43
  br i1 %polly.loop_cond44.us, label %polly.cond.loopexit.us, label %polly.loop_header37.us

polly.loop_header56.us:                           ; preds = %polly.loop_header56.us, %polly.loop_header56.us.preheader.new
  %p_add517381.us = phi i64 [ %p_add51.us.3.lcssa, %polly.loop_header56.us.preheader.new ], [ %p_add5173.us.1, %polly.loop_header56.us ]
  %polly.indvar60.us = phi i64 [ 0, %polly.loop_header56.us.preheader.new ], [ %polly.indvar_next61.us.1, %polly.loop_header56.us ]
  %niter191 = phi i64 [ %unroll_iter190, %polly.loop_header56.us.preheader.new ], [ %niter191.nsub.1, %polly.loop_header56.us ]
  %58 = add nuw nsw i64 %polly.indvar60.us, %15
  %59 = add i64 %58, %38
  %scevgep68.us = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %59
  %_p_scalar_69.us = load i64, i64* %scevgep68.us, align 8, !alias.scope !949, !noalias !950, !llvm.mem.parallel_loop_access !953
  %60 = mul i64 %58, %polly.subfunc.arg.
  %61 = add i64 %60, %39
  %scevgep70.us = getelementptr i64, i64* %polly.subfunc.arg.call24, i64 %61
  %_p_scalar_71.us = load i64, i64* %scevgep70.us, align 8, !alias.scope !948, !noalias !952, !llvm.mem.parallel_loop_access !953
  %p_mul5072.us = mul nsw i64 %_p_scalar_71.us, %_p_scalar_69.us, !dbg !544
  %p_add5173.us = add nsw i64 %p_mul5072.us, %p_add517381.us, !dbg !545
  %polly.indvar_next61.us = or i64 %polly.indvar60.us, 1
  %62 = add nuw nsw i64 %polly.indvar_next61.us, %15
  %63 = add i64 %62, %38
  %scevgep68.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %63
  %_p_scalar_69.us.1 = load i64, i64* %scevgep68.us.1, align 8, !alias.scope !949, !noalias !950, !llvm.mem.parallel_loop_access !953
  %64 = mul i64 %62, %polly.subfunc.arg.
  %65 = add i64 %64, %39
  %scevgep70.us.1 = getelementptr i64, i64* %polly.subfunc.arg.call24, i64 %65
  %_p_scalar_71.us.1 = load i64, i64* %scevgep70.us.1, align 8, !alias.scope !948, !noalias !952, !llvm.mem.parallel_loop_access !953
  %p_mul5072.us.1 = mul nsw i64 %_p_scalar_71.us.1, %_p_scalar_69.us.1, !dbg !544
  %p_add5173.us.1 = add nsw i64 %p_mul5072.us.1, %p_add5173.us, !dbg !545
  %polly.indvar_next61.us.1 = add nsw i64 %polly.indvar60.us, 2
  %niter191.nsub.1 = add i64 %niter191, -2
  %niter191.ncmp.1 = icmp eq i64 %niter191.nsub.1, 0
  br i1 %niter191.ncmp.1, label %polly.merge.loopexit.us.unr-lcssa.loopexit, label %polly.loop_header56.us, !llvm.loop !954

polly.merge.us:                                   ; preds = %polly.merge.loopexit.us, %polly.cond.loopexit.us
  %polly.indvar_next32.us = add nuw nsw i64 %polly.indvar31.us, 1
  %polly.loop_cond34.us = icmp sgt i64 %polly.indvar31.us, %polly.adjust_ub33
  br i1 %polly.loop_cond34.us, label %polly.loop_exit29.loopexit, label %polly.loop_header27.us

polly.merge.loopexit.us.unr-lcssa.loopexit:       ; preds = %polly.loop_header56.us
  %polly.indvar_next61.us.1.lcssa = phi i64 [ %polly.indvar_next61.us.1, %polly.loop_header56.us ]
  %p_add5173.us.1.lcssa = phi i64 [ %p_add5173.us.1, %polly.loop_header56.us ]
  br label %polly.merge.loopexit.us.unr-lcssa

polly.merge.loopexit.us.unr-lcssa:                ; preds = %polly.loop_header56.us.preheader, %polly.merge.loopexit.us.unr-lcssa.loopexit
  %p_add5173.us.lcssa.ph = phi i64 [ undef, %polly.loop_header56.us.preheader ], [ %p_add5173.us.1.lcssa, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  %p_add517381.us.unr = phi i64 [ %p_add51.us.3.lcssa, %polly.loop_header56.us.preheader ], [ %p_add5173.us.1.lcssa, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  %polly.indvar60.us.unr = phi i64 [ 0, %polly.loop_header56.us.preheader ], [ %polly.indvar_next61.us.1.lcssa, %polly.merge.loopexit.us.unr-lcssa.loopexit ]
  br i1 %16, label %polly.merge.loopexit.us, label %polly.loop_header56.us.epil.preheader

polly.loop_header56.us.epil.preheader:            ; preds = %polly.merge.loopexit.us.unr-lcssa
  br label %polly.loop_header56.us.epil

polly.loop_header56.us.epil:                      ; preds = %polly.loop_header56.us.epil.preheader
  %66 = add nuw nsw i64 %polly.indvar60.us.unr, %15
  br label %polly.merge.loopexit.us.epilog-lcssa

polly.merge.loopexit.us.epilog-lcssa:             ; preds = %polly.loop_header56.us.epil
  %67 = mul i64 %66, %polly.subfunc.arg.
  %68 = add i64 %67, %39
  %scevgep70.us.epil = getelementptr i64, i64* %polly.subfunc.arg.call24, i64 %68
  %_p_scalar_71.us.epil = load i64, i64* %scevgep70.us.epil, align 8, !alias.scope !948, !noalias !952, !llvm.mem.parallel_loop_access !953
  %69 = add i64 %66, %38
  %scevgep68.us.epil = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %69
  %_p_scalar_69.us.epil = load i64, i64* %scevgep68.us.epil, align 8, !alias.scope !949, !noalias !950, !llvm.mem.parallel_loop_access !953
  %p_mul5072.us.epil = mul nsw i64 %_p_scalar_71.us.epil, %_p_scalar_69.us.epil, !dbg !544
  %p_add5173.us.epil = add nsw i64 %p_mul5072.us.epil, %p_add517381.us.unr, !dbg !545
  br label %polly.merge.loopexit.us

polly.merge.loopexit.us:                          ; preds = %polly.merge.loopexit.us.unr-lcssa, %polly.merge.loopexit.us.epilog-lcssa
  %p_add5173.us.lcssa = phi i64 [ %p_add5173.us.lcssa.ph, %polly.merge.loopexit.us.unr-lcssa ], [ %p_add5173.us.epil, %polly.merge.loopexit.us.epilog-lcssa ]
  store i64 %p_add5173.us.lcssa, i64* %scevgep.us, align 8, !alias.scope !945, !noalias !947
  br label %polly.merge.us

polly.cond.loopexit.us:                           ; preds = %polly.loop_header37.us
  %p_add51.us.3.lcssa = phi i64 [ %p_add51.us.3, %polly.loop_header37.us ]
  store i64 %p_add51.us.3.lcssa, i64* %scevgep.us, align 8, !alias.scope !945, !noalias !947
  br i1 %or.cond, label %polly.merge.us, label %polly.loop_header56.us.preheader

polly.loop_header56.us.preheader:                 ; preds = %polly.cond.loopexit.us
  br i1 %lcmp.mod189, label %polly.merge.loopexit.us.unr-lcssa, label %polly.loop_header56.us.preheader.new

polly.loop_header56.us.preheader.new:             ; preds = %polly.loop_header56.us.preheader
  br label %polly.loop_header56.us

polly.loop_header27.preheader.split:              ; preds = %polly.loop_header27.preheader
  br i1 %or.cond, label %polly.loop_exit29, label %polly.loop_header27.preheader186

polly.loop_header27.preheader186:                 ; preds = %polly.loop_header27.preheader.split
  br label %polly.loop_header27

polly.loop_exit29.loopexit:                       ; preds = %polly.merge.us
  br label %polly.loop_exit29

polly.loop_exit29.loopexit187:                    ; preds = %polly.merge.loopexit
  br label %polly.loop_exit29

polly.loop_exit29:                                ; preds = %polly.loop_exit29.loopexit187, %polly.loop_exit29.loopexit, %polly.loop_header27.preheader.split, %polly.loop_header18
  %polly.indvar_next23 = add nuw nsw i64 %polly.indvar22, 1
  %polly.loop_cond25 = icmp sgt i64 %polly.indvar22, %polly.adjust_ub24
  br i1 %polly.loop_cond25, label %polly.loop_exit20.loopexit, label %polly.loop_header18

polly.loop_header27:                              ; preds = %polly.loop_header27.preheader186, %polly.merge.loopexit
  %polly.indvar31 = phi i64 [ %polly.indvar_next32, %polly.merge.loopexit ], [ 0, %polly.loop_header27.preheader186 ]
  %70 = add nuw nsw i64 %polly.indvar31, %25
  %71 = add i64 %70, %38
  %scevgep66 = getelementptr i64, i64* %polly.subfunc.arg.call, i64 %71
  %scevgep66.promoted = load i64, i64* %scevgep66, align 8, !alias.scope !945, !noalias !947
  br i1 %lcmp.mod, label %polly.merge.loopexit.unr-lcssa, label %polly.loop_header27.new

polly.loop_header27.new:                          ; preds = %polly.loop_header27
  br label %polly.loop_header56

polly.merge.loopexit.unr-lcssa.loopexit:          ; preds = %polly.loop_header56
  %polly.indvar_next61.1.lcssa = phi i64 [ %polly.indvar_next61.1, %polly.loop_header56 ]
  %p_add5173.1.lcssa = phi i64 [ %p_add5173.1, %polly.loop_header56 ]
  br label %polly.merge.loopexit.unr-lcssa

polly.merge.loopexit.unr-lcssa:                   ; preds = %polly.loop_header27, %polly.merge.loopexit.unr-lcssa.loopexit
  %p_add5173.lcssa.ph = phi i64 [ undef, %polly.loop_header27 ], [ %p_add5173.1.lcssa, %polly.merge.loopexit.unr-lcssa.loopexit ]
  %p_add517381.unr = phi i64 [ %scevgep66.promoted, %polly.loop_header27 ], [ %p_add5173.1.lcssa, %polly.merge.loopexit.unr-lcssa.loopexit ]
  %polly.indvar60.unr = phi i64 [ 0, %polly.loop_header27 ], [ %polly.indvar_next61.1.lcssa, %polly.merge.loopexit.unr-lcssa.loopexit ]
  br i1 %17, label %polly.merge.loopexit, label %polly.loop_header56.epil.preheader

polly.loop_header56.epil.preheader:               ; preds = %polly.merge.loopexit.unr-lcssa
  br label %polly.loop_header56.epil

polly.loop_header56.epil:                         ; preds = %polly.loop_header56.epil.preheader
  %72 = add nuw nsw i64 %polly.indvar60.unr, %15
  br label %polly.merge.loopexit.epilog-lcssa

polly.merge.loopexit.epilog-lcssa:                ; preds = %polly.loop_header56.epil
  %73 = mul i64 %72, %polly.subfunc.arg.
  %74 = add i64 %73, %70
  %scevgep70.epil = getelementptr i64, i64* %polly.subfunc.arg.call24, i64 %74
  %_p_scalar_71.epil = load i64, i64* %scevgep70.epil, align 8, !alias.scope !948, !noalias !952, !llvm.mem.parallel_loop_access !953
  %75 = add i64 %72, %38
  %scevgep68.epil = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %75
  %_p_scalar_69.epil = load i64, i64* %scevgep68.epil, align 8, !alias.scope !949, !noalias !950, !llvm.mem.parallel_loop_access !953
  %p_mul5072.epil = mul nsw i64 %_p_scalar_71.epil, %_p_scalar_69.epil, !dbg !544
  %p_add5173.epil = add nsw i64 %p_mul5072.epil, %p_add517381.unr, !dbg !545
  br label %polly.merge.loopexit

polly.merge.loopexit:                             ; preds = %polly.merge.loopexit.unr-lcssa, %polly.merge.loopexit.epilog-lcssa
  %p_add5173.lcssa = phi i64 [ %p_add5173.lcssa.ph, %polly.merge.loopexit.unr-lcssa ], [ %p_add5173.epil, %polly.merge.loopexit.epilog-lcssa ]
  store i64 %p_add5173.lcssa, i64* %scevgep66, align 8, !alias.scope !945, !noalias !947
  %polly.indvar_next32 = add nuw nsw i64 %polly.indvar31, 1
  %polly.loop_cond34 = icmp sgt i64 %polly.indvar31, %polly.adjust_ub33
  br i1 %polly.loop_cond34, label %polly.loop_exit29.loopexit187, label %polly.loop_header27

polly.loop_header56:                              ; preds = %polly.loop_header56, %polly.loop_header27.new
  %p_add517381 = phi i64 [ %scevgep66.promoted, %polly.loop_header27.new ], [ %p_add5173.1, %polly.loop_header56 ]
  %polly.indvar60 = phi i64 [ 0, %polly.loop_header27.new ], [ %polly.indvar_next61.1, %polly.loop_header56 ]
  %niter = phi i64 [ %unroll_iter, %polly.loop_header27.new ], [ %niter.nsub.1, %polly.loop_header56 ]
  %76 = add nuw nsw i64 %polly.indvar60, %15
  %77 = add i64 %76, %38
  %scevgep68 = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %77
  %_p_scalar_69 = load i64, i64* %scevgep68, align 8, !alias.scope !949, !noalias !950, !llvm.mem.parallel_loop_access !953
  %78 = mul i64 %76, %polly.subfunc.arg.
  %79 = add i64 %78, %70
  %scevgep70 = getelementptr i64, i64* %polly.subfunc.arg.call24, i64 %79
  %_p_scalar_71 = load i64, i64* %scevgep70, align 8, !alias.scope !948, !noalias !952, !llvm.mem.parallel_loop_access !953
  %p_mul5072 = mul nsw i64 %_p_scalar_71, %_p_scalar_69, !dbg !544
  %p_add5173 = add nsw i64 %p_mul5072, %p_add517381, !dbg !545
  %polly.indvar_next61 = or i64 %polly.indvar60, 1
  %80 = add nuw nsw i64 %polly.indvar_next61, %15
  %81 = add i64 %80, %38
  %scevgep68.1 = getelementptr i64, i64* %polly.subfunc.arg.call14, i64 %81
  %_p_scalar_69.1 = load i64, i64* %scevgep68.1, align 8, !alias.scope !949, !noalias !950, !llvm.mem.parallel_loop_access !953
  %82 = mul i64 %80, %polly.subfunc.arg.
  %83 = add i64 %82, %70
  %scevgep70.1 = getelementptr i64, i64* %polly.subfunc.arg.call24, i64 %83
  %_p_scalar_71.1 = load i64, i64* %scevgep70.1, align 8, !alias.scope !948, !noalias !952, !llvm.mem.parallel_loop_access !953
  %p_mul5072.1 = mul nsw i64 %_p_scalar_71.1, %_p_scalar_69.1, !dbg !544
  %p_add5173.1 = add nsw i64 %p_mul5072.1, %p_add5173, !dbg !545
  %polly.indvar_next61.1 = add nsw i64 %polly.indvar60, 2
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %polly.merge.loopexit.unr-lcssa.loopexit, label %polly.loop_header56, !llvm.loop !955
}

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #9

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "polly-optimized" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone }
attributes #8 = { "polly.skip.fn" }
attributes #9 = { nounwind }
attributes #10 = { cold }
attributes #11 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate1")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{i32 2, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git 83402ed45b681e9f38ce6626e5899c19159ceb29) (http://llvm.org/git/llvm.git 4fc8e6fd79f212952e8f538b6d5d9d78098b4505)"}
!8 = distinct !DISubprogram(name: "copy_Matrix", scope: !1, file: !1, line: 2, type: !9, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !22)
!9 = !DISubroutineType(types: !10)
!10 = !{!11, !11}
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, align: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "Matrix", file: !13, line: 7, baseType: !14)
!13 = !DIFile(filename: "./MatrixMult.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate1")
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !13, line: 3, size: 256, align: 64, elements: !15)
!15 = !{!16, !19, !20, !21}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !14, file: !13, line: 4, baseType: !17, size: 64, align: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64, align: 64)
!18 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "data_size", scope: !14, file: !13, line: 4, baseType: !18, size: 64, align: 64, offset: 64)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !14, file: !13, line: 5, baseType: !18, size: 64, align: 64, offset: 128)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !14, file: !13, line: 6, baseType: !18, size: 64, align: 64, offset: 192)
!22 = !{!23, !24}
!23 = !DILocalVariable(name: "_Matrix", arg: 1, scope: !8, file: !1, line: 2, type: !11)
!24 = !DILocalVariable(name: "new_Matrix", scope: !8, file: !1, line: 3, type: !11)
!25 = !DIExpression()
!26 = !DILocation(line: 2, column: 29, scope: !8)
!27 = !DILocation(line: 3, column: 23, scope: !28)
!28 = !DILexicalBlockFile(scope: !8, file: !1, discriminator: 1)
!29 = !DILocation(line: 3, column: 23, scope: !8)
!30 = !DILocation(line: 3, column: 10, scope: !8)
!31 = !DILocation(line: 4, column: 2, scope: !8)
!32 = !{!33, !37, i64 8}
!33 = !{!"", !34, i64 0, !37, i64 8, !37, i64 16, !37, i64 24}
!34 = !{!"any pointer", !35, i64 0}
!35 = !{!"omnipotent char", !36, i64 0}
!36 = !{!"Simple C/C++ TBAA"}
!37 = !{!"long long", !35, i64 0}
!38 = !{!33, !34, i64 0}
!39 = !DILocation(line: 5, column: 31, scope: !8)
!40 = !DILocation(line: 5, column: 14, scope: !8)
!41 = !{!37, !37, i64 0}
!42 = !DILocation(line: 5, column: 20, scope: !8)
!43 = !DILocation(line: 7, column: 2, scope: !8)
!44 = distinct !DISubprogram(name: "copy_array_Matrix", scope: !1, file: !1, line: 9, type: !45, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !48)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !18}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!48 = !{!49, !50, !51, !52}
!49 = !DILocalVariable(name: "_Matrix", arg: 1, scope: !44, file: !1, line: 9, type: !47)
!50 = !DILocalVariable(name: "_Matrix_size", arg: 2, scope: !44, file: !1, line: 9, type: !18)
!51 = !DILocalVariable(name: "new_Matrix", scope: !44, file: !1, line: 10, type: !47)
!52 = !DILocalVariable(name: "i", scope: !53, file: !1, line: 11, type: !54)
!53 = distinct !DILexicalBlock(scope: !44, file: !1, line: 11, column: 2)
!54 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!55 = !DILocation(line: 9, column: 37, scope: !44)
!56 = !DILocation(line: 9, column: 56, scope: !44)
!57 = !DILocation(line: 10, column: 43, scope: !44)
!58 = !DILocation(line: 10, column: 24, scope: !59)
!59 = !DILexicalBlockFile(scope: !44, file: !1, discriminator: 1)
!60 = !DILocation(line: 10, column: 24, scope: !44)
!61 = !DILocation(line: 10, column: 11, scope: !44)
!62 = !DILocation(line: 11, column: 10, scope: !53)
!63 = !DILocation(line: 11, column: 15, scope: !64)
!64 = !DILexicalBlockFile(scope: !65, file: !1, discriminator: 1)
!65 = distinct !DILexicalBlock(scope: !53, file: !1, line: 11, column: 2)
!66 = !DILocation(line: 11, column: 2, scope: !64)
!67 = !DILocation(line: 12, column: 31, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !1, line: 11, column: 33)
!69 = !DILocation(line: 14, column: 2, scope: !44)
!70 = !{!34, !34, i64 0}
!71 = !DILocation(line: 2, column: 29, scope: !8, inlinedAt: !72)
!72 = distinct !DILocation(line: 12, column: 19, scope: !68)
!73 = !DILocation(line: 3, column: 23, scope: !28, inlinedAt: !72)
!74 = !DILocation(line: 4, column: 2, scope: !8, inlinedAt: !72)
!75 = !DILocation(line: 5, column: 31, scope: !8, inlinedAt: !72)
!76 = !DILocation(line: 5, column: 14, scope: !8, inlinedAt: !72)
!77 = !DILocation(line: 5, column: 20, scope: !8, inlinedAt: !72)
!78 = !DILocation(line: 12, column: 3, scope: !68)
!79 = !DILocation(line: 12, column: 17, scope: !68)
!80 = distinct !DISubprogram(name: "free_Matrix", scope: !1, file: !1, line: 16, type: !81, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !83)
!81 = !DISubroutineType(types: !82)
!82 = !{null, !11}
!83 = !{!84}
!84 = !DILocalVariable(name: "matrix", arg: 1, scope: !80, file: !1, line: 16, type: !11)
!85 = !DILocation(line: 16, column: 26, scope: !80)
!86 = !DILocation(line: 17, column: 15, scope: !80)
!87 = !DILocation(line: 17, column: 2, scope: !80)
!88 = !DILocation(line: 18, column: 7, scope: !80)
!89 = !DILocation(line: 18, column: 2, scope: !80)
!90 = !DILocation(line: 19, column: 1, scope: !80)
!91 = distinct !DISubprogram(name: "printf_Matrix", scope: !1, file: !1, line: 20, type: !81, isLocal: false, isDefinition: true, scopeLine: 20, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !92)
!92 = !{!93}
!93 = !DILocalVariable(name: "matrix", arg: 1, scope: !91, file: !1, line: 20, type: !11)
!94 = !DILocation(line: 20, column: 28, scope: !91)
!95 = !DILocation(line: 21, column: 2, scope: !91)
!96 = !DILocation(line: 22, column: 2, scope: !91)
!97 = !DILocation(line: 23, column: 2, scope: !91)
!98 = !DILocation(line: 24, column: 2, scope: !91)
!99 = !DILocation(line: 25, column: 25, scope: !91)
!100 = !{!33, !37, i64 16}
!101 = !DILocation(line: 25, column: 2, scope: !91)
!102 = !DILocation(line: 26, column: 2, scope: !91)
!103 = !DILocation(line: 27, column: 25, scope: !91)
!104 = !{!33, !37, i64 24}
!105 = !DILocation(line: 27, column: 2, scope: !91)
!106 = !DILocation(line: 28, column: 2, scope: !91)
!107 = !DILocation(line: 29, column: 1, scope: !91)
!108 = distinct !DISubprogram(name: "matrix", scope: !1, file: !1, line: 30, type: !109, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !112)
!109 = !DISubroutineType(types: !110)
!110 = !{!11, !18, !18, !17, !18, !111}
!111 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!112 = !{!113, !114, !115, !116, !117, !118, !119, !120, !121}
!113 = !DILocalVariable(name: "width", arg: 1, scope: !108, file: !1, line: 30, type: !18)
!114 = !DILocalVariable(name: "height", arg: 2, scope: !108, file: !1, line: 30, type: !18)
!115 = !DILocalVariable(name: "data", arg: 3, scope: !108, file: !1, line: 30, type: !17)
!116 = !DILocalVariable(name: "data_size", arg: 4, scope: !108, file: !1, line: 30, type: !18)
!117 = !DILocalVariable(name: "data_has_ownership", arg: 5, scope: !108, file: !1, line: 30, type: !111)
!118 = !DILocalVariable(name: "r", scope: !108, file: !1, line: 31, type: !11)
!119 = !DILocalVariable(name: "r_has_ownership", scope: !108, file: !1, line: 32, type: !111)
!120 = !DILocalVariable(name: "_4", scope: !108, file: !1, line: 33, type: !11)
!121 = !DILocalVariable(name: "_4_has_ownership", scope: !108, file: !1, line: 34, type: !111)
!122 = !DILocation(line: 30, column: 26, scope: !108)
!123 = !DILocation(line: 30, column: 43, scope: !108)
!124 = !DILocation(line: 30, column: 51, scope: !108)
!125 = !DIExpression(DW_OP_bit_piece, 0, 1)
!126 = !DILocation(line: 30, column: 78, scope: !108)
!127 = !DILocation(line: 32, column: 2, scope: !108)
!128 = !DILocation(line: 34, column: 2, scope: !108)
!129 = !DILocation(line: 37, column: 7, scope: !108)
!130 = !DILocation(line: 33, column: 10, scope: !108)
!131 = !DILocation(line: 38, column: 2, scope: !108)
!132 = !DILocation(line: 39, column: 6, scope: !108)
!133 = !DILocation(line: 39, column: 13, scope: !108)
!134 = !DILocation(line: 40, column: 6, scope: !108)
!135 = !DILocation(line: 40, column: 12, scope: !108)
!136 = !DILocation(line: 43, column: 2, scope: !108)
!137 = !DILocation(line: 43, column: 2, scope: !138)
!138 = !DILexicalBlockFile(scope: !139, file: !1, discriminator: 1)
!139 = distinct !DILexicalBlock(scope: !140, file: !1, line: 43, column: 2)
!140 = distinct !DILexicalBlock(scope: !108, file: !1, line: 43, column: 2)
!141 = !DILocation(line: 45, column: 2, scope: !108)
!142 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 49, type: !143, isLocal: false, isDefinition: true, scopeLine: 49, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !145)
!143 = !DISubroutineType(types: !144)
!144 = !{!11, !18, !18}
!145 = !{!146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173}
!146 = !DILocalVariable(name: "width", arg: 1, scope: !142, file: !1, line: 49, type: !18)
!147 = !DILocalVariable(name: "height", arg: 2, scope: !142, file: !1, line: 49, type: !18)
!148 = !DILocalVariable(name: "r", scope: !142, file: !1, line: 50, type: !11)
!149 = !DILocalVariable(name: "r_has_ownership", scope: !142, file: !1, line: 51, type: !111)
!150 = !DILocalVariable(name: "data", scope: !142, file: !1, line: 52, type: !17)
!151 = !DILocalVariable(name: "data_size", scope: !142, file: !1, line: 52, type: !18)
!152 = !DILocalVariable(name: "data_has_ownership", scope: !142, file: !1, line: 53, type: !111)
!153 = !DILocalVariable(name: "i", scope: !142, file: !1, line: 54, type: !18)
!154 = !DILocalVariable(name: "j", scope: !142, file: !1, line: 55, type: !18)
!155 = !DILocalVariable(name: "_6", scope: !142, file: !1, line: 56, type: !18)
!156 = !DILocalVariable(name: "_7", scope: !142, file: !1, line: 57, type: !18)
!157 = !DILocalVariable(name: "_8", scope: !142, file: !1, line: 58, type: !17)
!158 = !DILocalVariable(name: "_8_size", scope: !142, file: !1, line: 58, type: !18)
!159 = !DILocalVariable(name: "_8_has_ownership", scope: !142, file: !1, line: 59, type: !111)
!160 = !DILocalVariable(name: "_9", scope: !142, file: !1, line: 60, type: !18)
!161 = !DILocalVariable(name: "_10", scope: !142, file: !1, line: 61, type: !18)
!162 = !DILocalVariable(name: "_11", scope: !142, file: !1, line: 62, type: !18)
!163 = !DILocalVariable(name: "_12", scope: !142, file: !1, line: 63, type: !18)
!164 = !DILocalVariable(name: "_13", scope: !142, file: !1, line: 64, type: !18)
!165 = !DILocalVariable(name: "_14", scope: !142, file: !1, line: 65, type: !18)
!166 = !DILocalVariable(name: "_15", scope: !142, file: !1, line: 66, type: !18)
!167 = !DILocalVariable(name: "_16", scope: !142, file: !1, line: 67, type: !18)
!168 = !DILocalVariable(name: "_17", scope: !142, file: !1, line: 68, type: !18)
!169 = !DILocalVariable(name: "_18", scope: !142, file: !1, line: 69, type: !18)
!170 = !DILocalVariable(name: "_19", scope: !142, file: !1, line: 70, type: !18)
!171 = !DILocalVariable(name: "_20", scope: !142, file: !1, line: 71, type: !18)
!172 = !DILocalVariable(name: "_21", scope: !142, file: !1, line: 72, type: !11)
!173 = !DILocalVariable(name: "_21_has_ownership", scope: !142, file: !1, line: 73, type: !111)
!174 = !DILocation(line: 49, column: 24, scope: !142)
!175 = !DILocation(line: 49, column: 41, scope: !142)
!176 = !DILocation(line: 51, column: 2, scope: !142)
!177 = !DILocation(line: 52, column: 2, scope: !142)
!178 = !DILocation(line: 53, column: 2, scope: !142)
!179 = !DILocation(line: 54, column: 12, scope: !142)
!180 = !DILocation(line: 55, column: 12, scope: !142)
!181 = !DILocation(line: 56, column: 12, scope: !142)
!182 = !DILocation(line: 57, column: 12, scope: !142)
!183 = !DILocation(line: 58, column: 2, scope: !142)
!184 = !DILocation(line: 59, column: 2, scope: !142)
!185 = !DILocation(line: 60, column: 12, scope: !142)
!186 = !DILocation(line: 61, column: 12, scope: !142)
!187 = !DILocation(line: 62, column: 12, scope: !142)
!188 = !DILocation(line: 63, column: 12, scope: !142)
!189 = !DILocation(line: 64, column: 12, scope: !142)
!190 = !DILocation(line: 65, column: 12, scope: !142)
!191 = !DILocation(line: 66, column: 12, scope: !142)
!192 = !DILocation(line: 67, column: 12, scope: !142)
!193 = !DILocation(line: 68, column: 12, scope: !142)
!194 = !DILocation(line: 69, column: 12, scope: !142)
!195 = !DILocation(line: 70, column: 12, scope: !142)
!196 = !DILocation(line: 71, column: 12, scope: !142)
!197 = !DILocation(line: 73, column: 2, scope: !142)
!198 = !DILocation(line: 77, column: 10, scope: !142)
!199 = !DILocation(line: 80, column: 2, scope: !142)
!200 = !DILocation(line: 94, column: 7, scope: !201)
!201 = distinct !DILexicalBlock(scope: !202, file: !1, line: 94, column: 6)
!202 = distinct !DILexicalBlock(scope: !142, file: !1, line: 92, column: 13)
!203 = !DILocation(line: 94, column: 6, scope: !202)
!204 = !DILocation(line: 30, column: 26, scope: !108, inlinedAt: !205)
!205 = distinct !DILocation(line: 141, column: 8, scope: !142)
!206 = !DILocation(line: 30, column: 43, scope: !108, inlinedAt: !205)
!207 = !DILocation(line: 30, column: 51, scope: !108, inlinedAt: !205)
!208 = !DILocation(line: 30, column: 78, scope: !108, inlinedAt: !205)
!209 = !DILocation(line: 32, column: 2, scope: !108, inlinedAt: !205)
!210 = !DILocation(line: 34, column: 2, scope: !108, inlinedAt: !205)
!211 = !DILocation(line: 37, column: 7, scope: !108, inlinedAt: !205)
!212 = !DILocation(line: 33, column: 10, scope: !108, inlinedAt: !205)
!213 = !DILocation(line: 38, column: 2, scope: !108, inlinedAt: !205)
!214 = !DILocation(line: 39, column: 6, scope: !108, inlinedAt: !205)
!215 = !DILocation(line: 39, column: 13, scope: !108, inlinedAt: !205)
!216 = !DILocation(line: 40, column: 6, scope: !108, inlinedAt: !205)
!217 = !DILocation(line: 40, column: 12, scope: !108, inlinedAt: !205)
!218 = !DILocation(line: 72, column: 10, scope: !142)
!219 = !DILocation(line: 145, column: 2, scope: !220)
!220 = !DILexicalBlockFile(scope: !221, file: !1, discriminator: 1)
!221 = distinct !DILexicalBlock(scope: !222, file: !1, line: 145, column: 2)
!222 = distinct !DILexicalBlock(scope: !142, file: !1, line: 145, column: 2)
!223 = !DILocation(line: 147, column: 2, scope: !142)
!224 = !DILocation(line: 141, column: 8, scope: !142)
!225 = distinct !DISubprogram(name: "print_mat", scope: !1, file: !1, line: 151, type: !226, isLocal: false, isDefinition: true, scopeLine: 151, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !289)
!226 = !DISubroutineType(types: !227)
!227 = !{null, !228, !11, !111}
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !229, size: 64, align: 64)
!229 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !230, line: 48, baseType: !231)
!230 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate1")
!231 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !232, line: 245, size: 1728, align: 64, elements: !233)
!232 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate1")
!233 = !{!234, !235, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !256, !257, !258, !259, !263, !265, !267, !271, !274, !276, !277, !278, !279, !280, !284, !285}
!234 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !231, file: !232, line: 246, baseType: !54, size: 32, align: 32)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !231, file: !232, line: 251, baseType: !236, size: 64, align: 64, offset: 64)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !237, size: 64, align: 64)
!237 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !231, file: !232, line: 252, baseType: !236, size: 64, align: 64, offset: 128)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !231, file: !232, line: 253, baseType: !236, size: 64, align: 64, offset: 192)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !231, file: !232, line: 254, baseType: !236, size: 64, align: 64, offset: 256)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !231, file: !232, line: 255, baseType: !236, size: 64, align: 64, offset: 320)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !231, file: !232, line: 256, baseType: !236, size: 64, align: 64, offset: 384)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !231, file: !232, line: 257, baseType: !236, size: 64, align: 64, offset: 448)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !231, file: !232, line: 258, baseType: !236, size: 64, align: 64, offset: 512)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !231, file: !232, line: 260, baseType: !236, size: 64, align: 64, offset: 576)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !231, file: !232, line: 261, baseType: !236, size: 64, align: 64, offset: 640)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !231, file: !232, line: 262, baseType: !236, size: 64, align: 64, offset: 704)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !231, file: !232, line: 264, baseType: !249, size: 64, align: 64, offset: 768)
!249 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !250, size: 64, align: 64)
!250 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !232, line: 160, size: 192, align: 64, elements: !251)
!251 = !{!252, !253, !255}
!252 = !DIDerivedType(tag: DW_TAG_member, name: "_next", scope: !250, file: !232, line: 161, baseType: !249, size: 64, align: 64)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "_sbuf", scope: !250, file: !232, line: 162, baseType: !254, size: 64, align: 64, offset: 64)
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !231, size: 64, align: 64)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "_pos", scope: !250, file: !232, line: 166, baseType: !54, size: 32, align: 32, offset: 128)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !231, file: !232, line: 266, baseType: !254, size: 64, align: 64, offset: 832)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !231, file: !232, line: 268, baseType: !54, size: 32, align: 32, offset: 896)
!258 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !231, file: !232, line: 272, baseType: !54, size: 32, align: 32, offset: 928)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !231, file: !232, line: 274, baseType: !260, size: 64, align: 64, offset: 960)
!260 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !261, line: 131, baseType: !262)
!261 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate1")
!262 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !231, file: !232, line: 278, baseType: !264, size: 16, align: 16, offset: 1024)
!264 = !DIBasicType(name: "unsigned short", size: 16, align: 16, encoding: DW_ATE_unsigned)
!265 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !231, file: !232, line: 279, baseType: !266, size: 8, align: 8, offset: 1040)
!266 = !DIBasicType(name: "signed char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!267 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !231, file: !232, line: 280, baseType: !268, size: 8, align: 8, offset: 1048)
!268 = !DICompositeType(tag: DW_TAG_array_type, baseType: !237, size: 8, align: 8, elements: !269)
!269 = !{!270}
!270 = !DISubrange(count: 1)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !231, file: !232, line: 284, baseType: !272, size: 64, align: 64, offset: 1088)
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 64, align: 64)
!273 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !232, line: 154, baseType: null)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !231, file: !232, line: 293, baseType: !275, size: 64, align: 64, offset: 1152)
!275 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !261, line: 132, baseType: !262)
!276 = !DIDerivedType(tag: DW_TAG_member, name: "__pad1", scope: !231, file: !232, line: 302, baseType: !4, size: 64, align: 64, offset: 1216)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "__pad2", scope: !231, file: !232, line: 303, baseType: !4, size: 64, align: 64, offset: 1280)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "__pad3", scope: !231, file: !232, line: 304, baseType: !4, size: 64, align: 64, offset: 1344)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "__pad4", scope: !231, file: !232, line: 305, baseType: !4, size: 64, align: 64, offset: 1408)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !231, file: !232, line: 306, baseType: !281, size: 64, align: 64, offset: 1472)
!281 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !282, line: 62, baseType: !283)
!282 = !DIFile(filename: "/home/sam/polly/llvm_build/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate1")
!283 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!284 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !231, file: !232, line: 308, baseType: !54, size: 32, align: 32, offset: 1536)
!285 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !231, file: !232, line: 310, baseType: !286, size: 160, align: 8, offset: 1568)
!286 = !DICompositeType(tag: DW_TAG_array_type, baseType: !237, size: 160, align: 8, elements: !287)
!287 = !{!288}
!288 = !DISubrange(count: 20)
!289 = !{!290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !313, !314, !315, !316, !317, !318, !319}
!290 = !DILocalVariable(name: "sys", arg: 1, scope: !225, file: !1, line: 151, type: !228)
!291 = !DILocalVariable(name: "a", arg: 2, scope: !225, file: !1, line: 151, type: !11)
!292 = !DILocalVariable(name: "a_has_ownership", arg: 3, scope: !225, file: !1, line: 151, type: !111)
!293 = !DILocalVariable(name: "i", scope: !225, file: !1, line: 152, type: !18)
!294 = !DILocalVariable(name: "width", scope: !225, file: !1, line: 153, type: !18)
!295 = !DILocalVariable(name: "height", scope: !225, file: !1, line: 154, type: !18)
!296 = !DILocalVariable(name: "j", scope: !225, file: !1, line: 155, type: !18)
!297 = !DILocalVariable(name: "_6", scope: !225, file: !1, line: 156, type: !18)
!298 = !DILocalVariable(name: "_7", scope: !225, file: !1, line: 157, type: !18)
!299 = !DILocalVariable(name: "_8", scope: !225, file: !1, line: 158, type: !18)
!300 = !DILocalVariable(name: "_9", scope: !225, file: !1, line: 159, type: !18)
!301 = !DILocalVariable(name: "_10", scope: !225, file: !1, line: 160, type: !4)
!302 = !DILocalVariable(name: "_12", scope: !225, file: !1, line: 161, type: !17)
!303 = !DILocalVariable(name: "_12_size", scope: !225, file: !1, line: 161, type: !18)
!304 = !DILocalVariable(name: "_12_has_ownership", scope: !225, file: !1, line: 162, type: !111)
!305 = !DILocalVariable(name: "_13", scope: !225, file: !1, line: 163, type: !18)
!306 = !DILocalVariable(name: "_14", scope: !225, file: !1, line: 164, type: !18)
!307 = !DILocalVariable(name: "_15", scope: !225, file: !1, line: 165, type: !18)
!308 = !DILocalVariable(name: "_16", scope: !225, file: !1, line: 166, type: !4)
!309 = !DILocalVariable(name: "_18", scope: !225, file: !1, line: 167, type: !17)
!310 = !DILocalVariable(name: "_18_size", scope: !225, file: !1, line: 167, type: !18)
!311 = !DILocalVariable(name: "_18_has_ownership", scope: !225, file: !1, line: 168, type: !111)
!312 = !DILocalVariable(name: "_19", scope: !225, file: !1, line: 169, type: !18)
!313 = !DILocalVariable(name: "_20", scope: !225, file: !1, line: 170, type: !18)
!314 = !DILocalVariable(name: "_21", scope: !225, file: !1, line: 171, type: !18)
!315 = !DILocalVariable(name: "_22", scope: !225, file: !1, line: 172, type: !18)
!316 = !DILocalVariable(name: "_23", scope: !225, file: !1, line: 173, type: !4)
!317 = !DILocalVariable(name: "_25", scope: !225, file: !1, line: 174, type: !4)
!318 = !DILocalVariable(name: "_25_size", scope: !225, file: !1, line: 175, type: !18)
!319 = !DILocalVariable(name: "_25_has_ownership", scope: !225, file: !1, line: 176, type: !111)
!320 = !DILocation(line: 151, column: 22, scope: !225)
!321 = !DILocation(line: 151, column: 35, scope: !225)
!322 = !DILocation(line: 151, column: 38, scope: !225)
!323 = !DILocation(line: 152, column: 12, scope: !225)
!324 = !DILocation(line: 153, column: 12, scope: !225)
!325 = !DILocation(line: 154, column: 12, scope: !225)
!326 = !DILocation(line: 155, column: 12, scope: !225)
!327 = !DILocation(line: 156, column: 12, scope: !225)
!328 = !DILocation(line: 157, column: 12, scope: !225)
!329 = !DILocation(line: 158, column: 12, scope: !225)
!330 = !DILocation(line: 159, column: 12, scope: !225)
!331 = !DILocation(line: 161, column: 2, scope: !225)
!332 = !DILocation(line: 162, column: 2, scope: !225)
!333 = !DILocation(line: 163, column: 12, scope: !225)
!334 = !DILocation(line: 164, column: 12, scope: !225)
!335 = !DILocation(line: 165, column: 12, scope: !225)
!336 = !DILocation(line: 167, column: 2, scope: !225)
!337 = !DILocation(line: 168, column: 2, scope: !225)
!338 = !DILocation(line: 169, column: 12, scope: !225)
!339 = !DILocation(line: 170, column: 12, scope: !225)
!340 = !DILocation(line: 171, column: 12, scope: !225)
!341 = !DILocation(line: 172, column: 12, scope: !225)
!342 = !DILocation(line: 175, column: 12, scope: !225)
!343 = !DILocation(line: 176, column: 2, scope: !225)
!344 = !DILocation(line: 182, column: 10, scope: !225)
!345 = !DILocation(line: 186, column: 10, scope: !225)
!346 = !DILocation(line: 192, column: 7, scope: !347)
!347 = distinct !DILexicalBlock(scope: !348, file: !1, line: 192, column: 6)
!348 = distinct !DILexicalBlock(scope: !225, file: !1, line: 190, column: 13)
!349 = !DILocation(line: 192, column: 6, scope: !348)
!350 = !DILocation(line: 200, column: 8, scope: !351)
!351 = distinct !DILexicalBlock(scope: !352, file: !1, line: 200, column: 7)
!352 = distinct !DILexicalBlock(scope: !348, file: !1, line: 198, column: 14)
!353 = !DILocation(line: 205, column: 4, scope: !352)
!354 = !DILocation(line: 200, column: 7, scope: !352)
!355 = !DILocation(line: 208, column: 9, scope: !352)
!356 = !DILocation(line: 204, column: 4, scope: !357)
!357 = distinct !DILexicalBlock(scope: !352, file: !1, line: 204, column: 4)
!358 = !DILocation(line: 204, column: 4, scope: !352)
!359 = !DILocation(line: 204, column: 4, scope: !360)
!360 = !DILexicalBlockFile(scope: !361, file: !1, discriminator: 1)
!361 = distinct !DILexicalBlock(scope: !357, file: !1, line: 204, column: 4)
!362 = !DILocation(line: 210, column: 11, scope: !352)
!363 = !DILocation(line: 212, column: 8, scope: !352)
!364 = !DILocation(line: 214, column: 4, scope: !352)
!365 = !DILocation(line: 218, column: 4, scope: !352)
!366 = !DILocation(line: 218, column: 4, scope: !367)
!367 = !DILexicalBlockFile(scope: !368, file: !1, discriminator: 1)
!368 = distinct !DILexicalBlock(scope: !369, file: !1, line: 218, column: 4)
!369 = distinct !DILexicalBlock(scope: !352, file: !1, line: 218, column: 4)
!370 = !DILocation(line: 219, column: 4, scope: !352)
!371 = !DILocation(line: 220, column: 11, scope: !352)
!372 = !DILocation(line: 223, column: 4, scope: !352)
!373 = !DILocation(line: 227, column: 9, scope: !352)
!374 = !DILocation(line: 244, column: 3, scope: !375)
!375 = !DILexicalBlockFile(scope: !376, file: !1, discriminator: 1)
!376 = distinct !DILexicalBlock(scope: !377, file: !1, line: 244, column: 3)
!377 = distinct !DILexicalBlock(scope: !348, file: !1, line: 244, column: 3)
!378 = !DILocation(line: 245, column: 3, scope: !348)
!379 = !DILocation(line: 174, column: 8, scope: !225)
!380 = !DILocation(line: 248, column: 13, scope: !348)
!381 = !DILocation(line: 248, column: 3, scope: !348)
!382 = !DILocation(line: 238, column: 8, scope: !348)
!383 = !DILocation(line: 244, column: 3, scope: !348)
!384 = !DILocation(line: 255, column: 2, scope: !225)
!385 = !DILocation(line: 16, column: 26, scope: !80, inlinedAt: !386)
!386 = distinct !DILocation(line: 255, column: 2, scope: !387)
!387 = !DILexicalBlockFile(scope: !388, file: !1, discriminator: 1)
!388 = distinct !DILexicalBlock(scope: !389, file: !1, line: 255, column: 2)
!389 = distinct !DILexicalBlock(scope: !225, file: !1, line: 255, column: 2)
!390 = !DILocation(line: 17, column: 15, scope: !80, inlinedAt: !386)
!391 = !DILocation(line: 17, column: 2, scope: !80, inlinedAt: !386)
!392 = !DILocation(line: 18, column: 7, scope: !80, inlinedAt: !386)
!393 = !DILocation(line: 18, column: 2, scope: !80, inlinedAt: !386)
!394 = !DILocation(line: 255, column: 2, scope: !387)
!395 = !DILocation(line: 256, column: 2, scope: !225)
!396 = !DILocation(line: 256, column: 2, scope: !397)
!397 = !DILexicalBlockFile(scope: !398, file: !1, discriminator: 1)
!398 = distinct !DILexicalBlock(scope: !399, file: !1, line: 256, column: 2)
!399 = distinct !DILexicalBlock(scope: !225, file: !1, line: 256, column: 2)
!400 = !DILocation(line: 257, column: 2, scope: !401)
!401 = !DILexicalBlockFile(scope: !402, file: !1, discriminator: 1)
!402 = distinct !DILexicalBlock(scope: !403, file: !1, line: 257, column: 2)
!403 = distinct !DILexicalBlock(scope: !225, file: !1, line: 257, column: 2)
!404 = !DILocation(line: 258, column: 2, scope: !225)
!405 = !DILocation(line: 258, column: 2, scope: !406)
!406 = !DILexicalBlockFile(scope: !407, file: !1, discriminator: 1)
!407 = distinct !DILexicalBlock(scope: !408, file: !1, line: 258, column: 2)
!408 = distinct !DILexicalBlock(scope: !225, file: !1, line: 258, column: 2)
!409 = !DILocation(line: 260, column: 1, scope: !225)
!410 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 262, type: !411, isLocal: false, isDefinition: true, scopeLine: 262, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !413)
!411 = !DISubroutineType(types: !412)
!412 = !{!11, !11, !111, !11, !111}
!413 = !{!414, !415, !416, !417, !418, !419, !420, !421, !422, !423, !424, !425, !426, !427, !428, !429, !430, !431, !432, !433, !434, !435, !436, !437, !438, !439, !440, !441, !442, !443, !444, !445, !446, !447, !448, !449, !450, !451, !452, !453, !454, !455, !456, !457, !458, !459, !460, !461, !462, !463, !464, !465, !466, !467, !468, !469, !470}
!414 = !DILocalVariable(name: "a", arg: 1, scope: !410, file: !1, line: 262, type: !11)
!415 = !DILocalVariable(name: "a_has_ownership", arg: 2, scope: !410, file: !1, line: 262, type: !111)
!416 = !DILocalVariable(name: "b", arg: 3, scope: !410, file: !1, line: 262, type: !11)
!417 = !DILocalVariable(name: "b_has_ownership", arg: 4, scope: !410, file: !1, line: 262, type: !111)
!418 = !DILocalVariable(name: "c", scope: !410, file: !1, line: 263, type: !11)
!419 = !DILocalVariable(name: "c_has_ownership", scope: !410, file: !1, line: 264, type: !111)
!420 = !DILocalVariable(name: "width", scope: !410, file: !1, line: 265, type: !18)
!421 = !DILocalVariable(name: "height", scope: !410, file: !1, line: 266, type: !18)
!422 = !DILocalVariable(name: "data", scope: !410, file: !1, line: 267, type: !17)
!423 = !DILocalVariable(name: "data_size", scope: !410, file: !1, line: 267, type: !18)
!424 = !DILocalVariable(name: "data_has_ownership", scope: !410, file: !1, line: 268, type: !111)
!425 = !DILocalVariable(name: "a_data", scope: !410, file: !1, line: 269, type: !17)
!426 = !DILocalVariable(name: "a_data_size", scope: !410, file: !1, line: 269, type: !18)
!427 = !DILocalVariable(name: "a_data_has_ownership", scope: !410, file: !1, line: 270, type: !111)
!428 = !DILocalVariable(name: "b_data", scope: !410, file: !1, line: 271, type: !17)
!429 = !DILocalVariable(name: "b_data_size", scope: !410, file: !1, line: 271, type: !18)
!430 = !DILocalVariable(name: "b_data_has_ownership", scope: !410, file: !1, line: 272, type: !111)
!431 = !DILocalVariable(name: "i", scope: !410, file: !1, line: 273, type: !18)
!432 = !DILocalVariable(name: "j", scope: !410, file: !1, line: 274, type: !18)
!433 = !DILocalVariable(name: "k", scope: !410, file: !1, line: 275, type: !18)
!434 = !DILocalVariable(name: "_11", scope: !410, file: !1, line: 276, type: !18)
!435 = !DILocalVariable(name: "_12", scope: !410, file: !1, line: 277, type: !18)
!436 = !DILocalVariable(name: "_13", scope: !410, file: !1, line: 278, type: !18)
!437 = !DILocalVariable(name: "_14", scope: !410, file: !1, line: 279, type: !18)
!438 = !DILocalVariable(name: "_15", scope: !410, file: !1, line: 280, type: !17)
!439 = !DILocalVariable(name: "_15_size", scope: !410, file: !1, line: 280, type: !18)
!440 = !DILocalVariable(name: "_15_has_ownership", scope: !410, file: !1, line: 281, type: !111)
!441 = !DILocalVariable(name: "_16", scope: !410, file: !1, line: 282, type: !17)
!442 = !DILocalVariable(name: "_16_size", scope: !410, file: !1, line: 282, type: !18)
!443 = !DILocalVariable(name: "_16_has_ownership", scope: !410, file: !1, line: 283, type: !111)
!444 = !DILocalVariable(name: "_17", scope: !410, file: !1, line: 284, type: !17)
!445 = !DILocalVariable(name: "_17_size", scope: !410, file: !1, line: 284, type: !18)
!446 = !DILocalVariable(name: "_17_has_ownership", scope: !410, file: !1, line: 285, type: !111)
!447 = !DILocalVariable(name: "_18", scope: !410, file: !1, line: 286, type: !18)
!448 = !DILocalVariable(name: "_19", scope: !410, file: !1, line: 287, type: !18)
!449 = !DILocalVariable(name: "_20", scope: !410, file: !1, line: 288, type: !18)
!450 = !DILocalVariable(name: "_21", scope: !410, file: !1, line: 289, type: !18)
!451 = !DILocalVariable(name: "_22", scope: !410, file: !1, line: 290, type: !18)
!452 = !DILocalVariable(name: "_23", scope: !410, file: !1, line: 291, type: !18)
!453 = !DILocalVariable(name: "_24", scope: !410, file: !1, line: 292, type: !18)
!454 = !DILocalVariable(name: "_25", scope: !410, file: !1, line: 293, type: !18)
!455 = !DILocalVariable(name: "_26", scope: !410, file: !1, line: 294, type: !18)
!456 = !DILocalVariable(name: "_27", scope: !410, file: !1, line: 295, type: !18)
!457 = !DILocalVariable(name: "_28", scope: !410, file: !1, line: 296, type: !18)
!458 = !DILocalVariable(name: "_29", scope: !410, file: !1, line: 297, type: !18)
!459 = !DILocalVariable(name: "_30", scope: !410, file: !1, line: 298, type: !18)
!460 = !DILocalVariable(name: "_31", scope: !410, file: !1, line: 299, type: !18)
!461 = !DILocalVariable(name: "_32", scope: !410, file: !1, line: 300, type: !18)
!462 = !DILocalVariable(name: "_33", scope: !410, file: !1, line: 301, type: !18)
!463 = !DILocalVariable(name: "_34", scope: !410, file: !1, line: 302, type: !18)
!464 = !DILocalVariable(name: "_35", scope: !410, file: !1, line: 303, type: !18)
!465 = !DILocalVariable(name: "_36", scope: !410, file: !1, line: 304, type: !18)
!466 = !DILocalVariable(name: "_37", scope: !410, file: !1, line: 305, type: !18)
!467 = !DILocalVariable(name: "_38", scope: !410, file: !1, line: 306, type: !18)
!468 = !DILocalVariable(name: "_39", scope: !410, file: !1, line: 307, type: !18)
!469 = !DILocalVariable(name: "_40", scope: !410, file: !1, line: 308, type: !11)
!470 = !DILocalVariable(name: "_40_has_ownership", scope: !410, file: !1, line: 309, type: !111)
!471 = !DILocation(line: 262, column: 26, scope: !410)
!472 = !DILocation(line: 262, column: 29, scope: !410)
!473 = !DILocation(line: 262, column: 63, scope: !410)
!474 = !DILocation(line: 262, column: 66, scope: !410)
!475 = !DILocation(line: 264, column: 2, scope: !410)
!476 = !DILocation(line: 265, column: 12, scope: !410)
!477 = !DILocation(line: 266, column: 12, scope: !410)
!478 = !DILocation(line: 267, column: 2, scope: !410)
!479 = !DILocation(line: 268, column: 2, scope: !410)
!480 = !DILocation(line: 269, column: 2, scope: !410)
!481 = !DILocation(line: 270, column: 2, scope: !410)
!482 = !DILocation(line: 271, column: 2, scope: !410)
!483 = !DILocation(line: 272, column: 2, scope: !410)
!484 = !DILocation(line: 273, column: 12, scope: !410)
!485 = !DILocation(line: 274, column: 12, scope: !410)
!486 = !DILocation(line: 275, column: 12, scope: !410)
!487 = !DILocation(line: 276, column: 12, scope: !410)
!488 = !DILocation(line: 277, column: 12, scope: !410)
!489 = !DILocation(line: 278, column: 12, scope: !410)
!490 = !DILocation(line: 279, column: 12, scope: !410)
!491 = !DILocation(line: 280, column: 2, scope: !410)
!492 = !DILocation(line: 281, column: 2, scope: !410)
!493 = !DILocation(line: 282, column: 2, scope: !410)
!494 = !DILocation(line: 283, column: 2, scope: !410)
!495 = !DILocation(line: 284, column: 2, scope: !410)
!496 = !DILocation(line: 285, column: 2, scope: !410)
!497 = !DILocation(line: 286, column: 12, scope: !410)
!498 = !DILocation(line: 287, column: 12, scope: !410)
!499 = !DILocation(line: 288, column: 12, scope: !410)
!500 = !DILocation(line: 289, column: 12, scope: !410)
!501 = !DILocation(line: 290, column: 12, scope: !410)
!502 = !DILocation(line: 291, column: 12, scope: !410)
!503 = !DILocation(line: 292, column: 12, scope: !410)
!504 = !DILocation(line: 293, column: 12, scope: !410)
!505 = !DILocation(line: 294, column: 12, scope: !410)
!506 = !DILocation(line: 295, column: 12, scope: !410)
!507 = !DILocation(line: 296, column: 12, scope: !410)
!508 = !DILocation(line: 297, column: 12, scope: !410)
!509 = !DILocation(line: 298, column: 12, scope: !410)
!510 = !DILocation(line: 299, column: 12, scope: !410)
!511 = !DILocation(line: 300, column: 12, scope: !410)
!512 = !DILocation(line: 301, column: 12, scope: !410)
!513 = !DILocation(line: 302, column: 12, scope: !410)
!514 = !DILocation(line: 303, column: 12, scope: !410)
!515 = !DILocation(line: 304, column: 12, scope: !410)
!516 = !DILocation(line: 305, column: 12, scope: !410)
!517 = !DILocation(line: 306, column: 12, scope: !410)
!518 = !DILocation(line: 307, column: 12, scope: !410)
!519 = !DILocation(line: 309, column: 2, scope: !410)
!520 = !DILocation(line: 311, column: 11, scope: !410)
!521 = !DILocation(line: 315, column: 11, scope: !410)
!522 = !DILocation(line: 321, column: 11, scope: !410)
!523 = !DILocation(line: 324, column: 2, scope: !410)
!524 = !DILocation(line: 333, column: 2, scope: !410)
!525 = !DILocation(line: 342, column: 2, scope: !410)
!526 = !DILocation(line: 356, column: 7, scope: !527)
!527 = distinct !DILexicalBlock(scope: !528, file: !1, line: 356, column: 6)
!528 = distinct !DILexicalBlock(scope: !410, file: !1, line: 354, column: 13)
!529 = !DILocation(line: 356, column: 6, scope: !528)
!530 = !DILocation(line: 364, column: 8, scope: !531)
!531 = distinct !DILexicalBlock(scope: !532, file: !1, line: 364, column: 7)
!532 = distinct !DILexicalBlock(scope: !528, file: !1, line: 362, column: 14)
!533 = !DILocation(line: 364, column: 7, scope: !532)
!534 = !DILocation(line: 374, column: 10, scope: !535)
!535 = distinct !DILexicalBlock(scope: !532, file: !1, line: 370, column: 15)
!536 = !DILocation(line: 372, column: 8, scope: !535)
!537 = !DILocation(line: 376, column: 12, scope: !535)
!538 = !DILocation(line: 378, column: 9, scope: !535)
!539 = !DILocation(line: 382, column: 12, scope: !535)
!540 = !DILocation(line: 384, column: 9, scope: !535)
!541 = !DILocation(line: 386, column: 10, scope: !535)
!542 = !DILocation(line: 388, column: 12, scope: !535)
!543 = !DILocation(line: 390, column: 9, scope: !535)
!544 = !DILocation(line: 392, column: 12, scope: !535)
!545 = !DILocation(line: 394, column: 12, scope: !535)
!546 = !DILocation(line: 400, column: 15, scope: !535)
!547 = !DILocation(line: 415, column: 9, scope: !532)
!548 = !DILocation(line: 404, column: 10, scope: !535)
!549 = !DILocation(line: 426, column: 8, scope: !528)
!550 = !DILocation(line: 30, column: 26, scope: !108, inlinedAt: !551)
!551 = distinct !DILocation(line: 436, column: 8, scope: !410)
!552 = !DILocation(line: 30, column: 43, scope: !108, inlinedAt: !551)
!553 = !DILocation(line: 30, column: 51, scope: !108, inlinedAt: !551)
!554 = !DILocation(line: 30, column: 78, scope: !108, inlinedAt: !551)
!555 = !DILocation(line: 32, column: 2, scope: !108, inlinedAt: !551)
!556 = !DILocation(line: 34, column: 2, scope: !108, inlinedAt: !551)
!557 = !DILocation(line: 37, column: 7, scope: !108, inlinedAt: !551)
!558 = !DILocation(line: 33, column: 10, scope: !108, inlinedAt: !551)
!559 = !DILocation(line: 38, column: 2, scope: !108, inlinedAt: !551)
!560 = !DILocation(line: 39, column: 6, scope: !108, inlinedAt: !551)
!561 = !DILocation(line: 39, column: 13, scope: !108, inlinedAt: !551)
!562 = !DILocation(line: 40, column: 6, scope: !108, inlinedAt: !551)
!563 = !DILocation(line: 40, column: 12, scope: !108, inlinedAt: !551)
!564 = !DILocation(line: 308, column: 10, scope: !410)
!565 = !DILocation(line: 439, column: 2, scope: !410)
!566 = !DILocation(line: 16, column: 26, scope: !80, inlinedAt: !567)
!567 = distinct !DILocation(line: 439, column: 2, scope: !568)
!568 = !DILexicalBlockFile(scope: !569, file: !1, discriminator: 1)
!569 = distinct !DILexicalBlock(scope: !570, file: !1, line: 439, column: 2)
!570 = distinct !DILexicalBlock(scope: !410, file: !1, line: 439, column: 2)
!571 = !DILocation(line: 17, column: 15, scope: !80, inlinedAt: !567)
!572 = !DILocation(line: 17, column: 2, scope: !80, inlinedAt: !567)
!573 = !DILocation(line: 18, column: 7, scope: !80, inlinedAt: !567)
!574 = !DILocation(line: 18, column: 2, scope: !80, inlinedAt: !567)
!575 = !DILocation(line: 439, column: 2, scope: !568)
!576 = !DILocation(line: 440, column: 2, scope: !410)
!577 = !DILocation(line: 16, column: 26, scope: !80, inlinedAt: !578)
!578 = distinct !DILocation(line: 440, column: 2, scope: !579)
!579 = !DILexicalBlockFile(scope: !580, file: !1, discriminator: 1)
!580 = distinct !DILexicalBlock(scope: !581, file: !1, line: 440, column: 2)
!581 = distinct !DILexicalBlock(scope: !410, file: !1, line: 440, column: 2)
!582 = !DILocation(line: 17, column: 15, scope: !80, inlinedAt: !578)
!583 = !DILocation(line: 17, column: 2, scope: !80, inlinedAt: !578)
!584 = !DILocation(line: 18, column: 7, scope: !80, inlinedAt: !578)
!585 = !DILocation(line: 18, column: 2, scope: !80, inlinedAt: !578)
!586 = !DILocation(line: 440, column: 2, scope: !579)
!587 = !DILocation(line: 442, column: 2, scope: !588)
!588 = !DILexicalBlockFile(scope: !589, file: !1, discriminator: 1)
!589 = distinct !DILexicalBlock(scope: !590, file: !1, line: 442, column: 2)
!590 = distinct !DILexicalBlock(scope: !410, file: !1, line: 442, column: 2)
!591 = !DILocation(line: 443, column: 2, scope: !592)
!592 = !DILexicalBlockFile(scope: !593, file: !1, discriminator: 1)
!593 = distinct !DILexicalBlock(scope: !594, file: !1, line: 443, column: 2)
!594 = distinct !DILexicalBlock(scope: !410, file: !1, line: 443, column: 2)
!595 = !DILocation(line: 444, column: 2, scope: !596)
!596 = !DILexicalBlockFile(scope: !597, file: !1, discriminator: 1)
!597 = distinct !DILexicalBlock(scope: !598, file: !1, line: 444, column: 2)
!598 = distinct !DILexicalBlock(scope: !410, file: !1, line: 444, column: 2)
!599 = !DILocation(line: 448, column: 2, scope: !410)
!600 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 452, type: !601, isLocal: false, isDefinition: true, scopeLine: 452, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !604)
!601 = !DISubroutineType(types: !602)
!602 = !{!54, !54, !603}
!603 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !236, size: 64, align: 64)
!604 = !{!605, !606, !607, !608, !609, !610, !611, !612, !613, !614, !615, !616, !618, !619, !620, !621, !622, !623, !624, !625, !626, !627, !628, !629, !630, !631, !632, !633, !634, !635, !636, !637, !638, !639, !640, !641, !642, !643, !644, !645, !646, !647, !648, !649, !650, !651, !652, !653, !654, !655, !656, !657, !658, !659, !660, !661, !662, !663, !664, !665, !666, !667, !668, !669, !670, !671, !672, !673, !674, !675, !676, !677, !678, !679, !680, !681, !682, !683, !684, !685, !686, !687, !688, !689, !690}
!605 = !DILocalVariable(name: "argc", arg: 1, scope: !600, file: !1, line: 452, type: !54)
!606 = !DILocalVariable(name: "args", arg: 2, scope: !600, file: !1, line: 452, type: !603)
!607 = !DILocalVariable(name: "max", scope: !600, file: !1, line: 453, type: !17)
!608 = !DILocalVariable(name: "size", scope: !600, file: !1, line: 454, type: !18)
!609 = !DILocalVariable(name: "A", scope: !600, file: !1, line: 455, type: !11)
!610 = !DILocalVariable(name: "A_has_ownership", scope: !600, file: !1, line: 456, type: !111)
!611 = !DILocalVariable(name: "B", scope: !600, file: !1, line: 457, type: !11)
!612 = !DILocalVariable(name: "B_has_ownership", scope: !600, file: !1, line: 458, type: !111)
!613 = !DILocalVariable(name: "C", scope: !600, file: !1, line: 459, type: !11)
!614 = !DILocalVariable(name: "C_has_ownership", scope: !600, file: !1, line: 460, type: !111)
!615 = !DILocalVariable(name: "_6", scope: !600, file: !1, line: 461, type: !17)
!616 = !DILocalVariable(name: "_7", scope: !600, file: !1, line: 462, type: !617)
!617 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64, align: 64)
!618 = !DILocalVariable(name: "_7_size", scope: !600, file: !1, line: 462, type: !18)
!619 = !DILocalVariable(name: "_7_size_size", scope: !600, file: !1, line: 462, type: !18)
!620 = !DILocalVariable(name: "_7_has_ownership", scope: !600, file: !1, line: 463, type: !111)
!621 = !DILocalVariable(name: "_8", scope: !600, file: !1, line: 464, type: !18)
!622 = !DILocalVariable(name: "_9", scope: !600, file: !1, line: 465, type: !17)
!623 = !DILocalVariable(name: "_9_size", scope: !600, file: !1, line: 465, type: !18)
!624 = !DILocalVariable(name: "_9_has_ownership", scope: !600, file: !1, line: 466, type: !111)
!625 = !DILocalVariable(name: "_10", scope: !600, file: !1, line: 467, type: !4)
!626 = !DILocalVariable(name: "_12", scope: !600, file: !1, line: 468, type: !17)
!627 = !DILocalVariable(name: "_12_size", scope: !600, file: !1, line: 468, type: !18)
!628 = !DILocalVariable(name: "_12_has_ownership", scope: !600, file: !1, line: 469, type: !111)
!629 = !DILocalVariable(name: "_13", scope: !600, file: !1, line: 470, type: !4)
!630 = !DILocalVariable(name: "_15", scope: !600, file: !1, line: 471, type: !11)
!631 = !DILocalVariable(name: "_15_has_ownership", scope: !600, file: !1, line: 472, type: !111)
!632 = !DILocalVariable(name: "_16", scope: !600, file: !1, line: 473, type: !11)
!633 = !DILocalVariable(name: "_16_has_ownership", scope: !600, file: !1, line: 474, type: !111)
!634 = !DILocalVariable(name: "_17", scope: !600, file: !1, line: 475, type: !11)
!635 = !DILocalVariable(name: "_17_has_ownership", scope: !600, file: !1, line: 476, type: !111)
!636 = !DILocalVariable(name: "_18", scope: !600, file: !1, line: 477, type: !17)
!637 = !DILocalVariable(name: "_18_size", scope: !600, file: !1, line: 477, type: !18)
!638 = !DILocalVariable(name: "_18_has_ownership", scope: !600, file: !1, line: 478, type: !111)
!639 = !DILocalVariable(name: "_19", scope: !600, file: !1, line: 479, type: !18)
!640 = !DILocalVariable(name: "_20", scope: !600, file: !1, line: 480, type: !18)
!641 = !DILocalVariable(name: "_21", scope: !600, file: !1, line: 481, type: !18)
!642 = !DILocalVariable(name: "_22", scope: !600, file: !1, line: 482, type: !18)
!643 = !DILocalVariable(name: "_23", scope: !600, file: !1, line: 483, type: !18)
!644 = !DILocalVariable(name: "_24", scope: !600, file: !1, line: 484, type: !18)
!645 = !DILocalVariable(name: "_25", scope: !600, file: !1, line: 485, type: !18)
!646 = !DILocalVariable(name: "_26", scope: !600, file: !1, line: 486, type: !18)
!647 = !DILocalVariable(name: "_27", scope: !600, file: !1, line: 487, type: !18)
!648 = !DILocalVariable(name: "_28", scope: !600, file: !1, line: 488, type: !17)
!649 = !DILocalVariable(name: "_28_size", scope: !600, file: !1, line: 488, type: !18)
!650 = !DILocalVariable(name: "_28_has_ownership", scope: !600, file: !1, line: 489, type: !111)
!651 = !DILocalVariable(name: "_29", scope: !600, file: !1, line: 490, type: !18)
!652 = !DILocalVariable(name: "_30", scope: !600, file: !1, line: 491, type: !18)
!653 = !DILocalVariable(name: "_31", scope: !600, file: !1, line: 492, type: !18)
!654 = !DILocalVariable(name: "_32", scope: !600, file: !1, line: 493, type: !18)
!655 = !DILocalVariable(name: "_33", scope: !600, file: !1, line: 494, type: !18)
!656 = !DILocalVariable(name: "_34", scope: !600, file: !1, line: 495, type: !18)
!657 = !DILocalVariable(name: "_35", scope: !600, file: !1, line: 496, type: !18)
!658 = !DILocalVariable(name: "_36", scope: !600, file: !1, line: 497, type: !18)
!659 = !DILocalVariable(name: "_37", scope: !600, file: !1, line: 498, type: !18)
!660 = !DILocalVariable(name: "_38", scope: !600, file: !1, line: 499, type: !18)
!661 = !DILocalVariable(name: "_39", scope: !600, file: !1, line: 500, type: !17)
!662 = !DILocalVariable(name: "_39_size", scope: !600, file: !1, line: 500, type: !18)
!663 = !DILocalVariable(name: "_39_has_ownership", scope: !600, file: !1, line: 501, type: !111)
!664 = !DILocalVariable(name: "_40", scope: !600, file: !1, line: 502, type: !18)
!665 = !DILocalVariable(name: "_41", scope: !600, file: !1, line: 503, type: !18)
!666 = !DILocalVariable(name: "_42", scope: !600, file: !1, line: 504, type: !18)
!667 = !DILocalVariable(name: "_43", scope: !600, file: !1, line: 505, type: !18)
!668 = !DILocalVariable(name: "_44", scope: !600, file: !1, line: 506, type: !18)
!669 = !DILocalVariable(name: "_45", scope: !600, file: !1, line: 507, type: !18)
!670 = !DILocalVariable(name: "_46", scope: !600, file: !1, line: 508, type: !18)
!671 = !DILocalVariable(name: "_47", scope: !600, file: !1, line: 509, type: !18)
!672 = !DILocalVariable(name: "_48", scope: !600, file: !1, line: 510, type: !4)
!673 = !DILocalVariable(name: "_50", scope: !600, file: !1, line: 511, type: !17)
!674 = !DILocalVariable(name: "_50_size", scope: !600, file: !1, line: 511, type: !18)
!675 = !DILocalVariable(name: "_50_has_ownership", scope: !600, file: !1, line: 512, type: !111)
!676 = !DILocalVariable(name: "_51", scope: !600, file: !1, line: 513, type: !4)
!677 = !DILocalVariable(name: "_53", scope: !600, file: !1, line: 514, type: !17)
!678 = !DILocalVariable(name: "_53_size", scope: !600, file: !1, line: 514, type: !18)
!679 = !DILocalVariable(name: "_53_has_ownership", scope: !600, file: !1, line: 515, type: !111)
!680 = !DILocalVariable(name: "_54", scope: !600, file: !1, line: 516, type: !18)
!681 = !DILocalVariable(name: "_55", scope: !600, file: !1, line: 517, type: !18)
!682 = !DILocalVariable(name: "_56", scope: !600, file: !1, line: 518, type: !18)
!683 = !DILocalVariable(name: "_57", scope: !600, file: !1, line: 519, type: !18)
!684 = !DILocalVariable(name: "_58", scope: !600, file: !1, line: 520, type: !18)
!685 = !DILocalVariable(name: "_59", scope: !600, file: !1, line: 521, type: !18)
!686 = !DILocalVariable(name: "_60", scope: !600, file: !1, line: 522, type: !18)
!687 = !DILocalVariable(name: "_61", scope: !600, file: !1, line: 523, type: !4)
!688 = !DILocalVariable(name: "_63", scope: !600, file: !1, line: 524, type: !17)
!689 = !DILocalVariable(name: "_63_size", scope: !600, file: !1, line: 524, type: !18)
!690 = !DILocalVariable(name: "_63_has_ownership", scope: !600, file: !1, line: 525, type: !111)
!691 = !DILocation(line: 452, column: 14, scope: !600)
!692 = !DILocation(line: 452, column: 27, scope: !600)
!693 = !DILocation(line: 454, column: 12, scope: !600)
!694 = !DILocation(line: 456, column: 2, scope: !600)
!695 = !DILocation(line: 458, column: 2, scope: !600)
!696 = !DILocation(line: 460, column: 2, scope: !600)
!697 = !DILocation(line: 462, column: 2, scope: !600)
!698 = !DILocation(line: 463, column: 2, scope: !600)
!699 = !DILocation(line: 464, column: 12, scope: !600)
!700 = !DILocation(line: 465, column: 2, scope: !600)
!701 = !DILocation(line: 466, column: 2, scope: !600)
!702 = !DILocation(line: 468, column: 2, scope: !600)
!703 = !DILocation(line: 469, column: 2, scope: !600)
!704 = !DILocation(line: 472, column: 2, scope: !600)
!705 = !DILocation(line: 474, column: 2, scope: !600)
!706 = !DILocation(line: 476, column: 2, scope: !600)
!707 = !DILocation(line: 477, column: 2, scope: !600)
!708 = !DILocation(line: 478, column: 2, scope: !600)
!709 = !DILocation(line: 479, column: 12, scope: !600)
!710 = !DILocation(line: 480, column: 12, scope: !600)
!711 = !DILocation(line: 481, column: 12, scope: !600)
!712 = !DILocation(line: 482, column: 12, scope: !600)
!713 = !DILocation(line: 483, column: 12, scope: !600)
!714 = !DILocation(line: 484, column: 12, scope: !600)
!715 = !DILocation(line: 485, column: 12, scope: !600)
!716 = !DILocation(line: 486, column: 12, scope: !600)
!717 = !DILocation(line: 487, column: 12, scope: !600)
!718 = !DILocation(line: 488, column: 2, scope: !600)
!719 = !DILocation(line: 489, column: 2, scope: !600)
!720 = !DILocation(line: 490, column: 12, scope: !600)
!721 = !DILocation(line: 491, column: 12, scope: !600)
!722 = !DILocation(line: 492, column: 12, scope: !600)
!723 = !DILocation(line: 493, column: 12, scope: !600)
!724 = !DILocation(line: 494, column: 12, scope: !600)
!725 = !DILocation(line: 495, column: 12, scope: !600)
!726 = !DILocation(line: 496, column: 12, scope: !600)
!727 = !DILocation(line: 497, column: 12, scope: !600)
!728 = !DILocation(line: 498, column: 12, scope: !600)
!729 = !DILocation(line: 499, column: 12, scope: !600)
!730 = !DILocation(line: 500, column: 2, scope: !600)
!731 = !DILocation(line: 501, column: 2, scope: !600)
!732 = !DILocation(line: 502, column: 12, scope: !600)
!733 = !DILocation(line: 503, column: 12, scope: !600)
!734 = !DILocation(line: 504, column: 12, scope: !600)
!735 = !DILocation(line: 505, column: 12, scope: !600)
!736 = !DILocation(line: 506, column: 12, scope: !600)
!737 = !DILocation(line: 507, column: 12, scope: !600)
!738 = !DILocation(line: 508, column: 12, scope: !600)
!739 = !DILocation(line: 509, column: 12, scope: !600)
!740 = !DILocation(line: 511, column: 2, scope: !600)
!741 = !DILocation(line: 512, column: 2, scope: !600)
!742 = !DILocation(line: 514, column: 2, scope: !600)
!743 = !DILocation(line: 515, column: 2, scope: !600)
!744 = !DILocation(line: 516, column: 12, scope: !600)
!745 = !DILocation(line: 517, column: 12, scope: !600)
!746 = !DILocation(line: 518, column: 12, scope: !600)
!747 = !DILocation(line: 519, column: 12, scope: !600)
!748 = !DILocation(line: 520, column: 12, scope: !600)
!749 = !DILocation(line: 521, column: 12, scope: !600)
!750 = !DILocation(line: 522, column: 12, scope: !600)
!751 = !DILocation(line: 524, column: 2, scope: !600)
!752 = !DILocation(line: 525, column: 2, scope: !600)
!753 = !DILocation(line: 527, column: 2, scope: !600)
!754 = !DILocation(line: 532, column: 5, scope: !600)
!755 = !DILocation(line: 534, column: 2, scope: !600)
!756 = !DILocation(line: 461, column: 13, scope: !600)
!757 = !DILocation(line: 453, column: 13, scope: !600)
!758 = !DILocation(line: 538, column: 9, scope: !759)
!759 = distinct !DILexicalBlock(scope: !600, file: !1, line: 538, column: 5)
!760 = !DILocation(line: 538, column: 5, scope: !600)
!761 = !DILocation(line: 540, column: 9, scope: !600)
!762 = !DILocation(line: 545, column: 2, scope: !600)
!763 = !DILocation(line: 546, column: 9, scope: !600)
!764 = !DILocation(line: 546, column: 30, scope: !600)
!765 = !DILocation(line: 546, column: 37, scope: !600)
!766 = !DILocation(line: 546, column: 58, scope: !600)
!767 = !DILocation(line: 546, column: 65, scope: !600)
!768 = !DILocation(line: 546, column: 84, scope: !600)
!769 = !DILocation(line: 546, column: 91, scope: !600)
!770 = !DILocation(line: 549, column: 2, scope: !600)
!771 = !DILocation(line: 553, column: 2, scope: !600)
!772 = !DILocation(line: 556, column: 8, scope: !600)
!773 = !DILocation(line: 471, column: 10, scope: !600)
!774 = !DILocation(line: 455, column: 10, scope: !600)
!775 = !DILocation(line: 565, column: 8, scope: !600)
!776 = !DILocation(line: 473, column: 10, scope: !600)
!777 = !DILocation(line: 457, column: 10, scope: !600)
!778 = !DILocation(line: 574, column: 8, scope: !600)
!779 = !DILocation(line: 475, column: 10, scope: !600)
!780 = !DILocation(line: 459, column: 10, scope: !600)
!781 = !DILocation(line: 585, column: 3, scope: !782)
!782 = distinct !DILexicalBlock(scope: !600, file: !1, line: 582, column: 2)
!783 = !DILocation(line: 590, column: 11, scope: !782)
!784 = !DILocation(line: 594, column: 10, scope: !782)
!785 = !DILocation(line: 598, column: 10, scope: !782)
!786 = !DILocation(line: 600, column: 7, scope: !782)
!787 = !DILocation(line: 606, column: 9, scope: !788)
!788 = distinct !DILexicalBlock(scope: !782, file: !1, line: 606, column: 6)
!789 = !DILocation(line: 606, column: 6, scope: !782)
!790 = !DILocation(line: 608, column: 11, scope: !782)
!791 = !DILocation(line: 608, column: 3, scope: !782)
!792 = !DILocation(line: 609, column: 3, scope: !782)
!793 = !DILocation(line: 618, column: 3, scope: !794)
!794 = distinct !DILexicalBlock(scope: !600, file: !1, line: 615, column: 2)
!795 = !DILocation(line: 633, column: 7, scope: !794)
!796 = !DILocation(line: 639, column: 9, scope: !797)
!797 = distinct !DILexicalBlock(scope: !794, file: !1, line: 639, column: 6)
!798 = !DILocation(line: 639, column: 6, scope: !794)
!799 = !DILocation(line: 641, column: 11, scope: !794)
!800 = !DILocation(line: 641, column: 3, scope: !794)
!801 = !DILocation(line: 642, column: 3, scope: !794)
!802 = !DILocation(line: 650, column: 9, scope: !803)
!803 = distinct !DILexicalBlock(scope: !600, file: !1, line: 650, column: 5)
!804 = !DILocation(line: 650, column: 5, scope: !600)
!805 = !DILocation(line: 697, column: 2, scope: !600)
!806 = !DILocation(line: 655, column: 3, scope: !807)
!807 = distinct !DILexicalBlock(scope: !600, file: !1, line: 652, column: 2)
!808 = !DILocation(line: 670, column: 7, scope: !807)
!809 = !DILocation(line: 674, column: 9, scope: !810)
!810 = distinct !DILexicalBlock(scope: !807, file: !1, line: 674, column: 6)
!811 = !DILocation(line: 674, column: 6, scope: !807)
!812 = !DILocation(line: 676, column: 11, scope: !807)
!813 = !DILocation(line: 676, column: 3, scope: !807)
!814 = !DILocation(line: 677, column: 3, scope: !807)
!815 = !DILocation(line: 688, column: 2, scope: !600)
!816 = !DILocation(line: 689, column: 9, scope: !600)
!817 = !DILocation(line: 689, column: 28, scope: !600)
!818 = !DILocation(line: 689, column: 35, scope: !600)
!819 = !DILocation(line: 689, column: 56, scope: !600)
!820 = !DILocation(line: 689, column: 63, scope: !600)
!821 = !DILocation(line: 689, column: 84, scope: !600)
!822 = !DILocation(line: 689, column: 91, scope: !600)
!823 = !DILocation(line: 689, column: 110, scope: !600)
!824 = !DILocation(line: 689, column: 117, scope: !600)
!825 = !DILocation(line: 689, column: 137, scope: !600)
!826 = !DILocation(line: 689, column: 145, scope: !600)
!827 = !DILocation(line: 689, column: 167, scope: !600)
!828 = !DILocation(line: 689, column: 175, scope: !600)
!829 = !DILocation(line: 689, column: 196, scope: !600)
!830 = !DILocation(line: 689, column: 204, scope: !600)
!831 = !DILocation(line: 689, column: 224, scope: !600)
!832 = !DILocation(line: 689, column: 232, scope: !600)
!833 = !DILocation(line: 689, column: 253, scope: !600)
!834 = !DILocation(line: 689, column: 261, scope: !600)
!835 = !DILocation(line: 689, column: 283, scope: !600)
!836 = !DILocation(line: 689, column: 291, scope: !600)
!837 = !DILocation(line: 689, column: 312, scope: !600)
!838 = !DILocation(line: 689, column: 320, scope: !600)
!839 = !DILocation(line: 689, column: 340, scope: !600)
!840 = !DILocation(line: 689, column: 348, scope: !600)
!841 = !DILocation(line: 689, column: 368, scope: !600)
!842 = !DILocation(line: 689, column: 376, scope: !600)
!843 = !DILocation(line: 692, column: 2, scope: !600)
!844 = !DILocation(line: 712, column: 6, scope: !600)
!845 = !DILocation(line: 714, column: 2, scope: !600)
!846 = !DILocation(line: 719, column: 2, scope: !600)
!847 = !DILocation(line: 720, column: 9, scope: !600)
!848 = !DILocation(line: 720, column: 28, scope: !600)
!849 = !DILocation(line: 720, column: 35, scope: !600)
!850 = !DILocation(line: 720, column: 56, scope: !600)
!851 = !DILocation(line: 720, column: 63, scope: !600)
!852 = !DILocation(line: 720, column: 82, scope: !600)
!853 = !DILocation(line: 720, column: 89, scope: !600)
!854 = !DILocation(line: 720, column: 109, scope: !600)
!855 = !DILocation(line: 720, column: 116, scope: !600)
!856 = !DILocation(line: 720, column: 137, scope: !600)
!857 = !DILocation(line: 720, column: 145, scope: !600)
!858 = !DILocation(line: 720, column: 166, scope: !600)
!859 = !DILocation(line: 720, column: 174, scope: !600)
!860 = !DILocation(line: 720, column: 196, scope: !600)
!861 = !DILocation(line: 720, column: 204, scope: !600)
!862 = !DILocation(line: 720, column: 225, scope: !600)
!863 = !DILocation(line: 720, column: 233, scope: !600)
!864 = !DILocation(line: 720, column: 255, scope: !600)
!865 = !DILocation(line: 720, column: 263, scope: !600)
!866 = !DILocation(line: 720, column: 285, scope: !600)
!867 = !DILocation(line: 720, column: 293, scope: !600)
!868 = !DILocation(line: 720, column: 313, scope: !600)
!869 = !DILocation(line: 720, column: 321, scope: !600)
!870 = !DILocation(line: 720, column: 342, scope: !600)
!871 = !DILocation(line: 720, column: 350, scope: !600)
!872 = !DILocation(line: 723, column: 2, scope: !600)
!873 = !DILocation(line: 16, column: 26, scope: !80, inlinedAt: !874)
!874 = distinct !DILocation(line: 727, column: 2, scope: !875)
!875 = !DILexicalBlockFile(scope: !876, file: !1, discriminator: 1)
!876 = distinct !DILexicalBlock(scope: !877, file: !1, line: 727, column: 2)
!877 = distinct !DILexicalBlock(scope: !600, file: !1, line: 727, column: 2)
!878 = !DILocation(line: 17, column: 15, scope: !80, inlinedAt: !874)
!879 = !DILocation(line: 17, column: 2, scope: !80, inlinedAt: !874)
!880 = !DILocation(line: 18, column: 7, scope: !80, inlinedAt: !874)
!881 = !DILocation(line: 18, column: 2, scope: !80, inlinedAt: !874)
!882 = !DILocation(line: 16, column: 26, scope: !80, inlinedAt: !883)
!883 = distinct !DILocation(line: 728, column: 2, scope: !884)
!884 = !DILexicalBlockFile(scope: !885, file: !1, discriminator: 1)
!885 = distinct !DILexicalBlock(scope: !886, file: !1, line: 728, column: 2)
!886 = distinct !DILexicalBlock(scope: !600, file: !1, line: 728, column: 2)
!887 = !DILocation(line: 17, column: 15, scope: !80, inlinedAt: !883)
!888 = !DILocation(line: 17, column: 2, scope: !80, inlinedAt: !883)
!889 = !DILocation(line: 18, column: 7, scope: !80, inlinedAt: !883)
!890 = !DILocation(line: 18, column: 2, scope: !80, inlinedAt: !883)
!891 = !DILocation(line: 16, column: 26, scope: !80, inlinedAt: !892)
!892 = distinct !DILocation(line: 729, column: 2, scope: !893)
!893 = !DILexicalBlockFile(scope: !894, file: !1, discriminator: 1)
!894 = distinct !DILexicalBlock(scope: !895, file: !1, line: 729, column: 2)
!895 = distinct !DILexicalBlock(scope: !600, file: !1, line: 729, column: 2)
!896 = !DILocation(line: 17, column: 15, scope: !80, inlinedAt: !892)
!897 = !DILocation(line: 17, column: 2, scope: !80, inlinedAt: !892)
!898 = !DILocation(line: 18, column: 7, scope: !80, inlinedAt: !892)
!899 = !DILocation(line: 18, column: 2, scope: !80, inlinedAt: !892)
!900 = !DILocation(line: 730, column: 2, scope: !901)
!901 = !DILexicalBlockFile(scope: !902, file: !1, discriminator: 1)
!902 = distinct !DILexicalBlock(scope: !903, file: !1, line: 730, column: 2)
!903 = distinct !DILexicalBlock(scope: !600, file: !1, line: 730, column: 2)
!904 = !DILocation(line: 732, column: 2, scope: !905)
!905 = !DILexicalBlockFile(scope: !906, file: !1, discriminator: 1)
!906 = distinct !DILexicalBlock(scope: !907, file: !1, line: 732, column: 2)
!907 = distinct !DILexicalBlock(scope: !600, file: !1, line: 732, column: 2)
!908 = !DILocation(line: 736, column: 2, scope: !909)
!909 = !DILexicalBlockFile(scope: !910, file: !1, discriminator: 1)
!910 = distinct !DILexicalBlock(scope: !911, file: !1, line: 736, column: 2)
!911 = distinct !DILexicalBlock(scope: !600, file: !1, line: 736, column: 2)
!912 = !DILocation(line: 737, column: 2, scope: !913)
!913 = !DILexicalBlockFile(scope: !914, file: !1, discriminator: 1)
!914 = distinct !DILexicalBlock(scope: !915, file: !1, line: 737, column: 2)
!915 = distinct !DILexicalBlock(scope: !600, file: !1, line: 737, column: 2)
!916 = !DILocation(line: 738, column: 2, scope: !600)
!917 = !DILocation(line: 738, column: 2, scope: !918)
!918 = !DILexicalBlockFile(scope: !919, file: !1, discriminator: 1)
!919 = distinct !DILexicalBlock(scope: !920, file: !1, line: 738, column: 2)
!920 = distinct !DILexicalBlock(scope: !600, file: !1, line: 738, column: 2)
!921 = !DILocation(line: 739, column: 2, scope: !600)
!922 = !DILocation(line: 739, column: 2, scope: !923)
!923 = !DILexicalBlockFile(scope: !924, file: !1, discriminator: 1)
!924 = distinct !DILexicalBlock(scope: !925, file: !1, line: 739, column: 2)
!925 = distinct !DILexicalBlock(scope: !600, file: !1, line: 739, column: 2)
!926 = !DILocation(line: 740, column: 2, scope: !927)
!927 = !DILexicalBlockFile(scope: !928, file: !1, discriminator: 1)
!928 = distinct !DILexicalBlock(scope: !929, file: !1, line: 740, column: 2)
!929 = distinct !DILexicalBlock(scope: !600, file: !1, line: 740, column: 2)
!930 = !DILocation(line: 741, column: 2, scope: !931)
!931 = !DILexicalBlockFile(scope: !932, file: !1, discriminator: 1)
!932 = distinct !DILexicalBlock(scope: !933, file: !1, line: 741, column: 2)
!933 = distinct !DILexicalBlock(scope: !600, file: !1, line: 741, column: 2)
!934 = !DILocation(line: 742, column: 2, scope: !600)
!935 = !DILocation(line: 110, column: 11, scope: !936)
!936 = distinct !DILexicalBlock(scope: !202, file: !1, line: 100, column: 14)
!937 = distinct !{!937, !938, !"polly.alias.scope.call"}
!938 = distinct !{!938, !"polly.alias.scope.domain"}
!939 = distinct !{!939}
!940 = distinct !{!940, !941, !942, !943}
!941 = !{!"llvm.loop.unroll.runtime.disable"}
!942 = !{!"llvm.loop.vectorize.width", i32 1}
!943 = !{!"llvm.loop.interleave.count", i32 1}
!944 = distinct !{!944, !941, !942, !943}
!945 = distinct !{!945, !946, !"polly.alias.scope.call"}
!946 = distinct !{!946, !"polly.alias.scope.domain"}
!947 = !{!948, !949}
!948 = distinct !{!948, !946, !"polly.alias.scope.call24"}
!949 = distinct !{!949, !946, !"polly.alias.scope.call14"}
!950 = !{!948, !945}
!951 = distinct !{!951}
!952 = !{!945, !949}
!953 = distinct !{!953}
!954 = distinct !{!954, !942, !943}
!955 = distinct !{!955, !942, !943}
