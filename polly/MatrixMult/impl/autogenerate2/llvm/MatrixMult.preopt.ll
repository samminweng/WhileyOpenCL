; ModuleID = 'MatrixMult.preopt.s'
source_filename = "MatrixMult.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Matrix = type { i64*, i64, i64, i64 }

@.str = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c" data:\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c" width:\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"%lld\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c" height:\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [5 x i8] c"fail\00", align 1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @copy_Matrix(%struct.Matrix* %_Matrix) #0 !dbg !6 {
entry:
  br label %entry.split, !dbg !106

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %_Matrix, i64 0, metadata !107, metadata !108), !dbg !106
  %call = tail call noalias i8* @malloc(i64 32) #5, !dbg !109
  %0 = bitcast i8* %call to %struct.Matrix*, !dbg !109
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %0, i64 0, metadata !110, metadata !108), !dbg !111
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 1, !dbg !112
  %1 = load i64, i64* %data_size, align 8, !dbg !112
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8, !dbg !112
  %2 = bitcast i8* %data_size1 to i64*, !dbg !112
  store i64 %1, i64* %2, align 8, !dbg !112
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 0, !dbg !112
  %3 = load i64*, i64** %data, align 8, !dbg !112
  %data_size2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 1, !dbg !112
  %4 = load i64, i64* %data_size2, align 8, !dbg !112
  %call3 = tail call i64* @copy(i64* %3, i64 %4) #5, !dbg !112
  %data4 = bitcast i8* %call to i64**, !dbg !112
  store i64* %call3, i64** %data4, align 8, !dbg !112
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 2, !dbg !113
  %5 = load i64, i64* %width, align 8, !dbg !113
  %width5 = getelementptr inbounds i8, i8* %call, i64 16, !dbg !114
  %6 = bitcast i8* %width5 to i64*, !dbg !114
  store i64 %5, i64* %6, align 8, !dbg !115
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %_Matrix, i64 0, i32 3, !dbg !116
  %7 = load i64, i64* %height, align 8, !dbg !116
  %height6 = getelementptr inbounds i8, i8* %call, i64 24, !dbg !117
  %8 = bitcast i8* %height6 to i64*, !dbg !117
  store i64 %7, i64* %8, align 8, !dbg !118
  ret %struct.Matrix* %0, !dbg !119
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

declare i64* @copy(i64*, i64) #3

; Function Attrs: nounwind uwtable
define void @free_Matrix(%struct.Matrix* %matrix) #0 !dbg !20 {
entry:
  br label %entry.split, !dbg !120

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %matrix, i64 0, metadata !121, metadata !108), !dbg !120
  %0 = bitcast %struct.Matrix* %matrix to i8**, !dbg !122
  %1 = load i8*, i8** %0, align 8, !dbg !122
  tail call void @free(i8* %1) #5, !dbg !123
  %2 = bitcast %struct.Matrix* %matrix to i8*, !dbg !124
  tail call void @free(i8* %2) #5, !dbg !125
  ret void, !dbg !126
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define void @printf_Matrix(%struct.Matrix* %matrix) #0 !dbg !23 {
entry:
  br label %entry.split, !dbg !127

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %matrix, i64 0, metadata !128, metadata !108), !dbg !127
  %putchar = tail call i32 @putchar(i32 123) #5, !dbg !129
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)) #5, !dbg !130
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 0, !dbg !131
  %0 = load i64*, i64** %data, align 8, !dbg !131
  %data_size = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 1, !dbg !131
  %1 = load i64, i64* %data_size, align 8, !dbg !131
  tail call void @printf1DArray(i64* %0, i64 %1) #5, !dbg !131
  %call2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !132
  %width = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 2, !dbg !133
  %2 = load i64, i64* %width, align 8, !dbg !133
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %2) #5, !dbg !134
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0)) #5, !dbg !135
  %height = getelementptr inbounds %struct.Matrix, %struct.Matrix* %matrix, i64 0, i32 3, !dbg !136
  %3 = load i64, i64* %height, align 8, !dbg !136
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %3) #5, !dbg !137
  %putchar1 = tail call i32 @putchar(i32 125) #5, !dbg !138
  ret void, !dbg !139
}

declare i32 @printf(i8*, ...) #3

declare void @printf1DArray(i64*, i64) #3

; Function Attrs: nounwind uwtable
define %struct.Matrix* @matrix(i64 %width, i64 %height, i64* %data, i64 %data_size, i1 zeroext %data_has_ownership) #0 !dbg !24 {
entry:
  br label %entry.split, !dbg !140

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %width, i64 0, metadata !141, metadata !108), !dbg !140
  tail call void @llvm.dbg.value(metadata i64 %height, i64 0, metadata !142, metadata !108), !dbg !143
  tail call void @llvm.dbg.value(metadata i64* %data, i64 0, metadata !144, metadata !108), !dbg !145
  tail call void @llvm.dbg.value(metadata i64 %data_size, i64 0, metadata !146, metadata !108), !dbg !145
  tail call void @llvm.dbg.value(metadata i1 %data_has_ownership, i64 0, metadata !147, metadata !148), !dbg !149
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !150, metadata !108), !dbg !151
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !152, metadata !108), !dbg !153
  %call = tail call noalias i8* @malloc(i64 32) #5, !dbg !154
  %0 = bitcast i8* %call to %struct.Matrix*, !dbg !154
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %0, i64 0, metadata !155, metadata !108), !dbg !156
  %data_size1 = getelementptr inbounds i8, i8* %call, i64 8, !dbg !157
  %1 = bitcast i8* %data_size1 to i64*, !dbg !157
  store i64 %data_size, i64* %1, align 8, !dbg !157
  %call2 = tail call i64* @copy(i64* %data, i64 %data_size) #5, !dbg !157
  %data3 = bitcast i8* %call to i64**, !dbg !157
  store i64* %call2, i64** %data3, align 8, !dbg !157
  %height4 = getelementptr inbounds i8, i8* %call, i64 24, !dbg !158
  %2 = bitcast i8* %height4 to i64*, !dbg !158
  store i64 %height, i64* %2, align 8, !dbg !159
  %width5 = getelementptr inbounds i8, i8* %call, i64 16, !dbg !160
  %3 = bitcast i8* %width5 to i64*, !dbg !160
  store i64 %width, i64* %3, align 8, !dbg !161
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !152, metadata !108), !dbg !153
  br i1 %data_has_ownership, label %if.then7, label %if.end11, !dbg !162

if.then7:                                         ; preds = %entry.split
  %4 = bitcast i64* %data to i8*, !dbg !163
  tail call void @free(i8* %4) #5, !dbg !163
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !147, metadata !108), !dbg !149
  br label %if.end11, !dbg !163

if.end11:                                         ; preds = %entry.split, %if.then7
  ret %struct.Matrix* %0, !dbg !167
}

; Function Attrs: nounwind uwtable
define %struct.Matrix* @init(i64 %width, i64 %height) #0 !dbg !28 {
entry:
  br label %entry.split, !dbg !168

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i64 %width, i64 0, metadata !169, metadata !108), !dbg !168
  tail call void @llvm.dbg.value(metadata i64 %height, i64 0, metadata !170, metadata !108), !dbg !171
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !172, metadata !108), !dbg !173
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !174, metadata !108), !dbg !175
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !176, metadata !108), !dbg !175
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !177, metadata !108), !dbg !178
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !179, metadata !108), !dbg !180
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !181, metadata !108), !dbg !182
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !183, metadata !108), !dbg !184
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !185, metadata !108), !dbg !186
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !187, metadata !108), !dbg !188
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !189, metadata !108), !dbg !188
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !190, metadata !108), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !192, metadata !108), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !194, metadata !108), !dbg !195
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !196, metadata !108), !dbg !197
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !198, metadata !108), !dbg !199
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !200, metadata !108), !dbg !201
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !202, metadata !108), !dbg !203
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !204, metadata !108), !dbg !205
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !206, metadata !108), !dbg !207
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !208, metadata !108), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !210, metadata !108), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !212, metadata !108), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !214, metadata !108), !dbg !215
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !216, metadata !108), !dbg !217
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !183, metadata !108), !dbg !184
  %mul = mul nsw i64 %height, %width, !dbg !218
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !185, metadata !108), !dbg !186
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !189, metadata !108), !dbg !188
  %conv1 = trunc i64 %mul to i32, !dbg !219
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv1) #5, !dbg !219
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !187, metadata !108), !dbg !188
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !190, metadata !108), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !176, metadata !108), !dbg !175
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !174, metadata !108), !dbg !175
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !177, metadata !108), !dbg !178
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !190, metadata !108), !dbg !191
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !192, metadata !108), !dbg !193
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !179, metadata !108), !dbg !180
  %cmp3 = icmp sgt i64 %height, 0, !dbg !220
  br i1 %cmp3, label %while.body9.preheader.lr.ph, label %if.end23, !dbg !223

while.body9.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body9.preheader, !dbg !223

while.body9.preheader:                            ; preds = %while.body9.preheader.lr.ph, %blklab3
  %i.04 = phi i64 [ 0, %while.body9.preheader.lr.ph ], [ %add20, %blklab3 ]
  %cmp101 = icmp sgt i64 %width, 0, !dbg !224
  br i1 %cmp101, label %if.end13.lr.ph, label %blklab3, !dbg !227

if.end13.lr.ph:                                   ; preds = %while.body9.preheader
  br label %if.end13, !dbg !227

if.end13:                                         ; preds = %if.end13.lr.ph, %if.end13
  %j.02 = phi i64 [ 0, %if.end13.lr.ph ], [ %add19, %if.end13 ]
  %mul14 = mul nsw i64 %i.04, %width, !dbg !228
  tail call void @llvm.dbg.value(metadata i64 %mul14, i64 0, metadata !196, metadata !108), !dbg !197
  %add = add nsw i64 %j.02, %mul14, !dbg !229
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !198, metadata !108), !dbg !199
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %add, !dbg !230
  %0 = load i64, i64* %arrayidx, align 8, !dbg !230
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !200, metadata !108), !dbg !201
  %add15 = add nsw i64 %0, %i.04, !dbg !231
  tail call void @llvm.dbg.value(metadata i64 %add15, i64 0, metadata !202, metadata !108), !dbg !203
  %mul16 = mul nsw i64 %i.04, %width, !dbg !232
  tail call void @llvm.dbg.value(metadata i64 %mul16, i64 0, metadata !204, metadata !108), !dbg !205
  %add17 = add nsw i64 %j.02, %mul16, !dbg !233
  tail call void @llvm.dbg.value(metadata i64 %add17, i64 0, metadata !206, metadata !108), !dbg !207
  %arrayidx18 = getelementptr inbounds i64, i64* %call, i64 %add17, !dbg !234
  store i64 %add15, i64* %arrayidx18, align 8, !dbg !235
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !208, metadata !108), !dbg !209
  tail call void @llvm.dbg.value(metadata i64 %add19, i64 0, metadata !210, metadata !108), !dbg !211
  tail call void @llvm.dbg.value(metadata i64 %add19, i64 0, metadata !181, metadata !108), !dbg !182
  %add19 = add nuw nsw i64 %j.02, 1, !dbg !236
  %exitcond = icmp ne i64 %add19, %width, !dbg !227
  br i1 %exitcond, label %if.end13, label %while.body9.blklab3_crit_edge, !dbg !227

while.body9.blklab3_crit_edge:                    ; preds = %if.end13
  br label %blklab3, !dbg !227

blklab3:                                          ; preds = %while.body9.blklab3_crit_edge, %while.body9.preheader
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !212, metadata !108), !dbg !213
  tail call void @llvm.dbg.value(metadata i64 %add20, i64 0, metadata !214, metadata !108), !dbg !215
  tail call void @llvm.dbg.value(metadata i64 %add20, i64 0, metadata !179, metadata !108), !dbg !180
  %add20 = add nuw nsw i64 %i.04, 1, !dbg !237
  %exitcond6 = icmp ne i64 %add20, %height, !dbg !223
  br i1 %exitcond6, label %while.body9.preheader, label %while.body.if.end23_crit_edge, !dbg !223

while.body.if.end23_crit_edge:                    ; preds = %blklab3
  br label %if.end23, !dbg !223

if.end23:                                         ; preds = %while.body.if.end23_crit_edge, %entry.split
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !177, metadata !108), !dbg !178
  %call24 = tail call %struct.Matrix* @matrix(i64 %width, i64 %height, i64* %call, i64 %mul, i1 zeroext false), !dbg !238
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call24, i64 0, metadata !239, metadata !108), !dbg !240
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !216, metadata !108), !dbg !217
  %1 = bitcast i64* %call to i8*, !dbg !241
  tail call void @free(i8* %1) #5, !dbg !241
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !177, metadata !108), !dbg !178
  ret %struct.Matrix* %call24, !dbg !245
}

declare i64* @gen1DArray(i32, i32) #3

; Function Attrs: nounwind uwtable
define void @print_mat(%struct._IO_FILE* %sys, %struct.Matrix* %a, i1 zeroext %a_has_ownership) #0 !dbg !31 {
entry:
  br label %entry.split, !dbg !246

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata %struct._IO_FILE* %sys, i64 0, metadata !247, metadata !108), !dbg !246
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !248, metadata !108), !dbg !249
  tail call void @llvm.dbg.value(metadata i1 %a_has_ownership, i64 0, metadata !250, metadata !148), !dbg !251
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !252, metadata !108), !dbg !253
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !254, metadata !108), !dbg !255
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !256, metadata !108), !dbg !257
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !258, metadata !108), !dbg !259
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !260, metadata !108), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !262, metadata !108), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !264, metadata !108), !dbg !265
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !266, metadata !108), !dbg !267
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !268, metadata !108), !dbg !269
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !270, metadata !108), !dbg !269
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !271, metadata !108), !dbg !272
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !273, metadata !108), !dbg !274
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !275, metadata !108), !dbg !276
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !277, metadata !108), !dbg !278
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !279, metadata !108), !dbg !280
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !281, metadata !108), !dbg !280
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !282, metadata !108), !dbg !283
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !284, metadata !108), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !286, metadata !108), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !288, metadata !108), !dbg !289
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !290, metadata !108), !dbg !291
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !292, metadata !108), !dbg !293
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !294, metadata !108), !dbg !293
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !295, metadata !108), !dbg !296
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !260, metadata !108), !dbg !261
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !252, metadata !108), !dbg !253
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 2, !dbg !297
  %0 = load i64, i64* %width1, align 8, !dbg !297
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !262, metadata !108), !dbg !263
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !254, metadata !108), !dbg !255
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3, !dbg !298
  %1 = load i64, i64* %height2, align 8, !dbg !298
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !264, metadata !108), !dbg !265
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !256, metadata !108), !dbg !257
  %cmp9 = icmp sgt i64 %1, 0, !dbg !299
  br i1 %cmp9, label %while.body4.preheader.lr.ph, label %blklab6, !dbg !302

while.body4.preheader.lr.ph:                      ; preds = %entry.split
  br label %while.body4.preheader, !dbg !302

while.body4.preheader:                            ; preds = %while.body4.preheader.lr.ph, %if.end21
  %_25_has_ownership.015 = phi i1 [ false, %while.body4.preheader.lr.ph ], [ true, %if.end21 ]
  %2 = phi i8* [ null, %while.body4.preheader.lr.ph ], [ %call22, %if.end21 ]
  %i.013 = phi i64 [ 0, %while.body4.preheader.lr.ph ], [ %add18, %if.end21 ]
  %_12.012 = phi i64* [ null, %while.body4.preheader.lr.ph ], [ %_12.1.lcssa, %if.end21 ]
  %_12_has_ownership.011 = phi i8 [ 0, %while.body4.preheader.lr.ph ], [ %_12_has_ownership.1.lcssa, %if.end21 ]
  %_18_has_ownership.010 = phi i8 [ 0, %while.body4.preheader.lr.ph ], [ %_18_has_ownership.1.lcssa, %if.end21 ]
  %3 = phi i8* [ null, %while.body4.preheader.lr.ph ], [ %.lcssa, %if.end21 ]
  %cmp51 = icmp sgt i64 %0, 0, !dbg !303
  br i1 %cmp51, label %if.end7.lr.ph, label %blklab8, !dbg !306

if.end7.lr.ph:                                    ; preds = %while.body4.preheader
  br label %if.end7, !dbg !306

if.end7:                                          ; preds = %if.end7.lr.ph, %if.end14
  %j.05 = phi i64 [ 0, %if.end7.lr.ph ], [ %add17, %if.end14 ]
  %_12.14 = phi i64* [ %_12.012, %if.end7.lr.ph ], [ %call, %if.end14 ]
  %_12_has_ownership.13 = phi i8 [ %_12_has_ownership.011, %if.end7.lr.ph ], [ 1, %if.end14 ]
  %_18_has_ownership.12 = phi i8 [ %_18_has_ownership.010, %if.end7.lr.ph ], [ 1, %if.end14 ]
  %4 = phi i8* [ %3, %if.end7.lr.ph ], [ %call15, %if.end14 ]
  %5 = and i8 %_12_has_ownership.13, 1, !dbg !307
  %tobool = icmp eq i8 %5, 0, !dbg !307
  br i1 %tobool, label %if.end9, label %if.then8, !dbg !309

if.then8:                                         ; preds = %if.end7
  %6 = bitcast i64* %_12.14 to i8*, !dbg !310
  tail call void @free(i8* %6) #5, !dbg !310
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !271, metadata !108), !dbg !272
  br label %if.end9, !dbg !310

if.end9:                                          ; preds = %if.end7, %if.then8
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !313
  %7 = load i64*, i64** %data, align 8, !dbg !313
  %data_size10 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1, !dbg !313
  %8 = load i64, i64* %data_size10, align 8, !dbg !313
  %call = tail call i64* @copy(i64* %7, i64 %8) #5, !dbg !313
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !268, metadata !108), !dbg !269
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !271, metadata !108), !dbg !272
  %mul = mul nsw i64 %i.013, %0, !dbg !314
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !273, metadata !108), !dbg !274
  %add = add nsw i64 %j.05, %mul, !dbg !315
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !275, metadata !108), !dbg !276
  %arrayidx = getelementptr inbounds i64, i64* %call, i64 %add, !dbg !316
  %9 = load i64, i64* %arrayidx, align 8, !dbg !316
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !277, metadata !108), !dbg !278
  %call11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i64 %9) #5, !dbg !317
  %10 = and i8 %_18_has_ownership.12, 1, !dbg !318
  %tobool12 = icmp eq i8 %10, 0, !dbg !318
  br i1 %tobool12, label %if.end14, label %if.then13, !dbg !320

