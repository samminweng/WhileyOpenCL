; ModuleID = 'MatrixMult.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i32*, i32, i32 }

@.str = private unnamed_addr constant [46 x i8] c"Pass %d X %d matrix test case (C[%d][%d]=%d)\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.Matrix* @init(i32 %value, i32 %width, i32 %height) #0 !dbg !15 {
entry:
  %value.addr = alloca i32, align 4
  %width.addr = alloca i32, align 4
  %height.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i32*, align 8
  %matrix = alloca %struct.Matrix*, align 8
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !31, metadata !32), !dbg !33
  store i32 %width, i32* %width.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %width.addr, metadata !34, metadata !32), !dbg !35
  store i32 %height, i32* %height.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %height.addr, metadata !36, metadata !32), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %i, metadata !38, metadata !32), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %j, metadata !40, metadata !32), !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data, metadata !42, metadata !32), !dbg !43
  %0 = load i32, i32* %height.addr, align 4, !dbg !44
  %1 = load i32, i32* %width.addr, align 4, !dbg !45
  %mul = mul nsw i32 %0, %1, !dbg !46
  %conv = sext i32 %mul to i64, !dbg !44
  %mul1 = mul i64 %conv, 4, !dbg !47
  %call = call noalias i8* @malloc(i64 %mul1) #4, !dbg !48
  %2 = bitcast i8* %call to i32*, !dbg !49
  store i32* %2, i32** %data, align 8, !dbg !43
  store i32 0, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc8, %entry
  %3 = load i32, i32* %i, align 4, !dbg !53
  %4 = load i32, i32* %height.addr, align 4, !dbg !56
  %cmp = icmp slt i32 %3, %4, !dbg !57
  br i1 %cmp, label %for.body, label %for.end10, !dbg !58

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !59
  br label %for.cond3, !dbg !62

for.cond3:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4, !dbg !63
  %6 = load i32, i32* %width.addr, align 4, !dbg !66
  %cmp4 = icmp slt i32 %5, %6, !dbg !67
  br i1 %cmp4, label %for.body6, label %for.end, !dbg !68

for.body6:                                        ; preds = %for.cond3
  %7 = load i32, i32* %value.addr, align 4, !dbg !69
  %8 = load i32, i32* %i, align 4, !dbg !71
  %9 = load i32, i32* %width.addr, align 4, !dbg !72
  %mul7 = mul nsw i32 %8, %9, !dbg !73
  %10 = load i32, i32* %j, align 4, !dbg !74
  %add = add nsw i32 %mul7, %10, !dbg !75
  %idxprom = sext i32 %add to i64, !dbg !76
  %11 = load i32*, i32** %data, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 %idxprom, !dbg !76
  store i32 %7, i32* %arrayidx, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body6
  %12 = load i32, i32* %j, align 4, !dbg !79
  %inc = add nsw i32 %12, 1, !dbg !79
  store i32 %inc, i32* %j, align 4, !dbg !79
  br label %for.cond3, !dbg !81

for.end:                                          ; preds = %for.cond3
  br label %for.inc8, !dbg !82

for.inc8:                                         ; preds = %for.end
  %13 = load i32, i32* %i, align 4, !dbg !83
  %inc9 = add nsw i32 %13, 1, !dbg !83
  store i32 %inc9, i32* %i, align 4, !dbg !83
  br label %for.cond, !dbg !85

