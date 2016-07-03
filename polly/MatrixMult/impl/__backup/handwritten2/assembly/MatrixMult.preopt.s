; ModuleID = 'MatrixMult.c'
source_filename = "MatrixMult.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Matrix = type { i64*, i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"N = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"Pass %d X %d matrix test case \0A\00", align 1
@.str.3 = private unnamed_addr constant [59 x i8] c"A[%dX%d+%d] = %lld, B[%dX%d+%d] =%lld, C[%dX%d+%d] =%lld \0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define %struct.Matrix* @init(i32 %width, i32 %height) #0 !dbg !7 {
entry:
  %width.addr = alloca i32, align 4
  %height.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %data = alloca i64*, align 8
  %m = alloca %struct.Matrix*, align 8
  store i32 %width, i32* %width.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %width.addr, metadata !30, metadata !31), !dbg !32
  store i32 %height, i32* %height.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %height.addr, metadata !33, metadata !31), !dbg !34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !31), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %j, metadata !37, metadata !31), !dbg !38
  call void @llvm.dbg.declare(metadata i64** %data, metadata !39, metadata !31), !dbg !40
  %0 = load i32, i32* %height.addr, align 4, !dbg !41
  %1 = load i32, i32* %width.addr, align 4, !dbg !42
  %mul = mul nsw i32 %0, %1, !dbg !43
  %conv = sext i32 %mul to i64, !dbg !41
  %mul1 = mul i64 %conv, 8, !dbg !44
  %call = call noalias i8* @malloc(i64 %mul1) #5, !dbg !45
  %2 = bitcast i8* %call to i64*, !dbg !46
  store i64* %2, i64** %data, align 8, !dbg !40
  store i32 0, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc8, %entry
  %3 = load i32, i32* %i, align 4, !dbg !50
  %4 = load i32, i32* %height.addr, align 4, !dbg !53
  %cmp = icmp slt i32 %3, %4, !dbg !54
  br i1 %cmp, label %for.body, label %for.end10, !dbg !55

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !56
  br label %for.cond3, !dbg !59

for.cond3:                                        ; preds = %for.inc, %for.body
  %5 = load i32, i32* %j, align 4, !dbg !60
  %6 = load i32, i32* %width.addr, align 4, !dbg !63
  %cmp4 = icmp slt i32 %5, %6, !dbg !64
  br i1 %cmp4, label %for.body6, label %for.end, !dbg !65

for.body6:                                        ; preds = %for.cond3
  %7 = load i32, i32* %i, align 4, !dbg !66
  %8 = load i32, i32* %width.addr, align 4, !dbg !68
  %mul7 = mul nsw i32 %7, %8, !dbg !69
  %9 = load i32, i32* %j, align 4, !dbg !70
  %add = add nsw i32 %mul7, %9, !dbg !71
  %idxprom = sext i32 %add to i64, !dbg !72
  %10 = load i64*, i64** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 %idxprom, !dbg !72
  store i64 0, i64* %arrayidx, align 8, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body6
  %11 = load i32, i32* %j, align 4, !dbg !75
  %inc = add nsw i32 %11, 1, !dbg !75
  store i32 %inc, i32* %j, align 4, !dbg !75
  br label %for.cond3, !dbg !77

for.end:                                          ; preds = %for.cond3
  br label %for.inc8, !dbg !78

for.inc8:                                         ; preds = %for.end
  %12 = load i32, i32* %i, align 4, !dbg !79
  %inc9 = add nsw i32 %12, 1, !dbg !79
  store i32 %inc9, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !81

for.end10:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !82
  br label %for.cond11, !dbg !84

for.cond11:                                       ; preds = %for.inc32, %for.end10
  %13 = load i32, i32* %i, align 4, !dbg !85
  %14 = load i32, i32* %height.addr, align 4, !dbg !88
  %cmp12 = icmp slt i32 %13, %14, !dbg !89
  br i1 %cmp12, label %for.body14, label %for.end34, !dbg !90

for.body14:                                       ; preds = %for.cond11
  store i32 0, i32* %j, align 4, !dbg !91
  br label %for.cond15, !dbg !94

for.cond15:                                       ; preds = %for.inc29, %for.body14
  %15 = load i32, i32* %j, align 4, !dbg !95
  %16 = load i32, i32* %width.addr, align 4, !dbg !98
  %cmp16 = icmp slt i32 %15, %16, !dbg !99
  br i1 %cmp16, label %for.body18, label %for.end31, !dbg !100

for.body18:                                       ; preds = %for.cond15
  %17 = load i32, i32* %i, align 4, !dbg !101
  %18 = load i32, i32* %width.addr, align 4, !dbg !103
  %mul19 = mul nsw i32 %17, %18, !dbg !104
  %19 = load i32, i32* %j, align 4, !dbg !105
  %add20 = add nsw i32 %mul19, %19, !dbg !106
  %idxprom21 = sext i32 %add20 to i64, !dbg !107
  %20 = load i64*, i64** %data, align 8, !dbg !107
  %arrayidx22 = getelementptr inbounds i64, i64* %20, i64 %idxprom21, !dbg !107
  %21 = load i64, i64* %arrayidx22, align 8, !dbg !107
  %22 = load i32, i32* %i, align 4, !dbg !108
  %conv23 = sext i32 %22 to i64, !dbg !108
  %add24 = add nsw i64 %21, %conv23, !dbg !109
  %23 = load i32, i32* %i, align 4, !dbg !110
  %24 = load i32, i32* %width.addr, align 4, !dbg !111
  %mul25 = mul nsw i32 %23, %24, !dbg !112
  %25 = load i32, i32* %j, align 4, !dbg !113
  %add26 = add nsw i32 %mul25, %25, !dbg !114
  %idxprom27 = sext i32 %add26 to i64, !dbg !115
  %26 = load i64*, i64** %data, align 8, !dbg !115
  %arrayidx28 = getelementptr inbounds i64, i64* %26, i64 %idxprom27, !dbg !115
  store i64 %add24, i64* %arrayidx28, align 8, !dbg !116
  br label %for.inc29, !dbg !117

for.inc29:                                        ; preds = %for.body18
  %27 = load i32, i32* %j, align 4, !dbg !118
  %inc30 = add nsw i32 %27, 1, !dbg !118
  store i32 %inc30, i32* %j, align 4, !dbg !118
  br label %for.cond15, !dbg !120

for.end31:                                        ; preds = %for.cond15
  br label %for.inc32, !dbg !121

for.inc32:                                        ; preds = %for.end31
  %28 = load i32, i32* %i, align 4, !dbg !122
  %inc33 = add nsw i32 %28, 1, !dbg !122
  store i32 %inc33, i32* %i, align 4, !dbg !122
  br label %for.cond11, !dbg !124