if.then13:                                        ; preds = %if.end9
  tail call void @free(i8* %4) #5, !dbg !321
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !282, metadata !108), !dbg !283
  br label %if.end14, !dbg !321

if.end14:                                         ; preds = %if.end9, %if.then13
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !281, metadata !108), !dbg !280
  %call15 = tail call noalias i8* @malloc(i64 8) #5, !dbg !324
  %11 = bitcast i8* %call15 to i64*, !dbg !324
  tail call void @llvm.dbg.value(metadata i64* %11, i64 0, metadata !279, metadata !108), !dbg !280
  store i64 32, i64* %11, align 8, !dbg !325
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !282, metadata !108), !dbg !283
  tail call void @printf_s(i64* %11, i64 1) #5, !dbg !326
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !284, metadata !108), !dbg !285
  tail call void @llvm.dbg.value(metadata i64 %add17, i64 0, metadata !286, metadata !108), !dbg !287
  tail call void @llvm.dbg.value(metadata i64 %add17, i64 0, metadata !258, metadata !108), !dbg !259
  %add17 = add nuw nsw i64 %j.05, 1, !dbg !327
  %exitcond = icmp ne i64 %add17, %0, !dbg !306
  br i1 %exitcond, label %if.end7, label %while.body4.blklab8_crit_edge, !dbg !306

while.body4.blklab8_crit_edge:                    ; preds = %if.end14
  %call15.lcssa = phi i8* [ %call15, %if.end14 ]
  %call.lcssa = phi i64* [ %call, %if.end14 ]
  br label %blklab8, !dbg !306

blklab8:                                          ; preds = %while.body4.blklab8_crit_edge, %while.body4.preheader
  %_12.1.lcssa = phi i64* [ %call.lcssa, %while.body4.blklab8_crit_edge ], [ %_12.012, %while.body4.preheader ]
  %_12_has_ownership.1.lcssa = phi i8 [ 1, %while.body4.blklab8_crit_edge ], [ %_12_has_ownership.011, %while.body4.preheader ]
  %_18_has_ownership.1.lcssa = phi i8 [ 1, %while.body4.blklab8_crit_edge ], [ %_18_has_ownership.010, %while.body4.preheader ]
  %.lcssa = phi i8* [ %call15.lcssa, %while.body4.blklab8_crit_edge ], [ %3, %while.body4.preheader ]
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !288, metadata !108), !dbg !289
  %add18 = add nuw nsw i64 %i.013, 1, !dbg !328
  tail call void @llvm.dbg.value(metadata i64 %add18, i64 0, metadata !290, metadata !108), !dbg !291
  tail call void @llvm.dbg.value(metadata i64 %add18, i64 0, metadata !252, metadata !108), !dbg !253
  br i1 %_25_has_ownership.015, label %if.then20, label %if.end21, !dbg !329

if.then20:                                        ; preds = %blklab8
  tail call void @free(i8* %2) #5, !dbg !330
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !295, metadata !108), !dbg !296
  br label %if.end21, !dbg !330

if.end21:                                         ; preds = %if.then20, %blklab8
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !294, metadata !108), !dbg !293
  %call22 = tail call noalias i8* @malloc(i64 0) #5, !dbg !334
  %12 = bitcast i8* %call22 to i64*, !dbg !334
  tail call void @llvm.dbg.value(metadata i64* %12, i64 0, metadata !292, metadata !108), !dbg !293
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !295, metadata !108), !dbg !296
  tail call void @println_s(i64* %12, i64 0) #5, !dbg !335
  %exitcond16 = icmp ne i64 %add18, %1, !dbg !302
  br i1 %exitcond16, label %while.body4.preheader, label %while.body.blklab6_crit_edge, !dbg !302

while.body.blklab6_crit_edge:                     ; preds = %if.end21
  br label %blklab6, !dbg !302

blklab6:                                          ; preds = %while.body.blklab6_crit_edge, %entry.split
  ret void, !dbg !336
}

declare void @printf_s(i64*, i64) #3

declare void @println_s(i64*, i64) #3

; Function Attrs: nounwind uwtable
define %struct.Matrix* @mat_mult(%struct.Matrix* %a, i1 zeroext %a_has_ownership, %struct.Matrix* %b, i1 zeroext %b_has_ownership) #0 !dbg !96 {
entry:
  br label %entry.split, !dbg !337

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %a, i64 0, metadata !338, metadata !108), !dbg !337
  tail call void @llvm.dbg.value(metadata i1 %a_has_ownership, i64 0, metadata !339, metadata !148), !dbg !340
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %b, i64 0, metadata !341, metadata !108), !dbg !342
  tail call void @llvm.dbg.value(metadata i1 %b_has_ownership, i64 0, metadata !343, metadata !148), !dbg !344
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !345, metadata !108), !dbg !346
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !347, metadata !108), !dbg !348
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !349, metadata !108), !dbg !350
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !351, metadata !108), !dbg !352
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !353, metadata !108), !dbg !352
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !354, metadata !108), !dbg !355
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !356, metadata !108), !dbg !357
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !358, metadata !108), !dbg !357
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !359, metadata !108), !dbg !360
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !361, metadata !108), !dbg !362
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !363, metadata !108), !dbg !362
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !364, metadata !108), !dbg !365
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !366, metadata !108), !dbg !367
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !368, metadata !108), !dbg !367
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !369, metadata !108), !dbg !370
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !371, metadata !108), !dbg !372
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !373, metadata !108), !dbg !374
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !375, metadata !108), !dbg !376
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !377, metadata !108), !dbg !378
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !379, metadata !108), !dbg !380
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !381, metadata !108), !dbg !382
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !383, metadata !108), !dbg !384
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !385, metadata !108), !dbg !386
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !387, metadata !108), !dbg !386
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !388, metadata !108), !dbg !389
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !390, metadata !108), !dbg !391
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !392, metadata !108), !dbg !391
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !393, metadata !108), !dbg !394
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !395, metadata !108), !dbg !396
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !397, metadata !108), !dbg !396
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !398, metadata !108), !dbg !399
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !400, metadata !108), !dbg !401
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !402, metadata !108), !dbg !403
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !404, metadata !108), !dbg !405
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !406, metadata !108), !dbg !405
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !407, metadata !108), !dbg !408
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !409, metadata !108), !dbg !410
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !411, metadata !108), !dbg !412
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !413, metadata !108), !dbg !414
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !415, metadata !108), !dbg !416
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !417, metadata !108), !dbg !418
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !419, metadata !108), !dbg !420
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !421, metadata !108), !dbg !422
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !423, metadata !108), !dbg !424
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !425, metadata !108), !dbg !426
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !427, metadata !108), !dbg !428
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !429, metadata !108), !dbg !430
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !431, metadata !108), !dbg !432
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !433, metadata !108), !dbg !434
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !435, metadata !108), !dbg !436
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !437, metadata !108), !dbg !438
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !439, metadata !108), !dbg !440
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !441, metadata !108), !dbg !442
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !443, metadata !108), !dbg !444
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !445, metadata !108), !dbg !446
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !447, metadata !108), !dbg !448
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !449, metadata !108), !dbg !450
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !451, metadata !108), !dbg !452
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !453, metadata !108), !dbg !454
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !455, metadata !108), !dbg !456
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !457, metadata !108), !dbg !458
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !459, metadata !108), !dbg !460
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !461, metadata !108), !dbg !462
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !463, metadata !108), !dbg !464
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !465, metadata !108), !dbg !466
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !467, metadata !108), !dbg !468
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !469, metadata !108), !dbg !470
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !471, metadata !108), !dbg !472
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !473, metadata !108), !dbg !474
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !475, metadata !108), !dbg !476
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !477, metadata !108), !dbg !478
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !479, metadata !108), !dbg !480
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !481, metadata !108), !dbg !482
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 2, !dbg !483
  %0 = load i64, i64* %width2, align 8, !dbg !483
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !377, metadata !108), !dbg !378
  tail call void @llvm.dbg.value(metadata i64 %0, i64 0, metadata !347, metadata !108), !dbg !348
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 3, !dbg !484
  %1 = load i64, i64* %height3, align 8, !dbg !484
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !379, metadata !108), !dbg !380
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !349, metadata !108), !dbg !350
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !381, metadata !108), !dbg !382
  %mul = mul nsw i64 %1, %0, !dbg !485
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !383, metadata !108), !dbg !384
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !387, metadata !108), !dbg !386
  %conv4 = trunc i64 %mul to i32, !dbg !486
  %call = tail call i64* @gen1DArray(i32 0, i32 %conv4) #5, !dbg !486
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !385, metadata !108), !dbg !386
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !388, metadata !108), !dbg !389
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !353, metadata !108), !dbg !352
  tail call void @llvm.dbg.value(metadata i64* %call, i64 0, metadata !351, metadata !108), !dbg !352
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !354, metadata !108), !dbg !355
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !388, metadata !108), !dbg !389
  %data12 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 0, !dbg !487
  %2 = load i64*, i64** %data12, align 8, !dbg !487
  %data_size13 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %a, i64 0, i32 1, !dbg !487
  %3 = load i64, i64* %data_size13, align 8, !dbg !487
  %call14 = tail call i64* @copy(i64* %2, i64 %3) #5, !dbg !487
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !390, metadata !108), !dbg !391
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !393, metadata !108), !dbg !394
  tail call void @llvm.dbg.value(metadata i64* %call14, i64 0, metadata !356, metadata !108), !dbg !357
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !359, metadata !108), !dbg !360
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !393, metadata !108), !dbg !394
  %data22 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 0, !dbg !488
  %4 = load i64*, i64** %data22, align 8, !dbg !488
  %data_size23 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %b, i64 0, i32 1, !dbg !488
  %5 = load i64, i64* %data_size23, align 8, !dbg !488
  %call24 = tail call i64* @copy(i64* %4, i64 %5) #5, !dbg !488
  tail call void @llvm.dbg.value(metadata i64* %call24, i64 0, metadata !395, metadata !108), !dbg !396
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !398, metadata !108), !dbg !399
  tail call void @llvm.dbg.value(metadata i64* %call24, i64 0, metadata !361, metadata !108), !dbg !362
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !364, metadata !108), !dbg !365
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !398, metadata !108), !dbg !399
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !400, metadata !108), !dbg !401
  %mul28 = mul nsw i64 %1, %0, !dbg !489
  tail call void @llvm.dbg.value(metadata i64 %mul28, i64 0, metadata !402, metadata !108), !dbg !403
  tail call void @llvm.dbg.value(metadata i64 %mul28, i64 0, metadata !406, metadata !108), !dbg !405
  %conv33 = trunc i64 %mul28 to i32, !dbg !490
  %call34 = tail call i64* @gen1DArray(i32 0, i32 %conv33) #5, !dbg !490
  tail call void @llvm.dbg.value(metadata i64* %call34, i64 0, metadata !404, metadata !108), !dbg !405
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !407, metadata !108), !dbg !408
  tail call void @llvm.dbg.value(metadata i64 %mul28, i64 0, metadata !368, metadata !108), !dbg !367
  tail call void @llvm.dbg.value(metadata i64* %call34, i64 0, metadata !366, metadata !108), !dbg !367
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !369, metadata !108), !dbg !370
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !407, metadata !108), !dbg !408
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !409, metadata !108), !dbg !410
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !371, metadata !108), !dbg !372
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !411, metadata !108), !dbg !412
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !373, metadata !108), !dbg !374
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !413, metadata !108), !dbg !414
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !375, metadata !108), !dbg !376
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !415, metadata !108), !dbg !416
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !371, metadata !108), !dbg !372
  %cmp11 = icmp sgt i64 %1, 0, !dbg !491
  br i1 %cmp11, label %while.body42.preheader.lr.ph, label %while.body53.preheader, !dbg !494

while.body42.preheader.lr.ph:                     ; preds = %entry.split
  br label %while.body42.preheader, !dbg !494

while.body42.preheader:                           ; preds = %while.body42.preheader.lr.ph, %blklab14
  %i.012 = phi i64 [ 0, %while.body42.preheader.lr.ph ], [ %add52, %blklab14 ]
  %cmp439 = icmp sgt i64 %0, 0, !dbg !495
  br i1 %cmp439, label %if.end46.lr.ph, label %blklab14, !dbg !498

if.end46.lr.ph:                                   ; preds = %while.body42.preheader
  br label %if.end46, !dbg !498

while.body.while.body53.preheader_crit_edge:      ; preds = %blklab14
  br label %while.body53.preheader, !dbg !494

while.body53.preheader:                           ; preds = %while.body.while.body53.preheader_crit_edge, %entry.split
  %cmp546 = icmp sgt i64 %1, 0, !dbg !499
  br i1 %cmp546, label %while.body59.preheader.lr.ph, label %if.end89, !dbg !502

while.body59.preheader.lr.ph:                     ; preds = %while.body53.preheader
  br label %while.body59.preheader, !dbg !502

if.end46:                                         ; preds = %if.end46.lr.ph, %if.end46
  %j.010 = phi i64 [ 0, %if.end46.lr.ph ], [ %add51, %if.end46 ]
  %mul47 = mul nsw i64 %i.012, %0, !dbg !503
  tail call void @llvm.dbg.value(metadata i64 %mul47, i64 0, metadata !419, metadata !108), !dbg !420
  %add = add nsw i64 %j.010, %mul47, !dbg !504
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !421, metadata !108), !dbg !422
  %arrayidx = getelementptr inbounds i64, i64* %call24, i64 %add, !dbg !505
  %6 = load i64, i64* %arrayidx, align 8, !dbg !505
  tail call void @llvm.dbg.value(metadata i64 %6, i64 0, metadata !423, metadata !108), !dbg !424
  %mul48 = mul nsw i64 %j.010, %0, !dbg !506
  tail call void @llvm.dbg.value(metadata i64 %mul48, i64 0, metadata !425, metadata !108), !dbg !426
  %add49 = add nsw i64 %mul48, %i.012, !dbg !507
  tail call void @llvm.dbg.value(metadata i64 %add49, i64 0, metadata !427, metadata !108), !dbg !428
  %arrayidx50 = getelementptr inbounds i64, i64* %call34, i64 %add49, !dbg !508
  store i64 %6, i64* %arrayidx50, align 8, !dbg !509
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !429, metadata !108), !dbg !430
  tail call void @llvm.dbg.value(metadata i64 %add51, i64 0, metadata !431, metadata !108), !dbg !432
  tail call void @llvm.dbg.value(metadata i64 %add51, i64 0, metadata !373, metadata !108), !dbg !374
  %add51 = add nuw nsw i64 %j.010, 1, !dbg !510
  %exitcond16 = icmp ne i64 %add51, %0, !dbg !498
  br i1 %exitcond16, label %if.end46, label %while.body42.blklab14_crit_edge, !dbg !498

while.body42.blklab14_crit_edge:                  ; preds = %if.end46
  br label %blklab14, !dbg !498

blklab14:                                         ; preds = %while.body42.blklab14_crit_edge, %while.body42.preheader
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !433, metadata !108), !dbg !434
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !435, metadata !108), !dbg !436
  tail call void @llvm.dbg.value(metadata i64 %add52, i64 0, metadata !371, metadata !108), !dbg !372
  %add52 = add nuw nsw i64 %i.012, 1, !dbg !511
  %exitcond17 = icmp ne i64 %add52, %1, !dbg !494
  br i1 %exitcond17, label %while.body42.preheader, label %while.body.while.body53.preheader_crit_edge, !dbg !494

while.body59.preheader:                           ; preds = %while.body59.preheader.lr.ph, %blklab18
  %i.17 = phi i64 [ 0, %while.body59.preheader.lr.ph ], [ %add86, %blklab18 ]
  %cmp603 = icmp sgt i64 %0, 0, !dbg !512
  br i1 %cmp603, label %while.body65.preheader.lr.ph, label %blklab18, !dbg !515

while.body65.preheader.lr.ph:                     ; preds = %while.body59.preheader
  br label %while.body65.preheader, !dbg !515

while.body65.preheader:                           ; preds = %while.body65.preheader.lr.ph, %blklab20
  %j.14 = phi i64 [ 0, %while.body65.preheader.lr.ph ], [ %add85, %blklab20 ]
  %cmp661 = icmp sgt i64 %0, 0, !dbg !516
  br i1 %cmp661, label %if.end69.lr.ph, label %blklab20, !dbg !519

if.end69.lr.ph:                                   ; preds = %while.body65.preheader
  br label %if.end69, !dbg !519

if.end69:                                         ; preds = %if.end69.lr.ph, %if.end69
  %k.02 = phi i64 [ 0, %if.end69.lr.ph ], [ %add84, %if.end69 ]
  %mul70 = mul nsw i64 %i.17, %0, !dbg !520
  tail call void @llvm.dbg.value(metadata i64 %mul70, i64 0, metadata !443, metadata !108), !dbg !444
  %add71 = add nsw i64 %j.14, %mul70, !dbg !521
  tail call void @llvm.dbg.value(metadata i64 %add71, i64 0, metadata !445, metadata !108), !dbg !446
  %arrayidx72 = getelementptr inbounds i64, i64* %call, i64 %add71, !dbg !522
  %7 = load i64, i64* %arrayidx72, align 8, !dbg !522
  tail call void @llvm.dbg.value(metadata i64 %7, i64 0, metadata !447, metadata !108), !dbg !448
  %mul73 = mul nsw i64 %i.17, %0, !dbg !523
  tail call void @llvm.dbg.value(metadata i64 %mul73, i64 0, metadata !449, metadata !108), !dbg !450
  %add74 = add nsw i64 %k.02, %mul73, !dbg !524
  tail call void @llvm.dbg.value(metadata i64 %add74, i64 0, metadata !451, metadata !108), !dbg !452
  %arrayidx75 = getelementptr inbounds i64, i64* %call14, i64 %add74, !dbg !525
  %8 = load i64, i64* %arrayidx75, align 8, !dbg !525
  tail call void @llvm.dbg.value(metadata i64 %8, i64 0, metadata !453, metadata !108), !dbg !454
  %mul76 = mul nsw i64 %i.17, %0, !dbg !526
  tail call void @llvm.dbg.value(metadata i64 %mul76, i64 0, metadata !455, metadata !108), !dbg !456
  %add77 = add nsw i64 %k.02, %mul76, !dbg !527
  tail call void @llvm.dbg.value(metadata i64 %add77, i64 0, metadata !457, metadata !108), !dbg !458
  %arrayidx78 = getelementptr inbounds i64, i64* %call34, i64 %add77, !dbg !528
  %9 = load i64, i64* %arrayidx78, align 8, !dbg !528
  tail call void @llvm.dbg.value(metadata i64 %9, i64 0, metadata !459, metadata !108), !dbg !460
  %mul79 = mul nsw i64 %9, %8, !dbg !529
  tail call void @llvm.dbg.value(metadata i64 %mul79, i64 0, metadata !461, metadata !108), !dbg !462
  %add80 = add nsw i64 %mul79, %7, !dbg !530
  tail call void @llvm.dbg.value(metadata i64 %add80, i64 0, metadata !463, metadata !108), !dbg !464
  %mul81 = mul nsw i64 %i.17, %0, !dbg !531
  tail call void @llvm.dbg.value(metadata i64 %mul81, i64 0, metadata !465, metadata !108), !dbg !466
  %add82 = add nsw i64 %j.14, %mul81, !dbg !532
  tail call void @llvm.dbg.value(metadata i64 %add82, i64 0, metadata !467, metadata !108), !dbg !468
  %arrayidx83 = getelementptr inbounds i64, i64* %call, i64 %add82, !dbg !533
  store i64 %add80, i64* %arrayidx83, align 8, !dbg !534
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !469, metadata !108), !dbg !470
  tail call void @llvm.dbg.value(metadata i64 %add84, i64 0, metadata !471, metadata !108), !dbg !472
  tail call void @llvm.dbg.value(metadata i64 %add84, i64 0, metadata !375, metadata !108), !dbg !376
  %add84 = add nuw nsw i64 %k.02, 1, !dbg !535
  %exitcond = icmp ne i64 %add84, %0, !dbg !519
  br i1 %exitcond, label %if.end69, label %while.body65.blklab20_crit_edge, !dbg !519