for.end10:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.Matrix** %matrix, metadata !86, metadata !32), !dbg !87
  %call11 = call noalias i8* @malloc(i64 16) #4, !dbg !88
  %14 = bitcast i8* %call11 to %struct.Matrix*, !dbg !89
  store %struct.Matrix* %14, %struct.Matrix** %matrix, align 8, !dbg !87
  %15 = load i32*, i32** %data, align 8, !dbg !90
  %16 = load %struct.Matrix*, %struct.Matrix** %matrix, align 8, !dbg !91
  %data12 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %16, i32 0, i32 0, !dbg !92
  store i32* %15, i32** %data12, align 8, !dbg !93
  %17 = load i32, i32* %width.addr, align 4, !dbg !94
  %18 = load %struct.Matrix*, %struct.Matrix** %matrix, align 8, !dbg !95
  %width13 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %18, i32 0, i32 1, !dbg !96
  store i32 %17, i32* %width13, align 8, !dbg !97
  %19 = load i32, i32* %height.addr, align 4, !dbg !98
  %20 = load %struct.Matrix*, %struct.Matrix** %matrix, align 8, !dbg !99
  %height14 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %20, i32 0, i32 2, !dbg !100
  store i32 %19, i32* %height14, align 4, !dbg !101
  %21 = load %struct.Matrix*, %struct.Matrix** %matrix, align 8, !dbg !102
  ret %struct.Matrix* %21, !dbg !103
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define %struct.Matrix* @matrix_multiply(%struct.Matrix* noalias %A, %struct.Matrix* noalias %B) #0 !dbg !19 {
entry:
  %A.addr = alloca %struct.Matrix*, align 8
  %B.addr = alloca %struct.Matrix*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %A_data = alloca i32*, align 8
  %B_data = alloca i32*, align 8
  %width = alloca i32, align 4
  %height = alloca i32, align 4
  %C_data = alloca i32*, align 8
  %C = alloca %struct.Matrix*, align 8
  store %struct.Matrix* %A, %struct.Matrix** %A.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Matrix** %A.addr, metadata !104, metadata !32), !dbg !105
  store %struct.Matrix* %B, %struct.Matrix** %B.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Matrix** %B.addr, metadata !106, metadata !32), !dbg !107
  call void @llvm.dbg.declare(metadata i32* %i, metadata !108, metadata !32), !dbg !109
  call void @llvm.dbg.declare(metadata i32* %j, metadata !110, metadata !32), !dbg !111
  call void @llvm.dbg.declare(metadata i32* %k, metadata !112, metadata !32), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %A_data, metadata !114, metadata !32), !dbg !115
  %0 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8, !dbg !116
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %0, i32 0, i32 0, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !117
  store i32* %1, i32** %A_data, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %B_data, metadata !118, metadata !32), !dbg !119
  %2 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8, !dbg !120
  %data1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %2, i32 0, i32 0, !dbg !121
  %3 = load i32*, i32** %data1, align 8, !dbg !121
  store i32* %3, i32** %B_data, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i32* %width, metadata !122, metadata !32), !dbg !123
  %4 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8, !dbg !124
  %width2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %4, i32 0, i32 1, !dbg !125
  %5 = load i32, i32* %width2, align 8, !dbg !125
  store i32 %5, i32* %width, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %height, metadata !126, metadata !32), !dbg !127
  %6 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8, !dbg !128
  %height3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %6, i32 0, i32 2, !dbg !129
  %7 = load i32, i32* %height3, align 4, !dbg !129
  store i32 %7, i32* %height, align 4, !dbg !127
  call void @llvm.dbg.declare(metadata i32** %C_data, metadata !130, metadata !32), !dbg !131
  %8 = load i32, i32* %width, align 4, !dbg !132
  %9 = load i32, i32* %height, align 4, !dbg !133
  %mul = mul nsw i32 %8, %9, !dbg !134
  %conv = sext i32 %mul to i64, !dbg !132
  %mul4 = mul i64 %conv, 4, !dbg !135
  %call = call noalias i8* @malloc(i64 %mul4) #4, !dbg !136
  %10 = bitcast i8* %call to i32*, !dbg !137
  store i32* %10, i32** %C_data, align 8, !dbg !131
  store i32 0, i32* %i, align 4, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc39, %entry
  %11 = load i32, i32* %i, align 4, !dbg !141
  %12 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8, !dbg !144
  %height5 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %12, i32 0, i32 2, !dbg !145
  %13 = load i32, i32* %height5, align 4, !dbg !145
  %cmp = icmp slt i32 %11, %13, !dbg !146
  br i1 %cmp, label %for.body, label %for.end41, !dbg !147

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !148
  br label %for.cond7, !dbg !151

for.cond7:                                        ; preds = %for.inc36, %for.body
  %14 = load i32, i32* %j, align 4, !dbg !152
  %15 = load %struct.Matrix*, %struct.Matrix** %B.addr, align 8, !dbg !155
  %width8 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %15, i32 0, i32 1, !dbg !156
  %16 = load i32, i32* %width8, align 8, !dbg !156
  %cmp9 = icmp slt i32 %14, %16, !dbg !157
  br i1 %cmp9, label %for.body11, label %for.end38, !dbg !158

for.body11:                                       ; preds = %for.cond7
  %17 = load i32, i32* %i, align 4, !dbg !159
  %18 = load i32, i32* %width, align 4, !dbg !161
  %mul12 = mul nsw i32 %17, %18, !dbg !162
  %19 = load i32, i32* %j, align 4, !dbg !163
  %add = add nsw i32 %mul12, %19, !dbg !164
  %idxprom = sext i32 %add to i64, !dbg !165
  %20 = load i32*, i32** %C_data, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i32, i32* %20, i64 %idxprom, !dbg !165
  store i32 0, i32* %arrayidx, align 4, !dbg !166
  store i32 0, i32* %k, align 4, !dbg !167
  br label %for.cond13, !dbg !169

for.cond13:                                       ; preds = %for.inc, %for.body11
  %21 = load i32, i32* %k, align 4, !dbg !170
  %22 = load %struct.Matrix*, %struct.Matrix** %A.addr, align 8, !dbg !173
  %width14 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %22, i32 0, i32 1, !dbg !174
  %23 = load i32, i32* %width14, align 8, !dbg !174
  %cmp15 = icmp slt i32 %21, %23, !dbg !175
  br i1 %cmp15, label %for.body17, label %for.end, !dbg !176