for.end34:                                        ; preds = %for.cond11
  call void @llvm.dbg.declare(metadata %struct.Matrix** %m, metadata !125, metadata !31), !dbg !126
  %call35 = call noalias i8* @malloc(i64 16) #5, !dbg !127
  %29 = bitcast i8* %call35 to %struct.Matrix*, !dbg !127
  store %struct.Matrix* %29, %struct.Matrix** %m, align 8, !dbg !126
  %30 = load i64*, i64** %data, align 8, !dbg !128
  %31 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !129
  %data36 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %31, i32 0, i32 0, !dbg !130
  store i64* %30, i64** %data36, align 8, !dbg !131
  %32 = load i32, i32* %width.addr, align 4, !dbg !132
  %33 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !133
  %width37 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %33, i32 0, i32 1, !dbg !134
  store i32 %32, i32* %width37, align 8, !dbg !135
  %34 = load i32, i32* %height.addr, align 4, !dbg !136
  %35 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !137
  %height38 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %35, i32 0, i32 2, !dbg !138
  store i32 %34, i32* %height38, align 4, !dbg !139
  %36 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !140
  ret %struct.Matrix* %36, !dbg !141
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: noinline nounwind uwtable
define %struct.Matrix* @matmult(%struct.Matrix* %a, %struct.Matrix* %b) #0 !dbg !18 {
entry:
  %a.addr = alloca %struct.Matrix*, align 8
  %b.addr = alloca %struct.Matrix*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %width = alloca i32, align 4
  %height = alloca i32, align 4
  %a_data = alloca i64*, align 8
  %b_data = alloca i64*, align 8
  %data4 = alloca i64*, align 8
  %b_t = alloca i64*, align 8
  %m = alloca %struct.Matrix*, align 8
  store %struct.Matrix* %a, %struct.Matrix** %a.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Matrix** %a.addr, metadata !142, metadata !31), !dbg !143
  store %struct.Matrix* %b, %struct.Matrix** %b.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Matrix** %b.addr, metadata !144, metadata !31), !dbg !145
  call void @llvm.dbg.declare(metadata i32* %i, metadata !146, metadata !31), !dbg !147
  call void @llvm.dbg.declare(metadata i32* %j, metadata !148, metadata !31), !dbg !149
  call void @llvm.dbg.declare(metadata i32* %k, metadata !150, metadata !31), !dbg !151
  call void @llvm.dbg.declare(metadata i32* %width, metadata !152, metadata !31), !dbg !153
  %0 = load %struct.Matrix*, %struct.Matrix** %b.addr, align 8, !dbg !154
  %width1 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %0, i32 0, i32 1, !dbg !155
  %1 = load i32, i32* %width1, align 8, !dbg !155
  store i32 %1, i32* %width, align 4, !dbg !153
  call void @llvm.dbg.declare(metadata i32* %height, metadata !156, metadata !31), !dbg !157
  %2 = load %struct.Matrix*, %struct.Matrix** %a.addr, align 8, !dbg !158
  %height2 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %2, i32 0, i32 2, !dbg !159
  %3 = load i32, i32* %height2, align 4, !dbg !159
  store i32 %3, i32* %height, align 4, !dbg !157
  call void @llvm.dbg.declare(metadata i64** %a_data, metadata !160, metadata !31), !dbg !161
  %4 = load %struct.Matrix*, %struct.Matrix** %a.addr, align 8, !dbg !162
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %4, i32 0, i32 0, !dbg !163
  %5 = load i64*, i64** %data, align 8, !dbg !163
  store i64* %5, i64** %a_data, align 8, !dbg !161
  call void @llvm.dbg.declare(metadata i64** %b_data, metadata !164, metadata !31), !dbg !165
  %6 = load %struct.Matrix*, %struct.Matrix** %b.addr, align 8, !dbg !166
  %data3 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %6, i32 0, i32 0, !dbg !167
  %7 = load i64*, i64** %data3, align 8, !dbg !167
  store i64* %7, i64** %b_data, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata i64** %data4, metadata !168, metadata !31), !dbg !169
  %8 = load i32, i32* %height, align 4, !dbg !170
  %9 = load i32, i32* %width, align 4, !dbg !171
  %mul = mul nsw i32 %8, %9, !dbg !172
  %conv = sext i32 %mul to i64, !dbg !170
  %mul5 = mul i64 %conv, 8, !dbg !173
  %call = call noalias i8* @malloc(i64 %mul5) #5, !dbg !174
  %10 = bitcast i8* %call to i64*, !dbg !175
  store i64* %10, i64** %data4, align 8, !dbg !169
  call void @llvm.dbg.declare(metadata i64** %b_t, metadata !176, metadata !31), !dbg !177
  %11 = load i32, i32* %width, align 4, !dbg !178
  %12 = load i32, i32* %height, align 4, !dbg !179
  %mul6 = mul nsw i32 %11, %12, !dbg !180
  %conv7 = sext i32 %mul6 to i64, !dbg !178
  %mul8 = mul i64 %conv7, 8, !dbg !181
  %call9 = call noalias i8* @malloc(i64 %mul8) #5, !dbg !182
  %13 = bitcast i8* %call9 to i64*, !dbg !182
  store i64* %13, i64** %b_t, align 8, !dbg !177
  store i32 0, i32* %j, align 4, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc20, %entry
  %14 = load i32, i32* %j, align 4, !dbg !186
  %15 = load i32, i32* %height, align 4, !dbg !189
  %cmp = icmp slt i32 %14, %15, !dbg !190
  br i1 %cmp, label %for.body, label %for.end22, !dbg !191

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !192
  br label %for.cond11, !dbg !195

for.cond11:                                       ; preds = %for.inc, %for.body
  %16 = load i32, i32* %i, align 4, !dbg !196
  %17 = load i32, i32* %width, align 4, !dbg !199
  %cmp12 = icmp slt i32 %16, %17, !dbg !200
  br i1 %cmp12, label %for.body14, label %for.end, !dbg !201

for.body14:                                       ; preds = %for.cond11
  %18 = load i32, i32* %i, align 4, !dbg !202
  %19 = load i32, i32* %width, align 4, !dbg !204
  %mul15 = mul nsw i32 %18, %19, !dbg !205
  %20 = load i32, i32* %j, align 4, !dbg !206
  %add = add nsw i32 %mul15, %20, !dbg !207
  %idxprom = sext i32 %add to i64, !dbg !208
  %21 = load i64*, i64** %b_data, align 8, !dbg !208
  %arrayidx = getelementptr inbounds i64, i64* %21, i64 %idxprom, !dbg !208
  %22 = load i64, i64* %arrayidx, align 8, !dbg !208
  %23 = load i32, i32* %j, align 4, !dbg !209
  %24 = load i32, i32* %width, align 4, !dbg !210
  %mul16 = mul nsw i32 %23, %24, !dbg !211
  %25 = load i32, i32* %i, align 4, !dbg !212
  %add17 = add nsw i32 %mul16, %25, !dbg !213
  %idxprom18 = sext i32 %add17 to i64, !dbg !214
  %26 = load i64*, i64** %b_t, align 8, !dbg !214
  %arrayidx19 = getelementptr inbounds i64, i64* %26, i64 %idxprom18, !dbg !214
  store i64 %22, i64* %arrayidx19, align 8, !dbg !215
  br label %for.inc, !dbg !216