while.body65.blklab20_crit_edge:                  ; preds = %if.end69
  br label %blklab20, !dbg !519

blklab20:                                         ; preds = %while.body65.blklab20_crit_edge, %while.body65.preheader
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !473, metadata !108), !dbg !474
  tail call void @llvm.dbg.value(metadata i64 %add85, i64 0, metadata !475, metadata !108), !dbg !476
  tail call void @llvm.dbg.value(metadata i64 %add85, i64 0, metadata !373, metadata !108), !dbg !374
  %add85 = add nuw nsw i64 %j.14, 1, !dbg !536
  %exitcond14 = icmp ne i64 %add85, %0, !dbg !515
  br i1 %exitcond14, label %while.body65.preheader, label %while.body59.blklab18_crit_edge, !dbg !515

while.body59.blklab18_crit_edge:                  ; preds = %blklab20
  br label %blklab18, !dbg !515

blklab18:                                         ; preds = %while.body59.blklab18_crit_edge, %while.body59.preheader
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !477, metadata !108), !dbg !478
  tail call void @llvm.dbg.value(metadata i64 %add86, i64 0, metadata !479, metadata !108), !dbg !480
  tail call void @llvm.dbg.value(metadata i64 %add86, i64 0, metadata !371, metadata !108), !dbg !372
  %add86 = add nuw nsw i64 %i.17, 1, !dbg !537
  %exitcond15 = icmp ne i64 %add86, %1, !dbg !502
  br i1 %exitcond15, label %while.body59.preheader, label %while.body53.if.end89_crit_edge, !dbg !502

while.body53.if.end89_crit_edge:                  ; preds = %blklab18
  br label %if.end89, !dbg !502

if.end89:                                         ; preds = %while.body53.if.end89_crit_edge, %while.body53.preheader
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !354, metadata !108), !dbg !355
  %call90 = tail call %struct.Matrix* @matrix(i64 %0, i64 %1, i64* %call, i64 %mul, i1 zeroext false), !dbg !538
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call90, i64 0, metadata !539, metadata !108), !dbg !540
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !481, metadata !108), !dbg !482
  br i1 %a_has_ownership, label %if.then92, label %if.end93, !dbg !541

if.then92:                                        ; preds = %if.end89
  tail call void @free_Matrix(%struct.Matrix* %a), !dbg !542
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !339, metadata !108), !dbg !340
  br label %if.end93, !dbg !542

if.end93:                                         ; preds = %if.then92, %if.end89
  br i1 %b_has_ownership, label %if.then95, label %if.then101, !dbg !546

if.then95:                                        ; preds = %if.end93
  tail call void @free_Matrix(%struct.Matrix* %b), !dbg !547
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !343, metadata !108), !dbg !344
  br label %if.then101, !dbg !547

if.then101:                                       ; preds = %if.then95, %if.end93
  %10 = bitcast i64* %call to i8*, !dbg !551
  tail call void @free(i8* %10) #5, !dbg !551
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !354, metadata !108), !dbg !355
  %11 = bitcast i64* %call14 to i8*, !dbg !555
  tail call void @free(i8* %11) #5, !dbg !555
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !359, metadata !108), !dbg !360
  %12 = bitcast i64* %call24 to i8*, !dbg !559
  tail call void @free(i8* %12) #5, !dbg !559
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !364, metadata !108), !dbg !365
  %13 = bitcast i64* %call34 to i8*, !dbg !563
  tail call void @free(i8* %13) #5, !dbg !563
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !369, metadata !108), !dbg !370
  ret %struct.Matrix* %call90, !dbg !567
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !99 {
entry:
  br label %entry.split, !dbg !568

entry.split:                                      ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !569, metadata !108), !dbg !568
  tail call void @llvm.dbg.value(metadata i8** %args, i64 0, metadata !570, metadata !108), !dbg !571
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !572, metadata !108), !dbg !573
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !574, metadata !108), !dbg !575
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !576, metadata !108), !dbg !577
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !578, metadata !108), !dbg !579
  tail call void @llvm.dbg.value(metadata i64** null, i64 0, metadata !580, metadata !108), !dbg !582
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !583, metadata !108), !dbg !582
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !584, metadata !108), !dbg !582
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !585, metadata !108), !dbg !586
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !587, metadata !108), !dbg !588
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !589, metadata !108), !dbg !590
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !591, metadata !108), !dbg !590
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !592, metadata !108), !dbg !593
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !594, metadata !108), !dbg !595
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !596, metadata !108), !dbg !595
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !597, metadata !108), !dbg !598
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !599, metadata !108), !dbg !600
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !601, metadata !108), !dbg !602
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !603, metadata !108), !dbg !604
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !605, metadata !108), !dbg !606
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !607, metadata !108), !dbg !606
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !608, metadata !108), !dbg !609
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !610, metadata !108), !dbg !611
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !612, metadata !108), !dbg !613
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !614, metadata !108), !dbg !615
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !616, metadata !108), !dbg !617
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !618, metadata !108), !dbg !619
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !620, metadata !108), !dbg !621
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !622, metadata !108), !dbg !623
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !624, metadata !108), !dbg !625
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !626, metadata !108), !dbg !627
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !628, metadata !108), !dbg !629
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !630, metadata !108), !dbg !629
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !631, metadata !108), !dbg !632
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !633, metadata !108), !dbg !634
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !635, metadata !108), !dbg !636
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !637, metadata !108), !dbg !638
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !639, metadata !108), !dbg !640
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !641, metadata !108), !dbg !642
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !643, metadata !108), !dbg !644
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !645, metadata !108), !dbg !646
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !647, metadata !108), !dbg !648
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !649, metadata !108), !dbg !650
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !651, metadata !108), !dbg !652
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !653, metadata !108), !dbg !654
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !655, metadata !108), !dbg !654
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !656, metadata !108), !dbg !657
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !658, metadata !108), !dbg !659
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !660, metadata !108), !dbg !661
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !662, metadata !108), !dbg !663
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !664, metadata !108), !dbg !665
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !666, metadata !108), !dbg !667
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !668, metadata !108), !dbg !669
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !670, metadata !108), !dbg !671
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !672, metadata !108), !dbg !673
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !674, metadata !108), !dbg !675
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !676, metadata !108), !dbg !675
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !677, metadata !108), !dbg !678
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !679, metadata !108), !dbg !680
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !681, metadata !108), !dbg !680
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !682, metadata !108), !dbg !683
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !684, metadata !108), !dbg !685
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !686, metadata !108), !dbg !687
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !688, metadata !108), !dbg !689
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !690, metadata !108), !dbg !691
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !692, metadata !108), !dbg !693
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !694, metadata !108), !dbg !695
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !696, metadata !108), !dbg !697
  tail call void @llvm.dbg.value(metadata i64* null, i64 0, metadata !698, metadata !108), !dbg !699
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !700, metadata !108), !dbg !699
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !701, metadata !108), !dbg !702
  %call = tail call i64** @convertArgsToIntArray(i32 %argc, i8** %args) #5, !dbg !703
  tail call void @llvm.dbg.value(metadata i64** %call, i64 0, metadata !580, metadata !108), !dbg !582
  %sub = add nsw i32 %argc, -1, !dbg !703
  %conv = sext i32 %sub to i64, !dbg !703
  tail call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !583, metadata !108), !dbg !582
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !585, metadata !108), !dbg !586
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !587, metadata !108), !dbg !588
  %0 = load i64*, i64** %call, align 8, !dbg !704
  tail call void @llvm.dbg.value(metadata i64* %0, i64 0, metadata !589, metadata !108), !dbg !590
  %call1 = tail call i64* @parseStringToInt(i64* %0) #5, !dbg !705
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !706, metadata !108), !dbg !707
  tail call void @llvm.dbg.value(metadata i64* %call1, i64 0, metadata !708, metadata !108), !dbg !709
  %cmp = icmp eq i64* %call1, null, !dbg !710
  br i1 %cmp, label %blklab23, label %if.end, !dbg !712

if.end:                                           ; preds = %entry.split
  %1 = load i64, i64* %call1, align 8, !dbg !713
  tail call void @llvm.dbg.value(metadata i64 %1, i64 0, metadata !572, metadata !108), !dbg !573
  tail call void @llvm.dbg.value(metadata i64 7, i64 0, metadata !596, metadata !108), !dbg !595
  %call5 = tail call noalias i8* @malloc(i64 56) #5, !dbg !714
  %2 = bitcast i8* %call5 to i64*, !dbg !714
  tail call void @llvm.dbg.value(metadata i64* %2, i64 0, metadata !594, metadata !108), !dbg !595
  store i64 115, i64* %2, align 8, !dbg !715
  %arrayidx7 = getelementptr inbounds i8, i8* %call5, i64 8, !dbg !716
  %3 = bitcast i8* %arrayidx7 to i64*, !dbg !716
  store i64 105, i64* %3, align 8, !dbg !717
  %arrayidx8 = getelementptr inbounds i8, i8* %call5, i64 16, !dbg !718
  %4 = bitcast i8* %arrayidx8 to i64*, !dbg !718
  store i64 122, i64* %4, align 8, !dbg !719
  %arrayidx9 = getelementptr inbounds i8, i8* %call5, i64 24, !dbg !720
  %5 = bitcast i8* %arrayidx9 to i64*, !dbg !720
  store i64 101, i64* %5, align 8, !dbg !721
  %arrayidx10 = getelementptr inbounds i8, i8* %call5, i64 32, !dbg !722
  %6 = bitcast i8* %arrayidx10 to i64*, !dbg !722
  store i64 32, i64* %6, align 8, !dbg !723
  %arrayidx11 = getelementptr inbounds i8, i8* %call5, i64 40, !dbg !724
  %7 = bitcast i8* %arrayidx11 to i64*, !dbg !724
  store i64 61, i64* %7, align 8, !dbg !725
  %arrayidx12 = getelementptr inbounds i8, i8* %call5, i64 48, !dbg !726
  %8 = bitcast i8* %arrayidx12 to i64*, !dbg !726
  store i64 32, i64* %8, align 8, !dbg !727
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !597, metadata !108), !dbg !598
  tail call void @printf_s(i64* %2, i64 7) #5, !dbg !728
  %call13 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %1) #5, !dbg !729
  %call17 = tail call %struct.Matrix* @init(i64 %1, i64 %1), !dbg !730
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call17, i64 0, metadata !731, metadata !108), !dbg !732
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !599, metadata !108), !dbg !600
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call17, i64 0, metadata !733, metadata !108), !dbg !734
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !574, metadata !108), !dbg !575
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !599, metadata !108), !dbg !600
  %call24 = tail call %struct.Matrix* @init(i64 %1, i64 %1), !dbg !735
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call24, i64 0, metadata !736, metadata !108), !dbg !737
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !601, metadata !108), !dbg !602
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call24, i64 0, metadata !738, metadata !108), !dbg !739
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !576, metadata !108), !dbg !577
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !601, metadata !108), !dbg !602
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !574, metadata !108), !dbg !575
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !576, metadata !108), !dbg !577
  %call31 = tail call %struct.Matrix* @mat_mult(%struct.Matrix* %call17, i1 zeroext false, %struct.Matrix* %call24, i1 zeroext false), !dbg !740
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call31, i64 0, metadata !741, metadata !108), !dbg !742
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !603, metadata !108), !dbg !604
  tail call void @llvm.dbg.value(metadata %struct.Matrix* %call31, i64 0, metadata !743, metadata !108), !dbg !744
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !578, metadata !108), !dbg !579
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !603, metadata !108), !dbg !604
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call17, i64 0, i32 0, !dbg !745
  %9 = load i64*, i64** %data, align 8, !dbg !745
  %data_size38 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call17, i64 0, i32 1, !dbg !745
  %10 = load i64, i64* %data_size38, align 8, !dbg !745
  %call39 = tail call i64* @copy(i64* %9, i64 %10) #5, !dbg !745
  tail call void @llvm.dbg.value(metadata i64* %call39, i64 0, metadata !605, metadata !108), !dbg !606
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !608, metadata !108), !dbg !609
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !610, metadata !108), !dbg !611
  %add = mul i64 %1, %1, !dbg !747
  tail call void @llvm.dbg.value(metadata i64 %add, i64 0, metadata !616, metadata !108), !dbg !617
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !618, metadata !108), !dbg !619
  %sub41 = add nsw i64 %add, -1, !dbg !748
  tail call void @llvm.dbg.value(metadata i64 %sub41, i64 0, metadata !620, metadata !108), !dbg !621
  %arrayidx42 = getelementptr inbounds i64, i64* %call39, i64 %sub41, !dbg !749
  %11 = load i64, i64* %arrayidx42, align 8, !dbg !749
  tail call void @llvm.dbg.value(metadata i64 %11, i64 0, metadata !622, metadata !108), !dbg !623
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !624, metadata !108), !dbg !625
  %sub43 = add nsw i64 %1, -1, !dbg !750
  tail call void @llvm.dbg.value(metadata i64 %sub43, i64 0, metadata !626, metadata !108), !dbg !627
  %cmp44 = icmp eq i64 %11, %sub43, !dbg !751
  br i1 %cmp44, label %if.end51, label %if.end47, !dbg !753

if.end47:                                         ; preds = %if.end
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !754
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %12) #6, !dbg !755
  tail call void @exit(i32 -1) #7, !dbg !756
  unreachable, !dbg !756

if.end51:                                         ; preds = %if.end
  %data53 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call24, i64 0, i32 0, !dbg !757
  %14 = load i64*, i64** %data53, align 8, !dbg !757
  %data_size54 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call24, i64 0, i32 1, !dbg !757
  %15 = load i64, i64* %data_size54, align 8, !dbg !757
  %call55 = tail call i64* @copy(i64* %14, i64 %15) #5, !dbg !757
  tail call void @llvm.dbg.value(metadata i64* %call55, i64 0, metadata !628, metadata !108), !dbg !629
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !631, metadata !108), !dbg !632
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !633, metadata !108), !dbg !634
  %add58 = mul i64 %1, %1, !dbg !759
  tail call void @llvm.dbg.value(metadata i64 %add58, i64 0, metadata !639, metadata !108), !dbg !640
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !641, metadata !108), !dbg !642
  %sub59 = add nsw i64 %add58, -1, !dbg !760
  tail call void @llvm.dbg.value(metadata i64 %sub59, i64 0, metadata !643, metadata !108), !dbg !644
  %arrayidx60 = getelementptr inbounds i64, i64* %call55, i64 %sub59, !dbg !761
  %16 = load i64, i64* %arrayidx60, align 8, !dbg !761
  tail call void @llvm.dbg.value(metadata i64 %16, i64 0, metadata !645, metadata !108), !dbg !646
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !647, metadata !108), !dbg !648
  %sub61 = add nsw i64 %1, -1, !dbg !762
  tail call void @llvm.dbg.value(metadata i64 %sub61, i64 0, metadata !649, metadata !108), !dbg !650
  %cmp62 = icmp eq i64 %16, %sub61, !dbg !763
  br i1 %cmp62, label %blklab25, label %if.end65, !dbg !765

if.end65:                                         ; preds = %if.end51
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !766
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %17) #6, !dbg !767
  tail call void @exit(i32 -1) #7, !dbg !768
  unreachable, !dbg !768

blklab25:                                         ; preds = %if.end51
  tail call void @llvm.dbg.value(metadata i64 2000, i64 0, metadata !651, metadata !108), !dbg !652
  %cmp67 = icmp eq i64 %1, 2000, !dbg !769
  br i1 %cmp67, label %if.end73, label %if.end90, !dbg !771

if.end73:                                         ; preds = %blklab25
  %data75 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 0, !dbg !772
  %19 = load i64*, i64** %data75, align 8, !dbg !772
  %data_size76 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 1, !dbg !772
  %20 = load i64, i64* %data_size76, align 8, !dbg !772
  %call77 = tail call i64* @copy(i64* %19, i64 %20) #5, !dbg !772
  tail call void @llvm.dbg.value(metadata i64* %call77, i64 0, metadata !653, metadata !108), !dbg !654
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !656, metadata !108), !dbg !657
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !658, metadata !108), !dbg !659
  %add80 = mul i64 %1, %1, !dbg !774
  tail call void @llvm.dbg.value(metadata i64 %add80, i64 0, metadata !664, metadata !108), !dbg !665
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !666, metadata !108), !dbg !667
  %sub81 = add nsw i64 %add80, -1, !dbg !775
  tail call void @llvm.dbg.value(metadata i64 %sub81, i64 0, metadata !668, metadata !108), !dbg !669
  %arrayidx82 = getelementptr inbounds i64, i64* %call77, i64 %sub81, !dbg !776
  %21 = load i64, i64* %arrayidx82, align 8, !dbg !776
  tail call void @llvm.dbg.value(metadata i64 %21, i64 0, metadata !670, metadata !108), !dbg !671
  tail call void @llvm.dbg.value(metadata i64 3996001000, i64 0, metadata !672, metadata !108), !dbg !673
  %cmp83 = icmp eq i64 %21, 3996001000, !dbg !777
  br i1 %cmp83, label %if.end90, label %if.end86, !dbg !779