for.body17:                                       ; preds = %for.cond13
  %24 = load i32, i32* %i, align 4, !dbg !177
  %25 = load i32, i32* %width, align 4, !dbg !179
  %mul18 = mul nsw i32 %24, %25, !dbg !180
  %26 = load i32, i32* %j, align 4, !dbg !181
  %add19 = add nsw i32 %mul18, %26, !dbg !182
  %idxprom20 = sext i32 %add19 to i64, !dbg !183
  %27 = load i32*, i32** %C_data, align 8, !dbg !183
  %arrayidx21 = getelementptr inbounds i32, i32* %27, i64 %idxprom20, !dbg !183
  %28 = load i32, i32* %arrayidx21, align 4, !dbg !183
  %29 = load i32, i32* %i, align 4, !dbg !184
  %30 = load i32, i32* %width, align 4, !dbg !185
  %mul22 = mul nsw i32 %29, %30, !dbg !186
  %31 = load i32, i32* %k, align 4, !dbg !187
  %add23 = add nsw i32 %mul22, %31, !dbg !188
  %idxprom24 = sext i32 %add23 to i64, !dbg !189
  %32 = load i32*, i32** %A_data, align 8, !dbg !189
  %arrayidx25 = getelementptr inbounds i32, i32* %32, i64 %idxprom24, !dbg !189
  %33 = load i32, i32* %arrayidx25, align 4, !dbg !189
  %34 = load i32, i32* %k, align 4, !dbg !190
  %35 = load i32, i32* %width, align 4, !dbg !191
  %mul26 = mul nsw i32 %34, %35, !dbg !192
  %36 = load i32, i32* %j, align 4, !dbg !193
  %add27 = add nsw i32 %mul26, %36, !dbg !194
  %idxprom28 = sext i32 %add27 to i64, !dbg !195
  %37 = load i32*, i32** %B_data, align 8, !dbg !195
  %arrayidx29 = getelementptr inbounds i32, i32* %37, i64 %idxprom28, !dbg !195
  %38 = load i32, i32* %arrayidx29, align 4, !dbg !195
  %mul30 = mul nsw i32 %33, %38, !dbg !196
  %add31 = add nsw i32 %28, %mul30, !dbg !197
  %39 = load i32, i32* %i, align 4, !dbg !198
  %40 = load i32, i32* %width, align 4, !dbg !199
  %mul32 = mul nsw i32 %39, %40, !dbg !200
  %41 = load i32, i32* %j, align 4, !dbg !201
  %add33 = add nsw i32 %mul32, %41, !dbg !202
  %idxprom34 = sext i32 %add33 to i64, !dbg !203
  %42 = load i32*, i32** %C_data, align 8, !dbg !203
  %arrayidx35 = getelementptr inbounds i32, i32* %42, i64 %idxprom34, !dbg !203
  store i32 %add31, i32* %arrayidx35, align 4, !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body17
  %43 = load i32, i32* %k, align 4, !dbg !206
  %inc = add nsw i32 %43, 1, !dbg !206
  store i32 %inc, i32* %k, align 4, !dbg !206
  br label %for.cond13, !dbg !208

for.end:                                          ; preds = %for.cond13
  br label %for.inc36, !dbg !209

for.inc36:                                        ; preds = %for.end
  %44 = load i32, i32* %j, align 4, !dbg !210
  %inc37 = add nsw i32 %44, 1, !dbg !210
  store i32 %inc37, i32* %j, align 4, !dbg !210
  br label %for.cond7, !dbg !212

for.end38:                                        ; preds = %for.cond7
  br label %for.inc39, !dbg !213

for.inc39:                                        ; preds = %for.end38
  %45 = load i32, i32* %i, align 4, !dbg !214
  %inc40 = add nsw i32 %45, 1, !dbg !214
  store i32 %inc40, i32* %i, align 4, !dbg !214
  br label %for.cond, !dbg !216