for.inc:                                          ; preds = %for.body14
  %27 = load i32, i32* %i, align 4, !dbg !217
  %inc = add nsw i32 %27, 1, !dbg !217
  store i32 %inc, i32* %i, align 4, !dbg !217
  br label %for.cond11, !dbg !219

for.end:                                          ; preds = %for.cond11
  br label %for.inc20, !dbg !220

for.inc20:                                        ; preds = %for.end
  %28 = load i32, i32* %j, align 4, !dbg !221
  %inc21 = add nsw i32 %28, 1, !dbg !221
  store i32 %inc21, i32* %j, align 4, !dbg !221
  br label %for.cond, !dbg !223

for.end22:                                        ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !224
  br label %for.cond23, !dbg !226

for.cond23:                                       ; preds = %for.inc63, %for.end22
  %29 = load i32, i32* %j, align 4, !dbg !227
  %30 = load i32, i32* %height, align 4, !dbg !230
  %cmp24 = icmp slt i32 %29, %30, !dbg !231
  br i1 %cmp24, label %for.body26, label %for.end65, !dbg !232

for.body26:                                       ; preds = %for.cond23
  store i32 0, i32* %i, align 4, !dbg !233
  br label %for.cond27, !dbg !236

for.cond27:                                       ; preds = %for.inc60, %for.body26
  %31 = load i32, i32* %i, align 4, !dbg !237
  %32 = load i32, i32* %width, align 4, !dbg !240
  %cmp28 = icmp slt i32 %31, %32, !dbg !241
  br i1 %cmp28, label %for.body30, label %for.end62, !dbg !242

for.body30:                                       ; preds = %for.cond27
  %33 = load i32, i32* %i, align 4, !dbg !243
  %34 = load i32, i32* %width, align 4, !dbg !245
  %mul31 = mul nsw i32 %33, %34, !dbg !246
  %35 = load i32, i32* %j, align 4, !dbg !247
  %add32 = add nsw i32 %mul31, %35, !dbg !248
  %idxprom33 = sext i32 %add32 to i64, !dbg !249
  %36 = load i64*, i64** %data4, align 8, !dbg !249
  %arrayidx34 = getelementptr inbounds i64, i64* %36, i64 %idxprom33, !dbg !249
  store i64 0, i64* %arrayidx34, align 8, !dbg !250
  store i32 0, i32* %k, align 4, !dbg !251
  br label %for.cond35, !dbg !253

for.cond35:                                       ; preds = %for.inc57, %for.body30
  %37 = load i32, i32* %k, align 4, !dbg !254
  %38 = load i32, i32* %width, align 4, !dbg !257
  %cmp36 = icmp slt i32 %37, %38, !dbg !258
  br i1 %cmp36, label %for.body38, label %for.end59, !dbg !259

for.body38:                                       ; preds = %for.cond35
  %39 = load i32, i32* %i, align 4, !dbg !260
  %40 = load i32, i32* %width, align 4, !dbg !262
  %mul39 = mul nsw i32 %39, %40, !dbg !263
  %41 = load i32, i32* %j, align 4, !dbg !264
  %add40 = add nsw i32 %mul39, %41, !dbg !265
  %idxprom41 = sext i32 %add40 to i64, !dbg !266
  %42 = load i64*, i64** %data4, align 8, !dbg !266
  %arrayidx42 = getelementptr inbounds i64, i64* %42, i64 %idxprom41, !dbg !266
  %43 = load i64, i64* %arrayidx42, align 8, !dbg !266
  %44 = load i32, i32* %i, align 4, !dbg !267
  %45 = load i32, i32* %width, align 4, !dbg !268
  %mul43 = mul nsw i32 %44, %45, !dbg !269
  %46 = load i32, i32* %k, align 4, !dbg !270
  %add44 = add nsw i32 %mul43, %46, !dbg !271
  %idxprom45 = sext i32 %add44 to i64, !dbg !272
  %47 = load i64*, i64** %a_data, align 8, !dbg !272
  %arrayidx46 = getelementptr inbounds i64, i64* %47, i64 %idxprom45, !dbg !272
  %48 = load i64, i64* %arrayidx46, align 8, !dbg !272
  %49 = load i32, i32* %i, align 4, !dbg !273
  %50 = load i32, i32* %width, align 4, !dbg !274
  %mul47 = mul nsw i32 %49, %50, !dbg !275
  %51 = load i32, i32* %k, align 4, !dbg !276
  %add48 = add nsw i32 %mul47, %51, !dbg !277
  %idxprom49 = sext i32 %add48 to i64, !dbg !278
  %52 = load i64*, i64** %b_t, align 8, !dbg !278
  %arrayidx50 = getelementptr inbounds i64, i64* %52, i64 %idxprom49, !dbg !278
  %53 = load i64, i64* %arrayidx50, align 8, !dbg !278
  %mul51 = mul nsw i64 %48, %53, !dbg !279
  %add52 = add nsw i64 %43, %mul51, !dbg !280
  %54 = load i32, i32* %i, align 4, !dbg !281
  %55 = load i32, i32* %width, align 4, !dbg !282
  %mul53 = mul nsw i32 %54, %55, !dbg !283
  %56 = load i32, i32* %j, align 4, !dbg !284
  %add54 = add nsw i32 %mul53, %56, !dbg !285
  %idxprom55 = sext i32 %add54 to i64, !dbg !286
  %57 = load i64*, i64** %data4, align 8, !dbg !286
  %arrayidx56 = getelementptr inbounds i64, i64* %57, i64 %idxprom55, !dbg !286
  store i64 %add52, i64* %arrayidx56, align 8, !dbg !287
  br label %for.inc57, !dbg !288

for.inc57:                                        ; preds = %for.body38
  %58 = load i32, i32* %k, align 4, !dbg !289
  %inc58 = add nsw i32 %58, 1, !dbg !289
  store i32 %inc58, i32* %k, align 4, !dbg !289
  br label %for.cond35, !dbg !291

for.end59:                                        ; preds = %for.cond35
  br label %for.inc60, !dbg !292

for.inc60:                                        ; preds = %for.end59
  %59 = load i32, i32* %i, align 4, !dbg !293
  %inc61 = add nsw i32 %59, 1, !dbg !293
  store i32 %inc61, i32* %i, align 4, !dbg !293
  br label %for.cond27, !dbg !295

for.end62:                                        ; preds = %for.cond27
  br label %for.inc63, !dbg !296

for.inc63:                                        ; preds = %for.end62
  %60 = load i32, i32* %j, align 4, !dbg !297
  %inc64 = add nsw i32 %60, 1, !dbg !297
  store i32 %inc64, i32* %j, align 4, !dbg !297
  br label %for.cond23, !dbg !299