if.end86:                                         ; preds = %if.end73
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !780
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i64 4, i64 1, %struct._IO_FILE* %22) #6, !dbg !781
  tail call void @exit(i32 -1) #7, !dbg !782
  unreachable, !dbg !782

if.end90:                                         ; preds = %blklab25, %if.end73
  %_39_has_ownership.0 = phi i8 [ 0, %blklab25 ], [ 1, %if.end73 ]
  %_39.0 = phi i64* [ null, %blklab25 ], [ %call77, %if.end73 ]
  tail call void @llvm.dbg.value(metadata i64 27, i64 0, metadata !676, metadata !108), !dbg !675
  %call91 = tail call noalias i8* @malloc(i64 216) #5, !dbg !783
  %24 = bitcast i8* %call91 to i64*, !dbg !783
  tail call void @llvm.dbg.value(metadata i64* %24, i64 0, metadata !674, metadata !108), !dbg !675
  store i64 77, i64* %24, align 8, !dbg !784
  %arrayidx93 = getelementptr inbounds i8, i8* %call91, i64 8, !dbg !785
  %25 = bitcast i8* %arrayidx93 to i64*, !dbg !785
  store i64 97, i64* %25, align 8, !dbg !786
  %arrayidx94 = getelementptr inbounds i8, i8* %call91, i64 16, !dbg !787
  %26 = bitcast i8* %arrayidx94 to i64*, !dbg !787
  store i64 116, i64* %26, align 8, !dbg !788
  %arrayidx95 = getelementptr inbounds i8, i8* %call91, i64 24, !dbg !789
  %27 = bitcast i8* %arrayidx95 to i64*, !dbg !789
  store i64 114, i64* %27, align 8, !dbg !790
  %arrayidx96 = getelementptr inbounds i8, i8* %call91, i64 32, !dbg !791
  %28 = bitcast i8* %arrayidx96 to i64*, !dbg !791
  store i64 105, i64* %28, align 8, !dbg !792
  %arrayidx97 = getelementptr inbounds i8, i8* %call91, i64 40, !dbg !793
  %29 = bitcast i8* %arrayidx97 to i64*, !dbg !793
  store i64 120, i64* %29, align 8, !dbg !794
  %arrayidx98 = getelementptr inbounds i8, i8* %call91, i64 48, !dbg !795
  %30 = bitcast i8* %arrayidx98 to i64*, !dbg !795
  store i64 32, i64* %30, align 8, !dbg !796
  %arrayidx99 = getelementptr inbounds i8, i8* %call91, i64 56, !dbg !797
  %31 = bitcast i8* %arrayidx99 to i64*, !dbg !797
  store i64 67, i64* %31, align 8, !dbg !798
  %arrayidx100 = getelementptr inbounds i8, i8* %call91, i64 64, !dbg !799
  %32 = bitcast i8* %arrayidx100 to i64*, !dbg !799
  store i64 91, i64* %32, align 8, !dbg !800
  %arrayidx101 = getelementptr inbounds i8, i8* %call91, i64 72, !dbg !801
  %33 = bitcast i8* %arrayidx101 to i64*, !dbg !801
  store i64 115, i64* %33, align 8, !dbg !802
  %arrayidx102 = getelementptr inbounds i8, i8* %call91, i64 80, !dbg !803
  %34 = bitcast i8* %arrayidx102 to i64*, !dbg !803
  store i64 105, i64* %34, align 8, !dbg !804
  %arrayidx103 = getelementptr inbounds i8, i8* %call91, i64 88, !dbg !805
  %35 = bitcast i8* %arrayidx103 to i64*, !dbg !805
  store i64 122, i64* %35, align 8, !dbg !806
  %arrayidx104 = getelementptr inbounds i8, i8* %call91, i64 96, !dbg !807
  %36 = bitcast i8* %arrayidx104 to i64*, !dbg !807
  store i64 101, i64* %36, align 8, !dbg !808
  %arrayidx105 = getelementptr inbounds i8, i8* %call91, i64 104, !dbg !809
  %37 = bitcast i8* %arrayidx105 to i64*, !dbg !809
  store i64 45, i64* %37, align 8, !dbg !810
  %arrayidx106 = getelementptr inbounds i8, i8* %call91, i64 112, !dbg !811
  %38 = bitcast i8* %arrayidx106 to i64*, !dbg !811
  store i64 49, i64* %38, align 8, !dbg !812
  %arrayidx107 = getelementptr inbounds i8, i8* %call91, i64 120, !dbg !813
  %39 = bitcast i8* %arrayidx107 to i64*, !dbg !813
  store i64 93, i64* %39, align 8, !dbg !814
  %arrayidx108 = getelementptr inbounds i8, i8* %call91, i64 128, !dbg !815
  %40 = bitcast i8* %arrayidx108 to i64*, !dbg !815
  store i64 91, i64* %40, align 8, !dbg !816
  %arrayidx109 = getelementptr inbounds i8, i8* %call91, i64 136, !dbg !817
  %41 = bitcast i8* %arrayidx109 to i64*, !dbg !817
  store i64 115, i64* %41, align 8, !dbg !818
  %arrayidx110 = getelementptr inbounds i8, i8* %call91, i64 144, !dbg !819
  %42 = bitcast i8* %arrayidx110 to i64*, !dbg !819
  store i64 105, i64* %42, align 8, !dbg !820
  %arrayidx111 = getelementptr inbounds i8, i8* %call91, i64 152, !dbg !821
  %43 = bitcast i8* %arrayidx111 to i64*, !dbg !821
  store i64 122, i64* %43, align 8, !dbg !822
  %arrayidx112 = getelementptr inbounds i8, i8* %call91, i64 160, !dbg !823
  %44 = bitcast i8* %arrayidx112 to i64*, !dbg !823
  store i64 101, i64* %44, align 8, !dbg !824
  %arrayidx113 = getelementptr inbounds i8, i8* %call91, i64 168, !dbg !825
  %45 = bitcast i8* %arrayidx113 to i64*, !dbg !825
  store i64 45, i64* %45, align 8, !dbg !826
  %arrayidx114 = getelementptr inbounds i8, i8* %call91, i64 176, !dbg !827
  %46 = bitcast i8* %arrayidx114 to i64*, !dbg !827
  store i64 49, i64* %46, align 8, !dbg !828
  %arrayidx115 = getelementptr inbounds i8, i8* %call91, i64 184, !dbg !829
  %47 = bitcast i8* %arrayidx115 to i64*, !dbg !829
  store i64 93, i64* %47, align 8, !dbg !830
  %arrayidx116 = getelementptr inbounds i8, i8* %call91, i64 192, !dbg !831
  %48 = bitcast i8* %arrayidx116 to i64*, !dbg !831
  store i64 32, i64* %48, align 8, !dbg !832
  %arrayidx117 = getelementptr inbounds i8, i8* %call91, i64 200, !dbg !833
  %49 = bitcast i8* %arrayidx117 to i64*, !dbg !833
  store i64 61, i64* %49, align 8, !dbg !834
  %arrayidx118 = getelementptr inbounds i8, i8* %call91, i64 208, !dbg !835
  %50 = bitcast i8* %arrayidx118 to i64*, !dbg !835
  store i64 32, i64* %50, align 8, !dbg !836
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !677, metadata !108), !dbg !678
  tail call void @printf_s(i64* %24, i64 27) #5, !dbg !837
  %data123 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 0, !dbg !838
  %51 = load i64*, i64** %data123, align 8, !dbg !838
  %data_size124 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %call31, i64 0, i32 1, !dbg !838
  %52 = load i64, i64* %data_size124, align 8, !dbg !838
  %call125 = tail call i64* @copy(i64* %51, i64 %52) #5, !dbg !838
  tail call void @llvm.dbg.value(metadata i64* %call125, i64 0, metadata !679, metadata !108), !dbg !680
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !682, metadata !108), !dbg !683
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !684, metadata !108), !dbg !685
  %add128 = mul i64 %1, %1, !dbg !839
  tail call void @llvm.dbg.value(metadata i64 %add128, i64 0, metadata !690, metadata !108), !dbg !691
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !692, metadata !108), !dbg !693
  %sub129 = add nsw i64 %add128, -1, !dbg !840
  tail call void @llvm.dbg.value(metadata i64 %sub129, i64 0, metadata !694, metadata !108), !dbg !695
  %arrayidx130 = getelementptr inbounds i64, i64* %call125, i64 %sub129, !dbg !841
  %53 = load i64, i64* %arrayidx130, align 8, !dbg !841
  tail call void @llvm.dbg.value(metadata i64 %53, i64 0, metadata !696, metadata !108), !dbg !697
  %call131 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0), i64 %53) #5, !dbg !842
  tail call void @llvm.dbg.value(metadata i64 25, i64 0, metadata !700, metadata !108), !dbg !699
  %call135 = tail call noalias i8* @malloc(i64 200) #5, !dbg !843
  %54 = bitcast i8* %call135 to i64*, !dbg !843
  tail call void @llvm.dbg.value(metadata i64* %54, i64 0, metadata !698, metadata !108), !dbg !699
  store i64 80, i64* %54, align 8, !dbg !844
  %arrayidx137 = getelementptr inbounds i8, i8* %call135, i64 8, !dbg !845
  %55 = bitcast i8* %arrayidx137 to i64*, !dbg !845
  store i64 97, i64* %55, align 8, !dbg !846
  %arrayidx138 = getelementptr inbounds i8, i8* %call135, i64 16, !dbg !847
  %56 = bitcast i8* %arrayidx138 to i64*, !dbg !847
  store i64 115, i64* %56, align 8, !dbg !848
  %arrayidx139 = getelementptr inbounds i8, i8* %call135, i64 24, !dbg !849
  %57 = bitcast i8* %arrayidx139 to i64*, !dbg !849
  store i64 115, i64* %57, align 8, !dbg !850
  %arrayidx140 = getelementptr inbounds i8, i8* %call135, i64 32, !dbg !851
  %58 = bitcast i8* %arrayidx140 to i64*, !dbg !851
  store i64 32, i64* %58, align 8, !dbg !852
  %arrayidx141 = getelementptr inbounds i8, i8* %call135, i64 40, !dbg !853
  %59 = bitcast i8* %arrayidx141 to i64*, !dbg !853
  store i64 77, i64* %59, align 8, !dbg !854
  %arrayidx142 = getelementptr inbounds i8, i8* %call135, i64 48, !dbg !855
  %60 = bitcast i8* %arrayidx142 to i64*, !dbg !855
  store i64 97, i64* %60, align 8, !dbg !856
  %arrayidx143 = getelementptr inbounds i8, i8* %call135, i64 56, !dbg !857
  %61 = bitcast i8* %arrayidx143 to i64*, !dbg !857
  store i64 116, i64* %61, align 8, !dbg !858
  %arrayidx144 = getelementptr inbounds i8, i8* %call135, i64 64, !dbg !859
  %62 = bitcast i8* %arrayidx144 to i64*, !dbg !859
  store i64 114, i64* %62, align 8, !dbg !860
  %arrayidx145 = getelementptr inbounds i8, i8* %call135, i64 72, !dbg !861
  %63 = bitcast i8* %arrayidx145 to i64*, !dbg !861
  store i64 105, i64* %63, align 8, !dbg !862
  %arrayidx146 = getelementptr inbounds i8, i8* %call135, i64 80, !dbg !863
  %64 = bitcast i8* %arrayidx146 to i64*, !dbg !863
  store i64 120, i64* %64, align 8, !dbg !864
  %arrayidx147 = getelementptr inbounds i8, i8* %call135, i64 88, !dbg !865
  %65 = bitcast i8* %arrayidx147 to i64*, !dbg !865
  store i64 77, i64* %65, align 8, !dbg !866
  %arrayidx148 = getelementptr inbounds i8, i8* %call135, i64 96, !dbg !867
  %66 = bitcast i8* %arrayidx148 to i64*, !dbg !867
  store i64 117, i64* %66, align 8, !dbg !868
  %arrayidx149 = getelementptr inbounds i8, i8* %call135, i64 104, !dbg !869
  %67 = bitcast i8* %arrayidx149 to i64*, !dbg !869
  store i64 108, i64* %67, align 8, !dbg !870
  %arrayidx150 = getelementptr inbounds i8, i8* %call135, i64 112, !dbg !871
  %68 = bitcast i8* %arrayidx150 to i64*, !dbg !871
  store i64 116, i64* %68, align 8, !dbg !872
  %arrayidx151 = getelementptr inbounds i8, i8* %call135, i64 120, !dbg !873
  %69 = bitcast i8* %arrayidx151 to i64*, !dbg !873
  store i64 32, i64* %69, align 8, !dbg !874
  %arrayidx152 = getelementptr inbounds i8, i8* %call135, i64 128, !dbg !875
  %70 = bitcast i8* %arrayidx152 to i64*, !dbg !875
  store i64 116, i64* %70, align 8, !dbg !876
  %arrayidx153 = getelementptr inbounds i8, i8* %call135, i64 136, !dbg !877
  %71 = bitcast i8* %arrayidx153 to i64*, !dbg !877
  store i64 101, i64* %71, align 8, !dbg !878
  %arrayidx154 = getelementptr inbounds i8, i8* %call135, i64 144, !dbg !879
  %72 = bitcast i8* %arrayidx154 to i64*, !dbg !879
  store i64 115, i64* %72, align 8, !dbg !880
  %arrayidx155 = getelementptr inbounds i8, i8* %call135, i64 152, !dbg !881
  %73 = bitcast i8* %arrayidx155 to i64*, !dbg !881
  store i64 116, i64* %73, align 8, !dbg !882
  %arrayidx156 = getelementptr inbounds i8, i8* %call135, i64 160, !dbg !883
  %74 = bitcast i8* %arrayidx156 to i64*, !dbg !883
  store i64 32, i64* %74, align 8, !dbg !884
  %arrayidx157 = getelementptr inbounds i8, i8* %call135, i64 168, !dbg !885
  %75 = bitcast i8* %arrayidx157 to i64*, !dbg !885
  store i64 99, i64* %75, align 8, !dbg !886
  %arrayidx158 = getelementptr inbounds i8, i8* %call135, i64 176, !dbg !887
  %76 = bitcast i8* %arrayidx158 to i64*, !dbg !887
  store i64 97, i64* %76, align 8, !dbg !888
  %arrayidx159 = getelementptr inbounds i8, i8* %call135, i64 184, !dbg !889
  %77 = bitcast i8* %arrayidx159 to i64*, !dbg !889
  store i64 115, i64* %77, align 8, !dbg !890
  %arrayidx160 = getelementptr inbounds i8, i8* %call135, i64 192, !dbg !891
  %78 = bitcast i8* %arrayidx160 to i64*, !dbg !891
  store i64 101, i64* %78, align 8, !dbg !892
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !701, metadata !108), !dbg !702
  tail call void @println_s(i64* %54, i64 25) #5, !dbg !893
  %phitmp = bitcast i64* %call125 to i8*, !dbg !893
  %phitmp1 = bitcast i64* %call55 to i8*, !dbg !893
  %phitmp2 = bitcast i64* %call39 to i8*, !dbg !893
  br label %blklab23, !dbg !893

blklab23:                                         ; preds = %entry.split, %if.end90
  %_53.0 = phi i8* [ %phitmp, %if.end90 ], [ null, %entry.split ]
  %_50_has_ownership.0 = phi i1 [ true, %if.end90 ], [ false, %entry.split ]
  %79 = phi i8* [ %call91, %if.end90 ], [ null, %entry.split ]
  %_39_has_ownership.1 = phi i8 [ %_39_has_ownership.0, %if.end90 ], [ 0, %entry.split ]
  %_39.1 = phi i64* [ %_39.0, %if.end90 ], [ null, %entry.split ]
  %_28.0 = phi i8* [ %phitmp1, %if.end90 ], [ null, %entry.split ]
  %_18.0 = phi i8* [ %phitmp2, %if.end90 ], [ null, %entry.split ]
  %80 = phi i8* [ %call5, %if.end90 ], [ null, %entry.split ]
  %C.0 = phi %struct.Matrix* [ %call31, %if.end90 ], [ undef, %entry.split ]
  %B.0 = phi %struct.Matrix* [ %call24, %if.end90 ], [ undef, %entry.split ]
  %A.0 = phi %struct.Matrix* [ %call17, %if.end90 ], [ undef, %entry.split ]
  %81 = phi i8* [ %call135, %if.end90 ], [ null, %entry.split ]
  br i1 %_50_has_ownership.0, label %if.then162, label %if.end193.critedge6, !dbg !894

if.then162:                                       ; preds = %blklab23
  tail call void @free_Matrix(%struct.Matrix* %A.0), !dbg !895
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !574, metadata !108), !dbg !575
  tail call void @free_Matrix(%struct.Matrix* %B.0), !dbg !899
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !576, metadata !108), !dbg !577
  tail call void @free_Matrix(%struct.Matrix* %C.0), !dbg !903
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !578, metadata !108), !dbg !579
  tail call void @free2DArray(i64** %call, i64 %conv) #5, !dbg !907
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !585, metadata !108), !dbg !586
  tail call void @free(i8* %80) #5, !dbg !911
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !597, metadata !108), !dbg !598
  tail call void @free(i8* %_18.0) #5, !dbg !915
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !608, metadata !108), !dbg !609
  tail call void @free(i8* %_28.0) #5, !dbg !919
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !631, metadata !108), !dbg !632
  br label %if.end193, !dbg !919

if.end193.critedge6:                              ; preds = %blklab23
  tail call void @free2DArray(i64** %call, i64 %conv) #5, !dbg !907
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !585, metadata !108), !dbg !586
  br label %if.end193

if.end193:                                        ; preds = %if.end193.critedge6, %if.then162
  %82 = and i8 %_39_has_ownership.1, 1, !dbg !923
  %tobool194 = icmp eq i8 %82, 0, !dbg !923
  br i1 %tobool194, label %if.end196, label %if.then195, !dbg !925