for.end41:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct.Matrix** %C, metadata !217, metadata !32), !dbg !218
  %call42 = call noalias i8* @malloc(i64 16) #4, !dbg !219
  %46 = bitcast i8* %call42 to %struct.Matrix*, !dbg !220
  store %struct.Matrix* %46, %struct.Matrix** %C, align 8, !dbg !218
  %47 = load i32*, i32** %C_data, align 8, !dbg !221
  %48 = load %struct.Matrix*, %struct.Matrix** %C, align 8, !dbg !222
  %data43 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %48, i32 0, i32 0, !dbg !223
  store i32* %47, i32** %data43, align 8, !dbg !224
  %49 = load i32, i32* %width, align 4, !dbg !225
  %50 = load %struct.Matrix*, %struct.Matrix** %C, align 8, !dbg !226
  %width44 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %50, i32 0, i32 1, !dbg !227
  store i32 %49, i32* %width44, align 8, !dbg !228
  %51 = load i32, i32* %height, align 4, !dbg !229
  %52 = load %struct.Matrix*, %struct.Matrix** %C, align 8, !dbg !230
  %height45 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %52, i32 0, i32 2, !dbg !231
  store i32 %51, i32* %height45, align 4, !dbg !232
  %53 = load %struct.Matrix*, %struct.Matrix** %C, align 8, !dbg !233
  ret %struct.Matrix* %53, !dbg !234
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #0 !dbg !22 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %A = alloca %struct.Matrix*, align 8
  %B = alloca %struct.Matrix*, align 8
  %C = alloca %struct.Matrix*, align 8
  %width = alloca i32, align 4
  %height = alloca i32, align 4
  %array = alloca i32**, align 8
  %max = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !235, metadata !32), !dbg !236
  store i8** %args, i8*** %args.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %args.addr, metadata !237, metadata !32), !dbg !238
  call void @llvm.dbg.declare(metadata %struct.Matrix** %A, metadata !239, metadata !32), !dbg !240
  store %struct.Matrix* null, %struct.Matrix** %A, align 8, !dbg !240
  call void @llvm.dbg.declare(metadata %struct.Matrix** %B, metadata !241, metadata !32), !dbg !242
  store %struct.Matrix* null, %struct.Matrix** %B, align 8, !dbg !242
  call void @llvm.dbg.declare(metadata %struct.Matrix** %C, metadata !243, metadata !32), !dbg !244
  store %struct.Matrix* null, %struct.Matrix** %C, align 8, !dbg !244
  call void @llvm.dbg.declare(metadata i32* %width, metadata !245, metadata !32), !dbg !246
  call void @llvm.dbg.declare(metadata i32* %height, metadata !247, metadata !32), !dbg !248
  call void @llvm.dbg.declare(metadata i32*** %array, metadata !249, metadata !32), !dbg !251
  %0 = load i32, i32* %argc.addr, align 4, !dbg !252
  %1 = load i8**, i8*** %args.addr, align 8, !dbg !253
  %call = call i64** @convertArgsToIntArray(i32 %0, i8** %1), !dbg !254
  %2 = bitcast i64** %call to i32**, !dbg !254
  store i32** %2, i32*** %array, align 8, !dbg !251
  call void @llvm.dbg.declare(metadata i32* %max, metadata !255, metadata !32), !dbg !256
  %3 = load i32**, i32*** %array, align 8, !dbg !257
  %arrayidx = getelementptr inbounds i32*, i32** %3, i64 0, !dbg !257
  %4 = load i32*, i32** %arrayidx, align 8, !dbg !257
  %5 = bitcast i32* %4 to i64*, !dbg !257
  %call1 = call i64 @parseStringToInt(i64* %5), !dbg !258
  %conv = trunc i64 %call1 to i32, !dbg !258
  store i32 %conv, i32* %max, align 4, !dbg !256
  %6 = load i32, i32* %max, align 4, !dbg !259
  store i32 %6, i32* %width, align 4, !dbg !260
  %7 = load i32, i32* %max, align 4, !dbg !261
  store i32 %7, i32* %height, align 4, !dbg !262
  %8 = load i32, i32* %width, align 4, !dbg !263
  %9 = load i32, i32* %height, align 4, !dbg !264
  %call2 = call %struct.Matrix* @init(i32 1, i32 %8, i32 %9), !dbg !265
  store %struct.Matrix* %call2, %struct.Matrix** %A, align 8, !dbg !266
  %10 = load i32, i32* %width, align 4, !dbg !267
  %11 = load i32, i32* %height, align 4, !dbg !268
  %call3 = call %struct.Matrix* @init(i32 1, i32 %10, i32 %11), !dbg !269
  store %struct.Matrix* %call3, %struct.Matrix** %B, align 8, !dbg !270
  %12 = load %struct.Matrix*, %struct.Matrix** %A, align 8, !dbg !271
  %13 = load %struct.Matrix*, %struct.Matrix** %B, align 8, !dbg !272
  %call4 = call %struct.Matrix* @matrix_multiply(%struct.Matrix* %12, %struct.Matrix* %13), !dbg !273
  store %struct.Matrix* %call4, %struct.Matrix** %C, align 8, !dbg !274
  %14 = load i32, i32* %max, align 4, !dbg !275
  %15 = load i32, i32* %max, align 4, !dbg !276
  %16 = load i32, i32* %max, align 4, !dbg !277
  %sub = sub nsw i32 %16, 1, !dbg !278
  %17 = load i32, i32* %max, align 4, !dbg !279
  %sub5 = sub nsw i32 %17, 1, !dbg !280
  %18 = load i32, i32* %max, align 4, !dbg !281
  %sub6 = sub nsw i32 %18, 1, !dbg !282
  %19 = load i32, i32* %max, align 4, !dbg !283
  %mul = mul nsw i32 %sub6, %19, !dbg !284
  %20 = load i32, i32* %max, align 4, !dbg !285
  %add = add nsw i32 %mul, %20, !dbg !286
  %sub7 = sub nsw i32 %add, 1, !dbg !287
  %idxprom = sext i32 %sub7 to i64, !dbg !288
  %21 = load %struct.Matrix*, %struct.Matrix** %C, align 8, !dbg !289
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %21, i32 0, i32 0, !dbg !290
  %22 = load i32*, i32** %data, align 8, !dbg !290
  %arrayidx8 = getelementptr inbounds i32, i32* %22, i64 %idxprom, !dbg !288
  %23 = load i32, i32* %arrayidx8, align 4, !dbg !288
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str, i32 0, i32 0), i32 %14, i32 %15, i32 %sub, i32 %sub5, i32 %23), !dbg !291
  ret i32 0, !dbg !292
}