for.end65:                                        ; preds = %for.cond23
  call void @llvm.dbg.declare(metadata %struct.Matrix** %m, metadata !300, metadata !31), !dbg !301
  %call66 = call noalias i8* @malloc(i64 16) #5, !dbg !302
  %61 = bitcast i8* %call66 to %struct.Matrix*, !dbg !302
  store %struct.Matrix* %61, %struct.Matrix** %m, align 8, !dbg !301
  %62 = load i32, i32* %width, align 4, !dbg !303
  %63 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !304
  %width67 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %63, i32 0, i32 1, !dbg !305
  store i32 %62, i32* %width67, align 8, !dbg !306
  %64 = load i32, i32* %height, align 4, !dbg !307
  %65 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !308
  %height68 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %65, i32 0, i32 2, !dbg !309
  store i32 %64, i32* %height68, align 4, !dbg !310
  %66 = load i64*, i64** %data4, align 8, !dbg !311
  %67 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !312
  %data69 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %67, i32 0, i32 0, !dbg !313
  store i64* %66, i64** %data69, align 8, !dbg !314
  %68 = load %struct.Matrix*, %struct.Matrix** %m, align 8, !dbg !315
  ret %struct.Matrix* %68, !dbg !316
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %args) #3 !dbg !21 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %args.addr = alloca i8**, align 8
  %max = alloca i32, align 4
  %a = alloca %struct.Matrix*, align 8
  %b = alloca %struct.Matrix*, align 8
  %c = alloca %struct.Matrix*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !317, metadata !31), !dbg !318
  store i8** %args, i8*** %args.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %args.addr, metadata !319, metadata !31), !dbg !320
  call void @llvm.dbg.declare(metadata i32* %max, metadata !321, metadata !31), !dbg !322
  %0 = load i8**, i8*** %args.addr, align 8, !dbg !323
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !dbg !323
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !323
  %call = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i32* %max) #5, !dbg !324
  %2 = load i32, i32* %max, align 4, !dbg !325
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 %2), !dbg !326
  call void @llvm.dbg.declare(metadata %struct.Matrix** %a, metadata !327, metadata !31), !dbg !328
  %3 = load i32, i32* %max, align 4, !dbg !329
  %4 = load i32, i32* %max, align 4, !dbg !330
  %call2 = call %struct.Matrix* @init(i32 %3, i32 %4), !dbg !331
  store %struct.Matrix* %call2, %struct.Matrix** %a, align 8, !dbg !328
  call void @llvm.dbg.declare(metadata %struct.Matrix** %b, metadata !332, metadata !31), !dbg !333
  %5 = load i32, i32* %max, align 4, !dbg !334
  %6 = load i32, i32* %max, align 4, !dbg !335
  %call3 = call %struct.Matrix* @init(i32 %5, i32 %6), !dbg !336
  store %struct.Matrix* %call3, %struct.Matrix** %b, align 8, !dbg !333
  call void @llvm.dbg.declare(metadata %struct.Matrix** %c, metadata !337, metadata !31), !dbg !338
  %7 = load %struct.Matrix*, %struct.Matrix** %a, align 8, !dbg !339
  %8 = load %struct.Matrix*, %struct.Matrix** %b, align 8, !dbg !340
  %call4 = call %struct.Matrix* @matmult(%struct.Matrix* %7, %struct.Matrix* %8), !dbg !341
  store %struct.Matrix* %call4, %struct.Matrix** %c, align 8, !dbg !338
  %9 = load i32, i32* %max, align 4, !dbg !342
  %10 = load i32, i32* %max, align 4, !dbg !343
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i32 0, i32 0), i32 %9, i32 %10), !dbg !344
  %11 = load i32, i32* %max, align 4, !dbg !345
  %sub = sub nsw i32 %11, 1, !dbg !346
  %12 = load i32, i32* %max, align 4, !dbg !347
  %13 = load i32, i32* %max, align 4, !dbg !348
  %sub6 = sub nsw i32 %13, 1, !dbg !349
  %14 = load i32, i32* %max, align 4, !dbg !350
  %sub7 = sub nsw i32 %14, 1, !dbg !351
  %15 = load i32, i32* %max, align 4, !dbg !352
  %mul = mul nsw i32 %sub7, %15, !dbg !353
  %16 = load i32, i32* %max, align 4, !dbg !354
  %add = add nsw i32 %mul, %16, !dbg !355
  %sub8 = sub nsw i32 %add, 1, !dbg !356
  %idxprom = sext i32 %sub8 to i64, !dbg !357
  %17 = load %struct.Matrix*, %struct.Matrix** %a, align 8, !dbg !357
  %data = getelementptr inbounds %struct.Matrix, %struct.Matrix* %17, i32 0, i32 0, !dbg !358
  %18 = load i64*, i64** %data, align 8, !dbg !358
  %arrayidx9 = getelementptr inbounds i64, i64* %18, i64 %idxprom, !dbg !357
  %19 = load i64, i64* %arrayidx9, align 8, !dbg !357
  %20 = load i32, i32* %max, align 4, !dbg !359
  %sub10 = sub nsw i32 %20, 1, !dbg !360
  %21 = load i32, i32* %max, align 4, !dbg !361
  %22 = load i32, i32* %max, align 4, !dbg !362
  %sub11 = sub nsw i32 %22, 1, !dbg !363
  %23 = load i32, i32* %max, align 4, !dbg !364
  %sub12 = sub nsw i32 %23, 1, !dbg !365
  %24 = load i32, i32* %max, align 4, !dbg !366
  %mul13 = mul nsw i32 %sub12, %24, !dbg !367
  %25 = load i32, i32* %max, align 4, !dbg !368
  %add14 = add nsw i32 %mul13, %25, !dbg !369
  %sub15 = sub nsw i32 %add14, 1, !dbg !370
  %idxprom16 = sext i32 %sub15 to i64, !dbg !371
  %26 = load %struct.Matrix*, %struct.Matrix** %b, align 8, !dbg !371
  %data17 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %26, i32 0, i32 0, !dbg !372
  %27 = load i64*, i64** %data17, align 8, !dbg !372
  %arrayidx18 = getelementptr inbounds i64, i64* %27, i64 %idxprom16, !dbg !371
  %28 = load i64, i64* %arrayidx18, align 8, !dbg !371
  %29 = load i32, i32* %max, align 4, !dbg !373
  %sub19 = sub nsw i32 %29, 1, !dbg !374
  %30 = load i32, i32* %max, align 4, !dbg !375
  %31 = load i32, i32* %max, align 4, !dbg !376
  %sub20 = sub nsw i32 %31, 1, !dbg !377
  %32 = load i32, i32* %max, align 4, !dbg !378
  %sub21 = sub nsw i32 %32, 1, !dbg !379
  %33 = load i32, i32* %max, align 4, !dbg !380
  %mul22 = mul nsw i32 %sub21, %33, !dbg !381
  %34 = load i32, i32* %max, align 4, !dbg !382
  %add23 = add nsw i32 %mul22, %34, !dbg !383
  %sub24 = sub nsw i32 %add23, 1, !dbg !384
  %idxprom25 = sext i32 %sub24 to i64, !dbg !385
  %35 = load %struct.Matrix*, %struct.Matrix** %c, align 8, !dbg !385
  %data26 = getelementptr inbounds %struct.Matrix, %struct.Matrix* %35, i32 0, i32 0, !dbg !386
  %36 = load i64*, i64** %data26, align 8, !dbg !386
  %arrayidx27 = getelementptr inbounds i64, i64* %36, i64 %idxprom25, !dbg !385
  %37 = load i64, i64* %arrayidx27, align 8, !dbg !385
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i32 0, i32 0), i32 %sub, i32 %12, i32 %sub6, i64 %19, i32 %sub10, i32 %21, i32 %sub11, i64 %28, i32 %sub19, i32 %30, i32 %sub20, i64 %37), !dbg !387
  ret i32 0, !dbg !388
}

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #2