if.then195:                                       ; preds = %if.end193
  %83 = bitcast i64* %_39.1 to i8*, !dbg !926
  tail call void @free(i8* %83) #5, !dbg !926
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !656, metadata !108), !dbg !657
  br label %if.end196, !dbg !926

if.end196:                                        ; preds = %if.end193, %if.then195
  br i1 %_50_has_ownership.0, label %if.then198, label %if.end205, !dbg !929

if.then198:                                       ; preds = %if.end196
  tail call void @free(i8* %79) #5, !dbg !930
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !677, metadata !108), !dbg !678
  tail call void @free(i8* %_53.0) #5, !dbg !934
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !682, metadata !108), !dbg !683
  tail call void @free(i8* %81) #5, !dbg !938
  tail call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !701, metadata !108), !dbg !702
  br label %if.end205, !dbg !938

if.end205:                                        ; preds = %if.end196, %if.then198
  tail call void @exit(i32 0) #7, !dbg !942
  unreachable, !dbg !942
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64* @parseStringToInt(i64*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

declare void @free2DArray(i64**, i64) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

declare i32 @putchar(i32)

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!103, !104}
!llvm.ident = !{!105}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !5)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate2")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !20, !23, !24, !28, !31, !96, !99}
!6 = distinct !DISubprogram(name: "copy_Matrix", scope: !1, file: !1, line: 2, type: !7, isLocal: false, isDefinition: true, scopeLine: 2, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{!9, !9}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "Matrix", file: !11, line: 7, baseType: !12)
!11 = !DIFile(filename: "./MatrixMult.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate2")
!12 = !DICompositeType(tag: DW_TAG_structure_type, file: !11, line: 3, size: 256, align: 64, elements: !13)
!13 = !{!14, !17, !18, !19}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !12, file: !11, line: 4, baseType: !15, size: 64, align: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64, align: 64)
!16 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "data_size", scope: !12, file: !11, line: 4, baseType: !16, size: 64, align: 64, offset: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !12, file: !11, line: 5, baseType: !16, size: 64, align: 64, offset: 128)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !12, file: !11, line: 6, baseType: !16, size: 64, align: 64, offset: 192)
!20 = distinct !DISubprogram(name: "free_Matrix", scope: !1, file: !1, line: 9, type: !21, isLocal: false, isDefinition: true, scopeLine: 9, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !9}
!23 = distinct !DISubprogram(name: "printf_Matrix", scope: !1, file: !1, line: 13, type: !21, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!24 = distinct !DISubprogram(name: "matrix", scope: !1, file: !1, line: 23, type: !25, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!9, !16, !16, !15, !16, !27}
!27 = !DIBasicType(name: "_Bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!28 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 42, type: !29, isLocal: false, isDefinition: true, scopeLine: 42, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!9, !16, !16}
!31 = distinct !DISubprogram(name: "print_mat", scope: !1, file: !1, line: 145, type: !32, isLocal: false, isDefinition: true, scopeLine: 145, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{null, !34, !9, !27}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64, align: 64)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !36, line: 48, baseType: !37)
!36 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate2")
!37 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !38, line: 245, size: 1728, align: 64, elements: !39)
!38 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate2")
!39 = !{!40, !42, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !63, !64, !65, !66, !70, !72, !74, !78, !81, !83, !84, !85, !86, !87, !91, !92}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !37, file: !38, line: 246, baseType: !41, size: 32, align: 32)
!41 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !37, file: !38, line: 251, baseType: !43, size: 64, align: 64, offset: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!44 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !37, file: !38, line: 252, baseType: !43, size: 64, align: 64, offset: 128)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !37, file: !38, line: 253, baseType: !43, size: 64, align: 64, offset: 192)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !37, file: !38, line: 254, baseType: !43, size: 64, align: 64, offset: 256)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !37, file: !38, line: 255, baseType: !43, size: 64, align: 64, offset: 320)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !37, file: !38, line: 256, baseType: !43, size: 64, align: 64, offset: 384)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !37, file: !38, line: 257, baseType: !43, size: 64, align: 64, offset: 448)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !37, file: !38, line: 258, baseType: !43, size: 64, align: 64, offset: 512)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !37, file: !38, line: 260, baseType: !43, size: 64, align: 64, offset: 576)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !37, file: !38, line: 261, baseType: !43, size: 64, align: 64, offset: 640)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !37, file: !38, line: 262, baseType: !43, size: 64, align: 64, offset: 704)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !37, file: !38, line: 264, baseType: !56, size: 64, align: 64, offset: 768)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64, align: 64)
!57 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !38, line: 160, size: 192, align: 64, elements: !58)
!58 = !{!59, !60, !62}
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_next", scope: !57, file: !38, line: 161, baseType: !56, size: 64, align: 64)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_sbuf", scope: !57, file: !38, line: 162, baseType: !61, size: 64, align: 64, offset: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64, align: 64)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_pos", scope: !57, file: !38, line: 166, baseType: !41, size: 32, align: 32, offset: 128)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !37, file: !38, line: 266, baseType: !61, size: 64, align: 64, offset: 832)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !37, file: !38, line: 268, baseType: !41, size: 32, align: 32, offset: 896)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !37, file: !38, line: 272, baseType: !41, size: 32, align: 32, offset: 928)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !37, file: !38, line: 274, baseType: !67, size: 64, align: 64, offset: 960)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !68, line: 131, baseType: !69)
!68 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate2")
!69 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !37, file: !38, line: 278, baseType: !71, size: 16, align: 16, offset: 1024)
!71 = !DIBasicType(name: "unsigned short", size: 16, align: 16, encoding: DW_ATE_unsigned)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !37, file: !38, line: 279, baseType: !73, size: 8, align: 8, offset: 1040)
!73 = !DIBasicType(name: "signed char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !37, file: !38, line: 280, baseType: !75, size: 8, align: 8, offset: 1048)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 8, align: 8, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 1)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !37, file: !38, line: 284, baseType: !79, size: 64, align: 64, offset: 1088)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64, align: 64)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !38, line: 154, baseType: null)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !37, file: !38, line: 293, baseType: !82, size: 64, align: 64, offset: 1152)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !68, line: 132, baseType: !69)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "__pad1", scope: !37, file: !38, line: 302, baseType: !4, size: 64, align: 64, offset: 1216)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "__pad2", scope: !37, file: !38, line: 303, baseType: !4, size: 64, align: 64, offset: 1280)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "__pad3", scope: !37, file: !38, line: 304, baseType: !4, size: 64, align: 64, offset: 1344)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "__pad4", scope: !37, file: !38, line: 305, baseType: !4, size: 64, align: 64, offset: 1408)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !37, file: !38, line: 306, baseType: !88, size: 64, align: 64, offset: 1472)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !89, line: 62, baseType: !90)
!89 = !DIFile(filename: "/home/sam/polly/llvm_build/bin/../lib/clang/3.9.0/include/stddef.h", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/autogenerate2")
!90 = !DIBasicType(name: "long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !37, file: !38, line: 308, baseType: !41, size: 32, align: 32, offset: 1536)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !37, file: !38, line: 310, baseType: !93, size: 160, align: 8, offset: 1568)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 160, align: 8, elements: !94)
!94 = !{!95}
!95 = !DISubrange(count: 20)
!96 = distinct !DISubprogram(name: "mat_mult", scope: !1, file: !1, line: 250, type: !97, isLocal: false, isDefinition: true, scopeLine: 250, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!97 = !DISubroutineType(types: !98)
!98 = !{!9, !9, !27, !9, !27}
!99 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 538, type: !100, isLocal: false, isDefinition: true, scopeLine: 538, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!41, !41, !102}
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64, align: 64)
!103 = !{i32 2, !"Dwarf Version", i32 4}
!104 = !{i32 2, !"Debug Info Version", i32 3}
!105 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!106 = !DILocation(line: 2, column: 29, scope: !6)
!107 = !DILocalVariable(name: "_Matrix", arg: 1, scope: !6, file: !1, line: 2, type: !9)
!108 = !DIExpression()
!109 = !DILocation(line: 3, column: 23, scope: !6)
!110 = !DILocalVariable(name: "new_Matrix", scope: !6, file: !1, line: 3, type: !9)
!111 = !DILocation(line: 3, column: 10, scope: !6)
!112 = !DILocation(line: 4, column: 2, scope: !6)
!113 = !DILocation(line: 5, column: 31, scope: !6)
!114 = !DILocation(line: 5, column: 14, scope: !6)
!115 = !DILocation(line: 5, column: 20, scope: !6)
!116 = !DILocation(line: 6, column: 32, scope: !6)
!117 = !DILocation(line: 6, column: 14, scope: !6)
!118 = !DILocation(line: 6, column: 21, scope: !6)
!119 = !DILocation(line: 7, column: 2, scope: !6)
!120 = !DILocation(line: 9, column: 26, scope: !20)
!121 = !DILocalVariable(name: "matrix", arg: 1, scope: !20, file: !1, line: 9, type: !9)
!122 = !DILocation(line: 10, column: 15, scope: !20)
!123 = !DILocation(line: 10, column: 2, scope: !20)
!124 = !DILocation(line: 11, column: 7, scope: !20)
!125 = !DILocation(line: 11, column: 2, scope: !20)
!126 = !DILocation(line: 12, column: 1, scope: !20)
!127 = !DILocation(line: 13, column: 28, scope: !23)
!128 = !DILocalVariable(name: "matrix", arg: 1, scope: !23, file: !1, line: 13, type: !9)
!129 = !DILocation(line: 14, column: 2, scope: !23)
!130 = !DILocation(line: 15, column: 2, scope: !23)
!131 = !DILocation(line: 16, column: 2, scope: !23)
!132 = !DILocation(line: 17, column: 2, scope: !23)
!133 = !DILocation(line: 18, column: 25, scope: !23)
!134 = !DILocation(line: 18, column: 2, scope: !23)
!135 = !DILocation(line: 19, column: 2, scope: !23)
!136 = !DILocation(line: 20, column: 25, scope: !23)
!137 = !DILocation(line: 20, column: 2, scope: !23)
!138 = !DILocation(line: 21, column: 2, scope: !23)
!139 = !DILocation(line: 22, column: 1, scope: !23)
!140 = !DILocation(line: 23, column: 26, scope: !24)
!141 = !DILocalVariable(name: "width", arg: 1, scope: !24, file: !1, line: 23, type: !16)
!142 = !DILocalVariable(name: "height", arg: 2, scope: !24, file: !1, line: 23, type: !16)
!143 = !DILocation(line: 23, column: 43, scope: !24)
!144 = !DILocalVariable(name: "data", arg: 3, scope: !24, file: !1, line: 23, type: !15)
!145 = !DILocation(line: 23, column: 51, scope: !24)
!146 = !DILocalVariable(name: "data_size", arg: 4, scope: !24, file: !1, line: 23, type: !16)
!147 = !DILocalVariable(name: "data_has_ownership", arg: 5, scope: !24, file: !1, line: 23, type: !27)
!148 = !DIExpression(DW_OP_bit_piece, 0, 1)
!149 = !DILocation(line: 23, column: 78, scope: !24)
!150 = !DILocalVariable(name: "r_has_ownership", scope: !24, file: !1, line: 25, type: !27)
!151 = !DILocation(line: 25, column: 2, scope: !24)
!152 = !DILocalVariable(name: "_4_has_ownership", scope: !24, file: !1, line: 27, type: !27)
!153 = !DILocation(line: 27, column: 2, scope: !24)
!154 = !DILocation(line: 30, column: 7, scope: !24)
!155 = !DILocalVariable(name: "_4", scope: !24, file: !1, line: 26, type: !9)
!156 = !DILocation(line: 26, column: 10, scope: !24)
!157 = !DILocation(line: 31, column: 2, scope: !24)
!158 = !DILocation(line: 32, column: 6, scope: !24)
!159 = !DILocation(line: 32, column: 13, scope: !24)
!160 = !DILocation(line: 33, column: 6, scope: !24)
!161 = !DILocation(line: 33, column: 12, scope: !24)
!162 = !DILocation(line: 36, column: 2, scope: !24)
!163 = !DILocation(line: 36, column: 2, scope: !164)
!164 = !DILexicalBlockFile(scope: !165, file: !1, discriminator: 1)
!165 = distinct !DILexicalBlock(scope: !166, file: !1, line: 36, column: 2)
!166 = distinct !DILexicalBlock(scope: !24, file: !1, line: 36, column: 2)
!167 = !DILocation(line: 38, column: 2, scope: !24)
!168 = !DILocation(line: 42, column: 24, scope: !28)
!169 = !DILocalVariable(name: "width", arg: 1, scope: !28, file: !1, line: 42, type: !16)
!170 = !DILocalVariable(name: "height", arg: 2, scope: !28, file: !1, line: 42, type: !16)
!171 = !DILocation(line: 42, column: 41, scope: !28)
!172 = !DILocalVariable(name: "r_has_ownership", scope: !28, file: !1, line: 44, type: !27)
!173 = !DILocation(line: 44, column: 2, scope: !28)
!174 = !DILocalVariable(name: "data", scope: !28, file: !1, line: 45, type: !15)
!175 = !DILocation(line: 45, column: 2, scope: !28)
!176 = !DILocalVariable(name: "data_size", scope: !28, file: !1, line: 45, type: !16)
!177 = !DILocalVariable(name: "data_has_ownership", scope: !28, file: !1, line: 46, type: !27)
!178 = !DILocation(line: 46, column: 2, scope: !28)
!179 = !DILocalVariable(name: "i", scope: !28, file: !1, line: 47, type: !16)
!180 = !DILocation(line: 47, column: 12, scope: !28)
!181 = !DILocalVariable(name: "j", scope: !28, file: !1, line: 48, type: !16)
!182 = !DILocation(line: 48, column: 12, scope: !28)
!183 = !DILocalVariable(name: "_6", scope: !28, file: !1, line: 49, type: !16)
!184 = !DILocation(line: 49, column: 12, scope: !28)
!185 = !DILocalVariable(name: "_7", scope: !28, file: !1, line: 50, type: !16)
!186 = !DILocation(line: 50, column: 12, scope: !28)
!187 = !DILocalVariable(name: "_8", scope: !28, file: !1, line: 51, type: !15)
!188 = !DILocation(line: 51, column: 2, scope: !28)
!189 = !DILocalVariable(name: "_8_size", scope: !28, file: !1, line: 51, type: !16)
!190 = !DILocalVariable(name: "_8_has_ownership", scope: !28, file: !1, line: 52, type: !27)
!191 = !DILocation(line: 52, column: 2, scope: !28)
!192 = !DILocalVariable(name: "_9", scope: !28, file: !1, line: 53, type: !16)
!193 = !DILocation(line: 53, column: 12, scope: !28)
!194 = !DILocalVariable(name: "_10", scope: !28, file: !1, line: 54, type: !16)
!195 = !DILocation(line: 54, column: 12, scope: !28)
!196 = !DILocalVariable(name: "_11", scope: !28, file: !1, line: 55, type: !16)
!197 = !DILocation(line: 55, column: 12, scope: !28)
!198 = !DILocalVariable(name: "_12", scope: !28, file: !1, line: 56, type: !16)
!199 = !DILocation(line: 56, column: 12, scope: !28)
!200 = !DILocalVariable(name: "_13", scope: !28, file: !1, line: 57, type: !16)
!201 = !DILocation(line: 57, column: 12, scope: !28)
!202 = !DILocalVariable(name: "_14", scope: !28, file: !1, line: 58, type: !16)
!203 = !DILocation(line: 58, column: 12, scope: !28)
!204 = !DILocalVariable(name: "_15", scope: !28, file: !1, line: 59, type: !16)
!205 = !DILocation(line: 59, column: 12, scope: !28)
!206 = !DILocalVariable(name: "_16", scope: !28, file: !1, line: 60, type: !16)
!207 = !DILocation(line: 60, column: 12, scope: !28)
!208 = !DILocalVariable(name: "_17", scope: !28, file: !1, line: 61, type: !16)
!209 = !DILocation(line: 61, column: 12, scope: !28)
!210 = !DILocalVariable(name: "_18", scope: !28, file: !1, line: 62, type: !16)
!211 = !DILocation(line: 62, column: 12, scope: !28)
!212 = !DILocalVariable(name: "_19", scope: !28, file: !1, line: 63, type: !16)
!213 = !DILocation(line: 63, column: 12, scope: !28)
!214 = !DILocalVariable(name: "_20", scope: !28, file: !1, line: 64, type: !16)
!215 = !DILocation(line: 64, column: 12, scope: !28)
!216 = !DILocalVariable(name: "_21_has_ownership", scope: !28, file: !1, line: 66, type: !27)
!217 = !DILocation(line: 66, column: 2, scope: !28)
!218 = !DILocation(line: 70, column: 10, scope: !28)
!219 = !DILocation(line: 73, column: 2, scope: !28)
!220 = !DILocation(line: 87, column: 7, scope: !221)
!221 = distinct !DILexicalBlock(scope: !222, file: !1, line: 87, column: 6)
!222 = distinct !DILexicalBlock(scope: !28, file: !1, line: 85, column: 13)
!223 = !DILocation(line: 87, column: 6, scope: !222)
!224 = !DILocation(line: 95, column: 8, scope: !225)
!225 = distinct !DILexicalBlock(scope: !226, file: !1, line: 95, column: 7)
!226 = distinct !DILexicalBlock(scope: !222, file: !1, line: 93, column: 14)
!227 = !DILocation(line: 95, column: 7, scope: !226)
!228 = !DILocation(line: 97, column: 9, scope: !226)
!229 = !DILocation(line: 99, column: 11, scope: !226)
!230 = !DILocation(line: 101, column: 8, scope: !226)
!231 = !DILocation(line: 103, column: 11, scope: !226)
!232 = !DILocation(line: 105, column: 9, scope: !226)
!233 = !DILocation(line: 107, column: 11, scope: !226)
!234 = !DILocation(line: 109, column: 4, scope: !226)
!235 = !DILocation(line: 109, column: 14, scope: !226)
!236 = !DILocation(line: 113, column: 9, scope: !226)
!237 = !DILocation(line: 124, column: 8, scope: !222)
!238 = !DILocation(line: 135, column: 8, scope: !28)
!239 = !DILocalVariable(name: "_21", scope: !28, file: !1, line: 65, type: !9)
!240 = !DILocation(line: 65, column: 10, scope: !28)
!241 = !DILocation(line: 139, column: 2, scope: !242)
!242 = !DILexicalBlockFile(scope: !243, file: !1, discriminator: 1)
!243 = distinct !DILexicalBlock(scope: !244, file: !1, line: 139, column: 2)
!244 = distinct !DILexicalBlock(scope: !28, file: !1, line: 139, column: 2)
!245 = !DILocation(line: 141, column: 2, scope: !28)
!246 = !DILocation(line: 145, column: 22, scope: !31)
!247 = !DILocalVariable(name: "sys", arg: 1, scope: !31, file: !1, line: 145, type: !34)
!248 = !DILocalVariable(name: "a", arg: 2, scope: !31, file: !1, line: 145, type: !9)
!249 = !DILocation(line: 145, column: 35, scope: !31)
!250 = !DILocalVariable(name: "a_has_ownership", arg: 3, scope: !31, file: !1, line: 145, type: !27)
!251 = !DILocation(line: 145, column: 38, scope: !31)
!252 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 146, type: !16)
!253 = !DILocation(line: 146, column: 12, scope: !31)
!254 = !DILocalVariable(name: "width", scope: !31, file: !1, line: 147, type: !16)
!255 = !DILocation(line: 147, column: 12, scope: !31)
!256 = !DILocalVariable(name: "height", scope: !31, file: !1, line: 148, type: !16)
!257 = !DILocation(line: 148, column: 12, scope: !31)
!258 = !DILocalVariable(name: "j", scope: !31, file: !1, line: 149, type: !16)
!259 = !DILocation(line: 149, column: 12, scope: !31)
!260 = !DILocalVariable(name: "_6", scope: !31, file: !1, line: 150, type: !16)
!261 = !DILocation(line: 150, column: 12, scope: !31)
!262 = !DILocalVariable(name: "_7", scope: !31, file: !1, line: 151, type: !16)
!263 = !DILocation(line: 151, column: 12, scope: !31)
!264 = !DILocalVariable(name: "_8", scope: !31, file: !1, line: 152, type: !16)
!265 = !DILocation(line: 152, column: 12, scope: !31)
!266 = !DILocalVariable(name: "_9", scope: !31, file: !1, line: 153, type: !16)
!267 = !DILocation(line: 153, column: 12, scope: !31)
!268 = !DILocalVariable(name: "_12", scope: !31, file: !1, line: 155, type: !15)
!269 = !DILocation(line: 155, column: 2, scope: !31)
!270 = !DILocalVariable(name: "_12_size", scope: !31, file: !1, line: 155, type: !16)
!271 = !DILocalVariable(name: "_12_has_ownership", scope: !31, file: !1, line: 156, type: !27)
!272 = !DILocation(line: 156, column: 2, scope: !31)
!273 = !DILocalVariable(name: "_13", scope: !31, file: !1, line: 157, type: !16)
!274 = !DILocation(line: 157, column: 12, scope: !31)
!275 = !DILocalVariable(name: "_14", scope: !31, file: !1, line: 158, type: !16)
!276 = !DILocation(line: 158, column: 12, scope: !31)
!277 = !DILocalVariable(name: "_15", scope: !31, file: !1, line: 159, type: !16)
!278 = !DILocation(line: 159, column: 12, scope: !31)
!279 = !DILocalVariable(name: "_18", scope: !31, file: !1, line: 161, type: !15)
!280 = !DILocation(line: 161, column: 2, scope: !31)
!281 = !DILocalVariable(name: "_18_size", scope: !31, file: !1, line: 161, type: !16)
!282 = !DILocalVariable(name: "_18_has_ownership", scope: !31, file: !1, line: 162, type: !27)
!283 = !DILocation(line: 162, column: 2, scope: !31)
!284 = !DILocalVariable(name: "_19", scope: !31, file: !1, line: 163, type: !16)
!285 = !DILocation(line: 163, column: 12, scope: !31)
!286 = !DILocalVariable(name: "_20", scope: !31, file: !1, line: 164, type: !16)
!287 = !DILocation(line: 164, column: 12, scope: !31)
!288 = !DILocalVariable(name: "_21", scope: !31, file: !1, line: 165, type: !16)
!289 = !DILocation(line: 165, column: 12, scope: !31)
!290 = !DILocalVariable(name: "_22", scope: !31, file: !1, line: 166, type: !16)
!291 = !DILocation(line: 166, column: 12, scope: !31)
!292 = !DILocalVariable(name: "_25", scope: !31, file: !1, line: 168, type: !15)
!293 = !DILocation(line: 168, column: 2, scope: !31)
!294 = !DILocalVariable(name: "_25_size", scope: !31, file: !1, line: 168, type: !16)
!295 = !DILocalVariable(name: "_25_has_ownership", scope: !31, file: !1, line: 169, type: !27)
!296 = !DILocation(line: 169, column: 2, scope: !31)
!297 = !DILocation(line: 175, column: 10, scope: !31)
!298 = !DILocation(line: 179, column: 10, scope: !31)
!299 = !DILocation(line: 185, column: 7, scope: !300)
!300 = distinct !DILexicalBlock(scope: !301, file: !1, line: 185, column: 6)
!301 = distinct !DILexicalBlock(scope: !31, file: !1, line: 183, column: 13)
!302 = !DILocation(line: 185, column: 6, scope: !301)
!303 = !DILocation(line: 193, column: 8, scope: !304)
!304 = distinct !DILexicalBlock(scope: !305, file: !1, line: 193, column: 7)
!305 = distinct !DILexicalBlock(scope: !301, file: !1, line: 191, column: 14)
!306 = !DILocation(line: 193, column: 7, scope: !305)
!307 = !DILocation(line: 197, column: 4, scope: !308)
!308 = distinct !DILexicalBlock(scope: !305, file: !1, line: 197, column: 4)
!309 = !DILocation(line: 197, column: 4, scope: !305)
!310 = !DILocation(line: 197, column: 4, scope: !311)
!311 = !DILexicalBlockFile(scope: !312, file: !1, discriminator: 1)
!312 = distinct !DILexicalBlock(scope: !308, file: !1, line: 197, column: 4)
!313 = !DILocation(line: 198, column: 4, scope: !305)
!314 = !DILocation(line: 201, column: 9, scope: !305)
!315 = !DILocation(line: 203, column: 11, scope: !305)
!316 = !DILocation(line: 205, column: 8, scope: !305)
!317 = !DILocation(line: 207, column: 4, scope: !305)
!318 = !DILocation(line: 211, column: 4, scope: !319)
!319 = distinct !DILexicalBlock(scope: !305, file: !1, line: 211, column: 4)
!320 = !DILocation(line: 211, column: 4, scope: !305)
!321 = !DILocation(line: 211, column: 4, scope: !322)
!322 = !DILexicalBlockFile(scope: !323, file: !1, discriminator: 1)
!323 = distinct !DILexicalBlock(scope: !319, file: !1, line: 211, column: 4)
!324 = !DILocation(line: 212, column: 4, scope: !305)
!325 = !DILocation(line: 213, column: 11, scope: !305)
!326 = !DILocation(line: 216, column: 4, scope: !305)
!327 = !DILocation(line: 220, column: 9, scope: !305)
!328 = !DILocation(line: 231, column: 8, scope: !301)
!329 = !DILocation(line: 237, column: 3, scope: !301)
!330 = !DILocation(line: 237, column: 3, scope: !331)
!331 = !DILexicalBlockFile(scope: !332, file: !1, discriminator: 1)
!332 = distinct !DILexicalBlock(scope: !333, file: !1, line: 237, column: 3)
!333 = distinct !DILexicalBlock(scope: !301, file: !1, line: 237, column: 3)
!334 = !DILocation(line: 238, column: 3, scope: !301)
!335 = !DILocation(line: 241, column: 3, scope: !301)
!336 = !DILocation(line: 248, column: 1, scope: !31)
!337 = !DILocation(line: 250, column: 26, scope: !96)
!338 = !DILocalVariable(name: "a", arg: 1, scope: !96, file: !1, line: 250, type: !9)
!339 = !DILocalVariable(name: "a_has_ownership", arg: 2, scope: !96, file: !1, line: 250, type: !27)
!340 = !DILocation(line: 250, column: 29, scope: !96)
!341 = !DILocalVariable(name: "b", arg: 3, scope: !96, file: !1, line: 250, type: !9)
!342 = !DILocation(line: 250, column: 63, scope: !96)
!343 = !DILocalVariable(name: "b_has_ownership", arg: 4, scope: !96, file: !1, line: 250, type: !27)
!344 = !DILocation(line: 250, column: 66, scope: !96)
!345 = !DILocalVariable(name: "c_has_ownership", scope: !96, file: !1, line: 252, type: !27)
!346 = !DILocation(line: 252, column: 2, scope: !96)
!347 = !DILocalVariable(name: "width", scope: !96, file: !1, line: 253, type: !16)
!348 = !DILocation(line: 253, column: 12, scope: !96)
!349 = !DILocalVariable(name: "height", scope: !96, file: !1, line: 254, type: !16)
!350 = !DILocation(line: 254, column: 12, scope: !96)
!351 = !DILocalVariable(name: "data", scope: !96, file: !1, line: 255, type: !15)
!352 = !DILocation(line: 255, column: 2, scope: !96)
!353 = !DILocalVariable(name: "data_size", scope: !96, file: !1, line: 255, type: !16)
!354 = !DILocalVariable(name: "data_has_ownership", scope: !96, file: !1, line: 256, type: !27)
!355 = !DILocation(line: 256, column: 2, scope: !96)
!356 = !DILocalVariable(name: "a_data", scope: !96, file: !1, line: 257, type: !15)
!357 = !DILocation(line: 257, column: 2, scope: !96)
!358 = !DILocalVariable(name: "a_data_size", scope: !96, file: !1, line: 257, type: !16)
!359 = !DILocalVariable(name: "a_data_has_ownership", scope: !96, file: !1, line: 258, type: !27)
!360 = !DILocation(line: 258, column: 2, scope: !96)
!361 = !DILocalVariable(name: "b_data", scope: !96, file: !1, line: 259, type: !15)
!362 = !DILocation(line: 259, column: 2, scope: !96)
!363 = !DILocalVariable(name: "b_data_size", scope: !96, file: !1, line: 259, type: !16)
!364 = !DILocalVariable(name: "b_data_has_ownership", scope: !96, file: !1, line: 260, type: !27)
!365 = !DILocation(line: 260, column: 2, scope: !96)
!366 = !DILocalVariable(name: "b_t", scope: !96, file: !1, line: 261, type: !15)
!367 = !DILocation(line: 261, column: 2, scope: !96)
!368 = !DILocalVariable(name: "b_t_size", scope: !96, file: !1, line: 261, type: !16)
!369 = !DILocalVariable(name: "b_t_has_ownership", scope: !96, file: !1, line: 262, type: !27)
!370 = !DILocation(line: 262, column: 2, scope: !96)
!371 = !DILocalVariable(name: "i", scope: !96, file: !1, line: 263, type: !16)
!372 = !DILocation(line: 263, column: 12, scope: !96)
!373 = !DILocalVariable(name: "j", scope: !96, file: !1, line: 264, type: !16)
!374 = !DILocation(line: 264, column: 12, scope: !96)
!375 = !DILocalVariable(name: "k", scope: !96, file: !1, line: 265, type: !16)
!376 = !DILocation(line: 265, column: 12, scope: !96)
!377 = !DILocalVariable(name: "_12", scope: !96, file: !1, line: 266, type: !16)
!378 = !DILocation(line: 266, column: 12, scope: !96)
!379 = !DILocalVariable(name: "_13", scope: !96, file: !1, line: 267, type: !16)
!380 = !DILocation(line: 267, column: 12, scope: !96)
!381 = !DILocalVariable(name: "_14", scope: !96, file: !1, line: 268, type: !16)
!382 = !DILocation(line: 268, column: 12, scope: !96)
!383 = !DILocalVariable(name: "_15", scope: !96, file: !1, line: 269, type: !16)
!384 = !DILocation(line: 269, column: 12, scope: !96)
!385 = !DILocalVariable(name: "_16", scope: !96, file: !1, line: 270, type: !15)
!386 = !DILocation(line: 270, column: 2, scope: !96)
!387 = !DILocalVariable(name: "_16_size", scope: !96, file: !1, line: 270, type: !16)
!388 = !DILocalVariable(name: "_16_has_ownership", scope: !96, file: !1, line: 271, type: !27)
!389 = !DILocation(line: 271, column: 2, scope: !96)
!390 = !DILocalVariable(name: "_17", scope: !96, file: !1, line: 272, type: !15)
!391 = !DILocation(line: 272, column: 2, scope: !96)
!392 = !DILocalVariable(name: "_17_size", scope: !96, file: !1, line: 272, type: !16)
!393 = !DILocalVariable(name: "_17_has_ownership", scope: !96, file: !1, line: 273, type: !27)
!394 = !DILocation(line: 273, column: 2, scope: !96)
!395 = !DILocalVariable(name: "_18", scope: !96, file: !1, line: 274, type: !15)
!396 = !DILocation(line: 274, column: 2, scope: !96)
!397 = !DILocalVariable(name: "_18_size", scope: !96, file: !1, line: 274, type: !16)
!398 = !DILocalVariable(name: "_18_has_ownership", scope: !96, file: !1, line: 275, type: !27)
!399 = !DILocation(line: 275, column: 2, scope: !96)
!400 = !DILocalVariable(name: "_19", scope: !96, file: !1, line: 276, type: !16)
!401 = !DILocation(line: 276, column: 12, scope: !96)
!402 = !DILocalVariable(name: "_20", scope: !96, file: !1, line: 277, type: !16)
!403 = !DILocation(line: 277, column: 12, scope: !96)
!404 = !DILocalVariable(name: "_21", scope: !96, file: !1, line: 278, type: !15)
!405 = !DILocation(line: 278, column: 2, scope: !96)
!406 = !DILocalVariable(name: "_21_size", scope: !96, file: !1, line: 278, type: !16)
!407 = !DILocalVariable(name: "_21_has_ownership", scope: !96, file: !1, line: 279, type: !27)
!408 = !DILocation(line: 279, column: 2, scope: !96)
!409 = !DILocalVariable(name: "_22", scope: !96, file: !1, line: 280, type: !16)
!410 = !DILocation(line: 280, column: 12, scope: !96)
!411 = !DILocalVariable(name: "_23", scope: !96, file: !1, line: 281, type: !16)
!412 = !DILocation(line: 281, column: 12, scope: !96)
!413 = !DILocalVariable(name: "_24", scope: !96, file: !1, line: 282, type: !16)
!414 = !DILocation(line: 282, column: 12, scope: !96)
!415 = !DILocalVariable(name: "_25", scope: !96, file: !1, line: 283, type: !16)
!416 = !DILocation(line: 283, column: 12, scope: !96)
!417 = !DILocalVariable(name: "_26", scope: !96, file: !1, line: 284, type: !16)
!418 = !DILocation(line: 284, column: 12, scope: !96)
!419 = !DILocalVariable(name: "_27", scope: !96, file: !1, line: 285, type: !16)
!420 = !DILocation(line: 285, column: 12, scope: !96)
!421 = !DILocalVariable(name: "_28", scope: !96, file: !1, line: 286, type: !16)
!422 = !DILocation(line: 286, column: 12, scope: !96)
!423 = !DILocalVariable(name: "_29", scope: !96, file: !1, line: 287, type: !16)
!424 = !DILocation(line: 287, column: 12, scope: !96)
!425 = !DILocalVariable(name: "_30", scope: !96, file: !1, line: 288, type: !16)
!426 = !DILocation(line: 288, column: 12, scope: !96)
!427 = !DILocalVariable(name: "_31", scope: !96, file: !1, line: 289, type: !16)
!428 = !DILocation(line: 289, column: 12, scope: !96)
!429 = !DILocalVariable(name: "_32", scope: !96, file: !1, line: 290, type: !16)
!430 = !DILocation(line: 290, column: 12, scope: !96)
!431 = !DILocalVariable(name: "_33", scope: !96, file: !1, line: 291, type: !16)
!432 = !DILocation(line: 291, column: 12, scope: !96)
!433 = !DILocalVariable(name: "_34", scope: !96, file: !1, line: 292, type: !16)
!434 = !DILocation(line: 292, column: 12, scope: !96)
!435 = !DILocalVariable(name: "_35", scope: !96, file: !1, line: 293, type: !16)
!436 = !DILocation(line: 293, column: 12, scope: !96)
!437 = !DILocalVariable(name: "_36", scope: !96, file: !1, line: 294, type: !16)
!438 = !DILocation(line: 294, column: 12, scope: !96)
!439 = !DILocalVariable(name: "_37", scope: !96, file: !1, line: 295, type: !16)
!440 = !DILocation(line: 295, column: 12, scope: !96)
!441 = !DILocalVariable(name: "_38", scope: !96, file: !1, line: 296, type: !16)
!442 = !DILocation(line: 296, column: 12, scope: !96)
!443 = !DILocalVariable(name: "_39", scope: !96, file: !1, line: 297, type: !16)
!444 = !DILocation(line: 297, column: 12, scope: !96)
!445 = !DILocalVariable(name: "_40", scope: !96, file: !1, line: 298, type: !16)
!446 = !DILocation(line: 298, column: 12, scope: !96)
!447 = !DILocalVariable(name: "_41", scope: !96, file: !1, line: 299, type: !16)
!448 = !DILocation(line: 299, column: 12, scope: !96)
!449 = !DILocalVariable(name: "_42", scope: !96, file: !1, line: 300, type: !16)
!450 = !DILocation(line: 300, column: 12, scope: !96)
!451 = !DILocalVariable(name: "_43", scope: !96, file: !1, line: 301, type: !16)
!452 = !DILocation(line: 301, column: 12, scope: !96)
!453 = !DILocalVariable(name: "_44", scope: !96, file: !1, line: 302, type: !16)
!454 = !DILocation(line: 302, column: 12, scope: !96)
!455 = !DILocalVariable(name: "_45", scope: !96, file: !1, line: 303, type: !16)
!456 = !DILocation(line: 303, column: 12, scope: !96)
!457 = !DILocalVariable(name: "_46", scope: !96, file: !1, line: 304, type: !16)
!458 = !DILocation(line: 304, column: 12, scope: !96)
!459 = !DILocalVariable(name: "_47", scope: !96, file: !1, line: 305, type: !16)
!460 = !DILocation(line: 305, column: 12, scope: !96)
!461 = !DILocalVariable(name: "_48", scope: !96, file: !1, line: 306, type: !16)
!462 = !DILocation(line: 306, column: 12, scope: !96)
!463 = !DILocalVariable(name: "_49", scope: !96, file: !1, line: 307, type: !16)
!464 = !DILocation(line: 307, column: 12, scope: !96)
!465 = !DILocalVariable(name: "_50", scope: !96, file: !1, line: 308, type: !16)
!466 = !DILocation(line: 308, column: 12, scope: !96)
!467 = !DILocalVariable(name: "_51", scope: !96, file: !1, line: 309, type: !16)
!468 = !DILocation(line: 309, column: 12, scope: !96)
!469 = !DILocalVariable(name: "_52", scope: !96, file: !1, line: 310, type: !16)
!470 = !DILocation(line: 310, column: 12, scope: !96)
!471 = !DILocalVariable(name: "_53", scope: !96, file: !1, line: 311, type: !16)
!472 = !DILocation(line: 311, column: 12, scope: !96)
!473 = !DILocalVariable(name: "_54", scope: !96, file: !1, line: 312, type: !16)
!474 = !DILocation(line: 312, column: 12, scope: !96)
!475 = !DILocalVariable(name: "_55", scope: !96, file: !1, line: 313, type: !16)
!476 = !DILocation(line: 313, column: 12, scope: !96)
!477 = !DILocalVariable(name: "_56", scope: !96, file: !1, line: 314, type: !16)
!478 = !DILocation(line: 314, column: 12, scope: !96)
!479 = !DILocalVariable(name: "_57", scope: !96, file: !1, line: 315, type: !16)
!480 = !DILocation(line: 315, column: 12, scope: !96)
!481 = !DILocalVariable(name: "_58_has_ownership", scope: !96, file: !1, line: 317, type: !27)
!482 = !DILocation(line: 317, column: 2, scope: !96)
!483 = !DILocation(line: 319, column: 11, scope: !96)
!484 = !DILocation(line: 323, column: 11, scope: !96)
!485 = !DILocation(line: 329, column: 11, scope: !96)
!486 = !DILocation(line: 332, column: 2, scope: !96)
!487 = !DILocation(line: 341, column: 2, scope: !96)
!488 = !DILocation(line: 350, column: 2, scope: !96)
!489 = !DILocation(line: 360, column: 11, scope: !96)
!490 = !DILocation(line: 363, column: 2, scope: !96)
!491 = !DILocation(line: 389, column: 7, scope: !492)
!492 = distinct !DILexicalBlock(scope: !493, file: !1, line: 389, column: 6)
!493 = distinct !DILexicalBlock(scope: !96, file: !1, line: 387, column: 13)
!494 = !DILocation(line: 389, column: 6, scope: !493)
!495 = !DILocation(line: 397, column: 8, scope: !496)
!496 = distinct !DILexicalBlock(scope: !497, file: !1, line: 397, column: 7)
!497 = distinct !DILexicalBlock(scope: !493, file: !1, line: 395, column: 14)
!498 = !DILocation(line: 397, column: 7, scope: !497)
!499 = !DILocation(line: 439, column: 7, scope: !500)
!500 = distinct !DILexicalBlock(scope: !501, file: !1, line: 439, column: 6)
!501 = distinct !DILexicalBlock(scope: !96, file: !1, line: 437, column: 13)
!502 = !DILocation(line: 439, column: 6, scope: !501)
!503 = !DILocation(line: 399, column: 9, scope: !497)
!504 = !DILocation(line: 401, column: 11, scope: !497)
!505 = !DILocation(line: 403, column: 8, scope: !497)
!506 = !DILocation(line: 405, column: 9, scope: !497)
!507 = !DILocation(line: 407, column: 11, scope: !497)
!508 = !DILocation(line: 409, column: 4, scope: !497)
!509 = !DILocation(line: 409, column: 13, scope: !497)
!510 = !DILocation(line: 413, column: 9, scope: !497)
!511 = !DILocation(line: 424, column: 8, scope: !493)
!512 = !DILocation(line: 447, column: 8, scope: !513)
!513 = distinct !DILexicalBlock(scope: !514, file: !1, line: 447, column: 7)
!514 = distinct !DILexicalBlock(scope: !501, file: !1, line: 445, column: 14)
!515 = !DILocation(line: 447, column: 7, scope: !514)
!516 = !DILocation(line: 455, column: 9, scope: !517)
!517 = distinct !DILexicalBlock(scope: !518, file: !1, line: 455, column: 8)
!518 = distinct !DILexicalBlock(scope: !514, file: !1, line: 453, column: 15)
!519 = !DILocation(line: 455, column: 8, scope: !518)
!520 = !DILocation(line: 457, column: 10, scope: !518)
!521 = !DILocation(line: 459, column: 12, scope: !518)
!522 = !DILocation(line: 461, column: 9, scope: !518)
!523 = !DILocation(line: 463, column: 10, scope: !518)
!524 = !DILocation(line: 465, column: 12, scope: !518)
!525 = !DILocation(line: 467, column: 9, scope: !518)
!526 = !DILocation(line: 469, column: 10, scope: !518)
!527 = !DILocation(line: 471, column: 12, scope: !518)
!528 = !DILocation(line: 473, column: 9, scope: !518)
!529 = !DILocation(line: 475, column: 12, scope: !518)
!530 = !DILocation(line: 477, column: 12, scope: !518)
!531 = !DILocation(line: 479, column: 10, scope: !518)
!532 = !DILocation(line: 481, column: 12, scope: !518)
!533 = !DILocation(line: 483, column: 5, scope: !518)
!534 = !DILocation(line: 483, column: 15, scope: !518)
!535 = !DILocation(line: 487, column: 10, scope: !518)
!536 = !DILocation(line: 498, column: 9, scope: !514)
!537 = !DILocation(line: 509, column: 8, scope: !501)
!538 = !DILocation(line: 520, column: 8, scope: !96)
!539 = !DILocalVariable(name: "_58", scope: !96, file: !1, line: 316, type: !9)
!540 = !DILocation(line: 316, column: 10, scope: !96)
!541 = !DILocation(line: 523, column: 2, scope: !96)
!542 = !DILocation(line: 523, column: 2, scope: !543)
!543 = !DILexicalBlockFile(scope: !544, file: !1, discriminator: 1)
!544 = distinct !DILexicalBlock(scope: !545, file: !1, line: 523, column: 2)
!545 = distinct !DILexicalBlock(scope: !96, file: !1, line: 523, column: 2)
!546 = !DILocation(line: 524, column: 2, scope: !96)
!547 = !DILocation(line: 524, column: 2, scope: !548)
!548 = !DILexicalBlockFile(scope: !549, file: !1, discriminator: 1)
!549 = distinct !DILexicalBlock(scope: !550, file: !1, line: 524, column: 2)
!550 = distinct !DILexicalBlock(scope: !96, file: !1, line: 524, column: 2)
!551 = !DILocation(line: 526, column: 2, scope: !552)
!552 = !DILexicalBlockFile(scope: !553, file: !1, discriminator: 1)
!553 = distinct !DILexicalBlock(scope: !554, file: !1, line: 526, column: 2)
!554 = distinct !DILexicalBlock(scope: !96, file: !1, line: 526, column: 2)
!555 = !DILocation(line: 527, column: 2, scope: !556)
!556 = !DILexicalBlockFile(scope: !557, file: !1, discriminator: 1)
!557 = distinct !DILexicalBlock(scope: !558, file: !1, line: 527, column: 2)
!558 = distinct !DILexicalBlock(scope: !96, file: !1, line: 527, column: 2)
!559 = !DILocation(line: 528, column: 2, scope: !560)
!560 = !DILexicalBlockFile(scope: !561, file: !1, discriminator: 1)
!561 = distinct !DILexicalBlock(scope: !562, file: !1, line: 528, column: 2)
!562 = distinct !DILexicalBlock(scope: !96, file: !1, line: 528, column: 2)
!563 = !DILocation(line: 529, column: 2, scope: !564)
!564 = !DILexicalBlockFile(scope: !565, file: !1, discriminator: 1)
!565 = distinct !DILexicalBlock(scope: !566, file: !1, line: 529, column: 2)
!566 = distinct !DILexicalBlock(scope: !96, file: !1, line: 529, column: 2)
!567 = !DILocation(line: 534, column: 2, scope: !96)
!568 = !DILocation(line: 538, column: 14, scope: !99)
!569 = !DILocalVariable(name: "argc", arg: 1, scope: !99, file: !1, line: 538, type: !41)
!570 = !DILocalVariable(name: "args", arg: 2, scope: !99, file: !1, line: 538, type: !102)
!571 = !DILocation(line: 538, column: 27, scope: !99)
!572 = !DILocalVariable(name: "size", scope: !99, file: !1, line: 540, type: !16)
!573 = !DILocation(line: 540, column: 12, scope: !99)
!574 = !DILocalVariable(name: "A_has_ownership", scope: !99, file: !1, line: 542, type: !27)
!575 = !DILocation(line: 542, column: 2, scope: !99)
!576 = !DILocalVariable(name: "B_has_ownership", scope: !99, file: !1, line: 544, type: !27)
!577 = !DILocation(line: 544, column: 2, scope: !99)
!578 = !DILocalVariable(name: "C_has_ownership", scope: !99, file: !1, line: 546, type: !27)
!579 = !DILocation(line: 546, column: 2, scope: !99)
!580 = !DILocalVariable(name: "_7", scope: !99, file: !1, line: 548, type: !581)
!581 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64, align: 64)
!582 = !DILocation(line: 548, column: 2, scope: !99)
!583 = !DILocalVariable(name: "_7_size", scope: !99, file: !1, line: 548, type: !16)
!584 = !DILocalVariable(name: "_7_size_size", scope: !99, file: !1, line: 548, type: !16)
!585 = !DILocalVariable(name: "_7_has_ownership", scope: !99, file: !1, line: 549, type: !27)
!586 = !DILocation(line: 549, column: 2, scope: !99)
!587 = !DILocalVariable(name: "_8", scope: !99, file: !1, line: 550, type: !16)
!588 = !DILocation(line: 550, column: 12, scope: !99)
!589 = !DILocalVariable(name: "_9", scope: !99, file: !1, line: 551, type: !15)
!590 = !DILocation(line: 551, column: 2, scope: !99)
!591 = !DILocalVariable(name: "_9_size", scope: !99, file: !1, line: 551, type: !16)
!592 = !DILocalVariable(name: "_9_has_ownership", scope: !99, file: !1, line: 552, type: !27)
!593 = !DILocation(line: 552, column: 2, scope: !99)
!594 = !DILocalVariable(name: "_12", scope: !99, file: !1, line: 554, type: !15)
!595 = !DILocation(line: 554, column: 2, scope: !99)
!596 = !DILocalVariable(name: "_12_size", scope: !99, file: !1, line: 554, type: !16)
!597 = !DILocalVariable(name: "_12_has_ownership", scope: !99, file: !1, line: 555, type: !27)
!598 = !DILocation(line: 555, column: 2, scope: !99)
!599 = !DILocalVariable(name: "_15_has_ownership", scope: !99, file: !1, line: 558, type: !27)
!600 = !DILocation(line: 558, column: 2, scope: !99)
!601 = !DILocalVariable(name: "_16_has_ownership", scope: !99, file: !1, line: 560, type: !27)
!602 = !DILocation(line: 560, column: 2, scope: !99)
!603 = !DILocalVariable(name: "_17_has_ownership", scope: !99, file: !1, line: 562, type: !27)
!604 = !DILocation(line: 562, column: 2, scope: !99)
!605 = !DILocalVariable(name: "_18", scope: !99, file: !1, line: 563, type: !15)
!606 = !DILocation(line: 563, column: 2, scope: !99)
!607 = !DILocalVariable(name: "_18_size", scope: !99, file: !1, line: 563, type: !16)
!608 = !DILocalVariable(name: "_18_has_ownership", scope: !99, file: !1, line: 564, type: !27)
!609 = !DILocation(line: 564, column: 2, scope: !99)
!610 = !DILocalVariable(name: "_19", scope: !99, file: !1, line: 565, type: !16)
!611 = !DILocation(line: 565, column: 12, scope: !99)
!612 = !DILocalVariable(name: "_20", scope: !99, file: !1, line: 566, type: !16)
!613 = !DILocation(line: 566, column: 12, scope: !99)
!614 = !DILocalVariable(name: "_21", scope: !99, file: !1, line: 567, type: !16)
!615 = !DILocation(line: 567, column: 12, scope: !99)
!616 = !DILocalVariable(name: "_22", scope: !99, file: !1, line: 568, type: !16)
!617 = !DILocation(line: 568, column: 12, scope: !99)
!618 = !DILocalVariable(name: "_23", scope: !99, file: !1, line: 569, type: !16)
!619 = !DILocation(line: 569, column: 12, scope: !99)
!620 = !DILocalVariable(name: "_24", scope: !99, file: !1, line: 570, type: !16)
!621 = !DILocation(line: 570, column: 12, scope: !99)
!622 = !DILocalVariable(name: "_25", scope: !99, file: !1, line: 571, type: !16)
!623 = !DILocation(line: 571, column: 12, scope: !99)
!624 = !DILocalVariable(name: "_26", scope: !99, file: !1, line: 572, type: !16)
!625 = !DILocation(line: 572, column: 12, scope: !99)
!626 = !DILocalVariable(name: "_27", scope: !99, file: !1, line: 573, type: !16)
!627 = !DILocation(line: 573, column: 12, scope: !99)
!628 = !DILocalVariable(name: "_28", scope: !99, file: !1, line: 574, type: !15)
!629 = !DILocation(line: 574, column: 2, scope: !99)
!630 = !DILocalVariable(name: "_28_size", scope: !99, file: !1, line: 574, type: !16)
!631 = !DILocalVariable(name: "_28_has_ownership", scope: !99, file: !1, line: 575, type: !27)
!632 = !DILocation(line: 575, column: 2, scope: !99)
!633 = !DILocalVariable(name: "_29", scope: !99, file: !1, line: 576, type: !16)
!634 = !DILocation(line: 576, column: 12, scope: !99)
!635 = !DILocalVariable(name: "_30", scope: !99, file: !1, line: 577, type: !16)
!636 = !DILocation(line: 577, column: 12, scope: !99)
!637 = !DILocalVariable(name: "_31", scope: !99, file: !1, line: 578, type: !16)
!638 = !DILocation(line: 578, column: 12, scope: !99)
!639 = !DILocalVariable(name: "_32", scope: !99, file: !1, line: 579, type: !16)
!640 = !DILocation(line: 579, column: 12, scope: !99)
!641 = !DILocalVariable(name: "_33", scope: !99, file: !1, line: 580, type: !16)
!642 = !DILocation(line: 580, column: 12, scope: !99)
!643 = !DILocalVariable(name: "_34", scope: !99, file: !1, line: 581, type: !16)
!644 = !DILocation(line: 581, column: 12, scope: !99)
!645 = !DILocalVariable(name: "_35", scope: !99, file: !1, line: 582, type: !16)
!646 = !DILocation(line: 582, column: 12, scope: !99)
!647 = !DILocalVariable(name: "_36", scope: !99, file: !1, line: 583, type: !16)
!648 = !DILocation(line: 583, column: 12, scope: !99)
!649 = !DILocalVariable(name: "_37", scope: !99, file: !1, line: 584, type: !16)
!650 = !DILocation(line: 584, column: 12, scope: !99)
!651 = !DILocalVariable(name: "_38", scope: !99, file: !1, line: 585, type: !16)
!652 = !DILocation(line: 585, column: 12, scope: !99)
!653 = !DILocalVariable(name: "_39", scope: !99, file: !1, line: 586, type: !15)
!654 = !DILocation(line: 586, column: 2, scope: !99)
!655 = !DILocalVariable(name: "_39_size", scope: !99, file: !1, line: 586, type: !16)
!656 = !DILocalVariable(name: "_39_has_ownership", scope: !99, file: !1, line: 587, type: !27)
!657 = !DILocation(line: 587, column: 2, scope: !99)
!658 = !DILocalVariable(name: "_40", scope: !99, file: !1, line: 588, type: !16)
!659 = !DILocation(line: 588, column: 12, scope: !99)
!660 = !DILocalVariable(name: "_41", scope: !99, file: !1, line: 589, type: !16)
!661 = !DILocation(line: 589, column: 12, scope: !99)
!662 = !DILocalVariable(name: "_42", scope: !99, file: !1, line: 590, type: !16)
!663 = !DILocation(line: 590, column: 12, scope: !99)
!664 = !DILocalVariable(name: "_43", scope: !99, file: !1, line: 591, type: !16)
!665 = !DILocation(line: 591, column: 12, scope: !99)
!666 = !DILocalVariable(name: "_44", scope: !99, file: !1, line: 592, type: !16)
!667 = !DILocation(line: 592, column: 12, scope: !99)
!668 = !DILocalVariable(name: "_45", scope: !99, file: !1, line: 593, type: !16)
!669 = !DILocation(line: 593, column: 12, scope: !99)
!670 = !DILocalVariable(name: "_46", scope: !99, file: !1, line: 594, type: !16)
!671 = !DILocation(line: 594, column: 12, scope: !99)
!672 = !DILocalVariable(name: "_47", scope: !99, file: !1, line: 595, type: !16)
!673 = !DILocation(line: 595, column: 12, scope: !99)
!674 = !DILocalVariable(name: "_50", scope: !99, file: !1, line: 597, type: !15)
!675 = !DILocation(line: 597, column: 2, scope: !99)
!676 = !DILocalVariable(name: "_50_size", scope: !99, file: !1, line: 597, type: !16)
!677 = !DILocalVariable(name: "_50_has_ownership", scope: !99, file: !1, line: 598, type: !27)
!678 = !DILocation(line: 598, column: 2, scope: !99)
!679 = !DILocalVariable(name: "_53", scope: !99, file: !1, line: 600, type: !15)
!680 = !DILocation(line: 600, column: 2, scope: !99)
!681 = !DILocalVariable(name: "_53_size", scope: !99, file: !1, line: 600, type: !16)
!682 = !DILocalVariable(name: "_53_has_ownership", scope: !99, file: !1, line: 601, type: !27)
!683 = !DILocation(line: 601, column: 2, scope: !99)
!684 = !DILocalVariable(name: "_54", scope: !99, file: !1, line: 602, type: !16)
!685 = !DILocation(line: 602, column: 12, scope: !99)
!686 = !DILocalVariable(name: "_55", scope: !99, file: !1, line: 603, type: !16)
!687 = !DILocation(line: 603, column: 12, scope: !99)
!688 = !DILocalVariable(name: "_56", scope: !99, file: !1, line: 604, type: !16)
!689 = !DILocation(line: 604, column: 12, scope: !99)
!690 = !DILocalVariable(name: "_57", scope: !99, file: !1, line: 605, type: !16)
!691 = !DILocation(line: 605, column: 12, scope: !99)
!692 = !DILocalVariable(name: "_58", scope: !99, file: !1, line: 606, type: !16)
!693 = !DILocation(line: 606, column: 12, scope: !99)
!694 = !DILocalVariable(name: "_59", scope: !99, file: !1, line: 607, type: !16)
!695 = !DILocation(line: 607, column: 12, scope: !99)
!696 = !DILocalVariable(name: "_60", scope: !99, file: !1, line: 608, type: !16)
!697 = !DILocation(line: 608, column: 12, scope: !99)
!698 = !DILocalVariable(name: "_63", scope: !99, file: !1, line: 610, type: !15)
!699 = !DILocation(line: 610, column: 2, scope: !99)
!700 = !DILocalVariable(name: "_63_size", scope: !99, file: !1, line: 610, type: !16)
!701 = !DILocalVariable(name: "_63_has_ownership", scope: !99, file: !1, line: 611, type: !27)
!702 = !DILocation(line: 611, column: 2, scope: !99)
!703 = !DILocation(line: 613, column: 2, scope: !99)
!704 = !DILocation(line: 618, column: 5, scope: !99)
!705 = !DILocation(line: 620, column: 2, scope: !99)
!706 = !DILocalVariable(name: "_6", scope: !99, file: !1, line: 547, type: !15)
!707 = !DILocation(line: 547, column: 13, scope: !99)
!708 = !DILocalVariable(name: "max", scope: !99, file: !1, line: 539, type: !15)
!709 = !DILocation(line: 539, column: 13, scope: !99)
!710 = !DILocation(line: 624, column: 9, scope: !711)
!711 = distinct !DILexicalBlock(scope: !99, file: !1, line: 624, column: 5)
!712 = !DILocation(line: 624, column: 5, scope: !99)
!713 = !DILocation(line: 626, column: 9, scope: !99)
!714 = !DILocation(line: 631, column: 2, scope: !99)
!715 = !DILocation(line: 632, column: 9, scope: !99)
!716 = !DILocation(line: 632, column: 16, scope: !99)
!717 = !DILocation(line: 632, column: 23, scope: !99)
!718 = !DILocation(line: 632, column: 30, scope: !99)
!719 = !DILocation(line: 632, column: 37, scope: !99)
!720 = !DILocation(line: 632, column: 44, scope: !99)
!721 = !DILocation(line: 632, column: 51, scope: !99)
!722 = !DILocation(line: 632, column: 58, scope: !99)
!723 = !DILocation(line: 632, column: 65, scope: !99)
!724 = !DILocation(line: 632, column: 71, scope: !99)
!725 = !DILocation(line: 632, column: 78, scope: !99)
!726 = !DILocation(line: 632, column: 84, scope: !99)
!727 = !DILocation(line: 632, column: 91, scope: !99)
!728 = !DILocation(line: 635, column: 2, scope: !99)
!729 = !DILocation(line: 639, column: 2, scope: !99)
!730 = !DILocation(line: 642, column: 8, scope: !99)
!731 = !DILocalVariable(name: "_15", scope: !99, file: !1, line: 557, type: !9)
!732 = !DILocation(line: 557, column: 10, scope: !99)
!733 = !DILocalVariable(name: "A", scope: !99, file: !1, line: 541, type: !9)
!734 = !DILocation(line: 541, column: 10, scope: !99)
!735 = !DILocation(line: 651, column: 8, scope: !99)
!736 = !DILocalVariable(name: "_16", scope: !99, file: !1, line: 559, type: !9)
!737 = !DILocation(line: 559, column: 10, scope: !99)
!738 = !DILocalVariable(name: "B", scope: !99, file: !1, line: 543, type: !9)
!739 = !DILocation(line: 543, column: 10, scope: !99)
!740 = !DILocation(line: 662, column: 8, scope: !99)
!741 = !DILocalVariable(name: "_17", scope: !99, file: !1, line: 561, type: !9)
!742 = !DILocation(line: 561, column: 10, scope: !99)
!743 = !DILocalVariable(name: "C", scope: !99, file: !1, line: 545, type: !9)
!744 = !DILocation(line: 545, column: 10, scope: !99)
!745 = !DILocation(line: 673, column: 3, scope: !746)
!746 = distinct !DILexicalBlock(scope: !99, file: !1, line: 670, column: 2)
!747 = !DILocation(line: 682, column: 10, scope: !746)
!748 = !DILocation(line: 686, column: 10, scope: !746)
!749 = !DILocation(line: 688, column: 7, scope: !746)
!750 = !DILocation(line: 692, column: 11, scope: !746)
!751 = !DILocation(line: 694, column: 9, scope: !752)
!752 = distinct !DILexicalBlock(scope: !746, file: !1, line: 694, column: 6)
!753 = !DILocation(line: 694, column: 6, scope: !746)
!754 = !DILocation(line: 696, column: 11, scope: !746)
!755 = !DILocation(line: 696, column: 3, scope: !746)
!756 = !DILocation(line: 697, column: 3, scope: !746)
!757 = !DILocation(line: 706, column: 3, scope: !758)
!758 = distinct !DILexicalBlock(scope: !99, file: !1, line: 703, column: 2)
!759 = !DILocation(line: 715, column: 10, scope: !758)
!760 = !DILocation(line: 719, column: 10, scope: !758)
!761 = !DILocation(line: 721, column: 7, scope: !758)
!762 = !DILocation(line: 725, column: 11, scope: !758)
!763 = !DILocation(line: 727, column: 9, scope: !764)
!764 = distinct !DILexicalBlock(scope: !758, file: !1, line: 727, column: 6)
!765 = !DILocation(line: 727, column: 6, scope: !758)
!766 = !DILocation(line: 729, column: 11, scope: !758)
!767 = !DILocation(line: 729, column: 3, scope: !758)
!768 = !DILocation(line: 730, column: 3, scope: !758)
!769 = !DILocation(line: 738, column: 9, scope: !770)
!770 = distinct !DILexicalBlock(scope: !99, file: !1, line: 738, column: 5)
!771 = !DILocation(line: 738, column: 5, scope: !99)
!772 = !DILocation(line: 743, column: 3, scope: !773)
!773 = distinct !DILexicalBlock(scope: !99, file: !1, line: 740, column: 2)
!774 = !DILocation(line: 752, column: 10, scope: !773)
!775 = !DILocation(line: 756, column: 10, scope: !773)
!776 = !DILocation(line: 758, column: 7, scope: !773)
!777 = !DILocation(line: 762, column: 9, scope: !778)
!778 = distinct !DILexicalBlock(scope: !773, file: !1, line: 762, column: 6)
!779 = !DILocation(line: 762, column: 6, scope: !773)
!780 = !DILocation(line: 764, column: 11, scope: !773)
!781 = !DILocation(line: 764, column: 3, scope: !773)
!782 = !DILocation(line: 765, column: 3, scope: !773)
!783 = !DILocation(line: 776, column: 2, scope: !99)
!784 = !DILocation(line: 777, column: 9, scope: !99)
!785 = !DILocation(line: 777, column: 15, scope: !99)
!786 = !DILocation(line: 777, column: 22, scope: !99)
!787 = !DILocation(line: 777, column: 28, scope: !99)
!788 = !DILocation(line: 777, column: 35, scope: !99)
!789 = !DILocation(line: 777, column: 42, scope: !99)
!790 = !DILocation(line: 777, column: 49, scope: !99)
!791 = !DILocation(line: 777, column: 56, scope: !99)
!792 = !DILocation(line: 777, column: 63, scope: !99)
!793 = !DILocation(line: 777, column: 70, scope: !99)
!794 = !DILocation(line: 777, column: 77, scope: !99)
!795 = !DILocation(line: 777, column: 84, scope: !99)
!796 = !DILocation(line: 777, column: 91, scope: !99)
!797 = !DILocation(line: 777, column: 97, scope: !99)
!798 = !DILocation(line: 777, column: 104, scope: !99)
!799 = !DILocation(line: 777, column: 110, scope: !99)
!800 = !DILocation(line: 777, column: 117, scope: !99)
!801 = !DILocation(line: 777, column: 123, scope: !99)
!802 = !DILocation(line: 777, column: 130, scope: !99)
!803 = !DILocation(line: 777, column: 137, scope: !99)
!804 = !DILocation(line: 777, column: 145, scope: !99)
!805 = !DILocation(line: 777, column: 152, scope: !99)
!806 = !DILocation(line: 777, column: 160, scope: !99)
!807 = !DILocation(line: 777, column: 167, scope: !99)
!808 = !DILocation(line: 777, column: 175, scope: !99)
!809 = !DILocation(line: 777, column: 182, scope: !99)
!810 = !DILocation(line: 777, column: 190, scope: !99)
!811 = !DILocation(line: 777, column: 196, scope: !99)
!812 = !DILocation(line: 777, column: 204, scope: !99)
!813 = !DILocation(line: 777, column: 210, scope: !99)
!814 = !DILocation(line: 777, column: 218, scope: !99)
!815 = !DILocation(line: 777, column: 224, scope: !99)
!816 = !DILocation(line: 777, column: 232, scope: !99)
!817 = !DILocation(line: 777, column: 238, scope: !99)
!818 = !DILocation(line: 777, column: 246, scope: !99)
!819 = !DILocation(line: 777, column: 253, scope: !99)
!820 = !DILocation(line: 777, column: 261, scope: !99)
!821 = !DILocation(line: 777, column: 268, scope: !99)
!822 = !DILocation(line: 777, column: 276, scope: !99)
!823 = !DILocation(line: 777, column: 283, scope: !99)
!824 = !DILocation(line: 777, column: 291, scope: !99)
!825 = !DILocation(line: 777, column: 298, scope: !99)
!826 = !DILocation(line: 777, column: 306, scope: !99)
!827 = !DILocation(line: 777, column: 312, scope: !99)
!828 = !DILocation(line: 777, column: 320, scope: !99)
!829 = !DILocation(line: 777, column: 326, scope: !99)
!830 = !DILocation(line: 777, column: 334, scope: !99)
!831 = !DILocation(line: 777, column: 340, scope: !99)
!832 = !DILocation(line: 777, column: 348, scope: !99)
!833 = !DILocation(line: 777, column: 354, scope: !99)
!834 = !DILocation(line: 777, column: 362, scope: !99)
!835 = !DILocation(line: 777, column: 368, scope: !99)
!836 = !DILocation(line: 777, column: 376, scope: !99)
!837 = !DILocation(line: 780, column: 2, scope: !99)
!838 = !DILocation(line: 785, column: 2, scope: !99)
!839 = !DILocation(line: 794, column: 9, scope: !99)
!840 = !DILocation(line: 798, column: 9, scope: !99)
!841 = !DILocation(line: 800, column: 6, scope: !99)
!842 = !DILocation(line: 802, column: 2, scope: !99)
!843 = !DILocation(line: 807, column: 2, scope: !99)
!844 = !DILocation(line: 808, column: 9, scope: !99)
!845 = !DILocation(line: 808, column: 15, scope: !99)
!846 = !DILocation(line: 808, column: 22, scope: !99)
!847 = !DILocation(line: 808, column: 28, scope: !99)
!848 = !DILocation(line: 808, column: 35, scope: !99)
!849 = !DILocation(line: 808, column: 42, scope: !99)
!850 = !DILocation(line: 808, column: 49, scope: !99)
!851 = !DILocation(line: 808, column: 56, scope: !99)
!852 = !DILocation(line: 808, column: 63, scope: !99)
!853 = !DILocation(line: 808, column: 69, scope: !99)
!854 = !DILocation(line: 808, column: 76, scope: !99)
!855 = !DILocation(line: 808, column: 82, scope: !99)
!856 = !DILocation(line: 808, column: 89, scope: !99)
!857 = !DILocation(line: 808, column: 95, scope: !99)
!858 = !DILocation(line: 808, column: 102, scope: !99)
!859 = !DILocation(line: 808, column: 109, scope: !99)
!860 = !DILocation(line: 808, column: 116, scope: !99)
!861 = !DILocation(line: 808, column: 123, scope: !99)
!862 = !DILocation(line: 808, column: 130, scope: !99)
!863 = !DILocation(line: 808, column: 137, scope: !99)
!864 = !DILocation(line: 808, column: 145, scope: !99)
!865 = !DILocation(line: 808, column: 152, scope: !99)
!866 = !DILocation(line: 808, column: 160, scope: !99)
!867 = !DILocation(line: 808, column: 166, scope: !99)
!868 = !DILocation(line: 808, column: 174, scope: !99)
!869 = !DILocation(line: 808, column: 181, scope: !99)
!870 = !DILocation(line: 808, column: 189, scope: !99)
!871 = !DILocation(line: 808, column: 196, scope: !99)
!872 = !DILocation(line: 808, column: 204, scope: !99)
!873 = !DILocation(line: 808, column: 211, scope: !99)
!874 = !DILocation(line: 808, column: 219, scope: !99)
!875 = !DILocation(line: 808, column: 225, scope: !99)
!876 = !DILocation(line: 808, column: 233, scope: !99)
!877 = !DILocation(line: 808, column: 240, scope: !99)
!878 = !DILocation(line: 808, column: 248, scope: !99)
!879 = !DILocation(line: 808, column: 255, scope: !99)
!880 = !DILocation(line: 808, column: 263, scope: !99)
!881 = !DILocation(line: 808, column: 270, scope: !99)
!882 = !DILocation(line: 808, column: 278, scope: !99)
!883 = !DILocation(line: 808, column: 285, scope: !99)
!884 = !DILocation(line: 808, column: 293, scope: !99)
!885 = !DILocation(line: 808, column: 299, scope: !99)
!886 = !DILocation(line: 808, column: 307, scope: !99)
!887 = !DILocation(line: 808, column: 313, scope: !99)
!888 = !DILocation(line: 808, column: 321, scope: !99)
!889 = !DILocation(line: 808, column: 327, scope: !99)
!890 = !DILocation(line: 808, column: 335, scope: !99)
!891 = !DILocation(line: 808, column: 342, scope: !99)
!892 = !DILocation(line: 808, column: 350, scope: !99)
!893 = !DILocation(line: 811, column: 2, scope: !99)
!894 = !DILocation(line: 815, column: 2, scope: !99)
!895 = !DILocation(line: 815, column: 2, scope: !896)
!896 = !DILexicalBlockFile(scope: !897, file: !1, discriminator: 1)
!897 = distinct !DILexicalBlock(scope: !898, file: !1, line: 815, column: 2)
!898 = distinct !DILexicalBlock(scope: !99, file: !1, line: 815, column: 2)
!899 = !DILocation(line: 816, column: 2, scope: !900)
!900 = !DILexicalBlockFile(scope: !901, file: !1, discriminator: 1)
!901 = distinct !DILexicalBlock(scope: !902, file: !1, line: 816, column: 2)
!902 = distinct !DILexicalBlock(scope: !99, file: !1, line: 816, column: 2)
!903 = !DILocation(line: 817, column: 2, scope: !904)
!904 = !DILexicalBlockFile(scope: !905, file: !1, discriminator: 1)
!905 = distinct !DILexicalBlock(scope: !906, file: !1, line: 817, column: 2)
!906 = distinct !DILexicalBlock(scope: !99, file: !1, line: 817, column: 2)
!907 = !DILocation(line: 818, column: 2, scope: !908)
!908 = !DILexicalBlockFile(scope: !909, file: !1, discriminator: 1)
!909 = distinct !DILexicalBlock(scope: !910, file: !1, line: 818, column: 2)
!910 = distinct !DILexicalBlock(scope: !99, file: !1, line: 818, column: 2)
!911 = !DILocation(line: 820, column: 2, scope: !912)
!912 = !DILexicalBlockFile(scope: !913, file: !1, discriminator: 1)
!913 = distinct !DILexicalBlock(scope: !914, file: !1, line: 820, column: 2)
!914 = distinct !DILexicalBlock(scope: !99, file: !1, line: 820, column: 2)
!915 = !DILocation(line: 824, column: 2, scope: !916)
!916 = !DILexicalBlockFile(scope: !917, file: !1, discriminator: 1)
!917 = distinct !DILexicalBlock(scope: !918, file: !1, line: 824, column: 2)
!918 = distinct !DILexicalBlock(scope: !99, file: !1, line: 824, column: 2)
!919 = !DILocation(line: 825, column: 2, scope: !920)
!920 = !DILexicalBlockFile(scope: !921, file: !1, discriminator: 1)
!921 = distinct !DILexicalBlock(scope: !922, file: !1, line: 825, column: 2)
!922 = distinct !DILexicalBlock(scope: !99, file: !1, line: 825, column: 2)
!923 = !DILocation(line: 826, column: 2, scope: !924)
!924 = distinct !DILexicalBlock(scope: !99, file: !1, line: 826, column: 2)
!925 = !DILocation(line: 826, column: 2, scope: !99)
!926 = !DILocation(line: 826, column: 2, scope: !927)
!927 = !DILexicalBlockFile(scope: !928, file: !1, discriminator: 1)
!928 = distinct !DILexicalBlock(scope: !924, file: !1, line: 826, column: 2)
!929 = !DILocation(line: 827, column: 2, scope: !99)
!930 = !DILocation(line: 827, column: 2, scope: !931)
!931 = !DILexicalBlockFile(scope: !932, file: !1, discriminator: 1)
!932 = distinct !DILexicalBlock(scope: !933, file: !1, line: 827, column: 2)
!933 = distinct !DILexicalBlock(scope: !99, file: !1, line: 827, column: 2)
!934 = !DILocation(line: 828, column: 2, scope: !935)
!935 = !DILexicalBlockFile(scope: !936, file: !1, discriminator: 1)
!936 = distinct !DILexicalBlock(scope: !937, file: !1, line: 828, column: 2)
!937 = distinct !DILexicalBlock(scope: !99, file: !1, line: 828, column: 2)
!938 = !DILocation(line: 829, column: 2, scope: !939)
!939 = !DILexicalBlockFile(scope: !940, file: !1, discriminator: 1)
!940 = distinct !DILexicalBlock(scope: !941, file: !1, line: 829, column: 2)
!941 = distinct !DILexicalBlock(scope: !99, file: !1, line: 829, column: 2)
!942 = !DILocation(line: 830, column: 2, scope: !99)