declare i64** @convertArgsToIntArray(i32, i8**) #3

declare i64 @parseStringToInt(i64*) #3

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !14)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "Matrix", file: !1, line: 9, baseType: !8)
!8 = !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 5, size: 128, align: 64, elements: !9)
!9 = !{!10, !12, !13}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !8, file: !1, line: 6, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !4)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !8, file: !1, line: 7, baseType: !5, size: 32, align: 32, offset: 64)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !8, file: !1, line: 8, baseType: !5, size: 32, align: 32, offset: 96)
!14 = !{!15, !19, !22}
!15 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 11, type: !16, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !5, !5, !5}
!18 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !6)
!19 = distinct !DISubprogram(name: "matrix_multiply", scope: !1, file: !1, line: 29, type: !20, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!18, !18, !18}
!22 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 85, type: !23, isLocal: false, isDefinition: true, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!5, !5, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, align: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64, align: 64)
!27 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!28 = !{i32 2, !"Dwarf Version", i32 4}
!29 = !{i32 2, !"Debug Info Version", i32 3}
!30 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git e177b4a63ca92c5fec010986944530688e104074) (http://llvm.org/git/llvm.git fcd97ccb03712372fe95f1732638de5ed3fcabe8)"}
!31 = !DILocalVariable(name: "value", arg: 1, scope: !15, file: !1, line: 11, type: !5)
!32 = !DIExpression()
!33 = !DILocation(line: 11, column: 31, scope: !15)
!34 = !DILocalVariable(name: "width", arg: 2, scope: !15, file: !1, line: 11, type: !5)
!35 = !DILocation(line: 11, column: 42, scope: !15)
!36 = !DILocalVariable(name: "height", arg: 3, scope: !15, file: !1, line: 11, type: !5)
!37 = !DILocation(line: 11, column: 53, scope: !15)
!38 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 13, type: !5)
!39 = !DILocation(line: 13, column: 9, scope: !15)
!40 = !DILocalVariable(name: "j", scope: !15, file: !1, line: 13, type: !5)
!41 = !DILocation(line: 13, column: 12, scope: !15)
!42 = !DILocalVariable(name: "data", scope: !15, file: !1, line: 15, type: !11)
!43 = !DILocation(line: 15, column: 23, scope: !15)
!44 = !DILocation(line: 15, column: 43, scope: !15)
!45 = !DILocation(line: 15, column: 50, scope: !15)
!46 = !DILocation(line: 15, column: 49, scope: !15)
!47 = !DILocation(line: 15, column: 55, scope: !15)
!48 = !DILocation(line: 15, column: 36, scope: !15)
!49 = !DILocation(line: 15, column: 30, scope: !15)
!50 = !DILocation(line: 16, column: 10, scope: !51)
!51 = distinct !DILexicalBlock(scope: !15, file: !1, line: 16, column: 5)
!52 = !DILocation(line: 16, column: 9, scope: !51)
!53 = !DILocation(line: 16, column: 13, scope: !54)
!54 = !DILexicalBlockFile(scope: !55, file: !1, discriminator: 1)
!55 = distinct !DILexicalBlock(scope: !51, file: !1, line: 16, column: 5)
!56 = !DILocation(line: 16, column: 15, scope: !54)
!57 = !DILocation(line: 16, column: 14, scope: !54)
!58 = !DILocation(line: 16, column: 5, scope: !54)
!59 = !DILocation(line: 17, column: 14, scope: !60)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 17, column: 9)
!61 = distinct !DILexicalBlock(scope: !55, file: !1, line: 16, column: 26)
!62 = !DILocation(line: 17, column: 13, scope: !60)
!63 = !DILocation(line: 17, column: 17, scope: !64)
!64 = !DILexicalBlockFile(scope: !65, file: !1, discriminator: 1)
!65 = distinct !DILexicalBlock(scope: !60, file: !1, line: 17, column: 9)
!66 = !DILocation(line: 17, column: 19, scope: !64)
!67 = !DILocation(line: 17, column: 18, scope: !64)
!68 = !DILocation(line: 17, column: 9, scope: !64)
!69 = !DILocation(line: 18, column: 31, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !1, line: 17, column: 29)
!71 = !DILocation(line: 18, column: 18, scope: !70)
!72 = !DILocation(line: 18, column: 20, scope: !70)
!73 = !DILocation(line: 18, column: 19, scope: !70)
!74 = !DILocation(line: 18, column: 26, scope: !70)
!75 = !DILocation(line: 18, column: 25, scope: !70)
!76 = !DILocation(line: 18, column: 13, scope: !70)
!77 = !DILocation(line: 18, column: 29, scope: !70)
!78 = !DILocation(line: 19, column: 9, scope: !70)
!79 = !DILocation(line: 17, column: 26, scope: !80)
!80 = !DILexicalBlockFile(scope: !65, file: !1, discriminator: 2)
!81 = !DILocation(line: 17, column: 9, scope: !80)
!82 = !DILocation(line: 20, column: 5, scope: !61)
!83 = !DILocation(line: 16, column: 23, scope: !84)
!84 = !DILexicalBlockFile(scope: !55, file: !1, discriminator: 2)
!85 = !DILocation(line: 16, column: 5, scope: !84)
!86 = !DILocalVariable(name: "matrix", scope: !15, file: !1, line: 21, type: !18)
!87 = !DILocation(line: 21, column: 26, scope: !15)
!88 = !DILocation(line: 21, column: 44, scope: !15)
!89 = !DILocation(line: 21, column: 35, scope: !15)
!90 = !DILocation(line: 22, column: 20, scope: !15)
!91 = !DILocation(line: 22, column: 5, scope: !15)
!92 = !DILocation(line: 22, column: 13, scope: !15)
!93 = !DILocation(line: 22, column: 18, scope: !15)
!94 = !DILocation(line: 23, column: 21, scope: !15)
!95 = !DILocation(line: 23, column: 5, scope: !15)
!96 = !DILocation(line: 23, column: 13, scope: !15)
!97 = !DILocation(line: 23, column: 19, scope: !15)
!98 = !DILocation(line: 24, column: 22, scope: !15)
!99 = !DILocation(line: 24, column: 5, scope: !15)
!100 = !DILocation(line: 24, column: 13, scope: !15)
!101 = !DILocation(line: 24, column: 20, scope: !15)
!102 = !DILocation(line: 26, column: 12, scope: !15)
!103 = !DILocation(line: 26, column: 5, scope: !15)
!104 = !DILocalVariable(name: "A", arg: 1, scope: !19, file: !1, line: 29, type: !18)
!105 = !DILocation(line: 29, column: 59, scope: !19)
!106 = !DILocalVariable(name: "B", arg: 2, scope: !19, file: !1, line: 29, type: !18)
!107 = !DILocation(line: 29, column: 83, scope: !19)
!108 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 30, type: !5)
!109 = !DILocation(line: 30, column: 9, scope: !19)
!110 = !DILocalVariable(name: "j", scope: !19, file: !1, line: 30, type: !5)
!111 = !DILocation(line: 30, column: 11, scope: !19)
!112 = !DILocalVariable(name: "k", scope: !19, file: !1, line: 30, type: !5)
!113 = !DILocation(line: 30, column: 13, scope: !19)
!114 = !DILocalVariable(name: "A_data", scope: !19, file: !1, line: 31, type: !11)
!115 = !DILocation(line: 31, column: 23, scope: !19)
!116 = !DILocation(line: 31, column: 32, scope: !19)
!117 = !DILocation(line: 31, column: 35, scope: !19)
!118 = !DILocalVariable(name: "B_data", scope: !19, file: !1, line: 32, type: !11)
!119 = !DILocation(line: 32, column: 23, scope: !19)
!120 = !DILocation(line: 32, column: 32, scope: !19)
!121 = !DILocation(line: 32, column: 35, scope: !19)
!122 = !DILocalVariable(name: "width", scope: !19, file: !1, line: 34, type: !5)
!123 = !DILocation(line: 34, column: 9, scope: !19)
!124 = !DILocation(line: 34, column: 17, scope: !19)
!125 = !DILocation(line: 34, column: 20, scope: !19)
!126 = !DILocalVariable(name: "height", scope: !19, file: !1, line: 35, type: !5)
!127 = !DILocation(line: 35, column: 9, scope: !19)
!128 = !DILocation(line: 35, column: 18, scope: !19)
!129 = !DILocation(line: 35, column: 21, scope: !19)
!130 = !DILocalVariable(name: "C_data", scope: !19, file: !1, line: 36, type: !11)
!131 = !DILocation(line: 36, column: 23, scope: !19)
!132 = !DILocation(line: 36, column: 45, scope: !19)
!133 = !DILocation(line: 36, column: 51, scope: !19)
!134 = !DILocation(line: 36, column: 50, scope: !19)
!135 = !DILocation(line: 36, column: 57, scope: !19)
!136 = !DILocation(line: 36, column: 38, scope: !19)
!137 = !DILocation(line: 36, column: 32, scope: !19)
!138 = !DILocation(line: 37, column: 10, scope: !139)
!139 = distinct !DILexicalBlock(scope: !19, file: !1, line: 37, column: 5)
!140 = !DILocation(line: 37, column: 9, scope: !139)
!141 = !DILocation(line: 37, column: 14, scope: !142)
!142 = !DILexicalBlockFile(scope: !143, file: !1, discriminator: 1)
!143 = distinct !DILexicalBlock(scope: !139, file: !1, line: 37, column: 5)
!144 = !DILocation(line: 37, column: 16, scope: !142)
!145 = !DILocation(line: 37, column: 19, scope: !142)
!146 = !DILocation(line: 37, column: 15, scope: !142)
!147 = !DILocation(line: 37, column: 5, scope: !142)
!148 = !DILocation(line: 39, column: 14, scope: !149)
!149 = distinct !DILexicalBlock(scope: !150, file: !1, line: 39, column: 9)
!150 = distinct !DILexicalBlock(scope: !143, file: !1, line: 37, column: 33)
!151 = !DILocation(line: 39, column: 13, scope: !149)
!152 = !DILocation(line: 39, column: 17, scope: !153)
!153 = !DILexicalBlockFile(scope: !154, file: !1, discriminator: 1)
!154 = distinct !DILexicalBlock(scope: !149, file: !1, line: 39, column: 9)
!155 = !DILocation(line: 39, column: 19, scope: !153)
!156 = !DILocation(line: 39, column: 22, scope: !153)
!157 = !DILocation(line: 39, column: 18, scope: !153)
!158 = !DILocation(line: 39, column: 9, scope: !153)
!159 = !DILocation(line: 40, column: 20, scope: !160)
!160 = distinct !DILexicalBlock(scope: !154, file: !1, line: 39, column: 32)
!161 = !DILocation(line: 40, column: 22, scope: !160)
!162 = !DILocation(line: 40, column: 21, scope: !160)
!163 = !DILocation(line: 40, column: 28, scope: !160)
!164 = !DILocation(line: 40, column: 27, scope: !160)
!165 = !DILocation(line: 40, column: 13, scope: !160)
!166 = !DILocation(line: 40, column: 31, scope: !160)
!167 = !DILocation(line: 41, column: 18, scope: !168)
!168 = distinct !DILexicalBlock(scope: !160, file: !1, line: 41, column: 13)
!169 = !DILocation(line: 41, column: 17, scope: !168)
!170 = !DILocation(line: 41, column: 21, scope: !171)
!171 = !DILexicalBlockFile(scope: !172, file: !1, discriminator: 1)
!172 = distinct !DILexicalBlock(scope: !168, file: !1, line: 41, column: 13)
!173 = !DILocation(line: 41, column: 23, scope: !171)
!174 = !DILocation(line: 41, column: 26, scope: !171)
!175 = !DILocation(line: 41, column: 22, scope: !171)
!176 = !DILocation(line: 41, column: 13, scope: !171)
!177 = !DILocation(line: 42, column: 44, scope: !178)
!178 = distinct !DILexicalBlock(scope: !172, file: !1, line: 41, column: 36)
!179 = !DILocation(line: 42, column: 46, scope: !178)
!180 = !DILocation(line: 42, column: 45, scope: !178)
!181 = !DILocation(line: 42, column: 52, scope: !178)
!182 = !DILocation(line: 42, column: 51, scope: !178)
!183 = !DILocation(line: 42, column: 37, scope: !178)
!184 = !DILocation(line: 42, column: 64, scope: !178)
!185 = !DILocation(line: 42, column: 66, scope: !178)
!186 = !DILocation(line: 42, column: 65, scope: !178)
!187 = !DILocation(line: 42, column: 72, scope: !178)
!188 = !DILocation(line: 42, column: 71, scope: !178)
!189 = !DILocation(line: 42, column: 57, scope: !178)
!190 = !DILocation(line: 42, column: 82, scope: !178)
!191 = !DILocation(line: 42, column: 84, scope: !178)
!192 = !DILocation(line: 42, column: 83, scope: !178)
!193 = !DILocation(line: 42, column: 90, scope: !178)
!194 = !DILocation(line: 42, column: 89, scope: !178)
!195 = !DILocation(line: 42, column: 75, scope: !178)
!196 = !DILocation(line: 42, column: 74, scope: !178)
!197 = !DILocation(line: 42, column: 55, scope: !178)
!198 = !DILocation(line: 42, column: 24, scope: !178)
!199 = !DILocation(line: 42, column: 26, scope: !178)
!200 = !DILocation(line: 42, column: 25, scope: !178)
!201 = !DILocation(line: 42, column: 32, scope: !178)
!202 = !DILocation(line: 42, column: 31, scope: !178)
!203 = !DILocation(line: 42, column: 17, scope: !178)
!204 = !DILocation(line: 42, column: 35, scope: !178)
!205 = !DILocation(line: 43, column: 13, scope: !178)
!206 = !DILocation(line: 41, column: 33, scope: !207)
!207 = !DILexicalBlockFile(scope: !172, file: !1, discriminator: 2)
!208 = !DILocation(line: 41, column: 13, scope: !207)
!209 = !DILocation(line: 44, column: 9, scope: !160)
!210 = !DILocation(line: 39, column: 29, scope: !211)
!211 = !DILexicalBlockFile(scope: !154, file: !1, discriminator: 2)
!212 = !DILocation(line: 39, column: 9, scope: !211)
!213 = !DILocation(line: 45, column: 5, scope: !150)
!214 = !DILocation(line: 37, column: 28, scope: !215)
!215 = !DILexicalBlockFile(scope: !143, file: !1, discriminator: 2)
!216 = !DILocation(line: 37, column: 5, scope: !215)
!217 = !DILocalVariable(name: "C", scope: !19, file: !1, line: 47, type: !18)
!218 = !DILocation(line: 47, column: 26, scope: !19)
!219 = !DILocation(line: 47, column: 39, scope: !19)
!220 = !DILocation(line: 47, column: 30, scope: !19)
!221 = !DILocation(line: 48, column: 15, scope: !19)
!222 = !DILocation(line: 48, column: 5, scope: !19)
!223 = !DILocation(line: 48, column: 8, scope: !19)
!224 = !DILocation(line: 48, column: 13, scope: !19)
!225 = !DILocation(line: 49, column: 16, scope: !19)
!226 = !DILocation(line: 49, column: 5, scope: !19)
!227 = !DILocation(line: 49, column: 8, scope: !19)
!228 = !DILocation(line: 49, column: 14, scope: !19)
!229 = !DILocation(line: 50, column: 17, scope: !19)
!230 = !DILocation(line: 50, column: 5, scope: !19)
!231 = !DILocation(line: 50, column: 8, scope: !19)
!232 = !DILocation(line: 50, column: 15, scope: !19)
!233 = !DILocation(line: 52, column: 12, scope: !19)
!234 = !DILocation(line: 52, column: 5, scope: !19)
!235 = !DILocalVariable(name: "argc", arg: 1, scope: !22, file: !1, line: 85, type: !5)
!236 = !DILocation(line: 85, column: 14, scope: !22)
!237 = !DILocalVariable(name: "args", arg: 2, scope: !22, file: !1, line: 85, type: !25)
!238 = !DILocation(line: 85, column: 27, scope: !22)
!239 = !DILocalVariable(name: "A", scope: !22, file: !1, line: 94, type: !18)
!240 = !DILocation(line: 94, column: 26, scope: !22)
!241 = !DILocalVariable(name: "B", scope: !22, file: !1, line: 95, type: !18)
!242 = !DILocation(line: 95, column: 26, scope: !22)
!243 = !DILocalVariable(name: "C", scope: !22, file: !1, line: 96, type: !18)
!244 = !DILocation(line: 96, column: 26, scope: !22)
!245 = !DILocalVariable(name: "width", scope: !22, file: !1, line: 97, type: !5)
!246 = !DILocation(line: 97, column: 9, scope: !22)
!247 = !DILocalVariable(name: "height", scope: !22, file: !1, line: 97, type: !5)
!248 = !DILocation(line: 97, column: 16, scope: !22)
!249 = !DILocalVariable(name: "array", scope: !22, file: !1, line: 99, type: !250)
!250 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, align: 64)
!251 = !DILocation(line: 99, column: 11, scope: !22)
!252 = !DILocation(line: 99, column: 41, scope: !22)
!253 = !DILocation(line: 99, column: 47, scope: !22)
!254 = !DILocation(line: 99, column: 19, scope: !22)
!255 = !DILocalVariable(name: "max", scope: !22, file: !1, line: 100, type: !5)
!256 = !DILocation(line: 100, column: 9, scope: !22)
!257 = !DILocation(line: 100, column: 32, scope: !22)
!258 = !DILocation(line: 100, column: 15, scope: !22)
!259 = !DILocation(line: 101, column: 13, scope: !22)
!260 = !DILocation(line: 101, column: 11, scope: !22)
!261 = !DILocation(line: 102, column: 14, scope: !22)
!262 = !DILocation(line: 102, column: 12, scope: !22)
!263 = !DILocation(line: 105, column: 15, scope: !22)
!264 = !DILocation(line: 105, column: 22, scope: !22)
!265 = !DILocation(line: 105, column: 7, scope: !22)
!266 = !DILocation(line: 105, column: 6, scope: !22)
!267 = !DILocation(line: 106, column: 15, scope: !22)
!268 = !DILocation(line: 106, column: 22, scope: !22)
!269 = !DILocation(line: 106, column: 7, scope: !22)
!270 = !DILocation(line: 106, column: 6, scope: !22)
!271 = !DILocation(line: 108, column: 23, scope: !22)
!272 = !DILocation(line: 108, column: 26, scope: !22)
!273 = !DILocation(line: 108, column: 7, scope: !22)
!274 = !DILocation(line: 108, column: 6, scope: !22)
!275 = !DILocation(line: 109, column: 62, scope: !22)
!276 = !DILocation(line: 109, column: 67, scope: !22)
!277 = !DILocation(line: 109, column: 72, scope: !22)
!278 = !DILocation(line: 109, column: 75, scope: !22)
!279 = !DILocation(line: 109, column: 79, scope: !22)
!280 = !DILocation(line: 109, column: 82, scope: !22)
!281 = !DILocation(line: 109, column: 97, scope: !22)
!282 = !DILocation(line: 109, column: 100, scope: !22)
!283 = !DILocation(line: 109, column: 104, scope: !22)
!284 = !DILocation(line: 109, column: 103, scope: !22)
!285 = !DILocation(line: 109, column: 108, scope: !22)
!286 = !DILocation(line: 109, column: 107, scope: !22)
!287 = !DILocation(line: 109, column: 111, scope: !22)
!288 = !DILocation(line: 109, column: 86, scope: !22)
!289 = !DILocation(line: 109, column: 87, scope: !22)
!290 = !DILocation(line: 109, column: 90, scope: !22)
!291 = !DILocation(line: 109, column: 5, scope: !22)
!292 = !DILocation(line: 111, column: 5, scope: !22)