declare i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!27, !28}
!llvm.ident = !{!29}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, subprograms: !6)
!1 = !DIFile(filename: "MatrixMult.c", directory: "/home/sam/workspace/WhileyOpenCL/polly/MatrixMult/impl/handwritten2")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64, align: 64)
!5 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!6 = !{!7, !18, !21}
!7 = distinct !DISubprogram(name: "init", scope: !1, file: !1, line: 12, type: !8, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !16, !16}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64, align: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "Matrix", file: !1, line: 7, baseType: !12)
!12 = !DICompositeType(tag: DW_TAG_structure_type, file: !1, line: 3, size: 128, align: 64, elements: !13)
!13 = !{!14, !15, !17}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !12, file: !1, line: 4, baseType: !4, size: 64, align: 64)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !12, file: !1, line: 5, baseType: !16, size: 32, align: 32, offset: 64)
!16 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !12, file: !1, line: 6, baseType: !16, size: 32, align: 32, offset: 96)
!18 = distinct !DISubprogram(name: "matmult", scope: !1, file: !1, line: 38, type: !19, isLocal: false, isDefinition: true, scopeLine: 38, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!10, !10, !10}
!21 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 73, type: !22, isLocal: false, isDefinition: true, scopeLine: 73, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!22 = !DISubroutineType(types: !23)
!23 = !{!16, !16, !24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64, align: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64, align: 64)
!26 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!27 = !{i32 2, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{!"clang version 3.9.0 (http://llvm.org/git/clang.git cf7bc8edf8cccb1b5de656c403cb55ad44132e98) (http://llvm.org/git/llvm.git 22706dc4c03305692f494d0e42a6de1050d0ec62)"}
!30 = !DILocalVariable(name: "width", arg: 1, scope: !7, file: !1, line: 12, type: !16)
!31 = !DIExpression()
!32 = !DILocation(line: 12, column: 18, scope: !7)
!33 = !DILocalVariable(name: "height", arg: 2, scope: !7, file: !1, line: 12, type: !16)
!34 = !DILocation(line: 12, column: 29, scope: !7)
!35 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 14, type: !16)
!36 = !DILocation(line: 14, column: 9, scope: !7)
!37 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 14, type: !16)
!38 = !DILocation(line: 14, column: 12, scope: !7)
!39 = !DILocalVariable(name: "data", scope: !7, file: !1, line: 16, type: !4)
!40 = !DILocation(line: 16, column: 16, scope: !7)
!41 = !DILocation(line: 16, column: 42, scope: !7)
!42 = !DILocation(line: 16, column: 49, scope: !7)
!43 = !DILocation(line: 16, column: 48, scope: !7)
!44 = !DILocation(line: 16, column: 54, scope: !7)
!45 = !DILocation(line: 16, column: 35, scope: !7)
!46 = !DILocation(line: 16, column: 23, scope: !7)
!47 = !DILocation(line: 18, column: 11, scope: !48)
!48 = distinct !DILexicalBlock(scope: !7, file: !1, line: 18, column: 5)
!49 = !DILocation(line: 18, column: 10, scope: !48)
!50 = !DILocation(line: 18, column: 15, scope: !51)
!51 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 1)
!52 = distinct !DILexicalBlock(scope: !48, file: !1, line: 18, column: 5)
!53 = !DILocation(line: 18, column: 17, scope: !51)
!54 = !DILocation(line: 18, column: 16, scope: !51)
!55 = !DILocation(line: 18, column: 5, scope: !51)
!56 = !DILocation(line: 19, column: 15, scope: !57)
!57 = distinct !DILexicalBlock(scope: !58, file: !1, line: 19, column: 9)
!58 = distinct !DILexicalBlock(scope: !52, file: !1, line: 18, column: 30)
!59 = !DILocation(line: 19, column: 14, scope: !57)
!60 = !DILocation(line: 19, column: 19, scope: !61)
!61 = !DILexicalBlockFile(scope: !62, file: !1, discriminator: 1)
!62 = distinct !DILexicalBlock(scope: !57, file: !1, line: 19, column: 9)
!63 = !DILocation(line: 19, column: 21, scope: !61)
!64 = !DILocation(line: 19, column: 20, scope: !61)
!65 = !DILocation(line: 19, column: 9, scope: !61)
!66 = !DILocation(line: 20, column: 18, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !1, line: 19, column: 33)
!68 = !DILocation(line: 20, column: 20, scope: !67)
!69 = !DILocation(line: 20, column: 19, scope: !67)
!70 = !DILocation(line: 20, column: 26, scope: !67)
!71 = !DILocation(line: 20, column: 25, scope: !67)
!72 = !DILocation(line: 20, column: 13, scope: !67)
!73 = !DILocation(line: 20, column: 29, scope: !67)
!74 = !DILocation(line: 21, column: 9, scope: !67)
!75 = !DILocation(line: 19, column: 29, scope: !76)
!76 = !DILexicalBlockFile(scope: !62, file: !1, discriminator: 2)
!77 = !DILocation(line: 19, column: 9, scope: !76)
!78 = !DILocation(line: 22, column: 5, scope: !58)
!79 = !DILocation(line: 18, column: 26, scope: !80)
!80 = !DILexicalBlockFile(scope: !52, file: !1, discriminator: 2)
!81 = !DILocation(line: 18, column: 5, scope: !80)
!82 = !DILocation(line: 24, column: 11, scope: !83)
!83 = distinct !DILexicalBlock(scope: !7, file: !1, line: 24, column: 5)
!84 = !DILocation(line: 24, column: 10, scope: !83)
!85 = !DILocation(line: 24, column: 15, scope: !86)
!86 = !DILexicalBlockFile(scope: !87, file: !1, discriminator: 1)
!87 = distinct !DILexicalBlock(scope: !83, file: !1, line: 24, column: 5)
!88 = !DILocation(line: 24, column: 17, scope: !86)
!89 = !DILocation(line: 24, column: 16, scope: !86)
!90 = !DILocation(line: 24, column: 5, scope: !86)
!91 = !DILocation(line: 25, column: 15, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !1, line: 25, column: 9)
!93 = distinct !DILexicalBlock(scope: !87, file: !1, line: 24, column: 30)
!94 = !DILocation(line: 25, column: 14, scope: !92)
!95 = !DILocation(line: 25, column: 19, scope: !96)
!96 = !DILexicalBlockFile(scope: !97, file: !1, discriminator: 1)
!97 = distinct !DILexicalBlock(scope: !92, file: !1, line: 25, column: 9)
!98 = !DILocation(line: 25, column: 21, scope: !96)
!99 = !DILocation(line: 25, column: 20, scope: !96)
!100 = !DILocation(line: 25, column: 9, scope: !96)
!101 = !DILocation(line: 26, column: 36, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !1, line: 25, column: 33)
!103 = !DILocation(line: 26, column: 38, scope: !102)
!104 = !DILocation(line: 26, column: 37, scope: !102)
!105 = !DILocation(line: 26, column: 44, scope: !102)
!106 = !DILocation(line: 26, column: 43, scope: !102)
!107 = !DILocation(line: 26, column: 31, scope: !102)
!108 = !DILocation(line: 26, column: 49, scope: !102)
!109 = !DILocation(line: 26, column: 47, scope: !102)
!110 = !DILocation(line: 26, column: 18, scope: !102)
!111 = !DILocation(line: 26, column: 20, scope: !102)
!112 = !DILocation(line: 26, column: 19, scope: !102)
!113 = !DILocation(line: 26, column: 26, scope: !102)
!114 = !DILocation(line: 26, column: 25, scope: !102)
!115 = !DILocation(line: 26, column: 13, scope: !102)
!116 = !DILocation(line: 26, column: 29, scope: !102)
!117 = !DILocation(line: 27, column: 9, scope: !102)
!118 = !DILocation(line: 25, column: 29, scope: !119)
!119 = !DILexicalBlockFile(scope: !97, file: !1, discriminator: 2)
!120 = !DILocation(line: 25, column: 9, scope: !119)
!121 = !DILocation(line: 28, column: 5, scope: !93)
!122 = !DILocation(line: 24, column: 26, scope: !123)
!123 = !DILexicalBlockFile(scope: !87, file: !1, discriminator: 2)
!124 = !DILocation(line: 24, column: 5, scope: !123)
!125 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 30, type: !10)
!126 = !DILocation(line: 30, column: 13, scope: !7)
!127 = !DILocation(line: 30, column: 17, scope: !7)
!128 = !DILocation(line: 31, column: 15, scope: !7)
!129 = !DILocation(line: 31, column: 5, scope: !7)
!130 = !DILocation(line: 31, column: 8, scope: !7)
!131 = !DILocation(line: 31, column: 13, scope: !7)
!132 = !DILocation(line: 32, column: 16, scope: !7)
!133 = !DILocation(line: 32, column: 5, scope: !7)
!134 = !DILocation(line: 32, column: 8, scope: !7)
!135 = !DILocation(line: 32, column: 14, scope: !7)
!136 = !DILocation(line: 33, column: 17, scope: !7)
!137 = !DILocation(line: 33, column: 5, scope: !7)
!138 = !DILocation(line: 33, column: 8, scope: !7)
!139 = !DILocation(line: 33, column: 15, scope: !7)
!140 = !DILocation(line: 35, column: 12, scope: !7)
!141 = !DILocation(line: 35, column: 5, scope: !7)
!142 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 38, type: !10)
!143 = !DILocation(line: 38, column: 25, scope: !18)
!144 = !DILocalVariable(name: "b", arg: 2, scope: !18, file: !1, line: 38, type: !10)
!145 = !DILocation(line: 38, column: 36, scope: !18)
!146 = !DILocalVariable(name: "i", scope: !18, file: !1, line: 39, type: !16)
!147 = !DILocation(line: 39, column: 6, scope: !18)
!148 = !DILocalVariable(name: "j", scope: !18, file: !1, line: 39, type: !16)
!149 = !DILocation(line: 39, column: 9, scope: !18)
!150 = !DILocalVariable(name: "k", scope: !18, file: !1, line: 39, type: !16)
!151 = !DILocation(line: 39, column: 12, scope: !18)
!152 = !DILocalVariable(name: "width", scope: !18, file: !1, line: 40, type: !16)
!153 = !DILocation(line: 40, column: 9, scope: !18)
!154 = !DILocation(line: 40, column: 17, scope: !18)
!155 = !DILocation(line: 40, column: 20, scope: !18)
!156 = !DILocalVariable(name: "height", scope: !18, file: !1, line: 41, type: !16)
!157 = !DILocation(line: 41, column: 9, scope: !18)
!158 = !DILocation(line: 41, column: 18, scope: !18)
!159 = !DILocation(line: 41, column: 21, scope: !18)
!160 = !DILocalVariable(name: "a_data", scope: !18, file: !1, line: 42, type: !4)
!161 = !DILocation(line: 42, column: 16, scope: !18)
!162 = !DILocation(line: 42, column: 25, scope: !18)
!163 = !DILocation(line: 42, column: 28, scope: !18)
!164 = !DILocalVariable(name: "b_data", scope: !18, file: !1, line: 43, type: !4)
!165 = !DILocation(line: 43, column: 16, scope: !18)
!166 = !DILocation(line: 43, column: 25, scope: !18)
!167 = !DILocation(line: 43, column: 28, scope: !18)
!168 = !DILocalVariable(name: "data", scope: !18, file: !1, line: 46, type: !4)
!169 = !DILocation(line: 46, column: 13, scope: !18)
!170 = !DILocation(line: 46, column: 39, scope: !18)
!171 = !DILocation(line: 46, column: 46, scope: !18)
!172 = !DILocation(line: 46, column: 45, scope: !18)
!173 = !DILocation(line: 46, column: 51, scope: !18)
!174 = !DILocation(line: 46, column: 32, scope: !18)
!175 = !DILocation(line: 46, column: 20, scope: !18)
!176 = !DILocalVariable(name: "b_t", scope: !18, file: !1, line: 47, type: !4)
!177 = !DILocation(line: 47, column: 16, scope: !18)
!178 = !DILocation(line: 47, column: 29, scope: !18)
!179 = !DILocation(line: 47, column: 35, scope: !18)
!180 = !DILocation(line: 47, column: 34, scope: !18)
!181 = !DILocation(line: 47, column: 41, scope: !18)
!182 = !DILocation(line: 47, column: 22, scope: !18)
!183 = !DILocation(line: 49, column: 9, scope: !184)
!184 = distinct !DILexicalBlock(scope: !18, file: !1, line: 49, column: 2)
!185 = !DILocation(line: 49, column: 7, scope: !184)
!186 = !DILocation(line: 49, column: 14, scope: !187)
!187 = !DILexicalBlockFile(scope: !188, file: !1, discriminator: 1)
!188 = distinct !DILexicalBlock(scope: !184, file: !1, line: 49, column: 2)
!189 = !DILocation(line: 49, column: 18, scope: !187)
!190 = !DILocation(line: 49, column: 16, scope: !187)
!191 = !DILocation(line: 49, column: 2, scope: !187)
!192 = !DILocation(line: 51, column: 10, scope: !193)
!193 = distinct !DILexicalBlock(scope: !194, file: !1, line: 51, column: 3)
!194 = distinct !DILexicalBlock(scope: !188, file: !1, line: 49, column: 31)
!195 = !DILocation(line: 51, column: 8, scope: !193)
!196 = !DILocation(line: 51, column: 15, scope: !197)
!197 = !DILexicalBlockFile(scope: !198, file: !1, discriminator: 1)
!198 = distinct !DILexicalBlock(scope: !193, file: !1, line: 51, column: 3)
!199 = !DILocation(line: 51, column: 19, scope: !197)
!200 = !DILocation(line: 51, column: 17, scope: !197)
!201 = !DILocation(line: 51, column: 3, scope: !197)
!202 = !DILocation(line: 52, column: 28, scope: !203)
!203 = distinct !DILexicalBlock(scope: !198, file: !1, line: 51, column: 31)
!204 = !DILocation(line: 52, column: 30, scope: !203)
!205 = !DILocation(line: 52, column: 29, scope: !203)
!206 = !DILocation(line: 52, column: 36, scope: !203)
!207 = !DILocation(line: 52, column: 35, scope: !203)
!208 = !DILocation(line: 52, column: 21, scope: !203)
!209 = !DILocation(line: 52, column: 8, scope: !203)
!210 = !DILocation(line: 52, column: 10, scope: !203)
!211 = !DILocation(line: 52, column: 9, scope: !203)
!212 = !DILocation(line: 52, column: 16, scope: !203)
!213 = !DILocation(line: 52, column: 15, scope: !203)
!214 = !DILocation(line: 52, column: 4, scope: !203)
!215 = !DILocation(line: 52, column: 19, scope: !203)
!216 = !DILocation(line: 53, column: 3, scope: !203)
!217 = !DILocation(line: 51, column: 27, scope: !218)
!218 = !DILexicalBlockFile(scope: !198, file: !1, discriminator: 2)
!219 = !DILocation(line: 51, column: 3, scope: !218)
!220 = !DILocation(line: 54, column: 2, scope: !194)
!221 = !DILocation(line: 49, column: 27, scope: !222)
!222 = !DILexicalBlockFile(scope: !188, file: !1, discriminator: 2)
!223 = !DILocation(line: 49, column: 2, scope: !222)
!224 = !DILocation(line: 55, column: 9, scope: !225)
!225 = distinct !DILexicalBlock(scope: !18, file: !1, line: 55, column: 2)
!226 = !DILocation(line: 55, column: 7, scope: !225)
!227 = !DILocation(line: 55, column: 14, scope: !228)
!228 = !DILexicalBlockFile(scope: !229, file: !1, discriminator: 1)
!229 = distinct !DILexicalBlock(scope: !225, file: !1, line: 55, column: 2)
!230 = !DILocation(line: 55, column: 18, scope: !228)
!231 = !DILocation(line: 55, column: 16, scope: !228)
!232 = !DILocation(line: 55, column: 2, scope: !228)
!233 = !DILocation(line: 57, column: 10, scope: !234)
!234 = distinct !DILexicalBlock(scope: !235, file: !1, line: 57, column: 3)
!235 = distinct !DILexicalBlock(scope: !229, file: !1, line: 55, column: 31)
!236 = !DILocation(line: 57, column: 8, scope: !234)
!237 = !DILocation(line: 57, column: 15, scope: !238)
!238 = !DILexicalBlockFile(scope: !239, file: !1, discriminator: 1)
!239 = distinct !DILexicalBlock(scope: !234, file: !1, line: 57, column: 3)
!240 = !DILocation(line: 57, column: 19, scope: !238)
!241 = !DILocation(line: 57, column: 17, scope: !238)
!242 = !DILocation(line: 57, column: 3, scope: !238)
!243 = !DILocation(line: 58, column: 9, scope: !244)
!244 = distinct !DILexicalBlock(scope: !239, file: !1, line: 57, column: 31)
!245 = !DILocation(line: 58, column: 11, scope: !244)
!246 = !DILocation(line: 58, column: 10, scope: !244)
!247 = !DILocation(line: 58, column: 17, scope: !244)
!248 = !DILocation(line: 58, column: 16, scope: !244)
!249 = !DILocation(line: 58, column: 4, scope: !244)
!250 = !DILocation(line: 58, column: 20, scope: !244)
!251 = !DILocation(line: 59, column: 9, scope: !252)
!252 = distinct !DILexicalBlock(scope: !244, file: !1, line: 59, column: 4)
!253 = !DILocation(line: 59, column: 8, scope: !252)
!254 = !DILocation(line: 59, column: 12, scope: !255)
!255 = !DILexicalBlockFile(scope: !256, file: !1, discriminator: 1)
!256 = distinct !DILexicalBlock(scope: !252, file: !1, line: 59, column: 4)
!257 = !DILocation(line: 59, column: 14, scope: !255)
!258 = !DILocation(line: 59, column: 13, scope: !255)
!259 = !DILocation(line: 59, column: 4, scope: !255)
!260 = !DILocation(line: 60, column: 28, scope: !261)
!261 = distinct !DILexicalBlock(scope: !256, file: !1, line: 59, column: 24)
!262 = !DILocation(line: 60, column: 30, scope: !261)
!263 = !DILocation(line: 60, column: 29, scope: !261)
!264 = !DILocation(line: 60, column: 36, scope: !261)
!265 = !DILocation(line: 60, column: 35, scope: !261)
!266 = !DILocation(line: 60, column: 23, scope: !261)
!267 = !DILocation(line: 60, column: 48, scope: !261)
!268 = !DILocation(line: 60, column: 50, scope: !261)
!269 = !DILocation(line: 60, column: 49, scope: !261)
!270 = !DILocation(line: 60, column: 56, scope: !261)
!271 = !DILocation(line: 60, column: 55, scope: !261)
!272 = !DILocation(line: 60, column: 41, scope: !261)
!273 = !DILocation(line: 60, column: 63, scope: !261)
!274 = !DILocation(line: 60, column: 65, scope: !261)
!275 = !DILocation(line: 60, column: 64, scope: !261)
!276 = !DILocation(line: 60, column: 71, scope: !261)
!277 = !DILocation(line: 60, column: 70, scope: !261)
!278 = !DILocation(line: 60, column: 59, scope: !261)
!279 = !DILocation(line: 60, column: 58, scope: !261)
!280 = !DILocation(line: 60, column: 39, scope: !261)
!281 = !DILocation(line: 60, column: 10, scope: !261)
!282 = !DILocation(line: 60, column: 12, scope: !261)
!283 = !DILocation(line: 60, column: 11, scope: !261)
!284 = !DILocation(line: 60, column: 18, scope: !261)
!285 = !DILocation(line: 60, column: 17, scope: !261)
!286 = !DILocation(line: 60, column: 5, scope: !261)
!287 = !DILocation(line: 60, column: 21, scope: !261)
!288 = !DILocation(line: 61, column: 4, scope: !261)
!289 = !DILocation(line: 59, column: 21, scope: !290)
!290 = !DILexicalBlockFile(scope: !256, file: !1, discriminator: 2)
!291 = !DILocation(line: 59, column: 4, scope: !290)
!292 = !DILocation(line: 62, column: 3, scope: !244)
!293 = !DILocation(line: 57, column: 27, scope: !294)
!294 = !DILexicalBlockFile(scope: !239, file: !1, discriminator: 2)
!295 = !DILocation(line: 57, column: 3, scope: !294)
!296 = !DILocation(line: 63, column: 2, scope: !235)
!297 = !DILocation(line: 55, column: 27, scope: !298)
!298 = !DILexicalBlockFile(scope: !229, file: !1, discriminator: 2)
!299 = !DILocation(line: 55, column: 2, scope: !298)
!300 = !DILocalVariable(name: "m", scope: !18, file: !1, line: 66, type: !10)
!301 = !DILocation(line: 66, column: 13, scope: !18)
!302 = !DILocation(line: 66, column: 17, scope: !18)
!303 = !DILocation(line: 67, column: 16, scope: !18)
!304 = !DILocation(line: 67, column: 5, scope: !18)
!305 = !DILocation(line: 67, column: 8, scope: !18)
!306 = !DILocation(line: 67, column: 14, scope: !18)
!307 = !DILocation(line: 68, column: 17, scope: !18)
!308 = !DILocation(line: 68, column: 5, scope: !18)
!309 = !DILocation(line: 68, column: 8, scope: !18)
!310 = !DILocation(line: 68, column: 15, scope: !18)
!311 = !DILocation(line: 69, column: 15, scope: !18)
!312 = !DILocation(line: 69, column: 5, scope: !18)
!313 = !DILocation(line: 69, column: 8, scope: !18)
!314 = !DILocation(line: 69, column: 13, scope: !18)
!315 = !DILocation(line: 70, column: 12, scope: !18)
!316 = !DILocation(line: 70, column: 5, scope: !18)
!317 = !DILocalVariable(name: "argc", arg: 1, scope: !21, file: !1, line: 73, type: !16)
!318 = !DILocation(line: 73, column: 14, scope: !21)
!319 = !DILocalVariable(name: "args", arg: 2, scope: !21, file: !1, line: 73, type: !24)
!320 = !DILocation(line: 73, column: 27, scope: !21)
!321 = !DILocalVariable(name: "max", scope: !21, file: !1, line: 75, type: !16)
!322 = !DILocation(line: 75, column: 9, scope: !21)
!323 = !DILocation(line: 76, column: 12, scope: !21)
!324 = !DILocation(line: 76, column: 5, scope: !21)
!325 = !DILocation(line: 77, column: 24, scope: !21)
!326 = !DILocation(line: 77, column: 5, scope: !21)
!327 = !DILocalVariable(name: "a", scope: !21, file: !1, line: 79, type: !10)
!328 = !DILocation(line: 79, column: 13, scope: !21)
!329 = !DILocation(line: 79, column: 22, scope: !21)
!330 = !DILocation(line: 79, column: 27, scope: !21)
!331 = !DILocation(line: 79, column: 17, scope: !21)
!332 = !DILocalVariable(name: "b", scope: !21, file: !1, line: 80, type: !10)
!333 = !DILocation(line: 80, column: 13, scope: !21)
!334 = !DILocation(line: 80, column: 22, scope: !21)
!335 = !DILocation(line: 80, column: 27, scope: !21)
!336 = !DILocation(line: 80, column: 17, scope: !21)
!337 = !DILocalVariable(name: "c", scope: !21, file: !1, line: 82, type: !10)
!338 = !DILocation(line: 82, column: 13, scope: !21)
!339 = !DILocation(line: 82, column: 25, scope: !21)
!340 = !DILocation(line: 82, column: 28, scope: !21)
!341 = !DILocation(line: 82, column: 17, scope: !21)
!342 = !DILocation(line: 87, column: 48, scope: !21)
!343 = !DILocation(line: 87, column: 53, scope: !21)
!344 = !DILocation(line: 87, column: 5, scope: !21)
!345 = !DILocation(line: 89, column: 9, scope: !21)
!346 = !DILocation(line: 89, column: 12, scope: !21)
!347 = !DILocation(line: 89, column: 16, scope: !21)
!348 = !DILocation(line: 89, column: 21, scope: !21)
!349 = !DILocation(line: 89, column: 24, scope: !21)
!350 = !DILocation(line: 89, column: 37, scope: !21)
!351 = !DILocation(line: 89, column: 40, scope: !21)
!352 = !DILocation(line: 89, column: 44, scope: !21)
!353 = !DILocation(line: 89, column: 43, scope: !21)
!354 = !DILocation(line: 89, column: 48, scope: !21)
!355 = !DILocation(line: 89, column: 47, scope: !21)
!356 = !DILocation(line: 89, column: 51, scope: !21)
!357 = !DILocation(line: 89, column: 28, scope: !21)
!358 = !DILocation(line: 89, column: 31, scope: !21)
!359 = !DILocation(line: 90, column: 9, scope: !21)
!360 = !DILocation(line: 90, column: 12, scope: !21)
!361 = !DILocation(line: 90, column: 16, scope: !21)
!362 = !DILocation(line: 90, column: 21, scope: !21)
!363 = !DILocation(line: 90, column: 24, scope: !21)
!364 = !DILocation(line: 90, column: 37, scope: !21)
!365 = !DILocation(line: 90, column: 40, scope: !21)
!366 = !DILocation(line: 90, column: 44, scope: !21)
!367 = !DILocation(line: 90, column: 43, scope: !21)
!368 = !DILocation(line: 90, column: 48, scope: !21)
!369 = !DILocation(line: 90, column: 47, scope: !21)
!370 = !DILocation(line: 90, column: 51, scope: !21)
!371 = !DILocation(line: 90, column: 28, scope: !21)
!372 = !DILocation(line: 90, column: 31, scope: !21)
!373 = !DILocation(line: 91, column: 9, scope: !21)
!374 = !DILocation(line: 91, column: 12, scope: !21)
!375 = !DILocation(line: 91, column: 16, scope: !21)
!376 = !DILocation(line: 91, column: 21, scope: !21)
!377 = !DILocation(line: 91, column: 24, scope: !21)
!378 = !DILocation(line: 91, column: 37, scope: !21)
!379 = !DILocation(line: 91, column: 40, scope: !21)
!380 = !DILocation(line: 91, column: 44, scope: !21)
!381 = !DILocation(line: 91, column: 43, scope: !21)
!382 = !DILocation(line: 91, column: 48, scope: !21)
!383 = !DILocation(line: 91, column: 47, scope: !21)
!384 = !DILocation(line: 91, column: 51, scope: !21)
!385 = !DILocation(line: 91, column: 28, scope: !21)
!386 = !DILocation(line: 91, column: 31, scope: !21)
!387 = !DILocation(line: 88, column: 5, scope: !21)
!388 = !DILocation(line: 93, column: 5, scope: !21)
